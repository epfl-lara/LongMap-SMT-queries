; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98284 () Bool)

(assert start!98284)

(declare-fun b_free!23749 () Bool)

(declare-fun b_next!23749 () Bool)

(assert (=> start!98284 (= b_free!23749 (not b_next!23749))))

(declare-fun tp!83951 () Bool)

(declare-fun b_and!38291 () Bool)

(assert (=> start!98284 (= tp!83951 b_and!38291)))

(declare-datatypes ((V!42833 0))(
  ( (V!42834 (val!14196 Int)) )
))
(declare-fun zeroValue!944 () V!42833)

(declare-datatypes ((array!73471 0))(
  ( (array!73472 (arr!35382 (Array (_ BitVec 32) (_ BitVec 64))) (size!35919 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73471)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17854 0))(
  ( (tuple2!17855 (_1!8938 (_ BitVec 64)) (_2!8938 V!42833)) )
))
(declare-datatypes ((List!24644 0))(
  ( (Nil!24641) (Cons!24640 (h!25858 tuple2!17854) (t!35377 List!24644)) )
))
(declare-datatypes ((ListLongMap!15831 0))(
  ( (ListLongMap!15832 (toList!7931 List!24644)) )
))
(declare-fun call!47597 () ListLongMap!15831)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47593 () Bool)

(declare-datatypes ((ValueCell!13430 0))(
  ( (ValueCellFull!13430 (v!16825 V!42833)) (EmptyCell!13430) )
))
(declare-datatypes ((array!73473 0))(
  ( (array!73474 (arr!35383 (Array (_ BitVec 32) ValueCell!13430)) (size!35920 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73473)

(declare-fun minValue!944 () V!42833)

(declare-fun getCurrentListMapNoExtraKeys!4456 (array!73471 array!73473 (_ BitVec 32) (_ BitVec 32) V!42833 V!42833 (_ BitVec 32) Int) ListLongMap!15831)

(assert (=> bm!47593 (= call!47597 (getCurrentListMapNoExtraKeys!4456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126889 () Bool)

(declare-fun e!641553 () Bool)

(declare-fun e!641561 () Bool)

(declare-fun mapRes!44236 () Bool)

(assert (=> b!1126889 (= e!641553 (and e!641561 mapRes!44236))))

(declare-fun condMapEmpty!44236 () Bool)

(declare-fun mapDefault!44236 () ValueCell!13430)

(assert (=> b!1126889 (= condMapEmpty!44236 (= (arr!35383 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13430)) mapDefault!44236)))))

(declare-fun b!1126890 () Bool)

(declare-fun res!752635 () Bool)

(declare-fun e!641558 () Bool)

(assert (=> b!1126890 (=> (not res!752635) (not e!641558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126890 (= res!752635 (validMask!0 mask!1564))))

(declare-fun res!752633 () Bool)

(assert (=> start!98284 (=> (not res!752633) (not e!641558))))

(assert (=> start!98284 (= res!752633 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35919 _keys!1208))))))

(assert (=> start!98284 e!641558))

(declare-fun tp_is_empty!28279 () Bool)

(assert (=> start!98284 tp_is_empty!28279))

(declare-fun array_inv!27214 (array!73471) Bool)

(assert (=> start!98284 (array_inv!27214 _keys!1208)))

(assert (=> start!98284 true))

(assert (=> start!98284 tp!83951))

(declare-fun array_inv!27215 (array!73473) Bool)

(assert (=> start!98284 (and (array_inv!27215 _values!996) e!641553)))

(declare-fun b!1126891 () Bool)

(assert (=> b!1126891 (= e!641561 tp_is_empty!28279)))

(declare-fun b!1126892 () Bool)

(declare-fun res!752630 () Bool)

(declare-fun e!641562 () Bool)

(assert (=> b!1126892 (=> (not res!752630) (not e!641562))))

(declare-fun lt!500412 () array!73471)

(declare-datatypes ((List!24645 0))(
  ( (Nil!24642) (Cons!24641 (h!25859 (_ BitVec 64)) (t!35378 List!24645)) )
))
(declare-fun arrayNoDuplicates!0 (array!73471 (_ BitVec 32) List!24645) Bool)

(assert (=> b!1126892 (= res!752630 (arrayNoDuplicates!0 lt!500412 #b00000000000000000000000000000000 Nil!24642))))

(declare-fun e!641556 () Bool)

(declare-fun call!47596 () ListLongMap!15831)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1126893 () Bool)

(declare-fun -!1114 (ListLongMap!15831 (_ BitVec 64)) ListLongMap!15831)

(assert (=> b!1126893 (= e!641556 (= call!47596 (-!1114 call!47597 k0!934)))))

(declare-fun b!1126894 () Bool)

(declare-fun res!752637 () Bool)

(assert (=> b!1126894 (=> (not res!752637) (not e!641558))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126894 (= res!752637 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35919 _keys!1208))))))

(declare-fun b!1126895 () Bool)

(declare-fun e!641557 () Bool)

(declare-fun e!641554 () Bool)

(assert (=> b!1126895 (= e!641557 e!641554)))

(declare-fun res!752632 () Bool)

(assert (=> b!1126895 (=> res!752632 e!641554)))

(assert (=> b!1126895 (= res!752632 (not (= from!1455 i!673)))))

(declare-fun lt!500414 () array!73473)

(declare-fun lt!500410 () ListLongMap!15831)

(assert (=> b!1126895 (= lt!500410 (getCurrentListMapNoExtraKeys!4456 lt!500412 lt!500414 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2531 (Int (_ BitVec 64)) V!42833)

(assert (=> b!1126895 (= lt!500414 (array!73474 (store (arr!35383 _values!996) i!673 (ValueCellFull!13430 (dynLambda!2531 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35920 _values!996)))))

(declare-fun lt!500411 () ListLongMap!15831)

(assert (=> b!1126895 (= lt!500411 (getCurrentListMapNoExtraKeys!4456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126896 () Bool)

(assert (=> b!1126896 (= e!641562 (not e!641557))))

(declare-fun res!752638 () Bool)

(assert (=> b!1126896 (=> res!752638 e!641557)))

(assert (=> b!1126896 (= res!752638 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126896 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36885 0))(
  ( (Unit!36886) )
))
(declare-fun lt!500415 () Unit!36885)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73471 (_ BitVec 64) (_ BitVec 32)) Unit!36885)

(assert (=> b!1126896 (= lt!500415 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!44236 () Bool)

(assert (=> mapIsEmpty!44236 mapRes!44236))

(declare-fun b!1126897 () Bool)

(declare-fun res!752639 () Bool)

(assert (=> b!1126897 (=> (not res!752639) (not e!641558))))

(assert (=> b!1126897 (= res!752639 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24642))))

(declare-fun b!1126898 () Bool)

(declare-fun res!752641 () Bool)

(assert (=> b!1126898 (=> (not res!752641) (not e!641558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126898 (= res!752641 (validKeyInArray!0 k0!934))))

(declare-fun b!1126899 () Bool)

(declare-fun e!641560 () Bool)

(assert (=> b!1126899 (= e!641560 tp_is_empty!28279)))

(declare-fun b!1126900 () Bool)

(assert (=> b!1126900 (= e!641558 e!641562)))

(declare-fun res!752631 () Bool)

(assert (=> b!1126900 (=> (not res!752631) (not e!641562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73471 (_ BitVec 32)) Bool)

(assert (=> b!1126900 (= res!752631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500412 mask!1564))))

(assert (=> b!1126900 (= lt!500412 (array!73472 (store (arr!35382 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35919 _keys!1208)))))

(declare-fun bm!47594 () Bool)

(assert (=> bm!47594 (= call!47596 (getCurrentListMapNoExtraKeys!4456 lt!500412 lt!500414 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126901 () Bool)

(declare-fun res!752634 () Bool)

(assert (=> b!1126901 (=> (not res!752634) (not e!641558))))

(assert (=> b!1126901 (= res!752634 (= (select (arr!35382 _keys!1208) i!673) k0!934))))

(declare-fun b!1126902 () Bool)

(declare-fun res!752636 () Bool)

(assert (=> b!1126902 (=> (not res!752636) (not e!641558))))

(assert (=> b!1126902 (= res!752636 (and (= (size!35920 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35919 _keys!1208) (size!35920 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126903 () Bool)

(declare-fun e!641555 () Bool)

(assert (=> b!1126903 (= e!641554 e!641555)))

(declare-fun res!752629 () Bool)

(assert (=> b!1126903 (=> res!752629 e!641555)))

(assert (=> b!1126903 (= res!752629 (not (= (select (arr!35382 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1126903 e!641556))

(declare-fun c!110024 () Bool)

(assert (=> b!1126903 (= c!110024 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500413 () Unit!36885)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!376 (array!73471 array!73473 (_ BitVec 32) (_ BitVec 32) V!42833 V!42833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36885)

(assert (=> b!1126903 (= lt!500413 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126904 () Bool)

(assert (=> b!1126904 (= e!641555 true)))

(declare-fun lt!500416 () Bool)

(declare-fun contains!6481 (ListLongMap!15831 (_ BitVec 64)) Bool)

(assert (=> b!1126904 (= lt!500416 (contains!6481 (getCurrentListMapNoExtraKeys!4456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun mapNonEmpty!44236 () Bool)

(declare-fun tp!83950 () Bool)

(assert (=> mapNonEmpty!44236 (= mapRes!44236 (and tp!83950 e!641560))))

(declare-fun mapKey!44236 () (_ BitVec 32))

(declare-fun mapRest!44236 () (Array (_ BitVec 32) ValueCell!13430))

(declare-fun mapValue!44236 () ValueCell!13430)

(assert (=> mapNonEmpty!44236 (= (arr!35383 _values!996) (store mapRest!44236 mapKey!44236 mapValue!44236))))

(declare-fun b!1126905 () Bool)

(assert (=> b!1126905 (= e!641556 (= call!47596 call!47597))))

(declare-fun b!1126906 () Bool)

(declare-fun res!752640 () Bool)

(assert (=> b!1126906 (=> (not res!752640) (not e!641558))))

(assert (=> b!1126906 (= res!752640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98284 res!752633) b!1126890))

(assert (= (and b!1126890 res!752635) b!1126902))

(assert (= (and b!1126902 res!752636) b!1126906))

(assert (= (and b!1126906 res!752640) b!1126897))

(assert (= (and b!1126897 res!752639) b!1126894))

(assert (= (and b!1126894 res!752637) b!1126898))

(assert (= (and b!1126898 res!752641) b!1126901))

(assert (= (and b!1126901 res!752634) b!1126900))

(assert (= (and b!1126900 res!752631) b!1126892))

(assert (= (and b!1126892 res!752630) b!1126896))

(assert (= (and b!1126896 (not res!752638)) b!1126895))

(assert (= (and b!1126895 (not res!752632)) b!1126903))

(assert (= (and b!1126903 c!110024) b!1126893))

(assert (= (and b!1126903 (not c!110024)) b!1126905))

(assert (= (or b!1126893 b!1126905) bm!47594))

(assert (= (or b!1126893 b!1126905) bm!47593))

(assert (= (and b!1126903 (not res!752629)) b!1126904))

(assert (= (and b!1126889 condMapEmpty!44236) mapIsEmpty!44236))

(assert (= (and b!1126889 (not condMapEmpty!44236)) mapNonEmpty!44236))

(get-info :version)

(assert (= (and mapNonEmpty!44236 ((_ is ValueCellFull!13430) mapValue!44236)) b!1126899))

(assert (= (and b!1126889 ((_ is ValueCellFull!13430) mapDefault!44236)) b!1126891))

(assert (= start!98284 b!1126889))

(declare-fun b_lambda!18729 () Bool)

(assert (=> (not b_lambda!18729) (not b!1126895)))

(declare-fun t!35376 () Bool)

(declare-fun tb!8553 () Bool)

(assert (=> (and start!98284 (= defaultEntry!1004 defaultEntry!1004) t!35376) tb!8553))

(declare-fun result!17675 () Bool)

(assert (=> tb!8553 (= result!17675 tp_is_empty!28279)))

(assert (=> b!1126895 t!35376))

(declare-fun b_and!38293 () Bool)

(assert (= b_and!38291 (and (=> t!35376 result!17675) b_and!38293)))

(declare-fun m!1041353 () Bool)

(assert (=> bm!47594 m!1041353))

(declare-fun m!1041355 () Bool)

(assert (=> start!98284 m!1041355))

(declare-fun m!1041357 () Bool)

(assert (=> start!98284 m!1041357))

(declare-fun m!1041359 () Bool)

(assert (=> mapNonEmpty!44236 m!1041359))

(declare-fun m!1041361 () Bool)

(assert (=> b!1126900 m!1041361))

(declare-fun m!1041363 () Bool)

(assert (=> b!1126900 m!1041363))

(declare-fun m!1041365 () Bool)

(assert (=> b!1126895 m!1041365))

(declare-fun m!1041367 () Bool)

(assert (=> b!1126895 m!1041367))

(declare-fun m!1041369 () Bool)

(assert (=> b!1126895 m!1041369))

(declare-fun m!1041371 () Bool)

(assert (=> b!1126895 m!1041371))

(declare-fun m!1041373 () Bool)

(assert (=> b!1126906 m!1041373))

(declare-fun m!1041375 () Bool)

(assert (=> b!1126896 m!1041375))

(declare-fun m!1041377 () Bool)

(assert (=> b!1126896 m!1041377))

(declare-fun m!1041379 () Bool)

(assert (=> b!1126903 m!1041379))

(declare-fun m!1041381 () Bool)

(assert (=> b!1126903 m!1041381))

(declare-fun m!1041383 () Bool)

(assert (=> b!1126892 m!1041383))

(declare-fun m!1041385 () Bool)

(assert (=> b!1126904 m!1041385))

(assert (=> b!1126904 m!1041385))

(declare-fun m!1041387 () Bool)

(assert (=> b!1126904 m!1041387))

(assert (=> bm!47593 m!1041385))

(declare-fun m!1041389 () Bool)

(assert (=> b!1126897 m!1041389))

(declare-fun m!1041391 () Bool)

(assert (=> b!1126890 m!1041391))

(declare-fun m!1041393 () Bool)

(assert (=> b!1126893 m!1041393))

(declare-fun m!1041395 () Bool)

(assert (=> b!1126898 m!1041395))

(declare-fun m!1041397 () Bool)

(assert (=> b!1126901 m!1041397))

(check-sat b_and!38293 (not bm!47594) (not b!1126903) (not b!1126900) (not b!1126906) (not mapNonEmpty!44236) (not bm!47593) (not start!98284) (not b!1126904) (not b!1126896) (not b!1126898) (not b_lambda!18729) tp_is_empty!28279 (not b!1126890) (not b!1126893) (not b_next!23749) (not b!1126897) (not b!1126895) (not b!1126892))
(check-sat b_and!38293 (not b_next!23749))
