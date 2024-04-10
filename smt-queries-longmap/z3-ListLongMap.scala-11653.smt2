; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136212 () Bool)

(assert start!136212)

(declare-fun b!1576683 () Bool)

(declare-fun e!879420 () Bool)

(declare-datatypes ((SeekEntryResult!13744 0))(
  ( (MissingZero!13744 (index!57374 (_ BitVec 32))) (Found!13744 (index!57375 (_ BitVec 32))) (Intermediate!13744 (undefined!14556 Bool) (index!57376 (_ BitVec 32)) (x!142384 (_ BitVec 32))) (Undefined!13744) (MissingVacant!13744 (index!57377 (_ BitVec 32))) )
))
(declare-fun lt!675739 () SeekEntryResult!13744)

(declare-datatypes ((array!105505 0))(
  ( (array!105506 (arr!50879 (Array (_ BitVec 32) (_ BitVec 64))) (size!51429 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105505)

(get-info :version)

(assert (=> b!1576683 (= e!879420 (and (not ((_ is Undefined!13744) lt!675739)) (not ((_ is Found!13744) lt!675739)) ((_ is MissingZero!13744) lt!675739) (or (bvslt (index!57374 lt!675739) #b00000000000000000000000000000000) (bvsge (index!57374 lt!675739) (size!51429 _keys!605)))))))

(declare-fun err!190 () SeekEntryResult!13744)

(assert (=> b!1576683 (= lt!675739 err!190)))

(assert (=> b!1576683 true))

(declare-fun b!1576681 () Bool)

(declare-fun res!1077097 () Bool)

(declare-fun e!879421 () Bool)

(assert (=> b!1576681 (=> (not res!1077097) (not e!879421))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576681 (= res!1077097 (validKeyInArray!0 k0!761))))

(declare-fun b!1576682 () Bool)

(assert (=> b!1576682 (= e!879421 e!879420)))

(declare-fun res!1077096 () Bool)

(assert (=> b!1576682 (=> (not res!1077096) (not e!879420))))

(declare-fun lt!675738 () Bool)

(declare-fun lt!675737 () SeekEntryResult!13744)

(assert (=> b!1576682 (= res!1077096 (and (or lt!675738 (not (undefined!14556 lt!675737))) (or lt!675738 (undefined!14556 lt!675737))))))

(assert (=> b!1576682 (= lt!675738 (not ((_ is Intermediate!13744) lt!675737)))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105505 (_ BitVec 32)) SeekEntryResult!13744)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576682 (= lt!675737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun res!1077098 () Bool)

(assert (=> start!136212 (=> (not res!1077098) (not e!879421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136212 (= res!1077098 (validMask!0 mask!898))))

(assert (=> start!136212 e!879421))

(assert (=> start!136212 true))

(declare-fun array_inv!39606 (array!105505) Bool)

(assert (=> start!136212 (array_inv!39606 _keys!605)))

(declare-fun b!1576680 () Bool)

(declare-fun res!1077099 () Bool)

(assert (=> b!1576680 (=> (not res!1077099) (not e!879421))))

(assert (=> b!1576680 (= res!1077099 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51429 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(assert (= (and start!136212 res!1077098) b!1576680))

(assert (= (and b!1576680 res!1077099) b!1576681))

(assert (= (and b!1576681 res!1077097) b!1576682))

(assert (= (and b!1576682 res!1077096) b!1576683))

(declare-fun m!1449185 () Bool)

(assert (=> b!1576681 m!1449185))

(declare-fun m!1449187 () Bool)

(assert (=> b!1576682 m!1449187))

(assert (=> b!1576682 m!1449187))

(declare-fun m!1449189 () Bool)

(assert (=> b!1576682 m!1449189))

(declare-fun m!1449191 () Bool)

(assert (=> start!136212 m!1449191))

(declare-fun m!1449193 () Bool)

(assert (=> start!136212 m!1449193))

(check-sat (not start!136212) (not b!1576681) (not b!1576682))
(check-sat)
(get-model)

(declare-fun d!165719 () Bool)

(assert (=> d!165719 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136212 d!165719))

(declare-fun d!165729 () Bool)

(assert (=> d!165729 (= (array_inv!39606 _keys!605) (bvsge (size!51429 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136212 d!165729))

(declare-fun d!165731 () Bool)

(assert (=> d!165731 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576681 d!165731))

(declare-fun b!1576714 () Bool)

(declare-fun e!879442 () Bool)

(declare-fun lt!675754 () SeekEntryResult!13744)

(assert (=> b!1576714 (= e!879442 (bvsge (x!142384 lt!675754) #b01111111111111111111111111111110))))

(declare-fun b!1576715 () Bool)

(declare-fun e!879445 () SeekEntryResult!13744)

(assert (=> b!1576715 (= e!879445 (Intermediate!13744 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun d!165735 () Bool)

(assert (=> d!165735 e!879442))

(declare-fun c!146079 () Bool)

(assert (=> d!165735 (= c!146079 (and ((_ is Intermediate!13744) lt!675754) (undefined!14556 lt!675754)))))

(assert (=> d!165735 (= lt!675754 e!879445)))

(declare-fun c!146078 () Bool)

(assert (=> d!165735 (= c!146078 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675753 () (_ BitVec 64))

(assert (=> d!165735 (= lt!675753 (select (arr!50879 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165735 (validMask!0 mask!898)))

(assert (=> d!165735 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675754)))

(declare-fun b!1576716 () Bool)

(assert (=> b!1576716 (and (bvsge (index!57376 lt!675754) #b00000000000000000000000000000000) (bvslt (index!57376 lt!675754) (size!51429 _keys!605)))))

(declare-fun res!1077120 () Bool)

(assert (=> b!1576716 (= res!1077120 (= (select (arr!50879 _keys!605) (index!57376 lt!675754)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879443 () Bool)

(assert (=> b!1576716 (=> res!1077120 e!879443)))

(declare-fun b!1576717 () Bool)

(declare-fun e!879446 () SeekEntryResult!13744)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576717 (= e!879446 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1576718 () Bool)

(assert (=> b!1576718 (and (bvsge (index!57376 lt!675754) #b00000000000000000000000000000000) (bvslt (index!57376 lt!675754) (size!51429 _keys!605)))))

(assert (=> b!1576718 (= e!879443 (= (select (arr!50879 _keys!605) (index!57376 lt!675754)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1576719 () Bool)

(assert (=> b!1576719 (= e!879445 e!879446)))

(declare-fun c!146077 () Bool)

(assert (=> b!1576719 (= c!146077 (or (= lt!675753 k0!761) (= (bvadd lt!675753 lt!675753) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576720 () Bool)

(assert (=> b!1576720 (= e!879446 (Intermediate!13744 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576721 () Bool)

(declare-fun e!879444 () Bool)

(assert (=> b!1576721 (= e!879442 e!879444)))

(declare-fun res!1077119 () Bool)

(assert (=> b!1576721 (= res!1077119 (and ((_ is Intermediate!13744) lt!675754) (not (undefined!14556 lt!675754)) (bvslt (x!142384 lt!675754) #b01111111111111111111111111111110) (bvsge (x!142384 lt!675754) #b00000000000000000000000000000000) (bvsge (x!142384 lt!675754) #b00000000000000000000000000000000)))))

(assert (=> b!1576721 (=> (not res!1077119) (not e!879444))))

(declare-fun b!1576722 () Bool)

(assert (=> b!1576722 (and (bvsge (index!57376 lt!675754) #b00000000000000000000000000000000) (bvslt (index!57376 lt!675754) (size!51429 _keys!605)))))

(declare-fun res!1077118 () Bool)

(assert (=> b!1576722 (= res!1077118 (= (select (arr!50879 _keys!605) (index!57376 lt!675754)) k0!761))))

(assert (=> b!1576722 (=> res!1077118 e!879443)))

(assert (=> b!1576722 (= e!879444 e!879443)))

(assert (= (and d!165735 c!146078) b!1576715))

(assert (= (and d!165735 (not c!146078)) b!1576719))

(assert (= (and b!1576719 c!146077) b!1576720))

(assert (= (and b!1576719 (not c!146077)) b!1576717))

(assert (= (and d!165735 c!146079) b!1576714))

(assert (= (and d!165735 (not c!146079)) b!1576721))

(assert (= (and b!1576721 res!1077119) b!1576722))

(assert (= (and b!1576722 (not res!1077118)) b!1576716))

(assert (= (and b!1576716 (not res!1077120)) b!1576718))

(assert (=> d!165735 m!1449187))

(declare-fun m!1449205 () Bool)

(assert (=> d!165735 m!1449205))

(assert (=> d!165735 m!1449191))

(declare-fun m!1449207 () Bool)

(assert (=> b!1576718 m!1449207))

(assert (=> b!1576716 m!1449207))

(assert (=> b!1576717 m!1449187))

(declare-fun m!1449209 () Bool)

(assert (=> b!1576717 m!1449209))

(assert (=> b!1576717 m!1449209))

(declare-fun m!1449211 () Bool)

(assert (=> b!1576717 m!1449211))

(assert (=> b!1576722 m!1449207))

(assert (=> b!1576682 d!165735))

(declare-fun d!165743 () Bool)

(declare-fun lt!675764 () (_ BitVec 32))

(declare-fun lt!675763 () (_ BitVec 32))

(assert (=> d!165743 (= lt!675764 (bvmul (bvxor lt!675763 (bvlshr lt!675763 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165743 (= lt!675763 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165743 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077121 (let ((h!38291 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142387 (bvmul (bvxor h!38291 (bvlshr h!38291 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142387 (bvlshr x!142387 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077121 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077121 #b00000000000000000000000000000000))))))

(assert (=> d!165743 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675764 (bvlshr lt!675764 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1576682 d!165743))

(check-sat (not b!1576717) (not d!165735))
(check-sat)
