; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56182 () Bool)

(assert start!56182)

(declare-fun b!622065 () Bool)

(declare-datatypes ((Unit!20848 0))(
  ( (Unit!20849) )
))
(declare-fun e!356799 () Unit!20848)

(declare-fun Unit!20850 () Unit!20848)

(assert (=> b!622065 (= e!356799 Unit!20850)))

(declare-fun b!622066 () Bool)

(declare-fun e!356803 () Bool)

(declare-fun e!356807 () Bool)

(assert (=> b!622066 (= e!356803 e!356807)))

(declare-fun res!400894 () Bool)

(assert (=> b!622066 (=> (not res!400894) (not e!356807))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37652 0))(
  ( (array!37653 (arr!18072 (Array (_ BitVec 32) (_ BitVec 64))) (size!18436 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37652)

(assert (=> b!622066 (= res!400894 (= (select (store (arr!18072 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!288079 () array!37652)

(assert (=> b!622066 (= lt!288079 (array!37653 (store (arr!18072 a!2986) i!1108 k!1786) (size!18436 a!2986)))))

(declare-fun b!622067 () Bool)

(declare-fun res!400892 () Bool)

(declare-fun e!356805 () Bool)

(assert (=> b!622067 (=> (not res!400892) (not e!356805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622067 (= res!400892 (validKeyInArray!0 k!1786))))

(declare-fun b!622068 () Bool)

(declare-fun e!356808 () Unit!20848)

(declare-fun Unit!20851 () Unit!20848)

(assert (=> b!622068 (= e!356808 Unit!20851)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!622069 () Bool)

(declare-fun e!356798 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622069 (= e!356798 (arrayContainsKey!0 lt!288079 (select (arr!18072 a!2986) j!136) index!984))))

(declare-fun b!622070 () Bool)

(declare-fun res!400884 () Bool)

(assert (=> b!622070 (=> (not res!400884) (not e!356805))))

(assert (=> b!622070 (= res!400884 (validKeyInArray!0 (select (arr!18072 a!2986) j!136)))))

(declare-fun b!622071 () Bool)

(declare-fun Unit!20852 () Unit!20848)

(assert (=> b!622071 (= e!356799 Unit!20852)))

(assert (=> b!622071 false))

(declare-fun b!622072 () Bool)

(assert (=> b!622072 false))

(declare-fun lt!288086 () Unit!20848)

(declare-datatypes ((List!12113 0))(
  ( (Nil!12110) (Cons!12109 (h!13154 (_ BitVec 64)) (t!18341 List!12113)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37652 (_ BitVec 64) (_ BitVec 32) List!12113) Unit!20848)

(assert (=> b!622072 (= lt!288086 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288079 (select (arr!18072 a!2986) j!136) j!136 Nil!12110))))

(declare-fun arrayNoDuplicates!0 (array!37652 (_ BitVec 32) List!12113) Bool)

(assert (=> b!622072 (arrayNoDuplicates!0 lt!288079 j!136 Nil!12110)))

(declare-fun lt!288083 () Unit!20848)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37652 (_ BitVec 32) (_ BitVec 32)) Unit!20848)

(assert (=> b!622072 (= lt!288083 (lemmaNoDuplicateFromThenFromBigger!0 lt!288079 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622072 (arrayNoDuplicates!0 lt!288079 #b00000000000000000000000000000000 Nil!12110)))

(declare-fun lt!288095 () Unit!20848)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37652 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12113) Unit!20848)

(assert (=> b!622072 (= lt!288095 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12110))))

(assert (=> b!622072 (arrayContainsKey!0 lt!288079 (select (arr!18072 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288085 () Unit!20848)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37652 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20848)

(assert (=> b!622072 (= lt!288085 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288079 (select (arr!18072 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356802 () Unit!20848)

(declare-fun Unit!20853 () Unit!20848)

(assert (=> b!622072 (= e!356802 Unit!20853)))

(declare-fun b!622073 () Bool)

(declare-fun e!356795 () Bool)

(assert (=> b!622073 (= e!356807 e!356795)))

(declare-fun res!400898 () Bool)

(assert (=> b!622073 (=> (not res!400898) (not e!356795))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6512 0))(
  ( (MissingZero!6512 (index!28332 (_ BitVec 32))) (Found!6512 (index!28333 (_ BitVec 32))) (Intermediate!6512 (undefined!7324 Bool) (index!28334 (_ BitVec 32)) (x!57104 (_ BitVec 32))) (Undefined!6512) (MissingVacant!6512 (index!28335 (_ BitVec 32))) )
))
(declare-fun lt!288092 () SeekEntryResult!6512)

(assert (=> b!622073 (= res!400898 (and (= lt!288092 (Found!6512 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18072 a!2986) index!984) (select (arr!18072 a!2986) j!136))) (not (= (select (arr!18072 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37652 (_ BitVec 32)) SeekEntryResult!6512)

(assert (=> b!622073 (= lt!288092 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18072 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622074 () Bool)

(declare-fun res!400887 () Bool)

(assert (=> b!622074 (=> (not res!400887) (not e!356805))))

(assert (=> b!622074 (= res!400887 (and (= (size!18436 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18436 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18436 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622075 () Bool)

(declare-fun e!356806 () Unit!20848)

(declare-fun Unit!20854 () Unit!20848)

(assert (=> b!622075 (= e!356806 Unit!20854)))

(declare-fun b!622076 () Bool)

(declare-fun res!400891 () Bool)

(assert (=> b!622076 (= res!400891 (bvsge j!136 index!984))))

(declare-fun e!356797 () Bool)

(assert (=> b!622076 (=> res!400891 e!356797)))

(declare-fun e!356800 () Bool)

(assert (=> b!622076 (= e!356800 e!356797)))

(declare-fun b!622077 () Bool)

(assert (=> b!622077 (= e!356805 e!356803)))

(declare-fun res!400893 () Bool)

(assert (=> b!622077 (=> (not res!400893) (not e!356803))))

(declare-fun lt!288087 () SeekEntryResult!6512)

(assert (=> b!622077 (= res!400893 (or (= lt!288087 (MissingZero!6512 i!1108)) (= lt!288087 (MissingVacant!6512 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37652 (_ BitVec 32)) SeekEntryResult!6512)

(assert (=> b!622077 (= lt!288087 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!622078 () Bool)

(declare-fun Unit!20855 () Unit!20848)

(assert (=> b!622078 (= e!356802 Unit!20855)))

(declare-fun b!622079 () Bool)

(declare-fun res!400889 () Bool)

(assert (=> b!622079 (=> (not res!400889) (not e!356803))))

(assert (=> b!622079 (= res!400889 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12110))))

(declare-fun b!622080 () Bool)

(declare-fun Unit!20856 () Unit!20848)

(assert (=> b!622080 (= e!356808 Unit!20856)))

(declare-fun res!400888 () Bool)

(assert (=> b!622080 (= res!400888 (= (select (store (arr!18072 a!2986) i!1108 k!1786) index!984) (select (arr!18072 a!2986) j!136)))))

(assert (=> b!622080 (=> (not res!400888) (not e!356800))))

(assert (=> b!622080 e!356800))

(declare-fun c!70958 () Bool)

(assert (=> b!622080 (= c!70958 (bvslt j!136 index!984))))

(declare-fun lt!288091 () Unit!20848)

(assert (=> b!622080 (= lt!288091 e!356802)))

(declare-fun c!70960 () Bool)

(assert (=> b!622080 (= c!70960 (bvslt index!984 j!136))))

(declare-fun lt!288084 () Unit!20848)

(assert (=> b!622080 (= lt!288084 e!356806)))

(assert (=> b!622080 false))

(declare-fun b!622081 () Bool)

(declare-fun res!400890 () Bool)

(assert (=> b!622081 (=> (not res!400890) (not e!356803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37652 (_ BitVec 32)) Bool)

(assert (=> b!622081 (= res!400890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!400896 () Bool)

(declare-fun b!622082 () Bool)

(assert (=> b!622082 (= res!400896 (arrayContainsKey!0 lt!288079 (select (arr!18072 a!2986) j!136) j!136))))

(declare-fun e!356804 () Bool)

(assert (=> b!622082 (=> (not res!400896) (not e!356804))))

(assert (=> b!622082 (= e!356797 e!356804)))

(declare-fun b!622083 () Bool)

(declare-fun res!400883 () Bool)

(assert (=> b!622083 (=> (not res!400883) (not e!356803))))

(assert (=> b!622083 (= res!400883 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18072 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622084 () Bool)

(declare-fun lt!288096 () SeekEntryResult!6512)

(assert (=> b!622084 (= e!356795 (not (or (= lt!288096 (MissingVacant!6512 vacantSpotIndex!68)) (bvsge mask!3053 #b00000000000000000000000000000000))))))

(declare-fun lt!288080 () Unit!20848)

(assert (=> b!622084 (= lt!288080 e!356808)))

(declare-fun c!70961 () Bool)

(assert (=> b!622084 (= c!70961 (= lt!288096 (Found!6512 index!984)))))

(declare-fun lt!288094 () Unit!20848)

(assert (=> b!622084 (= lt!288094 e!356799)))

(declare-fun c!70959 () Bool)

(assert (=> b!622084 (= c!70959 (= lt!288096 Undefined!6512))))

(declare-fun lt!288097 () (_ BitVec 64))

(assert (=> b!622084 (= lt!288096 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288097 lt!288079 mask!3053))))

(declare-fun e!356796 () Bool)

(assert (=> b!622084 e!356796))

(declare-fun res!400885 () Bool)

(assert (=> b!622084 (=> (not res!400885) (not e!356796))))

(declare-fun lt!288078 () (_ BitVec 32))

(declare-fun lt!288081 () SeekEntryResult!6512)

(assert (=> b!622084 (= res!400885 (= lt!288081 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288078 vacantSpotIndex!68 lt!288097 lt!288079 mask!3053)))))

(assert (=> b!622084 (= lt!288081 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288078 vacantSpotIndex!68 (select (arr!18072 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622084 (= lt!288097 (select (store (arr!18072 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!288088 () Unit!20848)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37652 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20848)

(assert (=> b!622084 (= lt!288088 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288078 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622084 (= lt!288078 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622085 () Bool)

(assert (=> b!622085 false))

(declare-fun lt!288093 () Unit!20848)

(assert (=> b!622085 (= lt!288093 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288079 (select (arr!18072 a!2986) j!136) index!984 Nil!12110))))

(assert (=> b!622085 (arrayNoDuplicates!0 lt!288079 index!984 Nil!12110)))

(declare-fun lt!288090 () Unit!20848)

(assert (=> b!622085 (= lt!288090 (lemmaNoDuplicateFromThenFromBigger!0 lt!288079 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622085 (arrayNoDuplicates!0 lt!288079 #b00000000000000000000000000000000 Nil!12110)))

(declare-fun lt!288089 () Unit!20848)

(assert (=> b!622085 (= lt!288089 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12110))))

(assert (=> b!622085 (arrayContainsKey!0 lt!288079 (select (arr!18072 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288082 () Unit!20848)

(assert (=> b!622085 (= lt!288082 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288079 (select (arr!18072 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622085 e!356798))

(declare-fun res!400895 () Bool)

(assert (=> b!622085 (=> (not res!400895) (not e!356798))))

(assert (=> b!622085 (= res!400895 (arrayContainsKey!0 lt!288079 (select (arr!18072 a!2986) j!136) j!136))))

(declare-fun Unit!20857 () Unit!20848)

(assert (=> b!622085 (= e!356806 Unit!20857)))

(declare-fun b!622086 () Bool)

(assert (=> b!622086 (= e!356804 (arrayContainsKey!0 lt!288079 (select (arr!18072 a!2986) j!136) index!984))))

(declare-fun res!400886 () Bool)

(assert (=> start!56182 (=> (not res!400886) (not e!356805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56182 (= res!400886 (validMask!0 mask!3053))))

(assert (=> start!56182 e!356805))

(assert (=> start!56182 true))

(declare-fun array_inv!13868 (array!37652) Bool)

(assert (=> start!56182 (array_inv!13868 a!2986)))

(declare-fun b!622087 () Bool)

(assert (=> b!622087 (= e!356796 (= lt!288092 lt!288081))))

(declare-fun b!622088 () Bool)

(declare-fun res!400897 () Bool)

(assert (=> b!622088 (=> (not res!400897) (not e!356805))))

(assert (=> b!622088 (= res!400897 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56182 res!400886) b!622074))

(assert (= (and b!622074 res!400887) b!622070))

(assert (= (and b!622070 res!400884) b!622067))

(assert (= (and b!622067 res!400892) b!622088))

(assert (= (and b!622088 res!400897) b!622077))

(assert (= (and b!622077 res!400893) b!622081))

(assert (= (and b!622081 res!400890) b!622079))

(assert (= (and b!622079 res!400889) b!622083))

(assert (= (and b!622083 res!400883) b!622066))

(assert (= (and b!622066 res!400894) b!622073))

(assert (= (and b!622073 res!400898) b!622084))

(assert (= (and b!622084 res!400885) b!622087))

(assert (= (and b!622084 c!70959) b!622071))

(assert (= (and b!622084 (not c!70959)) b!622065))

(assert (= (and b!622084 c!70961) b!622080))

(assert (= (and b!622084 (not c!70961)) b!622068))

(assert (= (and b!622080 res!400888) b!622076))

(assert (= (and b!622076 (not res!400891)) b!622082))

(assert (= (and b!622082 res!400896) b!622086))

(assert (= (and b!622080 c!70958) b!622072))

(assert (= (and b!622080 (not c!70958)) b!622078))

(assert (= (and b!622080 c!70960) b!622085))

(assert (= (and b!622080 (not c!70960)) b!622075))

(assert (= (and b!622085 res!400895) b!622069))

(declare-fun m!597941 () Bool)

(assert (=> b!622081 m!597941))

(declare-fun m!597943 () Bool)

(assert (=> b!622077 m!597943))

(declare-fun m!597945 () Bool)

(assert (=> b!622070 m!597945))

(assert (=> b!622070 m!597945))

(declare-fun m!597947 () Bool)

(assert (=> b!622070 m!597947))

(assert (=> b!622082 m!597945))

(assert (=> b!622082 m!597945))

(declare-fun m!597949 () Bool)

(assert (=> b!622082 m!597949))

(declare-fun m!597951 () Bool)

(assert (=> b!622073 m!597951))

(assert (=> b!622073 m!597945))

(assert (=> b!622073 m!597945))

(declare-fun m!597953 () Bool)

(assert (=> b!622073 m!597953))

(assert (=> b!622072 m!597945))

(declare-fun m!597955 () Bool)

(assert (=> b!622072 m!597955))

(declare-fun m!597957 () Bool)

(assert (=> b!622072 m!597957))

(assert (=> b!622072 m!597945))

(declare-fun m!597959 () Bool)

(assert (=> b!622072 m!597959))

(assert (=> b!622072 m!597945))

(declare-fun m!597961 () Bool)

(assert (=> b!622072 m!597961))

(assert (=> b!622072 m!597945))

(declare-fun m!597963 () Bool)

(assert (=> b!622072 m!597963))

(declare-fun m!597965 () Bool)

(assert (=> b!622072 m!597965))

(declare-fun m!597967 () Bool)

(assert (=> b!622072 m!597967))

(declare-fun m!597969 () Bool)

(assert (=> b!622066 m!597969))

(declare-fun m!597971 () Bool)

(assert (=> b!622066 m!597971))

(assert (=> b!622085 m!597945))

(assert (=> b!622085 m!597945))

(declare-fun m!597973 () Bool)

(assert (=> b!622085 m!597973))

(assert (=> b!622085 m!597945))

(declare-fun m!597975 () Bool)

(assert (=> b!622085 m!597975))

(assert (=> b!622085 m!597945))

(assert (=> b!622085 m!597949))

(assert (=> b!622085 m!597965))

(declare-fun m!597977 () Bool)

(assert (=> b!622085 m!597977))

(assert (=> b!622085 m!597967))

(declare-fun m!597979 () Bool)

(assert (=> b!622085 m!597979))

(assert (=> b!622085 m!597945))

(declare-fun m!597981 () Bool)

(assert (=> b!622085 m!597981))

(declare-fun m!597983 () Bool)

(assert (=> b!622083 m!597983))

(declare-fun m!597985 () Bool)

(assert (=> b!622088 m!597985))

(declare-fun m!597987 () Bool)

(assert (=> b!622084 m!597987))

(declare-fun m!597989 () Bool)

(assert (=> b!622084 m!597989))

(declare-fun m!597991 () Bool)

(assert (=> b!622084 m!597991))

(declare-fun m!597993 () Bool)

(assert (=> b!622084 m!597993))

(assert (=> b!622084 m!597945))

(assert (=> b!622084 m!597945))

(declare-fun m!597995 () Bool)

(assert (=> b!622084 m!597995))

(assert (=> b!622084 m!597969))

(declare-fun m!597997 () Bool)

(assert (=> b!622084 m!597997))

(assert (=> b!622080 m!597969))

(declare-fun m!597999 () Bool)

(assert (=> b!622080 m!597999))

(assert (=> b!622080 m!597945))

(declare-fun m!598001 () Bool)

(assert (=> b!622067 m!598001))

(assert (=> b!622086 m!597945))

(assert (=> b!622086 m!597945))

(declare-fun m!598003 () Bool)

(assert (=> b!622086 m!598003))

(declare-fun m!598005 () Bool)

(assert (=> start!56182 m!598005))

(declare-fun m!598007 () Bool)

(assert (=> start!56182 m!598007))

(declare-fun m!598009 () Bool)

(assert (=> b!622079 m!598009))

(assert (=> b!622069 m!597945))

(assert (=> b!622069 m!597945))

(assert (=> b!622069 m!598003))

(push 1)

