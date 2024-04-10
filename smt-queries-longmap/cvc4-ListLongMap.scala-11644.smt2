; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135928 () Bool)

(assert start!135928)

(declare-fun res!1076603 () Bool)

(declare-fun e!878792 () Bool)

(assert (=> start!135928 (=> (not res!1076603) (not e!878792))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135928 (= res!1076603 (validMask!0 mask!898))))

(assert (=> start!135928 e!878792))

(assert (=> start!135928 true))

(declare-datatypes ((array!105433 0))(
  ( (array!105434 (arr!50853 (Array (_ BitVec 32) (_ BitVec 64))) (size!51403 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105433)

(declare-fun array_inv!39580 (array!105433) Bool)

(assert (=> start!135928 (array_inv!39580 _keys!605)))

(declare-fun b!1575613 () Bool)

(declare-fun res!1076604 () Bool)

(assert (=> b!1575613 (=> (not res!1076604) (not e!878792))))

(assert (=> b!1575613 (= res!1076604 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51403 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575614 () Bool)

(declare-fun res!1076602 () Bool)

(assert (=> b!1575614 (=> (not res!1076602) (not e!878792))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575614 (= res!1076602 (validKeyInArray!0 k!761))))

(declare-fun b!1575615 () Bool)

(assert (=> b!1575615 (= e!878792 false)))

(declare-datatypes ((SeekEntryResult!13718 0))(
  ( (MissingZero!13718 (index!57270 (_ BitVec 32))) (Found!13718 (index!57271 (_ BitVec 32))) (Intermediate!13718 (undefined!14530 Bool) (index!57272 (_ BitVec 32)) (x!142232 (_ BitVec 32))) (Undefined!13718) (MissingVacant!13718 (index!57273 (_ BitVec 32))) )
))
(declare-fun lt!675262 () SeekEntryResult!13718)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105433 (_ BitVec 32)) SeekEntryResult!13718)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575615 (= lt!675262 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135928 res!1076603) b!1575613))

(assert (= (and b!1575613 res!1076604) b!1575614))

(assert (= (and b!1575614 res!1076602) b!1575615))

(declare-fun m!1448589 () Bool)

(assert (=> start!135928 m!1448589))

(declare-fun m!1448591 () Bool)

(assert (=> start!135928 m!1448591))

(declare-fun m!1448593 () Bool)

(assert (=> b!1575614 m!1448593))

(declare-fun m!1448595 () Bool)

(assert (=> b!1575615 m!1448595))

(assert (=> b!1575615 m!1448595))

(declare-fun m!1448597 () Bool)

(assert (=> b!1575615 m!1448597))

(push 1)

(assert (not b!1575615))

(assert (not start!135928))

(assert (not b!1575614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

