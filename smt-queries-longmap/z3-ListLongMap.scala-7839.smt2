; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98014 () Bool)

(assert start!98014)

(declare-fun b_free!23479 () Bool)

(declare-fun b_next!23479 () Bool)

(assert (=> start!98014 (= b_free!23479 (not b_next!23479))))

(declare-fun tp!83140 () Bool)

(declare-fun b_and!37763 () Bool)

(assert (=> start!98014 (= tp!83140 b_and!37763)))

(declare-fun b!1119801 () Bool)

(declare-fun e!637920 () Bool)

(declare-fun e!637923 () Bool)

(assert (=> b!1119801 (= e!637920 e!637923)))

(declare-fun res!747540 () Bool)

(assert (=> b!1119801 (=> (not res!747540) (not e!637923))))

(declare-datatypes ((array!72955 0))(
  ( (array!72956 (arr!35124 (Array (_ BitVec 32) (_ BitVec 64))) (size!35661 (_ BitVec 32))) )
))
(declare-fun lt!498017 () array!72955)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72955 (_ BitVec 32)) Bool)

(assert (=> b!1119801 (= res!747540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498017 mask!1564))))

(declare-fun _keys!1208 () array!72955)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119801 (= lt!498017 (array!72956 (store (arr!35124 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35661 _keys!1208)))))

(declare-fun b!1119802 () Bool)

(declare-fun res!747547 () Bool)

(assert (=> b!1119802 (=> (not res!747547) (not e!637923))))

(declare-datatypes ((List!24445 0))(
  ( (Nil!24442) (Cons!24441 (h!25659 (_ BitVec 64)) (t!34918 List!24445)) )
))
(declare-fun arrayNoDuplicates!0 (array!72955 (_ BitVec 32) List!24445) Bool)

(assert (=> b!1119802 (= res!747547 (arrayNoDuplicates!0 lt!498017 #b00000000000000000000000000000000 Nil!24442))))

(declare-fun mapIsEmpty!43831 () Bool)

(declare-fun mapRes!43831 () Bool)

(assert (=> mapIsEmpty!43831 mapRes!43831))

(declare-fun b!1119803 () Bool)

(declare-fun res!747549 () Bool)

(assert (=> b!1119803 (=> (not res!747549) (not e!637920))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42473 0))(
  ( (V!42474 (val!14061 Int)) )
))
(declare-datatypes ((ValueCell!13295 0))(
  ( (ValueCellFull!13295 (v!16690 V!42473)) (EmptyCell!13295) )
))
(declare-datatypes ((array!72957 0))(
  ( (array!72958 (arr!35125 (Array (_ BitVec 32) ValueCell!13295)) (size!35662 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72957)

(assert (=> b!1119803 (= res!747549 (and (= (size!35662 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35661 _keys!1208) (size!35662 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119804 () Bool)

(declare-fun res!747548 () Bool)

(assert (=> b!1119804 (=> (not res!747548) (not e!637920))))

(assert (=> b!1119804 (= res!747548 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35661 _keys!1208))))))

(declare-fun b!1119805 () Bool)

(declare-fun res!747550 () Bool)

(assert (=> b!1119805 (=> (not res!747550) (not e!637920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119805 (= res!747550 (validMask!0 mask!1564))))

(declare-fun b!1119806 () Bool)

(declare-fun res!747544 () Bool)

(assert (=> b!1119806 (=> (not res!747544) (not e!637920))))

(assert (=> b!1119806 (= res!747544 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24442))))

(declare-fun b!1119807 () Bool)

(declare-fun e!637921 () Bool)

(assert (=> b!1119807 (= e!637921 true)))

(declare-fun zeroValue!944 () V!42473)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42473)

(declare-datatypes ((tuple2!17656 0))(
  ( (tuple2!17657 (_1!8839 (_ BitVec 64)) (_2!8839 V!42473)) )
))
(declare-datatypes ((List!24446 0))(
  ( (Nil!24443) (Cons!24442 (h!25660 tuple2!17656) (t!34919 List!24446)) )
))
(declare-datatypes ((ListLongMap!15633 0))(
  ( (ListLongMap!15634 (toList!7832 List!24446)) )
))
(declare-fun lt!498018 () ListLongMap!15633)

(declare-fun getCurrentListMapNoExtraKeys!4362 (array!72955 array!72957 (_ BitVec 32) (_ BitVec 32) V!42473 V!42473 (_ BitVec 32) Int) ListLongMap!15633)

(assert (=> b!1119807 (= lt!498018 (getCurrentListMapNoExtraKeys!4362 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119808 () Bool)

(declare-fun res!747542 () Bool)

(assert (=> b!1119808 (=> (not res!747542) (not e!637920))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1119808 (= res!747542 (= (select (arr!35124 _keys!1208) i!673) k0!934))))

(declare-fun b!1119809 () Bool)

(declare-fun e!637924 () Bool)

(declare-fun e!637922 () Bool)

(assert (=> b!1119809 (= e!637924 (and e!637922 mapRes!43831))))

(declare-fun condMapEmpty!43831 () Bool)

(declare-fun mapDefault!43831 () ValueCell!13295)

(assert (=> b!1119809 (= condMapEmpty!43831 (= (arr!35125 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13295)) mapDefault!43831)))))

(declare-fun b!1119810 () Bool)

(declare-fun tp_is_empty!28009 () Bool)

(assert (=> b!1119810 (= e!637922 tp_is_empty!28009)))

(declare-fun b!1119811 () Bool)

(declare-fun res!747543 () Bool)

(assert (=> b!1119811 (=> (not res!747543) (not e!637920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119811 (= res!747543 (validKeyInArray!0 k0!934))))

(declare-fun b!1119812 () Bool)

(assert (=> b!1119812 (= e!637923 (not e!637921))))

(declare-fun res!747541 () Bool)

(assert (=> b!1119812 (=> res!747541 e!637921)))

(assert (=> b!1119812 (= res!747541 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119812 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36691 0))(
  ( (Unit!36692) )
))
(declare-fun lt!498019 () Unit!36691)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72955 (_ BitVec 64) (_ BitVec 32)) Unit!36691)

(assert (=> b!1119812 (= lt!498019 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1119813 () Bool)

(declare-fun res!747546 () Bool)

(assert (=> b!1119813 (=> (not res!747546) (not e!637920))))

(assert (=> b!1119813 (= res!747546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119814 () Bool)

(declare-fun e!637926 () Bool)

(assert (=> b!1119814 (= e!637926 tp_is_empty!28009)))

(declare-fun mapNonEmpty!43831 () Bool)

(declare-fun tp!83141 () Bool)

(assert (=> mapNonEmpty!43831 (= mapRes!43831 (and tp!83141 e!637926))))

(declare-fun mapKey!43831 () (_ BitVec 32))

(declare-fun mapRest!43831 () (Array (_ BitVec 32) ValueCell!13295))

(declare-fun mapValue!43831 () ValueCell!13295)

(assert (=> mapNonEmpty!43831 (= (arr!35125 _values!996) (store mapRest!43831 mapKey!43831 mapValue!43831))))

(declare-fun res!747545 () Bool)

(assert (=> start!98014 (=> (not res!747545) (not e!637920))))

(assert (=> start!98014 (= res!747545 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35661 _keys!1208))))))

(assert (=> start!98014 e!637920))

(assert (=> start!98014 tp_is_empty!28009))

(declare-fun array_inv!27050 (array!72955) Bool)

(assert (=> start!98014 (array_inv!27050 _keys!1208)))

(assert (=> start!98014 true))

(assert (=> start!98014 tp!83140))

(declare-fun array_inv!27051 (array!72957) Bool)

(assert (=> start!98014 (and (array_inv!27051 _values!996) e!637924)))

(assert (= (and start!98014 res!747545) b!1119805))

(assert (= (and b!1119805 res!747550) b!1119803))

(assert (= (and b!1119803 res!747549) b!1119813))

(assert (= (and b!1119813 res!747546) b!1119806))

(assert (= (and b!1119806 res!747544) b!1119804))

(assert (= (and b!1119804 res!747548) b!1119811))

(assert (= (and b!1119811 res!747543) b!1119808))

(assert (= (and b!1119808 res!747542) b!1119801))

(assert (= (and b!1119801 res!747540) b!1119802))

(assert (= (and b!1119802 res!747547) b!1119812))

(assert (= (and b!1119812 (not res!747541)) b!1119807))

(assert (= (and b!1119809 condMapEmpty!43831) mapIsEmpty!43831))

(assert (= (and b!1119809 (not condMapEmpty!43831)) mapNonEmpty!43831))

(get-info :version)

(assert (= (and mapNonEmpty!43831 ((_ is ValueCellFull!13295) mapValue!43831)) b!1119814))

(assert (= (and b!1119809 ((_ is ValueCellFull!13295) mapDefault!43831)) b!1119810))

(assert (= start!98014 b!1119809))

(declare-fun m!1035675 () Bool)

(assert (=> b!1119807 m!1035675))

(declare-fun m!1035677 () Bool)

(assert (=> b!1119808 m!1035677))

(declare-fun m!1035679 () Bool)

(assert (=> b!1119805 m!1035679))

(declare-fun m!1035681 () Bool)

(assert (=> mapNonEmpty!43831 m!1035681))

(declare-fun m!1035683 () Bool)

(assert (=> b!1119812 m!1035683))

(declare-fun m!1035685 () Bool)

(assert (=> b!1119812 m!1035685))

(declare-fun m!1035687 () Bool)

(assert (=> b!1119801 m!1035687))

(declare-fun m!1035689 () Bool)

(assert (=> b!1119801 m!1035689))

(declare-fun m!1035691 () Bool)

(assert (=> b!1119802 m!1035691))

(declare-fun m!1035693 () Bool)

(assert (=> start!98014 m!1035693))

(declare-fun m!1035695 () Bool)

(assert (=> start!98014 m!1035695))

(declare-fun m!1035697 () Bool)

(assert (=> b!1119813 m!1035697))

(declare-fun m!1035699 () Bool)

(assert (=> b!1119811 m!1035699))

(declare-fun m!1035701 () Bool)

(assert (=> b!1119806 m!1035701))

(check-sat (not b!1119811) b_and!37763 (not b!1119802) (not b!1119801) tp_is_empty!28009 (not start!98014) (not mapNonEmpty!43831) (not b!1119805) (not b!1119806) (not b!1119807) (not b!1119813) (not b_next!23479) (not b!1119812))
(check-sat b_and!37763 (not b_next!23479))
