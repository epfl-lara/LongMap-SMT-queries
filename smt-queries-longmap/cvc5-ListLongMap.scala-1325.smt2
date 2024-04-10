; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26508 () Bool)

(assert start!26508)

(declare-fun res!139167 () Bool)

(declare-fun e!176061 () Bool)

(assert (=> start!26508 (=> (not res!139167) (not e!176061))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26508 (= res!139167 (validMask!0 mask!3868))))

(assert (=> start!26508 e!176061))

(declare-datatypes ((array!13605 0))(
  ( (array!13606 (arr!6452 (Array (_ BitVec 32) (_ BitVec 64))) (size!6804 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13605)

(declare-fun array_inv!4415 (array!13605) Bool)

(assert (=> start!26508 (array_inv!4415 a!3325)))

(assert (=> start!26508 true))

(declare-fun b!275172 () Bool)

(declare-fun res!139163 () Bool)

(assert (=> b!275172 (=> (not res!139163) (not e!176061))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275172 (= res!139163 (validKeyInArray!0 k!2581))))

(declare-fun b!275173 () Bool)

(declare-fun e!176063 () Bool)

(assert (=> b!275173 (= e!176063 false)))

(declare-fun lt!137298 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13605 (_ BitVec 32)) Bool)

(assert (=> b!275173 (= lt!137298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275174 () Bool)

(declare-fun res!139164 () Bool)

(assert (=> b!275174 (=> (not res!139164) (not e!176061))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275174 (= res!139164 (and (= (size!6804 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6804 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6804 a!3325))))))

(declare-fun b!275175 () Bool)

(declare-fun res!139162 () Bool)

(assert (=> b!275175 (=> (not res!139162) (not e!176061))))

(declare-fun arrayContainsKey!0 (array!13605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275175 (= res!139162 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275176 () Bool)

(declare-fun res!139166 () Bool)

(assert (=> b!275176 (=> (not res!139166) (not e!176061))))

(declare-datatypes ((List!4260 0))(
  ( (Nil!4257) (Cons!4256 (h!4923 (_ BitVec 64)) (t!9342 List!4260)) )
))
(declare-fun arrayNoDuplicates!0 (array!13605 (_ BitVec 32) List!4260) Bool)

(assert (=> b!275176 (= res!139166 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4257))))

(declare-fun b!275177 () Bool)

(assert (=> b!275177 (= e!176061 e!176063)))

(declare-fun res!139165 () Bool)

(assert (=> b!275177 (=> (not res!139165) (not e!176063))))

(declare-datatypes ((SeekEntryResult!1610 0))(
  ( (MissingZero!1610 (index!8610 (_ BitVec 32))) (Found!1610 (index!8611 (_ BitVec 32))) (Intermediate!1610 (undefined!2422 Bool) (index!8612 (_ BitVec 32)) (x!26895 (_ BitVec 32))) (Undefined!1610) (MissingVacant!1610 (index!8613 (_ BitVec 32))) )
))
(declare-fun lt!137299 () SeekEntryResult!1610)

(assert (=> b!275177 (= res!139165 (or (= lt!137299 (MissingZero!1610 i!1267)) (= lt!137299 (MissingVacant!1610 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13605 (_ BitVec 32)) SeekEntryResult!1610)

(assert (=> b!275177 (= lt!137299 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26508 res!139167) b!275174))

(assert (= (and b!275174 res!139164) b!275172))

(assert (= (and b!275172 res!139163) b!275176))

(assert (= (and b!275176 res!139166) b!275175))

(assert (= (and b!275175 res!139162) b!275177))

(assert (= (and b!275177 res!139165) b!275173))

(declare-fun m!290799 () Bool)

(assert (=> b!275173 m!290799))

(declare-fun m!290801 () Bool)

(assert (=> b!275172 m!290801))

(declare-fun m!290803 () Bool)

(assert (=> b!275175 m!290803))

(declare-fun m!290805 () Bool)

(assert (=> b!275176 m!290805))

(declare-fun m!290807 () Bool)

(assert (=> b!275177 m!290807))

(declare-fun m!290809 () Bool)

(assert (=> start!26508 m!290809))

(declare-fun m!290811 () Bool)

(assert (=> start!26508 m!290811))

(push 1)

