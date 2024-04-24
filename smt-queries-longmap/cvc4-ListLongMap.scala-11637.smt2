; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136218 () Bool)

(assert start!136218)

(declare-fun res!1077174 () Bool)

(declare-fun e!880033 () Bool)

(assert (=> start!136218 (=> (not res!1077174) (not e!880033))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136218 (= res!1077174 (validMask!0 mask!898))))

(assert (=> start!136218 e!880033))

(assert (=> start!136218 true))

(declare-datatypes ((array!105505 0))(
  ( (array!105506 (arr!50885 (Array (_ BitVec 32) (_ BitVec 64))) (size!51436 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105505)

(declare-fun array_inv!39840 (array!105505) Bool)

(assert (=> start!136218 (array_inv!39840 _keys!605)))

(declare-fun b!1577608 () Bool)

(declare-fun res!1077175 () Bool)

(assert (=> b!1577608 (=> (not res!1077175) (not e!880033))))

(assert (=> b!1577608 (= res!1077175 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51436 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577609 () Bool)

(declare-fun res!1077176 () Bool)

(assert (=> b!1577609 (=> (not res!1077176) (not e!880033))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577609 (= res!1077176 (validKeyInArray!0 k!761))))

(declare-fun b!1577610 () Bool)

(declare-datatypes ((SeekEntryResult!13644 0))(
  ( (MissingZero!13644 (index!56974 (_ BitVec 32))) (Found!13644 (index!56975 (_ BitVec 32))) (Intermediate!13644 (undefined!14456 Bool) (index!56976 (_ BitVec 32)) (x!142135 (_ BitVec 32))) (Undefined!13644) (MissingVacant!13644 (index!56977 (_ BitVec 32))) )
))
(declare-fun lt!675996 () SeekEntryResult!13644)

(assert (=> b!1577610 (= e!880033 (and (is-Intermediate!13644 lt!675996) (not (undefined!14456 lt!675996)) (or (bvslt (index!56976 lt!675996) #b00000000000000000000000000000000) (bvsge (index!56976 lt!675996) (size!51436 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105505 (_ BitVec 32)) SeekEntryResult!13644)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577610 (= lt!675996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136218 res!1077174) b!1577608))

(assert (= (and b!1577608 res!1077175) b!1577609))

(assert (= (and b!1577609 res!1077176) b!1577610))

(declare-fun m!1450543 () Bool)

(assert (=> start!136218 m!1450543))

(declare-fun m!1450545 () Bool)

(assert (=> start!136218 m!1450545))

(declare-fun m!1450547 () Bool)

(assert (=> b!1577609 m!1450547))

(declare-fun m!1450549 () Bool)

(assert (=> b!1577610 m!1450549))

(assert (=> b!1577610 m!1450549))

(declare-fun m!1450551 () Bool)

(assert (=> b!1577610 m!1450551))

(push 1)

(assert (not b!1577610))

(assert (not start!136218))

(assert (not b!1577609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1577693 () Bool)

(declare-fun lt!676022 () SeekEntryResult!13644)

(assert (=> b!1577693 (and (bvsge (index!56976 lt!676022) #b00000000000000000000000000000000) (bvslt (index!56976 lt!676022) (size!51436 _keys!605)))))

(declare-fun res!1077214 () Bool)

(assert (=> b!1577693 (= res!1077214 (= (select (arr!50885 _keys!605) (index!56976 lt!676022)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!880083 () Bool)

(assert (=> b!1577693 (=> res!1077214 e!880083)))

(declare-fun b!1577694 () Bool)

(assert (=> b!1577694 (and (bvsge (index!56976 lt!676022) #b00000000000000000000000000000000) (bvslt (index!56976 lt!676022) (size!51436 _keys!605)))))

(declare-fun res!1077212 () Bool)

(assert (=> b!1577694 (= res!1077212 (= (select (arr!50885 _keys!605) (index!56976 lt!676022)) k!761))))

(assert (=> b!1577694 (=> res!1077212 e!880083)))

(declare-fun e!880084 () Bool)

(assert (=> b!1577694 (= e!880084 e!880083)))

(declare-fun b!1577695 () Bool)

(declare-fun e!880082 () Bool)

(assert (=> b!1577695 (= e!880082 e!880084)))

(declare-fun res!1077213 () Bool)

(assert (=> b!1577695 (= res!1077213 (and (is-Intermediate!13644 lt!676022) (not (undefined!14456 lt!676022)) (bvslt (x!142135 lt!676022) #b01111111111111111111111111111110) (bvsge (x!142135 lt!676022) #b00000000000000000000000000000000) (bvsge (x!142135 lt!676022) #b00000000000000000000000000000000)))))

(assert (=> b!1577695 (=> (not res!1077213) (not e!880084))))

(declare-fun b!1577696 () Bool)

(declare-fun e!880085 () SeekEntryResult!13644)

(assert (=> b!1577696 (= e!880085 (Intermediate!13644 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1577697 () Bool)

(declare-fun e!880081 () SeekEntryResult!13644)

(assert (=> b!1577697 (= e!880085 e!880081)))

(declare-fun c!146518 () Bool)

(declare-fun lt!676023 () (_ BitVec 64))

(assert (=> b!1577697 (= c!146518 (or (= lt!676023 k!761) (= (bvadd lt!676023 lt!676023) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577698 () Bool)

(assert (=> b!1577698 (and (bvsge (index!56976 lt!676022) #b00000000000000000000000000000000) (bvslt (index!56976 lt!676022) (size!51436 _keys!605)))))

(assert (=> b!1577698 (= e!880083 (= (select (arr!50885 _keys!605) (index!56976 lt!676022)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577699 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577699 (= e!880081 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1577700 () Bool)

(assert (=> b!1577700 (= e!880081 (Intermediate!13644 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1577692 () Bool)

(assert (=> b!1577692 (= e!880082 (bvsge (x!142135 lt!676022) #b01111111111111111111111111111110))))

(declare-fun d!166083 () Bool)

(assert (=> d!166083 e!880082))

(declare-fun c!146519 () Bool)

(assert (=> d!166083 (= c!146519 (and (is-Intermediate!13644 lt!676022) (undefined!14456 lt!676022)))))

(assert (=> d!166083 (= lt!676022 e!880085)))

(declare-fun c!146517 () Bool)

(assert (=> d!166083 (= c!146517 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!166083 (= lt!676023 (select (arr!50885 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!166083 (validMask!0 mask!898)))

(assert (=> d!166083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!676022)))

(assert (= (and d!166083 c!146517) b!1577696))

(assert (= (and d!166083 (not c!146517)) b!1577697))

(assert (= (and b!1577697 c!146518) b!1577700))

(assert (= (and b!1577697 (not c!146518)) b!1577699))

(assert (= (and d!166083 c!146519) b!1577692))

(assert (= (and d!166083 (not c!146519)) b!1577695))

(assert (= (and b!1577695 res!1077213) b!1577694))

(assert (= (and b!1577694 (not res!1077212)) b!1577693))

(assert (= (and b!1577693 (not res!1077214)) b!1577698))

(declare-fun m!1450579 () Bool)

(assert (=> b!1577693 m!1450579))

(assert (=> d!166083 m!1450549))

(declare-fun m!1450581 () Bool)

(assert (=> d!166083 m!1450581))

(assert (=> d!166083 m!1450543))

(assert (=> b!1577698 m!1450579))

(assert (=> b!1577694 m!1450579))

(assert (=> b!1577699 m!1450549))

(declare-fun m!1450583 () Bool)

(assert (=> b!1577699 m!1450583))

(assert (=> b!1577699 m!1450583))

(declare-fun m!1450585 () Bool)

(assert (=> b!1577699 m!1450585))

(assert (=> b!1577610 d!166083))

(declare-fun d!166091 () Bool)

(declare-fun lt!676035 () (_ BitVec 32))

(declare-fun lt!676034 () (_ BitVec 32))

(assert (=> d!166091 (= lt!676035 (bvmul (bvxor lt!676034 (bvlshr lt!676034 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166091 (= lt!676034 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166091 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077215 (let ((h!38313 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142142 (bvmul (bvxor h!38313 (bvlshr h!38313 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142142 (bvlshr x!142142 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077215 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077215 #b00000000000000000000000000000000))))))

(assert (=> d!166091 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!676035 (bvlshr lt!676035 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1577610 d!166091))

(declare-fun d!166095 () Bool)

(assert (=> d!166095 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136218 d!166095))

(declare-fun d!166105 () Bool)

(assert (=> d!166105 (= (array_inv!39840 _keys!605) (bvsge (size!51436 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136218 d!166105))

(declare-fun d!166107 () Bool)

(assert (=> d!166107 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577609 d!166107))

(push 1)

(assert (not d!166083))

(assert (not b!1577699))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

