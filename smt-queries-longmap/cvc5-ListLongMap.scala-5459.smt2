; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72538 () Bool)

(assert start!72538)

(declare-fun b_free!13723 () Bool)

(declare-fun b_next!13723 () Bool)

(assert (=> start!72538 (= b_free!13723 (not b_next!13723))))

(declare-fun tp!48267 () Bool)

(declare-fun b_and!22809 () Bool)

(assert (=> start!72538 (= tp!48267 b_and!22809)))

(declare-fun b!841910 () Bool)

(declare-fun res!572269 () Bool)

(declare-fun e!469621 () Bool)

(assert (=> b!841910 (=> (not res!572269) (not e!469621))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47452 0))(
  ( (array!47453 (arr!22757 (Array (_ BitVec 32) (_ BitVec 64))) (size!23197 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47452)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!841910 (= res!572269 (and (= (select (arr!22757 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23197 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!25833 0))(
  ( (V!25834 (val!7842 Int)) )
))
(declare-fun v!557 () V!25833)

(declare-fun bm!37399 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7355 0))(
  ( (ValueCellFull!7355 (v!10267 V!25833)) (EmptyCell!7355) )
))
(declare-datatypes ((array!47454 0))(
  ( (array!47455 (arr!22758 (Array (_ BitVec 32) ValueCell!7355)) (size!23198 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47454)

(declare-fun minValue!654 () V!25833)

(declare-fun zeroValue!654 () V!25833)

(declare-datatypes ((tuple2!10410 0))(
  ( (tuple2!10411 (_1!5216 (_ BitVec 64)) (_2!5216 V!25833)) )
))
(declare-datatypes ((List!16189 0))(
  ( (Nil!16186) (Cons!16185 (h!17316 tuple2!10410) (t!22560 List!16189)) )
))
(declare-datatypes ((ListLongMap!9179 0))(
  ( (ListLongMap!9180 (toList!4605 List!16189)) )
))
(declare-fun call!37402 () ListLongMap!9179)

(declare-fun getCurrentListMapNoExtraKeys!2590 (array!47452 array!47454 (_ BitVec 32) (_ BitVec 32) V!25833 V!25833 (_ BitVec 32) Int) ListLongMap!9179)

(assert (=> bm!37399 (= call!37402 (getCurrentListMapNoExtraKeys!2590 _keys!868 (array!47455 (store (arr!22758 _values!688) i!612 (ValueCellFull!7355 v!557)) (size!23198 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841911 () Bool)

(declare-fun res!572266 () Bool)

(assert (=> b!841911 (=> (not res!572266) (not e!469621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47452 (_ BitVec 32)) Bool)

(assert (=> b!841911 (= res!572266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841912 () Bool)

(assert (=> b!841912 (= e!469621 (not true))))

(declare-fun e!469620 () Bool)

(assert (=> b!841912 e!469620))

(declare-fun c!91444 () Bool)

(assert (=> b!841912 (= c!91444 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28915 0))(
  ( (Unit!28916) )
))
(declare-fun lt!380950 () Unit!28915)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!303 (array!47452 array!47454 (_ BitVec 32) (_ BitVec 32) V!25833 V!25833 (_ BitVec 32) (_ BitVec 64) V!25833 (_ BitVec 32) Int) Unit!28915)

(assert (=> b!841912 (= lt!380950 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!303 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841913 () Bool)

(declare-fun res!572267 () Bool)

(assert (=> b!841913 (=> (not res!572267) (not e!469621))))

(assert (=> b!841913 (= res!572267 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23197 _keys!868))))))

(declare-fun mapNonEmpty!24983 () Bool)

(declare-fun mapRes!24983 () Bool)

(declare-fun tp!48268 () Bool)

(declare-fun e!469623 () Bool)

(assert (=> mapNonEmpty!24983 (= mapRes!24983 (and tp!48268 e!469623))))

(declare-fun mapRest!24983 () (Array (_ BitVec 32) ValueCell!7355))

(declare-fun mapKey!24983 () (_ BitVec 32))

(declare-fun mapValue!24983 () ValueCell!7355)

(assert (=> mapNonEmpty!24983 (= (arr!22758 _values!688) (store mapRest!24983 mapKey!24983 mapValue!24983))))

(declare-fun mapIsEmpty!24983 () Bool)

(assert (=> mapIsEmpty!24983 mapRes!24983))

(declare-fun b!841914 () Bool)

(declare-fun res!572270 () Bool)

(assert (=> b!841914 (=> (not res!572270) (not e!469621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841914 (= res!572270 (validKeyInArray!0 k!854))))

(declare-fun b!841916 () Bool)

(declare-fun call!37403 () ListLongMap!9179)

(assert (=> b!841916 (= e!469620 (= call!37402 call!37403))))

(declare-fun b!841917 () Bool)

(declare-fun tp_is_empty!15589 () Bool)

(assert (=> b!841917 (= e!469623 tp_is_empty!15589)))

(declare-fun b!841918 () Bool)

(declare-fun res!572268 () Bool)

(assert (=> b!841918 (=> (not res!572268) (not e!469621))))

(assert (=> b!841918 (= res!572268 (and (= (size!23198 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23197 _keys!868) (size!23198 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841919 () Bool)

(declare-fun e!469624 () Bool)

(declare-fun e!469622 () Bool)

(assert (=> b!841919 (= e!469624 (and e!469622 mapRes!24983))))

(declare-fun condMapEmpty!24983 () Bool)

(declare-fun mapDefault!24983 () ValueCell!7355)

