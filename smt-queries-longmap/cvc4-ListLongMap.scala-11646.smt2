; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135940 () Bool)

(assert start!135940)

(declare-fun res!1076656 () Bool)

(declare-fun e!878828 () Bool)

(assert (=> start!135940 (=> (not res!1076656) (not e!878828))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135940 (= res!1076656 (validMask!0 mask!898))))

(assert (=> start!135940 e!878828))

(assert (=> start!135940 true))

(declare-datatypes ((array!105445 0))(
  ( (array!105446 (arr!50859 (Array (_ BitVec 32) (_ BitVec 64))) (size!51409 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105445)

(declare-fun array_inv!39586 (array!105445) Bool)

(assert (=> start!135940 (array_inv!39586 _keys!605)))

(declare-fun b!1575667 () Bool)

(declare-fun res!1076658 () Bool)

(assert (=> b!1575667 (=> (not res!1076658) (not e!878828))))

(assert (=> b!1575667 (= res!1076658 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51409 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575668 () Bool)

(declare-fun res!1076657 () Bool)

(assert (=> b!1575668 (=> (not res!1076657) (not e!878828))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575668 (= res!1076657 (validKeyInArray!0 k!761))))

(declare-datatypes ((SeekEntryResult!13724 0))(
  ( (MissingZero!13724 (index!57294 (_ BitVec 32))) (Found!13724 (index!57295 (_ BitVec 32))) (Intermediate!13724 (undefined!14536 Bool) (index!57296 (_ BitVec 32)) (x!142254 (_ BitVec 32))) (Undefined!13724) (MissingVacant!13724 (index!57297 (_ BitVec 32))) )
))
(declare-fun lt!675280 () SeekEntryResult!13724)

(declare-fun b!1575669 () Bool)

(assert (=> b!1575669 (= e!878828 (and (is-Intermediate!13724 lt!675280) (not (undefined!14536 lt!675280)) (not (= (select (arr!50859 _keys!605) (index!57296 lt!675280)) k!761)) (not (= (select (arr!50859 _keys!605) (index!57296 lt!675280)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!57296 lt!675280) #b00000000000000000000000000000000) (bvsge (index!57296 lt!675280) (size!51409 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105445 (_ BitVec 32)) SeekEntryResult!13724)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575669 (= lt!675280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135940 res!1076656) b!1575667))

(assert (= (and b!1575667 res!1076658) b!1575668))

(assert (= (and b!1575668 res!1076657) b!1575669))

(declare-fun m!1448653 () Bool)

(assert (=> start!135940 m!1448653))

(declare-fun m!1448655 () Bool)

(assert (=> start!135940 m!1448655))

(declare-fun m!1448657 () Bool)

(assert (=> b!1575668 m!1448657))

(declare-fun m!1448659 () Bool)

(assert (=> b!1575669 m!1448659))

(declare-fun m!1448661 () Bool)

(assert (=> b!1575669 m!1448661))

(assert (=> b!1575669 m!1448661))

(declare-fun m!1448663 () Bool)

(assert (=> b!1575669 m!1448663))

(push 1)

(assert (not b!1575669))

(assert (not start!135940))

(assert (not b!1575668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1575742 () Bool)

(declare-fun e!878872 () SeekEntryResult!13724)

(declare-fun e!878871 () SeekEntryResult!13724)

(assert (=> b!1575742 (= e!878872 e!878871)))

(declare-fun c!145799 () Bool)

(declare-fun lt!675310 () (_ BitVec 64))

(assert (=> b!1575742 (= c!145799 (or (= lt!675310 k!761) (= (bvadd lt!675310 lt!675310) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575743 () Bool)

(assert (=> b!1575743 (= e!878871 (Intermediate!13724 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575744 () Bool)

(declare-fun e!878869 () Bool)

(declare-fun e!878870 () Bool)

(assert (=> b!1575744 (= e!878869 e!878870)))

(declare-fun res!1076686 () Bool)

(declare-fun lt!675309 () SeekEntryResult!13724)

(assert (=> b!1575744 (= res!1076686 (and (is-Intermediate!13724 lt!675309) (not (undefined!14536 lt!675309)) (bvslt (x!142254 lt!675309) #b01111111111111111111111111111110) (bvsge (x!142254 lt!675309) #b00000000000000000000000000000000) (bvsge (x!142254 lt!675309) #b00000000000000000000000000000000)))))

(assert (=> b!1575744 (=> (not res!1076686) (not e!878870))))

(declare-fun b!1575745 () Bool)

(assert (=> b!1575745 (= e!878872 (Intermediate!13724 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575746 () Bool)

(assert (=> b!1575746 (and (bvsge (index!57296 lt!675309) #b00000000000000000000000000000000) (bvslt (index!57296 lt!675309) (size!51409 _keys!605)))))

(declare-fun res!1076687 () Bool)

(assert (=> b!1575746 (= res!1076687 (= (select (arr!50859 _keys!605) (index!57296 lt!675309)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878873 () Bool)

(assert (=> b!1575746 (=> res!1076687 e!878873)))

(declare-fun b!1575747 () Bool)

(assert (=> b!1575747 (and (bvsge (index!57296 lt!675309) #b00000000000000000000000000000000) (bvslt (index!57296 lt!675309) (size!51409 _keys!605)))))

(declare-fun res!1076685 () Bool)

(assert (=> b!1575747 (= res!1076685 (= (select (arr!50859 _keys!605) (index!57296 lt!675309)) k!761))))

(assert (=> b!1575747 (=> res!1076685 e!878873)))

(assert (=> b!1575747 (= e!878870 e!878873)))

(declare-fun b!1575748 () Bool)

(assert (=> b!1575748 (= e!878869 (bvsge (x!142254 lt!675309) #b01111111111111111111111111111110))))

(declare-fun b!1575749 () Bool)

(assert (=> b!1575749 (and (bvsge (index!57296 lt!675309) #b00000000000000000000000000000000) (bvslt (index!57296 lt!675309) (size!51409 _keys!605)))))

(assert (=> b!1575749 (= e!878873 (= (select (arr!50859 _keys!605) (index!57296 lt!675309)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575750 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575750 (= e!878871 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun d!165477 () Bool)

(assert (=> d!165477 e!878869))

(declare-fun c!145800 () Bool)

(assert (=> d!165477 (= c!145800 (and (is-Intermediate!13724 lt!675309) (undefined!14536 lt!675309)))))

(assert (=> d!165477 (= lt!675309 e!878872)))

(declare-fun c!145798 () Bool)

(assert (=> d!165477 (= c!145798 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165477 (= lt!675310 (select (arr!50859 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165477 (validMask!0 mask!898)))

(assert (=> d!165477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675309)))

(assert (= (and d!165477 c!145798) b!1575745))

(assert (= (and d!165477 (not c!145798)) b!1575742))

(assert (= (and b!1575742 c!145799) b!1575743))

(assert (= (and b!1575742 (not c!145799)) b!1575750))

(assert (= (and d!165477 c!145800) b!1575748))

(assert (= (and d!165477 (not c!145800)) b!1575744))

(assert (= (and b!1575744 res!1076686) b!1575747))

(assert (= (and b!1575747 (not res!1076685)) b!1575746))

(assert (= (and b!1575746 (not res!1076687)) b!1575749))

(declare-fun m!1448681 () Bool)

(assert (=> b!1575749 m!1448681))

(assert (=> b!1575747 m!1448681))

(assert (=> d!165477 m!1448661))

(declare-fun m!1448683 () Bool)

(assert (=> d!165477 m!1448683))

(assert (=> d!165477 m!1448653))

(assert (=> b!1575746 m!1448681))

(assert (=> b!1575750 m!1448661))

(declare-fun m!1448685 () Bool)

(assert (=> b!1575750 m!1448685))

(assert (=> b!1575750 m!1448685))

(declare-fun m!1448687 () Bool)

(assert (=> b!1575750 m!1448687))

(assert (=> b!1575669 d!165477))

(declare-fun d!165491 () Bool)

(declare-fun lt!675316 () (_ BitVec 32))

(declare-fun lt!675315 () (_ BitVec 32))

(assert (=> d!165491 (= lt!675316 (bvmul (bvxor lt!675315 (bvlshr lt!675315 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165491 (= lt!675315 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165491 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076688 (let ((h!38272 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142260 (bvmul (bvxor h!38272 (bvlshr h!38272 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142260 (bvlshr x!142260 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076688 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076688 #b00000000000000000000000000000000))))))

(assert (=> d!165491 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675316 (bvlshr lt!675316 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575669 d!165491))

(declare-fun d!165497 () Bool)

(assert (=> d!165497 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135940 d!165497))

(declare-fun d!165499 () Bool)

(assert (=> d!165499 (= (array_inv!39586 _keys!605) (bvsge (size!51409 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135940 d!165499))

(declare-fun d!165501 () Bool)

(assert (=> d!165501 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575668 d!165501))

(push 1)

