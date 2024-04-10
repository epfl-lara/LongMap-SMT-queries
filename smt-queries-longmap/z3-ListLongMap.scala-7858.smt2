; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97894 () Bool)

(assert start!97894)

(declare-fun b_free!23595 () Bool)

(declare-fun b_next!23595 () Bool)

(assert (=> start!97894 (= b_free!23595 (not b_next!23595))))

(declare-fun tp!83489 () Bool)

(declare-fun b_and!37973 () Bool)

(assert (=> start!97894 (= tp!83489 b_and!37973)))

(declare-datatypes ((V!42627 0))(
  ( (V!42628 (val!14119 Int)) )
))
(declare-datatypes ((tuple2!17720 0))(
  ( (tuple2!17721 (_1!8871 (_ BitVec 64)) (_2!8871 V!42627)) )
))
(declare-datatypes ((List!24504 0))(
  ( (Nil!24501) (Cons!24500 (h!25709 tuple2!17720) (t!35091 List!24504)) )
))
(declare-datatypes ((ListLongMap!15689 0))(
  ( (ListLongMap!15690 (toList!7860 List!24504)) )
))
(declare-fun call!47067 () ListLongMap!15689)

(declare-fun b!1121110 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!47068 () ListLongMap!15689)

(declare-fun e!638348 () Bool)

(declare-fun -!1072 (ListLongMap!15689 (_ BitVec 64)) ListLongMap!15689)

(assert (=> b!1121110 (= e!638348 (= call!47068 (-!1072 call!47067 k0!934)))))

(declare-fun zeroValue!944 () V!42627)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!47064 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13353 0))(
  ( (ValueCellFull!13353 (v!16752 V!42627)) (EmptyCell!13353) )
))
(declare-datatypes ((array!73131 0))(
  ( (array!73132 (arr!35218 (Array (_ BitVec 32) ValueCell!13353)) (size!35754 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73131)

(declare-fun minValue!944 () V!42627)

(declare-datatypes ((array!73133 0))(
  ( (array!73134 (arr!35219 (Array (_ BitVec 32) (_ BitVec 64))) (size!35755 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73133)

(declare-fun getCurrentListMapNoExtraKeys!4349 (array!73133 array!73131 (_ BitVec 32) (_ BitVec 32) V!42627 V!42627 (_ BitVec 32) Int) ListLongMap!15689)

(assert (=> bm!47064 (= call!47067 (getCurrentListMapNoExtraKeys!4349 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121112 () Bool)

(declare-fun res!748969 () Bool)

(declare-fun e!638349 () Bool)

(assert (=> b!1121112 (=> (not res!748969) (not e!638349))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121112 (= res!748969 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35755 _keys!1208))))))

(declare-fun lt!498248 () array!73133)

(declare-fun lt!498247 () array!73131)

(declare-fun bm!47065 () Bool)

(assert (=> bm!47065 (= call!47068 (getCurrentListMapNoExtraKeys!4349 lt!498248 lt!498247 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121113 () Bool)

(declare-fun e!638347 () Bool)

(declare-fun tp_is_empty!28125 () Bool)

(assert (=> b!1121113 (= e!638347 tp_is_empty!28125)))

(declare-fun b!1121114 () Bool)

(declare-fun res!748975 () Bool)

(declare-fun e!638352 () Bool)

(assert (=> b!1121114 (=> (not res!748975) (not e!638352))))

(declare-datatypes ((List!24505 0))(
  ( (Nil!24502) (Cons!24501 (h!25710 (_ BitVec 64)) (t!35092 List!24505)) )
))
(declare-fun arrayNoDuplicates!0 (array!73133 (_ BitVec 32) List!24505) Bool)

(assert (=> b!1121114 (= res!748975 (arrayNoDuplicates!0 lt!498248 #b00000000000000000000000000000000 Nil!24502))))

(declare-fun b!1121115 () Bool)

(declare-fun res!748964 () Bool)

(assert (=> b!1121115 (=> (not res!748964) (not e!638349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73133 (_ BitVec 32)) Bool)

(assert (=> b!1121115 (= res!748964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44005 () Bool)

(declare-fun mapRes!44005 () Bool)

(assert (=> mapIsEmpty!44005 mapRes!44005))

(declare-fun b!1121116 () Bool)

(assert (=> b!1121116 (= e!638348 (= call!47068 call!47067))))

(declare-fun b!1121117 () Bool)

(declare-fun e!638350 () Bool)

(assert (=> b!1121117 (= e!638350 tp_is_empty!28125)))

(declare-fun b!1121118 () Bool)

(assert (=> b!1121118 (= e!638349 e!638352)))

(declare-fun res!748972 () Bool)

(assert (=> b!1121118 (=> (not res!748972) (not e!638352))))

(assert (=> b!1121118 (= res!748972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498248 mask!1564))))

(assert (=> b!1121118 (= lt!498248 (array!73134 (store (arr!35219 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35755 _keys!1208)))))

(declare-fun b!1121119 () Bool)

(declare-fun res!748971 () Bool)

(assert (=> b!1121119 (=> (not res!748971) (not e!638349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121119 (= res!748971 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!44005 () Bool)

(declare-fun tp!83488 () Bool)

(assert (=> mapNonEmpty!44005 (= mapRes!44005 (and tp!83488 e!638347))))

(declare-fun mapKey!44005 () (_ BitVec 32))

(declare-fun mapRest!44005 () (Array (_ BitVec 32) ValueCell!13353))

(declare-fun mapValue!44005 () ValueCell!13353)

(assert (=> mapNonEmpty!44005 (= (arr!35218 _values!996) (store mapRest!44005 mapKey!44005 mapValue!44005))))

(declare-fun b!1121120 () Bool)

(declare-fun e!638353 () Bool)

(assert (=> b!1121120 (= e!638352 (not e!638353))))

(declare-fun res!748973 () Bool)

(assert (=> b!1121120 (=> res!748973 e!638353)))

(assert (=> b!1121120 (= res!748973 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121120 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36782 0))(
  ( (Unit!36783) )
))
(declare-fun lt!498246 () Unit!36782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73133 (_ BitVec 64) (_ BitVec 32)) Unit!36782)

(assert (=> b!1121120 (= lt!498246 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121121 () Bool)

(declare-fun e!638351 () Bool)

(assert (=> b!1121121 (= e!638351 true)))

(assert (=> b!1121121 e!638348))

(declare-fun c!109383 () Bool)

(assert (=> b!1121121 (= c!109383 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498249 () Unit!36782)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!320 (array!73133 array!73131 (_ BitVec 32) (_ BitVec 32) V!42627 V!42627 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36782)

(assert (=> b!1121121 (= lt!498249 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!320 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121122 () Bool)

(declare-fun res!748965 () Bool)

(assert (=> b!1121122 (=> (not res!748965) (not e!638349))))

(assert (=> b!1121122 (= res!748965 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24502))))

(declare-fun res!748967 () Bool)

(assert (=> start!97894 (=> (not res!748967) (not e!638349))))

(assert (=> start!97894 (= res!748967 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35755 _keys!1208))))))

(assert (=> start!97894 e!638349))

(assert (=> start!97894 tp_is_empty!28125))

(declare-fun array_inv!27050 (array!73133) Bool)

(assert (=> start!97894 (array_inv!27050 _keys!1208)))

(assert (=> start!97894 true))

(assert (=> start!97894 tp!83489))

(declare-fun e!638354 () Bool)

(declare-fun array_inv!27051 (array!73131) Bool)

(assert (=> start!97894 (and (array_inv!27051 _values!996) e!638354)))

(declare-fun b!1121111 () Bool)

(declare-fun res!748966 () Bool)

(assert (=> b!1121111 (=> (not res!748966) (not e!638349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121111 (= res!748966 (validKeyInArray!0 k0!934))))

(declare-fun b!1121123 () Bool)

(assert (=> b!1121123 (= e!638353 e!638351)))

(declare-fun res!748970 () Bool)

(assert (=> b!1121123 (=> res!748970 e!638351)))

(assert (=> b!1121123 (= res!748970 (not (= from!1455 i!673)))))

(declare-fun lt!498251 () ListLongMap!15689)

(assert (=> b!1121123 (= lt!498251 (getCurrentListMapNoExtraKeys!4349 lt!498248 lt!498247 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2451 (Int (_ BitVec 64)) V!42627)

(assert (=> b!1121123 (= lt!498247 (array!73132 (store (arr!35218 _values!996) i!673 (ValueCellFull!13353 (dynLambda!2451 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35754 _values!996)))))

(declare-fun lt!498250 () ListLongMap!15689)

(assert (=> b!1121123 (= lt!498250 (getCurrentListMapNoExtraKeys!4349 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121124 () Bool)

(assert (=> b!1121124 (= e!638354 (and e!638350 mapRes!44005))))

(declare-fun condMapEmpty!44005 () Bool)

(declare-fun mapDefault!44005 () ValueCell!13353)

(assert (=> b!1121124 (= condMapEmpty!44005 (= (arr!35218 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13353)) mapDefault!44005)))))

(declare-fun b!1121125 () Bool)

(declare-fun res!748974 () Bool)

(assert (=> b!1121125 (=> (not res!748974) (not e!638349))))

(assert (=> b!1121125 (= res!748974 (= (select (arr!35219 _keys!1208) i!673) k0!934))))

(declare-fun b!1121126 () Bool)

(declare-fun res!748968 () Bool)

(assert (=> b!1121126 (=> (not res!748968) (not e!638349))))

(assert (=> b!1121126 (= res!748968 (and (= (size!35754 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35755 _keys!1208) (size!35754 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97894 res!748967) b!1121119))

(assert (= (and b!1121119 res!748971) b!1121126))

(assert (= (and b!1121126 res!748968) b!1121115))

(assert (= (and b!1121115 res!748964) b!1121122))

(assert (= (and b!1121122 res!748965) b!1121112))

(assert (= (and b!1121112 res!748969) b!1121111))

(assert (= (and b!1121111 res!748966) b!1121125))

(assert (= (and b!1121125 res!748974) b!1121118))

(assert (= (and b!1121118 res!748972) b!1121114))

(assert (= (and b!1121114 res!748975) b!1121120))

(assert (= (and b!1121120 (not res!748973)) b!1121123))

(assert (= (and b!1121123 (not res!748970)) b!1121121))

(assert (= (and b!1121121 c!109383) b!1121110))

(assert (= (and b!1121121 (not c!109383)) b!1121116))

(assert (= (or b!1121110 b!1121116) bm!47065))

(assert (= (or b!1121110 b!1121116) bm!47064))

(assert (= (and b!1121124 condMapEmpty!44005) mapIsEmpty!44005))

(assert (= (and b!1121124 (not condMapEmpty!44005)) mapNonEmpty!44005))

(get-info :version)

(assert (= (and mapNonEmpty!44005 ((_ is ValueCellFull!13353) mapValue!44005)) b!1121113))

(assert (= (and b!1121124 ((_ is ValueCellFull!13353) mapDefault!44005)) b!1121117))

(assert (= start!97894 b!1121124))

(declare-fun b_lambda!18565 () Bool)

(assert (=> (not b_lambda!18565) (not b!1121123)))

(declare-fun t!35090 () Bool)

(declare-fun tb!8407 () Bool)

(assert (=> (and start!97894 (= defaultEntry!1004 defaultEntry!1004) t!35090) tb!8407))

(declare-fun result!17375 () Bool)

(assert (=> tb!8407 (= result!17375 tp_is_empty!28125)))

(assert (=> b!1121123 t!35090))

(declare-fun b_and!37975 () Bool)

(assert (= b_and!37973 (and (=> t!35090 result!17375) b_and!37975)))

(declare-fun m!1036019 () Bool)

(assert (=> b!1121118 m!1036019))

(declare-fun m!1036021 () Bool)

(assert (=> b!1121118 m!1036021))

(declare-fun m!1036023 () Bool)

(assert (=> b!1121123 m!1036023))

(declare-fun m!1036025 () Bool)

(assert (=> b!1121123 m!1036025))

(declare-fun m!1036027 () Bool)

(assert (=> b!1121123 m!1036027))

(declare-fun m!1036029 () Bool)

(assert (=> b!1121123 m!1036029))

(declare-fun m!1036031 () Bool)

(assert (=> b!1121115 m!1036031))

(declare-fun m!1036033 () Bool)

(assert (=> b!1121119 m!1036033))

(declare-fun m!1036035 () Bool)

(assert (=> bm!47065 m!1036035))

(declare-fun m!1036037 () Bool)

(assert (=> b!1121122 m!1036037))

(declare-fun m!1036039 () Bool)

(assert (=> b!1121125 m!1036039))

(declare-fun m!1036041 () Bool)

(assert (=> bm!47064 m!1036041))

(declare-fun m!1036043 () Bool)

(assert (=> b!1121111 m!1036043))

(declare-fun m!1036045 () Bool)

(assert (=> b!1121110 m!1036045))

(declare-fun m!1036047 () Bool)

(assert (=> b!1121121 m!1036047))

(declare-fun m!1036049 () Bool)

(assert (=> start!97894 m!1036049))

(declare-fun m!1036051 () Bool)

(assert (=> start!97894 m!1036051))

(declare-fun m!1036053 () Bool)

(assert (=> b!1121120 m!1036053))

(declare-fun m!1036055 () Bool)

(assert (=> b!1121120 m!1036055))

(declare-fun m!1036057 () Bool)

(assert (=> mapNonEmpty!44005 m!1036057))

(declare-fun m!1036059 () Bool)

(assert (=> b!1121114 m!1036059))

(check-sat (not b!1121115) (not b!1121121) (not b!1121123) (not b!1121110) (not start!97894) (not b!1121111) (not b!1121120) (not b!1121118) (not b_next!23595) (not b!1121119) (not mapNonEmpty!44005) tp_is_empty!28125 b_and!37975 (not b_lambda!18565) (not b!1121122) (not b!1121114) (not bm!47065) (not bm!47064))
(check-sat b_and!37975 (not b_next!23595))
