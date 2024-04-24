; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28198 () Bool)

(assert start!28198)

(declare-fun b!288876 () Bool)

(declare-fun res!150475 () Bool)

(declare-fun e!182893 () Bool)

(assert (=> b!288876 (=> (not res!150475) (not e!182893))))

(declare-datatypes ((array!14517 0))(
  ( (array!14518 (arr!6886 (Array (_ BitVec 32) (_ BitVec 64))) (size!7238 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14517)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288876 (= res!150475 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288877 () Bool)

(declare-fun e!182894 () Bool)

(assert (=> b!288877 (= e!182894 (not true))))

(declare-datatypes ((SeekEntryResult!2000 0))(
  ( (MissingZero!2000 (index!10170 (_ BitVec 32))) (Found!2000 (index!10171 (_ BitVec 32))) (Intermediate!2000 (undefined!2812 Bool) (index!10172 (_ BitVec 32)) (x!28493 (_ BitVec 32))) (Undefined!2000) (MissingVacant!2000 (index!10173 (_ BitVec 32))) )
))
(declare-fun lt!142436 () SeekEntryResult!2000)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288877 (and (= (select (arr!6886 a!3312) (index!10172 lt!142436)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10172 lt!142436) i!1256))))

(declare-fun b!288878 () Bool)

(declare-fun e!182895 () Bool)

(assert (=> b!288878 (= e!182895 e!182894)))

(declare-fun res!150480 () Bool)

(assert (=> b!288878 (=> (not res!150480) (not e!182894))))

(declare-fun lt!142435 () Bool)

(assert (=> b!288878 (= res!150480 (and (or lt!142435 (not (undefined!2812 lt!142436))) (or lt!142435 (not (= (select (arr!6886 a!3312) (index!10172 lt!142436)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142435 (not (= (select (arr!6886 a!3312) (index!10172 lt!142436)) k0!2524))) (not lt!142435)))))

(get-info :version)

(assert (=> b!288878 (= lt!142435 (not ((_ is Intermediate!2000) lt!142436)))))

(declare-fun b!288879 () Bool)

(declare-fun e!182897 () Bool)

(assert (=> b!288879 (= e!182897 e!182895)))

(declare-fun res!150479 () Bool)

(assert (=> b!288879 (=> (not res!150479) (not e!182895))))

(declare-fun lt!142434 () Bool)

(assert (=> b!288879 (= res!150479 lt!142434)))

(declare-fun lt!142432 () SeekEntryResult!2000)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!142433 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14517 (_ BitVec 32)) SeekEntryResult!2000)

(assert (=> b!288879 (= lt!142432 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142433 k0!2524 (array!14518 (store (arr!6886 a!3312) i!1256 k0!2524) (size!7238 a!3312)) mask!3809))))

(assert (=> b!288879 (= lt!142436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142433 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288879 (= lt!142433 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!150478 () Bool)

(assert (=> start!28198 (=> (not res!150478) (not e!182893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28198 (= res!150478 (validMask!0 mask!3809))))

(assert (=> start!28198 e!182893))

(assert (=> start!28198 true))

(declare-fun array_inv!4836 (array!14517) Bool)

(assert (=> start!28198 (array_inv!4836 a!3312)))

(declare-fun b!288880 () Bool)

(declare-fun res!150474 () Bool)

(assert (=> b!288880 (=> (not res!150474) (not e!182897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14517 (_ BitVec 32)) Bool)

(assert (=> b!288880 (= res!150474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288881 () Bool)

(assert (=> b!288881 (= e!182893 e!182897)))

(declare-fun res!150476 () Bool)

(assert (=> b!288881 (=> (not res!150476) (not e!182897))))

(declare-fun lt!142437 () SeekEntryResult!2000)

(assert (=> b!288881 (= res!150476 (or lt!142434 (= lt!142437 (MissingVacant!2000 i!1256))))))

(assert (=> b!288881 (= lt!142434 (= lt!142437 (MissingZero!2000 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14517 (_ BitVec 32)) SeekEntryResult!2000)

(assert (=> b!288881 (= lt!142437 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288882 () Bool)

(declare-fun res!150477 () Bool)

(assert (=> b!288882 (=> (not res!150477) (not e!182893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288882 (= res!150477 (validKeyInArray!0 k0!2524))))

(declare-fun b!288883 () Bool)

(declare-fun res!150473 () Bool)

(assert (=> b!288883 (=> (not res!150473) (not e!182893))))

(assert (=> b!288883 (= res!150473 (and (= (size!7238 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7238 a!3312))))))

(assert (= (and start!28198 res!150478) b!288883))

(assert (= (and b!288883 res!150473) b!288882))

(assert (= (and b!288882 res!150477) b!288876))

(assert (= (and b!288876 res!150475) b!288881))

(assert (= (and b!288881 res!150476) b!288880))

(assert (= (and b!288880 res!150474) b!288879))

(assert (= (and b!288879 res!150479) b!288878))

(assert (= (and b!288878 res!150480) b!288877))

(declare-fun m!303233 () Bool)

(assert (=> b!288880 m!303233))

(declare-fun m!303235 () Bool)

(assert (=> b!288881 m!303235))

(declare-fun m!303237 () Bool)

(assert (=> b!288882 m!303237))

(declare-fun m!303239 () Bool)

(assert (=> b!288877 m!303239))

(declare-fun m!303241 () Bool)

(assert (=> b!288876 m!303241))

(declare-fun m!303243 () Bool)

(assert (=> start!28198 m!303243))

(declare-fun m!303245 () Bool)

(assert (=> start!28198 m!303245))

(declare-fun m!303247 () Bool)

(assert (=> b!288879 m!303247))

(declare-fun m!303249 () Bool)

(assert (=> b!288879 m!303249))

(declare-fun m!303251 () Bool)

(assert (=> b!288879 m!303251))

(declare-fun m!303253 () Bool)

(assert (=> b!288879 m!303253))

(assert (=> b!288878 m!303239))

(check-sat (not start!28198) (not b!288876) (not b!288882) (not b!288880) (not b!288879) (not b!288881))
(check-sat)
