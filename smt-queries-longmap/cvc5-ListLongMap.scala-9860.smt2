; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116846 () Bool)

(assert start!116846)

(declare-fun b!1376902 () Bool)

(declare-fun e!779947 () Bool)

(declare-fun e!779948 () Bool)

(assert (=> b!1376902 (= e!779947 e!779948)))

(declare-fun res!919766 () Bool)

(assert (=> b!1376902 (=> (not res!919766) (not e!779948))))

(declare-fun lt!605486 () (_ BitVec 32))

(declare-fun lt!605485 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93515 0))(
  ( (array!93516 (arr!45161 (Array (_ BitVec 32) (_ BitVec 64))) (size!45711 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93515)

(assert (=> b!1376902 (= res!919766 (and (= lt!605486 lt!605485) (not (= to!206 (size!45711 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93515 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376902 (= lt!605485 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605487 () array!93515)

(assert (=> b!1376902 (= lt!605486 (arrayCountValidKeys!0 lt!605487 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1376902 (= lt!605487 (array!93516 (store (arr!45161 a!4032) i!1445 k!2947) (size!45711 a!4032)))))

(declare-fun b!1376903 () Bool)

(declare-datatypes ((Unit!45639 0))(
  ( (Unit!45640) )
))
(declare-fun e!779950 () Unit!45639)

(declare-fun lt!605484 () Unit!45639)

(assert (=> b!1376903 (= e!779950 lt!605484)))

(declare-fun lt!605488 () Unit!45639)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93515 (_ BitVec 32) (_ BitVec 32)) Unit!45639)

(assert (=> b!1376903 (= lt!605488 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65876 () (_ BitVec 32))

(assert (=> b!1376903 (= call!65876 lt!605485)))

(assert (=> b!1376903 (= lt!605484 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605487 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65875 () (_ BitVec 32))

(assert (=> b!1376903 (= call!65875 lt!605486)))

(declare-fun bm!65872 () Bool)

(assert (=> bm!65872 (= call!65876 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376904 () Bool)

(declare-fun lt!605482 () Unit!45639)

(assert (=> b!1376904 (= e!779950 lt!605482)))

(declare-fun lt!605481 () Unit!45639)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93515 (_ BitVec 32) (_ BitVec 32)) Unit!45639)

(assert (=> b!1376904 (= lt!605481 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376904 (= call!65876 (bvadd #b00000000000000000000000000000001 lt!605485))))

(assert (=> b!1376904 (= lt!605482 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605487 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376904 (= call!65875 (bvadd #b00000000000000000000000000000001 lt!605486))))

(declare-fun b!1376905 () Bool)

(assert (=> b!1376905 (= e!779948 false)))

(declare-fun lt!605483 () Unit!45639)

(assert (=> b!1376905 (= lt!605483 e!779950)))

(declare-fun c!128009 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376905 (= c!128009 (validKeyInArray!0 (select (arr!45161 a!4032) to!206)))))

(declare-fun b!1376906 () Bool)

(declare-fun res!919768 () Bool)

(assert (=> b!1376906 (=> (not res!919768) (not e!779947))))

(assert (=> b!1376906 (= res!919768 (validKeyInArray!0 (select (arr!45161 a!4032) i!1445)))))

(declare-fun b!1376907 () Bool)

(declare-fun res!919764 () Bool)

(assert (=> b!1376907 (=> (not res!919764) (not e!779947))))

(assert (=> b!1376907 (= res!919764 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376908 () Bool)

(declare-fun res!919767 () Bool)

(assert (=> b!1376908 (=> (not res!919767) (not e!779947))))

(assert (=> b!1376908 (= res!919767 (and (bvslt (size!45711 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45711 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun bm!65873 () Bool)

(assert (=> bm!65873 (= call!65875 (arrayCountValidKeys!0 lt!605487 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!919765 () Bool)

(assert (=> start!116846 (=> (not res!919765) (not e!779947))))

(assert (=> start!116846 (= res!919765 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45711 a!4032))))))

(assert (=> start!116846 e!779947))

(assert (=> start!116846 true))

(declare-fun array_inv!34189 (array!93515) Bool)

(assert (=> start!116846 (array_inv!34189 a!4032)))

(assert (= (and start!116846 res!919765) b!1376906))

(assert (= (and b!1376906 res!919768) b!1376907))

(assert (= (and b!1376907 res!919764) b!1376908))

(assert (= (and b!1376908 res!919767) b!1376902))

(assert (= (and b!1376902 res!919766) b!1376905))

(assert (= (and b!1376905 c!128009) b!1376904))

(assert (= (and b!1376905 (not c!128009)) b!1376903))

(assert (= (or b!1376904 b!1376903) bm!65873))

(assert (= (or b!1376904 b!1376903) bm!65872))

(declare-fun m!1261021 () Bool)

(assert (=> bm!65873 m!1261021))

(declare-fun m!1261023 () Bool)

(assert (=> bm!65872 m!1261023))

(declare-fun m!1261025 () Bool)

(assert (=> b!1376906 m!1261025))

(assert (=> b!1376906 m!1261025))

(declare-fun m!1261027 () Bool)

(assert (=> b!1376906 m!1261027))

(declare-fun m!1261029 () Bool)

(assert (=> b!1376905 m!1261029))

(assert (=> b!1376905 m!1261029))

(declare-fun m!1261031 () Bool)

(assert (=> b!1376905 m!1261031))

(declare-fun m!1261033 () Bool)

(assert (=> b!1376902 m!1261033))

(declare-fun m!1261035 () Bool)

(assert (=> b!1376902 m!1261035))

(declare-fun m!1261037 () Bool)

(assert (=> b!1376902 m!1261037))

(declare-fun m!1261039 () Bool)

(assert (=> b!1376904 m!1261039))

(declare-fun m!1261041 () Bool)

(assert (=> b!1376904 m!1261041))

(declare-fun m!1261043 () Bool)

(assert (=> b!1376903 m!1261043))

(declare-fun m!1261045 () Bool)

(assert (=> b!1376903 m!1261045))

(declare-fun m!1261047 () Bool)

(assert (=> b!1376907 m!1261047))

(declare-fun m!1261049 () Bool)

(assert (=> start!116846 m!1261049))

(push 1)

