; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57812 () Bool)

(assert start!57812)

(declare-fun b!639465 () Bool)

(declare-fun e!365978 () Bool)

(declare-fun e!365975 () Bool)

(assert (=> b!639465 (= e!365978 (not e!365975))))

(declare-fun res!414136 () Bool)

(assert (=> b!639465 (=> res!414136 e!365975)))

(declare-datatypes ((SeekEntryResult!6820 0))(
  ( (MissingZero!6820 (index!29597 (_ BitVec 32))) (Found!6820 (index!29598 (_ BitVec 32))) (Intermediate!6820 (undefined!7632 Bool) (index!29599 (_ BitVec 32)) (x!58362 (_ BitVec 32))) (Undefined!6820) (MissingVacant!6820 (index!29600 (_ BitVec 32))) )
))
(declare-fun lt!295766 () SeekEntryResult!6820)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639465 (= res!414136 (not (= lt!295766 (Found!6820 index!984))))))

(declare-datatypes ((Unit!21608 0))(
  ( (Unit!21609) )
))
(declare-fun lt!295767 () Unit!21608)

(declare-fun e!365979 () Unit!21608)

(assert (=> b!639465 (= lt!295767 e!365979)))

(declare-fun c!73032 () Bool)

(assert (=> b!639465 (= c!73032 (= lt!295766 Undefined!6820))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!295764 () (_ BitVec 64))

(declare-datatypes ((array!38325 0))(
  ( (array!38326 (arr!18383 (Array (_ BitVec 32) (_ BitVec 64))) (size!18748 (_ BitVec 32))) )
))
(declare-fun lt!295762 () array!38325)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38325 (_ BitVec 32)) SeekEntryResult!6820)

(assert (=> b!639465 (= lt!295766 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295764 lt!295762 mask!3053))))

(declare-fun e!365977 () Bool)

(assert (=> b!639465 e!365977))

(declare-fun res!414148 () Bool)

(assert (=> b!639465 (=> (not res!414148) (not e!365977))))

(declare-fun lt!295761 () SeekEntryResult!6820)

(declare-fun lt!295763 () (_ BitVec 32))

(assert (=> b!639465 (= res!414148 (= lt!295761 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295763 vacantSpotIndex!68 lt!295764 lt!295762 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38325)

(assert (=> b!639465 (= lt!295761 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295763 vacantSpotIndex!68 (select (arr!18383 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!639465 (= lt!295764 (select (store (arr!18383 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295771 () Unit!21608)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21608)

(assert (=> b!639465 (= lt!295771 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295763 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639465 (= lt!295763 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639466 () Bool)

(declare-fun e!365982 () Bool)

(declare-fun e!365984 () Bool)

(assert (=> b!639466 (= e!365982 e!365984)))

(declare-fun res!414141 () Bool)

(assert (=> b!639466 (=> (not res!414141) (not e!365984))))

(declare-fun lt!295772 () SeekEntryResult!6820)

(assert (=> b!639466 (= res!414141 (or (= lt!295772 (MissingZero!6820 i!1108)) (= lt!295772 (MissingVacant!6820 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38325 (_ BitVec 32)) SeekEntryResult!6820)

(assert (=> b!639466 (= lt!295772 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!639467 () Bool)

(declare-fun res!414142 () Bool)

(assert (=> b!639467 (=> (not res!414142) (not e!365984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38325 (_ BitVec 32)) Bool)

(assert (=> b!639467 (= res!414142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639468 () Bool)

(declare-fun e!365980 () Bool)

(assert (=> b!639468 (= e!365984 e!365980)))

(declare-fun res!414145 () Bool)

(assert (=> b!639468 (=> (not res!414145) (not e!365980))))

(assert (=> b!639468 (= res!414145 (= (select (store (arr!18383 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639468 (= lt!295762 (array!38326 (store (arr!18383 a!2986) i!1108 k0!1786) (size!18748 a!2986)))))

(declare-fun b!639469 () Bool)

(declare-fun lt!295770 () SeekEntryResult!6820)

(assert (=> b!639469 (= e!365977 (= lt!295770 lt!295761))))

(declare-fun b!639470 () Bool)

(declare-fun res!414147 () Bool)

(assert (=> b!639470 (=> (not res!414147) (not e!365982))))

(declare-fun arrayContainsKey!0 (array!38325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639470 (= res!414147 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639471 () Bool)

(declare-fun res!414137 () Bool)

(assert (=> b!639471 (=> (not res!414137) (not e!365982))))

(assert (=> b!639471 (= res!414137 (and (= (size!18748 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18748 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18748 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639472 () Bool)

(declare-fun Unit!21610 () Unit!21608)

(assert (=> b!639472 (= e!365979 Unit!21610)))

(declare-fun b!639473 () Bool)

(declare-fun res!414146 () Bool)

(assert (=> b!639473 (=> (not res!414146) (not e!365984))))

(assert (=> b!639473 (= res!414146 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18383 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639474 () Bool)

(declare-fun e!365974 () Bool)

(assert (=> b!639474 (= e!365974 (bvslt (size!18748 a!2986) #b01111111111111111111111111111111))))

(declare-datatypes ((List!12463 0))(
  ( (Nil!12460) (Cons!12459 (h!13504 (_ BitVec 64)) (t!18682 List!12463)) )
))
(declare-fun arrayNoDuplicates!0 (array!38325 (_ BitVec 32) List!12463) Bool)

(assert (=> b!639474 (arrayNoDuplicates!0 lt!295762 j!136 Nil!12460)))

(declare-fun lt!295769 () Unit!21608)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38325 (_ BitVec 32) (_ BitVec 32)) Unit!21608)

(assert (=> b!639474 (= lt!295769 (lemmaNoDuplicateFromThenFromBigger!0 lt!295762 #b00000000000000000000000000000000 j!136))))

(assert (=> b!639474 (arrayNoDuplicates!0 lt!295762 #b00000000000000000000000000000000 Nil!12460)))

(declare-fun lt!295768 () Unit!21608)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38325 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12463) Unit!21608)

(assert (=> b!639474 (= lt!295768 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12460))))

(assert (=> b!639474 (arrayContainsKey!0 lt!295762 (select (arr!18383 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295773 () Unit!21608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38325 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21608)

(assert (=> b!639474 (= lt!295773 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295762 (select (arr!18383 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639475 () Bool)

(assert (=> b!639475 (= e!365980 e!365978)))

(declare-fun res!414144 () Bool)

(assert (=> b!639475 (=> (not res!414144) (not e!365978))))

(assert (=> b!639475 (= res!414144 (and (= lt!295770 (Found!6820 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18383 a!2986) index!984) (select (arr!18383 a!2986) j!136))) (not (= (select (arr!18383 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!639475 (= lt!295770 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18383 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639476 () Bool)

(declare-fun res!414139 () Bool)

(assert (=> b!639476 (=> (not res!414139) (not e!365982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639476 (= res!414139 (validKeyInArray!0 (select (arr!18383 a!2986) j!136)))))

(declare-fun b!639477 () Bool)

(declare-fun res!414143 () Bool)

(assert (=> b!639477 (=> (not res!414143) (not e!365982))))

(assert (=> b!639477 (= res!414143 (validKeyInArray!0 k0!1786))))

(declare-fun res!414151 () Bool)

(assert (=> start!57812 (=> (not res!414151) (not e!365982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57812 (= res!414151 (validMask!0 mask!3053))))

(assert (=> start!57812 e!365982))

(assert (=> start!57812 true))

(declare-fun array_inv!14266 (array!38325) Bool)

(assert (=> start!57812 (array_inv!14266 a!2986)))

(declare-fun b!639478 () Bool)

(assert (=> b!639478 (= e!365975 e!365974)))

(declare-fun res!414140 () Bool)

(assert (=> b!639478 (=> res!414140 e!365974)))

(declare-fun lt!295765 () (_ BitVec 64))

(assert (=> b!639478 (= res!414140 (or (not (= (select (arr!18383 a!2986) j!136) lt!295764)) (not (= (select (arr!18383 a!2986) j!136) lt!295765)) (bvsge j!136 index!984)))))

(declare-fun e!365976 () Bool)

(assert (=> b!639478 e!365976))

(declare-fun res!414150 () Bool)

(assert (=> b!639478 (=> (not res!414150) (not e!365976))))

(assert (=> b!639478 (= res!414150 (= lt!295765 (select (arr!18383 a!2986) j!136)))))

(assert (=> b!639478 (= lt!295765 (select (store (arr!18383 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!639479 () Bool)

(declare-fun e!365973 () Bool)

(assert (=> b!639479 (= e!365976 e!365973)))

(declare-fun res!414149 () Bool)

(assert (=> b!639479 (=> res!414149 e!365973)))

(assert (=> b!639479 (= res!414149 (or (not (= (select (arr!18383 a!2986) j!136) lt!295764)) (not (= (select (arr!18383 a!2986) j!136) lt!295765)) (bvsge j!136 index!984)))))

(declare-fun b!639480 () Bool)

(declare-fun Unit!21611 () Unit!21608)

(assert (=> b!639480 (= e!365979 Unit!21611)))

(assert (=> b!639480 false))

(declare-fun b!639481 () Bool)

(declare-fun e!365981 () Bool)

(assert (=> b!639481 (= e!365973 e!365981)))

(declare-fun res!414138 () Bool)

(assert (=> b!639481 (=> (not res!414138) (not e!365981))))

(assert (=> b!639481 (= res!414138 (arrayContainsKey!0 lt!295762 (select (arr!18383 a!2986) j!136) j!136))))

(declare-fun b!639482 () Bool)

(assert (=> b!639482 (= e!365981 (arrayContainsKey!0 lt!295762 (select (arr!18383 a!2986) j!136) index!984))))

(declare-fun b!639483 () Bool)

(declare-fun res!414135 () Bool)

(assert (=> b!639483 (=> (not res!414135) (not e!365984))))

(assert (=> b!639483 (= res!414135 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12460))))

(assert (= (and start!57812 res!414151) b!639471))

(assert (= (and b!639471 res!414137) b!639476))

(assert (= (and b!639476 res!414139) b!639477))

(assert (= (and b!639477 res!414143) b!639470))

(assert (= (and b!639470 res!414147) b!639466))

(assert (= (and b!639466 res!414141) b!639467))

(assert (= (and b!639467 res!414142) b!639483))

(assert (= (and b!639483 res!414135) b!639473))

(assert (= (and b!639473 res!414146) b!639468))

(assert (= (and b!639468 res!414145) b!639475))

(assert (= (and b!639475 res!414144) b!639465))

(assert (= (and b!639465 res!414148) b!639469))

(assert (= (and b!639465 c!73032) b!639480))

(assert (= (and b!639465 (not c!73032)) b!639472))

(assert (= (and b!639465 (not res!414136)) b!639478))

(assert (= (and b!639478 res!414150) b!639479))

(assert (= (and b!639479 (not res!414149)) b!639481))

(assert (= (and b!639481 res!414138) b!639482))

(assert (= (and b!639478 (not res!414140)) b!639474))

(declare-fun m!612825 () Bool)

(assert (=> b!639477 m!612825))

(declare-fun m!612827 () Bool)

(assert (=> b!639482 m!612827))

(assert (=> b!639482 m!612827))

(declare-fun m!612829 () Bool)

(assert (=> b!639482 m!612829))

(declare-fun m!612831 () Bool)

(assert (=> b!639475 m!612831))

(assert (=> b!639475 m!612827))

(assert (=> b!639475 m!612827))

(declare-fun m!612833 () Bool)

(assert (=> b!639475 m!612833))

(declare-fun m!612835 () Bool)

(assert (=> start!57812 m!612835))

(declare-fun m!612837 () Bool)

(assert (=> start!57812 m!612837))

(assert (=> b!639478 m!612827))

(declare-fun m!612839 () Bool)

(assert (=> b!639478 m!612839))

(declare-fun m!612841 () Bool)

(assert (=> b!639478 m!612841))

(declare-fun m!612843 () Bool)

(assert (=> b!639465 m!612843))

(declare-fun m!612845 () Bool)

(assert (=> b!639465 m!612845))

(declare-fun m!612847 () Bool)

(assert (=> b!639465 m!612847))

(declare-fun m!612849 () Bool)

(assert (=> b!639465 m!612849))

(assert (=> b!639465 m!612827))

(assert (=> b!639465 m!612839))

(declare-fun m!612851 () Bool)

(assert (=> b!639465 m!612851))

(assert (=> b!639465 m!612827))

(declare-fun m!612853 () Bool)

(assert (=> b!639465 m!612853))

(assert (=> b!639479 m!612827))

(declare-fun m!612855 () Bool)

(assert (=> b!639466 m!612855))

(declare-fun m!612857 () Bool)

(assert (=> b!639474 m!612857))

(assert (=> b!639474 m!612827))

(declare-fun m!612859 () Bool)

(assert (=> b!639474 m!612859))

(declare-fun m!612861 () Bool)

(assert (=> b!639474 m!612861))

(assert (=> b!639474 m!612827))

(declare-fun m!612863 () Bool)

(assert (=> b!639474 m!612863))

(assert (=> b!639474 m!612827))

(declare-fun m!612865 () Bool)

(assert (=> b!639474 m!612865))

(declare-fun m!612867 () Bool)

(assert (=> b!639474 m!612867))

(assert (=> b!639476 m!612827))

(assert (=> b!639476 m!612827))

(declare-fun m!612869 () Bool)

(assert (=> b!639476 m!612869))

(declare-fun m!612871 () Bool)

(assert (=> b!639467 m!612871))

(assert (=> b!639481 m!612827))

(assert (=> b!639481 m!612827))

(declare-fun m!612873 () Bool)

(assert (=> b!639481 m!612873))

(declare-fun m!612875 () Bool)

(assert (=> b!639473 m!612875))

(declare-fun m!612877 () Bool)

(assert (=> b!639483 m!612877))

(declare-fun m!612879 () Bool)

(assert (=> b!639470 m!612879))

(assert (=> b!639468 m!612839))

(declare-fun m!612881 () Bool)

(assert (=> b!639468 m!612881))

(check-sat (not b!639475) (not start!57812) (not b!639477) (not b!639467) (not b!639482) (not b!639483) (not b!639466) (not b!639465) (not b!639476) (not b!639481) (not b!639470) (not b!639474))
(check-sat)
(get-model)

(declare-fun d!90127 () Bool)

(assert (=> d!90127 (= (validKeyInArray!0 (select (arr!18383 a!2986) j!136)) (and (not (= (select (arr!18383 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18383 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!639476 d!90127))

(declare-fun b!639611 () Bool)

(declare-fun e!366064 () SeekEntryResult!6820)

(assert (=> b!639611 (= e!366064 (MissingVacant!6820 vacantSpotIndex!68))))

(declare-fun b!639612 () Bool)

(declare-fun e!366063 () SeekEntryResult!6820)

(assert (=> b!639612 (= e!366063 (Found!6820 lt!295763))))

(declare-fun b!639613 () Bool)

(assert (=> b!639613 (= e!366064 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!295763 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18383 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639610 () Bool)

(declare-fun e!366065 () SeekEntryResult!6820)

(assert (=> b!639610 (= e!366065 Undefined!6820)))

(declare-fun lt!295857 () SeekEntryResult!6820)

(declare-fun d!90129 () Bool)

(get-info :version)

(assert (=> d!90129 (and (or ((_ is Undefined!6820) lt!295857) (not ((_ is Found!6820) lt!295857)) (and (bvsge (index!29598 lt!295857) #b00000000000000000000000000000000) (bvslt (index!29598 lt!295857) (size!18748 a!2986)))) (or ((_ is Undefined!6820) lt!295857) ((_ is Found!6820) lt!295857) (not ((_ is MissingVacant!6820) lt!295857)) (not (= (index!29600 lt!295857) vacantSpotIndex!68)) (and (bvsge (index!29600 lt!295857) #b00000000000000000000000000000000) (bvslt (index!29600 lt!295857) (size!18748 a!2986)))) (or ((_ is Undefined!6820) lt!295857) (ite ((_ is Found!6820) lt!295857) (= (select (arr!18383 a!2986) (index!29598 lt!295857)) (select (arr!18383 a!2986) j!136)) (and ((_ is MissingVacant!6820) lt!295857) (= (index!29600 lt!295857) vacantSpotIndex!68) (= (select (arr!18383 a!2986) (index!29600 lt!295857)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90129 (= lt!295857 e!366065)))

(declare-fun c!73046 () Bool)

(assert (=> d!90129 (= c!73046 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!295856 () (_ BitVec 64))

(assert (=> d!90129 (= lt!295856 (select (arr!18383 a!2986) lt!295763))))

(assert (=> d!90129 (validMask!0 mask!3053)))

(assert (=> d!90129 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295763 vacantSpotIndex!68 (select (arr!18383 a!2986) j!136) a!2986 mask!3053) lt!295857)))

(declare-fun b!639614 () Bool)

(assert (=> b!639614 (= e!366065 e!366063)))

(declare-fun c!73047 () Bool)

(assert (=> b!639614 (= c!73047 (= lt!295856 (select (arr!18383 a!2986) j!136)))))

(declare-fun b!639615 () Bool)

(declare-fun c!73045 () Bool)

(assert (=> b!639615 (= c!73045 (= lt!295856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639615 (= e!366063 e!366064)))

(assert (= (and d!90129 c!73046) b!639610))

(assert (= (and d!90129 (not c!73046)) b!639614))

(assert (= (and b!639614 c!73047) b!639612))

(assert (= (and b!639614 (not c!73047)) b!639615))

(assert (= (and b!639615 c!73045) b!639611))

(assert (= (and b!639615 (not c!73045)) b!639613))

(declare-fun m!612999 () Bool)

(assert (=> b!639613 m!612999))

(assert (=> b!639613 m!612999))

(assert (=> b!639613 m!612827))

(declare-fun m!613001 () Bool)

(assert (=> b!639613 m!613001))

(declare-fun m!613003 () Bool)

(assert (=> d!90129 m!613003))

(declare-fun m!613005 () Bool)

(assert (=> d!90129 m!613005))

(declare-fun m!613007 () Bool)

(assert (=> d!90129 m!613007))

(assert (=> d!90129 m!612835))

(assert (=> b!639465 d!90129))

(declare-fun d!90131 () Bool)

(declare-fun lt!295860 () (_ BitVec 32))

(assert (=> d!90131 (and (bvsge lt!295860 #b00000000000000000000000000000000) (bvslt lt!295860 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90131 (= lt!295860 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90131 (validMask!0 mask!3053)))

(assert (=> d!90131 (= (nextIndex!0 index!984 x!910 mask!3053) lt!295860)))

(declare-fun bs!19140 () Bool)

(assert (= bs!19140 d!90131))

(declare-fun m!613009 () Bool)

(assert (=> bs!19140 m!613009))

(assert (=> bs!19140 m!612835))

(assert (=> b!639465 d!90131))

(declare-fun d!90133 () Bool)

(declare-fun e!366068 () Bool)

(assert (=> d!90133 e!366068))

(declare-fun res!414256 () Bool)

(assert (=> d!90133 (=> (not res!414256) (not e!366068))))

(assert (=> d!90133 (= res!414256 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18748 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18748 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18748 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18748 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18748 a!2986))))))

(declare-fun lt!295863 () Unit!21608)

(declare-fun choose!9 (array!38325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21608)

(assert (=> d!90133 (= lt!295863 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295763 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90133 (validMask!0 mask!3053)))

(assert (=> d!90133 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295763 vacantSpotIndex!68 mask!3053) lt!295863)))

(declare-fun b!639618 () Bool)

(assert (=> b!639618 (= e!366068 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295763 vacantSpotIndex!68 (select (arr!18383 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295763 vacantSpotIndex!68 (select (store (arr!18383 a!2986) i!1108 k0!1786) j!136) (array!38326 (store (arr!18383 a!2986) i!1108 k0!1786) (size!18748 a!2986)) mask!3053)))))

(assert (= (and d!90133 res!414256) b!639618))

(declare-fun m!613011 () Bool)

(assert (=> d!90133 m!613011))

(assert (=> d!90133 m!612835))

(assert (=> b!639618 m!612845))

(assert (=> b!639618 m!612839))

(assert (=> b!639618 m!612827))

(assert (=> b!639618 m!612827))

(assert (=> b!639618 m!612853))

(assert (=> b!639618 m!612845))

(declare-fun m!613013 () Bool)

(assert (=> b!639618 m!613013))

(assert (=> b!639465 d!90133))

(declare-fun b!639620 () Bool)

(declare-fun e!366070 () SeekEntryResult!6820)

(assert (=> b!639620 (= e!366070 (MissingVacant!6820 vacantSpotIndex!68))))

(declare-fun b!639621 () Bool)

(declare-fun e!366069 () SeekEntryResult!6820)

(assert (=> b!639621 (= e!366069 (Found!6820 index!984))))

(declare-fun b!639622 () Bool)

(assert (=> b!639622 (= e!366070 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!295764 lt!295762 mask!3053))))

(declare-fun b!639619 () Bool)

(declare-fun e!366071 () SeekEntryResult!6820)

(assert (=> b!639619 (= e!366071 Undefined!6820)))

(declare-fun d!90135 () Bool)

(declare-fun lt!295865 () SeekEntryResult!6820)

(assert (=> d!90135 (and (or ((_ is Undefined!6820) lt!295865) (not ((_ is Found!6820) lt!295865)) (and (bvsge (index!29598 lt!295865) #b00000000000000000000000000000000) (bvslt (index!29598 lt!295865) (size!18748 lt!295762)))) (or ((_ is Undefined!6820) lt!295865) ((_ is Found!6820) lt!295865) (not ((_ is MissingVacant!6820) lt!295865)) (not (= (index!29600 lt!295865) vacantSpotIndex!68)) (and (bvsge (index!29600 lt!295865) #b00000000000000000000000000000000) (bvslt (index!29600 lt!295865) (size!18748 lt!295762)))) (or ((_ is Undefined!6820) lt!295865) (ite ((_ is Found!6820) lt!295865) (= (select (arr!18383 lt!295762) (index!29598 lt!295865)) lt!295764) (and ((_ is MissingVacant!6820) lt!295865) (= (index!29600 lt!295865) vacantSpotIndex!68) (= (select (arr!18383 lt!295762) (index!29600 lt!295865)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90135 (= lt!295865 e!366071)))

(declare-fun c!73049 () Bool)

(assert (=> d!90135 (= c!73049 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!295864 () (_ BitVec 64))

(assert (=> d!90135 (= lt!295864 (select (arr!18383 lt!295762) index!984))))

(assert (=> d!90135 (validMask!0 mask!3053)))

(assert (=> d!90135 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295764 lt!295762 mask!3053) lt!295865)))

(declare-fun b!639623 () Bool)

(assert (=> b!639623 (= e!366071 e!366069)))

(declare-fun c!73050 () Bool)

(assert (=> b!639623 (= c!73050 (= lt!295864 lt!295764))))

(declare-fun b!639624 () Bool)

(declare-fun c!73048 () Bool)

(assert (=> b!639624 (= c!73048 (= lt!295864 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639624 (= e!366069 e!366070)))

(assert (= (and d!90135 c!73049) b!639619))

(assert (= (and d!90135 (not c!73049)) b!639623))

(assert (= (and b!639623 c!73050) b!639621))

(assert (= (and b!639623 (not c!73050)) b!639624))

(assert (= (and b!639624 c!73048) b!639620))

(assert (= (and b!639624 (not c!73048)) b!639622))

(assert (=> b!639622 m!612843))

(assert (=> b!639622 m!612843))

(declare-fun m!613015 () Bool)

(assert (=> b!639622 m!613015))

(declare-fun m!613017 () Bool)

(assert (=> d!90135 m!613017))

(declare-fun m!613019 () Bool)

(assert (=> d!90135 m!613019))

(declare-fun m!613021 () Bool)

(assert (=> d!90135 m!613021))

(assert (=> d!90135 m!612835))

(assert (=> b!639465 d!90135))

(declare-fun b!639626 () Bool)

(declare-fun e!366073 () SeekEntryResult!6820)

(assert (=> b!639626 (= e!366073 (MissingVacant!6820 vacantSpotIndex!68))))

(declare-fun b!639627 () Bool)

(declare-fun e!366072 () SeekEntryResult!6820)

(assert (=> b!639627 (= e!366072 (Found!6820 lt!295763))))

(declare-fun b!639628 () Bool)

(assert (=> b!639628 (= e!366073 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!295763 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!295764 lt!295762 mask!3053))))

(declare-fun b!639625 () Bool)

(declare-fun e!366074 () SeekEntryResult!6820)

(assert (=> b!639625 (= e!366074 Undefined!6820)))

(declare-fun lt!295867 () SeekEntryResult!6820)

(declare-fun d!90137 () Bool)

(assert (=> d!90137 (and (or ((_ is Undefined!6820) lt!295867) (not ((_ is Found!6820) lt!295867)) (and (bvsge (index!29598 lt!295867) #b00000000000000000000000000000000) (bvslt (index!29598 lt!295867) (size!18748 lt!295762)))) (or ((_ is Undefined!6820) lt!295867) ((_ is Found!6820) lt!295867) (not ((_ is MissingVacant!6820) lt!295867)) (not (= (index!29600 lt!295867) vacantSpotIndex!68)) (and (bvsge (index!29600 lt!295867) #b00000000000000000000000000000000) (bvslt (index!29600 lt!295867) (size!18748 lt!295762)))) (or ((_ is Undefined!6820) lt!295867) (ite ((_ is Found!6820) lt!295867) (= (select (arr!18383 lt!295762) (index!29598 lt!295867)) lt!295764) (and ((_ is MissingVacant!6820) lt!295867) (= (index!29600 lt!295867) vacantSpotIndex!68) (= (select (arr!18383 lt!295762) (index!29600 lt!295867)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90137 (= lt!295867 e!366074)))

(declare-fun c!73052 () Bool)

(assert (=> d!90137 (= c!73052 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!295866 () (_ BitVec 64))

(assert (=> d!90137 (= lt!295866 (select (arr!18383 lt!295762) lt!295763))))

(assert (=> d!90137 (validMask!0 mask!3053)))

(assert (=> d!90137 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295763 vacantSpotIndex!68 lt!295764 lt!295762 mask!3053) lt!295867)))

(declare-fun b!639629 () Bool)

(assert (=> b!639629 (= e!366074 e!366072)))

(declare-fun c!73053 () Bool)

(assert (=> b!639629 (= c!73053 (= lt!295866 lt!295764))))

(declare-fun b!639630 () Bool)

(declare-fun c!73051 () Bool)

(assert (=> b!639630 (= c!73051 (= lt!295866 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639630 (= e!366072 e!366073)))

(assert (= (and d!90137 c!73052) b!639625))

(assert (= (and d!90137 (not c!73052)) b!639629))

(assert (= (and b!639629 c!73053) b!639627))

(assert (= (and b!639629 (not c!73053)) b!639630))

(assert (= (and b!639630 c!73051) b!639626))

(assert (= (and b!639630 (not c!73051)) b!639628))

(assert (=> b!639628 m!612999))

(assert (=> b!639628 m!612999))

(declare-fun m!613023 () Bool)

(assert (=> b!639628 m!613023))

(declare-fun m!613025 () Bool)

(assert (=> d!90137 m!613025))

(declare-fun m!613027 () Bool)

(assert (=> d!90137 m!613027))

(declare-fun m!613029 () Bool)

(assert (=> d!90137 m!613029))

(assert (=> d!90137 m!612835))

(assert (=> b!639465 d!90137))

(declare-fun b!639632 () Bool)

(declare-fun e!366076 () SeekEntryResult!6820)

(assert (=> b!639632 (= e!366076 (MissingVacant!6820 vacantSpotIndex!68))))

(declare-fun b!639633 () Bool)

(declare-fun e!366075 () SeekEntryResult!6820)

(assert (=> b!639633 (= e!366075 (Found!6820 index!984))))

(declare-fun b!639634 () Bool)

(assert (=> b!639634 (= e!366076 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18383 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639631 () Bool)

(declare-fun e!366077 () SeekEntryResult!6820)

(assert (=> b!639631 (= e!366077 Undefined!6820)))

(declare-fun lt!295869 () SeekEntryResult!6820)

(declare-fun d!90139 () Bool)

(assert (=> d!90139 (and (or ((_ is Undefined!6820) lt!295869) (not ((_ is Found!6820) lt!295869)) (and (bvsge (index!29598 lt!295869) #b00000000000000000000000000000000) (bvslt (index!29598 lt!295869) (size!18748 a!2986)))) (or ((_ is Undefined!6820) lt!295869) ((_ is Found!6820) lt!295869) (not ((_ is MissingVacant!6820) lt!295869)) (not (= (index!29600 lt!295869) vacantSpotIndex!68)) (and (bvsge (index!29600 lt!295869) #b00000000000000000000000000000000) (bvslt (index!29600 lt!295869) (size!18748 a!2986)))) (or ((_ is Undefined!6820) lt!295869) (ite ((_ is Found!6820) lt!295869) (= (select (arr!18383 a!2986) (index!29598 lt!295869)) (select (arr!18383 a!2986) j!136)) (and ((_ is MissingVacant!6820) lt!295869) (= (index!29600 lt!295869) vacantSpotIndex!68) (= (select (arr!18383 a!2986) (index!29600 lt!295869)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90139 (= lt!295869 e!366077)))

(declare-fun c!73055 () Bool)

(assert (=> d!90139 (= c!73055 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!295868 () (_ BitVec 64))

(assert (=> d!90139 (= lt!295868 (select (arr!18383 a!2986) index!984))))

(assert (=> d!90139 (validMask!0 mask!3053)))

(assert (=> d!90139 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18383 a!2986) j!136) a!2986 mask!3053) lt!295869)))

(declare-fun b!639635 () Bool)

(assert (=> b!639635 (= e!366077 e!366075)))

(declare-fun c!73056 () Bool)

(assert (=> b!639635 (= c!73056 (= lt!295868 (select (arr!18383 a!2986) j!136)))))

(declare-fun b!639636 () Bool)

(declare-fun c!73054 () Bool)

(assert (=> b!639636 (= c!73054 (= lt!295868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639636 (= e!366075 e!366076)))

(assert (= (and d!90139 c!73055) b!639631))

(assert (= (and d!90139 (not c!73055)) b!639635))

(assert (= (and b!639635 c!73056) b!639633))

(assert (= (and b!639635 (not c!73056)) b!639636))

(assert (= (and b!639636 c!73054) b!639632))

(assert (= (and b!639636 (not c!73054)) b!639634))

(assert (=> b!639634 m!612843))

(assert (=> b!639634 m!612843))

(assert (=> b!639634 m!612827))

(declare-fun m!613031 () Bool)

(assert (=> b!639634 m!613031))

(declare-fun m!613033 () Bool)

(assert (=> d!90139 m!613033))

(declare-fun m!613035 () Bool)

(assert (=> d!90139 m!613035))

(assert (=> d!90139 m!612831))

(assert (=> d!90139 m!612835))

(assert (=> b!639475 d!90139))

(declare-fun d!90141 () Bool)

(assert (=> d!90141 (arrayContainsKey!0 lt!295762 (select (arr!18383 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295872 () Unit!21608)

(declare-fun choose!114 (array!38325 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21608)

(assert (=> d!90141 (= lt!295872 (choose!114 lt!295762 (select (arr!18383 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90141 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90141 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295762 (select (arr!18383 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!295872)))

(declare-fun bs!19141 () Bool)

(assert (= bs!19141 d!90141))

(assert (=> bs!19141 m!612827))

(assert (=> bs!19141 m!612863))

(assert (=> bs!19141 m!612827))

(declare-fun m!613037 () Bool)

(assert (=> bs!19141 m!613037))

(assert (=> b!639474 d!90141))

(declare-fun b!639647 () Bool)

(declare-fun e!366088 () Bool)

(declare-fun call!33463 () Bool)

(assert (=> b!639647 (= e!366088 call!33463)))

(declare-fun b!639648 () Bool)

(assert (=> b!639648 (= e!366088 call!33463)))

(declare-fun b!639649 () Bool)

(declare-fun e!366089 () Bool)

(declare-fun e!366087 () Bool)

(assert (=> b!639649 (= e!366089 e!366087)))

(declare-fun res!414264 () Bool)

(assert (=> b!639649 (=> (not res!414264) (not e!366087))))

(declare-fun e!366086 () Bool)

(assert (=> b!639649 (= res!414264 (not e!366086))))

(declare-fun res!414265 () Bool)

(assert (=> b!639649 (=> (not res!414265) (not e!366086))))

(assert (=> b!639649 (= res!414265 (validKeyInArray!0 (select (arr!18383 lt!295762) j!136)))))

(declare-fun b!639650 () Bool)

(declare-fun contains!3108 (List!12463 (_ BitVec 64)) Bool)

(assert (=> b!639650 (= e!366086 (contains!3108 Nil!12460 (select (arr!18383 lt!295762) j!136)))))

(declare-fun b!639651 () Bool)

(assert (=> b!639651 (= e!366087 e!366088)))

(declare-fun c!73059 () Bool)

(assert (=> b!639651 (= c!73059 (validKeyInArray!0 (select (arr!18383 lt!295762) j!136)))))

(declare-fun d!90143 () Bool)

(declare-fun res!414263 () Bool)

(assert (=> d!90143 (=> res!414263 e!366089)))

(assert (=> d!90143 (= res!414263 (bvsge j!136 (size!18748 lt!295762)))))

(assert (=> d!90143 (= (arrayNoDuplicates!0 lt!295762 j!136 Nil!12460) e!366089)))

(declare-fun bm!33460 () Bool)

(assert (=> bm!33460 (= call!33463 (arrayNoDuplicates!0 lt!295762 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73059 (Cons!12459 (select (arr!18383 lt!295762) j!136) Nil!12460) Nil!12460)))))

(assert (= (and d!90143 (not res!414263)) b!639649))

(assert (= (and b!639649 res!414265) b!639650))

(assert (= (and b!639649 res!414264) b!639651))

(assert (= (and b!639651 c!73059) b!639647))

(assert (= (and b!639651 (not c!73059)) b!639648))

(assert (= (or b!639647 b!639648) bm!33460))

(declare-fun m!613039 () Bool)

(assert (=> b!639649 m!613039))

(assert (=> b!639649 m!613039))

(declare-fun m!613041 () Bool)

(assert (=> b!639649 m!613041))

(assert (=> b!639650 m!613039))

(assert (=> b!639650 m!613039))

(declare-fun m!613043 () Bool)

(assert (=> b!639650 m!613043))

(assert (=> b!639651 m!613039))

(assert (=> b!639651 m!613039))

(assert (=> b!639651 m!613041))

(assert (=> bm!33460 m!613039))

(declare-fun m!613045 () Bool)

(assert (=> bm!33460 m!613045))

(assert (=> b!639474 d!90143))

(declare-fun b!639652 () Bool)

(declare-fun e!366092 () Bool)

(declare-fun call!33464 () Bool)

(assert (=> b!639652 (= e!366092 call!33464)))

(declare-fun b!639653 () Bool)

(assert (=> b!639653 (= e!366092 call!33464)))

(declare-fun b!639654 () Bool)

(declare-fun e!366093 () Bool)

(declare-fun e!366091 () Bool)

(assert (=> b!639654 (= e!366093 e!366091)))

(declare-fun res!414267 () Bool)

(assert (=> b!639654 (=> (not res!414267) (not e!366091))))

(declare-fun e!366090 () Bool)

(assert (=> b!639654 (= res!414267 (not e!366090))))

(declare-fun res!414268 () Bool)

(assert (=> b!639654 (=> (not res!414268) (not e!366090))))

(assert (=> b!639654 (= res!414268 (validKeyInArray!0 (select (arr!18383 lt!295762) #b00000000000000000000000000000000)))))

(declare-fun b!639655 () Bool)

(assert (=> b!639655 (= e!366090 (contains!3108 Nil!12460 (select (arr!18383 lt!295762) #b00000000000000000000000000000000)))))

(declare-fun b!639656 () Bool)

(assert (=> b!639656 (= e!366091 e!366092)))

(declare-fun c!73060 () Bool)

(assert (=> b!639656 (= c!73060 (validKeyInArray!0 (select (arr!18383 lt!295762) #b00000000000000000000000000000000)))))

(declare-fun d!90145 () Bool)

(declare-fun res!414266 () Bool)

(assert (=> d!90145 (=> res!414266 e!366093)))

(assert (=> d!90145 (= res!414266 (bvsge #b00000000000000000000000000000000 (size!18748 lt!295762)))))

(assert (=> d!90145 (= (arrayNoDuplicates!0 lt!295762 #b00000000000000000000000000000000 Nil!12460) e!366093)))

(declare-fun bm!33461 () Bool)

(assert (=> bm!33461 (= call!33464 (arrayNoDuplicates!0 lt!295762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73060 (Cons!12459 (select (arr!18383 lt!295762) #b00000000000000000000000000000000) Nil!12460) Nil!12460)))))

(assert (= (and d!90145 (not res!414266)) b!639654))

(assert (= (and b!639654 res!414268) b!639655))

(assert (= (and b!639654 res!414267) b!639656))

(assert (= (and b!639656 c!73060) b!639652))

(assert (= (and b!639656 (not c!73060)) b!639653))

(assert (= (or b!639652 b!639653) bm!33461))

(declare-fun m!613047 () Bool)

(assert (=> b!639654 m!613047))

(assert (=> b!639654 m!613047))

(declare-fun m!613049 () Bool)

(assert (=> b!639654 m!613049))

(assert (=> b!639655 m!613047))

(assert (=> b!639655 m!613047))

(declare-fun m!613051 () Bool)

(assert (=> b!639655 m!613051))

(assert (=> b!639656 m!613047))

(assert (=> b!639656 m!613047))

(assert (=> b!639656 m!613049))

(assert (=> bm!33461 m!613047))

(declare-fun m!613053 () Bool)

(assert (=> bm!33461 m!613053))

(assert (=> b!639474 d!90145))

(declare-fun d!90149 () Bool)

(assert (=> d!90149 (arrayNoDuplicates!0 lt!295762 j!136 Nil!12460)))

(declare-fun lt!295875 () Unit!21608)

(declare-fun choose!39 (array!38325 (_ BitVec 32) (_ BitVec 32)) Unit!21608)

(assert (=> d!90149 (= lt!295875 (choose!39 lt!295762 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90149 (bvslt (size!18748 lt!295762) #b01111111111111111111111111111111)))

(assert (=> d!90149 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!295762 #b00000000000000000000000000000000 j!136) lt!295875)))

(declare-fun bs!19142 () Bool)

(assert (= bs!19142 d!90149))

(assert (=> bs!19142 m!612859))

(declare-fun m!613055 () Bool)

(assert (=> bs!19142 m!613055))

(assert (=> b!639474 d!90149))

(declare-fun d!90151 () Bool)

(declare-fun res!414273 () Bool)

(declare-fun e!366098 () Bool)

(assert (=> d!90151 (=> res!414273 e!366098)))

(assert (=> d!90151 (= res!414273 (= (select (arr!18383 lt!295762) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18383 a!2986) j!136)))))

(assert (=> d!90151 (= (arrayContainsKey!0 lt!295762 (select (arr!18383 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!366098)))

(declare-fun b!639661 () Bool)

(declare-fun e!366099 () Bool)

(assert (=> b!639661 (= e!366098 e!366099)))

(declare-fun res!414274 () Bool)

(assert (=> b!639661 (=> (not res!414274) (not e!366099))))

(assert (=> b!639661 (= res!414274 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18748 lt!295762)))))

(declare-fun b!639662 () Bool)

(assert (=> b!639662 (= e!366099 (arrayContainsKey!0 lt!295762 (select (arr!18383 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90151 (not res!414273)) b!639661))

(assert (= (and b!639661 res!414274) b!639662))

(declare-fun m!613057 () Bool)

(assert (=> d!90151 m!613057))

(assert (=> b!639662 m!612827))

(declare-fun m!613059 () Bool)

(assert (=> b!639662 m!613059))

(assert (=> b!639474 d!90151))

(declare-fun d!90155 () Bool)

(declare-fun e!366111 () Bool)

(assert (=> d!90155 e!366111))

(declare-fun res!414283 () Bool)

(assert (=> d!90155 (=> (not res!414283) (not e!366111))))

(assert (=> d!90155 (= res!414283 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18748 a!2986))))))

(declare-fun lt!295887 () Unit!21608)

(declare-fun choose!41 (array!38325 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12463) Unit!21608)

(assert (=> d!90155 (= lt!295887 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12460))))

(assert (=> d!90155 (bvslt (size!18748 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90155 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12460) lt!295887)))

(declare-fun b!639677 () Bool)

(assert (=> b!639677 (= e!366111 (arrayNoDuplicates!0 (array!38326 (store (arr!18383 a!2986) i!1108 k0!1786) (size!18748 a!2986)) #b00000000000000000000000000000000 Nil!12460))))

(assert (= (and d!90155 res!414283) b!639677))

(declare-fun m!613073 () Bool)

(assert (=> d!90155 m!613073))

(assert (=> b!639677 m!612839))

(declare-fun m!613075 () Bool)

(assert (=> b!639677 m!613075))

(assert (=> b!639474 d!90155))

(declare-fun b!639678 () Bool)

(declare-fun e!366114 () Bool)

(declare-fun call!33468 () Bool)

(assert (=> b!639678 (= e!366114 call!33468)))

(declare-fun b!639679 () Bool)

(assert (=> b!639679 (= e!366114 call!33468)))

(declare-fun b!639680 () Bool)

(declare-fun e!366115 () Bool)

(declare-fun e!366113 () Bool)

(assert (=> b!639680 (= e!366115 e!366113)))

(declare-fun res!414285 () Bool)

(assert (=> b!639680 (=> (not res!414285) (not e!366113))))

(declare-fun e!366112 () Bool)

(assert (=> b!639680 (= res!414285 (not e!366112))))

(declare-fun res!414286 () Bool)

(assert (=> b!639680 (=> (not res!414286) (not e!366112))))

(assert (=> b!639680 (= res!414286 (validKeyInArray!0 (select (arr!18383 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!639681 () Bool)

(assert (=> b!639681 (= e!366112 (contains!3108 Nil!12460 (select (arr!18383 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!639682 () Bool)

(assert (=> b!639682 (= e!366113 e!366114)))

(declare-fun c!73064 () Bool)

(assert (=> b!639682 (= c!73064 (validKeyInArray!0 (select (arr!18383 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90159 () Bool)

(declare-fun res!414284 () Bool)

(assert (=> d!90159 (=> res!414284 e!366115)))

(assert (=> d!90159 (= res!414284 (bvsge #b00000000000000000000000000000000 (size!18748 a!2986)))))

(assert (=> d!90159 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12460) e!366115)))

(declare-fun bm!33465 () Bool)

(assert (=> bm!33465 (= call!33468 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73064 (Cons!12459 (select (arr!18383 a!2986) #b00000000000000000000000000000000) Nil!12460) Nil!12460)))))

(assert (= (and d!90159 (not res!414284)) b!639680))

(assert (= (and b!639680 res!414286) b!639681))

(assert (= (and b!639680 res!414285) b!639682))

(assert (= (and b!639682 c!73064) b!639678))

(assert (= (and b!639682 (not c!73064)) b!639679))

(assert (= (or b!639678 b!639679) bm!33465))

(declare-fun m!613077 () Bool)

(assert (=> b!639680 m!613077))

(assert (=> b!639680 m!613077))

(declare-fun m!613079 () Bool)

(assert (=> b!639680 m!613079))

(assert (=> b!639681 m!613077))

(assert (=> b!639681 m!613077))

(declare-fun m!613081 () Bool)

(assert (=> b!639681 m!613081))

(assert (=> b!639682 m!613077))

(assert (=> b!639682 m!613077))

(assert (=> b!639682 m!613079))

(assert (=> bm!33465 m!613077))

(declare-fun m!613083 () Bool)

(assert (=> bm!33465 m!613083))

(assert (=> b!639483 d!90159))

(declare-fun d!90161 () Bool)

(declare-fun res!414287 () Bool)

(declare-fun e!366116 () Bool)

(assert (=> d!90161 (=> res!414287 e!366116)))

(assert (=> d!90161 (= res!414287 (= (select (arr!18383 lt!295762) index!984) (select (arr!18383 a!2986) j!136)))))

(assert (=> d!90161 (= (arrayContainsKey!0 lt!295762 (select (arr!18383 a!2986) j!136) index!984) e!366116)))

(declare-fun b!639683 () Bool)

(declare-fun e!366117 () Bool)

(assert (=> b!639683 (= e!366116 e!366117)))

(declare-fun res!414288 () Bool)

(assert (=> b!639683 (=> (not res!414288) (not e!366117))))

(assert (=> b!639683 (= res!414288 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18748 lt!295762)))))

(declare-fun b!639684 () Bool)

(assert (=> b!639684 (= e!366117 (arrayContainsKey!0 lt!295762 (select (arr!18383 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90161 (not res!414287)) b!639683))

(assert (= (and b!639683 res!414288) b!639684))

(assert (=> d!90161 m!613021))

(assert (=> b!639684 m!612827))

(declare-fun m!613085 () Bool)

(assert (=> b!639684 m!613085))

(assert (=> b!639482 d!90161))

(declare-fun d!90163 () Bool)

(declare-fun res!414291 () Bool)

(declare-fun e!366120 () Bool)

(assert (=> d!90163 (=> res!414291 e!366120)))

(assert (=> d!90163 (= res!414291 (= (select (arr!18383 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90163 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!366120)))

(declare-fun b!639685 () Bool)

(declare-fun e!366121 () Bool)

(assert (=> b!639685 (= e!366120 e!366121)))

(declare-fun res!414292 () Bool)

(assert (=> b!639685 (=> (not res!414292) (not e!366121))))

(assert (=> b!639685 (= res!414292 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18748 a!2986)))))

(declare-fun b!639686 () Bool)

(assert (=> b!639686 (= e!366121 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90163 (not res!414291)) b!639685))

(assert (= (and b!639685 res!414292) b!639686))

(assert (=> d!90163 m!613077))

(declare-fun m!613087 () Bool)

(assert (=> b!639686 m!613087))

(assert (=> b!639470 d!90163))

(declare-fun d!90165 () Bool)

(declare-fun res!414297 () Bool)

(declare-fun e!366126 () Bool)

(assert (=> d!90165 (=> res!414297 e!366126)))

(assert (=> d!90165 (= res!414297 (= (select (arr!18383 lt!295762) j!136) (select (arr!18383 a!2986) j!136)))))

(assert (=> d!90165 (= (arrayContainsKey!0 lt!295762 (select (arr!18383 a!2986) j!136) j!136) e!366126)))

(declare-fun b!639691 () Bool)

(declare-fun e!366127 () Bool)

(assert (=> b!639691 (= e!366126 e!366127)))

(declare-fun res!414298 () Bool)

(assert (=> b!639691 (=> (not res!414298) (not e!366127))))

(assert (=> b!639691 (= res!414298 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18748 lt!295762)))))

(declare-fun b!639692 () Bool)

(assert (=> b!639692 (= e!366127 (arrayContainsKey!0 lt!295762 (select (arr!18383 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90165 (not res!414297)) b!639691))

(assert (= (and b!639691 res!414298) b!639692))

(assert (=> d!90165 m!613039))

(assert (=> b!639692 m!612827))

(declare-fun m!613089 () Bool)

(assert (=> b!639692 m!613089))

(assert (=> b!639481 d!90165))

(declare-fun d!90167 () Bool)

(assert (=> d!90167 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57812 d!90167))

(declare-fun d!90175 () Bool)

(assert (=> d!90175 (= (array_inv!14266 a!2986) (bvsge (size!18748 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57812 d!90175))

(declare-fun b!639733 () Bool)

(declare-fun e!366159 () Bool)

(declare-fun e!366158 () Bool)

(assert (=> b!639733 (= e!366159 e!366158)))

(declare-fun c!73073 () Bool)

(assert (=> b!639733 (= c!73073 (validKeyInArray!0 (select (arr!18383 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!639734 () Bool)

(declare-fun call!33477 () Bool)

(assert (=> b!639734 (= e!366158 call!33477)))

(declare-fun b!639735 () Bool)

(declare-fun e!366160 () Bool)

(assert (=> b!639735 (= e!366158 e!366160)))

(declare-fun lt!295895 () (_ BitVec 64))

(assert (=> b!639735 (= lt!295895 (select (arr!18383 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!295894 () Unit!21608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38325 (_ BitVec 64) (_ BitVec 32)) Unit!21608)

(assert (=> b!639735 (= lt!295894 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!295895 #b00000000000000000000000000000000))))

(assert (=> b!639735 (arrayContainsKey!0 a!2986 lt!295895 #b00000000000000000000000000000000)))

(declare-fun lt!295896 () Unit!21608)

(assert (=> b!639735 (= lt!295896 lt!295894)))

(declare-fun res!414321 () Bool)

(assert (=> b!639735 (= res!414321 (= (seekEntryOrOpen!0 (select (arr!18383 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6820 #b00000000000000000000000000000000)))))

(assert (=> b!639735 (=> (not res!414321) (not e!366160))))

(declare-fun bm!33474 () Bool)

(assert (=> bm!33474 (= call!33477 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!639736 () Bool)

(assert (=> b!639736 (= e!366160 call!33477)))

(declare-fun d!90177 () Bool)

(declare-fun res!414322 () Bool)

(assert (=> d!90177 (=> res!414322 e!366159)))

(assert (=> d!90177 (= res!414322 (bvsge #b00000000000000000000000000000000 (size!18748 a!2986)))))

(assert (=> d!90177 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!366159)))

(assert (= (and d!90177 (not res!414322)) b!639733))

(assert (= (and b!639733 c!73073) b!639735))

(assert (= (and b!639733 (not c!73073)) b!639734))

(assert (= (and b!639735 res!414321) b!639736))

(assert (= (or b!639736 b!639734) bm!33474))

(assert (=> b!639733 m!613077))

(assert (=> b!639733 m!613077))

(assert (=> b!639733 m!613079))

(assert (=> b!639735 m!613077))

(declare-fun m!613107 () Bool)

(assert (=> b!639735 m!613107))

(declare-fun m!613109 () Bool)

(assert (=> b!639735 m!613109))

(assert (=> b!639735 m!613077))

(declare-fun m!613111 () Bool)

(assert (=> b!639735 m!613111))

(declare-fun m!613113 () Bool)

(assert (=> bm!33474 m!613113))

(assert (=> b!639467 d!90177))

(declare-fun d!90179 () Bool)

(declare-fun lt!295931 () SeekEntryResult!6820)

(assert (=> d!90179 (and (or ((_ is Undefined!6820) lt!295931) (not ((_ is Found!6820) lt!295931)) (and (bvsge (index!29598 lt!295931) #b00000000000000000000000000000000) (bvslt (index!29598 lt!295931) (size!18748 a!2986)))) (or ((_ is Undefined!6820) lt!295931) ((_ is Found!6820) lt!295931) (not ((_ is MissingZero!6820) lt!295931)) (and (bvsge (index!29597 lt!295931) #b00000000000000000000000000000000) (bvslt (index!29597 lt!295931) (size!18748 a!2986)))) (or ((_ is Undefined!6820) lt!295931) ((_ is Found!6820) lt!295931) ((_ is MissingZero!6820) lt!295931) (not ((_ is MissingVacant!6820) lt!295931)) (and (bvsge (index!29600 lt!295931) #b00000000000000000000000000000000) (bvslt (index!29600 lt!295931) (size!18748 a!2986)))) (or ((_ is Undefined!6820) lt!295931) (ite ((_ is Found!6820) lt!295931) (= (select (arr!18383 a!2986) (index!29598 lt!295931)) k0!1786) (ite ((_ is MissingZero!6820) lt!295931) (= (select (arr!18383 a!2986) (index!29597 lt!295931)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6820) lt!295931) (= (select (arr!18383 a!2986) (index!29600 lt!295931)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!366200 () SeekEntryResult!6820)

(assert (=> d!90179 (= lt!295931 e!366200)))

(declare-fun c!73114 () Bool)

(declare-fun lt!295932 () SeekEntryResult!6820)

(assert (=> d!90179 (= c!73114 (and ((_ is Intermediate!6820) lt!295932) (undefined!7632 lt!295932)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38325 (_ BitVec 32)) SeekEntryResult!6820)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90179 (= lt!295932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90179 (validMask!0 mask!3053)))

(assert (=> d!90179 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!295931)))

(declare-fun b!639815 () Bool)

(declare-fun e!366202 () SeekEntryResult!6820)

(assert (=> b!639815 (= e!366202 (MissingZero!6820 (index!29599 lt!295932)))))

(declare-fun b!639816 () Bool)

(declare-fun e!366201 () SeekEntryResult!6820)

(assert (=> b!639816 (= e!366200 e!366201)))

(declare-fun lt!295933 () (_ BitVec 64))

(assert (=> b!639816 (= lt!295933 (select (arr!18383 a!2986) (index!29599 lt!295932)))))

(declare-fun c!73115 () Bool)

(assert (=> b!639816 (= c!73115 (= lt!295933 k0!1786))))

(declare-fun b!639817 () Bool)

(assert (=> b!639817 (= e!366202 (seekKeyOrZeroReturnVacant!0 (x!58362 lt!295932) (index!29599 lt!295932) (index!29599 lt!295932) k0!1786 a!2986 mask!3053))))

(declare-fun b!639818 () Bool)

(assert (=> b!639818 (= e!366201 (Found!6820 (index!29599 lt!295932)))))

(declare-fun b!639819 () Bool)

(assert (=> b!639819 (= e!366200 Undefined!6820)))

(declare-fun b!639820 () Bool)

(declare-fun c!73113 () Bool)

(assert (=> b!639820 (= c!73113 (= lt!295933 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639820 (= e!366201 e!366202)))

(assert (= (and d!90179 c!73114) b!639819))

(assert (= (and d!90179 (not c!73114)) b!639816))

(assert (= (and b!639816 c!73115) b!639818))

(assert (= (and b!639816 (not c!73115)) b!639820))

(assert (= (and b!639820 c!73113) b!639815))

(assert (= (and b!639820 (not c!73113)) b!639817))

(declare-fun m!613161 () Bool)

(assert (=> d!90179 m!613161))

(declare-fun m!613165 () Bool)

(assert (=> d!90179 m!613165))

(assert (=> d!90179 m!613161))

(declare-fun m!613167 () Bool)

(assert (=> d!90179 m!613167))

(assert (=> d!90179 m!612835))

(declare-fun m!613169 () Bool)

(assert (=> d!90179 m!613169))

(declare-fun m!613171 () Bool)

(assert (=> d!90179 m!613171))

(declare-fun m!613173 () Bool)

(assert (=> b!639816 m!613173))

(declare-fun m!613175 () Bool)

(assert (=> b!639817 m!613175))

(assert (=> b!639466 d!90179))

(declare-fun d!90193 () Bool)

(assert (=> d!90193 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!639477 d!90193))

(check-sat (not d!90131) (not bm!33460) (not d!90133) (not b!639634) (not b!639735) (not b!639684) (not d!90137) (not b!639692) (not bm!33474) (not b!639662) (not d!90139) (not d!90155) (not b!639677) (not bm!33461) (not b!639680) (not d!90141) (not d!90135) (not b!639682) (not b!639656) (not d!90129) (not b!639649) (not b!639817) (not b!639686) (not b!639654) (not b!639618) (not b!639655) (not d!90179) (not b!639733) (not d!90149) (not b!639651) (not bm!33465) (not b!639622) (not b!639681) (not b!639628) (not b!639613) (not b!639650))
(check-sat)
