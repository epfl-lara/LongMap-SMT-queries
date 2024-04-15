; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117552 () Bool)

(assert start!117552)

(declare-fun b!1380538 () Bool)

(declare-fun e!782325 () Bool)

(declare-fun call!66300 () (_ BitVec 32))

(declare-fun call!66299 () (_ BitVec 32))

(assert (=> b!1380538 (= e!782325 (= (bvadd #b00000000000000000000000000000001 call!66300) call!66299))))

(declare-fun b!1380539 () Bool)

(assert (=> b!1380539 (= e!782325 (= call!66300 call!66299))))

(declare-fun res!922571 () Bool)

(declare-fun e!782326 () Bool)

(assert (=> start!117552 (=> (not res!922571) (not e!782326))))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94024 0))(
  ( (array!94025 (arr!45405 (Array (_ BitVec 32) (_ BitVec 64))) (size!45957 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94024)

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117552 (= res!922571 (and (bvslt (size!45957 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45957 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117552 e!782326))

(declare-fun array_inv!34638 (array!94024) Bool)

(assert (=> start!117552 (array_inv!34638 a!3931)))

(assert (=> start!117552 true))

(declare-fun bm!66296 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94024 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66296 (= call!66300 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380540 () Bool)

(declare-fun lt!607846 () Bool)

(assert (=> b!1380540 (= e!782326 (not (or lt!607846 (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!45957 a!3931)))))))

(assert (=> b!1380540 e!782325))

(declare-fun c!128426 () Bool)

(assert (=> b!1380540 (= c!128426 lt!607846)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380540 (= lt!607846 (validKeyInArray!0 (select (arr!45405 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45832 0))(
  ( (Unit!45833) )
))
(declare-fun lt!607847 () Unit!45832)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94024 (_ BitVec 32) (_ BitVec 32)) Unit!45832)

(assert (=> b!1380540 (= lt!607847 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66297 () Bool)

(assert (=> bm!66297 (= call!66299 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (= (and start!117552 res!922571) b!1380540))

(assert (= (and b!1380540 c!128426) b!1380538))

(assert (= (and b!1380540 (not c!128426)) b!1380539))

(assert (= (or b!1380538 b!1380539) bm!66297))

(assert (= (or b!1380538 b!1380539) bm!66296))

(declare-fun m!1265301 () Bool)

(assert (=> start!117552 m!1265301))

(declare-fun m!1265303 () Bool)

(assert (=> bm!66296 m!1265303))

(declare-fun m!1265305 () Bool)

(assert (=> b!1380540 m!1265305))

(assert (=> b!1380540 m!1265305))

(declare-fun m!1265307 () Bool)

(assert (=> b!1380540 m!1265307))

(declare-fun m!1265309 () Bool)

(assert (=> b!1380540 m!1265309))

(declare-fun m!1265311 () Bool)

(assert (=> bm!66297 m!1265311))

(push 1)

(assert (not bm!66296))

(assert (not b!1380540))

(assert (not bm!66297))

(assert (not start!117552))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

