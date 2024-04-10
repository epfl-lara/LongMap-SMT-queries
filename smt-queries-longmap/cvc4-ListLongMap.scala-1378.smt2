; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27124 () Bool)

(assert start!27124)

(declare-fun b!280500 () Bool)

(declare-fun res!143577 () Bool)

(declare-fun e!178561 () Bool)

(assert (=> b!280500 (=> (not res!143577) (not e!178561))))

(declare-datatypes ((array!13942 0))(
  ( (array!13943 (arr!6613 (Array (_ BitVec 32) (_ BitVec 64))) (size!6965 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13942)

(declare-datatypes ((List!4421 0))(
  ( (Nil!4418) (Cons!4417 (h!5087 (_ BitVec 64)) (t!9503 List!4421)) )
))
(declare-fun arrayNoDuplicates!0 (array!13942 (_ BitVec 32) List!4421) Bool)

(assert (=> b!280500 (= res!143577 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4418))))

(declare-fun b!280501 () Bool)

(declare-fun res!143569 () Bool)

(assert (=> b!280501 (=> (not res!143569) (not e!178561))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280501 (= res!143569 (validKeyInArray!0 k!2581))))

(declare-fun b!280502 () Bool)

(declare-fun res!143574 () Bool)

(assert (=> b!280502 (=> (not res!143574) (not e!178561))))

(declare-fun arrayContainsKey!0 (array!13942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280502 (= res!143574 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280503 () Bool)

(declare-fun res!143570 () Bool)

(declare-fun e!178562 () Bool)

(assert (=> b!280503 (=> (not res!143570) (not e!178562))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13942 (_ BitVec 32)) Bool)

(assert (=> b!280503 (= res!143570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280504 () Bool)

(declare-fun res!143576 () Bool)

(assert (=> b!280504 (=> (not res!143576) (not e!178561))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280504 (= res!143576 (and (= (size!6965 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6965 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6965 a!3325))))))

(declare-fun b!280505 () Bool)

(declare-fun res!143575 () Bool)

(assert (=> b!280505 (=> (not res!143575) (not e!178562))))

(assert (=> b!280505 (= res!143575 (not (= startIndex!26 i!1267)))))

(declare-fun res!143573 () Bool)

(assert (=> start!27124 (=> (not res!143573) (not e!178561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27124 (= res!143573 (validMask!0 mask!3868))))

(assert (=> start!27124 e!178561))

(declare-fun array_inv!4576 (array!13942) Bool)

(assert (=> start!27124 (array_inv!4576 a!3325)))

(assert (=> start!27124 true))

(declare-fun b!280506 () Bool)

(assert (=> b!280506 (= e!178562 (not true))))

(assert (=> b!280506 (arrayNoDuplicates!0 (array!13943 (store (arr!6613 a!3325) i!1267 k!2581) (size!6965 a!3325)) #b00000000000000000000000000000000 Nil!4418)))

(declare-datatypes ((Unit!8826 0))(
  ( (Unit!8827) )
))
(declare-fun lt!138840 () Unit!8826)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13942 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4421) Unit!8826)

(assert (=> b!280506 (= lt!138840 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4418))))

(declare-fun b!280507 () Bool)

(assert (=> b!280507 (= e!178561 e!178562)))

(declare-fun res!143572 () Bool)

(assert (=> b!280507 (=> (not res!143572) (not e!178562))))

(declare-datatypes ((SeekEntryResult!1771 0))(
  ( (MissingZero!1771 (index!9254 (_ BitVec 32))) (Found!1771 (index!9255 (_ BitVec 32))) (Intermediate!1771 (undefined!2583 Bool) (index!9256 (_ BitVec 32)) (x!27489 (_ BitVec 32))) (Undefined!1771) (MissingVacant!1771 (index!9257 (_ BitVec 32))) )
))
(declare-fun lt!138841 () SeekEntryResult!1771)

(assert (=> b!280507 (= res!143572 (or (= lt!138841 (MissingZero!1771 i!1267)) (= lt!138841 (MissingVacant!1771 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13942 (_ BitVec 32)) SeekEntryResult!1771)

(assert (=> b!280507 (= lt!138841 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280508 () Bool)

(declare-fun res!143571 () Bool)

(assert (=> b!280508 (=> (not res!143571) (not e!178562))))

(assert (=> b!280508 (= res!143571 (validKeyInArray!0 (select (arr!6613 a!3325) startIndex!26)))))

(assert (= (and start!27124 res!143573) b!280504))

(assert (= (and b!280504 res!143576) b!280501))

(assert (= (and b!280501 res!143569) b!280500))

(assert (= (and b!280500 res!143577) b!280502))

(assert (= (and b!280502 res!143574) b!280507))

(assert (= (and b!280507 res!143572) b!280503))

(assert (= (and b!280503 res!143570) b!280505))

(assert (= (and b!280505 res!143575) b!280508))

(assert (= (and b!280508 res!143571) b!280506))

(declare-fun m!294927 () Bool)

(assert (=> b!280502 m!294927))

(declare-fun m!294929 () Bool)

(assert (=> b!280500 m!294929))

(declare-fun m!294931 () Bool)

(assert (=> b!280506 m!294931))

(declare-fun m!294933 () Bool)

(assert (=> b!280506 m!294933))

(declare-fun m!294935 () Bool)

(assert (=> b!280506 m!294935))

(declare-fun m!294937 () Bool)

(assert (=> b!280507 m!294937))

(declare-fun m!294939 () Bool)

(assert (=> start!27124 m!294939))

(declare-fun m!294941 () Bool)

(assert (=> start!27124 m!294941))

(declare-fun m!294943 () Bool)

(assert (=> b!280503 m!294943))

(declare-fun m!294945 () Bool)

(assert (=> b!280508 m!294945))

(assert (=> b!280508 m!294945))

(declare-fun m!294947 () Bool)

(assert (=> b!280508 m!294947))

(declare-fun m!294949 () Bool)

(assert (=> b!280501 m!294949))

(push 1)

(assert (not start!27124))

