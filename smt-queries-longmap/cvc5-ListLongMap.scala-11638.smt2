; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135828 () Bool)

(assert start!135828)

(declare-fun res!1076364 () Bool)

(declare-fun e!878581 () Bool)

(assert (=> start!135828 (=> (not res!1076364) (not e!878581))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135828 (= res!1076364 (validMask!0 mask!898))))

(assert (=> start!135828 e!878581))

(assert (=> start!135828 true))

(declare-datatypes ((array!105387 0))(
  ( (array!105388 (arr!50833 (Array (_ BitVec 32) (_ BitVec 64))) (size!51383 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105387)

(declare-fun array_inv!39560 (array!105387) Bool)

(assert (=> start!135828 (array_inv!39560 _keys!605)))

(declare-fun b!1575271 () Bool)

(declare-fun res!1076363 () Bool)

(assert (=> b!1575271 (=> (not res!1076363) (not e!878581))))

(assert (=> b!1575271 (= res!1076363 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51383 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575272 () Bool)

(declare-fun res!1076362 () Bool)

(assert (=> b!1575272 (=> (not res!1076362) (not e!878581))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575272 (= res!1076362 (validKeyInArray!0 k!761))))

(declare-fun b!1575273 () Bool)

(declare-datatypes ((SeekEntryResult!13698 0))(
  ( (MissingZero!13698 (index!57190 (_ BitVec 32))) (Found!13698 (index!57191 (_ BitVec 32))) (Intermediate!13698 (undefined!14510 Bool) (index!57192 (_ BitVec 32)) (x!142152 (_ BitVec 32))) (Undefined!13698) (MissingVacant!13698 (index!57193 (_ BitVec 32))) )
))
(declare-fun lt!675130 () SeekEntryResult!13698)

(assert (=> b!1575273 (= e!878581 (and (is-Intermediate!13698 lt!675130) (not (undefined!14510 lt!675130)) (= (select (arr!50833 _keys!605) (index!57192 lt!675130)) k!761) (or (bvslt (index!57192 lt!675130) #b00000000000000000000000000000000) (bvsge (index!57192 lt!675130) (size!51383 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105387 (_ BitVec 32)) SeekEntryResult!13698)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575273 (= lt!675130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135828 res!1076364) b!1575271))

(assert (= (and b!1575271 res!1076363) b!1575272))

(assert (= (and b!1575272 res!1076362) b!1575273))

(declare-fun m!1448329 () Bool)

(assert (=> start!135828 m!1448329))

(declare-fun m!1448331 () Bool)

(assert (=> start!135828 m!1448331))

(declare-fun m!1448333 () Bool)

(assert (=> b!1575272 m!1448333))

(declare-fun m!1448335 () Bool)

(assert (=> b!1575273 m!1448335))

(declare-fun m!1448337 () Bool)

(assert (=> b!1575273 m!1448337))

(assert (=> b!1575273 m!1448337))

(declare-fun m!1448339 () Bool)

(assert (=> b!1575273 m!1448339))

(push 1)

(assert (not b!1575272))

(assert (not start!135828))

(assert (not b!1575273))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165401 () Bool)

(assert (=> d!165401 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575272 d!165401))

(declare-fun d!165403 () Bool)

(assert (=> d!165403 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135828 d!165403))

(declare-fun d!165413 () Bool)

(assert (=> d!165413 (= (array_inv!39560 _keys!605) (bvsge (size!51383 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135828 d!165413))

(declare-fun e!878623 () SeekEntryResult!13698)

(declare-fun b!1575337 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575337 (= e!878623 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575339 () Bool)

(declare-fun lt!675148 () SeekEntryResult!13698)

(assert (=> b!1575339 (and (bvsge (index!57192 lt!675148) #b00000000000000000000000000000000) (bvslt (index!57192 lt!675148) (size!51383 _keys!605)))))

(declare-fun res!1076401 () Bool)

(assert (=> b!1575339 (= res!1076401 (= (select (arr!50833 _keys!605) (index!57192 lt!675148)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878621 () Bool)

(assert (=> b!1575339 (=> res!1076401 e!878621)))

(declare-fun b!1575340 () Bool)

(declare-fun e!878624 () Bool)

(declare-fun e!878620 () Bool)

(assert (=> b!1575340 (= e!878624 e!878620)))

(declare-fun res!1076399 () Bool)

(assert (=> b!1575340 (= res!1076399 (and (is-Intermediate!13698 lt!675148) (not (undefined!14510 lt!675148)) (bvslt (x!142152 lt!675148) #b01111111111111111111111111111110) (bvsge (x!142152 lt!675148) #b00000000000000000000000000000000) (bvsge (x!142152 lt!675148) #b00000000000000000000000000000000)))))

(assert (=> b!1575340 (=> (not res!1076399) (not e!878620))))

(declare-fun b!1575341 () Bool)

(declare-fun e!878622 () SeekEntryResult!13698)

(assert (=> b!1575341 (= e!878622 e!878623)))

(declare-fun c!145735 () Bool)

(declare-fun lt!675147 () (_ BitVec 64))

(assert (=> b!1575341 (= c!145735 (or (= lt!675147 k!761) (= (bvadd lt!675147 lt!675147) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!165415 () Bool)

(assert (=> d!165415 e!878624))

(declare-fun c!145736 () Bool)

(assert (=> d!165415 (= c!145736 (and (is-Intermediate!13698 lt!675148) (undefined!14510 lt!675148)))))

(assert (=> d!165415 (= lt!675148 e!878622)))

(declare-fun c!145737 () Bool)

(assert (=> d!165415 (= c!145737 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165415 (= lt!675147 (select (arr!50833 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165415 (validMask!0 mask!898)))

(assert (=> d!165415 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675148)))

(declare-fun b!1575338 () Bool)

(assert (=> b!1575338 (= e!878623 (Intermediate!13698 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575342 () Bool)

(assert (=> b!1575342 (and (bvsge (index!57192 lt!675148) #b00000000000000000000000000000000) (bvslt (index!57192 lt!675148) (size!51383 _keys!605)))))

(assert (=> b!1575342 (= e!878621 (= (select (arr!50833 _keys!605) (index!57192 lt!675148)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575343 () Bool)

(assert (=> b!1575343 (= e!878624 (bvsge (x!142152 lt!675148) #b01111111111111111111111111111110))))

(declare-fun b!1575344 () Bool)

(assert (=> b!1575344 (= e!878622 (Intermediate!13698 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575345 () Bool)

(assert (=> b!1575345 (and (bvsge (index!57192 lt!675148) #b00000000000000000000000000000000) (bvslt (index!57192 lt!675148) (size!51383 _keys!605)))))

(declare-fun res!1076400 () Bool)

(assert (=> b!1575345 (= res!1076400 (= (select (arr!50833 _keys!605) (index!57192 lt!675148)) k!761))))

(assert (=> b!1575345 (=> res!1076400 e!878621)))

(assert (=> b!1575345 (= e!878620 e!878621)))

(assert (= (and d!165415 c!145737) b!1575344))

(assert (= (and d!165415 (not c!145737)) b!1575341))

(assert (= (and b!1575341 c!145735) b!1575338))

(assert (= (and b!1575341 (not c!145735)) b!1575337))

(assert (= (and d!165415 c!145736) b!1575343))

(assert (= (and d!165415 (not c!145736)) b!1575340))

(assert (= (and b!1575340 res!1076399) b!1575345))

(assert (= (and b!1575345 (not res!1076400)) b!1575339))

(assert (= (and b!1575339 (not res!1076401)) b!1575342))

(assert (=> d!165415 m!1448337))

(declare-fun m!1448373 () Bool)

(assert (=> d!165415 m!1448373))

(assert (=> d!165415 m!1448329))

(declare-fun m!1448375 () Bool)

(assert (=> b!1575339 m!1448375))

(assert (=> b!1575345 m!1448375))

(assert (=> b!1575342 m!1448375))

(assert (=> b!1575337 m!1448337))

(declare-fun m!1448377 () Bool)

(assert (=> b!1575337 m!1448377))

(assert (=> b!1575337 m!1448377))

(declare-fun m!1448379 () Bool)

(assert (=> b!1575337 m!1448379))

(assert (=> b!1575273 d!165415))

(declare-fun d!165423 () Bool)

(declare-fun lt!675164 () (_ BitVec 32))

(declare-fun lt!675163 () (_ BitVec 32))

(assert (=> d!165423 (= lt!675164 (bvmul (bvxor lt!675163 (bvlshr lt!675163 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165423 (= lt!675163 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165423 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076402 (let ((h!38265 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142158 (bvmul (bvxor h!38265 (bvlshr h!38265 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142158 (bvlshr x!142158 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076402 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076402 #b00000000000000000000000000000000))))))

(assert (=> d!165423 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675164 (bvlshr lt!675164 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575273 d!165423))

(push 1)

(assert (not d!165415))

(assert (not b!1575337))

(check-sat)

(pop 1)

(push 1)

(check-sat)

