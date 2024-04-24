; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26484 () Bool)

(assert start!26484)

(declare-fun b!275003 () Bool)

(declare-fun res!138971 () Bool)

(declare-fun e!175978 () Bool)

(assert (=> b!275003 (=> (not res!138971) (not e!175978))))

(declare-datatypes ((array!13580 0))(
  ( (array!13581 (arr!6439 (Array (_ BitVec 32) (_ BitVec 64))) (size!6791 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13580)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275003 (= res!138971 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!138968 () Bool)

(assert (=> start!26484 (=> (not res!138968) (not e!175978))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26484 (= res!138968 (validMask!0 mask!3868))))

(assert (=> start!26484 e!175978))

(declare-fun array_inv!4389 (array!13580) Bool)

(assert (=> start!26484 (array_inv!4389 a!3325)))

(assert (=> start!26484 true))

(declare-fun b!275004 () Bool)

(declare-fun res!138967 () Bool)

(assert (=> b!275004 (=> (not res!138967) (not e!175978))))

(declare-datatypes ((List!4160 0))(
  ( (Nil!4157) (Cons!4156 (h!4823 (_ BitVec 64)) (t!9234 List!4160)) )
))
(declare-fun arrayNoDuplicates!0 (array!13580 (_ BitVec 32) List!4160) Bool)

(assert (=> b!275004 (= res!138967 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4157))))

(declare-fun b!275005 () Bool)

(declare-fun e!175977 () Bool)

(assert (=> b!275005 (= e!175978 e!175977)))

(declare-fun res!138972 () Bool)

(assert (=> b!275005 (=> (not res!138972) (not e!175977))))

(declare-datatypes ((SeekEntryResult!1562 0))(
  ( (MissingZero!1562 (index!8418 (_ BitVec 32))) (Found!1562 (index!8419 (_ BitVec 32))) (Intermediate!1562 (undefined!2374 Bool) (index!8420 (_ BitVec 32)) (x!26815 (_ BitVec 32))) (Undefined!1562) (MissingVacant!1562 (index!8421 (_ BitVec 32))) )
))
(declare-fun lt!137285 () SeekEntryResult!1562)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275005 (= res!138972 (or (= lt!137285 (MissingZero!1562 i!1267)) (= lt!137285 (MissingVacant!1562 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13580 (_ BitVec 32)) SeekEntryResult!1562)

(assert (=> b!275005 (= lt!137285 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275006 () Bool)

(declare-fun res!138969 () Bool)

(assert (=> b!275006 (=> (not res!138969) (not e!175978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275006 (= res!138969 (validKeyInArray!0 k0!2581))))

(declare-fun b!275007 () Bool)

(assert (=> b!275007 (= e!175977 false)))

(declare-fun lt!137286 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13580 (_ BitVec 32)) Bool)

(assert (=> b!275007 (= lt!137286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275008 () Bool)

(declare-fun res!138970 () Bool)

(assert (=> b!275008 (=> (not res!138970) (not e!175978))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275008 (= res!138970 (and (= (size!6791 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6791 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6791 a!3325))))))

(assert (= (and start!26484 res!138968) b!275008))

(assert (= (and b!275008 res!138970) b!275006))

(assert (= (and b!275006 res!138969) b!275004))

(assert (= (and b!275004 res!138967) b!275003))

(assert (= (and b!275003 res!138971) b!275005))

(assert (= (and b!275005 res!138972) b!275007))

(declare-fun m!290837 () Bool)

(assert (=> b!275003 m!290837))

(declare-fun m!290839 () Bool)

(assert (=> b!275007 m!290839))

(declare-fun m!290841 () Bool)

(assert (=> b!275004 m!290841))

(declare-fun m!290843 () Bool)

(assert (=> b!275005 m!290843))

(declare-fun m!290845 () Bool)

(assert (=> start!26484 m!290845))

(declare-fun m!290847 () Bool)

(assert (=> start!26484 m!290847))

(declare-fun m!290849 () Bool)

(assert (=> b!275006 m!290849))

(check-sat (not b!275007) (not start!26484) (not b!275004) (not b!275003) (not b!275006) (not b!275005))
(check-sat)
