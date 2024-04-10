; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27646 () Bool)

(assert start!27646)

(declare-fun b!285381 () Bool)

(declare-fun e!180904 () Bool)

(assert (=> b!285381 (= e!180904 false)))

(declare-fun lt!140802 () Bool)

(declare-datatypes ((array!14251 0))(
  ( (array!14252 (arr!6763 (Array (_ BitVec 32) (_ BitVec 64))) (size!7115 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14251)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14251 (_ BitVec 32)) Bool)

(assert (=> b!285381 (= lt!140802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!147792 () Bool)

(declare-fun e!180903 () Bool)

(assert (=> start!27646 (=> (not res!147792) (not e!180903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27646 (= res!147792 (validMask!0 mask!3868))))

(assert (=> start!27646 e!180903))

(declare-fun array_inv!4726 (array!14251) Bool)

(assert (=> start!27646 (array_inv!4726 a!3325)))

(assert (=> start!27646 true))

(declare-fun b!285382 () Bool)

(assert (=> b!285382 (= e!180903 e!180904)))

(declare-fun res!147788 () Bool)

(assert (=> b!285382 (=> (not res!147788) (not e!180904))))

(declare-datatypes ((SeekEntryResult!1921 0))(
  ( (MissingZero!1921 (index!9854 (_ BitVec 32))) (Found!1921 (index!9855 (_ BitVec 32))) (Intermediate!1921 (undefined!2733 Bool) (index!9856 (_ BitVec 32)) (x!28048 (_ BitVec 32))) (Undefined!1921) (MissingVacant!1921 (index!9857 (_ BitVec 32))) )
))
(declare-fun lt!140803 () SeekEntryResult!1921)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!285382 (= res!147788 (or (= lt!140803 (MissingZero!1921 i!1267)) (= lt!140803 (MissingVacant!1921 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14251 (_ BitVec 32)) SeekEntryResult!1921)

(assert (=> b!285382 (= lt!140803 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!285383 () Bool)

(declare-fun res!147791 () Bool)

(assert (=> b!285383 (=> (not res!147791) (not e!180903))))

(declare-fun arrayContainsKey!0 (array!14251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285383 (= res!147791 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!285384 () Bool)

(declare-fun res!147790 () Bool)

(assert (=> b!285384 (=> (not res!147790) (not e!180903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285384 (= res!147790 (validKeyInArray!0 k!2581))))

(declare-fun b!285385 () Bool)

(declare-fun res!147789 () Bool)

(assert (=> b!285385 (=> (not res!147789) (not e!180903))))

(declare-datatypes ((List!4571 0))(
  ( (Nil!4568) (Cons!4567 (h!5240 (_ BitVec 64)) (t!9653 List!4571)) )
))
(declare-fun arrayNoDuplicates!0 (array!14251 (_ BitVec 32) List!4571) Bool)

(assert (=> b!285385 (= res!147789 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4568))))

(declare-fun b!285386 () Bool)

(declare-fun res!147787 () Bool)

(assert (=> b!285386 (=> (not res!147787) (not e!180903))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!285386 (= res!147787 (and (= (size!7115 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7115 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7115 a!3325))))))

(assert (= (and start!27646 res!147792) b!285386))

(assert (= (and b!285386 res!147787) b!285384))

(assert (= (and b!285384 res!147790) b!285385))

(assert (= (and b!285385 res!147789) b!285383))

(assert (= (and b!285383 res!147791) b!285382))

(assert (= (and b!285382 res!147788) b!285381))

(declare-fun m!300223 () Bool)

(assert (=> b!285383 m!300223))

(declare-fun m!300225 () Bool)

(assert (=> b!285385 m!300225))

(declare-fun m!300227 () Bool)

(assert (=> b!285381 m!300227))

(declare-fun m!300229 () Bool)

(assert (=> b!285384 m!300229))

(declare-fun m!300231 () Bool)

(assert (=> b!285382 m!300231))

(declare-fun m!300233 () Bool)

(assert (=> start!27646 m!300233))

(declare-fun m!300235 () Bool)

(assert (=> start!27646 m!300235))

(push 1)

(assert (not start!27646))

(assert (not b!285381))

(assert (not b!285383))

(assert (not b!285384))

(assert (not b!285385))

(assert (not b!285382))

(check-sat)

(pop 1)

