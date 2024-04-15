; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135792 () Bool)

(assert start!135792)

(declare-fun res!1076242 () Bool)

(declare-fun e!878390 () Bool)

(assert (=> start!135792 (=> (not res!1076242) (not e!878390))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135792 (= res!1076242 (validMask!0 mask!898))))

(assert (=> start!135792 e!878390))

(assert (=> start!135792 true))

(declare-datatypes ((array!105319 0))(
  ( (array!105320 (arr!50799 (Array (_ BitVec 32) (_ BitVec 64))) (size!51351 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105319)

(declare-fun array_inv!39735 (array!105319) Bool)

(assert (=> start!135792 (array_inv!39735 _keys!605)))

(declare-fun b!1574967 () Bool)

(declare-fun res!1076244 () Bool)

(assert (=> b!1574967 (=> (not res!1076244) (not e!878390))))

(assert (=> b!1574967 (= res!1076244 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51351 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574968 () Bool)

(declare-fun res!1076243 () Bool)

(assert (=> b!1574968 (=> (not res!1076243) (not e!878390))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574968 (= res!1076243 (validKeyInArray!0 k!761))))

(declare-fun b!1574969 () Bool)

(declare-datatypes ((SeekEntryResult!13699 0))(
  ( (MissingZero!13699 (index!57194 (_ BitVec 32))) (Found!13699 (index!57195 (_ BitVec 32))) (Intermediate!13699 (undefined!14511 Bool) (index!57196 (_ BitVec 32)) (x!142148 (_ BitVec 32))) (Undefined!13699) (MissingVacant!13699 (index!57197 (_ BitVec 32))) )
))
(declare-fun lt!674847 () SeekEntryResult!13699)

(assert (=> b!1574969 (= e!878390 (and (is-Intermediate!13699 lt!674847) (not (undefined!14511 lt!674847)) (= (select (arr!50799 _keys!605) (index!57196 lt!674847)) k!761) (or (bvslt (index!57196 lt!674847) #b00000000000000000000000000000000) (bvsge (index!57196 lt!674847) (size!51351 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105319 (_ BitVec 32)) SeekEntryResult!13699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574969 (= lt!674847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135792 res!1076242) b!1574967))

(assert (= (and b!1574967 res!1076244) b!1574968))

(assert (= (and b!1574968 res!1076243) b!1574969))

(declare-fun m!1447449 () Bool)

(assert (=> start!135792 m!1447449))

(declare-fun m!1447451 () Bool)

(assert (=> start!135792 m!1447451))

(declare-fun m!1447453 () Bool)

(assert (=> b!1574968 m!1447453))

(declare-fun m!1447455 () Bool)

(assert (=> b!1574969 m!1447455))

(declare-fun m!1447457 () Bool)

(assert (=> b!1574969 m!1447457))

(assert (=> b!1574969 m!1447457))

(declare-fun m!1447459 () Bool)

(assert (=> b!1574969 m!1447459))

(push 1)

(assert (not b!1574969))

(assert (not start!135792))

(assert (not b!1574968))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1575051 () Bool)

(declare-fun e!878437 () Bool)

(declare-fun e!878439 () Bool)

(assert (=> b!1575051 (= e!878437 e!878439)))

(declare-fun res!1076281 () Bool)

(declare-fun lt!674873 () SeekEntryResult!13699)

(assert (=> b!1575051 (= res!1076281 (and (is-Intermediate!13699 lt!674873) (not (undefined!14511 lt!674873)) (bvslt (x!142148 lt!674873) #b01111111111111111111111111111110) (bvsge (x!142148 lt!674873) #b00000000000000000000000000000000) (bvsge (x!142148 lt!674873) #b00000000000000000000000000000000)))))

(assert (=> b!1575051 (=> (not res!1076281) (not e!878439))))

(declare-fun b!1575052 () Bool)

(assert (=> b!1575052 (and (bvsge (index!57196 lt!674873) #b00000000000000000000000000000000) (bvslt (index!57196 lt!674873) (size!51351 _keys!605)))))

(declare-fun e!878440 () Bool)

(assert (=> b!1575052 (= e!878440 (= (select (arr!50799 _keys!605) (index!57196 lt!674873)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575053 () Bool)

(assert (=> b!1575053 (= e!878437 (bvsge (x!142148 lt!674873) #b01111111111111111111111111111110))))

(declare-fun b!1575054 () Bool)

(declare-fun e!878441 () SeekEntryResult!13699)

(assert (=> b!1575054 (= e!878441 (Intermediate!13699 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575055 () Bool)

(declare-fun e!878438 () SeekEntryResult!13699)

(assert (=> b!1575055 (= e!878441 e!878438)))

(declare-fun c!145655 () Bool)

(declare-fun lt!674874 () (_ BitVec 64))

(assert (=> b!1575055 (= c!145655 (or (= lt!674874 k!761) (= (bvadd lt!674874 lt!674874) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575056 () Bool)

(assert (=> b!1575056 (= e!878438 (Intermediate!13699 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575057 () Bool)

(assert (=> b!1575057 (and (bvsge (index!57196 lt!674873) #b00000000000000000000000000000000) (bvslt (index!57196 lt!674873) (size!51351 _keys!605)))))

(declare-fun res!1076280 () Bool)

(assert (=> b!1575057 (= res!1076280 (= (select (arr!50799 _keys!605) (index!57196 lt!674873)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575057 (=> res!1076280 e!878440)))

(declare-fun d!165163 () Bool)

(assert (=> d!165163 e!878437))

(declare-fun c!145657 () Bool)

(assert (=> d!165163 (= c!145657 (and (is-Intermediate!13699 lt!674873) (undefined!14511 lt!674873)))))

(assert (=> d!165163 (= lt!674873 e!878441)))

(declare-fun c!145656 () Bool)

(assert (=> d!165163 (= c!145656 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165163 (= lt!674874 (select (arr!50799 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165163 (validMask!0 mask!898)))

(assert (=> d!165163 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!674873)))

(declare-fun b!1575058 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575058 (= e!878438 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575059 () Bool)

(assert (=> b!1575059 (and (bvsge (index!57196 lt!674873) #b00000000000000000000000000000000) (bvslt (index!57196 lt!674873) (size!51351 _keys!605)))))

(declare-fun res!1076282 () Bool)

(assert (=> b!1575059 (= res!1076282 (= (select (arr!50799 _keys!605) (index!57196 lt!674873)) k!761))))

(assert (=> b!1575059 (=> res!1076282 e!878440)))

(assert (=> b!1575059 (= e!878439 e!878440)))

(assert (= (and d!165163 c!145656) b!1575054))

(assert (= (and d!165163 (not c!145656)) b!1575055))

(assert (= (and b!1575055 c!145655) b!1575056))

(assert (= (and b!1575055 (not c!145655)) b!1575058))

(assert (= (and d!165163 c!145657) b!1575053))

(assert (= (and d!165163 (not c!145657)) b!1575051))

(assert (= (and b!1575051 res!1076281) b!1575059))

(assert (= (and b!1575059 (not res!1076282)) b!1575057))

(assert (= (and b!1575057 (not res!1076280)) b!1575052))

(declare-fun m!1447489 () Bool)

(assert (=> b!1575052 m!1447489))

(assert (=> d!165163 m!1447457))

(declare-fun m!1447491 () Bool)

(assert (=> d!165163 m!1447491))

(assert (=> d!165163 m!1447449))

(assert (=> b!1575059 m!1447489))

(assert (=> b!1575057 m!1447489))

(assert (=> b!1575058 m!1447457))

(declare-fun m!1447493 () Bool)

(assert (=> b!1575058 m!1447493))

(assert (=> b!1575058 m!1447493))

(declare-fun m!1447495 () Bool)

(assert (=> b!1575058 m!1447495))

(assert (=> b!1574969 d!165163))

(declare-fun d!165171 () Bool)

(declare-fun lt!674886 () (_ BitVec 32))

(declare-fun lt!674885 () (_ BitVec 32))

(assert (=> d!165171 (= lt!674886 (bvmul (bvxor lt!674885 (bvlshr lt!674885 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165171 (= lt!674885 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165171 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076283 (let ((h!38308 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142155 (bvmul (bvxor h!38308 (bvlshr h!38308 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142155 (bvlshr x!142155 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076283 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076283 #b00000000000000000000000000000000))))))

(assert (=> d!165171 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!674886 (bvlshr lt!674886 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1574969 d!165171))

(declare-fun d!165175 () Bool)

(assert (=> d!165175 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135792 d!165175))

(declare-fun d!165181 () Bool)

(assert (=> d!165181 (= (array_inv!39735 _keys!605) (bvsge (size!51351 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135792 d!165181))

(declare-fun d!165183 () Bool)

(assert (=> d!165183 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574968 d!165183))

(push 1)

(assert (not b!1575058))

(assert (not d!165163))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

