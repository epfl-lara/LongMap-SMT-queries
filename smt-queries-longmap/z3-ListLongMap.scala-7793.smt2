; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97496 () Bool)

(assert start!97496)

(declare-fun b!1112898 () Bool)

(declare-fun res!742745 () Bool)

(declare-fun e!634440 () Bool)

(assert (=> b!1112898 (=> (not res!742745) (not e!634440))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112898 (= res!742745 (validKeyInArray!0 k0!934))))

(declare-fun b!1112899 () Bool)

(declare-fun res!742747 () Bool)

(declare-fun e!634438 () Bool)

(assert (=> b!1112899 (=> (not res!742747) (not e!634438))))

(declare-datatypes ((array!72274 0))(
  ( (array!72275 (arr!34790 (Array (_ BitVec 32) (_ BitVec 64))) (size!35328 (_ BitVec 32))) )
))
(declare-fun lt!496410 () array!72274)

(declare-datatypes ((List!24333 0))(
  ( (Nil!24330) (Cons!24329 (h!25538 (_ BitVec 64)) (t!34805 List!24333)) )
))
(declare-fun arrayNoDuplicates!0 (array!72274 (_ BitVec 32) List!24333) Bool)

(assert (=> b!1112899 (= res!742747 (arrayNoDuplicates!0 lt!496410 #b00000000000000000000000000000000 Nil!24330))))

(declare-fun b!1112900 () Bool)

(assert (=> b!1112900 (= e!634438 (not true))))

(declare-fun _keys!1208 () array!72274)

(declare-fun arrayContainsKey!0 (array!72274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112900 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36345 0))(
  ( (Unit!36346) )
))
(declare-fun lt!496409 () Unit!36345)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72274 (_ BitVec 64) (_ BitVec 32)) Unit!36345)

(assert (=> b!1112900 (= lt!496409 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!742746 () Bool)

(assert (=> start!97496 (=> (not res!742746) (not e!634440))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97496 (= res!742746 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35328 _keys!1208))))))

(assert (=> start!97496 e!634440))

(declare-fun array_inv!26824 (array!72274) Bool)

(assert (=> start!97496 (array_inv!26824 _keys!1208)))

(assert (=> start!97496 true))

(declare-datatypes ((V!42105 0))(
  ( (V!42106 (val!13923 Int)) )
))
(declare-datatypes ((ValueCell!13157 0))(
  ( (ValueCellFull!13157 (v!16555 V!42105)) (EmptyCell!13157) )
))
(declare-datatypes ((array!72276 0))(
  ( (array!72277 (arr!34791 (Array (_ BitVec 32) ValueCell!13157)) (size!35329 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72276)

(declare-fun e!634437 () Bool)

(declare-fun array_inv!26825 (array!72276) Bool)

(assert (=> start!97496 (and (array_inv!26825 _values!996) e!634437)))

(declare-fun b!1112901 () Bool)

(declare-fun res!742744 () Bool)

(assert (=> b!1112901 (=> (not res!742744) (not e!634440))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1112901 (= res!742744 (and (= (size!35329 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35328 _keys!1208) (size!35329 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43417 () Bool)

(declare-fun mapRes!43417 () Bool)

(declare-fun tp!82661 () Bool)

(declare-fun e!634439 () Bool)

(assert (=> mapNonEmpty!43417 (= mapRes!43417 (and tp!82661 e!634439))))

(declare-fun mapRest!43417 () (Array (_ BitVec 32) ValueCell!13157))

(declare-fun mapValue!43417 () ValueCell!13157)

(declare-fun mapKey!43417 () (_ BitVec 32))

(assert (=> mapNonEmpty!43417 (= (arr!34791 _values!996) (store mapRest!43417 mapKey!43417 mapValue!43417))))

(declare-fun b!1112902 () Bool)

(assert (=> b!1112902 (= e!634440 e!634438)))

(declare-fun res!742750 () Bool)

(assert (=> b!1112902 (=> (not res!742750) (not e!634438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72274 (_ BitVec 32)) Bool)

(assert (=> b!1112902 (= res!742750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496410 mask!1564))))

(assert (=> b!1112902 (= lt!496410 (array!72275 (store (arr!34790 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35328 _keys!1208)))))

(declare-fun b!1112903 () Bool)

(declare-fun res!742753 () Bool)

(assert (=> b!1112903 (=> (not res!742753) (not e!634440))))

(assert (=> b!1112903 (= res!742753 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24330))))

(declare-fun b!1112904 () Bool)

(declare-fun e!634436 () Bool)

(declare-fun tp_is_empty!27733 () Bool)

(assert (=> b!1112904 (= e!634436 tp_is_empty!27733)))

(declare-fun b!1112905 () Bool)

(assert (=> b!1112905 (= e!634439 tp_is_empty!27733)))

(declare-fun b!1112906 () Bool)

(declare-fun res!742752 () Bool)

(assert (=> b!1112906 (=> (not res!742752) (not e!634440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112906 (= res!742752 (validMask!0 mask!1564))))

(declare-fun b!1112907 () Bool)

(declare-fun res!742748 () Bool)

(assert (=> b!1112907 (=> (not res!742748) (not e!634440))))

(assert (=> b!1112907 (= res!742748 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35328 _keys!1208))))))

(declare-fun b!1112908 () Bool)

(assert (=> b!1112908 (= e!634437 (and e!634436 mapRes!43417))))

(declare-fun condMapEmpty!43417 () Bool)

(declare-fun mapDefault!43417 () ValueCell!13157)

(assert (=> b!1112908 (= condMapEmpty!43417 (= (arr!34791 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13157)) mapDefault!43417)))))

(declare-fun mapIsEmpty!43417 () Bool)

(assert (=> mapIsEmpty!43417 mapRes!43417))

(declare-fun b!1112909 () Bool)

(declare-fun res!742749 () Bool)

(assert (=> b!1112909 (=> (not res!742749) (not e!634440))))

(assert (=> b!1112909 (= res!742749 (= (select (arr!34790 _keys!1208) i!673) k0!934))))

(declare-fun b!1112910 () Bool)

(declare-fun res!742751 () Bool)

(assert (=> b!1112910 (=> (not res!742751) (not e!634440))))

(assert (=> b!1112910 (= res!742751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97496 res!742746) b!1112906))

(assert (= (and b!1112906 res!742752) b!1112901))

(assert (= (and b!1112901 res!742744) b!1112910))

(assert (= (and b!1112910 res!742751) b!1112903))

(assert (= (and b!1112903 res!742753) b!1112907))

(assert (= (and b!1112907 res!742748) b!1112898))

(assert (= (and b!1112898 res!742745) b!1112909))

(assert (= (and b!1112909 res!742749) b!1112902))

(assert (= (and b!1112902 res!742750) b!1112899))

(assert (= (and b!1112899 res!742747) b!1112900))

(assert (= (and b!1112908 condMapEmpty!43417) mapIsEmpty!43417))

(assert (= (and b!1112908 (not condMapEmpty!43417)) mapNonEmpty!43417))

(get-info :version)

(assert (= (and mapNonEmpty!43417 ((_ is ValueCellFull!13157) mapValue!43417)) b!1112905))

(assert (= (and b!1112908 ((_ is ValueCellFull!13157) mapDefault!43417)) b!1112904))

(assert (= start!97496 b!1112908))

(declare-fun m!1029747 () Bool)

(assert (=> b!1112910 m!1029747))

(declare-fun m!1029749 () Bool)

(assert (=> b!1112898 m!1029749))

(declare-fun m!1029751 () Bool)

(assert (=> b!1112903 m!1029751))

(declare-fun m!1029753 () Bool)

(assert (=> b!1112900 m!1029753))

(declare-fun m!1029755 () Bool)

(assert (=> b!1112900 m!1029755))

(declare-fun m!1029757 () Bool)

(assert (=> b!1112906 m!1029757))

(declare-fun m!1029759 () Bool)

(assert (=> b!1112899 m!1029759))

(declare-fun m!1029761 () Bool)

(assert (=> mapNonEmpty!43417 m!1029761))

(declare-fun m!1029763 () Bool)

(assert (=> start!97496 m!1029763))

(declare-fun m!1029765 () Bool)

(assert (=> start!97496 m!1029765))

(declare-fun m!1029767 () Bool)

(assert (=> b!1112909 m!1029767))

(declare-fun m!1029769 () Bool)

(assert (=> b!1112902 m!1029769))

(declare-fun m!1029771 () Bool)

(assert (=> b!1112902 m!1029771))

(check-sat (not mapNonEmpty!43417) (not b!1112906) (not b!1112902) (not b!1112900) (not b!1112899) (not b!1112910) (not start!97496) tp_is_empty!27733 (not b!1112898) (not b!1112903))
(check-sat)
