; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26496 () Bool)

(assert start!26496)

(declare-fun b!275064 () Bool)

(declare-fun res!139055 () Bool)

(declare-fun e!176008 () Bool)

(assert (=> b!275064 (=> (not res!139055) (not e!176008))))

(declare-datatypes ((array!13593 0))(
  ( (array!13594 (arr!6446 (Array (_ BitVec 32) (_ BitVec 64))) (size!6798 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13593)

(declare-datatypes ((List!4254 0))(
  ( (Nil!4251) (Cons!4250 (h!4917 (_ BitVec 64)) (t!9336 List!4254)) )
))
(declare-fun arrayNoDuplicates!0 (array!13593 (_ BitVec 32) List!4254) Bool)

(assert (=> b!275064 (= res!139055 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4251))))

(declare-fun b!275065 () Bool)

(declare-fun e!176007 () Bool)

(assert (=> b!275065 (= e!176007 false)))

(declare-fun lt!137262 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13593 (_ BitVec 32)) Bool)

(assert (=> b!275065 (= lt!137262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275066 () Bool)

(declare-fun res!139056 () Bool)

(assert (=> b!275066 (=> (not res!139056) (not e!176008))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275066 (= res!139056 (validKeyInArray!0 k!2581))))

(declare-fun b!275067 () Bool)

(declare-fun res!139054 () Bool)

(assert (=> b!275067 (=> (not res!139054) (not e!176008))))

(declare-fun arrayContainsKey!0 (array!13593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275067 (= res!139054 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275068 () Bool)

(declare-fun res!139057 () Bool)

(assert (=> b!275068 (=> (not res!139057) (not e!176008))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275068 (= res!139057 (and (= (size!6798 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6798 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6798 a!3325))))))

(declare-fun b!275069 () Bool)

(assert (=> b!275069 (= e!176008 e!176007)))

(declare-fun res!139059 () Bool)

(assert (=> b!275069 (=> (not res!139059) (not e!176007))))

(declare-datatypes ((SeekEntryResult!1604 0))(
  ( (MissingZero!1604 (index!8586 (_ BitVec 32))) (Found!1604 (index!8587 (_ BitVec 32))) (Intermediate!1604 (undefined!2416 Bool) (index!8588 (_ BitVec 32)) (x!26873 (_ BitVec 32))) (Undefined!1604) (MissingVacant!1604 (index!8589 (_ BitVec 32))) )
))
(declare-fun lt!137263 () SeekEntryResult!1604)

(assert (=> b!275069 (= res!139059 (or (= lt!137263 (MissingZero!1604 i!1267)) (= lt!137263 (MissingVacant!1604 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13593 (_ BitVec 32)) SeekEntryResult!1604)

(assert (=> b!275069 (= lt!137263 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!139058 () Bool)

(assert (=> start!26496 (=> (not res!139058) (not e!176008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26496 (= res!139058 (validMask!0 mask!3868))))

(assert (=> start!26496 e!176008))

(declare-fun array_inv!4409 (array!13593) Bool)

(assert (=> start!26496 (array_inv!4409 a!3325)))

(assert (=> start!26496 true))

(assert (= (and start!26496 res!139058) b!275068))

(assert (= (and b!275068 res!139057) b!275066))

(assert (= (and b!275066 res!139056) b!275064))

(assert (= (and b!275064 res!139055) b!275067))

(assert (= (and b!275067 res!139054) b!275069))

(assert (= (and b!275069 res!139059) b!275065))

(declare-fun m!290715 () Bool)

(assert (=> b!275069 m!290715))

(declare-fun m!290717 () Bool)

(assert (=> b!275067 m!290717))

(declare-fun m!290719 () Bool)

(assert (=> start!26496 m!290719))

(declare-fun m!290721 () Bool)

(assert (=> start!26496 m!290721))

(declare-fun m!290723 () Bool)

(assert (=> b!275064 m!290723))

(declare-fun m!290725 () Bool)

(assert (=> b!275065 m!290725))

(declare-fun m!290727 () Bool)

(assert (=> b!275066 m!290727))

(push 1)

