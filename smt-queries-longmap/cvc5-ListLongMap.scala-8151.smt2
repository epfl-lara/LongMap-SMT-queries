; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99772 () Bool)

(assert start!99772)

(declare-fun b_free!25351 () Bool)

(declare-fun b_next!25351 () Bool)

(assert (=> start!99772 (= b_free!25351 (not b_next!25351))))

(declare-fun tp!88766 () Bool)

(declare-fun b_and!41569 () Bool)

(assert (=> start!99772 (= tp!88766 b_and!41569)))

(declare-fun b!1185167 () Bool)

(declare-datatypes ((Unit!39253 0))(
  ( (Unit!39254) )
))
(declare-fun e!673853 () Unit!39253)

(declare-fun Unit!39255 () Unit!39253)

(assert (=> b!1185167 (= e!673853 Unit!39255)))

(declare-fun e!673849 () Bool)

(declare-datatypes ((array!76559 0))(
  ( (array!76560 (arr!36929 (Array (_ BitVec 32) (_ BitVec 64))) (size!37465 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76559)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1185168 () Bool)

(declare-fun arrayContainsKey!0 (array!76559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185168 (= e!673849 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1185169 () Bool)

(declare-fun res!787801 () Bool)

(declare-fun e!673850 () Bool)

(assert (=> b!1185169 (=> (not res!787801) (not e!673850))))

(declare-datatypes ((List!25974 0))(
  ( (Nil!25971) (Cons!25970 (h!27179 (_ BitVec 64)) (t!38317 List!25974)) )
))
(declare-fun arrayNoDuplicates!0 (array!76559 (_ BitVec 32) List!25974) Bool)

(assert (=> b!1185169 (= res!787801 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25971))))

(declare-fun b!1185170 () Bool)

(declare-fun res!787807 () Bool)

(assert (=> b!1185170 (=> (not res!787807) (not e!673850))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76559 (_ BitVec 32)) Bool)

(assert (=> b!1185170 (= res!787807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185172 () Bool)

(declare-fun res!787800 () Bool)

(assert (=> b!1185172 (=> (not res!787800) (not e!673850))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44969 0))(
  ( (V!44970 (val!14997 Int)) )
))
(declare-datatypes ((ValueCell!14231 0))(
  ( (ValueCellFull!14231 (v!17635 V!44969)) (EmptyCell!14231) )
))
(declare-datatypes ((array!76561 0))(
  ( (array!76562 (arr!36930 (Array (_ BitVec 32) ValueCell!14231)) (size!37466 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76561)

(assert (=> b!1185172 (= res!787800 (and (= (size!37466 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37465 _keys!1208) (size!37466 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185173 () Bool)

(declare-fun res!787799 () Bool)

(assert (=> b!1185173 (=> (not res!787799) (not e!673850))))

(assert (=> b!1185173 (= res!787799 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37465 _keys!1208))))))

(declare-fun b!1185174 () Bool)

(declare-fun Unit!39256 () Unit!39253)

(assert (=> b!1185174 (= e!673853 Unit!39256)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!537766 () Unit!39253)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76559 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39253)

(assert (=> b!1185174 (= lt!537766 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185174 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537759 () Unit!39253)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76559 (_ BitVec 32) (_ BitVec 32)) Unit!39253)

(assert (=> b!1185174 (= lt!537759 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185174 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25971)))

(declare-fun lt!537771 () Unit!39253)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76559 (_ BitVec 64) (_ BitVec 32) List!25974) Unit!39253)

(assert (=> b!1185174 (= lt!537771 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25971))))

(assert (=> b!1185174 false))

(declare-fun b!1185175 () Bool)

(declare-fun e!673855 () Bool)

(declare-fun e!673852 () Bool)

(assert (=> b!1185175 (= e!673855 (not e!673852))))

(declare-fun res!787803 () Bool)

(assert (=> b!1185175 (=> res!787803 e!673852)))

(assert (=> b!1185175 (= res!787803 (bvsgt from!1455 i!673))))

(assert (=> b!1185175 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!537765 () Unit!39253)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76559 (_ BitVec 64) (_ BitVec 32)) Unit!39253)

(assert (=> b!1185175 (= lt!537765 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1185176 () Bool)

(declare-fun res!787804 () Bool)

(assert (=> b!1185176 (=> (not res!787804) (not e!673850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185176 (= res!787804 (validKeyInArray!0 k!934))))

(declare-fun b!1185177 () Bool)

(declare-fun e!673848 () Bool)

(declare-fun e!673851 () Bool)

(assert (=> b!1185177 (= e!673848 e!673851)))

(declare-fun res!787806 () Bool)

(assert (=> b!1185177 (=> res!787806 e!673851)))

(assert (=> b!1185177 (= res!787806 (not (validKeyInArray!0 (select (arr!36929 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19234 0))(
  ( (tuple2!19235 (_1!9628 (_ BitVec 64)) (_2!9628 V!44969)) )
))
(declare-datatypes ((List!25975 0))(
  ( (Nil!25972) (Cons!25971 (h!27180 tuple2!19234) (t!38318 List!25975)) )
))
(declare-datatypes ((ListLongMap!17203 0))(
  ( (ListLongMap!17204 (toList!8617 List!25975)) )
))
(declare-fun lt!537763 () ListLongMap!17203)

(declare-fun lt!537770 () ListLongMap!17203)

(assert (=> b!1185177 (= lt!537763 lt!537770)))

(declare-fun lt!537757 () ListLongMap!17203)

(declare-fun -!1652 (ListLongMap!17203 (_ BitVec 64)) ListLongMap!17203)

(assert (=> b!1185177 (= lt!537770 (-!1652 lt!537757 k!934))))

(declare-fun zeroValue!944 () V!44969)

(declare-fun lt!537768 () array!76561)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537767 () array!76559)

(declare-fun minValue!944 () V!44969)

(declare-fun getCurrentListMapNoExtraKeys!5064 (array!76559 array!76561 (_ BitVec 32) (_ BitVec 32) V!44969 V!44969 (_ BitVec 32) Int) ListLongMap!17203)

(assert (=> b!1185177 (= lt!537763 (getCurrentListMapNoExtraKeys!5064 lt!537767 lt!537768 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185177 (= lt!537757 (getCurrentListMapNoExtraKeys!5064 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537764 () Unit!39253)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!869 (array!76559 array!76561 (_ BitVec 32) (_ BitVec 32) V!44969 V!44969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39253)

(assert (=> b!1185177 (= lt!537764 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!869 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185178 () Bool)

(declare-fun res!787805 () Bool)

(assert (=> b!1185178 (=> (not res!787805) (not e!673850))))

(assert (=> b!1185178 (= res!787805 (= (select (arr!36929 _keys!1208) i!673) k!934))))

(declare-fun b!1185179 () Bool)

(assert (=> b!1185179 (= e!673850 e!673855)))

(declare-fun res!787802 () Bool)

(assert (=> b!1185179 (=> (not res!787802) (not e!673855))))

(assert (=> b!1185179 (= res!787802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537767 mask!1564))))

(assert (=> b!1185179 (= lt!537767 (array!76560 (store (arr!36929 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37465 _keys!1208)))))

(declare-fun b!1185180 () Bool)

(assert (=> b!1185180 (= e!673851 true)))

(declare-fun lt!537772 () ListLongMap!17203)

(declare-fun lt!537756 () ListLongMap!17203)

(assert (=> b!1185180 (= (-!1652 lt!537772 k!934) lt!537756)))

(declare-fun lt!537758 () Unit!39253)

(declare-fun lt!537762 () V!44969)

(declare-fun addRemoveCommutativeForDiffKeys!177 (ListLongMap!17203 (_ BitVec 64) V!44969 (_ BitVec 64)) Unit!39253)

(assert (=> b!1185180 (= lt!537758 (addRemoveCommutativeForDiffKeys!177 lt!537757 (select (arr!36929 _keys!1208) from!1455) lt!537762 k!934))))

(declare-fun lt!537769 () ListLongMap!17203)

(assert (=> b!1185180 (and (= lt!537769 lt!537772) (= lt!537770 lt!537763))))

(declare-fun lt!537774 () tuple2!19234)

(declare-fun +!3914 (ListLongMap!17203 tuple2!19234) ListLongMap!17203)

(assert (=> b!1185180 (= lt!537772 (+!3914 lt!537757 lt!537774))))

(assert (=> b!1185180 (not (= (select (arr!36929 _keys!1208) from!1455) k!934))))

(declare-fun lt!537761 () Unit!39253)

(assert (=> b!1185180 (= lt!537761 e!673853)))

(declare-fun c!117150 () Bool)

(assert (=> b!1185180 (= c!117150 (= (select (arr!36929 _keys!1208) from!1455) k!934))))

(declare-fun e!673857 () Bool)

(assert (=> b!1185180 e!673857))

(declare-fun res!787813 () Bool)

(assert (=> b!1185180 (=> (not res!787813) (not e!673857))))

(declare-fun lt!537760 () ListLongMap!17203)

(assert (=> b!1185180 (= res!787813 (= lt!537760 lt!537756))))

(assert (=> b!1185180 (= lt!537756 (+!3914 lt!537770 lt!537774))))

(assert (=> b!1185180 (= lt!537774 (tuple2!19235 (select (arr!36929 _keys!1208) from!1455) lt!537762))))

(declare-fun lt!537773 () V!44969)

(declare-fun get!18905 (ValueCell!14231 V!44969) V!44969)

(assert (=> b!1185180 (= lt!537762 (get!18905 (select (arr!36930 _values!996) from!1455) lt!537773))))

(declare-fun mapNonEmpty!46649 () Bool)

(declare-fun mapRes!46649 () Bool)

(declare-fun tp!88767 () Bool)

(declare-fun e!673856 () Bool)

(assert (=> mapNonEmpty!46649 (= mapRes!46649 (and tp!88767 e!673856))))

(declare-fun mapValue!46649 () ValueCell!14231)

(declare-fun mapRest!46649 () (Array (_ BitVec 32) ValueCell!14231))

(declare-fun mapKey!46649 () (_ BitVec 32))

(assert (=> mapNonEmpty!46649 (= (arr!36930 _values!996) (store mapRest!46649 mapKey!46649 mapValue!46649))))

(declare-fun b!1185171 () Bool)

(assert (=> b!1185171 (= e!673857 e!673849)))

(declare-fun res!787811 () Bool)

(assert (=> b!1185171 (=> res!787811 e!673849)))

(assert (=> b!1185171 (= res!787811 (not (= (select (arr!36929 _keys!1208) from!1455) k!934)))))

(declare-fun res!787808 () Bool)

(assert (=> start!99772 (=> (not res!787808) (not e!673850))))

(assert (=> start!99772 (= res!787808 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37465 _keys!1208))))))

(assert (=> start!99772 e!673850))

(declare-fun tp_is_empty!29881 () Bool)

(assert (=> start!99772 tp_is_empty!29881))

(declare-fun array_inv!28182 (array!76559) Bool)

(assert (=> start!99772 (array_inv!28182 _keys!1208)))

(assert (=> start!99772 true))

(assert (=> start!99772 tp!88766))

(declare-fun e!673847 () Bool)

(declare-fun array_inv!28183 (array!76561) Bool)

(assert (=> start!99772 (and (array_inv!28183 _values!996) e!673847)))

(declare-fun b!1185181 () Bool)

(assert (=> b!1185181 (= e!673856 tp_is_empty!29881)))

(declare-fun b!1185182 () Bool)

(assert (=> b!1185182 (= e!673852 e!673848)))

(declare-fun res!787809 () Bool)

(assert (=> b!1185182 (=> res!787809 e!673848)))

(assert (=> b!1185182 (= res!787809 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1185182 (= lt!537760 (getCurrentListMapNoExtraKeys!5064 lt!537767 lt!537768 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1185182 (= lt!537768 (array!76562 (store (arr!36930 _values!996) i!673 (ValueCellFull!14231 lt!537773)) (size!37466 _values!996)))))

(declare-fun dynLambda!3015 (Int (_ BitVec 64)) V!44969)

(assert (=> b!1185182 (= lt!537773 (dynLambda!3015 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1185182 (= lt!537769 (getCurrentListMapNoExtraKeys!5064 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185183 () Bool)

(declare-fun res!787812 () Bool)

(assert (=> b!1185183 (=> (not res!787812) (not e!673850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185183 (= res!787812 (validMask!0 mask!1564))))

(declare-fun b!1185184 () Bool)

(declare-fun e!673854 () Bool)

(assert (=> b!1185184 (= e!673847 (and e!673854 mapRes!46649))))

(declare-fun condMapEmpty!46649 () Bool)

(declare-fun mapDefault!46649 () ValueCell!14231)

