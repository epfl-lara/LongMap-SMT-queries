; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26422 () Bool)

(assert start!26422)

(declare-fun b!274116 () Bool)

(declare-fun res!138112 () Bool)

(declare-fun e!175559 () Bool)

(assert (=> b!274116 (=> (not res!138112) (not e!175559))))

(declare-datatypes ((array!13519 0))(
  ( (array!13520 (arr!6409 (Array (_ BitVec 32) (_ BitVec 64))) (size!6761 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13519)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274116 (= res!138112 (validKeyInArray!0 (select (arr!6409 a!3325) startIndex!26)))))

(declare-fun b!274117 () Bool)

(declare-fun res!138111 () Bool)

(declare-fun e!175557 () Bool)

(assert (=> b!274117 (=> (not res!138111) (not e!175557))))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!274117 (= res!138111 (validKeyInArray!0 k!2581))))

(declare-fun b!274118 () Bool)

(declare-fun res!138114 () Bool)

(declare-fun e!175556 () Bool)

(assert (=> b!274118 (=> (not res!138114) (not e!175556))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13519 (_ BitVec 32)) Bool)

(assert (=> b!274118 (= res!138114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274119 () Bool)

(declare-fun res!138106 () Bool)

(assert (=> b!274119 (=> (not res!138106) (not e!175557))))

(declare-datatypes ((List!4217 0))(
  ( (Nil!4214) (Cons!4213 (h!4880 (_ BitVec 64)) (t!9299 List!4217)) )
))
(declare-fun arrayNoDuplicates!0 (array!13519 (_ BitVec 32) List!4217) Bool)

(assert (=> b!274119 (= res!138106 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4214))))

(declare-fun b!274120 () Bool)

(assert (=> b!274120 (= e!175557 e!175556)))

(declare-fun res!138113 () Bool)

(assert (=> b!274120 (=> (not res!138113) (not e!175556))))

(declare-datatypes ((SeekEntryResult!1567 0))(
  ( (MissingZero!1567 (index!8438 (_ BitVec 32))) (Found!1567 (index!8439 (_ BitVec 32))) (Intermediate!1567 (undefined!2379 Bool) (index!8440 (_ BitVec 32)) (x!26732 (_ BitVec 32))) (Undefined!1567) (MissingVacant!1567 (index!8441 (_ BitVec 32))) )
))
(declare-fun lt!136762 () SeekEntryResult!1567)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274120 (= res!138113 (or (= lt!136762 (MissingZero!1567 i!1267)) (= lt!136762 (MissingVacant!1567 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13519 (_ BitVec 32)) SeekEntryResult!1567)

(assert (=> b!274120 (= lt!136762 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274121 () Bool)

(assert (=> b!274121 (= e!175559 (not true))))

(assert (=> b!274121 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8621 0))(
  ( (Unit!8622) )
))
(declare-fun lt!136760 () Unit!8621)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13519 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8621)

(assert (=> b!274121 (= lt!136760 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136758 () array!13519)

(assert (=> b!274121 (= (seekEntryOrOpen!0 (select (arr!6409 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6409 a!3325) i!1267 k!2581) startIndex!26) lt!136758 mask!3868))))

(declare-fun lt!136761 () Unit!8621)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13519 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8621)

(assert (=> b!274121 (= lt!136761 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!274121 (arrayNoDuplicates!0 lt!136758 #b00000000000000000000000000000000 Nil!4214)))

(declare-fun lt!136759 () Unit!8621)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13519 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4217) Unit!8621)

(assert (=> b!274121 (= lt!136759 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4214))))

(declare-fun b!274123 () Bool)

(declare-fun res!138109 () Bool)

(assert (=> b!274123 (=> (not res!138109) (not e!175557))))

(assert (=> b!274123 (= res!138109 (and (= (size!6761 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6761 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6761 a!3325))))))

(declare-fun b!274124 () Bool)

(assert (=> b!274124 (= e!175556 e!175559)))

(declare-fun res!138110 () Bool)

(assert (=> b!274124 (=> (not res!138110) (not e!175559))))

(assert (=> b!274124 (= res!138110 (not (= startIndex!26 i!1267)))))

(assert (=> b!274124 (= lt!136758 (array!13520 (store (arr!6409 a!3325) i!1267 k!2581) (size!6761 a!3325)))))

(declare-fun res!138107 () Bool)

(assert (=> start!26422 (=> (not res!138107) (not e!175557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26422 (= res!138107 (validMask!0 mask!3868))))

(assert (=> start!26422 e!175557))

(declare-fun array_inv!4372 (array!13519) Bool)

(assert (=> start!26422 (array_inv!4372 a!3325)))

(assert (=> start!26422 true))

(declare-fun b!274122 () Bool)

(declare-fun res!138108 () Bool)

(assert (=> b!274122 (=> (not res!138108) (not e!175557))))

(declare-fun arrayContainsKey!0 (array!13519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274122 (= res!138108 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26422 res!138107) b!274123))

(assert (= (and b!274123 res!138109) b!274117))

(assert (= (and b!274117 res!138111) b!274119))

(assert (= (and b!274119 res!138106) b!274122))

(assert (= (and b!274122 res!138108) b!274120))

(assert (= (and b!274120 res!138113) b!274118))

(assert (= (and b!274118 res!138114) b!274124))

(assert (= (and b!274124 res!138110) b!274116))

(assert (= (and b!274116 res!138112) b!274121))

(declare-fun m!289533 () Bool)

(assert (=> b!274121 m!289533))

(declare-fun m!289535 () Bool)

(assert (=> b!274121 m!289535))

(assert (=> b!274121 m!289535))

(declare-fun m!289537 () Bool)

(assert (=> b!274121 m!289537))

(declare-fun m!289539 () Bool)

(assert (=> b!274121 m!289539))

(declare-fun m!289541 () Bool)

(assert (=> b!274121 m!289541))

(declare-fun m!289543 () Bool)

(assert (=> b!274121 m!289543))

(declare-fun m!289545 () Bool)

(assert (=> b!274121 m!289545))

(declare-fun m!289547 () Bool)

(assert (=> b!274121 m!289547))

(assert (=> b!274121 m!289543))

(declare-fun m!289549 () Bool)

(assert (=> b!274121 m!289549))

(declare-fun m!289551 () Bool)

(assert (=> b!274121 m!289551))

(assert (=> b!274124 m!289539))

(declare-fun m!289553 () Bool)

(assert (=> start!26422 m!289553))

(declare-fun m!289555 () Bool)

(assert (=> start!26422 m!289555))

(declare-fun m!289557 () Bool)

(assert (=> b!274119 m!289557))

(declare-fun m!289559 () Bool)

(assert (=> b!274118 m!289559))

(assert (=> b!274116 m!289543))

(assert (=> b!274116 m!289543))

(declare-fun m!289561 () Bool)

(assert (=> b!274116 m!289561))

(declare-fun m!289563 () Bool)

(assert (=> b!274117 m!289563))

(declare-fun m!289565 () Bool)

(assert (=> b!274122 m!289565))

(declare-fun m!289567 () Bool)

(assert (=> b!274120 m!289567))

(push 1)

