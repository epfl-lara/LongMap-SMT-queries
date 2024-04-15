; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135650 () Bool)

(assert start!135650)

(declare-fun res!1075918 () Bool)

(declare-fun e!878098 () Bool)

(assert (=> start!135650 (=> (not res!1075918) (not e!878098))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135650 (= res!1075918 (validMask!0 mask!898))))

(assert (=> start!135650 e!878098))

(assert (=> start!135650 true))

(declare-datatypes ((array!105258 0))(
  ( (array!105259 (arr!50773 (Array (_ BitVec 32) (_ BitVec 64))) (size!51325 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105258)

(declare-fun array_inv!39709 (array!105258) Bool)

(assert (=> start!135650 (array_inv!39709 _keys!605)))

(declare-fun b!1574490 () Bool)

(declare-fun res!1075920 () Bool)

(assert (=> b!1574490 (=> (not res!1075920) (not e!878098))))

(assert (=> b!1574490 (= res!1075920 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51325 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574491 () Bool)

(declare-fun res!1075919 () Bool)

(assert (=> b!1574491 (=> (not res!1075919) (not e!878098))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574491 (= res!1075919 (validKeyInArray!0 k!761))))

(declare-fun b!1574492 () Bool)

(assert (=> b!1574492 (= e!878098 false)))

(declare-datatypes ((SeekEntryResult!13673 0))(
  ( (MissingZero!13673 (index!57090 (_ BitVec 32))) (Found!13673 (index!57091 (_ BitVec 32))) (Intermediate!13673 (undefined!14485 Bool) (index!57092 (_ BitVec 32)) (x!142032 (_ BitVec 32))) (Undefined!13673) (MissingVacant!13673 (index!57093 (_ BitVec 32))) )
))
(declare-fun lt!674661 () SeekEntryResult!13673)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105258 (_ BitVec 32)) SeekEntryResult!13673)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574492 (= lt!674661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135650 res!1075918) b!1574490))

(assert (= (and b!1574490 res!1075920) b!1574491))

(assert (= (and b!1574491 res!1075919) b!1574492))

(declare-fun m!1447103 () Bool)

(assert (=> start!135650 m!1447103))

(declare-fun m!1447105 () Bool)

(assert (=> start!135650 m!1447105))

(declare-fun m!1447107 () Bool)

(assert (=> b!1574491 m!1447107))

(declare-fun m!1447109 () Bool)

(assert (=> b!1574492 m!1447109))

(assert (=> b!1574492 m!1447109))

(declare-fun m!1447111 () Bool)

(assert (=> b!1574492 m!1447111))

(push 1)

(assert (not start!135650))

(assert (not b!1574492))

(assert (not b!1574491))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

