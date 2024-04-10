; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58866 () Bool)

(assert start!58866)

(declare-fun b!649053 () Bool)

(declare-fun e!372282 () Bool)

(declare-fun e!372284 () Bool)

(assert (=> b!649053 (= e!372282 (not e!372284))))

(declare-fun res!420614 () Bool)

(assert (=> b!649053 (=> res!420614 e!372284)))

(declare-datatypes ((SeekEntryResult!6910 0))(
  ( (MissingZero!6910 (index!29987 (_ BitVec 32))) (Found!6910 (index!29988 (_ BitVec 32))) (Intermediate!6910 (undefined!7722 Bool) (index!29989 (_ BitVec 32)) (x!58771 (_ BitVec 32))) (Undefined!6910) (MissingVacant!6910 (index!29990 (_ BitVec 32))) )
))
(declare-fun lt!301342 () SeekEntryResult!6910)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!649053 (= res!420614 (not (= lt!301342 (Found!6910 index!984))))))

(declare-datatypes ((Unit!22086 0))(
  ( (Unit!22087) )
))
(declare-fun lt!301335 () Unit!22086)

(declare-fun e!372275 () Unit!22086)

(assert (=> b!649053 (= lt!301335 e!372275)))

(declare-fun c!74591 () Bool)

(assert (=> b!649053 (= c!74591 (= lt!301342 Undefined!6910))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!301337 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!38528 0))(
  ( (array!38529 (arr!18470 (Array (_ BitVec 32) (_ BitVec 64))) (size!18834 (_ BitVec 32))) )
))
(declare-fun lt!301332 () array!38528)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38528 (_ BitVec 32)) SeekEntryResult!6910)

(assert (=> b!649053 (= lt!301342 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301337 lt!301332 mask!3053))))

(declare-fun e!372274 () Bool)

(assert (=> b!649053 e!372274))

(declare-fun res!420627 () Bool)

(assert (=> b!649053 (=> (not res!420627) (not e!372274))))

(declare-fun lt!301330 () SeekEntryResult!6910)

(declare-fun lt!301334 () (_ BitVec 32))

(assert (=> b!649053 (= res!420627 (= lt!301330 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301334 vacantSpotIndex!68 lt!301337 lt!301332 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38528)

(assert (=> b!649053 (= lt!301330 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301334 vacantSpotIndex!68 (select (arr!18470 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!649053 (= lt!301337 (select (store (arr!18470 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301329 () Unit!22086)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38528 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22086)

(assert (=> b!649053 (= lt!301329 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301334 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649053 (= lt!301334 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649054 () Bool)

(declare-fun e!372270 () Bool)

(declare-fun e!372278 () Bool)

(assert (=> b!649054 (= e!372270 e!372278)))

(declare-fun res!420629 () Bool)

(assert (=> b!649054 (=> (not res!420629) (not e!372278))))

(declare-fun arrayContainsKey!0 (array!38528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649054 (= res!420629 (arrayContainsKey!0 lt!301332 (select (arr!18470 a!2986) j!136) j!136))))

(declare-fun b!649055 () Bool)

(declare-fun Unit!22088 () Unit!22086)

(assert (=> b!649055 (= e!372275 Unit!22088)))

(declare-fun b!649056 () Bool)

(declare-fun lt!301338 () SeekEntryResult!6910)

(assert (=> b!649056 (= e!372274 (= lt!301338 lt!301330))))

(declare-fun res!420620 () Bool)

(declare-fun e!372283 () Bool)

(assert (=> start!58866 (=> (not res!420620) (not e!372283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58866 (= res!420620 (validMask!0 mask!3053))))

(assert (=> start!58866 e!372283))

(assert (=> start!58866 true))

(declare-fun array_inv!14266 (array!38528) Bool)

(assert (=> start!58866 (array_inv!14266 a!2986)))

(declare-fun b!649057 () Bool)

(declare-fun e!372273 () Bool)

(assert (=> b!649057 (= e!372273 (arrayContainsKey!0 lt!301332 (select (arr!18470 a!2986) j!136) index!984))))

(declare-fun b!649058 () Bool)

(declare-fun e!372285 () Unit!22086)

(declare-fun Unit!22089 () Unit!22086)

(assert (=> b!649058 (= e!372285 Unit!22089)))

(declare-fun b!649059 () Bool)

(declare-fun e!372276 () Bool)

(declare-fun e!372279 () Bool)

(assert (=> b!649059 (= e!372276 e!372279)))

(declare-fun res!420609 () Bool)

(assert (=> b!649059 (=> (not res!420609) (not e!372279))))

(assert (=> b!649059 (= res!420609 (= (select (store (arr!18470 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!649059 (= lt!301332 (array!38529 (store (arr!18470 a!2986) i!1108 k!1786) (size!18834 a!2986)))))

(declare-fun b!649060 () Bool)

(declare-fun res!420617 () Bool)

(assert (=> b!649060 (=> (not res!420617) (not e!372283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649060 (= res!420617 (validKeyInArray!0 k!1786))))

(declare-fun b!649061 () Bool)

(declare-fun res!420607 () Bool)

(declare-fun e!372280 () Bool)

(assert (=> b!649061 (=> res!420607 e!372280)))

(declare-datatypes ((List!12511 0))(
  ( (Nil!12508) (Cons!12507 (h!13552 (_ BitVec 64)) (t!18739 List!12511)) )
))
(declare-fun contains!3166 (List!12511 (_ BitVec 64)) Bool)

(assert (=> b!649061 (= res!420607 (contains!3166 Nil!12508 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649062 () Bool)

(declare-fun res!420613 () Bool)

(assert (=> b!649062 (=> res!420613 e!372280)))

(assert (=> b!649062 (= res!420613 (contains!3166 Nil!12508 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649063 () Bool)

(declare-fun Unit!22090 () Unit!22086)

(assert (=> b!649063 (= e!372275 Unit!22090)))

(assert (=> b!649063 false))

(declare-fun b!649064 () Bool)

(assert (=> b!649064 (= e!372280 true)))

(declare-fun lt!301327 () Bool)

(assert (=> b!649064 (= lt!301327 (contains!3166 Nil!12508 k!1786))))

(declare-fun b!649065 () Bool)

(declare-fun res!420618 () Bool)

(assert (=> b!649065 (=> (not res!420618) (not e!372283))))

(assert (=> b!649065 (= res!420618 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649066 () Bool)

(declare-fun res!420610 () Bool)

(assert (=> b!649066 (=> (not res!420610) (not e!372276))))

(assert (=> b!649066 (= res!420610 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18470 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649067 () Bool)

(declare-fun e!372277 () Bool)

(assert (=> b!649067 (= e!372284 e!372277)))

(declare-fun res!420625 () Bool)

(assert (=> b!649067 (=> res!420625 e!372277)))

(declare-fun lt!301328 () (_ BitVec 64))

(assert (=> b!649067 (= res!420625 (or (not (= (select (arr!18470 a!2986) j!136) lt!301337)) (not (= (select (arr!18470 a!2986) j!136) lt!301328))))))

(declare-fun e!372281 () Bool)

(assert (=> b!649067 e!372281))

(declare-fun res!420624 () Bool)

(assert (=> b!649067 (=> (not res!420624) (not e!372281))))

(assert (=> b!649067 (= res!420624 (= lt!301328 (select (arr!18470 a!2986) j!136)))))

(assert (=> b!649067 (= lt!301328 (select (store (arr!18470 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!649068 () Bool)

(declare-fun Unit!22091 () Unit!22086)

(assert (=> b!649068 (= e!372285 Unit!22091)))

(declare-fun lt!301331 () Unit!22086)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38528 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22086)

(assert (=> b!649068 (= lt!301331 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301332 (select (arr!18470 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649068 (arrayContainsKey!0 lt!301332 (select (arr!18470 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301333 () Unit!22086)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38528 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12511) Unit!22086)

(assert (=> b!649068 (= lt!301333 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12508))))

(declare-fun arrayNoDuplicates!0 (array!38528 (_ BitVec 32) List!12511) Bool)

(assert (=> b!649068 (arrayNoDuplicates!0 lt!301332 #b00000000000000000000000000000000 Nil!12508)))

(declare-fun lt!301326 () Unit!22086)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38528 (_ BitVec 32) (_ BitVec 32)) Unit!22086)

(assert (=> b!649068 (= lt!301326 (lemmaNoDuplicateFromThenFromBigger!0 lt!301332 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649068 (arrayNoDuplicates!0 lt!301332 j!136 Nil!12508)))

(declare-fun lt!301336 () Unit!22086)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38528 (_ BitVec 64) (_ BitVec 32) List!12511) Unit!22086)

(assert (=> b!649068 (= lt!301336 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301332 (select (arr!18470 a!2986) j!136) j!136 Nil!12508))))

(assert (=> b!649068 false))

(declare-fun b!649069 () Bool)

(declare-fun res!420628 () Bool)

(assert (=> b!649069 (=> (not res!420628) (not e!372276))))

(assert (=> b!649069 (= res!420628 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12508))))

(declare-fun b!649070 () Bool)

(assert (=> b!649070 (= e!372279 e!372282)))

(declare-fun res!420626 () Bool)

(assert (=> b!649070 (=> (not res!420626) (not e!372282))))

(assert (=> b!649070 (= res!420626 (and (= lt!301338 (Found!6910 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18470 a!2986) index!984) (select (arr!18470 a!2986) j!136))) (not (= (select (arr!18470 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!649070 (= lt!301338 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18470 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649071 () Bool)

(assert (=> b!649071 (= e!372283 e!372276)))

(declare-fun res!420621 () Bool)

(assert (=> b!649071 (=> (not res!420621) (not e!372276))))

(declare-fun lt!301339 () SeekEntryResult!6910)

(assert (=> b!649071 (= res!420621 (or (= lt!301339 (MissingZero!6910 i!1108)) (= lt!301339 (MissingVacant!6910 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38528 (_ BitVec 32)) SeekEntryResult!6910)

(assert (=> b!649071 (= lt!301339 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!649072 () Bool)

(declare-fun res!420608 () Bool)

(assert (=> b!649072 (=> res!420608 e!372280)))

(declare-fun noDuplicate!428 (List!12511) Bool)

(assert (=> b!649072 (= res!420608 (not (noDuplicate!428 Nil!12508)))))

(declare-fun b!649073 () Bool)

(assert (=> b!649073 (= e!372281 e!372270)))

(declare-fun res!420612 () Bool)

(assert (=> b!649073 (=> res!420612 e!372270)))

(assert (=> b!649073 (= res!420612 (or (not (= (select (arr!18470 a!2986) j!136) lt!301337)) (not (= (select (arr!18470 a!2986) j!136) lt!301328)) (bvsge j!136 index!984)))))

(declare-fun b!649074 () Bool)

(declare-fun e!372272 () Bool)

(assert (=> b!649074 (= e!372277 e!372272)))

(declare-fun res!420619 () Bool)

(assert (=> b!649074 (=> res!420619 e!372272)))

(assert (=> b!649074 (= res!420619 (bvsge index!984 j!136))))

(declare-fun lt!301340 () Unit!22086)

(assert (=> b!649074 (= lt!301340 e!372285)))

(declare-fun c!74590 () Bool)

(assert (=> b!649074 (= c!74590 (bvslt j!136 index!984))))

(declare-fun b!649075 () Bool)

(assert (=> b!649075 (= e!372272 e!372280)))

(declare-fun res!420615 () Bool)

(assert (=> b!649075 (=> res!420615 e!372280)))

(assert (=> b!649075 (= res!420615 (or (bvsge (size!18834 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18834 a!2986))))))

(assert (=> b!649075 (arrayContainsKey!0 lt!301332 (select (arr!18470 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301341 () Unit!22086)

(assert (=> b!649075 (= lt!301341 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301332 (select (arr!18470 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!649075 e!372273))

(declare-fun res!420623 () Bool)

(assert (=> b!649075 (=> (not res!420623) (not e!372273))))

(assert (=> b!649075 (= res!420623 (arrayContainsKey!0 lt!301332 (select (arr!18470 a!2986) j!136) j!136))))

(declare-fun b!649076 () Bool)

(declare-fun res!420611 () Bool)

(assert (=> b!649076 (=> (not res!420611) (not e!372283))))

(assert (=> b!649076 (= res!420611 (validKeyInArray!0 (select (arr!18470 a!2986) j!136)))))

(declare-fun b!649077 () Bool)

(declare-fun res!420622 () Bool)

(assert (=> b!649077 (=> (not res!420622) (not e!372283))))

(assert (=> b!649077 (= res!420622 (and (= (size!18834 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18834 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18834 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649078 () Bool)

(assert (=> b!649078 (= e!372278 (arrayContainsKey!0 lt!301332 (select (arr!18470 a!2986) j!136) index!984))))

(declare-fun b!649079 () Bool)

(declare-fun res!420616 () Bool)

(assert (=> b!649079 (=> (not res!420616) (not e!372276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38528 (_ BitVec 32)) Bool)

(assert (=> b!649079 (= res!420616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!58866 res!420620) b!649077))

(assert (= (and b!649077 res!420622) b!649076))

(assert (= (and b!649076 res!420611) b!649060))

(assert (= (and b!649060 res!420617) b!649065))

(assert (= (and b!649065 res!420618) b!649071))

(assert (= (and b!649071 res!420621) b!649079))

(assert (= (and b!649079 res!420616) b!649069))

(assert (= (and b!649069 res!420628) b!649066))

(assert (= (and b!649066 res!420610) b!649059))

(assert (= (and b!649059 res!420609) b!649070))

(assert (= (and b!649070 res!420626) b!649053))

(assert (= (and b!649053 res!420627) b!649056))

(assert (= (and b!649053 c!74591) b!649063))

(assert (= (and b!649053 (not c!74591)) b!649055))

(assert (= (and b!649053 (not res!420614)) b!649067))

(assert (= (and b!649067 res!420624) b!649073))

(assert (= (and b!649073 (not res!420612)) b!649054))

(assert (= (and b!649054 res!420629) b!649078))

(assert (= (and b!649067 (not res!420625)) b!649074))

(assert (= (and b!649074 c!74590) b!649068))

(assert (= (and b!649074 (not c!74590)) b!649058))

(assert (= (and b!649074 (not res!420619)) b!649075))

(assert (= (and b!649075 res!420623) b!649057))

(assert (= (and b!649075 (not res!420615)) b!649072))

(assert (= (and b!649072 (not res!420608)) b!649062))

(assert (= (and b!649062 (not res!420613)) b!649061))

(assert (= (and b!649061 (not res!420607)) b!649064))

(declare-fun m!622349 () Bool)

(assert (=> b!649065 m!622349))

(declare-fun m!622351 () Bool)

(assert (=> b!649059 m!622351))

(declare-fun m!622353 () Bool)

(assert (=> b!649059 m!622353))

(declare-fun m!622355 () Bool)

(assert (=> b!649068 m!622355))

(declare-fun m!622357 () Bool)

(assert (=> b!649068 m!622357))

(declare-fun m!622359 () Bool)

(assert (=> b!649068 m!622359))

(assert (=> b!649068 m!622357))

(declare-fun m!622361 () Bool)

(assert (=> b!649068 m!622361))

(assert (=> b!649068 m!622357))

(declare-fun m!622363 () Bool)

(assert (=> b!649068 m!622363))

(declare-fun m!622365 () Bool)

(assert (=> b!649068 m!622365))

(assert (=> b!649068 m!622357))

(declare-fun m!622367 () Bool)

(assert (=> b!649068 m!622367))

(declare-fun m!622369 () Bool)

(assert (=> b!649068 m!622369))

(declare-fun m!622371 () Bool)

(assert (=> start!58866 m!622371))

(declare-fun m!622373 () Bool)

(assert (=> start!58866 m!622373))

(declare-fun m!622375 () Bool)

(assert (=> b!649070 m!622375))

(assert (=> b!649070 m!622357))

(assert (=> b!649070 m!622357))

(declare-fun m!622377 () Bool)

(assert (=> b!649070 m!622377))

(assert (=> b!649076 m!622357))

(assert (=> b!649076 m!622357))

(declare-fun m!622379 () Bool)

(assert (=> b!649076 m!622379))

(declare-fun m!622381 () Bool)

(assert (=> b!649079 m!622381))

(assert (=> b!649054 m!622357))

(assert (=> b!649054 m!622357))

(declare-fun m!622383 () Bool)

(assert (=> b!649054 m!622383))

(declare-fun m!622385 () Bool)

(assert (=> b!649069 m!622385))

(assert (=> b!649067 m!622357))

(assert (=> b!649067 m!622351))

(declare-fun m!622387 () Bool)

(assert (=> b!649067 m!622387))

(assert (=> b!649078 m!622357))

(assert (=> b!649078 m!622357))

(declare-fun m!622389 () Bool)

(assert (=> b!649078 m!622389))

(declare-fun m!622391 () Bool)

(assert (=> b!649061 m!622391))

(declare-fun m!622393 () Bool)

(assert (=> b!649071 m!622393))

(declare-fun m!622395 () Bool)

(assert (=> b!649066 m!622395))

(assert (=> b!649073 m!622357))

(declare-fun m!622397 () Bool)

(assert (=> b!649072 m!622397))

(assert (=> b!649075 m!622357))

(assert (=> b!649075 m!622357))

(declare-fun m!622399 () Bool)

(assert (=> b!649075 m!622399))

(assert (=> b!649075 m!622357))

(declare-fun m!622401 () Bool)

(assert (=> b!649075 m!622401))

(assert (=> b!649075 m!622357))

(assert (=> b!649075 m!622383))

(declare-fun m!622403 () Bool)

(assert (=> b!649053 m!622403))

(declare-fun m!622405 () Bool)

(assert (=> b!649053 m!622405))

(declare-fun m!622407 () Bool)

(assert (=> b!649053 m!622407))

(assert (=> b!649053 m!622357))

(declare-fun m!622409 () Bool)

(assert (=> b!649053 m!622409))

(assert (=> b!649053 m!622351))

(declare-fun m!622411 () Bool)

(assert (=> b!649053 m!622411))

(assert (=> b!649053 m!622357))

(declare-fun m!622413 () Bool)

(assert (=> b!649053 m!622413))

(declare-fun m!622415 () Bool)

(assert (=> b!649062 m!622415))

(declare-fun m!622417 () Bool)

(assert (=> b!649064 m!622417))

(assert (=> b!649057 m!622357))

(assert (=> b!649057 m!622357))

(assert (=> b!649057 m!622389))

(declare-fun m!622419 () Bool)

(assert (=> b!649060 m!622419))

(push 1)

