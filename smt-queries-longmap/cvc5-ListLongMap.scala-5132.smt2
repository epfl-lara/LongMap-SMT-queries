; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69686 () Bool)

(assert start!69686)

(declare-fun res!554852 () Bool)

(declare-fun e!449320 () Bool)

(assert (=> start!69686 (=> (not res!554852) (not e!449320))))

(declare-datatypes ((array!44107 0))(
  ( (array!44108 (arr!21123 (Array (_ BitVec 32) (_ BitVec 64))) (size!21544 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44107)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(assert (=> start!69686 (= res!554852 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21544 a!4395)) (bvslt (size!21544 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000)))))

(assert (=> start!69686 e!449320))

(assert (=> start!69686 true))

(declare-fun array_inv!16919 (array!44107) Bool)

(assert (=> start!69686 (array_inv!16919 a!4395)))

(declare-fun b!811833 () Bool)

(assert (=> b!811833 (= e!449320 (not (bvsle from!3750 to!546)))))

(declare-fun arraysEqualsFromTo!0 (array!44107 array!44107 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!811833 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

(declare-datatypes ((Unit!27690 0))(
  ( (Unit!27691) )
))
(declare-fun lt!364055 () Unit!27690)

(declare-fun lemmaArrayEqualsFromToReflexivity!0 (array!44107 (_ BitVec 32) (_ BitVec 32)) Unit!27690)

(assert (=> b!811833 (= lt!364055 (lemmaArrayEqualsFromToReflexivity!0 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (= (and start!69686 res!554852) b!811833))

(declare-fun m!754289 () Bool)

(assert (=> start!69686 m!754289))

(declare-fun m!754291 () Bool)

(assert (=> b!811833 m!754291))

(declare-fun m!754293 () Bool)

(assert (=> b!811833 m!754293))

(push 1)

(assert (not b!811833))

(assert (not start!69686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

