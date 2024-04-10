; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72480 () Bool)

(assert start!72480)

(declare-fun b_free!13665 () Bool)

(declare-fun b_next!13665 () Bool)

(assert (=> start!72480 (= b_free!13665 (not b_next!13665))))

(declare-fun tp!48093 () Bool)

(declare-fun b_and!22751 () Bool)

(assert (=> start!72480 (= tp!48093 b_and!22751)))

(declare-fun mapNonEmpty!24896 () Bool)

(declare-fun mapRes!24896 () Bool)

(declare-fun tp!48094 () Bool)

(declare-fun e!469098 () Bool)

(assert (=> mapNonEmpty!24896 (= mapRes!24896 (and tp!48094 e!469098))))

(declare-datatypes ((V!25755 0))(
  ( (V!25756 (val!7813 Int)) )
))
(declare-datatypes ((ValueCell!7326 0))(
  ( (ValueCellFull!7326 (v!10238 V!25755)) (EmptyCell!7326) )
))
(declare-fun mapRest!24896 () (Array (_ BitVec 32) ValueCell!7326))

(declare-fun mapKey!24896 () (_ BitVec 32))

(declare-fun mapValue!24896 () ValueCell!7326)

(declare-datatypes ((array!47340 0))(
  ( (array!47341 (arr!22701 (Array (_ BitVec 32) ValueCell!7326)) (size!23141 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47340)

(assert (=> mapNonEmpty!24896 (= (arr!22701 _values!688) (store mapRest!24896 mapKey!24896 mapValue!24896))))

(declare-fun v!557 () V!25755)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10358 0))(
  ( (tuple2!10359 (_1!5190 (_ BitVec 64)) (_2!5190 V!25755)) )
))
(declare-datatypes ((List!16146 0))(
  ( (Nil!16143) (Cons!16142 (h!17273 tuple2!10358) (t!22517 List!16146)) )
))
(declare-datatypes ((ListLongMap!9127 0))(
  ( (ListLongMap!9128 (toList!4579 List!16146)) )
))
(declare-fun call!37228 () ListLongMap!9127)

(declare-datatypes ((array!47342 0))(
  ( (array!47343 (arr!22702 (Array (_ BitVec 32) (_ BitVec 64))) (size!23142 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47342)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25755)

(declare-fun zeroValue!654 () V!25755)

(declare-fun bm!37225 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2566 (array!47342 array!47340 (_ BitVec 32) (_ BitVec 32) V!25755 V!25755 (_ BitVec 32) Int) ListLongMap!9127)

(assert (=> bm!37225 (= call!37228 (getCurrentListMapNoExtraKeys!2566 _keys!868 (array!47341 (store (arr!22701 _values!688) i!612 (ValueCellFull!7326 v!557)) (size!23141 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840779 () Bool)

(declare-fun res!571570 () Bool)

(declare-fun e!469102 () Bool)

(assert (=> b!840779 (=> (not res!571570) (not e!469102))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840779 (= res!571570 (validKeyInArray!0 k0!854))))

(declare-fun b!840780 () Bool)

(declare-fun res!571576 () Bool)

(assert (=> b!840780 (=> (not res!571576) (not e!469102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840780 (= res!571576 (validMask!0 mask!1196))))

(declare-fun call!37229 () ListLongMap!9127)

(declare-fun b!840781 () Bool)

(declare-fun e!469100 () Bool)

(declare-fun +!2048 (ListLongMap!9127 tuple2!10358) ListLongMap!9127)

(assert (=> b!840781 (= e!469100 (= call!37228 (+!2048 call!37229 (tuple2!10359 k0!854 v!557))))))

(declare-fun b!840782 () Bool)

(declare-fun res!571571 () Bool)

(assert (=> b!840782 (=> (not res!571571) (not e!469102))))

(declare-datatypes ((List!16147 0))(
  ( (Nil!16144) (Cons!16143 (h!17274 (_ BitVec 64)) (t!22518 List!16147)) )
))
(declare-fun arrayNoDuplicates!0 (array!47342 (_ BitVec 32) List!16147) Bool)

(assert (=> b!840782 (= res!571571 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16144))))

(declare-fun b!840783 () Bool)

(declare-fun res!571574 () Bool)

(assert (=> b!840783 (=> (not res!571574) (not e!469102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47342 (_ BitVec 32)) Bool)

(assert (=> b!840783 (= res!571574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!571573 () Bool)

(assert (=> start!72480 (=> (not res!571573) (not e!469102))))

(assert (=> start!72480 (= res!571573 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23142 _keys!868))))))

(assert (=> start!72480 e!469102))

(declare-fun tp_is_empty!15531 () Bool)

(assert (=> start!72480 tp_is_empty!15531))

(assert (=> start!72480 true))

(assert (=> start!72480 tp!48093))

(declare-fun array_inv!18072 (array!47342) Bool)

(assert (=> start!72480 (array_inv!18072 _keys!868)))

(declare-fun e!469101 () Bool)

(declare-fun array_inv!18073 (array!47340) Bool)

(assert (=> start!72480 (and (array_inv!18073 _values!688) e!469101)))

(declare-fun b!840784 () Bool)

(assert (=> b!840784 (= e!469100 (= call!37228 call!37229))))

(declare-fun b!840785 () Bool)

(declare-fun res!571577 () Bool)

(assert (=> b!840785 (=> (not res!571577) (not e!469102))))

(assert (=> b!840785 (= res!571577 (and (= (size!23141 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23142 _keys!868) (size!23141 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840786 () Bool)

(declare-fun e!469097 () Bool)

(assert (=> b!840786 (= e!469101 (and e!469097 mapRes!24896))))

(declare-fun condMapEmpty!24896 () Bool)

(declare-fun mapDefault!24896 () ValueCell!7326)

(assert (=> b!840786 (= condMapEmpty!24896 (= (arr!22701 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7326)) mapDefault!24896)))))

(declare-fun b!840787 () Bool)

(assert (=> b!840787 (= e!469102 (not true))))

(assert (=> b!840787 e!469100))

(declare-fun c!91357 () Bool)

(assert (=> b!840787 (= c!91357 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28879 0))(
  ( (Unit!28880) )
))
(declare-fun lt!380863 () Unit!28879)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!285 (array!47342 array!47340 (_ BitVec 32) (_ BitVec 32) V!25755 V!25755 (_ BitVec 32) (_ BitVec 64) V!25755 (_ BitVec 32) Int) Unit!28879)

(assert (=> b!840787 (= lt!380863 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!285 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840788 () Bool)

(assert (=> b!840788 (= e!469098 tp_is_empty!15531)))

(declare-fun b!840789 () Bool)

(declare-fun res!571572 () Bool)

(assert (=> b!840789 (=> (not res!571572) (not e!469102))))

(assert (=> b!840789 (= res!571572 (and (= (select (arr!22702 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23142 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840790 () Bool)

(assert (=> b!840790 (= e!469097 tp_is_empty!15531)))

(declare-fun mapIsEmpty!24896 () Bool)

(assert (=> mapIsEmpty!24896 mapRes!24896))

(declare-fun b!840791 () Bool)

(declare-fun res!571575 () Bool)

(assert (=> b!840791 (=> (not res!571575) (not e!469102))))

(assert (=> b!840791 (= res!571575 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23142 _keys!868))))))

(declare-fun bm!37226 () Bool)

(assert (=> bm!37226 (= call!37229 (getCurrentListMapNoExtraKeys!2566 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72480 res!571573) b!840780))

(assert (= (and b!840780 res!571576) b!840785))

(assert (= (and b!840785 res!571577) b!840783))

(assert (= (and b!840783 res!571574) b!840782))

(assert (= (and b!840782 res!571571) b!840791))

(assert (= (and b!840791 res!571575) b!840779))

(assert (= (and b!840779 res!571570) b!840789))

(assert (= (and b!840789 res!571572) b!840787))

(assert (= (and b!840787 c!91357) b!840781))

(assert (= (and b!840787 (not c!91357)) b!840784))

(assert (= (or b!840781 b!840784) bm!37225))

(assert (= (or b!840781 b!840784) bm!37226))

(assert (= (and b!840786 condMapEmpty!24896) mapIsEmpty!24896))

(assert (= (and b!840786 (not condMapEmpty!24896)) mapNonEmpty!24896))

(get-info :version)

(assert (= (and mapNonEmpty!24896 ((_ is ValueCellFull!7326) mapValue!24896)) b!840788))

(assert (= (and b!840786 ((_ is ValueCellFull!7326) mapDefault!24896)) b!840790))

(assert (= start!72480 b!840786))

(declare-fun m!784439 () Bool)

(assert (=> b!840780 m!784439))

(declare-fun m!784441 () Bool)

(assert (=> b!840779 m!784441))

(declare-fun m!784443 () Bool)

(assert (=> b!840787 m!784443))

(declare-fun m!784445 () Bool)

(assert (=> b!840789 m!784445))

(declare-fun m!784447 () Bool)

(assert (=> bm!37226 m!784447))

(declare-fun m!784449 () Bool)

(assert (=> bm!37225 m!784449))

(declare-fun m!784451 () Bool)

(assert (=> bm!37225 m!784451))

(declare-fun m!784453 () Bool)

(assert (=> b!840782 m!784453))

(declare-fun m!784455 () Bool)

(assert (=> b!840781 m!784455))

(declare-fun m!784457 () Bool)

(assert (=> start!72480 m!784457))

(declare-fun m!784459 () Bool)

(assert (=> start!72480 m!784459))

(declare-fun m!784461 () Bool)

(assert (=> mapNonEmpty!24896 m!784461))

(declare-fun m!784463 () Bool)

(assert (=> b!840783 m!784463))

(check-sat (not mapNonEmpty!24896) (not b!840779) (not bm!37225) (not b!840782) (not start!72480) (not b!840787) (not b_next!13665) tp_is_empty!15531 (not b!840783) (not b!840780) (not b!840781) b_and!22751 (not bm!37226))
(check-sat b_and!22751 (not b_next!13665))
