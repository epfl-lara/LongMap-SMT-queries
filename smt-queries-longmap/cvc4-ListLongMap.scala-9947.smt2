; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117544 () Bool)

(assert start!117544)

(declare-fun res!922579 () Bool)

(declare-fun e!782302 () Bool)

(assert (=> start!117544 (=> (not res!922579) (not e!782302))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94062 0))(
  ( (array!94063 (arr!45424 (Array (_ BitVec 32) (_ BitVec 64))) (size!45974 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94062)

(assert (=> start!117544 (= res!922579 (and (bvslt (size!45974 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45974 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117544 e!782302))

(declare-fun array_inv!34452 (array!94062) Bool)

(assert (=> start!117544 (array_inv!34452 a!3931)))

(assert (=> start!117544 true))

(declare-fun b!1380553 () Bool)

(declare-fun e!782301 () Bool)

(declare-fun call!66283 () (_ BitVec 32))

(declare-fun call!66282 () (_ BitVec 32))

(assert (=> b!1380553 (= e!782301 (= call!66283 call!66282))))

(declare-fun bm!66279 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94062 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66279 (= call!66282 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380554 () Bool)

(assert (=> b!1380554 (= e!782301 (= (bvadd #b00000000000000000000000000000001 call!66283) call!66282))))

(declare-fun bm!66280 () Bool)

(assert (=> bm!66280 (= call!66283 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun lt!608003 () Bool)

(declare-fun b!1380555 () Bool)

(assert (=> b!1380555 (= e!782302 (not (or (not lt!608003) (bvsle from!3309 to!105))))))

(assert (=> b!1380555 e!782301))

(declare-fun c!128427 () Bool)

(assert (=> b!1380555 (= c!128427 lt!608003)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380555 (= lt!608003 (validKeyInArray!0 (select (arr!45424 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45979 0))(
  ( (Unit!45980) )
))
(declare-fun lt!608004 () Unit!45979)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94062 (_ BitVec 32) (_ BitVec 32)) Unit!45979)

(assert (=> b!1380555 (= lt!608004 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (= (and start!117544 res!922579) b!1380555))

(assert (= (and b!1380555 c!128427) b!1380554))

(assert (= (and b!1380555 (not c!128427)) b!1380553))

(assert (= (or b!1380554 b!1380553) bm!66279))

(assert (= (or b!1380554 b!1380553) bm!66280))

(declare-fun m!1265733 () Bool)

(assert (=> start!117544 m!1265733))

(declare-fun m!1265735 () Bool)

(assert (=> bm!66279 m!1265735))

(declare-fun m!1265737 () Bool)

(assert (=> bm!66280 m!1265737))

(declare-fun m!1265739 () Bool)

(assert (=> b!1380555 m!1265739))

(assert (=> b!1380555 m!1265739))

(declare-fun m!1265741 () Bool)

(assert (=> b!1380555 m!1265741))

(declare-fun m!1265743 () Bool)

(assert (=> b!1380555 m!1265743))

(push 1)

(assert (not bm!66279))

(assert (not bm!66280))

(assert (not b!1380555))

(assert (not start!117544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

