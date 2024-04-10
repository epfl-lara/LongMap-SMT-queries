; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99668 () Bool)

(assert start!99668)

(declare-fun b_free!25247 () Bool)

(declare-fun b_next!25247 () Bool)

(assert (=> start!99668 (= b_free!25247 (not b_next!25247))))

(declare-fun tp!88454 () Bool)

(declare-fun b_and!41361 () Bool)

(assert (=> start!99668 (= tp!88454 b_and!41361)))

(declare-fun b!1181943 () Bool)

(declare-fun res!785469 () Bool)

(declare-fun e!671977 () Bool)

(assert (=> b!1181943 (=> (not res!785469) (not e!671977))))

(declare-datatypes ((array!76357 0))(
  ( (array!76358 (arr!36828 (Array (_ BitVec 32) (_ BitVec 64))) (size!37364 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76357)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1181943 (= res!785469 (= (select (arr!36828 _keys!1208) i!673) k!934))))

(declare-fun b!1181944 () Bool)

(declare-fun e!671979 () Bool)

(declare-fun e!671981 () Bool)

(assert (=> b!1181944 (= e!671979 e!671981)))

(declare-fun res!785473 () Bool)

(assert (=> b!1181944 (=> res!785473 e!671981)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1181944 (= res!785473 (not (= (select (arr!36828 _keys!1208) from!1455) k!934)))))

(declare-fun b!1181945 () Bool)

(declare-datatypes ((Unit!39096 0))(
  ( (Unit!39097) )
))
(declare-fun e!671982 () Unit!39096)

(declare-fun Unit!39098 () Unit!39096)

(assert (=> b!1181945 (= e!671982 Unit!39098)))

(declare-fun lt!534804 () Unit!39096)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76357 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39096)

(assert (=> b!1181945 (= lt!534804 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181945 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534800 () Unit!39096)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76357 (_ BitVec 32) (_ BitVec 32)) Unit!39096)

(assert (=> b!1181945 (= lt!534800 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25890 0))(
  ( (Nil!25887) (Cons!25886 (h!27095 (_ BitVec 64)) (t!38129 List!25890)) )
))
(declare-fun arrayNoDuplicates!0 (array!76357 (_ BitVec 32) List!25890) Bool)

(assert (=> b!1181945 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25887)))

(declare-fun lt!534796 () Unit!39096)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76357 (_ BitVec 64) (_ BitVec 32) List!25890) Unit!39096)

(assert (=> b!1181945 (= lt!534796 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25887))))

(assert (=> b!1181945 false))

(declare-fun res!785464 () Bool)

(assert (=> start!99668 (=> (not res!785464) (not e!671977))))

(assert (=> start!99668 (= res!785464 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37364 _keys!1208))))))

(assert (=> start!99668 e!671977))

(declare-fun tp_is_empty!29777 () Bool)

(assert (=> start!99668 tp_is_empty!29777))

(declare-fun array_inv!28120 (array!76357) Bool)

(assert (=> start!99668 (array_inv!28120 _keys!1208)))

(assert (=> start!99668 true))

(assert (=> start!99668 tp!88454))

(declare-datatypes ((V!44829 0))(
  ( (V!44830 (val!14945 Int)) )
))
(declare-datatypes ((ValueCell!14179 0))(
  ( (ValueCellFull!14179 (v!17583 V!44829)) (EmptyCell!14179) )
))
(declare-datatypes ((array!76359 0))(
  ( (array!76360 (arr!36829 (Array (_ BitVec 32) ValueCell!14179)) (size!37365 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76359)

(declare-fun e!671984 () Bool)

(declare-fun array_inv!28121 (array!76359) Bool)

(assert (=> start!99668 (and (array_inv!28121 _values!996) e!671984)))

(declare-fun b!1181946 () Bool)

(declare-fun res!785461 () Bool)

(assert (=> b!1181946 (=> (not res!785461) (not e!671977))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1181946 (= res!785461 (and (= (size!37365 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37364 _keys!1208) (size!37365 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181947 () Bool)

(declare-fun e!671975 () Bool)

(assert (=> b!1181947 (= e!671975 tp_is_empty!29777)))

(declare-fun b!1181948 () Bool)

(declare-fun res!785462 () Bool)

(assert (=> b!1181948 (=> (not res!785462) (not e!671977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76357 (_ BitVec 32)) Bool)

(assert (=> b!1181948 (= res!785462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181949 () Bool)

(declare-fun res!785468 () Bool)

(declare-fun e!671978 () Bool)

(assert (=> b!1181949 (=> (not res!785468) (not e!671978))))

(declare-fun lt!534810 () array!76357)

(assert (=> b!1181949 (= res!785468 (arrayNoDuplicates!0 lt!534810 #b00000000000000000000000000000000 Nil!25887))))

(declare-fun b!1181950 () Bool)

(declare-fun res!785466 () Bool)

(assert (=> b!1181950 (=> (not res!785466) (not e!671977))))

(assert (=> b!1181950 (= res!785466 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25887))))

(declare-fun b!1181951 () Bool)

(declare-fun e!671976 () Bool)

(assert (=> b!1181951 (= e!671976 tp_is_empty!29777)))

(declare-fun b!1181952 () Bool)

(declare-fun e!671986 () Bool)

(declare-fun e!671983 () Bool)

(assert (=> b!1181952 (= e!671986 e!671983)))

(declare-fun res!785467 () Bool)

(assert (=> b!1181952 (=> res!785467 e!671983)))

(assert (=> b!1181952 (= res!785467 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19150 0))(
  ( (tuple2!19151 (_1!9586 (_ BitVec 64)) (_2!9586 V!44829)) )
))
(declare-datatypes ((List!25891 0))(
  ( (Nil!25888) (Cons!25887 (h!27096 tuple2!19150) (t!38130 List!25891)) )
))
(declare-datatypes ((ListLongMap!17119 0))(
  ( (ListLongMap!17120 (toList!8575 List!25891)) )
))
(declare-fun lt!534798 () ListLongMap!17119)

(declare-fun minValue!944 () V!44829)

(declare-fun zeroValue!944 () V!44829)

(declare-fun lt!534808 () array!76359)

(declare-fun getCurrentListMapNoExtraKeys!5028 (array!76357 array!76359 (_ BitVec 32) (_ BitVec 32) V!44829 V!44829 (_ BitVec 32) Int) ListLongMap!17119)

(assert (=> b!1181952 (= lt!534798 (getCurrentListMapNoExtraKeys!5028 lt!534810 lt!534808 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534805 () V!44829)

(assert (=> b!1181952 (= lt!534808 (array!76360 (store (arr!36829 _values!996) i!673 (ValueCellFull!14179 lt!534805)) (size!37365 _values!996)))))

(declare-fun dynLambda!2983 (Int (_ BitVec 64)) V!44829)

(assert (=> b!1181952 (= lt!534805 (dynLambda!2983 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534807 () ListLongMap!17119)

(assert (=> b!1181952 (= lt!534807 (getCurrentListMapNoExtraKeys!5028 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181953 () Bool)

(assert (=> b!1181953 (= e!671977 e!671978)))

(declare-fun res!785460 () Bool)

(assert (=> b!1181953 (=> (not res!785460) (not e!671978))))

(assert (=> b!1181953 (= res!785460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534810 mask!1564))))

(assert (=> b!1181953 (= lt!534810 (array!76358 (store (arr!36828 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37364 _keys!1208)))))

(declare-fun b!1181954 () Bool)

(declare-fun res!785471 () Bool)

(assert (=> b!1181954 (=> (not res!785471) (not e!671977))))

(assert (=> b!1181954 (= res!785471 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37364 _keys!1208))))))

(declare-fun mapNonEmpty!46493 () Bool)

(declare-fun mapRes!46493 () Bool)

(declare-fun tp!88455 () Bool)

(assert (=> mapNonEmpty!46493 (= mapRes!46493 (and tp!88455 e!671975))))

(declare-fun mapKey!46493 () (_ BitVec 32))

(declare-fun mapRest!46493 () (Array (_ BitVec 32) ValueCell!14179))

(declare-fun mapValue!46493 () ValueCell!14179)

(assert (=> mapNonEmpty!46493 (= (arr!36829 _values!996) (store mapRest!46493 mapKey!46493 mapValue!46493))))

(declare-fun b!1181955 () Bool)

(declare-fun res!785472 () Bool)

(assert (=> b!1181955 (=> (not res!785472) (not e!671977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181955 (= res!785472 (validKeyInArray!0 k!934))))

(declare-fun b!1181956 () Bool)

(assert (=> b!1181956 (= e!671984 (and e!671976 mapRes!46493))))

(declare-fun condMapEmpty!46493 () Bool)

(declare-fun mapDefault!46493 () ValueCell!14179)

