; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134854 () Bool)

(assert start!134854)

(declare-fun res!1074024 () Bool)

(declare-fun e!876398 () Bool)

(assert (=> start!134854 (=> (not res!1074024) (not e!876398))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134854 (= res!1074024 (validMask!0 mask!889))))

(assert (=> start!134854 e!876398))

(assert (=> start!134854 true))

(declare-datatypes ((array!104902 0))(
  ( (array!104903 (arr!50620 (Array (_ BitVec 32) (_ BitVec 64))) (size!51172 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104902)

(declare-fun array_inv!39556 (array!104902) Bool)

(assert (=> start!134854 (array_inv!39556 _keys!600)))

(declare-fun b!1571772 () Bool)

(declare-fun res!1074022 () Bool)

(assert (=> b!1571772 (=> (not res!1074022) (not e!876398))))

(assert (=> b!1571772 (= res!1074022 (= (size!51172 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571773 () Bool)

(declare-fun res!1074023 () Bool)

(assert (=> b!1571773 (=> (not res!1074023) (not e!876398))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571773 (= res!1074023 (validKeyInArray!0 k!754))))

(declare-fun b!1571774 () Bool)

(assert (=> b!1571774 (= e!876398 false)))

(declare-datatypes ((SeekEntryResult!13568 0))(
  ( (MissingZero!13568 (index!56670 (_ BitVec 32))) (Found!13568 (index!56671 (_ BitVec 32))) (Intermediate!13568 (undefined!14380 Bool) (index!56672 (_ BitVec 32)) (x!141429 (_ BitVec 32))) (Undefined!13568) (MissingVacant!13568 (index!56673 (_ BitVec 32))) )
))
(declare-fun lt!673563 () SeekEntryResult!13568)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104902 (_ BitVec 32)) SeekEntryResult!13568)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571774 (= lt!673563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134854 res!1074024) b!1571772))

(assert (= (and b!1571772 res!1074022) b!1571773))

(assert (= (and b!1571773 res!1074023) b!1571774))

(declare-fun m!1445045 () Bool)

(assert (=> start!134854 m!1445045))

(declare-fun m!1445047 () Bool)

(assert (=> start!134854 m!1445047))

(declare-fun m!1445049 () Bool)

(assert (=> b!1571773 m!1445049))

(declare-fun m!1445051 () Bool)

(assert (=> b!1571774 m!1445051))

(assert (=> b!1571774 m!1445051))

(declare-fun m!1445053 () Bool)

(assert (=> b!1571774 m!1445053))

(push 1)

(assert (not b!1571773))

(assert (not b!1571774))

(assert (not start!134854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

