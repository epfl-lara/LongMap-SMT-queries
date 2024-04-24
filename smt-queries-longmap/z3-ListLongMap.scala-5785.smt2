; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74800 () Bool)

(assert start!74800)

(declare-fun b_free!15301 () Bool)

(declare-fun b_next!15301 () Bool)

(assert (=> start!74800 (= b_free!15301 (not b_next!15301))))

(declare-fun tp!53589 () Bool)

(declare-fun b_and!25215 () Bool)

(assert (=> start!74800 (= tp!53589 b_and!25215)))

(declare-fun b!880450 () Bool)

(declare-fun res!597909 () Bool)

(declare-fun e!490064 () Bool)

(assert (=> b!880450 (=> (not res!597909) (not e!490064))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51253 0))(
  ( (array!51254 (arr!24647 (Array (_ BitVec 32) (_ BitVec 64))) (size!25088 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51253)

(declare-datatypes ((V!28441 0))(
  ( (V!28442 (val!8820 Int)) )
))
(declare-datatypes ((ValueCell!8333 0))(
  ( (ValueCellFull!8333 (v!11264 V!28441)) (EmptyCell!8333) )
))
(declare-datatypes ((array!51255 0))(
  ( (array!51256 (arr!24648 (Array (_ BitVec 32) ValueCell!8333)) (size!25089 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51255)

(assert (=> b!880450 (= res!597909 (and (= (size!25089 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25088 _keys!868) (size!25089 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880451 () Bool)

(declare-fun e!490060 () Bool)

(declare-fun e!490062 () Bool)

(assert (=> b!880451 (= e!490060 (not e!490062))))

(declare-fun res!597907 () Bool)

(assert (=> b!880451 (=> res!597907 e!490062)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880451 (= res!597907 (not (validKeyInArray!0 (select (arr!24647 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11606 0))(
  ( (tuple2!11607 (_1!5814 (_ BitVec 64)) (_2!5814 V!28441)) )
))
(declare-datatypes ((List!17437 0))(
  ( (Nil!17434) (Cons!17433 (h!18570 tuple2!11606) (t!24532 List!17437)) )
))
(declare-datatypes ((ListLongMap!10377 0))(
  ( (ListLongMap!10378 (toList!5204 List!17437)) )
))
(declare-fun lt!398017 () ListLongMap!10377)

(declare-fun lt!398020 () ListLongMap!10377)

(assert (=> b!880451 (= lt!398017 lt!398020)))

(declare-fun v!557 () V!28441)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!398018 () ListLongMap!10377)

(declare-fun +!2521 (ListLongMap!10377 tuple2!11606) ListLongMap!10377)

(assert (=> b!880451 (= lt!398020 (+!2521 lt!398018 (tuple2!11607 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28441)

(declare-fun zeroValue!654 () V!28441)

(declare-fun lt!398016 () array!51255)

(declare-fun getCurrentListMapNoExtraKeys!3246 (array!51253 array!51255 (_ BitVec 32) (_ BitVec 32) V!28441 V!28441 (_ BitVec 32) Int) ListLongMap!10377)

(assert (=> b!880451 (= lt!398017 (getCurrentListMapNoExtraKeys!3246 _keys!868 lt!398016 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880451 (= lt!398018 (getCurrentListMapNoExtraKeys!3246 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30012 0))(
  ( (Unit!30013) )
))
(declare-fun lt!398021 () Unit!30012)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!688 (array!51253 array!51255 (_ BitVec 32) (_ BitVec 32) V!28441 V!28441 (_ BitVec 32) (_ BitVec 64) V!28441 (_ BitVec 32) Int) Unit!30012)

(assert (=> b!880451 (= lt!398021 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!688 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!597915 () Bool)

(assert (=> start!74800 (=> (not res!597915) (not e!490064))))

(assert (=> start!74800 (= res!597915 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25088 _keys!868))))))

(assert (=> start!74800 e!490064))

(declare-fun tp_is_empty!17545 () Bool)

(assert (=> start!74800 tp_is_empty!17545))

(assert (=> start!74800 true))

(assert (=> start!74800 tp!53589))

(declare-fun array_inv!19458 (array!51253) Bool)

(assert (=> start!74800 (array_inv!19458 _keys!868)))

(declare-fun e!490061 () Bool)

(declare-fun array_inv!19459 (array!51255) Bool)

(assert (=> start!74800 (and (array_inv!19459 _values!688) e!490061)))

(declare-fun b!880452 () Bool)

(declare-fun res!597914 () Bool)

(assert (=> b!880452 (=> (not res!597914) (not e!490064))))

(declare-datatypes ((List!17438 0))(
  ( (Nil!17435) (Cons!17434 (h!18571 (_ BitVec 64)) (t!24533 List!17438)) )
))
(declare-fun arrayNoDuplicates!0 (array!51253 (_ BitVec 32) List!17438) Bool)

(assert (=> b!880452 (= res!597914 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17435))))

(declare-fun b!880453 () Bool)

(declare-fun res!597911 () Bool)

(assert (=> b!880453 (=> (not res!597911) (not e!490064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51253 (_ BitVec 32)) Bool)

(assert (=> b!880453 (= res!597911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880454 () Bool)

(declare-fun e!490058 () Bool)

(assert (=> b!880454 (= e!490058 tp_is_empty!17545)))

(declare-fun mapNonEmpty!27936 () Bool)

(declare-fun mapRes!27936 () Bool)

(declare-fun tp!53588 () Bool)

(declare-fun e!490059 () Bool)

(assert (=> mapNonEmpty!27936 (= mapRes!27936 (and tp!53588 e!490059))))

(declare-fun mapRest!27936 () (Array (_ BitVec 32) ValueCell!8333))

(declare-fun mapValue!27936 () ValueCell!8333)

(declare-fun mapKey!27936 () (_ BitVec 32))

(assert (=> mapNonEmpty!27936 (= (arr!24648 _values!688) (store mapRest!27936 mapKey!27936 mapValue!27936))))

(declare-fun b!880455 () Bool)

(assert (=> b!880455 (= e!490064 e!490060)))

(declare-fun res!597908 () Bool)

(assert (=> b!880455 (=> (not res!597908) (not e!490060))))

(assert (=> b!880455 (= res!597908 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!398019 () ListLongMap!10377)

(assert (=> b!880455 (= lt!398019 (getCurrentListMapNoExtraKeys!3246 _keys!868 lt!398016 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880455 (= lt!398016 (array!51256 (store (arr!24648 _values!688) i!612 (ValueCellFull!8333 v!557)) (size!25089 _values!688)))))

(declare-fun lt!398015 () ListLongMap!10377)

(assert (=> b!880455 (= lt!398015 (getCurrentListMapNoExtraKeys!3246 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27936 () Bool)

(assert (=> mapIsEmpty!27936 mapRes!27936))

(declare-fun b!880456 () Bool)

(assert (=> b!880456 (= e!490059 tp_is_empty!17545)))

(declare-fun b!880457 () Bool)

(declare-fun res!597913 () Bool)

(assert (=> b!880457 (=> (not res!597913) (not e!490064))))

(assert (=> b!880457 (= res!597913 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25088 _keys!868))))))

(declare-fun b!880458 () Bool)

(declare-fun res!597912 () Bool)

(assert (=> b!880458 (=> (not res!597912) (not e!490064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880458 (= res!597912 (validMask!0 mask!1196))))

(declare-fun b!880459 () Bool)

(declare-fun res!597910 () Bool)

(assert (=> b!880459 (=> (not res!597910) (not e!490064))))

(assert (=> b!880459 (= res!597910 (and (= (select (arr!24647 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!880460 () Bool)

(assert (=> b!880460 (= e!490062 (or (not (= (select (arr!24647 _keys!868) from!1053) k0!854)) (bvslt (size!25088 _keys!868) #b01111111111111111111111111111111)))))

(declare-fun get!12973 (ValueCell!8333 V!28441) V!28441)

(declare-fun dynLambda!1246 (Int (_ BitVec 64)) V!28441)

(assert (=> b!880460 (= lt!398019 (+!2521 lt!398020 (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880461 () Bool)

(assert (=> b!880461 (= e!490061 (and e!490058 mapRes!27936))))

(declare-fun condMapEmpty!27936 () Bool)

(declare-fun mapDefault!27936 () ValueCell!8333)

(assert (=> b!880461 (= condMapEmpty!27936 (= (arr!24648 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8333)) mapDefault!27936)))))

(declare-fun b!880462 () Bool)

(declare-fun res!597906 () Bool)

(assert (=> b!880462 (=> (not res!597906) (not e!490064))))

(assert (=> b!880462 (= res!597906 (validKeyInArray!0 k0!854))))

(assert (= (and start!74800 res!597915) b!880458))

(assert (= (and b!880458 res!597912) b!880450))

(assert (= (and b!880450 res!597909) b!880453))

(assert (= (and b!880453 res!597911) b!880452))

(assert (= (and b!880452 res!597914) b!880457))

(assert (= (and b!880457 res!597913) b!880462))

(assert (= (and b!880462 res!597906) b!880459))

(assert (= (and b!880459 res!597910) b!880455))

(assert (= (and b!880455 res!597908) b!880451))

(assert (= (and b!880451 (not res!597907)) b!880460))

(assert (= (and b!880461 condMapEmpty!27936) mapIsEmpty!27936))

(assert (= (and b!880461 (not condMapEmpty!27936)) mapNonEmpty!27936))

(get-info :version)

(assert (= (and mapNonEmpty!27936 ((_ is ValueCellFull!8333) mapValue!27936)) b!880456))

(assert (= (and b!880461 ((_ is ValueCellFull!8333) mapDefault!27936)) b!880454))

(assert (= start!74800 b!880461))

(declare-fun b_lambda!12389 () Bool)

(assert (=> (not b_lambda!12389) (not b!880460)))

(declare-fun t!24531 () Bool)

(declare-fun tb!4951 () Bool)

(assert (=> (and start!74800 (= defaultEntry!696 defaultEntry!696) t!24531) tb!4951))

(declare-fun result!9533 () Bool)

(assert (=> tb!4951 (= result!9533 tp_is_empty!17545)))

(assert (=> b!880460 t!24531))

(declare-fun b_and!25217 () Bool)

(assert (= b_and!25215 (and (=> t!24531 result!9533) b_and!25217)))

(declare-fun m!820579 () Bool)

(assert (=> b!880460 m!820579))

(declare-fun m!820581 () Bool)

(assert (=> b!880460 m!820581))

(declare-fun m!820583 () Bool)

(assert (=> b!880460 m!820583))

(declare-fun m!820585 () Bool)

(assert (=> b!880460 m!820585))

(assert (=> b!880460 m!820581))

(declare-fun m!820587 () Bool)

(assert (=> b!880460 m!820587))

(assert (=> b!880460 m!820583))

(declare-fun m!820589 () Bool)

(assert (=> b!880453 m!820589))

(declare-fun m!820591 () Bool)

(assert (=> mapNonEmpty!27936 m!820591))

(declare-fun m!820593 () Bool)

(assert (=> b!880459 m!820593))

(declare-fun m!820595 () Bool)

(assert (=> b!880462 m!820595))

(declare-fun m!820597 () Bool)

(assert (=> b!880451 m!820597))

(declare-fun m!820599 () Bool)

(assert (=> b!880451 m!820599))

(assert (=> b!880451 m!820587))

(declare-fun m!820601 () Bool)

(assert (=> b!880451 m!820601))

(assert (=> b!880451 m!820587))

(declare-fun m!820603 () Bool)

(assert (=> b!880451 m!820603))

(declare-fun m!820605 () Bool)

(assert (=> b!880451 m!820605))

(declare-fun m!820607 () Bool)

(assert (=> start!74800 m!820607))

(declare-fun m!820609 () Bool)

(assert (=> start!74800 m!820609))

(declare-fun m!820611 () Bool)

(assert (=> b!880452 m!820611))

(declare-fun m!820613 () Bool)

(assert (=> b!880458 m!820613))

(declare-fun m!820615 () Bool)

(assert (=> b!880455 m!820615))

(declare-fun m!820617 () Bool)

(assert (=> b!880455 m!820617))

(declare-fun m!820619 () Bool)

(assert (=> b!880455 m!820619))

(check-sat (not b!880452) tp_is_empty!17545 (not b_lambda!12389) (not b!880460) (not b!880462) (not mapNonEmpty!27936) (not b!880451) (not start!74800) (not b!880458) (not b_next!15301) (not b!880455) b_and!25217 (not b!880453))
(check-sat b_and!25217 (not b_next!15301))
(get-model)

(declare-fun b_lambda!12395 () Bool)

(assert (= b_lambda!12389 (or (and start!74800 b_free!15301) b_lambda!12395)))

(check-sat (not b!880452) tp_is_empty!17545 (not b!880460) (not b!880462) (not mapNonEmpty!27936) (not b!880451) (not b!880458) (not b_next!15301) (not b!880455) b_and!25217 (not b!880453) (not b_lambda!12395) (not start!74800))
(check-sat b_and!25217 (not b_next!15301))
(get-model)

(declare-fun b!880571 () Bool)

(declare-fun e!490126 () ListLongMap!10377)

(assert (=> b!880571 (= e!490126 (ListLongMap!10378 Nil!17434))))

(declare-fun b!880572 () Bool)

(declare-fun e!490125 () Bool)

(declare-fun lt!398079 () ListLongMap!10377)

(declare-fun isEmpty!672 (ListLongMap!10377) Bool)

(assert (=> b!880572 (= e!490125 (isEmpty!672 lt!398079))))

(declare-fun b!880573 () Bool)

(assert (=> b!880573 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25088 _keys!868)))))

(assert (=> b!880573 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25089 lt!398016)))))

(declare-fun e!490121 () Bool)

(declare-fun apply!379 (ListLongMap!10377 (_ BitVec 64)) V!28441)

(assert (=> b!880573 (= e!490121 (= (apply!379 lt!398079 (select (arr!24647 _keys!868) from!1053)) (get!12973 (select (arr!24648 lt!398016) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!880574 () Bool)

(assert (=> b!880574 (= e!490125 (= lt!398079 (getCurrentListMapNoExtraKeys!3246 _keys!868 lt!398016 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!880576 () Bool)

(declare-fun e!490123 () ListLongMap!10377)

(declare-fun call!38920 () ListLongMap!10377)

(assert (=> b!880576 (= e!490123 call!38920)))

(declare-fun b!880577 () Bool)

(declare-fun lt!398082 () Unit!30012)

(declare-fun lt!398078 () Unit!30012)

(assert (=> b!880577 (= lt!398082 lt!398078)))

(declare-fun lt!398080 () (_ BitVec 64))

(declare-fun lt!398081 () (_ BitVec 64))

(declare-fun lt!398083 () V!28441)

(declare-fun lt!398084 () ListLongMap!10377)

(declare-fun contains!4232 (ListLongMap!10377 (_ BitVec 64)) Bool)

(assert (=> b!880577 (not (contains!4232 (+!2521 lt!398084 (tuple2!11607 lt!398081 lt!398083)) lt!398080))))

(declare-fun addStillNotContains!206 (ListLongMap!10377 (_ BitVec 64) V!28441 (_ BitVec 64)) Unit!30012)

(assert (=> b!880577 (= lt!398078 (addStillNotContains!206 lt!398084 lt!398081 lt!398083 lt!398080))))

(assert (=> b!880577 (= lt!398080 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880577 (= lt!398083 (get!12973 (select (arr!24648 lt!398016) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880577 (= lt!398081 (select (arr!24647 _keys!868) from!1053))))

(assert (=> b!880577 (= lt!398084 call!38920)))

(assert (=> b!880577 (= e!490123 (+!2521 call!38920 (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 lt!398016) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!38917 () Bool)

(assert (=> bm!38917 (= call!38920 (getCurrentListMapNoExtraKeys!3246 _keys!868 lt!398016 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!880578 () Bool)

(declare-fun e!490127 () Bool)

(assert (=> b!880578 (= e!490127 (validKeyInArray!0 (select (arr!24647 _keys!868) from!1053)))))

(assert (=> b!880578 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!880579 () Bool)

(assert (=> b!880579 (= e!490126 e!490123)))

(declare-fun c!93115 () Bool)

(assert (=> b!880579 (= c!93115 (validKeyInArray!0 (select (arr!24647 _keys!868) from!1053)))))

(declare-fun b!880580 () Bool)

(declare-fun res!597984 () Bool)

(declare-fun e!490124 () Bool)

(assert (=> b!880580 (=> (not res!597984) (not e!490124))))

(assert (=> b!880580 (= res!597984 (not (contains!4232 lt!398079 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880575 () Bool)

(declare-fun e!490122 () Bool)

(assert (=> b!880575 (= e!490124 e!490122)))

(declare-fun c!93113 () Bool)

(assert (=> b!880575 (= c!93113 e!490127)))

(declare-fun res!597985 () Bool)

(assert (=> b!880575 (=> (not res!597985) (not e!490127))))

(assert (=> b!880575 (= res!597985 (bvslt from!1053 (size!25088 _keys!868)))))

(declare-fun d!109251 () Bool)

(assert (=> d!109251 e!490124))

(declare-fun res!597987 () Bool)

(assert (=> d!109251 (=> (not res!597987) (not e!490124))))

(assert (=> d!109251 (= res!597987 (not (contains!4232 lt!398079 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109251 (= lt!398079 e!490126)))

(declare-fun c!93116 () Bool)

(assert (=> d!109251 (= c!93116 (bvsge from!1053 (size!25088 _keys!868)))))

(assert (=> d!109251 (validMask!0 mask!1196)))

(assert (=> d!109251 (= (getCurrentListMapNoExtraKeys!3246 _keys!868 lt!398016 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398079)))

(declare-fun b!880581 () Bool)

(assert (=> b!880581 (= e!490122 e!490125)))

(declare-fun c!93114 () Bool)

(assert (=> b!880581 (= c!93114 (bvslt from!1053 (size!25088 _keys!868)))))

(declare-fun b!880582 () Bool)

(assert (=> b!880582 (= e!490122 e!490121)))

(assert (=> b!880582 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25088 _keys!868)))))

(declare-fun res!597986 () Bool)

(assert (=> b!880582 (= res!597986 (contains!4232 lt!398079 (select (arr!24647 _keys!868) from!1053)))))

(assert (=> b!880582 (=> (not res!597986) (not e!490121))))

(assert (= (and d!109251 c!93116) b!880571))

(assert (= (and d!109251 (not c!93116)) b!880579))

(assert (= (and b!880579 c!93115) b!880577))

(assert (= (and b!880579 (not c!93115)) b!880576))

(assert (= (or b!880577 b!880576) bm!38917))

(assert (= (and d!109251 res!597987) b!880580))

(assert (= (and b!880580 res!597984) b!880575))

(assert (= (and b!880575 res!597985) b!880578))

(assert (= (and b!880575 c!93113) b!880582))

(assert (= (and b!880575 (not c!93113)) b!880581))

(assert (= (and b!880582 res!597986) b!880573))

(assert (= (and b!880581 c!93114) b!880574))

(assert (= (and b!880581 (not c!93114)) b!880572))

(declare-fun b_lambda!12397 () Bool)

(assert (=> (not b_lambda!12397) (not b!880573)))

(assert (=> b!880573 t!24531))

(declare-fun b_and!25227 () Bool)

(assert (= b_and!25217 (and (=> t!24531 result!9533) b_and!25227)))

(declare-fun b_lambda!12399 () Bool)

(assert (=> (not b_lambda!12399) (not b!880577)))

(assert (=> b!880577 t!24531))

(declare-fun b_and!25229 () Bool)

(assert (= b_and!25227 (and (=> t!24531 result!9533) b_and!25229)))

(assert (=> b!880573 m!820583))

(assert (=> b!880573 m!820587))

(declare-fun m!820705 () Bool)

(assert (=> b!880573 m!820705))

(assert (=> b!880573 m!820587))

(declare-fun m!820707 () Bool)

(assert (=> b!880573 m!820707))

(assert (=> b!880573 m!820707))

(assert (=> b!880573 m!820583))

(declare-fun m!820709 () Bool)

(assert (=> b!880573 m!820709))

(declare-fun m!820711 () Bool)

(assert (=> b!880580 m!820711))

(assert (=> b!880578 m!820587))

(assert (=> b!880578 m!820587))

(assert (=> b!880578 m!820601))

(declare-fun m!820713 () Bool)

(assert (=> d!109251 m!820713))

(assert (=> d!109251 m!820613))

(assert (=> b!880579 m!820587))

(assert (=> b!880579 m!820587))

(assert (=> b!880579 m!820601))

(assert (=> b!880582 m!820587))

(assert (=> b!880582 m!820587))

(declare-fun m!820715 () Bool)

(assert (=> b!880582 m!820715))

(declare-fun m!820717 () Bool)

(assert (=> b!880572 m!820717))

(assert (=> b!880577 m!820583))

(declare-fun m!820719 () Bool)

(assert (=> b!880577 m!820719))

(declare-fun m!820721 () Bool)

(assert (=> b!880577 m!820721))

(assert (=> b!880577 m!820587))

(assert (=> b!880577 m!820707))

(assert (=> b!880577 m!820719))

(declare-fun m!820723 () Bool)

(assert (=> b!880577 m!820723))

(declare-fun m!820725 () Bool)

(assert (=> b!880577 m!820725))

(assert (=> b!880577 m!820707))

(assert (=> b!880577 m!820583))

(assert (=> b!880577 m!820709))

(declare-fun m!820727 () Bool)

(assert (=> bm!38917 m!820727))

(assert (=> b!880574 m!820727))

(assert (=> b!880455 d!109251))

(declare-fun b!880583 () Bool)

(declare-fun e!490133 () ListLongMap!10377)

(assert (=> b!880583 (= e!490133 (ListLongMap!10378 Nil!17434))))

(declare-fun b!880584 () Bool)

(declare-fun e!490132 () Bool)

(declare-fun lt!398086 () ListLongMap!10377)

(assert (=> b!880584 (= e!490132 (isEmpty!672 lt!398086))))

(declare-fun b!880585 () Bool)

(assert (=> b!880585 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25088 _keys!868)))))

(assert (=> b!880585 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25089 _values!688)))))

(declare-fun e!490128 () Bool)

(assert (=> b!880585 (= e!490128 (= (apply!379 lt!398086 (select (arr!24647 _keys!868) from!1053)) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!880586 () Bool)

(assert (=> b!880586 (= e!490132 (= lt!398086 (getCurrentListMapNoExtraKeys!3246 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!880588 () Bool)

(declare-fun e!490130 () ListLongMap!10377)

(declare-fun call!38921 () ListLongMap!10377)

(assert (=> b!880588 (= e!490130 call!38921)))

(declare-fun b!880589 () Bool)

(declare-fun lt!398089 () Unit!30012)

(declare-fun lt!398085 () Unit!30012)

(assert (=> b!880589 (= lt!398089 lt!398085)))

(declare-fun lt!398091 () ListLongMap!10377)

(declare-fun lt!398088 () (_ BitVec 64))

(declare-fun lt!398087 () (_ BitVec 64))

(declare-fun lt!398090 () V!28441)

(assert (=> b!880589 (not (contains!4232 (+!2521 lt!398091 (tuple2!11607 lt!398088 lt!398090)) lt!398087))))

(assert (=> b!880589 (= lt!398085 (addStillNotContains!206 lt!398091 lt!398088 lt!398090 lt!398087))))

(assert (=> b!880589 (= lt!398087 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880589 (= lt!398090 (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880589 (= lt!398088 (select (arr!24647 _keys!868) from!1053))))

(assert (=> b!880589 (= lt!398091 call!38921)))

(assert (=> b!880589 (= e!490130 (+!2521 call!38921 (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!38918 () Bool)

(assert (=> bm!38918 (= call!38921 (getCurrentListMapNoExtraKeys!3246 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!880590 () Bool)

(declare-fun e!490134 () Bool)

(assert (=> b!880590 (= e!490134 (validKeyInArray!0 (select (arr!24647 _keys!868) from!1053)))))

(assert (=> b!880590 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!880591 () Bool)

(assert (=> b!880591 (= e!490133 e!490130)))

(declare-fun c!93119 () Bool)

(assert (=> b!880591 (= c!93119 (validKeyInArray!0 (select (arr!24647 _keys!868) from!1053)))))

(declare-fun b!880592 () Bool)

(declare-fun res!597988 () Bool)

(declare-fun e!490131 () Bool)

(assert (=> b!880592 (=> (not res!597988) (not e!490131))))

(assert (=> b!880592 (= res!597988 (not (contains!4232 lt!398086 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880587 () Bool)

(declare-fun e!490129 () Bool)

(assert (=> b!880587 (= e!490131 e!490129)))

(declare-fun c!93117 () Bool)

(assert (=> b!880587 (= c!93117 e!490134)))

(declare-fun res!597989 () Bool)

(assert (=> b!880587 (=> (not res!597989) (not e!490134))))

(assert (=> b!880587 (= res!597989 (bvslt from!1053 (size!25088 _keys!868)))))

(declare-fun d!109253 () Bool)

(assert (=> d!109253 e!490131))

(declare-fun res!597991 () Bool)

(assert (=> d!109253 (=> (not res!597991) (not e!490131))))

(assert (=> d!109253 (= res!597991 (not (contains!4232 lt!398086 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109253 (= lt!398086 e!490133)))

(declare-fun c!93120 () Bool)

(assert (=> d!109253 (= c!93120 (bvsge from!1053 (size!25088 _keys!868)))))

(assert (=> d!109253 (validMask!0 mask!1196)))

(assert (=> d!109253 (= (getCurrentListMapNoExtraKeys!3246 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398086)))

(declare-fun b!880593 () Bool)

(assert (=> b!880593 (= e!490129 e!490132)))

(declare-fun c!93118 () Bool)

(assert (=> b!880593 (= c!93118 (bvslt from!1053 (size!25088 _keys!868)))))

(declare-fun b!880594 () Bool)

(assert (=> b!880594 (= e!490129 e!490128)))

(assert (=> b!880594 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25088 _keys!868)))))

(declare-fun res!597990 () Bool)

(assert (=> b!880594 (= res!597990 (contains!4232 lt!398086 (select (arr!24647 _keys!868) from!1053)))))

(assert (=> b!880594 (=> (not res!597990) (not e!490128))))

(assert (= (and d!109253 c!93120) b!880583))

(assert (= (and d!109253 (not c!93120)) b!880591))

(assert (= (and b!880591 c!93119) b!880589))

(assert (= (and b!880591 (not c!93119)) b!880588))

(assert (= (or b!880589 b!880588) bm!38918))

(assert (= (and d!109253 res!597991) b!880592))

(assert (= (and b!880592 res!597988) b!880587))

(assert (= (and b!880587 res!597989) b!880590))

(assert (= (and b!880587 c!93117) b!880594))

(assert (= (and b!880587 (not c!93117)) b!880593))

(assert (= (and b!880594 res!597990) b!880585))

(assert (= (and b!880593 c!93118) b!880586))

(assert (= (and b!880593 (not c!93118)) b!880584))

(declare-fun b_lambda!12401 () Bool)

(assert (=> (not b_lambda!12401) (not b!880585)))

(assert (=> b!880585 t!24531))

(declare-fun b_and!25231 () Bool)

(assert (= b_and!25229 (and (=> t!24531 result!9533) b_and!25231)))

(declare-fun b_lambda!12403 () Bool)

(assert (=> (not b_lambda!12403) (not b!880589)))

(assert (=> b!880589 t!24531))

(declare-fun b_and!25233 () Bool)

(assert (= b_and!25231 (and (=> t!24531 result!9533) b_and!25233)))

(assert (=> b!880585 m!820583))

(assert (=> b!880585 m!820587))

(declare-fun m!820729 () Bool)

(assert (=> b!880585 m!820729))

(assert (=> b!880585 m!820587))

(assert (=> b!880585 m!820581))

(assert (=> b!880585 m!820581))

(assert (=> b!880585 m!820583))

(assert (=> b!880585 m!820585))

(declare-fun m!820731 () Bool)

(assert (=> b!880592 m!820731))

(assert (=> b!880590 m!820587))

(assert (=> b!880590 m!820587))

(assert (=> b!880590 m!820601))

(declare-fun m!820733 () Bool)

(assert (=> d!109253 m!820733))

(assert (=> d!109253 m!820613))

(assert (=> b!880591 m!820587))

(assert (=> b!880591 m!820587))

(assert (=> b!880591 m!820601))

(assert (=> b!880594 m!820587))

(assert (=> b!880594 m!820587))

(declare-fun m!820735 () Bool)

(assert (=> b!880594 m!820735))

(declare-fun m!820737 () Bool)

(assert (=> b!880584 m!820737))

(assert (=> b!880589 m!820583))

(declare-fun m!820739 () Bool)

(assert (=> b!880589 m!820739))

(declare-fun m!820741 () Bool)

(assert (=> b!880589 m!820741))

(assert (=> b!880589 m!820587))

(assert (=> b!880589 m!820581))

(assert (=> b!880589 m!820739))

(declare-fun m!820743 () Bool)

(assert (=> b!880589 m!820743))

(declare-fun m!820745 () Bool)

(assert (=> b!880589 m!820745))

(assert (=> b!880589 m!820581))

(assert (=> b!880589 m!820583))

(assert (=> b!880589 m!820585))

(declare-fun m!820747 () Bool)

(assert (=> bm!38918 m!820747))

(assert (=> b!880586 m!820747))

(assert (=> b!880455 d!109253))

(declare-fun b!880595 () Bool)

(declare-fun e!490140 () ListLongMap!10377)

(assert (=> b!880595 (= e!490140 (ListLongMap!10378 Nil!17434))))

(declare-fun b!880596 () Bool)

(declare-fun e!490139 () Bool)

(declare-fun lt!398093 () ListLongMap!10377)

(assert (=> b!880596 (= e!490139 (isEmpty!672 lt!398093))))

(declare-fun b!880597 () Bool)

(assert (=> b!880597 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25088 _keys!868)))))

(assert (=> b!880597 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25089 _values!688)))))

(declare-fun e!490135 () Bool)

(assert (=> b!880597 (= e!490135 (= (apply!379 lt!398093 (select (arr!24647 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12973 (select (arr!24648 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!880598 () Bool)

(assert (=> b!880598 (= e!490139 (= lt!398093 (getCurrentListMapNoExtraKeys!3246 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!880600 () Bool)

(declare-fun e!490137 () ListLongMap!10377)

(declare-fun call!38922 () ListLongMap!10377)

(assert (=> b!880600 (= e!490137 call!38922)))

(declare-fun b!880601 () Bool)

(declare-fun lt!398096 () Unit!30012)

(declare-fun lt!398092 () Unit!30012)

(assert (=> b!880601 (= lt!398096 lt!398092)))

(declare-fun lt!398097 () V!28441)

(declare-fun lt!398094 () (_ BitVec 64))

(declare-fun lt!398095 () (_ BitVec 64))

(declare-fun lt!398098 () ListLongMap!10377)

(assert (=> b!880601 (not (contains!4232 (+!2521 lt!398098 (tuple2!11607 lt!398095 lt!398097)) lt!398094))))

(assert (=> b!880601 (= lt!398092 (addStillNotContains!206 lt!398098 lt!398095 lt!398097 lt!398094))))

(assert (=> b!880601 (= lt!398094 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880601 (= lt!398097 (get!12973 (select (arr!24648 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880601 (= lt!398095 (select (arr!24647 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!880601 (= lt!398098 call!38922)))

(assert (=> b!880601 (= e!490137 (+!2521 call!38922 (tuple2!11607 (select (arr!24647 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12973 (select (arr!24648 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!38919 () Bool)

(assert (=> bm!38919 (= call!38922 (getCurrentListMapNoExtraKeys!3246 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!880602 () Bool)

(declare-fun e!490141 () Bool)

(assert (=> b!880602 (= e!490141 (validKeyInArray!0 (select (arr!24647 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880602 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!880603 () Bool)

(assert (=> b!880603 (= e!490140 e!490137)))

(declare-fun c!93123 () Bool)

(assert (=> b!880603 (= c!93123 (validKeyInArray!0 (select (arr!24647 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!880604 () Bool)

(declare-fun res!597992 () Bool)

(declare-fun e!490138 () Bool)

(assert (=> b!880604 (=> (not res!597992) (not e!490138))))

(assert (=> b!880604 (= res!597992 (not (contains!4232 lt!398093 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880599 () Bool)

(declare-fun e!490136 () Bool)

(assert (=> b!880599 (= e!490138 e!490136)))

(declare-fun c!93121 () Bool)

(assert (=> b!880599 (= c!93121 e!490141)))

(declare-fun res!597993 () Bool)

(assert (=> b!880599 (=> (not res!597993) (not e!490141))))

(assert (=> b!880599 (= res!597993 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25088 _keys!868)))))

(declare-fun d!109255 () Bool)

(assert (=> d!109255 e!490138))

(declare-fun res!597995 () Bool)

(assert (=> d!109255 (=> (not res!597995) (not e!490138))))

(assert (=> d!109255 (= res!597995 (not (contains!4232 lt!398093 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109255 (= lt!398093 e!490140)))

(declare-fun c!93124 () Bool)

(assert (=> d!109255 (= c!93124 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25088 _keys!868)))))

(assert (=> d!109255 (validMask!0 mask!1196)))

(assert (=> d!109255 (= (getCurrentListMapNoExtraKeys!3246 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398093)))

(declare-fun b!880605 () Bool)

(assert (=> b!880605 (= e!490136 e!490139)))

(declare-fun c!93122 () Bool)

(assert (=> b!880605 (= c!93122 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25088 _keys!868)))))

(declare-fun b!880606 () Bool)

(assert (=> b!880606 (= e!490136 e!490135)))

(assert (=> b!880606 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25088 _keys!868)))))

(declare-fun res!597994 () Bool)

(assert (=> b!880606 (= res!597994 (contains!4232 lt!398093 (select (arr!24647 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880606 (=> (not res!597994) (not e!490135))))

(assert (= (and d!109255 c!93124) b!880595))

(assert (= (and d!109255 (not c!93124)) b!880603))

(assert (= (and b!880603 c!93123) b!880601))

(assert (= (and b!880603 (not c!93123)) b!880600))

(assert (= (or b!880601 b!880600) bm!38919))

(assert (= (and d!109255 res!597995) b!880604))

(assert (= (and b!880604 res!597992) b!880599))

(assert (= (and b!880599 res!597993) b!880602))

(assert (= (and b!880599 c!93121) b!880606))

(assert (= (and b!880599 (not c!93121)) b!880605))

(assert (= (and b!880606 res!597994) b!880597))

(assert (= (and b!880605 c!93122) b!880598))

(assert (= (and b!880605 (not c!93122)) b!880596))

(declare-fun b_lambda!12405 () Bool)

(assert (=> (not b_lambda!12405) (not b!880597)))

(assert (=> b!880597 t!24531))

(declare-fun b_and!25235 () Bool)

(assert (= b_and!25233 (and (=> t!24531 result!9533) b_and!25235)))

(declare-fun b_lambda!12407 () Bool)

(assert (=> (not b_lambda!12407) (not b!880601)))

(assert (=> b!880601 t!24531))

(declare-fun b_and!25237 () Bool)

(assert (= b_and!25235 (and (=> t!24531 result!9533) b_and!25237)))

(assert (=> b!880597 m!820583))

(declare-fun m!820749 () Bool)

(assert (=> b!880597 m!820749))

(declare-fun m!820751 () Bool)

(assert (=> b!880597 m!820751))

(assert (=> b!880597 m!820749))

(declare-fun m!820753 () Bool)

(assert (=> b!880597 m!820753))

(assert (=> b!880597 m!820753))

(assert (=> b!880597 m!820583))

(declare-fun m!820755 () Bool)

(assert (=> b!880597 m!820755))

(declare-fun m!820757 () Bool)

(assert (=> b!880604 m!820757))

(assert (=> b!880602 m!820749))

(assert (=> b!880602 m!820749))

(declare-fun m!820759 () Bool)

(assert (=> b!880602 m!820759))

(declare-fun m!820761 () Bool)

(assert (=> d!109255 m!820761))

(assert (=> d!109255 m!820613))

(assert (=> b!880603 m!820749))

(assert (=> b!880603 m!820749))

(assert (=> b!880603 m!820759))

(assert (=> b!880606 m!820749))

(assert (=> b!880606 m!820749))

(declare-fun m!820763 () Bool)

(assert (=> b!880606 m!820763))

(declare-fun m!820765 () Bool)

(assert (=> b!880596 m!820765))

(assert (=> b!880601 m!820583))

(declare-fun m!820767 () Bool)

(assert (=> b!880601 m!820767))

(declare-fun m!820769 () Bool)

(assert (=> b!880601 m!820769))

(assert (=> b!880601 m!820749))

(assert (=> b!880601 m!820753))

(assert (=> b!880601 m!820767))

(declare-fun m!820771 () Bool)

(assert (=> b!880601 m!820771))

(declare-fun m!820773 () Bool)

(assert (=> b!880601 m!820773))

(assert (=> b!880601 m!820753))

(assert (=> b!880601 m!820583))

(assert (=> b!880601 m!820755))

(declare-fun m!820775 () Bool)

(assert (=> bm!38919 m!820775))

(assert (=> b!880598 m!820775))

(assert (=> b!880451 d!109255))

(declare-fun d!109257 () Bool)

(assert (=> d!109257 (= (validKeyInArray!0 (select (arr!24647 _keys!868) from!1053)) (and (not (= (select (arr!24647 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24647 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!880451 d!109257))

(declare-fun b!880607 () Bool)

(declare-fun e!490147 () ListLongMap!10377)

(assert (=> b!880607 (= e!490147 (ListLongMap!10378 Nil!17434))))

(declare-fun b!880608 () Bool)

(declare-fun e!490146 () Bool)

(declare-fun lt!398100 () ListLongMap!10377)

(assert (=> b!880608 (= e!490146 (isEmpty!672 lt!398100))))

(declare-fun b!880609 () Bool)

(assert (=> b!880609 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25088 _keys!868)))))

(assert (=> b!880609 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25089 lt!398016)))))

(declare-fun e!490142 () Bool)

(assert (=> b!880609 (= e!490142 (= (apply!379 lt!398100 (select (arr!24647 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12973 (select (arr!24648 lt!398016) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!880610 () Bool)

(assert (=> b!880610 (= e!490146 (= lt!398100 (getCurrentListMapNoExtraKeys!3246 _keys!868 lt!398016 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!880612 () Bool)

(declare-fun e!490144 () ListLongMap!10377)

(declare-fun call!38923 () ListLongMap!10377)

(assert (=> b!880612 (= e!490144 call!38923)))

(declare-fun b!880613 () Bool)

(declare-fun lt!398103 () Unit!30012)

(declare-fun lt!398099 () Unit!30012)

(assert (=> b!880613 (= lt!398103 lt!398099)))

(declare-fun lt!398105 () ListLongMap!10377)

(declare-fun lt!398102 () (_ BitVec 64))

(declare-fun lt!398104 () V!28441)

(declare-fun lt!398101 () (_ BitVec 64))

(assert (=> b!880613 (not (contains!4232 (+!2521 lt!398105 (tuple2!11607 lt!398102 lt!398104)) lt!398101))))

(assert (=> b!880613 (= lt!398099 (addStillNotContains!206 lt!398105 lt!398102 lt!398104 lt!398101))))

(assert (=> b!880613 (= lt!398101 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!880613 (= lt!398104 (get!12973 (select (arr!24648 lt!398016) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!880613 (= lt!398102 (select (arr!24647 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!880613 (= lt!398105 call!38923)))

(assert (=> b!880613 (= e!490144 (+!2521 call!38923 (tuple2!11607 (select (arr!24647 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12973 (select (arr!24648 lt!398016) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!38920 () Bool)

(assert (=> bm!38920 (= call!38923 (getCurrentListMapNoExtraKeys!3246 _keys!868 lt!398016 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!880614 () Bool)

(declare-fun e!490148 () Bool)

(assert (=> b!880614 (= e!490148 (validKeyInArray!0 (select (arr!24647 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880614 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!880615 () Bool)

(assert (=> b!880615 (= e!490147 e!490144)))

(declare-fun c!93127 () Bool)

(assert (=> b!880615 (= c!93127 (validKeyInArray!0 (select (arr!24647 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!880616 () Bool)

(declare-fun res!597996 () Bool)

(declare-fun e!490145 () Bool)

(assert (=> b!880616 (=> (not res!597996) (not e!490145))))

(assert (=> b!880616 (= res!597996 (not (contains!4232 lt!398100 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880611 () Bool)

(declare-fun e!490143 () Bool)

(assert (=> b!880611 (= e!490145 e!490143)))

(declare-fun c!93125 () Bool)

(assert (=> b!880611 (= c!93125 e!490148)))

(declare-fun res!597997 () Bool)

(assert (=> b!880611 (=> (not res!597997) (not e!490148))))

(assert (=> b!880611 (= res!597997 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25088 _keys!868)))))

(declare-fun d!109259 () Bool)

(assert (=> d!109259 e!490145))

(declare-fun res!597999 () Bool)

(assert (=> d!109259 (=> (not res!597999) (not e!490145))))

(assert (=> d!109259 (= res!597999 (not (contains!4232 lt!398100 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109259 (= lt!398100 e!490147)))

(declare-fun c!93128 () Bool)

(assert (=> d!109259 (= c!93128 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25088 _keys!868)))))

(assert (=> d!109259 (validMask!0 mask!1196)))

(assert (=> d!109259 (= (getCurrentListMapNoExtraKeys!3246 _keys!868 lt!398016 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398100)))

(declare-fun b!880617 () Bool)

(assert (=> b!880617 (= e!490143 e!490146)))

(declare-fun c!93126 () Bool)

(assert (=> b!880617 (= c!93126 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25088 _keys!868)))))

(declare-fun b!880618 () Bool)

(assert (=> b!880618 (= e!490143 e!490142)))

(assert (=> b!880618 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25088 _keys!868)))))

(declare-fun res!597998 () Bool)

(assert (=> b!880618 (= res!597998 (contains!4232 lt!398100 (select (arr!24647 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!880618 (=> (not res!597998) (not e!490142))))

(assert (= (and d!109259 c!93128) b!880607))

(assert (= (and d!109259 (not c!93128)) b!880615))

(assert (= (and b!880615 c!93127) b!880613))

(assert (= (and b!880615 (not c!93127)) b!880612))

(assert (= (or b!880613 b!880612) bm!38920))

(assert (= (and d!109259 res!597999) b!880616))

(assert (= (and b!880616 res!597996) b!880611))

(assert (= (and b!880611 res!597997) b!880614))

(assert (= (and b!880611 c!93125) b!880618))

(assert (= (and b!880611 (not c!93125)) b!880617))

(assert (= (and b!880618 res!597998) b!880609))

(assert (= (and b!880617 c!93126) b!880610))

(assert (= (and b!880617 (not c!93126)) b!880608))

(declare-fun b_lambda!12409 () Bool)

(assert (=> (not b_lambda!12409) (not b!880609)))

(assert (=> b!880609 t!24531))

(declare-fun b_and!25239 () Bool)

(assert (= b_and!25237 (and (=> t!24531 result!9533) b_and!25239)))

(declare-fun b_lambda!12411 () Bool)

(assert (=> (not b_lambda!12411) (not b!880613)))

(assert (=> b!880613 t!24531))

(declare-fun b_and!25241 () Bool)

(assert (= b_and!25239 (and (=> t!24531 result!9533) b_and!25241)))

(assert (=> b!880609 m!820583))

(assert (=> b!880609 m!820749))

(declare-fun m!820777 () Bool)

(assert (=> b!880609 m!820777))

(assert (=> b!880609 m!820749))

(declare-fun m!820779 () Bool)

(assert (=> b!880609 m!820779))

(assert (=> b!880609 m!820779))

(assert (=> b!880609 m!820583))

(declare-fun m!820781 () Bool)

(assert (=> b!880609 m!820781))

(declare-fun m!820783 () Bool)

(assert (=> b!880616 m!820783))

(assert (=> b!880614 m!820749))

(assert (=> b!880614 m!820749))

(assert (=> b!880614 m!820759))

(declare-fun m!820785 () Bool)

(assert (=> d!109259 m!820785))

(assert (=> d!109259 m!820613))

(assert (=> b!880615 m!820749))

(assert (=> b!880615 m!820749))

(assert (=> b!880615 m!820759))

(assert (=> b!880618 m!820749))

(assert (=> b!880618 m!820749))

(declare-fun m!820787 () Bool)

(assert (=> b!880618 m!820787))

(declare-fun m!820789 () Bool)

(assert (=> b!880608 m!820789))

(assert (=> b!880613 m!820583))

(declare-fun m!820791 () Bool)

(assert (=> b!880613 m!820791))

(declare-fun m!820793 () Bool)

(assert (=> b!880613 m!820793))

(assert (=> b!880613 m!820749))

(assert (=> b!880613 m!820779))

(assert (=> b!880613 m!820791))

(declare-fun m!820795 () Bool)

(assert (=> b!880613 m!820795))

(declare-fun m!820797 () Bool)

(assert (=> b!880613 m!820797))

(assert (=> b!880613 m!820779))

(assert (=> b!880613 m!820583))

(assert (=> b!880613 m!820781))

(declare-fun m!820799 () Bool)

(assert (=> bm!38920 m!820799))

(assert (=> b!880610 m!820799))

(assert (=> b!880451 d!109259))

(declare-fun d!109261 () Bool)

(declare-fun e!490151 () Bool)

(assert (=> d!109261 e!490151))

(declare-fun res!598005 () Bool)

(assert (=> d!109261 (=> (not res!598005) (not e!490151))))

(declare-fun lt!398115 () ListLongMap!10377)

(assert (=> d!109261 (= res!598005 (contains!4232 lt!398115 (_1!5814 (tuple2!11607 k0!854 v!557))))))

(declare-fun lt!398116 () List!17437)

(assert (=> d!109261 (= lt!398115 (ListLongMap!10378 lt!398116))))

(declare-fun lt!398114 () Unit!30012)

(declare-fun lt!398117 () Unit!30012)

(assert (=> d!109261 (= lt!398114 lt!398117)))

(declare-datatypes ((Option!428 0))(
  ( (Some!427 (v!11270 V!28441)) (None!426) )
))
(declare-fun getValueByKey!422 (List!17437 (_ BitVec 64)) Option!428)

(assert (=> d!109261 (= (getValueByKey!422 lt!398116 (_1!5814 (tuple2!11607 k0!854 v!557))) (Some!427 (_2!5814 (tuple2!11607 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!236 (List!17437 (_ BitVec 64) V!28441) Unit!30012)

(assert (=> d!109261 (= lt!398117 (lemmaContainsTupThenGetReturnValue!236 lt!398116 (_1!5814 (tuple2!11607 k0!854 v!557)) (_2!5814 (tuple2!11607 k0!854 v!557))))))

(declare-fun insertStrictlySorted!275 (List!17437 (_ BitVec 64) V!28441) List!17437)

(assert (=> d!109261 (= lt!398116 (insertStrictlySorted!275 (toList!5204 lt!398018) (_1!5814 (tuple2!11607 k0!854 v!557)) (_2!5814 (tuple2!11607 k0!854 v!557))))))

(assert (=> d!109261 (= (+!2521 lt!398018 (tuple2!11607 k0!854 v!557)) lt!398115)))

(declare-fun b!880623 () Bool)

(declare-fun res!598004 () Bool)

(assert (=> b!880623 (=> (not res!598004) (not e!490151))))

(assert (=> b!880623 (= res!598004 (= (getValueByKey!422 (toList!5204 lt!398115) (_1!5814 (tuple2!11607 k0!854 v!557))) (Some!427 (_2!5814 (tuple2!11607 k0!854 v!557)))))))

(declare-fun b!880624 () Bool)

(declare-fun contains!4233 (List!17437 tuple2!11606) Bool)

(assert (=> b!880624 (= e!490151 (contains!4233 (toList!5204 lt!398115) (tuple2!11607 k0!854 v!557)))))

(assert (= (and d!109261 res!598005) b!880623))

(assert (= (and b!880623 res!598004) b!880624))

(declare-fun m!820801 () Bool)

(assert (=> d!109261 m!820801))

(declare-fun m!820803 () Bool)

(assert (=> d!109261 m!820803))

(declare-fun m!820805 () Bool)

(assert (=> d!109261 m!820805))

(declare-fun m!820807 () Bool)

(assert (=> d!109261 m!820807))

(declare-fun m!820809 () Bool)

(assert (=> b!880623 m!820809))

(declare-fun m!820811 () Bool)

(assert (=> b!880624 m!820811))

(assert (=> b!880451 d!109261))

(declare-fun bm!38925 () Bool)

(declare-fun call!38929 () ListLongMap!10377)

(assert (=> bm!38925 (= call!38929 (getCurrentListMapNoExtraKeys!3246 _keys!868 (array!51256 (store (arr!24648 _values!688) i!612 (ValueCellFull!8333 v!557)) (size!25089 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!38928 () ListLongMap!10377)

(declare-fun bm!38926 () Bool)

(assert (=> bm!38926 (= call!38928 (getCurrentListMapNoExtraKeys!3246 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880631 () Bool)

(declare-fun e!490156 () Bool)

(assert (=> b!880631 (= e!490156 (= call!38929 call!38928))))

(declare-fun b!880632 () Bool)

(assert (=> b!880632 (= e!490156 (= call!38929 (+!2521 call!38928 (tuple2!11607 k0!854 v!557))))))

(declare-fun d!109263 () Bool)

(declare-fun e!490157 () Bool)

(assert (=> d!109263 e!490157))

(declare-fun res!598008 () Bool)

(assert (=> d!109263 (=> (not res!598008) (not e!490157))))

(assert (=> d!109263 (= res!598008 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25089 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25089 _values!688))))))))

(declare-fun lt!398120 () Unit!30012)

(declare-fun choose!1441 (array!51253 array!51255 (_ BitVec 32) (_ BitVec 32) V!28441 V!28441 (_ BitVec 32) (_ BitVec 64) V!28441 (_ BitVec 32) Int) Unit!30012)

(assert (=> d!109263 (= lt!398120 (choose!1441 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109263 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25088 _keys!868)))))

(assert (=> d!109263 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!688 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398120)))

(declare-fun b!880633 () Bool)

(assert (=> b!880633 (= e!490157 e!490156)))

(declare-fun c!93131 () Bool)

(assert (=> b!880633 (= c!93131 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(assert (= (and d!109263 res!598008) b!880633))

(assert (= (and b!880633 c!93131) b!880632))

(assert (= (and b!880633 (not c!93131)) b!880631))

(assert (= (or b!880632 b!880631) bm!38926))

(assert (= (or b!880632 b!880631) bm!38925))

(assert (=> bm!38925 m!820617))

(declare-fun m!820813 () Bool)

(assert (=> bm!38925 m!820813))

(assert (=> bm!38926 m!820599))

(declare-fun m!820815 () Bool)

(assert (=> b!880632 m!820815))

(declare-fun m!820817 () Bool)

(assert (=> d!109263 m!820817))

(assert (=> b!880451 d!109263))

(declare-fun d!109265 () Bool)

(assert (=> d!109265 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!880458 d!109265))

(declare-fun d!109267 () Bool)

(assert (=> d!109267 (= (array_inv!19458 _keys!868) (bvsge (size!25088 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74800 d!109267))

(declare-fun d!109269 () Bool)

(assert (=> d!109269 (= (array_inv!19459 _values!688) (bvsge (size!25089 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74800 d!109269))

(declare-fun d!109271 () Bool)

(assert (=> d!109271 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!880462 d!109271))

(declare-fun b!880642 () Bool)

(declare-fun e!490166 () Bool)

(declare-fun call!38932 () Bool)

(assert (=> b!880642 (= e!490166 call!38932)))

(declare-fun b!880643 () Bool)

(declare-fun e!490164 () Bool)

(assert (=> b!880643 (= e!490164 e!490166)))

(declare-fun c!93134 () Bool)

(assert (=> b!880643 (= c!93134 (validKeyInArray!0 (select (arr!24647 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!880644 () Bool)

(declare-fun e!490165 () Bool)

(assert (=> b!880644 (= e!490166 e!490165)))

(declare-fun lt!398128 () (_ BitVec 64))

(assert (=> b!880644 (= lt!398128 (select (arr!24647 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!398129 () Unit!30012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51253 (_ BitVec 64) (_ BitVec 32)) Unit!30012)

(assert (=> b!880644 (= lt!398129 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!398128 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!880644 (arrayContainsKey!0 _keys!868 lt!398128 #b00000000000000000000000000000000)))

(declare-fun lt!398127 () Unit!30012)

(assert (=> b!880644 (= lt!398127 lt!398129)))

(declare-fun res!598013 () Bool)

(declare-datatypes ((SeekEntryResult!8706 0))(
  ( (MissingZero!8706 (index!37195 (_ BitVec 32))) (Found!8706 (index!37196 (_ BitVec 32))) (Intermediate!8706 (undefined!9518 Bool) (index!37197 (_ BitVec 32)) (x!74477 (_ BitVec 32))) (Undefined!8706) (MissingVacant!8706 (index!37198 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51253 (_ BitVec 32)) SeekEntryResult!8706)

(assert (=> b!880644 (= res!598013 (= (seekEntryOrOpen!0 (select (arr!24647 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8706 #b00000000000000000000000000000000)))))

(assert (=> b!880644 (=> (not res!598013) (not e!490165))))

(declare-fun b!880645 () Bool)

(assert (=> b!880645 (= e!490165 call!38932)))

(declare-fun d!109273 () Bool)

(declare-fun res!598014 () Bool)

(assert (=> d!109273 (=> res!598014 e!490164)))

(assert (=> d!109273 (= res!598014 (bvsge #b00000000000000000000000000000000 (size!25088 _keys!868)))))

(assert (=> d!109273 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!490164)))

(declare-fun bm!38929 () Bool)

(assert (=> bm!38929 (= call!38932 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(assert (= (and d!109273 (not res!598014)) b!880643))

(assert (= (and b!880643 c!93134) b!880644))

(assert (= (and b!880643 (not c!93134)) b!880642))

(assert (= (and b!880644 res!598013) b!880645))

(assert (= (or b!880645 b!880642) bm!38929))

(declare-fun m!820819 () Bool)

(assert (=> b!880643 m!820819))

(assert (=> b!880643 m!820819))

(declare-fun m!820821 () Bool)

(assert (=> b!880643 m!820821))

(assert (=> b!880644 m!820819))

(declare-fun m!820823 () Bool)

(assert (=> b!880644 m!820823))

(declare-fun m!820825 () Bool)

(assert (=> b!880644 m!820825))

(assert (=> b!880644 m!820819))

(declare-fun m!820827 () Bool)

(assert (=> b!880644 m!820827))

(declare-fun m!820829 () Bool)

(assert (=> bm!38929 m!820829))

(assert (=> b!880453 d!109273))

(declare-fun b!880656 () Bool)

(declare-fun e!490176 () Bool)

(declare-fun e!490175 () Bool)

(assert (=> b!880656 (= e!490176 e!490175)))

(declare-fun c!93137 () Bool)

(assert (=> b!880656 (= c!93137 (validKeyInArray!0 (select (arr!24647 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!880657 () Bool)

(declare-fun e!490177 () Bool)

(declare-fun contains!4234 (List!17438 (_ BitVec 64)) Bool)

(assert (=> b!880657 (= e!490177 (contains!4234 Nil!17435 (select (arr!24647 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!109275 () Bool)

(declare-fun res!598022 () Bool)

(declare-fun e!490178 () Bool)

(assert (=> d!109275 (=> res!598022 e!490178)))

(assert (=> d!109275 (= res!598022 (bvsge #b00000000000000000000000000000000 (size!25088 _keys!868)))))

(assert (=> d!109275 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17435) e!490178)))

(declare-fun b!880658 () Bool)

(declare-fun call!38935 () Bool)

(assert (=> b!880658 (= e!490175 call!38935)))

(declare-fun b!880659 () Bool)

(assert (=> b!880659 (= e!490175 call!38935)))

(declare-fun b!880660 () Bool)

(assert (=> b!880660 (= e!490178 e!490176)))

(declare-fun res!598021 () Bool)

(assert (=> b!880660 (=> (not res!598021) (not e!490176))))

(assert (=> b!880660 (= res!598021 (not e!490177))))

(declare-fun res!598023 () Bool)

(assert (=> b!880660 (=> (not res!598023) (not e!490177))))

(assert (=> b!880660 (= res!598023 (validKeyInArray!0 (select (arr!24647 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38932 () Bool)

(assert (=> bm!38932 (= call!38935 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93137 (Cons!17434 (select (arr!24647 _keys!868) #b00000000000000000000000000000000) Nil!17435) Nil!17435)))))

(assert (= (and d!109275 (not res!598022)) b!880660))

(assert (= (and b!880660 res!598023) b!880657))

(assert (= (and b!880660 res!598021) b!880656))

(assert (= (and b!880656 c!93137) b!880658))

(assert (= (and b!880656 (not c!93137)) b!880659))

(assert (= (or b!880658 b!880659) bm!38932))

(assert (=> b!880656 m!820819))

(assert (=> b!880656 m!820819))

(assert (=> b!880656 m!820821))

(assert (=> b!880657 m!820819))

(assert (=> b!880657 m!820819))

(declare-fun m!820831 () Bool)

(assert (=> b!880657 m!820831))

(assert (=> b!880660 m!820819))

(assert (=> b!880660 m!820819))

(assert (=> b!880660 m!820821))

(assert (=> bm!38932 m!820819))

(declare-fun m!820833 () Bool)

(assert (=> bm!38932 m!820833))

(assert (=> b!880452 d!109275))

(declare-fun d!109277 () Bool)

(declare-fun e!490179 () Bool)

(assert (=> d!109277 e!490179))

(declare-fun res!598025 () Bool)

(assert (=> d!109277 (=> (not res!598025) (not e!490179))))

(declare-fun lt!398131 () ListLongMap!10377)

(assert (=> d!109277 (= res!598025 (contains!4232 lt!398131 (_1!5814 (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!398132 () List!17437)

(assert (=> d!109277 (= lt!398131 (ListLongMap!10378 lt!398132))))

(declare-fun lt!398130 () Unit!30012)

(declare-fun lt!398133 () Unit!30012)

(assert (=> d!109277 (= lt!398130 lt!398133)))

(assert (=> d!109277 (= (getValueByKey!422 lt!398132 (_1!5814 (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!427 (_2!5814 (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109277 (= lt!398133 (lemmaContainsTupThenGetReturnValue!236 lt!398132 (_1!5814 (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5814 (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109277 (= lt!398132 (insertStrictlySorted!275 (toList!5204 lt!398020) (_1!5814 (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5814 (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109277 (= (+!2521 lt!398020 (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!398131)))

(declare-fun b!880661 () Bool)

(declare-fun res!598024 () Bool)

(assert (=> b!880661 (=> (not res!598024) (not e!490179))))

(assert (=> b!880661 (= res!598024 (= (getValueByKey!422 (toList!5204 lt!398131) (_1!5814 (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!427 (_2!5814 (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!880662 () Bool)

(assert (=> b!880662 (= e!490179 (contains!4233 (toList!5204 lt!398131) (tuple2!11607 (select (arr!24647 _keys!868) from!1053) (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109277 res!598025) b!880661))

(assert (= (and b!880661 res!598024) b!880662))

(declare-fun m!820835 () Bool)

(assert (=> d!109277 m!820835))

(declare-fun m!820837 () Bool)

(assert (=> d!109277 m!820837))

(declare-fun m!820839 () Bool)

(assert (=> d!109277 m!820839))

(declare-fun m!820841 () Bool)

(assert (=> d!109277 m!820841))

(declare-fun m!820843 () Bool)

(assert (=> b!880661 m!820843))

(declare-fun m!820845 () Bool)

(assert (=> b!880662 m!820845))

(assert (=> b!880460 d!109277))

(declare-fun d!109279 () Bool)

(declare-fun c!93140 () Bool)

(assert (=> d!109279 (= c!93140 ((_ is ValueCellFull!8333) (select (arr!24648 _values!688) from!1053)))))

(declare-fun e!490182 () V!28441)

(assert (=> d!109279 (= (get!12973 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!490182)))

(declare-fun b!880667 () Bool)

(declare-fun get!12975 (ValueCell!8333 V!28441) V!28441)

(assert (=> b!880667 (= e!490182 (get!12975 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!880668 () Bool)

(declare-fun get!12976 (ValueCell!8333 V!28441) V!28441)

(assert (=> b!880668 (= e!490182 (get!12976 (select (arr!24648 _values!688) from!1053) (dynLambda!1246 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109279 c!93140) b!880667))

(assert (= (and d!109279 (not c!93140)) b!880668))

(assert (=> b!880667 m!820581))

(assert (=> b!880667 m!820583))

(declare-fun m!820847 () Bool)

(assert (=> b!880667 m!820847))

(assert (=> b!880668 m!820581))

(assert (=> b!880668 m!820583))

(declare-fun m!820849 () Bool)

(assert (=> b!880668 m!820849))

(assert (=> b!880460 d!109279))

(declare-fun b!880676 () Bool)

(declare-fun e!490188 () Bool)

(assert (=> b!880676 (= e!490188 tp_is_empty!17545)))

(declare-fun condMapEmpty!27945 () Bool)

(declare-fun mapDefault!27945 () ValueCell!8333)

(assert (=> mapNonEmpty!27936 (= condMapEmpty!27945 (= mapRest!27936 ((as const (Array (_ BitVec 32) ValueCell!8333)) mapDefault!27945)))))

(declare-fun mapRes!27945 () Bool)

(assert (=> mapNonEmpty!27936 (= tp!53588 (and e!490188 mapRes!27945))))

(declare-fun b!880675 () Bool)

(declare-fun e!490187 () Bool)

(assert (=> b!880675 (= e!490187 tp_is_empty!17545)))

(declare-fun mapIsEmpty!27945 () Bool)

(assert (=> mapIsEmpty!27945 mapRes!27945))

(declare-fun mapNonEmpty!27945 () Bool)

(declare-fun tp!53604 () Bool)

(assert (=> mapNonEmpty!27945 (= mapRes!27945 (and tp!53604 e!490187))))

(declare-fun mapKey!27945 () (_ BitVec 32))

(declare-fun mapValue!27945 () ValueCell!8333)

(declare-fun mapRest!27945 () (Array (_ BitVec 32) ValueCell!8333))

(assert (=> mapNonEmpty!27945 (= mapRest!27936 (store mapRest!27945 mapKey!27945 mapValue!27945))))

(assert (= (and mapNonEmpty!27936 condMapEmpty!27945) mapIsEmpty!27945))

(assert (= (and mapNonEmpty!27936 (not condMapEmpty!27945)) mapNonEmpty!27945))

(assert (= (and mapNonEmpty!27945 ((_ is ValueCellFull!8333) mapValue!27945)) b!880675))

(assert (= (and mapNonEmpty!27936 ((_ is ValueCellFull!8333) mapDefault!27945)) b!880676))

(declare-fun m!820851 () Bool)

(assert (=> mapNonEmpty!27945 m!820851))

(declare-fun b_lambda!12413 () Bool)

(assert (= b_lambda!12407 (or (and start!74800 b_free!15301) b_lambda!12413)))

(declare-fun b_lambda!12415 () Bool)

(assert (= b_lambda!12411 (or (and start!74800 b_free!15301) b_lambda!12415)))

(declare-fun b_lambda!12417 () Bool)

(assert (= b_lambda!12397 (or (and start!74800 b_free!15301) b_lambda!12417)))

(declare-fun b_lambda!12419 () Bool)

(assert (= b_lambda!12399 (or (and start!74800 b_free!15301) b_lambda!12419)))

(declare-fun b_lambda!12421 () Bool)

(assert (= b_lambda!12401 (or (and start!74800 b_free!15301) b_lambda!12421)))

(declare-fun b_lambda!12423 () Bool)

(assert (= b_lambda!12403 (or (and start!74800 b_free!15301) b_lambda!12423)))

(declare-fun b_lambda!12425 () Bool)

(assert (= b_lambda!12409 (or (and start!74800 b_free!15301) b_lambda!12425)))

(declare-fun b_lambda!12427 () Bool)

(assert (= b_lambda!12405 (or (and start!74800 b_free!15301) b_lambda!12427)))

(check-sat (not b!880662) (not b!880573) (not b!880657) (not b!880604) (not b!880590) (not b!880584) (not b_lambda!12419) (not b!880596) (not bm!38919) (not b!880656) (not b!880624) (not b!880610) (not b!880609) (not b!880572) b_and!25241 tp_is_empty!17545 (not bm!38932) (not b!880582) (not b!880668) (not b!880594) (not bm!38925) (not b!880578) (not b!880643) (not mapNonEmpty!27945) (not b!880615) (not d!109259) (not b!880613) (not b!880606) (not b!880597) (not b!880614) (not b!880598) (not d!109251) (not b_lambda!12425) (not d!109253) (not b!880667) (not b!880602) (not b!880661) (not b_lambda!12415) (not b!880608) (not b!880644) (not b!880601) (not b!880574) (not d!109277) (not d!109263) (not b!880577) (not b_lambda!12423) (not bm!38926) (not b_lambda!12395) (not b_lambda!12417) (not b!880632) (not b!880579) (not b!880623) (not d!109255) (not b!880616) (not bm!38920) (not b!880580) (not bm!38929) (not b!880603) (not b!880618) (not b!880585) (not b!880589) (not bm!38918) (not b_lambda!12413) (not b_lambda!12421) (not b!880592) (not b!880660) (not d!109261) (not b!880586) (not b_next!15301) (not b!880591) (not bm!38917) (not b_lambda!12427))
(check-sat b_and!25241 (not b_next!15301))
