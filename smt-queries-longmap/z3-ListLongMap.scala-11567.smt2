; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134782 () Bool)

(assert start!134782)

(declare-fun res!1073814 () Bool)

(declare-fun e!876346 () Bool)

(assert (=> start!134782 (=> (not res!1073814) (not e!876346))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134782 (= res!1073814 (validMask!0 mask!889))))

(assert (=> start!134782 e!876346))

(assert (=> start!134782 true))

(declare-datatypes ((array!104900 0))(
  ( (array!104901 (arr!50621 (Array (_ BitVec 32) (_ BitVec 64))) (size!51171 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104900)

(declare-fun array_inv!39348 (array!104900) Bool)

(assert (=> start!134782 (array_inv!39348 _keys!600)))

(declare-fun b!1571698 () Bool)

(declare-fun res!1073812 () Bool)

(assert (=> b!1571698 (=> (not res!1073812) (not e!876346))))

(assert (=> b!1571698 (= res!1073812 (= (size!51171 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571699 () Bool)

(declare-fun res!1073813 () Bool)

(assert (=> b!1571699 (=> (not res!1073813) (not e!876346))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571699 (= res!1073813 (validKeyInArray!0 k0!754))))

(declare-fun b!1571700 () Bool)

(assert (=> b!1571700 (= e!876346 false)))

(declare-fun lt!673693 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571700 (= lt!673693 (toIndex!0 k0!754 mask!889))))

(assert (= (and start!134782 res!1073814) b!1571698))

(assert (= (and b!1571698 res!1073812) b!1571699))

(assert (= (and b!1571699 res!1073813) b!1571700))

(declare-fun m!1445583 () Bool)

(assert (=> start!134782 m!1445583))

(declare-fun m!1445585 () Bool)

(assert (=> start!134782 m!1445585))

(declare-fun m!1445587 () Bool)

(assert (=> b!1571699 m!1445587))

(declare-fun m!1445589 () Bool)

(assert (=> b!1571700 m!1445589))

(check-sat (not b!1571700) (not start!134782) (not b!1571699))
(check-sat)
