; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99122 () Bool)

(assert start!99122)

(declare-fun b_free!24727 () Bool)

(declare-fun b_next!24727 () Bool)

(assert (=> start!99122 (= b_free!24727 (not b_next!24727))))

(declare-fun tp!86892 () Bool)

(declare-fun b_and!40303 () Bool)

(assert (=> start!99122 (= tp!86892 b_and!40303)))

(declare-fun b!1166138 () Bool)

(declare-fun res!773463 () Bool)

(declare-fun e!662882 () Bool)

(assert (=> b!1166138 (=> (not res!773463) (not e!662882))))

(declare-datatypes ((array!75345 0))(
  ( (array!75346 (arr!36323 (Array (_ BitVec 32) (_ BitVec 64))) (size!36859 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75345)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44137 0))(
  ( (V!44138 (val!14685 Int)) )
))
(declare-datatypes ((ValueCell!13919 0))(
  ( (ValueCellFull!13919 (v!17322 V!44137)) (EmptyCell!13919) )
))
(declare-datatypes ((array!75347 0))(
  ( (array!75348 (arr!36324 (Array (_ BitVec 32) ValueCell!13919)) (size!36860 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75347)

(assert (=> b!1166138 (= res!773463 (and (= (size!36860 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36859 _keys!1208) (size!36860 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166139 () Bool)

(declare-fun res!773470 () Bool)

(declare-fun e!662888 () Bool)

(assert (=> b!1166139 (=> (not res!773470) (not e!662888))))

(declare-fun lt!525136 () array!75345)

(declare-datatypes ((List!25467 0))(
  ( (Nil!25464) (Cons!25463 (h!26672 (_ BitVec 64)) (t!37186 List!25467)) )
))
(declare-fun arrayNoDuplicates!0 (array!75345 (_ BitVec 32) List!25467) Bool)

(assert (=> b!1166139 (= res!773470 (arrayNoDuplicates!0 lt!525136 #b00000000000000000000000000000000 Nil!25464))))

(declare-fun b!1166140 () Bool)

(assert (=> b!1166140 (= e!662882 e!662888)))

(declare-fun res!773462 () Bool)

(assert (=> b!1166140 (=> (not res!773462) (not e!662888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75345 (_ BitVec 32)) Bool)

(assert (=> b!1166140 (= res!773462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525136 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166140 (= lt!525136 (array!75346 (store (arr!36323 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36859 _keys!1208)))))

(declare-fun res!773471 () Bool)

(assert (=> start!99122 (=> (not res!773471) (not e!662882))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99122 (= res!773471 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36859 _keys!1208))))))

(assert (=> start!99122 e!662882))

(declare-fun tp_is_empty!29257 () Bool)

(assert (=> start!99122 tp_is_empty!29257))

(declare-fun array_inv!27780 (array!75345) Bool)

(assert (=> start!99122 (array_inv!27780 _keys!1208)))

(assert (=> start!99122 true))

(assert (=> start!99122 tp!86892))

(declare-fun e!662885 () Bool)

(declare-fun array_inv!27781 (array!75347) Bool)

(assert (=> start!99122 (and (array_inv!27781 _values!996) e!662885)))

(declare-fun b!1166141 () Bool)

(declare-fun e!662887 () Bool)

(assert (=> b!1166141 (= e!662887 true)))

(declare-fun zeroValue!944 () V!44137)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!525140 () array!75347)

(declare-fun minValue!944 () V!44137)

(declare-datatypes ((tuple2!18728 0))(
  ( (tuple2!18729 (_1!9375 (_ BitVec 64)) (_2!9375 V!44137)) )
))
(declare-datatypes ((List!25468 0))(
  ( (Nil!25465) (Cons!25464 (h!26673 tuple2!18728) (t!37187 List!25468)) )
))
(declare-datatypes ((ListLongMap!16697 0))(
  ( (ListLongMap!16698 (toList!8364 List!25468)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4828 (array!75345 array!75347 (_ BitVec 32) (_ BitVec 32) V!44137 V!44137 (_ BitVec 32) Int) ListLongMap!16697)

(declare-fun -!1441 (ListLongMap!16697 (_ BitVec 64)) ListLongMap!16697)

(assert (=> b!1166141 (= (getCurrentListMapNoExtraKeys!4828 lt!525136 lt!525140 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1441 (getCurrentListMapNoExtraKeys!4828 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!38480 0))(
  ( (Unit!38481) )
))
(declare-fun lt!525139 () Unit!38480)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!668 (array!75345 array!75347 (_ BitVec 32) (_ BitVec 32) V!44137 V!44137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38480)

(assert (=> b!1166141 (= lt!525139 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!668 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166142 () Bool)

(declare-fun e!662884 () Bool)

(assert (=> b!1166142 (= e!662888 (not e!662884))))

(declare-fun res!773468 () Bool)

(assert (=> b!1166142 (=> res!773468 e!662884)))

(assert (=> b!1166142 (= res!773468 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166142 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!525141 () Unit!38480)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75345 (_ BitVec 64) (_ BitVec 32)) Unit!38480)

(assert (=> b!1166142 (= lt!525141 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1166143 () Bool)

(declare-fun res!773464 () Bool)

(assert (=> b!1166143 (=> (not res!773464) (not e!662882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166143 (= res!773464 (validMask!0 mask!1564))))

(declare-fun b!1166144 () Bool)

(declare-fun res!773466 () Bool)

(assert (=> b!1166144 (=> (not res!773466) (not e!662882))))

(assert (=> b!1166144 (= res!773466 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25464))))

(declare-fun b!1166145 () Bool)

(declare-fun res!773469 () Bool)

(assert (=> b!1166145 (=> (not res!773469) (not e!662882))))

(assert (=> b!1166145 (= res!773469 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36859 _keys!1208))))))

(declare-fun b!1166146 () Bool)

(declare-fun res!773461 () Bool)

(assert (=> b!1166146 (=> (not res!773461) (not e!662882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166146 (= res!773461 (validKeyInArray!0 k!934))))

(declare-fun b!1166147 () Bool)

(declare-fun res!773465 () Bool)

(assert (=> b!1166147 (=> (not res!773465) (not e!662882))))

(assert (=> b!1166147 (= res!773465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45710 () Bool)

(declare-fun mapRes!45710 () Bool)

(assert (=> mapIsEmpty!45710 mapRes!45710))

(declare-fun mapNonEmpty!45710 () Bool)

(declare-fun tp!86891 () Bool)

(declare-fun e!662889 () Bool)

(assert (=> mapNonEmpty!45710 (= mapRes!45710 (and tp!86891 e!662889))))

(declare-fun mapRest!45710 () (Array (_ BitVec 32) ValueCell!13919))

(declare-fun mapValue!45710 () ValueCell!13919)

(declare-fun mapKey!45710 () (_ BitVec 32))

(assert (=> mapNonEmpty!45710 (= (arr!36324 _values!996) (store mapRest!45710 mapKey!45710 mapValue!45710))))

(declare-fun b!1166148 () Bool)

(declare-fun e!662883 () Bool)

(assert (=> b!1166148 (= e!662885 (and e!662883 mapRes!45710))))

(declare-fun condMapEmpty!45710 () Bool)

(declare-fun mapDefault!45710 () ValueCell!13919)

