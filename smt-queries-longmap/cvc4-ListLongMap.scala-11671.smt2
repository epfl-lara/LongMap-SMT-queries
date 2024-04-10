; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136526 () Bool)

(assert start!136526)

(declare-fun res!1077882 () Bool)

(declare-fun e!880042 () Bool)

(assert (=> start!136526 (=> (not res!1077882) (not e!880042))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136526 (= res!1077882 (validMask!0 mask!910))))

(assert (=> start!136526 e!880042))

(assert (=> start!136526 true))

(declare-datatypes ((array!105636 0))(
  ( (array!105637 (arr!50934 (Array (_ BitVec 32) (_ BitVec 64))) (size!51484 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105636)

(declare-fun array_inv!39661 (array!105636) Bool)

(assert (=> start!136526 (array_inv!39661 _keys!610)))

(declare-fun b!1577783 () Bool)

(declare-fun res!1077885 () Bool)

(assert (=> b!1577783 (=> (not res!1077885) (not e!880042))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1577783 (= res!1077885 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50934 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50934 _keys!610) ee!12) (select (arr!50934 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((SeekEntryResult!13763 0))(
  ( (MissingZero!13763 (index!57450 (_ BitVec 32))) (Found!13763 (index!57451 (_ BitVec 32))) (Intermediate!13763 (undefined!14575 Bool) (index!57452 (_ BitVec 32)) (x!142586 (_ BitVec 32))) (Undefined!13763) (MissingVacant!13763 (index!57453 (_ BitVec 32))) )
))
(declare-fun lt!676099 () SeekEntryResult!13763)

(declare-fun b!1577784 () Bool)

(assert (=> b!1577784 (= e!880042 (ite (and (is-Intermediate!13763 lt!676099) (undefined!14575 lt!676099)) (bvslt (x!142586 lt!676099) #b01111111111111111111111111111110) (or (not (is-Intermediate!13763 lt!676099)) (undefined!14575 lt!676099) (bvsge (x!142586 lt!676099) #b01111111111111111111111111111110) (bvslt (x!142586 lt!676099) #b00000000000000000000000000000000) (bvslt (x!142586 lt!676099) x!458) (and (not (= (select (arr!50934 _keys!610) (index!57452 lt!676099)) k!768)) (not (= (select (arr!50934 _keys!610) (index!57452 lt!676099)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50934 _keys!610) (index!57452 lt!676099)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105636 (_ BitVec 32)) SeekEntryResult!13763)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577784 (= lt!676099 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910))))

(declare-fun b!1577782 () Bool)

(declare-fun res!1077883 () Bool)

(assert (=> b!1577782 (=> (not res!1077883) (not e!880042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577782 (= res!1077883 (validKeyInArray!0 k!768))))

(declare-fun b!1577781 () Bool)

(declare-fun res!1077884 () Bool)

(assert (=> b!1577781 (=> (not res!1077884) (not e!880042))))

(assert (=> b!1577781 (= res!1077884 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51484 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(assert (= (and start!136526 res!1077882) b!1577781))

(assert (= (and b!1577781 res!1077884) b!1577782))

(assert (= (and b!1577782 res!1077883) b!1577783))

(assert (= (and b!1577783 res!1077885) b!1577784))

(declare-fun m!1449923 () Bool)

(assert (=> start!136526 m!1449923))

(declare-fun m!1449925 () Bool)

(assert (=> start!136526 m!1449925))

(declare-fun m!1449927 () Bool)

(assert (=> b!1577783 m!1449927))

(declare-fun m!1449929 () Bool)

(assert (=> b!1577784 m!1449929))

(declare-fun m!1449931 () Bool)

(assert (=> b!1577784 m!1449931))

(assert (=> b!1577784 m!1449931))

(declare-fun m!1449933 () Bool)

(assert (=> b!1577784 m!1449933))

(declare-fun m!1449935 () Bool)

(assert (=> b!1577782 m!1449935))

(push 1)

(assert (not start!136526))

(assert (not b!1577784))

(assert (not b!1577782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165971 () Bool)

(assert (=> d!165971 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136526 d!165971))

(declare-fun d!165977 () Bool)

(assert (=> d!165977 (= (array_inv!39661 _keys!610) (bvsge (size!51484 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136526 d!165977))

(declare-fun b!1577857 () Bool)

(declare-fun e!880088 () Bool)

(declare-fun lt!676122 () SeekEntryResult!13763)

(assert (=> b!1577857 (= e!880088 (bvsge (x!142586 lt!676122) #b01111111111111111111111111111110))))

(declare-fun b!1577858 () Bool)

(assert (=> b!1577858 (and (bvsge (index!57452 lt!676122) #b00000000000000000000000000000000) (bvslt (index!57452 lt!676122) (size!51484 _keys!610)))))

(declare-fun res!1077911 () Bool)

(assert (=> b!1577858 (= res!1077911 (= (select (arr!50934 _keys!610) (index!57452 lt!676122)) k!768))))

(declare-fun e!880087 () Bool)

(assert (=> b!1577858 (=> res!1077911 e!880087)))

(declare-fun e!880084 () Bool)

(assert (=> b!1577858 (= e!880084 e!880087)))

(declare-fun b!1577859 () Bool)

(declare-fun e!880086 () SeekEntryResult!13763)

(assert (=> b!1577859 (= e!880086 (Intermediate!13763 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun d!165979 () Bool)

(assert (=> d!165979 e!880088))

(declare-fun c!146259 () Bool)

(assert (=> d!165979 (= c!146259 (and (is-Intermediate!13763 lt!676122) (undefined!14575 lt!676122)))))

(assert (=> d!165979 (= lt!676122 e!880086)))

(declare-fun c!146257 () Bool)

(assert (=> d!165979 (= c!146257 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

(declare-fun lt!676123 () (_ BitVec 64))

(assert (=> d!165979 (= lt!676123 (select (arr!50934 _keys!610) (nextIndex!0 ee!12 x!458 mask!910)))))

(assert (=> d!165979 (validMask!0 mask!910)))

(assert (=> d!165979 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910) lt!676122)))

(declare-fun b!1577860 () Bool)

(assert (=> b!1577860 (= e!880088 e!880084)))

(declare-fun res!1077912 () Bool)

(assert (=> b!1577860 (= res!1077912 (and (is-Intermediate!13763 lt!676122) (not (undefined!14575 lt!676122)) (bvslt (x!142586 lt!676122) #b01111111111111111111111111111110) (bvsge (x!142586 lt!676122) #b00000000000000000000000000000000) (bvsge (x!142586 lt!676122) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577860 (=> (not res!1077912) (not e!880084))))

(declare-fun b!1577861 () Bool)

(assert (=> b!1577861 (and (bvsge (index!57452 lt!676122) #b00000000000000000000000000000000) (bvslt (index!57452 lt!676122) (size!51484 _keys!610)))))

(assert (=> b!1577861 (= e!880087 (= (select (arr!50934 _keys!610) (index!57452 lt!676122)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577862 () Bool)

(declare-fun e!880085 () SeekEntryResult!13763)

(assert (=> b!1577862 (= e!880085 (Intermediate!13763 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577863 () Bool)

(assert (=> b!1577863 (= e!880086 e!880085)))

(declare-fun c!146258 () Bool)

(assert (=> b!1577863 (= c!146258 (or (= lt!676123 k!768) (= (bvadd lt!676123 lt!676123) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577864 () Bool)

(assert (=> b!1577864 (and (bvsge (index!57452 lt!676122) #b00000000000000000000000000000000) (bvslt (index!57452 lt!676122) (size!51484 _keys!610)))))

(declare-fun res!1077910 () Bool)

(assert (=> b!1577864 (= res!1077910 (= (select (arr!50934 _keys!610) (index!57452 lt!676122)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577864 (=> res!1077910 e!880087)))

(declare-fun b!1577865 () Bool)

(assert (=> b!1577865 (= e!880085 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k!768 _keys!610 mask!910))))

(assert (= (and d!165979 c!146257) b!1577859))

(assert (= (and d!165979 (not c!146257)) b!1577863))

(assert (= (and b!1577863 c!146258) b!1577862))

(assert (= (and b!1577863 (not c!146258)) b!1577865))

(assert (= (and d!165979 c!146259) b!1577857))

(assert (= (and d!165979 (not c!146259)) b!1577860))

(assert (= (and b!1577860 res!1077912) b!1577858))

(assert (= (and b!1577858 (not res!1077911)) b!1577864))

(assert (= (and b!1577864 (not res!1077910)) b!1577861))

(declare-fun m!1449957 () Bool)

(assert (=> b!1577864 m!1449957))

(assert (=> b!1577861 m!1449957))

(assert (=> b!1577858 m!1449957))

(assert (=> d!165979 m!1449931))

(declare-fun m!1449959 () Bool)

(assert (=> d!165979 m!1449959))

(assert (=> d!165979 m!1449923))

(assert (=> b!1577865 m!1449931))

(declare-fun m!1449961 () Bool)

(assert (=> b!1577865 m!1449961))

(assert (=> b!1577865 m!1449961))

(declare-fun m!1449963 () Bool)

(assert (=> b!1577865 m!1449963))

(assert (=> b!1577784 d!165979))

(declare-fun d!165985 () Bool)

(declare-fun lt!676126 () (_ BitVec 32))

(assert (=> d!165985 (and (bvsge lt!676126 #b00000000000000000000000000000000) (bvslt lt!676126 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165985 (= lt!676126 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165985 (validMask!0 mask!910)))

(assert (=> d!165985 (= (nextIndex!0 ee!12 x!458 mask!910) lt!676126)))

(declare-fun bs!45603 () Bool)

(assert (= bs!45603 d!165985))

(declare-fun m!1449965 () Bool)

(assert (=> bs!45603 m!1449965))

(assert (=> bs!45603 m!1449923))

(assert (=> b!1577784 d!165985))

(declare-fun d!165987 () Bool)

(assert (=> d!165987 (= (validKeyInArray!0 k!768) (and (not (= k!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577782 d!165987))

(push 1)

