; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26144 () Bool)

(assert start!26144)

(declare-fun b!269732 () Bool)

(declare-fun res!133898 () Bool)

(declare-fun e!173934 () Bool)

(assert (=> b!269732 (=> (not res!133898) (not e!173934))))

(declare-datatypes ((array!13230 0))(
  ( (array!13231 (arr!6264 (Array (_ BitVec 32) (_ BitVec 64))) (size!6617 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13230)

(declare-datatypes ((List!4045 0))(
  ( (Nil!4042) (Cons!4041 (h!4708 (_ BitVec 64)) (t!9118 List!4045)) )
))
(declare-fun arrayNoDuplicates!0 (array!13230 (_ BitVec 32) List!4045) Bool)

(assert (=> b!269732 (= res!133898 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4042))))

(declare-fun b!269733 () Bool)

(declare-datatypes ((Unit!8340 0))(
  ( (Unit!8341) )
))
(declare-fun e!173930 () Unit!8340)

(declare-fun lt!135171 () Unit!8340)

(assert (=> b!269733 (= e!173930 lt!135171)))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13230 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8340)

(assert (=> b!269733 (= lt!135171 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!135172 () array!13230)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13230 (_ BitVec 32)) Bool)

(assert (=> b!269733 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135172 mask!3868)))

(declare-fun b!269734 () Bool)

(declare-fun res!133897 () Bool)

(assert (=> b!269734 (=> (not res!133897) (not e!173934))))

(declare-fun arrayContainsKey!0 (array!13230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269734 (= res!133897 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!133896 () Bool)

(assert (=> start!26144 (=> (not res!133896) (not e!173934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26144 (= res!133896 (validMask!0 mask!3868))))

(assert (=> start!26144 e!173934))

(declare-fun array_inv!4236 (array!13230) Bool)

(assert (=> start!26144 (array_inv!4236 a!3325)))

(assert (=> start!26144 true))

(declare-fun b!269735 () Bool)

(declare-fun e!173931 () Bool)

(declare-fun e!173933 () Bool)

(assert (=> b!269735 (= e!173931 e!173933)))

(declare-fun res!133902 () Bool)

(assert (=> b!269735 (=> (not res!133902) (not e!173933))))

(assert (=> b!269735 (= res!133902 (= startIndex!26 i!1267))))

(assert (=> b!269735 (= lt!135172 (array!13231 (store (arr!6264 a!3325) i!1267 k0!2581) (size!6617 a!3325)))))

(declare-fun b!269736 () Bool)

(declare-fun res!133900 () Bool)

(assert (=> b!269736 (=> (not res!133900) (not e!173934))))

(assert (=> b!269736 (= res!133900 (and (= (size!6617 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6617 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6617 a!3325))))))

(declare-fun b!269737 () Bool)

(declare-fun res!133899 () Bool)

(assert (=> b!269737 (=> (not res!133899) (not e!173931))))

(assert (=> b!269737 (= res!133899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269738 () Bool)

(assert (=> b!269738 (= e!173934 e!173931)))

(declare-fun res!133901 () Bool)

(assert (=> b!269738 (=> (not res!133901) (not e!173931))))

(declare-datatypes ((SeekEntryResult!1421 0))(
  ( (MissingZero!1421 (index!7854 (_ BitVec 32))) (Found!1421 (index!7855 (_ BitVec 32))) (Intermediate!1421 (undefined!2233 Bool) (index!7856 (_ BitVec 32)) (x!26217 (_ BitVec 32))) (Undefined!1421) (MissingVacant!1421 (index!7857 (_ BitVec 32))) )
))
(declare-fun lt!135174 () SeekEntryResult!1421)

(assert (=> b!269738 (= res!133901 (or (= lt!135174 (MissingZero!1421 i!1267)) (= lt!135174 (MissingVacant!1421 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13230 (_ BitVec 32)) SeekEntryResult!1421)

(assert (=> b!269738 (= lt!135174 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269739 () Bool)

(assert (=> b!269739 (= e!173933 (not (bvsge mask!3868 #b00000000000000000000000000000000)))))

(assert (=> b!269739 (= (seekEntryOrOpen!0 k0!2581 lt!135172 mask!3868) (Found!1421 i!1267))))

(declare-fun lt!135173 () Unit!8340)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13230 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8340)

(assert (=> b!269739 (= lt!135173 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135170 () Unit!8340)

(assert (=> b!269739 (= lt!135170 e!173930)))

(declare-fun c!45469 () Bool)

(assert (=> b!269739 (= c!45469 (bvslt startIndex!26 (bvsub (size!6617 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269740 () Bool)

(declare-fun res!133903 () Bool)

(assert (=> b!269740 (=> (not res!133903) (not e!173934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269740 (= res!133903 (validKeyInArray!0 k0!2581))))

(declare-fun b!269741 () Bool)

(declare-fun Unit!8342 () Unit!8340)

(assert (=> b!269741 (= e!173930 Unit!8342)))

(assert (= (and start!26144 res!133896) b!269736))

(assert (= (and b!269736 res!133900) b!269740))

(assert (= (and b!269740 res!133903) b!269732))

(assert (= (and b!269732 res!133898) b!269734))

(assert (= (and b!269734 res!133897) b!269738))

(assert (= (and b!269738 res!133901) b!269737))

(assert (= (and b!269737 res!133899) b!269735))

(assert (= (and b!269735 res!133902) b!269739))

(assert (= (and b!269739 c!45469) b!269733))

(assert (= (and b!269739 (not c!45469)) b!269741))

(declare-fun m!285011 () Bool)

(assert (=> b!269735 m!285011))

(declare-fun m!285013 () Bool)

(assert (=> b!269737 m!285013))

(declare-fun m!285015 () Bool)

(assert (=> b!269733 m!285015))

(declare-fun m!285017 () Bool)

(assert (=> b!269733 m!285017))

(declare-fun m!285019 () Bool)

(assert (=> b!269738 m!285019))

(declare-fun m!285021 () Bool)

(assert (=> b!269732 m!285021))

(declare-fun m!285023 () Bool)

(assert (=> b!269739 m!285023))

(declare-fun m!285025 () Bool)

(assert (=> b!269739 m!285025))

(declare-fun m!285027 () Bool)

(assert (=> start!26144 m!285027))

(declare-fun m!285029 () Bool)

(assert (=> start!26144 m!285029))

(declare-fun m!285031 () Bool)

(assert (=> b!269734 m!285031))

(declare-fun m!285033 () Bool)

(assert (=> b!269740 m!285033))

(check-sat (not b!269740) (not b!269737) (not b!269733) (not b!269734) (not start!26144) (not b!269739) (not b!269738) (not b!269732))
(check-sat)
