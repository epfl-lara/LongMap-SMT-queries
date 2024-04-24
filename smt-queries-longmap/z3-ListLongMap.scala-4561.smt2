; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63712 () Bool)

(assert start!63712)

(declare-fun b!717086 () Bool)

(declare-fun res!479723 () Bool)

(declare-fun e!402717 () Bool)

(assert (=> b!717086 (=> (not res!479723) (not e!402717))))

(declare-datatypes ((array!40554 0))(
  ( (array!40555 (arr!19408 (Array (_ BitVec 32) (_ BitVec 64))) (size!19828 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40554)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717086 (= res!479723 (validKeyInArray!0 (select (arr!19408 a!3186) j!159)))))

(declare-fun b!717085 () Bool)

(declare-fun res!479725 () Bool)

(assert (=> b!717085 (=> (not res!479725) (not e!402717))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717085 (= res!479725 (and (= (size!19828 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19828 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19828 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717088 () Bool)

(assert (=> b!717088 (= e!402717 (bvsge #b00000000000000000000000000000000 (size!19828 a!3186)))))

(declare-fun b!717087 () Bool)

(declare-fun res!479722 () Bool)

(assert (=> b!717087 (=> (not res!479722) (not e!402717))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!717087 (= res!479722 (validKeyInArray!0 k0!2102))))

(declare-fun res!479724 () Bool)

(assert (=> start!63712 (=> (not res!479724) (not e!402717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63712 (= res!479724 (validMask!0 mask!3328))))

(assert (=> start!63712 e!402717))

(declare-fun array_inv!15267 (array!40554) Bool)

(assert (=> start!63712 (array_inv!15267 a!3186)))

(assert (=> start!63712 true))

(assert (= (and start!63712 res!479724) b!717085))

(assert (= (and b!717085 res!479725) b!717086))

(assert (= (and b!717086 res!479723) b!717087))

(assert (= (and b!717087 res!479722) b!717088))

(declare-fun m!673611 () Bool)

(assert (=> b!717086 m!673611))

(assert (=> b!717086 m!673611))

(declare-fun m!673613 () Bool)

(assert (=> b!717086 m!673613))

(declare-fun m!673615 () Bool)

(assert (=> b!717087 m!673615))

(declare-fun m!673617 () Bool)

(assert (=> start!63712 m!673617))

(declare-fun m!673619 () Bool)

(assert (=> start!63712 m!673619))

(check-sat (not start!63712) (not b!717086) (not b!717087))
(check-sat)
