; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117562 () Bool)

(assert start!117562)

(declare-fun res!922606 () Bool)

(declare-fun e!782382 () Bool)

(assert (=> start!117562 (=> (not res!922606) (not e!782382))))

(declare-fun to!105 () (_ BitVec 32))

(declare-datatypes ((array!94080 0))(
  ( (array!94081 (arr!45433 (Array (_ BitVec 32) (_ BitVec 64))) (size!45983 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94080)

(declare-fun from!3309 () (_ BitVec 32))

(assert (=> start!117562 (= res!922606 (and (bvslt (size!45983 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45983 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117562 e!782382))

(declare-fun array_inv!34461 (array!94080) Bool)

(assert (=> start!117562 (array_inv!34461 a!3931)))

(assert (=> start!117562 true))

(declare-fun b!1380634 () Bool)

(declare-fun e!782384 () Bool)

(declare-fun call!66336 () (_ BitVec 32))

(declare-fun call!66337 () (_ BitVec 32))

(assert (=> b!1380634 (= e!782384 (= (bvadd #b00000000000000000000000000000001 call!66336) call!66337))))

(declare-fun b!1380635 () Bool)

(assert (=> b!1380635 (= e!782384 (= call!66336 call!66337))))

(declare-fun bm!66333 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94080 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66333 (= call!66337 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380636 () Bool)

(assert (=> b!1380636 (= e!782382 (not true))))

(assert (=> b!1380636 e!782384))

(declare-fun c!128454 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380636 (= c!128454 (validKeyInArray!0 (select (arr!45433 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45997 0))(
  ( (Unit!45998) )
))
(declare-fun lt!608040 () Unit!45997)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94080 (_ BitVec 32) (_ BitVec 32)) Unit!45997)

(assert (=> b!1380636 (= lt!608040 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66334 () Bool)

(assert (=> bm!66334 (= call!66336 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (= (and start!117562 res!922606) b!1380636))

(assert (= (and b!1380636 c!128454) b!1380634))

(assert (= (and b!1380636 (not c!128454)) b!1380635))

(assert (= (or b!1380634 b!1380635) bm!66333))

(assert (= (or b!1380634 b!1380635) bm!66334))

(declare-fun m!1265841 () Bool)

(assert (=> start!117562 m!1265841))

(declare-fun m!1265843 () Bool)

(assert (=> bm!66333 m!1265843))

(declare-fun m!1265845 () Bool)

(assert (=> b!1380636 m!1265845))

(assert (=> b!1380636 m!1265845))

(declare-fun m!1265847 () Bool)

(assert (=> b!1380636 m!1265847))

(declare-fun m!1265849 () Bool)

(assert (=> b!1380636 m!1265849))

(declare-fun m!1265851 () Bool)

(assert (=> bm!66334 m!1265851))

(push 1)

(assert (not b!1380636))

(assert (not start!117562))

(assert (not bm!66333))

(assert (not bm!66334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

