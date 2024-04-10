; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134850 () Bool)

(assert start!134850)

(declare-fun res!1074015 () Bool)

(declare-fun e!876479 () Bool)

(assert (=> start!134850 (=> (not res!1074015) (not e!876479))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134850 (= res!1074015 (validMask!0 mask!889))))

(assert (=> start!134850 e!876479))

(assert (=> start!134850 true))

(declare-datatypes ((array!104947 0))(
  ( (array!104948 (arr!50643 (Array (_ BitVec 32) (_ BitVec 64))) (size!51193 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104947)

(declare-fun array_inv!39370 (array!104947) Bool)

(assert (=> start!134850 (array_inv!39370 _keys!600)))

(declare-fun b!1571896 () Bool)

(declare-fun res!1074013 () Bool)

(assert (=> b!1571896 (=> (not res!1074013) (not e!876479))))

(assert (=> b!1571896 (= res!1074013 (= (size!51193 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571897 () Bool)

(declare-fun res!1074014 () Bool)

(assert (=> b!1571897 (=> (not res!1074014) (not e!876479))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571897 (= res!1074014 (validKeyInArray!0 k!754))))

(declare-fun b!1571898 () Bool)

(assert (=> b!1571898 (= e!876479 false)))

(declare-datatypes ((SeekEntryResult!13556 0))(
  ( (MissingZero!13556 (index!56622 (_ BitVec 32))) (Found!13556 (index!56623 (_ BitVec 32))) (Intermediate!13556 (undefined!14368 Bool) (index!56624 (_ BitVec 32)) (x!141384 (_ BitVec 32))) (Undefined!13556) (MissingVacant!13556 (index!56625 (_ BitVec 32))) )
))
(declare-fun lt!673777 () SeekEntryResult!13556)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104947 (_ BitVec 32)) SeekEntryResult!13556)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571898 (= lt!673777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134850 res!1074015) b!1571896))

(assert (= (and b!1571896 res!1074013) b!1571897))

(assert (= (and b!1571897 res!1074014) b!1571898))

(declare-fun m!1445787 () Bool)

(assert (=> start!134850 m!1445787))

(declare-fun m!1445789 () Bool)

(assert (=> start!134850 m!1445789))

(declare-fun m!1445791 () Bool)

(assert (=> b!1571897 m!1445791))

(declare-fun m!1445793 () Bool)

(assert (=> b!1571898 m!1445793))

(assert (=> b!1571898 m!1445793))

(declare-fun m!1445795 () Bool)

(assert (=> b!1571898 m!1445795))

(push 1)

(assert (not b!1571897))

(assert (not start!134850))

(assert (not b!1571898))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

