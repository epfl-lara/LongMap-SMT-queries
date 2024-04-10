; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117538 () Bool)

(assert start!117538)

(declare-fun b!1380526 () Bool)

(declare-fun e!782274 () Bool)

(declare-fun call!66265 () (_ BitVec 32))

(declare-fun call!66264 () (_ BitVec 32))

(assert (=> b!1380526 (= e!782274 (= (bvadd #b00000000000000000000000000000001 call!66265) call!66264))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94056 0))(
  ( (array!94057 (arr!45421 (Array (_ BitVec 32) (_ BitVec 64))) (size!45971 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94056)

(declare-fun bm!66261 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94056 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66261 (= call!66264 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380527 () Bool)

(declare-fun e!782275 () Bool)

(assert (=> b!1380527 (= e!782275 (not true))))

(assert (=> b!1380527 e!782274))

(declare-fun c!128418 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380527 (= c!128418 (validKeyInArray!0 (select (arr!45421 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45973 0))(
  ( (Unit!45974) )
))
(declare-fun lt!607986 () Unit!45973)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94056 (_ BitVec 32) (_ BitVec 32)) Unit!45973)

(assert (=> b!1380527 (= lt!607986 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!922570 () Bool)

(assert (=> start!117538 (=> (not res!922570) (not e!782275))))

(assert (=> start!117538 (= res!922570 (and (bvslt (size!45971 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45971 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117538 e!782275))

(declare-fun array_inv!34449 (array!94056) Bool)

(assert (=> start!117538 (array_inv!34449 a!3931)))

(assert (=> start!117538 true))

(declare-fun bm!66262 () Bool)

(assert (=> bm!66262 (= call!66265 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380528 () Bool)

(assert (=> b!1380528 (= e!782274 (= call!66265 call!66264))))

(assert (= (and start!117538 res!922570) b!1380527))

(assert (= (and b!1380527 c!128418) b!1380526))

(assert (= (and b!1380527 (not c!128418)) b!1380528))

(assert (= (or b!1380526 b!1380528) bm!66261))

(assert (= (or b!1380526 b!1380528) bm!66262))

(declare-fun m!1265697 () Bool)

(assert (=> bm!66261 m!1265697))

(declare-fun m!1265699 () Bool)

(assert (=> b!1380527 m!1265699))

(assert (=> b!1380527 m!1265699))

(declare-fun m!1265701 () Bool)

(assert (=> b!1380527 m!1265701))

(declare-fun m!1265703 () Bool)

(assert (=> b!1380527 m!1265703))

(declare-fun m!1265705 () Bool)

(assert (=> start!117538 m!1265705))

(declare-fun m!1265707 () Bool)

(assert (=> bm!66262 m!1265707))

(push 1)

(assert (not bm!66261))

(assert (not b!1380527))

(assert (not start!117538))

(assert (not bm!66262))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

