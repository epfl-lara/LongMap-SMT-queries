; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117574 () Bool)

(assert start!117574)

(declare-fun call!66373 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun bm!66369 () Bool)

(declare-datatypes ((array!94092 0))(
  ( (array!94093 (arr!45439 (Array (_ BitVec 32) (_ BitVec 64))) (size!45989 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94092)

(declare-fun arrayCountValidKeys!0 (array!94092 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66369 (= call!66373 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun res!922624 () Bool)

(declare-fun e!782436 () Bool)

(assert (=> start!117574 (=> (not res!922624) (not e!782436))))

(assert (=> start!117574 (= res!922624 (and (bvslt (size!45989 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45989 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117574 e!782436))

(declare-fun array_inv!34467 (array!94092) Bool)

(assert (=> start!117574 (array_inv!34467 a!3931)))

(assert (=> start!117574 true))

(declare-fun b!1380688 () Bool)

(assert (=> b!1380688 (= e!782436 (not true))))

(declare-fun e!782438 () Bool)

(assert (=> b!1380688 e!782438))

(declare-fun c!128472 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380688 (= c!128472 (validKeyInArray!0 (select (arr!45439 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!46009 0))(
  ( (Unit!46010) )
))
(declare-fun lt!608067 () Unit!46009)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94092 (_ BitVec 32) (_ BitVec 32)) Unit!46009)

(assert (=> b!1380688 (= lt!608067 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380689 () Bool)

(declare-fun call!66372 () (_ BitVec 32))

(assert (=> b!1380689 (= e!782438 (= call!66373 call!66372))))

(declare-fun bm!66370 () Bool)

(assert (=> bm!66370 (= call!66372 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380690 () Bool)

(assert (=> b!1380690 (= e!782438 (= (bvadd #b00000000000000000000000000000001 call!66373) call!66372))))

(assert (= (and start!117574 res!922624) b!1380688))

(assert (= (and b!1380688 c!128472) b!1380690))

(assert (= (and b!1380688 (not c!128472)) b!1380689))

(assert (= (or b!1380690 b!1380689) bm!66370))

(assert (= (or b!1380690 b!1380689) bm!66369))

(declare-fun m!1265913 () Bool)

(assert (=> bm!66369 m!1265913))

(declare-fun m!1265915 () Bool)

(assert (=> start!117574 m!1265915))

(declare-fun m!1265917 () Bool)

(assert (=> b!1380688 m!1265917))

(assert (=> b!1380688 m!1265917))

(declare-fun m!1265919 () Bool)

(assert (=> b!1380688 m!1265919))

(declare-fun m!1265921 () Bool)

(assert (=> b!1380688 m!1265921))

(declare-fun m!1265923 () Bool)

(assert (=> bm!66370 m!1265923))

(push 1)

(assert (not bm!66369))

(assert (not bm!66370))

(assert (not start!117574))

(assert (not b!1380688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

