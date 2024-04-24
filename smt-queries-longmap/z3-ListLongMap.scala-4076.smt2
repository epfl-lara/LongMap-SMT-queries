; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56004 () Bool)

(assert start!56004)

(declare-fun b!613827 () Bool)

(declare-datatypes ((Unit!19747 0))(
  ( (Unit!19748) )
))
(declare-fun e!351903 () Unit!19747)

(declare-fun Unit!19749 () Unit!19747)

(assert (=> b!613827 (= e!351903 Unit!19749)))

(assert (=> b!613827 false))

(declare-fun b!613828 () Bool)

(declare-fun res!395106 () Bool)

(declare-fun e!351898 () Bool)

(assert (=> b!613828 (=> res!395106 e!351898)))

(declare-datatypes ((List!11901 0))(
  ( (Nil!11898) (Cons!11897 (h!12945 (_ BitVec 64)) (t!18121 List!11901)) )
))
(declare-fun contains!3033 (List!11901 (_ BitVec 64)) Bool)

(assert (=> b!613828 (= res!395106 (contains!3033 Nil!11898 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613829 () Bool)

(declare-fun res!395112 () Bool)

(assert (=> b!613829 (=> res!395112 e!351898)))

(declare-fun noDuplicate!364 (List!11901) Bool)

(assert (=> b!613829 (= res!395112 (not (noDuplicate!364 Nil!11898)))))

(declare-fun b!613831 () Bool)

(declare-fun e!351899 () Unit!19747)

(declare-fun Unit!19750 () Unit!19747)

(assert (=> b!613831 (= e!351899 Unit!19750)))

(declare-fun b!613832 () Bool)

(declare-fun res!395121 () Bool)

(declare-fun e!351909 () Bool)

(assert (=> b!613832 (=> (not res!395121) (not e!351909))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!613832 (= res!395121 (validKeyInArray!0 k0!1786))))

(declare-fun b!613833 () Bool)

(declare-fun e!351902 () Bool)

(declare-fun e!351904 () Bool)

(assert (=> b!613833 (= e!351902 e!351904)))

(declare-fun res!395111 () Bool)

(assert (=> b!613833 (=> (not res!395111) (not e!351904))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37419 0))(
  ( (array!37420 (arr!17953 (Array (_ BitVec 32) (_ BitVec 64))) (size!18317 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37419)

(assert (=> b!613833 (= res!395111 (= (select (store (arr!17953 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!281384 () array!37419)

(assert (=> b!613833 (= lt!281384 (array!37420 (store (arr!17953 a!2986) i!1108 k0!1786) (size!18317 a!2986)))))

(declare-fun b!613834 () Bool)

(declare-fun e!351897 () Bool)

(declare-fun e!351912 () Bool)

(assert (=> b!613834 (= e!351897 e!351912)))

(declare-fun res!395109 () Bool)

(assert (=> b!613834 (=> res!395109 e!351912)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!281394 () (_ BitVec 64))

(declare-fun lt!281390 () (_ BitVec 64))

(assert (=> b!613834 (= res!395109 (or (not (= (select (arr!17953 a!2986) j!136) lt!281390)) (not (= (select (arr!17953 a!2986) j!136) lt!281394))))))

(declare-fun e!351906 () Bool)

(assert (=> b!613834 e!351906))

(declare-fun res!395124 () Bool)

(assert (=> b!613834 (=> (not res!395124) (not e!351906))))

(assert (=> b!613834 (= res!395124 (= lt!281394 (select (arr!17953 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!613834 (= lt!281394 (select (store (arr!17953 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!613835 () Bool)

(declare-fun e!351905 () Bool)

(assert (=> b!613835 (= e!351905 e!351898)))

(declare-fun res!395115 () Bool)

(assert (=> b!613835 (=> res!395115 e!351898)))

(assert (=> b!613835 (= res!395115 (or (bvsge (size!18317 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18317 a!2986)) (bvsge index!984 (size!18317 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37419 (_ BitVec 32) List!11901) Bool)

(assert (=> b!613835 (arrayNoDuplicates!0 lt!281384 index!984 Nil!11898)))

(declare-fun lt!281393 () Unit!19747)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37419 (_ BitVec 32) (_ BitVec 32)) Unit!19747)

(assert (=> b!613835 (= lt!281393 (lemmaNoDuplicateFromThenFromBigger!0 lt!281384 #b00000000000000000000000000000000 index!984))))

(assert (=> b!613835 (arrayNoDuplicates!0 lt!281384 #b00000000000000000000000000000000 Nil!11898)))

(declare-fun lt!281397 () Unit!19747)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37419 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11901) Unit!19747)

(assert (=> b!613835 (= lt!281397 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11898))))

(declare-fun arrayContainsKey!0 (array!37419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!613835 (arrayContainsKey!0 lt!281384 (select (arr!17953 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!281387 () Unit!19747)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37419 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19747)

(assert (=> b!613835 (= lt!281387 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281384 (select (arr!17953 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!351911 () Bool)

(assert (=> b!613835 e!351911))

(declare-fun res!395120 () Bool)

(assert (=> b!613835 (=> (not res!395120) (not e!351911))))

(assert (=> b!613835 (= res!395120 (arrayContainsKey!0 lt!281384 (select (arr!17953 a!2986) j!136) j!136))))

(declare-fun b!613836 () Bool)

(declare-fun Unit!19751 () Unit!19747)

(assert (=> b!613836 (= e!351899 Unit!19751)))

(declare-fun lt!281389 () Unit!19747)

(assert (=> b!613836 (= lt!281389 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281384 (select (arr!17953 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!613836 (arrayContainsKey!0 lt!281384 (select (arr!17953 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!281385 () Unit!19747)

(assert (=> b!613836 (= lt!281385 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11898))))

(assert (=> b!613836 (arrayNoDuplicates!0 lt!281384 #b00000000000000000000000000000000 Nil!11898)))

(declare-fun lt!281401 () Unit!19747)

(assert (=> b!613836 (= lt!281401 (lemmaNoDuplicateFromThenFromBigger!0 lt!281384 #b00000000000000000000000000000000 j!136))))

(assert (=> b!613836 (arrayNoDuplicates!0 lt!281384 j!136 Nil!11898)))

(declare-fun lt!281396 () Unit!19747)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37419 (_ BitVec 64) (_ BitVec 32) List!11901) Unit!19747)

(assert (=> b!613836 (= lt!281396 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!281384 (select (arr!17953 a!2986) j!136) j!136 Nil!11898))))

(assert (=> b!613836 false))

(declare-fun b!613837 () Bool)

(assert (=> b!613837 (= e!351912 e!351905)))

(declare-fun res!395123 () Bool)

(assert (=> b!613837 (=> res!395123 e!351905)))

(assert (=> b!613837 (= res!395123 (bvsge index!984 j!136))))

(declare-fun lt!281388 () Unit!19747)

(assert (=> b!613837 (= lt!281388 e!351899)))

(declare-fun c!69730 () Bool)

(assert (=> b!613837 (= c!69730 (bvslt j!136 index!984))))

(declare-fun b!613838 () Bool)

(declare-fun res!395125 () Bool)

(assert (=> b!613838 (=> (not res!395125) (not e!351902))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!613838 (= res!395125 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17953 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!613839 () Bool)

(assert (=> b!613839 (= e!351911 (arrayContainsKey!0 lt!281384 (select (arr!17953 a!2986) j!136) index!984))))

(declare-fun b!613840 () Bool)

(declare-fun res!395104 () Bool)

(assert (=> b!613840 (=> (not res!395104) (not e!351902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37419 (_ BitVec 32)) Bool)

(assert (=> b!613840 (= res!395104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!613841 () Bool)

(declare-fun e!351901 () Bool)

(assert (=> b!613841 (= e!351906 e!351901)))

(declare-fun res!395108 () Bool)

(assert (=> b!613841 (=> res!395108 e!351901)))

(assert (=> b!613841 (= res!395108 (or (not (= (select (arr!17953 a!2986) j!136) lt!281390)) (not (= (select (arr!17953 a!2986) j!136) lt!281394)) (bvsge j!136 index!984)))))

(declare-fun b!613842 () Bool)

(declare-fun res!395113 () Bool)

(assert (=> b!613842 (=> (not res!395113) (not e!351909))))

(assert (=> b!613842 (= res!395113 (validKeyInArray!0 (select (arr!17953 a!2986) j!136)))))

(declare-fun b!613843 () Bool)

(declare-fun res!395122 () Bool)

(assert (=> b!613843 (=> (not res!395122) (not e!351902))))

(assert (=> b!613843 (= res!395122 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11898))))

(declare-fun b!613844 () Bool)

(assert (=> b!613844 (= e!351898 true)))

(declare-fun lt!281400 () Bool)

(assert (=> b!613844 (= lt!281400 (contains!3033 Nil!11898 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613830 () Bool)

(declare-fun e!351900 () Bool)

(assert (=> b!613830 (= e!351900 (not e!351897))))

(declare-fun res!395119 () Bool)

(assert (=> b!613830 (=> res!395119 e!351897)))

(declare-datatypes ((SeekEntryResult!6349 0))(
  ( (MissingZero!6349 (index!27680 (_ BitVec 32))) (Found!6349 (index!27681 (_ BitVec 32))) (Intermediate!6349 (undefined!7161 Bool) (index!27682 (_ BitVec 32)) (x!56640 (_ BitVec 32))) (Undefined!6349) (MissingVacant!6349 (index!27683 (_ BitVec 32))) )
))
(declare-fun lt!281392 () SeekEntryResult!6349)

(assert (=> b!613830 (= res!395119 (not (= lt!281392 (Found!6349 index!984))))))

(declare-fun lt!281386 () Unit!19747)

(assert (=> b!613830 (= lt!281386 e!351903)))

(declare-fun c!69731 () Bool)

(assert (=> b!613830 (= c!69731 (= lt!281392 Undefined!6349))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37419 (_ BitVec 32)) SeekEntryResult!6349)

(assert (=> b!613830 (= lt!281392 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!281390 lt!281384 mask!3053))))

(declare-fun e!351907 () Bool)

(assert (=> b!613830 e!351907))

(declare-fun res!395114 () Bool)

(assert (=> b!613830 (=> (not res!395114) (not e!351907))))

(declare-fun lt!281395 () (_ BitVec 32))

(declare-fun lt!281383 () SeekEntryResult!6349)

(assert (=> b!613830 (= res!395114 (= lt!281383 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281395 vacantSpotIndex!68 lt!281390 lt!281384 mask!3053)))))

(assert (=> b!613830 (= lt!281383 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281395 vacantSpotIndex!68 (select (arr!17953 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!613830 (= lt!281390 (select (store (arr!17953 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!281391 () Unit!19747)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19747)

(assert (=> b!613830 (= lt!281391 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!281395 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!613830 (= lt!281395 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!395117 () Bool)

(assert (=> start!56004 (=> (not res!395117) (not e!351909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56004 (= res!395117 (validMask!0 mask!3053))))

(assert (=> start!56004 e!351909))

(assert (=> start!56004 true))

(declare-fun array_inv!13812 (array!37419) Bool)

(assert (=> start!56004 (array_inv!13812 a!2986)))

(declare-fun e!351908 () Bool)

(declare-fun b!613845 () Bool)

(assert (=> b!613845 (= e!351908 (arrayContainsKey!0 lt!281384 (select (arr!17953 a!2986) j!136) index!984))))

(declare-fun b!613846 () Bool)

(assert (=> b!613846 (= e!351901 e!351908)))

(declare-fun res!395107 () Bool)

(assert (=> b!613846 (=> (not res!395107) (not e!351908))))

(assert (=> b!613846 (= res!395107 (arrayContainsKey!0 lt!281384 (select (arr!17953 a!2986) j!136) j!136))))

(declare-fun b!613847 () Bool)

(declare-fun res!395105 () Bool)

(assert (=> b!613847 (=> (not res!395105) (not e!351909))))

(assert (=> b!613847 (= res!395105 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!613848 () Bool)

(assert (=> b!613848 (= e!351909 e!351902)))

(declare-fun res!395118 () Bool)

(assert (=> b!613848 (=> (not res!395118) (not e!351902))))

(declare-fun lt!281398 () SeekEntryResult!6349)

(assert (=> b!613848 (= res!395118 (or (= lt!281398 (MissingZero!6349 i!1108)) (= lt!281398 (MissingVacant!6349 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37419 (_ BitVec 32)) SeekEntryResult!6349)

(assert (=> b!613848 (= lt!281398 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!613849 () Bool)

(assert (=> b!613849 (= e!351904 e!351900)))

(declare-fun res!395116 () Bool)

(assert (=> b!613849 (=> (not res!395116) (not e!351900))))

(declare-fun lt!281399 () SeekEntryResult!6349)

(assert (=> b!613849 (= res!395116 (and (= lt!281399 (Found!6349 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17953 a!2986) index!984) (select (arr!17953 a!2986) j!136))) (not (= (select (arr!17953 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!613849 (= lt!281399 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17953 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!613850 () Bool)

(assert (=> b!613850 (= e!351907 (= lt!281399 lt!281383))))

(declare-fun b!613851 () Bool)

(declare-fun Unit!19752 () Unit!19747)

(assert (=> b!613851 (= e!351903 Unit!19752)))

(declare-fun b!613852 () Bool)

(declare-fun res!395110 () Bool)

(assert (=> b!613852 (=> (not res!395110) (not e!351909))))

(assert (=> b!613852 (= res!395110 (and (= (size!18317 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18317 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18317 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56004 res!395117) b!613852))

(assert (= (and b!613852 res!395110) b!613842))

(assert (= (and b!613842 res!395113) b!613832))

(assert (= (and b!613832 res!395121) b!613847))

(assert (= (and b!613847 res!395105) b!613848))

(assert (= (and b!613848 res!395118) b!613840))

(assert (= (and b!613840 res!395104) b!613843))

(assert (= (and b!613843 res!395122) b!613838))

(assert (= (and b!613838 res!395125) b!613833))

(assert (= (and b!613833 res!395111) b!613849))

(assert (= (and b!613849 res!395116) b!613830))

(assert (= (and b!613830 res!395114) b!613850))

(assert (= (and b!613830 c!69731) b!613827))

(assert (= (and b!613830 (not c!69731)) b!613851))

(assert (= (and b!613830 (not res!395119)) b!613834))

(assert (= (and b!613834 res!395124) b!613841))

(assert (= (and b!613841 (not res!395108)) b!613846))

(assert (= (and b!613846 res!395107) b!613845))

(assert (= (and b!613834 (not res!395109)) b!613837))

(assert (= (and b!613837 c!69730) b!613836))

(assert (= (and b!613837 (not c!69730)) b!613831))

(assert (= (and b!613837 (not res!395123)) b!613835))

(assert (= (and b!613835 res!395120) b!613839))

(assert (= (and b!613835 (not res!395115)) b!613829))

(assert (= (and b!613829 (not res!395112)) b!613828))

(assert (= (and b!613828 (not res!395106)) b!613844))

(declare-fun m!590381 () Bool)

(assert (=> b!613846 m!590381))

(assert (=> b!613846 m!590381))

(declare-fun m!590383 () Bool)

(assert (=> b!613846 m!590383))

(assert (=> b!613836 m!590381))

(declare-fun m!590385 () Bool)

(assert (=> b!613836 m!590385))

(assert (=> b!613836 m!590381))

(assert (=> b!613836 m!590381))

(declare-fun m!590387 () Bool)

(assert (=> b!613836 m!590387))

(declare-fun m!590389 () Bool)

(assert (=> b!613836 m!590389))

(assert (=> b!613836 m!590381))

(declare-fun m!590391 () Bool)

(assert (=> b!613836 m!590391))

(declare-fun m!590393 () Bool)

(assert (=> b!613836 m!590393))

(declare-fun m!590395 () Bool)

(assert (=> b!613836 m!590395))

(declare-fun m!590397 () Bool)

(assert (=> b!613836 m!590397))

(declare-fun m!590399 () Bool)

(assert (=> b!613835 m!590399))

(assert (=> b!613835 m!590381))

(declare-fun m!590401 () Bool)

(assert (=> b!613835 m!590401))

(assert (=> b!613835 m!590381))

(assert (=> b!613835 m!590383))

(assert (=> b!613835 m!590393))

(assert (=> b!613835 m!590381))

(declare-fun m!590403 () Bool)

(assert (=> b!613835 m!590403))

(assert (=> b!613835 m!590381))

(declare-fun m!590405 () Bool)

(assert (=> b!613835 m!590405))

(assert (=> b!613835 m!590389))

(assert (=> b!613845 m!590381))

(assert (=> b!613845 m!590381))

(declare-fun m!590407 () Bool)

(assert (=> b!613845 m!590407))

(assert (=> b!613839 m!590381))

(assert (=> b!613839 m!590381))

(assert (=> b!613839 m!590407))

(declare-fun m!590409 () Bool)

(assert (=> b!613830 m!590409))

(declare-fun m!590411 () Bool)

(assert (=> b!613830 m!590411))

(declare-fun m!590413 () Bool)

(assert (=> b!613830 m!590413))

(declare-fun m!590415 () Bool)

(assert (=> b!613830 m!590415))

(assert (=> b!613830 m!590381))

(declare-fun m!590417 () Bool)

(assert (=> b!613830 m!590417))

(declare-fun m!590419 () Bool)

(assert (=> b!613830 m!590419))

(assert (=> b!613830 m!590381))

(declare-fun m!590421 () Bool)

(assert (=> b!613830 m!590421))

(declare-fun m!590423 () Bool)

(assert (=> b!613844 m!590423))

(assert (=> b!613833 m!590417))

(declare-fun m!590425 () Bool)

(assert (=> b!613833 m!590425))

(assert (=> b!613834 m!590381))

(assert (=> b!613834 m!590417))

(declare-fun m!590427 () Bool)

(assert (=> b!613834 m!590427))

(declare-fun m!590429 () Bool)

(assert (=> b!613832 m!590429))

(declare-fun m!590431 () Bool)

(assert (=> b!613847 m!590431))

(declare-fun m!590433 () Bool)

(assert (=> b!613828 m!590433))

(declare-fun m!590435 () Bool)

(assert (=> b!613848 m!590435))

(declare-fun m!590437 () Bool)

(assert (=> b!613838 m!590437))

(declare-fun m!590439 () Bool)

(assert (=> b!613843 m!590439))

(declare-fun m!590441 () Bool)

(assert (=> b!613849 m!590441))

(assert (=> b!613849 m!590381))

(assert (=> b!613849 m!590381))

(declare-fun m!590443 () Bool)

(assert (=> b!613849 m!590443))

(assert (=> b!613842 m!590381))

(assert (=> b!613842 m!590381))

(declare-fun m!590445 () Bool)

(assert (=> b!613842 m!590445))

(declare-fun m!590447 () Bool)

(assert (=> b!613840 m!590447))

(declare-fun m!590449 () Bool)

(assert (=> start!56004 m!590449))

(declare-fun m!590451 () Bool)

(assert (=> start!56004 m!590451))

(declare-fun m!590453 () Bool)

(assert (=> b!613829 m!590453))

(assert (=> b!613841 m!590381))

(check-sat (not b!613844) (not b!613835) (not b!613846) (not start!56004) (not b!613839) (not b!613847) (not b!613843) (not b!613832) (not b!613829) (not b!613842) (not b!613828) (not b!613836) (not b!613849) (not b!613848) (not b!613840) (not b!613845) (not b!613830))
(check-sat)
