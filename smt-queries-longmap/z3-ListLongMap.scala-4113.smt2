; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56226 () Bool)

(assert start!56226)

(declare-fun b!622058 () Bool)

(declare-fun res!400848 () Bool)

(declare-fun e!356807 () Bool)

(assert (=> b!622058 (=> (not res!400848) (not e!356807))))

(declare-datatypes ((array!37641 0))(
  ( (array!37642 (arr!18064 (Array (_ BitVec 32) (_ BitVec 64))) (size!18428 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37641)

(declare-datatypes ((List!12012 0))(
  ( (Nil!12009) (Cons!12008 (h!13056 (_ BitVec 64)) (t!18232 List!12012)) )
))
(declare-fun arrayNoDuplicates!0 (array!37641 (_ BitVec 32) List!12012) Bool)

(assert (=> b!622058 (= res!400848 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12009))))

(declare-fun b!622059 () Bool)

(declare-datatypes ((Unit!20797 0))(
  ( (Unit!20798) )
))
(declare-fun e!356799 () Unit!20797)

(declare-fun Unit!20799 () Unit!20797)

(assert (=> b!622059 (= e!356799 Unit!20799)))

(assert (=> b!622059 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun res!400843 () Bool)

(declare-fun lt!288000 () array!37641)

(declare-fun b!622060 () Bool)

(declare-fun arrayContainsKey!0 (array!37641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622060 (= res!400843 (arrayContainsKey!0 lt!288000 (select (arr!18064 a!2986) j!136) j!136))))

(declare-fun e!356798 () Bool)

(assert (=> b!622060 (=> (not res!400843) (not e!356798))))

(declare-fun e!356811 () Bool)

(assert (=> b!622060 (= e!356811 e!356798)))

(declare-fun b!622061 () Bool)

(declare-fun e!356803 () Unit!20797)

(declare-fun Unit!20800 () Unit!20797)

(assert (=> b!622061 (= e!356803 Unit!20800)))

(declare-fun b!622062 () Bool)

(declare-fun e!356800 () Bool)

(assert (=> b!622062 (= e!356800 e!356807)))

(declare-fun res!400858 () Bool)

(assert (=> b!622062 (=> (not res!400858) (not e!356807))))

(declare-datatypes ((SeekEntryResult!6460 0))(
  ( (MissingZero!6460 (index!28124 (_ BitVec 32))) (Found!6460 (index!28125 (_ BitVec 32))) (Intermediate!6460 (undefined!7272 Bool) (index!28126 (_ BitVec 32)) (x!57047 (_ BitVec 32))) (Undefined!6460) (MissingVacant!6460 (index!28127 (_ BitVec 32))) )
))
(declare-fun lt!288019 () SeekEntryResult!6460)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!622062 (= res!400858 (or (= lt!288019 (MissingZero!6460 i!1108)) (= lt!288019 (MissingVacant!6460 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37641 (_ BitVec 32)) SeekEntryResult!6460)

(assert (=> b!622062 (= lt!288019 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!622063 () Bool)

(declare-fun res!400846 () Bool)

(assert (=> b!622063 (=> (not res!400846) (not e!356800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622063 (= res!400846 (validKeyInArray!0 (select (arr!18064 a!2986) j!136)))))

(declare-fun b!622064 () Bool)

(declare-fun Unit!20801 () Unit!20797)

(assert (=> b!622064 (= e!356803 Unit!20801)))

(declare-fun res!400851 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!622064 (= res!400851 (= (select (store (arr!18064 a!2986) i!1108 k0!1786) index!984) (select (arr!18064 a!2986) j!136)))))

(declare-fun e!356805 () Bool)

(assert (=> b!622064 (=> (not res!400851) (not e!356805))))

(assert (=> b!622064 e!356805))

(declare-fun c!70977 () Bool)

(assert (=> b!622064 (= c!70977 (bvslt j!136 index!984))))

(declare-fun lt!288015 () Unit!20797)

(declare-fun e!356804 () Unit!20797)

(assert (=> b!622064 (= lt!288015 e!356804)))

(declare-fun c!70978 () Bool)

(assert (=> b!622064 (= c!70978 (bvslt index!984 j!136))))

(declare-fun lt!288002 () Unit!20797)

(declare-fun e!356802 () Unit!20797)

(assert (=> b!622064 (= lt!288002 e!356802)))

(assert (=> b!622064 false))

(declare-fun b!622065 () Bool)

(declare-fun Unit!20802 () Unit!20797)

(assert (=> b!622065 (= e!356804 Unit!20802)))

(declare-fun b!622066 () Bool)

(declare-fun Unit!20803 () Unit!20797)

(assert (=> b!622066 (= e!356799 Unit!20803)))

(declare-fun b!622067 () Bool)

(declare-fun res!400852 () Bool)

(assert (=> b!622067 (= res!400852 (bvsge j!136 index!984))))

(assert (=> b!622067 (=> res!400852 e!356811)))

(assert (=> b!622067 (= e!356805 e!356811)))

(declare-fun b!622068 () Bool)

(assert (=> b!622068 false))

(declare-fun lt!288007 () Unit!20797)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37641 (_ BitVec 64) (_ BitVec 32) List!12012) Unit!20797)

(assert (=> b!622068 (= lt!288007 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288000 (select (arr!18064 a!2986) j!136) index!984 Nil!12009))))

(assert (=> b!622068 (arrayNoDuplicates!0 lt!288000 index!984 Nil!12009)))

(declare-fun lt!288004 () Unit!20797)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37641 (_ BitVec 32) (_ BitVec 32)) Unit!20797)

(assert (=> b!622068 (= lt!288004 (lemmaNoDuplicateFromThenFromBigger!0 lt!288000 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622068 (arrayNoDuplicates!0 lt!288000 #b00000000000000000000000000000000 Nil!12009)))

(declare-fun lt!288018 () Unit!20797)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37641 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12012) Unit!20797)

(assert (=> b!622068 (= lt!288018 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12009))))

(assert (=> b!622068 (arrayContainsKey!0 lt!288000 (select (arr!18064 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288008 () Unit!20797)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37641 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20797)

(assert (=> b!622068 (= lt!288008 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288000 (select (arr!18064 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356809 () Bool)

(assert (=> b!622068 e!356809))

(declare-fun res!400853 () Bool)

(assert (=> b!622068 (=> (not res!400853) (not e!356809))))

(assert (=> b!622068 (= res!400853 (arrayContainsKey!0 lt!288000 (select (arr!18064 a!2986) j!136) j!136))))

(declare-fun Unit!20804 () Unit!20797)

(assert (=> b!622068 (= e!356802 Unit!20804)))

(declare-fun b!622069 () Bool)

(declare-fun e!356808 () Bool)

(assert (=> b!622069 (= e!356807 e!356808)))

(declare-fun res!400845 () Bool)

(assert (=> b!622069 (=> (not res!400845) (not e!356808))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!622069 (= res!400845 (= (select (store (arr!18064 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622069 (= lt!288000 (array!37642 (store (arr!18064 a!2986) i!1108 k0!1786) (size!18428 a!2986)))))

(declare-fun b!622070 () Bool)

(declare-fun res!400850 () Bool)

(assert (=> b!622070 (=> (not res!400850) (not e!356800))))

(assert (=> b!622070 (= res!400850 (and (= (size!18428 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18428 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18428 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622071 () Bool)

(assert (=> b!622071 (= e!356809 (arrayContainsKey!0 lt!288000 (select (arr!18064 a!2986) j!136) index!984))))

(declare-fun b!622072 () Bool)

(assert (=> b!622072 false))

(declare-fun lt!288014 () Unit!20797)

(assert (=> b!622072 (= lt!288014 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288000 (select (arr!18064 a!2986) j!136) j!136 Nil!12009))))

(assert (=> b!622072 (arrayNoDuplicates!0 lt!288000 j!136 Nil!12009)))

(declare-fun lt!288012 () Unit!20797)

(assert (=> b!622072 (= lt!288012 (lemmaNoDuplicateFromThenFromBigger!0 lt!288000 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622072 (arrayNoDuplicates!0 lt!288000 #b00000000000000000000000000000000 Nil!12009)))

(declare-fun lt!288013 () Unit!20797)

(assert (=> b!622072 (= lt!288013 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12009))))

(assert (=> b!622072 (arrayContainsKey!0 lt!288000 (select (arr!18064 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288017 () Unit!20797)

(assert (=> b!622072 (= lt!288017 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288000 (select (arr!18064 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20805 () Unit!20797)

(assert (=> b!622072 (= e!356804 Unit!20805)))

(declare-fun res!400849 () Bool)

(assert (=> start!56226 (=> (not res!400849) (not e!356800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56226 (= res!400849 (validMask!0 mask!3053))))

(assert (=> start!56226 e!356800))

(assert (=> start!56226 true))

(declare-fun array_inv!13923 (array!37641) Bool)

(assert (=> start!56226 (array_inv!13923 a!2986)))

(declare-fun b!622073 () Bool)

(declare-fun res!400857 () Bool)

(assert (=> b!622073 (=> (not res!400857) (not e!356800))))

(assert (=> b!622073 (= res!400857 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622074 () Bool)

(declare-fun res!400855 () Bool)

(assert (=> b!622074 (=> (not res!400855) (not e!356807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37641 (_ BitVec 32)) Bool)

(assert (=> b!622074 (= res!400855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622075 () Bool)

(declare-fun e!356810 () Bool)

(assert (=> b!622075 (= e!356808 e!356810)))

(declare-fun res!400854 () Bool)

(assert (=> b!622075 (=> (not res!400854) (not e!356810))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!288011 () SeekEntryResult!6460)

(assert (=> b!622075 (= res!400854 (and (= lt!288011 (Found!6460 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18064 a!2986) index!984) (select (arr!18064 a!2986) j!136))) (not (= (select (arr!18064 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37641 (_ BitVec 32)) SeekEntryResult!6460)

(assert (=> b!622075 (= lt!288011 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18064 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622076 () Bool)

(declare-fun e!356801 () Bool)

(declare-fun lt!288009 () SeekEntryResult!6460)

(assert (=> b!622076 (= e!356801 (= lt!288011 lt!288009))))

(declare-fun b!622077 () Bool)

(declare-fun res!400856 () Bool)

(assert (=> b!622077 (=> (not res!400856) (not e!356807))))

(assert (=> b!622077 (= res!400856 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18064 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622078 () Bool)

(assert (=> b!622078 (= e!356798 (arrayContainsKey!0 lt!288000 (select (arr!18064 a!2986) j!136) index!984))))

(declare-fun b!622079 () Bool)

(declare-fun Unit!20806 () Unit!20797)

(assert (=> b!622079 (= e!356802 Unit!20806)))

(declare-fun b!622080 () Bool)

(declare-fun res!400844 () Bool)

(assert (=> b!622080 (=> (not res!400844) (not e!356800))))

(assert (=> b!622080 (= res!400844 (validKeyInArray!0 k0!1786))))

(declare-fun b!622081 () Bool)

(assert (=> b!622081 (= e!356810 (not true))))

(declare-fun lt!288005 () Unit!20797)

(assert (=> b!622081 (= lt!288005 e!356803)))

(declare-fun c!70976 () Bool)

(declare-fun lt!288006 () SeekEntryResult!6460)

(assert (=> b!622081 (= c!70976 (= lt!288006 (Found!6460 index!984)))))

(declare-fun lt!288001 () Unit!20797)

(assert (=> b!622081 (= lt!288001 e!356799)))

(declare-fun c!70979 () Bool)

(assert (=> b!622081 (= c!70979 (= lt!288006 Undefined!6460))))

(declare-fun lt!288016 () (_ BitVec 64))

(assert (=> b!622081 (= lt!288006 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288016 lt!288000 mask!3053))))

(assert (=> b!622081 e!356801))

(declare-fun res!400847 () Bool)

(assert (=> b!622081 (=> (not res!400847) (not e!356801))))

(declare-fun lt!288010 () (_ BitVec 32))

(assert (=> b!622081 (= res!400847 (= lt!288009 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288010 vacantSpotIndex!68 lt!288016 lt!288000 mask!3053)))))

(assert (=> b!622081 (= lt!288009 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288010 vacantSpotIndex!68 (select (arr!18064 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622081 (= lt!288016 (select (store (arr!18064 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288003 () Unit!20797)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20797)

(assert (=> b!622081 (= lt!288003 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288010 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622081 (= lt!288010 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (= (and start!56226 res!400849) b!622070))

(assert (= (and b!622070 res!400850) b!622063))

(assert (= (and b!622063 res!400846) b!622080))

(assert (= (and b!622080 res!400844) b!622073))

(assert (= (and b!622073 res!400857) b!622062))

(assert (= (and b!622062 res!400858) b!622074))

(assert (= (and b!622074 res!400855) b!622058))

(assert (= (and b!622058 res!400848) b!622077))

(assert (= (and b!622077 res!400856) b!622069))

(assert (= (and b!622069 res!400845) b!622075))

(assert (= (and b!622075 res!400854) b!622081))

(assert (= (and b!622081 res!400847) b!622076))

(assert (= (and b!622081 c!70979) b!622059))

(assert (= (and b!622081 (not c!70979)) b!622066))

(assert (= (and b!622081 c!70976) b!622064))

(assert (= (and b!622081 (not c!70976)) b!622061))

(assert (= (and b!622064 res!400851) b!622067))

(assert (= (and b!622067 (not res!400852)) b!622060))

(assert (= (and b!622060 res!400843) b!622078))

(assert (= (and b!622064 c!70977) b!622072))

(assert (= (and b!622064 (not c!70977)) b!622065))

(assert (= (and b!622064 c!70978) b!622068))

(assert (= (and b!622064 (not c!70978)) b!622079))

(assert (= (and b!622068 res!400853) b!622071))

(declare-fun m!598217 () Bool)

(assert (=> b!622072 m!598217))

(declare-fun m!598219 () Bool)

(assert (=> b!622072 m!598219))

(declare-fun m!598221 () Bool)

(assert (=> b!622072 m!598221))

(assert (=> b!622072 m!598219))

(declare-fun m!598223 () Bool)

(assert (=> b!622072 m!598223))

(declare-fun m!598225 () Bool)

(assert (=> b!622072 m!598225))

(assert (=> b!622072 m!598219))

(declare-fun m!598227 () Bool)

(assert (=> b!622072 m!598227))

(assert (=> b!622072 m!598219))

(declare-fun m!598229 () Bool)

(assert (=> b!622072 m!598229))

(declare-fun m!598231 () Bool)

(assert (=> b!622072 m!598231))

(declare-fun m!598233 () Bool)

(assert (=> b!622075 m!598233))

(assert (=> b!622075 m!598219))

(assert (=> b!622075 m!598219))

(declare-fun m!598235 () Bool)

(assert (=> b!622075 m!598235))

(assert (=> b!622060 m!598219))

(assert (=> b!622060 m!598219))

(declare-fun m!598237 () Bool)

(assert (=> b!622060 m!598237))

(assert (=> b!622078 m!598219))

(assert (=> b!622078 m!598219))

(declare-fun m!598239 () Bool)

(assert (=> b!622078 m!598239))

(declare-fun m!598241 () Bool)

(assert (=> b!622080 m!598241))

(declare-fun m!598243 () Bool)

(assert (=> b!622073 m!598243))

(declare-fun m!598245 () Bool)

(assert (=> b!622062 m!598245))

(declare-fun m!598247 () Bool)

(assert (=> b!622081 m!598247))

(declare-fun m!598249 () Bool)

(assert (=> b!622081 m!598249))

(assert (=> b!622081 m!598219))

(declare-fun m!598251 () Bool)

(assert (=> b!622081 m!598251))

(declare-fun m!598253 () Bool)

(assert (=> b!622081 m!598253))

(assert (=> b!622081 m!598219))

(declare-fun m!598255 () Bool)

(assert (=> b!622081 m!598255))

(declare-fun m!598257 () Bool)

(assert (=> b!622081 m!598257))

(declare-fun m!598259 () Bool)

(assert (=> b!622081 m!598259))

(declare-fun m!598261 () Bool)

(assert (=> b!622068 m!598261))

(assert (=> b!622068 m!598219))

(assert (=> b!622068 m!598223))

(assert (=> b!622068 m!598219))

(assert (=> b!622068 m!598237))

(assert (=> b!622068 m!598219))

(declare-fun m!598263 () Bool)

(assert (=> b!622068 m!598263))

(assert (=> b!622068 m!598219))

(declare-fun m!598265 () Bool)

(assert (=> b!622068 m!598265))

(assert (=> b!622068 m!598231))

(assert (=> b!622068 m!598219))

(declare-fun m!598267 () Bool)

(assert (=> b!622068 m!598267))

(declare-fun m!598269 () Bool)

(assert (=> b!622068 m!598269))

(declare-fun m!598271 () Bool)

(assert (=> start!56226 m!598271))

(declare-fun m!598273 () Bool)

(assert (=> start!56226 m!598273))

(assert (=> b!622069 m!598259))

(declare-fun m!598275 () Bool)

(assert (=> b!622069 m!598275))

(assert (=> b!622064 m!598259))

(declare-fun m!598277 () Bool)

(assert (=> b!622064 m!598277))

(assert (=> b!622064 m!598219))

(declare-fun m!598279 () Bool)

(assert (=> b!622058 m!598279))

(assert (=> b!622063 m!598219))

(assert (=> b!622063 m!598219))

(declare-fun m!598281 () Bool)

(assert (=> b!622063 m!598281))

(declare-fun m!598283 () Bool)

(assert (=> b!622074 m!598283))

(declare-fun m!598285 () Bool)

(assert (=> b!622077 m!598285))

(assert (=> b!622071 m!598219))

(assert (=> b!622071 m!598219))

(assert (=> b!622071 m!598239))

(check-sat (not b!622060) (not b!622081) (not b!622072) (not b!622074) (not b!622063) (not b!622078) (not b!622080) (not b!622073) (not b!622062) (not b!622071) (not b!622075) (not start!56226) (not b!622068) (not b!622058))
(check-sat)
