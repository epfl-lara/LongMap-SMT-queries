; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26598 () Bool)

(assert start!26598)

(declare-fun b!276156 () Bool)

(declare-fun res!140151 () Bool)

(declare-fun e!176468 () Bool)

(assert (=> b!276156 (=> (not res!140151) (not e!176468))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276156 (= res!140151 (validKeyInArray!0 k!2581))))

(declare-fun b!276157 () Bool)

(declare-fun e!176467 () Bool)

(assert (=> b!276157 (= e!176468 e!176467)))

(declare-fun res!140150 () Bool)

(assert (=> b!276157 (=> (not res!140150) (not e!176467))))

(declare-datatypes ((SeekEntryResult!1655 0))(
  ( (MissingZero!1655 (index!8790 (_ BitVec 32))) (Found!1655 (index!8791 (_ BitVec 32))) (Intermediate!1655 (undefined!2467 Bool) (index!8792 (_ BitVec 32)) (x!27060 (_ BitVec 32))) (Undefined!1655) (MissingVacant!1655 (index!8793 (_ BitVec 32))) )
))
(declare-fun lt!137557 () SeekEntryResult!1655)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276157 (= res!140150 (or (= lt!137557 (MissingZero!1655 i!1267)) (= lt!137557 (MissingVacant!1655 i!1267))))))

(declare-datatypes ((array!13695 0))(
  ( (array!13696 (arr!6497 (Array (_ BitVec 32) (_ BitVec 64))) (size!6849 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13695)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13695 (_ BitVec 32)) SeekEntryResult!1655)

(assert (=> b!276157 (= lt!137557 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276158 () Bool)

(declare-fun res!140147 () Bool)

(assert (=> b!276158 (=> (not res!140147) (not e!176468))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276158 (= res!140147 (and (= (size!6849 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6849 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6849 a!3325))))))

(declare-fun b!276159 () Bool)

(declare-fun res!140145 () Bool)

(assert (=> b!276159 (=> (not res!140145) (not e!176468))))

(declare-datatypes ((List!4305 0))(
  ( (Nil!4302) (Cons!4301 (h!4968 (_ BitVec 64)) (t!9387 List!4305)) )
))
(declare-fun arrayNoDuplicates!0 (array!13695 (_ BitVec 32) List!4305) Bool)

(assert (=> b!276159 (= res!140145 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4302))))

(declare-fun b!276160 () Bool)

(assert (=> b!276160 (= e!176467 (bvslt (bvsub (size!6849 a!3325) startIndex!26) #b00000000000000000000000000000000))))

(declare-fun b!276161 () Bool)

(declare-fun res!140148 () Bool)

(assert (=> b!276161 (=> (not res!140148) (not e!176468))))

(declare-fun arrayContainsKey!0 (array!13695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276161 (= res!140148 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!140146 () Bool)

(assert (=> start!26598 (=> (not res!140146) (not e!176468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26598 (= res!140146 (validMask!0 mask!3868))))

(assert (=> start!26598 e!176468))

(declare-fun array_inv!4460 (array!13695) Bool)

(assert (=> start!26598 (array_inv!4460 a!3325)))

(assert (=> start!26598 true))

(declare-fun b!276155 () Bool)

(declare-fun res!140149 () Bool)

(assert (=> b!276155 (=> (not res!140149) (not e!176467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13695 (_ BitVec 32)) Bool)

(assert (=> b!276155 (= res!140149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26598 res!140146) b!276158))

(assert (= (and b!276158 res!140147) b!276156))

(assert (= (and b!276156 res!140151) b!276159))

(assert (= (and b!276159 res!140145) b!276161))

(assert (= (and b!276161 res!140148) b!276157))

(assert (= (and b!276157 res!140150) b!276155))

(assert (= (and b!276155 res!140149) b!276160))

(declare-fun m!291561 () Bool)

(assert (=> b!276159 m!291561))

(declare-fun m!291563 () Bool)

(assert (=> b!276161 m!291563))

(declare-fun m!291565 () Bool)

(assert (=> b!276155 m!291565))

(declare-fun m!291567 () Bool)

(assert (=> b!276157 m!291567))

(declare-fun m!291569 () Bool)

(assert (=> start!26598 m!291569))

(declare-fun m!291571 () Bool)

(assert (=> start!26598 m!291571))

(declare-fun m!291573 () Bool)

(assert (=> b!276156 m!291573))

(push 1)

(assert (not b!276159))

(assert (not b!276156))

(assert (not b!276155))

(assert (not b!276161))

(assert (not b!276157))

(assert (not start!26598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

