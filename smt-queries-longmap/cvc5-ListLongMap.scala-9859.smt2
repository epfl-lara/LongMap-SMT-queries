; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116840 () Bool)

(assert start!116840)

(declare-fun b!1376839 () Bool)

(declare-fun res!919723 () Bool)

(declare-fun e!779914 () Bool)

(assert (=> b!1376839 (=> (not res!919723) (not e!779914))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376839 (= res!919723 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1376840 () Bool)

(declare-fun res!919721 () Bool)

(assert (=> b!1376840 (=> (not res!919721) (not e!779914))))

(declare-datatypes ((array!93509 0))(
  ( (array!93510 (arr!45158 (Array (_ BitVec 32) (_ BitVec 64))) (size!45708 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93509)

(declare-fun i!1445 () (_ BitVec 32))

(assert (=> b!1376840 (= res!919721 (validKeyInArray!0 (select (arr!45158 a!4032) i!1445)))))

(declare-fun res!919720 () Bool)

(assert (=> start!116840 (=> (not res!919720) (not e!779914))))

(assert (=> start!116840 (= res!919720 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45708 a!4032))))))

(assert (=> start!116840 e!779914))

(assert (=> start!116840 true))

(declare-fun array_inv!34186 (array!93509) Bool)

(assert (=> start!116840 (array_inv!34186 a!4032)))

(declare-fun b!1376841 () Bool)

(declare-fun e!779912 () Bool)

(assert (=> b!1376841 (= e!779912 false)))

(declare-datatypes ((Unit!45633 0))(
  ( (Unit!45634) )
))
(declare-fun lt!605411 () Unit!45633)

(declare-fun e!779913 () Unit!45633)

(assert (=> b!1376841 (= lt!605411 e!779913)))

(declare-fun c!128000 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1376841 (= c!128000 (validKeyInArray!0 (select (arr!45158 a!4032) to!206)))))

(declare-fun b!1376842 () Bool)

(declare-fun lt!605415 () Unit!45633)

(assert (=> b!1376842 (= e!779913 lt!605415)))

(declare-fun lt!605410 () Unit!45633)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93509 (_ BitVec 32) (_ BitVec 32)) Unit!45633)

(assert (=> b!1376842 (= lt!605410 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65857 () (_ BitVec 32))

(declare-fun lt!605409 () (_ BitVec 32))

(assert (=> b!1376842 (= call!65857 (bvadd #b00000000000000000000000000000001 lt!605409))))

(declare-fun lt!605412 () array!93509)

(assert (=> b!1376842 (= lt!605415 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605412 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65858 () (_ BitVec 32))

(declare-fun lt!605413 () (_ BitVec 32))

(assert (=> b!1376842 (= call!65858 (bvadd #b00000000000000000000000000000001 lt!605413))))

(declare-fun bm!65854 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93509 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65854 (= call!65858 (arrayCountValidKeys!0 lt!605412 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65855 () Bool)

(assert (=> bm!65855 (= call!65857 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376843 () Bool)

(declare-fun lt!605416 () Unit!45633)

(assert (=> b!1376843 (= e!779913 lt!605416)))

(declare-fun lt!605414 () Unit!45633)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93509 (_ BitVec 32) (_ BitVec 32)) Unit!45633)

(assert (=> b!1376843 (= lt!605414 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376843 (= call!65857 lt!605409)))

(assert (=> b!1376843 (= lt!605416 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605412 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376843 (= call!65858 lt!605413)))

(declare-fun b!1376844 () Bool)

(assert (=> b!1376844 (= e!779914 e!779912)))

(declare-fun res!919722 () Bool)

(assert (=> b!1376844 (=> (not res!919722) (not e!779912))))

(assert (=> b!1376844 (= res!919722 (and (= lt!605413 lt!605409) (not (= to!206 (size!45708 a!4032)))))))

(assert (=> b!1376844 (= lt!605409 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376844 (= lt!605413 (arrayCountValidKeys!0 lt!605412 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376844 (= lt!605412 (array!93510 (store (arr!45158 a!4032) i!1445 k!2947) (size!45708 a!4032)))))

(declare-fun b!1376845 () Bool)

(declare-fun res!919719 () Bool)

(assert (=> b!1376845 (=> (not res!919719) (not e!779914))))

(assert (=> b!1376845 (= res!919719 (and (bvslt (size!45708 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45708 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116840 res!919720) b!1376840))

(assert (= (and b!1376840 res!919721) b!1376839))

(assert (= (and b!1376839 res!919723) b!1376845))

(assert (= (and b!1376845 res!919719) b!1376844))

(assert (= (and b!1376844 res!919722) b!1376841))

(assert (= (and b!1376841 c!128000) b!1376842))

(assert (= (and b!1376841 (not c!128000)) b!1376843))

(assert (= (or b!1376842 b!1376843) bm!65855))

(assert (= (or b!1376842 b!1376843) bm!65854))

(declare-fun m!1260931 () Bool)

(assert (=> bm!65855 m!1260931))

(declare-fun m!1260933 () Bool)

(assert (=> b!1376839 m!1260933))

(declare-fun m!1260935 () Bool)

(assert (=> b!1376840 m!1260935))

(assert (=> b!1376840 m!1260935))

(declare-fun m!1260937 () Bool)

(assert (=> b!1376840 m!1260937))

(declare-fun m!1260939 () Bool)

(assert (=> b!1376842 m!1260939))

(declare-fun m!1260941 () Bool)

(assert (=> b!1376842 m!1260941))

(declare-fun m!1260943 () Bool)

(assert (=> bm!65854 m!1260943))

(declare-fun m!1260945 () Bool)

(assert (=> b!1376841 m!1260945))

(assert (=> b!1376841 m!1260945))

(declare-fun m!1260947 () Bool)

(assert (=> b!1376841 m!1260947))

(declare-fun m!1260949 () Bool)

(assert (=> b!1376844 m!1260949))

(declare-fun m!1260951 () Bool)

(assert (=> b!1376844 m!1260951))

(declare-fun m!1260953 () Bool)

(assert (=> b!1376844 m!1260953))

(declare-fun m!1260955 () Bool)

(assert (=> start!116840 m!1260955))

(declare-fun m!1260957 () Bool)

(assert (=> b!1376843 m!1260957))

(declare-fun m!1260959 () Bool)

(assert (=> b!1376843 m!1260959))

(push 1)

