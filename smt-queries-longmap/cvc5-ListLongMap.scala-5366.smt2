; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71794 () Bool)

(assert start!71794)

(declare-fun res!567419 () Bool)

(declare-fun e!465545 () Bool)

(assert (=> start!71794 (=> (not res!567419) (not e!465545))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-datatypes ((array!46704 0))(
  ( (array!46705 (arr!22386 (Array (_ BitVec 32) (_ BitVec 64))) (size!22807 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46704)

(assert (=> start!71794 (= res!567419 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22807 a!4227))))))

(assert (=> start!71794 e!465545))

(assert (=> start!71794 true))

(declare-fun array_inv!17833 (array!46704) Bool)

(assert (=> start!71794 (array_inv!17833 a!4227)))

(declare-fun b!834421 () Bool)

(declare-fun res!567414 () Bool)

(assert (=> b!834421 (=> (not res!567414) (not e!465545))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834421 (= res!567414 (validKeyInArray!0 k!2968))))

(declare-fun b!834422 () Bool)

(declare-fun res!567415 () Bool)

(assert (=> b!834422 (=> (not res!567415) (not e!465545))))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834422 (= res!567415 (and (bvslt (size!22807 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22807 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834423 () Bool)

(declare-datatypes ((Unit!28665 0))(
  ( (Unit!28666) )
))
(declare-fun e!465544 () Unit!28665)

(declare-fun lt!379058 () Unit!28665)

(assert (=> b!834423 (= e!465544 lt!379058)))

(declare-fun lt!379057 () Unit!28665)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46704 (_ BitVec 32) (_ BitVec 32)) Unit!28665)

(assert (=> b!834423 (= lt!379057 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36548 () (_ BitVec 32))

(declare-fun lt!379060 () (_ BitVec 32))

(assert (=> b!834423 (= call!36548 (bvadd #b00000000000000000000000000000001 lt!379060))))

(declare-fun lt!379056 () array!46704)

(assert (=> b!834423 (= lt!379058 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379056 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36547 () (_ BitVec 32))

(declare-fun lt!379052 () (_ BitVec 32))

(assert (=> b!834423 (= call!36547 (bvadd #b00000000000000000000000000000001 lt!379052))))

(declare-fun b!834424 () Bool)

(declare-fun e!465543 () Bool)

(declare-fun e!465546 () Bool)

(assert (=> b!834424 (= e!465543 e!465546)))

(declare-fun res!567418 () Bool)

(assert (=> b!834424 (=> (not res!567418) (not e!465546))))

(assert (=> b!834424 (= res!567418 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22807 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379053 () Unit!28665)

(assert (=> b!834424 (= lt!379053 e!465544)))

(declare-fun c!90899 () Bool)

(assert (=> b!834424 (= c!90899 (validKeyInArray!0 (select (arr!22386 a!4227) to!390)))))

(declare-fun b!834425 () Bool)

(declare-fun lt!379059 () Unit!28665)

(assert (=> b!834425 (= e!465544 lt!379059)))

(declare-fun lt!379051 () Unit!28665)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46704 (_ BitVec 32) (_ BitVec 32)) Unit!28665)

(assert (=> b!834425 (= lt!379051 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834425 (= call!36548 lt!379060)))

(assert (=> b!834425 (= lt!379059 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379056 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834425 (= call!36547 lt!379052)))

(declare-fun b!834426 () Bool)

(declare-fun res!567416 () Bool)

(assert (=> b!834426 (=> (not res!567416) (not e!465545))))

(assert (=> b!834426 (= res!567416 (not (validKeyInArray!0 (select (arr!22386 a!4227) i!1466))))))

(declare-fun bm!36544 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46704 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36544 (= call!36547 (arrayCountValidKeys!0 lt!379056 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834427 () Bool)

(assert (=> b!834427 (= e!465546 false)))

(declare-fun lt!379055 () (_ BitVec 32))

(assert (=> b!834427 (= lt!379055 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379054 () (_ BitVec 32))

(assert (=> b!834427 (= lt!379054 (arrayCountValidKeys!0 lt!379056 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834428 () Bool)

(assert (=> b!834428 (= e!465545 e!465543)))

(declare-fun res!567417 () Bool)

(assert (=> b!834428 (=> (not res!567417) (not e!465543))))

(assert (=> b!834428 (= res!567417 (and (= lt!379052 lt!379060) (not (= to!390 (size!22807 a!4227)))))))

(assert (=> b!834428 (= lt!379060 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834428 (= lt!379052 (arrayCountValidKeys!0 lt!379056 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834428 (= lt!379056 (array!46705 (store (arr!22386 a!4227) i!1466 k!2968) (size!22807 a!4227)))))

(declare-fun bm!36545 () Bool)

(assert (=> bm!36545 (= call!36548 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71794 res!567419) b!834426))

(assert (= (and b!834426 res!567416) b!834421))

(assert (= (and b!834421 res!567414) b!834422))

(assert (= (and b!834422 res!567415) b!834428))

(assert (= (and b!834428 res!567417) b!834424))

(assert (= (and b!834424 c!90899) b!834423))

(assert (= (and b!834424 (not c!90899)) b!834425))

(assert (= (or b!834423 b!834425) bm!36545))

(assert (= (or b!834423 b!834425) bm!36544))

(assert (= (and b!834424 res!567418) b!834427))

(declare-fun m!779407 () Bool)

(assert (=> bm!36544 m!779407))

(declare-fun m!779409 () Bool)

(assert (=> b!834423 m!779409))

(declare-fun m!779411 () Bool)

(assert (=> b!834423 m!779411))

(declare-fun m!779413 () Bool)

(assert (=> b!834426 m!779413))

(assert (=> b!834426 m!779413))

(declare-fun m!779415 () Bool)

(assert (=> b!834426 m!779415))

(declare-fun m!779417 () Bool)

(assert (=> b!834427 m!779417))

(assert (=> b!834427 m!779407))

(declare-fun m!779419 () Bool)

(assert (=> start!71794 m!779419))

(assert (=> bm!36545 m!779417))

(declare-fun m!779421 () Bool)

(assert (=> b!834428 m!779421))

(declare-fun m!779423 () Bool)

(assert (=> b!834428 m!779423))

(declare-fun m!779425 () Bool)

(assert (=> b!834428 m!779425))

(declare-fun m!779427 () Bool)

(assert (=> b!834424 m!779427))

(assert (=> b!834424 m!779427))

(declare-fun m!779429 () Bool)

(assert (=> b!834424 m!779429))

(declare-fun m!779431 () Bool)

(assert (=> b!834425 m!779431))

(declare-fun m!779433 () Bool)

(assert (=> b!834425 m!779433))

(declare-fun m!779435 () Bool)

(assert (=> b!834421 m!779435))

(push 1)

