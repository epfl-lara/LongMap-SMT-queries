; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117564 () Bool)

(assert start!117564)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun bm!66332 () Bool)

(declare-fun call!66336 () (_ BitVec 32))

(declare-datatypes ((array!94036 0))(
  ( (array!94037 (arr!45411 (Array (_ BitVec 32) (_ BitVec 64))) (size!45963 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94036)

(declare-fun arrayCountValidKeys!0 (array!94036 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66332 (= call!66336 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380593 () Bool)

(declare-fun e!782378 () Bool)

(declare-fun call!66335 () (_ BitVec 32))

(assert (=> b!1380593 (= e!782378 (= (bvadd #b00000000000000000000000000000001 call!66336) call!66335))))

(declare-fun lt!607873 () Bool)

(declare-fun e!782380 () Bool)

(declare-fun b!1380592 () Bool)

(assert (=> b!1380592 (= e!782380 (not (or lt!607873 (bvsle from!3309 to!105))))))

(assert (=> b!1380592 e!782378))

(declare-fun c!128444 () Bool)

(assert (=> b!1380592 (= c!128444 lt!607873)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380592 (= lt!607873 (validKeyInArray!0 (select (arr!45411 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45844 0))(
  ( (Unit!45845) )
))
(declare-fun lt!607874 () Unit!45844)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94036 (_ BitVec 32) (_ BitVec 32)) Unit!45844)

(assert (=> b!1380592 (= lt!607874 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!922589 () Bool)

(assert (=> start!117564 (=> (not res!922589) (not e!782380))))

(assert (=> start!117564 (= res!922589 (and (bvslt (size!45963 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45963 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117564 e!782380))

(declare-fun array_inv!34644 (array!94036) Bool)

(assert (=> start!117564 (array_inv!34644 a!3931)))

(assert (=> start!117564 true))

(declare-fun b!1380594 () Bool)

(assert (=> b!1380594 (= e!782378 (= call!66336 call!66335))))

(declare-fun bm!66333 () Bool)

(assert (=> bm!66333 (= call!66335 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (= (and start!117564 res!922589) b!1380592))

(assert (= (and b!1380592 c!128444) b!1380593))

(assert (= (and b!1380592 (not c!128444)) b!1380594))

(assert (= (or b!1380593 b!1380594) bm!66333))

(assert (= (or b!1380593 b!1380594) bm!66332))

(declare-fun m!1265373 () Bool)

(assert (=> bm!66332 m!1265373))

(declare-fun m!1265375 () Bool)

(assert (=> b!1380592 m!1265375))

(assert (=> b!1380592 m!1265375))

(declare-fun m!1265377 () Bool)

(assert (=> b!1380592 m!1265377))

(declare-fun m!1265379 () Bool)

(assert (=> b!1380592 m!1265379))

(declare-fun m!1265381 () Bool)

(assert (=> start!117564 m!1265381))

(declare-fun m!1265383 () Bool)

(assert (=> bm!66333 m!1265383))

(push 1)

(assert (not bm!66332))

(assert (not b!1380592))

(assert (not start!117564))

(assert (not bm!66333))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

