; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135892 () Bool)

(assert start!135892)

(declare-fun res!1076547 () Bool)

(declare-fun e!878728 () Bool)

(assert (=> start!135892 (=> (not res!1076547) (not e!878728))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135892 (= res!1076547 (validMask!0 mask!898))))

(assert (=> start!135892 e!878728))

(assert (=> start!135892 true))

(declare-datatypes ((array!105424 0))(
  ( (array!105425 (arr!50850 (Array (_ BitVec 32) (_ BitVec 64))) (size!51400 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105424)

(declare-fun array_inv!39577 (array!105424) Bool)

(assert (=> start!135892 (array_inv!39577 _keys!605)))

(declare-fun b!1575505 () Bool)

(declare-fun res!1076546 () Bool)

(assert (=> b!1575505 (=> (not res!1076546) (not e!878728))))

(assert (=> b!1575505 (= res!1076546 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51400 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575506 () Bool)

(declare-fun res!1076545 () Bool)

(assert (=> b!1575506 (=> (not res!1076545) (not e!878728))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575506 (= res!1076545 (validKeyInArray!0 k!761))))

(declare-fun b!1575507 () Bool)

(declare-datatypes ((SeekEntryResult!13715 0))(
  ( (MissingZero!13715 (index!57258 (_ BitVec 32))) (Found!13715 (index!57259 (_ BitVec 32))) (Intermediate!13715 (undefined!14527 Bool) (index!57260 (_ BitVec 32)) (x!142215 (_ BitVec 32))) (Undefined!13715) (MissingVacant!13715 (index!57261 (_ BitVec 32))) )
))
(declare-fun lt!675217 () SeekEntryResult!13715)

(assert (=> b!1575507 (= e!878728 (and (is-Intermediate!13715 lt!675217) (not (undefined!14527 lt!675217)) (not (= (select (arr!50850 _keys!605) (index!57260 lt!675217)) k!761)) (= (select (arr!50850 _keys!605) (index!57260 lt!675217)) #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (index!57260 lt!675217) #b00000000000000000000000000000000) (bvsge (index!57260 lt!675217) (size!51400 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105424 (_ BitVec 32)) SeekEntryResult!13715)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575507 (= lt!675217 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135892 res!1076547) b!1575505))

(assert (= (and b!1575505 res!1076546) b!1575506))

(assert (= (and b!1575506 res!1076545) b!1575507))

(declare-fun m!1448533 () Bool)

(assert (=> start!135892 m!1448533))

(declare-fun m!1448535 () Bool)

(assert (=> start!135892 m!1448535))

(declare-fun m!1448537 () Bool)

(assert (=> b!1575506 m!1448537))

(declare-fun m!1448539 () Bool)

(assert (=> b!1575507 m!1448539))

(declare-fun m!1448541 () Bool)

(assert (=> b!1575507 m!1448541))

(assert (=> b!1575507 m!1448541))

(declare-fun m!1448543 () Bool)

(assert (=> b!1575507 m!1448543))

(push 1)

(assert (not start!135892))

(assert (not b!1575506))

(assert (not b!1575507))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165443 () Bool)

(assert (=> d!165443 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135892 d!165443))

(declare-fun d!165445 () Bool)

(assert (=> d!165445 (= (array_inv!39577 _keys!605) (bvsge (size!51400 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135892 d!165445))

(declare-fun d!165447 () Bool)

(assert (=> d!165447 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575506 d!165447))

(declare-fun b!1575580 () Bool)

(declare-fun e!878771 () SeekEntryResult!13715)

(assert (=> b!1575580 (= e!878771 (Intermediate!13715 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575581 () Bool)

(declare-fun lt!675246 () SeekEntryResult!13715)

(assert (=> b!1575581 (and (bvsge (index!57260 lt!675246) #b00000000000000000000000000000000) (bvslt (index!57260 lt!675246) (size!51400 _keys!605)))))

(declare-fun e!878773 () Bool)

(assert (=> b!1575581 (= e!878773 (= (select (arr!50850 _keys!605) (index!57260 lt!675246)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575582 () Bool)

(assert (=> b!1575582 (and (bvsge (index!57260 lt!675246) #b00000000000000000000000000000000) (bvslt (index!57260 lt!675246) (size!51400 _keys!605)))))

(declare-fun res!1076575 () Bool)

(assert (=> b!1575582 (= res!1076575 (= (select (arr!50850 _keys!605) (index!57260 lt!675246)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575582 (=> res!1076575 e!878773)))

(declare-fun d!165449 () Bool)

(declare-fun e!878774 () Bool)

(assert (=> d!165449 e!878774))

(declare-fun c!145772 () Bool)

(assert (=> d!165449 (= c!145772 (and (is-Intermediate!13715 lt!675246) (undefined!14527 lt!675246)))))

(declare-fun e!878770 () SeekEntryResult!13715)

(assert (=> d!165449 (= lt!675246 e!878770)))

(declare-fun c!145773 () Bool)

(assert (=> d!165449 (= c!145773 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675247 () (_ BitVec 64))

(assert (=> d!165449 (= lt!675247 (select (arr!50850 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165449 (validMask!0 mask!898)))

(assert (=> d!165449 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675246)))

(declare-fun b!1575583 () Bool)

(assert (=> b!1575583 (= e!878774 (bvsge (x!142215 lt!675246) #b01111111111111111111111111111110))))

(declare-fun b!1575584 () Bool)

(assert (=> b!1575584 (and (bvsge (index!57260 lt!675246) #b00000000000000000000000000000000) (bvslt (index!57260 lt!675246) (size!51400 _keys!605)))))

(declare-fun res!1076576 () Bool)

(assert (=> b!1575584 (= res!1076576 (= (select (arr!50850 _keys!605) (index!57260 lt!675246)) k!761))))

(assert (=> b!1575584 (=> res!1076576 e!878773)))

(declare-fun e!878772 () Bool)

(assert (=> b!1575584 (= e!878772 e!878773)))

(declare-fun b!1575585 () Bool)

(assert (=> b!1575585 (= e!878774 e!878772)))

(declare-fun res!1076574 () Bool)

(assert (=> b!1575585 (= res!1076574 (and (is-Intermediate!13715 lt!675246) (not (undefined!14527 lt!675246)) (bvslt (x!142215 lt!675246) #b01111111111111111111111111111110) (bvsge (x!142215 lt!675246) #b00000000000000000000000000000000) (bvsge (x!142215 lt!675246) #b00000000000000000000000000000000)))))

(assert (=> b!1575585 (=> (not res!1076574) (not e!878772))))

(declare-fun b!1575586 () Bool)

(assert (=> b!1575586 (= e!878770 (Intermediate!13715 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575587 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575587 (= e!878771 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575588 () Bool)

(assert (=> b!1575588 (= e!878770 e!878771)))

(declare-fun c!145771 () Bool)

(assert (=> b!1575588 (= c!145771 (or (= lt!675247 k!761) (= (bvadd lt!675247 lt!675247) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!165449 c!145773) b!1575586))

(assert (= (and d!165449 (not c!145773)) b!1575588))

(assert (= (and b!1575588 c!145771) b!1575580))

(assert (= (and b!1575588 (not c!145771)) b!1575587))

(assert (= (and d!165449 c!145772) b!1575583))

(assert (= (and d!165449 (not c!145772)) b!1575585))

(assert (= (and b!1575585 res!1076574) b!1575584))

(assert (= (and b!1575584 (not res!1076576)) b!1575582))

(assert (= (and b!1575582 (not res!1076575)) b!1575581))

(assert (=> d!165449 m!1448541))

(declare-fun m!1448561 () Bool)

(assert (=> d!165449 m!1448561))

(assert (=> d!165449 m!1448533))

(declare-fun m!1448563 () Bool)

(assert (=> b!1575581 m!1448563))

(assert (=> b!1575584 m!1448563))

(assert (=> b!1575587 m!1448541))

(declare-fun m!1448565 () Bool)

(assert (=> b!1575587 m!1448565))

(assert (=> b!1575587 m!1448565))

(declare-fun m!1448567 () Bool)

(assert (=> b!1575587 m!1448567))

(assert (=> b!1575582 m!1448563))

(assert (=> b!1575507 d!165449))

(declare-fun d!165465 () Bool)

(declare-fun lt!675253 () (_ BitVec 32))

(declare-fun lt!675252 () (_ BitVec 32))

(assert (=> d!165465 (= lt!675253 (bvmul (bvxor lt!675252 (bvlshr lt!675252 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165465 (= lt!675252 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165465 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076577 (let ((h!38269 ((_ extract 31 0) (bvand (bvxor k!761 (bvlshr k!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142221 (bvmul (bvxor h!38269 (bvlshr h!38269 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142221 (bvlshr x!142221 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076577 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076577 #b00000000000000000000000000000000))))))

(assert (=> d!165465 (= (toIndex!0 k!761 mask!898) (bvand (bvxor lt!675253 (bvlshr lt!675253 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575507 d!165465))

(push 1)

(assert (not b!1575587))

(assert (not d!165449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

