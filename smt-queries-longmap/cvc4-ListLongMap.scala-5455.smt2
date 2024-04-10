; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72518 () Bool)

(assert start!72518)

(declare-fun b_free!13703 () Bool)

(declare-fun b_next!13703 () Bool)

(assert (=> start!72518 (= b_free!13703 (not b_next!13703))))

(declare-fun tp!48208 () Bool)

(declare-fun b_and!22789 () Bool)

(assert (=> start!72518 (= tp!48208 b_and!22789)))

(declare-fun b!841520 () Bool)

(declare-fun e!469439 () Bool)

(declare-datatypes ((V!25805 0))(
  ( (V!25806 (val!7832 Int)) )
))
(declare-datatypes ((tuple2!10394 0))(
  ( (tuple2!10395 (_1!5208 (_ BitVec 64)) (_2!5208 V!25805)) )
))
(declare-datatypes ((List!16175 0))(
  ( (Nil!16172) (Cons!16171 (h!17302 tuple2!10394) (t!22546 List!16175)) )
))
(declare-datatypes ((ListLongMap!9163 0))(
  ( (ListLongMap!9164 (toList!4597 List!16175)) )
))
(declare-fun call!37342 () ListLongMap!9163)

(declare-fun call!37343 () ListLongMap!9163)

(assert (=> b!841520 (= e!469439 (= call!37342 call!37343))))

(declare-fun mapNonEmpty!24953 () Bool)

(declare-fun mapRes!24953 () Bool)

(declare-fun tp!48207 () Bool)

(declare-fun e!469440 () Bool)

(assert (=> mapNonEmpty!24953 (= mapRes!24953 (and tp!48207 e!469440))))

(declare-datatypes ((ValueCell!7345 0))(
  ( (ValueCellFull!7345 (v!10257 V!25805)) (EmptyCell!7345) )
))
(declare-fun mapRest!24953 () (Array (_ BitVec 32) ValueCell!7345))

(declare-fun mapKey!24953 () (_ BitVec 32))

(declare-datatypes ((array!47416 0))(
  ( (array!47417 (arr!22739 (Array (_ BitVec 32) ValueCell!7345)) (size!23179 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47416)

(declare-fun mapValue!24953 () ValueCell!7345)

(assert (=> mapNonEmpty!24953 (= (arr!22739 _values!688) (store mapRest!24953 mapKey!24953 mapValue!24953))))

(declare-fun b!841521 () Bool)

(declare-fun res!572031 () Bool)

(declare-fun e!469442 () Bool)

(assert (=> b!841521 (=> (not res!572031) (not e!469442))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47418 0))(
  ( (array!47419 (arr!22740 (Array (_ BitVec 32) (_ BitVec 64))) (size!23180 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47418)

(assert (=> b!841521 (= res!572031 (and (= (size!23179 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23180 _keys!868) (size!23179 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841522 () Bool)

(declare-fun res!572033 () Bool)

(assert (=> b!841522 (=> (not res!572033) (not e!469442))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841522 (= res!572033 (validKeyInArray!0 k!854))))

(declare-fun res!572029 () Bool)

(assert (=> start!72518 (=> (not res!572029) (not e!469442))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72518 (= res!572029 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23180 _keys!868))))))

(assert (=> start!72518 e!469442))

(declare-fun tp_is_empty!15569 () Bool)

(assert (=> start!72518 tp_is_empty!15569))

(assert (=> start!72518 true))

(assert (=> start!72518 tp!48208))

(declare-fun array_inv!18092 (array!47418) Bool)

(assert (=> start!72518 (array_inv!18092 _keys!868)))

(declare-fun e!469443 () Bool)

(declare-fun array_inv!18093 (array!47416) Bool)

(assert (=> start!72518 (and (array_inv!18093 _values!688) e!469443)))

(declare-fun b!841523 () Bool)

(declare-fun e!469444 () Bool)

(assert (=> b!841523 (= e!469444 tp_is_empty!15569)))

(declare-fun b!841524 () Bool)

(declare-fun res!572027 () Bool)

(assert (=> b!841524 (=> (not res!572027) (not e!469442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47418 (_ BitVec 32)) Bool)

(assert (=> b!841524 (= res!572027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun v!557 () V!25805)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37339 () Bool)

(declare-fun minValue!654 () V!25805)

(declare-fun zeroValue!654 () V!25805)

(declare-fun getCurrentListMapNoExtraKeys!2583 (array!47418 array!47416 (_ BitVec 32) (_ BitVec 32) V!25805 V!25805 (_ BitVec 32) Int) ListLongMap!9163)

(assert (=> bm!37339 (= call!37342 (getCurrentListMapNoExtraKeys!2583 _keys!868 (array!47417 (store (arr!22739 _values!688) i!612 (ValueCellFull!7345 v!557)) (size!23179 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841525 () Bool)

(assert (=> b!841525 (= e!469443 (and e!469444 mapRes!24953))))

(declare-fun condMapEmpty!24953 () Bool)

(declare-fun mapDefault!24953 () ValueCell!7345)

