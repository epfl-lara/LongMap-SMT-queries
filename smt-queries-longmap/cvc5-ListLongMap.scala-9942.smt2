; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117474 () Bool)

(assert start!117474)

(declare-fun b!1380212 () Bool)

(declare-fun e!782071 () Bool)

(declare-fun call!66132 () (_ BitVec 32))

(declare-fun call!66133 () (_ BitVec 32))

(assert (=> b!1380212 (= e!782071 (= (bvadd #b00000000000000000000000000000001 call!66132) call!66133))))

(declare-fun b!1380213 () Bool)

(declare-fun res!922480 () Bool)

(declare-fun e!782070 () Bool)

(assert (=> b!1380213 (=> (not res!922480) (not e!782070))))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94025 0))(
  ( (array!94026 (arr!45407 (Array (_ BitVec 32) (_ BitVec 64))) (size!45957 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94025)

(assert (=> b!1380213 (= res!922480 (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45957 a!3961)))))

(declare-fun res!922479 () Bool)

(assert (=> start!117474 (=> (not res!922479) (not e!782070))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117474 (= res!922479 (and (bvslt (size!45957 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45957 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117474 e!782070))

(declare-fun array_inv!34435 (array!94025) Bool)

(assert (=> start!117474 (array_inv!34435 a!3961)))

(assert (=> start!117474 true))

(declare-fun b!1380214 () Bool)

(declare-fun res!922478 () Bool)

(assert (=> b!1380214 (=> (not res!922478) (not e!782070))))

(declare-fun isPivot!0 (array!94025 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380214 (= res!922478 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(declare-fun bm!66129 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94025 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66129 (= call!66133 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380215 () Bool)

(assert (=> b!1380215 (= e!782070 (not (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) from!3339)))))

(assert (=> b!1380215 e!782071))

(declare-fun c!128307 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380215 (= c!128307 (validKeyInArray!0 (select (arr!45407 a!3961) pivot!34)))))

(declare-datatypes ((Unit!45951 0))(
  ( (Unit!45952) )
))
(declare-fun lt!607896 () Unit!45951)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94025 (_ BitVec 32) (_ BitVec 32)) Unit!45951)

(assert (=> b!1380215 (= lt!607896 (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun bm!66130 () Bool)

(assert (=> bm!66130 (= call!66132 (arrayCountValidKeys!0 a!3961 from!3339 pivot!34))))

(declare-fun b!1380216 () Bool)

(assert (=> b!1380216 (= e!782071 (= call!66132 call!66133))))

(assert (= (and start!117474 res!922479) b!1380214))

(assert (= (and b!1380214 res!922478) b!1380213))

(assert (= (and b!1380213 res!922480) b!1380215))

(assert (= (and b!1380215 c!128307) b!1380212))

(assert (= (and b!1380215 (not c!128307)) b!1380216))

(assert (= (or b!1380212 b!1380216) bm!66130))

(assert (= (or b!1380212 b!1380216) bm!66129))

(declare-fun m!1265409 () Bool)

(assert (=> bm!66129 m!1265409))

(declare-fun m!1265411 () Bool)

(assert (=> b!1380215 m!1265411))

(assert (=> b!1380215 m!1265411))

(declare-fun m!1265413 () Bool)

(assert (=> b!1380215 m!1265413))

(declare-fun m!1265415 () Bool)

(assert (=> b!1380215 m!1265415))

(declare-fun m!1265417 () Bool)

(assert (=> bm!66130 m!1265417))

(declare-fun m!1265419 () Bool)

(assert (=> start!117474 m!1265419))

(declare-fun m!1265421 () Bool)

(assert (=> b!1380214 m!1265421))

(push 1)

(assert (not start!117474))

(assert (not bm!66129))

(assert (not bm!66130))

(assert (not b!1380214))

(assert (not b!1380215))

(check-sat)

(pop 1)

(push 1)

(check-sat)

