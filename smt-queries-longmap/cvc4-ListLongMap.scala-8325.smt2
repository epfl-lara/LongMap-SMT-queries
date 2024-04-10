; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101328 () Bool)

(assert start!101328)

(declare-fun b_free!26225 () Bool)

(declare-fun b_next!26225 () Bool)

(assert (=> start!101328 (= b_free!26225 (not b_next!26225))))

(declare-fun tp!91700 () Bool)

(declare-fun b_and!43585 () Bool)

(assert (=> start!101328 (= tp!91700 b_and!43585)))

(declare-fun b!1217474 () Bool)

(declare-fun e!691201 () Bool)

(declare-fun e!691196 () Bool)

(assert (=> b!1217474 (= e!691201 e!691196)))

(declare-fun res!808509 () Bool)

(assert (=> b!1217474 (=> (not res!808509) (not e!691196))))

(declare-datatypes ((array!78631 0))(
  ( (array!78632 (arr!37949 (Array (_ BitVec 32) (_ BitVec 64))) (size!38485 (_ BitVec 32))) )
))
(declare-fun lt!553368 () array!78631)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78631 (_ BitVec 32)) Bool)

(assert (=> b!1217474 (= res!808509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553368 mask!1564))))

(declare-fun _keys!1208 () array!78631)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1217474 (= lt!553368 (array!78632 (store (arr!37949 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38485 _keys!1208)))))

(declare-fun b!1217475 () Bool)

(declare-fun res!808512 () Bool)

(assert (=> b!1217475 (=> (not res!808512) (not e!691201))))

(assert (=> b!1217475 (= res!808512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217476 () Bool)

(declare-fun e!691199 () Bool)

(declare-fun tp_is_empty!30929 () Bool)

(assert (=> b!1217476 (= e!691199 tp_is_empty!30929)))

(declare-fun mapIsEmpty!48271 () Bool)

(declare-fun mapRes!48271 () Bool)

(assert (=> mapIsEmpty!48271 mapRes!48271))

(declare-fun mapNonEmpty!48271 () Bool)

(declare-fun tp!91699 () Bool)

(declare-fun e!691198 () Bool)

(assert (=> mapNonEmpty!48271 (= mapRes!48271 (and tp!91699 e!691198))))

(declare-datatypes ((V!46365 0))(
  ( (V!46366 (val!15521 Int)) )
))
(declare-datatypes ((ValueCell!14755 0))(
  ( (ValueCellFull!14755 (v!18175 V!46365)) (EmptyCell!14755) )
))
(declare-fun mapRest!48271 () (Array (_ BitVec 32) ValueCell!14755))

(declare-fun mapValue!48271 () ValueCell!14755)

(declare-fun mapKey!48271 () (_ BitVec 32))

(declare-datatypes ((array!78633 0))(
  ( (array!78634 (arr!37950 (Array (_ BitVec 32) ValueCell!14755)) (size!38486 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78633)

(assert (=> mapNonEmpty!48271 (= (arr!37950 _values!996) (store mapRest!48271 mapKey!48271 mapValue!48271))))

(declare-fun b!1217477 () Bool)

(declare-fun res!808513 () Bool)

(assert (=> b!1217477 (=> (not res!808513) (not e!691201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217477 (= res!808513 (validMask!0 mask!1564))))

(declare-fun b!1217478 () Bool)

(declare-fun e!691194 () Bool)

(declare-fun e!691202 () Bool)

(assert (=> b!1217478 (= e!691194 e!691202)))

(declare-fun res!808515 () Bool)

(assert (=> b!1217478 (=> res!808515 e!691202)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217478 (= res!808515 (not (validKeyInArray!0 (select (arr!37949 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19958 0))(
  ( (tuple2!19959 (_1!9990 (_ BitVec 64)) (_2!9990 V!46365)) )
))
(declare-datatypes ((List!26762 0))(
  ( (Nil!26759) (Cons!26758 (h!27967 tuple2!19958) (t!39967 List!26762)) )
))
(declare-datatypes ((ListLongMap!17927 0))(
  ( (ListLongMap!17928 (toList!8979 List!26762)) )
))
(declare-fun lt!553377 () ListLongMap!17927)

(declare-fun lt!553369 () ListLongMap!17927)

(assert (=> b!1217478 (= lt!553377 lt!553369)))

(declare-fun lt!553372 () ListLongMap!17927)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1896 (ListLongMap!17927 (_ BitVec 64)) ListLongMap!17927)

(assert (=> b!1217478 (= lt!553369 (-!1896 lt!553372 k!934))))

(declare-fun zeroValue!944 () V!46365)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46365)

(declare-fun lt!553371 () array!78633)

(declare-fun getCurrentListMapNoExtraKeys!5406 (array!78631 array!78633 (_ BitVec 32) (_ BitVec 32) V!46365 V!46365 (_ BitVec 32) Int) ListLongMap!17927)

(assert (=> b!1217478 (= lt!553377 (getCurrentListMapNoExtraKeys!5406 lt!553368 lt!553371 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1217478 (= lt!553372 (getCurrentListMapNoExtraKeys!5406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40364 0))(
  ( (Unit!40365) )
))
(declare-fun lt!553376 () Unit!40364)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1103 (array!78631 array!78633 (_ BitVec 32) (_ BitVec 32) V!46365 V!46365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40364)

(assert (=> b!1217478 (= lt!553376 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1103 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217473 () Bool)

(declare-fun res!808519 () Bool)

(assert (=> b!1217473 (=> (not res!808519) (not e!691201))))

(assert (=> b!1217473 (= res!808519 (= (select (arr!37949 _keys!1208) i!673) k!934))))

(declare-fun res!808517 () Bool)

(assert (=> start!101328 (=> (not res!808517) (not e!691201))))

(assert (=> start!101328 (= res!808517 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38485 _keys!1208))))))

(assert (=> start!101328 e!691201))

(assert (=> start!101328 tp_is_empty!30929))

(declare-fun array_inv!28888 (array!78631) Bool)

(assert (=> start!101328 (array_inv!28888 _keys!1208)))

(assert (=> start!101328 true))

(assert (=> start!101328 tp!91700))

(declare-fun e!691197 () Bool)

(declare-fun array_inv!28889 (array!78633) Bool)

(assert (=> start!101328 (and (array_inv!28889 _values!996) e!691197)))

(declare-fun b!1217479 () Bool)

(declare-fun res!808511 () Bool)

(assert (=> b!1217479 (=> (not res!808511) (not e!691196))))

(declare-datatypes ((List!26763 0))(
  ( (Nil!26760) (Cons!26759 (h!27968 (_ BitVec 64)) (t!39968 List!26763)) )
))
(declare-fun arrayNoDuplicates!0 (array!78631 (_ BitVec 32) List!26763) Bool)

(assert (=> b!1217479 (= res!808511 (arrayNoDuplicates!0 lt!553368 #b00000000000000000000000000000000 Nil!26760))))

(declare-fun b!1217480 () Bool)

(assert (=> b!1217480 (= e!691198 tp_is_empty!30929)))

(declare-fun b!1217481 () Bool)

(declare-fun e!691195 () Bool)

(assert (=> b!1217481 (= e!691195 e!691194)))

(declare-fun res!808516 () Bool)

(assert (=> b!1217481 (=> res!808516 e!691194)))

(assert (=> b!1217481 (= res!808516 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!553375 () ListLongMap!17927)

(assert (=> b!1217481 (= lt!553375 (getCurrentListMapNoExtraKeys!5406 lt!553368 lt!553371 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553370 () V!46365)

(assert (=> b!1217481 (= lt!553371 (array!78634 (store (arr!37950 _values!996) i!673 (ValueCellFull!14755 lt!553370)) (size!38486 _values!996)))))

(declare-fun dynLambda!3292 (Int (_ BitVec 64)) V!46365)

(assert (=> b!1217481 (= lt!553370 (dynLambda!3292 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553374 () ListLongMap!17927)

(assert (=> b!1217481 (= lt!553374 (getCurrentListMapNoExtraKeys!5406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217482 () Bool)

(assert (=> b!1217482 (= e!691202 (bvslt from!1455 (size!38485 _keys!1208)))))

(declare-fun +!4052 (ListLongMap!17927 tuple2!19958) ListLongMap!17927)

(declare-fun get!19335 (ValueCell!14755 V!46365) V!46365)

(assert (=> b!1217482 (= lt!553375 (+!4052 lt!553369 (tuple2!19959 (select (arr!37949 _keys!1208) from!1455) (get!19335 (select (arr!37950 _values!996) from!1455) lt!553370))))))

(declare-fun b!1217483 () Bool)

(declare-fun res!808507 () Bool)

(assert (=> b!1217483 (=> (not res!808507) (not e!691201))))

(assert (=> b!1217483 (= res!808507 (and (= (size!38486 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38485 _keys!1208) (size!38486 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217484 () Bool)

(assert (=> b!1217484 (= e!691196 (not e!691195))))

(declare-fun res!808518 () Bool)

(assert (=> b!1217484 (=> res!808518 e!691195)))

(assert (=> b!1217484 (= res!808518 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217484 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!553373 () Unit!40364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78631 (_ BitVec 64) (_ BitVec 32)) Unit!40364)

(assert (=> b!1217484 (= lt!553373 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1217485 () Bool)

(declare-fun res!808510 () Bool)

(assert (=> b!1217485 (=> (not res!808510) (not e!691201))))

(assert (=> b!1217485 (= res!808510 (validKeyInArray!0 k!934))))

(declare-fun b!1217486 () Bool)

(declare-fun res!808508 () Bool)

(assert (=> b!1217486 (=> (not res!808508) (not e!691201))))

(assert (=> b!1217486 (= res!808508 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38485 _keys!1208))))))

(declare-fun b!1217487 () Bool)

(declare-fun res!808514 () Bool)

(assert (=> b!1217487 (=> (not res!808514) (not e!691201))))

(assert (=> b!1217487 (= res!808514 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26760))))

(declare-fun b!1217488 () Bool)

(assert (=> b!1217488 (= e!691197 (and e!691199 mapRes!48271))))

(declare-fun condMapEmpty!48271 () Bool)

(declare-fun mapDefault!48271 () ValueCell!14755)

