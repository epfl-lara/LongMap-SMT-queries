; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28202 () Bool)

(assert start!28202)

(declare-fun b!288682 () Bool)

(declare-fun e!182768 () Bool)

(declare-fun e!182770 () Bool)

(assert (=> b!288682 (= e!182768 e!182770)))

(declare-fun res!150364 () Bool)

(assert (=> b!288682 (=> (not res!150364) (not e!182770))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142195 () Bool)

(declare-datatypes ((SeekEntryResult!2030 0))(
  ( (MissingZero!2030 (index!10290 (_ BitVec 32))) (Found!2030 (index!10291 (_ BitVec 32))) (Intermediate!2030 (undefined!2842 Bool) (index!10292 (_ BitVec 32)) (x!28522 (_ BitVec 32))) (Undefined!2030) (MissingVacant!2030 (index!10293 (_ BitVec 32))) )
))
(declare-fun lt!142192 () SeekEntryResult!2030)

(assert (=> b!288682 (= res!150364 (or lt!142195 (= lt!142192 (MissingVacant!2030 i!1256))))))

(assert (=> b!288682 (= lt!142195 (= lt!142192 (MissingZero!2030 i!1256)))))

(declare-datatypes ((array!14509 0))(
  ( (array!14510 (arr!6882 (Array (_ BitVec 32) (_ BitVec 64))) (size!7235 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14509)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14509 (_ BitVec 32)) SeekEntryResult!2030)

(assert (=> b!288682 (= lt!142192 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288683 () Bool)

(declare-fun res!150358 () Bool)

(assert (=> b!288683 (=> (not res!150358) (not e!182770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14509 (_ BitVec 32)) Bool)

(assert (=> b!288683 (= res!150358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288684 () Bool)

(declare-fun e!182772 () Bool)

(declare-fun e!182769 () Bool)

(assert (=> b!288684 (= e!182772 e!182769)))

(declare-fun res!150360 () Bool)

(assert (=> b!288684 (=> (not res!150360) (not e!182769))))

(declare-fun lt!142194 () Bool)

(declare-fun lt!142193 () SeekEntryResult!2030)

(assert (=> b!288684 (= res!150360 (and (or lt!142194 (not (undefined!2842 lt!142193))) (or lt!142194 (not (= (select (arr!6882 a!3312) (index!10292 lt!142193)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142194 (not (= (select (arr!6882 a!3312) (index!10292 lt!142193)) k0!2524))) (not lt!142194)))))

(get-info :version)

(assert (=> b!288684 (= lt!142194 (not ((_ is Intermediate!2030) lt!142193)))))

(declare-fun res!150361 () Bool)

(assert (=> start!28202 (=> (not res!150361) (not e!182768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28202 (= res!150361 (validMask!0 mask!3809))))

(assert (=> start!28202 e!182768))

(assert (=> start!28202 true))

(declare-fun array_inv!4854 (array!14509) Bool)

(assert (=> start!28202 (array_inv!4854 a!3312)))

(declare-fun b!288685 () Bool)

(assert (=> b!288685 (= e!182770 e!182772)))

(declare-fun res!150359 () Bool)

(assert (=> b!288685 (=> (not res!150359) (not e!182772))))

(assert (=> b!288685 (= res!150359 lt!142195)))

(declare-fun lt!142197 () (_ BitVec 32))

(declare-fun lt!142196 () SeekEntryResult!2030)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14509 (_ BitVec 32)) SeekEntryResult!2030)

(assert (=> b!288685 (= lt!142196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142197 k0!2524 (array!14510 (store (arr!6882 a!3312) i!1256 k0!2524) (size!7235 a!3312)) mask!3809))))

(assert (=> b!288685 (= lt!142193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142197 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288685 (= lt!142197 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288686 () Bool)

(declare-fun res!150363 () Bool)

(assert (=> b!288686 (=> (not res!150363) (not e!182768))))

(declare-fun arrayContainsKey!0 (array!14509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288686 (= res!150363 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288687 () Bool)

(declare-fun res!150357 () Bool)

(assert (=> b!288687 (=> (not res!150357) (not e!182768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288687 (= res!150357 (validKeyInArray!0 k0!2524))))

(declare-fun b!288688 () Bool)

(assert (=> b!288688 (= e!182769 (not true))))

(assert (=> b!288688 (and (= (select (arr!6882 a!3312) (index!10292 lt!142193)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10292 lt!142193) i!1256))))

(declare-fun b!288689 () Bool)

(declare-fun res!150362 () Bool)

(assert (=> b!288689 (=> (not res!150362) (not e!182768))))

(assert (=> b!288689 (= res!150362 (and (= (size!7235 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7235 a!3312))))))

(assert (= (and start!28202 res!150361) b!288689))

(assert (= (and b!288689 res!150362) b!288687))

(assert (= (and b!288687 res!150357) b!288686))

(assert (= (and b!288686 res!150363) b!288682))

(assert (= (and b!288682 res!150364) b!288683))

(assert (= (and b!288683 res!150358) b!288685))

(assert (= (and b!288685 res!150359) b!288684))

(assert (= (and b!288684 res!150360) b!288688))

(declare-fun m!302435 () Bool)

(assert (=> b!288684 m!302435))

(declare-fun m!302437 () Bool)

(assert (=> b!288685 m!302437))

(declare-fun m!302439 () Bool)

(assert (=> b!288685 m!302439))

(declare-fun m!302441 () Bool)

(assert (=> b!288685 m!302441))

(declare-fun m!302443 () Bool)

(assert (=> b!288685 m!302443))

(declare-fun m!302445 () Bool)

(assert (=> b!288687 m!302445))

(declare-fun m!302447 () Bool)

(assert (=> b!288686 m!302447))

(declare-fun m!302449 () Bool)

(assert (=> b!288682 m!302449))

(assert (=> b!288688 m!302435))

(declare-fun m!302451 () Bool)

(assert (=> b!288683 m!302451))

(declare-fun m!302453 () Bool)

(assert (=> start!28202 m!302453))

(declare-fun m!302455 () Bool)

(assert (=> start!28202 m!302455))

(check-sat (not b!288683) (not b!288685) (not start!28202) (not b!288687) (not b!288686) (not b!288682))
(check-sat)
