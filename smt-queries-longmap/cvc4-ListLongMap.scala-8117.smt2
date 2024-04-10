; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99572 () Bool)

(assert start!99572)

(declare-fun b_free!25151 () Bool)

(declare-fun b_next!25151 () Bool)

(assert (=> start!99572 (= b_free!25151 (not b_next!25151))))

(declare-fun tp!88166 () Bool)

(declare-fun b_and!41169 () Bool)

(assert (=> start!99572 (= tp!88166 b_and!41169)))

(declare-fun b!1178750 () Bool)

(declare-fun res!783087 () Bool)

(declare-fun e!670126 () Bool)

(assert (=> b!1178750 (=> (not res!783087) (not e!670126))))

(declare-datatypes ((array!76165 0))(
  ( (array!76166 (arr!36732 (Array (_ BitVec 32) (_ BitVec 64))) (size!37268 (_ BitVec 32))) )
))
(declare-fun lt!532574 () array!76165)

(declare-datatypes ((List!25802 0))(
  ( (Nil!25799) (Cons!25798 (h!27007 (_ BitVec 64)) (t!37945 List!25802)) )
))
(declare-fun arrayNoDuplicates!0 (array!76165 (_ BitVec 32) List!25802) Bool)

(assert (=> b!1178750 (= res!783087 (arrayNoDuplicates!0 lt!532574 #b00000000000000000000000000000000 Nil!25799))))

(declare-fun b!1178751 () Bool)

(declare-fun res!783097 () Bool)

(declare-fun e!670131 () Bool)

(assert (=> b!1178751 (=> (not res!783097) (not e!670131))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!76165)

(assert (=> b!1178751 (= res!783097 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37268 _keys!1208))))))

(declare-fun mapNonEmpty!46349 () Bool)

(declare-fun mapRes!46349 () Bool)

(declare-fun tp!88167 () Bool)

(declare-fun e!670123 () Bool)

(assert (=> mapNonEmpty!46349 (= mapRes!46349 (and tp!88167 e!670123))))

(declare-datatypes ((V!44701 0))(
  ( (V!44702 (val!14897 Int)) )
))
(declare-datatypes ((ValueCell!14131 0))(
  ( (ValueCellFull!14131 (v!17535 V!44701)) (EmptyCell!14131) )
))
(declare-fun mapRest!46349 () (Array (_ BitVec 32) ValueCell!14131))

(declare-fun mapKey!46349 () (_ BitVec 32))

(declare-datatypes ((array!76167 0))(
  ( (array!76168 (arr!36733 (Array (_ BitVec 32) ValueCell!14131)) (size!37269 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76167)

(declare-fun mapValue!46349 () ValueCell!14131)

(assert (=> mapNonEmpty!46349 (= (arr!36733 _values!996) (store mapRest!46349 mapKey!46349 mapValue!46349))))

(declare-fun b!1178752 () Bool)

(declare-fun e!670121 () Bool)

(declare-fun e!670120 () Bool)

(assert (=> b!1178752 (= e!670121 e!670120)))

(declare-fun res!783082 () Bool)

(assert (=> b!1178752 (=> res!783082 e!670120)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178752 (= res!783082 (not (validKeyInArray!0 (select (arr!36732 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19064 0))(
  ( (tuple2!19065 (_1!9543 (_ BitVec 64)) (_2!9543 V!44701)) )
))
(declare-datatypes ((List!25803 0))(
  ( (Nil!25800) (Cons!25799 (h!27008 tuple2!19064) (t!37946 List!25803)) )
))
(declare-datatypes ((ListLongMap!17033 0))(
  ( (ListLongMap!17034 (toList!8532 List!25803)) )
))
(declare-fun lt!532573 () ListLongMap!17033)

(declare-fun lt!532569 () ListLongMap!17033)

(assert (=> b!1178752 (= lt!532573 lt!532569)))

(declare-fun lt!532578 () ListLongMap!17033)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1578 (ListLongMap!17033 (_ BitVec 64)) ListLongMap!17033)

(assert (=> b!1178752 (= lt!532569 (-!1578 lt!532578 k!934))))

(declare-fun zeroValue!944 () V!44701)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532565 () array!76167)

(declare-fun minValue!944 () V!44701)

(declare-fun getCurrentListMapNoExtraKeys!4988 (array!76165 array!76167 (_ BitVec 32) (_ BitVec 32) V!44701 V!44701 (_ BitVec 32) Int) ListLongMap!17033)

(assert (=> b!1178752 (= lt!532573 (getCurrentListMapNoExtraKeys!4988 lt!532574 lt!532565 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178752 (= lt!532578 (getCurrentListMapNoExtraKeys!4988 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38942 0))(
  ( (Unit!38943) )
))
(declare-fun lt!532571 () Unit!38942)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!805 (array!76165 array!76167 (_ BitVec 32) (_ BitVec 32) V!44701 V!44701 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38942)

(assert (=> b!1178752 (= lt!532571 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!805 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178753 () Bool)

(declare-fun e!670128 () Unit!38942)

(declare-fun Unit!38944 () Unit!38942)

(assert (=> b!1178753 (= e!670128 Unit!38944)))

(declare-fun lt!532568 () Unit!38942)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76165 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38942)

(assert (=> b!1178753 (= lt!532568 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178753 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532566 () Unit!38942)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76165 (_ BitVec 32) (_ BitVec 32)) Unit!38942)

(assert (=> b!1178753 (= lt!532566 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178753 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25799)))

(declare-fun lt!532570 () Unit!38942)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76165 (_ BitVec 64) (_ BitVec 32) List!25802) Unit!38942)

(assert (=> b!1178753 (= lt!532570 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25799))))

(assert (=> b!1178753 false))

(declare-fun b!1178754 () Bool)

(declare-fun e!670132 () Bool)

(declare-fun tp_is_empty!29681 () Bool)

(assert (=> b!1178754 (= e!670132 tp_is_empty!29681)))

(declare-fun b!1178755 () Bool)

(declare-fun Unit!38945 () Unit!38942)

(assert (=> b!1178755 (= e!670128 Unit!38945)))

(declare-fun b!1178757 () Bool)

(declare-fun e!670130 () Bool)

(declare-fun e!670124 () Bool)

(assert (=> b!1178757 (= e!670130 e!670124)))

(declare-fun res!783093 () Bool)

(assert (=> b!1178757 (=> res!783093 e!670124)))

(assert (=> b!1178757 (= res!783093 (not (= (select (arr!36732 _keys!1208) from!1455) k!934)))))

(declare-fun b!1178758 () Bool)

(assert (=> b!1178758 (= e!670124 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1178759 () Bool)

(declare-fun res!783095 () Bool)

(assert (=> b!1178759 (=> (not res!783095) (not e!670131))))

(assert (=> b!1178759 (= res!783095 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25799))))

(declare-fun b!1178760 () Bool)

(declare-fun res!783092 () Bool)

(assert (=> b!1178760 (=> (not res!783092) (not e!670131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178760 (= res!783092 (validMask!0 mask!1564))))

(declare-fun b!1178761 () Bool)

(assert (=> b!1178761 (= e!670131 e!670126)))

(declare-fun res!783090 () Bool)

(assert (=> b!1178761 (=> (not res!783090) (not e!670126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76165 (_ BitVec 32)) Bool)

(assert (=> b!1178761 (= res!783090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532574 mask!1564))))

(assert (=> b!1178761 (= lt!532574 (array!76166 (store (arr!36732 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37268 _keys!1208)))))

(declare-fun b!1178762 () Bool)

(declare-fun e!670122 () Bool)

(assert (=> b!1178762 (= e!670126 (not e!670122))))

(declare-fun res!783089 () Bool)

(assert (=> b!1178762 (=> res!783089 e!670122)))

(assert (=> b!1178762 (= res!783089 (bvsgt from!1455 i!673))))

(assert (=> b!1178762 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!532572 () Unit!38942)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76165 (_ BitVec 64) (_ BitVec 32)) Unit!38942)

(assert (=> b!1178762 (= lt!532572 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1178763 () Bool)

(declare-fun res!783091 () Bool)

(assert (=> b!1178763 (=> (not res!783091) (not e!670131))))

(assert (=> b!1178763 (= res!783091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178764 () Bool)

(assert (=> b!1178764 (= e!670123 tp_is_empty!29681)))

(declare-fun lt!532575 () ListLongMap!17033)

(declare-fun lt!532567 () tuple2!19064)

(declare-fun b!1178765 () Bool)

(declare-fun e!670125 () Bool)

(declare-fun +!3846 (ListLongMap!17033 tuple2!19064) ListLongMap!17033)

(assert (=> b!1178765 (= e!670125 (= lt!532575 (+!3846 lt!532578 lt!532567)))))

(declare-fun b!1178766 () Bool)

(declare-fun e!670129 () Bool)

(assert (=> b!1178766 (= e!670129 (and e!670132 mapRes!46349))))

(declare-fun condMapEmpty!46349 () Bool)

(declare-fun mapDefault!46349 () ValueCell!14131)

