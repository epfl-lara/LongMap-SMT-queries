; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99436 () Bool)

(assert start!99436)

(declare-fun b_free!25015 () Bool)

(declare-fun b_next!25015 () Bool)

(assert (=> start!99436 (= b_free!25015 (not b_next!25015))))

(declare-fun tp!87759 () Bool)

(declare-fun b_and!40897 () Bool)

(assert (=> start!99436 (= tp!87759 b_and!40897)))

(declare-fun b!1174409 () Bool)

(declare-fun e!667554 () Bool)

(declare-fun e!667550 () Bool)

(assert (=> b!1174409 (= e!667554 e!667550)))

(declare-fun res!779906 () Bool)

(assert (=> b!1174409 (=> (not res!779906) (not e!667550))))

(declare-datatypes ((array!75901 0))(
  ( (array!75902 (arr!36600 (Array (_ BitVec 32) (_ BitVec 64))) (size!37136 (_ BitVec 32))) )
))
(declare-fun lt!529590 () array!75901)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75901 (_ BitVec 32)) Bool)

(assert (=> b!1174409 (= res!779906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529590 mask!1564))))

(declare-fun _keys!1208 () array!75901)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1174409 (= lt!529590 (array!75902 (store (arr!36600 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37136 _keys!1208)))))

(declare-fun b!1174410 () Bool)

(declare-fun res!779904 () Bool)

(assert (=> b!1174410 (=> (not res!779904) (not e!667554))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174410 (= res!779904 (validKeyInArray!0 k!934))))

(declare-fun b!1174411 () Bool)

(declare-fun res!779909 () Bool)

(assert (=> b!1174411 (=> (not res!779909) (not e!667554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174411 (= res!779909 (validMask!0 mask!1564))))

(declare-fun b!1174412 () Bool)

(declare-fun res!779898 () Bool)

(assert (=> b!1174412 (=> (not res!779898) (not e!667554))))

(declare-datatypes ((List!25694 0))(
  ( (Nil!25691) (Cons!25690 (h!26899 (_ BitVec 64)) (t!37701 List!25694)) )
))
(declare-fun arrayNoDuplicates!0 (array!75901 (_ BitVec 32) List!25694) Bool)

(assert (=> b!1174412 (= res!779898 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25691))))

(declare-fun b!1174413 () Bool)

(declare-datatypes ((Unit!38745 0))(
  ( (Unit!38746) )
))
(declare-fun e!667548 () Unit!38745)

(declare-fun Unit!38747 () Unit!38745)

(assert (=> b!1174413 (= e!667548 Unit!38747)))

(declare-fun b!1174414 () Bool)

(declare-fun e!667553 () Bool)

(declare-fun tp_is_empty!29545 () Bool)

(assert (=> b!1174414 (= e!667553 tp_is_empty!29545)))

(declare-fun b!1174415 () Bool)

(declare-fun e!667558 () Bool)

(assert (=> b!1174415 (= e!667558 true)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1174415 (not (= (select (arr!36600 _keys!1208) from!1455) k!934))))

(declare-fun lt!529592 () Unit!38745)

(assert (=> b!1174415 (= lt!529592 e!667548)))

(declare-fun c!116646 () Bool)

(assert (=> b!1174415 (= c!116646 (= (select (arr!36600 _keys!1208) from!1455) k!934))))

(declare-fun e!667549 () Bool)

(assert (=> b!1174415 e!667549))

(declare-fun res!779903 () Bool)

(assert (=> b!1174415 (=> (not res!779903) (not e!667549))))

(declare-datatypes ((V!44521 0))(
  ( (V!44522 (val!14829 Int)) )
))
(declare-fun lt!529589 () V!44521)

(declare-datatypes ((tuple2!18956 0))(
  ( (tuple2!18957 (_1!9489 (_ BitVec 64)) (_2!9489 V!44521)) )
))
(declare-datatypes ((List!25695 0))(
  ( (Nil!25692) (Cons!25691 (h!26900 tuple2!18956) (t!37702 List!25695)) )
))
(declare-datatypes ((ListLongMap!16925 0))(
  ( (ListLongMap!16926 (toList!8478 List!25695)) )
))
(declare-fun lt!529594 () ListLongMap!16925)

(declare-fun lt!529587 () ListLongMap!16925)

(declare-datatypes ((ValueCell!14063 0))(
  ( (ValueCellFull!14063 (v!17467 V!44521)) (EmptyCell!14063) )
))
(declare-datatypes ((array!75903 0))(
  ( (array!75904 (arr!36601 (Array (_ BitVec 32) ValueCell!14063)) (size!37137 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75903)

(declare-fun +!3795 (ListLongMap!16925 tuple2!18956) ListLongMap!16925)

(declare-fun get!18681 (ValueCell!14063 V!44521) V!44521)

(assert (=> b!1174415 (= res!779903 (= lt!529594 (+!3795 lt!529587 (tuple2!18957 (select (arr!36600 _keys!1208) from!1455) (get!18681 (select (arr!36601 _values!996) from!1455) lt!529589)))))))

(declare-fun b!1174416 () Bool)

(declare-fun e!667551 () Bool)

(assert (=> b!1174416 (= e!667551 e!667558)))

(declare-fun res!779900 () Bool)

(assert (=> b!1174416 (=> res!779900 e!667558)))

(assert (=> b!1174416 (= res!779900 (not (validKeyInArray!0 (select (arr!36600 _keys!1208) from!1455))))))

(declare-fun lt!529583 () ListLongMap!16925)

(assert (=> b!1174416 (= lt!529583 lt!529587)))

(declare-fun lt!529595 () ListLongMap!16925)

(declare-fun -!1538 (ListLongMap!16925 (_ BitVec 64)) ListLongMap!16925)

(assert (=> b!1174416 (= lt!529587 (-!1538 lt!529595 k!934))))

(declare-fun zeroValue!944 () V!44521)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44521)

(declare-fun lt!529586 () array!75903)

(declare-fun getCurrentListMapNoExtraKeys!4939 (array!75901 array!75903 (_ BitVec 32) (_ BitVec 32) V!44521 V!44521 (_ BitVec 32) Int) ListLongMap!16925)

(assert (=> b!1174416 (= lt!529583 (getCurrentListMapNoExtraKeys!4939 lt!529590 lt!529586 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174416 (= lt!529595 (getCurrentListMapNoExtraKeys!4939 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529585 () Unit!38745)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!765 (array!75901 array!75903 (_ BitVec 32) (_ BitVec 32) V!44521 V!44521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38745)

(assert (=> b!1174416 (= lt!529585 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!765 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174417 () Bool)

(declare-fun res!779899 () Bool)

(assert (=> b!1174417 (=> (not res!779899) (not e!667554))))

(assert (=> b!1174417 (= res!779899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!779911 () Bool)

(assert (=> start!99436 (=> (not res!779911) (not e!667554))))

(assert (=> start!99436 (= res!779911 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37136 _keys!1208))))))

(assert (=> start!99436 e!667554))

(assert (=> start!99436 tp_is_empty!29545))

(declare-fun array_inv!27960 (array!75901) Bool)

(assert (=> start!99436 (array_inv!27960 _keys!1208)))

(assert (=> start!99436 true))

(assert (=> start!99436 tp!87759))

(declare-fun e!667557 () Bool)

(declare-fun array_inv!27961 (array!75903) Bool)

(assert (=> start!99436 (and (array_inv!27961 _values!996) e!667557)))

(declare-fun b!1174418 () Bool)

(declare-fun e!667555 () Bool)

(assert (=> b!1174418 (= e!667555 tp_is_empty!29545)))

(declare-fun b!1174419 () Bool)

(declare-fun e!667556 () Bool)

(assert (=> b!1174419 (= e!667549 e!667556)))

(declare-fun res!779907 () Bool)

(assert (=> b!1174419 (=> res!779907 e!667556)))

(assert (=> b!1174419 (= res!779907 (not (= (select (arr!36600 _keys!1208) from!1455) k!934)))))

(declare-fun mapIsEmpty!46145 () Bool)

(declare-fun mapRes!46145 () Bool)

(assert (=> mapIsEmpty!46145 mapRes!46145))

(declare-fun mapNonEmpty!46145 () Bool)

(declare-fun tp!87758 () Bool)

(assert (=> mapNonEmpty!46145 (= mapRes!46145 (and tp!87758 e!667555))))

(declare-fun mapRest!46145 () (Array (_ BitVec 32) ValueCell!14063))

(declare-fun mapValue!46145 () ValueCell!14063)

(declare-fun mapKey!46145 () (_ BitVec 32))

(assert (=> mapNonEmpty!46145 (= (arr!36601 _values!996) (store mapRest!46145 mapKey!46145 mapValue!46145))))

(declare-fun b!1174420 () Bool)

(declare-fun Unit!38748 () Unit!38745)

(assert (=> b!1174420 (= e!667548 Unit!38748)))

(declare-fun lt!529588 () Unit!38745)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75901 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38745)

(assert (=> b!1174420 (= lt!529588 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174420 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529591 () Unit!38745)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75901 (_ BitVec 32) (_ BitVec 32)) Unit!38745)

(assert (=> b!1174420 (= lt!529591 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174420 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25691)))

(declare-fun lt!529593 () Unit!38745)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75901 (_ BitVec 64) (_ BitVec 32) List!25694) Unit!38745)

(assert (=> b!1174420 (= lt!529593 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25691))))

(assert (=> b!1174420 false))

(declare-fun b!1174421 () Bool)

(declare-fun res!779910 () Bool)

(assert (=> b!1174421 (=> (not res!779910) (not e!667550))))

(assert (=> b!1174421 (= res!779910 (arrayNoDuplicates!0 lt!529590 #b00000000000000000000000000000000 Nil!25691))))

(declare-fun b!1174422 () Bool)

(declare-fun e!667552 () Bool)

(assert (=> b!1174422 (= e!667552 e!667551)))

(declare-fun res!779908 () Bool)

(assert (=> b!1174422 (=> res!779908 e!667551)))

(assert (=> b!1174422 (= res!779908 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1174422 (= lt!529594 (getCurrentListMapNoExtraKeys!4939 lt!529590 lt!529586 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1174422 (= lt!529586 (array!75904 (store (arr!36601 _values!996) i!673 (ValueCellFull!14063 lt!529589)) (size!37137 _values!996)))))

(declare-fun dynLambda!2907 (Int (_ BitVec 64)) V!44521)

(assert (=> b!1174422 (= lt!529589 (dynLambda!2907 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529596 () ListLongMap!16925)

(assert (=> b!1174422 (= lt!529596 (getCurrentListMapNoExtraKeys!4939 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174423 () Bool)

(declare-fun res!779905 () Bool)

(assert (=> b!1174423 (=> (not res!779905) (not e!667554))))

(assert (=> b!1174423 (= res!779905 (and (= (size!37137 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37136 _keys!1208) (size!37137 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174424 () Bool)

(declare-fun res!779902 () Bool)

(assert (=> b!1174424 (=> (not res!779902) (not e!667554))))

(assert (=> b!1174424 (= res!779902 (= (select (arr!36600 _keys!1208) i!673) k!934))))

(declare-fun b!1174425 () Bool)

(assert (=> b!1174425 (= e!667557 (and e!667553 mapRes!46145))))

(declare-fun condMapEmpty!46145 () Bool)

(declare-fun mapDefault!46145 () ValueCell!14063)

