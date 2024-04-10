; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54074 () Bool)

(assert start!54074)

(declare-fun b!590726 () Bool)

(declare-fun e!337256 () Bool)

(declare-fun e!337263 () Bool)

(assert (=> b!590726 (= e!337256 e!337263)))

(declare-fun res!377927 () Bool)

(assert (=> b!590726 (=> (not res!377927) (not e!337263))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6142 0))(
  ( (MissingZero!6142 (index!26801 (_ BitVec 32))) (Found!6142 (index!26802 (_ BitVec 32))) (Intermediate!6142 (undefined!6954 Bool) (index!26803 (_ BitVec 32)) (x!55589 (_ BitVec 32))) (Undefined!6142) (MissingVacant!6142 (index!26804 (_ BitVec 32))) )
))
(declare-fun lt!268022 () SeekEntryResult!6142)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36861 0))(
  ( (array!36862 (arr!17702 (Array (_ BitVec 32) (_ BitVec 64))) (size!18066 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36861)

(assert (=> b!590726 (= res!377927 (and (= lt!268022 (Found!6142 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17702 a!2986) index!984) (select (arr!17702 a!2986) j!136))) (not (= (select (arr!17702 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36861 (_ BitVec 32)) SeekEntryResult!6142)

(assert (=> b!590726 (= lt!268022 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17702 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590727 () Bool)

(declare-datatypes ((Unit!18486 0))(
  ( (Unit!18487) )
))
(declare-fun e!337254 () Unit!18486)

(declare-fun Unit!18488 () Unit!18486)

(assert (=> b!590727 (= e!337254 Unit!18488)))

(declare-fun b!590728 () Bool)

(declare-fun e!337258 () Bool)

(assert (=> b!590728 (= e!337263 (not e!337258))))

(declare-fun res!377919 () Bool)

(assert (=> b!590728 (=> res!377919 e!337258)))

(declare-fun lt!268019 () SeekEntryResult!6142)

(assert (=> b!590728 (= res!377919 (not (= lt!268019 (Found!6142 index!984))))))

(declare-fun lt!268024 () Unit!18486)

(assert (=> b!590728 (= lt!268024 e!337254)))

(declare-fun c!66773 () Bool)

(assert (=> b!590728 (= c!66773 (= lt!268019 Undefined!6142))))

(declare-fun lt!268017 () array!36861)

(declare-fun lt!268018 () (_ BitVec 64))

(assert (=> b!590728 (= lt!268019 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268018 lt!268017 mask!3053))))

(declare-fun e!337262 () Bool)

(assert (=> b!590728 e!337262))

(declare-fun res!377924 () Bool)

(assert (=> b!590728 (=> (not res!377924) (not e!337262))))

(declare-fun lt!268023 () (_ BitVec 32))

(declare-fun lt!268020 () SeekEntryResult!6142)

(assert (=> b!590728 (= res!377924 (= lt!268020 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268023 vacantSpotIndex!68 lt!268018 lt!268017 mask!3053)))))

(assert (=> b!590728 (= lt!268020 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268023 vacantSpotIndex!68 (select (arr!17702 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!590728 (= lt!268018 (select (store (arr!17702 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268016 () Unit!18486)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36861 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18486)

(assert (=> b!590728 (= lt!268016 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268023 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590728 (= lt!268023 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!590729 () Bool)

(declare-fun res!377926 () Bool)

(declare-fun e!337259 () Bool)

(assert (=> b!590729 (=> (not res!377926) (not e!337259))))

(declare-fun arrayContainsKey!0 (array!36861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590729 (= res!377926 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun e!337260 () Bool)

(declare-fun b!590730 () Bool)

(assert (=> b!590730 (= e!337260 (arrayContainsKey!0 lt!268017 (select (arr!17702 a!2986) j!136) j!136))))

(declare-fun b!590731 () Bool)

(declare-fun res!377916 () Bool)

(declare-fun e!337255 () Bool)

(assert (=> b!590731 (=> (not res!377916) (not e!337255))))

(declare-datatypes ((List!11743 0))(
  ( (Nil!11740) (Cons!11739 (h!12784 (_ BitVec 64)) (t!17971 List!11743)) )
))
(declare-fun arrayNoDuplicates!0 (array!36861 (_ BitVec 32) List!11743) Bool)

(assert (=> b!590731 (= res!377916 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11740))))

(declare-fun b!590732 () Bool)

(assert (=> b!590732 (= e!337259 e!337255)))

(declare-fun res!377918 () Bool)

(assert (=> b!590732 (=> (not res!377918) (not e!337255))))

(declare-fun lt!268021 () SeekEntryResult!6142)

(assert (=> b!590732 (= res!377918 (or (= lt!268021 (MissingZero!6142 i!1108)) (= lt!268021 (MissingVacant!6142 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36861 (_ BitVec 32)) SeekEntryResult!6142)

(assert (=> b!590732 (= lt!268021 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!590733 () Bool)

(declare-fun res!377921 () Bool)

(assert (=> b!590733 (=> (not res!377921) (not e!337255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36861 (_ BitVec 32)) Bool)

(assert (=> b!590733 (= res!377921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590734 () Bool)

(declare-fun res!377915 () Bool)

(assert (=> b!590734 (=> (not res!377915) (not e!337255))))

(assert (=> b!590734 (= res!377915 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17702 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590735 () Bool)

(assert (=> b!590735 (= e!337262 (= lt!268022 lt!268020))))

(declare-fun b!590736 () Bool)

(declare-fun res!377917 () Bool)

(assert (=> b!590736 (=> (not res!377917) (not e!337259))))

(assert (=> b!590736 (= res!377917 (and (= (size!18066 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18066 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18066 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590737 () Bool)

(declare-fun Unit!18489 () Unit!18486)

(assert (=> b!590737 (= e!337254 Unit!18489)))

(assert (=> b!590737 false))

(declare-fun b!590725 () Bool)

(declare-fun res!377914 () Bool)

(assert (=> b!590725 (=> (not res!377914) (not e!337259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590725 (= res!377914 (validKeyInArray!0 k!1786))))

(declare-fun res!377922 () Bool)

(assert (=> start!54074 (=> (not res!377922) (not e!337259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54074 (= res!377922 (validMask!0 mask!3053))))

(assert (=> start!54074 e!337259))

(assert (=> start!54074 true))

(declare-fun array_inv!13498 (array!36861) Bool)

(assert (=> start!54074 (array_inv!13498 a!2986)))

(declare-fun b!590738 () Bool)

(declare-fun e!337257 () Bool)

(assert (=> b!590738 (= e!337257 e!337260)))

(declare-fun res!377923 () Bool)

(assert (=> b!590738 (=> res!377923 e!337260)))

(assert (=> b!590738 (= res!377923 (or (not (= (select (arr!17702 a!2986) j!136) lt!268018)) (not (= (select (arr!17702 a!2986) j!136) (select (store (arr!17702 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590739 () Bool)

(assert (=> b!590739 (= e!337258 (or (not (= (select (arr!17702 a!2986) j!136) lt!268018)) (not (= (select (arr!17702 a!2986) j!136) (select (store (arr!17702 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984) (bvsge index!984 (size!18066 a!2986)) (bvslt (size!18066 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!590739 e!337257))

(declare-fun res!377925 () Bool)

(assert (=> b!590739 (=> (not res!377925) (not e!337257))))

(assert (=> b!590739 (= res!377925 (= (select (store (arr!17702 a!2986) i!1108 k!1786) index!984) (select (arr!17702 a!2986) j!136)))))

(declare-fun b!590740 () Bool)

(assert (=> b!590740 (= e!337255 e!337256)))

(declare-fun res!377913 () Bool)

(assert (=> b!590740 (=> (not res!377913) (not e!337256))))

(assert (=> b!590740 (= res!377913 (= (select (store (arr!17702 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590740 (= lt!268017 (array!36862 (store (arr!17702 a!2986) i!1108 k!1786) (size!18066 a!2986)))))

(declare-fun b!590741 () Bool)

(declare-fun res!377920 () Bool)

(assert (=> b!590741 (=> (not res!377920) (not e!337259))))

(assert (=> b!590741 (= res!377920 (validKeyInArray!0 (select (arr!17702 a!2986) j!136)))))

(assert (= (and start!54074 res!377922) b!590736))

(assert (= (and b!590736 res!377917) b!590741))

(assert (= (and b!590741 res!377920) b!590725))

(assert (= (and b!590725 res!377914) b!590729))

(assert (= (and b!590729 res!377926) b!590732))

(assert (= (and b!590732 res!377918) b!590733))

(assert (= (and b!590733 res!377921) b!590731))

(assert (= (and b!590731 res!377916) b!590734))

(assert (= (and b!590734 res!377915) b!590740))

(assert (= (and b!590740 res!377913) b!590726))

(assert (= (and b!590726 res!377927) b!590728))

(assert (= (and b!590728 res!377924) b!590735))

(assert (= (and b!590728 c!66773) b!590737))

(assert (= (and b!590728 (not c!66773)) b!590727))

(assert (= (and b!590728 (not res!377919)) b!590739))

(assert (= (and b!590739 res!377925) b!590738))

(assert (= (and b!590738 (not res!377923)) b!590730))

(declare-fun m!569093 () Bool)

(assert (=> start!54074 m!569093))

(declare-fun m!569095 () Bool)

(assert (=> start!54074 m!569095))

(declare-fun m!569097 () Bool)

(assert (=> b!590732 m!569097))

(declare-fun m!569099 () Bool)

(assert (=> b!590741 m!569099))

(assert (=> b!590741 m!569099))

(declare-fun m!569101 () Bool)

(assert (=> b!590741 m!569101))

(declare-fun m!569103 () Bool)

(assert (=> b!590731 m!569103))

(declare-fun m!569105 () Bool)

(assert (=> b!590734 m!569105))

(assert (=> b!590738 m!569099))

(declare-fun m!569107 () Bool)

(assert (=> b!590738 m!569107))

(declare-fun m!569109 () Bool)

(assert (=> b!590738 m!569109))

(declare-fun m!569111 () Bool)

(assert (=> b!590729 m!569111))

(assert (=> b!590740 m!569107))

(declare-fun m!569113 () Bool)

(assert (=> b!590740 m!569113))

(declare-fun m!569115 () Bool)

(assert (=> b!590725 m!569115))

(assert (=> b!590730 m!569099))

(assert (=> b!590730 m!569099))

(declare-fun m!569117 () Bool)

(assert (=> b!590730 m!569117))

(assert (=> b!590739 m!569099))

(assert (=> b!590739 m!569107))

(assert (=> b!590739 m!569109))

(declare-fun m!569119 () Bool)

(assert (=> b!590733 m!569119))

(declare-fun m!569121 () Bool)

(assert (=> b!590728 m!569121))

(declare-fun m!569123 () Bool)

(assert (=> b!590728 m!569123))

(assert (=> b!590728 m!569099))

(assert (=> b!590728 m!569107))

(assert (=> b!590728 m!569099))

(declare-fun m!569125 () Bool)

(assert (=> b!590728 m!569125))

(declare-fun m!569127 () Bool)

(assert (=> b!590728 m!569127))

(declare-fun m!569129 () Bool)

(assert (=> b!590728 m!569129))

(declare-fun m!569131 () Bool)

(assert (=> b!590728 m!569131))

(declare-fun m!569133 () Bool)

(assert (=> b!590726 m!569133))

(assert (=> b!590726 m!569099))

(assert (=> b!590726 m!569099))

(declare-fun m!569135 () Bool)

(assert (=> b!590726 m!569135))

(push 1)

(assert (not b!590725))

(assert (not b!590730))

(assert (not b!590731))

(assert (not b!590729))

(assert (not b!590732))

(assert (not b!590726))

(assert (not start!54074))

(assert (not b!590728))

(assert (not b!590733))

(assert (not b!590741))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86121 () Bool)

(declare-fun res!377938 () Bool)

(declare-fun e!337277 () Bool)

(assert (=> d!86121 (=> res!377938 e!337277)))

(assert (=> d!86121 (= res!377938 (= (select (arr!17702 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!86121 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!337277)))

(declare-fun b!590760 () Bool)

(declare-fun e!337278 () Bool)

(assert (=> b!590760 (= e!337277 e!337278)))

(declare-fun res!377939 () Bool)

(assert (=> b!590760 (=> (not res!377939) (not e!337278))))

(assert (=> b!590760 (= res!377939 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18066 a!2986)))))

(declare-fun b!590761 () Bool)

(assert (=> b!590761 (= e!337278 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86121 (not res!377938)) b!590760))

(assert (= (and b!590760 res!377939) b!590761))

(declare-fun m!569149 () Bool)

(assert (=> d!86121 m!569149))

(declare-fun m!569151 () Bool)

(assert (=> b!590761 m!569151))

(assert (=> b!590729 d!86121))

(declare-fun d!86123 () Bool)

(assert (=> d!86123 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54074 d!86123))

(declare-fun d!86133 () Bool)

(assert (=> d!86133 (= (array_inv!13498 a!2986) (bvsge (size!18066 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54074 d!86133))

(declare-fun b!590823 () Bool)

(declare-fun e!337317 () SeekEntryResult!6142)

(assert (=> b!590823 (= e!337317 Undefined!6142)))

(declare-fun d!86135 () Bool)

(declare-fun lt!268058 () SeekEntryResult!6142)

(assert (=> d!86135 (and (or (is-Undefined!6142 lt!268058) (not (is-Found!6142 lt!268058)) (and (bvsge (index!26802 lt!268058) #b00000000000000000000000000000000) (bvslt (index!26802 lt!268058) (size!18066 lt!268017)))) (or (is-Undefined!6142 lt!268058) (is-Found!6142 lt!268058) (not (is-MissingVacant!6142 lt!268058)) (not (= (index!26804 lt!268058) vacantSpotIndex!68)) (and (bvsge (index!26804 lt!268058) #b00000000000000000000000000000000) (bvslt (index!26804 lt!268058) (size!18066 lt!268017)))) (or (is-Undefined!6142 lt!268058) (ite (is-Found!6142 lt!268058) (= (select (arr!17702 lt!268017) (index!26802 lt!268058)) lt!268018) (and (is-MissingVacant!6142 lt!268058) (= (index!26804 lt!268058) vacantSpotIndex!68) (= (select (arr!17702 lt!268017) (index!26804 lt!268058)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86135 (= lt!268058 e!337317)))

(declare-fun c!66806 () Bool)

(assert (=> d!86135 (= c!66806 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!268059 () (_ BitVec 64))

(assert (=> d!86135 (= lt!268059 (select (arr!17702 lt!268017) lt!268023))))

(assert (=> d!86135 (validMask!0 mask!3053)))

(assert (=> d!86135 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268023 vacantSpotIndex!68 lt!268018 lt!268017 mask!3053) lt!268058)))

(declare-fun b!590824 () Bool)

(declare-fun c!66805 () Bool)

(assert (=> b!590824 (= c!66805 (= lt!268059 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!337316 () SeekEntryResult!6142)

(declare-fun e!337315 () SeekEntryResult!6142)

(assert (=> b!590824 (= e!337316 e!337315)))

(declare-fun b!590825 () Bool)

(assert (=> b!590825 (= e!337315 (MissingVacant!6142 vacantSpotIndex!68))))

(declare-fun b!590826 () Bool)

(assert (=> b!590826 (= e!337315 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!268023 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!268018 lt!268017 mask!3053))))

(declare-fun b!590827 () Bool)

(assert (=> b!590827 (= e!337316 (Found!6142 lt!268023))))

(declare-fun b!590828 () Bool)

(assert (=> b!590828 (= e!337317 e!337316)))

(declare-fun c!66804 () Bool)

(assert (=> b!590828 (= c!66804 (= lt!268059 lt!268018))))

(assert (= (and d!86135 c!66806) b!590823))

(assert (= (and d!86135 (not c!66806)) b!590828))

(assert (= (and b!590828 c!66804) b!590827))

(assert (= (and b!590828 (not c!66804)) b!590824))

(assert (= (and b!590824 c!66805) b!590825))

(assert (= (and b!590824 (not c!66805)) b!590826))

(declare-fun m!569189 () Bool)

(assert (=> d!86135 m!569189))

(declare-fun m!569191 () Bool)

(assert (=> d!86135 m!569191))

(declare-fun m!569193 () Bool)

(assert (=> d!86135 m!569193))

(assert (=> d!86135 m!569093))

(declare-fun m!569195 () Bool)

(assert (=> b!590826 m!569195))

(assert (=> b!590826 m!569195))

(declare-fun m!569197 () Bool)

(assert (=> b!590826 m!569197))

(assert (=> b!590728 d!86135))

(declare-fun d!86145 () Bool)

(declare-fun lt!268066 () (_ BitVec 32))

(assert (=> d!86145 (and (bvsge lt!268066 #b00000000000000000000000000000000) (bvslt lt!268066 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86145 (= lt!268066 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86145 (validMask!0 mask!3053)))

(assert (=> d!86145 (= (nextIndex!0 index!984 x!910 mask!3053) lt!268066)))

(declare-fun bs!18260 () Bool)

(assert (= bs!18260 d!86145))

(declare-fun m!569205 () Bool)

(assert (=> bs!18260 m!569205))

(assert (=> bs!18260 m!569093))

(assert (=> b!590728 d!86145))

(declare-fun b!590847 () Bool)

(declare-fun e!337332 () SeekEntryResult!6142)

(assert (=> b!590847 (= e!337332 Undefined!6142)))

(declare-fun d!86149 () Bool)

(declare-fun lt!268067 () SeekEntryResult!6142)

(assert (=> d!86149 (and (or (is-Undefined!6142 lt!268067) (not (is-Found!6142 lt!268067)) (and (bvsge (index!26802 lt!268067) #b00000000000000000000000000000000) (bvslt (index!26802 lt!268067) (size!18066 a!2986)))) (or (is-Undefined!6142 lt!268067) (is-Found!6142 lt!268067) (not (is-MissingVacant!6142 lt!268067)) (not (= (index!26804 lt!268067) vacantSpotIndex!68)) (and (bvsge (index!26804 lt!268067) #b00000000000000000000000000000000) (bvslt (index!26804 lt!268067) (size!18066 a!2986)))) (or (is-Undefined!6142 lt!268067) (ite (is-Found!6142 lt!268067) (= (select (arr!17702 a!2986) (index!26802 lt!268067)) (select (arr!17702 a!2986) j!136)) (and (is-MissingVacant!6142 lt!268067) (= (index!26804 lt!268067) vacantSpotIndex!68) (= (select (arr!17702 a!2986) (index!26804 lt!268067)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86149 (= lt!268067 e!337332)))

(declare-fun c!66815 () Bool)

(assert (=> d!86149 (= c!66815 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!268068 () (_ BitVec 64))

(assert (=> d!86149 (= lt!268068 (select (arr!17702 a!2986) lt!268023))))

(assert (=> d!86149 (validMask!0 mask!3053)))

(assert (=> d!86149 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268023 vacantSpotIndex!68 (select (arr!17702 a!2986) j!136) a!2986 mask!3053) lt!268067)))

(declare-fun b!590848 () Bool)

(declare-fun c!66814 () Bool)

(assert (=> b!590848 (= c!66814 (= lt!268068 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!337331 () SeekEntryResult!6142)

(declare-fun e!337330 () SeekEntryResult!6142)

(assert (=> b!590848 (= e!337331 e!337330)))

(declare-fun b!590849 () Bool)

(assert (=> b!590849 (= e!337330 (MissingVacant!6142 vacantSpotIndex!68))))

(declare-fun b!590850 () Bool)

(assert (=> b!590850 (= e!337330 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!268023 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17702 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590851 () Bool)

(assert (=> b!590851 (= e!337331 (Found!6142 lt!268023))))

(declare-fun b!590852 () Bool)

(assert (=> b!590852 (= e!337332 e!337331)))

(declare-fun c!66813 () Bool)

(assert (=> b!590852 (= c!66813 (= lt!268068 (select (arr!17702 a!2986) j!136)))))

(assert (= (and d!86149 c!66815) b!590847))

(assert (= (and d!86149 (not c!66815)) b!590852))

(assert (= (and b!590852 c!66813) b!590851))

(assert (= (and b!590852 (not c!66813)) b!590848))

(assert (= (and b!590848 c!66814) b!590849))

(assert (= (and b!590848 (not c!66814)) b!590850))

(declare-fun m!569219 () Bool)

(assert (=> d!86149 m!569219))

(declare-fun m!569221 () Bool)

(assert (=> d!86149 m!569221))

(declare-fun m!569223 () Bool)

(assert (=> d!86149 m!569223))

(assert (=> d!86149 m!569093))

(assert (=> b!590850 m!569195))

(assert (=> b!590850 m!569195))

(assert (=> b!590850 m!569099))

(declare-fun m!569225 () Bool)

(assert (=> b!590850 m!569225))

(assert (=> b!590728 d!86149))

(declare-fun d!86155 () Bool)

(declare-fun e!337338 () Bool)

(assert (=> d!86155 e!337338))

(declare-fun res!377957 () Bool)

(assert (=> d!86155 (=> (not res!377957) (not e!337338))))

(assert (=> d!86155 (= res!377957 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18066 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18066 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18066 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18066 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18066 a!2986))))))

(declare-fun lt!268076 () Unit!18486)

(declare-fun choose!9 (array!36861 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18486)

(assert (=> d!86155 (= lt!268076 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268023 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86155 (validMask!0 mask!3053)))

(assert (=> d!86155 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268023 vacantSpotIndex!68 mask!3053) lt!268076)))

(declare-fun b!590861 () Bool)

(assert (=> b!590861 (= e!337338 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268023 vacantSpotIndex!68 (select (arr!17702 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268023 vacantSpotIndex!68 (select (store (arr!17702 a!2986) i!1108 k!1786) j!136) (array!36862 (store (arr!17702 a!2986) i!1108 k!1786) (size!18066 a!2986)) mask!3053)))))

(assert (= (and d!86155 res!377957) b!590861))

(declare-fun m!569239 () Bool)

(assert (=> d!86155 m!569239))

(assert (=> d!86155 m!569093))

(assert (=> b!590861 m!569107))

(assert (=> b!590861 m!569099))

(assert (=> b!590861 m!569123))

(assert (=> b!590861 m!569123))

(declare-fun m!569241 () Bool)

(assert (=> b!590861 m!569241))

(assert (=> b!590861 m!569099))

(assert (=> b!590861 m!569125))

(assert (=> b!590728 d!86155))

(declare-fun b!590862 () Bool)

(declare-fun e!337341 () SeekEntryResult!6142)

(assert (=> b!590862 (= e!337341 Undefined!6142)))

(declare-fun lt!268077 () SeekEntryResult!6142)

(declare-fun d!86161 () Bool)

(assert (=> d!86161 (and (or (is-Undefined!6142 lt!268077) (not (is-Found!6142 lt!268077)) (and (bvsge (index!26802 lt!268077) #b00000000000000000000000000000000) (bvslt (index!26802 lt!268077) (size!18066 lt!268017)))) (or (is-Undefined!6142 lt!268077) (is-Found!6142 lt!268077) (not (is-MissingVacant!6142 lt!268077)) (not (= (index!26804 lt!268077) vacantSpotIndex!68)) (and (bvsge (index!26804 lt!268077) #b00000000000000000000000000000000) (bvslt (index!26804 lt!268077) (size!18066 lt!268017)))) (or (is-Undefined!6142 lt!268077) (ite (is-Found!6142 lt!268077) (= (select (arr!17702 lt!268017) (index!26802 lt!268077)) lt!268018) (and (is-MissingVacant!6142 lt!268077) (= (index!26804 lt!268077) vacantSpotIndex!68) (= (select (arr!17702 lt!268017) (index!26804 lt!268077)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86161 (= lt!268077 e!337341)))

(declare-fun c!66821 () Bool)

(assert (=> d!86161 (= c!66821 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!268078 () (_ BitVec 64))

(assert (=> d!86161 (= lt!268078 (select (arr!17702 lt!268017) index!984))))

(assert (=> d!86161 (validMask!0 mask!3053)))

(assert (=> d!86161 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268018 lt!268017 mask!3053) lt!268077)))

(declare-fun b!590863 () Bool)

(declare-fun c!66820 () Bool)

(assert (=> b!590863 (= c!66820 (= lt!268078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!337340 () SeekEntryResult!6142)

(declare-fun e!337339 () SeekEntryResult!6142)

(assert (=> b!590863 (= e!337340 e!337339)))

(declare-fun b!590864 () Bool)

(assert (=> b!590864 (= e!337339 (MissingVacant!6142 vacantSpotIndex!68))))

(declare-fun b!590865 () Bool)

(assert (=> b!590865 (= e!337339 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!268018 lt!268017 mask!3053))))

(declare-fun b!590866 () Bool)

(assert (=> b!590866 (= e!337340 (Found!6142 index!984))))

(declare-fun b!590867 () Bool)

(assert (=> b!590867 (= e!337341 e!337340)))

(declare-fun c!66819 () Bool)

(assert (=> b!590867 (= c!66819 (= lt!268078 lt!268018))))

(assert (= (and d!86161 c!66821) b!590862))

(assert (= (and d!86161 (not c!66821)) b!590867))

(assert (= (and b!590867 c!66819) b!590866))

(assert (= (and b!590867 (not c!66819)) b!590863))

(assert (= (and b!590863 c!66820) b!590864))

(assert (= (and b!590863 (not c!66820)) b!590865))

(declare-fun m!569243 () Bool)

(assert (=> d!86161 m!569243))

(declare-fun m!569245 () Bool)

(assert (=> d!86161 m!569245))

(declare-fun m!569247 () Bool)

(assert (=> d!86161 m!569247))

(assert (=> d!86161 m!569093))

(assert (=> b!590865 m!569121))

(assert (=> b!590865 m!569121))

(declare-fun m!569249 () Bool)

(assert (=> b!590865 m!569249))

(assert (=> b!590728 d!86161))

(declare-fun b!590915 () Bool)

