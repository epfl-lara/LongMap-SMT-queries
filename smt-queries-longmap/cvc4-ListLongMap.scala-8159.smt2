; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99824 () Bool)

(assert start!99824)

(declare-fun b_free!25403 () Bool)

(declare-fun b_next!25403 () Bool)

(assert (=> start!99824 (= b_free!25403 (not b_next!25403))))

(declare-fun tp!88923 () Bool)

(declare-fun b_and!41673 () Bool)

(assert (=> start!99824 (= tp!88923 b_and!41673)))

(declare-fun b!1186779 () Bool)

(declare-fun e!674790 () Bool)

(declare-fun e!674784 () Bool)

(assert (=> b!1186779 (= e!674790 e!674784)))

(declare-fun res!788970 () Bool)

(assert (=> b!1186779 (=> (not res!788970) (not e!674784))))

(declare-datatypes ((array!76661 0))(
  ( (array!76662 (arr!36980 (Array (_ BitVec 32) (_ BitVec 64))) (size!37516 (_ BitVec 32))) )
))
(declare-fun lt!539240 () array!76661)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76661 (_ BitVec 32)) Bool)

(assert (=> b!1186779 (= res!788970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539240 mask!1564))))

(declare-fun _keys!1208 () array!76661)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1186779 (= lt!539240 (array!76662 (store (arr!36980 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37516 _keys!1208)))))

(declare-fun b!1186780 () Bool)

(declare-fun res!788982 () Bool)

(assert (=> b!1186780 (=> (not res!788982) (not e!674790))))

(assert (=> b!1186780 (= res!788982 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37516 _keys!1208))))))

(declare-fun b!1186781 () Bool)

(declare-fun res!788983 () Bool)

(assert (=> b!1186781 (=> (not res!788983) (not e!674790))))

(declare-datatypes ((List!26020 0))(
  ( (Nil!26017) (Cons!26016 (h!27225 (_ BitVec 64)) (t!38415 List!26020)) )
))
(declare-fun arrayNoDuplicates!0 (array!76661 (_ BitVec 32) List!26020) Bool)

(assert (=> b!1186781 (= res!788983 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26017))))

(declare-fun b!1186782 () Bool)

(declare-fun e!674793 () Bool)

(assert (=> b!1186782 (= e!674793 true)))

(declare-datatypes ((V!45037 0))(
  ( (V!45038 (val!15023 Int)) )
))
(declare-datatypes ((tuple2!19280 0))(
  ( (tuple2!19281 (_1!9651 (_ BitVec 64)) (_2!9651 V!45037)) )
))
(declare-datatypes ((List!26021 0))(
  ( (Nil!26018) (Cons!26017 (h!27226 tuple2!19280) (t!38416 List!26021)) )
))
(declare-datatypes ((ListLongMap!17249 0))(
  ( (ListLongMap!17250 (toList!8640 List!26021)) )
))
(declare-fun lt!539238 () ListLongMap!17249)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!539243 () ListLongMap!17249)

(declare-fun -!1672 (ListLongMap!17249 (_ BitVec 64)) ListLongMap!17249)

(assert (=> b!1186782 (= (-!1672 lt!539238 k!934) lt!539243)))

(declare-datatypes ((Unit!39343 0))(
  ( (Unit!39344) )
))
(declare-fun lt!539250 () Unit!39343)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!539249 () V!45037)

(declare-fun lt!539246 () ListLongMap!17249)

(declare-fun addRemoveCommutativeForDiffKeys!195 (ListLongMap!17249 (_ BitVec 64) V!45037 (_ BitVec 64)) Unit!39343)

(assert (=> b!1186782 (= lt!539250 (addRemoveCommutativeForDiffKeys!195 lt!539246 (select (arr!36980 _keys!1208) from!1455) lt!539249 k!934))))

(declare-fun lt!539255 () ListLongMap!17249)

(declare-fun lt!539239 () ListLongMap!17249)

(declare-fun lt!539247 () ListLongMap!17249)

(assert (=> b!1186782 (and (= lt!539247 lt!539238) (= lt!539255 lt!539239))))

(declare-fun lt!539244 () tuple2!19280)

(declare-fun +!3932 (ListLongMap!17249 tuple2!19280) ListLongMap!17249)

(assert (=> b!1186782 (= lt!539238 (+!3932 lt!539246 lt!539244))))

(assert (=> b!1186782 (not (= (select (arr!36980 _keys!1208) from!1455) k!934))))

(declare-fun lt!539251 () Unit!39343)

(declare-fun e!674783 () Unit!39343)

(assert (=> b!1186782 (= lt!539251 e!674783)))

(declare-fun c!117228 () Bool)

(assert (=> b!1186782 (= c!117228 (= (select (arr!36980 _keys!1208) from!1455) k!934))))

(declare-fun e!674791 () Bool)

(assert (=> b!1186782 e!674791))

(declare-fun res!788978 () Bool)

(assert (=> b!1186782 (=> (not res!788978) (not e!674791))))

(declare-fun lt!539242 () ListLongMap!17249)

(assert (=> b!1186782 (= res!788978 (= lt!539242 lt!539243))))

(assert (=> b!1186782 (= lt!539243 (+!3932 lt!539255 lt!539244))))

(assert (=> b!1186782 (= lt!539244 (tuple2!19281 (select (arr!36980 _keys!1208) from!1455) lt!539249))))

(declare-fun lt!539254 () V!45037)

(declare-datatypes ((ValueCell!14257 0))(
  ( (ValueCellFull!14257 (v!17661 V!45037)) (EmptyCell!14257) )
))
(declare-datatypes ((array!76663 0))(
  ( (array!76664 (arr!36981 (Array (_ BitVec 32) ValueCell!14257)) (size!37517 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76663)

(declare-fun get!18939 (ValueCell!14257 V!45037) V!45037)

(assert (=> b!1186782 (= lt!539249 (get!18939 (select (arr!36981 _values!996) from!1455) lt!539254))))

(declare-fun b!1186783 () Bool)

(declare-fun e!674786 () Bool)

(declare-fun tp_is_empty!29933 () Bool)

(assert (=> b!1186783 (= e!674786 tp_is_empty!29933)))

(declare-fun b!1186784 () Bool)

(declare-fun e!674789 () Bool)

(assert (=> b!1186784 (= e!674784 (not e!674789))))

(declare-fun res!788975 () Bool)

(assert (=> b!1186784 (=> res!788975 e!674789)))

(assert (=> b!1186784 (= res!788975 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186784 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!539248 () Unit!39343)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76661 (_ BitVec 64) (_ BitVec 32)) Unit!39343)

(assert (=> b!1186784 (= lt!539248 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1186785 () Bool)

(declare-fun res!788969 () Bool)

(assert (=> b!1186785 (=> (not res!788969) (not e!674790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186785 (= res!788969 (validMask!0 mask!1564))))

(declare-fun res!788981 () Bool)

(assert (=> start!99824 (=> (not res!788981) (not e!674790))))

(assert (=> start!99824 (= res!788981 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37516 _keys!1208))))))

(assert (=> start!99824 e!674790))

(assert (=> start!99824 tp_is_empty!29933))

(declare-fun array_inv!28220 (array!76661) Bool)

(assert (=> start!99824 (array_inv!28220 _keys!1208)))

(assert (=> start!99824 true))

(assert (=> start!99824 tp!88923))

(declare-fun e!674785 () Bool)

(declare-fun array_inv!28221 (array!76663) Bool)

(assert (=> start!99824 (and (array_inv!28221 _values!996) e!674785)))

(declare-fun b!1186786 () Bool)

(declare-fun res!788976 () Bool)

(assert (=> b!1186786 (=> (not res!788976) (not e!674790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186786 (= res!788976 (validKeyInArray!0 k!934))))

(declare-fun b!1186787 () Bool)

(declare-fun res!788977 () Bool)

(assert (=> b!1186787 (=> (not res!788977) (not e!674790))))

(assert (=> b!1186787 (= res!788977 (= (select (arr!36980 _keys!1208) i!673) k!934))))

(declare-fun b!1186788 () Bool)

(declare-fun Unit!39345 () Unit!39343)

(assert (=> b!1186788 (= e!674783 Unit!39345)))

(declare-fun b!1186789 () Bool)

(declare-fun e!674787 () Bool)

(assert (=> b!1186789 (= e!674787 tp_is_empty!29933)))

(declare-fun b!1186790 () Bool)

(declare-fun res!788980 () Bool)

(assert (=> b!1186790 (=> (not res!788980) (not e!674790))))

(assert (=> b!1186790 (= res!788980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186791 () Bool)

(declare-fun res!788974 () Bool)

(assert (=> b!1186791 (=> (not res!788974) (not e!674784))))

(assert (=> b!1186791 (= res!788974 (arrayNoDuplicates!0 lt!539240 #b00000000000000000000000000000000 Nil!26017))))

(declare-fun mapNonEmpty!46727 () Bool)

(declare-fun mapRes!46727 () Bool)

(declare-fun tp!88922 () Bool)

(assert (=> mapNonEmpty!46727 (= mapRes!46727 (and tp!88922 e!674787))))

(declare-fun mapRest!46727 () (Array (_ BitVec 32) ValueCell!14257))

(declare-fun mapValue!46727 () ValueCell!14257)

(declare-fun mapKey!46727 () (_ BitVec 32))

(assert (=> mapNonEmpty!46727 (= (arr!36981 _values!996) (store mapRest!46727 mapKey!46727 mapValue!46727))))

(declare-fun b!1186792 () Bool)

(declare-fun e!674794 () Bool)

(assert (=> b!1186792 (= e!674789 e!674794)))

(declare-fun res!788979 () Bool)

(assert (=> b!1186792 (=> res!788979 e!674794)))

(assert (=> b!1186792 (= res!788979 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45037)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!539245 () array!76663)

(declare-fun minValue!944 () V!45037)

(declare-fun getCurrentListMapNoExtraKeys!5083 (array!76661 array!76663 (_ BitVec 32) (_ BitVec 32) V!45037 V!45037 (_ BitVec 32) Int) ListLongMap!17249)

(assert (=> b!1186792 (= lt!539242 (getCurrentListMapNoExtraKeys!5083 lt!539240 lt!539245 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1186792 (= lt!539245 (array!76664 (store (arr!36981 _values!996) i!673 (ValueCellFull!14257 lt!539254)) (size!37517 _values!996)))))

(declare-fun dynLambda!3032 (Int (_ BitVec 64)) V!45037)

(assert (=> b!1186792 (= lt!539254 (dynLambda!3032 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1186792 (= lt!539247 (getCurrentListMapNoExtraKeys!5083 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1186793 () Bool)

(assert (=> b!1186793 (= e!674785 (and e!674786 mapRes!46727))))

(declare-fun condMapEmpty!46727 () Bool)

(declare-fun mapDefault!46727 () ValueCell!14257)

