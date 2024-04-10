; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97642 () Bool)

(assert start!97642)

(declare-fun b!1115757 () Bool)

(declare-fun res!744922 () Bool)

(declare-fun e!635777 () Bool)

(assert (=> b!1115757 (=> (not res!744922) (not e!635777))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1115757 (= res!744922 (validKeyInArray!0 k0!934))))

(declare-fun b!1115758 () Bool)

(declare-fun res!744914 () Bool)

(assert (=> b!1115758 (=> (not res!744914) (not e!635777))))

(declare-datatypes ((array!72643 0))(
  ( (array!72644 (arr!34974 (Array (_ BitVec 32) (_ BitVec 64))) (size!35510 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72643)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1115758 (= res!744914 (= (select (arr!34974 _keys!1208) i!673) k0!934))))

(declare-fun b!1115759 () Bool)

(declare-fun e!635781 () Bool)

(assert (=> b!1115759 (= e!635777 e!635781)))

(declare-fun res!744919 () Bool)

(assert (=> b!1115759 (=> (not res!744919) (not e!635781))))

(declare-fun lt!497029 () array!72643)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72643 (_ BitVec 32)) Bool)

(assert (=> b!1115759 (= res!744919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497029 mask!1564))))

(assert (=> b!1115759 (= lt!497029 (array!72644 (store (arr!34974 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35510 _keys!1208)))))

(declare-fun b!1115760 () Bool)

(declare-fun e!635778 () Bool)

(declare-fun e!635780 () Bool)

(declare-fun mapRes!43627 () Bool)

(assert (=> b!1115760 (= e!635778 (and e!635780 mapRes!43627))))

(declare-fun condMapEmpty!43627 () Bool)

(declare-datatypes ((V!42291 0))(
  ( (V!42292 (val!13993 Int)) )
))
(declare-datatypes ((ValueCell!13227 0))(
  ( (ValueCellFull!13227 (v!16626 V!42291)) (EmptyCell!13227) )
))
(declare-datatypes ((array!72645 0))(
  ( (array!72646 (arr!34975 (Array (_ BitVec 32) ValueCell!13227)) (size!35511 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72645)

(declare-fun mapDefault!43627 () ValueCell!13227)

(assert (=> b!1115760 (= condMapEmpty!43627 (= (arr!34975 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13227)) mapDefault!43627)))))

(declare-fun b!1115761 () Bool)

(declare-fun res!744917 () Bool)

(assert (=> b!1115761 (=> (not res!744917) (not e!635777))))

(declare-datatypes ((List!24353 0))(
  ( (Nil!24350) (Cons!24349 (h!25558 (_ BitVec 64)) (t!34834 List!24353)) )
))
(declare-fun arrayNoDuplicates!0 (array!72643 (_ BitVec 32) List!24353) Bool)

(assert (=> b!1115761 (= res!744917 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24350))))

(declare-fun mapNonEmpty!43627 () Bool)

(declare-fun tp!82871 () Bool)

(declare-fun e!635779 () Bool)

(assert (=> mapNonEmpty!43627 (= mapRes!43627 (and tp!82871 e!635779))))

(declare-fun mapKey!43627 () (_ BitVec 32))

(declare-fun mapValue!43627 () ValueCell!13227)

(declare-fun mapRest!43627 () (Array (_ BitVec 32) ValueCell!13227))

(assert (=> mapNonEmpty!43627 (= (arr!34975 _values!996) (store mapRest!43627 mapKey!43627 mapValue!43627))))

(declare-fun res!744916 () Bool)

(assert (=> start!97642 (=> (not res!744916) (not e!635777))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97642 (= res!744916 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35510 _keys!1208))))))

(assert (=> start!97642 e!635777))

(declare-fun array_inv!26882 (array!72643) Bool)

(assert (=> start!97642 (array_inv!26882 _keys!1208)))

(assert (=> start!97642 true))

(declare-fun array_inv!26883 (array!72645) Bool)

(assert (=> start!97642 (and (array_inv!26883 _values!996) e!635778)))

(declare-fun b!1115762 () Bool)

(declare-fun res!744913 () Bool)

(assert (=> b!1115762 (=> (not res!744913) (not e!635777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115762 (= res!744913 (validMask!0 mask!1564))))

(declare-fun b!1115763 () Bool)

(declare-fun res!744915 () Bool)

(assert (=> b!1115763 (=> (not res!744915) (not e!635781))))

(assert (=> b!1115763 (= res!744915 (arrayNoDuplicates!0 lt!497029 #b00000000000000000000000000000000 Nil!24350))))

(declare-fun mapIsEmpty!43627 () Bool)

(assert (=> mapIsEmpty!43627 mapRes!43627))

(declare-fun b!1115764 () Bool)

(declare-fun res!744918 () Bool)

(assert (=> b!1115764 (=> (not res!744918) (not e!635777))))

(assert (=> b!1115764 (= res!744918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1115765 () Bool)

(declare-fun res!744921 () Bool)

(assert (=> b!1115765 (=> (not res!744921) (not e!635777))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1115765 (= res!744921 (and (= (size!35511 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35510 _keys!1208) (size!35511 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115766 () Bool)

(declare-fun tp_is_empty!27873 () Bool)

(assert (=> b!1115766 (= e!635780 tp_is_empty!27873)))

(declare-fun b!1115767 () Bool)

(declare-fun res!744920 () Bool)

(assert (=> b!1115767 (=> (not res!744920) (not e!635777))))

(assert (=> b!1115767 (= res!744920 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35510 _keys!1208))))))

(declare-fun b!1115768 () Bool)

(assert (=> b!1115768 (= e!635781 (not true))))

(declare-fun arrayContainsKey!0 (array!72643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1115768 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36618 0))(
  ( (Unit!36619) )
))
(declare-fun lt!497030 () Unit!36618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72643 (_ BitVec 64) (_ BitVec 32)) Unit!36618)

(assert (=> b!1115768 (= lt!497030 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1115769 () Bool)

(assert (=> b!1115769 (= e!635779 tp_is_empty!27873)))

(assert (= (and start!97642 res!744916) b!1115762))

(assert (= (and b!1115762 res!744913) b!1115765))

(assert (= (and b!1115765 res!744921) b!1115764))

(assert (= (and b!1115764 res!744918) b!1115761))

(assert (= (and b!1115761 res!744917) b!1115767))

(assert (= (and b!1115767 res!744920) b!1115757))

(assert (= (and b!1115757 res!744922) b!1115758))

(assert (= (and b!1115758 res!744914) b!1115759))

(assert (= (and b!1115759 res!744919) b!1115763))

(assert (= (and b!1115763 res!744915) b!1115768))

(assert (= (and b!1115760 condMapEmpty!43627) mapIsEmpty!43627))

(assert (= (and b!1115760 (not condMapEmpty!43627)) mapNonEmpty!43627))

(get-info :version)

(assert (= (and mapNonEmpty!43627 ((_ is ValueCellFull!13227) mapValue!43627)) b!1115769))

(assert (= (and b!1115760 ((_ is ValueCellFull!13227) mapDefault!43627)) b!1115766))

(assert (= start!97642 b!1115760))

(declare-fun m!1032193 () Bool)

(assert (=> b!1115764 m!1032193))

(declare-fun m!1032195 () Bool)

(assert (=> b!1115763 m!1032195))

(declare-fun m!1032197 () Bool)

(assert (=> b!1115758 m!1032197))

(declare-fun m!1032199 () Bool)

(assert (=> b!1115761 m!1032199))

(declare-fun m!1032201 () Bool)

(assert (=> mapNonEmpty!43627 m!1032201))

(declare-fun m!1032203 () Bool)

(assert (=> start!97642 m!1032203))

(declare-fun m!1032205 () Bool)

(assert (=> start!97642 m!1032205))

(declare-fun m!1032207 () Bool)

(assert (=> b!1115768 m!1032207))

(declare-fun m!1032209 () Bool)

(assert (=> b!1115768 m!1032209))

(declare-fun m!1032211 () Bool)

(assert (=> b!1115762 m!1032211))

(declare-fun m!1032213 () Bool)

(assert (=> b!1115757 m!1032213))

(declare-fun m!1032215 () Bool)

(assert (=> b!1115759 m!1032215))

(declare-fun m!1032217 () Bool)

(assert (=> b!1115759 m!1032217))

(check-sat (not b!1115757) (not b!1115768) (not b!1115761) (not b!1115759) tp_is_empty!27873 (not b!1115762) (not b!1115763) (not start!97642) (not b!1115764) (not mapNonEmpty!43627))
(check-sat)
