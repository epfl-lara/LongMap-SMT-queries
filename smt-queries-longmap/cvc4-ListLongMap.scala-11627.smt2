; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135646 () Bool)

(assert start!135646)

(declare-fun res!1075965 () Bool)

(declare-fun e!878216 () Bool)

(assert (=> start!135646 (=> (not res!1075965) (not e!878216))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135646 (= res!1075965 (validMask!0 mask!898))))

(assert (=> start!135646 e!878216))

(assert (=> start!135646 true))

(declare-datatypes ((array!105313 0))(
  ( (array!105314 (arr!50802 (Array (_ BitVec 32) (_ BitVec 64))) (size!51352 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105313)

(declare-fun array_inv!39529 (array!105313) Bool)

(assert (=> start!135646 (array_inv!39529 _keys!605)))

(declare-fun b!1574668 () Bool)

(declare-fun res!1075964 () Bool)

(assert (=> b!1574668 (=> (not res!1075964) (not e!878216))))

(assert (=> b!1574668 (= res!1075964 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51352 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574669 () Bool)

(declare-fun res!1075963 () Bool)

(assert (=> b!1574669 (=> (not res!1075963) (not e!878216))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574669 (= res!1075963 (validKeyInArray!0 k!761))))

(declare-datatypes ((SeekEntryResult!13667 0))(
  ( (MissingZero!13667 (index!57066 (_ BitVec 32))) (Found!13667 (index!57067 (_ BitVec 32))) (Intermediate!13667 (undefined!14479 Bool) (index!57068 (_ BitVec 32)) (x!142009 (_ BitVec 32))) (Undefined!13667) (MissingVacant!13667 (index!57069 (_ BitVec 32))) )
))
(declare-fun lt!674893 () SeekEntryResult!13667)

(declare-fun b!1574670 () Bool)

(assert (=> b!1574670 (= e!878216 (and (is-Intermediate!13667 lt!674893) (not (undefined!14479 lt!674893)) (not (= (select (arr!50802 _keys!605) (index!57068 lt!674893)) k!761)) (not (= (select (arr!50802 _keys!605) (index!57068 lt!674893)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50802 _keys!605) (index!57068 lt!674893)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57068 lt!674893) #b00000000000000000000000000000000) (bvslt (index!57068 lt!674893) (bvadd #b00000000000000000000000000000001 mask!898)) (or (bvsgt (x!142009 lt!674893) #b01111111111111111111111111111110) (bvslt (x!142009 lt!674893) #b00000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105313 (_ BitVec 32)) SeekEntryResult!13667)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574670 (= lt!674893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135646 res!1075965) b!1574668))

(assert (= (and b!1574668 res!1075964) b!1574669))

(assert (= (and b!1574669 res!1075963) b!1574670))

(declare-fun m!1447909 () Bool)

(assert (=> start!135646 m!1447909))

(declare-fun m!1447911 () Bool)

(assert (=> start!135646 m!1447911))

(declare-fun m!1447913 () Bool)

(assert (=> b!1574669 m!1447913))

(declare-fun m!1447915 () Bool)

(assert (=> b!1574670 m!1447915))

(declare-fun m!1447917 () Bool)

(assert (=> b!1574670 m!1447917))

(assert (=> b!1574670 m!1447917))

(declare-fun m!1447919 () Bool)

(assert (=> b!1574670 m!1447919))

(push 1)

(assert (not b!1574669))

(assert (not b!1574670))

(assert (not start!135646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165261 () Bool)

(assert (=> d!165261 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574669 d!165261))

(declare-fun b!1574728 () Bool)

(declare-fun e!878249 () SeekEntryResult!13667)

(assert (=> b!1574728 (= e!878249 (Intermediate!13667 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun d!165263 () Bool)

(declare-fun e!878251 () Bool)

(assert (=> d!165263 e!878251))

(declare-fun c!145633 () Bool)

(declare-fun lt!674915 () SeekEntryResult!13667)

(assert (=> d!165263 (= c!145633 (and (is-Intermediate!13667 lt!674915) (undefined!14479 lt!674915)))))

(assert (=> d!165263 (= lt!674915 e!878249)))

(declare-fun c!145635 () Bool)

(assert (=> d!165263 (= c!145635 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674914 () (_ BitVec 64))

(assert (=> d!165263 (= lt!674914 (select (arr!50802 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165263 (validMask!0 mask!898)))

(assert (=> d!165263 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!674915)))

(declare-fun b!1574729 () Bool)

(declare-fun e!878248 () SeekEntryResult!13667)

(assert (=> b!1574729 (= e!878249 e!878248)))

(declare-fun c!145634 () Bool)

(assert (=> b!1574729 (= c!145634 (or (= lt!674914 k!761) (= (bvadd lt!674914 lt!674914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574730 () Bool)

(declare-fun e!878252 () Bool)

(assert (=> b!1574730 (= e!878251 e!878252)))

(declare-fun res!1075984 () Bool)

(assert (=> b!1574730 (= res!1075984 (and (is-Intermediate!13667 lt!674915) (not (undefined!14479 lt!674915)) (bvslt (x!142009 lt!674915) #b01111111111111111111111111111110) (bvsge (x!142009 lt!674915) #b00000000000000000000000000000000) (bvsge (x!142009 lt!674915) #b00000000000000000000000000000000)))))

(assert (=> b!1574730 (=> (not res!1075984) (not e!878252))))

(declare-fun b!1574731 () Bool)

(assert (=> b!1574731 (and (bvsge (index!57068 lt!674915) #b00000000000000000000000000000000) (bvslt (index!57068 lt!674915) (size!51352 _keys!605)))))

(declare-fun e!878250 () Bool)

(assert (=> b!1574731 (= e!878250 (= (select (arr!50802 _keys!605) (index!57068 lt!674915)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1574732 () Bool)

(assert (=> b!1574732 (and (bvsge (index!57068 lt!674915) #b00000000000000000000000000000000) (bvslt (index!57068 lt!674915) (size!51352 _keys!605)))))

(declare-fun res!1075982 () Bool)

(assert (=> b!1574732 (= res!1075982 (= (select (arr!50802 _keys!605) (index!57068 lt!674915)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574732 (=> res!1075982 e!878250)))

(declare-fun b!1574733 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574733 (= e!878248 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1574734 () Bool)

(assert (=> b!1574734 (and (bvsge (index!57068 lt!674915) #b00000000000000000000000000000000) (bvslt (index!57068 lt!674915) (size!51352 _keys!605)))))

(declare-fun res!1075983 () Bool)

(assert (=> b!1574734 (= res!1075983 (= (select (arr!50802 _keys!605) (index!57068 lt!674915)) k!761))))

(assert (=> b!1574734 (=> res!1075983 e!878250)))

(assert (=> b!1574734 (= e!878252 e!878250)))

(declare-fun b!1574735 () Bool)

(assert (=> b!1574735 (= e!878248 (Intermediate!13667 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574736 () Bool)

(assert (=> b!1574736 (= e!878251 (bvsge (x!142009 lt!674915) #b01111111111111111111111111111110))))

(assert (= (and d!165263 c!145635) b!1574728))

(assert (= (and d!165263 (not c!145635)) b!1574729))

(assert (= (and b!1574729 c!145634) b!1574735))

(assert (= (and b!1574729 (not c!145634)) b!1574733))

(assert (= (and d!165263 c!145633) b!1574736))

(assert (= (and d!165263 (not c!145633)) b!1574730))

(assert (= (and b!1574730 res!1075984) b!1574734))

(assert (= (and b!1574734 (not res!1075983)) b!1574732))

(assert (= (and b!1574732 (not res!1075982)) b!1574731))

(declare-fun m!1447929 () Bool)

(assert (=> b!1574731 m!1447929))

(assert (=> b!1574734 m!1447929))

(assert (=> d!165263 m!1447917))

(declare-fun m!1447931 () Bool)

(assert (=> d!165263 m!1447931))

(assert (=> d!165263 m!1447909))

(assert (=> b!1574733 m!1447917))

(declare-fun m!1447933 () Bool)

(assert (=> b!1574733 m!1447933))

(assert (=> b!1574733 m!1447933))

(declare-fun m!1447935 () Bool)

(assert (=> b!1574733 m!1447935))

(assert (=> b!1574732 m!1447929))

(assert (=> b!1574670 d!165263))

(declare-fun d!165269 () Bool)

(declare-fun lt!674923 () (_ BitVec 32))

(declare-fun lt!674922 () (_ BitVec 32))

(assert (=> d!165269 (= lt!674923 (bvmul (bvxor lt!674922 (bvlshr lt!674922 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165269 (= lt!674922 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165269 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1075991 (let ((h!38253 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142014 (bvmul (bvxor h!38253 (bvlshr h!38253 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142014 (bvlshr x!142014 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1075991 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1075991 #b00000000000000000000000000000000))))))

(assert (=> d!165269 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!674923 (bvlshr lt!674923 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1574670 d!165269))

(declare-fun d!165273 () Bool)

(assert (=> d!165273 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135646 d!165273))

(declare-fun d!165279 () Bool)

(assert (=> d!165279 (= (array_inv!39529 _keys!605) (bvsge (size!51352 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135646 d!165279))

(push 1)

(assert (not b!1574733))

(assert (not d!165263))

(check-sat)

(pop 1)

(push 1)

(check-sat)

