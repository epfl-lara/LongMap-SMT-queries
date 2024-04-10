; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26602 () Bool)

(assert start!26602)

(declare-fun res!140187 () Bool)

(declare-fun e!176486 () Bool)

(assert (=> start!26602 (=> (not res!140187) (not e!176486))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26602 (= res!140187 (validMask!0 mask!3868))))

(assert (=> start!26602 e!176486))

(declare-datatypes ((array!13699 0))(
  ( (array!13700 (arr!6499 (Array (_ BitVec 32) (_ BitVec 64))) (size!6851 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13699)

(declare-fun array_inv!4462 (array!13699) Bool)

(assert (=> start!26602 (array_inv!4462 a!3325)))

(assert (=> start!26602 true))

(declare-fun b!276197 () Bool)

(declare-fun e!176484 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276197 (= e!176484 (bvslt (bvsub (size!6851 a!3325) startIndex!26) #b00000000000000000000000000000000))))

(declare-fun b!276198 () Bool)

(declare-fun res!140190 () Bool)

(assert (=> b!276198 (=> (not res!140190) (not e!176484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13699 (_ BitVec 32)) Bool)

(assert (=> b!276198 (= res!140190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276199 () Bool)

(declare-fun res!140188 () Bool)

(assert (=> b!276199 (=> (not res!140188) (not e!176486))))

(declare-datatypes ((List!4307 0))(
  ( (Nil!4304) (Cons!4303 (h!4970 (_ BitVec 64)) (t!9389 List!4307)) )
))
(declare-fun arrayNoDuplicates!0 (array!13699 (_ BitVec 32) List!4307) Bool)

(assert (=> b!276199 (= res!140188 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4304))))

(declare-fun b!276200 () Bool)

(declare-fun res!140191 () Bool)

(assert (=> b!276200 (=> (not res!140191) (not e!176486))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276200 (= res!140191 (validKeyInArray!0 k!2581))))

(declare-fun b!276201 () Bool)

(assert (=> b!276201 (= e!176486 e!176484)))

(declare-fun res!140192 () Bool)

(assert (=> b!276201 (=> (not res!140192) (not e!176484))))

(declare-datatypes ((SeekEntryResult!1657 0))(
  ( (MissingZero!1657 (index!8798 (_ BitVec 32))) (Found!1657 (index!8799 (_ BitVec 32))) (Intermediate!1657 (undefined!2469 Bool) (index!8800 (_ BitVec 32)) (x!27062 (_ BitVec 32))) (Undefined!1657) (MissingVacant!1657 (index!8801 (_ BitVec 32))) )
))
(declare-fun lt!137563 () SeekEntryResult!1657)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276201 (= res!140192 (or (= lt!137563 (MissingZero!1657 i!1267)) (= lt!137563 (MissingVacant!1657 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13699 (_ BitVec 32)) SeekEntryResult!1657)

(assert (=> b!276201 (= lt!137563 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276202 () Bool)

(declare-fun res!140193 () Bool)

(assert (=> b!276202 (=> (not res!140193) (not e!176486))))

(assert (=> b!276202 (= res!140193 (and (= (size!6851 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6851 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6851 a!3325))))))

(declare-fun b!276203 () Bool)

(declare-fun res!140189 () Bool)

(assert (=> b!276203 (=> (not res!140189) (not e!176486))))

(declare-fun arrayContainsKey!0 (array!13699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276203 (= res!140189 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26602 res!140187) b!276202))

(assert (= (and b!276202 res!140193) b!276200))

(assert (= (and b!276200 res!140191) b!276199))

(assert (= (and b!276199 res!140188) b!276203))

(assert (= (and b!276203 res!140189) b!276201))

(assert (= (and b!276201 res!140192) b!276198))

(assert (= (and b!276198 res!140190) b!276197))

(declare-fun m!291589 () Bool)

(assert (=> b!276201 m!291589))

(declare-fun m!291591 () Bool)

(assert (=> b!276203 m!291591))

(declare-fun m!291593 () Bool)

(assert (=> b!276199 m!291593))

(declare-fun m!291595 () Bool)

(assert (=> start!26602 m!291595))

(declare-fun m!291597 () Bool)

(assert (=> start!26602 m!291597))

(declare-fun m!291599 () Bool)

(assert (=> b!276198 m!291599))

(declare-fun m!291601 () Bool)

(assert (=> b!276200 m!291601))

(push 1)

(assert (not b!276198))

(assert (not b!276203))

(assert (not b!276201))

(assert (not start!26602))

(assert (not b!276200))

(assert (not b!276199))

(check-sat)

(pop 1)

(push 1)

(check-sat)

