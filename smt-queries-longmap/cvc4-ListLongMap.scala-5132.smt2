; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69690 () Bool)

(assert start!69690)

(declare-fun res!554858 () Bool)

(declare-fun e!449332 () Bool)

(assert (=> start!69690 (=> (not res!554858) (not e!449332))))

(declare-datatypes ((array!44111 0))(
  ( (array!44112 (arr!21125 (Array (_ BitVec 32) (_ BitVec 64))) (size!21546 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44111)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(assert (=> start!69690 (= res!554858 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21546 a!4395)) (bvslt (size!21546 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000)))))

(assert (=> start!69690 e!449332))

(assert (=> start!69690 true))

(declare-fun array_inv!16921 (array!44111) Bool)

(assert (=> start!69690 (array_inv!16921 a!4395)))

(declare-fun b!811839 () Bool)

(assert (=> b!811839 (= e!449332 (not (bvsle from!3750 to!546)))))

(declare-fun arraysEqualsFromTo!0 (array!44111 array!44111 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!811839 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

(declare-datatypes ((Unit!27694 0))(
  ( (Unit!27695) )
))
(declare-fun lt!364061 () Unit!27694)

(declare-fun lemmaArrayEqualsFromToReflexivity!0 (array!44111 (_ BitVec 32) (_ BitVec 32)) Unit!27694)

(assert (=> b!811839 (= lt!364061 (lemmaArrayEqualsFromToReflexivity!0 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (= (and start!69690 res!554858) b!811839))

(declare-fun m!754301 () Bool)

(assert (=> start!69690 m!754301))

(declare-fun m!754303 () Bool)

(assert (=> b!811839 m!754303))

(declare-fun m!754305 () Bool)

(assert (=> b!811839 m!754305))

(push 1)

(assert (not b!811839))

(assert (not start!69690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

