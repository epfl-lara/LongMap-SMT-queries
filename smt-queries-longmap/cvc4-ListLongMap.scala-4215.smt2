; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57810 () Bool)

(assert start!57810)

(declare-fun b!639362 () Bool)

(declare-fun e!365922 () Bool)

(declare-fun e!365913 () Bool)

(assert (=> b!639362 (= e!365922 e!365913)))

(declare-fun res!413924 () Bool)

(assert (=> b!639362 (=> (not res!413924) (not e!365913))))

(declare-datatypes ((SeekEntryResult!6817 0))(
  ( (MissingZero!6817 (index!29585 (_ BitVec 32))) (Found!6817 (index!29586 (_ BitVec 32))) (Intermediate!6817 (undefined!7629 Bool) (index!29587 (_ BitVec 32)) (x!58340 (_ BitVec 32))) (Undefined!6817) (MissingVacant!6817 (index!29588 (_ BitVec 32))) )
))
(declare-fun lt!295772 () SeekEntryResult!6817)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!639362 (= res!413924 (or (= lt!295772 (MissingZero!6817 i!1108)) (= lt!295772 (MissingVacant!6817 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!38312 0))(
  ( (array!38313 (arr!18377 (Array (_ BitVec 32) (_ BitVec 64))) (size!18741 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38312)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38312 (_ BitVec 32)) SeekEntryResult!6817)

(assert (=> b!639362 (= lt!295772 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!639363 () Bool)

(declare-fun e!365912 () Bool)

(declare-fun e!365916 () Bool)

(assert (=> b!639363 (= e!365912 e!365916)))

(declare-fun res!413916 () Bool)

(assert (=> b!639363 (=> res!413916 e!365916)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!295766 () (_ BitVec 64))

(declare-fun lt!295765 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639363 (= res!413916 (or (not (= (select (arr!18377 a!2986) j!136) lt!295765)) (not (= (select (arr!18377 a!2986) j!136) lt!295766)) (bvsge j!136 index!984)))))

(declare-fun b!639364 () Bool)

(declare-datatypes ((Unit!21602 0))(
  ( (Unit!21603) )
))
(declare-fun e!365920 () Unit!21602)

(declare-fun Unit!21604 () Unit!21602)

(assert (=> b!639364 (= e!365920 Unit!21604)))

(assert (=> b!639364 false))

(declare-fun b!639365 () Bool)

(declare-fun res!413917 () Bool)

(assert (=> b!639365 (=> (not res!413917) (not e!365913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38312 (_ BitVec 32)) Bool)

(assert (=> b!639365 (= res!413917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639366 () Bool)

(declare-fun res!413929 () Bool)

(assert (=> b!639366 (=> (not res!413929) (not e!365922))))

(assert (=> b!639366 (= res!413929 (and (= (size!18741 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18741 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18741 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639367 () Bool)

(declare-fun res!413928 () Bool)

(assert (=> b!639367 (=> (not res!413928) (not e!365922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639367 (= res!413928 (validKeyInArray!0 (select (arr!18377 a!2986) j!136)))))

(declare-fun b!639368 () Bool)

(declare-fun Unit!21605 () Unit!21602)

(assert (=> b!639368 (= e!365920 Unit!21605)))

(declare-fun b!639369 () Bool)

(declare-fun e!365911 () Bool)

(declare-fun e!365921 () Bool)

(assert (=> b!639369 (= e!365911 (not e!365921))))

(declare-fun res!413926 () Bool)

(assert (=> b!639369 (=> res!413926 e!365921)))

(declare-fun lt!295764 () SeekEntryResult!6817)

(assert (=> b!639369 (= res!413926 (not (= lt!295764 (Found!6817 index!984))))))

(declare-fun lt!295769 () Unit!21602)

(assert (=> b!639369 (= lt!295769 e!365920)))

(declare-fun c!73091 () Bool)

(assert (=> b!639369 (= c!73091 (= lt!295764 Undefined!6817))))

(declare-fun lt!295773 () array!38312)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38312 (_ BitVec 32)) SeekEntryResult!6817)

(assert (=> b!639369 (= lt!295764 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295765 lt!295773 mask!3053))))

(declare-fun e!365915 () Bool)

(assert (=> b!639369 e!365915))

(declare-fun res!413921 () Bool)

(assert (=> b!639369 (=> (not res!413921) (not e!365915))))

(declare-fun lt!295770 () SeekEntryResult!6817)

(declare-fun lt!295767 () (_ BitVec 32))

(assert (=> b!639369 (= res!413921 (= lt!295770 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295767 vacantSpotIndex!68 lt!295765 lt!295773 mask!3053)))))

(assert (=> b!639369 (= lt!295770 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295767 vacantSpotIndex!68 (select (arr!18377 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639369 (= lt!295765 (select (store (arr!18377 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295774 () Unit!21602)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38312 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21602)

(assert (=> b!639369 (= lt!295774 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295767 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639369 (= lt!295767 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639370 () Bool)

(declare-fun res!413923 () Bool)

(assert (=> b!639370 (=> (not res!413923) (not e!365913))))

(assert (=> b!639370 (= res!413923 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18377 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639371 () Bool)

(declare-fun e!365914 () Bool)

(assert (=> b!639371 (= e!365913 e!365914)))

(declare-fun res!413930 () Bool)

(assert (=> b!639371 (=> (not res!413930) (not e!365914))))

(assert (=> b!639371 (= res!413930 (= (select (store (arr!18377 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639371 (= lt!295773 (array!38313 (store (arr!18377 a!2986) i!1108 k!1786) (size!18741 a!2986)))))

(declare-fun res!413919 () Bool)

(assert (=> start!57810 (=> (not res!413919) (not e!365922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57810 (= res!413919 (validMask!0 mask!3053))))

(assert (=> start!57810 e!365922))

(assert (=> start!57810 true))

(declare-fun array_inv!14173 (array!38312) Bool)

(assert (=> start!57810 (array_inv!14173 a!2986)))

(declare-fun b!639372 () Bool)

(declare-fun e!365918 () Bool)

(declare-fun arrayContainsKey!0 (array!38312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639372 (= e!365918 (arrayContainsKey!0 lt!295773 (select (arr!18377 a!2986) j!136) index!984))))

(declare-fun b!639373 () Bool)

(declare-fun res!413922 () Bool)

(assert (=> b!639373 (=> (not res!413922) (not e!365922))))

(assert (=> b!639373 (= res!413922 (validKeyInArray!0 k!1786))))

(declare-fun b!639374 () Bool)

(assert (=> b!639374 (= e!365914 e!365911)))

(declare-fun res!413914 () Bool)

(assert (=> b!639374 (=> (not res!413914) (not e!365911))))

(declare-fun lt!295768 () SeekEntryResult!6817)

(assert (=> b!639374 (= res!413914 (and (= lt!295768 (Found!6817 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18377 a!2986) index!984) (select (arr!18377 a!2986) j!136))) (not (= (select (arr!18377 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!639374 (= lt!295768 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18377 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639375 () Bool)

(declare-fun res!413915 () Bool)

(assert (=> b!639375 (=> (not res!413915) (not e!365913))))

(declare-datatypes ((List!12418 0))(
  ( (Nil!12415) (Cons!12414 (h!13459 (_ BitVec 64)) (t!18646 List!12418)) )
))
(declare-fun arrayNoDuplicates!0 (array!38312 (_ BitVec 32) List!12418) Bool)

(assert (=> b!639375 (= res!413915 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12415))))

(declare-fun b!639376 () Bool)

(assert (=> b!639376 (= e!365915 (= lt!295768 lt!295770))))

(declare-fun b!639377 () Bool)

(assert (=> b!639377 (= e!365916 e!365918)))

(declare-fun res!413920 () Bool)

(assert (=> b!639377 (=> (not res!413920) (not e!365918))))

(assert (=> b!639377 (= res!413920 (arrayContainsKey!0 lt!295773 (select (arr!18377 a!2986) j!136) j!136))))

(declare-fun b!639378 () Bool)

(declare-fun res!413927 () Bool)

(assert (=> b!639378 (=> (not res!413927) (not e!365922))))

(assert (=> b!639378 (= res!413927 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639379 () Bool)

(declare-fun e!365919 () Bool)

(assert (=> b!639379 (= e!365921 e!365919)))

(declare-fun res!413925 () Bool)

(assert (=> b!639379 (=> res!413925 e!365919)))

(assert (=> b!639379 (= res!413925 (or (not (= (select (arr!18377 a!2986) j!136) lt!295765)) (not (= (select (arr!18377 a!2986) j!136) lt!295766)) (bvsge j!136 index!984)))))

(assert (=> b!639379 e!365912))

(declare-fun res!413918 () Bool)

(assert (=> b!639379 (=> (not res!413918) (not e!365912))))

(assert (=> b!639379 (= res!413918 (= lt!295766 (select (arr!18377 a!2986) j!136)))))

(assert (=> b!639379 (= lt!295766 (select (store (arr!18377 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!639380 () Bool)

(assert (=> b!639380 (= e!365919 (or (bvsge (size!18741 a!2986) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!18741 a!2986))))))

(assert (=> b!639380 (arrayNoDuplicates!0 lt!295773 #b00000000000000000000000000000000 Nil!12415)))

(declare-fun lt!295763 () Unit!21602)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38312 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12418) Unit!21602)

(assert (=> b!639380 (= lt!295763 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12415))))

(assert (=> b!639380 (arrayContainsKey!0 lt!295773 (select (arr!18377 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295771 () Unit!21602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38312 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21602)

(assert (=> b!639380 (= lt!295771 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295773 (select (arr!18377 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!57810 res!413919) b!639366))

(assert (= (and b!639366 res!413929) b!639367))

(assert (= (and b!639367 res!413928) b!639373))

(assert (= (and b!639373 res!413922) b!639378))

(assert (= (and b!639378 res!413927) b!639362))

(assert (= (and b!639362 res!413924) b!639365))

(assert (= (and b!639365 res!413917) b!639375))

(assert (= (and b!639375 res!413915) b!639370))

(assert (= (and b!639370 res!413923) b!639371))

(assert (= (and b!639371 res!413930) b!639374))

(assert (= (and b!639374 res!413914) b!639369))

(assert (= (and b!639369 res!413921) b!639376))

(assert (= (and b!639369 c!73091) b!639364))

(assert (= (and b!639369 (not c!73091)) b!639368))

(assert (= (and b!639369 (not res!413926)) b!639379))

(assert (= (and b!639379 res!413918) b!639363))

(assert (= (and b!639363 (not res!413916)) b!639377))

(assert (= (and b!639377 res!413920) b!639372))

(assert (= (and b!639379 (not res!413925)) b!639380))

(declare-fun m!613229 () Bool)

(assert (=> b!639362 m!613229))

(declare-fun m!613231 () Bool)

(assert (=> b!639369 m!613231))

(declare-fun m!613233 () Bool)

(assert (=> b!639369 m!613233))

(declare-fun m!613235 () Bool)

(assert (=> b!639369 m!613235))

(declare-fun m!613237 () Bool)

(assert (=> b!639369 m!613237))

(declare-fun m!613239 () Bool)

(assert (=> b!639369 m!613239))

(declare-fun m!613241 () Bool)

(assert (=> b!639369 m!613241))

(assert (=> b!639369 m!613237))

(declare-fun m!613243 () Bool)

(assert (=> b!639369 m!613243))

(declare-fun m!613245 () Bool)

(assert (=> b!639369 m!613245))

(declare-fun m!613247 () Bool)

(assert (=> b!639370 m!613247))

(declare-fun m!613249 () Bool)

(assert (=> b!639374 m!613249))

(assert (=> b!639374 m!613237))

(assert (=> b!639374 m!613237))

(declare-fun m!613251 () Bool)

(assert (=> b!639374 m!613251))

(assert (=> b!639377 m!613237))

(assert (=> b!639377 m!613237))

(declare-fun m!613253 () Bool)

(assert (=> b!639377 m!613253))

(declare-fun m!613255 () Bool)

(assert (=> b!639375 m!613255))

(declare-fun m!613257 () Bool)

(assert (=> b!639365 m!613257))

(assert (=> b!639371 m!613239))

(declare-fun m!613259 () Bool)

(assert (=> b!639371 m!613259))

(assert (=> b!639372 m!613237))

(assert (=> b!639372 m!613237))

(declare-fun m!613261 () Bool)

(assert (=> b!639372 m!613261))

(declare-fun m!613263 () Bool)

(assert (=> b!639373 m!613263))

(assert (=> b!639380 m!613237))

(assert (=> b!639380 m!613237))

(declare-fun m!613265 () Bool)

(assert (=> b!639380 m!613265))

(assert (=> b!639380 m!613237))

(declare-fun m!613267 () Bool)

(assert (=> b!639380 m!613267))

(declare-fun m!613269 () Bool)

(assert (=> b!639380 m!613269))

(declare-fun m!613271 () Bool)

(assert (=> b!639380 m!613271))

(assert (=> b!639363 m!613237))

(assert (=> b!639379 m!613237))

(assert (=> b!639379 m!613239))

(declare-fun m!613273 () Bool)

(assert (=> b!639379 m!613273))

(declare-fun m!613275 () Bool)

(assert (=> b!639378 m!613275))

(assert (=> b!639367 m!613237))

(assert (=> b!639367 m!613237))

(declare-fun m!613277 () Bool)

(assert (=> b!639367 m!613277))

(declare-fun m!613279 () Bool)

(assert (=> start!57810 m!613279))

(declare-fun m!613281 () Bool)

(assert (=> start!57810 m!613281))

(push 1)

(assert (not b!639380))

(assert (not b!639372))

(assert (not b!639378))

(assert (not start!57810))

(assert (not b!639362))

(assert (not b!639369))

(assert (not b!639374))

(assert (not b!639375))

(assert (not b!639367))

(assert (not b!639373))

(assert (not b!639377))

(assert (not b!639365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

