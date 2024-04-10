; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59574 () Bool)

(assert start!59574)

(declare-fun b!657929 () Bool)

(declare-fun res!426651 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!657929 (= res!426651 (bvsge j!136 index!984))))

(declare-fun e!377960 () Bool)

(assert (=> b!657929 (=> res!426651 e!377960)))

(declare-fun e!377962 () Bool)

(assert (=> b!657929 (= e!377962 e!377960)))

(declare-fun b!657930 () Bool)

(assert (=> b!657930 false))

(declare-datatypes ((Unit!22784 0))(
  ( (Unit!22785) )
))
(declare-fun lt!307457 () Unit!22784)

(declare-datatypes ((array!38732 0))(
  ( (array!38733 (arr!18563 (Array (_ BitVec 32) (_ BitVec 64))) (size!18927 (_ BitVec 32))) )
))
(declare-fun lt!307459 () array!38732)

(declare-fun a!2986 () array!38732)

(declare-datatypes ((List!12604 0))(
  ( (Nil!12601) (Cons!12600 (h!13645 (_ BitVec 64)) (t!18832 List!12604)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38732 (_ BitVec 64) (_ BitVec 32) List!12604) Unit!22784)

(assert (=> b!657930 (= lt!307457 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307459 (select (arr!18563 a!2986) j!136) index!984 Nil!12601))))

(declare-fun arrayNoDuplicates!0 (array!38732 (_ BitVec 32) List!12604) Bool)

(assert (=> b!657930 (arrayNoDuplicates!0 lt!307459 index!984 Nil!12601)))

(declare-fun lt!307464 () Unit!22784)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38732 (_ BitVec 32) (_ BitVec 32)) Unit!22784)

(assert (=> b!657930 (= lt!307464 (lemmaNoDuplicateFromThenFromBigger!0 lt!307459 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657930 (arrayNoDuplicates!0 lt!307459 #b00000000000000000000000000000000 Nil!12601)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!307463 () Unit!22784)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38732 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12604) Unit!22784)

(assert (=> b!657930 (= lt!307463 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12601))))

(declare-fun arrayContainsKey!0 (array!38732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657930 (arrayContainsKey!0 lt!307459 (select (arr!18563 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307461 () Unit!22784)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38732 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22784)

(assert (=> b!657930 (= lt!307461 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307459 (select (arr!18563 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!377966 () Bool)

(assert (=> b!657930 e!377966))

(declare-fun res!426659 () Bool)

(assert (=> b!657930 (=> (not res!426659) (not e!377966))))

(assert (=> b!657930 (= res!426659 (arrayContainsKey!0 lt!307459 (select (arr!18563 a!2986) j!136) j!136))))

(declare-fun e!377963 () Unit!22784)

(declare-fun Unit!22786 () Unit!22784)

(assert (=> b!657930 (= e!377963 Unit!22786)))

(declare-fun b!657931 () Bool)

(declare-fun e!377958 () Bool)

(declare-datatypes ((SeekEntryResult!7003 0))(
  ( (MissingZero!7003 (index!30377 (_ BitVec 32))) (Found!7003 (index!30378 (_ BitVec 32))) (Intermediate!7003 (undefined!7815 Bool) (index!30379 (_ BitVec 32)) (x!59166 (_ BitVec 32))) (Undefined!7003) (MissingVacant!7003 (index!30380 (_ BitVec 32))) )
))
(declare-fun lt!307458 () SeekEntryResult!7003)

(declare-fun lt!307467 () SeekEntryResult!7003)

(assert (=> b!657931 (= e!377958 (= lt!307458 lt!307467))))

(declare-fun res!426663 () Bool)

(declare-fun e!377959 () Bool)

(assert (=> start!59574 (=> (not res!426663) (not e!377959))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59574 (= res!426663 (validMask!0 mask!3053))))

(assert (=> start!59574 e!377959))

(assert (=> start!59574 true))

(declare-fun array_inv!14359 (array!38732) Bool)

(assert (=> start!59574 (array_inv!14359 a!2986)))

(declare-fun b!657932 () Bool)

(declare-fun e!377956 () Unit!22784)

(declare-fun Unit!22787 () Unit!22784)

(assert (=> b!657932 (= e!377956 Unit!22787)))

(assert (=> b!657932 false))

(declare-fun b!657933 () Bool)

(assert (=> b!657933 false))

(declare-fun lt!307460 () Unit!22784)

(assert (=> b!657933 (= lt!307460 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307459 (select (arr!18563 a!2986) j!136) j!136 Nil!12601))))

(assert (=> b!657933 (arrayNoDuplicates!0 lt!307459 j!136 Nil!12601)))

(declare-fun lt!307466 () Unit!22784)

(assert (=> b!657933 (= lt!307466 (lemmaNoDuplicateFromThenFromBigger!0 lt!307459 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657933 (arrayNoDuplicates!0 lt!307459 #b00000000000000000000000000000000 Nil!12601)))

(declare-fun lt!307449 () Unit!22784)

(assert (=> b!657933 (= lt!307449 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12601))))

(assert (=> b!657933 (arrayContainsKey!0 lt!307459 (select (arr!18563 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307452 () Unit!22784)

(assert (=> b!657933 (= lt!307452 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307459 (select (arr!18563 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!377961 () Unit!22784)

(declare-fun Unit!22788 () Unit!22784)

(assert (=> b!657933 (= e!377961 Unit!22788)))

(declare-fun b!657934 () Bool)

(declare-fun e!377955 () Unit!22784)

(declare-fun Unit!22789 () Unit!22784)

(assert (=> b!657934 (= e!377955 Unit!22789)))

(declare-fun res!426665 () Bool)

(assert (=> b!657934 (= res!426665 (= (select (store (arr!18563 a!2986) i!1108 k!1786) index!984) (select (arr!18563 a!2986) j!136)))))

(assert (=> b!657934 (=> (not res!426665) (not e!377962))))

(assert (=> b!657934 e!377962))

(declare-fun c!76009 () Bool)

(assert (=> b!657934 (= c!76009 (bvslt j!136 index!984))))

(declare-fun lt!307462 () Unit!22784)

(assert (=> b!657934 (= lt!307462 e!377961)))

(declare-fun c!76008 () Bool)

(assert (=> b!657934 (= c!76008 (bvslt index!984 j!136))))

(declare-fun lt!307468 () Unit!22784)

(assert (=> b!657934 (= lt!307468 e!377963)))

(assert (=> b!657934 false))

(declare-fun b!657935 () Bool)

(declare-fun Unit!22790 () Unit!22784)

(assert (=> b!657935 (= e!377963 Unit!22790)))

(declare-fun b!657936 () Bool)

(declare-fun res!426649 () Bool)

(assert (=> b!657936 (=> (not res!426649) (not e!377959))))

(assert (=> b!657936 (= res!426649 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657937 () Bool)

(declare-fun res!426661 () Bool)

(assert (=> b!657937 (=> (not res!426661) (not e!377959))))

(assert (=> b!657937 (= res!426661 (and (= (size!18927 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18927 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18927 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657938 () Bool)

(declare-fun e!377964 () Bool)

(assert (=> b!657938 (= e!377964 true)))

(assert (=> b!657938 (= (select (store (arr!18563 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657939 () Bool)

(declare-fun Unit!22791 () Unit!22784)

(assert (=> b!657939 (= e!377961 Unit!22791)))

(declare-fun b!657940 () Bool)

(declare-fun res!426655 () Bool)

(declare-fun e!377954 () Bool)

(assert (=> b!657940 (=> (not res!426655) (not e!377954))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!657940 (= res!426655 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18563 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657941 () Bool)

(declare-fun Unit!22792 () Unit!22784)

(assert (=> b!657941 (= e!377955 Unit!22792)))

(declare-fun b!657942 () Bool)

(declare-fun e!377953 () Bool)

(assert (=> b!657942 (= e!377953 (not e!377964))))

(declare-fun res!426654 () Bool)

(assert (=> b!657942 (=> res!426654 e!377964)))

(declare-fun lt!307456 () SeekEntryResult!7003)

(assert (=> b!657942 (= res!426654 (not (= lt!307456 (MissingVacant!7003 vacantSpotIndex!68))))))

(declare-fun lt!307453 () Unit!22784)

(assert (=> b!657942 (= lt!307453 e!377955)))

(declare-fun c!76010 () Bool)

(assert (=> b!657942 (= c!76010 (= lt!307456 (Found!7003 index!984)))))

(declare-fun lt!307465 () Unit!22784)

(assert (=> b!657942 (= lt!307465 e!377956)))

(declare-fun c!76007 () Bool)

(assert (=> b!657942 (= c!76007 (= lt!307456 Undefined!7003))))

(declare-fun lt!307455 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38732 (_ BitVec 32)) SeekEntryResult!7003)

(assert (=> b!657942 (= lt!307456 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307455 lt!307459 mask!3053))))

(assert (=> b!657942 e!377958))

(declare-fun res!426662 () Bool)

(assert (=> b!657942 (=> (not res!426662) (not e!377958))))

(declare-fun lt!307450 () (_ BitVec 32))

(assert (=> b!657942 (= res!426662 (= lt!307467 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307450 vacantSpotIndex!68 lt!307455 lt!307459 mask!3053)))))

(assert (=> b!657942 (= lt!307467 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307450 vacantSpotIndex!68 (select (arr!18563 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657942 (= lt!307455 (select (store (arr!18563 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!307451 () Unit!22784)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38732 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22784)

(assert (=> b!657942 (= lt!307451 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307450 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657942 (= lt!307450 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657943 () Bool)

(declare-fun res!426657 () Bool)

(assert (=> b!657943 (=> (not res!426657) (not e!377959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657943 (= res!426657 (validKeyInArray!0 (select (arr!18563 a!2986) j!136)))))

(declare-fun b!657944 () Bool)

(declare-fun e!377957 () Bool)

(assert (=> b!657944 (= e!377954 e!377957)))

(declare-fun res!426656 () Bool)

(assert (=> b!657944 (=> (not res!426656) (not e!377957))))

(assert (=> b!657944 (= res!426656 (= (select (store (arr!18563 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657944 (= lt!307459 (array!38733 (store (arr!18563 a!2986) i!1108 k!1786) (size!18927 a!2986)))))

(declare-fun b!657945 () Bool)

(declare-fun res!426652 () Bool)

(assert (=> b!657945 (=> (not res!426652) (not e!377959))))

(assert (=> b!657945 (= res!426652 (validKeyInArray!0 k!1786))))

(declare-fun b!657946 () Bool)

(assert (=> b!657946 (= e!377959 e!377954)))

(declare-fun res!426660 () Bool)

(assert (=> b!657946 (=> (not res!426660) (not e!377954))))

(declare-fun lt!307454 () SeekEntryResult!7003)

(assert (=> b!657946 (= res!426660 (or (= lt!307454 (MissingZero!7003 i!1108)) (= lt!307454 (MissingVacant!7003 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38732 (_ BitVec 32)) SeekEntryResult!7003)

(assert (=> b!657946 (= lt!307454 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!657947 () Bool)

(assert (=> b!657947 (= e!377966 (arrayContainsKey!0 lt!307459 (select (arr!18563 a!2986) j!136) index!984))))

(declare-fun b!657948 () Bool)

(declare-fun Unit!22793 () Unit!22784)

(assert (=> b!657948 (= e!377956 Unit!22793)))

(declare-fun b!657949 () Bool)

(declare-fun e!377967 () Bool)

(assert (=> b!657949 (= e!377967 (arrayContainsKey!0 lt!307459 (select (arr!18563 a!2986) j!136) index!984))))

(declare-fun b!657950 () Bool)

(declare-fun res!426658 () Bool)

(assert (=> b!657950 (=> (not res!426658) (not e!377954))))

(assert (=> b!657950 (= res!426658 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12601))))

(declare-fun b!657951 () Bool)

(declare-fun res!426653 () Bool)

(assert (=> b!657951 (=> (not res!426653) (not e!377954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38732 (_ BitVec 32)) Bool)

(assert (=> b!657951 (= res!426653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657952 () Bool)

(assert (=> b!657952 (= e!377957 e!377953)))

(declare-fun res!426650 () Bool)

(assert (=> b!657952 (=> (not res!426650) (not e!377953))))

(assert (=> b!657952 (= res!426650 (and (= lt!307458 (Found!7003 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18563 a!2986) index!984) (select (arr!18563 a!2986) j!136))) (not (= (select (arr!18563 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!657952 (= lt!307458 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18563 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!426664 () Bool)

(declare-fun b!657953 () Bool)

(assert (=> b!657953 (= res!426664 (arrayContainsKey!0 lt!307459 (select (arr!18563 a!2986) j!136) j!136))))

(assert (=> b!657953 (=> (not res!426664) (not e!377967))))

(assert (=> b!657953 (= e!377960 e!377967)))

(assert (= (and start!59574 res!426663) b!657937))

(assert (= (and b!657937 res!426661) b!657943))

(assert (= (and b!657943 res!426657) b!657945))

(assert (= (and b!657945 res!426652) b!657936))

(assert (= (and b!657936 res!426649) b!657946))

(assert (= (and b!657946 res!426660) b!657951))

(assert (= (and b!657951 res!426653) b!657950))

(assert (= (and b!657950 res!426658) b!657940))

(assert (= (and b!657940 res!426655) b!657944))

(assert (= (and b!657944 res!426656) b!657952))

(assert (= (and b!657952 res!426650) b!657942))

(assert (= (and b!657942 res!426662) b!657931))

(assert (= (and b!657942 c!76007) b!657932))

(assert (= (and b!657942 (not c!76007)) b!657948))

(assert (= (and b!657942 c!76010) b!657934))

(assert (= (and b!657942 (not c!76010)) b!657941))

(assert (= (and b!657934 res!426665) b!657929))

(assert (= (and b!657929 (not res!426651)) b!657953))

(assert (= (and b!657953 res!426664) b!657949))

(assert (= (and b!657934 c!76009) b!657933))

(assert (= (and b!657934 (not c!76009)) b!657939))

(assert (= (and b!657934 c!76008) b!657930))

(assert (= (and b!657934 (not c!76008)) b!657935))

(assert (= (and b!657930 res!426659) b!657947))

(assert (= (and b!657942 (not res!426654)) b!657938))

(declare-fun m!630937 () Bool)

(assert (=> b!657936 m!630937))

(declare-fun m!630939 () Bool)

(assert (=> b!657930 m!630939))

(declare-fun m!630941 () Bool)

(assert (=> b!657930 m!630941))

(assert (=> b!657930 m!630941))

(declare-fun m!630943 () Bool)

(assert (=> b!657930 m!630943))

(declare-fun m!630945 () Bool)

(assert (=> b!657930 m!630945))

(assert (=> b!657930 m!630941))

(declare-fun m!630947 () Bool)

(assert (=> b!657930 m!630947))

(assert (=> b!657930 m!630941))

(declare-fun m!630949 () Bool)

(assert (=> b!657930 m!630949))

(declare-fun m!630951 () Bool)

(assert (=> b!657930 m!630951))

(assert (=> b!657930 m!630941))

(declare-fun m!630953 () Bool)

(assert (=> b!657930 m!630953))

(declare-fun m!630955 () Bool)

(assert (=> b!657930 m!630955))

(declare-fun m!630957 () Bool)

(assert (=> b!657938 m!630957))

(declare-fun m!630959 () Bool)

(assert (=> b!657938 m!630959))

(declare-fun m!630961 () Bool)

(assert (=> b!657951 m!630961))

(declare-fun m!630963 () Bool)

(assert (=> b!657940 m!630963))

(declare-fun m!630965 () Bool)

(assert (=> b!657942 m!630965))

(declare-fun m!630967 () Bool)

(assert (=> b!657942 m!630967))

(assert (=> b!657942 m!630941))

(assert (=> b!657942 m!630957))

(assert (=> b!657942 m!630941))

(declare-fun m!630969 () Bool)

(assert (=> b!657942 m!630969))

(declare-fun m!630971 () Bool)

(assert (=> b!657942 m!630971))

(declare-fun m!630973 () Bool)

(assert (=> b!657942 m!630973))

(declare-fun m!630975 () Bool)

(assert (=> b!657942 m!630975))

(assert (=> b!657947 m!630941))

(assert (=> b!657947 m!630941))

(declare-fun m!630977 () Bool)

(assert (=> b!657947 m!630977))

(assert (=> b!657953 m!630941))

(assert (=> b!657953 m!630941))

(assert (=> b!657953 m!630953))

(declare-fun m!630979 () Bool)

(assert (=> b!657945 m!630979))

(declare-fun m!630981 () Bool)

(assert (=> start!59574 m!630981))

(declare-fun m!630983 () Bool)

(assert (=> start!59574 m!630983))

(declare-fun m!630985 () Bool)

(assert (=> b!657952 m!630985))

(assert (=> b!657952 m!630941))

(assert (=> b!657952 m!630941))

(declare-fun m!630987 () Bool)

(assert (=> b!657952 m!630987))

(declare-fun m!630989 () Bool)

(assert (=> b!657950 m!630989))

(assert (=> b!657934 m!630957))

(assert (=> b!657934 m!630959))

(assert (=> b!657934 m!630941))

(assert (=> b!657933 m!630939))

(assert (=> b!657933 m!630941))

(declare-fun m!630991 () Bool)

(assert (=> b!657933 m!630991))

(declare-fun m!630993 () Bool)

(assert (=> b!657933 m!630993))

(assert (=> b!657933 m!630941))

(declare-fun m!630995 () Bool)

(assert (=> b!657933 m!630995))

(assert (=> b!657933 m!630941))

(declare-fun m!630997 () Bool)

(assert (=> b!657933 m!630997))

(assert (=> b!657933 m!630955))

(assert (=> b!657933 m!630941))

(declare-fun m!630999 () Bool)

(assert (=> b!657933 m!630999))

(assert (=> b!657949 m!630941))

(assert (=> b!657949 m!630941))

(assert (=> b!657949 m!630977))

(assert (=> b!657944 m!630957))

(declare-fun m!631001 () Bool)

(assert (=> b!657944 m!631001))

(declare-fun m!631003 () Bool)

(assert (=> b!657946 m!631003))

(assert (=> b!657943 m!630941))

(assert (=> b!657943 m!630941))

(declare-fun m!631005 () Bool)

(assert (=> b!657943 m!631005))

(push 1)

