; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101522 () Bool)

(assert start!101522)

(declare-fun b_free!26309 () Bool)

(declare-fun b_next!26309 () Bool)

(assert (=> start!101522 (= b_free!26309 (not b_next!26309))))

(declare-fun tp!91963 () Bool)

(declare-fun b_and!43825 () Bool)

(assert (=> start!101522 (= tp!91963 b_and!43825)))

(declare-fun b!1220465 () Bool)

(declare-fun e!693027 () Bool)

(assert (=> b!1220465 (= e!693027 true)))

(declare-datatypes ((array!78805 0))(
  ( (array!78806 (arr!38032 (Array (_ BitVec 32) (_ BitVec 64))) (size!38568 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78805)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((List!26836 0))(
  ( (Nil!26833) (Cons!26832 (h!28041 (_ BitVec 64)) (t!40125 List!26836)) )
))
(declare-fun arrayNoDuplicates!0 (array!78805 (_ BitVec 32) List!26836) Bool)

(assert (=> b!1220465 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26833)))

(declare-datatypes ((Unit!40438 0))(
  ( (Unit!40439) )
))
(declare-fun lt!555023 () Unit!40438)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78805 (_ BitVec 32) (_ BitVec 32)) Unit!40438)

(assert (=> b!1220465 (= lt!555023 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220465 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555027 () Unit!40438)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78805 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40438)

(assert (=> b!1220465 (= lt!555027 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220466 () Bool)

(declare-fun e!693026 () Bool)

(declare-fun e!693023 () Bool)

(assert (=> b!1220466 (= e!693026 e!693023)))

(declare-fun res!810703 () Bool)

(assert (=> b!1220466 (=> (not res!810703) (not e!693023))))

(declare-fun lt!555025 () array!78805)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78805 (_ BitVec 32)) Bool)

(assert (=> b!1220466 (= res!810703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555025 mask!1564))))

(assert (=> b!1220466 (= lt!555025 (array!78806 (store (arr!38032 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38568 _keys!1208)))))

(declare-fun b!1220467 () Bool)

(declare-fun e!693031 () Bool)

(assert (=> b!1220467 (= e!693023 (not e!693031))))

(declare-fun res!810699 () Bool)

(assert (=> b!1220467 (=> res!810699 e!693031)))

(assert (=> b!1220467 (= res!810699 (bvsgt from!1455 i!673))))

(assert (=> b!1220467 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!555022 () Unit!40438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78805 (_ BitVec 64) (_ BitVec 32)) Unit!40438)

(assert (=> b!1220467 (= lt!555022 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1220468 () Bool)

(declare-fun res!810709 () Bool)

(assert (=> b!1220468 (=> (not res!810709) (not e!693026))))

(assert (=> b!1220468 (= res!810709 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26833))))

(declare-fun e!693034 () Bool)

(declare-fun b!1220469 () Bool)

(assert (=> b!1220469 (= e!693034 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1220470 () Bool)

(declare-fun e!693028 () Bool)

(declare-fun tp_is_empty!31013 () Bool)

(assert (=> b!1220470 (= e!693028 tp_is_empty!31013)))

(declare-fun mapIsEmpty!48409 () Bool)

(declare-fun mapRes!48409 () Bool)

(assert (=> mapIsEmpty!48409 mapRes!48409))

(declare-fun b!1220471 () Bool)

(declare-fun res!810700 () Bool)

(assert (=> b!1220471 (=> (not res!810700) (not e!693026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220471 (= res!810700 (validKeyInArray!0 k!934))))

(declare-fun b!1220472 () Bool)

(declare-fun e!693033 () Bool)

(declare-fun e!693025 () Bool)

(assert (=> b!1220472 (= e!693033 e!693025)))

(declare-fun res!810702 () Bool)

(assert (=> b!1220472 (=> res!810702 e!693025)))

(assert (=> b!1220472 (= res!810702 (not (validKeyInArray!0 (select (arr!38032 _keys!1208) from!1455))))))

(declare-datatypes ((V!46477 0))(
  ( (V!46478 (val!15563 Int)) )
))
(declare-datatypes ((tuple2!20036 0))(
  ( (tuple2!20037 (_1!10029 (_ BitVec 64)) (_2!10029 V!46477)) )
))
(declare-datatypes ((List!26837 0))(
  ( (Nil!26834) (Cons!26833 (h!28042 tuple2!20036) (t!40126 List!26837)) )
))
(declare-datatypes ((ListLongMap!18005 0))(
  ( (ListLongMap!18006 (toList!9018 List!26837)) )
))
(declare-fun lt!555016 () ListLongMap!18005)

(declare-fun lt!555019 () ListLongMap!18005)

(assert (=> b!1220472 (= lt!555016 lt!555019)))

(declare-fun lt!555017 () ListLongMap!18005)

(declare-fun -!1927 (ListLongMap!18005 (_ BitVec 64)) ListLongMap!18005)

(assert (=> b!1220472 (= lt!555019 (-!1927 lt!555017 k!934))))

(declare-fun zeroValue!944 () V!46477)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14797 0))(
  ( (ValueCellFull!14797 (v!18221 V!46477)) (EmptyCell!14797) )
))
(declare-datatypes ((array!78807 0))(
  ( (array!78808 (arr!38033 (Array (_ BitVec 32) ValueCell!14797)) (size!38569 (_ BitVec 32))) )
))
(declare-fun lt!555024 () array!78807)

(declare-fun minValue!944 () V!46477)

(declare-fun getCurrentListMapNoExtraKeys!5441 (array!78805 array!78807 (_ BitVec 32) (_ BitVec 32) V!46477 V!46477 (_ BitVec 32) Int) ListLongMap!18005)

(assert (=> b!1220472 (= lt!555016 (getCurrentListMapNoExtraKeys!5441 lt!555025 lt!555024 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78807)

(assert (=> b!1220472 (= lt!555017 (getCurrentListMapNoExtraKeys!5441 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555026 () Unit!40438)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1134 (array!78805 array!78807 (_ BitVec 32) (_ BitVec 32) V!46477 V!46477 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40438)

(assert (=> b!1220472 (= lt!555026 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1134 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220474 () Bool)

(declare-fun res!810704 () Bool)

(assert (=> b!1220474 (=> (not res!810704) (not e!693026))))

(assert (=> b!1220474 (= res!810704 (and (= (size!38569 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38568 _keys!1208) (size!38569 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220475 () Bool)

(assert (=> b!1220475 (= e!693025 e!693027)))

(declare-fun res!810714 () Bool)

(assert (=> b!1220475 (=> res!810714 e!693027)))

(assert (=> b!1220475 (= res!810714 (not (= (select (arr!38032 _keys!1208) from!1455) k!934)))))

(declare-fun e!693032 () Bool)

(assert (=> b!1220475 e!693032))

(declare-fun res!810706 () Bool)

(assert (=> b!1220475 (=> (not res!810706) (not e!693032))))

(declare-fun lt!555020 () ListLongMap!18005)

(declare-fun lt!555021 () V!46477)

(declare-fun +!4085 (ListLongMap!18005 tuple2!20036) ListLongMap!18005)

(declare-fun get!19404 (ValueCell!14797 V!46477) V!46477)

(assert (=> b!1220475 (= res!810706 (= lt!555020 (+!4085 lt!555019 (tuple2!20037 (select (arr!38032 _keys!1208) from!1455) (get!19404 (select (arr!38033 _values!996) from!1455) lt!555021)))))))

(declare-fun b!1220476 () Bool)

(declare-fun res!810707 () Bool)

(assert (=> b!1220476 (=> (not res!810707) (not e!693026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220476 (= res!810707 (validMask!0 mask!1564))))

(declare-fun b!1220477 () Bool)

(assert (=> b!1220477 (= e!693032 e!693034)))

(declare-fun res!810713 () Bool)

(assert (=> b!1220477 (=> res!810713 e!693034)))

(assert (=> b!1220477 (= res!810713 (not (= (select (arr!38032 _keys!1208) from!1455) k!934)))))

(declare-fun b!1220478 () Bool)

(declare-fun e!693030 () Bool)

(assert (=> b!1220478 (= e!693030 tp_is_empty!31013)))

(declare-fun b!1220479 () Bool)

(assert (=> b!1220479 (= e!693031 e!693033)))

(declare-fun res!810712 () Bool)

(assert (=> b!1220479 (=> res!810712 e!693033)))

(assert (=> b!1220479 (= res!810712 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1220479 (= lt!555020 (getCurrentListMapNoExtraKeys!5441 lt!555025 lt!555024 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1220479 (= lt!555024 (array!78808 (store (arr!38033 _values!996) i!673 (ValueCellFull!14797 lt!555021)) (size!38569 _values!996)))))

(declare-fun dynLambda!3322 (Int (_ BitVec 64)) V!46477)

(assert (=> b!1220479 (= lt!555021 (dynLambda!3322 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555018 () ListLongMap!18005)

(assert (=> b!1220479 (= lt!555018 (getCurrentListMapNoExtraKeys!5441 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48409 () Bool)

(declare-fun tp!91964 () Bool)

(assert (=> mapNonEmpty!48409 (= mapRes!48409 (and tp!91964 e!693030))))

(declare-fun mapRest!48409 () (Array (_ BitVec 32) ValueCell!14797))

(declare-fun mapValue!48409 () ValueCell!14797)

(declare-fun mapKey!48409 () (_ BitVec 32))

(assert (=> mapNonEmpty!48409 (= (arr!38033 _values!996) (store mapRest!48409 mapKey!48409 mapValue!48409))))

(declare-fun b!1220480 () Bool)

(declare-fun res!810705 () Bool)

(assert (=> b!1220480 (=> (not res!810705) (not e!693026))))

(assert (=> b!1220480 (= res!810705 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38568 _keys!1208))))))

(declare-fun b!1220481 () Bool)

(declare-fun res!810701 () Bool)

(assert (=> b!1220481 (=> (not res!810701) (not e!693023))))

(assert (=> b!1220481 (= res!810701 (arrayNoDuplicates!0 lt!555025 #b00000000000000000000000000000000 Nil!26833))))

(declare-fun res!810711 () Bool)

(assert (=> start!101522 (=> (not res!810711) (not e!693026))))

(assert (=> start!101522 (= res!810711 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38568 _keys!1208))))))

(assert (=> start!101522 e!693026))

(assert (=> start!101522 tp_is_empty!31013))

(declare-fun array_inv!28942 (array!78805) Bool)

(assert (=> start!101522 (array_inv!28942 _keys!1208)))

(assert (=> start!101522 true))

(assert (=> start!101522 tp!91963))

(declare-fun e!693029 () Bool)

(declare-fun array_inv!28943 (array!78807) Bool)

(assert (=> start!101522 (and (array_inv!28943 _values!996) e!693029)))

(declare-fun b!1220473 () Bool)

(declare-fun res!810710 () Bool)

(assert (=> b!1220473 (=> (not res!810710) (not e!693026))))

(assert (=> b!1220473 (= res!810710 (= (select (arr!38032 _keys!1208) i!673) k!934))))

(declare-fun b!1220482 () Bool)

(declare-fun res!810708 () Bool)

(assert (=> b!1220482 (=> (not res!810708) (not e!693026))))

(assert (=> b!1220482 (= res!810708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220483 () Bool)

(assert (=> b!1220483 (= e!693029 (and e!693028 mapRes!48409))))

(declare-fun condMapEmpty!48409 () Bool)

(declare-fun mapDefault!48409 () ValueCell!14797)

