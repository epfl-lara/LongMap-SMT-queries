; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117530 () Bool)

(assert start!117530)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun e!782238 () Bool)

(declare-fun b!1380490 () Bool)

(declare-fun lt!607970 () Bool)

(declare-datatypes ((array!94048 0))(
  ( (array!94049 (arr!45417 (Array (_ BitVec 32) (_ BitVec 64))) (size!45967 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94048)

(assert (=> b!1380490 (= e!782238 (not (or (not lt!607970) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!45967 a!3931)))))))

(declare-fun e!782240 () Bool)

(assert (=> b!1380490 e!782240))

(declare-fun c!128406 () Bool)

(assert (=> b!1380490 (= c!128406 lt!607970)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380490 (= lt!607970 (validKeyInArray!0 (select (arr!45417 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45965 0))(
  ( (Unit!45966) )
))
(declare-fun lt!607971 () Unit!45965)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94048 (_ BitVec 32) (_ BitVec 32)) Unit!45965)

(assert (=> b!1380490 (= lt!607971 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380491 () Bool)

(declare-fun call!66241 () (_ BitVec 32))

(declare-fun call!66240 () (_ BitVec 32))

(assert (=> b!1380491 (= e!782240 (= call!66241 call!66240))))

(declare-fun b!1380492 () Bool)

(assert (=> b!1380492 (= e!782240 (= (bvadd #b00000000000000000000000000000001 call!66241) call!66240))))

(declare-fun bm!66237 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94048 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66237 (= call!66240 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66238 () Bool)

(assert (=> bm!66238 (= call!66241 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun res!922558 () Bool)

(assert (=> start!117530 (=> (not res!922558) (not e!782238))))

(assert (=> start!117530 (= res!922558 (and (bvslt (size!45967 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45967 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117530 e!782238))

(declare-fun array_inv!34445 (array!94048) Bool)

(assert (=> start!117530 (array_inv!34445 a!3931)))

(assert (=> start!117530 true))

(assert (= (and start!117530 res!922558) b!1380490))

(assert (= (and b!1380490 c!128406) b!1380492))

(assert (= (and b!1380490 (not c!128406)) b!1380491))

(assert (= (or b!1380492 b!1380491) bm!66237))

(assert (= (or b!1380492 b!1380491) bm!66238))

(declare-fun m!1265649 () Bool)

(assert (=> b!1380490 m!1265649))

(assert (=> b!1380490 m!1265649))

(declare-fun m!1265651 () Bool)

(assert (=> b!1380490 m!1265651))

(declare-fun m!1265653 () Bool)

(assert (=> b!1380490 m!1265653))

(declare-fun m!1265655 () Bool)

(assert (=> bm!66237 m!1265655))

(declare-fun m!1265657 () Bool)

(assert (=> bm!66238 m!1265657))

(declare-fun m!1265659 () Bool)

(assert (=> start!117530 m!1265659))

(check-sat (not bm!66237) (not bm!66238) (not start!117530) (not b!1380490))
(check-sat)
