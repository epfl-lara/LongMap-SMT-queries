; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26090 () Bool)

(assert start!26090)

(declare-fun res!133369 () Bool)

(declare-fun e!173709 () Bool)

(assert (=> start!26090 (=> (not res!133369) (not e!173709))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26090 (= res!133369 (validMask!0 mask!3868))))

(assert (=> start!26090 e!173709))

(declare-datatypes ((array!13187 0))(
  ( (array!13188 (arr!6243 (Array (_ BitVec 32) (_ BitVec 64))) (size!6595 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13187)

(declare-fun array_inv!4206 (array!13187) Bool)

(assert (=> start!26090 (array_inv!4206 a!3325)))

(assert (=> start!26090 true))

(declare-fun b!269099 () Bool)

(declare-fun res!133368 () Bool)

(assert (=> b!269099 (=> (not res!133368) (not e!173709))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269099 (= res!133368 (validKeyInArray!0 k0!2581))))

(declare-fun b!269100 () Bool)

(declare-fun res!133374 () Bool)

(declare-fun e!173710 () Bool)

(assert (=> b!269100 (=> (not res!133374) (not e!173710))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269100 (= res!133374 (= startIndex!26 i!1267))))

(declare-fun b!269101 () Bool)

(assert (=> b!269101 (= e!173710 false)))

(declare-datatypes ((Unit!8308 0))(
  ( (Unit!8309) )
))
(declare-fun lt!135096 () Unit!8308)

(declare-fun e!173711 () Unit!8308)

(assert (=> b!269101 (= lt!135096 e!173711)))

(declare-fun c!45417 () Bool)

(assert (=> b!269101 (= c!45417 (bvslt startIndex!26 (bvsub (size!6595 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269102 () Bool)

(declare-fun res!133373 () Bool)

(assert (=> b!269102 (=> (not res!133373) (not e!173709))))

(assert (=> b!269102 (= res!133373 (and (= (size!6595 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6595 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6595 a!3325))))))

(declare-fun b!269103 () Bool)

(declare-fun Unit!8310 () Unit!8308)

(assert (=> b!269103 (= e!173711 Unit!8310)))

(declare-fun b!269104 () Bool)

(assert (=> b!269104 (= e!173709 e!173710)))

(declare-fun res!133367 () Bool)

(assert (=> b!269104 (=> (not res!133367) (not e!173710))))

(declare-datatypes ((SeekEntryResult!1401 0))(
  ( (MissingZero!1401 (index!7774 (_ BitVec 32))) (Found!1401 (index!7775 (_ BitVec 32))) (Intermediate!1401 (undefined!2213 Bool) (index!7776 (_ BitVec 32)) (x!26126 (_ BitVec 32))) (Undefined!1401) (MissingVacant!1401 (index!7777 (_ BitVec 32))) )
))
(declare-fun lt!135095 () SeekEntryResult!1401)

(assert (=> b!269104 (= res!133367 (or (= lt!135095 (MissingZero!1401 i!1267)) (= lt!135095 (MissingVacant!1401 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13187 (_ BitVec 32)) SeekEntryResult!1401)

(assert (=> b!269104 (= lt!135095 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269105 () Bool)

(declare-fun res!133370 () Bool)

(assert (=> b!269105 (=> (not res!133370) (not e!173709))))

(declare-fun arrayContainsKey!0 (array!13187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269105 (= res!133370 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269106 () Bool)

(declare-fun lt!135097 () Unit!8308)

(assert (=> b!269106 (= e!173711 lt!135097)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13187 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8308)

(assert (=> b!269106 (= lt!135097 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13187 (_ BitVec 32)) Bool)

(assert (=> b!269106 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13188 (store (arr!6243 a!3325) i!1267 k0!2581) (size!6595 a!3325)) mask!3868)))

(declare-fun b!269107 () Bool)

(declare-fun res!133372 () Bool)

(assert (=> b!269107 (=> (not res!133372) (not e!173709))))

(declare-datatypes ((List!4051 0))(
  ( (Nil!4048) (Cons!4047 (h!4714 (_ BitVec 64)) (t!9133 List!4051)) )
))
(declare-fun arrayNoDuplicates!0 (array!13187 (_ BitVec 32) List!4051) Bool)

(assert (=> b!269107 (= res!133372 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4048))))

(declare-fun b!269108 () Bool)

(declare-fun res!133371 () Bool)

(assert (=> b!269108 (=> (not res!133371) (not e!173710))))

(assert (=> b!269108 (= res!133371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26090 res!133369) b!269102))

(assert (= (and b!269102 res!133373) b!269099))

(assert (= (and b!269099 res!133368) b!269107))

(assert (= (and b!269107 res!133372) b!269105))

(assert (= (and b!269105 res!133370) b!269104))

(assert (= (and b!269104 res!133367) b!269108))

(assert (= (and b!269108 res!133371) b!269100))

(assert (= (and b!269100 res!133374) b!269101))

(assert (= (and b!269101 c!45417) b!269106))

(assert (= (and b!269101 (not c!45417)) b!269103))

(declare-fun m!285071 () Bool)

(assert (=> b!269107 m!285071))

(declare-fun m!285073 () Bool)

(assert (=> b!269108 m!285073))

(declare-fun m!285075 () Bool)

(assert (=> b!269105 m!285075))

(declare-fun m!285077 () Bool)

(assert (=> b!269104 m!285077))

(declare-fun m!285079 () Bool)

(assert (=> b!269099 m!285079))

(declare-fun m!285081 () Bool)

(assert (=> b!269106 m!285081))

(declare-fun m!285083 () Bool)

(assert (=> b!269106 m!285083))

(declare-fun m!285085 () Bool)

(assert (=> b!269106 m!285085))

(declare-fun m!285087 () Bool)

(assert (=> start!26090 m!285087))

(declare-fun m!285089 () Bool)

(assert (=> start!26090 m!285089))

(check-sat (not b!269107) (not start!26090) (not b!269105) (not b!269106) (not b!269104) (not b!269108) (not b!269099))
(check-sat)
