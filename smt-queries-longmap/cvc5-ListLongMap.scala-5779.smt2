; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74576 () Bool)

(assert start!74576)

(declare-fun b_free!15265 () Bool)

(declare-fun b_next!15265 () Bool)

(assert (=> start!74576 (= b_free!15265 (not b_next!15265))))

(declare-fun tp!53477 () Bool)

(declare-fun b_and!25141 () Bool)

(assert (=> start!74576 (= tp!53477 b_and!25141)))

(declare-fun b!878710 () Bool)

(declare-fun e!489028 () Bool)

(declare-fun tp_is_empty!17509 () Bool)

(assert (=> b!878710 (= e!489028 tp_is_empty!17509)))

(declare-fun b!878711 () Bool)

(declare-fun res!596987 () Bool)

(declare-fun e!489023 () Bool)

(assert (=> b!878711 (=> (not res!596987) (not e!489023))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878711 (= res!596987 (validKeyInArray!0 k!854))))

(declare-fun b!878712 () Bool)

(declare-fun e!489026 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51144 0))(
  ( (array!51145 (arr!24598 (Array (_ BitVec 32) (_ BitVec 64))) (size!25038 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51144)

(assert (=> b!878712 (= e!489026 (not (bvslt from!1053 (size!25038 _keys!868))))))

(declare-datatypes ((V!28393 0))(
  ( (V!28394 (val!8802 Int)) )
))
(declare-fun v!557 () V!28393)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8315 0))(
  ( (ValueCellFull!8315 (v!11242 V!28393)) (EmptyCell!8315) )
))
(declare-datatypes ((array!51146 0))(
  ( (array!51147 (arr!24599 (Array (_ BitVec 32) ValueCell!8315)) (size!25039 (_ BitVec 32))) )
))
(declare-fun lt!397310 () array!51146)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun _values!688 () array!51146)

(declare-fun minValue!654 () V!28393)

(declare-fun zeroValue!654 () V!28393)

(declare-datatypes ((tuple2!11638 0))(
  ( (tuple2!11639 (_1!5830 (_ BitVec 64)) (_2!5830 V!28393)) )
))
(declare-datatypes ((List!17455 0))(
  ( (Nil!17452) (Cons!17451 (h!18582 tuple2!11638) (t!24544 List!17455)) )
))
(declare-datatypes ((ListLongMap!10407 0))(
  ( (ListLongMap!10408 (toList!5219 List!17455)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3186 (array!51144 array!51146 (_ BitVec 32) (_ BitVec 32) V!28393 V!28393 (_ BitVec 32) Int) ListLongMap!10407)

(declare-fun +!2493 (ListLongMap!10407 tuple2!11638) ListLongMap!10407)

(assert (=> b!878712 (= (getCurrentListMapNoExtraKeys!3186 _keys!868 lt!397310 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2493 (getCurrentListMapNoExtraKeys!3186 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11639 k!854 v!557)))))

(declare-datatypes ((Unit!30012 0))(
  ( (Unit!30013) )
))
(declare-fun lt!397311 () Unit!30012)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!688 (array!51144 array!51146 (_ BitVec 32) (_ BitVec 32) V!28393 V!28393 (_ BitVec 32) (_ BitVec 64) V!28393 (_ BitVec 32) Int) Unit!30012)

(assert (=> b!878712 (= lt!397311 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!688 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27879 () Bool)

(declare-fun mapRes!27879 () Bool)

(declare-fun tp!53476 () Bool)

(assert (=> mapNonEmpty!27879 (= mapRes!27879 (and tp!53476 e!489028))))

(declare-fun mapKey!27879 () (_ BitVec 32))

(declare-fun mapRest!27879 () (Array (_ BitVec 32) ValueCell!8315))

(declare-fun mapValue!27879 () ValueCell!8315)

(assert (=> mapNonEmpty!27879 (= (arr!24599 _values!688) (store mapRest!27879 mapKey!27879 mapValue!27879))))

(declare-fun b!878713 () Bool)

(declare-fun e!489025 () Bool)

(declare-fun e!489024 () Bool)

(assert (=> b!878713 (= e!489025 (and e!489024 mapRes!27879))))

(declare-fun condMapEmpty!27879 () Bool)

(declare-fun mapDefault!27879 () ValueCell!8315)

