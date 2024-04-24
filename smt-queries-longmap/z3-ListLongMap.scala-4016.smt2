; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54618 () Bool)

(assert start!54618)

(declare-fun b!597130 () Bool)

(declare-fun e!341189 () Bool)

(declare-datatypes ((SeekEntryResult!6169 0))(
  ( (MissingZero!6169 (index!26924 (_ BitVec 32))) (Found!6169 (index!26925 (_ BitVec 32))) (Intermediate!6169 (undefined!6981 Bool) (index!26926 (_ BitVec 32)) (x!55872 (_ BitVec 32))) (Undefined!6169) (MissingVacant!6169 (index!26927 (_ BitVec 32))) )
))
(declare-fun lt!271269 () SeekEntryResult!6169)

(declare-fun lt!271271 () SeekEntryResult!6169)

(assert (=> b!597130 (= e!341189 (= lt!271269 lt!271271))))

(declare-fun b!597131 () Bool)

(declare-datatypes ((Unit!18769 0))(
  ( (Unit!18770) )
))
(declare-fun e!341186 () Unit!18769)

(declare-fun Unit!18771 () Unit!18769)

(assert (=> b!597131 (= e!341186 Unit!18771)))

(declare-fun b!597132 () Bool)

(declare-fun Unit!18772 () Unit!18769)

(assert (=> b!597132 (= e!341186 Unit!18772)))

(assert (=> b!597132 false))

(declare-fun b!597133 () Bool)

(declare-fun res!382774 () Bool)

(declare-fun e!341193 () Bool)

(assert (=> b!597133 (=> (not res!382774) (not e!341193))))

(declare-datatypes ((array!37023 0))(
  ( (array!37024 (arr!17773 (Array (_ BitVec 32) (_ BitVec 64))) (size!18137 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37023)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37023 (_ BitVec 32)) Bool)

(assert (=> b!597133 (= res!382774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!597134 () Bool)

(declare-fun e!341188 () Bool)

(assert (=> b!597134 (= e!341188 (or (bvsgt #b00000000000000000000000000000000 (size!18137 a!2986)) (bvslt (size!18137 a!2986) #b01111111111111111111111111111111)))))

(declare-fun lt!271279 () array!37023)

(declare-datatypes ((List!11721 0))(
  ( (Nil!11718) (Cons!11717 (h!12765 (_ BitVec 64)) (t!17941 List!11721)) )
))
(declare-fun arrayNoDuplicates!0 (array!37023 (_ BitVec 32) List!11721) Bool)

(assert (=> b!597134 (arrayNoDuplicates!0 lt!271279 #b00000000000000000000000000000000 Nil!11718)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!271277 () Unit!18769)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37023 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11721) Unit!18769)

(assert (=> b!597134 (= lt!271277 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11718))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!597134 (arrayContainsKey!0 lt!271279 (select (arr!17773 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271270 () Unit!18769)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37023 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18769)

(assert (=> b!597134 (= lt!271270 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271279 (select (arr!17773 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!597135 () Bool)

(declare-fun e!341185 () Bool)

(declare-fun e!341184 () Bool)

(assert (=> b!597135 (= e!341185 e!341184)))

(declare-fun res!382769 () Bool)

(assert (=> b!597135 (=> (not res!382769) (not e!341184))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!597135 (= res!382769 (and (= lt!271269 (Found!6169 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17773 a!2986) index!984) (select (arr!17773 a!2986) j!136))) (not (= (select (arr!17773 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37023 (_ BitVec 32)) SeekEntryResult!6169)

(assert (=> b!597135 (= lt!271269 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17773 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597136 () Bool)

(declare-fun e!341191 () Bool)

(assert (=> b!597136 (= e!341191 e!341193)))

(declare-fun res!382776 () Bool)

(assert (=> b!597136 (=> (not res!382776) (not e!341193))))

(declare-fun lt!271274 () SeekEntryResult!6169)

(assert (=> b!597136 (= res!382776 (or (= lt!271274 (MissingZero!6169 i!1108)) (= lt!271274 (MissingVacant!6169 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37023 (_ BitVec 32)) SeekEntryResult!6169)

(assert (=> b!597136 (= lt!271274 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!597137 () Bool)

(assert (=> b!597137 (= e!341193 e!341185)))

(declare-fun res!382773 () Bool)

(assert (=> b!597137 (=> (not res!382773) (not e!341185))))

(assert (=> b!597137 (= res!382773 (= (select (store (arr!17773 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597137 (= lt!271279 (array!37024 (store (arr!17773 a!2986) i!1108 k0!1786) (size!18137 a!2986)))))

(declare-fun res!382767 () Bool)

(assert (=> start!54618 (=> (not res!382767) (not e!341191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54618 (= res!382767 (validMask!0 mask!3053))))

(assert (=> start!54618 e!341191))

(assert (=> start!54618 true))

(declare-fun array_inv!13632 (array!37023) Bool)

(assert (=> start!54618 (array_inv!13632 a!2986)))

(declare-fun b!597138 () Bool)

(declare-fun e!341182 () Bool)

(declare-fun e!341192 () Bool)

(assert (=> b!597138 (= e!341182 e!341192)))

(declare-fun res!382770 () Bool)

(assert (=> b!597138 (=> (not res!382770) (not e!341192))))

(assert (=> b!597138 (= res!382770 (arrayContainsKey!0 lt!271279 (select (arr!17773 a!2986) j!136) j!136))))

(declare-fun b!597139 () Bool)

(declare-fun res!382780 () Bool)

(assert (=> b!597139 (=> (not res!382780) (not e!341193))))

(assert (=> b!597139 (= res!382780 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17773 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!597140 () Bool)

(declare-fun res!382783 () Bool)

(assert (=> b!597140 (=> (not res!382783) (not e!341193))))

(assert (=> b!597140 (= res!382783 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11718))))

(declare-fun b!597141 () Bool)

(declare-fun res!382775 () Bool)

(assert (=> b!597141 (=> (not res!382775) (not e!341191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!597141 (= res!382775 (validKeyInArray!0 k0!1786))))

(declare-fun b!597142 () Bool)

(declare-fun e!341187 () Bool)

(assert (=> b!597142 (= e!341187 e!341188)))

(declare-fun res!382781 () Bool)

(assert (=> b!597142 (=> res!382781 e!341188)))

(declare-fun lt!271278 () (_ BitVec 64))

(declare-fun lt!271276 () (_ BitVec 64))

(assert (=> b!597142 (= res!382781 (or (not (= (select (arr!17773 a!2986) j!136) lt!271278)) (not (= (select (arr!17773 a!2986) j!136) lt!271276)) (bvsge j!136 index!984)))))

(declare-fun e!341183 () Bool)

(assert (=> b!597142 e!341183))

(declare-fun res!382768 () Bool)

(assert (=> b!597142 (=> (not res!382768) (not e!341183))))

(assert (=> b!597142 (= res!382768 (= lt!271276 (select (arr!17773 a!2986) j!136)))))

(assert (=> b!597142 (= lt!271276 (select (store (arr!17773 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!597143 () Bool)

(declare-fun res!382779 () Bool)

(assert (=> b!597143 (=> (not res!382779) (not e!341191))))

(assert (=> b!597143 (= res!382779 (validKeyInArray!0 (select (arr!17773 a!2986) j!136)))))

(declare-fun b!597144 () Bool)

(declare-fun res!382778 () Bool)

(assert (=> b!597144 (=> (not res!382778) (not e!341191))))

(assert (=> b!597144 (= res!382778 (and (= (size!18137 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18137 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18137 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!597145 () Bool)

(assert (=> b!597145 (= e!341183 e!341182)))

(declare-fun res!382771 () Bool)

(assert (=> b!597145 (=> res!382771 e!341182)))

(assert (=> b!597145 (= res!382771 (or (not (= (select (arr!17773 a!2986) j!136) lt!271278)) (not (= (select (arr!17773 a!2986) j!136) lt!271276)) (bvsge j!136 index!984)))))

(declare-fun b!597146 () Bool)

(declare-fun res!382782 () Bool)

(assert (=> b!597146 (=> (not res!382782) (not e!341191))))

(assert (=> b!597146 (= res!382782 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!597147 () Bool)

(assert (=> b!597147 (= e!341192 (arrayContainsKey!0 lt!271279 (select (arr!17773 a!2986) j!136) index!984))))

(declare-fun b!597148 () Bool)

(assert (=> b!597148 (= e!341184 (not e!341187))))

(declare-fun res!382777 () Bool)

(assert (=> b!597148 (=> res!382777 e!341187)))

(declare-fun lt!271272 () SeekEntryResult!6169)

(assert (=> b!597148 (= res!382777 (not (= lt!271272 (Found!6169 index!984))))))

(declare-fun lt!271275 () Unit!18769)

(assert (=> b!597148 (= lt!271275 e!341186)))

(declare-fun c!67550 () Bool)

(assert (=> b!597148 (= c!67550 (= lt!271272 Undefined!6169))))

(assert (=> b!597148 (= lt!271272 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271278 lt!271279 mask!3053))))

(assert (=> b!597148 e!341189))

(declare-fun res!382772 () Bool)

(assert (=> b!597148 (=> (not res!382772) (not e!341189))))

(declare-fun lt!271268 () (_ BitVec 32))

(assert (=> b!597148 (= res!382772 (= lt!271271 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271268 vacantSpotIndex!68 lt!271278 lt!271279 mask!3053)))))

(assert (=> b!597148 (= lt!271271 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271268 vacantSpotIndex!68 (select (arr!17773 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!597148 (= lt!271278 (select (store (arr!17773 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271273 () Unit!18769)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37023 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18769)

(assert (=> b!597148 (= lt!271273 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271268 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!597148 (= lt!271268 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (= (and start!54618 res!382767) b!597144))

(assert (= (and b!597144 res!382778) b!597143))

(assert (= (and b!597143 res!382779) b!597141))

(assert (= (and b!597141 res!382775) b!597146))

(assert (= (and b!597146 res!382782) b!597136))

(assert (= (and b!597136 res!382776) b!597133))

(assert (= (and b!597133 res!382774) b!597140))

(assert (= (and b!597140 res!382783) b!597139))

(assert (= (and b!597139 res!382780) b!597137))

(assert (= (and b!597137 res!382773) b!597135))

(assert (= (and b!597135 res!382769) b!597148))

(assert (= (and b!597148 res!382772) b!597130))

(assert (= (and b!597148 c!67550) b!597132))

(assert (= (and b!597148 (not c!67550)) b!597131))

(assert (= (and b!597148 (not res!382777)) b!597142))

(assert (= (and b!597142 res!382768) b!597145))

(assert (= (and b!597145 (not res!382771)) b!597138))

(assert (= (and b!597138 res!382770) b!597147))

(assert (= (and b!597142 (not res!382781)) b!597134))

(declare-fun m!574775 () Bool)

(assert (=> b!597147 m!574775))

(assert (=> b!597147 m!574775))

(declare-fun m!574777 () Bool)

(assert (=> b!597147 m!574777))

(assert (=> b!597134 m!574775))

(declare-fun m!574779 () Bool)

(assert (=> b!597134 m!574779))

(declare-fun m!574781 () Bool)

(assert (=> b!597134 m!574781))

(assert (=> b!597134 m!574775))

(assert (=> b!597134 m!574775))

(declare-fun m!574783 () Bool)

(assert (=> b!597134 m!574783))

(declare-fun m!574785 () Bool)

(assert (=> b!597134 m!574785))

(declare-fun m!574787 () Bool)

(assert (=> b!597146 m!574787))

(declare-fun m!574789 () Bool)

(assert (=> b!597135 m!574789))

(assert (=> b!597135 m!574775))

(assert (=> b!597135 m!574775))

(declare-fun m!574791 () Bool)

(assert (=> b!597135 m!574791))

(declare-fun m!574793 () Bool)

(assert (=> b!597141 m!574793))

(declare-fun m!574795 () Bool)

(assert (=> b!597133 m!574795))

(declare-fun m!574797 () Bool)

(assert (=> b!597136 m!574797))

(assert (=> b!597142 m!574775))

(declare-fun m!574799 () Bool)

(assert (=> b!597142 m!574799))

(declare-fun m!574801 () Bool)

(assert (=> b!597142 m!574801))

(assert (=> b!597137 m!574799))

(declare-fun m!574803 () Bool)

(assert (=> b!597137 m!574803))

(declare-fun m!574805 () Bool)

(assert (=> b!597140 m!574805))

(declare-fun m!574807 () Bool)

(assert (=> b!597148 m!574807))

(declare-fun m!574809 () Bool)

(assert (=> b!597148 m!574809))

(assert (=> b!597148 m!574775))

(assert (=> b!597148 m!574799))

(declare-fun m!574811 () Bool)

(assert (=> b!597148 m!574811))

(declare-fun m!574813 () Bool)

(assert (=> b!597148 m!574813))

(assert (=> b!597148 m!574775))

(declare-fun m!574815 () Bool)

(assert (=> b!597148 m!574815))

(declare-fun m!574817 () Bool)

(assert (=> b!597148 m!574817))

(assert (=> b!597145 m!574775))

(assert (=> b!597143 m!574775))

(assert (=> b!597143 m!574775))

(declare-fun m!574819 () Bool)

(assert (=> b!597143 m!574819))

(declare-fun m!574821 () Bool)

(assert (=> b!597139 m!574821))

(declare-fun m!574823 () Bool)

(assert (=> start!54618 m!574823))

(declare-fun m!574825 () Bool)

(assert (=> start!54618 m!574825))

(assert (=> b!597138 m!574775))

(assert (=> b!597138 m!574775))

(declare-fun m!574827 () Bool)

(assert (=> b!597138 m!574827))

(check-sat (not b!597133) (not b!597134) (not b!597135) (not b!597147) (not b!597141) (not b!597148) (not b!597146) (not b!597138) (not b!597143) (not b!597140) (not b!597136) (not start!54618))
(check-sat)
(get-model)

(declare-fun d!86827 () Bool)

(assert (=> d!86827 (= (validKeyInArray!0 (select (arr!17773 a!2986) j!136)) (and (not (= (select (arr!17773 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17773 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597143 d!86827))

(declare-fun b!597271 () Bool)

(declare-fun e!341274 () Bool)

(declare-fun e!341273 () Bool)

(assert (=> b!597271 (= e!341274 e!341273)))

(declare-fun lt!271359 () (_ BitVec 64))

(assert (=> b!597271 (= lt!271359 (select (arr!17773 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!271358 () Unit!18769)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37023 (_ BitVec 64) (_ BitVec 32)) Unit!18769)

(assert (=> b!597271 (= lt!271358 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!271359 #b00000000000000000000000000000000))))

(assert (=> b!597271 (arrayContainsKey!0 a!2986 lt!271359 #b00000000000000000000000000000000)))

(declare-fun lt!271360 () Unit!18769)

(assert (=> b!597271 (= lt!271360 lt!271358)))

(declare-fun res!382891 () Bool)

(assert (=> b!597271 (= res!382891 (= (seekEntryOrOpen!0 (select (arr!17773 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6169 #b00000000000000000000000000000000)))))

(assert (=> b!597271 (=> (not res!382891) (not e!341273))))

(declare-fun d!86829 () Bool)

(declare-fun res!382890 () Bool)

(declare-fun e!341272 () Bool)

(assert (=> d!86829 (=> res!382890 e!341272)))

(assert (=> d!86829 (= res!382890 (bvsge #b00000000000000000000000000000000 (size!18137 a!2986)))))

(assert (=> d!86829 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!341272)))

(declare-fun bm!32907 () Bool)

(declare-fun call!32910 () Bool)

(assert (=> bm!32907 (= call!32910 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!597272 () Bool)

(assert (=> b!597272 (= e!341273 call!32910)))

(declare-fun b!597273 () Bool)

(assert (=> b!597273 (= e!341272 e!341274)))

(declare-fun c!67559 () Bool)

(assert (=> b!597273 (= c!67559 (validKeyInArray!0 (select (arr!17773 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597274 () Bool)

(assert (=> b!597274 (= e!341274 call!32910)))

(assert (= (and d!86829 (not res!382890)) b!597273))

(assert (= (and b!597273 c!67559) b!597271))

(assert (= (and b!597273 (not c!67559)) b!597274))

(assert (= (and b!597271 res!382891) b!597272))

(assert (= (or b!597272 b!597274) bm!32907))

(declare-fun m!574937 () Bool)

(assert (=> b!597271 m!574937))

(declare-fun m!574939 () Bool)

(assert (=> b!597271 m!574939))

(declare-fun m!574941 () Bool)

(assert (=> b!597271 m!574941))

(assert (=> b!597271 m!574937))

(declare-fun m!574943 () Bool)

(assert (=> b!597271 m!574943))

(declare-fun m!574945 () Bool)

(assert (=> bm!32907 m!574945))

(assert (=> b!597273 m!574937))

(assert (=> b!597273 m!574937))

(declare-fun m!574947 () Bool)

(assert (=> b!597273 m!574947))

(assert (=> b!597133 d!86829))

(declare-fun bm!32910 () Bool)

(declare-fun call!32913 () Bool)

(declare-fun c!67562 () Bool)

(assert (=> bm!32910 (= call!32913 (arrayNoDuplicates!0 lt!271279 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67562 (Cons!11717 (select (arr!17773 lt!271279) #b00000000000000000000000000000000) Nil!11718) Nil!11718)))))

(declare-fun b!597285 () Bool)

(declare-fun e!341283 () Bool)

(assert (=> b!597285 (= e!341283 call!32913)))

(declare-fun b!597286 () Bool)

(assert (=> b!597286 (= e!341283 call!32913)))

(declare-fun b!597287 () Bool)

(declare-fun e!341286 () Bool)

(declare-fun contains!2927 (List!11721 (_ BitVec 64)) Bool)

(assert (=> b!597287 (= e!341286 (contains!2927 Nil!11718 (select (arr!17773 lt!271279) #b00000000000000000000000000000000)))))

(declare-fun d!86831 () Bool)

(declare-fun res!382900 () Bool)

(declare-fun e!341284 () Bool)

(assert (=> d!86831 (=> res!382900 e!341284)))

(assert (=> d!86831 (= res!382900 (bvsge #b00000000000000000000000000000000 (size!18137 lt!271279)))))

(assert (=> d!86831 (= (arrayNoDuplicates!0 lt!271279 #b00000000000000000000000000000000 Nil!11718) e!341284)))

(declare-fun b!597288 () Bool)

(declare-fun e!341285 () Bool)

(assert (=> b!597288 (= e!341284 e!341285)))

(declare-fun res!382898 () Bool)

(assert (=> b!597288 (=> (not res!382898) (not e!341285))))

(assert (=> b!597288 (= res!382898 (not e!341286))))

(declare-fun res!382899 () Bool)

(assert (=> b!597288 (=> (not res!382899) (not e!341286))))

(assert (=> b!597288 (= res!382899 (validKeyInArray!0 (select (arr!17773 lt!271279) #b00000000000000000000000000000000)))))

(declare-fun b!597289 () Bool)

(assert (=> b!597289 (= e!341285 e!341283)))

(assert (=> b!597289 (= c!67562 (validKeyInArray!0 (select (arr!17773 lt!271279) #b00000000000000000000000000000000)))))

(assert (= (and d!86831 (not res!382900)) b!597288))

(assert (= (and b!597288 res!382899) b!597287))

(assert (= (and b!597288 res!382898) b!597289))

(assert (= (and b!597289 c!67562) b!597285))

(assert (= (and b!597289 (not c!67562)) b!597286))

(assert (= (or b!597285 b!597286) bm!32910))

(declare-fun m!574949 () Bool)

(assert (=> bm!32910 m!574949))

(declare-fun m!574951 () Bool)

(assert (=> bm!32910 m!574951))

(assert (=> b!597287 m!574949))

(assert (=> b!597287 m!574949))

(declare-fun m!574953 () Bool)

(assert (=> b!597287 m!574953))

(assert (=> b!597288 m!574949))

(assert (=> b!597288 m!574949))

(declare-fun m!574955 () Bool)

(assert (=> b!597288 m!574955))

(assert (=> b!597289 m!574949))

(assert (=> b!597289 m!574949))

(assert (=> b!597289 m!574955))

(assert (=> b!597134 d!86831))

(declare-fun d!86833 () Bool)

(declare-fun e!341289 () Bool)

(assert (=> d!86833 e!341289))

(declare-fun res!382903 () Bool)

(assert (=> d!86833 (=> (not res!382903) (not e!341289))))

(assert (=> d!86833 (= res!382903 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18137 a!2986))))))

(declare-fun lt!271363 () Unit!18769)

(declare-fun choose!41 (array!37023 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11721) Unit!18769)

(assert (=> d!86833 (= lt!271363 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11718))))

(assert (=> d!86833 (bvslt (size!18137 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!86833 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11718) lt!271363)))

(declare-fun b!597292 () Bool)

(assert (=> b!597292 (= e!341289 (arrayNoDuplicates!0 (array!37024 (store (arr!17773 a!2986) i!1108 k0!1786) (size!18137 a!2986)) #b00000000000000000000000000000000 Nil!11718))))

(assert (= (and d!86833 res!382903) b!597292))

(declare-fun m!574957 () Bool)

(assert (=> d!86833 m!574957))

(assert (=> b!597292 m!574799))

(declare-fun m!574959 () Bool)

(assert (=> b!597292 m!574959))

(assert (=> b!597134 d!86833))

(declare-fun d!86835 () Bool)

(declare-fun res!382908 () Bool)

(declare-fun e!341294 () Bool)

(assert (=> d!86835 (=> res!382908 e!341294)))

(assert (=> d!86835 (= res!382908 (= (select (arr!17773 lt!271279) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17773 a!2986) j!136)))))

(assert (=> d!86835 (= (arrayContainsKey!0 lt!271279 (select (arr!17773 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341294)))

(declare-fun b!597297 () Bool)

(declare-fun e!341295 () Bool)

(assert (=> b!597297 (= e!341294 e!341295)))

(declare-fun res!382909 () Bool)

(assert (=> b!597297 (=> (not res!382909) (not e!341295))))

(assert (=> b!597297 (= res!382909 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18137 lt!271279)))))

(declare-fun b!597298 () Bool)

(assert (=> b!597298 (= e!341295 (arrayContainsKey!0 lt!271279 (select (arr!17773 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86835 (not res!382908)) b!597297))

(assert (= (and b!597297 res!382909) b!597298))

(declare-fun m!574961 () Bool)

(assert (=> d!86835 m!574961))

(assert (=> b!597298 m!574775))

(declare-fun m!574963 () Bool)

(assert (=> b!597298 m!574963))

(assert (=> b!597134 d!86835))

(declare-fun d!86837 () Bool)

(assert (=> d!86837 (arrayContainsKey!0 lt!271279 (select (arr!17773 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271366 () Unit!18769)

(declare-fun choose!114 (array!37023 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18769)

(assert (=> d!86837 (= lt!271366 (choose!114 lt!271279 (select (arr!17773 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86837 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86837 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271279 (select (arr!17773 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!271366)))

(declare-fun bs!18383 () Bool)

(assert (= bs!18383 d!86837))

(assert (=> bs!18383 m!574775))

(assert (=> bs!18383 m!574783))

(assert (=> bs!18383 m!574775))

(declare-fun m!574965 () Bool)

(assert (=> bs!18383 m!574965))

(assert (=> b!597134 d!86837))

(declare-fun b!597311 () Bool)

(declare-fun e!341303 () SeekEntryResult!6169)

(declare-fun e!341304 () SeekEntryResult!6169)

(assert (=> b!597311 (= e!341303 e!341304)))

(declare-fun c!67571 () Bool)

(declare-fun lt!271372 () (_ BitVec 64))

(assert (=> b!597311 (= c!67571 (= lt!271372 (select (arr!17773 a!2986) j!136)))))

(declare-fun b!597312 () Bool)

(assert (=> b!597312 (= e!341304 (Found!6169 index!984))))

(declare-fun lt!271371 () SeekEntryResult!6169)

(declare-fun d!86839 () Bool)

(get-info :version)

(assert (=> d!86839 (and (or ((_ is Undefined!6169) lt!271371) (not ((_ is Found!6169) lt!271371)) (and (bvsge (index!26925 lt!271371) #b00000000000000000000000000000000) (bvslt (index!26925 lt!271371) (size!18137 a!2986)))) (or ((_ is Undefined!6169) lt!271371) ((_ is Found!6169) lt!271371) (not ((_ is MissingVacant!6169) lt!271371)) (not (= (index!26927 lt!271371) vacantSpotIndex!68)) (and (bvsge (index!26927 lt!271371) #b00000000000000000000000000000000) (bvslt (index!26927 lt!271371) (size!18137 a!2986)))) (or ((_ is Undefined!6169) lt!271371) (ite ((_ is Found!6169) lt!271371) (= (select (arr!17773 a!2986) (index!26925 lt!271371)) (select (arr!17773 a!2986) j!136)) (and ((_ is MissingVacant!6169) lt!271371) (= (index!26927 lt!271371) vacantSpotIndex!68) (= (select (arr!17773 a!2986) (index!26927 lt!271371)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86839 (= lt!271371 e!341303)))

(declare-fun c!67570 () Bool)

(assert (=> d!86839 (= c!67570 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86839 (= lt!271372 (select (arr!17773 a!2986) index!984))))

(assert (=> d!86839 (validMask!0 mask!3053)))

(assert (=> d!86839 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17773 a!2986) j!136) a!2986 mask!3053) lt!271371)))

(declare-fun b!597313 () Bool)

(assert (=> b!597313 (= e!341303 Undefined!6169)))

(declare-fun e!341302 () SeekEntryResult!6169)

(declare-fun b!597314 () Bool)

(assert (=> b!597314 (= e!341302 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17773 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597315 () Bool)

(declare-fun c!67569 () Bool)

(assert (=> b!597315 (= c!67569 (= lt!271372 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597315 (= e!341304 e!341302)))

(declare-fun b!597316 () Bool)

(assert (=> b!597316 (= e!341302 (MissingVacant!6169 vacantSpotIndex!68))))

(assert (= (and d!86839 c!67570) b!597313))

(assert (= (and d!86839 (not c!67570)) b!597311))

(assert (= (and b!597311 c!67571) b!597312))

(assert (= (and b!597311 (not c!67571)) b!597315))

(assert (= (and b!597315 c!67569) b!597316))

(assert (= (and b!597315 (not c!67569)) b!597314))

(declare-fun m!574967 () Bool)

(assert (=> d!86839 m!574967))

(declare-fun m!574969 () Bool)

(assert (=> d!86839 m!574969))

(assert (=> d!86839 m!574789))

(assert (=> d!86839 m!574823))

(declare-fun m!574971 () Bool)

(assert (=> b!597314 m!574971))

(assert (=> b!597314 m!574971))

(assert (=> b!597314 m!574775))

(declare-fun m!574973 () Bool)

(assert (=> b!597314 m!574973))

(assert (=> b!597135 d!86839))

(declare-fun d!86841 () Bool)

(declare-fun res!382910 () Bool)

(declare-fun e!341305 () Bool)

(assert (=> d!86841 (=> res!382910 e!341305)))

(assert (=> d!86841 (= res!382910 (= (select (arr!17773 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86841 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!341305)))

(declare-fun b!597317 () Bool)

(declare-fun e!341306 () Bool)

(assert (=> b!597317 (= e!341305 e!341306)))

(declare-fun res!382911 () Bool)

(assert (=> b!597317 (=> (not res!382911) (not e!341306))))

(assert (=> b!597317 (= res!382911 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18137 a!2986)))))

(declare-fun b!597318 () Bool)

(assert (=> b!597318 (= e!341306 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86841 (not res!382910)) b!597317))

(assert (= (and b!597317 res!382911) b!597318))

(assert (=> d!86841 m!574937))

(declare-fun m!574975 () Bool)

(assert (=> b!597318 m!574975))

(assert (=> b!597146 d!86841))

(declare-fun d!86843 () Bool)

(assert (=> d!86843 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54618 d!86843))

(declare-fun d!86849 () Bool)

(assert (=> d!86849 (= (array_inv!13632 a!2986) (bvsge (size!18137 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54618 d!86849))

(declare-fun d!86851 () Bool)

(declare-fun lt!271408 () SeekEntryResult!6169)

(assert (=> d!86851 (and (or ((_ is Undefined!6169) lt!271408) (not ((_ is Found!6169) lt!271408)) (and (bvsge (index!26925 lt!271408) #b00000000000000000000000000000000) (bvslt (index!26925 lt!271408) (size!18137 a!2986)))) (or ((_ is Undefined!6169) lt!271408) ((_ is Found!6169) lt!271408) (not ((_ is MissingZero!6169) lt!271408)) (and (bvsge (index!26924 lt!271408) #b00000000000000000000000000000000) (bvslt (index!26924 lt!271408) (size!18137 a!2986)))) (or ((_ is Undefined!6169) lt!271408) ((_ is Found!6169) lt!271408) ((_ is MissingZero!6169) lt!271408) (not ((_ is MissingVacant!6169) lt!271408)) (and (bvsge (index!26927 lt!271408) #b00000000000000000000000000000000) (bvslt (index!26927 lt!271408) (size!18137 a!2986)))) (or ((_ is Undefined!6169) lt!271408) (ite ((_ is Found!6169) lt!271408) (= (select (arr!17773 a!2986) (index!26925 lt!271408)) k0!1786) (ite ((_ is MissingZero!6169) lt!271408) (= (select (arr!17773 a!2986) (index!26924 lt!271408)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6169) lt!271408) (= (select (arr!17773 a!2986) (index!26927 lt!271408)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!341359 () SeekEntryResult!6169)

(assert (=> d!86851 (= lt!271408 e!341359)))

(declare-fun c!67597 () Bool)

(declare-fun lt!271407 () SeekEntryResult!6169)

(assert (=> d!86851 (= c!67597 (and ((_ is Intermediate!6169) lt!271407) (undefined!6981 lt!271407)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37023 (_ BitVec 32)) SeekEntryResult!6169)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86851 (= lt!271407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86851 (validMask!0 mask!3053)))

(assert (=> d!86851 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!271408)))

(declare-fun b!597396 () Bool)

(declare-fun e!341360 () SeekEntryResult!6169)

(assert (=> b!597396 (= e!341359 e!341360)))

(declare-fun lt!271406 () (_ BitVec 64))

(assert (=> b!597396 (= lt!271406 (select (arr!17773 a!2986) (index!26926 lt!271407)))))

(declare-fun c!67599 () Bool)

(assert (=> b!597396 (= c!67599 (= lt!271406 k0!1786))))

(declare-fun b!597397 () Bool)

(declare-fun c!67598 () Bool)

(assert (=> b!597397 (= c!67598 (= lt!271406 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341361 () SeekEntryResult!6169)

(assert (=> b!597397 (= e!341360 e!341361)))

(declare-fun b!597398 () Bool)

(assert (=> b!597398 (= e!341361 (MissingZero!6169 (index!26926 lt!271407)))))

(declare-fun b!597399 () Bool)

(assert (=> b!597399 (= e!341359 Undefined!6169)))

(declare-fun b!597400 () Bool)

(assert (=> b!597400 (= e!341360 (Found!6169 (index!26926 lt!271407)))))

(declare-fun b!597401 () Bool)

(assert (=> b!597401 (= e!341361 (seekKeyOrZeroReturnVacant!0 (x!55872 lt!271407) (index!26926 lt!271407) (index!26926 lt!271407) k0!1786 a!2986 mask!3053))))

(assert (= (and d!86851 c!67597) b!597399))

(assert (= (and d!86851 (not c!67597)) b!597396))

(assert (= (and b!597396 c!67599) b!597400))

(assert (= (and b!597396 (not c!67599)) b!597397))

(assert (= (and b!597397 c!67598) b!597398))

(assert (= (and b!597397 (not c!67598)) b!597401))

(declare-fun m!575025 () Bool)

(assert (=> d!86851 m!575025))

(declare-fun m!575027 () Bool)

(assert (=> d!86851 m!575027))

(assert (=> d!86851 m!574823))

(assert (=> d!86851 m!575027))

(declare-fun m!575029 () Bool)

(assert (=> d!86851 m!575029))

(declare-fun m!575031 () Bool)

(assert (=> d!86851 m!575031))

(declare-fun m!575033 () Bool)

(assert (=> d!86851 m!575033))

(declare-fun m!575035 () Bool)

(assert (=> b!597396 m!575035))

(declare-fun m!575037 () Bool)

(assert (=> b!597401 m!575037))

(assert (=> b!597136 d!86851))

(declare-fun d!86867 () Bool)

(declare-fun res!382939 () Bool)

(declare-fun e!341362 () Bool)

(assert (=> d!86867 (=> res!382939 e!341362)))

(assert (=> d!86867 (= res!382939 (= (select (arr!17773 lt!271279) index!984) (select (arr!17773 a!2986) j!136)))))

(assert (=> d!86867 (= (arrayContainsKey!0 lt!271279 (select (arr!17773 a!2986) j!136) index!984) e!341362)))

(declare-fun b!597402 () Bool)

(declare-fun e!341363 () Bool)

(assert (=> b!597402 (= e!341362 e!341363)))

(declare-fun res!382940 () Bool)

(assert (=> b!597402 (=> (not res!382940) (not e!341363))))

(assert (=> b!597402 (= res!382940 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18137 lt!271279)))))

(declare-fun b!597403 () Bool)

(assert (=> b!597403 (= e!341363 (arrayContainsKey!0 lt!271279 (select (arr!17773 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86867 (not res!382939)) b!597402))

(assert (= (and b!597402 res!382940) b!597403))

(declare-fun m!575039 () Bool)

(assert (=> d!86867 m!575039))

(assert (=> b!597403 m!574775))

(declare-fun m!575041 () Bool)

(assert (=> b!597403 m!575041))

(assert (=> b!597147 d!86867))

(declare-fun b!597408 () Bool)

(declare-fun e!341369 () SeekEntryResult!6169)

(declare-fun e!341370 () SeekEntryResult!6169)

(assert (=> b!597408 (= e!341369 e!341370)))

(declare-fun c!67602 () Bool)

(declare-fun lt!271410 () (_ BitVec 64))

(assert (=> b!597408 (= c!67602 (= lt!271410 lt!271278))))

(declare-fun b!597409 () Bool)

(assert (=> b!597409 (= e!341370 (Found!6169 index!984))))

(declare-fun d!86869 () Bool)

(declare-fun lt!271409 () SeekEntryResult!6169)

(assert (=> d!86869 (and (or ((_ is Undefined!6169) lt!271409) (not ((_ is Found!6169) lt!271409)) (and (bvsge (index!26925 lt!271409) #b00000000000000000000000000000000) (bvslt (index!26925 lt!271409) (size!18137 lt!271279)))) (or ((_ is Undefined!6169) lt!271409) ((_ is Found!6169) lt!271409) (not ((_ is MissingVacant!6169) lt!271409)) (not (= (index!26927 lt!271409) vacantSpotIndex!68)) (and (bvsge (index!26927 lt!271409) #b00000000000000000000000000000000) (bvslt (index!26927 lt!271409) (size!18137 lt!271279)))) (or ((_ is Undefined!6169) lt!271409) (ite ((_ is Found!6169) lt!271409) (= (select (arr!17773 lt!271279) (index!26925 lt!271409)) lt!271278) (and ((_ is MissingVacant!6169) lt!271409) (= (index!26927 lt!271409) vacantSpotIndex!68) (= (select (arr!17773 lt!271279) (index!26927 lt!271409)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86869 (= lt!271409 e!341369)))

(declare-fun c!67601 () Bool)

(assert (=> d!86869 (= c!67601 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86869 (= lt!271410 (select (arr!17773 lt!271279) index!984))))

(assert (=> d!86869 (validMask!0 mask!3053)))

(assert (=> d!86869 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271278 lt!271279 mask!3053) lt!271409)))

(declare-fun b!597410 () Bool)

(assert (=> b!597410 (= e!341369 Undefined!6169)))

(declare-fun b!597411 () Bool)

(declare-fun e!341368 () SeekEntryResult!6169)

(assert (=> b!597411 (= e!341368 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!271278 lt!271279 mask!3053))))

(declare-fun b!597412 () Bool)

(declare-fun c!67600 () Bool)

(assert (=> b!597412 (= c!67600 (= lt!271410 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597412 (= e!341370 e!341368)))

(declare-fun b!597413 () Bool)

(assert (=> b!597413 (= e!341368 (MissingVacant!6169 vacantSpotIndex!68))))

(assert (= (and d!86869 c!67601) b!597410))

(assert (= (and d!86869 (not c!67601)) b!597408))

(assert (= (and b!597408 c!67602) b!597409))

(assert (= (and b!597408 (not c!67602)) b!597412))

(assert (= (and b!597412 c!67600) b!597413))

(assert (= (and b!597412 (not c!67600)) b!597411))

(declare-fun m!575043 () Bool)

(assert (=> d!86869 m!575043))

(declare-fun m!575045 () Bool)

(assert (=> d!86869 m!575045))

(assert (=> d!86869 m!575039))

(assert (=> d!86869 m!574823))

(assert (=> b!597411 m!574971))

(assert (=> b!597411 m!574971))

(declare-fun m!575047 () Bool)

(assert (=> b!597411 m!575047))

(assert (=> b!597148 d!86869))

(declare-fun b!597420 () Bool)

(declare-fun e!341378 () SeekEntryResult!6169)

(declare-fun e!341379 () SeekEntryResult!6169)

(assert (=> b!597420 (= e!341378 e!341379)))

(declare-fun c!67605 () Bool)

(declare-fun lt!271412 () (_ BitVec 64))

(assert (=> b!597420 (= c!67605 (= lt!271412 (select (arr!17773 a!2986) j!136)))))

(declare-fun b!597421 () Bool)

(assert (=> b!597421 (= e!341379 (Found!6169 lt!271268))))

(declare-fun lt!271411 () SeekEntryResult!6169)

(declare-fun d!86871 () Bool)

(assert (=> d!86871 (and (or ((_ is Undefined!6169) lt!271411) (not ((_ is Found!6169) lt!271411)) (and (bvsge (index!26925 lt!271411) #b00000000000000000000000000000000) (bvslt (index!26925 lt!271411) (size!18137 a!2986)))) (or ((_ is Undefined!6169) lt!271411) ((_ is Found!6169) lt!271411) (not ((_ is MissingVacant!6169) lt!271411)) (not (= (index!26927 lt!271411) vacantSpotIndex!68)) (and (bvsge (index!26927 lt!271411) #b00000000000000000000000000000000) (bvslt (index!26927 lt!271411) (size!18137 a!2986)))) (or ((_ is Undefined!6169) lt!271411) (ite ((_ is Found!6169) lt!271411) (= (select (arr!17773 a!2986) (index!26925 lt!271411)) (select (arr!17773 a!2986) j!136)) (and ((_ is MissingVacant!6169) lt!271411) (= (index!26927 lt!271411) vacantSpotIndex!68) (= (select (arr!17773 a!2986) (index!26927 lt!271411)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86871 (= lt!271411 e!341378)))

(declare-fun c!67604 () Bool)

(assert (=> d!86871 (= c!67604 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86871 (= lt!271412 (select (arr!17773 a!2986) lt!271268))))

(assert (=> d!86871 (validMask!0 mask!3053)))

(assert (=> d!86871 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271268 vacantSpotIndex!68 (select (arr!17773 a!2986) j!136) a!2986 mask!3053) lt!271411)))

(declare-fun b!597422 () Bool)

(assert (=> b!597422 (= e!341378 Undefined!6169)))

(declare-fun b!597423 () Bool)

(declare-fun e!341377 () SeekEntryResult!6169)

(assert (=> b!597423 (= e!341377 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271268 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17773 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597424 () Bool)

(declare-fun c!67603 () Bool)

(assert (=> b!597424 (= c!67603 (= lt!271412 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597424 (= e!341379 e!341377)))

(declare-fun b!597425 () Bool)

(assert (=> b!597425 (= e!341377 (MissingVacant!6169 vacantSpotIndex!68))))

(assert (= (and d!86871 c!67604) b!597422))

(assert (= (and d!86871 (not c!67604)) b!597420))

(assert (= (and b!597420 c!67605) b!597421))

(assert (= (and b!597420 (not c!67605)) b!597424))

(assert (= (and b!597424 c!67603) b!597425))

(assert (= (and b!597424 (not c!67603)) b!597423))

(declare-fun m!575053 () Bool)

(assert (=> d!86871 m!575053))

(declare-fun m!575055 () Bool)

(assert (=> d!86871 m!575055))

(declare-fun m!575057 () Bool)

(assert (=> d!86871 m!575057))

(assert (=> d!86871 m!574823))

(declare-fun m!575059 () Bool)

(assert (=> b!597423 m!575059))

(assert (=> b!597423 m!575059))

(assert (=> b!597423 m!574775))

(declare-fun m!575061 () Bool)

(assert (=> b!597423 m!575061))

(assert (=> b!597148 d!86871))

(declare-fun b!597428 () Bool)

(declare-fun e!341383 () SeekEntryResult!6169)

(declare-fun e!341384 () SeekEntryResult!6169)

(assert (=> b!597428 (= e!341383 e!341384)))

(declare-fun c!67608 () Bool)

(declare-fun lt!271414 () (_ BitVec 64))

(assert (=> b!597428 (= c!67608 (= lt!271414 lt!271278))))

(declare-fun b!597429 () Bool)

(assert (=> b!597429 (= e!341384 (Found!6169 lt!271268))))

(declare-fun lt!271413 () SeekEntryResult!6169)

(declare-fun d!86875 () Bool)

(assert (=> d!86875 (and (or ((_ is Undefined!6169) lt!271413) (not ((_ is Found!6169) lt!271413)) (and (bvsge (index!26925 lt!271413) #b00000000000000000000000000000000) (bvslt (index!26925 lt!271413) (size!18137 lt!271279)))) (or ((_ is Undefined!6169) lt!271413) ((_ is Found!6169) lt!271413) (not ((_ is MissingVacant!6169) lt!271413)) (not (= (index!26927 lt!271413) vacantSpotIndex!68)) (and (bvsge (index!26927 lt!271413) #b00000000000000000000000000000000) (bvslt (index!26927 lt!271413) (size!18137 lt!271279)))) (or ((_ is Undefined!6169) lt!271413) (ite ((_ is Found!6169) lt!271413) (= (select (arr!17773 lt!271279) (index!26925 lt!271413)) lt!271278) (and ((_ is MissingVacant!6169) lt!271413) (= (index!26927 lt!271413) vacantSpotIndex!68) (= (select (arr!17773 lt!271279) (index!26927 lt!271413)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86875 (= lt!271413 e!341383)))

(declare-fun c!67607 () Bool)

(assert (=> d!86875 (= c!67607 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86875 (= lt!271414 (select (arr!17773 lt!271279) lt!271268))))

(assert (=> d!86875 (validMask!0 mask!3053)))

(assert (=> d!86875 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271268 vacantSpotIndex!68 lt!271278 lt!271279 mask!3053) lt!271413)))

(declare-fun b!597430 () Bool)

(assert (=> b!597430 (= e!341383 Undefined!6169)))

(declare-fun b!597431 () Bool)

(declare-fun e!341382 () SeekEntryResult!6169)

(assert (=> b!597431 (= e!341382 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271268 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!271278 lt!271279 mask!3053))))

(declare-fun b!597432 () Bool)

(declare-fun c!67606 () Bool)

(assert (=> b!597432 (= c!67606 (= lt!271414 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597432 (= e!341384 e!341382)))

(declare-fun b!597433 () Bool)

(assert (=> b!597433 (= e!341382 (MissingVacant!6169 vacantSpotIndex!68))))

(assert (= (and d!86875 c!67607) b!597430))

(assert (= (and d!86875 (not c!67607)) b!597428))

(assert (= (and b!597428 c!67608) b!597429))

(assert (= (and b!597428 (not c!67608)) b!597432))

(assert (= (and b!597432 c!67606) b!597433))

(assert (= (and b!597432 (not c!67606)) b!597431))

(declare-fun m!575067 () Bool)

(assert (=> d!86875 m!575067))

(declare-fun m!575069 () Bool)

(assert (=> d!86875 m!575069))

(declare-fun m!575071 () Bool)

(assert (=> d!86875 m!575071))

(assert (=> d!86875 m!574823))

(assert (=> b!597431 m!575059))

(assert (=> b!597431 m!575059))

(declare-fun m!575073 () Bool)

(assert (=> b!597431 m!575073))

(assert (=> b!597148 d!86875))

(declare-fun d!86879 () Bool)

(declare-fun e!341397 () Bool)

(assert (=> d!86879 e!341397))

(declare-fun res!382959 () Bool)

(assert (=> d!86879 (=> (not res!382959) (not e!341397))))

(assert (=> d!86879 (= res!382959 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18137 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18137 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18137 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18137 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18137 a!2986))))))

(declare-fun lt!271424 () Unit!18769)

(declare-fun choose!9 (array!37023 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18769)

(assert (=> d!86879 (= lt!271424 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271268 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86879 (validMask!0 mask!3053)))

(assert (=> d!86879 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271268 vacantSpotIndex!68 mask!3053) lt!271424)))

(declare-fun b!597452 () Bool)

(assert (=> b!597452 (= e!341397 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271268 vacantSpotIndex!68 (select (arr!17773 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271268 vacantSpotIndex!68 (select (store (arr!17773 a!2986) i!1108 k0!1786) j!136) (array!37024 (store (arr!17773 a!2986) i!1108 k0!1786) (size!18137 a!2986)) mask!3053)))))

(assert (= (and d!86879 res!382959) b!597452))

(declare-fun m!575101 () Bool)

(assert (=> d!86879 m!575101))

(assert (=> d!86879 m!574823))

(assert (=> b!597452 m!574775))

(assert (=> b!597452 m!574815))

(assert (=> b!597452 m!574809))

(assert (=> b!597452 m!574775))

(assert (=> b!597452 m!574809))

(declare-fun m!575103 () Bool)

(assert (=> b!597452 m!575103))

(assert (=> b!597452 m!574799))

(assert (=> b!597148 d!86879))

(declare-fun d!86905 () Bool)

(declare-fun lt!271429 () (_ BitVec 32))

(assert (=> d!86905 (and (bvsge lt!271429 #b00000000000000000000000000000000) (bvslt lt!271429 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86905 (= lt!271429 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!86905 (validMask!0 mask!3053)))

(assert (=> d!86905 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!271429)))

(declare-fun bs!18385 () Bool)

(assert (= bs!18385 d!86905))

(declare-fun m!575113 () Bool)

(assert (=> bs!18385 m!575113))

(assert (=> bs!18385 m!574823))

(assert (=> b!597148 d!86905))

(declare-fun d!86909 () Bool)

(declare-fun res!382960 () Bool)

(declare-fun e!341401 () Bool)

(assert (=> d!86909 (=> res!382960 e!341401)))

(assert (=> d!86909 (= res!382960 (= (select (arr!17773 lt!271279) j!136) (select (arr!17773 a!2986) j!136)))))

(assert (=> d!86909 (= (arrayContainsKey!0 lt!271279 (select (arr!17773 a!2986) j!136) j!136) e!341401)))

(declare-fun b!597459 () Bool)

(declare-fun e!341402 () Bool)

(assert (=> b!597459 (= e!341401 e!341402)))

(declare-fun res!382961 () Bool)

(assert (=> b!597459 (=> (not res!382961) (not e!341402))))

(assert (=> b!597459 (= res!382961 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18137 lt!271279)))))

(declare-fun b!597460 () Bool)

(assert (=> b!597460 (= e!341402 (arrayContainsKey!0 lt!271279 (select (arr!17773 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86909 (not res!382960)) b!597459))

(assert (= (and b!597459 res!382961) b!597460))

(declare-fun m!575115 () Bool)

(assert (=> d!86909 m!575115))

(assert (=> b!597460 m!574775))

(declare-fun m!575117 () Bool)

(assert (=> b!597460 m!575117))

(assert (=> b!597138 d!86909))

(declare-fun bm!32921 () Bool)

(declare-fun call!32924 () Bool)

(declare-fun c!67618 () Bool)

(assert (=> bm!32921 (= call!32924 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67618 (Cons!11717 (select (arr!17773 a!2986) #b00000000000000000000000000000000) Nil!11718) Nil!11718)))))

(declare-fun b!597461 () Bool)

(declare-fun e!341403 () Bool)

(assert (=> b!597461 (= e!341403 call!32924)))

(declare-fun b!597462 () Bool)

(assert (=> b!597462 (= e!341403 call!32924)))

(declare-fun b!597463 () Bool)

(declare-fun e!341406 () Bool)

(assert (=> b!597463 (= e!341406 (contains!2927 Nil!11718 (select (arr!17773 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86911 () Bool)

(declare-fun res!382964 () Bool)

(declare-fun e!341404 () Bool)

(assert (=> d!86911 (=> res!382964 e!341404)))

(assert (=> d!86911 (= res!382964 (bvsge #b00000000000000000000000000000000 (size!18137 a!2986)))))

(assert (=> d!86911 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11718) e!341404)))

(declare-fun b!597464 () Bool)

(declare-fun e!341405 () Bool)

(assert (=> b!597464 (= e!341404 e!341405)))

(declare-fun res!382962 () Bool)

(assert (=> b!597464 (=> (not res!382962) (not e!341405))))

(assert (=> b!597464 (= res!382962 (not e!341406))))

(declare-fun res!382963 () Bool)

(assert (=> b!597464 (=> (not res!382963) (not e!341406))))

(assert (=> b!597464 (= res!382963 (validKeyInArray!0 (select (arr!17773 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597465 () Bool)

(assert (=> b!597465 (= e!341405 e!341403)))

(assert (=> b!597465 (= c!67618 (validKeyInArray!0 (select (arr!17773 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86911 (not res!382964)) b!597464))

(assert (= (and b!597464 res!382963) b!597463))

(assert (= (and b!597464 res!382962) b!597465))

(assert (= (and b!597465 c!67618) b!597461))

(assert (= (and b!597465 (not c!67618)) b!597462))

(assert (= (or b!597461 b!597462) bm!32921))

(assert (=> bm!32921 m!574937))

(declare-fun m!575119 () Bool)

(assert (=> bm!32921 m!575119))

(assert (=> b!597463 m!574937))

(assert (=> b!597463 m!574937))

(declare-fun m!575121 () Bool)

(assert (=> b!597463 m!575121))

(assert (=> b!597464 m!574937))

(assert (=> b!597464 m!574937))

(assert (=> b!597464 m!574947))

(assert (=> b!597465 m!574937))

(assert (=> b!597465 m!574937))

(assert (=> b!597465 m!574947))

(assert (=> b!597140 d!86911))

(declare-fun d!86913 () Bool)

(assert (=> d!86913 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597141 d!86913))

(check-sat (not d!86879) (not b!597411) (not d!86851) (not b!597460) (not b!597298) (not d!86875) (not d!86833) (not b!597431) (not bm!32907) (not d!86871) (not b!597465) (not b!597288) (not b!597273) (not b!597401) (not d!86869) (not b!597289) (not b!597452) (not b!597463) (not d!86839) (not b!597318) (not b!597287) (not bm!32921) (not d!86905) (not b!597292) (not b!597403) (not b!597464) (not b!597423) (not d!86837) (not bm!32910) (not b!597271) (not b!597314))
(check-sat)
