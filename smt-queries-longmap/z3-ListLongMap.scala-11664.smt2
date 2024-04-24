; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136816 () Bool)

(assert start!136816)

(declare-fun res!1078411 () Bool)

(declare-fun e!881279 () Bool)

(assert (=> start!136816 (=> (not res!1078411) (not e!881279))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136816 (= res!1078411 (validMask!0 mask!910))))

(assert (=> start!136816 e!881279))

(assert (=> start!136816 true))

(declare-datatypes ((array!105707 0))(
  ( (array!105708 (arr!50965 (Array (_ BitVec 32) (_ BitVec 64))) (size!51516 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105707)

(declare-fun array_inv!39920 (array!105707) Bool)

(assert (=> start!136816 (array_inv!39920 _keys!610)))

(declare-fun b!1579723 () Bool)

(declare-fun res!1078412 () Bool)

(assert (=> b!1579723 (=> (not res!1078412) (not e!881279))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(assert (=> b!1579723 (= res!1078412 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51516 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1579724 () Bool)

(declare-fun res!1078410 () Bool)

(assert (=> b!1579724 (=> (not res!1078410) (not e!881279))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579724 (= res!1078410 (validKeyInArray!0 k0!768))))

(declare-fun b!1579725 () Bool)

(assert (=> b!1579725 (= e!881279 (and (bvslt x!458 #b01111111111111111111111111111110) (or (= (select (arr!50965 _keys!610) ee!12) k0!768) (= (bvadd (select (arr!50965 _keys!610) ee!12) (select (arr!50965 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge ee!12 (size!51516 _keys!610))))))

(assert (= (and start!136816 res!1078411) b!1579723))

(assert (= (and b!1579723 res!1078412) b!1579724))

(assert (= (and b!1579724 res!1078410) b!1579725))

(declare-fun m!1451841 () Bool)

(assert (=> start!136816 m!1451841))

(declare-fun m!1451843 () Bool)

(assert (=> start!136816 m!1451843))

(declare-fun m!1451845 () Bool)

(assert (=> b!1579724 m!1451845))

(declare-fun m!1451847 () Bool)

(assert (=> b!1579725 m!1451847))

(check-sat (not b!1579724) (not start!136816))
(check-sat)
