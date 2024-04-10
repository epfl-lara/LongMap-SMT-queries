; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73554 () Bool)

(assert start!73554)

(declare-fun b_free!14469 () Bool)

(declare-fun b_next!14469 () Bool)

(assert (=> start!73554 (= b_free!14469 (not b_next!14469))))

(declare-fun tp!50911 () Bool)

(declare-fun b_and!23917 () Bool)

(assert (=> start!73554 (= tp!50911 b_and!23917)))

(declare-fun b!860025 () Bool)

(declare-fun res!584419 () Bool)

(declare-fun e!479246 () Bool)

(assert (=> b!860025 (=> (not res!584419) (not e!479246))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49386 0))(
  ( (array!49387 (arr!23724 (Array (_ BitVec 32) (_ BitVec 64))) (size!24164 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49386)

(assert (=> b!860025 (= res!584419 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24164 _keys!868))))))

(declare-fun b!860026 () Bool)

(declare-fun e!479253 () Bool)

(declare-fun e!479254 () Bool)

(assert (=> b!860026 (= e!479253 e!479254)))

(declare-fun res!584412 () Bool)

(assert (=> b!860026 (=> res!584412 e!479254)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!860026 (= res!584412 (not (= (select (arr!23724 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27187 0))(
  ( (V!27188 (val!8350 Int)) )
))
(declare-datatypes ((ValueCell!7863 0))(
  ( (ValueCellFull!7863 (v!10775 V!27187)) (EmptyCell!7863) )
))
(declare-datatypes ((array!49388 0))(
  ( (array!49389 (arr!23725 (Array (_ BitVec 32) ValueCell!7863)) (size!24165 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49388)

(declare-datatypes ((tuple2!11032 0))(
  ( (tuple2!11033 (_1!5527 (_ BitVec 64)) (_2!5527 V!27187)) )
))
(declare-datatypes ((List!16840 0))(
  ( (Nil!16837) (Cons!16836 (h!17967 tuple2!11032) (t!23575 List!16840)) )
))
(declare-datatypes ((ListLongMap!9801 0))(
  ( (ListLongMap!9802 (toList!4916 List!16840)) )
))
(declare-fun lt!387603 () ListLongMap!9801)

(declare-fun lt!387599 () ListLongMap!9801)

(declare-fun +!2268 (ListLongMap!9801 tuple2!11032) ListLongMap!9801)

(declare-fun get!12505 (ValueCell!7863 V!27187) V!27187)

(declare-fun dynLambda!1105 (Int (_ BitVec 64)) V!27187)

(assert (=> b!860026 (= lt!387599 (+!2268 lt!387603 (tuple2!11033 (select (arr!23724 _keys!868) from!1053) (get!12505 (select (arr!23725 _values!688) from!1053) (dynLambda!1105 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860027 () Bool)

(declare-fun res!584410 () Bool)

(declare-fun e!479250 () Bool)

(assert (=> b!860027 (=> res!584410 e!479250)))

(declare-datatypes ((List!16841 0))(
  ( (Nil!16838) (Cons!16837 (h!17968 (_ BitVec 64)) (t!23576 List!16841)) )
))
(declare-fun contains!4228 (List!16841 (_ BitVec 64)) Bool)

(assert (=> b!860027 (= res!584410 (contains!4228 Nil!16838 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860028 () Bool)

(assert (=> b!860028 (= e!479250 true)))

(declare-fun lt!387600 () Bool)

(assert (=> b!860028 (= lt!387600 (contains!4228 Nil!16838 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860029 () Bool)

(declare-fun e!479251 () Bool)

(assert (=> b!860029 (= e!479251 (not e!479253))))

(declare-fun res!584409 () Bool)

(assert (=> b!860029 (=> res!584409 e!479253)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860029 (= res!584409 (not (validKeyInArray!0 (select (arr!23724 _keys!868) from!1053))))))

(declare-fun lt!387601 () ListLongMap!9801)

(assert (=> b!860029 (= lt!387601 lt!387603)))

(declare-fun v!557 () V!27187)

(declare-fun lt!387597 () ListLongMap!9801)

(assert (=> b!860029 (= lt!387603 (+!2268 lt!387597 (tuple2!11033 k0!854 v!557)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!387598 () array!49388)

(declare-fun minValue!654 () V!27187)

(declare-fun zeroValue!654 () V!27187)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2894 (array!49386 array!49388 (_ BitVec 32) (_ BitVec 32) V!27187 V!27187 (_ BitVec 32) Int) ListLongMap!9801)

(assert (=> b!860029 (= lt!387601 (getCurrentListMapNoExtraKeys!2894 _keys!868 lt!387598 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860029 (= lt!387597 (getCurrentListMapNoExtraKeys!2894 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29319 0))(
  ( (Unit!29320) )
))
(declare-fun lt!387596 () Unit!29319)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!483 (array!49386 array!49388 (_ BitVec 32) (_ BitVec 32) V!27187 V!27187 (_ BitVec 32) (_ BitVec 64) V!27187 (_ BitVec 32) Int) Unit!29319)

(assert (=> b!860029 (= lt!387596 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!483 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860030 () Bool)

(declare-fun res!584418 () Bool)

(assert (=> b!860030 (=> (not res!584418) (not e!479246))))

(declare-fun arrayNoDuplicates!0 (array!49386 (_ BitVec 32) List!16841) Bool)

(assert (=> b!860030 (= res!584418 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16838))))

(declare-fun b!860032 () Bool)

(declare-fun e!479248 () Bool)

(declare-fun e!479247 () Bool)

(declare-fun mapRes!26507 () Bool)

(assert (=> b!860032 (= e!479248 (and e!479247 mapRes!26507))))

(declare-fun condMapEmpty!26507 () Bool)

(declare-fun mapDefault!26507 () ValueCell!7863)

(assert (=> b!860032 (= condMapEmpty!26507 (= (arr!23725 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7863)) mapDefault!26507)))))

(declare-fun b!860033 () Bool)

(declare-fun res!584415 () Bool)

(assert (=> b!860033 (=> res!584415 e!479250)))

(declare-fun noDuplicate!1310 (List!16841) Bool)

(assert (=> b!860033 (= res!584415 (not (noDuplicate!1310 Nil!16838)))))

(declare-fun b!860034 () Bool)

(declare-fun res!584413 () Bool)

(assert (=> b!860034 (=> (not res!584413) (not e!479246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49386 (_ BitVec 32)) Bool)

(assert (=> b!860034 (= res!584413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860035 () Bool)

(declare-fun e!479252 () Bool)

(declare-fun tp_is_empty!16605 () Bool)

(assert (=> b!860035 (= e!479252 tp_is_empty!16605)))

(declare-fun b!860036 () Bool)

(declare-fun res!584408 () Bool)

(assert (=> b!860036 (=> (not res!584408) (not e!479246))))

(assert (=> b!860036 (= res!584408 (and (= (select (arr!23724 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860037 () Bool)

(assert (=> b!860037 (= e!479254 e!479250)))

(declare-fun res!584414 () Bool)

(assert (=> b!860037 (=> res!584414 e!479250)))

(assert (=> b!860037 (= res!584414 (or (bvsge (size!24164 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24164 _keys!868)) (bvsge from!1053 (size!24164 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860037 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387595 () Unit!29319)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49386 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29319)

(assert (=> b!860037 (= lt!387595 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!860037 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16838)))

(declare-fun lt!387602 () Unit!29319)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49386 (_ BitVec 32) (_ BitVec 32)) Unit!29319)

(assert (=> b!860037 (= lt!387602 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapIsEmpty!26507 () Bool)

(assert (=> mapIsEmpty!26507 mapRes!26507))

(declare-fun res!584411 () Bool)

(assert (=> start!73554 (=> (not res!584411) (not e!479246))))

(assert (=> start!73554 (= res!584411 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24164 _keys!868))))))

(assert (=> start!73554 e!479246))

(assert (=> start!73554 tp_is_empty!16605))

(assert (=> start!73554 true))

(assert (=> start!73554 tp!50911))

(declare-fun array_inv!18780 (array!49386) Bool)

(assert (=> start!73554 (array_inv!18780 _keys!868)))

(declare-fun array_inv!18781 (array!49388) Bool)

(assert (=> start!73554 (and (array_inv!18781 _values!688) e!479248)))

(declare-fun b!860031 () Bool)

(declare-fun res!584420 () Bool)

(assert (=> b!860031 (=> (not res!584420) (not e!479246))))

(assert (=> b!860031 (= res!584420 (and (= (size!24165 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24164 _keys!868) (size!24165 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860038 () Bool)

(declare-fun res!584416 () Bool)

(assert (=> b!860038 (=> (not res!584416) (not e!479246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860038 (= res!584416 (validMask!0 mask!1196))))

(declare-fun b!860039 () Bool)

(assert (=> b!860039 (= e!479247 tp_is_empty!16605)))

(declare-fun b!860040 () Bool)

(assert (=> b!860040 (= e!479246 e!479251)))

(declare-fun res!584417 () Bool)

(assert (=> b!860040 (=> (not res!584417) (not e!479251))))

(assert (=> b!860040 (= res!584417 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!860040 (= lt!387599 (getCurrentListMapNoExtraKeys!2894 _keys!868 lt!387598 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!860040 (= lt!387598 (array!49389 (store (arr!23725 _values!688) i!612 (ValueCellFull!7863 v!557)) (size!24165 _values!688)))))

(declare-fun lt!387604 () ListLongMap!9801)

(assert (=> b!860040 (= lt!387604 (getCurrentListMapNoExtraKeys!2894 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26507 () Bool)

(declare-fun tp!50910 () Bool)

(assert (=> mapNonEmpty!26507 (= mapRes!26507 (and tp!50910 e!479252))))

(declare-fun mapKey!26507 () (_ BitVec 32))

(declare-fun mapRest!26507 () (Array (_ BitVec 32) ValueCell!7863))

(declare-fun mapValue!26507 () ValueCell!7863)

(assert (=> mapNonEmpty!26507 (= (arr!23725 _values!688) (store mapRest!26507 mapKey!26507 mapValue!26507))))

(declare-fun b!860041 () Bool)

(declare-fun res!584407 () Bool)

(assert (=> b!860041 (=> (not res!584407) (not e!479246))))

(assert (=> b!860041 (= res!584407 (validKeyInArray!0 k0!854))))

(assert (= (and start!73554 res!584411) b!860038))

(assert (= (and b!860038 res!584416) b!860031))

(assert (= (and b!860031 res!584420) b!860034))

(assert (= (and b!860034 res!584413) b!860030))

(assert (= (and b!860030 res!584418) b!860025))

(assert (= (and b!860025 res!584419) b!860041))

(assert (= (and b!860041 res!584407) b!860036))

(assert (= (and b!860036 res!584408) b!860040))

(assert (= (and b!860040 res!584417) b!860029))

(assert (= (and b!860029 (not res!584409)) b!860026))

(assert (= (and b!860026 (not res!584412)) b!860037))

(assert (= (and b!860037 (not res!584414)) b!860033))

(assert (= (and b!860033 (not res!584415)) b!860027))

(assert (= (and b!860027 (not res!584410)) b!860028))

(assert (= (and b!860032 condMapEmpty!26507) mapIsEmpty!26507))

(assert (= (and b!860032 (not condMapEmpty!26507)) mapNonEmpty!26507))

(get-info :version)

(assert (= (and mapNonEmpty!26507 ((_ is ValueCellFull!7863) mapValue!26507)) b!860035))

(assert (= (and b!860032 ((_ is ValueCellFull!7863) mapDefault!26507)) b!860039))

(assert (= start!73554 b!860032))

(declare-fun b_lambda!11821 () Bool)

(assert (=> (not b_lambda!11821) (not b!860026)))

(declare-fun t!23574 () Bool)

(declare-fun tb!4591 () Bool)

(assert (=> (and start!73554 (= defaultEntry!696 defaultEntry!696) t!23574) tb!4591))

(declare-fun result!8793 () Bool)

(assert (=> tb!4591 (= result!8793 tp_is_empty!16605)))

(assert (=> b!860026 t!23574))

(declare-fun b_and!23919 () Bool)

(assert (= b_and!23917 (and (=> t!23574 result!8793) b_and!23919)))

(declare-fun m!800809 () Bool)

(assert (=> b!860033 m!800809))

(declare-fun m!800811 () Bool)

(assert (=> b!860029 m!800811))

(declare-fun m!800813 () Bool)

(assert (=> b!860029 m!800813))

(declare-fun m!800815 () Bool)

(assert (=> b!860029 m!800815))

(declare-fun m!800817 () Bool)

(assert (=> b!860029 m!800817))

(declare-fun m!800819 () Bool)

(assert (=> b!860029 m!800819))

(assert (=> b!860029 m!800817))

(declare-fun m!800821 () Bool)

(assert (=> b!860029 m!800821))

(declare-fun m!800823 () Bool)

(assert (=> b!860038 m!800823))

(declare-fun m!800825 () Bool)

(assert (=> start!73554 m!800825))

(declare-fun m!800827 () Bool)

(assert (=> start!73554 m!800827))

(declare-fun m!800829 () Bool)

(assert (=> b!860027 m!800829))

(declare-fun m!800831 () Bool)

(assert (=> b!860037 m!800831))

(declare-fun m!800833 () Bool)

(assert (=> b!860037 m!800833))

(declare-fun m!800835 () Bool)

(assert (=> b!860037 m!800835))

(declare-fun m!800837 () Bool)

(assert (=> b!860037 m!800837))

(declare-fun m!800839 () Bool)

(assert (=> b!860034 m!800839))

(declare-fun m!800841 () Bool)

(assert (=> b!860036 m!800841))

(declare-fun m!800843 () Bool)

(assert (=> b!860041 m!800843))

(declare-fun m!800845 () Bool)

(assert (=> b!860030 m!800845))

(declare-fun m!800847 () Bool)

(assert (=> mapNonEmpty!26507 m!800847))

(declare-fun m!800849 () Bool)

(assert (=> b!860040 m!800849))

(declare-fun m!800851 () Bool)

(assert (=> b!860040 m!800851))

(declare-fun m!800853 () Bool)

(assert (=> b!860040 m!800853))

(declare-fun m!800855 () Bool)

(assert (=> b!860026 m!800855))

(declare-fun m!800857 () Bool)

(assert (=> b!860026 m!800857))

(declare-fun m!800859 () Bool)

(assert (=> b!860026 m!800859))

(declare-fun m!800861 () Bool)

(assert (=> b!860026 m!800861))

(assert (=> b!860026 m!800857))

(assert (=> b!860026 m!800817))

(assert (=> b!860026 m!800859))

(declare-fun m!800863 () Bool)

(assert (=> b!860028 m!800863))

(check-sat (not b!860041) (not mapNonEmpty!26507) (not b!860029) (not b!860026) (not b!860034) (not b!860028) (not b_lambda!11821) (not b!860030) tp_is_empty!16605 b_and!23919 (not b!860040) (not start!73554) (not b!860027) (not b!860033) (not b!860038) (not b!860037) (not b_next!14469))
(check-sat b_and!23919 (not b_next!14469))
