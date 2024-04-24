; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135694 () Bool)

(assert start!135694)

(declare-fun res!1075845 () Bool)

(declare-fun e!878959 () Bool)

(assert (=> start!135694 (=> (not res!1075845) (not e!878959))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135694 (= res!1075845 (validMask!0 mask!889))))

(assert (=> start!135694 e!878959))

(assert (=> start!135694 true))

(declare-datatypes ((array!105240 0))(
  ( (array!105241 (arr!50769 (Array (_ BitVec 32) (_ BitVec 64))) (size!51320 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105240)

(declare-fun array_inv!39724 (array!105240) Bool)

(assert (=> start!135694 (array_inv!39724 _keys!600)))

(declare-fun b!1575925 () Bool)

(declare-fun res!1075847 () Bool)

(assert (=> b!1575925 (=> (not res!1075847) (not e!878959))))

(assert (=> b!1575925 (= res!1075847 (= (size!51320 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1575926 () Bool)

(declare-fun res!1075846 () Bool)

(assert (=> b!1575926 (=> (not res!1075846) (not e!878959))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575926 (= res!1075846 (validKeyInArray!0 k!754))))

(declare-fun b!1575927 () Bool)

(declare-fun lt!675342 () Bool)

(declare-datatypes ((SeekEntryResult!13576 0))(
  ( (MissingZero!13576 (index!56702 (_ BitVec 32))) (Found!13576 (index!56703 (_ BitVec 32))) (Intermediate!13576 (undefined!14388 Bool) (index!56704 (_ BitVec 32)) (x!141710 (_ BitVec 32))) (Undefined!13576) (MissingVacant!13576 (index!56705 (_ BitVec 32))) )
))
(declare-fun lt!675341 () SeekEntryResult!13576)

(assert (=> b!1575927 (= e!878959 (and (or lt!675342 (not (undefined!14388 lt!675341))) (or lt!675342 (undefined!14388 lt!675341))))))

(assert (=> b!1575927 (= lt!675342 (not (is-Intermediate!13576 lt!675341)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105240 (_ BitVec 32)) SeekEntryResult!13576)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575927 (= lt!675341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135694 res!1075845) b!1575925))

(assert (= (and b!1575925 res!1075847) b!1575926))

(assert (= (and b!1575926 res!1075846) b!1575927))

(declare-fun m!1449161 () Bool)

(assert (=> start!135694 m!1449161))

(declare-fun m!1449163 () Bool)

(assert (=> start!135694 m!1449163))

(declare-fun m!1449165 () Bool)

(assert (=> b!1575926 m!1449165))

(declare-fun m!1449167 () Bool)

(assert (=> b!1575927 m!1449167))

(assert (=> b!1575927 m!1449167))

(declare-fun m!1449169 () Bool)

(assert (=> b!1575927 m!1449169))

(push 1)

(assert (not b!1575926))

(assert (not b!1575927))

(assert (not start!135694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165711 () Bool)

(assert (=> d!165711 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575926 d!165711))

(declare-fun b!1576000 () Bool)

(declare-fun e!879001 () SeekEntryResult!13576)

(declare-fun e!879005 () SeekEntryResult!13576)

(assert (=> b!1576000 (= e!879001 e!879005)))

(declare-fun c!146328 () Bool)

(declare-fun lt!675365 () (_ BitVec 64))

(assert (=> b!1576000 (= c!146328 (or (= lt!675365 k!754) (= (bvadd lt!675365 lt!675365) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576001 () Bool)

(declare-fun e!879002 () Bool)

(declare-fun lt!675366 () SeekEntryResult!13576)

(assert (=> b!1576001 (= e!879002 (bvsge (x!141710 lt!675366) #b01111111111111111111111111111110))))

(declare-fun b!1576002 () Bool)

(assert (=> b!1576002 (= e!879001 (Intermediate!13576 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1576003 () Bool)

(assert (=> b!1576003 (= e!879005 (Intermediate!13576 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!165715 () Bool)

(assert (=> d!165715 e!879002))

(declare-fun c!146329 () Bool)

(assert (=> d!165715 (= c!146329 (and (is-Intermediate!13576 lt!675366) (undefined!14388 lt!675366)))))

(assert (=> d!165715 (= lt!675366 e!879001)))

(declare-fun c!146330 () Bool)

(assert (=> d!165715 (= c!146330 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165715 (= lt!675365 (select (arr!50769 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!165715 (validMask!0 mask!889)))

(assert (=> d!165715 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!675366)))

(declare-fun b!1576004 () Bool)

(assert (=> b!1576004 (and (bvsge (index!56704 lt!675366) #b00000000000000000000000000000000) (bvslt (index!56704 lt!675366) (size!51320 _keys!600)))))

(declare-fun res!1075874 () Bool)

(assert (=> b!1576004 (= res!1075874 (= (select (arr!50769 _keys!600) (index!56704 lt!675366)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879004 () Bool)

(assert (=> b!1576004 (=> res!1075874 e!879004)))

(declare-fun b!1576005 () Bool)

(declare-fun e!879003 () Bool)

(assert (=> b!1576005 (= e!879002 e!879003)))

(declare-fun res!1075876 () Bool)

(assert (=> b!1576005 (= res!1075876 (and (is-Intermediate!13576 lt!675366) (not (undefined!14388 lt!675366)) (bvslt (x!141710 lt!675366) #b01111111111111111111111111111110) (bvsge (x!141710 lt!675366) #b00000000000000000000000000000000) (bvsge (x!141710 lt!675366) #b00000000000000000000000000000000)))))

(assert (=> b!1576005 (=> (not res!1075876) (not e!879003))))

(declare-fun b!1576006 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576006 (= e!879005 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1576007 () Bool)

(assert (=> b!1576007 (and (bvsge (index!56704 lt!675366) #b00000000000000000000000000000000) (bvslt (index!56704 lt!675366) (size!51320 _keys!600)))))

(declare-fun res!1075875 () Bool)

(assert (=> b!1576007 (= res!1075875 (= (select (arr!50769 _keys!600) (index!56704 lt!675366)) k!754))))

(assert (=> b!1576007 (=> res!1075875 e!879004)))

(assert (=> b!1576007 (= e!879003 e!879004)))

(declare-fun b!1576008 () Bool)

(assert (=> b!1576008 (and (bvsge (index!56704 lt!675366) #b00000000000000000000000000000000) (bvslt (index!56704 lt!675366) (size!51320 _keys!600)))))

(assert (=> b!1576008 (= e!879004 (= (select (arr!50769 _keys!600) (index!56704 lt!675366)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!165715 c!146330) b!1576002))

(assert (= (and d!165715 (not c!146330)) b!1576000))

(assert (= (and b!1576000 c!146328) b!1576003))

(assert (= (and b!1576000 (not c!146328)) b!1576006))

(assert (= (and d!165715 c!146329) b!1576001))

(assert (= (and d!165715 (not c!146329)) b!1576005))

(assert (= (and b!1576005 res!1075876) b!1576007))

(assert (= (and b!1576007 (not res!1075875)) b!1576004))

(assert (= (and b!1576004 (not res!1075874)) b!1576008))

(declare-fun m!1449187 () Bool)

(assert (=> b!1576007 m!1449187))

(assert (=> b!1576008 m!1449187))

(assert (=> b!1576006 m!1449167))

(declare-fun m!1449189 () Bool)

(assert (=> b!1576006 m!1449189))

(assert (=> b!1576006 m!1449189))

(declare-fun m!1449191 () Bool)

(assert (=> b!1576006 m!1449191))

(assert (=> b!1576004 m!1449187))

(assert (=> d!165715 m!1449167))

(declare-fun m!1449193 () Bool)

(assert (=> d!165715 m!1449193))

(assert (=> d!165715 m!1449161))

(assert (=> b!1575927 d!165715))

(declare-fun d!165725 () Bool)

(declare-fun lt!675378 () (_ BitVec 32))

(declare-fun lt!675377 () (_ BitVec 32))

(assert (=> d!165725 (= lt!675378 (bvmul (bvxor lt!675377 (bvlshr lt!675377 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165725 (= lt!675377 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165725 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075877 (let ((h!38289 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141716 (bvmul (bvxor h!38289 (bvlshr h!38289 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141716 (bvlshr x!141716 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075877 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075877 #b00000000000000000000000000000000))))))

(assert (=> d!165725 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!675378 (bvlshr lt!675378 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1575927 d!165725))

(declare-fun d!165733 () Bool)

(assert (=> d!165733 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135694 d!165733))

(declare-fun d!165737 () Bool)

(assert (=> d!165737 (= (array_inv!39724 _keys!600) (bvsge (size!51320 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135694 d!165737))

(push 1)

(assert (not b!1576006))

(assert (not d!165715))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

