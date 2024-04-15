; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135484 () Bool)

(assert start!135484)

(declare-fun b!1573979 () Bool)

(declare-fun res!1075455 () Bool)

(declare-fun e!877765 () Bool)

(assert (=> b!1573979 (=> (not res!1075455) (not e!877765))))

(declare-datatypes ((array!105155 0))(
  ( (array!105156 (arr!50726 (Array (_ BitVec 32) (_ BitVec 64))) (size!51278 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105155)

(declare-fun i!537 () (_ BitVec 32))

(declare-fun mask!877 () (_ BitVec 32))

(assert (=> b!1573979 (= res!1075455 (and (= (size!51278 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51278 _keys!591)) (bvslt i!537 (size!51278 _keys!591))))))

(declare-fun b!1573981 () Bool)

(declare-fun e!877764 () Bool)

(assert (=> b!1573981 (= e!877765 (not e!877764))))

(declare-fun res!1075457 () Bool)

(assert (=> b!1573981 (=> res!1075457 e!877764)))

(declare-datatypes ((SeekEntryResult!13650 0))(
  ( (MissingZero!13650 (index!56998 (_ BitVec 32))) (Found!13650 (index!56999 (_ BitVec 32))) (Intermediate!13650 (undefined!14462 Bool) (index!57000 (_ BitVec 32)) (x!141880 (_ BitVec 32))) (Undefined!13650) (MissingVacant!13650 (index!57001 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105155 (_ BitVec 32)) SeekEntryResult!13650)

(assert (=> b!1573981 (= res!1075457 (not (= (seekEntryOrOpen!0 (select (arr!50726 _keys!591) i!537) _keys!591 mask!877) (Found!13650 i!537))))))

(declare-fun arrayContainsKey!0 (array!105155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573981 (arrayContainsKey!0 _keys!591 (select (arr!50726 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!51977 0))(
  ( (Unit!51978) )
))
(declare-fun lt!674484 () Unit!51977)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105155 (_ BitVec 64) (_ BitVec 32)) Unit!51977)

(assert (=> b!1573981 (= lt!674484 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50726 _keys!591) i!537) i!537))))

(declare-fun res!1075458 () Bool)

(assert (=> start!135484 (=> (not res!1075458) (not e!877765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135484 (= res!1075458 (validMask!0 mask!877))))

(assert (=> start!135484 e!877765))

(assert (=> start!135484 true))

(declare-fun array_inv!39662 (array!105155) Bool)

(assert (=> start!135484 (array_inv!39662 _keys!591)))

(declare-fun b!1573982 () Bool)

(assert (=> b!1573982 (= e!877764 (bvslt (bvsub (size!51278 _keys!591) (bvadd #b00000000000000000000000000000001 i!537)) (bvsub (size!51278 _keys!591) i!537)))))

(declare-fun b!1573980 () Bool)

(declare-fun res!1075456 () Bool)

(assert (=> b!1573980 (=> (not res!1075456) (not e!877765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573980 (= res!1075456 (validKeyInArray!0 (select (arr!50726 _keys!591) i!537)))))

(assert (= (and start!135484 res!1075458) b!1573979))

(assert (= (and b!1573979 res!1075455) b!1573980))

(assert (= (and b!1573980 res!1075456) b!1573981))

(assert (= (and b!1573981 (not res!1075457)) b!1573982))

(declare-fun m!1446645 () Bool)

(assert (=> b!1573981 m!1446645))

(assert (=> b!1573981 m!1446645))

(declare-fun m!1446647 () Bool)

(assert (=> b!1573981 m!1446647))

(assert (=> b!1573981 m!1446645))

(declare-fun m!1446649 () Bool)

(assert (=> b!1573981 m!1446649))

(assert (=> b!1573981 m!1446645))

(declare-fun m!1446651 () Bool)

(assert (=> b!1573981 m!1446651))

(declare-fun m!1446653 () Bool)

(assert (=> start!135484 m!1446653))

(declare-fun m!1446655 () Bool)

(assert (=> start!135484 m!1446655))

(assert (=> b!1573980 m!1446645))

(assert (=> b!1573980 m!1446645))

(declare-fun m!1446657 () Bool)

(assert (=> b!1573980 m!1446657))

(check-sat (not start!135484) (not b!1573980) (not b!1573981))
(check-sat)
