; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117546 () Bool)

(assert start!117546)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun bm!66278 () Bool)

(declare-fun call!66282 () (_ BitVec 32))

(declare-datatypes ((array!94018 0))(
  ( (array!94019 (arr!45402 (Array (_ BitVec 32) (_ BitVec 64))) (size!45954 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94018)

(declare-fun arrayCountValidKeys!0 (array!94018 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66278 (= call!66282 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380511 () Bool)

(declare-fun e!782298 () Bool)

(assert (=> b!1380511 (= e!782298 (not true))))

(declare-fun e!782299 () Bool)

(assert (=> b!1380511 e!782299))

(declare-fun c!128417 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380511 (= c!128417 (validKeyInArray!0 (select (arr!45402 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45826 0))(
  ( (Unit!45827) )
))
(declare-fun lt!607829 () Unit!45826)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94018 (_ BitVec 32) (_ BitVec 32)) Unit!45826)

(assert (=> b!1380511 (= lt!607829 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380512 () Bool)

(declare-fun call!66281 () (_ BitVec 32))

(assert (=> b!1380512 (= e!782299 (= (bvadd #b00000000000000000000000000000001 call!66282) call!66281))))

(declare-fun bm!66279 () Bool)

(assert (=> bm!66279 (= call!66281 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!922562 () Bool)

(assert (=> start!117546 (=> (not res!922562) (not e!782298))))

(assert (=> start!117546 (= res!922562 (and (bvslt (size!45954 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45954 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117546 e!782298))

(declare-fun array_inv!34635 (array!94018) Bool)

(assert (=> start!117546 (array_inv!34635 a!3931)))

(assert (=> start!117546 true))

(declare-fun b!1380513 () Bool)

(assert (=> b!1380513 (= e!782299 (= call!66282 call!66281))))

(assert (= (and start!117546 res!922562) b!1380511))

(assert (= (and b!1380511 c!128417) b!1380512))

(assert (= (and b!1380511 (not c!128417)) b!1380513))

(assert (= (or b!1380512 b!1380513) bm!66279))

(assert (= (or b!1380512 b!1380513) bm!66278))

(declare-fun m!1265265 () Bool)

(assert (=> bm!66278 m!1265265))

(declare-fun m!1265267 () Bool)

(assert (=> b!1380511 m!1265267))

(assert (=> b!1380511 m!1265267))

(declare-fun m!1265269 () Bool)

(assert (=> b!1380511 m!1265269))

(declare-fun m!1265271 () Bool)

(assert (=> b!1380511 m!1265271))

(declare-fun m!1265273 () Bool)

(assert (=> bm!66279 m!1265273))

(declare-fun m!1265275 () Bool)

(assert (=> start!117546 m!1265275))

(push 1)

(assert (not bm!66278))

(assert (not b!1380511))

(assert (not start!117546))

(assert (not bm!66279))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

