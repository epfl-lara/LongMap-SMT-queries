; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116842 () Bool)

(assert start!116842)

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93511 0))(
  ( (array!93512 (arr!45159 (Array (_ BitVec 32) (_ BitVec 64))) (size!45709 (_ BitVec 32))) )
))
(declare-fun lt!605438 () array!93511)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun bm!65860 () Bool)

(declare-fun call!65863 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93511 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65860 (= call!65863 (arrayCountValidKeys!0 lt!605438 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376861 () Bool)

(declare-fun e!779924 () Bool)

(assert (=> b!1376861 (= e!779924 false)))

(declare-datatypes ((Unit!45635 0))(
  ( (Unit!45636) )
))
(declare-fun lt!605434 () Unit!45635)

(declare-fun e!779925 () Unit!45635)

(assert (=> b!1376861 (= lt!605434 e!779925)))

(declare-fun c!128003 () Bool)

(declare-fun a!4032 () array!93511)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376861 (= c!128003 (validKeyInArray!0 (select (arr!45159 a!4032) to!206)))))

(declare-fun b!1376862 () Bool)

(declare-fun res!919737 () Bool)

(declare-fun e!779923 () Bool)

(assert (=> b!1376862 (=> (not res!919737) (not e!779923))))

(assert (=> b!1376862 (= res!919737 (validKeyInArray!0 (select (arr!45159 a!4032) i!1445)))))

(declare-fun b!1376863 () Bool)

(declare-fun lt!605439 () Unit!45635)

(assert (=> b!1376863 (= e!779925 lt!605439)))

(declare-fun lt!605436 () Unit!45635)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93511 (_ BitVec 32) (_ BitVec 32)) Unit!45635)

(assert (=> b!1376863 (= lt!605436 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65864 () (_ BitVec 32))

(declare-fun lt!605433 () (_ BitVec 32))

(assert (=> b!1376863 (= call!65864 lt!605433)))

(assert (=> b!1376863 (= lt!605439 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605438 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605435 () (_ BitVec 32))

(assert (=> b!1376863 (= call!65863 lt!605435)))

(declare-fun res!919734 () Bool)

(assert (=> start!116842 (=> (not res!919734) (not e!779923))))

(assert (=> start!116842 (= res!919734 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45709 a!4032))))))

(assert (=> start!116842 e!779923))

(assert (=> start!116842 true))

(declare-fun array_inv!34187 (array!93511) Bool)

(assert (=> start!116842 (array_inv!34187 a!4032)))

(declare-fun b!1376860 () Bool)

(declare-fun res!919735 () Bool)

(assert (=> b!1376860 (=> (not res!919735) (not e!779923))))

(assert (=> b!1376860 (= res!919735 (and (bvslt (size!45709 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45709 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376864 () Bool)

(assert (=> b!1376864 (= e!779923 e!779924)))

(declare-fun res!919736 () Bool)

(assert (=> b!1376864 (=> (not res!919736) (not e!779924))))

(assert (=> b!1376864 (= res!919736 (and (= lt!605435 lt!605433) (not (= to!206 (size!45709 a!4032)))))))

(assert (=> b!1376864 (= lt!605433 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376864 (= lt!605435 (arrayCountValidKeys!0 lt!605438 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376864 (= lt!605438 (array!93512 (store (arr!45159 a!4032) i!1445 k0!2947) (size!45709 a!4032)))))

(declare-fun b!1376865 () Bool)

(declare-fun lt!605437 () Unit!45635)

(assert (=> b!1376865 (= e!779925 lt!605437)))

(declare-fun lt!605440 () Unit!45635)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93511 (_ BitVec 32) (_ BitVec 32)) Unit!45635)

(assert (=> b!1376865 (= lt!605440 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376865 (= call!65864 (bvadd #b00000000000000000000000000000001 lt!605433))))

(assert (=> b!1376865 (= lt!605437 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605438 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376865 (= call!65863 (bvadd #b00000000000000000000000000000001 lt!605435))))

(declare-fun b!1376866 () Bool)

(declare-fun res!919738 () Bool)

(assert (=> b!1376866 (=> (not res!919738) (not e!779923))))

(assert (=> b!1376866 (= res!919738 (not (validKeyInArray!0 k0!2947)))))

(declare-fun bm!65861 () Bool)

(assert (=> bm!65861 (= call!65864 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116842 res!919734) b!1376862))

(assert (= (and b!1376862 res!919737) b!1376866))

(assert (= (and b!1376866 res!919738) b!1376860))

(assert (= (and b!1376860 res!919735) b!1376864))

(assert (= (and b!1376864 res!919736) b!1376861))

(assert (= (and b!1376861 c!128003) b!1376865))

(assert (= (and b!1376861 (not c!128003)) b!1376863))

(assert (= (or b!1376865 b!1376863) bm!65860))

(assert (= (or b!1376865 b!1376863) bm!65861))

(declare-fun m!1260961 () Bool)

(assert (=> b!1376865 m!1260961))

(declare-fun m!1260963 () Bool)

(assert (=> b!1376865 m!1260963))

(declare-fun m!1260965 () Bool)

(assert (=> bm!65860 m!1260965))

(declare-fun m!1260967 () Bool)

(assert (=> b!1376866 m!1260967))

(declare-fun m!1260969 () Bool)

(assert (=> b!1376864 m!1260969))

(declare-fun m!1260971 () Bool)

(assert (=> b!1376864 m!1260971))

(declare-fun m!1260973 () Bool)

(assert (=> b!1376864 m!1260973))

(declare-fun m!1260975 () Bool)

(assert (=> start!116842 m!1260975))

(declare-fun m!1260977 () Bool)

(assert (=> bm!65861 m!1260977))

(declare-fun m!1260979 () Bool)

(assert (=> b!1376862 m!1260979))

(assert (=> b!1376862 m!1260979))

(declare-fun m!1260981 () Bool)

(assert (=> b!1376862 m!1260981))

(declare-fun m!1260983 () Bool)

(assert (=> b!1376861 m!1260983))

(assert (=> b!1376861 m!1260983))

(declare-fun m!1260985 () Bool)

(assert (=> b!1376861 m!1260985))

(declare-fun m!1260987 () Bool)

(assert (=> b!1376863 m!1260987))

(declare-fun m!1260989 () Bool)

(assert (=> b!1376863 m!1260989))

(check-sat (not b!1376862) (not b!1376861) (not start!116842) (not b!1376864) (not b!1376863) (not bm!65861) (not b!1376866) (not bm!65860) (not b!1376865))
(check-sat)
