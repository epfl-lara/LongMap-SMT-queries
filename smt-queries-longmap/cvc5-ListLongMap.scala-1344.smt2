; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26628 () Bool)

(assert start!26628)

(declare-fun b!276267 () Bool)

(declare-fun res!140309 () Bool)

(declare-fun e!176492 () Bool)

(assert (=> b!276267 (=> (not res!140309) (not e!176492))))

(declare-datatypes ((array!13714 0))(
  ( (array!13715 (arr!6506 (Array (_ BitVec 32) (_ BitVec 64))) (size!6859 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13714)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276267 (= res!140309 (and (= (size!6859 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6859 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6859 a!3325))))))

(declare-fun b!276268 () Bool)

(declare-fun e!176491 () Bool)

(assert (=> b!276268 (= e!176491 false)))

(declare-fun lt!137454 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13714 (_ BitVec 32)) Bool)

(assert (=> b!276268 (= lt!137454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276269 () Bool)

(assert (=> b!276269 (= e!176492 e!176491)))

(declare-fun res!140312 () Bool)

(assert (=> b!276269 (=> (not res!140312) (not e!176491))))

(declare-datatypes ((SeekEntryResult!1663 0))(
  ( (MissingZero!1663 (index!8822 (_ BitVec 32))) (Found!1663 (index!8823 (_ BitVec 32))) (Intermediate!1663 (undefined!2475 Bool) (index!8824 (_ BitVec 32)) (x!27099 (_ BitVec 32))) (Undefined!1663) (MissingVacant!1663 (index!8825 (_ BitVec 32))) )
))
(declare-fun lt!137453 () SeekEntryResult!1663)

(assert (=> b!276269 (= res!140312 (or (= lt!137453 (MissingZero!1663 i!1267)) (= lt!137453 (MissingVacant!1663 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13714 (_ BitVec 32)) SeekEntryResult!1663)

(assert (=> b!276269 (= lt!137453 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!140310 () Bool)

(assert (=> start!26628 (=> (not res!140310) (not e!176492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26628 (= res!140310 (validMask!0 mask!3868))))

(assert (=> start!26628 e!176492))

(declare-fun array_inv!4478 (array!13714) Bool)

(assert (=> start!26628 (array_inv!4478 a!3325)))

(assert (=> start!26628 true))

(declare-fun b!276270 () Bool)

(declare-fun res!140313 () Bool)

(assert (=> b!276270 (=> (not res!140313) (not e!176492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276270 (= res!140313 (validKeyInArray!0 k!2581))))

(declare-fun b!276271 () Bool)

(declare-fun res!140311 () Bool)

(assert (=> b!276271 (=> (not res!140311) (not e!176492))))

(declare-datatypes ((List!4287 0))(
  ( (Nil!4284) (Cons!4283 (h!4950 (_ BitVec 64)) (t!9360 List!4287)) )
))
(declare-fun arrayNoDuplicates!0 (array!13714 (_ BitVec 32) List!4287) Bool)

(assert (=> b!276271 (= res!140311 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4284))))

(declare-fun b!276272 () Bool)

(declare-fun res!140314 () Bool)

(assert (=> b!276272 (=> (not res!140314) (not e!176492))))

(declare-fun arrayContainsKey!0 (array!13714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276272 (= res!140314 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26628 res!140310) b!276267))

(assert (= (and b!276267 res!140309) b!276270))

(assert (= (and b!276270 res!140313) b!276271))

(assert (= (and b!276271 res!140311) b!276272))

(assert (= (and b!276272 res!140314) b!276269))

(assert (= (and b!276269 res!140312) b!276268))

(declare-fun m!291165 () Bool)

(assert (=> b!276269 m!291165))

(declare-fun m!291167 () Bool)

(assert (=> b!276272 m!291167))

(declare-fun m!291169 () Bool)

(assert (=> b!276268 m!291169))

(declare-fun m!291171 () Bool)

(assert (=> b!276271 m!291171))

(declare-fun m!291173 () Bool)

(assert (=> b!276270 m!291173))

(declare-fun m!291175 () Bool)

(assert (=> start!26628 m!291175))

(declare-fun m!291177 () Bool)

(assert (=> start!26628 m!291177))

(push 1)

(assert (not b!276271))

(assert (not b!276269))

(assert (not b!276272))

(assert (not b!276268))

(assert (not b!276270))

(assert (not start!26628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

