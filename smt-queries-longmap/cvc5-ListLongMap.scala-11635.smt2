; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136208 () Bool)

(assert start!136208)

(declare-fun res!1077129 () Bool)

(declare-fun e!880004 () Bool)

(assert (=> start!136208 (=> (not res!1077129) (not e!880004))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136208 (= res!1077129 (validMask!0 mask!898))))

(assert (=> start!136208 e!880004))

(assert (=> start!136208 true))

(declare-datatypes ((array!105495 0))(
  ( (array!105496 (arr!50880 (Array (_ BitVec 32) (_ BitVec 64))) (size!51431 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105495)

(declare-fun array_inv!39835 (array!105495) Bool)

(assert (=> start!136208 (array_inv!39835 _keys!605)))

(declare-fun b!1577563 () Bool)

(declare-fun res!1077130 () Bool)

(assert (=> b!1577563 (=> (not res!1077130) (not e!880004))))

(assert (=> b!1577563 (= res!1077130 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51431 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1577564 () Bool)

(declare-fun res!1077131 () Bool)

(assert (=> b!1577564 (=> (not res!1077131) (not e!880004))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577564 (= res!1077131 (validKeyInArray!0 k!761))))

(declare-fun b!1577565 () Bool)

(assert (=> b!1577565 (= e!880004 false)))

(declare-datatypes ((SeekEntryResult!13639 0))(
  ( (MissingZero!13639 (index!56954 (_ BitVec 32))) (Found!13639 (index!56955 (_ BitVec 32))) (Intermediate!13639 (undefined!14451 Bool) (index!56956 (_ BitVec 32)) (x!142114 (_ BitVec 32))) (Undefined!13639) (MissingVacant!13639 (index!56957 (_ BitVec 32))) )
))
(declare-fun lt!675981 () SeekEntryResult!13639)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105495 (_ BitVec 32)) SeekEntryResult!13639)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577565 (= lt!675981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136208 res!1077129) b!1577563))

(assert (= (and b!1577563 res!1077130) b!1577564))

(assert (= (and b!1577564 res!1077131) b!1577565))

(declare-fun m!1450493 () Bool)

(assert (=> start!136208 m!1450493))

(declare-fun m!1450495 () Bool)

(assert (=> start!136208 m!1450495))

(declare-fun m!1450497 () Bool)

(assert (=> b!1577564 m!1450497))

(declare-fun m!1450499 () Bool)

(assert (=> b!1577565 m!1450499))

(assert (=> b!1577565 m!1450499))

(declare-fun m!1450501 () Bool)

(assert (=> b!1577565 m!1450501))

(push 1)

(assert (not b!1577565))

(assert (not start!136208))

(assert (not b!1577564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

