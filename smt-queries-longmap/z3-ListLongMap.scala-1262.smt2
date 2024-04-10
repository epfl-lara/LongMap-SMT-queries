; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26132 () Bool)

(assert start!26132)

(declare-fun b!269730 () Bool)

(declare-fun res!133875 () Bool)

(declare-fun e!173961 () Bool)

(assert (=> b!269730 (=> (not res!133875) (not e!173961))))

(declare-datatypes ((array!13229 0))(
  ( (array!13230 (arr!6264 (Array (_ BitVec 32) (_ BitVec 64))) (size!6616 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13229)

(declare-datatypes ((List!4072 0))(
  ( (Nil!4069) (Cons!4068 (h!4735 (_ BitVec 64)) (t!9154 List!4072)) )
))
(declare-fun arrayNoDuplicates!0 (array!13229 (_ BitVec 32) List!4072) Bool)

(assert (=> b!269730 (= res!133875 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4069))))

(declare-fun b!269731 () Bool)

(declare-fun e!173960 () Bool)

(assert (=> b!269731 (= e!173960 false)))

(declare-datatypes ((Unit!8371 0))(
  ( (Unit!8372) )
))
(declare-fun lt!135284 () Unit!8371)

(declare-fun e!173962 () Unit!8371)

(assert (=> b!269731 (= lt!135284 e!173962)))

(declare-fun c!45480 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269731 (= c!45480 (bvslt startIndex!26 (bvsub (size!6616 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269732 () Bool)

(declare-fun Unit!8373 () Unit!8371)

(assert (=> b!269732 (= e!173962 Unit!8373)))

(declare-fun b!269733 () Bool)

(assert (=> b!269733 (= e!173961 e!173960)))

(declare-fun res!133874 () Bool)

(assert (=> b!269733 (=> (not res!133874) (not e!173960))))

(declare-datatypes ((SeekEntryResult!1422 0))(
  ( (MissingZero!1422 (index!7858 (_ BitVec 32))) (Found!1422 (index!7859 (_ BitVec 32))) (Intermediate!1422 (undefined!2234 Bool) (index!7860 (_ BitVec 32)) (x!26203 (_ BitVec 32))) (Undefined!1422) (MissingVacant!1422 (index!7861 (_ BitVec 32))) )
))
(declare-fun lt!135285 () SeekEntryResult!1422)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269733 (= res!133874 (or (= lt!135285 (MissingZero!1422 i!1267)) (= lt!135285 (MissingVacant!1422 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13229 (_ BitVec 32)) SeekEntryResult!1422)

(assert (=> b!269733 (= lt!135285 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269734 () Bool)

(declare-fun res!133876 () Bool)

(assert (=> b!269734 (=> (not res!133876) (not e!173961))))

(declare-fun arrayContainsKey!0 (array!13229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269734 (= res!133876 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269735 () Bool)

(declare-fun res!133873 () Bool)

(assert (=> b!269735 (=> (not res!133873) (not e!173961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269735 (= res!133873 (validKeyInArray!0 k0!2581))))

(declare-fun b!269736 () Bool)

(declare-fun res!133872 () Bool)

(assert (=> b!269736 (=> (not res!133872) (not e!173961))))

(assert (=> b!269736 (= res!133872 (and (= (size!6616 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6616 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6616 a!3325))))))

(declare-fun b!269737 () Bool)

(declare-fun res!133871 () Bool)

(assert (=> b!269737 (=> (not res!133871) (not e!173960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13229 (_ BitVec 32)) Bool)

(assert (=> b!269737 (= res!133871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269738 () Bool)

(declare-fun res!133878 () Bool)

(assert (=> b!269738 (=> (not res!133878) (not e!173960))))

(assert (=> b!269738 (= res!133878 (= startIndex!26 i!1267))))

(declare-fun b!269729 () Bool)

(declare-fun lt!135286 () Unit!8371)

(assert (=> b!269729 (= e!173962 lt!135286)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13229 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8371)

(assert (=> b!269729 (= lt!135286 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269729 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13230 (store (arr!6264 a!3325) i!1267 k0!2581) (size!6616 a!3325)) mask!3868)))

(declare-fun res!133877 () Bool)

(assert (=> start!26132 (=> (not res!133877) (not e!173961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26132 (= res!133877 (validMask!0 mask!3868))))

(assert (=> start!26132 e!173961))

(declare-fun array_inv!4227 (array!13229) Bool)

(assert (=> start!26132 (array_inv!4227 a!3325)))

(assert (=> start!26132 true))

(assert (= (and start!26132 res!133877) b!269736))

(assert (= (and b!269736 res!133872) b!269735))

(assert (= (and b!269735 res!133873) b!269730))

(assert (= (and b!269730 res!133875) b!269734))

(assert (= (and b!269734 res!133876) b!269733))

(assert (= (and b!269733 res!133874) b!269737))

(assert (= (and b!269737 res!133871) b!269738))

(assert (= (and b!269738 res!133878) b!269731))

(assert (= (and b!269731 c!45480) b!269729))

(assert (= (and b!269731 (not c!45480)) b!269732))

(declare-fun m!285491 () Bool)

(assert (=> b!269729 m!285491))

(declare-fun m!285493 () Bool)

(assert (=> b!269729 m!285493))

(declare-fun m!285495 () Bool)

(assert (=> b!269729 m!285495))

(declare-fun m!285497 () Bool)

(assert (=> b!269735 m!285497))

(declare-fun m!285499 () Bool)

(assert (=> b!269733 m!285499))

(declare-fun m!285501 () Bool)

(assert (=> start!26132 m!285501))

(declare-fun m!285503 () Bool)

(assert (=> start!26132 m!285503))

(declare-fun m!285505 () Bool)

(assert (=> b!269734 m!285505))

(declare-fun m!285507 () Bool)

(assert (=> b!269737 m!285507))

(declare-fun m!285509 () Bool)

(assert (=> b!269730 m!285509))

(check-sat (not b!269733) (not b!269730) (not b!269729) (not b!269735) (not start!26132) (not b!269737) (not b!269734))
(check-sat)
