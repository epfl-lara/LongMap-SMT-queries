; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26640 () Bool)

(assert start!26640)

(declare-fun b!276549 () Bool)

(declare-fun res!140540 () Bool)

(declare-fun e!176655 () Bool)

(assert (=> b!276549 (=> (not res!140540) (not e!176655))))

(declare-datatypes ((array!13737 0))(
  ( (array!13738 (arr!6518 (Array (_ BitVec 32) (_ BitVec 64))) (size!6870 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13737)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276549 (= res!140540 (and (= (size!6870 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6870 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6870 a!3325))))))

(declare-fun b!276550 () Bool)

(declare-fun res!140542 () Bool)

(assert (=> b!276550 (=> (not res!140542) (not e!176655))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276550 (= res!140542 (validKeyInArray!0 k!2581))))

(declare-fun b!276551 () Bool)

(declare-fun res!140543 () Bool)

(assert (=> b!276551 (=> (not res!140543) (not e!176655))))

(declare-fun arrayContainsKey!0 (array!13737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276551 (= res!140543 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276552 () Bool)

(declare-fun e!176657 () Bool)

(assert (=> b!276552 (= e!176655 e!176657)))

(declare-fun res!140541 () Bool)

(assert (=> b!276552 (=> (not res!140541) (not e!176657))))

(declare-datatypes ((SeekEntryResult!1676 0))(
  ( (MissingZero!1676 (index!8874 (_ BitVec 32))) (Found!1676 (index!8875 (_ BitVec 32))) (Intermediate!1676 (undefined!2488 Bool) (index!8876 (_ BitVec 32)) (x!27137 (_ BitVec 32))) (Undefined!1676) (MissingVacant!1676 (index!8877 (_ BitVec 32))) )
))
(declare-fun lt!137668 () SeekEntryResult!1676)

(assert (=> b!276552 (= res!140541 (or (= lt!137668 (MissingZero!1676 i!1267)) (= lt!137668 (MissingVacant!1676 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13737 (_ BitVec 32)) SeekEntryResult!1676)

(assert (=> b!276552 (= lt!137668 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276553 () Bool)

(declare-fun res!140539 () Bool)

(assert (=> b!276553 (=> (not res!140539) (not e!176655))))

(declare-datatypes ((List!4326 0))(
  ( (Nil!4323) (Cons!4322 (h!4989 (_ BitVec 64)) (t!9408 List!4326)) )
))
(declare-fun arrayNoDuplicates!0 (array!13737 (_ BitVec 32) List!4326) Bool)

(assert (=> b!276553 (= res!140539 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4323))))

(declare-fun res!140544 () Bool)

(assert (=> start!26640 (=> (not res!140544) (not e!176655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26640 (= res!140544 (validMask!0 mask!3868))))

(assert (=> start!26640 e!176655))

(declare-fun array_inv!4481 (array!13737) Bool)

(assert (=> start!26640 (array_inv!4481 a!3325)))

(assert (=> start!26640 true))

(declare-fun b!276554 () Bool)

(assert (=> b!276554 (= e!176657 false)))

(declare-fun lt!137667 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13737 (_ BitVec 32)) Bool)

(assert (=> b!276554 (= lt!137667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26640 res!140544) b!276549))

(assert (= (and b!276549 res!140540) b!276550))

(assert (= (and b!276550 res!140542) b!276553))

(assert (= (and b!276553 res!140539) b!276551))

(assert (= (and b!276551 res!140543) b!276552))

(assert (= (and b!276552 res!140541) b!276554))

(declare-fun m!291855 () Bool)

(assert (=> b!276550 m!291855))

(declare-fun m!291857 () Bool)

(assert (=> b!276551 m!291857))

(declare-fun m!291859 () Bool)

(assert (=> b!276553 m!291859))

(declare-fun m!291861 () Bool)

(assert (=> b!276554 m!291861))

(declare-fun m!291863 () Bool)

(assert (=> start!26640 m!291863))

(declare-fun m!291865 () Bool)

(assert (=> start!26640 m!291865))

(declare-fun m!291867 () Bool)

(assert (=> b!276552 m!291867))

(push 1)

