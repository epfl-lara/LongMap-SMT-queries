; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117558 () Bool)

(assert start!117558)

(declare-fun b!1380616 () Bool)

(declare-fun e!782364 () Bool)

(assert (=> b!1380616 (= e!782364 (not true))))

(declare-fun e!782366 () Bool)

(assert (=> b!1380616 e!782366))

(declare-fun c!128448 () Bool)

(declare-datatypes ((array!94076 0))(
  ( (array!94077 (arr!45431 (Array (_ BitVec 32) (_ BitVec 64))) (size!45981 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94076)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380616 (= c!128448 (validKeyInArray!0 (select (arr!45431 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((Unit!45993 0))(
  ( (Unit!45994) )
))
(declare-fun lt!608034 () Unit!45993)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94076 (_ BitVec 32) (_ BitVec 32)) Unit!45993)

(assert (=> b!1380616 (= lt!608034 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380617 () Bool)

(declare-fun call!66324 () (_ BitVec 32))

(declare-fun call!66325 () (_ BitVec 32))

(assert (=> b!1380617 (= e!782366 (= (bvadd #b00000000000000000000000000000001 call!66324) call!66325))))

(declare-fun bm!66322 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94076 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66322 (= call!66325 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380618 () Bool)

(assert (=> b!1380618 (= e!782366 (= call!66324 call!66325))))

(declare-fun res!922600 () Bool)

(assert (=> start!117558 (=> (not res!922600) (not e!782364))))

(assert (=> start!117558 (= res!922600 (and (bvslt (size!45981 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45981 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117558 e!782364))

(declare-fun array_inv!34459 (array!94076) Bool)

(assert (=> start!117558 (array_inv!34459 a!3931)))

(assert (=> start!117558 true))

(declare-fun bm!66321 () Bool)

(assert (=> bm!66321 (= call!66324 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (= (and start!117558 res!922600) b!1380616))

(assert (= (and b!1380616 c!128448) b!1380617))

(assert (= (and b!1380616 (not c!128448)) b!1380618))

(assert (= (or b!1380617 b!1380618) bm!66322))

(assert (= (or b!1380617 b!1380618) bm!66321))

(declare-fun m!1265817 () Bool)

(assert (=> b!1380616 m!1265817))

(assert (=> b!1380616 m!1265817))

(declare-fun m!1265819 () Bool)

(assert (=> b!1380616 m!1265819))

(declare-fun m!1265821 () Bool)

(assert (=> b!1380616 m!1265821))

(declare-fun m!1265823 () Bool)

(assert (=> bm!66322 m!1265823))

(declare-fun m!1265825 () Bool)

(assert (=> start!117558 m!1265825))

(declare-fun m!1265827 () Bool)

(assert (=> bm!66321 m!1265827))

(push 1)

(assert (not bm!66321))

(assert (not bm!66322))

(assert (not start!117558))

(assert (not b!1380616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

