; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135046 () Bool)

(assert start!135046)

(declare-fun res!1074468 () Bool)

(declare-fun e!876793 () Bool)

(assert (=> start!135046 (=> (not res!1074468) (not e!876793))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135046 (= res!1074468 (validMask!0 mask!889))))

(assert (=> start!135046 e!876793))

(assert (=> start!135046 true))

(declare-datatypes ((array!104986 0))(
  ( (array!104987 (arr!50656 (Array (_ BitVec 32) (_ BitVec 64))) (size!51208 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104986)

(declare-fun array_inv!39592 (array!104986) Bool)

(assert (=> start!135046 (array_inv!39592 _keys!600)))

(declare-fun b!1572420 () Bool)

(declare-fun res!1074467 () Bool)

(assert (=> b!1572420 (=> (not res!1074467) (not e!876793))))

(assert (=> b!1572420 (= res!1074467 (= (size!51208 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572421 () Bool)

(declare-fun res!1074466 () Bool)

(assert (=> b!1572421 (=> (not res!1074466) (not e!876793))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572421 (= res!1074466 (validKeyInArray!0 k!754))))

(declare-fun b!1572422 () Bool)

(assert (=> b!1572422 (= e!876793 false)))

(declare-datatypes ((SeekEntryResult!13604 0))(
  ( (MissingZero!13604 (index!56814 (_ BitVec 32))) (Found!13604 (index!56815 (_ BitVec 32))) (Intermediate!13604 (undefined!14416 Bool) (index!56816 (_ BitVec 32)) (x!141585 (_ BitVec 32))) (Undefined!13604) (MissingVacant!13604 (index!56817 (_ BitVec 32))) )
))
(declare-fun lt!673815 () SeekEntryResult!13604)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104986 (_ BitVec 32)) SeekEntryResult!13604)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572422 (= lt!673815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135046 res!1074468) b!1572420))

(assert (= (and b!1572420 res!1074467) b!1572421))

(assert (= (and b!1572421 res!1074466) b!1572422))

(declare-fun m!1445519 () Bool)

(assert (=> start!135046 m!1445519))

(declare-fun m!1445521 () Bool)

(assert (=> start!135046 m!1445521))

(declare-fun m!1445523 () Bool)

(assert (=> b!1572421 m!1445523))

(declare-fun m!1445525 () Bool)

(assert (=> b!1572422 m!1445525))

(assert (=> b!1572422 m!1445525))

(declare-fun m!1445527 () Bool)

(assert (=> b!1572422 m!1445527))

(push 1)

(assert (not b!1572421))

(assert (not start!135046))

(assert (not b!1572422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

