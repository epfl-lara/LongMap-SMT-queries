; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117520 () Bool)

(assert start!117520)

(declare-fun res!922637 () Bool)

(declare-fun e!782447 () Bool)

(assert (=> start!117520 (=> (not res!922637) (not e!782447))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!94000 0))(
  ( (array!94001 (arr!45394 (Array (_ BitVec 32) (_ BitVec 64))) (size!45945 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!94000)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117520 (= res!922637 (and (bvslt (size!45945 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45945 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117520 e!782447))

(declare-fun array_inv!34675 (array!94000) Bool)

(assert (=> start!117520 (array_inv!34675 a!4010)))

(assert (=> start!117520 true))

(declare-fun b!1380988 () Bool)

(declare-fun res!922638 () Bool)

(assert (=> b!1380988 (=> (not res!922638) (not e!782447))))

(declare-fun isPivot!0 (array!94000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380988 (= res!922638 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1380989 () Bool)

(assert (=> b!1380989 (= e!782447 (not (bvsge pivot!64 #b00000000000000000000000000000000)))))

(assert (=> b!1380989 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45830 0))(
  ( (Unit!45831) )
))
(declare-fun lt!608191 () Unit!45830)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!94000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45830)

(assert (=> b!1380989 (= lt!608191 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117520 res!922637) b!1380988))

(assert (= (and b!1380988 res!922638) b!1380989))

(declare-fun m!1266493 () Bool)

(assert (=> start!117520 m!1266493))

(declare-fun m!1266495 () Bool)

(assert (=> b!1380988 m!1266495))

(declare-fun m!1266497 () Bool)

(assert (=> b!1380989 m!1266497))

(declare-fun m!1266499 () Bool)

(assert (=> b!1380989 m!1266499))

(check-sat (not b!1380988) (not start!117520) (not b!1380989))
(check-sat)
