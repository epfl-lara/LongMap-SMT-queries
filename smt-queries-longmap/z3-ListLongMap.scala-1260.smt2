; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26118 () Bool)

(assert start!26118)

(declare-fun b!269566 () Bool)

(declare-fun res!133727 () Bool)

(declare-fun e!173901 () Bool)

(assert (=> b!269566 (=> (not res!133727) (not e!173901))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269566 (= res!133727 (= startIndex!26 i!1267))))

(declare-fun b!269567 () Bool)

(assert (=> b!269567 (= e!173901 false)))

(declare-datatypes ((Unit!8330 0))(
  ( (Unit!8331) )
))
(declare-fun lt!135281 () Unit!8330)

(declare-fun e!173903 () Unit!8330)

(assert (=> b!269567 (= lt!135281 e!173903)))

(declare-fun c!45472 () Bool)

(declare-datatypes ((array!13214 0))(
  ( (array!13215 (arr!6256 (Array (_ BitVec 32) (_ BitVec 64))) (size!6608 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13214)

(assert (=> b!269567 (= c!45472 (bvslt startIndex!26 (bvsub (size!6608 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269568 () Bool)

(declare-fun lt!135282 () Unit!8330)

(assert (=> b!269568 (= e!173903 lt!135282)))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13214 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8330)

(assert (=> b!269568 (= lt!135282 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13214 (_ BitVec 32)) Bool)

(assert (=> b!269568 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13215 (store (arr!6256 a!3325) i!1267 k0!2581) (size!6608 a!3325)) mask!3868)))

(declare-fun b!269569 () Bool)

(declare-fun res!133726 () Bool)

(declare-fun e!173900 () Bool)

(assert (=> b!269569 (=> (not res!133726) (not e!173900))))

(declare-fun arrayContainsKey!0 (array!13214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269569 (= res!133726 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!133725 () Bool)

(assert (=> start!26118 (=> (not res!133725) (not e!173900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26118 (= res!133725 (validMask!0 mask!3868))))

(assert (=> start!26118 e!173900))

(declare-fun array_inv!4206 (array!13214) Bool)

(assert (=> start!26118 (array_inv!4206 a!3325)))

(assert (=> start!26118 true))

(declare-fun b!269570 () Bool)

(declare-fun res!133728 () Bool)

(assert (=> b!269570 (=> (not res!133728) (not e!173900))))

(declare-datatypes ((List!3977 0))(
  ( (Nil!3974) (Cons!3973 (h!4640 (_ BitVec 64)) (t!9051 List!3977)) )
))
(declare-fun arrayNoDuplicates!0 (array!13214 (_ BitVec 32) List!3977) Bool)

(assert (=> b!269570 (= res!133728 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3974))))

(declare-fun b!269571 () Bool)

(declare-fun res!133729 () Bool)

(assert (=> b!269571 (=> (not res!133729) (not e!173901))))

(assert (=> b!269571 (= res!133729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269572 () Bool)

(assert (=> b!269572 (= e!173900 e!173901)))

(declare-fun res!133730 () Bool)

(assert (=> b!269572 (=> (not res!133730) (not e!173901))))

(declare-datatypes ((SeekEntryResult!1379 0))(
  ( (MissingZero!1379 (index!7686 (_ BitVec 32))) (Found!1379 (index!7687 (_ BitVec 32))) (Intermediate!1379 (undefined!2191 Bool) (index!7688 (_ BitVec 32)) (x!26144 (_ BitVec 32))) (Undefined!1379) (MissingVacant!1379 (index!7689 (_ BitVec 32))) )
))
(declare-fun lt!135280 () SeekEntryResult!1379)

(assert (=> b!269572 (= res!133730 (or (= lt!135280 (MissingZero!1379 i!1267)) (= lt!135280 (MissingVacant!1379 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13214 (_ BitVec 32)) SeekEntryResult!1379)

(assert (=> b!269572 (= lt!135280 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269573 () Bool)

(declare-fun Unit!8332 () Unit!8330)

(assert (=> b!269573 (= e!173903 Unit!8332)))

(declare-fun b!269574 () Bool)

(declare-fun res!133731 () Bool)

(assert (=> b!269574 (=> (not res!133731) (not e!173900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269574 (= res!133731 (validKeyInArray!0 k0!2581))))

(declare-fun b!269575 () Bool)

(declare-fun res!133724 () Bool)

(assert (=> b!269575 (=> (not res!133724) (not e!173900))))

(assert (=> b!269575 (= res!133724 (and (= (size!6608 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6608 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6608 a!3325))))))

(assert (= (and start!26118 res!133725) b!269575))

(assert (= (and b!269575 res!133724) b!269574))

(assert (= (and b!269574 res!133731) b!269570))

(assert (= (and b!269570 res!133728) b!269569))

(assert (= (and b!269569 res!133726) b!269572))

(assert (= (and b!269572 res!133730) b!269571))

(assert (= (and b!269571 res!133729) b!269566))

(assert (= (and b!269566 res!133727) b!269567))

(assert (= (and b!269567 c!45472) b!269568))

(assert (= (and b!269567 (not c!45472)) b!269573))

(declare-fun m!285557 () Bool)

(assert (=> start!26118 m!285557))

(declare-fun m!285559 () Bool)

(assert (=> start!26118 m!285559))

(declare-fun m!285561 () Bool)

(assert (=> b!269571 m!285561))

(declare-fun m!285563 () Bool)

(assert (=> b!269572 m!285563))

(declare-fun m!285565 () Bool)

(assert (=> b!269569 m!285565))

(declare-fun m!285567 () Bool)

(assert (=> b!269568 m!285567))

(declare-fun m!285569 () Bool)

(assert (=> b!269568 m!285569))

(declare-fun m!285571 () Bool)

(assert (=> b!269568 m!285571))

(declare-fun m!285573 () Bool)

(assert (=> b!269570 m!285573))

(declare-fun m!285575 () Bool)

(assert (=> b!269574 m!285575))

(check-sat (not b!269568) (not b!269572) (not b!269574) (not b!269570) (not b!269571) (not b!269569) (not start!26118))
(check-sat)
