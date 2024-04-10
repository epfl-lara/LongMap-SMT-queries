; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28202 () Bool)

(assert start!28202)

(declare-fun b!288781 () Bool)

(declare-fun res!150407 () Bool)

(declare-fun e!182840 () Bool)

(assert (=> b!288781 (=> (not res!150407) (not e!182840))))

(declare-datatypes ((array!14516 0))(
  ( (array!14517 (arr!6885 (Array (_ BitVec 32) (_ BitVec 64))) (size!7237 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14516)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288781 (= res!150407 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288782 () Bool)

(declare-fun e!182843 () Bool)

(declare-fun e!182842 () Bool)

(assert (=> b!288782 (= e!182843 e!182842)))

(declare-fun res!150406 () Bool)

(assert (=> b!288782 (=> (not res!150406) (not e!182842))))

(declare-datatypes ((SeekEntryResult!2034 0))(
  ( (MissingZero!2034 (index!10306 (_ BitVec 32))) (Found!2034 (index!10307 (_ BitVec 32))) (Intermediate!2034 (undefined!2846 Bool) (index!10308 (_ BitVec 32)) (x!28519 (_ BitVec 32))) (Undefined!2034) (MissingVacant!2034 (index!10309 (_ BitVec 32))) )
))
(declare-fun lt!142337 () SeekEntryResult!2034)

(declare-fun lt!142338 () Bool)

(assert (=> b!288782 (= res!150406 (and (or lt!142338 (not (undefined!2846 lt!142337))) (or lt!142338 (not (= (select (arr!6885 a!3312) (index!10308 lt!142337)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142338 (not (= (select (arr!6885 a!3312) (index!10308 lt!142337)) k0!2524))) (not lt!142338)))))

(get-info :version)

(assert (=> b!288782 (= lt!142338 (not ((_ is Intermediate!2034) lt!142337)))))

(declare-fun b!288783 () Bool)

(declare-fun e!182839 () Bool)

(assert (=> b!288783 (= e!182839 e!182843)))

(declare-fun res!150408 () Bool)

(assert (=> b!288783 (=> (not res!150408) (not e!182843))))

(declare-fun lt!142341 () Bool)

(assert (=> b!288783 (= res!150408 lt!142341)))

(declare-fun lt!142342 () (_ BitVec 32))

(declare-fun lt!142339 () SeekEntryResult!2034)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14516 (_ BitVec 32)) SeekEntryResult!2034)

(assert (=> b!288783 (= lt!142339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142342 k0!2524 (array!14517 (store (arr!6885 a!3312) i!1256 k0!2524) (size!7237 a!3312)) mask!3809))))

(assert (=> b!288783 (= lt!142337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142342 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288783 (= lt!142342 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!150411 () Bool)

(assert (=> start!28202 (=> (not res!150411) (not e!182840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28202 (= res!150411 (validMask!0 mask!3809))))

(assert (=> start!28202 e!182840))

(assert (=> start!28202 true))

(declare-fun array_inv!4848 (array!14516) Bool)

(assert (=> start!28202 (array_inv!4848 a!3312)))

(declare-fun b!288784 () Bool)

(assert (=> b!288784 (= e!182842 (not true))))

(assert (=> b!288784 (and (= (select (arr!6885 a!3312) (index!10308 lt!142337)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10308 lt!142337) i!1256))))

(declare-fun b!288785 () Bool)

(declare-fun res!150409 () Bool)

(assert (=> b!288785 (=> (not res!150409) (not e!182839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14516 (_ BitVec 32)) Bool)

(assert (=> b!288785 (= res!150409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288786 () Bool)

(declare-fun res!150405 () Bool)

(assert (=> b!288786 (=> (not res!150405) (not e!182840))))

(assert (=> b!288786 (= res!150405 (and (= (size!7237 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7237 a!3312))))))

(declare-fun b!288787 () Bool)

(assert (=> b!288787 (= e!182840 e!182839)))

(declare-fun res!150410 () Bool)

(assert (=> b!288787 (=> (not res!150410) (not e!182839))))

(declare-fun lt!142340 () SeekEntryResult!2034)

(assert (=> b!288787 (= res!150410 (or lt!142341 (= lt!142340 (MissingVacant!2034 i!1256))))))

(assert (=> b!288787 (= lt!142341 (= lt!142340 (MissingZero!2034 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14516 (_ BitVec 32)) SeekEntryResult!2034)

(assert (=> b!288787 (= lt!142340 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288788 () Bool)

(declare-fun res!150404 () Bool)

(assert (=> b!288788 (=> (not res!150404) (not e!182840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288788 (= res!150404 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28202 res!150411) b!288786))

(assert (= (and b!288786 res!150405) b!288788))

(assert (= (and b!288788 res!150404) b!288781))

(assert (= (and b!288781 res!150407) b!288787))

(assert (= (and b!288787 res!150410) b!288785))

(assert (= (and b!288785 res!150409) b!288783))

(assert (= (and b!288783 res!150408) b!288782))

(assert (= (and b!288782 res!150406) b!288784))

(declare-fun m!302983 () Bool)

(assert (=> start!28202 m!302983))

(declare-fun m!302985 () Bool)

(assert (=> start!28202 m!302985))

(declare-fun m!302987 () Bool)

(assert (=> b!288783 m!302987))

(declare-fun m!302989 () Bool)

(assert (=> b!288783 m!302989))

(declare-fun m!302991 () Bool)

(assert (=> b!288783 m!302991))

(declare-fun m!302993 () Bool)

(assert (=> b!288783 m!302993))

(declare-fun m!302995 () Bool)

(assert (=> b!288785 m!302995))

(declare-fun m!302997 () Bool)

(assert (=> b!288787 m!302997))

(declare-fun m!302999 () Bool)

(assert (=> b!288781 m!302999))

(declare-fun m!303001 () Bool)

(assert (=> b!288784 m!303001))

(assert (=> b!288782 m!303001))

(declare-fun m!303003 () Bool)

(assert (=> b!288788 m!303003))

(check-sat (not b!288781) (not b!288788) (not b!288785) (not b!288787) (not start!28202) (not b!288783))
(check-sat)
