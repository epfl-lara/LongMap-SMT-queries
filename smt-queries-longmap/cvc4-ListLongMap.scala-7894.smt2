; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98112 () Bool)

(assert start!98112)

(declare-fun b_free!23813 () Bool)

(declare-fun b_next!23813 () Bool)

(assert (=> start!98112 (= b_free!23813 (not b_next!23813))))

(declare-fun tp!84143 () Bool)

(declare-fun b_and!38409 () Bool)

(assert (=> start!98112 (= tp!84143 b_and!38409)))

(declare-datatypes ((V!42917 0))(
  ( (V!42918 (val!14228 Int)) )
))
(declare-fun zeroValue!944 () V!42917)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!73547 0))(
  ( (array!73548 (arr!35426 (Array (_ BitVec 32) (_ BitVec 64))) (size!35962 (_ BitVec 32))) )
))
(declare-fun lt!500562 () array!73547)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17896 0))(
  ( (tuple2!17897 (_1!8959 (_ BitVec 64)) (_2!8959 V!42917)) )
))
(declare-datatypes ((List!24668 0))(
  ( (Nil!24665) (Cons!24664 (h!25873 tuple2!17896) (t!35473 List!24668)) )
))
(declare-datatypes ((ListLongMap!15865 0))(
  ( (ListLongMap!15866 (toList!7948 List!24668)) )
))
(declare-fun call!47722 () ListLongMap!15865)

(declare-fun minValue!944 () V!42917)

(declare-datatypes ((ValueCell!13462 0))(
  ( (ValueCellFull!13462 (v!16861 V!42917)) (EmptyCell!13462) )
))
(declare-datatypes ((array!73549 0))(
  ( (array!73550 (arr!35427 (Array (_ BitVec 32) ValueCell!13462)) (size!35963 (_ BitVec 32))) )
))
(declare-fun lt!500560 () array!73549)

(declare-fun bm!47718 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4436 (array!73547 array!73549 (_ BitVec 32) (_ BitVec 32) V!42917 V!42917 (_ BitVec 32) Int) ListLongMap!15865)

(assert (=> bm!47718 (= call!47722 (getCurrentListMapNoExtraKeys!4436 lt!500562 lt!500560 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127363 () Bool)

(declare-fun e!641666 () Bool)

(declare-fun tp_is_empty!28343 () Bool)

(assert (=> b!1127363 (= e!641666 tp_is_empty!28343)))

(declare-fun b!1127364 () Bool)

(declare-fun e!641658 () Bool)

(declare-fun e!641662 () Bool)

(assert (=> b!1127364 (= e!641658 e!641662)))

(declare-fun res!753367 () Bool)

(assert (=> b!1127364 (=> (not res!753367) (not e!641662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73547 (_ BitVec 32)) Bool)

(assert (=> b!1127364 (= res!753367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500562 mask!1564))))

(declare-fun _keys!1208 () array!73547)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127364 (= lt!500562 (array!73548 (store (arr!35426 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35962 _keys!1208)))))

(declare-fun res!753364 () Bool)

(assert (=> start!98112 (=> (not res!753364) (not e!641658))))

(assert (=> start!98112 (= res!753364 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35962 _keys!1208))))))

(assert (=> start!98112 e!641658))

(assert (=> start!98112 tp_is_empty!28343))

(declare-fun array_inv!27186 (array!73547) Bool)

(assert (=> start!98112 (array_inv!27186 _keys!1208)))

(assert (=> start!98112 true))

(assert (=> start!98112 tp!84143))

(declare-fun _values!996 () array!73549)

(declare-fun e!641667 () Bool)

(declare-fun array_inv!27187 (array!73549) Bool)

(assert (=> start!98112 (and (array_inv!27187 _values!996) e!641667)))

(declare-fun b!1127365 () Bool)

(declare-fun e!641660 () Bool)

(declare-fun e!641663 () Bool)

(assert (=> b!1127365 (= e!641660 e!641663)))

(declare-fun res!753375 () Bool)

(assert (=> b!1127365 (=> res!753375 e!641663)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1127365 (= res!753375 (not (= (select (arr!35426 _keys!1208) from!1455) k!934)))))

(declare-fun e!641664 () Bool)

(assert (=> b!1127365 e!641664))

(declare-fun c!109710 () Bool)

(assert (=> b!1127365 (= c!109710 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36940 0))(
  ( (Unit!36941) )
))
(declare-fun lt!500559 () Unit!36940)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!390 (array!73547 array!73549 (_ BitVec 32) (_ BitVec 32) V!42917 V!42917 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36940)

(assert (=> b!1127365 (= lt!500559 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!390 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44332 () Bool)

(declare-fun mapRes!44332 () Bool)

(declare-fun tp!84142 () Bool)

(assert (=> mapNonEmpty!44332 (= mapRes!44332 (and tp!84142 e!641666))))

(declare-fun mapRest!44332 () (Array (_ BitVec 32) ValueCell!13462))

(declare-fun mapValue!44332 () ValueCell!13462)

(declare-fun mapKey!44332 () (_ BitVec 32))

(assert (=> mapNonEmpty!44332 (= (arr!35427 _values!996) (store mapRest!44332 mapKey!44332 mapValue!44332))))

(declare-fun b!1127366 () Bool)

(declare-fun res!753371 () Bool)

(assert (=> b!1127366 (=> (not res!753371) (not e!641658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127366 (= res!753371 (validKeyInArray!0 k!934))))

(declare-fun b!1127367 () Bool)

(declare-fun e!641659 () Bool)

(assert (=> b!1127367 (= e!641662 (not e!641659))))

(declare-fun res!753373 () Bool)

(assert (=> b!1127367 (=> res!753373 e!641659)))

(assert (=> b!1127367 (= res!753373 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127367 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!500561 () Unit!36940)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73547 (_ BitVec 64) (_ BitVec 32)) Unit!36940)

(assert (=> b!1127367 (= lt!500561 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1127368 () Bool)

(declare-fun call!47721 () ListLongMap!15865)

(declare-fun -!1138 (ListLongMap!15865 (_ BitVec 64)) ListLongMap!15865)

(assert (=> b!1127368 (= e!641664 (= call!47722 (-!1138 call!47721 k!934)))))

(declare-fun mapIsEmpty!44332 () Bool)

(assert (=> mapIsEmpty!44332 mapRes!44332))

(declare-fun b!1127369 () Bool)

(declare-fun res!753376 () Bool)

(assert (=> b!1127369 (=> (not res!753376) (not e!641658))))

(assert (=> b!1127369 (= res!753376 (and (= (size!35963 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35962 _keys!1208) (size!35963 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127370 () Bool)

(declare-fun res!753365 () Bool)

(assert (=> b!1127370 (=> (not res!753365) (not e!641658))))

(assert (=> b!1127370 (= res!753365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127371 () Bool)

(declare-fun res!753374 () Bool)

(assert (=> b!1127371 (=> (not res!753374) (not e!641658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127371 (= res!753374 (validMask!0 mask!1564))))

(declare-fun b!1127372 () Bool)

(assert (=> b!1127372 (= e!641659 e!641660)))

(declare-fun res!753370 () Bool)

(assert (=> b!1127372 (=> res!753370 e!641660)))

(assert (=> b!1127372 (= res!753370 (not (= from!1455 i!673)))))

(declare-fun lt!500563 () ListLongMap!15865)

(assert (=> b!1127372 (= lt!500563 (getCurrentListMapNoExtraKeys!4436 lt!500562 lt!500560 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2523 (Int (_ BitVec 64)) V!42917)

(assert (=> b!1127372 (= lt!500560 (array!73550 (store (arr!35427 _values!996) i!673 (ValueCellFull!13462 (dynLambda!2523 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35963 _values!996)))))

(declare-fun lt!500564 () ListLongMap!15865)

(assert (=> b!1127372 (= lt!500564 (getCurrentListMapNoExtraKeys!4436 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127373 () Bool)

(declare-fun e!641665 () Bool)

(assert (=> b!1127373 (= e!641665 tp_is_empty!28343)))

(declare-fun b!1127374 () Bool)

(declare-fun res!753369 () Bool)

(assert (=> b!1127374 (=> (not res!753369) (not e!641662))))

(declare-datatypes ((List!24669 0))(
  ( (Nil!24666) (Cons!24665 (h!25874 (_ BitVec 64)) (t!35474 List!24669)) )
))
(declare-fun arrayNoDuplicates!0 (array!73547 (_ BitVec 32) List!24669) Bool)

(assert (=> b!1127374 (= res!753369 (arrayNoDuplicates!0 lt!500562 #b00000000000000000000000000000000 Nil!24666))))

(declare-fun bm!47719 () Bool)

(assert (=> bm!47719 (= call!47721 (getCurrentListMapNoExtraKeys!4436 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127375 () Bool)

(assert (=> b!1127375 (= e!641663 true)))

(declare-fun lt!500558 () Bool)

(declare-fun contains!6478 (ListLongMap!15865 (_ BitVec 64)) Bool)

(assert (=> b!1127375 (= lt!500558 (contains!6478 (getCurrentListMapNoExtraKeys!4436 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1127376 () Bool)

(declare-fun res!753366 () Bool)

(assert (=> b!1127376 (=> (not res!753366) (not e!641658))))

(assert (=> b!1127376 (= res!753366 (= (select (arr!35426 _keys!1208) i!673) k!934))))

(declare-fun b!1127377 () Bool)

(declare-fun res!753372 () Bool)

(assert (=> b!1127377 (=> (not res!753372) (not e!641658))))

(assert (=> b!1127377 (= res!753372 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24666))))

(declare-fun b!1127378 () Bool)

(assert (=> b!1127378 (= e!641664 (= call!47722 call!47721))))

(declare-fun b!1127379 () Bool)

(declare-fun res!753368 () Bool)

(assert (=> b!1127379 (=> (not res!753368) (not e!641658))))

(assert (=> b!1127379 (= res!753368 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35962 _keys!1208))))))

(declare-fun b!1127380 () Bool)

(assert (=> b!1127380 (= e!641667 (and e!641665 mapRes!44332))))

(declare-fun condMapEmpty!44332 () Bool)

(declare-fun mapDefault!44332 () ValueCell!13462)

