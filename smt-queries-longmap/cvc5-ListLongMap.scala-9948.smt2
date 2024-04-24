; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117782 () Bool)

(assert start!117782)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun bm!66364 () Bool)

(declare-fun call!66368 () (_ BitVec 32))

(declare-datatypes ((array!94184 0))(
  ( (array!94185 (arr!45480 (Array (_ BitVec 32) (_ BitVec 64))) (size!46031 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94184)

(declare-fun arrayCountValidKeys!0 (array!94184 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66364 (= call!66368 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1381890 () Bool)

(declare-fun e!783179 () Bool)

(assert (=> b!1381890 (= e!783179 (not true))))

(declare-fun e!783180 () Bool)

(assert (=> b!1381890 e!783180))

(declare-fun c!128838 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381890 (= c!128838 (validKeyInArray!0 (select (arr!45480 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45924 0))(
  ( (Unit!45925) )
))
(declare-fun lt!608494 () Unit!45924)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94184 (_ BitVec 32) (_ BitVec 32)) Unit!45924)

(assert (=> b!1381890 (= lt!608494 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!923109 () Bool)

(assert (=> start!117782 (=> (not res!923109) (not e!783179))))

(assert (=> start!117782 (= res!923109 (and (bvslt (size!46031 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46031 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117782 e!783179))

(declare-fun array_inv!34761 (array!94184) Bool)

(assert (=> start!117782 (array_inv!34761 a!3931)))

(assert (=> start!117782 true))

(declare-fun bm!66365 () Bool)

(declare-fun call!66367 () (_ BitVec 32))

(assert (=> bm!66365 (= call!66367 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1381891 () Bool)

(assert (=> b!1381891 (= e!783180 (= call!66367 call!66368))))

(declare-fun b!1381892 () Bool)

(assert (=> b!1381892 (= e!783180 (= (bvadd #b00000000000000000000000000000001 call!66367) call!66368))))

(assert (= (and start!117782 res!923109) b!1381890))

(assert (= (and b!1381890 c!128838) b!1381892))

(assert (= (and b!1381890 (not c!128838)) b!1381891))

(assert (= (or b!1381892 b!1381891) bm!66364))

(assert (= (or b!1381892 b!1381891) bm!66365))

(declare-fun m!1267405 () Bool)

(assert (=> bm!66364 m!1267405))

(declare-fun m!1267407 () Bool)

(assert (=> b!1381890 m!1267407))

(assert (=> b!1381890 m!1267407))

(declare-fun m!1267409 () Bool)

(assert (=> b!1381890 m!1267409))

(declare-fun m!1267411 () Bool)

(assert (=> b!1381890 m!1267411))

(declare-fun m!1267413 () Bool)

(assert (=> start!117782 m!1267413))

(declare-fun m!1267415 () Bool)

(assert (=> bm!66365 m!1267415))

(push 1)

(assert (not bm!66364))

(assert (not b!1381890))

(assert (not start!117782))

(assert (not bm!66365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

