; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117620 () Bool)

(assert start!117620)

(declare-fun b!1380778 () Bool)

(declare-fun e!782555 () Bool)

(declare-fun to!105 () (_ BitVec 32))

(assert (=> b!1380778 (= e!782555 (not (bvsge (bvsub to!105 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!782553 () Bool)

(assert (=> b!1380778 e!782553))

(declare-fun c!128478 () Bool)

(declare-datatypes ((array!94138 0))(
  ( (array!94139 (arr!45462 (Array (_ BitVec 32) (_ BitVec 64))) (size!46012 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94138)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380778 (= c!128478 (validKeyInArray!0 (select (arr!45462 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((Unit!46013 0))(
  ( (Unit!46014) )
))
(declare-fun lt!608073 () Unit!46013)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94138 (_ BitVec 32) (_ BitVec 32)) Unit!46013)

(assert (=> b!1380778 (= lt!608073 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380779 () Bool)

(declare-fun call!66384 () (_ BitVec 32))

(declare-fun call!66385 () (_ BitVec 32))

(assert (=> b!1380779 (= e!782553 (= (bvadd #b00000000000000000000000000000001 call!66384) call!66385))))

(declare-fun res!922702 () Bool)

(assert (=> start!117620 (=> (not res!922702) (not e!782555))))

(assert (=> start!117620 (= res!922702 (and (bvslt (size!46012 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46012 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117620 e!782555))

(declare-fun array_inv!34490 (array!94138) Bool)

(assert (=> start!117620 (array_inv!34490 a!3931)))

(assert (=> start!117620 true))

(declare-fun bm!66381 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94138 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66381 (= call!66384 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun bm!66382 () Bool)

(assert (=> bm!66382 (= call!66385 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380780 () Bool)

(assert (=> b!1380780 (= e!782553 (= call!66384 call!66385))))

(assert (= (and start!117620 res!922702) b!1380778))

(assert (= (and b!1380778 c!128478) b!1380779))

(assert (= (and b!1380778 (not c!128478)) b!1380780))

(assert (= (or b!1380779 b!1380780) bm!66382))

(assert (= (or b!1380779 b!1380780) bm!66381))

(declare-fun m!1266027 () Bool)

(assert (=> b!1380778 m!1266027))

(assert (=> b!1380778 m!1266027))

(declare-fun m!1266029 () Bool)

(assert (=> b!1380778 m!1266029))

(declare-fun m!1266031 () Bool)

(assert (=> b!1380778 m!1266031))

(declare-fun m!1266033 () Bool)

(assert (=> start!117620 m!1266033))

(declare-fun m!1266035 () Bool)

(assert (=> bm!66381 m!1266035))

(declare-fun m!1266037 () Bool)

(assert (=> bm!66382 m!1266037))

(check-sat (not bm!66382) (not bm!66381) (not start!117620) (not b!1380778))
(check-sat)
