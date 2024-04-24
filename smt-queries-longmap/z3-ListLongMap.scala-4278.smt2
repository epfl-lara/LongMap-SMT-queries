; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59634 () Bool)

(assert start!59634)

(declare-fun b!658228 () Bool)

(declare-fun res!426816 () Bool)

(declare-fun e!378148 () Bool)

(assert (=> b!658228 (=> (not res!426816) (not e!378148))))

(declare-datatypes ((array!38730 0))(
  ( (array!38731 (arr!18559 (Array (_ BitVec 32) (_ BitVec 64))) (size!18923 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38730)

(declare-datatypes ((List!12507 0))(
  ( (Nil!12504) (Cons!12503 (h!13551 (_ BitVec 64)) (t!18727 List!12507)) )
))
(declare-fun arrayNoDuplicates!0 (array!38730 (_ BitVec 32) List!12507) Bool)

(assert (=> b!658228 (= res!426816 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12504))))

(declare-fun b!658229 () Bool)

(declare-datatypes ((Unit!22773 0))(
  ( (Unit!22774) )
))
(declare-fun e!378152 () Unit!22773)

(declare-fun Unit!22775 () Unit!22773)

(assert (=> b!658229 (= e!378152 Unit!22775)))

(declare-fun b!658230 () Bool)

(declare-fun res!426817 () Bool)

(declare-fun e!378144 () Bool)

(assert (=> b!658230 (=> (not res!426817) (not e!378144))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!658230 (= res!426817 (and (= (size!18923 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18923 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18923 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658231 () Bool)

(assert (=> b!658231 false))

(declare-fun lt!307622 () array!38730)

(declare-fun lt!307625 () Unit!22773)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38730 (_ BitVec 64) (_ BitVec 32) List!12507) Unit!22773)

(assert (=> b!658231 (= lt!307625 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307622 (select (arr!18559 a!2986) j!136) j!136 Nil!12504))))

(assert (=> b!658231 (arrayNoDuplicates!0 lt!307622 j!136 Nil!12504)))

(declare-fun lt!307628 () Unit!22773)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38730 (_ BitVec 32) (_ BitVec 32)) Unit!22773)

(assert (=> b!658231 (= lt!307628 (lemmaNoDuplicateFromThenFromBigger!0 lt!307622 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658231 (arrayNoDuplicates!0 lt!307622 #b00000000000000000000000000000000 Nil!12504)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!307630 () Unit!22773)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38730 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12507) Unit!22773)

(assert (=> b!658231 (= lt!307630 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12504))))

(declare-fun arrayContainsKey!0 (array!38730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658231 (arrayContainsKey!0 lt!307622 (select (arr!18559 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307618 () Unit!22773)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38730 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22773)

(assert (=> b!658231 (= lt!307618 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307622 (select (arr!18559 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22776 () Unit!22773)

(assert (=> b!658231 (= e!378152 Unit!22776)))

(declare-fun b!658232 () Bool)

(declare-fun e!378141 () Bool)

(assert (=> b!658232 (= e!378141 (arrayContainsKey!0 lt!307622 (select (arr!18559 a!2986) j!136) index!984))))

(declare-fun b!658233 () Bool)

(declare-fun e!378150 () Unit!22773)

(declare-fun Unit!22777 () Unit!22773)

(assert (=> b!658233 (= e!378150 Unit!22777)))

(declare-fun b!658234 () Bool)

(declare-fun res!426813 () Bool)

(assert (=> b!658234 (=> (not res!426813) (not e!378144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658234 (= res!426813 (validKeyInArray!0 k0!1786))))

(declare-fun b!658235 () Bool)

(declare-fun e!378145 () Unit!22773)

(declare-fun Unit!22778 () Unit!22773)

(assert (=> b!658235 (= e!378145 Unit!22778)))

(assert (=> b!658235 false))

(declare-fun e!378153 () Bool)

(declare-fun b!658236 () Bool)

(assert (=> b!658236 (= e!378153 (arrayContainsKey!0 lt!307622 (select (arr!18559 a!2986) j!136) index!984))))

(declare-fun b!658237 () Bool)

(declare-fun e!378151 () Bool)

(declare-datatypes ((SeekEntryResult!6955 0))(
  ( (MissingZero!6955 (index!30185 (_ BitVec 32))) (Found!6955 (index!30186 (_ BitVec 32))) (Intermediate!6955 (undefined!7767 Bool) (index!30187 (_ BitVec 32)) (x!59129 (_ BitVec 32))) (Undefined!6955) (MissingVacant!6955 (index!30188 (_ BitVec 32))) )
))
(declare-fun lt!307615 () SeekEntryResult!6955)

(declare-fun lt!307629 () SeekEntryResult!6955)

(assert (=> b!658237 (= e!378151 (= lt!307615 lt!307629))))

(declare-fun b!658238 () Bool)

(declare-fun res!426824 () Bool)

(assert (=> b!658238 (=> (not res!426824) (not e!378148))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!658238 (= res!426824 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18559 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658239 () Bool)

(declare-fun Unit!22779 () Unit!22773)

(assert (=> b!658239 (= e!378145 Unit!22779)))

(declare-fun b!658240 () Bool)

(declare-fun e!378149 () Bool)

(declare-fun e!378142 () Bool)

(assert (=> b!658240 (= e!378149 (not e!378142))))

(declare-fun res!426823 () Bool)

(assert (=> b!658240 (=> res!426823 e!378142)))

(declare-fun lt!307624 () SeekEntryResult!6955)

(assert (=> b!658240 (= res!426823 (not (= lt!307624 (MissingVacant!6955 vacantSpotIndex!68))))))

(declare-fun lt!307616 () Unit!22773)

(declare-fun e!378139 () Unit!22773)

(assert (=> b!658240 (= lt!307616 e!378139)))

(declare-fun c!76076 () Bool)

(assert (=> b!658240 (= c!76076 (= lt!307624 (Found!6955 index!984)))))

(declare-fun lt!307621 () Unit!22773)

(assert (=> b!658240 (= lt!307621 e!378145)))

(declare-fun c!76079 () Bool)

(assert (=> b!658240 (= c!76079 (= lt!307624 Undefined!6955))))

(declare-fun lt!307617 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38730 (_ BitVec 32)) SeekEntryResult!6955)

(assert (=> b!658240 (= lt!307624 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307617 lt!307622 mask!3053))))

(assert (=> b!658240 e!378151))

(declare-fun res!426828 () Bool)

(assert (=> b!658240 (=> (not res!426828) (not e!378151))))

(declare-fun lt!307612 () (_ BitVec 32))

(assert (=> b!658240 (= res!426828 (= lt!307629 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307612 vacantSpotIndex!68 lt!307617 lt!307622 mask!3053)))))

(assert (=> b!658240 (= lt!307629 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307612 vacantSpotIndex!68 (select (arr!18559 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658240 (= lt!307617 (select (store (arr!18559 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307627 () Unit!22773)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38730 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22773)

(assert (=> b!658240 (= lt!307627 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307612 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658240 (= lt!307612 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!658241 () Bool)

(declare-fun e!378143 () Bool)

(assert (=> b!658241 (= e!378143 e!378149)))

(declare-fun res!426819 () Bool)

(assert (=> b!658241 (=> (not res!426819) (not e!378149))))

(assert (=> b!658241 (= res!426819 (and (= lt!307615 (Found!6955 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18559 a!2986) index!984) (select (arr!18559 a!2986) j!136))) (not (= (select (arr!18559 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!658241 (= lt!307615 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18559 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658242 () Bool)

(declare-fun res!426822 () Bool)

(assert (=> b!658242 (=> (not res!426822) (not e!378144))))

(assert (=> b!658242 (= res!426822 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658243 () Bool)

(assert (=> b!658243 (= e!378148 e!378143)))

(declare-fun res!426821 () Bool)

(assert (=> b!658243 (=> (not res!426821) (not e!378143))))

(assert (=> b!658243 (= res!426821 (= (select (store (arr!18559 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658243 (= lt!307622 (array!38731 (store (arr!18559 a!2986) i!1108 k0!1786) (size!18923 a!2986)))))

(declare-fun b!658244 () Bool)

(assert (=> b!658244 false))

(declare-fun lt!307623 () Unit!22773)

(assert (=> b!658244 (= lt!307623 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307622 (select (arr!18559 a!2986) j!136) index!984 Nil!12504))))

(assert (=> b!658244 (arrayNoDuplicates!0 lt!307622 index!984 Nil!12504)))

(declare-fun lt!307620 () Unit!22773)

(assert (=> b!658244 (= lt!307620 (lemmaNoDuplicateFromThenFromBigger!0 lt!307622 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658244 (arrayNoDuplicates!0 lt!307622 #b00000000000000000000000000000000 Nil!12504)))

(declare-fun lt!307614 () Unit!22773)

(assert (=> b!658244 (= lt!307614 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12504))))

(assert (=> b!658244 (arrayContainsKey!0 lt!307622 (select (arr!18559 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307619 () Unit!22773)

(assert (=> b!658244 (= lt!307619 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307622 (select (arr!18559 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!658244 e!378141))

(declare-fun res!426825 () Bool)

(assert (=> b!658244 (=> (not res!426825) (not e!378141))))

(assert (=> b!658244 (= res!426825 (arrayContainsKey!0 lt!307622 (select (arr!18559 a!2986) j!136) j!136))))

(declare-fun Unit!22780 () Unit!22773)

(assert (=> b!658244 (= e!378150 Unit!22780)))

(declare-fun b!658245 () Bool)

(declare-fun Unit!22781 () Unit!22773)

(assert (=> b!658245 (= e!378139 Unit!22781)))

(declare-fun res!426818 () Bool)

(declare-fun b!658246 () Bool)

(assert (=> b!658246 (= res!426818 (arrayContainsKey!0 lt!307622 (select (arr!18559 a!2986) j!136) j!136))))

(assert (=> b!658246 (=> (not res!426818) (not e!378153))))

(declare-fun e!378146 () Bool)

(assert (=> b!658246 (= e!378146 e!378153)))

(declare-fun b!658247 () Bool)

(assert (=> b!658247 (= e!378142 true)))

(assert (=> b!658247 (= (select (store (arr!18559 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!658248 () Bool)

(declare-fun Unit!22782 () Unit!22773)

(assert (=> b!658248 (= e!378139 Unit!22782)))

(declare-fun res!426827 () Bool)

(assert (=> b!658248 (= res!426827 (= (select (store (arr!18559 a!2986) i!1108 k0!1786) index!984) (select (arr!18559 a!2986) j!136)))))

(declare-fun e!378147 () Bool)

(assert (=> b!658248 (=> (not res!426827) (not e!378147))))

(assert (=> b!658248 e!378147))

(declare-fun c!76078 () Bool)

(assert (=> b!658248 (= c!76078 (bvslt j!136 index!984))))

(declare-fun lt!307613 () Unit!22773)

(assert (=> b!658248 (= lt!307613 e!378152)))

(declare-fun c!76077 () Bool)

(assert (=> b!658248 (= c!76077 (bvslt index!984 j!136))))

(declare-fun lt!307626 () Unit!22773)

(assert (=> b!658248 (= lt!307626 e!378150)))

(assert (=> b!658248 false))

(declare-fun res!426814 () Bool)

(assert (=> start!59634 (=> (not res!426814) (not e!378144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59634 (= res!426814 (validMask!0 mask!3053))))

(assert (=> start!59634 e!378144))

(assert (=> start!59634 true))

(declare-fun array_inv!14418 (array!38730) Bool)

(assert (=> start!59634 (array_inv!14418 a!2986)))

(declare-fun b!658249 () Bool)

(declare-fun res!426820 () Bool)

(assert (=> b!658249 (=> (not res!426820) (not e!378148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38730 (_ BitVec 32)) Bool)

(assert (=> b!658249 (= res!426820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658250 () Bool)

(assert (=> b!658250 (= e!378144 e!378148)))

(declare-fun res!426829 () Bool)

(assert (=> b!658250 (=> (not res!426829) (not e!378148))))

(declare-fun lt!307611 () SeekEntryResult!6955)

(assert (=> b!658250 (= res!426829 (or (= lt!307611 (MissingZero!6955 i!1108)) (= lt!307611 (MissingVacant!6955 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38730 (_ BitVec 32)) SeekEntryResult!6955)

(assert (=> b!658250 (= lt!307611 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!658251 () Bool)

(declare-fun res!426826 () Bool)

(assert (=> b!658251 (=> (not res!426826) (not e!378144))))

(assert (=> b!658251 (= res!426826 (validKeyInArray!0 (select (arr!18559 a!2986) j!136)))))

(declare-fun b!658252 () Bool)

(declare-fun res!426815 () Bool)

(assert (=> b!658252 (= res!426815 (bvsge j!136 index!984))))

(assert (=> b!658252 (=> res!426815 e!378146)))

(assert (=> b!658252 (= e!378147 e!378146)))

(assert (= (and start!59634 res!426814) b!658230))

(assert (= (and b!658230 res!426817) b!658251))

(assert (= (and b!658251 res!426826) b!658234))

(assert (= (and b!658234 res!426813) b!658242))

(assert (= (and b!658242 res!426822) b!658250))

(assert (= (and b!658250 res!426829) b!658249))

(assert (= (and b!658249 res!426820) b!658228))

(assert (= (and b!658228 res!426816) b!658238))

(assert (= (and b!658238 res!426824) b!658243))

(assert (= (and b!658243 res!426821) b!658241))

(assert (= (and b!658241 res!426819) b!658240))

(assert (= (and b!658240 res!426828) b!658237))

(assert (= (and b!658240 c!76079) b!658235))

(assert (= (and b!658240 (not c!76079)) b!658239))

(assert (= (and b!658240 c!76076) b!658248))

(assert (= (and b!658240 (not c!76076)) b!658245))

(assert (= (and b!658248 res!426827) b!658252))

(assert (= (and b!658252 (not res!426815)) b!658246))

(assert (= (and b!658246 res!426818) b!658236))

(assert (= (and b!658248 c!76078) b!658231))

(assert (= (and b!658248 (not c!76078)) b!658229))

(assert (= (and b!658248 c!76077) b!658244))

(assert (= (and b!658248 (not c!76077)) b!658233))

(assert (= (and b!658244 res!426825) b!658232))

(assert (= (and b!658240 (not res!426823)) b!658247))

(declare-fun m!631699 () Bool)

(assert (=> b!658250 m!631699))

(declare-fun m!631701 () Bool)

(assert (=> b!658246 m!631701))

(assert (=> b!658246 m!631701))

(declare-fun m!631703 () Bool)

(assert (=> b!658246 m!631703))

(assert (=> b!658251 m!631701))

(assert (=> b!658251 m!631701))

(declare-fun m!631705 () Bool)

(assert (=> b!658251 m!631705))

(assert (=> b!658236 m!631701))

(assert (=> b!658236 m!631701))

(declare-fun m!631707 () Bool)

(assert (=> b!658236 m!631707))

(declare-fun m!631709 () Bool)

(assert (=> b!658238 m!631709))

(declare-fun m!631711 () Bool)

(assert (=> b!658248 m!631711))

(declare-fun m!631713 () Bool)

(assert (=> b!658248 m!631713))

(assert (=> b!658248 m!631701))

(declare-fun m!631715 () Bool)

(assert (=> b!658234 m!631715))

(assert (=> b!658243 m!631711))

(declare-fun m!631717 () Bool)

(assert (=> b!658243 m!631717))

(declare-fun m!631719 () Bool)

(assert (=> b!658242 m!631719))

(declare-fun m!631721 () Bool)

(assert (=> b!658231 m!631721))

(assert (=> b!658231 m!631701))

(assert (=> b!658231 m!631701))

(declare-fun m!631723 () Bool)

(assert (=> b!658231 m!631723))

(declare-fun m!631725 () Bool)

(assert (=> b!658231 m!631725))

(assert (=> b!658231 m!631701))

(declare-fun m!631727 () Bool)

(assert (=> b!658231 m!631727))

(assert (=> b!658231 m!631701))

(declare-fun m!631729 () Bool)

(assert (=> b!658231 m!631729))

(declare-fun m!631731 () Bool)

(assert (=> b!658231 m!631731))

(declare-fun m!631733 () Bool)

(assert (=> b!658231 m!631733))

(assert (=> b!658247 m!631711))

(assert (=> b!658247 m!631713))

(declare-fun m!631735 () Bool)

(assert (=> b!658228 m!631735))

(declare-fun m!631737 () Bool)

(assert (=> b!658249 m!631737))

(assert (=> b!658244 m!631701))

(assert (=> b!658244 m!631725))

(declare-fun m!631739 () Bool)

(assert (=> b!658244 m!631739))

(assert (=> b!658244 m!631701))

(declare-fun m!631741 () Bool)

(assert (=> b!658244 m!631741))

(assert (=> b!658244 m!631701))

(declare-fun m!631743 () Bool)

(assert (=> b!658244 m!631743))

(assert (=> b!658244 m!631733))

(assert (=> b!658244 m!631701))

(declare-fun m!631745 () Bool)

(assert (=> b!658244 m!631745))

(assert (=> b!658244 m!631701))

(assert (=> b!658244 m!631703))

(declare-fun m!631747 () Bool)

(assert (=> b!658244 m!631747))

(declare-fun m!631749 () Bool)

(assert (=> b!658240 m!631749))

(declare-fun m!631751 () Bool)

(assert (=> b!658240 m!631751))

(assert (=> b!658240 m!631701))

(declare-fun m!631753 () Bool)

(assert (=> b!658240 m!631753))

(assert (=> b!658240 m!631711))

(declare-fun m!631755 () Bool)

(assert (=> b!658240 m!631755))

(assert (=> b!658240 m!631701))

(declare-fun m!631757 () Bool)

(assert (=> b!658240 m!631757))

(declare-fun m!631759 () Bool)

(assert (=> b!658240 m!631759))

(declare-fun m!631761 () Bool)

(assert (=> b!658241 m!631761))

(assert (=> b!658241 m!631701))

(assert (=> b!658241 m!631701))

(declare-fun m!631763 () Bool)

(assert (=> b!658241 m!631763))

(declare-fun m!631765 () Bool)

(assert (=> start!59634 m!631765))

(declare-fun m!631767 () Bool)

(assert (=> start!59634 m!631767))

(assert (=> b!658232 m!631701))

(assert (=> b!658232 m!631701))

(assert (=> b!658232 m!631707))

(check-sat (not b!658240) (not b!658231) (not b!658236) (not b!658251) (not b!658242) (not b!658249) (not start!59634) (not b!658244) (not b!658241) (not b!658234) (not b!658246) (not b!658232) (not b!658250) (not b!658228))
(check-sat)
