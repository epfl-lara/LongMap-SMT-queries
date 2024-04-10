; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134846 () Bool)

(assert start!134846)

(declare-fun res!1073995 () Bool)

(declare-fun e!876467 () Bool)

(assert (=> start!134846 (=> (not res!1073995) (not e!876467))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134846 (= res!1073995 (validMask!0 mask!889))))

(assert (=> start!134846 e!876467))

(assert (=> start!134846 true))

(declare-datatypes ((array!104943 0))(
  ( (array!104944 (arr!50641 (Array (_ BitVec 32) (_ BitVec 64))) (size!51191 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104943)

(declare-fun array_inv!39368 (array!104943) Bool)

(assert (=> start!134846 (array_inv!39368 _keys!600)))

(declare-fun b!1571878 () Bool)

(declare-fun res!1073996 () Bool)

(assert (=> b!1571878 (=> (not res!1073996) (not e!876467))))

(assert (=> b!1571878 (= res!1073996 (= (size!51191 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571879 () Bool)

(declare-fun res!1073997 () Bool)

(assert (=> b!1571879 (=> (not res!1073997) (not e!876467))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571879 (= res!1073997 (validKeyInArray!0 k!754))))

(declare-fun b!1571880 () Bool)

(assert (=> b!1571880 (= e!876467 false)))

(declare-datatypes ((SeekEntryResult!13554 0))(
  ( (MissingZero!13554 (index!56614 (_ BitVec 32))) (Found!13554 (index!56615 (_ BitVec 32))) (Intermediate!13554 (undefined!14366 Bool) (index!56616 (_ BitVec 32)) (x!141382 (_ BitVec 32))) (Undefined!13554) (MissingVacant!13554 (index!56617 (_ BitVec 32))) )
))
(declare-fun lt!673771 () SeekEntryResult!13554)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104943 (_ BitVec 32)) SeekEntryResult!13554)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571880 (= lt!673771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134846 res!1073995) b!1571878))

(assert (= (and b!1571878 res!1073996) b!1571879))

(assert (= (and b!1571879 res!1073997) b!1571880))

(declare-fun m!1445767 () Bool)

(assert (=> start!134846 m!1445767))

(declare-fun m!1445769 () Bool)

(assert (=> start!134846 m!1445769))

(declare-fun m!1445771 () Bool)

(assert (=> b!1571879 m!1445771))

(declare-fun m!1445773 () Bool)

(assert (=> b!1571880 m!1445773))

(assert (=> b!1571880 m!1445773))

(declare-fun m!1445775 () Bool)

(assert (=> b!1571880 m!1445775))

(push 1)

(assert (not b!1571879))

(assert (not start!134846))

(assert (not b!1571880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

