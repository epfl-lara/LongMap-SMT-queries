; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26914 () Bool)

(assert start!26914)

(declare-fun b!278952 () Bool)

(declare-fun e!177878 () Bool)

(declare-fun e!177876 () Bool)

(assert (=> b!278952 (= e!177878 e!177876)))

(declare-fun res!142293 () Bool)

(assert (=> b!278952 (=> (not res!142293) (not e!177876))))

(declare-datatypes ((SeekEntryResult!1744 0))(
  ( (MissingZero!1744 (index!9146 (_ BitVec 32))) (Found!1744 (index!9147 (_ BitVec 32))) (Intermediate!1744 (undefined!2556 Bool) (index!9148 (_ BitVec 32)) (x!27390 (_ BitVec 32))) (Undefined!1744) (MissingVacant!1744 (index!9149 (_ BitVec 32))) )
))
(declare-fun lt!138517 () SeekEntryResult!1744)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!278952 (= res!142293 (or (= lt!138517 (MissingZero!1744 i!1267)) (= lt!138517 (MissingVacant!1744 i!1267))))))

(declare-datatypes ((array!13879 0))(
  ( (array!13880 (arr!6586 (Array (_ BitVec 32) (_ BitVec 64))) (size!6938 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13879)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13879 (_ BitVec 32)) SeekEntryResult!1744)

(assert (=> b!278952 (= lt!138517 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!278953 () Bool)

(declare-fun res!142298 () Bool)

(assert (=> b!278953 (=> (not res!142298) (not e!177876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13879 (_ BitVec 32)) Bool)

(assert (=> b!278953 (= res!142298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278954 () Bool)

(declare-fun res!142292 () Bool)

(assert (=> b!278954 (=> (not res!142292) (not e!177876))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278954 (= res!142292 (validKeyInArray!0 (select (arr!6586 a!3325) startIndex!26)))))

(declare-fun res!142291 () Bool)

(assert (=> start!26914 (=> (not res!142291) (not e!177878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26914 (= res!142291 (validMask!0 mask!3868))))

(assert (=> start!26914 e!177878))

(declare-fun array_inv!4549 (array!13879) Bool)

(assert (=> start!26914 (array_inv!4549 a!3325)))

(assert (=> start!26914 true))

(declare-fun b!278955 () Bool)

(declare-fun res!142299 () Bool)

(assert (=> b!278955 (=> (not res!142299) (not e!177878))))

(declare-datatypes ((List!4394 0))(
  ( (Nil!4391) (Cons!4390 (h!5060 (_ BitVec 64)) (t!9476 List!4394)) )
))
(declare-fun arrayNoDuplicates!0 (array!13879 (_ BitVec 32) List!4394) Bool)

(assert (=> b!278955 (= res!142299 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4391))))

(declare-fun b!278956 () Bool)

(assert (=> b!278956 (= e!177876 (and (bvslt (size!6938 a!3325) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!6938 a!3325))))))

(declare-fun b!278957 () Bool)

(declare-fun res!142294 () Bool)

(assert (=> b!278957 (=> (not res!142294) (not e!177876))))

(assert (=> b!278957 (= res!142294 (not (= startIndex!26 i!1267)))))

(declare-fun b!278958 () Bool)

(declare-fun res!142296 () Bool)

(assert (=> b!278958 (=> (not res!142296) (not e!177878))))

(assert (=> b!278958 (= res!142296 (and (= (size!6938 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6938 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6938 a!3325))))))

(declare-fun b!278959 () Bool)

(declare-fun res!142297 () Bool)

(assert (=> b!278959 (=> (not res!142297) (not e!177878))))

(assert (=> b!278959 (= res!142297 (validKeyInArray!0 k!2581))))

(declare-fun b!278960 () Bool)

(declare-fun res!142295 () Bool)

(assert (=> b!278960 (=> (not res!142295) (not e!177878))))

(declare-fun arrayContainsKey!0 (array!13879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278960 (= res!142295 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26914 res!142291) b!278958))

(assert (= (and b!278958 res!142296) b!278959))

(assert (= (and b!278959 res!142297) b!278955))

(assert (= (and b!278955 res!142299) b!278960))

(assert (= (and b!278960 res!142295) b!278952))

(assert (= (and b!278952 res!142293) b!278953))

(assert (= (and b!278953 res!142298) b!278957))

(assert (= (and b!278957 res!142294) b!278954))

(assert (= (and b!278954 res!142292) b!278956))

(declare-fun m!293865 () Bool)

(assert (=> b!278953 m!293865))

(declare-fun m!293867 () Bool)

(assert (=> b!278959 m!293867))

(declare-fun m!293869 () Bool)

(assert (=> b!278960 m!293869))

(declare-fun m!293871 () Bool)

(assert (=> b!278954 m!293871))

(assert (=> b!278954 m!293871))

(declare-fun m!293873 () Bool)

(assert (=> b!278954 m!293873))

(declare-fun m!293875 () Bool)

(assert (=> b!278952 m!293875))

(declare-fun m!293877 () Bool)

(assert (=> b!278955 m!293877))

(declare-fun m!293879 () Bool)

(assert (=> start!26914 m!293879))

(declare-fun m!293881 () Bool)

(assert (=> start!26914 m!293881))

(push 1)

(assert (not b!278953))

(assert (not b!278959))

(assert (not b!278954))

(assert (not b!278952))

(assert (not b!278955))

(assert (not start!26914))

