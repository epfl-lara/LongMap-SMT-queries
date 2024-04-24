; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97678 () Bool)

(assert start!97678)

(declare-fun b_free!23413 () Bool)

(declare-fun b_next!23413 () Bool)

(assert (=> start!97678 (= b_free!23413 (not b_next!23413))))

(declare-fun tp!82538 () Bool)

(declare-fun b_and!37673 () Bool)

(assert (=> start!97678 (= tp!82538 b_and!37673)))

(declare-fun b!1113058 () Bool)

(declare-fun res!742407 () Bool)

(declare-fun e!634765 () Bool)

(assert (=> b!1113058 (=> (not res!742407) (not e!634765))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1113058 (= res!742407 (validMask!0 mask!1564))))

(declare-fun b!1113059 () Bool)

(declare-fun e!634763 () Bool)

(declare-fun e!634769 () Bool)

(declare-fun mapRes!43327 () Bool)

(assert (=> b!1113059 (= e!634763 (and e!634769 mapRes!43327))))

(declare-fun condMapEmpty!43327 () Bool)

(declare-datatypes ((V!42025 0))(
  ( (V!42026 (val!13893 Int)) )
))
(declare-datatypes ((ValueCell!13127 0))(
  ( (ValueCellFull!13127 (v!16522 V!42025)) (EmptyCell!13127) )
))
(declare-datatypes ((array!72297 0))(
  ( (array!72298 (arr!34795 (Array (_ BitVec 32) ValueCell!13127)) (size!35332 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72297)

(declare-fun mapDefault!43327 () ValueCell!13127)

(assert (=> b!1113059 (= condMapEmpty!43327 (= (arr!34795 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13127)) mapDefault!43327)))))

(declare-fun b!1113060 () Bool)

(declare-fun e!634764 () Bool)

(declare-datatypes ((tuple2!17602 0))(
  ( (tuple2!17603 (_1!8812 (_ BitVec 64)) (_2!8812 V!42025)) )
))
(declare-datatypes ((List!24283 0))(
  ( (Nil!24280) (Cons!24279 (h!25497 tuple2!17602) (t!34734 List!24283)) )
))
(declare-datatypes ((ListLongMap!15579 0))(
  ( (ListLongMap!15580 (toList!7805 List!24283)) )
))
(declare-fun call!47003 () ListLongMap!15579)

(declare-fun call!47002 () ListLongMap!15579)

(assert (=> b!1113060 (= e!634764 (= call!47003 call!47002))))

(declare-fun b!1113061 () Bool)

(declare-fun e!634766 () Bool)

(assert (=> b!1113061 (= e!634765 e!634766)))

(declare-fun res!742403 () Bool)

(assert (=> b!1113061 (=> (not res!742403) (not e!634766))))

(declare-datatypes ((array!72299 0))(
  ( (array!72300 (arr!34796 (Array (_ BitVec 32) (_ BitVec 64))) (size!35333 (_ BitVec 32))) )
))
(declare-fun lt!496910 () array!72299)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72299 (_ BitVec 32)) Bool)

(assert (=> b!1113061 (= res!742403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496910 mask!1564))))

(declare-fun _keys!1208 () array!72299)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1113061 (= lt!496910 (array!72300 (store (arr!34796 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35333 _keys!1208)))))

(declare-fun b!1113062 () Bool)

(declare-fun res!742410 () Bool)

(assert (=> b!1113062 (=> (not res!742410) (not e!634765))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1113062 (= res!742410 (validKeyInArray!0 k0!934))))

(declare-fun b!1113063 () Bool)

(declare-fun -!1053 (ListLongMap!15579 (_ BitVec 64)) ListLongMap!15579)

(assert (=> b!1113063 (= e!634764 (= call!47003 (-!1053 call!47002 k0!934)))))

(declare-fun b!1113064 () Bool)

(declare-fun e!634770 () Bool)

(assert (=> b!1113064 (= e!634766 (not e!634770))))

(declare-fun res!742405 () Bool)

(assert (=> b!1113064 (=> res!742405 e!634770)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1113064 (= res!742405 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35333 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1113064 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36457 0))(
  ( (Unit!36458) )
))
(declare-fun lt!496912 () Unit!36457)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72299 (_ BitVec 64) (_ BitVec 32)) Unit!36457)

(assert (=> b!1113064 (= lt!496912 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1113065 () Bool)

(declare-fun res!742401 () Bool)

(assert (=> b!1113065 (=> (not res!742401) (not e!634765))))

(assert (=> b!1113065 (= res!742401 (= (select (arr!34796 _keys!1208) i!673) k0!934))))

(declare-fun b!1113066 () Bool)

(declare-fun res!742402 () Bool)

(assert (=> b!1113066 (=> (not res!742402) (not e!634765))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1113066 (= res!742402 (and (= (size!35332 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35333 _keys!1208) (size!35332 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113067 () Bool)

(declare-fun tp_is_empty!27673 () Bool)

(assert (=> b!1113067 (= e!634769 tp_is_empty!27673)))

(declare-fun b!1113068 () Bool)

(declare-fun res!742406 () Bool)

(assert (=> b!1113068 (=> (not res!742406) (not e!634765))))

(declare-datatypes ((List!24284 0))(
  ( (Nil!24281) (Cons!24280 (h!25498 (_ BitVec 64)) (t!34735 List!24284)) )
))
(declare-fun arrayNoDuplicates!0 (array!72299 (_ BitVec 32) List!24284) Bool)

(assert (=> b!1113068 (= res!742406 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24281))))

(declare-fun b!1113069 () Bool)

(declare-fun e!634767 () Bool)

(assert (=> b!1113069 (= e!634767 tp_is_empty!27673)))

(declare-fun b!1113070 () Bool)

(declare-fun res!742404 () Bool)

(assert (=> b!1113070 (=> (not res!742404) (not e!634765))))

(assert (=> b!1113070 (= res!742404 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35333 _keys!1208))))))

(declare-fun b!1113071 () Bool)

(declare-fun res!742411 () Bool)

(assert (=> b!1113071 (=> (not res!742411) (not e!634766))))

(assert (=> b!1113071 (= res!742411 (arrayNoDuplicates!0 lt!496910 #b00000000000000000000000000000000 Nil!24281))))

(declare-fun zeroValue!944 () V!42025)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46999 () Bool)

(declare-fun minValue!944 () V!42025)

(declare-fun getCurrentListMapNoExtraKeys!4336 (array!72299 array!72297 (_ BitVec 32) (_ BitVec 32) V!42025 V!42025 (_ BitVec 32) Int) ListLongMap!15579)

(declare-fun dynLambda!2446 (Int (_ BitVec 64)) V!42025)

(assert (=> bm!46999 (= call!47003 (getCurrentListMapNoExtraKeys!4336 lt!496910 (array!72298 (store (arr!34795 _values!996) i!673 (ValueCellFull!13127 (dynLambda!2446 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35332 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47000 () Bool)

(assert (=> bm!47000 (= call!47002 (getCurrentListMapNoExtraKeys!4336 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!742408 () Bool)

(assert (=> start!97678 (=> (not res!742408) (not e!634765))))

(assert (=> start!97678 (= res!742408 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35333 _keys!1208))))))

(assert (=> start!97678 e!634765))

(assert (=> start!97678 tp_is_empty!27673))

(declare-fun array_inv!26810 (array!72299) Bool)

(assert (=> start!97678 (array_inv!26810 _keys!1208)))

(assert (=> start!97678 true))

(assert (=> start!97678 tp!82538))

(declare-fun array_inv!26811 (array!72297) Bool)

(assert (=> start!97678 (and (array_inv!26811 _values!996) e!634763)))

(declare-fun b!1113072 () Bool)

(assert (=> b!1113072 (= e!634770 true)))

(assert (=> b!1113072 e!634764))

(declare-fun c!109727 () Bool)

(assert (=> b!1113072 (= c!109727 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496911 () Unit!36457)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!316 (array!72299 array!72297 (_ BitVec 32) (_ BitVec 32) V!42025 V!42025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36457)

(assert (=> b!1113072 (= lt!496911 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!316 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1113073 () Bool)

(declare-fun res!742409 () Bool)

(assert (=> b!1113073 (=> (not res!742409) (not e!634765))))

(assert (=> b!1113073 (= res!742409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43327 () Bool)

(assert (=> mapIsEmpty!43327 mapRes!43327))

(declare-fun mapNonEmpty!43327 () Bool)

(declare-fun tp!82537 () Bool)

(assert (=> mapNonEmpty!43327 (= mapRes!43327 (and tp!82537 e!634767))))

(declare-fun mapKey!43327 () (_ BitVec 32))

(declare-fun mapValue!43327 () ValueCell!13127)

(declare-fun mapRest!43327 () (Array (_ BitVec 32) ValueCell!13127))

(assert (=> mapNonEmpty!43327 (= (arr!34795 _values!996) (store mapRest!43327 mapKey!43327 mapValue!43327))))

(assert (= (and start!97678 res!742408) b!1113058))

(assert (= (and b!1113058 res!742407) b!1113066))

(assert (= (and b!1113066 res!742402) b!1113073))

(assert (= (and b!1113073 res!742409) b!1113068))

(assert (= (and b!1113068 res!742406) b!1113070))

(assert (= (and b!1113070 res!742404) b!1113062))

(assert (= (and b!1113062 res!742410) b!1113065))

(assert (= (and b!1113065 res!742401) b!1113061))

(assert (= (and b!1113061 res!742403) b!1113071))

(assert (= (and b!1113071 res!742411) b!1113064))

(assert (= (and b!1113064 (not res!742405)) b!1113072))

(assert (= (and b!1113072 c!109727) b!1113063))

(assert (= (and b!1113072 (not c!109727)) b!1113060))

(assert (= (or b!1113063 b!1113060) bm!47000))

(assert (= (or b!1113063 b!1113060) bm!46999))

(assert (= (and b!1113059 condMapEmpty!43327) mapIsEmpty!43327))

(assert (= (and b!1113059 (not condMapEmpty!43327)) mapNonEmpty!43327))

(get-info :version)

(assert (= (and mapNonEmpty!43327 ((_ is ValueCellFull!13127) mapValue!43327)) b!1113069))

(assert (= (and b!1113059 ((_ is ValueCellFull!13127) mapDefault!43327)) b!1113067))

(assert (= start!97678 b!1113059))

(declare-fun b_lambda!18447 () Bool)

(assert (=> (not b_lambda!18447) (not bm!46999)))

(declare-fun t!34733 () Bool)

(declare-fun tb!8271 () Bool)

(assert (=> (and start!97678 (= defaultEntry!1004 defaultEntry!1004) t!34733) tb!8271))

(declare-fun result!17111 () Bool)

(assert (=> tb!8271 (= result!17111 tp_is_empty!27673)))

(assert (=> bm!46999 t!34733))

(declare-fun b_and!37675 () Bool)

(assert (= b_and!37673 (and (=> t!34733 result!17111) b_and!37675)))

(declare-fun m!1031121 () Bool)

(assert (=> bm!46999 m!1031121))

(declare-fun m!1031123 () Bool)

(assert (=> bm!46999 m!1031123))

(declare-fun m!1031125 () Bool)

(assert (=> bm!46999 m!1031125))

(declare-fun m!1031127 () Bool)

(assert (=> b!1113073 m!1031127))

(declare-fun m!1031129 () Bool)

(assert (=> b!1113063 m!1031129))

(declare-fun m!1031131 () Bool)

(assert (=> b!1113058 m!1031131))

(declare-fun m!1031133 () Bool)

(assert (=> b!1113071 m!1031133))

(declare-fun m!1031135 () Bool)

(assert (=> b!1113061 m!1031135))

(declare-fun m!1031137 () Bool)

(assert (=> b!1113061 m!1031137))

(declare-fun m!1031139 () Bool)

(assert (=> bm!47000 m!1031139))

(declare-fun m!1031141 () Bool)

(assert (=> b!1113068 m!1031141))

(declare-fun m!1031143 () Bool)

(assert (=> b!1113064 m!1031143))

(declare-fun m!1031145 () Bool)

(assert (=> b!1113064 m!1031145))

(declare-fun m!1031147 () Bool)

(assert (=> b!1113072 m!1031147))

(declare-fun m!1031149 () Bool)

(assert (=> b!1113062 m!1031149))

(declare-fun m!1031151 () Bool)

(assert (=> mapNonEmpty!43327 m!1031151))

(declare-fun m!1031153 () Bool)

(assert (=> start!97678 m!1031153))

(declare-fun m!1031155 () Bool)

(assert (=> start!97678 m!1031155))

(declare-fun m!1031157 () Bool)

(assert (=> b!1113065 m!1031157))

(check-sat (not bm!46999) (not b!1113062) b_and!37675 (not b!1113064) (not b!1113068) (not start!97678) (not b!1113058) (not b_next!23413) (not b!1113061) tp_is_empty!27673 (not bm!47000) (not b!1113073) (not b!1113072) (not b!1113071) (not b!1113063) (not mapNonEmpty!43327) (not b_lambda!18447))
(check-sat b_and!37675 (not b_next!23413))
