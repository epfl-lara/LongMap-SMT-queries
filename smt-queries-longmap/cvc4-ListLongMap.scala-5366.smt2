; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71798 () Bool)

(assert start!71798)

(declare-fun b!834469 () Bool)

(declare-fun e!465573 () Bool)

(declare-fun e!465574 () Bool)

(assert (=> b!834469 (= e!465573 e!465574)))

(declare-fun res!567451 () Bool)

(assert (=> b!834469 (=> (not res!567451) (not e!465574))))

(declare-datatypes ((array!46708 0))(
  ( (array!46709 (arr!22388 (Array (_ BitVec 32) (_ BitVec 64))) (size!22809 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46708)

(declare-fun lt!379119 () (_ BitVec 32))

(declare-fun lt!379112 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!834469 (= res!567451 (and (= lt!379119 lt!379112) (not (= to!390 (size!22809 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46708 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834469 (= lt!379112 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379118 () array!46708)

(assert (=> b!834469 (= lt!379119 (arrayCountValidKeys!0 lt!379118 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834469 (= lt!379118 (array!46709 (store (arr!22388 a!4227) i!1466 k!2968) (size!22809 a!4227)))))

(declare-fun b!834470 () Bool)

(declare-fun e!465572 () Bool)

(assert (=> b!834470 (= e!465572 false)))

(declare-fun lt!379120 () (_ BitVec 32))

(assert (=> b!834470 (= lt!379120 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!379115 () (_ BitVec 32))

(assert (=> b!834470 (= lt!379115 (arrayCountValidKeys!0 lt!379118 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834471 () Bool)

(declare-fun res!567454 () Bool)

(assert (=> b!834471 (=> (not res!567454) (not e!465573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834471 (= res!567454 (not (validKeyInArray!0 (select (arr!22388 a!4227) i!1466))))))

(declare-fun b!834472 () Bool)

(declare-datatypes ((Unit!28669 0))(
  ( (Unit!28670) )
))
(declare-fun e!465575 () Unit!28669)

(declare-fun lt!379117 () Unit!28669)

(assert (=> b!834472 (= e!465575 lt!379117)))

(declare-fun lt!379113 () Unit!28669)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46708 (_ BitVec 32) (_ BitVec 32)) Unit!28669)

(assert (=> b!834472 (= lt!379113 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36559 () (_ BitVec 32))

(assert (=> b!834472 (= call!36559 (bvadd #b00000000000000000000000000000001 lt!379112))))

(assert (=> b!834472 (= lt!379117 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379118 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36560 () (_ BitVec 32))

(assert (=> b!834472 (= call!36560 (bvadd #b00000000000000000000000000000001 lt!379119))))

(declare-fun b!834473 () Bool)

(declare-fun res!567455 () Bool)

(assert (=> b!834473 (=> (not res!567455) (not e!465573))))

(assert (=> b!834473 (= res!567455 (and (bvslt (size!22809 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22809 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun bm!36556 () Bool)

(assert (=> bm!36556 (= call!36559 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834474 () Bool)

(declare-fun lt!379116 () Unit!28669)

(assert (=> b!834474 (= e!465575 lt!379116)))

(declare-fun lt!379114 () Unit!28669)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46708 (_ BitVec 32) (_ BitVec 32)) Unit!28669)

(assert (=> b!834474 (= lt!379114 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834474 (= call!36559 lt!379112)))

(assert (=> b!834474 (= lt!379116 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379118 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834474 (= call!36560 lt!379119)))

(declare-fun res!567453 () Bool)

(assert (=> start!71798 (=> (not res!567453) (not e!465573))))

(assert (=> start!71798 (= res!567453 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22809 a!4227))))))

(assert (=> start!71798 e!465573))

(assert (=> start!71798 true))

(declare-fun array_inv!17835 (array!46708) Bool)

(assert (=> start!71798 (array_inv!17835 a!4227)))

(declare-fun b!834475 () Bool)

(declare-fun res!567452 () Bool)

(assert (=> b!834475 (=> (not res!567452) (not e!465573))))

(assert (=> b!834475 (= res!567452 (validKeyInArray!0 k!2968))))

(declare-fun b!834476 () Bool)

(assert (=> b!834476 (= e!465574 e!465572)))

(declare-fun res!567450 () Bool)

(assert (=> b!834476 (=> (not res!567450) (not e!465572))))

(assert (=> b!834476 (= res!567450 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22809 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379111 () Unit!28669)

(assert (=> b!834476 (= lt!379111 e!465575)))

(declare-fun c!90905 () Bool)

(assert (=> b!834476 (= c!90905 (validKeyInArray!0 (select (arr!22388 a!4227) to!390)))))

(declare-fun bm!36557 () Bool)

(assert (=> bm!36557 (= call!36560 (arrayCountValidKeys!0 lt!379118 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71798 res!567453) b!834471))

(assert (= (and b!834471 res!567454) b!834475))

(assert (= (and b!834475 res!567452) b!834473))

(assert (= (and b!834473 res!567455) b!834469))

(assert (= (and b!834469 res!567451) b!834476))

(assert (= (and b!834476 c!90905) b!834472))

(assert (= (and b!834476 (not c!90905)) b!834474))

(assert (= (or b!834472 b!834474) bm!36557))

(assert (= (or b!834472 b!834474) bm!36556))

(assert (= (and b!834476 res!567450) b!834470))

(declare-fun m!779467 () Bool)

(assert (=> b!834471 m!779467))

(assert (=> b!834471 m!779467))

(declare-fun m!779469 () Bool)

(assert (=> b!834471 m!779469))

(declare-fun m!779471 () Bool)

(assert (=> b!834472 m!779471))

(declare-fun m!779473 () Bool)

(assert (=> b!834472 m!779473))

(declare-fun m!779475 () Bool)

(assert (=> start!71798 m!779475))

(declare-fun m!779477 () Bool)

(assert (=> bm!36556 m!779477))

(declare-fun m!779479 () Bool)

(assert (=> b!834476 m!779479))

(assert (=> b!834476 m!779479))

(declare-fun m!779481 () Bool)

(assert (=> b!834476 m!779481))

(declare-fun m!779483 () Bool)

(assert (=> bm!36557 m!779483))

(declare-fun m!779485 () Bool)

(assert (=> b!834475 m!779485))

(assert (=> b!834470 m!779477))

(assert (=> b!834470 m!779483))

(declare-fun m!779487 () Bool)

(assert (=> b!834474 m!779487))

(declare-fun m!779489 () Bool)

(assert (=> b!834474 m!779489))

(declare-fun m!779491 () Bool)

(assert (=> b!834469 m!779491))

(declare-fun m!779493 () Bool)

(assert (=> b!834469 m!779493))

(declare-fun m!779495 () Bool)

(assert (=> b!834469 m!779495))

(push 1)

(assert (not b!834469))

(assert (not b!834472))

(assert (not bm!36557))

(assert (not b!834471))

(assert (not start!71798))

(assert (not b!834475))

(assert (not b!834474))

