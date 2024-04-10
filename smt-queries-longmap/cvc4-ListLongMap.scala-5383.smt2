; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71900 () Bool)

(assert start!71900)

(declare-fun b!835488 () Bool)

(declare-fun e!466078 () Bool)

(declare-fun e!466079 () Bool)

(assert (=> b!835488 (= e!466078 e!466079)))

(declare-fun res!568360 () Bool)

(assert (=> b!835488 (=> (not res!568360) (not e!466079))))

(declare-datatypes ((array!46810 0))(
  ( (array!46811 (arr!22439 (Array (_ BitVec 32) (_ BitVec 64))) (size!22860 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46810)

(declare-fun lt!379741 () (_ BitVec 32))

(declare-fun lt!379739 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835488 (= res!568360 (and (= lt!379741 lt!379739) (not (= to!390 (size!22860 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46810 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835488 (= lt!379739 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835488 (= lt!379741 (arrayCountValidKeys!0 (array!46811 (store (arr!22439 a!4227) i!1466 k!2968) (size!22860 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835489 () Bool)

(declare-fun res!568361 () Bool)

(assert (=> b!835489 (=> (not res!568361) (not e!466079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835489 (= res!568361 (not (validKeyInArray!0 (select (arr!22439 a!4227) to!390))))))

(declare-fun b!835490 () Bool)

(declare-fun res!568363 () Bool)

(assert (=> b!835490 (=> (not res!568363) (not e!466078))))

(assert (=> b!835490 (= res!568363 (not (validKeyInArray!0 (select (arr!22439 a!4227) i!1466))))))

(declare-fun res!568362 () Bool)

(assert (=> start!71900 (=> (not res!568362) (not e!466078))))

(assert (=> start!71900 (= res!568362 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22860 a!4227))))))

(assert (=> start!71900 e!466078))

(assert (=> start!71900 true))

(declare-fun array_inv!17886 (array!46810) Bool)

(assert (=> start!71900 (array_inv!17886 a!4227)))

(declare-fun b!835491 () Bool)

(declare-fun res!568364 () Bool)

(assert (=> b!835491 (=> (not res!568364) (not e!466078))))

(assert (=> b!835491 (= res!568364 (validKeyInArray!0 k!2968))))

(declare-fun b!835492 () Bool)

(declare-fun res!568359 () Bool)

(assert (=> b!835492 (=> (not res!568359) (not e!466078))))

(assert (=> b!835492 (= res!568359 (and (bvslt (size!22860 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22860 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835493 () Bool)

(assert (=> b!835493 (= e!466079 (not true))))

(assert (=> b!835493 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!379739)))

(declare-datatypes ((Unit!28723 0))(
  ( (Unit!28724) )
))
(declare-fun lt!379740 () Unit!28723)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46810 (_ BitVec 32) (_ BitVec 32)) Unit!28723)

(assert (=> b!835493 (= lt!379740 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (= (and start!71900 res!568362) b!835490))

(assert (= (and b!835490 res!568363) b!835491))

(assert (= (and b!835491 res!568364) b!835492))

(assert (= (and b!835492 res!568359) b!835488))

(assert (= (and b!835488 res!568360) b!835489))

(assert (= (and b!835489 res!568361) b!835493))

(declare-fun m!780665 () Bool)

(assert (=> start!71900 m!780665))

(declare-fun m!780667 () Bool)

(assert (=> b!835493 m!780667))

(declare-fun m!780669 () Bool)

(assert (=> b!835493 m!780669))

(declare-fun m!780671 () Bool)

(assert (=> b!835491 m!780671))

(declare-fun m!780673 () Bool)

(assert (=> b!835488 m!780673))

(declare-fun m!780675 () Bool)

(assert (=> b!835488 m!780675))

(declare-fun m!780677 () Bool)

(assert (=> b!835488 m!780677))

(declare-fun m!780679 () Bool)

(assert (=> b!835489 m!780679))

(assert (=> b!835489 m!780679))

(declare-fun m!780681 () Bool)

(assert (=> b!835489 m!780681))

(declare-fun m!780683 () Bool)

(assert (=> b!835490 m!780683))

(assert (=> b!835490 m!780683))

(declare-fun m!780685 () Bool)

(assert (=> b!835490 m!780685))

(push 1)

(assert (not b!835491))

(assert (not b!835488))

(assert (not b!835489))

(assert (not start!71900))

(assert (not b!835493))

(assert (not b!835490))

(check-sat)

