; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26044 () Bool)

(assert start!26044)

(declare-fun b!268665 () Bool)

(declare-fun e!173496 () Bool)

(assert (=> b!268665 (= e!173496 false)))

(declare-fun lt!134952 () Bool)

(declare-datatypes ((array!13141 0))(
  ( (array!13142 (arr!6220 (Array (_ BitVec 32) (_ BitVec 64))) (size!6572 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13141)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13141 (_ BitVec 32)) Bool)

(assert (=> b!268665 (= lt!134952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268666 () Bool)

(declare-fun e!173498 () Bool)

(assert (=> b!268666 (= e!173498 e!173496)))

(declare-fun res!132944 () Bool)

(assert (=> b!268666 (=> (not res!132944) (not e!173496))))

(declare-datatypes ((SeekEntryResult!1378 0))(
  ( (MissingZero!1378 (index!7682 (_ BitVec 32))) (Found!1378 (index!7683 (_ BitVec 32))) (Intermediate!1378 (undefined!2190 Bool) (index!7684 (_ BitVec 32)) (x!26039 (_ BitVec 32))) (Undefined!1378) (MissingVacant!1378 (index!7685 (_ BitVec 32))) )
))
(declare-fun lt!134953 () SeekEntryResult!1378)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268666 (= res!132944 (or (= lt!134953 (MissingZero!1378 i!1267)) (= lt!134953 (MissingVacant!1378 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13141 (_ BitVec 32)) SeekEntryResult!1378)

(assert (=> b!268666 (= lt!134953 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268667 () Bool)

(declare-fun res!132943 () Bool)

(assert (=> b!268667 (=> (not res!132943) (not e!173498))))

(declare-fun arrayContainsKey!0 (array!13141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268667 (= res!132943 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268668 () Bool)

(declare-fun res!132946 () Bool)

(assert (=> b!268668 (=> (not res!132946) (not e!173498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268668 (= res!132946 (validKeyInArray!0 k!2581))))

(declare-fun b!268669 () Bool)

(declare-fun res!132947 () Bool)

(assert (=> b!268669 (=> (not res!132947) (not e!173498))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268669 (= res!132947 (and (= (size!6572 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6572 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6572 a!3325))))))

(declare-fun res!132948 () Bool)

(assert (=> start!26044 (=> (not res!132948) (not e!173498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26044 (= res!132948 (validMask!0 mask!3868))))

(assert (=> start!26044 e!173498))

(declare-fun array_inv!4183 (array!13141) Bool)

(assert (=> start!26044 (array_inv!4183 a!3325)))

(assert (=> start!26044 true))

(declare-fun b!268670 () Bool)

(declare-fun res!132945 () Bool)

(assert (=> b!268670 (=> (not res!132945) (not e!173498))))

(declare-datatypes ((List!4028 0))(
  ( (Nil!4025) (Cons!4024 (h!4691 (_ BitVec 64)) (t!9110 List!4028)) )
))
(declare-fun arrayNoDuplicates!0 (array!13141 (_ BitVec 32) List!4028) Bool)

(assert (=> b!268670 (= res!132945 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4025))))

(assert (= (and start!26044 res!132948) b!268669))

(assert (= (and b!268669 res!132947) b!268668))

(assert (= (and b!268668 res!132946) b!268670))

(assert (= (and b!268670 res!132945) b!268667))

(assert (= (and b!268667 res!132943) b!268666))

(assert (= (and b!268666 res!132944) b!268665))

(declare-fun m!284743 () Bool)

(assert (=> b!268667 m!284743))

(declare-fun m!284745 () Bool)

(assert (=> b!268665 m!284745))

(declare-fun m!284747 () Bool)

(assert (=> b!268670 m!284747))

(declare-fun m!284749 () Bool)

(assert (=> b!268666 m!284749))

(declare-fun m!284751 () Bool)

(assert (=> b!268668 m!284751))

(declare-fun m!284753 () Bool)

(assert (=> start!26044 m!284753))

(declare-fun m!284755 () Bool)

(assert (=> start!26044 m!284755))

(push 1)

(assert (not b!268668))

(assert (not start!26044))

