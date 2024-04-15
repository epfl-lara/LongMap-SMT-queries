; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135448 () Bool)

(assert start!135448)

(declare-fun b!1573898 () Bool)

(declare-fun res!1075375 () Bool)

(declare-fun e!877708 () Bool)

(assert (=> b!1573898 (=> (not res!1075375) (not e!877708))))

(declare-datatypes ((array!105140 0))(
  ( (array!105141 (arr!50720 (Array (_ BitVec 32) (_ BitVec 64))) (size!51272 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105140)

(declare-fun i!537 () (_ BitVec 32))

(declare-fun mask!877 () (_ BitVec 32))

(assert (=> b!1573898 (= res!1075375 (and (= (size!51272 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51272 _keys!591)) (bvslt i!537 (size!51272 _keys!591))))))

(declare-fun b!1573901 () Bool)

(declare-fun arrayContainsKey!0 (array!105140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573901 (= e!877708 (not (arrayContainsKey!0 _keys!591 (select (arr!50720 _keys!591) i!537) i!537)))))

(declare-fun b!1573900 () Bool)

(declare-fun res!1075376 () Bool)

(assert (=> b!1573900 (=> (not res!1075376) (not e!877708))))

(assert (=> b!1573900 (= res!1075376 (bvslt (size!51272 _keys!591) #b01111111111111111111111111111111))))

(declare-fun b!1573899 () Bool)

(declare-fun res!1075377 () Bool)

(assert (=> b!1573899 (=> (not res!1075377) (not e!877708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573899 (= res!1075377 (validKeyInArray!0 (select (arr!50720 _keys!591) i!537)))))

(declare-fun res!1075374 () Bool)

(assert (=> start!135448 (=> (not res!1075374) (not e!877708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135448 (= res!1075374 (validMask!0 mask!877))))

(assert (=> start!135448 e!877708))

(assert (=> start!135448 true))

(declare-fun array_inv!39656 (array!105140) Bool)

(assert (=> start!135448 (array_inv!39656 _keys!591)))

(assert (= (and start!135448 res!1075374) b!1573898))

(assert (= (and b!1573898 res!1075375) b!1573899))

(assert (= (and b!1573899 res!1075377) b!1573900))

(assert (= (and b!1573900 res!1075376) b!1573901))

(declare-fun m!1446573 () Bool)

(assert (=> b!1573901 m!1446573))

(assert (=> b!1573901 m!1446573))

(declare-fun m!1446575 () Bool)

(assert (=> b!1573901 m!1446575))

(assert (=> b!1573899 m!1446573))

(assert (=> b!1573899 m!1446573))

(declare-fun m!1446577 () Bool)

(assert (=> b!1573899 m!1446577))

(declare-fun m!1446579 () Bool)

(assert (=> start!135448 m!1446579))

(declare-fun m!1446581 () Bool)

(assert (=> start!135448 m!1446581))

(check-sat (not start!135448) (not b!1573899) (not b!1573901))
(check-sat)
(get-model)

(declare-fun d!164917 () Bool)

(assert (=> d!164917 (= (validMask!0 mask!877) (and (or (= mask!877 #b00000000000000000000000000000111) (= mask!877 #b00000000000000000000000000001111) (= mask!877 #b00000000000000000000000000011111) (= mask!877 #b00000000000000000000000000111111) (= mask!877 #b00000000000000000000000001111111) (= mask!877 #b00000000000000000000000011111111) (= mask!877 #b00000000000000000000000111111111) (= mask!877 #b00000000000000000000001111111111) (= mask!877 #b00000000000000000000011111111111) (= mask!877 #b00000000000000000000111111111111) (= mask!877 #b00000000000000000001111111111111) (= mask!877 #b00000000000000000011111111111111) (= mask!877 #b00000000000000000111111111111111) (= mask!877 #b00000000000000001111111111111111) (= mask!877 #b00000000000000011111111111111111) (= mask!877 #b00000000000000111111111111111111) (= mask!877 #b00000000000001111111111111111111) (= mask!877 #b00000000000011111111111111111111) (= mask!877 #b00000000000111111111111111111111) (= mask!877 #b00000000001111111111111111111111) (= mask!877 #b00000000011111111111111111111111) (= mask!877 #b00000000111111111111111111111111) (= mask!877 #b00000001111111111111111111111111) (= mask!877 #b00000011111111111111111111111111) (= mask!877 #b00000111111111111111111111111111) (= mask!877 #b00001111111111111111111111111111) (= mask!877 #b00011111111111111111111111111111) (= mask!877 #b00111111111111111111111111111111)) (bvsle mask!877 #b00111111111111111111111111111111)))))

(assert (=> start!135448 d!164917))

(declare-fun d!164929 () Bool)

(assert (=> d!164929 (= (array_inv!39656 _keys!591) (bvsge (size!51272 _keys!591) #b00000000000000000000000000000000))))

(assert (=> start!135448 d!164929))

(declare-fun d!164931 () Bool)

(assert (=> d!164931 (= (validKeyInArray!0 (select (arr!50720 _keys!591) i!537)) (and (not (= (select (arr!50720 _keys!591) i!537) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50720 _keys!591) i!537) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573899 d!164931))

(declare-fun d!164933 () Bool)

(declare-fun res!1075418 () Bool)

(declare-fun e!877738 () Bool)

(assert (=> d!164933 (=> res!1075418 e!877738)))

(assert (=> d!164933 (= res!1075418 (= (select (arr!50720 _keys!591) i!537) (select (arr!50720 _keys!591) i!537)))))

(assert (=> d!164933 (= (arrayContainsKey!0 _keys!591 (select (arr!50720 _keys!591) i!537) i!537) e!877738)))

(declare-fun b!1573942 () Bool)

(declare-fun e!877739 () Bool)

(assert (=> b!1573942 (= e!877738 e!877739)))

(declare-fun res!1075419 () Bool)

(assert (=> b!1573942 (=> (not res!1075419) (not e!877739))))

(assert (=> b!1573942 (= res!1075419 (bvslt (bvadd i!537 #b00000000000000000000000000000001) (size!51272 _keys!591)))))

(declare-fun b!1573943 () Bool)

(assert (=> b!1573943 (= e!877739 (arrayContainsKey!0 _keys!591 (select (arr!50720 _keys!591) i!537) (bvadd i!537 #b00000000000000000000000000000001)))))

(assert (= (and d!164933 (not res!1075418)) b!1573942))

(assert (= (and b!1573942 res!1075419) b!1573943))

(assert (=> d!164933 m!1446573))

(assert (=> b!1573943 m!1446573))

(declare-fun m!1446607 () Bool)

(assert (=> b!1573943 m!1446607))

(assert (=> b!1573901 d!164933))

(check-sat (not b!1573943))
(check-sat)
