; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101324 () Bool)

(assert start!101324)

(declare-fun b_free!26221 () Bool)

(declare-fun b_next!26221 () Bool)

(assert (=> start!101324 (= b_free!26221 (not b_next!26221))))

(declare-fun tp!91687 () Bool)

(declare-fun b_and!43577 () Bool)

(assert (=> start!101324 (= tp!91687 b_and!43577)))

(declare-fun mapNonEmpty!48265 () Bool)

(declare-fun mapRes!48265 () Bool)

(declare-fun tp!91688 () Bool)

(declare-fun e!691142 () Bool)

(assert (=> mapNonEmpty!48265 (= mapRes!48265 (and tp!91688 e!691142))))

(declare-datatypes ((V!46361 0))(
  ( (V!46362 (val!15519 Int)) )
))
(declare-datatypes ((ValueCell!14753 0))(
  ( (ValueCellFull!14753 (v!18173 V!46361)) (EmptyCell!14753) )
))
(declare-fun mapRest!48265 () (Array (_ BitVec 32) ValueCell!14753))

(declare-datatypes ((array!78623 0))(
  ( (array!78624 (arr!37945 (Array (_ BitVec 32) ValueCell!14753)) (size!38481 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78623)

(declare-fun mapKey!48265 () (_ BitVec 32))

(declare-fun mapValue!48265 () ValueCell!14753)

(assert (=> mapNonEmpty!48265 (= (arr!37945 _values!996) (store mapRest!48265 mapKey!48265 mapValue!48265))))

(declare-fun mapIsEmpty!48265 () Bool)

(assert (=> mapIsEmpty!48265 mapRes!48265))

(declare-fun b!1217373 () Bool)

(declare-fun res!808441 () Bool)

(declare-fun e!691140 () Bool)

(assert (=> b!1217373 (=> (not res!808441) (not e!691140))))

(declare-datatypes ((array!78625 0))(
  ( (array!78626 (arr!37946 (Array (_ BitVec 32) (_ BitVec 64))) (size!38482 (_ BitVec 32))) )
))
(declare-fun lt!553310 () array!78625)

(declare-datatypes ((List!26758 0))(
  ( (Nil!26755) (Cons!26754 (h!27963 (_ BitVec 64)) (t!39959 List!26758)) )
))
(declare-fun arrayNoDuplicates!0 (array!78625 (_ BitVec 32) List!26758) Bool)

(assert (=> b!1217373 (= res!808441 (arrayNoDuplicates!0 lt!553310 #b00000000000000000000000000000000 Nil!26755))))

(declare-fun b!1217374 () Bool)

(declare-fun res!808439 () Bool)

(declare-fun e!691147 () Bool)

(assert (=> b!1217374 (=> (not res!808439) (not e!691147))))

(declare-fun _keys!1208 () array!78625)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1217374 (= res!808439 (and (= (size!38481 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38482 _keys!1208) (size!38481 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1217375 () Bool)

(declare-fun res!808431 () Bool)

(assert (=> b!1217375 (=> (not res!808431) (not e!691147))))

(assert (=> b!1217375 (= res!808431 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26755))))

(declare-fun b!1217376 () Bool)

(declare-fun res!808437 () Bool)

(assert (=> b!1217376 (=> (not res!808437) (not e!691147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217376 (= res!808437 (validMask!0 mask!1564))))

(declare-fun b!1217377 () Bool)

(declare-fun res!808435 () Bool)

(assert (=> b!1217377 (=> (not res!808435) (not e!691147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78625 (_ BitVec 32)) Bool)

(assert (=> b!1217377 (= res!808435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217378 () Bool)

(declare-fun e!691141 () Bool)

(assert (=> b!1217378 (= e!691140 (not e!691141))))

(declare-fun res!808434 () Bool)

(assert (=> b!1217378 (=> res!808434 e!691141)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1217378 (= res!808434 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217378 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40360 0))(
  ( (Unit!40361) )
))
(declare-fun lt!553312 () Unit!40360)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78625 (_ BitVec 64) (_ BitVec 32)) Unit!40360)

(assert (=> b!1217378 (= lt!553312 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1217379 () Bool)

(declare-fun e!691146 () Bool)

(declare-fun tp_is_empty!30925 () Bool)

(assert (=> b!1217379 (= e!691146 tp_is_empty!30925)))

(declare-fun b!1217380 () Bool)

(assert (=> b!1217380 (= e!691147 e!691140)))

(declare-fun res!808438 () Bool)

(assert (=> b!1217380 (=> (not res!808438) (not e!691140))))

(assert (=> b!1217380 (= res!808438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553310 mask!1564))))

(assert (=> b!1217380 (= lt!553310 (array!78626 (store (arr!37946 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38482 _keys!1208)))))

(declare-fun res!808430 () Bool)

(assert (=> start!101324 (=> (not res!808430) (not e!691147))))

(assert (=> start!101324 (= res!808430 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38482 _keys!1208))))))

(assert (=> start!101324 e!691147))

(assert (=> start!101324 tp_is_empty!30925))

(declare-fun array_inv!28884 (array!78625) Bool)

(assert (=> start!101324 (array_inv!28884 _keys!1208)))

(assert (=> start!101324 true))

(assert (=> start!101324 tp!91687))

(declare-fun e!691143 () Bool)

(declare-fun array_inv!28885 (array!78623) Bool)

(assert (=> start!101324 (and (array_inv!28885 _values!996) e!691143)))

(declare-fun b!1217381 () Bool)

(declare-fun res!808429 () Bool)

(assert (=> b!1217381 (=> (not res!808429) (not e!691147))))

(assert (=> b!1217381 (= res!808429 (= (select (arr!37946 _keys!1208) i!673) k!934))))

(declare-fun b!1217382 () Bool)

(declare-fun res!808436 () Bool)

(assert (=> b!1217382 (=> (not res!808436) (not e!691147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1217382 (= res!808436 (validKeyInArray!0 k!934))))

(declare-fun b!1217383 () Bool)

(declare-fun e!691144 () Bool)

(declare-fun e!691145 () Bool)

(assert (=> b!1217383 (= e!691144 e!691145)))

(declare-fun res!808440 () Bool)

(assert (=> b!1217383 (=> res!808440 e!691145)))

(assert (=> b!1217383 (= res!808440 (not (validKeyInArray!0 (select (arr!37946 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19954 0))(
  ( (tuple2!19955 (_1!9988 (_ BitVec 64)) (_2!9988 V!46361)) )
))
(declare-datatypes ((List!26759 0))(
  ( (Nil!26756) (Cons!26755 (h!27964 tuple2!19954) (t!39960 List!26759)) )
))
(declare-datatypes ((ListLongMap!17923 0))(
  ( (ListLongMap!17924 (toList!8977 List!26759)) )
))
(declare-fun lt!553314 () ListLongMap!17923)

(declare-fun lt!553317 () ListLongMap!17923)

(assert (=> b!1217383 (= lt!553314 lt!553317)))

(declare-fun lt!553311 () ListLongMap!17923)

(declare-fun -!1894 (ListLongMap!17923 (_ BitVec 64)) ListLongMap!17923)

(assert (=> b!1217383 (= lt!553317 (-!1894 lt!553311 k!934))))

(declare-fun zeroValue!944 () V!46361)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46361)

(declare-fun lt!553313 () array!78623)

(declare-fun getCurrentListMapNoExtraKeys!5404 (array!78625 array!78623 (_ BitVec 32) (_ BitVec 32) V!46361 V!46361 (_ BitVec 32) Int) ListLongMap!17923)

(assert (=> b!1217383 (= lt!553314 (getCurrentListMapNoExtraKeys!5404 lt!553310 lt!553313 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1217383 (= lt!553311 (getCurrentListMapNoExtraKeys!5404 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!553308 () Unit!40360)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1101 (array!78625 array!78623 (_ BitVec 32) (_ BitVec 32) V!46361 V!46361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40360)

(assert (=> b!1217383 (= lt!553308 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1101 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1217384 () Bool)

(assert (=> b!1217384 (= e!691145 (bvslt from!1455 (size!38482 _keys!1208)))))

(declare-fun lt!553309 () ListLongMap!17923)

(declare-fun lt!553316 () V!46361)

(declare-fun +!4050 (ListLongMap!17923 tuple2!19954) ListLongMap!17923)

(declare-fun get!19333 (ValueCell!14753 V!46361) V!46361)

(assert (=> b!1217384 (= lt!553309 (+!4050 lt!553317 (tuple2!19955 (select (arr!37946 _keys!1208) from!1455) (get!19333 (select (arr!37945 _values!996) from!1455) lt!553316))))))

(declare-fun b!1217385 () Bool)

(declare-fun res!808433 () Bool)

(assert (=> b!1217385 (=> (not res!808433) (not e!691147))))

(assert (=> b!1217385 (= res!808433 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38482 _keys!1208))))))

(declare-fun b!1217386 () Bool)

(assert (=> b!1217386 (= e!691142 tp_is_empty!30925)))

(declare-fun b!1217387 () Bool)

(assert (=> b!1217387 (= e!691141 e!691144)))

(declare-fun res!808432 () Bool)

(assert (=> b!1217387 (=> res!808432 e!691144)))

(assert (=> b!1217387 (= res!808432 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1217387 (= lt!553309 (getCurrentListMapNoExtraKeys!5404 lt!553310 lt!553313 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1217387 (= lt!553313 (array!78624 (store (arr!37945 _values!996) i!673 (ValueCellFull!14753 lt!553316)) (size!38481 _values!996)))))

(declare-fun dynLambda!3290 (Int (_ BitVec 64)) V!46361)

(assert (=> b!1217387 (= lt!553316 (dynLambda!3290 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553315 () ListLongMap!17923)

(assert (=> b!1217387 (= lt!553315 (getCurrentListMapNoExtraKeys!5404 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217388 () Bool)

(assert (=> b!1217388 (= e!691143 (and e!691146 mapRes!48265))))

(declare-fun condMapEmpty!48265 () Bool)

(declare-fun mapDefault!48265 () ValueCell!14753)

