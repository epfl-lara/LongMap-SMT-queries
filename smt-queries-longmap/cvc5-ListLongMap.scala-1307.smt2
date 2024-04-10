; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26400 () Bool)

(assert start!26400)

(declare-fun b!273819 () Bool)

(declare-fun e!175426 () Bool)

(declare-fun e!175425 () Bool)

(assert (=> b!273819 (= e!175426 e!175425)))

(declare-fun res!137811 () Bool)

(assert (=> b!273819 (=> (not res!137811) (not e!175425))))

(declare-datatypes ((SeekEntryResult!1556 0))(
  ( (MissingZero!1556 (index!8394 (_ BitVec 32))) (Found!1556 (index!8395 (_ BitVec 32))) (Intermediate!1556 (undefined!2368 Bool) (index!8396 (_ BitVec 32)) (x!26697 (_ BitVec 32))) (Undefined!1556) (MissingVacant!1556 (index!8397 (_ BitVec 32))) )
))
(declare-fun lt!136595 () SeekEntryResult!1556)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273819 (= res!137811 (or (= lt!136595 (MissingZero!1556 i!1267)) (= lt!136595 (MissingVacant!1556 i!1267))))))

(declare-datatypes ((array!13497 0))(
  ( (array!13498 (arr!6398 (Array (_ BitVec 32) (_ BitVec 64))) (size!6750 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13497)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13497 (_ BitVec 32)) SeekEntryResult!1556)

(assert (=> b!273819 (= lt!136595 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273820 () Bool)

(declare-fun e!175427 () Bool)

(assert (=> b!273820 (= e!175427 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13497 (_ BitVec 32)) Bool)

(assert (=> b!273820 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8599 0))(
  ( (Unit!8600) )
))
(declare-fun lt!136593 () Unit!8599)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8599)

(assert (=> b!273820 (= lt!136593 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136594 () array!13497)

(assert (=> b!273820 (= (seekEntryOrOpen!0 (select (arr!6398 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6398 a!3325) i!1267 k!2581) startIndex!26) lt!136594 mask!3868))))

(declare-fun lt!136596 () Unit!8599)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8599)

(assert (=> b!273820 (= lt!136596 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4206 0))(
  ( (Nil!4203) (Cons!4202 (h!4869 (_ BitVec 64)) (t!9288 List!4206)) )
))
(declare-fun arrayNoDuplicates!0 (array!13497 (_ BitVec 32) List!4206) Bool)

(assert (=> b!273820 (arrayNoDuplicates!0 lt!136594 #b00000000000000000000000000000000 Nil!4203)))

(declare-fun lt!136597 () Unit!8599)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13497 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4206) Unit!8599)

(assert (=> b!273820 (= lt!136597 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4203))))

(declare-fun b!273821 () Bool)

(declare-fun res!137815 () Bool)

(assert (=> b!273821 (=> (not res!137815) (not e!175426))))

(declare-fun arrayContainsKey!0 (array!13497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273821 (= res!137815 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273822 () Bool)

(declare-fun res!137809 () Bool)

(assert (=> b!273822 (=> (not res!137809) (not e!175425))))

(assert (=> b!273822 (= res!137809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273823 () Bool)

(assert (=> b!273823 (= e!175425 e!175427)))

(declare-fun res!137812 () Bool)

(assert (=> b!273823 (=> (not res!137812) (not e!175427))))

(assert (=> b!273823 (= res!137812 (not (= startIndex!26 i!1267)))))

(assert (=> b!273823 (= lt!136594 (array!13498 (store (arr!6398 a!3325) i!1267 k!2581) (size!6750 a!3325)))))

(declare-fun b!273825 () Bool)

(declare-fun res!137817 () Bool)

(assert (=> b!273825 (=> (not res!137817) (not e!175426))))

(assert (=> b!273825 (= res!137817 (and (= (size!6750 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6750 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6750 a!3325))))))

(declare-fun b!273826 () Bool)

(declare-fun res!137810 () Bool)

(assert (=> b!273826 (=> (not res!137810) (not e!175426))))

(assert (=> b!273826 (= res!137810 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4203))))

(declare-fun b!273827 () Bool)

(declare-fun res!137816 () Bool)

(assert (=> b!273827 (=> (not res!137816) (not e!175427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273827 (= res!137816 (validKeyInArray!0 (select (arr!6398 a!3325) startIndex!26)))))

(declare-fun b!273824 () Bool)

(declare-fun res!137813 () Bool)

(assert (=> b!273824 (=> (not res!137813) (not e!175426))))

(assert (=> b!273824 (= res!137813 (validKeyInArray!0 k!2581))))

(declare-fun res!137814 () Bool)

(assert (=> start!26400 (=> (not res!137814) (not e!175426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26400 (= res!137814 (validMask!0 mask!3868))))

(assert (=> start!26400 e!175426))

(declare-fun array_inv!4361 (array!13497) Bool)

(assert (=> start!26400 (array_inv!4361 a!3325)))

(assert (=> start!26400 true))

(assert (= (and start!26400 res!137814) b!273825))

(assert (= (and b!273825 res!137817) b!273824))

(assert (= (and b!273824 res!137813) b!273826))

(assert (= (and b!273826 res!137810) b!273821))

(assert (= (and b!273821 res!137815) b!273819))

(assert (= (and b!273819 res!137811) b!273822))

(assert (= (and b!273822 res!137809) b!273823))

(assert (= (and b!273823 res!137812) b!273827))

(assert (= (and b!273827 res!137816) b!273820))

(declare-fun m!289137 () Bool)

(assert (=> b!273826 m!289137))

(declare-fun m!289139 () Bool)

(assert (=> b!273821 m!289139))

(declare-fun m!289141 () Bool)

(assert (=> b!273822 m!289141))

(declare-fun m!289143 () Bool)

(assert (=> b!273827 m!289143))

(assert (=> b!273827 m!289143))

(declare-fun m!289145 () Bool)

(assert (=> b!273827 m!289145))

(declare-fun m!289147 () Bool)

(assert (=> b!273820 m!289147))

(declare-fun m!289149 () Bool)

(assert (=> b!273820 m!289149))

(declare-fun m!289151 () Bool)

(assert (=> b!273820 m!289151))

(assert (=> b!273820 m!289149))

(declare-fun m!289153 () Bool)

(assert (=> b!273820 m!289153))

(declare-fun m!289155 () Bool)

(assert (=> b!273820 m!289155))

(assert (=> b!273820 m!289143))

(declare-fun m!289157 () Bool)

(assert (=> b!273820 m!289157))

(assert (=> b!273820 m!289143))

(declare-fun m!289159 () Bool)

(assert (=> b!273820 m!289159))

(declare-fun m!289161 () Bool)

(assert (=> b!273820 m!289161))

(declare-fun m!289163 () Bool)

(assert (=> b!273820 m!289163))

(declare-fun m!289165 () Bool)

(assert (=> start!26400 m!289165))

(declare-fun m!289167 () Bool)

(assert (=> start!26400 m!289167))

(declare-fun m!289169 () Bool)

(assert (=> b!273819 m!289169))

(declare-fun m!289171 () Bool)

(assert (=> b!273824 m!289171))

(assert (=> b!273823 m!289153))

(push 1)

