; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59372 () Bool)

(assert start!59372)

(declare-fun b!655965 () Bool)

(declare-fun res!425539 () Bool)

(declare-fun e!376720 () Bool)

(assert (=> b!655965 (=> (not res!425539) (not e!376720))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655965 (= res!425539 (validKeyInArray!0 k!1786))))

(declare-fun b!655966 () Bool)

(assert (=> b!655966 false))

(declare-datatypes ((Unit!22614 0))(
  ( (Unit!22615) )
))
(declare-fun lt!306140 () Unit!22614)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38692 0))(
  ( (array!38693 (arr!18546 (Array (_ BitVec 32) (_ BitVec 64))) (size!18910 (_ BitVec 32))) )
))
(declare-fun lt!306137 () array!38692)

(declare-fun a!2986 () array!38692)

(declare-datatypes ((List!12587 0))(
  ( (Nil!12584) (Cons!12583 (h!13628 (_ BitVec 64)) (t!18815 List!12587)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38692 (_ BitVec 64) (_ BitVec 32) List!12587) Unit!22614)

(assert (=> b!655966 (= lt!306140 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306137 (select (arr!18546 a!2986) j!136) j!136 Nil!12584))))

(declare-fun arrayNoDuplicates!0 (array!38692 (_ BitVec 32) List!12587) Bool)

(assert (=> b!655966 (arrayNoDuplicates!0 lt!306137 j!136 Nil!12584)))

(declare-fun lt!306136 () Unit!22614)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38692 (_ BitVec 32) (_ BitVec 32)) Unit!22614)

(assert (=> b!655966 (= lt!306136 (lemmaNoDuplicateFromThenFromBigger!0 lt!306137 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655966 (arrayNoDuplicates!0 lt!306137 #b00000000000000000000000000000000 Nil!12584)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!306123 () Unit!22614)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38692 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12587) Unit!22614)

(assert (=> b!655966 (= lt!306123 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12584))))

(declare-fun arrayContainsKey!0 (array!38692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655966 (arrayContainsKey!0 lt!306137 (select (arr!18546 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306129 () Unit!22614)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38692 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22614)

(assert (=> b!655966 (= lt!306129 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306137 (select (arr!18546 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!376722 () Unit!22614)

(declare-fun Unit!22616 () Unit!22614)

(assert (=> b!655966 (= e!376722 Unit!22616)))

(declare-fun b!655967 () Bool)

(declare-fun res!425540 () Bool)

(declare-fun e!376716 () Bool)

(assert (=> b!655967 (=> (not res!425540) (not e!376716))))

(assert (=> b!655967 (= res!425540 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12584))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun e!376726 () Bool)

(declare-datatypes ((SeekEntryResult!6986 0))(
  ( (MissingZero!6986 (index!30303 (_ BitVec 32))) (Found!6986 (index!30304 (_ BitVec 32))) (Intermediate!6986 (undefined!7798 Bool) (index!30305 (_ BitVec 32)) (x!59091 (_ BitVec 32))) (Undefined!6986) (MissingVacant!6986 (index!30306 (_ BitVec 32))) )
))
(declare-fun lt!306128 () SeekEntryResult!6986)

(declare-fun b!655968 () Bool)

(assert (=> b!655968 (= e!376726 (not (or (not (= lt!306128 (MissingVacant!6986 vacantSpotIndex!68))) (= (select (store (arr!18546 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!306127 () Unit!22614)

(declare-fun e!376723 () Unit!22614)

(assert (=> b!655968 (= lt!306127 e!376723)))

(declare-fun c!75589 () Bool)

(assert (=> b!655968 (= c!75589 (= lt!306128 (Found!6986 index!984)))))

(declare-fun lt!306142 () Unit!22614)

(declare-fun e!376715 () Unit!22614)

(assert (=> b!655968 (= lt!306142 e!376715)))

(declare-fun c!75590 () Bool)

(assert (=> b!655968 (= c!75590 (= lt!306128 Undefined!6986))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!306138 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38692 (_ BitVec 32)) SeekEntryResult!6986)

(assert (=> b!655968 (= lt!306128 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306138 lt!306137 mask!3053))))

(declare-fun e!376721 () Bool)

(assert (=> b!655968 e!376721))

(declare-fun res!425535 () Bool)

(assert (=> b!655968 (=> (not res!425535) (not e!376721))))

(declare-fun lt!306125 () (_ BitVec 32))

(declare-fun lt!306131 () SeekEntryResult!6986)

(assert (=> b!655968 (= res!425535 (= lt!306131 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306125 vacantSpotIndex!68 lt!306138 lt!306137 mask!3053)))))

(assert (=> b!655968 (= lt!306131 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306125 vacantSpotIndex!68 (select (arr!18546 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655968 (= lt!306138 (select (store (arr!18546 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!306124 () Unit!22614)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38692 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22614)

(assert (=> b!655968 (= lt!306124 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306125 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655968 (= lt!306125 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655969 () Bool)

(declare-fun res!425530 () Bool)

(assert (=> b!655969 (=> (not res!425530) (not e!376716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38692 (_ BitVec 32)) Bool)

(assert (=> b!655969 (= res!425530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655970 () Bool)

(declare-fun res!425527 () Bool)

(assert (=> b!655970 (=> (not res!425527) (not e!376720))))

(assert (=> b!655970 (= res!425527 (and (= (size!18910 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18910 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18910 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655971 () Bool)

(declare-fun Unit!22617 () Unit!22614)

(assert (=> b!655971 (= e!376723 Unit!22617)))

(declare-fun res!425537 () Bool)

(assert (=> b!655971 (= res!425537 (= (select (store (arr!18546 a!2986) i!1108 k!1786) index!984) (select (arr!18546 a!2986) j!136)))))

(declare-fun e!376719 () Bool)

(assert (=> b!655971 (=> (not res!425537) (not e!376719))))

(assert (=> b!655971 e!376719))

(declare-fun c!75588 () Bool)

(assert (=> b!655971 (= c!75588 (bvslt j!136 index!984))))

(declare-fun lt!306135 () Unit!22614)

(assert (=> b!655971 (= lt!306135 e!376722)))

(declare-fun c!75587 () Bool)

(assert (=> b!655971 (= c!75587 (bvslt index!984 j!136))))

(declare-fun lt!306132 () Unit!22614)

(declare-fun e!376718 () Unit!22614)

(assert (=> b!655971 (= lt!306132 e!376718)))

(assert (=> b!655971 false))

(declare-fun b!655972 () Bool)

(declare-fun e!376724 () Bool)

(assert (=> b!655972 (= e!376724 (arrayContainsKey!0 lt!306137 (select (arr!18546 a!2986) j!136) index!984))))

(declare-fun b!655973 () Bool)

(declare-fun Unit!22618 () Unit!22614)

(assert (=> b!655973 (= e!376718 Unit!22618)))

(declare-fun b!655974 () Bool)

(declare-fun Unit!22619 () Unit!22614)

(assert (=> b!655974 (= e!376722 Unit!22619)))

(declare-fun b!655975 () Bool)

(declare-fun res!425531 () Bool)

(assert (=> b!655975 (=> (not res!425531) (not e!376720))))

(assert (=> b!655975 (= res!425531 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655976 () Bool)

(declare-fun e!376717 () Bool)

(assert (=> b!655976 (= e!376717 e!376726)))

(declare-fun res!425529 () Bool)

(assert (=> b!655976 (=> (not res!425529) (not e!376726))))

(declare-fun lt!306133 () SeekEntryResult!6986)

(assert (=> b!655976 (= res!425529 (and (= lt!306133 (Found!6986 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18546 a!2986) index!984) (select (arr!18546 a!2986) j!136))) (not (= (select (arr!18546 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!655976 (= lt!306133 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18546 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655977 () Bool)

(assert (=> b!655977 (= e!376720 e!376716)))

(declare-fun res!425538 () Bool)

(assert (=> b!655977 (=> (not res!425538) (not e!376716))))

(declare-fun lt!306139 () SeekEntryResult!6986)

(assert (=> b!655977 (= res!425538 (or (= lt!306139 (MissingZero!6986 i!1108)) (= lt!306139 (MissingVacant!6986 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38692 (_ BitVec 32)) SeekEntryResult!6986)

(assert (=> b!655977 (= lt!306139 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!655978 () Bool)

(declare-fun res!425533 () Bool)

(assert (=> b!655978 (=> (not res!425533) (not e!376720))))

(assert (=> b!655978 (= res!425533 (validKeyInArray!0 (select (arr!18546 a!2986) j!136)))))

(declare-fun b!655979 () Bool)

(declare-fun Unit!22620 () Unit!22614)

(assert (=> b!655979 (= e!376723 Unit!22620)))

(declare-fun b!655980 () Bool)

(declare-fun Unit!22621 () Unit!22614)

(assert (=> b!655980 (= e!376715 Unit!22621)))

(assert (=> b!655980 false))

(declare-fun b!655981 () Bool)

(declare-fun res!425532 () Bool)

(assert (=> b!655981 (= res!425532 (arrayContainsKey!0 lt!306137 (select (arr!18546 a!2986) j!136) j!136))))

(declare-fun e!376728 () Bool)

(assert (=> b!655981 (=> (not res!425532) (not e!376728))))

(declare-fun e!376725 () Bool)

(assert (=> b!655981 (= e!376725 e!376728)))

(declare-fun b!655982 () Bool)

(assert (=> b!655982 (= e!376728 (arrayContainsKey!0 lt!306137 (select (arr!18546 a!2986) j!136) index!984))))

(declare-fun b!655983 () Bool)

(assert (=> b!655983 (= e!376716 e!376717)))

(declare-fun res!425536 () Bool)

(assert (=> b!655983 (=> (not res!425536) (not e!376717))))

(assert (=> b!655983 (= res!425536 (= (select (store (arr!18546 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655983 (= lt!306137 (array!38693 (store (arr!18546 a!2986) i!1108 k!1786) (size!18910 a!2986)))))

(declare-fun b!655984 () Bool)

(assert (=> b!655984 (= e!376721 (= lt!306133 lt!306131))))

(declare-fun b!655985 () Bool)

(declare-fun Unit!22622 () Unit!22614)

(assert (=> b!655985 (= e!376715 Unit!22622)))

(declare-fun b!655986 () Bool)

(declare-fun res!425525 () Bool)

(assert (=> b!655986 (= res!425525 (bvsge j!136 index!984))))

(assert (=> b!655986 (=> res!425525 e!376725)))

(assert (=> b!655986 (= e!376719 e!376725)))

(declare-fun res!425528 () Bool)

(assert (=> start!59372 (=> (not res!425528) (not e!376720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59372 (= res!425528 (validMask!0 mask!3053))))

(assert (=> start!59372 e!376720))

(assert (=> start!59372 true))

(declare-fun array_inv!14342 (array!38692) Bool)

(assert (=> start!59372 (array_inv!14342 a!2986)))

(declare-fun b!655987 () Bool)

(declare-fun res!425534 () Bool)

(assert (=> b!655987 (=> (not res!425534) (not e!376716))))

(assert (=> b!655987 (= res!425534 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18546 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655988 () Bool)

(assert (=> b!655988 false))

(declare-fun lt!306141 () Unit!22614)

(assert (=> b!655988 (= lt!306141 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306137 (select (arr!18546 a!2986) j!136) index!984 Nil!12584))))

(assert (=> b!655988 (arrayNoDuplicates!0 lt!306137 index!984 Nil!12584)))

(declare-fun lt!306134 () Unit!22614)

(assert (=> b!655988 (= lt!306134 (lemmaNoDuplicateFromThenFromBigger!0 lt!306137 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655988 (arrayNoDuplicates!0 lt!306137 #b00000000000000000000000000000000 Nil!12584)))

(declare-fun lt!306130 () Unit!22614)

(assert (=> b!655988 (= lt!306130 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12584))))

(assert (=> b!655988 (arrayContainsKey!0 lt!306137 (select (arr!18546 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306126 () Unit!22614)

(assert (=> b!655988 (= lt!306126 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306137 (select (arr!18546 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!655988 e!376724))

(declare-fun res!425526 () Bool)

(assert (=> b!655988 (=> (not res!425526) (not e!376724))))

(assert (=> b!655988 (= res!425526 (arrayContainsKey!0 lt!306137 (select (arr!18546 a!2986) j!136) j!136))))

(declare-fun Unit!22623 () Unit!22614)

(assert (=> b!655988 (= e!376718 Unit!22623)))

(assert (= (and start!59372 res!425528) b!655970))

(assert (= (and b!655970 res!425527) b!655978))

(assert (= (and b!655978 res!425533) b!655965))

(assert (= (and b!655965 res!425539) b!655975))

(assert (= (and b!655975 res!425531) b!655977))

(assert (= (and b!655977 res!425538) b!655969))

(assert (= (and b!655969 res!425530) b!655967))

(assert (= (and b!655967 res!425540) b!655987))

(assert (= (and b!655987 res!425534) b!655983))

(assert (= (and b!655983 res!425536) b!655976))

(assert (= (and b!655976 res!425529) b!655968))

(assert (= (and b!655968 res!425535) b!655984))

(assert (= (and b!655968 c!75590) b!655980))

(assert (= (and b!655968 (not c!75590)) b!655985))

(assert (= (and b!655968 c!75589) b!655971))

(assert (= (and b!655968 (not c!75589)) b!655979))

(assert (= (and b!655971 res!425537) b!655986))

(assert (= (and b!655986 (not res!425525)) b!655981))

(assert (= (and b!655981 res!425532) b!655982))

(assert (= (and b!655971 c!75588) b!655966))

(assert (= (and b!655971 (not c!75588)) b!655974))

(assert (= (and b!655971 c!75587) b!655988))

(assert (= (and b!655971 (not c!75587)) b!655973))

(assert (= (and b!655988 res!425526) b!655972))

(declare-fun m!629027 () Bool)

(assert (=> b!655968 m!629027))

(declare-fun m!629029 () Bool)

(assert (=> b!655968 m!629029))

(declare-fun m!629031 () Bool)

(assert (=> b!655968 m!629031))

(declare-fun m!629033 () Bool)

(assert (=> b!655968 m!629033))

(declare-fun m!629035 () Bool)

(assert (=> b!655968 m!629035))

(assert (=> b!655968 m!629033))

(declare-fun m!629037 () Bool)

(assert (=> b!655968 m!629037))

(declare-fun m!629039 () Bool)

(assert (=> b!655968 m!629039))

(declare-fun m!629041 () Bool)

(assert (=> b!655968 m!629041))

(declare-fun m!629043 () Bool)

(assert (=> b!655968 m!629043))

(declare-fun m!629045 () Bool)

(assert (=> b!655975 m!629045))

(assert (=> b!655988 m!629033))

(declare-fun m!629047 () Bool)

(assert (=> b!655988 m!629047))

(assert (=> b!655988 m!629033))

(declare-fun m!629049 () Bool)

(assert (=> b!655988 m!629049))

(assert (=> b!655988 m!629033))

(declare-fun m!629051 () Bool)

(assert (=> b!655988 m!629051))

(declare-fun m!629053 () Bool)

(assert (=> b!655988 m!629053))

(assert (=> b!655988 m!629033))

(declare-fun m!629055 () Bool)

(assert (=> b!655988 m!629055))

(assert (=> b!655988 m!629033))

(declare-fun m!629057 () Bool)

(assert (=> b!655988 m!629057))

(declare-fun m!629059 () Bool)

(assert (=> b!655988 m!629059))

(declare-fun m!629061 () Bool)

(assert (=> b!655988 m!629061))

(assert (=> b!655982 m!629033))

(assert (=> b!655982 m!629033))

(declare-fun m!629063 () Bool)

(assert (=> b!655982 m!629063))

(declare-fun m!629065 () Bool)

(assert (=> b!655967 m!629065))

(assert (=> b!655966 m!629033))

(assert (=> b!655966 m!629033))

(declare-fun m!629067 () Bool)

(assert (=> b!655966 m!629067))

(assert (=> b!655966 m!629033))

(declare-fun m!629069 () Bool)

(assert (=> b!655966 m!629069))

(declare-fun m!629071 () Bool)

(assert (=> b!655966 m!629071))

(declare-fun m!629073 () Bool)

(assert (=> b!655966 m!629073))

(assert (=> b!655966 m!629033))

(declare-fun m!629075 () Bool)

(assert (=> b!655966 m!629075))

(assert (=> b!655966 m!629059))

(assert (=> b!655966 m!629061))

(assert (=> b!655971 m!629035))

(assert (=> b!655971 m!629039))

(assert (=> b!655971 m!629033))

(declare-fun m!629077 () Bool)

(assert (=> b!655987 m!629077))

(declare-fun m!629079 () Bool)

(assert (=> b!655969 m!629079))

(declare-fun m!629081 () Bool)

(assert (=> b!655977 m!629081))

(declare-fun m!629083 () Bool)

(assert (=> b!655976 m!629083))

(assert (=> b!655976 m!629033))

(assert (=> b!655976 m!629033))

(declare-fun m!629085 () Bool)

(assert (=> b!655976 m!629085))

(assert (=> b!655978 m!629033))

(assert (=> b!655978 m!629033))

(declare-fun m!629087 () Bool)

(assert (=> b!655978 m!629087))

(declare-fun m!629089 () Bool)

(assert (=> b!655965 m!629089))

(assert (=> b!655981 m!629033))

(assert (=> b!655981 m!629033))

(assert (=> b!655981 m!629051))

(declare-fun m!629091 () Bool)

(assert (=> start!59372 m!629091))

(declare-fun m!629093 () Bool)

(assert (=> start!59372 m!629093))

(assert (=> b!655972 m!629033))

(assert (=> b!655972 m!629033))

(assert (=> b!655972 m!629063))

(assert (=> b!655983 m!629035))

(declare-fun m!629095 () Bool)

(assert (=> b!655983 m!629095))

(push 1)

(assert (not b!655972))

(assert (not b!655981))

(assert (not b!655966))

(assert (not b!655975))

(assert (not b!655965))

(assert (not start!59372))

(assert (not b!655967))

(assert (not b!655977))

(assert (not b!655982))

(assert (not b!655968))

(assert (not b!655969))

(assert (not b!655976))

(assert (not b!655978))

(assert (not b!655988))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92621 () Bool)

(declare-fun res!425673 () Bool)

(declare-fun e!376862 () Bool)

(assert (=> d!92621 (=> res!425673 e!376862)))

(assert (=> d!92621 (= res!425673 (= (select (arr!18546 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!92621 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!376862)))

(declare-fun b!656195 () Bool)

(declare-fun e!376863 () Bool)

(assert (=> b!656195 (= e!376862 e!376863)))

(declare-fun res!425674 () Bool)

(assert (=> b!656195 (=> (not res!425674) (not e!376863))))

(assert (=> b!656195 (= res!425674 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18910 a!2986)))))

(declare-fun b!656196 () Bool)

(assert (=> b!656196 (= e!376863 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92621 (not res!425673)) b!656195))

(assert (= (and b!656195 res!425674) b!656196))

(declare-fun m!629287 () Bool)

(assert (=> d!92621 m!629287))

(declare-fun m!629289 () Bool)

(assert (=> b!656196 m!629289))

(assert (=> b!655975 d!92621))

(declare-fun d!92623 () Bool)

(declare-fun res!425675 () Bool)

(declare-fun e!376864 () Bool)

(assert (=> d!92623 (=> res!425675 e!376864)))

(assert (=> d!92623 (= res!425675 (= (select (arr!18546 lt!306137) index!984) (select (arr!18546 a!2986) j!136)))))

(assert (=> d!92623 (= (arrayContainsKey!0 lt!306137 (select (arr!18546 a!2986) j!136) index!984) e!376864)))

(declare-fun b!656197 () Bool)

(declare-fun e!376865 () Bool)

(assert (=> b!656197 (= e!376864 e!376865)))

(declare-fun res!425676 () Bool)

(assert (=> b!656197 (=> (not res!425676) (not e!376865))))

(assert (=> b!656197 (= res!425676 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18910 lt!306137)))))

(declare-fun b!656198 () Bool)

(assert (=> b!656198 (= e!376865 (arrayContainsKey!0 lt!306137 (select (arr!18546 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92623 (not res!425675)) b!656197))

(assert (= (and b!656197 res!425676) b!656198))

(declare-fun m!629291 () Bool)

(assert (=> d!92623 m!629291))

(assert (=> b!656198 m!629033))

(declare-fun m!629293 () Bool)

(assert (=> b!656198 m!629293))

(assert (=> b!655972 d!92623))

(declare-fun d!92625 () Bool)

(declare-fun res!425677 () Bool)

(declare-fun e!376866 () Bool)

(assert (=> d!92625 (=> res!425677 e!376866)))

(assert (=> d!92625 (= res!425677 (= (select (arr!18546 lt!306137) j!136) (select (arr!18546 a!2986) j!136)))))

(assert (=> d!92625 (= (arrayContainsKey!0 lt!306137 (select (arr!18546 a!2986) j!136) j!136) e!376866)))

(declare-fun b!656199 () Bool)

(declare-fun e!376867 () Bool)

(assert (=> b!656199 (= e!376866 e!376867)))

(declare-fun res!425678 () Bool)

(assert (=> b!656199 (=> (not res!425678) (not e!376867))))

(assert (=> b!656199 (= res!425678 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18910 lt!306137)))))

(declare-fun b!656200 () Bool)

(assert (=> b!656200 (= e!376867 (arrayContainsKey!0 lt!306137 (select (arr!18546 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92625 (not res!425677)) b!656199))

(assert (= (and b!656199 res!425678) b!656200))

(declare-fun m!629295 () Bool)

(assert (=> d!92625 m!629295))

(assert (=> b!656200 m!629033))

(declare-fun m!629297 () Bool)

(assert (=> b!656200 m!629297))

(assert (=> b!655981 d!92625))

(assert (=> b!655982 d!92623))

(declare-fun b!656245 () Bool)

(declare-fun e!376892 () Bool)

(declare-fun e!376893 () Bool)

(assert (=> b!656245 (= e!376892 e!376893)))

(declare-fun c!75648 () Bool)

(assert (=> b!656245 (= c!75648 (validKeyInArray!0 (select (arr!18546 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33840 () Bool)

(declare-fun call!33843 () Bool)

(assert (=> bm!33840 (= call!33843 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!656246 () Bool)

(assert (=> b!656246 (= e!376893 call!33843)))

(declare-fun b!656247 () Bool)

(declare-fun e!376894 () Bool)

(assert (=> b!656247 (= e!376894 call!33843)))

(declare-fun b!656248 () Bool)

(assert (=> b!656248 (= e!376893 e!376894)))

(declare-fun lt!306316 () (_ BitVec 64))

(assert (=> b!656248 (= lt!306316 (select (arr!18546 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!306315 () Unit!22614)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38692 (_ BitVec 64) (_ BitVec 32)) Unit!22614)

(assert (=> b!656248 (= lt!306315 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!306316 #b00000000000000000000000000000000))))

(assert (=> b!656248 (arrayContainsKey!0 a!2986 lt!306316 #b00000000000000000000000000000000)))

(declare-fun lt!306317 () Unit!22614)

(assert (=> b!656248 (= lt!306317 lt!306315)))

(declare-fun res!425684 () Bool)

(assert (=> b!656248 (= res!425684 (= (seekEntryOrOpen!0 (select (arr!18546 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6986 #b00000000000000000000000000000000)))))

(assert (=> b!656248 (=> (not res!425684) (not e!376894))))

(declare-fun d!92627 () Bool)

(declare-fun res!425683 () Bool)

(assert (=> d!92627 (=> res!425683 e!376892)))

(assert (=> d!92627 (= res!425683 (bvsge #b00000000000000000000000000000000 (size!18910 a!2986)))))

(assert (=> d!92627 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!376892)))

(assert (= (and d!92627 (not res!425683)) b!656245))

(assert (= (and b!656245 c!75648) b!656248))

(assert (= (and b!656245 (not c!75648)) b!656246))

(assert (= (and b!656248 res!425684) b!656247))

(assert (= (or b!656247 b!656246) bm!33840))

(assert (=> b!656245 m!629287))

(assert (=> b!656245 m!629287))

(declare-fun m!629333 () Bool)

(assert (=> b!656245 m!629333))

(declare-fun m!629335 () Bool)

(assert (=> bm!33840 m!629335))

(assert (=> b!656248 m!629287))

(declare-fun m!629337 () Bool)

(assert (=> b!656248 m!629337))

(declare-fun m!629339 () Bool)

(assert (=> b!656248 m!629339))

(assert (=> b!656248 m!629287))

(declare-fun m!629343 () Bool)

(assert (=> b!656248 m!629343))

(assert (=> b!655969 d!92627))

(declare-fun e!376917 () SeekEntryResult!6986)

(declare-fun b!656291 () Bool)

(assert (=> b!656291 (= e!376917 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306125 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18546 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656292 () Bool)

(declare-fun e!376916 () SeekEntryResult!6986)

(assert (=> b!656292 (= e!376916 (Found!6986 lt!306125))))

(declare-fun b!656293 () Bool)

(declare-fun e!376918 () SeekEntryResult!6986)

(assert (=> b!656293 (= e!376918 e!376916)))

(declare-fun c!75670 () Bool)

(declare-fun lt!306336 () (_ BitVec 64))

(assert (=> b!656293 (= c!75670 (= lt!306336 (select (arr!18546 a!2986) j!136)))))

(declare-fun d!92637 () Bool)

(declare-fun lt!306335 () SeekEntryResult!6986)

(assert (=> d!92637 (and (or (is-Undefined!6986 lt!306335) (not (is-Found!6986 lt!306335)) (and (bvsge (index!30304 lt!306335) #b00000000000000000000000000000000) (bvslt (index!30304 lt!306335) (size!18910 a!2986)))) (or (is-Undefined!6986 lt!306335) (is-Found!6986 lt!306335) (not (is-MissingVacant!6986 lt!306335)) (not (= (index!30306 lt!306335) vacantSpotIndex!68)) (and (bvsge (index!30306 lt!306335) #b00000000000000000000000000000000) (bvslt (index!30306 lt!306335) (size!18910 a!2986)))) (or (is-Undefined!6986 lt!306335) (ite (is-Found!6986 lt!306335) (= (select (arr!18546 a!2986) (index!30304 lt!306335)) (select (arr!18546 a!2986) j!136)) (and (is-MissingVacant!6986 lt!306335) (= (index!30306 lt!306335) vacantSpotIndex!68) (= (select (arr!18546 a!2986) (index!30306 lt!306335)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92637 (= lt!306335 e!376918)))

(declare-fun c!75671 () Bool)

(assert (=> d!92637 (= c!75671 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92637 (= lt!306336 (select (arr!18546 a!2986) lt!306125))))

(assert (=> d!92637 (validMask!0 mask!3053)))

(assert (=> d!92637 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306125 vacantSpotIndex!68 (select (arr!18546 a!2986) j!136) a!2986 mask!3053) lt!306335)))

(declare-fun b!656294 () Bool)

(assert (=> b!656294 (= e!376918 Undefined!6986)))

(declare-fun b!656295 () Bool)

(declare-fun c!75672 () Bool)

(assert (=> b!656295 (= c!75672 (= lt!306336 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656295 (= e!376916 e!376917)))

(declare-fun b!656296 () Bool)

(assert (=> b!656296 (= e!376917 (MissingVacant!6986 vacantSpotIndex!68))))

(assert (= (and d!92637 c!75671) b!656294))

(assert (= (and d!92637 (not c!75671)) b!656293))

(assert (= (and b!656293 c!75670) b!656292))

(assert (= (and b!656293 (not c!75670)) b!656295))

(assert (= (and b!656295 c!75672) b!656296))

(assert (= (and b!656295 (not c!75672)) b!656291))

(declare-fun m!629375 () Bool)

(assert (=> b!656291 m!629375))

(assert (=> b!656291 m!629375))

(assert (=> b!656291 m!629033))

(declare-fun m!629377 () Bool)

(assert (=> b!656291 m!629377))

(declare-fun m!629379 () Bool)

(assert (=> d!92637 m!629379))

(declare-fun m!629381 () Bool)

(assert (=> d!92637 m!629381))

(declare-fun m!629383 () Bool)

(assert (=> d!92637 m!629383))

(assert (=> d!92637 m!629091))

(assert (=> b!655968 d!92637))

(declare-fun e!376920 () SeekEntryResult!6986)

(declare-fun b!656297 () Bool)

(assert (=> b!656297 (= e!376920 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306125 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!306138 lt!306137 mask!3053))))

(declare-fun b!656298 () Bool)

(declare-fun e!376919 () SeekEntryResult!6986)

(assert (=> b!656298 (= e!376919 (Found!6986 lt!306125))))

(declare-fun b!656299 () Bool)

(declare-fun e!376921 () SeekEntryResult!6986)

(assert (=> b!656299 (= e!376921 e!376919)))

(declare-fun c!75673 () Bool)

(declare-fun lt!306338 () (_ BitVec 64))

(assert (=> b!656299 (= c!75673 (= lt!306338 lt!306138))))

(declare-fun d!92649 () Bool)

(declare-fun lt!306337 () SeekEntryResult!6986)

(assert (=> d!92649 (and (or (is-Undefined!6986 lt!306337) (not (is-Found!6986 lt!306337)) (and (bvsge (index!30304 lt!306337) #b00000000000000000000000000000000) (bvslt (index!30304 lt!306337) (size!18910 lt!306137)))) (or (is-Undefined!6986 lt!306337) (is-Found!6986 lt!306337) (not (is-MissingVacant!6986 lt!306337)) (not (= (index!30306 lt!306337) vacantSpotIndex!68)) (and (bvsge (index!30306 lt!306337) #b00000000000000000000000000000000) (bvslt (index!30306 lt!306337) (size!18910 lt!306137)))) (or (is-Undefined!6986 lt!306337) (ite (is-Found!6986 lt!306337) (= (select (arr!18546 lt!306137) (index!30304 lt!306337)) lt!306138) (and (is-MissingVacant!6986 lt!306337) (= (index!30306 lt!306337) vacantSpotIndex!68) (= (select (arr!18546 lt!306137) (index!30306 lt!306337)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92649 (= lt!306337 e!376921)))

(declare-fun c!75674 () Bool)

(assert (=> d!92649 (= c!75674 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92649 (= lt!306338 (select (arr!18546 lt!306137) lt!306125))))

(assert (=> d!92649 (validMask!0 mask!3053)))

(assert (=> d!92649 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306125 vacantSpotIndex!68 lt!306138 lt!306137 mask!3053) lt!306337)))

(declare-fun b!656300 () Bool)

(assert (=> b!656300 (= e!376921 Undefined!6986)))

(declare-fun b!656301 () Bool)

(declare-fun c!75675 () Bool)

(assert (=> b!656301 (= c!75675 (= lt!306338 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656301 (= e!376919 e!376920)))

(declare-fun b!656302 () Bool)

(assert (=> b!656302 (= e!376920 (MissingVacant!6986 vacantSpotIndex!68))))

(assert (= (and d!92649 c!75674) b!656300))

(assert (= (and d!92649 (not c!75674)) b!656299))

(assert (= (and b!656299 c!75673) b!656298))

(assert (= (and b!656299 (not c!75673)) b!656301))

(assert (= (and b!656301 c!75675) b!656302))

(assert (= (and b!656301 (not c!75675)) b!656297))

(assert (=> b!656297 m!629375))

(assert (=> b!656297 m!629375))

(declare-fun m!629385 () Bool)

(assert (=> b!656297 m!629385))

(declare-fun m!629387 () Bool)

(assert (=> d!92649 m!629387))

(declare-fun m!629389 () Bool)

(assert (=> d!92649 m!629389))

(declare-fun m!629391 () Bool)

(assert (=> d!92649 m!629391))

(assert (=> d!92649 m!629091))

(assert (=> b!655968 d!92649))

(declare-fun d!92651 () Bool)

(declare-fun e!376957 () Bool)

(assert (=> d!92651 e!376957))

(declare-fun res!425704 () Bool)

(assert (=> d!92651 (=> (not res!425704) (not e!376957))))

(assert (=> d!92651 (= res!425704 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18910 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18910 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18910 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18910 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18910 a!2986))))))

(declare-fun lt!306356 () Unit!22614)

(declare-fun choose!9 (array!38692 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22614)

(assert (=> d!92651 (= lt!306356 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306125 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92651 (validMask!0 mask!3053)))

(assert (=> d!92651 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306125 vacantSpotIndex!68 mask!3053) lt!306356)))

(declare-fun b!656354 () Bool)

(assert (=> b!656354 (= e!376957 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306125 vacantSpotIndex!68 (select (arr!18546 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306125 vacantSpotIndex!68 (select (store (arr!18546 a!2986) i!1108 k!1786) j!136) (array!38693 (store (arr!18546 a!2986) i!1108 k!1786) (size!18910 a!2986)) mask!3053)))))

(assert (= (and d!92651 res!425704) b!656354))

(declare-fun m!629429 () Bool)

(assert (=> d!92651 m!629429))

(assert (=> d!92651 m!629091))

(assert (=> b!656354 m!629033))

(assert (=> b!656354 m!629029))

(assert (=> b!656354 m!629035))

(assert (=> b!656354 m!629029))

(declare-fun m!629435 () Bool)

(assert (=> b!656354 m!629435))

(assert (=> b!656354 m!629033))

(assert (=> b!656354 m!629037))

(assert (=> b!655968 d!92651))

(declare-fun b!656357 () Bool)

(declare-fun e!376961 () SeekEntryResult!6986)

(assert (=> b!656357 (= e!376961 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!306138 lt!306137 mask!3053))))

(declare-fun b!656358 () Bool)

(declare-fun e!376960 () SeekEntryResult!6986)

(assert (=> b!656358 (= e!376960 (Found!6986 index!984))))

(declare-fun b!656359 () Bool)

(declare-fun e!376962 () SeekEntryResult!6986)

(assert (=> b!656359 (= e!376962 e!376960)))

(declare-fun c!75692 () Bool)

(declare-fun lt!306359 () (_ BitVec 64))

(assert (=> b!656359 (= c!75692 (= lt!306359 lt!306138))))

(declare-fun lt!306358 () SeekEntryResult!6986)

(declare-fun d!92669 () Bool)

(assert (=> d!92669 (and (or (is-Undefined!6986 lt!306358) (not (is-Found!6986 lt!306358)) (and (bvsge (index!30304 lt!306358) #b00000000000000000000000000000000) (bvslt (index!30304 lt!306358) (size!18910 lt!306137)))) (or (is-Undefined!6986 lt!306358) (is-Found!6986 lt!306358) (not (is-MissingVacant!6986 lt!306358)) (not (= (index!30306 lt!306358) vacantSpotIndex!68)) (and (bvsge (index!30306 lt!306358) #b00000000000000000000000000000000) (bvslt (index!30306 lt!306358) (size!18910 lt!306137)))) (or (is-Undefined!6986 lt!306358) (ite (is-Found!6986 lt!306358) (= (select (arr!18546 lt!306137) (index!30304 lt!306358)) lt!306138) (and (is-MissingVacant!6986 lt!306358) (= (index!30306 lt!306358) vacantSpotIndex!68) (= (select (arr!18546 lt!306137) (index!30306 lt!306358)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92669 (= lt!306358 e!376962)))

(declare-fun c!75693 () Bool)

(assert (=> d!92669 (= c!75693 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92669 (= lt!306359 (select (arr!18546 lt!306137) index!984))))

(assert (=> d!92669 (validMask!0 mask!3053)))

(assert (=> d!92669 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306138 lt!306137 mask!3053) lt!306358)))

(declare-fun b!656360 () Bool)

(assert (=> b!656360 (= e!376962 Undefined!6986)))

(declare-fun b!656361 () Bool)

(declare-fun c!75694 () Bool)

(assert (=> b!656361 (= c!75694 (= lt!306359 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656361 (= e!376960 e!376961)))

(declare-fun b!656362 () Bool)

(assert (=> b!656362 (= e!376961 (MissingVacant!6986 vacantSpotIndex!68))))

(assert (= (and d!92669 c!75693) b!656360))

(assert (= (and d!92669 (not c!75693)) b!656359))

(assert (= (and b!656359 c!75692) b!656358))

(assert (= (and b!656359 (not c!75692)) b!656361))

(assert (= (and b!656361 c!75694) b!656362))

(assert (= (and b!656361 (not c!75694)) b!656357))

(assert (=> b!656357 m!629027))

(assert (=> b!656357 m!629027))

(declare-fun m!629445 () Bool)

(assert (=> b!656357 m!629445))

(declare-fun m!629447 () Bool)

(assert (=> d!92669 m!629447))

(declare-fun m!629449 () Bool)

(assert (=> d!92669 m!629449))

(assert (=> d!92669 m!629291))

(assert (=> d!92669 m!629091))

(assert (=> b!655968 d!92669))

(declare-fun d!92675 () Bool)

(declare-fun lt!306363 () (_ BitVec 32))

(assert (=> d!92675 (and (bvsge lt!306363 #b00000000000000000000000000000000) (bvslt lt!306363 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92675 (= lt!306363 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92675 (validMask!0 mask!3053)))

(assert (=> d!92675 (= (nextIndex!0 index!984 x!910 mask!3053) lt!306363)))

(declare-fun bs!19533 () Bool)

(assert (= bs!19533 d!92675))

(declare-fun m!629457 () Bool)

(assert (=> bs!19533 m!629457))

(assert (=> bs!19533 m!629091))

(assert (=> b!655968 d!92675))

(declare-fun b!656414 () Bool)

(declare-fun e!377003 () SeekEntryResult!6986)

(declare-fun lt!306385 () SeekEntryResult!6986)

(assert (=> b!656414 (= e!377003 (MissingZero!6986 (index!30305 lt!306385)))))

(declare-fun b!656415 () Bool)

(declare-fun e!377004 () SeekEntryResult!6986)

(declare-fun e!377002 () SeekEntryResult!6986)

(assert (=> b!656415 (= e!377004 e!377002)))

(declare-fun lt!306387 () (_ BitVec 64))

(assert (=> b!656415 (= lt!306387 (select (arr!18546 a!2986) (index!30305 lt!306385)))))

(declare-fun c!75708 () Bool)

(assert (=> b!656415 (= c!75708 (= lt!306387 k!1786))))

(declare-fun b!656416 () Bool)

(assert (=> b!656416 (= e!377003 (seekKeyOrZeroReturnVacant!0 (x!59091 lt!306385) (index!30305 lt!306385) (index!30305 lt!306385) k!1786 a!2986 mask!3053))))

(declare-fun d!92685 () Bool)

(declare-fun lt!306386 () SeekEntryResult!6986)

(assert (=> d!92685 (and (or (is-Undefined!6986 lt!306386) (not (is-Found!6986 lt!306386)) (and (bvsge (index!30304 lt!306386) #b00000000000000000000000000000000) (bvslt (index!30304 lt!306386) (size!18910 a!2986)))) (or (is-Undefined!6986 lt!306386) (is-Found!6986 lt!306386) (not (is-MissingZero!6986 lt!306386)) (and (bvsge (index!30303 lt!306386) #b00000000000000000000000000000000) (bvslt (index!30303 lt!306386) (size!18910 a!2986)))) (or (is-Undefined!6986 lt!306386) (is-Found!6986 lt!306386) (is-MissingZero!6986 lt!306386) (not (is-MissingVacant!6986 lt!306386)) (and (bvsge (index!30306 lt!306386) #b00000000000000000000000000000000) (bvslt (index!30306 lt!306386) (size!18910 a!2986)))) (or (is-Undefined!6986 lt!306386) (ite (is-Found!6986 lt!306386) (= (select (arr!18546 a!2986) (index!30304 lt!306386)) k!1786) (ite (is-MissingZero!6986 lt!306386) (= (select (arr!18546 a!2986) (index!30303 lt!306386)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6986 lt!306386) (= (select (arr!18546 a!2986) (index!30306 lt!306386)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!92685 (= lt!306386 e!377004)))

(declare-fun c!75709 () Bool)

(assert (=> d!92685 (= c!75709 (and (is-Intermediate!6986 lt!306385) (undefined!7798 lt!306385)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38692 (_ BitVec 32)) SeekEntryResult!6986)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92685 (= lt!306385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!92685 (validMask!0 mask!3053)))

(assert (=> d!92685 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!306386)))

(declare-fun b!656417 () Bool)

(declare-fun c!75707 () Bool)

(assert (=> b!656417 (= c!75707 (= lt!306387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656417 (= e!377002 e!377003)))

(declare-fun b!656418 () Bool)

(assert (=> b!656418 (= e!377004 Undefined!6986)))

(declare-fun b!656419 () Bool)

(assert (=> b!656419 (= e!377002 (Found!6986 (index!30305 lt!306385)))))

(assert (= (and d!92685 c!75709) b!656418))

(assert (= (and d!92685 (not c!75709)) b!656415))

(assert (= (and b!656415 c!75708) b!656419))

(assert (= (and b!656415 (not c!75708)) b!656417))

(assert (= (and b!656417 c!75707) b!656414))

(assert (= (and b!656417 (not c!75707)) b!656416))

(declare-fun m!629497 () Bool)

(assert (=> b!656415 m!629497))

(declare-fun m!629499 () Bool)

(assert (=> b!656416 m!629499))

(declare-fun m!629501 () Bool)

(assert (=> d!92685 m!629501))

(declare-fun m!629503 () Bool)

(assert (=> d!92685 m!629503))

(declare-fun m!629505 () Bool)

(assert (=> d!92685 m!629505))

(assert (=> d!92685 m!629091))

(assert (=> d!92685 m!629503))

(declare-fun m!629507 () Bool)

(assert (=> d!92685 m!629507))

(declare-fun m!629509 () Bool)

(assert (=> d!92685 m!629509))

(assert (=> b!655977 d!92685))

(declare-fun b!656435 () Bool)

(declare-fun e!377019 () Bool)

(declare-fun e!377020 () Bool)

(assert (=> b!656435 (= e!377019 e!377020)))

(declare-fun c!75712 () Bool)

(assert (=> b!656435 (= c!75712 (validKeyInArray!0 (select (arr!18546 lt!306137) index!984)))))

(declare-fun b!656436 () Bool)

(declare-fun call!33856 () Bool)

(assert (=> b!656436 (= e!377020 call!33856)))

(declare-fun b!656437 () Bool)

(assert (=> b!656437 (= e!377020 call!33856)))

(declare-fun bm!33853 () Bool)

(assert (=> bm!33853 (= call!33856 (arrayNoDuplicates!0 lt!306137 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75712 (Cons!12583 (select (arr!18546 lt!306137) index!984) Nil!12584) Nil!12584)))))

(declare-fun b!656439 () Bool)

(declare-fun e!377018 () Bool)

(assert (=> b!656439 (= e!377018 e!377019)))

(declare-fun res!425746 () Bool)

(assert (=> b!656439 (=> (not res!425746) (not e!377019))))

(declare-fun e!377021 () Bool)

(assert (=> b!656439 (= res!425746 (not e!377021))))

(declare-fun res!425747 () Bool)

(assert (=> b!656439 (=> (not res!425747) (not e!377021))))

(assert (=> b!656439 (= res!425747 (validKeyInArray!0 (select (arr!18546 lt!306137) index!984)))))

(declare-fun b!656438 () Bool)

(declare-fun contains!3193 (List!12587 (_ BitVec 64)) Bool)

(assert (=> b!656438 (= e!377021 (contains!3193 Nil!12584 (select (arr!18546 lt!306137) index!984)))))

(declare-fun d!92709 () Bool)

(declare-fun res!425745 () Bool)

(assert (=> d!92709 (=> res!425745 e!377018)))

(assert (=> d!92709 (= res!425745 (bvsge index!984 (size!18910 lt!306137)))))

(assert (=> d!92709 (= (arrayNoDuplicates!0 lt!306137 index!984 Nil!12584) e!377018)))

(assert (= (and d!92709 (not res!425745)) b!656439))

(assert (= (and b!656439 res!425747) b!656438))

(assert (= (and b!656439 res!425746) b!656435))

(assert (= (and b!656435 c!75712) b!656437))

(assert (= (and b!656435 (not c!75712)) b!656436))

(assert (= (or b!656437 b!656436) bm!33853))

(assert (=> b!656435 m!629291))

(assert (=> b!656435 m!629291))

(declare-fun m!629521 () Bool)

(assert (=> b!656435 m!629521))

(assert (=> bm!33853 m!629291))

(declare-fun m!629523 () Bool)

(assert (=> bm!33853 m!629523))

(assert (=> b!656439 m!629291))

(assert (=> b!656439 m!629291))

(assert (=> b!656439 m!629521))

(assert (=> b!656438 m!629291))

(assert (=> b!656438 m!629291))

(declare-fun m!629525 () Bool)

(assert (=> b!656438 m!629525))

(assert (=> b!655988 d!92709))

(declare-fun d!92717 () Bool)

(assert (=> d!92717 (arrayNoDuplicates!0 lt!306137 index!984 Nil!12584)))

(declare-fun lt!306401 () Unit!22614)

(declare-fun choose!39 (array!38692 (_ BitVec 32) (_ BitVec 32)) Unit!22614)

(assert (=> d!92717 (= lt!306401 (choose!39 lt!306137 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92717 (bvslt (size!18910 lt!306137) #b01111111111111111111111111111111)))

(assert (=> d!92717 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306137 #b00000000000000000000000000000000 index!984) lt!306401)))

(declare-fun bs!19540 () Bool)

(assert (= bs!19540 d!92717))

(assert (=> bs!19540 m!629053))

(declare-fun m!629549 () Bool)

(assert (=> bs!19540 m!629549))

(assert (=> b!655988 d!92717))

(assert (=> b!655988 d!92625))

(declare-fun d!92729 () Bool)

(assert (=> d!92729 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (size!18910 lt!306137)) (not (= (select (arr!18546 lt!306137) index!984) (select (arr!18546 a!2986) j!136))))))

(declare-fun lt!306404 () Unit!22614)

(declare-fun choose!21 (array!38692 (_ BitVec 64) (_ BitVec 32) List!12587) Unit!22614)

(assert (=> d!92729 (= lt!306404 (choose!21 lt!306137 (select (arr!18546 a!2986) j!136) index!984 Nil!12584))))

(assert (=> d!92729 (bvslt (size!18910 lt!306137) #b01111111111111111111111111111111)))

(assert (=> d!92729 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306137 (select (arr!18546 a!2986) j!136) index!984 Nil!12584) lt!306404)))

(declare-fun bs!19541 () Bool)

(assert (= bs!19541 d!92729))

(assert (=> bs!19541 m!629291))

(assert (=> bs!19541 m!629033))

(declare-fun m!629551 () Bool)

(assert (=> bs!19541 m!629551))

(assert (=> b!655988 d!92729))

(declare-fun b!656453 () Bool)

(declare-fun e!377032 () Bool)

(declare-fun e!377033 () Bool)

(assert (=> b!656453 (= e!377032 e!377033)))

(declare-fun c!75717 () Bool)

(assert (=> b!656453 (= c!75717 (validKeyInArray!0 (select (arr!18546 lt!306137) #b00000000000000000000000000000000)))))

(declare-fun b!656454 () Bool)

(declare-fun call!33858 () Bool)

(assert (=> b!656454 (= e!377033 call!33858)))

(declare-fun b!656455 () Bool)

(assert (=> b!656455 (= e!377033 call!33858)))

(declare-fun bm!33855 () Bool)

(assert (=> bm!33855 (= call!33858 (arrayNoDuplicates!0 lt!306137 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75717 (Cons!12583 (select (arr!18546 lt!306137) #b00000000000000000000000000000000) Nil!12584) Nil!12584)))))

(declare-fun b!656457 () Bool)

(declare-fun e!377031 () Bool)

(assert (=> b!656457 (= e!377031 e!377032)))

(declare-fun res!425754 () Bool)

(assert (=> b!656457 (=> (not res!425754) (not e!377032))))

(declare-fun e!377034 () Bool)

(assert (=> b!656457 (= res!425754 (not e!377034))))

(declare-fun res!425755 () Bool)

(assert (=> b!656457 (=> (not res!425755) (not e!377034))))

(assert (=> b!656457 (= res!425755 (validKeyInArray!0 (select (arr!18546 lt!306137) #b00000000000000000000000000000000)))))

(declare-fun b!656456 () Bool)

(assert (=> b!656456 (= e!377034 (contains!3193 Nil!12584 (select (arr!18546 lt!306137) #b00000000000000000000000000000000)))))

(declare-fun d!92731 () Bool)

(declare-fun res!425753 () Bool)

(assert (=> d!92731 (=> res!425753 e!377031)))

(assert (=> d!92731 (= res!425753 (bvsge #b00000000000000000000000000000000 (size!18910 lt!306137)))))

(assert (=> d!92731 (= (arrayNoDuplicates!0 lt!306137 #b00000000000000000000000000000000 Nil!12584) e!377031)))

(assert (= (and d!92731 (not res!425753)) b!656457))

(assert (= (and b!656457 res!425755) b!656456))

(assert (= (and b!656457 res!425754) b!656453))

(assert (= (and b!656453 c!75717) b!656455))

(assert (= (and b!656453 (not c!75717)) b!656454))

(assert (= (or b!656455 b!656454) bm!33855))

(declare-fun m!629553 () Bool)

(assert (=> b!656453 m!629553))

(assert (=> b!656453 m!629553))

(declare-fun m!629555 () Bool)

(assert (=> b!656453 m!629555))

(assert (=> bm!33855 m!629553))

(declare-fun m!629557 () Bool)

(assert (=> bm!33855 m!629557))

(assert (=> b!656457 m!629553))

(assert (=> b!656457 m!629553))

(assert (=> b!656457 m!629555))

(assert (=> b!656456 m!629553))

(assert (=> b!656456 m!629553))

(declare-fun m!629559 () Bool)

(assert (=> b!656456 m!629559))

(assert (=> b!655988 d!92731))

(declare-fun d!92733 () Bool)

(declare-fun e!377037 () Bool)

(assert (=> d!92733 e!377037))

(declare-fun res!425758 () Bool)

(assert (=> d!92733 (=> (not res!425758) (not e!377037))))

(assert (=> d!92733 (= res!425758 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18910 a!2986))))))

(declare-fun lt!306407 () Unit!22614)

(declare-fun choose!41 (array!38692 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12587) Unit!22614)

(assert (=> d!92733 (= lt!306407 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12584))))

(assert (=> d!92733 (bvslt (size!18910 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92733 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12584) lt!306407)))

(declare-fun b!656460 () Bool)

(assert (=> b!656460 (= e!377037 (arrayNoDuplicates!0 (array!38693 (store (arr!18546 a!2986) i!1108 k!1786) (size!18910 a!2986)) #b00000000000000000000000000000000 Nil!12584))))

(assert (= (and d!92733 res!425758) b!656460))

(declare-fun m!629561 () Bool)

(assert (=> d!92733 m!629561))

(assert (=> b!656460 m!629035))

(declare-fun m!629563 () Bool)

(assert (=> b!656460 m!629563))

(assert (=> b!655988 d!92733))

(declare-fun d!92735 () Bool)

(declare-fun res!425759 () Bool)

(declare-fun e!377038 () Bool)

(assert (=> d!92735 (=> res!425759 e!377038)))

(assert (=> d!92735 (= res!425759 (= (select (arr!18546 lt!306137) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18546 a!2986) j!136)))))

(assert (=> d!92735 (= (arrayContainsKey!0 lt!306137 (select (arr!18546 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!377038)))

(declare-fun b!656461 () Bool)

(declare-fun e!377039 () Bool)

(assert (=> b!656461 (= e!377038 e!377039)))

(declare-fun res!425760 () Bool)

(assert (=> b!656461 (=> (not res!425760) (not e!377039))))

(assert (=> b!656461 (= res!425760 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18910 lt!306137)))))

