; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117572 () Bool)

(assert start!117572)

(declare-fun res!922621 () Bool)

(declare-fun e!782429 () Bool)

(assert (=> start!117572 (=> (not res!922621) (not e!782429))))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94090 0))(
  ( (array!94091 (arr!45438 (Array (_ BitVec 32) (_ BitVec 64))) (size!45988 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94090)

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117572 (= res!922621 (and (bvslt (size!45988 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45988 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117572 e!782429))

(declare-fun array_inv!34466 (array!94090) Bool)

(assert (=> start!117572 (array_inv!34466 a!3931)))

(assert (=> start!117572 true))

(declare-fun b!1380679 () Bool)

(declare-fun e!782428 () Bool)

(declare-fun call!66367 () (_ BitVec 32))

(declare-fun call!66366 () (_ BitVec 32))

(assert (=> b!1380679 (= e!782428 (= (bvadd #b00000000000000000000000000000001 call!66367) call!66366))))

(declare-fun b!1380680 () Bool)

(assert (=> b!1380680 (= e!782429 (not true))))

(assert (=> b!1380680 e!782428))

(declare-fun c!128469 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380680 (= c!128469 (validKeyInArray!0 (select (arr!45438 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!46007 0))(
  ( (Unit!46008) )
))
(declare-fun lt!608064 () Unit!46007)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94090 (_ BitVec 32) (_ BitVec 32)) Unit!46007)

(assert (=> b!1380680 (= lt!608064 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66363 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94090 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66363 (= call!66367 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun bm!66364 () Bool)

(assert (=> bm!66364 (= call!66366 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380681 () Bool)

(assert (=> b!1380681 (= e!782428 (= call!66367 call!66366))))

(assert (= (and start!117572 res!922621) b!1380680))

(assert (= (and b!1380680 c!128469) b!1380679))

(assert (= (and b!1380680 (not c!128469)) b!1380681))

(assert (= (or b!1380679 b!1380681) bm!66364))

(assert (= (or b!1380679 b!1380681) bm!66363))

(declare-fun m!1265901 () Bool)

(assert (=> start!117572 m!1265901))

(declare-fun m!1265903 () Bool)

(assert (=> b!1380680 m!1265903))

(assert (=> b!1380680 m!1265903))

(declare-fun m!1265905 () Bool)

(assert (=> b!1380680 m!1265905))

(declare-fun m!1265907 () Bool)

(assert (=> b!1380680 m!1265907))

(declare-fun m!1265909 () Bool)

(assert (=> bm!66363 m!1265909))

(declare-fun m!1265911 () Bool)

(assert (=> bm!66364 m!1265911))

(check-sat (not bm!66363) (not b!1380680) (not bm!66364) (not start!117572))
