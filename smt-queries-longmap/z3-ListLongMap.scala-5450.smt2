; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72466 () Bool)

(assert start!72466)

(declare-fun b_free!13669 () Bool)

(declare-fun b_next!13669 () Bool)

(assert (=> start!72466 (= b_free!13669 (not b_next!13669))))

(declare-fun tp!48107 () Bool)

(declare-fun b_and!22729 () Bool)

(assert (=> start!72466 (= tp!48107 b_and!22729)))

(declare-fun b!840618 () Bool)

(declare-fun e!468990 () Bool)

(assert (=> b!840618 (= e!468990 (not true))))

(declare-fun e!468988 () Bool)

(assert (=> b!840618 e!468988))

(declare-fun c!91298 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!840618 (= c!91298 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25761 0))(
  ( (V!25762 (val!7815 Int)) )
))
(declare-fun v!557 () V!25761)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28829 0))(
  ( (Unit!28830) )
))
(declare-fun lt!380633 () Unit!28829)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!47325 0))(
  ( (array!47326 (arr!22694 (Array (_ BitVec 32) (_ BitVec 64))) (size!23136 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47325)

(declare-datatypes ((ValueCell!7328 0))(
  ( (ValueCellFull!7328 (v!10234 V!25761)) (EmptyCell!7328) )
))
(declare-datatypes ((array!47327 0))(
  ( (array!47328 (arr!22695 (Array (_ BitVec 32) ValueCell!7328)) (size!23137 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47327)

(declare-fun minValue!654 () V!25761)

(declare-fun zeroValue!654 () V!25761)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!289 (array!47325 array!47327 (_ BitVec 32) (_ BitVec 32) V!25761 V!25761 (_ BitVec 32) (_ BitVec 64) V!25761 (_ BitVec 32) Int) Unit!28829)

(assert (=> b!840618 (= lt!380633 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!289 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24902 () Bool)

(declare-fun mapRes!24902 () Bool)

(assert (=> mapIsEmpty!24902 mapRes!24902))

(declare-fun b!840619 () Bool)

(declare-fun res!571511 () Bool)

(assert (=> b!840619 (=> (not res!571511) (not e!468990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840619 (= res!571511 (validKeyInArray!0 k0!854))))

(declare-fun b!840620 () Bool)

(declare-fun e!468985 () Bool)

(declare-fun tp_is_empty!15535 () Bool)

(assert (=> b!840620 (= e!468985 tp_is_empty!15535)))

(declare-fun b!840621 () Bool)

(declare-fun res!571510 () Bool)

(assert (=> b!840621 (=> (not res!571510) (not e!468990))))

(declare-datatypes ((List!16156 0))(
  ( (Nil!16153) (Cons!16152 (h!17283 (_ BitVec 64)) (t!22518 List!16156)) )
))
(declare-fun arrayNoDuplicates!0 (array!47325 (_ BitVec 32) List!16156) Bool)

(assert (=> b!840621 (= res!571510 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16153))))

(declare-datatypes ((tuple2!10380 0))(
  ( (tuple2!10381 (_1!5201 (_ BitVec 64)) (_2!5201 V!25761)) )
))
(declare-datatypes ((List!16157 0))(
  ( (Nil!16154) (Cons!16153 (h!17284 tuple2!10380) (t!22519 List!16157)) )
))
(declare-datatypes ((ListLongMap!9139 0))(
  ( (ListLongMap!9140 (toList!4585 List!16157)) )
))
(declare-fun call!37214 () ListLongMap!9139)

(declare-fun b!840622 () Bool)

(declare-fun call!37215 () ListLongMap!9139)

(declare-fun +!2071 (ListLongMap!9139 tuple2!10380) ListLongMap!9139)

(assert (=> b!840622 (= e!468988 (= call!37214 (+!2071 call!37215 (tuple2!10381 k0!854 v!557))))))

(declare-fun res!571508 () Bool)

(assert (=> start!72466 (=> (not res!571508) (not e!468990))))

(assert (=> start!72466 (= res!571508 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23136 _keys!868))))))

(assert (=> start!72466 e!468990))

(assert (=> start!72466 tp_is_empty!15535))

(assert (=> start!72466 true))

(assert (=> start!72466 tp!48107))

(declare-fun array_inv!18140 (array!47325) Bool)

(assert (=> start!72466 (array_inv!18140 _keys!868)))

(declare-fun e!468989 () Bool)

(declare-fun array_inv!18141 (array!47327) Bool)

(assert (=> start!72466 (and (array_inv!18141 _values!688) e!468989)))

(declare-fun mapNonEmpty!24902 () Bool)

(declare-fun tp!48106 () Bool)

(assert (=> mapNonEmpty!24902 (= mapRes!24902 (and tp!48106 e!468985))))

(declare-fun mapKey!24902 () (_ BitVec 32))

(declare-fun mapRest!24902 () (Array (_ BitVec 32) ValueCell!7328))

(declare-fun mapValue!24902 () ValueCell!7328)

(assert (=> mapNonEmpty!24902 (= (arr!22695 _values!688) (store mapRest!24902 mapKey!24902 mapValue!24902))))

(declare-fun b!840623 () Bool)

(assert (=> b!840623 (= e!468988 (= call!37214 call!37215))))

(declare-fun bm!37211 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2602 (array!47325 array!47327 (_ BitVec 32) (_ BitVec 32) V!25761 V!25761 (_ BitVec 32) Int) ListLongMap!9139)

(assert (=> bm!37211 (= call!37214 (getCurrentListMapNoExtraKeys!2602 _keys!868 (array!47328 (store (arr!22695 _values!688) i!612 (ValueCellFull!7328 v!557)) (size!23137 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840624 () Bool)

(declare-fun e!468987 () Bool)

(assert (=> b!840624 (= e!468987 tp_is_empty!15535)))

(declare-fun bm!37212 () Bool)

(assert (=> bm!37212 (= call!37215 (getCurrentListMapNoExtraKeys!2602 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840625 () Bool)

(declare-fun res!571512 () Bool)

(assert (=> b!840625 (=> (not res!571512) (not e!468990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840625 (= res!571512 (validMask!0 mask!1196))))

(declare-fun b!840626 () Bool)

(assert (=> b!840626 (= e!468989 (and e!468987 mapRes!24902))))

(declare-fun condMapEmpty!24902 () Bool)

(declare-fun mapDefault!24902 () ValueCell!7328)

(assert (=> b!840626 (= condMapEmpty!24902 (= (arr!22695 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7328)) mapDefault!24902)))))

(declare-fun b!840627 () Bool)

(declare-fun res!571509 () Bool)

(assert (=> b!840627 (=> (not res!571509) (not e!468990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47325 (_ BitVec 32)) Bool)

(assert (=> b!840627 (= res!571509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840628 () Bool)

(declare-fun res!571513 () Bool)

(assert (=> b!840628 (=> (not res!571513) (not e!468990))))

(assert (=> b!840628 (= res!571513 (and (= (size!23137 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23136 _keys!868) (size!23137 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840629 () Bool)

(declare-fun res!571515 () Bool)

(assert (=> b!840629 (=> (not res!571515) (not e!468990))))

(assert (=> b!840629 (= res!571515 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23136 _keys!868))))))

(declare-fun b!840630 () Bool)

(declare-fun res!571514 () Bool)

(assert (=> b!840630 (=> (not res!571514) (not e!468990))))

(assert (=> b!840630 (= res!571514 (and (= (select (arr!22694 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23136 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(assert (= (and start!72466 res!571508) b!840625))

(assert (= (and b!840625 res!571512) b!840628))

(assert (= (and b!840628 res!571513) b!840627))

(assert (= (and b!840627 res!571509) b!840621))

(assert (= (and b!840621 res!571510) b!840629))

(assert (= (and b!840629 res!571515) b!840619))

(assert (= (and b!840619 res!571511) b!840630))

(assert (= (and b!840630 res!571514) b!840618))

(assert (= (and b!840618 c!91298) b!840622))

(assert (= (and b!840618 (not c!91298)) b!840623))

(assert (= (or b!840622 b!840623) bm!37211))

(assert (= (or b!840622 b!840623) bm!37212))

(assert (= (and b!840626 condMapEmpty!24902) mapIsEmpty!24902))

(assert (= (and b!840626 (not condMapEmpty!24902)) mapNonEmpty!24902))

(get-info :version)

(assert (= (and mapNonEmpty!24902 ((_ is ValueCellFull!7328) mapValue!24902)) b!840620))

(assert (= (and b!840626 ((_ is ValueCellFull!7328) mapDefault!24902)) b!840624))

(assert (= start!72466 b!840626))

(declare-fun m!783737 () Bool)

(assert (=> b!840625 m!783737))

(declare-fun m!783739 () Bool)

(assert (=> mapNonEmpty!24902 m!783739))

(declare-fun m!783741 () Bool)

(assert (=> b!840621 m!783741))

(declare-fun m!783743 () Bool)

(assert (=> bm!37211 m!783743))

(declare-fun m!783745 () Bool)

(assert (=> bm!37211 m!783745))

(declare-fun m!783747 () Bool)

(assert (=> b!840619 m!783747))

(declare-fun m!783749 () Bool)

(assert (=> b!840622 m!783749))

(declare-fun m!783751 () Bool)

(assert (=> bm!37212 m!783751))

(declare-fun m!783753 () Bool)

(assert (=> start!72466 m!783753))

(declare-fun m!783755 () Bool)

(assert (=> start!72466 m!783755))

(declare-fun m!783757 () Bool)

(assert (=> b!840630 m!783757))

(declare-fun m!783759 () Bool)

(assert (=> b!840627 m!783759))

(declare-fun m!783761 () Bool)

(assert (=> b!840618 m!783761))

(check-sat (not b!840621) (not b_next!13669) (not bm!37211) (not start!72466) (not b!840627) (not b!840622) b_and!22729 (not b!840625) (not bm!37212) (not b!840619) (not b!840618) tp_is_empty!15535 (not mapNonEmpty!24902))
(check-sat b_and!22729 (not b_next!13669))
