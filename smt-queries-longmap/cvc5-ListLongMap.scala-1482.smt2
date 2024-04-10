; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28278 () Bool)

(assert start!28278)

(declare-fun res!151279 () Bool)

(declare-fun e!183441 () Bool)

(assert (=> start!28278 (=> (not res!151279) (not e!183441))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28278 (= res!151279 (validMask!0 mask!3809))))

(assert (=> start!28278 e!183441))

(assert (=> start!28278 true))

(declare-datatypes ((array!14592 0))(
  ( (array!14593 (arr!6923 (Array (_ BitVec 32) (_ BitVec 64))) (size!7275 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14592)

(declare-fun array_inv!4886 (array!14592) Bool)

(assert (=> start!28278 (array_inv!4886 a!3312)))

(declare-fun b!289797 () Bool)

(declare-fun res!151280 () Bool)

(assert (=> b!289797 (=> (not res!151280) (not e!183441))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289797 (= res!151280 (and (= (size!7275 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7275 a!3312))))))

(declare-fun b!289798 () Bool)

(declare-fun res!151276 () Bool)

(assert (=> b!289798 (=> (not res!151276) (not e!183441))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289798 (= res!151276 (validKeyInArray!0 k!2524))))

(declare-fun b!289799 () Bool)

(declare-fun res!151278 () Bool)

(declare-fun e!183443 () Bool)

(assert (=> b!289799 (=> (not res!151278) (not e!183443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14592 (_ BitVec 32)) Bool)

(assert (=> b!289799 (= res!151278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289800 () Bool)

(declare-fun res!151277 () Bool)

(assert (=> b!289800 (=> (not res!151277) (not e!183441))))

(declare-fun arrayContainsKey!0 (array!14592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289800 (= res!151277 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289801 () Bool)

(assert (=> b!289801 (= e!183441 e!183443)))

(declare-fun res!151281 () Bool)

(assert (=> b!289801 (=> (not res!151281) (not e!183443))))

(declare-datatypes ((SeekEntryResult!2072 0))(
  ( (MissingZero!2072 (index!10458 (_ BitVec 32))) (Found!2072 (index!10459 (_ BitVec 32))) (Intermediate!2072 (undefined!2884 Bool) (index!10460 (_ BitVec 32)) (x!28661 (_ BitVec 32))) (Undefined!2072) (MissingVacant!2072 (index!10461 (_ BitVec 32))) )
))
(declare-fun lt!143056 () SeekEntryResult!2072)

(assert (=> b!289801 (= res!151281 (or (= lt!143056 (MissingZero!2072 i!1256)) (= lt!143056 (MissingVacant!2072 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14592 (_ BitVec 32)) SeekEntryResult!2072)

(assert (=> b!289801 (= lt!143056 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289802 () Bool)

(assert (=> b!289802 (= e!183443 false)))

(declare-fun lt!143055 () (_ BitVec 32))

(declare-fun lt!143054 () SeekEntryResult!2072)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14592 (_ BitVec 32)) SeekEntryResult!2072)

(assert (=> b!289802 (= lt!143054 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143055 k!2524 (array!14593 (store (arr!6923 a!3312) i!1256 k!2524) (size!7275 a!3312)) mask!3809))))

(declare-fun lt!143053 () SeekEntryResult!2072)

(assert (=> b!289802 (= lt!143053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143055 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289802 (= lt!143055 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28278 res!151279) b!289797))

(assert (= (and b!289797 res!151280) b!289798))

(assert (= (and b!289798 res!151276) b!289800))

(assert (= (and b!289800 res!151277) b!289801))

(assert (= (and b!289801 res!151281) b!289799))

(assert (= (and b!289799 res!151278) b!289802))

(declare-fun m!303867 () Bool)

(assert (=> b!289798 m!303867))

(declare-fun m!303869 () Bool)

(assert (=> start!28278 m!303869))

(declare-fun m!303871 () Bool)

(assert (=> start!28278 m!303871))

(declare-fun m!303873 () Bool)

(assert (=> b!289802 m!303873))

(declare-fun m!303875 () Bool)

(assert (=> b!289802 m!303875))

(declare-fun m!303877 () Bool)

(assert (=> b!289802 m!303877))

(declare-fun m!303879 () Bool)

(assert (=> b!289802 m!303879))

(declare-fun m!303881 () Bool)

(assert (=> b!289799 m!303881))

(declare-fun m!303883 () Bool)

(assert (=> b!289800 m!303883))

(declare-fun m!303885 () Bool)

(assert (=> b!289801 m!303885))

(push 1)

