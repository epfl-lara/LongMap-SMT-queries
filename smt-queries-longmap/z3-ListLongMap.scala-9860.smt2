; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116842 () Bool)

(assert start!116842)

(declare-fun bm!65855 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93465 0))(
  ( (array!93466 (arr!45136 (Array (_ BitVec 32) (_ BitVec 64))) (size!45688 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93465)

(declare-fun call!65858 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93465 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65855 (= call!65858 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376841 () Bool)

(declare-fun res!919741 () Bool)

(declare-fun e!779922 () Bool)

(assert (=> b!1376841 (=> (not res!919741) (not e!779922))))

(assert (=> b!1376841 (= res!919741 (and (bvslt (size!45688 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45688 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919740 () Bool)

(assert (=> start!116842 (=> (not res!919740) (not e!779922))))

(assert (=> start!116842 (= res!919740 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45688 a!4032))))))

(assert (=> start!116842 e!779922))

(assert (=> start!116842 true))

(declare-fun array_inv!34369 (array!93465) Bool)

(assert (=> start!116842 (array_inv!34369 a!4032)))

(declare-fun call!65859 () (_ BitVec 32))

(declare-fun lt!605302 () array!93465)

(declare-fun bm!65856 () Bool)

(assert (=> bm!65856 (= call!65859 (arrayCountValidKeys!0 lt!605302 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376842 () Bool)

(declare-datatypes ((Unit!45480 0))(
  ( (Unit!45481) )
))
(declare-fun e!779920 () Unit!45480)

(declare-fun lt!605304 () Unit!45480)

(assert (=> b!1376842 (= e!779920 lt!605304)))

(declare-fun lt!605303 () Unit!45480)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93465 (_ BitVec 32) (_ BitVec 32)) Unit!45480)

(assert (=> b!1376842 (= lt!605303 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605301 () (_ BitVec 32))

(assert (=> b!1376842 (= call!65858 lt!605301)))

(assert (=> b!1376842 (= lt!605304 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605302 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605300 () (_ BitVec 32))

(assert (=> b!1376842 (= call!65859 lt!605300)))

(declare-fun b!1376843 () Bool)

(declare-fun e!779921 () Bool)

(assert (=> b!1376843 (= e!779922 e!779921)))

(declare-fun res!919739 () Bool)

(assert (=> b!1376843 (=> (not res!919739) (not e!779921))))

(assert (=> b!1376843 (= res!919739 (and (= lt!605300 lt!605301) (not (= to!206 (size!45688 a!4032)))))))

(assert (=> b!1376843 (= lt!605301 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376843 (= lt!605300 (arrayCountValidKeys!0 lt!605302 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376843 (= lt!605302 (array!93466 (store (arr!45136 a!4032) i!1445 k0!2947) (size!45688 a!4032)))))

(declare-fun b!1376844 () Bool)

(assert (=> b!1376844 (= e!779921 false)))

(declare-fun lt!605299 () Unit!45480)

(assert (=> b!1376844 (= lt!605299 e!779920)))

(declare-fun c!127994 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376844 (= c!127994 (validKeyInArray!0 (select (arr!45136 a!4032) to!206)))))

(declare-fun b!1376845 () Bool)

(declare-fun res!919742 () Bool)

(assert (=> b!1376845 (=> (not res!919742) (not e!779922))))

(assert (=> b!1376845 (= res!919742 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376846 () Bool)

(declare-fun lt!605305 () Unit!45480)

(assert (=> b!1376846 (= e!779920 lt!605305)))

(declare-fun lt!605306 () Unit!45480)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93465 (_ BitVec 32) (_ BitVec 32)) Unit!45480)

(assert (=> b!1376846 (= lt!605306 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376846 (= call!65858 (bvadd #b00000000000000000000000000000001 lt!605301))))

(assert (=> b!1376846 (= lt!605305 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605302 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376846 (= call!65859 (bvadd #b00000000000000000000000000000001 lt!605300))))

(declare-fun b!1376847 () Bool)

(declare-fun res!919738 () Bool)

(assert (=> b!1376847 (=> (not res!919738) (not e!779922))))

(assert (=> b!1376847 (= res!919738 (validKeyInArray!0 (select (arr!45136 a!4032) i!1445)))))

(assert (= (and start!116842 res!919740) b!1376847))

(assert (= (and b!1376847 res!919738) b!1376845))

(assert (= (and b!1376845 res!919742) b!1376841))

(assert (= (and b!1376841 res!919741) b!1376843))

(assert (= (and b!1376843 res!919739) b!1376844))

(assert (= (and b!1376844 c!127994) b!1376846))

(assert (= (and b!1376844 (not c!127994)) b!1376842))

(assert (= (or b!1376846 b!1376842) bm!65855))

(assert (= (or b!1376846 b!1376842) bm!65856))

(declare-fun m!1260527 () Bool)

(assert (=> b!1376842 m!1260527))

(declare-fun m!1260529 () Bool)

(assert (=> b!1376842 m!1260529))

(declare-fun m!1260531 () Bool)

(assert (=> start!116842 m!1260531))

(declare-fun m!1260533 () Bool)

(assert (=> b!1376847 m!1260533))

(assert (=> b!1376847 m!1260533))

(declare-fun m!1260535 () Bool)

(assert (=> b!1376847 m!1260535))

(declare-fun m!1260537 () Bool)

(assert (=> bm!65856 m!1260537))

(declare-fun m!1260539 () Bool)

(assert (=> b!1376845 m!1260539))

(declare-fun m!1260541 () Bool)

(assert (=> b!1376844 m!1260541))

(assert (=> b!1376844 m!1260541))

(declare-fun m!1260543 () Bool)

(assert (=> b!1376844 m!1260543))

(declare-fun m!1260545 () Bool)

(assert (=> b!1376843 m!1260545))

(declare-fun m!1260547 () Bool)

(assert (=> b!1376843 m!1260547))

(declare-fun m!1260549 () Bool)

(assert (=> b!1376843 m!1260549))

(declare-fun m!1260551 () Bool)

(assert (=> bm!65855 m!1260551))

(declare-fun m!1260553 () Bool)

(assert (=> b!1376846 m!1260553))

(declare-fun m!1260555 () Bool)

(assert (=> b!1376846 m!1260555))

(check-sat (not b!1376843) (not b!1376845) (not b!1376846) (not start!116842) (not bm!65855) (not b!1376842) (not b!1376844) (not bm!65856) (not b!1376847))
(check-sat)
