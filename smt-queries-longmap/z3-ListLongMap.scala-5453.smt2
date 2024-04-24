; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72670 () Bool)

(assert start!72670)

(declare-fun b_free!13687 () Bool)

(declare-fun b_next!13687 () Bool)

(assert (=> start!72670 (= b_free!13687 (not b_next!13687))))

(declare-fun tp!48160 () Bool)

(declare-fun b_and!22783 () Bool)

(assert (=> start!72670 (= tp!48160 b_and!22783)))

(declare-fun b!842111 () Bool)

(declare-fun e!469878 () Bool)

(declare-datatypes ((V!25785 0))(
  ( (V!25786 (val!7824 Int)) )
))
(declare-datatypes ((tuple2!10308 0))(
  ( (tuple2!10309 (_1!5165 (_ BitVec 64)) (_2!5165 V!25785)) )
))
(declare-datatypes ((List!16080 0))(
  ( (Nil!16077) (Cons!16076 (h!17213 tuple2!10308) (t!22443 List!16080)) )
))
(declare-datatypes ((ListLongMap!9079 0))(
  ( (ListLongMap!9080 (toList!4555 List!16080)) )
))
(declare-fun call!37340 () ListLongMap!9079)

(declare-fun call!37339 () ListLongMap!9079)

(assert (=> b!842111 (= e!469878 (= call!37340 call!37339))))

(declare-fun res!572185 () Bool)

(declare-fun e!469881 () Bool)

(assert (=> start!72670 (=> (not res!572185) (not e!469881))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47399 0))(
  ( (array!47400 (arr!22726 (Array (_ BitVec 32) (_ BitVec 64))) (size!23167 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47399)

(assert (=> start!72670 (= res!572185 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23167 _keys!868))))))

(assert (=> start!72670 e!469881))

(declare-fun tp_is_empty!15553 () Bool)

(assert (=> start!72670 tp_is_empty!15553))

(assert (=> start!72670 true))

(assert (=> start!72670 tp!48160))

(declare-fun array_inv!18134 (array!47399) Bool)

(assert (=> start!72670 (array_inv!18134 _keys!868)))

(declare-datatypes ((ValueCell!7337 0))(
  ( (ValueCellFull!7337 (v!10249 V!25785)) (EmptyCell!7337) )
))
(declare-datatypes ((array!47401 0))(
  ( (array!47402 (arr!22727 (Array (_ BitVec 32) ValueCell!7337)) (size!23168 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47401)

(declare-fun e!469882 () Bool)

(declare-fun array_inv!18135 (array!47401) Bool)

(assert (=> start!72670 (and (array_inv!18135 _values!688) e!469882)))

(declare-fun b!842112 () Bool)

(declare-fun res!572184 () Bool)

(assert (=> b!842112 (=> (not res!572184) (not e!469881))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!842112 (= res!572184 (and (= (size!23168 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23167 _keys!868) (size!23168 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842113 () Bool)

(declare-fun res!572182 () Bool)

(assert (=> b!842113 (=> (not res!572182) (not e!469881))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842113 (= res!572182 (validKeyInArray!0 k0!854))))

(declare-fun b!842114 () Bool)

(assert (=> b!842114 (= e!469881 (not true))))

(assert (=> b!842114 e!469878))

(declare-fun c!91672 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!842114 (= c!91672 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25785)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!25785)

(declare-fun zeroValue!654 () V!25785)

(declare-datatypes ((Unit!28910 0))(
  ( (Unit!28911) )
))
(declare-fun lt!381257 () Unit!28910)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!291 (array!47399 array!47401 (_ BitVec 32) (_ BitVec 32) V!25785 V!25785 (_ BitVec 32) (_ BitVec 64) V!25785 (_ BitVec 32) Int) Unit!28910)

(assert (=> b!842114 (= lt!381257 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!291 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842115 () Bool)

(declare-fun res!572180 () Bool)

(assert (=> b!842115 (=> (not res!572180) (not e!469881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842115 (= res!572180 (validMask!0 mask!1196))))

(declare-fun bm!37336 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2615 (array!47399 array!47401 (_ BitVec 32) (_ BitVec 32) V!25785 V!25785 (_ BitVec 32) Int) ListLongMap!9079)

(assert (=> bm!37336 (= call!37340 (getCurrentListMapNoExtraKeys!2615 _keys!868 (array!47402 (store (arr!22727 _values!688) i!612 (ValueCellFull!7337 v!557)) (size!23168 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842116 () Bool)

(declare-fun res!572178 () Bool)

(assert (=> b!842116 (=> (not res!572178) (not e!469881))))

(assert (=> b!842116 (= res!572178 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23167 _keys!868))))))

(declare-fun mapNonEmpty!24929 () Bool)

(declare-fun mapRes!24929 () Bool)

(declare-fun tp!48161 () Bool)

(declare-fun e!469877 () Bool)

(assert (=> mapNonEmpty!24929 (= mapRes!24929 (and tp!48161 e!469877))))

(declare-fun mapKey!24929 () (_ BitVec 32))

(declare-fun mapRest!24929 () (Array (_ BitVec 32) ValueCell!7337))

(declare-fun mapValue!24929 () ValueCell!7337)

(assert (=> mapNonEmpty!24929 (= (arr!22727 _values!688) (store mapRest!24929 mapKey!24929 mapValue!24929))))

(declare-fun b!842117 () Bool)

(declare-fun res!572179 () Bool)

(assert (=> b!842117 (=> (not res!572179) (not e!469881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47399 (_ BitVec 32)) Bool)

(assert (=> b!842117 (= res!572179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842118 () Bool)

(declare-fun res!572181 () Bool)

(assert (=> b!842118 (=> (not res!572181) (not e!469881))))

(assert (=> b!842118 (= res!572181 (and (= (select (arr!22726 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23167 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!24929 () Bool)

(assert (=> mapIsEmpty!24929 mapRes!24929))

(declare-fun b!842119 () Bool)

(assert (=> b!842119 (= e!469877 tp_is_empty!15553)))

(declare-fun b!842120 () Bool)

(declare-fun e!469879 () Bool)

(assert (=> b!842120 (= e!469879 tp_is_empty!15553)))

(declare-fun b!842121 () Bool)

(assert (=> b!842121 (= e!469882 (and e!469879 mapRes!24929))))

(declare-fun condMapEmpty!24929 () Bool)

(declare-fun mapDefault!24929 () ValueCell!7337)

(assert (=> b!842121 (= condMapEmpty!24929 (= (arr!22727 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7337)) mapDefault!24929)))))

(declare-fun bm!37337 () Bool)

(assert (=> bm!37337 (= call!37339 (getCurrentListMapNoExtraKeys!2615 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842122 () Bool)

(declare-fun res!572183 () Bool)

(assert (=> b!842122 (=> (not res!572183) (not e!469881))))

(declare-datatypes ((List!16081 0))(
  ( (Nil!16078) (Cons!16077 (h!17214 (_ BitVec 64)) (t!22444 List!16081)) )
))
(declare-fun arrayNoDuplicates!0 (array!47399 (_ BitVec 32) List!16081) Bool)

(assert (=> b!842122 (= res!572183 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16078))))

(declare-fun b!842123 () Bool)

(declare-fun +!2061 (ListLongMap!9079 tuple2!10308) ListLongMap!9079)

(assert (=> b!842123 (= e!469878 (= call!37340 (+!2061 call!37339 (tuple2!10309 k0!854 v!557))))))

(assert (= (and start!72670 res!572185) b!842115))

(assert (= (and b!842115 res!572180) b!842112))

(assert (= (and b!842112 res!572184) b!842117))

(assert (= (and b!842117 res!572179) b!842122))

(assert (= (and b!842122 res!572183) b!842116))

(assert (= (and b!842116 res!572178) b!842113))

(assert (= (and b!842113 res!572182) b!842118))

(assert (= (and b!842118 res!572181) b!842114))

(assert (= (and b!842114 c!91672) b!842123))

(assert (= (and b!842114 (not c!91672)) b!842111))

(assert (= (or b!842123 b!842111) bm!37336))

(assert (= (or b!842123 b!842111) bm!37337))

(assert (= (and b!842121 condMapEmpty!24929) mapIsEmpty!24929))

(assert (= (and b!842121 (not condMapEmpty!24929)) mapNonEmpty!24929))

(get-info :version)

(assert (= (and mapNonEmpty!24929 ((_ is ValueCellFull!7337) mapValue!24929)) b!842119))

(assert (= (and b!842121 ((_ is ValueCellFull!7337) mapDefault!24929)) b!842120))

(assert (= start!72670 b!842121))

(declare-fun m!786017 () Bool)

(assert (=> b!842117 m!786017))

(declare-fun m!786019 () Bool)

(assert (=> start!72670 m!786019))

(declare-fun m!786021 () Bool)

(assert (=> start!72670 m!786021))

(declare-fun m!786023 () Bool)

(assert (=> bm!37336 m!786023))

(declare-fun m!786025 () Bool)

(assert (=> bm!37336 m!786025))

(declare-fun m!786027 () Bool)

(assert (=> b!842114 m!786027))

(declare-fun m!786029 () Bool)

(assert (=> b!842113 m!786029))

(declare-fun m!786031 () Bool)

(assert (=> b!842118 m!786031))

(declare-fun m!786033 () Bool)

(assert (=> bm!37337 m!786033))

(declare-fun m!786035 () Bool)

(assert (=> b!842123 m!786035))

(declare-fun m!786037 () Bool)

(assert (=> b!842122 m!786037))

(declare-fun m!786039 () Bool)

(assert (=> mapNonEmpty!24929 m!786039))

(declare-fun m!786041 () Bool)

(assert (=> b!842115 m!786041))

(check-sat (not bm!37337) tp_is_empty!15553 (not b!842113) (not b!842115) (not mapNonEmpty!24929) (not b!842122) b_and!22783 (not bm!37336) (not b_next!13687) (not b!842123) (not start!72670) (not b!842117) (not b!842114))
(check-sat b_and!22783 (not b_next!13687))
