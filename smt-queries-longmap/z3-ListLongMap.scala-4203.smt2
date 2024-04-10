; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57436 () Bool)

(assert start!57436)

(declare-fun res!411292 () Bool)

(declare-fun e!363624 () Bool)

(assert (=> start!57436 (=> (not res!411292) (not e!363624))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57436 (= res!411292 (validMask!0 mask!3053))))

(assert (=> start!57436 e!363624))

(assert (=> start!57436 true))

(declare-datatypes ((array!38226 0))(
  ( (array!38227 (arr!18340 (Array (_ BitVec 32) (_ BitVec 64))) (size!18704 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38226)

(declare-fun array_inv!14136 (array!38226) Bool)

(assert (=> start!57436 (array_inv!14136 a!2986)))

(declare-fun b!635717 () Bool)

(declare-fun e!363623 () Bool)

(assert (=> b!635717 (= e!363624 e!363623)))

(declare-fun res!411294 () Bool)

(assert (=> b!635717 (=> (not res!411294) (not e!363623))))

(declare-datatypes ((SeekEntryResult!6780 0))(
  ( (MissingZero!6780 (index!29425 (_ BitVec 32))) (Found!6780 (index!29426 (_ BitVec 32))) (Intermediate!6780 (undefined!7592 Bool) (index!29427 (_ BitVec 32)) (x!58171 (_ BitVec 32))) (Undefined!6780) (MissingVacant!6780 (index!29428 (_ BitVec 32))) )
))
(declare-fun lt!293960 () SeekEntryResult!6780)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!635717 (= res!411294 (or (= lt!293960 (MissingZero!6780 i!1108)) (= lt!293960 (MissingVacant!6780 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38226 (_ BitVec 32)) SeekEntryResult!6780)

(assert (=> b!635717 (= lt!293960 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!635718 () Bool)

(declare-fun res!411291 () Bool)

(assert (=> b!635718 (=> (not res!411291) (not e!363624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635718 (= res!411291 (validKeyInArray!0 k0!1786))))

(declare-fun b!635719 () Bool)

(declare-fun res!411290 () Bool)

(assert (=> b!635719 (=> (not res!411290) (not e!363623))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!635719 (= res!411290 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18340 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635720 () Bool)

(declare-fun res!411297 () Bool)

(assert (=> b!635720 (=> (not res!411297) (not e!363624))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!635720 (= res!411297 (and (= (size!18704 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18704 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18704 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635721 () Bool)

(declare-fun e!363615 () Bool)

(declare-fun e!363622 () Bool)

(assert (=> b!635721 (= e!363615 e!363622)))

(declare-fun res!411298 () Bool)

(assert (=> b!635721 (=> res!411298 e!363622)))

(declare-fun lt!293961 () (_ BitVec 64))

(declare-fun lt!293963 () (_ BitVec 64))

(assert (=> b!635721 (= res!411298 (or (not (= (select (arr!18340 a!2986) j!136) lt!293961)) (not (= (select (arr!18340 a!2986) j!136) lt!293963)) (bvsge j!136 index!984)))))

(declare-fun b!635722 () Bool)

(declare-fun lt!293959 () array!38226)

(declare-fun e!363621 () Bool)

(declare-fun arrayContainsKey!0 (array!38226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635722 (= e!363621 (arrayContainsKey!0 lt!293959 (select (arr!18340 a!2986) j!136) index!984))))

(declare-fun b!635723 () Bool)

(declare-fun e!363614 () Bool)

(assert (=> b!635723 (= e!363614 (or (bvsge (size!18704 a!2986) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!18704 a!2986))))))

(assert (=> b!635723 (arrayContainsKey!0 lt!293959 (select (arr!18340 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!21454 0))(
  ( (Unit!21455) )
))
(declare-fun lt!293962 () Unit!21454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38226 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21454)

(assert (=> b!635723 (= lt!293962 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293959 (select (arr!18340 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635724 () Bool)

(declare-fun e!363618 () Unit!21454)

(declare-fun Unit!21456 () Unit!21454)

(assert (=> b!635724 (= e!363618 Unit!21456)))

(declare-fun b!635725 () Bool)

(declare-fun res!411300 () Bool)

(assert (=> b!635725 (=> (not res!411300) (not e!363624))))

(assert (=> b!635725 (= res!411300 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635726 () Bool)

(declare-fun e!363620 () Bool)

(assert (=> b!635726 (= e!363620 e!363614)))

(declare-fun res!411301 () Bool)

(assert (=> b!635726 (=> res!411301 e!363614)))

(assert (=> b!635726 (= res!411301 (or (not (= (select (arr!18340 a!2986) j!136) lt!293961)) (not (= (select (arr!18340 a!2986) j!136) lt!293963)) (bvsge j!136 index!984)))))

(assert (=> b!635726 e!363615))

(declare-fun res!411299 () Bool)

(assert (=> b!635726 (=> (not res!411299) (not e!363615))))

(assert (=> b!635726 (= res!411299 (= lt!293963 (select (arr!18340 a!2986) j!136)))))

(assert (=> b!635726 (= lt!293963 (select (store (arr!18340 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!635727 () Bool)

(declare-fun e!363613 () Bool)

(assert (=> b!635727 (= e!363613 (not e!363620))))

(declare-fun res!411303 () Bool)

(assert (=> b!635727 (=> res!411303 e!363620)))

(declare-fun lt!293966 () SeekEntryResult!6780)

(assert (=> b!635727 (= res!411303 (not (= lt!293966 (Found!6780 index!984))))))

(declare-fun lt!293964 () Unit!21454)

(assert (=> b!635727 (= lt!293964 e!363618)))

(declare-fun c!72581 () Bool)

(assert (=> b!635727 (= c!72581 (= lt!293966 Undefined!6780))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38226 (_ BitVec 32)) SeekEntryResult!6780)

(assert (=> b!635727 (= lt!293966 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293961 lt!293959 mask!3053))))

(declare-fun e!363619 () Bool)

(assert (=> b!635727 e!363619))

(declare-fun res!411296 () Bool)

(assert (=> b!635727 (=> (not res!411296) (not e!363619))))

(declare-fun lt!293967 () (_ BitVec 32))

(declare-fun lt!293965 () SeekEntryResult!6780)

(assert (=> b!635727 (= res!411296 (= lt!293965 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293967 vacantSpotIndex!68 lt!293961 lt!293959 mask!3053)))))

(assert (=> b!635727 (= lt!293965 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293967 vacantSpotIndex!68 (select (arr!18340 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635727 (= lt!293961 (select (store (arr!18340 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293958 () Unit!21454)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38226 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21454)

(assert (=> b!635727 (= lt!293958 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293967 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635727 (= lt!293967 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!635728 () Bool)

(declare-fun res!411289 () Bool)

(assert (=> b!635728 (=> (not res!411289) (not e!363624))))

(assert (=> b!635728 (= res!411289 (validKeyInArray!0 (select (arr!18340 a!2986) j!136)))))

(declare-fun b!635729 () Bool)

(declare-fun Unit!21457 () Unit!21454)

(assert (=> b!635729 (= e!363618 Unit!21457)))

(assert (=> b!635729 false))

(declare-fun b!635730 () Bool)

(assert (=> b!635730 (= e!363622 e!363621)))

(declare-fun res!411304 () Bool)

(assert (=> b!635730 (=> (not res!411304) (not e!363621))))

(assert (=> b!635730 (= res!411304 (arrayContainsKey!0 lt!293959 (select (arr!18340 a!2986) j!136) j!136))))

(declare-fun b!635731 () Bool)

(declare-fun e!363616 () Bool)

(assert (=> b!635731 (= e!363616 e!363613)))

(declare-fun res!411302 () Bool)

(assert (=> b!635731 (=> (not res!411302) (not e!363613))))

(declare-fun lt!293968 () SeekEntryResult!6780)

(assert (=> b!635731 (= res!411302 (and (= lt!293968 (Found!6780 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18340 a!2986) index!984) (select (arr!18340 a!2986) j!136))) (not (= (select (arr!18340 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635731 (= lt!293968 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18340 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635732 () Bool)

(assert (=> b!635732 (= e!363619 (= lt!293968 lt!293965))))

(declare-fun b!635733 () Bool)

(declare-fun res!411305 () Bool)

(assert (=> b!635733 (=> (not res!411305) (not e!363623))))

(declare-datatypes ((List!12381 0))(
  ( (Nil!12378) (Cons!12377 (h!13422 (_ BitVec 64)) (t!18609 List!12381)) )
))
(declare-fun arrayNoDuplicates!0 (array!38226 (_ BitVec 32) List!12381) Bool)

(assert (=> b!635733 (= res!411305 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12378))))

(declare-fun b!635734 () Bool)

(declare-fun res!411295 () Bool)

(assert (=> b!635734 (=> (not res!411295) (not e!363623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38226 (_ BitVec 32)) Bool)

(assert (=> b!635734 (= res!411295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635735 () Bool)

(assert (=> b!635735 (= e!363623 e!363616)))

(declare-fun res!411293 () Bool)

(assert (=> b!635735 (=> (not res!411293) (not e!363616))))

(assert (=> b!635735 (= res!411293 (= (select (store (arr!18340 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635735 (= lt!293959 (array!38227 (store (arr!18340 a!2986) i!1108 k0!1786) (size!18704 a!2986)))))

(assert (= (and start!57436 res!411292) b!635720))

(assert (= (and b!635720 res!411297) b!635728))

(assert (= (and b!635728 res!411289) b!635718))

(assert (= (and b!635718 res!411291) b!635725))

(assert (= (and b!635725 res!411300) b!635717))

(assert (= (and b!635717 res!411294) b!635734))

(assert (= (and b!635734 res!411295) b!635733))

(assert (= (and b!635733 res!411305) b!635719))

(assert (= (and b!635719 res!411290) b!635735))

(assert (= (and b!635735 res!411293) b!635731))

(assert (= (and b!635731 res!411302) b!635727))

(assert (= (and b!635727 res!411296) b!635732))

(assert (= (and b!635727 c!72581) b!635729))

(assert (= (and b!635727 (not c!72581)) b!635724))

(assert (= (and b!635727 (not res!411303)) b!635726))

(assert (= (and b!635726 res!411299) b!635721))

(assert (= (and b!635721 (not res!411298)) b!635730))

(assert (= (and b!635730 res!411304) b!635722))

(assert (= (and b!635726 (not res!411301)) b!635723))

(declare-fun m!610039 () Bool)

(assert (=> b!635726 m!610039))

(declare-fun m!610041 () Bool)

(assert (=> b!635726 m!610041))

(declare-fun m!610043 () Bool)

(assert (=> b!635726 m!610043))

(assert (=> b!635728 m!610039))

(assert (=> b!635728 m!610039))

(declare-fun m!610045 () Bool)

(assert (=> b!635728 m!610045))

(declare-fun m!610047 () Bool)

(assert (=> b!635727 m!610047))

(declare-fun m!610049 () Bool)

(assert (=> b!635727 m!610049))

(declare-fun m!610051 () Bool)

(assert (=> b!635727 m!610051))

(assert (=> b!635727 m!610039))

(assert (=> b!635727 m!610041))

(declare-fun m!610053 () Bool)

(assert (=> b!635727 m!610053))

(assert (=> b!635727 m!610039))

(declare-fun m!610055 () Bool)

(assert (=> b!635727 m!610055))

(declare-fun m!610057 () Bool)

(assert (=> b!635727 m!610057))

(declare-fun m!610059 () Bool)

(assert (=> b!635731 m!610059))

(assert (=> b!635731 m!610039))

(assert (=> b!635731 m!610039))

(declare-fun m!610061 () Bool)

(assert (=> b!635731 m!610061))

(declare-fun m!610063 () Bool)

(assert (=> b!635717 m!610063))

(assert (=> b!635730 m!610039))

(assert (=> b!635730 m!610039))

(declare-fun m!610065 () Bool)

(assert (=> b!635730 m!610065))

(assert (=> b!635721 m!610039))

(declare-fun m!610067 () Bool)

(assert (=> b!635719 m!610067))

(assert (=> b!635723 m!610039))

(assert (=> b!635723 m!610039))

(declare-fun m!610069 () Bool)

(assert (=> b!635723 m!610069))

(assert (=> b!635723 m!610039))

(declare-fun m!610071 () Bool)

(assert (=> b!635723 m!610071))

(declare-fun m!610073 () Bool)

(assert (=> b!635734 m!610073))

(declare-fun m!610075 () Bool)

(assert (=> start!57436 m!610075))

(declare-fun m!610077 () Bool)

(assert (=> start!57436 m!610077))

(declare-fun m!610079 () Bool)

(assert (=> b!635733 m!610079))

(assert (=> b!635735 m!610041))

(declare-fun m!610081 () Bool)

(assert (=> b!635735 m!610081))

(assert (=> b!635722 m!610039))

(assert (=> b!635722 m!610039))

(declare-fun m!610083 () Bool)

(assert (=> b!635722 m!610083))

(declare-fun m!610085 () Bool)

(assert (=> b!635725 m!610085))

(declare-fun m!610087 () Bool)

(assert (=> b!635718 m!610087))

(check-sat (not b!635718) (not b!635731) (not b!635727) (not b!635733) (not b!635728) (not b!635725) (not start!57436) (not b!635730) (not b!635722) (not b!635723) (not b!635717) (not b!635734))
(check-sat)
