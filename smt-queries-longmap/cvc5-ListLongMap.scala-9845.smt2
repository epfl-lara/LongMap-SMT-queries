; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116756 () Bool)

(assert start!116756)

(declare-fun res!918988 () Bool)

(declare-fun e!779557 () Bool)

(assert (=> start!116756 (=> (not res!918988) (not e!779557))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93425 0))(
  ( (array!93426 (arr!45116 (Array (_ BitVec 32) (_ BitVec 64))) (size!45666 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93425)

(assert (=> start!116756 (= res!918988 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45666 a!4032))))))

(assert (=> start!116756 e!779557))

(assert (=> start!116756 true))

(declare-fun array_inv!34144 (array!93425) Bool)

(assert (=> start!116756 (array_inv!34144 a!4032)))

(declare-fun bm!65818 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun call!65822 () (_ BitVec 32))

(declare-fun lt!605107 () array!93425)

(declare-fun arrayCountValidKeys!0 (array!93425 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65818 (= call!65822 (arrayCountValidKeys!0 lt!605107 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376069 () Bool)

(declare-fun res!918989 () Bool)

(assert (=> b!1376069 (=> (not res!918989) (not e!779557))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376069 (= res!918989 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376070 () Bool)

(declare-datatypes ((Unit!45597 0))(
  ( (Unit!45598) )
))
(declare-fun e!779553 () Unit!45597)

(declare-fun lt!605112 () Unit!45597)

(assert (=> b!1376070 (= e!779553 lt!605112)))

(declare-fun lt!605105 () Unit!45597)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93425 (_ BitVec 32) (_ BitVec 32)) Unit!45597)

(assert (=> b!1376070 (= lt!605105 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65821 () (_ BitVec 32))

(declare-fun lt!605108 () (_ BitVec 32))

(assert (=> b!1376070 (= call!65821 lt!605108)))

(assert (=> b!1376070 (= lt!605112 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605107 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605110 () (_ BitVec 32))

(assert (=> b!1376070 (= call!65822 lt!605110)))

(declare-fun b!1376071 () Bool)

(declare-fun lt!605111 () Unit!45597)

(assert (=> b!1376071 (= e!779553 lt!605111)))

(declare-fun lt!605109 () Unit!45597)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93425 (_ BitVec 32) (_ BitVec 32)) Unit!45597)

(assert (=> b!1376071 (= lt!605109 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376071 (= call!65821 (bvadd #b00000000000000000000000000000001 lt!605108))))

(assert (=> b!1376071 (= lt!605111 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605107 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376071 (= call!65822 (bvadd #b00000000000000000000000000000001 lt!605110))))

(declare-fun b!1376072 () Bool)

(declare-fun res!918987 () Bool)

(assert (=> b!1376072 (=> (not res!918987) (not e!779557))))

(assert (=> b!1376072 (= res!918987 (and (bvslt (size!45666 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45666 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun bm!65819 () Bool)

(assert (=> bm!65819 (= call!65821 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376073 () Bool)

(declare-fun res!918991 () Bool)

(assert (=> b!1376073 (=> (not res!918991) (not e!779557))))

(assert (=> b!1376073 (= res!918991 (validKeyInArray!0 (select (arr!45116 a!4032) i!1445)))))

(declare-fun b!1376074 () Bool)

(declare-fun e!779556 () Bool)

(assert (=> b!1376074 (= e!779557 e!779556)))

(declare-fun res!918990 () Bool)

(assert (=> b!1376074 (=> (not res!918990) (not e!779556))))

(assert (=> b!1376074 (= res!918990 (and (= lt!605110 lt!605108) (not (= to!206 (size!45666 a!4032)))))))

(assert (=> b!1376074 (= lt!605108 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376074 (= lt!605110 (arrayCountValidKeys!0 lt!605107 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376074 (= lt!605107 (array!93426 (store (arr!45116 a!4032) i!1445 k!2947) (size!45666 a!4032)))))

(declare-fun b!1376075 () Bool)

(declare-fun res!918985 () Bool)

(declare-fun e!779554 () Bool)

(assert (=> b!1376075 (=> (not res!918985) (not e!779554))))

(assert (=> b!1376075 (= res!918985 (= (arrayCountValidKeys!0 lt!605107 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1376076 () Bool)

(assert (=> b!1376076 (= e!779556 e!779554)))

(declare-fun res!918986 () Bool)

(assert (=> b!1376076 (=> (not res!918986) (not e!779554))))

(assert (=> b!1376076 (= res!918986 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45666 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605106 () Unit!45597)

(assert (=> b!1376076 (= lt!605106 e!779553)))

(declare-fun c!127982 () Bool)

(assert (=> b!1376076 (= c!127982 (validKeyInArray!0 (select (arr!45116 a!4032) to!206)))))

(declare-fun b!1376077 () Bool)

(assert (=> b!1376077 (= e!779554 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (=> b!1376077 (= (arrayCountValidKeys!0 lt!605107 (bvadd #b00000000000000000000000000000001 i!1445) (size!45666 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45666 a!4032)))))

(declare-fun lt!605113 () Unit!45597)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45597)

(assert (=> b!1376077 (= lt!605113 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116756 res!918988) b!1376073))

(assert (= (and b!1376073 res!918991) b!1376069))

(assert (= (and b!1376069 res!918989) b!1376072))

(assert (= (and b!1376072 res!918987) b!1376074))

(assert (= (and b!1376074 res!918990) b!1376076))

(assert (= (and b!1376076 c!127982) b!1376071))

(assert (= (and b!1376076 (not c!127982)) b!1376070))

(assert (= (or b!1376071 b!1376070) bm!65819))

(assert (= (or b!1376071 b!1376070) bm!65818))

(assert (= (and b!1376076 res!918986) b!1376075))

(assert (= (and b!1376075 res!918985) b!1376077))

(declare-fun m!1260067 () Bool)

(assert (=> b!1376070 m!1260067))

(declare-fun m!1260069 () Bool)

(assert (=> b!1376070 m!1260069))

(declare-fun m!1260071 () Bool)

(assert (=> b!1376075 m!1260071))

(declare-fun m!1260073 () Bool)

(assert (=> b!1376075 m!1260073))

(declare-fun m!1260075 () Bool)

(assert (=> b!1376073 m!1260075))

(assert (=> b!1376073 m!1260075))

(declare-fun m!1260077 () Bool)

(assert (=> b!1376073 m!1260077))

(assert (=> bm!65819 m!1260073))

(declare-fun m!1260079 () Bool)

(assert (=> start!116756 m!1260079))

(assert (=> bm!65818 m!1260071))

(declare-fun m!1260081 () Bool)

(assert (=> b!1376071 m!1260081))

(declare-fun m!1260083 () Bool)

(assert (=> b!1376071 m!1260083))

(declare-fun m!1260085 () Bool)

(assert (=> b!1376074 m!1260085))

(declare-fun m!1260087 () Bool)

(assert (=> b!1376074 m!1260087))

(declare-fun m!1260089 () Bool)

(assert (=> b!1376074 m!1260089))

(declare-fun m!1260091 () Bool)

(assert (=> b!1376077 m!1260091))

(declare-fun m!1260093 () Bool)

(assert (=> b!1376077 m!1260093))

(declare-fun m!1260095 () Bool)

(assert (=> b!1376077 m!1260095))

(declare-fun m!1260097 () Bool)

(assert (=> b!1376069 m!1260097))

(declare-fun m!1260099 () Bool)

(assert (=> b!1376076 m!1260099))

(assert (=> b!1376076 m!1260099))

(declare-fun m!1260101 () Bool)

(assert (=> b!1376076 m!1260101))

(push 1)

(assert (not b!1376069))

(assert (not b!1376074))

(assert (not b!1376077))

(assert (not bm!65818))

(assert (not start!116756))

(assert (not b!1376071))

(assert (not b!1376070))

(assert (not b!1376073))

(assert (not b!1376075))

(assert (not bm!65819))

