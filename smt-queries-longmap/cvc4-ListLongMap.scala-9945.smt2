; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117532 () Bool)

(assert start!117532)

(declare-fun res!922561 () Bool)

(declare-fun e!782247 () Bool)

(assert (=> start!117532 (=> (not res!922561) (not e!782247))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94050 0))(
  ( (array!94051 (arr!45418 (Array (_ BitVec 32) (_ BitVec 64))) (size!45968 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94050)

(assert (=> start!117532 (= res!922561 (and (bvslt (size!45968 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45968 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117532 e!782247))

(declare-fun array_inv!34446 (array!94050) Bool)

(assert (=> start!117532 (array_inv!34446 a!3931)))

(assert (=> start!117532 true))

(declare-fun lt!607977 () Bool)

(declare-fun b!1380499 () Bool)

(assert (=> b!1380499 (= e!782247 (not (or (not lt!607977) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!45968 a!3931)))))))

(declare-fun e!782248 () Bool)

(assert (=> b!1380499 e!782248))

(declare-fun c!128409 () Bool)

(assert (=> b!1380499 (= c!128409 lt!607977)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380499 (= lt!607977 (validKeyInArray!0 (select (arr!45418 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45967 0))(
  ( (Unit!45968) )
))
(declare-fun lt!607976 () Unit!45967)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94050 (_ BitVec 32) (_ BitVec 32)) Unit!45967)

(assert (=> b!1380499 (= lt!607976 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66243 () Bool)

(declare-fun call!66247 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!94050 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66243 (= call!66247 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380500 () Bool)

(declare-fun call!66246 () (_ BitVec 32))

(assert (=> b!1380500 (= e!782248 (= call!66246 call!66247))))

(declare-fun bm!66244 () Bool)

(assert (=> bm!66244 (= call!66246 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380501 () Bool)

(assert (=> b!1380501 (= e!782248 (= (bvadd #b00000000000000000000000000000001 call!66246) call!66247))))

(assert (= (and start!117532 res!922561) b!1380499))

(assert (= (and b!1380499 c!128409) b!1380501))

(assert (= (and b!1380499 (not c!128409)) b!1380500))

(assert (= (or b!1380501 b!1380500) bm!66243))

(assert (= (or b!1380501 b!1380500) bm!66244))

(declare-fun m!1265661 () Bool)

(assert (=> start!117532 m!1265661))

(declare-fun m!1265663 () Bool)

(assert (=> b!1380499 m!1265663))

(assert (=> b!1380499 m!1265663))

(declare-fun m!1265665 () Bool)

(assert (=> b!1380499 m!1265665))

(declare-fun m!1265667 () Bool)

(assert (=> b!1380499 m!1265667))

(declare-fun m!1265669 () Bool)

(assert (=> bm!66243 m!1265669))

(declare-fun m!1265671 () Bool)

(assert (=> bm!66244 m!1265671))

(push 1)

(assert (not bm!66244))

(assert (not start!117532))

(assert (not b!1380499))

(assert (not bm!66243))

(check-sat)

(pop 1)

(push 1)

(check-sat)

