; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135696 () Bool)

(assert start!135696)

(declare-fun res!1076085 () Bool)

(declare-fun e!878321 () Bool)

(assert (=> start!135696 (=> (not res!1076085) (not e!878321))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135696 (= res!1076085 (validMask!0 mask!898))))

(assert (=> start!135696 e!878321))

(assert (=> start!135696 true))

(declare-datatypes ((array!105336 0))(
  ( (array!105337 (arr!50812 (Array (_ BitVec 32) (_ BitVec 64))) (size!51362 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105336)

(declare-fun array_inv!39539 (array!105336) Bool)

(assert (=> start!135696 (array_inv!39539 _keys!605)))

(declare-fun b!1574839 () Bool)

(declare-fun res!1076083 () Bool)

(assert (=> b!1574839 (=> (not res!1076083) (not e!878321))))

(assert (=> b!1574839 (= res!1076083 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51362 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574840 () Bool)

(declare-fun res!1076084 () Bool)

(assert (=> b!1574840 (=> (not res!1076084) (not e!878321))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574840 (= res!1076084 (validKeyInArray!0 k!761))))

(declare-datatypes ((SeekEntryResult!13677 0))(
  ( (MissingZero!13677 (index!57106 (_ BitVec 32))) (Found!13677 (index!57107 (_ BitVec 32))) (Intermediate!13677 (undefined!14489 Bool) (index!57108 (_ BitVec 32)) (x!142057 (_ BitVec 32))) (Undefined!13677) (MissingVacant!13677 (index!57109 (_ BitVec 32))) )
))
(declare-fun lt!674959 () SeekEntryResult!13677)

(declare-fun b!1574841 () Bool)

(assert (=> b!1574841 (= e!878321 (and (is-Intermediate!13677 lt!674959) (not (undefined!14489 lt!674959)) (not (= (select (arr!50812 _keys!605) (index!57108 lt!674959)) k!761)) (not (= (select (arr!50812 _keys!605) (index!57108 lt!674959)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50812 _keys!605) (index!57108 lt!674959)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105336 (_ BitVec 32)) SeekEntryResult!13677)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574841 (= lt!674959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135696 res!1076085) b!1574839))

(assert (= (and b!1574839 res!1076083) b!1574840))

(assert (= (and b!1574840 res!1076084) b!1574841))

(declare-fun m!1448035 () Bool)

(assert (=> start!135696 m!1448035))

(declare-fun m!1448037 () Bool)

(assert (=> start!135696 m!1448037))

(declare-fun m!1448039 () Bool)

(assert (=> b!1574840 m!1448039))

(declare-fun m!1448041 () Bool)

(assert (=> b!1574841 m!1448041))

(declare-fun m!1448043 () Bool)

(assert (=> b!1574841 m!1448043))

(assert (=> b!1574841 m!1448043))

(declare-fun m!1448045 () Bool)

(assert (=> b!1574841 m!1448045))

(push 1)

(assert (not start!135696))

(assert (not b!1574841))

(assert (not b!1574840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165293 () Bool)

(assert (=> d!165293 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135696 d!165293))

(declare-fun d!165301 () Bool)

(assert (=> d!165301 (= (array_inv!39539 _keys!605) (bvsge (size!51362 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135696 d!165301))

(declare-fun b!1574905 () Bool)

(declare-fun e!878361 () SeekEntryResult!13677)

(assert (=> b!1574905 (= e!878361 (Intermediate!13677 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574906 () Bool)

(declare-fun e!878362 () Bool)

(declare-fun lt!674977 () SeekEntryResult!13677)

(assert (=> b!1574906 (= e!878362 (bvsge (x!142057 lt!674977) #b01111111111111111111111111111110))))

(declare-fun d!165303 () Bool)

(assert (=> d!165303 e!878362))

(declare-fun c!145656 () Bool)

(assert (=> d!165303 (= c!145656 (and (is-Intermediate!13677 lt!674977) (undefined!14489 lt!674977)))))

(assert (=> d!165303 (= lt!674977 e!878361)))

(declare-fun c!145654 () Bool)

(assert (=> d!165303 (= c!145654 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674976 () (_ BitVec 64))

(assert (=> d!165303 (= lt!674976 (select (arr!50812 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165303 (validMask!0 mask!898)))

(assert (=> d!165303 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!674977)))

(declare-fun b!1574907 () Bool)

(assert (=> b!1574907 (and (bvsge (index!57108 lt!674977) #b00000000000000000000000000000000) (bvslt (index!57108 lt!674977) (size!51362 _keys!605)))))

(declare-fun res!1076122 () Bool)

(assert (=> b!1574907 (= res!1076122 (= (select (arr!50812 _keys!605) (index!57108 lt!674977)) k!761))))

(declare-fun e!878360 () Bool)

(assert (=> b!1574907 (=> res!1076122 e!878360)))

(declare-fun e!878363 () Bool)

(assert (=> b!1574907 (= e!878363 e!878360)))

(declare-fun b!1574908 () Bool)

(assert (=> b!1574908 (and (bvsge (index!57108 lt!674977) #b00000000000000000000000000000000) (bvslt (index!57108 lt!674977) (size!51362 _keys!605)))))

(declare-fun res!1076121 () Bool)

(assert (=> b!1574908 (= res!1076121 (= (select (arr!50812 _keys!605) (index!57108 lt!674977)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574908 (=> res!1076121 e!878360)))

(declare-fun e!878359 () SeekEntryResult!13677)

(declare-fun b!1574909 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574909 (= e!878359 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1574910 () Bool)

(assert (=> b!1574910 (= e!878359 (Intermediate!13677 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574911 () Bool)

(assert (=> b!1574911 (= e!878362 e!878363)))

(declare-fun res!1076120 () Bool)

(assert (=> b!1574911 (= res!1076120 (and (is-Intermediate!13677 lt!674977) (not (undefined!14489 lt!674977)) (bvslt (x!142057 lt!674977) #b01111111111111111111111111111110) (bvsge (x!142057 lt!674977) #b00000000000000000000000000000000) (bvsge (x!142057 lt!674977) #b00000000000000000000000000000000)))))

(assert (=> b!1574911 (=> (not res!1076120) (not e!878363))))

(declare-fun b!1574912 () Bool)

(assert (=> b!1574912 (= e!878361 e!878359)))

(declare-fun c!145655 () Bool)

(assert (=> b!1574912 (= c!145655 (or (= lt!674976 k!761) (= (bvadd lt!674976 lt!674976) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574913 () Bool)

(assert (=> b!1574913 (and (bvsge (index!57108 lt!674977) #b00000000000000000000000000000000) (bvslt (index!57108 lt!674977) (size!51362 _keys!605)))))

(assert (=> b!1574913 (= e!878360 (= (select (arr!50812 _keys!605) (index!57108 lt!674977)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!165303 c!145654) b!1574905))

(assert (= (and d!165303 (not c!145654)) b!1574912))

(assert (= (and b!1574912 c!145655) b!1574910))

(assert (= (and b!1574912 (not c!145655)) b!1574909))

(assert (= (and d!165303 c!145656) b!1574906))

(assert (= (and d!165303 (not c!145656)) b!1574911))

(assert (= (and b!1574911 res!1076120) b!1574907))

(assert (= (and b!1574907 (not res!1076122)) b!1574908))

(assert (= (and b!1574908 (not res!1076121)) b!1574913))

(declare-fun m!1448079 () Bool)

(assert (=> b!1574907 m!1448079))

(assert (=> d!165303 m!1448043))

(declare-fun m!1448081 () Bool)

(assert (=> d!165303 m!1448081))

(assert (=> d!165303 m!1448035))

(assert (=> b!1574909 m!1448043))

(declare-fun m!1448083 () Bool)

(assert (=> b!1574909 m!1448083))

(assert (=> b!1574909 m!1448083))

(declare-fun m!1448085 () Bool)

(assert (=> b!1574909 m!1448085))

(assert (=> b!1574913 m!1448079))

(assert (=> b!1574908 m!1448079))

(assert (=> b!1574841 d!165303))

(declare-fun d!165313 () Bool)

(declare-fun lt!674989 () (_ BitVec 32))

(declare-fun lt!674988 () (_ BitVec 32))

(assert (=> d!165313 (= lt!674989 (bvmul (bvxor lt!674988 (bvlshr lt!674988 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165313 (= lt!674988 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165313 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076123 (let ((h!38256 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142063 (bvmul (bvxor h!38256 (bvlshr h!38256 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142063 (bvlshr x!142063 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076123 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076123 #b00000000000000000000000000000000))))))

(assert (=> d!165313 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!674989 (bvlshr lt!674989 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1574841 d!165313))

(declare-fun d!165317 () Bool)

(assert (=> d!165317 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574840 d!165317))

(push 1)

(assert (not d!165303))

(assert (not b!1574909))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

