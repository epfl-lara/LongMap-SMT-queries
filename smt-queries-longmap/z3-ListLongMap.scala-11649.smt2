; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136056 () Bool)

(assert start!136056)

(declare-fun b!1576114 () Bool)

(declare-fun res!1076844 () Bool)

(declare-fun e!879089 () Bool)

(assert (=> b!1576114 (=> (not res!1076844) (not e!879089))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576114 (= res!1076844 (validKeyInArray!0 k0!761))))

(declare-fun b!1576116 () Bool)

(declare-fun e!879088 () Bool)

(declare-datatypes ((SeekEntryResult!13732 0))(
  ( (MissingZero!13732 (index!57326 (_ BitVec 32))) (Found!13732 (index!57327 (_ BitVec 32))) (Intermediate!13732 (undefined!14544 Bool) (index!57328 (_ BitVec 32)) (x!142310 (_ BitVec 32))) (Undefined!13732) (MissingVacant!13732 (index!57329 (_ BitVec 32))) )
))
(declare-fun lt!675472 () SeekEntryResult!13732)

(declare-datatypes ((array!105469 0))(
  ( (array!105470 (arr!50867 (Array (_ BitVec 32) (_ BitVec 64))) (size!51417 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105469)

(get-info :version)

(assert (=> b!1576116 (= e!879088 (and (not ((_ is Undefined!13732) lt!675472)) (not ((_ is Found!13732) lt!675472)) (not ((_ is MissingZero!13732) lt!675472)) ((_ is MissingVacant!13732) lt!675472) (or (bvslt (index!57329 lt!675472) #b00000000000000000000000000000000) (bvsge (index!57329 lt!675472) (size!51417 _keys!605)))))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun lt!675471 () SeekEntryResult!13732)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105469 (_ BitVec 32)) SeekEntryResult!13732)

(assert (=> b!1576116 (= lt!675472 (seekKeyOrZeroReturnVacant!0 (x!142310 lt!675471) (index!57328 lt!675471) (index!57328 lt!675471) k0!761 _keys!605 mask!898))))

(declare-fun b!1576115 () Bool)

(assert (=> b!1576115 (= e!879089 e!879088)))

(declare-fun res!1076843 () Bool)

(assert (=> b!1576115 (=> (not res!1076843) (not e!879088))))

(assert (=> b!1576115 (= res!1076843 (and (not (undefined!14544 lt!675471)) ((_ is Intermediate!13732) lt!675471) (not (= (select (arr!50867 _keys!605) (index!57328 lt!675471)) k0!761)) (not (= (select (arr!50867 _keys!605) (index!57328 lt!675471)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50867 _keys!605) (index!57328 lt!675471)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57328 lt!675471) #b00000000000000000000000000000000) (bvslt (index!57328 lt!675471) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105469 (_ BitVec 32)) SeekEntryResult!13732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576115 (= lt!675471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun res!1076841 () Bool)

(assert (=> start!136056 (=> (not res!1076841) (not e!879089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136056 (= res!1076841 (validMask!0 mask!898))))

(assert (=> start!136056 e!879089))

(assert (=> start!136056 true))

(declare-fun array_inv!39594 (array!105469) Bool)

(assert (=> start!136056 (array_inv!39594 _keys!605)))

(declare-fun b!1576113 () Bool)

(declare-fun res!1076842 () Bool)

(assert (=> b!1576113 (=> (not res!1076842) (not e!879089))))

(assert (=> b!1576113 (= res!1076842 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51417 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(assert (= (and start!136056 res!1076841) b!1576113))

(assert (= (and b!1576113 res!1076842) b!1576114))

(assert (= (and b!1576114 res!1076844) b!1576115))

(assert (= (and b!1576115 res!1076843) b!1576116))

(declare-fun m!1448883 () Bool)

(assert (=> b!1576114 m!1448883))

(declare-fun m!1448885 () Bool)

(assert (=> b!1576116 m!1448885))

(declare-fun m!1448887 () Bool)

(assert (=> b!1576115 m!1448887))

(declare-fun m!1448889 () Bool)

(assert (=> b!1576115 m!1448889))

(assert (=> b!1576115 m!1448889))

(declare-fun m!1448891 () Bool)

(assert (=> b!1576115 m!1448891))

(declare-fun m!1448893 () Bool)

(assert (=> start!136056 m!1448893))

(declare-fun m!1448895 () Bool)

(assert (=> start!136056 m!1448895))

(check-sat (not start!136056) (not b!1576114) (not b!1576115) (not b!1576116))
(check-sat)
(get-model)

(declare-fun d!165579 () Bool)

(assert (=> d!165579 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136056 d!165579))

(declare-fun d!165583 () Bool)

(assert (=> d!165583 (= (array_inv!39594 _keys!605) (bvsge (size!51417 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136056 d!165583))

(declare-fun d!165585 () Bool)

(assert (=> d!165585 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576114 d!165585))

(declare-fun b!1576174 () Bool)

(declare-fun lt!675496 () SeekEntryResult!13732)

(assert (=> b!1576174 (and (bvsge (index!57328 lt!675496) #b00000000000000000000000000000000) (bvslt (index!57328 lt!675496) (size!51417 _keys!605)))))

(declare-fun res!1076873 () Bool)

(assert (=> b!1576174 (= res!1076873 (= (select (arr!50867 _keys!605) (index!57328 lt!675496)) k0!761))))

(declare-fun e!879127 () Bool)

(assert (=> b!1576174 (=> res!1076873 e!879127)))

(declare-fun e!879124 () Bool)

(assert (=> b!1576174 (= e!879124 e!879127)))

(declare-fun b!1576175 () Bool)

(assert (=> b!1576175 (and (bvsge (index!57328 lt!675496) #b00000000000000000000000000000000) (bvslt (index!57328 lt!675496) (size!51417 _keys!605)))))

(declare-fun res!1076874 () Bool)

(assert (=> b!1576175 (= res!1076874 (= (select (arr!50867 _keys!605) (index!57328 lt!675496)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576175 (=> res!1076874 e!879127)))

(declare-fun b!1576176 () Bool)

(declare-fun e!879126 () Bool)

(assert (=> b!1576176 (= e!879126 e!879124)))

(declare-fun res!1076875 () Bool)

(assert (=> b!1576176 (= res!1076875 (and ((_ is Intermediate!13732) lt!675496) (not (undefined!14544 lt!675496)) (bvslt (x!142310 lt!675496) #b01111111111111111111111111111110) (bvsge (x!142310 lt!675496) #b00000000000000000000000000000000) (bvsge (x!142310 lt!675496) #b00000000000000000000000000000000)))))

(assert (=> b!1576176 (=> (not res!1076875) (not e!879124))))

(declare-fun b!1576177 () Bool)

(assert (=> b!1576177 (and (bvsge (index!57328 lt!675496) #b00000000000000000000000000000000) (bvslt (index!57328 lt!675496) (size!51417 _keys!605)))))

(assert (=> b!1576177 (= e!879127 (= (select (arr!50867 _keys!605) (index!57328 lt!675496)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576178 () Bool)

(declare-fun e!879125 () SeekEntryResult!13732)

(assert (=> b!1576178 (= e!879125 (Intermediate!13732 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun d!165587 () Bool)

(assert (=> d!165587 e!879126))

(declare-fun c!145926 () Bool)

(assert (=> d!165587 (= c!145926 (and ((_ is Intermediate!13732) lt!675496) (undefined!14544 lt!675496)))))

(assert (=> d!165587 (= lt!675496 e!879125)))

(declare-fun c!145925 () Bool)

(assert (=> d!165587 (= c!145925 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675495 () (_ BitVec 64))

(assert (=> d!165587 (= lt!675495 (select (arr!50867 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165587 (validMask!0 mask!898)))

(assert (=> d!165587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675496)))

(declare-fun b!1576179 () Bool)

(declare-fun e!879128 () SeekEntryResult!13732)

(assert (=> b!1576179 (= e!879125 e!879128)))

(declare-fun c!145924 () Bool)

(assert (=> b!1576179 (= c!145924 (or (= lt!675495 k0!761) (= (bvadd lt!675495 lt!675495) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576180 () Bool)

(assert (=> b!1576180 (= e!879128 (Intermediate!13732 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576181 () Bool)

(assert (=> b!1576181 (= e!879126 (bvsge (x!142310 lt!675496) #b01111111111111111111111111111110))))

(declare-fun b!1576182 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576182 (= e!879128 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and d!165587 c!145925) b!1576178))

(assert (= (and d!165587 (not c!145925)) b!1576179))

(assert (= (and b!1576179 c!145924) b!1576180))

(assert (= (and b!1576179 (not c!145924)) b!1576182))

(assert (= (and d!165587 c!145926) b!1576181))

(assert (= (and d!165587 (not c!145926)) b!1576176))

(assert (= (and b!1576176 res!1076875) b!1576174))

(assert (= (and b!1576174 (not res!1076873)) b!1576175))

(assert (= (and b!1576175 (not res!1076874)) b!1576177))

(assert (=> b!1576182 m!1448889))

(declare-fun m!1448919 () Bool)

(assert (=> b!1576182 m!1448919))

(assert (=> b!1576182 m!1448919))

(declare-fun m!1448921 () Bool)

(assert (=> b!1576182 m!1448921))

(assert (=> d!165587 m!1448889))

(declare-fun m!1448923 () Bool)

(assert (=> d!165587 m!1448923))

(assert (=> d!165587 m!1448893))

(declare-fun m!1448925 () Bool)

(assert (=> b!1576177 m!1448925))

(assert (=> b!1576174 m!1448925))

(assert (=> b!1576175 m!1448925))

(assert (=> b!1576115 d!165587))

(declare-fun d!165595 () Bool)

(declare-fun lt!675512 () (_ BitVec 32))

(declare-fun lt!675511 () (_ BitVec 32))

(assert (=> d!165595 (= lt!675512 (bvmul (bvxor lt!675511 (bvlshr lt!675511 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165595 (= lt!675511 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165595 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076876 (let ((h!38280 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142316 (bvmul (bvxor h!38280 (bvlshr h!38280 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142316 (bvlshr x!142316 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076876 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076876 #b00000000000000000000000000000000))))))

(assert (=> d!165595 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675512 (bvlshr lt!675512 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576115 d!165595))

(declare-fun b!1576240 () Bool)

(declare-fun e!879161 () SeekEntryResult!13732)

(declare-fun e!879159 () SeekEntryResult!13732)

(assert (=> b!1576240 (= e!879161 e!879159)))

(declare-fun c!145953 () Bool)

(declare-fun lt!675526 () (_ BitVec 64))

(assert (=> b!1576240 (= c!145953 (= lt!675526 k0!761))))

(declare-fun b!1576241 () Bool)

(declare-fun e!879160 () SeekEntryResult!13732)

(assert (=> b!1576241 (= e!879160 (MissingVacant!13732 (index!57328 lt!675471)))))

(declare-fun b!1576242 () Bool)

(declare-fun c!145951 () Bool)

(assert (=> b!1576242 (= c!145951 (= lt!675526 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576242 (= e!879159 e!879160)))

(declare-fun b!1576243 () Bool)

(assert (=> b!1576243 (= e!879159 (Found!13732 (index!57328 lt!675471)))))

(declare-fun b!1576244 () Bool)

(assert (=> b!1576244 (= e!879161 Undefined!13732)))

(declare-fun b!1576245 () Bool)

(assert (=> b!1576245 (= e!879160 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142310 lt!675471) #b00000000000000000000000000000001) (nextIndex!0 (index!57328 lt!675471) (x!142310 lt!675471) mask!898) (index!57328 lt!675471) k0!761 _keys!605 mask!898))))

(declare-fun lt!675525 () SeekEntryResult!13732)

(declare-fun d!165599 () Bool)

(assert (=> d!165599 (and (or ((_ is Undefined!13732) lt!675525) (not ((_ is Found!13732) lt!675525)) (and (bvsge (index!57327 lt!675525) #b00000000000000000000000000000000) (bvslt (index!57327 lt!675525) (size!51417 _keys!605)))) (or ((_ is Undefined!13732) lt!675525) ((_ is Found!13732) lt!675525) (not ((_ is MissingVacant!13732) lt!675525)) (not (= (index!57329 lt!675525) (index!57328 lt!675471))) (and (bvsge (index!57329 lt!675525) #b00000000000000000000000000000000) (bvslt (index!57329 lt!675525) (size!51417 _keys!605)))) (or ((_ is Undefined!13732) lt!675525) (ite ((_ is Found!13732) lt!675525) (= (select (arr!50867 _keys!605) (index!57327 lt!675525)) k0!761) (and ((_ is MissingVacant!13732) lt!675525) (= (index!57329 lt!675525) (index!57328 lt!675471)) (= (select (arr!50867 _keys!605) (index!57329 lt!675525)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!165599 (= lt!675525 e!879161)))

(declare-fun c!145952 () Bool)

(assert (=> d!165599 (= c!145952 (bvsge (x!142310 lt!675471) #b01111111111111111111111111111110))))

(assert (=> d!165599 (= lt!675526 (select (arr!50867 _keys!605) (index!57328 lt!675471)))))

(assert (=> d!165599 (validMask!0 mask!898)))

(assert (=> d!165599 (= (seekKeyOrZeroReturnVacant!0 (x!142310 lt!675471) (index!57328 lt!675471) (index!57328 lt!675471) k0!761 _keys!605 mask!898) lt!675525)))

(assert (= (and d!165599 c!145952) b!1576244))

(assert (= (and d!165599 (not c!145952)) b!1576240))

(assert (= (and b!1576240 c!145953) b!1576243))

(assert (= (and b!1576240 (not c!145953)) b!1576242))

(assert (= (and b!1576242 c!145951) b!1576241))

(assert (= (and b!1576242 (not c!145951)) b!1576245))

(declare-fun m!1448943 () Bool)

(assert (=> b!1576245 m!1448943))

(assert (=> b!1576245 m!1448943))

(declare-fun m!1448945 () Bool)

(assert (=> b!1576245 m!1448945))

(declare-fun m!1448947 () Bool)

(assert (=> d!165599 m!1448947))

(declare-fun m!1448949 () Bool)

(assert (=> d!165599 m!1448949))

(assert (=> d!165599 m!1448887))

(assert (=> d!165599 m!1448893))

(assert (=> b!1576116 d!165599))

(check-sat (not b!1576182) (not b!1576245) (not d!165587) (not d!165599))
(check-sat)
