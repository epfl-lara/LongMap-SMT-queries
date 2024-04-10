; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26910 () Bool)

(assert start!26910)

(declare-fun b!278898 () Bool)

(declare-fun res!142238 () Bool)

(declare-fun e!177860 () Bool)

(assert (=> b!278898 (=> (not res!142238) (not e!177860))))

(declare-datatypes ((array!13875 0))(
  ( (array!13876 (arr!6584 (Array (_ BitVec 32) (_ BitVec 64))) (size!6936 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13875)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13875 (_ BitVec 32)) Bool)

(assert (=> b!278898 (= res!142238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278899 () Bool)

(declare-fun res!142242 () Bool)

(declare-fun e!177858 () Bool)

(assert (=> b!278899 (=> (not res!142242) (not e!177858))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!278899 (= res!142242 (and (= (size!6936 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6936 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6936 a!3325))))))

(declare-fun b!278900 () Bool)

(declare-fun res!142243 () Bool)

(assert (=> b!278900 (=> (not res!142243) (not e!177860))))

(assert (=> b!278900 (= res!142243 (not (= startIndex!26 i!1267)))))

(declare-fun b!278901 () Bool)

(assert (=> b!278901 (= e!177858 e!177860)))

(declare-fun res!142240 () Bool)

(assert (=> b!278901 (=> (not res!142240) (not e!177860))))

(declare-datatypes ((SeekEntryResult!1742 0))(
  ( (MissingZero!1742 (index!9138 (_ BitVec 32))) (Found!1742 (index!9139 (_ BitVec 32))) (Intermediate!1742 (undefined!2554 Bool) (index!9140 (_ BitVec 32)) (x!27388 (_ BitVec 32))) (Undefined!1742) (MissingVacant!1742 (index!9141 (_ BitVec 32))) )
))
(declare-fun lt!138511 () SeekEntryResult!1742)

(assert (=> b!278901 (= res!142240 (or (= lt!138511 (MissingZero!1742 i!1267)) (= lt!138511 (MissingVacant!1742 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13875 (_ BitVec 32)) SeekEntryResult!1742)

(assert (=> b!278901 (= lt!138511 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!278902 () Bool)

(declare-fun res!142244 () Bool)

(assert (=> b!278902 (=> (not res!142244) (not e!177858))))

(declare-fun arrayContainsKey!0 (array!13875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278902 (= res!142244 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278903 () Bool)

(declare-fun res!142241 () Bool)

(assert (=> b!278903 (=> (not res!142241) (not e!177858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278903 (= res!142241 (validKeyInArray!0 k!2581))))

(declare-fun b!278904 () Bool)

(declare-fun res!142239 () Bool)

(assert (=> b!278904 (=> (not res!142239) (not e!177860))))

(assert (=> b!278904 (= res!142239 (validKeyInArray!0 (select (arr!6584 a!3325) startIndex!26)))))

(declare-fun b!278905 () Bool)

(assert (=> b!278905 (= e!177860 (and (bvslt (size!6936 a!3325) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!6936 a!3325))))))

(declare-fun b!278906 () Bool)

(declare-fun res!142237 () Bool)

(assert (=> b!278906 (=> (not res!142237) (not e!177858))))

(declare-datatypes ((List!4392 0))(
  ( (Nil!4389) (Cons!4388 (h!5058 (_ BitVec 64)) (t!9474 List!4392)) )
))
(declare-fun arrayNoDuplicates!0 (array!13875 (_ BitVec 32) List!4392) Bool)

(assert (=> b!278906 (= res!142237 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4389))))

(declare-fun res!142245 () Bool)

(assert (=> start!26910 (=> (not res!142245) (not e!177858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26910 (= res!142245 (validMask!0 mask!3868))))

(assert (=> start!26910 e!177858))

(declare-fun array_inv!4547 (array!13875) Bool)

(assert (=> start!26910 (array_inv!4547 a!3325)))

(assert (=> start!26910 true))

(assert (= (and start!26910 res!142245) b!278899))

(assert (= (and b!278899 res!142242) b!278903))

(assert (= (and b!278903 res!142241) b!278906))

(assert (= (and b!278906 res!142237) b!278902))

(assert (= (and b!278902 res!142244) b!278901))

(assert (= (and b!278901 res!142240) b!278898))

(assert (= (and b!278898 res!142238) b!278900))

(assert (= (and b!278900 res!142243) b!278904))

(assert (= (and b!278904 res!142239) b!278905))

(declare-fun m!293829 () Bool)

(assert (=> b!278902 m!293829))

(declare-fun m!293831 () Bool)

(assert (=> b!278904 m!293831))

(assert (=> b!278904 m!293831))

(declare-fun m!293833 () Bool)

(assert (=> b!278904 m!293833))

(declare-fun m!293835 () Bool)

(assert (=> start!26910 m!293835))

(declare-fun m!293837 () Bool)

(assert (=> start!26910 m!293837))

(declare-fun m!293839 () Bool)

(assert (=> b!278906 m!293839))

(declare-fun m!293841 () Bool)

(assert (=> b!278901 m!293841))

(declare-fun m!293843 () Bool)

(assert (=> b!278903 m!293843))

(declare-fun m!293845 () Bool)

(assert (=> b!278898 m!293845))

(push 1)

