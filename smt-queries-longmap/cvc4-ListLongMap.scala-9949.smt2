; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117556 () Bool)

(assert start!117556)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun call!66319 () (_ BitVec 32))

(declare-fun bm!66315 () Bool)

(declare-datatypes ((array!94074 0))(
  ( (array!94075 (arr!45430 (Array (_ BitVec 32) (_ BitVec 64))) (size!45980 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94074)

(declare-fun arrayCountValidKeys!0 (array!94074 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66315 (= call!66319 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380607 () Bool)

(declare-fun lt!608030 () Bool)

(declare-fun e!782355 () Bool)

(assert (=> b!1380607 (= e!782355 (not (or lt!608030 (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!45980 a!3931)))))))

(declare-fun e!782357 () Bool)

(assert (=> b!1380607 e!782357))

(declare-fun c!128445 () Bool)

(assert (=> b!1380607 (= c!128445 lt!608030)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380607 (= lt!608030 (validKeyInArray!0 (select (arr!45430 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45991 0))(
  ( (Unit!45992) )
))
(declare-fun lt!608031 () Unit!45991)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94074 (_ BitVec 32) (_ BitVec 32)) Unit!45991)

(assert (=> b!1380607 (= lt!608031 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380608 () Bool)

(declare-fun call!66318 () (_ BitVec 32))

(assert (=> b!1380608 (= e!782357 (= (bvadd #b00000000000000000000000000000001 call!66319) call!66318))))

(declare-fun res!922597 () Bool)

(assert (=> start!117556 (=> (not res!922597) (not e!782355))))

(assert (=> start!117556 (= res!922597 (and (bvslt (size!45980 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45980 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117556 e!782355))

(declare-fun array_inv!34458 (array!94074) Bool)

(assert (=> start!117556 (array_inv!34458 a!3931)))

(assert (=> start!117556 true))

(declare-fun b!1380609 () Bool)

(assert (=> b!1380609 (= e!782357 (= call!66319 call!66318))))

(declare-fun bm!66316 () Bool)

(assert (=> bm!66316 (= call!66318 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (= (and start!117556 res!922597) b!1380607))

(assert (= (and b!1380607 c!128445) b!1380608))

(assert (= (and b!1380607 (not c!128445)) b!1380609))

(assert (= (or b!1380608 b!1380609) bm!66316))

(assert (= (or b!1380608 b!1380609) bm!66315))

(declare-fun m!1265805 () Bool)

(assert (=> bm!66315 m!1265805))

(declare-fun m!1265807 () Bool)

(assert (=> b!1380607 m!1265807))

(assert (=> b!1380607 m!1265807))

(declare-fun m!1265809 () Bool)

(assert (=> b!1380607 m!1265809))

(declare-fun m!1265811 () Bool)

(assert (=> b!1380607 m!1265811))

(declare-fun m!1265813 () Bool)

(assert (=> start!117556 m!1265813))

(declare-fun m!1265815 () Bool)

(assert (=> bm!66316 m!1265815))

(push 1)

(assert (not b!1380607))

(assert (not bm!66315))

(assert (not start!117556))

(assert (not bm!66316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

