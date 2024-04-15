; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117536 () Bool)

(assert start!117536)

(declare-fun b!1380466 () Bool)

(declare-fun e!782254 () Bool)

(declare-fun call!66252 () (_ BitVec 32))

(declare-fun call!66251 () (_ BitVec 32))

(assert (=> b!1380466 (= e!782254 (= call!66252 call!66251))))

(declare-fun res!922547 () Bool)

(declare-fun e!782253 () Bool)

(assert (=> start!117536 (=> (not res!922547) (not e!782253))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94008 0))(
  ( (array!94009 (arr!45397 (Array (_ BitVec 32) (_ BitVec 64))) (size!45949 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94008)

(assert (=> start!117536 (= res!922547 (and (bvslt (size!45949 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45949 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117536 e!782253))

(declare-fun array_inv!34630 (array!94008) Bool)

(assert (=> start!117536 (array_inv!34630 a!3931)))

(assert (=> start!117536 true))

(declare-fun bm!66248 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94008 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66248 (= call!66251 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun lt!607807 () Bool)

(declare-fun b!1380467 () Bool)

(assert (=> b!1380467 (= e!782253 (not (or (not lt!607807) (bvsle from!3309 to!105))))))

(assert (=> b!1380467 e!782254))

(declare-fun c!128402 () Bool)

(assert (=> b!1380467 (= c!128402 lt!607807)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380467 (= lt!607807 (validKeyInArray!0 (select (arr!45397 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45816 0))(
  ( (Unit!45817) )
))
(declare-fun lt!607808 () Unit!45816)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94008 (_ BitVec 32) (_ BitVec 32)) Unit!45816)

(assert (=> b!1380467 (= lt!607808 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66249 () Bool)

(assert (=> bm!66249 (= call!66252 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380468 () Bool)

(assert (=> b!1380468 (= e!782254 (= (bvadd #b00000000000000000000000000000001 call!66252) call!66251))))

(assert (= (and start!117536 res!922547) b!1380467))

(assert (= (and b!1380467 c!128402) b!1380468))

(assert (= (and b!1380467 (not c!128402)) b!1380466))

(assert (= (or b!1380468 b!1380466) bm!66248))

(assert (= (or b!1380468 b!1380466) bm!66249))

(declare-fun m!1265205 () Bool)

(assert (=> start!117536 m!1265205))

(declare-fun m!1265207 () Bool)

(assert (=> bm!66248 m!1265207))

(declare-fun m!1265209 () Bool)

(assert (=> b!1380467 m!1265209))

(assert (=> b!1380467 m!1265209))

(declare-fun m!1265211 () Bool)

(assert (=> b!1380467 m!1265211))

(declare-fun m!1265213 () Bool)

(assert (=> b!1380467 m!1265213))

(declare-fun m!1265215 () Bool)

(assert (=> bm!66249 m!1265215))

(check-sat (not bm!66248) (not b!1380467) (not bm!66249) (not start!117536))
(check-sat)
