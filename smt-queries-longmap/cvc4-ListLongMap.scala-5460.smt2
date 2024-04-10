; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72548 () Bool)

(assert start!72548)

(declare-fun b_free!13733 () Bool)

(declare-fun b_next!13733 () Bool)

(assert (=> start!72548 (= b_free!13733 (not b_next!13733))))

(declare-fun tp!48298 () Bool)

(declare-fun b_and!22819 () Bool)

(assert (=> start!72548 (= tp!48298 b_and!22819)))

(declare-fun b!842105 () Bool)

(declare-fun res!572391 () Bool)

(declare-fun e!469713 () Bool)

(assert (=> b!842105 (=> (not res!572391) (not e!469713))))

(declare-datatypes ((array!47472 0))(
  ( (array!47473 (arr!22767 (Array (_ BitVec 32) (_ BitVec 64))) (size!23207 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47472)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47472 (_ BitVec 32)) Bool)

(assert (=> b!842105 (= res!572391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24998 () Bool)

(declare-fun mapRes!24998 () Bool)

(declare-fun tp!48297 () Bool)

(declare-fun e!469711 () Bool)

(assert (=> mapNonEmpty!24998 (= mapRes!24998 (and tp!48297 e!469711))))

(declare-datatypes ((V!25845 0))(
  ( (V!25846 (val!7847 Int)) )
))
(declare-datatypes ((ValueCell!7360 0))(
  ( (ValueCellFull!7360 (v!10272 V!25845)) (EmptyCell!7360) )
))
(declare-fun mapRest!24998 () (Array (_ BitVec 32) ValueCell!7360))

(declare-datatypes ((array!47474 0))(
  ( (array!47475 (arr!22768 (Array (_ BitVec 32) ValueCell!7360)) (size!23208 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47474)

(declare-fun mapKey!24998 () (_ BitVec 32))

(declare-fun mapValue!24998 () ValueCell!7360)

(assert (=> mapNonEmpty!24998 (= (arr!22768 _values!688) (store mapRest!24998 mapKey!24998 mapValue!24998))))

(declare-fun res!572388 () Bool)

(assert (=> start!72548 (=> (not res!572388) (not e!469713))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72548 (= res!572388 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23207 _keys!868))))))

(assert (=> start!72548 e!469713))

(declare-fun tp_is_empty!15599 () Bool)

(assert (=> start!72548 tp_is_empty!15599))

(assert (=> start!72548 true))

(assert (=> start!72548 tp!48298))

(declare-fun array_inv!18116 (array!47472) Bool)

(assert (=> start!72548 (array_inv!18116 _keys!868)))

(declare-fun e!469714 () Bool)

(declare-fun array_inv!18117 (array!47474) Bool)

(assert (=> start!72548 (and (array_inv!18117 _values!688) e!469714)))

(declare-fun b!842106 () Bool)

(declare-fun res!572390 () Bool)

(assert (=> b!842106 (=> (not res!572390) (not e!469713))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!842106 (= res!572390 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23207 _keys!868))))))

(declare-fun v!557 () V!25845)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37429 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25845)

(declare-fun zeroValue!654 () V!25845)

(declare-datatypes ((tuple2!10420 0))(
  ( (tuple2!10421 (_1!5221 (_ BitVec 64)) (_2!5221 V!25845)) )
))
(declare-datatypes ((List!16198 0))(
  ( (Nil!16195) (Cons!16194 (h!17325 tuple2!10420) (t!22569 List!16198)) )
))
(declare-datatypes ((ListLongMap!9189 0))(
  ( (ListLongMap!9190 (toList!4610 List!16198)) )
))
(declare-fun call!37433 () ListLongMap!9189)

(declare-fun getCurrentListMapNoExtraKeys!2595 (array!47472 array!47474 (_ BitVec 32) (_ BitVec 32) V!25845 V!25845 (_ BitVec 32) Int) ListLongMap!9189)

(assert (=> bm!37429 (= call!37433 (getCurrentListMapNoExtraKeys!2595 _keys!868 (array!47475 (store (arr!22768 _values!688) i!612 (ValueCellFull!7360 v!557)) (size!23208 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842107 () Bool)

(declare-fun res!572392 () Bool)

(assert (=> b!842107 (=> (not res!572392) (not e!469713))))

(declare-datatypes ((List!16199 0))(
  ( (Nil!16196) (Cons!16195 (h!17326 (_ BitVec 64)) (t!22570 List!16199)) )
))
(declare-fun arrayNoDuplicates!0 (array!47472 (_ BitVec 32) List!16199) Bool)

(assert (=> b!842107 (= res!572392 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16196))))

(declare-fun b!842108 () Bool)

(declare-fun res!572387 () Bool)

(assert (=> b!842108 (=> (not res!572387) (not e!469713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842108 (= res!572387 (validMask!0 mask!1196))))

(declare-fun b!842109 () Bool)

(assert (=> b!842109 (= e!469711 tp_is_empty!15599)))

(declare-fun b!842110 () Bool)

(declare-fun e!469712 () Bool)

(declare-fun call!37432 () ListLongMap!9189)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2072 (ListLongMap!9189 tuple2!10420) ListLongMap!9189)

(assert (=> b!842110 (= e!469712 (= call!37433 (+!2072 call!37432 (tuple2!10421 k!854 v!557))))))

(declare-fun b!842111 () Bool)

(declare-fun e!469709 () Bool)

(assert (=> b!842111 (= e!469714 (and e!469709 mapRes!24998))))

(declare-fun condMapEmpty!24998 () Bool)

(declare-fun mapDefault!24998 () ValueCell!7360)

