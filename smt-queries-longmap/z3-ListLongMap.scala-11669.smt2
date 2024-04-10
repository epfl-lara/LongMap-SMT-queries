; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136452 () Bool)

(assert start!136452)

(declare-fun b!1577536 () Bool)

(declare-fun res!1077747 () Bool)

(declare-fun e!879910 () Bool)

(assert (=> b!1577536 (=> (not res!1077747) (not e!879910))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577536 (= res!1077747 (validKeyInArray!0 k0!768))))

(declare-datatypes ((array!105616 0))(
  ( (array!105617 (arr!50927 (Array (_ BitVec 32) (_ BitVec 64))) (size!51477 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105616)

(declare-datatypes ((SeekEntryResult!13756 0))(
  ( (MissingZero!13756 (index!57422 (_ BitVec 32))) (Found!13756 (index!57423 (_ BitVec 32))) (Intermediate!13756 (undefined!14568 Bool) (index!57424 (_ BitVec 32)) (x!142551 (_ BitVec 32))) (Undefined!13756) (MissingVacant!13756 (index!57425 (_ BitVec 32))) )
))
(declare-fun lt!676024 () SeekEntryResult!13756)

(declare-fun x!458 () (_ BitVec 32))

(declare-fun b!1577538 () Bool)

(get-info :version)

(assert (=> b!1577538 (= e!879910 (and ((_ is Intermediate!13756) lt!676024) (not (undefined!14568 lt!676024)) (bvslt (x!142551 lt!676024) #b01111111111111111111111111111110) (bvsge (x!142551 lt!676024) #b00000000000000000000000000000000) (bvsge (x!142551 lt!676024) x!458) (not (= (select (arr!50927 _keys!610) (index!57424 lt!676024)) k0!768)) (or (bvslt (index!57424 lt!676024) #b00000000000000000000000000000000) (bvsge (index!57424 lt!676024) (size!51477 _keys!610)))))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105616 (_ BitVec 32)) SeekEntryResult!13756)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577538 (= lt!676024 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1577535 () Bool)

(declare-fun res!1077745 () Bool)

(assert (=> b!1577535 (=> (not res!1077745) (not e!879910))))

(assert (=> b!1577535 (= res!1077745 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51477 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577537 () Bool)

(declare-fun res!1077744 () Bool)

(assert (=> b!1577537 (=> (not res!1077744) (not e!879910))))

(assert (=> b!1577537 (= res!1077744 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50927 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50927 _keys!610) ee!12) (select (arr!50927 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1077746 () Bool)

(assert (=> start!136452 (=> (not res!1077746) (not e!879910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136452 (= res!1077746 (validMask!0 mask!910))))

(assert (=> start!136452 e!879910))

(assert (=> start!136452 true))

(declare-fun array_inv!39654 (array!105616) Bool)

(assert (=> start!136452 (array_inv!39654 _keys!610)))

(assert (= (and start!136452 res!1077746) b!1577535))

(assert (= (and b!1577535 res!1077745) b!1577536))

(assert (= (and b!1577536 res!1077747) b!1577537))

(assert (= (and b!1577537 res!1077744) b!1577538))

(declare-fun m!1449765 () Bool)

(assert (=> b!1577536 m!1449765))

(declare-fun m!1449767 () Bool)

(assert (=> b!1577538 m!1449767))

(declare-fun m!1449769 () Bool)

(assert (=> b!1577538 m!1449769))

(assert (=> b!1577538 m!1449769))

(declare-fun m!1449771 () Bool)

(assert (=> b!1577538 m!1449771))

(declare-fun m!1449773 () Bool)

(assert (=> b!1577537 m!1449773))

(declare-fun m!1449775 () Bool)

(assert (=> start!136452 m!1449775))

(declare-fun m!1449777 () Bool)

(assert (=> start!136452 m!1449777))

(check-sat (not b!1577538) (not b!1577536) (not start!136452))
(check-sat)
(get-model)

(declare-fun b!1577569 () Bool)

(declare-fun lt!676033 () SeekEntryResult!13756)

(assert (=> b!1577569 (and (bvsge (index!57424 lt!676033) #b00000000000000000000000000000000) (bvslt (index!57424 lt!676033) (size!51477 _keys!610)))))

(declare-fun res!1077766 () Bool)

(assert (=> b!1577569 (= res!1077766 (= (select (arr!50927 _keys!610) (index!57424 lt!676033)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879931 () Bool)

(assert (=> b!1577569 (=> res!1077766 e!879931)))

(declare-fun b!1577570 () Bool)

(assert (=> b!1577570 (and (bvsge (index!57424 lt!676033) #b00000000000000000000000000000000) (bvslt (index!57424 lt!676033) (size!51477 _keys!610)))))

(assert (=> b!1577570 (= e!879931 (= (select (arr!50927 _keys!610) (index!57424 lt!676033)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577571 () Bool)

(declare-fun e!879928 () Bool)

(declare-fun e!879929 () Bool)

(assert (=> b!1577571 (= e!879928 e!879929)))

(declare-fun res!1077767 () Bool)

(assert (=> b!1577571 (= res!1077767 (and ((_ is Intermediate!13756) lt!676033) (not (undefined!14568 lt!676033)) (bvslt (x!142551 lt!676033) #b01111111111111111111111111111110) (bvsge (x!142551 lt!676033) #b00000000000000000000000000000000) (bvsge (x!142551 lt!676033) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577571 (=> (not res!1077767) (not e!879929))))

(declare-fun e!879930 () SeekEntryResult!13756)

(declare-fun b!1577572 () Bool)

(assert (=> b!1577572 (= e!879930 (Intermediate!13756 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577573 () Bool)

(assert (=> b!1577573 (= e!879928 (bvsge (x!142551 lt!676033) #b01111111111111111111111111111110))))

(declare-fun b!1577574 () Bool)

(declare-fun e!879932 () SeekEntryResult!13756)

(assert (=> b!1577574 (= e!879930 e!879932)))

(declare-fun c!146187 () Bool)

(declare-fun lt!676032 () (_ BitVec 64))

(assert (=> b!1577574 (= c!146187 (or (= lt!676032 k0!768) (= (bvadd lt!676032 lt!676032) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577576 () Bool)

(assert (=> b!1577576 (= e!879932 (Intermediate!13756 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577577 () Bool)

(assert (=> b!1577577 (= e!879932 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k0!768 _keys!610 mask!910))))

(declare-fun b!1577575 () Bool)

(assert (=> b!1577575 (and (bvsge (index!57424 lt!676033) #b00000000000000000000000000000000) (bvslt (index!57424 lt!676033) (size!51477 _keys!610)))))

(declare-fun res!1077768 () Bool)

(assert (=> b!1577575 (= res!1077768 (= (select (arr!50927 _keys!610) (index!57424 lt!676033)) k0!768))))

(assert (=> b!1577575 (=> res!1077768 e!879931)))

(assert (=> b!1577575 (= e!879929 e!879931)))

(declare-fun d!165895 () Bool)

(assert (=> d!165895 e!879928))

(declare-fun c!146185 () Bool)

(assert (=> d!165895 (= c!146185 (and ((_ is Intermediate!13756) lt!676033) (undefined!14568 lt!676033)))))

(assert (=> d!165895 (= lt!676033 e!879930)))

(declare-fun c!146186 () Bool)

(assert (=> d!165895 (= c!146186 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(assert (=> d!165895 (= lt!676032 (select (arr!50927 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165895 (validMask!0 mask!910)))

(assert (=> d!165895 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k0!768 _keys!610 mask!910) lt!676033)))

(assert (= (and d!165895 c!146186) b!1577572))

(assert (= (and d!165895 (not c!146186)) b!1577574))

(assert (= (and b!1577574 c!146187) b!1577576))

(assert (= (and b!1577574 (not c!146187)) b!1577577))

(assert (= (and d!165895 c!146185) b!1577573))

(assert (= (and d!165895 (not c!146185)) b!1577571))

(assert (= (and b!1577571 res!1077767) b!1577575))

(assert (= (and b!1577575 (not res!1077768)) b!1577569))

(assert (= (and b!1577569 (not res!1077766)) b!1577570))

(declare-fun m!1449793 () Bool)

(assert (=> b!1577569 m!1449793))

(assert (=> d!165895 m!1449769))

(declare-fun m!1449795 () Bool)

(assert (=> d!165895 m!1449795))

(assert (=> d!165895 m!1449775))

(assert (=> b!1577575 m!1449793))

(assert (=> b!1577570 m!1449793))

(assert (=> b!1577577 m!1449769))

(declare-fun m!1449797 () Bool)

(assert (=> b!1577577 m!1449797))

(assert (=> b!1577577 m!1449797))

(declare-fun m!1449799 () Bool)

(assert (=> b!1577577 m!1449799))

(assert (=> b!1577538 d!165895))

(declare-fun d!165901 () Bool)

(declare-fun lt!676036 () (_ BitVec 32))

(assert (=> d!165901 (and (bvsge lt!676036 #b00000000000000000000000000000000) (bvslt lt!676036 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165901 (= lt!676036 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165901 (validMask!0 mask!910)))

(assert (=> d!165901 (= (nextIndex!0 ee!12 x!458 mask!910) lt!676036)))

(declare-fun bs!45589 () Bool)

(assert (= bs!45589 d!165901))

(declare-fun m!1449801 () Bool)

(assert (=> bs!45589 m!1449801))

(assert (=> bs!45589 m!1449775))

(assert (=> b!1577538 d!165901))

(declare-fun d!165907 () Bool)

(assert (=> d!165907 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577536 d!165907))

(declare-fun d!165909 () Bool)

(assert (=> d!165909 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136452 d!165909))

(declare-fun d!165913 () Bool)

(assert (=> d!165913 (= (array_inv!39654 _keys!610) (bvsge (size!51477 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136452 d!165913))

(check-sat (not b!1577577) (not d!165895) (not d!165901))
(check-sat)
