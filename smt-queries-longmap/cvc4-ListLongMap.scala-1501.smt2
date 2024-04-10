; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28444 () Bool)

(assert start!28444)

(declare-fun b!291289 () Bool)

(declare-fun res!152631 () Bool)

(declare-fun e!184319 () Bool)

(assert (=> b!291289 (=> (not res!152631) (not e!184319))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14713 0))(
  ( (array!14714 (arr!6982 (Array (_ BitVec 32) (_ BitVec 64))) (size!7334 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14713)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!291289 (= res!152631 (and (= (size!7334 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7334 a!3312))))))

(declare-fun b!291290 () Bool)

(declare-fun e!184320 () Bool)

(assert (=> b!291290 (= e!184320 (not true))))

(declare-datatypes ((SeekEntryResult!2131 0))(
  ( (MissingZero!2131 (index!10694 (_ BitVec 32))) (Found!2131 (index!10695 (_ BitVec 32))) (Intermediate!2131 (undefined!2943 Bool) (index!10696 (_ BitVec 32)) (x!28878 (_ BitVec 32))) (Undefined!2131) (MissingVacant!2131 (index!10697 (_ BitVec 32))) )
))
(declare-fun lt!144085 () SeekEntryResult!2131)

(assert (=> b!291290 (= (index!10696 lt!144085) i!1256)))

(declare-fun b!291291 () Bool)

(declare-fun res!152633 () Bool)

(declare-fun e!184322 () Bool)

(assert (=> b!291291 (=> (not res!152633) (not e!184322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14713 (_ BitVec 32)) Bool)

(assert (=> b!291291 (= res!152633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291292 () Bool)

(declare-fun e!184321 () Bool)

(assert (=> b!291292 (= e!184321 e!184320)))

(declare-fun res!152629 () Bool)

(assert (=> b!291292 (=> (not res!152629) (not e!184320))))

(declare-fun lt!144084 () Bool)

(assert (=> b!291292 (= res!152629 (and (or lt!144084 (not (undefined!2943 lt!144085))) (not lt!144084) (= (select (arr!6982 a!3312) (index!10696 lt!144085)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291292 (= lt!144084 (not (is-Intermediate!2131 lt!144085)))))

(declare-fun res!152628 () Bool)

(assert (=> start!28444 (=> (not res!152628) (not e!184319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28444 (= res!152628 (validMask!0 mask!3809))))

(assert (=> start!28444 e!184319))

(assert (=> start!28444 true))

(declare-fun array_inv!4945 (array!14713) Bool)

(assert (=> start!28444 (array_inv!4945 a!3312)))

(declare-fun b!291293 () Bool)

(assert (=> b!291293 (= e!184319 e!184322)))

(declare-fun res!152630 () Bool)

(assert (=> b!291293 (=> (not res!152630) (not e!184322))))

(declare-fun lt!144082 () SeekEntryResult!2131)

(declare-fun lt!144080 () Bool)

(assert (=> b!291293 (= res!152630 (or lt!144080 (= lt!144082 (MissingVacant!2131 i!1256))))))

(assert (=> b!291293 (= lt!144080 (= lt!144082 (MissingZero!2131 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14713 (_ BitVec 32)) SeekEntryResult!2131)

(assert (=> b!291293 (= lt!144082 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!291294 () Bool)

(declare-fun res!152634 () Bool)

(assert (=> b!291294 (=> (not res!152634) (not e!184319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291294 (= res!152634 (validKeyInArray!0 k!2524))))

(declare-fun b!291295 () Bool)

(assert (=> b!291295 (= e!184322 e!184321)))

(declare-fun res!152632 () Bool)

(assert (=> b!291295 (=> (not res!152632) (not e!184321))))

(assert (=> b!291295 (= res!152632 (and (not lt!144080) (= lt!144082 (MissingVacant!2131 i!1256))))))

(declare-fun lt!144083 () (_ BitVec 32))

(declare-fun lt!144081 () SeekEntryResult!2131)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14713 (_ BitVec 32)) SeekEntryResult!2131)

(assert (=> b!291295 (= lt!144081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144083 k!2524 (array!14714 (store (arr!6982 a!3312) i!1256 k!2524) (size!7334 a!3312)) mask!3809))))

(assert (=> b!291295 (= lt!144085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144083 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291295 (= lt!144083 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291296 () Bool)

(declare-fun res!152627 () Bool)

(assert (=> b!291296 (=> (not res!152627) (not e!184319))))

(declare-fun arrayContainsKey!0 (array!14713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291296 (= res!152627 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28444 res!152628) b!291289))

(assert (= (and b!291289 res!152631) b!291294))

(assert (= (and b!291294 res!152634) b!291296))

(assert (= (and b!291296 res!152627) b!291293))

(assert (= (and b!291293 res!152630) b!291291))

(assert (= (and b!291291 res!152633) b!291295))

(assert (= (and b!291295 res!152632) b!291292))

(assert (= (and b!291292 res!152629) b!291290))

(declare-fun m!305237 () Bool)

(assert (=> b!291292 m!305237))

(declare-fun m!305239 () Bool)

(assert (=> start!28444 m!305239))

(declare-fun m!305241 () Bool)

(assert (=> start!28444 m!305241))

(declare-fun m!305243 () Bool)

(assert (=> b!291291 m!305243))

(declare-fun m!305245 () Bool)

(assert (=> b!291294 m!305245))

(declare-fun m!305247 () Bool)

(assert (=> b!291295 m!305247))

(declare-fun m!305249 () Bool)

(assert (=> b!291295 m!305249))

(declare-fun m!305251 () Bool)

(assert (=> b!291295 m!305251))

(declare-fun m!305253 () Bool)

(assert (=> b!291295 m!305253))

(declare-fun m!305255 () Bool)

(assert (=> b!291296 m!305255))

(declare-fun m!305257 () Bool)

(assert (=> b!291293 m!305257))

(push 1)

