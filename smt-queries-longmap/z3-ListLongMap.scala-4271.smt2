; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59368 () Bool)

(assert start!59368)

(declare-fun b!655821 () Bool)

(declare-fun e!376636 () Bool)

(declare-fun e!376639 () Bool)

(assert (=> b!655821 (= e!376636 e!376639)))

(declare-fun res!425441 () Bool)

(assert (=> b!655821 (=> (not res!425441) (not e!376639))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6984 0))(
  ( (MissingZero!6984 (index!30295 (_ BitVec 32))) (Found!6984 (index!30296 (_ BitVec 32))) (Intermediate!6984 (undefined!7796 Bool) (index!30297 (_ BitVec 32)) (x!59081 (_ BitVec 32))) (Undefined!6984) (MissingVacant!6984 (index!30298 (_ BitVec 32))) )
))
(declare-fun lt!306015 () SeekEntryResult!6984)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38688 0))(
  ( (array!38689 (arr!18544 (Array (_ BitVec 32) (_ BitVec 64))) (size!18908 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38688)

(assert (=> b!655821 (= res!425441 (and (= lt!306015 (Found!6984 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18544 a!2986) index!984) (select (arr!18544 a!2986) j!136))) (not (= (select (arr!18544 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38688 (_ BitVec 32)) SeekEntryResult!6984)

(assert (=> b!655821 (= lt!306015 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18544 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655822 () Bool)

(declare-fun res!425440 () Bool)

(declare-fun e!376637 () Bool)

(assert (=> b!655822 (=> (not res!425440) (not e!376637))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655822 (= res!425440 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun lt!306021 () array!38688)

(declare-fun res!425430 () Bool)

(declare-fun b!655823 () Bool)

(assert (=> b!655823 (= res!425430 (arrayContainsKey!0 lt!306021 (select (arr!18544 a!2986) j!136) j!136))))

(declare-fun e!376635 () Bool)

(assert (=> b!655823 (=> (not res!425430) (not e!376635))))

(declare-fun e!376641 () Bool)

(assert (=> b!655823 (= e!376641 e!376635)))

(declare-fun e!376643 () Bool)

(declare-fun b!655824 () Bool)

(assert (=> b!655824 (= e!376643 (arrayContainsKey!0 lt!306021 (select (arr!18544 a!2986) j!136) index!984))))

(declare-fun b!655825 () Bool)

(declare-fun e!376644 () Bool)

(declare-fun lt!306003 () SeekEntryResult!6984)

(assert (=> b!655825 (= e!376644 (= lt!306015 lt!306003))))

(declare-fun b!655826 () Bool)

(declare-fun e!376633 () Bool)

(assert (=> b!655826 (= e!376633 e!376636)))

(declare-fun res!425438 () Bool)

(assert (=> b!655826 (=> (not res!425438) (not e!376636))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!655826 (= res!425438 (= (select (store (arr!18544 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655826 (= lt!306021 (array!38689 (store (arr!18544 a!2986) i!1108 k0!1786) (size!18908 a!2986)))))

(declare-fun lt!306011 () SeekEntryResult!6984)

(declare-fun b!655827 () Bool)

(assert (=> b!655827 (= e!376639 (not (or (not (= lt!306011 (MissingVacant!6984 vacantSpotIndex!68))) (bvslt index!984 (size!18908 a!2986)))))))

(declare-datatypes ((Unit!22594 0))(
  ( (Unit!22595) )
))
(declare-fun lt!306010 () Unit!22594)

(declare-fun e!376642 () Unit!22594)

(assert (=> b!655827 (= lt!306010 e!376642)))

(declare-fun c!75566 () Bool)

(assert (=> b!655827 (= c!75566 (= lt!306011 (Found!6984 index!984)))))

(declare-fun lt!306017 () Unit!22594)

(declare-fun e!376634 () Unit!22594)

(assert (=> b!655827 (= lt!306017 e!376634)))

(declare-fun c!75565 () Bool)

(assert (=> b!655827 (= c!75565 (= lt!306011 Undefined!6984))))

(declare-fun lt!306022 () (_ BitVec 64))

(assert (=> b!655827 (= lt!306011 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306022 lt!306021 mask!3053))))

(assert (=> b!655827 e!376644))

(declare-fun res!425435 () Bool)

(assert (=> b!655827 (=> (not res!425435) (not e!376644))))

(declare-fun lt!306020 () (_ BitVec 32))

(assert (=> b!655827 (= res!425435 (= lt!306003 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306020 vacantSpotIndex!68 lt!306022 lt!306021 mask!3053)))))

(assert (=> b!655827 (= lt!306003 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306020 vacantSpotIndex!68 (select (arr!18544 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655827 (= lt!306022 (select (store (arr!18544 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!306012 () Unit!22594)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38688 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22594)

(assert (=> b!655827 (= lt!306012 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306020 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655827 (= lt!306020 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655828 () Bool)

(declare-fun Unit!22596 () Unit!22594)

(assert (=> b!655828 (= e!376634 Unit!22596)))

(declare-fun b!655829 () Bool)

(assert (=> b!655829 (= e!376637 e!376633)))

(declare-fun res!425442 () Bool)

(assert (=> b!655829 (=> (not res!425442) (not e!376633))))

(declare-fun lt!306006 () SeekEntryResult!6984)

(assert (=> b!655829 (= res!425442 (or (= lt!306006 (MissingZero!6984 i!1108)) (= lt!306006 (MissingVacant!6984 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38688 (_ BitVec 32)) SeekEntryResult!6984)

(assert (=> b!655829 (= lt!306006 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!655830 () Bool)

(assert (=> b!655830 (= e!376635 (arrayContainsKey!0 lt!306021 (select (arr!18544 a!2986) j!136) index!984))))

(declare-fun b!655831 () Bool)

(declare-fun res!425439 () Bool)

(assert (=> b!655831 (=> (not res!425439) (not e!376637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655831 (= res!425439 (validKeyInArray!0 k0!1786))))

(declare-fun b!655832 () Bool)

(declare-fun e!376640 () Unit!22594)

(declare-fun Unit!22597 () Unit!22594)

(assert (=> b!655832 (= e!376640 Unit!22597)))

(declare-fun b!655833 () Bool)

(declare-fun res!425436 () Bool)

(assert (=> b!655833 (=> (not res!425436) (not e!376637))))

(assert (=> b!655833 (= res!425436 (and (= (size!18908 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18908 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18908 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655834 () Bool)

(declare-fun res!425444 () Bool)

(assert (=> b!655834 (=> (not res!425444) (not e!376633))))

(assert (=> b!655834 (= res!425444 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18544 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655835 () Bool)

(assert (=> b!655835 false))

(declare-fun lt!306007 () Unit!22594)

(declare-datatypes ((List!12585 0))(
  ( (Nil!12582) (Cons!12581 (h!13626 (_ BitVec 64)) (t!18813 List!12585)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38688 (_ BitVec 64) (_ BitVec 32) List!12585) Unit!22594)

(assert (=> b!655835 (= lt!306007 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306021 (select (arr!18544 a!2986) j!136) j!136 Nil!12582))))

(declare-fun arrayNoDuplicates!0 (array!38688 (_ BitVec 32) List!12585) Bool)

(assert (=> b!655835 (arrayNoDuplicates!0 lt!306021 j!136 Nil!12582)))

(declare-fun lt!306016 () Unit!22594)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38688 (_ BitVec 32) (_ BitVec 32)) Unit!22594)

(assert (=> b!655835 (= lt!306016 (lemmaNoDuplicateFromThenFromBigger!0 lt!306021 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655835 (arrayNoDuplicates!0 lt!306021 #b00000000000000000000000000000000 Nil!12582)))

(declare-fun lt!306005 () Unit!22594)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12585) Unit!22594)

(assert (=> b!655835 (= lt!306005 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12582))))

(assert (=> b!655835 (arrayContainsKey!0 lt!306021 (select (arr!18544 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306013 () Unit!22594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38688 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22594)

(assert (=> b!655835 (= lt!306013 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306021 (select (arr!18544 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22598 () Unit!22594)

(assert (=> b!655835 (= e!376640 Unit!22598)))

(declare-fun res!425432 () Bool)

(assert (=> start!59368 (=> (not res!425432) (not e!376637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59368 (= res!425432 (validMask!0 mask!3053))))

(assert (=> start!59368 e!376637))

(assert (=> start!59368 true))

(declare-fun array_inv!14340 (array!38688) Bool)

(assert (=> start!59368 (array_inv!14340 a!2986)))

(declare-fun b!655836 () Bool)

(declare-fun res!425429 () Bool)

(assert (=> b!655836 (=> (not res!425429) (not e!376633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38688 (_ BitVec 32)) Bool)

(assert (=> b!655836 (= res!425429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655837 () Bool)

(declare-fun Unit!22599 () Unit!22594)

(assert (=> b!655837 (= e!376634 Unit!22599)))

(assert (=> b!655837 false))

(declare-fun b!655838 () Bool)

(declare-fun res!425437 () Bool)

(assert (=> b!655838 (= res!425437 (bvsge j!136 index!984))))

(assert (=> b!655838 (=> res!425437 e!376641)))

(declare-fun e!376638 () Bool)

(assert (=> b!655838 (= e!376638 e!376641)))

(declare-fun b!655839 () Bool)

(declare-fun res!425443 () Bool)

(assert (=> b!655839 (=> (not res!425443) (not e!376637))))

(assert (=> b!655839 (= res!425443 (validKeyInArray!0 (select (arr!18544 a!2986) j!136)))))

(declare-fun b!655840 () Bool)

(declare-fun Unit!22600 () Unit!22594)

(assert (=> b!655840 (= e!376642 Unit!22600)))

(declare-fun res!425431 () Bool)

(assert (=> b!655840 (= res!425431 (= (select (store (arr!18544 a!2986) i!1108 k0!1786) index!984) (select (arr!18544 a!2986) j!136)))))

(assert (=> b!655840 (=> (not res!425431) (not e!376638))))

(assert (=> b!655840 e!376638))

(declare-fun c!75564 () Bool)

(assert (=> b!655840 (= c!75564 (bvslt j!136 index!984))))

(declare-fun lt!306014 () Unit!22594)

(assert (=> b!655840 (= lt!306014 e!376640)))

(declare-fun c!75563 () Bool)

(assert (=> b!655840 (= c!75563 (bvslt index!984 j!136))))

(declare-fun lt!306019 () Unit!22594)

(declare-fun e!376632 () Unit!22594)

(assert (=> b!655840 (= lt!306019 e!376632)))

(assert (=> b!655840 false))

(declare-fun b!655841 () Bool)

(declare-fun Unit!22601 () Unit!22594)

(assert (=> b!655841 (= e!376642 Unit!22601)))

(declare-fun b!655842 () Bool)

(declare-fun Unit!22602 () Unit!22594)

(assert (=> b!655842 (= e!376632 Unit!22602)))

(declare-fun b!655843 () Bool)

(declare-fun res!425433 () Bool)

(assert (=> b!655843 (=> (not res!425433) (not e!376633))))

(assert (=> b!655843 (= res!425433 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12582))))

(declare-fun b!655844 () Bool)

(assert (=> b!655844 false))

(declare-fun lt!306018 () Unit!22594)

(assert (=> b!655844 (= lt!306018 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306021 (select (arr!18544 a!2986) j!136) index!984 Nil!12582))))

(assert (=> b!655844 (arrayNoDuplicates!0 lt!306021 index!984 Nil!12582)))

(declare-fun lt!306009 () Unit!22594)

(assert (=> b!655844 (= lt!306009 (lemmaNoDuplicateFromThenFromBigger!0 lt!306021 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655844 (arrayNoDuplicates!0 lt!306021 #b00000000000000000000000000000000 Nil!12582)))

(declare-fun lt!306004 () Unit!22594)

(assert (=> b!655844 (= lt!306004 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12582))))

(assert (=> b!655844 (arrayContainsKey!0 lt!306021 (select (arr!18544 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306008 () Unit!22594)

(assert (=> b!655844 (= lt!306008 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306021 (select (arr!18544 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!655844 e!376643))

(declare-fun res!425434 () Bool)

(assert (=> b!655844 (=> (not res!425434) (not e!376643))))

(assert (=> b!655844 (= res!425434 (arrayContainsKey!0 lt!306021 (select (arr!18544 a!2986) j!136) j!136))))

(declare-fun Unit!22603 () Unit!22594)

(assert (=> b!655844 (= e!376632 Unit!22603)))

(assert (= (and start!59368 res!425432) b!655833))

(assert (= (and b!655833 res!425436) b!655839))

(assert (= (and b!655839 res!425443) b!655831))

(assert (= (and b!655831 res!425439) b!655822))

(assert (= (and b!655822 res!425440) b!655829))

(assert (= (and b!655829 res!425442) b!655836))

(assert (= (and b!655836 res!425429) b!655843))

(assert (= (and b!655843 res!425433) b!655834))

(assert (= (and b!655834 res!425444) b!655826))

(assert (= (and b!655826 res!425438) b!655821))

(assert (= (and b!655821 res!425441) b!655827))

(assert (= (and b!655827 res!425435) b!655825))

(assert (= (and b!655827 c!75565) b!655837))

(assert (= (and b!655827 (not c!75565)) b!655828))

(assert (= (and b!655827 c!75566) b!655840))

(assert (= (and b!655827 (not c!75566)) b!655841))

(assert (= (and b!655840 res!425431) b!655838))

(assert (= (and b!655838 (not res!425437)) b!655823))

(assert (= (and b!655823 res!425430) b!655830))

(assert (= (and b!655840 c!75564) b!655835))

(assert (= (and b!655840 (not c!75564)) b!655832))

(assert (= (and b!655840 c!75563) b!655844))

(assert (= (and b!655840 (not c!75563)) b!655842))

(assert (= (and b!655844 res!425434) b!655824))

(declare-fun m!628887 () Bool)

(assert (=> b!655829 m!628887))

(declare-fun m!628889 () Bool)

(assert (=> b!655835 m!628889))

(assert (=> b!655835 m!628889))

(declare-fun m!628891 () Bool)

(assert (=> b!655835 m!628891))

(declare-fun m!628893 () Bool)

(assert (=> b!655835 m!628893))

(declare-fun m!628895 () Bool)

(assert (=> b!655835 m!628895))

(declare-fun m!628897 () Bool)

(assert (=> b!655835 m!628897))

(assert (=> b!655835 m!628889))

(declare-fun m!628899 () Bool)

(assert (=> b!655835 m!628899))

(declare-fun m!628901 () Bool)

(assert (=> b!655835 m!628901))

(assert (=> b!655835 m!628889))

(declare-fun m!628903 () Bool)

(assert (=> b!655835 m!628903))

(assert (=> b!655844 m!628889))

(declare-fun m!628905 () Bool)

(assert (=> b!655844 m!628905))

(assert (=> b!655844 m!628889))

(declare-fun m!628907 () Bool)

(assert (=> b!655844 m!628907))

(declare-fun m!628909 () Bool)

(assert (=> b!655844 m!628909))

(assert (=> b!655844 m!628889))

(assert (=> b!655844 m!628889))

(declare-fun m!628911 () Bool)

(assert (=> b!655844 m!628911))

(assert (=> b!655844 m!628895))

(assert (=> b!655844 m!628889))

(declare-fun m!628913 () Bool)

(assert (=> b!655844 m!628913))

(declare-fun m!628915 () Bool)

(assert (=> b!655844 m!628915))

(assert (=> b!655844 m!628901))

(declare-fun m!628917 () Bool)

(assert (=> b!655840 m!628917))

(declare-fun m!628919 () Bool)

(assert (=> b!655840 m!628919))

(assert (=> b!655840 m!628889))

(assert (=> b!655830 m!628889))

(assert (=> b!655830 m!628889))

(declare-fun m!628921 () Bool)

(assert (=> b!655830 m!628921))

(declare-fun m!628923 () Bool)

(assert (=> b!655843 m!628923))

(assert (=> b!655839 m!628889))

(assert (=> b!655839 m!628889))

(declare-fun m!628925 () Bool)

(assert (=> b!655839 m!628925))

(assert (=> b!655826 m!628917))

(declare-fun m!628927 () Bool)

(assert (=> b!655826 m!628927))

(declare-fun m!628929 () Bool)

(assert (=> b!655822 m!628929))

(declare-fun m!628931 () Bool)

(assert (=> b!655831 m!628931))

(declare-fun m!628933 () Bool)

(assert (=> b!655836 m!628933))

(declare-fun m!628935 () Bool)

(assert (=> b!655821 m!628935))

(assert (=> b!655821 m!628889))

(assert (=> b!655821 m!628889))

(declare-fun m!628937 () Bool)

(assert (=> b!655821 m!628937))

(assert (=> b!655824 m!628889))

(assert (=> b!655824 m!628889))

(assert (=> b!655824 m!628921))

(assert (=> b!655823 m!628889))

(assert (=> b!655823 m!628889))

(assert (=> b!655823 m!628911))

(declare-fun m!628939 () Bool)

(assert (=> b!655834 m!628939))

(declare-fun m!628941 () Bool)

(assert (=> start!59368 m!628941))

(declare-fun m!628943 () Bool)

(assert (=> start!59368 m!628943))

(declare-fun m!628945 () Bool)

(assert (=> b!655827 m!628945))

(declare-fun m!628947 () Bool)

(assert (=> b!655827 m!628947))

(assert (=> b!655827 m!628889))

(assert (=> b!655827 m!628917))

(assert (=> b!655827 m!628889))

(declare-fun m!628949 () Bool)

(assert (=> b!655827 m!628949))

(declare-fun m!628951 () Bool)

(assert (=> b!655827 m!628951))

(declare-fun m!628953 () Bool)

(assert (=> b!655827 m!628953))

(declare-fun m!628955 () Bool)

(assert (=> b!655827 m!628955))

(check-sat (not b!655824) (not b!655830) (not b!655839) (not b!655829) (not b!655836) (not start!59368) (not b!655827) (not b!655821) (not b!655835) (not b!655823) (not b!655844) (not b!655843) (not b!655822) (not b!655831))
(check-sat)
