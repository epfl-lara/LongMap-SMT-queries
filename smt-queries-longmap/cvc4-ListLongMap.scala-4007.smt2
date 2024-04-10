; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54518 () Bool)

(assert start!54518)

(declare-fun res!381146 () Bool)

(declare-fun e!340099 () Bool)

(assert (=> start!54518 (=> (not res!381146) (not e!340099))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54518 (= res!381146 (validMask!0 mask!3053))))

(assert (=> start!54518 e!340099))

(assert (=> start!54518 true))

(declare-datatypes ((array!36978 0))(
  ( (array!36979 (arr!17753 (Array (_ BitVec 32) (_ BitVec 64))) (size!18117 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36978)

(declare-fun array_inv!13549 (array!36978) Bool)

(assert (=> start!54518 (array_inv!13549 a!2986)))

(declare-fun b!595240 () Bool)

(declare-fun res!381148 () Bool)

(declare-fun e!340090 () Bool)

(assert (=> b!595240 (=> res!381148 e!340090)))

(declare-datatypes ((List!11794 0))(
  ( (Nil!11791) (Cons!11790 (h!12835 (_ BitVec 64)) (t!18022 List!11794)) )
))
(declare-fun contains!2929 (List!11794 (_ BitVec 64)) Bool)

(assert (=> b!595240 (= res!381148 (contains!2929 Nil!11791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595241 () Bool)

(declare-fun res!381134 () Bool)

(declare-fun e!340094 () Bool)

(assert (=> b!595241 (=> (not res!381134) (not e!340094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36978 (_ BitVec 32)) Bool)

(assert (=> b!595241 (= res!381134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595242 () Bool)

(declare-fun res!381140 () Bool)

(assert (=> b!595242 (=> (not res!381140) (not e!340099))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595242 (= res!381140 (validKeyInArray!0 (select (arr!17753 a!2986) j!136)))))

(declare-fun b!595243 () Bool)

(declare-datatypes ((Unit!18690 0))(
  ( (Unit!18691) )
))
(declare-fun e!340096 () Unit!18690)

(declare-fun Unit!18692 () Unit!18690)

(assert (=> b!595243 (= e!340096 Unit!18692)))

(assert (=> b!595243 false))

(declare-fun b!595244 () Bool)

(declare-fun res!381132 () Bool)

(assert (=> b!595244 (=> (not res!381132) (not e!340099))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!595244 (= res!381132 (validKeyInArray!0 k!1786))))

(declare-fun b!595245 () Bool)

(assert (=> b!595245 (= e!340099 e!340094)))

(declare-fun res!381135 () Bool)

(assert (=> b!595245 (=> (not res!381135) (not e!340094))))

(declare-datatypes ((SeekEntryResult!6193 0))(
  ( (MissingZero!6193 (index!27020 (_ BitVec 32))) (Found!6193 (index!27021 (_ BitVec 32))) (Intermediate!6193 (undefined!7005 Bool) (index!27022 (_ BitVec 32)) (x!55821 (_ BitVec 32))) (Undefined!6193) (MissingVacant!6193 (index!27023 (_ BitVec 32))) )
))
(declare-fun lt!270271 () SeekEntryResult!6193)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!595245 (= res!381135 (or (= lt!270271 (MissingZero!6193 i!1108)) (= lt!270271 (MissingVacant!6193 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36978 (_ BitVec 32)) SeekEntryResult!6193)

(assert (=> b!595245 (= lt!270271 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!595246 () Bool)

(declare-fun e!340093 () Bool)

(assert (=> b!595246 (= e!340093 e!340090)))

(declare-fun res!381149 () Bool)

(assert (=> b!595246 (=> res!381149 e!340090)))

(assert (=> b!595246 (= res!381149 (or (bvsge (size!18117 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18117 a!2986))))))

(declare-fun lt!270269 () array!36978)

(declare-fun arrayContainsKey!0 (array!36978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595246 (arrayContainsKey!0 lt!270269 (select (arr!17753 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270267 () Unit!18690)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36978 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18690)

(assert (=> b!595246 (= lt!270267 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270269 (select (arr!17753 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595247 () Bool)

(declare-fun e!340098 () Bool)

(declare-fun e!340101 () Bool)

(assert (=> b!595247 (= e!340098 e!340101)))

(declare-fun res!381139 () Bool)

(assert (=> b!595247 (=> (not res!381139) (not e!340101))))

(assert (=> b!595247 (= res!381139 (arrayContainsKey!0 lt!270269 (select (arr!17753 a!2986) j!136) j!136))))

(declare-fun b!595248 () Bool)

(declare-fun e!340092 () Bool)

(declare-fun e!340089 () Bool)

(assert (=> b!595248 (= e!340092 e!340089)))

(declare-fun res!381142 () Bool)

(assert (=> b!595248 (=> (not res!381142) (not e!340089))))

(declare-fun lt!270268 () SeekEntryResult!6193)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!595248 (= res!381142 (and (= lt!270268 (Found!6193 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17753 a!2986) index!984) (select (arr!17753 a!2986) j!136))) (not (= (select (arr!17753 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36978 (_ BitVec 32)) SeekEntryResult!6193)

(assert (=> b!595248 (= lt!270268 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17753 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595249 () Bool)

(assert (=> b!595249 (= e!340101 (arrayContainsKey!0 lt!270269 (select (arr!17753 a!2986) j!136) index!984))))

(declare-fun b!595250 () Bool)

(assert (=> b!595250 (= e!340094 e!340092)))

(declare-fun res!381144 () Bool)

(assert (=> b!595250 (=> (not res!381144) (not e!340092))))

(assert (=> b!595250 (= res!381144 (= (select (store (arr!17753 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595250 (= lt!270269 (array!36979 (store (arr!17753 a!2986) i!1108 k!1786) (size!18117 a!2986)))))

(declare-fun b!595251 () Bool)

(declare-fun Unit!18693 () Unit!18690)

(assert (=> b!595251 (= e!340096 Unit!18693)))

(declare-fun b!595252 () Bool)

(declare-fun res!381137 () Bool)

(assert (=> b!595252 (=> (not res!381137) (not e!340094))))

(assert (=> b!595252 (= res!381137 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17753 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595253 () Bool)

(declare-fun e!340095 () Bool)

(assert (=> b!595253 (= e!340089 (not e!340095))))

(declare-fun res!381145 () Bool)

(assert (=> b!595253 (=> res!381145 e!340095)))

(declare-fun lt!270276 () SeekEntryResult!6193)

(assert (=> b!595253 (= res!381145 (not (= lt!270276 (Found!6193 index!984))))))

(declare-fun lt!270270 () Unit!18690)

(assert (=> b!595253 (= lt!270270 e!340096)))

(declare-fun c!67421 () Bool)

(assert (=> b!595253 (= c!67421 (= lt!270276 Undefined!6193))))

(declare-fun lt!270277 () (_ BitVec 64))

(assert (=> b!595253 (= lt!270276 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270277 lt!270269 mask!3053))))

(declare-fun e!340100 () Bool)

(assert (=> b!595253 e!340100))

(declare-fun res!381138 () Bool)

(assert (=> b!595253 (=> (not res!381138) (not e!340100))))

(declare-fun lt!270273 () SeekEntryResult!6193)

(declare-fun lt!270272 () (_ BitVec 32))

(assert (=> b!595253 (= res!381138 (= lt!270273 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270272 vacantSpotIndex!68 lt!270277 lt!270269 mask!3053)))))

(assert (=> b!595253 (= lt!270273 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270272 vacantSpotIndex!68 (select (arr!17753 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595253 (= lt!270277 (select (store (arr!17753 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270274 () Unit!18690)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36978 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18690)

(assert (=> b!595253 (= lt!270274 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270272 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595253 (= lt!270272 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595254 () Bool)

(assert (=> b!595254 (= e!340090 true)))

(declare-fun lt!270275 () Bool)

(assert (=> b!595254 (= lt!270275 (contains!2929 Nil!11791 k!1786))))

(declare-fun b!595255 () Bool)

(declare-fun res!381136 () Bool)

(assert (=> b!595255 (=> (not res!381136) (not e!340099))))

(assert (=> b!595255 (= res!381136 (and (= (size!18117 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18117 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18117 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595256 () Bool)

(declare-fun res!381141 () Bool)

(assert (=> b!595256 (=> (not res!381141) (not e!340094))))

(declare-fun arrayNoDuplicates!0 (array!36978 (_ BitVec 32) List!11794) Bool)

(assert (=> b!595256 (= res!381141 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11791))))

(declare-fun b!595257 () Bool)

(declare-fun res!381143 () Bool)

(assert (=> b!595257 (=> res!381143 e!340090)))

(assert (=> b!595257 (= res!381143 (contains!2929 Nil!11791 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595258 () Bool)

(assert (=> b!595258 (= e!340100 (= lt!270268 lt!270273))))

(declare-fun b!595259 () Bool)

(assert (=> b!595259 (= e!340095 e!340093)))

(declare-fun res!381151 () Bool)

(assert (=> b!595259 (=> res!381151 e!340093)))

(declare-fun lt!270266 () (_ BitVec 64))

(assert (=> b!595259 (= res!381151 (or (not (= (select (arr!17753 a!2986) j!136) lt!270277)) (not (= (select (arr!17753 a!2986) j!136) lt!270266)) (bvsge j!136 index!984)))))

(declare-fun e!340091 () Bool)

(assert (=> b!595259 e!340091))

(declare-fun res!381147 () Bool)

(assert (=> b!595259 (=> (not res!381147) (not e!340091))))

(assert (=> b!595259 (= res!381147 (= lt!270266 (select (arr!17753 a!2986) j!136)))))

(assert (=> b!595259 (= lt!270266 (select (store (arr!17753 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!595260 () Bool)

(declare-fun res!381133 () Bool)

(assert (=> b!595260 (=> res!381133 e!340090)))

(declare-fun noDuplicate!248 (List!11794) Bool)

(assert (=> b!595260 (= res!381133 (not (noDuplicate!248 Nil!11791)))))

(declare-fun b!595261 () Bool)

(assert (=> b!595261 (= e!340091 e!340098)))

(declare-fun res!381150 () Bool)

(assert (=> b!595261 (=> res!381150 e!340098)))

(assert (=> b!595261 (= res!381150 (or (not (= (select (arr!17753 a!2986) j!136) lt!270277)) (not (= (select (arr!17753 a!2986) j!136) lt!270266)) (bvsge j!136 index!984)))))

(declare-fun b!595262 () Bool)

(declare-fun res!381152 () Bool)

(assert (=> b!595262 (=> (not res!381152) (not e!340099))))

(assert (=> b!595262 (= res!381152 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!54518 res!381146) b!595255))

(assert (= (and b!595255 res!381136) b!595242))

(assert (= (and b!595242 res!381140) b!595244))

(assert (= (and b!595244 res!381132) b!595262))

(assert (= (and b!595262 res!381152) b!595245))

(assert (= (and b!595245 res!381135) b!595241))

(assert (= (and b!595241 res!381134) b!595256))

(assert (= (and b!595256 res!381141) b!595252))

(assert (= (and b!595252 res!381137) b!595250))

(assert (= (and b!595250 res!381144) b!595248))

(assert (= (and b!595248 res!381142) b!595253))

(assert (= (and b!595253 res!381138) b!595258))

(assert (= (and b!595253 c!67421) b!595243))

(assert (= (and b!595253 (not c!67421)) b!595251))

(assert (= (and b!595253 (not res!381145)) b!595259))

(assert (= (and b!595259 res!381147) b!595261))

(assert (= (and b!595261 (not res!381150)) b!595247))

(assert (= (and b!595247 res!381139) b!595249))

(assert (= (and b!595259 (not res!381151)) b!595246))

(assert (= (and b!595246 (not res!381149)) b!595260))

(assert (= (and b!595260 (not res!381133)) b!595240))

(assert (= (and b!595240 (not res!381148)) b!595257))

(assert (= (and b!595257 (not res!381143)) b!595254))

(declare-fun m!572923 () Bool)

(assert (=> b!595247 m!572923))

(assert (=> b!595247 m!572923))

(declare-fun m!572925 () Bool)

(assert (=> b!595247 m!572925))

(declare-fun m!572927 () Bool)

(assert (=> b!595253 m!572927))

(assert (=> b!595253 m!572923))

(declare-fun m!572929 () Bool)

(assert (=> b!595253 m!572929))

(declare-fun m!572931 () Bool)

(assert (=> b!595253 m!572931))

(declare-fun m!572933 () Bool)

(assert (=> b!595253 m!572933))

(declare-fun m!572935 () Bool)

(assert (=> b!595253 m!572935))

(assert (=> b!595253 m!572923))

(declare-fun m!572937 () Bool)

(assert (=> b!595253 m!572937))

(declare-fun m!572939 () Bool)

(assert (=> b!595253 m!572939))

(declare-fun m!572941 () Bool)

(assert (=> b!595245 m!572941))

(assert (=> b!595242 m!572923))

(assert (=> b!595242 m!572923))

(declare-fun m!572943 () Bool)

(assert (=> b!595242 m!572943))

(assert (=> b!595261 m!572923))

(declare-fun m!572945 () Bool)

(assert (=> b!595254 m!572945))

(declare-fun m!572947 () Bool)

(assert (=> b!595260 m!572947))

(declare-fun m!572949 () Bool)

(assert (=> b!595252 m!572949))

(declare-fun m!572951 () Bool)

(assert (=> b!595256 m!572951))

(declare-fun m!572953 () Bool)

(assert (=> b!595248 m!572953))

(assert (=> b!595248 m!572923))

(assert (=> b!595248 m!572923))

(declare-fun m!572955 () Bool)

(assert (=> b!595248 m!572955))

(assert (=> b!595249 m!572923))

(assert (=> b!595249 m!572923))

(declare-fun m!572957 () Bool)

(assert (=> b!595249 m!572957))

(declare-fun m!572959 () Bool)

(assert (=> b!595241 m!572959))

(declare-fun m!572961 () Bool)

(assert (=> b!595257 m!572961))

(declare-fun m!572963 () Bool)

(assert (=> b!595244 m!572963))

(declare-fun m!572965 () Bool)

(assert (=> b!595240 m!572965))

(assert (=> b!595246 m!572923))

(assert (=> b!595246 m!572923))

(declare-fun m!572967 () Bool)

(assert (=> b!595246 m!572967))

(assert (=> b!595246 m!572923))

(declare-fun m!572969 () Bool)

(assert (=> b!595246 m!572969))

(declare-fun m!572971 () Bool)

(assert (=> start!54518 m!572971))

(declare-fun m!572973 () Bool)

(assert (=> start!54518 m!572973))

(declare-fun m!572975 () Bool)

(assert (=> b!595262 m!572975))

(assert (=> b!595250 m!572939))

(declare-fun m!572977 () Bool)

(assert (=> b!595250 m!572977))

(assert (=> b!595259 m!572923))

(assert (=> b!595259 m!572939))

(declare-fun m!572979 () Bool)

(assert (=> b!595259 m!572979))

(push 1)

