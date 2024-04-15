; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135740 () Bool)

(assert start!135740)

(declare-fun res!1076114 () Bool)

(declare-fun e!878278 () Bool)

(assert (=> start!135740 (=> (not res!1076114) (not e!878278))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135740 (= res!1076114 (validMask!0 mask!898))))

(assert (=> start!135740 e!878278))

(assert (=> start!135740 true))

(declare-datatypes ((array!105294 0))(
  ( (array!105295 (arr!50788 (Array (_ BitVec 32) (_ BitVec 64))) (size!51340 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105294)

(declare-fun array_inv!39724 (array!105294) Bool)

(assert (=> start!135740 (array_inv!39724 _keys!605)))

(declare-fun b!1574787 () Bool)

(declare-fun res!1076115 () Bool)

(assert (=> b!1574787 (=> (not res!1076115) (not e!878278))))

(assert (=> b!1574787 (= res!1076115 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51340 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574788 () Bool)

(declare-fun res!1076113 () Bool)

(assert (=> b!1574788 (=> (not res!1076113) (not e!878278))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574788 (= res!1076113 (validKeyInArray!0 k!761))))

(declare-fun b!1574789 () Bool)

(assert (=> b!1574789 (= e!878278 false)))

(declare-datatypes ((SeekEntryResult!13688 0))(
  ( (MissingZero!13688 (index!57150 (_ BitVec 32))) (Found!13688 (index!57151 (_ BitVec 32))) (Intermediate!13688 (undefined!14500 Bool) (index!57152 (_ BitVec 32)) (x!142099 (_ BitVec 32))) (Undefined!13688) (MissingVacant!13688 (index!57153 (_ BitVec 32))) )
))
(declare-fun lt!674778 () SeekEntryResult!13688)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105294 (_ BitVec 32)) SeekEntryResult!13688)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574789 (= lt!674778 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135740 res!1076114) b!1574787))

(assert (= (and b!1574787 res!1076115) b!1574788))

(assert (= (and b!1574788 res!1076113) b!1574789))

(declare-fun m!1447313 () Bool)

(assert (=> start!135740 m!1447313))

(declare-fun m!1447315 () Bool)

(assert (=> start!135740 m!1447315))

(declare-fun m!1447317 () Bool)

(assert (=> b!1574788 m!1447317))

(declare-fun m!1447319 () Bool)

(assert (=> b!1574789 m!1447319))

(assert (=> b!1574789 m!1447319))

(declare-fun m!1447321 () Bool)

(assert (=> b!1574789 m!1447321))

(push 1)

(assert (not b!1574789))

(assert (not b!1574788))

(assert (not start!135740))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

