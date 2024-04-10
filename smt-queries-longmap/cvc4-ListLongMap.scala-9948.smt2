; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117550 () Bool)

(assert start!117550)

(declare-fun res!922588 () Bool)

(declare-fun e!782330 () Bool)

(assert (=> start!117550 (=> (not res!922588) (not e!782330))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94068 0))(
  ( (array!94069 (arr!45427 (Array (_ BitVec 32) (_ BitVec 64))) (size!45977 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94068)

(assert (=> start!117550 (= res!922588 (and (bvslt (size!45977 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45977 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117550 e!782330))

(declare-fun array_inv!34455 (array!94068) Bool)

(assert (=> start!117550 (array_inv!34455 a!3931)))

(assert (=> start!117550 true))

(declare-fun b!1380580 () Bool)

(declare-fun e!782328 () Bool)

(declare-fun call!66301 () (_ BitVec 32))

(declare-fun call!66300 () (_ BitVec 32))

(assert (=> b!1380580 (= e!782328 (= (bvadd #b00000000000000000000000000000001 call!66301) call!66300))))

(declare-fun bm!66297 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94068 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66297 (= call!66300 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380581 () Bool)

(assert (=> b!1380581 (= e!782328 (= call!66301 call!66300))))

(declare-fun bm!66298 () Bool)

(assert (=> bm!66298 (= call!66301 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380582 () Bool)

(assert (=> b!1380582 (= e!782330 (not true))))

(assert (=> b!1380582 e!782328))

(declare-fun c!128436 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380582 (= c!128436 (validKeyInArray!0 (select (arr!45427 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45985 0))(
  ( (Unit!45986) )
))
(declare-fun lt!608013 () Unit!45985)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94068 (_ BitVec 32) (_ BitVec 32)) Unit!45985)

(assert (=> b!1380582 (= lt!608013 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (= (and start!117550 res!922588) b!1380582))

(assert (= (and b!1380582 c!128436) b!1380580))

(assert (= (and b!1380582 (not c!128436)) b!1380581))

(assert (= (or b!1380580 b!1380581) bm!66297))

(assert (= (or b!1380580 b!1380581) bm!66298))

(declare-fun m!1265769 () Bool)

(assert (=> start!117550 m!1265769))

(declare-fun m!1265771 () Bool)

(assert (=> bm!66297 m!1265771))

(declare-fun m!1265773 () Bool)

(assert (=> bm!66298 m!1265773))

(declare-fun m!1265775 () Bool)

(assert (=> b!1380582 m!1265775))

(assert (=> b!1380582 m!1265775))

(declare-fun m!1265777 () Bool)

(assert (=> b!1380582 m!1265777))

(declare-fun m!1265779 () Bool)

(assert (=> b!1380582 m!1265779))

(push 1)

(assert (not b!1380582))

(assert (not bm!66298))

(assert (not start!117550))

(assert (not bm!66297))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

