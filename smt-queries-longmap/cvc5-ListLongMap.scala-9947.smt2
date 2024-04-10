; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117540 () Bool)

(assert start!117540)

(declare-fun lt!607992 () Bool)

(declare-fun e!782285 () Bool)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun b!1380535 () Bool)

(assert (=> b!1380535 (= e!782285 (not (or (not lt!607992) (bvsle from!3309 to!105))))))

(declare-fun e!782284 () Bool)

(assert (=> b!1380535 e!782284))

(declare-fun c!128421 () Bool)

(assert (=> b!1380535 (= c!128421 lt!607992)))

(declare-datatypes ((array!94058 0))(
  ( (array!94059 (arr!45422 (Array (_ BitVec 32) (_ BitVec 64))) (size!45972 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94058)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380535 (= lt!607992 (validKeyInArray!0 (select (arr!45422 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45975 0))(
  ( (Unit!45976) )
))
(declare-fun lt!607991 () Unit!45975)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94058 (_ BitVec 32) (_ BitVec 32)) Unit!45975)

(assert (=> b!1380535 (= lt!607991 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!922573 () Bool)

(assert (=> start!117540 (=> (not res!922573) (not e!782285))))

(assert (=> start!117540 (= res!922573 (and (bvslt (size!45972 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45972 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117540 e!782285))

(declare-fun array_inv!34450 (array!94058) Bool)

(assert (=> start!117540 (array_inv!34450 a!3931)))

(assert (=> start!117540 true))

(declare-fun b!1380536 () Bool)

(declare-fun call!66271 () (_ BitVec 32))

(declare-fun call!66270 () (_ BitVec 32))

(assert (=> b!1380536 (= e!782284 (= call!66271 call!66270))))

(declare-fun bm!66267 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94058 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66267 (= call!66270 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66268 () Bool)

(assert (=> bm!66268 (= call!66271 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380537 () Bool)

(assert (=> b!1380537 (= e!782284 (= (bvadd #b00000000000000000000000000000001 call!66271) call!66270))))

(assert (= (and start!117540 res!922573) b!1380535))

(assert (= (and b!1380535 c!128421) b!1380537))

(assert (= (and b!1380535 (not c!128421)) b!1380536))

(assert (= (or b!1380537 b!1380536) bm!66267))

(assert (= (or b!1380537 b!1380536) bm!66268))

(declare-fun m!1265709 () Bool)

(assert (=> b!1380535 m!1265709))

(assert (=> b!1380535 m!1265709))

(declare-fun m!1265711 () Bool)

(assert (=> b!1380535 m!1265711))

(declare-fun m!1265713 () Bool)

(assert (=> b!1380535 m!1265713))

(declare-fun m!1265715 () Bool)

(assert (=> start!117540 m!1265715))

(declare-fun m!1265717 () Bool)

(assert (=> bm!66267 m!1265717))

(declare-fun m!1265719 () Bool)

(assert (=> bm!66268 m!1265719))

(push 1)

(assert (not start!117540))

(assert (not b!1380535))

(assert (not bm!66267))

(assert (not bm!66268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

