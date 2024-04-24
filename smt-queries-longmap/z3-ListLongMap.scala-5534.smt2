; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73156 () Bool)

(assert start!73156)

(declare-fun b_free!13903 () Bool)

(declare-fun b_next!13903 () Bool)

(assert (=> start!73156 (= b_free!13903 (not b_next!13903))))

(declare-fun tp!49214 () Bool)

(declare-fun b_and!22999 () Bool)

(assert (=> start!73156 (= tp!49214 b_and!22999)))

(declare-fun b!848827 () Bool)

(declare-fun e!473708 () Bool)

(assert (=> b!848827 (= e!473708 (not true))))

(declare-fun e!473705 () Bool)

(assert (=> b!848827 e!473705))

(declare-fun c!91807 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848827 (= c!91807 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!26433 0))(
  ( (V!26434 (val!8067 Int)) )
))
(declare-fun v!557 () V!26433)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7580 0))(
  ( (ValueCellFull!7580 (v!10492 V!26433)) (EmptyCell!7580) )
))
(declare-datatypes ((array!48339 0))(
  ( (array!48340 (arr!23196 (Array (_ BitVec 32) ValueCell!7580)) (size!23637 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48339)

(declare-fun minValue!654 () V!26433)

(declare-fun zeroValue!654 () V!26433)

(declare-datatypes ((array!48341 0))(
  ( (array!48342 (arr!23197 (Array (_ BitVec 32) (_ BitVec 64))) (size!23638 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48341)

(declare-datatypes ((Unit!28968 0))(
  ( (Unit!28969) )
))
(declare-fun lt!382237 () Unit!28968)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!320 (array!48341 array!48339 (_ BitVec 32) (_ BitVec 32) V!26433 V!26433 (_ BitVec 32) (_ BitVec 64) V!26433 (_ BitVec 32) Int) Unit!28968)

(assert (=> b!848827 (= lt!382237 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!320 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848828 () Bool)

(declare-fun e!473704 () Bool)

(assert (=> b!848828 (= e!473704 e!473708)))

(declare-fun res!576440 () Bool)

(assert (=> b!848828 (=> (not res!576440) (not e!473708))))

(assert (=> b!848828 (= res!576440 (= from!1053 i!612))))

(declare-datatypes ((tuple2!10470 0))(
  ( (tuple2!10471 (_1!5246 (_ BitVec 64)) (_2!5246 V!26433)) )
))
(declare-datatypes ((List!16340 0))(
  ( (Nil!16337) (Cons!16336 (h!17473 tuple2!10470) (t!22703 List!16340)) )
))
(declare-datatypes ((ListLongMap!9241 0))(
  ( (ListLongMap!9242 (toList!4636 List!16340)) )
))
(declare-fun lt!382236 () ListLongMap!9241)

(declare-fun lt!382238 () array!48339)

(declare-fun getCurrentListMapNoExtraKeys!2694 (array!48341 array!48339 (_ BitVec 32) (_ BitVec 32) V!26433 V!26433 (_ BitVec 32) Int) ListLongMap!9241)

(assert (=> b!848828 (= lt!382236 (getCurrentListMapNoExtraKeys!2694 _keys!868 lt!382238 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848828 (= lt!382238 (array!48340 (store (arr!23196 _values!688) i!612 (ValueCellFull!7580 v!557)) (size!23637 _values!688)))))

(declare-fun lt!382235 () ListLongMap!9241)

(assert (=> b!848828 (= lt!382235 (getCurrentListMapNoExtraKeys!2694 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848829 () Bool)

(declare-fun res!576437 () Bool)

(assert (=> b!848829 (=> (not res!576437) (not e!473704))))

(assert (=> b!848829 (= res!576437 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23638 _keys!868))))))

(declare-fun b!848830 () Bool)

(declare-fun res!576439 () Bool)

(assert (=> b!848830 (=> (not res!576439) (not e!473704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848830 (= res!576439 (validMask!0 mask!1196))))

(declare-fun b!848831 () Bool)

(declare-fun e!473706 () Bool)

(declare-fun tp_is_empty!16039 () Bool)

(assert (=> b!848831 (= e!473706 tp_is_empty!16039)))

(declare-fun call!37609 () ListLongMap!9241)

(declare-fun b!848832 () Bool)

(declare-fun call!37610 () ListLongMap!9241)

(declare-fun +!2094 (ListLongMap!9241 tuple2!10470) ListLongMap!9241)

(assert (=> b!848832 (= e!473705 (= call!37610 (+!2094 call!37609 (tuple2!10471 k0!854 v!557))))))

(declare-fun b!848833 () Bool)

(declare-fun res!576442 () Bool)

(assert (=> b!848833 (=> (not res!576442) (not e!473704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48341 (_ BitVec 32)) Bool)

(assert (=> b!848833 (= res!576442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848834 () Bool)

(assert (=> b!848834 (= e!473705 (= call!37610 call!37609))))

(declare-fun mapNonEmpty!25658 () Bool)

(declare-fun mapRes!25658 () Bool)

(declare-fun tp!49213 () Bool)

(assert (=> mapNonEmpty!25658 (= mapRes!25658 (and tp!49213 e!473706))))

(declare-fun mapRest!25658 () (Array (_ BitVec 32) ValueCell!7580))

(declare-fun mapKey!25658 () (_ BitVec 32))

(declare-fun mapValue!25658 () ValueCell!7580)

(assert (=> mapNonEmpty!25658 (= (arr!23196 _values!688) (store mapRest!25658 mapKey!25658 mapValue!25658))))

(declare-fun mapIsEmpty!25658 () Bool)

(assert (=> mapIsEmpty!25658 mapRes!25658))

(declare-fun b!848835 () Bool)

(declare-fun e!473707 () Bool)

(declare-fun e!473709 () Bool)

(assert (=> b!848835 (= e!473707 (and e!473709 mapRes!25658))))

(declare-fun condMapEmpty!25658 () Bool)

(declare-fun mapDefault!25658 () ValueCell!7580)

(assert (=> b!848835 (= condMapEmpty!25658 (= (arr!23196 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7580)) mapDefault!25658)))))

(declare-fun res!576438 () Bool)

(assert (=> start!73156 (=> (not res!576438) (not e!473704))))

(assert (=> start!73156 (= res!576438 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23638 _keys!868))))))

(assert (=> start!73156 e!473704))

(assert (=> start!73156 tp_is_empty!16039))

(assert (=> start!73156 true))

(assert (=> start!73156 tp!49214))

(declare-fun array_inv!18468 (array!48341) Bool)

(assert (=> start!73156 (array_inv!18468 _keys!868)))

(declare-fun array_inv!18469 (array!48339) Bool)

(assert (=> start!73156 (and (array_inv!18469 _values!688) e!473707)))

(declare-fun b!848836 () Bool)

(declare-fun res!576444 () Bool)

(assert (=> b!848836 (=> (not res!576444) (not e!473704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848836 (= res!576444 (validKeyInArray!0 k0!854))))

(declare-fun bm!37606 () Bool)

(assert (=> bm!37606 (= call!37610 (getCurrentListMapNoExtraKeys!2694 _keys!868 lt!382238 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848837 () Bool)

(assert (=> b!848837 (= e!473709 tp_is_empty!16039)))

(declare-fun bm!37607 () Bool)

(assert (=> bm!37607 (= call!37609 (getCurrentListMapNoExtraKeys!2694 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848838 () Bool)

(declare-fun res!576445 () Bool)

(assert (=> b!848838 (=> (not res!576445) (not e!473704))))

(assert (=> b!848838 (= res!576445 (and (= (size!23637 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23638 _keys!868) (size!23637 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848839 () Bool)

(declare-fun res!576443 () Bool)

(assert (=> b!848839 (=> (not res!576443) (not e!473704))))

(declare-datatypes ((List!16341 0))(
  ( (Nil!16338) (Cons!16337 (h!17474 (_ BitVec 64)) (t!22704 List!16341)) )
))
(declare-fun arrayNoDuplicates!0 (array!48341 (_ BitVec 32) List!16341) Bool)

(assert (=> b!848839 (= res!576443 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16338))))

(declare-fun b!848840 () Bool)

(declare-fun res!576441 () Bool)

(assert (=> b!848840 (=> (not res!576441) (not e!473704))))

(assert (=> b!848840 (= res!576441 (and (= (select (arr!23197 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73156 res!576438) b!848830))

(assert (= (and b!848830 res!576439) b!848838))

(assert (= (and b!848838 res!576445) b!848833))

(assert (= (and b!848833 res!576442) b!848839))

(assert (= (and b!848839 res!576443) b!848829))

(assert (= (and b!848829 res!576437) b!848836))

(assert (= (and b!848836 res!576444) b!848840))

(assert (= (and b!848840 res!576441) b!848828))

(assert (= (and b!848828 res!576440) b!848827))

(assert (= (and b!848827 c!91807) b!848832))

(assert (= (and b!848827 (not c!91807)) b!848834))

(assert (= (or b!848832 b!848834) bm!37606))

(assert (= (or b!848832 b!848834) bm!37607))

(assert (= (and b!848835 condMapEmpty!25658) mapIsEmpty!25658))

(assert (= (and b!848835 (not condMapEmpty!25658)) mapNonEmpty!25658))

(get-info :version)

(assert (= (and mapNonEmpty!25658 ((_ is ValueCellFull!7580) mapValue!25658)) b!848831))

(assert (= (and b!848835 ((_ is ValueCellFull!7580) mapDefault!25658)) b!848837))

(assert (= start!73156 b!848835))

(declare-fun m!790145 () Bool)

(assert (=> b!848828 m!790145))

(declare-fun m!790147 () Bool)

(assert (=> b!848828 m!790147))

(declare-fun m!790149 () Bool)

(assert (=> b!848828 m!790149))

(declare-fun m!790151 () Bool)

(assert (=> b!848840 m!790151))

(declare-fun m!790153 () Bool)

(assert (=> b!848830 m!790153))

(declare-fun m!790155 () Bool)

(assert (=> bm!37606 m!790155))

(declare-fun m!790157 () Bool)

(assert (=> b!848836 m!790157))

(declare-fun m!790159 () Bool)

(assert (=> b!848833 m!790159))

(declare-fun m!790161 () Bool)

(assert (=> bm!37607 m!790161))

(declare-fun m!790163 () Bool)

(assert (=> b!848839 m!790163))

(declare-fun m!790165 () Bool)

(assert (=> start!73156 m!790165))

(declare-fun m!790167 () Bool)

(assert (=> start!73156 m!790167))

(declare-fun m!790169 () Bool)

(assert (=> b!848832 m!790169))

(declare-fun m!790171 () Bool)

(assert (=> b!848827 m!790171))

(declare-fun m!790173 () Bool)

(assert (=> mapNonEmpty!25658 m!790173))

(check-sat (not mapNonEmpty!25658) tp_is_empty!16039 (not b!848830) b_and!22999 (not bm!37606) (not b!848833) (not bm!37607) (not b!848832) (not b!848828) (not b_next!13903) (not b!848827) (not b!848836) (not start!73156) (not b!848839))
(check-sat b_and!22999 (not b_next!13903))
