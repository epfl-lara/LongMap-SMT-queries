; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71792 () Bool)

(assert start!71792)

(declare-fun b!834397 () Bool)

(declare-fun res!567399 () Bool)

(declare-fun e!465528 () Bool)

(assert (=> b!834397 (=> (not res!567399) (not e!465528))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834397 (= res!567399 (validKeyInArray!0 k!2968))))

(declare-fun b!834399 () Bool)

(declare-datatypes ((Unit!28663 0))(
  ( (Unit!28664) )
))
(declare-fun e!465531 () Unit!28663)

(declare-fun lt!379022 () Unit!28663)

(assert (=> b!834399 (= e!465531 lt!379022)))

(declare-datatypes ((array!46702 0))(
  ( (array!46703 (arr!22385 (Array (_ BitVec 32) (_ BitVec 64))) (size!22806 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46702)

(declare-fun lt!379024 () Unit!28663)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46702 (_ BitVec 32) (_ BitVec 32)) Unit!28663)

(assert (=> b!834399 (= lt!379024 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36542 () (_ BitVec 32))

(declare-fun lt!379021 () (_ BitVec 32))

(assert (=> b!834399 (= call!36542 (bvadd #b00000000000000000000000000000001 lt!379021))))

(declare-fun lt!379023 () array!46702)

(assert (=> b!834399 (= lt!379022 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379023 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36541 () (_ BitVec 32))

(declare-fun lt!379028 () (_ BitVec 32))

(assert (=> b!834399 (= call!36541 (bvadd #b00000000000000000000000000000001 lt!379028))))

(declare-fun b!834400 () Bool)

(declare-fun lt!379025 () Unit!28663)

(assert (=> b!834400 (= e!465531 lt!379025)))

(declare-fun lt!379029 () Unit!28663)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46702 (_ BitVec 32) (_ BitVec 32)) Unit!28663)

(assert (=> b!834400 (= lt!379029 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834400 (= call!36542 lt!379021)))

(assert (=> b!834400 (= lt!379025 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379023 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834400 (= call!36541 lt!379028)))

(declare-fun b!834401 () Bool)

(declare-fun e!465530 () Bool)

(assert (=> b!834401 (= e!465530 false)))

(declare-fun lt!379027 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46702 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834401 (= lt!379027 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379030 () (_ BitVec 32))

(assert (=> b!834401 (= lt!379030 (arrayCountValidKeys!0 lt!379023 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36538 () Bool)

(assert (=> bm!36538 (= call!36542 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36539 () Bool)

(assert (=> bm!36539 (= call!36541 (arrayCountValidKeys!0 lt!379023 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834402 () Bool)

(declare-fun e!465529 () Bool)

(assert (=> b!834402 (= e!465528 e!465529)))

(declare-fun res!567397 () Bool)

(assert (=> b!834402 (=> (not res!567397) (not e!465529))))

(assert (=> b!834402 (= res!567397 (and (= lt!379028 lt!379021) (not (= to!390 (size!22806 a!4227)))))))

(assert (=> b!834402 (= lt!379021 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834402 (= lt!379028 (arrayCountValidKeys!0 lt!379023 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834402 (= lt!379023 (array!46703 (store (arr!22385 a!4227) i!1466 k!2968) (size!22806 a!4227)))))

(declare-fun res!567401 () Bool)

(assert (=> start!71792 (=> (not res!567401) (not e!465528))))

(assert (=> start!71792 (= res!567401 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22806 a!4227))))))

(assert (=> start!71792 e!465528))

(assert (=> start!71792 true))

(declare-fun array_inv!17832 (array!46702) Bool)

(assert (=> start!71792 (array_inv!17832 a!4227)))

(declare-fun b!834398 () Bool)

(declare-fun res!567400 () Bool)

(assert (=> b!834398 (=> (not res!567400) (not e!465528))))

(assert (=> b!834398 (= res!567400 (and (bvslt (size!22806 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22806 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834403 () Bool)

(declare-fun res!567398 () Bool)

(assert (=> b!834403 (=> (not res!567398) (not e!465528))))

(assert (=> b!834403 (= res!567398 (not (validKeyInArray!0 (select (arr!22385 a!4227) i!1466))))))

(declare-fun b!834404 () Bool)

(assert (=> b!834404 (= e!465529 e!465530)))

(declare-fun res!567396 () Bool)

(assert (=> b!834404 (=> (not res!567396) (not e!465530))))

(assert (=> b!834404 (= res!567396 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22806 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379026 () Unit!28663)

(assert (=> b!834404 (= lt!379026 e!465531)))

(declare-fun c!90896 () Bool)

(assert (=> b!834404 (= c!90896 (validKeyInArray!0 (select (arr!22385 a!4227) to!390)))))

(assert (= (and start!71792 res!567401) b!834403))

(assert (= (and b!834403 res!567398) b!834397))

(assert (= (and b!834397 res!567399) b!834398))

(assert (= (and b!834398 res!567400) b!834402))

(assert (= (and b!834402 res!567397) b!834404))

(assert (= (and b!834404 c!90896) b!834399))

(assert (= (and b!834404 (not c!90896)) b!834400))

(assert (= (or b!834399 b!834400) bm!36538))

(assert (= (or b!834399 b!834400) bm!36539))

(assert (= (and b!834404 res!567396) b!834401))

(declare-fun m!779377 () Bool)

(assert (=> b!834404 m!779377))

(assert (=> b!834404 m!779377))

(declare-fun m!779379 () Bool)

(assert (=> b!834404 m!779379))

(declare-fun m!779381 () Bool)

(assert (=> b!834399 m!779381))

(declare-fun m!779383 () Bool)

(assert (=> b!834399 m!779383))

(declare-fun m!779385 () Bool)

(assert (=> b!834400 m!779385))

(declare-fun m!779387 () Bool)

(assert (=> b!834400 m!779387))

(declare-fun m!779389 () Bool)

(assert (=> b!834401 m!779389))

(declare-fun m!779391 () Bool)

(assert (=> b!834401 m!779391))

(assert (=> bm!36539 m!779391))

(declare-fun m!779393 () Bool)

(assert (=> start!71792 m!779393))

(declare-fun m!779395 () Bool)

(assert (=> b!834397 m!779395))

(declare-fun m!779397 () Bool)

(assert (=> b!834402 m!779397))

(declare-fun m!779399 () Bool)

(assert (=> b!834402 m!779399))

(declare-fun m!779401 () Bool)

(assert (=> b!834402 m!779401))

(assert (=> bm!36538 m!779389))

(declare-fun m!779403 () Bool)

(assert (=> b!834403 m!779403))

(assert (=> b!834403 m!779403))

(declare-fun m!779405 () Bool)

(assert (=> b!834403 m!779405))

(push 1)

(assert (not b!834404))

(assert (not b!834402))

(assert (not b!834400))

(assert (not b!834401))

(assert (not b!834397))

