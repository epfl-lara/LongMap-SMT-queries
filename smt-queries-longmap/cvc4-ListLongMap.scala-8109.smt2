; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99524 () Bool)

(assert start!99524)

(declare-fun b_free!25103 () Bool)

(declare-fun b_next!25103 () Bool)

(assert (=> start!99524 (= b_free!25103 (not b_next!25103))))

(declare-fun tp!88022 () Bool)

(declare-fun b_and!41073 () Bool)

(assert (=> start!99524 (= tp!88022 b_and!41073)))

(declare-fun b!1177190 () Bool)

(declare-fun e!669187 () Bool)

(declare-fun e!669190 () Bool)

(assert (=> b!1177190 (= e!669187 e!669190)))

(declare-fun res!781938 () Bool)

(assert (=> b!1177190 (=> res!781938 e!669190)))

(declare-datatypes ((array!76073 0))(
  ( (array!76074 (arr!36686 (Array (_ BitVec 32) (_ BitVec 64))) (size!37222 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76073)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177190 (= res!781938 (not (validKeyInArray!0 (select (arr!36686 _keys!1208) from!1455))))))

(declare-datatypes ((V!44637 0))(
  ( (V!44638 (val!14873 Int)) )
))
(declare-datatypes ((tuple2!19026 0))(
  ( (tuple2!19027 (_1!9524 (_ BitVec 64)) (_2!9524 V!44637)) )
))
(declare-datatypes ((List!25764 0))(
  ( (Nil!25761) (Cons!25760 (h!26969 tuple2!19026) (t!37859 List!25764)) )
))
(declare-datatypes ((ListLongMap!16995 0))(
  ( (ListLongMap!16996 (toList!8513 List!25764)) )
))
(declare-fun lt!531492 () ListLongMap!16995)

(declare-fun lt!531493 () ListLongMap!16995)

(assert (=> b!1177190 (= lt!531492 lt!531493)))

(declare-fun lt!531498 () ListLongMap!16995)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1562 (ListLongMap!16995 (_ BitVec 64)) ListLongMap!16995)

(assert (=> b!1177190 (= lt!531493 (-!1562 lt!531498 k!934))))

(declare-fun zeroValue!944 () V!44637)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44637)

(declare-datatypes ((ValueCell!14107 0))(
  ( (ValueCellFull!14107 (v!17511 V!44637)) (EmptyCell!14107) )
))
(declare-datatypes ((array!76075 0))(
  ( (array!76076 (arr!36687 (Array (_ BitVec 32) ValueCell!14107)) (size!37223 (_ BitVec 32))) )
))
(declare-fun lt!531496 () array!76075)

(declare-fun lt!531491 () array!76073)

(declare-fun getCurrentListMapNoExtraKeys!4970 (array!76073 array!76075 (_ BitVec 32) (_ BitVec 32) V!44637 V!44637 (_ BitVec 32) Int) ListLongMap!16995)

(assert (=> b!1177190 (= lt!531492 (getCurrentListMapNoExtraKeys!4970 lt!531491 lt!531496 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76075)

(assert (=> b!1177190 (= lt!531498 (getCurrentListMapNoExtraKeys!4970 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38872 0))(
  ( (Unit!38873) )
))
(declare-fun lt!531487 () Unit!38872)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!789 (array!76073 array!76075 (_ BitVec 32) (_ BitVec 32) V!44637 V!44637 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38872)

(assert (=> b!1177190 (= lt!531487 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!789 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177191 () Bool)

(declare-fun res!781941 () Bool)

(declare-fun e!669196 () Bool)

(assert (=> b!1177191 (=> (not res!781941) (not e!669196))))

(assert (=> b!1177191 (= res!781941 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37222 _keys!1208))))))

(declare-fun b!1177192 () Bool)

(declare-fun res!781945 () Bool)

(assert (=> b!1177192 (=> (not res!781945) (not e!669196))))

(assert (=> b!1177192 (= res!781945 (= (select (arr!36686 _keys!1208) i!673) k!934))))

(declare-fun b!1177193 () Bool)

(declare-fun e!669195 () Bool)

(declare-fun tp_is_empty!29633 () Bool)

(assert (=> b!1177193 (= e!669195 tp_is_empty!29633)))

(declare-fun b!1177194 () Bool)

(assert (=> b!1177194 (= e!669190 true)))

(declare-fun e!669192 () Bool)

(assert (=> b!1177194 e!669192))

(declare-fun res!781931 () Bool)

(assert (=> b!1177194 (=> (not res!781931) (not e!669192))))

(assert (=> b!1177194 (= res!781931 (not (= (select (arr!36686 _keys!1208) from!1455) k!934)))))

(declare-fun lt!531497 () Unit!38872)

(declare-fun e!669185 () Unit!38872)

(assert (=> b!1177194 (= lt!531497 e!669185)))

(declare-fun c!116778 () Bool)

(assert (=> b!1177194 (= c!116778 (= (select (arr!36686 _keys!1208) from!1455) k!934))))

(declare-fun e!669191 () Bool)

(assert (=> b!1177194 e!669191))

(declare-fun res!781930 () Bool)

(assert (=> b!1177194 (=> (not res!781930) (not e!669191))))

(declare-fun lt!531489 () ListLongMap!16995)

(declare-fun lt!531495 () tuple2!19026)

(declare-fun +!3828 (ListLongMap!16995 tuple2!19026) ListLongMap!16995)

(assert (=> b!1177194 (= res!781930 (= lt!531489 (+!3828 lt!531493 lt!531495)))))

(declare-fun lt!531490 () V!44637)

(declare-fun get!18742 (ValueCell!14107 V!44637) V!44637)

(assert (=> b!1177194 (= lt!531495 (tuple2!19027 (select (arr!36686 _keys!1208) from!1455) (get!18742 (select (arr!36687 _values!996) from!1455) lt!531490)))))

(declare-fun b!1177196 () Bool)

(declare-fun lt!531488 () ListLongMap!16995)

(assert (=> b!1177196 (= e!669192 (= lt!531488 (+!3828 lt!531498 lt!531495)))))

(declare-fun b!1177197 () Bool)

(declare-fun e!669184 () Bool)

(assert (=> b!1177197 (= e!669196 e!669184)))

(declare-fun res!781943 () Bool)

(assert (=> b!1177197 (=> (not res!781943) (not e!669184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76073 (_ BitVec 32)) Bool)

(assert (=> b!1177197 (= res!781943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531491 mask!1564))))

(assert (=> b!1177197 (= lt!531491 (array!76074 (store (arr!36686 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37222 _keys!1208)))))

(declare-fun b!1177198 () Bool)

(declare-fun e!669193 () Bool)

(assert (=> b!1177198 (= e!669193 tp_is_empty!29633)))

(declare-fun b!1177199 () Bool)

(declare-fun res!781935 () Bool)

(assert (=> b!1177199 (=> (not res!781935) (not e!669196))))

(assert (=> b!1177199 (= res!781935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177200 () Bool)

(declare-fun res!781933 () Bool)

(assert (=> b!1177200 (=> (not res!781933) (not e!669196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177200 (= res!781933 (validMask!0 mask!1564))))

(declare-fun b!1177201 () Bool)

(declare-fun res!781932 () Bool)

(assert (=> b!1177201 (=> (not res!781932) (not e!669196))))

(assert (=> b!1177201 (= res!781932 (validKeyInArray!0 k!934))))

(declare-fun b!1177202 () Bool)

(declare-fun e!669186 () Bool)

(assert (=> b!1177202 (= e!669184 (not e!669186))))

(declare-fun res!781934 () Bool)

(assert (=> b!1177202 (=> res!781934 e!669186)))

(assert (=> b!1177202 (= res!781934 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177202 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!531486 () Unit!38872)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76073 (_ BitVec 64) (_ BitVec 32)) Unit!38872)

(assert (=> b!1177202 (= lt!531486 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1177203 () Bool)

(declare-fun res!781939 () Bool)

(assert (=> b!1177203 (=> (not res!781939) (not e!669184))))

(declare-datatypes ((List!25765 0))(
  ( (Nil!25762) (Cons!25761 (h!26970 (_ BitVec 64)) (t!37860 List!25765)) )
))
(declare-fun arrayNoDuplicates!0 (array!76073 (_ BitVec 32) List!25765) Bool)

(assert (=> b!1177203 (= res!781939 (arrayNoDuplicates!0 lt!531491 #b00000000000000000000000000000000 Nil!25762))))

(declare-fun b!1177204 () Bool)

(assert (=> b!1177204 (= e!669186 e!669187)))

(declare-fun res!781937 () Bool)

(assert (=> b!1177204 (=> res!781937 e!669187)))

(assert (=> b!1177204 (= res!781937 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1177204 (= lt!531489 (getCurrentListMapNoExtraKeys!4970 lt!531491 lt!531496 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1177204 (= lt!531496 (array!76076 (store (arr!36687 _values!996) i!673 (ValueCellFull!14107 lt!531490)) (size!37223 _values!996)))))

(declare-fun dynLambda!2934 (Int (_ BitVec 64)) V!44637)

(assert (=> b!1177204 (= lt!531490 (dynLambda!2934 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1177204 (= lt!531488 (getCurrentListMapNoExtraKeys!4970 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177205 () Bool)

(declare-fun e!669194 () Bool)

(declare-fun mapRes!46277 () Bool)

(assert (=> b!1177205 (= e!669194 (and e!669195 mapRes!46277))))

(declare-fun condMapEmpty!46277 () Bool)

(declare-fun mapDefault!46277 () ValueCell!14107)

