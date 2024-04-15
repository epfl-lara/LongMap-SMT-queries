; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29144 () Bool)

(assert start!29144)

(declare-fun b!295599 () Bool)

(declare-fun res!155538 () Bool)

(declare-fun e!186829 () Bool)

(assert (=> b!295599 (=> (not res!155538) (not e!186829))))

(declare-datatypes ((array!14950 0))(
  ( (array!14951 (arr!7086 (Array (_ BitVec 32) (_ BitVec 64))) (size!7439 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14950)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295599 (= res!155538 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295600 () Bool)

(declare-fun res!155539 () Bool)

(assert (=> b!295600 (=> (not res!155539) (not e!186829))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!295600 (= res!155539 (and (= (size!7439 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7439 a!3312))))))

(declare-fun b!295601 () Bool)

(declare-fun res!155536 () Bool)

(declare-fun e!186828 () Bool)

(assert (=> b!295601 (=> (not res!155536) (not e!186828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14950 (_ BitVec 32)) Bool)

(assert (=> b!295601 (= res!155536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295602 () Bool)

(declare-fun e!186832 () Bool)

(declare-fun e!186830 () Bool)

(assert (=> b!295602 (= e!186832 e!186830)))

(declare-fun res!155535 () Bool)

(assert (=> b!295602 (=> (not res!155535) (not e!186830))))

(declare-fun lt!146551 () Bool)

(declare-datatypes ((SeekEntryResult!2234 0))(
  ( (MissingZero!2234 (index!11106 (_ BitVec 32))) (Found!2234 (index!11107 (_ BitVec 32))) (Intermediate!2234 (undefined!3046 Bool) (index!11108 (_ BitVec 32)) (x!29338 (_ BitVec 32))) (Undefined!2234) (MissingVacant!2234 (index!11109 (_ BitVec 32))) )
))
(declare-fun lt!146549 () SeekEntryResult!2234)

(assert (=> b!295602 (= res!155535 (and (or lt!146551 (not (undefined!3046 lt!146549))) (or lt!146551 (not (= (select (arr!7086 a!3312) (index!11108 lt!146549)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146551 (not (= (select (arr!7086 a!3312) (index!11108 lt!146549)) k0!2524))) (not lt!146551)))))

(get-info :version)

(assert (=> b!295602 (= lt!146551 (not ((_ is Intermediate!2234) lt!146549)))))

(declare-fun b!295603 () Bool)

(assert (=> b!295603 (= e!186830 (not true))))

(assert (=> b!295603 (and (= (select (arr!7086 a!3312) (index!11108 lt!146549)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11108 lt!146549) i!1256))))

(declare-fun res!155542 () Bool)

(assert (=> start!29144 (=> (not res!155542) (not e!186829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29144 (= res!155542 (validMask!0 mask!3809))))

(assert (=> start!29144 e!186829))

(assert (=> start!29144 true))

(declare-fun array_inv!5058 (array!14950) Bool)

(assert (=> start!29144 (array_inv!5058 a!3312)))

(declare-fun b!295604 () Bool)

(assert (=> b!295604 (= e!186829 e!186828)))

(declare-fun res!155540 () Bool)

(assert (=> b!295604 (=> (not res!155540) (not e!186828))))

(declare-fun lt!146548 () SeekEntryResult!2234)

(declare-fun lt!146553 () Bool)

(assert (=> b!295604 (= res!155540 (or lt!146553 (= lt!146548 (MissingVacant!2234 i!1256))))))

(assert (=> b!295604 (= lt!146553 (= lt!146548 (MissingZero!2234 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14950 (_ BitVec 32)) SeekEntryResult!2234)

(assert (=> b!295604 (= lt!146548 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295605 () Bool)

(declare-fun res!155537 () Bool)

(assert (=> b!295605 (=> (not res!155537) (not e!186829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295605 (= res!155537 (validKeyInArray!0 k0!2524))))

(declare-fun b!295606 () Bool)

(assert (=> b!295606 (= e!186828 e!186832)))

(declare-fun res!155541 () Bool)

(assert (=> b!295606 (=> (not res!155541) (not e!186832))))

(assert (=> b!295606 (= res!155541 lt!146553)))

(declare-fun lt!146550 () (_ BitVec 32))

(declare-fun lt!146552 () SeekEntryResult!2234)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14950 (_ BitVec 32)) SeekEntryResult!2234)

(assert (=> b!295606 (= lt!146552 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146550 k0!2524 (array!14951 (store (arr!7086 a!3312) i!1256 k0!2524) (size!7439 a!3312)) mask!3809))))

(assert (=> b!295606 (= lt!146549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146550 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295606 (= lt!146550 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29144 res!155542) b!295600))

(assert (= (and b!295600 res!155539) b!295605))

(assert (= (and b!295605 res!155537) b!295599))

(assert (= (and b!295599 res!155538) b!295604))

(assert (= (and b!295604 res!155540) b!295601))

(assert (= (and b!295601 res!155536) b!295606))

(assert (= (and b!295606 res!155541) b!295602))

(assert (= (and b!295602 res!155535) b!295603))

(declare-fun m!308223 () Bool)

(assert (=> b!295601 m!308223))

(declare-fun m!308225 () Bool)

(assert (=> b!295599 m!308225))

(declare-fun m!308227 () Bool)

(assert (=> b!295603 m!308227))

(declare-fun m!308229 () Bool)

(assert (=> b!295604 m!308229))

(declare-fun m!308231 () Bool)

(assert (=> b!295606 m!308231))

(declare-fun m!308233 () Bool)

(assert (=> b!295606 m!308233))

(declare-fun m!308235 () Bool)

(assert (=> b!295606 m!308235))

(declare-fun m!308237 () Bool)

(assert (=> b!295606 m!308237))

(declare-fun m!308239 () Bool)

(assert (=> start!29144 m!308239))

(declare-fun m!308241 () Bool)

(assert (=> start!29144 m!308241))

(assert (=> b!295602 m!308227))

(declare-fun m!308243 () Bool)

(assert (=> b!295605 m!308243))

(check-sat (not b!295601) (not start!29144) (not b!295605) (not b!295606) (not b!295604) (not b!295599))
(check-sat)
