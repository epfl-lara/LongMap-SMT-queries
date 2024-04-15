; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117614 () Bool)

(assert start!117614)

(declare-fun call!66359 () (_ BitVec 32))

(declare-fun bm!66356 () Bool)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94086 0))(
  ( (array!94087 (arr!45436 (Array (_ BitVec 32) (_ BitVec 64))) (size!45988 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94086)

(declare-fun arrayCountValidKeys!0 (array!94086 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66356 (= call!66359 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380700 () Bool)

(declare-fun e!782514 () Bool)

(assert (=> b!1380700 (= e!782514 (not (bvsge (bvsub to!105 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!782513 () Bool)

(assert (=> b!1380700 e!782513))

(declare-fun c!128456 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380700 (= c!128456 (validKeyInArray!0 (select (arr!45436 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45852 0))(
  ( (Unit!45853) )
))
(declare-fun lt!607886 () Unit!45852)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94086 (_ BitVec 32) (_ BitVec 32)) Unit!45852)

(assert (=> b!1380700 (= lt!607886 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!922673 () Bool)

(assert (=> start!117614 (=> (not res!922673) (not e!782514))))

(assert (=> start!117614 (= res!922673 (and (bvslt (size!45988 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45988 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117614 e!782514))

(declare-fun array_inv!34669 (array!94086) Bool)

(assert (=> start!117614 (array_inv!34669 a!3931)))

(assert (=> start!117614 true))

(declare-fun b!1380701 () Bool)

(declare-fun call!66360 () (_ BitVec 32))

(assert (=> b!1380701 (= e!782513 (= call!66359 call!66360))))

(declare-fun bm!66357 () Bool)

(assert (=> bm!66357 (= call!66360 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380702 () Bool)

(assert (=> b!1380702 (= e!782513 (= (bvadd #b00000000000000000000000000000001 call!66359) call!66360))))

(assert (= (and start!117614 res!922673) b!1380700))

(assert (= (and b!1380700 c!128456) b!1380702))

(assert (= (and b!1380700 (not c!128456)) b!1380701))

(assert (= (or b!1380702 b!1380701) bm!66357))

(assert (= (or b!1380702 b!1380701) bm!66356))

(declare-fun m!1265511 () Bool)

(assert (=> bm!66356 m!1265511))

(declare-fun m!1265513 () Bool)

(assert (=> b!1380700 m!1265513))

(assert (=> b!1380700 m!1265513))

(declare-fun m!1265515 () Bool)

(assert (=> b!1380700 m!1265515))

(declare-fun m!1265517 () Bool)

(assert (=> b!1380700 m!1265517))

(declare-fun m!1265519 () Bool)

(assert (=> start!117614 m!1265519))

(declare-fun m!1265521 () Bool)

(assert (=> bm!66357 m!1265521))

(check-sat (not start!117614) (not bm!66357) (not b!1380700) (not bm!66356))
(check-sat)
