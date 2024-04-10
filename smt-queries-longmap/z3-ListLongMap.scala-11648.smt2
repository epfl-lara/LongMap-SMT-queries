; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136016 () Bool)

(assert start!136016)

(declare-fun b!1575943 () Bool)

(declare-fun res!1076776 () Bool)

(declare-fun e!878990 () Bool)

(assert (=> b!1575943 (=> (not res!1076776) (not e!878990))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575943 (= res!1076776 (validKeyInArray!0 k0!761))))

(declare-fun b!1575945 () Bool)

(declare-fun e!878988 () Bool)

(declare-datatypes ((SeekEntryResult!13729 0))(
  ( (MissingZero!13729 (index!57314 (_ BitVec 32))) (Found!13729 (index!57315 (_ BitVec 32))) (Intermediate!13729 (undefined!14541 Bool) (index!57316 (_ BitVec 32)) (x!142290 (_ BitVec 32))) (Undefined!13729) (MissingVacant!13729 (index!57317 (_ BitVec 32))) )
))
(declare-fun lt!675400 () SeekEntryResult!13729)

(declare-datatypes ((array!105461 0))(
  ( (array!105462 (arr!50864 (Array (_ BitVec 32) (_ BitVec 64))) (size!51414 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105461)

(get-info :version)

(assert (=> b!1575945 (= e!878988 (and (not ((_ is Undefined!13729) lt!675400)) (not ((_ is Found!13729) lt!675400)) ((_ is MissingZero!13729) lt!675400) (or (bvslt (index!57314 lt!675400) #b00000000000000000000000000000000) (bvsge (index!57314 lt!675400) (size!51414 _keys!605)))))))

(declare-fun lt!675399 () SeekEntryResult!13729)

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105461 (_ BitVec 32)) SeekEntryResult!13729)

(assert (=> b!1575945 (= lt!675400 (seekKeyOrZeroReturnVacant!0 (x!142290 lt!675399) (index!57316 lt!675399) (index!57316 lt!675399) k0!761 _keys!605 mask!898))))

(declare-fun b!1575942 () Bool)

(declare-fun res!1076777 () Bool)

(assert (=> b!1575942 (=> (not res!1076777) (not e!878990))))

(assert (=> b!1575942 (= res!1076777 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51414 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun res!1076775 () Bool)

(assert (=> start!136016 (=> (not res!1076775) (not e!878990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136016 (= res!1076775 (validMask!0 mask!898))))

(assert (=> start!136016 e!878990))

(assert (=> start!136016 true))

(declare-fun array_inv!39591 (array!105461) Bool)

(assert (=> start!136016 (array_inv!39591 _keys!605)))

(declare-fun b!1575944 () Bool)

(assert (=> b!1575944 (= e!878990 e!878988)))

(declare-fun res!1076778 () Bool)

(assert (=> b!1575944 (=> (not res!1076778) (not e!878988))))

(assert (=> b!1575944 (= res!1076778 (and (not (undefined!14541 lt!675399)) ((_ is Intermediate!13729) lt!675399) (not (= (select (arr!50864 _keys!605) (index!57316 lt!675399)) k0!761)) (not (= (select (arr!50864 _keys!605) (index!57316 lt!675399)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50864 _keys!605) (index!57316 lt!675399)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57316 lt!675399) #b00000000000000000000000000000000) (bvslt (index!57316 lt!675399) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105461 (_ BitVec 32)) SeekEntryResult!13729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575944 (= lt!675399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!136016 res!1076775) b!1575942))

(assert (= (and b!1575942 res!1076777) b!1575943))

(assert (= (and b!1575943 res!1076776) b!1575944))

(assert (= (and b!1575944 res!1076778) b!1575945))

(declare-fun m!1448793 () Bool)

(assert (=> b!1575943 m!1448793))

(declare-fun m!1448795 () Bool)

(assert (=> b!1575945 m!1448795))

(declare-fun m!1448797 () Bool)

(assert (=> start!136016 m!1448797))

(declare-fun m!1448799 () Bool)

(assert (=> start!136016 m!1448799))

(declare-fun m!1448801 () Bool)

(assert (=> b!1575944 m!1448801))

(declare-fun m!1448803 () Bool)

(assert (=> b!1575944 m!1448803))

(assert (=> b!1575944 m!1448803))

(declare-fun m!1448805 () Bool)

(assert (=> b!1575944 m!1448805))

(check-sat (not b!1575944) (not b!1575943) (not start!136016) (not b!1575945))
(check-sat)
(get-model)

(declare-fun b!1575976 () Bool)

(declare-fun e!879011 () SeekEntryResult!13729)

(assert (=> b!1575976 (= e!879011 (Intermediate!13729 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575977 () Bool)

(declare-fun e!879010 () Bool)

(declare-fun e!879014 () Bool)

(assert (=> b!1575977 (= e!879010 e!879014)))

(declare-fun res!1076798 () Bool)

(declare-fun lt!675412 () SeekEntryResult!13729)

(assert (=> b!1575977 (= res!1076798 (and ((_ is Intermediate!13729) lt!675412) (not (undefined!14541 lt!675412)) (bvslt (x!142290 lt!675412) #b01111111111111111111111111111110) (bvsge (x!142290 lt!675412) #b00000000000000000000000000000000) (bvsge (x!142290 lt!675412) #b00000000000000000000000000000000)))))

(assert (=> b!1575977 (=> (not res!1076798) (not e!879014))))

(declare-fun b!1575978 () Bool)

(assert (=> b!1575978 (= e!879010 (bvsge (x!142290 lt!675412) #b01111111111111111111111111111110))))

(declare-fun e!879013 () SeekEntryResult!13729)

(declare-fun b!1575979 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575979 (= e!879013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1575980 () Bool)

(assert (=> b!1575980 (and (bvsge (index!57316 lt!675412) #b00000000000000000000000000000000) (bvslt (index!57316 lt!675412) (size!51414 _keys!605)))))

(declare-fun res!1076797 () Bool)

(assert (=> b!1575980 (= res!1076797 (= (select (arr!50864 _keys!605) (index!57316 lt!675412)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879012 () Bool)

(assert (=> b!1575980 (=> res!1076797 e!879012)))

(declare-fun b!1575981 () Bool)

(assert (=> b!1575981 (= e!879013 (Intermediate!13729 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575982 () Bool)

(assert (=> b!1575982 (and (bvsge (index!57316 lt!675412) #b00000000000000000000000000000000) (bvslt (index!57316 lt!675412) (size!51414 _keys!605)))))

(declare-fun res!1076799 () Bool)

(assert (=> b!1575982 (= res!1076799 (= (select (arr!50864 _keys!605) (index!57316 lt!675412)) k0!761))))

(assert (=> b!1575982 (=> res!1076799 e!879012)))

(assert (=> b!1575982 (= e!879014 e!879012)))

(declare-fun d!165543 () Bool)

(assert (=> d!165543 e!879010))

(declare-fun c!145863 () Bool)

(assert (=> d!165543 (= c!145863 (and ((_ is Intermediate!13729) lt!675412) (undefined!14541 lt!675412)))))

(assert (=> d!165543 (= lt!675412 e!879011)))

(declare-fun c!145861 () Bool)

(assert (=> d!165543 (= c!145861 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675411 () (_ BitVec 64))

(assert (=> d!165543 (= lt!675411 (select (arr!50864 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165543 (validMask!0 mask!898)))

(assert (=> d!165543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675412)))

(declare-fun b!1575983 () Bool)

(assert (=> b!1575983 (= e!879011 e!879013)))

(declare-fun c!145862 () Bool)

(assert (=> b!1575983 (= c!145862 (or (= lt!675411 k0!761) (= (bvadd lt!675411 lt!675411) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575984 () Bool)

(assert (=> b!1575984 (and (bvsge (index!57316 lt!675412) #b00000000000000000000000000000000) (bvslt (index!57316 lt!675412) (size!51414 _keys!605)))))

(assert (=> b!1575984 (= e!879012 (= (select (arr!50864 _keys!605) (index!57316 lt!675412)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!165543 c!145861) b!1575976))

(assert (= (and d!165543 (not c!145861)) b!1575983))

(assert (= (and b!1575983 c!145862) b!1575981))

(assert (= (and b!1575983 (not c!145862)) b!1575979))

(assert (= (and d!165543 c!145863) b!1575978))

(assert (= (and d!165543 (not c!145863)) b!1575977))

(assert (= (and b!1575977 res!1076798) b!1575982))

(assert (= (and b!1575982 (not res!1076799)) b!1575980))

(assert (= (and b!1575980 (not res!1076797)) b!1575984))

(assert (=> b!1575979 m!1448803))

(declare-fun m!1448821 () Bool)

(assert (=> b!1575979 m!1448821))

(assert (=> b!1575979 m!1448821))

(declare-fun m!1448823 () Bool)

(assert (=> b!1575979 m!1448823))

(declare-fun m!1448825 () Bool)

(assert (=> b!1575982 m!1448825))

(assert (=> d!165543 m!1448803))

(declare-fun m!1448827 () Bool)

(assert (=> d!165543 m!1448827))

(assert (=> d!165543 m!1448797))

(assert (=> b!1575984 m!1448825))

(assert (=> b!1575980 m!1448825))

(assert (=> b!1575944 d!165543))

(declare-fun d!165549 () Bool)

(declare-fun lt!675422 () (_ BitVec 32))

(declare-fun lt!675421 () (_ BitVec 32))

(assert (=> d!165549 (= lt!675422 (bvmul (bvxor lt!675421 (bvlshr lt!675421 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165549 (= lt!675421 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165549 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076800 (let ((h!38276 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142294 (bvmul (bvxor h!38276 (bvlshr h!38276 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142294 (bvlshr x!142294 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076800 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076800 #b00000000000000000000000000000000))))))

(assert (=> d!165549 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675422 (bvlshr lt!675422 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575944 d!165549))

(declare-fun d!165551 () Bool)

(assert (=> d!165551 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575943 d!165551))

(declare-fun d!165553 () Bool)

(assert (=> d!165553 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136016 d!165553))

(declare-fun d!165557 () Bool)

(assert (=> d!165557 (= (array_inv!39591 _keys!605) (bvsge (size!51414 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136016 d!165557))

(declare-fun b!1576041 () Bool)

(declare-fun c!145893 () Bool)

(declare-fun lt!675440 () (_ BitVec 64))

(assert (=> b!1576041 (= c!145893 (= lt!675440 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879045 () SeekEntryResult!13729)

(declare-fun e!879044 () SeekEntryResult!13729)

(assert (=> b!1576041 (= e!879045 e!879044)))

(declare-fun b!1576042 () Bool)

(declare-fun e!879043 () SeekEntryResult!13729)

(assert (=> b!1576042 (= e!879043 Undefined!13729)))

(declare-fun lt!675439 () SeekEntryResult!13729)

(declare-fun d!165559 () Bool)

(assert (=> d!165559 (and (or ((_ is Undefined!13729) lt!675439) (not ((_ is Found!13729) lt!675439)) (and (bvsge (index!57315 lt!675439) #b00000000000000000000000000000000) (bvslt (index!57315 lt!675439) (size!51414 _keys!605)))) (or ((_ is Undefined!13729) lt!675439) ((_ is Found!13729) lt!675439) (not ((_ is MissingVacant!13729) lt!675439)) (not (= (index!57317 lt!675439) (index!57316 lt!675399))) (and (bvsge (index!57317 lt!675439) #b00000000000000000000000000000000) (bvslt (index!57317 lt!675439) (size!51414 _keys!605)))) (or ((_ is Undefined!13729) lt!675439) (ite ((_ is Found!13729) lt!675439) (= (select (arr!50864 _keys!605) (index!57315 lt!675439)) k0!761) (and ((_ is MissingVacant!13729) lt!675439) (= (index!57317 lt!675439) (index!57316 lt!675399)) (= (select (arr!50864 _keys!605) (index!57317 lt!675439)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!165559 (= lt!675439 e!879043)))

(declare-fun c!145894 () Bool)

(assert (=> d!165559 (= c!145894 (bvsge (x!142290 lt!675399) #b01111111111111111111111111111110))))

(assert (=> d!165559 (= lt!675440 (select (arr!50864 _keys!605) (index!57316 lt!675399)))))

(assert (=> d!165559 (validMask!0 mask!898)))

(assert (=> d!165559 (= (seekKeyOrZeroReturnVacant!0 (x!142290 lt!675399) (index!57316 lt!675399) (index!57316 lt!675399) k0!761 _keys!605 mask!898) lt!675439)))

(declare-fun b!1576043 () Bool)

(assert (=> b!1576043 (= e!879044 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142290 lt!675399) #b00000000000000000000000000000001) (nextIndex!0 (index!57316 lt!675399) (x!142290 lt!675399) mask!898) (index!57316 lt!675399) k0!761 _keys!605 mask!898))))

(declare-fun b!1576044 () Bool)

(assert (=> b!1576044 (= e!879045 (Found!13729 (index!57316 lt!675399)))))

(declare-fun b!1576045 () Bool)

(assert (=> b!1576045 (= e!879044 (MissingVacant!13729 (index!57316 lt!675399)))))

(declare-fun b!1576046 () Bool)

(assert (=> b!1576046 (= e!879043 e!879045)))

(declare-fun c!145892 () Bool)

(assert (=> b!1576046 (= c!145892 (= lt!675440 k0!761))))

(assert (= (and d!165559 c!145894) b!1576042))

(assert (= (and d!165559 (not c!145894)) b!1576046))

(assert (= (and b!1576046 c!145892) b!1576044))

(assert (= (and b!1576046 (not c!145892)) b!1576041))

(assert (= (and b!1576041 c!145893) b!1576045))

(assert (= (and b!1576041 (not c!145893)) b!1576043))

(declare-fun m!1448845 () Bool)

(assert (=> d!165559 m!1448845))

(declare-fun m!1448847 () Bool)

(assert (=> d!165559 m!1448847))

(assert (=> d!165559 m!1448801))

(assert (=> d!165559 m!1448797))

(declare-fun m!1448849 () Bool)

(assert (=> b!1576043 m!1448849))

(assert (=> b!1576043 m!1448849))

(declare-fun m!1448851 () Bool)

(assert (=> b!1576043 m!1448851))

(assert (=> b!1575945 d!165559))

(check-sat (not b!1575979) (not d!165543) (not d!165559) (not b!1576043))
(check-sat)
