; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117788 () Bool)

(assert start!117788)

(declare-fun res!923118 () Bool)

(declare-fun e!783207 () Bool)

(assert (=> start!117788 (=> (not res!923118) (not e!783207))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94190 0))(
  ( (array!94191 (arr!45483 (Array (_ BitVec 32) (_ BitVec 64))) (size!46034 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94190)

(assert (=> start!117788 (= res!923118 (and (bvslt (size!46034 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46034 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117788 e!783207))

(declare-fun array_inv!34764 (array!94190) Bool)

(assert (=> start!117788 (array_inv!34764 a!3931)))

(assert (=> start!117788 true))

(declare-fun b!1381917 () Bool)

(declare-fun e!783205 () Bool)

(declare-fun call!66385 () (_ BitVec 32))

(declare-fun call!66386 () (_ BitVec 32))

(assert (=> b!1381917 (= e!783205 (= (bvadd #b00000000000000000000000000000001 call!66385) call!66386))))

(declare-fun b!1381918 () Bool)

(assert (=> b!1381918 (= e!783205 (= call!66385 call!66386))))

(declare-fun b!1381919 () Bool)

(declare-fun lt!608511 () Bool)

(assert (=> b!1381919 (= e!783207 (not (or lt!608511 (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46034 a!3931)))))))

(assert (=> b!1381919 e!783205))

(declare-fun c!128847 () Bool)

(assert (=> b!1381919 (= c!128847 lt!608511)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381919 (= lt!608511 (validKeyInArray!0 (select (arr!45483 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45930 0))(
  ( (Unit!45931) )
))
(declare-fun lt!608512 () Unit!45930)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94190 (_ BitVec 32) (_ BitVec 32)) Unit!45930)

(assert (=> b!1381919 (= lt!608512 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66382 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94190 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66382 (= call!66386 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66383 () Bool)

(assert (=> bm!66383 (= call!66385 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (= (and start!117788 res!923118) b!1381919))

(assert (= (and b!1381919 c!128847) b!1381917))

(assert (= (and b!1381919 (not c!128847)) b!1381918))

(assert (= (or b!1381917 b!1381918) bm!66382))

(assert (= (or b!1381917 b!1381918) bm!66383))

(declare-fun m!1267441 () Bool)

(assert (=> start!117788 m!1267441))

(declare-fun m!1267443 () Bool)

(assert (=> b!1381919 m!1267443))

(assert (=> b!1381919 m!1267443))

(declare-fun m!1267445 () Bool)

(assert (=> b!1381919 m!1267445))

(declare-fun m!1267447 () Bool)

(assert (=> b!1381919 m!1267447))

(declare-fun m!1267449 () Bool)

(assert (=> bm!66382 m!1267449))

(declare-fun m!1267451 () Bool)

(assert (=> bm!66383 m!1267451))

(push 1)

(assert (not b!1381919))

(assert (not bm!66382))

(assert (not bm!66383))

(assert (not start!117788))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

