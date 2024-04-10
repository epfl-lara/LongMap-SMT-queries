; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59578 () Bool)

(assert start!59578)

(declare-fun b!658079 () Bool)

(declare-fun e!378047 () Bool)

(declare-fun e!378052 () Bool)

(assert (=> b!658079 (= e!378047 e!378052)))

(declare-fun res!426762 () Bool)

(assert (=> b!658079 (=> (not res!426762) (not e!378052))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7005 0))(
  ( (MissingZero!7005 (index!30385 (_ BitVec 32))) (Found!7005 (index!30386 (_ BitVec 32))) (Intermediate!7005 (undefined!7817 Bool) (index!30387 (_ BitVec 32)) (x!59176 (_ BitVec 32))) (Undefined!7005) (MissingVacant!7005 (index!30388 (_ BitVec 32))) )
))
(declare-fun lt!307584 () SeekEntryResult!7005)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38736 0))(
  ( (array!38737 (arr!18565 (Array (_ BitVec 32) (_ BitVec 64))) (size!18929 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38736)

(assert (=> b!658079 (= res!426762 (and (= lt!307584 (Found!7005 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18565 a!2986) index!984) (select (arr!18565 a!2986) j!136))) (not (= (select (arr!18565 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38736 (_ BitVec 32)) SeekEntryResult!7005)

(assert (=> b!658079 (= lt!307584 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18565 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658080 () Bool)

(assert (=> b!658080 false))

(declare-datatypes ((Unit!22804 0))(
  ( (Unit!22805) )
))
(declare-fun lt!307586 () Unit!22804)

(declare-fun lt!307581 () array!38736)

(declare-datatypes ((List!12606 0))(
  ( (Nil!12603) (Cons!12602 (h!13647 (_ BitVec 64)) (t!18834 List!12606)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38736 (_ BitVec 64) (_ BitVec 32) List!12606) Unit!22804)

(assert (=> b!658080 (= lt!307586 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307581 (select (arr!18565 a!2986) j!136) j!136 Nil!12603))))

(declare-fun arrayNoDuplicates!0 (array!38736 (_ BitVec 32) List!12606) Bool)

(assert (=> b!658080 (arrayNoDuplicates!0 lt!307581 j!136 Nil!12603)))

(declare-fun lt!307582 () Unit!22804)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38736 (_ BitVec 32) (_ BitVec 32)) Unit!22804)

(assert (=> b!658080 (= lt!307582 (lemmaNoDuplicateFromThenFromBigger!0 lt!307581 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658080 (arrayNoDuplicates!0 lt!307581 #b00000000000000000000000000000000 Nil!12603)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!307583 () Unit!22804)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38736 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12606) Unit!22804)

(assert (=> b!658080 (= lt!307583 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12603))))

(declare-fun arrayContainsKey!0 (array!38736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658080 (arrayContainsKey!0 lt!307581 (select (arr!18565 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307587 () Unit!22804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38736 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22804)

(assert (=> b!658080 (= lt!307587 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307581 (select (arr!18565 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378051 () Unit!22804)

(declare-fun Unit!22806 () Unit!22804)

(assert (=> b!658080 (= e!378051 Unit!22806)))

(declare-fun b!658081 () Bool)

(assert (=> b!658081 false))

(declare-fun lt!307585 () Unit!22804)

(assert (=> b!658081 (= lt!307585 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307581 (select (arr!18565 a!2986) j!136) index!984 Nil!12603))))

(assert (=> b!658081 (arrayNoDuplicates!0 lt!307581 index!984 Nil!12603)))

(declare-fun lt!307579 () Unit!22804)

(assert (=> b!658081 (= lt!307579 (lemmaNoDuplicateFromThenFromBigger!0 lt!307581 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658081 (arrayNoDuplicates!0 lt!307581 #b00000000000000000000000000000000 Nil!12603)))

(declare-fun lt!307577 () Unit!22804)

(assert (=> b!658081 (= lt!307577 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12603))))

(assert (=> b!658081 (arrayContainsKey!0 lt!307581 (select (arr!18565 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307580 () Unit!22804)

(assert (=> b!658081 (= lt!307580 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307581 (select (arr!18565 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378057 () Bool)

(assert (=> b!658081 e!378057))

(declare-fun res!426753 () Bool)

(assert (=> b!658081 (=> (not res!426753) (not e!378057))))

(assert (=> b!658081 (= res!426753 (arrayContainsKey!0 lt!307581 (select (arr!18565 a!2986) j!136) j!136))))

(declare-fun e!378049 () Unit!22804)

(declare-fun Unit!22807 () Unit!22804)

(assert (=> b!658081 (= e!378049 Unit!22807)))

(declare-fun b!658082 () Bool)

(declare-fun e!378054 () Bool)

(assert (=> b!658082 (= e!378054 (arrayContainsKey!0 lt!307581 (select (arr!18565 a!2986) j!136) index!984))))

(declare-fun b!658083 () Bool)

(declare-fun e!378053 () Bool)

(assert (=> b!658083 (= e!378052 (not e!378053))))

(declare-fun res!426765 () Bool)

(assert (=> b!658083 (=> res!426765 e!378053)))

(declare-fun lt!307578 () SeekEntryResult!7005)

(assert (=> b!658083 (= res!426765 (not (= lt!307578 (MissingVacant!7005 vacantSpotIndex!68))))))

(declare-fun lt!307572 () Unit!22804)

(declare-fun e!378046 () Unit!22804)

(assert (=> b!658083 (= lt!307572 e!378046)))

(declare-fun c!76033 () Bool)

(assert (=> b!658083 (= c!76033 (= lt!307578 (Found!7005 index!984)))))

(declare-fun lt!307571 () Unit!22804)

(declare-fun e!378045 () Unit!22804)

(assert (=> b!658083 (= lt!307571 e!378045)))

(declare-fun c!76032 () Bool)

(assert (=> b!658083 (= c!76032 (= lt!307578 Undefined!7005))))

(declare-fun lt!307575 () (_ BitVec 64))

(assert (=> b!658083 (= lt!307578 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307575 lt!307581 mask!3053))))

(declare-fun e!378043 () Bool)

(assert (=> b!658083 e!378043))

(declare-fun res!426761 () Bool)

(assert (=> b!658083 (=> (not res!426761) (not e!378043))))

(declare-fun lt!307573 () (_ BitVec 32))

(declare-fun lt!307574 () SeekEntryResult!7005)

(assert (=> b!658083 (= res!426761 (= lt!307574 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307573 vacantSpotIndex!68 lt!307575 lt!307581 mask!3053)))))

(assert (=> b!658083 (= lt!307574 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307573 vacantSpotIndex!68 (select (arr!18565 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658083 (= lt!307575 (select (store (arr!18565 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307570 () Unit!22804)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38736 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22804)

(assert (=> b!658083 (= lt!307570 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307573 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658083 (= lt!307573 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658084 () Bool)

(declare-fun Unit!22808 () Unit!22804)

(assert (=> b!658084 (= e!378045 Unit!22808)))

(assert (=> b!658084 false))

(declare-fun b!658085 () Bool)

(declare-fun res!426763 () Bool)

(declare-fun e!378048 () Bool)

(assert (=> b!658085 (=> (not res!426763) (not e!378048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658085 (= res!426763 (validKeyInArray!0 k0!1786))))

(declare-fun res!426754 () Bool)

(assert (=> start!59578 (=> (not res!426754) (not e!378048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59578 (= res!426754 (validMask!0 mask!3053))))

(assert (=> start!59578 e!378048))

(assert (=> start!59578 true))

(declare-fun array_inv!14361 (array!38736) Bool)

(assert (=> start!59578 (array_inv!14361 a!2986)))

(declare-fun b!658086 () Bool)

(declare-fun e!378056 () Bool)

(assert (=> b!658086 (= e!378048 e!378056)))

(declare-fun res!426760 () Bool)

(assert (=> b!658086 (=> (not res!426760) (not e!378056))))

(declare-fun lt!307588 () SeekEntryResult!7005)

(assert (=> b!658086 (= res!426760 (or (= lt!307588 (MissingZero!7005 i!1108)) (= lt!307588 (MissingVacant!7005 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38736 (_ BitVec 32)) SeekEntryResult!7005)

(assert (=> b!658086 (= lt!307588 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!658087 () Bool)

(declare-fun Unit!22809 () Unit!22804)

(assert (=> b!658087 (= e!378045 Unit!22809)))

(declare-fun b!658088 () Bool)

(declare-fun Unit!22810 () Unit!22804)

(assert (=> b!658088 (= e!378049 Unit!22810)))

(declare-fun b!658089 () Bool)

(declare-fun res!426756 () Bool)

(assert (=> b!658089 (=> (not res!426756) (not e!378056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38736 (_ BitVec 32)) Bool)

(assert (=> b!658089 (= res!426756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658090 () Bool)

(declare-fun res!426758 () Bool)

(assert (=> b!658090 (=> (not res!426758) (not e!378048))))

(assert (=> b!658090 (= res!426758 (validKeyInArray!0 (select (arr!18565 a!2986) j!136)))))

(declare-fun b!658091 () Bool)

(assert (=> b!658091 (= e!378043 (= lt!307584 lt!307574))))

(declare-fun b!658092 () Bool)

(declare-fun Unit!22811 () Unit!22804)

(assert (=> b!658092 (= e!378046 Unit!22811)))

(declare-fun res!426766 () Bool)

(assert (=> b!658092 (= res!426766 (= (select (store (arr!18565 a!2986) i!1108 k0!1786) index!984) (select (arr!18565 a!2986) j!136)))))

(declare-fun e!378055 () Bool)

(assert (=> b!658092 (=> (not res!426766) (not e!378055))))

(assert (=> b!658092 e!378055))

(declare-fun c!76034 () Bool)

(assert (=> b!658092 (= c!76034 (bvslt j!136 index!984))))

(declare-fun lt!307569 () Unit!22804)

(assert (=> b!658092 (= lt!307569 e!378051)))

(declare-fun c!76031 () Bool)

(assert (=> b!658092 (= c!76031 (bvslt index!984 j!136))))

(declare-fun lt!307576 () Unit!22804)

(assert (=> b!658092 (= lt!307576 e!378049)))

(assert (=> b!658092 false))

(declare-fun b!658093 () Bool)

(declare-fun res!426759 () Bool)

(assert (=> b!658093 (= res!426759 (arrayContainsKey!0 lt!307581 (select (arr!18565 a!2986) j!136) j!136))))

(assert (=> b!658093 (=> (not res!426759) (not e!378054))))

(declare-fun e!378050 () Bool)

(assert (=> b!658093 (= e!378050 e!378054)))

(declare-fun b!658094 () Bool)

(declare-fun res!426767 () Bool)

(assert (=> b!658094 (=> (not res!426767) (not e!378056))))

(assert (=> b!658094 (= res!426767 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12603))))

(declare-fun b!658095 () Bool)

(assert (=> b!658095 (= e!378056 e!378047)))

(declare-fun res!426757 () Bool)

(assert (=> b!658095 (=> (not res!426757) (not e!378047))))

(assert (=> b!658095 (= res!426757 (= (select (store (arr!18565 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658095 (= lt!307581 (array!38737 (store (arr!18565 a!2986) i!1108 k0!1786) (size!18929 a!2986)))))

(declare-fun b!658096 () Bool)

(declare-fun res!426755 () Bool)

(assert (=> b!658096 (= res!426755 (bvsge j!136 index!984))))

(assert (=> b!658096 (=> res!426755 e!378050)))

(assert (=> b!658096 (= e!378055 e!378050)))

(declare-fun b!658097 () Bool)

(assert (=> b!658097 (= e!378053 true)))

(assert (=> b!658097 (= (select (store (arr!18565 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!658098 () Bool)

(declare-fun res!426764 () Bool)

(assert (=> b!658098 (=> (not res!426764) (not e!378056))))

(assert (=> b!658098 (= res!426764 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18565 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658099 () Bool)

(assert (=> b!658099 (= e!378057 (arrayContainsKey!0 lt!307581 (select (arr!18565 a!2986) j!136) index!984))))

(declare-fun b!658100 () Bool)

(declare-fun res!426752 () Bool)

(assert (=> b!658100 (=> (not res!426752) (not e!378048))))

(assert (=> b!658100 (= res!426752 (and (= (size!18929 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18929 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18929 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658101 () Bool)

(declare-fun Unit!22812 () Unit!22804)

(assert (=> b!658101 (= e!378051 Unit!22812)))

(declare-fun b!658102 () Bool)

(declare-fun Unit!22813 () Unit!22804)

(assert (=> b!658102 (= e!378046 Unit!22813)))

(declare-fun b!658103 () Bool)

(declare-fun res!426751 () Bool)

(assert (=> b!658103 (=> (not res!426751) (not e!378048))))

(assert (=> b!658103 (= res!426751 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!59578 res!426754) b!658100))

(assert (= (and b!658100 res!426752) b!658090))

(assert (= (and b!658090 res!426758) b!658085))

(assert (= (and b!658085 res!426763) b!658103))

(assert (= (and b!658103 res!426751) b!658086))

(assert (= (and b!658086 res!426760) b!658089))

(assert (= (and b!658089 res!426756) b!658094))

(assert (= (and b!658094 res!426767) b!658098))

(assert (= (and b!658098 res!426764) b!658095))

(assert (= (and b!658095 res!426757) b!658079))

(assert (= (and b!658079 res!426762) b!658083))

(assert (= (and b!658083 res!426761) b!658091))

(assert (= (and b!658083 c!76032) b!658084))

(assert (= (and b!658083 (not c!76032)) b!658087))

(assert (= (and b!658083 c!76033) b!658092))

(assert (= (and b!658083 (not c!76033)) b!658102))

(assert (= (and b!658092 res!426766) b!658096))

(assert (= (and b!658096 (not res!426755)) b!658093))

(assert (= (and b!658093 res!426759) b!658082))

(assert (= (and b!658092 c!76034) b!658080))

(assert (= (and b!658092 (not c!76034)) b!658101))

(assert (= (and b!658092 c!76031) b!658081))

(assert (= (and b!658092 (not c!76031)) b!658088))

(assert (= (and b!658081 res!426753) b!658099))

(assert (= (and b!658083 (not res!426765)) b!658097))

(declare-fun m!631077 () Bool)

(assert (=> b!658082 m!631077))

(assert (=> b!658082 m!631077))

(declare-fun m!631079 () Bool)

(assert (=> b!658082 m!631079))

(declare-fun m!631081 () Bool)

(assert (=> b!658092 m!631081))

(declare-fun m!631083 () Bool)

(assert (=> b!658092 m!631083))

(assert (=> b!658092 m!631077))

(assert (=> b!658095 m!631081))

(declare-fun m!631085 () Bool)

(assert (=> b!658095 m!631085))

(declare-fun m!631087 () Bool)

(assert (=> b!658103 m!631087))

(declare-fun m!631089 () Bool)

(assert (=> b!658098 m!631089))

(declare-fun m!631091 () Bool)

(assert (=> start!59578 m!631091))

(declare-fun m!631093 () Bool)

(assert (=> start!59578 m!631093))

(declare-fun m!631095 () Bool)

(assert (=> b!658083 m!631095))

(declare-fun m!631097 () Bool)

(assert (=> b!658083 m!631097))

(assert (=> b!658083 m!631077))

(assert (=> b!658083 m!631081))

(declare-fun m!631099 () Bool)

(assert (=> b!658083 m!631099))

(declare-fun m!631101 () Bool)

(assert (=> b!658083 m!631101))

(assert (=> b!658083 m!631077))

(declare-fun m!631103 () Bool)

(assert (=> b!658083 m!631103))

(declare-fun m!631105 () Bool)

(assert (=> b!658083 m!631105))

(declare-fun m!631107 () Bool)

(assert (=> b!658094 m!631107))

(assert (=> b!658093 m!631077))

(assert (=> b!658093 m!631077))

(declare-fun m!631109 () Bool)

(assert (=> b!658093 m!631109))

(assert (=> b!658097 m!631081))

(assert (=> b!658097 m!631083))

(assert (=> b!658099 m!631077))

(assert (=> b!658099 m!631077))

(assert (=> b!658099 m!631079))

(declare-fun m!631111 () Bool)

(assert (=> b!658079 m!631111))

(assert (=> b!658079 m!631077))

(assert (=> b!658079 m!631077))

(declare-fun m!631113 () Bool)

(assert (=> b!658079 m!631113))

(declare-fun m!631115 () Bool)

(assert (=> b!658089 m!631115))

(declare-fun m!631117 () Bool)

(assert (=> b!658085 m!631117))

(assert (=> b!658080 m!631077))

(declare-fun m!631119 () Bool)

(assert (=> b!658080 m!631119))

(assert (=> b!658080 m!631077))

(assert (=> b!658080 m!631077))

(declare-fun m!631121 () Bool)

(assert (=> b!658080 m!631121))

(declare-fun m!631123 () Bool)

(assert (=> b!658080 m!631123))

(declare-fun m!631125 () Bool)

(assert (=> b!658080 m!631125))

(assert (=> b!658080 m!631077))

(declare-fun m!631127 () Bool)

(assert (=> b!658080 m!631127))

(declare-fun m!631129 () Bool)

(assert (=> b!658080 m!631129))

(declare-fun m!631131 () Bool)

(assert (=> b!658080 m!631131))

(declare-fun m!631133 () Bool)

(assert (=> b!658086 m!631133))

(assert (=> b!658090 m!631077))

(assert (=> b!658090 m!631077))

(declare-fun m!631135 () Bool)

(assert (=> b!658090 m!631135))

(assert (=> b!658081 m!631077))

(declare-fun m!631137 () Bool)

(assert (=> b!658081 m!631137))

(declare-fun m!631139 () Bool)

(assert (=> b!658081 m!631139))

(assert (=> b!658081 m!631077))

(assert (=> b!658081 m!631077))

(declare-fun m!631141 () Bool)

(assert (=> b!658081 m!631141))

(assert (=> b!658081 m!631077))

(assert (=> b!658081 m!631109))

(declare-fun m!631143 () Bool)

(assert (=> b!658081 m!631143))

(assert (=> b!658081 m!631077))

(declare-fun m!631145 () Bool)

(assert (=> b!658081 m!631145))

(assert (=> b!658081 m!631129))

(assert (=> b!658081 m!631131))

(check-sat (not b!658094) (not b!658081) (not b!658103) (not b!658090) (not b!658086) (not b!658083) (not b!658082) (not b!658089) (not b!658093) (not b!658099) (not b!658080) (not start!59578) (not b!658079) (not b!658085))
(check-sat)
