; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72462 () Bool)

(assert start!72462)

(declare-fun b_free!13647 () Bool)

(declare-fun b_next!13647 () Bool)

(assert (=> start!72462 (= b_free!13647 (not b_next!13647))))

(declare-fun tp!48040 () Bool)

(declare-fun b_and!22733 () Bool)

(assert (=> start!72462 (= tp!48040 b_and!22733)))

(declare-fun b!840428 () Bool)

(declare-fun e!468937 () Bool)

(assert (=> b!840428 (= e!468937 (not true))))

(declare-fun e!468936 () Bool)

(assert (=> b!840428 e!468936))

(declare-fun c!91330 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!840428 (= c!91330 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25731 0))(
  ( (V!25732 (val!7804 Int)) )
))
(declare-fun v!557 () V!25731)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28865 0))(
  ( (Unit!28866) )
))
(declare-fun lt!380836 () Unit!28865)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!47304 0))(
  ( (array!47305 (arr!22683 (Array (_ BitVec 32) (_ BitVec 64))) (size!23123 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47304)

(declare-datatypes ((ValueCell!7317 0))(
  ( (ValueCellFull!7317 (v!10229 V!25731)) (EmptyCell!7317) )
))
(declare-datatypes ((array!47306 0))(
  ( (array!47307 (arr!22684 (Array (_ BitVec 32) ValueCell!7317)) (size!23124 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47306)

(declare-fun minValue!654 () V!25731)

(declare-fun zeroValue!654 () V!25731)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!278 (array!47304 array!47306 (_ BitVec 32) (_ BitVec 32) V!25731 V!25731 (_ BitVec 32) (_ BitVec 64) V!25731 (_ BitVec 32) Int) Unit!28865)

(assert (=> b!840428 (= lt!380836 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!278 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840429 () Bool)

(declare-fun res!571360 () Bool)

(assert (=> b!840429 (=> (not res!571360) (not e!468937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840429 (= res!571360 (validMask!0 mask!1196))))

(declare-fun b!840430 () Bool)

(declare-datatypes ((tuple2!10342 0))(
  ( (tuple2!10343 (_1!5182 (_ BitVec 64)) (_2!5182 V!25731)) )
))
(declare-datatypes ((List!16133 0))(
  ( (Nil!16130) (Cons!16129 (h!17260 tuple2!10342) (t!22504 List!16133)) )
))
(declare-datatypes ((ListLongMap!9111 0))(
  ( (ListLongMap!9112 (toList!4571 List!16133)) )
))
(declare-fun call!37174 () ListLongMap!9111)

(declare-fun call!37175 () ListLongMap!9111)

(assert (=> b!840430 (= e!468936 (= call!37174 call!37175))))

(declare-fun b!840431 () Bool)

(declare-fun res!571358 () Bool)

(assert (=> b!840431 (=> (not res!571358) (not e!468937))))

(assert (=> b!840431 (= res!571358 (and (= (size!23124 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23123 _keys!868) (size!23124 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840432 () Bool)

(declare-fun res!571354 () Bool)

(assert (=> b!840432 (=> (not res!571354) (not e!468937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47304 (_ BitVec 32)) Bool)

(assert (=> b!840432 (= res!571354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840433 () Bool)

(declare-fun e!468938 () Bool)

(declare-fun e!468935 () Bool)

(declare-fun mapRes!24869 () Bool)

(assert (=> b!840433 (= e!468938 (and e!468935 mapRes!24869))))

(declare-fun condMapEmpty!24869 () Bool)

(declare-fun mapDefault!24869 () ValueCell!7317)

(assert (=> b!840433 (= condMapEmpty!24869 (= (arr!22684 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7317)) mapDefault!24869)))))

(declare-fun b!840434 () Bool)

(declare-fun +!2040 (ListLongMap!9111 tuple2!10342) ListLongMap!9111)

(assert (=> b!840434 (= e!468936 (= call!37174 (+!2040 call!37175 (tuple2!10343 k0!854 v!557))))))

(declare-fun b!840435 () Bool)

(declare-fun res!571359 () Bool)

(assert (=> b!840435 (=> (not res!571359) (not e!468937))))

(declare-datatypes ((List!16134 0))(
  ( (Nil!16131) (Cons!16130 (h!17261 (_ BitVec 64)) (t!22505 List!16134)) )
))
(declare-fun arrayNoDuplicates!0 (array!47304 (_ BitVec 32) List!16134) Bool)

(assert (=> b!840435 (= res!571359 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16131))))

(declare-fun b!840436 () Bool)

(declare-fun e!468940 () Bool)

(declare-fun tp_is_empty!15513 () Bool)

(assert (=> b!840436 (= e!468940 tp_is_empty!15513)))

(declare-fun bm!37171 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2559 (array!47304 array!47306 (_ BitVec 32) (_ BitVec 32) V!25731 V!25731 (_ BitVec 32) Int) ListLongMap!9111)

(assert (=> bm!37171 (= call!37174 (getCurrentListMapNoExtraKeys!2559 _keys!868 (array!47307 (store (arr!22684 _values!688) i!612 (ValueCellFull!7317 v!557)) (size!23124 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840437 () Bool)

(declare-fun res!571355 () Bool)

(assert (=> b!840437 (=> (not res!571355) (not e!468937))))

(assert (=> b!840437 (= res!571355 (and (= (select (arr!22683 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23123 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840438 () Bool)

(declare-fun res!571356 () Bool)

(assert (=> b!840438 (=> (not res!571356) (not e!468937))))

(assert (=> b!840438 (= res!571356 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23123 _keys!868))))))

(declare-fun res!571357 () Bool)

(assert (=> start!72462 (=> (not res!571357) (not e!468937))))

(assert (=> start!72462 (= res!571357 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23123 _keys!868))))))

(assert (=> start!72462 e!468937))

(assert (=> start!72462 tp_is_empty!15513))

(assert (=> start!72462 true))

(assert (=> start!72462 tp!48040))

(declare-fun array_inv!18058 (array!47304) Bool)

(assert (=> start!72462 (array_inv!18058 _keys!868)))

(declare-fun array_inv!18059 (array!47306) Bool)

(assert (=> start!72462 (and (array_inv!18059 _values!688) e!468938)))

(declare-fun b!840439 () Bool)

(declare-fun res!571361 () Bool)

(assert (=> b!840439 (=> (not res!571361) (not e!468937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840439 (= res!571361 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!24869 () Bool)

(assert (=> mapIsEmpty!24869 mapRes!24869))

(declare-fun mapNonEmpty!24869 () Bool)

(declare-fun tp!48039 () Bool)

(assert (=> mapNonEmpty!24869 (= mapRes!24869 (and tp!48039 e!468940))))

(declare-fun mapKey!24869 () (_ BitVec 32))

(declare-fun mapRest!24869 () (Array (_ BitVec 32) ValueCell!7317))

(declare-fun mapValue!24869 () ValueCell!7317)

(assert (=> mapNonEmpty!24869 (= (arr!22684 _values!688) (store mapRest!24869 mapKey!24869 mapValue!24869))))

(declare-fun bm!37172 () Bool)

(assert (=> bm!37172 (= call!37175 (getCurrentListMapNoExtraKeys!2559 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840440 () Bool)

(assert (=> b!840440 (= e!468935 tp_is_empty!15513)))

(assert (= (and start!72462 res!571357) b!840429))

(assert (= (and b!840429 res!571360) b!840431))

(assert (= (and b!840431 res!571358) b!840432))

(assert (= (and b!840432 res!571354) b!840435))

(assert (= (and b!840435 res!571359) b!840438))

(assert (= (and b!840438 res!571356) b!840439))

(assert (= (and b!840439 res!571361) b!840437))

(assert (= (and b!840437 res!571355) b!840428))

(assert (= (and b!840428 c!91330) b!840434))

(assert (= (and b!840428 (not c!91330)) b!840430))

(assert (= (or b!840434 b!840430) bm!37171))

(assert (= (or b!840434 b!840430) bm!37172))

(assert (= (and b!840433 condMapEmpty!24869) mapIsEmpty!24869))

(assert (= (and b!840433 (not condMapEmpty!24869)) mapNonEmpty!24869))

(get-info :version)

(assert (= (and mapNonEmpty!24869 ((_ is ValueCellFull!7317) mapValue!24869)) b!840436))

(assert (= (and b!840433 ((_ is ValueCellFull!7317) mapDefault!24869)) b!840440))

(assert (= start!72462 b!840433))

(declare-fun m!784205 () Bool)

(assert (=> b!840439 m!784205))

(declare-fun m!784207 () Bool)

(assert (=> b!840437 m!784207))

(declare-fun m!784209 () Bool)

(assert (=> b!840429 m!784209))

(declare-fun m!784211 () Bool)

(assert (=> mapNonEmpty!24869 m!784211))

(declare-fun m!784213 () Bool)

(assert (=> b!840432 m!784213))

(declare-fun m!784215 () Bool)

(assert (=> start!72462 m!784215))

(declare-fun m!784217 () Bool)

(assert (=> start!72462 m!784217))

(declare-fun m!784219 () Bool)

(assert (=> b!840428 m!784219))

(declare-fun m!784221 () Bool)

(assert (=> b!840435 m!784221))

(declare-fun m!784223 () Bool)

(assert (=> bm!37172 m!784223))

(declare-fun m!784225 () Bool)

(assert (=> bm!37171 m!784225))

(declare-fun m!784227 () Bool)

(assert (=> bm!37171 m!784227))

(declare-fun m!784229 () Bool)

(assert (=> b!840434 m!784229))

(check-sat tp_is_empty!15513 b_and!22733 (not b!840432) (not b!840434) (not b_next!13647) (not b!840428) (not b!840429) (not start!72462) (not b!840435) (not bm!37172) (not bm!37171) (not b!840439) (not mapNonEmpty!24869))
(check-sat b_and!22733 (not b_next!13647))
