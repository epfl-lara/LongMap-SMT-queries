; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98072 () Bool)

(assert start!98072)

(declare-fun b_free!23779 () Bool)

(declare-fun b_next!23779 () Bool)

(assert (=> start!98072 (= b_free!23779 (not b_next!23779))))

(declare-fun tp!84041 () Bool)

(declare-fun b_and!38319 () Bool)

(assert (=> start!98072 (= tp!84041 b_and!38319)))

(declare-fun b!1126273 () Bool)

(declare-fun res!752629 () Bool)

(declare-fun e!641068 () Bool)

(assert (=> b!1126273 (=> (not res!752629) (not e!641068))))

(declare-datatypes ((array!73406 0))(
  ( (array!73407 (arr!35356 (Array (_ BitVec 32) (_ BitVec 64))) (size!35894 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73406)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1126273 (= res!752629 (= (select (arr!35356 _keys!1208) i!673) k0!934))))

(declare-fun b!1126274 () Bool)

(declare-fun res!752623 () Bool)

(declare-fun e!641073 () Bool)

(assert (=> b!1126274 (=> (not res!752623) (not e!641073))))

(declare-fun lt!500011 () array!73406)

(declare-datatypes ((List!24718 0))(
  ( (Nil!24715) (Cons!24714 (h!25923 (_ BitVec 64)) (t!35480 List!24718)) )
))
(declare-fun arrayNoDuplicates!0 (array!73406 (_ BitVec 32) List!24718) Bool)

(assert (=> b!1126274 (= res!752623 (arrayNoDuplicates!0 lt!500011 #b00000000000000000000000000000000 Nil!24715))))

(declare-fun b!1126275 () Bool)

(declare-fun e!641071 () Bool)

(declare-fun e!641074 () Bool)

(assert (=> b!1126275 (= e!641071 e!641074)))

(declare-fun res!752628 () Bool)

(assert (=> b!1126275 (=> res!752628 e!641074)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1126275 (= res!752628 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42873 0))(
  ( (V!42874 (val!14211 Int)) )
))
(declare-fun zeroValue!944 () V!42873)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!17960 0))(
  ( (tuple2!17961 (_1!8991 (_ BitVec 64)) (_2!8991 V!42873)) )
))
(declare-datatypes ((List!24719 0))(
  ( (Nil!24716) (Cons!24715 (h!25924 tuple2!17960) (t!35481 List!24719)) )
))
(declare-datatypes ((ListLongMap!15929 0))(
  ( (ListLongMap!15930 (toList!7980 List!24719)) )
))
(declare-fun lt!500010 () ListLongMap!15929)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13445 0))(
  ( (ValueCellFull!13445 (v!16843 V!42873)) (EmptyCell!13445) )
))
(declare-datatypes ((array!73408 0))(
  ( (array!73409 (arr!35357 (Array (_ BitVec 32) ValueCell!13445)) (size!35895 (_ BitVec 32))) )
))
(declare-fun lt!500016 () array!73408)

(declare-fun minValue!944 () V!42873)

(declare-fun getCurrentListMapNoExtraKeys!4481 (array!73406 array!73408 (_ BitVec 32) (_ BitVec 32) V!42873 V!42873 (_ BitVec 32) Int) ListLongMap!15929)

(assert (=> b!1126275 (= lt!500010 (getCurrentListMapNoExtraKeys!4481 lt!500011 lt!500016 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73408)

(declare-fun dynLambda!2498 (Int (_ BitVec 64)) V!42873)

(assert (=> b!1126275 (= lt!500016 (array!73409 (store (arr!35357 _values!996) i!673 (ValueCellFull!13445 (dynLambda!2498 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35895 _values!996)))))

(declare-fun lt!500015 () ListLongMap!15929)

(assert (=> b!1126275 (= lt!500015 (getCurrentListMapNoExtraKeys!4481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126276 () Bool)

(declare-fun e!641069 () Bool)

(declare-fun e!641067 () Bool)

(declare-fun mapRes!44281 () Bool)

(assert (=> b!1126276 (= e!641069 (and e!641067 mapRes!44281))))

(declare-fun condMapEmpty!44281 () Bool)

(declare-fun mapDefault!44281 () ValueCell!13445)

(assert (=> b!1126276 (= condMapEmpty!44281 (= (arr!35357 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13445)) mapDefault!44281)))))

(declare-fun b!1126277 () Bool)

(declare-fun e!641070 () Bool)

(declare-fun tp_is_empty!28309 () Bool)

(assert (=> b!1126277 (= e!641070 tp_is_empty!28309)))

(declare-fun b!1126278 () Bool)

(declare-fun e!641072 () Bool)

(assert (=> b!1126278 (= e!641072 true)))

(declare-fun lt!500014 () Bool)

(declare-fun contains!6444 (ListLongMap!15929 (_ BitVec 64)) Bool)

(assert (=> b!1126278 (= lt!500014 (contains!6444 (getCurrentListMapNoExtraKeys!4481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1126279 () Bool)

(assert (=> b!1126279 (= e!641074 e!641072)))

(declare-fun res!752630 () Bool)

(assert (=> b!1126279 (=> res!752630 e!641072)))

(assert (=> b!1126279 (= res!752630 (not (= (select (arr!35356 _keys!1208) from!1455) k0!934)))))

(declare-fun e!641075 () Bool)

(assert (=> b!1126279 e!641075))

(declare-fun c!109632 () Bool)

(assert (=> b!1126279 (= c!109632 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36765 0))(
  ( (Unit!36766) )
))
(declare-fun lt!500013 () Unit!36765)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!388 (array!73406 array!73408 (_ BitVec 32) (_ BitVec 32) V!42873 V!42873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36765)

(assert (=> b!1126279 (= lt!500013 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!388 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126280 () Bool)

(declare-fun res!752625 () Bool)

(assert (=> b!1126280 (=> (not res!752625) (not e!641068))))

(assert (=> b!1126280 (= res!752625 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24715))))

(declare-fun b!1126281 () Bool)

(assert (=> b!1126281 (= e!641068 e!641073)))

(declare-fun res!752635 () Bool)

(assert (=> b!1126281 (=> (not res!752635) (not e!641073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73406 (_ BitVec 32)) Bool)

(assert (=> b!1126281 (= res!752635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500011 mask!1564))))

(assert (=> b!1126281 (= lt!500011 (array!73407 (store (arr!35356 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35894 _keys!1208)))))

(declare-fun b!1126282 () Bool)

(declare-fun res!752631 () Bool)

(assert (=> b!1126282 (=> (not res!752631) (not e!641068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126282 (= res!752631 (validKeyInArray!0 k0!934))))

(declare-fun res!752627 () Bool)

(assert (=> start!98072 (=> (not res!752627) (not e!641068))))

(assert (=> start!98072 (= res!752627 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35894 _keys!1208))))))

(assert (=> start!98072 e!641068))

(assert (=> start!98072 tp_is_empty!28309))

(declare-fun array_inv!27210 (array!73406) Bool)

(assert (=> start!98072 (array_inv!27210 _keys!1208)))

(assert (=> start!98072 true))

(assert (=> start!98072 tp!84041))

(declare-fun array_inv!27211 (array!73408) Bool)

(assert (=> start!98072 (and (array_inv!27211 _values!996) e!641069)))

(declare-fun bm!47593 () Bool)

(declare-fun call!47596 () ListLongMap!15929)

(assert (=> bm!47593 (= call!47596 (getCurrentListMapNoExtraKeys!4481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126283 () Bool)

(declare-fun res!752634 () Bool)

(assert (=> b!1126283 (=> (not res!752634) (not e!641068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126283 (= res!752634 (validMask!0 mask!1564))))

(declare-fun b!1126284 () Bool)

(assert (=> b!1126284 (= e!641067 tp_is_empty!28309)))

(declare-fun bm!47594 () Bool)

(declare-fun call!47597 () ListLongMap!15929)

(assert (=> bm!47594 (= call!47597 (getCurrentListMapNoExtraKeys!4481 lt!500011 lt!500016 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44281 () Bool)

(declare-fun tp!84040 () Bool)

(assert (=> mapNonEmpty!44281 (= mapRes!44281 (and tp!84040 e!641070))))

(declare-fun mapValue!44281 () ValueCell!13445)

(declare-fun mapKey!44281 () (_ BitVec 32))

(declare-fun mapRest!44281 () (Array (_ BitVec 32) ValueCell!13445))

(assert (=> mapNonEmpty!44281 (= (arr!35357 _values!996) (store mapRest!44281 mapKey!44281 mapValue!44281))))

(declare-fun b!1126285 () Bool)

(assert (=> b!1126285 (= e!641075 (= call!47597 call!47596))))

(declare-fun b!1126286 () Bool)

(assert (=> b!1126286 (= e!641073 (not e!641071))))

(declare-fun res!752626 () Bool)

(assert (=> b!1126286 (=> res!752626 e!641071)))

(assert (=> b!1126286 (= res!752626 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126286 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500012 () Unit!36765)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73406 (_ BitVec 64) (_ BitVec 32)) Unit!36765)

(assert (=> b!1126286 (= lt!500012 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1126287 () Bool)

(declare-fun res!752633 () Bool)

(assert (=> b!1126287 (=> (not res!752633) (not e!641068))))

(assert (=> b!1126287 (= res!752633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1126288 () Bool)

(declare-fun res!752632 () Bool)

(assert (=> b!1126288 (=> (not res!752632) (not e!641068))))

(assert (=> b!1126288 (= res!752632 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35894 _keys!1208))))))

(declare-fun b!1126289 () Bool)

(declare-fun -!1108 (ListLongMap!15929 (_ BitVec 64)) ListLongMap!15929)

(assert (=> b!1126289 (= e!641075 (= call!47597 (-!1108 call!47596 k0!934)))))

(declare-fun b!1126290 () Bool)

(declare-fun res!752624 () Bool)

(assert (=> b!1126290 (=> (not res!752624) (not e!641068))))

(assert (=> b!1126290 (= res!752624 (and (= (size!35895 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35894 _keys!1208) (size!35895 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44281 () Bool)

(assert (=> mapIsEmpty!44281 mapRes!44281))

(assert (= (and start!98072 res!752627) b!1126283))

(assert (= (and b!1126283 res!752634) b!1126290))

(assert (= (and b!1126290 res!752624) b!1126287))

(assert (= (and b!1126287 res!752633) b!1126280))

(assert (= (and b!1126280 res!752625) b!1126288))

(assert (= (and b!1126288 res!752632) b!1126282))

(assert (= (and b!1126282 res!752631) b!1126273))

(assert (= (and b!1126273 res!752629) b!1126281))

(assert (= (and b!1126281 res!752635) b!1126274))

(assert (= (and b!1126274 res!752623) b!1126286))

(assert (= (and b!1126286 (not res!752626)) b!1126275))

(assert (= (and b!1126275 (not res!752628)) b!1126279))

(assert (= (and b!1126279 c!109632) b!1126289))

(assert (= (and b!1126279 (not c!109632)) b!1126285))

(assert (= (or b!1126289 b!1126285) bm!47594))

(assert (= (or b!1126289 b!1126285) bm!47593))

(assert (= (and b!1126279 (not res!752630)) b!1126278))

(assert (= (and b!1126276 condMapEmpty!44281) mapIsEmpty!44281))

(assert (= (and b!1126276 (not condMapEmpty!44281)) mapNonEmpty!44281))

(get-info :version)

(assert (= (and mapNonEmpty!44281 ((_ is ValueCellFull!13445) mapValue!44281)) b!1126277))

(assert (= (and b!1126276 ((_ is ValueCellFull!13445) mapDefault!44281)) b!1126284))

(assert (= start!98072 b!1126276))

(declare-fun b_lambda!18731 () Bool)

(assert (=> (not b_lambda!18731) (not b!1126275)))

(declare-fun t!35479 () Bool)

(declare-fun tb!8583 () Bool)

(assert (=> (and start!98072 (= defaultEntry!1004 defaultEntry!1004) t!35479) tb!8583))

(declare-fun result!17735 () Bool)

(assert (=> tb!8583 (= result!17735 tp_is_empty!28309)))

(assert (=> b!1126275 t!35479))

(declare-fun b_and!38321 () Bool)

(assert (= b_and!38319 (and (=> t!35479 result!17735) b_and!38321)))

(declare-fun m!1039743 () Bool)

(assert (=> b!1126275 m!1039743))

(declare-fun m!1039745 () Bool)

(assert (=> b!1126275 m!1039745))

(declare-fun m!1039747 () Bool)

(assert (=> b!1126275 m!1039747))

(declare-fun m!1039749 () Bool)

(assert (=> b!1126275 m!1039749))

(declare-fun m!1039751 () Bool)

(assert (=> b!1126274 m!1039751))

(declare-fun m!1039753 () Bool)

(assert (=> bm!47593 m!1039753))

(declare-fun m!1039755 () Bool)

(assert (=> mapNonEmpty!44281 m!1039755))

(declare-fun m!1039757 () Bool)

(assert (=> b!1126289 m!1039757))

(declare-fun m!1039759 () Bool)

(assert (=> b!1126279 m!1039759))

(declare-fun m!1039761 () Bool)

(assert (=> b!1126279 m!1039761))

(declare-fun m!1039763 () Bool)

(assert (=> b!1126280 m!1039763))

(declare-fun m!1039765 () Bool)

(assert (=> b!1126282 m!1039765))

(declare-fun m!1039767 () Bool)

(assert (=> b!1126281 m!1039767))

(declare-fun m!1039769 () Bool)

(assert (=> b!1126281 m!1039769))

(declare-fun m!1039771 () Bool)

(assert (=> bm!47594 m!1039771))

(declare-fun m!1039773 () Bool)

(assert (=> b!1126283 m!1039773))

(assert (=> b!1126278 m!1039753))

(assert (=> b!1126278 m!1039753))

(declare-fun m!1039775 () Bool)

(assert (=> b!1126278 m!1039775))

(declare-fun m!1039777 () Bool)

(assert (=> b!1126273 m!1039777))

(declare-fun m!1039779 () Bool)

(assert (=> b!1126286 m!1039779))

(declare-fun m!1039781 () Bool)

(assert (=> b!1126286 m!1039781))

(declare-fun m!1039783 () Bool)

(assert (=> b!1126287 m!1039783))

(declare-fun m!1039785 () Bool)

(assert (=> start!98072 m!1039785))

(declare-fun m!1039787 () Bool)

(assert (=> start!98072 m!1039787))

(check-sat (not b!1126289) (not b!1126279) (not mapNonEmpty!44281) (not b!1126274) (not b_next!23779) (not b!1126287) (not b!1126282) (not b!1126278) (not bm!47594) (not b_lambda!18731) (not b!1126280) b_and!38321 (not start!98072) (not bm!47593) (not b!1126286) (not b!1126281) (not b!1126283) tp_is_empty!28309 (not b!1126275))
(check-sat b_and!38321 (not b_next!23779))
