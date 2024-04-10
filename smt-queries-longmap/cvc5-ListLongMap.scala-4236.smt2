; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58436 () Bool)

(assert start!58436)

(declare-fun b!645229 () Bool)

(declare-fun res!418017 () Bool)

(declare-fun e!369756 () Bool)

(assert (=> b!645229 (=> (not res!418017) (not e!369756))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38452 0))(
  ( (array!38453 (arr!18438 (Array (_ BitVec 32) (_ BitVec 64))) (size!18802 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38452)

(assert (=> b!645229 (= res!418017 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18438 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645230 () Bool)

(declare-fun e!369759 () Bool)

(declare-fun e!369753 () Bool)

(assert (=> b!645230 (= e!369759 e!369753)))

(declare-fun res!418018 () Bool)

(assert (=> b!645230 (=> res!418018 e!369753)))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!645230 (= res!418018 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!21894 0))(
  ( (Unit!21895) )
))
(declare-fun lt!299151 () Unit!21894)

(declare-fun e!369762 () Unit!21894)

(assert (=> b!645230 (= lt!299151 e!369762)))

(declare-fun c!73978 () Bool)

(assert (=> b!645230 (= c!73978 (bvslt j!136 index!984))))

(declare-fun b!645231 () Bool)

(declare-fun res!418019 () Bool)

(assert (=> b!645231 (=> (not res!418019) (not e!369756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38452 (_ BitVec 32)) Bool)

(assert (=> b!645231 (= res!418019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645232 () Bool)

(declare-fun e!369760 () Bool)

(assert (=> b!645232 (= e!369756 e!369760)))

(declare-fun res!418011 () Bool)

(assert (=> b!645232 (=> (not res!418011) (not e!369760))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!645232 (= res!418011 (= (select (store (arr!18438 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!299157 () array!38452)

(assert (=> b!645232 (= lt!299157 (array!38453 (store (arr!18438 a!2986) i!1108 k!1786) (size!18802 a!2986)))))

(declare-fun b!645233 () Bool)

(declare-fun e!369761 () Bool)

(assert (=> b!645233 (= e!369760 e!369761)))

(declare-fun res!418007 () Bool)

(assert (=> b!645233 (=> (not res!418007) (not e!369761))))

(declare-datatypes ((SeekEntryResult!6878 0))(
  ( (MissingZero!6878 (index!29847 (_ BitVec 32))) (Found!6878 (index!29848 (_ BitVec 32))) (Intermediate!6878 (undefined!7690 Bool) (index!29849 (_ BitVec 32)) (x!58623 (_ BitVec 32))) (Undefined!6878) (MissingVacant!6878 (index!29850 (_ BitVec 32))) )
))
(declare-fun lt!299164 () SeekEntryResult!6878)

(assert (=> b!645233 (= res!418007 (and (= lt!299164 (Found!6878 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18438 a!2986) index!984) (select (arr!18438 a!2986) j!136))) (not (= (select (arr!18438 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38452 (_ BitVec 32)) SeekEntryResult!6878)

(assert (=> b!645233 (= lt!299164 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18438 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645234 () Bool)

(declare-fun Unit!21896 () Unit!21894)

(assert (=> b!645234 (= e!369762 Unit!21896)))

(declare-fun b!645235 () Bool)

(declare-fun e!369751 () Bool)

(declare-fun e!369755 () Bool)

(assert (=> b!645235 (= e!369751 e!369755)))

(declare-fun res!418022 () Bool)

(assert (=> b!645235 (=> (not res!418022) (not e!369755))))

(declare-fun arrayContainsKey!0 (array!38452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645235 (= res!418022 (arrayContainsKey!0 lt!299157 (select (arr!18438 a!2986) j!136) j!136))))

(declare-fun e!369757 () Bool)

(declare-fun b!645236 () Bool)

(assert (=> b!645236 (= e!369757 (arrayContainsKey!0 lt!299157 (select (arr!18438 a!2986) j!136) index!984))))

(declare-fun b!645237 () Bool)

(declare-fun res!418024 () Bool)

(declare-fun e!369752 () Bool)

(assert (=> b!645237 (=> (not res!418024) (not e!369752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645237 (= res!418024 (validKeyInArray!0 (select (arr!18438 a!2986) j!136)))))

(declare-fun b!645238 () Bool)

(declare-fun e!369750 () Bool)

(assert (=> b!645238 (= e!369750 e!369759)))

(declare-fun res!418012 () Bool)

(assert (=> b!645238 (=> res!418012 e!369759)))

(declare-fun lt!299152 () (_ BitVec 64))

(declare-fun lt!299159 () (_ BitVec 64))

(assert (=> b!645238 (= res!418012 (or (not (= (select (arr!18438 a!2986) j!136) lt!299152)) (not (= (select (arr!18438 a!2986) j!136) lt!299159))))))

(declare-fun e!369748 () Bool)

(assert (=> b!645238 e!369748))

(declare-fun res!418008 () Bool)

(assert (=> b!645238 (=> (not res!418008) (not e!369748))))

(assert (=> b!645238 (= res!418008 (= lt!299159 (select (arr!18438 a!2986) j!136)))))

(assert (=> b!645238 (= lt!299159 (select (store (arr!18438 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!645239 () Bool)

(declare-fun e!369749 () Unit!21894)

(declare-fun Unit!21897 () Unit!21894)

(assert (=> b!645239 (= e!369749 Unit!21897)))

(assert (=> b!645239 false))

(declare-fun b!645240 () Bool)

(declare-fun res!418010 () Bool)

(assert (=> b!645240 (=> (not res!418010) (not e!369756))))

(declare-datatypes ((List!12479 0))(
  ( (Nil!12476) (Cons!12475 (h!13520 (_ BitVec 64)) (t!18707 List!12479)) )
))
(declare-fun arrayNoDuplicates!0 (array!38452 (_ BitVec 32) List!12479) Bool)

(assert (=> b!645240 (= res!418010 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12476))))

(declare-fun b!645241 () Bool)

(declare-fun Unit!21898 () Unit!21894)

(assert (=> b!645241 (= e!369749 Unit!21898)))

(declare-fun b!645242 () Bool)

(assert (=> b!645242 (= e!369753 true)))

(assert (=> b!645242 (arrayContainsKey!0 lt!299157 (select (arr!18438 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299156 () Unit!21894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38452 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21894)

(assert (=> b!645242 (= lt!299156 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299157 (select (arr!18438 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!645242 e!369757))

(declare-fun res!418013 () Bool)

(assert (=> b!645242 (=> (not res!418013) (not e!369757))))

(assert (=> b!645242 (= res!418013 (arrayContainsKey!0 lt!299157 (select (arr!18438 a!2986) j!136) j!136))))

(declare-fun b!645243 () Bool)

(declare-fun res!418021 () Bool)

(assert (=> b!645243 (=> (not res!418021) (not e!369752))))

(assert (=> b!645243 (= res!418021 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645244 () Bool)

(declare-fun res!418020 () Bool)

(assert (=> b!645244 (=> (not res!418020) (not e!369752))))

(assert (=> b!645244 (= res!418020 (and (= (size!18802 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18802 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18802 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645245 () Bool)

(declare-fun Unit!21899 () Unit!21894)

(assert (=> b!645245 (= e!369762 Unit!21899)))

(declare-fun lt!299155 () Unit!21894)

(assert (=> b!645245 (= lt!299155 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299157 (select (arr!18438 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645245 (arrayContainsKey!0 lt!299157 (select (arr!18438 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299153 () Unit!21894)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38452 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12479) Unit!21894)

(assert (=> b!645245 (= lt!299153 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12476))))

(assert (=> b!645245 (arrayNoDuplicates!0 lt!299157 #b00000000000000000000000000000000 Nil!12476)))

(declare-fun lt!299160 () Unit!21894)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38452 (_ BitVec 32) (_ BitVec 32)) Unit!21894)

(assert (=> b!645245 (= lt!299160 (lemmaNoDuplicateFromThenFromBigger!0 lt!299157 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645245 (arrayNoDuplicates!0 lt!299157 j!136 Nil!12476)))

(declare-fun lt!299154 () Unit!21894)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38452 (_ BitVec 64) (_ BitVec 32) List!12479) Unit!21894)

(assert (=> b!645245 (= lt!299154 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299157 (select (arr!18438 a!2986) j!136) j!136 Nil!12476))))

(assert (=> b!645245 false))

(declare-fun b!645246 () Bool)

(assert (=> b!645246 (= e!369752 e!369756)))

(declare-fun res!418016 () Bool)

(assert (=> b!645246 (=> (not res!418016) (not e!369756))))

(declare-fun lt!299162 () SeekEntryResult!6878)

(assert (=> b!645246 (= res!418016 (or (= lt!299162 (MissingZero!6878 i!1108)) (= lt!299162 (MissingVacant!6878 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38452 (_ BitVec 32)) SeekEntryResult!6878)

(assert (=> b!645246 (= lt!299162 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!645247 () Bool)

(declare-fun res!418015 () Bool)

(assert (=> b!645247 (=> (not res!418015) (not e!369752))))

(assert (=> b!645247 (= res!418015 (validKeyInArray!0 k!1786))))

(declare-fun b!645248 () Bool)

(assert (=> b!645248 (= e!369755 (arrayContainsKey!0 lt!299157 (select (arr!18438 a!2986) j!136) index!984))))

(declare-fun b!645249 () Bool)

(assert (=> b!645249 (= e!369748 e!369751)))

(declare-fun res!418025 () Bool)

(assert (=> b!645249 (=> res!418025 e!369751)))

(assert (=> b!645249 (= res!418025 (or (not (= (select (arr!18438 a!2986) j!136) lt!299152)) (not (= (select (arr!18438 a!2986) j!136) lt!299159)) (bvsge j!136 index!984)))))

(declare-fun res!418014 () Bool)

(assert (=> start!58436 (=> (not res!418014) (not e!369752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58436 (= res!418014 (validMask!0 mask!3053))))

(assert (=> start!58436 e!369752))

(assert (=> start!58436 true))

(declare-fun array_inv!14234 (array!38452) Bool)

(assert (=> start!58436 (array_inv!14234 a!2986)))

(declare-fun b!645250 () Bool)

(assert (=> b!645250 (= e!369761 (not e!369750))))

(declare-fun res!418009 () Bool)

(assert (=> b!645250 (=> res!418009 e!369750)))

(declare-fun lt!299149 () SeekEntryResult!6878)

(assert (=> b!645250 (= res!418009 (not (= lt!299149 (Found!6878 index!984))))))

(declare-fun lt!299163 () Unit!21894)

(assert (=> b!645250 (= lt!299163 e!369749)))

(declare-fun c!73979 () Bool)

(assert (=> b!645250 (= c!73979 (= lt!299149 Undefined!6878))))

(assert (=> b!645250 (= lt!299149 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299152 lt!299157 mask!3053))))

(declare-fun e!369758 () Bool)

(assert (=> b!645250 e!369758))

(declare-fun res!418023 () Bool)

(assert (=> b!645250 (=> (not res!418023) (not e!369758))))

(declare-fun lt!299150 () (_ BitVec 32))

(declare-fun lt!299158 () SeekEntryResult!6878)

(assert (=> b!645250 (= res!418023 (= lt!299158 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299150 vacantSpotIndex!68 lt!299152 lt!299157 mask!3053)))))

(assert (=> b!645250 (= lt!299158 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299150 vacantSpotIndex!68 (select (arr!18438 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645250 (= lt!299152 (select (store (arr!18438 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!299161 () Unit!21894)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38452 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21894)

(assert (=> b!645250 (= lt!299161 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299150 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645250 (= lt!299150 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645251 () Bool)

(assert (=> b!645251 (= e!369758 (= lt!299164 lt!299158))))

(assert (= (and start!58436 res!418014) b!645244))

(assert (= (and b!645244 res!418020) b!645237))

(assert (= (and b!645237 res!418024) b!645247))

(assert (= (and b!645247 res!418015) b!645243))

(assert (= (and b!645243 res!418021) b!645246))

(assert (= (and b!645246 res!418016) b!645231))

(assert (= (and b!645231 res!418019) b!645240))

(assert (= (and b!645240 res!418010) b!645229))

(assert (= (and b!645229 res!418017) b!645232))

(assert (= (and b!645232 res!418011) b!645233))

(assert (= (and b!645233 res!418007) b!645250))

(assert (= (and b!645250 res!418023) b!645251))

(assert (= (and b!645250 c!73979) b!645239))

(assert (= (and b!645250 (not c!73979)) b!645241))

(assert (= (and b!645250 (not res!418009)) b!645238))

(assert (= (and b!645238 res!418008) b!645249))

(assert (= (and b!645249 (not res!418025)) b!645235))

(assert (= (and b!645235 res!418022) b!645248))

(assert (= (and b!645238 (not res!418012)) b!645230))

(assert (= (and b!645230 c!73978) b!645245))

(assert (= (and b!645230 (not c!73978)) b!645234))

(assert (= (and b!645230 (not res!418018)) b!645242))

(assert (= (and b!645242 res!418013) b!645236))

(declare-fun m!618761 () Bool)

(assert (=> b!645245 m!618761))

(declare-fun m!618763 () Bool)

(assert (=> b!645245 m!618763))

(assert (=> b!645245 m!618763))

(declare-fun m!618765 () Bool)

(assert (=> b!645245 m!618765))

(declare-fun m!618767 () Bool)

(assert (=> b!645245 m!618767))

(assert (=> b!645245 m!618763))

(declare-fun m!618769 () Bool)

(assert (=> b!645245 m!618769))

(assert (=> b!645245 m!618763))

(declare-fun m!618771 () Bool)

(assert (=> b!645245 m!618771))

(declare-fun m!618773 () Bool)

(assert (=> b!645245 m!618773))

(declare-fun m!618775 () Bool)

(assert (=> b!645245 m!618775))

(assert (=> b!645236 m!618763))

(assert (=> b!645236 m!618763))

(declare-fun m!618777 () Bool)

(assert (=> b!645236 m!618777))

(declare-fun m!618779 () Bool)

(assert (=> b!645231 m!618779))

(declare-fun m!618781 () Bool)

(assert (=> b!645247 m!618781))

(declare-fun m!618783 () Bool)

(assert (=> b!645246 m!618783))

(assert (=> b!645235 m!618763))

(assert (=> b!645235 m!618763))

(declare-fun m!618785 () Bool)

(assert (=> b!645235 m!618785))

(declare-fun m!618787 () Bool)

(assert (=> b!645232 m!618787))

(declare-fun m!618789 () Bool)

(assert (=> b!645232 m!618789))

(declare-fun m!618791 () Bool)

(assert (=> start!58436 m!618791))

(declare-fun m!618793 () Bool)

(assert (=> start!58436 m!618793))

(declare-fun m!618795 () Bool)

(assert (=> b!645243 m!618795))

(declare-fun m!618797 () Bool)

(assert (=> b!645233 m!618797))

(assert (=> b!645233 m!618763))

(assert (=> b!645233 m!618763))

(declare-fun m!618799 () Bool)

(assert (=> b!645233 m!618799))

(assert (=> b!645248 m!618763))

(assert (=> b!645248 m!618763))

(assert (=> b!645248 m!618777))

(assert (=> b!645238 m!618763))

(assert (=> b!645238 m!618787))

(declare-fun m!618801 () Bool)

(assert (=> b!645238 m!618801))

(declare-fun m!618803 () Bool)

(assert (=> b!645250 m!618803))

(declare-fun m!618805 () Bool)

(assert (=> b!645250 m!618805))

(assert (=> b!645250 m!618763))

(declare-fun m!618807 () Bool)

(assert (=> b!645250 m!618807))

(declare-fun m!618809 () Bool)

(assert (=> b!645250 m!618809))

(assert (=> b!645250 m!618787))

(declare-fun m!618811 () Bool)

(assert (=> b!645250 m!618811))

(assert (=> b!645250 m!618763))

(declare-fun m!618813 () Bool)

(assert (=> b!645250 m!618813))

(assert (=> b!645242 m!618763))

(assert (=> b!645242 m!618763))

(declare-fun m!618815 () Bool)

(assert (=> b!645242 m!618815))

(assert (=> b!645242 m!618763))

(declare-fun m!618817 () Bool)

(assert (=> b!645242 m!618817))

(assert (=> b!645242 m!618763))

(assert (=> b!645242 m!618785))

(declare-fun m!618819 () Bool)

(assert (=> b!645229 m!618819))

(declare-fun m!618821 () Bool)

(assert (=> b!645240 m!618821))

(assert (=> b!645237 m!618763))

(assert (=> b!645237 m!618763))

(declare-fun m!618823 () Bool)

(assert (=> b!645237 m!618823))

(assert (=> b!645249 m!618763))

(push 1)

