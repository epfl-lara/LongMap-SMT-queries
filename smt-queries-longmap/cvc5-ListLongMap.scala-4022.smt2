; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54838 () Bool)

(assert start!54838)

(declare-fun b!598979 () Bool)

(declare-fun res!384009 () Bool)

(declare-fun e!342427 () Bool)

(assert (=> b!598979 (=> (not res!384009) (not e!342427))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598979 (= res!384009 (validKeyInArray!0 k!1786))))

(declare-fun res!384012 () Bool)

(assert (=> start!54838 (=> (not res!384012) (not e!342427))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54838 (= res!384012 (validMask!0 mask!3053))))

(assert (=> start!54838 e!342427))

(assert (=> start!54838 true))

(declare-datatypes ((array!37073 0))(
  ( (array!37074 (arr!17796 (Array (_ BitVec 32) (_ BitVec 64))) (size!18160 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37073)

(declare-fun array_inv!13592 (array!37073) Bool)

(assert (=> start!54838 (array_inv!13592 a!2986)))

(declare-fun b!598980 () Bool)

(declare-fun res!384004 () Bool)

(declare-fun e!342429 () Bool)

(assert (=> b!598980 (=> (not res!384004) (not e!342429))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!598980 (= res!384004 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17796 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598981 () Bool)

(declare-fun res!384007 () Bool)

(assert (=> b!598981 (=> (not res!384007) (not e!342427))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!598981 (= res!384007 (validKeyInArray!0 (select (arr!17796 a!2986) j!136)))))

(declare-fun b!598982 () Bool)

(declare-fun e!342421 () Bool)

(declare-fun e!342424 () Bool)

(assert (=> b!598982 (= e!342421 (not e!342424))))

(declare-fun res!384002 () Bool)

(assert (=> b!598982 (=> res!384002 e!342424)))

(declare-datatypes ((SeekEntryResult!6236 0))(
  ( (MissingZero!6236 (index!27201 (_ BitVec 32))) (Found!6236 (index!27202 (_ BitVec 32))) (Intermediate!6236 (undefined!7048 Bool) (index!27203 (_ BitVec 32)) (x!56011 (_ BitVec 32))) (Undefined!6236) (MissingVacant!6236 (index!27204 (_ BitVec 32))) )
))
(declare-fun lt!272209 () SeekEntryResult!6236)

(assert (=> b!598982 (= res!384002 (not (= lt!272209 (Found!6236 index!984))))))

(declare-datatypes ((Unit!18862 0))(
  ( (Unit!18863) )
))
(declare-fun lt!272212 () Unit!18862)

(declare-fun e!342420 () Unit!18862)

(assert (=> b!598982 (= lt!272212 e!342420)))

(declare-fun c!67856 () Bool)

(assert (=> b!598982 (= c!67856 (= lt!272209 Undefined!6236))))

(declare-fun lt!272214 () (_ BitVec 64))

(declare-fun lt!272211 () array!37073)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37073 (_ BitVec 32)) SeekEntryResult!6236)

(assert (=> b!598982 (= lt!272209 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272214 lt!272211 mask!3053))))

(declare-fun e!342418 () Bool)

(assert (=> b!598982 e!342418))

(declare-fun res!384006 () Bool)

(assert (=> b!598982 (=> (not res!384006) (not e!342418))))

(declare-fun lt!272215 () SeekEntryResult!6236)

(declare-fun lt!272213 () (_ BitVec 32))

(assert (=> b!598982 (= res!384006 (= lt!272215 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272213 vacantSpotIndex!68 lt!272214 lt!272211 mask!3053)))))

(assert (=> b!598982 (= lt!272215 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272213 vacantSpotIndex!68 (select (arr!17796 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!598982 (= lt!272214 (select (store (arr!17796 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272204 () Unit!18862)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37073 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18862)

(assert (=> b!598982 (= lt!272204 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272213 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598982 (= lt!272213 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!598983 () Bool)

(declare-fun Unit!18864 () Unit!18862)

(assert (=> b!598983 (= e!342420 Unit!18864)))

(assert (=> b!598983 false))

(declare-fun b!598984 () Bool)

(declare-fun res!384010 () Bool)

(assert (=> b!598984 (=> (not res!384010) (not e!342429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37073 (_ BitVec 32)) Bool)

(assert (=> b!598984 (= res!384010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598985 () Bool)

(declare-fun e!342422 () Bool)

(assert (=> b!598985 (= e!342424 e!342422)))

(declare-fun res!384003 () Bool)

(assert (=> b!598985 (=> res!384003 e!342422)))

(declare-fun lt!272206 () (_ BitVec 64))

(assert (=> b!598985 (= res!384003 (or (not (= (select (arr!17796 a!2986) j!136) lt!272214)) (not (= (select (arr!17796 a!2986) j!136) lt!272206)) (bvsge j!136 index!984)))))

(declare-fun e!342425 () Bool)

(assert (=> b!598985 e!342425))

(declare-fun res!384011 () Bool)

(assert (=> b!598985 (=> (not res!384011) (not e!342425))))

(assert (=> b!598985 (= res!384011 (= lt!272206 (select (arr!17796 a!2986) j!136)))))

(assert (=> b!598985 (= lt!272206 (select (store (arr!17796 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!598986 () Bool)

(declare-fun lt!272208 () SeekEntryResult!6236)

(assert (=> b!598986 (= e!342418 (= lt!272208 lt!272215))))

(declare-fun b!598987 () Bool)

(declare-fun Unit!18865 () Unit!18862)

(assert (=> b!598987 (= e!342420 Unit!18865)))

(declare-fun b!598988 () Bool)

(assert (=> b!598988 (= e!342427 e!342429)))

(declare-fun res!384016 () Bool)

(assert (=> b!598988 (=> (not res!384016) (not e!342429))))

(declare-fun lt!272210 () SeekEntryResult!6236)

(assert (=> b!598988 (= res!384016 (or (= lt!272210 (MissingZero!6236 i!1108)) (= lt!272210 (MissingVacant!6236 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37073 (_ BitVec 32)) SeekEntryResult!6236)

(assert (=> b!598988 (= lt!272210 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun e!342423 () Bool)

(declare-fun b!598989 () Bool)

(declare-fun arrayContainsKey!0 (array!37073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598989 (= e!342423 (arrayContainsKey!0 lt!272211 (select (arr!17796 a!2986) j!136) index!984))))

(declare-fun b!598990 () Bool)

(declare-fun e!342419 () Bool)

(assert (=> b!598990 (= e!342425 e!342419)))

(declare-fun res!384008 () Bool)

(assert (=> b!598990 (=> res!384008 e!342419)))

(assert (=> b!598990 (= res!384008 (or (not (= (select (arr!17796 a!2986) j!136) lt!272214)) (not (= (select (arr!17796 a!2986) j!136) lt!272206)) (bvsge j!136 index!984)))))

(declare-fun b!598991 () Bool)

(declare-fun e!342428 () Bool)

(assert (=> b!598991 (= e!342429 e!342428)))

(declare-fun res!384015 () Bool)

(assert (=> b!598991 (=> (not res!384015) (not e!342428))))

(assert (=> b!598991 (= res!384015 (= (select (store (arr!17796 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598991 (= lt!272211 (array!37074 (store (arr!17796 a!2986) i!1108 k!1786) (size!18160 a!2986)))))

(declare-fun b!598992 () Bool)

(assert (=> b!598992 (= e!342419 e!342423)))

(declare-fun res!384013 () Bool)

(assert (=> b!598992 (=> (not res!384013) (not e!342423))))

(assert (=> b!598992 (= res!384013 (arrayContainsKey!0 lt!272211 (select (arr!17796 a!2986) j!136) j!136))))

(declare-fun b!598993 () Bool)

(assert (=> b!598993 (= e!342428 e!342421)))

(declare-fun res!384014 () Bool)

(assert (=> b!598993 (=> (not res!384014) (not e!342421))))

(assert (=> b!598993 (= res!384014 (and (= lt!272208 (Found!6236 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17796 a!2986) index!984) (select (arr!17796 a!2986) j!136))) (not (= (select (arr!17796 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!598993 (= lt!272208 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17796 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598994 () Bool)

(declare-fun res!384017 () Bool)

(assert (=> b!598994 (=> (not res!384017) (not e!342429))))

(declare-datatypes ((List!11837 0))(
  ( (Nil!11834) (Cons!11833 (h!12878 (_ BitVec 64)) (t!18065 List!11837)) )
))
(declare-fun arrayNoDuplicates!0 (array!37073 (_ BitVec 32) List!11837) Bool)

(assert (=> b!598994 (= res!384017 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11834))))

(declare-fun b!598995 () Bool)

(declare-fun res!384005 () Bool)

(assert (=> b!598995 (=> (not res!384005) (not e!342427))))

(assert (=> b!598995 (= res!384005 (and (= (size!18160 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18160 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18160 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598996 () Bool)

(assert (=> b!598996 (= e!342422 true)))

(assert (=> b!598996 (arrayNoDuplicates!0 lt!272211 #b00000000000000000000000000000000 Nil!11834)))

(declare-fun lt!272205 () Unit!18862)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37073 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11837) Unit!18862)

(assert (=> b!598996 (= lt!272205 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11834))))

(assert (=> b!598996 (arrayContainsKey!0 lt!272211 (select (arr!17796 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272207 () Unit!18862)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37073 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18862)

(assert (=> b!598996 (= lt!272207 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272211 (select (arr!17796 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598997 () Bool)

(declare-fun res!384001 () Bool)

(assert (=> b!598997 (=> (not res!384001) (not e!342427))))

(assert (=> b!598997 (= res!384001 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!54838 res!384012) b!598995))

(assert (= (and b!598995 res!384005) b!598981))

(assert (= (and b!598981 res!384007) b!598979))

(assert (= (and b!598979 res!384009) b!598997))

(assert (= (and b!598997 res!384001) b!598988))

(assert (= (and b!598988 res!384016) b!598984))

(assert (= (and b!598984 res!384010) b!598994))

(assert (= (and b!598994 res!384017) b!598980))

(assert (= (and b!598980 res!384004) b!598991))

(assert (= (and b!598991 res!384015) b!598993))

(assert (= (and b!598993 res!384014) b!598982))

(assert (= (and b!598982 res!384006) b!598986))

(assert (= (and b!598982 c!67856) b!598983))

(assert (= (and b!598982 (not c!67856)) b!598987))

(assert (= (and b!598982 (not res!384002)) b!598985))

(assert (= (and b!598985 res!384011) b!598990))

(assert (= (and b!598990 (not res!384008)) b!598992))

(assert (= (and b!598992 res!384013) b!598989))

(assert (= (and b!598985 (not res!384003)) b!598996))

(declare-fun m!576257 () Bool)

(assert (=> b!598984 m!576257))

(declare-fun m!576259 () Bool)

(assert (=> b!598981 m!576259))

(assert (=> b!598981 m!576259))

(declare-fun m!576261 () Bool)

(assert (=> b!598981 m!576261))

(declare-fun m!576263 () Bool)

(assert (=> b!598988 m!576263))

(assert (=> b!598989 m!576259))

(assert (=> b!598989 m!576259))

(declare-fun m!576265 () Bool)

(assert (=> b!598989 m!576265))

(declare-fun m!576267 () Bool)

(assert (=> b!598994 m!576267))

(declare-fun m!576269 () Bool)

(assert (=> b!598991 m!576269))

(declare-fun m!576271 () Bool)

(assert (=> b!598991 m!576271))

(assert (=> b!598985 m!576259))

(assert (=> b!598985 m!576269))

(declare-fun m!576273 () Bool)

(assert (=> b!598985 m!576273))

(assert (=> b!598992 m!576259))

(assert (=> b!598992 m!576259))

(declare-fun m!576275 () Bool)

(assert (=> b!598992 m!576275))

(declare-fun m!576277 () Bool)

(assert (=> b!598997 m!576277))

(declare-fun m!576279 () Bool)

(assert (=> b!598980 m!576279))

(declare-fun m!576281 () Bool)

(assert (=> b!598979 m!576281))

(declare-fun m!576283 () Bool)

(assert (=> b!598982 m!576283))

(declare-fun m!576285 () Bool)

(assert (=> b!598982 m!576285))

(declare-fun m!576287 () Bool)

(assert (=> b!598982 m!576287))

(assert (=> b!598982 m!576259))

(assert (=> b!598982 m!576259))

(declare-fun m!576289 () Bool)

(assert (=> b!598982 m!576289))

(assert (=> b!598982 m!576269))

(declare-fun m!576291 () Bool)

(assert (=> b!598982 m!576291))

(declare-fun m!576293 () Bool)

(assert (=> b!598982 m!576293))

(declare-fun m!576295 () Bool)

(assert (=> start!54838 m!576295))

(declare-fun m!576297 () Bool)

(assert (=> start!54838 m!576297))

(assert (=> b!598990 m!576259))

(assert (=> b!598996 m!576259))

(assert (=> b!598996 m!576259))

(declare-fun m!576299 () Bool)

(assert (=> b!598996 m!576299))

(declare-fun m!576301 () Bool)

(assert (=> b!598996 m!576301))

(assert (=> b!598996 m!576259))

(declare-fun m!576303 () Bool)

(assert (=> b!598996 m!576303))

(declare-fun m!576305 () Bool)

(assert (=> b!598996 m!576305))

(declare-fun m!576307 () Bool)

(assert (=> b!598993 m!576307))

(assert (=> b!598993 m!576259))

(assert (=> b!598993 m!576259))

(declare-fun m!576309 () Bool)

(assert (=> b!598993 m!576309))

(push 1)

