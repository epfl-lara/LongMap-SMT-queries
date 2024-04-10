; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134842 () Bool)

(assert start!134842)

(declare-fun res!1073979 () Bool)

(declare-fun e!876455 () Bool)

(assert (=> start!134842 (=> (not res!1073979) (not e!876455))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134842 (= res!1073979 (validMask!0 mask!889))))

(assert (=> start!134842 e!876455))

(assert (=> start!134842 true))

(declare-datatypes ((array!104939 0))(
  ( (array!104940 (arr!50639 (Array (_ BitVec 32) (_ BitVec 64))) (size!51189 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104939)

(declare-fun array_inv!39366 (array!104939) Bool)

(assert (=> start!134842 (array_inv!39366 _keys!600)))

(declare-fun b!1571860 () Bool)

(declare-fun res!1073977 () Bool)

(assert (=> b!1571860 (=> (not res!1073977) (not e!876455))))

(assert (=> b!1571860 (= res!1073977 (= (size!51189 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571861 () Bool)

(declare-fun res!1073978 () Bool)

(assert (=> b!1571861 (=> (not res!1073978) (not e!876455))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571861 (= res!1073978 (validKeyInArray!0 k0!754))))

(declare-fun b!1571862 () Bool)

(assert (=> b!1571862 (= e!876455 false)))

(declare-datatypes ((SeekEntryResult!13552 0))(
  ( (MissingZero!13552 (index!56606 (_ BitVec 32))) (Found!13552 (index!56607 (_ BitVec 32))) (Intermediate!13552 (undefined!14364 Bool) (index!56608 (_ BitVec 32)) (x!141372 (_ BitVec 32))) (Undefined!13552) (MissingVacant!13552 (index!56609 (_ BitVec 32))) )
))
(declare-fun lt!673765 () SeekEntryResult!13552)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104939 (_ BitVec 32)) SeekEntryResult!13552)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571862 (= lt!673765 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134842 res!1073979) b!1571860))

(assert (= (and b!1571860 res!1073977) b!1571861))

(assert (= (and b!1571861 res!1073978) b!1571862))

(declare-fun m!1445747 () Bool)

(assert (=> start!134842 m!1445747))

(declare-fun m!1445749 () Bool)

(assert (=> start!134842 m!1445749))

(declare-fun m!1445751 () Bool)

(assert (=> b!1571861 m!1445751))

(declare-fun m!1445753 () Bool)

(assert (=> b!1571862 m!1445753))

(assert (=> b!1571862 m!1445753))

(declare-fun m!1445755 () Bool)

(assert (=> b!1571862 m!1445755))

(check-sat (not b!1571861) (not b!1571862) (not start!134842))
(check-sat)
