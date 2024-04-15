; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54834 () Bool)

(assert start!54834)

(declare-fun b!599056 () Bool)

(declare-fun res!384189 () Bool)

(declare-fun e!342472 () Bool)

(assert (=> b!599056 (=> (not res!384189) (not e!342472))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37083 0))(
  ( (array!37084 (arr!17801 (Array (_ BitVec 32) (_ BitVec 64))) (size!18166 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37083)

(assert (=> b!599056 (= res!384189 (and (= (size!18166 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18166 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18166 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599057 () Bool)

(declare-fun res!384184 () Bool)

(assert (=> b!599057 (=> (not res!384184) (not e!342472))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599057 (= res!384184 (validKeyInArray!0 k0!1786))))

(declare-fun b!599058 () Bool)

(declare-fun e!342473 () Bool)

(declare-fun lt!272197 () array!37083)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599058 (= e!342473 (arrayContainsKey!0 lt!272197 (select (arr!17801 a!2986) j!136) index!984))))

(declare-fun b!599059 () Bool)

(declare-fun res!384200 () Bool)

(declare-fun e!342465 () Bool)

(assert (=> b!599059 (=> (not res!384200) (not e!342465))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599059 (= res!384200 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17801 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599060 () Bool)

(declare-fun e!342468 () Bool)

(declare-fun e!342463 () Bool)

(assert (=> b!599060 (= e!342468 e!342463)))

(declare-fun res!384192 () Bool)

(assert (=> b!599060 (=> res!384192 e!342463)))

(declare-fun lt!272203 () (_ BitVec 64))

(declare-fun lt!272191 () (_ BitVec 64))

(assert (=> b!599060 (= res!384192 (or (not (= (select (arr!17801 a!2986) j!136) lt!272203)) (not (= (select (arr!17801 a!2986) j!136) lt!272191)) (bvsge j!136 index!984)))))

(declare-fun b!599061 () Bool)

(declare-fun res!384191 () Bool)

(assert (=> b!599061 (=> (not res!384191) (not e!342472))))

(assert (=> b!599061 (= res!384191 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599062 () Bool)

(declare-fun e!342466 () Bool)

(declare-datatypes ((SeekEntryResult!6238 0))(
  ( (MissingZero!6238 (index!27209 (_ BitVec 32))) (Found!6238 (index!27210 (_ BitVec 32))) (Intermediate!6238 (undefined!7050 Bool) (index!27211 (_ BitVec 32)) (x!56024 (_ BitVec 32))) (Undefined!6238) (MissingVacant!6238 (index!27212 (_ BitVec 32))) )
))
(declare-fun lt!272201 () SeekEntryResult!6238)

(declare-fun lt!272199 () SeekEntryResult!6238)

(assert (=> b!599062 (= e!342466 (= lt!272201 lt!272199))))

(declare-fun b!599063 () Bool)

(declare-fun res!384196 () Bool)

(declare-fun e!342469 () Bool)

(assert (=> b!599063 (=> res!384196 e!342469)))

(declare-datatypes ((List!11881 0))(
  ( (Nil!11878) (Cons!11877 (h!12922 (_ BitVec 64)) (t!18100 List!11881)) )
))
(declare-fun contains!2946 (List!11881 (_ BitVec 64)) Bool)

(assert (=> b!599063 (= res!384196 (contains!2946 Nil!11878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599064 () Bool)

(declare-fun e!342471 () Bool)

(declare-fun e!342467 () Bool)

(assert (=> b!599064 (= e!342471 e!342467)))

(declare-fun res!384193 () Bool)

(assert (=> b!599064 (=> res!384193 e!342467)))

(assert (=> b!599064 (= res!384193 (or (not (= (select (arr!17801 a!2986) j!136) lt!272203)) (not (= (select (arr!17801 a!2986) j!136) lt!272191)) (bvsge j!136 index!984)))))

(assert (=> b!599064 e!342468))

(declare-fun res!384197 () Bool)

(assert (=> b!599064 (=> (not res!384197) (not e!342468))))

(assert (=> b!599064 (= res!384197 (= lt!272191 (select (arr!17801 a!2986) j!136)))))

(assert (=> b!599064 (= lt!272191 (select (store (arr!17801 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599065 () Bool)

(assert (=> b!599065 (= e!342467 e!342469)))

(declare-fun res!384195 () Bool)

(assert (=> b!599065 (=> res!384195 e!342469)))

(assert (=> b!599065 (= res!384195 (or (bvsge (size!18166 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18166 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37083 (_ BitVec 32) List!11881) Bool)

(assert (=> b!599065 (arrayNoDuplicates!0 lt!272197 j!136 Nil!11878)))

(declare-datatypes ((Unit!18864 0))(
  ( (Unit!18865) )
))
(declare-fun lt!272198 () Unit!18864)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37083 (_ BitVec 32) (_ BitVec 32)) Unit!18864)

(assert (=> b!599065 (= lt!272198 (lemmaNoDuplicateFromThenFromBigger!0 lt!272197 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599065 (arrayNoDuplicates!0 lt!272197 #b00000000000000000000000000000000 Nil!11878)))

(declare-fun lt!272202 () Unit!18864)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37083 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11881) Unit!18864)

(assert (=> b!599065 (= lt!272202 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11878))))

(assert (=> b!599065 (arrayContainsKey!0 lt!272197 (select (arr!17801 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272193 () Unit!18864)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37083 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18864)

(assert (=> b!599065 (= lt!272193 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272197 (select (arr!17801 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599066 () Bool)

(assert (=> b!599066 (= e!342469 true)))

(declare-fun lt!272194 () Bool)

(assert (=> b!599066 (= lt!272194 (contains!2946 Nil!11878 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599067 () Bool)

(declare-fun res!384203 () Bool)

(assert (=> b!599067 (=> (not res!384203) (not e!342472))))

(assert (=> b!599067 (= res!384203 (validKeyInArray!0 (select (arr!17801 a!2986) j!136)))))

(declare-fun b!599068 () Bool)

(assert (=> b!599068 (= e!342463 e!342473)))

(declare-fun res!384186 () Bool)

(assert (=> b!599068 (=> (not res!384186) (not e!342473))))

(assert (=> b!599068 (= res!384186 (arrayContainsKey!0 lt!272197 (select (arr!17801 a!2986) j!136) j!136))))

(declare-fun b!599069 () Bool)

(declare-fun e!342464 () Bool)

(assert (=> b!599069 (= e!342465 e!342464)))

(declare-fun res!384194 () Bool)

(assert (=> b!599069 (=> (not res!384194) (not e!342464))))

(assert (=> b!599069 (= res!384194 (= (select (store (arr!17801 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599069 (= lt!272197 (array!37084 (store (arr!17801 a!2986) i!1108 k0!1786) (size!18166 a!2986)))))

(declare-fun res!384198 () Bool)

(assert (=> start!54834 (=> (not res!384198) (not e!342472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54834 (= res!384198 (validMask!0 mask!3053))))

(assert (=> start!54834 e!342472))

(assert (=> start!54834 true))

(declare-fun array_inv!13684 (array!37083) Bool)

(assert (=> start!54834 (array_inv!13684 a!2986)))

(declare-fun b!599070 () Bool)

(declare-fun res!384185 () Bool)

(assert (=> b!599070 (=> res!384185 e!342469)))

(declare-fun noDuplicate!281 (List!11881) Bool)

(assert (=> b!599070 (= res!384185 (not (noDuplicate!281 Nil!11878)))))

(declare-fun b!599071 () Bool)

(declare-fun e!342474 () Unit!18864)

(declare-fun Unit!18866 () Unit!18864)

(assert (=> b!599071 (= e!342474 Unit!18866)))

(assert (=> b!599071 false))

(declare-fun b!599072 () Bool)

(assert (=> b!599072 (= e!342472 e!342465)))

(declare-fun res!384201 () Bool)

(assert (=> b!599072 (=> (not res!384201) (not e!342465))))

(declare-fun lt!272200 () SeekEntryResult!6238)

(assert (=> b!599072 (= res!384201 (or (= lt!272200 (MissingZero!6238 i!1108)) (= lt!272200 (MissingVacant!6238 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37083 (_ BitVec 32)) SeekEntryResult!6238)

(assert (=> b!599072 (= lt!272200 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!599073 () Bool)

(declare-fun e!342470 () Bool)

(assert (=> b!599073 (= e!342470 (not e!342471))))

(declare-fun res!384188 () Bool)

(assert (=> b!599073 (=> res!384188 e!342471)))

(declare-fun lt!272190 () SeekEntryResult!6238)

(assert (=> b!599073 (= res!384188 (not (= lt!272190 (Found!6238 index!984))))))

(declare-fun lt!272195 () Unit!18864)

(assert (=> b!599073 (= lt!272195 e!342474)))

(declare-fun c!67803 () Bool)

(assert (=> b!599073 (= c!67803 (= lt!272190 Undefined!6238))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37083 (_ BitVec 32)) SeekEntryResult!6238)

(assert (=> b!599073 (= lt!272190 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272203 lt!272197 mask!3053))))

(assert (=> b!599073 e!342466))

(declare-fun res!384202 () Bool)

(assert (=> b!599073 (=> (not res!384202) (not e!342466))))

(declare-fun lt!272196 () (_ BitVec 32))

(assert (=> b!599073 (= res!384202 (= lt!272199 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272196 vacantSpotIndex!68 lt!272203 lt!272197 mask!3053)))))

(assert (=> b!599073 (= lt!272199 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272196 vacantSpotIndex!68 (select (arr!17801 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599073 (= lt!272203 (select (store (arr!17801 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272192 () Unit!18864)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37083 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18864)

(assert (=> b!599073 (= lt!272192 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272196 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599073 (= lt!272196 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599074 () Bool)

(declare-fun Unit!18867 () Unit!18864)

(assert (=> b!599074 (= e!342474 Unit!18867)))

(declare-fun b!599075 () Bool)

(assert (=> b!599075 (= e!342464 e!342470)))

(declare-fun res!384199 () Bool)

(assert (=> b!599075 (=> (not res!384199) (not e!342470))))

(assert (=> b!599075 (= res!384199 (and (= lt!272201 (Found!6238 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17801 a!2986) index!984) (select (arr!17801 a!2986) j!136))) (not (= (select (arr!17801 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!599075 (= lt!272201 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17801 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599076 () Bool)

(declare-fun res!384190 () Bool)

(assert (=> b!599076 (=> (not res!384190) (not e!342465))))

(assert (=> b!599076 (= res!384190 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11878))))

(declare-fun b!599077 () Bool)

(declare-fun res!384187 () Bool)

(assert (=> b!599077 (=> (not res!384187) (not e!342465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37083 (_ BitVec 32)) Bool)

(assert (=> b!599077 (= res!384187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!54834 res!384198) b!599056))

(assert (= (and b!599056 res!384189) b!599067))

(assert (= (and b!599067 res!384203) b!599057))

(assert (= (and b!599057 res!384184) b!599061))

(assert (= (and b!599061 res!384191) b!599072))

(assert (= (and b!599072 res!384201) b!599077))

(assert (= (and b!599077 res!384187) b!599076))

(assert (= (and b!599076 res!384190) b!599059))

(assert (= (and b!599059 res!384200) b!599069))

(assert (= (and b!599069 res!384194) b!599075))

(assert (= (and b!599075 res!384199) b!599073))

(assert (= (and b!599073 res!384202) b!599062))

(assert (= (and b!599073 c!67803) b!599071))

(assert (= (and b!599073 (not c!67803)) b!599074))

(assert (= (and b!599073 (not res!384188)) b!599064))

(assert (= (and b!599064 res!384197) b!599060))

(assert (= (and b!599060 (not res!384192)) b!599068))

(assert (= (and b!599068 res!384186) b!599058))

(assert (= (and b!599064 (not res!384193)) b!599065))

(assert (= (and b!599065 (not res!384195)) b!599070))

(assert (= (and b!599070 (not res!384185)) b!599063))

(assert (= (and b!599063 (not res!384196)) b!599066))

(declare-fun m!575809 () Bool)

(assert (=> b!599064 m!575809))

(declare-fun m!575811 () Bool)

(assert (=> b!599064 m!575811))

(declare-fun m!575813 () Bool)

(assert (=> b!599064 m!575813))

(declare-fun m!575815 () Bool)

(assert (=> b!599077 m!575815))

(declare-fun m!575817 () Bool)

(assert (=> b!599057 m!575817))

(declare-fun m!575819 () Bool)

(assert (=> b!599076 m!575819))

(declare-fun m!575821 () Bool)

(assert (=> b!599070 m!575821))

(declare-fun m!575823 () Bool)

(assert (=> start!54834 m!575823))

(declare-fun m!575825 () Bool)

(assert (=> start!54834 m!575825))

(declare-fun m!575827 () Bool)

(assert (=> b!599065 m!575827))

(assert (=> b!599065 m!575809))

(declare-fun m!575829 () Bool)

(assert (=> b!599065 m!575829))

(declare-fun m!575831 () Bool)

(assert (=> b!599065 m!575831))

(assert (=> b!599065 m!575809))

(assert (=> b!599065 m!575809))

(declare-fun m!575833 () Bool)

(assert (=> b!599065 m!575833))

(declare-fun m!575835 () Bool)

(assert (=> b!599065 m!575835))

(declare-fun m!575837 () Bool)

(assert (=> b!599065 m!575837))

(declare-fun m!575839 () Bool)

(assert (=> b!599066 m!575839))

(declare-fun m!575841 () Bool)

(assert (=> b!599072 m!575841))

(declare-fun m!575843 () Bool)

(assert (=> b!599059 m!575843))

(declare-fun m!575845 () Bool)

(assert (=> b!599073 m!575845))

(declare-fun m!575847 () Bool)

(assert (=> b!599073 m!575847))

(assert (=> b!599073 m!575809))

(assert (=> b!599073 m!575811))

(declare-fun m!575849 () Bool)

(assert (=> b!599073 m!575849))

(assert (=> b!599073 m!575809))

(declare-fun m!575851 () Bool)

(assert (=> b!599073 m!575851))

(declare-fun m!575853 () Bool)

(assert (=> b!599073 m!575853))

(declare-fun m!575855 () Bool)

(assert (=> b!599073 m!575855))

(declare-fun m!575857 () Bool)

(assert (=> b!599061 m!575857))

(assert (=> b!599069 m!575811))

(declare-fun m!575859 () Bool)

(assert (=> b!599069 m!575859))

(declare-fun m!575861 () Bool)

(assert (=> b!599075 m!575861))

(assert (=> b!599075 m!575809))

(assert (=> b!599075 m!575809))

(declare-fun m!575863 () Bool)

(assert (=> b!599075 m!575863))

(assert (=> b!599058 m!575809))

(assert (=> b!599058 m!575809))

(declare-fun m!575865 () Bool)

(assert (=> b!599058 m!575865))

(assert (=> b!599068 m!575809))

(assert (=> b!599068 m!575809))

(declare-fun m!575867 () Bool)

(assert (=> b!599068 m!575867))

(assert (=> b!599067 m!575809))

(assert (=> b!599067 m!575809))

(declare-fun m!575869 () Bool)

(assert (=> b!599067 m!575869))

(assert (=> b!599060 m!575809))

(declare-fun m!575871 () Bool)

(assert (=> b!599063 m!575871))

(check-sat (not b!599065) (not b!599076) (not b!599066) (not b!599068) (not b!599063) (not b!599058) (not b!599061) (not b!599072) (not b!599077) (not b!599070) (not b!599073) (not b!599075) (not start!54834) (not b!599067) (not b!599057))
(check-sat)
