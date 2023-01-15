
all: cluster serving eventing

cluster:
	kind create cluster --name knative --config cluster.yaml

serving:
	kubectl apply -f ./knative/serving/serving-crds.yaml
	kubectl apply -f ./knative/serving/serving-core.yaml
	kubectl apply -f ./knative/serving/kourier.yaml
	kubectl apply -f ./knative/serving/serving-hpa.yaml

eventing:
	kubectl apply -f ./knative/eventing/eventing-crds.yaml
	kubectl apply -f ./knative/eventing/eventing-core.yaml

delete:
	kind delete cluster --name knative