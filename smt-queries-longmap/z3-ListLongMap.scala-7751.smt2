; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97486 () Bool)

(assert start!97486)

(declare-fun b_free!23221 () Bool)

(declare-fun b_next!23221 () Bool)

(assert (=> start!97486 (= b_free!23221 (not b_next!23221))))

(declare-fun tp!81962 () Bool)

(declare-fun b_and!37283 () Bool)

(assert (=> start!97486 (= tp!81962 b_and!37283)))

(declare-fun b!1108222 () Bool)

(declare-fun e!632446 () Bool)

(declare-fun e!632445 () Bool)

(assert (=> b!1108222 (= e!632446 (not e!632445))))

(declare-fun res!739236 () Bool)

(assert (=> b!1108222 (=> res!739236 e!632445)))

(declare-datatypes ((array!71915 0))(
  ( (array!71916 (arr!34604 (Array (_ BitVec 32) (_ BitVec 64))) (size!35141 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71915)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1108222 (= res!739236 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35141 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108222 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36313 0))(
  ( (Unit!36314) )
))
(declare-fun lt!496048 () Unit!36313)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71915 (_ BitVec 64) (_ BitVec 32)) Unit!36313)

(assert (=> b!1108222 (= lt!496048 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108223 () Bool)

(declare-fun res!739237 () Bool)

(declare-fun e!632441 () Bool)

(assert (=> b!1108223 (=> (not res!739237) (not e!632441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108223 (= res!739237 (validKeyInArray!0 k0!934))))

(declare-fun b!1108224 () Bool)

(assert (=> b!1108224 (= e!632441 e!632446)))

(declare-fun res!739242 () Bool)

(assert (=> b!1108224 (=> (not res!739242) (not e!632446))))

(declare-fun lt!496047 () array!71915)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71915 (_ BitVec 32)) Bool)

(assert (=> b!1108224 (= res!739242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496047 mask!1564))))

(assert (=> b!1108224 (= lt!496047 (array!71916 (store (arr!34604 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35141 _keys!1208)))))

(declare-fun b!1108225 () Bool)

(assert (=> b!1108225 (= e!632445 true)))

(declare-fun e!632448 () Bool)

(assert (=> b!1108225 e!632448))

(declare-fun c!109421 () Bool)

(assert (=> b!1108225 (= c!109421 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41769 0))(
  ( (V!41770 (val!13797 Int)) )
))
(declare-fun zeroValue!944 () V!41769)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13031 0))(
  ( (ValueCellFull!13031 (v!16426 V!41769)) (EmptyCell!13031) )
))
(declare-datatypes ((array!71917 0))(
  ( (array!71918 (arr!34605 (Array (_ BitVec 32) ValueCell!13031)) (size!35142 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71917)

(declare-fun minValue!944 () V!41769)

(declare-fun lt!496046 () Unit!36313)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!254 (array!71915 array!71917 (_ BitVec 32) (_ BitVec 32) V!41769 V!41769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36313)

(assert (=> b!1108225 (= lt!496046 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!254 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108226 () Bool)

(declare-datatypes ((tuple2!17436 0))(
  ( (tuple2!17437 (_1!8729 (_ BitVec 64)) (_2!8729 V!41769)) )
))
(declare-datatypes ((List!24125 0))(
  ( (Nil!24122) (Cons!24121 (h!25339 tuple2!17436) (t!34384 List!24125)) )
))
(declare-datatypes ((ListLongMap!15413 0))(
  ( (ListLongMap!15414 (toList!7722 List!24125)) )
))
(declare-fun call!46427 () ListLongMap!15413)

(declare-fun call!46426 () ListLongMap!15413)

(assert (=> b!1108226 (= e!632448 (= call!46427 call!46426))))

(declare-fun mapNonEmpty!43039 () Bool)

(declare-fun mapRes!43039 () Bool)

(declare-fun tp!81961 () Bool)

(declare-fun e!632444 () Bool)

(assert (=> mapNonEmpty!43039 (= mapRes!43039 (and tp!81961 e!632444))))

(declare-fun mapRest!43039 () (Array (_ BitVec 32) ValueCell!13031))

(declare-fun mapKey!43039 () (_ BitVec 32))

(declare-fun mapValue!43039 () ValueCell!13031)

(assert (=> mapNonEmpty!43039 (= (arr!34605 _values!996) (store mapRest!43039 mapKey!43039 mapValue!43039))))

(declare-fun b!1108228 () Bool)

(declare-fun res!739243 () Bool)

(assert (=> b!1108228 (=> (not res!739243) (not e!632441))))

(assert (=> b!1108228 (= res!739243 (and (= (size!35142 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35141 _keys!1208) (size!35142 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1108229 () Bool)

(declare-fun tp_is_empty!27481 () Bool)

(assert (=> b!1108229 (= e!632444 tp_is_empty!27481)))

(declare-fun b!1108230 () Bool)

(declare-fun res!739233 () Bool)

(assert (=> b!1108230 (=> (not res!739233) (not e!632441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108230 (= res!739233 (validMask!0 mask!1564))))

(declare-fun b!1108231 () Bool)

(declare-fun res!739240 () Bool)

(assert (=> b!1108231 (=> (not res!739240) (not e!632441))))

(declare-datatypes ((List!24126 0))(
  ( (Nil!24123) (Cons!24122 (h!25340 (_ BitVec 64)) (t!34385 List!24126)) )
))
(declare-fun arrayNoDuplicates!0 (array!71915 (_ BitVec 32) List!24126) Bool)

(assert (=> b!1108231 (= res!739240 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24123))))

(declare-fun mapIsEmpty!43039 () Bool)

(assert (=> mapIsEmpty!43039 mapRes!43039))

(declare-fun b!1108232 () Bool)

(declare-fun res!739235 () Bool)

(assert (=> b!1108232 (=> (not res!739235) (not e!632446))))

(assert (=> b!1108232 (= res!739235 (arrayNoDuplicates!0 lt!496047 #b00000000000000000000000000000000 Nil!24123))))

(declare-fun b!1108233 () Bool)

(declare-fun res!739238 () Bool)

(assert (=> b!1108233 (=> (not res!739238) (not e!632441))))

(assert (=> b!1108233 (= res!739238 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35141 _keys!1208))))))

(declare-fun b!1108234 () Bool)

(declare-fun -!985 (ListLongMap!15413 (_ BitVec 64)) ListLongMap!15413)

(assert (=> b!1108234 (= e!632448 (= call!46427 (-!985 call!46426 k0!934)))))

(declare-fun bm!46423 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4261 (array!71915 array!71917 (_ BitVec 32) (_ BitVec 32) V!41769 V!41769 (_ BitVec 32) Int) ListLongMap!15413)

(assert (=> bm!46423 (= call!46426 (getCurrentListMapNoExtraKeys!4261 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46424 () Bool)

(declare-fun dynLambda!2379 (Int (_ BitVec 64)) V!41769)

(assert (=> bm!46424 (= call!46427 (getCurrentListMapNoExtraKeys!4261 lt!496047 (array!71918 (store (arr!34605 _values!996) i!673 (ValueCellFull!13031 (dynLambda!2379 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35142 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108235 () Bool)

(declare-fun e!632442 () Bool)

(declare-fun e!632443 () Bool)

(assert (=> b!1108235 (= e!632442 (and e!632443 mapRes!43039))))

(declare-fun condMapEmpty!43039 () Bool)

(declare-fun mapDefault!43039 () ValueCell!13031)

(assert (=> b!1108235 (= condMapEmpty!43039 (= (arr!34605 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13031)) mapDefault!43039)))))

(declare-fun b!1108227 () Bool)

(declare-fun res!739241 () Bool)

(assert (=> b!1108227 (=> (not res!739241) (not e!632441))))

(assert (=> b!1108227 (= res!739241 (= (select (arr!34604 _keys!1208) i!673) k0!934))))

(declare-fun res!739234 () Bool)

(assert (=> start!97486 (=> (not res!739234) (not e!632441))))

(assert (=> start!97486 (= res!739234 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35141 _keys!1208))))))

(assert (=> start!97486 e!632441))

(assert (=> start!97486 tp_is_empty!27481))

(declare-fun array_inv!26664 (array!71915) Bool)

(assert (=> start!97486 (array_inv!26664 _keys!1208)))

(assert (=> start!97486 true))

(assert (=> start!97486 tp!81962))

(declare-fun array_inv!26665 (array!71917) Bool)

(assert (=> start!97486 (and (array_inv!26665 _values!996) e!632442)))

(declare-fun b!1108236 () Bool)

(declare-fun res!739239 () Bool)

(assert (=> b!1108236 (=> (not res!739239) (not e!632441))))

(assert (=> b!1108236 (= res!739239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108237 () Bool)

(assert (=> b!1108237 (= e!632443 tp_is_empty!27481)))

(assert (= (and start!97486 res!739234) b!1108230))

(assert (= (and b!1108230 res!739233) b!1108228))

(assert (= (and b!1108228 res!739243) b!1108236))

(assert (= (and b!1108236 res!739239) b!1108231))

(assert (= (and b!1108231 res!739240) b!1108233))

(assert (= (and b!1108233 res!739238) b!1108223))

(assert (= (and b!1108223 res!739237) b!1108227))

(assert (= (and b!1108227 res!739241) b!1108224))

(assert (= (and b!1108224 res!739242) b!1108232))

(assert (= (and b!1108232 res!739235) b!1108222))

(assert (= (and b!1108222 (not res!739236)) b!1108225))

(assert (= (and b!1108225 c!109421) b!1108234))

(assert (= (and b!1108225 (not c!109421)) b!1108226))

(assert (= (or b!1108234 b!1108226) bm!46424))

(assert (= (or b!1108234 b!1108226) bm!46423))

(assert (= (and b!1108235 condMapEmpty!43039) mapIsEmpty!43039))

(assert (= (and b!1108235 (not condMapEmpty!43039)) mapNonEmpty!43039))

(get-info :version)

(assert (= (and mapNonEmpty!43039 ((_ is ValueCellFull!13031) mapValue!43039)) b!1108229))

(assert (= (and b!1108235 ((_ is ValueCellFull!13031) mapDefault!43039)) b!1108237))

(assert (= start!97486 b!1108235))

(declare-fun b_lambda!18249 () Bool)

(assert (=> (not b_lambda!18249) (not bm!46424)))

(declare-fun t!34383 () Bool)

(declare-fun tb!8079 () Bool)

(assert (=> (and start!97486 (= defaultEntry!1004 defaultEntry!1004) t!34383) tb!8079))

(declare-fun result!16727 () Bool)

(assert (=> tb!8079 (= result!16727 tp_is_empty!27481)))

(assert (=> bm!46424 t!34383))

(declare-fun b_and!37285 () Bool)

(assert (= b_and!37283 (and (=> t!34383 result!16727) b_and!37285)))

(declare-fun m!1027473 () Bool)

(assert (=> b!1108236 m!1027473))

(declare-fun m!1027475 () Bool)

(assert (=> b!1108230 m!1027475))

(declare-fun m!1027477 () Bool)

(assert (=> start!97486 m!1027477))

(declare-fun m!1027479 () Bool)

(assert (=> start!97486 m!1027479))

(declare-fun m!1027481 () Bool)

(assert (=> b!1108232 m!1027481))

(declare-fun m!1027483 () Bool)

(assert (=> b!1108222 m!1027483))

(declare-fun m!1027485 () Bool)

(assert (=> b!1108222 m!1027485))

(declare-fun m!1027487 () Bool)

(assert (=> bm!46423 m!1027487))

(declare-fun m!1027489 () Bool)

(assert (=> b!1108227 m!1027489))

(declare-fun m!1027491 () Bool)

(assert (=> b!1108223 m!1027491))

(declare-fun m!1027493 () Bool)

(assert (=> b!1108234 m!1027493))

(declare-fun m!1027495 () Bool)

(assert (=> b!1108225 m!1027495))

(declare-fun m!1027497 () Bool)

(assert (=> mapNonEmpty!43039 m!1027497))

(declare-fun m!1027499 () Bool)

(assert (=> b!1108231 m!1027499))

(declare-fun m!1027501 () Bool)

(assert (=> bm!46424 m!1027501))

(declare-fun m!1027503 () Bool)

(assert (=> bm!46424 m!1027503))

(declare-fun m!1027505 () Bool)

(assert (=> bm!46424 m!1027505))

(declare-fun m!1027507 () Bool)

(assert (=> b!1108224 m!1027507))

(declare-fun m!1027509 () Bool)

(assert (=> b!1108224 m!1027509))

(check-sat b_and!37285 tp_is_empty!27481 (not bm!46423) (not mapNonEmpty!43039) (not b_lambda!18249) (not b!1108223) (not b_next!23221) (not b!1108234) (not b!1108231) (not b!1108236) (not b!1108230) (not b!1108224) (not start!97486) (not b!1108232) (not b!1108222) (not b!1108225) (not bm!46424))
(check-sat b_and!37285 (not b_next!23221))
