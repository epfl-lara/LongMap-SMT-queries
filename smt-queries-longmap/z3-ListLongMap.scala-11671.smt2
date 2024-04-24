; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136918 () Bool)

(assert start!136918)

(declare-fun x!458 () (_ BitVec 32))

(declare-fun b!1580106 () Bool)

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun e!881494 () Bool)

(declare-datatypes ((array!105755 0))(
  ( (array!105756 (arr!50986 (Array (_ BitVec 32) (_ BitVec 64))) (size!51537 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105755)

(declare-datatypes ((SeekEntryResult!13706 0))(
  ( (MissingZero!13706 (index!57222 (_ BitVec 32))) (Found!13706 (index!57223 (_ BitVec 32))) (Intermediate!13706 (undefined!14518 Bool) (index!57224 (_ BitVec 32)) (x!142574 (_ BitVec 32))) (Undefined!13706) (MissingVacant!13706 (index!57225 (_ BitVec 32))) )
))
(declare-fun lt!676965 () SeekEntryResult!13706)

(get-info :version)

(assert (=> b!1580106 (= e!881494 (and ((_ is Intermediate!13706) lt!676965) (not (undefined!14518 lt!676965)) (bvslt (x!142574 lt!676965) #b01111111111111111111111111111110) (bvsge (x!142574 lt!676965) #b00000000000000000000000000000000) (bvsge (x!142574 lt!676965) x!458) (not (= (select (arr!50986 _keys!610) (index!57224 lt!676965)) k0!768)) (not (= (select (arr!50986 _keys!610) (index!57224 lt!676965)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!57224 lt!676965) #b00000000000000000000000000000000) (bvsge (index!57224 lt!676965) (size!51537 _keys!610)))))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105755 (_ BitVec 32)) SeekEntryResult!13706)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1580106 (= lt!676965 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1580105 () Bool)

(declare-fun res!1078683 () Bool)

(assert (=> b!1580105 (=> (not res!1078683) (not e!881494))))

(assert (=> b!1580105 (= res!1078683 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50986 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50986 _keys!610) ee!12) (select (arr!50986 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1580103 () Bool)

(declare-fun res!1078685 () Bool)

(assert (=> b!1580103 (=> (not res!1078685) (not e!881494))))

(assert (=> b!1580103 (= res!1078685 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51537 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1078684 () Bool)

(assert (=> start!136918 (=> (not res!1078684) (not e!881494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136918 (= res!1078684 (validMask!0 mask!910))))

(assert (=> start!136918 e!881494))

(assert (=> start!136918 true))

(declare-fun array_inv!39941 (array!105755) Bool)

(assert (=> start!136918 (array_inv!39941 _keys!610)))

(declare-fun b!1580104 () Bool)

(declare-fun res!1078682 () Bool)

(assert (=> b!1580104 (=> (not res!1078682) (not e!881494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1580104 (= res!1078682 (validKeyInArray!0 k0!768))))

(assert (= (and start!136918 res!1078684) b!1580103))

(assert (= (and b!1580103 res!1078685) b!1580104))

(assert (= (and b!1580104 res!1078682) b!1580105))

(assert (= (and b!1580105 res!1078683) b!1580106))

(declare-fun m!1452105 () Bool)

(assert (=> b!1580106 m!1452105))

(declare-fun m!1452107 () Bool)

(assert (=> b!1580106 m!1452107))

(assert (=> b!1580106 m!1452107))

(declare-fun m!1452109 () Bool)

(assert (=> b!1580106 m!1452109))

(declare-fun m!1452111 () Bool)

(assert (=> b!1580105 m!1452111))

(declare-fun m!1452113 () Bool)

(assert (=> start!136918 m!1452113))

(declare-fun m!1452115 () Bool)

(assert (=> start!136918 m!1452115))

(declare-fun m!1452117 () Bool)

(assert (=> b!1580104 m!1452117))

(check-sat (not b!1580106) (not start!136918) (not b!1580104))
(check-sat)
(get-model)

(declare-fun d!166645 () Bool)

(declare-fun e!881521 () Bool)

(assert (=> d!166645 e!881521))

(declare-fun c!147013 () Bool)

(declare-fun lt!676977 () SeekEntryResult!13706)

(assert (=> d!166645 (= c!147013 (and ((_ is Intermediate!13706) lt!676977) (undefined!14518 lt!676977)))))

(declare-fun e!881522 () SeekEntryResult!13706)

(assert (=> d!166645 (= lt!676977 e!881522)))

(declare-fun c!147014 () Bool)

(assert (=> d!166645 (= c!147014 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(declare-fun lt!676976 () (_ BitVec 64))

(assert (=> d!166645 (= lt!676976 (select (arr!50986 _keys!610) (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910)))))

(assert (=> d!166645 (validMask!0 mask!910)))

(assert (=> d!166645 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910) lt!676977)))

(declare-fun b!1580149 () Bool)

(assert (=> b!1580149 (= e!881521 (bvsge (x!142574 lt!676977) #b01111111111111111111111111111110))))

(declare-fun e!881520 () SeekEntryResult!13706)

(declare-fun b!1580150 () Bool)

(assert (=> b!1580150 (= e!881520 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1580151 () Bool)

(assert (=> b!1580151 (= e!881522 e!881520)))

(declare-fun c!147012 () Bool)

(assert (=> b!1580151 (= c!147012 (or (= lt!676976 k0!768) (= (bvadd lt!676976 lt!676976) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1580152 () Bool)

(assert (=> b!1580152 (= e!881520 (Intermediate!13706 false (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1580153 () Bool)

(assert (=> b!1580153 (and (bvsge (index!57224 lt!676977) #b00000000000000000000000000000000) (bvslt (index!57224 lt!676977) (size!51537 _keys!610)))))

(declare-fun res!1078717 () Bool)

(assert (=> b!1580153 (= res!1078717 (= (select (arr!50986 _keys!610) (index!57224 lt!676977)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!881519 () Bool)

(assert (=> b!1580153 (=> res!1078717 e!881519)))

(declare-fun b!1580154 () Bool)

(declare-fun e!881518 () Bool)

(assert (=> b!1580154 (= e!881521 e!881518)))

(declare-fun res!1078718 () Bool)

(assert (=> b!1580154 (= res!1078718 (and ((_ is Intermediate!13706) lt!676977) (not (undefined!14518 lt!676977)) (bvslt (x!142574 lt!676977) #b01111111111111111111111111111110) (bvsge (x!142574 lt!676977) #b00000000000000000000000000000000) (bvsge (x!142574 lt!676977) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1580154 (=> (not res!1078718) (not e!881518))))

(declare-fun b!1580155 () Bool)

(assert (=> b!1580155 (and (bvsge (index!57224 lt!676977) #b00000000000000000000000000000000) (bvslt (index!57224 lt!676977) (size!51537 _keys!610)))))

(assert (=> b!1580155 (= e!881519 (= (select (arr!50986 _keys!610) (index!57224 lt!676977)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1580156 () Bool)

(assert (=> b!1580156 (and (bvsge (index!57224 lt!676977) #b00000000000000000000000000000000) (bvslt (index!57224 lt!676977) (size!51537 _keys!610)))))

(declare-fun res!1078716 () Bool)

(assert (=> b!1580156 (= res!1078716 (= (select (arr!50986 _keys!610) (index!57224 lt!676977)) k0!768))))

(assert (=> b!1580156 (=> res!1078716 e!881519)))

(assert (=> b!1580156 (= e!881518 e!881519)))

(declare-fun b!1580157 () Bool)

(assert (=> b!1580157 (= e!881522 (Intermediate!13706 true (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(assert (= (and d!166645 c!147014) b!1580157))

(assert (= (and d!166645 (not c!147014)) b!1580151))

(assert (= (and b!1580151 c!147012) b!1580152))

(assert (= (and b!1580151 (not c!147012)) b!1580150))

(assert (= (and d!166645 c!147013) b!1580149))

(assert (= (and d!166645 (not c!147013)) b!1580154))

(assert (= (and b!1580154 res!1078718) b!1580156))

(assert (= (and b!1580156 (not res!1078716)) b!1580153))

(assert (= (and b!1580153 (not res!1078717)) b!1580155))

(declare-fun m!1452147 () Bool)

(assert (=> b!1580156 m!1452147))

(assert (=> b!1580153 m!1452147))

(assert (=> b!1580150 m!1452107))

(declare-fun m!1452149 () Bool)

(assert (=> b!1580150 m!1452149))

(assert (=> b!1580150 m!1452149))

(declare-fun m!1452151 () Bool)

(assert (=> b!1580150 m!1452151))

(assert (=> b!1580155 m!1452147))

(assert (=> d!166645 m!1452107))

(declare-fun m!1452153 () Bool)

(assert (=> d!166645 m!1452153))

(assert (=> d!166645 m!1452113))

(assert (=> b!1580106 d!166645))

(declare-fun d!166653 () Bool)

(declare-fun lt!676980 () (_ BitVec 32))

(assert (=> d!166653 (and (bvsge lt!676980 #b00000000000000000000000000000000) (bvslt lt!676980 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166653 (= lt!676980 (choose!52 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910))))

(assert (=> d!166653 (validMask!0 mask!910)))

(assert (=> d!166653 (= (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) lt!676980)))

(declare-fun bs!45616 () Bool)

(assert (= bs!45616 d!166653))

(declare-fun m!1452155 () Bool)

(assert (=> bs!45616 m!1452155))

(assert (=> bs!45616 m!1452113))

(assert (=> b!1580106 d!166653))

(declare-fun d!166655 () Bool)

(assert (=> d!166655 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136918 d!166655))

(declare-fun d!166659 () Bool)

(assert (=> d!166659 (= (array_inv!39941 _keys!610) (bvsge (size!51537 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136918 d!166659))

(declare-fun d!166663 () Bool)

(assert (=> d!166663 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1580104 d!166663))

(check-sat (not b!1580150) (not d!166645) (not d!166653))
(check-sat)
