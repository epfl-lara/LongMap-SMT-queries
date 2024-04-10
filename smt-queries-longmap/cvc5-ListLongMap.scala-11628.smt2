; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135678 () Bool)

(assert start!135678)

(declare-fun res!1076002 () Bool)

(declare-fun e!878266 () Bool)

(assert (=> start!135678 (=> (not res!1076002) (not e!878266))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135678 (= res!1076002 (validMask!0 mask!898))))

(assert (=> start!135678 e!878266))

(assert (=> start!135678 true))

(declare-datatypes ((array!105318 0))(
  ( (array!105319 (arr!50803 (Array (_ BitVec 32) (_ BitVec 64))) (size!51353 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105318)

(declare-fun array_inv!39530 (array!105318) Bool)

(assert (=> start!135678 (array_inv!39530 _keys!605)))

(declare-fun b!1574758 () Bool)

(declare-fun res!1076003 () Bool)

(assert (=> b!1574758 (=> (not res!1076003) (not e!878266))))

(assert (=> b!1574758 (= res!1076003 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51353 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574759 () Bool)

(declare-fun res!1076004 () Bool)

(assert (=> b!1574759 (=> (not res!1076004) (not e!878266))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574759 (= res!1076004 (validKeyInArray!0 k!761))))

(declare-fun b!1574760 () Bool)

(assert (=> b!1574760 (= e!878266 false)))

(declare-datatypes ((SeekEntryResult!13668 0))(
  ( (MissingZero!13668 (index!57070 (_ BitVec 32))) (Found!13668 (index!57071 (_ BitVec 32))) (Intermediate!13668 (undefined!14480 Bool) (index!57072 (_ BitVec 32)) (x!142024 (_ BitVec 32))) (Undefined!13668) (MissingVacant!13668 (index!57073 (_ BitVec 32))) )
))
(declare-fun lt!674932 () SeekEntryResult!13668)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105318 (_ BitVec 32)) SeekEntryResult!13668)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574760 (= lt!674932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135678 res!1076002) b!1574758))

(assert (= (and b!1574758 res!1076003) b!1574759))

(assert (= (and b!1574759 res!1076004) b!1574760))

(declare-fun m!1447945 () Bool)

(assert (=> start!135678 m!1447945))

(declare-fun m!1447947 () Bool)

(assert (=> start!135678 m!1447947))

(declare-fun m!1447949 () Bool)

(assert (=> b!1574759 m!1447949))

(declare-fun m!1447951 () Bool)

(assert (=> b!1574760 m!1447951))

(assert (=> b!1574760 m!1447951))

(declare-fun m!1447953 () Bool)

(assert (=> b!1574760 m!1447953))

(push 1)

(assert (not b!1574759))

(assert (not start!135678))

(assert (not b!1574760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

