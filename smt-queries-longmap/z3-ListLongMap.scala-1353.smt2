; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26678 () Bool)

(assert start!26678)

(declare-fun res!140770 () Bool)

(declare-fun e!176716 () Bool)

(assert (=> start!26678 (=> (not res!140770) (not e!176716))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26678 (= res!140770 (validMask!0 mask!3868))))

(assert (=> start!26678 e!176716))

(declare-datatypes ((array!13764 0))(
  ( (array!13765 (arr!6531 (Array (_ BitVec 32) (_ BitVec 64))) (size!6884 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13764)

(declare-fun array_inv!4503 (array!13764) Bool)

(assert (=> start!26678 (array_inv!4503 a!3325)))

(assert (=> start!26678 true))

(declare-fun b!276726 () Bool)

(declare-fun res!140771 () Bool)

(assert (=> b!276726 (=> (not res!140771) (not e!176716))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276726 (= res!140771 (validKeyInArray!0 k0!2581))))

(declare-fun b!276727 () Bool)

(declare-fun e!176718 () Bool)

(assert (=> b!276727 (= e!176716 e!176718)))

(declare-fun res!140772 () Bool)

(assert (=> b!276727 (=> (not res!140772) (not e!176718))))

(declare-datatypes ((SeekEntryResult!1688 0))(
  ( (MissingZero!1688 (index!8922 (_ BitVec 32))) (Found!1688 (index!8923 (_ BitVec 32))) (Intermediate!1688 (undefined!2500 Bool) (index!8924 (_ BitVec 32)) (x!27196 (_ BitVec 32))) (Undefined!1688) (MissingVacant!1688 (index!8925 (_ BitVec 32))) )
))
(declare-fun lt!137594 () SeekEntryResult!1688)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276727 (= res!140772 (or (= lt!137594 (MissingZero!1688 i!1267)) (= lt!137594 (MissingVacant!1688 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13764 (_ BitVec 32)) SeekEntryResult!1688)

(assert (=> b!276727 (= lt!137594 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276728 () Bool)

(declare-fun res!140769 () Bool)

(assert (=> b!276728 (=> (not res!140769) (not e!176716))))

(declare-datatypes ((List!4312 0))(
  ( (Nil!4309) (Cons!4308 (h!4975 (_ BitVec 64)) (t!9385 List!4312)) )
))
(declare-fun arrayNoDuplicates!0 (array!13764 (_ BitVec 32) List!4312) Bool)

(assert (=> b!276728 (= res!140769 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4309))))

(declare-fun b!276729 () Bool)

(declare-fun res!140768 () Bool)

(assert (=> b!276729 (=> (not res!140768) (not e!176716))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276729 (= res!140768 (and (= (size!6884 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6884 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6884 a!3325))))))

(declare-fun b!276730 () Bool)

(assert (=> b!276730 (= e!176718 false)))

(declare-fun lt!137595 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13764 (_ BitVec 32)) Bool)

(assert (=> b!276730 (= lt!137595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276731 () Bool)

(declare-fun res!140773 () Bool)

(assert (=> b!276731 (=> (not res!140773) (not e!176716))))

(declare-fun arrayContainsKey!0 (array!13764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276731 (= res!140773 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26678 res!140770) b!276729))

(assert (= (and b!276729 res!140768) b!276726))

(assert (= (and b!276726 res!140771) b!276728))

(assert (= (and b!276728 res!140769) b!276731))

(assert (= (and b!276731 res!140773) b!276727))

(assert (= (and b!276727 res!140772) b!276730))

(declare-fun m!291515 () Bool)

(assert (=> b!276726 m!291515))

(declare-fun m!291517 () Bool)

(assert (=> start!26678 m!291517))

(declare-fun m!291519 () Bool)

(assert (=> start!26678 m!291519))

(declare-fun m!291521 () Bool)

(assert (=> b!276728 m!291521))

(declare-fun m!291523 () Bool)

(assert (=> b!276727 m!291523))

(declare-fun m!291525 () Bool)

(assert (=> b!276731 m!291525))

(declare-fun m!291527 () Bool)

(assert (=> b!276730 m!291527))

(check-sat (not b!276730) (not b!276727) (not b!276728) (not start!26678) (not b!276726) (not b!276731))
(check-sat)
