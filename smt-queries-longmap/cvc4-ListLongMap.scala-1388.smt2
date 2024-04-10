; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27184 () Bool)

(assert start!27184)

(declare-fun b!281310 () Bool)

(declare-fun res!144379 () Bool)

(declare-fun e!178830 () Bool)

(assert (=> b!281310 (=> (not res!144379) (not e!178830))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281310 (= res!144379 (not (= startIndex!26 i!1267)))))

(declare-fun b!281311 () Bool)

(declare-fun res!144384 () Bool)

(declare-fun e!178831 () Bool)

(assert (=> b!281311 (=> (not res!144384) (not e!178831))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281311 (= res!144384 (validKeyInArray!0 k!2581))))

(declare-fun b!281312 () Bool)

(declare-fun res!144382 () Bool)

(assert (=> b!281312 (=> (not res!144382) (not e!178830))))

(declare-datatypes ((array!14002 0))(
  ( (array!14003 (arr!6643 (Array (_ BitVec 32) (_ BitVec 64))) (size!6995 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14002)

(assert (=> b!281312 (= res!144382 (validKeyInArray!0 (select (arr!6643 a!3325) startIndex!26)))))

(declare-fun b!281313 () Bool)

(assert (=> b!281313 (= e!178831 e!178830)))

(declare-fun res!144383 () Bool)

(assert (=> b!281313 (=> (not res!144383) (not e!178830))))

(declare-datatypes ((SeekEntryResult!1801 0))(
  ( (MissingZero!1801 (index!9374 (_ BitVec 32))) (Found!1801 (index!9375 (_ BitVec 32))) (Intermediate!1801 (undefined!2613 Bool) (index!9376 (_ BitVec 32)) (x!27599 (_ BitVec 32))) (Undefined!1801) (MissingVacant!1801 (index!9377 (_ BitVec 32))) )
))
(declare-fun lt!139021 () SeekEntryResult!1801)

(assert (=> b!281313 (= res!144383 (or (= lt!139021 (MissingZero!1801 i!1267)) (= lt!139021 (MissingVacant!1801 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14002 (_ BitVec 32)) SeekEntryResult!1801)

(assert (=> b!281313 (= lt!139021 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!144387 () Bool)

(assert (=> start!27184 (=> (not res!144387) (not e!178831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27184 (= res!144387 (validMask!0 mask!3868))))

(assert (=> start!27184 e!178831))

(declare-fun array_inv!4606 (array!14002) Bool)

(assert (=> start!27184 (array_inv!4606 a!3325)))

(assert (=> start!27184 true))

(declare-fun b!281314 () Bool)

(declare-fun res!144386 () Bool)

(assert (=> b!281314 (=> (not res!144386) (not e!178831))))

(declare-datatypes ((List!4451 0))(
  ( (Nil!4448) (Cons!4447 (h!5117 (_ BitVec 64)) (t!9533 List!4451)) )
))
(declare-fun arrayNoDuplicates!0 (array!14002 (_ BitVec 32) List!4451) Bool)

(assert (=> b!281314 (= res!144386 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4448))))

(declare-fun b!281315 () Bool)

(declare-fun res!144380 () Bool)

(assert (=> b!281315 (=> (not res!144380) (not e!178830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14002 (_ BitVec 32)) Bool)

(assert (=> b!281315 (= res!144380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281316 () Bool)

(declare-fun res!144385 () Bool)

(assert (=> b!281316 (=> (not res!144385) (not e!178831))))

(declare-fun arrayContainsKey!0 (array!14002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281316 (= res!144385 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281317 () Bool)

(declare-fun res!144381 () Bool)

(assert (=> b!281317 (=> (not res!144381) (not e!178831))))

(assert (=> b!281317 (= res!144381 (and (= (size!6995 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6995 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6995 a!3325))))))

(declare-fun b!281318 () Bool)

(assert (=> b!281318 (= e!178830 (not true))))

(assert (=> b!281318 (arrayNoDuplicates!0 (array!14003 (store (arr!6643 a!3325) i!1267 k!2581) (size!6995 a!3325)) #b00000000000000000000000000000000 Nil!4448)))

(declare-datatypes ((Unit!8886 0))(
  ( (Unit!8887) )
))
(declare-fun lt!139020 () Unit!8886)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14002 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4451) Unit!8886)

(assert (=> b!281318 (= lt!139020 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4448))))

(assert (= (and start!27184 res!144387) b!281317))

(assert (= (and b!281317 res!144381) b!281311))

(assert (= (and b!281311 res!144384) b!281314))

(assert (= (and b!281314 res!144386) b!281316))

(assert (= (and b!281316 res!144385) b!281313))

(assert (= (and b!281313 res!144383) b!281315))

(assert (= (and b!281315 res!144380) b!281310))

(assert (= (and b!281310 res!144379) b!281312))

(assert (= (and b!281312 res!144382) b!281318))

(declare-fun m!295647 () Bool)

(assert (=> b!281311 m!295647))

(declare-fun m!295649 () Bool)

(assert (=> b!281318 m!295649))

(declare-fun m!295651 () Bool)

(assert (=> b!281318 m!295651))

(declare-fun m!295653 () Bool)

(assert (=> b!281318 m!295653))

(declare-fun m!295655 () Bool)

(assert (=> b!281315 m!295655))

(declare-fun m!295657 () Bool)

(assert (=> b!281313 m!295657))

(declare-fun m!295659 () Bool)

(assert (=> b!281312 m!295659))

(assert (=> b!281312 m!295659))

(declare-fun m!295661 () Bool)

(assert (=> b!281312 m!295661))

(declare-fun m!295663 () Bool)

(assert (=> start!27184 m!295663))

(declare-fun m!295665 () Bool)

(assert (=> start!27184 m!295665))

(declare-fun m!295667 () Bool)

(assert (=> b!281314 m!295667))

(declare-fun m!295669 () Bool)

(assert (=> b!281316 m!295669))

(push 1)

(assert (not b!281316))

(assert (not b!281315))

(assert (not b!281312))

(assert (not b!281313))

(assert (not b!281318))

(assert (not b!281314))

(assert (not b!281311))

(assert (not start!27184))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

