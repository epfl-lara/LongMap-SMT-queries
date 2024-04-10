; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54174 () Bool)

(assert start!54174)

(declare-fun b!592085 () Bool)

(declare-fun e!338102 () Bool)

(declare-fun e!338104 () Bool)

(assert (=> b!592085 (= e!338102 e!338104)))

(declare-fun res!378959 () Bool)

(assert (=> b!592085 (=> (not res!378959) (not e!338104))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!36904 0))(
  ( (array!36905 (arr!17722 (Array (_ BitVec 32) (_ BitVec 64))) (size!18086 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36904)

(assert (=> b!592085 (= res!378959 (= (select (store (arr!17722 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!268737 () array!36904)

(assert (=> b!592085 (= lt!268737 (array!36905 (store (arr!17722 a!2986) i!1108 k0!1786) (size!18086 a!2986)))))

(declare-fun b!592086 () Bool)

(declare-fun e!338100 () Bool)

(declare-fun e!338101 () Bool)

(assert (=> b!592086 (= e!338100 e!338101)))

(declare-fun res!378968 () Bool)

(assert (=> b!592086 (=> (not res!378968) (not e!338101))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!36904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592086 (= res!378968 (arrayContainsKey!0 lt!268737 (select (arr!17722 a!2986) j!136) j!136))))

(declare-fun b!592087 () Bool)

(declare-fun e!338106 () Bool)

(declare-fun e!338103 () Bool)

(assert (=> b!592087 (= e!338106 (not e!338103))))

(declare-fun res!378966 () Bool)

(assert (=> b!592087 (=> res!378966 e!338103)))

(declare-datatypes ((SeekEntryResult!6162 0))(
  ( (MissingZero!6162 (index!26884 (_ BitVec 32))) (Found!6162 (index!26885 (_ BitVec 32))) (Intermediate!6162 (undefined!6974 Bool) (index!26886 (_ BitVec 32)) (x!55674 (_ BitVec 32))) (Undefined!6162) (MissingVacant!6162 (index!26887 (_ BitVec 32))) )
))
(declare-fun lt!268729 () SeekEntryResult!6162)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!592087 (= res!378966 (not (= lt!268729 (Found!6162 index!984))))))

(declare-datatypes ((Unit!18566 0))(
  ( (Unit!18567) )
))
(declare-fun lt!268735 () Unit!18566)

(declare-fun e!338098 () Unit!18566)

(assert (=> b!592087 (= lt!268735 e!338098)))

(declare-fun c!66932 () Bool)

(assert (=> b!592087 (= c!66932 (= lt!268729 Undefined!6162))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!268734 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36904 (_ BitVec 32)) SeekEntryResult!6162)

(assert (=> b!592087 (= lt!268729 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268734 lt!268737 mask!3053))))

(declare-fun e!338096 () Bool)

(assert (=> b!592087 e!338096))

(declare-fun res!378963 () Bool)

(assert (=> b!592087 (=> (not res!378963) (not e!338096))))

(declare-fun lt!268733 () (_ BitVec 32))

(declare-fun lt!268732 () SeekEntryResult!6162)

(assert (=> b!592087 (= res!378963 (= lt!268732 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268733 vacantSpotIndex!68 lt!268734 lt!268737 mask!3053)))))

(assert (=> b!592087 (= lt!268732 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268733 vacantSpotIndex!68 (select (arr!17722 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!592087 (= lt!268734 (select (store (arr!17722 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268728 () Unit!18566)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36904 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18566)

(assert (=> b!592087 (= lt!268728 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268733 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592087 (= lt!268733 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592088 () Bool)

(declare-fun res!378967 () Bool)

(declare-fun e!338095 () Bool)

(assert (=> b!592088 (=> (not res!378967) (not e!338095))))

(assert (=> b!592088 (= res!378967 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592089 () Bool)

(declare-fun e!338105 () Bool)

(assert (=> b!592089 (= e!338105 e!338100)))

(declare-fun res!378970 () Bool)

(assert (=> b!592089 (=> res!378970 e!338100)))

(declare-fun lt!268730 () (_ BitVec 64))

(assert (=> b!592089 (= res!378970 (or (not (= (select (arr!17722 a!2986) j!136) lt!268734)) (not (= (select (arr!17722 a!2986) j!136) lt!268730)) (bvsge j!136 index!984)))))

(declare-fun b!592090 () Bool)

(declare-fun res!378960 () Bool)

(assert (=> b!592090 (=> (not res!378960) (not e!338102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36904 (_ BitVec 32)) Bool)

(assert (=> b!592090 (= res!378960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592091 () Bool)

(assert (=> b!592091 (= e!338104 e!338106)))

(declare-fun res!378956 () Bool)

(assert (=> b!592091 (=> (not res!378956) (not e!338106))))

(declare-fun lt!268738 () SeekEntryResult!6162)

(assert (=> b!592091 (= res!378956 (and (= lt!268738 (Found!6162 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17722 a!2986) index!984) (select (arr!17722 a!2986) j!136))) (not (= (select (arr!17722 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!592091 (= lt!268738 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17722 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592092 () Bool)

(declare-fun e!338099 () Bool)

(assert (=> b!592092 (= e!338103 e!338099)))

(declare-fun res!378958 () Bool)

(assert (=> b!592092 (=> res!378958 e!338099)))

(assert (=> b!592092 (= res!378958 (or (not (= (select (arr!17722 a!2986) j!136) lt!268734)) (not (= (select (arr!17722 a!2986) j!136) lt!268730)) (bvsge j!136 index!984)))))

(assert (=> b!592092 e!338105))

(declare-fun res!378957 () Bool)

(assert (=> b!592092 (=> (not res!378957) (not e!338105))))

(assert (=> b!592092 (= res!378957 (= lt!268730 (select (arr!17722 a!2986) j!136)))))

(assert (=> b!592092 (= lt!268730 (select (store (arr!17722 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!592093 () Bool)

(declare-fun Unit!18568 () Unit!18566)

(assert (=> b!592093 (= e!338098 Unit!18568)))

(declare-fun b!592094 () Bool)

(assert (=> b!592094 (= e!338101 (arrayContainsKey!0 lt!268737 (select (arr!17722 a!2986) j!136) index!984))))

(declare-fun res!378965 () Bool)

(assert (=> start!54174 (=> (not res!378965) (not e!338095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54174 (= res!378965 (validMask!0 mask!3053))))

(assert (=> start!54174 e!338095))

(assert (=> start!54174 true))

(declare-fun array_inv!13518 (array!36904) Bool)

(assert (=> start!54174 (array_inv!13518 a!2986)))

(declare-fun b!592095 () Bool)

(declare-fun Unit!18569 () Unit!18566)

(assert (=> b!592095 (= e!338098 Unit!18569)))

(assert (=> b!592095 false))

(declare-fun b!592096 () Bool)

(declare-fun res!378962 () Bool)

(assert (=> b!592096 (=> (not res!378962) (not e!338095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592096 (= res!378962 (validKeyInArray!0 k0!1786))))

(declare-fun b!592097 () Bool)

(assert (=> b!592097 (= e!338096 (= lt!268738 lt!268732))))

(declare-fun b!592098 () Bool)

(assert (=> b!592098 (= e!338099 (bvsge (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000))))

(assert (=> b!592098 (arrayContainsKey!0 lt!268737 (select (arr!17722 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!268731 () Unit!18566)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36904 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18566)

(assert (=> b!592098 (= lt!268731 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268737 (select (arr!17722 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592099 () Bool)

(declare-fun res!378969 () Bool)

(assert (=> b!592099 (=> (not res!378969) (not e!338102))))

(declare-datatypes ((List!11763 0))(
  ( (Nil!11760) (Cons!11759 (h!12804 (_ BitVec 64)) (t!17991 List!11763)) )
))
(declare-fun arrayNoDuplicates!0 (array!36904 (_ BitVec 32) List!11763) Bool)

(assert (=> b!592099 (= res!378969 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11760))))

(declare-fun b!592100 () Bool)

(assert (=> b!592100 (= e!338095 e!338102)))

(declare-fun res!378955 () Bool)

(assert (=> b!592100 (=> (not res!378955) (not e!338102))))

(declare-fun lt!268736 () SeekEntryResult!6162)

(assert (=> b!592100 (= res!378955 (or (= lt!268736 (MissingZero!6162 i!1108)) (= lt!268736 (MissingVacant!6162 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36904 (_ BitVec 32)) SeekEntryResult!6162)

(assert (=> b!592100 (= lt!268736 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!592101 () Bool)

(declare-fun res!378961 () Bool)

(assert (=> b!592101 (=> (not res!378961) (not e!338095))))

(assert (=> b!592101 (= res!378961 (validKeyInArray!0 (select (arr!17722 a!2986) j!136)))))

(declare-fun b!592102 () Bool)

(declare-fun res!378971 () Bool)

(assert (=> b!592102 (=> (not res!378971) (not e!338102))))

(assert (=> b!592102 (= res!378971 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17722 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592103 () Bool)

(declare-fun res!378964 () Bool)

(assert (=> b!592103 (=> (not res!378964) (not e!338095))))

(assert (=> b!592103 (= res!378964 (and (= (size!18086 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18086 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18086 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54174 res!378965) b!592103))

(assert (= (and b!592103 res!378964) b!592101))

(assert (= (and b!592101 res!378961) b!592096))

(assert (= (and b!592096 res!378962) b!592088))

(assert (= (and b!592088 res!378967) b!592100))

(assert (= (and b!592100 res!378955) b!592090))

(assert (= (and b!592090 res!378960) b!592099))

(assert (= (and b!592099 res!378969) b!592102))

(assert (= (and b!592102 res!378971) b!592085))

(assert (= (and b!592085 res!378959) b!592091))

(assert (= (and b!592091 res!378956) b!592087))

(assert (= (and b!592087 res!378963) b!592097))

(assert (= (and b!592087 c!66932) b!592095))

(assert (= (and b!592087 (not c!66932)) b!592093))

(assert (= (and b!592087 (not res!378966)) b!592092))

(assert (= (and b!592092 res!378957) b!592089))

(assert (= (and b!592089 (not res!378970)) b!592086))

(assert (= (and b!592086 res!378968) b!592094))

(assert (= (and b!592092 (not res!378958)) b!592098))

(declare-fun m!570237 () Bool)

(assert (=> b!592091 m!570237))

(declare-fun m!570239 () Bool)

(assert (=> b!592091 m!570239))

(assert (=> b!592091 m!570239))

(declare-fun m!570241 () Bool)

(assert (=> b!592091 m!570241))

(declare-fun m!570243 () Bool)

(assert (=> b!592085 m!570243))

(declare-fun m!570245 () Bool)

(assert (=> b!592085 m!570245))

(assert (=> b!592089 m!570239))

(declare-fun m!570247 () Bool)

(assert (=> b!592100 m!570247))

(assert (=> b!592101 m!570239))

(assert (=> b!592101 m!570239))

(declare-fun m!570249 () Bool)

(assert (=> b!592101 m!570249))

(assert (=> b!592098 m!570239))

(assert (=> b!592098 m!570239))

(declare-fun m!570251 () Bool)

(assert (=> b!592098 m!570251))

(assert (=> b!592098 m!570239))

(declare-fun m!570253 () Bool)

(assert (=> b!592098 m!570253))

(declare-fun m!570255 () Bool)

(assert (=> b!592102 m!570255))

(assert (=> b!592094 m!570239))

(assert (=> b!592094 m!570239))

(declare-fun m!570257 () Bool)

(assert (=> b!592094 m!570257))

(declare-fun m!570259 () Bool)

(assert (=> b!592087 m!570259))

(declare-fun m!570261 () Bool)

(assert (=> b!592087 m!570261))

(assert (=> b!592087 m!570239))

(assert (=> b!592087 m!570243))

(declare-fun m!570263 () Bool)

(assert (=> b!592087 m!570263))

(assert (=> b!592087 m!570239))

(declare-fun m!570265 () Bool)

(assert (=> b!592087 m!570265))

(declare-fun m!570267 () Bool)

(assert (=> b!592087 m!570267))

(declare-fun m!570269 () Bool)

(assert (=> b!592087 m!570269))

(declare-fun m!570271 () Bool)

(assert (=> b!592099 m!570271))

(assert (=> b!592092 m!570239))

(assert (=> b!592092 m!570243))

(declare-fun m!570273 () Bool)

(assert (=> b!592092 m!570273))

(declare-fun m!570275 () Bool)

(assert (=> b!592090 m!570275))

(declare-fun m!570277 () Bool)

(assert (=> start!54174 m!570277))

(declare-fun m!570279 () Bool)

(assert (=> start!54174 m!570279))

(assert (=> b!592086 m!570239))

(assert (=> b!592086 m!570239))

(declare-fun m!570281 () Bool)

(assert (=> b!592086 m!570281))

(declare-fun m!570283 () Bool)

(assert (=> b!592088 m!570283))

(declare-fun m!570285 () Bool)

(assert (=> b!592096 m!570285))

(check-sat (not b!592098) (not b!592096) (not b!592087) (not b!592099) (not start!54174) (not b!592101) (not b!592094) (not b!592100) (not b!592088) (not b!592091) (not b!592086) (not b!592090))
(check-sat)
