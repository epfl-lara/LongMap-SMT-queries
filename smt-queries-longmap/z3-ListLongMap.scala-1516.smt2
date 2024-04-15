; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28622 () Bool)

(assert start!28622)

(declare-fun b!292512 () Bool)

(declare-fun res!153621 () Bool)

(declare-fun e!185033 () Bool)

(assert (=> b!292512 (=> (not res!153621) (not e!185033))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14794 0))(
  ( (array!14795 (arr!7020 (Array (_ BitVec 32) (_ BitVec 64))) (size!7373 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14794)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292512 (= res!153621 (and (= (size!7373 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7373 a!3312))))))

(declare-fun b!292513 () Bool)

(declare-fun res!153623 () Bool)

(assert (=> b!292513 (=> (not res!153623) (not e!185033))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292513 (= res!153623 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292514 () Bool)

(declare-fun res!153622 () Bool)

(assert (=> b!292514 (=> (not res!153622) (not e!185033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292514 (= res!153622 (validKeyInArray!0 k0!2524))))

(declare-fun b!292516 () Bool)

(declare-fun e!185034 () Bool)

(assert (=> b!292516 (= e!185033 e!185034)))

(declare-fun res!153620 () Bool)

(assert (=> b!292516 (=> (not res!153620) (not e!185034))))

(declare-datatypes ((SeekEntryResult!2168 0))(
  ( (MissingZero!2168 (index!10842 (_ BitVec 32))) (Found!2168 (index!10843 (_ BitVec 32))) (Intermediate!2168 (undefined!2980 Bool) (index!10844 (_ BitVec 32)) (x!29046 (_ BitVec 32))) (Undefined!2168) (MissingVacant!2168 (index!10845 (_ BitVec 32))) )
))
(declare-fun lt!144808 () SeekEntryResult!2168)

(assert (=> b!292516 (= res!153620 (or (= lt!144808 (MissingZero!2168 i!1256)) (= lt!144808 (MissingVacant!2168 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14794 (_ BitVec 32)) SeekEntryResult!2168)

(assert (=> b!292516 (= lt!144808 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292517 () Bool)

(assert (=> b!292517 (= e!185034 false)))

(declare-fun lt!144810 () (_ BitVec 32))

(declare-fun lt!144807 () SeekEntryResult!2168)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14794 (_ BitVec 32)) SeekEntryResult!2168)

(assert (=> b!292517 (= lt!144807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144810 k0!2524 (array!14795 (store (arr!7020 a!3312) i!1256 k0!2524) (size!7373 a!3312)) mask!3809))))

(declare-fun lt!144809 () SeekEntryResult!2168)

(assert (=> b!292517 (= lt!144809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144810 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292517 (= lt!144810 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!153625 () Bool)

(assert (=> start!28622 (=> (not res!153625) (not e!185033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28622 (= res!153625 (validMask!0 mask!3809))))

(assert (=> start!28622 e!185033))

(assert (=> start!28622 true))

(declare-fun array_inv!4992 (array!14794) Bool)

(assert (=> start!28622 (array_inv!4992 a!3312)))

(declare-fun b!292515 () Bool)

(declare-fun res!153624 () Bool)

(assert (=> b!292515 (=> (not res!153624) (not e!185034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14794 (_ BitVec 32)) Bool)

(assert (=> b!292515 (= res!153624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28622 res!153625) b!292512))

(assert (= (and b!292512 res!153621) b!292514))

(assert (= (and b!292514 res!153622) b!292513))

(assert (= (and b!292513 res!153623) b!292516))

(assert (= (and b!292516 res!153620) b!292515))

(assert (= (and b!292515 res!153624) b!292517))

(declare-fun m!305825 () Bool)

(assert (=> b!292516 m!305825))

(declare-fun m!305827 () Bool)

(assert (=> b!292513 m!305827))

(declare-fun m!305829 () Bool)

(assert (=> start!28622 m!305829))

(declare-fun m!305831 () Bool)

(assert (=> start!28622 m!305831))

(declare-fun m!305833 () Bool)

(assert (=> b!292514 m!305833))

(declare-fun m!305835 () Bool)

(assert (=> b!292515 m!305835))

(declare-fun m!305837 () Bool)

(assert (=> b!292517 m!305837))

(declare-fun m!305839 () Bool)

(assert (=> b!292517 m!305839))

(declare-fun m!305841 () Bool)

(assert (=> b!292517 m!305841))

(declare-fun m!305843 () Bool)

(assert (=> b!292517 m!305843))

(check-sat (not b!292513) (not b!292515) (not b!292516) (not start!28622) (not b!292514) (not b!292517))
(check-sat)
