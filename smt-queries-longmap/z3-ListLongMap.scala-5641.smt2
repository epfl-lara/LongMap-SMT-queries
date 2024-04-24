; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73798 () Bool)

(assert start!73798)

(declare-fun b_free!14545 () Bool)

(declare-fun b_next!14545 () Bool)

(assert (=> start!73798 (= b_free!14545 (not b_next!14545))))

(declare-fun tp!51140 () Bool)

(declare-fun b_and!24079 () Bool)

(assert (=> start!73798 (= tp!51140 b_and!24079)))

(declare-fun b!862794 () Bool)

(declare-fun e!480787 () Bool)

(declare-fun e!480785 () Bool)

(assert (=> b!862794 (= e!480787 e!480785)))

(declare-fun res!586056 () Bool)

(assert (=> b!862794 (=> (not res!586056) (not e!480785))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!862794 (= res!586056 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27289 0))(
  ( (V!27290 (val!8388 Int)) )
))
(declare-datatypes ((ValueCell!7901 0))(
  ( (ValueCellFull!7901 (v!10813 V!27289)) (EmptyCell!7901) )
))
(declare-datatypes ((array!49583 0))(
  ( (array!49584 (arr!23818 (Array (_ BitVec 32) ValueCell!7901)) (size!24259 (_ BitVec 32))) )
))
(declare-fun lt!389171 () array!49583)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49585 0))(
  ( (array!49586 (arr!23819 (Array (_ BitVec 32) (_ BitVec 64))) (size!24260 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49585)

(declare-fun minValue!654 () V!27289)

(declare-fun zeroValue!654 () V!27289)

(declare-datatypes ((tuple2!11018 0))(
  ( (tuple2!11019 (_1!5520 (_ BitVec 64)) (_2!5520 V!27289)) )
))
(declare-datatypes ((List!16855 0))(
  ( (Nil!16852) (Cons!16851 (h!17988 tuple2!11018) (t!23658 List!16855)) )
))
(declare-datatypes ((ListLongMap!9789 0))(
  ( (ListLongMap!9790 (toList!4910 List!16855)) )
))
(declare-fun lt!389177 () ListLongMap!9789)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2962 (array!49585 array!49583 (_ BitVec 32) (_ BitVec 32) V!27289 V!27289 (_ BitVec 32) Int) ListLongMap!9789)

(assert (=> b!862794 (= lt!389177 (getCurrentListMapNoExtraKeys!2962 _keys!868 lt!389171 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27289)

(declare-fun _values!688 () array!49583)

(assert (=> b!862794 (= lt!389171 (array!49584 (store (arr!23818 _values!688) i!612 (ValueCellFull!7901 v!557)) (size!24259 _values!688)))))

(declare-fun lt!389176 () ListLongMap!9789)

(assert (=> b!862794 (= lt!389176 (getCurrentListMapNoExtraKeys!2962 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!586060 () Bool)

(assert (=> start!73798 (=> (not res!586060) (not e!480787))))

(assert (=> start!73798 (= res!586060 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24260 _keys!868))))))

(assert (=> start!73798 e!480787))

(declare-fun tp_is_empty!16681 () Bool)

(assert (=> start!73798 tp_is_empty!16681))

(assert (=> start!73798 true))

(assert (=> start!73798 tp!51140))

(declare-fun array_inv!18896 (array!49585) Bool)

(assert (=> start!73798 (array_inv!18896 _keys!868)))

(declare-fun e!480783 () Bool)

(declare-fun array_inv!18897 (array!49583) Bool)

(assert (=> start!73798 (and (array_inv!18897 _values!688) e!480783)))

(declare-fun b!862795 () Bool)

(declare-fun res!586057 () Bool)

(assert (=> b!862795 (=> (not res!586057) (not e!480787))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!862795 (= res!586057 (and (= (select (arr!23819 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862796 () Bool)

(declare-fun e!480784 () Bool)

(assert (=> b!862796 (= e!480784 tp_is_empty!16681)))

(declare-fun b!862797 () Bool)

(declare-fun res!586052 () Bool)

(assert (=> b!862797 (=> (not res!586052) (not e!480787))))

(assert (=> b!862797 (= res!586052 (and (= (size!24259 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24260 _keys!868) (size!24259 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862798 () Bool)

(declare-fun res!586051 () Bool)

(assert (=> b!862798 (=> (not res!586051) (not e!480787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49585 (_ BitVec 32)) Bool)

(assert (=> b!862798 (= res!586051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862799 () Bool)

(declare-fun e!480780 () Bool)

(assert (=> b!862799 (= e!480780 tp_is_empty!16681)))

(declare-fun b!862800 () Bool)

(declare-fun res!586055 () Bool)

(assert (=> b!862800 (=> (not res!586055) (not e!480787))))

(declare-datatypes ((List!16856 0))(
  ( (Nil!16853) (Cons!16852 (h!17989 (_ BitVec 64)) (t!23659 List!16856)) )
))
(declare-fun arrayNoDuplicates!0 (array!49585 (_ BitVec 32) List!16856) Bool)

(assert (=> b!862800 (= res!586055 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16853))))

(declare-fun b!862801 () Bool)

(declare-fun res!586059 () Bool)

(assert (=> b!862801 (=> (not res!586059) (not e!480787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862801 (= res!586059 (validKeyInArray!0 k0!854))))

(declare-fun b!862802 () Bool)

(declare-fun e!480782 () Bool)

(assert (=> b!862802 (= e!480782 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24260 _keys!868))))))

(assert (=> b!862802 (not (= (select (arr!23819 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29415 0))(
  ( (Unit!29416) )
))
(declare-fun lt!389170 () Unit!29415)

(declare-fun e!480786 () Unit!29415)

(assert (=> b!862802 (= lt!389170 e!480786)))

(declare-fun c!92320 () Bool)

(assert (=> b!862802 (= c!92320 (= (select (arr!23819 _keys!868) from!1053) k0!854))))

(declare-fun lt!389180 () ListLongMap!9789)

(declare-fun +!2314 (ListLongMap!9789 tuple2!11018) ListLongMap!9789)

(declare-fun get!12574 (ValueCell!7901 V!27289) V!27289)

(declare-fun dynLambda!1142 (Int (_ BitVec 64)) V!27289)

(assert (=> b!862802 (= lt!389177 (+!2314 lt!389180 (tuple2!11019 (select (arr!23819 _keys!868) from!1053) (get!12574 (select (arr!23818 _values!688) from!1053) (dynLambda!1142 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!862803 () Bool)

(declare-fun res!586054 () Bool)

(assert (=> b!862803 (=> (not res!586054) (not e!480787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862803 (= res!586054 (validMask!0 mask!1196))))

(declare-fun b!862804 () Bool)

(declare-fun res!586053 () Bool)

(assert (=> b!862804 (=> (not res!586053) (not e!480787))))

(assert (=> b!862804 (= res!586053 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24260 _keys!868))))))

(declare-fun mapNonEmpty!26621 () Bool)

(declare-fun mapRes!26621 () Bool)

(declare-fun tp!51139 () Bool)

(assert (=> mapNonEmpty!26621 (= mapRes!26621 (and tp!51139 e!480780))))

(declare-fun mapValue!26621 () ValueCell!7901)

(declare-fun mapKey!26621 () (_ BitVec 32))

(declare-fun mapRest!26621 () (Array (_ BitVec 32) ValueCell!7901))

(assert (=> mapNonEmpty!26621 (= (arr!23818 _values!688) (store mapRest!26621 mapKey!26621 mapValue!26621))))

(declare-fun b!862805 () Bool)

(declare-fun Unit!29417 () Unit!29415)

(assert (=> b!862805 (= e!480786 Unit!29417)))

(declare-fun lt!389178 () Unit!29415)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49585 (_ BitVec 32) (_ BitVec 32)) Unit!29415)

(assert (=> b!862805 (= lt!389178 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862805 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16853)))

(declare-fun lt!389175 () Unit!29415)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49585 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29415)

(assert (=> b!862805 (= lt!389175 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862805 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389179 () Unit!29415)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49585 (_ BitVec 64) (_ BitVec 32) List!16856) Unit!29415)

(assert (=> b!862805 (= lt!389179 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16853))))

(assert (=> b!862805 false))

(declare-fun mapIsEmpty!26621 () Bool)

(assert (=> mapIsEmpty!26621 mapRes!26621))

(declare-fun b!862806 () Bool)

(declare-fun Unit!29418 () Unit!29415)

(assert (=> b!862806 (= e!480786 Unit!29418)))

(declare-fun b!862807 () Bool)

(assert (=> b!862807 (= e!480783 (and e!480784 mapRes!26621))))

(declare-fun condMapEmpty!26621 () Bool)

(declare-fun mapDefault!26621 () ValueCell!7901)

(assert (=> b!862807 (= condMapEmpty!26621 (= (arr!23818 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7901)) mapDefault!26621)))))

(declare-fun b!862808 () Bool)

(assert (=> b!862808 (= e!480785 (not e!480782))))

(declare-fun res!586058 () Bool)

(assert (=> b!862808 (=> res!586058 e!480782)))

(assert (=> b!862808 (= res!586058 (not (validKeyInArray!0 (select (arr!23819 _keys!868) from!1053))))))

(declare-fun lt!389173 () ListLongMap!9789)

(assert (=> b!862808 (= lt!389173 lt!389180)))

(declare-fun lt!389174 () ListLongMap!9789)

(assert (=> b!862808 (= lt!389180 (+!2314 lt!389174 (tuple2!11019 k0!854 v!557)))))

(assert (=> b!862808 (= lt!389173 (getCurrentListMapNoExtraKeys!2962 _keys!868 lt!389171 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862808 (= lt!389174 (getCurrentListMapNoExtraKeys!2962 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389172 () Unit!29415)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!502 (array!49585 array!49583 (_ BitVec 32) (_ BitVec 32) V!27289 V!27289 (_ BitVec 32) (_ BitVec 64) V!27289 (_ BitVec 32) Int) Unit!29415)

(assert (=> b!862808 (= lt!389172 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!502 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73798 res!586060) b!862803))

(assert (= (and b!862803 res!586054) b!862797))

(assert (= (and b!862797 res!586052) b!862798))

(assert (= (and b!862798 res!586051) b!862800))

(assert (= (and b!862800 res!586055) b!862804))

(assert (= (and b!862804 res!586053) b!862801))

(assert (= (and b!862801 res!586059) b!862795))

(assert (= (and b!862795 res!586057) b!862794))

(assert (= (and b!862794 res!586056) b!862808))

(assert (= (and b!862808 (not res!586058)) b!862802))

(assert (= (and b!862802 c!92320) b!862805))

(assert (= (and b!862802 (not c!92320)) b!862806))

(assert (= (and b!862807 condMapEmpty!26621) mapIsEmpty!26621))

(assert (= (and b!862807 (not condMapEmpty!26621)) mapNonEmpty!26621))

(get-info :version)

(assert (= (and mapNonEmpty!26621 ((_ is ValueCellFull!7901) mapValue!26621)) b!862799))

(assert (= (and b!862807 ((_ is ValueCellFull!7901) mapDefault!26621)) b!862796))

(assert (= start!73798 b!862807))

(declare-fun b_lambda!11911 () Bool)

(assert (=> (not b_lambda!11911) (not b!862802)))

(declare-fun t!23657 () Bool)

(declare-fun tb!4659 () Bool)

(assert (=> (and start!73798 (= defaultEntry!696 defaultEntry!696) t!23657) tb!4659))

(declare-fun result!8937 () Bool)

(assert (=> tb!4659 (= result!8937 tp_is_empty!16681)))

(assert (=> b!862802 t!23657))

(declare-fun b_and!24081 () Bool)

(assert (= b_and!24079 (and (=> t!23657 result!8937) b_and!24081)))

(declare-fun m!804131 () Bool)

(assert (=> b!862805 m!804131))

(declare-fun m!804133 () Bool)

(assert (=> b!862805 m!804133))

(declare-fun m!804135 () Bool)

(assert (=> b!862805 m!804135))

(declare-fun m!804137 () Bool)

(assert (=> b!862805 m!804137))

(declare-fun m!804139 () Bool)

(assert (=> b!862805 m!804139))

(declare-fun m!804141 () Bool)

(assert (=> b!862802 m!804141))

(declare-fun m!804143 () Bool)

(assert (=> b!862802 m!804143))

(declare-fun m!804145 () Bool)

(assert (=> b!862802 m!804145))

(declare-fun m!804147 () Bool)

(assert (=> b!862802 m!804147))

(assert (=> b!862802 m!804143))

(declare-fun m!804149 () Bool)

(assert (=> b!862802 m!804149))

(assert (=> b!862802 m!804145))

(declare-fun m!804151 () Bool)

(assert (=> b!862800 m!804151))

(declare-fun m!804153 () Bool)

(assert (=> b!862803 m!804153))

(declare-fun m!804155 () Bool)

(assert (=> b!862794 m!804155))

(declare-fun m!804157 () Bool)

(assert (=> b!862794 m!804157))

(declare-fun m!804159 () Bool)

(assert (=> b!862794 m!804159))

(declare-fun m!804161 () Bool)

(assert (=> b!862795 m!804161))

(declare-fun m!804163 () Bool)

(assert (=> b!862798 m!804163))

(declare-fun m!804165 () Bool)

(assert (=> mapNonEmpty!26621 m!804165))

(declare-fun m!804167 () Bool)

(assert (=> b!862801 m!804167))

(declare-fun m!804169 () Bool)

(assert (=> b!862808 m!804169))

(assert (=> b!862808 m!804149))

(declare-fun m!804171 () Bool)

(assert (=> b!862808 m!804171))

(declare-fun m!804173 () Bool)

(assert (=> b!862808 m!804173))

(declare-fun m!804175 () Bool)

(assert (=> b!862808 m!804175))

(assert (=> b!862808 m!804149))

(declare-fun m!804177 () Bool)

(assert (=> b!862808 m!804177))

(declare-fun m!804179 () Bool)

(assert (=> start!73798 m!804179))

(declare-fun m!804181 () Bool)

(assert (=> start!73798 m!804181))

(check-sat (not b!862801) (not b!862800) (not b!862802) (not mapNonEmpty!26621) (not start!73798) (not b!862803) (not b!862808) (not b_lambda!11911) tp_is_empty!16681 (not b!862794) b_and!24081 (not b!862805) (not b_next!14545) (not b!862798))
(check-sat b_and!24081 (not b_next!14545))
