; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73388 () Bool)

(assert start!73388)

(declare-fun b_free!14303 () Bool)

(declare-fun b_next!14303 () Bool)

(assert (=> start!73388 (= b_free!14303 (not b_next!14303))))

(declare-fun tp!50412 () Bool)

(declare-fun b_and!23659 () Bool)

(assert (=> start!73388 (= tp!50412 b_and!23659)))

(declare-fun mapIsEmpty!26258 () Bool)

(declare-fun mapRes!26258 () Bool)

(assert (=> mapIsEmpty!26258 mapRes!26258))

(declare-fun res!581803 () Bool)

(declare-fun e!477468 () Bool)

(assert (=> start!73388 (=> (not res!581803) (not e!477468))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49070 0))(
  ( (array!49071 (arr!23566 (Array (_ BitVec 32) (_ BitVec 64))) (size!24006 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49070)

(assert (=> start!73388 (= res!581803 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24006 _keys!868))))))

(assert (=> start!73388 e!477468))

(declare-fun tp_is_empty!16439 () Bool)

(assert (=> start!73388 tp_is_empty!16439))

(assert (=> start!73388 true))

(assert (=> start!73388 tp!50412))

(declare-fun array_inv!18666 (array!49070) Bool)

(assert (=> start!73388 (array_inv!18666 _keys!868)))

(declare-datatypes ((V!26965 0))(
  ( (V!26966 (val!8267 Int)) )
))
(declare-datatypes ((ValueCell!7780 0))(
  ( (ValueCellFull!7780 (v!10692 V!26965)) (EmptyCell!7780) )
))
(declare-datatypes ((array!49072 0))(
  ( (array!49073 (arr!23567 (Array (_ BitVec 32) ValueCell!7780)) (size!24007 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49072)

(declare-fun e!477467 () Bool)

(declare-fun array_inv!18667 (array!49072) Bool)

(assert (=> start!73388 (and (array_inv!18667 _values!688) e!477467)))

(declare-fun b!856578 () Bool)

(declare-fun res!581806 () Bool)

(assert (=> b!856578 (=> (not res!581806) (not e!477468))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856578 (= res!581806 (validMask!0 mask!1196))))

(declare-fun b!856579 () Bool)

(declare-fun e!477472 () Bool)

(assert (=> b!856579 (= e!477468 e!477472)))

(declare-fun res!581801 () Bool)

(assert (=> b!856579 (=> (not res!581801) (not e!477472))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!856579 (= res!581801 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26965)

(declare-fun lt!386005 () array!49072)

(declare-fun zeroValue!654 () V!26965)

(declare-datatypes ((tuple2!10902 0))(
  ( (tuple2!10903 (_1!5462 (_ BitVec 64)) (_2!5462 V!26965)) )
))
(declare-datatypes ((List!16712 0))(
  ( (Nil!16709) (Cons!16708 (h!17839 tuple2!10902) (t!23353 List!16712)) )
))
(declare-datatypes ((ListLongMap!9671 0))(
  ( (ListLongMap!9672 (toList!4851 List!16712)) )
))
(declare-fun lt!386004 () ListLongMap!9671)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2832 (array!49070 array!49072 (_ BitVec 32) (_ BitVec 32) V!26965 V!26965 (_ BitVec 32) Int) ListLongMap!9671)

(assert (=> b!856579 (= lt!386004 (getCurrentListMapNoExtraKeys!2832 _keys!868 lt!386005 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26965)

(assert (=> b!856579 (= lt!386005 (array!49073 (store (arr!23567 _values!688) i!612 (ValueCellFull!7780 v!557)) (size!24007 _values!688)))))

(declare-fun lt!386003 () ListLongMap!9671)

(assert (=> b!856579 (= lt!386003 (getCurrentListMapNoExtraKeys!2832 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856580 () Bool)

(declare-fun res!581807 () Bool)

(assert (=> b!856580 (=> (not res!581807) (not e!477468))))

(assert (=> b!856580 (= res!581807 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24006 _keys!868))))))

(declare-fun b!856581 () Bool)

(declare-fun e!477471 () Bool)

(assert (=> b!856581 (= e!477471 tp_is_empty!16439)))

(declare-fun b!856582 () Bool)

(declare-fun res!581805 () Bool)

(assert (=> b!856582 (=> (not res!581805) (not e!477468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49070 (_ BitVec 32)) Bool)

(assert (=> b!856582 (= res!581805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856583 () Bool)

(assert (=> b!856583 (= e!477472 (not true))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2207 (ListLongMap!9671 tuple2!10902) ListLongMap!9671)

(assert (=> b!856583 (= (getCurrentListMapNoExtraKeys!2832 _keys!868 lt!386005 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2207 (getCurrentListMapNoExtraKeys!2832 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10903 k!854 v!557)))))

(declare-datatypes ((Unit!29201 0))(
  ( (Unit!29202) )
))
(declare-fun lt!386002 () Unit!29201)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!428 (array!49070 array!49072 (_ BitVec 32) (_ BitVec 32) V!26965 V!26965 (_ BitVec 32) (_ BitVec 64) V!26965 (_ BitVec 32) Int) Unit!29201)

(assert (=> b!856583 (= lt!386002 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!428 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26258 () Bool)

(declare-fun tp!50413 () Bool)

(assert (=> mapNonEmpty!26258 (= mapRes!26258 (and tp!50413 e!477471))))

(declare-fun mapKey!26258 () (_ BitVec 32))

(declare-fun mapRest!26258 () (Array (_ BitVec 32) ValueCell!7780))

(declare-fun mapValue!26258 () ValueCell!7780)

(assert (=> mapNonEmpty!26258 (= (arr!23567 _values!688) (store mapRest!26258 mapKey!26258 mapValue!26258))))

(declare-fun b!856584 () Bool)

(declare-fun e!477469 () Bool)

(assert (=> b!856584 (= e!477467 (and e!477469 mapRes!26258))))

(declare-fun condMapEmpty!26258 () Bool)

(declare-fun mapDefault!26258 () ValueCell!7780)

