; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72658 () Bool)

(assert start!72658)

(declare-fun b_free!13675 () Bool)

(declare-fun b_next!13675 () Bool)

(assert (=> start!72658 (= b_free!13675 (not b_next!13675))))

(declare-fun tp!48124 () Bool)

(declare-fun b_and!22771 () Bool)

(assert (=> start!72658 (= tp!48124 b_and!22771)))

(declare-fun res!572036 () Bool)

(declare-fun e!469769 () Bool)

(assert (=> start!72658 (=> (not res!572036) (not e!469769))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47375 0))(
  ( (array!47376 (arr!22714 (Array (_ BitVec 32) (_ BitVec 64))) (size!23155 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47375)

(assert (=> start!72658 (= res!572036 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23155 _keys!868))))))

(assert (=> start!72658 e!469769))

(declare-fun tp_is_empty!15541 () Bool)

(assert (=> start!72658 tp_is_empty!15541))

(assert (=> start!72658 true))

(assert (=> start!72658 tp!48124))

(declare-fun array_inv!18124 (array!47375) Bool)

(assert (=> start!72658 (array_inv!18124 _keys!868)))

(declare-datatypes ((V!25769 0))(
  ( (V!25770 (val!7818 Int)) )
))
(declare-datatypes ((ValueCell!7331 0))(
  ( (ValueCellFull!7331 (v!10243 V!25769)) (EmptyCell!7331) )
))
(declare-datatypes ((array!47377 0))(
  ( (array!47378 (arr!22715 (Array (_ BitVec 32) ValueCell!7331)) (size!23156 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47377)

(declare-fun e!469773 () Bool)

(declare-fun array_inv!18125 (array!47377) Bool)

(assert (=> start!72658 (and (array_inv!18125 _values!688) e!469773)))

(declare-fun b!841877 () Bool)

(declare-fun res!572038 () Bool)

(assert (=> b!841877 (=> (not res!572038) (not e!469769))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841877 (= res!572038 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!24911 () Bool)

(declare-fun mapRes!24911 () Bool)

(assert (=> mapIsEmpty!24911 mapRes!24911))

(declare-fun b!841878 () Bool)

(declare-fun e!469771 () Bool)

(declare-datatypes ((tuple2!10298 0))(
  ( (tuple2!10299 (_1!5160 (_ BitVec 64)) (_2!5160 V!25769)) )
))
(declare-datatypes ((List!16072 0))(
  ( (Nil!16069) (Cons!16068 (h!17205 tuple2!10298) (t!22435 List!16072)) )
))
(declare-datatypes ((ListLongMap!9069 0))(
  ( (ListLongMap!9070 (toList!4550 List!16072)) )
))
(declare-fun call!37303 () ListLongMap!9069)

(declare-fun call!37304 () ListLongMap!9069)

(assert (=> b!841878 (= e!469771 (= call!37303 call!37304))))

(declare-fun b!841879 () Bool)

(declare-fun res!572040 () Bool)

(assert (=> b!841879 (=> (not res!572040) (not e!469769))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!841879 (= res!572040 (and (= (size!23156 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23155 _keys!868) (size!23156 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun v!557 () V!25769)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!841880 () Bool)

(declare-fun +!2057 (ListLongMap!9069 tuple2!10298) ListLongMap!9069)

(assert (=> b!841880 (= e!469771 (= call!37303 (+!2057 call!37304 (tuple2!10299 k0!854 v!557))))))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37300 () Bool)

(declare-fun minValue!654 () V!25769)

(declare-fun zeroValue!654 () V!25769)

(declare-fun getCurrentListMapNoExtraKeys!2610 (array!47375 array!47377 (_ BitVec 32) (_ BitVec 32) V!25769 V!25769 (_ BitVec 32) Int) ListLongMap!9069)

(assert (=> bm!37300 (= call!37304 (getCurrentListMapNoExtraKeys!2610 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841881 () Bool)

(declare-fun res!572037 () Bool)

(assert (=> b!841881 (=> (not res!572037) (not e!469769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47375 (_ BitVec 32)) Bool)

(assert (=> b!841881 (= res!572037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841882 () Bool)

(declare-fun res!572039 () Bool)

(assert (=> b!841882 (=> (not res!572039) (not e!469769))))

(declare-datatypes ((List!16073 0))(
  ( (Nil!16070) (Cons!16069 (h!17206 (_ BitVec 64)) (t!22436 List!16073)) )
))
(declare-fun arrayNoDuplicates!0 (array!47375 (_ BitVec 32) List!16073) Bool)

(assert (=> b!841882 (= res!572039 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16070))))

(declare-fun mapNonEmpty!24911 () Bool)

(declare-fun tp!48125 () Bool)

(declare-fun e!469770 () Bool)

(assert (=> mapNonEmpty!24911 (= mapRes!24911 (and tp!48125 e!469770))))

(declare-fun mapValue!24911 () ValueCell!7331)

(declare-fun mapRest!24911 () (Array (_ BitVec 32) ValueCell!7331))

(declare-fun mapKey!24911 () (_ BitVec 32))

(assert (=> mapNonEmpty!24911 (= (arr!22715 _values!688) (store mapRest!24911 mapKey!24911 mapValue!24911))))

(declare-fun b!841883 () Bool)

(declare-fun e!469774 () Bool)

(assert (=> b!841883 (= e!469774 tp_is_empty!15541)))

(declare-fun b!841884 () Bool)

(declare-fun res!572034 () Bool)

(assert (=> b!841884 (=> (not res!572034) (not e!469769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841884 (= res!572034 (validKeyInArray!0 k0!854))))

(declare-fun b!841885 () Bool)

(assert (=> b!841885 (= e!469773 (and e!469774 mapRes!24911))))

(declare-fun condMapEmpty!24911 () Bool)

(declare-fun mapDefault!24911 () ValueCell!7331)

(assert (=> b!841885 (= condMapEmpty!24911 (= (arr!22715 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7331)) mapDefault!24911)))))

(declare-fun b!841886 () Bool)

(assert (=> b!841886 (= e!469769 (not true))))

(assert (=> b!841886 e!469771))

(declare-fun c!91654 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841886 (= c!91654 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28900 0))(
  ( (Unit!28901) )
))
(declare-fun lt!381239 () Unit!28900)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!286 (array!47375 array!47377 (_ BitVec 32) (_ BitVec 32) V!25769 V!25769 (_ BitVec 32) (_ BitVec 64) V!25769 (_ BitVec 32) Int) Unit!28900)

(assert (=> b!841886 (= lt!381239 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!286 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37301 () Bool)

(assert (=> bm!37301 (= call!37303 (getCurrentListMapNoExtraKeys!2610 _keys!868 (array!47378 (store (arr!22715 _values!688) i!612 (ValueCellFull!7331 v!557)) (size!23156 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841887 () Bool)

(declare-fun res!572041 () Bool)

(assert (=> b!841887 (=> (not res!572041) (not e!469769))))

(assert (=> b!841887 (= res!572041 (and (= (select (arr!22714 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23155 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841888 () Bool)

(assert (=> b!841888 (= e!469770 tp_is_empty!15541)))

(declare-fun b!841889 () Bool)

(declare-fun res!572035 () Bool)

(assert (=> b!841889 (=> (not res!572035) (not e!469769))))

(assert (=> b!841889 (= res!572035 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23155 _keys!868))))))

(assert (= (and start!72658 res!572036) b!841877))

(assert (= (and b!841877 res!572038) b!841879))

(assert (= (and b!841879 res!572040) b!841881))

(assert (= (and b!841881 res!572037) b!841882))

(assert (= (and b!841882 res!572039) b!841889))

(assert (= (and b!841889 res!572035) b!841884))

(assert (= (and b!841884 res!572034) b!841887))

(assert (= (and b!841887 res!572041) b!841886))

(assert (= (and b!841886 c!91654) b!841880))

(assert (= (and b!841886 (not c!91654)) b!841878))

(assert (= (or b!841880 b!841878) bm!37301))

(assert (= (or b!841880 b!841878) bm!37300))

(assert (= (and b!841885 condMapEmpty!24911) mapIsEmpty!24911))

(assert (= (and b!841885 (not condMapEmpty!24911)) mapNonEmpty!24911))

(get-info :version)

(assert (= (and mapNonEmpty!24911 ((_ is ValueCellFull!7331) mapValue!24911)) b!841888))

(assert (= (and b!841885 ((_ is ValueCellFull!7331) mapDefault!24911)) b!841883))

(assert (= start!72658 b!841885))

(declare-fun m!785861 () Bool)

(assert (=> b!841877 m!785861))

(declare-fun m!785863 () Bool)

(assert (=> b!841882 m!785863))

(declare-fun m!785865 () Bool)

(assert (=> bm!37301 m!785865))

(declare-fun m!785867 () Bool)

(assert (=> bm!37301 m!785867))

(declare-fun m!785869 () Bool)

(assert (=> b!841880 m!785869))

(declare-fun m!785871 () Bool)

(assert (=> bm!37300 m!785871))

(declare-fun m!785873 () Bool)

(assert (=> b!841886 m!785873))

(declare-fun m!785875 () Bool)

(assert (=> b!841881 m!785875))

(declare-fun m!785877 () Bool)

(assert (=> mapNonEmpty!24911 m!785877))

(declare-fun m!785879 () Bool)

(assert (=> start!72658 m!785879))

(declare-fun m!785881 () Bool)

(assert (=> start!72658 m!785881))

(declare-fun m!785883 () Bool)

(assert (=> b!841884 m!785883))

(declare-fun m!785885 () Bool)

(assert (=> b!841887 m!785885))

(check-sat (not start!72658) (not b!841886) (not bm!37300) tp_is_empty!15541 (not b_next!13675) b_and!22771 (not mapNonEmpty!24911) (not bm!37301) (not b!841882) (not b!841880) (not b!841881) (not b!841884) (not b!841877))
(check-sat b_and!22771 (not b_next!13675))
