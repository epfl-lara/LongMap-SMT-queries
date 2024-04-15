; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136018 () Bool)

(assert start!136018)

(declare-fun res!1076700 () Bool)

(declare-fun e!878881 () Bool)

(assert (=> start!136018 (=> (not res!1076700) (not e!878881))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136018 (= res!1076700 (validMask!0 mask!898))))

(assert (=> start!136018 e!878881))

(assert (=> start!136018 true))

(declare-datatypes ((array!105398 0))(
  ( (array!105399 (arr!50831 (Array (_ BitVec 32) (_ BitVec 64))) (size!51383 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105398)

(declare-fun array_inv!39767 (array!105398) Bool)

(assert (=> start!136018 (array_inv!39767 _keys!605)))

(declare-fun b!1575789 () Bool)

(declare-fun res!1076701 () Bool)

(assert (=> b!1575789 (=> (not res!1076701) (not e!878881))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575789 (= res!1076701 (validKeyInArray!0 k0!761))))

(declare-fun b!1575791 () Bool)

(declare-fun e!878880 () Bool)

(declare-datatypes ((SeekEntryResult!13731 0))(
  ( (MissingZero!13731 (index!57322 (_ BitVec 32))) (Found!13731 (index!57323 (_ BitVec 32))) (Intermediate!13731 (undefined!14543 Bool) (index!57324 (_ BitVec 32)) (x!142304 (_ BitVec 32))) (Undefined!13731) (MissingVacant!13731 (index!57325 (_ BitVec 32))) )
))
(declare-fun lt!675180 () SeekEntryResult!13731)

(get-info :version)

(assert (=> b!1575791 (= e!878880 (and (not ((_ is Undefined!13731) lt!675180)) (not ((_ is Found!13731) lt!675180)) (not ((_ is MissingZero!13731) lt!675180)) ((_ is MissingVacant!13731) lt!675180) (or (bvslt (index!57325 lt!675180) #b00000000000000000000000000000000) (bvsge (index!57325 lt!675180) (size!51383 _keys!605)))))))

(declare-fun lt!675179 () SeekEntryResult!13731)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105398 (_ BitVec 32)) SeekEntryResult!13731)

(assert (=> b!1575791 (= lt!675180 (seekKeyOrZeroReturnVacant!0 (x!142304 lt!675179) (index!57324 lt!675179) (index!57324 lt!675179) k0!761 _keys!605 mask!898))))

(declare-fun b!1575788 () Bool)

(declare-fun res!1076703 () Bool)

(assert (=> b!1575788 (=> (not res!1076703) (not e!878881))))

(assert (=> b!1575788 (= res!1076703 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51383 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575790 () Bool)

(assert (=> b!1575790 (= e!878881 e!878880)))

(declare-fun res!1076702 () Bool)

(assert (=> b!1575790 (=> (not res!1076702) (not e!878880))))

(assert (=> b!1575790 (= res!1076702 (and (not (undefined!14543 lt!675179)) ((_ is Intermediate!13731) lt!675179) (not (= (select (arr!50831 _keys!605) (index!57324 lt!675179)) k0!761)) (not (= (select (arr!50831 _keys!605) (index!57324 lt!675179)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50831 _keys!605) (index!57324 lt!675179)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57324 lt!675179) #b00000000000000000000000000000000) (bvslt (index!57324 lt!675179) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105398 (_ BitVec 32)) SeekEntryResult!13731)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575790 (= lt!675179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!136018 res!1076700) b!1575788))

(assert (= (and b!1575788 res!1076703) b!1575789))

(assert (= (and b!1575789 res!1076701) b!1575790))

(assert (= (and b!1575790 res!1076702) b!1575791))

(declare-fun m!1447977 () Bool)

(assert (=> start!136018 m!1447977))

(declare-fun m!1447979 () Bool)

(assert (=> start!136018 m!1447979))

(declare-fun m!1447981 () Bool)

(assert (=> b!1575789 m!1447981))

(declare-fun m!1447983 () Bool)

(assert (=> b!1575791 m!1447983))

(declare-fun m!1447985 () Bool)

(assert (=> b!1575790 m!1447985))

(declare-fun m!1447987 () Bool)

(assert (=> b!1575790 m!1447987))

(assert (=> b!1575790 m!1447987))

(declare-fun m!1447989 () Bool)

(assert (=> b!1575790 m!1447989))

(check-sat (not b!1575791) (not b!1575790) (not b!1575789) (not start!136018))
(check-sat)
(get-model)

(declare-fun b!1575828 () Bool)

(declare-fun c!145827 () Bool)

(declare-fun lt!675197 () (_ BitVec 64))

(assert (=> b!1575828 (= c!145827 (= lt!675197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878907 () SeekEntryResult!13731)

(declare-fun e!878909 () SeekEntryResult!13731)

(assert (=> b!1575828 (= e!878907 e!878909)))

(declare-fun b!1575829 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575829 (= e!878909 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142304 lt!675179) #b00000000000000000000000000000001) (nextIndex!0 (index!57324 lt!675179) (x!142304 lt!675179) mask!898) (index!57324 lt!675179) k0!761 _keys!605 mask!898))))

(declare-fun b!1575831 () Bool)

(assert (=> b!1575831 (= e!878909 (MissingVacant!13731 (index!57324 lt!675179)))))

(declare-fun lt!675198 () SeekEntryResult!13731)

(declare-fun d!165339 () Bool)

(assert (=> d!165339 (and (or ((_ is Undefined!13731) lt!675198) (not ((_ is Found!13731) lt!675198)) (and (bvsge (index!57323 lt!675198) #b00000000000000000000000000000000) (bvslt (index!57323 lt!675198) (size!51383 _keys!605)))) (or ((_ is Undefined!13731) lt!675198) ((_ is Found!13731) lt!675198) (not ((_ is MissingVacant!13731) lt!675198)) (not (= (index!57325 lt!675198) (index!57324 lt!675179))) (and (bvsge (index!57325 lt!675198) #b00000000000000000000000000000000) (bvslt (index!57325 lt!675198) (size!51383 _keys!605)))) (or ((_ is Undefined!13731) lt!675198) (ite ((_ is Found!13731) lt!675198) (= (select (arr!50831 _keys!605) (index!57323 lt!675198)) k0!761) (and ((_ is MissingVacant!13731) lt!675198) (= (index!57325 lt!675198) (index!57324 lt!675179)) (= (select (arr!50831 _keys!605) (index!57325 lt!675198)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!878908 () SeekEntryResult!13731)

(assert (=> d!165339 (= lt!675198 e!878908)))

(declare-fun c!145828 () Bool)

(assert (=> d!165339 (= c!145828 (bvsge (x!142304 lt!675179) #b01111111111111111111111111111110))))

(assert (=> d!165339 (= lt!675197 (select (arr!50831 _keys!605) (index!57324 lt!675179)))))

(assert (=> d!165339 (validMask!0 mask!898)))

(assert (=> d!165339 (= (seekKeyOrZeroReturnVacant!0 (x!142304 lt!675179) (index!57324 lt!675179) (index!57324 lt!675179) k0!761 _keys!605 mask!898) lt!675198)))

(declare-fun b!1575830 () Bool)

(assert (=> b!1575830 (= e!878907 (Found!13731 (index!57324 lt!675179)))))

(declare-fun b!1575832 () Bool)

(assert (=> b!1575832 (= e!878908 Undefined!13731)))

(declare-fun b!1575833 () Bool)

(assert (=> b!1575833 (= e!878908 e!878907)))

(declare-fun c!145826 () Bool)

(assert (=> b!1575833 (= c!145826 (= lt!675197 k0!761))))

(assert (= (and d!165339 c!145828) b!1575832))

(assert (= (and d!165339 (not c!145828)) b!1575833))

(assert (= (and b!1575833 c!145826) b!1575830))

(assert (= (and b!1575833 (not c!145826)) b!1575828))

(assert (= (and b!1575828 c!145827) b!1575831))

(assert (= (and b!1575828 (not c!145827)) b!1575829))

(declare-fun m!1448019 () Bool)

(assert (=> b!1575829 m!1448019))

(assert (=> b!1575829 m!1448019))

(declare-fun m!1448021 () Bool)

(assert (=> b!1575829 m!1448021))

(declare-fun m!1448023 () Bool)

(assert (=> d!165339 m!1448023))

(declare-fun m!1448025 () Bool)

(assert (=> d!165339 m!1448025))

(assert (=> d!165339 m!1447985))

(assert (=> d!165339 m!1447977))

(assert (=> b!1575791 d!165339))

(declare-fun b!1575870 () Bool)

(declare-fun e!878929 () Bool)

(declare-fun e!878932 () Bool)

(assert (=> b!1575870 (= e!878929 e!878932)))

(declare-fun res!1076735 () Bool)

(declare-fun lt!675209 () SeekEntryResult!13731)

(assert (=> b!1575870 (= res!1076735 (and ((_ is Intermediate!13731) lt!675209) (not (undefined!14543 lt!675209)) (bvslt (x!142304 lt!675209) #b01111111111111111111111111111110) (bvsge (x!142304 lt!675209) #b00000000000000000000000000000000) (bvsge (x!142304 lt!675209) #b00000000000000000000000000000000)))))

(assert (=> b!1575870 (=> (not res!1076735) (not e!878932))))

(declare-fun b!1575871 () Bool)

(declare-fun e!878930 () SeekEntryResult!13731)

(assert (=> b!1575871 (= e!878930 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1575872 () Bool)

(assert (=> b!1575872 (and (bvsge (index!57324 lt!675209) #b00000000000000000000000000000000) (bvslt (index!57324 lt!675209) (size!51383 _keys!605)))))

(declare-fun res!1076734 () Bool)

(assert (=> b!1575872 (= res!1076734 (= (select (arr!50831 _keys!605) (index!57324 lt!675209)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878933 () Bool)

(assert (=> b!1575872 (=> res!1076734 e!878933)))

(declare-fun b!1575873 () Bool)

(declare-fun e!878931 () SeekEntryResult!13731)

(assert (=> b!1575873 (= e!878931 e!878930)))

(declare-fun c!145845 () Bool)

(declare-fun lt!675210 () (_ BitVec 64))

(assert (=> b!1575873 (= c!145845 (or (= lt!675210 k0!761) (= (bvadd lt!675210 lt!675210) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575874 () Bool)

(assert (=> b!1575874 (and (bvsge (index!57324 lt!675209) #b00000000000000000000000000000000) (bvslt (index!57324 lt!675209) (size!51383 _keys!605)))))

(declare-fun res!1076736 () Bool)

(assert (=> b!1575874 (= res!1076736 (= (select (arr!50831 _keys!605) (index!57324 lt!675209)) k0!761))))

(assert (=> b!1575874 (=> res!1076736 e!878933)))

(assert (=> b!1575874 (= e!878932 e!878933)))

(declare-fun b!1575875 () Bool)

(assert (=> b!1575875 (and (bvsge (index!57324 lt!675209) #b00000000000000000000000000000000) (bvslt (index!57324 lt!675209) (size!51383 _keys!605)))))

(assert (=> b!1575875 (= e!878933 (= (select (arr!50831 _keys!605) (index!57324 lt!675209)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575876 () Bool)

(assert (=> b!1575876 (= e!878929 (bvsge (x!142304 lt!675209) #b01111111111111111111111111111110))))

(declare-fun b!1575877 () Bool)

(assert (=> b!1575877 (= e!878931 (Intermediate!13731 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun d!165343 () Bool)

(assert (=> d!165343 e!878929))

(declare-fun c!145846 () Bool)

(assert (=> d!165343 (= c!145846 (and ((_ is Intermediate!13731) lt!675209) (undefined!14543 lt!675209)))))

(assert (=> d!165343 (= lt!675209 e!878931)))

(declare-fun c!145844 () Bool)

(assert (=> d!165343 (= c!145844 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165343 (= lt!675210 (select (arr!50831 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165343 (validMask!0 mask!898)))

(assert (=> d!165343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675209)))

(declare-fun b!1575878 () Bool)

(assert (=> b!1575878 (= e!878930 (Intermediate!13731 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(assert (= (and d!165343 c!145844) b!1575877))

(assert (= (and d!165343 (not c!145844)) b!1575873))

(assert (= (and b!1575873 c!145845) b!1575878))

(assert (= (and b!1575873 (not c!145845)) b!1575871))

(assert (= (and d!165343 c!145846) b!1575876))

(assert (= (and d!165343 (not c!145846)) b!1575870))

(assert (= (and b!1575870 res!1076735) b!1575874))

(assert (= (and b!1575874 (not res!1076736)) b!1575872))

(assert (= (and b!1575872 (not res!1076734)) b!1575875))

(declare-fun m!1448035 () Bool)

(assert (=> b!1575875 m!1448035))

(assert (=> b!1575872 m!1448035))

(assert (=> d!165343 m!1447987))

(declare-fun m!1448037 () Bool)

(assert (=> d!165343 m!1448037))

(assert (=> d!165343 m!1447977))

(assert (=> b!1575871 m!1447987))

(declare-fun m!1448039 () Bool)

(assert (=> b!1575871 m!1448039))

(assert (=> b!1575871 m!1448039))

(declare-fun m!1448041 () Bool)

(assert (=> b!1575871 m!1448041))

(assert (=> b!1575874 m!1448035))

(assert (=> b!1575790 d!165343))

(declare-fun d!165351 () Bool)

(declare-fun lt!675216 () (_ BitVec 32))

(declare-fun lt!675215 () (_ BitVec 32))

(assert (=> d!165351 (= lt!675216 (bvmul (bvxor lt!675215 (bvlshr lt!675215 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165351 (= lt!675215 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165351 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076737 (let ((h!38321 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142310 (bvmul (bvxor h!38321 (bvlshr h!38321 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142310 (bvlshr x!142310 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076737 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076737 #b00000000000000000000000000000000))))))

(assert (=> d!165351 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675216 (bvlshr lt!675216 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575790 d!165351))

(declare-fun d!165357 () Bool)

(assert (=> d!165357 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575789 d!165357))

(declare-fun d!165359 () Bool)

(assert (=> d!165359 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136018 d!165359))

(declare-fun d!165361 () Bool)

(assert (=> d!165361 (= (array_inv!39767 _keys!605) (bvsge (size!51383 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136018 d!165361))

(check-sat (not b!1575829) (not d!165339) (not d!165343) (not b!1575871))
(check-sat)
