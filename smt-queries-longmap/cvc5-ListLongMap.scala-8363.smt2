; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101760 () Bool)

(assert start!101760)

(declare-fun b_free!26449 () Bool)

(declare-fun b_next!26449 () Bool)

(assert (=> start!101760 (= b_free!26449 (not b_next!26449))))

(declare-fun tp!92393 () Bool)

(declare-fun b_and!44159 () Bool)

(assert (=> start!101760 (= tp!92393 b_and!44159)))

(declare-fun b!1225381 () Bool)

(declare-fun res!814326 () Bool)

(declare-fun e!695977 () Bool)

(assert (=> b!1225381 (=> (not res!814326) (not e!695977))))

(declare-datatypes ((array!79085 0))(
  ( (array!79086 (arr!38169 (Array (_ BitVec 32) (_ BitVec 64))) (size!38705 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79085)

(declare-datatypes ((List!26949 0))(
  ( (Nil!26946) (Cons!26945 (h!28154 (_ BitVec 64)) (t!40378 List!26949)) )
))
(declare-fun arrayNoDuplicates!0 (array!79085 (_ BitVec 32) List!26949) Bool)

(assert (=> b!1225381 (= res!814326 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26946))))

(declare-fun b!1225382 () Bool)

(declare-fun e!695971 () Bool)

(declare-fun e!695980 () Bool)

(assert (=> b!1225382 (= e!695971 e!695980)))

(declare-fun res!814313 () Bool)

(assert (=> b!1225382 (=> res!814313 e!695980)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1225382 (= res!814313 (not (= (select (arr!38169 _keys!1208) from!1455) k!934)))))

(declare-fun b!1225383 () Bool)

(declare-fun res!814318 () Bool)

(assert (=> b!1225383 (=> (not res!814318) (not e!695977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225383 (= res!814318 (validKeyInArray!0 k!934))))

(declare-fun b!1225384 () Bool)

(declare-fun e!695978 () Bool)

(assert (=> b!1225384 (= e!695977 e!695978)))

(declare-fun res!814319 () Bool)

(assert (=> b!1225384 (=> (not res!814319) (not e!695978))))

(declare-fun lt!558356 () array!79085)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79085 (_ BitVec 32)) Bool)

(assert (=> b!1225384 (= res!814319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558356 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225384 (= lt!558356 (array!79086 (store (arr!38169 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38705 _keys!1208)))))

(declare-fun b!1225385 () Bool)

(declare-fun res!814322 () Bool)

(assert (=> b!1225385 (=> (not res!814322) (not e!695977))))

(assert (=> b!1225385 (= res!814322 (= (select (arr!38169 _keys!1208) i!673) k!934))))

(declare-fun b!1225386 () Bool)

(declare-datatypes ((Unit!40609 0))(
  ( (Unit!40610) )
))
(declare-fun e!695974 () Unit!40609)

(declare-fun Unit!40611 () Unit!40609)

(assert (=> b!1225386 (= e!695974 Unit!40611)))

(declare-fun b!1225387 () Bool)

(declare-fun res!814314 () Bool)

(assert (=> b!1225387 (=> (not res!814314) (not e!695977))))

(assert (=> b!1225387 (= res!814314 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38705 _keys!1208))))))

(declare-fun b!1225388 () Bool)

(declare-fun arrayContainsKey!0 (array!79085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225388 (= e!695980 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1225389 () Bool)

(declare-fun e!695972 () Bool)

(declare-fun e!695970 () Bool)

(assert (=> b!1225389 (= e!695972 e!695970)))

(declare-fun res!814327 () Bool)

(assert (=> b!1225389 (=> res!814327 e!695970)))

(assert (=> b!1225389 (= res!814327 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46665 0))(
  ( (V!46666 (val!15633 Int)) )
))
(declare-fun zeroValue!944 () V!46665)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14867 0))(
  ( (ValueCellFull!14867 (v!18295 V!46665)) (EmptyCell!14867) )
))
(declare-datatypes ((array!79087 0))(
  ( (array!79088 (arr!38170 (Array (_ BitVec 32) ValueCell!14867)) (size!38706 (_ BitVec 32))) )
))
(declare-fun lt!558350 () array!79087)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!20148 0))(
  ( (tuple2!20149 (_1!10085 (_ BitVec 64)) (_2!10085 V!46665)) )
))
(declare-datatypes ((List!26950 0))(
  ( (Nil!26947) (Cons!26946 (h!28155 tuple2!20148) (t!40379 List!26950)) )
))
(declare-datatypes ((ListLongMap!18117 0))(
  ( (ListLongMap!18118 (toList!9074 List!26950)) )
))
(declare-fun lt!558347 () ListLongMap!18117)

(declare-fun minValue!944 () V!46665)

(declare-fun getCurrentListMapNoExtraKeys!5493 (array!79085 array!79087 (_ BitVec 32) (_ BitVec 32) V!46665 V!46665 (_ BitVec 32) Int) ListLongMap!18117)

(assert (=> b!1225389 (= lt!558347 (getCurrentListMapNoExtraKeys!5493 lt!558356 lt!558350 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!558358 () V!46665)

(declare-fun _values!996 () array!79087)

(assert (=> b!1225389 (= lt!558350 (array!79088 (store (arr!38170 _values!996) i!673 (ValueCellFull!14867 lt!558358)) (size!38706 _values!996)))))

(declare-fun dynLambda!3365 (Int (_ BitVec 64)) V!46665)

(assert (=> b!1225389 (= lt!558358 (dynLambda!3365 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!558354 () ListLongMap!18117)

(assert (=> b!1225389 (= lt!558354 (getCurrentListMapNoExtraKeys!5493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225390 () Bool)

(declare-fun e!695975 () Bool)

(assert (=> b!1225390 (= e!695970 e!695975)))

(declare-fun res!814324 () Bool)

(assert (=> b!1225390 (=> res!814324 e!695975)))

(assert (=> b!1225390 (= res!814324 (not (validKeyInArray!0 (select (arr!38169 _keys!1208) from!1455))))))

(declare-fun lt!558349 () ListLongMap!18117)

(declare-fun lt!558351 () ListLongMap!18117)

(assert (=> b!1225390 (= lt!558349 lt!558351)))

(declare-fun lt!558352 () ListLongMap!18117)

(declare-fun -!1973 (ListLongMap!18117 (_ BitVec 64)) ListLongMap!18117)

(assert (=> b!1225390 (= lt!558351 (-!1973 lt!558352 k!934))))

(assert (=> b!1225390 (= lt!558349 (getCurrentListMapNoExtraKeys!5493 lt!558356 lt!558350 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1225390 (= lt!558352 (getCurrentListMapNoExtraKeys!5493 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!558355 () Unit!40609)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1179 (array!79085 array!79087 (_ BitVec 32) (_ BitVec 32) V!46665 V!46665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40609)

(assert (=> b!1225390 (= lt!558355 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1179 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!48628 () Bool)

(declare-fun mapRes!48628 () Bool)

(assert (=> mapIsEmpty!48628 mapRes!48628))

(declare-fun b!1225391 () Bool)

(declare-fun res!814316 () Bool)

(assert (=> b!1225391 (=> (not res!814316) (not e!695977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225391 (= res!814316 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!48628 () Bool)

(declare-fun tp!92392 () Bool)

(declare-fun e!695973 () Bool)

(assert (=> mapNonEmpty!48628 (= mapRes!48628 (and tp!92392 e!695973))))

(declare-fun mapKey!48628 () (_ BitVec 32))

(declare-fun mapRest!48628 () (Array (_ BitVec 32) ValueCell!14867))

(declare-fun mapValue!48628 () ValueCell!14867)

(assert (=> mapNonEmpty!48628 (= (arr!38170 _values!996) (store mapRest!48628 mapKey!48628 mapValue!48628))))

(declare-fun b!1225392 () Bool)

(declare-fun res!814323 () Bool)

(assert (=> b!1225392 (=> (not res!814323) (not e!695977))))

(assert (=> b!1225392 (= res!814323 (and (= (size!38706 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38705 _keys!1208) (size!38706 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225394 () Bool)

(declare-fun Unit!40612 () Unit!40609)

(assert (=> b!1225394 (= e!695974 Unit!40612)))

(declare-fun lt!558345 () Unit!40609)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79085 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40609)

(assert (=> b!1225394 (= lt!558345 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1225394 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!558344 () Unit!40609)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79085 (_ BitVec 32) (_ BitVec 32)) Unit!40609)

(assert (=> b!1225394 (= lt!558344 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1225394 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26946)))

(declare-fun lt!558361 () Unit!40609)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79085 (_ BitVec 64) (_ BitVec 32) List!26949) Unit!40609)

(assert (=> b!1225394 (= lt!558361 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26946))))

(assert (=> b!1225394 false))

(declare-fun b!1225393 () Bool)

(declare-fun e!695979 () Bool)

(declare-fun e!695969 () Bool)

(assert (=> b!1225393 (= e!695979 (and e!695969 mapRes!48628))))

(declare-fun condMapEmpty!48628 () Bool)

(declare-fun mapDefault!48628 () ValueCell!14867)

