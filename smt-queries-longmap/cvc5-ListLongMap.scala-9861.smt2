; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116852 () Bool)

(assert start!116852)

(declare-fun b!1376965 () Bool)

(declare-fun res!919812 () Bool)

(declare-fun e!779983 () Bool)

(assert (=> b!1376965 (=> (not res!919812) (not e!779983))))

(declare-datatypes ((array!93521 0))(
  ( (array!93522 (arr!45164 (Array (_ BitVec 32) (_ BitVec 64))) (size!45714 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93521)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376965 (= res!919812 (validKeyInArray!0 (select (arr!45164 a!4032) i!1445)))))

(declare-fun b!1376966 () Bool)

(declare-fun e!779986 () Bool)

(assert (=> b!1376966 (= e!779983 e!779986)))

(declare-fun res!919809 () Bool)

(assert (=> b!1376966 (=> (not res!919809) (not e!779986))))

(declare-fun lt!605558 () (_ BitVec 32))

(declare-fun lt!605557 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376966 (= res!919809 (and (= lt!605557 lt!605558) (not (= to!206 (size!45714 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93521 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376966 (= lt!605558 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605555 () array!93521)

(assert (=> b!1376966 (= lt!605557 (arrayCountValidKeys!0 lt!605555 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1376966 (= lt!605555 (array!93522 (store (arr!45164 a!4032) i!1445 k!2947) (size!45714 a!4032)))))

(declare-fun b!1376967 () Bool)

(declare-fun res!919810 () Bool)

(assert (=> b!1376967 (=> (not res!919810) (not e!779983))))

(assert (=> b!1376967 (= res!919810 (not (validKeyInArray!0 k!2947)))))

(declare-fun res!919811 () Bool)

(assert (=> start!116852 (=> (not res!919811) (not e!779983))))

(assert (=> start!116852 (= res!919811 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45714 a!4032))))))

(assert (=> start!116852 e!779983))

(assert (=> start!116852 true))

(declare-fun array_inv!34192 (array!93521) Bool)

(assert (=> start!116852 (array_inv!34192 a!4032)))

(declare-fun bm!65890 () Bool)

(declare-fun call!65894 () (_ BitVec 32))

(assert (=> bm!65890 (= call!65894 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376968 () Bool)

(declare-datatypes ((Unit!45645 0))(
  ( (Unit!45646) )
))
(declare-fun e!779985 () Unit!45645)

(declare-fun lt!605560 () Unit!45645)

(assert (=> b!1376968 (= e!779985 lt!605560)))

(declare-fun lt!605553 () Unit!45645)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93521 (_ BitVec 32) (_ BitVec 32)) Unit!45645)

(assert (=> b!1376968 (= lt!605553 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376968 (= call!65894 lt!605558)))

(assert (=> b!1376968 (= lt!605560 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605555 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65893 () (_ BitVec 32))

(assert (=> b!1376968 (= call!65893 lt!605557)))

(declare-fun b!1376969 () Bool)

(declare-fun res!919813 () Bool)

(assert (=> b!1376969 (=> (not res!919813) (not e!779983))))

(assert (=> b!1376969 (= res!919813 (and (bvslt (size!45714 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45714 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376970 () Bool)

(assert (=> b!1376970 (= e!779986 false)))

(declare-fun lt!605559 () Unit!45645)

(assert (=> b!1376970 (= lt!605559 e!779985)))

(declare-fun c!128018 () Bool)

(assert (=> b!1376970 (= c!128018 (validKeyInArray!0 (select (arr!45164 a!4032) to!206)))))

(declare-fun bm!65891 () Bool)

(assert (=> bm!65891 (= call!65893 (arrayCountValidKeys!0 lt!605555 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376971 () Bool)

(declare-fun lt!605554 () Unit!45645)

(assert (=> b!1376971 (= e!779985 lt!605554)))

(declare-fun lt!605556 () Unit!45645)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93521 (_ BitVec 32) (_ BitVec 32)) Unit!45645)

(assert (=> b!1376971 (= lt!605556 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376971 (= call!65894 (bvadd #b00000000000000000000000000000001 lt!605558))))

(assert (=> b!1376971 (= lt!605554 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605555 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376971 (= call!65893 (bvadd #b00000000000000000000000000000001 lt!605557))))

(assert (= (and start!116852 res!919811) b!1376965))

(assert (= (and b!1376965 res!919812) b!1376967))

(assert (= (and b!1376967 res!919810) b!1376969))

(assert (= (and b!1376969 res!919813) b!1376966))

(assert (= (and b!1376966 res!919809) b!1376970))

(assert (= (and b!1376970 c!128018) b!1376971))

(assert (= (and b!1376970 (not c!128018)) b!1376968))

(assert (= (or b!1376971 b!1376968) bm!65890))

(assert (= (or b!1376971 b!1376968) bm!65891))

(declare-fun m!1261111 () Bool)

(assert (=> b!1376965 m!1261111))

(assert (=> b!1376965 m!1261111))

(declare-fun m!1261113 () Bool)

(assert (=> b!1376965 m!1261113))

(declare-fun m!1261115 () Bool)

(assert (=> b!1376971 m!1261115))

(declare-fun m!1261117 () Bool)

(assert (=> b!1376971 m!1261117))

(declare-fun m!1261119 () Bool)

(assert (=> b!1376967 m!1261119))

(declare-fun m!1261121 () Bool)

(assert (=> start!116852 m!1261121))

(declare-fun m!1261123 () Bool)

(assert (=> bm!65890 m!1261123))

(declare-fun m!1261125 () Bool)

(assert (=> b!1376968 m!1261125))

(declare-fun m!1261127 () Bool)

(assert (=> b!1376968 m!1261127))

(declare-fun m!1261129 () Bool)

(assert (=> b!1376966 m!1261129))

(declare-fun m!1261131 () Bool)

(assert (=> b!1376966 m!1261131))

(declare-fun m!1261133 () Bool)

(assert (=> b!1376966 m!1261133))

(declare-fun m!1261135 () Bool)

(assert (=> bm!65891 m!1261135))

(declare-fun m!1261137 () Bool)

(assert (=> b!1376970 m!1261137))

(assert (=> b!1376970 m!1261137))

(declare-fun m!1261139 () Bool)

(assert (=> b!1376970 m!1261139))

(push 1)

(assert (not b!1376968))

(assert (not start!116852))

(assert (not b!1376970))

(assert (not bm!65891))

(assert (not bm!65890))

(assert (not b!1376966))

(assert (not b!1376965))

(assert (not b!1376971))

(assert (not b!1376967))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

