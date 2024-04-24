; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26130 () Bool)

(assert start!26130)

(declare-fun b!269746 () Bool)

(declare-datatypes ((Unit!8348 0))(
  ( (Unit!8349) )
))
(declare-fun e!173975 () Unit!8348)

(declare-fun Unit!8350 () Unit!8348)

(assert (=> b!269746 (= e!173975 Unit!8350)))

(declare-fun b!269747 () Bool)

(declare-fun e!173974 () Bool)

(declare-fun e!173972 () Bool)

(assert (=> b!269747 (= e!173974 e!173972)))

(declare-fun res!133871 () Bool)

(assert (=> b!269747 (=> (not res!133871) (not e!173972))))

(declare-datatypes ((SeekEntryResult!1385 0))(
  ( (MissingZero!1385 (index!7710 (_ BitVec 32))) (Found!1385 (index!7711 (_ BitVec 32))) (Intermediate!1385 (undefined!2197 Bool) (index!7712 (_ BitVec 32)) (x!26166 (_ BitVec 32))) (Undefined!1385) (MissingVacant!1385 (index!7713 (_ BitVec 32))) )
))
(declare-fun lt!135335 () SeekEntryResult!1385)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269747 (= res!133871 (or (= lt!135335 (MissingZero!1385 i!1267)) (= lt!135335 (MissingVacant!1385 i!1267))))))

(declare-datatypes ((array!13226 0))(
  ( (array!13227 (arr!6262 (Array (_ BitVec 32) (_ BitVec 64))) (size!6614 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13226)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13226 (_ BitVec 32)) SeekEntryResult!1385)

(assert (=> b!269747 (= lt!135335 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269748 () Bool)

(declare-fun res!133875 () Bool)

(assert (=> b!269748 (=> (not res!133875) (not e!173974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269748 (= res!133875 (validKeyInArray!0 k0!2581))))

(declare-fun b!269749 () Bool)

(declare-fun res!133873 () Bool)

(assert (=> b!269749 (=> (not res!133873) (not e!173972))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269749 (= res!133873 (= startIndex!26 i!1267))))

(declare-fun b!269750 () Bool)

(declare-fun lt!135334 () Unit!8348)

(assert (=> b!269750 (= e!173975 lt!135334)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13226 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8348)

(assert (=> b!269750 (= lt!135334 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13226 (_ BitVec 32)) Bool)

(assert (=> b!269750 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13227 (store (arr!6262 a!3325) i!1267 k0!2581) (size!6614 a!3325)) mask!3868)))

(declare-fun res!133870 () Bool)

(assert (=> start!26130 (=> (not res!133870) (not e!173974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26130 (= res!133870 (validMask!0 mask!3868))))

(assert (=> start!26130 e!173974))

(declare-fun array_inv!4212 (array!13226) Bool)

(assert (=> start!26130 (array_inv!4212 a!3325)))

(assert (=> start!26130 true))

(declare-fun b!269751 () Bool)

(assert (=> b!269751 (= e!173972 false)))

(declare-fun lt!135336 () Unit!8348)

(assert (=> b!269751 (= lt!135336 e!173975)))

(declare-fun c!45490 () Bool)

(assert (=> b!269751 (= c!45490 (bvslt startIndex!26 (bvsub (size!6614 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269752 () Bool)

(declare-fun res!133869 () Bool)

(assert (=> b!269752 (=> (not res!133869) (not e!173972))))

(assert (=> b!269752 (= res!133869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269753 () Bool)

(declare-fun res!133868 () Bool)

(assert (=> b!269753 (=> (not res!133868) (not e!173974))))

(declare-fun arrayContainsKey!0 (array!13226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269753 (= res!133868 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269754 () Bool)

(declare-fun res!133874 () Bool)

(assert (=> b!269754 (=> (not res!133874) (not e!173974))))

(assert (=> b!269754 (= res!133874 (and (= (size!6614 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6614 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6614 a!3325))))))

(declare-fun b!269755 () Bool)

(declare-fun res!133872 () Bool)

(assert (=> b!269755 (=> (not res!133872) (not e!173974))))

(declare-datatypes ((List!3983 0))(
  ( (Nil!3980) (Cons!3979 (h!4646 (_ BitVec 64)) (t!9057 List!3983)) )
))
(declare-fun arrayNoDuplicates!0 (array!13226 (_ BitVec 32) List!3983) Bool)

(assert (=> b!269755 (= res!133872 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3980))))

(assert (= (and start!26130 res!133870) b!269754))

(assert (= (and b!269754 res!133874) b!269748))

(assert (= (and b!269748 res!133875) b!269755))

(assert (= (and b!269755 res!133872) b!269753))

(assert (= (and b!269753 res!133868) b!269747))

(assert (= (and b!269747 res!133871) b!269752))

(assert (= (and b!269752 res!133869) b!269749))

(assert (= (and b!269749 res!133873) b!269751))

(assert (= (and b!269751 c!45490) b!269750))

(assert (= (and b!269751 (not c!45490)) b!269746))

(declare-fun m!285677 () Bool)

(assert (=> b!269752 m!285677))

(declare-fun m!285679 () Bool)

(assert (=> b!269755 m!285679))

(declare-fun m!285681 () Bool)

(assert (=> b!269748 m!285681))

(declare-fun m!285683 () Bool)

(assert (=> start!26130 m!285683))

(declare-fun m!285685 () Bool)

(assert (=> start!26130 m!285685))

(declare-fun m!285687 () Bool)

(assert (=> b!269753 m!285687))

(declare-fun m!285689 () Bool)

(assert (=> b!269747 m!285689))

(declare-fun m!285691 () Bool)

(assert (=> b!269750 m!285691))

(declare-fun m!285693 () Bool)

(assert (=> b!269750 m!285693))

(declare-fun m!285695 () Bool)

(assert (=> b!269750 m!285695))

(check-sat (not b!269748) (not b!269750) (not b!269747) (not b!269753) (not start!26130) (not b!269752) (not b!269755))
(check-sat)
