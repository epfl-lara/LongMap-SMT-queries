; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135618 () Bool)

(assert start!135618)

(declare-fun res!1075839 () Bool)

(declare-fun e!878131 () Bool)

(assert (=> start!135618 (=> (not res!1075839) (not e!878131))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135618 (= res!1075839 (validMask!0 mask!898))))

(assert (=> start!135618 e!878131))

(assert (=> start!135618 true))

(declare-datatypes ((array!105285 0))(
  ( (array!105286 (arr!50788 (Array (_ BitVec 32) (_ BitVec 64))) (size!51338 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105285)

(declare-fun array_inv!39515 (array!105285) Bool)

(assert (=> start!135618 (array_inv!39515 _keys!605)))

(declare-fun b!1574542 () Bool)

(declare-fun res!1075838 () Bool)

(assert (=> b!1574542 (=> (not res!1075838) (not e!878131))))

(assert (=> b!1574542 (= res!1075838 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51338 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574543 () Bool)

(declare-fun res!1075837 () Bool)

(assert (=> b!1574543 (=> (not res!1075837) (not e!878131))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574543 (= res!1075837 (validKeyInArray!0 k!761))))

(declare-fun b!1574544 () Bool)

(assert (=> b!1574544 (= e!878131 false)))

(declare-datatypes ((SeekEntryResult!13653 0))(
  ( (MissingZero!13653 (index!57010 (_ BitVec 32))) (Found!13653 (index!57011 (_ BitVec 32))) (Intermediate!13653 (undefined!14465 Bool) (index!57012 (_ BitVec 32)) (x!141963 (_ BitVec 32))) (Undefined!13653) (MissingVacant!13653 (index!57013 (_ BitVec 32))) )
))
(declare-fun lt!674851 () SeekEntryResult!13653)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105285 (_ BitVec 32)) SeekEntryResult!13653)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574544 (= lt!674851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135618 res!1075839) b!1574542))

(assert (= (and b!1574542 res!1075838) b!1574543))

(assert (= (and b!1574543 res!1075837) b!1574544))

(declare-fun m!1447765 () Bool)

(assert (=> start!135618 m!1447765))

(declare-fun m!1447767 () Bool)

(assert (=> start!135618 m!1447767))

(declare-fun m!1447769 () Bool)

(assert (=> b!1574543 m!1447769))

(declare-fun m!1447771 () Bool)

(assert (=> b!1574544 m!1447771))

(assert (=> b!1574544 m!1447771))

(declare-fun m!1447773 () Bool)

(assert (=> b!1574544 m!1447773))

(push 1)

(assert (not start!135618))

(assert (not b!1574544))

(assert (not b!1574543))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

