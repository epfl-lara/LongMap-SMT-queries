; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57910 () Bool)

(assert start!57910)

(declare-fun b!640316 () Bool)

(declare-fun e!366530 () Bool)

(declare-fun e!366532 () Bool)

(assert (=> b!640316 (= e!366530 e!366532)))

(declare-fun res!414598 () Bool)

(assert (=> b!640316 (=> (not res!414598) (not e!366532))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38337 0))(
  ( (array!38338 (arr!18388 (Array (_ BitVec 32) (_ BitVec 64))) (size!18752 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38337)

(assert (=> b!640316 (= res!414598 (= (select (store (arr!18388 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!296314 () array!38337)

(assert (=> b!640316 (= lt!296314 (array!38338 (store (arr!18388 a!2986) i!1108 k0!1786) (size!18752 a!2986)))))

(declare-fun res!414606 () Bool)

(declare-fun e!366538 () Bool)

(assert (=> start!57910 (=> (not res!414606) (not e!366538))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57910 (= res!414606 (validMask!0 mask!3053))))

(assert (=> start!57910 e!366538))

(assert (=> start!57910 true))

(declare-fun array_inv!14184 (array!38337) Bool)

(assert (=> start!57910 (array_inv!14184 a!2986)))

(declare-fun b!640317 () Bool)

(declare-fun res!414603 () Bool)

(assert (=> b!640317 (=> (not res!414603) (not e!366538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640317 (= res!414603 (validKeyInArray!0 k0!1786))))

(declare-fun b!640318 () Bool)

(declare-fun e!366540 () Bool)

(assert (=> b!640318 (= e!366532 e!366540)))

(declare-fun res!414595 () Bool)

(assert (=> b!640318 (=> (not res!414595) (not e!366540))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6828 0))(
  ( (MissingZero!6828 (index!29632 (_ BitVec 32))) (Found!6828 (index!29633 (_ BitVec 32))) (Intermediate!6828 (undefined!7640 Bool) (index!29634 (_ BitVec 32)) (x!58392 (_ BitVec 32))) (Undefined!6828) (MissingVacant!6828 (index!29635 (_ BitVec 32))) )
))
(declare-fun lt!296320 () SeekEntryResult!6828)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640318 (= res!414595 (and (= lt!296320 (Found!6828 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18388 a!2986) index!984) (select (arr!18388 a!2986) j!136))) (not (= (select (arr!18388 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38337 (_ BitVec 32)) SeekEntryResult!6828)

(assert (=> b!640318 (= lt!296320 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18388 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640319 () Bool)

(declare-fun res!414592 () Bool)

(assert (=> b!640319 (=> (not res!414592) (not e!366538))))

(declare-fun arrayContainsKey!0 (array!38337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640319 (= res!414592 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640320 () Bool)

(declare-fun e!366529 () Bool)

(declare-fun lt!296316 () SeekEntryResult!6828)

(assert (=> b!640320 (= e!366529 (= lt!296320 lt!296316))))

(declare-fun b!640321 () Bool)

(declare-fun e!366531 () Bool)

(declare-fun e!366539 () Bool)

(assert (=> b!640321 (= e!366531 e!366539)))

(declare-fun res!414608 () Bool)

(assert (=> b!640321 (=> res!414608 e!366539)))

(declare-fun lt!296309 () (_ BitVec 64))

(declare-fun lt!296311 () (_ BitVec 64))

(assert (=> b!640321 (= res!414608 (or (not (= (select (arr!18388 a!2986) j!136) lt!296309)) (not (= (select (arr!18388 a!2986) j!136) lt!296311)) (bvsge j!136 index!984)))))

(declare-fun e!366536 () Bool)

(assert (=> b!640321 e!366536))

(declare-fun res!414607 () Bool)

(assert (=> b!640321 (=> (not res!414607) (not e!366536))))

(assert (=> b!640321 (= res!414607 (= lt!296311 (select (arr!18388 a!2986) j!136)))))

(assert (=> b!640321 (= lt!296311 (select (store (arr!18388 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!640322 () Bool)

(declare-fun res!414604 () Bool)

(assert (=> b!640322 (=> (not res!414604) (not e!366530))))

(declare-datatypes ((List!12429 0))(
  ( (Nil!12426) (Cons!12425 (h!13470 (_ BitVec 64)) (t!18657 List!12429)) )
))
(declare-fun arrayNoDuplicates!0 (array!38337 (_ BitVec 32) List!12429) Bool)

(assert (=> b!640322 (= res!414604 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12426))))

(declare-fun e!366535 () Bool)

(declare-fun b!640323 () Bool)

(assert (=> b!640323 (= e!366535 (arrayContainsKey!0 lt!296314 (select (arr!18388 a!2986) j!136) index!984))))

(declare-fun b!640324 () Bool)

(assert (=> b!640324 (= e!366540 (not e!366531))))

(declare-fun res!414596 () Bool)

(assert (=> b!640324 (=> res!414596 e!366531)))

(declare-fun lt!296308 () SeekEntryResult!6828)

(assert (=> b!640324 (= res!414596 (not (= lt!296308 (Found!6828 index!984))))))

(declare-datatypes ((Unit!21646 0))(
  ( (Unit!21647) )
))
(declare-fun lt!296319 () Unit!21646)

(declare-fun e!366533 () Unit!21646)

(assert (=> b!640324 (= lt!296319 e!366533)))

(declare-fun c!73229 () Bool)

(assert (=> b!640324 (= c!73229 (= lt!296308 Undefined!6828))))

(assert (=> b!640324 (= lt!296308 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296309 lt!296314 mask!3053))))

(assert (=> b!640324 e!366529))

(declare-fun res!414593 () Bool)

(assert (=> b!640324 (=> (not res!414593) (not e!366529))))

(declare-fun lt!296317 () (_ BitVec 32))

(assert (=> b!640324 (= res!414593 (= lt!296316 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296317 vacantSpotIndex!68 lt!296309 lt!296314 mask!3053)))))

(assert (=> b!640324 (= lt!296316 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296317 vacantSpotIndex!68 (select (arr!18388 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640324 (= lt!296309 (select (store (arr!18388 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296315 () Unit!21646)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21646)

(assert (=> b!640324 (= lt!296315 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296317 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640324 (= lt!296317 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640325 () Bool)

(declare-fun res!414599 () Bool)

(assert (=> b!640325 (=> (not res!414599) (not e!366538))))

(assert (=> b!640325 (= res!414599 (validKeyInArray!0 (select (arr!18388 a!2986) j!136)))))

(declare-fun b!640326 () Bool)

(declare-fun res!414600 () Bool)

(assert (=> b!640326 (=> (not res!414600) (not e!366538))))

(assert (=> b!640326 (= res!414600 (and (= (size!18752 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18752 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18752 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640327 () Bool)

(declare-fun Unit!21648 () Unit!21646)

(assert (=> b!640327 (= e!366533 Unit!21648)))

(declare-fun b!640328 () Bool)

(declare-fun e!366534 () Bool)

(assert (=> b!640328 (= e!366536 e!366534)))

(declare-fun res!414605 () Bool)

(assert (=> b!640328 (=> res!414605 e!366534)))

(assert (=> b!640328 (= res!414605 (or (not (= (select (arr!18388 a!2986) j!136) lt!296309)) (not (= (select (arr!18388 a!2986) j!136) lt!296311)) (bvsge j!136 index!984)))))

(declare-fun b!640329 () Bool)

(declare-fun Unit!21649 () Unit!21646)

(assert (=> b!640329 (= e!366533 Unit!21649)))

(assert (=> b!640329 false))

(declare-fun b!640330 () Bool)

(assert (=> b!640330 (= e!366538 e!366530)))

(declare-fun res!414594 () Bool)

(assert (=> b!640330 (=> (not res!414594) (not e!366530))))

(declare-fun lt!296318 () SeekEntryResult!6828)

(assert (=> b!640330 (= res!414594 (or (= lt!296318 (MissingZero!6828 i!1108)) (= lt!296318 (MissingVacant!6828 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38337 (_ BitVec 32)) SeekEntryResult!6828)

(assert (=> b!640330 (= lt!296318 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!640331 () Bool)

(declare-fun res!414597 () Bool)

(assert (=> b!640331 (=> (not res!414597) (not e!366530))))

(assert (=> b!640331 (= res!414597 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18388 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640332 () Bool)

(assert (=> b!640332 (= e!366534 e!366535)))

(declare-fun res!414602 () Bool)

(assert (=> b!640332 (=> (not res!414602) (not e!366535))))

(assert (=> b!640332 (= res!414602 (arrayContainsKey!0 lt!296314 (select (arr!18388 a!2986) j!136) j!136))))

(declare-fun b!640333 () Bool)

(assert (=> b!640333 (= e!366539 true)))

(assert (=> b!640333 (arrayNoDuplicates!0 lt!296314 j!136 Nil!12426)))

(declare-fun lt!296310 () Unit!21646)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38337 (_ BitVec 32) (_ BitVec 32)) Unit!21646)

(assert (=> b!640333 (= lt!296310 (lemmaNoDuplicateFromThenFromBigger!0 lt!296314 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640333 (arrayNoDuplicates!0 lt!296314 #b00000000000000000000000000000000 Nil!12426)))

(declare-fun lt!296312 () Unit!21646)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38337 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12429) Unit!21646)

(assert (=> b!640333 (= lt!296312 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12426))))

(assert (=> b!640333 (arrayContainsKey!0 lt!296314 (select (arr!18388 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296313 () Unit!21646)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38337 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21646)

(assert (=> b!640333 (= lt!296313 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296314 (select (arr!18388 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640334 () Bool)

(declare-fun res!414601 () Bool)

(assert (=> b!640334 (=> (not res!414601) (not e!366530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38337 (_ BitVec 32)) Bool)

(assert (=> b!640334 (= res!414601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!57910 res!414606) b!640326))

(assert (= (and b!640326 res!414600) b!640325))

(assert (= (and b!640325 res!414599) b!640317))

(assert (= (and b!640317 res!414603) b!640319))

(assert (= (and b!640319 res!414592) b!640330))

(assert (= (and b!640330 res!414594) b!640334))

(assert (= (and b!640334 res!414601) b!640322))

(assert (= (and b!640322 res!414604) b!640331))

(assert (= (and b!640331 res!414597) b!640316))

(assert (= (and b!640316 res!414598) b!640318))

(assert (= (and b!640318 res!414595) b!640324))

(assert (= (and b!640324 res!414593) b!640320))

(assert (= (and b!640324 c!73229) b!640329))

(assert (= (and b!640324 (not c!73229)) b!640327))

(assert (= (and b!640324 (not res!414596)) b!640321))

(assert (= (and b!640321 res!414607) b!640328))

(assert (= (and b!640328 (not res!414605)) b!640332))

(assert (= (and b!640332 res!414602) b!640323))

(assert (= (and b!640321 (not res!414608)) b!640333))

(declare-fun m!614145 () Bool)

(assert (=> b!640325 m!614145))

(assert (=> b!640325 m!614145))

(declare-fun m!614147 () Bool)

(assert (=> b!640325 m!614147))

(declare-fun m!614149 () Bool)

(assert (=> b!640317 m!614149))

(declare-fun m!614151 () Bool)

(assert (=> start!57910 m!614151))

(declare-fun m!614153 () Bool)

(assert (=> start!57910 m!614153))

(declare-fun m!614155 () Bool)

(assert (=> b!640324 m!614155))

(assert (=> b!640324 m!614145))

(assert (=> b!640324 m!614145))

(declare-fun m!614157 () Bool)

(assert (=> b!640324 m!614157))

(declare-fun m!614159 () Bool)

(assert (=> b!640324 m!614159))

(declare-fun m!614161 () Bool)

(assert (=> b!640324 m!614161))

(declare-fun m!614163 () Bool)

(assert (=> b!640324 m!614163))

(declare-fun m!614165 () Bool)

(assert (=> b!640324 m!614165))

(declare-fun m!614167 () Bool)

(assert (=> b!640324 m!614167))

(declare-fun m!614169 () Bool)

(assert (=> b!640318 m!614169))

(assert (=> b!640318 m!614145))

(assert (=> b!640318 m!614145))

(declare-fun m!614171 () Bool)

(assert (=> b!640318 m!614171))

(declare-fun m!614173 () Bool)

(assert (=> b!640333 m!614173))

(assert (=> b!640333 m!614145))

(declare-fun m!614175 () Bool)

(assert (=> b!640333 m!614175))

(assert (=> b!640333 m!614145))

(declare-fun m!614177 () Bool)

(assert (=> b!640333 m!614177))

(declare-fun m!614179 () Bool)

(assert (=> b!640333 m!614179))

(declare-fun m!614181 () Bool)

(assert (=> b!640333 m!614181))

(declare-fun m!614183 () Bool)

(assert (=> b!640333 m!614183))

(assert (=> b!640333 m!614145))

(assert (=> b!640316 m!614167))

(declare-fun m!614185 () Bool)

(assert (=> b!640316 m!614185))

(assert (=> b!640332 m!614145))

(assert (=> b!640332 m!614145))

(declare-fun m!614187 () Bool)

(assert (=> b!640332 m!614187))

(declare-fun m!614189 () Bool)

(assert (=> b!640330 m!614189))

(declare-fun m!614191 () Bool)

(assert (=> b!640319 m!614191))

(declare-fun m!614193 () Bool)

(assert (=> b!640322 m!614193))

(assert (=> b!640323 m!614145))

(assert (=> b!640323 m!614145))

(declare-fun m!614195 () Bool)

(assert (=> b!640323 m!614195))

(declare-fun m!614197 () Bool)

(assert (=> b!640334 m!614197))

(declare-fun m!614199 () Bool)

(assert (=> b!640331 m!614199))

(assert (=> b!640328 m!614145))

(assert (=> b!640321 m!614145))

(assert (=> b!640321 m!614167))

(declare-fun m!614201 () Bool)

(assert (=> b!640321 m!614201))

(check-sat (not b!640333) (not b!640319) (not b!640322) (not b!640323) (not b!640332) (not b!640325) (not b!640324) (not b!640317) (not b!640330) (not b!640318) (not start!57910) (not b!640334))
(check-sat)
