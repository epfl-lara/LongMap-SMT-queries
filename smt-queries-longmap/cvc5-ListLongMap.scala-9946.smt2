; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117770 () Bool)

(assert start!117770)

(declare-fun call!66332 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun bm!66328 () Bool)

(declare-datatypes ((array!94172 0))(
  ( (array!94173 (arr!45474 (Array (_ BitVec 32) (_ BitVec 64))) (size!46025 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94172)

(declare-fun arrayCountValidKeys!0 (array!94172 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66328 (= call!66332 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun call!66331 () (_ BitVec 32))

(declare-fun bm!66329 () Bool)

(assert (=> bm!66329 (= call!66331 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1381836 () Bool)

(declare-fun e!783124 () Bool)

(assert (=> b!1381836 (= e!783124 (= (bvadd #b00000000000000000000000000000001 call!66331) call!66332))))

(declare-fun res!923091 () Bool)

(declare-fun e!783125 () Bool)

(assert (=> start!117770 (=> (not res!923091) (not e!783125))))

(assert (=> start!117770 (= res!923091 (and (bvslt (size!46025 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46025 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117770 e!783125))

(declare-fun array_inv!34755 (array!94172) Bool)

(assert (=> start!117770 (array_inv!34755 a!3931)))

(assert (=> start!117770 true))

(declare-fun b!1381837 () Bool)

(assert (=> b!1381837 (= e!783125 (not true))))

(assert (=> b!1381837 e!783124))

(declare-fun c!128820 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381837 (= c!128820 (validKeyInArray!0 (select (arr!45474 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45912 0))(
  ( (Unit!45913) )
))
(declare-fun lt!608467 () Unit!45912)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94172 (_ BitVec 32) (_ BitVec 32)) Unit!45912)

(assert (=> b!1381837 (= lt!608467 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1381838 () Bool)

(assert (=> b!1381838 (= e!783124 (= call!66331 call!66332))))

(assert (= (and start!117770 res!923091) b!1381837))

(assert (= (and b!1381837 c!128820) b!1381836))

(assert (= (and b!1381837 (not c!128820)) b!1381838))

(assert (= (or b!1381836 b!1381838) bm!66328))

(assert (= (or b!1381836 b!1381838) bm!66329))

(declare-fun m!1267333 () Bool)

(assert (=> bm!66328 m!1267333))

(declare-fun m!1267335 () Bool)

(assert (=> bm!66329 m!1267335))

(declare-fun m!1267337 () Bool)

(assert (=> start!117770 m!1267337))

(declare-fun m!1267339 () Bool)

(assert (=> b!1381837 m!1267339))

(assert (=> b!1381837 m!1267339))

(declare-fun m!1267341 () Bool)

(assert (=> b!1381837 m!1267341))

(declare-fun m!1267343 () Bool)

(assert (=> b!1381837 m!1267343))

(push 1)

(assert (not bm!66329))

(assert (not b!1381837))

(assert (not start!117770))

(assert (not bm!66328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

