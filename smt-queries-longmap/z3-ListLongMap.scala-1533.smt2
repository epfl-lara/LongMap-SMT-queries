; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29130 () Bool)

(assert start!29130)

(declare-fun b!295510 () Bool)

(declare-fun res!155322 () Bool)

(declare-fun e!186779 () Bool)

(assert (=> b!295510 (=> (not res!155322) (not e!186779))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295510 (= res!155322 (validKeyInArray!0 k0!2524))))

(declare-fun b!295511 () Bool)

(declare-fun res!155321 () Bool)

(declare-fun e!186781 () Bool)

(assert (=> b!295511 (=> (not res!155321) (not e!186781))))

(declare-datatypes ((array!14933 0))(
  ( (array!14934 (arr!7077 (Array (_ BitVec 32) (_ BitVec 64))) (size!7429 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14933)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14933 (_ BitVec 32)) Bool)

(assert (=> b!295511 (= res!155321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295512 () Bool)

(declare-fun res!155318 () Bool)

(assert (=> b!295512 (=> (not res!155318) (not e!186779))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295512 (= res!155318 (and (= (size!7429 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7429 a!3312))))))

(declare-fun b!295513 () Bool)

(assert (=> b!295513 (= e!186779 e!186781)))

(declare-fun res!155324 () Bool)

(assert (=> b!295513 (=> (not res!155324) (not e!186781))))

(declare-datatypes ((SeekEntryResult!2226 0))(
  ( (MissingZero!2226 (index!11074 (_ BitVec 32))) (Found!2226 (index!11075 (_ BitVec 32))) (Intermediate!2226 (undefined!3038 Bool) (index!11076 (_ BitVec 32)) (x!29294 (_ BitVec 32))) (Undefined!2226) (MissingVacant!2226 (index!11077 (_ BitVec 32))) )
))
(declare-fun lt!146523 () SeekEntryResult!2226)

(declare-fun lt!146518 () Bool)

(assert (=> b!295513 (= res!155324 (or lt!146518 (= lt!146523 (MissingVacant!2226 i!1256))))))

(assert (=> b!295513 (= lt!146518 (= lt!146523 (MissingZero!2226 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14933 (_ BitVec 32)) SeekEntryResult!2226)

(assert (=> b!295513 (= lt!146523 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!155320 () Bool)

(assert (=> start!29130 (=> (not res!155320) (not e!186779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29130 (= res!155320 (validMask!0 mask!3809))))

(assert (=> start!29130 e!186779))

(assert (=> start!29130 true))

(declare-fun array_inv!5040 (array!14933) Bool)

(assert (=> start!29130 (array_inv!5040 a!3312)))

(declare-fun b!295514 () Bool)

(declare-fun res!155325 () Bool)

(assert (=> b!295514 (=> (not res!155325) (not e!186779))))

(declare-fun arrayContainsKey!0 (array!14933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295514 (= res!155325 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295515 () Bool)

(declare-fun e!186778 () Bool)

(declare-fun e!186780 () Bool)

(assert (=> b!295515 (= e!186778 e!186780)))

(declare-fun res!155323 () Bool)

(assert (=> b!295515 (=> (not res!155323) (not e!186780))))

(declare-fun lt!146522 () SeekEntryResult!2226)

(declare-fun lt!146521 () Bool)

(assert (=> b!295515 (= res!155323 (and (or lt!146521 (not (undefined!3038 lt!146522))) (or lt!146521 (not (= (select (arr!7077 a!3312) (index!11076 lt!146522)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146521 (not (= (select (arr!7077 a!3312) (index!11076 lt!146522)) k0!2524))) (not lt!146521)))))

(get-info :version)

(assert (=> b!295515 (= lt!146521 (not ((_ is Intermediate!2226) lt!146522)))))

(declare-fun b!295516 () Bool)

(assert (=> b!295516 (= e!186781 e!186778)))

(declare-fun res!155319 () Bool)

(assert (=> b!295516 (=> (not res!155319) (not e!186778))))

(assert (=> b!295516 (= res!155319 lt!146518)))

(declare-fun lt!146520 () (_ BitVec 32))

(declare-fun lt!146519 () SeekEntryResult!2226)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14933 (_ BitVec 32)) SeekEntryResult!2226)

(assert (=> b!295516 (= lt!146519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146520 k0!2524 (array!14934 (store (arr!7077 a!3312) i!1256 k0!2524) (size!7429 a!3312)) mask!3809))))

(assert (=> b!295516 (= lt!146522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146520 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295516 (= lt!146520 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295517 () Bool)

(assert (=> b!295517 (= e!186780 (not true))))

(assert (=> b!295517 (and (= (select (arr!7077 a!3312) (index!11076 lt!146522)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11076 lt!146522) i!1256))))

(assert (= (and start!29130 res!155320) b!295512))

(assert (= (and b!295512 res!155318) b!295510))

(assert (= (and b!295510 res!155322) b!295514))

(assert (= (and b!295514 res!155325) b!295513))

(assert (= (and b!295513 res!155324) b!295511))

(assert (= (and b!295511 res!155321) b!295516))

(assert (= (and b!295516 res!155319) b!295515))

(assert (= (and b!295515 res!155323) b!295517))

(declare-fun m!308611 () Bool)

(assert (=> b!295515 m!308611))

(declare-fun m!308613 () Bool)

(assert (=> b!295513 m!308613))

(declare-fun m!308615 () Bool)

(assert (=> b!295511 m!308615))

(assert (=> b!295517 m!308611))

(declare-fun m!308617 () Bool)

(assert (=> b!295514 m!308617))

(declare-fun m!308619 () Bool)

(assert (=> b!295516 m!308619))

(declare-fun m!308621 () Bool)

(assert (=> b!295516 m!308621))

(declare-fun m!308623 () Bool)

(assert (=> b!295516 m!308623))

(declare-fun m!308625 () Bool)

(assert (=> b!295516 m!308625))

(declare-fun m!308627 () Bool)

(assert (=> start!29130 m!308627))

(declare-fun m!308629 () Bool)

(assert (=> start!29130 m!308629))

(declare-fun m!308631 () Bool)

(assert (=> b!295510 m!308631))

(check-sat (not b!295513) (not b!295510) (not b!295514) (not b!295516) (not b!295511) (not start!29130))
(check-sat)
