; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28590 () Bool)

(assert start!28590)

(declare-fun b!292321 () Bool)

(declare-fun e!184960 () Bool)

(declare-fun e!184961 () Bool)

(assert (=> b!292321 (= e!184960 e!184961)))

(declare-fun res!153378 () Bool)

(assert (=> b!292321 (=> (not res!153378) (not e!184961))))

(declare-fun lt!144751 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2156 0))(
  ( (MissingZero!2156 (index!10794 (_ BitVec 32))) (Found!2156 (index!10795 (_ BitVec 32))) (Intermediate!2156 (undefined!2968 Bool) (index!10796 (_ BitVec 32)) (x!28987 (_ BitVec 32))) (Undefined!2156) (MissingVacant!2156 (index!10797 (_ BitVec 32))) )
))
(declare-fun lt!144752 () SeekEntryResult!2156)

(assert (=> b!292321 (= res!153378 (or lt!144751 (= lt!144752 (MissingVacant!2156 i!1256))))))

(assert (=> b!292321 (= lt!144751 (= lt!144752 (MissingZero!2156 i!1256)))))

(declare-datatypes ((array!14769 0))(
  ( (array!14770 (arr!7007 (Array (_ BitVec 32) (_ BitVec 64))) (size!7359 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14769)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14769 (_ BitVec 32)) SeekEntryResult!2156)

(assert (=> b!292321 (= lt!144752 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!292322 () Bool)

(declare-fun res!153377 () Bool)

(assert (=> b!292322 (=> (not res!153377) (not e!184960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292322 (= res!153377 (validKeyInArray!0 k!2524))))

(declare-fun b!292323 () Bool)

(declare-fun e!184957 () Bool)

(declare-fun e!184959 () Bool)

(assert (=> b!292323 (= e!184957 e!184959)))

(declare-fun res!153380 () Bool)

(assert (=> b!292323 (=> (not res!153380) (not e!184959))))

(declare-fun lt!144755 () Bool)

(declare-fun lt!144754 () SeekEntryResult!2156)

(assert (=> b!292323 (= res!153380 (and (or lt!144755 (not (undefined!2968 lt!144754))) (not lt!144755) (= (select (arr!7007 a!3312) (index!10796 lt!144754)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!292323 (= lt!144755 (not (is-Intermediate!2156 lt!144754)))))

(declare-fun res!153384 () Bool)

(assert (=> start!28590 (=> (not res!153384) (not e!184960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28590 (= res!153384 (validMask!0 mask!3809))))

(assert (=> start!28590 e!184960))

(assert (=> start!28590 true))

(declare-fun array_inv!4970 (array!14769) Bool)

(assert (=> start!28590 (array_inv!4970 a!3312)))

(declare-fun b!292324 () Bool)

(assert (=> b!292324 (= e!184961 e!184957)))

(declare-fun res!153381 () Bool)

(assert (=> b!292324 (=> (not res!153381) (not e!184957))))

(assert (=> b!292324 (= res!153381 (and (not lt!144751) (= lt!144752 (MissingVacant!2156 i!1256))))))

(declare-fun lt!144757 () SeekEntryResult!2156)

(declare-fun lt!144756 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14769 (_ BitVec 32)) SeekEntryResult!2156)

(assert (=> b!292324 (= lt!144757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144756 k!2524 (array!14770 (store (arr!7007 a!3312) i!1256 k!2524) (size!7359 a!3312)) mask!3809))))

(assert (=> b!292324 (= lt!144754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144756 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292324 (= lt!144756 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!292325 () Bool)

(declare-fun res!153382 () Bool)

(assert (=> b!292325 (=> (not res!153382) (not e!184961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14769 (_ BitVec 32)) Bool)

(assert (=> b!292325 (= res!153382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292326 () Bool)

(declare-fun res!153379 () Bool)

(assert (=> b!292326 (=> (not res!153379) (not e!184960))))

(declare-fun arrayContainsKey!0 (array!14769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292326 (= res!153379 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292327 () Bool)

(declare-fun res!153383 () Bool)

(assert (=> b!292327 (=> (not res!153383) (not e!184960))))

(assert (=> b!292327 (= res!153383 (and (= (size!7359 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7359 a!3312))))))

(declare-fun b!292328 () Bool)

(assert (=> b!292328 (= e!184959 (not true))))

(declare-datatypes ((Unit!9174 0))(
  ( (Unit!9175) )
))
(declare-fun lt!144753 () Unit!9174)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9174)

(assert (=> b!292328 (= lt!144753 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!144756 (index!10796 lt!144754) (x!28987 lt!144754) mask!3809))))

(assert (=> b!292328 (= (index!10796 lt!144754) i!1256)))

(assert (= (and start!28590 res!153384) b!292327))

(assert (= (and b!292327 res!153383) b!292322))

(assert (= (and b!292322 res!153377) b!292326))

(assert (= (and b!292326 res!153379) b!292321))

(assert (= (and b!292321 res!153378) b!292325))

(assert (= (and b!292325 res!153382) b!292324))

(assert (= (and b!292324 res!153381) b!292323))

(assert (= (and b!292323 res!153380) b!292328))

(declare-fun m!306045 () Bool)

(assert (=> b!292326 m!306045))

(declare-fun m!306047 () Bool)

(assert (=> b!292325 m!306047))

(declare-fun m!306049 () Bool)

(assert (=> b!292328 m!306049))

(declare-fun m!306051 () Bool)

(assert (=> b!292321 m!306051))

(declare-fun m!306053 () Bool)

(assert (=> b!292324 m!306053))

(declare-fun m!306055 () Bool)

(assert (=> b!292324 m!306055))

(declare-fun m!306057 () Bool)

(assert (=> b!292324 m!306057))

(declare-fun m!306059 () Bool)

(assert (=> b!292324 m!306059))

(declare-fun m!306061 () Bool)

(assert (=> b!292322 m!306061))

(declare-fun m!306063 () Bool)

(assert (=> start!28590 m!306063))

(declare-fun m!306065 () Bool)

(assert (=> start!28590 m!306065))

(declare-fun m!306067 () Bool)

(assert (=> b!292323 m!306067))

(push 1)

