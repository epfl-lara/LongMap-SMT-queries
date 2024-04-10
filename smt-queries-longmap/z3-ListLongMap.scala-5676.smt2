; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73842 () Bool)

(assert start!73842)

(declare-fun b_free!14757 () Bool)

(declare-fun b_next!14757 () Bool)

(assert (=> start!73842 (= b_free!14757 (not b_next!14757))))

(declare-fun tp!51774 () Bool)

(declare-fun b_and!24493 () Bool)

(assert (=> start!73842 (= tp!51774 b_and!24493)))

(declare-fun b!867175 () Bool)

(declare-fun res!589189 () Bool)

(declare-fun e!483046 () Bool)

(assert (=> b!867175 (=> (not res!589189) (not e!483046))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49946 0))(
  ( (array!49947 (arr!24004 (Array (_ BitVec 32) (_ BitVec 64))) (size!24444 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49946)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!867175 (= res!589189 (and (= (select (arr!24004 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26939 () Bool)

(declare-fun mapRes!26939 () Bool)

(declare-fun tp!51775 () Bool)

(declare-fun e!483051 () Bool)

(assert (=> mapNonEmpty!26939 (= mapRes!26939 (and tp!51775 e!483051))))

(declare-datatypes ((V!27571 0))(
  ( (V!27572 (val!8494 Int)) )
))
(declare-datatypes ((ValueCell!8007 0))(
  ( (ValueCellFull!8007 (v!10919 V!27571)) (EmptyCell!8007) )
))
(declare-fun mapValue!26939 () ValueCell!8007)

(declare-fun mapKey!26939 () (_ BitVec 32))

(declare-fun mapRest!26939 () (Array (_ BitVec 32) ValueCell!8007))

(declare-datatypes ((array!49948 0))(
  ( (array!49949 (arr!24005 (Array (_ BitVec 32) ValueCell!8007)) (size!24445 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49948)

(assert (=> mapNonEmpty!26939 (= (arr!24005 _values!688) (store mapRest!26939 mapKey!26939 mapValue!26939))))

(declare-fun b!867177 () Bool)

(declare-fun res!589197 () Bool)

(assert (=> b!867177 (=> (not res!589197) (not e!483046))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867177 (= res!589197 (validMask!0 mask!1196))))

(declare-fun b!867178 () Bool)

(declare-fun e!483050 () Bool)

(declare-fun tp_is_empty!16893 () Bool)

(assert (=> b!867178 (= e!483050 tp_is_empty!16893)))

(declare-fun b!867179 () Bool)

(declare-datatypes ((Unit!29739 0))(
  ( (Unit!29740) )
))
(declare-fun e!483049 () Unit!29739)

(declare-fun Unit!29741 () Unit!29739)

(assert (=> b!867179 (= e!483049 Unit!29741)))

(declare-fun b!867180 () Bool)

(declare-fun res!589190 () Bool)

(assert (=> b!867180 (=> (not res!589190) (not e!483046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49946 (_ BitVec 32)) Bool)

(assert (=> b!867180 (= res!589190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867181 () Bool)

(declare-fun res!589196 () Bool)

(assert (=> b!867181 (=> (not res!589196) (not e!483046))))

(declare-datatypes ((List!17066 0))(
  ( (Nil!17063) (Cons!17062 (h!18193 (_ BitVec 64)) (t!24089 List!17066)) )
))
(declare-fun arrayNoDuplicates!0 (array!49946 (_ BitVec 32) List!17066) Bool)

(assert (=> b!867181 (= res!589196 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17063))))

(declare-fun b!867182 () Bool)

(declare-fun e!483048 () Bool)

(declare-fun e!483044 () Bool)

(assert (=> b!867182 (= e!483048 e!483044)))

(declare-fun res!589192 () Bool)

(assert (=> b!867182 (=> res!589192 e!483044)))

(assert (=> b!867182 (= res!589192 (= k0!854 (select (arr!24004 _keys!868) from!1053)))))

(assert (=> b!867182 (not (= (select (arr!24004 _keys!868) from!1053) k0!854))))

(declare-fun lt!393820 () Unit!29739)

(assert (=> b!867182 (= lt!393820 e!483049)))

(declare-fun c!92356 () Bool)

(assert (=> b!867182 (= c!92356 (= (select (arr!24004 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11268 0))(
  ( (tuple2!11269 (_1!5645 (_ BitVec 64)) (_2!5645 V!27571)) )
))
(declare-datatypes ((List!17067 0))(
  ( (Nil!17064) (Cons!17063 (h!18194 tuple2!11268) (t!24090 List!17067)) )
))
(declare-datatypes ((ListLongMap!10037 0))(
  ( (ListLongMap!10038 (toList!5034 List!17067)) )
))
(declare-fun lt!393829 () ListLongMap!10037)

(declare-fun lt!393823 () ListLongMap!10037)

(assert (=> b!867182 (= lt!393829 lt!393823)))

(declare-fun lt!393826 () ListLongMap!10037)

(declare-fun lt!393830 () tuple2!11268)

(declare-fun +!2380 (ListLongMap!10037 tuple2!11268) ListLongMap!10037)

(assert (=> b!867182 (= lt!393823 (+!2380 lt!393826 lt!393830))))

(declare-fun lt!393825 () V!27571)

(assert (=> b!867182 (= lt!393830 (tuple2!11269 (select (arr!24004 _keys!868) from!1053) lt!393825))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12694 (ValueCell!8007 V!27571) V!27571)

(declare-fun dynLambda!1198 (Int (_ BitVec 64)) V!27571)

(assert (=> b!867182 (= lt!393825 (get!12694 (select (arr!24005 _values!688) from!1053) (dynLambda!1198 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!867183 () Bool)

(declare-fun Unit!29742 () Unit!29739)

(assert (=> b!867183 (= e!483049 Unit!29742)))

(declare-fun lt!393819 () Unit!29739)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49946 (_ BitVec 32) (_ BitVec 32)) Unit!29739)

(assert (=> b!867183 (= lt!393819 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!867183 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17063)))

(declare-fun lt!393827 () Unit!29739)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49946 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29739)

(assert (=> b!867183 (= lt!393827 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867183 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393817 () Unit!29739)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49946 (_ BitVec 64) (_ BitVec 32) List!17066) Unit!29739)

(assert (=> b!867183 (= lt!393817 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17063))))

(assert (=> b!867183 false))

(declare-fun b!867184 () Bool)

(declare-fun e!483047 () Bool)

(assert (=> b!867184 (= e!483047 (not e!483048))))

(declare-fun res!589195 () Bool)

(assert (=> b!867184 (=> res!589195 e!483048)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867184 (= res!589195 (not (validKeyInArray!0 (select (arr!24004 _keys!868) from!1053))))))

(declare-fun lt!393818 () ListLongMap!10037)

(assert (=> b!867184 (= lt!393818 lt!393826)))

(declare-fun lt!393822 () ListLongMap!10037)

(declare-fun lt!393831 () tuple2!11268)

(assert (=> b!867184 (= lt!393826 (+!2380 lt!393822 lt!393831))))

(declare-fun lt!393832 () array!49948)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27571)

(declare-fun zeroValue!654 () V!27571)

(declare-fun getCurrentListMapNoExtraKeys!3004 (array!49946 array!49948 (_ BitVec 32) (_ BitVec 32) V!27571 V!27571 (_ BitVec 32) Int) ListLongMap!10037)

(assert (=> b!867184 (= lt!393818 (getCurrentListMapNoExtraKeys!3004 _keys!868 lt!393832 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27571)

(assert (=> b!867184 (= lt!393831 (tuple2!11269 k0!854 v!557))))

(assert (=> b!867184 (= lt!393822 (getCurrentListMapNoExtraKeys!3004 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393821 () Unit!29739)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!576 (array!49946 array!49948 (_ BitVec 32) (_ BitVec 32) V!27571 V!27571 (_ BitVec 32) (_ BitVec 64) V!27571 (_ BitVec 32) Int) Unit!29739)

(assert (=> b!867184 (= lt!393821 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!576 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26939 () Bool)

(assert (=> mapIsEmpty!26939 mapRes!26939))

(declare-fun b!867176 () Bool)

(declare-fun res!589191 () Bool)

(assert (=> b!867176 (=> (not res!589191) (not e!483046))))

(assert (=> b!867176 (= res!589191 (validKeyInArray!0 k0!854))))

(declare-fun res!589198 () Bool)

(assert (=> start!73842 (=> (not res!589198) (not e!483046))))

(assert (=> start!73842 (= res!589198 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24444 _keys!868))))))

(assert (=> start!73842 e!483046))

(assert (=> start!73842 tp_is_empty!16893))

(assert (=> start!73842 true))

(assert (=> start!73842 tp!51774))

(declare-fun array_inv!18970 (array!49946) Bool)

(assert (=> start!73842 (array_inv!18970 _keys!868)))

(declare-fun e!483045 () Bool)

(declare-fun array_inv!18971 (array!49948) Bool)

(assert (=> start!73842 (and (array_inv!18971 _values!688) e!483045)))

(declare-fun b!867185 () Bool)

(assert (=> b!867185 (= e!483044 true)))

(assert (=> b!867185 (= lt!393823 (+!2380 (+!2380 lt!393822 lt!393830) lt!393831))))

(declare-fun lt!393824 () Unit!29739)

(declare-fun addCommutativeForDiffKeys!546 (ListLongMap!10037 (_ BitVec 64) V!27571 (_ BitVec 64) V!27571) Unit!29739)

(assert (=> b!867185 (= lt!393824 (addCommutativeForDiffKeys!546 lt!393822 k0!854 v!557 (select (arr!24004 _keys!868) from!1053) lt!393825))))

(declare-fun b!867186 () Bool)

(declare-fun res!589193 () Bool)

(assert (=> b!867186 (=> (not res!589193) (not e!483046))))

(assert (=> b!867186 (= res!589193 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24444 _keys!868))))))

(declare-fun b!867187 () Bool)

(assert (=> b!867187 (= e!483051 tp_is_empty!16893)))

(declare-fun b!867188 () Bool)

(declare-fun res!589199 () Bool)

(assert (=> b!867188 (=> (not res!589199) (not e!483046))))

(assert (=> b!867188 (= res!589199 (and (= (size!24445 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24444 _keys!868) (size!24445 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867189 () Bool)

(assert (=> b!867189 (= e!483045 (and e!483050 mapRes!26939))))

(declare-fun condMapEmpty!26939 () Bool)

(declare-fun mapDefault!26939 () ValueCell!8007)

(assert (=> b!867189 (= condMapEmpty!26939 (= (arr!24005 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8007)) mapDefault!26939)))))

(declare-fun b!867190 () Bool)

(assert (=> b!867190 (= e!483046 e!483047)))

(declare-fun res!589194 () Bool)

(assert (=> b!867190 (=> (not res!589194) (not e!483047))))

(assert (=> b!867190 (= res!589194 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!867190 (= lt!393829 (getCurrentListMapNoExtraKeys!3004 _keys!868 lt!393832 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!867190 (= lt!393832 (array!49949 (store (arr!24005 _values!688) i!612 (ValueCellFull!8007 v!557)) (size!24445 _values!688)))))

(declare-fun lt!393828 () ListLongMap!10037)

(assert (=> b!867190 (= lt!393828 (getCurrentListMapNoExtraKeys!3004 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73842 res!589198) b!867177))

(assert (= (and b!867177 res!589197) b!867188))

(assert (= (and b!867188 res!589199) b!867180))

(assert (= (and b!867180 res!589190) b!867181))

(assert (= (and b!867181 res!589196) b!867186))

(assert (= (and b!867186 res!589193) b!867176))

(assert (= (and b!867176 res!589191) b!867175))

(assert (= (and b!867175 res!589189) b!867190))

(assert (= (and b!867190 res!589194) b!867184))

(assert (= (and b!867184 (not res!589195)) b!867182))

(assert (= (and b!867182 c!92356) b!867183))

(assert (= (and b!867182 (not c!92356)) b!867179))

(assert (= (and b!867182 (not res!589192)) b!867185))

(assert (= (and b!867189 condMapEmpty!26939) mapIsEmpty!26939))

(assert (= (and b!867189 (not condMapEmpty!26939)) mapNonEmpty!26939))

(get-info :version)

(assert (= (and mapNonEmpty!26939 ((_ is ValueCellFull!8007) mapValue!26939)) b!867187))

(assert (= (and b!867189 ((_ is ValueCellFull!8007) mapDefault!26939)) b!867178))

(assert (= start!73842 b!867189))

(declare-fun b_lambda!12109 () Bool)

(assert (=> (not b_lambda!12109) (not b!867182)))

(declare-fun t!24088 () Bool)

(declare-fun tb!4879 () Bool)

(assert (=> (and start!73842 (= defaultEntry!696 defaultEntry!696) t!24088) tb!4879))

(declare-fun result!9369 () Bool)

(assert (=> tb!4879 (= result!9369 tp_is_empty!16893)))

(assert (=> b!867182 t!24088))

(declare-fun b_and!24495 () Bool)

(assert (= b_and!24493 (and (=> t!24088 result!9369) b_and!24495)))

(declare-fun m!808953 () Bool)

(assert (=> start!73842 m!808953))

(declare-fun m!808955 () Bool)

(assert (=> start!73842 m!808955))

(declare-fun m!808957 () Bool)

(assert (=> b!867181 m!808957))

(declare-fun m!808959 () Bool)

(assert (=> b!867182 m!808959))

(declare-fun m!808961 () Bool)

(assert (=> b!867182 m!808961))

(declare-fun m!808963 () Bool)

(assert (=> b!867182 m!808963))

(declare-fun m!808965 () Bool)

(assert (=> b!867182 m!808965))

(assert (=> b!867182 m!808961))

(declare-fun m!808967 () Bool)

(assert (=> b!867182 m!808967))

(assert (=> b!867182 m!808963))

(declare-fun m!808969 () Bool)

(assert (=> b!867185 m!808969))

(assert (=> b!867185 m!808969))

(declare-fun m!808971 () Bool)

(assert (=> b!867185 m!808971))

(assert (=> b!867185 m!808967))

(assert (=> b!867185 m!808967))

(declare-fun m!808973 () Bool)

(assert (=> b!867185 m!808973))

(declare-fun m!808975 () Bool)

(assert (=> b!867176 m!808975))

(declare-fun m!808977 () Bool)

(assert (=> b!867190 m!808977))

(declare-fun m!808979 () Bool)

(assert (=> b!867190 m!808979))

(declare-fun m!808981 () Bool)

(assert (=> b!867190 m!808981))

(declare-fun m!808983 () Bool)

(assert (=> mapNonEmpty!26939 m!808983))

(declare-fun m!808985 () Bool)

(assert (=> b!867175 m!808985))

(declare-fun m!808987 () Bool)

(assert (=> b!867183 m!808987))

(declare-fun m!808989 () Bool)

(assert (=> b!867183 m!808989))

(declare-fun m!808991 () Bool)

(assert (=> b!867183 m!808991))

(declare-fun m!808993 () Bool)

(assert (=> b!867183 m!808993))

(declare-fun m!808995 () Bool)

(assert (=> b!867183 m!808995))

(declare-fun m!808997 () Bool)

(assert (=> b!867177 m!808997))

(declare-fun m!808999 () Bool)

(assert (=> b!867184 m!808999))

(declare-fun m!809001 () Bool)

(assert (=> b!867184 m!809001))

(assert (=> b!867184 m!808967))

(declare-fun m!809003 () Bool)

(assert (=> b!867184 m!809003))

(assert (=> b!867184 m!808967))

(declare-fun m!809005 () Bool)

(assert (=> b!867184 m!809005))

(declare-fun m!809007 () Bool)

(assert (=> b!867184 m!809007))

(declare-fun m!809009 () Bool)

(assert (=> b!867180 m!809009))

(check-sat (not b_next!14757) (not mapNonEmpty!26939) (not b!867182) (not b!867185) (not b!867183) (not start!73842) (not b!867177) (not b!867180) tp_is_empty!16893 (not b_lambda!12109) (not b!867184) (not b!867181) (not b!867190) b_and!24495 (not b!867176))
(check-sat b_and!24495 (not b_next!14757))
