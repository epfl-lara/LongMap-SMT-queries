; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73204 () Bool)

(assert start!73204)

(declare-fun b_free!14137 () Bool)

(declare-fun b_next!14137 () Bool)

(assert (=> start!73204 (= b_free!14137 (not b_next!14137))))

(declare-fun tp!49916 () Bool)

(declare-fun b_and!23407 () Bool)

(assert (=> start!73204 (= tp!49916 b_and!23407)))

(declare-fun b!853135 () Bool)

(declare-fun res!579469 () Bool)

(declare-fun e!475760 () Bool)

(assert (=> b!853135 (=> (not res!579469) (not e!475760))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48729 0))(
  ( (array!48730 (arr!23396 (Array (_ BitVec 32) (_ BitVec 64))) (size!23838 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48729)

(declare-datatypes ((V!26745 0))(
  ( (V!26746 (val!8184 Int)) )
))
(declare-datatypes ((ValueCell!7697 0))(
  ( (ValueCellFull!7697 (v!10603 V!26745)) (EmptyCell!7697) )
))
(declare-datatypes ((array!48731 0))(
  ( (array!48732 (arr!23397 (Array (_ BitVec 32) ValueCell!7697)) (size!23839 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48731)

(assert (=> b!853135 (= res!579469 (and (= (size!23839 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23838 _keys!868) (size!23839 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853136 () Bool)

(declare-fun res!579476 () Bool)

(assert (=> b!853136 (=> (not res!579476) (not e!475760))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!853136 (= res!579476 (and (= (select (arr!23396 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!38237 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10774 0))(
  ( (tuple2!10775 (_1!5398 (_ BitVec 64)) (_2!5398 V!26745)) )
))
(declare-datatypes ((List!16598 0))(
  ( (Nil!16595) (Cons!16594 (h!17725 tuple2!10774) (t!23172 List!16598)) )
))
(declare-datatypes ((ListLongMap!9533 0))(
  ( (ListLongMap!9534 (toList!4782 List!16598)) )
))
(declare-fun call!38240 () ListLongMap!9533)

(declare-fun minValue!654 () V!26745)

(declare-fun zeroValue!654 () V!26745)

(declare-fun getCurrentListMapNoExtraKeys!2790 (array!48729 array!48731 (_ BitVec 32) (_ BitVec 32) V!26745 V!26745 (_ BitVec 32) Int) ListLongMap!9533)

(assert (=> bm!38237 (= call!38240 (getCurrentListMapNoExtraKeys!2790 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853137 () Bool)

(declare-fun res!579470 () Bool)

(assert (=> b!853137 (=> (not res!579470) (not e!475760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48729 (_ BitVec 32)) Bool)

(assert (=> b!853137 (= res!579470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853138 () Bool)

(declare-fun e!475763 () Bool)

(declare-fun e!475764 () Bool)

(declare-fun mapRes!26009 () Bool)

(assert (=> b!853138 (= e!475763 (and e!475764 mapRes!26009))))

(declare-fun condMapEmpty!26009 () Bool)

(declare-fun mapDefault!26009 () ValueCell!7697)

(assert (=> b!853138 (= condMapEmpty!26009 (= (arr!23397 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7697)) mapDefault!26009)))))

(declare-fun res!579474 () Bool)

(assert (=> start!73204 (=> (not res!579474) (not e!475760))))

(assert (=> start!73204 (= res!579474 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23838 _keys!868))))))

(assert (=> start!73204 e!475760))

(declare-fun tp_is_empty!16273 () Bool)

(assert (=> start!73204 tp_is_empty!16273))

(assert (=> start!73204 true))

(assert (=> start!73204 tp!49916))

(declare-fun array_inv!18632 (array!48729) Bool)

(assert (=> start!73204 (array_inv!18632 _keys!868)))

(declare-fun array_inv!18633 (array!48731) Bool)

(assert (=> start!73204 (and (array_inv!18633 _values!688) e!475763)))

(declare-fun mapNonEmpty!26009 () Bool)

(declare-fun tp!49915 () Bool)

(declare-fun e!475757 () Bool)

(assert (=> mapNonEmpty!26009 (= mapRes!26009 (and tp!49915 e!475757))))

(declare-fun mapKey!26009 () (_ BitVec 32))

(declare-fun mapValue!26009 () ValueCell!7697)

(declare-fun mapRest!26009 () (Array (_ BitVec 32) ValueCell!7697))

(assert (=> mapNonEmpty!26009 (= (arr!23397 _values!688) (store mapRest!26009 mapKey!26009 mapValue!26009))))

(declare-fun b!853139 () Bool)

(declare-fun e!475759 () Bool)

(assert (=> b!853139 (= e!475759 true)))

(declare-fun lt!384467 () tuple2!10774)

(declare-fun lt!384466 () ListLongMap!9533)

(declare-fun lt!384460 () V!26745)

(declare-fun +!2196 (ListLongMap!9533 tuple2!10774) ListLongMap!9533)

(assert (=> b!853139 (= (+!2196 lt!384466 lt!384467) (+!2196 (+!2196 lt!384466 (tuple2!10775 k0!854 lt!384460)) lt!384467))))

(declare-fun lt!384464 () V!26745)

(assert (=> b!853139 (= lt!384467 (tuple2!10775 k0!854 lt!384464))))

(declare-datatypes ((Unit!29063 0))(
  ( (Unit!29064) )
))
(declare-fun lt!384465 () Unit!29063)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!304 (ListLongMap!9533 (_ BitVec 64) V!26745 V!26745) Unit!29063)

(assert (=> b!853139 (= lt!384465 (addSameAsAddTwiceSameKeyDiffValues!304 lt!384466 k0!854 lt!384460 lt!384464))))

(declare-fun lt!384462 () V!26745)

(declare-fun get!12347 (ValueCell!7697 V!26745) V!26745)

(assert (=> b!853139 (= lt!384460 (get!12347 (select (arr!23397 _values!688) from!1053) lt!384462))))

(declare-fun lt!384459 () ListLongMap!9533)

(assert (=> b!853139 (= lt!384459 (+!2196 lt!384466 (tuple2!10775 (select (arr!23396 _keys!868) from!1053) lt!384464)))))

(declare-fun v!557 () V!26745)

(assert (=> b!853139 (= lt!384464 (get!12347 (select (store (arr!23397 _values!688) i!612 (ValueCellFull!7697 v!557)) from!1053) lt!384462))))

(declare-fun dynLambda!1054 (Int (_ BitVec 64)) V!26745)

(assert (=> b!853139 (= lt!384462 (dynLambda!1054 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!384458 () array!48731)

(assert (=> b!853139 (= lt!384466 (getCurrentListMapNoExtraKeys!2790 _keys!868 lt!384458 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853140 () Bool)

(declare-fun res!579475 () Bool)

(assert (=> b!853140 (=> (not res!579475) (not e!475760))))

(assert (=> b!853140 (= res!579475 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23838 _keys!868))))))

(declare-fun b!853141 () Bool)

(declare-fun e!475761 () Bool)

(declare-fun call!38241 () ListLongMap!9533)

(assert (=> b!853141 (= e!475761 (= call!38241 call!38240))))

(declare-fun b!853142 () Bool)

(declare-fun res!579472 () Bool)

(assert (=> b!853142 (=> (not res!579472) (not e!475760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853142 (= res!579472 (validKeyInArray!0 k0!854))))

(declare-fun b!853143 () Bool)

(declare-fun e!475762 () Bool)

(assert (=> b!853143 (= e!475760 e!475762)))

(declare-fun res!579471 () Bool)

(assert (=> b!853143 (=> (not res!579471) (not e!475762))))

(assert (=> b!853143 (= res!579471 (= from!1053 i!612))))

(assert (=> b!853143 (= lt!384459 (getCurrentListMapNoExtraKeys!2790 _keys!868 lt!384458 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853143 (= lt!384458 (array!48732 (store (arr!23397 _values!688) i!612 (ValueCellFull!7697 v!557)) (size!23839 _values!688)))))

(declare-fun lt!384463 () ListLongMap!9533)

(assert (=> b!853143 (= lt!384463 (getCurrentListMapNoExtraKeys!2790 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26009 () Bool)

(assert (=> mapIsEmpty!26009 mapRes!26009))

(declare-fun b!853144 () Bool)

(assert (=> b!853144 (= e!475761 (= call!38241 (+!2196 call!38240 (tuple2!10775 k0!854 v!557))))))

(declare-fun bm!38238 () Bool)

(assert (=> bm!38238 (= call!38241 (getCurrentListMapNoExtraKeys!2790 _keys!868 lt!384458 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853145 () Bool)

(declare-fun res!579468 () Bool)

(assert (=> b!853145 (=> (not res!579468) (not e!475760))))

(declare-datatypes ((List!16599 0))(
  ( (Nil!16596) (Cons!16595 (h!17726 (_ BitVec 64)) (t!23173 List!16599)) )
))
(declare-fun arrayNoDuplicates!0 (array!48729 (_ BitVec 32) List!16599) Bool)

(assert (=> b!853145 (= res!579468 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16596))))

(declare-fun b!853146 () Bool)

(declare-fun res!579477 () Bool)

(assert (=> b!853146 (=> (not res!579477) (not e!475760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853146 (= res!579477 (validMask!0 mask!1196))))

(declare-fun b!853147 () Bool)

(assert (=> b!853147 (= e!475762 (not e!475759))))

(declare-fun res!579473 () Bool)

(assert (=> b!853147 (=> res!579473 e!475759)))

(assert (=> b!853147 (= res!579473 (not (validKeyInArray!0 (select (arr!23396 _keys!868) from!1053))))))

(assert (=> b!853147 e!475761))

(declare-fun c!91811 () Bool)

(assert (=> b!853147 (= c!91811 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384461 () Unit!29063)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!398 (array!48729 array!48731 (_ BitVec 32) (_ BitVec 32) V!26745 V!26745 (_ BitVec 32) (_ BitVec 64) V!26745 (_ BitVec 32) Int) Unit!29063)

(assert (=> b!853147 (= lt!384461 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!398 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853148 () Bool)

(assert (=> b!853148 (= e!475757 tp_is_empty!16273)))

(declare-fun b!853149 () Bool)

(assert (=> b!853149 (= e!475764 tp_is_empty!16273)))

(assert (= (and start!73204 res!579474) b!853146))

(assert (= (and b!853146 res!579477) b!853135))

(assert (= (and b!853135 res!579469) b!853137))

(assert (= (and b!853137 res!579470) b!853145))

(assert (= (and b!853145 res!579468) b!853140))

(assert (= (and b!853140 res!579475) b!853142))

(assert (= (and b!853142 res!579472) b!853136))

(assert (= (and b!853136 res!579476) b!853143))

(assert (= (and b!853143 res!579471) b!853147))

(assert (= (and b!853147 c!91811) b!853144))

(assert (= (and b!853147 (not c!91811)) b!853141))

(assert (= (or b!853144 b!853141) bm!38238))

(assert (= (or b!853144 b!853141) bm!38237))

(assert (= (and b!853147 (not res!579473)) b!853139))

(assert (= (and b!853138 condMapEmpty!26009) mapIsEmpty!26009))

(assert (= (and b!853138 (not condMapEmpty!26009)) mapNonEmpty!26009))

(get-info :version)

(assert (= (and mapNonEmpty!26009 ((_ is ValueCellFull!7697) mapValue!26009)) b!853148))

(assert (= (and b!853138 ((_ is ValueCellFull!7697) mapDefault!26009)) b!853149))

(assert (= start!73204 b!853138))

(declare-fun b_lambda!11651 () Bool)

(assert (=> (not b_lambda!11651) (not b!853139)))

(declare-fun t!23171 () Bool)

(declare-fun tb!4431 () Bool)

(assert (=> (and start!73204 (= defaultEntry!696 defaultEntry!696) t!23171) tb!4431))

(declare-fun result!8481 () Bool)

(assert (=> tb!4431 (= result!8481 tp_is_empty!16273)))

(assert (=> b!853139 t!23171))

(declare-fun b_and!23409 () Bool)

(assert (= b_and!23407 (and (=> t!23171 result!8481) b_and!23409)))

(declare-fun m!793819 () Bool)

(assert (=> b!853139 m!793819))

(declare-fun m!793821 () Bool)

(assert (=> b!853139 m!793821))

(declare-fun m!793823 () Bool)

(assert (=> b!853139 m!793823))

(declare-fun m!793825 () Bool)

(assert (=> b!853139 m!793825))

(declare-fun m!793827 () Bool)

(assert (=> b!853139 m!793827))

(declare-fun m!793829 () Bool)

(assert (=> b!853139 m!793829))

(assert (=> b!853139 m!793827))

(declare-fun m!793831 () Bool)

(assert (=> b!853139 m!793831))

(declare-fun m!793833 () Bool)

(assert (=> b!853139 m!793833))

(declare-fun m!793835 () Bool)

(assert (=> b!853139 m!793835))

(assert (=> b!853139 m!793819))

(declare-fun m!793837 () Bool)

(assert (=> b!853139 m!793837))

(declare-fun m!793839 () Bool)

(assert (=> b!853139 m!793839))

(assert (=> b!853139 m!793831))

(declare-fun m!793841 () Bool)

(assert (=> b!853139 m!793841))

(declare-fun m!793843 () Bool)

(assert (=> b!853139 m!793843))

(declare-fun m!793845 () Bool)

(assert (=> b!853144 m!793845))

(declare-fun m!793847 () Bool)

(assert (=> b!853137 m!793847))

(declare-fun m!793849 () Bool)

(assert (=> b!853143 m!793849))

(assert (=> b!853143 m!793837))

(declare-fun m!793851 () Bool)

(assert (=> b!853143 m!793851))

(assert (=> bm!38238 m!793839))

(declare-fun m!793853 () Bool)

(assert (=> mapNonEmpty!26009 m!793853))

(declare-fun m!793855 () Bool)

(assert (=> b!853145 m!793855))

(assert (=> b!853147 m!793841))

(assert (=> b!853147 m!793841))

(declare-fun m!793857 () Bool)

(assert (=> b!853147 m!793857))

(declare-fun m!793859 () Bool)

(assert (=> b!853147 m!793859))

(declare-fun m!793861 () Bool)

(assert (=> start!73204 m!793861))

(declare-fun m!793863 () Bool)

(assert (=> start!73204 m!793863))

(declare-fun m!793865 () Bool)

(assert (=> bm!38237 m!793865))

(declare-fun m!793867 () Bool)

(assert (=> b!853136 m!793867))

(declare-fun m!793869 () Bool)

(assert (=> b!853142 m!793869))

(declare-fun m!793871 () Bool)

(assert (=> b!853146 m!793871))

(check-sat (not mapNonEmpty!26009) (not b!853147) (not b!853143) (not b_lambda!11651) (not b!853145) b_and!23409 (not b!853139) (not start!73204) (not bm!38237) (not b!853144) tp_is_empty!16273 (not b_next!14137) (not b!853146) (not b!853137) (not b!853142) (not bm!38238))
(check-sat b_and!23409 (not b_next!14137))
