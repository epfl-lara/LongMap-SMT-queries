; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28210 () Bool)

(assert start!28210)

(declare-fun b!289021 () Bool)

(declare-fun e!182986 () Bool)

(declare-fun e!182987 () Bool)

(assert (=> b!289021 (= e!182986 e!182987)))

(declare-fun res!150623 () Bool)

(assert (=> b!289021 (=> (not res!150623) (not e!182987))))

(declare-fun lt!142545 () Bool)

(assert (=> b!289021 (= res!150623 lt!142545)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142540 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2006 0))(
  ( (MissingZero!2006 (index!10194 (_ BitVec 32))) (Found!2006 (index!10195 (_ BitVec 32))) (Intermediate!2006 (undefined!2818 Bool) (index!10196 (_ BitVec 32)) (x!28515 (_ BitVec 32))) (Undefined!2006) (MissingVacant!2006 (index!10197 (_ BitVec 32))) )
))
(declare-fun lt!142542 () SeekEntryResult!2006)

(declare-datatypes ((array!14529 0))(
  ( (array!14530 (arr!6892 (Array (_ BitVec 32) (_ BitVec 64))) (size!7244 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14529)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14529 (_ BitVec 32)) SeekEntryResult!2006)

(assert (=> b!289021 (= lt!142542 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142540 k0!2524 (array!14530 (store (arr!6892 a!3312) i!1256 k0!2524) (size!7244 a!3312)) mask!3809))))

(declare-fun lt!142544 () SeekEntryResult!2006)

(assert (=> b!289021 (= lt!142544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142540 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289021 (= lt!142540 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289022 () Bool)

(declare-fun res!150624 () Bool)

(declare-fun e!182984 () Bool)

(assert (=> b!289022 (=> (not res!150624) (not e!182984))))

(assert (=> b!289022 (= res!150624 (and (= (size!7244 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7244 a!3312))))))

(declare-fun b!289023 () Bool)

(declare-fun res!150621 () Bool)

(assert (=> b!289023 (=> (not res!150621) (not e!182984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289023 (= res!150621 (validKeyInArray!0 k0!2524))))

(declare-fun b!289024 () Bool)

(declare-fun res!150622 () Bool)

(assert (=> b!289024 (=> (not res!150622) (not e!182986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14529 (_ BitVec 32)) Bool)

(assert (=> b!289024 (= res!150622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289025 () Bool)

(declare-fun e!182983 () Bool)

(assert (=> b!289025 (= e!182983 (not true))))

(assert (=> b!289025 (and (= (select (arr!6892 a!3312) (index!10196 lt!142544)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10196 lt!142544) i!1256))))

(declare-fun b!289026 () Bool)

(assert (=> b!289026 (= e!182987 e!182983)))

(declare-fun res!150618 () Bool)

(assert (=> b!289026 (=> (not res!150618) (not e!182983))))

(declare-fun lt!142543 () Bool)

(assert (=> b!289026 (= res!150618 (and (or lt!142543 (not (undefined!2818 lt!142544))) (or lt!142543 (not (= (select (arr!6892 a!3312) (index!10196 lt!142544)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142543 (not (= (select (arr!6892 a!3312) (index!10196 lt!142544)) k0!2524))) (not lt!142543)))))

(get-info :version)

(assert (=> b!289026 (= lt!142543 (not ((_ is Intermediate!2006) lt!142544)))))

(declare-fun b!289027 () Bool)

(assert (=> b!289027 (= e!182984 e!182986)))

(declare-fun res!150620 () Bool)

(assert (=> b!289027 (=> (not res!150620) (not e!182986))))

(declare-fun lt!142541 () SeekEntryResult!2006)

(assert (=> b!289027 (= res!150620 (or lt!142545 (= lt!142541 (MissingVacant!2006 i!1256))))))

(assert (=> b!289027 (= lt!142545 (= lt!142541 (MissingZero!2006 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14529 (_ BitVec 32)) SeekEntryResult!2006)

(assert (=> b!289027 (= lt!142541 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289020 () Bool)

(declare-fun res!150619 () Bool)

(assert (=> b!289020 (=> (not res!150619) (not e!182984))))

(declare-fun arrayContainsKey!0 (array!14529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289020 (= res!150619 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!150617 () Bool)

(assert (=> start!28210 (=> (not res!150617) (not e!182984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28210 (= res!150617 (validMask!0 mask!3809))))

(assert (=> start!28210 e!182984))

(assert (=> start!28210 true))

(declare-fun array_inv!4842 (array!14529) Bool)

(assert (=> start!28210 (array_inv!4842 a!3312)))

(assert (= (and start!28210 res!150617) b!289022))

(assert (= (and b!289022 res!150624) b!289023))

(assert (= (and b!289023 res!150621) b!289020))

(assert (= (and b!289020 res!150619) b!289027))

(assert (= (and b!289027 res!150620) b!289024))

(assert (= (and b!289024 res!150622) b!289021))

(assert (= (and b!289021 res!150623) b!289026))

(assert (= (and b!289026 res!150618) b!289025))

(declare-fun m!303365 () Bool)

(assert (=> b!289020 m!303365))

(declare-fun m!303367 () Bool)

(assert (=> b!289027 m!303367))

(declare-fun m!303369 () Bool)

(assert (=> b!289021 m!303369))

(declare-fun m!303371 () Bool)

(assert (=> b!289021 m!303371))

(declare-fun m!303373 () Bool)

(assert (=> b!289021 m!303373))

(declare-fun m!303375 () Bool)

(assert (=> b!289021 m!303375))

(declare-fun m!303377 () Bool)

(assert (=> b!289026 m!303377))

(declare-fun m!303379 () Bool)

(assert (=> b!289023 m!303379))

(assert (=> b!289025 m!303377))

(declare-fun m!303381 () Bool)

(assert (=> b!289024 m!303381))

(declare-fun m!303383 () Bool)

(assert (=> start!28210 m!303383))

(declare-fun m!303385 () Bool)

(assert (=> start!28210 m!303385))

(check-sat (not start!28210) (not b!289021) (not b!289027) (not b!289023) (not b!289024) (not b!289020))
(check-sat)
