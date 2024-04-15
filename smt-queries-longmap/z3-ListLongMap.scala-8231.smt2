; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100288 () Bool)

(assert start!100288)

(declare-fun b_free!25681 () Bool)

(declare-fun b_next!25681 () Bool)

(assert (=> start!100288 (= b_free!25681 (not b_next!25681))))

(declare-fun tp!89990 () Bool)

(declare-fun b_and!42207 () Bool)

(assert (=> start!100288 (= tp!89990 b_and!42207)))

(declare-datatypes ((V!45609 0))(
  ( (V!45610 (val!15237 Int)) )
))
(declare-fun zeroValue!944 () V!45609)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun bm!57138 () Bool)

(declare-datatypes ((ValueCell!14471 0))(
  ( (ValueCellFull!14471 (v!17874 V!45609)) (EmptyCell!14471) )
))
(declare-datatypes ((array!77432 0))(
  ( (array!77433 (arr!37363 (Array (_ BitVec 32) ValueCell!14471)) (size!37901 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77432)

(declare-fun minValue!944 () V!45609)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!77434 0))(
  ( (array!77435 (arr!37364 (Array (_ BitVec 32) (_ BitVec 64))) (size!37902 (_ BitVec 32))) )
))
(declare-fun lt!542917 () array!77434)

(declare-datatypes ((tuple2!19604 0))(
  ( (tuple2!19605 (_1!9813 (_ BitVec 64)) (_2!9813 V!45609)) )
))
(declare-datatypes ((List!26379 0))(
  ( (Nil!26376) (Cons!26375 (h!27584 tuple2!19604) (t!39043 List!26379)) )
))
(declare-datatypes ((ListLongMap!17573 0))(
  ( (ListLongMap!17574 (toList!8802 List!26379)) )
))
(declare-fun call!57142 () ListLongMap!17573)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5252 (array!77434 array!77432 (_ BitVec 32) (_ BitVec 32) V!45609 V!45609 (_ BitVec 32) Int) ListLongMap!17573)

(declare-fun dynLambda!3136 (Int (_ BitVec 64)) V!45609)

(assert (=> bm!57138 (= call!57142 (getCurrentListMapNoExtraKeys!5252 lt!542917 (array!77433 (store (arr!37363 _values!996) i!673 (ValueCellFull!14471 (dynLambda!3136 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37901 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196489 () Bool)

(declare-fun e!679773 () Bool)

(declare-fun e!679770 () Bool)

(declare-fun mapRes!47378 () Bool)

(assert (=> b!1196489 (= e!679773 (and e!679770 mapRes!47378))))

(declare-fun condMapEmpty!47378 () Bool)

(declare-fun mapDefault!47378 () ValueCell!14471)

(assert (=> b!1196489 (= condMapEmpty!47378 (= (arr!37363 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14471)) mapDefault!47378)))))

(declare-fun b!1196490 () Bool)

(declare-fun res!796293 () Bool)

(declare-fun e!679771 () Bool)

(assert (=> b!1196490 (=> (not res!796293) (not e!679771))))

(declare-datatypes ((List!26380 0))(
  ( (Nil!26377) (Cons!26376 (h!27585 (_ BitVec 64)) (t!39044 List!26380)) )
))
(declare-fun arrayNoDuplicates!0 (array!77434 (_ BitVec 32) List!26380) Bool)

(assert (=> b!1196490 (= res!796293 (arrayNoDuplicates!0 lt!542917 #b00000000000000000000000000000000 Nil!26377))))

(declare-fun b!1196491 () Bool)

(declare-fun e!679774 () Bool)

(assert (=> b!1196491 (= e!679771 (not e!679774))))

(declare-fun res!796294 () Bool)

(assert (=> b!1196491 (=> res!796294 e!679774)))

(declare-fun _keys!1208 () array!77434)

(assert (=> b!1196491 (= res!796294 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37902 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196491 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39549 0))(
  ( (Unit!39550) )
))
(declare-fun lt!542919 () Unit!39549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77434 (_ BitVec 64) (_ BitVec 32)) Unit!39549)

(assert (=> b!1196491 (= lt!542919 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!796295 () Bool)

(declare-fun e!679772 () Bool)

(assert (=> start!100288 (=> (not res!796295) (not e!679772))))

(assert (=> start!100288 (= res!796295 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37902 _keys!1208))))))

(assert (=> start!100288 e!679772))

(declare-fun tp_is_empty!30361 () Bool)

(assert (=> start!100288 tp_is_empty!30361))

(declare-fun array_inv!28604 (array!77434) Bool)

(assert (=> start!100288 (array_inv!28604 _keys!1208)))

(assert (=> start!100288 true))

(assert (=> start!100288 tp!89990))

(declare-fun array_inv!28605 (array!77432) Bool)

(assert (=> start!100288 (and (array_inv!28605 _values!996) e!679773)))

(declare-fun b!1196492 () Bool)

(assert (=> b!1196492 (= e!679770 tp_is_empty!30361)))

(declare-fun b!1196493 () Bool)

(assert (=> b!1196493 (= e!679774 true)))

(declare-fun e!679777 () Bool)

(assert (=> b!1196493 e!679777))

(declare-fun c!117310 () Bool)

(assert (=> b!1196493 (= c!117310 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!542918 () Unit!39549)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!990 (array!77434 array!77432 (_ BitVec 32) (_ BitVec 32) V!45609 V!45609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39549)

(assert (=> b!1196493 (= lt!542918 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!990 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196494 () Bool)

(declare-fun res!796297 () Bool)

(assert (=> b!1196494 (=> (not res!796297) (not e!679772))))

(assert (=> b!1196494 (= res!796297 (= (select (arr!37364 _keys!1208) i!673) k0!934))))

(declare-fun b!1196495 () Bool)

(declare-fun res!796296 () Bool)

(assert (=> b!1196495 (=> (not res!796296) (not e!679772))))

(assert (=> b!1196495 (= res!796296 (and (= (size!37901 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37902 _keys!1208) (size!37901 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196496 () Bool)

(declare-fun call!57141 () ListLongMap!17573)

(assert (=> b!1196496 (= e!679777 (= call!57142 call!57141))))

(declare-fun b!1196497 () Bool)

(declare-fun res!796300 () Bool)

(assert (=> b!1196497 (=> (not res!796300) (not e!679772))))

(assert (=> b!1196497 (= res!796300 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26377))))

(declare-fun b!1196498 () Bool)

(declare-fun res!796298 () Bool)

(assert (=> b!1196498 (=> (not res!796298) (not e!679772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77434 (_ BitVec 32)) Bool)

(assert (=> b!1196498 (= res!796298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47378 () Bool)

(assert (=> mapIsEmpty!47378 mapRes!47378))

(declare-fun mapNonEmpty!47378 () Bool)

(declare-fun tp!89991 () Bool)

(declare-fun e!679776 () Bool)

(assert (=> mapNonEmpty!47378 (= mapRes!47378 (and tp!89991 e!679776))))

(declare-fun mapValue!47378 () ValueCell!14471)

(declare-fun mapRest!47378 () (Array (_ BitVec 32) ValueCell!14471))

(declare-fun mapKey!47378 () (_ BitVec 32))

(assert (=> mapNonEmpty!47378 (= (arr!37363 _values!996) (store mapRest!47378 mapKey!47378 mapValue!47378))))

(declare-fun b!1196499 () Bool)

(assert (=> b!1196499 (= e!679772 e!679771)))

(declare-fun res!796302 () Bool)

(assert (=> b!1196499 (=> (not res!796302) (not e!679771))))

(assert (=> b!1196499 (= res!796302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542917 mask!1564))))

(assert (=> b!1196499 (= lt!542917 (array!77435 (store (arr!37364 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37902 _keys!1208)))))

(declare-fun b!1196500 () Bool)

(declare-fun res!796299 () Bool)

(assert (=> b!1196500 (=> (not res!796299) (not e!679772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196500 (= res!796299 (validMask!0 mask!1564))))

(declare-fun b!1196501 () Bool)

(declare-fun res!796303 () Bool)

(assert (=> b!1196501 (=> (not res!796303) (not e!679772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196501 (= res!796303 (validKeyInArray!0 k0!934))))

(declare-fun b!1196502 () Bool)

(declare-fun -!1739 (ListLongMap!17573 (_ BitVec 64)) ListLongMap!17573)

(assert (=> b!1196502 (= e!679777 (= call!57142 (-!1739 call!57141 k0!934)))))

(declare-fun b!1196503 () Bool)

(assert (=> b!1196503 (= e!679776 tp_is_empty!30361)))

(declare-fun bm!57139 () Bool)

(assert (=> bm!57139 (= call!57141 (getCurrentListMapNoExtraKeys!5252 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196504 () Bool)

(declare-fun res!796301 () Bool)

(assert (=> b!1196504 (=> (not res!796301) (not e!679772))))

(assert (=> b!1196504 (= res!796301 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37902 _keys!1208))))))

(assert (= (and start!100288 res!796295) b!1196500))

(assert (= (and b!1196500 res!796299) b!1196495))

(assert (= (and b!1196495 res!796296) b!1196498))

(assert (= (and b!1196498 res!796298) b!1196497))

(assert (= (and b!1196497 res!796300) b!1196504))

(assert (= (and b!1196504 res!796301) b!1196501))

(assert (= (and b!1196501 res!796303) b!1196494))

(assert (= (and b!1196494 res!796297) b!1196499))

(assert (= (and b!1196499 res!796302) b!1196490))

(assert (= (and b!1196490 res!796293) b!1196491))

(assert (= (and b!1196491 (not res!796294)) b!1196493))

(assert (= (and b!1196493 c!117310) b!1196502))

(assert (= (and b!1196493 (not c!117310)) b!1196496))

(assert (= (or b!1196502 b!1196496) bm!57138))

(assert (= (or b!1196502 b!1196496) bm!57139))

(assert (= (and b!1196489 condMapEmpty!47378) mapIsEmpty!47378))

(assert (= (and b!1196489 (not condMapEmpty!47378)) mapNonEmpty!47378))

(get-info :version)

(assert (= (and mapNonEmpty!47378 ((_ is ValueCellFull!14471) mapValue!47378)) b!1196503))

(assert (= (and b!1196489 ((_ is ValueCellFull!14471) mapDefault!47378)) b!1196492))

(assert (= start!100288 b!1196489))

(declare-fun b_lambda!20807 () Bool)

(assert (=> (not b_lambda!20807) (not bm!57138)))

(declare-fun t!39042 () Bool)

(declare-fun tb!10485 () Bool)

(assert (=> (and start!100288 (= defaultEntry!1004 defaultEntry!1004) t!39042) tb!10485))

(declare-fun result!21551 () Bool)

(assert (=> tb!10485 (= result!21551 tp_is_empty!30361)))

(assert (=> bm!57138 t!39042))

(declare-fun b_and!42209 () Bool)

(assert (= b_and!42207 (and (=> t!39042 result!21551) b_and!42209)))

(declare-fun m!1103177 () Bool)

(assert (=> bm!57139 m!1103177))

(declare-fun m!1103179 () Bool)

(assert (=> mapNonEmpty!47378 m!1103179))

(declare-fun m!1103181 () Bool)

(assert (=> b!1196500 m!1103181))

(declare-fun m!1103183 () Bool)

(assert (=> b!1196498 m!1103183))

(declare-fun m!1103185 () Bool)

(assert (=> b!1196493 m!1103185))

(declare-fun m!1103187 () Bool)

(assert (=> b!1196499 m!1103187))

(declare-fun m!1103189 () Bool)

(assert (=> b!1196499 m!1103189))

(declare-fun m!1103191 () Bool)

(assert (=> b!1196502 m!1103191))

(declare-fun m!1103193 () Bool)

(assert (=> b!1196497 m!1103193))

(declare-fun m!1103195 () Bool)

(assert (=> b!1196490 m!1103195))

(declare-fun m!1103197 () Bool)

(assert (=> b!1196494 m!1103197))

(declare-fun m!1103199 () Bool)

(assert (=> start!100288 m!1103199))

(declare-fun m!1103201 () Bool)

(assert (=> start!100288 m!1103201))

(declare-fun m!1103203 () Bool)

(assert (=> bm!57138 m!1103203))

(declare-fun m!1103205 () Bool)

(assert (=> bm!57138 m!1103205))

(declare-fun m!1103207 () Bool)

(assert (=> bm!57138 m!1103207))

(declare-fun m!1103209 () Bool)

(assert (=> b!1196501 m!1103209))

(declare-fun m!1103211 () Bool)

(assert (=> b!1196491 m!1103211))

(declare-fun m!1103213 () Bool)

(assert (=> b!1196491 m!1103213))

(check-sat (not b!1196491) (not b_next!25681) (not b!1196501) (not b!1196500) tp_is_empty!30361 (not b!1196499) (not b!1196497) (not b!1196493) (not bm!57138) b_and!42209 (not b!1196498) (not start!100288) (not b!1196502) (not bm!57139) (not b_lambda!20807) (not mapNonEmpty!47378) (not b!1196490))
(check-sat b_and!42209 (not b_next!25681))
