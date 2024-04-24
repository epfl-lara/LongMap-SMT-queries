; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136640 () Bool)

(assert start!136640)

(declare-fun res!1077968 () Bool)

(declare-fun e!880939 () Bool)

(assert (=> start!136640 (=> (not res!1077968) (not e!880939))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136640 (= res!1077968 (validMask!0 mask!898))))

(assert (=> start!136640 e!880939))

(assert (=> start!136640 true))

(declare-datatypes ((array!105633 0))(
  ( (array!105634 (arr!50934 (Array (_ BitVec 32) (_ BitVec 64))) (size!51485 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105633)

(declare-fun array_inv!39889 (array!105633) Bool)

(assert (=> start!136640 (array_inv!39889 _keys!605)))

(declare-fun b!1579131 () Bool)

(declare-fun e!880938 () Bool)

(declare-datatypes ((SeekEntryResult!13693 0))(
  ( (MissingZero!13693 (index!57170 (_ BitVec 32))) (Found!13693 (index!57171 (_ BitVec 32))) (Intermediate!13693 (undefined!14505 Bool) (index!57172 (_ BitVec 32)) (x!142384 (_ BitVec 32))) (Undefined!13693) (MissingVacant!13693 (index!57173 (_ BitVec 32))) )
))
(declare-fun lt!676654 () SeekEntryResult!13693)

(assert (=> b!1579131 (= e!880938 (and (not (is-Undefined!13693 lt!676654)) (not (is-Found!13693 lt!676654)) (is-MissingZero!13693 lt!676654) (or (bvslt (index!57170 lt!676654) #b00000000000000000000000000000000) (bvsge (index!57170 lt!676654) (size!51485 _keys!605)))))))

(declare-fun err!194 () SeekEntryResult!13693)

(assert (=> b!1579131 (= lt!676654 err!194)))

(assert (=> b!1579131 true))

(declare-fun b!1579130 () Bool)

(assert (=> b!1579130 (= e!880939 e!880938)))

(declare-fun res!1077971 () Bool)

(assert (=> b!1579130 (=> (not res!1077971) (not e!880938))))

(declare-fun lt!676655 () Bool)

(declare-fun lt!676656 () SeekEntryResult!13693)

(assert (=> b!1579130 (= res!1077971 (and (or lt!676655 (not (undefined!14505 lt!676656))) (or lt!676655 (undefined!14505 lt!676656))))))

(assert (=> b!1579130 (= lt!676655 (not (is-Intermediate!13693 lt!676656)))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105633 (_ BitVec 32)) SeekEntryResult!13693)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579130 (= lt!676656 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1579129 () Bool)

(declare-fun res!1077969 () Bool)

(assert (=> b!1579129 (=> (not res!1077969) (not e!880939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579129 (= res!1077969 (validKeyInArray!0 k!761))))

(declare-fun b!1579128 () Bool)

(declare-fun res!1077970 () Bool)

(assert (=> b!1579128 (=> (not res!1077970) (not e!880939))))

(assert (=> b!1579128 (= res!1077970 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51485 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(assert (= (and start!136640 res!1077968) b!1579128))

(assert (= (and b!1579128 res!1077970) b!1579129))

(assert (= (and b!1579129 res!1077969) b!1579130))

(assert (= (and b!1579130 res!1077971) b!1579131))

(declare-fun m!1451453 () Bool)

(assert (=> start!136640 m!1451453))

(declare-fun m!1451455 () Bool)

(assert (=> start!136640 m!1451455))

(declare-fun m!1451457 () Bool)

(assert (=> b!1579130 m!1451457))

(assert (=> b!1579130 m!1451457))

(declare-fun m!1451459 () Bool)

(assert (=> b!1579130 m!1451459))

(declare-fun m!1451461 () Bool)

(assert (=> b!1579129 m!1451461))

(push 1)

(assert (not b!1579130))

(assert (not start!136640))

(assert (not b!1579129))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1579150 () Bool)

(declare-fun lt!676662 () SeekEntryResult!13693)

(assert (=> b!1579150 (and (bvsge (index!57172 lt!676662) #b00000000000000000000000000000000) (bvslt (index!57172 lt!676662) (size!51485 _keys!605)))))

(declare-fun res!1077979 () Bool)

(assert (=> b!1579150 (= res!1077979 (= (select (arr!50934 _keys!605) (index!57172 lt!676662)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!880955 () Bool)

(assert (=> b!1579150 (=> res!1077979 e!880955)))

(declare-fun b!1579151 () Bool)

(declare-fun e!880951 () SeekEntryResult!13693)

(assert (=> b!1579151 (= e!880951 (Intermediate!13693 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1579152 () Bool)

(declare-fun e!880953 () Bool)

(assert (=> b!1579152 (= e!880953 (bvsge (x!142384 lt!676662) #b01111111111111111111111111111110))))

(declare-fun b!1579153 () Bool)

(declare-fun e!880952 () SeekEntryResult!13693)

(assert (=> b!1579153 (= e!880952 (Intermediate!13693 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1579154 () Bool)

(assert (=> b!1579154 (and (bvsge (index!57172 lt!676662) #b00000000000000000000000000000000) (bvslt (index!57172 lt!676662) (size!51485 _keys!605)))))

(declare-fun res!1077978 () Bool)

(assert (=> b!1579154 (= res!1077978 (= (select (arr!50934 _keys!605) (index!57172 lt!676662)) k!761))))

(assert (=> b!1579154 (=> res!1077978 e!880955)))

(declare-fun e!880954 () Bool)

(assert (=> b!1579154 (= e!880954 e!880955)))

(declare-fun b!1579155 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579155 (= e!880952 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k!761 _keys!605 mask!898))))

(declare-fun d!166437 () Bool)

(assert (=> d!166437 e!880953))

(declare-fun c!146877 () Bool)

(assert (=> d!166437 (= c!146877 (and (is-Intermediate!13693 lt!676662) (undefined!14505 lt!676662)))))

(assert (=> d!166437 (= lt!676662 e!880951)))

(declare-fun c!146879 () Bool)

(assert (=> d!166437 (= c!146879 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!676661 () (_ BitVec 64))

(assert (=> d!166437 (= lt!676661 (select (arr!50934 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!166437 (validMask!0 mask!898)))

(assert (=> d!166437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!676662)))

(declare-fun b!1579156 () Bool)

(assert (=> b!1579156 (= e!880953 e!880954)))

(declare-fun res!1077980 () Bool)

(assert (=> b!1579156 (= res!1077980 (and (is-Intermediate!13693 lt!676662) (not (undefined!14505 lt!676662)) (bvslt (x!142384 lt!676662) #b01111111111111111111111111111110) (bvsge (x!142384 lt!676662) #b00000000000000000000000000000000) (bvsge (x!142384 lt!676662) #b00000000000000000000000000000000)))))

(assert (=> b!1579156 (=> (not res!1077980) (not e!880954))))

(declare-fun b!1579157 () Bool)

(assert (=> b!1579157 (= e!880951 e!880952)))

(declare-fun c!146878 () Bool)

(assert (=> b!1579157 (= c!146878 (or (= lt!676661 k!761) (= (bvadd lt!676661 lt!676661) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1579158 () Bool)

(assert (=> b!1579158 (and (bvsge (index!57172 lt!676662) #b00000000000000000000000000000000) (bvslt (index!57172 lt!676662) (size!51485 _keys!605)))))

(assert (=> b!1579158 (= e!880955 (= (select (arr!50934 _keys!605) (index!57172 lt!676662)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!166437 c!146879) b!1579151))

(assert (= (and d!166437 (not c!146879)) b!1579157))

(assert (= (and b!1579157 c!146878) b!1579153))

(assert (= (and b!1579157 (not c!146878)) b!1579155))

(assert (= (and d!166437 c!146877) b!1579152))

(assert (= (and d!166437 (not c!146877)) b!1579156))

(assert (= (and b!1579156 res!1077980) b!1579154))

(assert (= (and b!1579154 (not res!1077978)) b!1579150))

(assert (= (and b!1579150 (not res!1077979)) b!1579158))

(assert (=> d!166437 m!1451457))

(declare-fun m!1451463 () Bool)

(assert (=> d!166437 m!1451463))

(assert (=> d!166437 m!1451453))

(declare-fun m!1451465 () Bool)

(assert (=> b!1579158 m!1451465))

(assert (=> b!1579155 m!1451457))

(declare-fun m!1451467 () Bool)

(assert (=> b!1579155 m!1451467))

(assert (=> b!1579155 m!1451467))

(declare-fun m!1451469 () Bool)

(assert (=> b!1579155 m!1451469))

(assert (=> b!1579154 m!1451465))

(assert (=> b!1579150 m!1451465))

(assert (=> b!1579130 d!166437))

(declare-fun d!166451 () Bool)

(declare-fun lt!676672 () (_ BitVec 32))

(declare-fun lt!676671 () (_ BitVec 32))

(assert (=> d!166451 (= lt!676672 (bvmul (bvxor lt!676671 (bvlshr lt!676671 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166451 (= lt!676671 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166451 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077981 (let ((h!38341 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142387 (bvmul (bvxor h!38341 (bvlshr h!38341 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142387 (bvlshr x!142387 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077981 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077981 #b00000000000000000000000000000000))))))

(assert (=> d!166451 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!676672 (bvlshr lt!676672 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1579130 d!166451))

(declare-fun d!166453 () Bool)

(assert (=> d!166453 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136640 d!166453))

(declare-fun d!166457 () Bool)

(assert (=> d!166457 (= (array_inv!39889 _keys!605) (bvsge (size!51485 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136640 d!166457))

(declare-fun d!166459 () Bool)

(assert (=> d!166459 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1579129 d!166459))

(push 1)

(assert (not b!1579155))

(assert (not d!166437))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

