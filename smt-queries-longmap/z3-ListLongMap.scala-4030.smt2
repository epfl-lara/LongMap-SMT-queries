; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54870 () Bool)

(assert start!54870)

(declare-fun b!600244 () Bool)

(declare-fun e!343170 () Bool)

(assert (=> b!600244 (= e!343170 true)))

(declare-fun lt!272947 () Bool)

(declare-datatypes ((List!11899 0))(
  ( (Nil!11896) (Cons!11895 (h!12940 (_ BitVec 64)) (t!18118 List!11899)) )
))
(declare-fun contains!2964 (List!11899 (_ BitVec 64)) Bool)

(assert (=> b!600244 (= lt!272947 (contains!2964 Nil!11896 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600245 () Bool)

(declare-fun e!343168 () Bool)

(declare-fun e!343172 () Bool)

(assert (=> b!600245 (= e!343168 e!343172)))

(declare-fun res!385271 () Bool)

(assert (=> b!600245 (=> (not res!385271) (not e!343172))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6256 0))(
  ( (MissingZero!6256 (index!27281 (_ BitVec 32))) (Found!6256 (index!27282 (_ BitVec 32))) (Intermediate!6256 (undefined!7068 Bool) (index!27283 (_ BitVec 32)) (x!56090 (_ BitVec 32))) (Undefined!6256) (MissingVacant!6256 (index!27284 (_ BitVec 32))) )
))
(declare-fun lt!272949 () SeekEntryResult!6256)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37119 0))(
  ( (array!37120 (arr!17819 (Array (_ BitVec 32) (_ BitVec 64))) (size!18184 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37119)

(assert (=> b!600245 (= res!385271 (and (= lt!272949 (Found!6256 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17819 a!2986) index!984) (select (arr!17819 a!2986) j!136))) (not (= (select (arr!17819 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37119 (_ BitVec 32)) SeekEntryResult!6256)

(assert (=> b!600245 (= lt!272949 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17819 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600246 () Bool)

(declare-fun e!343171 () Bool)

(assert (=> b!600246 (= e!343172 (not e!343171))))

(declare-fun res!385264 () Bool)

(assert (=> b!600246 (=> res!385264 e!343171)))

(declare-fun lt!272956 () SeekEntryResult!6256)

(assert (=> b!600246 (= res!385264 (not (= lt!272956 (Found!6256 index!984))))))

(declare-datatypes ((Unit!18936 0))(
  ( (Unit!18937) )
))
(declare-fun lt!272946 () Unit!18936)

(declare-fun e!343164 () Unit!18936)

(assert (=> b!600246 (= lt!272946 e!343164)))

(declare-fun c!67857 () Bool)

(assert (=> b!600246 (= c!67857 (= lt!272956 Undefined!6256))))

(declare-fun lt!272958 () (_ BitVec 64))

(declare-fun lt!272948 () array!37119)

(assert (=> b!600246 (= lt!272956 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272958 lt!272948 mask!3053))))

(declare-fun e!343176 () Bool)

(assert (=> b!600246 e!343176))

(declare-fun res!385270 () Bool)

(assert (=> b!600246 (=> (not res!385270) (not e!343176))))

(declare-fun lt!272952 () SeekEntryResult!6256)

(declare-fun lt!272951 () (_ BitVec 32))

(assert (=> b!600246 (= res!385270 (= lt!272952 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272951 vacantSpotIndex!68 lt!272958 lt!272948 mask!3053)))))

(assert (=> b!600246 (= lt!272952 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272951 vacantSpotIndex!68 (select (arr!17819 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!600246 (= lt!272958 (select (store (arr!17819 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272954 () Unit!18936)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37119 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18936)

(assert (=> b!600246 (= lt!272954 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272951 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600246 (= lt!272951 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600247 () Bool)

(declare-fun e!343167 () Bool)

(assert (=> b!600247 (= e!343167 e!343168)))

(declare-fun res!385265 () Bool)

(assert (=> b!600247 (=> (not res!385265) (not e!343168))))

(assert (=> b!600247 (= res!385265 (= (select (store (arr!17819 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600247 (= lt!272948 (array!37120 (store (arr!17819 a!2986) i!1108 k0!1786) (size!18184 a!2986)))))

(declare-fun b!600248 () Bool)

(declare-fun e!343166 () Bool)

(assert (=> b!600248 (= e!343166 e!343170)))

(declare-fun res!385277 () Bool)

(assert (=> b!600248 (=> res!385277 e!343170)))

(assert (=> b!600248 (= res!385277 (or (bvsge (size!18184 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18184 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37119 (_ BitVec 32) List!11899) Bool)

(assert (=> b!600248 (arrayNoDuplicates!0 lt!272948 j!136 Nil!11896)))

(declare-fun lt!272950 () Unit!18936)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37119 (_ BitVec 32) (_ BitVec 32)) Unit!18936)

(assert (=> b!600248 (= lt!272950 (lemmaNoDuplicateFromThenFromBigger!0 lt!272948 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600248 (arrayNoDuplicates!0 lt!272948 #b00000000000000000000000000000000 Nil!11896)))

(declare-fun lt!272953 () Unit!18936)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37119 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11899) Unit!18936)

(assert (=> b!600248 (= lt!272953 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11896))))

(declare-fun arrayContainsKey!0 (array!37119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600248 (arrayContainsKey!0 lt!272948 (select (arr!17819 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272955 () Unit!18936)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37119 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18936)

(assert (=> b!600248 (= lt!272955 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272948 (select (arr!17819 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600249 () Bool)

(declare-fun res!385274 () Bool)

(declare-fun e!343169 () Bool)

(assert (=> b!600249 (=> (not res!385274) (not e!343169))))

(assert (=> b!600249 (= res!385274 (and (= (size!18184 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18184 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18184 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!385282 () Bool)

(assert (=> start!54870 (=> (not res!385282) (not e!343169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54870 (= res!385282 (validMask!0 mask!3053))))

(assert (=> start!54870 e!343169))

(assert (=> start!54870 true))

(declare-fun array_inv!13702 (array!37119) Bool)

(assert (=> start!54870 (array_inv!13702 a!2986)))

(declare-fun b!600250 () Bool)

(assert (=> b!600250 (= e!343176 (= lt!272949 lt!272952))))

(declare-fun b!600251 () Bool)

(declare-fun res!385268 () Bool)

(assert (=> b!600251 (=> (not res!385268) (not e!343169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600251 (= res!385268 (validKeyInArray!0 (select (arr!17819 a!2986) j!136)))))

(declare-fun b!600252 () Bool)

(declare-fun e!343174 () Bool)

(declare-fun e!343173 () Bool)

(assert (=> b!600252 (= e!343174 e!343173)))

(declare-fun res!385273 () Bool)

(assert (=> b!600252 (=> res!385273 e!343173)))

(declare-fun lt!272959 () (_ BitVec 64))

(assert (=> b!600252 (= res!385273 (or (not (= (select (arr!17819 a!2986) j!136) lt!272958)) (not (= (select (arr!17819 a!2986) j!136) lt!272959)) (bvsge j!136 index!984)))))

(declare-fun b!600253 () Bool)

(declare-fun res!385283 () Bool)

(assert (=> b!600253 (=> (not res!385283) (not e!343167))))

(assert (=> b!600253 (= res!385283 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11896))))

(declare-fun b!600254 () Bool)

(declare-fun res!385281 () Bool)

(assert (=> b!600254 (=> (not res!385281) (not e!343167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37119 (_ BitVec 32)) Bool)

(assert (=> b!600254 (= res!385281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600255 () Bool)

(declare-fun res!385280 () Bool)

(assert (=> b!600255 (=> res!385280 e!343170)))

(assert (=> b!600255 (= res!385280 (contains!2964 Nil!11896 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!343165 () Bool)

(declare-fun b!600256 () Bool)

(assert (=> b!600256 (= e!343165 (arrayContainsKey!0 lt!272948 (select (arr!17819 a!2986) j!136) index!984))))

(declare-fun b!600257 () Bool)

(declare-fun Unit!18938 () Unit!18936)

(assert (=> b!600257 (= e!343164 Unit!18938)))

(declare-fun b!600258 () Bool)

(declare-fun res!385275 () Bool)

(assert (=> b!600258 (=> res!385275 e!343170)))

(declare-fun noDuplicate!299 (List!11899) Bool)

(assert (=> b!600258 (= res!385275 (not (noDuplicate!299 Nil!11896)))))

(declare-fun b!600259 () Bool)

(declare-fun res!385276 () Bool)

(assert (=> b!600259 (=> (not res!385276) (not e!343169))))

(assert (=> b!600259 (= res!385276 (validKeyInArray!0 k0!1786))))

(declare-fun b!600260 () Bool)

(assert (=> b!600260 (= e!343173 e!343165)))

(declare-fun res!385278 () Bool)

(assert (=> b!600260 (=> (not res!385278) (not e!343165))))

(assert (=> b!600260 (= res!385278 (arrayContainsKey!0 lt!272948 (select (arr!17819 a!2986) j!136) j!136))))

(declare-fun b!600261 () Bool)

(declare-fun res!385267 () Bool)

(assert (=> b!600261 (=> (not res!385267) (not e!343169))))

(assert (=> b!600261 (= res!385267 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600262 () Bool)

(declare-fun Unit!18939 () Unit!18936)

(assert (=> b!600262 (= e!343164 Unit!18939)))

(assert (=> b!600262 false))

(declare-fun b!600263 () Bool)

(assert (=> b!600263 (= e!343169 e!343167)))

(declare-fun res!385269 () Bool)

(assert (=> b!600263 (=> (not res!385269) (not e!343167))))

(declare-fun lt!272957 () SeekEntryResult!6256)

(assert (=> b!600263 (= res!385269 (or (= lt!272957 (MissingZero!6256 i!1108)) (= lt!272957 (MissingVacant!6256 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37119 (_ BitVec 32)) SeekEntryResult!6256)

(assert (=> b!600263 (= lt!272957 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600264 () Bool)

(assert (=> b!600264 (= e!343171 e!343166)))

(declare-fun res!385279 () Bool)

(assert (=> b!600264 (=> res!385279 e!343166)))

(assert (=> b!600264 (= res!385279 (or (not (= (select (arr!17819 a!2986) j!136) lt!272958)) (not (= (select (arr!17819 a!2986) j!136) lt!272959)) (bvsge j!136 index!984)))))

(assert (=> b!600264 e!343174))

(declare-fun res!385272 () Bool)

(assert (=> b!600264 (=> (not res!385272) (not e!343174))))

(assert (=> b!600264 (= res!385272 (= lt!272959 (select (arr!17819 a!2986) j!136)))))

(assert (=> b!600264 (= lt!272959 (select (store (arr!17819 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600265 () Bool)

(declare-fun res!385266 () Bool)

(assert (=> b!600265 (=> (not res!385266) (not e!343167))))

(assert (=> b!600265 (= res!385266 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17819 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54870 res!385282) b!600249))

(assert (= (and b!600249 res!385274) b!600251))

(assert (= (and b!600251 res!385268) b!600259))

(assert (= (and b!600259 res!385276) b!600261))

(assert (= (and b!600261 res!385267) b!600263))

(assert (= (and b!600263 res!385269) b!600254))

(assert (= (and b!600254 res!385281) b!600253))

(assert (= (and b!600253 res!385283) b!600265))

(assert (= (and b!600265 res!385266) b!600247))

(assert (= (and b!600247 res!385265) b!600245))

(assert (= (and b!600245 res!385271) b!600246))

(assert (= (and b!600246 res!385270) b!600250))

(assert (= (and b!600246 c!67857) b!600262))

(assert (= (and b!600246 (not c!67857)) b!600257))

(assert (= (and b!600246 (not res!385264)) b!600264))

(assert (= (and b!600264 res!385272) b!600252))

(assert (= (and b!600252 (not res!385273)) b!600260))

(assert (= (and b!600260 res!385278) b!600256))

(assert (= (and b!600264 (not res!385279)) b!600248))

(assert (= (and b!600248 (not res!385277)) b!600258))

(assert (= (and b!600258 (not res!385275)) b!600255))

(assert (= (and b!600255 (not res!385280)) b!600244))

(declare-fun m!576961 () Bool)

(assert (=> b!600251 m!576961))

(assert (=> b!600251 m!576961))

(declare-fun m!576963 () Bool)

(assert (=> b!600251 m!576963))

(declare-fun m!576965 () Bool)

(assert (=> b!600258 m!576965))

(declare-fun m!576967 () Bool)

(assert (=> b!600265 m!576967))

(declare-fun m!576969 () Bool)

(assert (=> b!600259 m!576969))

(declare-fun m!576971 () Bool)

(assert (=> b!600261 m!576971))

(declare-fun m!576973 () Bool)

(assert (=> b!600245 m!576973))

(assert (=> b!600245 m!576961))

(assert (=> b!600245 m!576961))

(declare-fun m!576975 () Bool)

(assert (=> b!600245 m!576975))

(declare-fun m!576977 () Bool)

(assert (=> b!600253 m!576977))

(declare-fun m!576979 () Bool)

(assert (=> b!600255 m!576979))

(assert (=> b!600264 m!576961))

(declare-fun m!576981 () Bool)

(assert (=> b!600264 m!576981))

(declare-fun m!576983 () Bool)

(assert (=> b!600264 m!576983))

(assert (=> b!600247 m!576981))

(declare-fun m!576985 () Bool)

(assert (=> b!600247 m!576985))

(declare-fun m!576987 () Bool)

(assert (=> b!600244 m!576987))

(declare-fun m!576989 () Bool)

(assert (=> start!54870 m!576989))

(declare-fun m!576991 () Bool)

(assert (=> start!54870 m!576991))

(declare-fun m!576993 () Bool)

(assert (=> b!600254 m!576993))

(assert (=> b!600256 m!576961))

(assert (=> b!600256 m!576961))

(declare-fun m!576995 () Bool)

(assert (=> b!600256 m!576995))

(declare-fun m!576997 () Bool)

(assert (=> b!600263 m!576997))

(assert (=> b!600248 m!576961))

(declare-fun m!576999 () Bool)

(assert (=> b!600248 m!576999))

(declare-fun m!577001 () Bool)

(assert (=> b!600248 m!577001))

(declare-fun m!577003 () Bool)

(assert (=> b!600248 m!577003))

(assert (=> b!600248 m!576961))

(declare-fun m!577005 () Bool)

(assert (=> b!600248 m!577005))

(assert (=> b!600248 m!576961))

(declare-fun m!577007 () Bool)

(assert (=> b!600248 m!577007))

(declare-fun m!577009 () Bool)

(assert (=> b!600248 m!577009))

(assert (=> b!600252 m!576961))

(assert (=> b!600260 m!576961))

(assert (=> b!600260 m!576961))

(declare-fun m!577011 () Bool)

(assert (=> b!600260 m!577011))

(declare-fun m!577013 () Bool)

(assert (=> b!600246 m!577013))

(declare-fun m!577015 () Bool)

(assert (=> b!600246 m!577015))

(assert (=> b!600246 m!576961))

(assert (=> b!600246 m!576981))

(declare-fun m!577017 () Bool)

(assert (=> b!600246 m!577017))

(declare-fun m!577019 () Bool)

(assert (=> b!600246 m!577019))

(assert (=> b!600246 m!576961))

(declare-fun m!577021 () Bool)

(assert (=> b!600246 m!577021))

(declare-fun m!577023 () Bool)

(assert (=> b!600246 m!577023))

(check-sat (not b!600244) (not b!600255) (not b!600261) (not b!600260) (not b!600251) (not b!600253) (not b!600259) (not b!600254) (not b!600258) (not b!600246) (not b!600245) (not b!600256) (not b!600248) (not b!600263) (not start!54870))
(check-sat)
