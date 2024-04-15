; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26654 () Bool)

(assert start!26654)

(declare-fun b!276510 () Bool)

(declare-fun res!140553 () Bool)

(declare-fun e!176609 () Bool)

(assert (=> b!276510 (=> (not res!140553) (not e!176609))))

(declare-datatypes ((array!13740 0))(
  ( (array!13741 (arr!6519 (Array (_ BitVec 32) (_ BitVec 64))) (size!6872 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13740)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276510 (= res!140553 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276511 () Bool)

(declare-fun res!140552 () Bool)

(assert (=> b!276511 (=> (not res!140552) (not e!176609))))

(declare-datatypes ((List!4300 0))(
  ( (Nil!4297) (Cons!4296 (h!4963 (_ BitVec 64)) (t!9373 List!4300)) )
))
(declare-fun arrayNoDuplicates!0 (array!13740 (_ BitVec 32) List!4300) Bool)

(assert (=> b!276511 (= res!140552 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4297))))

(declare-fun b!276512 () Bool)

(declare-fun res!140554 () Bool)

(assert (=> b!276512 (=> (not res!140554) (not e!176609))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276512 (= res!140554 (and (= (size!6872 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6872 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6872 a!3325))))))

(declare-fun b!276513 () Bool)

(declare-fun e!176608 () Bool)

(assert (=> b!276513 (= e!176608 false)))

(declare-fun lt!137522 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13740 (_ BitVec 32)) Bool)

(assert (=> b!276513 (= lt!137522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140555 () Bool)

(assert (=> start!26654 (=> (not res!140555) (not e!176609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26654 (= res!140555 (validMask!0 mask!3868))))

(assert (=> start!26654 e!176609))

(declare-fun array_inv!4491 (array!13740) Bool)

(assert (=> start!26654 (array_inv!4491 a!3325)))

(assert (=> start!26654 true))

(declare-fun b!276514 () Bool)

(assert (=> b!276514 (= e!176609 e!176608)))

(declare-fun res!140557 () Bool)

(assert (=> b!276514 (=> (not res!140557) (not e!176608))))

(declare-datatypes ((SeekEntryResult!1676 0))(
  ( (MissingZero!1676 (index!8874 (_ BitVec 32))) (Found!1676 (index!8875 (_ BitVec 32))) (Intermediate!1676 (undefined!2488 Bool) (index!8876 (_ BitVec 32)) (x!27152 (_ BitVec 32))) (Undefined!1676) (MissingVacant!1676 (index!8877 (_ BitVec 32))) )
))
(declare-fun lt!137523 () SeekEntryResult!1676)

(assert (=> b!276514 (= res!140557 (or (= lt!137523 (MissingZero!1676 i!1267)) (= lt!137523 (MissingVacant!1676 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13740 (_ BitVec 32)) SeekEntryResult!1676)

(assert (=> b!276514 (= lt!137523 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276515 () Bool)

(declare-fun res!140556 () Bool)

(assert (=> b!276515 (=> (not res!140556) (not e!176609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276515 (= res!140556 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26654 res!140555) b!276512))

(assert (= (and b!276512 res!140554) b!276515))

(assert (= (and b!276515 res!140556) b!276511))

(assert (= (and b!276511 res!140552) b!276510))

(assert (= (and b!276510 res!140553) b!276514))

(assert (= (and b!276514 res!140557) b!276513))

(declare-fun m!291347 () Bool)

(assert (=> b!276513 m!291347))

(declare-fun m!291349 () Bool)

(assert (=> b!276514 m!291349))

(declare-fun m!291351 () Bool)

(assert (=> b!276510 m!291351))

(declare-fun m!291353 () Bool)

(assert (=> b!276511 m!291353))

(declare-fun m!291355 () Bool)

(assert (=> b!276515 m!291355))

(declare-fun m!291357 () Bool)

(assert (=> start!26654 m!291357))

(declare-fun m!291359 () Bool)

(assert (=> start!26654 m!291359))

(check-sat (not start!26654) (not b!276510) (not b!276514) (not b!276515) (not b!276511) (not b!276513))
(check-sat)
