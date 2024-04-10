; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72468 () Bool)

(assert start!72468)

(declare-fun b_free!13653 () Bool)

(declare-fun b_next!13653 () Bool)

(assert (=> start!72468 (= b_free!13653 (not b_next!13653))))

(declare-fun tp!48058 () Bool)

(declare-fun b_and!22739 () Bool)

(assert (=> start!72468 (= tp!48058 b_and!22739)))

(declare-fun b!840545 () Bool)

(declare-fun e!468989 () Bool)

(declare-fun tp_is_empty!15519 () Bool)

(assert (=> b!840545 (= e!468989 tp_is_empty!15519)))

(declare-fun b!840546 () Bool)

(declare-fun res!571427 () Bool)

(declare-fun e!468994 () Bool)

(assert (=> b!840546 (=> (not res!571427) (not e!468994))))

(declare-datatypes ((array!47316 0))(
  ( (array!47317 (arr!22689 (Array (_ BitVec 32) (_ BitVec 64))) (size!23129 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47316)

(declare-datatypes ((List!16138 0))(
  ( (Nil!16135) (Cons!16134 (h!17265 (_ BitVec 64)) (t!22509 List!16138)) )
))
(declare-fun arrayNoDuplicates!0 (array!47316 (_ BitVec 32) List!16138) Bool)

(assert (=> b!840546 (= res!571427 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16135))))

(declare-fun b!840547 () Bool)

(assert (=> b!840547 (= e!468994 (not true))))

(declare-fun e!468993 () Bool)

(assert (=> b!840547 e!468993))

(declare-fun c!91339 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!840547 (= c!91339 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25739 0))(
  ( (V!25740 (val!7807 Int)) )
))
(declare-fun v!557 () V!25739)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7320 0))(
  ( (ValueCellFull!7320 (v!10232 V!25739)) (EmptyCell!7320) )
))
(declare-datatypes ((array!47318 0))(
  ( (array!47319 (arr!22690 (Array (_ BitVec 32) ValueCell!7320)) (size!23130 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47318)

(declare-fun minValue!654 () V!25739)

(declare-fun zeroValue!654 () V!25739)

(declare-datatypes ((Unit!28869 0))(
  ( (Unit!28870) )
))
(declare-fun lt!380845 () Unit!28869)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!280 (array!47316 array!47318 (_ BitVec 32) (_ BitVec 32) V!25739 V!25739 (_ BitVec 32) (_ BitVec 64) V!25739 (_ BitVec 32) Int) Unit!28869)

(assert (=> b!840547 (= lt!380845 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!280 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((tuple2!10348 0))(
  ( (tuple2!10349 (_1!5185 (_ BitVec 64)) (_2!5185 V!25739)) )
))
(declare-datatypes ((List!16139 0))(
  ( (Nil!16136) (Cons!16135 (h!17266 tuple2!10348) (t!22510 List!16139)) )
))
(declare-datatypes ((ListLongMap!9117 0))(
  ( (ListLongMap!9118 (toList!4574 List!16139)) )
))
(declare-fun call!37192 () ListLongMap!9117)

(declare-fun b!840548 () Bool)

(declare-fun call!37193 () ListLongMap!9117)

(declare-fun +!2043 (ListLongMap!9117 tuple2!10348) ListLongMap!9117)

(assert (=> b!840548 (= e!468993 (= call!37193 (+!2043 call!37192 (tuple2!10349 k0!854 v!557))))))

(declare-fun b!840549 () Bool)

(declare-fun e!468991 () Bool)

(assert (=> b!840549 (= e!468991 tp_is_empty!15519)))

(declare-fun b!840550 () Bool)

(declare-fun e!468990 () Bool)

(declare-fun mapRes!24878 () Bool)

(assert (=> b!840550 (= e!468990 (and e!468991 mapRes!24878))))

(declare-fun condMapEmpty!24878 () Bool)

(declare-fun mapDefault!24878 () ValueCell!7320)

(assert (=> b!840550 (= condMapEmpty!24878 (= (arr!22690 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7320)) mapDefault!24878)))))

(declare-fun b!840551 () Bool)

(declare-fun res!571433 () Bool)

(assert (=> b!840551 (=> (not res!571433) (not e!468994))))

(assert (=> b!840551 (= res!571433 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23129 _keys!868))))))

(declare-fun b!840552 () Bool)

(declare-fun res!571426 () Bool)

(assert (=> b!840552 (=> (not res!571426) (not e!468994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840552 (= res!571426 (validMask!0 mask!1196))))

(declare-fun b!840553 () Bool)

(declare-fun res!571429 () Bool)

(assert (=> b!840553 (=> (not res!571429) (not e!468994))))

(assert (=> b!840553 (= res!571429 (and (= (select (arr!22689 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23129 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840554 () Bool)

(declare-fun res!571428 () Bool)

(assert (=> b!840554 (=> (not res!571428) (not e!468994))))

(assert (=> b!840554 (= res!571428 (and (= (size!23130 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23129 _keys!868) (size!23130 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840555 () Bool)

(declare-fun res!571430 () Bool)

(assert (=> b!840555 (=> (not res!571430) (not e!468994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840555 (= res!571430 (validKeyInArray!0 k0!854))))

(declare-fun bm!37189 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2561 (array!47316 array!47318 (_ BitVec 32) (_ BitVec 32) V!25739 V!25739 (_ BitVec 32) Int) ListLongMap!9117)

(assert (=> bm!37189 (= call!37193 (getCurrentListMapNoExtraKeys!2561 _keys!868 (array!47319 (store (arr!22690 _values!688) i!612 (ValueCellFull!7320 v!557)) (size!23130 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!571432 () Bool)

(assert (=> start!72468 (=> (not res!571432) (not e!468994))))

(assert (=> start!72468 (= res!571432 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23129 _keys!868))))))

(assert (=> start!72468 e!468994))

(assert (=> start!72468 tp_is_empty!15519))

(assert (=> start!72468 true))

(assert (=> start!72468 tp!48058))

(declare-fun array_inv!18062 (array!47316) Bool)

(assert (=> start!72468 (array_inv!18062 _keys!868)))

(declare-fun array_inv!18063 (array!47318) Bool)

(assert (=> start!72468 (and (array_inv!18063 _values!688) e!468990)))

(declare-fun b!840556 () Bool)

(declare-fun res!571431 () Bool)

(assert (=> b!840556 (=> (not res!571431) (not e!468994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47316 (_ BitVec 32)) Bool)

(assert (=> b!840556 (= res!571431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24878 () Bool)

(declare-fun tp!48057 () Bool)

(assert (=> mapNonEmpty!24878 (= mapRes!24878 (and tp!48057 e!468989))))

(declare-fun mapRest!24878 () (Array (_ BitVec 32) ValueCell!7320))

(declare-fun mapValue!24878 () ValueCell!7320)

(declare-fun mapKey!24878 () (_ BitVec 32))

(assert (=> mapNonEmpty!24878 (= (arr!22690 _values!688) (store mapRest!24878 mapKey!24878 mapValue!24878))))

(declare-fun bm!37190 () Bool)

(assert (=> bm!37190 (= call!37192 (getCurrentListMapNoExtraKeys!2561 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24878 () Bool)

(assert (=> mapIsEmpty!24878 mapRes!24878))

(declare-fun b!840557 () Bool)

(assert (=> b!840557 (= e!468993 (= call!37193 call!37192))))

(assert (= (and start!72468 res!571432) b!840552))

(assert (= (and b!840552 res!571426) b!840554))

(assert (= (and b!840554 res!571428) b!840556))

(assert (= (and b!840556 res!571431) b!840546))

(assert (= (and b!840546 res!571427) b!840551))

(assert (= (and b!840551 res!571433) b!840555))

(assert (= (and b!840555 res!571430) b!840553))

(assert (= (and b!840553 res!571429) b!840547))

(assert (= (and b!840547 c!91339) b!840548))

(assert (= (and b!840547 (not c!91339)) b!840557))

(assert (= (or b!840548 b!840557) bm!37189))

(assert (= (or b!840548 b!840557) bm!37190))

(assert (= (and b!840550 condMapEmpty!24878) mapIsEmpty!24878))

(assert (= (and b!840550 (not condMapEmpty!24878)) mapNonEmpty!24878))

(get-info :version)

(assert (= (and mapNonEmpty!24878 ((_ is ValueCellFull!7320) mapValue!24878)) b!840545))

(assert (= (and b!840550 ((_ is ValueCellFull!7320) mapDefault!24878)) b!840549))

(assert (= start!72468 b!840550))

(declare-fun m!784283 () Bool)

(assert (=> b!840553 m!784283))

(declare-fun m!784285 () Bool)

(assert (=> b!840555 m!784285))

(declare-fun m!784287 () Bool)

(assert (=> b!840546 m!784287))

(declare-fun m!784289 () Bool)

(assert (=> b!840548 m!784289))

(declare-fun m!784291 () Bool)

(assert (=> b!840552 m!784291))

(declare-fun m!784293 () Bool)

(assert (=> mapNonEmpty!24878 m!784293))

(declare-fun m!784295 () Bool)

(assert (=> start!72468 m!784295))

(declare-fun m!784297 () Bool)

(assert (=> start!72468 m!784297))

(declare-fun m!784299 () Bool)

(assert (=> b!840556 m!784299))

(declare-fun m!784301 () Bool)

(assert (=> b!840547 m!784301))

(declare-fun m!784303 () Bool)

(assert (=> bm!37189 m!784303))

(declare-fun m!784305 () Bool)

(assert (=> bm!37189 m!784305))

(declare-fun m!784307 () Bool)

(assert (=> bm!37190 m!784307))

(check-sat (not b!840552) (not b!840546) (not b!840548) (not bm!37190) (not b!840556) (not b!840555) (not b!840547) (not mapNonEmpty!24878) (not bm!37189) (not start!72468) tp_is_empty!15519 (not b_next!13653) b_and!22739)
(check-sat b_and!22739 (not b_next!13653))
