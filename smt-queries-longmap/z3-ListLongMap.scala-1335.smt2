; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26570 () Bool)

(assert start!26570)

(declare-fun b!275858 () Bool)

(declare-fun res!139852 () Bool)

(declare-fun e!176342 () Bool)

(assert (=> b!275858 (=> (not res!139852) (not e!176342))))

(declare-datatypes ((array!13667 0))(
  ( (array!13668 (arr!6483 (Array (_ BitVec 32) (_ BitVec 64))) (size!6835 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13667)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13667 (_ BitVec 32)) Bool)

(assert (=> b!275858 (= res!139852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275859 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275859 (= e!176342 (not (bvsle startIndex!26 (size!6835 a!3325))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275859 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13668 (store (arr!6483 a!3325) i!1267 k0!2581) (size!6835 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8697 0))(
  ( (Unit!8698) )
))
(declare-fun lt!137484 () Unit!8697)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13667 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8697)

(assert (=> b!275859 (= lt!137484 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275860 () Bool)

(declare-fun res!139856 () Bool)

(assert (=> b!275860 (=> (not res!139856) (not e!176342))))

(assert (=> b!275860 (= res!139856 (and (bvslt startIndex!26 (bvsub (size!6835 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275861 () Bool)

(declare-fun res!139855 () Bool)

(declare-fun e!176340 () Bool)

(assert (=> b!275861 (=> (not res!139855) (not e!176340))))

(declare-fun arrayContainsKey!0 (array!13667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275861 (= res!139855 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275862 () Bool)

(declare-fun res!139849 () Bool)

(assert (=> b!275862 (=> (not res!139849) (not e!176340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275862 (= res!139849 (validKeyInArray!0 k0!2581))))

(declare-fun b!275863 () Bool)

(declare-fun res!139857 () Bool)

(assert (=> b!275863 (=> (not res!139857) (not e!176342))))

(assert (=> b!275863 (= res!139857 (not (= startIndex!26 i!1267)))))

(declare-fun res!139851 () Bool)

(assert (=> start!26570 (=> (not res!139851) (not e!176340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26570 (= res!139851 (validMask!0 mask!3868))))

(assert (=> start!26570 e!176340))

(declare-fun array_inv!4446 (array!13667) Bool)

(assert (=> start!26570 (array_inv!4446 a!3325)))

(assert (=> start!26570 true))

(declare-fun b!275864 () Bool)

(declare-fun res!139853 () Bool)

(assert (=> b!275864 (=> (not res!139853) (not e!176342))))

(assert (=> b!275864 (= res!139853 (not (validKeyInArray!0 (select (arr!6483 a!3325) startIndex!26))))))

(declare-fun b!275865 () Bool)

(declare-fun res!139854 () Bool)

(assert (=> b!275865 (=> (not res!139854) (not e!176340))))

(assert (=> b!275865 (= res!139854 (and (= (size!6835 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6835 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6835 a!3325))))))

(declare-fun b!275866 () Bool)

(declare-fun res!139848 () Bool)

(assert (=> b!275866 (=> (not res!139848) (not e!176340))))

(declare-datatypes ((List!4291 0))(
  ( (Nil!4288) (Cons!4287 (h!4954 (_ BitVec 64)) (t!9373 List!4291)) )
))
(declare-fun arrayNoDuplicates!0 (array!13667 (_ BitVec 32) List!4291) Bool)

(assert (=> b!275866 (= res!139848 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4288))))

(declare-fun b!275867 () Bool)

(assert (=> b!275867 (= e!176340 e!176342)))

(declare-fun res!139850 () Bool)

(assert (=> b!275867 (=> (not res!139850) (not e!176342))))

(declare-datatypes ((SeekEntryResult!1641 0))(
  ( (MissingZero!1641 (index!8734 (_ BitVec 32))) (Found!1641 (index!8735 (_ BitVec 32))) (Intermediate!1641 (undefined!2453 Bool) (index!8736 (_ BitVec 32)) (x!27006 (_ BitVec 32))) (Undefined!1641) (MissingVacant!1641 (index!8737 (_ BitVec 32))) )
))
(declare-fun lt!137485 () SeekEntryResult!1641)

(assert (=> b!275867 (= res!139850 (or (= lt!137485 (MissingZero!1641 i!1267)) (= lt!137485 (MissingVacant!1641 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13667 (_ BitVec 32)) SeekEntryResult!1641)

(assert (=> b!275867 (= lt!137485 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26570 res!139851) b!275865))

(assert (= (and b!275865 res!139854) b!275862))

(assert (= (and b!275862 res!139849) b!275866))

(assert (= (and b!275866 res!139848) b!275861))

(assert (= (and b!275861 res!139855) b!275867))

(assert (= (and b!275867 res!139850) b!275858))

(assert (= (and b!275858 res!139852) b!275863))

(assert (= (and b!275863 res!139857) b!275864))

(assert (= (and b!275864 res!139853) b!275860))

(assert (= (and b!275860 res!139856) b!275859))

(declare-fun m!291333 () Bool)

(assert (=> b!275864 m!291333))

(assert (=> b!275864 m!291333))

(declare-fun m!291335 () Bool)

(assert (=> b!275864 m!291335))

(declare-fun m!291337 () Bool)

(assert (=> b!275866 m!291337))

(declare-fun m!291339 () Bool)

(assert (=> b!275858 m!291339))

(declare-fun m!291341 () Bool)

(assert (=> b!275859 m!291341))

(declare-fun m!291343 () Bool)

(assert (=> b!275859 m!291343))

(declare-fun m!291345 () Bool)

(assert (=> b!275859 m!291345))

(declare-fun m!291347 () Bool)

(assert (=> b!275862 m!291347))

(declare-fun m!291349 () Bool)

(assert (=> b!275867 m!291349))

(declare-fun m!291351 () Bool)

(assert (=> start!26570 m!291351))

(declare-fun m!291353 () Bool)

(assert (=> start!26570 m!291353))

(declare-fun m!291355 () Bool)

(assert (=> b!275861 m!291355))

(check-sat (not start!26570) (not b!275859) (not b!275867) (not b!275864) (not b!275866) (not b!275862) (not b!275858) (not b!275861))
(check-sat)
