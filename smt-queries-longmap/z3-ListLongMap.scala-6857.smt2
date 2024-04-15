; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86388 () Bool)

(assert start!86388)

(declare-fun b!999686 () Bool)

(declare-fun res!669292 () Bool)

(declare-fun e!563579 () Bool)

(assert (=> b!999686 (=> (not res!669292) (not e!563579))))

(declare-datatypes ((array!63136 0))(
  ( (array!63137 (arr!30393 (Array (_ BitVec 32) (_ BitVec 64))) (size!30897 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63136)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999686 (= res!669292 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30897 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30897 a!3219))))))

(declare-fun b!999687 () Bool)

(declare-fun res!669295 () Bool)

(declare-fun e!563576 () Bool)

(assert (=> b!999687 (=> (not res!669295) (not e!563576))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999687 (= res!669295 (validKeyInArray!0 k0!2224))))

(declare-fun b!999688 () Bool)

(declare-fun res!669296 () Bool)

(assert (=> b!999688 (=> (not res!669296) (not e!563579))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63136 (_ BitVec 32)) Bool)

(assert (=> b!999688 (= res!669296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999689 () Bool)

(declare-fun res!669288 () Bool)

(assert (=> b!999689 (=> (not res!669288) (not e!563576))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!999689 (= res!669288 (validKeyInArray!0 (select (arr!30393 a!3219) j!170)))))

(declare-fun b!999690 () Bool)

(declare-fun res!669290 () Bool)

(assert (=> b!999690 (=> (not res!669290) (not e!563576))))

(declare-fun arrayContainsKey!0 (array!63136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999690 (= res!669290 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999691 () Bool)

(declare-fun res!669293 () Bool)

(assert (=> b!999691 (=> (not res!669293) (not e!563579))))

(declare-datatypes ((List!21135 0))(
  ( (Nil!21132) (Cons!21131 (h!22308 (_ BitVec 64)) (t!30127 List!21135)) )
))
(declare-fun arrayNoDuplicates!0 (array!63136 (_ BitVec 32) List!21135) Bool)

(assert (=> b!999691 (= res!669293 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21132))))

(declare-fun b!999692 () Bool)

(declare-fun e!563577 () Bool)

(assert (=> b!999692 (= e!563579 e!563577)))

(declare-fun res!669289 () Bool)

(assert (=> b!999692 (=> (not res!669289) (not e!563577))))

(declare-datatypes ((SeekEntryResult!9350 0))(
  ( (MissingZero!9350 (index!39771 (_ BitVec 32))) (Found!9350 (index!39772 (_ BitVec 32))) (Intermediate!9350 (undefined!10162 Bool) (index!39773 (_ BitVec 32)) (x!87221 (_ BitVec 32))) (Undefined!9350) (MissingVacant!9350 (index!39774 (_ BitVec 32))) )
))
(declare-fun lt!441919 () SeekEntryResult!9350)

(declare-fun lt!441918 () SeekEntryResult!9350)

(assert (=> b!999692 (= res!669289 (= lt!441919 lt!441918))))

(assert (=> b!999692 (= lt!441918 (Intermediate!9350 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63136 (_ BitVec 32)) SeekEntryResult!9350)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999692 (= lt!441919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30393 a!3219) j!170) mask!3464) (select (arr!30393 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!669294 () Bool)

(assert (=> start!86388 (=> (not res!669294) (not e!563576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86388 (= res!669294 (validMask!0 mask!3464))))

(assert (=> start!86388 e!563576))

(declare-fun array_inv!23536 (array!63136) Bool)

(assert (=> start!86388 (array_inv!23536 a!3219)))

(assert (=> start!86388 true))

(declare-fun b!999693 () Bool)

(declare-fun res!669291 () Bool)

(assert (=> b!999693 (=> (not res!669291) (not e!563576))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999693 (= res!669291 (and (= (size!30897 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30897 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30897 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999694 () Bool)

(declare-fun res!669299 () Bool)

(assert (=> b!999694 (=> (not res!669299) (not e!563577))))

(assert (=> b!999694 (= res!669299 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30393 a!3219) j!170) a!3219 mask!3464) lt!441918))))

(declare-fun b!999695 () Bool)

(declare-fun res!669297 () Bool)

(assert (=> b!999695 (=> (not res!669297) (not e!563577))))

(assert (=> b!999695 (= res!669297 (not (= lt!441919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30393 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30393 a!3219) i!1194 k0!2224) j!170) (array!63137 (store (arr!30393 a!3219) i!1194 k0!2224) (size!30897 a!3219)) mask!3464))))))

(declare-fun b!999696 () Bool)

(assert (=> b!999696 (= e!563577 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!999697 () Bool)

(assert (=> b!999697 (= e!563576 e!563579)))

(declare-fun res!669298 () Bool)

(assert (=> b!999697 (=> (not res!669298) (not e!563579))))

(declare-fun lt!441917 () SeekEntryResult!9350)

(assert (=> b!999697 (= res!669298 (or (= lt!441917 (MissingVacant!9350 i!1194)) (= lt!441917 (MissingZero!9350 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63136 (_ BitVec 32)) SeekEntryResult!9350)

(assert (=> b!999697 (= lt!441917 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86388 res!669294) b!999693))

(assert (= (and b!999693 res!669291) b!999689))

(assert (= (and b!999689 res!669288) b!999687))

(assert (= (and b!999687 res!669295) b!999690))

(assert (= (and b!999690 res!669290) b!999697))

(assert (= (and b!999697 res!669298) b!999688))

(assert (= (and b!999688 res!669296) b!999691))

(assert (= (and b!999691 res!669293) b!999686))

(assert (= (and b!999686 res!669292) b!999692))

(assert (= (and b!999692 res!669289) b!999694))

(assert (= (and b!999694 res!669299) b!999695))

(assert (= (and b!999695 res!669297) b!999696))

(declare-fun m!925381 () Bool)

(assert (=> b!999694 m!925381))

(assert (=> b!999694 m!925381))

(declare-fun m!925383 () Bool)

(assert (=> b!999694 m!925383))

(declare-fun m!925385 () Bool)

(assert (=> b!999695 m!925385))

(declare-fun m!925387 () Bool)

(assert (=> b!999695 m!925387))

(assert (=> b!999695 m!925387))

(declare-fun m!925389 () Bool)

(assert (=> b!999695 m!925389))

(assert (=> b!999695 m!925389))

(assert (=> b!999695 m!925387))

(declare-fun m!925391 () Bool)

(assert (=> b!999695 m!925391))

(declare-fun m!925393 () Bool)

(assert (=> b!999688 m!925393))

(declare-fun m!925395 () Bool)

(assert (=> b!999691 m!925395))

(declare-fun m!925397 () Bool)

(assert (=> b!999697 m!925397))

(assert (=> b!999689 m!925381))

(assert (=> b!999689 m!925381))

(declare-fun m!925399 () Bool)

(assert (=> b!999689 m!925399))

(declare-fun m!925401 () Bool)

(assert (=> b!999690 m!925401))

(assert (=> b!999692 m!925381))

(assert (=> b!999692 m!925381))

(declare-fun m!925403 () Bool)

(assert (=> b!999692 m!925403))

(assert (=> b!999692 m!925403))

(assert (=> b!999692 m!925381))

(declare-fun m!925405 () Bool)

(assert (=> b!999692 m!925405))

(declare-fun m!925407 () Bool)

(assert (=> b!999687 m!925407))

(declare-fun m!925409 () Bool)

(assert (=> start!86388 m!925409))

(declare-fun m!925411 () Bool)

(assert (=> start!86388 m!925411))

(check-sat (not b!999687) (not b!999688) (not b!999695) (not b!999689) (not b!999694) (not b!999691) (not start!86388) (not b!999690) (not b!999697) (not b!999692))
(check-sat)
