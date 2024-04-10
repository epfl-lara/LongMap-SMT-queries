; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26590 () Bool)

(assert start!26590)

(declare-fun b!276054 () Bool)

(declare-fun res!140047 () Bool)

(declare-fun e!176430 () Bool)

(assert (=> b!276054 (=> (not res!140047) (not e!176430))))

(declare-datatypes ((array!13687 0))(
  ( (array!13688 (arr!6493 (Array (_ BitVec 32) (_ BitVec 64))) (size!6845 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13687)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276054 (= res!140047 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276055 () Bool)

(declare-fun e!176431 () Bool)

(assert (=> b!276055 (= e!176431 false)))

(declare-fun lt!137544 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13687 (_ BitVec 32)) Bool)

(assert (=> b!276055 (= lt!137544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276056 () Bool)

(assert (=> b!276056 (= e!176430 e!176431)))

(declare-fun res!140049 () Bool)

(assert (=> b!276056 (=> (not res!140049) (not e!176431))))

(declare-datatypes ((SeekEntryResult!1651 0))(
  ( (MissingZero!1651 (index!8774 (_ BitVec 32))) (Found!1651 (index!8775 (_ BitVec 32))) (Intermediate!1651 (undefined!2463 Bool) (index!8776 (_ BitVec 32)) (x!27040 (_ BitVec 32))) (Undefined!1651) (MissingVacant!1651 (index!8777 (_ BitVec 32))) )
))
(declare-fun lt!137545 () SeekEntryResult!1651)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276056 (= res!140049 (or (= lt!137545 (MissingZero!1651 i!1267)) (= lt!137545 (MissingVacant!1651 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13687 (_ BitVec 32)) SeekEntryResult!1651)

(assert (=> b!276056 (= lt!137545 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276057 () Bool)

(declare-fun res!140046 () Bool)

(assert (=> b!276057 (=> (not res!140046) (not e!176430))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276057 (= res!140046 (and (= (size!6845 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6845 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6845 a!3325))))))

(declare-fun res!140045 () Bool)

(assert (=> start!26590 (=> (not res!140045) (not e!176430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26590 (= res!140045 (validMask!0 mask!3868))))

(assert (=> start!26590 e!176430))

(declare-fun array_inv!4456 (array!13687) Bool)

(assert (=> start!26590 (array_inv!4456 a!3325)))

(assert (=> start!26590 true))

(declare-fun b!276058 () Bool)

(declare-fun res!140048 () Bool)

(assert (=> b!276058 (=> (not res!140048) (not e!176430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276058 (= res!140048 (validKeyInArray!0 k!2581))))

(declare-fun b!276059 () Bool)

(declare-fun res!140044 () Bool)

(assert (=> b!276059 (=> (not res!140044) (not e!176430))))

(declare-datatypes ((List!4301 0))(
  ( (Nil!4298) (Cons!4297 (h!4964 (_ BitVec 64)) (t!9383 List!4301)) )
))
(declare-fun arrayNoDuplicates!0 (array!13687 (_ BitVec 32) List!4301) Bool)

(assert (=> b!276059 (= res!140044 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4298))))

(assert (= (and start!26590 res!140045) b!276057))

(assert (= (and b!276057 res!140046) b!276058))

(assert (= (and b!276058 res!140048) b!276059))

(assert (= (and b!276059 res!140044) b!276054))

(assert (= (and b!276054 res!140047) b!276056))

(assert (= (and b!276056 res!140049) b!276055))

(declare-fun m!291493 () Bool)

(assert (=> b!276059 m!291493))

(declare-fun m!291495 () Bool)

(assert (=> b!276054 m!291495))

(declare-fun m!291497 () Bool)

(assert (=> b!276055 m!291497))

(declare-fun m!291499 () Bool)

(assert (=> b!276058 m!291499))

(declare-fun m!291501 () Bool)

(assert (=> b!276056 m!291501))

(declare-fun m!291503 () Bool)

(assert (=> start!26590 m!291503))

(declare-fun m!291505 () Bool)

(assert (=> start!26590 m!291505))

(push 1)

(assert (not b!276054))

(assert (not b!276058))

(assert (not b!276059))

(assert (not b!276056))

(assert (not b!276055))

(assert (not start!26590))

(check-sat)

