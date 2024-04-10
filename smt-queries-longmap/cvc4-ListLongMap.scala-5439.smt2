; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72422 () Bool)

(assert start!72422)

(declare-fun b_free!13607 () Bool)

(declare-fun b_next!13607 () Bool)

(assert (=> start!72422 (= b_free!13607 (not b_next!13607))))

(declare-fun tp!47920 () Bool)

(declare-fun b_and!22693 () Bool)

(assert (=> start!72422 (= tp!47920 b_and!22693)))

(declare-fun b!839648 () Bool)

(declare-fun res!570876 () Bool)

(declare-fun e!468578 () Bool)

(assert (=> b!839648 (=> (not res!570876) (not e!468578))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47228 0))(
  ( (array!47229 (arr!22645 (Array (_ BitVec 32) (_ BitVec 64))) (size!23085 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47228)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!839648 (= res!570876 (and (= (select (arr!22645 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23085 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839649 () Bool)

(declare-fun res!570874 () Bool)

(assert (=> b!839649 (=> (not res!570874) (not e!468578))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47228 (_ BitVec 32)) Bool)

(assert (=> b!839649 (= res!570874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-datatypes ((V!25677 0))(
  ( (V!25678 (val!7784 Int)) )
))
(declare-datatypes ((tuple2!10308 0))(
  ( (tuple2!10309 (_1!5165 (_ BitVec 64)) (_2!5165 V!25677)) )
))
(declare-datatypes ((List!16106 0))(
  ( (Nil!16103) (Cons!16102 (h!17233 tuple2!10308) (t!22477 List!16106)) )
))
(declare-datatypes ((ListLongMap!9077 0))(
  ( (ListLongMap!9078 (toList!4554 List!16106)) )
))
(declare-fun call!37055 () ListLongMap!9077)

(declare-fun v!557 () V!25677)

(declare-fun bm!37051 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7297 0))(
  ( (ValueCellFull!7297 (v!10209 V!25677)) (EmptyCell!7297) )
))
(declare-datatypes ((array!47230 0))(
  ( (array!47231 (arr!22646 (Array (_ BitVec 32) ValueCell!7297)) (size!23086 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47230)

(declare-fun minValue!654 () V!25677)

(declare-fun zeroValue!654 () V!25677)

(declare-fun getCurrentListMapNoExtraKeys!2544 (array!47228 array!47230 (_ BitVec 32) (_ BitVec 32) V!25677 V!25677 (_ BitVec 32) Int) ListLongMap!9077)

(assert (=> bm!37051 (= call!37055 (getCurrentListMapNoExtraKeys!2544 _keys!868 (array!47231 (store (arr!22646 _values!688) i!612 (ValueCellFull!7297 v!557)) (size!23086 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839650 () Bool)

(declare-fun res!570881 () Bool)

(assert (=> b!839650 (=> (not res!570881) (not e!468578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839650 (= res!570881 (validMask!0 mask!1196))))

(declare-fun b!839651 () Bool)

(declare-fun e!468579 () Bool)

(declare-fun tp_is_empty!15473 () Bool)

(assert (=> b!839651 (= e!468579 tp_is_empty!15473)))

(declare-fun b!839652 () Bool)

(declare-fun e!468576 () Bool)

(assert (=> b!839652 (= e!468576 tp_is_empty!15473)))

(declare-fun res!570875 () Bool)

(assert (=> start!72422 (=> (not res!570875) (not e!468578))))

(assert (=> start!72422 (= res!570875 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23085 _keys!868))))))

(assert (=> start!72422 e!468578))

(assert (=> start!72422 tp_is_empty!15473))

(assert (=> start!72422 true))

(assert (=> start!72422 tp!47920))

(declare-fun array_inv!18038 (array!47228) Bool)

(assert (=> start!72422 (array_inv!18038 _keys!868)))

(declare-fun e!468575 () Bool)

(declare-fun array_inv!18039 (array!47230) Bool)

(assert (=> start!72422 (and (array_inv!18039 _values!688) e!468575)))

(declare-fun e!468577 () Bool)

(declare-fun b!839653 () Bool)

(declare-fun call!37054 () ListLongMap!9077)

(declare-fun +!2025 (ListLongMap!9077 tuple2!10308) ListLongMap!9077)

(assert (=> b!839653 (= e!468577 (= call!37055 (+!2025 call!37054 (tuple2!10309 k!854 v!557))))))

(declare-fun b!839654 () Bool)

(assert (=> b!839654 (= e!468578 (not true))))

(assert (=> b!839654 e!468577))

(declare-fun c!91270 () Bool)

(assert (=> b!839654 (= c!91270 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28837 0))(
  ( (Unit!28838) )
))
(declare-fun lt!380776 () Unit!28837)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!264 (array!47228 array!47230 (_ BitVec 32) (_ BitVec 32) V!25677 V!25677 (_ BitVec 32) (_ BitVec 64) V!25677 (_ BitVec 32) Int) Unit!28837)

(assert (=> b!839654 (= lt!380776 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!264 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839655 () Bool)

(declare-fun mapRes!24809 () Bool)

(assert (=> b!839655 (= e!468575 (and e!468576 mapRes!24809))))

(declare-fun condMapEmpty!24809 () Bool)

(declare-fun mapDefault!24809 () ValueCell!7297)

