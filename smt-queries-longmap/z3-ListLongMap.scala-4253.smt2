; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58990 () Bool)

(assert start!58990)

(declare-fun b!650842 () Bool)

(declare-datatypes ((Unit!22206 0))(
  ( (Unit!22207) )
))
(declare-fun e!373423 () Unit!22206)

(declare-fun Unit!22208 () Unit!22206)

(assert (=> b!650842 (= e!373423 Unit!22208)))

(declare-fun b!650843 () Bool)

(declare-fun e!373428 () Bool)

(declare-fun e!373418 () Bool)

(assert (=> b!650843 (= e!373428 e!373418)))

(declare-fun res!421946 () Bool)

(assert (=> b!650843 (=> (not res!421946) (not e!373418))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38571 0))(
  ( (array!38572 (arr!18490 (Array (_ BitVec 32) (_ BitVec 64))) (size!18854 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38571)

(declare-fun lt!302499 () array!38571)

(declare-fun arrayContainsKey!0 (array!38571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650843 (= res!421946 (arrayContainsKey!0 lt!302499 (select (arr!18490 a!2986) j!136) j!136))))

(declare-fun b!650844 () Bool)

(declare-fun res!421960 () Bool)

(declare-fun e!373426 () Bool)

(assert (=> b!650844 (=> (not res!421960) (not e!373426))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38571 (_ BitVec 32)) Bool)

(assert (=> b!650844 (= res!421960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650845 () Bool)

(declare-fun res!421957 () Bool)

(declare-fun e!373421 () Bool)

(assert (=> b!650845 (=> (not res!421957) (not e!373421))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!650845 (= res!421957 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650846 () Bool)

(assert (=> b!650846 (= e!373421 e!373426)))

(declare-fun res!421955 () Bool)

(assert (=> b!650846 (=> (not res!421955) (not e!373426))))

(declare-datatypes ((SeekEntryResult!6930 0))(
  ( (MissingZero!6930 (index!30070 (_ BitVec 32))) (Found!6930 (index!30071 (_ BitVec 32))) (Intermediate!6930 (undefined!7742 Bool) (index!30072 (_ BitVec 32)) (x!58856 (_ BitVec 32))) (Undefined!6930) (MissingVacant!6930 (index!30073 (_ BitVec 32))) )
))
(declare-fun lt!302497 () SeekEntryResult!6930)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!650846 (= res!421955 (or (= lt!302497 (MissingZero!6930 i!1108)) (= lt!302497 (MissingVacant!6930 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38571 (_ BitVec 32)) SeekEntryResult!6930)

(assert (=> b!650846 (= lt!302497 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!650847 () Bool)

(declare-fun e!373429 () Bool)

(declare-fun e!373420 () Bool)

(assert (=> b!650847 (= e!373429 (not e!373420))))

(declare-fun res!421951 () Bool)

(assert (=> b!650847 (=> res!421951 e!373420)))

(declare-fun lt!302496 () SeekEntryResult!6930)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!650847 (= res!421951 (not (= lt!302496 (Found!6930 index!984))))))

(declare-fun lt!302500 () Unit!22206)

(assert (=> b!650847 (= lt!302500 e!373423)))

(declare-fun c!74816 () Bool)

(assert (=> b!650847 (= c!74816 (= lt!302496 Undefined!6930))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!302493 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38571 (_ BitVec 32)) SeekEntryResult!6930)

(assert (=> b!650847 (= lt!302496 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302493 lt!302499 mask!3053))))

(declare-fun e!373425 () Bool)

(assert (=> b!650847 e!373425))

(declare-fun res!421959 () Bool)

(assert (=> b!650847 (=> (not res!421959) (not e!373425))))

(declare-fun lt!302498 () (_ BitVec 32))

(declare-fun lt!302507 () SeekEntryResult!6930)

(assert (=> b!650847 (= res!421959 (= lt!302507 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302498 vacantSpotIndex!68 lt!302493 lt!302499 mask!3053)))))

(assert (=> b!650847 (= lt!302507 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302498 vacantSpotIndex!68 (select (arr!18490 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650847 (= lt!302493 (select (store (arr!18490 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302495 () Unit!22206)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38571 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22206)

(assert (=> b!650847 (= lt!302495 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302498 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650847 (= lt!302498 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!650848 () Bool)

(declare-fun e!373431 () Bool)

(declare-fun e!373422 () Bool)

(assert (=> b!650848 (= e!373431 e!373422)))

(declare-fun res!421954 () Bool)

(assert (=> b!650848 (=> res!421954 e!373422)))

(assert (=> b!650848 (= res!421954 (bvsge index!984 j!136))))

(declare-fun lt!302508 () Unit!22206)

(declare-fun e!373424 () Unit!22206)

(assert (=> b!650848 (= lt!302508 e!373424)))

(declare-fun c!74815 () Bool)

(assert (=> b!650848 (= c!74815 (bvslt j!136 index!984))))

(declare-fun b!650850 () Bool)

(declare-fun res!421956 () Bool)

(assert (=> b!650850 (=> (not res!421956) (not e!373421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650850 (= res!421956 (validKeyInArray!0 (select (arr!18490 a!2986) j!136)))))

(declare-fun b!650851 () Bool)

(declare-fun res!421950 () Bool)

(assert (=> b!650851 (=> (not res!421950) (not e!373426))))

(assert (=> b!650851 (= res!421950 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18490 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650852 () Bool)

(declare-fun res!421953 () Bool)

(assert (=> b!650852 (=> (not res!421953) (not e!373426))))

(declare-datatypes ((List!12531 0))(
  ( (Nil!12528) (Cons!12527 (h!13572 (_ BitVec 64)) (t!18759 List!12531)) )
))
(declare-fun arrayNoDuplicates!0 (array!38571 (_ BitVec 32) List!12531) Bool)

(assert (=> b!650852 (= res!421953 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12528))))

(declare-fun b!650853 () Bool)

(declare-fun e!373419 () Bool)

(assert (=> b!650853 (= e!373419 e!373429)))

(declare-fun res!421947 () Bool)

(assert (=> b!650853 (=> (not res!421947) (not e!373429))))

(declare-fun lt!302505 () SeekEntryResult!6930)

(assert (=> b!650853 (= res!421947 (and (= lt!302505 (Found!6930 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18490 a!2986) index!984) (select (arr!18490 a!2986) j!136))) (not (= (select (arr!18490 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!650853 (= lt!302505 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18490 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650854 () Bool)

(declare-fun Unit!22209 () Unit!22206)

(assert (=> b!650854 (= e!373424 Unit!22209)))

(declare-fun lt!302503 () Unit!22206)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22206)

(assert (=> b!650854 (= lt!302503 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302499 (select (arr!18490 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650854 (arrayContainsKey!0 lt!302499 (select (arr!18490 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302494 () Unit!22206)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12531) Unit!22206)

(assert (=> b!650854 (= lt!302494 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12528))))

(assert (=> b!650854 (arrayNoDuplicates!0 lt!302499 #b00000000000000000000000000000000 Nil!12528)))

(declare-fun lt!302502 () Unit!22206)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38571 (_ BitVec 32) (_ BitVec 32)) Unit!22206)

(assert (=> b!650854 (= lt!302502 (lemmaNoDuplicateFromThenFromBigger!0 lt!302499 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650854 (arrayNoDuplicates!0 lt!302499 j!136 Nil!12528)))

(declare-fun lt!302501 () Unit!22206)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38571 (_ BitVec 64) (_ BitVec 32) List!12531) Unit!22206)

(assert (=> b!650854 (= lt!302501 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302499 (select (arr!18490 a!2986) j!136) j!136 Nil!12528))))

(assert (=> b!650854 false))

(declare-fun b!650855 () Bool)

(assert (=> b!650855 (= e!373422 (or (bvsge (size!18854 a!2986) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!18854 a!2986)) (bvsle index!984 (size!18854 a!2986))))))

(assert (=> b!650855 (arrayNoDuplicates!0 lt!302499 #b00000000000000000000000000000000 Nil!12528)))

(declare-fun lt!302509 () Unit!22206)

(assert (=> b!650855 (= lt!302509 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12528))))

(assert (=> b!650855 (arrayContainsKey!0 lt!302499 (select (arr!18490 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302506 () Unit!22206)

(assert (=> b!650855 (= lt!302506 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302499 (select (arr!18490 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373427 () Bool)

(assert (=> b!650855 e!373427))

(declare-fun res!421949 () Bool)

(assert (=> b!650855 (=> (not res!421949) (not e!373427))))

(assert (=> b!650855 (= res!421949 (arrayContainsKey!0 lt!302499 (select (arr!18490 a!2986) j!136) j!136))))

(declare-fun b!650856 () Bool)

(assert (=> b!650856 (= e!373418 (arrayContainsKey!0 lt!302499 (select (arr!18490 a!2986) j!136) index!984))))

(declare-fun b!650857 () Bool)

(assert (=> b!650857 (= e!373425 (= lt!302505 lt!302507))))

(declare-fun res!421963 () Bool)

(assert (=> start!58990 (=> (not res!421963) (not e!373421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58990 (= res!421963 (validMask!0 mask!3053))))

(assert (=> start!58990 e!373421))

(assert (=> start!58990 true))

(declare-fun array_inv!14286 (array!38571) Bool)

(assert (=> start!58990 (array_inv!14286 a!2986)))

(declare-fun b!650849 () Bool)

(declare-fun res!421961 () Bool)

(assert (=> b!650849 (=> (not res!421961) (not e!373421))))

(assert (=> b!650849 (= res!421961 (validKeyInArray!0 k0!1786))))

(declare-fun b!650858 () Bool)

(assert (=> b!650858 (= e!373420 e!373431)))

(declare-fun res!421964 () Bool)

(assert (=> b!650858 (=> res!421964 e!373431)))

(declare-fun lt!302504 () (_ BitVec 64))

(assert (=> b!650858 (= res!421964 (or (not (= (select (arr!18490 a!2986) j!136) lt!302493)) (not (= (select (arr!18490 a!2986) j!136) lt!302504))))))

(declare-fun e!373430 () Bool)

(assert (=> b!650858 e!373430))

(declare-fun res!421958 () Bool)

(assert (=> b!650858 (=> (not res!421958) (not e!373430))))

(assert (=> b!650858 (= res!421958 (= lt!302504 (select (arr!18490 a!2986) j!136)))))

(assert (=> b!650858 (= lt!302504 (select (store (arr!18490 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!650859 () Bool)

(declare-fun Unit!22210 () Unit!22206)

(assert (=> b!650859 (= e!373424 Unit!22210)))

(declare-fun b!650860 () Bool)

(declare-fun res!421952 () Bool)

(assert (=> b!650860 (=> (not res!421952) (not e!373421))))

(assert (=> b!650860 (= res!421952 (and (= (size!18854 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18854 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18854 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650861 () Bool)

(assert (=> b!650861 (= e!373427 (arrayContainsKey!0 lt!302499 (select (arr!18490 a!2986) j!136) index!984))))

(declare-fun b!650862 () Bool)

(assert (=> b!650862 (= e!373426 e!373419)))

(declare-fun res!421948 () Bool)

(assert (=> b!650862 (=> (not res!421948) (not e!373419))))

(assert (=> b!650862 (= res!421948 (= (select (store (arr!18490 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650862 (= lt!302499 (array!38572 (store (arr!18490 a!2986) i!1108 k0!1786) (size!18854 a!2986)))))

(declare-fun b!650863 () Bool)

(assert (=> b!650863 (= e!373430 e!373428)))

(declare-fun res!421962 () Bool)

(assert (=> b!650863 (=> res!421962 e!373428)))

(assert (=> b!650863 (= res!421962 (or (not (= (select (arr!18490 a!2986) j!136) lt!302493)) (not (= (select (arr!18490 a!2986) j!136) lt!302504)) (bvsge j!136 index!984)))))

(declare-fun b!650864 () Bool)

(declare-fun Unit!22211 () Unit!22206)

(assert (=> b!650864 (= e!373423 Unit!22211)))

(assert (=> b!650864 false))

(assert (= (and start!58990 res!421963) b!650860))

(assert (= (and b!650860 res!421952) b!650850))

(assert (= (and b!650850 res!421956) b!650849))

(assert (= (and b!650849 res!421961) b!650845))

(assert (= (and b!650845 res!421957) b!650846))

(assert (= (and b!650846 res!421955) b!650844))

(assert (= (and b!650844 res!421960) b!650852))

(assert (= (and b!650852 res!421953) b!650851))

(assert (= (and b!650851 res!421950) b!650862))

(assert (= (and b!650862 res!421948) b!650853))

(assert (= (and b!650853 res!421947) b!650847))

(assert (= (and b!650847 res!421959) b!650857))

(assert (= (and b!650847 c!74816) b!650864))

(assert (= (and b!650847 (not c!74816)) b!650842))

(assert (= (and b!650847 (not res!421951)) b!650858))

(assert (= (and b!650858 res!421958) b!650863))

(assert (= (and b!650863 (not res!421962)) b!650843))

(assert (= (and b!650843 res!421946) b!650856))

(assert (= (and b!650858 (not res!421964)) b!650848))

(assert (= (and b!650848 c!74815) b!650854))

(assert (= (and b!650848 (not c!74815)) b!650859))

(assert (= (and b!650848 (not res!421954)) b!650855))

(assert (= (and b!650855 res!421949) b!650861))

(declare-fun m!624015 () Bool)

(assert (=> b!650846 m!624015))

(declare-fun m!624017 () Bool)

(assert (=> b!650854 m!624017))

(declare-fun m!624019 () Bool)

(assert (=> b!650854 m!624019))

(assert (=> b!650854 m!624019))

(declare-fun m!624021 () Bool)

(assert (=> b!650854 m!624021))

(assert (=> b!650854 m!624019))

(declare-fun m!624023 () Bool)

(assert (=> b!650854 m!624023))

(declare-fun m!624025 () Bool)

(assert (=> b!650854 m!624025))

(declare-fun m!624027 () Bool)

(assert (=> b!650854 m!624027))

(assert (=> b!650854 m!624019))

(declare-fun m!624029 () Bool)

(assert (=> b!650854 m!624029))

(declare-fun m!624031 () Bool)

(assert (=> b!650854 m!624031))

(declare-fun m!624033 () Bool)

(assert (=> b!650862 m!624033))

(declare-fun m!624035 () Bool)

(assert (=> b!650862 m!624035))

(assert (=> b!650843 m!624019))

(assert (=> b!650843 m!624019))

(declare-fun m!624037 () Bool)

(assert (=> b!650843 m!624037))

(declare-fun m!624039 () Bool)

(assert (=> start!58990 m!624039))

(declare-fun m!624041 () Bool)

(assert (=> start!58990 m!624041))

(declare-fun m!624043 () Bool)

(assert (=> b!650844 m!624043))

(assert (=> b!650858 m!624019))

(assert (=> b!650858 m!624033))

(declare-fun m!624045 () Bool)

(assert (=> b!650858 m!624045))

(declare-fun m!624047 () Bool)

(assert (=> b!650851 m!624047))

(declare-fun m!624049 () Bool)

(assert (=> b!650847 m!624049))

(declare-fun m!624051 () Bool)

(assert (=> b!650847 m!624051))

(declare-fun m!624053 () Bool)

(assert (=> b!650847 m!624053))

(declare-fun m!624055 () Bool)

(assert (=> b!650847 m!624055))

(assert (=> b!650847 m!624019))

(assert (=> b!650847 m!624033))

(declare-fun m!624057 () Bool)

(assert (=> b!650847 m!624057))

(assert (=> b!650847 m!624019))

(declare-fun m!624059 () Bool)

(assert (=> b!650847 m!624059))

(declare-fun m!624061 () Bool)

(assert (=> b!650852 m!624061))

(declare-fun m!624063 () Bool)

(assert (=> b!650853 m!624063))

(assert (=> b!650853 m!624019))

(assert (=> b!650853 m!624019))

(declare-fun m!624065 () Bool)

(assert (=> b!650853 m!624065))

(assert (=> b!650850 m!624019))

(assert (=> b!650850 m!624019))

(declare-fun m!624067 () Bool)

(assert (=> b!650850 m!624067))

(assert (=> b!650861 m!624019))

(assert (=> b!650861 m!624019))

(declare-fun m!624069 () Bool)

(assert (=> b!650861 m!624069))

(declare-fun m!624071 () Bool)

(assert (=> b!650845 m!624071))

(assert (=> b!650855 m!624019))

(declare-fun m!624073 () Bool)

(assert (=> b!650855 m!624073))

(assert (=> b!650855 m!624019))

(assert (=> b!650855 m!624019))

(assert (=> b!650855 m!624037))

(assert (=> b!650855 m!624031))

(assert (=> b!650855 m!624027))

(assert (=> b!650855 m!624019))

(declare-fun m!624075 () Bool)

(assert (=> b!650855 m!624075))

(assert (=> b!650856 m!624019))

(assert (=> b!650856 m!624019))

(assert (=> b!650856 m!624069))

(declare-fun m!624077 () Bool)

(assert (=> b!650849 m!624077))

(assert (=> b!650863 m!624019))

(check-sat (not b!650856) (not b!650844) (not start!58990) (not b!650849) (not b!650853) (not b!650843) (not b!650846) (not b!650855) (not b!650861) (not b!650847) (not b!650845) (not b!650852) (not b!650850) (not b!650854))
(check-sat)
