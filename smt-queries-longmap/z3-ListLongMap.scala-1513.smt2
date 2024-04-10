; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28610 () Bool)

(assert start!28610)

(declare-fun b!292515 () Bool)

(declare-fun e!185063 () Bool)

(assert (=> b!292515 (= e!185063 false)))

(declare-datatypes ((SeekEntryResult!2166 0))(
  ( (MissingZero!2166 (index!10834 (_ BitVec 32))) (Found!2166 (index!10835 (_ BitVec 32))) (Intermediate!2166 (undefined!2978 Bool) (index!10836 (_ BitVec 32)) (x!29021 (_ BitVec 32))) (Undefined!2166) (MissingVacant!2166 (index!10837 (_ BitVec 32))) )
))
(declare-fun lt!144892 () SeekEntryResult!2166)

(declare-fun lt!144895 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14789 0))(
  ( (array!14790 (arr!7017 (Array (_ BitVec 32) (_ BitVec 64))) (size!7369 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14789)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14789 (_ BitVec 32)) SeekEntryResult!2166)

(assert (=> b!292515 (= lt!144892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144895 k0!2524 (array!14790 (store (arr!7017 a!3312) i!1256 k0!2524) (size!7369 a!3312)) mask!3809))))

(declare-fun lt!144893 () SeekEntryResult!2166)

(assert (=> b!292515 (= lt!144893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144895 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292515 (= lt!144895 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292516 () Bool)

(declare-fun e!185061 () Bool)

(assert (=> b!292516 (= e!185061 e!185063)))

(declare-fun res!153571 () Bool)

(assert (=> b!292516 (=> (not res!153571) (not e!185063))))

(declare-fun lt!144894 () SeekEntryResult!2166)

(assert (=> b!292516 (= res!153571 (or (= lt!144894 (MissingZero!2166 i!1256)) (= lt!144894 (MissingVacant!2166 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14789 (_ BitVec 32)) SeekEntryResult!2166)

(assert (=> b!292516 (= lt!144894 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292517 () Bool)

(declare-fun res!153573 () Bool)

(assert (=> b!292517 (=> (not res!153573) (not e!185061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292517 (= res!153573 (validKeyInArray!0 k0!2524))))

(declare-fun b!292518 () Bool)

(declare-fun res!153576 () Bool)

(assert (=> b!292518 (=> (not res!153576) (not e!185063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14789 (_ BitVec 32)) Bool)

(assert (=> b!292518 (= res!153576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!153574 () Bool)

(assert (=> start!28610 (=> (not res!153574) (not e!185061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28610 (= res!153574 (validMask!0 mask!3809))))

(assert (=> start!28610 e!185061))

(assert (=> start!28610 true))

(declare-fun array_inv!4980 (array!14789) Bool)

(assert (=> start!28610 (array_inv!4980 a!3312)))

(declare-fun b!292519 () Bool)

(declare-fun res!153575 () Bool)

(assert (=> b!292519 (=> (not res!153575) (not e!185061))))

(assert (=> b!292519 (= res!153575 (and (= (size!7369 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7369 a!3312))))))

(declare-fun b!292520 () Bool)

(declare-fun res!153572 () Bool)

(assert (=> b!292520 (=> (not res!153572) (not e!185061))))

(declare-fun arrayContainsKey!0 (array!14789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292520 (= res!153572 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28610 res!153574) b!292519))

(assert (= (and b!292519 res!153575) b!292517))

(assert (= (and b!292517 res!153573) b!292520))

(assert (= (and b!292520 res!153572) b!292516))

(assert (= (and b!292516 res!153571) b!292518))

(assert (= (and b!292518 res!153576) b!292515))

(declare-fun m!306257 () Bool)

(assert (=> b!292520 m!306257))

(declare-fun m!306259 () Bool)

(assert (=> start!28610 m!306259))

(declare-fun m!306261 () Bool)

(assert (=> start!28610 m!306261))

(declare-fun m!306263 () Bool)

(assert (=> b!292517 m!306263))

(declare-fun m!306265 () Bool)

(assert (=> b!292515 m!306265))

(declare-fun m!306267 () Bool)

(assert (=> b!292515 m!306267))

(declare-fun m!306269 () Bool)

(assert (=> b!292515 m!306269))

(declare-fun m!306271 () Bool)

(assert (=> b!292515 m!306271))

(declare-fun m!306273 () Bool)

(assert (=> b!292518 m!306273))

(declare-fun m!306275 () Bool)

(assert (=> b!292516 m!306275))

(check-sat (not b!292515) (not b!292518) (not b!292517) (not b!292516) (not b!292520) (not start!28610))
(check-sat)
