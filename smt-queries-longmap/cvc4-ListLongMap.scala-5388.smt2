; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71930 () Bool)

(assert start!71930)

(declare-fun bm!36736 () Bool)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-datatypes ((array!46840 0))(
  ( (array!46841 (arr!22454 (Array (_ BitVec 32) (_ BitVec 64))) (size!22875 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46840)

(declare-fun call!36740 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46840 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36736 (= call!36740 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835802 () Bool)

(declare-fun res!568604 () Bool)

(declare-fun e!466260 () Bool)

(assert (=> b!835802 (=> (not res!568604) (not e!466260))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835802 (= res!568604 (validKeyInArray!0 k!2968))))

(declare-fun b!835803 () Bool)

(declare-datatypes ((Unit!28753 0))(
  ( (Unit!28754) )
))
(declare-fun e!466259 () Unit!28753)

(declare-fun lt!380053 () Unit!28753)

(assert (=> b!835803 (= e!466259 lt!380053)))

(declare-fun lt!380054 () Unit!28753)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46840 (_ BitVec 32) (_ BitVec 32)) Unit!28753)

(assert (=> b!835803 (= lt!380054 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380049 () (_ BitVec 32))

(assert (=> b!835803 (= call!36740 (bvadd #b00000000000000000000000000000001 lt!380049))))

(declare-fun lt!380056 () array!46840)

(assert (=> b!835803 (= lt!380053 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380056 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36739 () (_ BitVec 32))

(declare-fun lt!380052 () (_ BitVec 32))

(assert (=> b!835803 (= call!36739 (bvadd #b00000000000000000000000000000001 lt!380052))))

(declare-fun b!835804 () Bool)

(declare-fun e!466257 () Bool)

(assert (=> b!835804 (= e!466257 (or (bvslt (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) (size!22875 a!4227)) (bvsle (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380050 () Unit!28753)

(assert (=> b!835804 (= lt!380050 e!466259)))

(declare-fun c!90995 () Bool)

(assert (=> b!835804 (= c!90995 (validKeyInArray!0 (select (arr!22454 a!4227) to!390)))))

(declare-fun b!835805 () Bool)

(assert (=> b!835805 (= e!466260 e!466257)))

(declare-fun res!568607 () Bool)

(assert (=> b!835805 (=> (not res!568607) (not e!466257))))

(assert (=> b!835805 (= res!568607 (and (= lt!380052 lt!380049) (not (= to!390 (size!22875 a!4227)))))))

(assert (=> b!835805 (= lt!380049 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835805 (= lt!380052 (arrayCountValidKeys!0 lt!380056 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835805 (= lt!380056 (array!46841 (store (arr!22454 a!4227) i!1466 k!2968) (size!22875 a!4227)))))

(declare-fun bm!36737 () Bool)

(assert (=> bm!36737 (= call!36739 (arrayCountValidKeys!0 lt!380056 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835806 () Bool)

(declare-fun res!568603 () Bool)

(assert (=> b!835806 (=> (not res!568603) (not e!466260))))

(assert (=> b!835806 (= res!568603 (and (bvslt (size!22875 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22875 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835807 () Bool)

(declare-fun res!568606 () Bool)

(assert (=> b!835807 (=> (not res!568606) (not e!466260))))

(assert (=> b!835807 (= res!568606 (not (validKeyInArray!0 (select (arr!22454 a!4227) i!1466))))))

(declare-fun b!835808 () Bool)

(declare-fun lt!380055 () Unit!28753)

(assert (=> b!835808 (= e!466259 lt!380055)))

(declare-fun lt!380051 () Unit!28753)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46840 (_ BitVec 32) (_ BitVec 32)) Unit!28753)

(assert (=> b!835808 (= lt!380051 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835808 (= call!36740 lt!380049)))

(assert (=> b!835808 (= lt!380055 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380056 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835808 (= call!36739 lt!380052)))

(declare-fun res!568605 () Bool)

(assert (=> start!71930 (=> (not res!568605) (not e!466260))))

(assert (=> start!71930 (= res!568605 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22875 a!4227))))))

(assert (=> start!71930 e!466260))

(assert (=> start!71930 true))

(declare-fun array_inv!17901 (array!46840) Bool)

(assert (=> start!71930 (array_inv!17901 a!4227)))

(assert (= (and start!71930 res!568605) b!835807))

(assert (= (and b!835807 res!568606) b!835802))

(assert (= (and b!835802 res!568604) b!835806))

(assert (= (and b!835806 res!568603) b!835805))

(assert (= (and b!835805 res!568607) b!835804))

(assert (= (and b!835804 c!90995) b!835803))

(assert (= (and b!835804 (not c!90995)) b!835808))

(assert (= (or b!835803 b!835808) bm!36737))

(assert (= (or b!835803 b!835808) bm!36736))

(declare-fun m!781095 () Bool)

(assert (=> start!71930 m!781095))

(declare-fun m!781097 () Bool)

(assert (=> b!835802 m!781097))

(declare-fun m!781099 () Bool)

(assert (=> b!835808 m!781099))

(declare-fun m!781101 () Bool)

(assert (=> b!835808 m!781101))

(declare-fun m!781103 () Bool)

(assert (=> bm!36736 m!781103))

(declare-fun m!781105 () Bool)

(assert (=> b!835803 m!781105))

(declare-fun m!781107 () Bool)

(assert (=> b!835803 m!781107))

(declare-fun m!781109 () Bool)

(assert (=> b!835807 m!781109))

(assert (=> b!835807 m!781109))

(declare-fun m!781111 () Bool)

(assert (=> b!835807 m!781111))

(declare-fun m!781113 () Bool)

(assert (=> bm!36737 m!781113))

(declare-fun m!781115 () Bool)

(assert (=> b!835804 m!781115))

(assert (=> b!835804 m!781115))

(declare-fun m!781117 () Bool)

(assert (=> b!835804 m!781117))

(declare-fun m!781119 () Bool)

(assert (=> b!835805 m!781119))

(declare-fun m!781121 () Bool)

(assert (=> b!835805 m!781121))

(declare-fun m!781123 () Bool)

(assert (=> b!835805 m!781123))

(push 1)

(assert (not b!835804))

(assert (not b!835808))

(assert (not bm!36736))

(assert (not start!71930))

(assert (not b!835803))

(assert (not b!835802))

(assert (not b!835805))

(assert (not b!835807))

(assert (not bm!36737))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

