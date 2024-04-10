; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117618 () Bool)

(assert start!117618)

(declare-fun b!1380769 () Bool)

(declare-fun e!782545 () Bool)

(declare-fun call!66379 () (_ BitVec 32))

(declare-fun call!66378 () (_ BitVec 32))

(assert (=> b!1380769 (= e!782545 (= call!66379 call!66378))))

(declare-fun bm!66375 () Bool)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94136 0))(
  ( (array!94137 (arr!45461 (Array (_ BitVec 32) (_ BitVec 64))) (size!46011 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94136)

(declare-fun arrayCountValidKeys!0 (array!94136 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66375 (= call!66378 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380770 () Bool)

(declare-fun e!782544 () Bool)

(assert (=> b!1380770 (= e!782544 (not (bvsge (bvsub to!105 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1380770 e!782545))

(declare-fun c!128475 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380770 (= c!128475 (validKeyInArray!0 (select (arr!45461 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!46011 0))(
  ( (Unit!46012) )
))
(declare-fun lt!608070 () Unit!46011)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94136 (_ BitVec 32) (_ BitVec 32)) Unit!46011)

(assert (=> b!1380770 (= lt!608070 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380771 () Bool)

(assert (=> b!1380771 (= e!782545 (= (bvadd #b00000000000000000000000000000001 call!66379) call!66378))))

(declare-fun res!922699 () Bool)

(assert (=> start!117618 (=> (not res!922699) (not e!782544))))

(assert (=> start!117618 (= res!922699 (and (bvslt (size!46011 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46011 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117618 e!782544))

(declare-fun array_inv!34489 (array!94136) Bool)

(assert (=> start!117618 (array_inv!34489 a!3931)))

(assert (=> start!117618 true))

(declare-fun bm!66376 () Bool)

(assert (=> bm!66376 (= call!66379 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (= (and start!117618 res!922699) b!1380770))

(assert (= (and b!1380770 c!128475) b!1380771))

(assert (= (and b!1380770 (not c!128475)) b!1380769))

(assert (= (or b!1380771 b!1380769) bm!66375))

(assert (= (or b!1380771 b!1380769) bm!66376))

(declare-fun m!1266015 () Bool)

(assert (=> bm!66375 m!1266015))

(declare-fun m!1266017 () Bool)

(assert (=> b!1380770 m!1266017))

(assert (=> b!1380770 m!1266017))

(declare-fun m!1266019 () Bool)

(assert (=> b!1380770 m!1266019))

(declare-fun m!1266021 () Bool)

(assert (=> b!1380770 m!1266021))

(declare-fun m!1266023 () Bool)

(assert (=> start!117618 m!1266023))

(declare-fun m!1266025 () Bool)

(assert (=> bm!66376 m!1266025))

(push 1)

(assert (not bm!66376))

(assert (not b!1380770))

(assert (not start!117618))

(assert (not bm!66375))

(check-sat)

(pop 1)

(push 1)

(check-sat)

