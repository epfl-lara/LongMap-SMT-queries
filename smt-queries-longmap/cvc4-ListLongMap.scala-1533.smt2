; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29132 () Bool)

(assert start!29132)

(declare-fun b!295534 () Bool)

(declare-fun e!186796 () Bool)

(declare-fun e!186793 () Bool)

(assert (=> b!295534 (= e!186796 e!186793)))

(declare-fun res!155348 () Bool)

(assert (=> b!295534 (=> (not res!155348) (not e!186793))))

(declare-fun lt!146536 () Bool)

(declare-datatypes ((array!14935 0))(
  ( (array!14936 (arr!7078 (Array (_ BitVec 32) (_ BitVec 64))) (size!7430 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14935)

(declare-datatypes ((SeekEntryResult!2227 0))(
  ( (MissingZero!2227 (index!11078 (_ BitVec 32))) (Found!2227 (index!11079 (_ BitVec 32))) (Intermediate!2227 (undefined!3039 Bool) (index!11080 (_ BitVec 32)) (x!29295 (_ BitVec 32))) (Undefined!2227) (MissingVacant!2227 (index!11081 (_ BitVec 32))) )
))
(declare-fun lt!146540 () SeekEntryResult!2227)

(declare-fun k!2524 () (_ BitVec 64))

(assert (=> b!295534 (= res!155348 (and (or lt!146536 (not (undefined!3039 lt!146540))) (or lt!146536 (not (= (select (arr!7078 a!3312) (index!11080 lt!146540)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146536 (not (= (select (arr!7078 a!3312) (index!11080 lt!146540)) k!2524))) (not lt!146536)))))

(assert (=> b!295534 (= lt!146536 (not (is-Intermediate!2227 lt!146540)))))

(declare-fun b!295535 () Bool)

(declare-fun res!155349 () Bool)

(declare-fun e!186794 () Bool)

(assert (=> b!295535 (=> (not res!155349) (not e!186794))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!295535 (= res!155349 (and (= (size!7430 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7430 a!3312))))))

(declare-fun b!295536 () Bool)

(declare-fun e!186792 () Bool)

(assert (=> b!295536 (= e!186794 e!186792)))

(declare-fun res!155343 () Bool)

(assert (=> b!295536 (=> (not res!155343) (not e!186792))))

(declare-fun lt!146539 () SeekEntryResult!2227)

(declare-fun lt!146537 () Bool)

(assert (=> b!295536 (= res!155343 (or lt!146537 (= lt!146539 (MissingVacant!2227 i!1256))))))

(assert (=> b!295536 (= lt!146537 (= lt!146539 (MissingZero!2227 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14935 (_ BitVec 32)) SeekEntryResult!2227)

(assert (=> b!295536 (= lt!146539 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!295537 () Bool)

(declare-fun res!155344 () Bool)

(assert (=> b!295537 (=> (not res!155344) (not e!186794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295537 (= res!155344 (validKeyInArray!0 k!2524))))

(declare-fun res!155346 () Bool)

(assert (=> start!29132 (=> (not res!155346) (not e!186794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29132 (= res!155346 (validMask!0 mask!3809))))

(assert (=> start!29132 e!186794))

(assert (=> start!29132 true))

(declare-fun array_inv!5041 (array!14935) Bool)

(assert (=> start!29132 (array_inv!5041 a!3312)))

(declare-fun b!295538 () Bool)

(assert (=> b!295538 (= e!186793 (not true))))

(assert (=> b!295538 (and (= (select (arr!7078 a!3312) (index!11080 lt!146540)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11080 lt!146540) i!1256))))

(declare-fun b!295539 () Bool)

(assert (=> b!295539 (= e!186792 e!186796)))

(declare-fun res!155345 () Bool)

(assert (=> b!295539 (=> (not res!155345) (not e!186796))))

(assert (=> b!295539 (= res!155345 lt!146537)))

(declare-fun lt!146541 () SeekEntryResult!2227)

(declare-fun lt!146538 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14935 (_ BitVec 32)) SeekEntryResult!2227)

(assert (=> b!295539 (= lt!146541 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146538 k!2524 (array!14936 (store (arr!7078 a!3312) i!1256 k!2524) (size!7430 a!3312)) mask!3809))))

(assert (=> b!295539 (= lt!146540 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146538 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295539 (= lt!146538 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295540 () Bool)

(declare-fun res!155347 () Bool)

(assert (=> b!295540 (=> (not res!155347) (not e!186794))))

(declare-fun arrayContainsKey!0 (array!14935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295540 (= res!155347 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295541 () Bool)

(declare-fun res!155342 () Bool)

(assert (=> b!295541 (=> (not res!155342) (not e!186792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14935 (_ BitVec 32)) Bool)

(assert (=> b!295541 (= res!155342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29132 res!155346) b!295535))

(assert (= (and b!295535 res!155349) b!295537))

(assert (= (and b!295537 res!155344) b!295540))

(assert (= (and b!295540 res!155347) b!295536))

(assert (= (and b!295536 res!155343) b!295541))

(assert (= (and b!295541 res!155342) b!295539))

(assert (= (and b!295539 res!155345) b!295534))

(assert (= (and b!295534 res!155348) b!295538))

(declare-fun m!308633 () Bool)

(assert (=> start!29132 m!308633))

(declare-fun m!308635 () Bool)

(assert (=> start!29132 m!308635))

(declare-fun m!308637 () Bool)

(assert (=> b!295538 m!308637))

(declare-fun m!308639 () Bool)

(assert (=> b!295541 m!308639))

(declare-fun m!308641 () Bool)

(assert (=> b!295539 m!308641))

(declare-fun m!308643 () Bool)

(assert (=> b!295539 m!308643))

(declare-fun m!308645 () Bool)

(assert (=> b!295539 m!308645))

(declare-fun m!308647 () Bool)

(assert (=> b!295539 m!308647))

(declare-fun m!308649 () Bool)

(assert (=> b!295536 m!308649))

(declare-fun m!308651 () Bool)

(assert (=> b!295537 m!308651))

(declare-fun m!308653 () Bool)

(assert (=> b!295540 m!308653))

(assert (=> b!295534 m!308637))

(push 1)

