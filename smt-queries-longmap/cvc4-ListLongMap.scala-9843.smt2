; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116748 () Bool)

(assert start!116748)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93417 0))(
  ( (array!93418 (arr!45112 (Array (_ BitVec 32) (_ BitVec 64))) (size!45662 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93417)

(declare-fun bm!65794 () Bool)

(declare-fun call!65797 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93417 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65794 (= call!65797 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375961 () Bool)

(declare-fun res!918904 () Bool)

(declare-fun e!779495 () Bool)

(assert (=> b!1375961 (=> (not res!918904) (not e!779495))))

(assert (=> b!1375961 (= res!918904 (and (bvslt (size!45662 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45662 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375962 () Bool)

(declare-fun res!918905 () Bool)

(assert (=> b!1375962 (=> (not res!918905) (not e!779495))))

(declare-fun k!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375962 (= res!918905 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375963 () Bool)

(declare-fun e!779494 () Bool)

(assert (=> b!1375963 (= e!779495 e!779494)))

(declare-fun res!918902 () Bool)

(assert (=> b!1375963 (=> (not res!918902) (not e!779494))))

(declare-fun lt!604999 () (_ BitVec 32))

(declare-fun lt!605005 () (_ BitVec 32))

(assert (=> b!1375963 (= res!918902 (and (= lt!604999 lt!605005) (not (= to!206 (size!45662 a!4032)))))))

(assert (=> b!1375963 (= lt!605005 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605002 () array!93417)

(assert (=> b!1375963 (= lt!604999 (arrayCountValidKeys!0 lt!605002 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375963 (= lt!605002 (array!93418 (store (arr!45112 a!4032) i!1445 k!2947) (size!45662 a!4032)))))

(declare-fun res!918907 () Bool)

(assert (=> start!116748 (=> (not res!918907) (not e!779495))))

(assert (=> start!116748 (= res!918907 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45662 a!4032))))))

(assert (=> start!116748 e!779495))

(assert (=> start!116748 true))

(declare-fun array_inv!34140 (array!93417) Bool)

(assert (=> start!116748 (array_inv!34140 a!4032)))

(declare-fun b!1375964 () Bool)

(declare-fun res!918906 () Bool)

(declare-fun e!779496 () Bool)

(assert (=> b!1375964 (=> (not res!918906) (not e!779496))))

(assert (=> b!1375964 (= res!918906 (= (arrayCountValidKeys!0 lt!605002 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1375965 () Bool)

(declare-datatypes ((Unit!45589 0))(
  ( (Unit!45590) )
))
(declare-fun e!779493 () Unit!45589)

(declare-fun lt!605000 () Unit!45589)

(assert (=> b!1375965 (= e!779493 lt!605000)))

(declare-fun lt!604997 () Unit!45589)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93417 (_ BitVec 32) (_ BitVec 32)) Unit!45589)

(assert (=> b!1375965 (= lt!604997 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375965 (= call!65797 lt!605005)))

(assert (=> b!1375965 (= lt!605000 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605002 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65798 () (_ BitVec 32))

(assert (=> b!1375965 (= call!65798 lt!604999)))

(declare-fun bm!65795 () Bool)

(assert (=> bm!65795 (= call!65798 (arrayCountValidKeys!0 lt!605002 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375966 () Bool)

(declare-fun res!918901 () Bool)

(assert (=> b!1375966 (=> (not res!918901) (not e!779495))))

(assert (=> b!1375966 (= res!918901 (validKeyInArray!0 (select (arr!45112 a!4032) i!1445)))))

(declare-fun b!1375967 () Bool)

(declare-fun lt!605001 () Unit!45589)

(assert (=> b!1375967 (= e!779493 lt!605001)))

(declare-fun lt!605004 () Unit!45589)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93417 (_ BitVec 32) (_ BitVec 32)) Unit!45589)

(assert (=> b!1375967 (= lt!605004 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375967 (= call!65797 (bvadd #b00000000000000000000000000000001 lt!605005))))

(assert (=> b!1375967 (= lt!605001 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605002 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375967 (= call!65798 (bvadd #b00000000000000000000000000000001 lt!604999))))

(declare-fun b!1375968 () Bool)

(assert (=> b!1375968 (= e!779494 e!779496)))

(declare-fun res!918903 () Bool)

(assert (=> b!1375968 (=> (not res!918903) (not e!779496))))

(assert (=> b!1375968 (= res!918903 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45662 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605003 () Unit!45589)

(assert (=> b!1375968 (= lt!605003 e!779493)))

(declare-fun c!127970 () Bool)

(assert (=> b!1375968 (= c!127970 (validKeyInArray!0 (select (arr!45112 a!4032) to!206)))))

(declare-fun b!1375969 () Bool)

(assert (=> b!1375969 (= e!779496 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (=> b!1375969 (= (arrayCountValidKeys!0 lt!605002 (bvadd #b00000000000000000000000000000001 i!1445) (size!45662 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45662 a!4032)))))

(declare-fun lt!604998 () Unit!45589)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45589)

(assert (=> b!1375969 (= lt!604998 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116748 res!918907) b!1375966))

(assert (= (and b!1375966 res!918901) b!1375962))

(assert (= (and b!1375962 res!918905) b!1375961))

(assert (= (and b!1375961 res!918904) b!1375963))

(assert (= (and b!1375963 res!918902) b!1375968))

(assert (= (and b!1375968 c!127970) b!1375967))

(assert (= (and b!1375968 (not c!127970)) b!1375965))

(assert (= (or b!1375967 b!1375965) bm!65795))

(assert (= (or b!1375967 b!1375965) bm!65794))

(assert (= (and b!1375968 res!918903) b!1375964))

(assert (= (and b!1375964 res!918906) b!1375969))

(declare-fun m!1259923 () Bool)

(assert (=> bm!65794 m!1259923))

(declare-fun m!1259925 () Bool)

(assert (=> b!1375965 m!1259925))

(declare-fun m!1259927 () Bool)

(assert (=> b!1375965 m!1259927))

(declare-fun m!1259929 () Bool)

(assert (=> b!1375963 m!1259929))

(declare-fun m!1259931 () Bool)

(assert (=> b!1375963 m!1259931))

(declare-fun m!1259933 () Bool)

(assert (=> b!1375963 m!1259933))

(declare-fun m!1259935 () Bool)

(assert (=> b!1375968 m!1259935))

(assert (=> b!1375968 m!1259935))

(declare-fun m!1259937 () Bool)

(assert (=> b!1375968 m!1259937))

(declare-fun m!1259939 () Bool)

(assert (=> b!1375967 m!1259939))

(declare-fun m!1259941 () Bool)

(assert (=> b!1375967 m!1259941))

(declare-fun m!1259943 () Bool)

(assert (=> b!1375964 m!1259943))

(assert (=> b!1375964 m!1259923))

(assert (=> bm!65795 m!1259943))

(declare-fun m!1259945 () Bool)

(assert (=> b!1375969 m!1259945))

(declare-fun m!1259947 () Bool)

(assert (=> b!1375969 m!1259947))

(declare-fun m!1259949 () Bool)

(assert (=> b!1375969 m!1259949))

(declare-fun m!1259951 () Bool)

(assert (=> b!1375966 m!1259951))

(assert (=> b!1375966 m!1259951))

(declare-fun m!1259953 () Bool)

(assert (=> b!1375966 m!1259953))

(declare-fun m!1259955 () Bool)

(assert (=> b!1375962 m!1259955))

(declare-fun m!1259957 () Bool)

(assert (=> start!116748 m!1259957))

(push 1)

(assert (not b!1375969))

(assert (not b!1375965))

(assert (not b!1375967))

(assert (not b!1375964))

(assert (not b!1375966))

(assert (not b!1375968))

(assert (not start!116748))

(assert (not bm!65794))

(assert (not b!1375963))

(assert (not b!1375962))

(assert (not bm!65795))

(check-sat)

(pop 1)

(push 1)

(check-sat)

