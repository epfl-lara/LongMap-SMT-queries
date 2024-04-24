; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29176 () Bool)

(assert start!29176)

(declare-fun b!296199 () Bool)

(declare-fun res!155975 () Bool)

(declare-fun e!187201 () Bool)

(assert (=> b!296199 (=> (not res!155975) (not e!187201))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14982 0))(
  ( (array!14983 (arr!7102 (Array (_ BitVec 32) (_ BitVec 64))) (size!7454 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14982)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!296199 (= res!155975 (and (= (size!7454 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7454 a!3312))))))

(declare-fun b!296200 () Bool)

(declare-fun e!187204 () Bool)

(declare-fun e!187202 () Bool)

(assert (=> b!296200 (= e!187204 e!187202)))

(declare-fun res!155973 () Bool)

(assert (=> b!296200 (=> (not res!155973) (not e!187202))))

(declare-fun lt!147052 () Bool)

(assert (=> b!296200 (= res!155973 lt!147052)))

(declare-datatypes ((SeekEntryResult!2216 0))(
  ( (MissingZero!2216 (index!11034 (_ BitVec 32))) (Found!2216 (index!11035 (_ BitVec 32))) (Intermediate!2216 (undefined!3028 Bool) (index!11036 (_ BitVec 32)) (x!29357 (_ BitVec 32))) (Undefined!2216) (MissingVacant!2216 (index!11037 (_ BitVec 32))) )
))
(declare-fun lt!147053 () SeekEntryResult!2216)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!147054 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14982 (_ BitVec 32)) SeekEntryResult!2216)

(assert (=> b!296200 (= lt!147053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147054 k0!2524 (array!14983 (store (arr!7102 a!3312) i!1256 k0!2524) (size!7454 a!3312)) mask!3809))))

(declare-fun lt!147055 () SeekEntryResult!2216)

(assert (=> b!296200 (= lt!147055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147054 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296200 (= lt!147054 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!155969 () Bool)

(assert (=> start!29176 (=> (not res!155969) (not e!187201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29176 (= res!155969 (validMask!0 mask!3809))))

(assert (=> start!29176 e!187201))

(assert (=> start!29176 true))

(declare-fun array_inv!5052 (array!14982) Bool)

(assert (=> start!29176 (array_inv!5052 a!3312)))

(declare-fun b!296201 () Bool)

(declare-fun e!187205 () Bool)

(assert (=> b!296201 (= e!187205 (not true))))

(assert (=> b!296201 (and (= (select (arr!7102 a!3312) (index!11036 lt!147055)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11036 lt!147055) i!1256))))

(declare-fun b!296202 () Bool)

(assert (=> b!296202 (= e!187202 e!187205)))

(declare-fun res!155976 () Bool)

(assert (=> b!296202 (=> (not res!155976) (not e!187205))))

(declare-fun lt!147056 () Bool)

(assert (=> b!296202 (= res!155976 (and (or lt!147056 (not (undefined!3028 lt!147055))) (or lt!147056 (not (= (select (arr!7102 a!3312) (index!11036 lt!147055)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147056 (not (= (select (arr!7102 a!3312) (index!11036 lt!147055)) k0!2524))) (not lt!147056)))))

(get-info :version)

(assert (=> b!296202 (= lt!147056 (not ((_ is Intermediate!2216) lt!147055)))))

(declare-fun b!296203 () Bool)

(declare-fun res!155971 () Bool)

(assert (=> b!296203 (=> (not res!155971) (not e!187204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14982 (_ BitVec 32)) Bool)

(assert (=> b!296203 (= res!155971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296204 () Bool)

(declare-fun res!155970 () Bool)

(assert (=> b!296204 (=> (not res!155970) (not e!187201))))

(declare-fun arrayContainsKey!0 (array!14982 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296204 (= res!155970 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296205 () Bool)

(assert (=> b!296205 (= e!187201 e!187204)))

(declare-fun res!155972 () Bool)

(assert (=> b!296205 (=> (not res!155972) (not e!187204))))

(declare-fun lt!147057 () SeekEntryResult!2216)

(assert (=> b!296205 (= res!155972 (or lt!147052 (= lt!147057 (MissingVacant!2216 i!1256))))))

(assert (=> b!296205 (= lt!147052 (= lt!147057 (MissingZero!2216 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14982 (_ BitVec 32)) SeekEntryResult!2216)

(assert (=> b!296205 (= lt!147057 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296206 () Bool)

(declare-fun res!155974 () Bool)

(assert (=> b!296206 (=> (not res!155974) (not e!187201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296206 (= res!155974 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29176 res!155969) b!296199))

(assert (= (and b!296199 res!155975) b!296206))

(assert (= (and b!296206 res!155974) b!296204))

(assert (= (and b!296204 res!155970) b!296205))

(assert (= (and b!296205 res!155972) b!296203))

(assert (= (and b!296203 res!155971) b!296200))

(assert (= (and b!296200 res!155973) b!296202))

(assert (= (and b!296202 res!155976) b!296201))

(declare-fun m!309413 () Bool)

(assert (=> b!296201 m!309413))

(assert (=> b!296202 m!309413))

(declare-fun m!309415 () Bool)

(assert (=> start!29176 m!309415))

(declare-fun m!309417 () Bool)

(assert (=> start!29176 m!309417))

(declare-fun m!309419 () Bool)

(assert (=> b!296205 m!309419))

(declare-fun m!309421 () Bool)

(assert (=> b!296200 m!309421))

(declare-fun m!309423 () Bool)

(assert (=> b!296200 m!309423))

(declare-fun m!309425 () Bool)

(assert (=> b!296200 m!309425))

(declare-fun m!309427 () Bool)

(assert (=> b!296200 m!309427))

(declare-fun m!309429 () Bool)

(assert (=> b!296203 m!309429))

(declare-fun m!309431 () Bool)

(assert (=> b!296204 m!309431))

(declare-fun m!309433 () Bool)

(assert (=> b!296206 m!309433))

(check-sat (not b!296205) (not b!296206) (not b!296203) (not b!296200) (not b!296204) (not start!29176))
(check-sat)
