; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59556 () Bool)

(assert start!59556)

(declare-fun b!657254 () Bool)

(declare-datatypes ((Unit!22694 0))(
  ( (Unit!22695) )
))
(declare-fun e!377560 () Unit!22694)

(declare-fun Unit!22696 () Unit!22694)

(assert (=> b!657254 (= e!377560 Unit!22696)))

(assert (=> b!657254 false))

(declare-fun b!657255 () Bool)

(declare-fun e!377549 () Bool)

(declare-fun e!377558 () Bool)

(assert (=> b!657255 (= e!377549 (not e!377558))))

(declare-fun res!426191 () Bool)

(assert (=> b!657255 (=> res!426191 e!377558)))

(declare-datatypes ((SeekEntryResult!6994 0))(
  ( (MissingZero!6994 (index!30341 (_ BitVec 32))) (Found!6994 (index!30342 (_ BitVec 32))) (Intermediate!6994 (undefined!7806 Bool) (index!30343 (_ BitVec 32)) (x!59133 (_ BitVec 32))) (Undefined!6994) (MissingVacant!6994 (index!30344 (_ BitVec 32))) )
))
(declare-fun lt!306926 () SeekEntryResult!6994)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!657255 (= res!426191 (not (= lt!306926 (MissingVacant!6994 vacantSpotIndex!68))))))

(declare-fun lt!306925 () Unit!22694)

(declare-fun e!377559 () Unit!22694)

(assert (=> b!657255 (= lt!306925 e!377559)))

(declare-fun c!75899 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!657255 (= c!75899 (= lt!306926 (Found!6994 index!984)))))

(declare-fun lt!306920 () Unit!22694)

(assert (=> b!657255 (= lt!306920 e!377560)))

(declare-fun c!75901 () Bool)

(assert (=> b!657255 (= c!75901 (= lt!306926 Undefined!6994))))

(declare-fun lt!306923 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!38714 0))(
  ( (array!38715 (arr!18554 (Array (_ BitVec 32) (_ BitVec 64))) (size!18918 (_ BitVec 32))) )
))
(declare-fun lt!306913 () array!38714)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38714 (_ BitVec 32)) SeekEntryResult!6994)

(assert (=> b!657255 (= lt!306926 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306923 lt!306913 mask!3053))))

(declare-fun e!377553 () Bool)

(assert (=> b!657255 e!377553))

(declare-fun res!426195 () Bool)

(assert (=> b!657255 (=> (not res!426195) (not e!377553))))

(declare-fun lt!306919 () (_ BitVec 32))

(declare-fun lt!306924 () SeekEntryResult!6994)

(assert (=> b!657255 (= res!426195 (= lt!306924 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306919 vacantSpotIndex!68 lt!306923 lt!306913 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38714)

(assert (=> b!657255 (= lt!306924 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306919 vacantSpotIndex!68 (select (arr!18554 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!657255 (= lt!306923 (select (store (arr!18554 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!306922 () Unit!22694)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38714 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22694)

(assert (=> b!657255 (= lt!306922 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306919 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657255 (= lt!306919 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657256 () Bool)

(declare-fun res!426201 () Bool)

(assert (=> b!657256 (= res!426201 (bvsge j!136 index!984))))

(declare-fun e!377561 () Bool)

(assert (=> b!657256 (=> res!426201 e!377561)))

(declare-fun e!377555 () Bool)

(assert (=> b!657256 (= e!377555 e!377561)))

(declare-fun b!657257 () Bool)

(declare-fun e!377551 () Unit!22694)

(declare-fun Unit!22697 () Unit!22694)

(assert (=> b!657257 (= e!377551 Unit!22697)))

(declare-fun b!657258 () Bool)

(declare-fun e!377556 () Bool)

(assert (=> b!657258 (= e!377556 e!377549)))

(declare-fun res!426206 () Bool)

(assert (=> b!657258 (=> (not res!426206) (not e!377549))))

(declare-fun lt!306927 () SeekEntryResult!6994)

(assert (=> b!657258 (= res!426206 (and (= lt!306927 (Found!6994 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18554 a!2986) index!984) (select (arr!18554 a!2986) j!136))) (not (= (select (arr!18554 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!657258 (= lt!306927 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18554 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657259 () Bool)

(declare-fun e!377557 () Bool)

(declare-fun arrayContainsKey!0 (array!38714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657259 (= e!377557 (arrayContainsKey!0 lt!306913 (select (arr!18554 a!2986) j!136) index!984))))

(declare-fun b!657260 () Bool)

(declare-fun res!426200 () Bool)

(declare-fun e!377548 () Bool)

(assert (=> b!657260 (=> (not res!426200) (not e!377548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657260 (= res!426200 (validKeyInArray!0 (select (arr!18554 a!2986) j!136)))))

(declare-fun b!657261 () Bool)

(declare-fun e!377550 () Bool)

(assert (=> b!657261 (= e!377550 e!377556)))

(declare-fun res!426190 () Bool)

(assert (=> b!657261 (=> (not res!426190) (not e!377556))))

(assert (=> b!657261 (= res!426190 (= (select (store (arr!18554 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657261 (= lt!306913 (array!38715 (store (arr!18554 a!2986) i!1108 k!1786) (size!18918 a!2986)))))

(declare-fun b!657262 () Bool)

(assert (=> b!657262 (= e!377548 e!377550)))

(declare-fun res!426205 () Bool)

(assert (=> b!657262 (=> (not res!426205) (not e!377550))))

(declare-fun lt!306914 () SeekEntryResult!6994)

(assert (=> b!657262 (= res!426205 (or (= lt!306914 (MissingZero!6994 i!1108)) (= lt!306914 (MissingVacant!6994 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38714 (_ BitVec 32)) SeekEntryResult!6994)

(assert (=> b!657262 (= lt!306914 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!657263 () Bool)

(declare-fun res!426192 () Bool)

(assert (=> b!657263 (=> (not res!426192) (not e!377548))))

(assert (=> b!657263 (= res!426192 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657264 () Bool)

(declare-fun Unit!22698 () Unit!22694)

(assert (=> b!657264 (= e!377559 Unit!22698)))

(declare-fun res!426194 () Bool)

(assert (=> b!657264 (= res!426194 (= (select (store (arr!18554 a!2986) i!1108 k!1786) index!984) (select (arr!18554 a!2986) j!136)))))

(assert (=> b!657264 (=> (not res!426194) (not e!377555))))

(assert (=> b!657264 e!377555))

(declare-fun c!75902 () Bool)

(assert (=> b!657264 (= c!75902 (bvslt j!136 index!984))))

(declare-fun lt!306910 () Unit!22694)

(declare-fun e!377562 () Unit!22694)

(assert (=> b!657264 (= lt!306910 e!377562)))

(declare-fun c!75900 () Bool)

(assert (=> b!657264 (= c!75900 (bvslt index!984 j!136))))

(declare-fun lt!306918 () Unit!22694)

(assert (=> b!657264 (= lt!306918 e!377551)))

(assert (=> b!657264 false))

(declare-fun b!657265 () Bool)

(declare-fun Unit!22699 () Unit!22694)

(assert (=> b!657265 (= e!377559 Unit!22699)))

(declare-fun b!657266 () Bool)

(declare-fun e!377552 () Bool)

(assert (=> b!657266 (= e!377552 (arrayContainsKey!0 lt!306913 (select (arr!18554 a!2986) j!136) index!984))))

(declare-fun b!657267 () Bool)

(assert (=> b!657267 (= e!377558 true)))

(assert (=> b!657267 (= (select (store (arr!18554 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657268 () Bool)

(assert (=> b!657268 false))

(declare-fun lt!306915 () Unit!22694)

(declare-datatypes ((List!12595 0))(
  ( (Nil!12592) (Cons!12591 (h!13636 (_ BitVec 64)) (t!18823 List!12595)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38714 (_ BitVec 64) (_ BitVec 32) List!12595) Unit!22694)

(assert (=> b!657268 (= lt!306915 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306913 (select (arr!18554 a!2986) j!136) j!136 Nil!12592))))

(declare-fun arrayNoDuplicates!0 (array!38714 (_ BitVec 32) List!12595) Bool)

(assert (=> b!657268 (arrayNoDuplicates!0 lt!306913 j!136 Nil!12592)))

(declare-fun lt!306916 () Unit!22694)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38714 (_ BitVec 32) (_ BitVec 32)) Unit!22694)

(assert (=> b!657268 (= lt!306916 (lemmaNoDuplicateFromThenFromBigger!0 lt!306913 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657268 (arrayNoDuplicates!0 lt!306913 #b00000000000000000000000000000000 Nil!12592)))

(declare-fun lt!306928 () Unit!22694)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38714 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12595) Unit!22694)

(assert (=> b!657268 (= lt!306928 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12592))))

(assert (=> b!657268 (arrayContainsKey!0 lt!306913 (select (arr!18554 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306912 () Unit!22694)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38714 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22694)

(assert (=> b!657268 (= lt!306912 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306913 (select (arr!18554 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22700 () Unit!22694)

(assert (=> b!657268 (= e!377562 Unit!22700)))

(declare-fun res!426199 () Bool)

(assert (=> start!59556 (=> (not res!426199) (not e!377548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59556 (= res!426199 (validMask!0 mask!3053))))

(assert (=> start!59556 e!377548))

(assert (=> start!59556 true))

(declare-fun array_inv!14350 (array!38714) Bool)

(assert (=> start!59556 (array_inv!14350 a!2986)))

(declare-fun b!657269 () Bool)

(assert (=> b!657269 false))

(declare-fun lt!306921 () Unit!22694)

(assert (=> b!657269 (= lt!306921 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306913 (select (arr!18554 a!2986) j!136) index!984 Nil!12592))))

(assert (=> b!657269 (arrayNoDuplicates!0 lt!306913 index!984 Nil!12592)))

(declare-fun lt!306917 () Unit!22694)

(assert (=> b!657269 (= lt!306917 (lemmaNoDuplicateFromThenFromBigger!0 lt!306913 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657269 (arrayNoDuplicates!0 lt!306913 #b00000000000000000000000000000000 Nil!12592)))

(declare-fun lt!306911 () Unit!22694)

(assert (=> b!657269 (= lt!306911 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12592))))

(assert (=> b!657269 (arrayContainsKey!0 lt!306913 (select (arr!18554 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306909 () Unit!22694)

(assert (=> b!657269 (= lt!306909 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306913 (select (arr!18554 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!657269 e!377552))

(declare-fun res!426193 () Bool)

(assert (=> b!657269 (=> (not res!426193) (not e!377552))))

(assert (=> b!657269 (= res!426193 (arrayContainsKey!0 lt!306913 (select (arr!18554 a!2986) j!136) j!136))))

(declare-fun Unit!22701 () Unit!22694)

(assert (=> b!657269 (= e!377551 Unit!22701)))

(declare-fun res!426204 () Bool)

(declare-fun b!657270 () Bool)

(assert (=> b!657270 (= res!426204 (arrayContainsKey!0 lt!306913 (select (arr!18554 a!2986) j!136) j!136))))

(assert (=> b!657270 (=> (not res!426204) (not e!377557))))

(assert (=> b!657270 (= e!377561 e!377557)))

(declare-fun b!657271 () Bool)

(assert (=> b!657271 (= e!377553 (= lt!306927 lt!306924))))

(declare-fun b!657272 () Bool)

(declare-fun res!426198 () Bool)

(assert (=> b!657272 (=> (not res!426198) (not e!377550))))

(assert (=> b!657272 (= res!426198 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18554 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657273 () Bool)

(declare-fun Unit!22702 () Unit!22694)

(assert (=> b!657273 (= e!377560 Unit!22702)))

(declare-fun b!657274 () Bool)

(declare-fun res!426203 () Bool)

(assert (=> b!657274 (=> (not res!426203) (not e!377548))))

(assert (=> b!657274 (= res!426203 (and (= (size!18918 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18918 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18918 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657275 () Bool)

(declare-fun Unit!22703 () Unit!22694)

(assert (=> b!657275 (= e!377562 Unit!22703)))

(declare-fun b!657276 () Bool)

(declare-fun res!426197 () Bool)

(assert (=> b!657276 (=> (not res!426197) (not e!377550))))

(assert (=> b!657276 (= res!426197 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12592))))

(declare-fun b!657277 () Bool)

(declare-fun res!426202 () Bool)

(assert (=> b!657277 (=> (not res!426202) (not e!377548))))

(assert (=> b!657277 (= res!426202 (validKeyInArray!0 k!1786))))

(declare-fun b!657278 () Bool)

(declare-fun res!426196 () Bool)

(assert (=> b!657278 (=> (not res!426196) (not e!377550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38714 (_ BitVec 32)) Bool)

(assert (=> b!657278 (= res!426196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!59556 res!426199) b!657274))

(assert (= (and b!657274 res!426203) b!657260))

(assert (= (and b!657260 res!426200) b!657277))

(assert (= (and b!657277 res!426202) b!657263))

(assert (= (and b!657263 res!426192) b!657262))

(assert (= (and b!657262 res!426205) b!657278))

(assert (= (and b!657278 res!426196) b!657276))

(assert (= (and b!657276 res!426197) b!657272))

(assert (= (and b!657272 res!426198) b!657261))

(assert (= (and b!657261 res!426190) b!657258))

(assert (= (and b!657258 res!426206) b!657255))

(assert (= (and b!657255 res!426195) b!657271))

(assert (= (and b!657255 c!75901) b!657254))

(assert (= (and b!657255 (not c!75901)) b!657273))

(assert (= (and b!657255 c!75899) b!657264))

(assert (= (and b!657255 (not c!75899)) b!657265))

(assert (= (and b!657264 res!426194) b!657256))

(assert (= (and b!657256 (not res!426201)) b!657270))

(assert (= (and b!657270 res!426204) b!657259))

(assert (= (and b!657264 c!75902) b!657268))

(assert (= (and b!657264 (not c!75902)) b!657275))

(assert (= (and b!657264 c!75900) b!657269))

(assert (= (and b!657264 (not c!75900)) b!657257))

(assert (= (and b!657269 res!426193) b!657266))

(assert (= (and b!657255 (not res!426191)) b!657267))

(declare-fun m!630307 () Bool)

(assert (=> b!657258 m!630307))

(declare-fun m!630309 () Bool)

(assert (=> b!657258 m!630309))

(assert (=> b!657258 m!630309))

(declare-fun m!630311 () Bool)

(assert (=> b!657258 m!630311))

(declare-fun m!630313 () Bool)

(assert (=> b!657277 m!630313))

(declare-fun m!630315 () Bool)

(assert (=> b!657262 m!630315))

(declare-fun m!630317 () Bool)

(assert (=> b!657278 m!630317))

(assert (=> b!657270 m!630309))

(assert (=> b!657270 m!630309))

(declare-fun m!630319 () Bool)

(assert (=> b!657270 m!630319))

(assert (=> b!657259 m!630309))

(assert (=> b!657259 m!630309))

(declare-fun m!630321 () Bool)

(assert (=> b!657259 m!630321))

(assert (=> b!657260 m!630309))

(assert (=> b!657260 m!630309))

(declare-fun m!630323 () Bool)

(assert (=> b!657260 m!630323))

(declare-fun m!630325 () Bool)

(assert (=> b!657276 m!630325))

(declare-fun m!630327 () Bool)

(assert (=> b!657268 m!630327))

(assert (=> b!657268 m!630309))

(declare-fun m!630329 () Bool)

(assert (=> b!657268 m!630329))

(declare-fun m!630331 () Bool)

(assert (=> b!657268 m!630331))

(declare-fun m!630333 () Bool)

(assert (=> b!657268 m!630333))

(assert (=> b!657268 m!630309))

(declare-fun m!630335 () Bool)

(assert (=> b!657268 m!630335))

(assert (=> b!657268 m!630309))

(assert (=> b!657268 m!630309))

(declare-fun m!630337 () Bool)

(assert (=> b!657268 m!630337))

(declare-fun m!630339 () Bool)

(assert (=> b!657268 m!630339))

(declare-fun m!630341 () Bool)

(assert (=> start!59556 m!630341))

(declare-fun m!630343 () Bool)

(assert (=> start!59556 m!630343))

(assert (=> b!657266 m!630309))

(assert (=> b!657266 m!630309))

(assert (=> b!657266 m!630321))

(assert (=> b!657269 m!630309))

(declare-fun m!630345 () Bool)

(assert (=> b!657269 m!630345))

(assert (=> b!657269 m!630309))

(declare-fun m!630347 () Bool)

(assert (=> b!657269 m!630347))

(declare-fun m!630349 () Bool)

(assert (=> b!657269 m!630349))

(assert (=> b!657269 m!630333))

(assert (=> b!657269 m!630309))

(declare-fun m!630351 () Bool)

(assert (=> b!657269 m!630351))

(assert (=> b!657269 m!630309))

(declare-fun m!630353 () Bool)

(assert (=> b!657269 m!630353))

(assert (=> b!657269 m!630331))

(assert (=> b!657269 m!630309))

(assert (=> b!657269 m!630319))

(declare-fun m!630355 () Bool)

(assert (=> b!657263 m!630355))

(declare-fun m!630357 () Bool)

(assert (=> b!657255 m!630357))

(declare-fun m!630359 () Bool)

(assert (=> b!657255 m!630359))

(assert (=> b!657255 m!630309))

(declare-fun m!630361 () Bool)

(assert (=> b!657255 m!630361))

(declare-fun m!630363 () Bool)

(assert (=> b!657255 m!630363))

(declare-fun m!630365 () Bool)

(assert (=> b!657255 m!630365))

(assert (=> b!657255 m!630309))

(declare-fun m!630367 () Bool)

(assert (=> b!657255 m!630367))

(declare-fun m!630369 () Bool)

(assert (=> b!657255 m!630369))

(assert (=> b!657267 m!630363))

(declare-fun m!630371 () Bool)

(assert (=> b!657267 m!630371))

(assert (=> b!657264 m!630363))

(assert (=> b!657264 m!630371))

(assert (=> b!657264 m!630309))

(assert (=> b!657261 m!630363))

(declare-fun m!630373 () Bool)

(assert (=> b!657261 m!630373))

(declare-fun m!630375 () Bool)

(assert (=> b!657272 m!630375))

(push 1)

