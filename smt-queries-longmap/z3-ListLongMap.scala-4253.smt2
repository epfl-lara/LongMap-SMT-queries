; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58976 () Bool)

(assert start!58976)

(declare-fun b!650477 () Bool)

(declare-datatypes ((Unit!22178 0))(
  ( (Unit!22179) )
))
(declare-fun e!373193 () Unit!22178)

(declare-fun Unit!22180 () Unit!22178)

(assert (=> b!650477 (= e!373193 Unit!22180)))

(assert (=> b!650477 false))

(declare-fun b!650478 () Bool)

(declare-fun e!373194 () Unit!22178)

(declare-fun Unit!22181 () Unit!22178)

(assert (=> b!650478 (= e!373194 Unit!22181)))

(declare-fun b!650479 () Bool)

(declare-fun res!421761 () Bool)

(declare-fun e!373185 () Bool)

(assert (=> b!650479 (=> (not res!421761) (not e!373185))))

(declare-datatypes ((array!38568 0))(
  ( (array!38569 (arr!18488 (Array (_ BitVec 32) (_ BitVec 64))) (size!18853 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38568)

(declare-datatypes ((List!12568 0))(
  ( (Nil!12565) (Cons!12564 (h!13609 (_ BitVec 64)) (t!18787 List!12568)) )
))
(declare-fun arrayNoDuplicates!0 (array!38568 (_ BitVec 32) List!12568) Bool)

(assert (=> b!650479 (= res!421761 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12565))))

(declare-fun b!650480 () Bool)

(declare-fun res!421760 () Bool)

(assert (=> b!650480 (=> (not res!421760) (not e!373185))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38568 (_ BitVec 32)) Bool)

(assert (=> b!650480 (= res!421760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650481 () Bool)

(declare-fun e!373187 () Bool)

(assert (=> b!650481 (= e!373187 e!373185)))

(declare-fun res!421766 () Bool)

(assert (=> b!650481 (=> (not res!421766) (not e!373185))))

(declare-datatypes ((SeekEntryResult!6925 0))(
  ( (MissingZero!6925 (index!30050 (_ BitVec 32))) (Found!6925 (index!30051 (_ BitVec 32))) (Intermediate!6925 (undefined!7737 Bool) (index!30052 (_ BitVec 32)) (x!58846 (_ BitVec 32))) (Undefined!6925) (MissingVacant!6925 (index!30053 (_ BitVec 32))) )
))
(declare-fun lt!302190 () SeekEntryResult!6925)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!650481 (= res!421766 (or (= lt!302190 (MissingZero!6925 i!1108)) (= lt!302190 (MissingVacant!6925 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38568 (_ BitVec 32)) SeekEntryResult!6925)

(assert (=> b!650481 (= lt!302190 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!650483 () Bool)

(declare-fun Unit!22182 () Unit!22178)

(assert (=> b!650483 (= e!373193 Unit!22182)))

(declare-fun b!650484 () Bool)

(declare-fun e!373189 () Bool)

(declare-fun e!373192 () Bool)

(assert (=> b!650484 (= e!373189 e!373192)))

(declare-fun res!421756 () Bool)

(assert (=> b!650484 (=> (not res!421756) (not e!373192))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!302196 () array!38568)

(declare-fun arrayContainsKey!0 (array!38568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650484 (= res!421756 (arrayContainsKey!0 lt!302196 (select (arr!18488 a!2986) j!136) j!136))))

(declare-fun b!650485 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!650485 (= e!373192 (arrayContainsKey!0 lt!302196 (select (arr!18488 a!2986) j!136) index!984))))

(declare-fun b!650486 () Bool)

(declare-fun res!421757 () Bool)

(assert (=> b!650486 (=> (not res!421757) (not e!373187))))

(assert (=> b!650486 (= res!421757 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650487 () Bool)

(declare-fun res!421768 () Bool)

(assert (=> b!650487 (=> (not res!421768) (not e!373187))))

(assert (=> b!650487 (= res!421768 (and (= (size!18853 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18853 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18853 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650488 () Bool)

(declare-fun e!373183 () Bool)

(assert (=> b!650488 (= e!373185 e!373183)))

(declare-fun res!421769 () Bool)

(assert (=> b!650488 (=> (not res!421769) (not e!373183))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!650488 (= res!421769 (= (select (store (arr!18488 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650488 (= lt!302196 (array!38569 (store (arr!18488 a!2986) i!1108 k0!1786) (size!18853 a!2986)))))

(declare-fun b!650489 () Bool)

(declare-fun Unit!22183 () Unit!22178)

(assert (=> b!650489 (= e!373194 Unit!22183)))

(declare-fun lt!302197 () Unit!22178)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38568 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22178)

(assert (=> b!650489 (= lt!302197 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302196 (select (arr!18488 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650489 (arrayContainsKey!0 lt!302196 (select (arr!18488 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302198 () Unit!22178)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38568 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12568) Unit!22178)

(assert (=> b!650489 (= lt!302198 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12565))))

(assert (=> b!650489 (arrayNoDuplicates!0 lt!302196 #b00000000000000000000000000000000 Nil!12565)))

(declare-fun lt!302187 () Unit!22178)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38568 (_ BitVec 32) (_ BitVec 32)) Unit!22178)

(assert (=> b!650489 (= lt!302187 (lemmaNoDuplicateFromThenFromBigger!0 lt!302196 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650489 (arrayNoDuplicates!0 lt!302196 j!136 Nil!12565)))

(declare-fun lt!302188 () Unit!22178)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38568 (_ BitVec 64) (_ BitVec 32) List!12568) Unit!22178)

(assert (=> b!650489 (= lt!302188 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302196 (select (arr!18488 a!2986) j!136) j!136 Nil!12565))))

(assert (=> b!650489 false))

(declare-fun b!650490 () Bool)

(declare-fun res!421764 () Bool)

(assert (=> b!650490 (=> (not res!421764) (not e!373187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650490 (= res!421764 (validKeyInArray!0 k0!1786))))

(declare-fun b!650491 () Bool)

(declare-fun e!373184 () Bool)

(assert (=> b!650491 (= e!373184 (or (bvsge (size!18853 a!2986) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!18853 a!2986)) (bvsle index!984 (size!18853 a!2986))))))

(assert (=> b!650491 (arrayNoDuplicates!0 lt!302196 #b00000000000000000000000000000000 Nil!12565)))

(declare-fun lt!302200 () Unit!22178)

(assert (=> b!650491 (= lt!302200 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12565))))

(assert (=> b!650491 (arrayContainsKey!0 lt!302196 (select (arr!18488 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302192 () Unit!22178)

(assert (=> b!650491 (= lt!302192 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302196 (select (arr!18488 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373196 () Bool)

(assert (=> b!650491 e!373196))

(declare-fun res!421755 () Bool)

(assert (=> b!650491 (=> (not res!421755) (not e!373196))))

(assert (=> b!650491 (= res!421755 (arrayContainsKey!0 lt!302196 (select (arr!18488 a!2986) j!136) j!136))))

(declare-fun b!650492 () Bool)

(declare-fun e!373186 () Bool)

(assert (=> b!650492 (= e!373186 e!373184)))

(declare-fun res!421767 () Bool)

(assert (=> b!650492 (=> res!421767 e!373184)))

(assert (=> b!650492 (= res!421767 (bvsge index!984 j!136))))

(declare-fun lt!302195 () Unit!22178)

(assert (=> b!650492 (= lt!302195 e!373194)))

(declare-fun c!74730 () Bool)

(assert (=> b!650492 (= c!74730 (bvslt j!136 index!984))))

(declare-fun b!650493 () Bool)

(declare-fun res!421762 () Bool)

(assert (=> b!650493 (=> (not res!421762) (not e!373187))))

(assert (=> b!650493 (= res!421762 (validKeyInArray!0 (select (arr!18488 a!2986) j!136)))))

(declare-fun b!650494 () Bool)

(declare-fun e!373195 () Bool)

(assert (=> b!650494 (= e!373195 e!373186)))

(declare-fun res!421758 () Bool)

(assert (=> b!650494 (=> res!421758 e!373186)))

(declare-fun lt!302194 () (_ BitVec 64))

(declare-fun lt!302202 () (_ BitVec 64))

(assert (=> b!650494 (= res!421758 (or (not (= (select (arr!18488 a!2986) j!136) lt!302194)) (not (= (select (arr!18488 a!2986) j!136) lt!302202))))))

(declare-fun e!373191 () Bool)

(assert (=> b!650494 e!373191))

(declare-fun res!421765 () Bool)

(assert (=> b!650494 (=> (not res!421765) (not e!373191))))

(assert (=> b!650494 (= res!421765 (= lt!302202 (select (arr!18488 a!2986) j!136)))))

(assert (=> b!650494 (= lt!302202 (select (store (arr!18488 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!650495 () Bool)

(declare-fun e!373188 () Bool)

(assert (=> b!650495 (= e!373188 (not e!373195))))

(declare-fun res!421770 () Bool)

(assert (=> b!650495 (=> res!421770 e!373195)))

(declare-fun lt!302193 () SeekEntryResult!6925)

(assert (=> b!650495 (= res!421770 (not (= lt!302193 (Found!6925 index!984))))))

(declare-fun lt!302191 () Unit!22178)

(assert (=> b!650495 (= lt!302191 e!373193)))

(declare-fun c!74729 () Bool)

(assert (=> b!650495 (= c!74729 (= lt!302193 Undefined!6925))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38568 (_ BitVec 32)) SeekEntryResult!6925)

(assert (=> b!650495 (= lt!302193 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302194 lt!302196 mask!3053))))

(declare-fun e!373190 () Bool)

(assert (=> b!650495 e!373190))

(declare-fun res!421754 () Bool)

(assert (=> b!650495 (=> (not res!421754) (not e!373190))))

(declare-fun lt!302189 () SeekEntryResult!6925)

(declare-fun lt!302186 () (_ BitVec 32))

(assert (=> b!650495 (= res!421754 (= lt!302189 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302186 vacantSpotIndex!68 lt!302194 lt!302196 mask!3053)))))

(assert (=> b!650495 (= lt!302189 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302186 vacantSpotIndex!68 (select (arr!18488 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650495 (= lt!302194 (select (store (arr!18488 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302199 () Unit!22178)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38568 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22178)

(assert (=> b!650495 (= lt!302199 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302186 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650495 (= lt!302186 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!650482 () Bool)

(assert (=> b!650482 (= e!373196 (arrayContainsKey!0 lt!302196 (select (arr!18488 a!2986) j!136) index!984))))

(declare-fun res!421753 () Bool)

(assert (=> start!58976 (=> (not res!421753) (not e!373187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58976 (= res!421753 (validMask!0 mask!3053))))

(assert (=> start!58976 e!373187))

(assert (=> start!58976 true))

(declare-fun array_inv!14371 (array!38568) Bool)

(assert (=> start!58976 (array_inv!14371 a!2986)))

(declare-fun b!650496 () Bool)

(assert (=> b!650496 (= e!373183 e!373188)))

(declare-fun res!421759 () Bool)

(assert (=> b!650496 (=> (not res!421759) (not e!373188))))

(declare-fun lt!302201 () SeekEntryResult!6925)

(assert (=> b!650496 (= res!421759 (and (= lt!302201 (Found!6925 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18488 a!2986) index!984) (select (arr!18488 a!2986) j!136))) (not (= (select (arr!18488 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!650496 (= lt!302201 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18488 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650497 () Bool)

(assert (=> b!650497 (= e!373191 e!373189)))

(declare-fun res!421771 () Bool)

(assert (=> b!650497 (=> res!421771 e!373189)))

(assert (=> b!650497 (= res!421771 (or (not (= (select (arr!18488 a!2986) j!136) lt!302194)) (not (= (select (arr!18488 a!2986) j!136) lt!302202)) (bvsge j!136 index!984)))))

(declare-fun b!650498 () Bool)

(assert (=> b!650498 (= e!373190 (= lt!302201 lt!302189))))

(declare-fun b!650499 () Bool)

(declare-fun res!421763 () Bool)

(assert (=> b!650499 (=> (not res!421763) (not e!373185))))

(assert (=> b!650499 (= res!421763 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18488 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!58976 res!421753) b!650487))

(assert (= (and b!650487 res!421768) b!650493))

(assert (= (and b!650493 res!421762) b!650490))

(assert (= (and b!650490 res!421764) b!650486))

(assert (= (and b!650486 res!421757) b!650481))

(assert (= (and b!650481 res!421766) b!650480))

(assert (= (and b!650480 res!421760) b!650479))

(assert (= (and b!650479 res!421761) b!650499))

(assert (= (and b!650499 res!421763) b!650488))

(assert (= (and b!650488 res!421769) b!650496))

(assert (= (and b!650496 res!421759) b!650495))

(assert (= (and b!650495 res!421754) b!650498))

(assert (= (and b!650495 c!74729) b!650477))

(assert (= (and b!650495 (not c!74729)) b!650483))

(assert (= (and b!650495 (not res!421770)) b!650494))

(assert (= (and b!650494 res!421765) b!650497))

(assert (= (and b!650497 (not res!421771)) b!650484))

(assert (= (and b!650484 res!421756) b!650485))

(assert (= (and b!650494 (not res!421758)) b!650492))

(assert (= (and b!650492 c!74730) b!650489))

(assert (= (and b!650492 (not c!74730)) b!650478))

(assert (= (and b!650492 (not res!421767)) b!650491))

(assert (= (and b!650491 res!421755) b!650482))

(declare-fun m!623169 () Bool)

(assert (=> b!650489 m!623169))

(declare-fun m!623171 () Bool)

(assert (=> b!650489 m!623171))

(declare-fun m!623173 () Bool)

(assert (=> b!650489 m!623173))

(declare-fun m!623175 () Bool)

(assert (=> b!650489 m!623175))

(assert (=> b!650489 m!623169))

(declare-fun m!623177 () Bool)

(assert (=> b!650489 m!623177))

(declare-fun m!623179 () Bool)

(assert (=> b!650489 m!623179))

(assert (=> b!650489 m!623169))

(declare-fun m!623181 () Bool)

(assert (=> b!650489 m!623181))

(assert (=> b!650489 m!623169))

(declare-fun m!623183 () Bool)

(assert (=> b!650489 m!623183))

(declare-fun m!623185 () Bool)

(assert (=> b!650496 m!623185))

(assert (=> b!650496 m!623169))

(assert (=> b!650496 m!623169))

(declare-fun m!623187 () Bool)

(assert (=> b!650496 m!623187))

(assert (=> b!650493 m!623169))

(assert (=> b!650493 m!623169))

(declare-fun m!623189 () Bool)

(assert (=> b!650493 m!623189))

(declare-fun m!623191 () Bool)

(assert (=> b!650480 m!623191))

(declare-fun m!623193 () Bool)

(assert (=> start!58976 m!623193))

(declare-fun m!623195 () Bool)

(assert (=> start!58976 m!623195))

(assert (=> b!650491 m!623169))

(declare-fun m!623197 () Bool)

(assert (=> b!650491 m!623197))

(assert (=> b!650491 m!623169))

(assert (=> b!650491 m!623169))

(declare-fun m!623199 () Bool)

(assert (=> b!650491 m!623199))

(assert (=> b!650491 m!623169))

(declare-fun m!623201 () Bool)

(assert (=> b!650491 m!623201))

(assert (=> b!650491 m!623175))

(assert (=> b!650491 m!623179))

(assert (=> b!650482 m!623169))

(assert (=> b!650482 m!623169))

(declare-fun m!623203 () Bool)

(assert (=> b!650482 m!623203))

(assert (=> b!650484 m!623169))

(assert (=> b!650484 m!623169))

(assert (=> b!650484 m!623199))

(assert (=> b!650485 m!623169))

(assert (=> b!650485 m!623169))

(assert (=> b!650485 m!623203))

(declare-fun m!623205 () Bool)

(assert (=> b!650486 m!623205))

(assert (=> b!650497 m!623169))

(assert (=> b!650494 m!623169))

(declare-fun m!623207 () Bool)

(assert (=> b!650494 m!623207))

(declare-fun m!623209 () Bool)

(assert (=> b!650494 m!623209))

(declare-fun m!623211 () Bool)

(assert (=> b!650479 m!623211))

(declare-fun m!623213 () Bool)

(assert (=> b!650490 m!623213))

(declare-fun m!623215 () Bool)

(assert (=> b!650499 m!623215))

(declare-fun m!623217 () Bool)

(assert (=> b!650481 m!623217))

(declare-fun m!623219 () Bool)

(assert (=> b!650495 m!623219))

(declare-fun m!623221 () Bool)

(assert (=> b!650495 m!623221))

(assert (=> b!650495 m!623169))

(assert (=> b!650495 m!623207))

(assert (=> b!650495 m!623169))

(declare-fun m!623223 () Bool)

(assert (=> b!650495 m!623223))

(declare-fun m!623225 () Bool)

(assert (=> b!650495 m!623225))

(declare-fun m!623227 () Bool)

(assert (=> b!650495 m!623227))

(declare-fun m!623229 () Bool)

(assert (=> b!650495 m!623229))

(assert (=> b!650488 m!623207))

(declare-fun m!623231 () Bool)

(assert (=> b!650488 m!623231))

(check-sat (not b!650479) (not b!650489) (not start!58976) (not b!650484) (not b!650480) (not b!650496) (not b!650493) (not b!650482) (not b!650486) (not b!650485) (not b!650495) (not b!650490) (not b!650481) (not b!650491))
(check-sat)
