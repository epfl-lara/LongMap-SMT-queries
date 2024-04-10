; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55116 () Bool)

(assert start!55116)

(declare-fun b!603202 () Bool)

(declare-fun e!345054 () Bool)

(declare-fun e!345049 () Bool)

(assert (=> b!603202 (= e!345054 e!345049)))

(declare-fun res!387340 () Bool)

(assert (=> b!603202 (=> (not res!387340) (not e!345049))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37189 0))(
  ( (array!37190 (arr!17851 (Array (_ BitVec 32) (_ BitVec 64))) (size!18215 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37189)

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!603202 (= res!387340 (= (select (store (arr!17851 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!274846 () array!37189)

(assert (=> b!603202 (= lt!274846 (array!37190 (store (arr!17851 a!2986) i!1108 k0!1786) (size!18215 a!2986)))))

(declare-fun b!603203 () Bool)

(declare-fun e!345050 () Bool)

(declare-fun e!345058 () Bool)

(assert (=> b!603203 (= e!345050 e!345058)))

(declare-fun res!387339 () Bool)

(assert (=> b!603203 (=> res!387339 e!345058)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!274840 () (_ BitVec 64))

(declare-fun lt!274849 () (_ BitVec 64))

(assert (=> b!603203 (= res!387339 (or (not (= (select (arr!17851 a!2986) j!136) lt!274840)) (not (= (select (arr!17851 a!2986) j!136) lt!274849)) (bvsge j!136 index!984)))))

(declare-fun b!603204 () Bool)

(declare-datatypes ((Unit!19126 0))(
  ( (Unit!19127) )
))
(declare-fun e!345060 () Unit!19126)

(declare-fun Unit!19128 () Unit!19126)

(assert (=> b!603204 (= e!345060 Unit!19128)))

(declare-fun b!603205 () Bool)

(declare-fun e!345047 () Bool)

(assert (=> b!603205 (= e!345049 e!345047)))

(declare-fun res!387352 () Bool)

(assert (=> b!603205 (=> (not res!387352) (not e!345047))))

(declare-datatypes ((SeekEntryResult!6291 0))(
  ( (MissingZero!6291 (index!27427 (_ BitVec 32))) (Found!6291 (index!27428 (_ BitVec 32))) (Intermediate!6291 (undefined!7103 Bool) (index!27429 (_ BitVec 32)) (x!56228 (_ BitVec 32))) (Undefined!6291) (MissingVacant!6291 (index!27430 (_ BitVec 32))) )
))
(declare-fun lt!274844 () SeekEntryResult!6291)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!603205 (= res!387352 (and (= lt!274844 (Found!6291 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17851 a!2986) index!984) (select (arr!17851 a!2986) j!136))) (not (= (select (arr!17851 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37189 (_ BitVec 32)) SeekEntryResult!6291)

(assert (=> b!603205 (= lt!274844 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17851 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603206 () Bool)

(declare-fun res!387350 () Bool)

(declare-fun e!345055 () Bool)

(assert (=> b!603206 (=> (not res!387350) (not e!345055))))

(declare-fun arrayContainsKey!0 (array!37189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603206 (= res!387350 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603207 () Bool)

(declare-fun res!387341 () Bool)

(assert (=> b!603207 (=> (not res!387341) (not e!345055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603207 (= res!387341 (validKeyInArray!0 (select (arr!17851 a!2986) j!136)))))

(declare-fun b!603208 () Bool)

(declare-fun e!345051 () Bool)

(assert (=> b!603208 (= e!345058 e!345051)))

(declare-fun res!387355 () Bool)

(assert (=> b!603208 (=> (not res!387355) (not e!345051))))

(assert (=> b!603208 (= res!387355 (arrayContainsKey!0 lt!274846 (select (arr!17851 a!2986) j!136) j!136))))

(declare-fun res!387356 () Bool)

(assert (=> start!55116 (=> (not res!387356) (not e!345055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55116 (= res!387356 (validMask!0 mask!3053))))

(assert (=> start!55116 e!345055))

(assert (=> start!55116 true))

(declare-fun array_inv!13647 (array!37189) Bool)

(assert (=> start!55116 (array_inv!13647 a!2986)))

(declare-fun b!603209 () Bool)

(assert (=> b!603209 (= e!345051 (arrayContainsKey!0 lt!274846 (select (arr!17851 a!2986) j!136) index!984))))

(declare-fun b!603210 () Bool)

(declare-fun res!387338 () Bool)

(assert (=> b!603210 (=> (not res!387338) (not e!345054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37189 (_ BitVec 32)) Bool)

(assert (=> b!603210 (= res!387338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!345056 () Bool)

(declare-fun b!603211 () Bool)

(assert (=> b!603211 (= e!345056 (arrayContainsKey!0 lt!274846 (select (arr!17851 a!2986) j!136) index!984))))

(declare-fun b!603212 () Bool)

(declare-fun e!345048 () Bool)

(assert (=> b!603212 (= e!345048 true)))

(assert (=> b!603212 e!345056))

(declare-fun res!387348 () Bool)

(assert (=> b!603212 (=> (not res!387348) (not e!345056))))

(assert (=> b!603212 (= res!387348 (arrayContainsKey!0 lt!274846 (select (arr!17851 a!2986) j!136) j!136))))

(declare-fun b!603213 () Bool)

(declare-fun res!387346 () Bool)

(assert (=> b!603213 (=> (not res!387346) (not e!345055))))

(assert (=> b!603213 (= res!387346 (validKeyInArray!0 k0!1786))))

(declare-fun b!603214 () Bool)

(declare-fun Unit!19129 () Unit!19126)

(assert (=> b!603214 (= e!345060 Unit!19129)))

(declare-fun lt!274842 () Unit!19126)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37189 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19126)

(assert (=> b!603214 (= lt!274842 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274846 (select (arr!17851 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603214 (arrayContainsKey!0 lt!274846 (select (arr!17851 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274847 () Unit!19126)

(declare-datatypes ((List!11892 0))(
  ( (Nil!11889) (Cons!11888 (h!12933 (_ BitVec 64)) (t!18120 List!11892)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37189 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11892) Unit!19126)

(assert (=> b!603214 (= lt!274847 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11889))))

(declare-fun arrayNoDuplicates!0 (array!37189 (_ BitVec 32) List!11892) Bool)

(assert (=> b!603214 (arrayNoDuplicates!0 lt!274846 #b00000000000000000000000000000000 Nil!11889)))

(declare-fun lt!274850 () Unit!19126)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37189 (_ BitVec 32) (_ BitVec 32)) Unit!19126)

(assert (=> b!603214 (= lt!274850 (lemmaNoDuplicateFromThenFromBigger!0 lt!274846 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603214 (arrayNoDuplicates!0 lt!274846 j!136 Nil!11889)))

(declare-fun lt!274839 () Unit!19126)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37189 (_ BitVec 64) (_ BitVec 32) List!11892) Unit!19126)

(assert (=> b!603214 (= lt!274839 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274846 (select (arr!17851 a!2986) j!136) j!136 Nil!11889))))

(assert (=> b!603214 false))

(declare-fun b!603215 () Bool)

(declare-fun res!387349 () Bool)

(assert (=> b!603215 (=> (not res!387349) (not e!345055))))

(assert (=> b!603215 (= res!387349 (and (= (size!18215 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18215 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18215 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603216 () Bool)

(declare-fun res!387351 () Bool)

(assert (=> b!603216 (=> (not res!387351) (not e!345054))))

(assert (=> b!603216 (= res!387351 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17851 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603217 () Bool)

(declare-fun e!345059 () Bool)

(declare-fun lt!274848 () SeekEntryResult!6291)

(assert (=> b!603217 (= e!345059 (= lt!274844 lt!274848))))

(declare-fun b!603218 () Bool)

(declare-fun e!345053 () Bool)

(assert (=> b!603218 (= e!345053 e!345048)))

(declare-fun res!387347 () Bool)

(assert (=> b!603218 (=> res!387347 e!345048)))

(assert (=> b!603218 (= res!387347 (bvsge index!984 j!136))))

(declare-fun lt!274841 () Unit!19126)

(assert (=> b!603218 (= lt!274841 e!345060)))

(declare-fun c!68299 () Bool)

(assert (=> b!603218 (= c!68299 (bvslt j!136 index!984))))

(declare-fun b!603219 () Bool)

(declare-fun e!345052 () Unit!19126)

(declare-fun Unit!19130 () Unit!19126)

(assert (=> b!603219 (= e!345052 Unit!19130)))

(assert (=> b!603219 false))

(declare-fun b!603220 () Bool)

(declare-fun res!387345 () Bool)

(assert (=> b!603220 (=> (not res!387345) (not e!345054))))

(assert (=> b!603220 (= res!387345 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11889))))

(declare-fun b!603221 () Bool)

(assert (=> b!603221 (= e!345055 e!345054)))

(declare-fun res!387344 () Bool)

(assert (=> b!603221 (=> (not res!387344) (not e!345054))))

(declare-fun lt!274843 () SeekEntryResult!6291)

(assert (=> b!603221 (= res!387344 (or (= lt!274843 (MissingZero!6291 i!1108)) (= lt!274843 (MissingVacant!6291 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37189 (_ BitVec 32)) SeekEntryResult!6291)

(assert (=> b!603221 (= lt!274843 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603222 () Bool)

(declare-fun e!345046 () Bool)

(assert (=> b!603222 (= e!345047 (not e!345046))))

(declare-fun res!387353 () Bool)

(assert (=> b!603222 (=> res!387353 e!345046)))

(declare-fun lt!274852 () SeekEntryResult!6291)

(assert (=> b!603222 (= res!387353 (not (= lt!274852 (Found!6291 index!984))))))

(declare-fun lt!274845 () Unit!19126)

(assert (=> b!603222 (= lt!274845 e!345052)))

(declare-fun c!68300 () Bool)

(assert (=> b!603222 (= c!68300 (= lt!274852 Undefined!6291))))

(assert (=> b!603222 (= lt!274852 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274840 lt!274846 mask!3053))))

(assert (=> b!603222 e!345059))

(declare-fun res!387354 () Bool)

(assert (=> b!603222 (=> (not res!387354) (not e!345059))))

(declare-fun lt!274838 () (_ BitVec 32))

(assert (=> b!603222 (= res!387354 (= lt!274848 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274838 vacantSpotIndex!68 lt!274840 lt!274846 mask!3053)))))

(assert (=> b!603222 (= lt!274848 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274838 vacantSpotIndex!68 (select (arr!17851 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603222 (= lt!274840 (select (store (arr!17851 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274851 () Unit!19126)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37189 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19126)

(assert (=> b!603222 (= lt!274851 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274838 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603222 (= lt!274838 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603223 () Bool)

(declare-fun Unit!19131 () Unit!19126)

(assert (=> b!603223 (= e!345052 Unit!19131)))

(declare-fun b!603224 () Bool)

(assert (=> b!603224 (= e!345046 e!345053)))

(declare-fun res!387342 () Bool)

(assert (=> b!603224 (=> res!387342 e!345053)))

(assert (=> b!603224 (= res!387342 (or (not (= (select (arr!17851 a!2986) j!136) lt!274840)) (not (= (select (arr!17851 a!2986) j!136) lt!274849))))))

(assert (=> b!603224 e!345050))

(declare-fun res!387343 () Bool)

(assert (=> b!603224 (=> (not res!387343) (not e!345050))))

(assert (=> b!603224 (= res!387343 (= lt!274849 (select (arr!17851 a!2986) j!136)))))

(assert (=> b!603224 (= lt!274849 (select (store (arr!17851 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!55116 res!387356) b!603215))

(assert (= (and b!603215 res!387349) b!603207))

(assert (= (and b!603207 res!387341) b!603213))

(assert (= (and b!603213 res!387346) b!603206))

(assert (= (and b!603206 res!387350) b!603221))

(assert (= (and b!603221 res!387344) b!603210))

(assert (= (and b!603210 res!387338) b!603220))

(assert (= (and b!603220 res!387345) b!603216))

(assert (= (and b!603216 res!387351) b!603202))

(assert (= (and b!603202 res!387340) b!603205))

(assert (= (and b!603205 res!387352) b!603222))

(assert (= (and b!603222 res!387354) b!603217))

(assert (= (and b!603222 c!68300) b!603219))

(assert (= (and b!603222 (not c!68300)) b!603223))

(assert (= (and b!603222 (not res!387353)) b!603224))

(assert (= (and b!603224 res!387343) b!603203))

(assert (= (and b!603203 (not res!387339)) b!603208))

(assert (= (and b!603208 res!387355) b!603209))

(assert (= (and b!603224 (not res!387342)) b!603218))

(assert (= (and b!603218 c!68299) b!603214))

(assert (= (and b!603218 (not c!68299)) b!603204))

(assert (= (and b!603218 (not res!387347)) b!603212))

(assert (= (and b!603212 res!387348) b!603211))

(declare-fun m!580253 () Bool)

(assert (=> b!603213 m!580253))

(declare-fun m!580255 () Bool)

(assert (=> b!603202 m!580255))

(declare-fun m!580257 () Bool)

(assert (=> b!603202 m!580257))

(declare-fun m!580259 () Bool)

(assert (=> b!603203 m!580259))

(assert (=> b!603211 m!580259))

(assert (=> b!603211 m!580259))

(declare-fun m!580261 () Bool)

(assert (=> b!603211 m!580261))

(declare-fun m!580263 () Bool)

(assert (=> b!603205 m!580263))

(assert (=> b!603205 m!580259))

(assert (=> b!603205 m!580259))

(declare-fun m!580265 () Bool)

(assert (=> b!603205 m!580265))

(declare-fun m!580267 () Bool)

(assert (=> b!603206 m!580267))

(declare-fun m!580269 () Bool)

(assert (=> b!603210 m!580269))

(declare-fun m!580271 () Bool)

(assert (=> b!603222 m!580271))

(assert (=> b!603222 m!580259))

(declare-fun m!580273 () Bool)

(assert (=> b!603222 m!580273))

(assert (=> b!603222 m!580255))

(declare-fun m!580275 () Bool)

(assert (=> b!603222 m!580275))

(declare-fun m!580277 () Bool)

(assert (=> b!603222 m!580277))

(assert (=> b!603222 m!580259))

(declare-fun m!580279 () Bool)

(assert (=> b!603222 m!580279))

(declare-fun m!580281 () Bool)

(assert (=> b!603222 m!580281))

(declare-fun m!580283 () Bool)

(assert (=> b!603220 m!580283))

(assert (=> b!603208 m!580259))

(assert (=> b!603208 m!580259))

(declare-fun m!580285 () Bool)

(assert (=> b!603208 m!580285))

(declare-fun m!580287 () Bool)

(assert (=> b!603221 m!580287))

(assert (=> b!603209 m!580259))

(assert (=> b!603209 m!580259))

(assert (=> b!603209 m!580261))

(assert (=> b!603212 m!580259))

(assert (=> b!603212 m!580259))

(assert (=> b!603212 m!580285))

(assert (=> b!603214 m!580259))

(declare-fun m!580289 () Bool)

(assert (=> b!603214 m!580289))

(assert (=> b!603214 m!580259))

(declare-fun m!580291 () Bool)

(assert (=> b!603214 m!580291))

(assert (=> b!603214 m!580259))

(declare-fun m!580293 () Bool)

(assert (=> b!603214 m!580293))

(declare-fun m!580295 () Bool)

(assert (=> b!603214 m!580295))

(declare-fun m!580297 () Bool)

(assert (=> b!603214 m!580297))

(assert (=> b!603214 m!580259))

(declare-fun m!580299 () Bool)

(assert (=> b!603214 m!580299))

(declare-fun m!580301 () Bool)

(assert (=> b!603214 m!580301))

(declare-fun m!580303 () Bool)

(assert (=> b!603216 m!580303))

(assert (=> b!603224 m!580259))

(assert (=> b!603224 m!580255))

(declare-fun m!580305 () Bool)

(assert (=> b!603224 m!580305))

(assert (=> b!603207 m!580259))

(assert (=> b!603207 m!580259))

(declare-fun m!580307 () Bool)

(assert (=> b!603207 m!580307))

(declare-fun m!580309 () Bool)

(assert (=> start!55116 m!580309))

(declare-fun m!580311 () Bool)

(assert (=> start!55116 m!580311))

(check-sat (not b!603222) (not b!603208) (not b!603213) (not b!603220) (not b!603207) (not b!603212) (not b!603211) (not b!603221) (not start!55116) (not b!603210) (not b!603214) (not b!603205) (not b!603206) (not b!603209))
(check-sat)
