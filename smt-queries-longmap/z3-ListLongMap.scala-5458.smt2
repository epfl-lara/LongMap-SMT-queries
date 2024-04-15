; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72514 () Bool)

(assert start!72514)

(declare-fun b_free!13717 () Bool)

(declare-fun b_next!13717 () Bool)

(assert (=> start!72514 (= b_free!13717 (not b_next!13717))))

(declare-fun tp!48251 () Bool)

(declare-fun b_and!22777 () Bool)

(assert (=> start!72514 (= tp!48251 b_and!22777)))

(declare-fun b!841554 () Bool)

(declare-fun res!572084 () Bool)

(declare-fun e!469419 () Bool)

(assert (=> b!841554 (=> (not res!572084) (not e!469419))))

(declare-datatypes ((array!47419 0))(
  ( (array!47420 (arr!22741 (Array (_ BitVec 32) (_ BitVec 64))) (size!23183 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47419)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47419 (_ BitVec 32)) Bool)

(assert (=> b!841554 (= res!572084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841556 () Bool)

(declare-fun e!469420 () Bool)

(declare-datatypes ((V!25825 0))(
  ( (V!25826 (val!7839 Int)) )
))
(declare-datatypes ((tuple2!10424 0))(
  ( (tuple2!10425 (_1!5223 (_ BitVec 64)) (_2!5223 V!25825)) )
))
(declare-datatypes ((List!16195 0))(
  ( (Nil!16192) (Cons!16191 (h!17322 tuple2!10424) (t!22557 List!16195)) )
))
(declare-datatypes ((ListLongMap!9183 0))(
  ( (ListLongMap!9184 (toList!4607 List!16195)) )
))
(declare-fun call!37359 () ListLongMap!9183)

(declare-fun call!37358 () ListLongMap!9183)

(assert (=> b!841556 (= e!469420 (= call!37359 call!37358))))

(declare-fun mapNonEmpty!24974 () Bool)

(declare-fun mapRes!24974 () Bool)

(declare-fun tp!48250 () Bool)

(declare-fun e!469421 () Bool)

(assert (=> mapNonEmpty!24974 (= mapRes!24974 (and tp!48250 e!469421))))

(declare-datatypes ((ValueCell!7352 0))(
  ( (ValueCellFull!7352 (v!10258 V!25825)) (EmptyCell!7352) )
))
(declare-fun mapValue!24974 () ValueCell!7352)

(declare-fun mapKey!24974 () (_ BitVec 32))

(declare-datatypes ((array!47421 0))(
  ( (array!47422 (arr!22742 (Array (_ BitVec 32) ValueCell!7352)) (size!23184 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47421)

(declare-fun mapRest!24974 () (Array (_ BitVec 32) ValueCell!7352))

(assert (=> mapNonEmpty!24974 (= (arr!22742 _values!688) (store mapRest!24974 mapKey!24974 mapValue!24974))))

(declare-fun b!841557 () Bool)

(declare-fun e!469417 () Bool)

(declare-fun e!469422 () Bool)

(assert (=> b!841557 (= e!469417 (and e!469422 mapRes!24974))))

(declare-fun condMapEmpty!24974 () Bool)

(declare-fun mapDefault!24974 () ValueCell!7352)

(assert (=> b!841557 (= condMapEmpty!24974 (= (arr!22742 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7352)) mapDefault!24974)))))

(declare-fun b!841558 () Bool)

(assert (=> b!841558 (= e!469419 (not true))))

(assert (=> b!841558 e!469420))

(declare-fun c!91370 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841558 (= c!91370 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25825)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!28859 0))(
  ( (Unit!28860) )
))
(declare-fun lt!380705 () Unit!28859)

(declare-fun minValue!654 () V!25825)

(declare-fun zeroValue!654 () V!25825)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!304 (array!47419 array!47421 (_ BitVec 32) (_ BitVec 32) V!25825 V!25825 (_ BitVec 32) (_ BitVec 64) V!25825 (_ BitVec 32) Int) Unit!28859)

(assert (=> b!841558 (= lt!380705 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!304 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37355 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2623 (array!47419 array!47421 (_ BitVec 32) (_ BitVec 32) V!25825 V!25825 (_ BitVec 32) Int) ListLongMap!9183)

(assert (=> bm!37355 (= call!37358 (getCurrentListMapNoExtraKeys!2623 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841559 () Bool)

(declare-fun tp_is_empty!15583 () Bool)

(assert (=> b!841559 (= e!469421 tp_is_empty!15583)))

(declare-fun bm!37356 () Bool)

(assert (=> bm!37356 (= call!37359 (getCurrentListMapNoExtraKeys!2623 _keys!868 (array!47422 (store (arr!22742 _values!688) i!612 (ValueCellFull!7352 v!557)) (size!23184 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841560 () Bool)

(declare-fun res!572089 () Bool)

(assert (=> b!841560 (=> (not res!572089) (not e!469419))))

(assert (=> b!841560 (= res!572089 (and (= (size!23184 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23183 _keys!868) (size!23184 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!24974 () Bool)

(assert (=> mapIsEmpty!24974 mapRes!24974))

(declare-fun b!841561 () Bool)

(declare-fun res!572086 () Bool)

(assert (=> b!841561 (=> (not res!572086) (not e!469419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841561 (= res!572086 (validKeyInArray!0 k0!854))))

(declare-fun b!841562 () Bool)

(declare-fun res!572087 () Bool)

(assert (=> b!841562 (=> (not res!572087) (not e!469419))))

(declare-datatypes ((List!16196 0))(
  ( (Nil!16193) (Cons!16192 (h!17323 (_ BitVec 64)) (t!22558 List!16196)) )
))
(declare-fun arrayNoDuplicates!0 (array!47419 (_ BitVec 32) List!16196) Bool)

(assert (=> b!841562 (= res!572087 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16193))))

(declare-fun b!841563 () Bool)

(declare-fun res!572088 () Bool)

(assert (=> b!841563 (=> (not res!572088) (not e!469419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841563 (= res!572088 (validMask!0 mask!1196))))

(declare-fun b!841564 () Bool)

(assert (=> b!841564 (= e!469422 tp_is_empty!15583)))

(declare-fun res!572091 () Bool)

(assert (=> start!72514 (=> (not res!572091) (not e!469419))))

(assert (=> start!72514 (= res!572091 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23183 _keys!868))))))

(assert (=> start!72514 e!469419))

(assert (=> start!72514 tp_is_empty!15583))

(assert (=> start!72514 true))

(assert (=> start!72514 tp!48251))

(declare-fun array_inv!18172 (array!47419) Bool)

(assert (=> start!72514 (array_inv!18172 _keys!868)))

(declare-fun array_inv!18173 (array!47421) Bool)

(assert (=> start!72514 (and (array_inv!18173 _values!688) e!469417)))

(declare-fun b!841555 () Bool)

(declare-fun +!2086 (ListLongMap!9183 tuple2!10424) ListLongMap!9183)

(assert (=> b!841555 (= e!469420 (= call!37359 (+!2086 call!37358 (tuple2!10425 k0!854 v!557))))))

(declare-fun b!841565 () Bool)

(declare-fun res!572090 () Bool)

(assert (=> b!841565 (=> (not res!572090) (not e!469419))))

(assert (=> b!841565 (= res!572090 (and (= (select (arr!22741 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23183 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841566 () Bool)

(declare-fun res!572085 () Bool)

(assert (=> b!841566 (=> (not res!572085) (not e!469419))))

(assert (=> b!841566 (= res!572085 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23183 _keys!868))))))

(assert (= (and start!72514 res!572091) b!841563))

(assert (= (and b!841563 res!572088) b!841560))

(assert (= (and b!841560 res!572089) b!841554))

(assert (= (and b!841554 res!572084) b!841562))

(assert (= (and b!841562 res!572087) b!841566))

(assert (= (and b!841566 res!572085) b!841561))

(assert (= (and b!841561 res!572086) b!841565))

(assert (= (and b!841565 res!572090) b!841558))

(assert (= (and b!841558 c!91370) b!841555))

(assert (= (and b!841558 (not c!91370)) b!841556))

(assert (= (or b!841555 b!841556) bm!37356))

(assert (= (or b!841555 b!841556) bm!37355))

(assert (= (and b!841557 condMapEmpty!24974) mapIsEmpty!24974))

(assert (= (and b!841557 (not condMapEmpty!24974)) mapNonEmpty!24974))

(get-info :version)

(assert (= (and mapNonEmpty!24974 ((_ is ValueCellFull!7352) mapValue!24974)) b!841559))

(assert (= (and b!841557 ((_ is ValueCellFull!7352) mapDefault!24974)) b!841564))

(assert (= start!72514 b!841557))

(declare-fun m!784361 () Bool)

(assert (=> bm!37356 m!784361))

(declare-fun m!784363 () Bool)

(assert (=> bm!37356 m!784363))

(declare-fun m!784365 () Bool)

(assert (=> b!841554 m!784365))

(declare-fun m!784367 () Bool)

(assert (=> b!841558 m!784367))

(declare-fun m!784369 () Bool)

(assert (=> mapNonEmpty!24974 m!784369))

(declare-fun m!784371 () Bool)

(assert (=> start!72514 m!784371))

(declare-fun m!784373 () Bool)

(assert (=> start!72514 m!784373))

(declare-fun m!784375 () Bool)

(assert (=> b!841562 m!784375))

(declare-fun m!784377 () Bool)

(assert (=> b!841561 m!784377))

(declare-fun m!784379 () Bool)

(assert (=> b!841555 m!784379))

(declare-fun m!784381 () Bool)

(assert (=> bm!37355 m!784381))

(declare-fun m!784383 () Bool)

(assert (=> b!841565 m!784383))

(declare-fun m!784385 () Bool)

(assert (=> b!841563 m!784385))

(check-sat (not b!841562) (not b!841558) b_and!22777 tp_is_empty!15583 (not b_next!13717) (not b!841563) (not mapNonEmpty!24974) (not b!841561) (not b!841554) (not bm!37355) (not bm!37356) (not b!841555) (not start!72514))
(check-sat b_and!22777 (not b_next!13717))
