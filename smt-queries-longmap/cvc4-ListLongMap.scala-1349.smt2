; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26656 () Bool)

(assert start!26656)

(declare-fun b!276693 () Bool)

(declare-fun e!176729 () Bool)

(declare-fun e!176728 () Bool)

(assert (=> b!276693 (= e!176729 e!176728)))

(declare-fun res!140688 () Bool)

(assert (=> b!276693 (=> (not res!140688) (not e!176728))))

(declare-datatypes ((SeekEntryResult!1684 0))(
  ( (MissingZero!1684 (index!8906 (_ BitVec 32))) (Found!1684 (index!8907 (_ BitVec 32))) (Intermediate!1684 (undefined!2496 Bool) (index!8908 (_ BitVec 32)) (x!27161 (_ BitVec 32))) (Undefined!1684) (MissingVacant!1684 (index!8909 (_ BitVec 32))) )
))
(declare-fun lt!137715 () SeekEntryResult!1684)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276693 (= res!140688 (or (= lt!137715 (MissingZero!1684 i!1267)) (= lt!137715 (MissingVacant!1684 i!1267))))))

(declare-datatypes ((array!13753 0))(
  ( (array!13754 (arr!6526 (Array (_ BitVec 32) (_ BitVec 64))) (size!6878 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13753)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13753 (_ BitVec 32)) SeekEntryResult!1684)

(assert (=> b!276693 (= lt!137715 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276694 () Bool)

(declare-fun res!140685 () Bool)

(assert (=> b!276694 (=> (not res!140685) (not e!176729))))

(declare-fun arrayContainsKey!0 (array!13753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276694 (= res!140685 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276695 () Bool)

(declare-fun res!140684 () Bool)

(assert (=> b!276695 (=> (not res!140684) (not e!176729))))

(declare-datatypes ((List!4334 0))(
  ( (Nil!4331) (Cons!4330 (h!4997 (_ BitVec 64)) (t!9416 List!4334)) )
))
(declare-fun arrayNoDuplicates!0 (array!13753 (_ BitVec 32) List!4334) Bool)

(assert (=> b!276695 (= res!140684 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4331))))

(declare-fun b!276696 () Bool)

(declare-fun res!140686 () Bool)

(assert (=> b!276696 (=> (not res!140686) (not e!176729))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276696 (= res!140686 (and (= (size!6878 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6878 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6878 a!3325))))))

(declare-fun b!276697 () Bool)

(declare-fun res!140683 () Bool)

(assert (=> b!276697 (=> (not res!140683) (not e!176729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276697 (= res!140683 (validKeyInArray!0 k!2581))))

(declare-fun b!276698 () Bool)

(assert (=> b!276698 (= e!176728 false)))

(declare-fun lt!137716 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13753 (_ BitVec 32)) Bool)

(assert (=> b!276698 (= lt!137716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140687 () Bool)

(assert (=> start!26656 (=> (not res!140687) (not e!176729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26656 (= res!140687 (validMask!0 mask!3868))))

(assert (=> start!26656 e!176729))

(declare-fun array_inv!4489 (array!13753) Bool)

(assert (=> start!26656 (array_inv!4489 a!3325)))

(assert (=> start!26656 true))

(assert (= (and start!26656 res!140687) b!276696))

(assert (= (and b!276696 res!140686) b!276697))

(assert (= (and b!276697 res!140683) b!276695))

(assert (= (and b!276695 res!140684) b!276694))

(assert (= (and b!276694 res!140685) b!276693))

(assert (= (and b!276693 res!140688) b!276698))

(declare-fun m!291967 () Bool)

(assert (=> b!276698 m!291967))

(declare-fun m!291969 () Bool)

(assert (=> b!276693 m!291969))

(declare-fun m!291971 () Bool)

(assert (=> b!276694 m!291971))

(declare-fun m!291973 () Bool)

(assert (=> start!26656 m!291973))

(declare-fun m!291975 () Bool)

(assert (=> start!26656 m!291975))

(declare-fun m!291977 () Bool)

(assert (=> b!276697 m!291977))

(declare-fun m!291979 () Bool)

(assert (=> b!276695 m!291979))

(push 1)

(assert (not b!276695))

(assert (not b!276693))

(assert (not b!276694))

(assert (not start!26656))

(assert (not b!276697))

(assert (not b!276698))

(check-sat)

(pop 1)

