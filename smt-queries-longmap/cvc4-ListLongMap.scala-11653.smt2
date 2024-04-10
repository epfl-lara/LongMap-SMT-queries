; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136214 () Bool)

(assert start!136214)

(declare-fun b!1576694 () Bool)

(declare-fun e!879431 () Bool)

(declare-fun e!879430 () Bool)

(assert (=> b!1576694 (= e!879431 e!879430)))

(declare-fun res!1077110 () Bool)

(assert (=> b!1576694 (=> (not res!1077110) (not e!879430))))

(declare-fun lt!675747 () Bool)

(declare-datatypes ((SeekEntryResult!13745 0))(
  ( (MissingZero!13745 (index!57378 (_ BitVec 32))) (Found!13745 (index!57379 (_ BitVec 32))) (Intermediate!13745 (undefined!14557 Bool) (index!57380 (_ BitVec 32)) (x!142385 (_ BitVec 32))) (Undefined!13745) (MissingVacant!13745 (index!57381 (_ BitVec 32))) )
))
(declare-fun lt!675746 () SeekEntryResult!13745)

(assert (=> b!1576694 (= res!1077110 (and (or lt!675747 (not (undefined!14557 lt!675746))) (or lt!675747 (undefined!14557 lt!675746))))))

(assert (=> b!1576694 (= lt!675747 (not (is-Intermediate!13745 lt!675746)))))

(declare-datatypes ((array!105507 0))(
  ( (array!105508 (arr!50880 (Array (_ BitVec 32) (_ BitVec 64))) (size!51430 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105507)

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105507 (_ BitVec 32)) SeekEntryResult!13745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576694 (= lt!675746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun res!1077111 () Bool)

(assert (=> start!136214 (=> (not res!1077111) (not e!879431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136214 (= res!1077111 (validMask!0 mask!898))))

(assert (=> start!136214 e!879431))

(assert (=> start!136214 true))

(declare-fun array_inv!39607 (array!105507) Bool)

(assert (=> start!136214 (array_inv!39607 _keys!605)))

(declare-fun b!1576692 () Bool)

(declare-fun res!1077108 () Bool)

(assert (=> b!1576692 (=> (not res!1077108) (not e!879431))))

(assert (=> b!1576692 (= res!1077108 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51430 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576693 () Bool)

(declare-fun res!1077109 () Bool)

(assert (=> b!1576693 (=> (not res!1077109) (not e!879431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576693 (= res!1077109 (validKeyInArray!0 k!761))))

(declare-fun b!1576695 () Bool)

(declare-fun lt!675748 () SeekEntryResult!13745)

(assert (=> b!1576695 (= e!879430 (and (not (is-Undefined!13745 lt!675748)) (not (is-Found!13745 lt!675748)) (is-MissingZero!13745 lt!675748) (or (bvslt (index!57378 lt!675748) #b00000000000000000000000000000000) (bvsge (index!57378 lt!675748) (size!51430 _keys!605)))))))

(declare-fun err!194 () SeekEntryResult!13745)

(assert (=> b!1576695 (= lt!675748 err!194)))

(assert (=> b!1576695 true))

(assert (= (and start!136214 res!1077111) b!1576692))

(assert (= (and b!1576692 res!1077108) b!1576693))

(assert (= (and b!1576693 res!1077109) b!1576694))

(assert (= (and b!1576694 res!1077110) b!1576695))

(declare-fun m!1449195 () Bool)

(assert (=> b!1576694 m!1449195))

(assert (=> b!1576694 m!1449195))

(declare-fun m!1449197 () Bool)

(assert (=> b!1576694 m!1449197))

(declare-fun m!1449199 () Bool)

(assert (=> start!136214 m!1449199))

(declare-fun m!1449201 () Bool)

(assert (=> start!136214 m!1449201))

(declare-fun m!1449203 () Bool)

(assert (=> b!1576693 m!1449203))

(push 1)

(assert (not start!136214))

(assert (not b!1576693))

(assert (not b!1576694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165723 () Bool)

(assert (=> d!165723 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136214 d!165723))

(declare-fun d!165737 () Bool)

(assert (=> d!165737 (= (array_inv!39607 _keys!605) (bvsge (size!51430 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136214 d!165737))

(declare-fun d!165739 () Bool)

(assert (=> d!165739 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576693 d!165739))

(declare-fun b!1576768 () Bool)

(declare-fun e!879473 () SeekEntryResult!13745)

(assert (=> b!1576768 (= e!879473 (Intermediate!13745 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576769 () Bool)

(declare-fun e!879472 () Bool)

(declare-fun e!879474 () Bool)

(assert (=> b!1576769 (= e!879472 e!879474)))

(declare-fun res!1077140 () Bool)

(declare-fun lt!675778 () SeekEntryResult!13745)

(assert (=> b!1576769 (= res!1077140 (and (is-Intermediate!13745 lt!675778) (not (undefined!14557 lt!675778)) (bvslt (x!142385 lt!675778) #b01111111111111111111111111111110) (bvsge (x!142385 lt!675778) #b00000000000000000000000000000000) (bvsge (x!142385 lt!675778) #b00000000000000000000000000000000)))))

(assert (=> b!1576769 (=> (not res!1077140) (not e!879474))))

(declare-fun b!1576770 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576770 (= e!879473 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576771 () Bool)

(declare-fun e!879475 () SeekEntryResult!13745)

(assert (=> b!1576771 (= e!879475 (Intermediate!13745 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1576772 () Bool)

(assert (=> b!1576772 (= e!879475 e!879473)))

(declare-fun c!146096 () Bool)

(declare-fun lt!675777 () (_ BitVec 64))

(assert (=> b!1576772 (= c!146096 (or (= lt!675777 k!761) (= (bvadd lt!675777 lt!675777) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1576773 () Bool)

(assert (=> b!1576773 (and (bvsge (index!57380 lt!675778) #b00000000000000000000000000000000) (bvslt (index!57380 lt!675778) (size!51430 _keys!605)))))

(declare-fun res!1077138 () Bool)

(assert (=> b!1576773 (= res!1077138 (= (select (arr!50880 _keys!605) (index!57380 lt!675778)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879476 () Bool)

(assert (=> b!1576773 (=> res!1077138 e!879476)))

(declare-fun d!165741 () Bool)

(assert (=> d!165741 e!879472))

(declare-fun c!146095 () Bool)

(assert (=> d!165741 (= c!146095 (and (is-Intermediate!13745 lt!675778) (undefined!14557 lt!675778)))))

(assert (=> d!165741 (= lt!675778 e!879475)))

(declare-fun c!146097 () Bool)

(assert (=> d!165741 (= c!146097 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165741 (= lt!675777 (select (arr!50880 _keys!605) (toIndex!0 k!761 mask!898)))))

(assert (=> d!165741 (validMask!0 mask!898)))

(assert (=> d!165741 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898) lt!675778)))

(declare-fun b!1576774 () Bool)

(assert (=> b!1576774 (= e!879472 (bvsge (x!142385 lt!675778) #b01111111111111111111111111111110))))

(declare-fun b!1576775 () Bool)

(assert (=> b!1576775 (and (bvsge (index!57380 lt!675778) #b00000000000000000000000000000000) (bvslt (index!57380 lt!675778) (size!51430 _keys!605)))))

(declare-fun res!1077139 () Bool)

(assert (=> b!1576775 (= res!1077139 (= (select (arr!50880 _keys!605) (index!57380 lt!675778)) k!761))))

(assert (=> b!1576775 (=> res!1077139 e!879476)))

(assert (=> b!1576775 (= e!879474 e!879476)))

(declare-fun b!1576776 () Bool)

(assert (=> b!1576776 (and (bvsge (index!57380 lt!675778) #b00000000000000000000000000000000) (bvslt (index!57380 lt!675778) (size!51430 _keys!605)))))

