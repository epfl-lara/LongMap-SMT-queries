; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117564 () Bool)

(assert start!117564)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun lt!608045 () Bool)

(declare-fun b!1380643 () Bool)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun e!782392 () Bool)

(assert (=> b!1380643 (= e!782392 (not (or lt!608045 (bvsle from!3309 to!105))))))

(declare-fun e!782391 () Bool)

(assert (=> b!1380643 e!782391))

(declare-fun c!128457 () Bool)

(assert (=> b!1380643 (= c!128457 lt!608045)))

(declare-datatypes ((array!94082 0))(
  ( (array!94083 (arr!45434 (Array (_ BitVec 32) (_ BitVec 64))) (size!45984 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94082)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380643 (= lt!608045 (validKeyInArray!0 (select (arr!45434 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45999 0))(
  ( (Unit!46000) )
))
(declare-fun lt!608046 () Unit!45999)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94082 (_ BitVec 32) (_ BitVec 32)) Unit!45999)

(assert (=> b!1380643 (= lt!608046 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380644 () Bool)

(declare-fun call!66342 () (_ BitVec 32))

(declare-fun call!66343 () (_ BitVec 32))

(assert (=> b!1380644 (= e!782391 (= (bvadd #b00000000000000000000000000000001 call!66342) call!66343))))

(declare-fun res!922609 () Bool)

(assert (=> start!117564 (=> (not res!922609) (not e!782392))))

(assert (=> start!117564 (= res!922609 (and (bvslt (size!45984 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45984 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117564 e!782392))

(declare-fun array_inv!34462 (array!94082) Bool)

(assert (=> start!117564 (array_inv!34462 a!3931)))

(assert (=> start!117564 true))

(declare-fun bm!66339 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94082 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66339 (= call!66342 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380645 () Bool)

(assert (=> b!1380645 (= e!782391 (= call!66342 call!66343))))

(declare-fun bm!66340 () Bool)

(assert (=> bm!66340 (= call!66343 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (= (and start!117564 res!922609) b!1380643))

(assert (= (and b!1380643 c!128457) b!1380644))

(assert (= (and b!1380643 (not c!128457)) b!1380645))

(assert (= (or b!1380644 b!1380645) bm!66340))

(assert (= (or b!1380644 b!1380645) bm!66339))

(declare-fun m!1265853 () Bool)

(assert (=> b!1380643 m!1265853))

(assert (=> b!1380643 m!1265853))

(declare-fun m!1265855 () Bool)

(assert (=> b!1380643 m!1265855))

(declare-fun m!1265857 () Bool)

(assert (=> b!1380643 m!1265857))

(declare-fun m!1265859 () Bool)

(assert (=> start!117564 m!1265859))

(declare-fun m!1265861 () Bool)

(assert (=> bm!66339 m!1265861))

(declare-fun m!1265863 () Bool)

(assert (=> bm!66340 m!1265863))

(push 1)

(assert (not bm!66339))

(assert (not b!1380643))

(assert (not start!117564))

(assert (not bm!66340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

