; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71900 () Bool)

(assert start!71900)

(declare-fun bm!36680 () Bool)

(declare-datatypes ((array!46799 0))(
  ( (array!46800 (arr!22434 (Array (_ BitVec 32) (_ BitVec 64))) (size!22855 (_ BitVec 32))) )
))
(declare-fun lt!379693 () array!46799)

(declare-fun call!36684 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46799 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36680 (= call!36684 (arrayCountValidKeys!0 lt!379693 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835455 () Bool)

(declare-fun res!568422 () Bool)

(declare-fun e!466051 () Bool)

(assert (=> b!835455 (=> (not res!568422) (not e!466051))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835455 (= res!568422 (validKeyInArray!0 k0!2968))))

(declare-fun res!568426 () Bool)

(assert (=> start!71900 (=> (not res!568426) (not e!466051))))

(declare-fun a!4227 () array!46799)

(assert (=> start!71900 (= res!568426 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22855 a!4227))))))

(assert (=> start!71900 e!466051))

(assert (=> start!71900 true))

(declare-fun array_inv!17946 (array!46799) Bool)

(assert (=> start!71900 (array_inv!17946 a!4227)))

(declare-fun b!835456 () Bool)

(declare-fun res!568424 () Bool)

(assert (=> b!835456 (=> (not res!568424) (not e!466051))))

(assert (=> b!835456 (= res!568424 (and (bvslt (size!22855 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22855 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835457 () Bool)

(declare-datatypes ((Unit!28691 0))(
  ( (Unit!28692) )
))
(declare-fun e!466049 () Unit!28691)

(declare-fun lt!379697 () Unit!28691)

(assert (=> b!835457 (= e!466049 lt!379697)))

(declare-fun lt!379694 () Unit!28691)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46799 (_ BitVec 32) (_ BitVec 32)) Unit!28691)

(assert (=> b!835457 (= lt!379694 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36683 () (_ BitVec 32))

(declare-fun lt!379692 () (_ BitVec 32))

(assert (=> b!835457 (= call!36683 lt!379692)))

(assert (=> b!835457 (= lt!379697 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379693 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379695 () (_ BitVec 32))

(assert (=> b!835457 (= call!36684 lt!379695)))

(declare-fun b!835458 () Bool)

(declare-fun res!568423 () Bool)

(assert (=> b!835458 (=> (not res!568423) (not e!466051))))

(assert (=> b!835458 (= res!568423 (not (validKeyInArray!0 (select (arr!22434 a!4227) i!1466))))))

(declare-fun bm!36681 () Bool)

(assert (=> bm!36681 (= call!36683 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835459 () Bool)

(declare-fun e!466050 () Bool)

(assert (=> b!835459 (= e!466050 false)))

(declare-fun lt!379690 () Unit!28691)

(assert (=> b!835459 (= lt!379690 e!466049)))

(declare-fun c!90912 () Bool)

(assert (=> b!835459 (= c!90912 (validKeyInArray!0 (select (arr!22434 a!4227) to!390)))))

(declare-fun b!835460 () Bool)

(declare-fun lt!379691 () Unit!28691)

(assert (=> b!835460 (= e!466049 lt!379691)))

(declare-fun lt!379696 () Unit!28691)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46799 (_ BitVec 32) (_ BitVec 32)) Unit!28691)

(assert (=> b!835460 (= lt!379696 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835460 (= call!36683 (bvadd #b00000000000000000000000000000001 lt!379692))))

(assert (=> b!835460 (= lt!379691 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379693 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835460 (= call!36684 (bvadd #b00000000000000000000000000000001 lt!379695))))

(declare-fun b!835461 () Bool)

(assert (=> b!835461 (= e!466051 e!466050)))

(declare-fun res!568425 () Bool)

(assert (=> b!835461 (=> (not res!568425) (not e!466050))))

(assert (=> b!835461 (= res!568425 (and (= lt!379695 lt!379692) (not (= to!390 (size!22855 a!4227)))))))

(assert (=> b!835461 (= lt!379692 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835461 (= lt!379695 (arrayCountValidKeys!0 lt!379693 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835461 (= lt!379693 (array!46800 (store (arr!22434 a!4227) i!1466 k0!2968) (size!22855 a!4227)))))

(assert (= (and start!71900 res!568426) b!835458))

(assert (= (and b!835458 res!568423) b!835455))

(assert (= (and b!835455 res!568422) b!835456))

(assert (= (and b!835456 res!568424) b!835461))

(assert (= (and b!835461 res!568425) b!835459))

(assert (= (and b!835459 c!90912) b!835460))

(assert (= (and b!835459 (not c!90912)) b!835457))

(assert (= (or b!835460 b!835457) bm!36680))

(assert (= (or b!835460 b!835457) bm!36681))

(declare-fun m!780193 () Bool)

(assert (=> b!835457 m!780193))

(declare-fun m!780195 () Bool)

(assert (=> b!835457 m!780195))

(declare-fun m!780197 () Bool)

(assert (=> b!835461 m!780197))

(declare-fun m!780199 () Bool)

(assert (=> b!835461 m!780199))

(declare-fun m!780201 () Bool)

(assert (=> b!835461 m!780201))

(declare-fun m!780203 () Bool)

(assert (=> b!835455 m!780203))

(declare-fun m!780205 () Bool)

(assert (=> b!835458 m!780205))

(assert (=> b!835458 m!780205))

(declare-fun m!780207 () Bool)

(assert (=> b!835458 m!780207))

(declare-fun m!780209 () Bool)

(assert (=> bm!36680 m!780209))

(declare-fun m!780211 () Bool)

(assert (=> b!835459 m!780211))

(assert (=> b!835459 m!780211))

(declare-fun m!780213 () Bool)

(assert (=> b!835459 m!780213))

(declare-fun m!780215 () Bool)

(assert (=> bm!36681 m!780215))

(declare-fun m!780217 () Bool)

(assert (=> b!835460 m!780217))

(declare-fun m!780219 () Bool)

(assert (=> b!835460 m!780219))

(declare-fun m!780221 () Bool)

(assert (=> start!71900 m!780221))

(check-sat (not b!835461) (not b!835459) (not bm!36680) (not b!835458) (not b!835457) (not b!835460) (not start!71900) (not b!835455) (not bm!36681))
(check-sat)
