; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26240 () Bool)

(assert start!26240)

(declare-fun b!271421 () Bool)

(declare-fun res!135472 () Bool)

(declare-fun e!174484 () Bool)

(assert (=> b!271421 (=> (not res!135472) (not e!174484))))

(declare-datatypes ((List!4093 0))(
  ( (Nil!4090) (Cons!4089 (h!4756 (_ BitVec 64)) (t!9166 List!4093)) )
))
(declare-fun contains!1931 (List!4093 (_ BitVec 64)) Bool)

(assert (=> b!271421 (= res!135472 (not (contains!1931 Nil!4090 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271422 () Bool)

(assert (=> b!271422 (= e!174484 false)))

(declare-fun lt!135642 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!271422 (= lt!135642 (contains!1931 Nil!4090 k0!2581))))

(declare-fun b!271424 () Bool)

(declare-fun res!135465 () Bool)

(declare-fun e!174485 () Bool)

(assert (=> b!271424 (=> (not res!135465) (not e!174485))))

(declare-datatypes ((array!13326 0))(
  ( (array!13327 (arr!6312 (Array (_ BitVec 32) (_ BitVec 64))) (size!6665 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13326)

(declare-fun arrayNoDuplicates!0 (array!13326 (_ BitVec 32) List!4093) Bool)

(assert (=> b!271424 (= res!135465 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4090))))

(declare-fun b!271425 () Bool)

(declare-fun res!135475 () Bool)

(assert (=> b!271425 (=> (not res!135475) (not e!174484))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13326 (_ BitVec 32)) Bool)

(assert (=> b!271425 (= res!135475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271426 () Bool)

(declare-fun res!135467 () Bool)

(assert (=> b!271426 (=> (not res!135467) (not e!174484))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271426 (= res!135467 (validKeyInArray!0 (select (arr!6312 a!3325) startIndex!26)))))

(declare-fun b!271427 () Bool)

(declare-fun res!135471 () Bool)

(assert (=> b!271427 (=> (not res!135471) (not e!174485))))

(assert (=> b!271427 (= res!135471 (validKeyInArray!0 k0!2581))))

(declare-fun b!271428 () Bool)

(declare-fun res!135463 () Bool)

(assert (=> b!271428 (=> (not res!135463) (not e!174484))))

(declare-fun noDuplicate!145 (List!4093) Bool)

(assert (=> b!271428 (= res!135463 (noDuplicate!145 Nil!4090))))

(declare-fun b!271429 () Bool)

(declare-fun res!135468 () Bool)

(assert (=> b!271429 (=> (not res!135468) (not e!174484))))

(assert (=> b!271429 (= res!135468 (not (contains!1931 Nil!4090 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271430 () Bool)

(declare-fun res!135473 () Bool)

(assert (=> b!271430 (=> (not res!135473) (not e!174484))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271430 (= res!135473 (not (= startIndex!26 i!1267)))))

(declare-fun b!271431 () Bool)

(declare-fun res!135466 () Bool)

(assert (=> b!271431 (=> (not res!135466) (not e!174485))))

(declare-fun arrayContainsKey!0 (array!13326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271431 (= res!135466 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271432 () Bool)

(declare-fun res!135470 () Bool)

(assert (=> b!271432 (=> (not res!135470) (not e!174484))))

(assert (=> b!271432 (= res!135470 (and (bvslt (size!6665 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6665 a!3325))))))

(declare-fun b!271433 () Bool)

(declare-fun res!135469 () Bool)

(assert (=> b!271433 (=> (not res!135469) (not e!174485))))

(assert (=> b!271433 (= res!135469 (and (= (size!6665 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6665 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6665 a!3325))))))

(declare-fun b!271423 () Bool)

(assert (=> b!271423 (= e!174485 e!174484)))

(declare-fun res!135464 () Bool)

(assert (=> b!271423 (=> (not res!135464) (not e!174484))))

(declare-datatypes ((SeekEntryResult!1469 0))(
  ( (MissingZero!1469 (index!8046 (_ BitVec 32))) (Found!1469 (index!8047 (_ BitVec 32))) (Intermediate!1469 (undefined!2281 Bool) (index!8048 (_ BitVec 32)) (x!26393 (_ BitVec 32))) (Undefined!1469) (MissingVacant!1469 (index!8049 (_ BitVec 32))) )
))
(declare-fun lt!135641 () SeekEntryResult!1469)

(assert (=> b!271423 (= res!135464 (or (= lt!135641 (MissingZero!1469 i!1267)) (= lt!135641 (MissingVacant!1469 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13326 (_ BitVec 32)) SeekEntryResult!1469)

(assert (=> b!271423 (= lt!135641 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!135474 () Bool)

(assert (=> start!26240 (=> (not res!135474) (not e!174485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26240 (= res!135474 (validMask!0 mask!3868))))

(assert (=> start!26240 e!174485))

(declare-fun array_inv!4284 (array!13326) Bool)

(assert (=> start!26240 (array_inv!4284 a!3325)))

(assert (=> start!26240 true))

(assert (= (and start!26240 res!135474) b!271433))

(assert (= (and b!271433 res!135469) b!271427))

(assert (= (and b!271427 res!135471) b!271424))

(assert (= (and b!271424 res!135465) b!271431))

(assert (= (and b!271431 res!135466) b!271423))

(assert (= (and b!271423 res!135464) b!271425))

(assert (= (and b!271425 res!135475) b!271430))

(assert (= (and b!271430 res!135473) b!271426))

(assert (= (and b!271426 res!135467) b!271432))

(assert (= (and b!271432 res!135470) b!271428))

(assert (= (and b!271428 res!135463) b!271421))

(assert (= (and b!271421 res!135472) b!271429))

(assert (= (and b!271429 res!135468) b!271422))

(declare-fun m!286217 () Bool)

(assert (=> b!271423 m!286217))

(declare-fun m!286219 () Bool)

(assert (=> b!271425 m!286219))

(declare-fun m!286221 () Bool)

(assert (=> b!271428 m!286221))

(declare-fun m!286223 () Bool)

(assert (=> b!271421 m!286223))

(declare-fun m!286225 () Bool)

(assert (=> start!26240 m!286225))

(declare-fun m!286227 () Bool)

(assert (=> start!26240 m!286227))

(declare-fun m!286229 () Bool)

(assert (=> b!271422 m!286229))

(declare-fun m!286231 () Bool)

(assert (=> b!271427 m!286231))

(declare-fun m!286233 () Bool)

(assert (=> b!271426 m!286233))

(assert (=> b!271426 m!286233))

(declare-fun m!286235 () Bool)

(assert (=> b!271426 m!286235))

(declare-fun m!286237 () Bool)

(assert (=> b!271424 m!286237))

(declare-fun m!286239 () Bool)

(assert (=> b!271431 m!286239))

(declare-fun m!286241 () Bool)

(assert (=> b!271429 m!286241))

(check-sat (not b!271421) (not b!271427) (not b!271423) (not b!271429) (not b!271425) (not b!271424) (not b!271428) (not start!26240) (not b!271431) (not b!271422) (not b!271426))
(check-sat)
