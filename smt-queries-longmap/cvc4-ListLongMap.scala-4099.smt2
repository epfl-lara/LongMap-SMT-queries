; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56096 () Bool)

(assert start!56096)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!354947 () Bool)

(declare-fun b!618923 () Bool)

(declare-datatypes ((array!37566 0))(
  ( (array!37567 (arr!18029 (Array (_ BitVec 32) (_ BitVec 64))) (size!18393 (_ BitVec 32))) )
))
(declare-fun lt!285506 () array!37566)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37566)

(declare-fun arrayContainsKey!0 (array!37566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618923 (= e!354947 (arrayContainsKey!0 lt!285506 (select (arr!18029 a!2986) j!136) index!984))))

(declare-fun b!618924 () Bool)

(declare-fun res!398785 () Bool)

(declare-fun e!354945 () Bool)

(assert (=> b!618924 (=> (not res!398785) (not e!354945))))

(declare-datatypes ((List!12070 0))(
  ( (Nil!12067) (Cons!12066 (h!13111 (_ BitVec 64)) (t!18298 List!12070)) )
))
(declare-fun arrayNoDuplicates!0 (array!37566 (_ BitVec 32) List!12070) Bool)

(assert (=> b!618924 (= res!398785 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12067))))

(declare-fun b!618925 () Bool)

(declare-datatypes ((Unit!20418 0))(
  ( (Unit!20419) )
))
(declare-fun e!354948 () Unit!20418)

(declare-fun Unit!20420 () Unit!20418)

(assert (=> b!618925 (= e!354948 Unit!20420)))

(declare-fun b!618926 () Bool)

(declare-fun e!354949 () Bool)

(assert (=> b!618926 (= e!354949 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!618926 (= (select (store (arr!18029 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618927 () Bool)

(declare-fun e!354955 () Bool)

(assert (=> b!618927 (= e!354945 e!354955)))

(declare-fun res!398775 () Bool)

(assert (=> b!618927 (=> (not res!398775) (not e!354955))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!618927 (= res!398775 (= (select (store (arr!18029 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618927 (= lt!285506 (array!37567 (store (arr!18029 a!2986) i!1108 k!1786) (size!18393 a!2986)))))

(declare-fun res!398787 () Bool)

(declare-fun e!354953 () Bool)

(assert (=> start!56096 (=> (not res!398787) (not e!354953))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56096 (= res!398787 (validMask!0 mask!3053))))

(assert (=> start!56096 e!354953))

(assert (=> start!56096 true))

(declare-fun array_inv!13825 (array!37566) Bool)

(assert (=> start!56096 (array_inv!13825 a!2986)))

(declare-fun b!618928 () Bool)

(declare-fun res!398774 () Bool)

(assert (=> b!618928 (=> (not res!398774) (not e!354953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618928 (= res!398774 (validKeyInArray!0 k!1786))))

(declare-fun b!618929 () Bool)

(declare-fun e!354951 () Bool)

(declare-datatypes ((SeekEntryResult!6469 0))(
  ( (MissingZero!6469 (index!28160 (_ BitVec 32))) (Found!6469 (index!28161 (_ BitVec 32))) (Intermediate!6469 (undefined!7281 Bool) (index!28162 (_ BitVec 32)) (x!56941 (_ BitVec 32))) (Undefined!6469) (MissingVacant!6469 (index!28163 (_ BitVec 32))) )
))
(declare-fun lt!285507 () SeekEntryResult!6469)

(declare-fun lt!285517 () SeekEntryResult!6469)

(assert (=> b!618929 (= e!354951 (= lt!285507 lt!285517))))

(declare-fun b!618930 () Bool)

(declare-fun e!354943 () Unit!20418)

(declare-fun Unit!20421 () Unit!20418)

(assert (=> b!618930 (= e!354943 Unit!20421)))

(declare-fun b!618931 () Bool)

(declare-fun res!398780 () Bool)

(assert (=> b!618931 (=> (not res!398780) (not e!354953))))

(assert (=> b!618931 (= res!398780 (validKeyInArray!0 (select (arr!18029 a!2986) j!136)))))

(declare-fun b!618932 () Bool)

(declare-fun res!398781 () Bool)

(assert (=> b!618932 (= res!398781 (bvsge j!136 index!984))))

(declare-fun e!354954 () Bool)

(assert (=> b!618932 (=> res!398781 e!354954)))

(declare-fun e!354950 () Bool)

(assert (=> b!618932 (= e!354950 e!354954)))

(declare-fun b!618933 () Bool)

(declare-fun res!398786 () Bool)

(assert (=> b!618933 (=> (not res!398786) (not e!354945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37566 (_ BitVec 32)) Bool)

(assert (=> b!618933 (= res!398786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618934 () Bool)

(declare-fun res!398788 () Bool)

(assert (=> b!618934 (= res!398788 (arrayContainsKey!0 lt!285506 (select (arr!18029 a!2986) j!136) j!136))))

(declare-fun e!354957 () Bool)

(assert (=> b!618934 (=> (not res!398788) (not e!354957))))

(assert (=> b!618934 (= e!354954 e!354957)))

(declare-fun b!618935 () Bool)

(assert (=> b!618935 false))

(declare-fun lt!285512 () Unit!20418)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37566 (_ BitVec 64) (_ BitVec 32) List!12070) Unit!20418)

(assert (=> b!618935 (= lt!285512 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285506 (select (arr!18029 a!2986) j!136) j!136 Nil!12067))))

(assert (=> b!618935 (arrayNoDuplicates!0 lt!285506 j!136 Nil!12067)))

(declare-fun lt!285513 () Unit!20418)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37566 (_ BitVec 32) (_ BitVec 32)) Unit!20418)

(assert (=> b!618935 (= lt!285513 (lemmaNoDuplicateFromThenFromBigger!0 lt!285506 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618935 (arrayNoDuplicates!0 lt!285506 #b00000000000000000000000000000000 Nil!12067)))

(declare-fun lt!285508 () Unit!20418)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37566 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12070) Unit!20418)

(assert (=> b!618935 (= lt!285508 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12067))))

(assert (=> b!618935 (arrayContainsKey!0 lt!285506 (select (arr!18029 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285504 () Unit!20418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37566 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20418)

(assert (=> b!618935 (= lt!285504 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285506 (select (arr!18029 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!354952 () Unit!20418)

(declare-fun Unit!20422 () Unit!20418)

(assert (=> b!618935 (= e!354952 Unit!20422)))

(declare-fun b!618936 () Bool)

(declare-fun Unit!20423 () Unit!20418)

(assert (=> b!618936 (= e!354952 Unit!20423)))

(declare-fun b!618937 () Bool)

(declare-fun e!354956 () Unit!20418)

(declare-fun Unit!20424 () Unit!20418)

(assert (=> b!618937 (= e!354956 Unit!20424)))

(assert (=> b!618937 false))

(declare-fun b!618938 () Bool)

(declare-fun Unit!20425 () Unit!20418)

(assert (=> b!618938 (= e!354948 Unit!20425)))

(declare-fun res!398779 () Bool)

(assert (=> b!618938 (= res!398779 (= (select (store (arr!18029 a!2986) i!1108 k!1786) index!984) (select (arr!18029 a!2986) j!136)))))

(assert (=> b!618938 (=> (not res!398779) (not e!354950))))

(assert (=> b!618938 e!354950))

(declare-fun c!70444 () Bool)

(assert (=> b!618938 (= c!70444 (bvslt j!136 index!984))))

(declare-fun lt!285509 () Unit!20418)

(assert (=> b!618938 (= lt!285509 e!354952)))

(declare-fun c!70442 () Bool)

(assert (=> b!618938 (= c!70442 (bvslt index!984 j!136))))

(declare-fun lt!285511 () Unit!20418)

(assert (=> b!618938 (= lt!285511 e!354943)))

(assert (=> b!618938 false))

(declare-fun b!618939 () Bool)

(assert (=> b!618939 false))

(declare-fun lt!285500 () Unit!20418)

(assert (=> b!618939 (= lt!285500 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285506 (select (arr!18029 a!2986) j!136) index!984 Nil!12067))))

(assert (=> b!618939 (arrayNoDuplicates!0 lt!285506 index!984 Nil!12067)))

(declare-fun lt!285516 () Unit!20418)

(assert (=> b!618939 (= lt!285516 (lemmaNoDuplicateFromThenFromBigger!0 lt!285506 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618939 (arrayNoDuplicates!0 lt!285506 #b00000000000000000000000000000000 Nil!12067)))

(declare-fun lt!285502 () Unit!20418)

(assert (=> b!618939 (= lt!285502 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12067))))

(assert (=> b!618939 (arrayContainsKey!0 lt!285506 (select (arr!18029 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285510 () Unit!20418)

(assert (=> b!618939 (= lt!285510 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285506 (select (arr!18029 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!618939 e!354947))

(declare-fun res!398773 () Bool)

(assert (=> b!618939 (=> (not res!398773) (not e!354947))))

(assert (=> b!618939 (= res!398773 (arrayContainsKey!0 lt!285506 (select (arr!18029 a!2986) j!136) j!136))))

(declare-fun Unit!20426 () Unit!20418)

(assert (=> b!618939 (= e!354943 Unit!20426)))

(declare-fun b!618940 () Bool)

(assert (=> b!618940 (= e!354953 e!354945)))

(declare-fun res!398789 () Bool)

(assert (=> b!618940 (=> (not res!398789) (not e!354945))))

(declare-fun lt!285499 () SeekEntryResult!6469)

(assert (=> b!618940 (= res!398789 (or (= lt!285499 (MissingZero!6469 i!1108)) (= lt!285499 (MissingVacant!6469 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37566 (_ BitVec 32)) SeekEntryResult!6469)

(assert (=> b!618940 (= lt!285499 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!618941 () Bool)

(declare-fun res!398776 () Bool)

(assert (=> b!618941 (=> (not res!398776) (not e!354953))))

(assert (=> b!618941 (= res!398776 (and (= (size!18393 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18393 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18393 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618942 () Bool)

(assert (=> b!618942 (= e!354957 (arrayContainsKey!0 lt!285506 (select (arr!18029 a!2986) j!136) index!984))))

(declare-fun b!618943 () Bool)

(declare-fun e!354946 () Bool)

(assert (=> b!618943 (= e!354946 (not e!354949))))

(declare-fun res!398778 () Bool)

(assert (=> b!618943 (=> res!398778 e!354949)))

(declare-fun lt!285505 () SeekEntryResult!6469)

(assert (=> b!618943 (= res!398778 (not (= lt!285505 (MissingVacant!6469 vacantSpotIndex!68))))))

(declare-fun lt!285503 () Unit!20418)

(assert (=> b!618943 (= lt!285503 e!354948)))

(declare-fun c!70443 () Bool)

(assert (=> b!618943 (= c!70443 (= lt!285505 (Found!6469 index!984)))))

(declare-fun lt!285514 () Unit!20418)

(assert (=> b!618943 (= lt!285514 e!354956)))

(declare-fun c!70445 () Bool)

(assert (=> b!618943 (= c!70445 (= lt!285505 Undefined!6469))))

(declare-fun lt!285501 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37566 (_ BitVec 32)) SeekEntryResult!6469)

(assert (=> b!618943 (= lt!285505 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285501 lt!285506 mask!3053))))

(assert (=> b!618943 e!354951))

(declare-fun res!398783 () Bool)

(assert (=> b!618943 (=> (not res!398783) (not e!354951))))

(declare-fun lt!285498 () (_ BitVec 32))

(assert (=> b!618943 (= res!398783 (= lt!285517 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285498 vacantSpotIndex!68 lt!285501 lt!285506 mask!3053)))))

(assert (=> b!618943 (= lt!285517 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285498 vacantSpotIndex!68 (select (arr!18029 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618943 (= lt!285501 (select (store (arr!18029 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!285515 () Unit!20418)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37566 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20418)

(assert (=> b!618943 (= lt!285515 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285498 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618943 (= lt!285498 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618944 () Bool)

(declare-fun res!398784 () Bool)

(assert (=> b!618944 (=> (not res!398784) (not e!354945))))

(assert (=> b!618944 (= res!398784 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18029 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618945 () Bool)

(assert (=> b!618945 (= e!354955 e!354946)))

(declare-fun res!398777 () Bool)

(assert (=> b!618945 (=> (not res!398777) (not e!354946))))

(assert (=> b!618945 (= res!398777 (and (= lt!285507 (Found!6469 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18029 a!2986) index!984) (select (arr!18029 a!2986) j!136))) (not (= (select (arr!18029 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!618945 (= lt!285507 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18029 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618946 () Bool)

(declare-fun res!398782 () Bool)

(assert (=> b!618946 (=> (not res!398782) (not e!354953))))

(assert (=> b!618946 (= res!398782 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618947 () Bool)

(declare-fun Unit!20427 () Unit!20418)

(assert (=> b!618947 (= e!354956 Unit!20427)))

(assert (= (and start!56096 res!398787) b!618941))

(assert (= (and b!618941 res!398776) b!618931))

(assert (= (and b!618931 res!398780) b!618928))

(assert (= (and b!618928 res!398774) b!618946))

(assert (= (and b!618946 res!398782) b!618940))

(assert (= (and b!618940 res!398789) b!618933))

(assert (= (and b!618933 res!398786) b!618924))

(assert (= (and b!618924 res!398785) b!618944))

(assert (= (and b!618944 res!398784) b!618927))

(assert (= (and b!618927 res!398775) b!618945))

(assert (= (and b!618945 res!398777) b!618943))

(assert (= (and b!618943 res!398783) b!618929))

(assert (= (and b!618943 c!70445) b!618937))

(assert (= (and b!618943 (not c!70445)) b!618947))

(assert (= (and b!618943 c!70443) b!618938))

(assert (= (and b!618943 (not c!70443)) b!618925))

(assert (= (and b!618938 res!398779) b!618932))

(assert (= (and b!618932 (not res!398781)) b!618934))

(assert (= (and b!618934 res!398788) b!618942))

(assert (= (and b!618938 c!70444) b!618935))

(assert (= (and b!618938 (not c!70444)) b!618936))

(assert (= (and b!618938 c!70442) b!618939))

(assert (= (and b!618938 (not c!70442)) b!618930))

(assert (= (and b!618939 res!398773) b!618923))

(assert (= (and b!618943 (not res!398778)) b!618926))

(declare-fun m!594931 () Bool)

(assert (=> b!618923 m!594931))

(assert (=> b!618923 m!594931))

(declare-fun m!594933 () Bool)

(assert (=> b!618923 m!594933))

(declare-fun m!594935 () Bool)

(assert (=> b!618944 m!594935))

(declare-fun m!594937 () Bool)

(assert (=> b!618927 m!594937))

(declare-fun m!594939 () Bool)

(assert (=> b!618927 m!594939))

(assert (=> b!618942 m!594931))

(assert (=> b!618942 m!594931))

(assert (=> b!618942 m!594933))

(assert (=> b!618926 m!594937))

(declare-fun m!594941 () Bool)

(assert (=> b!618926 m!594941))

(declare-fun m!594943 () Bool)

(assert (=> b!618935 m!594943))

(assert (=> b!618935 m!594931))

(declare-fun m!594945 () Bool)

(assert (=> b!618935 m!594945))

(assert (=> b!618935 m!594931))

(declare-fun m!594947 () Bool)

(assert (=> b!618935 m!594947))

(assert (=> b!618935 m!594931))

(declare-fun m!594949 () Bool)

(assert (=> b!618935 m!594949))

(declare-fun m!594951 () Bool)

(assert (=> b!618935 m!594951))

(assert (=> b!618935 m!594931))

(declare-fun m!594953 () Bool)

(assert (=> b!618935 m!594953))

(declare-fun m!594955 () Bool)

(assert (=> b!618935 m!594955))

(declare-fun m!594957 () Bool)

(assert (=> b!618945 m!594957))

(assert (=> b!618945 m!594931))

(assert (=> b!618945 m!594931))

(declare-fun m!594959 () Bool)

(assert (=> b!618945 m!594959))

(assert (=> b!618934 m!594931))

(assert (=> b!618934 m!594931))

(declare-fun m!594961 () Bool)

(assert (=> b!618934 m!594961))

(declare-fun m!594963 () Bool)

(assert (=> b!618924 m!594963))

(assert (=> b!618931 m!594931))

(assert (=> b!618931 m!594931))

(declare-fun m!594965 () Bool)

(assert (=> b!618931 m!594965))

(assert (=> b!618938 m!594937))

(assert (=> b!618938 m!594941))

(assert (=> b!618938 m!594931))

(declare-fun m!594967 () Bool)

(assert (=> b!618943 m!594967))

(declare-fun m!594969 () Bool)

(assert (=> b!618943 m!594969))

(declare-fun m!594971 () Bool)

(assert (=> b!618943 m!594971))

(assert (=> b!618943 m!594931))

(assert (=> b!618943 m!594937))

(declare-fun m!594973 () Bool)

(assert (=> b!618943 m!594973))

(assert (=> b!618943 m!594931))

(declare-fun m!594975 () Bool)

(assert (=> b!618943 m!594975))

(declare-fun m!594977 () Bool)

(assert (=> b!618943 m!594977))

(declare-fun m!594979 () Bool)

(assert (=> b!618933 m!594979))

(declare-fun m!594981 () Bool)

(assert (=> b!618928 m!594981))

(assert (=> b!618939 m!594931))

(declare-fun m!594983 () Bool)

(assert (=> b!618939 m!594983))

(declare-fun m!594985 () Bool)

(assert (=> b!618939 m!594985))

(assert (=> b!618939 m!594943))

(assert (=> b!618939 m!594931))

(assert (=> b!618939 m!594931))

(declare-fun m!594987 () Bool)

(assert (=> b!618939 m!594987))

(declare-fun m!594989 () Bool)

(assert (=> b!618939 m!594989))

(assert (=> b!618939 m!594931))

(declare-fun m!594991 () Bool)

(assert (=> b!618939 m!594991))

(assert (=> b!618939 m!594931))

(assert (=> b!618939 m!594961))

(assert (=> b!618939 m!594955))

(declare-fun m!594993 () Bool)

(assert (=> start!56096 m!594993))

(declare-fun m!594995 () Bool)

(assert (=> start!56096 m!594995))

(declare-fun m!594997 () Bool)

(assert (=> b!618946 m!594997))

(declare-fun m!594999 () Bool)

(assert (=> b!618940 m!594999))

(push 1)

