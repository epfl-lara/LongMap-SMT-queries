; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136252 () Bool)

(assert start!136252)

(declare-fun res!1077224 () Bool)

(declare-fun e!880091 () Bool)

(assert (=> start!136252 (=> (not res!1077224) (not e!880091))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136252 (= res!1077224 (validMask!0 mask!898))))

(assert (=> start!136252 e!880091))

(assert (=> start!136252 true))

(declare-datatypes ((array!105512 0))(
  ( (array!105513 (arr!50887 (Array (_ BitVec 32) (_ BitVec 64))) (size!51438 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105512)

(declare-fun array_inv!39842 (array!105512) Bool)

(assert (=> start!136252 (array_inv!39842 _keys!605)))

(declare-fun b!1577707 () Bool)

(declare-fun res!1077223 () Bool)

(assert (=> b!1577707 (=> (not res!1077223) (not e!880091))))

(assert (=> b!1577707 (= res!1077223 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51438 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577708 () Bool)

(declare-fun res!1077222 () Bool)

(assert (=> b!1577708 (=> (not res!1077222) (not e!880091))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577708 (= res!1077222 (validKeyInArray!0 k0!761))))

(declare-fun b!1577709 () Bool)

(declare-datatypes ((SeekEntryResult!13646 0))(
  ( (MissingZero!13646 (index!56982 (_ BitVec 32))) (Found!13646 (index!56983 (_ BitVec 32))) (Intermediate!13646 (undefined!14458 Bool) (index!56984 (_ BitVec 32)) (x!142151 (_ BitVec 32))) (Undefined!13646) (MissingVacant!13646 (index!56985 (_ BitVec 32))) )
))
(declare-fun lt!676038 () SeekEntryResult!13646)

(get-info :version)

(assert (=> b!1577709 (= e!880091 (and ((_ is Intermediate!13646) lt!676038) (not (undefined!14458 lt!676038)) (= (select (arr!50887 _keys!605) (index!56984 lt!676038)) k0!761) (or (bvslt (index!56984 lt!676038) #b00000000000000000000000000000000) (bvsge (index!56984 lt!676038) (size!51438 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105512 (_ BitVec 32)) SeekEntryResult!13646)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577709 (= lt!676038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!136252 res!1077224) b!1577707))

(assert (= (and b!1577707 res!1077223) b!1577708))

(assert (= (and b!1577708 res!1077222) b!1577709))

(declare-fun m!1450587 () Bool)

(assert (=> start!136252 m!1450587))

(declare-fun m!1450589 () Bool)

(assert (=> start!136252 m!1450589))

(declare-fun m!1450591 () Bool)

(assert (=> b!1577708 m!1450591))

(declare-fun m!1450593 () Bool)

(assert (=> b!1577709 m!1450593))

(declare-fun m!1450595 () Bool)

(assert (=> b!1577709 m!1450595))

(assert (=> b!1577709 m!1450595))

(declare-fun m!1450597 () Bool)

(assert (=> b!1577709 m!1450597))

(check-sat (not b!1577709) (not start!136252) (not b!1577708))
(check-sat)
(get-model)

(declare-fun b!1577773 () Bool)

(declare-fun e!880129 () SeekEntryResult!13646)

(assert (=> b!1577773 (= e!880129 (Intermediate!13646 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1577774 () Bool)

(declare-fun lt!676055 () SeekEntryResult!13646)

(assert (=> b!1577774 (and (bvsge (index!56984 lt!676055) #b00000000000000000000000000000000) (bvslt (index!56984 lt!676055) (size!51438 _keys!605)))))

(declare-fun res!1077261 () Bool)

(assert (=> b!1577774 (= res!1077261 (= (select (arr!50887 _keys!605) (index!56984 lt!676055)) k0!761))))

(declare-fun e!880130 () Bool)

(assert (=> b!1577774 (=> res!1077261 e!880130)))

(declare-fun e!880132 () Bool)

(assert (=> b!1577774 (= e!880132 e!880130)))

(declare-fun b!1577775 () Bool)

(assert (=> b!1577775 (and (bvsge (index!56984 lt!676055) #b00000000000000000000000000000000) (bvslt (index!56984 lt!676055) (size!51438 _keys!605)))))

(assert (=> b!1577775 (= e!880130 (= (select (arr!50887 _keys!605) (index!56984 lt!676055)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577776 () Bool)

(declare-fun e!880131 () SeekEntryResult!13646)

(assert (=> b!1577776 (= e!880129 e!880131)))

(declare-fun c!146535 () Bool)

(declare-fun lt!676056 () (_ BitVec 64))

(assert (=> b!1577776 (= c!146535 (or (= lt!676056 k0!761) (= (bvadd lt!676056 lt!676056) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577777 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577777 (= e!880131 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1577778 () Bool)

(declare-fun e!880133 () Bool)

(assert (=> b!1577778 (= e!880133 (bvsge (x!142151 lt!676055) #b01111111111111111111111111111110))))

(declare-fun b!1577779 () Bool)

(assert (=> b!1577779 (and (bvsge (index!56984 lt!676055) #b00000000000000000000000000000000) (bvslt (index!56984 lt!676055) (size!51438 _keys!605)))))

(declare-fun res!1077259 () Bool)

(assert (=> b!1577779 (= res!1077259 (= (select (arr!50887 _keys!605) (index!56984 lt!676055)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577779 (=> res!1077259 e!880130)))

(declare-fun d!166111 () Bool)

(assert (=> d!166111 e!880133))

(declare-fun c!146536 () Bool)

(assert (=> d!166111 (= c!146536 (and ((_ is Intermediate!13646) lt!676055) (undefined!14458 lt!676055)))))

(assert (=> d!166111 (= lt!676055 e!880129)))

(declare-fun c!146537 () Bool)

(assert (=> d!166111 (= c!146537 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!166111 (= lt!676056 (select (arr!50887 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!166111 (validMask!0 mask!898)))

(assert (=> d!166111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!676055)))

(declare-fun b!1577780 () Bool)

(assert (=> b!1577780 (= e!880133 e!880132)))

(declare-fun res!1077260 () Bool)

(assert (=> b!1577780 (= res!1077260 (and ((_ is Intermediate!13646) lt!676055) (not (undefined!14458 lt!676055)) (bvslt (x!142151 lt!676055) #b01111111111111111111111111111110) (bvsge (x!142151 lt!676055) #b00000000000000000000000000000000) (bvsge (x!142151 lt!676055) #b00000000000000000000000000000000)))))

(assert (=> b!1577780 (=> (not res!1077260) (not e!880132))))

(declare-fun b!1577781 () Bool)

(assert (=> b!1577781 (= e!880131 (Intermediate!13646 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(assert (= (and d!166111 c!146537) b!1577773))

(assert (= (and d!166111 (not c!146537)) b!1577776))

(assert (= (and b!1577776 c!146535) b!1577781))

(assert (= (and b!1577776 (not c!146535)) b!1577777))

(assert (= (and d!166111 c!146536) b!1577778))

(assert (= (and d!166111 (not c!146536)) b!1577780))

(assert (= (and b!1577780 res!1077260) b!1577774))

(assert (= (and b!1577774 (not res!1077261)) b!1577779))

(assert (= (and b!1577779 (not res!1077259)) b!1577775))

(declare-fun m!1450631 () Bool)

(assert (=> b!1577779 m!1450631))

(assert (=> b!1577775 m!1450631))

(assert (=> b!1577777 m!1450595))

(declare-fun m!1450633 () Bool)

(assert (=> b!1577777 m!1450633))

(assert (=> b!1577777 m!1450633))

(declare-fun m!1450635 () Bool)

(assert (=> b!1577777 m!1450635))

(assert (=> b!1577774 m!1450631))

(assert (=> d!166111 m!1450595))

(declare-fun m!1450637 () Bool)

(assert (=> d!166111 m!1450637))

(assert (=> d!166111 m!1450587))

(assert (=> b!1577709 d!166111))

(declare-fun d!166119 () Bool)

(declare-fun lt!676072 () (_ BitVec 32))

(declare-fun lt!676071 () (_ BitVec 32))

(assert (=> d!166119 (= lt!676072 (bvmul (bvxor lt!676071 (bvlshr lt!676071 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166119 (= lt!676071 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166119 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077262 (let ((h!38315 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142157 (bvmul (bvxor h!38315 (bvlshr h!38315 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142157 (bvlshr x!142157 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077262 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077262 #b00000000000000000000000000000000))))))

(assert (=> d!166119 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!676072 (bvlshr lt!676072 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1577709 d!166119))

(declare-fun d!166123 () Bool)

(assert (=> d!166123 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136252 d!166123))

(declare-fun d!166133 () Bool)

(assert (=> d!166133 (= (array_inv!39842 _keys!605) (bvsge (size!51438 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136252 d!166133))

(declare-fun d!166135 () Bool)

(assert (=> d!166135 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577708 d!166135))

(check-sat (not b!1577777) (not d!166111))
(check-sat)
