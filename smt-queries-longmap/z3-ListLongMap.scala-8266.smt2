; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100780 () Bool)

(assert start!100780)

(declare-fun b_free!25867 () Bool)

(declare-fun b_next!25867 () Bool)

(assert (=> start!100780 (= b_free!25867 (not b_next!25867))))

(declare-fun tp!90591 () Bool)

(declare-fun b_and!42623 () Bool)

(assert (=> start!100780 (= tp!90591 b_and!42623)))

(declare-datatypes ((V!45889 0))(
  ( (V!45890 (val!15342 Int)) )
))
(declare-fun zeroValue!944 () V!45889)

(declare-fun c!117997 () Bool)

(declare-fun bm!57666 () Bool)

(declare-fun c!117999 () Bool)

(declare-datatypes ((tuple2!19672 0))(
  ( (tuple2!19673 (_1!9847 (_ BitVec 64)) (_2!9847 V!45889)) )
))
(declare-datatypes ((List!26486 0))(
  ( (Nil!26483) (Cons!26482 (h!27700 tuple2!19672) (t!39325 List!26486)) )
))
(declare-datatypes ((ListLongMap!17649 0))(
  ( (ListLongMap!17650 (toList!8840 List!26486)) )
))
(declare-fun call!57674 () ListLongMap!17649)

(declare-fun lt!545241 () ListLongMap!17649)

(declare-fun minValue!944 () V!45889)

(declare-fun +!4010 (ListLongMap!17649 tuple2!19672) ListLongMap!17649)

(assert (=> bm!57666 (= call!57674 (+!4010 lt!545241 (ite (or c!117999 c!117997) (tuple2!19673 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19673 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1203273 () Bool)

(declare-fun c!117998 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!545245 () Bool)

(assert (=> b!1203273 (= c!117998 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!545245))))

(declare-datatypes ((Unit!39812 0))(
  ( (Unit!39813) )
))
(declare-fun e!683395 () Unit!39812)

(declare-fun e!683392 () Unit!39812)

(assert (=> b!1203273 (= e!683395 e!683392)))

(declare-fun bm!57667 () Bool)

(declare-fun call!57675 () ListLongMap!17649)

(assert (=> bm!57667 (= call!57675 call!57674)))

(declare-fun b!1203274 () Bool)

(declare-fun lt!545246 () Unit!39812)

(assert (=> b!1203274 (= e!683392 lt!545246)))

(declare-fun call!57672 () Unit!39812)

(assert (=> b!1203274 (= lt!545246 call!57672)))

(declare-fun call!57676 () Bool)

(assert (=> b!1203274 call!57676))

(declare-fun call!57673 () Unit!39812)

(declare-fun bm!57668 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun addStillContains!997 (ListLongMap!17649 (_ BitVec 64) V!45889 (_ BitVec 64)) Unit!39812)

(assert (=> bm!57668 (= call!57673 (addStillContains!997 lt!545241 (ite (or c!117999 c!117997) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117999 c!117997) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1203275 () Bool)

(declare-fun e!683388 () Bool)

(declare-fun e!683393 () Bool)

(assert (=> b!1203275 (= e!683388 e!683393)))

(declare-fun res!800580 () Bool)

(assert (=> b!1203275 (=> res!800580 e!683393)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1203275 (= res!800580 (not (= from!1455 i!673)))))

(declare-fun lt!545233 () ListLongMap!17649)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!77953 0))(
  ( (array!77954 (arr!37615 (Array (_ BitVec 32) (_ BitVec 64))) (size!38152 (_ BitVec 32))) )
))
(declare-fun lt!545240 () array!77953)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14576 0))(
  ( (ValueCellFull!14576 (v!17976 V!45889)) (EmptyCell!14576) )
))
(declare-datatypes ((array!77955 0))(
  ( (array!77956 (arr!37616 (Array (_ BitVec 32) ValueCell!14576)) (size!38153 (_ BitVec 32))) )
))
(declare-fun lt!545234 () array!77955)

(declare-fun getCurrentListMapNoExtraKeys!5307 (array!77953 array!77955 (_ BitVec 32) (_ BitVec 32) V!45889 V!45889 (_ BitVec 32) Int) ListLongMap!17649)

(assert (=> b!1203275 (= lt!545233 (getCurrentListMapNoExtraKeys!5307 lt!545240 lt!545234 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77955)

(declare-fun dynLambda!3243 (Int (_ BitVec 64)) V!45889)

(assert (=> b!1203275 (= lt!545234 (array!77956 (store (arr!37616 _values!996) i!673 (ValueCellFull!14576 (dynLambda!3243 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38153 _values!996)))))

(declare-fun _keys!1208 () array!77953)

(declare-fun lt!545235 () ListLongMap!17649)

(assert (=> b!1203275 (= lt!545235 (getCurrentListMapNoExtraKeys!5307 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1203276 () Bool)

(declare-fun e!683397 () Unit!39812)

(assert (=> b!1203276 (= e!683397 e!683395)))

(assert (=> b!1203276 (= c!117997 (and (not lt!545245) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!57669 () Bool)

(assert (=> bm!57669 (= call!57672 call!57673)))

(declare-fun b!1203277 () Bool)

(declare-fun res!800581 () Bool)

(declare-fun e!683396 () Bool)

(assert (=> b!1203277 (=> (not res!800581) (not e!683396))))

(assert (=> b!1203277 (= res!800581 (= (select (arr!37615 _keys!1208) i!673) k0!934))))

(declare-fun b!1203278 () Bool)

(declare-fun lt!545243 () Unit!39812)

(assert (=> b!1203278 (= e!683397 lt!545243)))

(declare-fun lt!545244 () Unit!39812)

(assert (=> b!1203278 (= lt!545244 call!57673)))

(declare-fun lt!545237 () ListLongMap!17649)

(assert (=> b!1203278 (= lt!545237 call!57674)))

(declare-fun call!57671 () Bool)

(assert (=> b!1203278 call!57671))

(assert (=> b!1203278 (= lt!545243 (addStillContains!997 lt!545237 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6919 (ListLongMap!17649 (_ BitVec 64)) Bool)

(assert (=> b!1203278 (contains!6919 (+!4010 lt!545237 (tuple2!19673 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1203279 () Bool)

(declare-fun res!800584 () Bool)

(declare-fun e!683389 () Bool)

(assert (=> b!1203279 (=> (not res!800584) (not e!683389))))

(declare-datatypes ((List!26487 0))(
  ( (Nil!26484) (Cons!26483 (h!27701 (_ BitVec 64)) (t!39326 List!26487)) )
))
(declare-fun arrayNoDuplicates!0 (array!77953 (_ BitVec 32) List!26487) Bool)

(assert (=> b!1203279 (= res!800584 (arrayNoDuplicates!0 lt!545240 #b00000000000000000000000000000000 Nil!26484))))

(declare-fun call!57669 () ListLongMap!17649)

(declare-fun bm!57670 () Bool)

(assert (=> bm!57670 (= call!57669 (getCurrentListMapNoExtraKeys!5307 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203280 () Bool)

(declare-fun res!800583 () Bool)

(assert (=> b!1203280 (=> (not res!800583) (not e!683396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1203280 (= res!800583 (validMask!0 mask!1564))))

(declare-fun b!1203281 () Bool)

(declare-fun res!800582 () Bool)

(assert (=> b!1203281 (=> (not res!800582) (not e!683396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77953 (_ BitVec 32)) Bool)

(assert (=> b!1203281 (= res!800582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1203282 () Bool)

(declare-fun e!683386 () Bool)

(declare-fun e!683398 () Bool)

(declare-fun mapRes!47699 () Bool)

(assert (=> b!1203282 (= e!683386 (and e!683398 mapRes!47699))))

(declare-fun condMapEmpty!47699 () Bool)

(declare-fun mapDefault!47699 () ValueCell!14576)

(assert (=> b!1203282 (= condMapEmpty!47699 (= (arr!37616 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14576)) mapDefault!47699)))))

(declare-fun b!1203283 () Bool)

(assert (=> b!1203283 (= e!683389 (not e!683388))))

(declare-fun res!800578 () Bool)

(assert (=> b!1203283 (=> res!800578 e!683388)))

(assert (=> b!1203283 (= res!800578 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1203283 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!545236 () Unit!39812)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77953 (_ BitVec 64) (_ BitVec 32)) Unit!39812)

(assert (=> b!1203283 (= lt!545236 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!47699 () Bool)

(assert (=> mapIsEmpty!47699 mapRes!47699))

(declare-fun b!1203284 () Bool)

(declare-fun res!800586 () Bool)

(assert (=> b!1203284 (=> (not res!800586) (not e!683396))))

(assert (=> b!1203284 (= res!800586 (and (= (size!38153 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38152 _keys!1208) (size!38153 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1203285 () Bool)

(declare-fun res!800587 () Bool)

(assert (=> b!1203285 (=> (not res!800587) (not e!683396))))

(assert (=> b!1203285 (= res!800587 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38152 _keys!1208))))))

(declare-fun call!57670 () ListLongMap!17649)

(declare-fun e!683399 () Bool)

(declare-fun b!1203286 () Bool)

(declare-fun -!1793 (ListLongMap!17649 (_ BitVec 64)) ListLongMap!17649)

(assert (=> b!1203286 (= e!683399 (= call!57670 (-!1793 call!57669 k0!934)))))

(declare-fun b!1203287 () Bool)

(declare-fun res!800589 () Bool)

(assert (=> b!1203287 (=> (not res!800589) (not e!683396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1203287 (= res!800589 (validKeyInArray!0 k0!934))))

(declare-fun b!1203288 () Bool)

(declare-fun e!683390 () Bool)

(declare-fun tp_is_empty!30571 () Bool)

(assert (=> b!1203288 (= e!683390 tp_is_empty!30571)))

(declare-fun b!1203289 () Bool)

(declare-fun res!800590 () Bool)

(assert (=> b!1203289 (=> (not res!800590) (not e!683396))))

(assert (=> b!1203289 (= res!800590 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26484))))

(declare-fun b!1203290 () Bool)

(assert (=> b!1203290 (= e!683399 (= call!57670 call!57669))))

(declare-fun b!1203291 () Bool)

(assert (=> b!1203291 call!57676))

(declare-fun lt!545239 () Unit!39812)

(assert (=> b!1203291 (= lt!545239 call!57672)))

(assert (=> b!1203291 (= e!683395 lt!545239)))

(declare-fun b!1203292 () Bool)

(assert (=> b!1203292 (= e!683398 tp_is_empty!30571)))

(declare-fun res!800588 () Bool)

(assert (=> start!100780 (=> (not res!800588) (not e!683396))))

(assert (=> start!100780 (= res!800588 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38152 _keys!1208))))))

(assert (=> start!100780 e!683396))

(assert (=> start!100780 tp_is_empty!30571))

(declare-fun array_inv!28732 (array!77953) Bool)

(assert (=> start!100780 (array_inv!28732 _keys!1208)))

(assert (=> start!100780 true))

(assert (=> start!100780 tp!90591))

(declare-fun array_inv!28733 (array!77955) Bool)

(assert (=> start!100780 (and (array_inv!28733 _values!996) e!683386)))

(declare-fun b!1203293 () Bool)

(assert (=> b!1203293 (= e!683396 e!683389)))

(declare-fun res!800585 () Bool)

(assert (=> b!1203293 (=> (not res!800585) (not e!683389))))

(assert (=> b!1203293 (= res!800585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!545240 mask!1564))))

(assert (=> b!1203293 (= lt!545240 (array!77954 (store (arr!37615 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38152 _keys!1208)))))

(declare-fun bm!57671 () Bool)

(assert (=> bm!57671 (= call!57676 call!57671)))

(declare-fun bm!57672 () Bool)

(assert (=> bm!57672 (= call!57670 (getCurrentListMapNoExtraKeys!5307 lt!545240 lt!545234 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1203294 () Bool)

(declare-fun e!683391 () Bool)

(assert (=> b!1203294 (= e!683391 true)))

(declare-fun lt!545238 () Unit!39812)

(assert (=> b!1203294 (= lt!545238 e!683397)))

(assert (=> b!1203294 (= c!117999 (and (not lt!545245) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1203294 (= lt!545245 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1203295 () Bool)

(declare-fun e!683387 () Bool)

(assert (=> b!1203295 (= e!683393 e!683387)))

(declare-fun res!800577 () Bool)

(assert (=> b!1203295 (=> res!800577 e!683387)))

(assert (=> b!1203295 (= res!800577 (not (= (select (arr!37615 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1203295 e!683399))

(declare-fun c!118000 () Bool)

(assert (=> b!1203295 (= c!118000 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!545242 () Unit!39812)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1013 (array!77953 array!77955 (_ BitVec 32) (_ BitVec 32) V!45889 V!45889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39812)

(assert (=> b!1203295 (= lt!545242 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1013 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!47699 () Bool)

(declare-fun tp!90590 () Bool)

(assert (=> mapNonEmpty!47699 (= mapRes!47699 (and tp!90590 e!683390))))

(declare-fun mapRest!47699 () (Array (_ BitVec 32) ValueCell!14576))

(declare-fun mapValue!47699 () ValueCell!14576)

(declare-fun mapKey!47699 () (_ BitVec 32))

(assert (=> mapNonEmpty!47699 (= (arr!37616 _values!996) (store mapRest!47699 mapKey!47699 mapValue!47699))))

(declare-fun b!1203296 () Bool)

(assert (=> b!1203296 (= e!683387 e!683391)))

(declare-fun res!800579 () Bool)

(assert (=> b!1203296 (=> res!800579 e!683391)))

(assert (=> b!1203296 (= res!800579 (not (contains!6919 lt!545241 k0!934)))))

(assert (=> b!1203296 (= lt!545241 (getCurrentListMapNoExtraKeys!5307 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57673 () Bool)

(assert (=> bm!57673 (= call!57671 (contains!6919 (ite c!117999 lt!545237 call!57675) k0!934))))

(declare-fun b!1203297 () Bool)

(declare-fun Unit!39814 () Unit!39812)

(assert (=> b!1203297 (= e!683392 Unit!39814)))

(assert (= (and start!100780 res!800588) b!1203280))

(assert (= (and b!1203280 res!800583) b!1203284))

(assert (= (and b!1203284 res!800586) b!1203281))

(assert (= (and b!1203281 res!800582) b!1203289))

(assert (= (and b!1203289 res!800590) b!1203285))

(assert (= (and b!1203285 res!800587) b!1203287))

(assert (= (and b!1203287 res!800589) b!1203277))

(assert (= (and b!1203277 res!800581) b!1203293))

(assert (= (and b!1203293 res!800585) b!1203279))

(assert (= (and b!1203279 res!800584) b!1203283))

(assert (= (and b!1203283 (not res!800578)) b!1203275))

(assert (= (and b!1203275 (not res!800580)) b!1203295))

(assert (= (and b!1203295 c!118000) b!1203286))

(assert (= (and b!1203295 (not c!118000)) b!1203290))

(assert (= (or b!1203286 b!1203290) bm!57672))

(assert (= (or b!1203286 b!1203290) bm!57670))

(assert (= (and b!1203295 (not res!800577)) b!1203296))

(assert (= (and b!1203296 (not res!800579)) b!1203294))

(assert (= (and b!1203294 c!117999) b!1203278))

(assert (= (and b!1203294 (not c!117999)) b!1203276))

(assert (= (and b!1203276 c!117997) b!1203291))

(assert (= (and b!1203276 (not c!117997)) b!1203273))

(assert (= (and b!1203273 c!117998) b!1203274))

(assert (= (and b!1203273 (not c!117998)) b!1203297))

(assert (= (or b!1203291 b!1203274) bm!57669))

(assert (= (or b!1203291 b!1203274) bm!57667))

(assert (= (or b!1203291 b!1203274) bm!57671))

(assert (= (or b!1203278 bm!57671) bm!57673))

(assert (= (or b!1203278 bm!57669) bm!57668))

(assert (= (or b!1203278 bm!57667) bm!57666))

(assert (= (and b!1203282 condMapEmpty!47699) mapIsEmpty!47699))

(assert (= (and b!1203282 (not condMapEmpty!47699)) mapNonEmpty!47699))

(get-info :version)

(assert (= (and mapNonEmpty!47699 ((_ is ValueCellFull!14576) mapValue!47699)) b!1203288))

(assert (= (and b!1203282 ((_ is ValueCellFull!14576) mapDefault!47699)) b!1203292))

(assert (= start!100780 b!1203282))

(declare-fun b_lambda!21057 () Bool)

(assert (=> (not b_lambda!21057) (not b!1203275)))

(declare-fun t!39324 () Bool)

(declare-fun tb!10659 () Bool)

(assert (=> (and start!100780 (= defaultEntry!1004 defaultEntry!1004) t!39324) tb!10659))

(declare-fun result!21903 () Bool)

(assert (=> tb!10659 (= result!21903 tp_is_empty!30571)))

(assert (=> b!1203275 t!39324))

(declare-fun b_and!42625 () Bool)

(assert (= b_and!42623 (and (=> t!39324 result!21903) b_and!42625)))

(declare-fun m!1109525 () Bool)

(assert (=> b!1203295 m!1109525))

(declare-fun m!1109527 () Bool)

(assert (=> b!1203295 m!1109527))

(declare-fun m!1109529 () Bool)

(assert (=> bm!57670 m!1109529))

(declare-fun m!1109531 () Bool)

(assert (=> b!1203286 m!1109531))

(declare-fun m!1109533 () Bool)

(assert (=> b!1203279 m!1109533))

(declare-fun m!1109535 () Bool)

(assert (=> b!1203283 m!1109535))

(declare-fun m!1109537 () Bool)

(assert (=> b!1203283 m!1109537))

(declare-fun m!1109539 () Bool)

(assert (=> b!1203289 m!1109539))

(declare-fun m!1109541 () Bool)

(assert (=> b!1203280 m!1109541))

(declare-fun m!1109543 () Bool)

(assert (=> b!1203281 m!1109543))

(declare-fun m!1109545 () Bool)

(assert (=> bm!57668 m!1109545))

(declare-fun m!1109547 () Bool)

(assert (=> b!1203293 m!1109547))

(declare-fun m!1109549 () Bool)

(assert (=> b!1203293 m!1109549))

(declare-fun m!1109551 () Bool)

(assert (=> bm!57673 m!1109551))

(declare-fun m!1109553 () Bool)

(assert (=> b!1203296 m!1109553))

(assert (=> b!1203296 m!1109529))

(declare-fun m!1109555 () Bool)

(assert (=> mapNonEmpty!47699 m!1109555))

(declare-fun m!1109557 () Bool)

(assert (=> b!1203277 m!1109557))

(declare-fun m!1109559 () Bool)

(assert (=> b!1203275 m!1109559))

(declare-fun m!1109561 () Bool)

(assert (=> b!1203275 m!1109561))

(declare-fun m!1109563 () Bool)

(assert (=> b!1203275 m!1109563))

(declare-fun m!1109565 () Bool)

(assert (=> b!1203275 m!1109565))

(declare-fun m!1109567 () Bool)

(assert (=> bm!57672 m!1109567))

(declare-fun m!1109569 () Bool)

(assert (=> b!1203278 m!1109569))

(declare-fun m!1109571 () Bool)

(assert (=> b!1203278 m!1109571))

(assert (=> b!1203278 m!1109571))

(declare-fun m!1109573 () Bool)

(assert (=> b!1203278 m!1109573))

(declare-fun m!1109575 () Bool)

(assert (=> start!100780 m!1109575))

(declare-fun m!1109577 () Bool)

(assert (=> start!100780 m!1109577))

(declare-fun m!1109579 () Bool)

(assert (=> b!1203287 m!1109579))

(declare-fun m!1109581 () Bool)

(assert (=> bm!57666 m!1109581))

(check-sat (not b_lambda!21057) (not bm!57666) (not b!1203295) (not b!1203281) (not b!1203275) tp_is_empty!30571 (not b!1203279) (not b!1203278) (not b!1203293) (not bm!57670) (not mapNonEmpty!47699) (not b!1203280) (not bm!57668) (not b!1203283) (not b!1203286) (not b!1203289) (not b!1203287) (not bm!57673) (not bm!57672) (not b!1203296) (not b_next!25867) (not start!100780) b_and!42625)
(check-sat b_and!42625 (not b_next!25867))
