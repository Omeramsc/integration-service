/*
Copyright 2022 Red Hat Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package status

import (
	"bytes"
	"fmt"
	"strings"
	"text/template"

	"github.com/redhat-appstudio/integration-service/helpers"
)

const commentTemplate = `### {{ .Title }}

{{ .Summary }}`

const summaryTemplate = `| Task | Duration | Test Suite | Status | Details |
| --- | --- | --- | --- | --- |
{{- range $tr := .TaskRuns }}
| {{ formatTaskName $tr }} | {{ $tr.GetDuration.String }} | {{ formatNamespace $tr }} | {{ formatStatus $tr }} | {{ formatDetails $tr }} |
{{- end }}

{{ formatFootnotes .TaskRuns }}`

// SummaryTemplateData holds the data necessary to construct a PipelineRun summary.
type SummaryTemplateData struct {
	TaskRuns []*helpers.TaskRun
}

// CommentTemplateData holds the data necessary to construct a PipelineRun comment.
type CommentTemplateData struct {
	Title   string
	Summary string
}

// FormatTestsSummary builds a markdown summary for a list of integration TaskRuns.
func FormatTestsSummary(taskRuns []*helpers.TaskRun) (string, error) {
	funcMap := template.FuncMap{
		"formatTaskName":  FormatTaskName,
		"formatNamespace": FormatNamespace,
		"formatStatus":    FormatStatus,
		"formatDetails":   FormatDetails,
		"formatFootnotes": FormatFootnotes,
	}
	buf := bytes.Buffer{}
	data := SummaryTemplateData{TaskRuns: taskRuns}
	t := template.Must(template.New("").Funcs(funcMap).Parse(summaryTemplate))
	if err := t.Execute(&buf, data); err != nil {
		return "", err
	}
	return buf.String(), nil
}

// FormatComment build a markdown comment with the details in text
func FormatComment(title, text string) (string, error) {
	buf := bytes.Buffer{}
	data := CommentTemplateData{Title: title, Summary: text}
	t := template.Must(template.New("").Parse(commentTemplate))
	if err := t.Execute(&buf, data); err != nil {
		return "", err
	}
	return buf.String(), nil
}

// FormatStatus accepts a TaskRun and returns a Markdown friendly representation of its overall status, if any.
func FormatStatus(taskRun *helpers.TaskRun) (string, error) {
	result, err := taskRun.GetTestResult()
	if err != nil {
		return "", err
	}

	if result == nil || result.TestOutput == nil {
		return "", nil
	}

	var emoji string
	switch result.TestOutput.Result {
	case helpers.AppStudioTestOutputSuccess:
		emoji = ":heavy_check_mark:"
	case helpers.AppStudioTestOutputFailure:
		emoji = ":x:"
	case helpers.AppStudioTestOutputWarning:
		emoji = ":warning:"
	case helpers.AppStudioTestOutputSkipped:
		emoji = ":white_check_mark:"
	case helpers.AppStudioTestOutputError:
		emoji = ":heavy_exclamation_mark:"
	default:
		emoji = ":question:"
	}

	return emoji + " " + result.TestOutput.Result, nil
}

// FormatTaskName accepts a TaskRun and returns a Markdown friendly representation of its name.
func FormatTaskName(taskRun *helpers.TaskRun) (string, error) {
	result, err := taskRun.GetTestResult()
	if err != nil {
		return "", err
	}

	name := taskRun.GetPipelineTaskName()

	if result == nil || result.TestOutput == nil {
		return name, nil
	}

	if result.TestOutput.Note == "" {
		return name, nil
	}

	return name + "[^" + name + "]", nil
}

// FormatNamespace accepts a TaskRun and returns a Markdown friendly representation of its test suite, if any.
func FormatNamespace(taskRun *helpers.TaskRun) (string, error) {
	result, err := taskRun.GetTestResult()
	if err != nil {
		return "", err
	}

	if result == nil || result.TestOutput == nil {
		return "", nil
	}

	return result.TestOutput.Namespace, nil
}

// FormatDetails accepts a TaskRun and returns a Markdown friendly representation of its detailed test results, if any.
func FormatDetails(taskRun *helpers.TaskRun) (string, error) {
	result, err := taskRun.GetTestResult()
	if err != nil {
		return "", err
	}

	if result == nil {
		return "", nil
	}

	if result.ValidationError != nil {
		return fmt.Sprintf("Invalid result: %s", result.ValidationError), nil
	}

	if result.TestOutput == nil {
		return "", nil
	}

	details := []string{}

	if result.TestOutput.Successes > 0 {
		details = append(details, fmt.Sprint(":heavy_check_mark: ", result.TestOutput.Successes, " success(es)"))
	}

	if result.TestOutput.Warnings > 0 {
		details = append(details, fmt.Sprint(":warning: ", result.TestOutput.Warnings, " warning(s)"))
	}

	if result.TestOutput.Failures > 0 {
		details = append(details, fmt.Sprint(":x: ", result.TestOutput.Failures, " failure(s)"))
	}

	return strings.Join(details, "<br>"), nil
}

// FormatResults accepts a list of TaskRuns and returns a Markdown friendly representation of their footnotes, if any.
func FormatFootnotes(taskRuns []*helpers.TaskRun) (string, error) {
	footnotes := []string{}
	for _, tr := range taskRuns {
		result, err := tr.GetTestResult()
		if err != nil {
			return "", err
		}

		if result == nil || result.TestOutput == nil {
			continue
		}

		if result.TestOutput.Note != "" {
			footnotes = append(footnotes, "[^"+tr.GetPipelineTaskName()+"]: "+result.TestOutput.Note)
		}
	}
	return strings.Join(footnotes, "\n"), nil
}
