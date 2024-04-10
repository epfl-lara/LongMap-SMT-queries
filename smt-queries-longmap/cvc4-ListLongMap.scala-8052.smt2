; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99156 () Bool)

(assert start!99156)

(declare-fun b_free!24761 () Bool)

(declare-fun b_next!24761 () Bool)

(assert (=> start!99156 (= b_free!24761 (not b_next!24761))))

(declare-fun tp!86994 () Bool)

(declare-fun b_and!40371 () Bool)

(assert (=> start!99156 (= tp!86994 b_and!40371)))

(declare-fun mapNonEmpty!45761 () Bool)

(declare-fun mapRes!45761 () Bool)

(declare-fun tp!86993 () Bool)

(declare-fun e!663291 () Bool)

(assert (=> mapNonEmpty!45761 (= mapRes!45761 (and tp!86993 e!663291))))

(declare-datatypes ((V!44181 0))(
  ( (V!44182 (val!14702 Int)) )
))
(declare-datatypes ((ValueCell!13936 0))(
  ( (ValueCellFull!13936 (v!17339 V!44181)) (EmptyCell!13936) )
))
(declare-fun mapValue!45761 () ValueCell!13936)

(declare-datatypes ((array!75413 0))(
  ( (array!75414 (arr!36357 (Array (_ BitVec 32) ValueCell!13936)) (size!36893 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75413)

(declare-fun mapKey!45761 () (_ BitVec 32))

(declare-fun mapRest!45761 () (Array (_ BitVec 32) ValueCell!13936))

(assert (=> mapNonEmpty!45761 (= (arr!36357 _values!996) (store mapRest!45761 mapKey!45761 mapValue!45761))))

(declare-fun b!1166937 () Bool)

(declare-fun e!663292 () Bool)

(declare-fun e!663296 () Bool)

(assert (=> b!1166937 (= e!663292 e!663296)))

(declare-fun res!774078 () Bool)

(assert (=> b!1166937 (=> (not res!774078) (not e!663296))))

(declare-datatypes ((array!75415 0))(
  ( (array!75416 (arr!36358 (Array (_ BitVec 32) (_ BitVec 64))) (size!36894 (_ BitVec 32))) )
))
(declare-fun lt!525447 () array!75415)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75415 (_ BitVec 32)) Bool)

(assert (=> b!1166937 (= res!774078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525447 mask!1564))))

(declare-fun _keys!1208 () array!75415)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1166937 (= lt!525447 (array!75416 (store (arr!36358 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36894 _keys!1208)))))

(declare-fun b!1166939 () Bool)

(declare-fun res!774076 () Bool)

(assert (=> b!1166939 (=> (not res!774076) (not e!663292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166939 (= res!774076 (validMask!0 mask!1564))))

(declare-fun b!1166940 () Bool)

(declare-fun e!663293 () Bool)

(assert (=> b!1166940 (= e!663293 true)))

(declare-fun zeroValue!944 () V!44181)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!525442 () array!75413)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!44181)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!18754 0))(
  ( (tuple2!18755 (_1!9388 (_ BitVec 64)) (_2!9388 V!44181)) )
))
(declare-datatypes ((List!25495 0))(
  ( (Nil!25492) (Cons!25491 (h!26700 tuple2!18754) (t!37248 List!25495)) )
))
(declare-datatypes ((ListLongMap!16723 0))(
  ( (ListLongMap!16724 (toList!8377 List!25495)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4841 (array!75415 array!75413 (_ BitVec 32) (_ BitVec 32) V!44181 V!44181 (_ BitVec 32) Int) ListLongMap!16723)

(declare-fun -!1453 (ListLongMap!16723 (_ BitVec 64)) ListLongMap!16723)

(assert (=> b!1166940 (= (getCurrentListMapNoExtraKeys!4841 lt!525447 lt!525442 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1453 (getCurrentListMapNoExtraKeys!4841 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!38508 0))(
  ( (Unit!38509) )
))
(declare-fun lt!525444 () Unit!38508)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!680 (array!75415 array!75413 (_ BitVec 32) (_ BitVec 32) V!44181 V!44181 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38508)

(assert (=> b!1166940 (= lt!525444 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!680 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1166941 () Bool)

(declare-fun res!774074 () Bool)

(assert (=> b!1166941 (=> (not res!774074) (not e!663292))))

(assert (=> b!1166941 (= res!774074 (and (= (size!36893 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36894 _keys!1208) (size!36893 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1166942 () Bool)

(declare-fun e!663294 () Bool)

(declare-fun tp_is_empty!29291 () Bool)

(assert (=> b!1166942 (= e!663294 tp_is_empty!29291)))

(declare-fun b!1166943 () Bool)

(declare-fun e!663290 () Bool)

(assert (=> b!1166943 (= e!663290 (and e!663294 mapRes!45761))))

(declare-fun condMapEmpty!45761 () Bool)

(declare-fun mapDefault!45761 () ValueCell!13936)

