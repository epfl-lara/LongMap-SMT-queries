; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29128 () Bool)

(assert start!29128)

(declare-fun b!295486 () Bool)

(declare-fun e!186763 () Bool)

(declare-fun e!186762 () Bool)

(assert (=> b!295486 (= e!186763 e!186762)))

(declare-fun res!155295 () Bool)

(assert (=> b!295486 (=> (not res!155295) (not e!186762))))

(declare-fun lt!146503 () Bool)

(assert (=> b!295486 (= res!155295 lt!146503)))

(declare-fun lt!146504 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2225 0))(
  ( (MissingZero!2225 (index!11070 (_ BitVec 32))) (Found!2225 (index!11071 (_ BitVec 32))) (Intermediate!2225 (undefined!3037 Bool) (index!11072 (_ BitVec 32)) (x!29293 (_ BitVec 32))) (Undefined!2225) (MissingVacant!2225 (index!11073 (_ BitVec 32))) )
))
(declare-fun lt!146500 () SeekEntryResult!2225)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14931 0))(
  ( (array!14932 (arr!7076 (Array (_ BitVec 32) (_ BitVec 64))) (size!7428 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14931)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14931 (_ BitVec 32)) SeekEntryResult!2225)

(assert (=> b!295486 (= lt!146500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146504 k!2524 (array!14932 (store (arr!7076 a!3312) i!1256 k!2524) (size!7428 a!3312)) mask!3809))))

(declare-fun lt!146501 () SeekEntryResult!2225)

(assert (=> b!295486 (= lt!146501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146504 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295486 (= lt!146504 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295487 () Bool)

(declare-fun res!155298 () Bool)

(declare-fun e!186764 () Bool)

(assert (=> b!295487 (=> (not res!155298) (not e!186764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295487 (= res!155298 (validKeyInArray!0 k!2524))))

(declare-fun b!295488 () Bool)

(declare-fun res!155300 () Bool)

(assert (=> b!295488 (=> (not res!155300) (not e!186763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14931 (_ BitVec 32)) Bool)

(assert (=> b!295488 (= res!155300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295489 () Bool)

(declare-fun e!186765 () Bool)

(assert (=> b!295489 (= e!186765 (not true))))

(assert (=> b!295489 (and (= (select (arr!7076 a!3312) (index!11072 lt!146501)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11072 lt!146501) i!1256))))

(declare-fun b!295490 () Bool)

(assert (=> b!295490 (= e!186762 e!186765)))

(declare-fun res!155294 () Bool)

(assert (=> b!295490 (=> (not res!155294) (not e!186765))))

(declare-fun lt!146502 () Bool)

(assert (=> b!295490 (= res!155294 (and (or lt!146502 (not (undefined!3037 lt!146501))) (or lt!146502 (not (= (select (arr!7076 a!3312) (index!11072 lt!146501)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146502 (not (= (select (arr!7076 a!3312) (index!11072 lt!146501)) k!2524))) (not lt!146502)))))

(assert (=> b!295490 (= lt!146502 (not (is-Intermediate!2225 lt!146501)))))

(declare-fun b!295491 () Bool)

(declare-fun res!155296 () Bool)

(assert (=> b!295491 (=> (not res!155296) (not e!186764))))

(declare-fun arrayContainsKey!0 (array!14931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295491 (= res!155296 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!155297 () Bool)

(assert (=> start!29128 (=> (not res!155297) (not e!186764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29128 (= res!155297 (validMask!0 mask!3809))))

(assert (=> start!29128 e!186764))

(assert (=> start!29128 true))

(declare-fun array_inv!5039 (array!14931) Bool)

(assert (=> start!29128 (array_inv!5039 a!3312)))

(declare-fun b!295492 () Bool)

(declare-fun res!155301 () Bool)

(assert (=> b!295492 (=> (not res!155301) (not e!186764))))

(assert (=> b!295492 (= res!155301 (and (= (size!7428 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7428 a!3312))))))

(declare-fun b!295493 () Bool)

(assert (=> b!295493 (= e!186764 e!186763)))

(declare-fun res!155299 () Bool)

(assert (=> b!295493 (=> (not res!155299) (not e!186763))))

(declare-fun lt!146505 () SeekEntryResult!2225)

(assert (=> b!295493 (= res!155299 (or lt!146503 (= lt!146505 (MissingVacant!2225 i!1256))))))

(assert (=> b!295493 (= lt!146503 (= lt!146505 (MissingZero!2225 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14931 (_ BitVec 32)) SeekEntryResult!2225)

(assert (=> b!295493 (= lt!146505 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29128 res!155297) b!295492))

(assert (= (and b!295492 res!155301) b!295487))

(assert (= (and b!295487 res!155298) b!295491))

(assert (= (and b!295491 res!155296) b!295493))

(assert (= (and b!295493 res!155299) b!295488))

(assert (= (and b!295488 res!155300) b!295486))

(assert (= (and b!295486 res!155295) b!295490))

(assert (= (and b!295490 res!155294) b!295489))

(declare-fun m!308589 () Bool)

(assert (=> b!295488 m!308589))

(declare-fun m!308591 () Bool)

(assert (=> start!29128 m!308591))

(declare-fun m!308593 () Bool)

(assert (=> start!29128 m!308593))

(declare-fun m!308595 () Bool)

(assert (=> b!295489 m!308595))

(declare-fun m!308597 () Bool)

(assert (=> b!295487 m!308597))

(declare-fun m!308599 () Bool)

(assert (=> b!295486 m!308599))

(declare-fun m!308601 () Bool)

(assert (=> b!295486 m!308601))

(declare-fun m!308603 () Bool)

(assert (=> b!295486 m!308603))

(declare-fun m!308605 () Bool)

(assert (=> b!295486 m!308605))

(declare-fun m!308607 () Bool)

(assert (=> b!295493 m!308607))

(declare-fun m!308609 () Bool)

(assert (=> b!295491 m!308609))

(assert (=> b!295490 m!308595))

(push 1)

