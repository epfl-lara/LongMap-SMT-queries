; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135732 () Bool)

(assert start!135732)

(declare-fun res!1076142 () Bool)

(declare-fun e!878384 () Bool)

(assert (=> start!135732 (=> (not res!1076142) (not e!878384))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135732 (= res!1076142 (validMask!0 mask!898))))

(assert (=> start!135732 e!878384))

(assert (=> start!135732 true))

(declare-datatypes ((array!105345 0))(
  ( (array!105346 (arr!50815 (Array (_ BitVec 32) (_ BitVec 64))) (size!51365 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105345)

(declare-fun array_inv!39542 (array!105345) Bool)

(assert (=> start!135732 (array_inv!39542 _keys!605)))

(declare-fun b!1574947 () Bool)

(declare-fun res!1076141 () Bool)

(assert (=> b!1574947 (=> (not res!1076141) (not e!878384))))

(assert (=> b!1574947 (= res!1076141 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51365 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574948 () Bool)

(declare-fun res!1076140 () Bool)

(assert (=> b!1574948 (=> (not res!1076140) (not e!878384))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574948 (= res!1076140 (validKeyInArray!0 k!761))))

(declare-fun b!1574949 () Bool)

(declare-datatypes ((SeekEntryResult!13680 0))(
  ( (MissingZero!13680 (index!57118 (_ BitVec 32))) (Found!13680 (index!57119 (_ BitVec 32))) (Intermediate!13680 (undefined!14492 Bool) (index!57120 (_ BitVec 32)) (x!142074 (_ BitVec 32))) (Undefined!13680) (MissingVacant!13680 (index!57121 (_ BitVec 32))) )
))
(declare-fun lt!675004 () SeekEntryResult!13680)

(assert (=> b!1574949 (= e!878384 (and (is-Intermediate!13680 lt!675004) (not (undefined!14492 lt!675004)) (not (= (select (arr!50815 _keys!605) (index!57120 lt!675004)) k!761)) (not (= (select (arr!50815 _keys!605) (index!57120 lt!675004)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50815 _keys!605) (index!57120 lt!675004)) #b1000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!57120 lt!675004) #b00000000000000000000000000000000) (bvsge (index!57120 lt!675004) (bvadd #b00000000000000000000000000000001 mask!898)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105345 (_ BitVec 32)) SeekEntryResult!13680)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574949 (= lt!675004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135732 res!1076142) b!1574947))

(assert (= (and b!1574947 res!1076141) b!1574948))

(assert (= (and b!1574948 res!1076140) b!1574949))

(declare-fun m!1448095 () Bool)

(assert (=> start!135732 m!1448095))

(declare-fun m!1448097 () Bool)

(assert (=> start!135732 m!1448097))

(declare-fun m!1448099 () Bool)

(assert (=> b!1574948 m!1448099))

(declare-fun m!1448101 () Bool)

(assert (=> b!1574949 m!1448101))

(declare-fun m!1448103 () Bool)

(assert (=> b!1574949 m!1448103))

(assert (=> b!1574949 m!1448103))

(declare-fun m!1448105 () Bool)

(assert (=> b!1574949 m!1448105))

(push 1)

(assert (not b!1574949))

(assert (not start!135732))

(assert (not b!1574948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1575013 () Bool)

(declare-fun lt!675021 () SeekEntryResult!13680)

(assert (=> b!1575013 (and (bvsge (index!57120 lt!675021) #b00000000000000000000000000000000) (bvslt (index!57120 lt!675021) (size!51365 _keys!605)))))

(declare-fun res!1076178 () Bool)

(assert (=> b!1575013 (= res!1076178 (= (select (arr!50815 _keys!605) (index!57120 lt!675021)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878426 () Bool)

(assert (=> b!1575013 (=> res!1076178 e!878426)))

(declare-fun b!1575015 () Bool)

(assert (=> b!1575015 (and (bvsge (index!57120 lt!675021) #b00000000000000000000000000000000) (bvslt (index!57120 lt!675021) (size!51365 _keys!605)))))

(declare-fun res!1076179 () Bool)

(assert (=> b!1575015 (= res!1076179 (= (select (arr!50815 _keys!605) (index!57120 lt!675021)) k!761))))

(assert (=> b!1575015 (=> res!1076179 e!878426)))

(declare-fun e!878425 () Bool)

(assert (=> b!1575015 (= e!878425 e!878426)))

(declare-fun b!1575016 () Bool)

(declare-fun e!878424 () Bool)

(assert (=> b!1575016 (= e!878424 e!878425)))

(declare-fun res!1076177 () Bool)

(assert (=> b!1575016 (= res!1076177 (and (is-Intermediate!13680 lt!675021) (not (undefined!14492 lt!675021)) (bvslt (x!142074 lt!675021) #b01111111111111111111111111111110) (bvsge (x!142074 lt!675021) #b00000000000000000000000000000000) (bvsge (x!142074 lt!675021) #b00000000000000000000000000000000)))))

(assert (=> b!1575016 (=> (not res!1076177) (not e!878425))))

(declare-fun b!1575017 () Bool)

(declare-fun e!878422 () SeekEntryResult!13680)

(declare-fun e!878423 () SeekEntryResult!13680)

(assert (=> b!1575017 (= e!878422 e!878423)))

(declare-fun c!145681 () Bool)

(declare-fun lt!675022 () (_ BitVec 64))

(assert (=> b!1575017 (= c!145681 (or (= lt!675022 k!761) (= (bvadd lt!675022 lt!675022) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575018 () Bool)

(assert (=> b!1575018 (= e!878424 (bvsge (x!142074 lt!675021) #b01111111111111111111111111111110))))

(declare-fun b!1575014 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575014 (= e!878423 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun d!165327 () Bool)

(assert (=> d!165327 e!878424))

(declare-fun c!145682 () Bool)

(assert (=> d!165327 (= c!145682 (and (is-Intermediate!13680 lt!675021) (undefined!14492 lt!675021)))))

(assert (=> d!165327 (= lt!675021 e!878422)))

(declare-fun c!145683 () Bool)

(assert (=> d!165327 (= c!145683 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165327 (= lt!675022 (select (arr!50815 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165327 (validMask!0 mask!898)))

(assert (=> d!165327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675021)))

(declare-fun b!1575019 () Bool)

(assert (=> b!1575019 (= e!878423 (Intermediate!13680 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575020 () Bool)

(assert (=> b!1575020 (and (bvsge (index!57120 lt!675021) #b00000000000000000000000000000000) (bvslt (index!57120 lt!675021) (size!51365 _keys!605)))))

(assert (=> b!1575020 (= e!878426 (= (select (arr!50815 _keys!605) (index!57120 lt!675021)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575021 () Bool)

(assert (=> b!1575021 (= e!878422 (Intermediate!13680 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(assert (= (and d!165327 c!145683) b!1575021))

(assert (= (and d!165327 (not c!145683)) b!1575017))

(assert (= (and b!1575017 c!145681) b!1575019))

(assert (= (and b!1575017 (not c!145681)) b!1575014))

(assert (= (and d!165327 c!145682) b!1575018))

(assert (= (and d!165327 (not c!145682)) b!1575016))

(assert (= (and b!1575016 res!1076177) b!1575015))

(assert (= (and b!1575015 (not res!1076179)) b!1575013))

(assert (= (and b!1575013 (not res!1076178)) b!1575020))

(assert (=> d!165327 m!1448103))

(declare-fun m!1448139 () Bool)

(assert (=> d!165327 m!1448139))

(assert (=> d!165327 m!1448095))

(declare-fun m!1448141 () Bool)

(assert (=> b!1575020 m!1448141))

(assert (=> b!1575013 m!1448141))

(assert (=> b!1575015 m!1448141))

(assert (=> b!1575014 m!1448103))

(declare-fun m!1448143 () Bool)

(assert (=> b!1575014 m!1448143))

(assert (=> b!1575014 m!1448143))

(declare-fun m!1448145 () Bool)

(assert (=> b!1575014 m!1448145))

(assert (=> b!1574949 d!165327))

(declare-fun d!165335 () Bool)

(declare-fun lt!675034 () (_ BitVec 32))

(declare-fun lt!675033 () (_ BitVec 32))

(assert (=> d!165335 (= lt!675034 (bvmul (bvxor lt!675033 (bvlshr lt!675033 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165335 (= lt!675033 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165335 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076180 (let ((h!38259 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142080 (bvmul (bvxor h!38259 (bvlshr h!38259 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142080 (bvlshr x!142080 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076180 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076180 #b00000000000000000000000000000000))))))

(assert (=> d!165335 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675034 (bvlshr lt!675034 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1574949 d!165335))

(declare-fun d!165339 () Bool)

(assert (=> d!165339 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135732 d!165339))

(declare-fun d!165345 () Bool)

(assert (=> d!165345 (= (array_inv!39542 _keys!605) (bvsge (size!51365 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135732 d!165345))

(declare-fun d!165347 () Bool)

(assert (=> d!165347 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574948 d!165347))

(push 1)

(assert (not d!165327))

(assert (not b!1575014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

