; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72414 () Bool)

(assert start!72414)

(declare-fun b_free!13599 () Bool)

(declare-fun b_next!13599 () Bool)

(assert (=> start!72414 (= b_free!13599 (not b_next!13599))))

(declare-fun tp!47896 () Bool)

(declare-fun b_and!22685 () Bool)

(assert (=> start!72414 (= tp!47896 b_and!22685)))

(declare-fun b!839492 () Bool)

(declare-fun e!468505 () Bool)

(declare-fun tp_is_empty!15465 () Bool)

(assert (=> b!839492 (= e!468505 tp_is_empty!15465)))

(declare-fun b!839493 () Bool)

(declare-fun e!468503 () Bool)

(declare-fun e!468507 () Bool)

(declare-fun mapRes!24797 () Bool)

(assert (=> b!839493 (= e!468503 (and e!468507 mapRes!24797))))

(declare-fun condMapEmpty!24797 () Bool)

(declare-datatypes ((V!25667 0))(
  ( (V!25668 (val!7780 Int)) )
))
(declare-datatypes ((ValueCell!7293 0))(
  ( (ValueCellFull!7293 (v!10205 V!25667)) (EmptyCell!7293) )
))
(declare-datatypes ((array!47212 0))(
  ( (array!47213 (arr!22637 (Array (_ BitVec 32) ValueCell!7293)) (size!23077 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47212)

(declare-fun mapDefault!24797 () ValueCell!7293)

(assert (=> b!839493 (= condMapEmpty!24797 (= (arr!22637 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7293)) mapDefault!24797)))))

(declare-fun b!839494 () Bool)

(declare-fun res!570780 () Bool)

(declare-fun e!468506 () Bool)

(assert (=> b!839494 (=> (not res!570780) (not e!468506))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47214 0))(
  ( (array!47215 (arr!22638 (Array (_ BitVec 32) (_ BitVec 64))) (size!23078 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47214)

(assert (=> b!839494 (= res!570780 (and (= (size!23077 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23078 _keys!868) (size!23077 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839495 () Bool)

(assert (=> b!839495 (= e!468507 tp_is_empty!15465)))

(declare-fun res!570781 () Bool)

(assert (=> start!72414 (=> (not res!570781) (not e!468506))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72414 (= res!570781 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23078 _keys!868))))))

(assert (=> start!72414 e!468506))

(assert (=> start!72414 tp_is_empty!15465))

(assert (=> start!72414 true))

(assert (=> start!72414 tp!47896))

(declare-fun array_inv!18030 (array!47214) Bool)

(assert (=> start!72414 (array_inv!18030 _keys!868)))

(declare-fun array_inv!18031 (array!47212) Bool)

(assert (=> start!72414 (and (array_inv!18031 _values!688) e!468503)))

(declare-fun b!839496 () Bool)

(declare-fun res!570784 () Bool)

(assert (=> b!839496 (=> (not res!570784) (not e!468506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839496 (= res!570784 (validMask!0 mask!1196))))

(declare-fun b!839497 () Bool)

(declare-fun e!468504 () Bool)

(declare-datatypes ((tuple2!10300 0))(
  ( (tuple2!10301 (_1!5161 (_ BitVec 64)) (_2!5161 V!25667)) )
))
(declare-datatypes ((List!16098 0))(
  ( (Nil!16095) (Cons!16094 (h!17225 tuple2!10300) (t!22469 List!16098)) )
))
(declare-datatypes ((ListLongMap!9069 0))(
  ( (ListLongMap!9070 (toList!4550 List!16098)) )
))
(declare-fun call!37030 () ListLongMap!9069)

(declare-fun call!37031 () ListLongMap!9069)

(assert (=> b!839497 (= e!468504 (= call!37030 call!37031))))

(declare-fun b!839498 () Bool)

(declare-fun res!570783 () Bool)

(assert (=> b!839498 (=> (not res!570783) (not e!468506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47214 (_ BitVec 32)) Bool)

(assert (=> b!839498 (= res!570783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24797 () Bool)

(declare-fun tp!47895 () Bool)

(assert (=> mapNonEmpty!24797 (= mapRes!24797 (and tp!47895 e!468505))))

(declare-fun mapKey!24797 () (_ BitVec 32))

(declare-fun mapValue!24797 () ValueCell!7293)

(declare-fun mapRest!24797 () (Array (_ BitVec 32) ValueCell!7293))

(assert (=> mapNonEmpty!24797 (= (arr!22637 _values!688) (store mapRest!24797 mapKey!24797 mapValue!24797))))

(declare-fun b!839499 () Bool)

(declare-fun res!570782 () Bool)

(assert (=> b!839499 (=> (not res!570782) (not e!468506))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839499 (= res!570782 (validKeyInArray!0 k0!854))))

(declare-fun b!839500 () Bool)

(declare-fun res!570785 () Bool)

(assert (=> b!839500 (=> (not res!570785) (not e!468506))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839500 (= res!570785 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23078 _keys!868))))))

(declare-fun b!839501 () Bool)

(declare-fun v!557 () V!25667)

(declare-fun +!2021 (ListLongMap!9069 tuple2!10300) ListLongMap!9069)

(assert (=> b!839501 (= e!468504 (= call!37030 (+!2021 call!37031 (tuple2!10301 k0!854 v!557))))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!25667)

(declare-fun zeroValue!654 () V!25667)

(declare-fun bm!37027 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2540 (array!47214 array!47212 (_ BitVec 32) (_ BitVec 32) V!25667 V!25667 (_ BitVec 32) Int) ListLongMap!9069)

(assert (=> bm!37027 (= call!37031 (getCurrentListMapNoExtraKeys!2540 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24797 () Bool)

(assert (=> mapIsEmpty!24797 mapRes!24797))

(declare-fun b!839502 () Bool)

(assert (=> b!839502 (= e!468506 (not true))))

(assert (=> b!839502 e!468504))

(declare-fun c!91258 () Bool)

(assert (=> b!839502 (= c!91258 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28829 0))(
  ( (Unit!28830) )
))
(declare-fun lt!380764 () Unit!28829)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!260 (array!47214 array!47212 (_ BitVec 32) (_ BitVec 32) V!25667 V!25667 (_ BitVec 32) (_ BitVec 64) V!25667 (_ BitVec 32) Int) Unit!28829)

(assert (=> b!839502 (= lt!380764 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!260 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839503 () Bool)

(declare-fun res!570779 () Bool)

(assert (=> b!839503 (=> (not res!570779) (not e!468506))))

(assert (=> b!839503 (= res!570779 (and (= (select (arr!22638 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23078 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839504 () Bool)

(declare-fun res!570778 () Bool)

(assert (=> b!839504 (=> (not res!570778) (not e!468506))))

(declare-datatypes ((List!16099 0))(
  ( (Nil!16096) (Cons!16095 (h!17226 (_ BitVec 64)) (t!22470 List!16099)) )
))
(declare-fun arrayNoDuplicates!0 (array!47214 (_ BitVec 32) List!16099) Bool)

(assert (=> b!839504 (= res!570778 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16096))))

(declare-fun bm!37028 () Bool)

(assert (=> bm!37028 (= call!37030 (getCurrentListMapNoExtraKeys!2540 _keys!868 (array!47213 (store (arr!22637 _values!688) i!612 (ValueCellFull!7293 v!557)) (size!23077 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72414 res!570781) b!839496))

(assert (= (and b!839496 res!570784) b!839494))

(assert (= (and b!839494 res!570780) b!839498))

(assert (= (and b!839498 res!570783) b!839504))

(assert (= (and b!839504 res!570778) b!839500))

(assert (= (and b!839500 res!570785) b!839499))

(assert (= (and b!839499 res!570782) b!839503))

(assert (= (and b!839503 res!570779) b!839502))

(assert (= (and b!839502 c!91258) b!839501))

(assert (= (and b!839502 (not c!91258)) b!839497))

(assert (= (or b!839501 b!839497) bm!37028))

(assert (= (or b!839501 b!839497) bm!37027))

(assert (= (and b!839493 condMapEmpty!24797) mapIsEmpty!24797))

(assert (= (and b!839493 (not condMapEmpty!24797)) mapNonEmpty!24797))

(get-info :version)

(assert (= (and mapNonEmpty!24797 ((_ is ValueCellFull!7293) mapValue!24797)) b!839492))

(assert (= (and b!839493 ((_ is ValueCellFull!7293) mapDefault!24797)) b!839495))

(assert (= start!72414 b!839493))

(declare-fun m!783581 () Bool)

(assert (=> b!839498 m!783581))

(declare-fun m!783583 () Bool)

(assert (=> b!839503 m!783583))

(declare-fun m!783585 () Bool)

(assert (=> bm!37027 m!783585))

(declare-fun m!783587 () Bool)

(assert (=> bm!37028 m!783587))

(declare-fun m!783589 () Bool)

(assert (=> bm!37028 m!783589))

(declare-fun m!783591 () Bool)

(assert (=> b!839499 m!783591))

(declare-fun m!783593 () Bool)

(assert (=> b!839504 m!783593))

(declare-fun m!783595 () Bool)

(assert (=> start!72414 m!783595))

(declare-fun m!783597 () Bool)

(assert (=> start!72414 m!783597))

(declare-fun m!783599 () Bool)

(assert (=> b!839496 m!783599))

(declare-fun m!783601 () Bool)

(assert (=> b!839502 m!783601))

(declare-fun m!783603 () Bool)

(assert (=> b!839501 m!783603))

(declare-fun m!783605 () Bool)

(assert (=> mapNonEmpty!24797 m!783605))

(check-sat (not b!839499) (not b!839496) (not b_next!13599) (not start!72414) (not bm!37027) (not b!839502) (not mapNonEmpty!24797) b_and!22685 (not b!839498) (not bm!37028) tp_is_empty!15465 (not b!839504) (not b!839501))
(check-sat b_and!22685 (not b_next!13599))
