; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117568 () Bool)

(assert start!117568)

(declare-fun b!1380661 () Bool)

(declare-fun e!782409 () Bool)

(declare-fun call!66355 () (_ BitVec 32))

(declare-fun call!66354 () (_ BitVec 32))

(assert (=> b!1380661 (= e!782409 (= call!66355 call!66354))))

(declare-fun res!922615 () Bool)

(declare-fun e!782410 () Bool)

(assert (=> start!117568 (=> (not res!922615) (not e!782410))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94086 0))(
  ( (array!94087 (arr!45436 (Array (_ BitVec 32) (_ BitVec 64))) (size!45986 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94086)

(assert (=> start!117568 (= res!922615 (and (bvslt (size!45986 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45986 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117568 e!782410))

(declare-fun array_inv!34464 (array!94086) Bool)

(assert (=> start!117568 (array_inv!34464 a!3931)))

(assert (=> start!117568 true))

(declare-fun bm!66351 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94086 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66351 (= call!66354 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66352 () Bool)

(assert (=> bm!66352 (= call!66355 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380662 () Bool)

(declare-fun lt!608057 () Bool)

(assert (=> b!1380662 (= e!782410 (not (or lt!608057 (bvsle from!3309 to!105))))))

(assert (=> b!1380662 e!782409))

(declare-fun c!128463 () Bool)

(assert (=> b!1380662 (= c!128463 lt!608057)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380662 (= lt!608057 (validKeyInArray!0 (select (arr!45436 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!46003 0))(
  ( (Unit!46004) )
))
(declare-fun lt!608058 () Unit!46003)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94086 (_ BitVec 32) (_ BitVec 32)) Unit!46003)

(assert (=> b!1380662 (= lt!608058 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380663 () Bool)

(assert (=> b!1380663 (= e!782409 (= (bvadd #b00000000000000000000000000000001 call!66355) call!66354))))

(assert (= (and start!117568 res!922615) b!1380662))

(assert (= (and b!1380662 c!128463) b!1380663))

(assert (= (and b!1380662 (not c!128463)) b!1380661))

(assert (= (or b!1380663 b!1380661) bm!66351))

(assert (= (or b!1380663 b!1380661) bm!66352))

(declare-fun m!1265877 () Bool)

(assert (=> start!117568 m!1265877))

(declare-fun m!1265879 () Bool)

(assert (=> bm!66351 m!1265879))

(declare-fun m!1265881 () Bool)

(assert (=> bm!66352 m!1265881))

(declare-fun m!1265883 () Bool)

(assert (=> b!1380662 m!1265883))

(assert (=> b!1380662 m!1265883))

(declare-fun m!1265885 () Bool)

(assert (=> b!1380662 m!1265885))

(declare-fun m!1265887 () Bool)

(assert (=> b!1380662 m!1265887))

(push 1)

(assert (not start!117568))

(assert (not b!1380662))

(assert (not bm!66352))

(assert (not bm!66351))

(check-sat)

(pop 1)

(push 1)

(check-sat)

