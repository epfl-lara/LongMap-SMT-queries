; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28604 () Bool)

(assert start!28604)

(declare-fun b!292461 () Bool)

(declare-fun res!153520 () Bool)

(declare-fun e!185034 () Bool)

(assert (=> b!292461 (=> (not res!153520) (not e!185034))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14783 0))(
  ( (array!14784 (arr!7014 (Array (_ BitVec 32) (_ BitVec 64))) (size!7366 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14783)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292461 (= res!153520 (and (= (size!7366 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7366 a!3312))))))

(declare-fun b!292462 () Bool)

(declare-fun e!185036 () Bool)

(assert (=> b!292462 (= e!185036 false)))

(declare-fun lt!144856 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2163 0))(
  ( (MissingZero!2163 (index!10822 (_ BitVec 32))) (Found!2163 (index!10823 (_ BitVec 32))) (Intermediate!2163 (undefined!2975 Bool) (index!10824 (_ BitVec 32)) (x!29010 (_ BitVec 32))) (Undefined!2163) (MissingVacant!2163 (index!10825 (_ BitVec 32))) )
))
(declare-fun lt!144858 () SeekEntryResult!2163)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14783 (_ BitVec 32)) SeekEntryResult!2163)

(assert (=> b!292462 (= lt!144858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144856 k0!2524 (array!14784 (store (arr!7014 a!3312) i!1256 k0!2524) (size!7366 a!3312)) mask!3809))))

(declare-fun lt!144859 () SeekEntryResult!2163)

(assert (=> b!292462 (= lt!144859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144856 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292462 (= lt!144856 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!153518 () Bool)

(assert (=> start!28604 (=> (not res!153518) (not e!185034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28604 (= res!153518 (validMask!0 mask!3809))))

(assert (=> start!28604 e!185034))

(assert (=> start!28604 true))

(declare-fun array_inv!4977 (array!14783) Bool)

(assert (=> start!28604 (array_inv!4977 a!3312)))

(declare-fun b!292463 () Bool)

(declare-fun res!153519 () Bool)

(assert (=> b!292463 (=> (not res!153519) (not e!185036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14783 (_ BitVec 32)) Bool)

(assert (=> b!292463 (= res!153519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292464 () Bool)

(assert (=> b!292464 (= e!185034 e!185036)))

(declare-fun res!153517 () Bool)

(assert (=> b!292464 (=> (not res!153517) (not e!185036))))

(declare-fun lt!144857 () SeekEntryResult!2163)

(assert (=> b!292464 (= res!153517 (or (= lt!144857 (MissingZero!2163 i!1256)) (= lt!144857 (MissingVacant!2163 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14783 (_ BitVec 32)) SeekEntryResult!2163)

(assert (=> b!292464 (= lt!144857 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292465 () Bool)

(declare-fun res!153522 () Bool)

(assert (=> b!292465 (=> (not res!153522) (not e!185034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292465 (= res!153522 (validKeyInArray!0 k0!2524))))

(declare-fun b!292466 () Bool)

(declare-fun res!153521 () Bool)

(assert (=> b!292466 (=> (not res!153521) (not e!185034))))

(declare-fun arrayContainsKey!0 (array!14783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292466 (= res!153521 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28604 res!153518) b!292461))

(assert (= (and b!292461 res!153520) b!292465))

(assert (= (and b!292465 res!153522) b!292466))

(assert (= (and b!292466 res!153521) b!292464))

(assert (= (and b!292464 res!153517) b!292463))

(assert (= (and b!292463 res!153519) b!292462))

(declare-fun m!306197 () Bool)

(assert (=> b!292462 m!306197))

(declare-fun m!306199 () Bool)

(assert (=> b!292462 m!306199))

(declare-fun m!306201 () Bool)

(assert (=> b!292462 m!306201))

(declare-fun m!306203 () Bool)

(assert (=> b!292462 m!306203))

(declare-fun m!306205 () Bool)

(assert (=> b!292463 m!306205))

(declare-fun m!306207 () Bool)

(assert (=> b!292466 m!306207))

(declare-fun m!306209 () Bool)

(assert (=> b!292465 m!306209))

(declare-fun m!306211 () Bool)

(assert (=> start!28604 m!306211))

(declare-fun m!306213 () Bool)

(assert (=> start!28604 m!306213))

(declare-fun m!306215 () Bool)

(assert (=> b!292464 m!306215))

(check-sat (not b!292463) (not b!292466) (not start!28604) (not b!292465) (not b!292462) (not b!292464))
(check-sat)
