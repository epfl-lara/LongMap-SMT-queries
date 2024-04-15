; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117556 () Bool)

(assert start!117556)

(declare-fun b!1380556 () Bool)

(declare-fun e!782344 () Bool)

(assert (=> b!1380556 (= e!782344 (not true))))

(declare-fun e!782343 () Bool)

(assert (=> b!1380556 e!782343))

(declare-fun c!128432 () Bool)

(declare-datatypes ((array!94028 0))(
  ( (array!94029 (arr!45407 (Array (_ BitVec 32) (_ BitVec 64))) (size!45959 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94028)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380556 (= c!128432 (validKeyInArray!0 (select (arr!45407 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((Unit!45836 0))(
  ( (Unit!45837) )
))
(declare-fun lt!607853 () Unit!45836)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94028 (_ BitVec 32) (_ BitVec 32)) Unit!45836)

(assert (=> b!1380556 (= lt!607853 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!922577 () Bool)

(assert (=> start!117556 (=> (not res!922577) (not e!782344))))

(assert (=> start!117556 (= res!922577 (and (bvslt (size!45959 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45959 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117556 e!782344))

(declare-fun array_inv!34640 (array!94028) Bool)

(assert (=> start!117556 (array_inv!34640 a!3931)))

(assert (=> start!117556 true))

(declare-fun b!1380557 () Bool)

(declare-fun call!66311 () (_ BitVec 32))

(declare-fun call!66312 () (_ BitVec 32))

(assert (=> b!1380557 (= e!782343 (= (bvadd #b00000000000000000000000000000001 call!66311) call!66312))))

(declare-fun bm!66308 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94028 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66308 (= call!66311 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380558 () Bool)

(assert (=> b!1380558 (= e!782343 (= call!66311 call!66312))))

(declare-fun bm!66309 () Bool)

(assert (=> bm!66309 (= call!66312 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (= (and start!117556 res!922577) b!1380556))

(assert (= (and b!1380556 c!128432) b!1380557))

(assert (= (and b!1380556 (not c!128432)) b!1380558))

(assert (= (or b!1380557 b!1380558) bm!66309))

(assert (= (or b!1380557 b!1380558) bm!66308))

(declare-fun m!1265325 () Bool)

(assert (=> b!1380556 m!1265325))

(assert (=> b!1380556 m!1265325))

(declare-fun m!1265327 () Bool)

(assert (=> b!1380556 m!1265327))

(declare-fun m!1265329 () Bool)

(assert (=> b!1380556 m!1265329))

(declare-fun m!1265331 () Bool)

(assert (=> start!117556 m!1265331))

(declare-fun m!1265333 () Bool)

(assert (=> bm!66308 m!1265333))

(declare-fun m!1265335 () Bool)

(assert (=> bm!66309 m!1265335))

(push 1)

(assert (not bm!66309))

(assert (not b!1380556))

(assert (not bm!66308))

(assert (not start!117556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

