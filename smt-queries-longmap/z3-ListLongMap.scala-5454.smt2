; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72490 () Bool)

(assert start!72490)

(declare-fun b_free!13693 () Bool)

(declare-fun b_next!13693 () Bool)

(assert (=> start!72490 (= b_free!13693 (not b_next!13693))))

(declare-fun tp!48178 () Bool)

(declare-fun b_and!22753 () Bool)

(assert (=> start!72490 (= tp!48178 b_and!22753)))

(declare-fun b!841086 () Bool)

(declare-fun res!571797 () Bool)

(declare-fun e!469206 () Bool)

(assert (=> b!841086 (=> (not res!571797) (not e!469206))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47371 0))(
  ( (array!47372 (arr!22717 (Array (_ BitVec 32) (_ BitVec 64))) (size!23159 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47371)

(assert (=> b!841086 (= res!571797 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23159 _keys!868))))))

(declare-fun b!841087 () Bool)

(declare-fun res!571798 () Bool)

(assert (=> b!841087 (=> (not res!571798) (not e!469206))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47371 (_ BitVec 32)) Bool)

(assert (=> b!841087 (= res!571798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-datatypes ((V!25793 0))(
  ( (V!25794 (val!7827 Int)) )
))
(declare-datatypes ((tuple2!10402 0))(
  ( (tuple2!10403 (_1!5212 (_ BitVec 64)) (_2!5212 V!25793)) )
))
(declare-datatypes ((List!16175 0))(
  ( (Nil!16172) (Cons!16171 (h!17302 tuple2!10402) (t!22537 List!16175)) )
))
(declare-datatypes ((ListLongMap!9161 0))(
  ( (ListLongMap!9162 (toList!4596 List!16175)) )
))
(declare-fun call!37286 () ListLongMap!9161)

(declare-fun bm!37283 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7340 0))(
  ( (ValueCellFull!7340 (v!10246 V!25793)) (EmptyCell!7340) )
))
(declare-datatypes ((array!47373 0))(
  ( (array!47374 (arr!22718 (Array (_ BitVec 32) ValueCell!7340)) (size!23160 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47373)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25793)

(declare-fun zeroValue!654 () V!25793)

(declare-fun getCurrentListMapNoExtraKeys!2612 (array!47371 array!47373 (_ BitVec 32) (_ BitVec 32) V!25793 V!25793 (_ BitVec 32) Int) ListLongMap!9161)

(assert (=> bm!37283 (= call!37286 (getCurrentListMapNoExtraKeys!2612 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841088 () Bool)

(declare-fun e!469205 () Bool)

(declare-fun call!37287 () ListLongMap!9161)

(assert (=> b!841088 (= e!469205 (= call!37287 call!37286))))

(declare-fun mapIsEmpty!24938 () Bool)

(declare-fun mapRes!24938 () Bool)

(assert (=> mapIsEmpty!24938 mapRes!24938))

(declare-fun res!571803 () Bool)

(assert (=> start!72490 (=> (not res!571803) (not e!469206))))

(assert (=> start!72490 (= res!571803 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23159 _keys!868))))))

(assert (=> start!72490 e!469206))

(declare-fun tp_is_empty!15559 () Bool)

(assert (=> start!72490 tp_is_empty!15559))

(assert (=> start!72490 true))

(assert (=> start!72490 tp!48178))

(declare-fun array_inv!18152 (array!47371) Bool)

(assert (=> start!72490 (array_inv!18152 _keys!868)))

(declare-fun e!469204 () Bool)

(declare-fun array_inv!18153 (array!47373) Bool)

(assert (=> start!72490 (and (array_inv!18153 _values!688) e!469204)))

(declare-fun mapNonEmpty!24938 () Bool)

(declare-fun tp!48179 () Bool)

(declare-fun e!469203 () Bool)

(assert (=> mapNonEmpty!24938 (= mapRes!24938 (and tp!48179 e!469203))))

(declare-fun mapRest!24938 () (Array (_ BitVec 32) ValueCell!7340))

(declare-fun mapValue!24938 () ValueCell!7340)

(declare-fun mapKey!24938 () (_ BitVec 32))

(assert (=> mapNonEmpty!24938 (= (arr!22718 _values!688) (store mapRest!24938 mapKey!24938 mapValue!24938))))

(declare-fun b!841089 () Bool)

(declare-fun e!469202 () Bool)

(assert (=> b!841089 (= e!469204 (and e!469202 mapRes!24938))))

(declare-fun condMapEmpty!24938 () Bool)

(declare-fun mapDefault!24938 () ValueCell!7340)

(assert (=> b!841089 (= condMapEmpty!24938 (= (arr!22718 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7340)) mapDefault!24938)))))

(declare-fun v!557 () V!25793)

(declare-fun b!841090 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2079 (ListLongMap!9161 tuple2!10402) ListLongMap!9161)

(assert (=> b!841090 (= e!469205 (= call!37287 (+!2079 call!37286 (tuple2!10403 k0!854 v!557))))))

(declare-fun b!841091 () Bool)

(declare-fun res!571796 () Bool)

(assert (=> b!841091 (=> (not res!571796) (not e!469206))))

(assert (=> b!841091 (= res!571796 (and (= (size!23160 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23159 _keys!868) (size!23160 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841092 () Bool)

(assert (=> b!841092 (= e!469203 tp_is_empty!15559)))

(declare-fun b!841093 () Bool)

(assert (=> b!841093 (= e!469202 tp_is_empty!15559)))

(declare-fun b!841094 () Bool)

(assert (=> b!841094 (= e!469206 (not true))))

(assert (=> b!841094 e!469205))

(declare-fun c!91334 () Bool)

(assert (=> b!841094 (= c!91334 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28843 0))(
  ( (Unit!28844) )
))
(declare-fun lt!380669 () Unit!28843)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!296 (array!47371 array!47373 (_ BitVec 32) (_ BitVec 32) V!25793 V!25793 (_ BitVec 32) (_ BitVec 64) V!25793 (_ BitVec 32) Int) Unit!28843)

(assert (=> b!841094 (= lt!380669 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!296 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841095 () Bool)

(declare-fun res!571800 () Bool)

(assert (=> b!841095 (=> (not res!571800) (not e!469206))))

(declare-datatypes ((List!16176 0))(
  ( (Nil!16173) (Cons!16172 (h!17303 (_ BitVec 64)) (t!22538 List!16176)) )
))
(declare-fun arrayNoDuplicates!0 (array!47371 (_ BitVec 32) List!16176) Bool)

(assert (=> b!841095 (= res!571800 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16173))))

(declare-fun b!841096 () Bool)

(declare-fun res!571801 () Bool)

(assert (=> b!841096 (=> (not res!571801) (not e!469206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841096 (= res!571801 (validKeyInArray!0 k0!854))))

(declare-fun bm!37284 () Bool)

(assert (=> bm!37284 (= call!37287 (getCurrentListMapNoExtraKeys!2612 _keys!868 (array!47374 (store (arr!22718 _values!688) i!612 (ValueCellFull!7340 v!557)) (size!23160 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841097 () Bool)

(declare-fun res!571799 () Bool)

(assert (=> b!841097 (=> (not res!571799) (not e!469206))))

(assert (=> b!841097 (= res!571799 (and (= (select (arr!22717 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23159 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841098 () Bool)

(declare-fun res!571802 () Bool)

(assert (=> b!841098 (=> (not res!571802) (not e!469206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841098 (= res!571802 (validMask!0 mask!1196))))

(assert (= (and start!72490 res!571803) b!841098))

(assert (= (and b!841098 res!571802) b!841091))

(assert (= (and b!841091 res!571796) b!841087))

(assert (= (and b!841087 res!571798) b!841095))

(assert (= (and b!841095 res!571800) b!841086))

(assert (= (and b!841086 res!571797) b!841096))

(assert (= (and b!841096 res!571801) b!841097))

(assert (= (and b!841097 res!571799) b!841094))

(assert (= (and b!841094 c!91334) b!841090))

(assert (= (and b!841094 (not c!91334)) b!841088))

(assert (= (or b!841090 b!841088) bm!37284))

(assert (= (or b!841090 b!841088) bm!37283))

(assert (= (and b!841089 condMapEmpty!24938) mapIsEmpty!24938))

(assert (= (and b!841089 (not condMapEmpty!24938)) mapNonEmpty!24938))

(get-info :version)

(assert (= (and mapNonEmpty!24938 ((_ is ValueCellFull!7340) mapValue!24938)) b!841092))

(assert (= (and b!841089 ((_ is ValueCellFull!7340) mapDefault!24938)) b!841093))

(assert (= start!72490 b!841089))

(declare-fun m!784049 () Bool)

(assert (=> mapNonEmpty!24938 m!784049))

(declare-fun m!784051 () Bool)

(assert (=> b!841090 m!784051))

(declare-fun m!784053 () Bool)

(assert (=> b!841095 m!784053))

(declare-fun m!784055 () Bool)

(assert (=> b!841098 m!784055))

(declare-fun m!784057 () Bool)

(assert (=> bm!37284 m!784057))

(declare-fun m!784059 () Bool)

(assert (=> bm!37284 m!784059))

(declare-fun m!784061 () Bool)

(assert (=> b!841094 m!784061))

(declare-fun m!784063 () Bool)

(assert (=> b!841097 m!784063))

(declare-fun m!784065 () Bool)

(assert (=> bm!37283 m!784065))

(declare-fun m!784067 () Bool)

(assert (=> start!72490 m!784067))

(declare-fun m!784069 () Bool)

(assert (=> start!72490 m!784069))

(declare-fun m!784071 () Bool)

(assert (=> b!841096 m!784071))

(declare-fun m!784073 () Bool)

(assert (=> b!841087 m!784073))

(check-sat (not b!841096) (not mapNonEmpty!24938) (not b!841087) (not b!841098) tp_is_empty!15559 b_and!22753 (not start!72490) (not bm!37284) (not b!841090) (not b_next!13693) (not bm!37283) (not b!841095) (not b!841094))
(check-sat b_and!22753 (not b_next!13693))
