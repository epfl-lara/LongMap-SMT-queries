; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28568 () Bool)

(assert start!28568)

(declare-fun b!291958 () Bool)

(declare-fun e!184725 () Bool)

(declare-fun e!184721 () Bool)

(assert (=> b!291958 (= e!184725 e!184721)))

(declare-fun res!153073 () Bool)

(assert (=> b!291958 (=> (not res!153073) (not e!184721))))

(declare-fun lt!144385 () Bool)

(declare-datatypes ((array!14740 0))(
  ( (array!14741 (arr!6993 (Array (_ BitVec 32) (_ BitVec 64))) (size!7346 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14740)

(declare-datatypes ((SeekEntryResult!2141 0))(
  ( (MissingZero!2141 (index!10734 (_ BitVec 32))) (Found!2141 (index!10735 (_ BitVec 32))) (Intermediate!2141 (undefined!2953 Bool) (index!10736 (_ BitVec 32)) (x!28947 (_ BitVec 32))) (Undefined!2141) (MissingVacant!2141 (index!10737 (_ BitVec 32))) )
))
(declare-fun lt!144383 () SeekEntryResult!2141)

(assert (=> b!291958 (= res!153073 (and (or lt!144385 (not (undefined!2953 lt!144383))) (not lt!144385) (= (select (arr!6993 a!3312) (index!10736 lt!144383)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291958 (= lt!144385 (not ((_ is Intermediate!2141) lt!144383)))))

(declare-fun b!291959 () Bool)

(declare-fun res!153067 () Bool)

(declare-fun e!184723 () Bool)

(assert (=> b!291959 (=> (not res!153067) (not e!184723))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!291959 (= res!153067 (and (= (size!7346 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7346 a!3312))))))

(declare-fun res!153069 () Bool)

(assert (=> start!28568 (=> (not res!153069) (not e!184723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28568 (= res!153069 (validMask!0 mask!3809))))

(assert (=> start!28568 e!184723))

(assert (=> start!28568 true))

(declare-fun array_inv!4965 (array!14740) Bool)

(assert (=> start!28568 (array_inv!4965 a!3312)))

(declare-fun b!291960 () Bool)

(declare-fun res!153072 () Bool)

(assert (=> b!291960 (=> (not res!153072) (not e!184723))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291960 (= res!153072 (validKeyInArray!0 k0!2524))))

(declare-fun b!291961 () Bool)

(declare-fun e!184724 () Bool)

(assert (=> b!291961 (= e!184724 e!184725)))

(declare-fun res!153068 () Bool)

(assert (=> b!291961 (=> (not res!153068) (not e!184725))))

(declare-fun lt!144381 () Bool)

(declare-fun lt!144387 () SeekEntryResult!2141)

(assert (=> b!291961 (= res!153068 (and (not lt!144381) (= lt!144387 (MissingVacant!2141 i!1256))))))

(declare-fun lt!144384 () (_ BitVec 32))

(declare-fun lt!144386 () SeekEntryResult!2141)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14740 (_ BitVec 32)) SeekEntryResult!2141)

(assert (=> b!291961 (= lt!144386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144384 k0!2524 (array!14741 (store (arr!6993 a!3312) i!1256 k0!2524) (size!7346 a!3312)) mask!3809))))

(assert (=> b!291961 (= lt!144383 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144384 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291961 (= lt!144384 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291962 () Bool)

(assert (=> b!291962 (= e!184723 e!184724)))

(declare-fun res!153071 () Bool)

(assert (=> b!291962 (=> (not res!153071) (not e!184724))))

(assert (=> b!291962 (= res!153071 (or lt!144381 (= lt!144387 (MissingVacant!2141 i!1256))))))

(assert (=> b!291962 (= lt!144381 (= lt!144387 (MissingZero!2141 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14740 (_ BitVec 32)) SeekEntryResult!2141)

(assert (=> b!291962 (= lt!144387 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291963 () Bool)

(declare-fun res!153070 () Bool)

(assert (=> b!291963 (=> (not res!153070) (not e!184724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14740 (_ BitVec 32)) Bool)

(assert (=> b!291963 (= res!153070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291964 () Bool)

(declare-fun res!153066 () Bool)

(assert (=> b!291964 (=> (not res!153066) (not e!184723))))

(declare-fun arrayContainsKey!0 (array!14740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291964 (= res!153066 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291965 () Bool)

(assert (=> b!291965 (= e!184721 (not true))))

(declare-datatypes ((Unit!9106 0))(
  ( (Unit!9107) )
))
(declare-fun lt!144382 () Unit!9106)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14740 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9106)

(assert (=> b!291965 (= lt!144382 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!144384 (index!10736 lt!144383) (x!28947 lt!144383) mask!3809))))

(assert (=> b!291965 (= (index!10736 lt!144383) i!1256)))

(assert (= (and start!28568 res!153069) b!291959))

(assert (= (and b!291959 res!153067) b!291960))

(assert (= (and b!291960 res!153072) b!291964))

(assert (= (and b!291964 res!153066) b!291962))

(assert (= (and b!291962 res!153071) b!291963))

(assert (= (and b!291963 res!153070) b!291961))

(assert (= (and b!291961 res!153068) b!291958))

(assert (= (and b!291958 res!153073) b!291965))

(declare-fun m!305237 () Bool)

(assert (=> b!291958 m!305237))

(declare-fun m!305239 () Bool)

(assert (=> b!291965 m!305239))

(declare-fun m!305241 () Bool)

(assert (=> start!28568 m!305241))

(declare-fun m!305243 () Bool)

(assert (=> start!28568 m!305243))

(declare-fun m!305245 () Bool)

(assert (=> b!291960 m!305245))

(declare-fun m!305247 () Bool)

(assert (=> b!291963 m!305247))

(declare-fun m!305249 () Bool)

(assert (=> b!291964 m!305249))

(declare-fun m!305251 () Bool)

(assert (=> b!291962 m!305251))

(declare-fun m!305253 () Bool)

(assert (=> b!291961 m!305253))

(declare-fun m!305255 () Bool)

(assert (=> b!291961 m!305255))

(declare-fun m!305257 () Bool)

(assert (=> b!291961 m!305257))

(declare-fun m!305259 () Bool)

(assert (=> b!291961 m!305259))

(check-sat (not b!291963) (not b!291964) (not b!291960) (not b!291965) (not start!28568) (not b!291961) (not b!291962))
(check-sat)
