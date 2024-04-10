; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27168 () Bool)

(assert start!27168)

(declare-fun b!281094 () Bool)

(declare-fun res!144169 () Bool)

(declare-fun e!178758 () Bool)

(assert (=> b!281094 (=> (not res!144169) (not e!178758))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281094 (= res!144169 (validKeyInArray!0 k!2581))))

(declare-fun b!281096 () Bool)

(declare-fun res!144168 () Bool)

(declare-fun e!178760 () Bool)

(assert (=> b!281096 (=> (not res!144168) (not e!178760))))

(declare-datatypes ((array!13986 0))(
  ( (array!13987 (arr!6635 (Array (_ BitVec 32) (_ BitVec 64))) (size!6987 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13986)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13986 (_ BitVec 32)) Bool)

(assert (=> b!281096 (= res!144168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281097 () Bool)

(declare-fun res!144167 () Bool)

(assert (=> b!281097 (=> (not res!144167) (not e!178758))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281097 (= res!144167 (and (= (size!6987 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6987 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6987 a!3325))))))

(declare-fun b!281098 () Bool)

(declare-fun res!144171 () Bool)

(assert (=> b!281098 (=> (not res!144171) (not e!178760))))

(assert (=> b!281098 (= res!144171 (validKeyInArray!0 (select (arr!6635 a!3325) startIndex!26)))))

(declare-fun b!281099 () Bool)

(assert (=> b!281099 (= e!178760 (not true))))

(declare-datatypes ((List!4443 0))(
  ( (Nil!4440) (Cons!4439 (h!5109 (_ BitVec 64)) (t!9525 List!4443)) )
))
(declare-fun arrayNoDuplicates!0 (array!13986 (_ BitVec 32) List!4443) Bool)

(assert (=> b!281099 (arrayNoDuplicates!0 (array!13987 (store (arr!6635 a!3325) i!1267 k!2581) (size!6987 a!3325)) #b00000000000000000000000000000000 Nil!4440)))

(declare-datatypes ((Unit!8870 0))(
  ( (Unit!8871) )
))
(declare-fun lt!138973 () Unit!8870)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13986 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4443) Unit!8870)

(assert (=> b!281099 (= lt!138973 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4440))))

(declare-fun b!281100 () Bool)

(assert (=> b!281100 (= e!178758 e!178760)))

(declare-fun res!144166 () Bool)

(assert (=> b!281100 (=> (not res!144166) (not e!178760))))

(declare-datatypes ((SeekEntryResult!1793 0))(
  ( (MissingZero!1793 (index!9342 (_ BitVec 32))) (Found!1793 (index!9343 (_ BitVec 32))) (Intermediate!1793 (undefined!2605 Bool) (index!9344 (_ BitVec 32)) (x!27575 (_ BitVec 32))) (Undefined!1793) (MissingVacant!1793 (index!9345 (_ BitVec 32))) )
))
(declare-fun lt!138972 () SeekEntryResult!1793)

(assert (=> b!281100 (= res!144166 (or (= lt!138972 (MissingZero!1793 i!1267)) (= lt!138972 (MissingVacant!1793 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13986 (_ BitVec 32)) SeekEntryResult!1793)

(assert (=> b!281100 (= lt!138972 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281101 () Bool)

(declare-fun res!144164 () Bool)

(assert (=> b!281101 (=> (not res!144164) (not e!178758))))

(declare-fun arrayContainsKey!0 (array!13986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281101 (= res!144164 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281102 () Bool)

(declare-fun res!144165 () Bool)

(assert (=> b!281102 (=> (not res!144165) (not e!178758))))

(assert (=> b!281102 (= res!144165 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4440))))

(declare-fun res!144170 () Bool)

(assert (=> start!27168 (=> (not res!144170) (not e!178758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27168 (= res!144170 (validMask!0 mask!3868))))

(assert (=> start!27168 e!178758))

(declare-fun array_inv!4598 (array!13986) Bool)

(assert (=> start!27168 (array_inv!4598 a!3325)))

(assert (=> start!27168 true))

(declare-fun b!281095 () Bool)

(declare-fun res!144163 () Bool)

(assert (=> b!281095 (=> (not res!144163) (not e!178760))))

(assert (=> b!281095 (= res!144163 (not (= startIndex!26 i!1267)))))

(assert (= (and start!27168 res!144170) b!281097))

(assert (= (and b!281097 res!144167) b!281094))

(assert (= (and b!281094 res!144169) b!281102))

(assert (= (and b!281102 res!144165) b!281101))

(assert (= (and b!281101 res!144164) b!281100))

(assert (= (and b!281100 res!144166) b!281096))

(assert (= (and b!281096 res!144168) b!281095))

(assert (= (and b!281095 res!144163) b!281098))

(assert (= (and b!281098 res!144171) b!281099))

(declare-fun m!295455 () Bool)

(assert (=> b!281102 m!295455))

(declare-fun m!295457 () Bool)

(assert (=> b!281096 m!295457))

(declare-fun m!295459 () Bool)

(assert (=> b!281099 m!295459))

(declare-fun m!295461 () Bool)

(assert (=> b!281099 m!295461))

(declare-fun m!295463 () Bool)

(assert (=> b!281099 m!295463))

(declare-fun m!295465 () Bool)

(assert (=> b!281098 m!295465))

(assert (=> b!281098 m!295465))

(declare-fun m!295467 () Bool)

(assert (=> b!281098 m!295467))

(declare-fun m!295469 () Bool)

(assert (=> b!281101 m!295469))

(declare-fun m!295471 () Bool)

(assert (=> b!281094 m!295471))

(declare-fun m!295473 () Bool)

(assert (=> start!27168 m!295473))

(declare-fun m!295475 () Bool)

(assert (=> start!27168 m!295475))

(declare-fun m!295477 () Bool)

(assert (=> b!281100 m!295477))

(push 1)

