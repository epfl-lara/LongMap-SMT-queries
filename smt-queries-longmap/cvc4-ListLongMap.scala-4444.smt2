; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61770 () Bool)

(assert start!61770)

(declare-fun res!455659 () Bool)

(declare-fun e!393453 () Bool)

(assert (=> start!61770 (=> (not res!455659) (not e!393453))))

(declare-datatypes ((array!39791 0))(
  ( (array!39792 (arr!19064 (Array (_ BitVec 32) (_ BitVec 64))) (size!19449 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39791)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61770 (= res!455659 (and (bvslt (size!19449 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19449 a!3626))))))

(assert (=> start!61770 e!393453))

(assert (=> start!61770 true))

(declare-fun array_inv!14860 (array!39791) Bool)

(assert (=> start!61770 (array_inv!14860 a!3626)))

(declare-fun b!691274 () Bool)

(declare-fun res!455664 () Bool)

(assert (=> b!691274 (=> (not res!455664) (not e!393453))))

(declare-datatypes ((List!13105 0))(
  ( (Nil!13102) (Cons!13101 (h!14146 (_ BitVec 64)) (t!19372 List!13105)) )
))
(declare-fun acc!681 () List!13105)

(declare-fun noDuplicate!929 (List!13105) Bool)

(assert (=> b!691274 (= res!455664 (noDuplicate!929 acc!681))))

(declare-fun b!691275 () Bool)

(assert (=> b!691275 (= e!393453 (not true))))

(assert (=> b!691275 false))

(declare-datatypes ((Unit!24376 0))(
  ( (Unit!24377) )
))
(declare-fun lt!316447 () Unit!24376)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39791 (_ BitVec 64) (_ BitVec 32)) Unit!24376)

(assert (=> b!691275 (= lt!316447 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(declare-fun arrayContainsKey!0 (array!39791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691275 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!691276 () Bool)

(declare-fun e!393452 () Bool)

(declare-fun e!393454 () Bool)

(assert (=> b!691276 (= e!393452 e!393454)))

(declare-fun res!455669 () Bool)

(assert (=> b!691276 (=> (not res!455669) (not e!393454))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691276 (= res!455669 (bvsle from!3004 i!1382))))

(declare-fun b!691277 () Bool)

(declare-fun res!455660 () Bool)

(assert (=> b!691277 (=> (not res!455660) (not e!393453))))

(assert (=> b!691277 (= res!455660 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19449 a!3626))))))

(declare-fun b!691278 () Bool)

(declare-fun res!455654 () Bool)

(assert (=> b!691278 (=> (not res!455654) (not e!393453))))

(assert (=> b!691278 (= res!455654 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691279 () Bool)

(declare-fun res!455666 () Bool)

(assert (=> b!691279 (=> (not res!455666) (not e!393453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691279 (= res!455666 (validKeyInArray!0 (select (arr!19064 a!3626) from!3004)))))

(declare-fun b!691280 () Bool)

(declare-fun res!455662 () Bool)

(assert (=> b!691280 (=> (not res!455662) (not e!393453))))

(declare-fun arrayNoDuplicates!0 (array!39791 (_ BitVec 32) List!13105) Bool)

(assert (=> b!691280 (= res!455662 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691281 () Bool)

(declare-fun res!455657 () Bool)

(assert (=> b!691281 (=> (not res!455657) (not e!393453))))

(assert (=> b!691281 (= res!455657 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13102))))

(declare-fun b!691282 () Bool)

(declare-fun res!455667 () Bool)

(assert (=> b!691282 (=> (not res!455667) (not e!393453))))

(assert (=> b!691282 (= res!455667 (validKeyInArray!0 k!2843))))

(declare-fun b!691283 () Bool)

(declare-fun res!455656 () Bool)

(assert (=> b!691283 (=> (not res!455656) (not e!393453))))

(assert (=> b!691283 (= res!455656 (= (select (arr!19064 a!3626) from!3004) k!2843))))

(declare-fun b!691284 () Bool)

(declare-fun res!455661 () Bool)

(assert (=> b!691284 (=> (not res!455661) (not e!393453))))

(declare-fun contains!3682 (List!13105 (_ BitVec 64)) Bool)

(assert (=> b!691284 (= res!455661 (not (contains!3682 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691285 () Bool)

(declare-fun res!455655 () Bool)

(assert (=> b!691285 (=> (not res!455655) (not e!393453))))

(assert (=> b!691285 (= res!455655 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19449 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691286 () Bool)

(declare-fun res!455663 () Bool)

(assert (=> b!691286 (=> (not res!455663) (not e!393453))))

(assert (=> b!691286 (= res!455663 (not (contains!3682 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691287 () Bool)

(declare-fun e!393456 () Bool)

(assert (=> b!691287 (= e!393456 (contains!3682 acc!681 k!2843))))

(declare-fun b!691288 () Bool)

(declare-fun res!455665 () Bool)

(assert (=> b!691288 (=> (not res!455665) (not e!393453))))

(assert (=> b!691288 (= res!455665 e!393452)))

(declare-fun res!455668 () Bool)

(assert (=> b!691288 (=> res!455668 e!393452)))

(assert (=> b!691288 (= res!455668 e!393456)))

(declare-fun res!455658 () Bool)

(assert (=> b!691288 (=> (not res!455658) (not e!393456))))

(assert (=> b!691288 (= res!455658 (bvsgt from!3004 i!1382))))

(declare-fun b!691289 () Bool)

(assert (=> b!691289 (= e!393454 (not (contains!3682 acc!681 k!2843)))))

(assert (= (and start!61770 res!455659) b!691274))

(assert (= (and b!691274 res!455664) b!691286))

(assert (= (and b!691286 res!455663) b!691284))

(assert (= (and b!691284 res!455661) b!691288))

(assert (= (and b!691288 res!455658) b!691287))

(assert (= (and b!691288 (not res!455668)) b!691276))

(assert (= (and b!691276 res!455669) b!691289))

(assert (= (and b!691288 res!455665) b!691281))

(assert (= (and b!691281 res!455657) b!691280))

(assert (= (and b!691280 res!455662) b!691277))

(assert (= (and b!691277 res!455660) b!691282))

(assert (= (and b!691282 res!455667) b!691278))

(assert (= (and b!691278 res!455654) b!691285))

(assert (= (and b!691285 res!455655) b!691279))

(assert (= (and b!691279 res!455666) b!691283))

(assert (= (and b!691283 res!455656) b!691275))

(declare-fun m!654381 () Bool)

(assert (=> b!691278 m!654381))

(declare-fun m!654383 () Bool)

(assert (=> b!691286 m!654383))

(declare-fun m!654385 () Bool)

(assert (=> b!691275 m!654385))

(declare-fun m!654387 () Bool)

(assert (=> b!691275 m!654387))

(declare-fun m!654389 () Bool)

(assert (=> b!691282 m!654389))

(declare-fun m!654391 () Bool)

(assert (=> b!691279 m!654391))

(assert (=> b!691279 m!654391))

(declare-fun m!654393 () Bool)

(assert (=> b!691279 m!654393))

(assert (=> b!691283 m!654391))

(declare-fun m!654395 () Bool)

(assert (=> b!691274 m!654395))

(declare-fun m!654397 () Bool)

(assert (=> b!691284 m!654397))

(declare-fun m!654399 () Bool)

(assert (=> b!691281 m!654399))

(declare-fun m!654401 () Bool)

(assert (=> b!691289 m!654401))

(declare-fun m!654403 () Bool)

(assert (=> b!691280 m!654403))

(declare-fun m!654405 () Bool)

(assert (=> start!61770 m!654405))

(assert (=> b!691287 m!654401))

(push 1)

(assert (not b!691284))

(assert (not b!691281))

(assert (not b!691274))

(assert (not b!691282))

(assert (not b!691275))

(assert (not b!691280))

(assert (not b!691289))

(assert (not b!691287))

(assert (not b!691278))

(assert (not b!691286))

(assert (not start!61770))

(assert (not b!691279))

(check-sat)

(pop 1)

