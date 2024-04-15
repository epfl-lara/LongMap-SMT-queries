; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116878 () Bool)

(assert start!116878)

(declare-fun b!1377250 () Bool)

(declare-fun res!920040 () Bool)

(declare-fun e!780159 () Bool)

(assert (=> b!1377250 (=> (not res!920040) (not e!780159))))

(declare-datatypes ((array!93501 0))(
  ( (array!93502 (arr!45154 (Array (_ BitVec 32) (_ BitVec 64))) (size!45706 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93501)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377250 (= res!920040 (validKeyInArray!0 (select (arr!45154 a!4032) i!1445)))))

(declare-fun b!1377251 () Bool)

(declare-fun res!920042 () Bool)

(assert (=> b!1377251 (=> (not res!920042) (not e!780159))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1377251 (= res!920042 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377252 () Bool)

(declare-fun e!780158 () Bool)

(assert (=> b!1377252 (= e!780158 (not true))))

(declare-fun lt!605735 () array!93501)

(declare-fun arrayCountValidKeys!0 (array!93501 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377252 (= (arrayCountValidKeys!0 lt!605735 (bvadd #b00000000000000000000000000000001 i!1445) (size!45706 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45706 a!4032)))))

(declare-datatypes ((Unit!45516 0))(
  ( (Unit!45517) )
))
(declare-fun lt!605736 () Unit!45516)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93501 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45516)

(assert (=> b!1377252 (= lt!605736 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377253 () Bool)

(declare-fun e!780156 () Bool)

(assert (=> b!1377253 (= e!780156 e!780158)))

(declare-fun res!920041 () Bool)

(assert (=> b!1377253 (=> (not res!920041) (not e!780158))))

(assert (=> b!1377253 (= res!920041 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45706 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605737 () Unit!45516)

(declare-fun e!780160 () Unit!45516)

(assert (=> b!1377253 (= lt!605737 e!780160)))

(declare-fun c!128048 () Bool)

(assert (=> b!1377253 (= c!128048 (validKeyInArray!0 (select (arr!45154 a!4032) to!206)))))

(declare-fun b!1377254 () Bool)

(declare-fun res!920044 () Bool)

(assert (=> b!1377254 (=> (not res!920044) (not e!780159))))

(assert (=> b!1377254 (= res!920044 (and (bvslt (size!45706 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45706 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377255 () Bool)

(assert (=> b!1377255 (= e!780159 e!780156)))

(declare-fun res!920043 () Bool)

(assert (=> b!1377255 (=> (not res!920043) (not e!780156))))

(declare-fun lt!605734 () (_ BitVec 32))

(declare-fun lt!605733 () (_ BitVec 32))

(assert (=> b!1377255 (= res!920043 (and (= lt!605734 lt!605733) (not (= to!206 (size!45706 a!4032)))))))

(assert (=> b!1377255 (= lt!605733 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377255 (= lt!605734 (arrayCountValidKeys!0 lt!605735 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377255 (= lt!605735 (array!93502 (store (arr!45154 a!4032) i!1445 k0!2947) (size!45706 a!4032)))))

(declare-fun res!920045 () Bool)

(assert (=> start!116878 (=> (not res!920045) (not e!780159))))

(assert (=> start!116878 (= res!920045 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45706 a!4032))))))

(assert (=> start!116878 e!780159))

(assert (=> start!116878 true))

(declare-fun array_inv!34387 (array!93501) Bool)

(assert (=> start!116878 (array_inv!34387 a!4032)))

(declare-fun b!1377256 () Bool)

(declare-fun res!920039 () Bool)

(assert (=> b!1377256 (=> (not res!920039) (not e!780158))))

(assert (=> b!1377256 (= res!920039 (= (arrayCountValidKeys!0 lt!605735 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1377257 () Bool)

(declare-fun lt!605738 () Unit!45516)

(assert (=> b!1377257 (= e!780160 lt!605738)))

(declare-fun lt!605741 () Unit!45516)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93501 (_ BitVec 32) (_ BitVec 32)) Unit!45516)

(assert (=> b!1377257 (= lt!605741 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65967 () (_ BitVec 32))

(assert (=> b!1377257 (= call!65967 lt!605733)))

(assert (=> b!1377257 (= lt!605738 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605735 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65966 () (_ BitVec 32))

(assert (=> b!1377257 (= call!65966 lt!605734)))

(declare-fun bm!65963 () Bool)

(assert (=> bm!65963 (= call!65966 (arrayCountValidKeys!0 lt!605735 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65964 () Bool)

(assert (=> bm!65964 (= call!65967 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377258 () Bool)

(declare-fun lt!605740 () Unit!45516)

(assert (=> b!1377258 (= e!780160 lt!605740)))

(declare-fun lt!605739 () Unit!45516)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93501 (_ BitVec 32) (_ BitVec 32)) Unit!45516)

(assert (=> b!1377258 (= lt!605739 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377258 (= call!65967 (bvadd #b00000000000000000000000000000001 lt!605733))))

(assert (=> b!1377258 (= lt!605740 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605735 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377258 (= call!65966 (bvadd #b00000000000000000000000000000001 lt!605734))))

(assert (= (and start!116878 res!920045) b!1377250))

(assert (= (and b!1377250 res!920040) b!1377251))

(assert (= (and b!1377251 res!920042) b!1377254))

(assert (= (and b!1377254 res!920044) b!1377255))

(assert (= (and b!1377255 res!920043) b!1377253))

(assert (= (and b!1377253 c!128048) b!1377258))

(assert (= (and b!1377253 (not c!128048)) b!1377257))

(assert (= (or b!1377258 b!1377257) bm!65963))

(assert (= (or b!1377258 b!1377257) bm!65964))

(assert (= (and b!1377253 res!920041) b!1377256))

(assert (= (and b!1377256 res!920039) b!1377252))

(declare-fun m!1261067 () Bool)

(assert (=> b!1377258 m!1261067))

(declare-fun m!1261069 () Bool)

(assert (=> b!1377258 m!1261069))

(declare-fun m!1261071 () Bool)

(assert (=> b!1377257 m!1261071))

(declare-fun m!1261073 () Bool)

(assert (=> b!1377257 m!1261073))

(declare-fun m!1261075 () Bool)

(assert (=> b!1377252 m!1261075))

(declare-fun m!1261077 () Bool)

(assert (=> b!1377252 m!1261077))

(declare-fun m!1261079 () Bool)

(assert (=> b!1377252 m!1261079))

(declare-fun m!1261081 () Bool)

(assert (=> bm!65964 m!1261081))

(declare-fun m!1261083 () Bool)

(assert (=> bm!65963 m!1261083))

(assert (=> b!1377256 m!1261083))

(assert (=> b!1377256 m!1261081))

(declare-fun m!1261085 () Bool)

(assert (=> b!1377250 m!1261085))

(assert (=> b!1377250 m!1261085))

(declare-fun m!1261087 () Bool)

(assert (=> b!1377250 m!1261087))

(declare-fun m!1261089 () Bool)

(assert (=> b!1377251 m!1261089))

(declare-fun m!1261091 () Bool)

(assert (=> b!1377255 m!1261091))

(declare-fun m!1261093 () Bool)

(assert (=> b!1377255 m!1261093))

(declare-fun m!1261095 () Bool)

(assert (=> b!1377255 m!1261095))

(declare-fun m!1261097 () Bool)

(assert (=> b!1377253 m!1261097))

(assert (=> b!1377253 m!1261097))

(declare-fun m!1261099 () Bool)

(assert (=> b!1377253 m!1261099))

(declare-fun m!1261101 () Bool)

(assert (=> start!116878 m!1261101))

(check-sat (not b!1377255) (not start!116878) (not b!1377252) (not b!1377258) (not bm!65963) (not b!1377256) (not b!1377257) (not bm!65964) (not b!1377253) (not b!1377250) (not b!1377251))
(check-sat)
