; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54070 () Bool)

(assert start!54070)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!337198 () Bool)

(declare-datatypes ((array!36857 0))(
  ( (array!36858 (arr!17700 (Array (_ BitVec 32) (_ BitVec 64))) (size!18064 (_ BitVec 32))) )
))
(declare-fun lt!267964 () array!36857)

(declare-fun b!590623 () Bool)

(declare-fun a!2986 () array!36857)

(declare-fun arrayContainsKey!0 (array!36857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590623 (= e!337198 (arrayContainsKey!0 lt!267964 (select (arr!17700 a!2986) j!136) j!136))))

(declare-fun b!590624 () Bool)

(declare-fun res!377829 () Bool)

(declare-fun e!337201 () Bool)

(assert (=> b!590624 (=> (not res!377829) (not e!337201))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!590624 (= res!377829 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590625 () Bool)

(declare-datatypes ((Unit!18478 0))(
  ( (Unit!18479) )
))
(declare-fun e!337200 () Unit!18478)

(declare-fun Unit!18480 () Unit!18478)

(assert (=> b!590625 (= e!337200 Unit!18480)))

(assert (=> b!590625 false))

(declare-fun b!590626 () Bool)

(declare-fun e!337202 () Bool)

(declare-fun e!337196 () Bool)

(assert (=> b!590626 (= e!337202 e!337196)))

(declare-fun res!377836 () Bool)

(assert (=> b!590626 (=> (not res!377836) (not e!337196))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6140 0))(
  ( (MissingZero!6140 (index!26793 (_ BitVec 32))) (Found!6140 (index!26794 (_ BitVec 32))) (Intermediate!6140 (undefined!6952 Bool) (index!26795 (_ BitVec 32)) (x!55587 (_ BitVec 32))) (Undefined!6140) (MissingVacant!6140 (index!26796 (_ BitVec 32))) )
))
(declare-fun lt!267965 () SeekEntryResult!6140)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!590626 (= res!377836 (and (= lt!267965 (Found!6140 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17700 a!2986) index!984) (select (arr!17700 a!2986) j!136))) (not (= (select (arr!17700 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36857 (_ BitVec 32)) SeekEntryResult!6140)

(assert (=> b!590626 (= lt!267965 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17700 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590627 () Bool)

(declare-fun e!337195 () Bool)

(declare-fun lt!267963 () SeekEntryResult!6140)

(assert (=> b!590627 (= e!337195 (= lt!267965 lt!267963))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun e!337197 () Bool)

(declare-fun lt!267970 () (_ BitVec 64))

(declare-fun b!590628 () Bool)

(assert (=> b!590628 (= e!337197 (or (not (= (select (arr!17700 a!2986) j!136) lt!267970)) (not (= (select (arr!17700 a!2986) j!136) (select (store (arr!17700 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984) (bvsge index!984 (size!18064 a!2986)) (bvslt (size!18064 a!2986) #b01111111111111111111111111111111)))))

(declare-fun e!337194 () Bool)

(assert (=> b!590628 e!337194))

(declare-fun res!377835 () Bool)

(assert (=> b!590628 (=> (not res!377835) (not e!337194))))

(assert (=> b!590628 (= res!377835 (= (select (store (arr!17700 a!2986) i!1108 k!1786) index!984) (select (arr!17700 a!2986) j!136)))))

(declare-fun b!590629 () Bool)

(declare-fun res!377834 () Bool)

(declare-fun e!337203 () Bool)

(assert (=> b!590629 (=> (not res!377834) (not e!337203))))

(assert (=> b!590629 (= res!377834 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17700 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590630 () Bool)

(declare-fun res!377830 () Bool)

(assert (=> b!590630 (=> (not res!377830) (not e!337201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590630 (= res!377830 (validKeyInArray!0 (select (arr!17700 a!2986) j!136)))))

(declare-fun b!590631 () Bool)

(declare-fun res!377828 () Bool)

(assert (=> b!590631 (=> (not res!377828) (not e!337201))))

(assert (=> b!590631 (= res!377828 (and (= (size!18064 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18064 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18064 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590632 () Bool)

(assert (=> b!590632 (= e!337201 e!337203)))

(declare-fun res!377823 () Bool)

(assert (=> b!590632 (=> (not res!377823) (not e!337203))))

(declare-fun lt!267969 () SeekEntryResult!6140)

(assert (=> b!590632 (= res!377823 (or (= lt!267969 (MissingZero!6140 i!1108)) (= lt!267969 (MissingVacant!6140 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36857 (_ BitVec 32)) SeekEntryResult!6140)

(assert (=> b!590632 (= lt!267969 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!590634 () Bool)

(assert (=> b!590634 (= e!337203 e!337202)))

(declare-fun res!377826 () Bool)

(assert (=> b!590634 (=> (not res!377826) (not e!337202))))

(assert (=> b!590634 (= res!377826 (= (select (store (arr!17700 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590634 (= lt!267964 (array!36858 (store (arr!17700 a!2986) i!1108 k!1786) (size!18064 a!2986)))))

(declare-fun b!590635 () Bool)

(assert (=> b!590635 (= e!337196 (not e!337197))))

(declare-fun res!377825 () Bool)

(assert (=> b!590635 (=> res!377825 e!337197)))

(declare-fun lt!267967 () SeekEntryResult!6140)

(assert (=> b!590635 (= res!377825 (not (= lt!267967 (Found!6140 index!984))))))

(declare-fun lt!267968 () Unit!18478)

(assert (=> b!590635 (= lt!267968 e!337200)))

(declare-fun c!66767 () Bool)

(assert (=> b!590635 (= c!66767 (= lt!267967 Undefined!6140))))

(assert (=> b!590635 (= lt!267967 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267970 lt!267964 mask!3053))))

(assert (=> b!590635 e!337195))

(declare-fun res!377824 () Bool)

(assert (=> b!590635 (=> (not res!377824) (not e!337195))))

(declare-fun lt!267962 () (_ BitVec 32))

(assert (=> b!590635 (= res!377824 (= lt!267963 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267962 vacantSpotIndex!68 lt!267970 lt!267964 mask!3053)))))

(assert (=> b!590635 (= lt!267963 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267962 vacantSpotIndex!68 (select (arr!17700 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590635 (= lt!267970 (select (store (arr!17700 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267966 () Unit!18478)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18478)

(assert (=> b!590635 (= lt!267966 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267962 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590635 (= lt!267962 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!590636 () Bool)

(assert (=> b!590636 (= e!337194 e!337198)))

(declare-fun res!377831 () Bool)

(assert (=> b!590636 (=> res!377831 e!337198)))

(assert (=> b!590636 (= res!377831 (or (not (= (select (arr!17700 a!2986) j!136) lt!267970)) (not (= (select (arr!17700 a!2986) j!136) (select (store (arr!17700 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590637 () Bool)

(declare-fun res!377832 () Bool)

(assert (=> b!590637 (=> (not res!377832) (not e!337203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36857 (_ BitVec 32)) Bool)

(assert (=> b!590637 (= res!377832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590638 () Bool)

(declare-fun res!377837 () Bool)

(assert (=> b!590638 (=> (not res!377837) (not e!337203))))

(declare-datatypes ((List!11741 0))(
  ( (Nil!11738) (Cons!11737 (h!12782 (_ BitVec 64)) (t!17969 List!11741)) )
))
(declare-fun arrayNoDuplicates!0 (array!36857 (_ BitVec 32) List!11741) Bool)

(assert (=> b!590638 (= res!377837 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11738))))

(declare-fun b!590639 () Bool)

(declare-fun res!377833 () Bool)

(assert (=> b!590639 (=> (not res!377833) (not e!337201))))

(assert (=> b!590639 (= res!377833 (validKeyInArray!0 k!1786))))

(declare-fun b!590633 () Bool)

(declare-fun Unit!18481 () Unit!18478)

(assert (=> b!590633 (= e!337200 Unit!18481)))

(declare-fun res!377827 () Bool)

(assert (=> start!54070 (=> (not res!377827) (not e!337201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54070 (= res!377827 (validMask!0 mask!3053))))

(assert (=> start!54070 e!337201))

(assert (=> start!54070 true))

(declare-fun array_inv!13496 (array!36857) Bool)

(assert (=> start!54070 (array_inv!13496 a!2986)))

(assert (= (and start!54070 res!377827) b!590631))

(assert (= (and b!590631 res!377828) b!590630))

(assert (= (and b!590630 res!377830) b!590639))

(assert (= (and b!590639 res!377833) b!590624))

(assert (= (and b!590624 res!377829) b!590632))

(assert (= (and b!590632 res!377823) b!590637))

(assert (= (and b!590637 res!377832) b!590638))

(assert (= (and b!590638 res!377837) b!590629))

(assert (= (and b!590629 res!377834) b!590634))

(assert (= (and b!590634 res!377826) b!590626))

(assert (= (and b!590626 res!377836) b!590635))

(assert (= (and b!590635 res!377824) b!590627))

(assert (= (and b!590635 c!66767) b!590625))

(assert (= (and b!590635 (not c!66767)) b!590633))

(assert (= (and b!590635 (not res!377825)) b!590628))

(assert (= (and b!590628 res!377835) b!590636))

(assert (= (and b!590636 (not res!377831)) b!590623))

(declare-fun m!569005 () Bool)

(assert (=> b!590628 m!569005))

(declare-fun m!569007 () Bool)

(assert (=> b!590628 m!569007))

(declare-fun m!569009 () Bool)

(assert (=> b!590628 m!569009))

(declare-fun m!569011 () Bool)

(assert (=> b!590639 m!569011))

(declare-fun m!569013 () Bool)

(assert (=> b!590629 m!569013))

(declare-fun m!569015 () Bool)

(assert (=> b!590637 m!569015))

(assert (=> b!590630 m!569005))

(assert (=> b!590630 m!569005))

(declare-fun m!569017 () Bool)

(assert (=> b!590630 m!569017))

(declare-fun m!569019 () Bool)

(assert (=> b!590624 m!569019))

(declare-fun m!569021 () Bool)

(assert (=> b!590632 m!569021))

(assert (=> b!590623 m!569005))

(assert (=> b!590623 m!569005))

(declare-fun m!569023 () Bool)

(assert (=> b!590623 m!569023))

(assert (=> b!590636 m!569005))

(assert (=> b!590636 m!569007))

(assert (=> b!590636 m!569009))

(assert (=> b!590634 m!569007))

(declare-fun m!569025 () Bool)

(assert (=> b!590634 m!569025))

(declare-fun m!569027 () Bool)

(assert (=> b!590635 m!569027))

(declare-fun m!569029 () Bool)

(assert (=> b!590635 m!569029))

(declare-fun m!569031 () Bool)

(assert (=> b!590635 m!569031))

(assert (=> b!590635 m!569005))

(assert (=> b!590635 m!569007))

(assert (=> b!590635 m!569005))

(declare-fun m!569033 () Bool)

(assert (=> b!590635 m!569033))

(declare-fun m!569035 () Bool)

(assert (=> b!590635 m!569035))

(declare-fun m!569037 () Bool)

(assert (=> b!590635 m!569037))

(declare-fun m!569039 () Bool)

(assert (=> b!590638 m!569039))

(declare-fun m!569041 () Bool)

(assert (=> b!590626 m!569041))

(assert (=> b!590626 m!569005))

(assert (=> b!590626 m!569005))

(declare-fun m!569043 () Bool)

(assert (=> b!590626 m!569043))

(declare-fun m!569045 () Bool)

(assert (=> start!54070 m!569045))

(declare-fun m!569047 () Bool)

(assert (=> start!54070 m!569047))

(push 1)

(assert (not b!590638))

(assert (not b!590624))

(assert (not b!590626))

(assert (not b!590623))

(assert (not b!590637))

(assert (not start!54070))

(assert (not b!590630))

(assert (not b!590635))

(assert (not b!590639))

(assert (not b!590632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86131 () Bool)

(declare-fun res!377944 () Bool)

(declare-fun e!337295 () Bool)

(assert (=> d!86131 (=> res!377944 e!337295)))

(assert (=> d!86131 (= res!377944 (= (select (arr!17700 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!86131 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!337295)))

(declare-fun b!590788 () Bool)

(declare-fun e!337296 () Bool)

(assert (=> b!590788 (= e!337295 e!337296)))

(declare-fun res!377945 () Bool)

(assert (=> b!590788 (=> (not res!377945) (not e!337296))))

(assert (=> b!590788 (= res!377945 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18064 a!2986)))))

(declare-fun b!590789 () Bool)

(assert (=> b!590789 (= e!337296 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86131 (not res!377944)) b!590788))

(assert (= (and b!590788 res!377945) b!590789))

(declare-fun m!569173 () Bool)

(assert (=> d!86131 m!569173))

(declare-fun m!569175 () Bool)

(assert (=> b!590789 m!569175))

(assert (=> b!590624 d!86131))

(declare-fun b!590835 () Bool)

(declare-fun e!337324 () SeekEntryResult!6140)

(assert (=> b!590835 (= e!337324 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!267970 lt!267964 mask!3053))))

(declare-fun d!86137 () Bool)

(declare-fun lt!268060 () SeekEntryResult!6140)

(assert (=> d!86137 (and (or (is-Undefined!6140 lt!268060) (not (is-Found!6140 lt!268060)) (and (bvsge (index!26794 lt!268060) #b00000000000000000000000000000000) (bvslt (index!26794 lt!268060) (size!18064 lt!267964)))) (or (is-Undefined!6140 lt!268060) (is-Found!6140 lt!268060) (not (is-MissingVacant!6140 lt!268060)) (not (= (index!26796 lt!268060) vacantSpotIndex!68)) (and (bvsge (index!26796 lt!268060) #b00000000000000000000000000000000) (bvslt (index!26796 lt!268060) (size!18064 lt!267964)))) (or (is-Undefined!6140 lt!268060) (ite (is-Found!6140 lt!268060) (= (select (arr!17700 lt!267964) (index!26794 lt!268060)) lt!267970) (and (is-MissingVacant!6140 lt!268060) (= (index!26796 lt!268060) vacantSpotIndex!68) (= (select (arr!17700 lt!267964) (index!26796 lt!268060)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!337326 () SeekEntryResult!6140)

(assert (=> d!86137 (= lt!268060 e!337326)))

(declare-fun c!66808 () Bool)

(assert (=> d!86137 (= c!66808 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!268061 () (_ BitVec 64))

(assert (=> d!86137 (= lt!268061 (select (arr!17700 lt!267964) index!984))))

(assert (=> d!86137 (validMask!0 mask!3053)))

(assert (=> d!86137 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267970 lt!267964 mask!3053) lt!268060)))

(declare-fun b!590836 () Bool)

(declare-fun e!337325 () SeekEntryResult!6140)

(assert (=> b!590836 (= e!337326 e!337325)))

(declare-fun c!66809 () Bool)

(assert (=> b!590836 (= c!66809 (= lt!268061 lt!267970))))

(declare-fun b!590837 () Bool)

(declare-fun c!66807 () Bool)

(assert (=> b!590837 (= c!66807 (= lt!268061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590837 (= e!337325 e!337324)))

(declare-fun b!590838 () Bool)

(assert (=> b!590838 (= e!337324 (MissingVacant!6140 vacantSpotIndex!68))))

(declare-fun b!590839 () Bool)

(assert (=> b!590839 (= e!337325 (Found!6140 index!984))))

(declare-fun b!590840 () Bool)

(assert (=> b!590840 (= e!337326 Undefined!6140)))

(assert (= (and d!86137 c!66808) b!590840))

(assert (= (and d!86137 (not c!66808)) b!590836))

(assert (= (and b!590836 c!66809) b!590839))

(assert (= (and b!590836 (not c!66809)) b!590837))

(assert (= (and b!590837 c!66807) b!590838))

(assert (= (and b!590837 (not c!66807)) b!590835))

(assert (=> b!590835 m!569029))

(assert (=> b!590835 m!569029))

(declare-fun m!569203 () Bool)

(assert (=> b!590835 m!569203))

(declare-fun m!569207 () Bool)

(assert (=> d!86137 m!569207))

(declare-fun m!569209 () Bool)

(assert (=> d!86137 m!569209))

(declare-fun m!569211 () Bool)

(assert (=> d!86137 m!569211))

(assert (=> d!86137 m!569045))

(assert (=> b!590635 d!86137))

(declare-fun d!86151 () Bool)

(declare-fun lt!268071 () (_ BitVec 32))

(assert (=> d!86151 (and (bvsge lt!268071 #b00000000000000000000000000000000) (bvslt lt!268071 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86151 (= lt!268071 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86151 (validMask!0 mask!3053)))

(assert (=> d!86151 (= (nextIndex!0 index!984 x!910 mask!3053) lt!268071)))

(declare-fun bs!18261 () Bool)

(assert (= bs!18261 d!86151))

(declare-fun m!569227 () Bool)

(assert (=> bs!18261 m!569227))

(assert (=> bs!18261 m!569045))

(assert (=> b!590635 d!86151))

(declare-fun b!590853 () Bool)

(declare-fun e!337333 () SeekEntryResult!6140)

(assert (=> b!590853 (= e!337333 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!267962 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!267970 lt!267964 mask!3053))))

(declare-fun d!86157 () Bool)

(declare-fun lt!268072 () SeekEntryResult!6140)

(assert (=> d!86157 (and (or (is-Undefined!6140 lt!268072) (not (is-Found!6140 lt!268072)) (and (bvsge (index!26794 lt!268072) #b00000000000000000000000000000000) (bvslt (index!26794 lt!268072) (size!18064 lt!267964)))) (or (is-Undefined!6140 lt!268072) (is-Found!6140 lt!268072) (not (is-MissingVacant!6140 lt!268072)) (not (= (index!26796 lt!268072) vacantSpotIndex!68)) (and (bvsge (index!26796 lt!268072) #b00000000000000000000000000000000) (bvslt (index!26796 lt!268072) (size!18064 lt!267964)))) (or (is-Undefined!6140 lt!268072) (ite (is-Found!6140 lt!268072) (= (select (arr!17700 lt!267964) (index!26794 lt!268072)) lt!267970) (and (is-MissingVacant!6140 lt!268072) (= (index!26796 lt!268072) vacantSpotIndex!68) (= (select (arr!17700 lt!267964) (index!26796 lt!268072)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!337335 () SeekEntryResult!6140)

(assert (=> d!86157 (= lt!268072 e!337335)))

(declare-fun c!66817 () Bool)

(assert (=> d!86157 (= c!66817 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!268073 () (_ BitVec 64))

(assert (=> d!86157 (= lt!268073 (select (arr!17700 lt!267964) lt!267962))))

(assert (=> d!86157 (validMask!0 mask!3053)))

(assert (=> d!86157 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267962 vacantSpotIndex!68 lt!267970 lt!267964 mask!3053) lt!268072)))

(declare-fun b!590854 () Bool)

(declare-fun e!337334 () SeekEntryResult!6140)

(assert (=> b!590854 (= e!337335 e!337334)))

(declare-fun c!66818 () Bool)

(assert (=> b!590854 (= c!66818 (= lt!268073 lt!267970))))

(declare-fun b!590855 () Bool)

(declare-fun c!66816 () Bool)

(assert (=> b!590855 (= c!66816 (= lt!268073 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590855 (= e!337334 e!337333)))

(declare-fun b!590856 () Bool)

(assert (=> b!590856 (= e!337333 (MissingVacant!6140 vacantSpotIndex!68))))

(declare-fun b!590857 () Bool)

(assert (=> b!590857 (= e!337334 (Found!6140 lt!267962))))

(declare-fun b!590858 () Bool)

(assert (=> b!590858 (= e!337335 Undefined!6140)))

(assert (= (and d!86157 c!66817) b!590858))

(assert (= (and d!86157 (not c!66817)) b!590854))

(assert (= (and b!590854 c!66818) b!590857))

(assert (= (and b!590854 (not c!66818)) b!590855))

(assert (= (and b!590855 c!66816) b!590856))

(assert (= (and b!590855 (not c!66816)) b!590853))

(declare-fun m!569229 () Bool)

(assert (=> b!590853 m!569229))

(assert (=> b!590853 m!569229))

(declare-fun m!569231 () Bool)

(assert (=> b!590853 m!569231))

(declare-fun m!569233 () Bool)

(assert (=> d!86157 m!569233))

(declare-fun m!569235 () Bool)

(assert (=> d!86157 m!569235))

(declare-fun m!569237 () Bool)

(assert (=> d!86157 m!569237))

(assert (=> d!86157 m!569045))

(assert (=> b!590635 d!86157))

(declare-fun d!86159 () Bool)

(declare-fun e!337346 () Bool)

(assert (=> d!86159 e!337346))

(declare-fun res!377960 () Bool)

(assert (=> d!86159 (=> (not res!377960) (not e!337346))))

(assert (=> d!86159 (= res!377960 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18064 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18064 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18064 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18064 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18064 a!2986))))))

(declare-fun lt!268085 () Unit!18478)

(declare-fun choose!9 (array!36857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18478)

(assert (=> d!86159 (= lt!268085 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267962 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86159 (validMask!0 mask!3053)))

(assert (=> d!86159 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267962 vacantSpotIndex!68 mask!3053) lt!268085)))

(declare-fun b!590874 () Bool)

(assert (=> b!590874 (= e!337346 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267962 vacantSpotIndex!68 (select (arr!17700 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267962 vacantSpotIndex!68 (select (store (arr!17700 a!2986) i!1108 k!1786) j!136) (array!36858 (store (arr!17700 a!2986) i!1108 k!1786) (size!18064 a!2986)) mask!3053)))))

(assert (= (and d!86159 res!377960) b!590874))

(declare-fun m!569251 () Bool)

(assert (=> d!86159 m!569251))

(assert (=> d!86159 m!569045))

(assert (=> b!590874 m!569005))

(assert (=> b!590874 m!569031))

(assert (=> b!590874 m!569007))

(assert (=> b!590874 m!569005))

(assert (=> b!590874 m!569033))

(assert (=> b!590874 m!569031))

(declare-fun m!569253 () Bool)

(assert (=> b!590874 m!569253))

(assert (=> b!590635 d!86159))

(declare-fun e!337351 () SeekEntryResult!6140)

(declare-fun b!590883 () Bool)

(assert (=> b!590883 (= e!337351 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!267962 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17700 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!86165 () Bool)

(declare-fun lt!268088 () SeekEntryResult!6140)

(assert (=> d!86165 (and (or (is-Undefined!6140 lt!268088) (not (is-Found!6140 lt!268088)) (and (bvsge (index!26794 lt!268088) #b00000000000000000000000000000000) (bvslt (index!26794 lt!268088) (size!18064 a!2986)))) (or (is-Undefined!6140 lt!268088) (is-Found!6140 lt!268088) (not (is-MissingVacant!6140 lt!268088)) (not (= (index!26796 lt!268088) vacantSpotIndex!68)) (and (bvsge (index!26796 lt!268088) #b00000000000000000000000000000000) (bvslt (index!26796 lt!268088) (size!18064 a!2986)))) (or (is-Undefined!6140 lt!268088) (ite (is-Found!6140 lt!268088) (= (select (arr!17700 a!2986) (index!26794 lt!268088)) (select (arr!17700 a!2986) j!136)) (and (is-MissingVacant!6140 lt!268088) (= (index!26796 lt!268088) vacantSpotIndex!68) (= (select (arr!17700 a!2986) (index!26796 lt!268088)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!337353 () SeekEntryResult!6140)

(assert (=> d!86165 (= lt!268088 e!337353)))

(declare-fun c!66829 () Bool)

(assert (=> d!86165 (= c!66829 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!268089 () (_ BitVec 64))

(assert (=> d!86165 (= lt!268089 (select (arr!17700 a!2986) lt!267962))))

(assert (=> d!86165 (validMask!0 mask!3053)))

(assert (=> d!86165 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267962 vacantSpotIndex!68 (select (arr!17700 a!2986) j!136) a!2986 mask!3053) lt!268088)))

(declare-fun b!590884 () Bool)

(declare-fun e!337352 () SeekEntryResult!6140)

(assert (=> b!590884 (= e!337353 e!337352)))

(declare-fun c!66830 () Bool)

(assert (=> b!590884 (= c!66830 (= lt!268089 (select (arr!17700 a!2986) j!136)))))

(declare-fun b!590885 () Bool)

(declare-fun c!66828 () Bool)

(assert (=> b!590885 (= c!66828 (= lt!268089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590885 (= e!337352 e!337351)))

(declare-fun b!590886 () Bool)

(assert (=> b!590886 (= e!337351 (MissingVacant!6140 vacantSpotIndex!68))))

(declare-fun b!590887 () Bool)

(assert (=> b!590887 (= e!337352 (Found!6140 lt!267962))))

(declare-fun b!590888 () Bool)

(assert (=> b!590888 (= e!337353 Undefined!6140)))

(assert (= (and d!86165 c!66829) b!590888))

(assert (= (and d!86165 (not c!66829)) b!590884))

(assert (= (and b!590884 c!66830) b!590887))

(assert (= (and b!590884 (not c!66830)) b!590885))

(assert (= (and b!590885 c!66828) b!590886))

(assert (= (and b!590885 (not c!66828)) b!590883))

(assert (=> b!590883 m!569229))

(assert (=> b!590883 m!569229))

(assert (=> b!590883 m!569005))

(declare-fun m!569255 () Bool)

(assert (=> b!590883 m!569255))

(declare-fun m!569257 () Bool)

(assert (=> d!86165 m!569257))

(declare-fun m!569259 () Bool)

(assert (=> d!86165 m!569259))

(declare-fun m!569261 () Bool)

(assert (=> d!86165 m!569261))

(assert (=> d!86165 m!569045))

(assert (=> b!590635 d!86165))

(declare-fun d!86167 () Bool)

(assert (=> d!86167 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!590639 d!86167))

(declare-fun d!86169 () Bool)

(declare-fun res!377961 () Bool)

(declare-fun e!337354 () Bool)

(assert (=> d!86169 (=> res!377961 e!337354)))

(assert (=> d!86169 (= res!377961 (= (select (arr!17700 lt!267964) j!136) (select (arr!17700 a!2986) j!136)))))

(assert (=> d!86169 (= (arrayContainsKey!0 lt!267964 (select (arr!17700 a!2986) j!136) j!136) e!337354)))

(declare-fun b!590889 () Bool)

(declare-fun e!337355 () Bool)

(assert (=> b!590889 (= e!337354 e!337355)))

(declare-fun res!377962 () Bool)

(assert (=> b!590889 (=> (not res!377962) (not e!337355))))

(assert (=> b!590889 (= res!377962 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18064 lt!267964)))))

(declare-fun b!590890 () Bool)

(assert (=> b!590890 (= e!337355 (arrayContainsKey!0 lt!267964 (select (arr!17700 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86169 (not res!377961)) b!590889))

(assert (= (and b!590889 res!377962) b!590890))

(declare-fun m!569263 () Bool)

(assert (=> d!86169 m!569263))

(assert (=> b!590890 m!569005))

(declare-fun m!569265 () Bool)

(assert (=> b!590890 m!569265))

(assert (=> b!590623 d!86169))

(declare-fun b!590929 () Bool)

(declare-fun e!337387 () Bool)

(declare-fun call!32824 () Bool)

(assert (=> b!590929 (= e!337387 call!32824)))

(declare-fun b!590930 () Bool)

(assert (=> b!590930 (= e!337387 call!32824)))

(declare-fun b!590931 () Bool)

(declare-fun e!337384 () Bool)

(declare-fun contains!2909 (List!11741 (_ BitVec 64)) Bool)

(assert (=> b!590931 (= e!337384 (contains!2909 Nil!11738 (select (arr!17700 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!590932 () Bool)

(declare-fun e!337386 () Bool)

(declare-fun e!337385 () Bool)

(assert (=> b!590932 (= e!337386 e!337385)))

(declare-fun res!377981 () Bool)

(assert (=> b!590932 (=> (not res!377981) (not e!337385))))

(assert (=> b!590932 (= res!377981 (not e!337384))))

(declare-fun res!377982 () Bool)

(assert (=> b!590932 (=> (not res!377982) (not e!337384))))

(assert (=> b!590932 (= res!377982 (validKeyInArray!0 (select (arr!17700 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86171 () Bool)

(declare-fun res!377983 () Bool)

(assert (=> d!86171 (=> res!377983 e!337386)))

(assert (=> d!86171 (= res!377983 (bvsge #b00000000000000000000000000000000 (size!18064 a!2986)))))

(assert (=> d!86171 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11738) e!337386)))

(declare-fun b!590933 () Bool)

(assert (=> b!590933 (= e!337385 e!337387)))

(declare-fun c!66841 () Bool)

(assert (=> b!590933 (= c!66841 (validKeyInArray!0 (select (arr!17700 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32821 () Bool)

(assert (=> bm!32821 (= call!32824 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66841 (Cons!11737 (select (arr!17700 a!2986) #b00000000000000000000000000000000) Nil!11738) Nil!11738)))))

(assert (= (and d!86171 (not res!377983)) b!590932))

(assert (= (and b!590932 res!377982) b!590931))

(assert (= (and b!590932 res!377981) b!590933))

(assert (= (and b!590933 c!66841) b!590930))

(assert (= (and b!590933 (not c!66841)) b!590929))

(assert (= (or b!590930 b!590929) bm!32821))

(assert (=> b!590931 m!569173))

(assert (=> b!590931 m!569173))

(declare-fun m!569291 () Bool)

(assert (=> b!590931 m!569291))

(assert (=> b!590932 m!569173))

(assert (=> b!590932 m!569173))

(declare-fun m!569293 () Bool)

(assert (=> b!590932 m!569293))

(assert (=> b!590933 m!569173))

(assert (=> b!590933 m!569173))

(assert (=> b!590933 m!569293))

(assert (=> bm!32821 m!569173))

(declare-fun m!569295 () Bool)

(assert (=> bm!32821 m!569295))

(assert (=> b!590638 d!86171))

(declare-fun b!590971 () Bool)

(declare-fun e!337409 () SeekEntryResult!6140)

(declare-fun e!337410 () SeekEntryResult!6140)

(assert (=> b!590971 (= e!337409 e!337410)))

(declare-fun lt!268118 () (_ BitVec 64))

(declare-fun lt!268117 () SeekEntryResult!6140)

(assert (=> b!590971 (= lt!268118 (select (arr!17700 a!2986) (index!26795 lt!268117)))))

(declare-fun c!66858 () Bool)

(assert (=> b!590971 (= c!66858 (= lt!268118 k!1786))))

(declare-fun b!590972 () Bool)

(assert (=> b!590972 (= e!337410 (Found!6140 (index!26795 lt!268117)))))

(declare-fun e!337411 () SeekEntryResult!6140)

(declare-fun b!590973 () Bool)

(assert (=> b!590973 (= e!337411 (seekKeyOrZeroReturnVacant!0 (x!55587 lt!268117) (index!26795 lt!268117) (index!26795 lt!268117) k!1786 a!2986 mask!3053))))

(declare-fun d!86177 () Bool)

(declare-fun lt!268119 () SeekEntryResult!6140)

(assert (=> d!86177 (and (or (is-Undefined!6140 lt!268119) (not (is-Found!6140 lt!268119)) (and (bvsge (index!26794 lt!268119) #b00000000000000000000000000000000) (bvslt (index!26794 lt!268119) (size!18064 a!2986)))) (or (is-Undefined!6140 lt!268119) (is-Found!6140 lt!268119) (not (is-MissingZero!6140 lt!268119)) (and (bvsge (index!26793 lt!268119) #b00000000000000000000000000000000) (bvslt (index!26793 lt!268119) (size!18064 a!2986)))) (or (is-Undefined!6140 lt!268119) (is-Found!6140 lt!268119) (is-MissingZero!6140 lt!268119) (not (is-MissingVacant!6140 lt!268119)) (and (bvsge (index!26796 lt!268119) #b00000000000000000000000000000000) (bvslt (index!26796 lt!268119) (size!18064 a!2986)))) (or (is-Undefined!6140 lt!268119) (ite (is-Found!6140 lt!268119) (= (select (arr!17700 a!2986) (index!26794 lt!268119)) k!1786) (ite (is-MissingZero!6140 lt!268119) (= (select (arr!17700 a!2986) (index!26793 lt!268119)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6140 lt!268119) (= (select (arr!17700 a!2986) (index!26796 lt!268119)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86177 (= lt!268119 e!337409)))

(declare-fun c!66859 () Bool)

