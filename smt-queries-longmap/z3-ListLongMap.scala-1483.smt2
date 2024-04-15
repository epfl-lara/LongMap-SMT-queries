; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28280 () Bool)

(assert start!28280)

(declare-fun b!289704 () Bool)

(declare-fun res!151236 () Bool)

(declare-fun e!183369 () Bool)

(assert (=> b!289704 (=> (not res!151236) (not e!183369))))

(declare-datatypes ((array!14587 0))(
  ( (array!14588 (arr!6921 (Array (_ BitVec 32) (_ BitVec 64))) (size!7274 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14587)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14587 (_ BitVec 32)) Bool)

(assert (=> b!289704 (= res!151236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!151237 () Bool)

(declare-fun e!183367 () Bool)

(assert (=> start!28280 (=> (not res!151237) (not e!183367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28280 (= res!151237 (validMask!0 mask!3809))))

(assert (=> start!28280 e!183367))

(assert (=> start!28280 true))

(declare-fun array_inv!4893 (array!14587) Bool)

(assert (=> start!28280 (array_inv!4893 a!3312)))

(declare-fun b!289705 () Bool)

(declare-fun lt!142912 () Bool)

(assert (=> b!289705 (= e!183369 (and (not lt!142912) (bvslt mask!3809 #b00000000000000000000000000000000)))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142913 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2069 0))(
  ( (MissingZero!2069 (index!10446 (_ BitVec 32))) (Found!2069 (index!10447 (_ BitVec 32))) (Intermediate!2069 (undefined!2881 Bool) (index!10448 (_ BitVec 32)) (x!28665 (_ BitVec 32))) (Undefined!2069) (MissingVacant!2069 (index!10449 (_ BitVec 32))) )
))
(declare-fun lt!142914 () SeekEntryResult!2069)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14587 (_ BitVec 32)) SeekEntryResult!2069)

(assert (=> b!289705 (= lt!142914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142913 k0!2524 (array!14588 (store (arr!6921 a!3312) i!1256 k0!2524) (size!7274 a!3312)) mask!3809))))

(declare-fun lt!142910 () SeekEntryResult!2069)

(assert (=> b!289705 (= lt!142910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142913 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289705 (= lt!142913 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289706 () Bool)

(declare-fun res!151235 () Bool)

(assert (=> b!289706 (=> (not res!151235) (not e!183367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289706 (= res!151235 (validKeyInArray!0 k0!2524))))

(declare-fun b!289707 () Bool)

(declare-fun res!151240 () Bool)

(assert (=> b!289707 (=> (not res!151240) (not e!183367))))

(declare-fun arrayContainsKey!0 (array!14587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289707 (= res!151240 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289708 () Bool)

(declare-fun res!151238 () Bool)

(assert (=> b!289708 (=> (not res!151238) (not e!183367))))

(assert (=> b!289708 (= res!151238 (and (= (size!7274 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7274 a!3312))))))

(declare-fun b!289709 () Bool)

(assert (=> b!289709 (= e!183367 e!183369)))

(declare-fun res!151239 () Bool)

(assert (=> b!289709 (=> (not res!151239) (not e!183369))))

(declare-fun lt!142911 () SeekEntryResult!2069)

(assert (=> b!289709 (= res!151239 (or lt!142912 (= lt!142911 (MissingVacant!2069 i!1256))))))

(assert (=> b!289709 (= lt!142912 (= lt!142911 (MissingZero!2069 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14587 (_ BitVec 32)) SeekEntryResult!2069)

(assert (=> b!289709 (= lt!142911 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28280 res!151237) b!289708))

(assert (= (and b!289708 res!151238) b!289706))

(assert (= (and b!289706 res!151235) b!289707))

(assert (= (and b!289707 res!151240) b!289709))

(assert (= (and b!289709 res!151239) b!289704))

(assert (= (and b!289704 res!151236) b!289705))

(declare-fun m!303335 () Bool)

(assert (=> start!28280 m!303335))

(declare-fun m!303337 () Bool)

(assert (=> start!28280 m!303337))

(declare-fun m!303339 () Bool)

(assert (=> b!289709 m!303339))

(declare-fun m!303341 () Bool)

(assert (=> b!289704 m!303341))

(declare-fun m!303343 () Bool)

(assert (=> b!289707 m!303343))

(declare-fun m!303345 () Bool)

(assert (=> b!289706 m!303345))

(declare-fun m!303347 () Bool)

(assert (=> b!289705 m!303347))

(declare-fun m!303349 () Bool)

(assert (=> b!289705 m!303349))

(declare-fun m!303351 () Bool)

(assert (=> b!289705 m!303351))

(declare-fun m!303353 () Bool)

(assert (=> b!289705 m!303353))

(check-sat (not start!28280) (not b!289704) (not b!289707) (not b!289709) (not b!289705) (not b!289706))
(check-sat)
