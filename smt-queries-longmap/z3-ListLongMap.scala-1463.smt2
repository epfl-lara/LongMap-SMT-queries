; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28156 () Bool)

(assert start!28156)

(declare-fun b!288372 () Bool)

(declare-fun e!182580 () Bool)

(declare-fun e!182578 () Bool)

(assert (=> b!288372 (= e!182580 e!182578)))

(declare-fun res!149973 () Bool)

(assert (=> b!288372 (=> (not res!149973) (not e!182578))))

(declare-datatypes ((SeekEntryResult!1979 0))(
  ( (MissingZero!1979 (index!10086 (_ BitVec 32))) (Found!1979 (index!10087 (_ BitVec 32))) (Intermediate!1979 (undefined!2791 Bool) (index!10088 (_ BitVec 32)) (x!28416 (_ BitVec 32))) (Undefined!1979) (MissingVacant!1979 (index!10089 (_ BitVec 32))) )
))
(declare-fun lt!142058 () SeekEntryResult!1979)

(declare-fun lt!142055 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288372 (= res!149973 (or lt!142055 (= lt!142058 (MissingVacant!1979 i!1256))))))

(assert (=> b!288372 (= lt!142055 (= lt!142058 (MissingZero!1979 i!1256)))))

(declare-datatypes ((array!14475 0))(
  ( (array!14476 (arr!6865 (Array (_ BitVec 32) (_ BitVec 64))) (size!7217 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14475)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14475 (_ BitVec 32)) SeekEntryResult!1979)

(assert (=> b!288372 (= lt!142058 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288373 () Bool)

(declare-fun e!182579 () Bool)

(assert (=> b!288373 (= e!182578 e!182579)))

(declare-fun res!149971 () Bool)

(assert (=> b!288373 (=> (not res!149971) (not e!182579))))

(assert (=> b!288373 (= res!149971 lt!142055)))

(declare-fun lt!142054 () (_ BitVec 32))

(declare-fun lt!142057 () SeekEntryResult!1979)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14475 (_ BitVec 32)) SeekEntryResult!1979)

(assert (=> b!288373 (= lt!142057 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142054 k0!2524 (array!14476 (store (arr!6865 a!3312) i!1256 k0!2524) (size!7217 a!3312)) mask!3809))))

(declare-fun lt!142059 () SeekEntryResult!1979)

(assert (=> b!288373 (= lt!142059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142054 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288373 (= lt!142054 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288374 () Bool)

(declare-fun e!182581 () Bool)

(assert (=> b!288374 (= e!182581 (not true))))

(assert (=> b!288374 (and (= (select (arr!6865 a!3312) (index!10088 lt!142059)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10088 lt!142059) i!1256))))

(declare-fun b!288375 () Bool)

(declare-fun res!149969 () Bool)

(assert (=> b!288375 (=> (not res!149969) (not e!182578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14475 (_ BitVec 32)) Bool)

(assert (=> b!288375 (= res!149969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288377 () Bool)

(declare-fun res!149976 () Bool)

(assert (=> b!288377 (=> (not res!149976) (not e!182580))))

(assert (=> b!288377 (= res!149976 (and (= (size!7217 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7217 a!3312))))))

(declare-fun b!288378 () Bool)

(declare-fun res!149970 () Bool)

(assert (=> b!288378 (=> (not res!149970) (not e!182580))))

(declare-fun arrayContainsKey!0 (array!14475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288378 (= res!149970 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288379 () Bool)

(assert (=> b!288379 (= e!182579 e!182581)))

(declare-fun res!149975 () Bool)

(assert (=> b!288379 (=> (not res!149975) (not e!182581))))

(declare-fun lt!142056 () Bool)

(assert (=> b!288379 (= res!149975 (and (or lt!142056 (not (undefined!2791 lt!142059))) (or lt!142056 (not (= (select (arr!6865 a!3312) (index!10088 lt!142059)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142056 (not (= (select (arr!6865 a!3312) (index!10088 lt!142059)) k0!2524))) (not lt!142056)))))

(get-info :version)

(assert (=> b!288379 (= lt!142056 (not ((_ is Intermediate!1979) lt!142059)))))

(declare-fun b!288376 () Bool)

(declare-fun res!149974 () Bool)

(assert (=> b!288376 (=> (not res!149974) (not e!182580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288376 (= res!149974 (validKeyInArray!0 k0!2524))))

(declare-fun res!149972 () Bool)

(assert (=> start!28156 (=> (not res!149972) (not e!182580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28156 (= res!149972 (validMask!0 mask!3809))))

(assert (=> start!28156 e!182580))

(assert (=> start!28156 true))

(declare-fun array_inv!4815 (array!14475) Bool)

(assert (=> start!28156 (array_inv!4815 a!3312)))

(assert (= (and start!28156 res!149972) b!288377))

(assert (= (and b!288377 res!149976) b!288376))

(assert (= (and b!288376 res!149974) b!288378))

(assert (= (and b!288378 res!149970) b!288372))

(assert (= (and b!288372 res!149973) b!288375))

(assert (= (and b!288375 res!149969) b!288373))

(assert (= (and b!288373 res!149971) b!288379))

(assert (= (and b!288379 res!149975) b!288374))

(declare-fun m!302771 () Bool)

(assert (=> b!288372 m!302771))

(declare-fun m!302773 () Bool)

(assert (=> b!288376 m!302773))

(declare-fun m!302775 () Bool)

(assert (=> b!288379 m!302775))

(assert (=> b!288374 m!302775))

(declare-fun m!302777 () Bool)

(assert (=> b!288378 m!302777))

(declare-fun m!302779 () Bool)

(assert (=> b!288373 m!302779))

(declare-fun m!302781 () Bool)

(assert (=> b!288373 m!302781))

(declare-fun m!302783 () Bool)

(assert (=> b!288373 m!302783))

(declare-fun m!302785 () Bool)

(assert (=> b!288373 m!302785))

(declare-fun m!302787 () Bool)

(assert (=> start!28156 m!302787))

(declare-fun m!302789 () Bool)

(assert (=> start!28156 m!302789))

(declare-fun m!302791 () Bool)

(assert (=> b!288375 m!302791))

(check-sat (not b!288376) (not b!288378) (not b!288372) (not start!28156) (not b!288375) (not b!288373))
(check-sat)
