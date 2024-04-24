; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54780 () Bool)

(assert start!54780)

(declare-fun b!598129 () Bool)

(declare-fun res!383322 () Bool)

(declare-fun e!341850 () Bool)

(assert (=> b!598129 (=> (not res!383322) (not e!341850))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598129 (= res!383322 (validKeyInArray!0 k0!1786))))

(declare-fun b!598130 () Bool)

(declare-fun res!383323 () Bool)

(assert (=> b!598130 (=> (not res!383323) (not e!341850))))

(declare-datatypes ((array!37041 0))(
  ( (array!37042 (arr!17779 (Array (_ BitVec 32) (_ BitVec 64))) (size!18143 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37041)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!598130 (= res!383323 (validKeyInArray!0 (select (arr!17779 a!2986) j!136)))))

(declare-fun b!598131 () Bool)

(declare-fun res!383336 () Bool)

(assert (=> b!598131 (=> (not res!383336) (not e!341850))))

(declare-fun arrayContainsKey!0 (array!37041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598131 (= res!383336 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598132 () Bool)

(declare-fun e!341861 () Bool)

(declare-fun e!341854 () Bool)

(assert (=> b!598132 (= e!341861 (not e!341854))))

(declare-fun res!383330 () Bool)

(assert (=> b!598132 (=> res!383330 e!341854)))

(declare-datatypes ((SeekEntryResult!6175 0))(
  ( (MissingZero!6175 (index!26954 (_ BitVec 32))) (Found!6175 (index!26955 (_ BitVec 32))) (Intermediate!6175 (undefined!6987 Bool) (index!26956 (_ BitVec 32)) (x!55912 (_ BitVec 32))) (Undefined!6175) (MissingVacant!6175 (index!26957 (_ BitVec 32))) )
))
(declare-fun lt!271736 () SeekEntryResult!6175)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!598132 (= res!383330 (not (= lt!271736 (Found!6175 index!984))))))

(declare-datatypes ((Unit!18793 0))(
  ( (Unit!18794) )
))
(declare-fun lt!271744 () Unit!18793)

(declare-fun e!341849 () Unit!18793)

(assert (=> b!598132 (= lt!271744 e!341849)))

(declare-fun c!67772 () Bool)

(assert (=> b!598132 (= c!67772 (= lt!271736 Undefined!6175))))

(declare-fun lt!271741 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!271737 () array!37041)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37041 (_ BitVec 32)) SeekEntryResult!6175)

(assert (=> b!598132 (= lt!271736 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271741 lt!271737 mask!3053))))

(declare-fun e!341858 () Bool)

(assert (=> b!598132 e!341858))

(declare-fun res!383326 () Bool)

(assert (=> b!598132 (=> (not res!383326) (not e!341858))))

(declare-fun lt!271740 () SeekEntryResult!6175)

(declare-fun lt!271738 () (_ BitVec 32))

(assert (=> b!598132 (= res!383326 (= lt!271740 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271738 vacantSpotIndex!68 lt!271741 lt!271737 mask!3053)))))

(assert (=> b!598132 (= lt!271740 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271738 vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!598132 (= lt!271741 (select (store (arr!17779 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271743 () Unit!18793)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18793)

(assert (=> b!598132 (= lt!271743 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271738 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598132 (= lt!271738 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!598133 () Bool)

(declare-fun Unit!18795 () Unit!18793)

(assert (=> b!598133 (= e!341849 Unit!18795)))

(declare-fun b!598134 () Bool)

(declare-fun e!341856 () Bool)

(declare-datatypes ((List!11727 0))(
  ( (Nil!11724) (Cons!11723 (h!12771 (_ BitVec 64)) (t!17947 List!11727)) )
))
(declare-fun contains!2932 (List!11727 (_ BitVec 64)) Bool)

(assert (=> b!598134 (= e!341856 (not (contains!2932 Nil!11724 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598135 () Bool)

(declare-fun e!341862 () Bool)

(declare-fun e!341857 () Bool)

(assert (=> b!598135 (= e!341862 e!341857)))

(declare-fun res!383340 () Bool)

(assert (=> b!598135 (=> res!383340 e!341857)))

(declare-fun lt!271746 () (_ BitVec 64))

(assert (=> b!598135 (= res!383340 (or (not (= (select (arr!17779 a!2986) j!136) lt!271741)) (not (= (select (arr!17779 a!2986) j!136) lt!271746)) (bvsge j!136 index!984)))))

(declare-fun b!598136 () Bool)

(declare-fun res!383338 () Bool)

(declare-fun e!341853 () Bool)

(assert (=> b!598136 (=> (not res!383338) (not e!341853))))

(declare-fun arrayNoDuplicates!0 (array!37041 (_ BitVec 32) List!11727) Bool)

(assert (=> b!598136 (= res!383338 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11724))))

(declare-fun res!383329 () Bool)

(assert (=> start!54780 (=> (not res!383329) (not e!341850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54780 (= res!383329 (validMask!0 mask!3053))))

(assert (=> start!54780 e!341850))

(assert (=> start!54780 true))

(declare-fun array_inv!13638 (array!37041) Bool)

(assert (=> start!54780 (array_inv!13638 a!2986)))

(declare-fun b!598137 () Bool)

(declare-fun res!383335 () Bool)

(assert (=> b!598137 (=> (not res!383335) (not e!341850))))

(assert (=> b!598137 (= res!383335 (and (= (size!18143 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18143 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18143 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598138 () Bool)

(declare-fun res!383325 () Bool)

(assert (=> b!598138 (=> (not res!383325) (not e!341853))))

(assert (=> b!598138 (= res!383325 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17779 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598139 () Bool)

(assert (=> b!598139 (= e!341850 e!341853)))

(declare-fun res!383334 () Bool)

(assert (=> b!598139 (=> (not res!383334) (not e!341853))))

(declare-fun lt!271745 () SeekEntryResult!6175)

(assert (=> b!598139 (= res!383334 (or (= lt!271745 (MissingZero!6175 i!1108)) (= lt!271745 (MissingVacant!6175 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37041 (_ BitVec 32)) SeekEntryResult!6175)

(assert (=> b!598139 (= lt!271745 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!598140 () Bool)

(declare-fun res!383327 () Bool)

(assert (=> b!598140 (=> (not res!383327) (not e!341853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37041 (_ BitVec 32)) Bool)

(assert (=> b!598140 (= res!383327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598141 () Bool)

(declare-fun e!341860 () Bool)

(assert (=> b!598141 (= e!341860 e!341861)))

(declare-fun res!383339 () Bool)

(assert (=> b!598141 (=> (not res!383339) (not e!341861))))

(declare-fun lt!271747 () SeekEntryResult!6175)

(assert (=> b!598141 (= res!383339 (and (= lt!271747 (Found!6175 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17779 a!2986) index!984) (select (arr!17779 a!2986) j!136))) (not (= (select (arr!17779 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!598141 (= lt!271747 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598142 () Bool)

(assert (=> b!598142 (= e!341858 (= lt!271747 lt!271740))))

(declare-fun b!598143 () Bool)

(declare-fun e!341859 () Bool)

(assert (=> b!598143 (= e!341859 e!341856)))

(declare-fun res!383328 () Bool)

(assert (=> b!598143 (=> (not res!383328) (not e!341856))))

(assert (=> b!598143 (= res!383328 (not (contains!2932 Nil!11724 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598144 () Bool)

(declare-fun e!341852 () Bool)

(assert (=> b!598144 (= e!341857 e!341852)))

(declare-fun res!383332 () Bool)

(assert (=> b!598144 (=> (not res!383332) (not e!341852))))

(assert (=> b!598144 (= res!383332 (arrayContainsKey!0 lt!271737 (select (arr!17779 a!2986) j!136) j!136))))

(declare-fun b!598145 () Bool)

(declare-fun res!383331 () Bool)

(assert (=> b!598145 (=> res!383331 e!341859)))

(declare-fun noDuplicate!277 (List!11727) Bool)

(assert (=> b!598145 (= res!383331 (not (noDuplicate!277 Nil!11724)))))

(declare-fun b!598146 () Bool)

(assert (=> b!598146 (= e!341853 e!341860)))

(declare-fun res!383333 () Bool)

(assert (=> b!598146 (=> (not res!383333) (not e!341860))))

(assert (=> b!598146 (= res!383333 (= (select (store (arr!17779 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598146 (= lt!271737 (array!37042 (store (arr!17779 a!2986) i!1108 k0!1786) (size!18143 a!2986)))))

(declare-fun b!598147 () Bool)

(assert (=> b!598147 (= e!341852 (arrayContainsKey!0 lt!271737 (select (arr!17779 a!2986) j!136) index!984))))

(declare-fun b!598148 () Bool)

(declare-fun e!341855 () Bool)

(assert (=> b!598148 (= e!341855 e!341859)))

(declare-fun res!383341 () Bool)

(assert (=> b!598148 (=> res!383341 e!341859)))

(assert (=> b!598148 (= res!383341 (or (bvsgt #b00000000000000000000000000000000 (size!18143 a!2986)) (bvsge (size!18143 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!598148 (arrayNoDuplicates!0 lt!271737 #b00000000000000000000000000000000 Nil!11724)))

(declare-fun lt!271739 () Unit!18793)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37041 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11727) Unit!18793)

(assert (=> b!598148 (= lt!271739 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11724))))

(assert (=> b!598148 (arrayContainsKey!0 lt!271737 (select (arr!17779 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271742 () Unit!18793)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37041 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18793)

(assert (=> b!598148 (= lt!271742 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271737 (select (arr!17779 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598149 () Bool)

(assert (=> b!598149 (= e!341854 e!341855)))

(declare-fun res!383337 () Bool)

(assert (=> b!598149 (=> res!383337 e!341855)))

(assert (=> b!598149 (= res!383337 (or (not (= (select (arr!17779 a!2986) j!136) lt!271741)) (not (= (select (arr!17779 a!2986) j!136) lt!271746)) (bvsge j!136 index!984)))))

(assert (=> b!598149 e!341862))

(declare-fun res!383324 () Bool)

(assert (=> b!598149 (=> (not res!383324) (not e!341862))))

(assert (=> b!598149 (= res!383324 (= lt!271746 (select (arr!17779 a!2986) j!136)))))

(assert (=> b!598149 (= lt!271746 (select (store (arr!17779 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!598150 () Bool)

(declare-fun Unit!18796 () Unit!18793)

(assert (=> b!598150 (= e!341849 Unit!18796)))

(assert (=> b!598150 false))

(assert (= (and start!54780 res!383329) b!598137))

(assert (= (and b!598137 res!383335) b!598130))

(assert (= (and b!598130 res!383323) b!598129))

(assert (= (and b!598129 res!383322) b!598131))

(assert (= (and b!598131 res!383336) b!598139))

(assert (= (and b!598139 res!383334) b!598140))

(assert (= (and b!598140 res!383327) b!598136))

(assert (= (and b!598136 res!383338) b!598138))

(assert (= (and b!598138 res!383325) b!598146))

(assert (= (and b!598146 res!383333) b!598141))

(assert (= (and b!598141 res!383339) b!598132))

(assert (= (and b!598132 res!383326) b!598142))

(assert (= (and b!598132 c!67772) b!598150))

(assert (= (and b!598132 (not c!67772)) b!598133))

(assert (= (and b!598132 (not res!383330)) b!598149))

(assert (= (and b!598149 res!383324) b!598135))

(assert (= (and b!598135 (not res!383340)) b!598144))

(assert (= (and b!598144 res!383332) b!598147))

(assert (= (and b!598149 (not res!383337)) b!598148))

(assert (= (and b!598148 (not res!383341)) b!598145))

(assert (= (and b!598145 (not res!383331)) b!598143))

(assert (= (and b!598143 res!383328) b!598134))

(declare-fun m!575693 () Bool)

(assert (=> b!598147 m!575693))

(assert (=> b!598147 m!575693))

(declare-fun m!575695 () Bool)

(assert (=> b!598147 m!575695))

(declare-fun m!575697 () Bool)

(assert (=> b!598145 m!575697))

(declare-fun m!575699 () Bool)

(assert (=> b!598136 m!575699))

(declare-fun m!575701 () Bool)

(assert (=> b!598132 m!575701))

(assert (=> b!598132 m!575693))

(declare-fun m!575703 () Bool)

(assert (=> b!598132 m!575703))

(declare-fun m!575705 () Bool)

(assert (=> b!598132 m!575705))

(assert (=> b!598132 m!575693))

(declare-fun m!575707 () Bool)

(assert (=> b!598132 m!575707))

(declare-fun m!575709 () Bool)

(assert (=> b!598132 m!575709))

(declare-fun m!575711 () Bool)

(assert (=> b!598132 m!575711))

(declare-fun m!575713 () Bool)

(assert (=> b!598132 m!575713))

(declare-fun m!575715 () Bool)

(assert (=> b!598129 m!575715))

(declare-fun m!575717 () Bool)

(assert (=> b!598134 m!575717))

(declare-fun m!575719 () Bool)

(assert (=> b!598141 m!575719))

(assert (=> b!598141 m!575693))

(assert (=> b!598141 m!575693))

(declare-fun m!575721 () Bool)

(assert (=> b!598141 m!575721))

(declare-fun m!575723 () Bool)

(assert (=> b!598140 m!575723))

(declare-fun m!575725 () Bool)

(assert (=> b!598138 m!575725))

(assert (=> b!598135 m!575693))

(declare-fun m!575727 () Bool)

(assert (=> b!598131 m!575727))

(declare-fun m!575729 () Bool)

(assert (=> start!54780 m!575729))

(declare-fun m!575731 () Bool)

(assert (=> start!54780 m!575731))

(assert (=> b!598146 m!575703))

(declare-fun m!575733 () Bool)

(assert (=> b!598146 m!575733))

(declare-fun m!575735 () Bool)

(assert (=> b!598143 m!575735))

(declare-fun m!575737 () Bool)

(assert (=> b!598139 m!575737))

(assert (=> b!598144 m!575693))

(assert (=> b!598144 m!575693))

(declare-fun m!575739 () Bool)

(assert (=> b!598144 m!575739))

(assert (=> b!598148 m!575693))

(declare-fun m!575741 () Bool)

(assert (=> b!598148 m!575741))

(assert (=> b!598148 m!575693))

(assert (=> b!598148 m!575693))

(declare-fun m!575743 () Bool)

(assert (=> b!598148 m!575743))

(declare-fun m!575745 () Bool)

(assert (=> b!598148 m!575745))

(declare-fun m!575747 () Bool)

(assert (=> b!598148 m!575747))

(assert (=> b!598130 m!575693))

(assert (=> b!598130 m!575693))

(declare-fun m!575749 () Bool)

(assert (=> b!598130 m!575749))

(assert (=> b!598149 m!575693))

(assert (=> b!598149 m!575703))

(declare-fun m!575751 () Bool)

(assert (=> b!598149 m!575751))

(check-sat (not b!598145) (not b!598148) (not b!598134) (not b!598130) (not b!598129) (not b!598131) (not start!54780) (not b!598143) (not b!598147) (not b!598140) (not b!598141) (not b!598136) (not b!598144) (not b!598132) (not b!598139))
(check-sat)
(get-model)

(declare-fun b!598293 () Bool)

(declare-fun e!341955 () Bool)

(declare-fun call!32952 () Bool)

(assert (=> b!598293 (= e!341955 call!32952)))

(declare-fun b!598294 () Bool)

(assert (=> b!598294 (= e!341955 call!32952)))

(declare-fun b!598295 () Bool)

(declare-fun e!341957 () Bool)

(assert (=> b!598295 (= e!341957 (contains!2932 Nil!11724 (select (arr!17779 lt!271737) #b00000000000000000000000000000000)))))

(declare-fun bm!32949 () Bool)

(declare-fun c!67781 () Bool)

(assert (=> bm!32949 (= call!32952 (arrayNoDuplicates!0 lt!271737 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67781 (Cons!11723 (select (arr!17779 lt!271737) #b00000000000000000000000000000000) Nil!11724) Nil!11724)))))

(declare-fun d!87077 () Bool)

(declare-fun res!383468 () Bool)

(declare-fun e!341958 () Bool)

(assert (=> d!87077 (=> res!383468 e!341958)))

(assert (=> d!87077 (= res!383468 (bvsge #b00000000000000000000000000000000 (size!18143 lt!271737)))))

(assert (=> d!87077 (= (arrayNoDuplicates!0 lt!271737 #b00000000000000000000000000000000 Nil!11724) e!341958)))

(declare-fun b!598296 () Bool)

(declare-fun e!341956 () Bool)

(assert (=> b!598296 (= e!341956 e!341955)))

(assert (=> b!598296 (= c!67781 (validKeyInArray!0 (select (arr!17779 lt!271737) #b00000000000000000000000000000000)))))

(declare-fun b!598297 () Bool)

(assert (=> b!598297 (= e!341958 e!341956)))

(declare-fun res!383469 () Bool)

(assert (=> b!598297 (=> (not res!383469) (not e!341956))))

(assert (=> b!598297 (= res!383469 (not e!341957))))

(declare-fun res!383470 () Bool)

(assert (=> b!598297 (=> (not res!383470) (not e!341957))))

(assert (=> b!598297 (= res!383470 (validKeyInArray!0 (select (arr!17779 lt!271737) #b00000000000000000000000000000000)))))

(assert (= (and d!87077 (not res!383468)) b!598297))

(assert (= (and b!598297 res!383470) b!598295))

(assert (= (and b!598297 res!383469) b!598296))

(assert (= (and b!598296 c!67781) b!598294))

(assert (= (and b!598296 (not c!67781)) b!598293))

(assert (= (or b!598294 b!598293) bm!32949))

(declare-fun m!575873 () Bool)

(assert (=> b!598295 m!575873))

(assert (=> b!598295 m!575873))

(declare-fun m!575875 () Bool)

(assert (=> b!598295 m!575875))

(assert (=> bm!32949 m!575873))

(declare-fun m!575877 () Bool)

(assert (=> bm!32949 m!575877))

(assert (=> b!598296 m!575873))

(assert (=> b!598296 m!575873))

(declare-fun m!575879 () Bool)

(assert (=> b!598296 m!575879))

(assert (=> b!598297 m!575873))

(assert (=> b!598297 m!575873))

(assert (=> b!598297 m!575879))

(assert (=> b!598148 d!87077))

(declare-fun d!87079 () Bool)

(declare-fun e!341961 () Bool)

(assert (=> d!87079 e!341961))

(declare-fun res!383473 () Bool)

(assert (=> d!87079 (=> (not res!383473) (not e!341961))))

(assert (=> d!87079 (= res!383473 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18143 a!2986))))))

(declare-fun lt!271822 () Unit!18793)

(declare-fun choose!41 (array!37041 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11727) Unit!18793)

(assert (=> d!87079 (= lt!271822 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11724))))

(assert (=> d!87079 (bvslt (size!18143 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87079 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11724) lt!271822)))

(declare-fun b!598300 () Bool)

(assert (=> b!598300 (= e!341961 (arrayNoDuplicates!0 (array!37042 (store (arr!17779 a!2986) i!1108 k0!1786) (size!18143 a!2986)) #b00000000000000000000000000000000 Nil!11724))))

(assert (= (and d!87079 res!383473) b!598300))

(declare-fun m!575881 () Bool)

(assert (=> d!87079 m!575881))

(assert (=> b!598300 m!575703))

(declare-fun m!575883 () Bool)

(assert (=> b!598300 m!575883))

(assert (=> b!598148 d!87079))

(declare-fun d!87081 () Bool)

(declare-fun res!383478 () Bool)

(declare-fun e!341966 () Bool)

(assert (=> d!87081 (=> res!383478 e!341966)))

(assert (=> d!87081 (= res!383478 (= (select (arr!17779 lt!271737) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17779 a!2986) j!136)))))

(assert (=> d!87081 (= (arrayContainsKey!0 lt!271737 (select (arr!17779 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341966)))

(declare-fun b!598305 () Bool)

(declare-fun e!341967 () Bool)

(assert (=> b!598305 (= e!341966 e!341967)))

(declare-fun res!383479 () Bool)

(assert (=> b!598305 (=> (not res!383479) (not e!341967))))

(assert (=> b!598305 (= res!383479 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18143 lt!271737)))))

(declare-fun b!598306 () Bool)

(assert (=> b!598306 (= e!341967 (arrayContainsKey!0 lt!271737 (select (arr!17779 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87081 (not res!383478)) b!598305))

(assert (= (and b!598305 res!383479) b!598306))

(declare-fun m!575885 () Bool)

(assert (=> d!87081 m!575885))

(assert (=> b!598306 m!575693))

(declare-fun m!575887 () Bool)

(assert (=> b!598306 m!575887))

(assert (=> b!598148 d!87081))

(declare-fun d!87083 () Bool)

(assert (=> d!87083 (arrayContainsKey!0 lt!271737 (select (arr!17779 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271825 () Unit!18793)

(declare-fun choose!114 (array!37041 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18793)

(assert (=> d!87083 (= lt!271825 (choose!114 lt!271737 (select (arr!17779 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87083 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87083 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271737 (select (arr!17779 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!271825)))

(declare-fun bs!18401 () Bool)

(assert (= bs!18401 d!87083))

(assert (=> bs!18401 m!575693))

(assert (=> bs!18401 m!575743))

(assert (=> bs!18401 m!575693))

(declare-fun m!575889 () Bool)

(assert (=> bs!18401 m!575889))

(assert (=> b!598148 d!87083))

(declare-fun d!87085 () Bool)

(assert (=> d!87085 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!598129 d!87085))

(declare-fun b!598343 () Bool)

(declare-fun c!67802 () Bool)

(declare-fun lt!271842 () (_ BitVec 64))

(assert (=> b!598343 (= c!67802 (= lt!271842 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341986 () SeekEntryResult!6175)

(declare-fun e!341987 () SeekEntryResult!6175)

(assert (=> b!598343 (= e!341986 e!341987)))

(declare-fun b!598344 () Bool)

(declare-fun lt!271840 () SeekEntryResult!6175)

(assert (=> b!598344 (= e!341987 (MissingZero!6175 (index!26956 lt!271840)))))

(declare-fun b!598345 () Bool)

(declare-fun e!341988 () SeekEntryResult!6175)

(assert (=> b!598345 (= e!341988 e!341986)))

(assert (=> b!598345 (= lt!271842 (select (arr!17779 a!2986) (index!26956 lt!271840)))))

(declare-fun c!67801 () Bool)

(assert (=> b!598345 (= c!67801 (= lt!271842 k0!1786))))

(declare-fun b!598346 () Bool)

(assert (=> b!598346 (= e!341988 Undefined!6175)))

(declare-fun b!598348 () Bool)

(assert (=> b!598348 (= e!341986 (Found!6175 (index!26956 lt!271840)))))

(declare-fun d!87087 () Bool)

(declare-fun lt!271841 () SeekEntryResult!6175)

(get-info :version)

(assert (=> d!87087 (and (or ((_ is Undefined!6175) lt!271841) (not ((_ is Found!6175) lt!271841)) (and (bvsge (index!26955 lt!271841) #b00000000000000000000000000000000) (bvslt (index!26955 lt!271841) (size!18143 a!2986)))) (or ((_ is Undefined!6175) lt!271841) ((_ is Found!6175) lt!271841) (not ((_ is MissingZero!6175) lt!271841)) (and (bvsge (index!26954 lt!271841) #b00000000000000000000000000000000) (bvslt (index!26954 lt!271841) (size!18143 a!2986)))) (or ((_ is Undefined!6175) lt!271841) ((_ is Found!6175) lt!271841) ((_ is MissingZero!6175) lt!271841) (not ((_ is MissingVacant!6175) lt!271841)) (and (bvsge (index!26957 lt!271841) #b00000000000000000000000000000000) (bvslt (index!26957 lt!271841) (size!18143 a!2986)))) (or ((_ is Undefined!6175) lt!271841) (ite ((_ is Found!6175) lt!271841) (= (select (arr!17779 a!2986) (index!26955 lt!271841)) k0!1786) (ite ((_ is MissingZero!6175) lt!271841) (= (select (arr!17779 a!2986) (index!26954 lt!271841)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6175) lt!271841) (= (select (arr!17779 a!2986) (index!26957 lt!271841)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87087 (= lt!271841 e!341988)))

(declare-fun c!67800 () Bool)

(assert (=> d!87087 (= c!67800 (and ((_ is Intermediate!6175) lt!271840) (undefined!6987 lt!271840)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37041 (_ BitVec 32)) SeekEntryResult!6175)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87087 (= lt!271840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87087 (validMask!0 mask!3053)))

(assert (=> d!87087 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!271841)))

(declare-fun b!598347 () Bool)

(assert (=> b!598347 (= e!341987 (seekKeyOrZeroReturnVacant!0 (x!55912 lt!271840) (index!26956 lt!271840) (index!26956 lt!271840) k0!1786 a!2986 mask!3053))))

(assert (= (and d!87087 c!67800) b!598346))

(assert (= (and d!87087 (not c!67800)) b!598345))

(assert (= (and b!598345 c!67801) b!598348))

(assert (= (and b!598345 (not c!67801)) b!598343))

(assert (= (and b!598343 c!67802) b!598344))

(assert (= (and b!598343 (not c!67802)) b!598347))

(declare-fun m!575917 () Bool)

(assert (=> b!598345 m!575917))

(declare-fun m!575921 () Bool)

(assert (=> d!87087 m!575921))

(assert (=> d!87087 m!575729))

(declare-fun m!575923 () Bool)

(assert (=> d!87087 m!575923))

(declare-fun m!575925 () Bool)

(assert (=> d!87087 m!575925))

(assert (=> d!87087 m!575921))

(declare-fun m!575927 () Bool)

(assert (=> d!87087 m!575927))

(declare-fun m!575929 () Bool)

(assert (=> d!87087 m!575929))

(declare-fun m!575931 () Bool)

(assert (=> b!598347 m!575931))

(assert (=> b!598139 d!87087))

(declare-fun d!87097 () Bool)

(assert (=> d!87097 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54780 d!87097))

(declare-fun d!87101 () Bool)

(assert (=> d!87101 (= (array_inv!13638 a!2986) (bvsge (size!18143 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54780 d!87101))

(declare-fun d!87103 () Bool)

(declare-fun res!383483 () Bool)

(declare-fun e!341995 () Bool)

(assert (=> d!87103 (=> res!383483 e!341995)))

(assert (=> d!87103 (= res!383483 (= (select (arr!17779 lt!271737) index!984) (select (arr!17779 a!2986) j!136)))))

(assert (=> d!87103 (= (arrayContainsKey!0 lt!271737 (select (arr!17779 a!2986) j!136) index!984) e!341995)))

(declare-fun b!598358 () Bool)

(declare-fun e!341996 () Bool)

(assert (=> b!598358 (= e!341995 e!341996)))

(declare-fun res!383484 () Bool)

(assert (=> b!598358 (=> (not res!383484) (not e!341996))))

(assert (=> b!598358 (= res!383484 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18143 lt!271737)))))

(declare-fun b!598359 () Bool)

(assert (=> b!598359 (= e!341996 (arrayContainsKey!0 lt!271737 (select (arr!17779 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87103 (not res!383483)) b!598358))

(assert (= (and b!598358 res!383484) b!598359))

(declare-fun m!575937 () Bool)

(assert (=> d!87103 m!575937))

(assert (=> b!598359 m!575693))

(declare-fun m!575939 () Bool)

(assert (=> b!598359 m!575939))

(assert (=> b!598147 d!87103))

(declare-fun b!598360 () Bool)

(declare-fun e!341997 () Bool)

(declare-fun call!32953 () Bool)

(assert (=> b!598360 (= e!341997 call!32953)))

(declare-fun b!598361 () Bool)

(assert (=> b!598361 (= e!341997 call!32953)))

(declare-fun b!598362 () Bool)

(declare-fun e!341999 () Bool)

(assert (=> b!598362 (= e!341999 (contains!2932 Nil!11724 (select (arr!17779 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32950 () Bool)

(declare-fun c!67806 () Bool)

(assert (=> bm!32950 (= call!32953 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67806 (Cons!11723 (select (arr!17779 a!2986) #b00000000000000000000000000000000) Nil!11724) Nil!11724)))))

(declare-fun d!87105 () Bool)

(declare-fun res!383485 () Bool)

(declare-fun e!342000 () Bool)

(assert (=> d!87105 (=> res!383485 e!342000)))

(assert (=> d!87105 (= res!383485 (bvsge #b00000000000000000000000000000000 (size!18143 a!2986)))))

(assert (=> d!87105 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11724) e!342000)))

(declare-fun b!598363 () Bool)

(declare-fun e!341998 () Bool)

(assert (=> b!598363 (= e!341998 e!341997)))

(assert (=> b!598363 (= c!67806 (validKeyInArray!0 (select (arr!17779 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!598364 () Bool)

(assert (=> b!598364 (= e!342000 e!341998)))

(declare-fun res!383486 () Bool)

(assert (=> b!598364 (=> (not res!383486) (not e!341998))))

(assert (=> b!598364 (= res!383486 (not e!341999))))

(declare-fun res!383487 () Bool)

(assert (=> b!598364 (=> (not res!383487) (not e!341999))))

(assert (=> b!598364 (= res!383487 (validKeyInArray!0 (select (arr!17779 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!87105 (not res!383485)) b!598364))

(assert (= (and b!598364 res!383487) b!598362))

(assert (= (and b!598364 res!383486) b!598363))

(assert (= (and b!598363 c!67806) b!598361))

(assert (= (and b!598363 (not c!67806)) b!598360))

(assert (= (or b!598361 b!598360) bm!32950))

(declare-fun m!575941 () Bool)

(assert (=> b!598362 m!575941))

(assert (=> b!598362 m!575941))

(declare-fun m!575943 () Bool)

(assert (=> b!598362 m!575943))

(assert (=> bm!32950 m!575941))

(declare-fun m!575945 () Bool)

(assert (=> bm!32950 m!575945))

(assert (=> b!598363 m!575941))

(assert (=> b!598363 m!575941))

(declare-fun m!575947 () Bool)

(assert (=> b!598363 m!575947))

(assert (=> b!598364 m!575941))

(assert (=> b!598364 m!575941))

(assert (=> b!598364 m!575947))

(assert (=> b!598136 d!87105))

(declare-fun d!87107 () Bool)

(declare-fun lt!271853 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!234 (List!11727) (InoxSet (_ BitVec 64)))

(assert (=> d!87107 (= lt!271853 (select (content!234 Nil!11724) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!342006 () Bool)

(assert (=> d!87107 (= lt!271853 e!342006)))

(declare-fun res!383492 () Bool)

(assert (=> d!87107 (=> (not res!383492) (not e!342006))))

(assert (=> d!87107 (= res!383492 ((_ is Cons!11723) Nil!11724))))

(assert (=> d!87107 (= (contains!2932 Nil!11724 #b0000000000000000000000000000000000000000000000000000000000000000) lt!271853)))

(declare-fun b!598369 () Bool)

(declare-fun e!342005 () Bool)

(assert (=> b!598369 (= e!342006 e!342005)))

(declare-fun res!383493 () Bool)

(assert (=> b!598369 (=> res!383493 e!342005)))

(assert (=> b!598369 (= res!383493 (= (h!12771 Nil!11724) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!598370 () Bool)

(assert (=> b!598370 (= e!342005 (contains!2932 (t!17947 Nil!11724) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!87107 res!383492) b!598369))

(assert (= (and b!598369 (not res!383493)) b!598370))

(declare-fun m!575951 () Bool)

(assert (=> d!87107 m!575951))

(declare-fun m!575953 () Bool)

(assert (=> d!87107 m!575953))

(declare-fun m!575955 () Bool)

(assert (=> b!598370 m!575955))

(assert (=> b!598143 d!87107))

(declare-fun b!598425 () Bool)

(declare-fun e!342050 () SeekEntryResult!6175)

(assert (=> b!598425 (= e!342050 Undefined!6175)))

(declare-fun b!598426 () Bool)

(declare-fun c!67821 () Bool)

(declare-fun lt!271864 () (_ BitVec 64))

(assert (=> b!598426 (= c!67821 (= lt!271864 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!342049 () SeekEntryResult!6175)

(declare-fun e!342051 () SeekEntryResult!6175)

(assert (=> b!598426 (= e!342049 e!342051)))

(declare-fun b!598427 () Bool)

(assert (=> b!598427 (= e!342051 (MissingVacant!6175 vacantSpotIndex!68))))

(declare-fun b!598428 () Bool)

(assert (=> b!598428 (= e!342049 (Found!6175 lt!271738))))

(declare-fun b!598429 () Bool)

(assert (=> b!598429 (= e!342050 e!342049)))

(declare-fun c!67819 () Bool)

(assert (=> b!598429 (= c!67819 (= lt!271864 lt!271741))))

(declare-fun b!598430 () Bool)

(assert (=> b!598430 (= e!342051 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271738 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!271741 lt!271737 mask!3053))))

(declare-fun d!87115 () Bool)

(declare-fun lt!271865 () SeekEntryResult!6175)

(assert (=> d!87115 (and (or ((_ is Undefined!6175) lt!271865) (not ((_ is Found!6175) lt!271865)) (and (bvsge (index!26955 lt!271865) #b00000000000000000000000000000000) (bvslt (index!26955 lt!271865) (size!18143 lt!271737)))) (or ((_ is Undefined!6175) lt!271865) ((_ is Found!6175) lt!271865) (not ((_ is MissingVacant!6175) lt!271865)) (not (= (index!26957 lt!271865) vacantSpotIndex!68)) (and (bvsge (index!26957 lt!271865) #b00000000000000000000000000000000) (bvslt (index!26957 lt!271865) (size!18143 lt!271737)))) (or ((_ is Undefined!6175) lt!271865) (ite ((_ is Found!6175) lt!271865) (= (select (arr!17779 lt!271737) (index!26955 lt!271865)) lt!271741) (and ((_ is MissingVacant!6175) lt!271865) (= (index!26957 lt!271865) vacantSpotIndex!68) (= (select (arr!17779 lt!271737) (index!26957 lt!271865)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87115 (= lt!271865 e!342050)))

(declare-fun c!67820 () Bool)

(assert (=> d!87115 (= c!67820 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87115 (= lt!271864 (select (arr!17779 lt!271737) lt!271738))))

(assert (=> d!87115 (validMask!0 mask!3053)))

(assert (=> d!87115 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271738 vacantSpotIndex!68 lt!271741 lt!271737 mask!3053) lt!271865)))

(assert (= (and d!87115 c!67820) b!598425))

(assert (= (and d!87115 (not c!67820)) b!598429))

(assert (= (and b!598429 c!67819) b!598428))

(assert (= (and b!598429 (not c!67819)) b!598426))

(assert (= (and b!598426 c!67821) b!598427))

(assert (= (and b!598426 (not c!67821)) b!598430))

(declare-fun m!575985 () Bool)

(assert (=> b!598430 m!575985))

(assert (=> b!598430 m!575985))

(declare-fun m!575987 () Bool)

(assert (=> b!598430 m!575987))

(declare-fun m!575989 () Bool)

(assert (=> d!87115 m!575989))

(declare-fun m!575991 () Bool)

(assert (=> d!87115 m!575991))

(declare-fun m!575993 () Bool)

(assert (=> d!87115 m!575993))

(assert (=> d!87115 m!575729))

(assert (=> b!598132 d!87115))

(declare-fun d!87125 () Bool)

(declare-fun e!342074 () Bool)

(assert (=> d!87125 e!342074))

(declare-fun res!383546 () Bool)

(assert (=> d!87125 (=> (not res!383546) (not e!342074))))

(assert (=> d!87125 (= res!383546 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18143 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18143 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18143 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18143 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18143 a!2986))))))

(declare-fun lt!271869 () Unit!18793)

(declare-fun choose!9 (array!37041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18793)

(assert (=> d!87125 (= lt!271869 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271738 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87125 (validMask!0 mask!3053)))

(assert (=> d!87125 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271738 vacantSpotIndex!68 mask!3053) lt!271869)))

(declare-fun b!598453 () Bool)

(assert (=> b!598453 (= e!342074 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271738 vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271738 vacantSpotIndex!68 (select (store (arr!17779 a!2986) i!1108 k0!1786) j!136) (array!37042 (store (arr!17779 a!2986) i!1108 k0!1786) (size!18143 a!2986)) mask!3053)))))

(assert (= (and d!87125 res!383546) b!598453))

(declare-fun m!576009 () Bool)

(assert (=> d!87125 m!576009))

(assert (=> d!87125 m!575729))

(assert (=> b!598453 m!575693))

(assert (=> b!598453 m!575707))

(assert (=> b!598453 m!575703))

(assert (=> b!598453 m!575701))

(declare-fun m!576011 () Bool)

(assert (=> b!598453 m!576011))

(assert (=> b!598453 m!575693))

(assert (=> b!598453 m!575701))

(assert (=> b!598132 d!87125))

(declare-fun d!87135 () Bool)

(declare-fun lt!271872 () (_ BitVec 32))

(assert (=> d!87135 (and (bvsge lt!271872 #b00000000000000000000000000000000) (bvslt lt!271872 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87135 (= lt!271872 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!87135 (validMask!0 mask!3053)))

(assert (=> d!87135 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!271872)))

(declare-fun bs!18403 () Bool)

(assert (= bs!18403 d!87135))

(declare-fun m!576013 () Bool)

(assert (=> bs!18403 m!576013))

(assert (=> bs!18403 m!575729))

(assert (=> b!598132 d!87135))

(declare-fun b!598454 () Bool)

(declare-fun e!342076 () SeekEntryResult!6175)

(assert (=> b!598454 (= e!342076 Undefined!6175)))

(declare-fun b!598455 () Bool)

(declare-fun c!67824 () Bool)

(declare-fun lt!271873 () (_ BitVec 64))

(assert (=> b!598455 (= c!67824 (= lt!271873 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!342075 () SeekEntryResult!6175)

(declare-fun e!342077 () SeekEntryResult!6175)

(assert (=> b!598455 (= e!342075 e!342077)))

(declare-fun b!598456 () Bool)

(assert (=> b!598456 (= e!342077 (MissingVacant!6175 vacantSpotIndex!68))))

(declare-fun b!598457 () Bool)

(assert (=> b!598457 (= e!342075 (Found!6175 index!984))))

(declare-fun b!598458 () Bool)

(assert (=> b!598458 (= e!342076 e!342075)))

(declare-fun c!67822 () Bool)

(assert (=> b!598458 (= c!67822 (= lt!271873 lt!271741))))

(declare-fun b!598459 () Bool)

(assert (=> b!598459 (= e!342077 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!271741 lt!271737 mask!3053))))

(declare-fun d!87137 () Bool)

(declare-fun lt!271874 () SeekEntryResult!6175)

(assert (=> d!87137 (and (or ((_ is Undefined!6175) lt!271874) (not ((_ is Found!6175) lt!271874)) (and (bvsge (index!26955 lt!271874) #b00000000000000000000000000000000) (bvslt (index!26955 lt!271874) (size!18143 lt!271737)))) (or ((_ is Undefined!6175) lt!271874) ((_ is Found!6175) lt!271874) (not ((_ is MissingVacant!6175) lt!271874)) (not (= (index!26957 lt!271874) vacantSpotIndex!68)) (and (bvsge (index!26957 lt!271874) #b00000000000000000000000000000000) (bvslt (index!26957 lt!271874) (size!18143 lt!271737)))) (or ((_ is Undefined!6175) lt!271874) (ite ((_ is Found!6175) lt!271874) (= (select (arr!17779 lt!271737) (index!26955 lt!271874)) lt!271741) (and ((_ is MissingVacant!6175) lt!271874) (= (index!26957 lt!271874) vacantSpotIndex!68) (= (select (arr!17779 lt!271737) (index!26957 lt!271874)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87137 (= lt!271874 e!342076)))

(declare-fun c!67823 () Bool)

(assert (=> d!87137 (= c!67823 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87137 (= lt!271873 (select (arr!17779 lt!271737) index!984))))

(assert (=> d!87137 (validMask!0 mask!3053)))

(assert (=> d!87137 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271741 lt!271737 mask!3053) lt!271874)))

(assert (= (and d!87137 c!67823) b!598454))

(assert (= (and d!87137 (not c!67823)) b!598458))

(assert (= (and b!598458 c!67822) b!598457))

(assert (= (and b!598458 (not c!67822)) b!598455))

(assert (= (and b!598455 c!67824) b!598456))

(assert (= (and b!598455 (not c!67824)) b!598459))

(declare-fun m!576015 () Bool)

(assert (=> b!598459 m!576015))

(assert (=> b!598459 m!576015))

(declare-fun m!576017 () Bool)

(assert (=> b!598459 m!576017))

(declare-fun m!576019 () Bool)

(assert (=> d!87137 m!576019))

(declare-fun m!576021 () Bool)

(assert (=> d!87137 m!576021))

(assert (=> d!87137 m!575937))

(assert (=> d!87137 m!575729))

(assert (=> b!598132 d!87137))

(declare-fun b!598460 () Bool)

(declare-fun e!342079 () SeekEntryResult!6175)

(assert (=> b!598460 (= e!342079 Undefined!6175)))

(declare-fun b!598461 () Bool)

(declare-fun c!67827 () Bool)

(declare-fun lt!271875 () (_ BitVec 64))

(assert (=> b!598461 (= c!67827 (= lt!271875 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!342078 () SeekEntryResult!6175)

(declare-fun e!342080 () SeekEntryResult!6175)

(assert (=> b!598461 (= e!342078 e!342080)))

(declare-fun b!598462 () Bool)

(assert (=> b!598462 (= e!342080 (MissingVacant!6175 vacantSpotIndex!68))))

(declare-fun b!598463 () Bool)

(assert (=> b!598463 (= e!342078 (Found!6175 lt!271738))))

(declare-fun b!598464 () Bool)

(assert (=> b!598464 (= e!342079 e!342078)))

(declare-fun c!67825 () Bool)

(assert (=> b!598464 (= c!67825 (= lt!271875 (select (arr!17779 a!2986) j!136)))))

(declare-fun b!598465 () Bool)

(assert (=> b!598465 (= e!342080 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271738 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!271876 () SeekEntryResult!6175)

(declare-fun d!87139 () Bool)

(assert (=> d!87139 (and (or ((_ is Undefined!6175) lt!271876) (not ((_ is Found!6175) lt!271876)) (and (bvsge (index!26955 lt!271876) #b00000000000000000000000000000000) (bvslt (index!26955 lt!271876) (size!18143 a!2986)))) (or ((_ is Undefined!6175) lt!271876) ((_ is Found!6175) lt!271876) (not ((_ is MissingVacant!6175) lt!271876)) (not (= (index!26957 lt!271876) vacantSpotIndex!68)) (and (bvsge (index!26957 lt!271876) #b00000000000000000000000000000000) (bvslt (index!26957 lt!271876) (size!18143 a!2986)))) (or ((_ is Undefined!6175) lt!271876) (ite ((_ is Found!6175) lt!271876) (= (select (arr!17779 a!2986) (index!26955 lt!271876)) (select (arr!17779 a!2986) j!136)) (and ((_ is MissingVacant!6175) lt!271876) (= (index!26957 lt!271876) vacantSpotIndex!68) (= (select (arr!17779 a!2986) (index!26957 lt!271876)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87139 (= lt!271876 e!342079)))

(declare-fun c!67826 () Bool)

(assert (=> d!87139 (= c!67826 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87139 (= lt!271875 (select (arr!17779 a!2986) lt!271738))))

(assert (=> d!87139 (validMask!0 mask!3053)))

(assert (=> d!87139 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271738 vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053) lt!271876)))

(assert (= (and d!87139 c!67826) b!598460))

(assert (= (and d!87139 (not c!67826)) b!598464))

(assert (= (and b!598464 c!67825) b!598463))

(assert (= (and b!598464 (not c!67825)) b!598461))

(assert (= (and b!598461 c!67827) b!598462))

(assert (= (and b!598461 (not c!67827)) b!598465))

(assert (=> b!598465 m!575985))

(assert (=> b!598465 m!575985))

(assert (=> b!598465 m!575693))

(declare-fun m!576023 () Bool)

(assert (=> b!598465 m!576023))

(declare-fun m!576025 () Bool)

(assert (=> d!87139 m!576025))

(declare-fun m!576027 () Bool)

(assert (=> d!87139 m!576027))

(declare-fun m!576029 () Bool)

(assert (=> d!87139 m!576029))

(assert (=> d!87139 m!575729))

(assert (=> b!598132 d!87139))

(declare-fun d!87141 () Bool)

(declare-fun res!383551 () Bool)

(declare-fun e!342091 () Bool)

(assert (=> d!87141 (=> res!383551 e!342091)))

(assert (=> d!87141 (= res!383551 ((_ is Nil!11724) Nil!11724))))

(assert (=> d!87141 (= (noDuplicate!277 Nil!11724) e!342091)))

(declare-fun b!598482 () Bool)

(declare-fun e!342092 () Bool)

(assert (=> b!598482 (= e!342091 e!342092)))

(declare-fun res!383552 () Bool)

(assert (=> b!598482 (=> (not res!383552) (not e!342092))))

(assert (=> b!598482 (= res!383552 (not (contains!2932 (t!17947 Nil!11724) (h!12771 Nil!11724))))))

(declare-fun b!598483 () Bool)

(assert (=> b!598483 (= e!342092 (noDuplicate!277 (t!17947 Nil!11724)))))

(assert (= (and d!87141 (not res!383551)) b!598482))

(assert (= (and b!598482 res!383552) b!598483))

(declare-fun m!576031 () Bool)

(assert (=> b!598482 m!576031))

(declare-fun m!576033 () Bool)

(assert (=> b!598483 m!576033))

(assert (=> b!598145 d!87141))

(declare-fun d!87143 () Bool)

(declare-fun lt!271881 () Bool)

(assert (=> d!87143 (= lt!271881 (select (content!234 Nil!11724) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!342094 () Bool)

(assert (=> d!87143 (= lt!271881 e!342094)))

(declare-fun res!383553 () Bool)

(assert (=> d!87143 (=> (not res!383553) (not e!342094))))

(assert (=> d!87143 (= res!383553 ((_ is Cons!11723) Nil!11724))))

(assert (=> d!87143 (= (contains!2932 Nil!11724 #b1000000000000000000000000000000000000000000000000000000000000000) lt!271881)))

(declare-fun b!598484 () Bool)

(declare-fun e!342093 () Bool)

(assert (=> b!598484 (= e!342094 e!342093)))

(declare-fun res!383554 () Bool)

(assert (=> b!598484 (=> res!383554 e!342093)))

(assert (=> b!598484 (= res!383554 (= (h!12771 Nil!11724) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!598485 () Bool)

(assert (=> b!598485 (= e!342093 (contains!2932 (t!17947 Nil!11724) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!87143 res!383553) b!598484))

(assert (= (and b!598484 (not res!383554)) b!598485))

(assert (=> d!87143 m!575951))

(declare-fun m!576035 () Bool)

(assert (=> d!87143 m!576035))

(declare-fun m!576037 () Bool)

(assert (=> b!598485 m!576037))

(assert (=> b!598134 d!87143))

(declare-fun d!87145 () Bool)

(declare-fun res!383555 () Bool)

(declare-fun e!342095 () Bool)

(assert (=> d!87145 (=> res!383555 e!342095)))

(assert (=> d!87145 (= res!383555 (= (select (arr!17779 lt!271737) j!136) (select (arr!17779 a!2986) j!136)))))

(assert (=> d!87145 (= (arrayContainsKey!0 lt!271737 (select (arr!17779 a!2986) j!136) j!136) e!342095)))

(declare-fun b!598486 () Bool)

(declare-fun e!342096 () Bool)

(assert (=> b!598486 (= e!342095 e!342096)))

(declare-fun res!383556 () Bool)

(assert (=> b!598486 (=> (not res!383556) (not e!342096))))

(assert (=> b!598486 (= res!383556 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18143 lt!271737)))))

(declare-fun b!598487 () Bool)

(assert (=> b!598487 (= e!342096 (arrayContainsKey!0 lt!271737 (select (arr!17779 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87145 (not res!383555)) b!598486))

(assert (= (and b!598486 res!383556) b!598487))

(declare-fun m!576039 () Bool)

(assert (=> d!87145 m!576039))

(assert (=> b!598487 m!575693))

(declare-fun m!576041 () Bool)

(assert (=> b!598487 m!576041))

(assert (=> b!598144 d!87145))

(declare-fun b!598488 () Bool)

(declare-fun e!342098 () SeekEntryResult!6175)

(assert (=> b!598488 (= e!342098 Undefined!6175)))

(declare-fun b!598489 () Bool)

(declare-fun c!67836 () Bool)

(declare-fun lt!271882 () (_ BitVec 64))

(assert (=> b!598489 (= c!67836 (= lt!271882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!342097 () SeekEntryResult!6175)

(declare-fun e!342099 () SeekEntryResult!6175)

(assert (=> b!598489 (= e!342097 e!342099)))

(declare-fun b!598490 () Bool)

(assert (=> b!598490 (= e!342099 (MissingVacant!6175 vacantSpotIndex!68))))

(declare-fun b!598491 () Bool)

(assert (=> b!598491 (= e!342097 (Found!6175 index!984))))

(declare-fun b!598492 () Bool)

(assert (=> b!598492 (= e!342098 e!342097)))

(declare-fun c!67834 () Bool)

(assert (=> b!598492 (= c!67834 (= lt!271882 (select (arr!17779 a!2986) j!136)))))

(declare-fun b!598493 () Bool)

(assert (=> b!598493 (= e!342099 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!87147 () Bool)

(declare-fun lt!271883 () SeekEntryResult!6175)

(assert (=> d!87147 (and (or ((_ is Undefined!6175) lt!271883) (not ((_ is Found!6175) lt!271883)) (and (bvsge (index!26955 lt!271883) #b00000000000000000000000000000000) (bvslt (index!26955 lt!271883) (size!18143 a!2986)))) (or ((_ is Undefined!6175) lt!271883) ((_ is Found!6175) lt!271883) (not ((_ is MissingVacant!6175) lt!271883)) (not (= (index!26957 lt!271883) vacantSpotIndex!68)) (and (bvsge (index!26957 lt!271883) #b00000000000000000000000000000000) (bvslt (index!26957 lt!271883) (size!18143 a!2986)))) (or ((_ is Undefined!6175) lt!271883) (ite ((_ is Found!6175) lt!271883) (= (select (arr!17779 a!2986) (index!26955 lt!271883)) (select (arr!17779 a!2986) j!136)) (and ((_ is MissingVacant!6175) lt!271883) (= (index!26957 lt!271883) vacantSpotIndex!68) (= (select (arr!17779 a!2986) (index!26957 lt!271883)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87147 (= lt!271883 e!342098)))

(declare-fun c!67835 () Bool)

(assert (=> d!87147 (= c!67835 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87147 (= lt!271882 (select (arr!17779 a!2986) index!984))))

(assert (=> d!87147 (validMask!0 mask!3053)))

(assert (=> d!87147 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17779 a!2986) j!136) a!2986 mask!3053) lt!271883)))

(assert (= (and d!87147 c!67835) b!598488))

(assert (= (and d!87147 (not c!67835)) b!598492))

(assert (= (and b!598492 c!67834) b!598491))

(assert (= (and b!598492 (not c!67834)) b!598489))

(assert (= (and b!598489 c!67836) b!598490))

(assert (= (and b!598489 (not c!67836)) b!598493))

(assert (=> b!598493 m!576015))

(assert (=> b!598493 m!576015))

(assert (=> b!598493 m!575693))

(declare-fun m!576043 () Bool)

(assert (=> b!598493 m!576043))

(declare-fun m!576045 () Bool)

(assert (=> d!87147 m!576045))

(declare-fun m!576047 () Bool)

(assert (=> d!87147 m!576047))

(assert (=> d!87147 m!575719))

(assert (=> d!87147 m!575729))

(assert (=> b!598141 d!87147))

(declare-fun d!87149 () Bool)

(assert (=> d!87149 (= (validKeyInArray!0 (select (arr!17779 a!2986) j!136)) (and (not (= (select (arr!17779 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17779 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!598130 d!87149))

(declare-fun bm!32959 () Bool)

(declare-fun call!32962 () Bool)

(assert (=> bm!32959 (= call!32962 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!598508 () Bool)

(declare-fun e!342110 () Bool)

(assert (=> b!598508 (= e!342110 call!32962)))

(declare-fun d!87151 () Bool)

(declare-fun res!383562 () Bool)

(declare-fun e!342111 () Bool)

(assert (=> d!87151 (=> res!383562 e!342111)))

(assert (=> d!87151 (= res!383562 (bvsge #b00000000000000000000000000000000 (size!18143 a!2986)))))

(assert (=> d!87151 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!342111)))

(declare-fun b!598509 () Bool)

(declare-fun e!342109 () Bool)

(assert (=> b!598509 (= e!342109 call!32962)))

(declare-fun b!598510 () Bool)

(assert (=> b!598510 (= e!342111 e!342110)))

(declare-fun c!67842 () Bool)

(assert (=> b!598510 (= c!67842 (validKeyInArray!0 (select (arr!17779 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!598511 () Bool)

(assert (=> b!598511 (= e!342110 e!342109)))

(declare-fun lt!271893 () (_ BitVec 64))

(assert (=> b!598511 (= lt!271893 (select (arr!17779 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!271892 () Unit!18793)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37041 (_ BitVec 64) (_ BitVec 32)) Unit!18793)

(assert (=> b!598511 (= lt!271892 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!271893 #b00000000000000000000000000000000))))

(assert (=> b!598511 (arrayContainsKey!0 a!2986 lt!271893 #b00000000000000000000000000000000)))

(declare-fun lt!271894 () Unit!18793)

(assert (=> b!598511 (= lt!271894 lt!271892)))

(declare-fun res!383561 () Bool)

(assert (=> b!598511 (= res!383561 (= (seekEntryOrOpen!0 (select (arr!17779 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6175 #b00000000000000000000000000000000)))))

(assert (=> b!598511 (=> (not res!383561) (not e!342109))))

(assert (= (and d!87151 (not res!383562)) b!598510))

(assert (= (and b!598510 c!67842) b!598511))

(assert (= (and b!598510 (not c!67842)) b!598508))

(assert (= (and b!598511 res!383561) b!598509))

(assert (= (or b!598509 b!598508) bm!32959))

(declare-fun m!576059 () Bool)

(assert (=> bm!32959 m!576059))

(assert (=> b!598510 m!575941))

(assert (=> b!598510 m!575941))

(assert (=> b!598510 m!575947))

(assert (=> b!598511 m!575941))

(declare-fun m!576061 () Bool)

(assert (=> b!598511 m!576061))

(declare-fun m!576063 () Bool)

(assert (=> b!598511 m!576063))

(assert (=> b!598511 m!575941))

(declare-fun m!576065 () Bool)

(assert (=> b!598511 m!576065))

(assert (=> b!598140 d!87151))

(declare-fun d!87155 () Bool)

(declare-fun res!383563 () Bool)

(declare-fun e!342112 () Bool)

(assert (=> d!87155 (=> res!383563 e!342112)))

(assert (=> d!87155 (= res!383563 (= (select (arr!17779 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87155 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!342112)))

(declare-fun b!598512 () Bool)

(declare-fun e!342113 () Bool)

(assert (=> b!598512 (= e!342112 e!342113)))

(declare-fun res!383564 () Bool)

(assert (=> b!598512 (=> (not res!383564) (not e!342113))))

(assert (=> b!598512 (= res!383564 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18143 a!2986)))))

(declare-fun b!598513 () Bool)

(assert (=> b!598513 (= e!342113 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87155 (not res!383563)) b!598512))

(assert (= (and b!598512 res!383564) b!598513))

(assert (=> d!87155 m!575941))

(declare-fun m!576067 () Bool)

(assert (=> b!598513 m!576067))

(assert (=> b!598131 d!87155))

(check-sat (not d!87083) (not d!87135) (not b!598510) (not b!598493) (not b!598482) (not d!87087) (not b!598485) (not b!598364) (not d!87143) (not b!598483) (not d!87079) (not b!598297) (not b!598306) (not b!598511) (not bm!32959) (not d!87139) (not b!598296) (not d!87147) (not b!598487) (not b!598347) (not b!598459) (not b!598300) (not b!598370) (not bm!32949) (not d!87115) (not b!598513) (not b!598453) (not d!87125) (not b!598363) (not d!87137) (not b!598295) (not b!598359) (not b!598362) (not b!598465) (not d!87107) (not bm!32950) (not b!598430))
(check-sat)
