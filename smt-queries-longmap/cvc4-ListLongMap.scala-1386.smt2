; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27172 () Bool)

(assert start!27172)

(declare-fun b!281148 () Bool)

(declare-fun res!144217 () Bool)

(declare-fun e!178777 () Bool)

(assert (=> b!281148 (=> (not res!144217) (not e!178777))))

(declare-datatypes ((array!13990 0))(
  ( (array!13991 (arr!6637 (Array (_ BitVec 32) (_ BitVec 64))) (size!6989 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13990)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281148 (= res!144217 (validKeyInArray!0 (select (arr!6637 a!3325) startIndex!26)))))

(declare-fun b!281149 () Bool)

(declare-fun res!144223 () Bool)

(declare-fun e!178776 () Bool)

(assert (=> b!281149 (=> (not res!144223) (not e!178776))))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!281149 (= res!144223 (validKeyInArray!0 k!2581))))

(declare-fun b!281150 () Bool)

(declare-fun res!144218 () Bool)

(assert (=> b!281150 (=> (not res!144218) (not e!178776))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!281150 (= res!144218 (and (= (size!6989 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6989 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6989 a!3325))))))

(declare-fun b!281151 () Bool)

(declare-fun res!144225 () Bool)

(assert (=> b!281151 (=> (not res!144225) (not e!178776))))

(declare-fun arrayContainsKey!0 (array!13990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281151 (= res!144225 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281152 () Bool)

(assert (=> b!281152 (= e!178776 e!178777)))

(declare-fun res!144222 () Bool)

(assert (=> b!281152 (=> (not res!144222) (not e!178777))))

(declare-datatypes ((SeekEntryResult!1795 0))(
  ( (MissingZero!1795 (index!9350 (_ BitVec 32))) (Found!1795 (index!9351 (_ BitVec 32))) (Intermediate!1795 (undefined!2607 Bool) (index!9352 (_ BitVec 32)) (x!27577 (_ BitVec 32))) (Undefined!1795) (MissingVacant!1795 (index!9353 (_ BitVec 32))) )
))
(declare-fun lt!138984 () SeekEntryResult!1795)

(assert (=> b!281152 (= res!144222 (or (= lt!138984 (MissingZero!1795 i!1267)) (= lt!138984 (MissingVacant!1795 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13990 (_ BitVec 32)) SeekEntryResult!1795)

(assert (=> b!281152 (= lt!138984 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!144224 () Bool)

(assert (=> start!27172 (=> (not res!144224) (not e!178776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27172 (= res!144224 (validMask!0 mask!3868))))

(assert (=> start!27172 e!178776))

(declare-fun array_inv!4600 (array!13990) Bool)

(assert (=> start!27172 (array_inv!4600 a!3325)))

(assert (=> start!27172 true))

(declare-fun b!281153 () Bool)

(declare-fun res!144221 () Bool)

(assert (=> b!281153 (=> (not res!144221) (not e!178776))))

(declare-datatypes ((List!4445 0))(
  ( (Nil!4442) (Cons!4441 (h!5111 (_ BitVec 64)) (t!9527 List!4445)) )
))
(declare-fun arrayNoDuplicates!0 (array!13990 (_ BitVec 32) List!4445) Bool)

(assert (=> b!281153 (= res!144221 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4442))))

(declare-fun b!281154 () Bool)

(assert (=> b!281154 (= e!178777 (not true))))

(assert (=> b!281154 (arrayNoDuplicates!0 (array!13991 (store (arr!6637 a!3325) i!1267 k!2581) (size!6989 a!3325)) #b00000000000000000000000000000000 Nil!4442)))

(declare-datatypes ((Unit!8874 0))(
  ( (Unit!8875) )
))
(declare-fun lt!138985 () Unit!8874)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13990 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4445) Unit!8874)

(assert (=> b!281154 (= lt!138985 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4442))))

(declare-fun b!281155 () Bool)

(declare-fun res!144219 () Bool)

(assert (=> b!281155 (=> (not res!144219) (not e!178777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13990 (_ BitVec 32)) Bool)

(assert (=> b!281155 (= res!144219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281156 () Bool)

(declare-fun res!144220 () Bool)

(assert (=> b!281156 (=> (not res!144220) (not e!178777))))

(assert (=> b!281156 (= res!144220 (not (= startIndex!26 i!1267)))))

(assert (= (and start!27172 res!144224) b!281150))

(assert (= (and b!281150 res!144218) b!281149))

(assert (= (and b!281149 res!144223) b!281153))

(assert (= (and b!281153 res!144221) b!281151))

(assert (= (and b!281151 res!144225) b!281152))

(assert (= (and b!281152 res!144222) b!281155))

(assert (= (and b!281155 res!144219) b!281156))

(assert (= (and b!281156 res!144220) b!281148))

(assert (= (and b!281148 res!144217) b!281154))

(declare-fun m!295503 () Bool)

(assert (=> b!281149 m!295503))

(declare-fun m!295505 () Bool)

(assert (=> b!281154 m!295505))

(declare-fun m!295507 () Bool)

(assert (=> b!281154 m!295507))

(declare-fun m!295509 () Bool)

(assert (=> b!281154 m!295509))

(declare-fun m!295511 () Bool)

(assert (=> b!281148 m!295511))

(assert (=> b!281148 m!295511))

(declare-fun m!295513 () Bool)

(assert (=> b!281148 m!295513))

(declare-fun m!295515 () Bool)

(assert (=> b!281155 m!295515))

(declare-fun m!295517 () Bool)

(assert (=> start!27172 m!295517))

(declare-fun m!295519 () Bool)

(assert (=> start!27172 m!295519))

(declare-fun m!295521 () Bool)

(assert (=> b!281152 m!295521))

(declare-fun m!295523 () Bool)

(assert (=> b!281151 m!295523))

(declare-fun m!295525 () Bool)

(assert (=> b!281153 m!295525))

(push 1)

(assert (not b!281152))

(assert (not b!281155))

