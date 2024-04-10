; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117542 () Bool)

(assert start!117542)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun bm!66273 () Bool)

(declare-fun call!66276 () (_ BitVec 32))

(declare-datatypes ((array!94060 0))(
  ( (array!94061 (arr!45423 (Array (_ BitVec 32) (_ BitVec 64))) (size!45973 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94060)

(declare-fun arrayCountValidKeys!0 (array!94060 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66273 (= call!66276 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380544 () Bool)

(declare-fun e!782292 () Bool)

(declare-fun call!66277 () (_ BitVec 32))

(assert (=> b!1380544 (= e!782292 (= call!66276 call!66277))))

(declare-fun lt!607997 () Bool)

(declare-fun e!782294 () Bool)

(declare-fun b!1380545 () Bool)

(assert (=> b!1380545 (= e!782294 (not (or (not lt!607997) (bvsle from!3309 to!105))))))

(assert (=> b!1380545 e!782292))

(declare-fun c!128424 () Bool)

(assert (=> b!1380545 (= c!128424 lt!607997)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380545 (= lt!607997 (validKeyInArray!0 (select (arr!45423 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45977 0))(
  ( (Unit!45978) )
))
(declare-fun lt!607998 () Unit!45977)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94060 (_ BitVec 32) (_ BitVec 32)) Unit!45977)

(assert (=> b!1380545 (= lt!607998 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66274 () Bool)

(assert (=> bm!66274 (= call!66277 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380546 () Bool)

(assert (=> b!1380546 (= e!782292 (= (bvadd #b00000000000000000000000000000001 call!66276) call!66277))))

(declare-fun res!922576 () Bool)

(assert (=> start!117542 (=> (not res!922576) (not e!782294))))

(assert (=> start!117542 (= res!922576 (and (bvslt (size!45973 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45973 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117542 e!782294))

(declare-fun array_inv!34451 (array!94060) Bool)

(assert (=> start!117542 (array_inv!34451 a!3931)))

(assert (=> start!117542 true))

(assert (= (and start!117542 res!922576) b!1380545))

(assert (= (and b!1380545 c!128424) b!1380546))

(assert (= (and b!1380545 (not c!128424)) b!1380544))

(assert (= (or b!1380546 b!1380544) bm!66274))

(assert (= (or b!1380546 b!1380544) bm!66273))

(declare-fun m!1265721 () Bool)

(assert (=> bm!66273 m!1265721))

(declare-fun m!1265723 () Bool)

(assert (=> b!1380545 m!1265723))

(assert (=> b!1380545 m!1265723))

(declare-fun m!1265725 () Bool)

(assert (=> b!1380545 m!1265725))

(declare-fun m!1265727 () Bool)

(assert (=> b!1380545 m!1265727))

(declare-fun m!1265729 () Bool)

(assert (=> bm!66274 m!1265729))

(declare-fun m!1265731 () Bool)

(assert (=> start!117542 m!1265731))

(check-sat (not start!117542) (not bm!66273) (not b!1380545) (not bm!66274))
(check-sat)
