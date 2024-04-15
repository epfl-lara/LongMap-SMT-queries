; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100490 () Bool)

(assert start!100490)

(declare-fun b_free!25819 () Bool)

(declare-fun b_next!25819 () Bool)

(assert (=> start!100490 (= b_free!25819 (not b_next!25819))))

(declare-fun tp!90447 () Bool)

(declare-fun b_and!42503 () Bool)

(assert (=> start!100490 (= tp!90447 b_and!42503)))

(declare-fun b!1200302 () Bool)

(declare-fun e!681638 () Bool)

(declare-fun e!681643 () Bool)

(assert (=> b!1200302 (= e!681638 (not e!681643))))

(declare-fun res!799037 () Bool)

(assert (=> b!1200302 (=> res!799037 e!681643)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200302 (= res!799037 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!77744 0))(
  ( (array!77745 (arr!37517 (Array (_ BitVec 32) (_ BitVec 64))) (size!38055 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77744)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200302 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39657 0))(
  ( (Unit!39658) )
))
(declare-fun lt!543853 () Unit!39657)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77744 (_ BitVec 64) (_ BitVec 32)) Unit!39657)

(assert (=> b!1200302 (= lt!543853 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200303 () Bool)

(declare-fun e!681642 () Bool)

(assert (=> b!1200303 (= e!681642 (bvslt from!1455 (size!38055 _keys!1208)))))

(declare-fun e!681644 () Bool)

(assert (=> b!1200303 e!681644))

(declare-fun c!117414 () Bool)

(assert (=> b!1200303 (= c!117414 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!45825 0))(
  ( (V!45826 (val!15318 Int)) )
))
(declare-fun zeroValue!944 () V!45825)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!543849 () Unit!39657)

(declare-datatypes ((ValueCell!14552 0))(
  ( (ValueCellFull!14552 (v!17955 V!45825)) (EmptyCell!14552) )
))
(declare-datatypes ((array!77746 0))(
  ( (array!77747 (arr!37518 (Array (_ BitVec 32) ValueCell!14552)) (size!38056 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77746)

(declare-fun minValue!944 () V!45825)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!999 (array!77744 array!77746 (_ BitVec 32) (_ BitVec 32) V!45825 V!45825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39657)

(assert (=> b!1200303 (= lt!543849 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!999 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200304 () Bool)

(declare-fun e!681645 () Bool)

(declare-fun e!681641 () Bool)

(declare-fun mapRes!47627 () Bool)

(assert (=> b!1200304 (= e!681645 (and e!681641 mapRes!47627))))

(declare-fun condMapEmpty!47627 () Bool)

(declare-fun mapDefault!47627 () ValueCell!14552)

(assert (=> b!1200304 (= condMapEmpty!47627 (= (arr!37518 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14552)) mapDefault!47627)))))

(declare-fun b!1200305 () Bool)

(declare-fun res!799030 () Bool)

(declare-fun e!681646 () Bool)

(assert (=> b!1200305 (=> (not res!799030) (not e!681646))))

(assert (=> b!1200305 (= res!799030 (= (select (arr!37517 _keys!1208) i!673) k0!934))))

(declare-fun b!1200306 () Bool)

(declare-fun res!799028 () Bool)

(assert (=> b!1200306 (=> (not res!799028) (not e!681646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77744 (_ BitVec 32)) Bool)

(assert (=> b!1200306 (= res!799028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47627 () Bool)

(declare-fun tp!90446 () Bool)

(declare-fun e!681640 () Bool)

(assert (=> mapNonEmpty!47627 (= mapRes!47627 (and tp!90446 e!681640))))

(declare-fun mapRest!47627 () (Array (_ BitVec 32) ValueCell!14552))

(declare-fun mapKey!47627 () (_ BitVec 32))

(declare-fun mapValue!47627 () ValueCell!14552)

(assert (=> mapNonEmpty!47627 (= (arr!37518 _values!996) (store mapRest!47627 mapKey!47627 mapValue!47627))))

(declare-fun b!1200307 () Bool)

(declare-fun res!799033 () Bool)

(assert (=> b!1200307 (=> (not res!799033) (not e!681646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200307 (= res!799033 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47627 () Bool)

(assert (=> mapIsEmpty!47627 mapRes!47627))

(declare-fun b!1200308 () Bool)

(assert (=> b!1200308 (= e!681646 e!681638)))

(declare-fun res!799036 () Bool)

(assert (=> b!1200308 (=> (not res!799036) (not e!681638))))

(declare-fun lt!543850 () array!77744)

(assert (=> b!1200308 (= res!799036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543850 mask!1564))))

(assert (=> b!1200308 (= lt!543850 (array!77745 (store (arr!37517 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38055 _keys!1208)))))

(declare-fun b!1200309 () Bool)

(declare-fun res!799031 () Bool)

(assert (=> b!1200309 (=> (not res!799031) (not e!681638))))

(declare-datatypes ((List!26486 0))(
  ( (Nil!26483) (Cons!26482 (h!27691 (_ BitVec 64)) (t!39276 List!26486)) )
))
(declare-fun arrayNoDuplicates!0 (array!77744 (_ BitVec 32) List!26486) Bool)

(assert (=> b!1200309 (= res!799031 (arrayNoDuplicates!0 lt!543850 #b00000000000000000000000000000000 Nil!26483))))

(declare-fun b!1200310 () Bool)

(declare-fun res!799027 () Bool)

(assert (=> b!1200310 (=> (not res!799027) (not e!681646))))

(assert (=> b!1200310 (= res!799027 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38055 _keys!1208))))))

(declare-datatypes ((tuple2!19694 0))(
  ( (tuple2!19695 (_1!9858 (_ BitVec 64)) (_2!9858 V!45825)) )
))
(declare-datatypes ((List!26487 0))(
  ( (Nil!26484) (Cons!26483 (h!27692 tuple2!19694) (t!39277 List!26487)) )
))
(declare-datatypes ((ListLongMap!17663 0))(
  ( (ListLongMap!17664 (toList!8847 List!26487)) )
))
(declare-fun call!57264 () ListLongMap!17663)

(declare-fun call!57263 () ListLongMap!17663)

(declare-fun b!1200311 () Bool)

(declare-fun -!1748 (ListLongMap!17663 (_ BitVec 64)) ListLongMap!17663)

(assert (=> b!1200311 (= e!681644 (= call!57264 (-!1748 call!57263 k0!934)))))

(declare-fun res!799034 () Bool)

(assert (=> start!100490 (=> (not res!799034) (not e!681646))))

(assert (=> start!100490 (= res!799034 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38055 _keys!1208))))))

(assert (=> start!100490 e!681646))

(declare-fun tp_is_empty!30523 () Bool)

(assert (=> start!100490 tp_is_empty!30523))

(declare-fun array_inv!28704 (array!77744) Bool)

(assert (=> start!100490 (array_inv!28704 _keys!1208)))

(assert (=> start!100490 true))

(assert (=> start!100490 tp!90447))

(declare-fun array_inv!28705 (array!77746) Bool)

(assert (=> start!100490 (and (array_inv!28705 _values!996) e!681645)))

(declare-fun b!1200312 () Bool)

(declare-fun res!799038 () Bool)

(assert (=> b!1200312 (=> (not res!799038) (not e!681646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200312 (= res!799038 (validKeyInArray!0 k0!934))))

(declare-fun b!1200313 () Bool)

(assert (=> b!1200313 (= e!681640 tp_is_empty!30523)))

(declare-fun b!1200314 () Bool)

(assert (=> b!1200314 (= e!681643 e!681642)))

(declare-fun res!799029 () Bool)

(assert (=> b!1200314 (=> res!799029 e!681642)))

(assert (=> b!1200314 (= res!799029 (not (= from!1455 i!673)))))

(declare-fun lt!543851 () ListLongMap!17663)

(declare-fun lt!543852 () array!77746)

(declare-fun getCurrentListMapNoExtraKeys!5296 (array!77744 array!77746 (_ BitVec 32) (_ BitVec 32) V!45825 V!45825 (_ BitVec 32) Int) ListLongMap!17663)

(assert (=> b!1200314 (= lt!543851 (getCurrentListMapNoExtraKeys!5296 lt!543850 lt!543852 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3176 (Int (_ BitVec 64)) V!45825)

(assert (=> b!1200314 (= lt!543852 (array!77747 (store (arr!37518 _values!996) i!673 (ValueCellFull!14552 (dynLambda!3176 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38056 _values!996)))))

(declare-fun lt!543848 () ListLongMap!17663)

(assert (=> b!1200314 (= lt!543848 (getCurrentListMapNoExtraKeys!5296 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!57260 () Bool)

(assert (=> bm!57260 (= call!57264 (getCurrentListMapNoExtraKeys!5296 lt!543850 lt!543852 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57261 () Bool)

(assert (=> bm!57261 (= call!57263 (getCurrentListMapNoExtraKeys!5296 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200315 () Bool)

(declare-fun res!799032 () Bool)

(assert (=> b!1200315 (=> (not res!799032) (not e!681646))))

(assert (=> b!1200315 (= res!799032 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26483))))

(declare-fun b!1200316 () Bool)

(declare-fun res!799035 () Bool)

(assert (=> b!1200316 (=> (not res!799035) (not e!681646))))

(assert (=> b!1200316 (= res!799035 (and (= (size!38056 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38055 _keys!1208) (size!38056 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200317 () Bool)

(assert (=> b!1200317 (= e!681644 (= call!57264 call!57263))))

(declare-fun b!1200318 () Bool)

(assert (=> b!1200318 (= e!681641 tp_is_empty!30523)))

(assert (= (and start!100490 res!799034) b!1200307))

(assert (= (and b!1200307 res!799033) b!1200316))

(assert (= (and b!1200316 res!799035) b!1200306))

(assert (= (and b!1200306 res!799028) b!1200315))

(assert (= (and b!1200315 res!799032) b!1200310))

(assert (= (and b!1200310 res!799027) b!1200312))

(assert (= (and b!1200312 res!799038) b!1200305))

(assert (= (and b!1200305 res!799030) b!1200308))

(assert (= (and b!1200308 res!799036) b!1200309))

(assert (= (and b!1200309 res!799031) b!1200302))

(assert (= (and b!1200302 (not res!799037)) b!1200314))

(assert (= (and b!1200314 (not res!799029)) b!1200303))

(assert (= (and b!1200303 c!117414) b!1200311))

(assert (= (and b!1200303 (not c!117414)) b!1200317))

(assert (= (or b!1200311 b!1200317) bm!57260))

(assert (= (or b!1200311 b!1200317) bm!57261))

(assert (= (and b!1200304 condMapEmpty!47627) mapIsEmpty!47627))

(assert (= (and b!1200304 (not condMapEmpty!47627)) mapNonEmpty!47627))

(get-info :version)

(assert (= (and mapNonEmpty!47627 ((_ is ValueCellFull!14552) mapValue!47627)) b!1200313))

(assert (= (and b!1200304 ((_ is ValueCellFull!14552) mapDefault!47627)) b!1200318))

(assert (= start!100490 b!1200304))

(declare-fun b_lambda!20997 () Bool)

(assert (=> (not b_lambda!20997) (not b!1200314)))

(declare-fun t!39275 () Bool)

(declare-fun tb!10611 () Bool)

(assert (=> (and start!100490 (= defaultEntry!1004 defaultEntry!1004) t!39275) tb!10611))

(declare-fun result!21807 () Bool)

(assert (=> tb!10611 (= result!21807 tp_is_empty!30523)))

(assert (=> b!1200314 t!39275))

(declare-fun b_and!42505 () Bool)

(assert (= b_and!42503 (and (=> t!39275 result!21807) b_and!42505)))

(declare-fun m!1106125 () Bool)

(assert (=> b!1200307 m!1106125))

(declare-fun m!1106127 () Bool)

(assert (=> b!1200311 m!1106127))

(declare-fun m!1106129 () Bool)

(assert (=> mapNonEmpty!47627 m!1106129))

(declare-fun m!1106131 () Bool)

(assert (=> b!1200302 m!1106131))

(declare-fun m!1106133 () Bool)

(assert (=> b!1200302 m!1106133))

(declare-fun m!1106135 () Bool)

(assert (=> bm!57261 m!1106135))

(declare-fun m!1106137 () Bool)

(assert (=> b!1200312 m!1106137))

(declare-fun m!1106139 () Bool)

(assert (=> b!1200303 m!1106139))

(declare-fun m!1106141 () Bool)

(assert (=> bm!57260 m!1106141))

(declare-fun m!1106143 () Bool)

(assert (=> b!1200306 m!1106143))

(declare-fun m!1106145 () Bool)

(assert (=> b!1200308 m!1106145))

(declare-fun m!1106147 () Bool)

(assert (=> b!1200308 m!1106147))

(declare-fun m!1106149 () Bool)

(assert (=> b!1200314 m!1106149))

(declare-fun m!1106151 () Bool)

(assert (=> b!1200314 m!1106151))

(declare-fun m!1106153 () Bool)

(assert (=> b!1200314 m!1106153))

(declare-fun m!1106155 () Bool)

(assert (=> b!1200314 m!1106155))

(declare-fun m!1106157 () Bool)

(assert (=> b!1200315 m!1106157))

(declare-fun m!1106159 () Bool)

(assert (=> b!1200305 m!1106159))

(declare-fun m!1106161 () Bool)

(assert (=> b!1200309 m!1106161))

(declare-fun m!1106163 () Bool)

(assert (=> start!100490 m!1106163))

(declare-fun m!1106165 () Bool)

(assert (=> start!100490 m!1106165))

(check-sat (not bm!57261) (not b_lambda!20997) (not b!1200308) (not b_next!25819) (not bm!57260) (not b!1200315) tp_is_empty!30523 (not mapNonEmpty!47627) (not b!1200314) (not b!1200303) (not b!1200312) (not b!1200309) (not start!100490) (not b!1200311) b_and!42505 (not b!1200306) (not b!1200307) (not b!1200302))
(check-sat b_and!42505 (not b_next!25819))
