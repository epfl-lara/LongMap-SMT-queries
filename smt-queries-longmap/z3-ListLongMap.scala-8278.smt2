; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101004 () Bool)

(assert start!101004)

(declare-fun b_free!25939 () Bool)

(declare-fun b_next!25939 () Bool)

(assert (=> start!101004 (= b_free!25939 (not b_next!25939))))

(declare-fun tp!90819 () Bool)

(declare-fun b_and!42867 () Bool)

(assert (=> start!101004 (= tp!90819 b_and!42867)))

(declare-fun b!1207250 () Bool)

(declare-datatypes ((Unit!39939 0))(
  ( (Unit!39940) )
))
(declare-fun e!685684 () Unit!39939)

(declare-fun e!685678 () Unit!39939)

(assert (=> b!1207250 (= e!685684 e!685678)))

(declare-fun c!118776 () Bool)

(declare-fun lt!547504 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1207250 (= c!118776 (and (not lt!547504) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1207251 () Bool)

(declare-fun call!58662 () Bool)

(assert (=> b!1207251 call!58662))

(declare-fun lt!547502 () Unit!39939)

(declare-fun call!58665 () Unit!39939)

(assert (=> b!1207251 (= lt!547502 call!58665)))

(assert (=> b!1207251 (= e!685678 lt!547502)))

(declare-fun b!1207252 () Bool)

(declare-fun e!685691 () Bool)

(declare-fun e!685680 () Bool)

(assert (=> b!1207252 (= e!685691 (not e!685680))))

(declare-fun res!802582 () Bool)

(assert (=> b!1207252 (=> res!802582 e!685680)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1207252 (= res!802582 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78099 0))(
  ( (array!78100 (arr!37684 (Array (_ BitVec 32) (_ BitVec 64))) (size!38221 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78099)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1207252 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547511 () Unit!39939)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78099 (_ BitVec 64) (_ BitVec 32)) Unit!39939)

(assert (=> b!1207252 (= lt!547511 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1207253 () Bool)

(declare-fun e!685685 () Bool)

(assert (=> b!1207253 (= e!685685 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547504) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!58659 () Bool)

(declare-fun call!58663 () Bool)

(assert (=> bm!58659 (= call!58662 call!58663)))

(declare-fun b!1207254 () Bool)

(declare-fun e!685690 () Bool)

(declare-fun e!685681 () Bool)

(declare-fun mapRes!47820 () Bool)

(assert (=> b!1207254 (= e!685690 (and e!685681 mapRes!47820))))

(declare-fun condMapEmpty!47820 () Bool)

(declare-datatypes ((V!45985 0))(
  ( (V!45986 (val!15378 Int)) )
))
(declare-datatypes ((ValueCell!14612 0))(
  ( (ValueCellFull!14612 (v!18018 V!45985)) (EmptyCell!14612) )
))
(declare-datatypes ((array!78101 0))(
  ( (array!78102 (arr!37685 (Array (_ BitVec 32) ValueCell!14612)) (size!38222 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78101)

(declare-fun mapDefault!47820 () ValueCell!14612)

(assert (=> b!1207254 (= condMapEmpty!47820 (= (arr!37685 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14612)) mapDefault!47820)))))

(declare-fun bm!58660 () Bool)

(declare-datatypes ((tuple2!19740 0))(
  ( (tuple2!19741 (_1!9881 (_ BitVec 64)) (_2!9881 V!45985)) )
))
(declare-datatypes ((List!26548 0))(
  ( (Nil!26545) (Cons!26544 (h!27762 tuple2!19740) (t!39459 List!26548)) )
))
(declare-datatypes ((ListLongMap!17717 0))(
  ( (ListLongMap!17718 (toList!8874 List!26548)) )
))
(declare-fun lt!547498 () ListLongMap!17717)

(declare-fun minValue!944 () V!45985)

(declare-fun c!118775 () Bool)

(declare-fun call!58668 () ListLongMap!17717)

(declare-fun zeroValue!944 () V!45985)

(declare-fun +!4038 (ListLongMap!17717 tuple2!19740) ListLongMap!17717)

(assert (=> bm!58660 (= call!58668 (+!4038 lt!547498 (ite (or c!118775 c!118776) (tuple2!19741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1207256 () Bool)

(declare-fun tp_is_empty!30643 () Bool)

(assert (=> b!1207256 (= e!685681 tp_is_empty!30643)))

(declare-fun b!1207257 () Bool)

(declare-fun res!802576 () Bool)

(assert (=> b!1207257 (=> (not res!802576) (not e!685691))))

(declare-fun lt!547503 () array!78099)

(declare-datatypes ((List!26549 0))(
  ( (Nil!26546) (Cons!26545 (h!27763 (_ BitVec 64)) (t!39460 List!26549)) )
))
(declare-fun arrayNoDuplicates!0 (array!78099 (_ BitVec 32) List!26549) Bool)

(assert (=> b!1207257 (= res!802576 (arrayNoDuplicates!0 lt!547503 #b00000000000000000000000000000000 Nil!26546))))

(declare-fun b!1207258 () Bool)

(declare-fun e!685686 () Bool)

(assert (=> b!1207258 (= e!685680 e!685686)))

(declare-fun res!802571 () Bool)

(assert (=> b!1207258 (=> res!802571 e!685686)))

(assert (=> b!1207258 (= res!802571 (not (= from!1455 i!673)))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!547499 () ListLongMap!17717)

(declare-fun lt!547506 () array!78101)

(declare-fun getCurrentListMapNoExtraKeys!5337 (array!78099 array!78101 (_ BitVec 32) (_ BitVec 32) V!45985 V!45985 (_ BitVec 32) Int) ListLongMap!17717)

(assert (=> b!1207258 (= lt!547499 (getCurrentListMapNoExtraKeys!5337 lt!547503 lt!547506 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3260 (Int (_ BitVec 64)) V!45985)

(assert (=> b!1207258 (= lt!547506 (array!78102 (store (arr!37685 _values!996) i!673 (ValueCellFull!14612 (dynLambda!3260 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38222 _values!996)))))

(declare-fun lt!547501 () ListLongMap!17717)

(assert (=> b!1207258 (= lt!547501 (getCurrentListMapNoExtraKeys!5337 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1207259 () Bool)

(declare-fun res!802569 () Bool)

(declare-fun e!685687 () Bool)

(assert (=> b!1207259 (=> (not res!802569) (not e!685687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78099 (_ BitVec 32)) Bool)

(assert (=> b!1207259 (= res!802569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1207260 () Bool)

(declare-fun res!802568 () Bool)

(assert (=> b!1207260 (=> (not res!802568) (not e!685687))))

(assert (=> b!1207260 (= res!802568 (and (= (size!38222 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38221 _keys!1208) (size!38222 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1207261 () Bool)

(declare-fun lt!547497 () Unit!39939)

(assert (=> b!1207261 (= e!685684 lt!547497)))

(declare-fun lt!547508 () Unit!39939)

(declare-fun call!58669 () Unit!39939)

(assert (=> b!1207261 (= lt!547508 call!58669)))

(declare-fun lt!547509 () ListLongMap!17717)

(assert (=> b!1207261 (= lt!547509 call!58668)))

(assert (=> b!1207261 call!58663))

(declare-fun addStillContains!1022 (ListLongMap!17717 (_ BitVec 64) V!45985 (_ BitVec 64)) Unit!39939)

(assert (=> b!1207261 (= lt!547497 (addStillContains!1022 lt!547509 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6953 (ListLongMap!17717 (_ BitVec 64)) Bool)

(assert (=> b!1207261 (contains!6953 (+!4038 lt!547509 (tuple2!19741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun bm!58661 () Bool)

(assert (=> bm!58661 (= call!58669 (addStillContains!1022 lt!547498 (ite (or c!118775 c!118776) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118775 c!118776) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1207262 () Bool)

(declare-fun res!802580 () Bool)

(assert (=> b!1207262 (=> (not res!802580) (not e!685687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1207262 (= res!802580 (validMask!0 mask!1564))))

(declare-fun b!1207263 () Bool)

(assert (=> b!1207263 (= e!685687 e!685691)))

(declare-fun res!802570 () Bool)

(assert (=> b!1207263 (=> (not res!802570) (not e!685691))))

(assert (=> b!1207263 (= res!802570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547503 mask!1564))))

(assert (=> b!1207263 (= lt!547503 (array!78100 (store (arr!37684 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38221 _keys!1208)))))

(declare-fun mapNonEmpty!47820 () Bool)

(declare-fun tp!90820 () Bool)

(declare-fun e!685682 () Bool)

(assert (=> mapNonEmpty!47820 (= mapRes!47820 (and tp!90820 e!685682))))

(declare-fun mapValue!47820 () ValueCell!14612)

(declare-fun mapKey!47820 () (_ BitVec 32))

(declare-fun mapRest!47820 () (Array (_ BitVec 32) ValueCell!14612))

(assert (=> mapNonEmpty!47820 (= (arr!37685 _values!996) (store mapRest!47820 mapKey!47820 mapValue!47820))))

(declare-fun b!1207264 () Bool)

(declare-fun e!685688 () Bool)

(declare-fun call!58664 () ListLongMap!17717)

(declare-fun call!58667 () ListLongMap!17717)

(assert (=> b!1207264 (= e!685688 (= call!58664 call!58667))))

(declare-fun b!1207265 () Bool)

(declare-fun e!685683 () Unit!39939)

(declare-fun Unit!39941 () Unit!39939)

(assert (=> b!1207265 (= e!685683 Unit!39941)))

(declare-fun res!802573 () Bool)

(assert (=> start!101004 (=> (not res!802573) (not e!685687))))

(assert (=> start!101004 (= res!802573 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38221 _keys!1208))))))

(assert (=> start!101004 e!685687))

(assert (=> start!101004 tp_is_empty!30643))

(declare-fun array_inv!28776 (array!78099) Bool)

(assert (=> start!101004 (array_inv!28776 _keys!1208)))

(assert (=> start!101004 true))

(assert (=> start!101004 tp!90819))

(declare-fun array_inv!28777 (array!78101) Bool)

(assert (=> start!101004 (and (array_inv!28777 _values!996) e!685690)))

(declare-fun b!1207255 () Bool)

(assert (=> b!1207255 (= e!685682 tp_is_empty!30643)))

(declare-fun b!1207266 () Bool)

(declare-fun res!802579 () Bool)

(assert (=> b!1207266 (=> (not res!802579) (not e!685687))))

(assert (=> b!1207266 (= res!802579 (= (select (arr!37684 _keys!1208) i!673) k0!934))))

(declare-fun b!1207267 () Bool)

(declare-fun res!802581 () Bool)

(assert (=> b!1207267 (=> (not res!802581) (not e!685687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1207267 (= res!802581 (validKeyInArray!0 k0!934))))

(declare-fun b!1207268 () Bool)

(declare-fun res!802575 () Bool)

(assert (=> b!1207268 (=> (not res!802575) (not e!685687))))

(assert (=> b!1207268 (= res!802575 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26546))))

(declare-fun b!1207269 () Bool)

(declare-fun e!685689 () Bool)

(assert (=> b!1207269 (= e!685686 e!685689)))

(declare-fun res!802578 () Bool)

(assert (=> b!1207269 (=> res!802578 e!685689)))

(assert (=> b!1207269 (= res!802578 (not (= (select (arr!37684 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1207269 e!685688))

(declare-fun c!118772 () Bool)

(assert (=> b!1207269 (= c!118772 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547510 () Unit!39939)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1034 (array!78099 array!78101 (_ BitVec 32) (_ BitVec 32) V!45985 V!45985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39939)

(assert (=> b!1207269 (= lt!547510 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1034 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58662 () Bool)

(assert (=> bm!58662 (= call!58664 (getCurrentListMapNoExtraKeys!5337 lt!547503 lt!547506 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!685692 () Bool)

(declare-fun b!1207270 () Bool)

(assert (=> b!1207270 (= e!685692 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207271 () Bool)

(assert (=> b!1207271 (= e!685685 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207272 () Bool)

(declare-fun e!685679 () Bool)

(assert (=> b!1207272 (= e!685689 e!685679)))

(declare-fun res!802577 () Bool)

(assert (=> b!1207272 (=> res!802577 e!685679)))

(assert (=> b!1207272 (= res!802577 (not (contains!6953 lt!547498 k0!934)))))

(assert (=> b!1207272 (= lt!547498 (getCurrentListMapNoExtraKeys!5337 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207273 () Bool)

(declare-fun res!802572 () Bool)

(assert (=> b!1207273 (=> (not res!802572) (not e!685687))))

(assert (=> b!1207273 (= res!802572 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38221 _keys!1208))))))

(declare-fun bm!58663 () Bool)

(declare-fun call!58666 () ListLongMap!17717)

(assert (=> bm!58663 (= call!58666 call!58668)))

(declare-fun b!1207274 () Bool)

(declare-fun c!118774 () Bool)

(assert (=> b!1207274 (= c!118774 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547504))))

(assert (=> b!1207274 (= e!685678 e!685683)))

(declare-fun bm!58664 () Bool)

(assert (=> bm!58664 (= call!58667 (getCurrentListMapNoExtraKeys!5337 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207275 () Bool)

(assert (=> b!1207275 (= e!685679 true)))

(assert (=> b!1207275 e!685692))

(declare-fun res!802574 () Bool)

(assert (=> b!1207275 (=> (not res!802574) (not e!685692))))

(assert (=> b!1207275 (= res!802574 e!685685)))

(declare-fun c!118773 () Bool)

(assert (=> b!1207275 (= c!118773 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547505 () Unit!39939)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!576 (array!78099 array!78101 (_ BitVec 32) (_ BitVec 32) V!45985 V!45985 (_ BitVec 64) (_ BitVec 32) Int) Unit!39939)

(assert (=> b!1207275 (= lt!547505 (lemmaListMapContainsThenArrayContainsFrom!576 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547507 () Unit!39939)

(assert (=> b!1207275 (= lt!547507 e!685684)))

(assert (=> b!1207275 (= c!118775 (and (not lt!547504) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1207275 (= lt!547504 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!47820 () Bool)

(assert (=> mapIsEmpty!47820 mapRes!47820))

(declare-fun bm!58665 () Bool)

(assert (=> bm!58665 (= call!58663 (contains!6953 (ite c!118775 lt!547509 call!58666) k0!934))))

(declare-fun bm!58666 () Bool)

(assert (=> bm!58666 (= call!58665 call!58669)))

(declare-fun b!1207276 () Bool)

(declare-fun -!1816 (ListLongMap!17717 (_ BitVec 64)) ListLongMap!17717)

(assert (=> b!1207276 (= e!685688 (= call!58664 (-!1816 call!58667 k0!934)))))

(declare-fun b!1207277 () Bool)

(declare-fun lt!547500 () Unit!39939)

(assert (=> b!1207277 (= e!685683 lt!547500)))

(assert (=> b!1207277 (= lt!547500 call!58665)))

(assert (=> b!1207277 call!58662))

(assert (= (and start!101004 res!802573) b!1207262))

(assert (= (and b!1207262 res!802580) b!1207260))

(assert (= (and b!1207260 res!802568) b!1207259))

(assert (= (and b!1207259 res!802569) b!1207268))

(assert (= (and b!1207268 res!802575) b!1207273))

(assert (= (and b!1207273 res!802572) b!1207267))

(assert (= (and b!1207267 res!802581) b!1207266))

(assert (= (and b!1207266 res!802579) b!1207263))

(assert (= (and b!1207263 res!802570) b!1207257))

(assert (= (and b!1207257 res!802576) b!1207252))

(assert (= (and b!1207252 (not res!802582)) b!1207258))

(assert (= (and b!1207258 (not res!802571)) b!1207269))

(assert (= (and b!1207269 c!118772) b!1207276))

(assert (= (and b!1207269 (not c!118772)) b!1207264))

(assert (= (or b!1207276 b!1207264) bm!58662))

(assert (= (or b!1207276 b!1207264) bm!58664))

(assert (= (and b!1207269 (not res!802578)) b!1207272))

(assert (= (and b!1207272 (not res!802577)) b!1207275))

(assert (= (and b!1207275 c!118775) b!1207261))

(assert (= (and b!1207275 (not c!118775)) b!1207250))

(assert (= (and b!1207250 c!118776) b!1207251))

(assert (= (and b!1207250 (not c!118776)) b!1207274))

(assert (= (and b!1207274 c!118774) b!1207277))

(assert (= (and b!1207274 (not c!118774)) b!1207265))

(assert (= (or b!1207251 b!1207277) bm!58666))

(assert (= (or b!1207251 b!1207277) bm!58663))

(assert (= (or b!1207251 b!1207277) bm!58659))

(assert (= (or b!1207261 bm!58659) bm!58665))

(assert (= (or b!1207261 bm!58666) bm!58661))

(assert (= (or b!1207261 bm!58663) bm!58660))

(assert (= (and b!1207275 c!118773) b!1207271))

(assert (= (and b!1207275 (not c!118773)) b!1207253))

(assert (= (and b!1207275 res!802574) b!1207270))

(assert (= (and b!1207254 condMapEmpty!47820) mapIsEmpty!47820))

(assert (= (and b!1207254 (not condMapEmpty!47820)) mapNonEmpty!47820))

(get-info :version)

(assert (= (and mapNonEmpty!47820 ((_ is ValueCellFull!14612) mapValue!47820)) b!1207255))

(assert (= (and b!1207254 ((_ is ValueCellFull!14612) mapDefault!47820)) b!1207256))

(assert (= start!101004 b!1207254))

(declare-fun b_lambda!21337 () Bool)

(assert (=> (not b_lambda!21337) (not b!1207258)))

(declare-fun t!39458 () Bool)

(declare-fun tb!10731 () Bool)

(assert (=> (and start!101004 (= defaultEntry!1004 defaultEntry!1004) t!39458) tb!10731))

(declare-fun result!22055 () Bool)

(assert (=> tb!10731 (= result!22055 tp_is_empty!30643)))

(assert (=> b!1207258 t!39458))

(declare-fun b_and!42869 () Bool)

(assert (= b_and!42867 (and (=> t!39458 result!22055) b_and!42869)))

(declare-fun m!1113311 () Bool)

(assert (=> b!1207258 m!1113311))

(declare-fun m!1113313 () Bool)

(assert (=> b!1207258 m!1113313))

(declare-fun m!1113315 () Bool)

(assert (=> b!1207258 m!1113315))

(declare-fun m!1113317 () Bool)

(assert (=> b!1207258 m!1113317))

(declare-fun m!1113319 () Bool)

(assert (=> b!1207263 m!1113319))

(declare-fun m!1113321 () Bool)

(assert (=> b!1207263 m!1113321))

(declare-fun m!1113323 () Bool)

(assert (=> b!1207261 m!1113323))

(declare-fun m!1113325 () Bool)

(assert (=> b!1207261 m!1113325))

(assert (=> b!1207261 m!1113325))

(declare-fun m!1113327 () Bool)

(assert (=> b!1207261 m!1113327))

(declare-fun m!1113329 () Bool)

(assert (=> b!1207266 m!1113329))

(declare-fun m!1113331 () Bool)

(assert (=> bm!58660 m!1113331))

(declare-fun m!1113333 () Bool)

(assert (=> bm!58664 m!1113333))

(declare-fun m!1113335 () Bool)

(assert (=> b!1207269 m!1113335))

(declare-fun m!1113337 () Bool)

(assert (=> b!1207269 m!1113337))

(declare-fun m!1113339 () Bool)

(assert (=> b!1207270 m!1113339))

(declare-fun m!1113341 () Bool)

(assert (=> bm!58665 m!1113341))

(declare-fun m!1113343 () Bool)

(assert (=> b!1207259 m!1113343))

(declare-fun m!1113345 () Bool)

(assert (=> b!1207276 m!1113345))

(declare-fun m!1113347 () Bool)

(assert (=> b!1207262 m!1113347))

(declare-fun m!1113349 () Bool)

(assert (=> mapNonEmpty!47820 m!1113349))

(declare-fun m!1113351 () Bool)

(assert (=> b!1207268 m!1113351))

(declare-fun m!1113353 () Bool)

(assert (=> b!1207257 m!1113353))

(declare-fun m!1113355 () Bool)

(assert (=> bm!58662 m!1113355))

(declare-fun m!1113357 () Bool)

(assert (=> b!1207272 m!1113357))

(assert (=> b!1207272 m!1113333))

(declare-fun m!1113359 () Bool)

(assert (=> bm!58661 m!1113359))

(declare-fun m!1113361 () Bool)

(assert (=> start!101004 m!1113361))

(declare-fun m!1113363 () Bool)

(assert (=> start!101004 m!1113363))

(declare-fun m!1113365 () Bool)

(assert (=> b!1207267 m!1113365))

(declare-fun m!1113367 () Bool)

(assert (=> b!1207252 m!1113367))

(declare-fun m!1113369 () Bool)

(assert (=> b!1207252 m!1113369))

(declare-fun m!1113371 () Bool)

(assert (=> b!1207275 m!1113371))

(assert (=> b!1207271 m!1113339))

(check-sat (not b!1207263) (not b!1207257) (not b!1207270) (not b!1207269) (not bm!58662) (not b_next!25939) (not b!1207271) (not b!1207267) (not bm!58661) (not b!1207252) tp_is_empty!30643 (not bm!58660) (not b!1207276) (not b!1207258) (not b!1207261) (not b!1207259) (not bm!58664) (not b!1207275) (not b!1207272) (not b!1207262) (not b_lambda!21337) (not mapNonEmpty!47820) (not bm!58665) (not start!101004) b_and!42869 (not b!1207268))
(check-sat b_and!42869 (not b_next!25939))
