; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26592 () Bool)

(assert start!26592)

(declare-fun b!276078 () Bool)

(declare-fun res!140071 () Bool)

(declare-fun e!176439 () Bool)

(assert (=> b!276078 (=> (not res!140071) (not e!176439))))

(declare-datatypes ((array!13689 0))(
  ( (array!13690 (arr!6494 (Array (_ BitVec 32) (_ BitVec 64))) (size!6846 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13689)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276078 (= res!140071 (not (validKeyInArray!0 (select (arr!6494 a!3325) startIndex!26))))))

(declare-fun b!276079 () Bool)

(assert (=> b!276079 (= e!176439 (and (bvsge startIndex!26 (bvsub (size!6846 a!3325) #b00000000000000000000000000000001)) (bvsgt startIndex!26 (size!6846 a!3325))))))

(declare-fun b!276080 () Bool)

(declare-fun res!140069 () Bool)

(declare-fun e!176440 () Bool)

(assert (=> b!276080 (=> (not res!140069) (not e!176440))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276080 (= res!140069 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276081 () Bool)

(declare-fun res!140073 () Bool)

(assert (=> b!276081 (=> (not res!140073) (not e!176440))))

(assert (=> b!276081 (= res!140073 (validKeyInArray!0 k!2581))))

(declare-fun b!276082 () Bool)

(declare-fun res!140068 () Bool)

(assert (=> b!276082 (=> (not res!140068) (not e!176440))))

(declare-datatypes ((List!4302 0))(
  ( (Nil!4299) (Cons!4298 (h!4965 (_ BitVec 64)) (t!9384 List!4302)) )
))
(declare-fun arrayNoDuplicates!0 (array!13689 (_ BitVec 32) List!4302) Bool)

(assert (=> b!276082 (= res!140068 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4299))))

(declare-fun b!276083 () Bool)

(declare-fun res!140070 () Bool)

(assert (=> b!276083 (=> (not res!140070) (not e!176440))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276083 (= res!140070 (and (= (size!6846 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6846 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6846 a!3325))))))

(declare-fun b!276085 () Bool)

(assert (=> b!276085 (= e!176440 e!176439)))

(declare-fun res!140074 () Bool)

(assert (=> b!276085 (=> (not res!140074) (not e!176439))))

(declare-datatypes ((SeekEntryResult!1652 0))(
  ( (MissingZero!1652 (index!8778 (_ BitVec 32))) (Found!1652 (index!8779 (_ BitVec 32))) (Intermediate!1652 (undefined!2464 Bool) (index!8780 (_ BitVec 32)) (x!27049 (_ BitVec 32))) (Undefined!1652) (MissingVacant!1652 (index!8781 (_ BitVec 32))) )
))
(declare-fun lt!137548 () SeekEntryResult!1652)

(assert (=> b!276085 (= res!140074 (or (= lt!137548 (MissingZero!1652 i!1267)) (= lt!137548 (MissingVacant!1652 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13689 (_ BitVec 32)) SeekEntryResult!1652)

(assert (=> b!276085 (= lt!137548 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276086 () Bool)

(declare-fun res!140075 () Bool)

(assert (=> b!276086 (=> (not res!140075) (not e!176439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13689 (_ BitVec 32)) Bool)

(assert (=> b!276086 (= res!140075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140076 () Bool)

(assert (=> start!26592 (=> (not res!140076) (not e!176440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26592 (= res!140076 (validMask!0 mask!3868))))

(assert (=> start!26592 e!176440))

(declare-fun array_inv!4457 (array!13689) Bool)

(assert (=> start!26592 (array_inv!4457 a!3325)))

(assert (=> start!26592 true))

(declare-fun b!276084 () Bool)

(declare-fun res!140072 () Bool)

(assert (=> b!276084 (=> (not res!140072) (not e!176439))))

(assert (=> b!276084 (= res!140072 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26592 res!140076) b!276083))

(assert (= (and b!276083 res!140070) b!276081))

(assert (= (and b!276081 res!140073) b!276082))

(assert (= (and b!276082 res!140068) b!276080))

(assert (= (and b!276080 res!140069) b!276085))

(assert (= (and b!276085 res!140074) b!276086))

(assert (= (and b!276086 res!140075) b!276084))

(assert (= (and b!276084 res!140072) b!276078))

(assert (= (and b!276078 res!140071) b!276079))

(declare-fun m!291507 () Bool)

(assert (=> b!276081 m!291507))

(declare-fun m!291509 () Bool)

(assert (=> start!26592 m!291509))

(declare-fun m!291511 () Bool)

(assert (=> start!26592 m!291511))

(declare-fun m!291513 () Bool)

(assert (=> b!276086 m!291513))

(declare-fun m!291515 () Bool)

(assert (=> b!276082 m!291515))

(declare-fun m!291517 () Bool)

(assert (=> b!276085 m!291517))

(declare-fun m!291519 () Bool)

(assert (=> b!276078 m!291519))

(assert (=> b!276078 m!291519))

(declare-fun m!291521 () Bool)

(assert (=> b!276078 m!291521))

(declare-fun m!291523 () Bool)

(assert (=> b!276080 m!291523))

(push 1)

(assert (not start!26592))

(assert (not b!276081))

(assert (not b!276085))

(assert (not b!276082))

(assert (not b!276078))

(assert (not b!276080))

(assert (not b!276086))

(check-sat)

(pop 1)

(push 1)

(check-sat)

