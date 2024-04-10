; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101464 () Bool)

(assert start!101464)

(declare-fun b_free!26281 () Bool)

(declare-fun b_next!26281 () Bool)

(assert (=> start!101464 (= b_free!26281 (not b_next!26281))))

(declare-fun tp!91876 () Bool)

(declare-fun b_and!43751 () Bool)

(assert (=> start!101464 (= tp!91876 b_and!43751)))

(declare-fun b!1219487 () Bool)

(declare-fun e!692419 () Bool)

(declare-fun e!692417 () Bool)

(assert (=> b!1219487 (= e!692419 e!692417)))

(declare-fun res!809969 () Bool)

(assert (=> b!1219487 (=> res!809969 e!692417)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219487 (= res!809969 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46441 0))(
  ( (V!46442 (val!15549 Int)) )
))
(declare-fun zeroValue!944 () V!46441)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!20010 0))(
  ( (tuple2!20011 (_1!10016 (_ BitVec 64)) (_2!10016 V!46441)) )
))
(declare-datatypes ((List!26811 0))(
  ( (Nil!26808) (Cons!26807 (h!28016 tuple2!20010) (t!40072 List!26811)) )
))
(declare-datatypes ((ListLongMap!17979 0))(
  ( (ListLongMap!17980 (toList!9005 List!26811)) )
))
(declare-fun lt!554457 () ListLongMap!17979)

(declare-datatypes ((array!78747 0))(
  ( (array!78748 (arr!38004 (Array (_ BitVec 32) (_ BitVec 64))) (size!38540 (_ BitVec 32))) )
))
(declare-fun lt!554463 () array!78747)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14783 0))(
  ( (ValueCellFull!14783 (v!18206 V!46441)) (EmptyCell!14783) )
))
(declare-datatypes ((array!78749 0))(
  ( (array!78750 (arr!38005 (Array (_ BitVec 32) ValueCell!14783)) (size!38541 (_ BitVec 32))) )
))
(declare-fun lt!554466 () array!78749)

(declare-fun minValue!944 () V!46441)

(declare-fun getCurrentListMapNoExtraKeys!5430 (array!78747 array!78749 (_ BitVec 32) (_ BitVec 32) V!46441 V!46441 (_ BitVec 32) Int) ListLongMap!17979)

(assert (=> b!1219487 (= lt!554457 (getCurrentListMapNoExtraKeys!5430 lt!554463 lt!554466 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554462 () V!46441)

(declare-fun _values!996 () array!78749)

(assert (=> b!1219487 (= lt!554466 (array!78750 (store (arr!38005 _values!996) i!673 (ValueCellFull!14783 lt!554462)) (size!38541 _values!996)))))

(declare-fun dynLambda!3312 (Int (_ BitVec 64)) V!46441)

(assert (=> b!1219487 (= lt!554462 (dynLambda!3312 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!78747)

(declare-fun lt!554456 () ListLongMap!17979)

(assert (=> b!1219487 (= lt!554456 (getCurrentListMapNoExtraKeys!5430 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219488 () Bool)

(declare-fun e!692427 () Bool)

(declare-fun e!692424 () Bool)

(assert (=> b!1219488 (= e!692427 e!692424)))

(declare-fun res!809971 () Bool)

(assert (=> b!1219488 (=> res!809971 e!692424)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1219488 (= res!809971 (not (= (select (arr!38004 _keys!1208) from!1455) k!934)))))

(declare-fun b!1219489 () Bool)

(declare-fun res!809973 () Bool)

(declare-fun e!692425 () Bool)

(assert (=> b!1219489 (=> (not res!809973) (not e!692425))))

(assert (=> b!1219489 (= res!809973 (= (select (arr!38004 _keys!1208) i!673) k!934))))

(declare-fun b!1219490 () Bool)

(declare-fun res!809966 () Bool)

(assert (=> b!1219490 (=> (not res!809966) (not e!692425))))

(assert (=> b!1219490 (= res!809966 (and (= (size!38541 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38540 _keys!1208) (size!38541 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219491 () Bool)

(declare-fun res!809975 () Bool)

(declare-fun e!692421 () Bool)

(assert (=> b!1219491 (=> (not res!809975) (not e!692421))))

(declare-datatypes ((List!26812 0))(
  ( (Nil!26809) (Cons!26808 (h!28017 (_ BitVec 64)) (t!40073 List!26812)) )
))
(declare-fun arrayNoDuplicates!0 (array!78747 (_ BitVec 32) List!26812) Bool)

(assert (=> b!1219491 (= res!809975 (arrayNoDuplicates!0 lt!554463 #b00000000000000000000000000000000 Nil!26809))))

(declare-fun mapNonEmpty!48364 () Bool)

(declare-fun mapRes!48364 () Bool)

(declare-fun tp!91877 () Bool)

(declare-fun e!692420 () Bool)

(assert (=> mapNonEmpty!48364 (= mapRes!48364 (and tp!91877 e!692420))))

(declare-fun mapRest!48364 () (Array (_ BitVec 32) ValueCell!14783))

(declare-fun mapKey!48364 () (_ BitVec 32))

(declare-fun mapValue!48364 () ValueCell!14783)

(assert (=> mapNonEmpty!48364 (= (arr!38005 _values!996) (store mapRest!48364 mapKey!48364 mapValue!48364))))

(declare-fun b!1219492 () Bool)

(assert (=> b!1219492 (= e!692421 (not e!692419))))

(declare-fun res!809963 () Bool)

(assert (=> b!1219492 (=> res!809963 e!692419)))

(assert (=> b!1219492 (= res!809963 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219492 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40410 0))(
  ( (Unit!40411) )
))
(declare-fun lt!554465 () Unit!40410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78747 (_ BitVec 64) (_ BitVec 32)) Unit!40410)

(assert (=> b!1219492 (= lt!554465 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1219493 () Bool)

(assert (=> b!1219493 (= e!692424 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun res!809967 () Bool)

(assert (=> start!101464 (=> (not res!809967) (not e!692425))))

(assert (=> start!101464 (= res!809967 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38540 _keys!1208))))))

(assert (=> start!101464 e!692425))

(declare-fun tp_is_empty!30985 () Bool)

(assert (=> start!101464 tp_is_empty!30985))

(declare-fun array_inv!28922 (array!78747) Bool)

(assert (=> start!101464 (array_inv!28922 _keys!1208)))

(assert (=> start!101464 true))

(assert (=> start!101464 tp!91876))

(declare-fun e!692428 () Bool)

(declare-fun array_inv!28923 (array!78749) Bool)

(assert (=> start!101464 (and (array_inv!28923 _values!996) e!692428)))

(declare-fun mapIsEmpty!48364 () Bool)

(assert (=> mapIsEmpty!48364 mapRes!48364))

(declare-fun b!1219494 () Bool)

(declare-fun e!692423 () Bool)

(assert (=> b!1219494 (= e!692417 e!692423)))

(declare-fun res!809970 () Bool)

(assert (=> b!1219494 (=> res!809970 e!692423)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219494 (= res!809970 (not (validKeyInArray!0 (select (arr!38004 _keys!1208) from!1455))))))

(declare-fun lt!554464 () ListLongMap!17979)

(declare-fun lt!554460 () ListLongMap!17979)

(assert (=> b!1219494 (= lt!554464 lt!554460)))

(declare-fun lt!554458 () ListLongMap!17979)

(declare-fun -!1917 (ListLongMap!17979 (_ BitVec 64)) ListLongMap!17979)

(assert (=> b!1219494 (= lt!554460 (-!1917 lt!554458 k!934))))

(assert (=> b!1219494 (= lt!554464 (getCurrentListMapNoExtraKeys!5430 lt!554463 lt!554466 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219494 (= lt!554458 (getCurrentListMapNoExtraKeys!5430 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554461 () Unit!40410)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1124 (array!78747 array!78749 (_ BitVec 32) (_ BitVec 32) V!46441 V!46441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40410)

(assert (=> b!1219494 (= lt!554461 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1124 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219495 () Bool)

(declare-fun res!809968 () Bool)

(assert (=> b!1219495 (=> (not res!809968) (not e!692425))))

(assert (=> b!1219495 (= res!809968 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38540 _keys!1208))))))

(declare-fun b!1219496 () Bool)

(declare-fun res!809974 () Bool)

(assert (=> b!1219496 (=> (not res!809974) (not e!692425))))

(assert (=> b!1219496 (= res!809974 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26809))))

(declare-fun b!1219497 () Bool)

(assert (=> b!1219497 (= e!692425 e!692421)))

(declare-fun res!809972 () Bool)

(assert (=> b!1219497 (=> (not res!809972) (not e!692421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78747 (_ BitVec 32)) Bool)

(assert (=> b!1219497 (= res!809972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554463 mask!1564))))

(assert (=> b!1219497 (= lt!554463 (array!78748 (store (arr!38004 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38540 _keys!1208)))))

(declare-fun b!1219498 () Bool)

(declare-fun res!809962 () Bool)

(assert (=> b!1219498 (=> (not res!809962) (not e!692425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219498 (= res!809962 (validMask!0 mask!1564))))

(declare-fun b!1219499 () Bool)

(declare-fun res!809964 () Bool)

(assert (=> b!1219499 (=> (not res!809964) (not e!692425))))

(assert (=> b!1219499 (= res!809964 (validKeyInArray!0 k!934))))

(declare-fun b!1219500 () Bool)

(declare-fun res!809961 () Bool)

(assert (=> b!1219500 (=> (not res!809961) (not e!692425))))

(assert (=> b!1219500 (= res!809961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219501 () Bool)

(assert (=> b!1219501 (= e!692420 tp_is_empty!30985)))

(declare-fun b!1219502 () Bool)

(declare-fun e!692426 () Bool)

(assert (=> b!1219502 (= e!692428 (and e!692426 mapRes!48364))))

(declare-fun condMapEmpty!48364 () Bool)

(declare-fun mapDefault!48364 () ValueCell!14783)

