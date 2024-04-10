; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117554 () Bool)

(assert start!117554)

(declare-fun b!1380598 () Bool)

(declare-fun e!782346 () Bool)

(declare-fun call!66313 () (_ BitVec 32))

(declare-fun call!66312 () (_ BitVec 32))

(assert (=> b!1380598 (= e!782346 (= (bvadd #b00000000000000000000000000000001 call!66313) call!66312))))

(declare-fun e!782347 () Bool)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun b!1380599 () Bool)

(declare-fun lt!608025 () Bool)

(declare-datatypes ((array!94072 0))(
  ( (array!94073 (arr!45429 (Array (_ BitVec 32) (_ BitVec 64))) (size!45979 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94072)

(assert (=> b!1380599 (= e!782347 (not (or lt!608025 (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!45979 a!3931)))))))

(assert (=> b!1380599 e!782346))

(declare-fun c!128442 () Bool)

(assert (=> b!1380599 (= c!128442 lt!608025)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380599 (= lt!608025 (validKeyInArray!0 (select (arr!45429 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45989 0))(
  ( (Unit!45990) )
))
(declare-fun lt!608024 () Unit!45989)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94072 (_ BitVec 32) (_ BitVec 32)) Unit!45989)

(assert (=> b!1380599 (= lt!608024 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!922594 () Bool)

(assert (=> start!117554 (=> (not res!922594) (not e!782347))))

(assert (=> start!117554 (= res!922594 (and (bvslt (size!45979 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45979 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117554 e!782347))

(declare-fun array_inv!34457 (array!94072) Bool)

(assert (=> start!117554 (array_inv!34457 a!3931)))

(assert (=> start!117554 true))

(declare-fun bm!66309 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94072 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66309 (= call!66313 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380600 () Bool)

(assert (=> b!1380600 (= e!782346 (= call!66313 call!66312))))

(declare-fun bm!66310 () Bool)

(assert (=> bm!66310 (= call!66312 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (= (and start!117554 res!922594) b!1380599))

(assert (= (and b!1380599 c!128442) b!1380598))

(assert (= (and b!1380599 (not c!128442)) b!1380600))

(assert (= (or b!1380598 b!1380600) bm!66310))

(assert (= (or b!1380598 b!1380600) bm!66309))

(declare-fun m!1265793 () Bool)

(assert (=> b!1380599 m!1265793))

(assert (=> b!1380599 m!1265793))

(declare-fun m!1265795 () Bool)

(assert (=> b!1380599 m!1265795))

(declare-fun m!1265797 () Bool)

(assert (=> b!1380599 m!1265797))

(declare-fun m!1265799 () Bool)

(assert (=> start!117554 m!1265799))

(declare-fun m!1265801 () Bool)

(assert (=> bm!66309 m!1265801))

(declare-fun m!1265803 () Bool)

(assert (=> bm!66310 m!1265803))

(check-sat (not bm!66309) (not start!117554) (not bm!66310) (not b!1380599))
(check-sat)
