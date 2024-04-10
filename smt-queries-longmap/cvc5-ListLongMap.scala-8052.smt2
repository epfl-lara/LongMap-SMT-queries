; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99152 () Bool)

(assert start!99152)

(declare-fun b_free!24757 () Bool)

(declare-fun b_next!24757 () Bool)

(assert (=> start!99152 (= b_free!24757 (not b_next!24757))))

(declare-fun tp!86982 () Bool)

(declare-fun b_and!40363 () Bool)

(assert (=> start!99152 (= tp!86982 b_and!40363)))

(declare-fun b!1166843 () Bool)

(declare-fun e!663245 () Bool)

(declare-fun tp_is_empty!29287 () Bool)

(assert (=> b!1166843 (= e!663245 tp_is_empty!29287)))

(declare-fun b!1166844 () Bool)

(declare-fun res!774009 () Bool)

(declare-fun e!663242 () Bool)

(assert (=> b!1166844 (=> (not res!774009) (not e!663242))))

(declare-datatypes ((array!75405 0))(
  ( (array!75406 (arr!36353 (Array (_ BitVec 32) (_ BitVec 64))) (size!36889 (_ BitVec 32))) )
))
(declare-fun lt!525411 () array!75405)

(declare-datatypes ((List!25491 0))(
  ( (Nil!25488) (Cons!25487 (h!26696 (_ BitVec 64)) (t!37240 List!25491)) )
))
(declare-fun arrayNoDuplicates!0 (array!75405 (_ BitVec 32) List!25491) Bool)

(assert (=> b!1166844 (= res!774009 (arrayNoDuplicates!0 lt!525411 #b00000000000000000000000000000000 Nil!25488))))

(declare-fun b!1166845 () Bool)

(declare-fun e!663249 () Bool)

(assert (=> b!1166845 (= e!663249 true)))

(declare-datatypes ((V!44177 0))(
  ( (V!44178 (val!14700 Int)) )
))
(declare-fun zeroValue!944 () V!44177)

(declare-fun _keys!1208 () array!75405)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13934 0))(
  ( (ValueCellFull!13934 (v!17337 V!44177)) (EmptyCell!13934) )
))
(declare-datatypes ((array!75407 0))(
  ( (array!75408 (arr!36354 (Array (_ BitVec 32) ValueCell!13934)) (size!36890 (_ BitVec 32))) )
))
(declare-fun lt!525406 () array!75407)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _values!996 () array!75407)

(declare-fun minValue!944 () V!44177)

(declare-datatypes ((tuple2!18750 0))(
  ( (tuple2!18751 (_1!9386 (_ BitVec 64)) (_2!9386 V!44177)) )
))
(declare-datatypes ((List!25492 0))(
  ( (Nil!25489) (Cons!25488 (h!26697 tuple2!18750) (t!37241 List!25492)) )
))
(declare-datatypes ((ListLongMap!16719 0))(
  ( (ListLongMap!16720 (toList!8375 List!25492)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4839 (array!75405 array!75407 (_ BitVec 32) (_ BitVec 32) V!44177 V!44177 (_ BitVec 32) Int) ListLongMap!16719)

(declare-fun -!1451 (ListLongMap!16719 (_ BitVec 64)) ListLongMap!16719)

(assert (=> b!1166845 (= (getCurrentListMapNoExtraKeys!4839 lt!525411 lt!525406 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1451 (getCurrentListMapNoExtraKeys!4839 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38504 0))(
  ( (Unit!38505) )
))
(declare-fun lt!525409 () Unit!38504)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!678 (array!75405 array!75407 (_ BitVec 32) (_ BitVec 32) V!44177 V!44177 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38504)

(assert (=> b!1166845 (= lt!525409 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!678 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166847 () Bool)

(declare-fun res!774011 () Bool)

(declare-fun e!663247 () Bool)

(assert (=> b!1166847 (=> (not res!774011) (not e!663247))))

(assert (=> b!1166847 (= res!774011 (and (= (size!36890 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36889 _keys!1208) (size!36890 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166848 () Bool)

(declare-fun e!663243 () Bool)

(assert (=> b!1166848 (= e!663243 tp_is_empty!29287)))

(declare-fun b!1166849 () Bool)

(assert (=> b!1166849 (= e!663247 e!663242)))

(declare-fun res!774002 () Bool)

(assert (=> b!1166849 (=> (not res!774002) (not e!663242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75405 (_ BitVec 32)) Bool)

(assert (=> b!1166849 (= res!774002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525411 mask!1564))))

(assert (=> b!1166849 (= lt!525411 (array!75406 (store (arr!36353 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36889 _keys!1208)))))

(declare-fun b!1166850 () Bool)

(declare-fun e!663244 () Bool)

(declare-fun mapRes!45755 () Bool)

(assert (=> b!1166850 (= e!663244 (and e!663245 mapRes!45755))))

(declare-fun condMapEmpty!45755 () Bool)

(declare-fun mapDefault!45755 () ValueCell!13934)

