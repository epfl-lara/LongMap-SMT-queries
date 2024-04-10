; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136282 () Bool)

(assert start!136282)

(declare-fun b!1576902 () Bool)

(declare-fun res!1077218 () Bool)

(declare-fun e!879557 () Bool)

(assert (=> b!1576902 (=> (not res!1077218) (not e!879557))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-datatypes ((array!105521 0))(
  ( (array!105522 (arr!50884 (Array (_ BitVec 32) (_ BitVec 64))) (size!51434 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105521)

(assert (=> b!1576902 (= res!1077218 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51434 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576904 () Bool)

(declare-fun e!879556 () Bool)

(assert (=> b!1576904 (= e!879557 e!879556)))

(declare-fun res!1077219 () Bool)

(assert (=> b!1576904 (=> (not res!1077219) (not e!879556))))

(declare-fun lt!675855 () Bool)

(declare-datatypes ((SeekEntryResult!13749 0))(
  ( (MissingZero!13749 (index!57394 (_ BitVec 32))) (Found!13749 (index!57395 (_ BitVec 32))) (Intermediate!13749 (undefined!14561 Bool) (index!57396 (_ BitVec 32)) (x!142417 (_ BitVec 32))) (Undefined!13749) (MissingVacant!13749 (index!57397 (_ BitVec 32))) )
))
(declare-fun lt!675856 () SeekEntryResult!13749)

(assert (=> b!1576904 (= res!1077219 (and (or lt!675855 (not (undefined!14561 lt!675856))) (or lt!675855 (undefined!14561 lt!675856))))))

(assert (=> b!1576904 (= lt!675855 (not (is-Intermediate!13749 lt!675856)))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105521 (_ BitVec 32)) SeekEntryResult!13749)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576904 (= lt!675856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun res!1077217 () Bool)

(assert (=> start!136282 (=> (not res!1077217) (not e!879557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136282 (= res!1077217 (validMask!0 mask!898))))

(assert (=> start!136282 e!879557))

(assert (=> start!136282 true))

(declare-fun array_inv!39611 (array!105521) Bool)

(assert (=> start!136282 (array_inv!39611 _keys!605)))

(declare-fun b!1576903 () Bool)

(declare-fun res!1077216 () Bool)

(assert (=> b!1576903 (=> (not res!1077216) (not e!879557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576903 (= res!1077216 (validKeyInArray!0 k!761))))

(declare-fun lt!675854 () SeekEntryResult!13749)

(declare-fun b!1576905 () Bool)

(assert (=> b!1576905 (= e!879556 (and (not (is-Undefined!13749 lt!675854)) (ite (is-Found!13749 lt!675854) (not (= (select (arr!50884 _keys!605) (index!57395 lt!675854)) k!761)) (ite (is-MissingZero!13749 lt!675854) (not (= (select (arr!50884 _keys!605) (index!57394 lt!675854)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (is-MissingVacant!13749 lt!675854)) (not (= (select (arr!50884 _keys!605) (index!57397 lt!675854)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun err!210 () SeekEntryResult!13749)

(assert (=> b!1576905 (= lt!675854 err!210)))

(assert (=> b!1576905 true))

(assert (= (and start!136282 res!1077217) b!1576902))

(assert (= (and b!1576902 res!1077218) b!1576903))

(assert (= (and b!1576903 res!1077216) b!1576904))

(assert (= (and b!1576904 res!1077219) b!1576905))

(declare-fun m!1449283 () Bool)

(assert (=> b!1576904 m!1449283))

(assert (=> b!1576904 m!1449283))

(declare-fun m!1449285 () Bool)

(assert (=> b!1576904 m!1449285))

(declare-fun m!1449287 () Bool)

(assert (=> start!136282 m!1449287))

(declare-fun m!1449289 () Bool)

(assert (=> start!136282 m!1449289))

(declare-fun m!1449291 () Bool)

(assert (=> b!1576903 m!1449291))

(declare-fun m!1449293 () Bool)

(assert (=> b!1576905 m!1449293))

(declare-fun m!1449295 () Bool)

(assert (=> b!1576905 m!1449295))

(declare-fun m!1449297 () Bool)

(assert (=> b!1576905 m!1449297))

(push 1)

(assert (not b!1576904))

(assert (not b!1576903))

(assert (not start!136282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1576975 () Bool)

(declare-fun lt!675890 () SeekEntryResult!13749)

(assert (=> b!1576975 (and (bvsge (index!57396 lt!675890) #b00000000000000000000000000000000) (bvslt (index!57396 lt!675890) (size!51434 _keys!605)))))

(declare-fun res!1077260 () Bool)

(assert (=> b!1576975 (= res!1077260 (= (select (arr!50884 _keys!605) (index!57396 lt!675890)) k!761))))

(declare-fun e!879603 () Bool)

(assert (=> b!1576975 (=> res!1077260 e!879603)))

(declare-fun e!879605 () Bool)

(assert (=> b!1576975 (= e!879605 e!879603)))

(declare-fun b!1576976 () Bool)

(declare-fun e!879604 () SeekEntryResult!13749)

(assert (=> b!1576976 (= e!879604 (Intermediate!13749 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576977 () Bool)

(assert (=> b!1576977 (and (bvsge (index!57396 lt!675890) #b00000000000000000000000000000000) (bvslt (index!57396 lt!675890) (size!51434 _keys!605)))))

(declare-fun res!1077262 () Bool)

(assert (=> b!1576977 (= res!1077262 (= (select (arr!50884 _keys!605) (index!57396 lt!675890)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576977 (=> res!1077262 e!879603)))

(declare-fun b!1576978 () Bool)

(assert (=> b!1576978 (and (bvsge (index!57396 lt!675890) #b00000000000000000000000000000000) (bvslt (index!57396 lt!675890) (size!51434 _keys!605)))))

(assert (=> b!1576978 (= e!879603 (= (select (arr!50884 _keys!605) (index!57396 lt!675890)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!165785 () Bool)

(declare-fun e!879602 () Bool)

(assert (=> d!165785 e!879602))

(declare-fun c!146142 () Bool)

(assert (=> d!165785 (= c!146142 (and (is-Intermediate!13749 lt!675890) (undefined!14561 lt!675890)))))

(declare-fun e!879601 () SeekEntryResult!13749)

(assert (=> d!165785 (= lt!675890 e!879601)))

(declare-fun c!146140 () Bool)

(assert (=> d!165785 (= c!146140 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675889 () (_ BitVec 64))

(assert (=> d!165785 (= lt!675889 (select (arr!50884 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165785 (validMask!0 mask!898)))

(assert (=> d!165785 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675890)))

(declare-fun b!1576979 () Bool)

(assert (=> b!1576979 (= e!879602 (bvsge (x!142417 lt!675890) #b01111111111111111111111111111110))))

(declare-fun b!1576980 () Bool)

(assert (=> b!1576980 (= e!879601 e!879604)))

(declare-fun c!146141 () Bool)

(assert (=> b!1576980 (= c!146141 (or (= lt!675889 k!761) (= (bvadd lt!675889 lt!675889) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576981 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576981 (= e!879604 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576982 () Bool)

(assert (=> b!1576982 (= e!879602 e!879605)))

(declare-fun res!1077261 () Bool)

(assert (=> b!1576982 (= res!1077261 (and (is-Intermediate!13749 lt!675890) (not (undefined!14561 lt!675890)) (bvslt (x!142417 lt!675890) #b01111111111111111111111111111110) (bvsge (x!142417 lt!675890) #b00000000000000000000000000000000) (bvsge (x!142417 lt!675890) #b00000000000000000000000000000000)))))

(assert (=> b!1576982 (=> (not res!1077261) (not e!879605))))

(declare-fun b!1576983 () Bool)

(assert (=> b!1576983 (= e!879601 (Intermediate!13749 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(assert (= (and d!165785 c!146140) b!1576983))

(assert (= (and d!165785 (not c!146140)) b!1576980))

(assert (= (and b!1576980 c!146141) b!1576976))

(assert (= (and b!1576980 (not c!146141)) b!1576981))

(assert (= (and d!165785 c!146142) b!1576979))

(assert (= (and d!165785 (not c!146142)) b!1576982))

(assert (= (and b!1576982 res!1077261) b!1576975))

(assert (= (and b!1576975 (not res!1077260)) b!1576977))

(assert (= (and b!1576977 (not res!1077262)) b!1576978))

(declare-fun m!1449339 () Bool)

(assert (=> b!1576978 m!1449339))

(assert (=> b!1576981 m!1449283))

(declare-fun m!1449341 () Bool)

(assert (=> b!1576981 m!1449341))

(assert (=> b!1576981 m!1449341))

(declare-fun m!1449343 () Bool)

(assert (=> b!1576981 m!1449343))

(assert (=> b!1576977 m!1449339))

(assert (=> b!1576975 m!1449339))

(assert (=> d!165785 m!1449283))

(declare-fun m!1449345 () Bool)

(assert (=> d!165785 m!1449345))

(assert (=> d!165785 m!1449287))

(assert (=> b!1576904 d!165785))

(declare-fun d!165795 () Bool)

(declare-fun lt!675898 () (_ BitVec 32))

(declare-fun lt!675897 () (_ BitVec 32))

(assert (=> d!165795 (= lt!675898 (bvmul (bvxor lt!675897 (bvlshr lt!675897 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165795 (= lt!675897 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165795 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077263 (let ((h!38298 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142423 (bvmul (bvxor h!38298 (bvlshr h!38298 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142423 (bvlshr x!142423 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077263 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077263 #b00000000000000000000000000000000))))))

(assert (=> d!165795 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675898 (bvlshr lt!675898 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576904 d!165795))

(declare-fun d!165803 () Bool)

(assert (=> d!165803 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576903 d!165803))

(declare-fun d!165805 () Bool)

(assert (=> d!165805 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136282 d!165805))

(declare-fun d!165809 () Bool)

(assert (=> d!165809 (= (array_inv!39611 _keys!605) (bvsge (size!51434 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136282 d!165809))

(push 1)

(assert (not b!1576981))

(assert (not d!165785))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

