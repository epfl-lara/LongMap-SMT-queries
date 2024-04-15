; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72520 () Bool)

(assert start!72520)

(declare-fun b_free!13723 () Bool)

(declare-fun b_next!13723 () Bool)

(assert (=> start!72520 (= b_free!13723 (not b_next!13723))))

(declare-fun tp!48269 () Bool)

(declare-fun b_and!22783 () Bool)

(assert (=> start!72520 (= tp!48269 b_and!22783)))

(declare-fun b!841671 () Bool)

(declare-fun res!572162 () Bool)

(declare-fun e!469473 () Bool)

(assert (=> b!841671 (=> (not res!572162) (not e!469473))))

(declare-datatypes ((array!47431 0))(
  ( (array!47432 (arr!22747 (Array (_ BitVec 32) (_ BitVec 64))) (size!23189 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47431)

(declare-datatypes ((List!16200 0))(
  ( (Nil!16197) (Cons!16196 (h!17327 (_ BitVec 64)) (t!22562 List!16200)) )
))
(declare-fun arrayNoDuplicates!0 (array!47431 (_ BitVec 32) List!16200) Bool)

(assert (=> b!841671 (= res!572162 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16197))))

(declare-fun res!572156 () Bool)

(assert (=> start!72520 (=> (not res!572156) (not e!469473))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72520 (= res!572156 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23189 _keys!868))))))

(assert (=> start!72520 e!469473))

(declare-fun tp_is_empty!15589 () Bool)

(assert (=> start!72520 tp_is_empty!15589))

(assert (=> start!72520 true))

(assert (=> start!72520 tp!48269))

(declare-fun array_inv!18178 (array!47431) Bool)

(assert (=> start!72520 (array_inv!18178 _keys!868)))

(declare-datatypes ((V!25833 0))(
  ( (V!25834 (val!7842 Int)) )
))
(declare-datatypes ((ValueCell!7355 0))(
  ( (ValueCellFull!7355 (v!10261 V!25833)) (EmptyCell!7355) )
))
(declare-datatypes ((array!47433 0))(
  ( (array!47434 (arr!22748 (Array (_ BitVec 32) ValueCell!7355)) (size!23190 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47433)

(declare-fun e!469472 () Bool)

(declare-fun array_inv!18179 (array!47433) Bool)

(assert (=> start!72520 (and (array_inv!18179 _values!688) e!469472)))

(declare-fun b!841672 () Bool)

(declare-fun res!572161 () Bool)

(assert (=> b!841672 (=> (not res!572161) (not e!469473))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841672 (= res!572161 (validKeyInArray!0 k0!854))))

(declare-fun v!557 () V!25833)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37373 () Bool)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!25833)

(declare-fun zeroValue!654 () V!25833)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10430 0))(
  ( (tuple2!10431 (_1!5226 (_ BitVec 64)) (_2!5226 V!25833)) )
))
(declare-datatypes ((List!16201 0))(
  ( (Nil!16198) (Cons!16197 (h!17328 tuple2!10430) (t!22563 List!16201)) )
))
(declare-datatypes ((ListLongMap!9189 0))(
  ( (ListLongMap!9190 (toList!4610 List!16201)) )
))
(declare-fun call!37377 () ListLongMap!9189)

(declare-fun getCurrentListMapNoExtraKeys!2626 (array!47431 array!47433 (_ BitVec 32) (_ BitVec 32) V!25833 V!25833 (_ BitVec 32) Int) ListLongMap!9189)

(assert (=> bm!37373 (= call!37377 (getCurrentListMapNoExtraKeys!2626 _keys!868 (array!47434 (store (arr!22748 _values!688) i!612 (ValueCellFull!7355 v!557)) (size!23190 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841673 () Bool)

(declare-fun res!572163 () Bool)

(assert (=> b!841673 (=> (not res!572163) (not e!469473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47431 (_ BitVec 32)) Bool)

(assert (=> b!841673 (= res!572163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841674 () Bool)

(declare-fun e!469474 () Bool)

(assert (=> b!841674 (= e!469474 tp_is_empty!15589)))

(declare-fun b!841675 () Bool)

(declare-fun res!572158 () Bool)

(assert (=> b!841675 (=> (not res!572158) (not e!469473))))

(assert (=> b!841675 (= res!572158 (and (= (size!23190 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23189 _keys!868) (size!23190 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841676 () Bool)

(declare-fun e!469476 () Bool)

(declare-fun mapRes!24983 () Bool)

(assert (=> b!841676 (= e!469472 (and e!469476 mapRes!24983))))

(declare-fun condMapEmpty!24983 () Bool)

(declare-fun mapDefault!24983 () ValueCell!7355)

(assert (=> b!841676 (= condMapEmpty!24983 (= (arr!22748 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7355)) mapDefault!24983)))))

(declare-fun b!841677 () Bool)

(declare-fun res!572160 () Bool)

(assert (=> b!841677 (=> (not res!572160) (not e!469473))))

(assert (=> b!841677 (= res!572160 (and (= (select (arr!22747 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23189 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!24983 () Bool)

(assert (=> mapIsEmpty!24983 mapRes!24983))

(declare-fun call!37376 () ListLongMap!9189)

(declare-fun bm!37374 () Bool)

(assert (=> bm!37374 (= call!37376 (getCurrentListMapNoExtraKeys!2626 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841678 () Bool)

(assert (=> b!841678 (= e!469473 (not true))))

(declare-fun e!469475 () Bool)

(assert (=> b!841678 e!469475))

(declare-fun c!91379 () Bool)

(assert (=> b!841678 (= c!91379 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28863 0))(
  ( (Unit!28864) )
))
(declare-fun lt!380714 () Unit!28863)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!306 (array!47431 array!47433 (_ BitVec 32) (_ BitVec 32) V!25833 V!25833 (_ BitVec 32) (_ BitVec 64) V!25833 (_ BitVec 32) Int) Unit!28863)

(assert (=> b!841678 (= lt!380714 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!306 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24983 () Bool)

(declare-fun tp!48268 () Bool)

(assert (=> mapNonEmpty!24983 (= mapRes!24983 (and tp!48268 e!469474))))

(declare-fun mapKey!24983 () (_ BitVec 32))

(declare-fun mapRest!24983 () (Array (_ BitVec 32) ValueCell!7355))

(declare-fun mapValue!24983 () ValueCell!7355)

(assert (=> mapNonEmpty!24983 (= (arr!22748 _values!688) (store mapRest!24983 mapKey!24983 mapValue!24983))))

(declare-fun b!841679 () Bool)

(assert (=> b!841679 (= e!469475 (= call!37377 call!37376))))

(declare-fun b!841680 () Bool)

(declare-fun res!572157 () Bool)

(assert (=> b!841680 (=> (not res!572157) (not e!469473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841680 (= res!572157 (validMask!0 mask!1196))))

(declare-fun b!841681 () Bool)

(declare-fun res!572159 () Bool)

(assert (=> b!841681 (=> (not res!572159) (not e!469473))))

(assert (=> b!841681 (= res!572159 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23189 _keys!868))))))

(declare-fun b!841682 () Bool)

(assert (=> b!841682 (= e!469476 tp_is_empty!15589)))

(declare-fun b!841683 () Bool)

(declare-fun +!2089 (ListLongMap!9189 tuple2!10430) ListLongMap!9189)

(assert (=> b!841683 (= e!469475 (= call!37377 (+!2089 call!37376 (tuple2!10431 k0!854 v!557))))))

(assert (= (and start!72520 res!572156) b!841680))

(assert (= (and b!841680 res!572157) b!841675))

(assert (= (and b!841675 res!572158) b!841673))

(assert (= (and b!841673 res!572163) b!841671))

(assert (= (and b!841671 res!572162) b!841681))

(assert (= (and b!841681 res!572159) b!841672))

(assert (= (and b!841672 res!572161) b!841677))

(assert (= (and b!841677 res!572160) b!841678))

(assert (= (and b!841678 c!91379) b!841683))

(assert (= (and b!841678 (not c!91379)) b!841679))

(assert (= (or b!841683 b!841679) bm!37373))

(assert (= (or b!841683 b!841679) bm!37374))

(assert (= (and b!841676 condMapEmpty!24983) mapIsEmpty!24983))

(assert (= (and b!841676 (not condMapEmpty!24983)) mapNonEmpty!24983))

(get-info :version)

(assert (= (and mapNonEmpty!24983 ((_ is ValueCellFull!7355) mapValue!24983)) b!841674))

(assert (= (and b!841676 ((_ is ValueCellFull!7355) mapDefault!24983)) b!841682))

(assert (= start!72520 b!841676))

(declare-fun m!784439 () Bool)

(assert (=> b!841671 m!784439))

(declare-fun m!784441 () Bool)

(assert (=> start!72520 m!784441))

(declare-fun m!784443 () Bool)

(assert (=> start!72520 m!784443))

(declare-fun m!784445 () Bool)

(assert (=> b!841673 m!784445))

(declare-fun m!784447 () Bool)

(assert (=> bm!37373 m!784447))

(declare-fun m!784449 () Bool)

(assert (=> bm!37373 m!784449))

(declare-fun m!784451 () Bool)

(assert (=> b!841677 m!784451))

(declare-fun m!784453 () Bool)

(assert (=> mapNonEmpty!24983 m!784453))

(declare-fun m!784455 () Bool)

(assert (=> b!841672 m!784455))

(declare-fun m!784457 () Bool)

(assert (=> b!841678 m!784457))

(declare-fun m!784459 () Bool)

(assert (=> b!841683 m!784459))

(declare-fun m!784461 () Bool)

(assert (=> bm!37374 m!784461))

(declare-fun m!784463 () Bool)

(assert (=> b!841680 m!784463))

(check-sat (not b!841671) (not bm!37373) tp_is_empty!15589 (not b!841678) (not b!841673) (not start!72520) (not b_next!13723) (not mapNonEmpty!24983) b_and!22783 (not b!841683) (not b!841672) (not b!841680) (not bm!37374))
(check-sat b_and!22783 (not b_next!13723))
