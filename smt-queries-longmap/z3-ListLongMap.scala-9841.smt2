; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116728 () Bool)

(assert start!116728)

(declare-fun bm!65729 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun call!65732 () (_ BitVec 32))

(declare-datatypes ((array!93351 0))(
  ( (array!93352 (arr!45079 (Array (_ BitVec 32) (_ BitVec 64))) (size!45631 (_ BitVec 32))) )
))
(declare-fun lt!604588 () array!93351)

(declare-fun arrayCountValidKeys!0 (array!93351 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65729 (= call!65732 (arrayCountValidKeys!0 lt!604588 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375700 () Bool)

(declare-fun res!918726 () Bool)

(declare-fun e!779349 () Bool)

(assert (=> b!1375700 (=> (not res!918726) (not e!779349))))

(declare-fun a!4032 () array!93351)

(assert (=> b!1375700 (= res!918726 (and (bvslt (size!45631 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45631 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375701 () Bool)

(declare-fun res!918724 () Bool)

(assert (=> b!1375701 (=> (not res!918724) (not e!779349))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375701 (= res!918724 (not (validKeyInArray!0 k0!2947)))))

(declare-fun res!918723 () Bool)

(assert (=> start!116728 (=> (not res!918723) (not e!779349))))

(assert (=> start!116728 (= res!918723 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45631 a!4032))))))

(assert (=> start!116728 e!779349))

(assert (=> start!116728 true))

(declare-fun array_inv!34312 (array!93351) Bool)

(assert (=> start!116728 (array_inv!34312 a!4032)))

(declare-fun b!1375702 () Bool)

(declare-datatypes ((Unit!45414 0))(
  ( (Unit!45415) )
))
(declare-fun e!779347 () Unit!45414)

(declare-fun lt!604584 () Unit!45414)

(assert (=> b!1375702 (= e!779347 lt!604584)))

(declare-fun lt!604591 () Unit!45414)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93351 (_ BitVec 32) (_ BitVec 32)) Unit!45414)

(assert (=> b!1375702 (= lt!604591 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65733 () (_ BitVec 32))

(declare-fun lt!604592 () (_ BitVec 32))

(assert (=> b!1375702 (= call!65733 lt!604592)))

(assert (=> b!1375702 (= lt!604584 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604588 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604585 () (_ BitVec 32))

(assert (=> b!1375702 (= call!65732 lt!604585)))

(declare-fun bm!65730 () Bool)

(assert (=> bm!65730 (= call!65733 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375703 () Bool)

(declare-fun e!779346 () Bool)

(assert (=> b!1375703 (= e!779346 false)))

(declare-fun lt!604583 () (_ BitVec 32))

(assert (=> b!1375703 (= lt!604583 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604590 () (_ BitVec 32))

(assert (=> b!1375703 (= lt!604590 (arrayCountValidKeys!0 lt!604588 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375704 () Bool)

(declare-fun lt!604589 () Unit!45414)

(assert (=> b!1375704 (= e!779347 lt!604589)))

(declare-fun lt!604587 () Unit!45414)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93351 (_ BitVec 32) (_ BitVec 32)) Unit!45414)

(assert (=> b!1375704 (= lt!604587 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375704 (= call!65733 (bvadd #b00000000000000000000000000000001 lt!604592))))

(assert (=> b!1375704 (= lt!604589 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604588 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375704 (= call!65732 (bvadd #b00000000000000000000000000000001 lt!604585))))

(declare-fun b!1375705 () Bool)

(declare-fun res!918725 () Bool)

(assert (=> b!1375705 (=> (not res!918725) (not e!779349))))

(assert (=> b!1375705 (= res!918725 (validKeyInArray!0 (select (arr!45079 a!4032) i!1445)))))

(declare-fun b!1375706 () Bool)

(declare-fun e!779348 () Bool)

(assert (=> b!1375706 (= e!779349 e!779348)))

(declare-fun res!918728 () Bool)

(assert (=> b!1375706 (=> (not res!918728) (not e!779348))))

(assert (=> b!1375706 (= res!918728 (and (= lt!604585 lt!604592) (not (= to!206 (size!45631 a!4032)))))))

(assert (=> b!1375706 (= lt!604592 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375706 (= lt!604585 (arrayCountValidKeys!0 lt!604588 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375706 (= lt!604588 (array!93352 (store (arr!45079 a!4032) i!1445 k0!2947) (size!45631 a!4032)))))

(declare-fun b!1375707 () Bool)

(assert (=> b!1375707 (= e!779348 e!779346)))

(declare-fun res!918727 () Bool)

(assert (=> b!1375707 (=> (not res!918727) (not e!779346))))

(assert (=> b!1375707 (= res!918727 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45631 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604586 () Unit!45414)

(assert (=> b!1375707 (= lt!604586 e!779347)))

(declare-fun c!127931 () Bool)

(assert (=> b!1375707 (= c!127931 (validKeyInArray!0 (select (arr!45079 a!4032) to!206)))))

(assert (= (and start!116728 res!918723) b!1375705))

(assert (= (and b!1375705 res!918725) b!1375701))

(assert (= (and b!1375701 res!918724) b!1375700))

(assert (= (and b!1375700 res!918726) b!1375706))

(assert (= (and b!1375706 res!918728) b!1375707))

(assert (= (and b!1375707 c!127931) b!1375704))

(assert (= (and b!1375707 (not c!127931)) b!1375702))

(assert (= (or b!1375704 b!1375702) bm!65730))

(assert (= (or b!1375704 b!1375702) bm!65729))

(assert (= (and b!1375707 res!918727) b!1375703))

(declare-fun m!1259173 () Bool)

(assert (=> b!1375704 m!1259173))

(declare-fun m!1259175 () Bool)

(assert (=> b!1375704 m!1259175))

(declare-fun m!1259177 () Bool)

(assert (=> b!1375706 m!1259177))

(declare-fun m!1259179 () Bool)

(assert (=> b!1375706 m!1259179))

(declare-fun m!1259181 () Bool)

(assert (=> b!1375706 m!1259181))

(declare-fun m!1259183 () Bool)

(assert (=> b!1375702 m!1259183))

(declare-fun m!1259185 () Bool)

(assert (=> b!1375702 m!1259185))

(declare-fun m!1259187 () Bool)

(assert (=> bm!65729 m!1259187))

(declare-fun m!1259189 () Bool)

(assert (=> b!1375705 m!1259189))

(assert (=> b!1375705 m!1259189))

(declare-fun m!1259191 () Bool)

(assert (=> b!1375705 m!1259191))

(declare-fun m!1259193 () Bool)

(assert (=> b!1375707 m!1259193))

(assert (=> b!1375707 m!1259193))

(declare-fun m!1259195 () Bool)

(assert (=> b!1375707 m!1259195))

(declare-fun m!1259197 () Bool)

(assert (=> b!1375703 m!1259197))

(assert (=> b!1375703 m!1259187))

(assert (=> bm!65730 m!1259197))

(declare-fun m!1259199 () Bool)

(assert (=> b!1375701 m!1259199))

(declare-fun m!1259201 () Bool)

(assert (=> start!116728 m!1259201))

(check-sat (not bm!65729) (not b!1375707) (not b!1375701) (not b!1375702) (not bm!65730) (not b!1375704) (not b!1375703) (not start!116728) (not b!1375705) (not b!1375706))
(check-sat)
