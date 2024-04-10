; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59582 () Bool)

(assert start!59582)

(declare-fun b!658227 () Bool)

(declare-fun e!378139 () Bool)

(declare-fun e!378141 () Bool)

(assert (=> b!658227 (= e!378139 e!378141)))

(declare-fun res!426862 () Bool)

(assert (=> b!658227 (=> (not res!426862) (not e!378141))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7007 0))(
  ( (MissingZero!7007 (index!30393 (_ BitVec 32))) (Found!7007 (index!30394 (_ BitVec 32))) (Intermediate!7007 (undefined!7819 Bool) (index!30395 (_ BitVec 32)) (x!59186 (_ BitVec 32))) (Undefined!7007) (MissingVacant!7007 (index!30396 (_ BitVec 32))) )
))
(declare-fun lt!307690 () SeekEntryResult!7007)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38740 0))(
  ( (array!38741 (arr!18567 (Array (_ BitVec 32) (_ BitVec 64))) (size!18931 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38740)

(assert (=> b!658227 (= res!426862 (and (= lt!307690 (Found!7007 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18567 a!2986) index!984) (select (arr!18567 a!2986) j!136))) (not (= (select (arr!18567 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38740 (_ BitVec 32)) SeekEntryResult!7007)

(assert (=> b!658227 (= lt!307690 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18567 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!658228 () Bool)

(declare-fun res!426854 () Bool)

(declare-fun e!378137 () Bool)

(assert (=> b!658228 (=> (not res!426854) (not e!378137))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658228 (= res!426854 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!426865 () Bool)

(assert (=> start!59582 (=> (not res!426865) (not e!378137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59582 (= res!426865 (validMask!0 mask!3053))))

(assert (=> start!59582 e!378137))

(assert (=> start!59582 true))

(declare-fun array_inv!14363 (array!38740) Bool)

(assert (=> start!59582 (array_inv!14363 a!2986)))

(declare-fun b!658229 () Bool)

(declare-fun res!426859 () Bool)

(declare-fun e!378135 () Bool)

(assert (=> b!658229 (=> (not res!426859) (not e!378135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38740 (_ BitVec 32)) Bool)

(assert (=> b!658229 (= res!426859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658230 () Bool)

(declare-fun e!378136 () Bool)

(declare-fun lt!307700 () SeekEntryResult!7007)

(assert (=> b!658230 (= e!378136 (= lt!307690 lt!307700))))

(declare-fun b!658231 () Bool)

(assert (=> b!658231 false))

(declare-datatypes ((Unit!22824 0))(
  ( (Unit!22825) )
))
(declare-fun lt!307698 () Unit!22824)

(declare-fun lt!307692 () array!38740)

(declare-datatypes ((List!12608 0))(
  ( (Nil!12605) (Cons!12604 (h!13649 (_ BitVec 64)) (t!18836 List!12608)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38740 (_ BitVec 64) (_ BitVec 32) List!12608) Unit!22824)

(assert (=> b!658231 (= lt!307698 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307692 (select (arr!18567 a!2986) j!136) index!984 Nil!12605))))

(declare-fun arrayNoDuplicates!0 (array!38740 (_ BitVec 32) List!12608) Bool)

(assert (=> b!658231 (arrayNoDuplicates!0 lt!307692 index!984 Nil!12605)))

(declare-fun lt!307699 () Unit!22824)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38740 (_ BitVec 32) (_ BitVec 32)) Unit!22824)

(assert (=> b!658231 (= lt!307699 (lemmaNoDuplicateFromThenFromBigger!0 lt!307692 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658231 (arrayNoDuplicates!0 lt!307692 #b00000000000000000000000000000000 Nil!12605)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!307696 () Unit!22824)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38740 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12608) Unit!22824)

(assert (=> b!658231 (= lt!307696 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12605))))

(assert (=> b!658231 (arrayContainsKey!0 lt!307692 (select (arr!18567 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307691 () Unit!22824)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38740 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22824)

(assert (=> b!658231 (= lt!307691 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307692 (select (arr!18567 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378134 () Bool)

(assert (=> b!658231 e!378134))

(declare-fun res!426863 () Bool)

(assert (=> b!658231 (=> (not res!426863) (not e!378134))))

(assert (=> b!658231 (= res!426863 (arrayContainsKey!0 lt!307692 (select (arr!18567 a!2986) j!136) j!136))))

(declare-fun e!378143 () Unit!22824)

(declare-fun Unit!22826 () Unit!22824)

(assert (=> b!658231 (= e!378143 Unit!22826)))

(declare-fun b!658232 () Bool)

(assert (=> b!658232 (= e!378141 (not true))))

(declare-fun lt!307702 () Unit!22824)

(declare-fun e!378142 () Unit!22824)

(assert (=> b!658232 (= lt!307702 e!378142)))

(declare-fun c!76058 () Bool)

(declare-fun lt!307697 () SeekEntryResult!7007)

(assert (=> b!658232 (= c!76058 (= lt!307697 (Found!7007 index!984)))))

(declare-fun lt!307703 () Unit!22824)

(declare-fun e!378138 () Unit!22824)

(assert (=> b!658232 (= lt!307703 e!378138)))

(declare-fun c!76055 () Bool)

(assert (=> b!658232 (= c!76055 (= lt!307697 Undefined!7007))))

(declare-fun lt!307704 () (_ BitVec 64))

(assert (=> b!658232 (= lt!307697 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307704 lt!307692 mask!3053))))

(assert (=> b!658232 e!378136))

(declare-fun res!426866 () Bool)

(assert (=> b!658232 (=> (not res!426866) (not e!378136))))

(declare-fun lt!307695 () (_ BitVec 32))

(assert (=> b!658232 (= res!426866 (= lt!307700 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307695 vacantSpotIndex!68 lt!307704 lt!307692 mask!3053)))))

(assert (=> b!658232 (= lt!307700 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307695 vacantSpotIndex!68 (select (arr!18567 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658232 (= lt!307704 (select (store (arr!18567 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!307708 () Unit!22824)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38740 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22824)

(assert (=> b!658232 (= lt!307708 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307695 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658232 (= lt!307695 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658233 () Bool)

(declare-fun res!426857 () Bool)

(assert (=> b!658233 (=> (not res!426857) (not e!378137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658233 (= res!426857 (validKeyInArray!0 (select (arr!18567 a!2986) j!136)))))

(declare-fun res!426851 () Bool)

(declare-fun b!658234 () Bool)

(assert (=> b!658234 (= res!426851 (arrayContainsKey!0 lt!307692 (select (arr!18567 a!2986) j!136) j!136))))

(declare-fun e!378133 () Bool)

(assert (=> b!658234 (=> (not res!426851) (not e!378133))))

(declare-fun e!378140 () Bool)

(assert (=> b!658234 (= e!378140 e!378133)))

(declare-fun b!658235 () Bool)

(assert (=> b!658235 (= e!378134 (arrayContainsKey!0 lt!307692 (select (arr!18567 a!2986) j!136) index!984))))

(declare-fun b!658236 () Bool)

(assert (=> b!658236 (= e!378137 e!378135)))

(declare-fun res!426852 () Bool)

(assert (=> b!658236 (=> (not res!426852) (not e!378135))))

(declare-fun lt!307707 () SeekEntryResult!7007)

(assert (=> b!658236 (= res!426852 (or (= lt!307707 (MissingZero!7007 i!1108)) (= lt!307707 (MissingVacant!7007 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38740 (_ BitVec 32)) SeekEntryResult!7007)

(assert (=> b!658236 (= lt!307707 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!658237 () Bool)

(declare-fun e!378132 () Unit!22824)

(declare-fun Unit!22827 () Unit!22824)

(assert (=> b!658237 (= e!378132 Unit!22827)))

(declare-fun b!658238 () Bool)

(declare-fun res!426853 () Bool)

(assert (=> b!658238 (=> (not res!426853) (not e!378137))))

(assert (=> b!658238 (= res!426853 (and (= (size!18931 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18931 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18931 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658239 () Bool)

(declare-fun Unit!22828 () Unit!22824)

(assert (=> b!658239 (= e!378138 Unit!22828)))

(assert (=> b!658239 false))

(declare-fun b!658240 () Bool)

(declare-fun res!426855 () Bool)

(assert (=> b!658240 (=> (not res!426855) (not e!378135))))

(assert (=> b!658240 (= res!426855 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18567 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658241 () Bool)

(declare-fun res!426860 () Bool)

(assert (=> b!658241 (= res!426860 (bvsge j!136 index!984))))

(assert (=> b!658241 (=> res!426860 e!378140)))

(declare-fun e!378144 () Bool)

(assert (=> b!658241 (= e!378144 e!378140)))

(declare-fun b!658242 () Bool)

(declare-fun Unit!22829 () Unit!22824)

(assert (=> b!658242 (= e!378138 Unit!22829)))

(declare-fun b!658243 () Bool)

(assert (=> b!658243 (= e!378133 (arrayContainsKey!0 lt!307692 (select (arr!18567 a!2986) j!136) index!984))))

(declare-fun b!658244 () Bool)

(assert (=> b!658244 (= e!378135 e!378139)))

(declare-fun res!426861 () Bool)

(assert (=> b!658244 (=> (not res!426861) (not e!378139))))

(assert (=> b!658244 (= res!426861 (= (select (store (arr!18567 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658244 (= lt!307692 (array!38741 (store (arr!18567 a!2986) i!1108 k!1786) (size!18931 a!2986)))))

(declare-fun b!658245 () Bool)

(declare-fun res!426864 () Bool)

(assert (=> b!658245 (=> (not res!426864) (not e!378137))))

(assert (=> b!658245 (= res!426864 (validKeyInArray!0 k!1786))))

(declare-fun b!658246 () Bool)

(declare-fun res!426858 () Bool)

(assert (=> b!658246 (=> (not res!426858) (not e!378135))))

(assert (=> b!658246 (= res!426858 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12605))))

(declare-fun b!658247 () Bool)

(declare-fun Unit!22830 () Unit!22824)

(assert (=> b!658247 (= e!378143 Unit!22830)))

(declare-fun b!658248 () Bool)

(assert (=> b!658248 false))

(declare-fun lt!307705 () Unit!22824)

(assert (=> b!658248 (= lt!307705 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307692 (select (arr!18567 a!2986) j!136) j!136 Nil!12605))))

(assert (=> b!658248 (arrayNoDuplicates!0 lt!307692 j!136 Nil!12605)))

(declare-fun lt!307694 () Unit!22824)

(assert (=> b!658248 (= lt!307694 (lemmaNoDuplicateFromThenFromBigger!0 lt!307692 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658248 (arrayNoDuplicates!0 lt!307692 #b00000000000000000000000000000000 Nil!12605)))

(declare-fun lt!307689 () Unit!22824)

(assert (=> b!658248 (= lt!307689 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12605))))

(assert (=> b!658248 (arrayContainsKey!0 lt!307692 (select (arr!18567 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307693 () Unit!22824)

(assert (=> b!658248 (= lt!307693 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307692 (select (arr!18567 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22831 () Unit!22824)

(assert (=> b!658248 (= e!378132 Unit!22831)))

(declare-fun b!658249 () Bool)

(declare-fun Unit!22832 () Unit!22824)

(assert (=> b!658249 (= e!378142 Unit!22832)))

(declare-fun res!426856 () Bool)

(assert (=> b!658249 (= res!426856 (= (select (store (arr!18567 a!2986) i!1108 k!1786) index!984) (select (arr!18567 a!2986) j!136)))))

(assert (=> b!658249 (=> (not res!426856) (not e!378144))))

(assert (=> b!658249 e!378144))

(declare-fun c!76056 () Bool)

(assert (=> b!658249 (= c!76056 (bvslt j!136 index!984))))

(declare-fun lt!307706 () Unit!22824)

(assert (=> b!658249 (= lt!307706 e!378132)))

(declare-fun c!76057 () Bool)

(assert (=> b!658249 (= c!76057 (bvslt index!984 j!136))))

(declare-fun lt!307701 () Unit!22824)

(assert (=> b!658249 (= lt!307701 e!378143)))

(assert (=> b!658249 false))

(declare-fun b!658250 () Bool)

(declare-fun Unit!22833 () Unit!22824)

(assert (=> b!658250 (= e!378142 Unit!22833)))

(assert (= (and start!59582 res!426865) b!658238))

(assert (= (and b!658238 res!426853) b!658233))

(assert (= (and b!658233 res!426857) b!658245))

(assert (= (and b!658245 res!426864) b!658228))

(assert (= (and b!658228 res!426854) b!658236))

(assert (= (and b!658236 res!426852) b!658229))

(assert (= (and b!658229 res!426859) b!658246))

(assert (= (and b!658246 res!426858) b!658240))

(assert (= (and b!658240 res!426855) b!658244))

(assert (= (and b!658244 res!426861) b!658227))

(assert (= (and b!658227 res!426862) b!658232))

(assert (= (and b!658232 res!426866) b!658230))

(assert (= (and b!658232 c!76055) b!658239))

(assert (= (and b!658232 (not c!76055)) b!658242))

(assert (= (and b!658232 c!76058) b!658249))

(assert (= (and b!658232 (not c!76058)) b!658250))

(assert (= (and b!658249 res!426856) b!658241))

(assert (= (and b!658241 (not res!426860)) b!658234))

(assert (= (and b!658234 res!426851) b!658243))

(assert (= (and b!658249 c!76056) b!658248))

(assert (= (and b!658249 (not c!76056)) b!658237))

(assert (= (and b!658249 c!76057) b!658231))

(assert (= (and b!658249 (not c!76057)) b!658247))

(assert (= (and b!658231 res!426863) b!658235))

(declare-fun m!631217 () Bool)

(assert (=> b!658244 m!631217))

(declare-fun m!631219 () Bool)

(assert (=> b!658244 m!631219))

(declare-fun m!631221 () Bool)

(assert (=> b!658232 m!631221))

(declare-fun m!631223 () Bool)

(assert (=> b!658232 m!631223))

(declare-fun m!631225 () Bool)

(assert (=> b!658232 m!631225))

(declare-fun m!631227 () Bool)

(assert (=> b!658232 m!631227))

(assert (=> b!658232 m!631217))

(assert (=> b!658232 m!631225))

(declare-fun m!631229 () Bool)

(assert (=> b!658232 m!631229))

(declare-fun m!631231 () Bool)

(assert (=> b!658232 m!631231))

(declare-fun m!631233 () Bool)

(assert (=> b!658232 m!631233))

(declare-fun m!631235 () Bool)

(assert (=> start!59582 m!631235))

(declare-fun m!631237 () Bool)

(assert (=> start!59582 m!631237))

(assert (=> b!658235 m!631225))

(assert (=> b!658235 m!631225))

(declare-fun m!631239 () Bool)

(assert (=> b!658235 m!631239))

(declare-fun m!631241 () Bool)

(assert (=> b!658227 m!631241))

(assert (=> b!658227 m!631225))

(assert (=> b!658227 m!631225))

(declare-fun m!631243 () Bool)

(assert (=> b!658227 m!631243))

(declare-fun m!631245 () Bool)

(assert (=> b!658246 m!631245))

(declare-fun m!631247 () Bool)

(assert (=> b!658245 m!631247))

(assert (=> b!658249 m!631217))

(declare-fun m!631249 () Bool)

(assert (=> b!658249 m!631249))

(assert (=> b!658249 m!631225))

(assert (=> b!658234 m!631225))

(assert (=> b!658234 m!631225))

(declare-fun m!631251 () Bool)

(assert (=> b!658234 m!631251))

(declare-fun m!631253 () Bool)

(assert (=> b!658236 m!631253))

(declare-fun m!631255 () Bool)

(assert (=> b!658229 m!631255))

(assert (=> b!658231 m!631225))

(assert (=> b!658231 m!631225))

(declare-fun m!631257 () Bool)

(assert (=> b!658231 m!631257))

(assert (=> b!658231 m!631225))

(declare-fun m!631259 () Bool)

(assert (=> b!658231 m!631259))

(assert (=> b!658231 m!631225))

(assert (=> b!658231 m!631251))

(declare-fun m!631261 () Bool)

(assert (=> b!658231 m!631261))

(assert (=> b!658231 m!631225))

(declare-fun m!631263 () Bool)

(assert (=> b!658231 m!631263))

(declare-fun m!631265 () Bool)

(assert (=> b!658231 m!631265))

(declare-fun m!631267 () Bool)

(assert (=> b!658231 m!631267))

(declare-fun m!631269 () Bool)

(assert (=> b!658231 m!631269))

(assert (=> b!658233 m!631225))

(assert (=> b!658233 m!631225))

(declare-fun m!631271 () Bool)

(assert (=> b!658233 m!631271))

(declare-fun m!631273 () Bool)

(assert (=> b!658228 m!631273))

(assert (=> b!658248 m!631225))

(declare-fun m!631275 () Bool)

(assert (=> b!658248 m!631275))

(assert (=> b!658248 m!631225))

(assert (=> b!658248 m!631225))

(declare-fun m!631277 () Bool)

(assert (=> b!658248 m!631277))

(declare-fun m!631279 () Bool)

(assert (=> b!658248 m!631279))

(assert (=> b!658248 m!631265))

(assert (=> b!658248 m!631269))

(declare-fun m!631281 () Bool)

(assert (=> b!658248 m!631281))

(assert (=> b!658248 m!631225))

(declare-fun m!631283 () Bool)

(assert (=> b!658248 m!631283))

(assert (=> b!658243 m!631225))

(assert (=> b!658243 m!631225))

(assert (=> b!658243 m!631239))

(declare-fun m!631285 () Bool)

(assert (=> b!658240 m!631285))

(push 1)

