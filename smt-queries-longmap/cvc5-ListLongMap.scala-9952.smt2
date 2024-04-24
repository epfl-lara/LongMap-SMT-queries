; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117806 () Bool)

(assert start!117806)

(declare-fun res!923145 () Bool)

(declare-fun e!783288 () Bool)

(assert (=> start!117806 (=> (not res!923145) (not e!783288))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94208 0))(
  ( (array!94209 (arr!45492 (Array (_ BitVec 32) (_ BitVec 64))) (size!46043 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94208)

(assert (=> start!117806 (= res!923145 (and (bvslt (size!46043 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46043 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117806 e!783288))

(declare-fun array_inv!34773 (array!94208) Bool)

(assert (=> start!117806 (array_inv!34773 a!3931)))

(assert (=> start!117806 true))

(declare-fun bm!66436 () Bool)

(declare-fun call!66439 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!94208 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66436 (= call!66439 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun call!66440 () (_ BitVec 32))

(declare-fun bm!66437 () Bool)

(assert (=> bm!66437 (= call!66440 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1381998 () Bool)

(assert (=> b!1381998 (= e!783288 (not true))))

(declare-fun e!783287 () Bool)

(assert (=> b!1381998 e!783287))

(declare-fun c!128874 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381998 (= c!128874 (validKeyInArray!0 (select (arr!45492 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45948 0))(
  ( (Unit!45949) )
))
(declare-fun lt!608548 () Unit!45948)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94208 (_ BitVec 32) (_ BitVec 32)) Unit!45948)

(assert (=> b!1381998 (= lt!608548 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1381999 () Bool)

(assert (=> b!1381999 (= e!783287 (= call!66440 call!66439))))

(declare-fun b!1382000 () Bool)

(assert (=> b!1382000 (= e!783287 (= (bvadd #b00000000000000000000000000000001 call!66440) call!66439))))

(assert (= (and start!117806 res!923145) b!1381998))

(assert (= (and b!1381998 c!128874) b!1382000))

(assert (= (and b!1381998 (not c!128874)) b!1381999))

(assert (= (or b!1382000 b!1381999) bm!66436))

(assert (= (or b!1382000 b!1381999) bm!66437))

(declare-fun m!1267549 () Bool)

(assert (=> start!117806 m!1267549))

(declare-fun m!1267551 () Bool)

(assert (=> bm!66436 m!1267551))

(declare-fun m!1267553 () Bool)

(assert (=> bm!66437 m!1267553))

(declare-fun m!1267555 () Bool)

(assert (=> b!1381998 m!1267555))

(assert (=> b!1381998 m!1267555))

(declare-fun m!1267557 () Bool)

(assert (=> b!1381998 m!1267557))

(declare-fun m!1267559 () Bool)

(assert (=> b!1381998 m!1267559))

(push 1)

(assert (not bm!66436))

(assert (not bm!66437))

(assert (not b!1381998))

(assert (not start!117806))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

