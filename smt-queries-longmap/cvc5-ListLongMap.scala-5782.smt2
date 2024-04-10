; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74594 () Bool)

(assert start!74594)

(declare-fun b_free!15283 () Bool)

(declare-fun b_next!15283 () Bool)

(assert (=> start!74594 (= b_free!15283 (not b_next!15283))))

(declare-fun tp!53531 () Bool)

(declare-fun b_and!25159 () Bool)

(assert (=> start!74594 (= tp!53531 b_and!25159)))

(declare-fun b!879054 () Bool)

(declare-fun res!597244 () Bool)

(declare-fun e!489207 () Bool)

(assert (=> b!879054 (=> (not res!597244) (not e!489207))))

(declare-datatypes ((array!51180 0))(
  ( (array!51181 (arr!24616 (Array (_ BitVec 32) (_ BitVec 64))) (size!25056 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51180)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51180 (_ BitVec 32)) Bool)

(assert (=> b!879054 (= res!597244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879055 () Bool)

(declare-fun e!489205 () Bool)

(assert (=> b!879055 (= e!489207 e!489205)))

(declare-fun res!597243 () Bool)

(assert (=> b!879055 (=> (not res!597243) (not e!489205))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!879055 (= res!597243 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28417 0))(
  ( (V!28418 (val!8811 Int)) )
))
(declare-datatypes ((ValueCell!8324 0))(
  ( (ValueCellFull!8324 (v!11251 V!28417)) (EmptyCell!8324) )
))
(declare-datatypes ((array!51182 0))(
  ( (array!51183 (arr!24617 (Array (_ BitVec 32) ValueCell!8324)) (size!25057 (_ BitVec 32))) )
))
(declare-fun lt!397419 () array!51182)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28417)

(declare-fun zeroValue!654 () V!28417)

(declare-datatypes ((tuple2!11652 0))(
  ( (tuple2!11653 (_1!5837 (_ BitVec 64)) (_2!5837 V!28417)) )
))
(declare-datatypes ((List!17469 0))(
  ( (Nil!17466) (Cons!17465 (h!18596 tuple2!11652) (t!24558 List!17469)) )
))
(declare-datatypes ((ListLongMap!10421 0))(
  ( (ListLongMap!10422 (toList!5226 List!17469)) )
))
(declare-fun lt!397416 () ListLongMap!10421)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3193 (array!51180 array!51182 (_ BitVec 32) (_ BitVec 32) V!28417 V!28417 (_ BitVec 32) Int) ListLongMap!10421)

(assert (=> b!879055 (= lt!397416 (getCurrentListMapNoExtraKeys!3193 _keys!868 lt!397419 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28417)

(declare-fun _values!688 () array!51182)

(assert (=> b!879055 (= lt!397419 (array!51183 (store (arr!24617 _values!688) i!612 (ValueCellFull!8324 v!557)) (size!25057 _values!688)))))

(declare-fun lt!397418 () ListLongMap!10421)

(assert (=> b!879055 (= lt!397418 (getCurrentListMapNoExtraKeys!3193 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879056 () Bool)

(declare-fun res!597248 () Bool)

(assert (=> b!879056 (=> (not res!597248) (not e!489207))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!879056 (= res!597248 (and (= (select (arr!24616 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!879057 () Bool)

(declare-fun e!489211 () Bool)

(declare-fun tp_is_empty!17527 () Bool)

(assert (=> b!879057 (= e!489211 tp_is_empty!17527)))

(declare-fun res!597250 () Bool)

(assert (=> start!74594 (=> (not res!597250) (not e!489207))))

(assert (=> start!74594 (= res!597250 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25056 _keys!868))))))

(assert (=> start!74594 e!489207))

(assert (=> start!74594 tp_is_empty!17527))

(assert (=> start!74594 true))

(assert (=> start!74594 tp!53531))

(declare-fun array_inv!19400 (array!51180) Bool)

(assert (=> start!74594 (array_inv!19400 _keys!868)))

(declare-fun e!489206 () Bool)

(declare-fun array_inv!19401 (array!51182) Bool)

(assert (=> start!74594 (and (array_inv!19401 _values!688) e!489206)))

(declare-fun b!879058 () Bool)

(declare-fun e!489209 () Bool)

(assert (=> b!879058 (= e!489209 (bvslt from!1053 (size!25057 _values!688)))))

(declare-fun b!879059 () Bool)

(assert (=> b!879059 (= e!489205 (not e!489209))))

(declare-fun res!597247 () Bool)

(assert (=> b!879059 (=> res!597247 e!489209)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879059 (= res!597247 (not (validKeyInArray!0 (select (arr!24616 _keys!868) from!1053))))))

(declare-fun +!2499 (ListLongMap!10421 tuple2!11652) ListLongMap!10421)

(assert (=> b!879059 (= (getCurrentListMapNoExtraKeys!3193 _keys!868 lt!397419 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2499 (getCurrentListMapNoExtraKeys!3193 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11653 k!854 v!557)))))

(declare-datatypes ((Unit!30024 0))(
  ( (Unit!30025) )
))
(declare-fun lt!397417 () Unit!30024)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!694 (array!51180 array!51182 (_ BitVec 32) (_ BitVec 32) V!28417 V!28417 (_ BitVec 32) (_ BitVec 64) V!28417 (_ BitVec 32) Int) Unit!30024)

(assert (=> b!879059 (= lt!397417 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!694 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27906 () Bool)

(declare-fun mapRes!27906 () Bool)

(assert (=> mapIsEmpty!27906 mapRes!27906))

(declare-fun b!879060 () Bool)

(declare-fun res!597246 () Bool)

(assert (=> b!879060 (=> (not res!597246) (not e!489207))))

(declare-datatypes ((List!17470 0))(
  ( (Nil!17467) (Cons!17466 (h!18597 (_ BitVec 64)) (t!24559 List!17470)) )
))
(declare-fun arrayNoDuplicates!0 (array!51180 (_ BitVec 32) List!17470) Bool)

(assert (=> b!879060 (= res!597246 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17467))))

(declare-fun b!879061 () Bool)

(declare-fun res!597249 () Bool)

(assert (=> b!879061 (=> (not res!597249) (not e!489207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879061 (= res!597249 (validMask!0 mask!1196))))

(declare-fun b!879062 () Bool)

(declare-fun e!489210 () Bool)

(assert (=> b!879062 (= e!489210 tp_is_empty!17527)))

(declare-fun mapNonEmpty!27906 () Bool)

(declare-fun tp!53530 () Bool)

(assert (=> mapNonEmpty!27906 (= mapRes!27906 (and tp!53530 e!489210))))

(declare-fun mapValue!27906 () ValueCell!8324)

(declare-fun mapRest!27906 () (Array (_ BitVec 32) ValueCell!8324))

(declare-fun mapKey!27906 () (_ BitVec 32))

(assert (=> mapNonEmpty!27906 (= (arr!24617 _values!688) (store mapRest!27906 mapKey!27906 mapValue!27906))))

(declare-fun b!879063 () Bool)

(declare-fun res!597251 () Bool)

(assert (=> b!879063 (=> (not res!597251) (not e!489207))))

(assert (=> b!879063 (= res!597251 (validKeyInArray!0 k!854))))

(declare-fun b!879064 () Bool)

(declare-fun res!597242 () Bool)

(assert (=> b!879064 (=> (not res!597242) (not e!489207))))

(assert (=> b!879064 (= res!597242 (and (= (size!25057 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25056 _keys!868) (size!25057 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879065 () Bool)

(assert (=> b!879065 (= e!489206 (and e!489211 mapRes!27906))))

(declare-fun condMapEmpty!27906 () Bool)

(declare-fun mapDefault!27906 () ValueCell!8324)

