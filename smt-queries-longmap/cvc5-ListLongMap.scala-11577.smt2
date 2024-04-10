; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134894 () Bool)

(assert start!134894)

(declare-fun res!1074108 () Bool)

(declare-fun e!876566 () Bool)

(assert (=> start!134894 (=> (not res!1074108) (not e!876566))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134894 (= res!1074108 (validMask!0 mask!889))))

(assert (=> start!134894 e!876566))

(assert (=> start!134894 true))

(declare-datatypes ((array!104964 0))(
  ( (array!104965 (arr!50650 (Array (_ BitVec 32) (_ BitVec 64))) (size!51200 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104964)

(declare-fun array_inv!39377 (array!104964) Bool)

(assert (=> start!134894 (array_inv!39377 _keys!600)))

(declare-fun b!1572040 () Bool)

(declare-fun res!1074107 () Bool)

(assert (=> b!1572040 (=> (not res!1074107) (not e!876566))))

(assert (=> b!1572040 (= res!1074107 (= (size!51200 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572041 () Bool)

(declare-fun res!1074106 () Bool)

(assert (=> b!1572041 (=> (not res!1074106) (not e!876566))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572041 (= res!1074106 (validKeyInArray!0 k!754))))

(declare-fun b!1572042 () Bool)

(assert (=> b!1572042 (= e!876566 false)))

(declare-datatypes ((SeekEntryResult!13563 0))(
  ( (MissingZero!13563 (index!56650 (_ BitVec 32))) (Found!13563 (index!56651 (_ BitVec 32))) (Intermediate!13563 (undefined!14375 Bool) (index!56652 (_ BitVec 32)) (x!141421 (_ BitVec 32))) (Undefined!13563) (MissingVacant!13563 (index!56653 (_ BitVec 32))) )
))
(declare-fun lt!673834 () SeekEntryResult!13563)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104964 (_ BitVec 32)) SeekEntryResult!13563)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572042 (= lt!673834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134894 res!1074108) b!1572040))

(assert (= (and b!1572040 res!1074107) b!1572041))

(assert (= (and b!1572041 res!1074106) b!1572042))

(declare-fun m!1445887 () Bool)

(assert (=> start!134894 m!1445887))

(declare-fun m!1445889 () Bool)

(assert (=> start!134894 m!1445889))

(declare-fun m!1445891 () Bool)

(assert (=> b!1572041 m!1445891))

(declare-fun m!1445893 () Bool)

(assert (=> b!1572042 m!1445893))

(assert (=> b!1572042 m!1445893))

(declare-fun m!1445895 () Bool)

(assert (=> b!1572042 m!1445895))

(push 1)

(assert (not b!1572041))

(assert (not start!134894))

(assert (not b!1572042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

