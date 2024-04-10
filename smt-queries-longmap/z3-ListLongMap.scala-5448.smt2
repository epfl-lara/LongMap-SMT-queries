; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72474 () Bool)

(assert start!72474)

(declare-fun b_free!13659 () Bool)

(declare-fun b_next!13659 () Bool)

(assert (=> start!72474 (= b_free!13659 (not b_next!13659))))

(declare-fun tp!48076 () Bool)

(declare-fun b_and!22745 () Bool)

(assert (=> start!72474 (= tp!48076 b_and!22745)))

(declare-fun res!571500 () Bool)

(declare-fun e!469043 () Bool)

(assert (=> start!72474 (=> (not res!571500) (not e!469043))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47328 0))(
  ( (array!47329 (arr!22695 (Array (_ BitVec 32) (_ BitVec 64))) (size!23135 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47328)

(assert (=> start!72474 (= res!571500 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23135 _keys!868))))))

(assert (=> start!72474 e!469043))

(declare-fun tp_is_empty!15525 () Bool)

(assert (=> start!72474 tp_is_empty!15525))

(assert (=> start!72474 true))

(assert (=> start!72474 tp!48076))

(declare-fun array_inv!18068 (array!47328) Bool)

(assert (=> start!72474 (array_inv!18068 _keys!868)))

(declare-datatypes ((V!25747 0))(
  ( (V!25748 (val!7810 Int)) )
))
(declare-datatypes ((ValueCell!7323 0))(
  ( (ValueCellFull!7323 (v!10235 V!25747)) (EmptyCell!7323) )
))
(declare-datatypes ((array!47330 0))(
  ( (array!47331 (arr!22696 (Array (_ BitVec 32) ValueCell!7323)) (size!23136 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47330)

(declare-fun e!469044 () Bool)

(declare-fun array_inv!18069 (array!47330) Bool)

(assert (=> start!72474 (and (array_inv!18069 _values!688) e!469044)))

(declare-fun b!840662 () Bool)

(declare-fun e!469045 () Bool)

(declare-datatypes ((tuple2!10354 0))(
  ( (tuple2!10355 (_1!5188 (_ BitVec 64)) (_2!5188 V!25747)) )
))
(declare-datatypes ((List!16143 0))(
  ( (Nil!16140) (Cons!16139 (h!17270 tuple2!10354) (t!22514 List!16143)) )
))
(declare-datatypes ((ListLongMap!9123 0))(
  ( (ListLongMap!9124 (toList!4577 List!16143)) )
))
(declare-fun call!37211 () ListLongMap!9123)

(declare-fun call!37210 () ListLongMap!9123)

(assert (=> b!840662 (= e!469045 (= call!37211 call!37210))))

(declare-fun b!840663 () Bool)

(declare-fun e!469048 () Bool)

(declare-fun mapRes!24887 () Bool)

(assert (=> b!840663 (= e!469044 (and e!469048 mapRes!24887))))

(declare-fun condMapEmpty!24887 () Bool)

(declare-fun mapDefault!24887 () ValueCell!7323)

(assert (=> b!840663 (= condMapEmpty!24887 (= (arr!22696 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7323)) mapDefault!24887)))))

(declare-fun b!840664 () Bool)

(declare-fun res!571499 () Bool)

(assert (=> b!840664 (=> (not res!571499) (not e!469043))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47328 (_ BitVec 32)) Bool)

(assert (=> b!840664 (= res!571499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840665 () Bool)

(declare-fun res!571504 () Bool)

(assert (=> b!840665 (=> (not res!571504) (not e!469043))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!840665 (= res!571504 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23135 _keys!868))))))

(declare-fun mapNonEmpty!24887 () Bool)

(declare-fun tp!48075 () Bool)

(declare-fun e!469046 () Bool)

(assert (=> mapNonEmpty!24887 (= mapRes!24887 (and tp!48075 e!469046))))

(declare-fun mapValue!24887 () ValueCell!7323)

(declare-fun mapKey!24887 () (_ BitVec 32))

(declare-fun mapRest!24887 () (Array (_ BitVec 32) ValueCell!7323))

(assert (=> mapNonEmpty!24887 (= (arr!22696 _values!688) (store mapRest!24887 mapKey!24887 mapValue!24887))))

(declare-fun bm!37207 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25747)

(declare-fun zeroValue!654 () V!25747)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2564 (array!47328 array!47330 (_ BitVec 32) (_ BitVec 32) V!25747 V!25747 (_ BitVec 32) Int) ListLongMap!9123)

(assert (=> bm!37207 (= call!37210 (getCurrentListMapNoExtraKeys!2564 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840666 () Bool)

(declare-fun res!571501 () Bool)

(assert (=> b!840666 (=> (not res!571501) (not e!469043))))

(declare-datatypes ((List!16144 0))(
  ( (Nil!16141) (Cons!16140 (h!17271 (_ BitVec 64)) (t!22515 List!16144)) )
))
(declare-fun arrayNoDuplicates!0 (array!47328 (_ BitVec 32) List!16144) Bool)

(assert (=> b!840666 (= res!571501 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16141))))

(declare-fun b!840667 () Bool)

(assert (=> b!840667 (= e!469048 tp_is_empty!15525)))

(declare-fun mapIsEmpty!24887 () Bool)

(assert (=> mapIsEmpty!24887 mapRes!24887))

(declare-fun b!840668 () Bool)

(declare-fun res!571505 () Bool)

(assert (=> b!840668 (=> (not res!571505) (not e!469043))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!840668 (= res!571505 (and (= (select (arr!22695 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23135 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun bm!37208 () Bool)

(declare-fun v!557 () V!25747)

(assert (=> bm!37208 (= call!37211 (getCurrentListMapNoExtraKeys!2564 _keys!868 (array!47331 (store (arr!22696 _values!688) i!612 (ValueCellFull!7323 v!557)) (size!23136 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840669 () Bool)

(declare-fun res!571498 () Bool)

(assert (=> b!840669 (=> (not res!571498) (not e!469043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840669 (= res!571498 (validMask!0 mask!1196))))

(declare-fun b!840670 () Bool)

(assert (=> b!840670 (= e!469046 tp_is_empty!15525)))

(declare-fun b!840671 () Bool)

(assert (=> b!840671 (= e!469043 (not true))))

(assert (=> b!840671 e!469045))

(declare-fun c!91348 () Bool)

(assert (=> b!840671 (= c!91348 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28875 0))(
  ( (Unit!28876) )
))
(declare-fun lt!380854 () Unit!28875)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!283 (array!47328 array!47330 (_ BitVec 32) (_ BitVec 32) V!25747 V!25747 (_ BitVec 32) (_ BitVec 64) V!25747 (_ BitVec 32) Int) Unit!28875)

(assert (=> b!840671 (= lt!380854 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!283 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840672 () Bool)

(declare-fun +!2046 (ListLongMap!9123 tuple2!10354) ListLongMap!9123)

(assert (=> b!840672 (= e!469045 (= call!37211 (+!2046 call!37210 (tuple2!10355 k0!854 v!557))))))

(declare-fun b!840673 () Bool)

(declare-fun res!571502 () Bool)

(assert (=> b!840673 (=> (not res!571502) (not e!469043))))

(assert (=> b!840673 (= res!571502 (and (= (size!23136 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23135 _keys!868) (size!23136 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840674 () Bool)

(declare-fun res!571503 () Bool)

(assert (=> b!840674 (=> (not res!571503) (not e!469043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840674 (= res!571503 (validKeyInArray!0 k0!854))))

(assert (= (and start!72474 res!571500) b!840669))

(assert (= (and b!840669 res!571498) b!840673))

(assert (= (and b!840673 res!571502) b!840664))

(assert (= (and b!840664 res!571499) b!840666))

(assert (= (and b!840666 res!571501) b!840665))

(assert (= (and b!840665 res!571504) b!840674))

(assert (= (and b!840674 res!571503) b!840668))

(assert (= (and b!840668 res!571505) b!840671))

(assert (= (and b!840671 c!91348) b!840672))

(assert (= (and b!840671 (not c!91348)) b!840662))

(assert (= (or b!840672 b!840662) bm!37208))

(assert (= (or b!840672 b!840662) bm!37207))

(assert (= (and b!840663 condMapEmpty!24887) mapIsEmpty!24887))

(assert (= (and b!840663 (not condMapEmpty!24887)) mapNonEmpty!24887))

(get-info :version)

(assert (= (and mapNonEmpty!24887 ((_ is ValueCellFull!7323) mapValue!24887)) b!840670))

(assert (= (and b!840663 ((_ is ValueCellFull!7323) mapDefault!24887)) b!840667))

(assert (= start!72474 b!840663))

(declare-fun m!784361 () Bool)

(assert (=> bm!37207 m!784361))

(declare-fun m!784363 () Bool)

(assert (=> start!72474 m!784363))

(declare-fun m!784365 () Bool)

(assert (=> start!72474 m!784365))

(declare-fun m!784367 () Bool)

(assert (=> b!840666 m!784367))

(declare-fun m!784369 () Bool)

(assert (=> b!840674 m!784369))

(declare-fun m!784371 () Bool)

(assert (=> b!840664 m!784371))

(declare-fun m!784373 () Bool)

(assert (=> b!840672 m!784373))

(declare-fun m!784375 () Bool)

(assert (=> b!840668 m!784375))

(declare-fun m!784377 () Bool)

(assert (=> b!840669 m!784377))

(declare-fun m!784379 () Bool)

(assert (=> b!840671 m!784379))

(declare-fun m!784381 () Bool)

(assert (=> mapNonEmpty!24887 m!784381))

(declare-fun m!784383 () Bool)

(assert (=> bm!37208 m!784383))

(declare-fun m!784385 () Bool)

(assert (=> bm!37208 m!784385))

(check-sat (not mapNonEmpty!24887) b_and!22745 (not b!840674) (not b_next!13659) (not b!840672) (not b!840666) (not b!840671) tp_is_empty!15525 (not b!840664) (not bm!37208) (not bm!37207) (not b!840669) (not start!72474))
(check-sat b_and!22745 (not b_next!13659))
