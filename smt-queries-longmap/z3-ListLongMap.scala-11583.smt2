; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134940 () Bool)

(assert start!134940)

(declare-fun res!1074199 () Bool)

(declare-fun e!876566 () Bool)

(assert (=> start!134940 (=> (not res!1074199) (not e!876566))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134940 (= res!1074199 (validMask!0 mask!889))))

(assert (=> start!134940 e!876566))

(assert (=> start!134940 true))

(declare-datatypes ((array!104934 0))(
  ( (array!104935 (arr!50633 (Array (_ BitVec 32) (_ BitVec 64))) (size!51185 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104934)

(declare-fun array_inv!39569 (array!104934) Bool)

(assert (=> start!134940 (array_inv!39569 _keys!600)))

(declare-fun b!1572051 () Bool)

(declare-fun res!1074201 () Bool)

(assert (=> b!1572051 (=> (not res!1074201) (not e!876566))))

(assert (=> b!1572051 (= res!1074201 (= (size!51185 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572052 () Bool)

(declare-fun res!1074200 () Bool)

(assert (=> b!1572052 (=> (not res!1074200) (not e!876566))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572052 (= res!1074200 (validKeyInArray!0 k0!754))))

(declare-fun b!1572053 () Bool)

(assert (=> b!1572053 (= e!876566 false)))

(declare-datatypes ((SeekEntryResult!13581 0))(
  ( (MissingZero!13581 (index!56722 (_ BitVec 32))) (Found!13581 (index!56723 (_ BitVec 32))) (Intermediate!13581 (undefined!14393 Bool) (index!56724 (_ BitVec 32)) (x!141494 (_ BitVec 32))) (Undefined!13581) (MissingVacant!13581 (index!56725 (_ BitVec 32))) )
))
(declare-fun lt!673674 () SeekEntryResult!13581)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104934 (_ BitVec 32)) SeekEntryResult!13581)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572053 (= lt!673674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134940 res!1074199) b!1572051))

(assert (= (and b!1572051 res!1074201) b!1572052))

(assert (= (and b!1572052 res!1074200) b!1572053))

(declare-fun m!1445235 () Bool)

(assert (=> start!134940 m!1445235))

(declare-fun m!1445237 () Bool)

(assert (=> start!134940 m!1445237))

(declare-fun m!1445239 () Bool)

(assert (=> b!1572052 m!1445239))

(declare-fun m!1445241 () Bool)

(assert (=> b!1572053 m!1445241))

(assert (=> b!1572053 m!1445241))

(declare-fun m!1445243 () Bool)

(assert (=> b!1572053 m!1445243))

(check-sat (not b!1572052) (not start!134940) (not b!1572053))
(check-sat)
