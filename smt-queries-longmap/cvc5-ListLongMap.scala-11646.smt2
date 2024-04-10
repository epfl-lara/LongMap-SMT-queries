; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135936 () Bool)

(assert start!135936)

(declare-fun res!1076638 () Bool)

(declare-fun e!878816 () Bool)

(assert (=> start!135936 (=> (not res!1076638) (not e!878816))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135936 (= res!1076638 (validMask!0 mask!898))))

(assert (=> start!135936 e!878816))

(assert (=> start!135936 true))

(declare-datatypes ((array!105441 0))(
  ( (array!105442 (arr!50857 (Array (_ BitVec 32) (_ BitVec 64))) (size!51407 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105441)

(declare-fun array_inv!39584 (array!105441) Bool)

(assert (=> start!135936 (array_inv!39584 _keys!605)))

(declare-fun b!1575649 () Bool)

(declare-fun res!1076640 () Bool)

(assert (=> b!1575649 (=> (not res!1076640) (not e!878816))))

(assert (=> b!1575649 (= res!1076640 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51407 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575650 () Bool)

(declare-fun res!1076639 () Bool)

(assert (=> b!1575650 (=> (not res!1076639) (not e!878816))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575650 (= res!1076639 (validKeyInArray!0 k!761))))

(declare-fun b!1575651 () Bool)

(declare-datatypes ((SeekEntryResult!13722 0))(
  ( (MissingZero!13722 (index!57286 (_ BitVec 32))) (Found!13722 (index!57287 (_ BitVec 32))) (Intermediate!13722 (undefined!14534 Bool) (index!57288 (_ BitVec 32)) (x!142252 (_ BitVec 32))) (Undefined!13722) (MissingVacant!13722 (index!57289 (_ BitVec 32))) )
))
(declare-fun lt!675274 () SeekEntryResult!13722)

(assert (=> b!1575651 (= e!878816 (and (is-Intermediate!13722 lt!675274) (not (undefined!14534 lt!675274)) (not (= (select (arr!50857 _keys!605) (index!57288 lt!675274)) k!761)) (not (= (select (arr!50857 _keys!605) (index!57288 lt!675274)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!57288 lt!675274) #b00000000000000000000000000000000) (bvsge (index!57288 lt!675274) (size!51407 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105441 (_ BitVec 32)) SeekEntryResult!13722)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575651 (= lt!675274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135936 res!1076638) b!1575649))

(assert (= (and b!1575649 res!1076640) b!1575650))

(assert (= (and b!1575650 res!1076639) b!1575651))

(declare-fun m!1448629 () Bool)

(assert (=> start!135936 m!1448629))

(declare-fun m!1448631 () Bool)

(assert (=> start!135936 m!1448631))

(declare-fun m!1448633 () Bool)

(assert (=> b!1575650 m!1448633))

(declare-fun m!1448635 () Bool)

(assert (=> b!1575651 m!1448635))

(declare-fun m!1448637 () Bool)

(assert (=> b!1575651 m!1448637))

(assert (=> b!1575651 m!1448637))

(declare-fun m!1448639 () Bool)

(assert (=> b!1575651 m!1448639))

(push 1)

(assert (not b!1575651))

(assert (not start!135936))

(assert (not b!1575650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165475 () Bool)

(declare-fun e!878851 () Bool)

(assert (=> d!165475 e!878851))

(declare-fun c!145786 () Bool)

(declare-fun lt!675289 () SeekEntryResult!13722)

(assert (=> d!165475 (= c!145786 (and (is-Intermediate!13722 lt!675289) (undefined!14534 lt!675289)))))

(declare-fun e!878850 () SeekEntryResult!13722)

(assert (=> d!165475 (= lt!675289 e!878850)))

(declare-fun c!145787 () Bool)

(assert (=> d!165475 (= c!145787 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675290 () (_ BitVec 64))

(assert (=> d!165475 (= lt!675290 (select (arr!50857 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165475 (validMask!0 mask!898)))

(assert (=> d!165475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675289)))

(declare-fun e!878852 () SeekEntryResult!13722)

(declare-fun b!1575706 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575706 (= e!878852 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575707 () Bool)

(assert (=> b!1575707 (and (bvsge (index!57288 lt!675289) #b00000000000000000000000000000000) (bvslt (index!57288 lt!675289) (size!51407 _keys!605)))))

(declare-fun e!878853 () Bool)

(assert (=> b!1575707 (= e!878853 (= (select (arr!50857 _keys!605) (index!57288 lt!675289)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575708 () Bool)

(assert (=> b!1575708 (and (bvsge (index!57288 lt!675289) #b00000000000000000000000000000000) (bvslt (index!57288 lt!675289) (size!51407 _keys!605)))))

(declare-fun res!1076672 () Bool)

(assert (=> b!1575708 (= res!1076672 (= (select (arr!50857 _keys!605) (index!57288 lt!675289)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575708 (=> res!1076672 e!878853)))

(declare-fun b!1575709 () Bool)

(assert (=> b!1575709 (and (bvsge (index!57288 lt!675289) #b00000000000000000000000000000000) (bvslt (index!57288 lt!675289) (size!51407 _keys!605)))))

(declare-fun res!1076673 () Bool)

(assert (=> b!1575709 (= res!1076673 (= (select (arr!50857 _keys!605) (index!57288 lt!675289)) k!761))))

(assert (=> b!1575709 (=> res!1076673 e!878853)))

(declare-fun e!878849 () Bool)

(assert (=> b!1575709 (= e!878849 e!878853)))

(declare-fun b!1575710 () Bool)

(assert (=> b!1575710 (= e!878852 (Intermediate!13722 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575711 () Bool)

(assert (=> b!1575711 (= e!878850 (Intermediate!13722 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575712 () Bool)

(assert (=> b!1575712 (= e!878850 e!878852)))

(declare-fun c!145788 () Bool)

(assert (=> b!1575712 (= c!145788 (or (= lt!675290 k!761) (= (bvadd lt!675290 lt!675290) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575713 () Bool)

(assert (=> b!1575713 (= e!878851 (bvsge (x!142252 lt!675289) #b01111111111111111111111111111110))))

(declare-fun b!1575714 () Bool)

(assert (=> b!1575714 (= e!878851 e!878849)))

(declare-fun res!1076671 () Bool)

(assert (=> b!1575714 (= res!1076671 (and (is-Intermediate!13722 lt!675289) (not (undefined!14534 lt!675289)) (bvslt (x!142252 lt!675289) #b01111111111111111111111111111110) (bvsge (x!142252 lt!675289) #b00000000000000000000000000000000) (bvsge (x!142252 lt!675289) #b00000000000000000000000000000000)))))

(assert (=> b!1575714 (=> (not res!1076671) (not e!878849))))

(assert (= (and d!165475 c!145787) b!1575711))

(assert (= (and d!165475 (not c!145787)) b!1575712))

(assert (= (and b!1575712 c!145788) b!1575710))

(assert (= (and b!1575712 (not c!145788)) b!1575706))

(assert (= (and d!165475 c!145786) b!1575713))

(assert (= (and d!165475 (not c!145786)) b!1575714))

(assert (= (and b!1575714 res!1076671) b!1575709))

(assert (= (and b!1575709 (not res!1076673)) b!1575708))

(assert (= (and b!1575708 (not res!1076672)) b!1575707))

(declare-fun m!1448665 () Bool)

(assert (=> b!1575708 m!1448665))

(assert (=> d!165475 m!1448637))

(declare-fun m!1448667 () Bool)

(assert (=> d!165475 m!1448667))

(assert (=> d!165475 m!1448629))

(assert (=> b!1575707 m!1448665))

(assert (=> b!1575709 m!1448665))

(assert (=> b!1575706 m!1448637))

(declare-fun m!1448669 () Bool)

(assert (=> b!1575706 m!1448669))

(assert (=> b!1575706 m!1448669))

(declare-fun m!1448671 () Bool)

(assert (=> b!1575706 m!1448671))

(assert (=> b!1575651 d!165475))

(declare-fun d!165479 () Bool)

(declare-fun lt!675298 () (_ BitVec 32))

(declare-fun lt!675297 () (_ BitVec 32))

(assert (=> d!165479 (= lt!675298 (bvmul (bvxor lt!675297 (bvlshr lt!675297 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165479 (= lt!675297 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165479 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076677 (let ((h!38270 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142257 (bvmul (bvxor h!38270 (bvlshr h!38270 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142257 (bvlshr x!142257 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076677 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076677 #b00000000000000000000000000000000))))))

(assert (=> d!165479 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675298 (bvlshr lt!675298 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575651 d!165479))

(declare-fun d!165483 () Bool)

(assert (=> d!165483 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135936 d!165483))

(declare-fun d!165487 () Bool)

(assert (=> d!165487 (= (array_inv!39584 _keys!605) (bvsge (size!51407 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135936 d!165487))

(declare-fun d!165489 () Bool)

(assert (=> d!165489 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575650 d!165489))

(push 1)

(assert (not d!165475))

(assert (not b!1575706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

