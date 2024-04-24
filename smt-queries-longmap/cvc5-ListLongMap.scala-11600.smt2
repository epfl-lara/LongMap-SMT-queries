; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135766 () Bool)

(assert start!135766)

(declare-fun b!1576161 () Bool)

(declare-fun e!879102 () Bool)

(declare-datatypes ((SeekEntryResult!13582 0))(
  ( (MissingZero!13582 (index!56726 (_ BitVec 32))) (Found!13582 (index!56727 (_ BitVec 32))) (Intermediate!13582 (undefined!14394 Bool) (index!56728 (_ BitVec 32)) (x!141744 (_ BitVec 32))) (Undefined!13582) (MissingVacant!13582 (index!56729 (_ BitVec 32))) )
))
(declare-fun lt!675468 () SeekEntryResult!13582)

(assert (=> b!1576161 (= e!879102 (and (not (is-MissingVacant!13582 lt!675468)) (not (is-Found!13582 lt!675468)) (not (is-MissingZero!13582 lt!675468)) (not (is-Undefined!13582 lt!675468))))))

(declare-fun err!158 () SeekEntryResult!13582)

(assert (=> b!1576161 (= lt!675468 err!158)))

(assert (=> b!1576161 true))

(declare-fun b!1576160 () Bool)

(declare-fun e!879103 () Bool)

(assert (=> b!1576160 (= e!879103 e!879102)))

(declare-fun res!1075977 () Bool)

(assert (=> b!1576160 (=> (not res!1075977) (not e!879102))))

(declare-fun lt!675466 () Bool)

(declare-fun lt!675467 () SeekEntryResult!13582)

(assert (=> b!1576160 (= res!1075977 (and (or lt!675466 (not (undefined!14394 lt!675467))) (or lt!675466 (undefined!14394 lt!675467))))))

(assert (=> b!1576160 (= lt!675466 (not (is-Intermediate!13582 lt!675467)))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun k!754 () (_ BitVec 64))

(declare-datatypes ((array!105258 0))(
  ( (array!105259 (arr!50775 (Array (_ BitVec 32) (_ BitVec 64))) (size!51326 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105258)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105258 (_ BitVec 32)) SeekEntryResult!13582)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576160 (= lt!675467 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1576159 () Bool)

(declare-fun res!1075976 () Bool)

(assert (=> b!1576159 (=> (not res!1075976) (not e!879103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576159 (= res!1075976 (validKeyInArray!0 k!754))))

(declare-fun res!1075978 () Bool)

(assert (=> start!135766 (=> (not res!1075978) (not e!879103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135766 (= res!1075978 (validMask!0 mask!889))))

(assert (=> start!135766 e!879103))

(assert (=> start!135766 true))

(declare-fun array_inv!39730 (array!105258) Bool)

(assert (=> start!135766 (array_inv!39730 _keys!600)))

(declare-fun b!1576158 () Bool)

(declare-fun res!1075979 () Bool)

(assert (=> b!1576158 (=> (not res!1075979) (not e!879103))))

(assert (=> b!1576158 (= res!1075979 (= (size!51326 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(assert (= (and start!135766 res!1075978) b!1576158))

(assert (= (and b!1576158 res!1075979) b!1576159))

(assert (= (and b!1576159 res!1075976) b!1576160))

(assert (= (and b!1576160 res!1075977) b!1576161))

(declare-fun m!1449269 () Bool)

(assert (=> b!1576160 m!1449269))

(assert (=> b!1576160 m!1449269))

(declare-fun m!1449271 () Bool)

(assert (=> b!1576160 m!1449271))

(declare-fun m!1449273 () Bool)

(assert (=> b!1576159 m!1449273))

(declare-fun m!1449275 () Bool)

(assert (=> start!135766 m!1449275))

(declare-fun m!1449277 () Bool)

(assert (=> start!135766 m!1449277))

(push 1)

(assert (not b!1576159))

(assert (not start!135766))

(assert (not b!1576160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165779 () Bool)

(assert (=> d!165779 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576159 d!165779))

(declare-fun d!165783 () Bool)

(assert (=> d!165783 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135766 d!165783))

(declare-fun d!165791 () Bool)

(assert (=> d!165791 (= (array_inv!39730 _keys!600) (bvsge (size!51326 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135766 d!165791))

(declare-fun b!1576234 () Bool)

(declare-fun e!879148 () SeekEntryResult!13582)

(assert (=> b!1576234 (= e!879148 (Intermediate!13582 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1576235 () Bool)

(declare-fun e!879147 () Bool)

(declare-fun e!879146 () Bool)

(assert (=> b!1576235 (= e!879147 e!879146)))

(declare-fun res!1076005 () Bool)

(declare-fun lt!675486 () SeekEntryResult!13582)

(assert (=> b!1576235 (= res!1076005 (and (is-Intermediate!13582 lt!675486) (not (undefined!14394 lt!675486)) (bvslt (x!141744 lt!675486) #b01111111111111111111111111111110) (bvsge (x!141744 lt!675486) #b00000000000000000000000000000000) (bvsge (x!141744 lt!675486) #b00000000000000000000000000000000)))))

(assert (=> b!1576235 (=> (not res!1076005) (not e!879146))))

(declare-fun b!1576236 () Bool)

(assert (=> b!1576236 (and (bvsge (index!56728 lt!675486) #b00000000000000000000000000000000) (bvslt (index!56728 lt!675486) (size!51326 _keys!600)))))

(declare-fun e!879145 () Bool)

(assert (=> b!1576236 (= e!879145 (= (select (arr!50775 _keys!600) (index!56728 lt!675486)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576237 () Bool)

(assert (=> b!1576237 (= e!879147 (bvsge (x!141744 lt!675486) #b01111111111111111111111111111110))))

(declare-fun b!1576238 () Bool)

(assert (=> b!1576238 (and (bvsge (index!56728 lt!675486) #b00000000000000000000000000000000) (bvslt (index!56728 lt!675486) (size!51326 _keys!600)))))

(declare-fun res!1076007 () Bool)

(assert (=> b!1576238 (= res!1076007 (= (select (arr!50775 _keys!600) (index!56728 lt!675486)) k!754))))

(assert (=> b!1576238 (=> res!1076007 e!879145)))

(assert (=> b!1576238 (= e!879146 e!879145)))

(declare-fun d!165795 () Bool)

(assert (=> d!165795 e!879147))

(declare-fun c!146382 () Bool)

(assert (=> d!165795 (= c!146382 (and (is-Intermediate!13582 lt!675486) (undefined!14394 lt!675486)))))

(declare-fun e!879149 () SeekEntryResult!13582)

(assert (=> d!165795 (= lt!675486 e!879149)))

(declare-fun c!146383 () Bool)

(assert (=> d!165795 (= c!146383 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675485 () (_ BitVec 64))

(assert (=> d!165795 (= lt!675485 (select (arr!50775 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!165795 (validMask!0 mask!889)))

(assert (=> d!165795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!675486)))

(declare-fun b!1576239 () Bool)

(assert (=> b!1576239 (and (bvsge (index!56728 lt!675486) #b00000000000000000000000000000000) (bvslt (index!56728 lt!675486) (size!51326 _keys!600)))))

(declare-fun res!1076006 () Bool)

(assert (=> b!1576239 (= res!1076006 (= (select (arr!50775 _keys!600) (index!56728 lt!675486)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576239 (=> res!1076006 e!879145)))

(declare-fun b!1576240 () Bool)

(assert (=> b!1576240 (= e!879149 e!879148)))

(declare-fun c!146384 () Bool)

(assert (=> b!1576240 (= c!146384 (or (= lt!675485 k!754) (= (bvadd lt!675485 lt!675485) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576241 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576241 (= e!879148 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!754 mask!889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1576242 () Bool)

(assert (=> b!1576242 (= e!879149 (Intermediate!13582 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(assert (= (and d!165795 c!146383) b!1576242))

(assert (= (and d!165795 (not c!146383)) b!1576240))

(assert (= (and b!1576240 c!146384) b!1576234))

(assert (= (and b!1576240 (not c!146384)) b!1576241))

(assert (= (and d!165795 c!146382) b!1576237))

(assert (= (and d!165795 (not c!146382)) b!1576235))

(assert (= (and b!1576235 res!1076005) b!1576238))

(assert (= (and b!1576238 (not res!1076007)) b!1576239))

(assert (= (and b!1576239 (not res!1076006)) b!1576236))

(declare-fun m!1449291 () Bool)

(assert (=> b!1576238 m!1449291))

(assert (=> b!1576239 m!1449291))

(assert (=> b!1576241 m!1449269))

(declare-fun m!1449295 () Bool)

(assert (=> b!1576241 m!1449295))

(assert (=> b!1576241 m!1449295))

(declare-fun m!1449299 () Bool)

(assert (=> b!1576241 m!1449299))

(assert (=> d!165795 m!1449269))

(declare-fun m!1449301 () Bool)

(assert (=> d!165795 m!1449301))

(assert (=> d!165795 m!1449275))

(assert (=> b!1576236 m!1449291))

(assert (=> b!1576160 d!165795))

(declare-fun d!165801 () Bool)

(declare-fun lt!675504 () (_ BitVec 32))

(declare-fun lt!675503 () (_ BitVec 32))

(assert (=> d!165801 (= lt!675504 (bvmul (bvxor lt!675503 (bvlshr lt!675503 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165801 (= lt!675503 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165801 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1076009 (let ((h!38295 ((_ extract 31 0) (bvand (bvxor k!754 (bvlshr k!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141750 (bvmul (bvxor h!38295 (bvlshr h!38295 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141750 (bvlshr x!141750 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1076009 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1076009 #b00000000000000000000000000000000))))))

(assert (=> d!165801 (= (toIndex!0 k!754 mask!889) (bvand (bvxor lt!675504 (bvlshr lt!675504 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1576160 d!165801))

(push 1)

(assert (not d!165795))

(assert (not b!1576241))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

