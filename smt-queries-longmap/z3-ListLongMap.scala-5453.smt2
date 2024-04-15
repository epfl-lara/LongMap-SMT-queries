; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72484 () Bool)

(assert start!72484)

(declare-fun b_free!13687 () Bool)

(declare-fun b_next!13687 () Bool)

(assert (=> start!72484 (= b_free!13687 (not b_next!13687))))

(declare-fun tp!48161 () Bool)

(declare-fun b_and!22747 () Bool)

(assert (=> start!72484 (= tp!48161 b_and!22747)))

(declare-fun bm!37265 () Bool)

(declare-datatypes ((V!25785 0))(
  ( (V!25786 (val!7824 Int)) )
))
(declare-fun v!557 () V!25785)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47359 0))(
  ( (array!47360 (arr!22711 (Array (_ BitVec 32) (_ BitVec 64))) (size!23153 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47359)

(declare-datatypes ((tuple2!10396 0))(
  ( (tuple2!10397 (_1!5209 (_ BitVec 64)) (_2!5209 V!25785)) )
))
(declare-datatypes ((List!16171 0))(
  ( (Nil!16168) (Cons!16167 (h!17298 tuple2!10396) (t!22533 List!16171)) )
))
(declare-datatypes ((ListLongMap!9155 0))(
  ( (ListLongMap!9156 (toList!4593 List!16171)) )
))
(declare-fun call!37269 () ListLongMap!9155)

(declare-datatypes ((ValueCell!7337 0))(
  ( (ValueCellFull!7337 (v!10243 V!25785)) (EmptyCell!7337) )
))
(declare-datatypes ((array!47361 0))(
  ( (array!47362 (arr!22712 (Array (_ BitVec 32) ValueCell!7337)) (size!23154 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47361)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25785)

(declare-fun zeroValue!654 () V!25785)

(declare-fun getCurrentListMapNoExtraKeys!2609 (array!47359 array!47361 (_ BitVec 32) (_ BitVec 32) V!25785 V!25785 (_ BitVec 32) Int) ListLongMap!9155)

(assert (=> bm!37265 (= call!37269 (getCurrentListMapNoExtraKeys!2609 _keys!868 (array!47362 (store (arr!22712 _values!688) i!612 (ValueCellFull!7337 v!557)) (size!23154 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840969 () Bool)

(declare-fun e!469147 () Bool)

(declare-fun call!37268 () ListLongMap!9155)

(assert (=> b!840969 (= e!469147 (= call!37269 call!37268))))

(declare-fun b!840970 () Bool)

(declare-fun res!571727 () Bool)

(declare-fun e!469148 () Bool)

(assert (=> b!840970 (=> (not res!571727) (not e!469148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47359 (_ BitVec 32)) Bool)

(assert (=> b!840970 (= res!571727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24929 () Bool)

(declare-fun mapRes!24929 () Bool)

(declare-fun tp!48160 () Bool)

(declare-fun e!469150 () Bool)

(assert (=> mapNonEmpty!24929 (= mapRes!24929 (and tp!48160 e!469150))))

(declare-fun mapRest!24929 () (Array (_ BitVec 32) ValueCell!7337))

(declare-fun mapValue!24929 () ValueCell!7337)

(declare-fun mapKey!24929 () (_ BitVec 32))

(assert (=> mapNonEmpty!24929 (= (arr!22712 _values!688) (store mapRest!24929 mapKey!24929 mapValue!24929))))

(declare-fun b!840971 () Bool)

(declare-fun res!571725 () Bool)

(assert (=> b!840971 (=> (not res!571725) (not e!469148))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!840971 (= res!571725 (and (= (select (arr!22711 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23153 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840972 () Bool)

(declare-fun res!571728 () Bool)

(assert (=> b!840972 (=> (not res!571728) (not e!469148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840972 (= res!571728 (validMask!0 mask!1196))))

(declare-fun res!571729 () Bool)

(assert (=> start!72484 (=> (not res!571729) (not e!469148))))

(assert (=> start!72484 (= res!571729 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23153 _keys!868))))))

(assert (=> start!72484 e!469148))

(declare-fun tp_is_empty!15553 () Bool)

(assert (=> start!72484 tp_is_empty!15553))

(assert (=> start!72484 true))

(assert (=> start!72484 tp!48161))

(declare-fun array_inv!18148 (array!47359) Bool)

(assert (=> start!72484 (array_inv!18148 _keys!868)))

(declare-fun e!469149 () Bool)

(declare-fun array_inv!18149 (array!47361) Bool)

(assert (=> start!72484 (and (array_inv!18149 _values!688) e!469149)))

(declare-fun b!840973 () Bool)

(declare-fun res!571724 () Bool)

(assert (=> b!840973 (=> (not res!571724) (not e!469148))))

(assert (=> b!840973 (= res!571724 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23153 _keys!868))))))

(declare-fun b!840974 () Bool)

(declare-fun +!2077 (ListLongMap!9155 tuple2!10396) ListLongMap!9155)

(assert (=> b!840974 (= e!469147 (= call!37269 (+!2077 call!37268 (tuple2!10397 k0!854 v!557))))))

(declare-fun b!840975 () Bool)

(assert (=> b!840975 (= e!469148 (not true))))

(assert (=> b!840975 e!469147))

(declare-fun c!91325 () Bool)

(assert (=> b!840975 (= c!91325 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28839 0))(
  ( (Unit!28840) )
))
(declare-fun lt!380660 () Unit!28839)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!294 (array!47359 array!47361 (_ BitVec 32) (_ BitVec 32) V!25785 V!25785 (_ BitVec 32) (_ BitVec 64) V!25785 (_ BitVec 32) Int) Unit!28839)

(assert (=> b!840975 (= lt!380660 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!294 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24929 () Bool)

(assert (=> mapIsEmpty!24929 mapRes!24929))

(declare-fun b!840976 () Bool)

(declare-fun e!469151 () Bool)

(assert (=> b!840976 (= e!469151 tp_is_empty!15553)))

(declare-fun b!840977 () Bool)

(assert (=> b!840977 (= e!469150 tp_is_empty!15553)))

(declare-fun b!840978 () Bool)

(declare-fun res!571730 () Bool)

(assert (=> b!840978 (=> (not res!571730) (not e!469148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840978 (= res!571730 (validKeyInArray!0 k0!854))))

(declare-fun b!840979 () Bool)

(assert (=> b!840979 (= e!469149 (and e!469151 mapRes!24929))))

(declare-fun condMapEmpty!24929 () Bool)

(declare-fun mapDefault!24929 () ValueCell!7337)

(assert (=> b!840979 (= condMapEmpty!24929 (= (arr!22712 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7337)) mapDefault!24929)))))

(declare-fun b!840980 () Bool)

(declare-fun res!571731 () Bool)

(assert (=> b!840980 (=> (not res!571731) (not e!469148))))

(declare-datatypes ((List!16172 0))(
  ( (Nil!16169) (Cons!16168 (h!17299 (_ BitVec 64)) (t!22534 List!16172)) )
))
(declare-fun arrayNoDuplicates!0 (array!47359 (_ BitVec 32) List!16172) Bool)

(assert (=> b!840980 (= res!571731 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16169))))

(declare-fun bm!37266 () Bool)

(assert (=> bm!37266 (= call!37268 (getCurrentListMapNoExtraKeys!2609 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840981 () Bool)

(declare-fun res!571726 () Bool)

(assert (=> b!840981 (=> (not res!571726) (not e!469148))))

(assert (=> b!840981 (= res!571726 (and (= (size!23154 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23153 _keys!868) (size!23154 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72484 res!571729) b!840972))

(assert (= (and b!840972 res!571728) b!840981))

(assert (= (and b!840981 res!571726) b!840970))

(assert (= (and b!840970 res!571727) b!840980))

(assert (= (and b!840980 res!571731) b!840973))

(assert (= (and b!840973 res!571724) b!840978))

(assert (= (and b!840978 res!571730) b!840971))

(assert (= (and b!840971 res!571725) b!840975))

(assert (= (and b!840975 c!91325) b!840974))

(assert (= (and b!840975 (not c!91325)) b!840969))

(assert (= (or b!840974 b!840969) bm!37265))

(assert (= (or b!840974 b!840969) bm!37266))

(assert (= (and b!840979 condMapEmpty!24929) mapIsEmpty!24929))

(assert (= (and b!840979 (not condMapEmpty!24929)) mapNonEmpty!24929))

(get-info :version)

(assert (= (and mapNonEmpty!24929 ((_ is ValueCellFull!7337) mapValue!24929)) b!840977))

(assert (= (and b!840979 ((_ is ValueCellFull!7337) mapDefault!24929)) b!840976))

(assert (= start!72484 b!840979))

(declare-fun m!783971 () Bool)

(assert (=> b!840980 m!783971))

(declare-fun m!783973 () Bool)

(assert (=> b!840975 m!783973))

(declare-fun m!783975 () Bool)

(assert (=> b!840974 m!783975))

(declare-fun m!783977 () Bool)

(assert (=> start!72484 m!783977))

(declare-fun m!783979 () Bool)

(assert (=> start!72484 m!783979))

(declare-fun m!783981 () Bool)

(assert (=> bm!37266 m!783981))

(declare-fun m!783983 () Bool)

(assert (=> b!840978 m!783983))

(declare-fun m!783985 () Bool)

(assert (=> b!840970 m!783985))

(declare-fun m!783987 () Bool)

(assert (=> b!840971 m!783987))

(declare-fun m!783989 () Bool)

(assert (=> b!840972 m!783989))

(declare-fun m!783991 () Bool)

(assert (=> mapNonEmpty!24929 m!783991))

(declare-fun m!783993 () Bool)

(assert (=> bm!37265 m!783993))

(declare-fun m!783995 () Bool)

(assert (=> bm!37265 m!783995))

(check-sat (not b!840974) (not b!840975) b_and!22747 (not b!840972) (not start!72484) (not b!840978) (not b!840970) tp_is_empty!15553 (not bm!37266) (not mapNonEmpty!24929) (not b_next!13687) (not bm!37265) (not b!840980))
(check-sat b_and!22747 (not b_next!13687))
