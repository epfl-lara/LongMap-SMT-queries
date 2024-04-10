; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71936 () Bool)

(assert start!71936)

(declare-datatypes ((array!46846 0))(
  ( (array!46847 (arr!22457 (Array (_ BitVec 32) (_ BitVec 64))) (size!22878 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46846)

(declare-fun c!91004 () Bool)

(declare-fun bm!36754 () Bool)

(declare-fun lt!380126 () array!46846)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun call!36757 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46846 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36754 (= call!36757 (arrayCountValidKeys!0 (ite c!91004 a!4227 lt!380126) (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun e!466305 () Bool)

(declare-fun b!835873 () Bool)

(assert (=> b!835873 (= e!466305 (not (= (arrayCountValidKeys!0 lt!380126 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))))

(declare-fun b!835875 () Bool)

(declare-fun res!568657 () Bool)

(declare-fun e!466303 () Bool)

(assert (=> b!835875 (=> (not res!568657) (not e!466303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835875 (= res!568657 (not (validKeyInArray!0 (select (arr!22457 a!4227) i!1466))))))

(declare-fun b!835876 () Bool)

(declare-datatypes ((Unit!28759 0))(
  ( (Unit!28760) )
))
(declare-fun e!466302 () Unit!28759)

(declare-fun lt!380125 () Unit!28759)

(assert (=> b!835876 (= e!466302 lt!380125)))

(declare-fun lt!380128 () Unit!28759)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46846 (_ BitVec 32) (_ BitVec 32)) Unit!28759)

(assert (=> b!835876 (= lt!380128 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36758 () (_ BitVec 32))

(declare-fun lt!380127 () (_ BitVec 32))

(assert (=> b!835876 (= call!36758 lt!380127)))

(assert (=> b!835876 (= lt!380125 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380126 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380123 () (_ BitVec 32))

(assert (=> b!835876 (= call!36757 lt!380123)))

(declare-fun b!835877 () Bool)

(declare-fun res!568661 () Bool)

(assert (=> b!835877 (=> (not res!568661) (not e!466303))))

(declare-fun k!2968 () (_ BitVec 64))

(assert (=> b!835877 (= res!568661 (validKeyInArray!0 k!2968))))

(declare-fun b!835874 () Bool)

(declare-fun lt!380124 () Unit!28759)

(assert (=> b!835874 (= e!466302 lt!380124)))

(declare-fun lt!380122 () Unit!28759)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46846 (_ BitVec 32) (_ BitVec 32)) Unit!28759)

(assert (=> b!835874 (= lt!380122 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835874 (= call!36757 (bvadd #b00000000000000000000000000000001 lt!380127))))

(assert (=> b!835874 (= lt!380124 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380126 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835874 (= call!36758 (bvadd #b00000000000000000000000000000001 lt!380123))))

(declare-fun res!568659 () Bool)

(assert (=> start!71936 (=> (not res!568659) (not e!466303))))

(assert (=> start!71936 (= res!568659 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22878 a!4227))))))

(assert (=> start!71936 e!466303))

(assert (=> start!71936 true))

(declare-fun array_inv!17904 (array!46846) Bool)

(assert (=> start!71936 (array_inv!17904 a!4227)))

(declare-fun b!835878 () Bool)

(declare-fun e!466304 () Bool)

(assert (=> b!835878 (= e!466303 e!466304)))

(declare-fun res!568658 () Bool)

(assert (=> b!835878 (=> (not res!568658) (not e!466304))))

(assert (=> b!835878 (= res!568658 (and (= lt!380123 lt!380127) (not (= to!390 (size!22878 a!4227)))))))

(assert (=> b!835878 (= lt!380127 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835878 (= lt!380123 (arrayCountValidKeys!0 lt!380126 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835878 (= lt!380126 (array!46847 (store (arr!22457 a!4227) i!1466 k!2968) (size!22878 a!4227)))))

(declare-fun b!835879 () Bool)

(assert (=> b!835879 (= e!466304 e!466305)))

(declare-fun res!568660 () Bool)

(assert (=> b!835879 (=> (not res!568660) (not e!466305))))

(assert (=> b!835879 (= res!568660 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22878 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380121 () Unit!28759)

(assert (=> b!835879 (= lt!380121 e!466302)))

(assert (=> b!835879 (= c!91004 (validKeyInArray!0 (select (arr!22457 a!4227) to!390)))))

(declare-fun bm!36755 () Bool)

(assert (=> bm!36755 (= call!36758 (arrayCountValidKeys!0 (ite c!91004 lt!380126 a!4227) (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835880 () Bool)

(declare-fun res!568656 () Bool)

(assert (=> b!835880 (=> (not res!568656) (not e!466303))))

(assert (=> b!835880 (= res!568656 (and (bvslt (size!22878 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22878 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71936 res!568659) b!835875))

(assert (= (and b!835875 res!568657) b!835877))

(assert (= (and b!835877 res!568661) b!835880))

(assert (= (and b!835880 res!568656) b!835878))

(assert (= (and b!835878 res!568658) b!835879))

(assert (= (and b!835879 c!91004) b!835874))

(assert (= (and b!835879 (not c!91004)) b!835876))

(assert (= (or b!835874 b!835876) bm!36755))

(assert (= (or b!835874 b!835876) bm!36754))

(assert (= (and b!835879 res!568660) b!835873))

(declare-fun m!781185 () Bool)

(assert (=> b!835879 m!781185))

(assert (=> b!835879 m!781185))

(declare-fun m!781187 () Bool)

(assert (=> b!835879 m!781187))

(declare-fun m!781189 () Bool)

(assert (=> b!835878 m!781189))

(declare-fun m!781191 () Bool)

(assert (=> b!835878 m!781191))

(declare-fun m!781193 () Bool)

(assert (=> b!835878 m!781193))

(declare-fun m!781195 () Bool)

(assert (=> bm!36754 m!781195))

(declare-fun m!781197 () Bool)

(assert (=> b!835875 m!781197))

(assert (=> b!835875 m!781197))

(declare-fun m!781199 () Bool)

(assert (=> b!835875 m!781199))

(declare-fun m!781201 () Bool)

(assert (=> b!835873 m!781201))

(declare-fun m!781203 () Bool)

(assert (=> b!835873 m!781203))

(declare-fun m!781205 () Bool)

(assert (=> bm!36755 m!781205))

(declare-fun m!781207 () Bool)

(assert (=> b!835877 m!781207))

(declare-fun m!781209 () Bool)

(assert (=> b!835874 m!781209))

(declare-fun m!781211 () Bool)

(assert (=> b!835874 m!781211))

(declare-fun m!781213 () Bool)

(assert (=> b!835876 m!781213))

(declare-fun m!781215 () Bool)

(assert (=> b!835876 m!781215))

(declare-fun m!781217 () Bool)

(assert (=> start!71936 m!781217))

(push 1)

