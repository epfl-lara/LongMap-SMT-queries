; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55656 () Bool)

(assert start!55656)

(declare-fun b!609927 () Bool)

(declare-fun e!349336 () Bool)

(declare-datatypes ((array!37332 0))(
  ( (array!37333 (arr!17914 (Array (_ BitVec 32) (_ BitVec 64))) (size!18278 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37332)

(assert (=> b!609927 (= e!349336 (bvsle #b00000000000000000000000000000000 (size!18278 a!2986)))))

(declare-fun lt!278881 () array!37332)

(declare-datatypes ((List!11862 0))(
  ( (Nil!11859) (Cons!11858 (h!12906 (_ BitVec 64)) (t!18082 List!11862)) )
))
(declare-fun arrayNoDuplicates!0 (array!37332 (_ BitVec 32) List!11862) Bool)

(assert (=> b!609927 (arrayNoDuplicates!0 lt!278881 #b00000000000000000000000000000000 Nil!11859)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((Unit!19513 0))(
  ( (Unit!19514) )
))
(declare-fun lt!278878 () Unit!19513)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37332 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11862) Unit!19513)

(assert (=> b!609927 (= lt!278878 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11859))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609927 (arrayContainsKey!0 lt!278881 (select (arr!17914 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278866 () Unit!19513)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37332 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19513)

(assert (=> b!609927 (= lt!278866 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278881 (select (arr!17914 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!349333 () Bool)

(assert (=> b!609927 e!349333))

(declare-fun res!392317 () Bool)

(assert (=> b!609927 (=> (not res!392317) (not e!349333))))

(assert (=> b!609927 (= res!392317 (arrayContainsKey!0 lt!278881 (select (arr!17914 a!2986) j!136) j!136))))

(declare-fun b!609928 () Bool)

(declare-fun res!392316 () Bool)

(declare-fun e!349342 () Bool)

(assert (=> b!609928 (=> (not res!392316) (not e!349342))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!609928 (= res!392316 (and (= (size!18278 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18278 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18278 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609929 () Bool)

(declare-fun e!349345 () Unit!19513)

(declare-fun Unit!19515 () Unit!19513)

(assert (=> b!609929 (= e!349345 Unit!19515)))

(declare-fun lt!278868 () Unit!19513)

(assert (=> b!609929 (= lt!278868 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278881 (select (arr!17914 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609929 (arrayContainsKey!0 lt!278881 (select (arr!17914 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278880 () Unit!19513)

(assert (=> b!609929 (= lt!278880 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11859))))

(assert (=> b!609929 (arrayNoDuplicates!0 lt!278881 #b00000000000000000000000000000000 Nil!11859)))

(declare-fun lt!278877 () Unit!19513)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37332 (_ BitVec 32) (_ BitVec 32)) Unit!19513)

(assert (=> b!609929 (= lt!278877 (lemmaNoDuplicateFromThenFromBigger!0 lt!278881 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609929 (arrayNoDuplicates!0 lt!278881 j!136 Nil!11859)))

(declare-fun lt!278875 () Unit!19513)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37332 (_ BitVec 64) (_ BitVec 32) List!11862) Unit!19513)

(assert (=> b!609929 (= lt!278875 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278881 (select (arr!17914 a!2986) j!136) j!136 Nil!11859))))

(assert (=> b!609929 false))

(declare-fun b!609930 () Bool)

(declare-fun res!392313 () Bool)

(assert (=> b!609930 (=> (not res!392313) (not e!349342))))

(assert (=> b!609930 (= res!392313 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609931 () Bool)

(declare-fun e!349334 () Unit!19513)

(declare-fun Unit!19516 () Unit!19513)

(assert (=> b!609931 (= e!349334 Unit!19516)))

(assert (=> b!609931 false))

(declare-fun b!609932 () Bool)

(declare-fun res!392311 () Bool)

(declare-fun e!349344 () Bool)

(assert (=> b!609932 (=> (not res!392311) (not e!349344))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!609932 (= res!392311 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17914 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609933 () Bool)

(declare-fun e!349343 () Bool)

(declare-fun e!349338 () Bool)

(assert (=> b!609933 (= e!349343 e!349338)))

(declare-fun res!392306 () Bool)

(assert (=> b!609933 (=> (not res!392306) (not e!349338))))

(declare-datatypes ((SeekEntryResult!6310 0))(
  ( (MissingZero!6310 (index!27515 (_ BitVec 32))) (Found!6310 (index!27516 (_ BitVec 32))) (Intermediate!6310 (undefined!7122 Bool) (index!27517 (_ BitVec 32)) (x!56470 (_ BitVec 32))) (Undefined!6310) (MissingVacant!6310 (index!27518 (_ BitVec 32))) )
))
(declare-fun lt!278872 () SeekEntryResult!6310)

(assert (=> b!609933 (= res!392306 (and (= lt!278872 (Found!6310 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17914 a!2986) index!984) (select (arr!17914 a!2986) j!136))) (not (= (select (arr!17914 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37332 (_ BitVec 32)) SeekEntryResult!6310)

(assert (=> b!609933 (= lt!278872 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17914 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609934 () Bool)

(declare-fun e!349339 () Bool)

(declare-fun lt!278879 () SeekEntryResult!6310)

(assert (=> b!609934 (= e!349339 (= lt!278872 lt!278879))))

(declare-fun b!609935 () Bool)

(declare-fun e!349335 () Bool)

(declare-fun e!349337 () Bool)

(assert (=> b!609935 (= e!349335 e!349337)))

(declare-fun res!392302 () Bool)

(assert (=> b!609935 (=> (not res!392302) (not e!349337))))

(assert (=> b!609935 (= res!392302 (arrayContainsKey!0 lt!278881 (select (arr!17914 a!2986) j!136) j!136))))

(declare-fun b!609936 () Bool)

(declare-fun e!349340 () Bool)

(assert (=> b!609936 (= e!349340 e!349335)))

(declare-fun res!392315 () Bool)

(assert (=> b!609936 (=> res!392315 e!349335)))

(declare-fun lt!278874 () (_ BitVec 64))

(declare-fun lt!278869 () (_ BitVec 64))

(assert (=> b!609936 (= res!392315 (or (not (= (select (arr!17914 a!2986) j!136) lt!278869)) (not (= (select (arr!17914 a!2986) j!136) lt!278874)) (bvsge j!136 index!984)))))

(declare-fun b!609937 () Bool)

(assert (=> b!609937 (= e!349344 e!349343)))

(declare-fun res!392314 () Bool)

(assert (=> b!609937 (=> (not res!392314) (not e!349343))))

(assert (=> b!609937 (= res!392314 (= (select (store (arr!17914 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609937 (= lt!278881 (array!37333 (store (arr!17914 a!2986) i!1108 k0!1786) (size!18278 a!2986)))))

(declare-fun b!609938 () Bool)

(assert (=> b!609938 (= e!349337 (arrayContainsKey!0 lt!278881 (select (arr!17914 a!2986) j!136) index!984))))

(declare-fun b!609939 () Bool)

(assert (=> b!609939 (= e!349333 (arrayContainsKey!0 lt!278881 (select (arr!17914 a!2986) j!136) index!984))))

(declare-fun b!609940 () Bool)

(declare-fun e!349341 () Bool)

(assert (=> b!609940 (= e!349341 e!349336)))

(declare-fun res!392309 () Bool)

(assert (=> b!609940 (=> res!392309 e!349336)))

(assert (=> b!609940 (= res!392309 (bvsge index!984 j!136))))

(declare-fun lt!278870 () Unit!19513)

(assert (=> b!609940 (= lt!278870 e!349345)))

(declare-fun c!69182 () Bool)

(assert (=> b!609940 (= c!69182 (bvslt j!136 index!984))))

(declare-fun b!609942 () Bool)

(assert (=> b!609942 (= e!349342 e!349344)))

(declare-fun res!392304 () Bool)

(assert (=> b!609942 (=> (not res!392304) (not e!349344))))

(declare-fun lt!278867 () SeekEntryResult!6310)

(assert (=> b!609942 (= res!392304 (or (= lt!278867 (MissingZero!6310 i!1108)) (= lt!278867 (MissingVacant!6310 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37332 (_ BitVec 32)) SeekEntryResult!6310)

(assert (=> b!609942 (= lt!278867 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!609943 () Bool)

(declare-fun e!349347 () Bool)

(assert (=> b!609943 (= e!349338 (not e!349347))))

(declare-fun res!392307 () Bool)

(assert (=> b!609943 (=> res!392307 e!349347)))

(declare-fun lt!278876 () SeekEntryResult!6310)

(assert (=> b!609943 (= res!392307 (not (= lt!278876 (Found!6310 index!984))))))

(declare-fun lt!278865 () Unit!19513)

(assert (=> b!609943 (= lt!278865 e!349334)))

(declare-fun c!69181 () Bool)

(assert (=> b!609943 (= c!69181 (= lt!278876 Undefined!6310))))

(assert (=> b!609943 (= lt!278876 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278869 lt!278881 mask!3053))))

(assert (=> b!609943 e!349339))

(declare-fun res!392303 () Bool)

(assert (=> b!609943 (=> (not res!392303) (not e!349339))))

(declare-fun lt!278871 () (_ BitVec 32))

(assert (=> b!609943 (= res!392303 (= lt!278879 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278871 vacantSpotIndex!68 lt!278869 lt!278881 mask!3053)))))

(assert (=> b!609943 (= lt!278879 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278871 vacantSpotIndex!68 (select (arr!17914 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!609943 (= lt!278869 (select (store (arr!17914 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278873 () Unit!19513)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37332 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19513)

(assert (=> b!609943 (= lt!278873 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278871 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609943 (= lt!278871 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!609944 () Bool)

(declare-fun Unit!19517 () Unit!19513)

(assert (=> b!609944 (= e!349334 Unit!19517)))

(declare-fun b!609945 () Bool)

(declare-fun res!392308 () Bool)

(assert (=> b!609945 (=> (not res!392308) (not e!349344))))

(assert (=> b!609945 (= res!392308 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11859))))

(declare-fun b!609946 () Bool)

(assert (=> b!609946 (= e!349347 e!349341)))

(declare-fun res!392320 () Bool)

(assert (=> b!609946 (=> res!392320 e!349341)))

(assert (=> b!609946 (= res!392320 (or (not (= (select (arr!17914 a!2986) j!136) lt!278869)) (not (= (select (arr!17914 a!2986) j!136) lt!278874))))))

(assert (=> b!609946 e!349340))

(declare-fun res!392312 () Bool)

(assert (=> b!609946 (=> (not res!392312) (not e!349340))))

(assert (=> b!609946 (= res!392312 (= lt!278874 (select (arr!17914 a!2986) j!136)))))

(assert (=> b!609946 (= lt!278874 (select (store (arr!17914 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!609947 () Bool)

(declare-fun res!392305 () Bool)

(assert (=> b!609947 (=> (not res!392305) (not e!349344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37332 (_ BitVec 32)) Bool)

(assert (=> b!609947 (= res!392305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!392318 () Bool)

(assert (=> start!55656 (=> (not res!392318) (not e!349342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55656 (= res!392318 (validMask!0 mask!3053))))

(assert (=> start!55656 e!349342))

(assert (=> start!55656 true))

(declare-fun array_inv!13773 (array!37332) Bool)

(assert (=> start!55656 (array_inv!13773 a!2986)))

(declare-fun b!609941 () Bool)

(declare-fun res!392319 () Bool)

(assert (=> b!609941 (=> (not res!392319) (not e!349342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609941 (= res!392319 (validKeyInArray!0 (select (arr!17914 a!2986) j!136)))))

(declare-fun b!609948 () Bool)

(declare-fun res!392310 () Bool)

(assert (=> b!609948 (=> (not res!392310) (not e!349342))))

(assert (=> b!609948 (= res!392310 (validKeyInArray!0 k0!1786))))

(declare-fun b!609949 () Bool)

(declare-fun Unit!19518 () Unit!19513)

(assert (=> b!609949 (= e!349345 Unit!19518)))

(assert (= (and start!55656 res!392318) b!609928))

(assert (= (and b!609928 res!392316) b!609941))

(assert (= (and b!609941 res!392319) b!609948))

(assert (= (and b!609948 res!392310) b!609930))

(assert (= (and b!609930 res!392313) b!609942))

(assert (= (and b!609942 res!392304) b!609947))

(assert (= (and b!609947 res!392305) b!609945))

(assert (= (and b!609945 res!392308) b!609932))

(assert (= (and b!609932 res!392311) b!609937))

(assert (= (and b!609937 res!392314) b!609933))

(assert (= (and b!609933 res!392306) b!609943))

(assert (= (and b!609943 res!392303) b!609934))

(assert (= (and b!609943 c!69181) b!609931))

(assert (= (and b!609943 (not c!69181)) b!609944))

(assert (= (and b!609943 (not res!392307)) b!609946))

(assert (= (and b!609946 res!392312) b!609936))

(assert (= (and b!609936 (not res!392315)) b!609935))

(assert (= (and b!609935 res!392302) b!609938))

(assert (= (and b!609946 (not res!392320)) b!609940))

(assert (= (and b!609940 c!69182) b!609929))

(assert (= (and b!609940 (not c!69182)) b!609949))

(assert (= (and b!609940 (not res!392309)) b!609927))

(assert (= (and b!609927 res!392317) b!609939))

(declare-fun m!586679 () Bool)

(assert (=> b!609939 m!586679))

(assert (=> b!609939 m!586679))

(declare-fun m!586681 () Bool)

(assert (=> b!609939 m!586681))

(assert (=> b!609946 m!586679))

(declare-fun m!586683 () Bool)

(assert (=> b!609946 m!586683))

(declare-fun m!586685 () Bool)

(assert (=> b!609946 m!586685))

(assert (=> b!609927 m!586679))

(assert (=> b!609927 m!586679))

(declare-fun m!586687 () Bool)

(assert (=> b!609927 m!586687))

(declare-fun m!586689 () Bool)

(assert (=> b!609927 m!586689))

(declare-fun m!586691 () Bool)

(assert (=> b!609927 m!586691))

(assert (=> b!609927 m!586679))

(declare-fun m!586693 () Bool)

(assert (=> b!609927 m!586693))

(assert (=> b!609927 m!586679))

(declare-fun m!586695 () Bool)

(assert (=> b!609927 m!586695))

(declare-fun m!586697 () Bool)

(assert (=> start!55656 m!586697))

(declare-fun m!586699 () Bool)

(assert (=> start!55656 m!586699))

(declare-fun m!586701 () Bool)

(assert (=> b!609943 m!586701))

(declare-fun m!586703 () Bool)

(assert (=> b!609943 m!586703))

(assert (=> b!609943 m!586679))

(assert (=> b!609943 m!586679))

(declare-fun m!586705 () Bool)

(assert (=> b!609943 m!586705))

(declare-fun m!586707 () Bool)

(assert (=> b!609943 m!586707))

(declare-fun m!586709 () Bool)

(assert (=> b!609943 m!586709))

(assert (=> b!609943 m!586683))

(declare-fun m!586711 () Bool)

(assert (=> b!609943 m!586711))

(assert (=> b!609929 m!586679))

(declare-fun m!586713 () Bool)

(assert (=> b!609929 m!586713))

(declare-fun m!586715 () Bool)

(assert (=> b!609929 m!586715))

(assert (=> b!609929 m!586689))

(assert (=> b!609929 m!586691))

(assert (=> b!609929 m!586679))

(declare-fun m!586717 () Bool)

(assert (=> b!609929 m!586717))

(assert (=> b!609929 m!586679))

(declare-fun m!586719 () Bool)

(assert (=> b!609929 m!586719))

(assert (=> b!609929 m!586679))

(declare-fun m!586721 () Bool)

(assert (=> b!609929 m!586721))

(assert (=> b!609935 m!586679))

(assert (=> b!609935 m!586679))

(assert (=> b!609935 m!586695))

(declare-fun m!586723 () Bool)

(assert (=> b!609932 m!586723))

(assert (=> b!609941 m!586679))

(assert (=> b!609941 m!586679))

(declare-fun m!586725 () Bool)

(assert (=> b!609941 m!586725))

(declare-fun m!586727 () Bool)

(assert (=> b!609947 m!586727))

(declare-fun m!586729 () Bool)

(assert (=> b!609945 m!586729))

(assert (=> b!609937 m!586683))

(declare-fun m!586731 () Bool)

(assert (=> b!609937 m!586731))

(declare-fun m!586733 () Bool)

(assert (=> b!609948 m!586733))

(declare-fun m!586735 () Bool)

(assert (=> b!609933 m!586735))

(assert (=> b!609933 m!586679))

(assert (=> b!609933 m!586679))

(declare-fun m!586737 () Bool)

(assert (=> b!609933 m!586737))

(assert (=> b!609938 m!586679))

(assert (=> b!609938 m!586679))

(assert (=> b!609938 m!586681))

(declare-fun m!586739 () Bool)

(assert (=> b!609942 m!586739))

(assert (=> b!609936 m!586679))

(declare-fun m!586741 () Bool)

(assert (=> b!609930 m!586741))

(check-sat (not b!609938) (not b!609927) (not b!609935) (not start!55656) (not b!609948) (not b!609942) (not b!609939) (not b!609941) (not b!609943) (not b!609930) (not b!609947) (not b!609945) (not b!609929) (not b!609933))
(check-sat)
