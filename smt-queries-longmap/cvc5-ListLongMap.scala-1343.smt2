; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26616 () Bool)

(assert start!26616)

(declare-fun b!276324 () Bool)

(declare-fun res!140317 () Bool)

(declare-fun e!176548 () Bool)

(assert (=> b!276324 (=> (not res!140317) (not e!176548))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276324 (= res!140317 (validKeyInArray!0 k!2581))))

(declare-fun b!276325 () Bool)

(declare-fun e!176547 () Bool)

(assert (=> b!276325 (= e!176547 false)))

(declare-fun lt!137605 () Bool)

(declare-datatypes ((array!13713 0))(
  ( (array!13714 (arr!6506 (Array (_ BitVec 32) (_ BitVec 64))) (size!6858 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13713)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13713 (_ BitVec 32)) Bool)

(assert (=> b!276325 (= lt!137605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276326 () Bool)

(declare-fun res!140319 () Bool)

(assert (=> b!276326 (=> (not res!140319) (not e!176548))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276326 (= res!140319 (and (= (size!6858 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6858 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6858 a!3325))))))

(declare-fun b!276327 () Bool)

(declare-fun res!140315 () Bool)

(assert (=> b!276327 (=> (not res!140315) (not e!176548))))

(declare-fun arrayContainsKey!0 (array!13713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276327 (= res!140315 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276328 () Bool)

(declare-fun res!140314 () Bool)

(assert (=> b!276328 (=> (not res!140314) (not e!176548))))

(declare-datatypes ((List!4314 0))(
  ( (Nil!4311) (Cons!4310 (h!4977 (_ BitVec 64)) (t!9396 List!4314)) )
))
(declare-fun arrayNoDuplicates!0 (array!13713 (_ BitVec 32) List!4314) Bool)

(assert (=> b!276328 (= res!140314 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4311))))

(declare-fun b!276329 () Bool)

(assert (=> b!276329 (= e!176548 e!176547)))

(declare-fun res!140316 () Bool)

(assert (=> b!276329 (=> (not res!140316) (not e!176547))))

(declare-datatypes ((SeekEntryResult!1664 0))(
  ( (MissingZero!1664 (index!8826 (_ BitVec 32))) (Found!1664 (index!8827 (_ BitVec 32))) (Intermediate!1664 (undefined!2476 Bool) (index!8828 (_ BitVec 32)) (x!27093 (_ BitVec 32))) (Undefined!1664) (MissingVacant!1664 (index!8829 (_ BitVec 32))) )
))
(declare-fun lt!137604 () SeekEntryResult!1664)

(assert (=> b!276329 (= res!140316 (or (= lt!137604 (MissingZero!1664 i!1267)) (= lt!137604 (MissingVacant!1664 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13713 (_ BitVec 32)) SeekEntryResult!1664)

(assert (=> b!276329 (= lt!137604 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!140318 () Bool)

(assert (=> start!26616 (=> (not res!140318) (not e!176548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26616 (= res!140318 (validMask!0 mask!3868))))

(assert (=> start!26616 e!176548))

(declare-fun array_inv!4469 (array!13713) Bool)

(assert (=> start!26616 (array_inv!4469 a!3325)))

(assert (=> start!26616 true))

(assert (= (and start!26616 res!140318) b!276326))

(assert (= (and b!276326 res!140319) b!276324))

(assert (= (and b!276324 res!140317) b!276328))

(assert (= (and b!276328 res!140314) b!276327))

(assert (= (and b!276327 res!140315) b!276329))

(assert (= (and b!276329 res!140316) b!276325))

(declare-fun m!291687 () Bool)

(assert (=> b!276327 m!291687))

(declare-fun m!291689 () Bool)

(assert (=> b!276324 m!291689))

(declare-fun m!291691 () Bool)

(assert (=> b!276329 m!291691))

(declare-fun m!291693 () Bool)

(assert (=> b!276328 m!291693))

(declare-fun m!291695 () Bool)

(assert (=> start!26616 m!291695))

(declare-fun m!291697 () Bool)

(assert (=> start!26616 m!291697))

(declare-fun m!291699 () Bool)

(assert (=> b!276325 m!291699))

(push 1)

(assert (not start!26616))

(assert (not b!276329))

(assert (not b!276325))

