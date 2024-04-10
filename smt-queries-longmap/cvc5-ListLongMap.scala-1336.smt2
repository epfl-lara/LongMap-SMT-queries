; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26574 () Bool)

(assert start!26574)

(declare-fun b!275910 () Bool)

(declare-fun e!176360 () Bool)

(declare-fun e!176359 () Bool)

(assert (=> b!275910 (= e!176360 e!176359)))

(declare-fun res!139900 () Bool)

(assert (=> b!275910 (=> (not res!139900) (not e!176359))))

(declare-datatypes ((SeekEntryResult!1643 0))(
  ( (MissingZero!1643 (index!8742 (_ BitVec 32))) (Found!1643 (index!8743 (_ BitVec 32))) (Intermediate!1643 (undefined!2455 Bool) (index!8744 (_ BitVec 32)) (x!27016 (_ BitVec 32))) (Undefined!1643) (MissingVacant!1643 (index!8745 (_ BitVec 32))) )
))
(declare-fun lt!137496 () SeekEntryResult!1643)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275910 (= res!139900 (or (= lt!137496 (MissingZero!1643 i!1267)) (= lt!137496 (MissingVacant!1643 i!1267))))))

(declare-datatypes ((array!13671 0))(
  ( (array!13672 (arr!6485 (Array (_ BitVec 32) (_ BitVec 64))) (size!6837 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13671)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13671 (_ BitVec 32)) SeekEntryResult!1643)

(assert (=> b!275910 (= lt!137496 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275911 () Bool)

(declare-fun res!139902 () Bool)

(assert (=> b!275911 (=> (not res!139902) (not e!176360))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275911 (= res!139902 (and (= (size!6837 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6837 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6837 a!3325))))))

(declare-fun res!139903 () Bool)

(assert (=> start!26574 (=> (not res!139903) (not e!176360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26574 (= res!139903 (validMask!0 mask!3868))))

(assert (=> start!26574 e!176360))

(declare-fun array_inv!4448 (array!13671) Bool)

(assert (=> start!26574 (array_inv!4448 a!3325)))

(assert (=> start!26574 true))

(declare-fun b!275912 () Bool)

(assert (=> b!275912 (= e!176359 false)))

(declare-fun lt!137497 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13671 (_ BitVec 32)) Bool)

(assert (=> b!275912 (= lt!137497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275913 () Bool)

(declare-fun res!139904 () Bool)

(assert (=> b!275913 (=> (not res!139904) (not e!176360))))

(declare-fun arrayContainsKey!0 (array!13671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275913 (= res!139904 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275914 () Bool)

(declare-fun res!139905 () Bool)

(assert (=> b!275914 (=> (not res!139905) (not e!176360))))

(declare-datatypes ((List!4293 0))(
  ( (Nil!4290) (Cons!4289 (h!4956 (_ BitVec 64)) (t!9375 List!4293)) )
))
(declare-fun arrayNoDuplicates!0 (array!13671 (_ BitVec 32) List!4293) Bool)

(assert (=> b!275914 (= res!139905 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4290))))

(declare-fun b!275915 () Bool)

(declare-fun res!139901 () Bool)

(assert (=> b!275915 (=> (not res!139901) (not e!176360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275915 (= res!139901 (validKeyInArray!0 k!2581))))

(assert (= (and start!26574 res!139903) b!275911))

(assert (= (and b!275911 res!139902) b!275915))

(assert (= (and b!275915 res!139901) b!275914))

(assert (= (and b!275914 res!139905) b!275913))

(assert (= (and b!275913 res!139904) b!275910))

(assert (= (and b!275910 res!139900) b!275912))

(declare-fun m!291381 () Bool)

(assert (=> b!275913 m!291381))

(declare-fun m!291383 () Bool)

(assert (=> b!275915 m!291383))

(declare-fun m!291385 () Bool)

(assert (=> b!275910 m!291385))

(declare-fun m!291387 () Bool)

(assert (=> start!26574 m!291387))

(declare-fun m!291389 () Bool)

(assert (=> start!26574 m!291389))

(declare-fun m!291391 () Bool)

(assert (=> b!275914 m!291391))

(declare-fun m!291393 () Bool)

(assert (=> b!275912 m!291393))

(push 1)

(assert (not b!275914))

(assert (not start!26574))

(assert (not b!275910))

