; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54572 () Bool)

(assert start!54572)

(declare-fun b!597035 () Bool)

(declare-fun res!382768 () Bool)

(declare-fun e!341135 () Bool)

(assert (=> b!597035 (=> (not res!382768) (not e!341135))))

(declare-datatypes ((array!37032 0))(
  ( (array!37033 (arr!17780 (Array (_ BitVec 32) (_ BitVec 64))) (size!18144 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37032)

(declare-datatypes ((List!11821 0))(
  ( (Nil!11818) (Cons!11817 (h!12862 (_ BitVec 64)) (t!18049 List!11821)) )
))
(declare-fun arrayNoDuplicates!0 (array!37032 (_ BitVec 32) List!11821) Bool)

(assert (=> b!597035 (= res!382768 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11818))))

(declare-fun b!597036 () Bool)

(declare-fun e!341136 () Bool)

(assert (=> b!597036 (= e!341136 e!341135)))

(declare-fun res!382769 () Bool)

(assert (=> b!597036 (=> (not res!382769) (not e!341135))))

(declare-datatypes ((SeekEntryResult!6220 0))(
  ( (MissingZero!6220 (index!27128 (_ BitVec 32))) (Found!6220 (index!27129 (_ BitVec 32))) (Intermediate!6220 (undefined!7032 Bool) (index!27130 (_ BitVec 32)) (x!55920 (_ BitVec 32))) (Undefined!6220) (MissingVacant!6220 (index!27131 (_ BitVec 32))) )
))
(declare-fun lt!271241 () SeekEntryResult!6220)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!597036 (= res!382769 (or (= lt!271241 (MissingZero!6220 i!1108)) (= lt!271241 (MissingVacant!6220 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37032 (_ BitVec 32)) SeekEntryResult!6220)

(assert (=> b!597036 (= lt!271241 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!597037 () Bool)

(declare-fun e!341131 () Bool)

(declare-fun e!341130 () Bool)

(assert (=> b!597037 (= e!341131 (not e!341130))))

(declare-fun res!382776 () Bool)

(assert (=> b!597037 (=> res!382776 e!341130)))

(declare-fun lt!271239 () SeekEntryResult!6220)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!597037 (= res!382776 (not (= lt!271239 (Found!6220 index!984))))))

(declare-datatypes ((Unit!18798 0))(
  ( (Unit!18799) )
))
(declare-fun lt!271246 () Unit!18798)

(declare-fun e!341129 () Unit!18798)

(assert (=> b!597037 (= lt!271246 e!341129)))

(declare-fun c!67502 () Bool)

(assert (=> b!597037 (= c!67502 (= lt!271239 Undefined!6220))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!271240 () array!37032)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!271247 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37032 (_ BitVec 32)) SeekEntryResult!6220)

(assert (=> b!597037 (= lt!271239 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271247 lt!271240 mask!3053))))

(declare-fun e!341125 () Bool)

(assert (=> b!597037 e!341125))

(declare-fun res!382772 () Bool)

(assert (=> b!597037 (=> (not res!382772) (not e!341125))))

(declare-fun lt!271238 () (_ BitVec 32))

(declare-fun lt!271249 () SeekEntryResult!6220)

(assert (=> b!597037 (= res!382772 (= lt!271249 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271238 vacantSpotIndex!68 lt!271247 lt!271240 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!597037 (= lt!271249 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271238 vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!597037 (= lt!271247 (select (store (arr!17780 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!271244 () Unit!18798)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37032 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18798)

(assert (=> b!597037 (= lt!271244 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271238 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!597037 (= lt!271238 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!597038 () Bool)

(declare-fun res!382777 () Bool)

(assert (=> b!597038 (=> (not res!382777) (not e!341136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!597038 (= res!382777 (validKeyInArray!0 k!1786))))

(declare-fun b!597039 () Bool)

(declare-fun e!341134 () Bool)

(assert (=> b!597039 (= e!341134 e!341131)))

(declare-fun res!382771 () Bool)

(assert (=> b!597039 (=> (not res!382771) (not e!341131))))

(declare-fun lt!271242 () SeekEntryResult!6220)

(assert (=> b!597039 (= res!382771 (and (= lt!271242 (Found!6220 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17780 a!2986) index!984) (select (arr!17780 a!2986) j!136))) (not (= (select (arr!17780 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!597039 (= lt!271242 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597040 () Bool)

(declare-fun res!382780 () Bool)

(assert (=> b!597040 (=> (not res!382780) (not e!341135))))

(assert (=> b!597040 (= res!382780 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17780 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!597041 () Bool)

(declare-fun res!382781 () Bool)

(assert (=> b!597041 (=> (not res!382781) (not e!341136))))

(assert (=> b!597041 (= res!382781 (validKeyInArray!0 (select (arr!17780 a!2986) j!136)))))

(declare-fun b!597042 () Bool)

(declare-fun res!382773 () Bool)

(assert (=> b!597042 (=> (not res!382773) (not e!341136))))

(declare-fun arrayContainsKey!0 (array!37032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!597042 (= res!382773 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!597043 () Bool)

(declare-fun Unit!18800 () Unit!18798)

(assert (=> b!597043 (= e!341129 Unit!18800)))

(declare-fun b!597044 () Bool)

(declare-fun res!382779 () Bool)

(assert (=> b!597044 (=> (not res!382779) (not e!341136))))

(assert (=> b!597044 (= res!382779 (and (= (size!18144 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18144 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18144 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!382766 () Bool)

(assert (=> start!54572 (=> (not res!382766) (not e!341136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54572 (= res!382766 (validMask!0 mask!3053))))

(assert (=> start!54572 e!341136))

(assert (=> start!54572 true))

(declare-fun array_inv!13576 (array!37032) Bool)

(assert (=> start!54572 (array_inv!13576 a!2986)))

(declare-fun e!341133 () Bool)

(declare-fun b!597045 () Bool)

(assert (=> b!597045 (= e!341133 (arrayContainsKey!0 lt!271240 (select (arr!17780 a!2986) j!136) index!984))))

(declare-fun b!597046 () Bool)

(declare-fun e!341126 () Bool)

(declare-fun e!341128 () Bool)

(assert (=> b!597046 (= e!341126 e!341128)))

(declare-fun res!382765 () Bool)

(assert (=> b!597046 (=> res!382765 e!341128)))

(declare-fun lt!271248 () (_ BitVec 64))

(assert (=> b!597046 (= res!382765 (or (not (= (select (arr!17780 a!2986) j!136) lt!271247)) (not (= (select (arr!17780 a!2986) j!136) lt!271248)) (bvsge j!136 index!984)))))

(declare-fun b!597047 () Bool)

(declare-fun e!341132 () Bool)

(assert (=> b!597047 (= e!341130 e!341132)))

(declare-fun res!382770 () Bool)

(assert (=> b!597047 (=> res!382770 e!341132)))

(assert (=> b!597047 (= res!382770 (or (not (= (select (arr!17780 a!2986) j!136) lt!271247)) (not (= (select (arr!17780 a!2986) j!136) lt!271248)) (bvsge j!136 index!984)))))

(assert (=> b!597047 e!341126))

(declare-fun res!382774 () Bool)

(assert (=> b!597047 (=> (not res!382774) (not e!341126))))

(assert (=> b!597047 (= res!382774 (= lt!271248 (select (arr!17780 a!2986) j!136)))))

(assert (=> b!597047 (= lt!271248 (select (store (arr!17780 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!597048 () Bool)

(assert (=> b!597048 (= e!341135 e!341134)))

(declare-fun res!382778 () Bool)

(assert (=> b!597048 (=> (not res!382778) (not e!341134))))

(assert (=> b!597048 (= res!382778 (= (select (store (arr!17780 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597048 (= lt!271240 (array!37033 (store (arr!17780 a!2986) i!1108 k!1786) (size!18144 a!2986)))))

(declare-fun b!597049 () Bool)

(assert (=> b!597049 (= e!341125 (= lt!271242 lt!271249))))

(declare-fun b!597050 () Bool)

(declare-fun res!382767 () Bool)

(assert (=> b!597050 (=> (not res!382767) (not e!341135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37032 (_ BitVec 32)) Bool)

(assert (=> b!597050 (= res!382767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!597051 () Bool)

(assert (=> b!597051 (= e!341132 (or (bvsgt #b00000000000000000000000000000000 (size!18144 a!2986)) (bvslt (size!18144 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!597051 (arrayNoDuplicates!0 lt!271240 #b00000000000000000000000000000000 Nil!11818)))

(declare-fun lt!271243 () Unit!18798)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37032 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11821) Unit!18798)

(assert (=> b!597051 (= lt!271243 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11818))))

(assert (=> b!597051 (arrayContainsKey!0 lt!271240 (select (arr!17780 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271245 () Unit!18798)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37032 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18798)

(assert (=> b!597051 (= lt!271245 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271240 (select (arr!17780 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!597052 () Bool)

(assert (=> b!597052 (= e!341128 e!341133)))

(declare-fun res!382775 () Bool)

(assert (=> b!597052 (=> (not res!382775) (not e!341133))))

(assert (=> b!597052 (= res!382775 (arrayContainsKey!0 lt!271240 (select (arr!17780 a!2986) j!136) j!136))))

(declare-fun b!597053 () Bool)

(declare-fun Unit!18801 () Unit!18798)

(assert (=> b!597053 (= e!341129 Unit!18801)))

(assert (=> b!597053 false))

(assert (= (and start!54572 res!382766) b!597044))

(assert (= (and b!597044 res!382779) b!597041))

(assert (= (and b!597041 res!382781) b!597038))

(assert (= (and b!597038 res!382777) b!597042))

(assert (= (and b!597042 res!382773) b!597036))

(assert (= (and b!597036 res!382769) b!597050))

(assert (= (and b!597050 res!382767) b!597035))

(assert (= (and b!597035 res!382768) b!597040))

(assert (= (and b!597040 res!382780) b!597048))

(assert (= (and b!597048 res!382778) b!597039))

(assert (= (and b!597039 res!382771) b!597037))

(assert (= (and b!597037 res!382772) b!597049))

(assert (= (and b!597037 c!67502) b!597053))

(assert (= (and b!597037 (not c!67502)) b!597043))

(assert (= (and b!597037 (not res!382776)) b!597047))

(assert (= (and b!597047 res!382774) b!597046))

(assert (= (and b!597046 (not res!382765)) b!597052))

(assert (= (and b!597052 res!382775) b!597045))

(assert (= (and b!597047 (not res!382770)) b!597051))

(declare-fun m!574469 () Bool)

(assert (=> b!597047 m!574469))

(declare-fun m!574471 () Bool)

(assert (=> b!597047 m!574471))

(declare-fun m!574473 () Bool)

(assert (=> b!597047 m!574473))

(declare-fun m!574475 () Bool)

(assert (=> b!597038 m!574475))

(declare-fun m!574477 () Bool)

(assert (=> b!597037 m!574477))

(declare-fun m!574479 () Bool)

(assert (=> b!597037 m!574479))

(assert (=> b!597037 m!574469))

(assert (=> b!597037 m!574471))

(declare-fun m!574481 () Bool)

(assert (=> b!597037 m!574481))

(declare-fun m!574483 () Bool)

(assert (=> b!597037 m!574483))

(declare-fun m!574485 () Bool)

(assert (=> b!597037 m!574485))

(assert (=> b!597037 m!574469))

(declare-fun m!574487 () Bool)

(assert (=> b!597037 m!574487))

(assert (=> b!597045 m!574469))

(assert (=> b!597045 m!574469))

(declare-fun m!574489 () Bool)

(assert (=> b!597045 m!574489))

(assert (=> b!597051 m!574469))

(assert (=> b!597051 m!574469))

(declare-fun m!574491 () Bool)

(assert (=> b!597051 m!574491))

(declare-fun m!574493 () Bool)

(assert (=> b!597051 m!574493))

(assert (=> b!597051 m!574469))

(declare-fun m!574495 () Bool)

(assert (=> b!597051 m!574495))

(declare-fun m!574497 () Bool)

(assert (=> b!597051 m!574497))

(declare-fun m!574499 () Bool)

(assert (=> b!597035 m!574499))

(assert (=> b!597046 m!574469))

(assert (=> b!597048 m!574471))

(declare-fun m!574501 () Bool)

(assert (=> b!597048 m!574501))

(assert (=> b!597052 m!574469))

(assert (=> b!597052 m!574469))

(declare-fun m!574503 () Bool)

(assert (=> b!597052 m!574503))

(declare-fun m!574505 () Bool)

(assert (=> b!597040 m!574505))

(assert (=> b!597041 m!574469))

(assert (=> b!597041 m!574469))

(declare-fun m!574507 () Bool)

(assert (=> b!597041 m!574507))

(declare-fun m!574509 () Bool)

(assert (=> start!54572 m!574509))

(declare-fun m!574511 () Bool)

(assert (=> start!54572 m!574511))

(declare-fun m!574513 () Bool)

(assert (=> b!597042 m!574513))

(declare-fun m!574515 () Bool)

(assert (=> b!597036 m!574515))

(declare-fun m!574517 () Bool)

(assert (=> b!597050 m!574517))

(declare-fun m!574519 () Bool)

(assert (=> b!597039 m!574519))

(assert (=> b!597039 m!574469))

(assert (=> b!597039 m!574469))

(declare-fun m!574521 () Bool)

(assert (=> b!597039 m!574521))

(push 1)

(assert (not b!597052))

(assert (not b!597037))

(assert (not start!54572))

(assert (not b!597035))

(assert (not b!597038))

(assert (not b!597042))

(assert (not b!597041))

(assert (not b!597051))

(assert (not b!597045))

(assert (not b!597039))

(assert (not b!597036))

(assert (not b!597050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!597119 () Bool)

(declare-fun c!67523 () Bool)

(declare-fun lt!271266 () (_ BitVec 64))

(assert (=> b!597119 (= c!67523 (= lt!271266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341183 () SeekEntryResult!6220)

(declare-fun e!341184 () SeekEntryResult!6220)

(assert (=> b!597119 (= e!341183 e!341184)))

(declare-fun b!597120 () Bool)

(declare-fun e!341185 () SeekEntryResult!6220)

(assert (=> b!597120 (= e!341185 e!341183)))

(declare-fun c!67522 () Bool)

(assert (=> b!597120 (= c!67522 (= lt!271266 (select (arr!17780 a!2986) j!136)))))

(declare-fun d!86735 () Bool)

(declare-fun lt!271267 () SeekEntryResult!6220)

(assert (=> d!86735 (and (or (is-Undefined!6220 lt!271267) (not (is-Found!6220 lt!271267)) (and (bvsge (index!27129 lt!271267) #b00000000000000000000000000000000) (bvslt (index!27129 lt!271267) (size!18144 a!2986)))) (or (is-Undefined!6220 lt!271267) (is-Found!6220 lt!271267) (not (is-MissingVacant!6220 lt!271267)) (not (= (index!27131 lt!271267) vacantSpotIndex!68)) (and (bvsge (index!27131 lt!271267) #b00000000000000000000000000000000) (bvslt (index!27131 lt!271267) (size!18144 a!2986)))) (or (is-Undefined!6220 lt!271267) (ite (is-Found!6220 lt!271267) (= (select (arr!17780 a!2986) (index!27129 lt!271267)) (select (arr!17780 a!2986) j!136)) (and (is-MissingVacant!6220 lt!271267) (= (index!27131 lt!271267) vacantSpotIndex!68) (= (select (arr!17780 a!2986) (index!27131 lt!271267)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86735 (= lt!271267 e!341185)))

(declare-fun c!67524 () Bool)

(assert (=> d!86735 (= c!67524 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86735 (= lt!271266 (select (arr!17780 a!2986) index!984))))

(assert (=> d!86735 (validMask!0 mask!3053)))

(assert (=> d!86735 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053) lt!271267)))

(declare-fun b!597121 () Bool)

(assert (=> b!597121 (= e!341184 (MissingVacant!6220 vacantSpotIndex!68))))

(declare-fun b!597122 () Bool)

(assert (=> b!597122 (= e!341183 (Found!6220 index!984))))

(declare-fun b!597123 () Bool)

(assert (=> b!597123 (= e!341185 Undefined!6220)))

(declare-fun b!597124 () Bool)

(assert (=> b!597124 (= e!341184 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!86735 c!67524) b!597123))

(assert (= (and d!86735 (not c!67524)) b!597120))

(assert (= (and b!597120 c!67522) b!597122))

(assert (= (and b!597120 (not c!67522)) b!597119))

(assert (= (and b!597119 c!67523) b!597121))

(assert (= (and b!597119 (not c!67523)) b!597124))

(declare-fun m!574565 () Bool)

(assert (=> d!86735 m!574565))

(declare-fun m!574567 () Bool)

(assert (=> d!86735 m!574567))

(assert (=> d!86735 m!574519))

(assert (=> d!86735 m!574509))

(assert (=> b!597124 m!574477))

(assert (=> b!597124 m!574477))

(assert (=> b!597124 m!574469))

(declare-fun m!574569 () Bool)

(assert (=> b!597124 m!574569))

(assert (=> b!597039 d!86735))

(declare-fun d!86751 () Bool)

(assert (=> d!86751 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597038 d!86751))

(declare-fun d!86753 () Bool)

(assert (=> d!86753 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54572 d!86753))

(declare-fun d!86759 () Bool)

(assert (=> d!86759 (= (array_inv!13576 a!2986) (bvsge (size!18144 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54572 d!86759))

(declare-fun b!597155 () Bool)

(declare-fun c!67535 () Bool)

(declare-fun lt!271281 () (_ BitVec 64))

(assert (=> b!597155 (= c!67535 (= lt!271281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341207 () SeekEntryResult!6220)

(declare-fun e!341208 () SeekEntryResult!6220)

(assert (=> b!597155 (= e!341207 e!341208)))

(declare-fun b!597156 () Bool)

(declare-fun e!341209 () SeekEntryResult!6220)

(assert (=> b!597156 (= e!341209 e!341207)))

(declare-fun c!67534 () Bool)

(assert (=> b!597156 (= c!67534 (= lt!271281 lt!271247))))

(declare-fun d!86761 () Bool)

(declare-fun lt!271282 () SeekEntryResult!6220)

(assert (=> d!86761 (and (or (is-Undefined!6220 lt!271282) (not (is-Found!6220 lt!271282)) (and (bvsge (index!27129 lt!271282) #b00000000000000000000000000000000) (bvslt (index!27129 lt!271282) (size!18144 lt!271240)))) (or (is-Undefined!6220 lt!271282) (is-Found!6220 lt!271282) (not (is-MissingVacant!6220 lt!271282)) (not (= (index!27131 lt!271282) vacantSpotIndex!68)) (and (bvsge (index!27131 lt!271282) #b00000000000000000000000000000000) (bvslt (index!27131 lt!271282) (size!18144 lt!271240)))) (or (is-Undefined!6220 lt!271282) (ite (is-Found!6220 lt!271282) (= (select (arr!17780 lt!271240) (index!27129 lt!271282)) lt!271247) (and (is-MissingVacant!6220 lt!271282) (= (index!27131 lt!271282) vacantSpotIndex!68) (= (select (arr!17780 lt!271240) (index!27131 lt!271282)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86761 (= lt!271282 e!341209)))

(declare-fun c!67536 () Bool)

(assert (=> d!86761 (= c!67536 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86761 (= lt!271281 (select (arr!17780 lt!271240) lt!271238))))

(assert (=> d!86761 (validMask!0 mask!3053)))

(assert (=> d!86761 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271238 vacantSpotIndex!68 lt!271247 lt!271240 mask!3053) lt!271282)))

(declare-fun b!597157 () Bool)

(assert (=> b!597157 (= e!341208 (MissingVacant!6220 vacantSpotIndex!68))))

(declare-fun b!597158 () Bool)

(assert (=> b!597158 (= e!341207 (Found!6220 lt!271238))))

(declare-fun b!597159 () Bool)

(assert (=> b!597159 (= e!341209 Undefined!6220)))

(declare-fun b!597160 () Bool)

(assert (=> b!597160 (= e!341208 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271238 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!271247 lt!271240 mask!3053))))

(assert (= (and d!86761 c!67536) b!597159))

(assert (= (and d!86761 (not c!67536)) b!597156))

(assert (= (and b!597156 c!67534) b!597158))

(assert (= (and b!597156 (not c!67534)) b!597155))

(assert (= (and b!597155 c!67535) b!597157))

(assert (= (and b!597155 (not c!67535)) b!597160))

(declare-fun m!574587 () Bool)

(assert (=> d!86761 m!574587))

(declare-fun m!574589 () Bool)

(assert (=> d!86761 m!574589))

(declare-fun m!574591 () Bool)

(assert (=> d!86761 m!574591))

(assert (=> d!86761 m!574509))

(declare-fun m!574593 () Bool)

(assert (=> b!597160 m!574593))

(assert (=> b!597160 m!574593))

(declare-fun m!574595 () Bool)

(assert (=> b!597160 m!574595))

(assert (=> b!597037 d!86761))

(declare-fun b!597161 () Bool)

(declare-fun c!67538 () Bool)

(declare-fun lt!271283 () (_ BitVec 64))

(assert (=> b!597161 (= c!67538 (= lt!271283 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341210 () SeekEntryResult!6220)

(declare-fun e!341211 () SeekEntryResult!6220)

(assert (=> b!597161 (= e!341210 e!341211)))

(declare-fun b!597162 () Bool)

(declare-fun e!341212 () SeekEntryResult!6220)

(assert (=> b!597162 (= e!341212 e!341210)))

(declare-fun c!67537 () Bool)

(assert (=> b!597162 (= c!67537 (= lt!271283 (select (arr!17780 a!2986) j!136)))))

(declare-fun lt!271284 () SeekEntryResult!6220)

(declare-fun d!86763 () Bool)

(assert (=> d!86763 (and (or (is-Undefined!6220 lt!271284) (not (is-Found!6220 lt!271284)) (and (bvsge (index!27129 lt!271284) #b00000000000000000000000000000000) (bvslt (index!27129 lt!271284) (size!18144 a!2986)))) (or (is-Undefined!6220 lt!271284) (is-Found!6220 lt!271284) (not (is-MissingVacant!6220 lt!271284)) (not (= (index!27131 lt!271284) vacantSpotIndex!68)) (and (bvsge (index!27131 lt!271284) #b00000000000000000000000000000000) (bvslt (index!27131 lt!271284) (size!18144 a!2986)))) (or (is-Undefined!6220 lt!271284) (ite (is-Found!6220 lt!271284) (= (select (arr!17780 a!2986) (index!27129 lt!271284)) (select (arr!17780 a!2986) j!136)) (and (is-MissingVacant!6220 lt!271284) (= (index!27131 lt!271284) vacantSpotIndex!68) (= (select (arr!17780 a!2986) (index!27131 lt!271284)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86763 (= lt!271284 e!341212)))

(declare-fun c!67539 () Bool)

(assert (=> d!86763 (= c!67539 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86763 (= lt!271283 (select (arr!17780 a!2986) lt!271238))))

(assert (=> d!86763 (validMask!0 mask!3053)))

(assert (=> d!86763 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271238 vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053) lt!271284)))

(declare-fun b!597163 () Bool)

(assert (=> b!597163 (= e!341211 (MissingVacant!6220 vacantSpotIndex!68))))

(declare-fun b!597164 () Bool)

(assert (=> b!597164 (= e!341210 (Found!6220 lt!271238))))

(declare-fun b!597165 () Bool)

(assert (=> b!597165 (= e!341212 Undefined!6220)))

(declare-fun b!597166 () Bool)

(assert (=> b!597166 (= e!341211 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271238 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!86763 c!67539) b!597165))

(assert (= (and d!86763 (not c!67539)) b!597162))

(assert (= (and b!597162 c!67537) b!597164))

(assert (= (and b!597162 (not c!67537)) b!597161))

(assert (= (and b!597161 c!67538) b!597163))

(assert (= (and b!597161 (not c!67538)) b!597166))

(declare-fun m!574597 () Bool)

(assert (=> d!86763 m!574597))

(declare-fun m!574599 () Bool)

(assert (=> d!86763 m!574599))

(declare-fun m!574601 () Bool)

(assert (=> d!86763 m!574601))

(assert (=> d!86763 m!574509))

(assert (=> b!597166 m!574593))

(assert (=> b!597166 m!574593))

(assert (=> b!597166 m!574469))

(declare-fun m!574603 () Bool)

(assert (=> b!597166 m!574603))

(assert (=> b!597037 d!86763))

(declare-fun b!597167 () Bool)

(declare-fun c!67541 () Bool)

(declare-fun lt!271285 () (_ BitVec 64))

(assert (=> b!597167 (= c!67541 (= lt!271285 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341213 () SeekEntryResult!6220)

(declare-fun e!341214 () SeekEntryResult!6220)

(assert (=> b!597167 (= e!341213 e!341214)))

(declare-fun b!597168 () Bool)

(declare-fun e!341215 () SeekEntryResult!6220)

(assert (=> b!597168 (= e!341215 e!341213)))

(declare-fun c!67540 () Bool)

(assert (=> b!597168 (= c!67540 (= lt!271285 lt!271247))))

(declare-fun lt!271286 () SeekEntryResult!6220)

(declare-fun d!86765 () Bool)

(assert (=> d!86765 (and (or (is-Undefined!6220 lt!271286) (not (is-Found!6220 lt!271286)) (and (bvsge (index!27129 lt!271286) #b00000000000000000000000000000000) (bvslt (index!27129 lt!271286) (size!18144 lt!271240)))) (or (is-Undefined!6220 lt!271286) (is-Found!6220 lt!271286) (not (is-MissingVacant!6220 lt!271286)) (not (= (index!27131 lt!271286) vacantSpotIndex!68)) (and (bvsge (index!27131 lt!271286) #b00000000000000000000000000000000) (bvslt (index!27131 lt!271286) (size!18144 lt!271240)))) (or (is-Undefined!6220 lt!271286) (ite (is-Found!6220 lt!271286) (= (select (arr!17780 lt!271240) (index!27129 lt!271286)) lt!271247) (and (is-MissingVacant!6220 lt!271286) (= (index!27131 lt!271286) vacantSpotIndex!68) (= (select (arr!17780 lt!271240) (index!27131 lt!271286)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86765 (= lt!271286 e!341215)))

(declare-fun c!67542 () Bool)

(assert (=> d!86765 (= c!67542 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86765 (= lt!271285 (select (arr!17780 lt!271240) index!984))))

(assert (=> d!86765 (validMask!0 mask!3053)))

(assert (=> d!86765 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271247 lt!271240 mask!3053) lt!271286)))

(declare-fun b!597169 () Bool)

(assert (=> b!597169 (= e!341214 (MissingVacant!6220 vacantSpotIndex!68))))

(declare-fun b!597170 () Bool)

(assert (=> b!597170 (= e!341213 (Found!6220 index!984))))

(declare-fun b!597171 () Bool)

(assert (=> b!597171 (= e!341215 Undefined!6220)))

(declare-fun b!597172 () Bool)

(assert (=> b!597172 (= e!341214 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!271247 lt!271240 mask!3053))))

(assert (= (and d!86765 c!67542) b!597171))

(assert (= (and d!86765 (not c!67542)) b!597168))

(assert (= (and b!597168 c!67540) b!597170))

(assert (= (and b!597168 (not c!67540)) b!597167))

(assert (= (and b!597167 c!67541) b!597169))

(assert (= (and b!597167 (not c!67541)) b!597172))

(declare-fun m!574605 () Bool)

(assert (=> d!86765 m!574605))

(declare-fun m!574607 () Bool)

(assert (=> d!86765 m!574607))

(declare-fun m!574609 () Bool)

(assert (=> d!86765 m!574609))

(assert (=> d!86765 m!574509))

(assert (=> b!597172 m!574477))

(assert (=> b!597172 m!574477))

(declare-fun m!574611 () Bool)

(assert (=> b!597172 m!574611))

(assert (=> b!597037 d!86765))

(declare-fun d!86767 () Bool)

(declare-fun lt!271291 () (_ BitVec 32))

(assert (=> d!86767 (and (bvsge lt!271291 #b00000000000000000000000000000000) (bvslt lt!271291 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86767 (= lt!271291 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86767 (validMask!0 mask!3053)))

(assert (=> d!86767 (= (nextIndex!0 index!984 x!910 mask!3053) lt!271291)))

(declare-fun bs!18365 () Bool)

(assert (= bs!18365 d!86767))

(declare-fun m!574617 () Bool)

(assert (=> bs!18365 m!574617))

(assert (=> bs!18365 m!574509))

(assert (=> b!597037 d!86767))

(declare-fun d!86769 () Bool)

(declare-fun e!341221 () Bool)

(assert (=> d!86769 e!341221))

(declare-fun res!382823 () Bool)

(assert (=> d!86769 (=> (not res!382823) (not e!341221))))

(assert (=> d!86769 (= res!382823 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18144 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18144 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18144 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18144 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18144 a!2986))))))

(declare-fun lt!271294 () Unit!18798)

(declare-fun choose!9 (array!37032 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18798)

(assert (=> d!86769 (= lt!271294 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271238 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86769 (validMask!0 mask!3053)))

(assert (=> d!86769 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271238 vacantSpotIndex!68 mask!3053) lt!271294)))

(declare-fun b!597181 () Bool)

(assert (=> b!597181 (= e!341221 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271238 vacantSpotIndex!68 (select (arr!17780 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271238 vacantSpotIndex!68 (select (store (arr!17780 a!2986) i!1108 k!1786) j!136) (array!37033 (store (arr!17780 a!2986) i!1108 k!1786) (size!18144 a!2986)) mask!3053)))))

(assert (= (and d!86769 res!382823) b!597181))

(declare-fun m!574621 () Bool)

(assert (=> d!86769 m!574621))

(assert (=> d!86769 m!574509))

(assert (=> b!597181 m!574479))

(declare-fun m!574623 () Bool)

(assert (=> b!597181 m!574623))

(assert (=> b!597181 m!574469))

(assert (=> b!597181 m!574469))

(assert (=> b!597181 m!574487))

(assert (=> b!597181 m!574471))

(assert (=> b!597181 m!574479))

(assert (=> b!597037 d!86769))

(declare-fun b!597252 () Bool)

(declare-fun e!341264 () SeekEntryResult!6220)

(declare-fun lt!271320 () SeekEntryResult!6220)

(assert (=> b!597252 (= e!341264 (MissingZero!6220 (index!27130 lt!271320)))))

(declare-fun b!597253 () Bool)

(declare-fun e!341266 () SeekEntryResult!6220)

(declare-fun e!341265 () SeekEntryResult!6220)

(assert (=> b!597253 (= e!341266 e!341265)))

(declare-fun lt!271319 () (_ BitVec 64))

(assert (=> b!597253 (= lt!271319 (select (arr!17780 a!2986) (index!27130 lt!271320)))))

(declare-fun c!67574 () Bool)

(assert (=> b!597253 (= c!67574 (= lt!271319 k!1786))))

(declare-fun b!597254 () Bool)

(declare-fun c!67575 () Bool)

(assert (=> b!597254 (= c!67575 (= lt!271319 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597254 (= e!341265 e!341264)))

(declare-fun b!597255 () Bool)

(assert (=> b!597255 (= e!341265 (Found!6220 (index!27130 lt!271320)))))

(declare-fun b!597256 () Bool)

(assert (=> b!597256 (= e!341264 (seekKeyOrZeroReturnVacant!0 (x!55920 lt!271320) (index!27130 lt!271320) (index!27130 lt!271320) k!1786 a!2986 mask!3053))))

(declare-fun b!597257 () Bool)

(assert (=> b!597257 (= e!341266 Undefined!6220)))

(declare-fun d!86777 () Bool)

(declare-fun lt!271321 () SeekEntryResult!6220)

(assert (=> d!86777 (and (or (is-Undefined!6220 lt!271321) (not (is-Found!6220 lt!271321)) (and (bvsge (index!27129 lt!271321) #b00000000000000000000000000000000) (bvslt (index!27129 lt!271321) (size!18144 a!2986)))) (or (is-Undefined!6220 lt!271321) (is-Found!6220 lt!271321) (not (is-MissingZero!6220 lt!271321)) (and (bvsge (index!27128 lt!271321) #b00000000000000000000000000000000) (bvslt (index!27128 lt!271321) (size!18144 a!2986)))) (or (is-Undefined!6220 lt!271321) (is-Found!6220 lt!271321) (is-MissingZero!6220 lt!271321) (not (is-MissingVacant!6220 lt!271321)) (and (bvsge (index!27131 lt!271321) #b00000000000000000000000000000000) (bvslt (index!27131 lt!271321) (size!18144 a!2986)))) (or (is-Undefined!6220 lt!271321) (ite (is-Found!6220 lt!271321) (= (select (arr!17780 a!2986) (index!27129 lt!271321)) k!1786) (ite (is-MissingZero!6220 lt!271321) (= (select (arr!17780 a!2986) (index!27128 lt!271321)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6220 lt!271321) (= (select (arr!17780 a!2986) (index!27131 lt!271321)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86777 (= lt!271321 e!341266)))

(declare-fun c!67576 () Bool)

(assert (=> d!86777 (= c!67576 (and (is-Intermediate!6220 lt!271320) (undefined!7032 lt!271320)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37032 (_ BitVec 32)) SeekEntryResult!6220)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86777 (= lt!271320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!86777 (validMask!0 mask!3053)))

(assert (=> d!86777 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!271321)))

(assert (= (and d!86777 c!67576) b!597257))

(assert (= (and d!86777 (not c!67576)) b!597253))

(assert (= (and b!597253 c!67574) b!597255))

(assert (= (and b!597253 (not c!67574)) b!597254))

(assert (= (and b!597254 c!67575) b!597252))

(assert (= (and b!597254 (not c!67575)) b!597256))

(declare-fun m!574667 () Bool)

(assert (=> b!597253 m!574667))

(declare-fun m!574669 () Bool)

(assert (=> b!597256 m!574669))

(declare-fun m!574671 () Bool)

(assert (=> d!86777 m!574671))

(declare-fun m!574673 () Bool)

(assert (=> d!86777 m!574673))

(assert (=> d!86777 m!574671))

(declare-fun m!574675 () Bool)

(assert (=> d!86777 m!574675))

(declare-fun m!574677 () Bool)

(assert (=> d!86777 m!574677))

(assert (=> d!86777 m!574509))

(declare-fun m!574679 () Bool)

(assert (=> d!86777 m!574679))

(assert (=> b!597036 d!86777))

(declare-fun b!597285 () Bool)

(declare-fun e!341290 () Bool)

(declare-fun e!341291 () Bool)

(assert (=> b!597285 (= e!341290 e!341291)))

(declare-fun res!382856 () Bool)

(assert (=> b!597285 (=> (not res!382856) (not e!341291))))

(declare-fun e!341289 () Bool)

(assert (=> b!597285 (= res!382856 (not e!341289))))

(declare-fun res!382857 () Bool)

(assert (=> b!597285 (=> (not res!382857) (not e!341289))))

(assert (=> b!597285 (= res!382857 (validKeyInArray!0 (select (arr!17780 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86789 () Bool)

(declare-fun res!382855 () Bool)

(assert (=> d!86789 (=> res!382855 e!341290)))

(assert (=> d!86789 (= res!382855 (bvsge #b00000000000000000000000000000000 (size!18144 a!2986)))))

(assert (=> d!86789 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11818) e!341290)))

(declare-fun b!597286 () Bool)

(declare-fun contains!2953 (List!11821 (_ BitVec 64)) Bool)

(assert (=> b!597286 (= e!341289 (contains!2953 Nil!11818 (select (arr!17780 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597287 () Bool)

(declare-fun e!341292 () Bool)

(declare-fun call!32920 () Bool)

(assert (=> b!597287 (= e!341292 call!32920)))

(declare-fun bm!32917 () Bool)

(declare-fun c!67582 () Bool)

(assert (=> bm!32917 (= call!32920 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67582 (Cons!11817 (select (arr!17780 a!2986) #b00000000000000000000000000000000) Nil!11818) Nil!11818)))))

(declare-fun b!597288 () Bool)

(assert (=> b!597288 (= e!341291 e!341292)))

(assert (=> b!597288 (= c!67582 (validKeyInArray!0 (select (arr!17780 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597289 () Bool)

(assert (=> b!597289 (= e!341292 call!32920)))

(assert (= (and d!86789 (not res!382855)) b!597285))

(assert (= (and b!597285 res!382857) b!597286))

(assert (= (and b!597285 res!382856) b!597288))

(assert (= (and b!597288 c!67582) b!597287))

(assert (= (and b!597288 (not c!67582)) b!597289))

(assert (= (or b!597287 b!597289) bm!32917))

(declare-fun m!574697 () Bool)

(assert (=> b!597285 m!574697))

(assert (=> b!597285 m!574697))

(declare-fun m!574701 () Bool)

(assert (=> b!597285 m!574701))

(assert (=> b!597286 m!574697))

(assert (=> b!597286 m!574697))

(declare-fun m!574703 () Bool)

(assert (=> b!597286 m!574703))

(assert (=> bm!32917 m!574697))

(declare-fun m!574705 () Bool)

(assert (=> bm!32917 m!574705))

(assert (=> b!597288 m!574697))

(assert (=> b!597288 m!574697))

(assert (=> b!597288 m!574701))

(assert (=> b!597035 d!86789))

(declare-fun d!86799 () Bool)

(declare-fun res!382862 () Bool)

(declare-fun e!341297 () Bool)

(assert (=> d!86799 (=> res!382862 e!341297)))

(assert (=> d!86799 (= res!382862 (= (select (arr!17780 lt!271240) index!984) (select (arr!17780 a!2986) j!136)))))

(assert (=> d!86799 (= (arrayContainsKey!0 lt!271240 (select (arr!17780 a!2986) j!136) index!984) e!341297)))

(declare-fun b!597294 () Bool)

(declare-fun e!341298 () Bool)

(assert (=> b!597294 (= e!341297 e!341298)))

(declare-fun res!382863 () Bool)

(assert (=> b!597294 (=> (not res!382863) (not e!341298))))

(assert (=> b!597294 (= res!382863 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18144 lt!271240)))))

(declare-fun b!597295 () Bool)

(assert (=> b!597295 (= e!341298 (arrayContainsKey!0 lt!271240 (select (arr!17780 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86799 (not res!382862)) b!597294))

(assert (= (and b!597294 res!382863) b!597295))

(assert (=> d!86799 m!574609))

(assert (=> b!597295 m!574469))

(declare-fun m!574707 () Bool)

(assert (=> b!597295 m!574707))

(assert (=> b!597045 d!86799))

(declare-fun d!86801 () Bool)

(declare-fun res!382864 () Bool)

(declare-fun e!341299 () Bool)

(assert (=> d!86801 (=> res!382864 e!341299)))

(assert (=> d!86801 (= res!382864 (= (select (arr!17780 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!86801 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!341299)))

(declare-fun b!597296 () Bool)

(declare-fun e!341300 () Bool)

(assert (=> b!597296 (= e!341299 e!341300)))

(declare-fun res!382865 () Bool)

(assert (=> b!597296 (=> (not res!382865) (not e!341300))))

(assert (=> b!597296 (= res!382865 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18144 a!2986)))))

(declare-fun b!597297 () Bool)

(assert (=> b!597297 (= e!341300 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86801 (not res!382864)) b!597296))

(assert (= (and b!597296 res!382865) b!597297))

(assert (=> d!86801 m!574697))

(declare-fun m!574709 () Bool)

(assert (=> b!597297 m!574709))

(assert (=> b!597042 d!86801))

(declare-fun d!86803 () Bool)

(declare-fun res!382866 () Bool)

(declare-fun e!341301 () Bool)

(assert (=> d!86803 (=> res!382866 e!341301)))

(assert (=> d!86803 (= res!382866 (= (select (arr!17780 lt!271240) j!136) (select (arr!17780 a!2986) j!136)))))

(assert (=> d!86803 (= (arrayContainsKey!0 lt!271240 (select (arr!17780 a!2986) j!136) j!136) e!341301)))

(declare-fun b!597298 () Bool)

(declare-fun e!341302 () Bool)

(assert (=> b!597298 (= e!341301 e!341302)))

(declare-fun res!382867 () Bool)

(assert (=> b!597298 (=> (not res!382867) (not e!341302))))

(assert (=> b!597298 (= res!382867 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18144 lt!271240)))))

(declare-fun b!597299 () Bool)

(assert (=> b!597299 (= e!341302 (arrayContainsKey!0 lt!271240 (select (arr!17780 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86803 (not res!382866)) b!597298))

(assert (= (and b!597298 res!382867) b!597299))

(declare-fun m!574711 () Bool)

(assert (=> d!86803 m!574711))

(assert (=> b!597299 m!574469))

(declare-fun m!574713 () Bool)

(assert (=> b!597299 m!574713))

(assert (=> b!597052 d!86803))

(declare-fun d!86805 () Bool)

(assert (=> d!86805 (= (validKeyInArray!0 (select (arr!17780 a!2986) j!136)) (and (not (= (select (arr!17780 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17780 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597041 d!86805))

(declare-fun b!597300 () Bool)

(declare-fun e!341304 () Bool)

(declare-fun e!341305 () Bool)

(assert (=> b!597300 (= e!341304 e!341305)))

(declare-fun res!382869 () Bool)

(assert (=> b!597300 (=> (not res!382869) (not e!341305))))

(declare-fun e!341303 () Bool)

(assert (=> b!597300 (= res!382869 (not e!341303))))

(declare-fun res!382870 () Bool)

(assert (=> b!597300 (=> (not res!382870) (not e!341303))))

(assert (=> b!597300 (= res!382870 (validKeyInArray!0 (select (arr!17780 lt!271240) #b00000000000000000000000000000000)))))

(declare-fun d!86807 () Bool)

(declare-fun res!382868 () Bool)

(assert (=> d!86807 (=> res!382868 e!341304)))

(assert (=> d!86807 (= res!382868 (bvsge #b00000000000000000000000000000000 (size!18144 lt!271240)))))

(assert (=> d!86807 (= (arrayNoDuplicates!0 lt!271240 #b00000000000000000000000000000000 Nil!11818) e!341304)))

(declare-fun b!597301 () Bool)

(assert (=> b!597301 (= e!341303 (contains!2953 Nil!11818 (select (arr!17780 lt!271240) #b00000000000000000000000000000000)))))

(declare-fun b!597302 () Bool)

(declare-fun e!341306 () Bool)

(declare-fun call!32921 () Bool)

(assert (=> b!597302 (= e!341306 call!32921)))

(declare-fun bm!32918 () Bool)

(declare-fun c!67583 () Bool)

(assert (=> bm!32918 (= call!32921 (arrayNoDuplicates!0 lt!271240 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67583 (Cons!11817 (select (arr!17780 lt!271240) #b00000000000000000000000000000000) Nil!11818) Nil!11818)))))

(declare-fun b!597303 () Bool)

(assert (=> b!597303 (= e!341305 e!341306)))

(assert (=> b!597303 (= c!67583 (validKeyInArray!0 (select (arr!17780 lt!271240) #b00000000000000000000000000000000)))))

(declare-fun b!597304 () Bool)

(assert (=> b!597304 (= e!341306 call!32921)))

(assert (= (and d!86807 (not res!382868)) b!597300))

(assert (= (and b!597300 res!382870) b!597301))

(assert (= (and b!597300 res!382869) b!597303))

(assert (= (and b!597303 c!67583) b!597302))

(assert (= (and b!597303 (not c!67583)) b!597304))

(assert (= (or b!597302 b!597304) bm!32918))

(declare-fun m!574715 () Bool)

(assert (=> b!597300 m!574715))

(assert (=> b!597300 m!574715))

(declare-fun m!574717 () Bool)

(assert (=> b!597300 m!574717))

(assert (=> b!597301 m!574715))

(assert (=> b!597301 m!574715))

(declare-fun m!574719 () Bool)

(assert (=> b!597301 m!574719))

(assert (=> bm!32918 m!574715))

(declare-fun m!574721 () Bool)

(assert (=> bm!32918 m!574721))

(assert (=> b!597303 m!574715))

(assert (=> b!597303 m!574715))

(assert (=> b!597303 m!574717))

(assert (=> b!597051 d!86807))

(declare-fun d!86809 () Bool)

(declare-fun e!341309 () Bool)

(assert (=> d!86809 e!341309))

(declare-fun res!382873 () Bool)

(assert (=> d!86809 (=> (not res!382873) (not e!341309))))

(assert (=> d!86809 (= res!382873 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18144 a!2986))))))

(declare-fun lt!271339 () Unit!18798)

(declare-fun choose!41 (array!37032 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11821) Unit!18798)

(assert (=> d!86809 (= lt!271339 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11818))))

(assert (=> d!86809 (bvslt (size!18144 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!86809 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11818) lt!271339)))

(declare-fun b!597307 () Bool)

(assert (=> b!597307 (= e!341309 (arrayNoDuplicates!0 (array!37033 (store (arr!17780 a!2986) i!1108 k!1786) (size!18144 a!2986)) #b00000000000000000000000000000000 Nil!11818))))

(assert (= (and d!86809 res!382873) b!597307))

(declare-fun m!574723 () Bool)

(assert (=> d!86809 m!574723))

(assert (=> b!597307 m!574471))

(declare-fun m!574725 () Bool)

(assert (=> b!597307 m!574725))

(assert (=> b!597051 d!86809))

(declare-fun d!86811 () Bool)

(declare-fun res!382874 () Bool)

(declare-fun e!341310 () Bool)

(assert (=> d!86811 (=> res!382874 e!341310)))

(assert (=> d!86811 (= res!382874 (= (select (arr!17780 lt!271240) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17780 a!2986) j!136)))))

(assert (=> d!86811 (= (arrayContainsKey!0 lt!271240 (select (arr!17780 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341310)))

(declare-fun b!597308 () Bool)

(declare-fun e!341311 () Bool)

(assert (=> b!597308 (= e!341310 e!341311)))

(declare-fun res!382875 () Bool)

(assert (=> b!597308 (=> (not res!382875) (not e!341311))))

(assert (=> b!597308 (= res!382875 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18144 lt!271240)))))

(declare-fun b!597309 () Bool)

(assert (=> b!597309 (= e!341311 (arrayContainsKey!0 lt!271240 (select (arr!17780 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86811 (not res!382874)) b!597308))

(assert (= (and b!597308 res!382875) b!597309))

(declare-fun m!574727 () Bool)

(assert (=> d!86811 m!574727))

(assert (=> b!597309 m!574469))

(declare-fun m!574729 () Bool)

(assert (=> b!597309 m!574729))

(assert (=> b!597051 d!86811))

(declare-fun d!86813 () Bool)

(assert (=> d!86813 (arrayContainsKey!0 lt!271240 (select (arr!17780 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271346 () Unit!18798)

(declare-fun choose!114 (array!37032 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18798)

(assert (=> d!86813 (= lt!271346 (choose!114 lt!271240 (select (arr!17780 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86813 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86813 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271240 (select (arr!17780 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!271346)))

(declare-fun bs!18367 () Bool)

(assert (= bs!18367 d!86813))

(assert (=> bs!18367 m!574469))

(assert (=> bs!18367 m!574495))

(assert (=> bs!18367 m!574469))

(declare-fun m!574731 () Bool)

(assert (=> bs!18367 m!574731))

(assert (=> b!597051 d!86813))

(declare-fun bm!32921 () Bool)

