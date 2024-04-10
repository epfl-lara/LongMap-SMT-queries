; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117534 () Bool)

(assert start!117534)

(declare-fun b!1380508 () Bool)

(declare-fun e!782258 () Bool)

(assert (=> b!1380508 (= e!782258 (not true))))

(declare-fun e!782256 () Bool)

(assert (=> b!1380508 e!782256))

(declare-fun c!128412 () Bool)

(declare-datatypes ((array!94052 0))(
  ( (array!94053 (arr!45419 (Array (_ BitVec 32) (_ BitVec 64))) (size!45969 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94052)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380508 (= c!128412 (validKeyInArray!0 (select (arr!45419 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((Unit!45969 0))(
  ( (Unit!45970) )
))
(declare-fun lt!607980 () Unit!45969)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94052 (_ BitVec 32) (_ BitVec 32)) Unit!45969)

(assert (=> b!1380508 (= lt!607980 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun call!66252 () (_ BitVec 32))

(declare-fun bm!66249 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94052 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66249 (= call!66252 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66250 () Bool)

(declare-fun call!66253 () (_ BitVec 32))

(assert (=> bm!66250 (= call!66253 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380510 () Bool)

(assert (=> b!1380510 (= e!782256 (= call!66253 call!66252))))

(declare-fun b!1380509 () Bool)

(assert (=> b!1380509 (= e!782256 (= (bvadd #b00000000000000000000000000000001 call!66253) call!66252))))

(declare-fun res!922564 () Bool)

(assert (=> start!117534 (=> (not res!922564) (not e!782258))))

(assert (=> start!117534 (= res!922564 (and (bvslt (size!45969 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45969 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117534 e!782258))

(declare-fun array_inv!34447 (array!94052) Bool)

(assert (=> start!117534 (array_inv!34447 a!3931)))

(assert (=> start!117534 true))

(assert (= (and start!117534 res!922564) b!1380508))

(assert (= (and b!1380508 c!128412) b!1380509))

(assert (= (and b!1380508 (not c!128412)) b!1380510))

(assert (= (or b!1380509 b!1380510) bm!66249))

(assert (= (or b!1380509 b!1380510) bm!66250))

(declare-fun m!1265673 () Bool)

(assert (=> b!1380508 m!1265673))

(assert (=> b!1380508 m!1265673))

(declare-fun m!1265675 () Bool)

(assert (=> b!1380508 m!1265675))

(declare-fun m!1265677 () Bool)

(assert (=> b!1380508 m!1265677))

(declare-fun m!1265679 () Bool)

(assert (=> bm!66249 m!1265679))

(declare-fun m!1265681 () Bool)

(assert (=> bm!66250 m!1265681))

(declare-fun m!1265683 () Bool)

(assert (=> start!117534 m!1265683))

(push 1)

(assert (not bm!66249))

(assert (not bm!66250))

(assert (not start!117534))

(assert (not b!1380508))

(check-sat)

(pop 1)

