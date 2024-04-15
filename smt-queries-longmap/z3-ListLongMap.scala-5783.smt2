; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74582 () Bool)

(assert start!74582)

(declare-fun b_free!15289 () Bool)

(declare-fun b_next!15289 () Bool)

(assert (=> start!74582 (= b_free!15289 (not b_next!15289))))

(declare-fun tp!53549 () Bool)

(declare-fun b_and!25139 () Bool)

(assert (=> start!74582 (= tp!53549 b_and!25139)))

(declare-fun b!878932 () Bool)

(declare-fun e!489121 () Bool)

(declare-fun e!489126 () Bool)

(assert (=> b!878932 (= e!489121 e!489126)))

(declare-fun res!597231 () Bool)

(assert (=> b!878932 (=> (not res!597231) (not e!489126))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878932 (= res!597231 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!28425 0))(
  ( (V!28426 (val!8814 Int)) )
))
(declare-datatypes ((tuple2!11672 0))(
  ( (tuple2!11673 (_1!5847 (_ BitVec 64)) (_2!5847 V!28425)) )
))
(declare-datatypes ((List!17472 0))(
  ( (Nil!17469) (Cons!17468 (h!18599 tuple2!11672) (t!24554 List!17472)) )
))
(declare-datatypes ((ListLongMap!10431 0))(
  ( (ListLongMap!10432 (toList!5231 List!17472)) )
))
(declare-fun lt!397226 () ListLongMap!10431)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8327 0))(
  ( (ValueCellFull!8327 (v!11248 V!28425)) (EmptyCell!8327) )
))
(declare-datatypes ((array!51171 0))(
  ( (array!51172 (arr!24612 (Array (_ BitVec 32) ValueCell!8327)) (size!25054 (_ BitVec 32))) )
))
(declare-fun lt!397224 () array!51171)

(declare-datatypes ((array!51173 0))(
  ( (array!51174 (arr!24613 (Array (_ BitVec 32) (_ BitVec 64))) (size!25055 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51173)

(declare-fun minValue!654 () V!28425)

(declare-fun zeroValue!654 () V!28425)

(declare-fun getCurrentListMapNoExtraKeys!3224 (array!51173 array!51171 (_ BitVec 32) (_ BitVec 32) V!28425 V!28425 (_ BitVec 32) Int) ListLongMap!10431)

(assert (=> b!878932 (= lt!397226 (getCurrentListMapNoExtraKeys!3224 _keys!868 lt!397224 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28425)

(declare-fun _values!688 () array!51171)

(assert (=> b!878932 (= lt!397224 (array!51172 (store (arr!24612 _values!688) i!612 (ValueCellFull!8327 v!557)) (size!25054 _values!688)))))

(declare-fun lt!397228 () ListLongMap!10431)

(assert (=> b!878932 (= lt!397228 (getCurrentListMapNoExtraKeys!3224 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878933 () Bool)

(declare-fun res!597229 () Bool)

(assert (=> b!878933 (=> (not res!597229) (not e!489121))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!878933 (= res!597229 (and (= (select (arr!24613 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878934 () Bool)

(declare-fun res!597227 () Bool)

(assert (=> b!878934 (=> (not res!597227) (not e!489121))))

(declare-datatypes ((List!17473 0))(
  ( (Nil!17470) (Cons!17469 (h!18600 (_ BitVec 64)) (t!24555 List!17473)) )
))
(declare-fun arrayNoDuplicates!0 (array!51173 (_ BitVec 32) List!17473) Bool)

(assert (=> b!878934 (= res!597227 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17470))))

(declare-fun b!878935 () Bool)

(declare-fun e!489123 () Bool)

(assert (=> b!878935 (= e!489126 (not e!489123))))

(declare-fun res!597226 () Bool)

(assert (=> b!878935 (=> res!597226 e!489123)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878935 (= res!597226 (not (validKeyInArray!0 (select (arr!24613 _keys!868) from!1053))))))

(declare-fun lt!397222 () ListLongMap!10431)

(declare-fun lt!397223 () ListLongMap!10431)

(assert (=> b!878935 (= lt!397222 lt!397223)))

(declare-fun lt!397225 () ListLongMap!10431)

(declare-fun +!2527 (ListLongMap!10431 tuple2!11672) ListLongMap!10431)

(assert (=> b!878935 (= lt!397223 (+!2527 lt!397225 (tuple2!11673 k0!854 v!557)))))

(assert (=> b!878935 (= lt!397222 (getCurrentListMapNoExtraKeys!3224 _keys!868 lt!397224 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!878935 (= lt!397225 (getCurrentListMapNoExtraKeys!3224 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29969 0))(
  ( (Unit!29970) )
))
(declare-fun lt!397227 () Unit!29969)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!696 (array!51173 array!51171 (_ BitVec 32) (_ BitVec 32) V!28425 V!28425 (_ BitVec 32) (_ BitVec 64) V!28425 (_ BitVec 32) Int) Unit!29969)

(assert (=> b!878935 (= lt!397227 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!696 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!878936 () Bool)

(declare-fun res!597224 () Bool)

(assert (=> b!878936 (=> (not res!597224) (not e!489121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878936 (= res!597224 (validMask!0 mask!1196))))

(declare-fun b!878937 () Bool)

(declare-fun res!597223 () Bool)

(assert (=> b!878937 (=> (not res!597223) (not e!489121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51173 (_ BitVec 32)) Bool)

(assert (=> b!878937 (= res!597223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27915 () Bool)

(declare-fun mapRes!27915 () Bool)

(declare-fun tp!53550 () Bool)

(declare-fun e!489125 () Bool)

(assert (=> mapNonEmpty!27915 (= mapRes!27915 (and tp!53550 e!489125))))

(declare-fun mapValue!27915 () ValueCell!8327)

(declare-fun mapRest!27915 () (Array (_ BitVec 32) ValueCell!8327))

(declare-fun mapKey!27915 () (_ BitVec 32))

(assert (=> mapNonEmpty!27915 (= (arr!24612 _values!688) (store mapRest!27915 mapKey!27915 mapValue!27915))))

(declare-fun b!878939 () Bool)

(declare-fun res!597228 () Bool)

(assert (=> b!878939 (=> (not res!597228) (not e!489121))))

(assert (=> b!878939 (= res!597228 (validKeyInArray!0 k0!854))))

(declare-fun b!878940 () Bool)

(declare-fun res!597230 () Bool)

(assert (=> b!878940 (=> (not res!597230) (not e!489121))))

(assert (=> b!878940 (= res!597230 (and (= (size!25054 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25055 _keys!868) (size!25054 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27915 () Bool)

(assert (=> mapIsEmpty!27915 mapRes!27915))

(declare-fun b!878941 () Bool)

(declare-fun tp_is_empty!17533 () Bool)

(assert (=> b!878941 (= e!489125 tp_is_empty!17533)))

(declare-fun b!878942 () Bool)

(declare-fun e!489122 () Bool)

(declare-fun e!489120 () Bool)

(assert (=> b!878942 (= e!489122 (and e!489120 mapRes!27915))))

(declare-fun condMapEmpty!27915 () Bool)

(declare-fun mapDefault!27915 () ValueCell!8327)

(assert (=> b!878942 (= condMapEmpty!27915 (= (arr!24612 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8327)) mapDefault!27915)))))

(declare-fun b!878943 () Bool)

(declare-fun res!597225 () Bool)

(assert (=> b!878943 (=> (not res!597225) (not e!489121))))

(assert (=> b!878943 (= res!597225 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25055 _keys!868))))))

(declare-fun b!878944 () Bool)

(assert (=> b!878944 (= e!489120 tp_is_empty!17533)))

(declare-fun res!597222 () Bool)

(assert (=> start!74582 (=> (not res!597222) (not e!489121))))

(assert (=> start!74582 (= res!597222 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25055 _keys!868))))))

(assert (=> start!74582 e!489121))

(assert (=> start!74582 tp_is_empty!17533))

(assert (=> start!74582 true))

(assert (=> start!74582 tp!53549))

(declare-fun array_inv!19438 (array!51173) Bool)

(assert (=> start!74582 (array_inv!19438 _keys!868)))

(declare-fun array_inv!19439 (array!51171) Bool)

(assert (=> start!74582 (and (array_inv!19439 _values!688) e!489122)))

(declare-fun b!878938 () Bool)

(declare-fun get!12940 (ValueCell!8327 V!28425) V!28425)

(declare-fun dynLambda!1222 (Int (_ BitVec 64)) V!28425)

(assert (=> b!878938 (= e!489123 (= lt!397226 (+!2527 lt!397223 (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and start!74582 res!597222) b!878936))

(assert (= (and b!878936 res!597224) b!878940))

(assert (= (and b!878940 res!597230) b!878937))

(assert (= (and b!878937 res!597223) b!878934))

(assert (= (and b!878934 res!597227) b!878943))

(assert (= (and b!878943 res!597225) b!878939))

(assert (= (and b!878939 res!597228) b!878933))

(assert (= (and b!878933 res!597229) b!878932))

(assert (= (and b!878932 res!597231) b!878935))

(assert (= (and b!878935 (not res!597226)) b!878938))

(assert (= (and b!878942 condMapEmpty!27915) mapIsEmpty!27915))

(assert (= (and b!878942 (not condMapEmpty!27915)) mapNonEmpty!27915))

(get-info :version)

(assert (= (and mapNonEmpty!27915 ((_ is ValueCellFull!8327) mapValue!27915)) b!878941))

(assert (= (and b!878942 ((_ is ValueCellFull!8327) mapDefault!27915)) b!878944))

(assert (= start!74582 b!878942))

(declare-fun b_lambda!12311 () Bool)

(assert (=> (not b_lambda!12311) (not b!878938)))

(declare-fun t!24553 () Bool)

(declare-fun tb!4939 () Bool)

(assert (=> (and start!74582 (= defaultEntry!696 defaultEntry!696) t!24553) tb!4939))

(declare-fun result!9507 () Bool)

(assert (=> tb!4939 (= result!9507 tp_is_empty!17533)))

(assert (=> b!878938 t!24553))

(declare-fun b_and!25141 () Bool)

(assert (= b_and!25139 (and (=> t!24553 result!9507) b_and!25141)))

(declare-fun m!818127 () Bool)

(assert (=> b!878935 m!818127))

(declare-fun m!818129 () Bool)

(assert (=> b!878935 m!818129))

(declare-fun m!818131 () Bool)

(assert (=> b!878935 m!818131))

(declare-fun m!818133 () Bool)

(assert (=> b!878935 m!818133))

(declare-fun m!818135 () Bool)

(assert (=> b!878935 m!818135))

(assert (=> b!878935 m!818129))

(declare-fun m!818137 () Bool)

(assert (=> b!878935 m!818137))

(declare-fun m!818139 () Bool)

(assert (=> b!878933 m!818139))

(declare-fun m!818141 () Bool)

(assert (=> b!878939 m!818141))

(declare-fun m!818143 () Bool)

(assert (=> start!74582 m!818143))

(declare-fun m!818145 () Bool)

(assert (=> start!74582 m!818145))

(declare-fun m!818147 () Bool)

(assert (=> b!878936 m!818147))

(declare-fun m!818149 () Bool)

(assert (=> mapNonEmpty!27915 m!818149))

(declare-fun m!818151 () Bool)

(assert (=> b!878934 m!818151))

(declare-fun m!818153 () Bool)

(assert (=> b!878932 m!818153))

(declare-fun m!818155 () Bool)

(assert (=> b!878932 m!818155))

(declare-fun m!818157 () Bool)

(assert (=> b!878932 m!818157))

(declare-fun m!818159 () Bool)

(assert (=> b!878937 m!818159))

(declare-fun m!818161 () Bool)

(assert (=> b!878938 m!818161))

(declare-fun m!818163 () Bool)

(assert (=> b!878938 m!818163))

(declare-fun m!818165 () Bool)

(assert (=> b!878938 m!818165))

(assert (=> b!878938 m!818161))

(declare-fun m!818167 () Bool)

(assert (=> b!878938 m!818167))

(assert (=> b!878938 m!818129))

(assert (=> b!878938 m!818163))

(check-sat (not b_lambda!12311) (not b!878936) (not b!878938) (not start!74582) (not b!878934) (not b!878937) (not b!878939) tp_is_empty!17533 (not mapNonEmpty!27915) (not b_next!15289) (not b!878935) b_and!25141 (not b!878932))
(check-sat b_and!25141 (not b_next!15289))
(get-model)

(declare-fun b_lambda!12317 () Bool)

(assert (= b_lambda!12311 (or (and start!74582 b_free!15289) b_lambda!12317)))

(check-sat (not b!878936) (not b_lambda!12317) (not b!878938) (not start!74582) (not b!878934) (not b!878937) (not b!878939) tp_is_empty!17533 (not mapNonEmpty!27915) (not b_next!15289) (not b!878935) b_and!25141 (not b!878932))
(check-sat b_and!25141 (not b_next!15289))
(get-model)

(declare-fun b!879053 () Bool)

(assert (=> b!879053 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25055 _keys!868)))))

(assert (=> b!879053 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25054 lt!397224)))))

(declare-fun lt!397291 () ListLongMap!10431)

(declare-fun e!489184 () Bool)

(declare-fun apply!378 (ListLongMap!10431 (_ BitVec 64)) V!28425)

(assert (=> b!879053 (= e!489184 (= (apply!378 lt!397291 (select (arr!24613 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12940 (select (arr!24612 lt!397224) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!879054 () Bool)

(declare-fun e!489187 () Bool)

(assert (=> b!879054 (= e!489187 (validKeyInArray!0 (select (arr!24613 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879054 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!879055 () Bool)

(declare-fun e!489189 () ListLongMap!10431)

(declare-fun call!38831 () ListLongMap!10431)

(assert (=> b!879055 (= e!489189 call!38831)))

(declare-fun b!879056 () Bool)

(declare-fun e!489186 () Bool)

(assert (=> b!879056 (= e!489186 e!489184)))

(assert (=> b!879056 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25055 _keys!868)))))

(declare-fun res!597301 () Bool)

(declare-fun contains!4225 (ListLongMap!10431 (_ BitVec 64)) Bool)

(assert (=> b!879056 (= res!597301 (contains!4225 lt!397291 (select (arr!24613 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879056 (=> (not res!597301) (not e!489184))))

(declare-fun d!108697 () Bool)

(declare-fun e!489185 () Bool)

(assert (=> d!108697 e!489185))

(declare-fun res!597303 () Bool)

(assert (=> d!108697 (=> (not res!597303) (not e!489185))))

(assert (=> d!108697 (= res!597303 (not (contains!4225 lt!397291 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!489188 () ListLongMap!10431)

(assert (=> d!108697 (= lt!397291 e!489188)))

(declare-fun c!92731 () Bool)

(assert (=> d!108697 (= c!92731 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25055 _keys!868)))))

(assert (=> d!108697 (validMask!0 mask!1196)))

(assert (=> d!108697 (= (getCurrentListMapNoExtraKeys!3224 _keys!868 lt!397224 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397291)))

(declare-fun b!879057 () Bool)

(assert (=> b!879057 (= e!489188 e!489189)))

(declare-fun c!92732 () Bool)

(assert (=> b!879057 (= c!92732 (validKeyInArray!0 (select (arr!24613 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun e!489183 () Bool)

(declare-fun b!879058 () Bool)

(assert (=> b!879058 (= e!489183 (= lt!397291 (getCurrentListMapNoExtraKeys!3224 _keys!868 lt!397224 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879059 () Bool)

(declare-fun isEmpty!670 (ListLongMap!10431) Bool)

(assert (=> b!879059 (= e!489183 (isEmpty!670 lt!397291))))

(declare-fun b!879060 () Bool)

(declare-fun res!597300 () Bool)

(assert (=> b!879060 (=> (not res!597300) (not e!489185))))

(assert (=> b!879060 (= res!597300 (not (contains!4225 lt!397291 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879061 () Bool)

(declare-fun lt!397286 () Unit!29969)

(declare-fun lt!397289 () Unit!29969)

(assert (=> b!879061 (= lt!397286 lt!397289)))

(declare-fun lt!397287 () V!28425)

(declare-fun lt!397288 () ListLongMap!10431)

(declare-fun lt!397290 () (_ BitVec 64))

(declare-fun lt!397285 () (_ BitVec 64))

(assert (=> b!879061 (not (contains!4225 (+!2527 lt!397288 (tuple2!11673 lt!397290 lt!397287)) lt!397285))))

(declare-fun addStillNotContains!204 (ListLongMap!10431 (_ BitVec 64) V!28425 (_ BitVec 64)) Unit!29969)

(assert (=> b!879061 (= lt!397289 (addStillNotContains!204 lt!397288 lt!397290 lt!397287 lt!397285))))

(assert (=> b!879061 (= lt!397285 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879061 (= lt!397287 (get!12940 (select (arr!24612 lt!397224) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879061 (= lt!397290 (select (arr!24613 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!879061 (= lt!397288 call!38831)))

(assert (=> b!879061 (= e!489189 (+!2527 call!38831 (tuple2!11673 (select (arr!24613 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12940 (select (arr!24612 lt!397224) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879062 () Bool)

(assert (=> b!879062 (= e!489186 e!489183)))

(declare-fun c!92730 () Bool)

(assert (=> b!879062 (= c!92730 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25055 _keys!868)))))

(declare-fun b!879063 () Bool)

(assert (=> b!879063 (= e!489188 (ListLongMap!10432 Nil!17469))))

(declare-fun bm!38828 () Bool)

(assert (=> bm!38828 (= call!38831 (getCurrentListMapNoExtraKeys!3224 _keys!868 lt!397224 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!879064 () Bool)

(assert (=> b!879064 (= e!489185 e!489186)))

(declare-fun c!92733 () Bool)

(assert (=> b!879064 (= c!92733 e!489187)))

(declare-fun res!597302 () Bool)

(assert (=> b!879064 (=> (not res!597302) (not e!489187))))

(assert (=> b!879064 (= res!597302 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25055 _keys!868)))))

(assert (= (and d!108697 c!92731) b!879063))

(assert (= (and d!108697 (not c!92731)) b!879057))

(assert (= (and b!879057 c!92732) b!879061))

(assert (= (and b!879057 (not c!92732)) b!879055))

(assert (= (or b!879061 b!879055) bm!38828))

(assert (= (and d!108697 res!597303) b!879060))

(assert (= (and b!879060 res!597300) b!879064))

(assert (= (and b!879064 res!597302) b!879054))

(assert (= (and b!879064 c!92733) b!879056))

(assert (= (and b!879064 (not c!92733)) b!879062))

(assert (= (and b!879056 res!597301) b!879053))

(assert (= (and b!879062 c!92730) b!879058))

(assert (= (and b!879062 (not c!92730)) b!879059))

(declare-fun b_lambda!12319 () Bool)

(assert (=> (not b_lambda!12319) (not b!879053)))

(assert (=> b!879053 t!24553))

(declare-fun b_and!25151 () Bool)

(assert (= b_and!25141 (and (=> t!24553 result!9507) b_and!25151)))

(declare-fun b_lambda!12321 () Bool)

(assert (=> (not b_lambda!12321) (not b!879061)))

(assert (=> b!879061 t!24553))

(declare-fun b_and!25153 () Bool)

(assert (= b_and!25151 (and (=> t!24553 result!9507) b_and!25153)))

(declare-fun m!818253 () Bool)

(assert (=> bm!38828 m!818253))

(assert (=> b!879058 m!818253))

(declare-fun m!818255 () Bool)

(assert (=> b!879059 m!818255))

(declare-fun m!818257 () Bool)

(assert (=> b!879054 m!818257))

(assert (=> b!879054 m!818257))

(declare-fun m!818259 () Bool)

(assert (=> b!879054 m!818259))

(declare-fun m!818261 () Bool)

(assert (=> b!879060 m!818261))

(assert (=> b!879056 m!818257))

(assert (=> b!879056 m!818257))

(declare-fun m!818263 () Bool)

(assert (=> b!879056 m!818263))

(declare-fun m!818265 () Bool)

(assert (=> d!108697 m!818265))

(assert (=> d!108697 m!818147))

(assert (=> b!879053 m!818257))

(assert (=> b!879053 m!818257))

(declare-fun m!818267 () Bool)

(assert (=> b!879053 m!818267))

(assert (=> b!879053 m!818163))

(declare-fun m!818269 () Bool)

(assert (=> b!879053 m!818269))

(assert (=> b!879053 m!818269))

(assert (=> b!879053 m!818163))

(declare-fun m!818271 () Bool)

(assert (=> b!879053 m!818271))

(assert (=> b!879061 m!818257))

(declare-fun m!818273 () Bool)

(assert (=> b!879061 m!818273))

(assert (=> b!879061 m!818163))

(declare-fun m!818275 () Bool)

(assert (=> b!879061 m!818275))

(assert (=> b!879061 m!818269))

(assert (=> b!879061 m!818269))

(assert (=> b!879061 m!818163))

(assert (=> b!879061 m!818271))

(declare-fun m!818277 () Bool)

(assert (=> b!879061 m!818277))

(assert (=> b!879061 m!818273))

(declare-fun m!818279 () Bool)

(assert (=> b!879061 m!818279))

(assert (=> b!879057 m!818257))

(assert (=> b!879057 m!818257))

(assert (=> b!879057 m!818259))

(assert (=> b!878935 d!108697))

(declare-fun b!879065 () Bool)

(assert (=> b!879065 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25055 _keys!868)))))

(assert (=> b!879065 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25054 _values!688)))))

(declare-fun lt!397298 () ListLongMap!10431)

(declare-fun e!489191 () Bool)

(assert (=> b!879065 (= e!489191 (= (apply!378 lt!397298 (select (arr!24613 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12940 (select (arr!24612 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!879066 () Bool)

(declare-fun e!489194 () Bool)

(assert (=> b!879066 (= e!489194 (validKeyInArray!0 (select (arr!24613 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879066 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!879067 () Bool)

(declare-fun e!489196 () ListLongMap!10431)

(declare-fun call!38832 () ListLongMap!10431)

(assert (=> b!879067 (= e!489196 call!38832)))

(declare-fun b!879068 () Bool)

(declare-fun e!489193 () Bool)

(assert (=> b!879068 (= e!489193 e!489191)))

(assert (=> b!879068 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25055 _keys!868)))))

(declare-fun res!597305 () Bool)

(assert (=> b!879068 (= res!597305 (contains!4225 lt!397298 (select (arr!24613 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879068 (=> (not res!597305) (not e!489191))))

(declare-fun d!108699 () Bool)

(declare-fun e!489192 () Bool)

(assert (=> d!108699 e!489192))

(declare-fun res!597307 () Bool)

(assert (=> d!108699 (=> (not res!597307) (not e!489192))))

(assert (=> d!108699 (= res!597307 (not (contains!4225 lt!397298 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!489195 () ListLongMap!10431)

(assert (=> d!108699 (= lt!397298 e!489195)))

(declare-fun c!92735 () Bool)

(assert (=> d!108699 (= c!92735 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25055 _keys!868)))))

(assert (=> d!108699 (validMask!0 mask!1196)))

(assert (=> d!108699 (= (getCurrentListMapNoExtraKeys!3224 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397298)))

(declare-fun b!879069 () Bool)

(assert (=> b!879069 (= e!489195 e!489196)))

(declare-fun c!92736 () Bool)

(assert (=> b!879069 (= c!92736 (validKeyInArray!0 (select (arr!24613 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!879070 () Bool)

(declare-fun e!489190 () Bool)

(assert (=> b!879070 (= e!489190 (= lt!397298 (getCurrentListMapNoExtraKeys!3224 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879071 () Bool)

(assert (=> b!879071 (= e!489190 (isEmpty!670 lt!397298))))

(declare-fun b!879072 () Bool)

(declare-fun res!597304 () Bool)

(assert (=> b!879072 (=> (not res!597304) (not e!489192))))

(assert (=> b!879072 (= res!597304 (not (contains!4225 lt!397298 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879073 () Bool)

(declare-fun lt!397293 () Unit!29969)

(declare-fun lt!397296 () Unit!29969)

(assert (=> b!879073 (= lt!397293 lt!397296)))

(declare-fun lt!397297 () (_ BitVec 64))

(declare-fun lt!397295 () ListLongMap!10431)

(declare-fun lt!397294 () V!28425)

(declare-fun lt!397292 () (_ BitVec 64))

(assert (=> b!879073 (not (contains!4225 (+!2527 lt!397295 (tuple2!11673 lt!397297 lt!397294)) lt!397292))))

(assert (=> b!879073 (= lt!397296 (addStillNotContains!204 lt!397295 lt!397297 lt!397294 lt!397292))))

(assert (=> b!879073 (= lt!397292 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879073 (= lt!397294 (get!12940 (select (arr!24612 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879073 (= lt!397297 (select (arr!24613 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!879073 (= lt!397295 call!38832)))

(assert (=> b!879073 (= e!489196 (+!2527 call!38832 (tuple2!11673 (select (arr!24613 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12940 (select (arr!24612 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879074 () Bool)

(assert (=> b!879074 (= e!489193 e!489190)))

(declare-fun c!92734 () Bool)

(assert (=> b!879074 (= c!92734 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25055 _keys!868)))))

(declare-fun b!879075 () Bool)

(assert (=> b!879075 (= e!489195 (ListLongMap!10432 Nil!17469))))

(declare-fun bm!38829 () Bool)

(assert (=> bm!38829 (= call!38832 (getCurrentListMapNoExtraKeys!3224 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!879076 () Bool)

(assert (=> b!879076 (= e!489192 e!489193)))

(declare-fun c!92737 () Bool)

(assert (=> b!879076 (= c!92737 e!489194)))

(declare-fun res!597306 () Bool)

(assert (=> b!879076 (=> (not res!597306) (not e!489194))))

(assert (=> b!879076 (= res!597306 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25055 _keys!868)))))

(assert (= (and d!108699 c!92735) b!879075))

(assert (= (and d!108699 (not c!92735)) b!879069))

(assert (= (and b!879069 c!92736) b!879073))

(assert (= (and b!879069 (not c!92736)) b!879067))

(assert (= (or b!879073 b!879067) bm!38829))

(assert (= (and d!108699 res!597307) b!879072))

(assert (= (and b!879072 res!597304) b!879076))

(assert (= (and b!879076 res!597306) b!879066))

(assert (= (and b!879076 c!92737) b!879068))

(assert (= (and b!879076 (not c!92737)) b!879074))

(assert (= (and b!879068 res!597305) b!879065))

(assert (= (and b!879074 c!92734) b!879070))

(assert (= (and b!879074 (not c!92734)) b!879071))

(declare-fun b_lambda!12323 () Bool)

(assert (=> (not b_lambda!12323) (not b!879065)))

(assert (=> b!879065 t!24553))

(declare-fun b_and!25155 () Bool)

(assert (= b_and!25153 (and (=> t!24553 result!9507) b_and!25155)))

(declare-fun b_lambda!12325 () Bool)

(assert (=> (not b_lambda!12325) (not b!879073)))

(assert (=> b!879073 t!24553))

(declare-fun b_and!25157 () Bool)

(assert (= b_and!25155 (and (=> t!24553 result!9507) b_and!25157)))

(declare-fun m!818281 () Bool)

(assert (=> bm!38829 m!818281))

(assert (=> b!879070 m!818281))

(declare-fun m!818283 () Bool)

(assert (=> b!879071 m!818283))

(assert (=> b!879066 m!818257))

(assert (=> b!879066 m!818257))

(assert (=> b!879066 m!818259))

(declare-fun m!818285 () Bool)

(assert (=> b!879072 m!818285))

(assert (=> b!879068 m!818257))

(assert (=> b!879068 m!818257))

(declare-fun m!818287 () Bool)

(assert (=> b!879068 m!818287))

(declare-fun m!818289 () Bool)

(assert (=> d!108699 m!818289))

(assert (=> d!108699 m!818147))

(assert (=> b!879065 m!818257))

(assert (=> b!879065 m!818257))

(declare-fun m!818291 () Bool)

(assert (=> b!879065 m!818291))

(assert (=> b!879065 m!818163))

(declare-fun m!818293 () Bool)

(assert (=> b!879065 m!818293))

(assert (=> b!879065 m!818293))

(assert (=> b!879065 m!818163))

(declare-fun m!818295 () Bool)

(assert (=> b!879065 m!818295))

(assert (=> b!879073 m!818257))

(declare-fun m!818297 () Bool)

(assert (=> b!879073 m!818297))

(assert (=> b!879073 m!818163))

(declare-fun m!818299 () Bool)

(assert (=> b!879073 m!818299))

(assert (=> b!879073 m!818293))

(assert (=> b!879073 m!818293))

(assert (=> b!879073 m!818163))

(assert (=> b!879073 m!818295))

(declare-fun m!818301 () Bool)

(assert (=> b!879073 m!818301))

(assert (=> b!879073 m!818297))

(declare-fun m!818303 () Bool)

(assert (=> b!879073 m!818303))

(assert (=> b!879069 m!818257))

(assert (=> b!879069 m!818257))

(assert (=> b!879069 m!818259))

(assert (=> b!878935 d!108699))

(declare-fun d!108701 () Bool)

(assert (=> d!108701 (= (validKeyInArray!0 (select (arr!24613 _keys!868) from!1053)) (and (not (= (select (arr!24613 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24613 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!878935 d!108701))

(declare-fun d!108703 () Bool)

(declare-fun e!489199 () Bool)

(assert (=> d!108703 e!489199))

(declare-fun res!597312 () Bool)

(assert (=> d!108703 (=> (not res!597312) (not e!489199))))

(declare-fun lt!397308 () ListLongMap!10431)

(assert (=> d!108703 (= res!597312 (contains!4225 lt!397308 (_1!5847 (tuple2!11673 k0!854 v!557))))))

(declare-fun lt!397309 () List!17472)

(assert (=> d!108703 (= lt!397308 (ListLongMap!10432 lt!397309))))

(declare-fun lt!397310 () Unit!29969)

(declare-fun lt!397307 () Unit!29969)

(assert (=> d!108703 (= lt!397310 lt!397307)))

(declare-datatypes ((Option!424 0))(
  ( (Some!423 (v!11254 V!28425)) (None!422) )
))
(declare-fun getValueByKey!418 (List!17472 (_ BitVec 64)) Option!424)

(assert (=> d!108703 (= (getValueByKey!418 lt!397309 (_1!5847 (tuple2!11673 k0!854 v!557))) (Some!423 (_2!5847 (tuple2!11673 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!235 (List!17472 (_ BitVec 64) V!28425) Unit!29969)

(assert (=> d!108703 (= lt!397307 (lemmaContainsTupThenGetReturnValue!235 lt!397309 (_1!5847 (tuple2!11673 k0!854 v!557)) (_2!5847 (tuple2!11673 k0!854 v!557))))))

(declare-fun insertStrictlySorted!274 (List!17472 (_ BitVec 64) V!28425) List!17472)

(assert (=> d!108703 (= lt!397309 (insertStrictlySorted!274 (toList!5231 lt!397225) (_1!5847 (tuple2!11673 k0!854 v!557)) (_2!5847 (tuple2!11673 k0!854 v!557))))))

(assert (=> d!108703 (= (+!2527 lt!397225 (tuple2!11673 k0!854 v!557)) lt!397308)))

(declare-fun b!879081 () Bool)

(declare-fun res!597313 () Bool)

(assert (=> b!879081 (=> (not res!597313) (not e!489199))))

(assert (=> b!879081 (= res!597313 (= (getValueByKey!418 (toList!5231 lt!397308) (_1!5847 (tuple2!11673 k0!854 v!557))) (Some!423 (_2!5847 (tuple2!11673 k0!854 v!557)))))))

(declare-fun b!879082 () Bool)

(declare-fun contains!4226 (List!17472 tuple2!11672) Bool)

(assert (=> b!879082 (= e!489199 (contains!4226 (toList!5231 lt!397308) (tuple2!11673 k0!854 v!557)))))

(assert (= (and d!108703 res!597312) b!879081))

(assert (= (and b!879081 res!597313) b!879082))

(declare-fun m!818305 () Bool)

(assert (=> d!108703 m!818305))

(declare-fun m!818307 () Bool)

(assert (=> d!108703 m!818307))

(declare-fun m!818309 () Bool)

(assert (=> d!108703 m!818309))

(declare-fun m!818311 () Bool)

(assert (=> d!108703 m!818311))

(declare-fun m!818313 () Bool)

(assert (=> b!879081 m!818313))

(declare-fun m!818315 () Bool)

(assert (=> b!879082 m!818315))

(assert (=> b!878935 d!108703))

(declare-fun call!38838 () ListLongMap!10431)

(declare-fun bm!38834 () Bool)

(assert (=> bm!38834 (= call!38838 (getCurrentListMapNoExtraKeys!3224 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun d!108705 () Bool)

(declare-fun e!489204 () Bool)

(assert (=> d!108705 e!489204))

(declare-fun res!597316 () Bool)

(assert (=> d!108705 (=> (not res!597316) (not e!489204))))

(assert (=> d!108705 (= res!597316 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25054 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25054 _values!688))))))))

(declare-fun lt!397313 () Unit!29969)

(declare-fun choose!1443 (array!51173 array!51171 (_ BitVec 32) (_ BitVec 32) V!28425 V!28425 (_ BitVec 32) (_ BitVec 64) V!28425 (_ BitVec 32) Int) Unit!29969)

(assert (=> d!108705 (= lt!397313 (choose!1443 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108705 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25055 _keys!868)))))

(assert (=> d!108705 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!696 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397313)))

(declare-fun b!879089 () Bool)

(declare-fun call!38837 () ListLongMap!10431)

(declare-fun e!489205 () Bool)

(assert (=> b!879089 (= e!489205 (= call!38837 (+!2527 call!38838 (tuple2!11673 k0!854 v!557))))))

(declare-fun b!879090 () Bool)

(assert (=> b!879090 (= e!489205 (= call!38837 call!38838))))

(declare-fun bm!38835 () Bool)

(assert (=> bm!38835 (= call!38837 (getCurrentListMapNoExtraKeys!3224 _keys!868 (array!51172 (store (arr!24612 _values!688) i!612 (ValueCellFull!8327 v!557)) (size!25054 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879091 () Bool)

(assert (=> b!879091 (= e!489204 e!489205)))

(declare-fun c!92740 () Bool)

(assert (=> b!879091 (= c!92740 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(assert (= (and d!108705 res!597316) b!879091))

(assert (= (and b!879091 c!92740) b!879089))

(assert (= (and b!879091 (not c!92740)) b!879090))

(assert (= (or b!879089 b!879090) bm!38834))

(assert (= (or b!879089 b!879090) bm!38835))

(assert (=> bm!38834 m!818127))

(declare-fun m!818317 () Bool)

(assert (=> d!108705 m!818317))

(declare-fun m!818319 () Bool)

(assert (=> b!879089 m!818319))

(assert (=> bm!38835 m!818155))

(declare-fun m!818321 () Bool)

(assert (=> bm!38835 m!818321))

(assert (=> b!878935 d!108705))

(declare-fun d!108707 () Bool)

(assert (=> d!108707 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!878939 d!108707))

(declare-fun d!108709 () Bool)

(declare-fun e!489206 () Bool)

(assert (=> d!108709 e!489206))

(declare-fun res!597317 () Bool)

(assert (=> d!108709 (=> (not res!597317) (not e!489206))))

(declare-fun lt!397315 () ListLongMap!10431)

(assert (=> d!108709 (= res!597317 (contains!4225 lt!397315 (_1!5847 (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!397316 () List!17472)

(assert (=> d!108709 (= lt!397315 (ListLongMap!10432 lt!397316))))

(declare-fun lt!397317 () Unit!29969)

(declare-fun lt!397314 () Unit!29969)

(assert (=> d!108709 (= lt!397317 lt!397314)))

(assert (=> d!108709 (= (getValueByKey!418 lt!397316 (_1!5847 (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!423 (_2!5847 (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108709 (= lt!397314 (lemmaContainsTupThenGetReturnValue!235 lt!397316 (_1!5847 (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5847 (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108709 (= lt!397316 (insertStrictlySorted!274 (toList!5231 lt!397223) (_1!5847 (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5847 (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108709 (= (+!2527 lt!397223 (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!397315)))

(declare-fun b!879092 () Bool)

(declare-fun res!597318 () Bool)

(assert (=> b!879092 (=> (not res!597318) (not e!489206))))

(assert (=> b!879092 (= res!597318 (= (getValueByKey!418 (toList!5231 lt!397315) (_1!5847 (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!423 (_2!5847 (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!879093 () Bool)

(assert (=> b!879093 (= e!489206 (contains!4226 (toList!5231 lt!397315) (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108709 res!597317) b!879092))

(assert (= (and b!879092 res!597318) b!879093))

(declare-fun m!818323 () Bool)

(assert (=> d!108709 m!818323))

(declare-fun m!818325 () Bool)

(assert (=> d!108709 m!818325))

(declare-fun m!818327 () Bool)

(assert (=> d!108709 m!818327))

(declare-fun m!818329 () Bool)

(assert (=> d!108709 m!818329))

(declare-fun m!818331 () Bool)

(assert (=> b!879092 m!818331))

(declare-fun m!818333 () Bool)

(assert (=> b!879093 m!818333))

(assert (=> b!878938 d!108709))

(declare-fun d!108711 () Bool)

(declare-fun c!92743 () Bool)

(assert (=> d!108711 (= c!92743 ((_ is ValueCellFull!8327) (select (arr!24612 _values!688) from!1053)))))

(declare-fun e!489209 () V!28425)

(assert (=> d!108711 (= (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!489209)))

(declare-fun b!879098 () Bool)

(declare-fun get!12943 (ValueCell!8327 V!28425) V!28425)

(assert (=> b!879098 (= e!489209 (get!12943 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879099 () Bool)

(declare-fun get!12944 (ValueCell!8327 V!28425) V!28425)

(assert (=> b!879099 (= e!489209 (get!12944 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108711 c!92743) b!879098))

(assert (= (and d!108711 (not c!92743)) b!879099))

(assert (=> b!879098 m!818161))

(assert (=> b!879098 m!818163))

(declare-fun m!818335 () Bool)

(assert (=> b!879098 m!818335))

(assert (=> b!879099 m!818161))

(assert (=> b!879099 m!818163))

(declare-fun m!818337 () Bool)

(assert (=> b!879099 m!818337))

(assert (=> b!878938 d!108711))

(declare-fun d!108713 () Bool)

(declare-fun res!597326 () Bool)

(declare-fun e!489218 () Bool)

(assert (=> d!108713 (=> res!597326 e!489218)))

(assert (=> d!108713 (= res!597326 (bvsge #b00000000000000000000000000000000 (size!25055 _keys!868)))))

(assert (=> d!108713 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17470) e!489218)))

(declare-fun b!879110 () Bool)

(declare-fun e!489221 () Bool)

(assert (=> b!879110 (= e!489218 e!489221)))

(declare-fun res!597325 () Bool)

(assert (=> b!879110 (=> (not res!597325) (not e!489221))))

(declare-fun e!489219 () Bool)

(assert (=> b!879110 (= res!597325 (not e!489219))))

(declare-fun res!597327 () Bool)

(assert (=> b!879110 (=> (not res!597327) (not e!489219))))

(assert (=> b!879110 (= res!597327 (validKeyInArray!0 (select (arr!24613 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!879111 () Bool)

(declare-fun e!489220 () Bool)

(declare-fun call!38841 () Bool)

(assert (=> b!879111 (= e!489220 call!38841)))

(declare-fun bm!38838 () Bool)

(declare-fun c!92746 () Bool)

(assert (=> bm!38838 (= call!38841 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92746 (Cons!17469 (select (arr!24613 _keys!868) #b00000000000000000000000000000000) Nil!17470) Nil!17470)))))

(declare-fun b!879112 () Bool)

(assert (=> b!879112 (= e!489220 call!38841)))

(declare-fun b!879113 () Bool)

(assert (=> b!879113 (= e!489221 e!489220)))

(assert (=> b!879113 (= c!92746 (validKeyInArray!0 (select (arr!24613 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!879114 () Bool)

(declare-fun contains!4227 (List!17473 (_ BitVec 64)) Bool)

(assert (=> b!879114 (= e!489219 (contains!4227 Nil!17470 (select (arr!24613 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108713 (not res!597326)) b!879110))

(assert (= (and b!879110 res!597327) b!879114))

(assert (= (and b!879110 res!597325) b!879113))

(assert (= (and b!879113 c!92746) b!879111))

(assert (= (and b!879113 (not c!92746)) b!879112))

(assert (= (or b!879111 b!879112) bm!38838))

(declare-fun m!818339 () Bool)

(assert (=> b!879110 m!818339))

(assert (=> b!879110 m!818339))

(declare-fun m!818341 () Bool)

(assert (=> b!879110 m!818341))

(assert (=> bm!38838 m!818339))

(declare-fun m!818343 () Bool)

(assert (=> bm!38838 m!818343))

(assert (=> b!879113 m!818339))

(assert (=> b!879113 m!818339))

(assert (=> b!879113 m!818341))

(assert (=> b!879114 m!818339))

(assert (=> b!879114 m!818339))

(declare-fun m!818345 () Bool)

(assert (=> b!879114 m!818345))

(assert (=> b!878934 d!108713))

(declare-fun b!879123 () Bool)

(declare-fun e!489228 () Bool)

(declare-fun e!489230 () Bool)

(assert (=> b!879123 (= e!489228 e!489230)))

(declare-fun c!92749 () Bool)

(assert (=> b!879123 (= c!92749 (validKeyInArray!0 (select (arr!24613 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38841 () Bool)

(declare-fun call!38844 () Bool)

(assert (=> bm!38841 (= call!38844 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!108715 () Bool)

(declare-fun res!597332 () Bool)

(assert (=> d!108715 (=> res!597332 e!489228)))

(assert (=> d!108715 (= res!597332 (bvsge #b00000000000000000000000000000000 (size!25055 _keys!868)))))

(assert (=> d!108715 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!489228)))

(declare-fun b!879124 () Bool)

(assert (=> b!879124 (= e!489230 call!38844)))

(declare-fun b!879125 () Bool)

(declare-fun e!489229 () Bool)

(assert (=> b!879125 (= e!489230 e!489229)))

(declare-fun lt!397324 () (_ BitVec 64))

(assert (=> b!879125 (= lt!397324 (select (arr!24613 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!397326 () Unit!29969)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51173 (_ BitVec 64) (_ BitVec 32)) Unit!29969)

(assert (=> b!879125 (= lt!397326 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!397324 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!879125 (arrayContainsKey!0 _keys!868 lt!397324 #b00000000000000000000000000000000)))

(declare-fun lt!397325 () Unit!29969)

(assert (=> b!879125 (= lt!397325 lt!397326)))

(declare-fun res!597333 () Bool)

(declare-datatypes ((SeekEntryResult!8750 0))(
  ( (MissingZero!8750 (index!37371 (_ BitVec 32))) (Found!8750 (index!37372 (_ BitVec 32))) (Intermediate!8750 (undefined!9562 Bool) (index!37373 (_ BitVec 32)) (x!74463 (_ BitVec 32))) (Undefined!8750) (MissingVacant!8750 (index!37374 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51173 (_ BitVec 32)) SeekEntryResult!8750)

(assert (=> b!879125 (= res!597333 (= (seekEntryOrOpen!0 (select (arr!24613 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8750 #b00000000000000000000000000000000)))))

(assert (=> b!879125 (=> (not res!597333) (not e!489229))))

(declare-fun b!879126 () Bool)

(assert (=> b!879126 (= e!489229 call!38844)))

(assert (= (and d!108715 (not res!597332)) b!879123))

(assert (= (and b!879123 c!92749) b!879125))

(assert (= (and b!879123 (not c!92749)) b!879124))

(assert (= (and b!879125 res!597333) b!879126))

(assert (= (or b!879126 b!879124) bm!38841))

(assert (=> b!879123 m!818339))

(assert (=> b!879123 m!818339))

(assert (=> b!879123 m!818341))

(declare-fun m!818347 () Bool)

(assert (=> bm!38841 m!818347))

(assert (=> b!879125 m!818339))

(declare-fun m!818349 () Bool)

(assert (=> b!879125 m!818349))

(declare-fun m!818351 () Bool)

(assert (=> b!879125 m!818351))

(assert (=> b!879125 m!818339))

(declare-fun m!818353 () Bool)

(assert (=> b!879125 m!818353))

(assert (=> b!878937 d!108715))

(declare-fun b!879127 () Bool)

(assert (=> b!879127 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25055 _keys!868)))))

(assert (=> b!879127 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25054 lt!397224)))))

(declare-fun lt!397333 () ListLongMap!10431)

(declare-fun e!489232 () Bool)

(assert (=> b!879127 (= e!489232 (= (apply!378 lt!397333 (select (arr!24613 _keys!868) from!1053)) (get!12940 (select (arr!24612 lt!397224) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!879128 () Bool)

(declare-fun e!489235 () Bool)

(assert (=> b!879128 (= e!489235 (validKeyInArray!0 (select (arr!24613 _keys!868) from!1053)))))

(assert (=> b!879128 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!879129 () Bool)

(declare-fun e!489237 () ListLongMap!10431)

(declare-fun call!38845 () ListLongMap!10431)

(assert (=> b!879129 (= e!489237 call!38845)))

(declare-fun b!879130 () Bool)

(declare-fun e!489234 () Bool)

(assert (=> b!879130 (= e!489234 e!489232)))

(assert (=> b!879130 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25055 _keys!868)))))

(declare-fun res!597335 () Bool)

(assert (=> b!879130 (= res!597335 (contains!4225 lt!397333 (select (arr!24613 _keys!868) from!1053)))))

(assert (=> b!879130 (=> (not res!597335) (not e!489232))))

(declare-fun d!108717 () Bool)

(declare-fun e!489233 () Bool)

(assert (=> d!108717 e!489233))

(declare-fun res!597337 () Bool)

(assert (=> d!108717 (=> (not res!597337) (not e!489233))))

(assert (=> d!108717 (= res!597337 (not (contains!4225 lt!397333 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!489236 () ListLongMap!10431)

(assert (=> d!108717 (= lt!397333 e!489236)))

(declare-fun c!92751 () Bool)

(assert (=> d!108717 (= c!92751 (bvsge from!1053 (size!25055 _keys!868)))))

(assert (=> d!108717 (validMask!0 mask!1196)))

(assert (=> d!108717 (= (getCurrentListMapNoExtraKeys!3224 _keys!868 lt!397224 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!397333)))

(declare-fun b!879131 () Bool)

(assert (=> b!879131 (= e!489236 e!489237)))

(declare-fun c!92752 () Bool)

(assert (=> b!879131 (= c!92752 (validKeyInArray!0 (select (arr!24613 _keys!868) from!1053)))))

(declare-fun e!489231 () Bool)

(declare-fun b!879132 () Bool)

(assert (=> b!879132 (= e!489231 (= lt!397333 (getCurrentListMapNoExtraKeys!3224 _keys!868 lt!397224 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879133 () Bool)

(assert (=> b!879133 (= e!489231 (isEmpty!670 lt!397333))))

(declare-fun b!879134 () Bool)

(declare-fun res!597334 () Bool)

(assert (=> b!879134 (=> (not res!597334) (not e!489233))))

(assert (=> b!879134 (= res!597334 (not (contains!4225 lt!397333 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879135 () Bool)

(declare-fun lt!397328 () Unit!29969)

(declare-fun lt!397331 () Unit!29969)

(assert (=> b!879135 (= lt!397328 lt!397331)))

(declare-fun lt!397332 () (_ BitVec 64))

(declare-fun lt!397327 () (_ BitVec 64))

(declare-fun lt!397329 () V!28425)

(declare-fun lt!397330 () ListLongMap!10431)

(assert (=> b!879135 (not (contains!4225 (+!2527 lt!397330 (tuple2!11673 lt!397332 lt!397329)) lt!397327))))

(assert (=> b!879135 (= lt!397331 (addStillNotContains!204 lt!397330 lt!397332 lt!397329 lt!397327))))

(assert (=> b!879135 (= lt!397327 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879135 (= lt!397329 (get!12940 (select (arr!24612 lt!397224) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879135 (= lt!397332 (select (arr!24613 _keys!868) from!1053))))

(assert (=> b!879135 (= lt!397330 call!38845)))

(assert (=> b!879135 (= e!489237 (+!2527 call!38845 (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 lt!397224) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879136 () Bool)

(assert (=> b!879136 (= e!489234 e!489231)))

(declare-fun c!92750 () Bool)

(assert (=> b!879136 (= c!92750 (bvslt from!1053 (size!25055 _keys!868)))))

(declare-fun b!879137 () Bool)

(assert (=> b!879137 (= e!489236 (ListLongMap!10432 Nil!17469))))

(declare-fun bm!38842 () Bool)

(assert (=> bm!38842 (= call!38845 (getCurrentListMapNoExtraKeys!3224 _keys!868 lt!397224 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!879138 () Bool)

(assert (=> b!879138 (= e!489233 e!489234)))

(declare-fun c!92753 () Bool)

(assert (=> b!879138 (= c!92753 e!489235)))

(declare-fun res!597336 () Bool)

(assert (=> b!879138 (=> (not res!597336) (not e!489235))))

(assert (=> b!879138 (= res!597336 (bvslt from!1053 (size!25055 _keys!868)))))

(assert (= (and d!108717 c!92751) b!879137))

(assert (= (and d!108717 (not c!92751)) b!879131))

(assert (= (and b!879131 c!92752) b!879135))

(assert (= (and b!879131 (not c!92752)) b!879129))

(assert (= (or b!879135 b!879129) bm!38842))

(assert (= (and d!108717 res!597337) b!879134))

(assert (= (and b!879134 res!597334) b!879138))

(assert (= (and b!879138 res!597336) b!879128))

(assert (= (and b!879138 c!92753) b!879130))

(assert (= (and b!879138 (not c!92753)) b!879136))

(assert (= (and b!879130 res!597335) b!879127))

(assert (= (and b!879136 c!92750) b!879132))

(assert (= (and b!879136 (not c!92750)) b!879133))

(declare-fun b_lambda!12327 () Bool)

(assert (=> (not b_lambda!12327) (not b!879127)))

(assert (=> b!879127 t!24553))

(declare-fun b_and!25159 () Bool)

(assert (= b_and!25157 (and (=> t!24553 result!9507) b_and!25159)))

(declare-fun b_lambda!12329 () Bool)

(assert (=> (not b_lambda!12329) (not b!879135)))

(assert (=> b!879135 t!24553))

(declare-fun b_and!25161 () Bool)

(assert (= b_and!25159 (and (=> t!24553 result!9507) b_and!25161)))

(declare-fun m!818355 () Bool)

(assert (=> bm!38842 m!818355))

(assert (=> b!879132 m!818355))

(declare-fun m!818357 () Bool)

(assert (=> b!879133 m!818357))

(assert (=> b!879128 m!818129))

(assert (=> b!879128 m!818129))

(assert (=> b!879128 m!818131))

(declare-fun m!818359 () Bool)

(assert (=> b!879134 m!818359))

(assert (=> b!879130 m!818129))

(assert (=> b!879130 m!818129))

(declare-fun m!818361 () Bool)

(assert (=> b!879130 m!818361))

(declare-fun m!818363 () Bool)

(assert (=> d!108717 m!818363))

(assert (=> d!108717 m!818147))

(assert (=> b!879127 m!818129))

(assert (=> b!879127 m!818129))

(declare-fun m!818365 () Bool)

(assert (=> b!879127 m!818365))

(assert (=> b!879127 m!818163))

(declare-fun m!818367 () Bool)

(assert (=> b!879127 m!818367))

(assert (=> b!879127 m!818367))

(assert (=> b!879127 m!818163))

(declare-fun m!818369 () Bool)

(assert (=> b!879127 m!818369))

(assert (=> b!879135 m!818129))

(declare-fun m!818371 () Bool)

(assert (=> b!879135 m!818371))

(assert (=> b!879135 m!818163))

(declare-fun m!818373 () Bool)

(assert (=> b!879135 m!818373))

(assert (=> b!879135 m!818367))

(assert (=> b!879135 m!818367))

(assert (=> b!879135 m!818163))

(assert (=> b!879135 m!818369))

(declare-fun m!818375 () Bool)

(assert (=> b!879135 m!818375))

(assert (=> b!879135 m!818371))

(declare-fun m!818377 () Bool)

(assert (=> b!879135 m!818377))

(assert (=> b!879131 m!818129))

(assert (=> b!879131 m!818129))

(assert (=> b!879131 m!818131))

(assert (=> b!878932 d!108717))

(declare-fun b!879139 () Bool)

(assert (=> b!879139 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25055 _keys!868)))))

(assert (=> b!879139 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25054 _values!688)))))

(declare-fun e!489239 () Bool)

(declare-fun lt!397340 () ListLongMap!10431)

(assert (=> b!879139 (= e!489239 (= (apply!378 lt!397340 (select (arr!24613 _keys!868) from!1053)) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!879140 () Bool)

(declare-fun e!489242 () Bool)

(assert (=> b!879140 (= e!489242 (validKeyInArray!0 (select (arr!24613 _keys!868) from!1053)))))

(assert (=> b!879140 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!879141 () Bool)

(declare-fun e!489244 () ListLongMap!10431)

(declare-fun call!38846 () ListLongMap!10431)

(assert (=> b!879141 (= e!489244 call!38846)))

(declare-fun b!879142 () Bool)

(declare-fun e!489241 () Bool)

(assert (=> b!879142 (= e!489241 e!489239)))

(assert (=> b!879142 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25055 _keys!868)))))

(declare-fun res!597339 () Bool)

(assert (=> b!879142 (= res!597339 (contains!4225 lt!397340 (select (arr!24613 _keys!868) from!1053)))))

(assert (=> b!879142 (=> (not res!597339) (not e!489239))))

(declare-fun d!108719 () Bool)

(declare-fun e!489240 () Bool)

(assert (=> d!108719 e!489240))

(declare-fun res!597341 () Bool)

(assert (=> d!108719 (=> (not res!597341) (not e!489240))))

(assert (=> d!108719 (= res!597341 (not (contains!4225 lt!397340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!489243 () ListLongMap!10431)

(assert (=> d!108719 (= lt!397340 e!489243)))

(declare-fun c!92755 () Bool)

(assert (=> d!108719 (= c!92755 (bvsge from!1053 (size!25055 _keys!868)))))

(assert (=> d!108719 (validMask!0 mask!1196)))

(assert (=> d!108719 (= (getCurrentListMapNoExtraKeys!3224 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!397340)))

(declare-fun b!879143 () Bool)

(assert (=> b!879143 (= e!489243 e!489244)))

(declare-fun c!92756 () Bool)

(assert (=> b!879143 (= c!92756 (validKeyInArray!0 (select (arr!24613 _keys!868) from!1053)))))

(declare-fun e!489238 () Bool)

(declare-fun b!879144 () Bool)

(assert (=> b!879144 (= e!489238 (= lt!397340 (getCurrentListMapNoExtraKeys!3224 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879145 () Bool)

(assert (=> b!879145 (= e!489238 (isEmpty!670 lt!397340))))

(declare-fun b!879146 () Bool)

(declare-fun res!597338 () Bool)

(assert (=> b!879146 (=> (not res!597338) (not e!489240))))

(assert (=> b!879146 (= res!597338 (not (contains!4225 lt!397340 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879147 () Bool)

(declare-fun lt!397335 () Unit!29969)

(declare-fun lt!397338 () Unit!29969)

(assert (=> b!879147 (= lt!397335 lt!397338)))

(declare-fun lt!397337 () ListLongMap!10431)

(declare-fun lt!397336 () V!28425)

(declare-fun lt!397334 () (_ BitVec 64))

(declare-fun lt!397339 () (_ BitVec 64))

(assert (=> b!879147 (not (contains!4225 (+!2527 lt!397337 (tuple2!11673 lt!397339 lt!397336)) lt!397334))))

(assert (=> b!879147 (= lt!397338 (addStillNotContains!204 lt!397337 lt!397339 lt!397336 lt!397334))))

(assert (=> b!879147 (= lt!397334 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879147 (= lt!397336 (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879147 (= lt!397339 (select (arr!24613 _keys!868) from!1053))))

(assert (=> b!879147 (= lt!397337 call!38846)))

(assert (=> b!879147 (= e!489244 (+!2527 call!38846 (tuple2!11673 (select (arr!24613 _keys!868) from!1053) (get!12940 (select (arr!24612 _values!688) from!1053) (dynLambda!1222 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879148 () Bool)

(assert (=> b!879148 (= e!489241 e!489238)))

(declare-fun c!92754 () Bool)

(assert (=> b!879148 (= c!92754 (bvslt from!1053 (size!25055 _keys!868)))))

(declare-fun b!879149 () Bool)

(assert (=> b!879149 (= e!489243 (ListLongMap!10432 Nil!17469))))

(declare-fun bm!38843 () Bool)

(assert (=> bm!38843 (= call!38846 (getCurrentListMapNoExtraKeys!3224 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!879150 () Bool)

(assert (=> b!879150 (= e!489240 e!489241)))

(declare-fun c!92757 () Bool)

(assert (=> b!879150 (= c!92757 e!489242)))

(declare-fun res!597340 () Bool)

(assert (=> b!879150 (=> (not res!597340) (not e!489242))))

(assert (=> b!879150 (= res!597340 (bvslt from!1053 (size!25055 _keys!868)))))

(assert (= (and d!108719 c!92755) b!879149))

(assert (= (and d!108719 (not c!92755)) b!879143))

(assert (= (and b!879143 c!92756) b!879147))

(assert (= (and b!879143 (not c!92756)) b!879141))

(assert (= (or b!879147 b!879141) bm!38843))

(assert (= (and d!108719 res!597341) b!879146))

(assert (= (and b!879146 res!597338) b!879150))

(assert (= (and b!879150 res!597340) b!879140))

(assert (= (and b!879150 c!92757) b!879142))

(assert (= (and b!879150 (not c!92757)) b!879148))

(assert (= (and b!879142 res!597339) b!879139))

(assert (= (and b!879148 c!92754) b!879144))

(assert (= (and b!879148 (not c!92754)) b!879145))

(declare-fun b_lambda!12331 () Bool)

(assert (=> (not b_lambda!12331) (not b!879139)))

(assert (=> b!879139 t!24553))

(declare-fun b_and!25163 () Bool)

(assert (= b_and!25161 (and (=> t!24553 result!9507) b_and!25163)))

(declare-fun b_lambda!12333 () Bool)

(assert (=> (not b_lambda!12333) (not b!879147)))

(assert (=> b!879147 t!24553))

(declare-fun b_and!25165 () Bool)

(assert (= b_and!25163 (and (=> t!24553 result!9507) b_and!25165)))

(declare-fun m!818379 () Bool)

(assert (=> bm!38843 m!818379))

(assert (=> b!879144 m!818379))

(declare-fun m!818381 () Bool)

(assert (=> b!879145 m!818381))

(assert (=> b!879140 m!818129))

(assert (=> b!879140 m!818129))

(assert (=> b!879140 m!818131))

(declare-fun m!818383 () Bool)

(assert (=> b!879146 m!818383))

(assert (=> b!879142 m!818129))

(assert (=> b!879142 m!818129))

(declare-fun m!818385 () Bool)

(assert (=> b!879142 m!818385))

(declare-fun m!818387 () Bool)

(assert (=> d!108719 m!818387))

(assert (=> d!108719 m!818147))

(assert (=> b!879139 m!818129))

(assert (=> b!879139 m!818129))

(declare-fun m!818389 () Bool)

(assert (=> b!879139 m!818389))

(assert (=> b!879139 m!818163))

(assert (=> b!879139 m!818161))

(assert (=> b!879139 m!818161))

(assert (=> b!879139 m!818163))

(assert (=> b!879139 m!818165))

(assert (=> b!879147 m!818129))

(declare-fun m!818391 () Bool)

(assert (=> b!879147 m!818391))

(assert (=> b!879147 m!818163))

(declare-fun m!818393 () Bool)

(assert (=> b!879147 m!818393))

(assert (=> b!879147 m!818161))

(assert (=> b!879147 m!818161))

(assert (=> b!879147 m!818163))

(assert (=> b!879147 m!818165))

(declare-fun m!818395 () Bool)

(assert (=> b!879147 m!818395))

(assert (=> b!879147 m!818391))

(declare-fun m!818397 () Bool)

(assert (=> b!879147 m!818397))

(assert (=> b!879143 m!818129))

(assert (=> b!879143 m!818129))

(assert (=> b!879143 m!818131))

(assert (=> b!878932 d!108719))

(declare-fun d!108721 () Bool)

(assert (=> d!108721 (= (array_inv!19438 _keys!868) (bvsge (size!25055 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74582 d!108721))

(declare-fun d!108723 () Bool)

(assert (=> d!108723 (= (array_inv!19439 _values!688) (bvsge (size!25054 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74582 d!108723))

(declare-fun d!108725 () Bool)

(assert (=> d!108725 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!878936 d!108725))

(declare-fun b!879157 () Bool)

(declare-fun e!489249 () Bool)

(assert (=> b!879157 (= e!489249 tp_is_empty!17533)))

(declare-fun mapNonEmpty!27924 () Bool)

(declare-fun mapRes!27924 () Bool)

(declare-fun tp!53565 () Bool)

(assert (=> mapNonEmpty!27924 (= mapRes!27924 (and tp!53565 e!489249))))

(declare-fun mapRest!27924 () (Array (_ BitVec 32) ValueCell!8327))

(declare-fun mapValue!27924 () ValueCell!8327)

(declare-fun mapKey!27924 () (_ BitVec 32))

(assert (=> mapNonEmpty!27924 (= mapRest!27915 (store mapRest!27924 mapKey!27924 mapValue!27924))))

(declare-fun mapIsEmpty!27924 () Bool)

(assert (=> mapIsEmpty!27924 mapRes!27924))

(declare-fun condMapEmpty!27924 () Bool)

(declare-fun mapDefault!27924 () ValueCell!8327)

(assert (=> mapNonEmpty!27915 (= condMapEmpty!27924 (= mapRest!27915 ((as const (Array (_ BitVec 32) ValueCell!8327)) mapDefault!27924)))))

(declare-fun e!489250 () Bool)

(assert (=> mapNonEmpty!27915 (= tp!53550 (and e!489250 mapRes!27924))))

(declare-fun b!879158 () Bool)

(assert (=> b!879158 (= e!489250 tp_is_empty!17533)))

(assert (= (and mapNonEmpty!27915 condMapEmpty!27924) mapIsEmpty!27924))

(assert (= (and mapNonEmpty!27915 (not condMapEmpty!27924)) mapNonEmpty!27924))

(assert (= (and mapNonEmpty!27924 ((_ is ValueCellFull!8327) mapValue!27924)) b!879157))

(assert (= (and mapNonEmpty!27915 ((_ is ValueCellFull!8327) mapDefault!27924)) b!879158))

(declare-fun m!818399 () Bool)

(assert (=> mapNonEmpty!27924 m!818399))

(declare-fun b_lambda!12335 () Bool)

(assert (= b_lambda!12327 (or (and start!74582 b_free!15289) b_lambda!12335)))

(declare-fun b_lambda!12337 () Bool)

(assert (= b_lambda!12323 (or (and start!74582 b_free!15289) b_lambda!12337)))

(declare-fun b_lambda!12339 () Bool)

(assert (= b_lambda!12319 (or (and start!74582 b_free!15289) b_lambda!12339)))

(declare-fun b_lambda!12341 () Bool)

(assert (= b_lambda!12321 (or (and start!74582 b_free!15289) b_lambda!12341)))

(declare-fun b_lambda!12343 () Bool)

(assert (= b_lambda!12331 (or (and start!74582 b_free!15289) b_lambda!12343)))

(declare-fun b_lambda!12345 () Bool)

(assert (= b_lambda!12329 (or (and start!74582 b_free!15289) b_lambda!12345)))

(declare-fun b_lambda!12347 () Bool)

(assert (= b_lambda!12333 (or (and start!74582 b_free!15289) b_lambda!12347)))

(declare-fun b_lambda!12349 () Bool)

(assert (= b_lambda!12325 (or (and start!74582 b_free!15289) b_lambda!12349)))

(check-sat (not b_lambda!12337) (not b!879139) (not b!879114) (not b!879135) b_and!25165 (not d!108719) (not bm!38841) (not b!879070) (not b!879128) (not b!879147) (not b!879072) (not b!879066) (not b!879110) (not b!879081) (not b!879134) (not b!879071) (not b_lambda!12335) (not b!879057) (not b!879125) (not b!879146) (not d!108699) (not bm!38835) (not b!879093) (not bm!38828) (not b_lambda!12349) (not d!108705) (not b_lambda!12317) (not bm!38829) (not d!108697) (not b!879098) (not b_lambda!12343) (not b!879140) (not b!879132) (not b_lambda!12347) (not b!879142) (not b!879060) (not mapNonEmpty!27924) (not b!879059) (not b!879144) (not b!879143) (not b_lambda!12339) (not bm!38834) (not bm!38838) (not b!879127) (not d!108709) (not b!879131) (not b!879073) (not b!879069) (not b!879089) (not b!879053) (not b!879082) (not d!108717) (not b_lambda!12345) (not b!879092) (not b!879113) (not b!879054) (not b!879061) (not b_lambda!12341) (not bm!38842) tp_is_empty!17533 (not b!879056) (not b!879058) (not b!879145) (not b!879068) (not b!879123) (not b!879130) (not b!879099) (not b!879065) (not bm!38843) (not b_next!15289) (not d!108703) (not b!879133))
(check-sat b_and!25165 (not b_next!15289))
