; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99078 () Bool)

(assert start!99078)

(declare-fun b_free!24683 () Bool)

(declare-fun b_next!24683 () Bool)

(assert (=> start!99078 (= b_free!24683 (not b_next!24683))))

(declare-fun tp!86759 () Bool)

(declare-fun b_and!40215 () Bool)

(assert (=> start!99078 (= tp!86759 b_and!40215)))

(declare-fun b!1165150 () Bool)

(declare-fun res!772720 () Bool)

(declare-fun e!662403 () Bool)

(assert (=> b!1165150 (=> (not res!772720) (not e!662403))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165150 (= res!772720 (validKeyInArray!0 k!934))))

(declare-fun b!1165151 () Bool)

(declare-fun res!772715 () Bool)

(assert (=> b!1165151 (=> (not res!772715) (not e!662403))))

(declare-datatypes ((array!75257 0))(
  ( (array!75258 (arr!36279 (Array (_ BitVec 32) (_ BitVec 64))) (size!36815 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75257)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44077 0))(
  ( (V!44078 (val!14663 Int)) )
))
(declare-datatypes ((ValueCell!13897 0))(
  ( (ValueCellFull!13897 (v!17300 V!44077)) (EmptyCell!13897) )
))
(declare-datatypes ((array!75259 0))(
  ( (array!75260 (arr!36280 (Array (_ BitVec 32) ValueCell!13897)) (size!36816 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75259)

(assert (=> b!1165151 (= res!772715 (and (= (size!36816 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36815 _keys!1208) (size!36816 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165152 () Bool)

(declare-fun res!772722 () Bool)

(assert (=> b!1165152 (=> (not res!772722) (not e!662403))))

(declare-datatypes ((List!25434 0))(
  ( (Nil!25431) (Cons!25430 (h!26639 (_ BitVec 64)) (t!37109 List!25434)) )
))
(declare-fun arrayNoDuplicates!0 (array!75257 (_ BitVec 32) List!25434) Bool)

(assert (=> b!1165152 (= res!772722 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25431))))

(declare-fun b!1165153 () Bool)

(declare-fun res!772718 () Bool)

(declare-fun e!662406 () Bool)

(assert (=> b!1165153 (=> (not res!772718) (not e!662406))))

(declare-fun lt!524834 () array!75257)

(assert (=> b!1165153 (= res!772718 (arrayNoDuplicates!0 lt!524834 #b00000000000000000000000000000000 Nil!25431))))

(declare-fun b!1165154 () Bool)

(declare-fun res!772723 () Bool)

(assert (=> b!1165154 (=> (not res!772723) (not e!662403))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165154 (= res!772723 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36815 _keys!1208))))))

(declare-fun b!1165155 () Bool)

(declare-fun e!662401 () Bool)

(declare-fun tp_is_empty!29213 () Bool)

(assert (=> b!1165155 (= e!662401 tp_is_empty!29213)))

(declare-fun res!772721 () Bool)

(assert (=> start!99078 (=> (not res!772721) (not e!662403))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99078 (= res!772721 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36815 _keys!1208))))))

(assert (=> start!99078 e!662403))

(assert (=> start!99078 tp_is_empty!29213))

(declare-fun array_inv!27752 (array!75257) Bool)

(assert (=> start!99078 (array_inv!27752 _keys!1208)))

(assert (=> start!99078 true))

(assert (=> start!99078 tp!86759))

(declare-fun e!662404 () Bool)

(declare-fun array_inv!27753 (array!75259) Bool)

(assert (=> start!99078 (and (array_inv!27753 _values!996) e!662404)))

(declare-fun b!1165156 () Bool)

(declare-fun e!662400 () Bool)

(assert (=> b!1165156 (= e!662400 true)))

(declare-fun zeroValue!944 () V!44077)

(declare-datatypes ((tuple2!18700 0))(
  ( (tuple2!18701 (_1!9361 (_ BitVec 64)) (_2!9361 V!44077)) )
))
(declare-datatypes ((List!25435 0))(
  ( (Nil!25432) (Cons!25431 (h!26640 tuple2!18700) (t!37110 List!25435)) )
))
(declare-datatypes ((ListLongMap!16669 0))(
  ( (ListLongMap!16670 (toList!8350 List!25435)) )
))
(declare-fun lt!524835 () ListLongMap!16669)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44077)

(declare-fun getCurrentListMapNoExtraKeys!4814 (array!75257 array!75259 (_ BitVec 32) (_ BitVec 32) V!44077 V!44077 (_ BitVec 32) Int) ListLongMap!16669)

(declare-fun dynLambda!2804 (Int (_ BitVec 64)) V!44077)

(assert (=> b!1165156 (= lt!524835 (getCurrentListMapNoExtraKeys!4814 lt!524834 (array!75260 (store (arr!36280 _values!996) i!673 (ValueCellFull!13897 (dynLambda!2804 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36816 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524832 () ListLongMap!16669)

(assert (=> b!1165156 (= lt!524832 (getCurrentListMapNoExtraKeys!4814 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165157 () Bool)

(declare-fun e!662402 () Bool)

(assert (=> b!1165157 (= e!662402 tp_is_empty!29213)))

(declare-fun b!1165158 () Bool)

(assert (=> b!1165158 (= e!662403 e!662406)))

(declare-fun res!772719 () Bool)

(assert (=> b!1165158 (=> (not res!772719) (not e!662406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75257 (_ BitVec 32)) Bool)

(assert (=> b!1165158 (= res!772719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524834 mask!1564))))

(assert (=> b!1165158 (= lt!524834 (array!75258 (store (arr!36279 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36815 _keys!1208)))))

(declare-fun b!1165159 () Bool)

(declare-fun res!772724 () Bool)

(assert (=> b!1165159 (=> (not res!772724) (not e!662403))))

(assert (=> b!1165159 (= res!772724 (= (select (arr!36279 _keys!1208) i!673) k!934))))

(declare-fun b!1165160 () Bool)

(assert (=> b!1165160 (= e!662406 (not e!662400))))

(declare-fun res!772714 () Bool)

(assert (=> b!1165160 (=> res!772714 e!662400)))

(assert (=> b!1165160 (= res!772714 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165160 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38450 0))(
  ( (Unit!38451) )
))
(declare-fun lt!524833 () Unit!38450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75257 (_ BitVec 64) (_ BitVec 32)) Unit!38450)

(assert (=> b!1165160 (= lt!524833 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1165161 () Bool)

(declare-fun mapRes!45644 () Bool)

(assert (=> b!1165161 (= e!662404 (and e!662402 mapRes!45644))))

(declare-fun condMapEmpty!45644 () Bool)

(declare-fun mapDefault!45644 () ValueCell!13897)

