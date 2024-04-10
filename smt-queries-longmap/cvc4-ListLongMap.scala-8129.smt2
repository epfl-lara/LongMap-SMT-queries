; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99644 () Bool)

(assert start!99644)

(declare-fun b_free!25223 () Bool)

(declare-fun b_next!25223 () Bool)

(assert (=> start!99644 (= b_free!25223 (not b_next!25223))))

(declare-fun tp!88383 () Bool)

(declare-fun b_and!41313 () Bool)

(assert (=> start!99644 (= tp!88383 b_and!41313)))

(declare-fun b!1181161 () Bool)

(declare-fun res!784895 () Bool)

(declare-fun e!671524 () Bool)

(assert (=> b!1181161 (=> (not res!784895) (not e!671524))))

(declare-datatypes ((array!76309 0))(
  ( (array!76310 (arr!36804 (Array (_ BitVec 32) (_ BitVec 64))) (size!37340 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76309)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44797 0))(
  ( (V!44798 (val!14933 Int)) )
))
(declare-datatypes ((ValueCell!14167 0))(
  ( (ValueCellFull!14167 (v!17571 V!44797)) (EmptyCell!14167) )
))
(declare-datatypes ((array!76311 0))(
  ( (array!76312 (arr!36805 (Array (_ BitVec 32) ValueCell!14167)) (size!37341 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76311)

(assert (=> b!1181161 (= res!784895 (and (= (size!37341 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37340 _keys!1208) (size!37341 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181162 () Bool)

(declare-fun res!784886 () Bool)

(assert (=> b!1181162 (=> (not res!784886) (not e!671524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76309 (_ BitVec 32)) Bool)

(assert (=> b!1181162 (= res!784886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181163 () Bool)

(declare-datatypes ((Unit!39055 0))(
  ( (Unit!39056) )
))
(declare-fun e!671535 () Unit!39055)

(declare-fun Unit!39057 () Unit!39055)

(assert (=> b!1181163 (= e!671535 Unit!39057)))

(declare-fun lt!534198 () Unit!39055)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76309 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39055)

(assert (=> b!1181163 (= lt!534198 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181163 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534189 () Unit!39055)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76309 (_ BitVec 32) (_ BitVec 32)) Unit!39055)

(assert (=> b!1181163 (= lt!534189 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25867 0))(
  ( (Nil!25864) (Cons!25863 (h!27072 (_ BitVec 64)) (t!38082 List!25867)) )
))
(declare-fun arrayNoDuplicates!0 (array!76309 (_ BitVec 32) List!25867) Bool)

(assert (=> b!1181163 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25864)))

(declare-fun lt!534191 () Unit!39055)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76309 (_ BitVec 64) (_ BitVec 32) List!25867) Unit!39055)

(assert (=> b!1181163 (= lt!534191 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25864))))

(assert (=> b!1181163 false))

(declare-fun e!671531 () Bool)

(declare-fun b!1181164 () Bool)

(assert (=> b!1181164 (= e!671531 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1181165 () Bool)

(declare-fun e!671534 () Bool)

(declare-fun e!671530 () Bool)

(assert (=> b!1181165 (= e!671534 (not e!671530))))

(declare-fun res!784885 () Bool)

(assert (=> b!1181165 (=> res!784885 e!671530)))

(assert (=> b!1181165 (= res!784885 (bvsgt from!1455 i!673))))

(assert (=> b!1181165 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!534187 () Unit!39055)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76309 (_ BitVec 64) (_ BitVec 32)) Unit!39055)

(assert (=> b!1181165 (= lt!534187 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1181166 () Bool)

(declare-fun Unit!39058 () Unit!39055)

(assert (=> b!1181166 (= e!671535 Unit!39058)))

(declare-fun mapIsEmpty!46457 () Bool)

(declare-fun mapRes!46457 () Bool)

(assert (=> mapIsEmpty!46457 mapRes!46457))

(declare-fun res!784888 () Bool)

(assert (=> start!99644 (=> (not res!784888) (not e!671524))))

(assert (=> start!99644 (= res!784888 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37340 _keys!1208))))))

(assert (=> start!99644 e!671524))

(declare-fun tp_is_empty!29753 () Bool)

(assert (=> start!99644 tp_is_empty!29753))

(declare-fun array_inv!28102 (array!76309) Bool)

(assert (=> start!99644 (array_inv!28102 _keys!1208)))

(assert (=> start!99644 true))

(assert (=> start!99644 tp!88383))

(declare-fun e!671536 () Bool)

(declare-fun array_inv!28103 (array!76311) Bool)

(assert (=> start!99644 (and (array_inv!28103 _values!996) e!671536)))

(declare-fun mapNonEmpty!46457 () Bool)

(declare-fun tp!88382 () Bool)

(declare-fun e!671532 () Bool)

(assert (=> mapNonEmpty!46457 (= mapRes!46457 (and tp!88382 e!671532))))

(declare-fun mapValue!46457 () ValueCell!14167)

(declare-fun mapRest!46457 () (Array (_ BitVec 32) ValueCell!14167))

(declare-fun mapKey!46457 () (_ BitVec 32))

(assert (=> mapNonEmpty!46457 (= (arr!36805 _values!996) (store mapRest!46457 mapKey!46457 mapValue!46457))))

(declare-fun b!1181167 () Bool)

(declare-fun res!784884 () Bool)

(assert (=> b!1181167 (=> (not res!784884) (not e!671524))))

(assert (=> b!1181167 (= res!784884 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25864))))

(declare-fun b!1181168 () Bool)

(declare-fun e!671526 () Bool)

(declare-fun e!671529 () Bool)

(assert (=> b!1181168 (= e!671526 e!671529)))

(declare-fun res!784887 () Bool)

(assert (=> b!1181168 (=> res!784887 e!671529)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181168 (= res!784887 (not (validKeyInArray!0 (select (arr!36804 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19126 0))(
  ( (tuple2!19127 (_1!9574 (_ BitVec 64)) (_2!9574 V!44797)) )
))
(declare-datatypes ((List!25868 0))(
  ( (Nil!25865) (Cons!25864 (h!27073 tuple2!19126) (t!38083 List!25868)) )
))
(declare-datatypes ((ListLongMap!17095 0))(
  ( (ListLongMap!17096 (toList!8563 List!25868)) )
))
(declare-fun lt!534197 () ListLongMap!17095)

(declare-fun lt!534195 () ListLongMap!17095)

(assert (=> b!1181168 (= lt!534197 lt!534195)))

(declare-fun lt!534188 () ListLongMap!17095)

(declare-fun -!1604 (ListLongMap!17095 (_ BitVec 64)) ListLongMap!17095)

(assert (=> b!1181168 (= lt!534195 (-!1604 lt!534188 k!934))))

(declare-fun zeroValue!944 () V!44797)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44797)

(declare-fun lt!534185 () array!76311)

(declare-fun lt!534193 () array!76309)

(declare-fun getCurrentListMapNoExtraKeys!5017 (array!76309 array!76311 (_ BitVec 32) (_ BitVec 32) V!44797 V!44797 (_ BitVec 32) Int) ListLongMap!17095)

(assert (=> b!1181168 (= lt!534197 (getCurrentListMapNoExtraKeys!5017 lt!534193 lt!534185 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181168 (= lt!534188 (getCurrentListMapNoExtraKeys!5017 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534194 () Unit!39055)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!831 (array!76309 array!76311 (_ BitVec 32) (_ BitVec 32) V!44797 V!44797 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39055)

(assert (=> b!1181168 (= lt!534194 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!831 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1181169 () Bool)

(assert (=> b!1181169 (= e!671532 tp_is_empty!29753)))

(declare-fun b!1181170 () Bool)

(declare-fun e!671533 () Bool)

(assert (=> b!1181170 (= e!671533 e!671531)))

(declare-fun res!784882 () Bool)

(assert (=> b!1181170 (=> res!784882 e!671531)))

(assert (=> b!1181170 (= res!784882 (not (= (select (arr!36804 _keys!1208) from!1455) k!934)))))

(declare-fun b!1181171 () Bool)

(declare-fun res!784892 () Bool)

(assert (=> b!1181171 (=> (not res!784892) (not e!671524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181171 (= res!784892 (validMask!0 mask!1564))))

(declare-fun b!1181172 () Bool)

(declare-fun res!784897 () Bool)

(assert (=> b!1181172 (=> (not res!784897) (not e!671524))))

(assert (=> b!1181172 (= res!784897 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37340 _keys!1208))))))

(declare-fun b!1181173 () Bool)

(declare-fun res!784890 () Bool)

(declare-fun e!671525 () Bool)

(assert (=> b!1181173 (=> (not res!784890) (not e!671525))))

(declare-fun lt!534184 () tuple2!19126)

(declare-fun lt!534186 () ListLongMap!17095)

(declare-fun +!3871 (ListLongMap!17095 tuple2!19126) ListLongMap!17095)

(assert (=> b!1181173 (= res!784890 (= lt!534186 (+!3871 lt!534188 lt!534184)))))

(declare-fun b!1181174 () Bool)

(declare-fun e!671528 () Bool)

(assert (=> b!1181174 (= e!671528 tp_is_empty!29753)))

(declare-fun b!1181175 () Bool)

(assert (=> b!1181175 (= e!671536 (and e!671528 mapRes!46457))))

(declare-fun condMapEmpty!46457 () Bool)

(declare-fun mapDefault!46457 () ValueCell!14167)

