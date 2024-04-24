; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26598 () Bool)

(assert start!26598)

(declare-fun b!276202 () Bool)

(declare-fun res!140166 () Bool)

(declare-fun e!176492 () Bool)

(assert (=> b!276202 (=> (not res!140166) (not e!176492))))

(declare-datatypes ((array!13694 0))(
  ( (array!13695 (arr!6496 (Array (_ BitVec 32) (_ BitVec 64))) (size!6848 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13694)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276202 (= res!140166 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276203 () Bool)

(declare-fun res!140170 () Bool)

(assert (=> b!276203 (=> (not res!140170) (not e!176492))))

(declare-datatypes ((List!4217 0))(
  ( (Nil!4214) (Cons!4213 (h!4880 (_ BitVec 64)) (t!9291 List!4217)) )
))
(declare-fun arrayNoDuplicates!0 (array!13694 (_ BitVec 32) List!4217) Bool)

(assert (=> b!276203 (= res!140170 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4214))))

(declare-fun b!276204 () Bool)

(declare-fun res!140172 () Bool)

(assert (=> b!276204 (=> (not res!140172) (not e!176492))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276204 (= res!140172 (and (= (size!6848 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6848 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6848 a!3325))))))

(declare-fun b!276205 () Bool)

(declare-fun e!176490 () Bool)

(assert (=> b!276205 (= e!176490 (bvslt (bvsub (size!6848 a!3325) startIndex!26) #b00000000000000000000000000000000))))

(declare-fun res!140167 () Bool)

(assert (=> start!26598 (=> (not res!140167) (not e!176492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26598 (= res!140167 (validMask!0 mask!3868))))

(assert (=> start!26598 e!176492))

(declare-fun array_inv!4446 (array!13694) Bool)

(assert (=> start!26598 (array_inv!4446 a!3325)))

(assert (=> start!26598 true))

(declare-fun b!276206 () Bool)

(declare-fun res!140169 () Bool)

(assert (=> b!276206 (=> (not res!140169) (not e!176492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276206 (= res!140169 (validKeyInArray!0 k0!2581))))

(declare-fun b!276207 () Bool)

(declare-fun res!140168 () Bool)

(assert (=> b!276207 (=> (not res!140168) (not e!176490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13694 (_ BitVec 32)) Bool)

(assert (=> b!276207 (= res!140168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276208 () Bool)

(assert (=> b!276208 (= e!176492 e!176490)))

(declare-fun res!140171 () Bool)

(assert (=> b!276208 (=> (not res!140171) (not e!176490))))

(declare-datatypes ((SeekEntryResult!1619 0))(
  ( (MissingZero!1619 (index!8646 (_ BitVec 32))) (Found!1619 (index!8647 (_ BitVec 32))) (Intermediate!1619 (undefined!2431 Bool) (index!8648 (_ BitVec 32)) (x!27024 (_ BitVec 32))) (Undefined!1619) (MissingVacant!1619 (index!8649 (_ BitVec 32))) )
))
(declare-fun lt!137616 () SeekEntryResult!1619)

(assert (=> b!276208 (= res!140171 (or (= lt!137616 (MissingZero!1619 i!1267)) (= lt!137616 (MissingVacant!1619 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13694 (_ BitVec 32)) SeekEntryResult!1619)

(assert (=> b!276208 (= lt!137616 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26598 res!140167) b!276204))

(assert (= (and b!276204 res!140172) b!276206))

(assert (= (and b!276206 res!140169) b!276203))

(assert (= (and b!276203 res!140170) b!276202))

(assert (= (and b!276202 res!140166) b!276208))

(assert (= (and b!276208 res!140171) b!276207))

(assert (= (and b!276207 res!140168) b!276205))

(declare-fun m!291767 () Bool)

(assert (=> b!276203 m!291767))

(declare-fun m!291769 () Bool)

(assert (=> b!276202 m!291769))

(declare-fun m!291771 () Bool)

(assert (=> start!26598 m!291771))

(declare-fun m!291773 () Bool)

(assert (=> start!26598 m!291773))

(declare-fun m!291775 () Bool)

(assert (=> b!276208 m!291775))

(declare-fun m!291777 () Bool)

(assert (=> b!276206 m!291777))

(declare-fun m!291779 () Bool)

(assert (=> b!276207 m!291779))

(check-sat (not b!276203) (not b!276207) (not b!276208) (not b!276206) (not b!276202) (not start!26598))
(check-sat)
