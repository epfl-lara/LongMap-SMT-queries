; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26102 () Bool)

(assert start!26102)

(declare-fun b!269102 () Bool)

(declare-datatypes ((Unit!8277 0))(
  ( (Unit!8278) )
))
(declare-fun e!173669 () Unit!8277)

(declare-fun lt!134961 () Unit!8277)

(assert (=> b!269102 (= e!173669 lt!134961)))

(declare-datatypes ((array!13188 0))(
  ( (array!13189 (arr!6243 (Array (_ BitVec 32) (_ BitVec 64))) (size!6596 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13188)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13188 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8277)

(assert (=> b!269102 (= lt!134961 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13188 (_ BitVec 32)) Bool)

(assert (=> b!269102 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13189 (store (arr!6243 a!3325) i!1267 k0!2581) (size!6596 a!3325)) mask!3868)))

(declare-fun b!269103 () Bool)

(declare-fun e!173670 () Bool)

(declare-fun e!173667 () Bool)

(assert (=> b!269103 (= e!173670 e!173667)))

(declare-fun res!133397 () Bool)

(assert (=> b!269103 (=> (not res!133397) (not e!173667))))

(declare-datatypes ((SeekEntryResult!1400 0))(
  ( (MissingZero!1400 (index!7770 (_ BitVec 32))) (Found!1400 (index!7771 (_ BitVec 32))) (Intermediate!1400 (undefined!2212 Bool) (index!7772 (_ BitVec 32)) (x!26140 (_ BitVec 32))) (Undefined!1400) (MissingVacant!1400 (index!7773 (_ BitVec 32))) )
))
(declare-fun lt!134959 () SeekEntryResult!1400)

(assert (=> b!269103 (= res!133397 (or (= lt!134959 (MissingZero!1400 i!1267)) (= lt!134959 (MissingVacant!1400 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13188 (_ BitVec 32)) SeekEntryResult!1400)

(assert (=> b!269103 (= lt!134959 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269104 () Bool)

(assert (=> b!269104 (= e!173667 false)))

(declare-fun lt!134960 () Unit!8277)

(assert (=> b!269104 (= lt!134960 e!173669)))

(declare-fun c!45406 () Bool)

(assert (=> b!269104 (= c!45406 (bvslt startIndex!26 (bvsub (size!6596 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269105 () Bool)

(declare-fun Unit!8279 () Unit!8277)

(assert (=> b!269105 (= e!173669 Unit!8279)))

(declare-fun res!133394 () Bool)

(assert (=> start!26102 (=> (not res!133394) (not e!173670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26102 (= res!133394 (validMask!0 mask!3868))))

(assert (=> start!26102 e!173670))

(declare-fun array_inv!4215 (array!13188) Bool)

(assert (=> start!26102 (array_inv!4215 a!3325)))

(assert (=> start!26102 true))

(declare-fun b!269106 () Bool)

(declare-fun res!133396 () Bool)

(assert (=> b!269106 (=> (not res!133396) (not e!173670))))

(declare-fun arrayContainsKey!0 (array!13188 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269106 (= res!133396 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269107 () Bool)

(declare-fun res!133398 () Bool)

(assert (=> b!269107 (=> (not res!133398) (not e!173670))))

(assert (=> b!269107 (= res!133398 (and (= (size!6596 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6596 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6596 a!3325))))))

(declare-fun b!269108 () Bool)

(declare-fun res!133392 () Bool)

(assert (=> b!269108 (=> (not res!133392) (not e!173670))))

(declare-datatypes ((List!4024 0))(
  ( (Nil!4021) (Cons!4020 (h!4687 (_ BitVec 64)) (t!9097 List!4024)) )
))
(declare-fun arrayNoDuplicates!0 (array!13188 (_ BitVec 32) List!4024) Bool)

(assert (=> b!269108 (= res!133392 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4021))))

(declare-fun b!269109 () Bool)

(declare-fun res!133399 () Bool)

(assert (=> b!269109 (=> (not res!133399) (not e!173667))))

(assert (=> b!269109 (= res!133399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269110 () Bool)

(declare-fun res!133393 () Bool)

(assert (=> b!269110 (=> (not res!133393) (not e!173670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269110 (= res!133393 (validKeyInArray!0 k0!2581))))

(declare-fun b!269111 () Bool)

(declare-fun res!133395 () Bool)

(assert (=> b!269111 (=> (not res!133395) (not e!173667))))

(assert (=> b!269111 (= res!133395 (= startIndex!26 i!1267))))

(assert (= (and start!26102 res!133394) b!269107))

(assert (= (and b!269107 res!133398) b!269110))

(assert (= (and b!269110 res!133393) b!269108))

(assert (= (and b!269108 res!133392) b!269106))

(assert (= (and b!269106 res!133396) b!269103))

(assert (= (and b!269103 res!133397) b!269109))

(assert (= (and b!269109 res!133399) b!269111))

(assert (= (and b!269111 res!133395) b!269104))

(assert (= (and b!269104 c!45406) b!269102))

(assert (= (and b!269104 (not c!45406)) b!269105))

(declare-fun m!284579 () Bool)

(assert (=> b!269106 m!284579))

(declare-fun m!284581 () Bool)

(assert (=> start!26102 m!284581))

(declare-fun m!284583 () Bool)

(assert (=> start!26102 m!284583))

(declare-fun m!284585 () Bool)

(assert (=> b!269110 m!284585))

(declare-fun m!284587 () Bool)

(assert (=> b!269102 m!284587))

(declare-fun m!284589 () Bool)

(assert (=> b!269102 m!284589))

(declare-fun m!284591 () Bool)

(assert (=> b!269102 m!284591))

(declare-fun m!284593 () Bool)

(assert (=> b!269103 m!284593))

(declare-fun m!284595 () Bool)

(assert (=> b!269109 m!284595))

(declare-fun m!284597 () Bool)

(assert (=> b!269108 m!284597))

(check-sat (not b!269108) (not b!269103) (not start!26102) (not b!269109) (not b!269102) (not b!269110) (not b!269106))
(check-sat)
