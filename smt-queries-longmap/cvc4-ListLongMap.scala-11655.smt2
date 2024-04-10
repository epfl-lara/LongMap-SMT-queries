; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136286 () Bool)

(assert start!136286)

(declare-fun res!1077243 () Bool)

(declare-fun e!879573 () Bool)

(assert (=> start!136286 (=> (not res!1077243) (not e!879573))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136286 (= res!1077243 (validMask!0 mask!898))))

(assert (=> start!136286 e!879573))

(assert (=> start!136286 true))

(declare-datatypes ((array!105525 0))(
  ( (array!105526 (arr!50886 (Array (_ BitVec 32) (_ BitVec 64))) (size!51436 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105525)

(declare-fun array_inv!39613 (array!105525) Bool)

(assert (=> start!136286 (array_inv!39613 _keys!605)))

(declare-fun e!879575 () Bool)

(declare-fun k!761 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13751 0))(
  ( (MissingZero!13751 (index!57402 (_ BitVec 32))) (Found!13751 (index!57403 (_ BitVec 32))) (Intermediate!13751 (undefined!14563 Bool) (index!57404 (_ BitVec 32)) (x!142419 (_ BitVec 32))) (Undefined!13751) (MissingVacant!13751 (index!57405 (_ BitVec 32))) )
))
(declare-fun lt!675874 () SeekEntryResult!13751)

(declare-fun b!1576929 () Bool)

(assert (=> b!1576929 (= e!879575 (and (not (is-Undefined!13751 lt!675874)) (ite (is-Found!13751 lt!675874) (not (= (select (arr!50886 _keys!605) (index!57403 lt!675874)) k!761)) (ite (is-MissingZero!13751 lt!675874) (not (= (select (arr!50886 _keys!605) (index!57402 lt!675874)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (is-MissingVacant!13751 lt!675874)) (not (= (select (arr!50886 _keys!605) (index!57405 lt!675874)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun err!218 () SeekEntryResult!13751)

(assert (=> b!1576929 (= lt!675874 err!218)))

(assert (=> b!1576929 true))

(declare-fun b!1576928 () Bool)

(assert (=> b!1576928 (= e!879573 e!879575)))

(declare-fun res!1077240 () Bool)

(assert (=> b!1576928 (=> (not res!1077240) (not e!879575))))

(declare-fun lt!675872 () Bool)

(declare-fun lt!675873 () SeekEntryResult!13751)

(assert (=> b!1576928 (= res!1077240 (and (or lt!675872 (not (undefined!14563 lt!675873))) (or lt!675872 (undefined!14563 lt!675873))))))

(assert (=> b!1576928 (= lt!675872 (not (is-Intermediate!13751 lt!675873)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105525 (_ BitVec 32)) SeekEntryResult!13751)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576928 (= lt!675873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1576926 () Bool)

(declare-fun res!1077242 () Bool)

(assert (=> b!1576926 (=> (not res!1077242) (not e!879573))))

(assert (=> b!1576926 (= res!1077242 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51436 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1576927 () Bool)

(declare-fun res!1077241 () Bool)

(assert (=> b!1576927 (=> (not res!1077241) (not e!879573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576927 (= res!1077241 (validKeyInArray!0 k!761))))

(assert (= (and start!136286 res!1077243) b!1576926))

(assert (= (and b!1576926 res!1077242) b!1576927))

(assert (= (and b!1576927 res!1077241) b!1576928))

(assert (= (and b!1576928 res!1077240) b!1576929))

(declare-fun m!1449315 () Bool)

(assert (=> start!136286 m!1449315))

(declare-fun m!1449317 () Bool)

(assert (=> start!136286 m!1449317))

(declare-fun m!1449319 () Bool)

(assert (=> b!1576929 m!1449319))

(declare-fun m!1449321 () Bool)

(assert (=> b!1576929 m!1449321))

(declare-fun m!1449323 () Bool)

(assert (=> b!1576929 m!1449323))

(declare-fun m!1449325 () Bool)

(assert (=> b!1576928 m!1449325))

(assert (=> b!1576928 m!1449325))

(declare-fun m!1449327 () Bool)

(assert (=> b!1576928 m!1449327))

(declare-fun m!1449329 () Bool)

(assert (=> b!1576927 m!1449329))

(push 1)

(assert (not b!1576927))

(assert (not start!136286))

(assert (not b!1576928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165787 () Bool)

(assert (=> d!165787 (= (validKeyInArray!0 k!761) (and (not (= k!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576927 d!165787))

(declare-fun d!165789 () Bool)

(assert (=> d!165789 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136286 d!165789))

(declare-fun d!165799 () Bool)

(assert (=> d!165799 (= (array_inv!39613 _keys!605) (bvsge (size!51436 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136286 d!165799))

(declare-fun b!1577002 () Bool)

(declare-fun e!879618 () SeekEntryResult!13751)

(declare-fun e!879619 () SeekEntryResult!13751)

(assert (=> b!1577002 (= e!879618 e!879619)))

(declare-fun c!146150 () Bool)

(declare-fun lt!675904 () (_ BitVec 64))

(assert (=> b!1577002 (= c!146150 (or (= lt!675904 k!761) (= (bvadd lt!675904 lt!675904) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577003 () Bool)

(declare-fun e!879616 () Bool)

(declare-fun lt!675903 () SeekEntryResult!13751)

(assert (=> b!1577003 (= e!879616 (bvsge (x!142419 lt!675903) #b01111111111111111111111111111110))))

(declare-fun b!1577004 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577004 (= e!879619 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1577005 () Bool)

(assert (=> b!1577005 (= e!879618 (Intermediate!13751 true (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1577006 () Bool)

(assert (=> b!1577006 (and (bvsge (index!57404 lt!675903) #b00000000000000000000000000000000) (bvslt (index!57404 lt!675903) (size!51436 _keys!605)))))

(declare-fun res!1077270 () Bool)

(assert (=> b!1577006 (= res!1077270 (= (select (arr!50886 _keys!605) (index!57404 lt!675903)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!879620 () Bool)

(assert (=> b!1577006 (=> res!1077270 e!879620)))

(declare-fun b!1577007 () Bool)

(declare-fun e!879617 () Bool)

(assert (=> b!1577007 (= e!879616 e!879617)))

(declare-fun res!1077272 () Bool)

(assert (=> b!1577007 (= res!1077272 (and (is-Intermediate!13751 lt!675903) (not (undefined!14563 lt!675903)) (bvslt (x!142419 lt!675903) #b01111111111111111111111111111110) (bvsge (x!142419 lt!675903) #b00000000000000000000000000000000) (bvsge (x!142419 lt!675903) #b00000000000000000000000000000000)))))

(assert (=> b!1577007 (=> (not res!1077272) (not e!879617))))

(declare-fun b!1577008 () Bool)

(assert (=> b!1577008 (= e!879619 (Intermediate!13751 false (toIndex!0 k!761 mask!898) #b00000000000000000000000000000000))))

