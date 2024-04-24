; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117800 () Bool)

(assert start!117800)

(declare-fun b!1381971 () Bool)

(declare-fun e!783261 () Bool)

(declare-fun call!66422 () (_ BitVec 32))

(declare-fun call!66421 () (_ BitVec 32))

(assert (=> b!1381971 (= e!783261 (= (bvadd #b00000000000000000000000000000001 call!66422) call!66421))))

(declare-fun b!1381972 () Bool)

(assert (=> b!1381972 (= e!783261 (= call!66422 call!66421))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun bm!66419 () Bool)

(declare-datatypes ((array!94202 0))(
  ( (array!94203 (arr!45489 (Array (_ BitVec 32) (_ BitVec 64))) (size!46040 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94202)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!94202 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66419 (= call!66421 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun e!783260 () Bool)

(declare-fun lt!608539 () Bool)

(declare-fun b!1381973 () Bool)

(assert (=> b!1381973 (= e!783260 (not (or lt!608539 (bvsle from!3309 to!105))))))

(assert (=> b!1381973 e!783261))

(declare-fun c!128865 () Bool)

(assert (=> b!1381973 (= c!128865 lt!608539)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381973 (= lt!608539 (validKeyInArray!0 (select (arr!45489 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45942 0))(
  ( (Unit!45943) )
))
(declare-fun lt!608538 () Unit!45942)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94202 (_ BitVec 32) (_ BitVec 32)) Unit!45942)

(assert (=> b!1381973 (= lt!608538 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66418 () Bool)

(assert (=> bm!66418 (= call!66422 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun res!923136 () Bool)

(assert (=> start!117800 (=> (not res!923136) (not e!783260))))

(assert (=> start!117800 (= res!923136 (and (bvslt (size!46040 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46040 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117800 e!783260))

(declare-fun array_inv!34770 (array!94202) Bool)

(assert (=> start!117800 (array_inv!34770 a!3931)))

(assert (=> start!117800 true))

(assert (= (and start!117800 res!923136) b!1381973))

(assert (= (and b!1381973 c!128865) b!1381971))

(assert (= (and b!1381973 (not c!128865)) b!1381972))

(assert (= (or b!1381971 b!1381972) bm!66419))

(assert (= (or b!1381971 b!1381972) bm!66418))

(declare-fun m!1267513 () Bool)

(assert (=> bm!66419 m!1267513))

(declare-fun m!1267515 () Bool)

(assert (=> b!1381973 m!1267515))

(assert (=> b!1381973 m!1267515))

(declare-fun m!1267517 () Bool)

(assert (=> b!1381973 m!1267517))

(declare-fun m!1267519 () Bool)

(assert (=> b!1381973 m!1267519))

(declare-fun m!1267521 () Bool)

(assert (=> bm!66418 m!1267521))

(declare-fun m!1267523 () Bool)

(assert (=> start!117800 m!1267523))

(push 1)

(assert (not bm!66419))

(assert (not b!1381973))

(assert (not start!117800))

(assert (not bm!66418))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

