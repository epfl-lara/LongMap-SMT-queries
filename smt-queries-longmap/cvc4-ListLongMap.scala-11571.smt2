; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134832 () Bool)

(assert start!134832)

(declare-fun res!1073934 () Bool)

(declare-fun e!876425 () Bool)

(assert (=> start!134832 (=> (not res!1073934) (not e!876425))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134832 (= res!1073934 (validMask!0 mask!889))))

(assert (=> start!134832 e!876425))

(assert (=> start!134832 true))

(declare-datatypes ((array!104929 0))(
  ( (array!104930 (arr!50634 (Array (_ BitVec 32) (_ BitVec 64))) (size!51184 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104929)

(declare-fun array_inv!39361 (array!104929) Bool)

(assert (=> start!134832 (array_inv!39361 _keys!600)))

(declare-fun b!1571815 () Bool)

(declare-fun res!1073933 () Bool)

(assert (=> b!1571815 (=> (not res!1073933) (not e!876425))))

(assert (=> b!1571815 (= res!1073933 (= (size!51184 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571816 () Bool)

(declare-fun res!1073932 () Bool)

(assert (=> b!1571816 (=> (not res!1073932) (not e!876425))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571816 (= res!1073932 (validKeyInArray!0 k!754))))

(declare-fun b!1571817 () Bool)

(assert (=> b!1571817 (= e!876425 false)))

(declare-datatypes ((SeekEntryResult!13547 0))(
  ( (MissingZero!13547 (index!56586 (_ BitVec 32))) (Found!13547 (index!56587 (_ BitVec 32))) (Intermediate!13547 (undefined!14359 Bool) (index!56588 (_ BitVec 32)) (x!141351 (_ BitVec 32))) (Undefined!13547) (MissingVacant!13547 (index!56589 (_ BitVec 32))) )
))
(declare-fun lt!673750 () SeekEntryResult!13547)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104929 (_ BitVec 32)) SeekEntryResult!13547)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571817 (= lt!673750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134832 res!1073934) b!1571815))

(assert (= (and b!1571815 res!1073933) b!1571816))

(assert (= (and b!1571816 res!1073932) b!1571817))

(declare-fun m!1445691 () Bool)

(assert (=> start!134832 m!1445691))

(declare-fun m!1445693 () Bool)

(assert (=> start!134832 m!1445693))

(declare-fun m!1445695 () Bool)

(assert (=> b!1571816 m!1445695))

(declare-fun m!1445697 () Bool)

(assert (=> b!1571817 m!1445697))

(assert (=> b!1571817 m!1445697))

(declare-fun m!1445699 () Bool)

(assert (=> b!1571817 m!1445699))

(push 1)

(assert (not start!134832))

(assert (not b!1571817))

(assert (not b!1571816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

