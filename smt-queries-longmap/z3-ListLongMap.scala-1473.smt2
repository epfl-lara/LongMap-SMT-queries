; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28220 () Bool)

(assert start!28220)

(declare-fun b!288898 () Bool)

(declare-fun e!182905 () Bool)

(declare-fun e!182903 () Bool)

(assert (=> b!288898 (= e!182905 e!182903)))

(declare-fun res!150574 () Bool)

(assert (=> b!288898 (=> (not res!150574) (not e!182903))))

(declare-fun lt!142354 () Bool)

(declare-datatypes ((SeekEntryResult!2039 0))(
  ( (MissingZero!2039 (index!10326 (_ BitVec 32))) (Found!2039 (index!10327 (_ BitVec 32))) (Intermediate!2039 (undefined!2851 Bool) (index!10328 (_ BitVec 32)) (x!28555 (_ BitVec 32))) (Undefined!2039) (MissingVacant!2039 (index!10329 (_ BitVec 32))) )
))
(declare-fun lt!142355 () SeekEntryResult!2039)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288898 (= res!150574 (or lt!142354 (= lt!142355 (MissingVacant!2039 i!1256))))))

(assert (=> b!288898 (= lt!142354 (= lt!142355 (MissingZero!2039 i!1256)))))

(declare-datatypes ((array!14527 0))(
  ( (array!14528 (arr!6891 (Array (_ BitVec 32) (_ BitVec 64))) (size!7244 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14527)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14527 (_ BitVec 32)) SeekEntryResult!2039)

(assert (=> b!288898 (= lt!142355 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!150575 () Bool)

(assert (=> start!28220 (=> (not res!150575) (not e!182905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28220 (= res!150575 (validMask!0 mask!3809))))

(assert (=> start!28220 e!182905))

(assert (=> start!28220 true))

(declare-fun array_inv!4863 (array!14527) Bool)

(assert (=> start!28220 (array_inv!4863 a!3312)))

(declare-fun b!288899 () Bool)

(declare-fun res!150578 () Bool)

(assert (=> b!288899 (=> (not res!150578) (not e!182905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288899 (= res!150578 (validKeyInArray!0 k0!2524))))

(declare-fun b!288900 () Bool)

(declare-fun e!182907 () Bool)

(declare-fun e!182904 () Bool)

(assert (=> b!288900 (= e!182907 e!182904)))

(declare-fun res!150580 () Bool)

(assert (=> b!288900 (=> (not res!150580) (not e!182904))))

(declare-fun lt!142357 () Bool)

(declare-fun lt!142356 () SeekEntryResult!2039)

(assert (=> b!288900 (= res!150580 (and (or lt!142357 (not (undefined!2851 lt!142356))) (or lt!142357 (not (= (select (arr!6891 a!3312) (index!10328 lt!142356)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142357 (not (= (select (arr!6891 a!3312) (index!10328 lt!142356)) k0!2524))) (not lt!142357)))))

(get-info :version)

(assert (=> b!288900 (= lt!142357 (not ((_ is Intermediate!2039) lt!142356)))))

(declare-fun b!288901 () Bool)

(assert (=> b!288901 (= e!182904 (not true))))

(assert (=> b!288901 (and (= (select (arr!6891 a!3312) (index!10328 lt!142356)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10328 lt!142356) i!1256))))

(declare-fun b!288902 () Bool)

(declare-fun res!150573 () Bool)

(assert (=> b!288902 (=> (not res!150573) (not e!182905))))

(declare-fun arrayContainsKey!0 (array!14527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288902 (= res!150573 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288903 () Bool)

(declare-fun res!150579 () Bool)

(assert (=> b!288903 (=> (not res!150579) (not e!182903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14527 (_ BitVec 32)) Bool)

(assert (=> b!288903 (= res!150579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288904 () Bool)

(declare-fun res!150577 () Bool)

(assert (=> b!288904 (=> (not res!150577) (not e!182905))))

(assert (=> b!288904 (= res!150577 (and (= (size!7244 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7244 a!3312))))))

(declare-fun b!288905 () Bool)

(assert (=> b!288905 (= e!182903 e!182907)))

(declare-fun res!150576 () Bool)

(assert (=> b!288905 (=> (not res!150576) (not e!182907))))

(assert (=> b!288905 (= res!150576 lt!142354)))

(declare-fun lt!142359 () SeekEntryResult!2039)

(declare-fun lt!142358 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14527 (_ BitVec 32)) SeekEntryResult!2039)

(assert (=> b!288905 (= lt!142359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142358 k0!2524 (array!14528 (store (arr!6891 a!3312) i!1256 k0!2524) (size!7244 a!3312)) mask!3809))))

(assert (=> b!288905 (= lt!142356 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142358 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288905 (= lt!142358 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28220 res!150575) b!288904))

(assert (= (and b!288904 res!150577) b!288899))

(assert (= (and b!288899 res!150578) b!288902))

(assert (= (and b!288902 res!150573) b!288898))

(assert (= (and b!288898 res!150574) b!288903))

(assert (= (and b!288903 res!150579) b!288905))

(assert (= (and b!288905 res!150576) b!288900))

(assert (= (and b!288900 res!150580) b!288901))

(declare-fun m!302633 () Bool)

(assert (=> b!288905 m!302633))

(declare-fun m!302635 () Bool)

(assert (=> b!288905 m!302635))

(declare-fun m!302637 () Bool)

(assert (=> b!288905 m!302637))

(declare-fun m!302639 () Bool)

(assert (=> b!288905 m!302639))

(declare-fun m!302641 () Bool)

(assert (=> b!288902 m!302641))

(declare-fun m!302643 () Bool)

(assert (=> b!288900 m!302643))

(assert (=> b!288901 m!302643))

(declare-fun m!302645 () Bool)

(assert (=> b!288899 m!302645))

(declare-fun m!302647 () Bool)

(assert (=> start!28220 m!302647))

(declare-fun m!302649 () Bool)

(assert (=> start!28220 m!302649))

(declare-fun m!302651 () Bool)

(assert (=> b!288898 m!302651))

(declare-fun m!302653 () Bool)

(assert (=> b!288903 m!302653))

(check-sat (not b!288898) (not b!288903) (not b!288902) (not start!28220) (not b!288905) (not b!288899))
(check-sat)
