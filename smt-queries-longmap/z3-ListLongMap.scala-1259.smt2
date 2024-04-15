; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26114 () Bool)

(assert start!26114)

(declare-fun b!269282 () Bool)

(declare-fun res!133540 () Bool)

(declare-fun e!173740 () Bool)

(assert (=> b!269282 (=> (not res!133540) (not e!173740))))

(declare-datatypes ((array!13200 0))(
  ( (array!13201 (arr!6249 (Array (_ BitVec 32) (_ BitVec 64))) (size!6602 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13200)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269282 (= res!133540 (and (= (size!6602 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6602 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6602 a!3325))))))

(declare-fun b!269283 () Bool)

(declare-fun e!173739 () Bool)

(assert (=> b!269283 (= e!173740 e!173739)))

(declare-fun res!133541 () Bool)

(assert (=> b!269283 (=> (not res!133541) (not e!173739))))

(declare-datatypes ((SeekEntryResult!1406 0))(
  ( (MissingZero!1406 (index!7794 (_ BitVec 32))) (Found!1406 (index!7795 (_ BitVec 32))) (Intermediate!1406 (undefined!2218 Bool) (index!7796 (_ BitVec 32)) (x!26162 (_ BitVec 32))) (Undefined!1406) (MissingVacant!1406 (index!7797 (_ BitVec 32))) )
))
(declare-fun lt!135013 () SeekEntryResult!1406)

(assert (=> b!269283 (= res!133541 (or (= lt!135013 (MissingZero!1406 i!1267)) (= lt!135013 (MissingVacant!1406 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13200 (_ BitVec 32)) SeekEntryResult!1406)

(assert (=> b!269283 (= lt!135013 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!133537 () Bool)

(assert (=> start!26114 (=> (not res!133537) (not e!173740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26114 (= res!133537 (validMask!0 mask!3868))))

(assert (=> start!26114 e!173740))

(declare-fun array_inv!4221 (array!13200) Bool)

(assert (=> start!26114 (array_inv!4221 a!3325)))

(assert (=> start!26114 true))

(declare-fun b!269284 () Bool)

(declare-fun res!133543 () Bool)

(assert (=> b!269284 (=> (not res!133543) (not e!173739))))

(assert (=> b!269284 (= res!133543 (= startIndex!26 i!1267))))

(declare-fun b!269285 () Bool)

(declare-fun res!133542 () Bool)

(assert (=> b!269285 (=> (not res!133542) (not e!173740))))

(declare-fun arrayContainsKey!0 (array!13200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269285 (= res!133542 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269286 () Bool)

(declare-datatypes ((Unit!8295 0))(
  ( (Unit!8296) )
))
(declare-fun e!173742 () Unit!8295)

(declare-fun Unit!8297 () Unit!8295)

(assert (=> b!269286 (= e!173742 Unit!8297)))

(declare-fun b!269287 () Bool)

(declare-fun res!133538 () Bool)

(assert (=> b!269287 (=> (not res!133538) (not e!173740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269287 (= res!133538 (validKeyInArray!0 k0!2581))))

(declare-fun b!269288 () Bool)

(assert (=> b!269288 (= e!173739 false)))

(declare-fun lt!135015 () Unit!8295)

(assert (=> b!269288 (= lt!135015 e!173742)))

(declare-fun c!45424 () Bool)

(assert (=> b!269288 (= c!45424 (bvslt startIndex!26 (bvsub (size!6602 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269289 () Bool)

(declare-fun lt!135014 () Unit!8295)

(assert (=> b!269289 (= e!173742 lt!135014)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13200 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8295)

(assert (=> b!269289 (= lt!135014 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13200 (_ BitVec 32)) Bool)

(assert (=> b!269289 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13201 (store (arr!6249 a!3325) i!1267 k0!2581) (size!6602 a!3325)) mask!3868)))

(declare-fun b!269290 () Bool)

(declare-fun res!133536 () Bool)

(assert (=> b!269290 (=> (not res!133536) (not e!173740))))

(declare-datatypes ((List!4030 0))(
  ( (Nil!4027) (Cons!4026 (h!4693 (_ BitVec 64)) (t!9103 List!4030)) )
))
(declare-fun arrayNoDuplicates!0 (array!13200 (_ BitVec 32) List!4030) Bool)

(assert (=> b!269290 (= res!133536 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4027))))

(declare-fun b!269291 () Bool)

(declare-fun res!133539 () Bool)

(assert (=> b!269291 (=> (not res!133539) (not e!173739))))

(assert (=> b!269291 (= res!133539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26114 res!133537) b!269282))

(assert (= (and b!269282 res!133540) b!269287))

(assert (= (and b!269287 res!133538) b!269290))

(assert (= (and b!269290 res!133536) b!269285))

(assert (= (and b!269285 res!133542) b!269283))

(assert (= (and b!269283 res!133541) b!269291))

(assert (= (and b!269291 res!133539) b!269284))

(assert (= (and b!269284 res!133543) b!269288))

(assert (= (and b!269288 c!45424) b!269289))

(assert (= (and b!269288 (not c!45424)) b!269286))

(declare-fun m!284699 () Bool)

(assert (=> b!269289 m!284699))

(declare-fun m!284701 () Bool)

(assert (=> b!269289 m!284701))

(declare-fun m!284703 () Bool)

(assert (=> b!269289 m!284703))

(declare-fun m!284705 () Bool)

(assert (=> b!269290 m!284705))

(declare-fun m!284707 () Bool)

(assert (=> b!269283 m!284707))

(declare-fun m!284709 () Bool)

(assert (=> b!269287 m!284709))

(declare-fun m!284711 () Bool)

(assert (=> start!26114 m!284711))

(declare-fun m!284713 () Bool)

(assert (=> start!26114 m!284713))

(declare-fun m!284715 () Bool)

(assert (=> b!269285 m!284715))

(declare-fun m!284717 () Bool)

(assert (=> b!269291 m!284717))

(check-sat (not b!269283) (not b!269290) (not b!269289) (not b!269285) (not b!269291) (not start!26114) (not b!269287))
(check-sat)
