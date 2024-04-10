; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117622 () Bool)

(assert start!117622)

(declare-fun b!1380787 () Bool)

(declare-fun e!782562 () Bool)

(declare-fun call!66390 () (_ BitVec 32))

(declare-fun call!66391 () (_ BitVec 32))

(assert (=> b!1380787 (= e!782562 (= (bvadd #b00000000000000000000000000000001 call!66390) call!66391))))

(declare-fun res!922705 () Bool)

(declare-fun e!782564 () Bool)

(assert (=> start!117622 (=> (not res!922705) (not e!782564))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94140 0))(
  ( (array!94141 (arr!45463 (Array (_ BitVec 32) (_ BitVec 64))) (size!46013 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94140)

(assert (=> start!117622 (= res!922705 (and (bvslt (size!46013 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46013 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117622 e!782564))

(declare-fun array_inv!34491 (array!94140) Bool)

(assert (=> start!117622 (array_inv!34491 a!3931)))

(assert (=> start!117622 true))

(declare-fun b!1380788 () Bool)

(assert (=> b!1380788 (= e!782564 (not (bvsge (bvsub to!105 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1380788 e!782562))

(declare-fun c!128481 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380788 (= c!128481 (validKeyInArray!0 (select (arr!45463 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!46015 0))(
  ( (Unit!46016) )
))
(declare-fun lt!608076 () Unit!46015)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94140 (_ BitVec 32) (_ BitVec 32)) Unit!46015)

(assert (=> b!1380788 (= lt!608076 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66387 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94140 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66387 (= call!66391 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1380789 () Bool)

(assert (=> b!1380789 (= e!782562 (= call!66390 call!66391))))

(declare-fun bm!66388 () Bool)

(assert (=> bm!66388 (= call!66390 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (= (and start!117622 res!922705) b!1380788))

(assert (= (and b!1380788 c!128481) b!1380787))

(assert (= (and b!1380788 (not c!128481)) b!1380789))

(assert (= (or b!1380787 b!1380789) bm!66387))

(assert (= (or b!1380787 b!1380789) bm!66388))

(declare-fun m!1266039 () Bool)

(assert (=> start!117622 m!1266039))

(declare-fun m!1266041 () Bool)

(assert (=> b!1380788 m!1266041))

(assert (=> b!1380788 m!1266041))

(declare-fun m!1266043 () Bool)

(assert (=> b!1380788 m!1266043))

(declare-fun m!1266045 () Bool)

(assert (=> b!1380788 m!1266045))

(declare-fun m!1266047 () Bool)

(assert (=> bm!66387 m!1266047))

(declare-fun m!1266049 () Bool)

(assert (=> bm!66388 m!1266049))

(push 1)

(assert (not bm!66387))

(assert (not start!117622))

(assert (not b!1380788))

(assert (not bm!66388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

