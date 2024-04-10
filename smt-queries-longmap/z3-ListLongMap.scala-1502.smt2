; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28448 () Bool)

(assert start!28448)

(declare-fun b!291337 () Bool)

(declare-fun e!184351 () Bool)

(assert (=> b!291337 (= e!184351 (not true))))

(declare-datatypes ((SeekEntryResult!2133 0))(
  ( (MissingZero!2133 (index!10702 (_ BitVec 32))) (Found!2133 (index!10703 (_ BitVec 32))) (Intermediate!2133 (undefined!2945 Bool) (index!10704 (_ BitVec 32)) (x!28888 (_ BitVec 32))) (Undefined!2133) (MissingVacant!2133 (index!10705 (_ BitVec 32))) )
))
(declare-fun lt!144120 () SeekEntryResult!2133)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291337 (= (index!10704 lt!144120) i!1256)))

(declare-fun b!291338 () Bool)

(declare-fun e!184349 () Bool)

(declare-fun e!184352 () Bool)

(assert (=> b!291338 (= e!184349 e!184352)))

(declare-fun res!152680 () Bool)

(assert (=> b!291338 (=> (not res!152680) (not e!184352))))

(declare-fun lt!144116 () Bool)

(declare-fun lt!144121 () SeekEntryResult!2133)

(assert (=> b!291338 (= res!152680 (and (not lt!144116) (= lt!144121 (MissingVacant!2133 i!1256))))))

(declare-fun lt!144119 () (_ BitVec 32))

(declare-datatypes ((array!14717 0))(
  ( (array!14718 (arr!6984 (Array (_ BitVec 32) (_ BitVec 64))) (size!7336 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14717)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!144118 () SeekEntryResult!2133)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14717 (_ BitVec 32)) SeekEntryResult!2133)

(assert (=> b!291338 (= lt!144118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144119 k0!2524 (array!14718 (store (arr!6984 a!3312) i!1256 k0!2524) (size!7336 a!3312)) mask!3809))))

(assert (=> b!291338 (= lt!144120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144119 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291338 (= lt!144119 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!152679 () Bool)

(declare-fun e!184348 () Bool)

(assert (=> start!28448 (=> (not res!152679) (not e!184348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28448 (= res!152679 (validMask!0 mask!3809))))

(assert (=> start!28448 e!184348))

(assert (=> start!28448 true))

(declare-fun array_inv!4947 (array!14717) Bool)

(assert (=> start!28448 (array_inv!4947 a!3312)))

(declare-fun b!291339 () Bool)

(declare-fun res!152682 () Bool)

(assert (=> b!291339 (=> (not res!152682) (not e!184348))))

(assert (=> b!291339 (= res!152682 (and (= (size!7336 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7336 a!3312))))))

(declare-fun b!291340 () Bool)

(assert (=> b!291340 (= e!184348 e!184349)))

(declare-fun res!152675 () Bool)

(assert (=> b!291340 (=> (not res!152675) (not e!184349))))

(assert (=> b!291340 (= res!152675 (or lt!144116 (= lt!144121 (MissingVacant!2133 i!1256))))))

(assert (=> b!291340 (= lt!144116 (= lt!144121 (MissingZero!2133 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14717 (_ BitVec 32)) SeekEntryResult!2133)

(assert (=> b!291340 (= lt!144121 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291341 () Bool)

(declare-fun res!152677 () Bool)

(assert (=> b!291341 (=> (not res!152677) (not e!184348))))

(declare-fun arrayContainsKey!0 (array!14717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291341 (= res!152677 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291342 () Bool)

(declare-fun res!152681 () Bool)

(assert (=> b!291342 (=> (not res!152681) (not e!184348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291342 (= res!152681 (validKeyInArray!0 k0!2524))))

(declare-fun b!291343 () Bool)

(assert (=> b!291343 (= e!184352 e!184351)))

(declare-fun res!152678 () Bool)

(assert (=> b!291343 (=> (not res!152678) (not e!184351))))

(declare-fun lt!144117 () Bool)

(assert (=> b!291343 (= res!152678 (and (or lt!144117 (not (undefined!2945 lt!144120))) (not lt!144117) (= (select (arr!6984 a!3312) (index!10704 lt!144120)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291343 (= lt!144117 (not ((_ is Intermediate!2133) lt!144120)))))

(declare-fun b!291344 () Bool)

(declare-fun res!152676 () Bool)

(assert (=> b!291344 (=> (not res!152676) (not e!184349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14717 (_ BitVec 32)) Bool)

(assert (=> b!291344 (= res!152676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28448 res!152679) b!291339))

(assert (= (and b!291339 res!152682) b!291342))

(assert (= (and b!291342 res!152681) b!291341))

(assert (= (and b!291341 res!152677) b!291340))

(assert (= (and b!291340 res!152675) b!291344))

(assert (= (and b!291344 res!152676) b!291338))

(assert (= (and b!291338 res!152680) b!291343))

(assert (= (and b!291343 res!152678) b!291337))

(declare-fun m!305281 () Bool)

(assert (=> b!291341 m!305281))

(declare-fun m!305283 () Bool)

(assert (=> b!291338 m!305283))

(declare-fun m!305285 () Bool)

(assert (=> b!291338 m!305285))

(declare-fun m!305287 () Bool)

(assert (=> b!291338 m!305287))

(declare-fun m!305289 () Bool)

(assert (=> b!291338 m!305289))

(declare-fun m!305291 () Bool)

(assert (=> b!291343 m!305291))

(declare-fun m!305293 () Bool)

(assert (=> start!28448 m!305293))

(declare-fun m!305295 () Bool)

(assert (=> start!28448 m!305295))

(declare-fun m!305297 () Bool)

(assert (=> b!291344 m!305297))

(declare-fun m!305299 () Bool)

(assert (=> b!291342 m!305299))

(declare-fun m!305301 () Bool)

(assert (=> b!291340 m!305301))

(check-sat (not b!291340) (not b!291342) (not b!291338) (not start!28448) (not b!291341) (not b!291344))
(check-sat)
