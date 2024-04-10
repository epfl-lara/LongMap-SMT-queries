; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26484 () Bool)

(assert start!26484)

(declare-fun res!138949 () Bool)

(declare-fun e!175953 () Bool)

(assert (=> start!26484 (=> (not res!138949) (not e!175953))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26484 (= res!138949 (validMask!0 mask!3868))))

(assert (=> start!26484 e!175953))

(declare-datatypes ((array!13581 0))(
  ( (array!13582 (arr!6440 (Array (_ BitVec 32) (_ BitVec 64))) (size!6792 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13581)

(declare-fun array_inv!4403 (array!13581) Bool)

(assert (=> start!26484 (array_inv!4403 a!3325)))

(assert (=> start!26484 true))

(declare-fun b!274956 () Bool)

(declare-fun res!138950 () Bool)

(assert (=> b!274956 (=> (not res!138950) (not e!175953))))

(declare-datatypes ((List!4248 0))(
  ( (Nil!4245) (Cons!4244 (h!4911 (_ BitVec 64)) (t!9330 List!4248)) )
))
(declare-fun arrayNoDuplicates!0 (array!13581 (_ BitVec 32) List!4248) Bool)

(assert (=> b!274956 (= res!138950 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4245))))

(declare-fun b!274957 () Bool)

(declare-fun e!175955 () Bool)

(assert (=> b!274957 (= e!175955 false)))

(declare-fun lt!137226 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13581 (_ BitVec 32)) Bool)

(assert (=> b!274957 (= lt!137226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274958 () Bool)

(declare-fun res!138948 () Bool)

(assert (=> b!274958 (=> (not res!138948) (not e!175953))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274958 (= res!138948 (validKeyInArray!0 k!2581))))

(declare-fun b!274959 () Bool)

(declare-fun res!138946 () Bool)

(assert (=> b!274959 (=> (not res!138946) (not e!175953))))

(declare-fun arrayContainsKey!0 (array!13581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274959 (= res!138946 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274960 () Bool)

(assert (=> b!274960 (= e!175953 e!175955)))

(declare-fun res!138951 () Bool)

(assert (=> b!274960 (=> (not res!138951) (not e!175955))))

(declare-datatypes ((SeekEntryResult!1598 0))(
  ( (MissingZero!1598 (index!8562 (_ BitVec 32))) (Found!1598 (index!8563 (_ BitVec 32))) (Intermediate!1598 (undefined!2410 Bool) (index!8564 (_ BitVec 32)) (x!26851 (_ BitVec 32))) (Undefined!1598) (MissingVacant!1598 (index!8565 (_ BitVec 32))) )
))
(declare-fun lt!137227 () SeekEntryResult!1598)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274960 (= res!138951 (or (= lt!137227 (MissingZero!1598 i!1267)) (= lt!137227 (MissingVacant!1598 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13581 (_ BitVec 32)) SeekEntryResult!1598)

(assert (=> b!274960 (= lt!137227 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274961 () Bool)

(declare-fun res!138947 () Bool)

(assert (=> b!274961 (=> (not res!138947) (not e!175953))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274961 (= res!138947 (and (= (size!6792 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6792 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6792 a!3325))))))

(assert (= (and start!26484 res!138949) b!274961))

(assert (= (and b!274961 res!138947) b!274958))

(assert (= (and b!274958 res!138948) b!274956))

(assert (= (and b!274956 res!138950) b!274959))

(assert (= (and b!274959 res!138946) b!274960))

(assert (= (and b!274960 res!138951) b!274957))

(declare-fun m!290631 () Bool)

(assert (=> b!274960 m!290631))

(declare-fun m!290633 () Bool)

(assert (=> b!274958 m!290633))

(declare-fun m!290635 () Bool)

(assert (=> b!274956 m!290635))

(declare-fun m!290637 () Bool)

(assert (=> b!274959 m!290637))

(declare-fun m!290639 () Bool)

(assert (=> start!26484 m!290639))

(declare-fun m!290641 () Bool)

(assert (=> start!26484 m!290641))

(declare-fun m!290643 () Bool)

(assert (=> b!274957 m!290643))

(push 1)

