module github.com/redhat-appstudio/integration-service

go 1.20

require (
	github.com/agiledragon/gomonkey/v2 v2.11.0
	github.com/bradleyfalzon/ghinstallation/v2 v2.9.0
	github.com/go-logr/logr v1.4.1
	github.com/google/go-containerregistry v0.19.0
	github.com/google/go-github/v45 v45.2.0
	github.com/onsi/ginkgo/v2 v2.16.0
	github.com/onsi/gomega v1.31.1
	github.com/openshift-pipelines/pipelines-as-code v0.17.2
	github.com/prometheus/client_golang v1.19.0
	github.com/redhat-appstudio/application-api v0.0.0-20231025105224-2790bb451725
	github.com/redhat-appstudio/operator-toolkit v0.0.0-20231201124606-2087182322ae
	github.com/redhat-appstudio/release-service v0.0.0-20231107140301-56ac66b56719
	github.com/santhosh-tekuri/jsonschema/v5 v5.3.1
	github.com/tektoncd/pipeline v0.57.0
	github.com/tonglil/buflogr v1.1.1
	github.com/xanzy/go-gitlab v0.99.0
	go.uber.org/mock v0.4.0
	go.uber.org/zap v1.27.0
	golang.org/x/oauth2 v0.18.0
	k8s.io/api v0.29.2
	k8s.io/apimachinery v0.29.2
	k8s.io/client-go v0.29.2
	k8s.io/klog/v2 v2.120.1
	k8s.io/utils v0.0.0-20230726121419-3b25d923346b
	knative.dev/pkg v0.0.0-20231023150739-56bfe0dd9626
	sigs.k8s.io/controller-runtime v0.17.2
)

require (
	contrib.go.opencensus.io/exporter/ocagent v0.7.1-0.20200907061046-05415f1de66d // indirect
	contrib.go.opencensus.io/exporter/prometheus v0.4.2 // indirect
	github.com/antlr4-go/antlr/v4 v4.13.0 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/blendle/zapdriver v1.3.1 // indirect
	github.com/census-instrumentation/opencensus-proto v0.4.1 // indirect
	github.com/cespare/xxhash/v2 v2.2.0 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/emicklei/go-restful/v3 v3.11.0 // indirect
	github.com/evanphx/json-patch v5.6.0+incompatible // indirect
	github.com/evanphx/json-patch/v5 v5.8.0 // indirect
	github.com/fsnotify/fsnotify v1.7.0 // indirect
	github.com/go-kit/log v0.2.1 // indirect
	github.com/go-logfmt/logfmt v0.5.1 // indirect
	github.com/go-logr/zapr v1.3.0 // indirect
	github.com/go-openapi/jsonpointer v0.19.6 // indirect
	github.com/go-openapi/jsonreference v0.20.2 // indirect
	github.com/go-openapi/swag v0.22.3 // indirect
	github.com/go-task/slim-sprig v0.0.0-20230315185526-52ccab3ef572 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/golang-jwt/jwt/v4 v4.5.0 // indirect
	github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da // indirect
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/google/cel-go v0.20.0 // indirect
	github.com/google/gnostic-models v0.6.8 // indirect
	github.com/google/go-cmp v0.6.0 // indirect
	github.com/google/go-github/v57 v57.0.0 // indirect
	github.com/google/go-querystring v1.1.0 // indirect
	github.com/google/gofuzz v1.2.0 // indirect
	github.com/google/pprof v0.0.0-20230510103437-eeec1cb781c3 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.16.0 // indirect
	github.com/hashicorp/go-cleanhttp v0.5.2 // indirect
	github.com/hashicorp/go-retryablehttp v0.7.2 // indirect
	github.com/imdario/mergo v0.3.13 // indirect
	github.com/josharian/intern v1.0.0 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/mailru/easyjson v0.7.7 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/opencontainers/go-digest v1.0.0 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/prometheus/client_model v0.5.0 // indirect
	github.com/prometheus/common v0.48.0 // indirect
	github.com/prometheus/procfs v0.12.0 // indirect
	github.com/prometheus/statsd_exporter v0.23.0 // indirect
	github.com/spf13/pflag v1.0.6-0.20210604193023-d5e0c0615ace // indirect
	github.com/stoewer/go-strcase v1.2.1 // indirect
	go.opencensus.io v0.24.0 // indirect
	go.uber.org/atomic v1.10.0 // indirect
	go.uber.org/multierr v1.11.0 // indirect
	golang.org/x/crypto v0.21.0 // indirect
	golang.org/x/exp v0.0.0-20230515195305-f3d0a9c9a5cc // indirect
	golang.org/x/net v0.22.0 // indirect
	golang.org/x/sync v0.6.0 // indirect
	golang.org/x/sys v0.18.0 // indirect
	golang.org/x/term v0.18.0 // indirect
	golang.org/x/text v0.14.0 // indirect
	golang.org/x/time v0.5.0 // indirect
	golang.org/x/tools v0.17.0 // indirect
	gomodules.xyz/jsonpatch/v2 v2.4.0 // indirect
	google.golang.org/api v0.156.0 // indirect
	google.golang.org/appengine v1.6.8 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20231212172506-995d672761c0 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20240102182953-50ed04b92917 // indirect
	google.golang.org/grpc v1.61.1 // indirect
	google.golang.org/protobuf v1.32.0 // indirect
	gopkg.in/inf.v0 v0.9.1 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
	k8s.io/apiextensions-apiserver v0.29.0 // indirect
	k8s.io/component-base v0.29.0 // indirect
	k8s.io/kube-openapi v0.0.0-20231010175941-2dd684a91f00 // indirect
	sigs.k8s.io/json v0.0.0-20221116044647-bc3834ca7abd // indirect
	sigs.k8s.io/structured-merge-diff/v4 v4.4.1 // indirect
	sigs.k8s.io/yaml v1.4.0 // indirect
)
