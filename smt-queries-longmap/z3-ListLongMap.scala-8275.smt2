; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100752 () Bool)

(assert start!100752)

(declare-fun b_free!25923 () Bool)

(declare-fun b_next!25923 () Bool)

(assert (=> start!100752 (= b_free!25923 (not b_next!25923))))

(declare-fun tp!90772 () Bool)

(declare-fun b_and!42829 () Bool)

(assert (=> start!100752 (= tp!90772 b_and!42829)))

(declare-fun b!1205263 () Bool)

(declare-datatypes ((Unit!39958 0))(
  ( (Unit!39959) )
))
(declare-fun e!684458 () Unit!39958)

(declare-fun lt!546663 () Unit!39958)

(assert (=> b!1205263 (= e!684458 lt!546663)))

(declare-fun call!58405 () Unit!39958)

(assert (=> b!1205263 (= lt!546663 call!58405)))

(declare-fun call!58411 () Bool)

(assert (=> b!1205263 call!58411))

(declare-fun b!1205264 () Bool)

(assert (=> b!1205264 call!58411))

(declare-fun lt!546657 () Unit!39958)

(assert (=> b!1205264 (= lt!546657 call!58405)))

(declare-fun e!684462 () Unit!39958)

(assert (=> b!1205264 (= e!684462 lt!546657)))

(declare-fun b!1205265 () Bool)

(declare-fun res!801701 () Bool)

(declare-fun e!684463 () Bool)

(assert (=> b!1205265 (=> (not res!801701) (not e!684463))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78035 0))(
  ( (array!78036 (arr!37658 (Array (_ BitVec 32) (_ BitVec 64))) (size!38194 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78035)

(assert (=> b!1205265 (= res!801701 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38194 _keys!1208))))))

(declare-fun b!1205266 () Bool)

(declare-fun e!684456 () Bool)

(declare-fun tp_is_empty!30627 () Bool)

(assert (=> b!1205266 (= e!684456 tp_is_empty!30627)))

(declare-fun b!1205267 () Bool)

(declare-fun e!684455 () Bool)

(assert (=> b!1205267 (= e!684463 e!684455)))

(declare-fun res!801711 () Bool)

(assert (=> b!1205267 (=> (not res!801711) (not e!684455))))

(declare-fun lt!546660 () array!78035)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78035 (_ BitVec 32)) Bool)

(assert (=> b!1205267 (= res!801711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!546660 mask!1564))))

(assert (=> b!1205267 (= lt!546660 (array!78036 (store (arr!37658 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38194 _keys!1208)))))

(declare-fun bm!58401 () Bool)

(declare-datatypes ((V!45963 0))(
  ( (V!45964 (val!15370 Int)) )
))
(declare-datatypes ((tuple2!19712 0))(
  ( (tuple2!19713 (_1!9867 (_ BitVec 64)) (_2!9867 V!45963)) )
))
(declare-datatypes ((List!26519 0))(
  ( (Nil!26516) (Cons!26515 (h!27724 tuple2!19712) (t!39422 List!26519)) )
))
(declare-datatypes ((ListLongMap!17681 0))(
  ( (ListLongMap!17682 (toList!8856 List!26519)) )
))
(declare-fun call!58409 () ListLongMap!17681)

(declare-fun call!58407 () ListLongMap!17681)

(assert (=> bm!58401 (= call!58409 call!58407)))

(declare-fun b!1205268 () Bool)

(declare-fun e!684469 () Bool)

(declare-fun e!684459 () Bool)

(declare-fun mapRes!47796 () Bool)

(assert (=> b!1205268 (= e!684469 (and e!684459 mapRes!47796))))

(declare-fun condMapEmpty!47796 () Bool)

(declare-datatypes ((ValueCell!14604 0))(
  ( (ValueCellFull!14604 (v!18014 V!45963)) (EmptyCell!14604) )
))
(declare-datatypes ((array!78037 0))(
  ( (array!78038 (arr!37659 (Array (_ BitVec 32) ValueCell!14604)) (size!38195 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78037)

(declare-fun mapDefault!47796 () ValueCell!14604)

(assert (=> b!1205268 (= condMapEmpty!47796 (= (arr!37659 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14604)) mapDefault!47796)))))

(declare-fun b!1205269 () Bool)

(declare-fun e!684457 () Bool)

(assert (=> b!1205269 (= e!684455 (not e!684457))))

(declare-fun res!801709 () Bool)

(assert (=> b!1205269 (=> res!801709 e!684457)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1205269 (= res!801709 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1205269 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!546662 () Unit!39958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78035 (_ BitVec 64) (_ BitVec 32)) Unit!39958)

(assert (=> b!1205269 (= lt!546662 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun zeroValue!944 () V!45963)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun call!58408 () ListLongMap!17681)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!58403 () Bool)

(declare-fun minValue!944 () V!45963)

(declare-fun getCurrentListMapNoExtraKeys!5292 (array!78035 array!78037 (_ BitVec 32) (_ BitVec 32) V!45963 V!45963 (_ BitVec 32) Int) ListLongMap!17681)

(assert (=> bm!58403 (= call!58408 (getCurrentListMapNoExtraKeys!5292 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205270 () Bool)

(declare-fun res!801698 () Bool)

(assert (=> b!1205270 (=> (not res!801698) (not e!684455))))

(declare-datatypes ((List!26520 0))(
  ( (Nil!26517) (Cons!26516 (h!27725 (_ BitVec 64)) (t!39423 List!26520)) )
))
(declare-fun arrayNoDuplicates!0 (array!78035 (_ BitVec 32) List!26520) Bool)

(assert (=> b!1205270 (= res!801698 (arrayNoDuplicates!0 lt!546660 #b00000000000000000000000000000000 Nil!26517))))

(declare-fun b!1205271 () Bool)

(declare-fun e!684470 () Bool)

(declare-fun e!684465 () Bool)

(assert (=> b!1205271 (= e!684470 e!684465)))

(declare-fun res!801708 () Bool)

(assert (=> b!1205271 (=> res!801708 e!684465)))

(declare-fun lt!546655 () ListLongMap!17681)

(declare-fun contains!6917 (ListLongMap!17681 (_ BitVec 64)) Bool)

(assert (=> b!1205271 (= res!801708 (not (contains!6917 lt!546655 k0!934)))))

(assert (=> b!1205271 (= lt!546655 (getCurrentListMapNoExtraKeys!5292 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!118253 () Bool)

(declare-fun lt!546661 () ListLongMap!17681)

(declare-fun call!58406 () Unit!39958)

(declare-fun c!118250 () Bool)

(declare-fun bm!58404 () Bool)

(declare-fun addStillContains!1010 (ListLongMap!17681 (_ BitVec 64) V!45963 (_ BitVec 64)) Unit!39958)

(assert (=> bm!58404 (= call!58406 (addStillContains!1010 (ite c!118250 lt!546661 lt!546655) (ite c!118250 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118253 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118250 minValue!944 (ite c!118253 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!58405 () Bool)

(declare-fun call!58410 () Bool)

(assert (=> bm!58405 (= call!58410 (contains!6917 (ite c!118250 lt!546661 call!58409) k0!934))))

(declare-fun b!1205272 () Bool)

(declare-fun e!684468 () Bool)

(assert (=> b!1205272 (= e!684468 e!684470)))

(declare-fun res!801712 () Bool)

(assert (=> b!1205272 (=> res!801712 e!684470)))

(assert (=> b!1205272 (= res!801712 (not (= (select (arr!37658 _keys!1208) from!1455) k0!934)))))

(declare-fun e!684467 () Bool)

(assert (=> b!1205272 e!684467))

(declare-fun c!118254 () Bool)

(assert (=> b!1205272 (= c!118254 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!546654 () Unit!39958)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1025 (array!78035 array!78037 (_ BitVec 32) (_ BitVec 32) V!45963 V!45963 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39958)

(assert (=> b!1205272 (= lt!546654 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1025 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!58404 () ListLongMap!17681)

(declare-fun b!1205273 () Bool)

(declare-fun -!1821 (ListLongMap!17681 (_ BitVec 64)) ListLongMap!17681)

(assert (=> b!1205273 (= e!684467 (= call!58404 (-!1821 call!58408 k0!934)))))

(declare-fun lt!546652 () Bool)

(declare-fun b!1205274 () Bool)

(declare-fun e!684466 () Bool)

(assert (=> b!1205274 (= e!684466 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!546652) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1205275 () Bool)

(declare-fun res!801707 () Bool)

(assert (=> b!1205275 (=> (not res!801707) (not e!684463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1205275 (= res!801707 (validMask!0 mask!1564))))

(declare-fun b!1205276 () Bool)

(declare-fun Unit!39960 () Unit!39958)

(assert (=> b!1205276 (= e!684458 Unit!39960)))

(declare-fun b!1205277 () Bool)

(assert (=> b!1205277 (= e!684465 true)))

(declare-fun e!684461 () Bool)

(assert (=> b!1205277 e!684461))

(declare-fun res!801705 () Bool)

(assert (=> b!1205277 (=> (not res!801705) (not e!684461))))

(assert (=> b!1205277 (= res!801705 e!684466)))

(declare-fun c!118252 () Bool)

(assert (=> b!1205277 (= c!118252 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!546650 () Unit!39958)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!566 (array!78035 array!78037 (_ BitVec 32) (_ BitVec 32) V!45963 V!45963 (_ BitVec 64) (_ BitVec 32) Int) Unit!39958)

(assert (=> b!1205277 (= lt!546650 (lemmaListMapContainsThenArrayContainsFrom!566 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!546664 () Unit!39958)

(declare-fun e!684464 () Unit!39958)

(assert (=> b!1205277 (= lt!546664 e!684464)))

(assert (=> b!1205277 (= c!118250 (and (not lt!546652) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1205277 (= lt!546652 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1205278 () Bool)

(assert (=> b!1205278 (= e!684459 tp_is_empty!30627)))

(declare-fun b!1205279 () Bool)

(declare-fun res!801703 () Bool)

(assert (=> b!1205279 (=> (not res!801703) (not e!684463))))

(assert (=> b!1205279 (= res!801703 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26517))))

(declare-fun b!1205280 () Bool)

(declare-fun res!801700 () Bool)

(assert (=> b!1205280 (=> (not res!801700) (not e!684463))))

(assert (=> b!1205280 (= res!801700 (= (select (arr!37658 _keys!1208) i!673) k0!934))))

(declare-fun b!1205281 () Bool)

(declare-fun lt!546658 () Unit!39958)

(assert (=> b!1205281 (= e!684464 lt!546658)))

(declare-fun lt!546656 () Unit!39958)

(assert (=> b!1205281 (= lt!546656 (addStillContains!1010 lt!546655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun +!3981 (ListLongMap!17681 tuple2!19712) ListLongMap!17681)

(assert (=> b!1205281 (= lt!546661 (+!3981 lt!546655 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1205281 call!58410))

(assert (=> b!1205281 (= lt!546658 call!58406)))

(assert (=> b!1205281 (contains!6917 call!58407 k0!934)))

(declare-fun mapIsEmpty!47796 () Bool)

(assert (=> mapIsEmpty!47796 mapRes!47796))

(declare-fun res!801704 () Bool)

(assert (=> start!100752 (=> (not res!801704) (not e!684463))))

(assert (=> start!100752 (= res!801704 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38194 _keys!1208))))))

(assert (=> start!100752 e!684463))

(assert (=> start!100752 tp_is_empty!30627))

(declare-fun array_inv!28692 (array!78035) Bool)

(assert (=> start!100752 (array_inv!28692 _keys!1208)))

(assert (=> start!100752 true))

(assert (=> start!100752 tp!90772))

(declare-fun array_inv!28693 (array!78037) Bool)

(assert (=> start!100752 (and (array_inv!28693 _values!996) e!684469)))

(declare-fun bm!58402 () Bool)

(assert (=> bm!58402 (= call!58411 call!58410)))

(declare-fun b!1205282 () Bool)

(assert (=> b!1205282 (= e!684467 (= call!58404 call!58408))))

(declare-fun b!1205283 () Bool)

(declare-fun res!801702 () Bool)

(assert (=> b!1205283 (=> (not res!801702) (not e!684463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1205283 (= res!801702 (validKeyInArray!0 k0!934))))

(declare-fun b!1205284 () Bool)

(declare-fun c!118251 () Bool)

(assert (=> b!1205284 (= c!118251 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!546652))))

(assert (=> b!1205284 (= e!684462 e!684458)))

(declare-fun lt!546653 () array!78037)

(declare-fun bm!58406 () Bool)

(assert (=> bm!58406 (= call!58404 (getCurrentListMapNoExtraKeys!5292 lt!546660 lt!546653 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1205285 () Bool)

(assert (=> b!1205285 (= e!684457 e!684468)))

(declare-fun res!801699 () Bool)

(assert (=> b!1205285 (=> res!801699 e!684468)))

(assert (=> b!1205285 (= res!801699 (not (= from!1455 i!673)))))

(declare-fun lt!546651 () ListLongMap!17681)

(assert (=> b!1205285 (= lt!546651 (getCurrentListMapNoExtraKeys!5292 lt!546660 lt!546653 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3202 (Int (_ BitVec 64)) V!45963)

(assert (=> b!1205285 (= lt!546653 (array!78038 (store (arr!37659 _values!996) i!673 (ValueCellFull!14604 (dynLambda!3202 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38195 _values!996)))))

(declare-fun lt!546659 () ListLongMap!17681)

(assert (=> b!1205285 (= lt!546659 (getCurrentListMapNoExtraKeys!5292 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1205286 () Bool)

(assert (=> b!1205286 (= e!684461 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!58407 () Bool)

(assert (=> bm!58407 (= call!58405 call!58406)))

(declare-fun b!1205287 () Bool)

(declare-fun res!801706 () Bool)

(assert (=> b!1205287 (=> (not res!801706) (not e!684463))))

(assert (=> b!1205287 (= res!801706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1205288 () Bool)

(assert (=> b!1205288 (= e!684464 e!684462)))

(assert (=> b!1205288 (= c!118253 (and (not lt!546652) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1205289 () Bool)

(declare-fun res!801710 () Bool)

(assert (=> b!1205289 (=> (not res!801710) (not e!684463))))

(assert (=> b!1205289 (= res!801710 (and (= (size!38195 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38194 _keys!1208) (size!38195 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1205290 () Bool)

(assert (=> b!1205290 (= e!684466 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!47796 () Bool)

(declare-fun tp!90771 () Bool)

(assert (=> mapNonEmpty!47796 (= mapRes!47796 (and tp!90771 e!684456))))

(declare-fun mapRest!47796 () (Array (_ BitVec 32) ValueCell!14604))

(declare-fun mapValue!47796 () ValueCell!14604)

(declare-fun mapKey!47796 () (_ BitVec 32))

(assert (=> mapNonEmpty!47796 (= (arr!37659 _values!996) (store mapRest!47796 mapKey!47796 mapValue!47796))))

(declare-fun bm!58408 () Bool)

(assert (=> bm!58408 (= call!58407 (+!3981 (ite c!118250 lt!546661 lt!546655) (ite c!118250 (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!118253 (tuple2!19713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(assert (= (and start!100752 res!801704) b!1205275))

(assert (= (and b!1205275 res!801707) b!1205289))

(assert (= (and b!1205289 res!801710) b!1205287))

(assert (= (and b!1205287 res!801706) b!1205279))

(assert (= (and b!1205279 res!801703) b!1205265))

(assert (= (and b!1205265 res!801701) b!1205283))

(assert (= (and b!1205283 res!801702) b!1205280))

(assert (= (and b!1205280 res!801700) b!1205267))

(assert (= (and b!1205267 res!801711) b!1205270))

(assert (= (and b!1205270 res!801698) b!1205269))

(assert (= (and b!1205269 (not res!801709)) b!1205285))

(assert (= (and b!1205285 (not res!801699)) b!1205272))

(assert (= (and b!1205272 c!118254) b!1205273))

(assert (= (and b!1205272 (not c!118254)) b!1205282))

(assert (= (or b!1205273 b!1205282) bm!58406))

(assert (= (or b!1205273 b!1205282) bm!58403))

(assert (= (and b!1205272 (not res!801712)) b!1205271))

(assert (= (and b!1205271 (not res!801708)) b!1205277))

(assert (= (and b!1205277 c!118250) b!1205281))

(assert (= (and b!1205277 (not c!118250)) b!1205288))

(assert (= (and b!1205288 c!118253) b!1205264))

(assert (= (and b!1205288 (not c!118253)) b!1205284))

(assert (= (and b!1205284 c!118251) b!1205263))

(assert (= (and b!1205284 (not c!118251)) b!1205276))

(assert (= (or b!1205264 b!1205263) bm!58407))

(assert (= (or b!1205264 b!1205263) bm!58401))

(assert (= (or b!1205264 b!1205263) bm!58402))

(assert (= (or b!1205281 bm!58402) bm!58405))

(assert (= (or b!1205281 bm!58407) bm!58404))

(assert (= (or b!1205281 bm!58401) bm!58408))

(assert (= (and b!1205277 c!118252) b!1205290))

(assert (= (and b!1205277 (not c!118252)) b!1205274))

(assert (= (and b!1205277 res!801705) b!1205286))

(assert (= (and b!1205268 condMapEmpty!47796) mapIsEmpty!47796))

(assert (= (and b!1205268 (not condMapEmpty!47796)) mapNonEmpty!47796))

(get-info :version)

(assert (= (and mapNonEmpty!47796 ((_ is ValueCellFull!14604) mapValue!47796)) b!1205266))

(assert (= (and b!1205268 ((_ is ValueCellFull!14604) mapDefault!47796)) b!1205278))

(assert (= start!100752 b!1205268))

(declare-fun b_lambda!21319 () Bool)

(assert (=> (not b_lambda!21319) (not b!1205285)))

(declare-fun t!39421 () Bool)

(declare-fun tb!10723 () Bool)

(assert (=> (and start!100752 (= defaultEntry!1004 defaultEntry!1004) t!39421) tb!10723))

(declare-fun result!22031 () Bool)

(assert (=> tb!10723 (= result!22031 tp_is_empty!30627)))

(assert (=> b!1205285 t!39421))

(declare-fun b_and!42831 () Bool)

(assert (= b_and!42829 (and (=> t!39421 result!22031) b_and!42831)))

(declare-fun m!1111219 () Bool)

(assert (=> bm!58406 m!1111219))

(declare-fun m!1111221 () Bool)

(assert (=> b!1205290 m!1111221))

(declare-fun m!1111223 () Bool)

(assert (=> b!1205277 m!1111223))

(assert (=> b!1205286 m!1111221))

(declare-fun m!1111225 () Bool)

(assert (=> b!1205281 m!1111225))

(declare-fun m!1111227 () Bool)

(assert (=> b!1205281 m!1111227))

(declare-fun m!1111229 () Bool)

(assert (=> b!1205281 m!1111229))

(declare-fun m!1111231 () Bool)

(assert (=> b!1205269 m!1111231))

(declare-fun m!1111233 () Bool)

(assert (=> b!1205269 m!1111233))

(declare-fun m!1111235 () Bool)

(assert (=> bm!58403 m!1111235))

(declare-fun m!1111237 () Bool)

(assert (=> b!1205275 m!1111237))

(declare-fun m!1111239 () Bool)

(assert (=> b!1205280 m!1111239))

(declare-fun m!1111241 () Bool)

(assert (=> b!1205287 m!1111241))

(declare-fun m!1111243 () Bool)

(assert (=> bm!58408 m!1111243))

(declare-fun m!1111245 () Bool)

(assert (=> b!1205271 m!1111245))

(assert (=> b!1205271 m!1111235))

(declare-fun m!1111247 () Bool)

(assert (=> bm!58405 m!1111247))

(declare-fun m!1111249 () Bool)

(assert (=> b!1205267 m!1111249))

(declare-fun m!1111251 () Bool)

(assert (=> b!1205267 m!1111251))

(declare-fun m!1111253 () Bool)

(assert (=> start!100752 m!1111253))

(declare-fun m!1111255 () Bool)

(assert (=> start!100752 m!1111255))

(declare-fun m!1111257 () Bool)

(assert (=> b!1205283 m!1111257))

(declare-fun m!1111259 () Bool)

(assert (=> b!1205279 m!1111259))

(declare-fun m!1111261 () Bool)

(assert (=> b!1205285 m!1111261))

(declare-fun m!1111263 () Bool)

(assert (=> b!1205285 m!1111263))

(declare-fun m!1111265 () Bool)

(assert (=> b!1205285 m!1111265))

(declare-fun m!1111267 () Bool)

(assert (=> b!1205285 m!1111267))

(declare-fun m!1111269 () Bool)

(assert (=> bm!58404 m!1111269))

(declare-fun m!1111271 () Bool)

(assert (=> b!1205270 m!1111271))

(declare-fun m!1111273 () Bool)

(assert (=> b!1205273 m!1111273))

(declare-fun m!1111275 () Bool)

(assert (=> mapNonEmpty!47796 m!1111275))

(declare-fun m!1111277 () Bool)

(assert (=> b!1205272 m!1111277))

(declare-fun m!1111279 () Bool)

(assert (=> b!1205272 m!1111279))

(check-sat (not b!1205270) (not b!1205285) (not b!1205290) (not b!1205269) (not b!1205273) (not b!1205279) (not bm!58403) (not b!1205283) (not b!1205281) (not b!1205277) (not b_lambda!21319) (not mapNonEmpty!47796) (not b!1205267) (not b!1205272) (not bm!58404) (not b_next!25923) (not start!100752) (not b!1205287) (not b!1205275) tp_is_empty!30627 (not bm!58405) b_and!42831 (not b!1205286) (not bm!58408) (not b!1205271) (not bm!58406))
(check-sat b_and!42831 (not b_next!25923))
