; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117532 () Bool)

(assert start!117532)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun call!66239 () (_ BitVec 32))

(declare-datatypes ((array!94004 0))(
  ( (array!94005 (arr!45395 (Array (_ BitVec 32) (_ BitVec 64))) (size!45947 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94004)

(declare-fun bm!66236 () Bool)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!94004 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66236 (= call!66239 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun call!66240 () (_ BitVec 32))

(declare-fun bm!66237 () Bool)

(assert (=> bm!66237 (= call!66240 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380448 () Bool)

(declare-fun e!782236 () Bool)

(assert (=> b!1380448 (= e!782236 (= (bvadd #b00000000000000000000000000000001 call!66239) call!66240))))

(declare-fun b!1380449 () Bool)

(assert (=> b!1380449 (= e!782236 (= call!66239 call!66240))))

(declare-fun b!1380450 () Bool)

(declare-fun e!782234 () Bool)

(assert (=> b!1380450 (= e!782234 (not true))))

(assert (=> b!1380450 e!782236))

(declare-fun c!128396 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380450 (= c!128396 (validKeyInArray!0 (select (arr!45395 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45812 0))(
  ( (Unit!45813) )
))
(declare-fun lt!607799 () Unit!45812)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94004 (_ BitVec 32) (_ BitVec 32)) Unit!45812)

(assert (=> b!1380450 (= lt!607799 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!922541 () Bool)

(assert (=> start!117532 (=> (not res!922541) (not e!782234))))

(assert (=> start!117532 (= res!922541 (and (bvslt (size!45947 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45947 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117532 e!782234))

(declare-fun array_inv!34628 (array!94004) Bool)

(assert (=> start!117532 (array_inv!34628 a!3931)))

(assert (=> start!117532 true))

(assert (= (and start!117532 res!922541) b!1380450))

(assert (= (and b!1380450 c!128396) b!1380448))

(assert (= (and b!1380450 (not c!128396)) b!1380449))

(assert (= (or b!1380448 b!1380449) bm!66237))

(assert (= (or b!1380448 b!1380449) bm!66236))

(declare-fun m!1265181 () Bool)

(assert (=> bm!66236 m!1265181))

(declare-fun m!1265183 () Bool)

(assert (=> bm!66237 m!1265183))

(declare-fun m!1265185 () Bool)

(assert (=> b!1380450 m!1265185))

(assert (=> b!1380450 m!1265185))

(declare-fun m!1265187 () Bool)

(assert (=> b!1380450 m!1265187))

(declare-fun m!1265189 () Bool)

(assert (=> b!1380450 m!1265189))

(declare-fun m!1265191 () Bool)

(assert (=> start!117532 m!1265191))

(push 1)

(assert (not b!1380450))

(assert (not bm!66236))

(assert (not bm!66237))

(assert (not start!117532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

