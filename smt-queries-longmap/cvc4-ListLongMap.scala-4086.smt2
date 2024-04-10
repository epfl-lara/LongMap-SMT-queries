; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56018 () Bool)

(assert start!56018)

(declare-fun b!616008 () Bool)

(declare-fun e!353200 () Bool)

(declare-fun e!353202 () Bool)

(assert (=> b!616008 (= e!353200 e!353202)))

(declare-fun res!396808 () Bool)

(assert (=> b!616008 (=> (not res!396808) (not e!353202))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37488 0))(
  ( (array!37489 (arr!17990 (Array (_ BitVec 32) (_ BitVec 64))) (size!18354 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37488)

(assert (=> b!616008 (= res!396808 (= (select (store (arr!17990 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!283165 () array!37488)

(assert (=> b!616008 (= lt!283165 (array!37489 (store (arr!17990 a!2986) i!1108 k!1786) (size!18354 a!2986)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!353206 () Bool)

(declare-fun b!616009 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616009 (= e!353206 (arrayContainsKey!0 lt!283165 (select (arr!17990 a!2986) j!136) index!984))))

(declare-fun b!616010 () Bool)

(assert (=> b!616010 false))

(declare-datatypes ((Unit!20028 0))(
  ( (Unit!20029) )
))
(declare-fun lt!283160 () Unit!20028)

(declare-datatypes ((List!12031 0))(
  ( (Nil!12028) (Cons!12027 (h!13072 (_ BitVec 64)) (t!18259 List!12031)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37488 (_ BitVec 64) (_ BitVec 32) List!12031) Unit!20028)

(assert (=> b!616010 (= lt!283160 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283165 (select (arr!17990 a!2986) j!136) index!984 Nil!12028))))

(declare-fun arrayNoDuplicates!0 (array!37488 (_ BitVec 32) List!12031) Bool)

(assert (=> b!616010 (arrayNoDuplicates!0 lt!283165 index!984 Nil!12028)))

(declare-fun lt!283176 () Unit!20028)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37488 (_ BitVec 32) (_ BitVec 32)) Unit!20028)

(assert (=> b!616010 (= lt!283176 (lemmaNoDuplicateFromThenFromBigger!0 lt!283165 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616010 (arrayNoDuplicates!0 lt!283165 #b00000000000000000000000000000000 Nil!12028)))

(declare-fun lt!283164 () Unit!20028)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37488 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12031) Unit!20028)

(assert (=> b!616010 (= lt!283164 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12028))))

(assert (=> b!616010 (arrayContainsKey!0 lt!283165 (select (arr!17990 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283162 () Unit!20028)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37488 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20028)

(assert (=> b!616010 (= lt!283162 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283165 (select (arr!17990 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!616010 e!353206))

(declare-fun res!396798 () Bool)

(assert (=> b!616010 (=> (not res!396798) (not e!353206))))

(assert (=> b!616010 (= res!396798 (arrayContainsKey!0 lt!283165 (select (arr!17990 a!2986) j!136) j!136))))

(declare-fun e!353208 () Unit!20028)

(declare-fun Unit!20030 () Unit!20028)

(assert (=> b!616010 (= e!353208 Unit!20030)))

(declare-fun b!616011 () Bool)

(declare-fun e!353204 () Bool)

(declare-datatypes ((SeekEntryResult!6430 0))(
  ( (MissingZero!6430 (index!28004 (_ BitVec 32))) (Found!6430 (index!28005 (_ BitVec 32))) (Intermediate!6430 (undefined!7242 Bool) (index!28006 (_ BitVec 32)) (x!56798 (_ BitVec 32))) (Undefined!6430) (MissingVacant!6430 (index!28007 (_ BitVec 32))) )
))
(declare-fun lt!283170 () SeekEntryResult!6430)

(declare-fun lt!283168 () SeekEntryResult!6430)

(assert (=> b!616011 (= e!353204 (= lt!283170 lt!283168))))

(declare-fun res!396809 () Bool)

(declare-fun e!353205 () Bool)

(assert (=> start!56018 (=> (not res!396809) (not e!353205))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56018 (= res!396809 (validMask!0 mask!3053))))

(assert (=> start!56018 e!353205))

(assert (=> start!56018 true))

(declare-fun array_inv!13786 (array!37488) Bool)

(assert (=> start!56018 (array_inv!13786 a!2986)))

(declare-fun b!616012 () Bool)

(declare-fun res!396805 () Bool)

(assert (=> b!616012 (=> (not res!396805) (not e!353200))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!616012 (= res!396805 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17990 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616013 () Bool)

(declare-fun res!396796 () Bool)

(assert (=> b!616013 (=> (not res!396796) (not e!353205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616013 (= res!396796 (validKeyInArray!0 (select (arr!17990 a!2986) j!136)))))

(declare-fun b!616014 () Bool)

(declare-fun e!353207 () Bool)

(assert (=> b!616014 (= e!353207 (not true))))

(declare-fun lt!283177 () Unit!20028)

(declare-fun e!353201 () Unit!20028)

(assert (=> b!616014 (= lt!283177 e!353201)))

(declare-fun c!69976 () Bool)

(declare-fun lt!283163 () SeekEntryResult!6430)

(assert (=> b!616014 (= c!69976 (= lt!283163 (Found!6430 index!984)))))

(declare-fun lt!283169 () Unit!20028)

(declare-fun e!353199 () Unit!20028)

(assert (=> b!616014 (= lt!283169 e!353199)))

(declare-fun c!69974 () Bool)

(assert (=> b!616014 (= c!69974 (= lt!283163 Undefined!6430))))

(declare-fun lt!283161 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37488 (_ BitVec 32)) SeekEntryResult!6430)

(assert (=> b!616014 (= lt!283163 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283161 lt!283165 mask!3053))))

(assert (=> b!616014 e!353204))

(declare-fun res!396797 () Bool)

(assert (=> b!616014 (=> (not res!396797) (not e!353204))))

(declare-fun lt!283175 () (_ BitVec 32))

(assert (=> b!616014 (= res!396797 (= lt!283168 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283175 vacantSpotIndex!68 lt!283161 lt!283165 mask!3053)))))

(assert (=> b!616014 (= lt!283168 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283175 vacantSpotIndex!68 (select (arr!17990 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616014 (= lt!283161 (select (store (arr!17990 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!283167 () Unit!20028)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37488 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20028)

(assert (=> b!616014 (= lt!283167 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283175 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616014 (= lt!283175 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616015 () Bool)

(declare-fun res!396807 () Bool)

(assert (=> b!616015 (=> (not res!396807) (not e!353205))))

(assert (=> b!616015 (= res!396807 (validKeyInArray!0 k!1786))))

(declare-fun b!616016 () Bool)

(assert (=> b!616016 false))

(declare-fun lt!283166 () Unit!20028)

(assert (=> b!616016 (= lt!283166 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283165 (select (arr!17990 a!2986) j!136) j!136 Nil!12028))))

(assert (=> b!616016 (arrayNoDuplicates!0 lt!283165 j!136 Nil!12028)))

(declare-fun lt!283158 () Unit!20028)

(assert (=> b!616016 (= lt!283158 (lemmaNoDuplicateFromThenFromBigger!0 lt!283165 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616016 (arrayNoDuplicates!0 lt!283165 #b00000000000000000000000000000000 Nil!12028)))

(declare-fun lt!283174 () Unit!20028)

(assert (=> b!616016 (= lt!283174 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12028))))

(assert (=> b!616016 (arrayContainsKey!0 lt!283165 (select (arr!17990 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283173 () Unit!20028)

(assert (=> b!616016 (= lt!283173 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283165 (select (arr!17990 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!353210 () Unit!20028)

(declare-fun Unit!20031 () Unit!20028)

(assert (=> b!616016 (= e!353210 Unit!20031)))

(declare-fun b!616017 () Bool)

(assert (=> b!616017 (= e!353202 e!353207)))

(declare-fun res!396795 () Bool)

(assert (=> b!616017 (=> (not res!396795) (not e!353207))))

(assert (=> b!616017 (= res!396795 (and (= lt!283170 (Found!6430 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17990 a!2986) index!984) (select (arr!17990 a!2986) j!136))) (not (= (select (arr!17990 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616017 (= lt!283170 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17990 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!396804 () Bool)

(declare-fun b!616018 () Bool)

(assert (=> b!616018 (= res!396804 (arrayContainsKey!0 lt!283165 (select (arr!17990 a!2986) j!136) j!136))))

(declare-fun e!353198 () Bool)

(assert (=> b!616018 (=> (not res!396804) (not e!353198))))

(declare-fun e!353211 () Bool)

(assert (=> b!616018 (= e!353211 e!353198)))

(declare-fun b!616019 () Bool)

(declare-fun res!396802 () Bool)

(assert (=> b!616019 (=> (not res!396802) (not e!353200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37488 (_ BitVec 32)) Bool)

(assert (=> b!616019 (= res!396802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616020 () Bool)

(declare-fun res!396806 () Bool)

(assert (=> b!616020 (=> (not res!396806) (not e!353205))))

(assert (=> b!616020 (= res!396806 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616021 () Bool)

(declare-fun Unit!20032 () Unit!20028)

(assert (=> b!616021 (= e!353199 Unit!20032)))

(declare-fun b!616022 () Bool)

(assert (=> b!616022 (= e!353205 e!353200)))

(declare-fun res!396794 () Bool)

(assert (=> b!616022 (=> (not res!396794) (not e!353200))))

(declare-fun lt!283172 () SeekEntryResult!6430)

(assert (=> b!616022 (= res!396794 (or (= lt!283172 (MissingZero!6430 i!1108)) (= lt!283172 (MissingVacant!6430 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37488 (_ BitVec 32)) SeekEntryResult!6430)

(assert (=> b!616022 (= lt!283172 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!616023 () Bool)

(assert (=> b!616023 (= e!353198 (arrayContainsKey!0 lt!283165 (select (arr!17990 a!2986) j!136) index!984))))

(declare-fun b!616024 () Bool)

(declare-fun Unit!20033 () Unit!20028)

(assert (=> b!616024 (= e!353201 Unit!20033)))

(declare-fun res!396800 () Bool)

(assert (=> b!616024 (= res!396800 (= (select (store (arr!17990 a!2986) i!1108 k!1786) index!984) (select (arr!17990 a!2986) j!136)))))

(declare-fun e!353203 () Bool)

(assert (=> b!616024 (=> (not res!396800) (not e!353203))))

(assert (=> b!616024 e!353203))

(declare-fun c!69977 () Bool)

(assert (=> b!616024 (= c!69977 (bvslt j!136 index!984))))

(declare-fun lt!283159 () Unit!20028)

(assert (=> b!616024 (= lt!283159 e!353210)))

(declare-fun c!69975 () Bool)

(assert (=> b!616024 (= c!69975 (bvslt index!984 j!136))))

(declare-fun lt!283171 () Unit!20028)

(assert (=> b!616024 (= lt!283171 e!353208)))

(assert (=> b!616024 false))

(declare-fun b!616025 () Bool)

(declare-fun Unit!20034 () Unit!20028)

(assert (=> b!616025 (= e!353210 Unit!20034)))

(declare-fun b!616026 () Bool)

(declare-fun res!396799 () Bool)

(assert (=> b!616026 (= res!396799 (bvsge j!136 index!984))))

(assert (=> b!616026 (=> res!396799 e!353211)))

(assert (=> b!616026 (= e!353203 e!353211)))

(declare-fun b!616027 () Bool)

(declare-fun Unit!20035 () Unit!20028)

(assert (=> b!616027 (= e!353208 Unit!20035)))

(declare-fun b!616028 () Bool)

(declare-fun res!396801 () Bool)

(assert (=> b!616028 (=> (not res!396801) (not e!353205))))

(assert (=> b!616028 (= res!396801 (and (= (size!18354 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18354 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18354 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616029 () Bool)

(declare-fun res!396803 () Bool)

(assert (=> b!616029 (=> (not res!396803) (not e!353200))))

(assert (=> b!616029 (= res!396803 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12028))))

(declare-fun b!616030 () Bool)

(declare-fun Unit!20036 () Unit!20028)

(assert (=> b!616030 (= e!353199 Unit!20036)))

(assert (=> b!616030 false))

(declare-fun b!616031 () Bool)

(declare-fun Unit!20037 () Unit!20028)

(assert (=> b!616031 (= e!353201 Unit!20037)))

(assert (= (and start!56018 res!396809) b!616028))

(assert (= (and b!616028 res!396801) b!616013))

(assert (= (and b!616013 res!396796) b!616015))

(assert (= (and b!616015 res!396807) b!616020))

(assert (= (and b!616020 res!396806) b!616022))

(assert (= (and b!616022 res!396794) b!616019))

(assert (= (and b!616019 res!396802) b!616029))

(assert (= (and b!616029 res!396803) b!616012))

(assert (= (and b!616012 res!396805) b!616008))

(assert (= (and b!616008 res!396808) b!616017))

(assert (= (and b!616017 res!396795) b!616014))

(assert (= (and b!616014 res!396797) b!616011))

(assert (= (and b!616014 c!69974) b!616030))

(assert (= (and b!616014 (not c!69974)) b!616021))

(assert (= (and b!616014 c!69976) b!616024))

(assert (= (and b!616014 (not c!69976)) b!616031))

(assert (= (and b!616024 res!396800) b!616026))

(assert (= (and b!616026 (not res!396799)) b!616018))

(assert (= (and b!616018 res!396804) b!616023))

(assert (= (and b!616024 c!69977) b!616016))

(assert (= (and b!616024 (not c!69977)) b!616025))

(assert (= (and b!616024 c!69975) b!616010))

(assert (= (and b!616024 (not c!69975)) b!616027))

(assert (= (and b!616010 res!396798) b!616009))

(declare-fun m!592195 () Bool)

(assert (=> b!616016 m!592195))

(declare-fun m!592197 () Bool)

(assert (=> b!616016 m!592197))

(declare-fun m!592199 () Bool)

(assert (=> b!616016 m!592199))

(assert (=> b!616016 m!592195))

(declare-fun m!592201 () Bool)

(assert (=> b!616016 m!592201))

(assert (=> b!616016 m!592195))

(declare-fun m!592203 () Bool)

(assert (=> b!616016 m!592203))

(declare-fun m!592205 () Bool)

(assert (=> b!616016 m!592205))

(declare-fun m!592207 () Bool)

(assert (=> b!616016 m!592207))

(assert (=> b!616016 m!592195))

(declare-fun m!592209 () Bool)

(assert (=> b!616016 m!592209))

(declare-fun m!592211 () Bool)

(assert (=> b!616029 m!592211))

(declare-fun m!592213 () Bool)

(assert (=> b!616014 m!592213))

(assert (=> b!616014 m!592195))

(declare-fun m!592215 () Bool)

(assert (=> b!616014 m!592215))

(declare-fun m!592217 () Bool)

(assert (=> b!616014 m!592217))

(assert (=> b!616014 m!592195))

(declare-fun m!592219 () Bool)

(assert (=> b!616014 m!592219))

(declare-fun m!592221 () Bool)

(assert (=> b!616014 m!592221))

(declare-fun m!592223 () Bool)

(assert (=> b!616014 m!592223))

(declare-fun m!592225 () Bool)

(assert (=> b!616014 m!592225))

(declare-fun m!592227 () Bool)

(assert (=> b!616015 m!592227))

(declare-fun m!592229 () Bool)

(assert (=> b!616017 m!592229))

(assert (=> b!616017 m!592195))

(assert (=> b!616017 m!592195))

(declare-fun m!592231 () Bool)

(assert (=> b!616017 m!592231))

(assert (=> b!616023 m!592195))

(assert (=> b!616023 m!592195))

(declare-fun m!592233 () Bool)

(assert (=> b!616023 m!592233))

(assert (=> b!616018 m!592195))

(assert (=> b!616018 m!592195))

(declare-fun m!592235 () Bool)

(assert (=> b!616018 m!592235))

(declare-fun m!592237 () Bool)

(assert (=> start!56018 m!592237))

(declare-fun m!592239 () Bool)

(assert (=> start!56018 m!592239))

(declare-fun m!592241 () Bool)

(assert (=> b!616020 m!592241))

(assert (=> b!616024 m!592215))

(declare-fun m!592243 () Bool)

(assert (=> b!616024 m!592243))

(assert (=> b!616024 m!592195))

(assert (=> b!616010 m!592195))

(declare-fun m!592245 () Bool)

(assert (=> b!616010 m!592245))

(declare-fun m!592247 () Bool)

(assert (=> b!616010 m!592247))

(assert (=> b!616010 m!592195))

(assert (=> b!616010 m!592235))

(assert (=> b!616010 m!592195))

(declare-fun m!592249 () Bool)

(assert (=> b!616010 m!592249))

(assert (=> b!616010 m!592199))

(assert (=> b!616010 m!592195))

(declare-fun m!592251 () Bool)

(assert (=> b!616010 m!592251))

(assert (=> b!616010 m!592195))

(declare-fun m!592253 () Bool)

(assert (=> b!616010 m!592253))

(assert (=> b!616010 m!592207))

(declare-fun m!592255 () Bool)

(assert (=> b!616012 m!592255))

(assert (=> b!616009 m!592195))

(assert (=> b!616009 m!592195))

(assert (=> b!616009 m!592233))

(assert (=> b!616008 m!592215))

(declare-fun m!592257 () Bool)

(assert (=> b!616008 m!592257))

(assert (=> b!616013 m!592195))

(assert (=> b!616013 m!592195))

(declare-fun m!592259 () Bool)

(assert (=> b!616013 m!592259))

(declare-fun m!592261 () Bool)

(assert (=> b!616022 m!592261))

(declare-fun m!592263 () Bool)

(assert (=> b!616019 m!592263))

(push 1)

