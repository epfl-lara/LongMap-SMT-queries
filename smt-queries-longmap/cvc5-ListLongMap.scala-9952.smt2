; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117570 () Bool)

(assert start!117570)

(declare-fun call!66361 () (_ BitVec 32))

(declare-fun bm!66357 () Bool)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94088 0))(
  ( (array!94089 (arr!45437 (Array (_ BitVec 32) (_ BitVec 64))) (size!45987 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94088)

(declare-fun arrayCountValidKeys!0 (array!94088 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66357 (= call!66361 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380670 () Bool)

(declare-fun e!782420 () Bool)

(declare-fun call!66360 () (_ BitVec 32))

(assert (=> b!1380670 (= e!782420 (= call!66360 call!66361))))

(declare-fun b!1380671 () Bool)

(assert (=> b!1380671 (= e!782420 (= (bvadd #b00000000000000000000000000000001 call!66360) call!66361))))

(declare-fun res!922618 () Bool)

(declare-fun e!782419 () Bool)

(assert (=> start!117570 (=> (not res!922618) (not e!782419))))

(assert (=> start!117570 (= res!922618 (and (bvslt (size!45987 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45987 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117570 e!782419))

(declare-fun array_inv!34465 (array!94088) Bool)

(assert (=> start!117570 (array_inv!34465 a!3931)))

(assert (=> start!117570 true))

(declare-fun b!1380672 () Bool)

(assert (=> b!1380672 (= e!782419 (not true))))

(assert (=> b!1380672 e!782420))

(declare-fun c!128466 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380672 (= c!128466 (validKeyInArray!0 (select (arr!45437 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!46005 0))(
  ( (Unit!46006) )
))
(declare-fun lt!608061 () Unit!46005)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94088 (_ BitVec 32) (_ BitVec 32)) Unit!46005)

(assert (=> b!1380672 (= lt!608061 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66358 () Bool)

(assert (=> bm!66358 (= call!66360 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (= (and start!117570 res!922618) b!1380672))

(assert (= (and b!1380672 c!128466) b!1380671))

(assert (= (and b!1380672 (not c!128466)) b!1380670))

(assert (= (or b!1380671 b!1380670) bm!66357))

(assert (= (or b!1380671 b!1380670) bm!66358))

(declare-fun m!1265889 () Bool)

(assert (=> bm!66357 m!1265889))

(declare-fun m!1265891 () Bool)

(assert (=> start!117570 m!1265891))

(declare-fun m!1265893 () Bool)

(assert (=> b!1380672 m!1265893))

(assert (=> b!1380672 m!1265893))

(declare-fun m!1265895 () Bool)

(assert (=> b!1380672 m!1265895))

(declare-fun m!1265897 () Bool)

(assert (=> b!1380672 m!1265897))

(declare-fun m!1265899 () Bool)

(assert (=> bm!66358 m!1265899))

(push 1)

(assert (not b!1380672))

(assert (not start!117570))

(assert (not bm!66357))

(assert (not bm!66358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

