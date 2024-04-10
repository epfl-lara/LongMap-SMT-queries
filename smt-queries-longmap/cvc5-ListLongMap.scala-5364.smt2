; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71782 () Bool)

(assert start!71782)

(declare-fun b!834277 () Bool)

(declare-fun e!465453 () Bool)

(declare-fun e!465454 () Bool)

(assert (=> b!834277 (= e!465453 e!465454)))

(declare-fun res!567306 () Bool)

(assert (=> b!834277 (=> (not res!567306) (not e!465454))))

(declare-datatypes ((array!46692 0))(
  ( (array!46693 (arr!22380 (Array (_ BitVec 32) (_ BitVec 64))) (size!22801 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46692)

(declare-fun lt!378880 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lt!378876 () (_ BitVec 32))

(assert (=> b!834277 (= res!567306 (and (= lt!378880 lt!378876) (not (= to!390 (size!22801 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46692 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834277 (= lt!378876 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!378873 () array!46692)

(assert (=> b!834277 (= lt!378880 (arrayCountValidKeys!0 lt!378873 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!834277 (= lt!378873 (array!46693 (store (arr!22380 a!4227) i!1466 k!2968) (size!22801 a!4227)))))

(declare-fun b!834278 () Bool)

(declare-datatypes ((Unit!28653 0))(
  ( (Unit!28654) )
))
(declare-fun e!465455 () Unit!28653)

(declare-fun lt!378875 () Unit!28653)

(assert (=> b!834278 (= e!465455 lt!378875)))

(declare-fun lt!378871 () Unit!28653)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46692 (_ BitVec 32) (_ BitVec 32)) Unit!28653)

(assert (=> b!834278 (= lt!378871 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36511 () (_ BitVec 32))

(assert (=> b!834278 (= call!36511 (bvadd #b00000000000000000000000000000001 lt!378876))))

(assert (=> b!834278 (= lt!378875 (lemmaValidKeyIncreasesNumOfKeys!0 lt!378873 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36512 () (_ BitVec 32))

(assert (=> b!834278 (= call!36512 (bvadd #b00000000000000000000000000000001 lt!378880))))

(declare-fun bm!36509 () Bool)

(assert (=> bm!36509 (= call!36511 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834279 () Bool)

(declare-fun res!567311 () Bool)

(assert (=> b!834279 (=> (not res!567311) (not e!465453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834279 (= res!567311 (not (validKeyInArray!0 (select (arr!22380 a!4227) i!1466))))))

(declare-fun b!834280 () Bool)

(declare-fun res!567308 () Bool)

(assert (=> b!834280 (=> (not res!567308) (not e!465453))))

(assert (=> b!834280 (= res!567308 (and (bvslt (size!22801 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22801 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834281 () Bool)

(declare-fun e!465452 () Bool)

(assert (=> b!834281 (= e!465454 e!465452)))

(declare-fun res!567309 () Bool)

(assert (=> b!834281 (=> (not res!567309) (not e!465452))))

(assert (=> b!834281 (= res!567309 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22801 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!378874 () Unit!28653)

(assert (=> b!834281 (= lt!378874 e!465455)))

(declare-fun c!90881 () Bool)

(assert (=> b!834281 (= c!90881 (validKeyInArray!0 (select (arr!22380 a!4227) to!390)))))

(declare-fun b!834282 () Bool)

(declare-fun res!567307 () Bool)

(assert (=> b!834282 (=> (not res!567307) (not e!465453))))

(assert (=> b!834282 (= res!567307 (validKeyInArray!0 k!2968))))

(declare-fun b!834283 () Bool)

(assert (=> b!834283 (= e!465452 false)))

(declare-fun lt!378878 () (_ BitVec 32))

(assert (=> b!834283 (= lt!378878 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun lt!378872 () (_ BitVec 32))

(assert (=> b!834283 (= lt!378872 (arrayCountValidKeys!0 lt!378873 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834284 () Bool)

(declare-fun lt!378879 () Unit!28653)

(assert (=> b!834284 (= e!465455 lt!378879)))

(declare-fun lt!378877 () Unit!28653)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46692 (_ BitVec 32) (_ BitVec 32)) Unit!28653)

(assert (=> b!834284 (= lt!378877 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834284 (= call!36511 lt!378876)))

(assert (=> b!834284 (= lt!378879 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!378873 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834284 (= call!36512 lt!378880)))

(declare-fun bm!36508 () Bool)

(assert (=> bm!36508 (= call!36512 (arrayCountValidKeys!0 lt!378873 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!567310 () Bool)

(assert (=> start!71782 (=> (not res!567310) (not e!465453))))

(assert (=> start!71782 (= res!567310 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22801 a!4227))))))

(assert (=> start!71782 e!465453))

(assert (=> start!71782 true))

(declare-fun array_inv!17827 (array!46692) Bool)

(assert (=> start!71782 (array_inv!17827 a!4227)))

(assert (= (and start!71782 res!567310) b!834279))

(assert (= (and b!834279 res!567311) b!834282))

(assert (= (and b!834282 res!567307) b!834280))

(assert (= (and b!834280 res!567308) b!834277))

(assert (= (and b!834277 res!567306) b!834281))

(assert (= (and b!834281 c!90881) b!834278))

(assert (= (and b!834281 (not c!90881)) b!834284))

(assert (= (or b!834278 b!834284) bm!36508))

(assert (= (or b!834278 b!834284) bm!36509))

(assert (= (and b!834281 res!567309) b!834283))

(declare-fun m!779227 () Bool)

(assert (=> b!834282 m!779227))

(declare-fun m!779229 () Bool)

(assert (=> start!71782 m!779229))

(declare-fun m!779231 () Bool)

(assert (=> b!834279 m!779231))

(assert (=> b!834279 m!779231))

(declare-fun m!779233 () Bool)

(assert (=> b!834279 m!779233))

(declare-fun m!779235 () Bool)

(assert (=> bm!36509 m!779235))

(declare-fun m!779237 () Bool)

(assert (=> b!834278 m!779237))

(declare-fun m!779239 () Bool)

(assert (=> b!834278 m!779239))

(declare-fun m!779241 () Bool)

(assert (=> bm!36508 m!779241))

(declare-fun m!779243 () Bool)

(assert (=> b!834284 m!779243))

(declare-fun m!779245 () Bool)

(assert (=> b!834284 m!779245))

(assert (=> b!834283 m!779235))

(assert (=> b!834283 m!779241))

(declare-fun m!779247 () Bool)

(assert (=> b!834277 m!779247))

(declare-fun m!779249 () Bool)

(assert (=> b!834277 m!779249))

(declare-fun m!779251 () Bool)

(assert (=> b!834277 m!779251))

(declare-fun m!779253 () Bool)

(assert (=> b!834281 m!779253))

(assert (=> b!834281 m!779253))

(declare-fun m!779255 () Bool)

(assert (=> b!834281 m!779255))

(push 1)

