; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58120 () Bool)

(assert start!58120)

(declare-fun b!642107 () Bool)

(declare-fun e!367715 () Bool)

(declare-fun e!367719 () Bool)

(assert (=> b!642107 (= e!367715 e!367719)))

(declare-fun res!415862 () Bool)

(assert (=> b!642107 (=> (not res!415862) (not e!367719))))

(declare-datatypes ((SeekEntryResult!6846 0))(
  ( (MissingZero!6846 (index!29710 (_ BitVec 32))) (Found!6846 (index!29711 (_ BitVec 32))) (Intermediate!6846 (undefined!7658 Bool) (index!29712 (_ BitVec 32)) (x!58476 (_ BitVec 32))) (Undefined!6846) (MissingVacant!6846 (index!29713 (_ BitVec 32))) )
))
(declare-fun lt!297305 () SeekEntryResult!6846)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!642107 (= res!415862 (or (= lt!297305 (MissingZero!6846 i!1108)) (= lt!297305 (MissingVacant!6846 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38379 0))(
  ( (array!38380 (arr!18406 (Array (_ BitVec 32) (_ BitVec 64))) (size!18770 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38379)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38379 (_ BitVec 32)) SeekEntryResult!6846)

(assert (=> b!642107 (= lt!297305 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!642108 () Bool)

(declare-fun e!367723 () Bool)

(declare-fun e!367725 () Bool)

(assert (=> b!642108 (= e!367723 e!367725)))

(declare-fun res!415863 () Bool)

(assert (=> b!642108 (=> (not res!415863) (not e!367725))))

(declare-fun lt!297300 () SeekEntryResult!6846)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!642108 (= res!415863 (and (= lt!297300 (Found!6846 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18406 a!2986) index!984) (select (arr!18406 a!2986) j!136))) (not (= (select (arr!18406 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38379 (_ BitVec 32)) SeekEntryResult!6846)

(assert (=> b!642108 (= lt!297300 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18406 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642109 () Bool)

(declare-fun e!367720 () Bool)

(declare-fun e!367717 () Bool)

(assert (=> b!642109 (= e!367720 e!367717)))

(declare-fun res!415873 () Bool)

(assert (=> b!642109 (=> res!415873 e!367717)))

(declare-fun lt!297303 () (_ BitVec 64))

(declare-fun lt!297310 () (_ BitVec 64))

(assert (=> b!642109 (= res!415873 (or (not (= (select (arr!18406 a!2986) j!136) lt!297310)) (not (= (select (arr!18406 a!2986) j!136) lt!297303)) (bvsge j!136 index!984)))))

(declare-fun b!642110 () Bool)

(declare-fun lt!297306 () array!38379)

(declare-fun e!367716 () Bool)

(declare-fun arrayContainsKey!0 (array!38379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642110 (= e!367716 (arrayContainsKey!0 lt!297306 (select (arr!18406 a!2986) j!136) index!984))))

(declare-fun b!642111 () Bool)

(declare-fun e!367722 () Bool)

(declare-fun e!367718 () Bool)

(assert (=> b!642111 (= e!367722 e!367718)))

(declare-fun res!415864 () Bool)

(assert (=> b!642111 (=> res!415864 e!367718)))

(assert (=> b!642111 (= res!415864 (or (not (= (select (arr!18406 a!2986) j!136) lt!297310)) (not (= (select (arr!18406 a!2986) j!136) lt!297303)) (bvsge j!136 index!984)))))

(assert (=> b!642111 e!367720))

(declare-fun res!415870 () Bool)

(assert (=> b!642111 (=> (not res!415870) (not e!367720))))

(assert (=> b!642111 (= res!415870 (= lt!297303 (select (arr!18406 a!2986) j!136)))))

(assert (=> b!642111 (= lt!297303 (select (store (arr!18406 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!642112 () Bool)

(declare-fun res!415869 () Bool)

(assert (=> b!642112 (=> (not res!415869) (not e!367719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38379 (_ BitVec 32)) Bool)

(assert (=> b!642112 (= res!415869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!415856 () Bool)

(assert (=> start!58120 (=> (not res!415856) (not e!367715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58120 (= res!415856 (validMask!0 mask!3053))))

(assert (=> start!58120 e!367715))

(assert (=> start!58120 true))

(declare-fun array_inv!14202 (array!38379) Bool)

(assert (=> start!58120 (array_inv!14202 a!2986)))

(declare-fun b!642113 () Bool)

(declare-fun e!367714 () Bool)

(assert (=> b!642113 (= e!367718 e!367714)))

(declare-fun res!415867 () Bool)

(assert (=> b!642113 (=> res!415867 e!367714)))

(assert (=> b!642113 (= res!415867 (or (bvsge (size!18770 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18770 a!2986))))))

(declare-datatypes ((List!12447 0))(
  ( (Nil!12444) (Cons!12443 (h!13488 (_ BitVec 64)) (t!18675 List!12447)) )
))
(declare-fun arrayNoDuplicates!0 (array!38379 (_ BitVec 32) List!12447) Bool)

(assert (=> b!642113 (arrayNoDuplicates!0 lt!297306 j!136 Nil!12444)))

(declare-datatypes ((Unit!21718 0))(
  ( (Unit!21719) )
))
(declare-fun lt!297309 () Unit!21718)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38379 (_ BitVec 32) (_ BitVec 32)) Unit!21718)

(assert (=> b!642113 (= lt!297309 (lemmaNoDuplicateFromThenFromBigger!0 lt!297306 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642113 (arrayNoDuplicates!0 lt!297306 #b00000000000000000000000000000000 Nil!12444)))

(declare-fun lt!297308 () Unit!21718)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38379 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12447) Unit!21718)

(assert (=> b!642113 (= lt!297308 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12444))))

(assert (=> b!642113 (arrayContainsKey!0 lt!297306 (select (arr!18406 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297301 () Unit!21718)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38379 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21718)

(assert (=> b!642113 (= lt!297301 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297306 (select (arr!18406 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!642114 () Bool)

(declare-fun res!415865 () Bool)

(assert (=> b!642114 (=> (not res!415865) (not e!367715))))

(assert (=> b!642114 (= res!415865 (and (= (size!18770 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18770 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18770 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642115 () Bool)

(assert (=> b!642115 (= e!367717 e!367716)))

(declare-fun res!415874 () Bool)

(assert (=> b!642115 (=> (not res!415874) (not e!367716))))

(assert (=> b!642115 (= res!415874 (arrayContainsKey!0 lt!297306 (select (arr!18406 a!2986) j!136) j!136))))

(declare-fun b!642116 () Bool)

(declare-fun e!367724 () Unit!21718)

(declare-fun Unit!21720 () Unit!21718)

(assert (=> b!642116 (= e!367724 Unit!21720)))

(assert (=> b!642116 false))

(declare-fun b!642117 () Bool)

(declare-fun res!415866 () Bool)

(assert (=> b!642117 (=> (not res!415866) (not e!367719))))

(assert (=> b!642117 (= res!415866 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18406 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642118 () Bool)

(declare-fun res!415857 () Bool)

(assert (=> b!642118 (=> res!415857 e!367714)))

(declare-fun noDuplicate!406 (List!12447) Bool)

(assert (=> b!642118 (= res!415857 (not (noDuplicate!406 Nil!12444)))))

(declare-fun b!642119 () Bool)

(assert (=> b!642119 (= e!367719 e!367723)))

(declare-fun res!415859 () Bool)

(assert (=> b!642119 (=> (not res!415859) (not e!367723))))

(assert (=> b!642119 (= res!415859 (= (select (store (arr!18406 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642119 (= lt!297306 (array!38380 (store (arr!18406 a!2986) i!1108 k0!1786) (size!18770 a!2986)))))

(declare-fun b!642120 () Bool)

(declare-fun res!415860 () Bool)

(assert (=> b!642120 (=> res!415860 e!367714)))

(declare-fun contains!3134 (List!12447 (_ BitVec 64)) Bool)

(assert (=> b!642120 (= res!415860 (contains!3134 Nil!12444 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642121 () Bool)

(declare-fun res!415858 () Bool)

(assert (=> b!642121 (=> (not res!415858) (not e!367715))))

(assert (=> b!642121 (= res!415858 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642122 () Bool)

(declare-fun res!415872 () Bool)

(assert (=> b!642122 (=> (not res!415872) (not e!367715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642122 (= res!415872 (validKeyInArray!0 (select (arr!18406 a!2986) j!136)))))

(declare-fun b!642123 () Bool)

(assert (=> b!642123 (= e!367714 true)))

(declare-fun lt!297298 () Bool)

(assert (=> b!642123 (= lt!297298 (contains!3134 Nil!12444 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642124 () Bool)

(declare-fun Unit!21721 () Unit!21718)

(assert (=> b!642124 (= e!367724 Unit!21721)))

(declare-fun b!642125 () Bool)

(assert (=> b!642125 (= e!367725 (not e!367722))))

(declare-fun res!415855 () Bool)

(assert (=> b!642125 (=> res!415855 e!367722)))

(declare-fun lt!297297 () SeekEntryResult!6846)

(assert (=> b!642125 (= res!415855 (not (= lt!297297 (Found!6846 index!984))))))

(declare-fun lt!297299 () Unit!21718)

(assert (=> b!642125 (= lt!297299 e!367724)))

(declare-fun c!73493 () Bool)

(assert (=> b!642125 (= c!73493 (= lt!297297 Undefined!6846))))

(assert (=> b!642125 (= lt!297297 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297310 lt!297306 mask!3053))))

(declare-fun e!367713 () Bool)

(assert (=> b!642125 e!367713))

(declare-fun res!415861 () Bool)

(assert (=> b!642125 (=> (not res!415861) (not e!367713))))

(declare-fun lt!297307 () (_ BitVec 32))

(declare-fun lt!297304 () SeekEntryResult!6846)

(assert (=> b!642125 (= res!415861 (= lt!297304 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297307 vacantSpotIndex!68 lt!297310 lt!297306 mask!3053)))))

(assert (=> b!642125 (= lt!297304 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297307 vacantSpotIndex!68 (select (arr!18406 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642125 (= lt!297310 (select (store (arr!18406 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297302 () Unit!21718)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38379 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21718)

(assert (=> b!642125 (= lt!297302 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297307 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642125 (= lt!297307 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642126 () Bool)

(declare-fun res!415871 () Bool)

(assert (=> b!642126 (=> (not res!415871) (not e!367715))))

(assert (=> b!642126 (= res!415871 (validKeyInArray!0 k0!1786))))

(declare-fun b!642127 () Bool)

(assert (=> b!642127 (= e!367713 (= lt!297300 lt!297304))))

(declare-fun b!642128 () Bool)

(declare-fun res!415868 () Bool)

(assert (=> b!642128 (=> (not res!415868) (not e!367719))))

(assert (=> b!642128 (= res!415868 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12444))))

(assert (= (and start!58120 res!415856) b!642114))

(assert (= (and b!642114 res!415865) b!642122))

(assert (= (and b!642122 res!415872) b!642126))

(assert (= (and b!642126 res!415871) b!642121))

(assert (= (and b!642121 res!415858) b!642107))

(assert (= (and b!642107 res!415862) b!642112))

(assert (= (and b!642112 res!415869) b!642128))

(assert (= (and b!642128 res!415868) b!642117))

(assert (= (and b!642117 res!415866) b!642119))

(assert (= (and b!642119 res!415859) b!642108))

(assert (= (and b!642108 res!415863) b!642125))

(assert (= (and b!642125 res!415861) b!642127))

(assert (= (and b!642125 c!73493) b!642116))

(assert (= (and b!642125 (not c!73493)) b!642124))

(assert (= (and b!642125 (not res!415855)) b!642111))

(assert (= (and b!642111 res!415870) b!642109))

(assert (= (and b!642109 (not res!415873)) b!642115))

(assert (= (and b!642115 res!415874) b!642110))

(assert (= (and b!642111 (not res!415864)) b!642113))

(assert (= (and b!642113 (not res!415867)) b!642118))

(assert (= (and b!642118 (not res!415857)) b!642120))

(assert (= (and b!642120 (not res!415860)) b!642123))

(declare-fun m!615885 () Bool)

(assert (=> b!642111 m!615885))

(declare-fun m!615887 () Bool)

(assert (=> b!642111 m!615887))

(declare-fun m!615889 () Bool)

(assert (=> b!642111 m!615889))

(assert (=> b!642113 m!615885))

(declare-fun m!615891 () Bool)

(assert (=> b!642113 m!615891))

(assert (=> b!642113 m!615885))

(declare-fun m!615893 () Bool)

(assert (=> b!642113 m!615893))

(assert (=> b!642113 m!615885))

(declare-fun m!615895 () Bool)

(assert (=> b!642113 m!615895))

(declare-fun m!615897 () Bool)

(assert (=> b!642113 m!615897))

(declare-fun m!615899 () Bool)

(assert (=> b!642113 m!615899))

(declare-fun m!615901 () Bool)

(assert (=> b!642113 m!615901))

(declare-fun m!615903 () Bool)

(assert (=> b!642128 m!615903))

(declare-fun m!615905 () Bool)

(assert (=> b!642121 m!615905))

(assert (=> b!642109 m!615885))

(assert (=> b!642110 m!615885))

(assert (=> b!642110 m!615885))

(declare-fun m!615907 () Bool)

(assert (=> b!642110 m!615907))

(assert (=> b!642119 m!615887))

(declare-fun m!615909 () Bool)

(assert (=> b!642119 m!615909))

(declare-fun m!615911 () Bool)

(assert (=> b!642112 m!615911))

(declare-fun m!615913 () Bool)

(assert (=> b!642117 m!615913))

(assert (=> b!642122 m!615885))

(assert (=> b!642122 m!615885))

(declare-fun m!615915 () Bool)

(assert (=> b!642122 m!615915))

(declare-fun m!615917 () Bool)

(assert (=> b!642107 m!615917))

(declare-fun m!615919 () Bool)

(assert (=> b!642126 m!615919))

(declare-fun m!615921 () Bool)

(assert (=> start!58120 m!615921))

(declare-fun m!615923 () Bool)

(assert (=> start!58120 m!615923))

(declare-fun m!615925 () Bool)

(assert (=> b!642123 m!615925))

(assert (=> b!642115 m!615885))

(assert (=> b!642115 m!615885))

(declare-fun m!615927 () Bool)

(assert (=> b!642115 m!615927))

(declare-fun m!615929 () Bool)

(assert (=> b!642108 m!615929))

(assert (=> b!642108 m!615885))

(assert (=> b!642108 m!615885))

(declare-fun m!615931 () Bool)

(assert (=> b!642108 m!615931))

(declare-fun m!615933 () Bool)

(assert (=> b!642125 m!615933))

(assert (=> b!642125 m!615885))

(assert (=> b!642125 m!615887))

(declare-fun m!615935 () Bool)

(assert (=> b!642125 m!615935))

(assert (=> b!642125 m!615885))

(declare-fun m!615937 () Bool)

(assert (=> b!642125 m!615937))

(declare-fun m!615939 () Bool)

(assert (=> b!642125 m!615939))

(declare-fun m!615941 () Bool)

(assert (=> b!642125 m!615941))

(declare-fun m!615943 () Bool)

(assert (=> b!642125 m!615943))

(declare-fun m!615945 () Bool)

(assert (=> b!642118 m!615945))

(declare-fun m!615947 () Bool)

(assert (=> b!642120 m!615947))

(check-sat (not start!58120) (not b!642122) (not b!642125) (not b!642123) (not b!642107) (not b!642126) (not b!642108) (not b!642128) (not b!642113) (not b!642115) (not b!642120) (not b!642110) (not b!642112) (not b!642121) (not b!642118))
(check-sat)
