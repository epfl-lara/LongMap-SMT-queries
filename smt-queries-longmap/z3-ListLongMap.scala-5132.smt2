; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69666 () Bool)

(assert start!69666)

(declare-fun res!554742 () Bool)

(declare-fun e!449166 () Bool)

(assert (=> start!69666 (=> (not res!554742) (not e!449166))))

(declare-datatypes ((array!44104 0))(
  ( (array!44105 (arr!21122 (Array (_ BitVec 32) (_ BitVec 64))) (size!21543 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44104)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(assert (=> start!69666 (= res!554742 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21543 a!4395)) (bvslt (size!21543 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000)))))

(assert (=> start!69666 e!449166))

(assert (=> start!69666 true))

(declare-fun array_inv!17005 (array!44104) Bool)

(assert (=> start!69666 (array_inv!17005 a!4395)))

(declare-fun b!811583 () Bool)

(assert (=> b!811583 (= e!449166 (not (bvsle from!3750 to!546)))))

(declare-fun arraysEqualsFromTo!0 (array!44104 array!44104 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!811583 (arraysEqualsFromTo!0 a!4395 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546)))

(declare-datatypes ((Unit!27648 0))(
  ( (Unit!27649) )
))
(declare-fun lt!363815 () Unit!27648)

(declare-fun lemmaArrayEqualsFromToReflexivity!0 (array!44104 (_ BitVec 32) (_ BitVec 32)) Unit!27648)

(assert (=> b!811583 (= lt!363815 (lemmaArrayEqualsFromToReflexivity!0 a!4395 (bvadd #b00000000000000000000000000000001 from!3750) to!546))))

(assert (= (and start!69666 res!554742) b!811583))

(declare-fun m!753547 () Bool)

(assert (=> start!69666 m!753547))

(declare-fun m!753549 () Bool)

(assert (=> b!811583 m!753549))

(declare-fun m!753551 () Bool)

(assert (=> b!811583 m!753551))

(check-sat (not start!69666) (not b!811583))
(check-sat)
