; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72970 () Bool)

(assert start!72970)

(declare-fun b_free!13903 () Bool)

(declare-fun b_next!13903 () Bool)

(assert (=> start!72970 (= b_free!13903 (not b_next!13903))))

(declare-fun tp!49213 () Bool)

(declare-fun b_and!22963 () Bool)

(assert (=> start!72970 (= tp!49213 b_and!22963)))

(declare-fun b!847685 () Bool)

(declare-fun res!575990 () Bool)

(declare-fun e!472980 () Bool)

(assert (=> b!847685 (=> (not res!575990) (not e!472980))))

(declare-datatypes ((array!48285 0))(
  ( (array!48286 (arr!23174 (Array (_ BitVec 32) (_ BitVec 64))) (size!23616 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48285)

(declare-datatypes ((List!16424 0))(
  ( (Nil!16421) (Cons!16420 (h!17551 (_ BitVec 64)) (t!22786 List!16424)) )
))
(declare-fun arrayNoDuplicates!0 (array!48285 (_ BitVec 32) List!16424) Bool)

(assert (=> b!847685 (= res!575990 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16421))))

(declare-fun b!847686 () Bool)

(declare-fun res!575983 () Bool)

(assert (=> b!847686 (=> (not res!575983) (not e!472980))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!847686 (= res!575983 (and (= (select (arr!23174 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847687 () Bool)

(declare-fun res!575991 () Bool)

(assert (=> b!847687 (=> (not res!575991) (not e!472980))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847687 (= res!575991 (validMask!0 mask!1196))))

(declare-fun res!575986 () Bool)

(assert (=> start!72970 (=> (not res!575986) (not e!472980))))

(assert (=> start!72970 (= res!575986 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23616 _keys!868))))))

(assert (=> start!72970 e!472980))

(declare-fun tp_is_empty!16039 () Bool)

(assert (=> start!72970 tp_is_empty!16039))

(assert (=> start!72970 true))

(assert (=> start!72970 tp!49213))

(declare-fun array_inv!18480 (array!48285) Bool)

(assert (=> start!72970 (array_inv!18480 _keys!868)))

(declare-datatypes ((V!26433 0))(
  ( (V!26434 (val!8067 Int)) )
))
(declare-datatypes ((ValueCell!7580 0))(
  ( (ValueCellFull!7580 (v!10486 V!26433)) (EmptyCell!7580) )
))
(declare-datatypes ((array!48287 0))(
  ( (array!48288 (arr!23175 (Array (_ BitVec 32) ValueCell!7580)) (size!23617 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48287)

(declare-fun e!472977 () Bool)

(declare-fun array_inv!18481 (array!48287) Bool)

(assert (=> start!72970 (and (array_inv!18481 _values!688) e!472977)))

(declare-fun b!847688 () Bool)

(declare-fun e!472975 () Bool)

(assert (=> b!847688 (= e!472975 (not true))))

(declare-fun e!472976 () Bool)

(assert (=> b!847688 e!472976))

(declare-fun c!91460 () Bool)

(assert (=> b!847688 (= c!91460 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26433)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28899 0))(
  ( (Unit!28900) )
))
(declare-fun lt!381641 () Unit!28899)

(declare-fun minValue!654 () V!26433)

(declare-fun zeroValue!654 () V!26433)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!324 (array!48285 array!48287 (_ BitVec 32) (_ BitVec 32) V!26433 V!26433 (_ BitVec 32) (_ BitVec 64) V!26433 (_ BitVec 32) Int) Unit!28899)

(assert (=> b!847688 (= lt!381641 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!324 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847689 () Bool)

(declare-fun res!575988 () Bool)

(assert (=> b!847689 (=> (not res!575988) (not e!472980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847689 (= res!575988 (validKeyInArray!0 k0!854))))

(declare-fun lt!381640 () array!48287)

(declare-fun bm!37535 () Bool)

(declare-datatypes ((tuple2!10570 0))(
  ( (tuple2!10571 (_1!5296 (_ BitVec 64)) (_2!5296 V!26433)) )
))
(declare-datatypes ((List!16425 0))(
  ( (Nil!16422) (Cons!16421 (h!17552 tuple2!10570) (t!22787 List!16425)) )
))
(declare-datatypes ((ListLongMap!9329 0))(
  ( (ListLongMap!9330 (toList!4680 List!16425)) )
))
(declare-fun call!37539 () ListLongMap!9329)

(declare-fun getCurrentListMapNoExtraKeys!2693 (array!48285 array!48287 (_ BitVec 32) (_ BitVec 32) V!26433 V!26433 (_ BitVec 32) Int) ListLongMap!9329)

(assert (=> bm!37535 (= call!37539 (getCurrentListMapNoExtraKeys!2693 _keys!868 lt!381640 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847690 () Bool)

(declare-fun e!472974 () Bool)

(assert (=> b!847690 (= e!472974 tp_is_empty!16039)))

(declare-fun b!847691 () Bool)

(declare-fun res!575989 () Bool)

(assert (=> b!847691 (=> (not res!575989) (not e!472980))))

(assert (=> b!847691 (= res!575989 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23616 _keys!868))))))

(declare-fun call!37538 () ListLongMap!9329)

(declare-fun b!847692 () Bool)

(declare-fun +!2111 (ListLongMap!9329 tuple2!10570) ListLongMap!9329)

(assert (=> b!847692 (= e!472976 (= call!37539 (+!2111 call!37538 (tuple2!10571 k0!854 v!557))))))

(declare-fun bm!37536 () Bool)

(assert (=> bm!37536 (= call!37538 (getCurrentListMapNoExtraKeys!2693 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847693 () Bool)

(declare-fun res!575985 () Bool)

(assert (=> b!847693 (=> (not res!575985) (not e!472980))))

(assert (=> b!847693 (= res!575985 (and (= (size!23617 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23616 _keys!868) (size!23617 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847694 () Bool)

(assert (=> b!847694 (= e!472980 e!472975)))

(declare-fun res!575984 () Bool)

(assert (=> b!847694 (=> (not res!575984) (not e!472975))))

(assert (=> b!847694 (= res!575984 (= from!1053 i!612))))

(declare-fun lt!381639 () ListLongMap!9329)

(assert (=> b!847694 (= lt!381639 (getCurrentListMapNoExtraKeys!2693 _keys!868 lt!381640 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!847694 (= lt!381640 (array!48288 (store (arr!23175 _values!688) i!612 (ValueCellFull!7580 v!557)) (size!23617 _values!688)))))

(declare-fun lt!381638 () ListLongMap!9329)

(assert (=> b!847694 (= lt!381638 (getCurrentListMapNoExtraKeys!2693 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847695 () Bool)

(declare-fun e!472978 () Bool)

(assert (=> b!847695 (= e!472978 tp_is_empty!16039)))

(declare-fun mapNonEmpty!25658 () Bool)

(declare-fun mapRes!25658 () Bool)

(declare-fun tp!49214 () Bool)

(assert (=> mapNonEmpty!25658 (= mapRes!25658 (and tp!49214 e!472978))))

(declare-fun mapRest!25658 () (Array (_ BitVec 32) ValueCell!7580))

(declare-fun mapValue!25658 () ValueCell!7580)

(declare-fun mapKey!25658 () (_ BitVec 32))

(assert (=> mapNonEmpty!25658 (= (arr!23175 _values!688) (store mapRest!25658 mapKey!25658 mapValue!25658))))

(declare-fun b!847696 () Bool)

(declare-fun res!575987 () Bool)

(assert (=> b!847696 (=> (not res!575987) (not e!472980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48285 (_ BitVec 32)) Bool)

(assert (=> b!847696 (= res!575987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847697 () Bool)

(assert (=> b!847697 (= e!472977 (and e!472974 mapRes!25658))))

(declare-fun condMapEmpty!25658 () Bool)

(declare-fun mapDefault!25658 () ValueCell!7580)

(assert (=> b!847697 (= condMapEmpty!25658 (= (arr!23175 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7580)) mapDefault!25658)))))

(declare-fun b!847698 () Bool)

(assert (=> b!847698 (= e!472976 (= call!37539 call!37538))))

(declare-fun mapIsEmpty!25658 () Bool)

(assert (=> mapIsEmpty!25658 mapRes!25658))

(assert (= (and start!72970 res!575986) b!847687))

(assert (= (and b!847687 res!575991) b!847693))

(assert (= (and b!847693 res!575985) b!847696))

(assert (= (and b!847696 res!575987) b!847685))

(assert (= (and b!847685 res!575990) b!847691))

(assert (= (and b!847691 res!575989) b!847689))

(assert (= (and b!847689 res!575988) b!847686))

(assert (= (and b!847686 res!575983) b!847694))

(assert (= (and b!847694 res!575984) b!847688))

(assert (= (and b!847688 c!91460) b!847692))

(assert (= (and b!847688 (not c!91460)) b!847698))

(assert (= (or b!847692 b!847698) bm!37535))

(assert (= (or b!847692 b!847698) bm!37536))

(assert (= (and b!847697 condMapEmpty!25658) mapIsEmpty!25658))

(assert (= (and b!847697 (not condMapEmpty!25658)) mapNonEmpty!25658))

(get-info :version)

(assert (= (and mapNonEmpty!25658 ((_ is ValueCellFull!7580) mapValue!25658)) b!847695))

(assert (= (and b!847697 ((_ is ValueCellFull!7580) mapDefault!25658)) b!847690))

(assert (= start!72970 b!847697))

(declare-fun m!788099 () Bool)

(assert (=> b!847689 m!788099))

(declare-fun m!788101 () Bool)

(assert (=> b!847688 m!788101))

(declare-fun m!788103 () Bool)

(assert (=> b!847696 m!788103))

(declare-fun m!788105 () Bool)

(assert (=> b!847694 m!788105))

(declare-fun m!788107 () Bool)

(assert (=> b!847694 m!788107))

(declare-fun m!788109 () Bool)

(assert (=> b!847694 m!788109))

(declare-fun m!788111 () Bool)

(assert (=> bm!37535 m!788111))

(declare-fun m!788113 () Bool)

(assert (=> start!72970 m!788113))

(declare-fun m!788115 () Bool)

(assert (=> start!72970 m!788115))

(declare-fun m!788117 () Bool)

(assert (=> b!847685 m!788117))

(declare-fun m!788119 () Bool)

(assert (=> b!847686 m!788119))

(declare-fun m!788121 () Bool)

(assert (=> b!847687 m!788121))

(declare-fun m!788123 () Bool)

(assert (=> bm!37536 m!788123))

(declare-fun m!788125 () Bool)

(assert (=> mapNonEmpty!25658 m!788125))

(declare-fun m!788127 () Bool)

(assert (=> b!847692 m!788127))

(check-sat (not bm!37536) (not b!847689) (not bm!37535) b_and!22963 (not start!72970) (not b!847685) (not mapNonEmpty!25658) tp_is_empty!16039 (not b!847694) (not b_next!13903) (not b!847696) (not b!847692) (not b!847687) (not b!847688))
(check-sat b_and!22963 (not b_next!13903))
