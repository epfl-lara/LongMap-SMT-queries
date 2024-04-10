; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72938 () Bool)

(assert start!72938)

(declare-fun b_free!13853 () Bool)

(declare-fun b_next!13853 () Bool)

(assert (=> start!72938 (= b_free!13853 (not b_next!13853))))

(declare-fun tp!49063 () Bool)

(declare-fun b_and!22939 () Bool)

(assert (=> start!72938 (= tp!49063 b_and!22939)))

(declare-fun b!846958 () Bool)

(declare-fun res!575450 () Bool)

(declare-fun e!472655 () Bool)

(assert (=> b!846958 (=> (not res!575450) (not e!472655))))

(declare-datatypes ((array!48190 0))(
  ( (array!48191 (arr!23126 (Array (_ BitVec 32) (_ BitVec 64))) (size!23566 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48190)

(declare-datatypes ((List!16362 0))(
  ( (Nil!16359) (Cons!16358 (h!17489 (_ BitVec 64)) (t!22733 List!16362)) )
))
(declare-fun arrayNoDuplicates!0 (array!48190 (_ BitVec 32) List!16362) Bool)

(assert (=> b!846958 (= res!575450 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16359))))

(declare-fun mapIsEmpty!25583 () Bool)

(declare-fun mapRes!25583 () Bool)

(assert (=> mapIsEmpty!25583 mapRes!25583))

(declare-fun b!846959 () Bool)

(declare-fun res!575451 () Bool)

(assert (=> b!846959 (=> (not res!575451) (not e!472655))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48190 (_ BitVec 32)) Bool)

(assert (=> b!846959 (= res!575451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!575452 () Bool)

(assert (=> start!72938 (=> (not res!575452) (not e!472655))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72938 (= res!575452 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23566 _keys!868))))))

(assert (=> start!72938 e!472655))

(declare-fun tp_is_empty!15989 () Bool)

(assert (=> start!72938 tp_is_empty!15989))

(assert (=> start!72938 true))

(assert (=> start!72938 tp!49063))

(declare-fun array_inv!18366 (array!48190) Bool)

(assert (=> start!72938 (array_inv!18366 _keys!868)))

(declare-datatypes ((V!26365 0))(
  ( (V!26366 (val!8042 Int)) )
))
(declare-datatypes ((ValueCell!7555 0))(
  ( (ValueCellFull!7555 (v!10467 V!26365)) (EmptyCell!7555) )
))
(declare-datatypes ((array!48192 0))(
  ( (array!48193 (arr!23127 (Array (_ BitVec 32) ValueCell!7555)) (size!23567 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48192)

(declare-fun e!472653 () Bool)

(declare-fun array_inv!18367 (array!48192) Bool)

(assert (=> start!72938 (and (array_inv!18367 _values!688) e!472653)))

(declare-fun b!846960 () Bool)

(declare-fun res!575449 () Bool)

(assert (=> b!846960 (=> (not res!575449) (not e!472655))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!846960 (= res!575449 (validKeyInArray!0 k!854))))

(declare-fun b!846961 () Bool)

(assert (=> b!846961 (= e!472655 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26365)

(declare-fun zeroValue!654 () V!26365)

(declare-fun v!557 () V!26365)

(declare-datatypes ((tuple2!10500 0))(
  ( (tuple2!10501 (_1!5261 (_ BitVec 64)) (_2!5261 V!26365)) )
))
(declare-datatypes ((List!16363 0))(
  ( (Nil!16360) (Cons!16359 (h!17490 tuple2!10500) (t!22734 List!16363)) )
))
(declare-datatypes ((ListLongMap!9269 0))(
  ( (ListLongMap!9270 (toList!4650 List!16363)) )
))
(declare-fun lt!381631 () ListLongMap!9269)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2635 (array!48190 array!48192 (_ BitVec 32) (_ BitVec 32) V!26365 V!26365 (_ BitVec 32) Int) ListLongMap!9269)

(assert (=> b!846961 (= lt!381631 (getCurrentListMapNoExtraKeys!2635 _keys!868 (array!48193 (store (arr!23127 _values!688) i!612 (ValueCellFull!7555 v!557)) (size!23567 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381630 () ListLongMap!9269)

(assert (=> b!846961 (= lt!381630 (getCurrentListMapNoExtraKeys!2635 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25583 () Bool)

(declare-fun tp!49062 () Bool)

(declare-fun e!472654 () Bool)

(assert (=> mapNonEmpty!25583 (= mapRes!25583 (and tp!49062 e!472654))))

(declare-fun mapRest!25583 () (Array (_ BitVec 32) ValueCell!7555))

(declare-fun mapValue!25583 () ValueCell!7555)

(declare-fun mapKey!25583 () (_ BitVec 32))

(assert (=> mapNonEmpty!25583 (= (arr!23127 _values!688) (store mapRest!25583 mapKey!25583 mapValue!25583))))

(declare-fun b!846962 () Bool)

(declare-fun res!575448 () Bool)

(assert (=> b!846962 (=> (not res!575448) (not e!472655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846962 (= res!575448 (validMask!0 mask!1196))))

(declare-fun b!846963 () Bool)

(declare-fun e!472657 () Bool)

(assert (=> b!846963 (= e!472657 tp_is_empty!15989)))

(declare-fun b!846964 () Bool)

(assert (=> b!846964 (= e!472653 (and e!472657 mapRes!25583))))

(declare-fun condMapEmpty!25583 () Bool)

(declare-fun mapDefault!25583 () ValueCell!7555)

