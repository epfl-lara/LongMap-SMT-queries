; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63678 () Bool)

(assert start!63678)

(declare-fun res!479634 () Bool)

(declare-fun e!402532 () Bool)

(assert (=> start!63678 (=> (not res!479634) (not e!402532))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63678 (= res!479634 (validMask!0 mask!3328))))

(assert (=> start!63678 e!402532))

(declare-datatypes ((array!40574 0))(
  ( (array!40575 (arr!19420 (Array (_ BitVec 32) (_ BitVec 64))) (size!19841 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40574)

(declare-fun array_inv!15216 (array!40574) Bool)

(assert (=> start!63678 (array_inv!15216 a!3186)))

(assert (=> start!63678 true))

(declare-fun b!716846 () Bool)

(declare-fun res!479635 () Bool)

(assert (=> b!716846 (=> (not res!479635) (not e!402532))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716846 (= res!479635 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716847 () Bool)

(declare-fun res!479636 () Bool)

(assert (=> b!716847 (=> (not res!479636) (not e!402532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716847 (= res!479636 (validKeyInArray!0 k0!2102))))

(declare-fun b!716848 () Bool)

(declare-fun res!479632 () Bool)

(assert (=> b!716848 (=> (not res!479632) (not e!402532))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!716848 (= res!479632 (and (= (size!19841 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19841 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19841 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716849 () Bool)

(declare-fun res!479633 () Bool)

(assert (=> b!716849 (=> (not res!479633) (not e!402532))))

(assert (=> b!716849 (= res!479633 (validKeyInArray!0 (select (arr!19420 a!3186) j!159)))))

(declare-fun b!716850 () Bool)

(assert (=> b!716850 (= e!402532 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (= (and start!63678 res!479634) b!716848))

(assert (= (and b!716848 res!479632) b!716849))

(assert (= (and b!716849 res!479633) b!716847))

(assert (= (and b!716847 res!479636) b!716846))

(assert (= (and b!716846 res!479635) b!716850))

(declare-fun m!672835 () Bool)

(assert (=> start!63678 m!672835))

(declare-fun m!672837 () Bool)

(assert (=> start!63678 m!672837))

(declare-fun m!672839 () Bool)

(assert (=> b!716846 m!672839))

(declare-fun m!672841 () Bool)

(assert (=> b!716847 m!672841))

(declare-fun m!672843 () Bool)

(assert (=> b!716849 m!672843))

(assert (=> b!716849 m!672843))

(declare-fun m!672845 () Bool)

(assert (=> b!716849 m!672845))

(check-sat (not b!716846) (not start!63678) (not b!716847) (not b!716849))
(check-sat)
