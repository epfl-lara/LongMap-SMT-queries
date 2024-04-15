; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134766 () Bool)

(assert start!134766)

(declare-fun res!1073732 () Bool)

(declare-fun e!876178 () Bool)

(assert (=> start!134766 (=> (not res!1073732) (not e!876178))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134766 (= res!1073732 (validMask!0 mask!889))))

(assert (=> start!134766 e!876178))

(assert (=> start!134766 true))

(declare-datatypes ((array!104841 0))(
  ( (array!104842 (arr!50591 (Array (_ BitVec 32) (_ BitVec 64))) (size!51143 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104841)

(declare-fun array_inv!39527 (array!104841) Bool)

(assert (=> start!134766 (array_inv!39527 _keys!600)))

(declare-fun b!1571430 () Bool)

(declare-fun res!1073733 () Bool)

(assert (=> b!1571430 (=> (not res!1073733) (not e!876178))))

(assert (=> b!1571430 (= res!1073733 (= (size!51143 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571431 () Bool)

(declare-fun res!1073731 () Bool)

(assert (=> b!1571431 (=> (not res!1073731) (not e!876178))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571431 (= res!1073731 (validKeyInArray!0 k0!754))))

(declare-fun b!1571432 () Bool)

(assert (=> b!1571432 (= e!876178 false)))

(declare-fun lt!673440 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571432 (= lt!673440 (toIndex!0 k0!754 mask!889))))

(assert (= (and start!134766 res!1073732) b!1571430))

(assert (= (and b!1571430 res!1073733) b!1571431))

(assert (= (and b!1571431 res!1073731) b!1571432))

(declare-fun m!1444731 () Bool)

(assert (=> start!134766 m!1444731))

(declare-fun m!1444733 () Bool)

(assert (=> start!134766 m!1444733))

(declare-fun m!1444735 () Bool)

(assert (=> b!1571431 m!1444735))

(declare-fun m!1444737 () Bool)

(assert (=> b!1571432 m!1444737))

(check-sat (not b!1571431) (not start!134766) (not b!1571432))
(check-sat)
