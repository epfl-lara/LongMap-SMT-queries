; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73700 () Bool)

(assert start!73700)

(declare-fun b_free!14615 () Bool)

(declare-fun b_next!14615 () Bool)

(assert (=> start!73700 (= b_free!14615 (not b_next!14615))))

(declare-fun tp!51348 () Bool)

(declare-fun b_and!24209 () Bool)

(assert (=> start!73700 (= tp!51348 b_and!24209)))

(declare-fun b!863625 () Bool)

(declare-datatypes ((Unit!29527 0))(
  ( (Unit!29528) )
))
(declare-fun e!481133 () Unit!29527)

(declare-fun Unit!29529 () Unit!29527)

(assert (=> b!863625 (= e!481133 Unit!29529)))

(declare-fun b!863626 () Bool)

(declare-fun res!586851 () Bool)

(declare-fun e!481134 () Bool)

(assert (=> b!863626 (=> (not res!586851) (not e!481134))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49664 0))(
  ( (array!49665 (arr!23863 (Array (_ BitVec 32) (_ BitVec 64))) (size!24303 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49664)

(declare-datatypes ((V!27381 0))(
  ( (V!27382 (val!8423 Int)) )
))
(declare-datatypes ((ValueCell!7936 0))(
  ( (ValueCellFull!7936 (v!10848 V!27381)) (EmptyCell!7936) )
))
(declare-datatypes ((array!49666 0))(
  ( (array!49667 (arr!23864 (Array (_ BitVec 32) ValueCell!7936)) (size!24304 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49666)

(assert (=> b!863626 (= res!586851 (and (= (size!24304 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24303 _keys!868) (size!24304 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863627 () Bool)

(declare-fun e!481128 () Bool)

(declare-fun e!481132 () Bool)

(assert (=> b!863627 (= e!481128 (not e!481132))))

(declare-fun res!586856 () Bool)

(assert (=> b!863627 (=> res!586856 e!481132)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863627 (= res!586856 (not (validKeyInArray!0 (select (arr!23863 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11150 0))(
  ( (tuple2!11151 (_1!5586 (_ BitVec 64)) (_2!5586 V!27381)) )
))
(declare-datatypes ((List!16957 0))(
  ( (Nil!16954) (Cons!16953 (h!18084 tuple2!11150) (t!23838 List!16957)) )
))
(declare-datatypes ((ListLongMap!9919 0))(
  ( (ListLongMap!9920 (toList!4975 List!16957)) )
))
(declare-fun lt!390420 () ListLongMap!9919)

(declare-fun lt!390412 () ListLongMap!9919)

(assert (=> b!863627 (= lt!390420 lt!390412)))

(declare-fun lt!390409 () ListLongMap!9919)

(declare-fun lt!390417 () tuple2!11150)

(declare-fun +!2324 (ListLongMap!9919 tuple2!11150) ListLongMap!9919)

(assert (=> b!863627 (= lt!390412 (+!2324 lt!390409 lt!390417))))

(declare-fun lt!390413 () array!49666)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27381)

(declare-fun zeroValue!654 () V!27381)

(declare-fun getCurrentListMapNoExtraKeys!2950 (array!49664 array!49666 (_ BitVec 32) (_ BitVec 32) V!27381 V!27381 (_ BitVec 32) Int) ListLongMap!9919)

(assert (=> b!863627 (= lt!390420 (getCurrentListMapNoExtraKeys!2950 _keys!868 lt!390413 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!27381)

(assert (=> b!863627 (= lt!390417 (tuple2!11151 k!854 v!557))))

(assert (=> b!863627 (= lt!390409 (getCurrentListMapNoExtraKeys!2950 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390418 () Unit!29527)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!531 (array!49664 array!49666 (_ BitVec 32) (_ BitVec 32) V!27381 V!27381 (_ BitVec 32) (_ BitVec 64) V!27381 (_ BitVec 32) Int) Unit!29527)

(assert (=> b!863627 (= lt!390418 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!531 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863628 () Bool)

(declare-fun res!586855 () Bool)

(assert (=> b!863628 (=> (not res!586855) (not e!481134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863628 (= res!586855 (validMask!0 mask!1196))))

(declare-fun b!863629 () Bool)

(declare-fun res!586850 () Bool)

(assert (=> b!863629 (=> (not res!586850) (not e!481134))))

(assert (=> b!863629 (= res!586850 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24303 _keys!868))))))

(declare-fun b!863630 () Bool)

(declare-fun e!481127 () Bool)

(declare-fun tp_is_empty!16751 () Bool)

(assert (=> b!863630 (= e!481127 tp_is_empty!16751)))

(declare-fun mapNonEmpty!26726 () Bool)

(declare-fun mapRes!26726 () Bool)

(declare-fun tp!51349 () Bool)

(assert (=> mapNonEmpty!26726 (= mapRes!26726 (and tp!51349 e!481127))))

(declare-fun mapKey!26726 () (_ BitVec 32))

(declare-fun mapValue!26726 () ValueCell!7936)

(declare-fun mapRest!26726 () (Array (_ BitVec 32) ValueCell!7936))

(assert (=> mapNonEmpty!26726 (= (arr!23864 _values!688) (store mapRest!26726 mapKey!26726 mapValue!26726))))

(declare-fun b!863631 () Bool)

(declare-fun res!586849 () Bool)

(assert (=> b!863631 (=> (not res!586849) (not e!481134))))

(assert (=> b!863631 (= res!586849 (validKeyInArray!0 k!854))))

(declare-fun b!863632 () Bool)

(assert (=> b!863632 (= e!481134 e!481128)))

(declare-fun res!586852 () Bool)

(assert (=> b!863632 (=> (not res!586852) (not e!481128))))

(assert (=> b!863632 (= res!586852 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!390410 () ListLongMap!9919)

(assert (=> b!863632 (= lt!390410 (getCurrentListMapNoExtraKeys!2950 _keys!868 lt!390413 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!863632 (= lt!390413 (array!49667 (store (arr!23864 _values!688) i!612 (ValueCellFull!7936 v!557)) (size!24304 _values!688)))))

(declare-fun lt!390421 () ListLongMap!9919)

(assert (=> b!863632 (= lt!390421 (getCurrentListMapNoExtraKeys!2950 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863633 () Bool)

(declare-fun res!586847 () Bool)

(assert (=> b!863633 (=> (not res!586847) (not e!481134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49664 (_ BitVec 32)) Bool)

(assert (=> b!863633 (= res!586847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863634 () Bool)

(declare-fun e!481130 () Bool)

(assert (=> b!863634 (= e!481130 true)))

(declare-fun lt!390423 () ListLongMap!9919)

(declare-fun lt!390424 () tuple2!11150)

(assert (=> b!863634 (= lt!390423 (+!2324 (+!2324 lt!390409 lt!390424) lt!390417))))

(declare-fun lt!390419 () V!27381)

(declare-fun lt!390415 () Unit!29527)

(declare-fun addCommutativeForDiffKeys!497 (ListLongMap!9919 (_ BitVec 64) V!27381 (_ BitVec 64) V!27381) Unit!29527)

(assert (=> b!863634 (= lt!390415 (addCommutativeForDiffKeys!497 lt!390409 k!854 v!557 (select (arr!23863 _keys!868) from!1053) lt!390419))))

(declare-fun b!863635 () Bool)

(declare-fun e!481131 () Bool)

(declare-fun e!481135 () Bool)

(assert (=> b!863635 (= e!481131 (and e!481135 mapRes!26726))))

(declare-fun condMapEmpty!26726 () Bool)

(declare-fun mapDefault!26726 () ValueCell!7936)

