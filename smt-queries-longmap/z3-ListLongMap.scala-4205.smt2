; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57576 () Bool)

(assert start!57576)

(declare-fun b!636547 () Bool)

(declare-fun e!364161 () Bool)

(declare-fun e!364158 () Bool)

(assert (=> b!636547 (= e!364161 e!364158)))

(declare-fun res!411782 () Bool)

(assert (=> b!636547 (=> (not res!411782) (not e!364158))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38235 0))(
  ( (array!38236 (arr!18340 (Array (_ BitVec 32) (_ BitVec 64))) (size!18704 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38235)

(assert (=> b!636547 (= res!411782 (= (select (store (arr!18340 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!294352 () array!38235)

(assert (=> b!636547 (= lt!294352 (array!38236 (store (arr!18340 a!2986) i!1108 k0!1786) (size!18704 a!2986)))))

(declare-fun b!636548 () Bool)

(declare-fun res!411787 () Bool)

(declare-fun e!364166 () Bool)

(assert (=> b!636548 (=> (not res!411787) (not e!364166))))

(declare-fun arrayContainsKey!0 (array!38235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!636548 (= res!411787 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!411795 () Bool)

(assert (=> start!57576 (=> (not res!411795) (not e!364166))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57576 (= res!411795 (validMask!0 mask!3053))))

(assert (=> start!57576 e!364166))

(assert (=> start!57576 true))

(declare-fun array_inv!14199 (array!38235) Bool)

(assert (=> start!57576 (array_inv!14199 a!2986)))

(declare-fun b!636549 () Bool)

(declare-fun res!411781 () Bool)

(declare-fun e!364154 () Bool)

(assert (=> b!636549 (=> res!411781 e!364154)))

(declare-datatypes ((List!12288 0))(
  ( (Nil!12285) (Cons!12284 (h!13332 (_ BitVec 64)) (t!18508 List!12288)) )
))
(declare-fun noDuplicate!382 (List!12288) Bool)

(assert (=> b!636549 (= res!411781 (not (noDuplicate!382 Nil!12285)))))

(declare-fun b!636550 () Bool)

(declare-datatypes ((Unit!21453 0))(
  ( (Unit!21454) )
))
(declare-fun e!364163 () Unit!21453)

(declare-fun Unit!21455 () Unit!21453)

(assert (=> b!636550 (= e!364163 Unit!21455)))

(declare-fun b!636551 () Bool)

(declare-fun e!364165 () Bool)

(declare-fun e!364164 () Bool)

(assert (=> b!636551 (= e!364165 e!364164)))

(declare-fun res!411785 () Bool)

(assert (=> b!636551 (=> res!411785 e!364164)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!294344 () (_ BitVec 64))

(declare-fun lt!294351 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!636551 (= res!411785 (or (not (= (select (arr!18340 a!2986) j!136) lt!294351)) (not (= (select (arr!18340 a!2986) j!136) lt!294344)) (bvsge j!136 index!984)))))

(declare-fun b!636552 () Bool)

(assert (=> b!636552 (= e!364166 e!364161)))

(declare-fun res!411790 () Bool)

(assert (=> b!636552 (=> (not res!411790) (not e!364161))))

(declare-datatypes ((SeekEntryResult!6736 0))(
  ( (MissingZero!6736 (index!29252 (_ BitVec 32))) (Found!6736 (index!29253 (_ BitVec 32))) (Intermediate!6736 (undefined!7548 Bool) (index!29254 (_ BitVec 32)) (x!58155 (_ BitVec 32))) (Undefined!6736) (MissingVacant!6736 (index!29255 (_ BitVec 32))) )
))
(declare-fun lt!294350 () SeekEntryResult!6736)

(assert (=> b!636552 (= res!411790 (or (= lt!294350 (MissingZero!6736 i!1108)) (= lt!294350 (MissingVacant!6736 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38235 (_ BitVec 32)) SeekEntryResult!6736)

(assert (=> b!636552 (= lt!294350 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!636553 () Bool)

(declare-fun res!411780 () Bool)

(assert (=> b!636553 (=> (not res!411780) (not e!364166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!636553 (= res!411780 (validKeyInArray!0 (select (arr!18340 a!2986) j!136)))))

(declare-fun b!636554 () Bool)

(declare-fun e!364155 () Bool)

(assert (=> b!636554 (= e!364158 e!364155)))

(declare-fun res!411786 () Bool)

(assert (=> b!636554 (=> (not res!411786) (not e!364155))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!294343 () SeekEntryResult!6736)

(assert (=> b!636554 (= res!411786 (and (= lt!294343 (Found!6736 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18340 a!2986) index!984) (select (arr!18340 a!2986) j!136))) (not (= (select (arr!18340 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38235 (_ BitVec 32)) SeekEntryResult!6736)

(assert (=> b!636554 (= lt!294343 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18340 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636555 () Bool)

(declare-fun res!411797 () Bool)

(assert (=> b!636555 (=> (not res!411797) (not e!364166))))

(assert (=> b!636555 (= res!411797 (and (= (size!18704 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18704 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18704 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!636556 () Bool)

(declare-fun e!364156 () Bool)

(declare-fun contains!3080 (List!12288 (_ BitVec 64)) Bool)

(assert (=> b!636556 (= e!364156 (not (contains!3080 Nil!12285 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636557 () Bool)

(declare-fun res!411789 () Bool)

(assert (=> b!636557 (=> (not res!411789) (not e!364161))))

(assert (=> b!636557 (= res!411789 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18340 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636558 () Bool)

(declare-fun e!364162 () Bool)

(assert (=> b!636558 (= e!364155 (not e!364162))))

(declare-fun res!411784 () Bool)

(assert (=> b!636558 (=> res!411784 e!364162)))

(declare-fun lt!294347 () SeekEntryResult!6736)

(assert (=> b!636558 (= res!411784 (not (= lt!294347 (Found!6736 index!984))))))

(declare-fun lt!294349 () Unit!21453)

(assert (=> b!636558 (= lt!294349 e!364163)))

(declare-fun c!72752 () Bool)

(assert (=> b!636558 (= c!72752 (= lt!294347 Undefined!6736))))

(assert (=> b!636558 (= lt!294347 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294351 lt!294352 mask!3053))))

(declare-fun e!364160 () Bool)

(assert (=> b!636558 e!364160))

(declare-fun res!411796 () Bool)

(assert (=> b!636558 (=> (not res!411796) (not e!364160))))

(declare-fun lt!294345 () (_ BitVec 32))

(declare-fun lt!294346 () SeekEntryResult!6736)

(assert (=> b!636558 (= res!411796 (= lt!294346 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294345 vacantSpotIndex!68 lt!294351 lt!294352 mask!3053)))))

(assert (=> b!636558 (= lt!294346 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294345 vacantSpotIndex!68 (select (arr!18340 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!636558 (= lt!294351 (select (store (arr!18340 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294342 () Unit!21453)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38235 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21453)

(assert (=> b!636558 (= lt!294342 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294345 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!636558 (= lt!294345 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!636559 () Bool)

(declare-fun e!364157 () Bool)

(assert (=> b!636559 (= e!364164 e!364157)))

(declare-fun res!411799 () Bool)

(assert (=> b!636559 (=> (not res!411799) (not e!364157))))

(assert (=> b!636559 (= res!411799 (arrayContainsKey!0 lt!294352 (select (arr!18340 a!2986) j!136) j!136))))

(declare-fun b!636560 () Bool)

(assert (=> b!636560 (= e!364160 (= lt!294343 lt!294346))))

(declare-fun b!636561 () Bool)

(declare-fun res!411791 () Bool)

(assert (=> b!636561 (=> (not res!411791) (not e!364161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38235 (_ BitVec 32)) Bool)

(assert (=> b!636561 (= res!411791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!636562 () Bool)

(assert (=> b!636562 (= e!364157 (arrayContainsKey!0 lt!294352 (select (arr!18340 a!2986) j!136) index!984))))

(declare-fun b!636563 () Bool)

(assert (=> b!636563 (= e!364154 e!364156)))

(declare-fun res!411798 () Bool)

(assert (=> b!636563 (=> (not res!411798) (not e!364156))))

(assert (=> b!636563 (= res!411798 (not (contains!3080 Nil!12285 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636564 () Bool)

(declare-fun res!411794 () Bool)

(assert (=> b!636564 (=> (not res!411794) (not e!364166))))

(assert (=> b!636564 (= res!411794 (validKeyInArray!0 k0!1786))))

(declare-fun b!636565 () Bool)

(declare-fun res!411792 () Bool)

(assert (=> b!636565 (=> (not res!411792) (not e!364161))))

(declare-fun arrayNoDuplicates!0 (array!38235 (_ BitVec 32) List!12288) Bool)

(assert (=> b!636565 (= res!411792 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12285))))

(declare-fun b!636566 () Bool)

(declare-fun Unit!21456 () Unit!21453)

(assert (=> b!636566 (= e!364163 Unit!21456)))

(assert (=> b!636566 false))

(declare-fun b!636567 () Bool)

(declare-fun e!364159 () Bool)

(assert (=> b!636567 (= e!364159 e!364154)))

(declare-fun res!411788 () Bool)

(assert (=> b!636567 (=> res!411788 e!364154)))

(assert (=> b!636567 (= res!411788 (or (bvsge (size!18704 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18704 a!2986))))))

(assert (=> b!636567 (arrayContainsKey!0 lt!294352 (select (arr!18340 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294348 () Unit!21453)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38235 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21453)

(assert (=> b!636567 (= lt!294348 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294352 (select (arr!18340 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!636568 () Bool)

(assert (=> b!636568 (= e!364162 e!364159)))

(declare-fun res!411793 () Bool)

(assert (=> b!636568 (=> res!411793 e!364159)))

(assert (=> b!636568 (= res!411793 (or (not (= (select (arr!18340 a!2986) j!136) lt!294351)) (not (= (select (arr!18340 a!2986) j!136) lt!294344)) (bvsge j!136 index!984)))))

(assert (=> b!636568 e!364165))

(declare-fun res!411783 () Bool)

(assert (=> b!636568 (=> (not res!411783) (not e!364165))))

(assert (=> b!636568 (= res!411783 (= lt!294344 (select (arr!18340 a!2986) j!136)))))

(assert (=> b!636568 (= lt!294344 (select (store (arr!18340 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!57576 res!411795) b!636555))

(assert (= (and b!636555 res!411797) b!636553))

(assert (= (and b!636553 res!411780) b!636564))

(assert (= (and b!636564 res!411794) b!636548))

(assert (= (and b!636548 res!411787) b!636552))

(assert (= (and b!636552 res!411790) b!636561))

(assert (= (and b!636561 res!411791) b!636565))

(assert (= (and b!636565 res!411792) b!636557))

(assert (= (and b!636557 res!411789) b!636547))

(assert (= (and b!636547 res!411782) b!636554))

(assert (= (and b!636554 res!411786) b!636558))

(assert (= (and b!636558 res!411796) b!636560))

(assert (= (and b!636558 c!72752) b!636566))

(assert (= (and b!636558 (not c!72752)) b!636550))

(assert (= (and b!636558 (not res!411784)) b!636568))

(assert (= (and b!636568 res!411783) b!636551))

(assert (= (and b!636551 (not res!411785)) b!636559))

(assert (= (and b!636559 res!411799) b!636562))

(assert (= (and b!636568 (not res!411793)) b!636567))

(assert (= (and b!636567 (not res!411788)) b!636549))

(assert (= (and b!636549 (not res!411781)) b!636563))

(assert (= (and b!636563 res!411798) b!636556))

(declare-fun m!611131 () Bool)

(assert (=> b!636553 m!611131))

(assert (=> b!636553 m!611131))

(declare-fun m!611133 () Bool)

(assert (=> b!636553 m!611133))

(assert (=> b!636551 m!611131))

(declare-fun m!611135 () Bool)

(assert (=> b!636547 m!611135))

(declare-fun m!611137 () Bool)

(assert (=> b!636547 m!611137))

(declare-fun m!611139 () Bool)

(assert (=> b!636564 m!611139))

(declare-fun m!611141 () Bool)

(assert (=> b!636557 m!611141))

(declare-fun m!611143 () Bool)

(assert (=> b!636561 m!611143))

(declare-fun m!611145 () Bool)

(assert (=> b!636565 m!611145))

(declare-fun m!611147 () Bool)

(assert (=> b!636563 m!611147))

(declare-fun m!611149 () Bool)

(assert (=> b!636558 m!611149))

(declare-fun m!611151 () Bool)

(assert (=> b!636558 m!611151))

(assert (=> b!636558 m!611131))

(assert (=> b!636558 m!611135))

(assert (=> b!636558 m!611131))

(declare-fun m!611153 () Bool)

(assert (=> b!636558 m!611153))

(declare-fun m!611155 () Bool)

(assert (=> b!636558 m!611155))

(declare-fun m!611157 () Bool)

(assert (=> b!636558 m!611157))

(declare-fun m!611159 () Bool)

(assert (=> b!636558 m!611159))

(assert (=> b!636568 m!611131))

(assert (=> b!636568 m!611135))

(declare-fun m!611161 () Bool)

(assert (=> b!636568 m!611161))

(declare-fun m!611163 () Bool)

(assert (=> b!636554 m!611163))

(assert (=> b!636554 m!611131))

(assert (=> b!636554 m!611131))

(declare-fun m!611165 () Bool)

(assert (=> b!636554 m!611165))

(declare-fun m!611167 () Bool)

(assert (=> b!636552 m!611167))

(declare-fun m!611169 () Bool)

(assert (=> b!636556 m!611169))

(declare-fun m!611171 () Bool)

(assert (=> b!636549 m!611171))

(assert (=> b!636559 m!611131))

(assert (=> b!636559 m!611131))

(declare-fun m!611173 () Bool)

(assert (=> b!636559 m!611173))

(declare-fun m!611175 () Bool)

(assert (=> start!57576 m!611175))

(declare-fun m!611177 () Bool)

(assert (=> start!57576 m!611177))

(assert (=> b!636567 m!611131))

(assert (=> b!636567 m!611131))

(declare-fun m!611179 () Bool)

(assert (=> b!636567 m!611179))

(assert (=> b!636567 m!611131))

(declare-fun m!611181 () Bool)

(assert (=> b!636567 m!611181))

(assert (=> b!636562 m!611131))

(assert (=> b!636562 m!611131))

(declare-fun m!611183 () Bool)

(assert (=> b!636562 m!611183))

(declare-fun m!611185 () Bool)

(assert (=> b!636548 m!611185))

(check-sat (not b!636558) (not b!636565) (not b!636567) (not start!57576) (not b!636556) (not b!636548) (not b!636549) (not b!636562) (not b!636563) (not b!636559) (not b!636564) (not b!636554) (not b!636561) (not b!636552) (not b!636553))
(check-sat)
(get-model)

(declare-fun d!90061 () Bool)

(assert (=> d!90061 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636564 d!90061))

(declare-fun b!636713 () Bool)

(declare-fun c!72766 () Bool)

(declare-fun lt!294424 () (_ BitVec 64))

(assert (=> b!636713 (= c!72766 (= lt!294424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364258 () SeekEntryResult!6736)

(declare-fun e!364259 () SeekEntryResult!6736)

(assert (=> b!636713 (= e!364258 e!364259)))

(declare-fun b!636715 () Bool)

(assert (=> b!636715 (= e!364259 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18340 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636716 () Bool)

(declare-fun e!364260 () SeekEntryResult!6736)

(assert (=> b!636716 (= e!364260 Undefined!6736)))

(declare-fun b!636717 () Bool)

(assert (=> b!636717 (= e!364258 (Found!6736 index!984))))

(declare-fun b!636718 () Bool)

(assert (=> b!636718 (= e!364260 e!364258)))

(declare-fun c!72767 () Bool)

(assert (=> b!636718 (= c!72767 (= lt!294424 (select (arr!18340 a!2986) j!136)))))

(declare-fun b!636714 () Bool)

(assert (=> b!636714 (= e!364259 (MissingVacant!6736 vacantSpotIndex!68))))

(declare-fun lt!294423 () SeekEntryResult!6736)

(declare-fun d!90063 () Bool)

(get-info :version)

(assert (=> d!90063 (and (or ((_ is Undefined!6736) lt!294423) (not ((_ is Found!6736) lt!294423)) (and (bvsge (index!29253 lt!294423) #b00000000000000000000000000000000) (bvslt (index!29253 lt!294423) (size!18704 a!2986)))) (or ((_ is Undefined!6736) lt!294423) ((_ is Found!6736) lt!294423) (not ((_ is MissingVacant!6736) lt!294423)) (not (= (index!29255 lt!294423) vacantSpotIndex!68)) (and (bvsge (index!29255 lt!294423) #b00000000000000000000000000000000) (bvslt (index!29255 lt!294423) (size!18704 a!2986)))) (or ((_ is Undefined!6736) lt!294423) (ite ((_ is Found!6736) lt!294423) (= (select (arr!18340 a!2986) (index!29253 lt!294423)) (select (arr!18340 a!2986) j!136)) (and ((_ is MissingVacant!6736) lt!294423) (= (index!29255 lt!294423) vacantSpotIndex!68) (= (select (arr!18340 a!2986) (index!29255 lt!294423)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90063 (= lt!294423 e!364260)))

(declare-fun c!72765 () Bool)

(assert (=> d!90063 (= c!72765 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90063 (= lt!294424 (select (arr!18340 a!2986) index!984))))

(assert (=> d!90063 (validMask!0 mask!3053)))

(assert (=> d!90063 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18340 a!2986) j!136) a!2986 mask!3053) lt!294423)))

(assert (= (and d!90063 c!72765) b!636716))

(assert (= (and d!90063 (not c!72765)) b!636718))

(assert (= (and b!636718 c!72767) b!636717))

(assert (= (and b!636718 (not c!72767)) b!636713))

(assert (= (and b!636713 c!72766) b!636714))

(assert (= (and b!636713 (not c!72766)) b!636715))

(declare-fun m!611299 () Bool)

(assert (=> b!636715 m!611299))

(assert (=> b!636715 m!611299))

(assert (=> b!636715 m!611131))

(declare-fun m!611301 () Bool)

(assert (=> b!636715 m!611301))

(declare-fun m!611303 () Bool)

(assert (=> d!90063 m!611303))

(declare-fun m!611305 () Bool)

(assert (=> d!90063 m!611305))

(assert (=> d!90063 m!611163))

(assert (=> d!90063 m!611175))

(assert (=> b!636554 d!90063))

(declare-fun b!636729 () Bool)

(declare-fun e!364270 () Bool)

(declare-fun call!33441 () Bool)

(assert (=> b!636729 (= e!364270 call!33441)))

(declare-fun bm!33438 () Bool)

(declare-fun c!72770 () Bool)

(assert (=> bm!33438 (= call!33441 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72770 (Cons!12284 (select (arr!18340 a!2986) #b00000000000000000000000000000000) Nil!12285) Nil!12285)))))

(declare-fun b!636730 () Bool)

(declare-fun e!364271 () Bool)

(assert (=> b!636730 (= e!364271 e!364270)))

(assert (=> b!636730 (= c!72770 (validKeyInArray!0 (select (arr!18340 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!636731 () Bool)

(declare-fun e!364269 () Bool)

(assert (=> b!636731 (= e!364269 e!364271)))

(declare-fun res!411927 () Bool)

(assert (=> b!636731 (=> (not res!411927) (not e!364271))))

(declare-fun e!364272 () Bool)

(assert (=> b!636731 (= res!411927 (not e!364272))))

(declare-fun res!411926 () Bool)

(assert (=> b!636731 (=> (not res!411926) (not e!364272))))

(assert (=> b!636731 (= res!411926 (validKeyInArray!0 (select (arr!18340 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90065 () Bool)

(declare-fun res!411928 () Bool)

(assert (=> d!90065 (=> res!411928 e!364269)))

(assert (=> d!90065 (= res!411928 (bvsge #b00000000000000000000000000000000 (size!18704 a!2986)))))

(assert (=> d!90065 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12285) e!364269)))

(declare-fun b!636732 () Bool)

(assert (=> b!636732 (= e!364270 call!33441)))

(declare-fun b!636733 () Bool)

(assert (=> b!636733 (= e!364272 (contains!3080 Nil!12285 (select (arr!18340 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90065 (not res!411928)) b!636731))

(assert (= (and b!636731 res!411926) b!636733))

(assert (= (and b!636731 res!411927) b!636730))

(assert (= (and b!636730 c!72770) b!636729))

(assert (= (and b!636730 (not c!72770)) b!636732))

(assert (= (or b!636729 b!636732) bm!33438))

(declare-fun m!611307 () Bool)

(assert (=> bm!33438 m!611307))

(declare-fun m!611309 () Bool)

(assert (=> bm!33438 m!611309))

(assert (=> b!636730 m!611307))

(assert (=> b!636730 m!611307))

(declare-fun m!611311 () Bool)

(assert (=> b!636730 m!611311))

(assert (=> b!636731 m!611307))

(assert (=> b!636731 m!611307))

(assert (=> b!636731 m!611311))

(assert (=> b!636733 m!611307))

(assert (=> b!636733 m!611307))

(declare-fun m!611313 () Bool)

(assert (=> b!636733 m!611313))

(assert (=> b!636565 d!90065))

(declare-fun b!636746 () Bool)

(declare-fun e!364280 () SeekEntryResult!6736)

(declare-fun lt!294431 () SeekEntryResult!6736)

(assert (=> b!636746 (= e!364280 (MissingZero!6736 (index!29254 lt!294431)))))

(declare-fun b!636747 () Bool)

(declare-fun e!364281 () SeekEntryResult!6736)

(assert (=> b!636747 (= e!364281 Undefined!6736)))

(declare-fun b!636748 () Bool)

(assert (=> b!636748 (= e!364280 (seekKeyOrZeroReturnVacant!0 (x!58155 lt!294431) (index!29254 lt!294431) (index!29254 lt!294431) k0!1786 a!2986 mask!3053))))

(declare-fun d!90067 () Bool)

(declare-fun lt!294432 () SeekEntryResult!6736)

(assert (=> d!90067 (and (or ((_ is Undefined!6736) lt!294432) (not ((_ is Found!6736) lt!294432)) (and (bvsge (index!29253 lt!294432) #b00000000000000000000000000000000) (bvslt (index!29253 lt!294432) (size!18704 a!2986)))) (or ((_ is Undefined!6736) lt!294432) ((_ is Found!6736) lt!294432) (not ((_ is MissingZero!6736) lt!294432)) (and (bvsge (index!29252 lt!294432) #b00000000000000000000000000000000) (bvslt (index!29252 lt!294432) (size!18704 a!2986)))) (or ((_ is Undefined!6736) lt!294432) ((_ is Found!6736) lt!294432) ((_ is MissingZero!6736) lt!294432) (not ((_ is MissingVacant!6736) lt!294432)) (and (bvsge (index!29255 lt!294432) #b00000000000000000000000000000000) (bvslt (index!29255 lt!294432) (size!18704 a!2986)))) (or ((_ is Undefined!6736) lt!294432) (ite ((_ is Found!6736) lt!294432) (= (select (arr!18340 a!2986) (index!29253 lt!294432)) k0!1786) (ite ((_ is MissingZero!6736) lt!294432) (= (select (arr!18340 a!2986) (index!29252 lt!294432)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6736) lt!294432) (= (select (arr!18340 a!2986) (index!29255 lt!294432)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90067 (= lt!294432 e!364281)))

(declare-fun c!72778 () Bool)

(assert (=> d!90067 (= c!72778 (and ((_ is Intermediate!6736) lt!294431) (undefined!7548 lt!294431)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38235 (_ BitVec 32)) SeekEntryResult!6736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90067 (= lt!294431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90067 (validMask!0 mask!3053)))

(assert (=> d!90067 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!294432)))

(declare-fun b!636749 () Bool)

(declare-fun c!72777 () Bool)

(declare-fun lt!294433 () (_ BitVec 64))

(assert (=> b!636749 (= c!72777 (= lt!294433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364279 () SeekEntryResult!6736)

(assert (=> b!636749 (= e!364279 e!364280)))

(declare-fun b!636750 () Bool)

(assert (=> b!636750 (= e!364281 e!364279)))

(assert (=> b!636750 (= lt!294433 (select (arr!18340 a!2986) (index!29254 lt!294431)))))

(declare-fun c!72779 () Bool)

(assert (=> b!636750 (= c!72779 (= lt!294433 k0!1786))))

(declare-fun b!636751 () Bool)

(assert (=> b!636751 (= e!364279 (Found!6736 (index!29254 lt!294431)))))

(assert (= (and d!90067 c!72778) b!636747))

(assert (= (and d!90067 (not c!72778)) b!636750))

(assert (= (and b!636750 c!72779) b!636751))

(assert (= (and b!636750 (not c!72779)) b!636749))

(assert (= (and b!636749 c!72777) b!636746))

(assert (= (and b!636749 (not c!72777)) b!636748))

(declare-fun m!611315 () Bool)

(assert (=> b!636748 m!611315))

(declare-fun m!611317 () Bool)

(assert (=> d!90067 m!611317))

(assert (=> d!90067 m!611175))

(declare-fun m!611319 () Bool)

(assert (=> d!90067 m!611319))

(declare-fun m!611321 () Bool)

(assert (=> d!90067 m!611321))

(declare-fun m!611323 () Bool)

(assert (=> d!90067 m!611323))

(declare-fun m!611325 () Bool)

(assert (=> d!90067 m!611325))

(assert (=> d!90067 m!611323))

(declare-fun m!611327 () Bool)

(assert (=> b!636750 m!611327))

(assert (=> b!636552 d!90067))

(declare-fun d!90069 () Bool)

(declare-fun lt!294438 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!242 (List!12288) (InoxSet (_ BitVec 64)))

(assert (=> d!90069 (= lt!294438 (select (content!242 Nil!12285) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364291 () Bool)

(assert (=> d!90069 (= lt!294438 e!364291)))

(declare-fun res!411938 () Bool)

(assert (=> d!90069 (=> (not res!411938) (not e!364291))))

(assert (=> d!90069 (= res!411938 ((_ is Cons!12284) Nil!12285))))

(assert (=> d!90069 (= (contains!3080 Nil!12285 #b0000000000000000000000000000000000000000000000000000000000000000) lt!294438)))

(declare-fun b!636760 () Bool)

(declare-fun e!364290 () Bool)

(assert (=> b!636760 (= e!364291 e!364290)))

(declare-fun res!411937 () Bool)

(assert (=> b!636760 (=> res!411937 e!364290)))

(assert (=> b!636760 (= res!411937 (= (h!13332 Nil!12285) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636761 () Bool)

(assert (=> b!636761 (= e!364290 (contains!3080 (t!18508 Nil!12285) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90069 res!411938) b!636760))

(assert (= (and b!636760 (not res!411937)) b!636761))

(declare-fun m!611329 () Bool)

(assert (=> d!90069 m!611329))

(declare-fun m!611331 () Bool)

(assert (=> d!90069 m!611331))

(declare-fun m!611333 () Bool)

(assert (=> b!636761 m!611333))

(assert (=> b!636563 d!90069))

(declare-fun d!90073 () Bool)

(assert (=> d!90073 (= (validKeyInArray!0 (select (arr!18340 a!2986) j!136)) (and (not (= (select (arr!18340 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18340 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636553 d!90073))

(declare-fun d!90075 () Bool)

(declare-fun res!411945 () Bool)

(declare-fun e!364298 () Bool)

(assert (=> d!90075 (=> res!411945 e!364298)))

(assert (=> d!90075 (= res!411945 (= (select (arr!18340 lt!294352) index!984) (select (arr!18340 a!2986) j!136)))))

(assert (=> d!90075 (= (arrayContainsKey!0 lt!294352 (select (arr!18340 a!2986) j!136) index!984) e!364298)))

(declare-fun b!636768 () Bool)

(declare-fun e!364299 () Bool)

(assert (=> b!636768 (= e!364298 e!364299)))

(declare-fun res!411946 () Bool)

(assert (=> b!636768 (=> (not res!411946) (not e!364299))))

(assert (=> b!636768 (= res!411946 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18704 lt!294352)))))

(declare-fun b!636769 () Bool)

(assert (=> b!636769 (= e!364299 (arrayContainsKey!0 lt!294352 (select (arr!18340 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90075 (not res!411945)) b!636768))

(assert (= (and b!636768 res!411946) b!636769))

(declare-fun m!611341 () Bool)

(assert (=> d!90075 m!611341))

(assert (=> b!636769 m!611131))

(declare-fun m!611343 () Bool)

(assert (=> b!636769 m!611343))

(assert (=> b!636562 d!90075))

(declare-fun d!90081 () Bool)

(declare-fun res!411961 () Bool)

(declare-fun e!364320 () Bool)

(assert (=> d!90081 (=> res!411961 e!364320)))

(assert (=> d!90081 (= res!411961 (bvsge #b00000000000000000000000000000000 (size!18704 a!2986)))))

(assert (=> d!90081 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!364320)))

(declare-fun b!636793 () Bool)

(declare-fun e!364318 () Bool)

(declare-fun call!33447 () Bool)

(assert (=> b!636793 (= e!364318 call!33447)))

(declare-fun b!636794 () Bool)

(assert (=> b!636794 (= e!364320 e!364318)))

(declare-fun c!72785 () Bool)

(assert (=> b!636794 (= c!72785 (validKeyInArray!0 (select (arr!18340 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!636795 () Bool)

(declare-fun e!364319 () Bool)

(assert (=> b!636795 (= e!364318 e!364319)))

(declare-fun lt!294448 () (_ BitVec 64))

(assert (=> b!636795 (= lt!294448 (select (arr!18340 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!294447 () Unit!21453)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38235 (_ BitVec 64) (_ BitVec 32)) Unit!21453)

(assert (=> b!636795 (= lt!294447 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!294448 #b00000000000000000000000000000000))))

(assert (=> b!636795 (arrayContainsKey!0 a!2986 lt!294448 #b00000000000000000000000000000000)))

(declare-fun lt!294446 () Unit!21453)

(assert (=> b!636795 (= lt!294446 lt!294447)))

(declare-fun res!411960 () Bool)

(assert (=> b!636795 (= res!411960 (= (seekEntryOrOpen!0 (select (arr!18340 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6736 #b00000000000000000000000000000000)))))

(assert (=> b!636795 (=> (not res!411960) (not e!364319))))

(declare-fun b!636796 () Bool)

(assert (=> b!636796 (= e!364319 call!33447)))

(declare-fun bm!33444 () Bool)

(assert (=> bm!33444 (= call!33447 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!90081 (not res!411961)) b!636794))

(assert (= (and b!636794 c!72785) b!636795))

(assert (= (and b!636794 (not c!72785)) b!636793))

(assert (= (and b!636795 res!411960) b!636796))

(assert (= (or b!636796 b!636793) bm!33444))

(assert (=> b!636794 m!611307))

(assert (=> b!636794 m!611307))

(assert (=> b!636794 m!611311))

(assert (=> b!636795 m!611307))

(declare-fun m!611353 () Bool)

(assert (=> b!636795 m!611353))

(declare-fun m!611355 () Bool)

(assert (=> b!636795 m!611355))

(assert (=> b!636795 m!611307))

(declare-fun m!611357 () Bool)

(assert (=> b!636795 m!611357))

(declare-fun m!611359 () Bool)

(assert (=> bm!33444 m!611359))

(assert (=> b!636561 d!90081))

(declare-fun d!90085 () Bool)

(declare-fun res!411962 () Bool)

(declare-fun e!364321 () Bool)

(assert (=> d!90085 (=> res!411962 e!364321)))

(assert (=> d!90085 (= res!411962 (= (select (arr!18340 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90085 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!364321)))

(declare-fun b!636797 () Bool)

(declare-fun e!364322 () Bool)

(assert (=> b!636797 (= e!364321 e!364322)))

(declare-fun res!411963 () Bool)

(assert (=> b!636797 (=> (not res!411963) (not e!364322))))

(assert (=> b!636797 (= res!411963 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18704 a!2986)))))

(declare-fun b!636798 () Bool)

(assert (=> b!636798 (= e!364322 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90085 (not res!411962)) b!636797))

(assert (= (and b!636797 res!411963) b!636798))

(assert (=> d!90085 m!611307))

(declare-fun m!611361 () Bool)

(assert (=> b!636798 m!611361))

(assert (=> b!636548 d!90085))

(declare-fun d!90087 () Bool)

(declare-fun res!411964 () Bool)

(declare-fun e!364323 () Bool)

(assert (=> d!90087 (=> res!411964 e!364323)))

(assert (=> d!90087 (= res!411964 (= (select (arr!18340 lt!294352) j!136) (select (arr!18340 a!2986) j!136)))))

(assert (=> d!90087 (= (arrayContainsKey!0 lt!294352 (select (arr!18340 a!2986) j!136) j!136) e!364323)))

(declare-fun b!636799 () Bool)

(declare-fun e!364324 () Bool)

(assert (=> b!636799 (= e!364323 e!364324)))

(declare-fun res!411965 () Bool)

(assert (=> b!636799 (=> (not res!411965) (not e!364324))))

(assert (=> b!636799 (= res!411965 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18704 lt!294352)))))

(declare-fun b!636800 () Bool)

(assert (=> b!636800 (= e!364324 (arrayContainsKey!0 lt!294352 (select (arr!18340 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90087 (not res!411964)) b!636799))

(assert (= (and b!636799 res!411965) b!636800))

(declare-fun m!611363 () Bool)

(assert (=> d!90087 m!611363))

(assert (=> b!636800 m!611131))

(declare-fun m!611365 () Bool)

(assert (=> b!636800 m!611365))

(assert (=> b!636559 d!90087))

(declare-fun d!90089 () Bool)

(declare-fun res!411970 () Bool)

(declare-fun e!364329 () Bool)

(assert (=> d!90089 (=> res!411970 e!364329)))

(assert (=> d!90089 (= res!411970 ((_ is Nil!12285) Nil!12285))))

(assert (=> d!90089 (= (noDuplicate!382 Nil!12285) e!364329)))

(declare-fun b!636805 () Bool)

(declare-fun e!364330 () Bool)

(assert (=> b!636805 (= e!364329 e!364330)))

(declare-fun res!411971 () Bool)

(assert (=> b!636805 (=> (not res!411971) (not e!364330))))

(assert (=> b!636805 (= res!411971 (not (contains!3080 (t!18508 Nil!12285) (h!13332 Nil!12285))))))

(declare-fun b!636806 () Bool)

(assert (=> b!636806 (= e!364330 (noDuplicate!382 (t!18508 Nil!12285)))))

(assert (= (and d!90089 (not res!411970)) b!636805))

(assert (= (and b!636805 res!411971) b!636806))

(declare-fun m!611367 () Bool)

(assert (=> b!636805 m!611367))

(declare-fun m!611369 () Bool)

(assert (=> b!636806 m!611369))

(assert (=> b!636549 d!90089))

(declare-fun d!90091 () Bool)

(declare-fun e!364357 () Bool)

(assert (=> d!90091 e!364357))

(declare-fun res!411974 () Bool)

(assert (=> d!90091 (=> (not res!411974) (not e!364357))))

(assert (=> d!90091 (= res!411974 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18704 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18704 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18704 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18704 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18704 a!2986))))))

(declare-fun lt!294470 () Unit!21453)

(declare-fun choose!9 (array!38235 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21453)

(assert (=> d!90091 (= lt!294470 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294345 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90091 (validMask!0 mask!3053)))

(assert (=> d!90091 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294345 vacantSpotIndex!68 mask!3053) lt!294470)))

(declare-fun b!636857 () Bool)

(assert (=> b!636857 (= e!364357 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294345 vacantSpotIndex!68 (select (arr!18340 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294345 vacantSpotIndex!68 (select (store (arr!18340 a!2986) i!1108 k0!1786) j!136) (array!38236 (store (arr!18340 a!2986) i!1108 k0!1786) (size!18704 a!2986)) mask!3053)))))

(assert (= (and d!90091 res!411974) b!636857))

(declare-fun m!611413 () Bool)

(assert (=> d!90091 m!611413))

(assert (=> d!90091 m!611175))

(assert (=> b!636857 m!611131))

(assert (=> b!636857 m!611153))

(assert (=> b!636857 m!611151))

(assert (=> b!636857 m!611131))

(assert (=> b!636857 m!611135))

(assert (=> b!636857 m!611151))

(declare-fun m!611415 () Bool)

(assert (=> b!636857 m!611415))

(assert (=> b!636558 d!90091))

(declare-fun b!636858 () Bool)

(declare-fun c!72811 () Bool)

(declare-fun lt!294472 () (_ BitVec 64))

(assert (=> b!636858 (= c!72811 (= lt!294472 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364358 () SeekEntryResult!6736)

(declare-fun e!364359 () SeekEntryResult!6736)

(assert (=> b!636858 (= e!364358 e!364359)))

(declare-fun b!636860 () Bool)

(assert (=> b!636860 (= e!364359 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294345 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18340 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636861 () Bool)

(declare-fun e!364360 () SeekEntryResult!6736)

(assert (=> b!636861 (= e!364360 Undefined!6736)))

(declare-fun b!636862 () Bool)

(assert (=> b!636862 (= e!364358 (Found!6736 lt!294345))))

(declare-fun b!636863 () Bool)

(assert (=> b!636863 (= e!364360 e!364358)))

(declare-fun c!72812 () Bool)

(assert (=> b!636863 (= c!72812 (= lt!294472 (select (arr!18340 a!2986) j!136)))))

(declare-fun b!636859 () Bool)

(assert (=> b!636859 (= e!364359 (MissingVacant!6736 vacantSpotIndex!68))))

(declare-fun lt!294471 () SeekEntryResult!6736)

(declare-fun d!90101 () Bool)

(assert (=> d!90101 (and (or ((_ is Undefined!6736) lt!294471) (not ((_ is Found!6736) lt!294471)) (and (bvsge (index!29253 lt!294471) #b00000000000000000000000000000000) (bvslt (index!29253 lt!294471) (size!18704 a!2986)))) (or ((_ is Undefined!6736) lt!294471) ((_ is Found!6736) lt!294471) (not ((_ is MissingVacant!6736) lt!294471)) (not (= (index!29255 lt!294471) vacantSpotIndex!68)) (and (bvsge (index!29255 lt!294471) #b00000000000000000000000000000000) (bvslt (index!29255 lt!294471) (size!18704 a!2986)))) (or ((_ is Undefined!6736) lt!294471) (ite ((_ is Found!6736) lt!294471) (= (select (arr!18340 a!2986) (index!29253 lt!294471)) (select (arr!18340 a!2986) j!136)) (and ((_ is MissingVacant!6736) lt!294471) (= (index!29255 lt!294471) vacantSpotIndex!68) (= (select (arr!18340 a!2986) (index!29255 lt!294471)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90101 (= lt!294471 e!364360)))

(declare-fun c!72810 () Bool)

(assert (=> d!90101 (= c!72810 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90101 (= lt!294472 (select (arr!18340 a!2986) lt!294345))))

(assert (=> d!90101 (validMask!0 mask!3053)))

(assert (=> d!90101 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294345 vacantSpotIndex!68 (select (arr!18340 a!2986) j!136) a!2986 mask!3053) lt!294471)))

(assert (= (and d!90101 c!72810) b!636861))

(assert (= (and d!90101 (not c!72810)) b!636863))

(assert (= (and b!636863 c!72812) b!636862))

(assert (= (and b!636863 (not c!72812)) b!636858))

(assert (= (and b!636858 c!72811) b!636859))

(assert (= (and b!636858 (not c!72811)) b!636860))

(declare-fun m!611417 () Bool)

(assert (=> b!636860 m!611417))

(assert (=> b!636860 m!611417))

(assert (=> b!636860 m!611131))

(declare-fun m!611419 () Bool)

(assert (=> b!636860 m!611419))

(declare-fun m!611421 () Bool)

(assert (=> d!90101 m!611421))

(declare-fun m!611423 () Bool)

(assert (=> d!90101 m!611423))

(declare-fun m!611425 () Bool)

(assert (=> d!90101 m!611425))

(assert (=> d!90101 m!611175))

(assert (=> b!636558 d!90101))

(declare-fun b!636864 () Bool)

(declare-fun c!72814 () Bool)

(declare-fun lt!294474 () (_ BitVec 64))

(assert (=> b!636864 (= c!72814 (= lt!294474 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364361 () SeekEntryResult!6736)

(declare-fun e!364362 () SeekEntryResult!6736)

(assert (=> b!636864 (= e!364361 e!364362)))

(declare-fun b!636866 () Bool)

(assert (=> b!636866 (= e!364362 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294345 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!294351 lt!294352 mask!3053))))

(declare-fun b!636867 () Bool)

(declare-fun e!364363 () SeekEntryResult!6736)

(assert (=> b!636867 (= e!364363 Undefined!6736)))

(declare-fun b!636868 () Bool)

(assert (=> b!636868 (= e!364361 (Found!6736 lt!294345))))

(declare-fun b!636869 () Bool)

(assert (=> b!636869 (= e!364363 e!364361)))

(declare-fun c!72815 () Bool)

(assert (=> b!636869 (= c!72815 (= lt!294474 lt!294351))))

(declare-fun b!636865 () Bool)

(assert (=> b!636865 (= e!364362 (MissingVacant!6736 vacantSpotIndex!68))))

(declare-fun lt!294473 () SeekEntryResult!6736)

(declare-fun d!90103 () Bool)

(assert (=> d!90103 (and (or ((_ is Undefined!6736) lt!294473) (not ((_ is Found!6736) lt!294473)) (and (bvsge (index!29253 lt!294473) #b00000000000000000000000000000000) (bvslt (index!29253 lt!294473) (size!18704 lt!294352)))) (or ((_ is Undefined!6736) lt!294473) ((_ is Found!6736) lt!294473) (not ((_ is MissingVacant!6736) lt!294473)) (not (= (index!29255 lt!294473) vacantSpotIndex!68)) (and (bvsge (index!29255 lt!294473) #b00000000000000000000000000000000) (bvslt (index!29255 lt!294473) (size!18704 lt!294352)))) (or ((_ is Undefined!6736) lt!294473) (ite ((_ is Found!6736) lt!294473) (= (select (arr!18340 lt!294352) (index!29253 lt!294473)) lt!294351) (and ((_ is MissingVacant!6736) lt!294473) (= (index!29255 lt!294473) vacantSpotIndex!68) (= (select (arr!18340 lt!294352) (index!29255 lt!294473)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90103 (= lt!294473 e!364363)))

(declare-fun c!72813 () Bool)

(assert (=> d!90103 (= c!72813 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90103 (= lt!294474 (select (arr!18340 lt!294352) lt!294345))))

(assert (=> d!90103 (validMask!0 mask!3053)))

(assert (=> d!90103 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294345 vacantSpotIndex!68 lt!294351 lt!294352 mask!3053) lt!294473)))

(assert (= (and d!90103 c!72813) b!636867))

(assert (= (and d!90103 (not c!72813)) b!636869))

(assert (= (and b!636869 c!72815) b!636868))

(assert (= (and b!636869 (not c!72815)) b!636864))

(assert (= (and b!636864 c!72814) b!636865))

(assert (= (and b!636864 (not c!72814)) b!636866))

(assert (=> b!636866 m!611417))

(assert (=> b!636866 m!611417))

(declare-fun m!611427 () Bool)

(assert (=> b!636866 m!611427))

(declare-fun m!611429 () Bool)

(assert (=> d!90103 m!611429))

(declare-fun m!611431 () Bool)

(assert (=> d!90103 m!611431))

(declare-fun m!611433 () Bool)

(assert (=> d!90103 m!611433))

(assert (=> d!90103 m!611175))

(assert (=> b!636558 d!90103))

(declare-fun d!90105 () Bool)

(declare-fun lt!294481 () (_ BitVec 32))

(assert (=> d!90105 (and (bvsge lt!294481 #b00000000000000000000000000000000) (bvslt lt!294481 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90105 (= lt!294481 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!90105 (validMask!0 mask!3053)))

(assert (=> d!90105 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!294481)))

(declare-fun bs!19133 () Bool)

(assert (= bs!19133 d!90105))

(declare-fun m!611435 () Bool)

(assert (=> bs!19133 m!611435))

(assert (=> bs!19133 m!611175))

(assert (=> b!636558 d!90105))

(declare-fun b!636882 () Bool)

(declare-fun c!72823 () Bool)

(declare-fun lt!294483 () (_ BitVec 64))

(assert (=> b!636882 (= c!72823 (= lt!294483 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364370 () SeekEntryResult!6736)

(declare-fun e!364371 () SeekEntryResult!6736)

(assert (=> b!636882 (= e!364370 e!364371)))

(declare-fun b!636884 () Bool)

(assert (=> b!636884 (= e!364371 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!294351 lt!294352 mask!3053))))

(declare-fun b!636885 () Bool)

(declare-fun e!364372 () SeekEntryResult!6736)

(assert (=> b!636885 (= e!364372 Undefined!6736)))

(declare-fun b!636886 () Bool)

(assert (=> b!636886 (= e!364370 (Found!6736 index!984))))

(declare-fun b!636887 () Bool)

(assert (=> b!636887 (= e!364372 e!364370)))

(declare-fun c!72824 () Bool)

(assert (=> b!636887 (= c!72824 (= lt!294483 lt!294351))))

(declare-fun b!636883 () Bool)

(assert (=> b!636883 (= e!364371 (MissingVacant!6736 vacantSpotIndex!68))))

(declare-fun lt!294482 () SeekEntryResult!6736)

(declare-fun d!90107 () Bool)

(assert (=> d!90107 (and (or ((_ is Undefined!6736) lt!294482) (not ((_ is Found!6736) lt!294482)) (and (bvsge (index!29253 lt!294482) #b00000000000000000000000000000000) (bvslt (index!29253 lt!294482) (size!18704 lt!294352)))) (or ((_ is Undefined!6736) lt!294482) ((_ is Found!6736) lt!294482) (not ((_ is MissingVacant!6736) lt!294482)) (not (= (index!29255 lt!294482) vacantSpotIndex!68)) (and (bvsge (index!29255 lt!294482) #b00000000000000000000000000000000) (bvslt (index!29255 lt!294482) (size!18704 lt!294352)))) (or ((_ is Undefined!6736) lt!294482) (ite ((_ is Found!6736) lt!294482) (= (select (arr!18340 lt!294352) (index!29253 lt!294482)) lt!294351) (and ((_ is MissingVacant!6736) lt!294482) (= (index!29255 lt!294482) vacantSpotIndex!68) (= (select (arr!18340 lt!294352) (index!29255 lt!294482)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90107 (= lt!294482 e!364372)))

(declare-fun c!72822 () Bool)

(assert (=> d!90107 (= c!72822 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90107 (= lt!294483 (select (arr!18340 lt!294352) index!984))))

(assert (=> d!90107 (validMask!0 mask!3053)))

(assert (=> d!90107 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294351 lt!294352 mask!3053) lt!294482)))

(assert (= (and d!90107 c!72822) b!636885))

(assert (= (and d!90107 (not c!72822)) b!636887))

(assert (= (and b!636887 c!72824) b!636886))

(assert (= (and b!636887 (not c!72824)) b!636882))

(assert (= (and b!636882 c!72823) b!636883))

(assert (= (and b!636882 (not c!72823)) b!636884))

(assert (=> b!636884 m!611299))

(assert (=> b!636884 m!611299))

(declare-fun m!611437 () Bool)

(assert (=> b!636884 m!611437))

(declare-fun m!611439 () Bool)

(assert (=> d!90107 m!611439))

(declare-fun m!611441 () Bool)

(assert (=> d!90107 m!611441))

(assert (=> d!90107 m!611341))

(assert (=> d!90107 m!611175))

(assert (=> b!636558 d!90107))

(declare-fun d!90109 () Bool)

(declare-fun lt!294484 () Bool)

(assert (=> d!90109 (= lt!294484 (select (content!242 Nil!12285) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364374 () Bool)

(assert (=> d!90109 (= lt!294484 e!364374)))

(declare-fun res!411976 () Bool)

(assert (=> d!90109 (=> (not res!411976) (not e!364374))))

(assert (=> d!90109 (= res!411976 ((_ is Cons!12284) Nil!12285))))

(assert (=> d!90109 (= (contains!3080 Nil!12285 #b1000000000000000000000000000000000000000000000000000000000000000) lt!294484)))

(declare-fun b!636888 () Bool)

(declare-fun e!364373 () Bool)

(assert (=> b!636888 (= e!364374 e!364373)))

(declare-fun res!411975 () Bool)

(assert (=> b!636888 (=> res!411975 e!364373)))

(assert (=> b!636888 (= res!411975 (= (h!13332 Nil!12285) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636889 () Bool)

(assert (=> b!636889 (= e!364373 (contains!3080 (t!18508 Nil!12285) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90109 res!411976) b!636888))

(assert (= (and b!636888 (not res!411975)) b!636889))

(assert (=> d!90109 m!611329))

(declare-fun m!611443 () Bool)

(assert (=> d!90109 m!611443))

(declare-fun m!611445 () Bool)

(assert (=> b!636889 m!611445))

(assert (=> b!636556 d!90109))

(declare-fun d!90111 () Bool)

(assert (=> d!90111 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57576 d!90111))

(declare-fun d!90123 () Bool)

(assert (=> d!90123 (= (array_inv!14199 a!2986) (bvsge (size!18704 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57576 d!90123))

(declare-fun d!90127 () Bool)

(declare-fun res!411988 () Bool)

(declare-fun e!364392 () Bool)

(assert (=> d!90127 (=> res!411988 e!364392)))

(assert (=> d!90127 (= res!411988 (= (select (arr!18340 lt!294352) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18340 a!2986) j!136)))))

(assert (=> d!90127 (= (arrayContainsKey!0 lt!294352 (select (arr!18340 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!364392)))

(declare-fun b!636913 () Bool)

(declare-fun e!364393 () Bool)

(assert (=> b!636913 (= e!364392 e!364393)))

(declare-fun res!411989 () Bool)

(assert (=> b!636913 (=> (not res!411989) (not e!364393))))

(assert (=> b!636913 (= res!411989 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18704 lt!294352)))))

(declare-fun b!636914 () Bool)

(assert (=> b!636914 (= e!364393 (arrayContainsKey!0 lt!294352 (select (arr!18340 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90127 (not res!411988)) b!636913))

(assert (= (and b!636913 res!411989) b!636914))

(declare-fun m!611475 () Bool)

(assert (=> d!90127 m!611475))

(assert (=> b!636914 m!611131))

(declare-fun m!611477 () Bool)

(assert (=> b!636914 m!611477))

(assert (=> b!636567 d!90127))

(declare-fun d!90131 () Bool)

(assert (=> d!90131 (arrayContainsKey!0 lt!294352 (select (arr!18340 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294498 () Unit!21453)

(declare-fun choose!114 (array!38235 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21453)

(assert (=> d!90131 (= lt!294498 (choose!114 lt!294352 (select (arr!18340 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90131 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90131 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294352 (select (arr!18340 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!294498)))

(declare-fun bs!19135 () Bool)

(assert (= bs!19135 d!90131))

(assert (=> bs!19135 m!611131))

(assert (=> bs!19135 m!611179))

(assert (=> bs!19135 m!611131))

(declare-fun m!611479 () Bool)

(assert (=> bs!19135 m!611479))

(assert (=> b!636567 d!90131))

(check-sat (not b!636731) (not b!636884) (not d!90109) (not d!90067) (not bm!33444) (not b!636914) (not d!90069) (not b!636769) (not d!90091) (not b!636806) (not b!636748) (not b!636889) (not d!90105) (not d!90131) (not b!636715) (not b!636733) (not b!636857) (not b!636761) (not bm!33438) (not d!90107) (not b!636794) (not b!636795) (not b!636866) (not b!636798) (not b!636860) (not d!90101) (not b!636730) (not d!90063) (not b!636800) (not d!90103) (not b!636805))
(check-sat)
