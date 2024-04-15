; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56076 () Bool)

(assert start!56076)

(declare-fun b!618502 () Bool)

(declare-fun e!354685 () Bool)

(declare-fun e!354692 () Bool)

(assert (=> b!618502 (= e!354685 e!354692)))

(declare-fun res!398548 () Bool)

(assert (=> b!618502 (=> (not res!398548) (not e!354692))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37560 0))(
  ( (array!37561 (arr!18026 (Array (_ BitVec 32) (_ BitVec 64))) (size!18391 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37560)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!618502 (= res!398548 (= (select (store (arr!18026 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!285145 () array!37560)

(assert (=> b!618502 (= lt!285145 (array!37561 (store (arr!18026 a!2986) i!1108 k0!1786) (size!18391 a!2986)))))

(declare-fun b!618503 () Bool)

(assert (=> b!618503 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!20376 0))(
  ( (Unit!20377) )
))
(declare-fun lt!285154 () Unit!20376)

(declare-datatypes ((List!12106 0))(
  ( (Nil!12103) (Cons!12102 (h!13147 (_ BitVec 64)) (t!18325 List!12106)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37560 (_ BitVec 64) (_ BitVec 32) List!12106) Unit!20376)

(assert (=> b!618503 (= lt!285154 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285145 (select (arr!18026 a!2986) j!136) j!136 Nil!12103))))

(declare-fun arrayNoDuplicates!0 (array!37560 (_ BitVec 32) List!12106) Bool)

(assert (=> b!618503 (arrayNoDuplicates!0 lt!285145 j!136 Nil!12103)))

(declare-fun lt!285158 () Unit!20376)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37560 (_ BitVec 32) (_ BitVec 32)) Unit!20376)

(assert (=> b!618503 (= lt!285158 (lemmaNoDuplicateFromThenFromBigger!0 lt!285145 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618503 (arrayNoDuplicates!0 lt!285145 #b00000000000000000000000000000000 Nil!12103)))

(declare-fun lt!285151 () Unit!20376)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37560 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12106) Unit!20376)

(assert (=> b!618503 (= lt!285151 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12103))))

(declare-fun arrayContainsKey!0 (array!37560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618503 (arrayContainsKey!0 lt!285145 (select (arr!18026 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285146 () Unit!20376)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37560 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20376)

(assert (=> b!618503 (= lt!285146 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285145 (select (arr!18026 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!354686 () Unit!20376)

(declare-fun Unit!20378 () Unit!20376)

(assert (=> b!618503 (= e!354686 Unit!20378)))

(declare-fun b!618504 () Bool)

(declare-fun e!354691 () Bool)

(assert (=> b!618504 (= e!354691 (arrayContainsKey!0 lt!285145 (select (arr!18026 a!2986) j!136) index!984))))

(declare-fun b!618505 () Bool)

(declare-fun res!398549 () Bool)

(assert (=> b!618505 (=> (not res!398549) (not e!354685))))

(assert (=> b!618505 (= res!398549 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12103))))

(declare-fun b!618506 () Bool)

(declare-fun res!398544 () Bool)

(declare-fun e!354693 () Bool)

(assert (=> b!618506 (=> (not res!398544) (not e!354693))))

(assert (=> b!618506 (= res!398544 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618507 () Bool)

(declare-fun e!354683 () Bool)

(assert (=> b!618507 (= e!354692 e!354683)))

(declare-fun res!398553 () Bool)

(assert (=> b!618507 (=> (not res!398553) (not e!354683))))

(declare-datatypes ((SeekEntryResult!6463 0))(
  ( (MissingZero!6463 (index!28136 (_ BitVec 32))) (Found!6463 (index!28137 (_ BitVec 32))) (Intermediate!6463 (undefined!7275 Bool) (index!28138 (_ BitVec 32)) (x!56930 (_ BitVec 32))) (Undefined!6463) (MissingVacant!6463 (index!28139 (_ BitVec 32))) )
))
(declare-fun lt!285150 () SeekEntryResult!6463)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!618507 (= res!398553 (and (= lt!285150 (Found!6463 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18026 a!2986) index!984) (select (arr!18026 a!2986) j!136))) (not (= (select (arr!18026 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37560 (_ BitVec 32)) SeekEntryResult!6463)

(assert (=> b!618507 (= lt!285150 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18026 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618508 () Bool)

(declare-fun res!398555 () Bool)

(assert (=> b!618508 (=> (not res!398555) (not e!354693))))

(assert (=> b!618508 (= res!398555 (and (= (size!18391 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18391 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18391 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618509 () Bool)

(declare-fun e!354688 () Unit!20376)

(declare-fun Unit!20379 () Unit!20376)

(assert (=> b!618509 (= e!354688 Unit!20379)))

(declare-fun b!618511 () Bool)

(declare-fun Unit!20380 () Unit!20376)

(assert (=> b!618511 (= e!354688 Unit!20380)))

(declare-fun res!398543 () Bool)

(assert (=> b!618511 (= res!398543 (= (select (store (arr!18026 a!2986) i!1108 k0!1786) index!984) (select (arr!18026 a!2986) j!136)))))

(declare-fun e!354681 () Bool)

(assert (=> b!618511 (=> (not res!398543) (not e!354681))))

(assert (=> b!618511 e!354681))

(declare-fun c!70348 () Bool)

(assert (=> b!618511 (= c!70348 (bvslt j!136 index!984))))

(declare-fun lt!285157 () Unit!20376)

(assert (=> b!618511 (= lt!285157 e!354686)))

(declare-fun c!70350 () Bool)

(assert (=> b!618511 (= c!70350 (bvslt index!984 j!136))))

(declare-fun lt!285162 () Unit!20376)

(declare-fun e!354682 () Unit!20376)

(assert (=> b!618511 (= lt!285162 e!354682)))

(assert (=> b!618511 false))

(declare-fun e!354679 () Bool)

(declare-fun b!618512 () Bool)

(assert (=> b!618512 (= e!354679 (arrayContainsKey!0 lt!285145 (select (arr!18026 a!2986) j!136) index!984))))

(declare-fun b!618513 () Bool)

(assert (=> b!618513 (= e!354693 e!354685)))

(declare-fun res!398551 () Bool)

(assert (=> b!618513 (=> (not res!398551) (not e!354685))))

(declare-fun lt!285163 () SeekEntryResult!6463)

(assert (=> b!618513 (= res!398551 (or (= lt!285163 (MissingZero!6463 i!1108)) (= lt!285163 (MissingVacant!6463 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37560 (_ BitVec 32)) SeekEntryResult!6463)

(assert (=> b!618513 (= lt!285163 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!618514 () Bool)

(declare-fun res!398542 () Bool)

(assert (=> b!618514 (=> (not res!398542) (not e!354693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618514 (= res!398542 (validKeyInArray!0 k0!1786))))

(declare-fun b!618515 () Bool)

(declare-fun res!398554 () Bool)

(assert (=> b!618515 (= res!398554 (bvsge j!136 index!984))))

(declare-fun e!354690 () Bool)

(assert (=> b!618515 (=> res!398554 e!354690)))

(assert (=> b!618515 (= e!354681 e!354690)))

(declare-fun b!618516 () Bool)

(declare-fun e!354684 () Bool)

(assert (=> b!618516 (= e!354683 (not e!354684))))

(declare-fun res!398556 () Bool)

(assert (=> b!618516 (=> res!398556 e!354684)))

(declare-fun lt!285152 () SeekEntryResult!6463)

(assert (=> b!618516 (= res!398556 (not (= lt!285152 (MissingVacant!6463 vacantSpotIndex!68))))))

(declare-fun lt!285148 () Unit!20376)

(assert (=> b!618516 (= lt!285148 e!354688)))

(declare-fun c!70347 () Bool)

(assert (=> b!618516 (= c!70347 (= lt!285152 (Found!6463 index!984)))))

(declare-fun lt!285144 () Unit!20376)

(declare-fun e!354687 () Unit!20376)

(assert (=> b!618516 (= lt!285144 e!354687)))

(declare-fun c!70349 () Bool)

(assert (=> b!618516 (= c!70349 (= lt!285152 Undefined!6463))))

(declare-fun lt!285153 () (_ BitVec 64))

(assert (=> b!618516 (= lt!285152 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285153 lt!285145 mask!3053))))

(declare-fun e!354689 () Bool)

(assert (=> b!618516 e!354689))

(declare-fun res!398546 () Bool)

(assert (=> b!618516 (=> (not res!398546) (not e!354689))))

(declare-fun lt!285156 () SeekEntryResult!6463)

(declare-fun lt!285160 () (_ BitVec 32))

(assert (=> b!618516 (= res!398546 (= lt!285156 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285160 vacantSpotIndex!68 lt!285153 lt!285145 mask!3053)))))

(assert (=> b!618516 (= lt!285156 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285160 vacantSpotIndex!68 (select (arr!18026 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618516 (= lt!285153 (select (store (arr!18026 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285155 () Unit!20376)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37560 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20376)

(assert (=> b!618516 (= lt!285155 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285160 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618516 (= lt!285160 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618517 () Bool)

(declare-fun Unit!20381 () Unit!20376)

(assert (=> b!618517 (= e!354682 Unit!20381)))

(declare-fun b!618518 () Bool)

(declare-fun res!398545 () Bool)

(assert (=> b!618518 (=> (not res!398545) (not e!354685))))

(assert (=> b!618518 (= res!398545 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18026 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!398558 () Bool)

(assert (=> start!56076 (=> (not res!398558) (not e!354693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56076 (= res!398558 (validMask!0 mask!3053))))

(assert (=> start!56076 e!354693))

(assert (=> start!56076 true))

(declare-fun array_inv!13909 (array!37560) Bool)

(assert (=> start!56076 (array_inv!13909 a!2986)))

(declare-fun res!398547 () Bool)

(declare-fun b!618510 () Bool)

(assert (=> b!618510 (= res!398547 (arrayContainsKey!0 lt!285145 (select (arr!18026 a!2986) j!136) j!136))))

(assert (=> b!618510 (=> (not res!398547) (not e!354691))))

(assert (=> b!618510 (= e!354690 e!354691)))

(declare-fun b!618519 () Bool)

(assert (=> b!618519 (= e!354689 (= lt!285150 lt!285156))))

(declare-fun b!618520 () Bool)

(declare-fun Unit!20382 () Unit!20376)

(assert (=> b!618520 (= e!354686 Unit!20382)))

(declare-fun b!618521 () Bool)

(assert (=> b!618521 (= e!354684 true)))

(assert (=> b!618521 (= (select (store (arr!18026 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618522 () Bool)

(declare-fun res!398550 () Bool)

(assert (=> b!618522 (=> (not res!398550) (not e!354693))))

(assert (=> b!618522 (= res!398550 (validKeyInArray!0 (select (arr!18026 a!2986) j!136)))))

(declare-fun b!618523 () Bool)

(declare-fun Unit!20383 () Unit!20376)

(assert (=> b!618523 (= e!354687 Unit!20383)))

(declare-fun b!618524 () Bool)

(declare-fun res!398552 () Bool)

(assert (=> b!618524 (=> (not res!398552) (not e!354685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37560 (_ BitVec 32)) Bool)

(assert (=> b!618524 (= res!398552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618525 () Bool)

(assert (=> b!618525 false))

(declare-fun lt!285149 () Unit!20376)

(assert (=> b!618525 (= lt!285149 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285145 (select (arr!18026 a!2986) j!136) index!984 Nil!12103))))

(assert (=> b!618525 (arrayNoDuplicates!0 lt!285145 index!984 Nil!12103)))

(declare-fun lt!285159 () Unit!20376)

(assert (=> b!618525 (= lt!285159 (lemmaNoDuplicateFromThenFromBigger!0 lt!285145 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618525 (arrayNoDuplicates!0 lt!285145 #b00000000000000000000000000000000 Nil!12103)))

(declare-fun lt!285147 () Unit!20376)

(assert (=> b!618525 (= lt!285147 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12103))))

(assert (=> b!618525 (arrayContainsKey!0 lt!285145 (select (arr!18026 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285161 () Unit!20376)

(assert (=> b!618525 (= lt!285161 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285145 (select (arr!18026 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!618525 e!354679))

(declare-fun res!398557 () Bool)

(assert (=> b!618525 (=> (not res!398557) (not e!354679))))

(assert (=> b!618525 (= res!398557 (arrayContainsKey!0 lt!285145 (select (arr!18026 a!2986) j!136) j!136))))

(declare-fun Unit!20384 () Unit!20376)

(assert (=> b!618525 (= e!354682 Unit!20384)))

(declare-fun b!618526 () Bool)

(declare-fun Unit!20385 () Unit!20376)

(assert (=> b!618526 (= e!354687 Unit!20385)))

(assert (=> b!618526 false))

(assert (= (and start!56076 res!398558) b!618508))

(assert (= (and b!618508 res!398555) b!618522))

(assert (= (and b!618522 res!398550) b!618514))

(assert (= (and b!618514 res!398542) b!618506))

(assert (= (and b!618506 res!398544) b!618513))

(assert (= (and b!618513 res!398551) b!618524))

(assert (= (and b!618524 res!398552) b!618505))

(assert (= (and b!618505 res!398549) b!618518))

(assert (= (and b!618518 res!398545) b!618502))

(assert (= (and b!618502 res!398548) b!618507))

(assert (= (and b!618507 res!398553) b!618516))

(assert (= (and b!618516 res!398546) b!618519))

(assert (= (and b!618516 c!70349) b!618526))

(assert (= (and b!618516 (not c!70349)) b!618523))

(assert (= (and b!618516 c!70347) b!618511))

(assert (= (and b!618516 (not c!70347)) b!618509))

(assert (= (and b!618511 res!398543) b!618515))

(assert (= (and b!618515 (not res!398554)) b!618510))

(assert (= (and b!618510 res!398547) b!618504))

(assert (= (and b!618511 c!70348) b!618503))

(assert (= (and b!618511 (not c!70348)) b!618520))

(assert (= (and b!618511 c!70350) b!618525))

(assert (= (and b!618511 (not c!70350)) b!618517))

(assert (= (and b!618525 res!398557) b!618512))

(assert (= (and b!618516 (not res!398556)) b!618521))

(declare-fun m!594019 () Bool)

(assert (=> b!618510 m!594019))

(assert (=> b!618510 m!594019))

(declare-fun m!594021 () Bool)

(assert (=> b!618510 m!594021))

(declare-fun m!594023 () Bool)

(assert (=> b!618513 m!594023))

(assert (=> b!618512 m!594019))

(assert (=> b!618512 m!594019))

(declare-fun m!594025 () Bool)

(assert (=> b!618512 m!594025))

(declare-fun m!594027 () Bool)

(assert (=> b!618506 m!594027))

(declare-fun m!594029 () Bool)

(assert (=> b!618524 m!594029))

(declare-fun m!594031 () Bool)

(assert (=> b!618502 m!594031))

(declare-fun m!594033 () Bool)

(assert (=> b!618502 m!594033))

(assert (=> b!618522 m!594019))

(assert (=> b!618522 m!594019))

(declare-fun m!594035 () Bool)

(assert (=> b!618522 m!594035))

(declare-fun m!594037 () Bool)

(assert (=> b!618507 m!594037))

(assert (=> b!618507 m!594019))

(assert (=> b!618507 m!594019))

(declare-fun m!594039 () Bool)

(assert (=> b!618507 m!594039))

(declare-fun m!594041 () Bool)

(assert (=> b!618514 m!594041))

(declare-fun m!594043 () Bool)

(assert (=> start!56076 m!594043))

(declare-fun m!594045 () Bool)

(assert (=> start!56076 m!594045))

(assert (=> b!618521 m!594031))

(declare-fun m!594047 () Bool)

(assert (=> b!618521 m!594047))

(declare-fun m!594049 () Bool)

(assert (=> b!618516 m!594049))

(declare-fun m!594051 () Bool)

(assert (=> b!618516 m!594051))

(assert (=> b!618516 m!594019))

(declare-fun m!594053 () Bool)

(assert (=> b!618516 m!594053))

(assert (=> b!618516 m!594019))

(assert (=> b!618516 m!594031))

(declare-fun m!594055 () Bool)

(assert (=> b!618516 m!594055))

(declare-fun m!594057 () Bool)

(assert (=> b!618516 m!594057))

(declare-fun m!594059 () Bool)

(assert (=> b!618516 m!594059))

(assert (=> b!618511 m!594031))

(assert (=> b!618511 m!594047))

(assert (=> b!618511 m!594019))

(declare-fun m!594061 () Bool)

(assert (=> b!618505 m!594061))

(declare-fun m!594063 () Bool)

(assert (=> b!618518 m!594063))

(assert (=> b!618504 m!594019))

(assert (=> b!618504 m!594019))

(assert (=> b!618504 m!594025))

(assert (=> b!618503 m!594019))

(declare-fun m!594065 () Bool)

(assert (=> b!618503 m!594065))

(assert (=> b!618503 m!594019))

(assert (=> b!618503 m!594019))

(declare-fun m!594067 () Bool)

(assert (=> b!618503 m!594067))

(assert (=> b!618503 m!594019))

(declare-fun m!594069 () Bool)

(assert (=> b!618503 m!594069))

(declare-fun m!594071 () Bool)

(assert (=> b!618503 m!594071))

(declare-fun m!594073 () Bool)

(assert (=> b!618503 m!594073))

(declare-fun m!594075 () Bool)

(assert (=> b!618503 m!594075))

(declare-fun m!594077 () Bool)

(assert (=> b!618503 m!594077))

(assert (=> b!618525 m!594019))

(declare-fun m!594079 () Bool)

(assert (=> b!618525 m!594079))

(assert (=> b!618525 m!594019))

(assert (=> b!618525 m!594019))

(declare-fun m!594081 () Bool)

(assert (=> b!618525 m!594081))

(assert (=> b!618525 m!594071))

(assert (=> b!618525 m!594019))

(assert (=> b!618525 m!594021))

(declare-fun m!594083 () Bool)

(assert (=> b!618525 m!594083))

(assert (=> b!618525 m!594077))

(assert (=> b!618525 m!594019))

(declare-fun m!594085 () Bool)

(assert (=> b!618525 m!594085))

(declare-fun m!594087 () Bool)

(assert (=> b!618525 m!594087))

(check-sat (not b!618522) (not b!618512) (not start!56076) (not b!618516) (not b!618504) (not b!618525) (not b!618513) (not b!618524) (not b!618510) (not b!618505) (not b!618506) (not b!618507) (not b!618503) (not b!618514))
(check-sat)
