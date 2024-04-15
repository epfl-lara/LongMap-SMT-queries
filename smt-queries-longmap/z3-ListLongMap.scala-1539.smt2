; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29150 () Bool)

(assert start!29150)

(declare-fun b!295671 () Bool)

(declare-fun e!186875 () Bool)

(assert (=> b!295671 (= e!186875 (not true))))

(declare-datatypes ((array!14956 0))(
  ( (array!14957 (arr!7089 (Array (_ BitVec 32) (_ BitVec 64))) (size!7442 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14956)

(declare-datatypes ((SeekEntryResult!2237 0))(
  ( (MissingZero!2237 (index!11118 (_ BitVec 32))) (Found!2237 (index!11119 (_ BitVec 32))) (Intermediate!2237 (undefined!3049 Bool) (index!11120 (_ BitVec 32)) (x!29349 (_ BitVec 32))) (Undefined!2237) (MissingVacant!2237 (index!11121 (_ BitVec 32))) )
))
(declare-fun lt!146604 () SeekEntryResult!2237)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295671 (and (= (select (arr!7089 a!3312) (index!11120 lt!146604)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11120 lt!146604) i!1256))))

(declare-fun b!295672 () Bool)

(declare-fun e!186876 () Bool)

(assert (=> b!295672 (= e!186876 e!186875)))

(declare-fun res!155612 () Bool)

(assert (=> b!295672 (=> (not res!155612) (not e!186875))))

(declare-fun lt!146603 () Bool)

(declare-fun k0!2524 () (_ BitVec 64))

(assert (=> b!295672 (= res!155612 (and (or lt!146603 (not (undefined!3049 lt!146604))) (or lt!146603 (not (= (select (arr!7089 a!3312) (index!11120 lt!146604)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146603 (not (= (select (arr!7089 a!3312) (index!11120 lt!146604)) k0!2524))) (not lt!146603)))))

(get-info :version)

(assert (=> b!295672 (= lt!146603 (not ((_ is Intermediate!2237) lt!146604)))))

(declare-fun b!295673 () Bool)

(declare-fun res!155614 () Bool)

(declare-fun e!186873 () Bool)

(assert (=> b!295673 (=> (not res!155614) (not e!186873))))

(declare-fun arrayContainsKey!0 (array!14956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295673 (= res!155614 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295674 () Bool)

(declare-fun e!186877 () Bool)

(assert (=> b!295674 (= e!186877 e!186876)))

(declare-fun res!155609 () Bool)

(assert (=> b!295674 (=> (not res!155609) (not e!186876))))

(declare-fun lt!146605 () Bool)

(assert (=> b!295674 (= res!155609 lt!146605)))

(declare-fun lt!146606 () SeekEntryResult!2237)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!146602 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14956 (_ BitVec 32)) SeekEntryResult!2237)

(assert (=> b!295674 (= lt!146606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146602 k0!2524 (array!14957 (store (arr!7089 a!3312) i!1256 k0!2524) (size!7442 a!3312)) mask!3809))))

(assert (=> b!295674 (= lt!146604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146602 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295674 (= lt!146602 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295675 () Bool)

(declare-fun res!155607 () Bool)

(assert (=> b!295675 (=> (not res!155607) (not e!186877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14956 (_ BitVec 32)) Bool)

(assert (=> b!295675 (= res!155607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295676 () Bool)

(assert (=> b!295676 (= e!186873 e!186877)))

(declare-fun res!155611 () Bool)

(assert (=> b!295676 (=> (not res!155611) (not e!186877))))

(declare-fun lt!146607 () SeekEntryResult!2237)

(assert (=> b!295676 (= res!155611 (or lt!146605 (= lt!146607 (MissingVacant!2237 i!1256))))))

(assert (=> b!295676 (= lt!146605 (= lt!146607 (MissingZero!2237 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14956 (_ BitVec 32)) SeekEntryResult!2237)

(assert (=> b!295676 (= lt!146607 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295678 () Bool)

(declare-fun res!155608 () Bool)

(assert (=> b!295678 (=> (not res!155608) (not e!186873))))

(assert (=> b!295678 (= res!155608 (and (= (size!7442 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7442 a!3312))))))

(declare-fun b!295677 () Bool)

(declare-fun res!155613 () Bool)

(assert (=> b!295677 (=> (not res!155613) (not e!186873))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295677 (= res!155613 (validKeyInArray!0 k0!2524))))

(declare-fun res!155610 () Bool)

(assert (=> start!29150 (=> (not res!155610) (not e!186873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29150 (= res!155610 (validMask!0 mask!3809))))

(assert (=> start!29150 e!186873))

(assert (=> start!29150 true))

(declare-fun array_inv!5061 (array!14956) Bool)

(assert (=> start!29150 (array_inv!5061 a!3312)))

(assert (= (and start!29150 res!155610) b!295678))

(assert (= (and b!295678 res!155608) b!295677))

(assert (= (and b!295677 res!155613) b!295673))

(assert (= (and b!295673 res!155614) b!295676))

(assert (= (and b!295676 res!155611) b!295675))

(assert (= (and b!295675 res!155607) b!295674))

(assert (= (and b!295674 res!155609) b!295672))

(assert (= (and b!295672 res!155612) b!295671))

(declare-fun m!308289 () Bool)

(assert (=> b!295671 m!308289))

(declare-fun m!308291 () Bool)

(assert (=> b!295674 m!308291))

(declare-fun m!308293 () Bool)

(assert (=> b!295674 m!308293))

(declare-fun m!308295 () Bool)

(assert (=> b!295674 m!308295))

(declare-fun m!308297 () Bool)

(assert (=> b!295674 m!308297))

(declare-fun m!308299 () Bool)

(assert (=> start!29150 m!308299))

(declare-fun m!308301 () Bool)

(assert (=> start!29150 m!308301))

(declare-fun m!308303 () Bool)

(assert (=> b!295676 m!308303))

(declare-fun m!308305 () Bool)

(assert (=> b!295673 m!308305))

(declare-fun m!308307 () Bool)

(assert (=> b!295677 m!308307))

(declare-fun m!308309 () Bool)

(assert (=> b!295675 m!308309))

(assert (=> b!295672 m!308289))

(check-sat (not b!295673) (not start!29150) (not b!295676) (not b!295675) (not b!295677) (not b!295674))
(check-sat)
