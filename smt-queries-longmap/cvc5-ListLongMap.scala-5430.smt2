; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72364 () Bool)

(assert start!72364)

(declare-fun b_free!13549 () Bool)

(declare-fun b_next!13549 () Bool)

(assert (=> start!72364 (= b_free!13549 (not b_next!13549))))

(declare-fun tp!47745 () Bool)

(declare-fun b_and!22635 () Bool)

(assert (=> start!72364 (= tp!47745 b_and!22635)))

(declare-fun b!838517 () Bool)

(declare-fun res!570185 () Bool)

(declare-fun e!468053 () Bool)

(assert (=> b!838517 (=> (not res!570185) (not e!468053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47118 0))(
  ( (array!47119 (arr!22590 (Array (_ BitVec 32) (_ BitVec 64))) (size!23030 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47118)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!838517 (= res!570185 (and (= (select (arr!22590 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23030 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!838518 () Bool)

(declare-fun res!570179 () Bool)

(assert (=> b!838518 (=> (not res!570179) (not e!468053))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47118 (_ BitVec 32)) Bool)

(assert (=> b!838518 (= res!570179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838519 () Bool)

(assert (=> b!838519 (= e!468053 (not true))))

(declare-fun e!468054 () Bool)

(assert (=> b!838519 e!468054))

(declare-fun c!91183 () Bool)

(assert (=> b!838519 (= c!91183 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25601 0))(
  ( (V!25602 (val!7755 Int)) )
))
(declare-fun v!557 () V!25601)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7268 0))(
  ( (ValueCellFull!7268 (v!10180 V!25601)) (EmptyCell!7268) )
))
(declare-datatypes ((array!47120 0))(
  ( (array!47121 (arr!22591 (Array (_ BitVec 32) ValueCell!7268)) (size!23031 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47120)

(declare-fun minValue!654 () V!25601)

(declare-fun zeroValue!654 () V!25601)

(declare-datatypes ((Unit!28799 0))(
  ( (Unit!28800) )
))
(declare-fun lt!380689 () Unit!28799)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!245 (array!47118 array!47120 (_ BitVec 32) (_ BitVec 32) V!25601 V!25601 (_ BitVec 32) (_ BitVec 64) V!25601 (_ BitVec 32) Int) Unit!28799)

(assert (=> b!838519 (= lt!380689 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!245 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24722 () Bool)

(declare-fun mapRes!24722 () Bool)

(declare-fun tp!47746 () Bool)

(declare-fun e!468056 () Bool)

(assert (=> mapNonEmpty!24722 (= mapRes!24722 (and tp!47746 e!468056))))

(declare-fun mapKey!24722 () (_ BitVec 32))

(declare-fun mapRest!24722 () (Array (_ BitVec 32) ValueCell!7268))

(declare-fun mapValue!24722 () ValueCell!7268)

(assert (=> mapNonEmpty!24722 (= (arr!22591 _values!688) (store mapRest!24722 mapKey!24722 mapValue!24722))))

(declare-fun b!838520 () Bool)

(declare-fun e!468058 () Bool)

(declare-fun tp_is_empty!15415 () Bool)

(assert (=> b!838520 (= e!468058 tp_is_empty!15415)))

(declare-fun b!838521 () Bool)

(declare-fun res!570184 () Bool)

(assert (=> b!838521 (=> (not res!570184) (not e!468053))))

(assert (=> b!838521 (= res!570184 (and (= (size!23031 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23030 _keys!868) (size!23031 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!10258 0))(
  ( (tuple2!10259 (_1!5140 (_ BitVec 64)) (_2!5140 V!25601)) )
))
(declare-datatypes ((List!16062 0))(
  ( (Nil!16059) (Cons!16058 (h!17189 tuple2!10258) (t!22433 List!16062)) )
))
(declare-datatypes ((ListLongMap!9027 0))(
  ( (ListLongMap!9028 (toList!4529 List!16062)) )
))
(declare-fun call!36881 () ListLongMap!9027)

(declare-fun bm!36877 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2521 (array!47118 array!47120 (_ BitVec 32) (_ BitVec 32) V!25601 V!25601 (_ BitVec 32) Int) ListLongMap!9027)

(assert (=> bm!36877 (= call!36881 (getCurrentListMapNoExtraKeys!2521 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838522 () Bool)

(declare-fun call!36880 () ListLongMap!9027)

(declare-fun +!2003 (ListLongMap!9027 tuple2!10258) ListLongMap!9027)

(assert (=> b!838522 (= e!468054 (= call!36880 (+!2003 call!36881 (tuple2!10259 k!854 v!557))))))

(declare-fun b!838524 () Bool)

(declare-fun e!468055 () Bool)

(assert (=> b!838524 (= e!468055 (and e!468058 mapRes!24722))))

(declare-fun condMapEmpty!24722 () Bool)

(declare-fun mapDefault!24722 () ValueCell!7268)

