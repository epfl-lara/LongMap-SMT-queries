; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72540 () Bool)

(assert start!72540)

(declare-fun b_free!13725 () Bool)

(declare-fun b_next!13725 () Bool)

(assert (=> start!72540 (= b_free!13725 (not b_next!13725))))

(declare-fun tp!48274 () Bool)

(declare-fun b_and!22811 () Bool)

(assert (=> start!72540 (= tp!48274 b_and!22811)))

(declare-fun b!841949 () Bool)

(declare-fun res!572296 () Bool)

(declare-fun e!469641 () Bool)

(assert (=> b!841949 (=> (not res!572296) (not e!469641))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47456 0))(
  ( (array!47457 (arr!22759 (Array (_ BitVec 32) (_ BitVec 64))) (size!23199 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47456)

(assert (=> b!841949 (= res!572296 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23199 _keys!868))))))

(declare-fun b!841950 () Bool)

(declare-fun res!572291 () Bool)

(assert (=> b!841950 (=> (not res!572291) (not e!469641))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841950 (= res!572291 (validKeyInArray!0 k0!854))))

(declare-fun res!572295 () Bool)

(assert (=> start!72540 (=> (not res!572295) (not e!469641))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72540 (= res!572295 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23199 _keys!868))))))

(assert (=> start!72540 e!469641))

(declare-fun tp_is_empty!15591 () Bool)

(assert (=> start!72540 tp_is_empty!15591))

(assert (=> start!72540 true))

(assert (=> start!72540 tp!48274))

(declare-fun array_inv!18108 (array!47456) Bool)

(assert (=> start!72540 (array_inv!18108 _keys!868)))

(declare-datatypes ((V!25835 0))(
  ( (V!25836 (val!7843 Int)) )
))
(declare-datatypes ((ValueCell!7356 0))(
  ( (ValueCellFull!7356 (v!10268 V!25835)) (EmptyCell!7356) )
))
(declare-datatypes ((array!47458 0))(
  ( (array!47459 (arr!22760 (Array (_ BitVec 32) ValueCell!7356)) (size!23200 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47458)

(declare-fun e!469640 () Bool)

(declare-fun array_inv!18109 (array!47458) Bool)

(assert (=> start!72540 (and (array_inv!18109 _values!688) e!469640)))

(declare-fun b!841951 () Bool)

(declare-fun e!469639 () Bool)

(assert (=> b!841951 (= e!469639 tp_is_empty!15591)))

(declare-fun b!841952 () Bool)

(declare-fun e!469642 () Bool)

(declare-datatypes ((tuple2!10412 0))(
  ( (tuple2!10413 (_1!5217 (_ BitVec 64)) (_2!5217 V!25835)) )
))
(declare-datatypes ((List!16190 0))(
  ( (Nil!16187) (Cons!16186 (h!17317 tuple2!10412) (t!22561 List!16190)) )
))
(declare-datatypes ((ListLongMap!9181 0))(
  ( (ListLongMap!9182 (toList!4606 List!16190)) )
))
(declare-fun call!37409 () ListLongMap!9181)

(declare-fun call!37408 () ListLongMap!9181)

(assert (=> b!841952 (= e!469642 (= call!37409 call!37408))))

(declare-fun mapIsEmpty!24986 () Bool)

(declare-fun mapRes!24986 () Bool)

(assert (=> mapIsEmpty!24986 mapRes!24986))

(declare-fun b!841953 () Bool)

(declare-fun res!572290 () Bool)

(assert (=> b!841953 (=> (not res!572290) (not e!469641))))

(assert (=> b!841953 (= res!572290 (and (= (select (arr!22759 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23199 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841954 () Bool)

(assert (=> b!841954 (= e!469640 (and e!469639 mapRes!24986))))

(declare-fun condMapEmpty!24986 () Bool)

(declare-fun mapDefault!24986 () ValueCell!7356)

(assert (=> b!841954 (= condMapEmpty!24986 (= (arr!22760 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7356)) mapDefault!24986)))))

(declare-fun b!841955 () Bool)

(declare-fun e!469638 () Bool)

(assert (=> b!841955 (= e!469638 tp_is_empty!15591)))

(declare-fun b!841956 () Bool)

(declare-fun res!572292 () Bool)

(assert (=> b!841956 (=> (not res!572292) (not e!469641))))

(declare-datatypes ((List!16191 0))(
  ( (Nil!16188) (Cons!16187 (h!17318 (_ BitVec 64)) (t!22562 List!16191)) )
))
(declare-fun arrayNoDuplicates!0 (array!47456 (_ BitVec 32) List!16191) Bool)

(assert (=> b!841956 (= res!572292 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16188))))

(declare-fun bm!37405 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!25835)

(declare-fun zeroValue!654 () V!25835)

(declare-fun getCurrentListMapNoExtraKeys!2591 (array!47456 array!47458 (_ BitVec 32) (_ BitVec 32) V!25835 V!25835 (_ BitVec 32) Int) ListLongMap!9181)

(assert (=> bm!37405 (= call!37408 (getCurrentListMapNoExtraKeys!2591 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!25835)

(declare-fun b!841957 () Bool)

(declare-fun +!2068 (ListLongMap!9181 tuple2!10412) ListLongMap!9181)

(assert (=> b!841957 (= e!469642 (= call!37409 (+!2068 call!37408 (tuple2!10413 k0!854 v!557))))))

(declare-fun b!841958 () Bool)

(declare-fun res!572297 () Bool)

(assert (=> b!841958 (=> (not res!572297) (not e!469641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841958 (= res!572297 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24986 () Bool)

(declare-fun tp!48273 () Bool)

(assert (=> mapNonEmpty!24986 (= mapRes!24986 (and tp!48273 e!469638))))

(declare-fun mapKey!24986 () (_ BitVec 32))

(declare-fun mapRest!24986 () (Array (_ BitVec 32) ValueCell!7356))

(declare-fun mapValue!24986 () ValueCell!7356)

(assert (=> mapNonEmpty!24986 (= (arr!22760 _values!688) (store mapRest!24986 mapKey!24986 mapValue!24986))))

(declare-fun bm!37406 () Bool)

(assert (=> bm!37406 (= call!37409 (getCurrentListMapNoExtraKeys!2591 _keys!868 (array!47459 (store (arr!22760 _values!688) i!612 (ValueCellFull!7356 v!557)) (size!23200 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841959 () Bool)

(declare-fun res!572293 () Bool)

(assert (=> b!841959 (=> (not res!572293) (not e!469641))))

(assert (=> b!841959 (= res!572293 (and (= (size!23200 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23199 _keys!868) (size!23200 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841960 () Bool)

(assert (=> b!841960 (= e!469641 (not true))))

(assert (=> b!841960 e!469642))

(declare-fun c!91447 () Bool)

(assert (=> b!841960 (= c!91447 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28917 0))(
  ( (Unit!28918) )
))
(declare-fun lt!380953 () Unit!28917)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!304 (array!47456 array!47458 (_ BitVec 32) (_ BitVec 32) V!25835 V!25835 (_ BitVec 32) (_ BitVec 64) V!25835 (_ BitVec 32) Int) Unit!28917)

(assert (=> b!841960 (= lt!380953 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!304 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841961 () Bool)

(declare-fun res!572294 () Bool)

(assert (=> b!841961 (=> (not res!572294) (not e!469641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47456 (_ BitVec 32)) Bool)

(assert (=> b!841961 (= res!572294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72540 res!572295) b!841958))

(assert (= (and b!841958 res!572297) b!841959))

(assert (= (and b!841959 res!572293) b!841961))

(assert (= (and b!841961 res!572294) b!841956))

(assert (= (and b!841956 res!572292) b!841949))

(assert (= (and b!841949 res!572296) b!841950))

(assert (= (and b!841950 res!572291) b!841953))

(assert (= (and b!841953 res!572290) b!841960))

(assert (= (and b!841960 c!91447) b!841957))

(assert (= (and b!841960 (not c!91447)) b!841952))

(assert (= (or b!841957 b!841952) bm!37406))

(assert (= (or b!841957 b!841952) bm!37405))

(assert (= (and b!841954 condMapEmpty!24986) mapIsEmpty!24986))

(assert (= (and b!841954 (not condMapEmpty!24986)) mapNonEmpty!24986))

(get-info :version)

(assert (= (and mapNonEmpty!24986 ((_ is ValueCellFull!7356) mapValue!24986)) b!841955))

(assert (= (and b!841954 ((_ is ValueCellFull!7356) mapDefault!24986)) b!841951))

(assert (= start!72540 b!841954))

(declare-fun m!785219 () Bool)

(assert (=> b!841950 m!785219))

(declare-fun m!785221 () Bool)

(assert (=> bm!37406 m!785221))

(declare-fun m!785223 () Bool)

(assert (=> bm!37406 m!785223))

(declare-fun m!785225 () Bool)

(assert (=> b!841953 m!785225))

(declare-fun m!785227 () Bool)

(assert (=> b!841956 m!785227))

(declare-fun m!785229 () Bool)

(assert (=> start!72540 m!785229))

(declare-fun m!785231 () Bool)

(assert (=> start!72540 m!785231))

(declare-fun m!785233 () Bool)

(assert (=> bm!37405 m!785233))

(declare-fun m!785235 () Bool)

(assert (=> mapNonEmpty!24986 m!785235))

(declare-fun m!785237 () Bool)

(assert (=> b!841958 m!785237))

(declare-fun m!785239 () Bool)

(assert (=> b!841960 m!785239))

(declare-fun m!785241 () Bool)

(assert (=> b!841961 m!785241))

(declare-fun m!785243 () Bool)

(assert (=> b!841957 m!785243))

(check-sat tp_is_empty!15591 (not b_next!13725) (not mapNonEmpty!24986) (not b!841961) (not b!841958) (not b!841960) (not bm!37406) b_and!22811 (not b!841956) (not bm!37405) (not b!841950) (not start!72540) (not b!841957))
(check-sat b_and!22811 (not b_next!13725))
