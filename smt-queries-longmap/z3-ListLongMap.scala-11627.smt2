; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136066 () Bool)

(assert start!136066)

(declare-fun res!1076807 () Bool)

(declare-fun e!879713 () Bool)

(assert (=> start!136066 (=> (not res!1076807) (not e!879713))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136066 (= res!1076807 (validMask!0 mask!898))))

(assert (=> start!136066 e!879713))

(assert (=> start!136066 true))

(declare-datatypes ((array!105434 0))(
  ( (array!105435 (arr!50854 (Array (_ BitVec 32) (_ BitVec 64))) (size!51405 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105434)

(declare-fun array_inv!39809 (array!105434) Bool)

(assert (=> start!136066 (array_inv!39809 _keys!605)))

(declare-fun b!1577086 () Bool)

(declare-fun res!1076805 () Bool)

(assert (=> b!1577086 (=> (not res!1076805) (not e!879713))))

(assert (=> b!1577086 (= res!1076805 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51405 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577087 () Bool)

(declare-fun res!1076806 () Bool)

(assert (=> b!1577087 (=> (not res!1076806) (not e!879713))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577087 (= res!1076806 (validKeyInArray!0 k0!761))))

(declare-fun b!1577088 () Bool)

(declare-datatypes ((SeekEntryResult!13613 0))(
  ( (MissingZero!13613 (index!56850 (_ BitVec 32))) (Found!13613 (index!56851 (_ BitVec 32))) (Intermediate!13613 (undefined!14425 Bool) (index!56852 (_ BitVec 32)) (x!142006 (_ BitVec 32))) (Undefined!13613) (MissingVacant!13613 (index!56853 (_ BitVec 32))) )
))
(declare-fun lt!675795 () SeekEntryResult!13613)

(get-info :version)

(assert (=> b!1577088 (= e!879713 (and ((_ is Intermediate!13613) lt!675795) (not (undefined!14425 lt!675795)) (not (= (select (arr!50854 _keys!605) (index!56852 lt!675795)) k0!761)) (not (= (select (arr!50854 _keys!605) (index!56852 lt!675795)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50854 _keys!605) (index!56852 lt!675795)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56852 lt!675795) #b00000000000000000000000000000000) (bvslt (index!56852 lt!675795) (bvadd #b00000000000000000000000000000001 mask!898)) (or (bvsgt (x!142006 lt!675795) #b01111111111111111111111111111110) (bvslt (x!142006 lt!675795) #b00000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105434 (_ BitVec 32)) SeekEntryResult!13613)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577088 (= lt!675795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!136066 res!1076807) b!1577086))

(assert (= (and b!1577086 res!1076805) b!1577087))

(assert (= (and b!1577087 res!1076806) b!1577088))

(declare-fun m!1450143 () Bool)

(assert (=> start!136066 m!1450143))

(declare-fun m!1450145 () Bool)

(assert (=> start!136066 m!1450145))

(declare-fun m!1450147 () Bool)

(assert (=> b!1577087 m!1450147))

(declare-fun m!1450149 () Bool)

(assert (=> b!1577088 m!1450149))

(declare-fun m!1450151 () Bool)

(assert (=> b!1577088 m!1450151))

(assert (=> b!1577088 m!1450151))

(declare-fun m!1450153 () Bool)

(assert (=> b!1577088 m!1450153))

(check-sat (not b!1577088) (not start!136066) (not b!1577087))
(check-sat)
(get-model)

(declare-fun b!1577125 () Bool)

(declare-fun lt!675806 () SeekEntryResult!13613)

(assert (=> b!1577125 (and (bvsge (index!56852 lt!675806) #b00000000000000000000000000000000) (bvslt (index!56852 lt!675806) (size!51405 _keys!605)))))

(declare-fun e!879740 () Bool)

(assert (=> b!1577125 (= e!879740 (= (select (arr!50854 _keys!605) (index!56852 lt!675806)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577126 () Bool)

(declare-fun e!879739 () Bool)

(declare-fun e!879737 () Bool)

(assert (=> b!1577126 (= e!879739 e!879737)))

(declare-fun res!1076832 () Bool)

(assert (=> b!1577126 (= res!1076832 (and ((_ is Intermediate!13613) lt!675806) (not (undefined!14425 lt!675806)) (bvslt (x!142006 lt!675806) #b01111111111111111111111111111110) (bvsge (x!142006 lt!675806) #b00000000000000000000000000000000) (bvsge (x!142006 lt!675806) #b00000000000000000000000000000000)))))

(assert (=> b!1577126 (=> (not res!1076832) (not e!879737))))

(declare-fun d!165969 () Bool)

(assert (=> d!165969 e!879739))

(declare-fun c!146419 () Bool)

(assert (=> d!165969 (= c!146419 (and ((_ is Intermediate!13613) lt!675806) (undefined!14425 lt!675806)))))

(declare-fun e!879738 () SeekEntryResult!13613)

(assert (=> d!165969 (= lt!675806 e!879738)))

(declare-fun c!146418 () Bool)

(assert (=> d!165969 (= c!146418 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675807 () (_ BitVec 64))

(assert (=> d!165969 (= lt!675807 (select (arr!50854 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165969 (validMask!0 mask!898)))

(assert (=> d!165969 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675806)))

(declare-fun b!1577127 () Bool)

(assert (=> b!1577127 (and (bvsge (index!56852 lt!675806) #b00000000000000000000000000000000) (bvslt (index!56852 lt!675806) (size!51405 _keys!605)))))

(declare-fun res!1076833 () Bool)

(assert (=> b!1577127 (= res!1076833 (= (select (arr!50854 _keys!605) (index!56852 lt!675806)) k0!761))))

(assert (=> b!1577127 (=> res!1076833 e!879740)))

(assert (=> b!1577127 (= e!879737 e!879740)))

(declare-fun b!1577128 () Bool)

(declare-fun e!879736 () SeekEntryResult!13613)

(assert (=> b!1577128 (= e!879738 e!879736)))

(declare-fun c!146420 () Bool)

(assert (=> b!1577128 (= c!146420 (or (= lt!675807 k0!761) (= (bvadd lt!675807 lt!675807) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577129 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577129 (= e!879736 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1577130 () Bool)

(assert (=> b!1577130 (= e!879736 (Intermediate!13613 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1577131 () Bool)

(assert (=> b!1577131 (= e!879739 (bvsge (x!142006 lt!675806) #b01111111111111111111111111111110))))

(declare-fun b!1577132 () Bool)

(assert (=> b!1577132 (and (bvsge (index!56852 lt!675806) #b00000000000000000000000000000000) (bvslt (index!56852 lt!675806) (size!51405 _keys!605)))))

(declare-fun res!1076834 () Bool)

(assert (=> b!1577132 (= res!1076834 (= (select (arr!50854 _keys!605) (index!56852 lt!675806)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577132 (=> res!1076834 e!879740)))

(declare-fun b!1577133 () Bool)

(assert (=> b!1577133 (= e!879738 (Intermediate!13613 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(assert (= (and d!165969 c!146418) b!1577133))

(assert (= (and d!165969 (not c!146418)) b!1577128))

(assert (= (and b!1577128 c!146420) b!1577130))

(assert (= (and b!1577128 (not c!146420)) b!1577129))

(assert (= (and d!165969 c!146419) b!1577131))

(assert (= (and d!165969 (not c!146419)) b!1577126))

(assert (= (and b!1577126 res!1076832) b!1577127))

(assert (= (and b!1577127 (not res!1076833)) b!1577132))

(assert (= (and b!1577132 (not res!1076834)) b!1577125))

(assert (=> b!1577129 m!1450151))

(declare-fun m!1450179 () Bool)

(assert (=> b!1577129 m!1450179))

(assert (=> b!1577129 m!1450179))

(declare-fun m!1450181 () Bool)

(assert (=> b!1577129 m!1450181))

(assert (=> d!165969 m!1450151))

(declare-fun m!1450183 () Bool)

(assert (=> d!165969 m!1450183))

(assert (=> d!165969 m!1450143))

(declare-fun m!1450185 () Bool)

(assert (=> b!1577132 m!1450185))

(assert (=> b!1577125 m!1450185))

(assert (=> b!1577127 m!1450185))

(assert (=> b!1577088 d!165969))

(declare-fun d!165981 () Bool)

(declare-fun lt!675813 () (_ BitVec 32))

(declare-fun lt!675812 () (_ BitVec 32))

(assert (=> d!165981 (= lt!675813 (bvmul (bvxor lt!675812 (bvlshr lt!675812 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165981 (= lt!675812 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165981 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076835 (let ((h!38302 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142010 (bvmul (bvxor h!38302 (bvlshr h!38302 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142010 (bvlshr x!142010 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076835 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076835 #b00000000000000000000000000000000))))))

(assert (=> d!165981 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675813 (bvlshr lt!675813 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1577088 d!165981))

(declare-fun d!165983 () Bool)

(assert (=> d!165983 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136066 d!165983))

(declare-fun d!165985 () Bool)

(assert (=> d!165985 (= (array_inv!39809 _keys!605) (bvsge (size!51405 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136066 d!165985))

(declare-fun d!165987 () Bool)

(assert (=> d!165987 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577087 d!165987))

(check-sat (not d!165969) (not b!1577129))
(check-sat)
