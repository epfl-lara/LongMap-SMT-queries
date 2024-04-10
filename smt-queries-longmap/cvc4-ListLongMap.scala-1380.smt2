; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27136 () Bool)

(assert start!27136)

(declare-fun b!280662 () Bool)

(declare-fun res!143735 () Bool)

(declare-fun e!178616 () Bool)

(assert (=> b!280662 (=> (not res!143735) (not e!178616))))

(declare-datatypes ((array!13954 0))(
  ( (array!13955 (arr!6619 (Array (_ BitVec 32) (_ BitVec 64))) (size!6971 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13954)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280662 (= res!143735 (validKeyInArray!0 (select (arr!6619 a!3325) startIndex!26)))))

(declare-fun b!280663 () Bool)

(declare-fun res!143736 () Bool)

(declare-fun e!178615 () Bool)

(assert (=> b!280663 (=> (not res!143736) (not e!178615))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280663 (= res!143736 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280664 () Bool)

(declare-fun res!143739 () Bool)

(assert (=> b!280664 (=> (not res!143739) (not e!178615))))

(declare-datatypes ((List!4427 0))(
  ( (Nil!4424) (Cons!4423 (h!5093 (_ BitVec 64)) (t!9509 List!4427)) )
))
(declare-fun arrayNoDuplicates!0 (array!13954 (_ BitVec 32) List!4427) Bool)

(assert (=> b!280664 (= res!143739 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4424))))

(declare-fun b!280665 () Bool)

(assert (=> b!280665 (= e!178616 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280665 (arrayNoDuplicates!0 (array!13955 (store (arr!6619 a!3325) i!1267 k!2581) (size!6971 a!3325)) #b00000000000000000000000000000000 Nil!4424)))

(declare-datatypes ((Unit!8838 0))(
  ( (Unit!8839) )
))
(declare-fun lt!138877 () Unit!8838)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13954 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4427) Unit!8838)

(assert (=> b!280665 (= lt!138877 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4424))))

(declare-fun b!280666 () Bool)

(assert (=> b!280666 (= e!178615 e!178616)))

(declare-fun res!143732 () Bool)

(assert (=> b!280666 (=> (not res!143732) (not e!178616))))

(declare-datatypes ((SeekEntryResult!1777 0))(
  ( (MissingZero!1777 (index!9278 (_ BitVec 32))) (Found!1777 (index!9279 (_ BitVec 32))) (Intermediate!1777 (undefined!2589 Bool) (index!9280 (_ BitVec 32)) (x!27511 (_ BitVec 32))) (Undefined!1777) (MissingVacant!1777 (index!9281 (_ BitVec 32))) )
))
(declare-fun lt!138876 () SeekEntryResult!1777)

(assert (=> b!280666 (= res!143732 (or (= lt!138876 (MissingZero!1777 i!1267)) (= lt!138876 (MissingVacant!1777 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13954 (_ BitVec 32)) SeekEntryResult!1777)

(assert (=> b!280666 (= lt!138876 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280667 () Bool)

(declare-fun res!143733 () Bool)

(assert (=> b!280667 (=> (not res!143733) (not e!178615))))

(assert (=> b!280667 (= res!143733 (validKeyInArray!0 k!2581))))

(declare-fun b!280668 () Bool)

(declare-fun res!143734 () Bool)

(assert (=> b!280668 (=> (not res!143734) (not e!178615))))

(assert (=> b!280668 (= res!143734 (and (= (size!6971 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6971 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6971 a!3325))))))

(declare-fun res!143738 () Bool)

(assert (=> start!27136 (=> (not res!143738) (not e!178615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27136 (= res!143738 (validMask!0 mask!3868))))

(assert (=> start!27136 e!178615))

(declare-fun array_inv!4582 (array!13954) Bool)

(assert (=> start!27136 (array_inv!4582 a!3325)))

(assert (=> start!27136 true))

(declare-fun b!280669 () Bool)

(declare-fun res!143731 () Bool)

(assert (=> b!280669 (=> (not res!143731) (not e!178616))))

(assert (=> b!280669 (= res!143731 (not (= startIndex!26 i!1267)))))

(declare-fun b!280670 () Bool)

(declare-fun res!143737 () Bool)

(assert (=> b!280670 (=> (not res!143737) (not e!178616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13954 (_ BitVec 32)) Bool)

(assert (=> b!280670 (= res!143737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27136 res!143738) b!280668))

(assert (= (and b!280668 res!143734) b!280667))

(assert (= (and b!280667 res!143733) b!280664))

(assert (= (and b!280664 res!143739) b!280663))

(assert (= (and b!280663 res!143736) b!280666))

(assert (= (and b!280666 res!143732) b!280670))

(assert (= (and b!280670 res!143737) b!280669))

(assert (= (and b!280669 res!143731) b!280662))

(assert (= (and b!280662 res!143735) b!280665))

(declare-fun m!295071 () Bool)

(assert (=> b!280662 m!295071))

(assert (=> b!280662 m!295071))

(declare-fun m!295073 () Bool)

(assert (=> b!280662 m!295073))

(declare-fun m!295075 () Bool)

(assert (=> b!280667 m!295075))

(declare-fun m!295077 () Bool)

(assert (=> b!280665 m!295077))

(declare-fun m!295079 () Bool)

(assert (=> b!280665 m!295079))

(declare-fun m!295081 () Bool)

(assert (=> b!280665 m!295081))

(declare-fun m!295083 () Bool)

(assert (=> b!280663 m!295083))

(declare-fun m!295085 () Bool)

(assert (=> b!280666 m!295085))

(declare-fun m!295087 () Bool)

(assert (=> start!27136 m!295087))

(declare-fun m!295089 () Bool)

(assert (=> start!27136 m!295089))

(declare-fun m!295091 () Bool)

(assert (=> b!280664 m!295091))

(declare-fun m!295093 () Bool)

(assert (=> b!280670 m!295093))

(push 1)

(assert (not b!280663))

(assert (not b!280664))

(assert (not start!27136))

(assert (not b!280670))

(assert (not b!280662))

