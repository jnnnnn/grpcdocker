package main

import (
	"flag"
	"fmt"
	"log"
	"net"

	"google.golang.org/grpc"

	pb "jnnnnngrpc/routeguide_protos"
)

var (
	port = flag.Int("port", 10000, "The server port")
)

type RouteGuideServer struct {
	pb.UnimplementedRouteGuideServer
}

func newServer() *RouteGuideServer {
	s := &RouteGuideServer{}
	return s
}

func main() {
	flag.Parse()
	lis, err := net.Listen("tcp", fmt.Sprintf("localhost:%d", *port))
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	var opts []grpc.ServerOption
	grpcServer := grpc.NewServer(opts...)
	pb.RegisterRouteGuideServer(grpcServer, newServer())
	grpcServer.Serve(lis)
}
