; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135976 () Bool)

(assert start!135976)

(declare-fun b!1575783 () Bool)

(declare-fun res!1076722 () Bool)

(declare-fun e!878898 () Bool)

(assert (=> b!1575783 (=> (not res!1076722) (not e!878898))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-datatypes ((array!105454 0))(
  ( (array!105455 (arr!50862 (Array (_ BitVec 32) (_ BitVec 64))) (size!51412 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105454)

(assert (=> b!1575783 (= res!1076722 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51412 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575786 () Bool)

(declare-fun e!878899 () Bool)

(declare-datatypes ((SeekEntryResult!13727 0))(
  ( (MissingZero!13727 (index!57306 (_ BitVec 32))) (Found!13727 (index!57307 (_ BitVec 32))) (Intermediate!13727 (undefined!14539 Bool) (index!57308 (_ BitVec 32)) (x!142271 (_ BitVec 32))) (Undefined!13727) (MissingVacant!13727 (index!57309 (_ BitVec 32))) )
))
(declare-fun lt!675334 () SeekEntryResult!13727)

(assert (=> b!1575786 (= e!878899 (and (not (is-Undefined!13727 lt!675334)) (is-Found!13727 lt!675334) (or (bvslt (index!57307 lt!675334) #b00000000000000000000000000000000) (bvsge (index!57307 lt!675334) (size!51412 _keys!605)))))))

(declare-fun lt!675333 () SeekEntryResult!13727)

(declare-fun k!761 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105454 (_ BitVec 32)) SeekEntryResult!13727)

(assert (=> b!1575786 (= lt!675334 (seekKeyOrZeroReturnVacant!0 (x!142271 lt!675333) (index!57308 lt!675333) (index!57308 lt!675333) k!761 _keys!605 mask!898))))

(declare-fun b!1575785 () Bool)

(assert (=> b!1575785 (= e!878898 e!878899)))

(declare-fun res!1076724 () Bool)

(assert (=> b!1575785 (=> (not res!1076724) (not e!878899))))

(assert (=> b!1575785 (= res!1076724 (and (not (undefined!14539 lt!675333)) (is-Intermediate!13727 lt!675333) (not (= (select (arr!50862 _keys!605) (index!57308 lt!675333)) k!761)) (not (= (select (arr!50862 _keys!605) (index!57308 lt!675333)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50862 _keys!605) (index!57308 lt!675333)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57308 lt!675333) #b00000000000000000000000000000000) (bvslt (index!57308 lt!675333) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105454 (_ BitVec 32)) SeekEntryResult!13727)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575785 (= lt!675333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun res!1076721 () Bool)

(assert (=> start!135976 (=> (not res!1076721) (not e!878898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135976 (= res!1076721 (validMask!0 mask!898))))

(assert (=> start!135976 e!878898))

(assert (=> start!135976 true))

(declare-fun array_inv!39589 (array!105454) Bool)

(assert (=> start!135976 (array_inv!39589 _keys!605)))

(declare-fun b!1575784 () Bool)

(declare-fun res!1076723 () Bool)

(assert (=> b!1575784 (=> (not res!1076723) (not e!878898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575784 (= res!1076723 (validKeyInArray!0 k!761))))

(assert (= (and start!135976 res!1076721) b!1575783))

(assert (= (and b!1575783 res!1076722) b!1575784))

(assert (= (and b!1575784 res!1076723) b!1575785))

(assert (= (and b!1575785 res!1076724) b!1575786))

(declare-fun m!1448717 () Bool)

(assert (=> b!1575786 m!1448717))

(declare-fun m!1448719 () Bool)

(assert (=> b!1575785 m!1448719))

(declare-fun m!1448721 () Bool)

(assert (=> b!1575785 m!1448721))

(assert (=> b!1575785 m!1448721))

(declare-fun m!1448723 () Bool)

(assert (=> b!1575785 m!1448723))

(declare-fun m!1448725 () Bool)

(assert (=> start!135976 m!1448725))

(declare-fun m!1448727 () Bool)

(assert (=> start!135976 m!1448727))

(declare-fun m!1448729 () Bool)

(assert (=> b!1575784 m!1448729))

(push 1)

(assert (not b!1575784))

(assert (not b!1575786))

(assert (not start!135976))

(assert (not b!1575785))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165513 () Bool)

(assert (=> d!165513 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575784 d!165513))

(declare-fun d!165515 () Bool)

(declare-fun lt!675352 () SeekEntryResult!13727)

(assert (=> d!165515 (and (or (is-Undefined!13727 lt!675352) (not (is-Found!13727 lt!675352)) (and (bvsge (index!57307 lt!675352) #b00000000000000000000000000000000) (bvslt (index!57307 lt!675352) (size!51412 _keys!605)))) (or (is-Undefined!13727 lt!675352) (is-Found!13727 lt!675352) (not (is-MissingVacant!13727 lt!675352)) (not (= (index!57309 lt!675352) (index!57308 lt!675333))) (and (bvsge (index!57309 lt!675352) #b00000000000000000000000000000000) (bvslt (index!57309 lt!675352) (size!51412 _keys!605)))) (or (is-Undefined!13727 lt!675352) (ite (is-Found!13727 lt!675352) (= (select (arr!50862 _keys!605) (index!57307 lt!675352)) k!761) (and (is-MissingVacant!13727 lt!675352) (= (index!57309 lt!675352) (index!57308 lt!675333)) (= (select (arr!50862 _keys!605) (index!57309 lt!675352)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!878926 () SeekEntryResult!13727)

(assert (=> d!165515 (= lt!675352 e!878926)))

(declare-fun c!145825 () Bool)

(assert (=> d!165515 (= c!145825 (bvsge (x!142271 lt!675333) #b01111111111111111111111111111110))))

(declare-fun lt!675351 () (_ BitVec 64))

(assert (=> d!165515 (= lt!675351 (select (arr!50862 _keys!605) (index!57308 lt!675333)))))

(assert (=> d!165515 (validMask!0 mask!898)))

(assert (=> d!165515 (= (seekKeyOrZeroReturnVacant!0 (x!142271 lt!675333) (index!57308 lt!675333) (index!57308 lt!675333) k!761 _keys!605 mask!898) lt!675352)))

(declare-fun b!1575835 () Bool)

(declare-fun e!878925 () SeekEntryResult!13727)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575835 (= e!878925 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142271 lt!675333) #b00000000000000000000000000000001) (nextIndex!0 (index!57308 lt!675333) (x!142271 lt!675333) mask!898) (index!57308 lt!675333) k!761 _keys!605 mask!898))))

(declare-fun b!1575836 () Bool)

(declare-fun c!145826 () Bool)

(assert (=> b!1575836 (= c!145826 (= lt!675351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878927 () SeekEntryResult!13727)

(assert (=> b!1575836 (= e!878927 e!878925)))

(declare-fun b!1575837 () Bool)

(assert (=> b!1575837 (= e!878926 Undefined!13727)))

(declare-fun b!1575838 () Bool)

(assert (=> b!1575838 (= e!878927 (Found!13727 (index!57308 lt!675333)))))

(declare-fun b!1575839 () Bool)

(assert (=> b!1575839 (= e!878925 (MissingVacant!13727 (index!57308 lt!675333)))))

(declare-fun b!1575840 () Bool)

(assert (=> b!1575840 (= e!878926 e!878927)))

(declare-fun c!145827 () Bool)

(assert (=> b!1575840 (= c!145827 (= lt!675351 k!761))))

(assert (= (and d!165515 c!145825) b!1575837))

(assert (= (and d!165515 (not c!145825)) b!1575840))

(assert (= (and b!1575840 c!145827) b!1575838))

(assert (= (and b!1575840 (not c!145827)) b!1575836))

(assert (= (and b!1575836 c!145826) b!1575839))

(assert (= (and b!1575836 (not c!145826)) b!1575835))

(declare-fun m!1448747 () Bool)

(assert (=> d!165515 m!1448747))

(declare-fun m!1448749 () Bool)

(assert (=> d!165515 m!1448749))

(assert (=> d!165515 m!1448719))

(assert (=> d!165515 m!1448725))

(declare-fun m!1448751 () Bool)

(assert (=> b!1575835 m!1448751))

(assert (=> b!1575835 m!1448751))

(declare-fun m!1448753 () Bool)

(assert (=> b!1575835 m!1448753))

(assert (=> b!1575786 d!165515))

(declare-fun d!165527 () Bool)

(assert (=> d!165527 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135976 d!165527))

(declare-fun d!165531 () Bool)

(assert (=> d!165531 (= (array_inv!39589 _keys!605) (bvsge (size!51412 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135976 d!165531))

(declare-fun b!1575913 () Bool)

(declare-fun lt!675381 () SeekEntryResult!13727)

(assert (=> b!1575913 (and (bvsge (index!57308 lt!675381) #b00000000000000000000000000000000) (bvslt (index!57308 lt!675381) (size!51412 _keys!605)))))

(declare-fun e!878968 () Bool)

(assert (=> b!1575913 (= e!878968 (= (select (arr!50862 _keys!605) (index!57308 lt!675381)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575914 () Bool)

(assert (=> b!1575914 (and (bvsge (index!57308 lt!675381) #b00000000000000000000000000000000) (bvslt (index!57308 lt!675381) (size!51412 _keys!605)))))

(declare-fun res!1076753 () Bool)

(assert (=> b!1575914 (= res!1076753 (= (select (arr!50862 _keys!605) (index!57308 lt!675381)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575914 (=> res!1076753 e!878968)))

(declare-fun b!1575915 () Bool)

(declare-fun e!878970 () SeekEntryResult!13727)

(declare-fun e!878971 () SeekEntryResult!13727)

(assert (=> b!1575915 (= e!878970 e!878971)))

(declare-fun c!145854 () Bool)

(declare-fun lt!675382 () (_ BitVec 64))

(assert (=> b!1575915 (= c!145854 (or (= lt!675382 k!761) (= (bvadd lt!675382 lt!675382) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!165533 () Bool)

(declare-fun e!878972 () Bool)

(assert (=> d!165533 e!878972))

(declare-fun c!145853 () Bool)

(assert (=> d!165533 (= c!145853 (and (is-Intermediate!13727 lt!675381) (undefined!14539 lt!675381)))))

(assert (=> d!165533 (= lt!675381 e!878970)))

(declare-fun c!145852 () Bool)

(assert (=> d!165533 (= c!145852 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165533 (= lt!675382 (select (arr!50862 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165533 (validMask!0 mask!898)))

(assert (=> d!165533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675381)))

(declare-fun b!1575916 () Bool)

(declare-fun e!878969 () Bool)

(assert (=> b!1575916 (= e!878972 e!878969)))

(declare-fun res!1076751 () Bool)

(assert (=> b!1575916 (= res!1076751 (and (is-Intermediate!13727 lt!675381) (not (undefined!14539 lt!675381)) (bvslt (x!142271 lt!675381) #b01111111111111111111111111111110) (bvsge (x!142271 lt!675381) #b00000000000000000000000000000000) (bvsge (x!142271 lt!675381) #b00000000000000000000000000000000)))))

(assert (=> b!1575916 (=> (not res!1076751) (not e!878969))))

(declare-fun b!1575917 () Bool)

(assert (=> b!1575917 (= e!878971 (Intermediate!13727 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575918 () Bool)

(assert (=> b!1575918 (= e!878970 (Intermediate!13727 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575919 () Bool)

(assert (=> b!1575919 (and (bvsge (index!57308 lt!675381) #b00000000000000000000000000000000) (bvslt (index!57308 lt!675381) (size!51412 _keys!605)))))

(declare-fun res!1076752 () Bool)

(assert (=> b!1575919 (= res!1076752 (= (select (arr!50862 _keys!605) (index!57308 lt!675381)) k!761))))

(assert (=> b!1575919 (=> res!1076752 e!878968)))

(assert (=> b!1575919 (= e!878969 e!878968)))

(declare-fun b!1575920 () Bool)

(assert (=> b!1575920 (= e!878972 (bvsge (x!142271 lt!675381) #b01111111111111111111111111111110))))

(declare-fun b!1575921 () Bool)

(assert (=> b!1575921 (= e!878971 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and d!165533 c!145852) b!1575918))

(assert (= (and d!165533 (not c!145852)) b!1575915))

(assert (= (and b!1575915 c!145854) b!1575917))

(assert (= (and b!1575915 (not c!145854)) b!1575921))

(assert (= (and d!165533 c!145853) b!1575920))

(assert (= (and d!165533 (not c!145853)) b!1575916))

(assert (= (and b!1575916 res!1076751) b!1575919))

(assert (= (and b!1575919 (not res!1076752)) b!1575914))

(assert (= (and b!1575914 (not res!1076753)) b!1575913))

(declare-fun m!1448771 () Bool)

(assert (=> b!1575919 m!1448771))

(assert (=> d!165533 m!1448721))

(declare-fun m!1448773 () Bool)

(assert (=> d!165533 m!1448773))

(assert (=> d!165533 m!1448725))

(assert (=> b!1575914 m!1448771))

(assert (=> b!1575921 m!1448721))

(declare-fun m!1448775 () Bool)

(assert (=> b!1575921 m!1448775))

(assert (=> b!1575921 m!1448775))

(declare-fun m!1448777 () Bool)

(assert (=> b!1575921 m!1448777))

(assert (=> b!1575913 m!1448771))

(assert (=> b!1575785 d!165533))

(declare-fun d!165539 () Bool)

(declare-fun lt!675388 () (_ BitVec 32))

(declare-fun lt!675387 () (_ BitVec 32))

(assert (=> d!165539 (= lt!675388 (bvmul (bvxor lt!675387 (bvlshr lt!675387 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165539 (= lt!675387 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165539 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076754 (let ((h!38275 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142280 (bvmul (bvxor h!38275 (bvlshr h!38275 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142280 (bvlshr x!142280 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076754 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076754 #b00000000000000000000000000000000))))))

(assert (=> d!165539 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675388 (bvlshr lt!675388 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575785 d!165539))

(push 1)

(assert (not d!165533))

(assert (not b!1575835))

(assert (not d!165515))

(assert (not b!1575921))

(check-sat)

