; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26544 () Bool)

(assert start!26544)

(declare-fun b!275543 () Bool)

(declare-fun res!139511 () Bool)

(declare-fun e!176249 () Bool)

(assert (=> b!275543 (=> (not res!139511) (not e!176249))))

(declare-datatypes ((array!13640 0))(
  ( (array!13641 (arr!6469 (Array (_ BitVec 32) (_ BitVec 64))) (size!6821 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13640)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275543 (= res!139511 (and (= (size!6821 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6821 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6821 a!3325))))))

(declare-fun b!275545 () Bool)

(declare-fun res!139509 () Bool)

(assert (=> b!275545 (=> (not res!139509) (not e!176249))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275545 (= res!139509 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275546 () Bool)

(declare-fun res!139507 () Bool)

(assert (=> b!275546 (=> (not res!139507) (not e!176249))))

(declare-datatypes ((List!4190 0))(
  ( (Nil!4187) (Cons!4186 (h!4853 (_ BitVec 64)) (t!9264 List!4190)) )
))
(declare-fun arrayNoDuplicates!0 (array!13640 (_ BitVec 32) List!4190) Bool)

(assert (=> b!275546 (= res!139507 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4187))))

(declare-fun b!275547 () Bool)

(declare-fun e!176247 () Bool)

(assert (=> b!275547 (= e!176247 false)))

(declare-fun lt!137465 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13640 (_ BitVec 32)) Bool)

(assert (=> b!275547 (= lt!137465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275548 () Bool)

(assert (=> b!275548 (= e!176249 e!176247)))

(declare-fun res!139512 () Bool)

(assert (=> b!275548 (=> (not res!139512) (not e!176247))))

(declare-datatypes ((SeekEntryResult!1592 0))(
  ( (MissingZero!1592 (index!8538 (_ BitVec 32))) (Found!1592 (index!8539 (_ BitVec 32))) (Intermediate!1592 (undefined!2404 Bool) (index!8540 (_ BitVec 32)) (x!26925 (_ BitVec 32))) (Undefined!1592) (MissingVacant!1592 (index!8541 (_ BitVec 32))) )
))
(declare-fun lt!137466 () SeekEntryResult!1592)

(assert (=> b!275548 (= res!139512 (or (= lt!137466 (MissingZero!1592 i!1267)) (= lt!137466 (MissingVacant!1592 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13640 (_ BitVec 32)) SeekEntryResult!1592)

(assert (=> b!275548 (= lt!137466 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275544 () Bool)

(declare-fun res!139508 () Bool)

(assert (=> b!275544 (=> (not res!139508) (not e!176249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275544 (= res!139508 (validKeyInArray!0 k0!2581))))

(declare-fun res!139510 () Bool)

(assert (=> start!26544 (=> (not res!139510) (not e!176249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26544 (= res!139510 (validMask!0 mask!3868))))

(assert (=> start!26544 e!176249))

(declare-fun array_inv!4419 (array!13640) Bool)

(assert (=> start!26544 (array_inv!4419 a!3325)))

(assert (=> start!26544 true))

(assert (= (and start!26544 res!139510) b!275543))

(assert (= (and b!275543 res!139511) b!275544))

(assert (= (and b!275544 res!139508) b!275546))

(assert (= (and b!275546 res!139507) b!275545))

(assert (= (and b!275545 res!139509) b!275548))

(assert (= (and b!275548 res!139512) b!275547))

(declare-fun m!291257 () Bool)

(assert (=> b!275547 m!291257))

(declare-fun m!291259 () Bool)

(assert (=> b!275546 m!291259))

(declare-fun m!291261 () Bool)

(assert (=> b!275544 m!291261))

(declare-fun m!291263 () Bool)

(assert (=> b!275545 m!291263))

(declare-fun m!291265 () Bool)

(assert (=> start!26544 m!291265))

(declare-fun m!291267 () Bool)

(assert (=> start!26544 m!291267))

(declare-fun m!291269 () Bool)

(assert (=> b!275548 m!291269))

(check-sat (not b!275546) (not b!275545) (not b!275548) (not start!26544) (not b!275544) (not b!275547))
(check-sat)
