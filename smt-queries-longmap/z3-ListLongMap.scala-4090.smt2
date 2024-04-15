; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56022 () Bool)

(assert start!56022)

(declare-fun b!616477 () Bool)

(declare-fun res!397172 () Bool)

(declare-fun e!353466 () Bool)

(assert (=> b!616477 (=> (not res!397172) (not e!353466))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37506 0))(
  ( (array!37507 (arr!17999 (Array (_ BitVec 32) (_ BitVec 64))) (size!18364 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37506)

(assert (=> b!616477 (= res!397172 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17999 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616478 () Bool)

(declare-datatypes ((Unit!20106 0))(
  ( (Unit!20107) )
))
(declare-fun e!353473 () Unit!20106)

(declare-fun Unit!20108 () Unit!20106)

(assert (=> b!616478 (= e!353473 Unit!20108)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun res!397180 () Bool)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!616478 (= res!397180 (= (select (store (arr!17999 a!2986) i!1108 k0!1786) index!984) (select (arr!17999 a!2986) j!136)))))

(declare-fun e!353475 () Bool)

(assert (=> b!616478 (=> (not res!397180) (not e!353475))))

(assert (=> b!616478 e!353475))

(declare-fun c!70023 () Bool)

(assert (=> b!616478 (= c!70023 (bvslt j!136 index!984))))

(declare-fun lt!283535 () Unit!20106)

(declare-fun e!353474 () Unit!20106)

(assert (=> b!616478 (= lt!283535 e!353474)))

(declare-fun c!70024 () Bool)

(assert (=> b!616478 (= c!70024 (bvslt index!984 j!136))))

(declare-fun lt!283542 () Unit!20106)

(declare-fun e!353465 () Unit!20106)

(assert (=> b!616478 (= lt!283542 e!353465)))

(assert (=> b!616478 false))

(declare-fun b!616479 () Bool)

(declare-fun res!397173 () Bool)

(assert (=> b!616479 (= res!397173 (bvsge j!136 index!984))))

(declare-fun e!353478 () Bool)

(assert (=> b!616479 (=> res!397173 e!353478)))

(assert (=> b!616479 (= e!353475 e!353478)))

(declare-fun b!616480 () Bool)

(declare-fun e!353471 () Bool)

(declare-datatypes ((SeekEntryResult!6436 0))(
  ( (MissingZero!6436 (index!28028 (_ BitVec 32))) (Found!6436 (index!28029 (_ BitVec 32))) (Intermediate!6436 (undefined!7248 Bool) (index!28030 (_ BitVec 32)) (x!56831 (_ BitVec 32))) (Undefined!6436) (MissingVacant!6436 (index!28031 (_ BitVec 32))) )
))
(declare-fun lt!283538 () SeekEntryResult!6436)

(declare-fun lt!283540 () SeekEntryResult!6436)

(assert (=> b!616480 (= e!353471 (= lt!283538 lt!283540))))

(declare-fun e!353464 () Bool)

(declare-fun lt!283539 () array!37506)

(declare-fun b!616482 () Bool)

(declare-fun arrayContainsKey!0 (array!37506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616482 (= e!353464 (arrayContainsKey!0 lt!283539 (select (arr!17999 a!2986) j!136) index!984))))

(declare-fun b!616483 () Bool)

(declare-fun res!397168 () Bool)

(assert (=> b!616483 (=> (not res!397168) (not e!353466))))

(declare-datatypes ((List!12079 0))(
  ( (Nil!12076) (Cons!12075 (h!13120 (_ BitVec 64)) (t!18298 List!12079)) )
))
(declare-fun arrayNoDuplicates!0 (array!37506 (_ BitVec 32) List!12079) Bool)

(assert (=> b!616483 (= res!397168 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12076))))

(declare-fun b!616484 () Bool)

(declare-fun e!353470 () Bool)

(assert (=> b!616484 (= e!353466 e!353470)))

(declare-fun res!397179 () Bool)

(assert (=> b!616484 (=> (not res!397179) (not e!353470))))

(assert (=> b!616484 (= res!397179 (= (select (store (arr!17999 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616484 (= lt!283539 (array!37507 (store (arr!17999 a!2986) i!1108 k0!1786) (size!18364 a!2986)))))

(declare-fun b!616485 () Bool)

(declare-fun res!397175 () Bool)

(declare-fun e!353477 () Bool)

(assert (=> b!616485 (=> (not res!397175) (not e!353477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616485 (= res!397175 (validKeyInArray!0 (select (arr!17999 a!2986) j!136)))))

(declare-fun b!616486 () Bool)

(declare-fun Unit!20109 () Unit!20106)

(assert (=> b!616486 (= e!353474 Unit!20109)))

(declare-fun e!353467 () Bool)

(declare-fun b!616487 () Bool)

(assert (=> b!616487 (= e!353467 (arrayContainsKey!0 lt!283539 (select (arr!17999 a!2986) j!136) index!984))))

(declare-fun b!616488 () Bool)

(declare-fun res!397167 () Bool)

(assert (=> b!616488 (=> (not res!397167) (not e!353477))))

(assert (=> b!616488 (= res!397167 (validKeyInArray!0 k0!1786))))

(declare-fun b!616489 () Bool)

(declare-fun res!397174 () Bool)

(assert (=> b!616489 (=> (not res!397174) (not e!353477))))

(assert (=> b!616489 (= res!397174 (and (= (size!18364 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18364 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18364 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616490 () Bool)

(assert (=> b!616490 false))

(declare-fun lt!283530 () Unit!20106)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37506 (_ BitVec 64) (_ BitVec 32) List!12079) Unit!20106)

(assert (=> b!616490 (= lt!283530 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283539 (select (arr!17999 a!2986) j!136) index!984 Nil!12076))))

(assert (=> b!616490 (arrayNoDuplicates!0 lt!283539 index!984 Nil!12076)))

(declare-fun lt!283534 () Unit!20106)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37506 (_ BitVec 32) (_ BitVec 32)) Unit!20106)

(assert (=> b!616490 (= lt!283534 (lemmaNoDuplicateFromThenFromBigger!0 lt!283539 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616490 (arrayNoDuplicates!0 lt!283539 #b00000000000000000000000000000000 Nil!12076)))

(declare-fun lt!283543 () Unit!20106)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37506 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12079) Unit!20106)

(assert (=> b!616490 (= lt!283543 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12076))))

(assert (=> b!616490 (arrayContainsKey!0 lt!283539 (select (arr!17999 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283531 () Unit!20106)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37506 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20106)

(assert (=> b!616490 (= lt!283531 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283539 (select (arr!17999 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!616490 e!353467))

(declare-fun res!397166 () Bool)

(assert (=> b!616490 (=> (not res!397166) (not e!353467))))

(assert (=> b!616490 (= res!397166 (arrayContainsKey!0 lt!283539 (select (arr!17999 a!2986) j!136) j!136))))

(declare-fun Unit!20110 () Unit!20106)

(assert (=> b!616490 (= e!353465 Unit!20110)))

(declare-fun b!616491 () Bool)

(declare-fun e!353469 () Unit!20106)

(declare-fun Unit!20111 () Unit!20106)

(assert (=> b!616491 (= e!353469 Unit!20111)))

(declare-fun b!616492 () Bool)

(declare-fun e!353468 () Bool)

(assert (=> b!616492 (= e!353470 e!353468)))

(declare-fun res!397171 () Bool)

(assert (=> b!616492 (=> (not res!397171) (not e!353468))))

(assert (=> b!616492 (= res!397171 (and (= lt!283538 (Found!6436 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17999 a!2986) index!984) (select (arr!17999 a!2986) j!136))) (not (= (select (arr!17999 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37506 (_ BitVec 32)) SeekEntryResult!6436)

(assert (=> b!616492 (= lt!283538 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17999 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616481 () Bool)

(assert (=> b!616481 (= e!353477 e!353466)))

(declare-fun res!397178 () Bool)

(assert (=> b!616481 (=> (not res!397178) (not e!353466))))

(declare-fun lt!283526 () SeekEntryResult!6436)

(assert (=> b!616481 (= res!397178 (or (= lt!283526 (MissingZero!6436 i!1108)) (= lt!283526 (MissingVacant!6436 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37506 (_ BitVec 32)) SeekEntryResult!6436)

(assert (=> b!616481 (= lt!283526 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!397181 () Bool)

(assert (=> start!56022 (=> (not res!397181) (not e!353477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56022 (= res!397181 (validMask!0 mask!3053))))

(assert (=> start!56022 e!353477))

(assert (=> start!56022 true))

(declare-fun array_inv!13882 (array!37506) Bool)

(assert (=> start!56022 (array_inv!13882 a!2986)))

(declare-fun b!616493 () Bool)

(declare-fun e!353472 () Bool)

(assert (=> b!616493 (= e!353468 (not e!353472))))

(declare-fun res!397169 () Bool)

(assert (=> b!616493 (=> res!397169 e!353472)))

(declare-fun lt!283533 () SeekEntryResult!6436)

(assert (=> b!616493 (= res!397169 (not (= lt!283533 (MissingVacant!6436 vacantSpotIndex!68))))))

(declare-fun lt!283527 () Unit!20106)

(assert (=> b!616493 (= lt!283527 e!353473)))

(declare-fun c!70026 () Bool)

(assert (=> b!616493 (= c!70026 (= lt!283533 (Found!6436 index!984)))))

(declare-fun lt!283525 () Unit!20106)

(assert (=> b!616493 (= lt!283525 e!353469)))

(declare-fun c!70025 () Bool)

(assert (=> b!616493 (= c!70025 (= lt!283533 Undefined!6436))))

(declare-fun lt!283536 () (_ BitVec 64))

(assert (=> b!616493 (= lt!283533 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283536 lt!283539 mask!3053))))

(assert (=> b!616493 e!353471))

(declare-fun res!397165 () Bool)

(assert (=> b!616493 (=> (not res!397165) (not e!353471))))

(declare-fun lt!283528 () (_ BitVec 32))

(assert (=> b!616493 (= res!397165 (= lt!283540 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283528 vacantSpotIndex!68 lt!283536 lt!283539 mask!3053)))))

(assert (=> b!616493 (= lt!283540 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283528 vacantSpotIndex!68 (select (arr!17999 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616493 (= lt!283536 (select (store (arr!17999 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283529 () Unit!20106)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37506 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20106)

(assert (=> b!616493 (= lt!283529 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283528 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616493 (= lt!283528 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616494 () Bool)

(assert (=> b!616494 false))

(declare-fun lt!283524 () Unit!20106)

(assert (=> b!616494 (= lt!283524 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283539 (select (arr!17999 a!2986) j!136) j!136 Nil!12076))))

(assert (=> b!616494 (arrayNoDuplicates!0 lt!283539 j!136 Nil!12076)))

(declare-fun lt!283541 () Unit!20106)

(assert (=> b!616494 (= lt!283541 (lemmaNoDuplicateFromThenFromBigger!0 lt!283539 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616494 (arrayNoDuplicates!0 lt!283539 #b00000000000000000000000000000000 Nil!12076)))

(declare-fun lt!283532 () Unit!20106)

(assert (=> b!616494 (= lt!283532 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12076))))

(assert (=> b!616494 (arrayContainsKey!0 lt!283539 (select (arr!17999 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283537 () Unit!20106)

(assert (=> b!616494 (= lt!283537 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283539 (select (arr!17999 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20112 () Unit!20106)

(assert (=> b!616494 (= e!353474 Unit!20112)))

(declare-fun b!616495 () Bool)

(assert (=> b!616495 (= e!353472 true)))

(assert (=> b!616495 (= (select (store (arr!17999 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!616496 () Bool)

(declare-fun res!397177 () Bool)

(assert (=> b!616496 (=> (not res!397177) (not e!353477))))

(assert (=> b!616496 (= res!397177 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616497 () Bool)

(declare-fun Unit!20113 () Unit!20106)

(assert (=> b!616497 (= e!353465 Unit!20113)))

(declare-fun b!616498 () Bool)

(declare-fun Unit!20114 () Unit!20106)

(assert (=> b!616498 (= e!353469 Unit!20114)))

(assert (=> b!616498 false))

(declare-fun b!616499 () Bool)

(declare-fun res!397170 () Bool)

(assert (=> b!616499 (=> (not res!397170) (not e!353466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37506 (_ BitVec 32)) Bool)

(assert (=> b!616499 (= res!397170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616500 () Bool)

(declare-fun Unit!20115 () Unit!20106)

(assert (=> b!616500 (= e!353473 Unit!20115)))

(declare-fun res!397176 () Bool)

(declare-fun b!616501 () Bool)

(assert (=> b!616501 (= res!397176 (arrayContainsKey!0 lt!283539 (select (arr!17999 a!2986) j!136) j!136))))

(assert (=> b!616501 (=> (not res!397176) (not e!353464))))

(assert (=> b!616501 (= e!353478 e!353464)))

(assert (= (and start!56022 res!397181) b!616489))

(assert (= (and b!616489 res!397174) b!616485))

(assert (= (and b!616485 res!397175) b!616488))

(assert (= (and b!616488 res!397167) b!616496))

(assert (= (and b!616496 res!397177) b!616481))

(assert (= (and b!616481 res!397178) b!616499))

(assert (= (and b!616499 res!397170) b!616483))

(assert (= (and b!616483 res!397168) b!616477))

(assert (= (and b!616477 res!397172) b!616484))

(assert (= (and b!616484 res!397179) b!616492))

(assert (= (and b!616492 res!397171) b!616493))

(assert (= (and b!616493 res!397165) b!616480))

(assert (= (and b!616493 c!70025) b!616498))

(assert (= (and b!616493 (not c!70025)) b!616491))

(assert (= (and b!616493 c!70026) b!616478))

(assert (= (and b!616493 (not c!70026)) b!616500))

(assert (= (and b!616478 res!397180) b!616479))

(assert (= (and b!616479 (not res!397173)) b!616501))

(assert (= (and b!616501 res!397176) b!616482))

(assert (= (and b!616478 c!70023) b!616494))

(assert (= (and b!616478 (not c!70023)) b!616486))

(assert (= (and b!616478 c!70024) b!616490))

(assert (= (and b!616478 (not c!70024)) b!616497))

(assert (= (and b!616490 res!397166) b!616487))

(assert (= (and b!616493 (not res!397169)) b!616495))

(declare-fun m!592129 () Bool)

(assert (=> start!56022 m!592129))

(declare-fun m!592131 () Bool)

(assert (=> start!56022 m!592131))

(declare-fun m!592133 () Bool)

(assert (=> b!616477 m!592133))

(declare-fun m!592135 () Bool)

(assert (=> b!616501 m!592135))

(assert (=> b!616501 m!592135))

(declare-fun m!592137 () Bool)

(assert (=> b!616501 m!592137))

(declare-fun m!592139 () Bool)

(assert (=> b!616484 m!592139))

(declare-fun m!592141 () Bool)

(assert (=> b!616484 m!592141))

(declare-fun m!592143 () Bool)

(assert (=> b!616493 m!592143))

(assert (=> b!616493 m!592135))

(assert (=> b!616493 m!592139))

(declare-fun m!592145 () Bool)

(assert (=> b!616493 m!592145))

(assert (=> b!616493 m!592135))

(declare-fun m!592147 () Bool)

(assert (=> b!616493 m!592147))

(declare-fun m!592149 () Bool)

(assert (=> b!616493 m!592149))

(declare-fun m!592151 () Bool)

(assert (=> b!616493 m!592151))

(declare-fun m!592153 () Bool)

(assert (=> b!616493 m!592153))

(declare-fun m!592155 () Bool)

(assert (=> b!616496 m!592155))

(assert (=> b!616482 m!592135))

(assert (=> b!616482 m!592135))

(declare-fun m!592157 () Bool)

(assert (=> b!616482 m!592157))

(declare-fun m!592159 () Bool)

(assert (=> b!616483 m!592159))

(declare-fun m!592161 () Bool)

(assert (=> b!616494 m!592161))

(assert (=> b!616494 m!592135))

(declare-fun m!592163 () Bool)

(assert (=> b!616494 m!592163))

(declare-fun m!592165 () Bool)

(assert (=> b!616494 m!592165))

(declare-fun m!592167 () Bool)

(assert (=> b!616494 m!592167))

(assert (=> b!616494 m!592135))

(assert (=> b!616494 m!592135))

(declare-fun m!592169 () Bool)

(assert (=> b!616494 m!592169))

(assert (=> b!616494 m!592135))

(declare-fun m!592171 () Bool)

(assert (=> b!616494 m!592171))

(declare-fun m!592173 () Bool)

(assert (=> b!616494 m!592173))

(declare-fun m!592175 () Bool)

(assert (=> b!616488 m!592175))

(assert (=> b!616495 m!592139))

(declare-fun m!592177 () Bool)

(assert (=> b!616495 m!592177))

(assert (=> b!616478 m!592139))

(assert (=> b!616478 m!592177))

(assert (=> b!616478 m!592135))

(assert (=> b!616490 m!592135))

(assert (=> b!616490 m!592135))

(declare-fun m!592179 () Bool)

(assert (=> b!616490 m!592179))

(assert (=> b!616490 m!592161))

(assert (=> b!616490 m!592135))

(declare-fun m!592181 () Bool)

(assert (=> b!616490 m!592181))

(declare-fun m!592183 () Bool)

(assert (=> b!616490 m!592183))

(declare-fun m!592185 () Bool)

(assert (=> b!616490 m!592185))

(assert (=> b!616490 m!592167))

(assert (=> b!616490 m!592135))

(declare-fun m!592187 () Bool)

(assert (=> b!616490 m!592187))

(assert (=> b!616490 m!592135))

(assert (=> b!616490 m!592137))

(assert (=> b!616485 m!592135))

(assert (=> b!616485 m!592135))

(declare-fun m!592189 () Bool)

(assert (=> b!616485 m!592189))

(assert (=> b!616487 m!592135))

(assert (=> b!616487 m!592135))

(assert (=> b!616487 m!592157))

(declare-fun m!592191 () Bool)

(assert (=> b!616481 m!592191))

(declare-fun m!592193 () Bool)

(assert (=> b!616499 m!592193))

(declare-fun m!592195 () Bool)

(assert (=> b!616492 m!592195))

(assert (=> b!616492 m!592135))

(assert (=> b!616492 m!592135))

(declare-fun m!592197 () Bool)

(assert (=> b!616492 m!592197))

(check-sat (not b!616496) (not start!56022) (not b!616499) (not b!616482) (not b!616481) (not b!616487) (not b!616488) (not b!616483) (not b!616493) (not b!616501) (not b!616494) (not b!616492) (not b!616490) (not b!616485))
(check-sat)
