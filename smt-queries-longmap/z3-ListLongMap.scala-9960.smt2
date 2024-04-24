; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117850 () Bool)

(assert start!117850)

(declare-fun b!1382079 () Bool)

(declare-fun e!783396 () Bool)

(declare-fun to!105 () (_ BitVec 32))

(assert (=> b!1382079 (= e!783396 (not (bvsge (bvsub to!105 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!783395 () Bool)

(assert (=> b!1382079 e!783395))

(declare-fun c!128877 () Bool)

(declare-datatypes ((array!94252 0))(
  ( (array!94253 (arr!45514 (Array (_ BitVec 32) (_ BitVec 64))) (size!46065 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94252)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382079 (= c!128877 (validKeyInArray!0 (select (arr!45514 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((Unit!45950 0))(
  ( (Unit!45951) )
))
(declare-fun lt!608551 () Unit!45950)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94252 (_ BitVec 32) (_ BitVec 32)) Unit!45950)

(assert (=> b!1382079 (= lt!608551 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun call!66445 () (_ BitVec 32))

(declare-fun bm!66442 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94252 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66442 (= call!66445 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun call!66446 () (_ BitVec 32))

(declare-fun bm!66443 () Bool)

(assert (=> bm!66443 (= call!66446 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!923220 () Bool)

(assert (=> start!117850 (=> (not res!923220) (not e!783396))))

(assert (=> start!117850 (= res!923220 (and (bvslt (size!46065 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46065 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117850 e!783396))

(declare-fun array_inv!34795 (array!94252) Bool)

(assert (=> start!117850 (array_inv!34795 a!3931)))

(assert (=> start!117850 true))

(declare-fun b!1382080 () Bool)

(assert (=> b!1382080 (= e!783395 (= (bvadd #b00000000000000000000000000000001 call!66445) call!66446))))

(declare-fun b!1382081 () Bool)

(assert (=> b!1382081 (= e!783395 (= call!66445 call!66446))))

(assert (= (and start!117850 res!923220) b!1382079))

(assert (= (and b!1382079 c!128877) b!1382080))

(assert (= (and b!1382079 (not c!128877)) b!1382081))

(assert (= (or b!1382080 b!1382081) bm!66443))

(assert (= (or b!1382080 b!1382081) bm!66442))

(declare-fun m!1267651 () Bool)

(assert (=> b!1382079 m!1267651))

(assert (=> b!1382079 m!1267651))

(declare-fun m!1267653 () Bool)

(assert (=> b!1382079 m!1267653))

(declare-fun m!1267655 () Bool)

(assert (=> b!1382079 m!1267655))

(declare-fun m!1267657 () Bool)

(assert (=> bm!66442 m!1267657))

(declare-fun m!1267659 () Bool)

(assert (=> bm!66443 m!1267659))

(declare-fun m!1267661 () Bool)

(assert (=> start!117850 m!1267661))

(check-sat (not bm!66443) (not start!117850) (not bm!66442) (not b!1382079))
(check-sat)
