; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117536 () Bool)

(assert start!117536)

(declare-fun b!1380517 () Bool)

(declare-fun e!782266 () Bool)

(assert (=> b!1380517 (= e!782266 (not true))))

(declare-fun e!782267 () Bool)

(assert (=> b!1380517 e!782267))

(declare-fun c!128415 () Bool)

(declare-datatypes ((array!94054 0))(
  ( (array!94055 (arr!45420 (Array (_ BitVec 32) (_ BitVec 64))) (size!45970 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94054)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380517 (= c!128415 (validKeyInArray!0 (select (arr!45420 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45971 0))(
  ( (Unit!45972) )
))
(declare-fun lt!607983 () Unit!45971)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94054 (_ BitVec 32) (_ BitVec 32)) Unit!45971)

(assert (=> b!1380517 (= lt!607983 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380518 () Bool)

(declare-fun call!66258 () (_ BitVec 32))

(declare-fun call!66259 () (_ BitVec 32))

(assert (=> b!1380518 (= e!782267 (= (bvadd #b00000000000000000000000000000001 call!66258) call!66259))))

(declare-fun bm!66255 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94054 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66255 (= call!66259 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!922567 () Bool)

(assert (=> start!117536 (=> (not res!922567) (not e!782266))))

(assert (=> start!117536 (= res!922567 (and (bvslt (size!45970 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45970 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117536 e!782266))

(declare-fun array_inv!34448 (array!94054) Bool)

(assert (=> start!117536 (array_inv!34448 a!3931)))

(assert (=> start!117536 true))

(declare-fun bm!66256 () Bool)

(assert (=> bm!66256 (= call!66258 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380519 () Bool)

(assert (=> b!1380519 (= e!782267 (= call!66258 call!66259))))

(assert (= (and start!117536 res!922567) b!1380517))

(assert (= (and b!1380517 c!128415) b!1380518))

(assert (= (and b!1380517 (not c!128415)) b!1380519))

(assert (= (or b!1380518 b!1380519) bm!66255))

(assert (= (or b!1380518 b!1380519) bm!66256))

(declare-fun m!1265685 () Bool)

(assert (=> b!1380517 m!1265685))

(assert (=> b!1380517 m!1265685))

(declare-fun m!1265687 () Bool)

(assert (=> b!1380517 m!1265687))

(declare-fun m!1265689 () Bool)

(assert (=> b!1380517 m!1265689))

(declare-fun m!1265691 () Bool)

(assert (=> bm!66255 m!1265691))

(declare-fun m!1265693 () Bool)

(assert (=> start!117536 m!1265693))

(declare-fun m!1265695 () Bool)

(assert (=> bm!66256 m!1265695))

(check-sat (not b!1380517) (not bm!66255) (not start!117536) (not bm!66256))
