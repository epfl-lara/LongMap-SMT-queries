; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117776 () Bool)

(assert start!117776)

(declare-fun b!1381863 () Bool)

(declare-fun e!783152 () Bool)

(declare-fun call!66349 () (_ BitVec 32))

(declare-fun call!66350 () (_ BitVec 32))

(assert (=> b!1381863 (= e!783152 (= call!66349 call!66350))))

(declare-fun res!923100 () Bool)

(declare-fun e!783153 () Bool)

(assert (=> start!117776 (=> (not res!923100) (not e!783153))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94178 0))(
  ( (array!94179 (arr!45477 (Array (_ BitVec 32) (_ BitVec 64))) (size!46028 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94178)

(assert (=> start!117776 (= res!923100 (and (bvslt (size!46028 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46028 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117776 e!783153))

(declare-fun array_inv!34758 (array!94178) Bool)

(assert (=> start!117776 (array_inv!34758 a!3931)))

(assert (=> start!117776 true))

(declare-fun b!1381864 () Bool)

(assert (=> b!1381864 (= e!783152 (= (bvadd #b00000000000000000000000000000001 call!66349) call!66350))))

(declare-fun bm!66346 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94178 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66346 (= call!66350 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun lt!608485 () Bool)

(declare-fun b!1381865 () Bool)

(assert (=> b!1381865 (= e!783153 (not (or (not lt!608485) (bvsle from!3309 to!105))))))

(assert (=> b!1381865 e!783152))

(declare-fun c!128829 () Bool)

(assert (=> b!1381865 (= c!128829 lt!608485)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381865 (= lt!608485 (validKeyInArray!0 (select (arr!45477 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45918 0))(
  ( (Unit!45919) )
))
(declare-fun lt!608484 () Unit!45918)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94178 (_ BitVec 32) (_ BitVec 32)) Unit!45918)

(assert (=> b!1381865 (= lt!608484 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66347 () Bool)

(assert (=> bm!66347 (= call!66349 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (= (and start!117776 res!923100) b!1381865))

(assert (= (and b!1381865 c!128829) b!1381864))

(assert (= (and b!1381865 (not c!128829)) b!1381863))

(assert (= (or b!1381864 b!1381863) bm!66346))

(assert (= (or b!1381864 b!1381863) bm!66347))

(declare-fun m!1267369 () Bool)

(assert (=> start!117776 m!1267369))

(declare-fun m!1267371 () Bool)

(assert (=> bm!66346 m!1267371))

(declare-fun m!1267373 () Bool)

(assert (=> b!1381865 m!1267373))

(assert (=> b!1381865 m!1267373))

(declare-fun m!1267375 () Bool)

(assert (=> b!1381865 m!1267375))

(declare-fun m!1267377 () Bool)

(assert (=> b!1381865 m!1267377))

(declare-fun m!1267379 () Bool)

(assert (=> bm!66347 m!1267379))

(push 1)

(assert (not b!1381865))

(assert (not bm!66347))

(assert (not start!117776))

(assert (not bm!66346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

