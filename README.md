
不同的架构下

1. arm64 M2的Mac bookAir编译后运行测试，
2. amd64 Macbook下拉 镜像测试

make push

```bash
docker run --rm -p 8080:8080 wdxxl/http-echo:v0.0.4
curl localhost:8080/echo
```