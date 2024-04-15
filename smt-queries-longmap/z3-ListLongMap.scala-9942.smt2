; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117470 () Bool)

(assert start!117470)

(declare-fun b!1380143 () Bool)

(declare-fun res!922452 () Bool)

(declare-fun e!782040 () Bool)

(assert (=> b!1380143 (=> (not res!922452) (not e!782040))))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!93975 0))(
  ( (array!93976 (arr!45382 (Array (_ BitVec 32) (_ BitVec 64))) (size!45934 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!93975)

(assert (=> b!1380143 (= res!922452 (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45934 a!3961)))))

(declare-fun b!1380144 () Bool)

(declare-fun e!782039 () Bool)

(declare-fun call!66114 () (_ BitVec 32))

(declare-fun call!66113 () (_ BitVec 32))

(assert (=> b!1380144 (= e!782039 (= (bvadd #b00000000000000000000000000000001 call!66114) call!66113))))

(declare-fun res!922454 () Bool)

(assert (=> start!117470 (=> (not res!922454) (not e!782040))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117470 (= res!922454 (and (bvslt (size!45934 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45934 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117470 e!782040))

(declare-fun array_inv!34615 (array!93975) Bool)

(assert (=> start!117470 (array_inv!34615 a!3961)))

(assert (=> start!117470 true))

(declare-fun b!1380145 () Bool)

(declare-fun res!922453 () Bool)

(assert (=> b!1380145 (=> (not res!922453) (not e!782040))))

(declare-fun isPivot!0 (array!93975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380145 (= res!922453 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(declare-fun bm!66110 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93975 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66110 (= call!66113 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun bm!66111 () Bool)

(assert (=> bm!66111 (= call!66114 (arrayCountValidKeys!0 a!3961 from!3339 pivot!34))))

(declare-fun b!1380146 () Bool)

(assert (=> b!1380146 (= e!782040 (not (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) from!3339)))))

(assert (=> b!1380146 e!782039))

(declare-fun c!128288 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380146 (= c!128288 (validKeyInArray!0 (select (arr!45382 a!3961) pivot!34)))))

(declare-datatypes ((Unit!45792 0))(
  ( (Unit!45793) )
))
(declare-fun lt!607712 () Unit!45792)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!93975 (_ BitVec 32) (_ BitVec 32)) Unit!45792)

(assert (=> b!1380146 (= lt!607712 (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380147 () Bool)

(assert (=> b!1380147 (= e!782039 (= call!66114 call!66113))))

(assert (= (and start!117470 res!922454) b!1380145))

(assert (= (and b!1380145 res!922453) b!1380143))

(assert (= (and b!1380143 res!922452) b!1380146))

(assert (= (and b!1380146 c!128288) b!1380144))

(assert (= (and b!1380146 (not c!128288)) b!1380147))

(assert (= (or b!1380144 b!1380147) bm!66111))

(assert (= (or b!1380144 b!1380147) bm!66110))

(declare-fun m!1264905 () Bool)

(assert (=> b!1380146 m!1264905))

(assert (=> b!1380146 m!1264905))

(declare-fun m!1264907 () Bool)

(assert (=> b!1380146 m!1264907))

(declare-fun m!1264909 () Bool)

(assert (=> b!1380146 m!1264909))

(declare-fun m!1264911 () Bool)

(assert (=> bm!66110 m!1264911))

(declare-fun m!1264913 () Bool)

(assert (=> bm!66111 m!1264913))

(declare-fun m!1264915 () Bool)

(assert (=> start!117470 m!1264915))

(declare-fun m!1264917 () Bool)

(assert (=> b!1380145 m!1264917))

(check-sat (not b!1380145) (not b!1380146) (not bm!66110) (not start!117470) (not bm!66111))
(check-sat)
