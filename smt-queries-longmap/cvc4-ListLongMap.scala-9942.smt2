; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117478 () Bool)

(assert start!117478)

(declare-fun b!1380242 () Bool)

(declare-fun res!922497 () Bool)

(declare-fun e!782090 () Bool)

(assert (=> b!1380242 (=> (not res!922497) (not e!782090))))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94029 0))(
  ( (array!94030 (arr!45409 (Array (_ BitVec 32) (_ BitVec 64))) (size!45959 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94029)

(assert (=> b!1380242 (= res!922497 (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45959 a!3961)))))

(declare-fun b!1380243 () Bool)

(declare-fun e!782088 () Bool)

(declare-fun call!66144 () (_ BitVec 32))

(declare-fun call!66145 () (_ BitVec 32))

(assert (=> b!1380243 (= e!782088 (= call!66144 call!66145))))

(declare-fun b!1380244 () Bool)

(assert (=> b!1380244 (= e!782088 (= (bvadd #b00000000000000000000000000000001 call!66144) call!66145))))

(declare-fun b!1380245 () Bool)

(declare-fun res!922498 () Bool)

(assert (=> b!1380245 (=> (not res!922498) (not e!782090))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun to!135 () (_ BitVec 32))

(declare-fun isPivot!0 (array!94029 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380245 (= res!922498 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(declare-fun bm!66141 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94029 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66141 (= call!66145 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun res!922496 () Bool)

(assert (=> start!117478 (=> (not res!922496) (not e!782090))))

(assert (=> start!117478 (= res!922496 (and (bvslt (size!45959 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45959 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117478 e!782090))

(declare-fun array_inv!34437 (array!94029) Bool)

(assert (=> start!117478 (array_inv!34437 a!3961)))

(assert (=> start!117478 true))

(declare-fun b!1380246 () Bool)

(assert (=> b!1380246 (= e!782090 (not (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) from!3339)))))

(assert (=> b!1380246 e!782088))

(declare-fun c!128313 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380246 (= c!128313 (validKeyInArray!0 (select (arr!45409 a!3961) pivot!34)))))

(declare-datatypes ((Unit!45955 0))(
  ( (Unit!45956) )
))
(declare-fun lt!607902 () Unit!45955)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94029 (_ BitVec 32) (_ BitVec 32)) Unit!45955)

(assert (=> b!1380246 (= lt!607902 (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun bm!66142 () Bool)

(assert (=> bm!66142 (= call!66144 (arrayCountValidKeys!0 a!3961 from!3339 pivot!34))))

(assert (= (and start!117478 res!922496) b!1380245))

(assert (= (and b!1380245 res!922498) b!1380242))

(assert (= (and b!1380242 res!922497) b!1380246))

(assert (= (and b!1380246 c!128313) b!1380244))

(assert (= (and b!1380246 (not c!128313)) b!1380243))

(assert (= (or b!1380244 b!1380243) bm!66142))

(assert (= (or b!1380244 b!1380243) bm!66141))

(declare-fun m!1265437 () Bool)

(assert (=> b!1380245 m!1265437))

(declare-fun m!1265439 () Bool)

(assert (=> b!1380246 m!1265439))

(assert (=> b!1380246 m!1265439))

(declare-fun m!1265441 () Bool)

(assert (=> b!1380246 m!1265441))

(declare-fun m!1265443 () Bool)

(assert (=> b!1380246 m!1265443))

(declare-fun m!1265445 () Bool)

(assert (=> bm!66142 m!1265445))

(declare-fun m!1265447 () Bool)

(assert (=> bm!66141 m!1265447))

(declare-fun m!1265449 () Bool)

(assert (=> start!117478 m!1265449))

(push 1)

(assert (not b!1380246))

(assert (not b!1380245))

(assert (not bm!66142))

(assert (not start!117478))

(assert (not bm!66141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

