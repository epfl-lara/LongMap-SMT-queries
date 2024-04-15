; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26516 () Bool)

(assert start!26516)

(declare-fun b!275079 () Bool)

(declare-fun res!139121 () Bool)

(declare-fun e!175988 () Bool)

(assert (=> b!275079 (=> (not res!139121) (not e!175988))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275079 (= res!139121 (validKeyInArray!0 k0!2581))))

(declare-fun b!275080 () Bool)

(declare-fun res!139122 () Bool)

(assert (=> b!275080 (=> (not res!139122) (not e!175988))))

(declare-datatypes ((array!13602 0))(
  ( (array!13603 (arr!6450 (Array (_ BitVec 32) (_ BitVec 64))) (size!6803 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13602)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275080 (= res!139122 (and (= (size!6803 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6803 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6803 a!3325))))))

(declare-fun b!275081 () Bool)

(declare-fun res!139125 () Bool)

(assert (=> b!275081 (=> (not res!139125) (not e!175988))))

(declare-datatypes ((List!4231 0))(
  ( (Nil!4228) (Cons!4227 (h!4894 (_ BitVec 64)) (t!9304 List!4231)) )
))
(declare-fun arrayNoDuplicates!0 (array!13602 (_ BitVec 32) List!4231) Bool)

(assert (=> b!275081 (= res!139125 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4228))))

(declare-fun b!275082 () Bool)

(declare-fun e!175989 () Bool)

(assert (=> b!275082 (= e!175989 false)))

(declare-fun lt!137136 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13602 (_ BitVec 32)) Bool)

(assert (=> b!275082 (= lt!137136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275083 () Bool)

(assert (=> b!275083 (= e!175988 e!175989)))

(declare-fun res!139124 () Bool)

(assert (=> b!275083 (=> (not res!139124) (not e!175989))))

(declare-datatypes ((SeekEntryResult!1607 0))(
  ( (MissingZero!1607 (index!8598 (_ BitVec 32))) (Found!1607 (index!8599 (_ BitVec 32))) (Intermediate!1607 (undefined!2419 Bool) (index!8600 (_ BitVec 32)) (x!26899 (_ BitVec 32))) (Undefined!1607) (MissingVacant!1607 (index!8601 (_ BitVec 32))) )
))
(declare-fun lt!137135 () SeekEntryResult!1607)

(assert (=> b!275083 (= res!139124 (or (= lt!137135 (MissingZero!1607 i!1267)) (= lt!137135 (MissingVacant!1607 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13602 (_ BitVec 32)) SeekEntryResult!1607)

(assert (=> b!275083 (= lt!137135 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275084 () Bool)

(declare-fun res!139123 () Bool)

(assert (=> b!275084 (=> (not res!139123) (not e!175988))))

(declare-fun arrayContainsKey!0 (array!13602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275084 (= res!139123 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!139126 () Bool)

(assert (=> start!26516 (=> (not res!139126) (not e!175988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26516 (= res!139126 (validMask!0 mask!3868))))

(assert (=> start!26516 e!175988))

(declare-fun array_inv!4422 (array!13602) Bool)

(assert (=> start!26516 (array_inv!4422 a!3325)))

(assert (=> start!26516 true))

(assert (= (and start!26516 res!139126) b!275080))

(assert (= (and b!275080 res!139122) b!275079))

(assert (= (and b!275079 res!139121) b!275081))

(assert (= (and b!275081 res!139125) b!275084))

(assert (= (and b!275084 res!139123) b!275083))

(assert (= (and b!275083 res!139124) b!275082))

(declare-fun m!290249 () Bool)

(assert (=> b!275084 m!290249))

(declare-fun m!290251 () Bool)

(assert (=> start!26516 m!290251))

(declare-fun m!290253 () Bool)

(assert (=> start!26516 m!290253))

(declare-fun m!290255 () Bool)

(assert (=> b!275079 m!290255))

(declare-fun m!290257 () Bool)

(assert (=> b!275083 m!290257))

(declare-fun m!290259 () Bool)

(assert (=> b!275081 m!290259))

(declare-fun m!290261 () Bool)

(assert (=> b!275082 m!290261))

(check-sat (not start!26516) (not b!275083) (not b!275084) (not b!275082) (not b!275081) (not b!275079))
(check-sat)
