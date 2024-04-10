; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28176 () Bool)

(assert start!28176)

(declare-fun b!288469 () Bool)

(declare-fun e!182648 () Bool)

(declare-fun e!182644 () Bool)

(assert (=> b!288469 (= e!182648 e!182644)))

(declare-fun res!150093 () Bool)

(assert (=> b!288469 (=> (not res!150093) (not e!182644))))

(declare-fun lt!142106 () Bool)

(declare-datatypes ((SeekEntryResult!2021 0))(
  ( (MissingZero!2021 (index!10254 (_ BitVec 32))) (Found!2021 (index!10255 (_ BitVec 32))) (Intermediate!2021 (undefined!2833 Bool) (index!10256 (_ BitVec 32)) (x!28474 (_ BitVec 32))) (Undefined!2021) (MissingVacant!2021 (index!10257 (_ BitVec 32))) )
))
(declare-fun lt!142104 () SeekEntryResult!2021)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288469 (= res!150093 (or lt!142106 (= lt!142104 (MissingVacant!2021 i!1256))))))

(assert (=> b!288469 (= lt!142106 (= lt!142104 (MissingZero!2021 i!1256)))))

(declare-datatypes ((array!14490 0))(
  ( (array!14491 (arr!6872 (Array (_ BitVec 32) (_ BitVec 64))) (size!7224 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14490)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14490 (_ BitVec 32)) SeekEntryResult!2021)

(assert (=> b!288469 (= lt!142104 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288470 () Bool)

(declare-fun res!150095 () Bool)

(assert (=> b!288470 (=> (not res!150095) (not e!182648))))

(declare-fun arrayContainsKey!0 (array!14490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288470 (= res!150095 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288471 () Bool)

(declare-fun e!182647 () Bool)

(declare-fun e!182645 () Bool)

(assert (=> b!288471 (= e!182647 e!182645)))

(declare-fun res!150092 () Bool)

(assert (=> b!288471 (=> (not res!150092) (not e!182645))))

(declare-fun lt!142107 () SeekEntryResult!2021)

(declare-fun lt!142103 () Bool)

(assert (=> b!288471 (= res!150092 (and (or lt!142103 (not (undefined!2833 lt!142107))) (or lt!142103 (not (= (select (arr!6872 a!3312) (index!10256 lt!142107)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142103 (not (= (select (arr!6872 a!3312) (index!10256 lt!142107)) k!2524))) (not lt!142103)))))

(assert (=> b!288471 (= lt!142103 (not (is-Intermediate!2021 lt!142107)))))

(declare-fun b!288472 () Bool)

(assert (=> b!288472 (= e!182644 e!182647)))

(declare-fun res!150096 () Bool)

(assert (=> b!288472 (=> (not res!150096) (not e!182647))))

(assert (=> b!288472 (= res!150096 lt!142106)))

(declare-fun lt!142105 () (_ BitVec 32))

(declare-fun lt!142108 () SeekEntryResult!2021)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14490 (_ BitVec 32)) SeekEntryResult!2021)

(assert (=> b!288472 (= lt!142108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142105 k!2524 (array!14491 (store (arr!6872 a!3312) i!1256 k!2524) (size!7224 a!3312)) mask!3809))))

(assert (=> b!288472 (= lt!142107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142105 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288472 (= lt!142105 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288474 () Bool)

(assert (=> b!288474 (= e!182645 (not true))))

(assert (=> b!288474 (and (= (select (arr!6872 a!3312) (index!10256 lt!142107)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10256 lt!142107) i!1256))))

(declare-fun b!288475 () Bool)

(declare-fun res!150098 () Bool)

(assert (=> b!288475 (=> (not res!150098) (not e!182648))))

(assert (=> b!288475 (= res!150098 (and (= (size!7224 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7224 a!3312))))))

(declare-fun b!288476 () Bool)

(declare-fun res!150099 () Bool)

(assert (=> b!288476 (=> (not res!150099) (not e!182644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14490 (_ BitVec 32)) Bool)

(assert (=> b!288476 (= res!150099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288473 () Bool)

(declare-fun res!150094 () Bool)

(assert (=> b!288473 (=> (not res!150094) (not e!182648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288473 (= res!150094 (validKeyInArray!0 k!2524))))

(declare-fun res!150097 () Bool)

(assert (=> start!28176 (=> (not res!150097) (not e!182648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28176 (= res!150097 (validMask!0 mask!3809))))

(assert (=> start!28176 e!182648))

(assert (=> start!28176 true))

(declare-fun array_inv!4835 (array!14490) Bool)

(assert (=> start!28176 (array_inv!4835 a!3312)))

(assert (= (and start!28176 res!150097) b!288475))

(assert (= (and b!288475 res!150098) b!288473))

(assert (= (and b!288473 res!150094) b!288470))

(assert (= (and b!288470 res!150095) b!288469))

(assert (= (and b!288469 res!150093) b!288476))

(assert (= (and b!288476 res!150099) b!288472))

(assert (= (and b!288472 res!150096) b!288471))

(assert (= (and b!288471 res!150092) b!288474))

(declare-fun m!302697 () Bool)

(assert (=> b!288469 m!302697))

(declare-fun m!302699 () Bool)

(assert (=> b!288474 m!302699))

(declare-fun m!302701 () Bool)

(assert (=> start!28176 m!302701))

(declare-fun m!302703 () Bool)

(assert (=> start!28176 m!302703))

(assert (=> b!288471 m!302699))

(declare-fun m!302705 () Bool)

(assert (=> b!288473 m!302705))

(declare-fun m!302707 () Bool)

(assert (=> b!288470 m!302707))

(declare-fun m!302709 () Bool)

(assert (=> b!288472 m!302709))

(declare-fun m!302711 () Bool)

(assert (=> b!288472 m!302711))

(declare-fun m!302713 () Bool)

(assert (=> b!288472 m!302713))

(declare-fun m!302715 () Bool)

(assert (=> b!288472 m!302715))

(declare-fun m!302717 () Bool)

(assert (=> b!288476 m!302717))

(push 1)

