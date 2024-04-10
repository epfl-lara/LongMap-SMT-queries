; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134748 () Bool)

(assert start!134748)

(declare-fun res!1073765 () Bool)

(declare-fun e!876316 () Bool)

(assert (=> start!134748 (=> (not res!1073765) (not e!876316))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134748 (= res!1073765 (validMask!0 mask!889))))

(assert (=> start!134748 e!876316))

(assert (=> start!134748 true))

(declare-datatypes ((array!104887 0))(
  ( (array!104888 (arr!50616 (Array (_ BitVec 32) (_ BitVec 64))) (size!51166 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104887)

(declare-fun array_inv!39343 (array!104887) Bool)

(assert (=> start!134748 (array_inv!39343 _keys!600)))

(declare-fun b!1571653 () Bool)

(declare-fun res!1073764 () Bool)

(assert (=> b!1571653 (=> (not res!1073764) (not e!876316))))

(assert (=> b!1571653 (= res!1073764 (= (size!51166 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571654 () Bool)

(declare-fun res!1073766 () Bool)

(assert (=> b!1571654 (=> (not res!1073766) (not e!876316))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571654 (= res!1073766 (validKeyInArray!0 k!754))))

(declare-fun b!1571655 () Bool)

(assert (=> b!1571655 (= e!876316 false)))

(declare-fun lt!673660 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571655 (= lt!673660 (toIndex!0 k!754 mask!889))))

(assert (= (and start!134748 res!1073765) b!1571653))

(assert (= (and b!1571653 res!1073764) b!1571654))

(assert (= (and b!1571654 res!1073766) b!1571655))

(declare-fun m!1445543 () Bool)

(assert (=> start!134748 m!1445543))

(declare-fun m!1445545 () Bool)

(assert (=> start!134748 m!1445545))

(declare-fun m!1445547 () Bool)

(assert (=> b!1571654 m!1445547))

(declare-fun m!1445549 () Bool)

(assert (=> b!1571655 m!1445549))

(push 1)

(assert (not start!134748))

(assert (not b!1571655))

(assert (not b!1571654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

