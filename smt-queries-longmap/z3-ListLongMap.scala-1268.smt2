; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26168 () Bool)

(assert start!26168)

(declare-fun b!270092 () Bool)

(declare-fun e!174113 () Bool)

(assert (=> b!270092 (= e!174113 (not true))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((array!13254 0))(
  ( (array!13255 (arr!6276 (Array (_ BitVec 32) (_ BitVec 64))) (size!6629 (_ BitVec 32))) )
))
(declare-fun lt!135354 () array!13254)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1433 0))(
  ( (MissingZero!1433 (index!7902 (_ BitVec 32))) (Found!1433 (index!7903 (_ BitVec 32))) (Intermediate!1433 (undefined!2245 Bool) (index!7904 (_ BitVec 32)) (x!26261 (_ BitVec 32))) (Undefined!1433) (MissingVacant!1433 (index!7905 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13254 (_ BitVec 32)) SeekEntryResult!1433)

(assert (=> b!270092 (= (seekEntryOrOpen!0 k0!2581 lt!135354 mask!3868) (Found!1433 i!1267))))

(declare-datatypes ((Unit!8376 0))(
  ( (Unit!8377) )
))
(declare-fun lt!135353 () Unit!8376)

(declare-fun a!3325 () array!13254)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13254 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8376)

(assert (=> b!270092 (= lt!135353 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135350 () Unit!8376)

(declare-fun e!174114 () Unit!8376)

(assert (=> b!270092 (= lt!135350 e!174114)))

(declare-fun c!45505 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270092 (= c!45505 (bvslt startIndex!26 (bvsub (size!6629 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270093 () Bool)

(declare-fun res!134184 () Bool)

(declare-fun e!174112 () Bool)

(assert (=> b!270093 (=> (not res!134184) (not e!174112))))

(declare-datatypes ((List!4057 0))(
  ( (Nil!4054) (Cons!4053 (h!4720 (_ BitVec 64)) (t!9130 List!4057)) )
))
(declare-fun arrayNoDuplicates!0 (array!13254 (_ BitVec 32) List!4057) Bool)

(assert (=> b!270093 (= res!134184 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4054))))

(declare-fun b!270094 () Bool)

(declare-fun res!134190 () Bool)

(assert (=> b!270094 (=> (not res!134190) (not e!174112))))

(assert (=> b!270094 (= res!134190 (and (= (size!6629 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6629 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6629 a!3325))))))

(declare-fun b!270095 () Bool)

(declare-fun res!134191 () Bool)

(assert (=> b!270095 (=> (not res!134191) (not e!174112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270095 (= res!134191 (validKeyInArray!0 k0!2581))))

(declare-fun res!134185 () Bool)

(assert (=> start!26168 (=> (not res!134185) (not e!174112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26168 (= res!134185 (validMask!0 mask!3868))))

(assert (=> start!26168 e!174112))

(declare-fun array_inv!4248 (array!13254) Bool)

(assert (=> start!26168 (array_inv!4248 a!3325)))

(assert (=> start!26168 true))

(declare-fun b!270096 () Bool)

(declare-fun res!134188 () Bool)

(assert (=> b!270096 (=> (not res!134188) (not e!174112))))

(declare-fun arrayContainsKey!0 (array!13254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270096 (= res!134188 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270097 () Bool)

(declare-fun e!174110 () Bool)

(assert (=> b!270097 (= e!174110 e!174113)))

(declare-fun res!134189 () Bool)

(assert (=> b!270097 (=> (not res!134189) (not e!174113))))

(assert (=> b!270097 (= res!134189 (= startIndex!26 i!1267))))

(assert (=> b!270097 (= lt!135354 (array!13255 (store (arr!6276 a!3325) i!1267 k0!2581) (size!6629 a!3325)))))

(declare-fun b!270098 () Bool)

(declare-fun res!134187 () Bool)

(assert (=> b!270098 (=> (not res!134187) (not e!174110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13254 (_ BitVec 32)) Bool)

(assert (=> b!270098 (= res!134187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270099 () Bool)

(declare-fun lt!135351 () Unit!8376)

(assert (=> b!270099 (= e!174114 lt!135351)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13254 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8376)

(assert (=> b!270099 (= lt!135351 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270099 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135354 mask!3868)))

(declare-fun b!270100 () Bool)

(assert (=> b!270100 (= e!174112 e!174110)))

(declare-fun res!134186 () Bool)

(assert (=> b!270100 (=> (not res!134186) (not e!174110))))

(declare-fun lt!135352 () SeekEntryResult!1433)

(assert (=> b!270100 (= res!134186 (or (= lt!135352 (MissingZero!1433 i!1267)) (= lt!135352 (MissingVacant!1433 i!1267))))))

(assert (=> b!270100 (= lt!135352 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270101 () Bool)

(declare-fun Unit!8378 () Unit!8376)

(assert (=> b!270101 (= e!174114 Unit!8378)))

(assert (= (and start!26168 res!134185) b!270094))

(assert (= (and b!270094 res!134190) b!270095))

(assert (= (and b!270095 res!134191) b!270093))

(assert (= (and b!270093 res!134184) b!270096))

(assert (= (and b!270096 res!134188) b!270100))

(assert (= (and b!270100 res!134186) b!270098))

(assert (= (and b!270098 res!134187) b!270097))

(assert (= (and b!270097 res!134189) b!270092))

(assert (= (and b!270092 c!45505) b!270099))

(assert (= (and b!270092 (not c!45505)) b!270101))

(declare-fun m!285299 () Bool)

(assert (=> b!270095 m!285299))

(declare-fun m!285301 () Bool)

(assert (=> b!270098 m!285301))

(declare-fun m!285303 () Bool)

(assert (=> b!270093 m!285303))

(declare-fun m!285305 () Bool)

(assert (=> b!270099 m!285305))

(declare-fun m!285307 () Bool)

(assert (=> b!270099 m!285307))

(declare-fun m!285309 () Bool)

(assert (=> b!270092 m!285309))

(declare-fun m!285311 () Bool)

(assert (=> b!270092 m!285311))

(declare-fun m!285313 () Bool)

(assert (=> b!270097 m!285313))

(declare-fun m!285315 () Bool)

(assert (=> b!270096 m!285315))

(declare-fun m!285317 () Bool)

(assert (=> start!26168 m!285317))

(declare-fun m!285319 () Bool)

(assert (=> start!26168 m!285319))

(declare-fun m!285321 () Bool)

(assert (=> b!270100 m!285321))

(check-sat (not b!270096) (not b!270100) (not b!270092) (not b!270099) (not b!270093) (not b!270098) (not b!270095) (not start!26168))
(check-sat)
