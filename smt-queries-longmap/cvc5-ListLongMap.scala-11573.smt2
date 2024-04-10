; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134840 () Bool)

(assert start!134840)

(declare-fun res!1073970 () Bool)

(declare-fun e!876449 () Bool)

(assert (=> start!134840 (=> (not res!1073970) (not e!876449))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134840 (= res!1073970 (validMask!0 mask!889))))

(assert (=> start!134840 e!876449))

(assert (=> start!134840 true))

(declare-datatypes ((array!104937 0))(
  ( (array!104938 (arr!50638 (Array (_ BitVec 32) (_ BitVec 64))) (size!51188 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104937)

(declare-fun array_inv!39365 (array!104937) Bool)

(assert (=> start!134840 (array_inv!39365 _keys!600)))

(declare-fun b!1571851 () Bool)

(declare-fun res!1073969 () Bool)

(assert (=> b!1571851 (=> (not res!1073969) (not e!876449))))

(assert (=> b!1571851 (= res!1073969 (= (size!51188 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571852 () Bool)

(declare-fun res!1073968 () Bool)

(assert (=> b!1571852 (=> (not res!1073968) (not e!876449))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571852 (= res!1073968 (validKeyInArray!0 k!754))))

(declare-fun b!1571853 () Bool)

(assert (=> b!1571853 (= e!876449 false)))

(declare-datatypes ((SeekEntryResult!13551 0))(
  ( (MissingZero!13551 (index!56602 (_ BitVec 32))) (Found!13551 (index!56603 (_ BitVec 32))) (Intermediate!13551 (undefined!14363 Bool) (index!56604 (_ BitVec 32)) (x!141371 (_ BitVec 32))) (Undefined!13551) (MissingVacant!13551 (index!56605 (_ BitVec 32))) )
))
(declare-fun lt!673762 () SeekEntryResult!13551)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104937 (_ BitVec 32)) SeekEntryResult!13551)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571853 (= lt!673762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134840 res!1073970) b!1571851))

(assert (= (and b!1571851 res!1073969) b!1571852))

(assert (= (and b!1571852 res!1073968) b!1571853))

(declare-fun m!1445737 () Bool)

(assert (=> start!134840 m!1445737))

(declare-fun m!1445739 () Bool)

(assert (=> start!134840 m!1445739))

(declare-fun m!1445741 () Bool)

(assert (=> b!1571852 m!1445741))

(declare-fun m!1445743 () Bool)

(assert (=> b!1571853 m!1445743))

(assert (=> b!1571853 m!1445743))

(declare-fun m!1445745 () Bool)

(assert (=> b!1571853 m!1445745))

(push 1)

(assert (not b!1571852))

(assert (not b!1571853))

(assert (not start!134840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

