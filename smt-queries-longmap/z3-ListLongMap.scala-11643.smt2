; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135890 () Bool)

(assert start!135890)

(declare-fun res!1076537 () Bool)

(declare-fun e!878722 () Bool)

(assert (=> start!135890 (=> (not res!1076537) (not e!878722))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135890 (= res!1076537 (validMask!0 mask!898))))

(assert (=> start!135890 e!878722))

(assert (=> start!135890 true))

(declare-datatypes ((array!105422 0))(
  ( (array!105423 (arr!50849 (Array (_ BitVec 32) (_ BitVec 64))) (size!51399 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105422)

(declare-fun array_inv!39576 (array!105422) Bool)

(assert (=> start!135890 (array_inv!39576 _keys!605)))

(declare-fun b!1575496 () Bool)

(declare-fun res!1076536 () Bool)

(assert (=> b!1575496 (=> (not res!1076536) (not e!878722))))

(assert (=> b!1575496 (= res!1076536 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51399 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575497 () Bool)

(declare-fun res!1076538 () Bool)

(assert (=> b!1575497 (=> (not res!1076538) (not e!878722))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575497 (= res!1076538 (validKeyInArray!0 k0!761))))

(declare-datatypes ((SeekEntryResult!13714 0))(
  ( (MissingZero!13714 (index!57254 (_ BitVec 32))) (Found!13714 (index!57255 (_ BitVec 32))) (Intermediate!13714 (undefined!14526 Bool) (index!57256 (_ BitVec 32)) (x!142214 (_ BitVec 32))) (Undefined!13714) (MissingVacant!13714 (index!57257 (_ BitVec 32))) )
))
(declare-fun lt!675214 () SeekEntryResult!13714)

(declare-fun b!1575498 () Bool)

(get-info :version)

(assert (=> b!1575498 (= e!878722 (and ((_ is Intermediate!13714) lt!675214) (not (undefined!14526 lt!675214)) (not (= (select (arr!50849 _keys!605) (index!57256 lt!675214)) k0!761)) (= (select (arr!50849 _keys!605) (index!57256 lt!675214)) #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!57256 lt!675214) #b00000000000000000000000000000000) (bvsge (index!57256 lt!675214) (size!51399 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105422 (_ BitVec 32)) SeekEntryResult!13714)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575498 (= lt!675214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135890 res!1076537) b!1575496))

(assert (= (and b!1575496 res!1076536) b!1575497))

(assert (= (and b!1575497 res!1076538) b!1575498))

(declare-fun m!1448521 () Bool)

(assert (=> start!135890 m!1448521))

(declare-fun m!1448523 () Bool)

(assert (=> start!135890 m!1448523))

(declare-fun m!1448525 () Bool)

(assert (=> b!1575497 m!1448525))

(declare-fun m!1448527 () Bool)

(assert (=> b!1575498 m!1448527))

(declare-fun m!1448529 () Bool)

(assert (=> b!1575498 m!1448529))

(assert (=> b!1575498 m!1448529))

(declare-fun m!1448531 () Bool)

(assert (=> b!1575498 m!1448531))

(check-sat (not b!1575497) (not b!1575498) (not start!135890))
(check-sat)
(get-model)

(declare-fun d!165437 () Bool)

(assert (=> d!165437 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575497 d!165437))

(declare-fun e!878752 () SeekEntryResult!13714)

(declare-fun b!1575544 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575544 (= e!878752 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1575545 () Bool)

(declare-fun lt!675226 () SeekEntryResult!13714)

(assert (=> b!1575545 (and (bvsge (index!57256 lt!675226) #b00000000000000000000000000000000) (bvslt (index!57256 lt!675226) (size!51399 _keys!605)))))

(declare-fun e!878753 () Bool)

(assert (=> b!1575545 (= e!878753 (= (select (arr!50849 _keys!605) (index!57256 lt!675226)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575546 () Bool)

(assert (=> b!1575546 (and (bvsge (index!57256 lt!675226) #b00000000000000000000000000000000) (bvslt (index!57256 lt!675226) (size!51399 _keys!605)))))

(declare-fun res!1076560 () Bool)

(assert (=> b!1575546 (= res!1076560 (= (select (arr!50849 _keys!605) (index!57256 lt!675226)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575546 (=> res!1076560 e!878753)))

(declare-fun b!1575547 () Bool)

(assert (=> b!1575547 (and (bvsge (index!57256 lt!675226) #b00000000000000000000000000000000) (bvslt (index!57256 lt!675226) (size!51399 _keys!605)))))

(declare-fun res!1076561 () Bool)

(assert (=> b!1575547 (= res!1076561 (= (select (arr!50849 _keys!605) (index!57256 lt!675226)) k0!761))))

(assert (=> b!1575547 (=> res!1076561 e!878753)))

(declare-fun e!878754 () Bool)

(assert (=> b!1575547 (= e!878754 e!878753)))

(declare-fun b!1575548 () Bool)

(declare-fun e!878751 () Bool)

(assert (=> b!1575548 (= e!878751 e!878754)))

(declare-fun res!1076562 () Bool)

(assert (=> b!1575548 (= res!1076562 (and ((_ is Intermediate!13714) lt!675226) (not (undefined!14526 lt!675226)) (bvslt (x!142214 lt!675226) #b01111111111111111111111111111110) (bvsge (x!142214 lt!675226) #b00000000000000000000000000000000) (bvsge (x!142214 lt!675226) #b00000000000000000000000000000000)))))

(assert (=> b!1575548 (=> (not res!1076562) (not e!878754))))

(declare-fun b!1575549 () Bool)

(declare-fun e!878750 () SeekEntryResult!13714)

(assert (=> b!1575549 (= e!878750 (Intermediate!13714 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575551 () Bool)

(assert (=> b!1575551 (= e!878751 (bvsge (x!142214 lt!675226) #b01111111111111111111111111111110))))

(declare-fun b!1575552 () Bool)

(assert (=> b!1575552 (= e!878750 e!878752)))

(declare-fun c!145760 () Bool)

(declare-fun lt!675227 () (_ BitVec 64))

(assert (=> b!1575552 (= c!145760 (or (= lt!675227 k0!761) (= (bvadd lt!675227 lt!675227) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!165439 () Bool)

(assert (=> d!165439 e!878751))

(declare-fun c!145761 () Bool)

(assert (=> d!165439 (= c!145761 (and ((_ is Intermediate!13714) lt!675226) (undefined!14526 lt!675226)))))

(assert (=> d!165439 (= lt!675226 e!878750)))

(declare-fun c!145759 () Bool)

(assert (=> d!165439 (= c!145759 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165439 (= lt!675227 (select (arr!50849 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165439 (validMask!0 mask!898)))

(assert (=> d!165439 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675226)))

(declare-fun b!1575550 () Bool)

(assert (=> b!1575550 (= e!878752 (Intermediate!13714 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(assert (= (and d!165439 c!145759) b!1575549))

(assert (= (and d!165439 (not c!145759)) b!1575552))

(assert (= (and b!1575552 c!145760) b!1575550))

(assert (= (and b!1575552 (not c!145760)) b!1575544))

(assert (= (and d!165439 c!145761) b!1575551))

(assert (= (and d!165439 (not c!145761)) b!1575548))

(assert (= (and b!1575548 res!1076562) b!1575547))

(assert (= (and b!1575547 (not res!1076561)) b!1575546))

(assert (= (and b!1575546 (not res!1076560)) b!1575545))

(declare-fun m!1448545 () Bool)

(assert (=> b!1575546 m!1448545))

(assert (=> b!1575545 m!1448545))

(assert (=> d!165439 m!1448529))

(declare-fun m!1448547 () Bool)

(assert (=> d!165439 m!1448547))

(assert (=> d!165439 m!1448521))

(assert (=> b!1575544 m!1448529))

(declare-fun m!1448549 () Bool)

(assert (=> b!1575544 m!1448549))

(assert (=> b!1575544 m!1448549))

(declare-fun m!1448551 () Bool)

(assert (=> b!1575544 m!1448551))

(assert (=> b!1575547 m!1448545))

(assert (=> b!1575498 d!165439))

(declare-fun d!165451 () Bool)

(declare-fun lt!675235 () (_ BitVec 32))

(declare-fun lt!675234 () (_ BitVec 32))

(assert (=> d!165451 (= lt!675235 (bvmul (bvxor lt!675234 (bvlshr lt!675234 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165451 (= lt!675234 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165451 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076563 (let ((h!38267 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142218 (bvmul (bvxor h!38267 (bvlshr h!38267 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142218 (bvlshr x!142218 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076563 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076563 #b00000000000000000000000000000000))))))

(assert (=> d!165451 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675235 (bvlshr lt!675235 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575498 d!165451))

(declare-fun d!165455 () Bool)

(assert (=> d!165455 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135890 d!165455))

(declare-fun d!165459 () Bool)

(assert (=> d!165459 (= (array_inv!39576 _keys!605) (bvsge (size!51399 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135890 d!165459))

(check-sat (not d!165439) (not b!1575544))
(check-sat)
