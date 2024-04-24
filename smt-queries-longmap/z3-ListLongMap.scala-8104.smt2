; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99726 () Bool)

(assert start!99726)

(declare-fun b_free!25069 () Bool)

(declare-fun b_next!25069 () Bool)

(assert (=> start!99726 (= b_free!25069 (not b_next!25069))))

(declare-fun tp!87920 () Bool)

(declare-fun b_and!41007 () Bool)

(assert (=> start!99726 (= tp!87920 b_and!41007)))

(declare-fun mapIsEmpty!46226 () Bool)

(declare-fun mapRes!46226 () Bool)

(assert (=> mapIsEmpty!46226 mapRes!46226))

(declare-fun b!1177374 () Bool)

(declare-fun e!669356 () Bool)

(declare-fun e!669355 () Bool)

(assert (=> b!1177374 (= e!669356 e!669355)))

(declare-fun res!781634 () Bool)

(assert (=> b!1177374 (=> (not res!781634) (not e!669355))))

(declare-datatypes ((array!76057 0))(
  ( (array!76058 (arr!36672 (Array (_ BitVec 32) (_ BitVec 64))) (size!37209 (_ BitVec 32))) )
))
(declare-fun lt!531207 () array!76057)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76057 (_ BitVec 32)) Bool)

(assert (=> b!1177374 (= res!781634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531207 mask!1564))))

(declare-fun _keys!1208 () array!76057)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177374 (= lt!531207 (array!76058 (store (arr!36672 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37209 _keys!1208)))))

(declare-fun b!1177375 () Bool)

(declare-fun res!781629 () Bool)

(assert (=> b!1177375 (=> (not res!781629) (not e!669356))))

(declare-datatypes ((List!25776 0))(
  ( (Nil!25773) (Cons!25772 (h!26990 (_ BitVec 64)) (t!37829 List!25776)) )
))
(declare-fun arrayNoDuplicates!0 (array!76057 (_ BitVec 32) List!25776) Bool)

(assert (=> b!1177375 (= res!781629 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25773))))

(declare-fun b!1177376 () Bool)

(declare-fun e!669358 () Bool)

(declare-fun tp_is_empty!29599 () Bool)

(assert (=> b!1177376 (= e!669358 tp_is_empty!29599)))

(declare-fun e!669353 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1177377 () Bool)

(declare-fun arrayContainsKey!0 (array!76057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177377 (= e!669353 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177378 () Bool)

(declare-fun e!669362 () Bool)

(assert (=> b!1177378 (= e!669355 (not e!669362))))

(declare-fun res!781624 () Bool)

(assert (=> b!1177378 (=> res!781624 e!669362)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1177378 (= res!781624 (bvsgt from!1455 i!673))))

(assert (=> b!1177378 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38820 0))(
  ( (Unit!38821) )
))
(declare-fun lt!531205 () Unit!38820)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76057 (_ BitVec 64) (_ BitVec 32)) Unit!38820)

(assert (=> b!1177378 (= lt!531205 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-datatypes ((V!44593 0))(
  ( (V!44594 (val!14856 Int)) )
))
(declare-datatypes ((tuple2!19044 0))(
  ( (tuple2!19045 (_1!9533 (_ BitVec 64)) (_2!9533 V!44593)) )
))
(declare-datatypes ((List!25777 0))(
  ( (Nil!25774) (Cons!25773 (h!26991 tuple2!19044) (t!37830 List!25777)) )
))
(declare-datatypes ((ListLongMap!17021 0))(
  ( (ListLongMap!17022 (toList!8526 List!25777)) )
))
(declare-fun lt!531212 () ListLongMap!17021)

(declare-fun e!669361 () Bool)

(declare-fun b!1177379 () Bool)

(declare-fun lt!531213 () ListLongMap!17021)

(declare-fun lt!531210 () tuple2!19044)

(declare-fun +!3856 (ListLongMap!17021 tuple2!19044) ListLongMap!17021)

(assert (=> b!1177379 (= e!669361 (= lt!531213 (+!3856 lt!531212 lt!531210)))))

(declare-fun b!1177380 () Bool)

(declare-fun e!669360 () Unit!38820)

(declare-fun Unit!38822 () Unit!38820)

(assert (=> b!1177380 (= e!669360 Unit!38822)))

(declare-fun lt!531208 () Unit!38820)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76057 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38820)

(assert (=> b!1177380 (= lt!531208 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177380 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531203 () Unit!38820)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76057 (_ BitVec 32) (_ BitVec 32)) Unit!38820)

(assert (=> b!1177380 (= lt!531203 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177380 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25773)))

(declare-fun lt!531217 () Unit!38820)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76057 (_ BitVec 64) (_ BitVec 32) List!25776) Unit!38820)

(assert (=> b!1177380 (= lt!531217 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25773))))

(assert (=> b!1177380 false))

(declare-fun res!781637 () Bool)

(assert (=> start!99726 (=> (not res!781637) (not e!669356))))

(assert (=> start!99726 (= res!781637 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37209 _keys!1208))))))

(assert (=> start!99726 e!669356))

(assert (=> start!99726 tp_is_empty!29599))

(declare-fun array_inv!28088 (array!76057) Bool)

(assert (=> start!99726 (array_inv!28088 _keys!1208)))

(assert (=> start!99726 true))

(assert (=> start!99726 tp!87920))

(declare-datatypes ((ValueCell!14090 0))(
  ( (ValueCellFull!14090 (v!17490 V!44593)) (EmptyCell!14090) )
))
(declare-datatypes ((array!76059 0))(
  ( (array!76060 (arr!36673 (Array (_ BitVec 32) ValueCell!14090)) (size!37210 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76059)

(declare-fun e!669365 () Bool)

(declare-fun array_inv!28089 (array!76059) Bool)

(assert (=> start!99726 (and (array_inv!28089 _values!996) e!669365)))

(declare-fun mapNonEmpty!46226 () Bool)

(declare-fun tp!87921 () Bool)

(declare-fun e!669364 () Bool)

(assert (=> mapNonEmpty!46226 (= mapRes!46226 (and tp!87921 e!669364))))

(declare-fun mapKey!46226 () (_ BitVec 32))

(declare-fun mapRest!46226 () (Array (_ BitVec 32) ValueCell!14090))

(declare-fun mapValue!46226 () ValueCell!14090)

(assert (=> mapNonEmpty!46226 (= (arr!36673 _values!996) (store mapRest!46226 mapKey!46226 mapValue!46226))))

(declare-fun b!1177381 () Bool)

(declare-fun e!669357 () Bool)

(assert (=> b!1177381 (= e!669357 true)))

(assert (=> b!1177381 e!669361))

(declare-fun res!781636 () Bool)

(assert (=> b!1177381 (=> (not res!781636) (not e!669361))))

(assert (=> b!1177381 (= res!781636 (not (= (select (arr!36672 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531211 () Unit!38820)

(assert (=> b!1177381 (= lt!531211 e!669360)))

(declare-fun c!117125 () Bool)

(assert (=> b!1177381 (= c!117125 (= (select (arr!36672 _keys!1208) from!1455) k0!934))))

(declare-fun e!669363 () Bool)

(assert (=> b!1177381 e!669363))

(declare-fun res!781628 () Bool)

(assert (=> b!1177381 (=> (not res!781628) (not e!669363))))

(declare-fun lt!531204 () ListLongMap!17021)

(declare-fun lt!531206 () ListLongMap!17021)

(assert (=> b!1177381 (= res!781628 (= lt!531206 (+!3856 lt!531204 lt!531210)))))

(declare-fun lt!531216 () V!44593)

(declare-fun get!18764 (ValueCell!14090 V!44593) V!44593)

(assert (=> b!1177381 (= lt!531210 (tuple2!19045 (select (arr!36672 _keys!1208) from!1455) (get!18764 (select (arr!36673 _values!996) from!1455) lt!531216)))))

(declare-fun b!1177382 () Bool)

(declare-fun Unit!38823 () Unit!38820)

(assert (=> b!1177382 (= e!669360 Unit!38823)))

(declare-fun b!1177383 () Bool)

(declare-fun res!781633 () Bool)

(assert (=> b!1177383 (=> (not res!781633) (not e!669356))))

(assert (=> b!1177383 (= res!781633 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37209 _keys!1208))))))

(declare-fun b!1177384 () Bool)

(declare-fun e!669359 () Bool)

(assert (=> b!1177384 (= e!669362 e!669359)))

(declare-fun res!781622 () Bool)

(assert (=> b!1177384 (=> res!781622 e!669359)))

(assert (=> b!1177384 (= res!781622 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44593)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!531215 () array!76059)

(declare-fun minValue!944 () V!44593)

(declare-fun getCurrentListMapNoExtraKeys!5008 (array!76057 array!76059 (_ BitVec 32) (_ BitVec 32) V!44593 V!44593 (_ BitVec 32) Int) ListLongMap!17021)

(assert (=> b!1177384 (= lt!531206 (getCurrentListMapNoExtraKeys!5008 lt!531207 lt!531215 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1177384 (= lt!531215 (array!76060 (store (arr!36673 _values!996) i!673 (ValueCellFull!14090 lt!531216)) (size!37210 _values!996)))))

(declare-fun dynLambda!2983 (Int (_ BitVec 64)) V!44593)

(assert (=> b!1177384 (= lt!531216 (dynLambda!2983 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1177384 (= lt!531213 (getCurrentListMapNoExtraKeys!5008 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177385 () Bool)

(assert (=> b!1177385 (= e!669365 (and e!669358 mapRes!46226))))

(declare-fun condMapEmpty!46226 () Bool)

(declare-fun mapDefault!46226 () ValueCell!14090)

(assert (=> b!1177385 (= condMapEmpty!46226 (= (arr!36673 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14090)) mapDefault!46226)))))

(declare-fun b!1177386 () Bool)

(declare-fun res!781625 () Bool)

(assert (=> b!1177386 (=> (not res!781625) (not e!669356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177386 (= res!781625 (validMask!0 mask!1564))))

(declare-fun b!1177387 () Bool)

(assert (=> b!1177387 (= e!669364 tp_is_empty!29599)))

(declare-fun b!1177388 () Bool)

(declare-fun res!781632 () Bool)

(assert (=> b!1177388 (=> (not res!781632) (not e!669356))))

(assert (=> b!1177388 (= res!781632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177389 () Bool)

(declare-fun res!781630 () Bool)

(assert (=> b!1177389 (=> (not res!781630) (not e!669356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177389 (= res!781630 (validKeyInArray!0 k0!934))))

(declare-fun b!1177390 () Bool)

(assert (=> b!1177390 (= e!669363 e!669353)))

(declare-fun res!781635 () Bool)

(assert (=> b!1177390 (=> res!781635 e!669353)))

(assert (=> b!1177390 (= res!781635 (not (= (select (arr!36672 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1177391 () Bool)

(assert (=> b!1177391 (= e!669359 e!669357)))

(declare-fun res!781631 () Bool)

(assert (=> b!1177391 (=> res!781631 e!669357)))

(assert (=> b!1177391 (= res!781631 (not (validKeyInArray!0 (select (arr!36672 _keys!1208) from!1455))))))

(declare-fun lt!531209 () ListLongMap!17021)

(assert (=> b!1177391 (= lt!531209 lt!531204)))

(declare-fun -!1567 (ListLongMap!17021 (_ BitVec 64)) ListLongMap!17021)

(assert (=> b!1177391 (= lt!531204 (-!1567 lt!531212 k0!934))))

(assert (=> b!1177391 (= lt!531209 (getCurrentListMapNoExtraKeys!5008 lt!531207 lt!531215 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177391 (= lt!531212 (getCurrentListMapNoExtraKeys!5008 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531214 () Unit!38820)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!792 (array!76057 array!76059 (_ BitVec 32) (_ BitVec 32) V!44593 V!44593 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38820)

(assert (=> b!1177391 (= lt!531214 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!792 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177392 () Bool)

(declare-fun res!781626 () Bool)

(assert (=> b!1177392 (=> (not res!781626) (not e!669355))))

(assert (=> b!1177392 (= res!781626 (arrayNoDuplicates!0 lt!531207 #b00000000000000000000000000000000 Nil!25773))))

(declare-fun b!1177393 () Bool)

(declare-fun res!781627 () Bool)

(assert (=> b!1177393 (=> (not res!781627) (not e!669356))))

(assert (=> b!1177393 (= res!781627 (and (= (size!37210 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37209 _keys!1208) (size!37210 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177394 () Bool)

(declare-fun res!781623 () Bool)

(assert (=> b!1177394 (=> (not res!781623) (not e!669356))))

(assert (=> b!1177394 (= res!781623 (= (select (arr!36672 _keys!1208) i!673) k0!934))))

(assert (= (and start!99726 res!781637) b!1177386))

(assert (= (and b!1177386 res!781625) b!1177393))

(assert (= (and b!1177393 res!781627) b!1177388))

(assert (= (and b!1177388 res!781632) b!1177375))

(assert (= (and b!1177375 res!781629) b!1177383))

(assert (= (and b!1177383 res!781633) b!1177389))

(assert (= (and b!1177389 res!781630) b!1177394))

(assert (= (and b!1177394 res!781623) b!1177374))

(assert (= (and b!1177374 res!781634) b!1177392))

(assert (= (and b!1177392 res!781626) b!1177378))

(assert (= (and b!1177378 (not res!781624)) b!1177384))

(assert (= (and b!1177384 (not res!781622)) b!1177391))

(assert (= (and b!1177391 (not res!781631)) b!1177381))

(assert (= (and b!1177381 res!781628) b!1177390))

(assert (= (and b!1177390 (not res!781635)) b!1177377))

(assert (= (and b!1177381 c!117125) b!1177380))

(assert (= (and b!1177381 (not c!117125)) b!1177382))

(assert (= (and b!1177381 res!781636) b!1177379))

(assert (= (and b!1177385 condMapEmpty!46226) mapIsEmpty!46226))

(assert (= (and b!1177385 (not condMapEmpty!46226)) mapNonEmpty!46226))

(get-info :version)

(assert (= (and mapNonEmpty!46226 ((_ is ValueCellFull!14090) mapValue!46226)) b!1177387))

(assert (= (and b!1177385 ((_ is ValueCellFull!14090) mapDefault!46226)) b!1177376))

(assert (= start!99726 b!1177385))

(declare-fun b_lambda!20207 () Bool)

(assert (=> (not b_lambda!20207) (not b!1177384)))

(declare-fun t!37828 () Bool)

(declare-fun tb!9873 () Bool)

(assert (=> (and start!99726 (= defaultEntry!1004 defaultEntry!1004) t!37828) tb!9873))

(declare-fun result!20321 () Bool)

(assert (=> tb!9873 (= result!20321 tp_is_empty!29599)))

(assert (=> b!1177384 t!37828))

(declare-fun b_and!41009 () Bool)

(assert (= b_and!41007 (and (=> t!37828 result!20321) b_and!41009)))

(declare-fun m!1085583 () Bool)

(assert (=> b!1177391 m!1085583))

(declare-fun m!1085585 () Bool)

(assert (=> b!1177391 m!1085585))

(declare-fun m!1085587 () Bool)

(assert (=> b!1177391 m!1085587))

(declare-fun m!1085589 () Bool)

(assert (=> b!1177391 m!1085589))

(declare-fun m!1085591 () Bool)

(assert (=> b!1177391 m!1085591))

(declare-fun m!1085593 () Bool)

(assert (=> b!1177391 m!1085593))

(assert (=> b!1177391 m!1085591))

(declare-fun m!1085595 () Bool)

(assert (=> b!1177392 m!1085595))

(declare-fun m!1085597 () Bool)

(assert (=> mapNonEmpty!46226 m!1085597))

(declare-fun m!1085599 () Bool)

(assert (=> b!1177375 m!1085599))

(declare-fun m!1085601 () Bool)

(assert (=> start!99726 m!1085601))

(declare-fun m!1085603 () Bool)

(assert (=> start!99726 m!1085603))

(assert (=> b!1177390 m!1085591))

(declare-fun m!1085605 () Bool)

(assert (=> b!1177389 m!1085605))

(declare-fun m!1085607 () Bool)

(assert (=> b!1177380 m!1085607))

(declare-fun m!1085609 () Bool)

(assert (=> b!1177380 m!1085609))

(declare-fun m!1085611 () Bool)

(assert (=> b!1177380 m!1085611))

(declare-fun m!1085613 () Bool)

(assert (=> b!1177380 m!1085613))

(declare-fun m!1085615 () Bool)

(assert (=> b!1177380 m!1085615))

(declare-fun m!1085617 () Bool)

(assert (=> b!1177384 m!1085617))

(declare-fun m!1085619 () Bool)

(assert (=> b!1177384 m!1085619))

(declare-fun m!1085621 () Bool)

(assert (=> b!1177384 m!1085621))

(declare-fun m!1085623 () Bool)

(assert (=> b!1177384 m!1085623))

(declare-fun m!1085625 () Bool)

(assert (=> b!1177379 m!1085625))

(declare-fun m!1085627 () Bool)

(assert (=> b!1177386 m!1085627))

(declare-fun m!1085629 () Bool)

(assert (=> b!1177377 m!1085629))

(declare-fun m!1085631 () Bool)

(assert (=> b!1177394 m!1085631))

(assert (=> b!1177381 m!1085591))

(declare-fun m!1085633 () Bool)

(assert (=> b!1177381 m!1085633))

(declare-fun m!1085635 () Bool)

(assert (=> b!1177381 m!1085635))

(assert (=> b!1177381 m!1085635))

(declare-fun m!1085637 () Bool)

(assert (=> b!1177381 m!1085637))

(declare-fun m!1085639 () Bool)

(assert (=> b!1177378 m!1085639))

(declare-fun m!1085641 () Bool)

(assert (=> b!1177378 m!1085641))

(declare-fun m!1085643 () Bool)

(assert (=> b!1177374 m!1085643))

(declare-fun m!1085645 () Bool)

(assert (=> b!1177374 m!1085645))

(declare-fun m!1085647 () Bool)

(assert (=> b!1177388 m!1085647))

(check-sat (not start!99726) (not b!1177379) (not b!1177392) (not b_next!25069) b_and!41009 (not b!1177380) (not b!1177374) (not b!1177378) (not b!1177388) (not b!1177384) (not b!1177377) (not b!1177386) (not b_lambda!20207) (not b!1177389) (not b!1177381) tp_is_empty!29599 (not mapNonEmpty!46226) (not b!1177391) (not b!1177375))
(check-sat b_and!41009 (not b_next!25069))
