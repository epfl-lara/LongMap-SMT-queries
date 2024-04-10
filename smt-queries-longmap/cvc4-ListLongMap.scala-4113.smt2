; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56180 () Bool)

(assert start!56180)

(declare-fun b!621994 () Bool)

(declare-datatypes ((Unit!20838 0))(
  ( (Unit!20839) )
))
(declare-fun e!356763 () Unit!20838)

(declare-fun Unit!20840 () Unit!20838)

(assert (=> b!621994 (= e!356763 Unit!20840)))

(assert (=> b!621994 false))

(declare-fun b!621995 () Bool)

(declare-fun Unit!20841 () Unit!20838)

(assert (=> b!621995 (= e!356763 Unit!20841)))

(declare-fun b!621996 () Bool)

(declare-fun res!400843 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!621996 (= res!400843 (bvsge j!136 index!984))))

(declare-fun e!356764 () Bool)

(assert (=> b!621996 (=> res!400843 e!356764)))

(declare-fun e!356762 () Bool)

(assert (=> b!621996 (= e!356762 e!356764)))

(declare-fun b!621997 () Bool)

(declare-fun res!400839 () Bool)

(declare-fun e!356755 () Bool)

(assert (=> b!621997 (=> (not res!400839) (not e!356755))))

(declare-datatypes ((array!37650 0))(
  ( (array!37651 (arr!18071 (Array (_ BitVec 32) (_ BitVec 64))) (size!18435 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37650)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37650 (_ BitVec 32)) Bool)

(assert (=> b!621997 (= res!400839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621998 () Bool)

(declare-fun e!356765 () Unit!20838)

(declare-fun Unit!20842 () Unit!20838)

(assert (=> b!621998 (= e!356765 Unit!20842)))

(declare-fun lt!288034 () array!37650)

(declare-fun res!400836 () Bool)

(declare-fun b!621999 () Bool)

(declare-fun arrayContainsKey!0 (array!37650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621999 (= res!400836 (arrayContainsKey!0 lt!288034 (select (arr!18071 a!2986) j!136) j!136))))

(declare-fun e!356757 () Bool)

(assert (=> b!621999 (=> (not res!400836) (not e!356757))))

(assert (=> b!621999 (= e!356764 e!356757)))

(declare-fun b!622000 () Bool)

(declare-fun res!400841 () Bool)

(declare-fun e!356766 () Bool)

(assert (=> b!622000 (=> (not res!400841) (not e!356766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622000 (= res!400841 (validKeyInArray!0 (select (arr!18071 a!2986) j!136)))))

(declare-fun b!622001 () Bool)

(declare-fun e!356754 () Unit!20838)

(declare-fun Unit!20843 () Unit!20838)

(assert (=> b!622001 (= e!356754 Unit!20843)))

(declare-fun b!622002 () Bool)

(declare-fun e!356753 () Unit!20838)

(declare-fun Unit!20844 () Unit!20838)

(assert (=> b!622002 (= e!356753 Unit!20844)))

(declare-fun b!622003 () Bool)

(assert (=> b!622003 false))

(declare-fun lt!288021 () Unit!20838)

(declare-datatypes ((List!12112 0))(
  ( (Nil!12109) (Cons!12108 (h!13153 (_ BitVec 64)) (t!18340 List!12112)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37650 (_ BitVec 64) (_ BitVec 32) List!12112) Unit!20838)

(assert (=> b!622003 (= lt!288021 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288034 (select (arr!18071 a!2986) j!136) j!136 Nil!12109))))

(declare-fun arrayNoDuplicates!0 (array!37650 (_ BitVec 32) List!12112) Bool)

(assert (=> b!622003 (arrayNoDuplicates!0 lt!288034 j!136 Nil!12109)))

(declare-fun lt!288024 () Unit!20838)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37650 (_ BitVec 32) (_ BitVec 32)) Unit!20838)

(assert (=> b!622003 (= lt!288024 (lemmaNoDuplicateFromThenFromBigger!0 lt!288034 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622003 (arrayNoDuplicates!0 lt!288034 #b00000000000000000000000000000000 Nil!12109)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!288029 () Unit!20838)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12112) Unit!20838)

(assert (=> b!622003 (= lt!288029 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12109))))

(assert (=> b!622003 (arrayContainsKey!0 lt!288034 (select (arr!18071 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288027 () Unit!20838)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20838)

(assert (=> b!622003 (= lt!288027 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288034 (select (arr!18071 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20845 () Unit!20838)

(assert (=> b!622003 (= e!356765 Unit!20845)))

(declare-fun b!622004 () Bool)

(declare-fun Unit!20846 () Unit!20838)

(assert (=> b!622004 (= e!356754 Unit!20846)))

(declare-fun res!400840 () Bool)

(assert (=> b!622004 (= res!400840 (= (select (store (arr!18071 a!2986) i!1108 k!1786) index!984) (select (arr!18071 a!2986) j!136)))))

(assert (=> b!622004 (=> (not res!400840) (not e!356762))))

(assert (=> b!622004 e!356762))

(declare-fun c!70946 () Bool)

(assert (=> b!622004 (= c!70946 (bvslt j!136 index!984))))

(declare-fun lt!288033 () Unit!20838)

(assert (=> b!622004 (= lt!288033 e!356765)))

(declare-fun c!70948 () Bool)

(assert (=> b!622004 (= c!70948 (bvslt index!984 j!136))))

(declare-fun lt!288020 () Unit!20838)

(assert (=> b!622004 (= lt!288020 e!356753)))

(assert (=> b!622004 false))

(declare-fun res!400848 () Bool)

(assert (=> start!56180 (=> (not res!400848) (not e!356766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56180 (= res!400848 (validMask!0 mask!3053))))

(assert (=> start!56180 e!356766))

(assert (=> start!56180 true))

(declare-fun array_inv!13867 (array!37650) Bool)

(assert (=> start!56180 (array_inv!13867 a!2986)))

(declare-fun b!621993 () Bool)

(declare-fun e!356760 () Bool)

(assert (=> b!621993 (= e!356760 (not true))))

(declare-fun lt!288036 () Unit!20838)

(assert (=> b!621993 (= lt!288036 e!356754)))

(declare-fun c!70949 () Bool)

(declare-datatypes ((SeekEntryResult!6511 0))(
  ( (MissingZero!6511 (index!28328 (_ BitVec 32))) (Found!6511 (index!28329 (_ BitVec 32))) (Intermediate!6511 (undefined!7323 Bool) (index!28330 (_ BitVec 32)) (x!57095 (_ BitVec 32))) (Undefined!6511) (MissingVacant!6511 (index!28331 (_ BitVec 32))) )
))
(declare-fun lt!288030 () SeekEntryResult!6511)

(assert (=> b!621993 (= c!70949 (= lt!288030 (Found!6511 index!984)))))

(declare-fun lt!288035 () Unit!20838)

(assert (=> b!621993 (= lt!288035 e!356763)))

(declare-fun c!70947 () Bool)

(assert (=> b!621993 (= c!70947 (= lt!288030 Undefined!6511))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!288025 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37650 (_ BitVec 32)) SeekEntryResult!6511)

(assert (=> b!621993 (= lt!288030 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288025 lt!288034 mask!3053))))

(declare-fun e!356756 () Bool)

(assert (=> b!621993 e!356756))

(declare-fun res!400847 () Bool)

(assert (=> b!621993 (=> (not res!400847) (not e!356756))))

(declare-fun lt!288019 () (_ BitVec 32))

(declare-fun lt!288032 () SeekEntryResult!6511)

(assert (=> b!621993 (= res!400847 (= lt!288032 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288019 vacantSpotIndex!68 lt!288025 lt!288034 mask!3053)))))

(assert (=> b!621993 (= lt!288032 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288019 vacantSpotIndex!68 (select (arr!18071 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621993 (= lt!288025 (select (store (arr!18071 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!288018 () Unit!20838)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37650 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20838)

(assert (=> b!621993 (= lt!288018 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288019 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621993 (= lt!288019 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun e!356761 () Bool)

(declare-fun b!622005 () Bool)

(assert (=> b!622005 (= e!356761 (arrayContainsKey!0 lt!288034 (select (arr!18071 a!2986) j!136) index!984))))

(declare-fun b!622006 () Bool)

(assert (=> b!622006 false))

(declare-fun lt!288031 () Unit!20838)

(assert (=> b!622006 (= lt!288031 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288034 (select (arr!18071 a!2986) j!136) index!984 Nil!12109))))

(assert (=> b!622006 (arrayNoDuplicates!0 lt!288034 index!984 Nil!12109)))

(declare-fun lt!288023 () Unit!20838)

(assert (=> b!622006 (= lt!288023 (lemmaNoDuplicateFromThenFromBigger!0 lt!288034 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622006 (arrayNoDuplicates!0 lt!288034 #b00000000000000000000000000000000 Nil!12109)))

(declare-fun lt!288028 () Unit!20838)

(assert (=> b!622006 (= lt!288028 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12109))))

(assert (=> b!622006 (arrayContainsKey!0 lt!288034 (select (arr!18071 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288026 () Unit!20838)

(assert (=> b!622006 (= lt!288026 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288034 (select (arr!18071 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622006 e!356761))

(declare-fun res!400845 () Bool)

(assert (=> b!622006 (=> (not res!400845) (not e!356761))))

(assert (=> b!622006 (= res!400845 (arrayContainsKey!0 lt!288034 (select (arr!18071 a!2986) j!136) j!136))))

(declare-fun Unit!20847 () Unit!20838)

(assert (=> b!622006 (= e!356753 Unit!20847)))

(declare-fun b!622007 () Bool)

(declare-fun res!400844 () Bool)

(assert (=> b!622007 (=> (not res!400844) (not e!356755))))

(assert (=> b!622007 (= res!400844 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12109))))

(declare-fun b!622008 () Bool)

(declare-fun res!400850 () Bool)

(assert (=> b!622008 (=> (not res!400850) (not e!356766))))

(assert (=> b!622008 (= res!400850 (and (= (size!18435 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18435 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18435 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622009 () Bool)

(declare-fun lt!288022 () SeekEntryResult!6511)

(assert (=> b!622009 (= e!356756 (= lt!288022 lt!288032))))

(declare-fun b!622010 () Bool)

(declare-fun res!400849 () Bool)

(assert (=> b!622010 (=> (not res!400849) (not e!356766))))

(assert (=> b!622010 (= res!400849 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622011 () Bool)

(assert (=> b!622011 (= e!356757 (arrayContainsKey!0 lt!288034 (select (arr!18071 a!2986) j!136) index!984))))

(declare-fun b!622012 () Bool)

(declare-fun e!356759 () Bool)

(assert (=> b!622012 (= e!356759 e!356760)))

(declare-fun res!400838 () Bool)

(assert (=> b!622012 (=> (not res!400838) (not e!356760))))

(assert (=> b!622012 (= res!400838 (and (= lt!288022 (Found!6511 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18071 a!2986) index!984) (select (arr!18071 a!2986) j!136))) (not (= (select (arr!18071 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!622012 (= lt!288022 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18071 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622013 () Bool)

(assert (=> b!622013 (= e!356755 e!356759)))

(declare-fun res!400846 () Bool)

(assert (=> b!622013 (=> (not res!400846) (not e!356759))))

(assert (=> b!622013 (= res!400846 (= (select (store (arr!18071 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622013 (= lt!288034 (array!37651 (store (arr!18071 a!2986) i!1108 k!1786) (size!18435 a!2986)))))

(declare-fun b!622014 () Bool)

(assert (=> b!622014 (= e!356766 e!356755)))

(declare-fun res!400837 () Bool)

(assert (=> b!622014 (=> (not res!400837) (not e!356755))))

(declare-fun lt!288037 () SeekEntryResult!6511)

(assert (=> b!622014 (= res!400837 (or (= lt!288037 (MissingZero!6511 i!1108)) (= lt!288037 (MissingVacant!6511 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37650 (_ BitVec 32)) SeekEntryResult!6511)

(assert (=> b!622014 (= lt!288037 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!622015 () Bool)

(declare-fun res!400842 () Bool)

(assert (=> b!622015 (=> (not res!400842) (not e!356766))))

(assert (=> b!622015 (= res!400842 (validKeyInArray!0 k!1786))))

(declare-fun b!622016 () Bool)

(declare-fun res!400835 () Bool)

(assert (=> b!622016 (=> (not res!400835) (not e!356755))))

(assert (=> b!622016 (= res!400835 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18071 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56180 res!400848) b!622008))

(assert (= (and b!622008 res!400850) b!622000))

(assert (= (and b!622000 res!400841) b!622015))

(assert (= (and b!622015 res!400842) b!622010))

(assert (= (and b!622010 res!400849) b!622014))

(assert (= (and b!622014 res!400837) b!621997))

(assert (= (and b!621997 res!400839) b!622007))

(assert (= (and b!622007 res!400844) b!622016))

(assert (= (and b!622016 res!400835) b!622013))

(assert (= (and b!622013 res!400846) b!622012))

(assert (= (and b!622012 res!400838) b!621993))

(assert (= (and b!621993 res!400847) b!622009))

(assert (= (and b!621993 c!70947) b!621994))

(assert (= (and b!621993 (not c!70947)) b!621995))

(assert (= (and b!621993 c!70949) b!622004))

(assert (= (and b!621993 (not c!70949)) b!622001))

(assert (= (and b!622004 res!400840) b!621996))

(assert (= (and b!621996 (not res!400843)) b!621999))

(assert (= (and b!621999 res!400836) b!622011))

(assert (= (and b!622004 c!70946) b!622003))

(assert (= (and b!622004 (not c!70946)) b!621998))

(assert (= (and b!622004 c!70948) b!622006))

(assert (= (and b!622004 (not c!70948)) b!622002))

(assert (= (and b!622006 res!400845) b!622005))

(declare-fun m!597871 () Bool)

(assert (=> start!56180 m!597871))

(declare-fun m!597873 () Bool)

(assert (=> start!56180 m!597873))

(declare-fun m!597875 () Bool)

(assert (=> b!622006 m!597875))

(declare-fun m!597877 () Bool)

(assert (=> b!622006 m!597877))

(assert (=> b!622006 m!597875))

(declare-fun m!597879 () Bool)

(assert (=> b!622006 m!597879))

(assert (=> b!622006 m!597875))

(declare-fun m!597881 () Bool)

(assert (=> b!622006 m!597881))

(assert (=> b!622006 m!597875))

(declare-fun m!597883 () Bool)

(assert (=> b!622006 m!597883))

(declare-fun m!597885 () Bool)

(assert (=> b!622006 m!597885))

(declare-fun m!597887 () Bool)

(assert (=> b!622006 m!597887))

(declare-fun m!597889 () Bool)

(assert (=> b!622006 m!597889))

(assert (=> b!622006 m!597875))

(declare-fun m!597891 () Bool)

(assert (=> b!622006 m!597891))

(assert (=> b!621999 m!597875))

(assert (=> b!621999 m!597875))

(assert (=> b!621999 m!597881))

(assert (=> b!622000 m!597875))

(assert (=> b!622000 m!597875))

(declare-fun m!597893 () Bool)

(assert (=> b!622000 m!597893))

(declare-fun m!597895 () Bool)

(assert (=> b!622012 m!597895))

(assert (=> b!622012 m!597875))

(assert (=> b!622012 m!597875))

(declare-fun m!597897 () Bool)

(assert (=> b!622012 m!597897))

(declare-fun m!597899 () Bool)

(assert (=> b!622003 m!597899))

(assert (=> b!622003 m!597875))

(assert (=> b!622003 m!597875))

(declare-fun m!597901 () Bool)

(assert (=> b!622003 m!597901))

(declare-fun m!597903 () Bool)

(assert (=> b!622003 m!597903))

(assert (=> b!622003 m!597875))

(declare-fun m!597905 () Bool)

(assert (=> b!622003 m!597905))

(assert (=> b!622003 m!597887))

(assert (=> b!622003 m!597877))

(assert (=> b!622003 m!597875))

(declare-fun m!597907 () Bool)

(assert (=> b!622003 m!597907))

(declare-fun m!597909 () Bool)

(assert (=> b!622013 m!597909))

(declare-fun m!597911 () Bool)

(assert (=> b!622013 m!597911))

(declare-fun m!597913 () Bool)

(assert (=> b!622010 m!597913))

(assert (=> b!622004 m!597909))

(declare-fun m!597915 () Bool)

(assert (=> b!622004 m!597915))

(assert (=> b!622004 m!597875))

(assert (=> b!622011 m!597875))

(assert (=> b!622011 m!597875))

(declare-fun m!597917 () Bool)

(assert (=> b!622011 m!597917))

(declare-fun m!597919 () Bool)

(assert (=> b!621993 m!597919))

(declare-fun m!597921 () Bool)

(assert (=> b!621993 m!597921))

(assert (=> b!621993 m!597875))

(assert (=> b!621993 m!597909))

(declare-fun m!597923 () Bool)

(assert (=> b!621993 m!597923))

(declare-fun m!597925 () Bool)

(assert (=> b!621993 m!597925))

(declare-fun m!597927 () Bool)

(assert (=> b!621993 m!597927))

(assert (=> b!621993 m!597875))

(declare-fun m!597929 () Bool)

(assert (=> b!621993 m!597929))

(declare-fun m!597931 () Bool)

(assert (=> b!622016 m!597931))

(assert (=> b!622005 m!597875))

(assert (=> b!622005 m!597875))

(assert (=> b!622005 m!597917))

(declare-fun m!597933 () Bool)

(assert (=> b!622014 m!597933))

(declare-fun m!597935 () Bool)

(assert (=> b!622007 m!597935))

(declare-fun m!597937 () Bool)

(assert (=> b!621997 m!597937))

(declare-fun m!597939 () Bool)

(assert (=> b!622015 m!597939))

(push 1)

