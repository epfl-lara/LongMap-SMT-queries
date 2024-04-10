; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101330 () Bool)

(assert start!101330)

(declare-fun b_free!26227 () Bool)

(declare-fun b_next!26227 () Bool)

(assert (=> start!101330 (= b_free!26227 (not b_next!26227))))

(declare-fun tp!91705 () Bool)

(declare-fun b_and!43589 () Bool)

(assert (=> start!101330 (= tp!91705 b_and!43589)))

(declare-fun b!1217525 () Bool)

(declare-fun e!691231 () Bool)

(declare-fun e!691232 () Bool)

(assert (=> b!1217525 (= e!691231 e!691232)))

(declare-fun res!808551 () Bool)

(assert (=> b!1217525 (=> res!808551 e!691232)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1217525 (= res!808551 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46369 0))(
  ( (V!46370 (val!15522 Int)) )
))
(declare-fun zeroValue!944 () V!46369)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!78635 0))(
  ( (array!78636 (arr!37951 (Array (_ BitVec 32) (_ BitVec 64))) (size!38487 (_ BitVec 32))) )
))
(declare-fun lt!553405 () array!78635)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14756 0))(
  ( (ValueCellFull!14756 (v!18176 V!46369)) (EmptyCell!14756) )
))
(declare-datatypes ((array!78637 0))(
  ( (array!78638 (arr!37952 (Array (_ BitVec 32) ValueCell!14756)) (size!38488 (_ BitVec 32))) )
))
(declare-fun lt!553400 () array!78637)

(declare-fun minValue!944 () V!46369)

(declare-datatypes ((tuple2!19960 0))(
  ( (tuple2!19961 (_1!9991 (_ BitVec 64)) (_2!9991 V!46369)) )
))
(declare-datatypes ((List!26764 0))(
  ( (Nil!26761) (Cons!26760 (h!27969 tuple2!19960) (t!39971 List!26764)) )
))
(declare-datatypes ((ListLongMap!17929 0))(
  ( (ListLongMap!17930 (toList!8980 List!26764)) )
))
(declare-fun lt!553407 () ListLongMap!17929)

(declare-fun getCurrentListMapNoExtraKeys!5407 (array!78635 array!78637 (_ BitVec 32) (_ BitVec 32) V!46369 V!46369 (_ BitVec 32) Int) ListLongMap!17929)

(assert (=> b!1217525 (= lt!553407 (getCurrentListMapNoExtraKeys!5407 lt!553405 lt!553400 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78637)

(declare-fun lt!553401 () V!46369)

(assert (=> b!1217525 (= lt!553400 (array!78638 (store (arr!37952 _values!996) i!673 (ValueCellFull!14756 lt!553401)) (size!38488 _values!996)))))

(declare-fun dynLambda!3293 (Int (_ BitVec 64)) V!46369)

(assert (=> b!1217525 (= lt!553401 (dynLambda!3293 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!78635)

(declare-fun lt!553402 () ListLongMap!17929)

(assert (=> b!1217525 (= lt!553402 (getCurrentListMapNoExtraKeys!5407 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1217526 () Bool)

(declare-fun e!691226 () Bool)

(declare-fun tp_is_empty!30931 () Bool)

(assert (=> b!1217526 (= e!691226 tp_is_empty!30931)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1217527 () Bool)

(declare-fun e!691223 () Bool)

(declare-fun arrayContainsKey!0 (array!78635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1217527 (= e!691223 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1217528 () Bool)

(declare-fun res!808554 () Bool)

(declare-fun e!691229 () Bool)

(assert (=> b!1217528 (=> (not res!808554) (not e!691229))))

(assert (=> b!1217528 (= res!808554 (= (select (arr!37951 _keys!1208) i!673) k!934))))

(declare-fun b!1217529 () Bool)

(declare-fun e!691225 () Bool)

(assert (=> b!1217529 (= e!691225 tp_is_empty!30931)))

(declare-fun b!1217530 () Bool)

(declare-fun res!808553 () Bool)

(assert (=> b!1217530 (=> (not res!808553) (not e!691229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78635 (_ BitVec 32)) Bool)

(assert (=> b!1217530 (= res!808553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1217531 () Bool)

(declare-fun res!808550 () Bool)

(assert (=> b!1217531 (=> (not res!808550) (not e!691229))))

(declare-datatypes ((List!26765 0))(
  ( (Nil!26762) (Cons!26761 (h!27970 (_ BitVec 64)) (t!39972 List!26765)) )
))
(declare-fun arrayNoDuplicates!0 (array!78635 (_ BitVec 32) List!26765) Bool)

(assert (=> b!1217531 (= res!808550 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26762))))

(declare-fun b!1217532 () Bool)

(declare-fun e!691230 () Bool)

(assert (=> b!1217532 (= e!691230 e!691223)))

(declare-fun res!808549 () Bool)

(assert (=> b!1217532 (=> res!808549 e!691223)))

(assert (=> b!1217532 (= res!808549 (not (= (select (arr!37951 _keys!1208) from!1455) k!934)))))

(declare-fun lt!553406 () ListLongMap!17929)

(declare-fun +!4053 (ListLongMap!17929 tuple2!19960) ListLongMap!17929)

(declare-fun get!19338 (ValueCell!14756 V!46369) V!46369)

(assert (=> b!1217532 (= lt!553407 (+!4053 lt!553406 (tuple2!19961 (select (arr!37951 _keys!1208) from!1455) (get!19338 (select (arr!37952 _values!996) from!1455) lt!553401))))))

(declare-fun mapNonEmpty!48274 () Bool)

(declare-fun mapRes!48274 () Bool)

(declare-fun tp!91706 () Bool)

(assert (=> mapNonEmpty!48274 (= mapRes!48274 (and tp!91706 e!691226))))

(declare-fun mapKey!48274 () (_ BitVec 32))

(declare-fun mapValue!48274 () ValueCell!14756)

(declare-fun mapRest!48274 () (Array (_ BitVec 32) ValueCell!14756))

(assert (=> mapNonEmpty!48274 (= (arr!37952 _values!996) (store mapRest!48274 mapKey!48274 mapValue!48274))))

(declare-fun b!1217533 () Bool)

(declare-fun res!808559 () Bool)

(assert (=> b!1217533 (=> (not res!808559) (not e!691229))))

(assert (=> b!1217533 (= res!808559 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38487 _keys!1208))))))

(declare-fun b!1217534 () Bool)

(declare-fun e!691227 () Bool)

(assert (=> b!1217534 (= e!691227 (and e!691225 mapRes!48274))))

(declare-fun condMapEmpty!48274 () Bool)

(declare-fun mapDefault!48274 () ValueCell!14756)

