; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73000 () Bool)

(assert start!73000)

(declare-fun b_free!13915 () Bool)

(declare-fun b_next!13915 () Bool)

(assert (=> start!73000 (= b_free!13915 (not b_next!13915))))

(declare-fun tp!49248 () Bool)

(declare-fun b_and!23001 () Bool)

(assert (=> start!73000 (= tp!49248 b_and!23001)))

(declare-fun bm!37597 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48312 0))(
  ( (array!48313 (arr!23187 (Array (_ BitVec 32) (_ BitVec 64))) (size!23627 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48312)

(declare-datatypes ((V!26449 0))(
  ( (V!26450 (val!8073 Int)) )
))
(declare-datatypes ((tuple2!10556 0))(
  ( (tuple2!10557 (_1!5289 (_ BitVec 64)) (_2!5289 V!26449)) )
))
(declare-datatypes ((List!16412 0))(
  ( (Nil!16409) (Cons!16408 (h!17539 tuple2!10556) (t!22783 List!16412)) )
))
(declare-datatypes ((ListLongMap!9325 0))(
  ( (ListLongMap!9326 (toList!4678 List!16412)) )
))
(declare-fun call!37601 () ListLongMap!9325)

(declare-datatypes ((ValueCell!7586 0))(
  ( (ValueCellFull!7586 (v!10498 V!26449)) (EmptyCell!7586) )
))
(declare-datatypes ((array!48314 0))(
  ( (array!48315 (arr!23188 (Array (_ BitVec 32) ValueCell!7586)) (size!23628 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48314)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26449)

(declare-fun zeroValue!654 () V!26449)

(declare-fun getCurrentListMapNoExtraKeys!2661 (array!48312 array!48314 (_ BitVec 32) (_ BitVec 32) V!26449 V!26449 (_ BitVec 32) Int) ListLongMap!9325)

(assert (=> bm!37597 (= call!37601 (getCurrentListMapNoExtraKeys!2661 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848176 () Bool)

(declare-fun res!576259 () Bool)

(declare-fun e!473253 () Bool)

(assert (=> b!848176 (=> (not res!576259) (not e!473253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48312 (_ BitVec 32)) Bool)

(assert (=> b!848176 (= res!576259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848177 () Bool)

(declare-fun e!473252 () Bool)

(assert (=> b!848177 (= e!473252 (not true))))

(declare-fun e!473250 () Bool)

(assert (=> b!848177 e!473250))

(declare-fun c!91543 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848177 (= c!91543 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!26449)

(declare-datatypes ((Unit!28969 0))(
  ( (Unit!28970) )
))
(declare-fun lt!381948 () Unit!28969)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!330 (array!48312 array!48314 (_ BitVec 32) (_ BitVec 32) V!26449 V!26449 (_ BitVec 32) (_ BitVec 64) V!26449 (_ BitVec 32) Int) Unit!28969)

(assert (=> b!848177 (= lt!381948 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!330 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848178 () Bool)

(declare-fun res!576255 () Bool)

(assert (=> b!848178 (=> (not res!576255) (not e!473253))))

(declare-datatypes ((List!16413 0))(
  ( (Nil!16410) (Cons!16409 (h!17540 (_ BitVec 64)) (t!22784 List!16413)) )
))
(declare-fun arrayNoDuplicates!0 (array!48312 (_ BitVec 32) List!16413) Bool)

(assert (=> b!848178 (= res!576255 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16410))))

(declare-fun b!848179 () Bool)

(declare-fun res!576256 () Bool)

(assert (=> b!848179 (=> (not res!576256) (not e!473253))))

(assert (=> b!848179 (= res!576256 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23627 _keys!868))))))

(declare-fun b!848180 () Bool)

(declare-fun e!473248 () Bool)

(declare-fun tp_is_empty!16051 () Bool)

(assert (=> b!848180 (= e!473248 tp_is_empty!16051)))

(declare-fun b!848181 () Bool)

(declare-fun res!576262 () Bool)

(assert (=> b!848181 (=> (not res!576262) (not e!473253))))

(assert (=> b!848181 (= res!576262 (and (= (size!23628 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23627 _keys!868) (size!23628 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848182 () Bool)

(declare-fun call!37600 () ListLongMap!9325)

(assert (=> b!848182 (= e!473250 (= call!37600 call!37601))))

(declare-fun b!848183 () Bool)

(assert (=> b!848183 (= e!473253 e!473252)))

(declare-fun res!576257 () Bool)

(assert (=> b!848183 (=> (not res!576257) (not e!473252))))

(assert (=> b!848183 (= res!576257 (= from!1053 i!612))))

(declare-fun lt!381947 () array!48314)

(declare-fun lt!381949 () ListLongMap!9325)

(assert (=> b!848183 (= lt!381949 (getCurrentListMapNoExtraKeys!2661 _keys!868 lt!381947 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848183 (= lt!381947 (array!48315 (store (arr!23188 _values!688) i!612 (ValueCellFull!7586 v!557)) (size!23628 _values!688)))))

(declare-fun lt!381946 () ListLongMap!9325)

(assert (=> b!848183 (= lt!381946 (getCurrentListMapNoExtraKeys!2661 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848184 () Bool)

(declare-fun res!576258 () Bool)

(assert (=> b!848184 (=> (not res!576258) (not e!473253))))

(assert (=> b!848184 (= res!576258 (and (= (select (arr!23187 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!848185 () Bool)

(declare-fun e!473251 () Bool)

(assert (=> b!848185 (= e!473251 tp_is_empty!16051)))

(declare-fun b!848186 () Bool)

(declare-fun +!2090 (ListLongMap!9325 tuple2!10556) ListLongMap!9325)

(assert (=> b!848186 (= e!473250 (= call!37600 (+!2090 call!37601 (tuple2!10557 k!854 v!557))))))

(declare-fun mapNonEmpty!25676 () Bool)

(declare-fun mapRes!25676 () Bool)

(declare-fun tp!49249 () Bool)

(assert (=> mapNonEmpty!25676 (= mapRes!25676 (and tp!49249 e!473248))))

(declare-fun mapRest!25676 () (Array (_ BitVec 32) ValueCell!7586))

(declare-fun mapKey!25676 () (_ BitVec 32))

(declare-fun mapValue!25676 () ValueCell!7586)

(assert (=> mapNonEmpty!25676 (= (arr!23188 _values!688) (store mapRest!25676 mapKey!25676 mapValue!25676))))

(declare-fun b!848187 () Bool)

(declare-fun e!473249 () Bool)

(assert (=> b!848187 (= e!473249 (and e!473251 mapRes!25676))))

(declare-fun condMapEmpty!25676 () Bool)

(declare-fun mapDefault!25676 () ValueCell!7586)

