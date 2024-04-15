; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134848 () Bool)

(assert start!134848)

(declare-fun res!1073995 () Bool)

(declare-fun e!876380 () Bool)

(assert (=> start!134848 (=> (not res!1073995) (not e!876380))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134848 (= res!1073995 (validMask!0 mask!889))))

(assert (=> start!134848 e!876380))

(assert (=> start!134848 true))

(declare-datatypes ((array!104896 0))(
  ( (array!104897 (arr!50617 (Array (_ BitVec 32) (_ BitVec 64))) (size!51169 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104896)

(declare-fun array_inv!39553 (array!104896) Bool)

(assert (=> start!134848 (array_inv!39553 _keys!600)))

(declare-fun b!1571745 () Bool)

(declare-fun res!1073996 () Bool)

(assert (=> b!1571745 (=> (not res!1073996) (not e!876380))))

(assert (=> b!1571745 (= res!1073996 (= (size!51169 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571746 () Bool)

(declare-fun res!1073997 () Bool)

(assert (=> b!1571746 (=> (not res!1073997) (not e!876380))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571746 (= res!1073997 (validKeyInArray!0 k!754))))

(declare-fun b!1571747 () Bool)

(assert (=> b!1571747 (= e!876380 false)))

(declare-datatypes ((SeekEntryResult!13565 0))(
  ( (MissingZero!13565 (index!56658 (_ BitVec 32))) (Found!13565 (index!56659 (_ BitVec 32))) (Intermediate!13565 (undefined!14377 Bool) (index!56660 (_ BitVec 32)) (x!141418 (_ BitVec 32))) (Undefined!13565) (MissingVacant!13565 (index!56661 (_ BitVec 32))) )
))
(declare-fun lt!673554 () SeekEntryResult!13565)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104896 (_ BitVec 32)) SeekEntryResult!13565)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571747 (= lt!673554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134848 res!1073995) b!1571745))

(assert (= (and b!1571745 res!1073996) b!1571746))

(assert (= (and b!1571746 res!1073997) b!1571747))

(declare-fun m!1445015 () Bool)

(assert (=> start!134848 m!1445015))

(declare-fun m!1445017 () Bool)

(assert (=> start!134848 m!1445017))

(declare-fun m!1445019 () Bool)

(assert (=> b!1571746 m!1445019))

(declare-fun m!1445021 () Bool)

(assert (=> b!1571747 m!1445021))

(assert (=> b!1571747 m!1445021))

(declare-fun m!1445023 () Bool)

(assert (=> b!1571747 m!1445023))

(push 1)

(assert (not start!134848))

(assert (not b!1571747))

(assert (not b!1571746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

