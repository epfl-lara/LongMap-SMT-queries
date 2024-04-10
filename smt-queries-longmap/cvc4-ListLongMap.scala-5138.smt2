; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69744 () Bool)

(assert start!69744)

(declare-fun res!554900 () Bool)

(declare-fun e!449428 () Bool)

(assert (=> start!69744 (=> (not res!554900) (not e!449428))))

(declare-datatypes ((array!44150 0))(
  ( (array!44151 (arr!21143 (Array (_ BitVec 32) (_ BitVec 64))) (size!21564 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44150)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(assert (=> start!69744 (= res!554900 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21564 a!4395)) (bvslt (size!21564 a!4395) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) to!546)))))

(assert (=> start!69744 e!449428))

(assert (=> start!69744 true))

(declare-fun array_inv!16939 (array!44150) Bool)

(assert (=> start!69744 (array_inv!16939 a!4395)))

(declare-fun b!811881 () Bool)

(declare-fun arraysEqualsFromTo!0 (array!44150 array!44150 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!811881 (= e!449428 (not (arraysEqualsFromTo!0 a!4395 a!4395 from!3750 to!546)))))

(assert (= (and start!69744 res!554900) b!811881))

(declare-fun m!754393 () Bool)

(assert (=> start!69744 m!754393))

(declare-fun m!754395 () Bool)

(assert (=> b!811881 m!754395))

(push 1)

(assert (not start!69744))

(assert (not b!811881))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

