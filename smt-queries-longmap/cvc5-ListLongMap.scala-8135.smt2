; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99676 () Bool)

(assert start!99676)

(declare-fun b_free!25255 () Bool)

(declare-fun b_next!25255 () Bool)

(assert (=> start!99676 (= b_free!25255 (not b_next!25255))))

(declare-fun tp!88478 () Bool)

(declare-fun b_and!41377 () Bool)

(assert (=> start!99676 (= tp!88478 b_and!41377)))

(declare-fun b!1182191 () Bool)

(declare-fun e!672121 () Bool)

(declare-fun e!672128 () Bool)

(assert (=> b!1182191 (= e!672121 (not e!672128))))

(declare-fun res!785648 () Bool)

(assert (=> b!1182191 (=> res!785648 e!672128)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182191 (= res!785648 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76373 0))(
  ( (array!76374 (arr!36836 (Array (_ BitVec 32) (_ BitVec 64))) (size!37372 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76373)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182191 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39107 0))(
  ( (Unit!39108) )
))
(declare-fun lt!535030 () Unit!39107)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76373 (_ BitVec 64) (_ BitVec 32)) Unit!39107)

(assert (=> b!1182191 (= lt!535030 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1182192 () Bool)

(declare-fun res!785649 () Bool)

(declare-fun e!672130 () Bool)

(assert (=> b!1182192 (=> (not res!785649) (not e!672130))))

(declare-datatypes ((List!25897 0))(
  ( (Nil!25894) (Cons!25893 (h!27102 (_ BitVec 64)) (t!38144 List!25897)) )
))
(declare-fun arrayNoDuplicates!0 (array!76373 (_ BitVec 32) List!25897) Bool)

(assert (=> b!1182192 (= res!785649 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25894))))

(declare-fun b!1182193 () Bool)

(declare-fun e!672129 () Bool)

(assert (=> b!1182193 (= e!672128 e!672129)))

(declare-fun res!785640 () Bool)

(assert (=> b!1182193 (=> res!785640 e!672129)))

(assert (=> b!1182193 (= res!785640 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44841 0))(
  ( (V!44842 (val!14949 Int)) )
))
(declare-fun zeroValue!944 () V!44841)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!535024 () array!76373)

(declare-datatypes ((tuple2!19156 0))(
  ( (tuple2!19157 (_1!9589 (_ BitVec 64)) (_2!9589 V!44841)) )
))
(declare-datatypes ((List!25898 0))(
  ( (Nil!25895) (Cons!25894 (h!27103 tuple2!19156) (t!38145 List!25898)) )
))
(declare-datatypes ((ListLongMap!17125 0))(
  ( (ListLongMap!17126 (toList!8578 List!25898)) )
))
(declare-fun lt!535034 () ListLongMap!17125)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14183 0))(
  ( (ValueCellFull!14183 (v!17587 V!44841)) (EmptyCell!14183) )
))
(declare-datatypes ((array!76375 0))(
  ( (array!76376 (arr!36837 (Array (_ BitVec 32) ValueCell!14183)) (size!37373 (_ BitVec 32))) )
))
(declare-fun lt!535021 () array!76375)

(declare-fun minValue!944 () V!44841)

(declare-fun getCurrentListMapNoExtraKeys!5031 (array!76373 array!76375 (_ BitVec 32) (_ BitVec 32) V!44841 V!44841 (_ BitVec 32) Int) ListLongMap!17125)

(assert (=> b!1182193 (= lt!535034 (getCurrentListMapNoExtraKeys!5031 lt!535024 lt!535021 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76375)

(declare-fun lt!535035 () V!44841)

(assert (=> b!1182193 (= lt!535021 (array!76376 (store (arr!36837 _values!996) i!673 (ValueCellFull!14183 lt!535035)) (size!37373 _values!996)))))

(declare-fun dynLambda!2986 (Int (_ BitVec 64)) V!44841)

(assert (=> b!1182193 (= lt!535035 (dynLambda!2986 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!535023 () ListLongMap!17125)

(assert (=> b!1182193 (= lt!535023 (getCurrentListMapNoExtraKeys!5031 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182194 () Bool)

(declare-fun res!785641 () Bool)

(assert (=> b!1182194 (=> (not res!785641) (not e!672130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182194 (= res!785641 (validMask!0 mask!1564))))

(declare-fun e!672127 () Bool)

(declare-fun b!1182195 () Bool)

(assert (=> b!1182195 (= e!672127 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1182196 () Bool)

(declare-fun e!672125 () Bool)

(assert (=> b!1182196 (= e!672125 e!672127)))

(declare-fun res!785645 () Bool)

(assert (=> b!1182196 (=> res!785645 e!672127)))

(assert (=> b!1182196 (= res!785645 (not (= (select (arr!36836 _keys!1208) from!1455) k!934)))))

(declare-fun b!1182197 () Bool)

(declare-fun res!785639 () Bool)

(assert (=> b!1182197 (=> (not res!785639) (not e!672130))))

(assert (=> b!1182197 (= res!785639 (and (= (size!37373 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37372 _keys!1208) (size!37373 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!785650 () Bool)

(assert (=> start!99676 (=> (not res!785650) (not e!672130))))

(assert (=> start!99676 (= res!785650 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37372 _keys!1208))))))

(assert (=> start!99676 e!672130))

(declare-fun tp_is_empty!29785 () Bool)

(assert (=> start!99676 tp_is_empty!29785))

(declare-fun array_inv!28124 (array!76373) Bool)

(assert (=> start!99676 (array_inv!28124 _keys!1208)))

(assert (=> start!99676 true))

(assert (=> start!99676 tp!88478))

(declare-fun e!672126 () Bool)

(declare-fun array_inv!28125 (array!76375) Bool)

(assert (=> start!99676 (and (array_inv!28125 _values!996) e!672126)))

(declare-fun b!1182198 () Bool)

(declare-fun e!672119 () Unit!39107)

(declare-fun Unit!39109 () Unit!39107)

(assert (=> b!1182198 (= e!672119 Unit!39109)))

(declare-fun b!1182199 () Bool)

(declare-fun res!785647 () Bool)

(assert (=> b!1182199 (=> (not res!785647) (not e!672121))))

(assert (=> b!1182199 (= res!785647 (arrayNoDuplicates!0 lt!535024 #b00000000000000000000000000000000 Nil!25894))))

(declare-fun b!1182200 () Bool)

(declare-fun res!785652 () Bool)

(assert (=> b!1182200 (=> (not res!785652) (not e!672130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76373 (_ BitVec 32)) Bool)

(assert (=> b!1182200 (= res!785652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182201 () Bool)

(declare-fun e!672123 () Bool)

(assert (=> b!1182201 (= e!672123 tp_is_empty!29785)))

(declare-fun b!1182202 () Bool)

(declare-fun Unit!39110 () Unit!39107)

(assert (=> b!1182202 (= e!672119 Unit!39110)))

(declare-fun lt!535033 () Unit!39107)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76373 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39107)

(assert (=> b!1182202 (= lt!535033 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1182202 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535038 () Unit!39107)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76373 (_ BitVec 32) (_ BitVec 32)) Unit!39107)

(assert (=> b!1182202 (= lt!535038 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182202 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25894)))

(declare-fun lt!535031 () Unit!39107)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76373 (_ BitVec 64) (_ BitVec 32) List!25897) Unit!39107)

(assert (=> b!1182202 (= lt!535031 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25894))))

(assert (=> b!1182202 false))

(declare-fun b!1182203 () Bool)

(assert (=> b!1182203 (= e!672130 e!672121)))

(declare-fun res!785643 () Bool)

(assert (=> b!1182203 (=> (not res!785643) (not e!672121))))

(assert (=> b!1182203 (= res!785643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535024 mask!1564))))

(assert (=> b!1182203 (= lt!535024 (array!76374 (store (arr!36836 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37372 _keys!1208)))))

(declare-fun b!1182204 () Bool)

(declare-fun e!672124 () Bool)

(assert (=> b!1182204 (= e!672124 tp_is_empty!29785)))

(declare-fun b!1182205 () Bool)

(declare-fun e!672120 () Bool)

(assert (=> b!1182205 (= e!672129 e!672120)))

(declare-fun res!785644 () Bool)

(assert (=> b!1182205 (=> res!785644 e!672120)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182205 (= res!785644 (not (validKeyInArray!0 (select (arr!36836 _keys!1208) from!1455))))))

(declare-fun lt!535020 () ListLongMap!17125)

(declare-fun lt!535028 () ListLongMap!17125)

(assert (=> b!1182205 (= lt!535020 lt!535028)))

(declare-fun lt!535025 () ListLongMap!17125)

(declare-fun -!1616 (ListLongMap!17125 (_ BitVec 64)) ListLongMap!17125)

(assert (=> b!1182205 (= lt!535028 (-!1616 lt!535025 k!934))))

(assert (=> b!1182205 (= lt!535020 (getCurrentListMapNoExtraKeys!5031 lt!535024 lt!535021 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182205 (= lt!535025 (getCurrentListMapNoExtraKeys!5031 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535022 () Unit!39107)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!841 (array!76373 array!76375 (_ BitVec 32) (_ BitVec 32) V!44841 V!44841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39107)

(assert (=> b!1182205 (= lt!535022 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!841 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46505 () Bool)

(declare-fun mapRes!46505 () Bool)

(declare-fun tp!88479 () Bool)

(assert (=> mapNonEmpty!46505 (= mapRes!46505 (and tp!88479 e!672123))))

(declare-fun mapRest!46505 () (Array (_ BitVec 32) ValueCell!14183))

(declare-fun mapValue!46505 () ValueCell!14183)

(declare-fun mapKey!46505 () (_ BitVec 32))

(assert (=> mapNonEmpty!46505 (= (arr!36837 _values!996) (store mapRest!46505 mapKey!46505 mapValue!46505))))

(declare-fun b!1182206 () Bool)

(declare-fun res!785653 () Bool)

(assert (=> b!1182206 (=> (not res!785653) (not e!672130))))

(assert (=> b!1182206 (= res!785653 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37372 _keys!1208))))))

(declare-fun b!1182207 () Bool)

(assert (=> b!1182207 (= e!672126 (and e!672124 mapRes!46505))))

(declare-fun condMapEmpty!46505 () Bool)

(declare-fun mapDefault!46505 () ValueCell!14183)

