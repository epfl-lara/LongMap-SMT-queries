; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97426 () Bool)

(assert start!97426)

(declare-fun b_free!23397 () Bool)

(declare-fun b_next!23397 () Bool)

(assert (=> start!97426 (= b_free!23397 (not b_next!23397))))

(declare-fun tp!82490 () Bool)

(declare-fun b_and!37631 () Bool)

(assert (=> start!97426 (= tp!82490 b_and!37631)))

(declare-fun mapIsEmpty!43303 () Bool)

(declare-fun mapRes!43303 () Bool)

(assert (=> mapIsEmpty!43303 mapRes!43303))

(declare-fun b!1111331 () Bool)

(declare-fun res!741625 () Bool)

(declare-fun e!633723 () Bool)

(assert (=> b!1111331 (=> (not res!741625) (not e!633723))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((array!72231 0))(
  ( (array!72232 (arr!34768 (Array (_ BitVec 32) (_ BitVec 64))) (size!35304 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72231)

(assert (=> b!1111331 (= res!741625 (= (select (arr!34768 _keys!1208) i!673) k0!934))))

(declare-fun b!1111333 () Bool)

(declare-fun e!633720 () Bool)

(assert (=> b!1111333 (= e!633720 true)))

(declare-fun e!633718 () Bool)

(assert (=> b!1111333 e!633718))

(declare-fun c!109293 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1111333 (= c!109293 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42003 0))(
  ( (V!42004 (val!13885 Int)) )
))
(declare-fun zeroValue!944 () V!42003)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36472 0))(
  ( (Unit!36473) )
))
(declare-fun lt!496323 () Unit!36472)

(declare-datatypes ((ValueCell!13119 0))(
  ( (ValueCellFull!13119 (v!16518 V!42003)) (EmptyCell!13119) )
))
(declare-datatypes ((array!72233 0))(
  ( (array!72234 (arr!34769 (Array (_ BitVec 32) ValueCell!13119)) (size!35305 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72233)

(declare-fun minValue!944 () V!42003)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!302 (array!72231 array!72233 (_ BitVec 32) (_ BitVec 32) V!42003 V!42003 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36472)

(assert (=> b!1111333 (= lt!496323 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!302 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111334 () Bool)

(declare-fun res!741617 () Bool)

(assert (=> b!1111334 (=> (not res!741617) (not e!633723))))

(assert (=> b!1111334 (= res!741617 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35304 _keys!1208))))))

(declare-fun b!1111335 () Bool)

(declare-fun e!633721 () Bool)

(assert (=> b!1111335 (= e!633723 e!633721)))

(declare-fun res!741619 () Bool)

(assert (=> b!1111335 (=> (not res!741619) (not e!633721))))

(declare-fun lt!496325 () array!72231)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72231 (_ BitVec 32)) Bool)

(assert (=> b!1111335 (= res!741619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496325 mask!1564))))

(assert (=> b!1111335 (= lt!496325 (array!72232 (store (arr!34768 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35304 _keys!1208)))))

(declare-fun b!1111336 () Bool)

(declare-fun res!741620 () Bool)

(assert (=> b!1111336 (=> (not res!741620) (not e!633723))))

(assert (=> b!1111336 (= res!741620 (and (= (size!35305 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35304 _keys!1208) (size!35305 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111337 () Bool)

(declare-datatypes ((tuple2!17572 0))(
  ( (tuple2!17573 (_1!8797 (_ BitVec 64)) (_2!8797 V!42003)) )
))
(declare-datatypes ((List!24255 0))(
  ( (Nil!24252) (Cons!24251 (h!25460 tuple2!17572) (t!34698 List!24255)) )
))
(declare-datatypes ((ListLongMap!15541 0))(
  ( (ListLongMap!15542 (toList!7786 List!24255)) )
))
(declare-fun call!46888 () ListLongMap!15541)

(declare-fun call!46887 () ListLongMap!15541)

(declare-fun -!1055 (ListLongMap!15541 (_ BitVec 64)) ListLongMap!15541)

(assert (=> b!1111337 (= e!633718 (= call!46887 (-!1055 call!46888 k0!934)))))

(declare-fun b!1111338 () Bool)

(declare-fun res!741623 () Bool)

(assert (=> b!1111338 (=> (not res!741623) (not e!633723))))

(declare-datatypes ((List!24256 0))(
  ( (Nil!24253) (Cons!24252 (h!25461 (_ BitVec 64)) (t!34699 List!24256)) )
))
(declare-fun arrayNoDuplicates!0 (array!72231 (_ BitVec 32) List!24256) Bool)

(assert (=> b!1111338 (= res!741623 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24253))))

(declare-fun b!1111339 () Bool)

(assert (=> b!1111339 (= e!633718 (= call!46887 call!46888))))

(declare-fun b!1111340 () Bool)

(declare-fun res!741621 () Bool)

(assert (=> b!1111340 (=> (not res!741621) (not e!633721))))

(assert (=> b!1111340 (= res!741621 (arrayNoDuplicates!0 lt!496325 #b00000000000000000000000000000000 Nil!24253))))

(declare-fun b!1111341 () Bool)

(declare-fun res!741615 () Bool)

(assert (=> b!1111341 (=> (not res!741615) (not e!633723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111341 (= res!741615 (validMask!0 mask!1564))))

(declare-fun b!1111342 () Bool)

(declare-fun res!741616 () Bool)

(assert (=> b!1111342 (=> (not res!741616) (not e!633723))))

(assert (=> b!1111342 (= res!741616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!46884 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4278 (array!72231 array!72233 (_ BitVec 32) (_ BitVec 32) V!42003 V!42003 (_ BitVec 32) Int) ListLongMap!15541)

(assert (=> bm!46884 (= call!46888 (getCurrentListMapNoExtraKeys!4278 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46885 () Bool)

(declare-fun dynLambda!2405 (Int (_ BitVec 64)) V!42003)

(assert (=> bm!46885 (= call!46887 (getCurrentListMapNoExtraKeys!4278 lt!496325 (array!72234 (store (arr!34769 _values!996) i!673 (ValueCellFull!13119 (dynLambda!2405 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35305 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111332 () Bool)

(assert (=> b!1111332 (= e!633721 (not e!633720))))

(declare-fun res!741624 () Bool)

(assert (=> b!1111332 (=> res!741624 e!633720)))

(assert (=> b!1111332 (= res!741624 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35304 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111332 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496324 () Unit!36472)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72231 (_ BitVec 64) (_ BitVec 32)) Unit!36472)

(assert (=> b!1111332 (= lt!496324 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!741618 () Bool)

(assert (=> start!97426 (=> (not res!741618) (not e!633723))))

(assert (=> start!97426 (= res!741618 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35304 _keys!1208))))))

(assert (=> start!97426 e!633723))

(declare-fun tp_is_empty!27657 () Bool)

(assert (=> start!97426 tp_is_empty!27657))

(declare-fun array_inv!26744 (array!72231) Bool)

(assert (=> start!97426 (array_inv!26744 _keys!1208)))

(assert (=> start!97426 true))

(assert (=> start!97426 tp!82490))

(declare-fun e!633722 () Bool)

(declare-fun array_inv!26745 (array!72233) Bool)

(assert (=> start!97426 (and (array_inv!26745 _values!996) e!633722)))

(declare-fun b!1111343 () Bool)

(declare-fun e!633719 () Bool)

(assert (=> b!1111343 (= e!633719 tp_is_empty!27657)))

(declare-fun mapNonEmpty!43303 () Bool)

(declare-fun tp!82489 () Bool)

(declare-fun e!633716 () Bool)

(assert (=> mapNonEmpty!43303 (= mapRes!43303 (and tp!82489 e!633716))))

(declare-fun mapKey!43303 () (_ BitVec 32))

(declare-fun mapValue!43303 () ValueCell!13119)

(declare-fun mapRest!43303 () (Array (_ BitVec 32) ValueCell!13119))

(assert (=> mapNonEmpty!43303 (= (arr!34769 _values!996) (store mapRest!43303 mapKey!43303 mapValue!43303))))

(declare-fun b!1111344 () Bool)

(assert (=> b!1111344 (= e!633722 (and e!633719 mapRes!43303))))

(declare-fun condMapEmpty!43303 () Bool)

(declare-fun mapDefault!43303 () ValueCell!13119)

(assert (=> b!1111344 (= condMapEmpty!43303 (= (arr!34769 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13119)) mapDefault!43303)))))

(declare-fun b!1111345 () Bool)

(declare-fun res!741622 () Bool)

(assert (=> b!1111345 (=> (not res!741622) (not e!633723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111345 (= res!741622 (validKeyInArray!0 k0!934))))

(declare-fun b!1111346 () Bool)

(assert (=> b!1111346 (= e!633716 tp_is_empty!27657)))

(assert (= (and start!97426 res!741618) b!1111341))

(assert (= (and b!1111341 res!741615) b!1111336))

(assert (= (and b!1111336 res!741620) b!1111342))

(assert (= (and b!1111342 res!741616) b!1111338))

(assert (= (and b!1111338 res!741623) b!1111334))

(assert (= (and b!1111334 res!741617) b!1111345))

(assert (= (and b!1111345 res!741622) b!1111331))

(assert (= (and b!1111331 res!741625) b!1111335))

(assert (= (and b!1111335 res!741619) b!1111340))

(assert (= (and b!1111340 res!741621) b!1111332))

(assert (= (and b!1111332 (not res!741624)) b!1111333))

(assert (= (and b!1111333 c!109293) b!1111337))

(assert (= (and b!1111333 (not c!109293)) b!1111339))

(assert (= (or b!1111337 b!1111339) bm!46884))

(assert (= (or b!1111337 b!1111339) bm!46885))

(assert (= (and b!1111344 condMapEmpty!43303) mapIsEmpty!43303))

(assert (= (and b!1111344 (not condMapEmpty!43303)) mapNonEmpty!43303))

(get-info :version)

(assert (= (and mapNonEmpty!43303 ((_ is ValueCellFull!13119) mapValue!43303)) b!1111346))

(assert (= (and b!1111344 ((_ is ValueCellFull!13119) mapDefault!43303)) b!1111343))

(assert (= start!97426 b!1111344))

(declare-fun b_lambda!18421 () Bool)

(assert (=> (not b_lambda!18421) (not bm!46885)))

(declare-fun t!34697 () Bool)

(declare-fun tb!8263 () Bool)

(assert (=> (and start!97426 (= defaultEntry!1004 defaultEntry!1004) t!34697) tb!8263))

(declare-fun result!17087 () Bool)

(assert (=> tb!8263 (= result!17087 tp_is_empty!27657)))

(assert (=> bm!46885 t!34697))

(declare-fun b_and!37633 () Bool)

(assert (= b_and!37631 (and (=> t!34697 result!17087) b_and!37633)))

(declare-fun m!1029145 () Bool)

(assert (=> b!1111335 m!1029145))

(declare-fun m!1029147 () Bool)

(assert (=> b!1111335 m!1029147))

(declare-fun m!1029149 () Bool)

(assert (=> b!1111337 m!1029149))

(declare-fun m!1029151 () Bool)

(assert (=> b!1111332 m!1029151))

(declare-fun m!1029153 () Bool)

(assert (=> b!1111332 m!1029153))

(declare-fun m!1029155 () Bool)

(assert (=> bm!46884 m!1029155))

(declare-fun m!1029157 () Bool)

(assert (=> b!1111345 m!1029157))

(declare-fun m!1029159 () Bool)

(assert (=> bm!46885 m!1029159))

(declare-fun m!1029161 () Bool)

(assert (=> bm!46885 m!1029161))

(declare-fun m!1029163 () Bool)

(assert (=> bm!46885 m!1029163))

(declare-fun m!1029165 () Bool)

(assert (=> start!97426 m!1029165))

(declare-fun m!1029167 () Bool)

(assert (=> start!97426 m!1029167))

(declare-fun m!1029169 () Bool)

(assert (=> b!1111340 m!1029169))

(declare-fun m!1029171 () Bool)

(assert (=> b!1111341 m!1029171))

(declare-fun m!1029173 () Bool)

(assert (=> mapNonEmpty!43303 m!1029173))

(declare-fun m!1029175 () Bool)

(assert (=> b!1111338 m!1029175))

(declare-fun m!1029177 () Bool)

(assert (=> b!1111331 m!1029177))

(declare-fun m!1029179 () Bool)

(assert (=> b!1111342 m!1029179))

(declare-fun m!1029181 () Bool)

(assert (=> b!1111333 m!1029181))

(check-sat (not b!1111332) (not b!1111335) tp_is_empty!27657 (not b!1111340) (not b!1111338) (not start!97426) (not bm!46884) (not b!1111341) (not bm!46885) (not b_lambda!18421) (not b!1111333) b_and!37633 (not b!1111337) (not b!1111342) (not mapNonEmpty!43303) (not b!1111345) (not b_next!23397))
(check-sat b_and!37633 (not b_next!23397))
