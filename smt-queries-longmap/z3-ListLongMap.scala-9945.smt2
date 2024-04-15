; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117524 () Bool)

(assert start!117524)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun bm!66212 () Bool)

(declare-fun call!66216 () (_ BitVec 32))

(declare-datatypes ((array!93996 0))(
  ( (array!93997 (arr!45391 (Array (_ BitVec 32) (_ BitVec 64))) (size!45943 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!93996)

(declare-fun arrayCountValidKeys!0 (array!93996 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66212 (= call!66216 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun call!66215 () (_ BitVec 32))

(declare-fun bm!66213 () Bool)

(assert (=> bm!66213 (= call!66215 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun e!782199 () Bool)

(declare-fun lt!607781 () Bool)

(declare-fun b!1380412 () Bool)

(assert (=> b!1380412 (= e!782199 (not (or (not lt!607781) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!45943 a!3931)))))))

(declare-fun e!782198 () Bool)

(assert (=> b!1380412 e!782198))

(declare-fun c!128384 () Bool)

(assert (=> b!1380412 (= c!128384 lt!607781)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380412 (= lt!607781 (validKeyInArray!0 (select (arr!45391 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45804 0))(
  ( (Unit!45805) )
))
(declare-fun lt!607780 () Unit!45804)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!93996 (_ BitVec 32) (_ BitVec 32)) Unit!45804)

(assert (=> b!1380412 (= lt!607780 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380413 () Bool)

(assert (=> b!1380413 (= e!782198 (= call!66216 call!66215))))

(declare-fun res!922529 () Bool)

(assert (=> start!117524 (=> (not res!922529) (not e!782199))))

(assert (=> start!117524 (= res!922529 (and (bvslt (size!45943 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45943 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117524 e!782199))

(declare-fun array_inv!34624 (array!93996) Bool)

(assert (=> start!117524 (array_inv!34624 a!3931)))

(assert (=> start!117524 true))

(declare-fun b!1380414 () Bool)

(assert (=> b!1380414 (= e!782198 (= (bvadd #b00000000000000000000000000000001 call!66216) call!66215))))

(assert (= (and start!117524 res!922529) b!1380412))

(assert (= (and b!1380412 c!128384) b!1380414))

(assert (= (and b!1380412 (not c!128384)) b!1380413))

(assert (= (or b!1380414 b!1380413) bm!66213))

(assert (= (or b!1380414 b!1380413) bm!66212))

(declare-fun m!1265133 () Bool)

(assert (=> bm!66212 m!1265133))

(declare-fun m!1265135 () Bool)

(assert (=> bm!66213 m!1265135))

(declare-fun m!1265137 () Bool)

(assert (=> b!1380412 m!1265137))

(assert (=> b!1380412 m!1265137))

(declare-fun m!1265139 () Bool)

(assert (=> b!1380412 m!1265139))

(declare-fun m!1265141 () Bool)

(assert (=> b!1380412 m!1265141))

(declare-fun m!1265143 () Bool)

(assert (=> start!117524 m!1265143))

(check-sat (not start!117524) (not bm!66212) (not bm!66213) (not b!1380412))
(check-sat)
