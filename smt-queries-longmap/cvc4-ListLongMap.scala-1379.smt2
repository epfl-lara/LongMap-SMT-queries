; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27130 () Bool)

(assert start!27130)

(declare-fun b!280581 () Bool)

(declare-fun e!178589 () Bool)

(declare-fun e!178587 () Bool)

(assert (=> b!280581 (= e!178589 e!178587)))

(declare-fun res!143652 () Bool)

(assert (=> b!280581 (=> (not res!143652) (not e!178587))))

(declare-datatypes ((SeekEntryResult!1774 0))(
  ( (MissingZero!1774 (index!9266 (_ BitVec 32))) (Found!1774 (index!9267 (_ BitVec 32))) (Intermediate!1774 (undefined!2586 Bool) (index!9268 (_ BitVec 32)) (x!27500 (_ BitVec 32))) (Undefined!1774) (MissingVacant!1774 (index!9269 (_ BitVec 32))) )
))
(declare-fun lt!138859 () SeekEntryResult!1774)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280581 (= res!143652 (or (= lt!138859 (MissingZero!1774 i!1267)) (= lt!138859 (MissingVacant!1774 i!1267))))))

(declare-datatypes ((array!13948 0))(
  ( (array!13949 (arr!6616 (Array (_ BitVec 32) (_ BitVec 64))) (size!6968 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13948)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13948 (_ BitVec 32)) SeekEntryResult!1774)

(assert (=> b!280581 (= lt!138859 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280582 () Bool)

(assert (=> b!280582 (= e!178587 (not true))))

(declare-datatypes ((List!4424 0))(
  ( (Nil!4421) (Cons!4420 (h!5090 (_ BitVec 64)) (t!9506 List!4424)) )
))
(declare-fun arrayNoDuplicates!0 (array!13948 (_ BitVec 32) List!4424) Bool)

(assert (=> b!280582 (arrayNoDuplicates!0 (array!13949 (store (arr!6616 a!3325) i!1267 k!2581) (size!6968 a!3325)) #b00000000000000000000000000000000 Nil!4421)))

(declare-datatypes ((Unit!8832 0))(
  ( (Unit!8833) )
))
(declare-fun lt!138858 () Unit!8832)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13948 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4424) Unit!8832)

(assert (=> b!280582 (= lt!138858 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4421))))

(declare-fun b!280583 () Bool)

(declare-fun res!143654 () Bool)

(assert (=> b!280583 (=> (not res!143654) (not e!178589))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280583 (= res!143654 (and (= (size!6968 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6968 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6968 a!3325))))))

(declare-fun b!280584 () Bool)

(declare-fun res!143657 () Bool)

(assert (=> b!280584 (=> (not res!143657) (not e!178589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280584 (= res!143657 (validKeyInArray!0 k!2581))))

(declare-fun b!280585 () Bool)

(declare-fun res!143658 () Bool)

(assert (=> b!280585 (=> (not res!143658) (not e!178587))))

(assert (=> b!280585 (= res!143658 (validKeyInArray!0 (select (arr!6616 a!3325) startIndex!26)))))

(declare-fun b!280586 () Bool)

(declare-fun res!143656 () Bool)

(assert (=> b!280586 (=> (not res!143656) (not e!178589))))

(declare-fun arrayContainsKey!0 (array!13948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280586 (= res!143656 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280587 () Bool)

(declare-fun res!143653 () Bool)

(assert (=> b!280587 (=> (not res!143653) (not e!178587))))

(assert (=> b!280587 (= res!143653 (not (= startIndex!26 i!1267)))))

(declare-fun res!143651 () Bool)

(assert (=> start!27130 (=> (not res!143651) (not e!178589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27130 (= res!143651 (validMask!0 mask!3868))))

(assert (=> start!27130 e!178589))

(declare-fun array_inv!4579 (array!13948) Bool)

(assert (=> start!27130 (array_inv!4579 a!3325)))

(assert (=> start!27130 true))

(declare-fun b!280588 () Bool)

(declare-fun res!143650 () Bool)

(assert (=> b!280588 (=> (not res!143650) (not e!178587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13948 (_ BitVec 32)) Bool)

(assert (=> b!280588 (= res!143650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280589 () Bool)

(declare-fun res!143655 () Bool)

(assert (=> b!280589 (=> (not res!143655) (not e!178589))))

(assert (=> b!280589 (= res!143655 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4421))))

(assert (= (and start!27130 res!143651) b!280583))

(assert (= (and b!280583 res!143654) b!280584))

(assert (= (and b!280584 res!143657) b!280589))

(assert (= (and b!280589 res!143655) b!280586))

(assert (= (and b!280586 res!143656) b!280581))

(assert (= (and b!280581 res!143652) b!280588))

(assert (= (and b!280588 res!143650) b!280587))

(assert (= (and b!280587 res!143653) b!280585))

(assert (= (and b!280585 res!143658) b!280582))

(declare-fun m!294999 () Bool)

(assert (=> b!280585 m!294999))

(assert (=> b!280585 m!294999))

(declare-fun m!295001 () Bool)

(assert (=> b!280585 m!295001))

(declare-fun m!295003 () Bool)

(assert (=> b!280581 m!295003))

(declare-fun m!295005 () Bool)

(assert (=> b!280584 m!295005))

(declare-fun m!295007 () Bool)

(assert (=> b!280586 m!295007))

(declare-fun m!295009 () Bool)

(assert (=> b!280589 m!295009))

(declare-fun m!295011 () Bool)

(assert (=> b!280582 m!295011))

(declare-fun m!295013 () Bool)

(assert (=> b!280582 m!295013))

(declare-fun m!295015 () Bool)

(assert (=> b!280582 m!295015))

(declare-fun m!295017 () Bool)

(assert (=> start!27130 m!295017))

(declare-fun m!295019 () Bool)

(assert (=> start!27130 m!295019))

(declare-fun m!295021 () Bool)

(assert (=> b!280588 m!295021))

(push 1)

(assert (not b!280586))

(assert (not start!27130))

(assert (not b!280585))

(assert (not b!280588))

(assert (not b!280581))

