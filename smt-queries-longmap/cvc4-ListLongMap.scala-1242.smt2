; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26014 () Bool)

(assert start!26014)

(declare-fun b!268394 () Bool)

(declare-fun e!173363 () Bool)

(declare-datatypes ((array!13111 0))(
  ( (array!13112 (arr!6205 (Array (_ BitVec 32) (_ BitVec 64))) (size!6557 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13111)

(assert (=> b!268394 (= e!173363 (bvsgt #b00000000000000000000000000000000 (size!6557 a!3325)))))

(declare-fun b!268395 () Bool)

(declare-fun res!132672 () Bool)

(declare-fun e!173362 () Bool)

(assert (=> b!268395 (=> (not res!132672) (not e!173362))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268395 (= res!132672 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268396 () Bool)

(assert (=> b!268396 (= e!173362 e!173363)))

(declare-fun res!132674 () Bool)

(assert (=> b!268396 (=> (not res!132674) (not e!173363))))

(declare-datatypes ((SeekEntryResult!1363 0))(
  ( (MissingZero!1363 (index!7622 (_ BitVec 32))) (Found!1363 (index!7623 (_ BitVec 32))) (Intermediate!1363 (undefined!2175 Bool) (index!7624 (_ BitVec 32)) (x!25984 (_ BitVec 32))) (Undefined!1363) (MissingVacant!1363 (index!7625 (_ BitVec 32))) )
))
(declare-fun lt!134863 () SeekEntryResult!1363)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268396 (= res!132674 (or (= lt!134863 (MissingZero!1363 i!1267)) (= lt!134863 (MissingVacant!1363 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13111 (_ BitVec 32)) SeekEntryResult!1363)

(assert (=> b!268396 (= lt!134863 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268397 () Bool)

(declare-fun res!132677 () Bool)

(assert (=> b!268397 (=> (not res!132677) (not e!173362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268397 (= res!132677 (validKeyInArray!0 k!2581))))

(declare-fun b!268398 () Bool)

(declare-fun res!132676 () Bool)

(assert (=> b!268398 (=> (not res!132676) (not e!173362))))

(declare-datatypes ((List!4013 0))(
  ( (Nil!4010) (Cons!4009 (h!4676 (_ BitVec 64)) (t!9095 List!4013)) )
))
(declare-fun arrayNoDuplicates!0 (array!13111 (_ BitVec 32) List!4013) Bool)

(assert (=> b!268398 (= res!132676 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4010))))

(declare-fun b!268399 () Bool)

(declare-fun res!132675 () Bool)

(assert (=> b!268399 (=> (not res!132675) (not e!173363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13111 (_ BitVec 32)) Bool)

(assert (=> b!268399 (= res!132675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268400 () Bool)

(declare-fun res!132673 () Bool)

(assert (=> b!268400 (=> (not res!132673) (not e!173362))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268400 (= res!132673 (and (= (size!6557 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6557 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6557 a!3325))))))

(declare-fun res!132678 () Bool)

(assert (=> start!26014 (=> (not res!132678) (not e!173362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26014 (= res!132678 (validMask!0 mask!3868))))

(assert (=> start!26014 e!173362))

(declare-fun array_inv!4168 (array!13111) Bool)

(assert (=> start!26014 (array_inv!4168 a!3325)))

(assert (=> start!26014 true))

(assert (= (and start!26014 res!132678) b!268400))

(assert (= (and b!268400 res!132673) b!268397))

(assert (= (and b!268397 res!132677) b!268398))

(assert (= (and b!268398 res!132676) b!268395))

(assert (= (and b!268395 res!132672) b!268396))

(assert (= (and b!268396 res!132674) b!268399))

(assert (= (and b!268399 res!132675) b!268394))

(declare-fun m!284533 () Bool)

(assert (=> b!268396 m!284533))

(declare-fun m!284535 () Bool)

(assert (=> b!268395 m!284535))

(declare-fun m!284537 () Bool)

(assert (=> b!268399 m!284537))

(declare-fun m!284539 () Bool)

(assert (=> b!268397 m!284539))

(declare-fun m!284541 () Bool)

(assert (=> start!26014 m!284541))

(declare-fun m!284543 () Bool)

(assert (=> start!26014 m!284543))

(declare-fun m!284545 () Bool)

(assert (=> b!268398 m!284545))

(push 1)

(assert (not b!268397))

(assert (not b!268398))

(assert (not b!268395))

(assert (not start!26014))

(assert (not b!268396))

(assert (not b!268399))

(check-sat)

