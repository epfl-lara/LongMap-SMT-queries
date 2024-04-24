; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136568 () Bool)

(assert start!136568)

(declare-fun res!1077837 () Bool)

(declare-fun e!880795 () Bool)

(assert (=> start!136568 (=> (not res!1077837) (not e!880795))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136568 (= res!1077837 (validMask!0 mask!898))))

(assert (=> start!136568 e!880795))

(assert (=> start!136568 true))

(declare-datatypes ((array!105615 0))(
  ( (array!105616 (arr!50928 (Array (_ BitVec 32) (_ BitVec 64))) (size!51479 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105615)

(declare-fun array_inv!39883 (array!105615) Bool)

(assert (=> start!136568 (array_inv!39883 _keys!605)))

(declare-fun b!1578895 () Bool)

(declare-fun res!1077839 () Bool)

(assert (=> b!1578895 (=> (not res!1077839) (not e!880795))))

(assert (=> b!1578895 (= res!1077839 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51479 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1578896 () Bool)

(declare-fun res!1077838 () Bool)

(assert (=> b!1578896 (=> (not res!1077838) (not e!880795))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578896 (= res!1077838 (validKeyInArray!0 k!761))))

(declare-fun b!1578897 () Bool)

(declare-fun lt!676529 () Bool)

(declare-datatypes ((SeekEntryResult!13687 0))(
  ( (MissingZero!13687 (index!57146 (_ BitVec 32))) (Found!13687 (index!57147 (_ BitVec 32))) (Intermediate!13687 (undefined!14499 Bool) (index!57148 (_ BitVec 32)) (x!142350 (_ BitVec 32))) (Undefined!13687) (MissingVacant!13687 (index!57149 (_ BitVec 32))) )
))
(declare-fun lt!676530 () SeekEntryResult!13687)

(assert (=> b!1578897 (= e!880795 (and (or lt!676529 (not (undefined!14499 lt!676530))) (or lt!676529 (undefined!14499 lt!676530))))))

(assert (=> b!1578897 (= lt!676529 (not (is-Intermediate!13687 lt!676530)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105615 (_ BitVec 32)) SeekEntryResult!13687)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578897 (= lt!676530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136568 res!1077837) b!1578895))

(assert (= (and b!1578895 res!1077839) b!1578896))

(assert (= (and b!1578896 res!1077838) b!1578897))

(declare-fun m!1451345 () Bool)

(assert (=> start!136568 m!1451345))

(declare-fun m!1451347 () Bool)

(assert (=> start!136568 m!1451347))

(declare-fun m!1451349 () Bool)

(assert (=> b!1578896 m!1451349))

(declare-fun m!1451351 () Bool)

(assert (=> b!1578897 m!1451351))

(assert (=> b!1578897 m!1451351))

(declare-fun m!1451353 () Bool)

(assert (=> b!1578897 m!1451353))

(push 1)

(assert (not b!1578896))

(assert (not start!136568))

(assert (not b!1578897))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166375 () Bool)

(assert (=> d!166375 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1578896 d!166375))

(declare-fun d!166379 () Bool)

(assert (=> d!166379 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136568 d!166379))

(declare-fun d!166383 () Bool)

(assert (=> d!166383 (= (array_inv!39883 _keys!605) (bvsge (size!51479 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136568 d!166383))

(declare-fun b!1578970 () Bool)

(declare-fun lt!676554 () SeekEntryResult!13687)

(assert (=> b!1578970 (and (bvsge (index!57148 lt!676554) #b00000000000000000000000000000000) (bvslt (index!57148 lt!676554) (size!51479 _keys!605)))))

(declare-fun res!1077867 () Bool)

(assert (=> b!1578970 (= res!1077867 (= (select (arr!50928 _keys!605) (index!57148 lt!676554)) k!761))))

(declare-fun e!880840 () Bool)

(assert (=> b!1578970 (=> res!1077867 e!880840)))

(declare-fun e!880839 () Bool)

(assert (=> b!1578970 (= e!880839 e!880840)))

(declare-fun b!1578971 () Bool)

(assert (=> b!1578971 (and (bvsge (index!57148 lt!676554) #b00000000000000000000000000000000) (bvslt (index!57148 lt!676554) (size!51479 _keys!605)))))

(assert (=> b!1578971 (= e!880840 (= (select (arr!50928 _keys!605) (index!57148 lt!676554)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1578972 () Bool)

(declare-fun e!880838 () SeekEntryResult!13687)

(declare-fun e!880837 () SeekEntryResult!13687)

(assert (=> b!1578972 (= e!880838 e!880837)))

(declare-fun c!146842 () Bool)

(declare-fun lt!676553 () (_ BitVec 64))

(assert (=> b!1578972 (= c!146842 (or (= lt!676553 k!761) (= (bvadd lt!676553 lt!676553) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578973 () Bool)

(assert (=> b!1578973 (= e!880837 (Intermediate!13687 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1578974 () Bool)

(declare-fun e!880841 () Bool)

(assert (=> b!1578974 (= e!880841 (bvsge (x!142350 lt!676554) #b01111111111111111111111111111110))))

(declare-fun b!1578975 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578975 (= e!880837 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k!761 _keys!605 mask!898))))

(declare-fun d!166387 () Bool)

(assert (=> d!166387 e!880841))

(declare-fun c!146843 () Bool)

(assert (=> d!166387 (= c!146843 (and (is-Intermediate!13687 lt!676554) (undefined!14499 lt!676554)))))

(assert (=> d!166387 (= lt!676554 e!880838)))

(declare-fun c!146841 () Bool)

(assert (=> d!166387 (= c!146841 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!166387 (= lt!676553 (select (arr!50928 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!166387 (validMask!0 mask!898)))

(assert (=> d!166387 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!676554)))

(declare-fun b!1578976 () Bool)

(assert (=> b!1578976 (and (bvsge (index!57148 lt!676554) #b00000000000000000000000000000000) (bvslt (index!57148 lt!676554) (size!51479 _keys!605)))))

(declare-fun res!1077866 () Bool)

(assert (=> b!1578976 (= res!1077866 (= (select (arr!50928 _keys!605) (index!57148 lt!676554)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1578976 (=> res!1077866 e!880840)))

(declare-fun b!1578977 () Bool)

(assert (=> b!1578977 (= e!880838 (Intermediate!13687 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1578978 () Bool)

(assert (=> b!1578978 (= e!880841 e!880839)))

(declare-fun res!1077865 () Bool)

(assert (=> b!1578978 (= res!1077865 (and (is-Intermediate!13687 lt!676554) (not (undefined!14499 lt!676554)) (bvslt (x!142350 lt!676554) #b01111111111111111111111111111110) (bvsge (x!142350 lt!676554) #b00000000000000000000000000000000) (bvsge (x!142350 lt!676554) #b00000000000000000000000000000000)))))

(assert (=> b!1578978 (=> (not res!1077865) (not e!880839))))

(assert (= (and d!166387 c!146841) b!1578977))

(assert (= (and d!166387 (not c!146841)) b!1578972))

(assert (= (and b!1578972 c!146842) b!1578973))

(assert (= (and b!1578972 (not c!146842)) b!1578975))

(assert (= (and d!166387 c!146843) b!1578974))

(assert (= (and d!166387 (not c!146843)) b!1578978))

(assert (= (and b!1578978 res!1077865) b!1578970))

(assert (= (and b!1578970 (not res!1077867)) b!1578976))

(assert (= (and b!1578976 (not res!1077866)) b!1578971))

(assert (=> b!1578975 m!1451351))

(declare-fun m!1451365 () Bool)

(assert (=> b!1578975 m!1451365))

(assert (=> b!1578975 m!1451365))

(declare-fun m!1451371 () Bool)

(assert (=> b!1578975 m!1451371))

(assert (=> d!166387 m!1451351))

(declare-fun m!1451373 () Bool)

(assert (=> d!166387 m!1451373))

(assert (=> d!166387 m!1451345))

(declare-fun m!1451377 () Bool)

(assert (=> b!1578970 m!1451377))

(assert (=> b!1578976 m!1451377))

(assert (=> b!1578971 m!1451377))

(assert (=> b!1578897 d!166387))

(declare-fun d!166397 () Bool)

(declare-fun lt!676560 () (_ BitVec 32))

(declare-fun lt!676559 () (_ BitVec 32))

(assert (=> d!166397 (= lt!676560 (bvmul (bvxor lt!676559 (bvlshr lt!676559 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166397 (= lt!676559 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166397 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077869 (let ((h!38337 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142356 (bvmul (bvxor h!38337 (bvlshr h!38337 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142356 (bvlshr x!142356 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077869 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077869 #b00000000000000000000000000000000))))))

(assert (=> d!166397 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!676560 (bvlshr lt!676560 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1578897 d!166397))

(push 1)

(assert (not d!166387))

(assert (not b!1578975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

