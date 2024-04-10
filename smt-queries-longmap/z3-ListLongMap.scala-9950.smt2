; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117560 () Bool)

(assert start!117560)

(declare-fun b!1380625 () Bool)

(declare-fun e!782374 () Bool)

(declare-fun call!66330 () (_ BitVec 32))

(declare-fun call!66331 () (_ BitVec 32))

(assert (=> b!1380625 (= e!782374 (= (bvadd #b00000000000000000000000000000001 call!66330) call!66331))))

(declare-fun res!922603 () Bool)

(declare-fun e!782373 () Bool)

(assert (=> start!117560 (=> (not res!922603) (not e!782373))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94078 0))(
  ( (array!94079 (arr!45432 (Array (_ BitVec 32) (_ BitVec 64))) (size!45982 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94078)

(assert (=> start!117560 (= res!922603 (and (bvslt (size!45982 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45982 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117560 e!782373))

(declare-fun array_inv!34460 (array!94078) Bool)

(assert (=> start!117560 (array_inv!34460 a!3931)))

(assert (=> start!117560 true))

(declare-fun b!1380626 () Bool)

(assert (=> b!1380626 (= e!782373 (not true))))

(assert (=> b!1380626 e!782374))

(declare-fun c!128451 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380626 (= c!128451 (validKeyInArray!0 (select (arr!45432 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45995 0))(
  ( (Unit!45996) )
))
(declare-fun lt!608037 () Unit!45995)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94078 (_ BitVec 32) (_ BitVec 32)) Unit!45995)

(assert (=> b!1380626 (= lt!608037 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66327 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94078 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66327 (= call!66330 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun bm!66328 () Bool)

(assert (=> bm!66328 (= call!66331 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380627 () Bool)

(assert (=> b!1380627 (= e!782374 (= call!66330 call!66331))))

(assert (= (and start!117560 res!922603) b!1380626))

(assert (= (and b!1380626 c!128451) b!1380625))

(assert (= (and b!1380626 (not c!128451)) b!1380627))

(assert (= (or b!1380625 b!1380627) bm!66328))

(assert (= (or b!1380625 b!1380627) bm!66327))

(declare-fun m!1265829 () Bool)

(assert (=> start!117560 m!1265829))

(declare-fun m!1265831 () Bool)

(assert (=> b!1380626 m!1265831))

(assert (=> b!1380626 m!1265831))

(declare-fun m!1265833 () Bool)

(assert (=> b!1380626 m!1265833))

(declare-fun m!1265835 () Bool)

(assert (=> b!1380626 m!1265835))

(declare-fun m!1265837 () Bool)

(assert (=> bm!66327 m!1265837))

(declare-fun m!1265839 () Bool)

(assert (=> bm!66328 m!1265839))

(check-sat (not bm!66328) (not start!117560) (not bm!66327) (not b!1380626))
