; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74084 () Bool)

(assert start!74084)

(declare-fun b_free!14993 () Bool)

(declare-fun b_next!14993 () Bool)

(assert (=> start!74084 (= b_free!14993 (not b_next!14993))))

(declare-fun tp!52492 () Bool)

(declare-fun b_and!24745 () Bool)

(assert (=> start!74084 (= tp!52492 b_and!24745)))

(declare-fun b!871606 () Bool)

(declare-fun e!485292 () Bool)

(declare-fun e!485291 () Bool)

(assert (=> b!871606 (= e!485292 e!485291)))

(declare-fun res!592461 () Bool)

(assert (=> b!871606 (=> (not res!592461) (not e!485291))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!871606 (= res!592461 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50408 0))(
  ( (array!50409 (arr!24235 (Array (_ BitVec 32) (_ BitVec 64))) (size!24675 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50408)

(declare-datatypes ((V!27893 0))(
  ( (V!27894 (val!8615 Int)) )
))
(declare-datatypes ((ValueCell!8128 0))(
  ( (ValueCellFull!8128 (v!11040 V!27893)) (EmptyCell!8128) )
))
(declare-datatypes ((array!50410 0))(
  ( (array!50411 (arr!24236 (Array (_ BitVec 32) ValueCell!8128)) (size!24676 (_ BitVec 32))) )
))
(declare-fun lt!395507 () array!50410)

(declare-fun minValue!654 () V!27893)

(declare-fun zeroValue!654 () V!27893)

(declare-datatypes ((tuple2!11446 0))(
  ( (tuple2!11447 (_1!5734 (_ BitVec 64)) (_2!5734 V!27893)) )
))
(declare-datatypes ((List!17234 0))(
  ( (Nil!17231) (Cons!17230 (h!18361 tuple2!11446) (t!24271 List!17234)) )
))
(declare-datatypes ((ListLongMap!10215 0))(
  ( (ListLongMap!10216 (toList!5123 List!17234)) )
))
(declare-fun lt!395509 () ListLongMap!10215)

(declare-fun getCurrentListMapNoExtraKeys!3092 (array!50408 array!50410 (_ BitVec 32) (_ BitVec 32) V!27893 V!27893 (_ BitVec 32) Int) ListLongMap!10215)

(assert (=> b!871606 (= lt!395509 (getCurrentListMapNoExtraKeys!3092 _keys!868 lt!395507 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27893)

(declare-fun _values!688 () array!50410)

(assert (=> b!871606 (= lt!395507 (array!50411 (store (arr!24236 _values!688) i!612 (ValueCellFull!8128 v!557)) (size!24676 _values!688)))))

(declare-fun lt!395508 () ListLongMap!10215)

(assert (=> b!871606 (= lt!395508 (getCurrentListMapNoExtraKeys!3092 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun call!38458 () ListLongMap!10215)

(declare-fun bm!38455 () Bool)

(assert (=> bm!38455 (= call!38458 (getCurrentListMapNoExtraKeys!3092 _keys!868 lt!395507 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!38459 () ListLongMap!10215)

(declare-fun b!871607 () Bool)

(declare-fun e!485289 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2457 (ListLongMap!10215 tuple2!11446) ListLongMap!10215)

(assert (=> b!871607 (= e!485289 (= call!38458 (+!2457 call!38459 (tuple2!11447 k!854 v!557))))))

(declare-fun bm!38456 () Bool)

(assert (=> bm!38456 (= call!38459 (getCurrentListMapNoExtraKeys!3092 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871608 () Bool)

(declare-fun res!592456 () Bool)

(assert (=> b!871608 (=> (not res!592456) (not e!485292))))

(declare-datatypes ((List!17235 0))(
  ( (Nil!17232) (Cons!17231 (h!18362 (_ BitVec 64)) (t!24272 List!17235)) )
))
(declare-fun arrayNoDuplicates!0 (array!50408 (_ BitVec 32) List!17235) Bool)

(assert (=> b!871608 (= res!592456 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17232))))

(declare-fun b!871609 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871609 (= e!485291 (not (validKeyInArray!0 (select (arr!24235 _keys!868) from!1053))))))

(assert (=> b!871609 e!485289))

(declare-fun c!92386 () Bool)

(assert (=> b!871609 (= c!92386 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29912 0))(
  ( (Unit!29913) )
))
(declare-fun lt!395506 () Unit!29912)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!651 (array!50408 array!50410 (_ BitVec 32) (_ BitVec 32) V!27893 V!27893 (_ BitVec 32) (_ BitVec 64) V!27893 (_ BitVec 32) Int) Unit!29912)

(assert (=> b!871609 (= lt!395506 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!651 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871610 () Bool)

(declare-fun res!592460 () Bool)

(assert (=> b!871610 (=> (not res!592460) (not e!485292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50408 (_ BitVec 32)) Bool)

(assert (=> b!871610 (= res!592460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871611 () Bool)

(declare-fun res!592455 () Bool)

(assert (=> b!871611 (=> (not res!592455) (not e!485292))))

(assert (=> b!871611 (= res!592455 (and (= (select (arr!24235 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27302 () Bool)

(declare-fun mapRes!27302 () Bool)

(declare-fun tp!52491 () Bool)

(declare-fun e!485290 () Bool)

(assert (=> mapNonEmpty!27302 (= mapRes!27302 (and tp!52491 e!485290))))

(declare-fun mapValue!27302 () ValueCell!8128)

(declare-fun mapKey!27302 () (_ BitVec 32))

(declare-fun mapRest!27302 () (Array (_ BitVec 32) ValueCell!8128))

(assert (=> mapNonEmpty!27302 (= (arr!24236 _values!688) (store mapRest!27302 mapKey!27302 mapValue!27302))))

(declare-fun b!871613 () Bool)

(declare-fun res!592457 () Bool)

(assert (=> b!871613 (=> (not res!592457) (not e!485292))))

(assert (=> b!871613 (= res!592457 (validKeyInArray!0 k!854))))

(declare-fun b!871614 () Bool)

(declare-fun tp_is_empty!17135 () Bool)

(assert (=> b!871614 (= e!485290 tp_is_empty!17135)))

(declare-fun b!871615 () Bool)

(declare-fun res!592458 () Bool)

(assert (=> b!871615 (=> (not res!592458) (not e!485292))))

(assert (=> b!871615 (= res!592458 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24675 _keys!868))))))

(declare-fun b!871616 () Bool)

(declare-fun e!485293 () Bool)

(assert (=> b!871616 (= e!485293 tp_is_empty!17135)))

(declare-fun b!871617 () Bool)

(declare-fun res!592462 () Bool)

(assert (=> b!871617 (=> (not res!592462) (not e!485292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871617 (= res!592462 (validMask!0 mask!1196))))

(declare-fun b!871618 () Bool)

(declare-fun e!485287 () Bool)

(assert (=> b!871618 (= e!485287 (and e!485293 mapRes!27302))))

(declare-fun condMapEmpty!27302 () Bool)

(declare-fun mapDefault!27302 () ValueCell!8128)

