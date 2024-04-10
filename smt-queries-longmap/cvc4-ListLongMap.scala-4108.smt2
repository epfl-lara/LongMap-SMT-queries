; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56150 () Bool)

(assert start!56150)

(declare-fun b!620913 () Bool)

(declare-fun res!400129 () Bool)

(declare-fun e!356130 () Bool)

(assert (=> b!620913 (=> (not res!400129) (not e!356130))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37620 0))(
  ( (array!37621 (arr!18056 (Array (_ BitVec 32) (_ BitVec 64))) (size!18420 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37620)

(assert (=> b!620913 (= res!400129 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18056 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620914 () Bool)

(declare-fun e!356123 () Bool)

(declare-fun e!356133 () Bool)

(assert (=> b!620914 (= e!356123 e!356133)))

(declare-fun res!400126 () Bool)

(assert (=> b!620914 (=> (not res!400126) (not e!356133))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6496 0))(
  ( (MissingZero!6496 (index!28268 (_ BitVec 32))) (Found!6496 (index!28269 (_ BitVec 32))) (Intermediate!6496 (undefined!7308 Bool) (index!28270 (_ BitVec 32)) (x!57040 (_ BitVec 32))) (Undefined!6496) (MissingVacant!6496 (index!28271 (_ BitVec 32))) )
))
(declare-fun lt!287131 () SeekEntryResult!6496)

(assert (=> b!620914 (= res!400126 (and (= lt!287131 (Found!6496 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18056 a!2986) index!984) (select (arr!18056 a!2986) j!136))) (not (= (select (arr!18056 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37620 (_ BitVec 32)) SeekEntryResult!6496)

(assert (=> b!620914 (= lt!287131 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18056 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!400124 () Bool)

(declare-fun lt!287121 () array!37620)

(declare-fun b!620915 () Bool)

(declare-fun arrayContainsKey!0 (array!37620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620915 (= res!400124 (arrayContainsKey!0 lt!287121 (select (arr!18056 a!2986) j!136) j!136))))

(declare-fun e!356131 () Bool)

(assert (=> b!620915 (=> (not res!400124) (not e!356131))))

(declare-fun e!356125 () Bool)

(assert (=> b!620915 (= e!356125 e!356131)))

(declare-fun b!620916 () Bool)

(assert (=> b!620916 (= e!356130 e!356123)))

(declare-fun res!400115 () Bool)

(assert (=> b!620916 (=> (not res!400115) (not e!356123))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!620916 (= res!400115 (= (select (store (arr!18056 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620916 (= lt!287121 (array!37621 (store (arr!18056 a!2986) i!1108 k!1786) (size!18420 a!2986)))))

(declare-fun b!620917 () Bool)

(declare-fun res!400127 () Bool)

(declare-fun e!356124 () Bool)

(assert (=> b!620917 (=> (not res!400127) (not e!356124))))

(assert (=> b!620917 (= res!400127 (and (= (size!18420 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18420 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18420 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620918 () Bool)

(declare-datatypes ((Unit!20688 0))(
  ( (Unit!20689) )
))
(declare-fun e!356132 () Unit!20688)

(declare-fun Unit!20690 () Unit!20688)

(assert (=> b!620918 (= e!356132 Unit!20690)))

(declare-fun res!400118 () Bool)

(assert (=> b!620918 (= res!400118 (= (select (store (arr!18056 a!2986) i!1108 k!1786) index!984) (select (arr!18056 a!2986) j!136)))))

(declare-fun e!356126 () Bool)

(assert (=> b!620918 (=> (not res!400118) (not e!356126))))

(assert (=> b!620918 e!356126))

(declare-fun c!70766 () Bool)

(assert (=> b!620918 (= c!70766 (bvslt j!136 index!984))))

(declare-fun lt!287118 () Unit!20688)

(declare-fun e!356127 () Unit!20688)

(assert (=> b!620918 (= lt!287118 e!356127)))

(declare-fun c!70769 () Bool)

(assert (=> b!620918 (= c!70769 (bvslt index!984 j!136))))

(declare-fun lt!287126 () Unit!20688)

(declare-fun e!356129 () Unit!20688)

(assert (=> b!620918 (= lt!287126 e!356129)))

(assert (=> b!620918 false))

(declare-fun b!620919 () Bool)

(declare-fun Unit!20691 () Unit!20688)

(assert (=> b!620919 (= e!356132 Unit!20691)))

(declare-fun b!620920 () Bool)

(declare-fun e!356135 () Unit!20688)

(declare-fun Unit!20692 () Unit!20688)

(assert (=> b!620920 (= e!356135 Unit!20692)))

(assert (=> b!620920 false))

(declare-fun b!620921 () Bool)

(declare-fun res!400116 () Bool)

(assert (=> b!620921 (=> (not res!400116) (not e!356124))))

(assert (=> b!620921 (= res!400116 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!400128 () Bool)

(assert (=> start!56150 (=> (not res!400128) (not e!356124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56150 (= res!400128 (validMask!0 mask!3053))))

(assert (=> start!56150 e!356124))

(assert (=> start!56150 true))

(declare-fun array_inv!13852 (array!37620) Bool)

(assert (=> start!56150 (array_inv!13852 a!2986)))

(declare-fun b!620922 () Bool)

(assert (=> b!620922 false))

(declare-fun lt!287129 () Unit!20688)

(declare-datatypes ((List!12097 0))(
  ( (Nil!12094) (Cons!12093 (h!13138 (_ BitVec 64)) (t!18325 List!12097)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37620 (_ BitVec 64) (_ BitVec 32) List!12097) Unit!20688)

(assert (=> b!620922 (= lt!287129 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287121 (select (arr!18056 a!2986) j!136) index!984 Nil!12094))))

(declare-fun arrayNoDuplicates!0 (array!37620 (_ BitVec 32) List!12097) Bool)

(assert (=> b!620922 (arrayNoDuplicates!0 lt!287121 index!984 Nil!12094)))

(declare-fun lt!287136 () Unit!20688)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37620 (_ BitVec 32) (_ BitVec 32)) Unit!20688)

(assert (=> b!620922 (= lt!287136 (lemmaNoDuplicateFromThenFromBigger!0 lt!287121 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620922 (arrayNoDuplicates!0 lt!287121 #b00000000000000000000000000000000 Nil!12094)))

(declare-fun lt!287124 () Unit!20688)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37620 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12097) Unit!20688)

(assert (=> b!620922 (= lt!287124 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12094))))

(assert (=> b!620922 (arrayContainsKey!0 lt!287121 (select (arr!18056 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287123 () Unit!20688)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37620 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20688)

(assert (=> b!620922 (= lt!287123 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287121 (select (arr!18056 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356128 () Bool)

(assert (=> b!620922 e!356128))

(declare-fun res!400123 () Bool)

(assert (=> b!620922 (=> (not res!400123) (not e!356128))))

(assert (=> b!620922 (= res!400123 (arrayContainsKey!0 lt!287121 (select (arr!18056 a!2986) j!136) j!136))))

(declare-fun Unit!20693 () Unit!20688)

(assert (=> b!620922 (= e!356129 Unit!20693)))

(declare-fun b!620923 () Bool)

(declare-fun e!356136 () Bool)

(declare-fun lt!287125 () SeekEntryResult!6496)

(assert (=> b!620923 (= e!356136 (= lt!287131 lt!287125))))

(declare-fun b!620924 () Bool)

(declare-fun res!400119 () Bool)

(assert (=> b!620924 (=> (not res!400119) (not e!356130))))

(assert (=> b!620924 (= res!400119 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12094))))

(declare-fun b!620925 () Bool)

(declare-fun Unit!20694 () Unit!20688)

(assert (=> b!620925 (= e!356135 Unit!20694)))

(declare-fun b!620926 () Bool)

(assert (=> b!620926 false))

(declare-fun lt!287137 () Unit!20688)

(assert (=> b!620926 (= lt!287137 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287121 (select (arr!18056 a!2986) j!136) j!136 Nil!12094))))

(assert (=> b!620926 (arrayNoDuplicates!0 lt!287121 j!136 Nil!12094)))

(declare-fun lt!287130 () Unit!20688)

(assert (=> b!620926 (= lt!287130 (lemmaNoDuplicateFromThenFromBigger!0 lt!287121 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620926 (arrayNoDuplicates!0 lt!287121 #b00000000000000000000000000000000 Nil!12094)))

(declare-fun lt!287135 () Unit!20688)

(assert (=> b!620926 (= lt!287135 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12094))))

(assert (=> b!620926 (arrayContainsKey!0 lt!287121 (select (arr!18056 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287119 () Unit!20688)

(assert (=> b!620926 (= lt!287119 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287121 (select (arr!18056 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20695 () Unit!20688)

(assert (=> b!620926 (= e!356127 Unit!20695)))

(declare-fun b!620927 () Bool)

(declare-fun res!400120 () Bool)

(assert (=> b!620927 (=> (not res!400120) (not e!356124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620927 (= res!400120 (validKeyInArray!0 k!1786))))

(declare-fun b!620928 () Bool)

(assert (=> b!620928 (= e!356128 (arrayContainsKey!0 lt!287121 (select (arr!18056 a!2986) j!136) index!984))))

(declare-fun b!620929 () Bool)

(declare-fun Unit!20696 () Unit!20688)

(assert (=> b!620929 (= e!356129 Unit!20696)))

(declare-fun b!620930 () Bool)

(declare-fun res!400117 () Bool)

(assert (=> b!620930 (=> (not res!400117) (not e!356130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37620 (_ BitVec 32)) Bool)

(assert (=> b!620930 (= res!400117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620931 () Bool)

(assert (=> b!620931 (= e!356133 (not true))))

(declare-fun lt!287134 () Unit!20688)

(assert (=> b!620931 (= lt!287134 e!356132)))

(declare-fun c!70768 () Bool)

(declare-fun lt!287133 () SeekEntryResult!6496)

(assert (=> b!620931 (= c!70768 (= lt!287133 (Found!6496 index!984)))))

(declare-fun lt!287122 () Unit!20688)

(assert (=> b!620931 (= lt!287122 e!356135)))

(declare-fun c!70767 () Bool)

(assert (=> b!620931 (= c!70767 (= lt!287133 Undefined!6496))))

(declare-fun lt!287132 () (_ BitVec 64))

(assert (=> b!620931 (= lt!287133 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287132 lt!287121 mask!3053))))

(assert (=> b!620931 e!356136))

(declare-fun res!400130 () Bool)

(assert (=> b!620931 (=> (not res!400130) (not e!356136))))

(declare-fun lt!287128 () (_ BitVec 32))

(assert (=> b!620931 (= res!400130 (= lt!287125 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287128 vacantSpotIndex!68 lt!287132 lt!287121 mask!3053)))))

(assert (=> b!620931 (= lt!287125 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287128 vacantSpotIndex!68 (select (arr!18056 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620931 (= lt!287132 (select (store (arr!18056 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!287127 () Unit!20688)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37620 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20688)

(assert (=> b!620931 (= lt!287127 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287128 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620931 (= lt!287128 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620932 () Bool)

(declare-fun res!400121 () Bool)

(assert (=> b!620932 (= res!400121 (bvsge j!136 index!984))))

(assert (=> b!620932 (=> res!400121 e!356125)))

(assert (=> b!620932 (= e!356126 e!356125)))

(declare-fun b!620933 () Bool)

(declare-fun Unit!20697 () Unit!20688)

(assert (=> b!620933 (= e!356127 Unit!20697)))

(declare-fun b!620934 () Bool)

(assert (=> b!620934 (= e!356124 e!356130)))

(declare-fun res!400122 () Bool)

(assert (=> b!620934 (=> (not res!400122) (not e!356130))))

(declare-fun lt!287120 () SeekEntryResult!6496)

(assert (=> b!620934 (= res!400122 (or (= lt!287120 (MissingZero!6496 i!1108)) (= lt!287120 (MissingVacant!6496 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37620 (_ BitVec 32)) SeekEntryResult!6496)

(assert (=> b!620934 (= lt!287120 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!620935 () Bool)

(assert (=> b!620935 (= e!356131 (arrayContainsKey!0 lt!287121 (select (arr!18056 a!2986) j!136) index!984))))

(declare-fun b!620936 () Bool)

(declare-fun res!400125 () Bool)

(assert (=> b!620936 (=> (not res!400125) (not e!356124))))

(assert (=> b!620936 (= res!400125 (validKeyInArray!0 (select (arr!18056 a!2986) j!136)))))

(assert (= (and start!56150 res!400128) b!620917))

(assert (= (and b!620917 res!400127) b!620936))

(assert (= (and b!620936 res!400125) b!620927))

(assert (= (and b!620927 res!400120) b!620921))

(assert (= (and b!620921 res!400116) b!620934))

(assert (= (and b!620934 res!400122) b!620930))

(assert (= (and b!620930 res!400117) b!620924))

(assert (= (and b!620924 res!400119) b!620913))

(assert (= (and b!620913 res!400129) b!620916))

(assert (= (and b!620916 res!400115) b!620914))

(assert (= (and b!620914 res!400126) b!620931))

(assert (= (and b!620931 res!400130) b!620923))

(assert (= (and b!620931 c!70767) b!620920))

(assert (= (and b!620931 (not c!70767)) b!620925))

(assert (= (and b!620931 c!70768) b!620918))

(assert (= (and b!620931 (not c!70768)) b!620919))

(assert (= (and b!620918 res!400118) b!620932))

(assert (= (and b!620932 (not res!400121)) b!620915))

(assert (= (and b!620915 res!400124) b!620935))

(assert (= (and b!620918 c!70766) b!620926))

(assert (= (and b!620918 (not c!70766)) b!620933))

(assert (= (and b!620918 c!70769) b!620922))

(assert (= (and b!620918 (not c!70769)) b!620929))

(assert (= (and b!620922 res!400123) b!620928))

(declare-fun m!596821 () Bool)

(assert (=> b!620913 m!596821))

(declare-fun m!596823 () Bool)

(assert (=> b!620915 m!596823))

(assert (=> b!620915 m!596823))

(declare-fun m!596825 () Bool)

(assert (=> b!620915 m!596825))

(declare-fun m!596827 () Bool)

(assert (=> b!620934 m!596827))

(declare-fun m!596829 () Bool)

(assert (=> b!620930 m!596829))

(assert (=> b!620935 m!596823))

(assert (=> b!620935 m!596823))

(declare-fun m!596831 () Bool)

(assert (=> b!620935 m!596831))

(assert (=> b!620922 m!596823))

(assert (=> b!620922 m!596823))

(assert (=> b!620922 m!596825))

(assert (=> b!620922 m!596823))

(declare-fun m!596833 () Bool)

(assert (=> b!620922 m!596833))

(declare-fun m!596835 () Bool)

(assert (=> b!620922 m!596835))

(assert (=> b!620922 m!596823))

(declare-fun m!596837 () Bool)

(assert (=> b!620922 m!596837))

(declare-fun m!596839 () Bool)

(assert (=> b!620922 m!596839))

(declare-fun m!596841 () Bool)

(assert (=> b!620922 m!596841))

(assert (=> b!620922 m!596823))

(declare-fun m!596843 () Bool)

(assert (=> b!620922 m!596843))

(declare-fun m!596845 () Bool)

(assert (=> b!620922 m!596845))

(declare-fun m!596847 () Bool)

(assert (=> b!620916 m!596847))

(declare-fun m!596849 () Bool)

(assert (=> b!620916 m!596849))

(declare-fun m!596851 () Bool)

(assert (=> start!56150 m!596851))

(declare-fun m!596853 () Bool)

(assert (=> start!56150 m!596853))

(declare-fun m!596855 () Bool)

(assert (=> b!620931 m!596855))

(declare-fun m!596857 () Bool)

(assert (=> b!620931 m!596857))

(assert (=> b!620931 m!596823))

(assert (=> b!620931 m!596847))

(assert (=> b!620931 m!596823))

(declare-fun m!596859 () Bool)

(assert (=> b!620931 m!596859))

(declare-fun m!596861 () Bool)

(assert (=> b!620931 m!596861))

(declare-fun m!596863 () Bool)

(assert (=> b!620931 m!596863))

(declare-fun m!596865 () Bool)

(assert (=> b!620931 m!596865))

(assert (=> b!620926 m!596823))

(assert (=> b!620926 m!596823))

(declare-fun m!596867 () Bool)

(assert (=> b!620926 m!596867))

(assert (=> b!620926 m!596823))

(declare-fun m!596869 () Bool)

(assert (=> b!620926 m!596869))

(declare-fun m!596871 () Bool)

(assert (=> b!620926 m!596871))

(assert (=> b!620926 m!596823))

(declare-fun m!596873 () Bool)

(assert (=> b!620926 m!596873))

(declare-fun m!596875 () Bool)

(assert (=> b!620926 m!596875))

(assert (=> b!620926 m!596841))

(assert (=> b!620926 m!596845))

(assert (=> b!620936 m!596823))

(assert (=> b!620936 m!596823))

(declare-fun m!596877 () Bool)

(assert (=> b!620936 m!596877))

(declare-fun m!596879 () Bool)

(assert (=> b!620921 m!596879))

(assert (=> b!620918 m!596847))

(declare-fun m!596881 () Bool)

(assert (=> b!620918 m!596881))

(assert (=> b!620918 m!596823))

(assert (=> b!620928 m!596823))

(assert (=> b!620928 m!596823))

(assert (=> b!620928 m!596831))

(declare-fun m!596883 () Bool)

(assert (=> b!620914 m!596883))

(assert (=> b!620914 m!596823))

(assert (=> b!620914 m!596823))

(declare-fun m!596885 () Bool)

(assert (=> b!620914 m!596885))

(declare-fun m!596887 () Bool)

(assert (=> b!620924 m!596887))

(declare-fun m!596889 () Bool)

(assert (=> b!620927 m!596889))

(push 1)

