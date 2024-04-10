; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54264 () Bool)

(assert start!54264)

(declare-fun b!593057 () Bool)

(declare-fun res!379668 () Bool)

(declare-fun e!338727 () Bool)

(assert (=> b!593057 (=> (not res!379668) (not e!338727))))

(declare-datatypes ((array!36931 0))(
  ( (array!36932 (arr!17734 (Array (_ BitVec 32) (_ BitVec 64))) (size!18098 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36931)

(declare-datatypes ((List!11775 0))(
  ( (Nil!11772) (Cons!11771 (h!12816 (_ BitVec 64)) (t!18003 List!11775)) )
))
(declare-fun arrayNoDuplicates!0 (array!36931 (_ BitVec 32) List!11775) Bool)

(assert (=> b!593057 (= res!379668 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11772))))

(declare-fun b!593058 () Bool)

(declare-fun e!338717 () Bool)

(declare-datatypes ((SeekEntryResult!6174 0))(
  ( (MissingZero!6174 (index!26935 (_ BitVec 32))) (Found!6174 (index!26936 (_ BitVec 32))) (Intermediate!6174 (undefined!6986 Bool) (index!26937 (_ BitVec 32)) (x!55727 (_ BitVec 32))) (Undefined!6174) (MissingVacant!6174 (index!26938 (_ BitVec 32))) )
))
(declare-fun lt!269242 () SeekEntryResult!6174)

(declare-fun lt!269245 () SeekEntryResult!6174)

(assert (=> b!593058 (= e!338717 (= lt!269242 lt!269245))))

(declare-fun res!379667 () Bool)

(declare-fun e!338720 () Bool)

(assert (=> start!54264 (=> (not res!379667) (not e!338720))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54264 (= res!379667 (validMask!0 mask!3053))))

(assert (=> start!54264 e!338720))

(assert (=> start!54264 true))

(declare-fun array_inv!13530 (array!36931) Bool)

(assert (=> start!54264 (array_inv!13530 a!2986)))

(declare-fun b!593059 () Bool)

(declare-fun res!379658 () Bool)

(assert (=> b!593059 (=> (not res!379658) (not e!338720))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!593059 (= res!379658 (validKeyInArray!0 k0!1786))))

(declare-fun b!593060 () Bool)

(declare-fun e!338723 () Bool)

(declare-fun e!338719 () Bool)

(assert (=> b!593060 (= e!338723 e!338719)))

(declare-fun res!379664 () Bool)

(assert (=> b!593060 (=> (not res!379664) (not e!338719))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!593060 (= res!379664 (and (= lt!269242 (Found!6174 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17734 a!2986) index!984) (select (arr!17734 a!2986) j!136))) (not (= (select (arr!17734 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36931 (_ BitVec 32)) SeekEntryResult!6174)

(assert (=> b!593060 (= lt!269242 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593061 () Bool)

(declare-datatypes ((Unit!18614 0))(
  ( (Unit!18615) )
))
(declare-fun e!338722 () Unit!18614)

(declare-fun Unit!18616 () Unit!18614)

(assert (=> b!593061 (= e!338722 Unit!18616)))

(declare-fun b!593062 () Bool)

(assert (=> b!593062 (= e!338720 e!338727)))

(declare-fun res!379673 () Bool)

(assert (=> b!593062 (=> (not res!379673) (not e!338727))))

(declare-fun lt!269241 () SeekEntryResult!6174)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!593062 (= res!379673 (or (= lt!269241 (MissingZero!6174 i!1108)) (= lt!269241 (MissingVacant!6174 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36931 (_ BitVec 32)) SeekEntryResult!6174)

(assert (=> b!593062 (= lt!269241 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!593063 () Bool)

(declare-fun res!379663 () Bool)

(assert (=> b!593063 (=> (not res!379663) (not e!338727))))

(assert (=> b!593063 (= res!379663 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17734 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593064 () Bool)

(declare-fun e!338724 () Bool)

(declare-fun e!338718 () Bool)

(assert (=> b!593064 (= e!338724 e!338718)))

(declare-fun res!379661 () Bool)

(assert (=> b!593064 (=> res!379661 e!338718)))

(declare-fun lt!269243 () (_ BitVec 64))

(declare-fun lt!269247 () (_ BitVec 64))

(assert (=> b!593064 (= res!379661 (or (not (= (select (arr!17734 a!2986) j!136) lt!269247)) (not (= (select (arr!17734 a!2986) j!136) lt!269243)) (bvsge j!136 index!984)))))

(declare-fun b!593065 () Bool)

(declare-fun e!338725 () Bool)

(assert (=> b!593065 (= e!338718 e!338725)))

(declare-fun res!379669 () Bool)

(assert (=> b!593065 (=> (not res!379669) (not e!338725))))

(declare-fun lt!269250 () array!36931)

(declare-fun arrayContainsKey!0 (array!36931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!593065 (= res!379669 (arrayContainsKey!0 lt!269250 (select (arr!17734 a!2986) j!136) j!136))))

(declare-fun b!593066 () Bool)

(assert (=> b!593066 (= e!338727 e!338723)))

(declare-fun res!379671 () Bool)

(assert (=> b!593066 (=> (not res!379671) (not e!338723))))

(assert (=> b!593066 (= res!379671 (= (select (store (arr!17734 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593066 (= lt!269250 (array!36932 (store (arr!17734 a!2986) i!1108 k0!1786) (size!18098 a!2986)))))

(declare-fun b!593067 () Bool)

(declare-fun e!338721 () Bool)

(declare-fun e!338726 () Bool)

(assert (=> b!593067 (= e!338721 e!338726)))

(declare-fun res!379666 () Bool)

(assert (=> b!593067 (=> res!379666 e!338726)))

(assert (=> b!593067 (= res!379666 (or (not (= (select (arr!17734 a!2986) j!136) lt!269247)) (not (= (select (arr!17734 a!2986) j!136) lt!269243)) (bvsge j!136 index!984)))))

(assert (=> b!593067 e!338724))

(declare-fun res!379657 () Bool)

(assert (=> b!593067 (=> (not res!379657) (not e!338724))))

(assert (=> b!593067 (= res!379657 (= lt!269243 (select (arr!17734 a!2986) j!136)))))

(assert (=> b!593067 (= lt!269243 (select (store (arr!17734 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!593068 () Bool)

(assert (=> b!593068 (= e!338719 (not e!338721))))

(declare-fun res!379665 () Bool)

(assert (=> b!593068 (=> res!379665 e!338721)))

(declare-fun lt!269249 () SeekEntryResult!6174)

(assert (=> b!593068 (= res!379665 (not (= lt!269249 (Found!6174 index!984))))))

(declare-fun lt!269246 () Unit!18614)

(assert (=> b!593068 (= lt!269246 e!338722)))

(declare-fun c!67067 () Bool)

(assert (=> b!593068 (= c!67067 (= lt!269249 Undefined!6174))))

(assert (=> b!593068 (= lt!269249 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269247 lt!269250 mask!3053))))

(assert (=> b!593068 e!338717))

(declare-fun res!379670 () Bool)

(assert (=> b!593068 (=> (not res!379670) (not e!338717))))

(declare-fun lt!269248 () (_ BitVec 32))

(assert (=> b!593068 (= res!379670 (= lt!269245 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269248 vacantSpotIndex!68 lt!269247 lt!269250 mask!3053)))))

(assert (=> b!593068 (= lt!269245 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269248 vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!593068 (= lt!269247 (select (store (arr!17734 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269251 () Unit!18614)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36931 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18614)

(assert (=> b!593068 (= lt!269251 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269248 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!593068 (= lt!269248 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!593069 () Bool)

(assert (=> b!593069 (= e!338725 (arrayContainsKey!0 lt!269250 (select (arr!17734 a!2986) j!136) index!984))))

(declare-fun b!593070 () Bool)

(declare-fun Unit!18617 () Unit!18614)

(assert (=> b!593070 (= e!338722 Unit!18617)))

(assert (=> b!593070 false))

(declare-fun b!593071 () Bool)

(declare-fun res!379672 () Bool)

(assert (=> b!593071 (=> (not res!379672) (not e!338720))))

(assert (=> b!593071 (= res!379672 (validKeyInArray!0 (select (arr!17734 a!2986) j!136)))))

(declare-fun b!593072 () Bool)

(declare-fun res!379660 () Bool)

(assert (=> b!593072 (=> (not res!379660) (not e!338720))))

(assert (=> b!593072 (= res!379660 (and (= (size!18098 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18098 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18098 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!593073 () Bool)

(declare-fun res!379662 () Bool)

(assert (=> b!593073 (=> (not res!379662) (not e!338727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36931 (_ BitVec 32)) Bool)

(assert (=> b!593073 (= res!379662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!593074 () Bool)

(declare-fun res!379659 () Bool)

(assert (=> b!593074 (=> (not res!379659) (not e!338720))))

(assert (=> b!593074 (= res!379659 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!593075 () Bool)

(assert (=> b!593075 (= e!338726 (or (bvsgt #b00000000000000000000000000000000 (size!18098 a!2986)) (bvslt (size!18098 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!593075 (arrayContainsKey!0 lt!269250 (select (arr!17734 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269244 () Unit!18614)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36931 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18614)

(assert (=> b!593075 (= lt!269244 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269250 (select (arr!17734 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54264 res!379667) b!593072))

(assert (= (and b!593072 res!379660) b!593071))

(assert (= (and b!593071 res!379672) b!593059))

(assert (= (and b!593059 res!379658) b!593074))

(assert (= (and b!593074 res!379659) b!593062))

(assert (= (and b!593062 res!379673) b!593073))

(assert (= (and b!593073 res!379662) b!593057))

(assert (= (and b!593057 res!379668) b!593063))

(assert (= (and b!593063 res!379663) b!593066))

(assert (= (and b!593066 res!379671) b!593060))

(assert (= (and b!593060 res!379664) b!593068))

(assert (= (and b!593068 res!379670) b!593058))

(assert (= (and b!593068 c!67067) b!593070))

(assert (= (and b!593068 (not c!67067)) b!593061))

(assert (= (and b!593068 (not res!379665)) b!593067))

(assert (= (and b!593067 res!379657) b!593064))

(assert (= (and b!593064 (not res!379661)) b!593065))

(assert (= (and b!593065 res!379669) b!593069))

(assert (= (and b!593067 (not res!379666)) b!593075))

(declare-fun m!571083 () Bool)

(assert (=> b!593073 m!571083))

(declare-fun m!571085 () Bool)

(assert (=> b!593065 m!571085))

(assert (=> b!593065 m!571085))

(declare-fun m!571087 () Bool)

(assert (=> b!593065 m!571087))

(declare-fun m!571089 () Bool)

(assert (=> b!593066 m!571089))

(declare-fun m!571091 () Bool)

(assert (=> b!593066 m!571091))

(assert (=> b!593071 m!571085))

(assert (=> b!593071 m!571085))

(declare-fun m!571093 () Bool)

(assert (=> b!593071 m!571093))

(declare-fun m!571095 () Bool)

(assert (=> b!593057 m!571095))

(declare-fun m!571097 () Bool)

(assert (=> start!54264 m!571097))

(declare-fun m!571099 () Bool)

(assert (=> start!54264 m!571099))

(declare-fun m!571101 () Bool)

(assert (=> b!593074 m!571101))

(declare-fun m!571103 () Bool)

(assert (=> b!593063 m!571103))

(declare-fun m!571105 () Bool)

(assert (=> b!593062 m!571105))

(assert (=> b!593064 m!571085))

(assert (=> b!593067 m!571085))

(assert (=> b!593067 m!571089))

(declare-fun m!571107 () Bool)

(assert (=> b!593067 m!571107))

(assert (=> b!593069 m!571085))

(assert (=> b!593069 m!571085))

(declare-fun m!571109 () Bool)

(assert (=> b!593069 m!571109))

(declare-fun m!571111 () Bool)

(assert (=> b!593060 m!571111))

(assert (=> b!593060 m!571085))

(assert (=> b!593060 m!571085))

(declare-fun m!571113 () Bool)

(assert (=> b!593060 m!571113))

(declare-fun m!571115 () Bool)

(assert (=> b!593059 m!571115))

(assert (=> b!593075 m!571085))

(assert (=> b!593075 m!571085))

(declare-fun m!571117 () Bool)

(assert (=> b!593075 m!571117))

(assert (=> b!593075 m!571085))

(declare-fun m!571119 () Bool)

(assert (=> b!593075 m!571119))

(declare-fun m!571121 () Bool)

(assert (=> b!593068 m!571121))

(declare-fun m!571123 () Bool)

(assert (=> b!593068 m!571123))

(assert (=> b!593068 m!571085))

(assert (=> b!593068 m!571085))

(declare-fun m!571125 () Bool)

(assert (=> b!593068 m!571125))

(declare-fun m!571127 () Bool)

(assert (=> b!593068 m!571127))

(declare-fun m!571129 () Bool)

(assert (=> b!593068 m!571129))

(declare-fun m!571131 () Bool)

(assert (=> b!593068 m!571131))

(assert (=> b!593068 m!571089))

(check-sat (not b!593071) (not b!593068) (not b!593069) (not b!593057) (not b!593060) (not b!593059) (not b!593073) (not b!593062) (not b!593075) (not b!593074) (not b!593065) (not start!54264))
(check-sat)
(get-model)

(declare-fun d!86337 () Bool)

(declare-fun res!379729 () Bool)

(declare-fun e!338768 () Bool)

(assert (=> d!86337 (=> res!379729 e!338768)))

(assert (=> d!86337 (= res!379729 (= (select (arr!17734 lt!269250) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17734 a!2986) j!136)))))

(assert (=> d!86337 (= (arrayContainsKey!0 lt!269250 (select (arr!17734 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!338768)))

(declare-fun b!593137 () Bool)

(declare-fun e!338769 () Bool)

(assert (=> b!593137 (= e!338768 e!338769)))

(declare-fun res!379730 () Bool)

(assert (=> b!593137 (=> (not res!379730) (not e!338769))))

(assert (=> b!593137 (= res!379730 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18098 lt!269250)))))

(declare-fun b!593138 () Bool)

(assert (=> b!593138 (= e!338769 (arrayContainsKey!0 lt!269250 (select (arr!17734 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86337 (not res!379729)) b!593137))

(assert (= (and b!593137 res!379730) b!593138))

(declare-fun m!571183 () Bool)

(assert (=> d!86337 m!571183))

(assert (=> b!593138 m!571085))

(declare-fun m!571185 () Bool)

(assert (=> b!593138 m!571185))

(assert (=> b!593075 d!86337))

(declare-fun d!86339 () Bool)

(assert (=> d!86339 (arrayContainsKey!0 lt!269250 (select (arr!17734 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269287 () Unit!18614)

(declare-fun choose!114 (array!36931 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18614)

(assert (=> d!86339 (= lt!269287 (choose!114 lt!269250 (select (arr!17734 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86339 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86339 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269250 (select (arr!17734 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269287)))

(declare-fun bs!18301 () Bool)

(assert (= bs!18301 d!86339))

(assert (=> bs!18301 m!571085))

(assert (=> bs!18301 m!571117))

(assert (=> bs!18301 m!571085))

(declare-fun m!571187 () Bool)

(assert (=> bs!18301 m!571187))

(assert (=> b!593075 d!86339))

(declare-fun d!86341 () Bool)

(assert (=> d!86341 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54264 d!86341))

(declare-fun d!86343 () Bool)

(assert (=> d!86343 (= (array_inv!13530 a!2986) (bvsge (size!18098 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54264 d!86343))

(declare-fun d!86345 () Bool)

(declare-fun res!379731 () Bool)

(declare-fun e!338770 () Bool)

(assert (=> d!86345 (=> res!379731 e!338770)))

(assert (=> d!86345 (= res!379731 (= (select (arr!17734 lt!269250) j!136) (select (arr!17734 a!2986) j!136)))))

(assert (=> d!86345 (= (arrayContainsKey!0 lt!269250 (select (arr!17734 a!2986) j!136) j!136) e!338770)))

(declare-fun b!593139 () Bool)

(declare-fun e!338771 () Bool)

(assert (=> b!593139 (= e!338770 e!338771)))

(declare-fun res!379732 () Bool)

(assert (=> b!593139 (=> (not res!379732) (not e!338771))))

(assert (=> b!593139 (= res!379732 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18098 lt!269250)))))

(declare-fun b!593140 () Bool)

(assert (=> b!593140 (= e!338771 (arrayContainsKey!0 lt!269250 (select (arr!17734 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86345 (not res!379731)) b!593139))

(assert (= (and b!593139 res!379732) b!593140))

(declare-fun m!571189 () Bool)

(assert (=> d!86345 m!571189))

(assert (=> b!593140 m!571085))

(declare-fun m!571191 () Bool)

(assert (=> b!593140 m!571191))

(assert (=> b!593065 d!86345))

(declare-fun b!593151 () Bool)

(declare-fun e!338783 () Bool)

(declare-fun e!338780 () Bool)

(assert (=> b!593151 (= e!338783 e!338780)))

(declare-fun c!67073 () Bool)

(assert (=> b!593151 (= c!67073 (validKeyInArray!0 (select (arr!17734 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86347 () Bool)

(declare-fun res!379740 () Bool)

(declare-fun e!338781 () Bool)

(assert (=> d!86347 (=> res!379740 e!338781)))

(assert (=> d!86347 (= res!379740 (bvsge #b00000000000000000000000000000000 (size!18098 a!2986)))))

(assert (=> d!86347 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11772) e!338781)))

(declare-fun b!593152 () Bool)

(assert (=> b!593152 (= e!338781 e!338783)))

(declare-fun res!379739 () Bool)

(assert (=> b!593152 (=> (not res!379739) (not e!338783))))

(declare-fun e!338782 () Bool)

(assert (=> b!593152 (= res!379739 (not e!338782))))

(declare-fun res!379741 () Bool)

(assert (=> b!593152 (=> (not res!379741) (not e!338782))))

(assert (=> b!593152 (= res!379741 (validKeyInArray!0 (select (arr!17734 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32849 () Bool)

(declare-fun call!32852 () Bool)

(assert (=> bm!32849 (= call!32852 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67073 (Cons!11771 (select (arr!17734 a!2986) #b00000000000000000000000000000000) Nil!11772) Nil!11772)))))

(declare-fun b!593153 () Bool)

(declare-fun contains!2912 (List!11775 (_ BitVec 64)) Bool)

(assert (=> b!593153 (= e!338782 (contains!2912 Nil!11772 (select (arr!17734 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593154 () Bool)

(assert (=> b!593154 (= e!338780 call!32852)))

(declare-fun b!593155 () Bool)

(assert (=> b!593155 (= e!338780 call!32852)))

(assert (= (and d!86347 (not res!379740)) b!593152))

(assert (= (and b!593152 res!379741) b!593153))

(assert (= (and b!593152 res!379739) b!593151))

(assert (= (and b!593151 c!67073) b!593155))

(assert (= (and b!593151 (not c!67073)) b!593154))

(assert (= (or b!593155 b!593154) bm!32849))

(declare-fun m!571193 () Bool)

(assert (=> b!593151 m!571193))

(assert (=> b!593151 m!571193))

(declare-fun m!571195 () Bool)

(assert (=> b!593151 m!571195))

(assert (=> b!593152 m!571193))

(assert (=> b!593152 m!571193))

(assert (=> b!593152 m!571195))

(assert (=> bm!32849 m!571193))

(declare-fun m!571197 () Bool)

(assert (=> bm!32849 m!571197))

(assert (=> b!593153 m!571193))

(assert (=> b!593153 m!571193))

(declare-fun m!571199 () Bool)

(assert (=> b!593153 m!571199))

(assert (=> b!593057 d!86347))

(declare-fun d!86349 () Bool)

(declare-fun e!338786 () Bool)

(assert (=> d!86349 e!338786))

(declare-fun res!379744 () Bool)

(assert (=> d!86349 (=> (not res!379744) (not e!338786))))

(assert (=> d!86349 (= res!379744 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18098 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18098 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18098 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18098 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18098 a!2986))))))

(declare-fun lt!269290 () Unit!18614)

(declare-fun choose!9 (array!36931 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18614)

(assert (=> d!86349 (= lt!269290 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269248 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86349 (validMask!0 mask!3053)))

(assert (=> d!86349 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269248 vacantSpotIndex!68 mask!3053) lt!269290)))

(declare-fun b!593158 () Bool)

(assert (=> b!593158 (= e!338786 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269248 vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269248 vacantSpotIndex!68 (select (store (arr!17734 a!2986) i!1108 k0!1786) j!136) (array!36932 (store (arr!17734 a!2986) i!1108 k0!1786) (size!18098 a!2986)) mask!3053)))))

(assert (= (and d!86349 res!379744) b!593158))

(declare-fun m!571201 () Bool)

(assert (=> d!86349 m!571201))

(assert (=> d!86349 m!571097))

(assert (=> b!593158 m!571123))

(assert (=> b!593158 m!571123))

(declare-fun m!571203 () Bool)

(assert (=> b!593158 m!571203))

(assert (=> b!593158 m!571085))

(assert (=> b!593158 m!571125))

(assert (=> b!593158 m!571085))

(assert (=> b!593158 m!571089))

(assert (=> b!593068 d!86349))

(declare-fun b!593171 () Bool)

(declare-fun c!67081 () Bool)

(declare-fun lt!269296 () (_ BitVec 64))

(assert (=> b!593171 (= c!67081 (= lt!269296 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!338794 () SeekEntryResult!6174)

(declare-fun e!338795 () SeekEntryResult!6174)

(assert (=> b!593171 (= e!338794 e!338795)))

(declare-fun b!593172 () Bool)

(declare-fun e!338793 () SeekEntryResult!6174)

(assert (=> b!593172 (= e!338793 e!338794)))

(declare-fun c!67080 () Bool)

(assert (=> b!593172 (= c!67080 (= lt!269296 lt!269247))))

(declare-fun b!593173 () Bool)

(assert (=> b!593173 (= e!338794 (Found!6174 index!984))))

(declare-fun b!593174 () Bool)

(assert (=> b!593174 (= e!338793 Undefined!6174)))

(declare-fun lt!269295 () SeekEntryResult!6174)

(declare-fun d!86351 () Bool)

(get-info :version)

(assert (=> d!86351 (and (or ((_ is Undefined!6174) lt!269295) (not ((_ is Found!6174) lt!269295)) (and (bvsge (index!26936 lt!269295) #b00000000000000000000000000000000) (bvslt (index!26936 lt!269295) (size!18098 lt!269250)))) (or ((_ is Undefined!6174) lt!269295) ((_ is Found!6174) lt!269295) (not ((_ is MissingVacant!6174) lt!269295)) (not (= (index!26938 lt!269295) vacantSpotIndex!68)) (and (bvsge (index!26938 lt!269295) #b00000000000000000000000000000000) (bvslt (index!26938 lt!269295) (size!18098 lt!269250)))) (or ((_ is Undefined!6174) lt!269295) (ite ((_ is Found!6174) lt!269295) (= (select (arr!17734 lt!269250) (index!26936 lt!269295)) lt!269247) (and ((_ is MissingVacant!6174) lt!269295) (= (index!26938 lt!269295) vacantSpotIndex!68) (= (select (arr!17734 lt!269250) (index!26938 lt!269295)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86351 (= lt!269295 e!338793)))

(declare-fun c!67082 () Bool)

(assert (=> d!86351 (= c!67082 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86351 (= lt!269296 (select (arr!17734 lt!269250) index!984))))

(assert (=> d!86351 (validMask!0 mask!3053)))

(assert (=> d!86351 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269247 lt!269250 mask!3053) lt!269295)))

(declare-fun b!593175 () Bool)

(assert (=> b!593175 (= e!338795 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!269247 lt!269250 mask!3053))))

(declare-fun b!593176 () Bool)

(assert (=> b!593176 (= e!338795 (MissingVacant!6174 vacantSpotIndex!68))))

(assert (= (and d!86351 c!67082) b!593174))

(assert (= (and d!86351 (not c!67082)) b!593172))

(assert (= (and b!593172 c!67080) b!593173))

(assert (= (and b!593172 (not c!67080)) b!593171))

(assert (= (and b!593171 c!67081) b!593176))

(assert (= (and b!593171 (not c!67081)) b!593175))

(declare-fun m!571205 () Bool)

(assert (=> d!86351 m!571205))

(declare-fun m!571207 () Bool)

(assert (=> d!86351 m!571207))

(declare-fun m!571209 () Bool)

(assert (=> d!86351 m!571209))

(assert (=> d!86351 m!571097))

(assert (=> b!593175 m!571121))

(assert (=> b!593175 m!571121))

(declare-fun m!571211 () Bool)

(assert (=> b!593175 m!571211))

(assert (=> b!593068 d!86351))

(declare-fun b!593177 () Bool)

(declare-fun c!67084 () Bool)

(declare-fun lt!269298 () (_ BitVec 64))

(assert (=> b!593177 (= c!67084 (= lt!269298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!338797 () SeekEntryResult!6174)

(declare-fun e!338798 () SeekEntryResult!6174)

(assert (=> b!593177 (= e!338797 e!338798)))

(declare-fun b!593178 () Bool)

(declare-fun e!338796 () SeekEntryResult!6174)

(assert (=> b!593178 (= e!338796 e!338797)))

(declare-fun c!67083 () Bool)

(assert (=> b!593178 (= c!67083 (= lt!269298 lt!269247))))

(declare-fun b!593179 () Bool)

(assert (=> b!593179 (= e!338797 (Found!6174 lt!269248))))

(declare-fun b!593180 () Bool)

(assert (=> b!593180 (= e!338796 Undefined!6174)))

(declare-fun lt!269297 () SeekEntryResult!6174)

(declare-fun d!86355 () Bool)

(assert (=> d!86355 (and (or ((_ is Undefined!6174) lt!269297) (not ((_ is Found!6174) lt!269297)) (and (bvsge (index!26936 lt!269297) #b00000000000000000000000000000000) (bvslt (index!26936 lt!269297) (size!18098 lt!269250)))) (or ((_ is Undefined!6174) lt!269297) ((_ is Found!6174) lt!269297) (not ((_ is MissingVacant!6174) lt!269297)) (not (= (index!26938 lt!269297) vacantSpotIndex!68)) (and (bvsge (index!26938 lt!269297) #b00000000000000000000000000000000) (bvslt (index!26938 lt!269297) (size!18098 lt!269250)))) (or ((_ is Undefined!6174) lt!269297) (ite ((_ is Found!6174) lt!269297) (= (select (arr!17734 lt!269250) (index!26936 lt!269297)) lt!269247) (and ((_ is MissingVacant!6174) lt!269297) (= (index!26938 lt!269297) vacantSpotIndex!68) (= (select (arr!17734 lt!269250) (index!26938 lt!269297)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86355 (= lt!269297 e!338796)))

(declare-fun c!67085 () Bool)

(assert (=> d!86355 (= c!67085 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86355 (= lt!269298 (select (arr!17734 lt!269250) lt!269248))))

(assert (=> d!86355 (validMask!0 mask!3053)))

(assert (=> d!86355 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269248 vacantSpotIndex!68 lt!269247 lt!269250 mask!3053) lt!269297)))

(declare-fun b!593181 () Bool)

(assert (=> b!593181 (= e!338798 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269248 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!269247 lt!269250 mask!3053))))

(declare-fun b!593182 () Bool)

(assert (=> b!593182 (= e!338798 (MissingVacant!6174 vacantSpotIndex!68))))

(assert (= (and d!86355 c!67085) b!593180))

(assert (= (and d!86355 (not c!67085)) b!593178))

(assert (= (and b!593178 c!67083) b!593179))

(assert (= (and b!593178 (not c!67083)) b!593177))

(assert (= (and b!593177 c!67084) b!593182))

(assert (= (and b!593177 (not c!67084)) b!593181))

(declare-fun m!571213 () Bool)

(assert (=> d!86355 m!571213))

(declare-fun m!571215 () Bool)

(assert (=> d!86355 m!571215))

(declare-fun m!571217 () Bool)

(assert (=> d!86355 m!571217))

(assert (=> d!86355 m!571097))

(declare-fun m!571219 () Bool)

(assert (=> b!593181 m!571219))

(assert (=> b!593181 m!571219))

(declare-fun m!571221 () Bool)

(assert (=> b!593181 m!571221))

(assert (=> b!593068 d!86355))

(declare-fun b!593183 () Bool)

(declare-fun c!67087 () Bool)

(declare-fun lt!269300 () (_ BitVec 64))

(assert (=> b!593183 (= c!67087 (= lt!269300 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!338800 () SeekEntryResult!6174)

(declare-fun e!338801 () SeekEntryResult!6174)

(assert (=> b!593183 (= e!338800 e!338801)))

(declare-fun b!593184 () Bool)

(declare-fun e!338799 () SeekEntryResult!6174)

(assert (=> b!593184 (= e!338799 e!338800)))

(declare-fun c!67086 () Bool)

(assert (=> b!593184 (= c!67086 (= lt!269300 (select (arr!17734 a!2986) j!136)))))

(declare-fun b!593185 () Bool)

(assert (=> b!593185 (= e!338800 (Found!6174 lt!269248))))

(declare-fun b!593186 () Bool)

(assert (=> b!593186 (= e!338799 Undefined!6174)))

(declare-fun lt!269299 () SeekEntryResult!6174)

(declare-fun d!86357 () Bool)

(assert (=> d!86357 (and (or ((_ is Undefined!6174) lt!269299) (not ((_ is Found!6174) lt!269299)) (and (bvsge (index!26936 lt!269299) #b00000000000000000000000000000000) (bvslt (index!26936 lt!269299) (size!18098 a!2986)))) (or ((_ is Undefined!6174) lt!269299) ((_ is Found!6174) lt!269299) (not ((_ is MissingVacant!6174) lt!269299)) (not (= (index!26938 lt!269299) vacantSpotIndex!68)) (and (bvsge (index!26938 lt!269299) #b00000000000000000000000000000000) (bvslt (index!26938 lt!269299) (size!18098 a!2986)))) (or ((_ is Undefined!6174) lt!269299) (ite ((_ is Found!6174) lt!269299) (= (select (arr!17734 a!2986) (index!26936 lt!269299)) (select (arr!17734 a!2986) j!136)) (and ((_ is MissingVacant!6174) lt!269299) (= (index!26938 lt!269299) vacantSpotIndex!68) (= (select (arr!17734 a!2986) (index!26938 lt!269299)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86357 (= lt!269299 e!338799)))

(declare-fun c!67088 () Bool)

(assert (=> d!86357 (= c!67088 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86357 (= lt!269300 (select (arr!17734 a!2986) lt!269248))))

(assert (=> d!86357 (validMask!0 mask!3053)))

(assert (=> d!86357 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269248 vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053) lt!269299)))

(declare-fun b!593187 () Bool)

(assert (=> b!593187 (= e!338801 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!269248 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593188 () Bool)

(assert (=> b!593188 (= e!338801 (MissingVacant!6174 vacantSpotIndex!68))))

(assert (= (and d!86357 c!67088) b!593186))

(assert (= (and d!86357 (not c!67088)) b!593184))

(assert (= (and b!593184 c!67086) b!593185))

(assert (= (and b!593184 (not c!67086)) b!593183))

(assert (= (and b!593183 c!67087) b!593188))

(assert (= (and b!593183 (not c!67087)) b!593187))

(declare-fun m!571223 () Bool)

(assert (=> d!86357 m!571223))

(declare-fun m!571225 () Bool)

(assert (=> d!86357 m!571225))

(declare-fun m!571227 () Bool)

(assert (=> d!86357 m!571227))

(assert (=> d!86357 m!571097))

(assert (=> b!593187 m!571219))

(assert (=> b!593187 m!571219))

(assert (=> b!593187 m!571085))

(declare-fun m!571229 () Bool)

(assert (=> b!593187 m!571229))

(assert (=> b!593068 d!86357))

(declare-fun d!86359 () Bool)

(declare-fun lt!269303 () (_ BitVec 32))

(assert (=> d!86359 (and (bvsge lt!269303 #b00000000000000000000000000000000) (bvslt lt!269303 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86359 (= lt!269303 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86359 (validMask!0 mask!3053)))

(assert (=> d!86359 (= (nextIndex!0 index!984 x!910 mask!3053) lt!269303)))

(declare-fun bs!18302 () Bool)

(assert (= bs!18302 d!86359))

(declare-fun m!571231 () Bool)

(assert (=> bs!18302 m!571231))

(assert (=> bs!18302 m!571097))

(assert (=> b!593068 d!86359))

(declare-fun d!86363 () Bool)

(assert (=> d!86363 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593059 d!86363))

(declare-fun d!86365 () Bool)

(declare-fun res!379747 () Bool)

(declare-fun e!338804 () Bool)

(assert (=> d!86365 (=> res!379747 e!338804)))

(assert (=> d!86365 (= res!379747 (= (select (arr!17734 lt!269250) index!984) (select (arr!17734 a!2986) j!136)))))

(assert (=> d!86365 (= (arrayContainsKey!0 lt!269250 (select (arr!17734 a!2986) j!136) index!984) e!338804)))

(declare-fun b!593191 () Bool)

(declare-fun e!338805 () Bool)

(assert (=> b!593191 (= e!338804 e!338805)))

(declare-fun res!379748 () Bool)

(assert (=> b!593191 (=> (not res!379748) (not e!338805))))

(assert (=> b!593191 (= res!379748 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18098 lt!269250)))))

(declare-fun b!593192 () Bool)

(assert (=> b!593192 (= e!338805 (arrayContainsKey!0 lt!269250 (select (arr!17734 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86365 (not res!379747)) b!593191))

(assert (= (and b!593191 res!379748) b!593192))

(assert (=> d!86365 m!571209))

(assert (=> b!593192 m!571085))

(declare-fun m!571233 () Bool)

(assert (=> b!593192 m!571233))

(assert (=> b!593069 d!86365))

(declare-fun d!86367 () Bool)

(assert (=> d!86367 (= (validKeyInArray!0 (select (arr!17734 a!2986) j!136)) (and (not (= (select (arr!17734 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17734 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!593071 d!86367))

(declare-fun b!593195 () Bool)

(declare-fun c!67090 () Bool)

(declare-fun lt!269305 () (_ BitVec 64))

(assert (=> b!593195 (= c!67090 (= lt!269305 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!338809 () SeekEntryResult!6174)

(declare-fun e!338810 () SeekEntryResult!6174)

(assert (=> b!593195 (= e!338809 e!338810)))

(declare-fun b!593196 () Bool)

(declare-fun e!338808 () SeekEntryResult!6174)

(assert (=> b!593196 (= e!338808 e!338809)))

(declare-fun c!67089 () Bool)

(assert (=> b!593196 (= c!67089 (= lt!269305 (select (arr!17734 a!2986) j!136)))))

(declare-fun b!593197 () Bool)

(assert (=> b!593197 (= e!338809 (Found!6174 index!984))))

(declare-fun b!593198 () Bool)

(assert (=> b!593198 (= e!338808 Undefined!6174)))

(declare-fun d!86369 () Bool)

(declare-fun lt!269304 () SeekEntryResult!6174)

(assert (=> d!86369 (and (or ((_ is Undefined!6174) lt!269304) (not ((_ is Found!6174) lt!269304)) (and (bvsge (index!26936 lt!269304) #b00000000000000000000000000000000) (bvslt (index!26936 lt!269304) (size!18098 a!2986)))) (or ((_ is Undefined!6174) lt!269304) ((_ is Found!6174) lt!269304) (not ((_ is MissingVacant!6174) lt!269304)) (not (= (index!26938 lt!269304) vacantSpotIndex!68)) (and (bvsge (index!26938 lt!269304) #b00000000000000000000000000000000) (bvslt (index!26938 lt!269304) (size!18098 a!2986)))) (or ((_ is Undefined!6174) lt!269304) (ite ((_ is Found!6174) lt!269304) (= (select (arr!17734 a!2986) (index!26936 lt!269304)) (select (arr!17734 a!2986) j!136)) (and ((_ is MissingVacant!6174) lt!269304) (= (index!26938 lt!269304) vacantSpotIndex!68) (= (select (arr!17734 a!2986) (index!26938 lt!269304)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86369 (= lt!269304 e!338808)))

(declare-fun c!67091 () Bool)

(assert (=> d!86369 (= c!67091 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86369 (= lt!269305 (select (arr!17734 a!2986) index!984))))

(assert (=> d!86369 (validMask!0 mask!3053)))

(assert (=> d!86369 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053) lt!269304)))

(declare-fun b!593199 () Bool)

(assert (=> b!593199 (= e!338810 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17734 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593200 () Bool)

(assert (=> b!593200 (= e!338810 (MissingVacant!6174 vacantSpotIndex!68))))

(assert (= (and d!86369 c!67091) b!593198))

(assert (= (and d!86369 (not c!67091)) b!593196))

(assert (= (and b!593196 c!67089) b!593197))

(assert (= (and b!593196 (not c!67089)) b!593195))

(assert (= (and b!593195 c!67090) b!593200))

(assert (= (and b!593195 (not c!67090)) b!593199))

(declare-fun m!571235 () Bool)

(assert (=> d!86369 m!571235))

(declare-fun m!571237 () Bool)

(assert (=> d!86369 m!571237))

(assert (=> d!86369 m!571111))

(assert (=> d!86369 m!571097))

(assert (=> b!593199 m!571121))

(assert (=> b!593199 m!571121))

(assert (=> b!593199 m!571085))

(declare-fun m!571241 () Bool)

(assert (=> b!593199 m!571241))

(assert (=> b!593060 d!86369))

(declare-fun lt!269322 () SeekEntryResult!6174)

(declare-fun b!593235 () Bool)

(declare-fun e!338835 () SeekEntryResult!6174)

(assert (=> b!593235 (= e!338835 (seekKeyOrZeroReturnVacant!0 (x!55727 lt!269322) (index!26937 lt!269322) (index!26937 lt!269322) k0!1786 a!2986 mask!3053))))

(declare-fun b!593236 () Bool)

(declare-fun e!338833 () SeekEntryResult!6174)

(declare-fun e!338834 () SeekEntryResult!6174)

(assert (=> b!593236 (= e!338833 e!338834)))

(declare-fun lt!269323 () (_ BitVec 64))

(assert (=> b!593236 (= lt!269323 (select (arr!17734 a!2986) (index!26937 lt!269322)))))

(declare-fun c!67104 () Bool)

(assert (=> b!593236 (= c!67104 (= lt!269323 k0!1786))))

(declare-fun b!593237 () Bool)

(assert (=> b!593237 (= e!338834 (Found!6174 (index!26937 lt!269322)))))

(declare-fun b!593238 () Bool)

(declare-fun c!67106 () Bool)

(assert (=> b!593238 (= c!67106 (= lt!269323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593238 (= e!338834 e!338835)))

(declare-fun d!86371 () Bool)

(declare-fun lt!269321 () SeekEntryResult!6174)

(assert (=> d!86371 (and (or ((_ is Undefined!6174) lt!269321) (not ((_ is Found!6174) lt!269321)) (and (bvsge (index!26936 lt!269321) #b00000000000000000000000000000000) (bvslt (index!26936 lt!269321) (size!18098 a!2986)))) (or ((_ is Undefined!6174) lt!269321) ((_ is Found!6174) lt!269321) (not ((_ is MissingZero!6174) lt!269321)) (and (bvsge (index!26935 lt!269321) #b00000000000000000000000000000000) (bvslt (index!26935 lt!269321) (size!18098 a!2986)))) (or ((_ is Undefined!6174) lt!269321) ((_ is Found!6174) lt!269321) ((_ is MissingZero!6174) lt!269321) (not ((_ is MissingVacant!6174) lt!269321)) (and (bvsge (index!26938 lt!269321) #b00000000000000000000000000000000) (bvslt (index!26938 lt!269321) (size!18098 a!2986)))) (or ((_ is Undefined!6174) lt!269321) (ite ((_ is Found!6174) lt!269321) (= (select (arr!17734 a!2986) (index!26936 lt!269321)) k0!1786) (ite ((_ is MissingZero!6174) lt!269321) (= (select (arr!17734 a!2986) (index!26935 lt!269321)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6174) lt!269321) (= (select (arr!17734 a!2986) (index!26938 lt!269321)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86371 (= lt!269321 e!338833)))

(declare-fun c!67105 () Bool)

(assert (=> d!86371 (= c!67105 (and ((_ is Intermediate!6174) lt!269322) (undefined!6986 lt!269322)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36931 (_ BitVec 32)) SeekEntryResult!6174)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86371 (= lt!269322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86371 (validMask!0 mask!3053)))

(assert (=> d!86371 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!269321)))

(declare-fun b!593239 () Bool)

(assert (=> b!593239 (= e!338835 (MissingZero!6174 (index!26937 lt!269322)))))

(declare-fun b!593240 () Bool)

(assert (=> b!593240 (= e!338833 Undefined!6174)))

(assert (= (and d!86371 c!67105) b!593240))

(assert (= (and d!86371 (not c!67105)) b!593236))

(assert (= (and b!593236 c!67104) b!593237))

(assert (= (and b!593236 (not c!67104)) b!593238))

(assert (= (and b!593238 c!67106) b!593239))

(assert (= (and b!593238 (not c!67106)) b!593235))

(declare-fun m!571255 () Bool)

(assert (=> b!593235 m!571255))

(declare-fun m!571257 () Bool)

(assert (=> b!593236 m!571257))

(declare-fun m!571259 () Bool)

(assert (=> d!86371 m!571259))

(declare-fun m!571261 () Bool)

(assert (=> d!86371 m!571261))

(assert (=> d!86371 m!571097))

(assert (=> d!86371 m!571259))

(declare-fun m!571263 () Bool)

(assert (=> d!86371 m!571263))

(declare-fun m!571265 () Bool)

(assert (=> d!86371 m!571265))

(declare-fun m!571267 () Bool)

(assert (=> d!86371 m!571267))

(assert (=> b!593062 d!86371))

(declare-fun d!86387 () Bool)

(declare-fun res!379761 () Bool)

(declare-fun e!338836 () Bool)

(assert (=> d!86387 (=> res!379761 e!338836)))

(assert (=> d!86387 (= res!379761 (= (select (arr!17734 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86387 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!338836)))

(declare-fun b!593241 () Bool)

(declare-fun e!338837 () Bool)

(assert (=> b!593241 (= e!338836 e!338837)))

(declare-fun res!379762 () Bool)

(assert (=> b!593241 (=> (not res!379762) (not e!338837))))

(assert (=> b!593241 (= res!379762 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18098 a!2986)))))

(declare-fun b!593242 () Bool)

(assert (=> b!593242 (= e!338837 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86387 (not res!379761)) b!593241))

(assert (= (and b!593241 res!379762) b!593242))

(assert (=> d!86387 m!571193))

(declare-fun m!571269 () Bool)

(assert (=> b!593242 m!571269))

(assert (=> b!593074 d!86387))

(declare-fun b!593271 () Bool)

(declare-fun e!338859 () Bool)

(declare-fun e!338860 () Bool)

(assert (=> b!593271 (= e!338859 e!338860)))

(declare-fun lt!269344 () (_ BitVec 64))

(assert (=> b!593271 (= lt!269344 (select (arr!17734 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!269343 () Unit!18614)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36931 (_ BitVec 64) (_ BitVec 32)) Unit!18614)

(assert (=> b!593271 (= lt!269343 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!269344 #b00000000000000000000000000000000))))

(assert (=> b!593271 (arrayContainsKey!0 a!2986 lt!269344 #b00000000000000000000000000000000)))

(declare-fun lt!269342 () Unit!18614)

(assert (=> b!593271 (= lt!269342 lt!269343)))

(declare-fun res!379776 () Bool)

(assert (=> b!593271 (= res!379776 (= (seekEntryOrOpen!0 (select (arr!17734 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6174 #b00000000000000000000000000000000)))))

(assert (=> b!593271 (=> (not res!379776) (not e!338860))))

(declare-fun b!593272 () Bool)

(declare-fun call!32858 () Bool)

(assert (=> b!593272 (= e!338860 call!32858)))

(declare-fun b!593273 () Bool)

(declare-fun e!338858 () Bool)

(assert (=> b!593273 (= e!338858 e!338859)))

(declare-fun c!67115 () Bool)

(assert (=> b!593273 (= c!67115 (validKeyInArray!0 (select (arr!17734 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86389 () Bool)

(declare-fun res!379775 () Bool)

(assert (=> d!86389 (=> res!379775 e!338858)))

(assert (=> d!86389 (= res!379775 (bvsge #b00000000000000000000000000000000 (size!18098 a!2986)))))

(assert (=> d!86389 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!338858)))

(declare-fun bm!32855 () Bool)

(assert (=> bm!32855 (= call!32858 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!593274 () Bool)

(assert (=> b!593274 (= e!338859 call!32858)))

(assert (= (and d!86389 (not res!379775)) b!593273))

(assert (= (and b!593273 c!67115) b!593271))

(assert (= (and b!593273 (not c!67115)) b!593274))

(assert (= (and b!593271 res!379776) b!593272))

(assert (= (or b!593272 b!593274) bm!32855))

(assert (=> b!593271 m!571193))

(declare-fun m!571299 () Bool)

(assert (=> b!593271 m!571299))

(declare-fun m!571301 () Bool)

(assert (=> b!593271 m!571301))

(assert (=> b!593271 m!571193))

(declare-fun m!571303 () Bool)

(assert (=> b!593271 m!571303))

(assert (=> b!593273 m!571193))

(assert (=> b!593273 m!571193))

(assert (=> b!593273 m!571195))

(declare-fun m!571305 () Bool)

(assert (=> bm!32855 m!571305))

(assert (=> b!593073 d!86389))

(check-sat (not d!86369) (not d!86339) (not b!593199) (not b!593140) (not b!593192) (not b!593187) (not b!593158) (not d!86351) (not d!86371) (not b!593235) (not d!86359) (not d!86357) (not b!593153) (not b!593175) (not b!593138) (not b!593181) (not b!593242) (not b!593152) (not b!593273) (not b!593271) (not b!593151) (not bm!32855) (not bm!32849) (not d!86349) (not d!86355))
(check-sat)
