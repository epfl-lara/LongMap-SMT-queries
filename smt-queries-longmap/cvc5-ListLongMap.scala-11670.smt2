; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136486 () Bool)

(assert start!136486)

(declare-fun res!1077797 () Bool)

(declare-fun e!879968 () Bool)

(assert (=> start!136486 (=> (not res!1077797) (not e!879968))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136486 (= res!1077797 (validMask!0 mask!910))))

(assert (=> start!136486 e!879968))

(assert (=> start!136486 true))

(declare-datatypes ((array!105623 0))(
  ( (array!105624 (arr!50929 (Array (_ BitVec 32) (_ BitVec 64))) (size!51479 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105623)

(declare-fun array_inv!39656 (array!105623) Bool)

(assert (=> start!136486 (array_inv!39656 _keys!610)))

(declare-fun b!1577640 () Bool)

(declare-fun res!1077798 () Bool)

(assert (=> b!1577640 (=> (not res!1077798) (not e!879968))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577640 (= res!1077798 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51479 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577642 () Bool)

(declare-fun res!1077796 () Bool)

(assert (=> b!1577642 (=> (not res!1077796) (not e!879968))))

(declare-fun k!768 () (_ BitVec 64))

(assert (=> b!1577642 (= res!1077796 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50929 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50929 _keys!610) ee!12) (select (arr!50929 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((SeekEntryResult!13758 0))(
  ( (MissingZero!13758 (index!57430 (_ BitVec 32))) (Found!13758 (index!57431 (_ BitVec 32))) (Intermediate!13758 (undefined!14570 Bool) (index!57432 (_ BitVec 32)) (x!142567 (_ BitVec 32))) (Undefined!13758) (MissingVacant!13758 (index!57433 (_ BitVec 32))) )
))
(declare-fun lt!676057 () SeekEntryResult!13758)

(declare-fun b!1577643 () Bool)

(assert (=> b!1577643 (= e!879968 (and (is-Intermediate!13758 lt!676057) (not (undefined!14570 lt!676057)) (bvslt (x!142567 lt!676057) #b01111111111111111111111111111110) (bvsge (x!142567 lt!676057) #b00000000000000000000000000000000) (bvsge (x!142567 lt!676057) x!458) (not (= (select (arr!50929 _keys!610) (index!57432 lt!676057)) k!768)) (not (= (select (arr!50929 _keys!610) (index!57432 lt!676057)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!57432 lt!676057) #b00000000000000000000000000000000) (bvsge (index!57432 lt!676057) (size!51479 _keys!610)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105623 (_ BitVec 32)) SeekEntryResult!13758)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577643 (= lt!676057 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910))))

(declare-fun b!1577641 () Bool)

(declare-fun res!1077795 () Bool)

(assert (=> b!1577641 (=> (not res!1077795) (not e!879968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577641 (= res!1077795 (validKeyInArray!0 k!768))))

(assert (= (and start!136486 res!1077797) b!1577640))

(assert (= (and b!1577640 res!1077798) b!1577641))

(assert (= (and b!1577641 res!1077795) b!1577642))

(assert (= (and b!1577642 res!1077796) b!1577643))

(declare-fun m!1449823 () Bool)

(assert (=> start!136486 m!1449823))

(declare-fun m!1449825 () Bool)

(assert (=> start!136486 m!1449825))

(declare-fun m!1449827 () Bool)

(assert (=> b!1577642 m!1449827))

(declare-fun m!1449829 () Bool)

(assert (=> b!1577643 m!1449829))

(declare-fun m!1449831 () Bool)

(assert (=> b!1577643 m!1449831))

(assert (=> b!1577643 m!1449831))

(declare-fun m!1449833 () Bool)

(assert (=> b!1577643 m!1449833))

(declare-fun m!1449835 () Bool)

(assert (=> b!1577641 m!1449835))

(push 1)

(assert (not start!136486))

(assert (not b!1577643))

(assert (not b!1577641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165931 () Bool)

(assert (=> d!165931 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136486 d!165931))

(declare-fun d!165933 () Bool)

(assert (=> d!165933 (= (array_inv!39656 _keys!610) (bvsge (size!51479 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136486 d!165933))

(declare-fun d!165935 () Bool)

(declare-fun e!880020 () Bool)

(assert (=> d!165935 e!880020))

(declare-fun c!146229 () Bool)

(declare-fun lt!676081 () SeekEntryResult!13758)

(assert (=> d!165935 (= c!146229 (and (is-Intermediate!13758 lt!676081) (undefined!14570 lt!676081)))))

(declare-fun e!880017 () SeekEntryResult!13758)

(assert (=> d!165935 (= lt!676081 e!880017)))

(declare-fun c!146228 () Bool)

(assert (=> d!165935 (= c!146228 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(declare-fun lt!676082 () (_ BitVec 64))

(assert (=> d!165935 (= lt!676082 (select (arr!50929 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165935 (validMask!0 mask!910)))

(assert (=> d!165935 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910) lt!676081)))

(declare-fun b!1577731 () Bool)

(assert (=> b!1577731 (and (bvsge (index!57432 lt!676081) #b00000000000000000000000000000000) (bvslt (index!57432 lt!676081) (size!51479 _keys!610)))))

(declare-fun res!1077844 () Bool)

(assert (=> b!1577731 (= res!1077844 (= (select (arr!50929 _keys!610) (index!57432 lt!676081)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!880019 () Bool)

(assert (=> b!1577731 (=> res!1077844 e!880019)))

(declare-fun e!880016 () SeekEntryResult!13758)

(declare-fun b!1577732 () Bool)

(assert (=> b!1577732 (= e!880016 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k!768 _keys!610 mask!910))))

(declare-fun b!1577733 () Bool)

(declare-fun e!880018 () Bool)

(assert (=> b!1577733 (= e!880020 e!880018)))

(declare-fun res!1077845 () Bool)

(assert (=> b!1577733 (= res!1077845 (and (is-Intermediate!13758 lt!676081) (not (undefined!14570 lt!676081)) (bvslt (x!142567 lt!676081) #b01111111111111111111111111111110) (bvsge (x!142567 lt!676081) #b00000000000000000000000000000000) (bvsge (x!142567 lt!676081) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577733 (=> (not res!1077845) (not e!880018))))

(declare-fun b!1577734 () Bool)

(assert (=> b!1577734 (= e!880017 (Intermediate!13758 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577735 () Bool)

(assert (=> b!1577735 (= e!880016 (Intermediate!13758 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577736 () Bool)

(assert (=> b!1577736 (= e!880020 (bvsge (x!142567 lt!676081) #b01111111111111111111111111111110))))

(declare-fun b!1577737 () Bool)

(assert (=> b!1577737 (and (bvsge (index!57432 lt!676081) #b00000000000000000000000000000000) (bvslt (index!57432 lt!676081) (size!51479 _keys!610)))))

(assert (=> b!1577737 (= e!880019 (= (select (arr!50929 _keys!610) (index!57432 lt!676081)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577738 () Bool)

(assert (=> b!1577738 (= e!880017 e!880016)))

(declare-fun c!146227 () Bool)

(assert (=> b!1577738 (= c!146227 (or (= lt!676082 k!768) (= (bvadd lt!676082 lt!676082) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577739 () Bool)

(assert (=> b!1577739 (and (bvsge (index!57432 lt!676081) #b00000000000000000000000000000000) (bvslt (index!57432 lt!676081) (size!51479 _keys!610)))))

(declare-fun res!1077846 () Bool)

(assert (=> b!1577739 (= res!1077846 (= (select (arr!50929 _keys!610) (index!57432 lt!676081)) k!768))))

(assert (=> b!1577739 (=> res!1077846 e!880019)))

(assert (=> b!1577739 (= e!880018 e!880019)))

(assert (= (and d!165935 c!146228) b!1577734))

(assert (= (and d!165935 (not c!146228)) b!1577738))

(assert (= (and b!1577738 c!146227) b!1577735))

(assert (= (and b!1577738 (not c!146227)) b!1577732))

(assert (= (and d!165935 c!146229) b!1577736))

(assert (= (and d!165935 (not c!146229)) b!1577733))

(assert (= (and b!1577733 res!1077845) b!1577739))

(assert (= (and b!1577739 (not res!1077846)) b!1577731))

(assert (= (and b!1577731 (not res!1077844)) b!1577737))

(assert (=> b!1577732 m!1449831))

(declare-fun m!1449875 () Bool)

(assert (=> b!1577732 m!1449875))

(assert (=> b!1577732 m!1449875))

(declare-fun m!1449877 () Bool)

(assert (=> b!1577732 m!1449877))

(assert (=> d!165935 m!1449831))

(declare-fun m!1449879 () Bool)

(assert (=> d!165935 m!1449879))

(assert (=> d!165935 m!1449823))

(declare-fun m!1449881 () Bool)

(assert (=> b!1577739 m!1449881))

(assert (=> b!1577737 m!1449881))

(assert (=> b!1577731 m!1449881))

(assert (=> b!1577643 d!165935))

(declare-fun d!165945 () Bool)

(declare-fun lt!676087 () (_ BitVec 32))

(assert (=> d!165945 (and (bvsge lt!676087 #b00000000000000000000000000000000) (bvslt lt!676087 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165945 (= lt!676087 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165945 (validMask!0 mask!910)))

(assert (=> d!165945 (= (nextIndex!0 ee!12 x!458 mask!910) lt!676087)))

(declare-fun bs!45596 () Bool)

(assert (= bs!45596 d!165945))

(declare-fun m!1449891 () Bool)

(assert (=> bs!45596 m!1449891))

(assert (=> bs!45596 m!1449823))

(assert (=> b!1577643 d!165945))

(declare-fun d!165949 () Bool)

(assert (=> d!165949 (= (validKeyInArray!0 k!768) (and (not (= k!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577641 d!165949))

(push 1)

(assert (not d!165935))

(assert (not b!1577732))

(assert (not d!165945))

(check-sat)

(pop 1)

(push 1)

(check-sat)

