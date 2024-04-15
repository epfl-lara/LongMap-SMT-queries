; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135656 () Bool)

(assert start!135656)

(declare-fun res!1075947 () Bool)

(declare-fun e!878116 () Bool)

(assert (=> start!135656 (=> (not res!1075947) (not e!878116))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135656 (= res!1075947 (validMask!0 mask!898))))

(assert (=> start!135656 e!878116))

(assert (=> start!135656 true))

(declare-datatypes ((array!105264 0))(
  ( (array!105265 (arr!50776 (Array (_ BitVec 32) (_ BitVec 64))) (size!51328 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105264)

(declare-fun array_inv!39712 (array!105264) Bool)

(assert (=> start!135656 (array_inv!39712 _keys!605)))

(declare-fun b!1574517 () Bool)

(declare-fun res!1075946 () Bool)

(assert (=> b!1574517 (=> (not res!1075946) (not e!878116))))

(assert (=> b!1574517 (= res!1075946 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51328 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574518 () Bool)

(declare-fun res!1075945 () Bool)

(assert (=> b!1574518 (=> (not res!1075945) (not e!878116))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574518 (= res!1075945 (validKeyInArray!0 k!761))))

(declare-fun b!1574519 () Bool)

(assert (=> b!1574519 (= e!878116 false)))

(declare-datatypes ((SeekEntryResult!13676 0))(
  ( (MissingZero!13676 (index!57102 (_ BitVec 32))) (Found!13676 (index!57103 (_ BitVec 32))) (Intermediate!13676 (undefined!14488 Bool) (index!57104 (_ BitVec 32)) (x!142043 (_ BitVec 32))) (Undefined!13676) (MissingVacant!13676 (index!57105 (_ BitVec 32))) )
))
(declare-fun lt!674670 () SeekEntryResult!13676)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105264 (_ BitVec 32)) SeekEntryResult!13676)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574519 (= lt!674670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135656 res!1075947) b!1574517))

(assert (= (and b!1574517 res!1075946) b!1574518))

(assert (= (and b!1574518 res!1075945) b!1574519))

(declare-fun m!1447133 () Bool)

(assert (=> start!135656 m!1447133))

(declare-fun m!1447135 () Bool)

(assert (=> start!135656 m!1447135))

(declare-fun m!1447137 () Bool)

(assert (=> b!1574518 m!1447137))

(declare-fun m!1447139 () Bool)

(assert (=> b!1574519 m!1447139))

(assert (=> b!1574519 m!1447139))

(declare-fun m!1447141 () Bool)

(assert (=> b!1574519 m!1447141))

(push 1)

(assert (not b!1574519))

(assert (not start!135656))

(assert (not b!1574518))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

