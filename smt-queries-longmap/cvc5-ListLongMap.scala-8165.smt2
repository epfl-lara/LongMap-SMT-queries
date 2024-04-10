; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99856 () Bool)

(assert start!99856)

(declare-fun b_free!25435 () Bool)

(declare-fun b_next!25435 () Bool)

(assert (=> start!99856 (= b_free!25435 (not b_next!25435))))

(declare-fun tp!89019 () Bool)

(declare-fun b_and!41737 () Bool)

(assert (=> start!99856 (= tp!89019 b_and!41737)))

(declare-fun b!1187771 () Bool)

(declare-fun e!675365 () Bool)

(declare-fun tp_is_empty!29965 () Bool)

(assert (=> b!1187771 (= e!675365 tp_is_empty!29965)))

(declare-fun b!1187772 () Bool)

(declare-fun res!789703 () Bool)

(declare-fun e!675359 () Bool)

(assert (=> b!1187772 (=> (not res!789703) (not e!675359))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76725 0))(
  ( (array!76726 (arr!37012 (Array (_ BitVec 32) (_ BitVec 64))) (size!37548 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76725)

(assert (=> b!1187772 (= res!789703 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37548 _keys!1208))))))

(declare-fun b!1187773 () Bool)

(declare-fun res!789700 () Bool)

(declare-fun e!675361 () Bool)

(assert (=> b!1187773 (=> (not res!789700) (not e!675361))))

(declare-fun lt!540167 () array!76725)

(declare-datatypes ((List!26048 0))(
  ( (Nil!26045) (Cons!26044 (h!27253 (_ BitVec 64)) (t!38475 List!26048)) )
))
(declare-fun arrayNoDuplicates!0 (array!76725 (_ BitVec 32) List!26048) Bool)

(assert (=> b!1187773 (= res!789700 (arrayNoDuplicates!0 lt!540167 #b00000000000000000000000000000000 Nil!26045))))

(declare-fun b!1187774 () Bool)

(declare-datatypes ((Unit!39395 0))(
  ( (Unit!39396) )
))
(declare-fun e!675367 () Unit!39395)

(declare-fun Unit!39397 () Unit!39395)

(assert (=> b!1187774 (= e!675367 Unit!39397)))

(declare-fun lt!540152 () Unit!39395)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76725 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39395)

(assert (=> b!1187774 (= lt!540152 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187774 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!540153 () Unit!39395)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76725 (_ BitVec 32) (_ BitVec 32)) Unit!39395)

(assert (=> b!1187774 (= lt!540153 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1187774 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26045)))

(declare-fun lt!540156 () Unit!39395)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76725 (_ BitVec 64) (_ BitVec 32) List!26048) Unit!39395)

(assert (=> b!1187774 (= lt!540156 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26045))))

(assert (=> b!1187774 false))

(declare-fun b!1187775 () Bool)

(declare-fun e!675364 () Bool)

(declare-fun e!675366 () Bool)

(assert (=> b!1187775 (= e!675364 e!675366)))

(declare-fun res!789689 () Bool)

(assert (=> b!1187775 (=> res!789689 e!675366)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187775 (= res!789689 (not (validKeyInArray!0 (select (arr!37012 _keys!1208) from!1455))))))

(declare-datatypes ((V!45081 0))(
  ( (V!45082 (val!15039 Int)) )
))
(declare-datatypes ((tuple2!19308 0))(
  ( (tuple2!19309 (_1!9665 (_ BitVec 64)) (_2!9665 V!45081)) )
))
(declare-datatypes ((List!26049 0))(
  ( (Nil!26046) (Cons!26045 (h!27254 tuple2!19308) (t!38476 List!26049)) )
))
(declare-datatypes ((ListLongMap!17277 0))(
  ( (ListLongMap!17278 (toList!8654 List!26049)) )
))
(declare-fun lt!540157 () ListLongMap!17277)

(declare-fun lt!540165 () ListLongMap!17277)

(assert (=> b!1187775 (= lt!540157 lt!540165)))

(declare-fun lt!540159 () ListLongMap!17277)

(declare-fun -!1685 (ListLongMap!17277 (_ BitVec 64)) ListLongMap!17277)

(assert (=> b!1187775 (= lt!540165 (-!1685 lt!540159 k!934))))

(declare-fun zeroValue!944 () V!45081)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14273 0))(
  ( (ValueCellFull!14273 (v!17677 V!45081)) (EmptyCell!14273) )
))
(declare-datatypes ((array!76727 0))(
  ( (array!76728 (arr!37013 (Array (_ BitVec 32) ValueCell!14273)) (size!37549 (_ BitVec 32))) )
))
(declare-fun lt!540161 () array!76727)

(declare-fun minValue!944 () V!45081)

(declare-fun getCurrentListMapNoExtraKeys!5095 (array!76725 array!76727 (_ BitVec 32) (_ BitVec 32) V!45081 V!45081 (_ BitVec 32) Int) ListLongMap!17277)

(assert (=> b!1187775 (= lt!540157 (getCurrentListMapNoExtraKeys!5095 lt!540167 lt!540161 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76727)

(assert (=> b!1187775 (= lt!540159 (getCurrentListMapNoExtraKeys!5095 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!540150 () Unit!39395)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!895 (array!76725 array!76727 (_ BitVec 32) (_ BitVec 32) V!45081 V!45081 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39395)

(assert (=> b!1187775 (= lt!540150 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!895 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187776 () Bool)

(assert (=> b!1187776 (= e!675359 e!675361)))

(declare-fun res!789696 () Bool)

(assert (=> b!1187776 (=> (not res!789696) (not e!675361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76725 (_ BitVec 32)) Bool)

(assert (=> b!1187776 (= res!789696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540167 mask!1564))))

(assert (=> b!1187776 (= lt!540167 (array!76726 (store (arr!37012 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37548 _keys!1208)))))

(declare-fun b!1187777 () Bool)

(declare-fun res!789692 () Bool)

(assert (=> b!1187777 (=> (not res!789692) (not e!675359))))

(assert (=> b!1187777 (= res!789692 (= (select (arr!37012 _keys!1208) i!673) k!934))))

(declare-fun b!1187778 () Bool)

(assert (=> b!1187778 (= e!675366 true)))

(declare-fun lt!540158 () ListLongMap!17277)

(declare-fun lt!540155 () ListLongMap!17277)

(assert (=> b!1187778 (= (-!1685 lt!540158 k!934) lt!540155)))

(declare-fun lt!540151 () V!45081)

(declare-fun lt!540163 () Unit!39395)

(declare-fun addRemoveCommutativeForDiffKeys!204 (ListLongMap!17277 (_ BitVec 64) V!45081 (_ BitVec 64)) Unit!39395)

(assert (=> b!1187778 (= lt!540163 (addRemoveCommutativeForDiffKeys!204 lt!540159 (select (arr!37012 _keys!1208) from!1455) lt!540151 k!934))))

(declare-fun lt!540154 () ListLongMap!17277)

(assert (=> b!1187778 (and (= lt!540154 lt!540158) (= lt!540165 lt!540157))))

(declare-fun lt!540160 () tuple2!19308)

(declare-fun +!3941 (ListLongMap!17277 tuple2!19308) ListLongMap!17277)

(assert (=> b!1187778 (= lt!540158 (+!3941 lt!540159 lt!540160))))

(assert (=> b!1187778 (not (= (select (arr!37012 _keys!1208) from!1455) k!934))))

(declare-fun lt!540166 () Unit!39395)

(assert (=> b!1187778 (= lt!540166 e!675367)))

(declare-fun c!117276 () Bool)

(assert (=> b!1187778 (= c!117276 (= (select (arr!37012 _keys!1208) from!1455) k!934))))

(declare-fun e!675370 () Bool)

(assert (=> b!1187778 e!675370))

(declare-fun res!789698 () Bool)

(assert (=> b!1187778 (=> (not res!789698) (not e!675370))))

(declare-fun lt!540168 () ListLongMap!17277)

(assert (=> b!1187778 (= res!789698 (= lt!540168 lt!540155))))

(assert (=> b!1187778 (= lt!540155 (+!3941 lt!540165 lt!540160))))

(assert (=> b!1187778 (= lt!540160 (tuple2!19309 (select (arr!37012 _keys!1208) from!1455) lt!540151))))

(declare-fun lt!540164 () V!45081)

(declare-fun get!18960 (ValueCell!14273 V!45081) V!45081)

(assert (=> b!1187778 (= lt!540151 (get!18960 (select (arr!37013 _values!996) from!1455) lt!540164))))

(declare-fun mapNonEmpty!46775 () Bool)

(declare-fun mapRes!46775 () Bool)

(declare-fun tp!89018 () Bool)

(declare-fun e!675363 () Bool)

(assert (=> mapNonEmpty!46775 (= mapRes!46775 (and tp!89018 e!675363))))

(declare-fun mapRest!46775 () (Array (_ BitVec 32) ValueCell!14273))

(declare-fun mapValue!46775 () ValueCell!14273)

(declare-fun mapKey!46775 () (_ BitVec 32))

(assert (=> mapNonEmpty!46775 (= (arr!37013 _values!996) (store mapRest!46775 mapKey!46775 mapValue!46775))))

(declare-fun b!1187779 () Bool)

(declare-fun e!675369 () Bool)

(assert (=> b!1187779 (= e!675369 e!675364)))

(declare-fun res!789699 () Bool)

(assert (=> b!1187779 (=> res!789699 e!675364)))

(assert (=> b!1187779 (= res!789699 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1187779 (= lt!540168 (getCurrentListMapNoExtraKeys!5095 lt!540167 lt!540161 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1187779 (= lt!540161 (array!76728 (store (arr!37013 _values!996) i!673 (ValueCellFull!14273 lt!540164)) (size!37549 _values!996)))))

(declare-fun dynLambda!3041 (Int (_ BitVec 64)) V!45081)

(assert (=> b!1187779 (= lt!540164 (dynLambda!3041 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1187779 (= lt!540154 (getCurrentListMapNoExtraKeys!5095 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187780 () Bool)

(declare-fun res!789695 () Bool)

(assert (=> b!1187780 (=> (not res!789695) (not e!675359))))

(assert (=> b!1187780 (= res!789695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187781 () Bool)

(declare-fun e!675368 () Bool)

(assert (=> b!1187781 (= e!675368 (and e!675365 mapRes!46775))))

(declare-fun condMapEmpty!46775 () Bool)

(declare-fun mapDefault!46775 () ValueCell!14273)

