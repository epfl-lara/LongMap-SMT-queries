; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101278 () Bool)

(assert start!101278)

(declare-fun b_free!26201 () Bool)

(declare-fun b_next!26201 () Bool)

(assert (=> start!101278 (= b_free!26201 (not b_next!26201))))

(declare-fun tp!91624 () Bool)

(declare-fun b_and!43519 () Bool)

(assert (=> start!101278 (= tp!91624 b_and!43519)))

(declare-fun mapIsEmpty!48232 () Bool)

(declare-fun mapRes!48232 () Bool)

(assert (=> mapIsEmpty!48232 mapRes!48232))

(declare-fun b!1216730 () Bool)

(declare-fun e!690777 () Bool)

(declare-fun e!690780 () Bool)

(assert (=> b!1216730 (= e!690777 e!690780)))

(declare-fun res!807984 () Bool)

(assert (=> b!1216730 (=> res!807984 e!690780)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216730 (= res!807984 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((array!78581 0))(
  ( (array!78582 (arr!37925 (Array (_ BitVec 32) (_ BitVec 64))) (size!38461 (_ BitVec 32))) )
))
(declare-fun lt!553012 () array!78581)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!46333 0))(
  ( (V!46334 (val!15509 Int)) )
))
(declare-datatypes ((ValueCell!14743 0))(
  ( (ValueCellFull!14743 (v!18162 V!46333)) (EmptyCell!14743) )
))
(declare-datatypes ((array!78583 0))(
  ( (array!78584 (arr!37926 (Array (_ BitVec 32) ValueCell!14743)) (size!38462 (_ BitVec 32))) )
))
(declare-fun lt!553011 () array!78583)

(declare-fun minValue!944 () V!46333)

(declare-datatypes ((tuple2!19934 0))(
  ( (tuple2!19935 (_1!9978 (_ BitVec 64)) (_2!9978 V!46333)) )
))
(declare-datatypes ((List!26739 0))(
  ( (Nil!26736) (Cons!26735 (h!27944 tuple2!19934) (t!39920 List!26739)) )
))
(declare-datatypes ((ListLongMap!17903 0))(
  ( (ListLongMap!17904 (toList!8967 List!26739)) )
))
(declare-fun lt!553013 () ListLongMap!17903)

(declare-fun zeroValue!944 () V!46333)

(declare-fun getCurrentListMapNoExtraKeys!5394 (array!78581 array!78583 (_ BitVec 32) (_ BitVec 32) V!46333 V!46333 (_ BitVec 32) Int) ListLongMap!17903)

(assert (=> b!1216730 (= lt!553013 (getCurrentListMapNoExtraKeys!5394 lt!553012 lt!553011 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78583)

(declare-fun dynLambda!3283 (Int (_ BitVec 64)) V!46333)

(assert (=> b!1216730 (= lt!553011 (array!78584 (store (arr!37926 _values!996) i!673 (ValueCellFull!14743 (dynLambda!3283 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38462 _values!996)))))

(declare-fun _keys!1208 () array!78581)

(declare-fun lt!553014 () ListLongMap!17903)

(assert (=> b!1216730 (= lt!553014 (getCurrentListMapNoExtraKeys!5394 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1216731 () Bool)

(declare-fun res!807986 () Bool)

(declare-fun e!690782 () Bool)

(assert (=> b!1216731 (=> (not res!807986) (not e!690782))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216731 (= res!807986 (validKeyInArray!0 k!934))))

(declare-fun b!1216732 () Bool)

(declare-fun e!690783 () Bool)

(declare-fun tp_is_empty!30905 () Bool)

(assert (=> b!1216732 (= e!690783 tp_is_empty!30905)))

(declare-fun b!1216733 () Bool)

(declare-fun e!690778 () Bool)

(assert (=> b!1216733 (= e!690778 (and e!690783 mapRes!48232))))

(declare-fun condMapEmpty!48232 () Bool)

(declare-fun mapDefault!48232 () ValueCell!14743)

