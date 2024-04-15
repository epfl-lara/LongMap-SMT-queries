; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136060 () Bool)

(assert start!136060)

(declare-fun e!878981 () Bool)

(declare-datatypes ((array!105407 0))(
  ( (array!105408 (arr!50834 (Array (_ BitVec 32) (_ BitVec 64))) (size!51386 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105407)

(declare-datatypes ((SeekEntryResult!13734 0))(
  ( (MissingZero!13734 (index!57334 (_ BitVec 32))) (Found!13734 (index!57335 (_ BitVec 32))) (Intermediate!13734 (undefined!14546 Bool) (index!57336 (_ BitVec 32)) (x!142324 (_ BitVec 32))) (Undefined!13734) (MissingVacant!13734 (index!57337 (_ BitVec 32))) )
))
(declare-fun lt!675251 () SeekEntryResult!13734)

(declare-fun b!1575962 () Bool)

(declare-fun k0!761 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1575962 (= e!878981 (and (not ((_ is Undefined!13734) lt!675251)) (ite ((_ is Found!13734) lt!675251) (not (= (select (arr!50834 _keys!605) (index!57335 lt!675251)) k0!761)) (ite ((_ is MissingZero!13734) lt!675251) (not (= (select (arr!50834 _keys!605) (index!57334 lt!675251)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not ((_ is MissingVacant!13734) lt!675251)) (not (= (select (arr!50834 _keys!605) (index!57337 lt!675251)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!675252 () SeekEntryResult!13734)

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105407 (_ BitVec 32)) SeekEntryResult!13734)

(assert (=> b!1575962 (= lt!675251 (seekKeyOrZeroReturnVacant!0 (x!142324 lt!675252) (index!57336 lt!675252) (index!57336 lt!675252) k0!761 _keys!605 mask!898))))

(declare-fun res!1076767 () Bool)

(declare-fun e!878979 () Bool)

(assert (=> start!136060 (=> (not res!1076767) (not e!878979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136060 (= res!1076767 (validMask!0 mask!898))))

(assert (=> start!136060 e!878979))

(assert (=> start!136060 true))

(declare-fun array_inv!39770 (array!105407) Bool)

(assert (=> start!136060 (array_inv!39770 _keys!605)))

(declare-fun b!1575960 () Bool)

(declare-fun res!1076768 () Bool)

(assert (=> b!1575960 (=> (not res!1076768) (not e!878979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575960 (= res!1076768 (validKeyInArray!0 k0!761))))

(declare-fun b!1575959 () Bool)

(declare-fun res!1076766 () Bool)

(assert (=> b!1575959 (=> (not res!1076766) (not e!878979))))

(assert (=> b!1575959 (= res!1076766 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51386 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575961 () Bool)

(assert (=> b!1575961 (= e!878979 e!878981)))

(declare-fun res!1076769 () Bool)

(assert (=> b!1575961 (=> (not res!1076769) (not e!878981))))

(assert (=> b!1575961 (= res!1076769 (and (not (undefined!14546 lt!675252)) ((_ is Intermediate!13734) lt!675252) (not (= (select (arr!50834 _keys!605) (index!57336 lt!675252)) k0!761)) (not (= (select (arr!50834 _keys!605) (index!57336 lt!675252)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50834 _keys!605) (index!57336 lt!675252)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57336 lt!675252) #b00000000000000000000000000000000) (bvslt (index!57336 lt!675252) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105407 (_ BitVec 32)) SeekEntryResult!13734)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575961 (= lt!675252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!136060 res!1076767) b!1575959))

(assert (= (and b!1575959 res!1076766) b!1575960))

(assert (= (and b!1575960 res!1076768) b!1575961))

(assert (= (and b!1575961 res!1076769) b!1575962))

(declare-fun m!1448067 () Bool)

(assert (=> b!1575962 m!1448067))

(declare-fun m!1448069 () Bool)

(assert (=> b!1575962 m!1448069))

(declare-fun m!1448071 () Bool)

(assert (=> b!1575962 m!1448071))

(declare-fun m!1448073 () Bool)

(assert (=> b!1575962 m!1448073))

(declare-fun m!1448075 () Bool)

(assert (=> start!136060 m!1448075))

(declare-fun m!1448077 () Bool)

(assert (=> start!136060 m!1448077))

(declare-fun m!1448079 () Bool)

(assert (=> b!1575960 m!1448079))

(declare-fun m!1448081 () Bool)

(assert (=> b!1575961 m!1448081))

(declare-fun m!1448083 () Bool)

(assert (=> b!1575961 m!1448083))

(assert (=> b!1575961 m!1448083))

(declare-fun m!1448085 () Bool)

(assert (=> b!1575961 m!1448085))

(check-sat (not b!1575962) (not b!1575961) (not start!136060) (not b!1575960))
(check-sat)
(get-model)

(declare-fun b!1575999 () Bool)

(declare-fun e!879008 () SeekEntryResult!13734)

(assert (=> b!1575999 (= e!879008 (MissingVacant!13734 (index!57336 lt!675252)))))

(declare-fun b!1576000 () Bool)

(declare-fun c!145880 () Bool)

(declare-fun lt!675269 () (_ BitVec 64))

(assert (=> b!1576000 (= c!145880 (= lt!675269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879006 () SeekEntryResult!13734)

(assert (=> b!1576000 (= e!879006 e!879008)))

(declare-fun b!1576001 () Bool)

(declare-fun e!879007 () SeekEntryResult!13734)

(assert (=> b!1576001 (= e!879007 Undefined!13734)))

(declare-fun b!1576002 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576002 (= e!879008 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142324 lt!675252) #b00000000000000000000000000000001) (nextIndex!0 (index!57336 lt!675252) (x!142324 lt!675252) mask!898) (index!57336 lt!675252) k0!761 _keys!605 mask!898))))

(declare-fun d!165377 () Bool)

(declare-fun lt!675270 () SeekEntryResult!13734)

(assert (=> d!165377 (and (or ((_ is Undefined!13734) lt!675270) (not ((_ is Found!13734) lt!675270)) (and (bvsge (index!57335 lt!675270) #b00000000000000000000000000000000) (bvslt (index!57335 lt!675270) (size!51386 _keys!605)))) (or ((_ is Undefined!13734) lt!675270) ((_ is Found!13734) lt!675270) (not ((_ is MissingVacant!13734) lt!675270)) (not (= (index!57337 lt!675270) (index!57336 lt!675252))) (and (bvsge (index!57337 lt!675270) #b00000000000000000000000000000000) (bvslt (index!57337 lt!675270) (size!51386 _keys!605)))) (or ((_ is Undefined!13734) lt!675270) (ite ((_ is Found!13734) lt!675270) (= (select (arr!50834 _keys!605) (index!57335 lt!675270)) k0!761) (and ((_ is MissingVacant!13734) lt!675270) (= (index!57337 lt!675270) (index!57336 lt!675252)) (= (select (arr!50834 _keys!605) (index!57337 lt!675270)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!165377 (= lt!675270 e!879007)))

(declare-fun c!145881 () Bool)

(assert (=> d!165377 (= c!145881 (bvsge (x!142324 lt!675252) #b01111111111111111111111111111110))))

(assert (=> d!165377 (= lt!675269 (select (arr!50834 _keys!605) (index!57336 lt!675252)))))

(assert (=> d!165377 (validMask!0 mask!898)))

(assert (=> d!165377 (= (seekKeyOrZeroReturnVacant!0 (x!142324 lt!675252) (index!57336 lt!675252) (index!57336 lt!675252) k0!761 _keys!605 mask!898) lt!675270)))

(declare-fun b!1576003 () Bool)

(assert (=> b!1576003 (= e!879006 (Found!13734 (index!57336 lt!675252)))))

(declare-fun b!1576004 () Bool)

(assert (=> b!1576004 (= e!879007 e!879006)))

(declare-fun c!145882 () Bool)

(assert (=> b!1576004 (= c!145882 (= lt!675269 k0!761))))

(assert (= (and d!165377 c!145881) b!1576001))

(assert (= (and d!165377 (not c!145881)) b!1576004))

(assert (= (and b!1576004 c!145882) b!1576003))

(assert (= (and b!1576004 (not c!145882)) b!1576000))

(assert (= (and b!1576000 c!145880) b!1575999))

(assert (= (and b!1576000 (not c!145880)) b!1576002))

(declare-fun m!1448127 () Bool)

(assert (=> b!1576002 m!1448127))

(assert (=> b!1576002 m!1448127))

(declare-fun m!1448129 () Bool)

(assert (=> b!1576002 m!1448129))

(declare-fun m!1448131 () Bool)

(assert (=> d!165377 m!1448131))

(declare-fun m!1448133 () Bool)

(assert (=> d!165377 m!1448133))

(assert (=> d!165377 m!1448081))

(assert (=> d!165377 m!1448075))

(assert (=> b!1575962 d!165377))

(declare-fun d!165381 () Bool)

(declare-fun e!879030 () Bool)

(assert (=> d!165381 e!879030))

(declare-fun c!145897 () Bool)

(declare-fun lt!675280 () SeekEntryResult!13734)

(assert (=> d!165381 (= c!145897 (and ((_ is Intermediate!13734) lt!675280) (undefined!14546 lt!675280)))))

(declare-fun e!879029 () SeekEntryResult!13734)

(assert (=> d!165381 (= lt!675280 e!879029)))

(declare-fun c!145896 () Bool)

(assert (=> d!165381 (= c!145896 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675279 () (_ BitVec 64))

(assert (=> d!165381 (= lt!675279 (select (arr!50834 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165381 (validMask!0 mask!898)))

(assert (=> d!165381 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675280)))

(declare-fun b!1576041 () Bool)

(assert (=> b!1576041 (and (bvsge (index!57336 lt!675280) #b00000000000000000000000000000000) (bvslt (index!57336 lt!675280) (size!51386 _keys!605)))))

(declare-fun res!1076808 () Bool)

(assert (=> b!1576041 (= res!1076808 (= (select (arr!50834 _keys!605) (index!57336 lt!675280)) k0!761))))

(declare-fun e!879033 () Bool)

(assert (=> b!1576041 (=> res!1076808 e!879033)))

(declare-fun e!879031 () Bool)

(assert (=> b!1576041 (= e!879031 e!879033)))

(declare-fun b!1576042 () Bool)

(assert (=> b!1576042 (= e!879030 (bvsge (x!142324 lt!675280) #b01111111111111111111111111111110))))

(declare-fun b!1576043 () Bool)

(declare-fun e!879032 () SeekEntryResult!13734)

(assert (=> b!1576043 (= e!879029 e!879032)))

(declare-fun c!145895 () Bool)

(assert (=> b!1576043 (= c!145895 (or (= lt!675279 k0!761) (= (bvadd lt!675279 lt!675279) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576044 () Bool)

(assert (=> b!1576044 (and (bvsge (index!57336 lt!675280) #b00000000000000000000000000000000) (bvslt (index!57336 lt!675280) (size!51386 _keys!605)))))

(declare-fun res!1076807 () Bool)

(assert (=> b!1576044 (= res!1076807 (= (select (arr!50834 _keys!605) (index!57336 lt!675280)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1576044 (=> res!1076807 e!879033)))

(declare-fun b!1576045 () Bool)

(assert (=> b!1576045 (= e!879029 (Intermediate!13734 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576046 () Bool)

(assert (=> b!1576046 (and (bvsge (index!57336 lt!675280) #b00000000000000000000000000000000) (bvslt (index!57336 lt!675280) (size!51386 _keys!605)))))

(assert (=> b!1576046 (= e!879033 (= (select (arr!50834 _keys!605) (index!57336 lt!675280)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576047 () Bool)

(assert (=> b!1576047 (= e!879032 (Intermediate!13734 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576048 () Bool)

(assert (=> b!1576048 (= e!879032 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1576049 () Bool)

(assert (=> b!1576049 (= e!879030 e!879031)))

(declare-fun res!1076806 () Bool)

(assert (=> b!1576049 (= res!1076806 (and ((_ is Intermediate!13734) lt!675280) (not (undefined!14546 lt!675280)) (bvslt (x!142324 lt!675280) #b01111111111111111111111111111110) (bvsge (x!142324 lt!675280) #b00000000000000000000000000000000) (bvsge (x!142324 lt!675280) #b00000000000000000000000000000000)))))

(assert (=> b!1576049 (=> (not res!1076806) (not e!879031))))

(assert (= (and d!165381 c!145896) b!1576045))

(assert (= (and d!165381 (not c!145896)) b!1576043))

(assert (= (and b!1576043 c!145895) b!1576047))

(assert (= (and b!1576043 (not c!145895)) b!1576048))

(assert (= (and d!165381 c!145897) b!1576042))

(assert (= (and d!165381 (not c!145897)) b!1576049))

(assert (= (and b!1576049 res!1076806) b!1576041))

(assert (= (and b!1576041 (not res!1076808)) b!1576044))

(assert (= (and b!1576044 (not res!1076807)) b!1576046))

(declare-fun m!1448135 () Bool)

(assert (=> b!1576041 m!1448135))

(assert (=> b!1576048 m!1448083))

(declare-fun m!1448137 () Bool)

(assert (=> b!1576048 m!1448137))

(assert (=> b!1576048 m!1448137))

(declare-fun m!1448139 () Bool)

(assert (=> b!1576048 m!1448139))

(assert (=> d!165381 m!1448083))

(declare-fun m!1448141 () Bool)

(assert (=> d!165381 m!1448141))

(assert (=> d!165381 m!1448075))

(assert (=> b!1576046 m!1448135))

(assert (=> b!1576044 m!1448135))

(assert (=> b!1575961 d!165381))

(declare-fun d!165393 () Bool)

(declare-fun lt!675294 () (_ BitVec 32))

(declare-fun lt!675293 () (_ BitVec 32))

(assert (=> d!165393 (= lt!675294 (bvmul (bvxor lt!675293 (bvlshr lt!675293 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165393 (= lt!675293 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165393 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076809 (let ((h!38324 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142331 (bvmul (bvxor h!38324 (bvlshr h!38324 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142331 (bvlshr x!142331 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076809 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076809 #b00000000000000000000000000000000))))))

(assert (=> d!165393 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675294 (bvlshr lt!675294 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575961 d!165393))

(declare-fun d!165399 () Bool)

(assert (=> d!165399 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136060 d!165399))

(declare-fun d!165407 () Bool)

(assert (=> d!165407 (= (array_inv!39770 _keys!605) (bvsge (size!51386 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136060 d!165407))

(declare-fun d!165409 () Bool)

(assert (=> d!165409 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575960 d!165409))

(check-sat (not d!165377) (not b!1576048) (not d!165381) (not b!1576002))
(check-sat)
