; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69688 () Bool)

(assert start!69688)

(declare-fun res!554855 () Bool)

(declare-fun e!449326 () Bool)

(assert (=> start!69688 (=> (not res!554855) (not e!449326))))

(declare-datatypes ((array!44109 0))(
  ( (array!44110 (arr!21124 (Array (_ BitVec 32) (_ BitVec 64))) (size!21545 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44109)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(assert (=> start!69688 (= res!554855 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21545 a!4395)) (bvslt (size!21545 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000)))))

(assert (=> start!69688 e!449326))

(assert (=> start!69688 true))

(declare-fun array_inv!16920 (array!44109) Bool)

(assert (=> start!69688 (array_inv!16920 a!4395)))

(declare-fun b!811836 () Bool)

(assert (=> b!811836 (= e!449326 (not (bvsle from!3750 to!546)))))

(declare-fun arraysEqualsFromTo!0 (array!44109 array!44109 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!811836 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

(declare-datatypes ((Unit!27692 0))(
  ( (Unit!27693) )
))
(declare-fun lt!364058 () Unit!27692)

(declare-fun lemmaArrayEqualsFromToReflexivity!0 (array!44109 (_ BitVec 32) (_ BitVec 32)) Unit!27692)

(assert (=> b!811836 (= lt!364058 (lemmaArrayEqualsFromToReflexivity!0 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (= (and start!69688 res!554855) b!811836))

(declare-fun m!754295 () Bool)

(assert (=> start!69688 m!754295))

(declare-fun m!754297 () Bool)

(assert (=> b!811836 m!754297))

(declare-fun m!754299 () Bool)

(assert (=> b!811836 m!754299))

(check-sat (not start!69688) (not b!811836))
(check-sat)
