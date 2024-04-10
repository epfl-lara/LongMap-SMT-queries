; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134900 () Bool)

(assert start!134900)

(declare-fun res!1074134 () Bool)

(declare-fun e!876584 () Bool)

(assert (=> start!134900 (=> (not res!1074134) (not e!876584))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134900 (= res!1074134 (validMask!0 mask!889))))

(assert (=> start!134900 e!876584))

(assert (=> start!134900 true))

(declare-datatypes ((array!104970 0))(
  ( (array!104971 (arr!50653 (Array (_ BitVec 32) (_ BitVec 64))) (size!51203 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104970)

(declare-fun array_inv!39380 (array!104970) Bool)

(assert (=> start!134900 (array_inv!39380 _keys!600)))

(declare-fun b!1572067 () Bool)

(declare-fun res!1074135 () Bool)

(assert (=> b!1572067 (=> (not res!1074135) (not e!876584))))

(assert (=> b!1572067 (= res!1074135 (= (size!51203 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572068 () Bool)

(declare-fun res!1074133 () Bool)

(assert (=> b!1572068 (=> (not res!1074133) (not e!876584))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572068 (= res!1074133 (validKeyInArray!0 k!754))))

(declare-fun b!1572069 () Bool)

(assert (=> b!1572069 (= e!876584 false)))

(declare-datatypes ((SeekEntryResult!13566 0))(
  ( (MissingZero!13566 (index!56662 (_ BitVec 32))) (Found!13566 (index!56663 (_ BitVec 32))) (Intermediate!13566 (undefined!14378 Bool) (index!56664 (_ BitVec 32)) (x!141432 (_ BitVec 32))) (Undefined!13566) (MissingVacant!13566 (index!56665 (_ BitVec 32))) )
))
(declare-fun lt!673843 () SeekEntryResult!13566)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104970 (_ BitVec 32)) SeekEntryResult!13566)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572069 (= lt!673843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134900 res!1074134) b!1572067))

(assert (= (and b!1572067 res!1074135) b!1572068))

(assert (= (and b!1572068 res!1074133) b!1572069))

(declare-fun m!1445917 () Bool)

(assert (=> start!134900 m!1445917))

(declare-fun m!1445919 () Bool)

(assert (=> start!134900 m!1445919))

(declare-fun m!1445921 () Bool)

(assert (=> b!1572068 m!1445921))

(declare-fun m!1445923 () Bool)

(assert (=> b!1572069 m!1445923))

(assert (=> b!1572069 m!1445923))

(declare-fun m!1445925 () Bool)

(assert (=> b!1572069 m!1445925))

(push 1)

(assert (not b!1572068))

(assert (not start!134900))

(assert (not b!1572069))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

