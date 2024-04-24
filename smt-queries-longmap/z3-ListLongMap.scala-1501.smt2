; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28432 () Bool)

(assert start!28432)

(declare-fun b!291288 () Bool)

(declare-fun res!152601 () Bool)

(declare-fun e!184316 () Bool)

(assert (=> b!291288 (=> (not res!152601) (not e!184316))))

(declare-datatypes ((array!14706 0))(
  ( (array!14707 (arr!6979 (Array (_ BitVec 32) (_ BitVec 64))) (size!7331 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14706)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291288 (= res!152601 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291290 () Bool)

(declare-fun e!184312 () Bool)

(assert (=> b!291290 (= e!184316 e!184312)))

(declare-fun res!152606 () Bool)

(assert (=> b!291290 (=> (not res!152606) (not e!184312))))

(declare-fun lt!144106 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2093 0))(
  ( (MissingZero!2093 (index!10542 (_ BitVec 32))) (Found!2093 (index!10543 (_ BitVec 32))) (Intermediate!2093 (undefined!2905 Bool) (index!10544 (_ BitVec 32)) (x!28840 (_ BitVec 32))) (Undefined!2093) (MissingVacant!2093 (index!10545 (_ BitVec 32))) )
))
(declare-fun lt!144105 () SeekEntryResult!2093)

(assert (=> b!291290 (= res!152606 (or lt!144106 (= lt!144105 (MissingVacant!2093 i!1256))))))

(assert (=> b!291290 (= lt!144106 (= lt!144105 (MissingZero!2093 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14706 (_ BitVec 32)) SeekEntryResult!2093)

(assert (=> b!291290 (= lt!144105 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291291 () Bool)

(declare-fun e!184313 () Bool)

(assert (=> b!291291 (= e!184312 e!184313)))

(declare-fun res!152607 () Bool)

(assert (=> b!291291 (=> (not res!152607) (not e!184313))))

(assert (=> b!291291 (= res!152607 (and (not lt!144106) (= lt!144105 (MissingVacant!2093 i!1256))))))

(declare-fun lt!144107 () SeekEntryResult!2093)

(declare-fun lt!144108 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14706 (_ BitVec 32)) SeekEntryResult!2093)

(assert (=> b!291291 (= lt!144107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144108 k0!2524 (array!14707 (store (arr!6979 a!3312) i!1256 k0!2524) (size!7331 a!3312)) mask!3809))))

(declare-fun lt!144103 () SeekEntryResult!2093)

(assert (=> b!291291 (= lt!144103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144108 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291291 (= lt!144108 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291292 () Bool)

(declare-fun res!152600 () Bool)

(assert (=> b!291292 (=> (not res!152600) (not e!184316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291292 (= res!152600 (validKeyInArray!0 k0!2524))))

(declare-fun b!291293 () Bool)

(declare-fun e!184315 () Bool)

(assert (=> b!291293 (= e!184313 e!184315)))

(declare-fun res!152602 () Bool)

(assert (=> b!291293 (=> (not res!152602) (not e!184315))))

(declare-fun lt!144104 () Bool)

(assert (=> b!291293 (= res!152602 (and (or lt!144104 (not (undefined!2905 lt!144103))) (not lt!144104) (= (select (arr!6979 a!3312) (index!10544 lt!144103)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291293 (= lt!144104 (not ((_ is Intermediate!2093) lt!144103)))))

(declare-fun b!291294 () Bool)

(declare-fun res!152605 () Bool)

(assert (=> b!291294 (=> (not res!152605) (not e!184312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14706 (_ BitVec 32)) Bool)

(assert (=> b!291294 (= res!152605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291295 () Bool)

(declare-fun res!152603 () Bool)

(assert (=> b!291295 (=> (not res!152603) (not e!184316))))

(assert (=> b!291295 (= res!152603 (and (= (size!7331 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7331 a!3312))))))

(declare-fun res!152604 () Bool)

(assert (=> start!28432 (=> (not res!152604) (not e!184316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28432 (= res!152604 (validMask!0 mask!3809))))

(assert (=> start!28432 e!184316))

(assert (=> start!28432 true))

(declare-fun array_inv!4929 (array!14706) Bool)

(assert (=> start!28432 (array_inv!4929 a!3312)))

(declare-fun b!291289 () Bool)

(assert (=> b!291289 (= e!184315 (not true))))

(assert (=> b!291289 (= (index!10544 lt!144103) i!1256)))

(assert (= (and start!28432 res!152604) b!291295))

(assert (= (and b!291295 res!152603) b!291292))

(assert (= (and b!291292 res!152600) b!291288))

(assert (= (and b!291288 res!152601) b!291290))

(assert (= (and b!291290 res!152606) b!291294))

(assert (= (and b!291294 res!152605) b!291291))

(assert (= (and b!291291 res!152607) b!291293))

(assert (= (and b!291293 res!152602) b!291289))

(declare-fun m!305399 () Bool)

(assert (=> b!291292 m!305399))

(declare-fun m!305401 () Bool)

(assert (=> b!291291 m!305401))

(declare-fun m!305403 () Bool)

(assert (=> b!291291 m!305403))

(declare-fun m!305405 () Bool)

(assert (=> b!291291 m!305405))

(declare-fun m!305407 () Bool)

(assert (=> b!291291 m!305407))

(declare-fun m!305409 () Bool)

(assert (=> b!291288 m!305409))

(declare-fun m!305411 () Bool)

(assert (=> b!291294 m!305411))

(declare-fun m!305413 () Bool)

(assert (=> b!291290 m!305413))

(declare-fun m!305415 () Bool)

(assert (=> start!28432 m!305415))

(declare-fun m!305417 () Bool)

(assert (=> start!28432 m!305417))

(declare-fun m!305419 () Bool)

(assert (=> b!291293 m!305419))

(check-sat (not b!291294) (not b!291288) (not b!291292) (not b!291290) (not b!291291) (not start!28432))
(check-sat)
