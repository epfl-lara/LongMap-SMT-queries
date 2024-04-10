; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55608 () Bool)

(assert start!55608)

(declare-fun res!392269 () Bool)

(declare-fun e!349260 () Bool)

(assert (=> start!55608 (=> (not res!392269) (not e!349260))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55608 (= res!392269 (validMask!0 mask!3053))))

(assert (=> start!55608 e!349260))

(assert (=> start!55608 true))

(declare-datatypes ((array!37339 0))(
  ( (array!37340 (arr!17920 (Array (_ BitVec 32) (_ BitVec 64))) (size!18284 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37339)

(declare-fun array_inv!13716 (array!37339) Bool)

(assert (=> start!55608 (array_inv!13716 a!2986)))

(declare-fun b!609787 () Bool)

(declare-fun res!392261 () Bool)

(declare-fun e!349262 () Bool)

(assert (=> b!609787 (=> (not res!392261) (not e!349262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37339 (_ BitVec 32)) Bool)

(assert (=> b!609787 (= res!392261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609788 () Bool)

(assert (=> b!609788 (= e!349260 e!349262)))

(declare-fun res!392272 () Bool)

(assert (=> b!609788 (=> (not res!392272) (not e!349262))))

(declare-datatypes ((SeekEntryResult!6360 0))(
  ( (MissingZero!6360 (index!27715 (_ BitVec 32))) (Found!6360 (index!27716 (_ BitVec 32))) (Intermediate!6360 (undefined!7172 Bool) (index!27717 (_ BitVec 32)) (x!56517 (_ BitVec 32))) (Undefined!6360) (MissingVacant!6360 (index!27718 (_ BitVec 32))) )
))
(declare-fun lt!278822 () SeekEntryResult!6360)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!609788 (= res!392272 (or (= lt!278822 (MissingZero!6360 i!1108)) (= lt!278822 (MissingVacant!6360 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37339 (_ BitVec 32)) SeekEntryResult!6360)

(assert (=> b!609788 (= lt!278822 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!609789 () Bool)

(declare-fun res!392263 () Bool)

(assert (=> b!609789 (=> (not res!392263) (not e!349260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609789 (= res!392263 (validKeyInArray!0 k0!1786))))

(declare-fun b!609790 () Bool)

(declare-datatypes ((Unit!19540 0))(
  ( (Unit!19541) )
))
(declare-fun e!349259 () Unit!19540)

(declare-fun Unit!19542 () Unit!19540)

(assert (=> b!609790 (= e!349259 Unit!19542)))

(declare-fun b!609791 () Bool)

(declare-fun e!349257 () Bool)

(assert (=> b!609791 (= e!349262 e!349257)))

(declare-fun res!392255 () Bool)

(assert (=> b!609791 (=> (not res!392255) (not e!349257))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!609791 (= res!392255 (= (select (store (arr!17920 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!278815 () array!37339)

(assert (=> b!609791 (= lt!278815 (array!37340 (store (arr!17920 a!2986) i!1108 k0!1786) (size!18284 a!2986)))))

(declare-fun b!609792 () Bool)

(declare-fun res!392266 () Bool)

(assert (=> b!609792 (=> (not res!392266) (not e!349260))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!609792 (= res!392266 (and (= (size!18284 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18284 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18284 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609793 () Bool)

(declare-fun e!349255 () Unit!19540)

(declare-fun Unit!19543 () Unit!19540)

(assert (=> b!609793 (= e!349255 Unit!19543)))

(declare-fun b!609794 () Bool)

(declare-fun res!392268 () Bool)

(assert (=> b!609794 (=> (not res!392268) (not e!349260))))

(assert (=> b!609794 (= res!392268 (validKeyInArray!0 (select (arr!17920 a!2986) j!136)))))

(declare-fun b!609795 () Bool)

(declare-fun e!349261 () Bool)

(declare-fun e!349258 () Bool)

(assert (=> b!609795 (= e!349261 e!349258)))

(declare-fun res!392257 () Bool)

(assert (=> b!609795 (=> res!392257 e!349258)))

(declare-fun lt!278824 () (_ BitVec 64))

(declare-fun lt!278820 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!609795 (= res!392257 (or (not (= (select (arr!17920 a!2986) j!136) lt!278824)) (not (= (select (arr!17920 a!2986) j!136) lt!278820)) (bvsge j!136 index!984)))))

(declare-fun b!609796 () Bool)

(declare-fun e!349251 () Bool)

(assert (=> b!609796 (= e!349257 e!349251)))

(declare-fun res!392267 () Bool)

(assert (=> b!609796 (=> (not res!392267) (not e!349251))))

(declare-fun lt!278816 () SeekEntryResult!6360)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!609796 (= res!392267 (and (= lt!278816 (Found!6360 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17920 a!2986) index!984) (select (arr!17920 a!2986) j!136))) (not (= (select (arr!17920 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37339 (_ BitVec 32)) SeekEntryResult!6360)

(assert (=> b!609796 (= lt!278816 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17920 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609797 () Bool)

(declare-fun e!349250 () Bool)

(declare-fun arrayContainsKey!0 (array!37339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609797 (= e!349250 (arrayContainsKey!0 lt!278815 (select (arr!17920 a!2986) j!136) index!984))))

(declare-fun b!609798 () Bool)

(declare-fun res!392270 () Bool)

(assert (=> b!609798 (=> (not res!392270) (not e!349260))))

(assert (=> b!609798 (= res!392270 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609799 () Bool)

(declare-fun e!349263 () Bool)

(assert (=> b!609799 (= e!349263 (arrayContainsKey!0 lt!278815 (select (arr!17920 a!2986) j!136) index!984))))

(declare-fun b!609800 () Bool)

(declare-fun e!349256 () Bool)

(declare-fun e!349252 () Bool)

(assert (=> b!609800 (= e!349256 e!349252)))

(declare-fun res!392265 () Bool)

(assert (=> b!609800 (=> res!392265 e!349252)))

(assert (=> b!609800 (= res!392265 (or (not (= (select (arr!17920 a!2986) j!136) lt!278824)) (not (= (select (arr!17920 a!2986) j!136) lt!278820))))))

(assert (=> b!609800 e!349261))

(declare-fun res!392258 () Bool)

(assert (=> b!609800 (=> (not res!392258) (not e!349261))))

(assert (=> b!609800 (= res!392258 (= lt!278820 (select (arr!17920 a!2986) j!136)))))

(assert (=> b!609800 (= lt!278820 (select (store (arr!17920 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!609801 () Bool)

(declare-fun e!349253 () Bool)

(assert (=> b!609801 (= e!349252 e!349253)))

(declare-fun res!392273 () Bool)

(assert (=> b!609801 (=> res!392273 e!349253)))

(assert (=> b!609801 (= res!392273 (bvsge index!984 j!136))))

(declare-fun lt!278817 () Unit!19540)

(assert (=> b!609801 (= lt!278817 e!349255)))

(declare-fun c!69134 () Bool)

(assert (=> b!609801 (= c!69134 (bvslt j!136 index!984))))

(declare-fun b!609802 () Bool)

(declare-fun e!349249 () Bool)

(declare-fun lt!278821 () SeekEntryResult!6360)

(assert (=> b!609802 (= e!349249 (= lt!278816 lt!278821))))

(declare-fun b!609803 () Bool)

(assert (=> b!609803 (= e!349251 (not e!349256))))

(declare-fun res!392264 () Bool)

(assert (=> b!609803 (=> res!392264 e!349256)))

(declare-fun lt!278823 () SeekEntryResult!6360)

(assert (=> b!609803 (= res!392264 (not (= lt!278823 (Found!6360 index!984))))))

(declare-fun lt!278814 () Unit!19540)

(assert (=> b!609803 (= lt!278814 e!349259)))

(declare-fun c!69133 () Bool)

(assert (=> b!609803 (= c!69133 (= lt!278823 Undefined!6360))))

(assert (=> b!609803 (= lt!278823 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278824 lt!278815 mask!3053))))

(assert (=> b!609803 e!349249))

(declare-fun res!392256 () Bool)

(assert (=> b!609803 (=> (not res!392256) (not e!349249))))

(declare-fun lt!278829 () (_ BitVec 32))

(assert (=> b!609803 (= res!392256 (= lt!278821 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278829 vacantSpotIndex!68 lt!278824 lt!278815 mask!3053)))))

(assert (=> b!609803 (= lt!278821 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278829 vacantSpotIndex!68 (select (arr!17920 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!609803 (= lt!278824 (select (store (arr!17920 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278827 () Unit!19540)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37339 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19540)

(assert (=> b!609803 (= lt!278827 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278829 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609803 (= lt!278829 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609804 () Bool)

(declare-fun Unit!19544 () Unit!19540)

(assert (=> b!609804 (= e!349255 Unit!19544)))

(declare-fun lt!278826 () Unit!19540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37339 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19540)

(assert (=> b!609804 (= lt!278826 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278815 (select (arr!17920 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609804 (arrayContainsKey!0 lt!278815 (select (arr!17920 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278828 () Unit!19540)

(declare-datatypes ((List!11961 0))(
  ( (Nil!11958) (Cons!11957 (h!13002 (_ BitVec 64)) (t!18189 List!11961)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37339 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11961) Unit!19540)

(assert (=> b!609804 (= lt!278828 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11958))))

(declare-fun arrayNoDuplicates!0 (array!37339 (_ BitVec 32) List!11961) Bool)

(assert (=> b!609804 (arrayNoDuplicates!0 lt!278815 #b00000000000000000000000000000000 Nil!11958)))

(declare-fun lt!278825 () Unit!19540)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37339 (_ BitVec 32) (_ BitVec 32)) Unit!19540)

(assert (=> b!609804 (= lt!278825 (lemmaNoDuplicateFromThenFromBigger!0 lt!278815 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609804 (arrayNoDuplicates!0 lt!278815 j!136 Nil!11958)))

(declare-fun lt!278830 () Unit!19540)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37339 (_ BitVec 64) (_ BitVec 32) List!11961) Unit!19540)

(assert (=> b!609804 (= lt!278830 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278815 (select (arr!17920 a!2986) j!136) j!136 Nil!11958))))

(assert (=> b!609804 false))

(declare-fun b!609805 () Bool)

(declare-fun Unit!19545 () Unit!19540)

(assert (=> b!609805 (= e!349259 Unit!19545)))

(assert (=> b!609805 false))

(declare-fun b!609806 () Bool)

(assert (=> b!609806 (= e!349258 e!349263)))

(declare-fun res!392260 () Bool)

(assert (=> b!609806 (=> (not res!392260) (not e!349263))))

(assert (=> b!609806 (= res!392260 (arrayContainsKey!0 lt!278815 (select (arr!17920 a!2986) j!136) j!136))))

(declare-fun b!609807 () Bool)

(declare-fun res!392259 () Bool)

(assert (=> b!609807 (=> (not res!392259) (not e!349262))))

(assert (=> b!609807 (= res!392259 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17920 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609808 () Bool)

(declare-fun res!392271 () Bool)

(assert (=> b!609808 (=> (not res!392271) (not e!349262))))

(assert (=> b!609808 (= res!392271 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11958))))

(declare-fun b!609809 () Bool)

(assert (=> b!609809 (= e!349253 (bvsle #b00000000000000000000000000000000 (size!18284 a!2986)))))

(assert (=> b!609809 (arrayNoDuplicates!0 lt!278815 #b00000000000000000000000000000000 Nil!11958)))

(declare-fun lt!278818 () Unit!19540)

(assert (=> b!609809 (= lt!278818 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11958))))

(assert (=> b!609809 (arrayContainsKey!0 lt!278815 (select (arr!17920 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278819 () Unit!19540)

(assert (=> b!609809 (= lt!278819 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278815 (select (arr!17920 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!609809 e!349250))

(declare-fun res!392262 () Bool)

(assert (=> b!609809 (=> (not res!392262) (not e!349250))))

(assert (=> b!609809 (= res!392262 (arrayContainsKey!0 lt!278815 (select (arr!17920 a!2986) j!136) j!136))))

(assert (= (and start!55608 res!392269) b!609792))

(assert (= (and b!609792 res!392266) b!609794))

(assert (= (and b!609794 res!392268) b!609789))

(assert (= (and b!609789 res!392263) b!609798))

(assert (= (and b!609798 res!392270) b!609788))

(assert (= (and b!609788 res!392272) b!609787))

(assert (= (and b!609787 res!392261) b!609808))

(assert (= (and b!609808 res!392271) b!609807))

(assert (= (and b!609807 res!392259) b!609791))

(assert (= (and b!609791 res!392255) b!609796))

(assert (= (and b!609796 res!392267) b!609803))

(assert (= (and b!609803 res!392256) b!609802))

(assert (= (and b!609803 c!69133) b!609805))

(assert (= (and b!609803 (not c!69133)) b!609790))

(assert (= (and b!609803 (not res!392264)) b!609800))

(assert (= (and b!609800 res!392258) b!609795))

(assert (= (and b!609795 (not res!392257)) b!609806))

(assert (= (and b!609806 res!392260) b!609799))

(assert (= (and b!609800 (not res!392265)) b!609801))

(assert (= (and b!609801 c!69134) b!609804))

(assert (= (and b!609801 (not c!69134)) b!609793))

(assert (= (and b!609801 (not res!392273)) b!609809))

(assert (= (and b!609809 res!392262) b!609797))

(declare-fun m!586275 () Bool)

(assert (=> b!609804 m!586275))

(declare-fun m!586277 () Bool)

(assert (=> b!609804 m!586277))

(declare-fun m!586279 () Bool)

(assert (=> b!609804 m!586279))

(assert (=> b!609804 m!586275))

(declare-fun m!586281 () Bool)

(assert (=> b!609804 m!586281))

(assert (=> b!609804 m!586275))

(declare-fun m!586283 () Bool)

(assert (=> b!609804 m!586283))

(declare-fun m!586285 () Bool)

(assert (=> b!609804 m!586285))

(assert (=> b!609804 m!586275))

(declare-fun m!586287 () Bool)

(assert (=> b!609804 m!586287))

(declare-fun m!586289 () Bool)

(assert (=> b!609804 m!586289))

(declare-fun m!586291 () Bool)

(assert (=> b!609788 m!586291))

(declare-fun m!586293 () Bool)

(assert (=> b!609803 m!586293))

(assert (=> b!609803 m!586275))

(declare-fun m!586295 () Bool)

(assert (=> b!609803 m!586295))

(declare-fun m!586297 () Bool)

(assert (=> b!609803 m!586297))

(assert (=> b!609803 m!586275))

(declare-fun m!586299 () Bool)

(assert (=> b!609803 m!586299))

(declare-fun m!586301 () Bool)

(assert (=> b!609803 m!586301))

(declare-fun m!586303 () Bool)

(assert (=> b!609803 m!586303))

(declare-fun m!586305 () Bool)

(assert (=> b!609803 m!586305))

(assert (=> b!609809 m!586275))

(assert (=> b!609809 m!586275))

(declare-fun m!586307 () Bool)

(assert (=> b!609809 m!586307))

(assert (=> b!609809 m!586275))

(declare-fun m!586309 () Bool)

(assert (=> b!609809 m!586309))

(assert (=> b!609809 m!586285))

(assert (=> b!609809 m!586275))

(declare-fun m!586311 () Bool)

(assert (=> b!609809 m!586311))

(assert (=> b!609809 m!586289))

(assert (=> b!609806 m!586275))

(assert (=> b!609806 m!586275))

(assert (=> b!609806 m!586311))

(assert (=> b!609797 m!586275))

(assert (=> b!609797 m!586275))

(declare-fun m!586313 () Bool)

(assert (=> b!609797 m!586313))

(declare-fun m!586315 () Bool)

(assert (=> b!609808 m!586315))

(declare-fun m!586317 () Bool)

(assert (=> b!609796 m!586317))

(assert (=> b!609796 m!586275))

(assert (=> b!609796 m!586275))

(declare-fun m!586319 () Bool)

(assert (=> b!609796 m!586319))

(assert (=> b!609791 m!586295))

(declare-fun m!586321 () Bool)

(assert (=> b!609791 m!586321))

(assert (=> b!609794 m!586275))

(assert (=> b!609794 m!586275))

(declare-fun m!586323 () Bool)

(assert (=> b!609794 m!586323))

(declare-fun m!586325 () Bool)

(assert (=> start!55608 m!586325))

(declare-fun m!586327 () Bool)

(assert (=> start!55608 m!586327))

(assert (=> b!609800 m!586275))

(assert (=> b!609800 m!586295))

(declare-fun m!586329 () Bool)

(assert (=> b!609800 m!586329))

(assert (=> b!609799 m!586275))

(assert (=> b!609799 m!586275))

(assert (=> b!609799 m!586313))

(declare-fun m!586331 () Bool)

(assert (=> b!609787 m!586331))

(assert (=> b!609795 m!586275))

(declare-fun m!586333 () Bool)

(assert (=> b!609798 m!586333))

(declare-fun m!586335 () Bool)

(assert (=> b!609789 m!586335))

(declare-fun m!586337 () Bool)

(assert (=> b!609807 m!586337))

(check-sat (not b!609798) (not b!609808) (not b!609787) (not b!609809) (not b!609803) (not start!55608) (not b!609794) (not b!609804) (not b!609806) (not b!609799) (not b!609797) (not b!609788) (not b!609789) (not b!609796))
(check-sat)
