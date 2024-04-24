; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74768 () Bool)

(assert start!74768)

(declare-fun b_free!15289 () Bool)

(declare-fun b_next!15289 () Bool)

(assert (=> start!74768 (= b_free!15289 (not b_next!15289))))

(declare-fun tp!53550 () Bool)

(declare-fun b_and!25175 () Bool)

(assert (=> start!74768 (= tp!53550 b_and!25175)))

(declare-fun b!880074 () Bool)

(declare-fun e!489855 () Bool)

(declare-fun e!489851 () Bool)

(assert (=> b!880074 (= e!489855 (not e!489851))))

(declare-fun res!597683 () Bool)

(assert (=> b!880074 (=> res!597683 e!489851)))

(declare-datatypes ((array!51227 0))(
  ( (array!51228 (arr!24635 (Array (_ BitVec 32) (_ BitVec 64))) (size!25076 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51227)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880074 (= res!597683 (not (validKeyInArray!0 (select (arr!24635 _keys!868) from!1053))))))

(declare-datatypes ((V!28425 0))(
  ( (V!28426 (val!8814 Int)) )
))
(declare-datatypes ((tuple2!11594 0))(
  ( (tuple2!11595 (_1!5808 (_ BitVec 64)) (_2!5808 V!28425)) )
))
(declare-datatypes ((List!17427 0))(
  ( (Nil!17424) (Cons!17423 (h!18560 tuple2!11594) (t!24510 List!17427)) )
))
(declare-datatypes ((ListLongMap!10365 0))(
  ( (ListLongMap!10366 (toList!5198 List!17427)) )
))
(declare-fun lt!397821 () ListLongMap!10365)

(declare-fun lt!397824 () ListLongMap!10365)

(assert (=> b!880074 (= lt!397821 lt!397824)))

(declare-fun v!557 () V!28425)

(declare-fun lt!397819 () ListLongMap!10365)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2516 (ListLongMap!10365 tuple2!11594) ListLongMap!10365)

(assert (=> b!880074 (= lt!397824 (+!2516 lt!397819 (tuple2!11595 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8327 0))(
  ( (ValueCellFull!8327 (v!11254 V!28425)) (EmptyCell!8327) )
))
(declare-datatypes ((array!51229 0))(
  ( (array!51230 (arr!24636 (Array (_ BitVec 32) ValueCell!8327)) (size!25077 (_ BitVec 32))) )
))
(declare-fun lt!397820 () array!51229)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28425)

(declare-fun zeroValue!654 () V!28425)

(declare-fun getCurrentListMapNoExtraKeys!3240 (array!51227 array!51229 (_ BitVec 32) (_ BitVec 32) V!28425 V!28425 (_ BitVec 32) Int) ListLongMap!10365)

(assert (=> b!880074 (= lt!397821 (getCurrentListMapNoExtraKeys!3240 _keys!868 lt!397820 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51229)

(assert (=> b!880074 (= lt!397819 (getCurrentListMapNoExtraKeys!3240 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30004 0))(
  ( (Unit!30005) )
))
(declare-fun lt!397825 () Unit!30004)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!684 (array!51227 array!51229 (_ BitVec 32) (_ BitVec 32) V!28425 V!28425 (_ BitVec 32) (_ BitVec 64) V!28425 (_ BitVec 32) Int) Unit!30004)

(assert (=> b!880074 (= lt!397825 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!684 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880075 () Bool)

(declare-fun res!597676 () Bool)

(declare-fun e!489853 () Bool)

(assert (=> b!880075 (=> (not res!597676) (not e!489853))))

(assert (=> b!880075 (= res!597676 (validKeyInArray!0 k0!854))))

(declare-fun b!880076 () Bool)

(declare-fun e!489856 () Bool)

(declare-fun e!489850 () Bool)

(declare-fun mapRes!27915 () Bool)

(assert (=> b!880076 (= e!489856 (and e!489850 mapRes!27915))))

(declare-fun condMapEmpty!27915 () Bool)

(declare-fun mapDefault!27915 () ValueCell!8327)

(assert (=> b!880076 (= condMapEmpty!27915 (= (arr!24636 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8327)) mapDefault!27915)))))

(declare-fun b!880077 () Bool)

(declare-fun res!597677 () Bool)

(assert (=> b!880077 (=> (not res!597677) (not e!489853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51227 (_ BitVec 32)) Bool)

(assert (=> b!880077 (= res!597677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880078 () Bool)

(declare-fun e!489852 () Bool)

(declare-fun tp_is_empty!17533 () Bool)

(assert (=> b!880078 (= e!489852 tp_is_empty!17533)))

(declare-fun b!880079 () Bool)

(declare-fun res!597682 () Bool)

(assert (=> b!880079 (=> (not res!597682) (not e!489853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880079 (= res!597682 (validMask!0 mask!1196))))

(declare-fun b!880080 () Bool)

(declare-fun res!597684 () Bool)

(assert (=> b!880080 (=> (not res!597684) (not e!489853))))

(assert (=> b!880080 (= res!597684 (and (= (select (arr!24635 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!880081 () Bool)

(declare-fun res!597680 () Bool)

(assert (=> b!880081 (=> (not res!597680) (not e!489853))))

(assert (=> b!880081 (= res!597680 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25076 _keys!868))))))

(declare-fun b!880082 () Bool)

(assert (=> b!880082 (= e!489850 tp_is_empty!17533)))

(declare-fun b!880083 () Bool)

(declare-fun res!597685 () Bool)

(assert (=> b!880083 (=> (not res!597685) (not e!489853))))

(assert (=> b!880083 (= res!597685 (and (= (size!25077 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25076 _keys!868) (size!25077 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880084 () Bool)

(declare-fun res!597681 () Bool)

(assert (=> b!880084 (=> (not res!597681) (not e!489853))))

(declare-datatypes ((List!17428 0))(
  ( (Nil!17425) (Cons!17424 (h!18561 (_ BitVec 64)) (t!24511 List!17428)) )
))
(declare-fun arrayNoDuplicates!0 (array!51227 (_ BitVec 32) List!17428) Bool)

(assert (=> b!880084 (= res!597681 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17425))))

(declare-fun mapIsEmpty!27915 () Bool)

(assert (=> mapIsEmpty!27915 mapRes!27915))

(declare-fun b!880085 () Bool)

(declare-fun lt!397822 () ListLongMap!10365)

(declare-fun get!12963 (ValueCell!8327 V!28425) V!28425)

(declare-fun dynLambda!1242 (Int (_ BitVec 64)) V!28425)

(assert (=> b!880085 (= e!489851 (= lt!397822 (+!2516 lt!397824 (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!880086 () Bool)

(assert (=> b!880086 (= e!489853 e!489855)))

(declare-fun res!597678 () Bool)

(assert (=> b!880086 (=> (not res!597678) (not e!489855))))

(assert (=> b!880086 (= res!597678 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!880086 (= lt!397822 (getCurrentListMapNoExtraKeys!3240 _keys!868 lt!397820 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880086 (= lt!397820 (array!51230 (store (arr!24636 _values!688) i!612 (ValueCellFull!8327 v!557)) (size!25077 _values!688)))))

(declare-fun lt!397823 () ListLongMap!10365)

(assert (=> b!880086 (= lt!397823 (getCurrentListMapNoExtraKeys!3240 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27915 () Bool)

(declare-fun tp!53549 () Bool)

(assert (=> mapNonEmpty!27915 (= mapRes!27915 (and tp!53549 e!489852))))

(declare-fun mapValue!27915 () ValueCell!8327)

(declare-fun mapKey!27915 () (_ BitVec 32))

(declare-fun mapRest!27915 () (Array (_ BitVec 32) ValueCell!8327))

(assert (=> mapNonEmpty!27915 (= (arr!24636 _values!688) (store mapRest!27915 mapKey!27915 mapValue!27915))))

(declare-fun res!597679 () Bool)

(assert (=> start!74768 (=> (not res!597679) (not e!489853))))

(assert (=> start!74768 (= res!597679 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25076 _keys!868))))))

(assert (=> start!74768 e!489853))

(assert (=> start!74768 tp_is_empty!17533))

(assert (=> start!74768 true))

(assert (=> start!74768 tp!53550))

(declare-fun array_inv!19448 (array!51227) Bool)

(assert (=> start!74768 (array_inv!19448 _keys!868)))

(declare-fun array_inv!19449 (array!51229) Bool)

(assert (=> start!74768 (and (array_inv!19449 _values!688) e!489856)))

(assert (= (and start!74768 res!597679) b!880079))

(assert (= (and b!880079 res!597682) b!880083))

(assert (= (and b!880083 res!597685) b!880077))

(assert (= (and b!880077 res!597677) b!880084))

(assert (= (and b!880084 res!597681) b!880081))

(assert (= (and b!880081 res!597680) b!880075))

(assert (= (and b!880075 res!597676) b!880080))

(assert (= (and b!880080 res!597684) b!880086))

(assert (= (and b!880086 res!597678) b!880074))

(assert (= (and b!880074 (not res!597683)) b!880085))

(assert (= (and b!880076 condMapEmpty!27915) mapIsEmpty!27915))

(assert (= (and b!880076 (not condMapEmpty!27915)) mapNonEmpty!27915))

(get-info :version)

(assert (= (and mapNonEmpty!27915 ((_ is ValueCellFull!8327) mapValue!27915)) b!880078))

(assert (= (and b!880076 ((_ is ValueCellFull!8327) mapDefault!27915)) b!880082))

(assert (= start!74768 b!880076))

(declare-fun b_lambda!12343 () Bool)

(assert (=> (not b_lambda!12343) (not b!880085)))

(declare-fun t!24509 () Bool)

(declare-fun tb!4939 () Bool)

(assert (=> (and start!74768 (= defaultEntry!696 defaultEntry!696) t!24509) tb!4939))

(declare-fun result!9507 () Bool)

(assert (=> tb!4939 (= result!9507 tp_is_empty!17533)))

(assert (=> b!880085 t!24509))

(declare-fun b_and!25177 () Bool)

(assert (= b_and!25175 (and (=> t!24509 result!9507) b_and!25177)))

(declare-fun m!820179 () Bool)

(assert (=> b!880080 m!820179))

(declare-fun m!820181 () Bool)

(assert (=> b!880084 m!820181))

(declare-fun m!820183 () Bool)

(assert (=> b!880085 m!820183))

(declare-fun m!820185 () Bool)

(assert (=> b!880085 m!820185))

(declare-fun m!820187 () Bool)

(assert (=> b!880085 m!820187))

(declare-fun m!820189 () Bool)

(assert (=> b!880085 m!820189))

(assert (=> b!880085 m!820185))

(declare-fun m!820191 () Bool)

(assert (=> b!880085 m!820191))

(assert (=> b!880085 m!820187))

(declare-fun m!820193 () Bool)

(assert (=> mapNonEmpty!27915 m!820193))

(declare-fun m!820195 () Bool)

(assert (=> start!74768 m!820195))

(declare-fun m!820197 () Bool)

(assert (=> start!74768 m!820197))

(declare-fun m!820199 () Bool)

(assert (=> b!880074 m!820199))

(declare-fun m!820201 () Bool)

(assert (=> b!880074 m!820201))

(assert (=> b!880074 m!820191))

(declare-fun m!820203 () Bool)

(assert (=> b!880074 m!820203))

(assert (=> b!880074 m!820191))

(declare-fun m!820205 () Bool)

(assert (=> b!880074 m!820205))

(declare-fun m!820207 () Bool)

(assert (=> b!880074 m!820207))

(declare-fun m!820209 () Bool)

(assert (=> b!880077 m!820209))

(declare-fun m!820211 () Bool)

(assert (=> b!880079 m!820211))

(declare-fun m!820213 () Bool)

(assert (=> b!880086 m!820213))

(declare-fun m!820215 () Bool)

(assert (=> b!880086 m!820215))

(declare-fun m!820217 () Bool)

(assert (=> b!880086 m!820217))

(declare-fun m!820219 () Bool)

(assert (=> b!880075 m!820219))

(check-sat (not b!880074) (not mapNonEmpty!27915) (not b_next!15289) (not b!880086) (not b_lambda!12343) (not b!880075) (not b!880077) (not b!880084) (not start!74768) b_and!25177 (not b!880079) (not b!880085) tp_is_empty!17533)
(check-sat b_and!25177 (not b_next!15289))
(get-model)

(declare-fun b_lambda!12349 () Bool)

(assert (= b_lambda!12343 (or (and start!74768 b_free!15289) b_lambda!12349)))

(check-sat (not b!880074) (not mapNonEmpty!27915) (not b_next!15289) (not b!880086) (not b!880075) (not b!880077) (not b!880084) (not b_lambda!12349) (not start!74768) b_and!25177 (not b!880079) (not b!880085) tp_is_empty!17533)
(check-sat b_and!25177 (not b_next!15289))
(get-model)

(declare-fun d!109217 () Bool)

(declare-fun e!489901 () Bool)

(assert (=> d!109217 e!489901))

(declare-fun res!597750 () Bool)

(assert (=> d!109217 (=> (not res!597750) (not e!489901))))

(declare-fun lt!397878 () ListLongMap!10365)

(declare-fun contains!4229 (ListLongMap!10365 (_ BitVec 64)) Bool)

(assert (=> d!109217 (= res!597750 (contains!4229 lt!397878 (_1!5808 (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!397876 () List!17427)

(assert (=> d!109217 (= lt!397878 (ListLongMap!10366 lt!397876))))

(declare-fun lt!397879 () Unit!30004)

(declare-fun lt!397877 () Unit!30004)

(assert (=> d!109217 (= lt!397879 lt!397877)))

(declare-datatypes ((Option!427 0))(
  ( (Some!426 (v!11260 V!28425)) (None!425) )
))
(declare-fun getValueByKey!421 (List!17427 (_ BitVec 64)) Option!427)

(assert (=> d!109217 (= (getValueByKey!421 lt!397876 (_1!5808 (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!426 (_2!5808 (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!235 (List!17427 (_ BitVec 64) V!28425) Unit!30004)

(assert (=> d!109217 (= lt!397877 (lemmaContainsTupThenGetReturnValue!235 lt!397876 (_1!5808 (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5808 (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!274 (List!17427 (_ BitVec 64) V!28425) List!17427)

(assert (=> d!109217 (= lt!397876 (insertStrictlySorted!274 (toList!5198 lt!397824) (_1!5808 (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5808 (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109217 (= (+!2516 lt!397824 (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!397878)))

(declare-fun b!880175 () Bool)

(declare-fun res!597751 () Bool)

(assert (=> b!880175 (=> (not res!597751) (not e!489901))))

(assert (=> b!880175 (= res!597751 (= (getValueByKey!421 (toList!5198 lt!397878) (_1!5808 (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!426 (_2!5808 (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!880176 () Bool)

(declare-fun contains!4230 (List!17427 tuple2!11594) Bool)

(assert (=> b!880176 (= e!489901 (contains!4230 (toList!5198 lt!397878) (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109217 res!597750) b!880175))

(assert (= (and b!880175 res!597751) b!880176))

(declare-fun m!820305 () Bool)

(assert (=> d!109217 m!820305))

(declare-fun m!820307 () Bool)

(assert (=> d!109217 m!820307))

(declare-fun m!820309 () Bool)

(assert (=> d!109217 m!820309))

(declare-fun m!820311 () Bool)

(assert (=> d!109217 m!820311))

(declare-fun m!820313 () Bool)

(assert (=> b!880175 m!820313))

(declare-fun m!820315 () Bool)

(assert (=> b!880176 m!820315))

(assert (=> b!880085 d!109217))

(declare-fun d!109219 () Bool)

(declare-fun c!93071 () Bool)

(assert (=> d!109219 (= c!93071 ((_ is ValueCellFull!8327) (select (arr!24636 _values!688) from!1053)))))

(declare-fun e!489904 () V!28425)

(assert (=> d!109219 (= (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!489904)))

(declare-fun b!880181 () Bool)

(declare-fun get!12965 (ValueCell!8327 V!28425) V!28425)

(assert (=> b!880181 (= e!489904 (get!12965 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880182 () Bool)

(declare-fun get!12966 (ValueCell!8327 V!28425) V!28425)

(assert (=> b!880182 (= e!489904 (get!12966 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109219 c!93071) b!880181))

(assert (= (and d!109219 (not c!93071)) b!880182))

(assert (=> b!880181 m!820185))

(assert (=> b!880181 m!820187))

(declare-fun m!820317 () Bool)

(assert (=> b!880181 m!820317))

(assert (=> b!880182 m!820185))

(assert (=> b!880182 m!820187))

(declare-fun m!820319 () Bool)

(assert (=> b!880182 m!820319))

(assert (=> b!880085 d!109219))

(declare-fun b!880191 () Bool)

(declare-fun e!489911 () Bool)

(declare-fun call!38902 () Bool)

(assert (=> b!880191 (= e!489911 call!38902)))

(declare-fun d!109221 () Bool)

(declare-fun res!597756 () Bool)

(declare-fun e!489912 () Bool)

(assert (=> d!109221 (=> res!597756 e!489912)))

(assert (=> d!109221 (= res!597756 (bvsge #b00000000000000000000000000000000 (size!25076 _keys!868)))))

(assert (=> d!109221 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!489912)))

(declare-fun b!880192 () Bool)

(assert (=> b!880192 (= e!489912 e!489911)))

(declare-fun c!93074 () Bool)

(assert (=> b!880192 (= c!93074 (validKeyInArray!0 (select (arr!24635 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38899 () Bool)

(assert (=> bm!38899 (= call!38902 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!880193 () Bool)

(declare-fun e!489913 () Bool)

(assert (=> b!880193 (= e!489913 call!38902)))

(declare-fun b!880194 () Bool)

(assert (=> b!880194 (= e!489911 e!489913)))

(declare-fun lt!397886 () (_ BitVec 64))

(assert (=> b!880194 (= lt!397886 (select (arr!24635 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!397887 () Unit!30004)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51227 (_ BitVec 64) (_ BitVec 32)) Unit!30004)

(assert (=> b!880194 (= lt!397887 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!397886 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!880194 (arrayContainsKey!0 _keys!868 lt!397886 #b00000000000000000000000000000000)))

(declare-fun lt!397888 () Unit!30004)

(assert (=> b!880194 (= lt!397888 lt!397887)))

(declare-fun res!597757 () Bool)

(declare-datatypes ((SeekEntryResult!8705 0))(
  ( (MissingZero!8705 (index!37191 (_ BitVec 32))) (Found!8705 (index!37192 (_ BitVec 32))) (Intermediate!8705 (undefined!9517 Bool) (index!37193 (_ BitVec 32)) (x!74437 (_ BitVec 32))) (Undefined!8705) (MissingVacant!8705 (index!37194 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51227 (_ BitVec 32)) SeekEntryResult!8705)

(assert (=> b!880194 (= res!597757 (= (seekEntryOrOpen!0 (select (arr!24635 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8705 #b00000000000000000000000000000000)))))

(assert (=> b!880194 (=> (not res!597757) (not e!489913))))

(assert (= (and d!109221 (not res!597756)) b!880192))

(assert (= (and b!880192 c!93074) b!880194))

(assert (= (and b!880192 (not c!93074)) b!880191))

(assert (= (and b!880194 res!597757) b!880193))

(assert (= (or b!880193 b!880191) bm!38899))

(declare-fun m!820321 () Bool)

(assert (=> b!880192 m!820321))

(assert (=> b!880192 m!820321))

(declare-fun m!820323 () Bool)

(assert (=> b!880192 m!820323))

(declare-fun m!820325 () Bool)

(assert (=> bm!38899 m!820325))

(assert (=> b!880194 m!820321))

(declare-fun m!820327 () Bool)

(assert (=> b!880194 m!820327))

(declare-fun m!820329 () Bool)

(assert (=> b!880194 m!820329))

(assert (=> b!880194 m!820321))

(declare-fun m!820331 () Bool)

(assert (=> b!880194 m!820331))

(assert (=> b!880077 d!109221))

(declare-fun b!880219 () Bool)

(declare-fun e!489930 () Bool)

(declare-fun e!489928 () Bool)

(assert (=> b!880219 (= e!489930 e!489928)))

(declare-fun c!93086 () Bool)

(assert (=> b!880219 (= c!93086 (bvslt from!1053 (size!25076 _keys!868)))))

(declare-fun bm!38902 () Bool)

(declare-fun call!38905 () ListLongMap!10365)

(assert (=> bm!38902 (= call!38905 (getCurrentListMapNoExtraKeys!3240 _keys!868 lt!397820 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109223 () Bool)

(declare-fun e!489931 () Bool)

(assert (=> d!109223 e!489931))

(declare-fun res!597766 () Bool)

(assert (=> d!109223 (=> (not res!597766) (not e!489931))))

(declare-fun lt!397909 () ListLongMap!10365)

(assert (=> d!109223 (= res!597766 (not (contains!4229 lt!397909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!489929 () ListLongMap!10365)

(assert (=> d!109223 (= lt!397909 e!489929)))

(declare-fun c!93084 () Bool)

(assert (=> d!109223 (= c!93084 (bvsge from!1053 (size!25076 _keys!868)))))

(assert (=> d!109223 (validMask!0 mask!1196)))

(assert (=> d!109223 (= (getCurrentListMapNoExtraKeys!3240 _keys!868 lt!397820 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!397909)))

(declare-fun b!880220 () Bool)

(assert (=> b!880220 (= e!489928 (= lt!397909 (getCurrentListMapNoExtraKeys!3240 _keys!868 lt!397820 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!880221 () Bool)

(assert (=> b!880221 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25076 _keys!868)))))

(assert (=> b!880221 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25077 lt!397820)))))

(declare-fun e!489934 () Bool)

(declare-fun apply!378 (ListLongMap!10365 (_ BitVec 64)) V!28425)

(assert (=> b!880221 (= e!489934 (= (apply!378 lt!397909 (select (arr!24635 _keys!868) from!1053)) (get!12963 (select (arr!24636 lt!397820) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!880222 () Bool)

(assert (=> b!880222 (= e!489929 (ListLongMap!10366 Nil!17424))))

(declare-fun b!880223 () Bool)

(declare-fun e!489933 () Bool)

(assert (=> b!880223 (= e!489933 (validKeyInArray!0 (select (arr!24635 _keys!868) from!1053)))))

(assert (=> b!880223 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!880224 () Bool)

(assert (=> b!880224 (= e!489930 e!489934)))

(assert (=> b!880224 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25076 _keys!868)))))

(declare-fun res!597767 () Bool)

(assert (=> b!880224 (= res!597767 (contains!4229 lt!397909 (select (arr!24635 _keys!868) from!1053)))))

(assert (=> b!880224 (=> (not res!597767) (not e!489934))))

(declare-fun b!880225 () Bool)

(declare-fun lt!397907 () Unit!30004)

(declare-fun lt!397906 () Unit!30004)

(assert (=> b!880225 (= lt!397907 lt!397906)))

(declare-fun lt!397908 () (_ BitVec 64))

(declare-fun lt!397904 () V!28425)

(declare-fun lt!397905 () ListLongMap!10365)

(declare-fun lt!397903 () (_ BitVec 64))

(assert (=> b!880225 (not (contains!4229 (+!2516 lt!397905 (tuple2!11595 lt!397908 lt!397904)) lt!397903))))

(declare-fun addStillNotContains!205 (ListLongMap!10365 (_ BitVec 64) V!28425 (_ BitVec 64)) Unit!30004)

(assert (=> b!880225 (= lt!397906 (addStillNotContains!205 lt!397905 lt!397908 lt!397904 lt!397903))))

(assert (=> b!880225 (= lt!397903 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880225 (= lt!397904 (get!12963 (select (arr!24636 lt!397820) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880225 (= lt!397908 (select (arr!24635 _keys!868) from!1053))))

(assert (=> b!880225 (= lt!397905 call!38905)))

(declare-fun e!489932 () ListLongMap!10365)

(assert (=> b!880225 (= e!489932 (+!2516 call!38905 (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 lt!397820) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880226 () Bool)

(assert (=> b!880226 (= e!489931 e!489930)))

(declare-fun c!93083 () Bool)

(assert (=> b!880226 (= c!93083 e!489933)))

(declare-fun res!597769 () Bool)

(assert (=> b!880226 (=> (not res!597769) (not e!489933))))

(assert (=> b!880226 (= res!597769 (bvslt from!1053 (size!25076 _keys!868)))))

(declare-fun b!880227 () Bool)

(assert (=> b!880227 (= e!489929 e!489932)))

(declare-fun c!93085 () Bool)

(assert (=> b!880227 (= c!93085 (validKeyInArray!0 (select (arr!24635 _keys!868) from!1053)))))

(declare-fun b!880228 () Bool)

(declare-fun isEmpty!671 (ListLongMap!10365) Bool)

(assert (=> b!880228 (= e!489928 (isEmpty!671 lt!397909))))

(declare-fun b!880229 () Bool)

(assert (=> b!880229 (= e!489932 call!38905)))

(declare-fun b!880230 () Bool)

(declare-fun res!597768 () Bool)

(assert (=> b!880230 (=> (not res!597768) (not e!489931))))

(assert (=> b!880230 (= res!597768 (not (contains!4229 lt!397909 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109223 c!93084) b!880222))

(assert (= (and d!109223 (not c!93084)) b!880227))

(assert (= (and b!880227 c!93085) b!880225))

(assert (= (and b!880227 (not c!93085)) b!880229))

(assert (= (or b!880225 b!880229) bm!38902))

(assert (= (and d!109223 res!597766) b!880230))

(assert (= (and b!880230 res!597768) b!880226))

(assert (= (and b!880226 res!597769) b!880223))

(assert (= (and b!880226 c!93083) b!880224))

(assert (= (and b!880226 (not c!93083)) b!880219))

(assert (= (and b!880224 res!597767) b!880221))

(assert (= (and b!880219 c!93086) b!880220))

(assert (= (and b!880219 (not c!93086)) b!880228))

(declare-fun b_lambda!12351 () Bool)

(assert (=> (not b_lambda!12351) (not b!880221)))

(assert (=> b!880221 t!24509))

(declare-fun b_and!25187 () Bool)

(assert (= b_and!25177 (and (=> t!24509 result!9507) b_and!25187)))

(declare-fun b_lambda!12353 () Bool)

(assert (=> (not b_lambda!12353) (not b!880225)))

(assert (=> b!880225 t!24509))

(declare-fun b_and!25189 () Bool)

(assert (= b_and!25187 (and (=> t!24509 result!9507) b_and!25189)))

(declare-fun m!820333 () Bool)

(assert (=> b!880220 m!820333))

(declare-fun m!820335 () Bool)

(assert (=> b!880230 m!820335))

(assert (=> b!880227 m!820191))

(assert (=> b!880227 m!820191))

(assert (=> b!880227 m!820203))

(assert (=> bm!38902 m!820333))

(assert (=> b!880225 m!820187))

(assert (=> b!880225 m!820191))

(declare-fun m!820337 () Bool)

(assert (=> b!880225 m!820337))

(declare-fun m!820339 () Bool)

(assert (=> b!880225 m!820339))

(declare-fun m!820341 () Bool)

(assert (=> b!880225 m!820341))

(declare-fun m!820343 () Bool)

(assert (=> b!880225 m!820343))

(declare-fun m!820345 () Bool)

(assert (=> b!880225 m!820345))

(assert (=> b!880225 m!820345))

(assert (=> b!880225 m!820187))

(declare-fun m!820347 () Bool)

(assert (=> b!880225 m!820347))

(assert (=> b!880225 m!820341))

(declare-fun m!820349 () Bool)

(assert (=> b!880228 m!820349))

(declare-fun m!820351 () Bool)

(assert (=> d!109223 m!820351))

(assert (=> d!109223 m!820211))

(assert (=> b!880223 m!820191))

(assert (=> b!880223 m!820191))

(assert (=> b!880223 m!820203))

(assert (=> b!880224 m!820191))

(assert (=> b!880224 m!820191))

(declare-fun m!820353 () Bool)

(assert (=> b!880224 m!820353))

(assert (=> b!880221 m!820187))

(assert (=> b!880221 m!820191))

(declare-fun m!820355 () Bool)

(assert (=> b!880221 m!820355))

(assert (=> b!880221 m!820191))

(assert (=> b!880221 m!820345))

(assert (=> b!880221 m!820345))

(assert (=> b!880221 m!820187))

(assert (=> b!880221 m!820347))

(assert (=> b!880086 d!109223))

(declare-fun b!880231 () Bool)

(declare-fun e!489937 () Bool)

(declare-fun e!489935 () Bool)

(assert (=> b!880231 (= e!489937 e!489935)))

(declare-fun c!93090 () Bool)

(assert (=> b!880231 (= c!93090 (bvslt from!1053 (size!25076 _keys!868)))))

(declare-fun bm!38903 () Bool)

(declare-fun call!38906 () ListLongMap!10365)

(assert (=> bm!38903 (= call!38906 (getCurrentListMapNoExtraKeys!3240 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109225 () Bool)

(declare-fun e!489938 () Bool)

(assert (=> d!109225 e!489938))

(declare-fun res!597770 () Bool)

(assert (=> d!109225 (=> (not res!597770) (not e!489938))))

(declare-fun lt!397916 () ListLongMap!10365)

(assert (=> d!109225 (= res!597770 (not (contains!4229 lt!397916 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!489936 () ListLongMap!10365)

(assert (=> d!109225 (= lt!397916 e!489936)))

(declare-fun c!93088 () Bool)

(assert (=> d!109225 (= c!93088 (bvsge from!1053 (size!25076 _keys!868)))))

(assert (=> d!109225 (validMask!0 mask!1196)))

(assert (=> d!109225 (= (getCurrentListMapNoExtraKeys!3240 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!397916)))

(declare-fun b!880232 () Bool)

(assert (=> b!880232 (= e!489935 (= lt!397916 (getCurrentListMapNoExtraKeys!3240 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!880233 () Bool)

(assert (=> b!880233 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25076 _keys!868)))))

(assert (=> b!880233 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25077 _values!688)))))

(declare-fun e!489941 () Bool)

(assert (=> b!880233 (= e!489941 (= (apply!378 lt!397916 (select (arr!24635 _keys!868) from!1053)) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!880234 () Bool)

(assert (=> b!880234 (= e!489936 (ListLongMap!10366 Nil!17424))))

(declare-fun b!880235 () Bool)

(declare-fun e!489940 () Bool)

(assert (=> b!880235 (= e!489940 (validKeyInArray!0 (select (arr!24635 _keys!868) from!1053)))))

(assert (=> b!880235 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!880236 () Bool)

(assert (=> b!880236 (= e!489937 e!489941)))

(assert (=> b!880236 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25076 _keys!868)))))

(declare-fun res!597771 () Bool)

(assert (=> b!880236 (= res!597771 (contains!4229 lt!397916 (select (arr!24635 _keys!868) from!1053)))))

(assert (=> b!880236 (=> (not res!597771) (not e!489941))))

(declare-fun b!880237 () Bool)

(declare-fun lt!397914 () Unit!30004)

(declare-fun lt!397913 () Unit!30004)

(assert (=> b!880237 (= lt!397914 lt!397913)))

(declare-fun lt!397911 () V!28425)

(declare-fun lt!397910 () (_ BitVec 64))

(declare-fun lt!397915 () (_ BitVec 64))

(declare-fun lt!397912 () ListLongMap!10365)

(assert (=> b!880237 (not (contains!4229 (+!2516 lt!397912 (tuple2!11595 lt!397915 lt!397911)) lt!397910))))

(assert (=> b!880237 (= lt!397913 (addStillNotContains!205 lt!397912 lt!397915 lt!397911 lt!397910))))

(assert (=> b!880237 (= lt!397910 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880237 (= lt!397911 (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880237 (= lt!397915 (select (arr!24635 _keys!868) from!1053))))

(assert (=> b!880237 (= lt!397912 call!38906)))

(declare-fun e!489939 () ListLongMap!10365)

(assert (=> b!880237 (= e!489939 (+!2516 call!38906 (tuple2!11595 (select (arr!24635 _keys!868) from!1053) (get!12963 (select (arr!24636 _values!688) from!1053) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880238 () Bool)

(assert (=> b!880238 (= e!489938 e!489937)))

(declare-fun c!93087 () Bool)

(assert (=> b!880238 (= c!93087 e!489940)))

(declare-fun res!597773 () Bool)

(assert (=> b!880238 (=> (not res!597773) (not e!489940))))

(assert (=> b!880238 (= res!597773 (bvslt from!1053 (size!25076 _keys!868)))))

(declare-fun b!880239 () Bool)

(assert (=> b!880239 (= e!489936 e!489939)))

(declare-fun c!93089 () Bool)

(assert (=> b!880239 (= c!93089 (validKeyInArray!0 (select (arr!24635 _keys!868) from!1053)))))

(declare-fun b!880240 () Bool)

(assert (=> b!880240 (= e!489935 (isEmpty!671 lt!397916))))

(declare-fun b!880241 () Bool)

(assert (=> b!880241 (= e!489939 call!38906)))

(declare-fun b!880242 () Bool)

(declare-fun res!597772 () Bool)

(assert (=> b!880242 (=> (not res!597772) (not e!489938))))

(assert (=> b!880242 (= res!597772 (not (contains!4229 lt!397916 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109225 c!93088) b!880234))

(assert (= (and d!109225 (not c!93088)) b!880239))

(assert (= (and b!880239 c!93089) b!880237))

(assert (= (and b!880239 (not c!93089)) b!880241))

(assert (= (or b!880237 b!880241) bm!38903))

(assert (= (and d!109225 res!597770) b!880242))

(assert (= (and b!880242 res!597772) b!880238))

(assert (= (and b!880238 res!597773) b!880235))

(assert (= (and b!880238 c!93087) b!880236))

(assert (= (and b!880238 (not c!93087)) b!880231))

(assert (= (and b!880236 res!597771) b!880233))

(assert (= (and b!880231 c!93090) b!880232))

(assert (= (and b!880231 (not c!93090)) b!880240))

(declare-fun b_lambda!12355 () Bool)

(assert (=> (not b_lambda!12355) (not b!880233)))

(assert (=> b!880233 t!24509))

(declare-fun b_and!25191 () Bool)

(assert (= b_and!25189 (and (=> t!24509 result!9507) b_and!25191)))

(declare-fun b_lambda!12357 () Bool)

(assert (=> (not b_lambda!12357) (not b!880237)))

(assert (=> b!880237 t!24509))

(declare-fun b_and!25193 () Bool)

(assert (= b_and!25191 (and (=> t!24509 result!9507) b_and!25193)))

(declare-fun m!820357 () Bool)

(assert (=> b!880232 m!820357))

(declare-fun m!820359 () Bool)

(assert (=> b!880242 m!820359))

(assert (=> b!880239 m!820191))

(assert (=> b!880239 m!820191))

(assert (=> b!880239 m!820203))

(assert (=> bm!38903 m!820357))

(assert (=> b!880237 m!820187))

(assert (=> b!880237 m!820191))

(declare-fun m!820361 () Bool)

(assert (=> b!880237 m!820361))

(declare-fun m!820363 () Bool)

(assert (=> b!880237 m!820363))

(declare-fun m!820365 () Bool)

(assert (=> b!880237 m!820365))

(declare-fun m!820367 () Bool)

(assert (=> b!880237 m!820367))

(assert (=> b!880237 m!820185))

(assert (=> b!880237 m!820185))

(assert (=> b!880237 m!820187))

(assert (=> b!880237 m!820189))

(assert (=> b!880237 m!820365))

(declare-fun m!820369 () Bool)

(assert (=> b!880240 m!820369))

(declare-fun m!820371 () Bool)

(assert (=> d!109225 m!820371))

(assert (=> d!109225 m!820211))

(assert (=> b!880235 m!820191))

(assert (=> b!880235 m!820191))

(assert (=> b!880235 m!820203))

(assert (=> b!880236 m!820191))

(assert (=> b!880236 m!820191))

(declare-fun m!820373 () Bool)

(assert (=> b!880236 m!820373))

(assert (=> b!880233 m!820187))

(assert (=> b!880233 m!820191))

(declare-fun m!820375 () Bool)

(assert (=> b!880233 m!820375))

(assert (=> b!880233 m!820191))

(assert (=> b!880233 m!820185))

(assert (=> b!880233 m!820185))

(assert (=> b!880233 m!820187))

(assert (=> b!880233 m!820189))

(assert (=> b!880086 d!109225))

(declare-fun d!109227 () Bool)

(assert (=> d!109227 (= (array_inv!19448 _keys!868) (bvsge (size!25076 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74768 d!109227))

(declare-fun d!109229 () Bool)

(assert (=> d!109229 (= (array_inv!19449 _values!688) (bvsge (size!25077 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74768 d!109229))

(declare-fun d!109231 () Bool)

(assert (=> d!109231 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!880079 d!109231))

(declare-fun b!880253 () Bool)

(declare-fun e!489952 () Bool)

(declare-fun call!38909 () Bool)

(assert (=> b!880253 (= e!489952 call!38909)))

(declare-fun b!880254 () Bool)

(declare-fun e!489953 () Bool)

(assert (=> b!880254 (= e!489953 e!489952)))

(declare-fun c!93093 () Bool)

(assert (=> b!880254 (= c!93093 (validKeyInArray!0 (select (arr!24635 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!880255 () Bool)

(assert (=> b!880255 (= e!489952 call!38909)))

(declare-fun b!880256 () Bool)

(declare-fun e!489951 () Bool)

(declare-fun contains!4231 (List!17428 (_ BitVec 64)) Bool)

(assert (=> b!880256 (= e!489951 (contains!4231 Nil!17425 (select (arr!24635 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!880257 () Bool)

(declare-fun e!489950 () Bool)

(assert (=> b!880257 (= e!489950 e!489953)))

(declare-fun res!597780 () Bool)

(assert (=> b!880257 (=> (not res!597780) (not e!489953))))

(assert (=> b!880257 (= res!597780 (not e!489951))))

(declare-fun res!597782 () Bool)

(assert (=> b!880257 (=> (not res!597782) (not e!489951))))

(assert (=> b!880257 (= res!597782 (validKeyInArray!0 (select (arr!24635 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!109233 () Bool)

(declare-fun res!597781 () Bool)

(assert (=> d!109233 (=> res!597781 e!489950)))

(assert (=> d!109233 (= res!597781 (bvsge #b00000000000000000000000000000000 (size!25076 _keys!868)))))

(assert (=> d!109233 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17425) e!489950)))

(declare-fun bm!38906 () Bool)

(assert (=> bm!38906 (= call!38909 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93093 (Cons!17424 (select (arr!24635 _keys!868) #b00000000000000000000000000000000) Nil!17425) Nil!17425)))))

(assert (= (and d!109233 (not res!597781)) b!880257))

(assert (= (and b!880257 res!597782) b!880256))

(assert (= (and b!880257 res!597780) b!880254))

(assert (= (and b!880254 c!93093) b!880253))

(assert (= (and b!880254 (not c!93093)) b!880255))

(assert (= (or b!880253 b!880255) bm!38906))

(assert (=> b!880254 m!820321))

(assert (=> b!880254 m!820321))

(assert (=> b!880254 m!820323))

(assert (=> b!880256 m!820321))

(assert (=> b!880256 m!820321))

(declare-fun m!820377 () Bool)

(assert (=> b!880256 m!820377))

(assert (=> b!880257 m!820321))

(assert (=> b!880257 m!820321))

(assert (=> b!880257 m!820323))

(assert (=> bm!38906 m!820321))

(declare-fun m!820379 () Bool)

(assert (=> bm!38906 m!820379))

(assert (=> b!880084 d!109233))

(declare-fun b!880258 () Bool)

(declare-fun e!489956 () Bool)

(declare-fun e!489954 () Bool)

(assert (=> b!880258 (= e!489956 e!489954)))

(declare-fun c!93097 () Bool)

(assert (=> b!880258 (= c!93097 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(declare-fun call!38910 () ListLongMap!10365)

(declare-fun bm!38907 () Bool)

(assert (=> bm!38907 (= call!38910 (getCurrentListMapNoExtraKeys!3240 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109235 () Bool)

(declare-fun e!489957 () Bool)

(assert (=> d!109235 e!489957))

(declare-fun res!597783 () Bool)

(assert (=> d!109235 (=> (not res!597783) (not e!489957))))

(declare-fun lt!397923 () ListLongMap!10365)

(assert (=> d!109235 (= res!597783 (not (contains!4229 lt!397923 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!489955 () ListLongMap!10365)

(assert (=> d!109235 (= lt!397923 e!489955)))

(declare-fun c!93095 () Bool)

(assert (=> d!109235 (= c!93095 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(assert (=> d!109235 (validMask!0 mask!1196)))

(assert (=> d!109235 (= (getCurrentListMapNoExtraKeys!3240 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397923)))

(declare-fun b!880259 () Bool)

(assert (=> b!880259 (= e!489954 (= lt!397923 (getCurrentListMapNoExtraKeys!3240 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!880260 () Bool)

(assert (=> b!880260 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(assert (=> b!880260 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25077 _values!688)))))

(declare-fun e!489960 () Bool)

(assert (=> b!880260 (= e!489960 (= (apply!378 lt!397923 (select (arr!24635 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12963 (select (arr!24636 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!880261 () Bool)

(assert (=> b!880261 (= e!489955 (ListLongMap!10366 Nil!17424))))

(declare-fun b!880262 () Bool)

(declare-fun e!489959 () Bool)

(assert (=> b!880262 (= e!489959 (validKeyInArray!0 (select (arr!24635 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880262 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!880263 () Bool)

(assert (=> b!880263 (= e!489956 e!489960)))

(assert (=> b!880263 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(declare-fun res!597784 () Bool)

(assert (=> b!880263 (= res!597784 (contains!4229 lt!397923 (select (arr!24635 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880263 (=> (not res!597784) (not e!489960))))

(declare-fun b!880264 () Bool)

(declare-fun lt!397921 () Unit!30004)

(declare-fun lt!397920 () Unit!30004)

(assert (=> b!880264 (= lt!397921 lt!397920)))

(declare-fun lt!397918 () V!28425)

(declare-fun lt!397922 () (_ BitVec 64))

(declare-fun lt!397917 () (_ BitVec 64))

(declare-fun lt!397919 () ListLongMap!10365)

(assert (=> b!880264 (not (contains!4229 (+!2516 lt!397919 (tuple2!11595 lt!397922 lt!397918)) lt!397917))))

(assert (=> b!880264 (= lt!397920 (addStillNotContains!205 lt!397919 lt!397922 lt!397918 lt!397917))))

(assert (=> b!880264 (= lt!397917 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880264 (= lt!397918 (get!12963 (select (arr!24636 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880264 (= lt!397922 (select (arr!24635 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!880264 (= lt!397919 call!38910)))

(declare-fun e!489958 () ListLongMap!10365)

(assert (=> b!880264 (= e!489958 (+!2516 call!38910 (tuple2!11595 (select (arr!24635 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12963 (select (arr!24636 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880265 () Bool)

(assert (=> b!880265 (= e!489957 e!489956)))

(declare-fun c!93094 () Bool)

(assert (=> b!880265 (= c!93094 e!489959)))

(declare-fun res!597786 () Bool)

(assert (=> b!880265 (=> (not res!597786) (not e!489959))))

(assert (=> b!880265 (= res!597786 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(declare-fun b!880266 () Bool)

(assert (=> b!880266 (= e!489955 e!489958)))

(declare-fun c!93096 () Bool)

(assert (=> b!880266 (= c!93096 (validKeyInArray!0 (select (arr!24635 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!880267 () Bool)

(assert (=> b!880267 (= e!489954 (isEmpty!671 lt!397923))))

(declare-fun b!880268 () Bool)

(assert (=> b!880268 (= e!489958 call!38910)))

(declare-fun b!880269 () Bool)

(declare-fun res!597785 () Bool)

(assert (=> b!880269 (=> (not res!597785) (not e!489957))))

(assert (=> b!880269 (= res!597785 (not (contains!4229 lt!397923 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109235 c!93095) b!880261))

(assert (= (and d!109235 (not c!93095)) b!880266))

(assert (= (and b!880266 c!93096) b!880264))

(assert (= (and b!880266 (not c!93096)) b!880268))

(assert (= (or b!880264 b!880268) bm!38907))

(assert (= (and d!109235 res!597783) b!880269))

(assert (= (and b!880269 res!597785) b!880265))

(assert (= (and b!880265 res!597786) b!880262))

(assert (= (and b!880265 c!93094) b!880263))

(assert (= (and b!880265 (not c!93094)) b!880258))

(assert (= (and b!880263 res!597784) b!880260))

(assert (= (and b!880258 c!93097) b!880259))

(assert (= (and b!880258 (not c!93097)) b!880267))

(declare-fun b_lambda!12359 () Bool)

(assert (=> (not b_lambda!12359) (not b!880260)))

(assert (=> b!880260 t!24509))

(declare-fun b_and!25195 () Bool)

(assert (= b_and!25193 (and (=> t!24509 result!9507) b_and!25195)))

(declare-fun b_lambda!12361 () Bool)

(assert (=> (not b_lambda!12361) (not b!880264)))

(assert (=> b!880264 t!24509))

(declare-fun b_and!25197 () Bool)

(assert (= b_and!25195 (and (=> t!24509 result!9507) b_and!25197)))

(declare-fun m!820381 () Bool)

(assert (=> b!880259 m!820381))

(declare-fun m!820383 () Bool)

(assert (=> b!880269 m!820383))

(declare-fun m!820385 () Bool)

(assert (=> b!880266 m!820385))

(assert (=> b!880266 m!820385))

(declare-fun m!820387 () Bool)

(assert (=> b!880266 m!820387))

(assert (=> bm!38907 m!820381))

(assert (=> b!880264 m!820187))

(assert (=> b!880264 m!820385))

(declare-fun m!820389 () Bool)

(assert (=> b!880264 m!820389))

(declare-fun m!820391 () Bool)

(assert (=> b!880264 m!820391))

(declare-fun m!820393 () Bool)

(assert (=> b!880264 m!820393))

(declare-fun m!820395 () Bool)

(assert (=> b!880264 m!820395))

(declare-fun m!820397 () Bool)

(assert (=> b!880264 m!820397))

(assert (=> b!880264 m!820397))

(assert (=> b!880264 m!820187))

(declare-fun m!820399 () Bool)

(assert (=> b!880264 m!820399))

(assert (=> b!880264 m!820393))

(declare-fun m!820401 () Bool)

(assert (=> b!880267 m!820401))

(declare-fun m!820403 () Bool)

(assert (=> d!109235 m!820403))

(assert (=> d!109235 m!820211))

(assert (=> b!880262 m!820385))

(assert (=> b!880262 m!820385))

(assert (=> b!880262 m!820387))

(assert (=> b!880263 m!820385))

(assert (=> b!880263 m!820385))

(declare-fun m!820405 () Bool)

(assert (=> b!880263 m!820405))

(assert (=> b!880260 m!820187))

(assert (=> b!880260 m!820385))

(declare-fun m!820407 () Bool)

(assert (=> b!880260 m!820407))

(assert (=> b!880260 m!820385))

(assert (=> b!880260 m!820397))

(assert (=> b!880260 m!820397))

(assert (=> b!880260 m!820187))

(assert (=> b!880260 m!820399))

(assert (=> b!880074 d!109235))

(declare-fun b!880270 () Bool)

(declare-fun e!489963 () Bool)

(declare-fun e!489961 () Bool)

(assert (=> b!880270 (= e!489963 e!489961)))

(declare-fun c!93101 () Bool)

(assert (=> b!880270 (= c!93101 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(declare-fun bm!38908 () Bool)

(declare-fun call!38911 () ListLongMap!10365)

(assert (=> bm!38908 (= call!38911 (getCurrentListMapNoExtraKeys!3240 _keys!868 lt!397820 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun d!109237 () Bool)

(declare-fun e!489964 () Bool)

(assert (=> d!109237 e!489964))

(declare-fun res!597787 () Bool)

(assert (=> d!109237 (=> (not res!597787) (not e!489964))))

(declare-fun lt!397930 () ListLongMap!10365)

(assert (=> d!109237 (= res!597787 (not (contains!4229 lt!397930 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!489962 () ListLongMap!10365)

(assert (=> d!109237 (= lt!397930 e!489962)))

(declare-fun c!93099 () Bool)

(assert (=> d!109237 (= c!93099 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(assert (=> d!109237 (validMask!0 mask!1196)))

(assert (=> d!109237 (= (getCurrentListMapNoExtraKeys!3240 _keys!868 lt!397820 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397930)))

(declare-fun b!880271 () Bool)

(assert (=> b!880271 (= e!489961 (= lt!397930 (getCurrentListMapNoExtraKeys!3240 _keys!868 lt!397820 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!880272 () Bool)

(assert (=> b!880272 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(assert (=> b!880272 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25077 lt!397820)))))

(declare-fun e!489967 () Bool)

(assert (=> b!880272 (= e!489967 (= (apply!378 lt!397930 (select (arr!24635 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12963 (select (arr!24636 lt!397820) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!880273 () Bool)

(assert (=> b!880273 (= e!489962 (ListLongMap!10366 Nil!17424))))

(declare-fun b!880274 () Bool)

(declare-fun e!489966 () Bool)

(assert (=> b!880274 (= e!489966 (validKeyInArray!0 (select (arr!24635 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880274 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!880275 () Bool)

(assert (=> b!880275 (= e!489963 e!489967)))

(assert (=> b!880275 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(declare-fun res!597788 () Bool)

(assert (=> b!880275 (= res!597788 (contains!4229 lt!397930 (select (arr!24635 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880275 (=> (not res!597788) (not e!489967))))

(declare-fun b!880276 () Bool)

(declare-fun lt!397928 () Unit!30004)

(declare-fun lt!397927 () Unit!30004)

(assert (=> b!880276 (= lt!397928 lt!397927)))

(declare-fun lt!397929 () (_ BitVec 64))

(declare-fun lt!397925 () V!28425)

(declare-fun lt!397926 () ListLongMap!10365)

(declare-fun lt!397924 () (_ BitVec 64))

(assert (=> b!880276 (not (contains!4229 (+!2516 lt!397926 (tuple2!11595 lt!397929 lt!397925)) lt!397924))))

(assert (=> b!880276 (= lt!397927 (addStillNotContains!205 lt!397926 lt!397929 lt!397925 lt!397924))))

(assert (=> b!880276 (= lt!397924 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880276 (= lt!397925 (get!12963 (select (arr!24636 lt!397820) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880276 (= lt!397929 (select (arr!24635 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!880276 (= lt!397926 call!38911)))

(declare-fun e!489965 () ListLongMap!10365)

(assert (=> b!880276 (= e!489965 (+!2516 call!38911 (tuple2!11595 (select (arr!24635 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12963 (select (arr!24636 lt!397820) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1242 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880277 () Bool)

(assert (=> b!880277 (= e!489964 e!489963)))

(declare-fun c!93098 () Bool)

(assert (=> b!880277 (= c!93098 e!489966)))

(declare-fun res!597790 () Bool)

(assert (=> b!880277 (=> (not res!597790) (not e!489966))))

(assert (=> b!880277 (= res!597790 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(declare-fun b!880278 () Bool)

(assert (=> b!880278 (= e!489962 e!489965)))

(declare-fun c!93100 () Bool)

(assert (=> b!880278 (= c!93100 (validKeyInArray!0 (select (arr!24635 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!880279 () Bool)

(assert (=> b!880279 (= e!489961 (isEmpty!671 lt!397930))))

(declare-fun b!880280 () Bool)

(assert (=> b!880280 (= e!489965 call!38911)))

(declare-fun b!880281 () Bool)

(declare-fun res!597789 () Bool)

(assert (=> b!880281 (=> (not res!597789) (not e!489964))))

(assert (=> b!880281 (= res!597789 (not (contains!4229 lt!397930 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109237 c!93099) b!880273))

(assert (= (and d!109237 (not c!93099)) b!880278))

(assert (= (and b!880278 c!93100) b!880276))

(assert (= (and b!880278 (not c!93100)) b!880280))

(assert (= (or b!880276 b!880280) bm!38908))

(assert (= (and d!109237 res!597787) b!880281))

(assert (= (and b!880281 res!597789) b!880277))

(assert (= (and b!880277 res!597790) b!880274))

(assert (= (and b!880277 c!93098) b!880275))

(assert (= (and b!880277 (not c!93098)) b!880270))

(assert (= (and b!880275 res!597788) b!880272))

(assert (= (and b!880270 c!93101) b!880271))

(assert (= (and b!880270 (not c!93101)) b!880279))

(declare-fun b_lambda!12363 () Bool)

(assert (=> (not b_lambda!12363) (not b!880272)))

(assert (=> b!880272 t!24509))

(declare-fun b_and!25199 () Bool)

(assert (= b_and!25197 (and (=> t!24509 result!9507) b_and!25199)))

(declare-fun b_lambda!12365 () Bool)

(assert (=> (not b_lambda!12365) (not b!880276)))

(assert (=> b!880276 t!24509))

(declare-fun b_and!25201 () Bool)

(assert (= b_and!25199 (and (=> t!24509 result!9507) b_and!25201)))

(declare-fun m!820409 () Bool)

(assert (=> b!880271 m!820409))

(declare-fun m!820411 () Bool)

(assert (=> b!880281 m!820411))

(assert (=> b!880278 m!820385))

(assert (=> b!880278 m!820385))

(assert (=> b!880278 m!820387))

(assert (=> bm!38908 m!820409))

(assert (=> b!880276 m!820187))

(assert (=> b!880276 m!820385))

(declare-fun m!820413 () Bool)

(assert (=> b!880276 m!820413))

(declare-fun m!820415 () Bool)

(assert (=> b!880276 m!820415))

(declare-fun m!820417 () Bool)

(assert (=> b!880276 m!820417))

(declare-fun m!820419 () Bool)

(assert (=> b!880276 m!820419))

(declare-fun m!820421 () Bool)

(assert (=> b!880276 m!820421))

(assert (=> b!880276 m!820421))

(assert (=> b!880276 m!820187))

(declare-fun m!820423 () Bool)

(assert (=> b!880276 m!820423))

(assert (=> b!880276 m!820417))

(declare-fun m!820425 () Bool)

(assert (=> b!880279 m!820425))

(declare-fun m!820427 () Bool)

(assert (=> d!109237 m!820427))

(assert (=> d!109237 m!820211))

(assert (=> b!880274 m!820385))

(assert (=> b!880274 m!820385))

(assert (=> b!880274 m!820387))

(assert (=> b!880275 m!820385))

(assert (=> b!880275 m!820385))

(declare-fun m!820429 () Bool)

(assert (=> b!880275 m!820429))

(assert (=> b!880272 m!820187))

(assert (=> b!880272 m!820385))

(declare-fun m!820431 () Bool)

(assert (=> b!880272 m!820431))

(assert (=> b!880272 m!820385))

(assert (=> b!880272 m!820421))

(assert (=> b!880272 m!820421))

(assert (=> b!880272 m!820187))

(assert (=> b!880272 m!820423))

(assert (=> b!880074 d!109237))

(declare-fun d!109239 () Bool)

(declare-fun e!489968 () Bool)

(assert (=> d!109239 e!489968))

(declare-fun res!597791 () Bool)

(assert (=> d!109239 (=> (not res!597791) (not e!489968))))

(declare-fun lt!397933 () ListLongMap!10365)

(assert (=> d!109239 (= res!597791 (contains!4229 lt!397933 (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun lt!397931 () List!17427)

(assert (=> d!109239 (= lt!397933 (ListLongMap!10366 lt!397931))))

(declare-fun lt!397934 () Unit!30004)

(declare-fun lt!397932 () Unit!30004)

(assert (=> d!109239 (= lt!397934 lt!397932)))

(assert (=> d!109239 (= (getValueByKey!421 lt!397931 (_1!5808 (tuple2!11595 k0!854 v!557))) (Some!426 (_2!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!109239 (= lt!397932 (lemmaContainsTupThenGetReturnValue!235 lt!397931 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!109239 (= lt!397931 (insertStrictlySorted!274 (toList!5198 lt!397819) (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!109239 (= (+!2516 lt!397819 (tuple2!11595 k0!854 v!557)) lt!397933)))

(declare-fun b!880282 () Bool)

(declare-fun res!597792 () Bool)

(assert (=> b!880282 (=> (not res!597792) (not e!489968))))

(assert (=> b!880282 (= res!597792 (= (getValueByKey!421 (toList!5198 lt!397933) (_1!5808 (tuple2!11595 k0!854 v!557))) (Some!426 (_2!5808 (tuple2!11595 k0!854 v!557)))))))

(declare-fun b!880283 () Bool)

(assert (=> b!880283 (= e!489968 (contains!4230 (toList!5198 lt!397933) (tuple2!11595 k0!854 v!557)))))

(assert (= (and d!109239 res!597791) b!880282))

(assert (= (and b!880282 res!597792) b!880283))

(declare-fun m!820433 () Bool)

(assert (=> d!109239 m!820433))

(declare-fun m!820435 () Bool)

(assert (=> d!109239 m!820435))

(declare-fun m!820437 () Bool)

(assert (=> d!109239 m!820437))

(declare-fun m!820439 () Bool)

(assert (=> d!109239 m!820439))

(declare-fun m!820441 () Bool)

(assert (=> b!880282 m!820441))

(declare-fun m!820443 () Bool)

(assert (=> b!880283 m!820443))

(assert (=> b!880074 d!109239))

(declare-fun d!109241 () Bool)

(assert (=> d!109241 (= (validKeyInArray!0 (select (arr!24635 _keys!868) from!1053)) (and (not (= (select (arr!24635 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24635 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!880074 d!109241))

(declare-fun call!38916 () ListLongMap!10365)

(declare-fun call!38917 () ListLongMap!10365)

(declare-fun e!489974 () Bool)

(declare-fun b!880290 () Bool)

(assert (=> b!880290 (= e!489974 (= call!38917 (+!2516 call!38916 (tuple2!11595 k0!854 v!557))))))

(declare-fun b!880291 () Bool)

(declare-fun e!489973 () Bool)

(assert (=> b!880291 (= e!489973 e!489974)))

(declare-fun c!93104 () Bool)

(assert (=> b!880291 (= c!93104 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun bm!38913 () Bool)

(assert (=> bm!38913 (= call!38916 (getCurrentListMapNoExtraKeys!3240 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880292 () Bool)

(assert (=> b!880292 (= e!489974 (= call!38917 call!38916))))

(declare-fun bm!38914 () Bool)

(assert (=> bm!38914 (= call!38917 (getCurrentListMapNoExtraKeys!3240 _keys!868 (array!51230 (store (arr!24636 _values!688) i!612 (ValueCellFull!8327 v!557)) (size!25077 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun d!109243 () Bool)

(assert (=> d!109243 e!489973))

(declare-fun res!597795 () Bool)

(assert (=> d!109243 (=> (not res!597795) (not e!489973))))

(assert (=> d!109243 (= res!597795 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25077 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25077 _values!688))))))))

(declare-fun lt!397937 () Unit!30004)

(declare-fun choose!1440 (array!51227 array!51229 (_ BitVec 32) (_ BitVec 32) V!28425 V!28425 (_ BitVec 32) (_ BitVec 64) V!28425 (_ BitVec 32) Int) Unit!30004)

(assert (=> d!109243 (= lt!397937 (choose!1440 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109243 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(assert (=> d!109243 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!684 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397937)))

(assert (= (and d!109243 res!597795) b!880291))

(assert (= (and b!880291 c!93104) b!880290))

(assert (= (and b!880291 (not c!93104)) b!880292))

(assert (= (or b!880290 b!880292) bm!38913))

(assert (= (or b!880290 b!880292) bm!38914))

(declare-fun m!820445 () Bool)

(assert (=> b!880290 m!820445))

(assert (=> bm!38913 m!820199))

(assert (=> bm!38914 m!820215))

(declare-fun m!820447 () Bool)

(assert (=> bm!38914 m!820447))

(declare-fun m!820449 () Bool)

(assert (=> d!109243 m!820449))

(assert (=> b!880074 d!109243))

(declare-fun d!109245 () Bool)

(assert (=> d!109245 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!880075 d!109245))

(declare-fun b!880300 () Bool)

(declare-fun e!489980 () Bool)

(assert (=> b!880300 (= e!489980 tp_is_empty!17533)))

(declare-fun b!880299 () Bool)

(declare-fun e!489979 () Bool)

(assert (=> b!880299 (= e!489979 tp_is_empty!17533)))

(declare-fun mapIsEmpty!27924 () Bool)

(declare-fun mapRes!27924 () Bool)

(assert (=> mapIsEmpty!27924 mapRes!27924))

(declare-fun condMapEmpty!27924 () Bool)

(declare-fun mapDefault!27924 () ValueCell!8327)

(assert (=> mapNonEmpty!27915 (= condMapEmpty!27924 (= mapRest!27915 ((as const (Array (_ BitVec 32) ValueCell!8327)) mapDefault!27924)))))

(assert (=> mapNonEmpty!27915 (= tp!53549 (and e!489980 mapRes!27924))))

(declare-fun mapNonEmpty!27924 () Bool)

(declare-fun tp!53565 () Bool)

(assert (=> mapNonEmpty!27924 (= mapRes!27924 (and tp!53565 e!489979))))

(declare-fun mapKey!27924 () (_ BitVec 32))

(declare-fun mapValue!27924 () ValueCell!8327)

(declare-fun mapRest!27924 () (Array (_ BitVec 32) ValueCell!8327))

(assert (=> mapNonEmpty!27924 (= mapRest!27915 (store mapRest!27924 mapKey!27924 mapValue!27924))))

(assert (= (and mapNonEmpty!27915 condMapEmpty!27924) mapIsEmpty!27924))

(assert (= (and mapNonEmpty!27915 (not condMapEmpty!27924)) mapNonEmpty!27924))

(assert (= (and mapNonEmpty!27924 ((_ is ValueCellFull!8327) mapValue!27924)) b!880299))

(assert (= (and mapNonEmpty!27915 ((_ is ValueCellFull!8327) mapDefault!27924)) b!880300))

(declare-fun m!820451 () Bool)

(assert (=> mapNonEmpty!27924 m!820451))

(declare-fun b_lambda!12367 () Bool)

(assert (= b_lambda!12357 (or (and start!74768 b_free!15289) b_lambda!12367)))

(declare-fun b_lambda!12369 () Bool)

(assert (= b_lambda!12361 (or (and start!74768 b_free!15289) b_lambda!12369)))

(declare-fun b_lambda!12371 () Bool)

(assert (= b_lambda!12363 (or (and start!74768 b_free!15289) b_lambda!12371)))

(declare-fun b_lambda!12373 () Bool)

(assert (= b_lambda!12353 (or (and start!74768 b_free!15289) b_lambda!12373)))

(declare-fun b_lambda!12375 () Bool)

(assert (= b_lambda!12355 (or (and start!74768 b_free!15289) b_lambda!12375)))

(declare-fun b_lambda!12377 () Bool)

(assert (= b_lambda!12351 (or (and start!74768 b_free!15289) b_lambda!12377)))

(declare-fun b_lambda!12379 () Bool)

(assert (= b_lambda!12365 (or (and start!74768 b_free!15289) b_lambda!12379)))

(declare-fun b_lambda!12381 () Bool)

(assert (= b_lambda!12359 (or (and start!74768 b_free!15289) b_lambda!12381)))

(check-sat (not b!880237) (not b!880266) (not b!880290) (not b!880267) (not d!109239) (not b!880279) (not b!880232) (not b!880262) (not b!880239) (not bm!38902) tp_is_empty!17533 (not b!880278) (not b_lambda!12381) (not b!880242) (not b_lambda!12371) (not b_next!15289) (not b!880221) (not d!109223) (not b!880264) (not b!880224) (not d!109243) (not b!880236) (not d!109225) (not b!880257) (not b!880269) (not b!880263) (not bm!38906) (not b!880275) (not bm!38913) (not b!880225) (not b!880254) (not b!880228) (not bm!38903) (not d!109235) (not b!880194) (not b!880223) (not b!880235) (not b!880176) (not b_lambda!12377) (not b!880282) (not bm!38908) (not b_lambda!12369) (not b!880276) (not mapNonEmpty!27924) (not bm!38899) (not b!880181) (not b_lambda!12367) (not b_lambda!12349) (not b!880240) b_and!25201 (not b!880175) (not b_lambda!12375) (not b_lambda!12379) (not b!880220) (not b!880260) (not b!880283) (not b!880233) (not b!880256) (not bm!38907) (not b!880192) (not b!880182) (not b!880271) (not b_lambda!12373) (not d!109237) (not b!880274) (not bm!38914) (not b!880281) (not b!880227) (not d!109217) (not b!880259) (not b!880230) (not b!880272))
(check-sat b_and!25201 (not b_next!15289))
