; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72640 () Bool)

(assert start!72640)

(declare-fun b_free!13657 () Bool)

(declare-fun b_next!13657 () Bool)

(assert (=> start!72640 (= b_free!13657 (not b_next!13657))))

(declare-fun tp!48071 () Bool)

(declare-fun b_and!22753 () Bool)

(assert (=> start!72640 (= tp!48071 b_and!22753)))

(declare-fun b!841526 () Bool)

(declare-fun res!571825 () Bool)

(declare-fun e!469610 () Bool)

(assert (=> b!841526 (=> (not res!571825) (not e!469610))))

(declare-datatypes ((array!47339 0))(
  ( (array!47340 (arr!22696 (Array (_ BitVec 32) (_ BitVec 64))) (size!23137 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47339)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47339 (_ BitVec 32)) Bool)

(assert (=> b!841526 (= res!571825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24884 () Bool)

(declare-fun mapRes!24884 () Bool)

(declare-fun tp!48070 () Bool)

(declare-fun e!469609 () Bool)

(assert (=> mapNonEmpty!24884 (= mapRes!24884 (and tp!48070 e!469609))))

(declare-datatypes ((V!25745 0))(
  ( (V!25746 (val!7809 Int)) )
))
(declare-datatypes ((ValueCell!7322 0))(
  ( (ValueCellFull!7322 (v!10234 V!25745)) (EmptyCell!7322) )
))
(declare-fun mapRest!24884 () (Array (_ BitVec 32) ValueCell!7322))

(declare-fun mapValue!24884 () ValueCell!7322)

(declare-fun mapKey!24884 () (_ BitVec 32))

(declare-datatypes ((array!47341 0))(
  ( (array!47342 (arr!22697 (Array (_ BitVec 32) ValueCell!7322)) (size!23138 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47341)

(assert (=> mapNonEmpty!24884 (= (arr!22697 _values!688) (store mapRest!24884 mapKey!24884 mapValue!24884))))

(declare-fun v!557 () V!25745)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10280 0))(
  ( (tuple2!10281 (_1!5151 (_ BitVec 64)) (_2!5151 V!25745)) )
))
(declare-datatypes ((List!16055 0))(
  ( (Nil!16052) (Cons!16051 (h!17188 tuple2!10280) (t!22418 List!16055)) )
))
(declare-datatypes ((ListLongMap!9051 0))(
  ( (ListLongMap!9052 (toList!4541 List!16055)) )
))
(declare-fun call!37250 () ListLongMap!9051)

(declare-fun bm!37246 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25745)

(declare-fun zeroValue!654 () V!25745)

(declare-fun getCurrentListMapNoExtraKeys!2601 (array!47339 array!47341 (_ BitVec 32) (_ BitVec 32) V!25745 V!25745 (_ BitVec 32) Int) ListLongMap!9051)

(assert (=> bm!37246 (= call!37250 (getCurrentListMapNoExtraKeys!2601 _keys!868 (array!47342 (store (arr!22697 _values!688) i!612 (ValueCellFull!7322 v!557)) (size!23138 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841527 () Bool)

(assert (=> b!841527 (= e!469610 (not true))))

(declare-fun e!469611 () Bool)

(assert (=> b!841527 e!469611))

(declare-fun c!91627 () Bool)

(assert (=> b!841527 (= c!91627 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!28886 0))(
  ( (Unit!28887) )
))
(declare-fun lt!381212 () Unit!28886)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!279 (array!47339 array!47341 (_ BitVec 32) (_ BitVec 32) V!25745 V!25745 (_ BitVec 32) (_ BitVec 64) V!25745 (_ BitVec 32) Int) Unit!28886)

(assert (=> b!841527 (= lt!381212 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!279 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841528 () Bool)

(declare-fun res!571822 () Bool)

(assert (=> b!841528 (=> (not res!571822) (not e!469610))))

(assert (=> b!841528 (= res!571822 (and (= (select (arr!22696 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23137 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun res!571819 () Bool)

(assert (=> start!72640 (=> (not res!571819) (not e!469610))))

(assert (=> start!72640 (= res!571819 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23137 _keys!868))))))

(assert (=> start!72640 e!469610))

(declare-fun tp_is_empty!15523 () Bool)

(assert (=> start!72640 tp_is_empty!15523))

(assert (=> start!72640 true))

(assert (=> start!72640 tp!48071))

(declare-fun array_inv!18106 (array!47339) Bool)

(assert (=> start!72640 (array_inv!18106 _keys!868)))

(declare-fun e!469612 () Bool)

(declare-fun array_inv!18107 (array!47341) Bool)

(assert (=> start!72640 (and (array_inv!18107 _values!688) e!469612)))

(declare-fun b!841529 () Bool)

(declare-fun res!571820 () Bool)

(assert (=> b!841529 (=> (not res!571820) (not e!469610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841529 (= res!571820 (validMask!0 mask!1196))))

(declare-fun b!841530 () Bool)

(declare-fun res!571824 () Bool)

(assert (=> b!841530 (=> (not res!571824) (not e!469610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841530 (= res!571824 (validKeyInArray!0 k0!854))))

(declare-fun b!841531 () Bool)

(assert (=> b!841531 (= e!469609 tp_is_empty!15523)))

(declare-fun b!841532 () Bool)

(declare-fun e!469608 () Bool)

(assert (=> b!841532 (= e!469608 tp_is_empty!15523)))

(declare-fun b!841533 () Bool)

(assert (=> b!841533 (= e!469612 (and e!469608 mapRes!24884))))

(declare-fun condMapEmpty!24884 () Bool)

(declare-fun mapDefault!24884 () ValueCell!7322)

(assert (=> b!841533 (= condMapEmpty!24884 (= (arr!22697 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7322)) mapDefault!24884)))))

(declare-fun b!841534 () Bool)

(declare-fun res!571818 () Bool)

(assert (=> b!841534 (=> (not res!571818) (not e!469610))))

(declare-datatypes ((List!16056 0))(
  ( (Nil!16053) (Cons!16052 (h!17189 (_ BitVec 64)) (t!22419 List!16056)) )
))
(declare-fun arrayNoDuplicates!0 (array!47339 (_ BitVec 32) List!16056) Bool)

(assert (=> b!841534 (= res!571818 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16053))))

(declare-fun b!841535 () Bool)

(declare-fun call!37249 () ListLongMap!9051)

(assert (=> b!841535 (= e!469611 (= call!37250 call!37249))))

(declare-fun b!841536 () Bool)

(declare-fun res!571823 () Bool)

(assert (=> b!841536 (=> (not res!571823) (not e!469610))))

(assert (=> b!841536 (= res!571823 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23137 _keys!868))))))

(declare-fun b!841537 () Bool)

(declare-fun res!571821 () Bool)

(assert (=> b!841537 (=> (not res!571821) (not e!469610))))

(assert (=> b!841537 (= res!571821 (and (= (size!23138 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23137 _keys!868) (size!23138 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37247 () Bool)

(assert (=> bm!37247 (= call!37249 (getCurrentListMapNoExtraKeys!2601 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841538 () Bool)

(declare-fun +!2050 (ListLongMap!9051 tuple2!10280) ListLongMap!9051)

(assert (=> b!841538 (= e!469611 (= call!37250 (+!2050 call!37249 (tuple2!10281 k0!854 v!557))))))

(declare-fun mapIsEmpty!24884 () Bool)

(assert (=> mapIsEmpty!24884 mapRes!24884))

(assert (= (and start!72640 res!571819) b!841529))

(assert (= (and b!841529 res!571820) b!841537))

(assert (= (and b!841537 res!571821) b!841526))

(assert (= (and b!841526 res!571825) b!841534))

(assert (= (and b!841534 res!571818) b!841536))

(assert (= (and b!841536 res!571823) b!841530))

(assert (= (and b!841530 res!571824) b!841528))

(assert (= (and b!841528 res!571822) b!841527))

(assert (= (and b!841527 c!91627) b!841538))

(assert (= (and b!841527 (not c!91627)) b!841535))

(assert (= (or b!841538 b!841535) bm!37246))

(assert (= (or b!841538 b!841535) bm!37247))

(assert (= (and b!841533 condMapEmpty!24884) mapIsEmpty!24884))

(assert (= (and b!841533 (not condMapEmpty!24884)) mapNonEmpty!24884))

(get-info :version)

(assert (= (and mapNonEmpty!24884 ((_ is ValueCellFull!7322) mapValue!24884)) b!841531))

(assert (= (and b!841533 ((_ is ValueCellFull!7322) mapDefault!24884)) b!841532))

(assert (= start!72640 b!841533))

(declare-fun m!785627 () Bool)

(assert (=> b!841529 m!785627))

(declare-fun m!785629 () Bool)

(assert (=> b!841528 m!785629))

(declare-fun m!785631 () Bool)

(assert (=> b!841526 m!785631))

(declare-fun m!785633 () Bool)

(assert (=> bm!37246 m!785633))

(declare-fun m!785635 () Bool)

(assert (=> bm!37246 m!785635))

(declare-fun m!785637 () Bool)

(assert (=> start!72640 m!785637))

(declare-fun m!785639 () Bool)

(assert (=> start!72640 m!785639))

(declare-fun m!785641 () Bool)

(assert (=> b!841534 m!785641))

(declare-fun m!785643 () Bool)

(assert (=> b!841527 m!785643))

(declare-fun m!785645 () Bool)

(assert (=> b!841538 m!785645))

(declare-fun m!785647 () Bool)

(assert (=> bm!37247 m!785647))

(declare-fun m!785649 () Bool)

(assert (=> mapNonEmpty!24884 m!785649))

(declare-fun m!785651 () Bool)

(assert (=> b!841530 m!785651))

(check-sat (not b!841530) (not b_next!13657) tp_is_empty!15523 (not b!841529) (not b!841534) (not start!72640) (not b!841526) b_and!22753 (not b!841527) (not bm!37246) (not mapNonEmpty!24884) (not bm!37247) (not b!841538))
(check-sat b_and!22753 (not b_next!13657))
