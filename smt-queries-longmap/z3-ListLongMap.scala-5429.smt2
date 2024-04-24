; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72526 () Bool)

(assert start!72526)

(declare-fun b_free!13543 () Bool)

(declare-fun b_next!13543 () Bool)

(assert (=> start!72526 (= b_free!13543 (not b_next!13543))))

(declare-fun tp!47729 () Bool)

(declare-fun b_and!22639 () Bool)

(assert (=> start!72526 (= tp!47729 b_and!22639)))

(declare-datatypes ((V!25593 0))(
  ( (V!25594 (val!7752 Int)) )
))
(declare-datatypes ((tuple2!10180 0))(
  ( (tuple2!10181 (_1!5101 (_ BitVec 64)) (_2!5101 V!25593)) )
))
(declare-datatypes ((List!15965 0))(
  ( (Nil!15962) (Cons!15961 (h!17098 tuple2!10180) (t!22328 List!15965)) )
))
(declare-datatypes ((ListLongMap!8951 0))(
  ( (ListLongMap!8952 (toList!4491 List!15965)) )
))
(declare-fun call!36908 () ListLongMap!8951)

(declare-fun e!468585 () Bool)

(declare-fun v!557 () V!25593)

(declare-fun call!36907 () ListLongMap!8951)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!839303 () Bool)

(declare-fun +!2008 (ListLongMap!8951 tuple2!10180) ListLongMap!8951)

(assert (=> b!839303 (= e!468585 (= call!36907 (+!2008 call!36908 (tuple2!10181 k0!854 v!557))))))

(declare-fun b!839304 () Bool)

(assert (=> b!839304 (= e!468585 (= call!36907 call!36908))))

(declare-fun b!839305 () Bool)

(declare-fun e!468584 () Bool)

(assert (=> b!839305 (= e!468584 (not true))))

(assert (=> b!839305 e!468585))

(declare-fun c!91456 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839305 (= c!91456 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47115 0))(
  ( (array!47116 (arr!22584 (Array (_ BitVec 32) (_ BitVec 64))) (size!23025 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47115)

(declare-datatypes ((ValueCell!7265 0))(
  ( (ValueCellFull!7265 (v!10177 V!25593)) (EmptyCell!7265) )
))
(declare-datatypes ((array!47117 0))(
  ( (array!47118 (arr!22585 (Array (_ BitVec 32) ValueCell!7265)) (size!23026 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47117)

(declare-datatypes ((Unit!28808 0))(
  ( (Unit!28809) )
))
(declare-fun lt!381041 () Unit!28808)

(declare-fun minValue!654 () V!25593)

(declare-fun zeroValue!654 () V!25593)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!240 (array!47115 array!47117 (_ BitVec 32) (_ BitVec 32) V!25593 V!25593 (_ BitVec 32) (_ BitVec 64) V!25593 (_ BitVec 32) Int) Unit!28808)

(assert (=> b!839305 (= lt!381041 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!240 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839306 () Bool)

(declare-fun res!570451 () Bool)

(assert (=> b!839306 (=> (not res!570451) (not e!468584))))

(declare-datatypes ((List!15966 0))(
  ( (Nil!15963) (Cons!15962 (h!17099 (_ BitVec 64)) (t!22329 List!15966)) )
))
(declare-fun arrayNoDuplicates!0 (array!47115 (_ BitVec 32) List!15966) Bool)

(assert (=> b!839306 (= res!570451 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15963))))

(declare-fun b!839307 () Bool)

(declare-fun res!570452 () Bool)

(assert (=> b!839307 (=> (not res!570452) (not e!468584))))

(assert (=> b!839307 (= res!570452 (and (= (select (arr!22584 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23025 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839308 () Bool)

(declare-fun res!570456 () Bool)

(assert (=> b!839308 (=> (not res!570456) (not e!468584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839308 (= res!570456 (validMask!0 mask!1196))))

(declare-fun res!570455 () Bool)

(assert (=> start!72526 (=> (not res!570455) (not e!468584))))

(assert (=> start!72526 (= res!570455 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23025 _keys!868))))))

(assert (=> start!72526 e!468584))

(declare-fun tp_is_empty!15409 () Bool)

(assert (=> start!72526 tp_is_empty!15409))

(assert (=> start!72526 true))

(assert (=> start!72526 tp!47729))

(declare-fun array_inv!18032 (array!47115) Bool)

(assert (=> start!72526 (array_inv!18032 _keys!868)))

(declare-fun e!468583 () Bool)

(declare-fun array_inv!18033 (array!47117) Bool)

(assert (=> start!72526 (and (array_inv!18033 _values!688) e!468583)))

(declare-fun bm!36904 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2554 (array!47115 array!47117 (_ BitVec 32) (_ BitVec 32) V!25593 V!25593 (_ BitVec 32) Int) ListLongMap!8951)

(assert (=> bm!36904 (= call!36908 (getCurrentListMapNoExtraKeys!2554 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839309 () Bool)

(declare-fun res!570453 () Bool)

(assert (=> b!839309 (=> (not res!570453) (not e!468584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839309 (= res!570453 (validKeyInArray!0 k0!854))))

(declare-fun bm!36905 () Bool)

(assert (=> bm!36905 (= call!36907 (getCurrentListMapNoExtraKeys!2554 _keys!868 (array!47118 (store (arr!22585 _values!688) i!612 (ValueCellFull!7265 v!557)) (size!23026 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24713 () Bool)

(declare-fun mapRes!24713 () Bool)

(assert (=> mapIsEmpty!24713 mapRes!24713))

(declare-fun mapNonEmpty!24713 () Bool)

(declare-fun tp!47728 () Bool)

(declare-fun e!468581 () Bool)

(assert (=> mapNonEmpty!24713 (= mapRes!24713 (and tp!47728 e!468581))))

(declare-fun mapRest!24713 () (Array (_ BitVec 32) ValueCell!7265))

(declare-fun mapKey!24713 () (_ BitVec 32))

(declare-fun mapValue!24713 () ValueCell!7265)

(assert (=> mapNonEmpty!24713 (= (arr!22585 _values!688) (store mapRest!24713 mapKey!24713 mapValue!24713))))

(declare-fun b!839310 () Bool)

(declare-fun e!468586 () Bool)

(assert (=> b!839310 (= e!468583 (and e!468586 mapRes!24713))))

(declare-fun condMapEmpty!24713 () Bool)

(declare-fun mapDefault!24713 () ValueCell!7265)

(assert (=> b!839310 (= condMapEmpty!24713 (= (arr!22585 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7265)) mapDefault!24713)))))

(declare-fun b!839311 () Bool)

(declare-fun res!570457 () Bool)

(assert (=> b!839311 (=> (not res!570457) (not e!468584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47115 (_ BitVec 32)) Bool)

(assert (=> b!839311 (= res!570457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839312 () Bool)

(assert (=> b!839312 (= e!468581 tp_is_empty!15409)))

(declare-fun b!839313 () Bool)

(declare-fun res!570454 () Bool)

(assert (=> b!839313 (=> (not res!570454) (not e!468584))))

(assert (=> b!839313 (= res!570454 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23025 _keys!868))))))

(declare-fun b!839314 () Bool)

(declare-fun res!570450 () Bool)

(assert (=> b!839314 (=> (not res!570450) (not e!468584))))

(assert (=> b!839314 (= res!570450 (and (= (size!23026 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23025 _keys!868) (size!23026 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839315 () Bool)

(assert (=> b!839315 (= e!468586 tp_is_empty!15409)))

(assert (= (and start!72526 res!570455) b!839308))

(assert (= (and b!839308 res!570456) b!839314))

(assert (= (and b!839314 res!570450) b!839311))

(assert (= (and b!839311 res!570457) b!839306))

(assert (= (and b!839306 res!570451) b!839313))

(assert (= (and b!839313 res!570454) b!839309))

(assert (= (and b!839309 res!570453) b!839307))

(assert (= (and b!839307 res!570452) b!839305))

(assert (= (and b!839305 c!91456) b!839303))

(assert (= (and b!839305 (not c!91456)) b!839304))

(assert (= (or b!839303 b!839304) bm!36905))

(assert (= (or b!839303 b!839304) bm!36904))

(assert (= (and b!839310 condMapEmpty!24713) mapIsEmpty!24713))

(assert (= (and b!839310 (not condMapEmpty!24713)) mapNonEmpty!24713))

(get-info :version)

(assert (= (and mapNonEmpty!24713 ((_ is ValueCellFull!7265) mapValue!24713)) b!839312))

(assert (= (and b!839310 ((_ is ValueCellFull!7265) mapDefault!24713)) b!839315))

(assert (= start!72526 b!839310))

(declare-fun m!784145 () Bool)

(assert (=> start!72526 m!784145))

(declare-fun m!784147 () Bool)

(assert (=> start!72526 m!784147))

(declare-fun m!784149 () Bool)

(assert (=> b!839307 m!784149))

(declare-fun m!784151 () Bool)

(assert (=> bm!36905 m!784151))

(declare-fun m!784153 () Bool)

(assert (=> bm!36905 m!784153))

(declare-fun m!784155 () Bool)

(assert (=> b!839311 m!784155))

(declare-fun m!784157 () Bool)

(assert (=> b!839305 m!784157))

(declare-fun m!784159 () Bool)

(assert (=> bm!36904 m!784159))

(declare-fun m!784161 () Bool)

(assert (=> mapNonEmpty!24713 m!784161))

(declare-fun m!784163 () Bool)

(assert (=> b!839303 m!784163))

(declare-fun m!784165 () Bool)

(assert (=> b!839306 m!784165))

(declare-fun m!784167 () Bool)

(assert (=> b!839308 m!784167))

(declare-fun m!784169 () Bool)

(assert (=> b!839309 m!784169))

(check-sat (not mapNonEmpty!24713) (not b_next!13543) (not bm!36904) (not b!839306) (not b!839309) (not start!72526) tp_is_empty!15409 (not b!839308) (not bm!36905) b_and!22639 (not b!839305) (not b!839311) (not b!839303))
(check-sat b_and!22639 (not b_next!13543))
