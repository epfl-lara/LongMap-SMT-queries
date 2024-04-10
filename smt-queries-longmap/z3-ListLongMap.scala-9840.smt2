; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116728 () Bool)

(assert start!116728)

(declare-fun b!1375713 () Bool)

(declare-fun res!918716 () Bool)

(declare-fun e!779346 () Bool)

(assert (=> b!1375713 (=> (not res!918716) (not e!779346))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93397 0))(
  ( (array!93398 (arr!45102 (Array (_ BitVec 32) (_ BitVec 64))) (size!45652 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93397)

(assert (=> b!1375713 (= res!918716 (and (bvslt (size!45652 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45652 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375714 () Bool)

(declare-fun e!779347 () Bool)

(assert (=> b!1375714 (= e!779347 false)))

(declare-fun lt!604707 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93397 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375714 (= lt!604707 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604708 () (_ BitVec 32))

(declare-fun lt!604706 () array!93397)

(assert (=> b!1375714 (= lt!604708 (arrayCountValidKeys!0 lt!604706 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun call!65737 () (_ BitVec 32))

(declare-fun bm!65734 () Bool)

(assert (=> bm!65734 (= call!65737 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!918718 () Bool)

(assert (=> start!116728 (=> (not res!918718) (not e!779346))))

(assert (=> start!116728 (= res!918718 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45652 a!4032))))))

(assert (=> start!116728 e!779346))

(assert (=> start!116728 true))

(declare-fun array_inv!34130 (array!93397) Bool)

(assert (=> start!116728 (array_inv!34130 a!4032)))

(declare-fun b!1375715 () Bool)

(declare-datatypes ((Unit!45569 0))(
  ( (Unit!45570) )
))
(declare-fun e!779343 () Unit!45569)

(declare-fun lt!604713 () Unit!45569)

(assert (=> b!1375715 (= e!779343 lt!604713)))

(declare-fun lt!604709 () Unit!45569)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93397 (_ BitVec 32) (_ BitVec 32)) Unit!45569)

(assert (=> b!1375715 (= lt!604709 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604714 () (_ BitVec 32))

(assert (=> b!1375715 (= call!65737 lt!604714)))

(assert (=> b!1375715 (= lt!604713 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604706 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65738 () (_ BitVec 32))

(declare-fun lt!604711 () (_ BitVec 32))

(assert (=> b!1375715 (= call!65738 lt!604711)))

(declare-fun b!1375716 () Bool)

(declare-fun lt!604712 () Unit!45569)

(assert (=> b!1375716 (= e!779343 lt!604712)))

(declare-fun lt!604710 () Unit!45569)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93397 (_ BitVec 32) (_ BitVec 32)) Unit!45569)

(assert (=> b!1375716 (= lt!604710 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375716 (= call!65737 (bvadd #b00000000000000000000000000000001 lt!604714))))

(assert (=> b!1375716 (= lt!604712 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604706 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375716 (= call!65738 (bvadd #b00000000000000000000000000000001 lt!604711))))

(declare-fun b!1375717 () Bool)

(declare-fun e!779345 () Bool)

(assert (=> b!1375717 (= e!779345 e!779347)))

(declare-fun res!918717 () Bool)

(assert (=> b!1375717 (=> (not res!918717) (not e!779347))))

(assert (=> b!1375717 (= res!918717 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45652 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604705 () Unit!45569)

(assert (=> b!1375717 (= lt!604705 e!779343)))

(declare-fun c!127940 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375717 (= c!127940 (validKeyInArray!0 (select (arr!45102 a!4032) to!206)))))

(declare-fun bm!65735 () Bool)

(assert (=> bm!65735 (= call!65738 (arrayCountValidKeys!0 lt!604706 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375718 () Bool)

(assert (=> b!1375718 (= e!779346 e!779345)))

(declare-fun res!918715 () Bool)

(assert (=> b!1375718 (=> (not res!918715) (not e!779345))))

(assert (=> b!1375718 (= res!918715 (and (= lt!604711 lt!604714) (not (= to!206 (size!45652 a!4032)))))))

(assert (=> b!1375718 (= lt!604714 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375718 (= lt!604711 (arrayCountValidKeys!0 lt!604706 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375718 (= lt!604706 (array!93398 (store (arr!45102 a!4032) i!1445 k0!2947) (size!45652 a!4032)))))

(declare-fun b!1375719 () Bool)

(declare-fun res!918714 () Bool)

(assert (=> b!1375719 (=> (not res!918714) (not e!779346))))

(assert (=> b!1375719 (= res!918714 (validKeyInArray!0 (select (arr!45102 a!4032) i!1445)))))

(declare-fun b!1375720 () Bool)

(declare-fun res!918713 () Bool)

(assert (=> b!1375720 (=> (not res!918713) (not e!779346))))

(assert (=> b!1375720 (= res!918713 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!116728 res!918718) b!1375719))

(assert (= (and b!1375719 res!918714) b!1375720))

(assert (= (and b!1375720 res!918713) b!1375713))

(assert (= (and b!1375713 res!918716) b!1375718))

(assert (= (and b!1375718 res!918715) b!1375717))

(assert (= (and b!1375717 c!127940) b!1375716))

(assert (= (and b!1375717 (not c!127940)) b!1375715))

(assert (= (or b!1375716 b!1375715) bm!65735))

(assert (= (or b!1375716 b!1375715) bm!65734))

(assert (= (and b!1375717 res!918717) b!1375714))

(declare-fun m!1259611 () Bool)

(assert (=> start!116728 m!1259611))

(declare-fun m!1259613 () Bool)

(assert (=> b!1375720 m!1259613))

(declare-fun m!1259615 () Bool)

(assert (=> b!1375717 m!1259615))

(assert (=> b!1375717 m!1259615))

(declare-fun m!1259617 () Bool)

(assert (=> b!1375717 m!1259617))

(declare-fun m!1259619 () Bool)

(assert (=> b!1375719 m!1259619))

(assert (=> b!1375719 m!1259619))

(declare-fun m!1259621 () Bool)

(assert (=> b!1375719 m!1259621))

(declare-fun m!1259623 () Bool)

(assert (=> b!1375718 m!1259623))

(declare-fun m!1259625 () Bool)

(assert (=> b!1375718 m!1259625))

(declare-fun m!1259627 () Bool)

(assert (=> b!1375718 m!1259627))

(declare-fun m!1259629 () Bool)

(assert (=> b!1375716 m!1259629))

(declare-fun m!1259631 () Bool)

(assert (=> b!1375716 m!1259631))

(declare-fun m!1259633 () Bool)

(assert (=> b!1375715 m!1259633))

(declare-fun m!1259635 () Bool)

(assert (=> b!1375715 m!1259635))

(declare-fun m!1259637 () Bool)

(assert (=> bm!65735 m!1259637))

(declare-fun m!1259639 () Bool)

(assert (=> bm!65734 m!1259639))

(assert (=> b!1375714 m!1259639))

(assert (=> b!1375714 m!1259637))

(check-sat (not start!116728) (not b!1375717) (not bm!65734) (not bm!65735) (not b!1375718) (not b!1375716) (not b!1375719) (not b!1375720) (not b!1375715) (not b!1375714))
