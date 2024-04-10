; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26904 () Bool)

(assert start!26904)

(declare-fun b!278838 () Bool)

(declare-fun res!142179 () Bool)

(declare-fun e!177832 () Bool)

(assert (=> b!278838 (=> (not res!142179) (not e!177832))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278838 (= res!142179 (validKeyInArray!0 k!2581))))

(declare-fun b!278839 () Bool)

(declare-fun e!177833 () Bool)

(assert (=> b!278839 (= e!177832 e!177833)))

(declare-fun res!142177 () Bool)

(assert (=> b!278839 (=> (not res!142177) (not e!177833))))

(declare-datatypes ((SeekEntryResult!1739 0))(
  ( (MissingZero!1739 (index!9126 (_ BitVec 32))) (Found!1739 (index!9127 (_ BitVec 32))) (Intermediate!1739 (undefined!2551 Bool) (index!9128 (_ BitVec 32)) (x!27377 (_ BitVec 32))) (Undefined!1739) (MissingVacant!1739 (index!9129 (_ BitVec 32))) )
))
(declare-fun lt!138496 () SeekEntryResult!1739)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!278839 (= res!142177 (or (= lt!138496 (MissingZero!1739 i!1267)) (= lt!138496 (MissingVacant!1739 i!1267))))))

(declare-datatypes ((array!13869 0))(
  ( (array!13870 (arr!6581 (Array (_ BitVec 32) (_ BitVec 64))) (size!6933 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13869)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13869 (_ BitVec 32)) SeekEntryResult!1739)

(assert (=> b!278839 (= lt!138496 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!278840 () Bool)

(declare-fun res!142182 () Bool)

(assert (=> b!278840 (=> (not res!142182) (not e!177832))))

(declare-fun arrayContainsKey!0 (array!13869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278840 (= res!142182 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278841 () Bool)

(declare-fun res!142180 () Bool)

(assert (=> b!278841 (=> (not res!142180) (not e!177832))))

(declare-datatypes ((List!4389 0))(
  ( (Nil!4386) (Cons!4385 (h!5055 (_ BitVec 64)) (t!9471 List!4389)) )
))
(declare-fun arrayNoDuplicates!0 (array!13869 (_ BitVec 32) List!4389) Bool)

(assert (=> b!278841 (= res!142180 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4386))))

(declare-fun b!278842 () Bool)

(assert (=> b!278842 (= e!177833 false)))

(declare-fun lt!138495 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13869 (_ BitVec 32)) Bool)

(assert (=> b!278842 (= lt!138495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!278843 () Bool)

(declare-fun res!142181 () Bool)

(assert (=> b!278843 (=> (not res!142181) (not e!177832))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!278843 (= res!142181 (and (= (size!6933 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6933 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6933 a!3325))))))

(declare-fun res!142178 () Bool)

(assert (=> start!26904 (=> (not res!142178) (not e!177832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26904 (= res!142178 (validMask!0 mask!3868))))

(assert (=> start!26904 e!177832))

(declare-fun array_inv!4544 (array!13869) Bool)

(assert (=> start!26904 (array_inv!4544 a!3325)))

(assert (=> start!26904 true))

(assert (= (and start!26904 res!142178) b!278843))

(assert (= (and b!278843 res!142181) b!278838))

(assert (= (and b!278838 res!142179) b!278841))

(assert (= (and b!278841 res!142180) b!278840))

(assert (= (and b!278840 res!142182) b!278839))

(assert (= (and b!278839 res!142177) b!278842))

(declare-fun m!293787 () Bool)

(assert (=> b!278839 m!293787))

(declare-fun m!293789 () Bool)

(assert (=> b!278841 m!293789))

(declare-fun m!293791 () Bool)

(assert (=> b!278838 m!293791))

(declare-fun m!293793 () Bool)

(assert (=> b!278842 m!293793))

(declare-fun m!293795 () Bool)

(assert (=> b!278840 m!293795))

(declare-fun m!293797 () Bool)

(assert (=> start!26904 m!293797))

(declare-fun m!293799 () Bool)

(assert (=> start!26904 m!293799))

(push 1)

(assert (not start!26904))

(assert (not b!278838))

