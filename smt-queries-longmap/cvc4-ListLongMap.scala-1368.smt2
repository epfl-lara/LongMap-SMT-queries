; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26908 () Bool)

(assert start!26908)

(declare-fun b!278874 () Bool)

(declare-fun e!177851 () Bool)

(declare-fun e!177850 () Bool)

(assert (=> b!278874 (= e!177851 e!177850)))

(declare-fun res!142216 () Bool)

(assert (=> b!278874 (=> (not res!142216) (not e!177850))))

(declare-datatypes ((SeekEntryResult!1741 0))(
  ( (MissingZero!1741 (index!9134 (_ BitVec 32))) (Found!1741 (index!9135 (_ BitVec 32))) (Intermediate!1741 (undefined!2553 Bool) (index!9136 (_ BitVec 32)) (x!27379 (_ BitVec 32))) (Undefined!1741) (MissingVacant!1741 (index!9137 (_ BitVec 32))) )
))
(declare-fun lt!138507 () SeekEntryResult!1741)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!278874 (= res!142216 (or (= lt!138507 (MissingZero!1741 i!1267)) (= lt!138507 (MissingVacant!1741 i!1267))))))

(declare-datatypes ((array!13873 0))(
  ( (array!13874 (arr!6583 (Array (_ BitVec 32) (_ BitVec 64))) (size!6935 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13873)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13873 (_ BitVec 32)) SeekEntryResult!1741)

(assert (=> b!278874 (= lt!138507 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!278875 () Bool)

(declare-fun res!142217 () Bool)

(assert (=> b!278875 (=> (not res!142217) (not e!177851))))

(declare-fun arrayContainsKey!0 (array!13873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278875 (= res!142217 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!278876 () Bool)

(declare-fun res!142218 () Bool)

(assert (=> b!278876 (=> (not res!142218) (not e!177851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278876 (= res!142218 (validKeyInArray!0 k!2581))))

(declare-fun b!278877 () Bool)

(declare-fun res!142213 () Bool)

(assert (=> b!278877 (=> (not res!142213) (not e!177851))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!278877 (= res!142213 (and (= (size!6935 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6935 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6935 a!3325))))))

(declare-fun b!278878 () Bool)

(declare-fun res!142215 () Bool)

(assert (=> b!278878 (=> (not res!142215) (not e!177851))))

(declare-datatypes ((List!4391 0))(
  ( (Nil!4388) (Cons!4387 (h!5057 (_ BitVec 64)) (t!9473 List!4391)) )
))
(declare-fun arrayNoDuplicates!0 (array!13873 (_ BitVec 32) List!4391) Bool)

(assert (=> b!278878 (= res!142215 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4388))))

(declare-fun b!278879 () Bool)

(assert (=> b!278879 (= e!177850 false)))

(declare-fun lt!138508 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13873 (_ BitVec 32)) Bool)

(assert (=> b!278879 (= lt!138508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!142214 () Bool)

(assert (=> start!26908 (=> (not res!142214) (not e!177851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26908 (= res!142214 (validMask!0 mask!3868))))

(assert (=> start!26908 e!177851))

(declare-fun array_inv!4546 (array!13873) Bool)

(assert (=> start!26908 (array_inv!4546 a!3325)))

(assert (=> start!26908 true))

(assert (= (and start!26908 res!142214) b!278877))

(assert (= (and b!278877 res!142213) b!278876))

(assert (= (and b!278876 res!142218) b!278878))

(assert (= (and b!278878 res!142215) b!278875))

(assert (= (and b!278875 res!142217) b!278874))

(assert (= (and b!278874 res!142216) b!278879))

(declare-fun m!293815 () Bool)

(assert (=> b!278876 m!293815))

(declare-fun m!293817 () Bool)

(assert (=> b!278874 m!293817))

(declare-fun m!293819 () Bool)

(assert (=> start!26908 m!293819))

(declare-fun m!293821 () Bool)

(assert (=> start!26908 m!293821))

(declare-fun m!293823 () Bool)

(assert (=> b!278875 m!293823))

(declare-fun m!293825 () Bool)

(assert (=> b!278879 m!293825))

(declare-fun m!293827 () Bool)

(assert (=> b!278878 m!293827))

(push 1)

(assert (not b!278876))

(assert (not start!26908))

(assert (not b!278874))

(assert (not b!278878))

(assert (not b!278879))

(assert (not b!278875))

(check-sat)

