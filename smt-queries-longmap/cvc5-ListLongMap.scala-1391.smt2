; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27198 () Bool)

(assert start!27198)

(declare-fun b!281499 () Bool)

(declare-fun res!144574 () Bool)

(declare-fun e!178897 () Bool)

(assert (=> b!281499 (=> (not res!144574) (not e!178897))))

(declare-datatypes ((array!14016 0))(
  ( (array!14017 (arr!6650 (Array (_ BitVec 32) (_ BitVec 64))) (size!7002 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14016)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14016 (_ BitVec 32)) Bool)

(assert (=> b!281499 (= res!144574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281500 () Bool)

(declare-fun res!144568 () Bool)

(declare-fun e!178898 () Bool)

(assert (=> b!281500 (=> (not res!144568) (not e!178898))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281500 (= res!144568 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281501 () Bool)

(assert (=> b!281501 (= e!178898 e!178897)))

(declare-fun res!144572 () Bool)

(assert (=> b!281501 (=> (not res!144572) (not e!178897))))

(declare-datatypes ((SeekEntryResult!1808 0))(
  ( (MissingZero!1808 (index!9402 (_ BitVec 32))) (Found!1808 (index!9403 (_ BitVec 32))) (Intermediate!1808 (undefined!2620 Bool) (index!9404 (_ BitVec 32)) (x!27630 (_ BitVec 32))) (Undefined!1808) (MissingVacant!1808 (index!9405 (_ BitVec 32))) )
))
(declare-fun lt!139067 () SeekEntryResult!1808)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281501 (= res!144572 (or (= lt!139067 (MissingZero!1808 i!1267)) (= lt!139067 (MissingVacant!1808 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14016 (_ BitVec 32)) SeekEntryResult!1808)

(assert (=> b!281501 (= lt!139067 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281502 () Bool)

(declare-fun res!144571 () Bool)

(assert (=> b!281502 (=> (not res!144571) (not e!178898))))

(declare-datatypes ((List!4458 0))(
  ( (Nil!4455) (Cons!4454 (h!5124 (_ BitVec 64)) (t!9540 List!4458)) )
))
(declare-fun arrayNoDuplicates!0 (array!14016 (_ BitVec 32) List!4458) Bool)

(assert (=> b!281502 (= res!144571 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4455))))

(declare-fun b!281503 () Bool)

(declare-fun res!144575 () Bool)

(declare-fun e!178896 () Bool)

(assert (=> b!281503 (=> (not res!144575) (not e!178896))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281503 (= res!144575 (validKeyInArray!0 (select (arr!6650 a!3325) startIndex!26)))))

(declare-fun b!281504 () Bool)

(declare-fun res!144576 () Bool)

(assert (=> b!281504 (=> (not res!144576) (not e!178898))))

(assert (=> b!281504 (= res!144576 (and (= (size!7002 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7002 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7002 a!3325))))))

(declare-fun res!144570 () Bool)

(assert (=> start!27198 (=> (not res!144570) (not e!178898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27198 (= res!144570 (validMask!0 mask!3868))))

(assert (=> start!27198 e!178898))

(declare-fun array_inv!4613 (array!14016) Bool)

(assert (=> start!27198 (array_inv!4613 a!3325)))

(assert (=> start!27198 true))

(declare-fun b!281505 () Bool)

(declare-fun res!144573 () Bool)

(assert (=> b!281505 (=> (not res!144573) (not e!178898))))

(assert (=> b!281505 (= res!144573 (validKeyInArray!0 k!2581))))

(declare-fun b!281506 () Bool)

(assert (=> b!281506 (= e!178897 e!178896)))

(declare-fun res!144569 () Bool)

(assert (=> b!281506 (=> (not res!144569) (not e!178896))))

(assert (=> b!281506 (= res!144569 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139066 () array!14016)

(assert (=> b!281506 (= lt!139066 (array!14017 (store (arr!6650 a!3325) i!1267 k!2581) (size!7002 a!3325)))))

(declare-fun b!281507 () Bool)

(assert (=> b!281507 (= e!178896 (not true))))

(assert (=> b!281507 (= (seekEntryOrOpen!0 (select (arr!6650 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6650 a!3325) i!1267 k!2581) startIndex!26) lt!139066 mask!3868))))

(declare-datatypes ((Unit!8900 0))(
  ( (Unit!8901) )
))
(declare-fun lt!139069 () Unit!8900)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14016 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8900)

(assert (=> b!281507 (= lt!139069 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!281507 (arrayNoDuplicates!0 lt!139066 #b00000000000000000000000000000000 Nil!4455)))

(declare-fun lt!139068 () Unit!8900)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14016 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4458) Unit!8900)

(assert (=> b!281507 (= lt!139068 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4455))))

(assert (= (and start!27198 res!144570) b!281504))

(assert (= (and b!281504 res!144576) b!281505))

(assert (= (and b!281505 res!144573) b!281502))

(assert (= (and b!281502 res!144571) b!281500))

(assert (= (and b!281500 res!144568) b!281501))

(assert (= (and b!281501 res!144572) b!281499))

(assert (= (and b!281499 res!144574) b!281506))

(assert (= (and b!281506 res!144569) b!281503))

(assert (= (and b!281503 res!144575) b!281507))

(declare-fun m!295815 () Bool)

(assert (=> b!281507 m!295815))

(declare-fun m!295817 () Bool)

(assert (=> b!281507 m!295817))

(declare-fun m!295819 () Bool)

(assert (=> b!281507 m!295819))

(declare-fun m!295821 () Bool)

(assert (=> b!281507 m!295821))

(declare-fun m!295823 () Bool)

(assert (=> b!281507 m!295823))

(declare-fun m!295825 () Bool)

(assert (=> b!281507 m!295825))

(declare-fun m!295827 () Bool)

(assert (=> b!281507 m!295827))

(assert (=> b!281507 m!295815))

(declare-fun m!295829 () Bool)

(assert (=> b!281507 m!295829))

(assert (=> b!281507 m!295825))

(declare-fun m!295831 () Bool)

(assert (=> b!281499 m!295831))

(declare-fun m!295833 () Bool)

(assert (=> b!281500 m!295833))

(declare-fun m!295835 () Bool)

(assert (=> start!27198 m!295835))

(declare-fun m!295837 () Bool)

(assert (=> start!27198 m!295837))

(declare-fun m!295839 () Bool)

(assert (=> b!281502 m!295839))

(declare-fun m!295841 () Bool)

(assert (=> b!281505 m!295841))

(declare-fun m!295843 () Bool)

(assert (=> b!281501 m!295843))

(assert (=> b!281506 m!295817))

(assert (=> b!281503 m!295825))

(assert (=> b!281503 m!295825))

(declare-fun m!295845 () Bool)

(assert (=> b!281503 m!295845))

(push 1)

