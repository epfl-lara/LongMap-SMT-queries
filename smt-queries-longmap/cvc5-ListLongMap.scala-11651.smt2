; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136106 () Bool)

(assert start!136106)

(declare-fun res!1076849 () Bool)

(declare-fun e!879089 () Bool)

(assert (=> start!136106 (=> (not res!1076849) (not e!879089))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136106 (= res!1076849 (validMask!0 mask!898))))

(assert (=> start!136106 e!879089))

(assert (=> start!136106 true))

(declare-datatypes ((array!105420 0))(
  ( (array!105421 (arr!50839 (Array (_ BitVec 32) (_ BitVec 64))) (size!51391 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105420)

(declare-fun array_inv!39775 (array!105420) Bool)

(assert (=> start!136106 (array_inv!39775 _keys!605)))

(declare-fun b!1576146 () Bool)

(declare-fun res!1076850 () Bool)

(assert (=> b!1576146 (=> (not res!1076850) (not e!879089))))

(assert (=> b!1576146 (= res!1076850 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51391 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576147 () Bool)

(declare-fun res!1076848 () Bool)

(assert (=> b!1576147 (=> (not res!1076848) (not e!879089))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576147 (= res!1076848 (validKeyInArray!0 k!761))))

(declare-fun b!1576148 () Bool)

(declare-fun lt!675336 () Bool)

(declare-datatypes ((SeekEntryResult!13739 0))(
  ( (MissingZero!13739 (index!57354 (_ BitVec 32))) (Found!13739 (index!57355 (_ BitVec 32))) (Intermediate!13739 (undefined!14551 Bool) (index!57356 (_ BitVec 32)) (x!142346 (_ BitVec 32))) (Undefined!13739) (MissingVacant!13739 (index!57357 (_ BitVec 32))) )
))
(declare-fun lt!675335 () SeekEntryResult!13739)

(assert (=> b!1576148 (= e!879089 (and (or lt!675336 (not (undefined!14551 lt!675335))) (or lt!675336 (undefined!14551 lt!675335))))))

(assert (=> b!1576148 (= lt!675336 (not (is-Intermediate!13739 lt!675335)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105420 (_ BitVec 32)) SeekEntryResult!13739)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576148 (= lt!675335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136106 res!1076849) b!1576146))

(assert (= (and b!1576146 res!1076850) b!1576147))

(assert (= (and b!1576147 res!1076848) b!1576148))

(declare-fun m!1448195 () Bool)

(assert (=> start!136106 m!1448195))

(declare-fun m!1448197 () Bool)

(assert (=> start!136106 m!1448197))

(declare-fun m!1448199 () Bool)

(assert (=> b!1576147 m!1448199))

(declare-fun m!1448201 () Bool)

(assert (=> b!1576148 m!1448201))

(assert (=> b!1576148 m!1448201))

(declare-fun m!1448203 () Bool)

(assert (=> b!1576148 m!1448203))

(push 1)

(assert (not b!1576148))

(assert (not b!1576147))

(assert (not start!136106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1576212 () Bool)

(declare-fun lt!675352 () SeekEntryResult!13739)

(assert (=> b!1576212 (and (bvsge (index!57356 lt!675352) #b00000000000000000000000000000000) (bvslt (index!57356 lt!675352) (size!51391 _keys!605)))))

(declare-fun res!1076875 () Bool)

(assert (=> b!1576212 (= res!1076875 (= (select (arr!50839 _keys!605) (index!57356 lt!675352)) k!761))))

(declare-fun e!879127 () Bool)

(assert (=> b!1576212 (=> res!1076875 e!879127)))

(declare-fun e!879128 () Bool)

(assert (=> b!1576212 (= e!879128 e!879127)))

(declare-fun b!1576214 () Bool)

(declare-fun e!879125 () SeekEntryResult!13739)

(assert (=> b!1576214 (= e!879125 (Intermediate!13739 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576215 () Bool)

(assert (=> b!1576215 (and (bvsge (index!57356 lt!675352) #b00000000000000000000000000000000) (bvslt (index!57356 lt!675352) (size!51391 _keys!605)))))

(declare-fun res!1076873 () Bool)

(assert (=> b!1576215 (= res!1076873 (= (select (arr!50839 _keys!605) (index!57356 lt!675352)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576215 (=> res!1076873 e!879127)))

(declare-fun b!1576216 () Bool)

(assert (=> b!1576216 (and (bvsge (index!57356 lt!675352) #b00000000000000000000000000000000) (bvslt (index!57356 lt!675352) (size!51391 _keys!605)))))

(assert (=> b!1576216 (= e!879127 (= (select (arr!50839 _keys!605) (index!57356 lt!675352)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576217 () Bool)

(declare-fun e!879126 () SeekEntryResult!13739)

(assert (=> b!1576217 (= e!879126 (Intermediate!13739 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576218 () Bool)

(declare-fun e!879129 () Bool)

(assert (=> b!1576218 (= e!879129 (bvsge (x!142346 lt!675352) #b01111111111111111111111111111110))))

(declare-fun d!165417 () Bool)

(assert (=> d!165417 e!879129))

(declare-fun c!145950 () Bool)

(assert (=> d!165417 (= c!145950 (and (is-Intermediate!13739 lt!675352) (undefined!14551 lt!675352)))))

(assert (=> d!165417 (= lt!675352 e!879125)))

(declare-fun c!145949 () Bool)

(assert (=> d!165417 (= c!145949 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675351 () (_ BitVec 64))

(assert (=> d!165417 (= lt!675351 (select (arr!50839 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165417 (validMask!0 mask!898)))

(assert (=> d!165417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675352)))

(declare-fun b!1576213 () Bool)

(assert (=> b!1576213 (= e!879125 e!879126)))

(declare-fun c!145951 () Bool)

(assert (=> b!1576213 (= c!145951 (or (= lt!675351 k!761) (= (bvadd lt!675351 lt!675351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576219 () Bool)

(assert (=> b!1576219 (= e!879129 e!879128)))

(declare-fun res!1076874 () Bool)

(assert (=> b!1576219 (= res!1076874 (and (is-Intermediate!13739 lt!675352) (not (undefined!14551 lt!675352)) (bvslt (x!142346 lt!675352) #b01111111111111111111111111111110) (bvsge (x!142346 lt!675352) #b00000000000000000000000000000000) (bvsge (x!142346 lt!675352) #b00000000000000000000000000000000)))))

(assert (=> b!1576219 (=> (not res!1076874) (not e!879128))))

(declare-fun b!1576220 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576220 (= e!879126 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and d!165417 c!145949) b!1576214))

(assert (= (and d!165417 (not c!145949)) b!1576213))

(assert (= (and b!1576213 c!145951) b!1576217))

(assert (= (and b!1576213 (not c!145951)) b!1576220))

(assert (= (and d!165417 c!145950) b!1576218))

(assert (= (and d!165417 (not c!145950)) b!1576219))

(assert (= (and b!1576219 res!1076874) b!1576212))

(assert (= (and b!1576212 (not res!1076875)) b!1576215))

(assert (= (and b!1576215 (not res!1076873)) b!1576216))

(declare-fun m!1448213 () Bool)

(assert (=> b!1576216 m!1448213))

(assert (=> d!165417 m!1448201))

(declare-fun m!1448215 () Bool)

(assert (=> d!165417 m!1448215))

(assert (=> d!165417 m!1448195))

(assert (=> b!1576212 m!1448213))

(assert (=> b!1576220 m!1448201))

(declare-fun m!1448217 () Bool)

(assert (=> b!1576220 m!1448217))

(assert (=> b!1576220 m!1448217))

(declare-fun m!1448219 () Bool)

(assert (=> b!1576220 m!1448219))

(assert (=> b!1576215 m!1448213))

(assert (=> b!1576148 d!165417))

(declare-fun d!165423 () Bool)

(declare-fun lt!675366 () (_ BitVec 32))

(declare-fun lt!675365 () (_ BitVec 32))

(assert (=> d!165423 (= lt!675366 (bvmul (bvxor lt!675365 (bvlshr lt!675365 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165423 (= lt!675365 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165423 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076879 (let ((h!38328 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142351 (bvmul (bvxor h!38328 (bvlshr h!38328 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142351 (bvlshr x!142351 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076879 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076879 #b00000000000000000000000000000000))))))

(assert (=> d!165423 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675366 (bvlshr lt!675366 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576148 d!165423))

(declare-fun d!165431 () Bool)

(assert (=> d!165431 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576147 d!165431))

(declare-fun d!165433 () Bool)

(assert (=> d!165433 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136106 d!165433))

(declare-fun d!165441 () Bool)

(assert (=> d!165441 (= (array_inv!39775 _keys!605) (bvsge (size!51391 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136106 d!165441))

(push 1)

(assert (not d!165417))

(assert (not b!1576220))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

