; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28292 () Bool)

(assert start!28292)

(declare-fun b!289812 () Bool)

(declare-fun res!151344 () Bool)

(declare-fun e!183422 () Bool)

(assert (=> b!289812 (=> (not res!151344) (not e!183422))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14599 0))(
  ( (array!14600 (arr!6927 (Array (_ BitVec 32) (_ BitVec 64))) (size!7280 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14599)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289812 (= res!151344 (and (= (size!7280 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7280 a!3312))))))

(declare-fun b!289813 () Bool)

(declare-fun res!151345 () Bool)

(assert (=> b!289813 (=> (not res!151345) (not e!183422))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289813 (= res!151345 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289814 () Bool)

(declare-fun res!151343 () Bool)

(declare-fun e!183423 () Bool)

(assert (=> b!289814 (=> (not res!151343) (not e!183423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14599 (_ BitVec 32)) Bool)

(assert (=> b!289814 (= res!151343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!151346 () Bool)

(assert (=> start!28292 (=> (not res!151346) (not e!183422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28292 (= res!151346 (validMask!0 mask!3809))))

(assert (=> start!28292 e!183422))

(assert (=> start!28292 true))

(declare-fun array_inv!4899 (array!14599) Bool)

(assert (=> start!28292 (array_inv!4899 a!3312)))

(declare-fun b!289815 () Bool)

(assert (=> b!289815 (= e!183423 false)))

(declare-fun lt!142989 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2075 0))(
  ( (MissingZero!2075 (index!10470 (_ BitVec 32))) (Found!2075 (index!10471 (_ BitVec 32))) (Intermediate!2075 (undefined!2887 Bool) (index!10472 (_ BitVec 32)) (x!28687 (_ BitVec 32))) (Undefined!2075) (MissingVacant!2075 (index!10473 (_ BitVec 32))) )
))
(declare-fun lt!142990 () SeekEntryResult!2075)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14599 (_ BitVec 32)) SeekEntryResult!2075)

(assert (=> b!289815 (= lt!142990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142989 k0!2524 (array!14600 (store (arr!6927 a!3312) i!1256 k0!2524) (size!7280 a!3312)) mask!3809))))

(declare-fun lt!142992 () SeekEntryResult!2075)

(assert (=> b!289815 (= lt!142992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142989 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289815 (= lt!142989 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289816 () Bool)

(declare-fun res!151347 () Bool)

(assert (=> b!289816 (=> (not res!151347) (not e!183422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289816 (= res!151347 (validKeyInArray!0 k0!2524))))

(declare-fun b!289817 () Bool)

(assert (=> b!289817 (= e!183422 e!183423)))

(declare-fun res!151348 () Bool)

(assert (=> b!289817 (=> (not res!151348) (not e!183423))))

(declare-fun lt!142991 () SeekEntryResult!2075)

(assert (=> b!289817 (= res!151348 (or (= lt!142991 (MissingZero!2075 i!1256)) (= lt!142991 (MissingVacant!2075 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14599 (_ BitVec 32)) SeekEntryResult!2075)

(assert (=> b!289817 (= lt!142991 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28292 res!151346) b!289812))

(assert (= (and b!289812 res!151344) b!289816))

(assert (= (and b!289816 res!151347) b!289813))

(assert (= (and b!289813 res!151345) b!289817))

(assert (= (and b!289817 res!151348) b!289814))

(assert (= (and b!289814 res!151343) b!289815))

(declare-fun m!303455 () Bool)

(assert (=> start!28292 m!303455))

(declare-fun m!303457 () Bool)

(assert (=> start!28292 m!303457))

(declare-fun m!303459 () Bool)

(assert (=> b!289817 m!303459))

(declare-fun m!303461 () Bool)

(assert (=> b!289815 m!303461))

(declare-fun m!303463 () Bool)

(assert (=> b!289815 m!303463))

(declare-fun m!303465 () Bool)

(assert (=> b!289815 m!303465))

(declare-fun m!303467 () Bool)

(assert (=> b!289815 m!303467))

(declare-fun m!303469 () Bool)

(assert (=> b!289814 m!303469))

(declare-fun m!303471 () Bool)

(assert (=> b!289813 m!303471))

(declare-fun m!303473 () Bool)

(assert (=> b!289816 m!303473))

(check-sat (not b!289814) (not b!289816) (not b!289813) (not b!289817) (not start!28292) (not b!289815))
(check-sat)
