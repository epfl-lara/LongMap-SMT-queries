; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58532 () Bool)

(assert start!58532)

(declare-fun b!646094 () Bool)

(declare-datatypes ((Unit!21944 0))(
  ( (Unit!21945) )
))
(declare-fun e!370334 () Unit!21944)

(declare-fun Unit!21946 () Unit!21944)

(assert (=> b!646094 (= e!370334 Unit!21946)))

(declare-fun b!646095 () Bool)

(declare-fun e!370328 () Bool)

(declare-fun e!370332 () Bool)

(assert (=> b!646095 (= e!370328 e!370332)))

(declare-fun res!418688 () Bool)

(assert (=> b!646095 (=> res!418688 e!370332)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!299624 () (_ BitVec 64))

(declare-datatypes ((array!38478 0))(
  ( (array!38479 (arr!18449 (Array (_ BitVec 32) (_ BitVec 64))) (size!18814 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38478)

(declare-fun lt!299623 () (_ BitVec 64))

(assert (=> b!646095 (= res!418688 (or (not (= (select (arr!18449 a!2986) j!136) lt!299624)) (not (= (select (arr!18449 a!2986) j!136) lt!299623))))))

(declare-fun e!370326 () Bool)

(assert (=> b!646095 e!370326))

(declare-fun res!418680 () Bool)

(assert (=> b!646095 (=> (not res!418680) (not e!370326))))

(assert (=> b!646095 (= res!418680 (= lt!299623 (select (arr!18449 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!646095 (= lt!299623 (select (store (arr!18449 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!646096 () Bool)

(declare-fun e!370335 () Bool)

(assert (=> b!646096 (= e!370335 (not e!370328))))

(declare-fun res!418696 () Bool)

(assert (=> b!646096 (=> res!418696 e!370328)))

(declare-datatypes ((SeekEntryResult!6886 0))(
  ( (MissingZero!6886 (index!29882 (_ BitVec 32))) (Found!6886 (index!29883 (_ BitVec 32))) (Intermediate!6886 (undefined!7698 Bool) (index!29884 (_ BitVec 32)) (x!58667 (_ BitVec 32))) (Undefined!6886) (MissingVacant!6886 (index!29885 (_ BitVec 32))) )
))
(declare-fun lt!299626 () SeekEntryResult!6886)

(assert (=> b!646096 (= res!418696 (not (= lt!299626 (Found!6886 index!984))))))

(declare-fun lt!299630 () Unit!21944)

(declare-fun e!370338 () Unit!21944)

(assert (=> b!646096 (= lt!299630 e!370338)))

(declare-fun c!74076 () Bool)

(assert (=> b!646096 (= c!74076 (= lt!299626 Undefined!6886))))

(declare-fun lt!299620 () array!38478)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38478 (_ BitVec 32)) SeekEntryResult!6886)

(assert (=> b!646096 (= lt!299626 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299624 lt!299620 mask!3053))))

(declare-fun e!370327 () Bool)

(assert (=> b!646096 e!370327))

(declare-fun res!418695 () Bool)

(assert (=> b!646096 (=> (not res!418695) (not e!370327))))

(declare-fun lt!299622 () SeekEntryResult!6886)

(declare-fun lt!299616 () (_ BitVec 32))

(assert (=> b!646096 (= res!418695 (= lt!299622 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299616 vacantSpotIndex!68 lt!299624 lt!299620 mask!3053)))))

(assert (=> b!646096 (= lt!299622 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299616 vacantSpotIndex!68 (select (arr!18449 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!646096 (= lt!299624 (select (store (arr!18449 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299618 () Unit!21944)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38478 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21944)

(assert (=> b!646096 (= lt!299618 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299616 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646096 (= lt!299616 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!646097 () Bool)

(declare-fun e!370331 () Bool)

(declare-fun arrayContainsKey!0 (array!38478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646097 (= e!370331 (arrayContainsKey!0 lt!299620 (select (arr!18449 a!2986) j!136) index!984))))

(declare-fun b!646098 () Bool)

(declare-fun res!418685 () Bool)

(declare-fun e!370336 () Bool)

(assert (=> b!646098 (=> (not res!418685) (not e!370336))))

(declare-datatypes ((List!12529 0))(
  ( (Nil!12526) (Cons!12525 (h!13570 (_ BitVec 64)) (t!18748 List!12529)) )
))
(declare-fun arrayNoDuplicates!0 (array!38478 (_ BitVec 32) List!12529) Bool)

(assert (=> b!646098 (= res!418685 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12526))))

(declare-fun b!646099 () Bool)

(declare-fun e!370337 () Bool)

(assert (=> b!646099 (= e!370336 e!370337)))

(declare-fun res!418692 () Bool)

(assert (=> b!646099 (=> (not res!418692) (not e!370337))))

(assert (=> b!646099 (= res!418692 (= (select (store (arr!18449 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646099 (= lt!299620 (array!38479 (store (arr!18449 a!2986) i!1108 k0!1786) (size!18814 a!2986)))))

(declare-fun b!646100 () Bool)

(assert (=> b!646100 (= e!370337 e!370335)))

(declare-fun res!418679 () Bool)

(assert (=> b!646100 (=> (not res!418679) (not e!370335))))

(declare-fun lt!299621 () SeekEntryResult!6886)

(assert (=> b!646100 (= res!418679 (and (= lt!299621 (Found!6886 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18449 a!2986) index!984) (select (arr!18449 a!2986) j!136))) (not (= (select (arr!18449 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!646100 (= lt!299621 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18449 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646101 () Bool)

(declare-fun res!418684 () Bool)

(assert (=> b!646101 (=> (not res!418684) (not e!370336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38478 (_ BitVec 32)) Bool)

(assert (=> b!646101 (= res!418684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646102 () Bool)

(declare-fun res!418689 () Bool)

(declare-fun e!370339 () Bool)

(assert (=> b!646102 (=> (not res!418689) (not e!370339))))

(assert (=> b!646102 (= res!418689 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!646103 () Bool)

(declare-fun res!418686 () Bool)

(assert (=> b!646103 (=> (not res!418686) (not e!370339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646103 (= res!418686 (validKeyInArray!0 (select (arr!18449 a!2986) j!136)))))

(declare-fun b!646104 () Bool)

(assert (=> b!646104 (= e!370339 e!370336)))

(declare-fun res!418691 () Bool)

(assert (=> b!646104 (=> (not res!418691) (not e!370336))))

(declare-fun lt!299628 () SeekEntryResult!6886)

(assert (=> b!646104 (= res!418691 (or (= lt!299628 (MissingZero!6886 i!1108)) (= lt!299628 (MissingVacant!6886 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38478 (_ BitVec 32)) SeekEntryResult!6886)

(assert (=> b!646104 (= lt!299628 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun e!370329 () Bool)

(declare-fun b!646105 () Bool)

(assert (=> b!646105 (= e!370329 (arrayContainsKey!0 lt!299620 (select (arr!18449 a!2986) j!136) index!984))))

(declare-fun b!646106 () Bool)

(declare-fun Unit!21947 () Unit!21944)

(assert (=> b!646106 (= e!370338 Unit!21947)))

(declare-fun b!646107 () Bool)

(declare-fun res!418690 () Bool)

(assert (=> b!646107 (=> (not res!418690) (not e!370336))))

(assert (=> b!646107 (= res!418690 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18449 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646108 () Bool)

(declare-fun e!370340 () Bool)

(assert (=> b!646108 (= e!370340 (or (bvsge (size!18814 a!2986) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!18814 a!2986))))))

(assert (=> b!646108 (arrayContainsKey!0 lt!299620 (select (arr!18449 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299617 () Unit!21944)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38478 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21944)

(assert (=> b!646108 (= lt!299617 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299620 (select (arr!18449 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!646108 e!370329))

(declare-fun res!418693 () Bool)

(assert (=> b!646108 (=> (not res!418693) (not e!370329))))

(assert (=> b!646108 (= res!418693 (arrayContainsKey!0 lt!299620 (select (arr!18449 a!2986) j!136) j!136))))

(declare-fun res!418683 () Bool)

(assert (=> start!58532 (=> (not res!418683) (not e!370339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58532 (= res!418683 (validMask!0 mask!3053))))

(assert (=> start!58532 e!370339))

(assert (=> start!58532 true))

(declare-fun array_inv!14332 (array!38478) Bool)

(assert (=> start!58532 (array_inv!14332 a!2986)))

(declare-fun b!646109 () Bool)

(declare-fun e!370330 () Bool)

(assert (=> b!646109 (= e!370330 e!370331)))

(declare-fun res!418682 () Bool)

(assert (=> b!646109 (=> (not res!418682) (not e!370331))))

(assert (=> b!646109 (= res!418682 (arrayContainsKey!0 lt!299620 (select (arr!18449 a!2986) j!136) j!136))))

(declare-fun b!646110 () Bool)

(assert (=> b!646110 (= e!370327 (= lt!299621 lt!299622))))

(declare-fun b!646111 () Bool)

(declare-fun res!418694 () Bool)

(assert (=> b!646111 (=> (not res!418694) (not e!370339))))

(assert (=> b!646111 (= res!418694 (and (= (size!18814 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18814 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18814 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!646112 () Bool)

(declare-fun Unit!21948 () Unit!21944)

(assert (=> b!646112 (= e!370334 Unit!21948)))

(declare-fun lt!299619 () Unit!21944)

(assert (=> b!646112 (= lt!299619 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299620 (select (arr!18449 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!646112 (arrayContainsKey!0 lt!299620 (select (arr!18449 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299627 () Unit!21944)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38478 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12529) Unit!21944)

(assert (=> b!646112 (= lt!299627 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12526))))

(assert (=> b!646112 (arrayNoDuplicates!0 lt!299620 #b00000000000000000000000000000000 Nil!12526)))

(declare-fun lt!299629 () Unit!21944)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38478 (_ BitVec 32) (_ BitVec 32)) Unit!21944)

(assert (=> b!646112 (= lt!299629 (lemmaNoDuplicateFromThenFromBigger!0 lt!299620 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646112 (arrayNoDuplicates!0 lt!299620 j!136 Nil!12526)))

(declare-fun lt!299631 () Unit!21944)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38478 (_ BitVec 64) (_ BitVec 32) List!12529) Unit!21944)

(assert (=> b!646112 (= lt!299631 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299620 (select (arr!18449 a!2986) j!136) j!136 Nil!12526))))

(assert (=> b!646112 false))

(declare-fun b!646113 () Bool)

(declare-fun res!418678 () Bool)

(assert (=> b!646113 (=> (not res!418678) (not e!370339))))

(assert (=> b!646113 (= res!418678 (validKeyInArray!0 k0!1786))))

(declare-fun b!646114 () Bool)

(declare-fun Unit!21949 () Unit!21944)

(assert (=> b!646114 (= e!370338 Unit!21949)))

(assert (=> b!646114 false))

(declare-fun b!646115 () Bool)

(assert (=> b!646115 (= e!370326 e!370330)))

(declare-fun res!418687 () Bool)

(assert (=> b!646115 (=> res!418687 e!370330)))

(assert (=> b!646115 (= res!418687 (or (not (= (select (arr!18449 a!2986) j!136) lt!299624)) (not (= (select (arr!18449 a!2986) j!136) lt!299623)) (bvsge j!136 index!984)))))

(declare-fun b!646116 () Bool)

(assert (=> b!646116 (= e!370332 e!370340)))

(declare-fun res!418681 () Bool)

(assert (=> b!646116 (=> res!418681 e!370340)))

(assert (=> b!646116 (= res!418681 (bvsge index!984 j!136))))

(declare-fun lt!299625 () Unit!21944)

(assert (=> b!646116 (= lt!299625 e!370334)))

(declare-fun c!74075 () Bool)

(assert (=> b!646116 (= c!74075 (bvslt j!136 index!984))))

(assert (= (and start!58532 res!418683) b!646111))

(assert (= (and b!646111 res!418694) b!646103))

(assert (= (and b!646103 res!418686) b!646113))

(assert (= (and b!646113 res!418678) b!646102))

(assert (= (and b!646102 res!418689) b!646104))

(assert (= (and b!646104 res!418691) b!646101))

(assert (= (and b!646101 res!418684) b!646098))

(assert (= (and b!646098 res!418685) b!646107))

(assert (= (and b!646107 res!418690) b!646099))

(assert (= (and b!646099 res!418692) b!646100))

(assert (= (and b!646100 res!418679) b!646096))

(assert (= (and b!646096 res!418695) b!646110))

(assert (= (and b!646096 c!74076) b!646114))

(assert (= (and b!646096 (not c!74076)) b!646106))

(assert (= (and b!646096 (not res!418696)) b!646095))

(assert (= (and b!646095 res!418680) b!646115))

(assert (= (and b!646115 (not res!418687)) b!646109))

(assert (= (and b!646109 res!418682) b!646097))

(assert (= (and b!646095 (not res!418688)) b!646116))

(assert (= (and b!646116 c!74075) b!646112))

(assert (= (and b!646116 (not c!74075)) b!646094))

(assert (= (and b!646116 (not res!418681)) b!646108))

(assert (= (and b!646108 res!418693) b!646105))

(declare-fun m!619077 () Bool)

(assert (=> b!646096 m!619077))

(declare-fun m!619079 () Bool)

(assert (=> b!646096 m!619079))

(declare-fun m!619081 () Bool)

(assert (=> b!646096 m!619081))

(declare-fun m!619083 () Bool)

(assert (=> b!646096 m!619083))

(assert (=> b!646096 m!619081))

(declare-fun m!619085 () Bool)

(assert (=> b!646096 m!619085))

(declare-fun m!619087 () Bool)

(assert (=> b!646096 m!619087))

(declare-fun m!619089 () Bool)

(assert (=> b!646096 m!619089))

(declare-fun m!619091 () Bool)

(assert (=> b!646096 m!619091))

(assert (=> b!646105 m!619081))

(assert (=> b!646105 m!619081))

(declare-fun m!619093 () Bool)

(assert (=> b!646105 m!619093))

(declare-fun m!619095 () Bool)

(assert (=> b!646113 m!619095))

(declare-fun m!619097 () Bool)

(assert (=> b!646102 m!619097))

(assert (=> b!646099 m!619083))

(declare-fun m!619099 () Bool)

(assert (=> b!646099 m!619099))

(assert (=> b!646103 m!619081))

(assert (=> b!646103 m!619081))

(declare-fun m!619101 () Bool)

(assert (=> b!646103 m!619101))

(assert (=> b!646108 m!619081))

(assert (=> b!646108 m!619081))

(declare-fun m!619103 () Bool)

(assert (=> b!646108 m!619103))

(assert (=> b!646108 m!619081))

(declare-fun m!619105 () Bool)

(assert (=> b!646108 m!619105))

(assert (=> b!646108 m!619081))

(declare-fun m!619107 () Bool)

(assert (=> b!646108 m!619107))

(declare-fun m!619109 () Bool)

(assert (=> b!646104 m!619109))

(assert (=> b!646095 m!619081))

(assert (=> b!646095 m!619083))

(declare-fun m!619111 () Bool)

(assert (=> b!646095 m!619111))

(declare-fun m!619113 () Bool)

(assert (=> b!646107 m!619113))

(assert (=> b!646115 m!619081))

(assert (=> b!646097 m!619081))

(assert (=> b!646097 m!619081))

(assert (=> b!646097 m!619093))

(declare-fun m!619115 () Bool)

(assert (=> b!646112 m!619115))

(assert (=> b!646112 m!619081))

(assert (=> b!646112 m!619081))

(declare-fun m!619117 () Bool)

(assert (=> b!646112 m!619117))

(declare-fun m!619119 () Bool)

(assert (=> b!646112 m!619119))

(declare-fun m!619121 () Bool)

(assert (=> b!646112 m!619121))

(assert (=> b!646112 m!619081))

(declare-fun m!619123 () Bool)

(assert (=> b!646112 m!619123))

(assert (=> b!646112 m!619081))

(declare-fun m!619125 () Bool)

(assert (=> b!646112 m!619125))

(declare-fun m!619127 () Bool)

(assert (=> b!646112 m!619127))

(declare-fun m!619129 () Bool)

(assert (=> start!58532 m!619129))

(declare-fun m!619131 () Bool)

(assert (=> start!58532 m!619131))

(declare-fun m!619133 () Bool)

(assert (=> b!646098 m!619133))

(assert (=> b!646109 m!619081))

(assert (=> b!646109 m!619081))

(assert (=> b!646109 m!619107))

(declare-fun m!619135 () Bool)

(assert (=> b!646101 m!619135))

(declare-fun m!619137 () Bool)

(assert (=> b!646100 m!619137))

(assert (=> b!646100 m!619081))

(assert (=> b!646100 m!619081))

(declare-fun m!619139 () Bool)

(assert (=> b!646100 m!619139))

(check-sat (not b!646102) (not b!646103) (not start!58532) (not b!646109) (not b!646108) (not b!646100) (not b!646096) (not b!646101) (not b!646112) (not b!646097) (not b!646098) (not b!646113) (not b!646104) (not b!646105))
(check-sat)
