; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73792 () Bool)

(assert start!73792)

(declare-fun b_free!14707 () Bool)

(declare-fun b_next!14707 () Bool)

(assert (=> start!73792 (= b_free!14707 (not b_next!14707))))

(declare-fun tp!51625 () Bool)

(declare-fun b_and!24393 () Bool)

(assert (=> start!73792 (= tp!51625 b_and!24393)))

(declare-fun b!865925 () Bool)

(declare-datatypes ((Unit!29671 0))(
  ( (Unit!29672) )
))
(declare-fun e!482369 () Unit!29671)

(declare-fun Unit!29673 () Unit!29671)

(assert (=> b!865925 (= e!482369 Unit!29673)))

(declare-fun b!865926 () Bool)

(declare-fun res!588367 () Bool)

(declare-fun e!482370 () Bool)

(assert (=> b!865926 (=> (not res!588367) (not e!482370))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49846 0))(
  ( (array!49847 (arr!23954 (Array (_ BitVec 32) (_ BitVec 64))) (size!24394 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49846)

(declare-datatypes ((V!27505 0))(
  ( (V!27506 (val!8469 Int)) )
))
(declare-datatypes ((ValueCell!7982 0))(
  ( (ValueCellFull!7982 (v!10894 V!27505)) (EmptyCell!7982) )
))
(declare-datatypes ((array!49848 0))(
  ( (array!49849 (arr!23955 (Array (_ BitVec 32) ValueCell!7982)) (size!24395 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49848)

(assert (=> b!865926 (= res!588367 (and (= (size!24395 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24394 _keys!868) (size!24395 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865927 () Bool)

(declare-fun e!482376 () Bool)

(declare-fun e!482377 () Bool)

(assert (=> b!865927 (= e!482376 (not e!482377))))

(declare-fun res!588369 () Bool)

(assert (=> b!865927 (=> res!588369 e!482377)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865927 (= res!588369 (not (validKeyInArray!0 (select (arr!23954 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11228 0))(
  ( (tuple2!11229 (_1!5625 (_ BitVec 64)) (_2!5625 V!27505)) )
))
(declare-datatypes ((List!17030 0))(
  ( (Nil!17027) (Cons!17026 (h!18157 tuple2!11228) (t!24003 List!17030)) )
))
(declare-datatypes ((ListLongMap!9997 0))(
  ( (ListLongMap!9998 (toList!5014 List!17030)) )
))
(declare-fun lt!392627 () ListLongMap!9997)

(declare-fun lt!392623 () ListLongMap!9997)

(assert (=> b!865927 (= lt!392627 lt!392623)))

(declare-fun lt!392622 () ListLongMap!9997)

(declare-fun lt!392626 () tuple2!11228)

(declare-fun +!2362 (ListLongMap!9997 tuple2!11228) ListLongMap!9997)

(assert (=> b!865927 (= lt!392623 (+!2362 lt!392622 lt!392626))))

(declare-fun lt!392630 () array!49848)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27505)

(declare-fun zeroValue!654 () V!27505)

(declare-fun getCurrentListMapNoExtraKeys!2985 (array!49846 array!49848 (_ BitVec 32) (_ BitVec 32) V!27505 V!27505 (_ BitVec 32) Int) ListLongMap!9997)

(assert (=> b!865927 (= lt!392627 (getCurrentListMapNoExtraKeys!2985 _keys!868 lt!392630 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!27505)

(assert (=> b!865927 (= lt!392626 (tuple2!11229 k!854 v!557))))

(assert (=> b!865927 (= lt!392622 (getCurrentListMapNoExtraKeys!2985 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!392631 () Unit!29671)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!561 (array!49846 array!49848 (_ BitVec 32) (_ BitVec 32) V!27505 V!27505 (_ BitVec 32) (_ BitVec 64) V!27505 (_ BitVec 32) Int) Unit!29671)

(assert (=> b!865927 (= lt!392631 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!561 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865928 () Bool)

(declare-fun e!482374 () Bool)

(assert (=> b!865928 (= e!482377 e!482374)))

(declare-fun res!588368 () Bool)

(assert (=> b!865928 (=> res!588368 e!482374)))

(assert (=> b!865928 (= res!588368 (= k!854 (select (arr!23954 _keys!868) from!1053)))))

(assert (=> b!865928 (not (= (select (arr!23954 _keys!868) from!1053) k!854))))

(declare-fun lt!392628 () Unit!29671)

(assert (=> b!865928 (= lt!392628 e!482369)))

(declare-fun c!92281 () Bool)

(assert (=> b!865928 (= c!92281 (= (select (arr!23954 _keys!868) from!1053) k!854))))

(declare-fun lt!392620 () ListLongMap!9997)

(declare-fun lt!392619 () ListLongMap!9997)

(assert (=> b!865928 (= lt!392620 lt!392619)))

(declare-fun lt!392632 () tuple2!11228)

(assert (=> b!865928 (= lt!392619 (+!2362 lt!392623 lt!392632))))

(declare-fun lt!392618 () V!27505)

(assert (=> b!865928 (= lt!392632 (tuple2!11229 (select (arr!23954 _keys!868) from!1053) lt!392618))))

(declare-fun get!12663 (ValueCell!7982 V!27505) V!27505)

(declare-fun dynLambda!1183 (Int (_ BitVec 64)) V!27505)

(assert (=> b!865928 (= lt!392618 (get!12663 (select (arr!23955 _values!688) from!1053) (dynLambda!1183 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!26864 () Bool)

(declare-fun mapRes!26864 () Bool)

(declare-fun tp!51624 () Bool)

(declare-fun e!482375 () Bool)

(assert (=> mapNonEmpty!26864 (= mapRes!26864 (and tp!51624 e!482375))))

(declare-fun mapRest!26864 () (Array (_ BitVec 32) ValueCell!7982))

(declare-fun mapKey!26864 () (_ BitVec 32))

(declare-fun mapValue!26864 () ValueCell!7982)

(assert (=> mapNonEmpty!26864 (= (arr!23955 _values!688) (store mapRest!26864 mapKey!26864 mapValue!26864))))

(declare-fun b!865930 () Bool)

(declare-fun res!588365 () Bool)

(assert (=> b!865930 (=> (not res!588365) (not e!482370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865930 (= res!588365 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26864 () Bool)

(assert (=> mapIsEmpty!26864 mapRes!26864))

(declare-fun b!865931 () Bool)

(declare-fun res!588374 () Bool)

(assert (=> b!865931 (=> (not res!588374) (not e!482370))))

(assert (=> b!865931 (= res!588374 (validKeyInArray!0 k!854))))

(declare-fun b!865932 () Bool)

(declare-fun tp_is_empty!16843 () Bool)

(assert (=> b!865932 (= e!482375 tp_is_empty!16843)))

(declare-fun b!865933 () Bool)

(declare-fun e!482373 () Bool)

(declare-fun e!482372 () Bool)

(assert (=> b!865933 (= e!482373 (and e!482372 mapRes!26864))))

(declare-fun condMapEmpty!26864 () Bool)

(declare-fun mapDefault!26864 () ValueCell!7982)

