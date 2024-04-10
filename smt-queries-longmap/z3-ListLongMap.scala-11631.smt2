; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135698 () Bool)

(assert start!135698)

(declare-fun res!1076093 () Bool)

(declare-fun e!878326 () Bool)

(assert (=> start!135698 (=> (not res!1076093) (not e!878326))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135698 (= res!1076093 (validMask!0 mask!898))))

(assert (=> start!135698 e!878326))

(assert (=> start!135698 true))

(declare-datatypes ((array!105338 0))(
  ( (array!105339 (arr!50813 (Array (_ BitVec 32) (_ BitVec 64))) (size!51363 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105338)

(declare-fun array_inv!39540 (array!105338) Bool)

(assert (=> start!135698 (array_inv!39540 _keys!605)))

(declare-fun b!1574848 () Bool)

(declare-fun res!1076092 () Bool)

(assert (=> b!1574848 (=> (not res!1076092) (not e!878326))))

(assert (=> b!1574848 (= res!1076092 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51363 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574849 () Bool)

(declare-fun res!1076094 () Bool)

(assert (=> b!1574849 (=> (not res!1076094) (not e!878326))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574849 (= res!1076094 (validKeyInArray!0 k0!761))))

(declare-datatypes ((SeekEntryResult!13678 0))(
  ( (MissingZero!13678 (index!57110 (_ BitVec 32))) (Found!13678 (index!57111 (_ BitVec 32))) (Intermediate!13678 (undefined!14490 Bool) (index!57112 (_ BitVec 32)) (x!142058 (_ BitVec 32))) (Undefined!13678) (MissingVacant!13678 (index!57113 (_ BitVec 32))) )
))
(declare-fun lt!674962 () SeekEntryResult!13678)

(declare-fun b!1574850 () Bool)

(get-info :version)

(assert (=> b!1574850 (= e!878326 (and ((_ is Intermediate!13678) lt!674962) (not (undefined!14490 lt!674962)) (not (= (select (arr!50813 _keys!605) (index!57112 lt!674962)) k0!761)) (not (= (select (arr!50813 _keys!605) (index!57112 lt!674962)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50813 _keys!605) (index!57112 lt!674962)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105338 (_ BitVec 32)) SeekEntryResult!13678)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574850 (= lt!674962 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135698 res!1076093) b!1574848))

(assert (= (and b!1574848 res!1076092) b!1574849))

(assert (= (and b!1574849 res!1076094) b!1574850))

(declare-fun m!1448047 () Bool)

(assert (=> start!135698 m!1448047))

(declare-fun m!1448049 () Bool)

(assert (=> start!135698 m!1448049))

(declare-fun m!1448051 () Bool)

(assert (=> b!1574849 m!1448051))

(declare-fun m!1448053 () Bool)

(assert (=> b!1574850 m!1448053))

(declare-fun m!1448055 () Bool)

(assert (=> b!1574850 m!1448055))

(assert (=> b!1574850 m!1448055))

(declare-fun m!1448057 () Bool)

(assert (=> b!1574850 m!1448057))

(check-sat (not start!135698) (not b!1574849) (not b!1574850))
(check-sat)
(get-model)

(declare-fun d!165297 () Bool)

(assert (=> d!165297 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135698 d!165297))

(declare-fun d!165305 () Bool)

(assert (=> d!165305 (= (array_inv!39540 _keys!605) (bvsge (size!51363 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135698 d!165305))

(declare-fun d!165307 () Bool)

(assert (=> d!165307 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574849 d!165307))

(declare-fun b!1574932 () Bool)

(declare-fun e!878376 () SeekEntryResult!13678)

(declare-fun e!878375 () SeekEntryResult!13678)

(assert (=> b!1574932 (= e!878376 e!878375)))

(declare-fun c!145664 () Bool)

(declare-fun lt!674994 () (_ BitVec 64))

(assert (=> b!1574932 (= c!145664 (or (= lt!674994 k0!761) (= (bvadd lt!674994 lt!674994) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574933 () Bool)

(assert (=> b!1574933 (= e!878375 (Intermediate!13678 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574934 () Bool)

(declare-fun lt!674995 () SeekEntryResult!13678)

(assert (=> b!1574934 (and (bvsge (index!57112 lt!674995) #b00000000000000000000000000000000) (bvslt (index!57112 lt!674995) (size!51363 _keys!605)))))

(declare-fun e!878378 () Bool)

(assert (=> b!1574934 (= e!878378 (= (select (arr!50813 _keys!605) (index!57112 lt!674995)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!165309 () Bool)

(declare-fun e!878377 () Bool)

(assert (=> d!165309 e!878377))

(declare-fun c!145663 () Bool)

(assert (=> d!165309 (= c!145663 (and ((_ is Intermediate!13678) lt!674995) (undefined!14490 lt!674995)))))

(assert (=> d!165309 (= lt!674995 e!878376)))

(declare-fun c!145665 () Bool)

(assert (=> d!165309 (= c!145665 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165309 (= lt!674994 (select (arr!50813 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165309 (validMask!0 mask!898)))

(assert (=> d!165309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!674995)))

(declare-fun b!1574935 () Bool)

(assert (=> b!1574935 (= e!878376 (Intermediate!13678 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574936 () Bool)

(assert (=> b!1574936 (and (bvsge (index!57112 lt!674995) #b00000000000000000000000000000000) (bvslt (index!57112 lt!674995) (size!51363 _keys!605)))))

(declare-fun res!1076132 () Bool)

(assert (=> b!1574936 (= res!1076132 (= (select (arr!50813 _keys!605) (index!57112 lt!674995)) k0!761))))

(assert (=> b!1574936 (=> res!1076132 e!878378)))

(declare-fun e!878374 () Bool)

(assert (=> b!1574936 (= e!878374 e!878378)))

(declare-fun b!1574937 () Bool)

(assert (=> b!1574937 (and (bvsge (index!57112 lt!674995) #b00000000000000000000000000000000) (bvslt (index!57112 lt!674995) (size!51363 _keys!605)))))

(declare-fun res!1076131 () Bool)

(assert (=> b!1574937 (= res!1076131 (= (select (arr!50813 _keys!605) (index!57112 lt!674995)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574937 (=> res!1076131 e!878378)))

(declare-fun b!1574938 () Bool)

(assert (=> b!1574938 (= e!878377 (bvsge (x!142058 lt!674995) #b01111111111111111111111111111110))))

(declare-fun b!1574939 () Bool)

(assert (=> b!1574939 (= e!878377 e!878374)))

(declare-fun res!1076130 () Bool)

(assert (=> b!1574939 (= res!1076130 (and ((_ is Intermediate!13678) lt!674995) (not (undefined!14490 lt!674995)) (bvslt (x!142058 lt!674995) #b01111111111111111111111111111110) (bvsge (x!142058 lt!674995) #b00000000000000000000000000000000) (bvsge (x!142058 lt!674995) #b00000000000000000000000000000000)))))

(assert (=> b!1574939 (=> (not res!1076130) (not e!878374))))

(declare-fun b!1574940 () Bool)

