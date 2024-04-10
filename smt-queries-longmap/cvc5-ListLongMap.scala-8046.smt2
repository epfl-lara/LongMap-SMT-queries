; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99116 () Bool)

(assert start!99116)

(declare-fun b_free!24721 () Bool)

(declare-fun b_next!24721 () Bool)

(assert (=> start!99116 (= b_free!24721 (not b_next!24721))))

(declare-fun tp!86874 () Bool)

(declare-fun b_and!40291 () Bool)

(assert (=> start!99116 (= tp!86874 b_and!40291)))

(declare-fun b!1165997 () Bool)

(declare-fun res!773354 () Bool)

(declare-fun e!662810 () Bool)

(assert (=> b!1165997 (=> (not res!773354) (not e!662810))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165997 (= res!773354 (validMask!0 mask!1564))))

(declare-fun b!1165998 () Bool)

(declare-fun res!773353 () Bool)

(assert (=> b!1165998 (=> (not res!773353) (not e!662810))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165998 (= res!773353 (validKeyInArray!0 k!934))))

(declare-fun res!773360 () Bool)

(assert (=> start!99116 (=> (not res!773360) (not e!662810))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75333 0))(
  ( (array!75334 (arr!36317 (Array (_ BitVec 32) (_ BitVec 64))) (size!36853 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75333)

(assert (=> start!99116 (= res!773360 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36853 _keys!1208))))))

(assert (=> start!99116 e!662810))

(declare-fun tp_is_empty!29251 () Bool)

(assert (=> start!99116 tp_is_empty!29251))

(declare-fun array_inv!27776 (array!75333) Bool)

(assert (=> start!99116 (array_inv!27776 _keys!1208)))

(assert (=> start!99116 true))

(assert (=> start!99116 tp!86874))

(declare-datatypes ((V!44129 0))(
  ( (V!44130 (val!14682 Int)) )
))
(declare-datatypes ((ValueCell!13916 0))(
  ( (ValueCellFull!13916 (v!17319 V!44129)) (EmptyCell!13916) )
))
(declare-datatypes ((array!75335 0))(
  ( (array!75336 (arr!36318 (Array (_ BitVec 32) ValueCell!13916)) (size!36854 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75335)

(declare-fun e!662817 () Bool)

(declare-fun array_inv!27777 (array!75335) Bool)

(assert (=> start!99116 (and (array_inv!27777 _values!996) e!662817)))

(declare-fun b!1165999 () Bool)

(declare-fun e!662816 () Bool)

(assert (=> b!1165999 (= e!662816 true)))

(declare-fun zeroValue!944 () V!44129)

(declare-fun lt!525086 () array!75335)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525083 () array!75333)

(declare-fun minValue!944 () V!44129)

(declare-datatypes ((tuple2!18724 0))(
  ( (tuple2!18725 (_1!9373 (_ BitVec 64)) (_2!9373 V!44129)) )
))
(declare-datatypes ((List!25462 0))(
  ( (Nil!25459) (Cons!25458 (h!26667 tuple2!18724) (t!37175 List!25462)) )
))
(declare-datatypes ((ListLongMap!16693 0))(
  ( (ListLongMap!16694 (toList!8362 List!25462)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4826 (array!75333 array!75335 (_ BitVec 32) (_ BitVec 32) V!44129 V!44129 (_ BitVec 32) Int) ListLongMap!16693)

(declare-fun -!1439 (ListLongMap!16693 (_ BitVec 64)) ListLongMap!16693)

(assert (=> b!1165999 (= (getCurrentListMapNoExtraKeys!4826 lt!525083 lt!525086 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1439 (getCurrentListMapNoExtraKeys!4826 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!38474 0))(
  ( (Unit!38475) )
))
(declare-fun lt!525082 () Unit!38474)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!666 (array!75333 array!75335 (_ BitVec 32) (_ BitVec 32) V!44129 V!44129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38474)

(assert (=> b!1165999 (= lt!525082 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!666 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166000 () Bool)

(declare-fun res!773355 () Bool)

(assert (=> b!1166000 (=> (not res!773355) (not e!662810))))

(assert (=> b!1166000 (= res!773355 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36853 _keys!1208))))))

(declare-fun b!1166001 () Bool)

(declare-fun e!662811 () Bool)

(assert (=> b!1166001 (= e!662811 e!662816)))

(declare-fun res!773359 () Bool)

(assert (=> b!1166001 (=> res!773359 e!662816)))

(assert (=> b!1166001 (= res!773359 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525085 () ListLongMap!16693)

(assert (=> b!1166001 (= lt!525085 (getCurrentListMapNoExtraKeys!4826 lt!525083 lt!525086 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2816 (Int (_ BitVec 64)) V!44129)

(assert (=> b!1166001 (= lt!525086 (array!75336 (store (arr!36318 _values!996) i!673 (ValueCellFull!13916 (dynLambda!2816 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36854 _values!996)))))

(declare-fun lt!525084 () ListLongMap!16693)

(assert (=> b!1166001 (= lt!525084 (getCurrentListMapNoExtraKeys!4826 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166002 () Bool)

(declare-fun res!773361 () Bool)

(assert (=> b!1166002 (=> (not res!773361) (not e!662810))))

(declare-datatypes ((List!25463 0))(
  ( (Nil!25460) (Cons!25459 (h!26668 (_ BitVec 64)) (t!37176 List!25463)) )
))
(declare-fun arrayNoDuplicates!0 (array!75333 (_ BitVec 32) List!25463) Bool)

(assert (=> b!1166002 (= res!773361 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25460))))

(declare-fun mapNonEmpty!45701 () Bool)

(declare-fun mapRes!45701 () Bool)

(declare-fun tp!86873 () Bool)

(declare-fun e!662812 () Bool)

(assert (=> mapNonEmpty!45701 (= mapRes!45701 (and tp!86873 e!662812))))

(declare-fun mapValue!45701 () ValueCell!13916)

(declare-fun mapKey!45701 () (_ BitVec 32))

(declare-fun mapRest!45701 () (Array (_ BitVec 32) ValueCell!13916))

(assert (=> mapNonEmpty!45701 (= (arr!36318 _values!996) (store mapRest!45701 mapKey!45701 mapValue!45701))))

(declare-fun b!1166003 () Bool)

(declare-fun e!662815 () Bool)

(assert (=> b!1166003 (= e!662810 e!662815)))

(declare-fun res!773352 () Bool)

(assert (=> b!1166003 (=> (not res!773352) (not e!662815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75333 (_ BitVec 32)) Bool)

(assert (=> b!1166003 (= res!773352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525083 mask!1564))))

(assert (=> b!1166003 (= lt!525083 (array!75334 (store (arr!36317 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36853 _keys!1208)))))

(declare-fun mapIsEmpty!45701 () Bool)

(assert (=> mapIsEmpty!45701 mapRes!45701))

(declare-fun b!1166004 () Bool)

(declare-fun res!773362 () Bool)

(assert (=> b!1166004 (=> (not res!773362) (not e!662810))))

(assert (=> b!1166004 (= res!773362 (and (= (size!36854 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36853 _keys!1208) (size!36854 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166005 () Bool)

(assert (=> b!1166005 (= e!662812 tp_is_empty!29251)))

(declare-fun b!1166006 () Bool)

(declare-fun res!773357 () Bool)

(assert (=> b!1166006 (=> (not res!773357) (not e!662810))))

(assert (=> b!1166006 (= res!773357 (= (select (arr!36317 _keys!1208) i!673) k!934))))

(declare-fun b!1166007 () Bool)

(declare-fun e!662814 () Bool)

(assert (=> b!1166007 (= e!662814 tp_is_empty!29251)))

(declare-fun b!1166008 () Bool)

(declare-fun res!773363 () Bool)

(assert (=> b!1166008 (=> (not res!773363) (not e!662815))))

(assert (=> b!1166008 (= res!773363 (arrayNoDuplicates!0 lt!525083 #b00000000000000000000000000000000 Nil!25460))))

(declare-fun b!1166009 () Bool)

(assert (=> b!1166009 (= e!662817 (and e!662814 mapRes!45701))))

(declare-fun condMapEmpty!45701 () Bool)

(declare-fun mapDefault!45701 () ValueCell!13916)

