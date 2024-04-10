; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135640 () Bool)

(assert start!135640)

(declare-fun res!1075936 () Bool)

(declare-fun e!878197 () Bool)

(assert (=> start!135640 (=> (not res!1075936) (not e!878197))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135640 (= res!1075936 (validMask!0 mask!898))))

(assert (=> start!135640 e!878197))

(assert (=> start!135640 true))

(declare-datatypes ((array!105307 0))(
  ( (array!105308 (arr!50799 (Array (_ BitVec 32) (_ BitVec 64))) (size!51349 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105307)

(declare-fun array_inv!39526 (array!105307) Bool)

(assert (=> start!135640 (array_inv!39526 _keys!605)))

(declare-fun b!1574641 () Bool)

(declare-fun res!1075938 () Bool)

(assert (=> b!1574641 (=> (not res!1075938) (not e!878197))))

(assert (=> b!1574641 (= res!1075938 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51349 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574642 () Bool)

(declare-fun res!1075937 () Bool)

(assert (=> b!1574642 (=> (not res!1075937) (not e!878197))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574642 (= res!1075937 (validKeyInArray!0 k!761))))

(declare-fun b!1574643 () Bool)

(assert (=> b!1574643 (= e!878197 false)))

(declare-datatypes ((SeekEntryResult!13664 0))(
  ( (MissingZero!13664 (index!57054 (_ BitVec 32))) (Found!13664 (index!57055 (_ BitVec 32))) (Intermediate!13664 (undefined!14476 Bool) (index!57056 (_ BitVec 32)) (x!141998 (_ BitVec 32))) (Undefined!13664) (MissingVacant!13664 (index!57057 (_ BitVec 32))) )
))
(declare-fun lt!674884 () SeekEntryResult!13664)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105307 (_ BitVec 32)) SeekEntryResult!13664)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574643 (= lt!674884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135640 res!1075936) b!1574641))

(assert (= (and b!1574641 res!1075938) b!1574642))

(assert (= (and b!1574642 res!1075937) b!1574643))

(declare-fun m!1447875 () Bool)

(assert (=> start!135640 m!1447875))

(declare-fun m!1447877 () Bool)

(assert (=> start!135640 m!1447877))

(declare-fun m!1447879 () Bool)

(assert (=> b!1574642 m!1447879))

(declare-fun m!1447881 () Bool)

(assert (=> b!1574643 m!1447881))

(assert (=> b!1574643 m!1447881))

(declare-fun m!1447883 () Bool)

(assert (=> b!1574643 m!1447883))

(push 1)

(assert (not start!135640))

(assert (not b!1574643))

(assert (not b!1574642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

