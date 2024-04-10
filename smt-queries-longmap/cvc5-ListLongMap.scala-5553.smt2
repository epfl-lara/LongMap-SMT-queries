; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73102 () Bool)

(assert start!73102)

(declare-fun b_free!14017 () Bool)

(declare-fun b_next!14017 () Bool)

(assert (=> start!73102 (= b_free!14017 (not b_next!14017))))

(declare-fun tp!49555 () Bool)

(declare-fun b_and!23193 () Bool)

(assert (=> start!73102 (= tp!49555 b_and!23193)))

(declare-fun b!850554 () Bool)

(declare-fun res!577778 () Bool)

(declare-fun e!474466 () Bool)

(assert (=> b!850554 (=> (not res!577778) (not e!474466))))

(declare-datatypes ((array!48510 0))(
  ( (array!48511 (arr!23286 (Array (_ BitVec 32) (_ BitVec 64))) (size!23726 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48510)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48510 (_ BitVec 32)) Bool)

(assert (=> b!850554 (= res!577778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850555 () Bool)

(declare-fun res!577779 () Bool)

(assert (=> b!850555 (=> (not res!577779) (not e!474466))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!850555 (= res!577779 (and (= (select (arr!23286 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!850556 () Bool)

(declare-fun e!474470 () Bool)

(assert (=> b!850556 (= e!474470 true)))

(declare-datatypes ((V!26585 0))(
  ( (V!26586 (val!8124 Int)) )
))
(declare-fun lt!382901 () V!26585)

(declare-datatypes ((tuple2!10650 0))(
  ( (tuple2!10651 (_1!5336 (_ BitVec 64)) (_2!5336 V!26585)) )
))
(declare-fun lt!382898 () tuple2!10650)

(declare-datatypes ((List!16494 0))(
  ( (Nil!16491) (Cons!16490 (h!17621 tuple2!10650) (t!22957 List!16494)) )
))
(declare-datatypes ((ListLongMap!9419 0))(
  ( (ListLongMap!9420 (toList!4725 List!16494)) )
))
(declare-fun lt!382902 () ListLongMap!9419)

(declare-fun +!2126 (ListLongMap!9419 tuple2!10650) ListLongMap!9419)

(assert (=> b!850556 (= (+!2126 lt!382902 lt!382898) (+!2126 (+!2126 lt!382902 (tuple2!10651 k!854 lt!382901)) lt!382898))))

(declare-fun lt!382896 () V!26585)

(assert (=> b!850556 (= lt!382898 (tuple2!10651 k!854 lt!382896))))

(declare-datatypes ((Unit!29043 0))(
  ( (Unit!29044) )
))
(declare-fun lt!382894 () Unit!29043)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!261 (ListLongMap!9419 (_ BitVec 64) V!26585 V!26585) Unit!29043)

(assert (=> b!850556 (= lt!382894 (addSameAsAddTwiceSameKeyDiffValues!261 lt!382902 k!854 lt!382901 lt!382896))))

(declare-fun lt!382903 () V!26585)

(declare-datatypes ((ValueCell!7637 0))(
  ( (ValueCellFull!7637 (v!10549 V!26585)) (EmptyCell!7637) )
))
(declare-datatypes ((array!48512 0))(
  ( (array!48513 (arr!23287 (Array (_ BitVec 32) ValueCell!7637)) (size!23727 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48512)

(declare-fun get!12265 (ValueCell!7637 V!26585) V!26585)

(assert (=> b!850556 (= lt!382901 (get!12265 (select (arr!23287 _values!688) from!1053) lt!382903))))

(declare-fun lt!382895 () ListLongMap!9419)

(assert (=> b!850556 (= lt!382895 (+!2126 lt!382902 (tuple2!10651 (select (arr!23286 _keys!868) from!1053) lt!382896)))))

(declare-fun v!557 () V!26585)

(assert (=> b!850556 (= lt!382896 (get!12265 (select (store (arr!23287 _values!688) i!612 (ValueCellFull!7637 v!557)) from!1053) lt!382903))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1015 (Int (_ BitVec 64)) V!26585)

(assert (=> b!850556 (= lt!382903 (dynLambda!1015 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!382900 () array!48512)

(declare-fun minValue!654 () V!26585)

(declare-fun zeroValue!654 () V!26585)

(declare-fun getCurrentListMapNoExtraKeys!2707 (array!48510 array!48512 (_ BitVec 32) (_ BitVec 32) V!26585 V!26585 (_ BitVec 32) Int) ListLongMap!9419)

(assert (=> b!850556 (= lt!382902 (getCurrentListMapNoExtraKeys!2707 _keys!868 lt!382900 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850557 () Bool)

(declare-fun res!577784 () Bool)

(assert (=> b!850557 (=> (not res!577784) (not e!474466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850557 (= res!577784 (validKeyInArray!0 k!854))))

(declare-fun b!850558 () Bool)

(declare-fun res!577781 () Bool)

(assert (=> b!850558 (=> (not res!577781) (not e!474466))))

(assert (=> b!850558 (= res!577781 (and (= (size!23727 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23726 _keys!868) (size!23727 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850559 () Bool)

(declare-fun res!577780 () Bool)

(assert (=> b!850559 (=> (not res!577780) (not e!474466))))

(assert (=> b!850559 (= res!577780 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23726 _keys!868))))))

(declare-fun bm!37903 () Bool)

(declare-fun call!37906 () ListLongMap!9419)

(assert (=> bm!37903 (= call!37906 (getCurrentListMapNoExtraKeys!2707 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850560 () Bool)

(declare-fun e!474467 () Bool)

(declare-fun call!37907 () ListLongMap!9419)

(assert (=> b!850560 (= e!474467 (= call!37907 call!37906))))

(declare-fun b!850561 () Bool)

(declare-fun res!577786 () Bool)

(assert (=> b!850561 (=> (not res!577786) (not e!474466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850561 (= res!577786 (validMask!0 mask!1196))))

(declare-fun res!577787 () Bool)

(assert (=> start!73102 (=> (not res!577787) (not e!474466))))

(assert (=> start!73102 (= res!577787 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23726 _keys!868))))))

(assert (=> start!73102 e!474466))

(declare-fun tp_is_empty!16153 () Bool)

(assert (=> start!73102 tp_is_empty!16153))

(assert (=> start!73102 true))

(assert (=> start!73102 tp!49555))

(declare-fun array_inv!18480 (array!48510) Bool)

(assert (=> start!73102 (array_inv!18480 _keys!868)))

(declare-fun e!474471 () Bool)

(declare-fun array_inv!18481 (array!48512) Bool)

(assert (=> start!73102 (and (array_inv!18481 _values!688) e!474471)))

(declare-fun b!850562 () Bool)

(declare-fun e!474472 () Bool)

(assert (=> b!850562 (= e!474472 (not e!474470))))

(declare-fun res!577782 () Bool)

(assert (=> b!850562 (=> res!577782 e!474470)))

(assert (=> b!850562 (= res!577782 (not (validKeyInArray!0 (select (arr!23286 _keys!868) from!1053))))))

(assert (=> b!850562 e!474467))

(declare-fun c!91696 () Bool)

(assert (=> b!850562 (= c!91696 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!382899 () Unit!29043)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!365 (array!48510 array!48512 (_ BitVec 32) (_ BitVec 32) V!26585 V!26585 (_ BitVec 32) (_ BitVec 64) V!26585 (_ BitVec 32) Int) Unit!29043)

(assert (=> b!850562 (= lt!382899 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!365 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850563 () Bool)

(assert (=> b!850563 (= e!474466 e!474472)))

(declare-fun res!577783 () Bool)

(assert (=> b!850563 (=> (not res!577783) (not e!474472))))

(assert (=> b!850563 (= res!577783 (= from!1053 i!612))))

(assert (=> b!850563 (= lt!382895 (getCurrentListMapNoExtraKeys!2707 _keys!868 lt!382900 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850563 (= lt!382900 (array!48513 (store (arr!23287 _values!688) i!612 (ValueCellFull!7637 v!557)) (size!23727 _values!688)))))

(declare-fun lt!382897 () ListLongMap!9419)

(assert (=> b!850563 (= lt!382897 (getCurrentListMapNoExtraKeys!2707 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!37904 () Bool)

(assert (=> bm!37904 (= call!37907 (getCurrentListMapNoExtraKeys!2707 _keys!868 lt!382900 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850564 () Bool)

(declare-fun e!474468 () Bool)

(assert (=> b!850564 (= e!474468 tp_is_empty!16153)))

(declare-fun mapNonEmpty!25829 () Bool)

(declare-fun mapRes!25829 () Bool)

(declare-fun tp!49554 () Bool)

(declare-fun e!474469 () Bool)

(assert (=> mapNonEmpty!25829 (= mapRes!25829 (and tp!49554 e!474469))))

(declare-fun mapValue!25829 () ValueCell!7637)

(declare-fun mapKey!25829 () (_ BitVec 32))

(declare-fun mapRest!25829 () (Array (_ BitVec 32) ValueCell!7637))

(assert (=> mapNonEmpty!25829 (= (arr!23287 _values!688) (store mapRest!25829 mapKey!25829 mapValue!25829))))

(declare-fun b!850565 () Bool)

(assert (=> b!850565 (= e!474471 (and e!474468 mapRes!25829))))

(declare-fun condMapEmpty!25829 () Bool)

(declare-fun mapDefault!25829 () ValueCell!7637)

