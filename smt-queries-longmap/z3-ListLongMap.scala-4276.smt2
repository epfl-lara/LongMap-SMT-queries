; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59552 () Bool)

(assert start!59552)

(declare-fun b!657258 () Bool)

(declare-fun res!426264 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!657258 (= res!426264 (bvsge j!136 index!984))))

(declare-fun e!377548 () Bool)

(assert (=> b!657258 (=> res!426264 e!377548)))

(declare-fun e!377539 () Bool)

(assert (=> b!657258 (= e!377539 e!377548)))

(declare-fun b!657259 () Bool)

(declare-fun res!426270 () Bool)

(declare-fun e!377542 () Bool)

(assert (=> b!657259 (=> (not res!426270) (not e!377542))))

(declare-datatypes ((array!38721 0))(
  ( (array!38722 (arr!18557 (Array (_ BitVec 32) (_ BitVec 64))) (size!18922 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38721)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657259 (= res!426270 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657260 () Bool)

(declare-fun lt!306910 () array!38721)

(declare-fun res!426274 () Bool)

(assert (=> b!657260 (= res!426274 (arrayContainsKey!0 lt!306910 (select (arr!18557 a!2986) j!136) j!136))))

(declare-fun e!377552 () Bool)

(assert (=> b!657260 (=> (not res!426274) (not e!377552))))

(assert (=> b!657260 (= e!377548 e!377552)))

(declare-fun b!657261 () Bool)

(declare-fun res!426266 () Bool)

(assert (=> b!657261 (=> (not res!426266) (not e!377542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657261 (= res!426266 (validKeyInArray!0 k0!1786))))

(declare-fun b!657262 () Bool)

(assert (=> b!657262 false))

(declare-datatypes ((Unit!22712 0))(
  ( (Unit!22713) )
))
(declare-fun lt!306911 () Unit!22712)

(declare-datatypes ((List!12637 0))(
  ( (Nil!12634) (Cons!12633 (h!13678 (_ BitVec 64)) (t!18856 List!12637)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38721 (_ BitVec 64) (_ BitVec 32) List!12637) Unit!22712)

(assert (=> b!657262 (= lt!306911 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306910 (select (arr!18557 a!2986) j!136) j!136 Nil!12634))))

(declare-fun arrayNoDuplicates!0 (array!38721 (_ BitVec 32) List!12637) Bool)

(assert (=> b!657262 (arrayNoDuplicates!0 lt!306910 j!136 Nil!12634)))

(declare-fun lt!306898 () Unit!22712)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38721 (_ BitVec 32) (_ BitVec 32)) Unit!22712)

(assert (=> b!657262 (= lt!306898 (lemmaNoDuplicateFromThenFromBigger!0 lt!306910 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657262 (arrayNoDuplicates!0 lt!306910 #b00000000000000000000000000000000 Nil!12634)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!306897 () Unit!22712)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38721 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12637) Unit!22712)

(assert (=> b!657262 (= lt!306897 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12634))))

(assert (=> b!657262 (arrayContainsKey!0 lt!306910 (select (arr!18557 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306906 () Unit!22712)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38721 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22712)

(assert (=> b!657262 (= lt!306906 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306910 (select (arr!18557 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!377544 () Unit!22712)

(declare-fun Unit!22714 () Unit!22712)

(assert (=> b!657262 (= e!377544 Unit!22714)))

(declare-fun b!657263 () Bool)

(declare-fun e!377541 () Bool)

(declare-fun e!377543 () Bool)

(assert (=> b!657263 (= e!377541 e!377543)))

(declare-fun res!426265 () Bool)

(assert (=> b!657263 (=> (not res!426265) (not e!377543))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!657263 (= res!426265 (= (select (store (arr!18557 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657263 (= lt!306910 (array!38722 (store (arr!18557 a!2986) i!1108 k0!1786) (size!18922 a!2986)))))

(declare-fun b!657264 () Bool)

(declare-fun res!426267 () Bool)

(assert (=> b!657264 (=> (not res!426267) (not e!377542))))

(assert (=> b!657264 (= res!426267 (validKeyInArray!0 (select (arr!18557 a!2986) j!136)))))

(declare-fun b!657265 () Bool)

(declare-fun e!377549 () Unit!22712)

(declare-fun Unit!22715 () Unit!22712)

(assert (=> b!657265 (= e!377549 Unit!22715)))

(declare-fun res!426260 () Bool)

(assert (=> start!59552 (=> (not res!426260) (not e!377542))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59552 (= res!426260 (validMask!0 mask!3053))))

(assert (=> start!59552 e!377542))

(assert (=> start!59552 true))

(declare-fun array_inv!14440 (array!38721) Bool)

(assert (=> start!59552 (array_inv!14440 a!2986)))

(declare-fun b!657266 () Bool)

(assert (=> b!657266 (= e!377542 e!377541)))

(declare-fun res!426271 () Bool)

(assert (=> b!657266 (=> (not res!426271) (not e!377541))))

(declare-datatypes ((SeekEntryResult!6994 0))(
  ( (MissingZero!6994 (index!30341 (_ BitVec 32))) (Found!6994 (index!30342 (_ BitVec 32))) (Intermediate!6994 (undefined!7806 Bool) (index!30343 (_ BitVec 32)) (x!59144 (_ BitVec 32))) (Undefined!6994) (MissingVacant!6994 (index!30344 (_ BitVec 32))) )
))
(declare-fun lt!306905 () SeekEntryResult!6994)

(assert (=> b!657266 (= res!426271 (or (= lt!306905 (MissingZero!6994 i!1108)) (= lt!306905 (MissingVacant!6994 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38721 (_ BitVec 32)) SeekEntryResult!6994)

(assert (=> b!657266 (= lt!306905 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!657267 () Bool)

(assert (=> b!657267 false))

(declare-fun lt!306909 () Unit!22712)

(assert (=> b!657267 (= lt!306909 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306910 (select (arr!18557 a!2986) j!136) index!984 Nil!12634))))

(assert (=> b!657267 (arrayNoDuplicates!0 lt!306910 index!984 Nil!12634)))

(declare-fun lt!306907 () Unit!22712)

(assert (=> b!657267 (= lt!306907 (lemmaNoDuplicateFromThenFromBigger!0 lt!306910 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657267 (arrayNoDuplicates!0 lt!306910 #b00000000000000000000000000000000 Nil!12634)))

(declare-fun lt!306893 () Unit!22712)

(assert (=> b!657267 (= lt!306893 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12634))))

(assert (=> b!657267 (arrayContainsKey!0 lt!306910 (select (arr!18557 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306900 () Unit!22712)

(assert (=> b!657267 (= lt!306900 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306910 (select (arr!18557 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!377550 () Bool)

(assert (=> b!657267 e!377550))

(declare-fun res!426258 () Bool)

(assert (=> b!657267 (=> (not res!426258) (not e!377550))))

(assert (=> b!657267 (= res!426258 (arrayContainsKey!0 lt!306910 (select (arr!18557 a!2986) j!136) j!136))))

(declare-fun e!377547 () Unit!22712)

(declare-fun Unit!22716 () Unit!22712)

(assert (=> b!657267 (= e!377547 Unit!22716)))

(declare-fun b!657268 () Bool)

(declare-fun Unit!22717 () Unit!22712)

(assert (=> b!657268 (= e!377549 Unit!22717)))

(assert (=> b!657268 false))

(declare-fun b!657269 () Bool)

(declare-fun res!426261 () Bool)

(assert (=> b!657269 (=> (not res!426261) (not e!377541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38721 (_ BitVec 32)) Bool)

(assert (=> b!657269 (= res!426261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657270 () Bool)

(declare-fun e!377540 () Unit!22712)

(declare-fun Unit!22718 () Unit!22712)

(assert (=> b!657270 (= e!377540 Unit!22718)))

(declare-fun res!426268 () Bool)

(assert (=> b!657270 (= res!426268 (= (select (store (arr!18557 a!2986) i!1108 k0!1786) index!984) (select (arr!18557 a!2986) j!136)))))

(assert (=> b!657270 (=> (not res!426268) (not e!377539))))

(assert (=> b!657270 e!377539))

(declare-fun c!75870 () Bool)

(assert (=> b!657270 (= c!75870 (bvslt j!136 index!984))))

(declare-fun lt!306894 () Unit!22712)

(assert (=> b!657270 (= lt!306894 e!377544)))

(declare-fun c!75869 () Bool)

(assert (=> b!657270 (= c!75869 (bvslt index!984 j!136))))

(declare-fun lt!306903 () Unit!22712)

(assert (=> b!657270 (= lt!306903 e!377547)))

(assert (=> b!657270 false))

(declare-fun b!657271 () Bool)

(declare-fun e!377546 () Bool)

(assert (=> b!657271 (= e!377546 true)))

(assert (=> b!657271 (= (select (store (arr!18557 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657272 () Bool)

(declare-fun Unit!22719 () Unit!22712)

(assert (=> b!657272 (= e!377547 Unit!22719)))

(declare-fun b!657273 () Bool)

(declare-fun Unit!22720 () Unit!22712)

(assert (=> b!657273 (= e!377544 Unit!22720)))

(declare-fun b!657274 () Bool)

(assert (=> b!657274 (= e!377550 (arrayContainsKey!0 lt!306910 (select (arr!18557 a!2986) j!136) index!984))))

(declare-fun b!657275 () Bool)

(declare-fun e!377545 () Bool)

(assert (=> b!657275 (= e!377543 e!377545)))

(declare-fun res!426272 () Bool)

(assert (=> b!657275 (=> (not res!426272) (not e!377545))))

(declare-fun lt!306901 () SeekEntryResult!6994)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!657275 (= res!426272 (and (= lt!306901 (Found!6994 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18557 a!2986) index!984) (select (arr!18557 a!2986) j!136))) (not (= (select (arr!18557 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38721 (_ BitVec 32)) SeekEntryResult!6994)

(assert (=> b!657275 (= lt!306901 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18557 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657276 () Bool)

(assert (=> b!657276 (= e!377552 (arrayContainsKey!0 lt!306910 (select (arr!18557 a!2986) j!136) index!984))))

(declare-fun b!657277 () Bool)

(assert (=> b!657277 (= e!377545 (not e!377546))))

(declare-fun res!426263 () Bool)

(assert (=> b!657277 (=> res!426263 e!377546)))

(declare-fun lt!306896 () SeekEntryResult!6994)

(assert (=> b!657277 (= res!426263 (not (= lt!306896 (MissingVacant!6994 vacantSpotIndex!68))))))

(declare-fun lt!306899 () Unit!22712)

(assert (=> b!657277 (= lt!306899 e!377540)))

(declare-fun c!75868 () Bool)

(assert (=> b!657277 (= c!75868 (= lt!306896 (Found!6994 index!984)))))

(declare-fun lt!306904 () Unit!22712)

(assert (=> b!657277 (= lt!306904 e!377549)))

(declare-fun c!75867 () Bool)

(assert (=> b!657277 (= c!75867 (= lt!306896 Undefined!6994))))

(declare-fun lt!306895 () (_ BitVec 64))

(assert (=> b!657277 (= lt!306896 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306895 lt!306910 mask!3053))))

(declare-fun e!377551 () Bool)

(assert (=> b!657277 e!377551))

(declare-fun res!426269 () Bool)

(assert (=> b!657277 (=> (not res!426269) (not e!377551))))

(declare-fun lt!306902 () SeekEntryResult!6994)

(declare-fun lt!306908 () (_ BitVec 32))

(assert (=> b!657277 (= res!426269 (= lt!306902 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306908 vacantSpotIndex!68 lt!306895 lt!306910 mask!3053)))))

(assert (=> b!657277 (= lt!306902 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306908 vacantSpotIndex!68 (select (arr!18557 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657277 (= lt!306895 (select (store (arr!18557 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!306912 () Unit!22712)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38721 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22712)

(assert (=> b!657277 (= lt!306912 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306908 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657277 (= lt!306908 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657278 () Bool)

(declare-fun Unit!22721 () Unit!22712)

(assert (=> b!657278 (= e!377540 Unit!22721)))

(declare-fun b!657279 () Bool)

(declare-fun res!426273 () Bool)

(assert (=> b!657279 (=> (not res!426273) (not e!377542))))

(assert (=> b!657279 (= res!426273 (and (= (size!18922 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18922 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18922 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657280 () Bool)

(assert (=> b!657280 (= e!377551 (= lt!306901 lt!306902))))

(declare-fun b!657281 () Bool)

(declare-fun res!426259 () Bool)

(assert (=> b!657281 (=> (not res!426259) (not e!377541))))

(assert (=> b!657281 (= res!426259 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12634))))

(declare-fun b!657282 () Bool)

(declare-fun res!426262 () Bool)

(assert (=> b!657282 (=> (not res!426262) (not e!377541))))

(assert (=> b!657282 (= res!426262 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18557 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59552 res!426260) b!657279))

(assert (= (and b!657279 res!426273) b!657264))

(assert (= (and b!657264 res!426267) b!657261))

(assert (= (and b!657261 res!426266) b!657259))

(assert (= (and b!657259 res!426270) b!657266))

(assert (= (and b!657266 res!426271) b!657269))

(assert (= (and b!657269 res!426261) b!657281))

(assert (= (and b!657281 res!426259) b!657282))

(assert (= (and b!657282 res!426262) b!657263))

(assert (= (and b!657263 res!426265) b!657275))

(assert (= (and b!657275 res!426272) b!657277))

(assert (= (and b!657277 res!426269) b!657280))

(assert (= (and b!657277 c!75867) b!657268))

(assert (= (and b!657277 (not c!75867)) b!657265))

(assert (= (and b!657277 c!75868) b!657270))

(assert (= (and b!657277 (not c!75868)) b!657278))

(assert (= (and b!657270 res!426268) b!657258))

(assert (= (and b!657258 (not res!426264)) b!657260))

(assert (= (and b!657260 res!426274) b!657276))

(assert (= (and b!657270 c!75870) b!657262))

(assert (= (and b!657270 (not c!75870)) b!657273))

(assert (= (and b!657270 c!75869) b!657267))

(assert (= (and b!657270 (not c!75869)) b!657272))

(assert (= (and b!657267 res!426258) b!657274))

(assert (= (and b!657277 (not res!426263)) b!657271))

(declare-fun m!629805 () Bool)

(assert (=> b!657259 m!629805))

(declare-fun m!629807 () Bool)

(assert (=> b!657271 m!629807))

(declare-fun m!629809 () Bool)

(assert (=> b!657271 m!629809))

(declare-fun m!629811 () Bool)

(assert (=> b!657282 m!629811))

(declare-fun m!629813 () Bool)

(assert (=> b!657262 m!629813))

(declare-fun m!629815 () Bool)

(assert (=> b!657262 m!629815))

(assert (=> b!657262 m!629815))

(declare-fun m!629817 () Bool)

(assert (=> b!657262 m!629817))

(assert (=> b!657262 m!629815))

(declare-fun m!629819 () Bool)

(assert (=> b!657262 m!629819))

(declare-fun m!629821 () Bool)

(assert (=> b!657262 m!629821))

(assert (=> b!657262 m!629815))

(declare-fun m!629823 () Bool)

(assert (=> b!657262 m!629823))

(declare-fun m!629825 () Bool)

(assert (=> b!657262 m!629825))

(declare-fun m!629827 () Bool)

(assert (=> b!657262 m!629827))

(assert (=> b!657274 m!629815))

(assert (=> b!657274 m!629815))

(declare-fun m!629829 () Bool)

(assert (=> b!657274 m!629829))

(declare-fun m!629831 () Bool)

(assert (=> b!657269 m!629831))

(assert (=> b!657264 m!629815))

(assert (=> b!657264 m!629815))

(declare-fun m!629833 () Bool)

(assert (=> b!657264 m!629833))

(declare-fun m!629835 () Bool)

(assert (=> b!657277 m!629835))

(declare-fun m!629837 () Bool)

(assert (=> b!657277 m!629837))

(assert (=> b!657277 m!629815))

(declare-fun m!629839 () Bool)

(assert (=> b!657277 m!629839))

(declare-fun m!629841 () Bool)

(assert (=> b!657277 m!629841))

(declare-fun m!629843 () Bool)

(assert (=> b!657277 m!629843))

(assert (=> b!657277 m!629807))

(assert (=> b!657277 m!629815))

(declare-fun m!629845 () Bool)

(assert (=> b!657277 m!629845))

(declare-fun m!629847 () Bool)

(assert (=> b!657261 m!629847))

(declare-fun m!629849 () Bool)

(assert (=> b!657281 m!629849))

(declare-fun m!629851 () Bool)

(assert (=> b!657266 m!629851))

(assert (=> b!657276 m!629815))

(assert (=> b!657276 m!629815))

(assert (=> b!657276 m!629829))

(declare-fun m!629853 () Bool)

(assert (=> b!657275 m!629853))

(assert (=> b!657275 m!629815))

(assert (=> b!657275 m!629815))

(declare-fun m!629855 () Bool)

(assert (=> b!657275 m!629855))

(assert (=> b!657263 m!629807))

(declare-fun m!629857 () Bool)

(assert (=> b!657263 m!629857))

(assert (=> b!657267 m!629815))

(assert (=> b!657267 m!629815))

(declare-fun m!629859 () Bool)

(assert (=> b!657267 m!629859))

(declare-fun m!629861 () Bool)

(assert (=> b!657267 m!629861))

(assert (=> b!657267 m!629815))

(declare-fun m!629863 () Bool)

(assert (=> b!657267 m!629863))

(assert (=> b!657267 m!629815))

(declare-fun m!629865 () Bool)

(assert (=> b!657267 m!629865))

(declare-fun m!629867 () Bool)

(assert (=> b!657267 m!629867))

(assert (=> b!657267 m!629827))

(assert (=> b!657267 m!629825))

(assert (=> b!657267 m!629815))

(declare-fun m!629869 () Bool)

(assert (=> b!657267 m!629869))

(declare-fun m!629871 () Bool)

(assert (=> start!59552 m!629871))

(declare-fun m!629873 () Bool)

(assert (=> start!59552 m!629873))

(assert (=> b!657270 m!629807))

(assert (=> b!657270 m!629809))

(assert (=> b!657270 m!629815))

(assert (=> b!657260 m!629815))

(assert (=> b!657260 m!629815))

(assert (=> b!657260 m!629865))

(check-sat (not b!657281) (not b!657261) (not b!657264) (not b!657262) (not b!657266) (not b!657275) (not b!657269) (not b!657274) (not b!657277) (not start!59552) (not b!657260) (not b!657259) (not b!657267) (not b!657276))
(check-sat)
