; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26586 () Bool)

(assert start!26586)

(declare-fun b!276018 () Bool)

(declare-fun e!176412 () Bool)

(assert (=> b!276018 (= e!176412 false)))

(declare-fun lt!137532 () Bool)

(declare-datatypes ((array!13683 0))(
  ( (array!13684 (arr!6491 (Array (_ BitVec 32) (_ BitVec 64))) (size!6843 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13683)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13683 (_ BitVec 32)) Bool)

(assert (=> b!276018 (= lt!137532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276019 () Bool)

(declare-fun res!140012 () Bool)

(declare-fun e!176413 () Bool)

(assert (=> b!276019 (=> (not res!140012) (not e!176413))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276019 (= res!140012 (and (= (size!6843 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6843 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6843 a!3325))))))

(declare-fun b!276020 () Bool)

(declare-fun res!140009 () Bool)

(assert (=> b!276020 (=> (not res!140009) (not e!176413))))

(declare-datatypes ((List!4299 0))(
  ( (Nil!4296) (Cons!4295 (h!4962 (_ BitVec 64)) (t!9381 List!4299)) )
))
(declare-fun arrayNoDuplicates!0 (array!13683 (_ BitVec 32) List!4299) Bool)

(assert (=> b!276020 (= res!140009 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4296))))

(declare-fun b!276021 () Bool)

(declare-fun res!140008 () Bool)

(assert (=> b!276021 (=> (not res!140008) (not e!176413))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276021 (= res!140008 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276022 () Bool)

(declare-fun res!140010 () Bool)

(assert (=> b!276022 (=> (not res!140010) (not e!176413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276022 (= res!140010 (validKeyInArray!0 k!2581))))

(declare-fun res!140011 () Bool)

(assert (=> start!26586 (=> (not res!140011) (not e!176413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26586 (= res!140011 (validMask!0 mask!3868))))

(assert (=> start!26586 e!176413))

(declare-fun array_inv!4454 (array!13683) Bool)

(assert (=> start!26586 (array_inv!4454 a!3325)))

(assert (=> start!26586 true))

(declare-fun b!276023 () Bool)

(assert (=> b!276023 (= e!176413 e!176412)))

(declare-fun res!140013 () Bool)

(assert (=> b!276023 (=> (not res!140013) (not e!176412))))

(declare-datatypes ((SeekEntryResult!1649 0))(
  ( (MissingZero!1649 (index!8766 (_ BitVec 32))) (Found!1649 (index!8767 (_ BitVec 32))) (Intermediate!1649 (undefined!2461 Bool) (index!8768 (_ BitVec 32)) (x!27038 (_ BitVec 32))) (Undefined!1649) (MissingVacant!1649 (index!8769 (_ BitVec 32))) )
))
(declare-fun lt!137533 () SeekEntryResult!1649)

(assert (=> b!276023 (= res!140013 (or (= lt!137533 (MissingZero!1649 i!1267)) (= lt!137533 (MissingVacant!1649 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13683 (_ BitVec 32)) SeekEntryResult!1649)

(assert (=> b!276023 (= lt!137533 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26586 res!140011) b!276019))

(assert (= (and b!276019 res!140012) b!276022))

(assert (= (and b!276022 res!140010) b!276020))

(assert (= (and b!276020 res!140009) b!276021))

(assert (= (and b!276021 res!140008) b!276023))

(assert (= (and b!276023 res!140013) b!276018))

(declare-fun m!291465 () Bool)

(assert (=> b!276018 m!291465))

(declare-fun m!291467 () Bool)

(assert (=> b!276021 m!291467))

(declare-fun m!291469 () Bool)

(assert (=> start!26586 m!291469))

(declare-fun m!291471 () Bool)

(assert (=> start!26586 m!291471))

(declare-fun m!291473 () Bool)

(assert (=> b!276020 m!291473))

(declare-fun m!291475 () Bool)

(assert (=> b!276022 m!291475))

(declare-fun m!291477 () Bool)

(assert (=> b!276023 m!291477))

(push 1)

