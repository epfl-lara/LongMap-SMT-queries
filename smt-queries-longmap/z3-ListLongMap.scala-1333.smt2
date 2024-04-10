; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26558 () Bool)

(assert start!26558)

(declare-fun b!275678 () Bool)

(declare-fun res!139676 () Bool)

(declare-fun e!176287 () Bool)

(assert (=> b!275678 (=> (not res!139676) (not e!176287))))

(declare-datatypes ((array!13655 0))(
  ( (array!13656 (arr!6477 (Array (_ BitVec 32) (_ BitVec 64))) (size!6829 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13655)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275678 (= res!139676 (and (= (size!6829 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6829 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6829 a!3325))))))

(declare-fun b!275679 () Bool)

(declare-fun res!139675 () Bool)

(declare-fun e!176286 () Bool)

(assert (=> b!275679 (=> (not res!139675) (not e!176286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13655 (_ BitVec 32)) Bool)

(assert (=> b!275679 (= res!139675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!139677 () Bool)

(assert (=> start!26558 (=> (not res!139677) (not e!176287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26558 (= res!139677 (validMask!0 mask!3868))))

(assert (=> start!26558 e!176287))

(declare-fun array_inv!4440 (array!13655) Bool)

(assert (=> start!26558 (array_inv!4440 a!3325)))

(assert (=> start!26558 true))

(declare-fun b!275680 () Bool)

(assert (=> b!275680 (= e!176287 e!176286)))

(declare-fun res!139669 () Bool)

(assert (=> b!275680 (=> (not res!139669) (not e!176286))))

(declare-datatypes ((SeekEntryResult!1635 0))(
  ( (MissingZero!1635 (index!8710 (_ BitVec 32))) (Found!1635 (index!8711 (_ BitVec 32))) (Intermediate!1635 (undefined!2447 Bool) (index!8712 (_ BitVec 32)) (x!26984 (_ BitVec 32))) (Undefined!1635) (MissingVacant!1635 (index!8713 (_ BitVec 32))) )
))
(declare-fun lt!137448 () SeekEntryResult!1635)

(assert (=> b!275680 (= res!139669 (or (= lt!137448 (MissingZero!1635 i!1267)) (= lt!137448 (MissingVacant!1635 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13655 (_ BitVec 32)) SeekEntryResult!1635)

(assert (=> b!275680 (= lt!137448 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275681 () Bool)

(assert (=> b!275681 (= e!176286 (not true))))

(assert (=> b!275681 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13656 (store (arr!6477 a!3325) i!1267 k0!2581) (size!6829 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8685 0))(
  ( (Unit!8686) )
))
(declare-fun lt!137449 () Unit!8685)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13655 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8685)

(assert (=> b!275681 (= lt!137449 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275682 () Bool)

(declare-fun res!139674 () Bool)

(assert (=> b!275682 (=> (not res!139674) (not e!176286))))

(assert (=> b!275682 (= res!139674 (and (bvslt startIndex!26 (bvsub (size!6829 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275683 () Bool)

(declare-fun res!139670 () Bool)

(assert (=> b!275683 (=> (not res!139670) (not e!176287))))

(declare-datatypes ((List!4285 0))(
  ( (Nil!4282) (Cons!4281 (h!4948 (_ BitVec 64)) (t!9367 List!4285)) )
))
(declare-fun arrayNoDuplicates!0 (array!13655 (_ BitVec 32) List!4285) Bool)

(assert (=> b!275683 (= res!139670 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4282))))

(declare-fun b!275684 () Bool)

(declare-fun res!139673 () Bool)

(assert (=> b!275684 (=> (not res!139673) (not e!176286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275684 (= res!139673 (not (validKeyInArray!0 (select (arr!6477 a!3325) startIndex!26))))))

(declare-fun b!275685 () Bool)

(declare-fun res!139672 () Bool)

(assert (=> b!275685 (=> (not res!139672) (not e!176286))))

(assert (=> b!275685 (= res!139672 (not (= startIndex!26 i!1267)))))

(declare-fun b!275686 () Bool)

(declare-fun res!139668 () Bool)

(assert (=> b!275686 (=> (not res!139668) (not e!176287))))

(assert (=> b!275686 (= res!139668 (validKeyInArray!0 k0!2581))))

(declare-fun b!275687 () Bool)

(declare-fun res!139671 () Bool)

(assert (=> b!275687 (=> (not res!139671) (not e!176287))))

(declare-fun arrayContainsKey!0 (array!13655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275687 (= res!139671 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26558 res!139677) b!275678))

(assert (= (and b!275678 res!139676) b!275686))

(assert (= (and b!275686 res!139668) b!275683))

(assert (= (and b!275683 res!139670) b!275687))

(assert (= (and b!275687 res!139671) b!275680))

(assert (= (and b!275680 res!139669) b!275679))

(assert (= (and b!275679 res!139675) b!275685))

(assert (= (and b!275685 res!139672) b!275684))

(assert (= (and b!275684 res!139673) b!275682))

(assert (= (and b!275682 res!139674) b!275681))

(declare-fun m!291189 () Bool)

(assert (=> b!275679 m!291189))

(declare-fun m!291191 () Bool)

(assert (=> b!275687 m!291191))

(declare-fun m!291193 () Bool)

(assert (=> b!275680 m!291193))

(declare-fun m!291195 () Bool)

(assert (=> b!275681 m!291195))

(declare-fun m!291197 () Bool)

(assert (=> b!275681 m!291197))

(declare-fun m!291199 () Bool)

(assert (=> b!275681 m!291199))

(declare-fun m!291201 () Bool)

(assert (=> b!275683 m!291201))

(declare-fun m!291203 () Bool)

(assert (=> start!26558 m!291203))

(declare-fun m!291205 () Bool)

(assert (=> start!26558 m!291205))

(declare-fun m!291207 () Bool)

(assert (=> b!275686 m!291207))

(declare-fun m!291209 () Bool)

(assert (=> b!275684 m!291209))

(assert (=> b!275684 m!291209))

(declare-fun m!291211 () Bool)

(assert (=> b!275684 m!291211))

(check-sat (not b!275681) (not b!275686) (not b!275684) (not b!275683) (not b!275687) (not start!26558) (not b!275679) (not b!275680))
(check-sat)
