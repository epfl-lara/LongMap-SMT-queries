; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135700 () Bool)

(assert start!135700)

(declare-fun res!1076103 () Bool)

(declare-fun e!878333 () Bool)

(assert (=> start!135700 (=> (not res!1076103) (not e!878333))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135700 (= res!1076103 (validMask!0 mask!898))))

(assert (=> start!135700 e!878333))

(assert (=> start!135700 true))

(declare-datatypes ((array!105340 0))(
  ( (array!105341 (arr!50814 (Array (_ BitVec 32) (_ BitVec 64))) (size!51364 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105340)

(declare-fun array_inv!39541 (array!105340) Bool)

(assert (=> start!135700 (array_inv!39541 _keys!605)))

(declare-fun b!1574857 () Bool)

(declare-fun res!1076101 () Bool)

(assert (=> b!1574857 (=> (not res!1076101) (not e!878333))))

(assert (=> b!1574857 (= res!1076101 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51364 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574858 () Bool)

(declare-fun res!1076102 () Bool)

(assert (=> b!1574858 (=> (not res!1076102) (not e!878333))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574858 (= res!1076102 (validKeyInArray!0 k!761))))

(declare-fun b!1574859 () Bool)

(declare-datatypes ((SeekEntryResult!13679 0))(
  ( (MissingZero!13679 (index!57114 (_ BitVec 32))) (Found!13679 (index!57115 (_ BitVec 32))) (Intermediate!13679 (undefined!14491 Bool) (index!57116 (_ BitVec 32)) (x!142059 (_ BitVec 32))) (Undefined!13679) (MissingVacant!13679 (index!57117 (_ BitVec 32))) )
))
(declare-fun lt!674965 () SeekEntryResult!13679)

(assert (=> b!1574859 (= e!878333 (and (is-Intermediate!13679 lt!674965) (not (undefined!14491 lt!674965)) (not (= (select (arr!50814 _keys!605) (index!57116 lt!674965)) k!761)) (not (= (select (arr!50814 _keys!605) (index!57116 lt!674965)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50814 _keys!605) (index!57116 lt!674965)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105340 (_ BitVec 32)) SeekEntryResult!13679)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574859 (= lt!674965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135700 res!1076103) b!1574857))

(assert (= (and b!1574857 res!1076101) b!1574858))

(assert (= (and b!1574858 res!1076102) b!1574859))

(declare-fun m!1448059 () Bool)

(assert (=> start!135700 m!1448059))

(declare-fun m!1448061 () Bool)

(assert (=> start!135700 m!1448061))

(declare-fun m!1448063 () Bool)

(assert (=> b!1574858 m!1448063))

(declare-fun m!1448065 () Bool)

(assert (=> b!1574859 m!1448065))

(declare-fun m!1448067 () Bool)

(assert (=> b!1574859 m!1448067))

(assert (=> b!1574859 m!1448067))

(declare-fun m!1448069 () Bool)

(assert (=> b!1574859 m!1448069))

(push 1)

(assert (not b!1574858))

(assert (not b!1574859))

(assert (not start!135700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165295 () Bool)

(assert (=> d!165295 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574858 d!165295))

(declare-fun b!1574886 () Bool)

(declare-fun lt!674974 () SeekEntryResult!13679)

(assert (=> b!1574886 (and (bvsge (index!57116 lt!674974) #b00000000000000000000000000000000) (bvslt (index!57116 lt!674974) (size!51364 _keys!605)))))

(declare-fun e!878352 () Bool)

(assert (=> b!1574886 (= e!878352 (= (select (arr!50814 _keys!605) (index!57116 lt!674974)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1574887 () Bool)

(assert (=> b!1574887 (and (bvsge (index!57116 lt!674974) #b00000000000000000000000000000000) (bvslt (index!57116 lt!674974) (size!51364 _keys!605)))))

(declare-fun res!1076112 () Bool)

(assert (=> b!1574887 (= res!1076112 (= (select (arr!50814 _keys!605) (index!57116 lt!674974)) k!761))))

(assert (=> b!1574887 (=> res!1076112 e!878352)))

(declare-fun e!878351 () Bool)

(assert (=> b!1574887 (= e!878351 e!878352)))

(declare-fun b!1574888 () Bool)

(declare-fun e!878349 () Bool)

(assert (=> b!1574888 (= e!878349 (bvsge (x!142059 lt!674974) #b01111111111111111111111111111110))))

(declare-fun d!165299 () Bool)

(assert (=> d!165299 e!878349))

(declare-fun c!145650 () Bool)

(assert (=> d!165299 (= c!145650 (and (is-Intermediate!13679 lt!674974) (undefined!14491 lt!674974)))))

(declare-fun e!878348 () SeekEntryResult!13679)

(assert (=> d!165299 (= lt!674974 e!878348)))

(declare-fun c!145649 () Bool)

(assert (=> d!165299 (= c!145649 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674975 () (_ BitVec 64))

(assert (=> d!165299 (= lt!674975 (select (arr!50814 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165299 (validMask!0 mask!898)))

(assert (=> d!165299 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!674974)))

(declare-fun b!1574889 () Bool)

(assert (=> b!1574889 (= e!878348 (Intermediate!13679 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574890 () Bool)

(assert (=> b!1574890 (= e!878349 e!878351)))

(declare-fun res!1076110 () Bool)

(assert (=> b!1574890 (= res!1076110 (and (is-Intermediate!13679 lt!674974) (not (undefined!14491 lt!674974)) (bvslt (x!142059 lt!674974) #b01111111111111111111111111111110) (bvsge (x!142059 lt!674974) #b00000000000000000000000000000000) (bvsge (x!142059 lt!674974) #b00000000000000000000000000000000)))))

(assert (=> b!1574890 (=> (not res!1076110) (not e!878351))))

(declare-fun b!1574891 () Bool)

(declare-fun e!878350 () SeekEntryResult!13679)

(assert (=> b!1574891 (= e!878350 (Intermediate!13679 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574892 () Bool)

(assert (=> b!1574892 (= e!878348 e!878350)))

(declare-fun c!145651 () Bool)

(assert (=> b!1574892 (= c!145651 (or (= lt!674975 k!761) (= (bvadd lt!674975 lt!674975) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574893 () Bool)

(assert (=> b!1574893 (and (bvsge (index!57116 lt!674974) #b00000000000000000000000000000000) (bvslt (index!57116 lt!674974) (size!51364 _keys!605)))))

(declare-fun res!1076111 () Bool)

(assert (=> b!1574893 (= res!1076111 (= (select (arr!50814 _keys!605) (index!57116 lt!674974)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574893 (=> res!1076111 e!878352)))

(declare-fun b!1574894 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574894 (= e!878350 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and d!165299 c!145649) b!1574889))

(assert (= (and d!165299 (not c!145649)) b!1574892))

(assert (= (and b!1574892 c!145651) b!1574891))

(assert (= (and b!1574892 (not c!145651)) b!1574894))

(assert (= (and d!165299 c!145650) b!1574888))

(assert (= (and d!165299 (not c!145650)) b!1574890))

(assert (= (and b!1574890 res!1076110) b!1574887))

(assert (= (and b!1574887 (not res!1076112)) b!1574893))

(assert (= (and b!1574893 (not res!1076111)) b!1574886))

(declare-fun m!1448071 () Bool)

(assert (=> b!1574886 m!1448071))

(assert (=> d!165299 m!1448067))

(declare-fun m!1448073 () Bool)

(assert (=> d!165299 m!1448073))

(assert (=> d!165299 m!1448059))

(assert (=> b!1574893 m!1448071))

(assert (=> b!1574887 m!1448071))

(assert (=> b!1574894 m!1448067))

(declare-fun m!1448075 () Bool)

(assert (=> b!1574894 m!1448075))

(assert (=> b!1574894 m!1448075))

(declare-fun m!1448077 () Bool)

(assert (=> b!1574894 m!1448077))

(assert (=> b!1574859 d!165299))

(declare-fun d!165311 () Bool)

(declare-fun lt!674983 () (_ BitVec 32))

(declare-fun lt!674982 () (_ BitVec 32))

(assert (=> d!165311 (= lt!674983 (bvmul (bvxor lt!674982 (bvlshr lt!674982 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165311 (= lt!674982 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165311 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076119 (let ((h!38255 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142062 (bvmul (bvxor h!38255 (bvlshr h!38255 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142062 (bvlshr x!142062 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076119 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076119 #b00000000000000000000000000000000))))))

(assert (=> d!165311 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!674983 (bvlshr lt!674983 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1574859 d!165311))

(declare-fun d!165315 () Bool)

(assert (=> d!165315 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135700 d!165315))

(declare-fun d!165319 () Bool)

(assert (=> d!165319 (= (array_inv!39541 _keys!605) (bvsge (size!51364 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135700 d!165319))

(push 1)

