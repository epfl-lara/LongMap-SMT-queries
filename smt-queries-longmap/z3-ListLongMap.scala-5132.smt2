; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69854 () Bool)

(assert start!69854)

(declare-fun res!555192 () Bool)

(declare-fun e!449892 () Bool)

(assert (=> start!69854 (=> (not res!555192) (not e!449892))))

(declare-datatypes ((array!44107 0))(
  ( (array!44108 (arr!21118 (Array (_ BitVec 32) (_ BitVec 64))) (size!21538 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44107)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(assert (=> start!69854 (= res!555192 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21538 a!4395)) (bvslt (size!21538 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000)))))

(assert (=> start!69854 e!449892))

(assert (=> start!69854 true))

(declare-fun array_inv!16977 (array!44107) Bool)

(assert (=> start!69854 (array_inv!16977 a!4395)))

(declare-fun b!812721 () Bool)

(assert (=> b!812721 (= e!449892 (not (bvsle from!3750 to!546)))))

(declare-fun arraysEqualsFromTo!0 (array!44107 array!44107 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!812721 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

(declare-datatypes ((Unit!27675 0))(
  ( (Unit!27676) )
))
(declare-fun lt!364412 () Unit!27675)

(declare-fun lemmaArrayEqualsFromToReflexivity!0 (array!44107 (_ BitVec 32) (_ BitVec 32)) Unit!27675)

(assert (=> b!812721 (= lt!364412 (lemmaArrayEqualsFromToReflexivity!0 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (= (and start!69854 res!555192) b!812721))

(declare-fun m!755575 () Bool)

(assert (=> start!69854 m!755575))

(declare-fun m!755577 () Bool)

(assert (=> b!812721 m!755577))

(declare-fun m!755579 () Bool)

(assert (=> b!812721 m!755579))

(check-sat (not b!812721) (not start!69854))
(check-sat)
