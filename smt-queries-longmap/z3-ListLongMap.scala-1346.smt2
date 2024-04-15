; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26636 () Bool)

(assert start!26636)

(declare-fun b!276341 () Bool)

(declare-fun res!140385 () Bool)

(declare-fun e!176528 () Bool)

(assert (=> b!276341 (=> (not res!140385) (not e!176528))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276341 (= res!140385 (validKeyInArray!0 k0!2581))))

(declare-fun b!276342 () Bool)

(declare-fun res!140387 () Bool)

(assert (=> b!276342 (=> (not res!140387) (not e!176528))))

(declare-datatypes ((array!13722 0))(
  ( (array!13723 (arr!6510 (Array (_ BitVec 32) (_ BitVec 64))) (size!6863 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13722)

(declare-datatypes ((List!4291 0))(
  ( (Nil!4288) (Cons!4287 (h!4954 (_ BitVec 64)) (t!9364 List!4291)) )
))
(declare-fun arrayNoDuplicates!0 (array!13722 (_ BitVec 32) List!4291) Bool)

(assert (=> b!276342 (= res!140387 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4288))))

(declare-fun b!276343 () Bool)

(declare-fun res!140386 () Bool)

(declare-fun e!176529 () Bool)

(assert (=> b!276343 (=> (not res!140386) (not e!176529))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13722 (_ BitVec 32)) Bool)

(assert (=> b!276343 (= res!140386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276344 () Bool)

(assert (=> b!276344 (= e!176528 e!176529)))

(declare-fun res!140389 () Bool)

(assert (=> b!276344 (=> (not res!140389) (not e!176529))))

(declare-datatypes ((SeekEntryResult!1667 0))(
  ( (MissingZero!1667 (index!8838 (_ BitVec 32))) (Found!1667 (index!8839 (_ BitVec 32))) (Intermediate!1667 (undefined!2479 Bool) (index!8840 (_ BitVec 32)) (x!27119 (_ BitVec 32))) (Undefined!1667) (MissingVacant!1667 (index!8841 (_ BitVec 32))) )
))
(declare-fun lt!137475 () SeekEntryResult!1667)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276344 (= res!140389 (or (= lt!137475 (MissingZero!1667 i!1267)) (= lt!137475 (MissingVacant!1667 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13722 (_ BitVec 32)) SeekEntryResult!1667)

(assert (=> b!276344 (= lt!137475 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!140388 () Bool)

(assert (=> start!26636 (=> (not res!140388) (not e!176528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26636 (= res!140388 (validMask!0 mask!3868))))

(assert (=> start!26636 e!176528))

(declare-fun array_inv!4482 (array!13722) Bool)

(assert (=> start!26636 (array_inv!4482 a!3325)))

(assert (=> start!26636 true))

(declare-fun b!276345 () Bool)

(declare-fun res!140383 () Bool)

(assert (=> b!276345 (=> (not res!140383) (not e!176528))))

(declare-fun arrayContainsKey!0 (array!13722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276345 (= res!140383 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276346 () Bool)

(declare-fun res!140384 () Bool)

(assert (=> b!276346 (=> (not res!140384) (not e!176528))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276346 (= res!140384 (and (= (size!6863 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6863 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6863 a!3325))))))

(declare-fun b!276347 () Bool)

(assert (=> b!276347 (= e!176529 (and (= startIndex!26 i!1267) (bvslt startIndex!26 (bvsub (size!6863 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (= (and start!26636 res!140388) b!276346))

(assert (= (and b!276346 res!140384) b!276341))

(assert (= (and b!276341 res!140385) b!276342))

(assert (= (and b!276342 res!140387) b!276345))

(assert (= (and b!276345 res!140383) b!276344))

(assert (= (and b!276344 res!140389) b!276343))

(assert (= (and b!276343 res!140386) b!276347))

(declare-fun m!291221 () Bool)

(assert (=> b!276344 m!291221))

(declare-fun m!291223 () Bool)

(assert (=> b!276345 m!291223))

(declare-fun m!291225 () Bool)

(assert (=> b!276343 m!291225))

(declare-fun m!291227 () Bool)

(assert (=> b!276342 m!291227))

(declare-fun m!291229 () Bool)

(assert (=> start!26636 m!291229))

(declare-fun m!291231 () Bool)

(assert (=> start!26636 m!291231))

(declare-fun m!291233 () Bool)

(assert (=> b!276341 m!291233))

(check-sat (not b!276344) (not b!276342) (not b!276343) (not b!276341) (not start!26636) (not b!276345))
(check-sat)
