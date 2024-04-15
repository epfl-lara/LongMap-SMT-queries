; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97898 () Bool)

(assert start!97898)

(declare-fun b_free!23605 () Bool)

(declare-fun b_next!23605 () Bool)

(assert (=> start!97898 (= b_free!23605 (not b_next!23605))))

(declare-fun tp!83518 () Bool)

(declare-fun b_and!37971 () Bool)

(assert (=> start!97898 (= tp!83518 b_and!37971)))

(declare-fun b!1121246 () Bool)

(declare-fun e!638404 () Bool)

(declare-fun e!638402 () Bool)

(assert (=> b!1121246 (= e!638404 (not e!638402))))

(declare-fun res!749077 () Bool)

(assert (=> b!1121246 (=> res!749077 e!638402)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121246 (= res!749077 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73064 0))(
  ( (array!73065 (arr!35185 (Array (_ BitVec 32) (_ BitVec 64))) (size!35723 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73064)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121246 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36621 0))(
  ( (Unit!36622) )
))
(declare-fun lt!498137 () Unit!36621)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73064 (_ BitVec 64) (_ BitVec 32)) Unit!36621)

(assert (=> b!1121246 (= lt!498137 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121247 () Bool)

(declare-fun res!749079 () Bool)

(declare-fun e!638406 () Bool)

(assert (=> b!1121247 (=> (not res!749079) (not e!638406))))

(declare-datatypes ((List!24568 0))(
  ( (Nil!24565) (Cons!24564 (h!25773 (_ BitVec 64)) (t!35156 List!24568)) )
))
(declare-fun arrayNoDuplicates!0 (array!73064 (_ BitVec 32) List!24568) Bool)

(assert (=> b!1121247 (= res!749079 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24565))))

(declare-fun b!1121248 () Bool)

(assert (=> b!1121248 (= e!638406 e!638404)))

(declare-fun res!749081 () Bool)

(assert (=> b!1121248 (=> (not res!749081) (not e!638404))))

(declare-fun lt!498140 () array!73064)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73064 (_ BitVec 32)) Bool)

(assert (=> b!1121248 (= res!749081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498140 mask!1564))))

(assert (=> b!1121248 (= lt!498140 (array!73065 (store (arr!35185 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35723 _keys!1208)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!42641 0))(
  ( (V!42642 (val!14124 Int)) )
))
(declare-fun minValue!944 () V!42641)

(declare-fun bm!47071 () Bool)

(declare-fun zeroValue!944 () V!42641)

(declare-datatypes ((ValueCell!13358 0))(
  ( (ValueCellFull!13358 (v!16756 V!42641)) (EmptyCell!13358) )
))
(declare-datatypes ((array!73066 0))(
  ( (array!73067 (arr!35186 (Array (_ BitVec 32) ValueCell!13358)) (size!35724 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73066)

(declare-datatypes ((tuple2!17796 0))(
  ( (tuple2!17797 (_1!8909 (_ BitVec 64)) (_2!8909 V!42641)) )
))
(declare-datatypes ((List!24569 0))(
  ( (Nil!24566) (Cons!24565 (h!25774 tuple2!17796) (t!35157 List!24569)) )
))
(declare-datatypes ((ListLongMap!15765 0))(
  ( (ListLongMap!15766 (toList!7898 List!24569)) )
))
(declare-fun call!47075 () ListLongMap!15765)

(declare-fun getCurrentListMapNoExtraKeys!4406 (array!73064 array!73066 (_ BitVec 32) (_ BitVec 32) V!42641 V!42641 (_ BitVec 32) Int) ListLongMap!15765)

(assert (=> bm!47071 (= call!47075 (getCurrentListMapNoExtraKeys!4406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121249 () Bool)

(declare-fun res!749082 () Bool)

(assert (=> b!1121249 (=> (not res!749082) (not e!638406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121249 (= res!749082 (validKeyInArray!0 k0!934))))

(declare-fun b!1121250 () Bool)

(declare-fun res!749086 () Bool)

(assert (=> b!1121250 (=> (not res!749086) (not e!638406))))

(assert (=> b!1121250 (= res!749086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121251 () Bool)

(declare-fun e!638408 () Bool)

(declare-fun e!638405 () Bool)

(declare-fun mapRes!44020 () Bool)

(assert (=> b!1121251 (= e!638408 (and e!638405 mapRes!44020))))

(declare-fun condMapEmpty!44020 () Bool)

(declare-fun mapDefault!44020 () ValueCell!13358)

(assert (=> b!1121251 (= condMapEmpty!44020 (= (arr!35186 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13358)) mapDefault!44020)))))

(declare-fun b!1121253 () Bool)

(declare-fun tp_is_empty!28135 () Bool)

(assert (=> b!1121253 (= e!638405 tp_is_empty!28135)))

(declare-fun b!1121254 () Bool)

(declare-fun res!749076 () Bool)

(assert (=> b!1121254 (=> (not res!749076) (not e!638406))))

(assert (=> b!1121254 (= res!749076 (= (select (arr!35185 _keys!1208) i!673) k0!934))))

(declare-fun b!1121255 () Bool)

(declare-fun e!638401 () Bool)

(assert (=> b!1121255 (= e!638402 e!638401)))

(declare-fun res!749078 () Bool)

(assert (=> b!1121255 (=> res!749078 e!638401)))

(assert (=> b!1121255 (= res!749078 (not (= from!1455 i!673)))))

(declare-fun lt!498138 () array!73066)

(declare-fun lt!498139 () ListLongMap!15765)

(assert (=> b!1121255 (= lt!498139 (getCurrentListMapNoExtraKeys!4406 lt!498140 lt!498138 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2446 (Int (_ BitVec 64)) V!42641)

(assert (=> b!1121255 (= lt!498138 (array!73067 (store (arr!35186 _values!996) i!673 (ValueCellFull!13358 (dynLambda!2446 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35724 _values!996)))))

(declare-fun lt!498136 () ListLongMap!15765)

(assert (=> b!1121255 (= lt!498136 (getCurrentListMapNoExtraKeys!4406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!44020 () Bool)

(assert (=> mapIsEmpty!44020 mapRes!44020))

(declare-fun b!1121256 () Bool)

(declare-fun res!749080 () Bool)

(assert (=> b!1121256 (=> (not res!749080) (not e!638406))))

(assert (=> b!1121256 (= res!749080 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35723 _keys!1208))))))

(declare-fun b!1121257 () Bool)

(declare-fun e!638407 () Bool)

(declare-fun call!47074 () ListLongMap!15765)

(assert (=> b!1121257 (= e!638407 (= call!47074 call!47075))))

(declare-fun b!1121258 () Bool)

(declare-fun -!1051 (ListLongMap!15765 (_ BitVec 64)) ListLongMap!15765)

(assert (=> b!1121258 (= e!638407 (= call!47074 (-!1051 call!47075 k0!934)))))

(declare-fun b!1121259 () Bool)

(assert (=> b!1121259 (= e!638401 true)))

(assert (=> b!1121259 e!638407))

(declare-fun c!109371 () Bool)

(assert (=> b!1121259 (= c!109371 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498141 () Unit!36621)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!328 (array!73064 array!73066 (_ BitVec 32) (_ BitVec 32) V!42641 V!42641 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36621)

(assert (=> b!1121259 (= lt!498141 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121260 () Bool)

(declare-fun res!749083 () Bool)

(assert (=> b!1121260 (=> (not res!749083) (not e!638406))))

(assert (=> b!1121260 (= res!749083 (and (= (size!35724 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35723 _keys!1208) (size!35724 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121261 () Bool)

(declare-fun e!638403 () Bool)

(assert (=> b!1121261 (= e!638403 tp_is_empty!28135)))

(declare-fun bm!47072 () Bool)

(assert (=> bm!47072 (= call!47074 (getCurrentListMapNoExtraKeys!4406 lt!498140 lt!498138 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44020 () Bool)

(declare-fun tp!83519 () Bool)

(assert (=> mapNonEmpty!44020 (= mapRes!44020 (and tp!83519 e!638403))))

(declare-fun mapRest!44020 () (Array (_ BitVec 32) ValueCell!13358))

(declare-fun mapKey!44020 () (_ BitVec 32))

(declare-fun mapValue!44020 () ValueCell!13358)

(assert (=> mapNonEmpty!44020 (= (arr!35186 _values!996) (store mapRest!44020 mapKey!44020 mapValue!44020))))

(declare-fun b!1121262 () Bool)

(declare-fun res!749075 () Bool)

(assert (=> b!1121262 (=> (not res!749075) (not e!638406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121262 (= res!749075 (validMask!0 mask!1564))))

(declare-fun res!749084 () Bool)

(assert (=> start!97898 (=> (not res!749084) (not e!638406))))

(assert (=> start!97898 (= res!749084 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35723 _keys!1208))))))

(assert (=> start!97898 e!638406))

(assert (=> start!97898 tp_is_empty!28135))

(declare-fun array_inv!27096 (array!73064) Bool)

(assert (=> start!97898 (array_inv!27096 _keys!1208)))

(assert (=> start!97898 true))

(assert (=> start!97898 tp!83518))

(declare-fun array_inv!27097 (array!73066) Bool)

(assert (=> start!97898 (and (array_inv!27097 _values!996) e!638408)))

(declare-fun b!1121252 () Bool)

(declare-fun res!749085 () Bool)

(assert (=> b!1121252 (=> (not res!749085) (not e!638404))))

(assert (=> b!1121252 (= res!749085 (arrayNoDuplicates!0 lt!498140 #b00000000000000000000000000000000 Nil!24565))))

(assert (= (and start!97898 res!749084) b!1121262))

(assert (= (and b!1121262 res!749075) b!1121260))

(assert (= (and b!1121260 res!749083) b!1121250))

(assert (= (and b!1121250 res!749086) b!1121247))

(assert (= (and b!1121247 res!749079) b!1121256))

(assert (= (and b!1121256 res!749080) b!1121249))

(assert (= (and b!1121249 res!749082) b!1121254))

(assert (= (and b!1121254 res!749076) b!1121248))

(assert (= (and b!1121248 res!749081) b!1121252))

(assert (= (and b!1121252 res!749085) b!1121246))

(assert (= (and b!1121246 (not res!749077)) b!1121255))

(assert (= (and b!1121255 (not res!749078)) b!1121259))

(assert (= (and b!1121259 c!109371) b!1121258))

(assert (= (and b!1121259 (not c!109371)) b!1121257))

(assert (= (or b!1121258 b!1121257) bm!47072))

(assert (= (or b!1121258 b!1121257) bm!47071))

(assert (= (and b!1121251 condMapEmpty!44020) mapIsEmpty!44020))

(assert (= (and b!1121251 (not condMapEmpty!44020)) mapNonEmpty!44020))

(get-info :version)

(assert (= (and mapNonEmpty!44020 ((_ is ValueCellFull!13358) mapValue!44020)) b!1121261))

(assert (= (and b!1121251 ((_ is ValueCellFull!13358) mapDefault!44020)) b!1121253))

(assert (= start!97898 b!1121251))

(declare-fun b_lambda!18557 () Bool)

(assert (=> (not b_lambda!18557) (not b!1121255)))

(declare-fun t!35155 () Bool)

(declare-fun tb!8409 () Bool)

(assert (=> (and start!97898 (= defaultEntry!1004 defaultEntry!1004) t!35155) tb!8409))

(declare-fun result!17387 () Bool)

(assert (=> tb!8409 (= result!17387 tp_is_empty!28135)))

(assert (=> b!1121255 t!35155))

(declare-fun b_and!37973 () Bool)

(assert (= b_and!37971 (and (=> t!35155 result!17387) b_and!37973)))

(declare-fun m!1035603 () Bool)

(assert (=> bm!47071 m!1035603))

(declare-fun m!1035605 () Bool)

(assert (=> b!1121248 m!1035605))

(declare-fun m!1035607 () Bool)

(assert (=> b!1121248 m!1035607))

(declare-fun m!1035609 () Bool)

(assert (=> b!1121259 m!1035609))

(declare-fun m!1035611 () Bool)

(assert (=> mapNonEmpty!44020 m!1035611))

(declare-fun m!1035613 () Bool)

(assert (=> bm!47072 m!1035613))

(declare-fun m!1035615 () Bool)

(assert (=> b!1121252 m!1035615))

(declare-fun m!1035617 () Bool)

(assert (=> start!97898 m!1035617))

(declare-fun m!1035619 () Bool)

(assert (=> start!97898 m!1035619))

(declare-fun m!1035621 () Bool)

(assert (=> b!1121254 m!1035621))

(declare-fun m!1035623 () Bool)

(assert (=> b!1121249 m!1035623))

(declare-fun m!1035625 () Bool)

(assert (=> b!1121247 m!1035625))

(declare-fun m!1035627 () Bool)

(assert (=> b!1121258 m!1035627))

(declare-fun m!1035629 () Bool)

(assert (=> b!1121255 m!1035629))

(declare-fun m!1035631 () Bool)

(assert (=> b!1121255 m!1035631))

(declare-fun m!1035633 () Bool)

(assert (=> b!1121255 m!1035633))

(declare-fun m!1035635 () Bool)

(assert (=> b!1121255 m!1035635))

(declare-fun m!1035637 () Bool)

(assert (=> b!1121250 m!1035637))

(declare-fun m!1035639 () Bool)

(assert (=> b!1121246 m!1035639))

(declare-fun m!1035641 () Bool)

(assert (=> b!1121246 m!1035641))

(declare-fun m!1035643 () Bool)

(assert (=> b!1121262 m!1035643))

(check-sat (not b!1121249) b_and!37973 (not b_next!23605) (not b!1121255) (not bm!47071) (not mapNonEmpty!44020) (not b_lambda!18557) (not b!1121258) (not b!1121252) (not b!1121262) (not b!1121248) (not b!1121246) (not bm!47072) (not b!1121250) (not start!97898) tp_is_empty!28135 (not b!1121259) (not b!1121247))
(check-sat b_and!37973 (not b_next!23605))
