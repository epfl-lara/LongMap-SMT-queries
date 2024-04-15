; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56118 () Bool)

(assert start!56118)

(declare-fun b!620066 () Bool)

(declare-fun res!399610 () Bool)

(declare-fun e!355614 () Bool)

(assert (=> b!620066 (=> (not res!399610) (not e!355614))))

(declare-datatypes ((array!37602 0))(
  ( (array!37603 (arr!18047 (Array (_ BitVec 32) (_ BitVec 64))) (size!18412 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37602)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37602 (_ BitVec 32)) Bool)

(assert (=> b!620066 (= res!399610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620067 () Bool)

(declare-fun e!355617 () Bool)

(assert (=> b!620067 (= e!355614 e!355617)))

(declare-fun res!399615 () Bool)

(assert (=> b!620067 (=> (not res!399615) (not e!355617))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!620067 (= res!399615 (= (select (store (arr!18047 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!286421 () array!37602)

(assert (=> b!620067 (= lt!286421 (array!37603 (store (arr!18047 a!2986) i!1108 k0!1786) (size!18412 a!2986)))))

(declare-fun b!620068 () Bool)

(declare-datatypes ((Unit!20586 0))(
  ( (Unit!20587) )
))
(declare-fun e!355618 () Unit!20586)

(declare-fun Unit!20588 () Unit!20586)

(assert (=> b!620068 (= e!355618 Unit!20588)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun res!399604 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!620068 (= res!399604 (= (select (store (arr!18047 a!2986) i!1108 k0!1786) index!984) (select (arr!18047 a!2986) j!136)))))

(declare-fun e!355623 () Bool)

(assert (=> b!620068 (=> (not res!399604) (not e!355623))))

(assert (=> b!620068 e!355623))

(declare-fun c!70602 () Bool)

(assert (=> b!620068 (= c!70602 (bvslt j!136 index!984))))

(declare-fun lt!286406 () Unit!20586)

(declare-fun e!355615 () Unit!20586)

(assert (=> b!620068 (= lt!286406 e!355615)))

(declare-fun c!70599 () Bool)

(assert (=> b!620068 (= c!70599 (bvslt index!984 j!136))))

(declare-fun lt!286415 () Unit!20586)

(declare-fun e!355616 () Unit!20586)

(assert (=> b!620068 (= lt!286415 e!355616)))

(assert (=> b!620068 false))

(declare-fun b!620069 () Bool)

(assert (=> b!620069 false))

(declare-fun lt!286413 () Unit!20586)

(declare-datatypes ((List!12127 0))(
  ( (Nil!12124) (Cons!12123 (h!13168 (_ BitVec 64)) (t!18346 List!12127)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37602 (_ BitVec 64) (_ BitVec 32) List!12127) Unit!20586)

(assert (=> b!620069 (= lt!286413 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286421 (select (arr!18047 a!2986) j!136) j!136 Nil!12124))))

(declare-fun arrayNoDuplicates!0 (array!37602 (_ BitVec 32) List!12127) Bool)

(assert (=> b!620069 (arrayNoDuplicates!0 lt!286421 j!136 Nil!12124)))

(declare-fun lt!286419 () Unit!20586)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37602 (_ BitVec 32) (_ BitVec 32)) Unit!20586)

(assert (=> b!620069 (= lt!286419 (lemmaNoDuplicateFromThenFromBigger!0 lt!286421 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620069 (arrayNoDuplicates!0 lt!286421 #b00000000000000000000000000000000 Nil!12124)))

(declare-fun lt!286423 () Unit!20586)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37602 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12127) Unit!20586)

(assert (=> b!620069 (= lt!286423 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12124))))

(declare-fun arrayContainsKey!0 (array!37602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620069 (arrayContainsKey!0 lt!286421 (select (arr!18047 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286410 () Unit!20586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37602 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20586)

(assert (=> b!620069 (= lt!286410 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286421 (select (arr!18047 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20589 () Unit!20586)

(assert (=> b!620069 (= e!355615 Unit!20589)))

(declare-fun res!399614 () Bool)

(declare-fun e!355625 () Bool)

(assert (=> start!56118 (=> (not res!399614) (not e!355625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56118 (= res!399614 (validMask!0 mask!3053))))

(assert (=> start!56118 e!355625))

(assert (=> start!56118 true))

(declare-fun array_inv!13930 (array!37602) Bool)

(assert (=> start!56118 (array_inv!13930 a!2986)))

(declare-fun b!620070 () Bool)

(declare-fun e!355626 () Unit!20586)

(declare-fun Unit!20590 () Unit!20586)

(assert (=> b!620070 (= e!355626 Unit!20590)))

(declare-fun b!620071 () Bool)

(declare-fun res!399605 () Bool)

(assert (=> b!620071 (=> (not res!399605) (not e!355625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620071 (= res!399605 (validKeyInArray!0 (select (arr!18047 a!2986) j!136)))))

(declare-fun b!620072 () Bool)

(declare-fun res!399606 () Bool)

(assert (=> b!620072 (=> (not res!399606) (not e!355625))))

(assert (=> b!620072 (= res!399606 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620073 () Bool)

(declare-fun e!355619 () Bool)

(assert (=> b!620073 (= e!355619 (arrayContainsKey!0 lt!286421 (select (arr!18047 a!2986) j!136) index!984))))

(declare-fun b!620074 () Bool)

(declare-fun e!355622 () Bool)

(declare-datatypes ((SeekEntryResult!6484 0))(
  ( (MissingZero!6484 (index!28220 (_ BitVec 32))) (Found!6484 (index!28221 (_ BitVec 32))) (Intermediate!6484 (undefined!7296 Bool) (index!28222 (_ BitVec 32)) (x!57007 (_ BitVec 32))) (Undefined!6484) (MissingVacant!6484 (index!28223 (_ BitVec 32))) )
))
(declare-fun lt!286404 () SeekEntryResult!6484)

(declare-fun lt!286414 () SeekEntryResult!6484)

(assert (=> b!620074 (= e!355622 (= lt!286404 lt!286414))))

(declare-fun b!620075 () Bool)

(declare-fun e!355621 () Bool)

(assert (=> b!620075 (= e!355621 (arrayContainsKey!0 lt!286421 (select (arr!18047 a!2986) j!136) index!984))))

(declare-fun b!620076 () Bool)

(declare-fun res!399607 () Bool)

(assert (=> b!620076 (=> (not res!399607) (not e!355614))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!620076 (= res!399607 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18047 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620077 () Bool)

(declare-fun res!399611 () Bool)

(assert (=> b!620077 (=> (not res!399611) (not e!355625))))

(assert (=> b!620077 (= res!399611 (and (= (size!18412 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18412 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18412 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620078 () Bool)

(assert (=> b!620078 false))

(declare-fun lt!286422 () Unit!20586)

(assert (=> b!620078 (= lt!286422 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286421 (select (arr!18047 a!2986) j!136) index!984 Nil!12124))))

(assert (=> b!620078 (arrayNoDuplicates!0 lt!286421 index!984 Nil!12124)))

(declare-fun lt!286408 () Unit!20586)

(assert (=> b!620078 (= lt!286408 (lemmaNoDuplicateFromThenFromBigger!0 lt!286421 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620078 (arrayNoDuplicates!0 lt!286421 #b00000000000000000000000000000000 Nil!12124)))

(declare-fun lt!286412 () Unit!20586)

(assert (=> b!620078 (= lt!286412 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12124))))

(assert (=> b!620078 (arrayContainsKey!0 lt!286421 (select (arr!18047 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286417 () Unit!20586)

(assert (=> b!620078 (= lt!286417 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286421 (select (arr!18047 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620078 e!355619))

(declare-fun res!399613 () Bool)

(assert (=> b!620078 (=> (not res!399613) (not e!355619))))

(assert (=> b!620078 (= res!399613 (arrayContainsKey!0 lt!286421 (select (arr!18047 a!2986) j!136) j!136))))

(declare-fun Unit!20591 () Unit!20586)

(assert (=> b!620078 (= e!355616 Unit!20591)))

(declare-fun b!620079 () Bool)

(assert (=> b!620079 (= e!355625 e!355614)))

(declare-fun res!399612 () Bool)

(assert (=> b!620079 (=> (not res!399612) (not e!355614))))

(declare-fun lt!286418 () SeekEntryResult!6484)

(assert (=> b!620079 (= res!399612 (or (= lt!286418 (MissingZero!6484 i!1108)) (= lt!286418 (MissingVacant!6484 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37602 (_ BitVec 32)) SeekEntryResult!6484)

(assert (=> b!620079 (= lt!286418 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!620080 () Bool)

(declare-fun Unit!20592 () Unit!20586)

(assert (=> b!620080 (= e!355615 Unit!20592)))

(declare-fun b!620081 () Bool)

(declare-fun Unit!20593 () Unit!20586)

(assert (=> b!620081 (= e!355618 Unit!20593)))

(declare-fun res!399602 () Bool)

(declare-fun b!620082 () Bool)

(assert (=> b!620082 (= res!399602 (arrayContainsKey!0 lt!286421 (select (arr!18047 a!2986) j!136) j!136))))

(assert (=> b!620082 (=> (not res!399602) (not e!355621))))

(declare-fun e!355620 () Bool)

(assert (=> b!620082 (= e!355620 e!355621)))

(declare-fun b!620083 () Bool)

(declare-fun res!399603 () Bool)

(assert (=> b!620083 (=> (not res!399603) (not e!355614))))

(assert (=> b!620083 (= res!399603 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12124))))

(declare-fun b!620084 () Bool)

(declare-fun Unit!20594 () Unit!20586)

(assert (=> b!620084 (= e!355616 Unit!20594)))

(declare-fun b!620085 () Bool)

(declare-fun res!399608 () Bool)

(assert (=> b!620085 (=> (not res!399608) (not e!355625))))

(assert (=> b!620085 (= res!399608 (validKeyInArray!0 k0!1786))))

(declare-fun lt!286411 () SeekEntryResult!6484)

(declare-fun b!620086 () Bool)

(declare-fun e!355624 () Bool)

(assert (=> b!620086 (= e!355624 (not (or (= lt!286411 (MissingVacant!6484 vacantSpotIndex!68)) (bvsge mask!3053 #b00000000000000000000000000000000))))))

(declare-fun lt!286416 () Unit!20586)

(assert (=> b!620086 (= lt!286416 e!355618)))

(declare-fun c!70601 () Bool)

(assert (=> b!620086 (= c!70601 (= lt!286411 (Found!6484 index!984)))))

(declare-fun lt!286405 () Unit!20586)

(assert (=> b!620086 (= lt!286405 e!355626)))

(declare-fun c!70600 () Bool)

(assert (=> b!620086 (= c!70600 (= lt!286411 Undefined!6484))))

(declare-fun lt!286409 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37602 (_ BitVec 32)) SeekEntryResult!6484)

(assert (=> b!620086 (= lt!286411 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286409 lt!286421 mask!3053))))

(assert (=> b!620086 e!355622))

(declare-fun res!399616 () Bool)

(assert (=> b!620086 (=> (not res!399616) (not e!355622))))

(declare-fun lt!286420 () (_ BitVec 32))

(assert (=> b!620086 (= res!399616 (= lt!286414 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286420 vacantSpotIndex!68 lt!286409 lt!286421 mask!3053)))))

(assert (=> b!620086 (= lt!286414 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286420 vacantSpotIndex!68 (select (arr!18047 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620086 (= lt!286409 (select (store (arr!18047 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286407 () Unit!20586)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37602 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20586)

(assert (=> b!620086 (= lt!286407 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286420 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620086 (= lt!286420 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620087 () Bool)

(declare-fun res!399617 () Bool)

(assert (=> b!620087 (= res!399617 (bvsge j!136 index!984))))

(assert (=> b!620087 (=> res!399617 e!355620)))

(assert (=> b!620087 (= e!355623 e!355620)))

(declare-fun b!620088 () Bool)

(assert (=> b!620088 (= e!355617 e!355624)))

(declare-fun res!399609 () Bool)

(assert (=> b!620088 (=> (not res!399609) (not e!355624))))

(assert (=> b!620088 (= res!399609 (and (= lt!286404 (Found!6484 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18047 a!2986) index!984) (select (arr!18047 a!2986) j!136))) (not (= (select (arr!18047 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!620088 (= lt!286404 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18047 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620089 () Bool)

(declare-fun Unit!20595 () Unit!20586)

(assert (=> b!620089 (= e!355626 Unit!20595)))

(assert (=> b!620089 false))

(assert (= (and start!56118 res!399614) b!620077))

(assert (= (and b!620077 res!399611) b!620071))

(assert (= (and b!620071 res!399605) b!620085))

(assert (= (and b!620085 res!399608) b!620072))

(assert (= (and b!620072 res!399606) b!620079))

(assert (= (and b!620079 res!399612) b!620066))

(assert (= (and b!620066 res!399610) b!620083))

(assert (= (and b!620083 res!399603) b!620076))

(assert (= (and b!620076 res!399607) b!620067))

(assert (= (and b!620067 res!399615) b!620088))

(assert (= (and b!620088 res!399609) b!620086))

(assert (= (and b!620086 res!399616) b!620074))

(assert (= (and b!620086 c!70600) b!620089))

(assert (= (and b!620086 (not c!70600)) b!620070))

(assert (= (and b!620086 c!70601) b!620068))

(assert (= (and b!620086 (not c!70601)) b!620081))

(assert (= (and b!620068 res!399604) b!620087))

(assert (= (and b!620087 (not res!399617)) b!620082))

(assert (= (and b!620082 res!399602) b!620075))

(assert (= (and b!620068 c!70602) b!620069))

(assert (= (and b!620068 (not c!70602)) b!620080))

(assert (= (and b!620068 c!70599) b!620078))

(assert (= (and b!620068 (not c!70599)) b!620084))

(assert (= (and b!620078 res!399613) b!620073))

(declare-fun m!595489 () Bool)

(assert (=> b!620079 m!595489))

(declare-fun m!595491 () Bool)

(assert (=> b!620069 m!595491))

(declare-fun m!595493 () Bool)

(assert (=> b!620069 m!595493))

(declare-fun m!595495 () Bool)

(assert (=> b!620069 m!595495))

(assert (=> b!620069 m!595491))

(declare-fun m!595497 () Bool)

(assert (=> b!620069 m!595497))

(assert (=> b!620069 m!595491))

(declare-fun m!595499 () Bool)

(assert (=> b!620069 m!595499))

(declare-fun m!595501 () Bool)

(assert (=> b!620069 m!595501))

(assert (=> b!620069 m!595491))

(declare-fun m!595503 () Bool)

(assert (=> b!620069 m!595503))

(declare-fun m!595505 () Bool)

(assert (=> b!620069 m!595505))

(assert (=> b!620078 m!595491))

(declare-fun m!595507 () Bool)

(assert (=> b!620078 m!595507))

(assert (=> b!620078 m!595495))

(assert (=> b!620078 m!595491))

(declare-fun m!595509 () Bool)

(assert (=> b!620078 m!595509))

(assert (=> b!620078 m!595491))

(declare-fun m!595511 () Bool)

(assert (=> b!620078 m!595511))

(assert (=> b!620078 m!595491))

(declare-fun m!595513 () Bool)

(assert (=> b!620078 m!595513))

(assert (=> b!620078 m!595491))

(declare-fun m!595515 () Bool)

(assert (=> b!620078 m!595515))

(declare-fun m!595517 () Bool)

(assert (=> b!620078 m!595517))

(assert (=> b!620078 m!595501))

(assert (=> b!620082 m!595491))

(assert (=> b!620082 m!595491))

(assert (=> b!620082 m!595511))

(assert (=> b!620071 m!595491))

(assert (=> b!620071 m!595491))

(declare-fun m!595519 () Bool)

(assert (=> b!620071 m!595519))

(declare-fun m!595521 () Bool)

(assert (=> b!620076 m!595521))

(declare-fun m!595523 () Bool)

(assert (=> b!620066 m!595523))

(assert (=> b!620075 m!595491))

(assert (=> b!620075 m!595491))

(declare-fun m!595525 () Bool)

(assert (=> b!620075 m!595525))

(declare-fun m!595527 () Bool)

(assert (=> b!620072 m!595527))

(declare-fun m!595529 () Bool)

(assert (=> b!620086 m!595529))

(declare-fun m!595531 () Bool)

(assert (=> b!620086 m!595531))

(declare-fun m!595533 () Bool)

(assert (=> b!620086 m!595533))

(declare-fun m!595535 () Bool)

(assert (=> b!620086 m!595535))

(assert (=> b!620086 m!595491))

(declare-fun m!595537 () Bool)

(assert (=> b!620086 m!595537))

(declare-fun m!595539 () Bool)

(assert (=> b!620086 m!595539))

(assert (=> b!620086 m!595491))

(declare-fun m!595541 () Bool)

(assert (=> b!620086 m!595541))

(declare-fun m!595543 () Bool)

(assert (=> b!620085 m!595543))

(assert (=> b!620067 m!595535))

(declare-fun m!595545 () Bool)

(assert (=> b!620067 m!595545))

(assert (=> b!620073 m!595491))

(assert (=> b!620073 m!595491))

(assert (=> b!620073 m!595525))

(declare-fun m!595547 () Bool)

(assert (=> start!56118 m!595547))

(declare-fun m!595549 () Bool)

(assert (=> start!56118 m!595549))

(declare-fun m!595551 () Bool)

(assert (=> b!620088 m!595551))

(assert (=> b!620088 m!595491))

(assert (=> b!620088 m!595491))

(declare-fun m!595553 () Bool)

(assert (=> b!620088 m!595553))

(declare-fun m!595555 () Bool)

(assert (=> b!620083 m!595555))

(assert (=> b!620068 m!595535))

(declare-fun m!595557 () Bool)

(assert (=> b!620068 m!595557))

(assert (=> b!620068 m!595491))

(check-sat (not b!620079) (not b!620088) (not b!620075) (not b!620082) (not b!620083) (not b!620073) (not b!620086) (not start!56118) (not b!620066) (not b!620085) (not b!620072) (not b!620069) (not b!620071) (not b!620078))
(check-sat)
