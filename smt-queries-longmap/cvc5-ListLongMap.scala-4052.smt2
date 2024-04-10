; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55540 () Bool)

(assert start!55540)

(declare-fun b!607053 () Bool)

(declare-datatypes ((Unit!19336 0))(
  ( (Unit!19337) )
))
(declare-fun e!347635 () Unit!19336)

(declare-fun Unit!19338 () Unit!19336)

(assert (=> b!607053 (= e!347635 Unit!19338)))

(declare-fun b!607054 () Bool)

(declare-fun e!347626 () Bool)

(declare-fun e!347632 () Bool)

(assert (=> b!607054 (= e!347626 e!347632)))

(declare-fun res!389945 () Bool)

(assert (=> b!607054 (=> res!389945 e!347632)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!607054 (= res!389945 (bvsge index!984 j!136))))

(declare-fun lt!277082 () Unit!19336)

(declare-fun e!347624 () Unit!19336)

(assert (=> b!607054 (= lt!277082 e!347624)))

(declare-fun c!68929 () Bool)

(assert (=> b!607054 (= c!68929 (bvslt j!136 index!984))))

(declare-fun b!607056 () Bool)

(declare-fun res!389937 () Bool)

(declare-fun e!347623 () Bool)

(assert (=> b!607056 (=> res!389937 e!347623)))

(declare-datatypes ((List!11927 0))(
  ( (Nil!11924) (Cons!11923 (h!12968 (_ BitVec 64)) (t!18155 List!11927)) )
))
(declare-fun contains!3003 (List!11927 (_ BitVec 64)) Bool)

(assert (=> b!607056 (= res!389937 (contains!3003 Nil!11924 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607057 () Bool)

(declare-fun res!389935 () Bool)

(declare-fun e!347631 () Bool)

(assert (=> b!607057 (=> (not res!389935) (not e!347631))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!37271 0))(
  ( (array!37272 (arr!17886 (Array (_ BitVec 32) (_ BitVec 64))) (size!18250 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37271)

(assert (=> b!607057 (= res!389935 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17886 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607058 () Bool)

(declare-fun e!347636 () Bool)

(declare-fun e!347627 () Bool)

(assert (=> b!607058 (= e!347636 e!347627)))

(declare-fun res!389929 () Bool)

(assert (=> b!607058 (=> (not res!389929) (not e!347627))))

(declare-datatypes ((SeekEntryResult!6326 0))(
  ( (MissingZero!6326 (index!27579 (_ BitVec 32))) (Found!6326 (index!27580 (_ BitVec 32))) (Intermediate!6326 (undefined!7138 Bool) (index!27581 (_ BitVec 32)) (x!56395 (_ BitVec 32))) (Undefined!6326) (MissingVacant!6326 (index!27582 (_ BitVec 32))) )
))
(declare-fun lt!277092 () SeekEntryResult!6326)

(assert (=> b!607058 (= res!389929 (and (= lt!277092 (Found!6326 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17886 a!2986) index!984) (select (arr!17886 a!2986) j!136))) (not (= (select (arr!17886 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37271 (_ BitVec 32)) SeekEntryResult!6326)

(assert (=> b!607058 (= lt!277092 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17886 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607059 () Bool)

(assert (=> b!607059 (= e!347631 e!347636)))

(declare-fun res!389933 () Bool)

(assert (=> b!607059 (=> (not res!389933) (not e!347636))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!607059 (= res!389933 (= (select (store (arr!17886 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!277081 () array!37271)

(assert (=> b!607059 (= lt!277081 (array!37272 (store (arr!17886 a!2986) i!1108 k!1786) (size!18250 a!2986)))))

(declare-fun b!607060 () Bool)

(declare-fun res!389948 () Bool)

(declare-fun e!347629 () Bool)

(assert (=> b!607060 (=> (not res!389948) (not e!347629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607060 (= res!389948 (validKeyInArray!0 (select (arr!17886 a!2986) j!136)))))

(declare-fun b!607061 () Bool)

(declare-fun e!347628 () Bool)

(assert (=> b!607061 (= e!347627 (not e!347628))))

(declare-fun res!389936 () Bool)

(assert (=> b!607061 (=> res!389936 e!347628)))

(declare-fun lt!277089 () SeekEntryResult!6326)

(assert (=> b!607061 (= res!389936 (not (= lt!277089 (Found!6326 index!984))))))

(declare-fun lt!277095 () Unit!19336)

(assert (=> b!607061 (= lt!277095 e!347635)))

(declare-fun c!68930 () Bool)

(assert (=> b!607061 (= c!68930 (= lt!277089 Undefined!6326))))

(declare-fun lt!277096 () (_ BitVec 64))

(assert (=> b!607061 (= lt!277089 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277096 lt!277081 mask!3053))))

(declare-fun e!347634 () Bool)

(assert (=> b!607061 e!347634))

(declare-fun res!389950 () Bool)

(assert (=> b!607061 (=> (not res!389950) (not e!347634))))

(declare-fun lt!277080 () (_ BitVec 32))

(declare-fun lt!277085 () SeekEntryResult!6326)

(assert (=> b!607061 (= res!389950 (= lt!277085 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277080 vacantSpotIndex!68 lt!277096 lt!277081 mask!3053)))))

(assert (=> b!607061 (= lt!277085 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277080 vacantSpotIndex!68 (select (arr!17886 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!607061 (= lt!277096 (select (store (arr!17886 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!277091 () Unit!19336)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37271 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19336)

(assert (=> b!607061 (= lt!277091 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277080 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607061 (= lt!277080 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607062 () Bool)

(assert (=> b!607062 (= e!347623 true)))

(declare-fun lt!277094 () Bool)

(assert (=> b!607062 (= lt!277094 (contains!3003 Nil!11924 k!1786))))

(declare-fun b!607063 () Bool)

(declare-fun e!347637 () Bool)

(declare-fun arrayContainsKey!0 (array!37271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607063 (= e!347637 (arrayContainsKey!0 lt!277081 (select (arr!17886 a!2986) j!136) index!984))))

(declare-fun b!607064 () Bool)

(assert (=> b!607064 (= e!347628 e!347626)))

(declare-fun res!389940 () Bool)

(assert (=> b!607064 (=> res!389940 e!347626)))

(declare-fun lt!277088 () (_ BitVec 64))

(assert (=> b!607064 (= res!389940 (or (not (= (select (arr!17886 a!2986) j!136) lt!277096)) (not (= (select (arr!17886 a!2986) j!136) lt!277088))))))

(declare-fun e!347633 () Bool)

(assert (=> b!607064 e!347633))

(declare-fun res!389930 () Bool)

(assert (=> b!607064 (=> (not res!389930) (not e!347633))))

(assert (=> b!607064 (= res!389930 (= lt!277088 (select (arr!17886 a!2986) j!136)))))

(assert (=> b!607064 (= lt!277088 (select (store (arr!17886 a!2986) i!1108 k!1786) index!984))))

(declare-fun e!347625 () Bool)

(declare-fun b!607065 () Bool)

(assert (=> b!607065 (= e!347625 (arrayContainsKey!0 lt!277081 (select (arr!17886 a!2986) j!136) index!984))))

(declare-fun b!607066 () Bool)

(assert (=> b!607066 (= e!347629 e!347631)))

(declare-fun res!389939 () Bool)

(assert (=> b!607066 (=> (not res!389939) (not e!347631))))

(declare-fun lt!277090 () SeekEntryResult!6326)

(assert (=> b!607066 (= res!389939 (or (= lt!277090 (MissingZero!6326 i!1108)) (= lt!277090 (MissingVacant!6326 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37271 (_ BitVec 32)) SeekEntryResult!6326)

(assert (=> b!607066 (= lt!277090 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!607067 () Bool)

(assert (=> b!607067 (= e!347634 (= lt!277092 lt!277085))))

(declare-fun b!607068 () Bool)

(declare-fun res!389938 () Bool)

(assert (=> b!607068 (=> (not res!389938) (not e!347629))))

(assert (=> b!607068 (= res!389938 (validKeyInArray!0 k!1786))))

(declare-fun res!389947 () Bool)

(assert (=> start!55540 (=> (not res!389947) (not e!347629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55540 (= res!389947 (validMask!0 mask!3053))))

(assert (=> start!55540 e!347629))

(assert (=> start!55540 true))

(declare-fun array_inv!13682 (array!37271) Bool)

(assert (=> start!55540 (array_inv!13682 a!2986)))

(declare-fun b!607055 () Bool)

(declare-fun res!389931 () Bool)

(assert (=> b!607055 (=> (not res!389931) (not e!347631))))

(declare-fun arrayNoDuplicates!0 (array!37271 (_ BitVec 32) List!11927) Bool)

(assert (=> b!607055 (= res!389931 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11924))))

(declare-fun b!607069 () Bool)

(declare-fun res!389932 () Bool)

(assert (=> b!607069 (=> (not res!389932) (not e!347629))))

(assert (=> b!607069 (= res!389932 (and (= (size!18250 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18250 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18250 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607070 () Bool)

(declare-fun e!347622 () Bool)

(assert (=> b!607070 (= e!347622 e!347637)))

(declare-fun res!389949 () Bool)

(assert (=> b!607070 (=> (not res!389949) (not e!347637))))

(assert (=> b!607070 (= res!389949 (arrayContainsKey!0 lt!277081 (select (arr!17886 a!2986) j!136) j!136))))

(declare-fun b!607071 () Bool)

(declare-fun Unit!19339 () Unit!19336)

(assert (=> b!607071 (= e!347624 Unit!19339)))

(declare-fun lt!277083 () Unit!19336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37271 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19336)

(assert (=> b!607071 (= lt!277083 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277081 (select (arr!17886 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607071 (arrayContainsKey!0 lt!277081 (select (arr!17886 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277084 () Unit!19336)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37271 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11927) Unit!19336)

(assert (=> b!607071 (= lt!277084 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11924))))

(assert (=> b!607071 (arrayNoDuplicates!0 lt!277081 #b00000000000000000000000000000000 Nil!11924)))

(declare-fun lt!277093 () Unit!19336)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37271 (_ BitVec 32) (_ BitVec 32)) Unit!19336)

(assert (=> b!607071 (= lt!277093 (lemmaNoDuplicateFromThenFromBigger!0 lt!277081 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607071 (arrayNoDuplicates!0 lt!277081 j!136 Nil!11924)))

(declare-fun lt!277086 () Unit!19336)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37271 (_ BitVec 64) (_ BitVec 32) List!11927) Unit!19336)

(assert (=> b!607071 (= lt!277086 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277081 (select (arr!17886 a!2986) j!136) j!136 Nil!11924))))

(assert (=> b!607071 false))

(declare-fun b!607072 () Bool)

(declare-fun Unit!19340 () Unit!19336)

(assert (=> b!607072 (= e!347624 Unit!19340)))

(declare-fun b!607073 () Bool)

(declare-fun res!389941 () Bool)

(assert (=> b!607073 (=> res!389941 e!347623)))

(assert (=> b!607073 (= res!389941 (contains!3003 Nil!11924 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607074 () Bool)

(declare-fun res!389944 () Bool)

(assert (=> b!607074 (=> (not res!389944) (not e!347631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37271 (_ BitVec 32)) Bool)

(assert (=> b!607074 (= res!389944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607075 () Bool)

(assert (=> b!607075 (= e!347633 e!347622)))

(declare-fun res!389951 () Bool)

(assert (=> b!607075 (=> res!389951 e!347622)))

(assert (=> b!607075 (= res!389951 (or (not (= (select (arr!17886 a!2986) j!136) lt!277096)) (not (= (select (arr!17886 a!2986) j!136) lt!277088)) (bvsge j!136 index!984)))))

(declare-fun b!607076 () Bool)

(declare-fun res!389934 () Bool)

(assert (=> b!607076 (=> res!389934 e!347623)))

(declare-fun noDuplicate!309 (List!11927) Bool)

(assert (=> b!607076 (= res!389934 (not (noDuplicate!309 Nil!11924)))))

(declare-fun b!607077 () Bool)

(declare-fun res!389943 () Bool)

(assert (=> b!607077 (=> (not res!389943) (not e!347629))))

(assert (=> b!607077 (= res!389943 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607078 () Bool)

(assert (=> b!607078 (= e!347632 e!347623)))

(declare-fun res!389946 () Bool)

(assert (=> b!607078 (=> res!389946 e!347623)))

(assert (=> b!607078 (= res!389946 (or (bvsge (size!18250 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18250 a!2986))))))

(assert (=> b!607078 (arrayContainsKey!0 lt!277081 (select (arr!17886 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277087 () Unit!19336)

(assert (=> b!607078 (= lt!277087 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277081 (select (arr!17886 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!607078 e!347625))

(declare-fun res!389942 () Bool)

(assert (=> b!607078 (=> (not res!389942) (not e!347625))))

(assert (=> b!607078 (= res!389942 (arrayContainsKey!0 lt!277081 (select (arr!17886 a!2986) j!136) j!136))))

(declare-fun b!607079 () Bool)

(declare-fun Unit!19341 () Unit!19336)

(assert (=> b!607079 (= e!347635 Unit!19341)))

(assert (=> b!607079 false))

(assert (= (and start!55540 res!389947) b!607069))

(assert (= (and b!607069 res!389932) b!607060))

(assert (= (and b!607060 res!389948) b!607068))

(assert (= (and b!607068 res!389938) b!607077))

(assert (= (and b!607077 res!389943) b!607066))

(assert (= (and b!607066 res!389939) b!607074))

(assert (= (and b!607074 res!389944) b!607055))

(assert (= (and b!607055 res!389931) b!607057))

(assert (= (and b!607057 res!389935) b!607059))

(assert (= (and b!607059 res!389933) b!607058))

(assert (= (and b!607058 res!389929) b!607061))

(assert (= (and b!607061 res!389950) b!607067))

(assert (= (and b!607061 c!68930) b!607079))

(assert (= (and b!607061 (not c!68930)) b!607053))

(assert (= (and b!607061 (not res!389936)) b!607064))

(assert (= (and b!607064 res!389930) b!607075))

(assert (= (and b!607075 (not res!389951)) b!607070))

(assert (= (and b!607070 res!389949) b!607063))

(assert (= (and b!607064 (not res!389940)) b!607054))

(assert (= (and b!607054 c!68929) b!607071))

(assert (= (and b!607054 (not c!68929)) b!607072))

(assert (= (and b!607054 (not res!389945)) b!607078))

(assert (= (and b!607078 res!389942) b!607065))

(assert (= (and b!607078 (not res!389946)) b!607076))

(assert (= (and b!607076 (not res!389934)) b!607073))

(assert (= (and b!607073 (not res!389941)) b!607056))

(assert (= (and b!607056 (not res!389937)) b!607062))

(declare-fun m!583835 () Bool)

(assert (=> b!607078 m!583835))

(assert (=> b!607078 m!583835))

(declare-fun m!583837 () Bool)

(assert (=> b!607078 m!583837))

(assert (=> b!607078 m!583835))

(declare-fun m!583839 () Bool)

(assert (=> b!607078 m!583839))

(assert (=> b!607078 m!583835))

(declare-fun m!583841 () Bool)

(assert (=> b!607078 m!583841))

(declare-fun m!583843 () Bool)

(assert (=> b!607059 m!583843))

(declare-fun m!583845 () Bool)

(assert (=> b!607059 m!583845))

(declare-fun m!583847 () Bool)

(assert (=> b!607068 m!583847))

(declare-fun m!583849 () Bool)

(assert (=> b!607055 m!583849))

(assert (=> b!607063 m!583835))

(assert (=> b!607063 m!583835))

(declare-fun m!583851 () Bool)

(assert (=> b!607063 m!583851))

(declare-fun m!583853 () Bool)

(assert (=> b!607057 m!583853))

(assert (=> b!607065 m!583835))

(assert (=> b!607065 m!583835))

(assert (=> b!607065 m!583851))

(declare-fun m!583855 () Bool)

(assert (=> b!607071 m!583855))

(assert (=> b!607071 m!583835))

(declare-fun m!583857 () Bool)

(assert (=> b!607071 m!583857))

(assert (=> b!607071 m!583835))

(declare-fun m!583859 () Bool)

(assert (=> b!607071 m!583859))

(assert (=> b!607071 m!583835))

(declare-fun m!583861 () Bool)

(assert (=> b!607071 m!583861))

(declare-fun m!583863 () Bool)

(assert (=> b!607071 m!583863))

(assert (=> b!607071 m!583835))

(declare-fun m!583865 () Bool)

(assert (=> b!607071 m!583865))

(declare-fun m!583867 () Bool)

(assert (=> b!607071 m!583867))

(assert (=> b!607064 m!583835))

(assert (=> b!607064 m!583843))

(declare-fun m!583869 () Bool)

(assert (=> b!607064 m!583869))

(declare-fun m!583871 () Bool)

(assert (=> b!607061 m!583871))

(declare-fun m!583873 () Bool)

(assert (=> b!607061 m!583873))

(declare-fun m!583875 () Bool)

(assert (=> b!607061 m!583875))

(assert (=> b!607061 m!583835))

(assert (=> b!607061 m!583843))

(declare-fun m!583877 () Bool)

(assert (=> b!607061 m!583877))

(declare-fun m!583879 () Bool)

(assert (=> b!607061 m!583879))

(assert (=> b!607061 m!583835))

(declare-fun m!583881 () Bool)

(assert (=> b!607061 m!583881))

(declare-fun m!583883 () Bool)

(assert (=> b!607073 m!583883))

(declare-fun m!583885 () Bool)

(assert (=> b!607074 m!583885))

(declare-fun m!583887 () Bool)

(assert (=> b!607076 m!583887))

(assert (=> b!607060 m!583835))

(assert (=> b!607060 m!583835))

(declare-fun m!583889 () Bool)

(assert (=> b!607060 m!583889))

(declare-fun m!583891 () Bool)

(assert (=> b!607056 m!583891))

(declare-fun m!583893 () Bool)

(assert (=> b!607062 m!583893))

(assert (=> b!607075 m!583835))

(declare-fun m!583895 () Bool)

(assert (=> b!607058 m!583895))

(assert (=> b!607058 m!583835))

(assert (=> b!607058 m!583835))

(declare-fun m!583897 () Bool)

(assert (=> b!607058 m!583897))

(assert (=> b!607070 m!583835))

(assert (=> b!607070 m!583835))

(assert (=> b!607070 m!583841))

(declare-fun m!583899 () Bool)

(assert (=> b!607066 m!583899))

(declare-fun m!583901 () Bool)

(assert (=> b!607077 m!583901))

(declare-fun m!583903 () Bool)

(assert (=> start!55540 m!583903))

(declare-fun m!583905 () Bool)

(assert (=> start!55540 m!583905))

(push 1)

