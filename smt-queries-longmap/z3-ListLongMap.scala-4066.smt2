; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55782 () Bool)

(assert start!55782)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!349936 () Bool)

(declare-fun b!610767 () Bool)

(declare-datatypes ((array!37359 0))(
  ( (array!37360 (arr!17927 (Array (_ BitVec 32) (_ BitVec 64))) (size!18292 (_ BitVec 32))) )
))
(declare-fun lt!279287 () array!37359)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37359)

(declare-fun arrayContainsKey!0 (array!37359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!610767 (= e!349936 (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) index!984))))

(declare-fun b!610768 () Bool)

(declare-fun e!349938 () Bool)

(declare-fun e!349934 () Bool)

(assert (=> b!610768 (= e!349938 e!349934)))

(declare-fun res!392866 () Bool)

(assert (=> b!610768 (=> res!392866 e!349934)))

(assert (=> b!610768 (= res!392866 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19566 0))(
  ( (Unit!19567) )
))
(declare-fun lt!279286 () Unit!19566)

(declare-fun e!349937 () Unit!19566)

(assert (=> b!610768 (= lt!279286 e!349937)))

(declare-fun c!69321 () Bool)

(assert (=> b!610768 (= c!69321 (bvslt j!136 index!984))))

(declare-fun b!610769 () Bool)

(declare-fun res!392877 () Bool)

(declare-fun e!349923 () Bool)

(assert (=> b!610769 (=> (not res!392877) (not e!349923))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!610769 (= res!392877 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17927 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!610770 () Bool)

(declare-fun e!349929 () Bool)

(declare-datatypes ((SeekEntryResult!6364 0))(
  ( (MissingZero!6364 (index!27737 (_ BitVec 32))) (Found!6364 (index!27738 (_ BitVec 32))) (Intermediate!6364 (undefined!7176 Bool) (index!27739 (_ BitVec 32)) (x!56558 (_ BitVec 32))) (Undefined!6364) (MissingVacant!6364 (index!27740 (_ BitVec 32))) )
))
(declare-fun lt!279289 () SeekEntryResult!6364)

(declare-fun lt!279293 () SeekEntryResult!6364)

(assert (=> b!610770 (= e!349929 (= lt!279289 lt!279293))))

(declare-fun b!610771 () Bool)

(declare-fun res!392861 () Bool)

(declare-fun e!349931 () Bool)

(assert (=> b!610771 (=> (not res!392861) (not e!349931))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!610771 (= res!392861 (validKeyInArray!0 k0!1786))))

(declare-fun b!610772 () Bool)

(declare-fun e!349924 () Bool)

(assert (=> b!610772 (= e!349923 e!349924)))

(declare-fun res!392881 () Bool)

(assert (=> b!610772 (=> (not res!392881) (not e!349924))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!610772 (= res!392881 (= (select (store (arr!17927 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610772 (= lt!279287 (array!37360 (store (arr!17927 a!2986) i!1108 k0!1786) (size!18292 a!2986)))))

(declare-fun b!610773 () Bool)

(declare-fun res!392873 () Bool)

(assert (=> b!610773 (=> (not res!392873) (not e!349931))))

(assert (=> b!610773 (= res!392873 (and (= (size!18292 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18292 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18292 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!610774 () Bool)

(declare-fun Unit!19568 () Unit!19566)

(assert (=> b!610774 (= e!349937 Unit!19568)))

(declare-fun b!610775 () Bool)

(declare-fun Unit!19569 () Unit!19566)

(assert (=> b!610775 (= e!349937 Unit!19569)))

(declare-fun lt!279288 () Unit!19566)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37359 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19566)

(assert (=> b!610775 (= lt!279288 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279287 (select (arr!17927 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!610775 (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279283 () Unit!19566)

(declare-datatypes ((List!12007 0))(
  ( (Nil!12004) (Cons!12003 (h!13048 (_ BitVec 64)) (t!18226 List!12007)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37359 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12007) Unit!19566)

(assert (=> b!610775 (= lt!279283 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12004))))

(declare-fun arrayNoDuplicates!0 (array!37359 (_ BitVec 32) List!12007) Bool)

(assert (=> b!610775 (arrayNoDuplicates!0 lt!279287 #b00000000000000000000000000000000 Nil!12004)))

(declare-fun lt!279292 () Unit!19566)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37359 (_ BitVec 32) (_ BitVec 32)) Unit!19566)

(assert (=> b!610775 (= lt!279292 (lemmaNoDuplicateFromThenFromBigger!0 lt!279287 #b00000000000000000000000000000000 j!136))))

(assert (=> b!610775 (arrayNoDuplicates!0 lt!279287 j!136 Nil!12004)))

(declare-fun lt!279290 () Unit!19566)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37359 (_ BitVec 64) (_ BitVec 32) List!12007) Unit!19566)

(assert (=> b!610775 (= lt!279290 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279287 (select (arr!17927 a!2986) j!136) j!136 Nil!12004))))

(assert (=> b!610775 false))

(declare-fun b!610776 () Bool)

(declare-fun e!349925 () Bool)

(declare-fun e!349926 () Bool)

(assert (=> b!610776 (= e!349925 e!349926)))

(declare-fun res!392874 () Bool)

(assert (=> b!610776 (=> (not res!392874) (not e!349926))))

(declare-fun contains!3026 (List!12007 (_ BitVec 64)) Bool)

(assert (=> b!610776 (= res!392874 (not (contains!3026 Nil!12004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!610777 () Bool)

(assert (=> b!610777 (= e!349931 e!349923)))

(declare-fun res!392863 () Bool)

(assert (=> b!610777 (=> (not res!392863) (not e!349923))))

(declare-fun lt!279295 () SeekEntryResult!6364)

(assert (=> b!610777 (= res!392863 (or (= lt!279295 (MissingZero!6364 i!1108)) (= lt!279295 (MissingVacant!6364 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37359 (_ BitVec 32)) SeekEntryResult!6364)

(assert (=> b!610777 (= lt!279295 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!610778 () Bool)

(declare-fun res!392864 () Bool)

(assert (=> b!610778 (=> res!392864 e!349925)))

(declare-fun noDuplicate!350 (List!12007) Bool)

(assert (=> b!610778 (= res!392864 (not (noDuplicate!350 Nil!12004)))))

(declare-fun b!610779 () Bool)

(declare-fun res!392880 () Bool)

(assert (=> b!610779 (=> (not res!392880) (not e!349923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37359 (_ BitVec 32)) Bool)

(assert (=> b!610779 (= res!392880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!610780 () Bool)

(declare-fun e!349932 () Unit!19566)

(declare-fun Unit!19570 () Unit!19566)

(assert (=> b!610780 (= e!349932 Unit!19570)))

(assert (=> b!610780 false))

(declare-fun b!610781 () Bool)

(declare-fun e!349935 () Bool)

(declare-fun e!349928 () Bool)

(assert (=> b!610781 (= e!349935 (not e!349928))))

(declare-fun res!392871 () Bool)

(assert (=> b!610781 (=> res!392871 e!349928)))

(declare-fun lt!279285 () SeekEntryResult!6364)

(assert (=> b!610781 (= res!392871 (not (= lt!279285 (Found!6364 index!984))))))

(declare-fun lt!279298 () Unit!19566)

(assert (=> b!610781 (= lt!279298 e!349932)))

(declare-fun c!69320 () Bool)

(assert (=> b!610781 (= c!69320 (= lt!279285 Undefined!6364))))

(declare-fun lt!279284 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37359 (_ BitVec 32)) SeekEntryResult!6364)

(assert (=> b!610781 (= lt!279285 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279284 lt!279287 mask!3053))))

(assert (=> b!610781 e!349929))

(declare-fun res!392879 () Bool)

(assert (=> b!610781 (=> (not res!392879) (not e!349929))))

(declare-fun lt!279291 () (_ BitVec 32))

(assert (=> b!610781 (= res!392879 (= lt!279293 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279291 vacantSpotIndex!68 lt!279284 lt!279287 mask!3053)))))

(assert (=> b!610781 (= lt!279293 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279291 vacantSpotIndex!68 (select (arr!17927 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!610781 (= lt!279284 (select (store (arr!17927 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!279294 () Unit!19566)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37359 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19566)

(assert (=> b!610781 (= lt!279294 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279291 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!610781 (= lt!279291 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!610782 () Bool)

(declare-fun res!392869 () Bool)

(assert (=> b!610782 (=> (not res!392869) (not e!349931))))

(assert (=> b!610782 (= res!392869 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!610783 () Bool)

(assert (=> b!610783 (= e!349934 e!349925)))

(declare-fun res!392867 () Bool)

(assert (=> b!610783 (=> res!392867 e!349925)))

(assert (=> b!610783 (= res!392867 (or (bvsgt #b00000000000000000000000000000000 (size!18292 a!2986)) (bvsge (size!18292 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!610783 (arrayNoDuplicates!0 lt!279287 #b00000000000000000000000000000000 Nil!12004)))

(declare-fun lt!279297 () Unit!19566)

(assert (=> b!610783 (= lt!279297 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12004))))

(assert (=> b!610783 (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279282 () Unit!19566)

(assert (=> b!610783 (= lt!279282 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279287 (select (arr!17927 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!610783 e!349936))

(declare-fun res!392878 () Bool)

(assert (=> b!610783 (=> (not res!392878) (not e!349936))))

(assert (=> b!610783 (= res!392878 (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) j!136))))

(declare-fun b!610784 () Bool)

(assert (=> b!610784 (= e!349924 e!349935)))

(declare-fun res!392870 () Bool)

(assert (=> b!610784 (=> (not res!392870) (not e!349935))))

(assert (=> b!610784 (= res!392870 (and (= lt!279289 (Found!6364 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17927 a!2986) index!984) (select (arr!17927 a!2986) j!136))) (not (= (select (arr!17927 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!610784 (= lt!279289 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17927 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610785 () Bool)

(declare-fun e!349927 () Bool)

(declare-fun e!349922 () Bool)

(assert (=> b!610785 (= e!349927 e!349922)))

(declare-fun res!392868 () Bool)

(assert (=> b!610785 (=> (not res!392868) (not e!349922))))

(assert (=> b!610785 (= res!392868 (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) j!136))))

(declare-fun b!610786 () Bool)

(assert (=> b!610786 (= e!349922 (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) index!984))))

(declare-fun res!392882 () Bool)

(assert (=> start!55782 (=> (not res!392882) (not e!349931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55782 (= res!392882 (validMask!0 mask!3053))))

(assert (=> start!55782 e!349931))

(assert (=> start!55782 true))

(declare-fun array_inv!13810 (array!37359) Bool)

(assert (=> start!55782 (array_inv!13810 a!2986)))

(declare-fun b!610787 () Bool)

(assert (=> b!610787 (= e!349926 (not (contains!3026 Nil!12004 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!610788 () Bool)

(declare-fun e!349933 () Bool)

(assert (=> b!610788 (= e!349933 e!349927)))

(declare-fun res!392862 () Bool)

(assert (=> b!610788 (=> res!392862 e!349927)))

(declare-fun lt!279296 () (_ BitVec 64))

(assert (=> b!610788 (= res!392862 (or (not (= (select (arr!17927 a!2986) j!136) lt!279284)) (not (= (select (arr!17927 a!2986) j!136) lt!279296)) (bvsge j!136 index!984)))))

(declare-fun b!610789 () Bool)

(assert (=> b!610789 (= e!349928 e!349938)))

(declare-fun res!392876 () Bool)

(assert (=> b!610789 (=> res!392876 e!349938)))

(assert (=> b!610789 (= res!392876 (or (not (= (select (arr!17927 a!2986) j!136) lt!279284)) (not (= (select (arr!17927 a!2986) j!136) lt!279296))))))

(assert (=> b!610789 e!349933))

(declare-fun res!392872 () Bool)

(assert (=> b!610789 (=> (not res!392872) (not e!349933))))

(assert (=> b!610789 (= res!392872 (= lt!279296 (select (arr!17927 a!2986) j!136)))))

(assert (=> b!610789 (= lt!279296 (select (store (arr!17927 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!610790 () Bool)

(declare-fun res!392865 () Bool)

(assert (=> b!610790 (=> (not res!392865) (not e!349923))))

(assert (=> b!610790 (= res!392865 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12004))))

(declare-fun b!610791 () Bool)

(declare-fun Unit!19571 () Unit!19566)

(assert (=> b!610791 (= e!349932 Unit!19571)))

(declare-fun b!610792 () Bool)

(declare-fun res!392875 () Bool)

(assert (=> b!610792 (=> (not res!392875) (not e!349931))))

(assert (=> b!610792 (= res!392875 (validKeyInArray!0 (select (arr!17927 a!2986) j!136)))))

(assert (= (and start!55782 res!392882) b!610773))

(assert (= (and b!610773 res!392873) b!610792))

(assert (= (and b!610792 res!392875) b!610771))

(assert (= (and b!610771 res!392861) b!610782))

(assert (= (and b!610782 res!392869) b!610777))

(assert (= (and b!610777 res!392863) b!610779))

(assert (= (and b!610779 res!392880) b!610790))

(assert (= (and b!610790 res!392865) b!610769))

(assert (= (and b!610769 res!392877) b!610772))

(assert (= (and b!610772 res!392881) b!610784))

(assert (= (and b!610784 res!392870) b!610781))

(assert (= (and b!610781 res!392879) b!610770))

(assert (= (and b!610781 c!69320) b!610780))

(assert (= (and b!610781 (not c!69320)) b!610791))

(assert (= (and b!610781 (not res!392871)) b!610789))

(assert (= (and b!610789 res!392872) b!610788))

(assert (= (and b!610788 (not res!392862)) b!610785))

(assert (= (and b!610785 res!392868) b!610786))

(assert (= (and b!610789 (not res!392876)) b!610768))

(assert (= (and b!610768 c!69321) b!610775))

(assert (= (and b!610768 (not c!69321)) b!610774))

(assert (= (and b!610768 (not res!392866)) b!610783))

(assert (= (and b!610783 res!392878) b!610767))

(assert (= (and b!610783 (not res!392867)) b!610778))

(assert (= (and b!610778 (not res!392864)) b!610776))

(assert (= (and b!610776 res!392874) b!610787))

(declare-fun m!586693 () Bool)

(assert (=> b!610776 m!586693))

(declare-fun m!586695 () Bool)

(assert (=> b!610781 m!586695))

(declare-fun m!586697 () Bool)

(assert (=> b!610781 m!586697))

(declare-fun m!586699 () Bool)

(assert (=> b!610781 m!586699))

(declare-fun m!586701 () Bool)

(assert (=> b!610781 m!586701))

(declare-fun m!586703 () Bool)

(assert (=> b!610781 m!586703))

(declare-fun m!586705 () Bool)

(assert (=> b!610781 m!586705))

(assert (=> b!610781 m!586701))

(declare-fun m!586707 () Bool)

(assert (=> b!610781 m!586707))

(declare-fun m!586709 () Bool)

(assert (=> b!610781 m!586709))

(declare-fun m!586711 () Bool)

(assert (=> b!610787 m!586711))

(assert (=> b!610792 m!586701))

(assert (=> b!610792 m!586701))

(declare-fun m!586713 () Bool)

(assert (=> b!610792 m!586713))

(declare-fun m!586715 () Bool)

(assert (=> b!610777 m!586715))

(assert (=> b!610767 m!586701))

(assert (=> b!610767 m!586701))

(declare-fun m!586717 () Bool)

(assert (=> b!610767 m!586717))

(assert (=> b!610789 m!586701))

(assert (=> b!610789 m!586707))

(declare-fun m!586719 () Bool)

(assert (=> b!610789 m!586719))

(assert (=> b!610775 m!586701))

(declare-fun m!586721 () Bool)

(assert (=> b!610775 m!586721))

(assert (=> b!610775 m!586701))

(declare-fun m!586723 () Bool)

(assert (=> b!610775 m!586723))

(assert (=> b!610775 m!586701))

(declare-fun m!586725 () Bool)

(assert (=> b!610775 m!586725))

(assert (=> b!610775 m!586701))

(declare-fun m!586727 () Bool)

(assert (=> b!610775 m!586727))

(declare-fun m!586729 () Bool)

(assert (=> b!610775 m!586729))

(declare-fun m!586731 () Bool)

(assert (=> b!610775 m!586731))

(declare-fun m!586733 () Bool)

(assert (=> b!610775 m!586733))

(declare-fun m!586735 () Bool)

(assert (=> b!610769 m!586735))

(assert (=> b!610788 m!586701))

(declare-fun m!586737 () Bool)

(assert (=> b!610790 m!586737))

(declare-fun m!586739 () Bool)

(assert (=> b!610771 m!586739))

(declare-fun m!586741 () Bool)

(assert (=> start!55782 m!586741))

(declare-fun m!586743 () Bool)

(assert (=> start!55782 m!586743))

(declare-fun m!586745 () Bool)

(assert (=> b!610784 m!586745))

(assert (=> b!610784 m!586701))

(assert (=> b!610784 m!586701))

(declare-fun m!586747 () Bool)

(assert (=> b!610784 m!586747))

(assert (=> b!610785 m!586701))

(assert (=> b!610785 m!586701))

(declare-fun m!586749 () Bool)

(assert (=> b!610785 m!586749))

(declare-fun m!586751 () Bool)

(assert (=> b!610779 m!586751))

(assert (=> b!610772 m!586707))

(declare-fun m!586753 () Bool)

(assert (=> b!610772 m!586753))

(declare-fun m!586755 () Bool)

(assert (=> b!610778 m!586755))

(assert (=> b!610783 m!586701))

(assert (=> b!610783 m!586701))

(assert (=> b!610783 m!586749))

(assert (=> b!610783 m!586721))

(assert (=> b!610783 m!586701))

(declare-fun m!586757 () Bool)

(assert (=> b!610783 m!586757))

(assert (=> b!610783 m!586701))

(declare-fun m!586759 () Bool)

(assert (=> b!610783 m!586759))

(assert (=> b!610783 m!586733))

(assert (=> b!610786 m!586701))

(assert (=> b!610786 m!586701))

(assert (=> b!610786 m!586717))

(declare-fun m!586761 () Bool)

(assert (=> b!610782 m!586761))

(check-sat (not b!610777) (not b!610786) (not b!610785) (not b!610790) (not b!610778) (not b!610792) (not b!610771) (not b!610775) (not b!610767) (not start!55782) (not b!610787) (not b!610784) (not b!610783) (not b!610782) (not b!610779) (not b!610781) (not b!610776))
(check-sat)
(get-model)

(declare-fun d!88191 () Bool)

(assert (=> d!88191 (= (validKeyInArray!0 (select (arr!17927 a!2986) j!136)) (and (not (= (select (arr!17927 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17927 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610792 d!88191))

(declare-fun b!610961 () Bool)

(declare-fun e!350049 () SeekEntryResult!6364)

(declare-fun e!350048 () SeekEntryResult!6364)

(assert (=> b!610961 (= e!350049 e!350048)))

(declare-fun c!69342 () Bool)

(declare-fun lt!279406 () (_ BitVec 64))

(assert (=> b!610961 (= c!69342 (= lt!279406 lt!279284))))

(declare-fun b!610962 () Bool)

(assert (=> b!610962 (= e!350049 Undefined!6364)))

(declare-fun b!610963 () Bool)

(declare-fun e!350047 () SeekEntryResult!6364)

(assert (=> b!610963 (= e!350047 (MissingVacant!6364 vacantSpotIndex!68))))

(declare-fun b!610964 () Bool)

(assert (=> b!610964 (= e!350048 (Found!6364 index!984))))

(declare-fun b!610965 () Bool)

(assert (=> b!610965 (= e!350047 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!279284 lt!279287 mask!3053))))

(declare-fun b!610966 () Bool)

(declare-fun c!69341 () Bool)

(assert (=> b!610966 (= c!69341 (= lt!279406 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610966 (= e!350048 e!350047)))

(declare-fun d!88193 () Bool)

(declare-fun lt!279405 () SeekEntryResult!6364)

(get-info :version)

(assert (=> d!88193 (and (or ((_ is Undefined!6364) lt!279405) (not ((_ is Found!6364) lt!279405)) (and (bvsge (index!27738 lt!279405) #b00000000000000000000000000000000) (bvslt (index!27738 lt!279405) (size!18292 lt!279287)))) (or ((_ is Undefined!6364) lt!279405) ((_ is Found!6364) lt!279405) (not ((_ is MissingVacant!6364) lt!279405)) (not (= (index!27740 lt!279405) vacantSpotIndex!68)) (and (bvsge (index!27740 lt!279405) #b00000000000000000000000000000000) (bvslt (index!27740 lt!279405) (size!18292 lt!279287)))) (or ((_ is Undefined!6364) lt!279405) (ite ((_ is Found!6364) lt!279405) (= (select (arr!17927 lt!279287) (index!27738 lt!279405)) lt!279284) (and ((_ is MissingVacant!6364) lt!279405) (= (index!27740 lt!279405) vacantSpotIndex!68) (= (select (arr!17927 lt!279287) (index!27740 lt!279405)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88193 (= lt!279405 e!350049)))

(declare-fun c!69340 () Bool)

(assert (=> d!88193 (= c!69340 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88193 (= lt!279406 (select (arr!17927 lt!279287) index!984))))

(assert (=> d!88193 (validMask!0 mask!3053)))

(assert (=> d!88193 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279284 lt!279287 mask!3053) lt!279405)))

(assert (= (and d!88193 c!69340) b!610962))

(assert (= (and d!88193 (not c!69340)) b!610961))

(assert (= (and b!610961 c!69342) b!610964))

(assert (= (and b!610961 (not c!69342)) b!610966))

(assert (= (and b!610966 c!69341) b!610963))

(assert (= (and b!610966 (not c!69341)) b!610965))

(assert (=> b!610965 m!586695))

(assert (=> b!610965 m!586695))

(declare-fun m!586903 () Bool)

(assert (=> b!610965 m!586903))

(declare-fun m!586905 () Bool)

(assert (=> d!88193 m!586905))

(declare-fun m!586907 () Bool)

(assert (=> d!88193 m!586907))

(declare-fun m!586909 () Bool)

(assert (=> d!88193 m!586909))

(assert (=> d!88193 m!586741))

(assert (=> b!610781 d!88193))

(declare-fun b!610967 () Bool)

(declare-fun e!350052 () SeekEntryResult!6364)

(declare-fun e!350051 () SeekEntryResult!6364)

(assert (=> b!610967 (= e!350052 e!350051)))

(declare-fun lt!279408 () (_ BitVec 64))

(declare-fun c!69345 () Bool)

(assert (=> b!610967 (= c!69345 (= lt!279408 (select (arr!17927 a!2986) j!136)))))

(declare-fun b!610968 () Bool)

(assert (=> b!610968 (= e!350052 Undefined!6364)))

(declare-fun b!610969 () Bool)

(declare-fun e!350050 () SeekEntryResult!6364)

(assert (=> b!610969 (= e!350050 (MissingVacant!6364 vacantSpotIndex!68))))

(declare-fun b!610970 () Bool)

(assert (=> b!610970 (= e!350051 (Found!6364 lt!279291))))

(declare-fun b!610971 () Bool)

(assert (=> b!610971 (= e!350050 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279291 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17927 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610972 () Bool)

(declare-fun c!69344 () Bool)

(assert (=> b!610972 (= c!69344 (= lt!279408 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610972 (= e!350051 e!350050)))

(declare-fun d!88195 () Bool)

(declare-fun lt!279407 () SeekEntryResult!6364)

(assert (=> d!88195 (and (or ((_ is Undefined!6364) lt!279407) (not ((_ is Found!6364) lt!279407)) (and (bvsge (index!27738 lt!279407) #b00000000000000000000000000000000) (bvslt (index!27738 lt!279407) (size!18292 a!2986)))) (or ((_ is Undefined!6364) lt!279407) ((_ is Found!6364) lt!279407) (not ((_ is MissingVacant!6364) lt!279407)) (not (= (index!27740 lt!279407) vacantSpotIndex!68)) (and (bvsge (index!27740 lt!279407) #b00000000000000000000000000000000) (bvslt (index!27740 lt!279407) (size!18292 a!2986)))) (or ((_ is Undefined!6364) lt!279407) (ite ((_ is Found!6364) lt!279407) (= (select (arr!17927 a!2986) (index!27738 lt!279407)) (select (arr!17927 a!2986) j!136)) (and ((_ is MissingVacant!6364) lt!279407) (= (index!27740 lt!279407) vacantSpotIndex!68) (= (select (arr!17927 a!2986) (index!27740 lt!279407)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88195 (= lt!279407 e!350052)))

(declare-fun c!69343 () Bool)

(assert (=> d!88195 (= c!69343 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88195 (= lt!279408 (select (arr!17927 a!2986) lt!279291))))

(assert (=> d!88195 (validMask!0 mask!3053)))

(assert (=> d!88195 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279291 vacantSpotIndex!68 (select (arr!17927 a!2986) j!136) a!2986 mask!3053) lt!279407)))

(assert (= (and d!88195 c!69343) b!610968))

(assert (= (and d!88195 (not c!69343)) b!610967))

(assert (= (and b!610967 c!69345) b!610970))

(assert (= (and b!610967 (not c!69345)) b!610972))

(assert (= (and b!610972 c!69344) b!610969))

(assert (= (and b!610972 (not c!69344)) b!610971))

(declare-fun m!586911 () Bool)

(assert (=> b!610971 m!586911))

(assert (=> b!610971 m!586911))

(assert (=> b!610971 m!586701))

(declare-fun m!586913 () Bool)

(assert (=> b!610971 m!586913))

(declare-fun m!586915 () Bool)

(assert (=> d!88195 m!586915))

(declare-fun m!586917 () Bool)

(assert (=> d!88195 m!586917))

(declare-fun m!586919 () Bool)

(assert (=> d!88195 m!586919))

(assert (=> d!88195 m!586741))

(assert (=> b!610781 d!88195))

(declare-fun b!610973 () Bool)

(declare-fun e!350055 () SeekEntryResult!6364)

(declare-fun e!350054 () SeekEntryResult!6364)

(assert (=> b!610973 (= e!350055 e!350054)))

(declare-fun c!69348 () Bool)

(declare-fun lt!279410 () (_ BitVec 64))

(assert (=> b!610973 (= c!69348 (= lt!279410 lt!279284))))

(declare-fun b!610974 () Bool)

(assert (=> b!610974 (= e!350055 Undefined!6364)))

(declare-fun b!610975 () Bool)

(declare-fun e!350053 () SeekEntryResult!6364)

(assert (=> b!610975 (= e!350053 (MissingVacant!6364 vacantSpotIndex!68))))

(declare-fun b!610976 () Bool)

(assert (=> b!610976 (= e!350054 (Found!6364 lt!279291))))

(declare-fun b!610977 () Bool)

(assert (=> b!610977 (= e!350053 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279291 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!279284 lt!279287 mask!3053))))

(declare-fun b!610978 () Bool)

(declare-fun c!69347 () Bool)

(assert (=> b!610978 (= c!69347 (= lt!279410 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610978 (= e!350054 e!350053)))

(declare-fun lt!279409 () SeekEntryResult!6364)

(declare-fun d!88197 () Bool)

(assert (=> d!88197 (and (or ((_ is Undefined!6364) lt!279409) (not ((_ is Found!6364) lt!279409)) (and (bvsge (index!27738 lt!279409) #b00000000000000000000000000000000) (bvslt (index!27738 lt!279409) (size!18292 lt!279287)))) (or ((_ is Undefined!6364) lt!279409) ((_ is Found!6364) lt!279409) (not ((_ is MissingVacant!6364) lt!279409)) (not (= (index!27740 lt!279409) vacantSpotIndex!68)) (and (bvsge (index!27740 lt!279409) #b00000000000000000000000000000000) (bvslt (index!27740 lt!279409) (size!18292 lt!279287)))) (or ((_ is Undefined!6364) lt!279409) (ite ((_ is Found!6364) lt!279409) (= (select (arr!17927 lt!279287) (index!27738 lt!279409)) lt!279284) (and ((_ is MissingVacant!6364) lt!279409) (= (index!27740 lt!279409) vacantSpotIndex!68) (= (select (arr!17927 lt!279287) (index!27740 lt!279409)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88197 (= lt!279409 e!350055)))

(declare-fun c!69346 () Bool)

(assert (=> d!88197 (= c!69346 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88197 (= lt!279410 (select (arr!17927 lt!279287) lt!279291))))

(assert (=> d!88197 (validMask!0 mask!3053)))

(assert (=> d!88197 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279291 vacantSpotIndex!68 lt!279284 lt!279287 mask!3053) lt!279409)))

(assert (= (and d!88197 c!69346) b!610974))

(assert (= (and d!88197 (not c!69346)) b!610973))

(assert (= (and b!610973 c!69348) b!610976))

(assert (= (and b!610973 (not c!69348)) b!610978))

(assert (= (and b!610978 c!69347) b!610975))

(assert (= (and b!610978 (not c!69347)) b!610977))

(assert (=> b!610977 m!586911))

(assert (=> b!610977 m!586911))

(declare-fun m!586921 () Bool)

(assert (=> b!610977 m!586921))

(declare-fun m!586923 () Bool)

(assert (=> d!88197 m!586923))

(declare-fun m!586925 () Bool)

(assert (=> d!88197 m!586925))

(declare-fun m!586927 () Bool)

(assert (=> d!88197 m!586927))

(assert (=> d!88197 m!586741))

(assert (=> b!610781 d!88197))

(declare-fun d!88199 () Bool)

(declare-fun lt!279413 () (_ BitVec 32))

(assert (=> d!88199 (and (bvsge lt!279413 #b00000000000000000000000000000000) (bvslt lt!279413 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88199 (= lt!279413 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!88199 (validMask!0 mask!3053)))

(assert (=> d!88199 (= (nextIndex!0 index!984 x!910 mask!3053) lt!279413)))

(declare-fun bs!18616 () Bool)

(assert (= bs!18616 d!88199))

(declare-fun m!586929 () Bool)

(assert (=> bs!18616 m!586929))

(assert (=> bs!18616 m!586741))

(assert (=> b!610781 d!88199))

(declare-fun d!88201 () Bool)

(declare-fun e!350058 () Bool)

(assert (=> d!88201 e!350058))

(declare-fun res!393017 () Bool)

(assert (=> d!88201 (=> (not res!393017) (not e!350058))))

(assert (=> d!88201 (= res!393017 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18292 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18292 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18292 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18292 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18292 a!2986))))))

(declare-fun lt!279416 () Unit!19566)

(declare-fun choose!9 (array!37359 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19566)

(assert (=> d!88201 (= lt!279416 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279291 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88201 (validMask!0 mask!3053)))

(assert (=> d!88201 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279291 vacantSpotIndex!68 mask!3053) lt!279416)))

(declare-fun b!610981 () Bool)

(assert (=> b!610981 (= e!350058 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279291 vacantSpotIndex!68 (select (arr!17927 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279291 vacantSpotIndex!68 (select (store (arr!17927 a!2986) i!1108 k0!1786) j!136) (array!37360 (store (arr!17927 a!2986) i!1108 k0!1786) (size!18292 a!2986)) mask!3053)))))

(assert (= (and d!88201 res!393017) b!610981))

(declare-fun m!586931 () Bool)

(assert (=> d!88201 m!586931))

(assert (=> d!88201 m!586741))

(assert (=> b!610981 m!586697))

(declare-fun m!586933 () Bool)

(assert (=> b!610981 m!586933))

(assert (=> b!610981 m!586701))

(assert (=> b!610981 m!586703))

(assert (=> b!610981 m!586701))

(assert (=> b!610981 m!586707))

(assert (=> b!610981 m!586697))

(assert (=> b!610781 d!88201))

(declare-fun d!88205 () Bool)

(declare-fun res!393028 () Bool)

(declare-fun e!350069 () Bool)

(assert (=> d!88205 (=> res!393028 e!350069)))

(assert (=> d!88205 (= res!393028 (= (select (arr!17927 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88205 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!350069)))

(declare-fun b!610992 () Bool)

(declare-fun e!350070 () Bool)

(assert (=> b!610992 (= e!350069 e!350070)))

(declare-fun res!393029 () Bool)

(assert (=> b!610992 (=> (not res!393029) (not e!350070))))

(assert (=> b!610992 (= res!393029 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18292 a!2986)))))

(declare-fun b!610993 () Bool)

(assert (=> b!610993 (= e!350070 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88205 (not res!393028)) b!610992))

(assert (= (and b!610992 res!393029) b!610993))

(declare-fun m!586941 () Bool)

(assert (=> d!88205 m!586941))

(declare-fun m!586943 () Bool)

(assert (=> b!610993 m!586943))

(assert (=> b!610782 d!88205))

(declare-fun d!88209 () Bool)

(assert (=> d!88209 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610771 d!88209))

(declare-fun b!611007 () Bool)

(declare-fun e!350082 () Bool)

(declare-fun call!33136 () Bool)

(assert (=> b!611007 (= e!350082 call!33136)))

(declare-fun b!611008 () Bool)

(assert (=> b!611008 (= e!350082 call!33136)))

(declare-fun b!611009 () Bool)

(declare-fun e!350084 () Bool)

(assert (=> b!611009 (= e!350084 e!350082)))

(declare-fun c!69351 () Bool)

(assert (=> b!611009 (= c!69351 (validKeyInArray!0 (select (arr!17927 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!611010 () Bool)

(declare-fun e!350085 () Bool)

(assert (=> b!611010 (= e!350085 e!350084)))

(declare-fun res!393039 () Bool)

(assert (=> b!611010 (=> (not res!393039) (not e!350084))))

(declare-fun e!350083 () Bool)

(assert (=> b!611010 (= res!393039 (not e!350083))))

(declare-fun res!393041 () Bool)

(assert (=> b!611010 (=> (not res!393041) (not e!350083))))

(assert (=> b!611010 (= res!393041 (validKeyInArray!0 (select (arr!17927 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!611011 () Bool)

(assert (=> b!611011 (= e!350083 (contains!3026 Nil!12004 (select (arr!17927 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88211 () Bool)

(declare-fun res!393040 () Bool)

(assert (=> d!88211 (=> res!393040 e!350085)))

(assert (=> d!88211 (= res!393040 (bvsge #b00000000000000000000000000000000 (size!18292 a!2986)))))

(assert (=> d!88211 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12004) e!350085)))

(declare-fun bm!33133 () Bool)

(assert (=> bm!33133 (= call!33136 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69351 (Cons!12003 (select (arr!17927 a!2986) #b00000000000000000000000000000000) Nil!12004) Nil!12004)))))

(assert (= (and d!88211 (not res!393040)) b!611010))

(assert (= (and b!611010 res!393041) b!611011))

(assert (= (and b!611010 res!393039) b!611009))

(assert (= (and b!611009 c!69351) b!611007))

(assert (= (and b!611009 (not c!69351)) b!611008))

(assert (= (or b!611007 b!611008) bm!33133))

(assert (=> b!611009 m!586941))

(assert (=> b!611009 m!586941))

(declare-fun m!586949 () Bool)

(assert (=> b!611009 m!586949))

(assert (=> b!611010 m!586941))

(assert (=> b!611010 m!586941))

(assert (=> b!611010 m!586949))

(assert (=> b!611011 m!586941))

(assert (=> b!611011 m!586941))

(declare-fun m!586951 () Bool)

(assert (=> b!611011 m!586951))

(assert (=> bm!33133 m!586941))

(declare-fun m!586953 () Bool)

(assert (=> bm!33133 m!586953))

(assert (=> b!610790 d!88211))

(declare-fun b!611032 () Bool)

(declare-fun e!350098 () Bool)

(declare-fun call!33139 () Bool)

(assert (=> b!611032 (= e!350098 call!33139)))

(declare-fun b!611033 () Bool)

(declare-fun e!350099 () Bool)

(assert (=> b!611033 (= e!350098 e!350099)))

(declare-fun lt!279435 () (_ BitVec 64))

(assert (=> b!611033 (= lt!279435 (select (arr!17927 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!279433 () Unit!19566)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37359 (_ BitVec 64) (_ BitVec 32)) Unit!19566)

(assert (=> b!611033 (= lt!279433 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!279435 #b00000000000000000000000000000000))))

(assert (=> b!611033 (arrayContainsKey!0 a!2986 lt!279435 #b00000000000000000000000000000000)))

(declare-fun lt!279434 () Unit!19566)

(assert (=> b!611033 (= lt!279434 lt!279433)))

(declare-fun res!393047 () Bool)

(assert (=> b!611033 (= res!393047 (= (seekEntryOrOpen!0 (select (arr!17927 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6364 #b00000000000000000000000000000000)))))

(assert (=> b!611033 (=> (not res!393047) (not e!350099))))

(declare-fun b!611034 () Bool)

(assert (=> b!611034 (= e!350099 call!33139)))

(declare-fun bm!33136 () Bool)

(assert (=> bm!33136 (= call!33139 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!611035 () Bool)

(declare-fun e!350100 () Bool)

(assert (=> b!611035 (= e!350100 e!350098)))

(declare-fun c!69360 () Bool)

(assert (=> b!611035 (= c!69360 (validKeyInArray!0 (select (arr!17927 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88215 () Bool)

(declare-fun res!393046 () Bool)

(assert (=> d!88215 (=> res!393046 e!350100)))

(assert (=> d!88215 (= res!393046 (bvsge #b00000000000000000000000000000000 (size!18292 a!2986)))))

(assert (=> d!88215 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!350100)))

(assert (= (and d!88215 (not res!393046)) b!611035))

(assert (= (and b!611035 c!69360) b!611033))

(assert (= (and b!611035 (not c!69360)) b!611032))

(assert (= (and b!611033 res!393047) b!611034))

(assert (= (or b!611034 b!611032) bm!33136))

(assert (=> b!611033 m!586941))

(declare-fun m!586955 () Bool)

(assert (=> b!611033 m!586955))

(declare-fun m!586957 () Bool)

(assert (=> b!611033 m!586957))

(assert (=> b!611033 m!586941))

(declare-fun m!586959 () Bool)

(assert (=> b!611033 m!586959))

(declare-fun m!586961 () Bool)

(assert (=> bm!33136 m!586961))

(assert (=> b!611035 m!586941))

(assert (=> b!611035 m!586941))

(assert (=> b!611035 m!586949))

(assert (=> b!610779 d!88215))

(declare-fun d!88217 () Bool)

(declare-fun lt!279456 () SeekEntryResult!6364)

(assert (=> d!88217 (and (or ((_ is Undefined!6364) lt!279456) (not ((_ is Found!6364) lt!279456)) (and (bvsge (index!27738 lt!279456) #b00000000000000000000000000000000) (bvslt (index!27738 lt!279456) (size!18292 a!2986)))) (or ((_ is Undefined!6364) lt!279456) ((_ is Found!6364) lt!279456) (not ((_ is MissingZero!6364) lt!279456)) (and (bvsge (index!27737 lt!279456) #b00000000000000000000000000000000) (bvslt (index!27737 lt!279456) (size!18292 a!2986)))) (or ((_ is Undefined!6364) lt!279456) ((_ is Found!6364) lt!279456) ((_ is MissingZero!6364) lt!279456) (not ((_ is MissingVacant!6364) lt!279456)) (and (bvsge (index!27740 lt!279456) #b00000000000000000000000000000000) (bvslt (index!27740 lt!279456) (size!18292 a!2986)))) (or ((_ is Undefined!6364) lt!279456) (ite ((_ is Found!6364) lt!279456) (= (select (arr!17927 a!2986) (index!27738 lt!279456)) k0!1786) (ite ((_ is MissingZero!6364) lt!279456) (= (select (arr!17927 a!2986) (index!27737 lt!279456)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6364) lt!279456) (= (select (arr!17927 a!2986) (index!27740 lt!279456)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!350129 () SeekEntryResult!6364)

(assert (=> d!88217 (= lt!279456 e!350129)))

(declare-fun c!69376 () Bool)

(declare-fun lt!279458 () SeekEntryResult!6364)

(assert (=> d!88217 (= c!69376 (and ((_ is Intermediate!6364) lt!279458) (undefined!7176 lt!279458)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37359 (_ BitVec 32)) SeekEntryResult!6364)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88217 (= lt!279458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88217 (validMask!0 mask!3053)))

(assert (=> d!88217 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!279456)))

(declare-fun b!611078 () Bool)

(declare-fun e!350128 () SeekEntryResult!6364)

(assert (=> b!611078 (= e!350129 e!350128)))

(declare-fun lt!279457 () (_ BitVec 64))

(assert (=> b!611078 (= lt!279457 (select (arr!17927 a!2986) (index!27739 lt!279458)))))

(declare-fun c!69377 () Bool)

(assert (=> b!611078 (= c!69377 (= lt!279457 k0!1786))))

(declare-fun b!611079 () Bool)

(declare-fun e!350130 () SeekEntryResult!6364)

(assert (=> b!611079 (= e!350130 (MissingZero!6364 (index!27739 lt!279458)))))

(declare-fun b!611080 () Bool)

(assert (=> b!611080 (= e!350129 Undefined!6364)))

(declare-fun b!611081 () Bool)

(declare-fun c!69378 () Bool)

(assert (=> b!611081 (= c!69378 (= lt!279457 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611081 (= e!350128 e!350130)))

(declare-fun b!611082 () Bool)

(assert (=> b!611082 (= e!350130 (seekKeyOrZeroReturnVacant!0 (x!56558 lt!279458) (index!27739 lt!279458) (index!27739 lt!279458) k0!1786 a!2986 mask!3053))))

(declare-fun b!611083 () Bool)

(assert (=> b!611083 (= e!350128 (Found!6364 (index!27739 lt!279458)))))

(assert (= (and d!88217 c!69376) b!611080))

(assert (= (and d!88217 (not c!69376)) b!611078))

(assert (= (and b!611078 c!69377) b!611083))

(assert (= (and b!611078 (not c!69377)) b!611081))

(assert (= (and b!611081 c!69378) b!611079))

(assert (= (and b!611081 (not c!69378)) b!611082))

(declare-fun m!587003 () Bool)

(assert (=> d!88217 m!587003))

(declare-fun m!587005 () Bool)

(assert (=> d!88217 m!587005))

(assert (=> d!88217 m!586741))

(declare-fun m!587007 () Bool)

(assert (=> d!88217 m!587007))

(declare-fun m!587009 () Bool)

(assert (=> d!88217 m!587009))

(assert (=> d!88217 m!587005))

(declare-fun m!587011 () Bool)

(assert (=> d!88217 m!587011))

(declare-fun m!587013 () Bool)

(assert (=> b!611078 m!587013))

(declare-fun m!587015 () Bool)

(assert (=> b!611082 m!587015))

(assert (=> b!610777 d!88217))

(declare-fun d!88237 () Bool)

(declare-fun res!393064 () Bool)

(declare-fun e!350141 () Bool)

(assert (=> d!88237 (=> res!393064 e!350141)))

(assert (=> d!88237 (= res!393064 ((_ is Nil!12004) Nil!12004))))

(assert (=> d!88237 (= (noDuplicate!350 Nil!12004) e!350141)))

(declare-fun b!611100 () Bool)

(declare-fun e!350142 () Bool)

(assert (=> b!611100 (= e!350141 e!350142)))

(declare-fun res!393065 () Bool)

(assert (=> b!611100 (=> (not res!393065) (not e!350142))))

(assert (=> b!611100 (= res!393065 (not (contains!3026 (t!18226 Nil!12004) (h!13048 Nil!12004))))))

(declare-fun b!611101 () Bool)

(assert (=> b!611101 (= e!350142 (noDuplicate!350 (t!18226 Nil!12004)))))

(assert (= (and d!88237 (not res!393064)) b!611100))

(assert (= (and b!611100 res!393065) b!611101))

(declare-fun m!587017 () Bool)

(assert (=> b!611100 m!587017))

(declare-fun m!587019 () Bool)

(assert (=> b!611101 m!587019))

(assert (=> b!610778 d!88237))

(declare-fun d!88239 () Bool)

(declare-fun res!393072 () Bool)

(declare-fun e!350149 () Bool)

(assert (=> d!88239 (=> res!393072 e!350149)))

(assert (=> d!88239 (= res!393072 (= (select (arr!17927 lt!279287) index!984) (select (arr!17927 a!2986) j!136)))))

(assert (=> d!88239 (= (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) index!984) e!350149)))

(declare-fun b!611110 () Bool)

(declare-fun e!350150 () Bool)

(assert (=> b!611110 (= e!350149 e!350150)))

(declare-fun res!393073 () Bool)

(assert (=> b!611110 (=> (not res!393073) (not e!350150))))

(assert (=> b!611110 (= res!393073 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18292 lt!279287)))))

(declare-fun b!611111 () Bool)

(assert (=> b!611111 (= e!350150 (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88239 (not res!393072)) b!611110))

(assert (= (and b!611110 res!393073) b!611111))

(assert (=> d!88239 m!586909))

(assert (=> b!611111 m!586701))

(declare-fun m!587021 () Bool)

(assert (=> b!611111 m!587021))

(assert (=> b!610767 d!88239))

(declare-fun d!88241 () Bool)

(declare-fun lt!279468 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!239 (List!12007) (InoxSet (_ BitVec 64)))

(assert (=> d!88241 (= lt!279468 (select (content!239 Nil!12004) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!350167 () Bool)

(assert (=> d!88241 (= lt!279468 e!350167)))

(declare-fun res!393084 () Bool)

(assert (=> d!88241 (=> (not res!393084) (not e!350167))))

(assert (=> d!88241 (= res!393084 ((_ is Cons!12003) Nil!12004))))

(assert (=> d!88241 (= (contains!3026 Nil!12004 #b0000000000000000000000000000000000000000000000000000000000000000) lt!279468)))

(declare-fun b!611131 () Bool)

(declare-fun e!350166 () Bool)

(assert (=> b!611131 (= e!350167 e!350166)))

(declare-fun res!393083 () Bool)

(assert (=> b!611131 (=> res!393083 e!350166)))

(assert (=> b!611131 (= res!393083 (= (h!13048 Nil!12004) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!611132 () Bool)

(assert (=> b!611132 (= e!350166 (contains!3026 (t!18226 Nil!12004) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!88241 res!393084) b!611131))

(assert (= (and b!611131 (not res!393083)) b!611132))

(declare-fun m!587037 () Bool)

(assert (=> d!88241 m!587037))

(declare-fun m!587039 () Bool)

(assert (=> d!88241 m!587039))

(declare-fun m!587041 () Bool)

(assert (=> b!611132 m!587041))

(assert (=> b!610776 d!88241))

(declare-fun d!88247 () Bool)

(declare-fun lt!279469 () Bool)

(assert (=> d!88247 (= lt!279469 (select (content!239 Nil!12004) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!350175 () Bool)

(assert (=> d!88247 (= lt!279469 e!350175)))

(declare-fun res!393091 () Bool)

(assert (=> d!88247 (=> (not res!393091) (not e!350175))))

(assert (=> d!88247 (= res!393091 ((_ is Cons!12003) Nil!12004))))

(assert (=> d!88247 (= (contains!3026 Nil!12004 #b1000000000000000000000000000000000000000000000000000000000000000) lt!279469)))

(declare-fun b!611140 () Bool)

(declare-fun e!350174 () Bool)

(assert (=> b!611140 (= e!350175 e!350174)))

(declare-fun res!393090 () Bool)

(assert (=> b!611140 (=> res!393090 e!350174)))

(assert (=> b!611140 (= res!393090 (= (h!13048 Nil!12004) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!611141 () Bool)

(assert (=> b!611141 (= e!350174 (contains!3026 (t!18226 Nil!12004) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!88247 res!393091) b!611140))

(assert (= (and b!611140 (not res!393090)) b!611141))

(assert (=> d!88247 m!587037))

(declare-fun m!587047 () Bool)

(assert (=> d!88247 m!587047))

(declare-fun m!587049 () Bool)

(assert (=> b!611141 m!587049))

(assert (=> b!610787 d!88247))

(declare-fun d!88249 () Bool)

(assert (=> d!88249 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55782 d!88249))

(declare-fun d!88265 () Bool)

(assert (=> d!88265 (= (array_inv!13810 a!2986) (bvsge (size!18292 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55782 d!88265))

(declare-fun d!88269 () Bool)

(declare-fun res!393110 () Bool)

(declare-fun e!350197 () Bool)

(assert (=> d!88269 (=> res!393110 e!350197)))

(assert (=> d!88269 (= res!393110 (= (select (arr!17927 lt!279287) j!136) (select (arr!17927 a!2986) j!136)))))

(assert (=> d!88269 (= (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) j!136) e!350197)))

(declare-fun b!611166 () Bool)

(declare-fun e!350198 () Bool)

(assert (=> b!611166 (= e!350197 e!350198)))

(declare-fun res!393111 () Bool)

(assert (=> b!611166 (=> (not res!393111) (not e!350198))))

(assert (=> b!611166 (= res!393111 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18292 lt!279287)))))

(declare-fun b!611167 () Bool)

(assert (=> b!611167 (= e!350198 (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88269 (not res!393110)) b!611166))

(assert (= (and b!611166 res!393111) b!611167))

(declare-fun m!587081 () Bool)

(assert (=> d!88269 m!587081))

(assert (=> b!611167 m!586701))

(declare-fun m!587083 () Bool)

(assert (=> b!611167 m!587083))

(assert (=> b!610785 d!88269))

(assert (=> b!610786 d!88239))

(declare-fun d!88271 () Bool)

(assert (=> d!88271 (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279481 () Unit!19566)

(declare-fun choose!114 (array!37359 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19566)

(assert (=> d!88271 (= lt!279481 (choose!114 lt!279287 (select (arr!17927 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!88271 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!88271 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279287 (select (arr!17927 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!279481)))

(declare-fun bs!18622 () Bool)

(assert (= bs!18622 d!88271))

(assert (=> bs!18622 m!586701))

(assert (=> bs!18622 m!586727))

(assert (=> bs!18622 m!586701))

(declare-fun m!587085 () Bool)

(assert (=> bs!18622 m!587085))

(assert (=> b!610775 d!88271))

(declare-fun d!88273 () Bool)

(assert (=> d!88273 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18292 lt!279287)) (not (= (select (arr!17927 lt!279287) j!136) (select (arr!17927 a!2986) j!136))))))

(declare-fun lt!279487 () Unit!19566)

(declare-fun choose!21 (array!37359 (_ BitVec 64) (_ BitVec 32) List!12007) Unit!19566)

(assert (=> d!88273 (= lt!279487 (choose!21 lt!279287 (select (arr!17927 a!2986) j!136) j!136 Nil!12004))))

(assert (=> d!88273 (bvslt (size!18292 lt!279287) #b01111111111111111111111111111111)))

(assert (=> d!88273 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279287 (select (arr!17927 a!2986) j!136) j!136 Nil!12004) lt!279487)))

(declare-fun bs!18623 () Bool)

(assert (= bs!18623 d!88273))

(assert (=> bs!18623 m!587081))

(assert (=> bs!18623 m!586701))

(declare-fun m!587099 () Bool)

(assert (=> bs!18623 m!587099))

(assert (=> b!610775 d!88273))

(declare-fun b!611176 () Bool)

(declare-fun e!350206 () Bool)

(declare-fun call!33148 () Bool)

(assert (=> b!611176 (= e!350206 call!33148)))

(declare-fun b!611177 () Bool)

(assert (=> b!611177 (= e!350206 call!33148)))

(declare-fun b!611178 () Bool)

(declare-fun e!350208 () Bool)

(assert (=> b!611178 (= e!350208 e!350206)))

(declare-fun c!69396 () Bool)

(assert (=> b!611178 (= c!69396 (validKeyInArray!0 (select (arr!17927 lt!279287) #b00000000000000000000000000000000)))))

(declare-fun b!611179 () Bool)

(declare-fun e!350209 () Bool)

(assert (=> b!611179 (= e!350209 e!350208)))

(declare-fun res!393118 () Bool)

(assert (=> b!611179 (=> (not res!393118) (not e!350208))))

(declare-fun e!350207 () Bool)

(assert (=> b!611179 (= res!393118 (not e!350207))))

(declare-fun res!393120 () Bool)

(assert (=> b!611179 (=> (not res!393120) (not e!350207))))

(assert (=> b!611179 (= res!393120 (validKeyInArray!0 (select (arr!17927 lt!279287) #b00000000000000000000000000000000)))))

(declare-fun b!611180 () Bool)

(assert (=> b!611180 (= e!350207 (contains!3026 Nil!12004 (select (arr!17927 lt!279287) #b00000000000000000000000000000000)))))

(declare-fun d!88279 () Bool)

(declare-fun res!393119 () Bool)

(assert (=> d!88279 (=> res!393119 e!350209)))

(assert (=> d!88279 (= res!393119 (bvsge #b00000000000000000000000000000000 (size!18292 lt!279287)))))

(assert (=> d!88279 (= (arrayNoDuplicates!0 lt!279287 #b00000000000000000000000000000000 Nil!12004) e!350209)))

(declare-fun bm!33145 () Bool)

(assert (=> bm!33145 (= call!33148 (arrayNoDuplicates!0 lt!279287 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69396 (Cons!12003 (select (arr!17927 lt!279287) #b00000000000000000000000000000000) Nil!12004) Nil!12004)))))

(assert (= (and d!88279 (not res!393119)) b!611179))

(assert (= (and b!611179 res!393120) b!611180))

(assert (= (and b!611179 res!393118) b!611178))

(assert (= (and b!611178 c!69396) b!611176))

(assert (= (and b!611178 (not c!69396)) b!611177))

(assert (= (or b!611176 b!611177) bm!33145))

(declare-fun m!587101 () Bool)

(assert (=> b!611178 m!587101))

(assert (=> b!611178 m!587101))

(declare-fun m!587103 () Bool)

(assert (=> b!611178 m!587103))

(assert (=> b!611179 m!587101))

(assert (=> b!611179 m!587101))

(assert (=> b!611179 m!587103))

(assert (=> b!611180 m!587101))

(assert (=> b!611180 m!587101))

(declare-fun m!587105 () Bool)

(assert (=> b!611180 m!587105))

(assert (=> bm!33145 m!587101))

(declare-fun m!587107 () Bool)

(assert (=> bm!33145 m!587107))

(assert (=> b!610775 d!88279))

(declare-fun d!88281 () Bool)

(assert (=> d!88281 (arrayNoDuplicates!0 lt!279287 j!136 Nil!12004)))

(declare-fun lt!279493 () Unit!19566)

(declare-fun choose!39 (array!37359 (_ BitVec 32) (_ BitVec 32)) Unit!19566)

(assert (=> d!88281 (= lt!279493 (choose!39 lt!279287 #b00000000000000000000000000000000 j!136))))

(assert (=> d!88281 (bvslt (size!18292 lt!279287) #b01111111111111111111111111111111)))

(assert (=> d!88281 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!279287 #b00000000000000000000000000000000 j!136) lt!279493)))

(declare-fun bs!18625 () Bool)

(assert (= bs!18625 d!88281))

(assert (=> bs!18625 m!586729))

(declare-fun m!587119 () Bool)

(assert (=> bs!18625 m!587119))

(assert (=> b!610775 d!88281))

(declare-fun d!88291 () Bool)

(declare-fun res!393124 () Bool)

(declare-fun e!350214 () Bool)

(assert (=> d!88291 (=> res!393124 e!350214)))

(assert (=> d!88291 (= res!393124 (= (select (arr!17927 lt!279287) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17927 a!2986) j!136)))))

(assert (=> d!88291 (= (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!350214)))

(declare-fun b!611186 () Bool)

(declare-fun e!350215 () Bool)

(assert (=> b!611186 (= e!350214 e!350215)))

(declare-fun res!393125 () Bool)

(assert (=> b!611186 (=> (not res!393125) (not e!350215))))

(assert (=> b!611186 (= res!393125 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18292 lt!279287)))))

(declare-fun b!611187 () Bool)

(assert (=> b!611187 (= e!350215 (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88291 (not res!393124)) b!611186))

(assert (= (and b!611186 res!393125) b!611187))

(declare-fun m!587121 () Bool)

(assert (=> d!88291 m!587121))

(assert (=> b!611187 m!586701))

(declare-fun m!587123 () Bool)

(assert (=> b!611187 m!587123))

(assert (=> b!610775 d!88291))

(declare-fun d!88293 () Bool)

(declare-fun e!350218 () Bool)

(assert (=> d!88293 e!350218))

(declare-fun res!393128 () Bool)

(assert (=> d!88293 (=> (not res!393128) (not e!350218))))

(assert (=> d!88293 (= res!393128 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18292 a!2986))))))

(declare-fun lt!279499 () Unit!19566)

(declare-fun choose!41 (array!37359 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12007) Unit!19566)

(assert (=> d!88293 (= lt!279499 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12004))))

(assert (=> d!88293 (bvslt (size!18292 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!88293 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12004) lt!279499)))

(declare-fun b!611190 () Bool)

(assert (=> b!611190 (= e!350218 (arrayNoDuplicates!0 (array!37360 (store (arr!17927 a!2986) i!1108 k0!1786) (size!18292 a!2986)) #b00000000000000000000000000000000 Nil!12004))))

(assert (= (and d!88293 res!393128) b!611190))

(declare-fun m!587127 () Bool)

(assert (=> d!88293 m!587127))

(assert (=> b!611190 m!586707))

(declare-fun m!587129 () Bool)

(assert (=> b!611190 m!587129))

(assert (=> b!610775 d!88293))

(declare-fun b!611197 () Bool)

(declare-fun e!350222 () Bool)

(declare-fun call!33150 () Bool)

(assert (=> b!611197 (= e!350222 call!33150)))

(declare-fun b!611198 () Bool)

(assert (=> b!611198 (= e!350222 call!33150)))

(declare-fun b!611199 () Bool)

(declare-fun e!350225 () Bool)

(assert (=> b!611199 (= e!350225 e!350222)))

(declare-fun c!69399 () Bool)

(assert (=> b!611199 (= c!69399 (validKeyInArray!0 (select (arr!17927 lt!279287) j!136)))))

(declare-fun b!611200 () Bool)

(declare-fun e!350226 () Bool)

(assert (=> b!611200 (= e!350226 e!350225)))

(declare-fun res!393131 () Bool)

(assert (=> b!611200 (=> (not res!393131) (not e!350225))))

(declare-fun e!350224 () Bool)

(assert (=> b!611200 (= res!393131 (not e!350224))))

(declare-fun res!393133 () Bool)

(assert (=> b!611200 (=> (not res!393133) (not e!350224))))

(assert (=> b!611200 (= res!393133 (validKeyInArray!0 (select (arr!17927 lt!279287) j!136)))))

(declare-fun b!611201 () Bool)

(assert (=> b!611201 (= e!350224 (contains!3026 Nil!12004 (select (arr!17927 lt!279287) j!136)))))

(declare-fun d!88297 () Bool)

(declare-fun res!393132 () Bool)

(assert (=> d!88297 (=> res!393132 e!350226)))

(assert (=> d!88297 (= res!393132 (bvsge j!136 (size!18292 lt!279287)))))

(assert (=> d!88297 (= (arrayNoDuplicates!0 lt!279287 j!136 Nil!12004) e!350226)))

(declare-fun bm!33147 () Bool)

(assert (=> bm!33147 (= call!33150 (arrayNoDuplicates!0 lt!279287 (bvadd j!136 #b00000000000000000000000000000001) (ite c!69399 (Cons!12003 (select (arr!17927 lt!279287) j!136) Nil!12004) Nil!12004)))))

(assert (= (and d!88297 (not res!393132)) b!611200))

(assert (= (and b!611200 res!393133) b!611201))

(assert (= (and b!611200 res!393131) b!611199))

(assert (= (and b!611199 c!69399) b!611197))

(assert (= (and b!611199 (not c!69399)) b!611198))

(assert (= (or b!611197 b!611198) bm!33147))

(assert (=> b!611199 m!587081))

(assert (=> b!611199 m!587081))

(declare-fun m!587131 () Bool)

(assert (=> b!611199 m!587131))

(assert (=> b!611200 m!587081))

(assert (=> b!611200 m!587081))

(assert (=> b!611200 m!587131))

(assert (=> b!611201 m!587081))

(assert (=> b!611201 m!587081))

(declare-fun m!587133 () Bool)

(assert (=> b!611201 m!587133))

(assert (=> bm!33147 m!587081))

(declare-fun m!587135 () Bool)

(assert (=> bm!33147 m!587135))

(assert (=> b!610775 d!88297))

(declare-fun b!611204 () Bool)

(declare-fun e!350231 () SeekEntryResult!6364)

(declare-fun e!350230 () SeekEntryResult!6364)

(assert (=> b!611204 (= e!350231 e!350230)))

(declare-fun c!69403 () Bool)

(declare-fun lt!279507 () (_ BitVec 64))

(assert (=> b!611204 (= c!69403 (= lt!279507 (select (arr!17927 a!2986) j!136)))))

(declare-fun b!611205 () Bool)

(assert (=> b!611205 (= e!350231 Undefined!6364)))

(declare-fun b!611206 () Bool)

(declare-fun e!350229 () SeekEntryResult!6364)

(assert (=> b!611206 (= e!350229 (MissingVacant!6364 vacantSpotIndex!68))))

(declare-fun b!611207 () Bool)

(assert (=> b!611207 (= e!350230 (Found!6364 index!984))))

(declare-fun b!611208 () Bool)

(assert (=> b!611208 (= e!350229 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17927 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611209 () Bool)

(declare-fun c!69402 () Bool)

(assert (=> b!611209 (= c!69402 (= lt!279507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611209 (= e!350230 e!350229)))

(declare-fun d!88299 () Bool)

(declare-fun lt!279506 () SeekEntryResult!6364)

(assert (=> d!88299 (and (or ((_ is Undefined!6364) lt!279506) (not ((_ is Found!6364) lt!279506)) (and (bvsge (index!27738 lt!279506) #b00000000000000000000000000000000) (bvslt (index!27738 lt!279506) (size!18292 a!2986)))) (or ((_ is Undefined!6364) lt!279506) ((_ is Found!6364) lt!279506) (not ((_ is MissingVacant!6364) lt!279506)) (not (= (index!27740 lt!279506) vacantSpotIndex!68)) (and (bvsge (index!27740 lt!279506) #b00000000000000000000000000000000) (bvslt (index!27740 lt!279506) (size!18292 a!2986)))) (or ((_ is Undefined!6364) lt!279506) (ite ((_ is Found!6364) lt!279506) (= (select (arr!17927 a!2986) (index!27738 lt!279506)) (select (arr!17927 a!2986) j!136)) (and ((_ is MissingVacant!6364) lt!279506) (= (index!27740 lt!279506) vacantSpotIndex!68) (= (select (arr!17927 a!2986) (index!27740 lt!279506)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88299 (= lt!279506 e!350231)))

(declare-fun c!69401 () Bool)

(assert (=> d!88299 (= c!69401 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88299 (= lt!279507 (select (arr!17927 a!2986) index!984))))

(assert (=> d!88299 (validMask!0 mask!3053)))

(assert (=> d!88299 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17927 a!2986) j!136) a!2986 mask!3053) lt!279506)))

(assert (= (and d!88299 c!69401) b!611205))

(assert (= (and d!88299 (not c!69401)) b!611204))

(assert (= (and b!611204 c!69403) b!611207))

(assert (= (and b!611204 (not c!69403)) b!611209))

(assert (= (and b!611209 c!69402) b!611206))

(assert (= (and b!611209 (not c!69402)) b!611208))

(assert (=> b!611208 m!586695))

(assert (=> b!611208 m!586695))

(assert (=> b!611208 m!586701))

(declare-fun m!587137 () Bool)

(assert (=> b!611208 m!587137))

(declare-fun m!587139 () Bool)

(assert (=> d!88299 m!587139))

(declare-fun m!587141 () Bool)

(assert (=> d!88299 m!587141))

(assert (=> d!88299 m!586745))

(assert (=> d!88299 m!586741))

(assert (=> b!610784 d!88299))

(declare-fun d!88301 () Bool)

(assert (=> d!88301 (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279508 () Unit!19566)

(assert (=> d!88301 (= lt!279508 (choose!114 lt!279287 (select (arr!17927 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88301 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88301 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279287 (select (arr!17927 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!279508)))

(declare-fun bs!18627 () Bool)

(assert (= bs!18627 d!88301))

(assert (=> bs!18627 m!586701))

(assert (=> bs!18627 m!586757))

(assert (=> bs!18627 m!586701))

(declare-fun m!587143 () Bool)

(assert (=> bs!18627 m!587143))

(assert (=> b!610783 d!88301))

(declare-fun d!88303 () Bool)

(declare-fun res!393136 () Bool)

(declare-fun e!350232 () Bool)

(assert (=> d!88303 (=> res!393136 e!350232)))

(assert (=> d!88303 (= res!393136 (= (select (arr!17927 lt!279287) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17927 a!2986) j!136)))))

(assert (=> d!88303 (= (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!350232)))

(declare-fun b!611210 () Bool)

(declare-fun e!350233 () Bool)

(assert (=> b!611210 (= e!350232 e!350233)))

(declare-fun res!393137 () Bool)

(assert (=> b!611210 (=> (not res!393137) (not e!350233))))

(assert (=> b!611210 (= res!393137 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18292 lt!279287)))))

(declare-fun b!611211 () Bool)

(assert (=> b!611211 (= e!350233 (arrayContainsKey!0 lt!279287 (select (arr!17927 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88303 (not res!393136)) b!611210))

(assert (= (and b!611210 res!393137) b!611211))

(declare-fun m!587145 () Bool)

(assert (=> d!88303 m!587145))

(assert (=> b!611211 m!586701))

(declare-fun m!587147 () Bool)

(assert (=> b!611211 m!587147))

(assert (=> b!610783 d!88303))

(assert (=> b!610783 d!88279))

(assert (=> b!610783 d!88269))

(assert (=> b!610783 d!88293))

(check-sat (not bm!33145) (not d!88197) (not b!611208) (not b!611178) (not b!611167) (not b!610993) (not b!611101) (not b!611082) (not b!611011) (not b!611033) (not d!88241) (not b!610977) (not b!611111) (not b!611100) (not b!611035) (not b!611190) (not d!88273) (not d!88193) (not b!611009) (not b!611200) (not d!88201) (not d!88301) (not b!611187) (not d!88247) (not b!611199) (not b!610965) (not b!611211) (not d!88195) (not b!611180) (not bm!33133) (not b!610981) (not d!88281) (not d!88199) (not d!88299) (not d!88271) (not b!611010) (not b!611179) (not bm!33136) (not bm!33147) (not b!611141) (not b!611132) (not b!610971) (not d!88293) (not b!611201) (not d!88217))
(check-sat)
