; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29310 () Bool)

(assert start!29310)

(declare-fun b!296950 () Bool)

(declare-fun res!156476 () Bool)

(declare-fun e!187672 () Bool)

(assert (=> b!296950 (=> (not res!156476) (not e!187672))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296950 (= res!156476 (validKeyInArray!0 k0!2524))))

(declare-fun b!296951 () Bool)

(declare-fun res!156482 () Bool)

(declare-fun e!187671 () Bool)

(assert (=> b!296951 (=> (not res!156482) (not e!187671))))

(declare-datatypes ((array!15023 0))(
  ( (array!15024 (arr!7119 (Array (_ BitVec 32) (_ BitVec 64))) (size!7471 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15023)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15023 (_ BitVec 32)) Bool)

(assert (=> b!296951 (= res!156482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296952 () Bool)

(declare-fun e!187673 () Bool)

(assert (=> b!296952 (= e!187671 e!187673)))

(declare-fun res!156478 () Bool)

(assert (=> b!296952 (=> (not res!156478) (not e!187673))))

(declare-fun lt!147466 () Bool)

(assert (=> b!296952 (= res!156478 lt!147466)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147470 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2268 0))(
  ( (MissingZero!2268 (index!11242 (_ BitVec 32))) (Found!2268 (index!11243 (_ BitVec 32))) (Intermediate!2268 (undefined!3080 Bool) (index!11244 (_ BitVec 32)) (x!29460 (_ BitVec 32))) (Undefined!2268) (MissingVacant!2268 (index!11245 (_ BitVec 32))) )
))
(declare-fun lt!147471 () SeekEntryResult!2268)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15023 (_ BitVec 32)) SeekEntryResult!2268)

(assert (=> b!296952 (= lt!147471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147470 k0!2524 (array!15024 (store (arr!7119 a!3312) i!1256 k0!2524) (size!7471 a!3312)) mask!3809))))

(declare-fun lt!147469 () SeekEntryResult!2268)

(assert (=> b!296952 (= lt!147469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147470 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296952 (= lt!147470 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296953 () Bool)

(assert (=> b!296953 (= e!187672 e!187671)))

(declare-fun res!156477 () Bool)

(assert (=> b!296953 (=> (not res!156477) (not e!187671))))

(declare-fun lt!147467 () SeekEntryResult!2268)

(assert (=> b!296953 (= res!156477 (or lt!147466 (= lt!147467 (MissingVacant!2268 i!1256))))))

(assert (=> b!296953 (= lt!147466 (= lt!147467 (MissingZero!2268 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15023 (_ BitVec 32)) SeekEntryResult!2268)

(assert (=> b!296953 (= lt!147467 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296954 () Bool)

(declare-fun e!187674 () Bool)

(assert (=> b!296954 (= e!187673 e!187674)))

(declare-fun res!156481 () Bool)

(assert (=> b!296954 (=> (not res!156481) (not e!187674))))

(declare-fun lt!147468 () Bool)

(assert (=> b!296954 (= res!156481 (and (or lt!147468 (not (undefined!3080 lt!147469))) (or lt!147468 (not (= (select (arr!7119 a!3312) (index!11244 lt!147469)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147468 (not (= (select (arr!7119 a!3312) (index!11244 lt!147469)) k0!2524))) (not lt!147468)))))

(get-info :version)

(assert (=> b!296954 (= lt!147468 (not ((_ is Intermediate!2268) lt!147469)))))

(declare-fun b!296956 () Bool)

(declare-fun res!156479 () Bool)

(assert (=> b!296956 (=> (not res!156479) (not e!187672))))

(assert (=> b!296956 (= res!156479 (and (= (size!7471 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7471 a!3312))))))

(declare-fun b!296957 () Bool)

(assert (=> b!296957 (= e!187674 (not true))))

(assert (=> b!296957 (and (= (select (arr!7119 a!3312) (index!11244 lt!147469)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11244 lt!147469) i!1256))))

(declare-fun b!296955 () Bool)

(declare-fun res!156480 () Bool)

(assert (=> b!296955 (=> (not res!156480) (not e!187672))))

(declare-fun arrayContainsKey!0 (array!15023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296955 (= res!156480 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!156483 () Bool)

(assert (=> start!29310 (=> (not res!156483) (not e!187672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29310 (= res!156483 (validMask!0 mask!3809))))

(assert (=> start!29310 e!187672))

(assert (=> start!29310 true))

(declare-fun array_inv!5082 (array!15023) Bool)

(assert (=> start!29310 (array_inv!5082 a!3312)))

(assert (= (and start!29310 res!156483) b!296956))

(assert (= (and b!296956 res!156479) b!296950))

(assert (= (and b!296950 res!156476) b!296955))

(assert (= (and b!296955 res!156480) b!296953))

(assert (= (and b!296953 res!156477) b!296951))

(assert (= (and b!296951 res!156482) b!296952))

(assert (= (and b!296952 res!156478) b!296954))

(assert (= (and b!296954 res!156481) b!296957))

(declare-fun m!309775 () Bool)

(assert (=> b!296951 m!309775))

(declare-fun m!309777 () Bool)

(assert (=> b!296954 m!309777))

(declare-fun m!309779 () Bool)

(assert (=> b!296950 m!309779))

(declare-fun m!309781 () Bool)

(assert (=> b!296952 m!309781))

(declare-fun m!309783 () Bool)

(assert (=> b!296952 m!309783))

(declare-fun m!309785 () Bool)

(assert (=> b!296952 m!309785))

(declare-fun m!309787 () Bool)

(assert (=> b!296952 m!309787))

(assert (=> b!296957 m!309777))

(declare-fun m!309789 () Bool)

(assert (=> start!29310 m!309789))

(declare-fun m!309791 () Bool)

(assert (=> start!29310 m!309791))

(declare-fun m!309793 () Bool)

(assert (=> b!296953 m!309793))

(declare-fun m!309795 () Bool)

(assert (=> b!296955 m!309795))

(check-sat (not b!296955) (not b!296952) (not b!296950) (not b!296953) (not start!29310) (not b!296951))
(check-sat)
