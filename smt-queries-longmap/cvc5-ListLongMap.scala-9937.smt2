; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117444 () Bool)

(assert start!117444)

(declare-fun res!922379 () Bool)

(declare-fun e!781978 () Bool)

(assert (=> start!117444 (=> (not res!922379) (not e!781978))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93995 0))(
  ( (array!93996 (arr!45392 (Array (_ BitVec 32) (_ BitVec 64))) (size!45942 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93995)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117444 (= res!922379 (and (bvslt (size!45942 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45942 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117444 e!781978))

(assert (=> start!117444 true))

(declare-fun array_inv!34420 (array!93995) Bool)

(assert (=> start!117444 (array_inv!34420 a!3985)))

(declare-fun b!1380109 () Bool)

(declare-fun res!922381 () Bool)

(assert (=> b!1380109 (=> (not res!922381) (not e!781978))))

(declare-fun isPivot!0 (array!93995 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380109 (= res!922381 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1380110 () Bool)

(declare-fun res!922380 () Bool)

(assert (=> b!1380110 (=> (not res!922380) (not e!781978))))

(assert (=> b!1380110 (= res!922380 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1380111 () Bool)

(assert (=> b!1380111 (= e!781978 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 knownPivot!5) pivot!40) (bvslt (bvadd #b00000000000000000000000000000001 knownPivot!5) from!3363) (bvslt (bvsub pivot!40 (bvadd #b00000000000000000000000000000001 knownPivot!5)) (bvsub pivot!40 knownPivot!5)))))))

(assert (=> b!1380111 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45939 0))(
  ( (Unit!45940) )
))
(declare-fun lt!607860 () Unit!45939)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93995 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45939)

(assert (=> b!1380111 (= lt!607860 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117444 res!922379) b!1380109))

(assert (= (and b!1380109 res!922381) b!1380110))

(assert (= (and b!1380110 res!922380) b!1380111))

(declare-fun m!1265313 () Bool)

(assert (=> start!117444 m!1265313))

(declare-fun m!1265315 () Bool)

(assert (=> b!1380109 m!1265315))

(declare-fun m!1265317 () Bool)

(assert (=> b!1380111 m!1265317))

(declare-fun m!1265319 () Bool)

(assert (=> b!1380111 m!1265319))

(push 1)

(assert (not b!1380111))

(assert (not start!117444))

(assert (not b!1380109))

(check-sat)

(pop 1)

(push 1)

(check-sat)

