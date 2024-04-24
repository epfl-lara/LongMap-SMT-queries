; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135354 () Bool)

(assert start!135354)

(declare-fun res!1075079 () Bool)

(declare-fun e!878173 () Bool)

(assert (=> start!135354 (=> (not res!1075079) (not e!878173))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135354 (= res!1075079 (validMask!0 mask!889))))

(assert (=> start!135354 e!878173))

(assert (=> start!135354 true))

(declare-datatypes ((array!105107 0))(
  ( (array!105108 (arr!50713 (Array (_ BitVec 32) (_ BitVec 64))) (size!51264 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105107)

(declare-fun array_inv!39668 (array!105107) Bool)

(assert (=> start!135354 (array_inv!39668 _keys!600)))

(declare-fun b!1574638 () Bool)

(declare-fun res!1075077 () Bool)

(assert (=> b!1574638 (=> (not res!1075077) (not e!878173))))

(assert (=> b!1574638 (= res!1075077 (= (size!51264 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574639 () Bool)

(declare-fun res!1075078 () Bool)

(assert (=> b!1574639 (=> (not res!1075078) (not e!878173))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574639 (= res!1075078 (validKeyInArray!0 k0!754))))

(declare-datatypes ((SeekEntryResult!13520 0))(
  ( (MissingZero!13520 (index!56478 (_ BitVec 32))) (Found!13520 (index!56479 (_ BitVec 32))) (Intermediate!13520 (undefined!14332 Bool) (index!56480 (_ BitVec 32)) (x!141459 (_ BitVec 32))) (Undefined!13520) (MissingVacant!13520 (index!56481 (_ BitVec 32))) )
))
(declare-fun lt!674805 () SeekEntryResult!13520)

(declare-fun b!1574640 () Bool)

(get-info :version)

(assert (=> b!1574640 (= e!878173 (and ((_ is Intermediate!13520) lt!674805) (not (undefined!14332 lt!674805)) (not (= (select (arr!50713 _keys!600) (index!56480 lt!674805)) k0!754)) (not (= (select (arr!50713 _keys!600) (index!56480 lt!674805)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50713 _keys!600) (index!56480 lt!674805)) #b1000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!56480 lt!674805) #b00000000000000000000000000000000) (bvsge (index!56480 lt!674805) (bvadd #b00000000000000000000000000000001 mask!889)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105107 (_ BitVec 32)) SeekEntryResult!13520)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574640 (= lt!674805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135354 res!1075079) b!1574638))

(assert (= (and b!1574638 res!1075077) b!1574639))

(assert (= (and b!1574639 res!1075078) b!1574640))

(declare-fun m!1448265 () Bool)

(assert (=> start!135354 m!1448265))

(declare-fun m!1448267 () Bool)

(assert (=> start!135354 m!1448267))

(declare-fun m!1448269 () Bool)

(assert (=> b!1574639 m!1448269))

(declare-fun m!1448271 () Bool)

(assert (=> b!1574640 m!1448271))

(declare-fun m!1448273 () Bool)

(assert (=> b!1574640 m!1448273))

(assert (=> b!1574640 m!1448273))

(declare-fun m!1448275 () Bool)

(assert (=> b!1574640 m!1448275))

(check-sat (not b!1574639) (not start!135354) (not b!1574640))
(check-sat)
(get-model)

(declare-fun d!165445 () Bool)

(assert (=> d!165445 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574639 d!165445))

(declare-fun d!165447 () Bool)

(assert (=> d!165447 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135354 d!165447))

(declare-fun d!165451 () Bool)

(assert (=> d!165451 (= (array_inv!39668 _keys!600) (bvsge (size!51264 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135354 d!165451))

(declare-fun b!1574695 () Bool)

(declare-fun e!878209 () SeekEntryResult!13520)

(declare-fun e!878211 () SeekEntryResult!13520)

(assert (=> b!1574695 (= e!878209 e!878211)))

(declare-fun c!146046 () Bool)

(declare-fun lt!674820 () (_ BitVec 64))

(assert (=> b!1574695 (= c!146046 (or (= lt!674820 k0!754) (= (bvadd lt!674820 lt!674820) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574696 () Bool)

(declare-fun lt!674821 () SeekEntryResult!13520)

(assert (=> b!1574696 (and (bvsge (index!56480 lt!674821) #b00000000000000000000000000000000) (bvslt (index!56480 lt!674821) (size!51264 _keys!600)))))

(declare-fun e!878210 () Bool)

(assert (=> b!1574696 (= e!878210 (= (select (arr!50713 _keys!600) (index!56480 lt!674821)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1574697 () Bool)

(declare-fun e!878207 () Bool)

(declare-fun e!878208 () Bool)

(assert (=> b!1574697 (= e!878207 e!878208)))

(declare-fun res!1075112 () Bool)

(assert (=> b!1574697 (= res!1075112 (and ((_ is Intermediate!13520) lt!674821) (not (undefined!14332 lt!674821)) (bvslt (x!141459 lt!674821) #b01111111111111111111111111111110) (bvsge (x!141459 lt!674821) #b00000000000000000000000000000000) (bvsge (x!141459 lt!674821) #b00000000000000000000000000000000)))))

(assert (=> b!1574697 (=> (not res!1075112) (not e!878208))))

(declare-fun b!1574698 () Bool)

(assert (=> b!1574698 (and (bvsge (index!56480 lt!674821) #b00000000000000000000000000000000) (bvslt (index!56480 lt!674821) (size!51264 _keys!600)))))

(declare-fun res!1075111 () Bool)

(assert (=> b!1574698 (= res!1075111 (= (select (arr!50713 _keys!600) (index!56480 lt!674821)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574698 (=> res!1075111 e!878210)))

(declare-fun b!1574699 () Bool)

(assert (=> b!1574699 (= e!878207 (bvsge (x!141459 lt!674821) #b01111111111111111111111111111110))))

(declare-fun b!1574700 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574700 (= e!878211 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1574701 () Bool)

(assert (=> b!1574701 (= e!878209 (Intermediate!13520 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!165453 () Bool)

(assert (=> d!165453 e!878207))

(declare-fun c!146048 () Bool)

(assert (=> d!165453 (= c!146048 (and ((_ is Intermediate!13520) lt!674821) (undefined!14332 lt!674821)))))

(assert (=> d!165453 (= lt!674821 e!878209)))

(declare-fun c!146047 () Bool)

(assert (=> d!165453 (= c!146047 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165453 (= lt!674820 (select (arr!50713 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!165453 (validMask!0 mask!889)))

(assert (=> d!165453 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674821)))

(declare-fun b!1574702 () Bool)

(assert (=> b!1574702 (= e!878211 (Intermediate!13520 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1574703 () Bool)

(assert (=> b!1574703 (and (bvsge (index!56480 lt!674821) #b00000000000000000000000000000000) (bvslt (index!56480 lt!674821) (size!51264 _keys!600)))))

(declare-fun res!1075110 () Bool)

(assert (=> b!1574703 (= res!1075110 (= (select (arr!50713 _keys!600) (index!56480 lt!674821)) k0!754))))

(assert (=> b!1574703 (=> res!1075110 e!878210)))

(assert (=> b!1574703 (= e!878208 e!878210)))

(assert (= (and d!165453 c!146047) b!1574701))

(assert (= (and d!165453 (not c!146047)) b!1574695))

(assert (= (and b!1574695 c!146046) b!1574702))

(assert (= (and b!1574695 (not c!146046)) b!1574700))

(assert (= (and d!165453 c!146048) b!1574699))

(assert (= (and d!165453 (not c!146048)) b!1574697))

(assert (= (and b!1574697 res!1075112) b!1574703))

(assert (= (and b!1574703 (not res!1075110)) b!1574698))

(assert (= (and b!1574698 (not res!1075111)) b!1574696))

(declare-fun m!1448301 () Bool)

(assert (=> b!1574696 m!1448301))

(assert (=> d!165453 m!1448273))

(declare-fun m!1448303 () Bool)

(assert (=> d!165453 m!1448303))

(assert (=> d!165453 m!1448265))

(assert (=> b!1574698 m!1448301))

(assert (=> b!1574700 m!1448273))

(declare-fun m!1448305 () Bool)

(assert (=> b!1574700 m!1448305))

(assert (=> b!1574700 m!1448305))

(declare-fun m!1448307 () Bool)

(assert (=> b!1574700 m!1448307))

(assert (=> b!1574703 m!1448301))

(assert (=> b!1574640 d!165453))

(declare-fun d!165467 () Bool)

(declare-fun lt!674833 () (_ BitVec 32))

(declare-fun lt!674832 () (_ BitVec 32))

(assert (=> d!165467 (= lt!674833 (bvmul (bvxor lt!674832 (bvlshr lt!674832 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165467 (= lt!674832 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165467 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075113 (let ((h!38266 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141464 (bvmul (bvxor h!38266 (bvlshr h!38266 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141464 (bvlshr x!141464 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075113 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075113 #b00000000000000000000000000000000))))))

(assert (=> d!165467 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!674833 (bvlshr lt!674833 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1574640 d!165467))

(check-sat (not d!165453) (not b!1574700))
(check-sat)
