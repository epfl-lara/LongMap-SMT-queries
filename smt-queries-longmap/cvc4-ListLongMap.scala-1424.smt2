; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27574 () Bool)

(assert start!27574)

(declare-fun b!284880 () Bool)

(declare-fun res!147389 () Bool)

(declare-fun e!180652 () Bool)

(assert (=> b!284880 (=> (not res!147389) (not e!180652))))

(declare-datatypes ((array!14224 0))(
  ( (array!14225 (arr!6751 (Array (_ BitVec 32) (_ BitVec 64))) (size!7103 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14224)

(declare-datatypes ((List!4559 0))(
  ( (Nil!4556) (Cons!4555 (h!5228 (_ BitVec 64)) (t!9641 List!4559)) )
))
(declare-fun arrayNoDuplicates!0 (array!14224 (_ BitVec 32) List!4559) Bool)

(assert (=> b!284880 (= res!147389 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4556))))

(declare-fun b!284881 () Bool)

(declare-fun e!180651 () Bool)

(assert (=> b!284881 (= e!180651 false)))

(declare-fun lt!140650 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14224 (_ BitVec 32)) Bool)

(assert (=> b!284881 (= lt!140650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284882 () Bool)

(assert (=> b!284882 (= e!180652 e!180651)))

(declare-fun res!147390 () Bool)

(assert (=> b!284882 (=> (not res!147390) (not e!180651))))

(declare-datatypes ((SeekEntryResult!1909 0))(
  ( (MissingZero!1909 (index!9806 (_ BitVec 32))) (Found!1909 (index!9807 (_ BitVec 32))) (Intermediate!1909 (undefined!2721 Bool) (index!9808 (_ BitVec 32)) (x!28004 (_ BitVec 32))) (Undefined!1909) (MissingVacant!1909 (index!9809 (_ BitVec 32))) )
))
(declare-fun lt!140649 () SeekEntryResult!1909)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284882 (= res!147390 (or (= lt!140649 (MissingZero!1909 i!1267)) (= lt!140649 (MissingVacant!1909 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14224 (_ BitVec 32)) SeekEntryResult!1909)

(assert (=> b!284882 (= lt!140649 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!147388 () Bool)

(assert (=> start!27574 (=> (not res!147388) (not e!180652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27574 (= res!147388 (validMask!0 mask!3868))))

(assert (=> start!27574 e!180652))

(declare-fun array_inv!4714 (array!14224) Bool)

(assert (=> start!27574 (array_inv!4714 a!3325)))

(assert (=> start!27574 true))

(declare-fun b!284883 () Bool)

(declare-fun res!147391 () Bool)

(assert (=> b!284883 (=> (not res!147391) (not e!180652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284883 (= res!147391 (validKeyInArray!0 k!2581))))

(declare-fun b!284884 () Bool)

(declare-fun res!147392 () Bool)

(assert (=> b!284884 (=> (not res!147392) (not e!180652))))

(declare-fun arrayContainsKey!0 (array!14224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284884 (= res!147392 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284885 () Bool)

(declare-fun res!147393 () Bool)

(assert (=> b!284885 (=> (not res!147393) (not e!180652))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284885 (= res!147393 (and (= (size!7103 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7103 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7103 a!3325))))))

(assert (= (and start!27574 res!147388) b!284885))

(assert (= (and b!284885 res!147393) b!284883))

(assert (= (and b!284883 res!147391) b!284880))

(assert (= (and b!284880 res!147389) b!284884))

(assert (= (and b!284884 res!147392) b!284882))

(assert (= (and b!284882 res!147390) b!284881))

(declare-fun m!299797 () Bool)

(assert (=> b!284884 m!299797))

(declare-fun m!299799 () Bool)

(assert (=> start!27574 m!299799))

(declare-fun m!299801 () Bool)

(assert (=> start!27574 m!299801))

(declare-fun m!299803 () Bool)

(assert (=> b!284880 m!299803))

(declare-fun m!299805 () Bool)

(assert (=> b!284881 m!299805))

(declare-fun m!299807 () Bool)

(assert (=> b!284883 m!299807))

(declare-fun m!299809 () Bool)

(assert (=> b!284882 m!299809))

(push 1)

(assert (not b!284880))

(assert (not b!284884))

(assert (not start!27574))

(assert (not b!284883))

(assert (not b!284882))

(assert (not b!284881))

(check-sat)

