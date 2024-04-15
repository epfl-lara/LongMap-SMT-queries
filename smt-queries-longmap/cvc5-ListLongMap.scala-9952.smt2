; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117570 () Bool)

(assert start!117570)

(declare-fun b!1380619 () Bool)

(declare-fun e!782407 () Bool)

(assert (=> b!1380619 (= e!782407 (not true))))

(declare-fun e!782406 () Bool)

(assert (=> b!1380619 e!782406))

(declare-fun c!128453 () Bool)

(declare-datatypes ((array!94042 0))(
  ( (array!94043 (arr!45414 (Array (_ BitVec 32) (_ BitVec 64))) (size!45966 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94042)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380619 (= c!128453 (validKeyInArray!0 (select (arr!45414 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((Unit!45850 0))(
  ( (Unit!45851) )
))
(declare-fun lt!607883 () Unit!45850)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94042 (_ BitVec 32) (_ BitVec 32)) Unit!45850)

(assert (=> b!1380619 (= lt!607883 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!922598 () Bool)

(assert (=> start!117570 (=> (not res!922598) (not e!782407))))

(assert (=> start!117570 (= res!922598 (and (bvslt (size!45966 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45966 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117570 e!782407))

(declare-fun array_inv!34647 (array!94042) Bool)

(assert (=> start!117570 (array_inv!34647 a!3931)))

(assert (=> start!117570 true))

(declare-fun b!1380620 () Bool)

(declare-fun call!66354 () (_ BitVec 32))

(declare-fun call!66353 () (_ BitVec 32))

(assert (=> b!1380620 (= e!782406 (= call!66354 call!66353))))

(declare-fun bm!66350 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94042 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66350 (= call!66353 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66351 () Bool)

(assert (=> bm!66351 (= call!66354 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380621 () Bool)

(assert (=> b!1380621 (= e!782406 (= (bvadd #b00000000000000000000000000000001 call!66354) call!66353))))

(assert (= (and start!117570 res!922598) b!1380619))

(assert (= (and b!1380619 c!128453) b!1380621))

(assert (= (and b!1380619 (not c!128453)) b!1380620))

(assert (= (or b!1380621 b!1380620) bm!66350))

(assert (= (or b!1380621 b!1380620) bm!66351))

(declare-fun m!1265409 () Bool)

(assert (=> b!1380619 m!1265409))

(assert (=> b!1380619 m!1265409))

(declare-fun m!1265411 () Bool)

(assert (=> b!1380619 m!1265411))

(declare-fun m!1265413 () Bool)

(assert (=> b!1380619 m!1265413))

(declare-fun m!1265415 () Bool)

(assert (=> start!117570 m!1265415))

(declare-fun m!1265417 () Bool)

(assert (=> bm!66350 m!1265417))

(declare-fun m!1265419 () Bool)

(assert (=> bm!66351 m!1265419))

(push 1)

(assert (not bm!66351))

(assert (not start!117570))

(assert (not bm!66350))

(assert (not b!1380619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

