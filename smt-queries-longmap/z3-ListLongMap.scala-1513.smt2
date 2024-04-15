; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28604 () Bool)

(assert start!28604)

(declare-fun b!292350 () Bool)

(declare-fun res!153460 () Bool)

(declare-fun e!184952 () Bool)

(assert (=> b!292350 (=> (not res!153460) (not e!184952))))

(declare-datatypes ((array!14776 0))(
  ( (array!14777 (arr!7011 (Array (_ BitVec 32) (_ BitVec 64))) (size!7364 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14776)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292350 (= res!153460 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292351 () Bool)

(declare-fun e!184951 () Bool)

(assert (=> b!292351 (= e!184952 e!184951)))

(declare-fun res!153459 () Bool)

(assert (=> b!292351 (=> (not res!153459) (not e!184951))))

(declare-datatypes ((SeekEntryResult!2159 0))(
  ( (MissingZero!2159 (index!10806 (_ BitVec 32))) (Found!2159 (index!10807 (_ BitVec 32))) (Intermediate!2159 (undefined!2971 Bool) (index!10808 (_ BitVec 32)) (x!29013 (_ BitVec 32))) (Undefined!2159) (MissingVacant!2159 (index!10809 (_ BitVec 32))) )
))
(declare-fun lt!144699 () SeekEntryResult!2159)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292351 (= res!153459 (or (= lt!144699 (MissingZero!2159 i!1256)) (= lt!144699 (MissingVacant!2159 i!1256))))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14776 (_ BitVec 32)) SeekEntryResult!2159)

(assert (=> b!292351 (= lt!144699 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292352 () Bool)

(assert (=> b!292352 (= e!184951 false)))

(declare-fun lt!144701 () (_ BitVec 32))

(declare-fun lt!144702 () SeekEntryResult!2159)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14776 (_ BitVec 32)) SeekEntryResult!2159)

(assert (=> b!292352 (= lt!144702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144701 k0!2524 (array!14777 (store (arr!7011 a!3312) i!1256 k0!2524) (size!7364 a!3312)) mask!3809))))

(declare-fun lt!144700 () SeekEntryResult!2159)

(assert (=> b!292352 (= lt!144700 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144701 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292352 (= lt!144701 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!153461 () Bool)

(assert (=> start!28604 (=> (not res!153461) (not e!184952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28604 (= res!153461 (validMask!0 mask!3809))))

(assert (=> start!28604 e!184952))

(assert (=> start!28604 true))

(declare-fun array_inv!4983 (array!14776) Bool)

(assert (=> start!28604 (array_inv!4983 a!3312)))

(declare-fun b!292353 () Bool)

(declare-fun res!153458 () Bool)

(assert (=> b!292353 (=> (not res!153458) (not e!184952))))

(assert (=> b!292353 (= res!153458 (and (= (size!7364 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7364 a!3312))))))

(declare-fun b!292354 () Bool)

(declare-fun res!153463 () Bool)

(assert (=> b!292354 (=> (not res!153463) (not e!184951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14776 (_ BitVec 32)) Bool)

(assert (=> b!292354 (= res!153463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292355 () Bool)

(declare-fun res!153462 () Bool)

(assert (=> b!292355 (=> (not res!153462) (not e!184952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292355 (= res!153462 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28604 res!153461) b!292353))

(assert (= (and b!292353 res!153458) b!292355))

(assert (= (and b!292355 res!153462) b!292350))

(assert (= (and b!292350 res!153460) b!292351))

(assert (= (and b!292351 res!153459) b!292354))

(assert (= (and b!292354 res!153463) b!292352))

(declare-fun m!305645 () Bool)

(assert (=> start!28604 m!305645))

(declare-fun m!305647 () Bool)

(assert (=> start!28604 m!305647))

(declare-fun m!305649 () Bool)

(assert (=> b!292350 m!305649))

(declare-fun m!305651 () Bool)

(assert (=> b!292351 m!305651))

(declare-fun m!305653 () Bool)

(assert (=> b!292352 m!305653))

(declare-fun m!305655 () Bool)

(assert (=> b!292352 m!305655))

(declare-fun m!305657 () Bool)

(assert (=> b!292352 m!305657))

(declare-fun m!305659 () Bool)

(assert (=> b!292352 m!305659))

(declare-fun m!305661 () Bool)

(assert (=> b!292354 m!305661))

(declare-fun m!305663 () Bool)

(assert (=> b!292355 m!305663))

(check-sat (not b!292352) (not b!292354) (not start!28604) (not b!292351) (not b!292350) (not b!292355))
(check-sat)
