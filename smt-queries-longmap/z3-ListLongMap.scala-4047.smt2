; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55206 () Bool)

(assert start!55206)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37224 0))(
  ( (array!37225 (arr!17866 (Array (_ BitVec 32) (_ BitVec 64))) (size!18230 (_ BitVec 32))) )
))
(declare-fun lt!275874 () array!37224)

(declare-fun e!346084 () Bool)

(declare-fun b!604791 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37224)

(declare-fun arrayContainsKey!0 (array!37224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604791 (= e!346084 (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) index!984))))

(declare-fun b!604792 () Bool)

(declare-datatypes ((Unit!19225 0))(
  ( (Unit!19226) )
))
(declare-fun e!346083 () Unit!19225)

(declare-fun Unit!19227 () Unit!19225)

(assert (=> b!604792 (= e!346083 Unit!19227)))

(declare-fun b!604794 () Bool)

(declare-fun res!388591 () Bool)

(declare-fun e!346079 () Bool)

(assert (=> b!604794 (=> (not res!388591) (not e!346079))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!604794 (= res!388591 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604795 () Bool)

(declare-fun e!346077 () Bool)

(assert (=> b!604795 (= e!346079 e!346077)))

(declare-fun res!388600 () Bool)

(assert (=> b!604795 (=> (not res!388600) (not e!346077))))

(declare-datatypes ((SeekEntryResult!6262 0))(
  ( (MissingZero!6262 (index!27311 (_ BitVec 32))) (Found!6262 (index!27312 (_ BitVec 32))) (Intermediate!6262 (undefined!7074 Bool) (index!27313 (_ BitVec 32)) (x!56258 (_ BitVec 32))) (Undefined!6262) (MissingVacant!6262 (index!27314 (_ BitVec 32))) )
))
(declare-fun lt!275861 () SeekEntryResult!6262)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!604795 (= res!388600 (or (= lt!275861 (MissingZero!6262 i!1108)) (= lt!275861 (MissingVacant!6262 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37224 (_ BitVec 32)) SeekEntryResult!6262)

(assert (=> b!604795 (= lt!275861 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!604796 () Bool)

(declare-fun e!346082 () Bool)

(assert (=> b!604796 (= e!346077 e!346082)))

(declare-fun res!388594 () Bool)

(assert (=> b!604796 (=> (not res!388594) (not e!346082))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!604796 (= res!388594 (= (select (store (arr!17866 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604796 (= lt!275874 (array!37225 (store (arr!17866 a!2986) i!1108 k0!1786) (size!18230 a!2986)))))

(declare-fun b!604797 () Bool)

(declare-fun res!388582 () Bool)

(assert (=> b!604797 (=> (not res!388582) (not e!346079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604797 (= res!388582 (validKeyInArray!0 (select (arr!17866 a!2986) j!136)))))

(declare-fun b!604798 () Bool)

(declare-fun e!346087 () Unit!19225)

(declare-fun Unit!19228 () Unit!19225)

(assert (=> b!604798 (= e!346087 Unit!19228)))

(declare-fun b!604799 () Bool)

(declare-fun res!388588 () Bool)

(assert (=> b!604799 (=> (not res!388588) (not e!346077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37224 (_ BitVec 32)) Bool)

(assert (=> b!604799 (= res!388588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604800 () Bool)

(declare-fun e!346088 () Bool)

(declare-fun lt!275872 () SeekEntryResult!6262)

(declare-fun lt!275866 () SeekEntryResult!6262)

(assert (=> b!604800 (= e!346088 (= lt!275872 lt!275866))))

(declare-fun b!604801 () Bool)

(declare-fun e!346086 () Bool)

(declare-fun e!346081 () Bool)

(assert (=> b!604801 (= e!346086 e!346081)))

(declare-fun res!388587 () Bool)

(assert (=> b!604801 (=> res!388587 e!346081)))

(declare-fun lt!275865 () (_ BitVec 64))

(declare-fun lt!275860 () (_ BitVec 64))

(assert (=> b!604801 (= res!388587 (or (not (= (select (arr!17866 a!2986) j!136) lt!275865)) (not (= (select (arr!17866 a!2986) j!136) lt!275860))))))

(declare-fun e!346089 () Bool)

(assert (=> b!604801 e!346089))

(declare-fun res!388584 () Bool)

(assert (=> b!604801 (=> (not res!388584) (not e!346089))))

(assert (=> b!604801 (= res!388584 (= lt!275860 (select (arr!17866 a!2986) j!136)))))

(assert (=> b!604801 (= lt!275860 (select (store (arr!17866 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!604802 () Bool)

(declare-fun res!388595 () Bool)

(assert (=> b!604802 (=> (not res!388595) (not e!346077))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!604802 (= res!388595 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17866 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604803 () Bool)

(declare-fun Unit!19229 () Unit!19225)

(assert (=> b!604803 (= e!346087 Unit!19229)))

(declare-fun lt!275864 () Unit!19225)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37224 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19225)

(assert (=> b!604803 (= lt!275864 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275874 (select (arr!17866 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!604803 (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275863 () Unit!19225)

(declare-datatypes ((List!11814 0))(
  ( (Nil!11811) (Cons!11810 (h!12858 (_ BitVec 64)) (t!18034 List!11814)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37224 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11814) Unit!19225)

(assert (=> b!604803 (= lt!275863 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11811))))

(declare-fun arrayNoDuplicates!0 (array!37224 (_ BitVec 32) List!11814) Bool)

(assert (=> b!604803 (arrayNoDuplicates!0 lt!275874 #b00000000000000000000000000000000 Nil!11811)))

(declare-fun lt!275871 () Unit!19225)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37224 (_ BitVec 32) (_ BitVec 32)) Unit!19225)

(assert (=> b!604803 (= lt!275871 (lemmaNoDuplicateFromThenFromBigger!0 lt!275874 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604803 (arrayNoDuplicates!0 lt!275874 j!136 Nil!11811)))

(declare-fun lt!275869 () Unit!19225)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37224 (_ BitVec 64) (_ BitVec 32) List!11814) Unit!19225)

(assert (=> b!604803 (= lt!275869 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275874 (select (arr!17866 a!2986) j!136) j!136 Nil!11811))))

(assert (=> b!604803 false))

(declare-fun b!604804 () Bool)

(declare-fun res!388583 () Bool)

(assert (=> b!604804 (=> (not res!388583) (not e!346079))))

(assert (=> b!604804 (= res!388583 (and (= (size!18230 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18230 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18230 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604805 () Bool)

(declare-fun Unit!19230 () Unit!19225)

(assert (=> b!604805 (= e!346083 Unit!19230)))

(assert (=> b!604805 false))

(declare-fun b!604806 () Bool)

(declare-fun e!346076 () Bool)

(assert (=> b!604806 (= e!346076 e!346084)))

(declare-fun res!388592 () Bool)

(assert (=> b!604806 (=> (not res!388592) (not e!346084))))

(assert (=> b!604806 (= res!388592 (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) j!136))))

(declare-fun b!604807 () Bool)

(declare-fun e!346078 () Bool)

(assert (=> b!604807 (= e!346078 (not e!346086))))

(declare-fun res!388599 () Bool)

(assert (=> b!604807 (=> res!388599 e!346086)))

(declare-fun lt!275862 () SeekEntryResult!6262)

(assert (=> b!604807 (= res!388599 (not (= lt!275862 (Found!6262 index!984))))))

(declare-fun lt!275868 () Unit!19225)

(assert (=> b!604807 (= lt!275868 e!346083)))

(declare-fun c!68473 () Bool)

(assert (=> b!604807 (= c!68473 (= lt!275862 Undefined!6262))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37224 (_ BitVec 32)) SeekEntryResult!6262)

(assert (=> b!604807 (= lt!275862 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275865 lt!275874 mask!3053))))

(assert (=> b!604807 e!346088))

(declare-fun res!388585 () Bool)

(assert (=> b!604807 (=> (not res!388585) (not e!346088))))

(declare-fun lt!275875 () (_ BitVec 32))

(assert (=> b!604807 (= res!388585 (= lt!275866 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275875 vacantSpotIndex!68 lt!275865 lt!275874 mask!3053)))))

(assert (=> b!604807 (= lt!275866 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275875 vacantSpotIndex!68 (select (arr!17866 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604807 (= lt!275865 (select (store (arr!17866 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275873 () Unit!19225)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37224 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19225)

(assert (=> b!604807 (= lt!275873 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275875 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604807 (= lt!275875 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!604793 () Bool)

(declare-fun res!388598 () Bool)

(assert (=> b!604793 (=> (not res!388598) (not e!346077))))

(assert (=> b!604793 (= res!388598 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11811))))

(declare-fun res!388586 () Bool)

(assert (=> start!55206 (=> (not res!388586) (not e!346079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55206 (= res!388586 (validMask!0 mask!3053))))

(assert (=> start!55206 e!346079))

(assert (=> start!55206 true))

(declare-fun array_inv!13725 (array!37224) Bool)

(assert (=> start!55206 (array_inv!13725 a!2986)))

(declare-fun b!604808 () Bool)

(assert (=> b!604808 (= e!346082 e!346078)))

(declare-fun res!388596 () Bool)

(assert (=> b!604808 (=> (not res!388596) (not e!346078))))

(assert (=> b!604808 (= res!388596 (and (= lt!275872 (Found!6262 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17866 a!2986) index!984) (select (arr!17866 a!2986) j!136))) (not (= (select (arr!17866 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!604808 (= lt!275872 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17866 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604809 () Bool)

(assert (=> b!604809 (= e!346089 e!346076)))

(declare-fun res!388589 () Bool)

(assert (=> b!604809 (=> res!388589 e!346076)))

(assert (=> b!604809 (= res!388589 (or (not (= (select (arr!17866 a!2986) j!136) lt!275865)) (not (= (select (arr!17866 a!2986) j!136) lt!275860)) (bvsge j!136 index!984)))))

(declare-fun e!346080 () Bool)

(declare-fun b!604810 () Bool)

(assert (=> b!604810 (= e!346080 (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) index!984))))

(declare-fun b!604811 () Bool)

(declare-fun e!346085 () Bool)

(assert (=> b!604811 (= e!346081 e!346085)))

(declare-fun res!388590 () Bool)

(assert (=> b!604811 (=> res!388590 e!346085)))

(assert (=> b!604811 (= res!388590 (bvsge index!984 j!136))))

(declare-fun lt!275867 () Unit!19225)

(assert (=> b!604811 (= lt!275867 e!346087)))

(declare-fun c!68474 () Bool)

(assert (=> b!604811 (= c!68474 (bvslt j!136 index!984))))

(declare-fun b!604812 () Bool)

(declare-fun res!388593 () Bool)

(assert (=> b!604812 (=> (not res!388593) (not e!346079))))

(assert (=> b!604812 (= res!388593 (validKeyInArray!0 k0!1786))))

(declare-fun b!604813 () Bool)

(assert (=> b!604813 (= e!346085 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18230 a!2986)) (bvslt (size!18230 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!604813 (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275870 () Unit!19225)

(assert (=> b!604813 (= lt!275870 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275874 (select (arr!17866 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!604813 e!346080))

(declare-fun res!388597 () Bool)

(assert (=> b!604813 (=> (not res!388597) (not e!346080))))

(assert (=> b!604813 (= res!388597 (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) j!136))))

(assert (= (and start!55206 res!388586) b!604804))

(assert (= (and b!604804 res!388583) b!604797))

(assert (= (and b!604797 res!388582) b!604812))

(assert (= (and b!604812 res!388593) b!604794))

(assert (= (and b!604794 res!388591) b!604795))

(assert (= (and b!604795 res!388600) b!604799))

(assert (= (and b!604799 res!388588) b!604793))

(assert (= (and b!604793 res!388598) b!604802))

(assert (= (and b!604802 res!388595) b!604796))

(assert (= (and b!604796 res!388594) b!604808))

(assert (= (and b!604808 res!388596) b!604807))

(assert (= (and b!604807 res!388585) b!604800))

(assert (= (and b!604807 c!68473) b!604805))

(assert (= (and b!604807 (not c!68473)) b!604792))

(assert (= (and b!604807 (not res!388599)) b!604801))

(assert (= (and b!604801 res!388584) b!604809))

(assert (= (and b!604809 (not res!388589)) b!604806))

(assert (= (and b!604806 res!388592) b!604791))

(assert (= (and b!604801 (not res!388587)) b!604811))

(assert (= (and b!604811 c!68474) b!604803))

(assert (= (and b!604811 (not c!68474)) b!604798))

(assert (= (and b!604811 (not res!388590)) b!604813))

(assert (= (and b!604813 res!388597) b!604810))

(declare-fun m!581921 () Bool)

(assert (=> start!55206 m!581921))

(declare-fun m!581923 () Bool)

(assert (=> start!55206 m!581923))

(declare-fun m!581925 () Bool)

(assert (=> b!604801 m!581925))

(declare-fun m!581927 () Bool)

(assert (=> b!604801 m!581927))

(declare-fun m!581929 () Bool)

(assert (=> b!604801 m!581929))

(declare-fun m!581931 () Bool)

(assert (=> b!604807 m!581931))

(declare-fun m!581933 () Bool)

(assert (=> b!604807 m!581933))

(assert (=> b!604807 m!581925))

(declare-fun m!581935 () Bool)

(assert (=> b!604807 m!581935))

(declare-fun m!581937 () Bool)

(assert (=> b!604807 m!581937))

(declare-fun m!581939 () Bool)

(assert (=> b!604807 m!581939))

(assert (=> b!604807 m!581925))

(declare-fun m!581941 () Bool)

(assert (=> b!604807 m!581941))

(assert (=> b!604807 m!581927))

(assert (=> b!604809 m!581925))

(assert (=> b!604810 m!581925))

(assert (=> b!604810 m!581925))

(declare-fun m!581943 () Bool)

(assert (=> b!604810 m!581943))

(declare-fun m!581945 () Bool)

(assert (=> b!604793 m!581945))

(assert (=> b!604797 m!581925))

(assert (=> b!604797 m!581925))

(declare-fun m!581947 () Bool)

(assert (=> b!604797 m!581947))

(assert (=> b!604806 m!581925))

(assert (=> b!604806 m!581925))

(declare-fun m!581949 () Bool)

(assert (=> b!604806 m!581949))

(declare-fun m!581951 () Bool)

(assert (=> b!604802 m!581951))

(declare-fun m!581953 () Bool)

(assert (=> b!604794 m!581953))

(assert (=> b!604796 m!581927))

(declare-fun m!581955 () Bool)

(assert (=> b!604796 m!581955))

(assert (=> b!604803 m!581925))

(assert (=> b!604803 m!581925))

(declare-fun m!581957 () Bool)

(assert (=> b!604803 m!581957))

(assert (=> b!604803 m!581925))

(declare-fun m!581959 () Bool)

(assert (=> b!604803 m!581959))

(declare-fun m!581961 () Bool)

(assert (=> b!604803 m!581961))

(declare-fun m!581963 () Bool)

(assert (=> b!604803 m!581963))

(declare-fun m!581965 () Bool)

(assert (=> b!604803 m!581965))

(assert (=> b!604803 m!581925))

(declare-fun m!581967 () Bool)

(assert (=> b!604803 m!581967))

(declare-fun m!581969 () Bool)

(assert (=> b!604803 m!581969))

(declare-fun m!581971 () Bool)

(assert (=> b!604795 m!581971))

(declare-fun m!581973 () Bool)

(assert (=> b!604799 m!581973))

(assert (=> b!604813 m!581925))

(assert (=> b!604813 m!581925))

(declare-fun m!581975 () Bool)

(assert (=> b!604813 m!581975))

(assert (=> b!604813 m!581925))

(declare-fun m!581977 () Bool)

(assert (=> b!604813 m!581977))

(assert (=> b!604813 m!581925))

(assert (=> b!604813 m!581949))

(assert (=> b!604791 m!581925))

(assert (=> b!604791 m!581925))

(assert (=> b!604791 m!581943))

(declare-fun m!581979 () Bool)

(assert (=> b!604812 m!581979))

(declare-fun m!581981 () Bool)

(assert (=> b!604808 m!581981))

(assert (=> b!604808 m!581925))

(assert (=> b!604808 m!581925))

(declare-fun m!581983 () Bool)

(assert (=> b!604808 m!581983))

(check-sat (not start!55206) (not b!604799) (not b!604813) (not b!604807) (not b!604806) (not b!604797) (not b!604793) (not b!604810) (not b!604808) (not b!604795) (not b!604812) (not b!604803) (not b!604794) (not b!604791))
(check-sat)
(get-model)

(declare-fun b!604965 () Bool)

(declare-fun e!346186 () SeekEntryResult!6262)

(declare-fun lt!275980 () SeekEntryResult!6262)

(assert (=> b!604965 (= e!346186 (Found!6262 (index!27313 lt!275980)))))

(declare-fun b!604966 () Bool)

(declare-fun e!346188 () SeekEntryResult!6262)

(assert (=> b!604966 (= e!346188 e!346186)))

(declare-fun lt!275978 () (_ BitVec 64))

(assert (=> b!604966 (= lt!275978 (select (arr!17866 a!2986) (index!27313 lt!275980)))))

(declare-fun c!68495 () Bool)

(assert (=> b!604966 (= c!68495 (= lt!275978 k0!1786))))

(declare-fun e!346187 () SeekEntryResult!6262)

(declare-fun b!604967 () Bool)

(assert (=> b!604967 (= e!346187 (seekKeyOrZeroReturnVacant!0 (x!56258 lt!275980) (index!27313 lt!275980) (index!27313 lt!275980) k0!1786 a!2986 mask!3053))))

(declare-fun b!604968 () Bool)

(declare-fun c!68494 () Bool)

(assert (=> b!604968 (= c!68494 (= lt!275978 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604968 (= e!346186 e!346187)))

(declare-fun b!604969 () Bool)

(assert (=> b!604969 (= e!346188 Undefined!6262)))

(declare-fun d!87549 () Bool)

(declare-fun lt!275979 () SeekEntryResult!6262)

(get-info :version)

(assert (=> d!87549 (and (or ((_ is Undefined!6262) lt!275979) (not ((_ is Found!6262) lt!275979)) (and (bvsge (index!27312 lt!275979) #b00000000000000000000000000000000) (bvslt (index!27312 lt!275979) (size!18230 a!2986)))) (or ((_ is Undefined!6262) lt!275979) ((_ is Found!6262) lt!275979) (not ((_ is MissingZero!6262) lt!275979)) (and (bvsge (index!27311 lt!275979) #b00000000000000000000000000000000) (bvslt (index!27311 lt!275979) (size!18230 a!2986)))) (or ((_ is Undefined!6262) lt!275979) ((_ is Found!6262) lt!275979) ((_ is MissingZero!6262) lt!275979) (not ((_ is MissingVacant!6262) lt!275979)) (and (bvsge (index!27314 lt!275979) #b00000000000000000000000000000000) (bvslt (index!27314 lt!275979) (size!18230 a!2986)))) (or ((_ is Undefined!6262) lt!275979) (ite ((_ is Found!6262) lt!275979) (= (select (arr!17866 a!2986) (index!27312 lt!275979)) k0!1786) (ite ((_ is MissingZero!6262) lt!275979) (= (select (arr!17866 a!2986) (index!27311 lt!275979)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6262) lt!275979) (= (select (arr!17866 a!2986) (index!27314 lt!275979)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87549 (= lt!275979 e!346188)))

(declare-fun c!68493 () Bool)

(assert (=> d!87549 (= c!68493 (and ((_ is Intermediate!6262) lt!275980) (undefined!7074 lt!275980)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37224 (_ BitVec 32)) SeekEntryResult!6262)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87549 (= lt!275980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87549 (validMask!0 mask!3053)))

(assert (=> d!87549 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!275979)))

(declare-fun b!604964 () Bool)

(assert (=> b!604964 (= e!346187 (MissingZero!6262 (index!27313 lt!275980)))))

(assert (= (and d!87549 c!68493) b!604969))

(assert (= (and d!87549 (not c!68493)) b!604966))

(assert (= (and b!604966 c!68495) b!604965))

(assert (= (and b!604966 (not c!68495)) b!604968))

(assert (= (and b!604968 c!68494) b!604964))

(assert (= (and b!604968 (not c!68494)) b!604967))

(declare-fun m!582113 () Bool)

(assert (=> b!604966 m!582113))

(declare-fun m!582115 () Bool)

(assert (=> b!604967 m!582115))

(declare-fun m!582117 () Bool)

(assert (=> d!87549 m!582117))

(declare-fun m!582119 () Bool)

(assert (=> d!87549 m!582119))

(declare-fun m!582121 () Bool)

(assert (=> d!87549 m!582121))

(declare-fun m!582123 () Bool)

(assert (=> d!87549 m!582123))

(declare-fun m!582125 () Bool)

(assert (=> d!87549 m!582125))

(assert (=> d!87549 m!582119))

(assert (=> d!87549 m!581921))

(assert (=> b!604795 d!87549))

(declare-fun d!87551 () Bool)

(declare-fun res!388719 () Bool)

(declare-fun e!346193 () Bool)

(assert (=> d!87551 (=> res!388719 e!346193)))

(assert (=> d!87551 (= res!388719 (= (select (arr!17866 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87551 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!346193)))

(declare-fun b!604974 () Bool)

(declare-fun e!346194 () Bool)

(assert (=> b!604974 (= e!346193 e!346194)))

(declare-fun res!388720 () Bool)

(assert (=> b!604974 (=> (not res!388720) (not e!346194))))

(assert (=> b!604974 (= res!388720 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18230 a!2986)))))

(declare-fun b!604975 () Bool)

(assert (=> b!604975 (= e!346194 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87551 (not res!388719)) b!604974))

(assert (= (and b!604974 res!388720) b!604975))

(declare-fun m!582127 () Bool)

(assert (=> d!87551 m!582127))

(declare-fun m!582129 () Bool)

(assert (=> b!604975 m!582129))

(assert (=> b!604794 d!87551))

(declare-fun lt!275986 () SeekEntryResult!6262)

(declare-fun d!87553 () Bool)

(assert (=> d!87553 (and (or ((_ is Undefined!6262) lt!275986) (not ((_ is Found!6262) lt!275986)) (and (bvsge (index!27312 lt!275986) #b00000000000000000000000000000000) (bvslt (index!27312 lt!275986) (size!18230 lt!275874)))) (or ((_ is Undefined!6262) lt!275986) ((_ is Found!6262) lt!275986) (not ((_ is MissingVacant!6262) lt!275986)) (not (= (index!27314 lt!275986) vacantSpotIndex!68)) (and (bvsge (index!27314 lt!275986) #b00000000000000000000000000000000) (bvslt (index!27314 lt!275986) (size!18230 lt!275874)))) (or ((_ is Undefined!6262) lt!275986) (ite ((_ is Found!6262) lt!275986) (= (select (arr!17866 lt!275874) (index!27312 lt!275986)) lt!275865) (and ((_ is MissingVacant!6262) lt!275986) (= (index!27314 lt!275986) vacantSpotIndex!68) (= (select (arr!17866 lt!275874) (index!27314 lt!275986)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!346202 () SeekEntryResult!6262)

(assert (=> d!87553 (= lt!275986 e!346202)))

(declare-fun c!68503 () Bool)

(assert (=> d!87553 (= c!68503 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!275985 () (_ BitVec 64))

(assert (=> d!87553 (= lt!275985 (select (arr!17866 lt!275874) lt!275875))))

(assert (=> d!87553 (validMask!0 mask!3053)))

(assert (=> d!87553 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275875 vacantSpotIndex!68 lt!275865 lt!275874 mask!3053) lt!275986)))

(declare-fun b!604988 () Bool)

(declare-fun c!68504 () Bool)

(assert (=> b!604988 (= c!68504 (= lt!275985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346203 () SeekEntryResult!6262)

(declare-fun e!346201 () SeekEntryResult!6262)

(assert (=> b!604988 (= e!346203 e!346201)))

(declare-fun b!604989 () Bool)

(assert (=> b!604989 (= e!346202 e!346203)))

(declare-fun c!68502 () Bool)

(assert (=> b!604989 (= c!68502 (= lt!275985 lt!275865))))

(declare-fun b!604990 () Bool)

(assert (=> b!604990 (= e!346202 Undefined!6262)))

(declare-fun b!604991 () Bool)

(assert (=> b!604991 (= e!346203 (Found!6262 lt!275875))))

(declare-fun b!604992 () Bool)

(assert (=> b!604992 (= e!346201 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!275875 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!275865 lt!275874 mask!3053))))

(declare-fun b!604993 () Bool)

(assert (=> b!604993 (= e!346201 (MissingVacant!6262 vacantSpotIndex!68))))

(assert (= (and d!87553 c!68503) b!604990))

(assert (= (and d!87553 (not c!68503)) b!604989))

(assert (= (and b!604989 c!68502) b!604991))

(assert (= (and b!604989 (not c!68502)) b!604988))

(assert (= (and b!604988 c!68504) b!604993))

(assert (= (and b!604988 (not c!68504)) b!604992))

(declare-fun m!582131 () Bool)

(assert (=> d!87553 m!582131))

(declare-fun m!582133 () Bool)

(assert (=> d!87553 m!582133))

(declare-fun m!582135 () Bool)

(assert (=> d!87553 m!582135))

(assert (=> d!87553 m!581921))

(declare-fun m!582137 () Bool)

(assert (=> b!604992 m!582137))

(assert (=> b!604992 m!582137))

(declare-fun m!582139 () Bool)

(assert (=> b!604992 m!582139))

(assert (=> b!604807 d!87553))

(declare-fun d!87555 () Bool)

(declare-fun lt!275988 () SeekEntryResult!6262)

(assert (=> d!87555 (and (or ((_ is Undefined!6262) lt!275988) (not ((_ is Found!6262) lt!275988)) (and (bvsge (index!27312 lt!275988) #b00000000000000000000000000000000) (bvslt (index!27312 lt!275988) (size!18230 a!2986)))) (or ((_ is Undefined!6262) lt!275988) ((_ is Found!6262) lt!275988) (not ((_ is MissingVacant!6262) lt!275988)) (not (= (index!27314 lt!275988) vacantSpotIndex!68)) (and (bvsge (index!27314 lt!275988) #b00000000000000000000000000000000) (bvslt (index!27314 lt!275988) (size!18230 a!2986)))) (or ((_ is Undefined!6262) lt!275988) (ite ((_ is Found!6262) lt!275988) (= (select (arr!17866 a!2986) (index!27312 lt!275988)) (select (arr!17866 a!2986) j!136)) (and ((_ is MissingVacant!6262) lt!275988) (= (index!27314 lt!275988) vacantSpotIndex!68) (= (select (arr!17866 a!2986) (index!27314 lt!275988)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!346205 () SeekEntryResult!6262)

(assert (=> d!87555 (= lt!275988 e!346205)))

(declare-fun c!68506 () Bool)

(assert (=> d!87555 (= c!68506 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!275987 () (_ BitVec 64))

(assert (=> d!87555 (= lt!275987 (select (arr!17866 a!2986) lt!275875))))

(assert (=> d!87555 (validMask!0 mask!3053)))

(assert (=> d!87555 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275875 vacantSpotIndex!68 (select (arr!17866 a!2986) j!136) a!2986 mask!3053) lt!275988)))

(declare-fun b!604994 () Bool)

(declare-fun c!68507 () Bool)

(assert (=> b!604994 (= c!68507 (= lt!275987 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346206 () SeekEntryResult!6262)

(declare-fun e!346204 () SeekEntryResult!6262)

(assert (=> b!604994 (= e!346206 e!346204)))

(declare-fun b!604995 () Bool)

(assert (=> b!604995 (= e!346205 e!346206)))

(declare-fun c!68505 () Bool)

(assert (=> b!604995 (= c!68505 (= lt!275987 (select (arr!17866 a!2986) j!136)))))

(declare-fun b!604996 () Bool)

(assert (=> b!604996 (= e!346205 Undefined!6262)))

(declare-fun b!604997 () Bool)

(assert (=> b!604997 (= e!346206 (Found!6262 lt!275875))))

(declare-fun b!604998 () Bool)

(assert (=> b!604998 (= e!346204 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!275875 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17866 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604999 () Bool)

(assert (=> b!604999 (= e!346204 (MissingVacant!6262 vacantSpotIndex!68))))

(assert (= (and d!87555 c!68506) b!604996))

(assert (= (and d!87555 (not c!68506)) b!604995))

(assert (= (and b!604995 c!68505) b!604997))

(assert (= (and b!604995 (not c!68505)) b!604994))

(assert (= (and b!604994 c!68507) b!604999))

(assert (= (and b!604994 (not c!68507)) b!604998))

(declare-fun m!582141 () Bool)

(assert (=> d!87555 m!582141))

(declare-fun m!582143 () Bool)

(assert (=> d!87555 m!582143))

(declare-fun m!582145 () Bool)

(assert (=> d!87555 m!582145))

(assert (=> d!87555 m!581921))

(assert (=> b!604998 m!582137))

(assert (=> b!604998 m!582137))

(assert (=> b!604998 m!581925))

(declare-fun m!582147 () Bool)

(assert (=> b!604998 m!582147))

(assert (=> b!604807 d!87555))

(declare-fun lt!275990 () SeekEntryResult!6262)

(declare-fun d!87557 () Bool)

(assert (=> d!87557 (and (or ((_ is Undefined!6262) lt!275990) (not ((_ is Found!6262) lt!275990)) (and (bvsge (index!27312 lt!275990) #b00000000000000000000000000000000) (bvslt (index!27312 lt!275990) (size!18230 lt!275874)))) (or ((_ is Undefined!6262) lt!275990) ((_ is Found!6262) lt!275990) (not ((_ is MissingVacant!6262) lt!275990)) (not (= (index!27314 lt!275990) vacantSpotIndex!68)) (and (bvsge (index!27314 lt!275990) #b00000000000000000000000000000000) (bvslt (index!27314 lt!275990) (size!18230 lt!275874)))) (or ((_ is Undefined!6262) lt!275990) (ite ((_ is Found!6262) lt!275990) (= (select (arr!17866 lt!275874) (index!27312 lt!275990)) lt!275865) (and ((_ is MissingVacant!6262) lt!275990) (= (index!27314 lt!275990) vacantSpotIndex!68) (= (select (arr!17866 lt!275874) (index!27314 lt!275990)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!346208 () SeekEntryResult!6262)

(assert (=> d!87557 (= lt!275990 e!346208)))

(declare-fun c!68509 () Bool)

(assert (=> d!87557 (= c!68509 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!275989 () (_ BitVec 64))

(assert (=> d!87557 (= lt!275989 (select (arr!17866 lt!275874) index!984))))

(assert (=> d!87557 (validMask!0 mask!3053)))

(assert (=> d!87557 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275865 lt!275874 mask!3053) lt!275990)))

(declare-fun b!605000 () Bool)

(declare-fun c!68510 () Bool)

(assert (=> b!605000 (= c!68510 (= lt!275989 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346209 () SeekEntryResult!6262)

(declare-fun e!346207 () SeekEntryResult!6262)

(assert (=> b!605000 (= e!346209 e!346207)))

(declare-fun b!605001 () Bool)

(assert (=> b!605001 (= e!346208 e!346209)))

(declare-fun c!68508 () Bool)

(assert (=> b!605001 (= c!68508 (= lt!275989 lt!275865))))

(declare-fun b!605002 () Bool)

(assert (=> b!605002 (= e!346208 Undefined!6262)))

(declare-fun b!605003 () Bool)

(assert (=> b!605003 (= e!346209 (Found!6262 index!984))))

(declare-fun b!605004 () Bool)

(assert (=> b!605004 (= e!346207 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!275865 lt!275874 mask!3053))))

(declare-fun b!605005 () Bool)

(assert (=> b!605005 (= e!346207 (MissingVacant!6262 vacantSpotIndex!68))))

(assert (= (and d!87557 c!68509) b!605002))

(assert (= (and d!87557 (not c!68509)) b!605001))

(assert (= (and b!605001 c!68508) b!605003))

(assert (= (and b!605001 (not c!68508)) b!605000))

(assert (= (and b!605000 c!68510) b!605005))

(assert (= (and b!605000 (not c!68510)) b!605004))

(declare-fun m!582149 () Bool)

(assert (=> d!87557 m!582149))

(declare-fun m!582151 () Bool)

(assert (=> d!87557 m!582151))

(declare-fun m!582153 () Bool)

(assert (=> d!87557 m!582153))

(assert (=> d!87557 m!581921))

(declare-fun m!582155 () Bool)

(assert (=> b!605004 m!582155))

(assert (=> b!605004 m!582155))

(declare-fun m!582157 () Bool)

(assert (=> b!605004 m!582157))

(assert (=> b!604807 d!87557))

(declare-fun d!87559 () Bool)

(declare-fun lt!275993 () (_ BitVec 32))

(assert (=> d!87559 (and (bvsge lt!275993 #b00000000000000000000000000000000) (bvslt lt!275993 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87559 (= lt!275993 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!87559 (validMask!0 mask!3053)))

(assert (=> d!87559 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!275993)))

(declare-fun bs!18518 () Bool)

(assert (= bs!18518 d!87559))

(declare-fun m!582159 () Bool)

(assert (=> bs!18518 m!582159))

(assert (=> bs!18518 m!581921))

(assert (=> b!604807 d!87559))

(declare-fun d!87561 () Bool)

(declare-fun e!346212 () Bool)

(assert (=> d!87561 e!346212))

(declare-fun res!388723 () Bool)

(assert (=> d!87561 (=> (not res!388723) (not e!346212))))

(assert (=> d!87561 (= res!388723 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18230 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18230 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18230 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18230 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18230 a!2986))))))

(declare-fun lt!275996 () Unit!19225)

(declare-fun choose!9 (array!37224 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19225)

(assert (=> d!87561 (= lt!275996 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275875 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87561 (validMask!0 mask!3053)))

(assert (=> d!87561 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275875 vacantSpotIndex!68 mask!3053) lt!275996)))

(declare-fun b!605008 () Bool)

(assert (=> b!605008 (= e!346212 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275875 vacantSpotIndex!68 (select (arr!17866 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275875 vacantSpotIndex!68 (select (store (arr!17866 a!2986) i!1108 k0!1786) j!136) (array!37225 (store (arr!17866 a!2986) i!1108 k0!1786) (size!18230 a!2986)) mask!3053)))))

(assert (= (and d!87561 res!388723) b!605008))

(declare-fun m!582161 () Bool)

(assert (=> d!87561 m!582161))

(assert (=> d!87561 m!581921))

(assert (=> b!605008 m!581933))

(assert (=> b!605008 m!581927))

(assert (=> b!605008 m!581925))

(assert (=> b!605008 m!581933))

(declare-fun m!582163 () Bool)

(assert (=> b!605008 m!582163))

(assert (=> b!605008 m!581925))

(assert (=> b!605008 m!581941))

(assert (=> b!604807 d!87561))

(declare-fun d!87563 () Bool)

(declare-fun res!388724 () Bool)

(declare-fun e!346213 () Bool)

(assert (=> d!87563 (=> res!388724 e!346213)))

(assert (=> d!87563 (= res!388724 (= (select (arr!17866 lt!275874) j!136) (select (arr!17866 a!2986) j!136)))))

(assert (=> d!87563 (= (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) j!136) e!346213)))

(declare-fun b!605009 () Bool)

(declare-fun e!346214 () Bool)

(assert (=> b!605009 (= e!346213 e!346214)))

(declare-fun res!388725 () Bool)

(assert (=> b!605009 (=> (not res!388725) (not e!346214))))

(assert (=> b!605009 (= res!388725 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18230 lt!275874)))))

(declare-fun b!605010 () Bool)

(assert (=> b!605010 (= e!346214 (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87563 (not res!388724)) b!605009))

(assert (= (and b!605009 res!388725) b!605010))

(declare-fun m!582165 () Bool)

(assert (=> d!87563 m!582165))

(assert (=> b!605010 m!581925))

(declare-fun m!582167 () Bool)

(assert (=> b!605010 m!582167))

(assert (=> b!604806 d!87563))

(declare-fun d!87567 () Bool)

(assert (=> d!87567 (arrayNoDuplicates!0 lt!275874 j!136 Nil!11811)))

(declare-fun lt!275999 () Unit!19225)

(declare-fun choose!39 (array!37224 (_ BitVec 32) (_ BitVec 32)) Unit!19225)

(assert (=> d!87567 (= lt!275999 (choose!39 lt!275874 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87567 (bvslt (size!18230 lt!275874) #b01111111111111111111111111111111)))

(assert (=> d!87567 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!275874 #b00000000000000000000000000000000 j!136) lt!275999)))

(declare-fun bs!18519 () Bool)

(assert (= bs!18519 d!87567))

(assert (=> bs!18519 m!581969))

(declare-fun m!582169 () Bool)

(assert (=> bs!18519 m!582169))

(assert (=> b!604803 d!87567))

(declare-fun d!87571 () Bool)

(declare-fun res!388726 () Bool)

(declare-fun e!346215 () Bool)

(assert (=> d!87571 (=> res!388726 e!346215)))

(assert (=> d!87571 (= res!388726 (= (select (arr!17866 lt!275874) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17866 a!2986) j!136)))))

(assert (=> d!87571 (= (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!346215)))

(declare-fun b!605011 () Bool)

(declare-fun e!346216 () Bool)

(assert (=> b!605011 (= e!346215 e!346216)))

(declare-fun res!388727 () Bool)

(assert (=> b!605011 (=> (not res!388727) (not e!346216))))

(assert (=> b!605011 (= res!388727 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18230 lt!275874)))))

(declare-fun b!605012 () Bool)

(assert (=> b!605012 (= e!346216 (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87571 (not res!388726)) b!605011))

(assert (= (and b!605011 res!388727) b!605012))

(declare-fun m!582171 () Bool)

(assert (=> d!87571 m!582171))

(assert (=> b!605012 m!581925))

(declare-fun m!582173 () Bool)

(assert (=> b!605012 m!582173))

(assert (=> b!604803 d!87571))

(declare-fun b!605046 () Bool)

(declare-fun e!346244 () Bool)

(declare-fun e!346243 () Bool)

(assert (=> b!605046 (= e!346244 e!346243)))

(declare-fun res!388749 () Bool)

(assert (=> b!605046 (=> (not res!388749) (not e!346243))))

(declare-fun e!346248 () Bool)

(assert (=> b!605046 (= res!388749 (not e!346248))))

(declare-fun res!388747 () Bool)

(assert (=> b!605046 (=> (not res!388747) (not e!346248))))

(assert (=> b!605046 (= res!388747 (validKeyInArray!0 (select (arr!17866 lt!275874) j!136)))))

(declare-fun b!605047 () Bool)

(declare-fun e!346245 () Bool)

(declare-fun call!33026 () Bool)

(assert (=> b!605047 (= e!346245 call!33026)))

(declare-fun d!87573 () Bool)

(declare-fun res!388748 () Bool)

(assert (=> d!87573 (=> res!388748 e!346244)))

(assert (=> d!87573 (= res!388748 (bvsge j!136 (size!18230 lt!275874)))))

(assert (=> d!87573 (= (arrayNoDuplicates!0 lt!275874 j!136 Nil!11811) e!346244)))

(declare-fun b!605048 () Bool)

(assert (=> b!605048 (= e!346245 call!33026)))

(declare-fun b!605049 () Bool)

(declare-fun contains!2967 (List!11814 (_ BitVec 64)) Bool)

(assert (=> b!605049 (= e!346248 (contains!2967 Nil!11811 (select (arr!17866 lt!275874) j!136)))))

(declare-fun b!605050 () Bool)

(assert (=> b!605050 (= e!346243 e!346245)))

(declare-fun c!68519 () Bool)

(assert (=> b!605050 (= c!68519 (validKeyInArray!0 (select (arr!17866 lt!275874) j!136)))))

(declare-fun bm!33023 () Bool)

(assert (=> bm!33023 (= call!33026 (arrayNoDuplicates!0 lt!275874 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68519 (Cons!11810 (select (arr!17866 lt!275874) j!136) Nil!11811) Nil!11811)))))

(assert (= (and d!87573 (not res!388748)) b!605046))

(assert (= (and b!605046 res!388747) b!605049))

(assert (= (and b!605046 res!388749) b!605050))

(assert (= (and b!605050 c!68519) b!605048))

(assert (= (and b!605050 (not c!68519)) b!605047))

(assert (= (or b!605048 b!605047) bm!33023))

(assert (=> b!605046 m!582165))

(assert (=> b!605046 m!582165))

(declare-fun m!582189 () Bool)

(assert (=> b!605046 m!582189))

(assert (=> b!605049 m!582165))

(assert (=> b!605049 m!582165))

(declare-fun m!582193 () Bool)

(assert (=> b!605049 m!582193))

(assert (=> b!605050 m!582165))

(assert (=> b!605050 m!582165))

(assert (=> b!605050 m!582189))

(assert (=> bm!33023 m!582165))

(declare-fun m!582199 () Bool)

(assert (=> bm!33023 m!582199))

(assert (=> b!604803 d!87573))

(declare-fun b!605055 () Bool)

(declare-fun e!346251 () Bool)

(declare-fun e!346250 () Bool)

(assert (=> b!605055 (= e!346251 e!346250)))

(declare-fun res!388754 () Bool)

(assert (=> b!605055 (=> (not res!388754) (not e!346250))))

(declare-fun e!346253 () Bool)

(assert (=> b!605055 (= res!388754 (not e!346253))))

(declare-fun res!388752 () Bool)

(assert (=> b!605055 (=> (not res!388752) (not e!346253))))

(assert (=> b!605055 (= res!388752 (validKeyInArray!0 (select (arr!17866 lt!275874) #b00000000000000000000000000000000)))))

(declare-fun b!605056 () Bool)

(declare-fun e!346252 () Bool)

(declare-fun call!33028 () Bool)

(assert (=> b!605056 (= e!346252 call!33028)))

(declare-fun d!87579 () Bool)

(declare-fun res!388753 () Bool)

(assert (=> d!87579 (=> res!388753 e!346251)))

(assert (=> d!87579 (= res!388753 (bvsge #b00000000000000000000000000000000 (size!18230 lt!275874)))))

(assert (=> d!87579 (= (arrayNoDuplicates!0 lt!275874 #b00000000000000000000000000000000 Nil!11811) e!346251)))

(declare-fun b!605057 () Bool)

(assert (=> b!605057 (= e!346252 call!33028)))

(declare-fun b!605058 () Bool)

(assert (=> b!605058 (= e!346253 (contains!2967 Nil!11811 (select (arr!17866 lt!275874) #b00000000000000000000000000000000)))))

(declare-fun b!605059 () Bool)

(assert (=> b!605059 (= e!346250 e!346252)))

(declare-fun c!68520 () Bool)

(assert (=> b!605059 (= c!68520 (validKeyInArray!0 (select (arr!17866 lt!275874) #b00000000000000000000000000000000)))))

(declare-fun bm!33025 () Bool)

(assert (=> bm!33025 (= call!33028 (arrayNoDuplicates!0 lt!275874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68520 (Cons!11810 (select (arr!17866 lt!275874) #b00000000000000000000000000000000) Nil!11811) Nil!11811)))))

(assert (= (and d!87579 (not res!388753)) b!605055))

(assert (= (and b!605055 res!388752) b!605058))

(assert (= (and b!605055 res!388754) b!605059))

(assert (= (and b!605059 c!68520) b!605057))

(assert (= (and b!605059 (not c!68520)) b!605056))

(assert (= (or b!605057 b!605056) bm!33025))

(declare-fun m!582203 () Bool)

(assert (=> b!605055 m!582203))

(assert (=> b!605055 m!582203))

(declare-fun m!582207 () Bool)

(assert (=> b!605055 m!582207))

(assert (=> b!605058 m!582203))

(assert (=> b!605058 m!582203))

(declare-fun m!582211 () Bool)

(assert (=> b!605058 m!582211))

(assert (=> b!605059 m!582203))

(assert (=> b!605059 m!582203))

(assert (=> b!605059 m!582207))

(assert (=> bm!33025 m!582203))

(declare-fun m!582217 () Bool)

(assert (=> bm!33025 m!582217))

(assert (=> b!604803 d!87579))

(declare-fun d!87583 () Bool)

(declare-fun e!346268 () Bool)

(assert (=> d!87583 e!346268))

(declare-fun res!388766 () Bool)

(assert (=> d!87583 (=> (not res!388766) (not e!346268))))

(assert (=> d!87583 (= res!388766 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18230 a!2986))))))

(declare-fun lt!276017 () Unit!19225)

(declare-fun choose!41 (array!37224 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11814) Unit!19225)

(assert (=> d!87583 (= lt!276017 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11811))))

(assert (=> d!87583 (bvslt (size!18230 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87583 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11811) lt!276017)))

(declare-fun b!605077 () Bool)

(assert (=> b!605077 (= e!346268 (arrayNoDuplicates!0 (array!37225 (store (arr!17866 a!2986) i!1108 k0!1786) (size!18230 a!2986)) #b00000000000000000000000000000000 Nil!11811))))

(assert (= (and d!87583 res!388766) b!605077))

(declare-fun m!582221 () Bool)

(assert (=> d!87583 m!582221))

(assert (=> b!605077 m!581927))

(declare-fun m!582223 () Bool)

(assert (=> b!605077 m!582223))

(assert (=> b!604803 d!87583))

(declare-fun d!87589 () Bool)

(assert (=> d!87589 (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276023 () Unit!19225)

(declare-fun choose!114 (array!37224 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19225)

(assert (=> d!87589 (= lt!276023 (choose!114 lt!275874 (select (arr!17866 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87589 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87589 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275874 (select (arr!17866 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!276023)))

(declare-fun bs!18523 () Bool)

(assert (= bs!18523 d!87589))

(assert (=> bs!18523 m!581925))

(assert (=> bs!18523 m!581957))

(assert (=> bs!18523 m!581925))

(declare-fun m!582235 () Bool)

(assert (=> bs!18523 m!582235))

(assert (=> b!604803 d!87589))

(declare-fun d!87595 () Bool)

(assert (=> d!87595 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18230 lt!275874)) (not (= (select (arr!17866 lt!275874) j!136) (select (arr!17866 a!2986) j!136))))))

(declare-fun lt!276032 () Unit!19225)

(declare-fun choose!21 (array!37224 (_ BitVec 64) (_ BitVec 32) List!11814) Unit!19225)

(assert (=> d!87595 (= lt!276032 (choose!21 lt!275874 (select (arr!17866 a!2986) j!136) j!136 Nil!11811))))

(assert (=> d!87595 (bvslt (size!18230 lt!275874) #b01111111111111111111111111111111)))

(assert (=> d!87595 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275874 (select (arr!17866 a!2986) j!136) j!136 Nil!11811) lt!276032)))

(declare-fun bs!18525 () Bool)

(assert (= bs!18525 d!87595))

(assert (=> bs!18525 m!582165))

(assert (=> bs!18525 m!581925))

(declare-fun m!582241 () Bool)

(assert (=> bs!18525 m!582241))

(assert (=> b!604803 d!87595))

(declare-fun d!87599 () Bool)

(declare-fun res!388773 () Bool)

(declare-fun e!346276 () Bool)

(assert (=> d!87599 (=> res!388773 e!346276)))

(assert (=> d!87599 (= res!388773 (= (select (arr!17866 lt!275874) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17866 a!2986) j!136)))))

(assert (=> d!87599 (= (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!346276)))

(declare-fun b!605086 () Bool)

(declare-fun e!346277 () Bool)

(assert (=> b!605086 (= e!346276 e!346277)))

(declare-fun res!388774 () Bool)

(assert (=> b!605086 (=> (not res!388774) (not e!346277))))

(assert (=> b!605086 (= res!388774 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18230 lt!275874)))))

(declare-fun b!605087 () Bool)

(assert (=> b!605087 (= e!346277 (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87599 (not res!388773)) b!605086))

(assert (= (and b!605086 res!388774) b!605087))

(declare-fun m!582245 () Bool)

(assert (=> d!87599 m!582245))

(assert (=> b!605087 m!581925))

(declare-fun m!582247 () Bool)

(assert (=> b!605087 m!582247))

(assert (=> b!604813 d!87599))

(declare-fun d!87603 () Bool)

(assert (=> d!87603 (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276033 () Unit!19225)

(assert (=> d!87603 (= lt!276033 (choose!114 lt!275874 (select (arr!17866 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87603 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87603 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275874 (select (arr!17866 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!276033)))

(declare-fun bs!18526 () Bool)

(assert (= bs!18526 d!87603))

(assert (=> bs!18526 m!581925))

(assert (=> bs!18526 m!581975))

(assert (=> bs!18526 m!581925))

(declare-fun m!582249 () Bool)

(assert (=> bs!18526 m!582249))

(assert (=> b!604813 d!87603))

(assert (=> b!604813 d!87563))

(declare-fun b!605088 () Bool)

(declare-fun e!346279 () Bool)

(declare-fun e!346278 () Bool)

(assert (=> b!605088 (= e!346279 e!346278)))

(declare-fun res!388777 () Bool)

(assert (=> b!605088 (=> (not res!388777) (not e!346278))))

(declare-fun e!346281 () Bool)

(assert (=> b!605088 (= res!388777 (not e!346281))))

(declare-fun res!388775 () Bool)

(assert (=> b!605088 (=> (not res!388775) (not e!346281))))

(assert (=> b!605088 (= res!388775 (validKeyInArray!0 (select (arr!17866 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605089 () Bool)

(declare-fun e!346280 () Bool)

(declare-fun call!33033 () Bool)

(assert (=> b!605089 (= e!346280 call!33033)))

(declare-fun d!87605 () Bool)

(declare-fun res!388776 () Bool)

(assert (=> d!87605 (=> res!388776 e!346279)))

(assert (=> d!87605 (= res!388776 (bvsge #b00000000000000000000000000000000 (size!18230 a!2986)))))

(assert (=> d!87605 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11811) e!346279)))

(declare-fun b!605090 () Bool)

(assert (=> b!605090 (= e!346280 call!33033)))

(declare-fun b!605091 () Bool)

(assert (=> b!605091 (= e!346281 (contains!2967 Nil!11811 (select (arr!17866 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605092 () Bool)

(assert (=> b!605092 (= e!346278 e!346280)))

(declare-fun c!68525 () Bool)

(assert (=> b!605092 (= c!68525 (validKeyInArray!0 (select (arr!17866 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33030 () Bool)

(assert (=> bm!33030 (= call!33033 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68525 (Cons!11810 (select (arr!17866 a!2986) #b00000000000000000000000000000000) Nil!11811) Nil!11811)))))

(assert (= (and d!87605 (not res!388776)) b!605088))

(assert (= (and b!605088 res!388775) b!605091))

(assert (= (and b!605088 res!388777) b!605092))

(assert (= (and b!605092 c!68525) b!605090))

(assert (= (and b!605092 (not c!68525)) b!605089))

(assert (= (or b!605090 b!605089) bm!33030))

(assert (=> b!605088 m!582127))

(assert (=> b!605088 m!582127))

(declare-fun m!582251 () Bool)

(assert (=> b!605088 m!582251))

(assert (=> b!605091 m!582127))

(assert (=> b!605091 m!582127))

(declare-fun m!582253 () Bool)

(assert (=> b!605091 m!582253))

(assert (=> b!605092 m!582127))

(assert (=> b!605092 m!582127))

(assert (=> b!605092 m!582251))

(assert (=> bm!33030 m!582127))

(declare-fun m!582257 () Bool)

(assert (=> bm!33030 m!582257))

(assert (=> b!604793 d!87605))

(declare-fun d!87607 () Bool)

(declare-fun res!388782 () Bool)

(declare-fun e!346286 () Bool)

(assert (=> d!87607 (=> res!388782 e!346286)))

(assert (=> d!87607 (= res!388782 (= (select (arr!17866 lt!275874) index!984) (select (arr!17866 a!2986) j!136)))))

(assert (=> d!87607 (= (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) index!984) e!346286)))

(declare-fun b!605097 () Bool)

(declare-fun e!346287 () Bool)

(assert (=> b!605097 (= e!346286 e!346287)))

(declare-fun res!388783 () Bool)

(assert (=> b!605097 (=> (not res!388783) (not e!346287))))

(assert (=> b!605097 (= res!388783 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18230 lt!275874)))))

(declare-fun b!605098 () Bool)

(assert (=> b!605098 (= e!346287 (arrayContainsKey!0 lt!275874 (select (arr!17866 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87607 (not res!388782)) b!605097))

(assert (= (and b!605097 res!388783) b!605098))

(assert (=> d!87607 m!582153))

(assert (=> b!605098 m!581925))

(declare-fun m!582261 () Bool)

(assert (=> b!605098 m!582261))

(assert (=> b!604810 d!87607))

(declare-fun d!87611 () Bool)

(assert (=> d!87611 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!604812 d!87611))

(declare-fun d!87615 () Bool)

(assert (=> d!87615 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55206 d!87615))

(declare-fun d!87625 () Bool)

(assert (=> d!87625 (= (array_inv!13725 a!2986) (bvsge (size!18230 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55206 d!87625))

(assert (=> b!604791 d!87607))

(declare-fun d!87629 () Bool)

(declare-fun lt!276044 () SeekEntryResult!6262)

(assert (=> d!87629 (and (or ((_ is Undefined!6262) lt!276044) (not ((_ is Found!6262) lt!276044)) (and (bvsge (index!27312 lt!276044) #b00000000000000000000000000000000) (bvslt (index!27312 lt!276044) (size!18230 a!2986)))) (or ((_ is Undefined!6262) lt!276044) ((_ is Found!6262) lt!276044) (not ((_ is MissingVacant!6262) lt!276044)) (not (= (index!27314 lt!276044) vacantSpotIndex!68)) (and (bvsge (index!27314 lt!276044) #b00000000000000000000000000000000) (bvslt (index!27314 lt!276044) (size!18230 a!2986)))) (or ((_ is Undefined!6262) lt!276044) (ite ((_ is Found!6262) lt!276044) (= (select (arr!17866 a!2986) (index!27312 lt!276044)) (select (arr!17866 a!2986) j!136)) (and ((_ is MissingVacant!6262) lt!276044) (= (index!27314 lt!276044) vacantSpotIndex!68) (= (select (arr!17866 a!2986) (index!27314 lt!276044)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!346306 () SeekEntryResult!6262)

(assert (=> d!87629 (= lt!276044 e!346306)))

(declare-fun c!68528 () Bool)

(assert (=> d!87629 (= c!68528 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!276043 () (_ BitVec 64))

(assert (=> d!87629 (= lt!276043 (select (arr!17866 a!2986) index!984))))

(assert (=> d!87629 (validMask!0 mask!3053)))

(assert (=> d!87629 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17866 a!2986) j!136) a!2986 mask!3053) lt!276044)))

(declare-fun b!605117 () Bool)

(declare-fun c!68529 () Bool)

(assert (=> b!605117 (= c!68529 (= lt!276043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346307 () SeekEntryResult!6262)

(declare-fun e!346305 () SeekEntryResult!6262)

(assert (=> b!605117 (= e!346307 e!346305)))

(declare-fun b!605118 () Bool)

(assert (=> b!605118 (= e!346306 e!346307)))

(declare-fun c!68527 () Bool)

(assert (=> b!605118 (= c!68527 (= lt!276043 (select (arr!17866 a!2986) j!136)))))

(declare-fun b!605119 () Bool)

(assert (=> b!605119 (= e!346306 Undefined!6262)))

(declare-fun b!605120 () Bool)

(assert (=> b!605120 (= e!346307 (Found!6262 index!984))))

(declare-fun b!605121 () Bool)

(assert (=> b!605121 (= e!346305 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17866 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605122 () Bool)

(assert (=> b!605122 (= e!346305 (MissingVacant!6262 vacantSpotIndex!68))))

(assert (= (and d!87629 c!68528) b!605119))

(assert (= (and d!87629 (not c!68528)) b!605118))

(assert (= (and b!605118 c!68527) b!605120))

(assert (= (and b!605118 (not c!68527)) b!605117))

(assert (= (and b!605117 c!68529) b!605122))

(assert (= (and b!605117 (not c!68529)) b!605121))

(declare-fun m!582285 () Bool)

(assert (=> d!87629 m!582285))

(declare-fun m!582287 () Bool)

(assert (=> d!87629 m!582287))

(assert (=> d!87629 m!581981))

(assert (=> d!87629 m!581921))

(assert (=> b!605121 m!582155))

(assert (=> b!605121 m!582155))

(assert (=> b!605121 m!581925))

(declare-fun m!582289 () Bool)

(assert (=> b!605121 m!582289))

(assert (=> b!604808 d!87629))

(declare-fun d!87631 () Bool)

(assert (=> d!87631 (= (validKeyInArray!0 (select (arr!17866 a!2986) j!136)) (and (not (= (select (arr!17866 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17866 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!604797 d!87631))

(declare-fun b!605149 () Bool)

(declare-fun e!346325 () Bool)

(declare-fun e!346323 () Bool)

(assert (=> b!605149 (= e!346325 e!346323)))

(declare-fun c!68541 () Bool)

(assert (=> b!605149 (= c!68541 (validKeyInArray!0 (select (arr!17866 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605150 () Bool)

(declare-fun e!346324 () Bool)

(declare-fun call!33037 () Bool)

(assert (=> b!605150 (= e!346324 call!33037)))

(declare-fun b!605151 () Bool)

(assert (=> b!605151 (= e!346323 call!33037)))

(declare-fun bm!33034 () Bool)

(assert (=> bm!33034 (= call!33037 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!605152 () Bool)

(assert (=> b!605152 (= e!346323 e!346324)))

(declare-fun lt!276058 () (_ BitVec 64))

(assert (=> b!605152 (= lt!276058 (select (arr!17866 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!276059 () Unit!19225)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37224 (_ BitVec 64) (_ BitVec 32)) Unit!19225)

(assert (=> b!605152 (= lt!276059 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!276058 #b00000000000000000000000000000000))))

(assert (=> b!605152 (arrayContainsKey!0 a!2986 lt!276058 #b00000000000000000000000000000000)))

(declare-fun lt!276057 () Unit!19225)

(assert (=> b!605152 (= lt!276057 lt!276059)))

(declare-fun res!388804 () Bool)

(assert (=> b!605152 (= res!388804 (= (seekEntryOrOpen!0 (select (arr!17866 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6262 #b00000000000000000000000000000000)))))

(assert (=> b!605152 (=> (not res!388804) (not e!346324))))

(declare-fun d!87633 () Bool)

(declare-fun res!388805 () Bool)

(assert (=> d!87633 (=> res!388805 e!346325)))

(assert (=> d!87633 (= res!388805 (bvsge #b00000000000000000000000000000000 (size!18230 a!2986)))))

(assert (=> d!87633 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!346325)))

(assert (= (and d!87633 (not res!388805)) b!605149))

(assert (= (and b!605149 c!68541) b!605152))

(assert (= (and b!605149 (not c!68541)) b!605151))

(assert (= (and b!605152 res!388804) b!605150))

(assert (= (or b!605150 b!605151) bm!33034))

(assert (=> b!605149 m!582127))

(assert (=> b!605149 m!582127))

(assert (=> b!605149 m!582251))

(declare-fun m!582299 () Bool)

(assert (=> bm!33034 m!582299))

(assert (=> b!605152 m!582127))

(declare-fun m!582301 () Bool)

(assert (=> b!605152 m!582301))

(declare-fun m!582303 () Bool)

(assert (=> b!605152 m!582303))

(assert (=> b!605152 m!582127))

(declare-fun m!582305 () Bool)

(assert (=> b!605152 m!582305))

(assert (=> b!604799 d!87633))

(check-sat (not b!605092) (not b!605077) (not b!605059) (not d!87549) (not bm!33023) (not b!605058) (not d!87559) (not d!87567) (not d!87629) (not d!87555) (not d!87595) (not bm!33034) (not b!605098) (not b!605152) (not b!605091) (not b!605012) (not b!604992) (not b!605004) (not b!605046) (not d!87553) (not d!87589) (not b!605008) (not b!605010) (not b!605087) (not b!605050) (not b!605049) (not b!605121) (not d!87603) (not d!87583) (not b!604998) (not bm!33025) (not b!605055) (not d!87561) (not b!605088) (not b!605149) (not b!604967) (not b!604975) (not bm!33030) (not d!87557))
(check-sat)
