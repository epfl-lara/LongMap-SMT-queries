; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74060 () Bool)

(assert start!74060)

(declare-fun b_free!14975 () Bool)

(declare-fun b_next!14975 () Bool)

(assert (=> start!74060 (= b_free!14975 (not b_next!14975))))

(declare-fun tp!52428 () Bool)

(declare-fun b_and!24727 () Bool)

(assert (=> start!74060 (= tp!52428 b_and!24727)))

(declare-fun b!871203 () Bool)

(declare-fun res!592176 () Bool)

(declare-fun e!485076 () Bool)

(assert (=> b!871203 (=> (not res!592176) (not e!485076))))

(declare-datatypes ((array!50362 0))(
  ( (array!50363 (arr!24212 (Array (_ BitVec 32) (_ BitVec 64))) (size!24652 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50362)

(declare-datatypes ((List!17219 0))(
  ( (Nil!17216) (Cons!17215 (h!18346 (_ BitVec 64)) (t!24256 List!17219)) )
))
(declare-fun arrayNoDuplicates!0 (array!50362 (_ BitVec 32) List!17219) Bool)

(assert (=> b!871203 (= res!592176 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17216))))

(declare-fun b!871204 () Bool)

(declare-fun e!485077 () Bool)

(assert (=> b!871204 (= e!485077 (not true))))

(declare-datatypes ((V!27861 0))(
  ( (V!27862 (val!8603 Int)) )
))
(declare-fun v!557 () V!27861)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8116 0))(
  ( (ValueCellFull!8116 (v!11028 V!27861)) (EmptyCell!8116) )
))
(declare-datatypes ((array!50364 0))(
  ( (array!50365 (arr!24213 (Array (_ BitVec 32) ValueCell!8116)) (size!24653 (_ BitVec 32))) )
))
(declare-fun lt!395390 () array!50364)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun _values!688 () array!50364)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27861)

(declare-fun zeroValue!654 () V!27861)

(declare-datatypes ((tuple2!11432 0))(
  ( (tuple2!11433 (_1!5727 (_ BitVec 64)) (_2!5727 V!27861)) )
))
(declare-datatypes ((List!17220 0))(
  ( (Nil!17217) (Cons!17216 (h!18347 tuple2!11432) (t!24257 List!17220)) )
))
(declare-datatypes ((ListLongMap!10201 0))(
  ( (ListLongMap!10202 (toList!5116 List!17220)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3085 (array!50362 array!50364 (_ BitVec 32) (_ BitVec 32) V!27861 V!27861 (_ BitVec 32) Int) ListLongMap!10201)

(declare-fun +!2451 (ListLongMap!10201 tuple2!11432) ListLongMap!10201)

(assert (=> b!871204 (= (getCurrentListMapNoExtraKeys!3085 _keys!868 lt!395390 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2451 (getCurrentListMapNoExtraKeys!3085 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11433 k!854 v!557)))))

(declare-datatypes ((Unit!29900 0))(
  ( (Unit!29901) )
))
(declare-fun lt!395392 () Unit!29900)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!645 (array!50362 array!50364 (_ BitVec 32) (_ BitVec 32) V!27861 V!27861 (_ BitVec 32) (_ BitVec 64) V!27861 (_ BitVec 32) Int) Unit!29900)

(assert (=> b!871204 (= lt!395392 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!645 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27266 () Bool)

(declare-fun mapRes!27266 () Bool)

(declare-fun tp!52429 () Bool)

(declare-fun e!485075 () Bool)

(assert (=> mapNonEmpty!27266 (= mapRes!27266 (and tp!52429 e!485075))))

(declare-fun mapKey!27266 () (_ BitVec 32))

(declare-fun mapValue!27266 () ValueCell!8116)

(declare-fun mapRest!27266 () (Array (_ BitVec 32) ValueCell!8116))

(assert (=> mapNonEmpty!27266 (= (arr!24213 _values!688) (store mapRest!27266 mapKey!27266 mapValue!27266))))

(declare-fun res!592184 () Bool)

(assert (=> start!74060 (=> (not res!592184) (not e!485076))))

(assert (=> start!74060 (= res!592184 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24652 _keys!868))))))

(assert (=> start!74060 e!485076))

(declare-fun tp_is_empty!17111 () Bool)

(assert (=> start!74060 tp_is_empty!17111))

(assert (=> start!74060 true))

(assert (=> start!74060 tp!52428))

(declare-fun array_inv!19118 (array!50362) Bool)

(assert (=> start!74060 (array_inv!19118 _keys!868)))

(declare-fun e!485074 () Bool)

(declare-fun array_inv!19119 (array!50364) Bool)

(assert (=> start!74060 (and (array_inv!19119 _values!688) e!485074)))

(declare-fun b!871205 () Bool)

(assert (=> b!871205 (= e!485075 tp_is_empty!17111)))

(declare-fun b!871206 () Bool)

(declare-fun res!592183 () Bool)

(assert (=> b!871206 (=> (not res!592183) (not e!485076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871206 (= res!592183 (validMask!0 mask!1196))))

(declare-fun b!871207 () Bool)

(declare-fun res!592177 () Bool)

(assert (=> b!871207 (=> (not res!592177) (not e!485076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871207 (= res!592177 (validKeyInArray!0 k!854))))

(declare-fun b!871208 () Bool)

(declare-fun res!592180 () Bool)

(assert (=> b!871208 (=> (not res!592180) (not e!485076))))

(assert (=> b!871208 (= res!592180 (and (= (select (arr!24212 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27266 () Bool)

(assert (=> mapIsEmpty!27266 mapRes!27266))

(declare-fun b!871209 () Bool)

(assert (=> b!871209 (= e!485076 e!485077)))

(declare-fun res!592182 () Bool)

(assert (=> b!871209 (=> (not res!592182) (not e!485077))))

(assert (=> b!871209 (= res!592182 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395391 () ListLongMap!10201)

(assert (=> b!871209 (= lt!395391 (getCurrentListMapNoExtraKeys!3085 _keys!868 lt!395390 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871209 (= lt!395390 (array!50365 (store (arr!24213 _values!688) i!612 (ValueCellFull!8116 v!557)) (size!24653 _values!688)))))

(declare-fun lt!395389 () ListLongMap!10201)

(assert (=> b!871209 (= lt!395389 (getCurrentListMapNoExtraKeys!3085 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871210 () Bool)

(declare-fun res!592179 () Bool)

(assert (=> b!871210 (=> (not res!592179) (not e!485076))))

(assert (=> b!871210 (= res!592179 (and (= (size!24653 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24652 _keys!868) (size!24653 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871211 () Bool)

(declare-fun e!485072 () Bool)

(assert (=> b!871211 (= e!485072 tp_is_empty!17111)))

(declare-fun b!871212 () Bool)

(declare-fun res!592178 () Bool)

(assert (=> b!871212 (=> (not res!592178) (not e!485076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50362 (_ BitVec 32)) Bool)

(assert (=> b!871212 (= res!592178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871213 () Bool)

(declare-fun res!592181 () Bool)

(assert (=> b!871213 (=> (not res!592181) (not e!485076))))

(assert (=> b!871213 (= res!592181 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24652 _keys!868))))))

(declare-fun b!871214 () Bool)

(assert (=> b!871214 (= e!485074 (and e!485072 mapRes!27266))))

(declare-fun condMapEmpty!27266 () Bool)

(declare-fun mapDefault!27266 () ValueCell!8116)

