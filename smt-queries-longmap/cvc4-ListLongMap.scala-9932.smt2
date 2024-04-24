; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117648 () Bool)

(assert start!117648)

(declare-fun b!1381328 () Bool)

(declare-fun e!782740 () Bool)

(declare-fun to!159 () (_ BitVec 32))

(declare-fun from!3363 () (_ BitVec 32))

(assert (=> b!1381328 (= e!782740 (bvsgt to!159 from!3363))))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!94083 0))(
  ( (array!94084 (arr!45431 (Array (_ BitVec 32) (_ BitVec 64))) (size!45982 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!94083)

(declare-fun isPivot!0 (array!94083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381328 (isPivot!0 a!3985 from!3363 to!159 pivot!40)))

(declare-datatypes ((Unit!45868 0))(
  ( (Unit!45869) )
))
(declare-fun lt!608313 () Unit!45868)

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!94083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45868)

(assert (=> b!1381328 (= lt!608313 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!3985 from!3363 to!159 pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)))))

(declare-fun b!1381327 () Bool)

(declare-fun e!782741 () Bool)

(assert (=> b!1381327 (= e!782741 (not e!782740))))

(declare-fun res!922807 () Bool)

(assert (=> b!1381327 (=> res!922807 e!782740)))

(assert (=> b!1381327 (= res!922807 (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363)))))

(assert (=> b!1381327 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-fun lt!608314 () Unit!45868)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!94083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45868)

(assert (=> b!1381327 (= lt!608314 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun res!922809 () Bool)

(assert (=> start!117648 (=> (not res!922809) (not e!782741))))

(assert (=> start!117648 (= res!922809 (and (bvslt (size!45982 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45982 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117648 e!782741))

(assert (=> start!117648 true))

(declare-fun array_inv!34712 (array!94083) Bool)

(assert (=> start!117648 (array_inv!34712 a!3985)))

(declare-fun b!1381325 () Bool)

(declare-fun res!922806 () Bool)

(assert (=> b!1381325 (=> (not res!922806) (not e!782741))))

(assert (=> b!1381325 (= res!922806 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1381326 () Bool)

(declare-fun res!922808 () Bool)

(assert (=> b!1381326 (=> (not res!922808) (not e!782741))))

(assert (=> b!1381326 (= res!922808 (not (= knownPivot!5 pivot!40)))))

(assert (= (and start!117648 res!922809) b!1381325))

(assert (= (and b!1381325 res!922806) b!1381326))

(assert (= (and b!1381326 res!922808) b!1381327))

(assert (= (and b!1381327 (not res!922807)) b!1381328))

(declare-fun m!1266865 () Bool)

(assert (=> b!1381328 m!1266865))

(declare-fun m!1266867 () Bool)

(assert (=> b!1381328 m!1266867))

(declare-fun m!1266869 () Bool)

(assert (=> b!1381327 m!1266869))

(declare-fun m!1266871 () Bool)

(assert (=> b!1381327 m!1266871))

(declare-fun m!1266873 () Bool)

(assert (=> start!117648 m!1266873))

(declare-fun m!1266875 () Bool)

(assert (=> b!1381325 m!1266875))

(push 1)

(assert (not b!1381328))

(assert (not b!1381327))

(assert (not start!117648))

(assert (not b!1381325))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

