; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26512 () Bool)

(assert start!26512)

(declare-fun b!275208 () Bool)

(declare-fun res!139203 () Bool)

(declare-fun e!176081 () Bool)

(assert (=> b!275208 (=> (not res!139203) (not e!176081))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275208 (= res!139203 (validKeyInArray!0 k!2581))))

(declare-fun b!275209 () Bool)

(declare-fun e!176080 () Bool)

(assert (=> b!275209 (= e!176081 e!176080)))

(declare-fun res!139201 () Bool)

(assert (=> b!275209 (=> (not res!139201) (not e!176080))))

(declare-datatypes ((SeekEntryResult!1612 0))(
  ( (MissingZero!1612 (index!8618 (_ BitVec 32))) (Found!1612 (index!8619 (_ BitVec 32))) (Intermediate!1612 (undefined!2424 Bool) (index!8620 (_ BitVec 32)) (x!26897 (_ BitVec 32))) (Undefined!1612) (MissingVacant!1612 (index!8621 (_ BitVec 32))) )
))
(declare-fun lt!137311 () SeekEntryResult!1612)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275209 (= res!139201 (or (= lt!137311 (MissingZero!1612 i!1267)) (= lt!137311 (MissingVacant!1612 i!1267))))))

(declare-datatypes ((array!13609 0))(
  ( (array!13610 (arr!6454 (Array (_ BitVec 32) (_ BitVec 64))) (size!6806 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13609)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13609 (_ BitVec 32)) SeekEntryResult!1612)

(assert (=> b!275209 (= lt!137311 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275210 () Bool)

(declare-fun res!139202 () Bool)

(assert (=> b!275210 (=> (not res!139202) (not e!176081))))

(declare-fun arrayContainsKey!0 (array!13609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275210 (= res!139202 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275212 () Bool)

(assert (=> b!275212 (= e!176080 false)))

(declare-fun lt!137310 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13609 (_ BitVec 32)) Bool)

(assert (=> b!275212 (= lt!137310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275213 () Bool)

(declare-fun res!139198 () Bool)

(assert (=> b!275213 (=> (not res!139198) (not e!176081))))

(declare-datatypes ((List!4262 0))(
  ( (Nil!4259) (Cons!4258 (h!4925 (_ BitVec 64)) (t!9344 List!4262)) )
))
(declare-fun arrayNoDuplicates!0 (array!13609 (_ BitVec 32) List!4262) Bool)

(assert (=> b!275213 (= res!139198 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4259))))

(declare-fun b!275211 () Bool)

(declare-fun res!139199 () Bool)

(assert (=> b!275211 (=> (not res!139199) (not e!176081))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275211 (= res!139199 (and (= (size!6806 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6806 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6806 a!3325))))))

(declare-fun res!139200 () Bool)

(assert (=> start!26512 (=> (not res!139200) (not e!176081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26512 (= res!139200 (validMask!0 mask!3868))))

(assert (=> start!26512 e!176081))

(declare-fun array_inv!4417 (array!13609) Bool)

(assert (=> start!26512 (array_inv!4417 a!3325)))

(assert (=> start!26512 true))

(assert (= (and start!26512 res!139200) b!275211))

(assert (= (and b!275211 res!139199) b!275208))

(assert (= (and b!275208 res!139203) b!275213))

(assert (= (and b!275213 res!139198) b!275210))

(assert (= (and b!275210 res!139202) b!275209))

(assert (= (and b!275209 res!139201) b!275212))

(declare-fun m!290827 () Bool)

(assert (=> b!275208 m!290827))

(declare-fun m!290829 () Bool)

(assert (=> b!275212 m!290829))

(declare-fun m!290831 () Bool)

(assert (=> b!275213 m!290831))

(declare-fun m!290833 () Bool)

(assert (=> b!275209 m!290833))

(declare-fun m!290835 () Bool)

(assert (=> start!26512 m!290835))

(declare-fun m!290837 () Bool)

(assert (=> start!26512 m!290837))

(declare-fun m!290839 () Bool)

(assert (=> b!275210 m!290839))

(push 1)

(assert (not b!275209))

(assert (not b!275208))

(assert (not start!26512))

(assert (not b!275210))

(assert (not b!275213))

(assert (not b!275212))

(check-sat)

