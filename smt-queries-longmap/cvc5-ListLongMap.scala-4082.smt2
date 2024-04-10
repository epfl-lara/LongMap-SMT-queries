; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55990 () Bool)

(assert start!55990)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!615000 () Bool)

(declare-datatypes ((array!37460 0))(
  ( (array!37461 (arr!17976 (Array (_ BitVec 32) (_ BitVec 64))) (size!18340 (_ BitVec 32))) )
))
(declare-fun lt!282326 () array!37460)

(declare-fun e!352613 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37460)

(declare-fun arrayContainsKey!0 (array!37460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615000 (= e!352613 (arrayContainsKey!0 lt!282326 (select (arr!17976 a!2986) j!136) index!984))))

(declare-fun b!615001 () Bool)

(declare-fun res!396125 () Bool)

(declare-fun e!352623 () Bool)

(assert (=> b!615001 (=> (not res!396125) (not e!352623))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!615001 (= res!396125 (and (= (size!18340 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18340 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18340 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615002 () Bool)

(declare-datatypes ((Unit!19888 0))(
  ( (Unit!19889) )
))
(declare-fun e!352622 () Unit!19888)

(declare-fun Unit!19890 () Unit!19888)

(assert (=> b!615002 (= e!352622 Unit!19890)))

(declare-fun b!615003 () Bool)

(declare-fun Unit!19891 () Unit!19888)

(assert (=> b!615003 (= e!352622 Unit!19891)))

(assert (=> b!615003 false))

(declare-fun b!615004 () Bool)

(declare-fun e!352611 () Bool)

(assert (=> b!615004 (= e!352623 e!352611)))

(declare-fun res!396137 () Bool)

(assert (=> b!615004 (=> (not res!396137) (not e!352611))))

(declare-datatypes ((SeekEntryResult!6416 0))(
  ( (MissingZero!6416 (index!27948 (_ BitVec 32))) (Found!6416 (index!27949 (_ BitVec 32))) (Intermediate!6416 (undefined!7228 Bool) (index!27950 (_ BitVec 32)) (x!56752 (_ BitVec 32))) (Undefined!6416) (MissingVacant!6416 (index!27951 (_ BitVec 32))) )
))
(declare-fun lt!282327 () SeekEntryResult!6416)

(assert (=> b!615004 (= res!396137 (or (= lt!282327 (MissingZero!6416 i!1108)) (= lt!282327 (MissingVacant!6416 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37460 (_ BitVec 32)) SeekEntryResult!6416)

(assert (=> b!615004 (= lt!282327 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun e!352618 () Bool)

(declare-fun b!615005 () Bool)

(assert (=> b!615005 (= e!352618 (arrayContainsKey!0 lt!282326 (select (arr!17976 a!2986) j!136) index!984))))

(declare-fun b!615006 () Bool)

(declare-fun res!396128 () Bool)

(assert (=> b!615006 (=> (not res!396128) (not e!352623))))

(assert (=> b!615006 (= res!396128 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615007 () Bool)

(declare-fun res!396126 () Bool)

(assert (=> b!615007 (=> (not res!396126) (not e!352611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37460 (_ BitVec 32)) Bool)

(assert (=> b!615007 (= res!396126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615008 () Bool)

(declare-fun res!396131 () Bool)

(assert (=> b!615008 (=> (not res!396131) (not e!352611))))

(declare-datatypes ((List!12017 0))(
  ( (Nil!12014) (Cons!12013 (h!13058 (_ BitVec 64)) (t!18245 List!12017)) )
))
(declare-fun arrayNoDuplicates!0 (array!37460 (_ BitVec 32) List!12017) Bool)

(assert (=> b!615008 (= res!396131 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12014))))

(declare-fun res!396130 () Bool)

(assert (=> start!55990 (=> (not res!396130) (not e!352623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55990 (= res!396130 (validMask!0 mask!3053))))

(assert (=> start!55990 e!352623))

(assert (=> start!55990 true))

(declare-fun array_inv!13772 (array!37460) Bool)

(assert (=> start!55990 (array_inv!13772 a!2986)))

(declare-fun b!615009 () Bool)

(declare-fun e!352614 () Bool)

(assert (=> b!615009 (= e!352611 e!352614)))

(declare-fun res!396124 () Bool)

(assert (=> b!615009 (=> (not res!396124) (not e!352614))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!615009 (= res!396124 (= (select (store (arr!17976 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615009 (= lt!282326 (array!37461 (store (arr!17976 a!2986) i!1108 k!1786) (size!18340 a!2986)))))

(declare-fun b!615010 () Bool)

(declare-fun res!396135 () Bool)

(assert (=> b!615010 (= res!396135 (bvsge j!136 index!984))))

(declare-fun e!352610 () Bool)

(assert (=> b!615010 (=> res!396135 e!352610)))

(declare-fun e!352612 () Bool)

(assert (=> b!615010 (= e!352612 e!352610)))

(declare-fun b!615011 () Bool)

(declare-fun res!396123 () Bool)

(assert (=> b!615011 (=> (not res!396123) (not e!352623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615011 (= res!396123 (validKeyInArray!0 k!1786))))

(declare-fun b!615012 () Bool)

(declare-fun e!352616 () Unit!19888)

(declare-fun Unit!19892 () Unit!19888)

(assert (=> b!615012 (= e!352616 Unit!19892)))

(declare-fun b!615013 () Bool)

(declare-fun e!352621 () Bool)

(assert (=> b!615013 (= e!352614 e!352621)))

(declare-fun res!396133 () Bool)

(assert (=> b!615013 (=> (not res!396133) (not e!352621))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!282331 () SeekEntryResult!6416)

(assert (=> b!615013 (= res!396133 (and (= lt!282331 (Found!6416 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17976 a!2986) index!984) (select (arr!17976 a!2986) j!136))) (not (= (select (arr!17976 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37460 (_ BitVec 32)) SeekEntryResult!6416)

(assert (=> b!615013 (= lt!282331 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17976 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615014 () Bool)

(declare-fun res!396127 () Bool)

(assert (=> b!615014 (= res!396127 (arrayContainsKey!0 lt!282326 (select (arr!17976 a!2986) j!136) j!136))))

(assert (=> b!615014 (=> (not res!396127) (not e!352618))))

(assert (=> b!615014 (= e!352610 e!352618)))

(declare-fun b!615015 () Bool)

(declare-fun e!352620 () Bool)

(declare-fun lt!282322 () SeekEntryResult!6416)

(assert (=> b!615015 (= e!352620 (= lt!282331 lt!282322))))

(declare-fun b!615016 () Bool)

(assert (=> b!615016 (= e!352621 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!282333 () Unit!19888)

(declare-fun e!352617 () Unit!19888)

(assert (=> b!615016 (= lt!282333 e!352617)))

(declare-fun c!69807 () Bool)

(declare-fun lt!282324 () SeekEntryResult!6416)

(assert (=> b!615016 (= c!69807 (= lt!282324 (Found!6416 index!984)))))

(declare-fun lt!282320 () Unit!19888)

(assert (=> b!615016 (= lt!282320 e!352622)))

(declare-fun c!69809 () Bool)

(assert (=> b!615016 (= c!69809 (= lt!282324 Undefined!6416))))

(declare-fun lt!282328 () (_ BitVec 64))

(assert (=> b!615016 (= lt!282324 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282328 lt!282326 mask!3053))))

(assert (=> b!615016 e!352620))

(declare-fun res!396132 () Bool)

(assert (=> b!615016 (=> (not res!396132) (not e!352620))))

(declare-fun lt!282325 () (_ BitVec 32))

(assert (=> b!615016 (= res!396132 (= lt!282322 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282325 vacantSpotIndex!68 lt!282328 lt!282326 mask!3053)))))

(assert (=> b!615016 (= lt!282322 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282325 vacantSpotIndex!68 (select (arr!17976 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615016 (= lt!282328 (select (store (arr!17976 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!282321 () Unit!19888)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37460 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19888)

(assert (=> b!615016 (= lt!282321 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282325 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615016 (= lt!282325 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615017 () Bool)

(declare-fun e!352619 () Unit!19888)

(declare-fun Unit!19893 () Unit!19888)

(assert (=> b!615017 (= e!352619 Unit!19893)))

(declare-fun b!615018 () Bool)

(declare-fun res!396134 () Bool)

(assert (=> b!615018 (=> (not res!396134) (not e!352623))))

(assert (=> b!615018 (= res!396134 (validKeyInArray!0 (select (arr!17976 a!2986) j!136)))))

(declare-fun b!615019 () Bool)

(declare-fun Unit!19894 () Unit!19888)

(assert (=> b!615019 (= e!352617 Unit!19894)))

(declare-fun b!615020 () Bool)

(declare-fun res!396122 () Bool)

(assert (=> b!615020 (=> (not res!396122) (not e!352611))))

(assert (=> b!615020 (= res!396122 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17976 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615021 () Bool)

(assert (=> b!615021 false))

(declare-fun lt!282329 () Unit!19888)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37460 (_ BitVec 64) (_ BitVec 32) List!12017) Unit!19888)

(assert (=> b!615021 (= lt!282329 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282326 (select (arr!17976 a!2986) j!136) j!136 Nil!12014))))

(assert (=> b!615021 (arrayNoDuplicates!0 lt!282326 j!136 Nil!12014)))

(declare-fun lt!282334 () Unit!19888)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37460 (_ BitVec 32) (_ BitVec 32)) Unit!19888)

(assert (=> b!615021 (= lt!282334 (lemmaNoDuplicateFromThenFromBigger!0 lt!282326 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615021 (arrayNoDuplicates!0 lt!282326 #b00000000000000000000000000000000 Nil!12014)))

(declare-fun lt!282332 () Unit!19888)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37460 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12017) Unit!19888)

(assert (=> b!615021 (= lt!282332 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12014))))

(assert (=> b!615021 (arrayContainsKey!0 lt!282326 (select (arr!17976 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282319 () Unit!19888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37460 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19888)

(assert (=> b!615021 (= lt!282319 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282326 (select (arr!17976 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19895 () Unit!19888)

(assert (=> b!615021 (= e!352616 Unit!19895)))

(declare-fun b!615022 () Bool)

(declare-fun Unit!19896 () Unit!19888)

(assert (=> b!615022 (= e!352617 Unit!19896)))

(declare-fun res!396136 () Bool)

(assert (=> b!615022 (= res!396136 (= (select (store (arr!17976 a!2986) i!1108 k!1786) index!984) (select (arr!17976 a!2986) j!136)))))

(assert (=> b!615022 (=> (not res!396136) (not e!352612))))

(assert (=> b!615022 e!352612))

(declare-fun c!69808 () Bool)

(assert (=> b!615022 (= c!69808 (bvslt j!136 index!984))))

(declare-fun lt!282323 () Unit!19888)

(assert (=> b!615022 (= lt!282323 e!352616)))

(declare-fun c!69806 () Bool)

(assert (=> b!615022 (= c!69806 (bvslt index!984 j!136))))

(declare-fun lt!282330 () Unit!19888)

(assert (=> b!615022 (= lt!282330 e!352619)))

(assert (=> b!615022 false))

(declare-fun b!615023 () Bool)

(assert (=> b!615023 false))

(declare-fun lt!282335 () Unit!19888)

(assert (=> b!615023 (= lt!282335 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282326 (select (arr!17976 a!2986) j!136) index!984 Nil!12014))))

(assert (=> b!615023 (arrayNoDuplicates!0 lt!282326 index!984 Nil!12014)))

(declare-fun lt!282337 () Unit!19888)

(assert (=> b!615023 (= lt!282337 (lemmaNoDuplicateFromThenFromBigger!0 lt!282326 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615023 (arrayNoDuplicates!0 lt!282326 #b00000000000000000000000000000000 Nil!12014)))

(declare-fun lt!282318 () Unit!19888)

(assert (=> b!615023 (= lt!282318 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12014))))

(assert (=> b!615023 (arrayContainsKey!0 lt!282326 (select (arr!17976 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282336 () Unit!19888)

(assert (=> b!615023 (= lt!282336 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282326 (select (arr!17976 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615023 e!352613))

(declare-fun res!396129 () Bool)

(assert (=> b!615023 (=> (not res!396129) (not e!352613))))

(assert (=> b!615023 (= res!396129 (arrayContainsKey!0 lt!282326 (select (arr!17976 a!2986) j!136) j!136))))

(declare-fun Unit!19897 () Unit!19888)

(assert (=> b!615023 (= e!352619 Unit!19897)))

(assert (= (and start!55990 res!396130) b!615001))

(assert (= (and b!615001 res!396125) b!615018))

(assert (= (and b!615018 res!396134) b!615011))

(assert (= (and b!615011 res!396123) b!615006))

(assert (= (and b!615006 res!396128) b!615004))

(assert (= (and b!615004 res!396137) b!615007))

(assert (= (and b!615007 res!396126) b!615008))

(assert (= (and b!615008 res!396131) b!615020))

(assert (= (and b!615020 res!396122) b!615009))

(assert (= (and b!615009 res!396124) b!615013))

(assert (= (and b!615013 res!396133) b!615016))

(assert (= (and b!615016 res!396132) b!615015))

(assert (= (and b!615016 c!69809) b!615003))

(assert (= (and b!615016 (not c!69809)) b!615002))

(assert (= (and b!615016 c!69807) b!615022))

(assert (= (and b!615016 (not c!69807)) b!615019))

(assert (= (and b!615022 res!396136) b!615010))

(assert (= (and b!615010 (not res!396135)) b!615014))

(assert (= (and b!615014 res!396127) b!615005))

(assert (= (and b!615022 c!69808) b!615021))

(assert (= (and b!615022 (not c!69808)) b!615012))

(assert (= (and b!615022 c!69806) b!615023))

(assert (= (and b!615022 (not c!69806)) b!615017))

(assert (= (and b!615023 res!396129) b!615000))

(declare-fun m!591215 () Bool)

(assert (=> b!615021 m!591215))

(declare-fun m!591217 () Bool)

(assert (=> b!615021 m!591217))

(assert (=> b!615021 m!591217))

(declare-fun m!591219 () Bool)

(assert (=> b!615021 m!591219))

(declare-fun m!591221 () Bool)

(assert (=> b!615021 m!591221))

(assert (=> b!615021 m!591217))

(declare-fun m!591223 () Bool)

(assert (=> b!615021 m!591223))

(assert (=> b!615021 m!591217))

(declare-fun m!591225 () Bool)

(assert (=> b!615021 m!591225))

(declare-fun m!591227 () Bool)

(assert (=> b!615021 m!591227))

(declare-fun m!591229 () Bool)

(assert (=> b!615021 m!591229))

(declare-fun m!591231 () Bool)

(assert (=> b!615013 m!591231))

(assert (=> b!615013 m!591217))

(assert (=> b!615013 m!591217))

(declare-fun m!591233 () Bool)

(assert (=> b!615013 m!591233))

(declare-fun m!591235 () Bool)

(assert (=> b!615004 m!591235))

(declare-fun m!591237 () Bool)

(assert (=> b!615022 m!591237))

(declare-fun m!591239 () Bool)

(assert (=> b!615022 m!591239))

(assert (=> b!615022 m!591217))

(declare-fun m!591241 () Bool)

(assert (=> b!615016 m!591241))

(assert (=> b!615016 m!591217))

(declare-fun m!591243 () Bool)

(assert (=> b!615016 m!591243))

(assert (=> b!615016 m!591237))

(declare-fun m!591245 () Bool)

(assert (=> b!615016 m!591245))

(declare-fun m!591247 () Bool)

(assert (=> b!615016 m!591247))

(assert (=> b!615016 m!591217))

(declare-fun m!591249 () Bool)

(assert (=> b!615016 m!591249))

(declare-fun m!591251 () Bool)

(assert (=> b!615016 m!591251))

(assert (=> b!615009 m!591237))

(declare-fun m!591253 () Bool)

(assert (=> b!615009 m!591253))

(declare-fun m!591255 () Bool)

(assert (=> b!615007 m!591255))

(assert (=> b!615014 m!591217))

(assert (=> b!615014 m!591217))

(declare-fun m!591257 () Bool)

(assert (=> b!615014 m!591257))

(declare-fun m!591259 () Bool)

(assert (=> b!615006 m!591259))

(declare-fun m!591261 () Bool)

(assert (=> b!615020 m!591261))

(declare-fun m!591263 () Bool)

(assert (=> b!615008 m!591263))

(declare-fun m!591265 () Bool)

(assert (=> start!55990 m!591265))

(declare-fun m!591267 () Bool)

(assert (=> start!55990 m!591267))

(assert (=> b!615023 m!591215))

(assert (=> b!615023 m!591217))

(declare-fun m!591269 () Bool)

(assert (=> b!615023 m!591269))

(assert (=> b!615023 m!591217))

(declare-fun m!591271 () Bool)

(assert (=> b!615023 m!591271))

(assert (=> b!615023 m!591217))

(assert (=> b!615023 m!591217))

(assert (=> b!615023 m!591257))

(assert (=> b!615023 m!591217))

(declare-fun m!591273 () Bool)

(assert (=> b!615023 m!591273))

(assert (=> b!615023 m!591229))

(declare-fun m!591275 () Bool)

(assert (=> b!615023 m!591275))

(declare-fun m!591277 () Bool)

(assert (=> b!615023 m!591277))

(assert (=> b!615018 m!591217))

(assert (=> b!615018 m!591217))

(declare-fun m!591279 () Bool)

(assert (=> b!615018 m!591279))

(assert (=> b!615005 m!591217))

(assert (=> b!615005 m!591217))

(declare-fun m!591281 () Bool)

(assert (=> b!615005 m!591281))

(assert (=> b!615000 m!591217))

(assert (=> b!615000 m!591217))

(assert (=> b!615000 m!591281))

(declare-fun m!591283 () Bool)

(assert (=> b!615011 m!591283))

(push 1)

