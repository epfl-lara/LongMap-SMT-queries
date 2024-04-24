; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28090 () Bool)

(assert start!28090)

(declare-fun b!287954 () Bool)

(declare-fun e!182327 () Bool)

(declare-fun e!182325 () Bool)

(assert (=> b!287954 (= e!182327 e!182325)))

(declare-fun res!149695 () Bool)

(assert (=> b!287954 (=> (not res!149695) (not e!182325))))

(declare-datatypes ((SeekEntryResult!1970 0))(
  ( (MissingZero!1970 (index!10050 (_ BitVec 32))) (Found!1970 (index!10051 (_ BitVec 32))) (Intermediate!1970 (undefined!2782 Bool) (index!10052 (_ BitVec 32)) (x!28377 (_ BitVec 32))) (Undefined!1970) (MissingVacant!1970 (index!10053 (_ BitVec 32))) )
))
(declare-fun lt!141811 () SeekEntryResult!1970)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287954 (= res!149695 (or (= lt!141811 (MissingZero!1970 i!1256)) (= lt!141811 (MissingVacant!1970 i!1256))))))

(declare-datatypes ((array!14454 0))(
  ( (array!14455 (arr!6856 (Array (_ BitVec 32) (_ BitVec 64))) (size!7208 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14454)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14454 (_ BitVec 32)) SeekEntryResult!1970)

(assert (=> b!287954 (= lt!141811 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287955 () Bool)

(declare-fun res!149694 () Bool)

(assert (=> b!287955 (=> (not res!149694) (not e!182327))))

(declare-fun arrayContainsKey!0 (array!14454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287955 (= res!149694 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287956 () Bool)

(assert (=> b!287956 (= e!182325 false)))

(declare-fun lt!141812 () SeekEntryResult!1970)

(declare-fun lt!141810 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14454 (_ BitVec 32)) SeekEntryResult!1970)

(assert (=> b!287956 (= lt!141812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141810 k0!2524 (array!14455 (store (arr!6856 a!3312) i!1256 k0!2524) (size!7208 a!3312)) mask!3809))))

(declare-fun lt!141813 () SeekEntryResult!1970)

(assert (=> b!287956 (= lt!141813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141810 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287956 (= lt!141810 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!149697 () Bool)

(assert (=> start!28090 (=> (not res!149697) (not e!182327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28090 (= res!149697 (validMask!0 mask!3809))))

(assert (=> start!28090 e!182327))

(assert (=> start!28090 true))

(declare-fun array_inv!4806 (array!14454) Bool)

(assert (=> start!28090 (array_inv!4806 a!3312)))

(declare-fun b!287957 () Bool)

(declare-fun res!149692 () Bool)

(assert (=> b!287957 (=> (not res!149692) (not e!182325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14454 (_ BitVec 32)) Bool)

(assert (=> b!287957 (= res!149692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287958 () Bool)

(declare-fun res!149696 () Bool)

(assert (=> b!287958 (=> (not res!149696) (not e!182327))))

(assert (=> b!287958 (= res!149696 (and (= (size!7208 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7208 a!3312))))))

(declare-fun b!287959 () Bool)

(declare-fun res!149693 () Bool)

(assert (=> b!287959 (=> (not res!149693) (not e!182327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287959 (= res!149693 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28090 res!149697) b!287958))

(assert (= (and b!287958 res!149696) b!287959))

(assert (= (and b!287959 res!149693) b!287955))

(assert (= (and b!287955 res!149694) b!287954))

(assert (= (and b!287954 res!149695) b!287957))

(assert (= (and b!287957 res!149692) b!287956))

(declare-fun m!302459 () Bool)

(assert (=> b!287955 m!302459))

(declare-fun m!302461 () Bool)

(assert (=> b!287954 m!302461))

(declare-fun m!302463 () Bool)

(assert (=> start!28090 m!302463))

(declare-fun m!302465 () Bool)

(assert (=> start!28090 m!302465))

(declare-fun m!302467 () Bool)

(assert (=> b!287957 m!302467))

(declare-fun m!302469 () Bool)

(assert (=> b!287959 m!302469))

(declare-fun m!302471 () Bool)

(assert (=> b!287956 m!302471))

(declare-fun m!302473 () Bool)

(assert (=> b!287956 m!302473))

(declare-fun m!302475 () Bool)

(assert (=> b!287956 m!302475))

(declare-fun m!302477 () Bool)

(assert (=> b!287956 m!302477))

(check-sat (not b!287954) (not b!287959) (not b!287955) (not b!287956) (not b!287957) (not start!28090))
(check-sat)
