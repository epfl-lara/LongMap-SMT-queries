; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29300 () Bool)

(assert start!29300)

(declare-fun b!296751 () Bool)

(declare-fun res!156409 () Bool)

(declare-fun e!187546 () Bool)

(assert (=> b!296751 (=> (not res!156409) (not e!187546))))

(declare-datatypes ((array!15016 0))(
  ( (array!15017 (arr!7116 (Array (_ BitVec 32) (_ BitVec 64))) (size!7469 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15016)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15016 (_ BitVec 32)) Bool)

(assert (=> b!296751 (= res!156409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296752 () Bool)

(declare-fun e!187543 () Bool)

(assert (=> b!296752 (= e!187546 e!187543)))

(declare-fun res!156407 () Bool)

(assert (=> b!296752 (=> (not res!156407) (not e!187543))))

(declare-fun lt!147285 () Bool)

(assert (=> b!296752 (= res!156407 lt!147285)))

(declare-fun lt!147284 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2264 0))(
  ( (MissingZero!2264 (index!11226 (_ BitVec 32))) (Found!2264 (index!11227 (_ BitVec 32))) (Intermediate!2264 (undefined!3076 Bool) (index!11228 (_ BitVec 32)) (x!29460 (_ BitVec 32))) (Undefined!2264) (MissingVacant!2264 (index!11229 (_ BitVec 32))) )
))
(declare-fun lt!147288 () SeekEntryResult!2264)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15016 (_ BitVec 32)) SeekEntryResult!2264)

(assert (=> b!296752 (= lt!147288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147284 k0!2524 (array!15017 (store (arr!7116 a!3312) i!1256 k0!2524) (size!7469 a!3312)) mask!3809))))

(declare-fun lt!147283 () SeekEntryResult!2264)

(assert (=> b!296752 (= lt!147283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147284 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296752 (= lt!147284 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296753 () Bool)

(declare-fun res!156411 () Bool)

(declare-fun e!187545 () Bool)

(assert (=> b!296753 (=> (not res!156411) (not e!187545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296753 (= res!156411 (validKeyInArray!0 k0!2524))))

(declare-fun b!296754 () Bool)

(assert (=> b!296754 (= e!187545 e!187546)))

(declare-fun res!156406 () Bool)

(assert (=> b!296754 (=> (not res!156406) (not e!187546))))

(declare-fun lt!147287 () SeekEntryResult!2264)

(assert (=> b!296754 (= res!156406 (or lt!147285 (= lt!147287 (MissingVacant!2264 i!1256))))))

(assert (=> b!296754 (= lt!147285 (= lt!147287 (MissingZero!2264 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15016 (_ BitVec 32)) SeekEntryResult!2264)

(assert (=> b!296754 (= lt!147287 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296755 () Bool)

(declare-fun res!156412 () Bool)

(assert (=> b!296755 (=> (not res!156412) (not e!187545))))

(declare-fun arrayContainsKey!0 (array!15016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296755 (= res!156412 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296756 () Bool)

(declare-fun e!187544 () Bool)

(assert (=> b!296756 (= e!187544 (not true))))

(assert (=> b!296756 (= lt!147288 lt!147283)))

(declare-datatypes ((Unit!9190 0))(
  ( (Unit!9191) )
))
(declare-fun lt!147282 () Unit!9190)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15016 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9190)

(assert (=> b!296756 (= lt!147282 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147284 (index!11228 lt!147283) (x!29460 lt!147283) mask!3809))))

(assert (=> b!296756 (and (= (select (arr!7116 a!3312) (index!11228 lt!147283)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11228 lt!147283) i!1256))))

(declare-fun res!156410 () Bool)

(assert (=> start!29300 (=> (not res!156410) (not e!187545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29300 (= res!156410 (validMask!0 mask!3809))))

(assert (=> start!29300 e!187545))

(assert (=> start!29300 true))

(declare-fun array_inv!5088 (array!15016) Bool)

(assert (=> start!29300 (array_inv!5088 a!3312)))

(declare-fun b!296757 () Bool)

(declare-fun res!156405 () Bool)

(assert (=> b!296757 (=> (not res!156405) (not e!187545))))

(assert (=> b!296757 (= res!156405 (and (= (size!7469 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7469 a!3312))))))

(declare-fun b!296758 () Bool)

(assert (=> b!296758 (= e!187543 e!187544)))

(declare-fun res!156408 () Bool)

(assert (=> b!296758 (=> (not res!156408) (not e!187544))))

(declare-fun lt!147286 () Bool)

(assert (=> b!296758 (= res!156408 (and (or lt!147286 (not (undefined!3076 lt!147283))) (or lt!147286 (not (= (select (arr!7116 a!3312) (index!11228 lt!147283)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147286 (not (= (select (arr!7116 a!3312) (index!11228 lt!147283)) k0!2524))) (not lt!147286)))))

(get-info :version)

(assert (=> b!296758 (= lt!147286 (not ((_ is Intermediate!2264) lt!147283)))))

(assert (= (and start!29300 res!156410) b!296757))

(assert (= (and b!296757 res!156405) b!296753))

(assert (= (and b!296753 res!156411) b!296755))

(assert (= (and b!296755 res!156412) b!296754))

(assert (= (and b!296754 res!156406) b!296751))

(assert (= (and b!296751 res!156409) b!296752))

(assert (= (and b!296752 res!156407) b!296758))

(assert (= (and b!296758 res!156408) b!296756))

(declare-fun m!309123 () Bool)

(assert (=> start!29300 m!309123))

(declare-fun m!309125 () Bool)

(assert (=> start!29300 m!309125))

(declare-fun m!309127 () Bool)

(assert (=> b!296753 m!309127))

(declare-fun m!309129 () Bool)

(assert (=> b!296754 m!309129))

(declare-fun m!309131 () Bool)

(assert (=> b!296758 m!309131))

(declare-fun m!309133 () Bool)

(assert (=> b!296751 m!309133))

(declare-fun m!309135 () Bool)

(assert (=> b!296752 m!309135))

(declare-fun m!309137 () Bool)

(assert (=> b!296752 m!309137))

(declare-fun m!309139 () Bool)

(assert (=> b!296752 m!309139))

(declare-fun m!309141 () Bool)

(assert (=> b!296752 m!309141))

(declare-fun m!309143 () Bool)

(assert (=> b!296755 m!309143))

(declare-fun m!309145 () Bool)

(assert (=> b!296756 m!309145))

(assert (=> b!296756 m!309131))

(check-sat (not b!296756) (not b!296751) (not start!29300) (not b!296755) (not b!296752) (not b!296753) (not b!296754))
(check-sat)
