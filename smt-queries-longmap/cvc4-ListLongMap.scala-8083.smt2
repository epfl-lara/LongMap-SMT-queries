; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99368 () Bool)

(assert start!99368)

(declare-fun b_free!24947 () Bool)

(declare-fun b_next!24947 () Bool)

(assert (=> start!99368 (= b_free!24947 (not b_next!24947))))

(declare-fun tp!87554 () Bool)

(declare-fun b_and!40761 () Bool)

(assert (=> start!99368 (= tp!87554 b_and!40761)))

(declare-fun mapNonEmpty!46043 () Bool)

(declare-fun mapRes!46043 () Bool)

(declare-fun tp!87555 () Bool)

(declare-fun e!666309 () Bool)

(assert (=> mapNonEmpty!46043 (= mapRes!46043 (and tp!87555 e!666309))))

(declare-fun mapKey!46043 () (_ BitVec 32))

(declare-datatypes ((V!44429 0))(
  ( (V!44430 (val!14795 Int)) )
))
(declare-datatypes ((ValueCell!14029 0))(
  ( (ValueCellFull!14029 (v!17433 V!44429)) (EmptyCell!14029) )
))
(declare-fun mapRest!46043 () (Array (_ BitVec 32) ValueCell!14029))

(declare-fun mapValue!46043 () ValueCell!14029)

(declare-datatypes ((array!75767 0))(
  ( (array!75768 (arr!36533 (Array (_ BitVec 32) ValueCell!14029)) (size!37069 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75767)

(assert (=> mapNonEmpty!46043 (= (arr!36533 _values!996) (store mapRest!46043 mapKey!46043 mapValue!46043))))

(declare-fun b!1172263 () Bool)

(declare-fun res!778307 () Bool)

(declare-fun e!666304 () Bool)

(assert (=> b!1172263 (=> res!778307 e!666304)))

(declare-datatypes ((List!25638 0))(
  ( (Nil!25635) (Cons!25634 (h!26843 (_ BitVec 64)) (t!37577 List!25638)) )
))
(declare-fun noDuplicate!1616 (List!25638) Bool)

(assert (=> b!1172263 (= res!778307 (not (noDuplicate!1616 Nil!25635)))))

(declare-fun b!1172264 () Bool)

(declare-fun tp_is_empty!29477 () Bool)

(assert (=> b!1172264 (= e!666309 tp_is_empty!29477)))

(declare-fun b!1172265 () Bool)

(declare-fun res!778305 () Bool)

(declare-fun e!666311 () Bool)

(assert (=> b!1172265 (=> (not res!778305) (not e!666311))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172265 (= res!778305 (validMask!0 mask!1564))))

(declare-fun res!778296 () Bool)

(assert (=> start!99368 (=> (not res!778296) (not e!666311))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75769 0))(
  ( (array!75770 (arr!36534 (Array (_ BitVec 32) (_ BitVec 64))) (size!37070 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75769)

(assert (=> start!99368 (= res!778296 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37070 _keys!1208))))))

(assert (=> start!99368 e!666311))

(assert (=> start!99368 tp_is_empty!29477))

(declare-fun array_inv!27916 (array!75769) Bool)

(assert (=> start!99368 (array_inv!27916 _keys!1208)))

(assert (=> start!99368 true))

(assert (=> start!99368 tp!87554))

(declare-fun e!666316 () Bool)

(declare-fun array_inv!27917 (array!75767) Bool)

(assert (=> start!99368 (and (array_inv!27917 _values!996) e!666316)))

(declare-fun b!1172266 () Bool)

(declare-fun e!666312 () Bool)

(declare-fun e!666306 () Bool)

(assert (=> b!1172266 (= e!666312 e!666306)))

(declare-fun res!778299 () Bool)

(assert (=> b!1172266 (=> res!778299 e!666306)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1172266 (= res!778299 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44429)

(declare-fun lt!528181 () array!75769)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44429)

(declare-fun lt!528179 () array!75767)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18902 0))(
  ( (tuple2!18903 (_1!9462 (_ BitVec 64)) (_2!9462 V!44429)) )
))
(declare-datatypes ((List!25639 0))(
  ( (Nil!25636) (Cons!25635 (h!26844 tuple2!18902) (t!37578 List!25639)) )
))
(declare-datatypes ((ListLongMap!16871 0))(
  ( (ListLongMap!16872 (toList!8451 List!25639)) )
))
(declare-fun lt!528178 () ListLongMap!16871)

(declare-fun getCurrentListMapNoExtraKeys!4915 (array!75769 array!75767 (_ BitVec 32) (_ BitVec 32) V!44429 V!44429 (_ BitVec 32) Int) ListLongMap!16871)

(assert (=> b!1172266 (= lt!528178 (getCurrentListMapNoExtraKeys!4915 lt!528181 lt!528179 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528175 () V!44429)

(assert (=> b!1172266 (= lt!528179 (array!75768 (store (arr!36533 _values!996) i!673 (ValueCellFull!14029 lt!528175)) (size!37069 _values!996)))))

(declare-fun dynLambda!2887 (Int (_ BitVec 64)) V!44429)

(assert (=> b!1172266 (= lt!528175 (dynLambda!2887 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528180 () ListLongMap!16871)

(assert (=> b!1172266 (= lt!528180 (getCurrentListMapNoExtraKeys!4915 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172267 () Bool)

(declare-fun res!778295 () Bool)

(declare-fun e!666305 () Bool)

(assert (=> b!1172267 (=> (not res!778295) (not e!666305))))

(declare-fun arrayNoDuplicates!0 (array!75769 (_ BitVec 32) List!25638) Bool)

(assert (=> b!1172267 (= res!778295 (arrayNoDuplicates!0 lt!528181 #b00000000000000000000000000000000 Nil!25635))))

(declare-fun b!1172268 () Bool)

(declare-fun e!666310 () Bool)

(declare-fun e!666307 () Bool)

(assert (=> b!1172268 (= e!666310 e!666307)))

(declare-fun res!778291 () Bool)

(assert (=> b!1172268 (=> res!778291 e!666307)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1172268 (= res!778291 (not (= (select (arr!36534 _keys!1208) from!1455) k!934)))))

(declare-fun b!1172269 () Bool)

(declare-fun e!666314 () Bool)

(assert (=> b!1172269 (= e!666314 e!666304)))

(declare-fun res!778304 () Bool)

(assert (=> b!1172269 (=> res!778304 e!666304)))

(assert (=> b!1172269 (= res!778304 (or (bvsge (size!37070 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37070 _keys!1208)) (bvsge from!1455 (size!37070 _keys!1208))))))

(assert (=> b!1172269 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25635)))

(declare-datatypes ((Unit!38654 0))(
  ( (Unit!38655) )
))
(declare-fun lt!528177 () Unit!38654)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75769 (_ BitVec 32) (_ BitVec 32)) Unit!38654)

(assert (=> b!1172269 (= lt!528177 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!75769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172269 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528182 () Unit!38654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75769 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38654)

(assert (=> b!1172269 (= lt!528182 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172270 () Bool)

(declare-fun res!778308 () Bool)

(assert (=> b!1172270 (=> (not res!778308) (not e!666311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75769 (_ BitVec 32)) Bool)

(assert (=> b!1172270 (= res!778308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172271 () Bool)

(declare-fun e!666313 () Bool)

(assert (=> b!1172271 (= e!666316 (and e!666313 mapRes!46043))))

(declare-fun condMapEmpty!46043 () Bool)

(declare-fun mapDefault!46043 () ValueCell!14029)

