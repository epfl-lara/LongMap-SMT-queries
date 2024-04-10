; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117552 () Bool)

(assert start!117552)

(declare-fun b!1380589 () Bool)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun lt!608018 () Bool)

(declare-fun e!782337 () Bool)

(declare-datatypes ((array!94070 0))(
  ( (array!94071 (arr!45428 (Array (_ BitVec 32) (_ BitVec 64))) (size!45978 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94070)

(assert (=> b!1380589 (= e!782337 (not (or lt!608018 (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!45978 a!3931)))))))

(declare-fun e!782339 () Bool)

(assert (=> b!1380589 e!782339))

(declare-fun c!128439 () Bool)

(assert (=> b!1380589 (= c!128439 lt!608018)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380589 (= lt!608018 (validKeyInArray!0 (select (arr!45428 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((Unit!45987 0))(
  ( (Unit!45988) )
))
(declare-fun lt!608019 () Unit!45987)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94070 (_ BitVec 32) (_ BitVec 32)) Unit!45987)

(assert (=> b!1380589 (= lt!608019 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380590 () Bool)

(declare-fun call!66307 () (_ BitVec 32))

(declare-fun call!66306 () (_ BitVec 32))

(assert (=> b!1380590 (= e!782339 (= (bvadd #b00000000000000000000000000000001 call!66307) call!66306))))

(declare-fun res!922591 () Bool)

(assert (=> start!117552 (=> (not res!922591) (not e!782337))))

(assert (=> start!117552 (= res!922591 (and (bvslt (size!45978 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45978 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117552 e!782337))

(declare-fun array_inv!34456 (array!94070) Bool)

(assert (=> start!117552 (array_inv!34456 a!3931)))

(assert (=> start!117552 true))

(declare-fun bm!66303 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94070 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66303 (= call!66306 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66304 () Bool)

(assert (=> bm!66304 (= call!66307 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380591 () Bool)

(assert (=> b!1380591 (= e!782339 (= call!66307 call!66306))))

(assert (= (and start!117552 res!922591) b!1380589))

(assert (= (and b!1380589 c!128439) b!1380590))

(assert (= (and b!1380589 (not c!128439)) b!1380591))

(assert (= (or b!1380590 b!1380591) bm!66303))

(assert (= (or b!1380590 b!1380591) bm!66304))

(declare-fun m!1265781 () Bool)

(assert (=> b!1380589 m!1265781))

(assert (=> b!1380589 m!1265781))

(declare-fun m!1265783 () Bool)

(assert (=> b!1380589 m!1265783))

(declare-fun m!1265785 () Bool)

(assert (=> b!1380589 m!1265785))

(declare-fun m!1265787 () Bool)

(assert (=> start!117552 m!1265787))

(declare-fun m!1265789 () Bool)

(assert (=> bm!66303 m!1265789))

(declare-fun m!1265791 () Bool)

(assert (=> bm!66304 m!1265791))

(push 1)

(assert (not b!1380589))

(assert (not start!117552))

(assert (not bm!66304))

(assert (not bm!66303))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

