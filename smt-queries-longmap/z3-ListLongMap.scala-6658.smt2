; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83902 () Bool)

(assert start!83902)

(declare-fun b!980552 () Bool)

(declare-fun e!552662 () Bool)

(declare-fun tp_is_empty!22723 () Bool)

(assert (=> b!980552 (= e!552662 tp_is_empty!22723)))

(declare-fun b!980553 () Bool)

(declare-fun e!552663 () Bool)

(declare-fun mapRes!36113 () Bool)

(assert (=> b!980553 (= e!552663 (and e!552662 mapRes!36113))))

(declare-fun condMapEmpty!36113 () Bool)

(declare-datatypes ((V!35281 0))(
  ( (V!35282 (val!11412 Int)) )
))
(declare-datatypes ((ValueCell!10880 0))(
  ( (ValueCellFull!10880 (v!13973 V!35281)) (EmptyCell!10880) )
))
(declare-datatypes ((array!61380 0))(
  ( (array!61381 (arr!29548 (Array (_ BitVec 32) ValueCell!10880)) (size!30029 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61380)

(declare-fun mapDefault!36113 () ValueCell!10880)

(assert (=> b!980553 (= condMapEmpty!36113 (= (arr!29548 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10880)) mapDefault!36113)))))

(declare-fun b!980554 () Bool)

(declare-fun e!552664 () Bool)

(assert (=> b!980554 (= e!552664 false)))

(declare-fun lt!435366 () Bool)

(declare-datatypes ((array!61382 0))(
  ( (array!61383 (arr!29549 (Array (_ BitVec 32) (_ BitVec 64))) (size!30030 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61382)

(declare-datatypes ((List!20534 0))(
  ( (Nil!20531) (Cons!20530 (h!21692 (_ BitVec 64)) (t!29208 List!20534)) )
))
(declare-fun arrayNoDuplicates!0 (array!61382 (_ BitVec 32) List!20534) Bool)

(assert (=> b!980554 (= lt!435366 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20531))))

(declare-fun res!656280 () Bool)

(assert (=> start!83902 (=> (not res!656280) (not e!552664))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83902 (= res!656280 (validMask!0 mask!1948))))

(assert (=> start!83902 e!552664))

(assert (=> start!83902 true))

(declare-fun array_inv!22867 (array!61380) Bool)

(assert (=> start!83902 (and (array_inv!22867 _values!1278) e!552663)))

(declare-fun array_inv!22868 (array!61382) Bool)

(assert (=> start!83902 (array_inv!22868 _keys!1544)))

(declare-fun b!980555 () Bool)

(declare-fun e!552665 () Bool)

(assert (=> b!980555 (= e!552665 tp_is_empty!22723)))

(declare-fun b!980556 () Bool)

(declare-fun res!656278 () Bool)

(assert (=> b!980556 (=> (not res!656278) (not e!552664))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980556 (= res!656278 (and (= (size!30029 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30030 _keys!1544) (size!30029 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980557 () Bool)

(declare-fun res!656279 () Bool)

(assert (=> b!980557 (=> (not res!656279) (not e!552664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61382 (_ BitVec 32)) Bool)

(assert (=> b!980557 (= res!656279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36113 () Bool)

(assert (=> mapIsEmpty!36113 mapRes!36113))

(declare-fun mapNonEmpty!36113 () Bool)

(declare-fun tp!68627 () Bool)

(assert (=> mapNonEmpty!36113 (= mapRes!36113 (and tp!68627 e!552665))))

(declare-fun mapRest!36113 () (Array (_ BitVec 32) ValueCell!10880))

(declare-fun mapValue!36113 () ValueCell!10880)

(declare-fun mapKey!36113 () (_ BitVec 32))

(assert (=> mapNonEmpty!36113 (= (arr!29548 _values!1278) (store mapRest!36113 mapKey!36113 mapValue!36113))))

(assert (= (and start!83902 res!656280) b!980556))

(assert (= (and b!980556 res!656278) b!980557))

(assert (= (and b!980557 res!656279) b!980554))

(assert (= (and b!980553 condMapEmpty!36113) mapIsEmpty!36113))

(assert (= (and b!980553 (not condMapEmpty!36113)) mapNonEmpty!36113))

(get-info :version)

(assert (= (and mapNonEmpty!36113 ((_ is ValueCellFull!10880) mapValue!36113)) b!980555))

(assert (= (and b!980553 ((_ is ValueCellFull!10880) mapDefault!36113)) b!980552))

(assert (= start!83902 b!980553))

(declare-fun m!907625 () Bool)

(assert (=> b!980554 m!907625))

(declare-fun m!907627 () Bool)

(assert (=> start!83902 m!907627))

(declare-fun m!907629 () Bool)

(assert (=> start!83902 m!907629))

(declare-fun m!907631 () Bool)

(assert (=> start!83902 m!907631))

(declare-fun m!907633 () Bool)

(assert (=> b!980557 m!907633))

(declare-fun m!907635 () Bool)

(assert (=> mapNonEmpty!36113 m!907635))

(check-sat (not b!980557) (not b!980554) (not mapNonEmpty!36113) (not start!83902) tp_is_empty!22723)
(check-sat)
