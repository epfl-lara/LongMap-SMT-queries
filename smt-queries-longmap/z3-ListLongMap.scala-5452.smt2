; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72478 () Bool)

(assert start!72478)

(declare-fun b_free!13681 () Bool)

(declare-fun b_next!13681 () Bool)

(assert (=> start!72478 (= b_free!13681 (not b_next!13681))))

(declare-fun tp!48142 () Bool)

(declare-fun b_and!22741 () Bool)

(assert (=> start!72478 (= tp!48142 b_and!22741)))

(declare-fun b!840852 () Bool)

(declare-fun res!571652 () Bool)

(declare-fun e!469094 () Bool)

(assert (=> b!840852 (=> (not res!571652) (not e!469094))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47347 0))(
  ( (array!47348 (arr!22705 (Array (_ BitVec 32) (_ BitVec 64))) (size!23147 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47347)

(declare-datatypes ((V!25777 0))(
  ( (V!25778 (val!7821 Int)) )
))
(declare-datatypes ((ValueCell!7334 0))(
  ( (ValueCellFull!7334 (v!10240 V!25777)) (EmptyCell!7334) )
))
(declare-datatypes ((array!47349 0))(
  ( (array!47350 (arr!22706 (Array (_ BitVec 32) ValueCell!7334)) (size!23148 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47349)

(assert (=> b!840852 (= res!571652 (and (= (size!23148 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23147 _keys!868) (size!23148 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840853 () Bool)

(declare-fun res!571656 () Bool)

(assert (=> b!840853 (=> (not res!571656) (not e!469094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47347 (_ BitVec 32)) Bool)

(assert (=> b!840853 (= res!571656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840854 () Bool)

(declare-fun res!571659 () Bool)

(assert (=> b!840854 (=> (not res!571659) (not e!469094))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!840854 (= res!571659 (and (= (select (arr!22705 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23147 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840855 () Bool)

(declare-fun res!571655 () Bool)

(assert (=> b!840855 (=> (not res!571655) (not e!469094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840855 (= res!571655 (validMask!0 mask!1196))))

(declare-fun b!840857 () Bool)

(declare-fun e!469096 () Bool)

(declare-fun e!469093 () Bool)

(declare-fun mapRes!24920 () Bool)

(assert (=> b!840857 (= e!469096 (and e!469093 mapRes!24920))))

(declare-fun condMapEmpty!24920 () Bool)

(declare-fun mapDefault!24920 () ValueCell!7334)

(assert (=> b!840857 (= condMapEmpty!24920 (= (arr!22706 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7334)) mapDefault!24920)))))

(declare-fun mapNonEmpty!24920 () Bool)

(declare-fun tp!48143 () Bool)

(declare-fun e!469097 () Bool)

(assert (=> mapNonEmpty!24920 (= mapRes!24920 (and tp!48143 e!469097))))

(declare-fun mapKey!24920 () (_ BitVec 32))

(declare-fun mapValue!24920 () ValueCell!7334)

(declare-fun mapRest!24920 () (Array (_ BitVec 32) ValueCell!7334))

(assert (=> mapNonEmpty!24920 (= (arr!22706 _values!688) (store mapRest!24920 mapKey!24920 mapValue!24920))))

(declare-fun b!840858 () Bool)

(declare-fun res!571657 () Bool)

(assert (=> b!840858 (=> (not res!571657) (not e!469094))))

(declare-datatypes ((List!16165 0))(
  ( (Nil!16162) (Cons!16161 (h!17292 (_ BitVec 64)) (t!22527 List!16165)) )
))
(declare-fun arrayNoDuplicates!0 (array!47347 (_ BitVec 32) List!16165) Bool)

(assert (=> b!840858 (= res!571657 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16162))))

(declare-fun b!840859 () Bool)

(assert (=> b!840859 (= e!469094 (not true))))

(declare-fun e!469095 () Bool)

(assert (=> b!840859 e!469095))

(declare-fun c!91316 () Bool)

(assert (=> b!840859 (= c!91316 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28837 0))(
  ( (Unit!28838) )
))
(declare-fun lt!380651 () Unit!28837)

(declare-fun v!557 () V!25777)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!25777)

(declare-fun zeroValue!654 () V!25777)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!293 (array!47347 array!47349 (_ BitVec 32) (_ BitVec 32) V!25777 V!25777 (_ BitVec 32) (_ BitVec 64) V!25777 (_ BitVec 32) Int) Unit!28837)

(assert (=> b!840859 (= lt!380651 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!293 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24920 () Bool)

(assert (=> mapIsEmpty!24920 mapRes!24920))

(declare-fun b!840860 () Bool)

(declare-fun tp_is_empty!15547 () Bool)

(assert (=> b!840860 (= e!469097 tp_is_empty!15547)))

(declare-fun b!840861 () Bool)

(declare-fun res!571658 () Bool)

(assert (=> b!840861 (=> (not res!571658) (not e!469094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840861 (= res!571658 (validKeyInArray!0 k0!854))))

(declare-fun b!840862 () Bool)

(declare-datatypes ((tuple2!10390 0))(
  ( (tuple2!10391 (_1!5206 (_ BitVec 64)) (_2!5206 V!25777)) )
))
(declare-datatypes ((List!16166 0))(
  ( (Nil!16163) (Cons!16162 (h!17293 tuple2!10390) (t!22528 List!16166)) )
))
(declare-datatypes ((ListLongMap!9149 0))(
  ( (ListLongMap!9150 (toList!4590 List!16166)) )
))
(declare-fun call!37250 () ListLongMap!9149)

(declare-fun call!37251 () ListLongMap!9149)

(assert (=> b!840862 (= e!469095 (= call!37250 call!37251))))

(declare-fun b!840863 () Bool)

(declare-fun res!571654 () Bool)

(assert (=> b!840863 (=> (not res!571654) (not e!469094))))

(assert (=> b!840863 (= res!571654 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23147 _keys!868))))))

(declare-fun bm!37247 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2606 (array!47347 array!47349 (_ BitVec 32) (_ BitVec 32) V!25777 V!25777 (_ BitVec 32) Int) ListLongMap!9149)

(assert (=> bm!37247 (= call!37251 (getCurrentListMapNoExtraKeys!2606 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!571653 () Bool)

(assert (=> start!72478 (=> (not res!571653) (not e!469094))))

(assert (=> start!72478 (= res!571653 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23147 _keys!868))))))

(assert (=> start!72478 e!469094))

(assert (=> start!72478 tp_is_empty!15547))

(assert (=> start!72478 true))

(assert (=> start!72478 tp!48142))

(declare-fun array_inv!18146 (array!47347) Bool)

(assert (=> start!72478 (array_inv!18146 _keys!868)))

(declare-fun array_inv!18147 (array!47349) Bool)

(assert (=> start!72478 (and (array_inv!18147 _values!688) e!469096)))

(declare-fun b!840856 () Bool)

(declare-fun +!2075 (ListLongMap!9149 tuple2!10390) ListLongMap!9149)

(assert (=> b!840856 (= e!469095 (= call!37250 (+!2075 call!37251 (tuple2!10391 k0!854 v!557))))))

(declare-fun b!840864 () Bool)

(assert (=> b!840864 (= e!469093 tp_is_empty!15547)))

(declare-fun bm!37248 () Bool)

(assert (=> bm!37248 (= call!37250 (getCurrentListMapNoExtraKeys!2606 _keys!868 (array!47350 (store (arr!22706 _values!688) i!612 (ValueCellFull!7334 v!557)) (size!23148 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72478 res!571653) b!840855))

(assert (= (and b!840855 res!571655) b!840852))

(assert (= (and b!840852 res!571652) b!840853))

(assert (= (and b!840853 res!571656) b!840858))

(assert (= (and b!840858 res!571657) b!840863))

(assert (= (and b!840863 res!571654) b!840861))

(assert (= (and b!840861 res!571658) b!840854))

(assert (= (and b!840854 res!571659) b!840859))

(assert (= (and b!840859 c!91316) b!840856))

(assert (= (and b!840859 (not c!91316)) b!840862))

(assert (= (or b!840856 b!840862) bm!37248))

(assert (= (or b!840856 b!840862) bm!37247))

(assert (= (and b!840857 condMapEmpty!24920) mapIsEmpty!24920))

(assert (= (and b!840857 (not condMapEmpty!24920)) mapNonEmpty!24920))

(get-info :version)

(assert (= (and mapNonEmpty!24920 ((_ is ValueCellFull!7334) mapValue!24920)) b!840860))

(assert (= (and b!840857 ((_ is ValueCellFull!7334) mapDefault!24920)) b!840864))

(assert (= start!72478 b!840857))

(declare-fun m!783893 () Bool)

(assert (=> bm!37247 m!783893))

(declare-fun m!783895 () Bool)

(assert (=> b!840859 m!783895))

(declare-fun m!783897 () Bool)

(assert (=> mapNonEmpty!24920 m!783897))

(declare-fun m!783899 () Bool)

(assert (=> start!72478 m!783899))

(declare-fun m!783901 () Bool)

(assert (=> start!72478 m!783901))

(declare-fun m!783903 () Bool)

(assert (=> b!840856 m!783903))

(declare-fun m!783905 () Bool)

(assert (=> b!840861 m!783905))

(declare-fun m!783907 () Bool)

(assert (=> bm!37248 m!783907))

(declare-fun m!783909 () Bool)

(assert (=> bm!37248 m!783909))

(declare-fun m!783911 () Bool)

(assert (=> b!840853 m!783911))

(declare-fun m!783913 () Bool)

(assert (=> b!840855 m!783913))

(declare-fun m!783915 () Bool)

(assert (=> b!840858 m!783915))

(declare-fun m!783917 () Bool)

(assert (=> b!840854 m!783917))

(check-sat (not b!840856) b_and!22741 (not b_next!13681) (not b!840859) (not b!840853) (not mapNonEmpty!24920) (not bm!37247) (not start!72478) (not bm!37248) tp_is_empty!15547 (not b!840855) (not b!840861) (not b!840858))
(check-sat b_and!22741 (not b_next!13681))
