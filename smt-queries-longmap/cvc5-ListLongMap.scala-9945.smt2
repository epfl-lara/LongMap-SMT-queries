; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117528 () Bool)

(assert start!117528)

(declare-fun b!1380481 () Bool)

(declare-fun e!782231 () Bool)

(declare-fun call!66235 () (_ BitVec 32))

(declare-fun call!66234 () (_ BitVec 32))

(assert (=> b!1380481 (= e!782231 (= (bvadd #b00000000000000000000000000000001 call!66235) call!66234))))

(declare-fun b!1380482 () Bool)

(assert (=> b!1380482 (= e!782231 (= call!66235 call!66234))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94046 0))(
  ( (array!94047 (arr!45416 (Array (_ BitVec 32) (_ BitVec 64))) (size!45966 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94046)

(declare-fun bm!66231 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94046 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66231 (= call!66235 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun lt!607964 () Bool)

(declare-fun b!1380483 () Bool)

(declare-fun e!782229 () Bool)

(assert (=> b!1380483 (= e!782229 (not (or (not lt!607964) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!45966 a!3931)))))))

(assert (=> b!1380483 e!782231))

(declare-fun c!128403 () Bool)

(assert (=> b!1380483 (= c!128403 lt!607964)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380483 (= lt!607964 (validKeyInArray!0 (select (arr!45416 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45963 0))(
  ( (Unit!45964) )
))
(declare-fun lt!607965 () Unit!45963)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94046 (_ BitVec 32) (_ BitVec 32)) Unit!45963)

(assert (=> b!1380483 (= lt!607965 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!922555 () Bool)

(assert (=> start!117528 (=> (not res!922555) (not e!782229))))

(assert (=> start!117528 (= res!922555 (and (bvslt (size!45966 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45966 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117528 e!782229))

(declare-fun array_inv!34444 (array!94046) Bool)

(assert (=> start!117528 (array_inv!34444 a!3931)))

(assert (=> start!117528 true))

(declare-fun bm!66232 () Bool)

(assert (=> bm!66232 (= call!66234 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (= (and start!117528 res!922555) b!1380483))

(assert (= (and b!1380483 c!128403) b!1380481))

(assert (= (and b!1380483 (not c!128403)) b!1380482))

(assert (= (or b!1380481 b!1380482) bm!66232))

(assert (= (or b!1380481 b!1380482) bm!66231))

(declare-fun m!1265637 () Bool)

(assert (=> bm!66231 m!1265637))

(declare-fun m!1265639 () Bool)

(assert (=> b!1380483 m!1265639))

(assert (=> b!1380483 m!1265639))

(declare-fun m!1265641 () Bool)

(assert (=> b!1380483 m!1265641))

(declare-fun m!1265643 () Bool)

(assert (=> b!1380483 m!1265643))

(declare-fun m!1265645 () Bool)

(assert (=> start!117528 m!1265645))

(declare-fun m!1265647 () Bool)

(assert (=> bm!66232 m!1265647))

(push 1)

(assert (not bm!66231))

(assert (not b!1380483))

(assert (not bm!66232))

(assert (not start!117528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

