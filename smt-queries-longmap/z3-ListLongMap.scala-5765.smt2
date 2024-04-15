; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74420 () Bool)

(assert start!74420)

(declare-fun b_free!15181 () Bool)

(declare-fun b_next!15181 () Bool)

(assert (=> start!74420 (= b_free!15181 (not b_next!15181))))

(declare-fun tp!53222 () Bool)

(declare-fun b_and!24989 () Bool)

(assert (=> start!74420 (= tp!53222 b_and!24989)))

(declare-fun b!876525 () Bool)

(declare-fun e!487908 () Bool)

(declare-fun tp_is_empty!17425 () Bool)

(assert (=> b!876525 (= e!487908 tp_is_empty!17425)))

(declare-fun b!876526 () Bool)

(declare-fun res!595657 () Bool)

(declare-fun e!487907 () Bool)

(assert (=> b!876526 (=> (not res!595657) (not e!487907))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50955 0))(
  ( (array!50956 (arr!24505 (Array (_ BitVec 32) (_ BitVec 64))) (size!24947 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50955)

(declare-datatypes ((V!28281 0))(
  ( (V!28282 (val!8760 Int)) )
))
(declare-datatypes ((ValueCell!8273 0))(
  ( (ValueCellFull!8273 (v!11187 V!28281)) (EmptyCell!8273) )
))
(declare-datatypes ((array!50957 0))(
  ( (array!50958 (arr!24506 (Array (_ BitVec 32) ValueCell!8273)) (size!24948 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50957)

(assert (=> b!876526 (= res!595657 (and (= (size!24948 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24947 _keys!868) (size!24948 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876527 () Bool)

(declare-fun e!487911 () Bool)

(declare-fun e!487906 () Bool)

(assert (=> b!876527 (= e!487911 (not e!487906))))

(declare-fun res!595658 () Bool)

(assert (=> b!876527 (=> res!595658 e!487906)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876527 (= res!595658 (not (validKeyInArray!0 (select (arr!24505 _keys!868) from!1053))))))

(declare-fun e!487910 () Bool)

(assert (=> b!876527 e!487910))

(declare-fun c!92556 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876527 (= c!92556 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!28281)

(declare-fun defaultEntry!696 () Int)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!28281)

(declare-fun zeroValue!654 () V!28281)

(declare-datatypes ((Unit!29927 0))(
  ( (Unit!29928) )
))
(declare-fun lt!396457 () Unit!29927)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!686 (array!50955 array!50957 (_ BitVec 32) (_ BitVec 32) V!28281 V!28281 (_ BitVec 32) (_ BitVec 64) V!28281 (_ BitVec 32) Int) Unit!29927)

(assert (=> b!876527 (= lt!396457 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!686 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876528 () Bool)

(assert (=> b!876528 (= e!487907 e!487911)))

(declare-fun res!595654 () Bool)

(assert (=> b!876528 (=> (not res!595654) (not e!487911))))

(assert (=> b!876528 (= res!595654 (= from!1053 i!612))))

(declare-datatypes ((tuple2!11594 0))(
  ( (tuple2!11595 (_1!5808 (_ BitVec 64)) (_2!5808 V!28281)) )
))
(declare-datatypes ((List!17398 0))(
  ( (Nil!17395) (Cons!17394 (h!18525 tuple2!11594) (t!24474 List!17398)) )
))
(declare-datatypes ((ListLongMap!10353 0))(
  ( (ListLongMap!10354 (toList!5192 List!17398)) )
))
(declare-fun lt!396451 () ListLongMap!10353)

(declare-fun lt!396449 () array!50957)

(declare-fun getCurrentListMapNoExtraKeys!3185 (array!50955 array!50957 (_ BitVec 32) (_ BitVec 32) V!28281 V!28281 (_ BitVec 32) Int) ListLongMap!10353)

(assert (=> b!876528 (= lt!396451 (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!876528 (= lt!396449 (array!50958 (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24948 _values!688)))))

(declare-fun lt!396455 () ListLongMap!10353)

(assert (=> b!876528 (= lt!396455 (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27749 () Bool)

(declare-fun mapRes!27749 () Bool)

(declare-fun tp!53221 () Bool)

(declare-fun e!487909 () Bool)

(assert (=> mapNonEmpty!27749 (= mapRes!27749 (and tp!53221 e!487909))))

(declare-fun mapRest!27749 () (Array (_ BitVec 32) ValueCell!8273))

(declare-fun mapKey!27749 () (_ BitVec 32))

(declare-fun mapValue!27749 () ValueCell!8273)

(assert (=> mapNonEmpty!27749 (= (arr!24506 _values!688) (store mapRest!27749 mapKey!27749 mapValue!27749))))

(declare-fun res!595659 () Bool)

(assert (=> start!74420 (=> (not res!595659) (not e!487907))))

(assert (=> start!74420 (= res!595659 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24947 _keys!868))))))

(assert (=> start!74420 e!487907))

(assert (=> start!74420 tp_is_empty!17425))

(assert (=> start!74420 true))

(assert (=> start!74420 tp!53222))

(declare-fun array_inv!19360 (array!50955) Bool)

(assert (=> start!74420 (array_inv!19360 _keys!868)))

(declare-fun e!487912 () Bool)

(declare-fun array_inv!19361 (array!50957) Bool)

(assert (=> start!74420 (and (array_inv!19361 _values!688) e!487912)))

(declare-fun b!876529 () Bool)

(declare-fun res!595656 () Bool)

(assert (=> b!876529 (=> (not res!595656) (not e!487907))))

(assert (=> b!876529 (= res!595656 (and (= (select (arr!24505 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!876530 () Bool)

(declare-fun res!595652 () Bool)

(assert (=> b!876530 (=> (not res!595652) (not e!487907))))

(assert (=> b!876530 (= res!595652 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24947 _keys!868))))))

(declare-fun bm!38757 () Bool)

(declare-fun call!38760 () ListLongMap!10353)

(assert (=> bm!38757 (= call!38760 (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27749 () Bool)

(assert (=> mapIsEmpty!27749 mapRes!27749))

(declare-fun b!876531 () Bool)

(declare-fun +!2517 (ListLongMap!10353 tuple2!11594) ListLongMap!10353)

(assert (=> b!876531 (= e!487906 (= lt!396451 (+!2517 lt!396455 (tuple2!11595 k0!854 v!557))))))

(declare-fun lt!396453 () tuple2!11594)

(declare-fun lt!396456 () V!28281)

(declare-fun lt!396450 () ListLongMap!10353)

(assert (=> b!876531 (= (+!2517 lt!396450 lt!396453) (+!2517 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456)) lt!396453))))

(declare-fun lt!396448 () V!28281)

(assert (=> b!876531 (= lt!396453 (tuple2!11595 k0!854 lt!396448))))

(declare-fun lt!396454 () Unit!29927)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!327 (ListLongMap!10353 (_ BitVec 64) V!28281 V!28281) Unit!29927)

(assert (=> b!876531 (= lt!396454 (addSameAsAddTwiceSameKeyDiffValues!327 lt!396450 k0!854 lt!396456 lt!396448))))

(declare-fun lt!396452 () V!28281)

(declare-fun get!12898 (ValueCell!8273 V!28281) V!28281)

(assert (=> b!876531 (= lt!396456 (get!12898 (select (arr!24506 _values!688) from!1053) lt!396452))))

(assert (=> b!876531 (= lt!396451 (+!2517 lt!396450 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))

(assert (=> b!876531 (= lt!396448 (get!12898 (select (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053) lt!396452))))

(declare-fun dynLambda!1219 (Int (_ BitVec 64)) V!28281)

(assert (=> b!876531 (= lt!396452 (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!876531 (= lt!396450 (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876532 () Bool)

(assert (=> b!876532 (= e!487909 tp_is_empty!17425)))

(declare-fun b!876533 () Bool)

(declare-fun res!595651 () Bool)

(assert (=> b!876533 (=> (not res!595651) (not e!487907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876533 (= res!595651 (validMask!0 mask!1196))))

(declare-fun b!876534 () Bool)

(declare-fun call!38761 () ListLongMap!10353)

(assert (=> b!876534 (= e!487910 (= call!38761 call!38760))))

(declare-fun b!876535 () Bool)

(declare-fun res!595655 () Bool)

(assert (=> b!876535 (=> (not res!595655) (not e!487907))))

(assert (=> b!876535 (= res!595655 (validKeyInArray!0 k0!854))))

(declare-fun b!876536 () Bool)

(assert (=> b!876536 (= e!487910 (= call!38761 (+!2517 call!38760 (tuple2!11595 k0!854 v!557))))))

(declare-fun b!876537 () Bool)

(declare-fun res!595650 () Bool)

(assert (=> b!876537 (=> (not res!595650) (not e!487907))))

(declare-datatypes ((List!17399 0))(
  ( (Nil!17396) (Cons!17395 (h!18526 (_ BitVec 64)) (t!24475 List!17399)) )
))
(declare-fun arrayNoDuplicates!0 (array!50955 (_ BitVec 32) List!17399) Bool)

(assert (=> b!876537 (= res!595650 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17396))))

(declare-fun bm!38758 () Bool)

(assert (=> bm!38758 (= call!38761 (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876538 () Bool)

(declare-fun res!595653 () Bool)

(assert (=> b!876538 (=> (not res!595653) (not e!487907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50955 (_ BitVec 32)) Bool)

(assert (=> b!876538 (= res!595653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876539 () Bool)

(assert (=> b!876539 (= e!487912 (and e!487908 mapRes!27749))))

(declare-fun condMapEmpty!27749 () Bool)

(declare-fun mapDefault!27749 () ValueCell!8273)

(assert (=> b!876539 (= condMapEmpty!27749 (= (arr!24506 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8273)) mapDefault!27749)))))

(assert (= (and start!74420 res!595659) b!876533))

(assert (= (and b!876533 res!595651) b!876526))

(assert (= (and b!876526 res!595657) b!876538))

(assert (= (and b!876538 res!595653) b!876537))

(assert (= (and b!876537 res!595650) b!876530))

(assert (= (and b!876530 res!595652) b!876535))

(assert (= (and b!876535 res!595655) b!876529))

(assert (= (and b!876529 res!595656) b!876528))

(assert (= (and b!876528 res!595654) b!876527))

(assert (= (and b!876527 c!92556) b!876536))

(assert (= (and b!876527 (not c!92556)) b!876534))

(assert (= (or b!876536 b!876534) bm!38758))

(assert (= (or b!876536 b!876534) bm!38757))

(assert (= (and b!876527 (not res!595658)) b!876531))

(assert (= (and b!876539 condMapEmpty!27749) mapIsEmpty!27749))

(assert (= (and b!876539 (not condMapEmpty!27749)) mapNonEmpty!27749))

(get-info :version)

(assert (= (and mapNonEmpty!27749 ((_ is ValueCellFull!8273) mapValue!27749)) b!876532))

(assert (= (and b!876539 ((_ is ValueCellFull!8273) mapDefault!27749)) b!876525))

(assert (= start!74420 b!876539))

(declare-fun b_lambda!12231 () Bool)

(assert (=> (not b_lambda!12231) (not b!876531)))

(declare-fun t!24473 () Bool)

(declare-fun tb!4933 () Bool)

(assert (=> (and start!74420 (= defaultEntry!696 defaultEntry!696) t!24473) tb!4933))

(declare-fun result!9493 () Bool)

(assert (=> tb!4933 (= result!9493 tp_is_empty!17425)))

(assert (=> b!876531 t!24473))

(declare-fun b_and!24991 () Bool)

(assert (= b_and!24989 (and (=> t!24473 result!9493) b_and!24991)))

(declare-fun m!815805 () Bool)

(assert (=> b!876527 m!815805))

(assert (=> b!876527 m!815805))

(declare-fun m!815807 () Bool)

(assert (=> b!876527 m!815807))

(declare-fun m!815809 () Bool)

(assert (=> b!876527 m!815809))

(declare-fun m!815811 () Bool)

(assert (=> b!876528 m!815811))

(declare-fun m!815813 () Bool)

(assert (=> b!876528 m!815813))

(declare-fun m!815815 () Bool)

(assert (=> b!876528 m!815815))

(declare-fun m!815817 () Bool)

(assert (=> b!876533 m!815817))

(declare-fun m!815819 () Bool)

(assert (=> bm!38758 m!815819))

(declare-fun m!815821 () Bool)

(assert (=> b!876536 m!815821))

(declare-fun m!815823 () Bool)

(assert (=> bm!38757 m!815823))

(declare-fun m!815825 () Bool)

(assert (=> b!876529 m!815825))

(declare-fun m!815827 () Bool)

(assert (=> b!876531 m!815827))

(assert (=> b!876531 m!815819))

(declare-fun m!815829 () Bool)

(assert (=> b!876531 m!815829))

(declare-fun m!815831 () Bool)

(assert (=> b!876531 m!815831))

(declare-fun m!815833 () Bool)

(assert (=> b!876531 m!815833))

(declare-fun m!815835 () Bool)

(assert (=> b!876531 m!815835))

(declare-fun m!815837 () Bool)

(assert (=> b!876531 m!815837))

(assert (=> b!876531 m!815805))

(declare-fun m!815839 () Bool)

(assert (=> b!876531 m!815839))

(assert (=> b!876531 m!815833))

(assert (=> b!876531 m!815837))

(declare-fun m!815841 () Bool)

(assert (=> b!876531 m!815841))

(declare-fun m!815843 () Bool)

(assert (=> b!876531 m!815843))

(declare-fun m!815845 () Bool)

(assert (=> b!876531 m!815845))

(assert (=> b!876531 m!815829))

(declare-fun m!815847 () Bool)

(assert (=> b!876531 m!815847))

(assert (=> b!876531 m!815813))

(declare-fun m!815849 () Bool)

(assert (=> start!74420 m!815849))

(declare-fun m!815851 () Bool)

(assert (=> start!74420 m!815851))

(declare-fun m!815853 () Bool)

(assert (=> b!876538 m!815853))

(declare-fun m!815855 () Bool)

(assert (=> mapNonEmpty!27749 m!815855))

(declare-fun m!815857 () Bool)

(assert (=> b!876535 m!815857))

(declare-fun m!815859 () Bool)

(assert (=> b!876537 m!815859))

(check-sat (not b!876531) (not bm!38757) (not b!876535) (not b!876527) b_and!24991 (not b_lambda!12231) (not mapNonEmpty!27749) (not b!876528) (not bm!38758) tp_is_empty!17425 (not start!74420) (not b!876536) (not b_next!15181) (not b!876533) (not b!876537) (not b!876538))
(check-sat b_and!24991 (not b_next!15181))
(get-model)

(declare-fun b_lambda!12237 () Bool)

(assert (= b_lambda!12231 (or (and start!74420 b_free!15181) b_lambda!12237)))

(check-sat (not b!876531) (not bm!38757) (not b!876535) (not b!876527) b_and!24991 (not mapNonEmpty!27749) (not b!876528) (not bm!38758) tp_is_empty!17425 (not start!74420) (not b!876536) (not b_next!15181) (not b!876533) (not b_lambda!12237) (not b!876537) (not b!876538))
(check-sat b_and!24991 (not b_next!15181))
(get-model)

(declare-fun b!876644 () Bool)

(declare-fun e!487970 () Bool)

(declare-fun call!38776 () Bool)

(assert (=> b!876644 (= e!487970 call!38776)))

(declare-fun b!876645 () Bool)

(declare-fun e!487969 () Bool)

(assert (=> b!876645 (= e!487969 call!38776)))

(declare-fun bm!38773 () Bool)

(assert (=> bm!38773 (= call!38776 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!108423 () Bool)

(declare-fun res!595724 () Bool)

(declare-fun e!487968 () Bool)

(assert (=> d!108423 (=> res!595724 e!487968)))

(assert (=> d!108423 (= res!595724 (bvsge #b00000000000000000000000000000000 (size!24947 _keys!868)))))

(assert (=> d!108423 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!487968)))

(declare-fun b!876646 () Bool)

(assert (=> b!876646 (= e!487968 e!487969)))

(declare-fun c!92565 () Bool)

(assert (=> b!876646 (= c!92565 (validKeyInArray!0 (select (arr!24505 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!876647 () Bool)

(assert (=> b!876647 (= e!487969 e!487970)))

(declare-fun lt!396526 () (_ BitVec 64))

(assert (=> b!876647 (= lt!396526 (select (arr!24505 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!396524 () Unit!29927)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50955 (_ BitVec 64) (_ BitVec 32)) Unit!29927)

(assert (=> b!876647 (= lt!396524 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!396526 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!876647 (arrayContainsKey!0 _keys!868 lt!396526 #b00000000000000000000000000000000)))

(declare-fun lt!396525 () Unit!29927)

(assert (=> b!876647 (= lt!396525 lt!396524)))

(declare-fun res!595725 () Bool)

(declare-datatypes ((SeekEntryResult!8749 0))(
  ( (MissingZero!8749 (index!37367 (_ BitVec 32))) (Found!8749 (index!37368 (_ BitVec 32))) (Intermediate!8749 (undefined!9561 Bool) (index!37369 (_ BitVec 32)) (x!74297 (_ BitVec 32))) (Undefined!8749) (MissingVacant!8749 (index!37370 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50955 (_ BitVec 32)) SeekEntryResult!8749)

(assert (=> b!876647 (= res!595725 (= (seekEntryOrOpen!0 (select (arr!24505 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8749 #b00000000000000000000000000000000)))))

(assert (=> b!876647 (=> (not res!595725) (not e!487970))))

(assert (= (and d!108423 (not res!595724)) b!876646))

(assert (= (and b!876646 c!92565) b!876647))

(assert (= (and b!876646 (not c!92565)) b!876645))

(assert (= (and b!876647 res!595725) b!876644))

(assert (= (or b!876644 b!876645) bm!38773))

(declare-fun m!815973 () Bool)

(assert (=> bm!38773 m!815973))

(declare-fun m!815975 () Bool)

(assert (=> b!876646 m!815975))

(assert (=> b!876646 m!815975))

(declare-fun m!815977 () Bool)

(assert (=> b!876646 m!815977))

(assert (=> b!876647 m!815975))

(declare-fun m!815979 () Bool)

(assert (=> b!876647 m!815979))

(declare-fun m!815981 () Bool)

(assert (=> b!876647 m!815981))

(assert (=> b!876647 m!815975))

(declare-fun m!815983 () Bool)

(assert (=> b!876647 m!815983))

(assert (=> b!876538 d!108423))

(declare-fun b!876672 () Bool)

(declare-fun e!487988 () ListLongMap!10353)

(declare-fun e!487985 () ListLongMap!10353)

(assert (=> b!876672 (= e!487988 e!487985)))

(declare-fun c!92574 () Bool)

(assert (=> b!876672 (= c!92574 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!876673 () Bool)

(declare-fun e!487991 () Bool)

(declare-fun e!487987 () Bool)

(assert (=> b!876673 (= e!487991 e!487987)))

(declare-fun c!92576 () Bool)

(declare-fun e!487990 () Bool)

(assert (=> b!876673 (= c!92576 e!487990)))

(declare-fun res!595734 () Bool)

(assert (=> b!876673 (=> (not res!595734) (not e!487990))))

(assert (=> b!876673 (= res!595734 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(declare-fun b!876674 () Bool)

(declare-fun lt!396546 () Unit!29927)

(declare-fun lt!396542 () Unit!29927)

(assert (=> b!876674 (= lt!396546 lt!396542)))

(declare-fun lt!396545 () ListLongMap!10353)

(declare-fun lt!396541 () (_ BitVec 64))

(declare-fun lt!396544 () V!28281)

(declare-fun lt!396547 () (_ BitVec 64))

(declare-fun contains!4222 (ListLongMap!10353 (_ BitVec 64)) Bool)

(assert (=> b!876674 (not (contains!4222 (+!2517 lt!396545 (tuple2!11595 lt!396547 lt!396544)) lt!396541))))

(declare-fun addStillNotContains!203 (ListLongMap!10353 (_ BitVec 64) V!28281 (_ BitVec 64)) Unit!29927)

(assert (=> b!876674 (= lt!396542 (addStillNotContains!203 lt!396545 lt!396547 lt!396544 lt!396541))))

(assert (=> b!876674 (= lt!396541 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876674 (= lt!396544 (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876674 (= lt!396547 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38779 () ListLongMap!10353)

(assert (=> b!876674 (= lt!396545 call!38779)))

(assert (=> b!876674 (= e!487985 (+!2517 call!38779 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876675 () Bool)

(assert (=> b!876675 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(assert (=> b!876675 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24948 _values!688)))))

(declare-fun lt!396543 () ListLongMap!10353)

(declare-fun e!487986 () Bool)

(declare-fun apply!377 (ListLongMap!10353 (_ BitVec 64)) V!28281)

(assert (=> b!876675 (= e!487986 (= (apply!377 lt!396543 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876676 () Bool)

(declare-fun e!487989 () Bool)

(declare-fun isEmpty!668 (ListLongMap!10353) Bool)

(assert (=> b!876676 (= e!487989 (isEmpty!668 lt!396543))))

(declare-fun b!876677 () Bool)

(assert (=> b!876677 (= e!487985 call!38779)))

(declare-fun b!876678 () Bool)

(assert (=> b!876678 (= e!487990 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!876678 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun bm!38776 () Bool)

(assert (=> bm!38776 (= call!38779 (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876680 () Bool)

(assert (=> b!876680 (= e!487989 (= lt!396543 (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876681 () Bool)

(declare-fun res!595735 () Bool)

(assert (=> b!876681 (=> (not res!595735) (not e!487991))))

(assert (=> b!876681 (= res!595735 (not (contains!4222 lt!396543 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876682 () Bool)

(assert (=> b!876682 (= e!487987 e!487989)))

(declare-fun c!92575 () Bool)

(assert (=> b!876682 (= c!92575 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(declare-fun b!876683 () Bool)

(assert (=> b!876683 (= e!487987 e!487986)))

(assert (=> b!876683 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(declare-fun res!595736 () Bool)

(assert (=> b!876683 (= res!595736 (contains!4222 lt!396543 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!876683 (=> (not res!595736) (not e!487986))))

(declare-fun d!108425 () Bool)

(assert (=> d!108425 e!487991))

(declare-fun res!595737 () Bool)

(assert (=> d!108425 (=> (not res!595737) (not e!487991))))

(assert (=> d!108425 (= res!595737 (not (contains!4222 lt!396543 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108425 (= lt!396543 e!487988)))

(declare-fun c!92577 () Bool)

(assert (=> d!108425 (= c!92577 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(assert (=> d!108425 (validMask!0 mask!1196)))

(assert (=> d!108425 (= (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396543)))

(declare-fun b!876679 () Bool)

(assert (=> b!876679 (= e!487988 (ListLongMap!10354 Nil!17395))))

(assert (= (and d!108425 c!92577) b!876679))

(assert (= (and d!108425 (not c!92577)) b!876672))

(assert (= (and b!876672 c!92574) b!876674))

(assert (= (and b!876672 (not c!92574)) b!876677))

(assert (= (or b!876674 b!876677) bm!38776))

(assert (= (and d!108425 res!595737) b!876681))

(assert (= (and b!876681 res!595735) b!876673))

(assert (= (and b!876673 res!595734) b!876678))

(assert (= (and b!876673 c!92576) b!876683))

(assert (= (and b!876673 (not c!92576)) b!876682))

(assert (= (and b!876683 res!595736) b!876675))

(assert (= (and b!876682 c!92575) b!876680))

(assert (= (and b!876682 (not c!92575)) b!876676))

(declare-fun b_lambda!12239 () Bool)

(assert (=> (not b_lambda!12239) (not b!876674)))

(assert (=> b!876674 t!24473))

(declare-fun b_and!25001 () Bool)

(assert (= b_and!24991 (and (=> t!24473 result!9493) b_and!25001)))

(declare-fun b_lambda!12241 () Bool)

(assert (=> (not b_lambda!12241) (not b!876675)))

(assert (=> b!876675 t!24473))

(declare-fun b_and!25003 () Bool)

(assert (= b_and!25001 (and (=> t!24473 result!9493) b_and!25003)))

(assert (=> b!876675 m!815839))

(declare-fun m!815985 () Bool)

(assert (=> b!876675 m!815985))

(assert (=> b!876675 m!815839))

(declare-fun m!815987 () Bool)

(assert (=> b!876675 m!815987))

(declare-fun m!815989 () Bool)

(assert (=> b!876675 m!815989))

(assert (=> b!876675 m!815989))

(declare-fun m!815991 () Bool)

(assert (=> b!876675 m!815991))

(assert (=> b!876675 m!815985))

(assert (=> b!876674 m!815839))

(declare-fun m!815993 () Bool)

(assert (=> b!876674 m!815993))

(assert (=> b!876674 m!815985))

(assert (=> b!876674 m!815839))

(assert (=> b!876674 m!815987))

(assert (=> b!876674 m!815989))

(declare-fun m!815995 () Bool)

(assert (=> b!876674 m!815995))

(assert (=> b!876674 m!815993))

(declare-fun m!815997 () Bool)

(assert (=> b!876674 m!815997))

(declare-fun m!815999 () Bool)

(assert (=> b!876674 m!815999))

(assert (=> b!876674 m!815985))

(declare-fun m!816001 () Bool)

(assert (=> bm!38776 m!816001))

(assert (=> b!876672 m!815989))

(assert (=> b!876672 m!815989))

(declare-fun m!816003 () Bool)

(assert (=> b!876672 m!816003))

(assert (=> b!876683 m!815989))

(assert (=> b!876683 m!815989))

(declare-fun m!816005 () Bool)

(assert (=> b!876683 m!816005))

(declare-fun m!816007 () Bool)

(assert (=> d!108425 m!816007))

(assert (=> d!108425 m!815817))

(assert (=> b!876678 m!815989))

(assert (=> b!876678 m!815989))

(assert (=> b!876678 m!816003))

(declare-fun m!816009 () Bool)

(assert (=> b!876676 m!816009))

(assert (=> b!876680 m!816001))

(declare-fun m!816011 () Bool)

(assert (=> b!876681 m!816011))

(assert (=> bm!38757 d!108425))

(declare-fun d!108427 () Bool)

(assert (=> d!108427 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!876533 d!108427))

(declare-fun b!876684 () Bool)

(declare-fun e!487995 () ListLongMap!10353)

(declare-fun e!487992 () ListLongMap!10353)

(assert (=> b!876684 (= e!487995 e!487992)))

(declare-fun c!92578 () Bool)

(assert (=> b!876684 (= c!92578 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!876685 () Bool)

(declare-fun e!487998 () Bool)

(declare-fun e!487994 () Bool)

(assert (=> b!876685 (= e!487998 e!487994)))

(declare-fun c!92580 () Bool)

(declare-fun e!487997 () Bool)

(assert (=> b!876685 (= c!92580 e!487997)))

(declare-fun res!595738 () Bool)

(assert (=> b!876685 (=> (not res!595738) (not e!487997))))

(assert (=> b!876685 (= res!595738 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(declare-fun b!876686 () Bool)

(declare-fun lt!396553 () Unit!29927)

(declare-fun lt!396549 () Unit!29927)

(assert (=> b!876686 (= lt!396553 lt!396549)))

(declare-fun lt!396548 () (_ BitVec 64))

(declare-fun lt!396554 () (_ BitVec 64))

(declare-fun lt!396552 () ListLongMap!10353)

(declare-fun lt!396551 () V!28281)

(assert (=> b!876686 (not (contains!4222 (+!2517 lt!396552 (tuple2!11595 lt!396554 lt!396551)) lt!396548))))

(assert (=> b!876686 (= lt!396549 (addStillNotContains!203 lt!396552 lt!396554 lt!396551 lt!396548))))

(assert (=> b!876686 (= lt!396548 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876686 (= lt!396551 (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876686 (= lt!396554 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38780 () ListLongMap!10353)

(assert (=> b!876686 (= lt!396552 call!38780)))

(assert (=> b!876686 (= e!487992 (+!2517 call!38780 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876687 () Bool)

(assert (=> b!876687 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(assert (=> b!876687 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24948 lt!396449)))))

(declare-fun e!487993 () Bool)

(declare-fun lt!396550 () ListLongMap!10353)

(assert (=> b!876687 (= e!487993 (= (apply!377 lt!396550 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876688 () Bool)

(declare-fun e!487996 () Bool)

(assert (=> b!876688 (= e!487996 (isEmpty!668 lt!396550))))

(declare-fun b!876689 () Bool)

(assert (=> b!876689 (= e!487992 call!38780)))

(declare-fun b!876690 () Bool)

(assert (=> b!876690 (= e!487997 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!876690 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun bm!38777 () Bool)

(assert (=> bm!38777 (= call!38780 (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876692 () Bool)

(assert (=> b!876692 (= e!487996 (= lt!396550 (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876693 () Bool)

(declare-fun res!595739 () Bool)

(assert (=> b!876693 (=> (not res!595739) (not e!487998))))

(assert (=> b!876693 (= res!595739 (not (contains!4222 lt!396550 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876694 () Bool)

(assert (=> b!876694 (= e!487994 e!487996)))

(declare-fun c!92579 () Bool)

(assert (=> b!876694 (= c!92579 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(declare-fun b!876695 () Bool)

(assert (=> b!876695 (= e!487994 e!487993)))

(assert (=> b!876695 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(declare-fun res!595740 () Bool)

(assert (=> b!876695 (= res!595740 (contains!4222 lt!396550 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!876695 (=> (not res!595740) (not e!487993))))

(declare-fun d!108429 () Bool)

(assert (=> d!108429 e!487998))

(declare-fun res!595741 () Bool)

(assert (=> d!108429 (=> (not res!595741) (not e!487998))))

(assert (=> d!108429 (= res!595741 (not (contains!4222 lt!396550 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108429 (= lt!396550 e!487995)))

(declare-fun c!92581 () Bool)

(assert (=> d!108429 (= c!92581 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(assert (=> d!108429 (validMask!0 mask!1196)))

(assert (=> d!108429 (= (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396550)))

(declare-fun b!876691 () Bool)

(assert (=> b!876691 (= e!487995 (ListLongMap!10354 Nil!17395))))

(assert (= (and d!108429 c!92581) b!876691))

(assert (= (and d!108429 (not c!92581)) b!876684))

(assert (= (and b!876684 c!92578) b!876686))

(assert (= (and b!876684 (not c!92578)) b!876689))

(assert (= (or b!876686 b!876689) bm!38777))

(assert (= (and d!108429 res!595741) b!876693))

(assert (= (and b!876693 res!595739) b!876685))

(assert (= (and b!876685 res!595738) b!876690))

(assert (= (and b!876685 c!92580) b!876695))

(assert (= (and b!876685 (not c!92580)) b!876694))

(assert (= (and b!876695 res!595740) b!876687))

(assert (= (and b!876694 c!92579) b!876692))

(assert (= (and b!876694 (not c!92579)) b!876688))

(declare-fun b_lambda!12243 () Bool)

(assert (=> (not b_lambda!12243) (not b!876686)))

(assert (=> b!876686 t!24473))

(declare-fun b_and!25005 () Bool)

(assert (= b_and!25003 (and (=> t!24473 result!9493) b_and!25005)))

(declare-fun b_lambda!12245 () Bool)

(assert (=> (not b_lambda!12245) (not b!876687)))

(assert (=> b!876687 t!24473))

(declare-fun b_and!25007 () Bool)

(assert (= b_and!25005 (and (=> t!24473 result!9493) b_and!25007)))

(assert (=> b!876687 m!815839))

(declare-fun m!816013 () Bool)

(assert (=> b!876687 m!816013))

(assert (=> b!876687 m!815839))

(declare-fun m!816015 () Bool)

(assert (=> b!876687 m!816015))

(assert (=> b!876687 m!815989))

(assert (=> b!876687 m!815989))

(declare-fun m!816017 () Bool)

(assert (=> b!876687 m!816017))

(assert (=> b!876687 m!816013))

(assert (=> b!876686 m!815839))

(declare-fun m!816019 () Bool)

(assert (=> b!876686 m!816019))

(assert (=> b!876686 m!816013))

(assert (=> b!876686 m!815839))

(assert (=> b!876686 m!816015))

(assert (=> b!876686 m!815989))

(declare-fun m!816021 () Bool)

(assert (=> b!876686 m!816021))

(assert (=> b!876686 m!816019))

(declare-fun m!816023 () Bool)

(assert (=> b!876686 m!816023))

(declare-fun m!816025 () Bool)

(assert (=> b!876686 m!816025))

(assert (=> b!876686 m!816013))

(declare-fun m!816027 () Bool)

(assert (=> bm!38777 m!816027))

(assert (=> b!876684 m!815989))

(assert (=> b!876684 m!815989))

(assert (=> b!876684 m!816003))

(assert (=> b!876695 m!815989))

(assert (=> b!876695 m!815989))

(declare-fun m!816029 () Bool)

(assert (=> b!876695 m!816029))

(declare-fun m!816031 () Bool)

(assert (=> d!108429 m!816031))

(assert (=> d!108429 m!815817))

(assert (=> b!876690 m!815989))

(assert (=> b!876690 m!815989))

(assert (=> b!876690 m!816003))

(declare-fun m!816033 () Bool)

(assert (=> b!876688 m!816033))

(assert (=> b!876692 m!816027))

(declare-fun m!816035 () Bool)

(assert (=> b!876693 m!816035))

(assert (=> bm!38758 d!108429))

(declare-fun d!108431 () Bool)

(declare-fun c!92584 () Bool)

(assert (=> d!108431 (= c!92584 ((_ is ValueCellFull!8273) (select (arr!24506 _values!688) from!1053)))))

(declare-fun e!488001 () V!28281)

(assert (=> d!108431 (= (get!12898 (select (arr!24506 _values!688) from!1053) lt!396452) e!488001)))

(declare-fun b!876700 () Bool)

(declare-fun get!12901 (ValueCell!8273 V!28281) V!28281)

(assert (=> b!876700 (= e!488001 (get!12901 (select (arr!24506 _values!688) from!1053) lt!396452))))

(declare-fun b!876701 () Bool)

(declare-fun get!12902 (ValueCell!8273 V!28281) V!28281)

(assert (=> b!876701 (= e!488001 (get!12902 (select (arr!24506 _values!688) from!1053) lt!396452))))

(assert (= (and d!108431 c!92584) b!876700))

(assert (= (and d!108431 (not c!92584)) b!876701))

(assert (=> b!876700 m!815837))

(declare-fun m!816037 () Bool)

(assert (=> b!876700 m!816037))

(assert (=> b!876701 m!815837))

(declare-fun m!816039 () Bool)

(assert (=> b!876701 m!816039))

(assert (=> b!876531 d!108431))

(declare-fun d!108433 () Bool)

(declare-fun c!92585 () Bool)

(assert (=> d!108433 (= c!92585 ((_ is ValueCellFull!8273) (select (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053)))))

(declare-fun e!488002 () V!28281)

(assert (=> d!108433 (= (get!12898 (select (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053) lt!396452) e!488002)))

(declare-fun b!876702 () Bool)

(assert (=> b!876702 (= e!488002 (get!12901 (select (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053) lt!396452))))

(declare-fun b!876703 () Bool)

(assert (=> b!876703 (= e!488002 (get!12902 (select (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053) lt!396452))))

(assert (= (and d!108433 c!92585) b!876702))

(assert (= (and d!108433 (not c!92585)) b!876703))

(assert (=> b!876702 m!815829))

(declare-fun m!816041 () Bool)

(assert (=> b!876702 m!816041))

(assert (=> b!876703 m!815829))

(declare-fun m!816043 () Bool)

(assert (=> b!876703 m!816043))

(assert (=> b!876531 d!108433))

(declare-fun d!108435 () Bool)

(declare-fun e!488005 () Bool)

(assert (=> d!108435 e!488005))

(declare-fun res!595746 () Bool)

(assert (=> d!108435 (=> (not res!595746) (not e!488005))))

(declare-fun lt!396565 () ListLongMap!10353)

(assert (=> d!108435 (= res!595746 (contains!4222 lt!396565 (_1!5808 (tuple2!11595 k0!854 lt!396456))))))

(declare-fun lt!396566 () List!17398)

(assert (=> d!108435 (= lt!396565 (ListLongMap!10354 lt!396566))))

(declare-fun lt!396563 () Unit!29927)

(declare-fun lt!396564 () Unit!29927)

(assert (=> d!108435 (= lt!396563 lt!396564)))

(declare-datatypes ((Option!423 0))(
  ( (Some!422 (v!11193 V!28281)) (None!421) )
))
(declare-fun getValueByKey!417 (List!17398 (_ BitVec 64)) Option!423)

(assert (=> d!108435 (= (getValueByKey!417 lt!396566 (_1!5808 (tuple2!11595 k0!854 lt!396456))) (Some!422 (_2!5808 (tuple2!11595 k0!854 lt!396456))))))

(declare-fun lemmaContainsTupThenGetReturnValue!234 (List!17398 (_ BitVec 64) V!28281) Unit!29927)

(assert (=> d!108435 (= lt!396564 (lemmaContainsTupThenGetReturnValue!234 lt!396566 (_1!5808 (tuple2!11595 k0!854 lt!396456)) (_2!5808 (tuple2!11595 k0!854 lt!396456))))))

(declare-fun insertStrictlySorted!273 (List!17398 (_ BitVec 64) V!28281) List!17398)

(assert (=> d!108435 (= lt!396566 (insertStrictlySorted!273 (toList!5192 lt!396450) (_1!5808 (tuple2!11595 k0!854 lt!396456)) (_2!5808 (tuple2!11595 k0!854 lt!396456))))))

(assert (=> d!108435 (= (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456)) lt!396565)))

(declare-fun b!876708 () Bool)

(declare-fun res!595747 () Bool)

(assert (=> b!876708 (=> (not res!595747) (not e!488005))))

(assert (=> b!876708 (= res!595747 (= (getValueByKey!417 (toList!5192 lt!396565) (_1!5808 (tuple2!11595 k0!854 lt!396456))) (Some!422 (_2!5808 (tuple2!11595 k0!854 lt!396456)))))))

(declare-fun b!876709 () Bool)

(declare-fun contains!4223 (List!17398 tuple2!11594) Bool)

(assert (=> b!876709 (= e!488005 (contains!4223 (toList!5192 lt!396565) (tuple2!11595 k0!854 lt!396456)))))

(assert (= (and d!108435 res!595746) b!876708))

(assert (= (and b!876708 res!595747) b!876709))

(declare-fun m!816045 () Bool)

(assert (=> d!108435 m!816045))

(declare-fun m!816047 () Bool)

(assert (=> d!108435 m!816047))

(declare-fun m!816049 () Bool)

(assert (=> d!108435 m!816049))

(declare-fun m!816051 () Bool)

(assert (=> d!108435 m!816051))

(declare-fun m!816053 () Bool)

(assert (=> b!876708 m!816053))

(declare-fun m!816055 () Bool)

(assert (=> b!876709 m!816055))

(assert (=> b!876531 d!108435))

(declare-fun d!108437 () Bool)

(assert (=> d!108437 (= (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396448)) (+!2517 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456)) (tuple2!11595 k0!854 lt!396448)))))

(declare-fun lt!396569 () Unit!29927)

(declare-fun choose!1439 (ListLongMap!10353 (_ BitVec 64) V!28281 V!28281) Unit!29927)

(assert (=> d!108437 (= lt!396569 (choose!1439 lt!396450 k0!854 lt!396456 lt!396448))))

(assert (=> d!108437 (= (addSameAsAddTwiceSameKeyDiffValues!327 lt!396450 k0!854 lt!396456 lt!396448) lt!396569)))

(declare-fun bs!24586 () Bool)

(assert (= bs!24586 d!108437))

(declare-fun m!816057 () Bool)

(assert (=> bs!24586 m!816057))

(assert (=> bs!24586 m!815833))

(assert (=> bs!24586 m!815833))

(declare-fun m!816059 () Bool)

(assert (=> bs!24586 m!816059))

(declare-fun m!816061 () Bool)

(assert (=> bs!24586 m!816061))

(assert (=> b!876531 d!108437))

(declare-fun d!108439 () Bool)

(declare-fun e!488006 () Bool)

(assert (=> d!108439 e!488006))

(declare-fun res!595748 () Bool)

(assert (=> d!108439 (=> (not res!595748) (not e!488006))))

(declare-fun lt!396572 () ListLongMap!10353)

(assert (=> d!108439 (= res!595748 (contains!4222 lt!396572 (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun lt!396573 () List!17398)

(assert (=> d!108439 (= lt!396572 (ListLongMap!10354 lt!396573))))

(declare-fun lt!396570 () Unit!29927)

(declare-fun lt!396571 () Unit!29927)

(assert (=> d!108439 (= lt!396570 lt!396571)))

(assert (=> d!108439 (= (getValueByKey!417 lt!396573 (_1!5808 (tuple2!11595 k0!854 v!557))) (Some!422 (_2!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!108439 (= lt!396571 (lemmaContainsTupThenGetReturnValue!234 lt!396573 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!108439 (= lt!396573 (insertStrictlySorted!273 (toList!5192 lt!396455) (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!108439 (= (+!2517 lt!396455 (tuple2!11595 k0!854 v!557)) lt!396572)))

(declare-fun b!876710 () Bool)

(declare-fun res!595749 () Bool)

(assert (=> b!876710 (=> (not res!595749) (not e!488006))))

(assert (=> b!876710 (= res!595749 (= (getValueByKey!417 (toList!5192 lt!396572) (_1!5808 (tuple2!11595 k0!854 v!557))) (Some!422 (_2!5808 (tuple2!11595 k0!854 v!557)))))))

(declare-fun b!876711 () Bool)

(assert (=> b!876711 (= e!488006 (contains!4223 (toList!5192 lt!396572) (tuple2!11595 k0!854 v!557)))))

(assert (= (and d!108439 res!595748) b!876710))

(assert (= (and b!876710 res!595749) b!876711))

(declare-fun m!816063 () Bool)

(assert (=> d!108439 m!816063))

(declare-fun m!816065 () Bool)

(assert (=> d!108439 m!816065))

(declare-fun m!816067 () Bool)

(assert (=> d!108439 m!816067))

(declare-fun m!816069 () Bool)

(assert (=> d!108439 m!816069))

(declare-fun m!816071 () Bool)

(assert (=> b!876710 m!816071))

(declare-fun m!816073 () Bool)

(assert (=> b!876711 m!816073))

(assert (=> b!876531 d!108439))

(declare-fun d!108441 () Bool)

(declare-fun e!488007 () Bool)

(assert (=> d!108441 e!488007))

(declare-fun res!595750 () Bool)

(assert (=> d!108441 (=> (not res!595750) (not e!488007))))

(declare-fun lt!396576 () ListLongMap!10353)

(assert (=> d!108441 (= res!595750 (contains!4222 lt!396576 (_1!5808 lt!396453)))))

(declare-fun lt!396577 () List!17398)

(assert (=> d!108441 (= lt!396576 (ListLongMap!10354 lt!396577))))

(declare-fun lt!396574 () Unit!29927)

(declare-fun lt!396575 () Unit!29927)

(assert (=> d!108441 (= lt!396574 lt!396575)))

(assert (=> d!108441 (= (getValueByKey!417 lt!396577 (_1!5808 lt!396453)) (Some!422 (_2!5808 lt!396453)))))

(assert (=> d!108441 (= lt!396575 (lemmaContainsTupThenGetReturnValue!234 lt!396577 (_1!5808 lt!396453) (_2!5808 lt!396453)))))

(assert (=> d!108441 (= lt!396577 (insertStrictlySorted!273 (toList!5192 lt!396450) (_1!5808 lt!396453) (_2!5808 lt!396453)))))

(assert (=> d!108441 (= (+!2517 lt!396450 lt!396453) lt!396576)))

(declare-fun b!876712 () Bool)

(declare-fun res!595751 () Bool)

(assert (=> b!876712 (=> (not res!595751) (not e!488007))))

(assert (=> b!876712 (= res!595751 (= (getValueByKey!417 (toList!5192 lt!396576) (_1!5808 lt!396453)) (Some!422 (_2!5808 lt!396453))))))

(declare-fun b!876713 () Bool)

(assert (=> b!876713 (= e!488007 (contains!4223 (toList!5192 lt!396576) lt!396453))))

(assert (= (and d!108441 res!595750) b!876712))

(assert (= (and b!876712 res!595751) b!876713))

(declare-fun m!816075 () Bool)

(assert (=> d!108441 m!816075))

(declare-fun m!816077 () Bool)

(assert (=> d!108441 m!816077))

(declare-fun m!816079 () Bool)

(assert (=> d!108441 m!816079))

(declare-fun m!816081 () Bool)

(assert (=> d!108441 m!816081))

(declare-fun m!816083 () Bool)

(assert (=> b!876712 m!816083))

(declare-fun m!816085 () Bool)

(assert (=> b!876713 m!816085))

(assert (=> b!876531 d!108441))

(declare-fun d!108443 () Bool)

(declare-fun e!488008 () Bool)

(assert (=> d!108443 e!488008))

(declare-fun res!595752 () Bool)

(assert (=> d!108443 (=> (not res!595752) (not e!488008))))

(declare-fun lt!396580 () ListLongMap!10353)

(assert (=> d!108443 (= res!595752 (contains!4222 lt!396580 (_1!5808 lt!396453)))))

(declare-fun lt!396581 () List!17398)

(assert (=> d!108443 (= lt!396580 (ListLongMap!10354 lt!396581))))

(declare-fun lt!396578 () Unit!29927)

(declare-fun lt!396579 () Unit!29927)

(assert (=> d!108443 (= lt!396578 lt!396579)))

(assert (=> d!108443 (= (getValueByKey!417 lt!396581 (_1!5808 lt!396453)) (Some!422 (_2!5808 lt!396453)))))

(assert (=> d!108443 (= lt!396579 (lemmaContainsTupThenGetReturnValue!234 lt!396581 (_1!5808 lt!396453) (_2!5808 lt!396453)))))

(assert (=> d!108443 (= lt!396581 (insertStrictlySorted!273 (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456))) (_1!5808 lt!396453) (_2!5808 lt!396453)))))

(assert (=> d!108443 (= (+!2517 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456)) lt!396453) lt!396580)))

(declare-fun b!876714 () Bool)

(declare-fun res!595753 () Bool)

(assert (=> b!876714 (=> (not res!595753) (not e!488008))))

(assert (=> b!876714 (= res!595753 (= (getValueByKey!417 (toList!5192 lt!396580) (_1!5808 lt!396453)) (Some!422 (_2!5808 lt!396453))))))

(declare-fun b!876715 () Bool)

(assert (=> b!876715 (= e!488008 (contains!4223 (toList!5192 lt!396580) lt!396453))))

(assert (= (and d!108443 res!595752) b!876714))

(assert (= (and b!876714 res!595753) b!876715))

(declare-fun m!816087 () Bool)

(assert (=> d!108443 m!816087))

(declare-fun m!816089 () Bool)

(assert (=> d!108443 m!816089))

(declare-fun m!816091 () Bool)

(assert (=> d!108443 m!816091))

(declare-fun m!816093 () Bool)

(assert (=> d!108443 m!816093))

(declare-fun m!816095 () Bool)

(assert (=> b!876714 m!816095))

(declare-fun m!816097 () Bool)

(assert (=> b!876715 m!816097))

(assert (=> b!876531 d!108443))

(assert (=> b!876531 d!108429))

(declare-fun d!108445 () Bool)

(declare-fun e!488009 () Bool)

(assert (=> d!108445 e!488009))

(declare-fun res!595754 () Bool)

(assert (=> d!108445 (=> (not res!595754) (not e!488009))))

(declare-fun lt!396584 () ListLongMap!10353)

(assert (=> d!108445 (= res!595754 (contains!4222 lt!396584 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(declare-fun lt!396585 () List!17398)

(assert (=> d!108445 (= lt!396584 (ListLongMap!10354 lt!396585))))

(declare-fun lt!396582 () Unit!29927)

(declare-fun lt!396583 () Unit!29927)

(assert (=> d!108445 (= lt!396582 lt!396583)))

(assert (=> d!108445 (= (getValueByKey!417 lt!396585 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))) (Some!422 (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(assert (=> d!108445 (= lt!396583 (lemmaContainsTupThenGetReturnValue!234 lt!396585 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(assert (=> d!108445 (= lt!396585 (insertStrictlySorted!273 (toList!5192 lt!396450) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(assert (=> d!108445 (= (+!2517 lt!396450 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)) lt!396584)))

(declare-fun b!876716 () Bool)

(declare-fun res!595755 () Bool)

(assert (=> b!876716 (=> (not res!595755) (not e!488009))))

(assert (=> b!876716 (= res!595755 (= (getValueByKey!417 (toList!5192 lt!396584) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))) (Some!422 (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))))

(declare-fun b!876717 () Bool)

(assert (=> b!876717 (= e!488009 (contains!4223 (toList!5192 lt!396584) (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))

(assert (= (and d!108445 res!595754) b!876716))

(assert (= (and b!876716 res!595755) b!876717))

(declare-fun m!816099 () Bool)

(assert (=> d!108445 m!816099))

(declare-fun m!816101 () Bool)

(assert (=> d!108445 m!816101))

(declare-fun m!816103 () Bool)

(assert (=> d!108445 m!816103))

(declare-fun m!816105 () Bool)

(assert (=> d!108445 m!816105))

(declare-fun m!816107 () Bool)

(assert (=> b!876716 m!816107))

(declare-fun m!816109 () Bool)

(assert (=> b!876717 m!816109))

(assert (=> b!876531 d!108445))

(declare-fun d!108447 () Bool)

(declare-fun e!488010 () Bool)

(assert (=> d!108447 e!488010))

(declare-fun res!595756 () Bool)

(assert (=> d!108447 (=> (not res!595756) (not e!488010))))

(declare-fun lt!396588 () ListLongMap!10353)

(assert (=> d!108447 (= res!595756 (contains!4222 lt!396588 (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun lt!396589 () List!17398)

(assert (=> d!108447 (= lt!396588 (ListLongMap!10354 lt!396589))))

(declare-fun lt!396586 () Unit!29927)

(declare-fun lt!396587 () Unit!29927)

(assert (=> d!108447 (= lt!396586 lt!396587)))

(assert (=> d!108447 (= (getValueByKey!417 lt!396589 (_1!5808 (tuple2!11595 k0!854 v!557))) (Some!422 (_2!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!108447 (= lt!396587 (lemmaContainsTupThenGetReturnValue!234 lt!396589 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!108447 (= lt!396589 (insertStrictlySorted!273 (toList!5192 call!38760) (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!108447 (= (+!2517 call!38760 (tuple2!11595 k0!854 v!557)) lt!396588)))

(declare-fun b!876718 () Bool)

(declare-fun res!595757 () Bool)

(assert (=> b!876718 (=> (not res!595757) (not e!488010))))

(assert (=> b!876718 (= res!595757 (= (getValueByKey!417 (toList!5192 lt!396588) (_1!5808 (tuple2!11595 k0!854 v!557))) (Some!422 (_2!5808 (tuple2!11595 k0!854 v!557)))))))

(declare-fun b!876719 () Bool)

(assert (=> b!876719 (= e!488010 (contains!4223 (toList!5192 lt!396588) (tuple2!11595 k0!854 v!557)))))

(assert (= (and d!108447 res!595756) b!876718))

(assert (= (and b!876718 res!595757) b!876719))

(declare-fun m!816111 () Bool)

(assert (=> d!108447 m!816111))

(declare-fun m!816113 () Bool)

(assert (=> d!108447 m!816113))

(declare-fun m!816115 () Bool)

(assert (=> d!108447 m!816115))

(declare-fun m!816117 () Bool)

(assert (=> d!108447 m!816117))

(declare-fun m!816119 () Bool)

(assert (=> b!876718 m!816119))

(declare-fun m!816121 () Bool)

(assert (=> b!876719 m!816121))

(assert (=> b!876536 d!108447))

(declare-fun b!876730 () Bool)

(declare-fun e!488020 () Bool)

(declare-fun call!38783 () Bool)

(assert (=> b!876730 (= e!488020 call!38783)))

(declare-fun b!876731 () Bool)

(declare-fun e!488022 () Bool)

(assert (=> b!876731 (= e!488022 e!488020)))

(declare-fun c!92588 () Bool)

(assert (=> b!876731 (= c!92588 (validKeyInArray!0 (select (arr!24505 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!876732 () Bool)

(declare-fun e!488021 () Bool)

(declare-fun contains!4224 (List!17399 (_ BitVec 64)) Bool)

(assert (=> b!876732 (= e!488021 (contains!4224 Nil!17396 (select (arr!24505 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!876733 () Bool)

(declare-fun e!488019 () Bool)

(assert (=> b!876733 (= e!488019 e!488022)))

(declare-fun res!595764 () Bool)

(assert (=> b!876733 (=> (not res!595764) (not e!488022))))

(assert (=> b!876733 (= res!595764 (not e!488021))))

(declare-fun res!595766 () Bool)

(assert (=> b!876733 (=> (not res!595766) (not e!488021))))

(assert (=> b!876733 (= res!595766 (validKeyInArray!0 (select (arr!24505 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38780 () Bool)

(assert (=> bm!38780 (= call!38783 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92588 (Cons!17395 (select (arr!24505 _keys!868) #b00000000000000000000000000000000) Nil!17396) Nil!17396)))))

(declare-fun d!108449 () Bool)

(declare-fun res!595765 () Bool)

(assert (=> d!108449 (=> res!595765 e!488019)))

(assert (=> d!108449 (= res!595765 (bvsge #b00000000000000000000000000000000 (size!24947 _keys!868)))))

(assert (=> d!108449 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17396) e!488019)))

(declare-fun b!876734 () Bool)

(assert (=> b!876734 (= e!488020 call!38783)))

(assert (= (and d!108449 (not res!595765)) b!876733))

(assert (= (and b!876733 res!595766) b!876732))

(assert (= (and b!876733 res!595764) b!876731))

(assert (= (and b!876731 c!92588) b!876730))

(assert (= (and b!876731 (not c!92588)) b!876734))

(assert (= (or b!876730 b!876734) bm!38780))

(assert (=> b!876731 m!815975))

(assert (=> b!876731 m!815975))

(assert (=> b!876731 m!815977))

(assert (=> b!876732 m!815975))

(assert (=> b!876732 m!815975))

(declare-fun m!816123 () Bool)

(assert (=> b!876732 m!816123))

(assert (=> b!876733 m!815975))

(assert (=> b!876733 m!815975))

(assert (=> b!876733 m!815977))

(assert (=> bm!38780 m!815975))

(declare-fun m!816125 () Bool)

(assert (=> bm!38780 m!816125))

(assert (=> b!876537 d!108449))

(declare-fun d!108451 () Bool)

(assert (=> d!108451 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!876535 d!108451))

(declare-fun d!108453 () Bool)

(assert (=> d!108453 (= (validKeyInArray!0 (select (arr!24505 _keys!868) from!1053)) (and (not (= (select (arr!24505 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24505 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!876527 d!108453))

(declare-fun b!876741 () Bool)

(declare-fun e!488028 () Bool)

(declare-fun e!488027 () Bool)

(assert (=> b!876741 (= e!488028 e!488027)))

(declare-fun c!92591 () Bool)

(assert (=> b!876741 (= c!92591 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun d!108455 () Bool)

(assert (=> d!108455 e!488028))

(declare-fun res!595769 () Bool)

(assert (=> d!108455 (=> (not res!595769) (not e!488028))))

(assert (=> d!108455 (= res!595769 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24948 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24948 _values!688))))))))

(declare-fun lt!396592 () Unit!29927)

(declare-fun choose!1440 (array!50955 array!50957 (_ BitVec 32) (_ BitVec 32) V!28281 V!28281 (_ BitVec 32) (_ BitVec 64) V!28281 (_ BitVec 32) Int) Unit!29927)

(assert (=> d!108455 (= lt!396592 (choose!1440 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108455 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(assert (=> d!108455 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!686 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396592)))

(declare-fun b!876742 () Bool)

(declare-fun call!38788 () ListLongMap!10353)

(declare-fun call!38789 () ListLongMap!10353)

(assert (=> b!876742 (= e!488027 (= call!38788 call!38789))))

(declare-fun bm!38785 () Bool)

(assert (=> bm!38785 (= call!38789 (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38786 () Bool)

(assert (=> bm!38786 (= call!38788 (getCurrentListMapNoExtraKeys!3185 _keys!868 (array!50958 (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24948 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876743 () Bool)

(assert (=> b!876743 (= e!488027 (= call!38788 (+!2517 call!38789 (tuple2!11595 k0!854 v!557))))))

(assert (= (and d!108455 res!595769) b!876741))

(assert (= (and b!876741 c!92591) b!876743))

(assert (= (and b!876741 (not c!92591)) b!876742))

(assert (= (or b!876743 b!876742) bm!38785))

(assert (= (or b!876743 b!876742) bm!38786))

(declare-fun m!816127 () Bool)

(assert (=> d!108455 m!816127))

(assert (=> bm!38785 m!815823))

(assert (=> bm!38786 m!815813))

(declare-fun m!816129 () Bool)

(assert (=> bm!38786 m!816129))

(declare-fun m!816131 () Bool)

(assert (=> b!876743 m!816131))

(assert (=> b!876527 d!108455))

(declare-fun d!108457 () Bool)

(assert (=> d!108457 (= (array_inv!19360 _keys!868) (bvsge (size!24947 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74420 d!108457))

(declare-fun d!108459 () Bool)

(assert (=> d!108459 (= (array_inv!19361 _values!688) (bvsge (size!24948 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74420 d!108459))

(declare-fun b!876744 () Bool)

(declare-fun e!488032 () ListLongMap!10353)

(declare-fun e!488029 () ListLongMap!10353)

(assert (=> b!876744 (= e!488032 e!488029)))

(declare-fun c!92592 () Bool)

(assert (=> b!876744 (= c!92592 (validKeyInArray!0 (select (arr!24505 _keys!868) from!1053)))))

(declare-fun b!876745 () Bool)

(declare-fun e!488035 () Bool)

(declare-fun e!488031 () Bool)

(assert (=> b!876745 (= e!488035 e!488031)))

(declare-fun c!92594 () Bool)

(declare-fun e!488034 () Bool)

(assert (=> b!876745 (= c!92594 e!488034)))

(declare-fun res!595770 () Bool)

(assert (=> b!876745 (=> (not res!595770) (not e!488034))))

(assert (=> b!876745 (= res!595770 (bvslt from!1053 (size!24947 _keys!868)))))

(declare-fun b!876746 () Bool)

(declare-fun lt!396598 () Unit!29927)

(declare-fun lt!396594 () Unit!29927)

(assert (=> b!876746 (= lt!396598 lt!396594)))

(declare-fun lt!396593 () (_ BitVec 64))

(declare-fun lt!396596 () V!28281)

(declare-fun lt!396599 () (_ BitVec 64))

(declare-fun lt!396597 () ListLongMap!10353)

(assert (=> b!876746 (not (contains!4222 (+!2517 lt!396597 (tuple2!11595 lt!396599 lt!396596)) lt!396593))))

(assert (=> b!876746 (= lt!396594 (addStillNotContains!203 lt!396597 lt!396599 lt!396596 lt!396593))))

(assert (=> b!876746 (= lt!396593 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876746 (= lt!396596 (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876746 (= lt!396599 (select (arr!24505 _keys!868) from!1053))))

(declare-fun call!38790 () ListLongMap!10353)

(assert (=> b!876746 (= lt!396597 call!38790)))

(assert (=> b!876746 (= e!488029 (+!2517 call!38790 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876747 () Bool)

(assert (=> b!876747 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24947 _keys!868)))))

(assert (=> b!876747 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24948 lt!396449)))))

(declare-fun e!488030 () Bool)

(declare-fun lt!396595 () ListLongMap!10353)

(assert (=> b!876747 (= e!488030 (= (apply!377 lt!396595 (select (arr!24505 _keys!868) from!1053)) (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876748 () Bool)

(declare-fun e!488033 () Bool)

(assert (=> b!876748 (= e!488033 (isEmpty!668 lt!396595))))

(declare-fun b!876749 () Bool)

(assert (=> b!876749 (= e!488029 call!38790)))

(declare-fun b!876750 () Bool)

(assert (=> b!876750 (= e!488034 (validKeyInArray!0 (select (arr!24505 _keys!868) from!1053)))))

(assert (=> b!876750 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun bm!38787 () Bool)

(assert (=> bm!38787 (= call!38790 (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876752 () Bool)

(assert (=> b!876752 (= e!488033 (= lt!396595 (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876753 () Bool)

(declare-fun res!595771 () Bool)

(assert (=> b!876753 (=> (not res!595771) (not e!488035))))

(assert (=> b!876753 (= res!595771 (not (contains!4222 lt!396595 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876754 () Bool)

(assert (=> b!876754 (= e!488031 e!488033)))

(declare-fun c!92593 () Bool)

(assert (=> b!876754 (= c!92593 (bvslt from!1053 (size!24947 _keys!868)))))

(declare-fun b!876755 () Bool)

(assert (=> b!876755 (= e!488031 e!488030)))

(assert (=> b!876755 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24947 _keys!868)))))

(declare-fun res!595772 () Bool)

(assert (=> b!876755 (= res!595772 (contains!4222 lt!396595 (select (arr!24505 _keys!868) from!1053)))))

(assert (=> b!876755 (=> (not res!595772) (not e!488030))))

(declare-fun d!108461 () Bool)

(assert (=> d!108461 e!488035))

(declare-fun res!595773 () Bool)

(assert (=> d!108461 (=> (not res!595773) (not e!488035))))

(assert (=> d!108461 (= res!595773 (not (contains!4222 lt!396595 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108461 (= lt!396595 e!488032)))

(declare-fun c!92595 () Bool)

(assert (=> d!108461 (= c!92595 (bvsge from!1053 (size!24947 _keys!868)))))

(assert (=> d!108461 (validMask!0 mask!1196)))

(assert (=> d!108461 (= (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396595)))

(declare-fun b!876751 () Bool)

(assert (=> b!876751 (= e!488032 (ListLongMap!10354 Nil!17395))))

(assert (= (and d!108461 c!92595) b!876751))

(assert (= (and d!108461 (not c!92595)) b!876744))

(assert (= (and b!876744 c!92592) b!876746))

(assert (= (and b!876744 (not c!92592)) b!876749))

(assert (= (or b!876746 b!876749) bm!38787))

(assert (= (and d!108461 res!595773) b!876753))

(assert (= (and b!876753 res!595771) b!876745))

(assert (= (and b!876745 res!595770) b!876750))

(assert (= (and b!876745 c!92594) b!876755))

(assert (= (and b!876745 (not c!92594)) b!876754))

(assert (= (and b!876755 res!595772) b!876747))

(assert (= (and b!876754 c!92593) b!876752))

(assert (= (and b!876754 (not c!92593)) b!876748))

(declare-fun b_lambda!12247 () Bool)

(assert (=> (not b_lambda!12247) (not b!876746)))

(assert (=> b!876746 t!24473))

(declare-fun b_and!25009 () Bool)

(assert (= b_and!25007 (and (=> t!24473 result!9493) b_and!25009)))

(declare-fun b_lambda!12249 () Bool)

(assert (=> (not b_lambda!12249) (not b!876747)))

(assert (=> b!876747 t!24473))

(declare-fun b_and!25011 () Bool)

(assert (= b_and!25009 (and (=> t!24473 result!9493) b_and!25011)))

(assert (=> b!876747 m!815839))

(declare-fun m!816133 () Bool)

(assert (=> b!876747 m!816133))

(assert (=> b!876747 m!815839))

(declare-fun m!816135 () Bool)

(assert (=> b!876747 m!816135))

(assert (=> b!876747 m!815805))

(assert (=> b!876747 m!815805))

(declare-fun m!816137 () Bool)

(assert (=> b!876747 m!816137))

(assert (=> b!876747 m!816133))

(assert (=> b!876746 m!815839))

(declare-fun m!816139 () Bool)

(assert (=> b!876746 m!816139))

(assert (=> b!876746 m!816133))

(assert (=> b!876746 m!815839))

(assert (=> b!876746 m!816135))

(assert (=> b!876746 m!815805))

(declare-fun m!816141 () Bool)

(assert (=> b!876746 m!816141))

(assert (=> b!876746 m!816139))

(declare-fun m!816143 () Bool)

(assert (=> b!876746 m!816143))

(declare-fun m!816145 () Bool)

(assert (=> b!876746 m!816145))

(assert (=> b!876746 m!816133))

(declare-fun m!816147 () Bool)

(assert (=> bm!38787 m!816147))

(assert (=> b!876744 m!815805))

(assert (=> b!876744 m!815805))

(assert (=> b!876744 m!815807))

(assert (=> b!876755 m!815805))

(assert (=> b!876755 m!815805))

(declare-fun m!816149 () Bool)

(assert (=> b!876755 m!816149))

(declare-fun m!816151 () Bool)

(assert (=> d!108461 m!816151))

(assert (=> d!108461 m!815817))

(assert (=> b!876750 m!815805))

(assert (=> b!876750 m!815805))

(assert (=> b!876750 m!815807))

(declare-fun m!816153 () Bool)

(assert (=> b!876748 m!816153))

(assert (=> b!876752 m!816147))

(declare-fun m!816155 () Bool)

(assert (=> b!876753 m!816155))

(assert (=> b!876528 d!108461))

(declare-fun b!876756 () Bool)

(declare-fun e!488039 () ListLongMap!10353)

(declare-fun e!488036 () ListLongMap!10353)

(assert (=> b!876756 (= e!488039 e!488036)))

(declare-fun c!92596 () Bool)

(assert (=> b!876756 (= c!92596 (validKeyInArray!0 (select (arr!24505 _keys!868) from!1053)))))

(declare-fun b!876757 () Bool)

(declare-fun e!488042 () Bool)

(declare-fun e!488038 () Bool)

(assert (=> b!876757 (= e!488042 e!488038)))

(declare-fun c!92598 () Bool)

(declare-fun e!488041 () Bool)

(assert (=> b!876757 (= c!92598 e!488041)))

(declare-fun res!595774 () Bool)

(assert (=> b!876757 (=> (not res!595774) (not e!488041))))

(assert (=> b!876757 (= res!595774 (bvslt from!1053 (size!24947 _keys!868)))))

(declare-fun b!876758 () Bool)

(declare-fun lt!396605 () Unit!29927)

(declare-fun lt!396601 () Unit!29927)

(assert (=> b!876758 (= lt!396605 lt!396601)))

(declare-fun lt!396606 () (_ BitVec 64))

(declare-fun lt!396600 () (_ BitVec 64))

(declare-fun lt!396604 () ListLongMap!10353)

(declare-fun lt!396603 () V!28281)

(assert (=> b!876758 (not (contains!4222 (+!2517 lt!396604 (tuple2!11595 lt!396606 lt!396603)) lt!396600))))

(assert (=> b!876758 (= lt!396601 (addStillNotContains!203 lt!396604 lt!396606 lt!396603 lt!396600))))

(assert (=> b!876758 (= lt!396600 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876758 (= lt!396603 (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876758 (= lt!396606 (select (arr!24505 _keys!868) from!1053))))

(declare-fun call!38791 () ListLongMap!10353)

(assert (=> b!876758 (= lt!396604 call!38791)))

(assert (=> b!876758 (= e!488036 (+!2517 call!38791 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876759 () Bool)

(assert (=> b!876759 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24947 _keys!868)))))

(assert (=> b!876759 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24948 _values!688)))))

(declare-fun e!488037 () Bool)

(declare-fun lt!396602 () ListLongMap!10353)

(assert (=> b!876759 (= e!488037 (= (apply!377 lt!396602 (select (arr!24505 _keys!868) from!1053)) (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876760 () Bool)

(declare-fun e!488040 () Bool)

(assert (=> b!876760 (= e!488040 (isEmpty!668 lt!396602))))

(declare-fun b!876761 () Bool)

(assert (=> b!876761 (= e!488036 call!38791)))

(declare-fun b!876762 () Bool)

(assert (=> b!876762 (= e!488041 (validKeyInArray!0 (select (arr!24505 _keys!868) from!1053)))))

(assert (=> b!876762 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun bm!38788 () Bool)

(assert (=> bm!38788 (= call!38791 (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876764 () Bool)

(assert (=> b!876764 (= e!488040 (= lt!396602 (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876765 () Bool)

(declare-fun res!595775 () Bool)

(assert (=> b!876765 (=> (not res!595775) (not e!488042))))

(assert (=> b!876765 (= res!595775 (not (contains!4222 lt!396602 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876766 () Bool)

(assert (=> b!876766 (= e!488038 e!488040)))

(declare-fun c!92597 () Bool)

(assert (=> b!876766 (= c!92597 (bvslt from!1053 (size!24947 _keys!868)))))

(declare-fun b!876767 () Bool)

(assert (=> b!876767 (= e!488038 e!488037)))

(assert (=> b!876767 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24947 _keys!868)))))

(declare-fun res!595776 () Bool)

(assert (=> b!876767 (= res!595776 (contains!4222 lt!396602 (select (arr!24505 _keys!868) from!1053)))))

(assert (=> b!876767 (=> (not res!595776) (not e!488037))))

(declare-fun d!108463 () Bool)

(assert (=> d!108463 e!488042))

(declare-fun res!595777 () Bool)

(assert (=> d!108463 (=> (not res!595777) (not e!488042))))

(assert (=> d!108463 (= res!595777 (not (contains!4222 lt!396602 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108463 (= lt!396602 e!488039)))

(declare-fun c!92599 () Bool)

(assert (=> d!108463 (= c!92599 (bvsge from!1053 (size!24947 _keys!868)))))

(assert (=> d!108463 (validMask!0 mask!1196)))

(assert (=> d!108463 (= (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396602)))

(declare-fun b!876763 () Bool)

(assert (=> b!876763 (= e!488039 (ListLongMap!10354 Nil!17395))))

(assert (= (and d!108463 c!92599) b!876763))

(assert (= (and d!108463 (not c!92599)) b!876756))

(assert (= (and b!876756 c!92596) b!876758))

(assert (= (and b!876756 (not c!92596)) b!876761))

(assert (= (or b!876758 b!876761) bm!38788))

(assert (= (and d!108463 res!595777) b!876765))

(assert (= (and b!876765 res!595775) b!876757))

(assert (= (and b!876757 res!595774) b!876762))

(assert (= (and b!876757 c!92598) b!876767))

(assert (= (and b!876757 (not c!92598)) b!876766))

(assert (= (and b!876767 res!595776) b!876759))

(assert (= (and b!876766 c!92597) b!876764))

(assert (= (and b!876766 (not c!92597)) b!876760))

(declare-fun b_lambda!12251 () Bool)

(assert (=> (not b_lambda!12251) (not b!876758)))

(assert (=> b!876758 t!24473))

(declare-fun b_and!25013 () Bool)

(assert (= b_and!25011 (and (=> t!24473 result!9493) b_and!25013)))

(declare-fun b_lambda!12253 () Bool)

(assert (=> (not b_lambda!12253) (not b!876759)))

(assert (=> b!876759 t!24473))

(declare-fun b_and!25015 () Bool)

(assert (= b_and!25013 (and (=> t!24473 result!9493) b_and!25015)))

(assert (=> b!876759 m!815839))

(assert (=> b!876759 m!815837))

(assert (=> b!876759 m!815839))

(declare-fun m!816157 () Bool)

(assert (=> b!876759 m!816157))

(assert (=> b!876759 m!815805))

(assert (=> b!876759 m!815805))

(declare-fun m!816159 () Bool)

(assert (=> b!876759 m!816159))

(assert (=> b!876759 m!815837))

(assert (=> b!876758 m!815839))

(declare-fun m!816161 () Bool)

(assert (=> b!876758 m!816161))

(assert (=> b!876758 m!815837))

(assert (=> b!876758 m!815839))

(assert (=> b!876758 m!816157))

(assert (=> b!876758 m!815805))

(declare-fun m!816163 () Bool)

(assert (=> b!876758 m!816163))

(assert (=> b!876758 m!816161))

(declare-fun m!816165 () Bool)

(assert (=> b!876758 m!816165))

(declare-fun m!816167 () Bool)

(assert (=> b!876758 m!816167))

(assert (=> b!876758 m!815837))

(declare-fun m!816169 () Bool)

(assert (=> bm!38788 m!816169))

(assert (=> b!876756 m!815805))

(assert (=> b!876756 m!815805))

(assert (=> b!876756 m!815807))

(assert (=> b!876767 m!815805))

(assert (=> b!876767 m!815805))

(declare-fun m!816171 () Bool)

(assert (=> b!876767 m!816171))

(declare-fun m!816173 () Bool)

(assert (=> d!108463 m!816173))

(assert (=> d!108463 m!815817))

(assert (=> b!876762 m!815805))

(assert (=> b!876762 m!815805))

(assert (=> b!876762 m!815807))

(declare-fun m!816175 () Bool)

(assert (=> b!876760 m!816175))

(assert (=> b!876764 m!816169))

(declare-fun m!816177 () Bool)

(assert (=> b!876765 m!816177))

(assert (=> b!876528 d!108463))

(declare-fun mapNonEmpty!27758 () Bool)

(declare-fun mapRes!27758 () Bool)

(declare-fun tp!53237 () Bool)

(declare-fun e!488047 () Bool)

(assert (=> mapNonEmpty!27758 (= mapRes!27758 (and tp!53237 e!488047))))

(declare-fun mapValue!27758 () ValueCell!8273)

(declare-fun mapKey!27758 () (_ BitVec 32))

(declare-fun mapRest!27758 () (Array (_ BitVec 32) ValueCell!8273))

(assert (=> mapNonEmpty!27758 (= mapRest!27749 (store mapRest!27758 mapKey!27758 mapValue!27758))))

(declare-fun mapIsEmpty!27758 () Bool)

(assert (=> mapIsEmpty!27758 mapRes!27758))

(declare-fun condMapEmpty!27758 () Bool)

(declare-fun mapDefault!27758 () ValueCell!8273)

(assert (=> mapNonEmpty!27749 (= condMapEmpty!27758 (= mapRest!27749 ((as const (Array (_ BitVec 32) ValueCell!8273)) mapDefault!27758)))))

(declare-fun e!488048 () Bool)

(assert (=> mapNonEmpty!27749 (= tp!53221 (and e!488048 mapRes!27758))))

(declare-fun b!876774 () Bool)

(assert (=> b!876774 (= e!488047 tp_is_empty!17425)))

(declare-fun b!876775 () Bool)

(assert (=> b!876775 (= e!488048 tp_is_empty!17425)))

(assert (= (and mapNonEmpty!27749 condMapEmpty!27758) mapIsEmpty!27758))

(assert (= (and mapNonEmpty!27749 (not condMapEmpty!27758)) mapNonEmpty!27758))

(assert (= (and mapNonEmpty!27758 ((_ is ValueCellFull!8273) mapValue!27758)) b!876774))

(assert (= (and mapNonEmpty!27749 ((_ is ValueCellFull!8273) mapDefault!27758)) b!876775))

(declare-fun m!816179 () Bool)

(assert (=> mapNonEmpty!27758 m!816179))

(declare-fun b_lambda!12255 () Bool)

(assert (= b_lambda!12251 (or (and start!74420 b_free!15181) b_lambda!12255)))

(declare-fun b_lambda!12257 () Bool)

(assert (= b_lambda!12239 (or (and start!74420 b_free!15181) b_lambda!12257)))

(declare-fun b_lambda!12259 () Bool)

(assert (= b_lambda!12253 (or (and start!74420 b_free!15181) b_lambda!12259)))

(declare-fun b_lambda!12261 () Bool)

(assert (= b_lambda!12247 (or (and start!74420 b_free!15181) b_lambda!12261)))

(declare-fun b_lambda!12263 () Bool)

(assert (= b_lambda!12241 (or (and start!74420 b_free!15181) b_lambda!12263)))

(declare-fun b_lambda!12265 () Bool)

(assert (= b_lambda!12249 (or (and start!74420 b_free!15181) b_lambda!12265)))

(declare-fun b_lambda!12267 () Bool)

(assert (= b_lambda!12243 (or (and start!74420 b_free!15181) b_lambda!12267)))

(declare-fun b_lambda!12269 () Bool)

(assert (= b_lambda!12245 (or (and start!74420 b_free!15181) b_lambda!12269)))

(check-sat (not b_lambda!12255) (not b!876675) (not b!876762) (not b!876693) (not b_lambda!12269) (not b_lambda!12265) (not b!876700) (not d!108425) (not b!876683) (not b!876743) (not d!108439) (not bm!38785) (not b!876714) (not b!876702) (not b!876690) (not b!876695) (not b!876752) (not b!876746) (not b!876701) (not mapNonEmpty!27758) (not b!876750) (not b!876708) (not b!876680) (not b!876731) (not d!108461) (not b!876684) b_and!25015 (not b!876678) (not b!876687) (not b!876692) (not bm!38786) (not d!108447) (not b!876712) (not b_lambda!12267) (not b!876753) (not b!876759) (not b!876646) (not b_lambda!12257) (not b!876717) (not bm!38787) (not b_lambda!12259) (not b_lambda!12263) (not d!108443) (not b!876764) (not b!876647) (not b!876755) (not b!876733) (not d!108463) (not b!876676) (not b_lambda!12261) (not b!876715) tp_is_empty!17425 (not d!108445) (not d!108437) (not b!876747) (not b!876732) (not d!108455) (not d!108435) (not b!876748) (not bm!38773) (not b!876703) (not d!108429) (not b!876744) (not bm!38777) (not b_next!15181) (not b!876756) (not b!876758) (not b!876674) (not b!876711) (not b!876681) (not b!876719) (not b!876716) (not b!876718) (not b!876686) (not b!876767) (not bm!38788) (not b!876688) (not b!876760) (not d!108441) (not bm!38780) (not b!876672) (not b_lambda!12237) (not b!876765) (not b!876713) (not b!876710) (not bm!38776) (not b!876709))
(check-sat b_and!25015 (not b_next!15181))
(get-model)

(declare-fun call!38797 () ListLongMap!10353)

(declare-fun bm!38793 () Bool)

(assert (=> bm!38793 (= call!38797 (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876781 () Bool)

(declare-fun e!488051 () Bool)

(declare-fun call!38796 () ListLongMap!10353)

(assert (=> b!876781 (= e!488051 (= call!38796 call!38797))))

(declare-fun bm!38794 () Bool)

(assert (=> bm!38794 (= call!38796 (getCurrentListMapNoExtraKeys!3185 _keys!868 (array!50958 (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24948 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun d!108465 () Bool)

(assert (=> d!108465 e!488051))

(declare-fun c!92602 () Bool)

(assert (=> d!108465 (= c!92602 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(assert (=> d!108465 true))

(declare-fun _$6!59 () Unit!29927)

(assert (=> d!108465 (= (choose!1440 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) _$6!59)))

(declare-fun b!876780 () Bool)

(assert (=> b!876780 (= e!488051 (= call!38796 (+!2517 call!38797 (tuple2!11595 k0!854 v!557))))))

(assert (= (and d!108465 c!92602) b!876780))

(assert (= (and d!108465 (not c!92602)) b!876781))

(assert (= (or b!876780 b!876781) bm!38793))

(assert (= (or b!876780 b!876781) bm!38794))

(assert (=> bm!38793 m!815823))

(assert (=> bm!38794 m!815813))

(assert (=> bm!38794 m!816129))

(declare-fun m!816181 () Bool)

(assert (=> b!876780 m!816181))

(assert (=> d!108455 d!108465))

(declare-fun b!876790 () Bool)

(declare-fun e!488056 () Option!423)

(assert (=> b!876790 (= e!488056 (Some!422 (_2!5808 (h!18525 (toList!5192 lt!396572)))))))

(declare-fun e!488057 () Option!423)

(declare-fun b!876792 () Bool)

(assert (=> b!876792 (= e!488057 (getValueByKey!417 (t!24474 (toList!5192 lt!396572)) (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun d!108467 () Bool)

(declare-fun c!92607 () Bool)

(assert (=> d!108467 (= c!92607 (and ((_ is Cons!17394) (toList!5192 lt!396572)) (= (_1!5808 (h!18525 (toList!5192 lt!396572))) (_1!5808 (tuple2!11595 k0!854 v!557)))))))

(assert (=> d!108467 (= (getValueByKey!417 (toList!5192 lt!396572) (_1!5808 (tuple2!11595 k0!854 v!557))) e!488056)))

(declare-fun b!876793 () Bool)

(assert (=> b!876793 (= e!488057 None!421)))

(declare-fun b!876791 () Bool)

(assert (=> b!876791 (= e!488056 e!488057)))

(declare-fun c!92608 () Bool)

(assert (=> b!876791 (= c!92608 (and ((_ is Cons!17394) (toList!5192 lt!396572)) (not (= (_1!5808 (h!18525 (toList!5192 lt!396572))) (_1!5808 (tuple2!11595 k0!854 v!557))))))))

(assert (= (and d!108467 c!92607) b!876790))

(assert (= (and d!108467 (not c!92607)) b!876791))

(assert (= (and b!876791 c!92608) b!876792))

(assert (= (and b!876791 (not c!92608)) b!876793))

(declare-fun m!816183 () Bool)

(assert (=> b!876792 m!816183))

(assert (=> b!876710 d!108467))

(declare-fun d!108469 () Bool)

(assert (=> d!108469 (= (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (and (not (= (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!876684 d!108469))

(declare-fun d!108471 () Bool)

(declare-fun e!488063 () Bool)

(assert (=> d!108471 e!488063))

(declare-fun res!595780 () Bool)

(assert (=> d!108471 (=> res!595780 e!488063)))

(declare-fun lt!396616 () Bool)

(assert (=> d!108471 (= res!595780 (not lt!396616))))

(declare-fun lt!396618 () Bool)

(assert (=> d!108471 (= lt!396616 lt!396618)))

(declare-fun lt!396617 () Unit!29927)

(declare-fun e!488062 () Unit!29927)

(assert (=> d!108471 (= lt!396617 e!488062)))

(declare-fun c!92611 () Bool)

(assert (=> d!108471 (= c!92611 lt!396618)))

(declare-fun containsKey!401 (List!17398 (_ BitVec 64)) Bool)

(assert (=> d!108471 (= lt!396618 (containsKey!401 (toList!5192 lt!396588) (_1!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!108471 (= (contains!4222 lt!396588 (_1!5808 (tuple2!11595 k0!854 v!557))) lt!396616)))

(declare-fun b!876800 () Bool)

(declare-fun lt!396615 () Unit!29927)

(assert (=> b!876800 (= e!488062 lt!396615)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!311 (List!17398 (_ BitVec 64)) Unit!29927)

(assert (=> b!876800 (= lt!396615 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396588) (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun isDefined!312 (Option!423) Bool)

(assert (=> b!876800 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396588) (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun b!876801 () Bool)

(declare-fun Unit!29933 () Unit!29927)

(assert (=> b!876801 (= e!488062 Unit!29933)))

(declare-fun b!876802 () Bool)

(assert (=> b!876802 (= e!488063 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396588) (_1!5808 (tuple2!11595 k0!854 v!557)))))))

(assert (= (and d!108471 c!92611) b!876800))

(assert (= (and d!108471 (not c!92611)) b!876801))

(assert (= (and d!108471 (not res!595780)) b!876802))

(declare-fun m!816185 () Bool)

(assert (=> d!108471 m!816185))

(declare-fun m!816187 () Bool)

(assert (=> b!876800 m!816187))

(assert (=> b!876800 m!816119))

(assert (=> b!876800 m!816119))

(declare-fun m!816189 () Bool)

(assert (=> b!876800 m!816189))

(assert (=> b!876802 m!816119))

(assert (=> b!876802 m!816119))

(assert (=> b!876802 m!816189))

(assert (=> d!108447 d!108471))

(declare-fun b!876803 () Bool)

(declare-fun e!488064 () Option!423)

(assert (=> b!876803 (= e!488064 (Some!422 (_2!5808 (h!18525 lt!396589))))))

(declare-fun e!488065 () Option!423)

(declare-fun b!876805 () Bool)

(assert (=> b!876805 (= e!488065 (getValueByKey!417 (t!24474 lt!396589) (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun c!92612 () Bool)

(declare-fun d!108473 () Bool)

(assert (=> d!108473 (= c!92612 (and ((_ is Cons!17394) lt!396589) (= (_1!5808 (h!18525 lt!396589)) (_1!5808 (tuple2!11595 k0!854 v!557)))))))

(assert (=> d!108473 (= (getValueByKey!417 lt!396589 (_1!5808 (tuple2!11595 k0!854 v!557))) e!488064)))

(declare-fun b!876806 () Bool)

(assert (=> b!876806 (= e!488065 None!421)))

(declare-fun b!876804 () Bool)

(assert (=> b!876804 (= e!488064 e!488065)))

(declare-fun c!92613 () Bool)

(assert (=> b!876804 (= c!92613 (and ((_ is Cons!17394) lt!396589) (not (= (_1!5808 (h!18525 lt!396589)) (_1!5808 (tuple2!11595 k0!854 v!557))))))))

(assert (= (and d!108473 c!92612) b!876803))

(assert (= (and d!108473 (not c!92612)) b!876804))

(assert (= (and b!876804 c!92613) b!876805))

(assert (= (and b!876804 (not c!92613)) b!876806))

(declare-fun m!816191 () Bool)

(assert (=> b!876805 m!816191))

(assert (=> d!108447 d!108473))

(declare-fun d!108475 () Bool)

(assert (=> d!108475 (= (getValueByKey!417 lt!396589 (_1!5808 (tuple2!11595 k0!854 v!557))) (Some!422 (_2!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun lt!396621 () Unit!29927)

(declare-fun choose!1441 (List!17398 (_ BitVec 64) V!28281) Unit!29927)

(assert (=> d!108475 (= lt!396621 (choose!1441 lt!396589 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun e!488068 () Bool)

(assert (=> d!108475 e!488068))

(declare-fun res!595785 () Bool)

(assert (=> d!108475 (=> (not res!595785) (not e!488068))))

(declare-fun isStrictlySorted!457 (List!17398) Bool)

(assert (=> d!108475 (= res!595785 (isStrictlySorted!457 lt!396589))))

(assert (=> d!108475 (= (lemmaContainsTupThenGetReturnValue!234 lt!396589 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))) lt!396621)))

(declare-fun b!876811 () Bool)

(declare-fun res!595786 () Bool)

(assert (=> b!876811 (=> (not res!595786) (not e!488068))))

(assert (=> b!876811 (= res!595786 (containsKey!401 lt!396589 (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun b!876812 () Bool)

(assert (=> b!876812 (= e!488068 (contains!4223 lt!396589 (tuple2!11595 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557)))))))

(assert (= (and d!108475 res!595785) b!876811))

(assert (= (and b!876811 res!595786) b!876812))

(assert (=> d!108475 m!816113))

(declare-fun m!816193 () Bool)

(assert (=> d!108475 m!816193))

(declare-fun m!816195 () Bool)

(assert (=> d!108475 m!816195))

(declare-fun m!816197 () Bool)

(assert (=> b!876811 m!816197))

(declare-fun m!816199 () Bool)

(assert (=> b!876812 m!816199))

(assert (=> d!108447 d!108475))

(declare-fun b!876833 () Bool)

(declare-fun e!488082 () List!17398)

(declare-fun call!38805 () List!17398)

(assert (=> b!876833 (= e!488082 call!38805)))

(declare-fun b!876834 () Bool)

(declare-fun e!488079 () List!17398)

(assert (=> b!876834 (= e!488079 e!488082)))

(declare-fun c!92622 () Bool)

(assert (=> b!876834 (= c!92622 (and ((_ is Cons!17394) (toList!5192 call!38760)) (= (_1!5808 (h!18525 (toList!5192 call!38760))) (_1!5808 (tuple2!11595 k0!854 v!557)))))))

(declare-fun b!876835 () Bool)

(declare-fun call!38806 () List!17398)

(assert (=> b!876835 (= e!488079 call!38806)))

(declare-fun b!876836 () Bool)

(declare-fun e!488080 () List!17398)

(declare-fun call!38804 () List!17398)

(assert (=> b!876836 (= e!488080 call!38804)))

(declare-fun bm!38801 () Bool)

(assert (=> bm!38801 (= call!38805 call!38806)))

(declare-fun d!108477 () Bool)

(declare-fun e!488081 () Bool)

(assert (=> d!108477 e!488081))

(declare-fun res!595792 () Bool)

(assert (=> d!108477 (=> (not res!595792) (not e!488081))))

(declare-fun lt!396624 () List!17398)

(assert (=> d!108477 (= res!595792 (isStrictlySorted!457 lt!396624))))

(assert (=> d!108477 (= lt!396624 e!488079)))

(declare-fun c!92623 () Bool)

(assert (=> d!108477 (= c!92623 (and ((_ is Cons!17394) (toList!5192 call!38760)) (bvslt (_1!5808 (h!18525 (toList!5192 call!38760))) (_1!5808 (tuple2!11595 k0!854 v!557)))))))

(assert (=> d!108477 (isStrictlySorted!457 (toList!5192 call!38760))))

(assert (=> d!108477 (= (insertStrictlySorted!273 (toList!5192 call!38760) (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))) lt!396624)))

(declare-fun bm!38802 () Bool)

(assert (=> bm!38802 (= call!38804 call!38805)))

(declare-fun c!92625 () Bool)

(declare-fun b!876837 () Bool)

(declare-fun e!488083 () List!17398)

(assert (=> b!876837 (= e!488083 (ite c!92622 (t!24474 (toList!5192 call!38760)) (ite c!92625 (Cons!17394 (h!18525 (toList!5192 call!38760)) (t!24474 (toList!5192 call!38760))) Nil!17395)))))

(declare-fun bm!38803 () Bool)

(declare-fun $colon$colon!537 (List!17398 tuple2!11594) List!17398)

(assert (=> bm!38803 (= call!38806 ($colon$colon!537 e!488083 (ite c!92623 (h!18525 (toList!5192 call!38760)) (tuple2!11595 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))))

(declare-fun c!92624 () Bool)

(assert (=> bm!38803 (= c!92624 c!92623)))

(declare-fun b!876838 () Bool)

(assert (=> b!876838 (= e!488081 (contains!4223 lt!396624 (tuple2!11595 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557)))))))

(declare-fun b!876839 () Bool)

(assert (=> b!876839 (= e!488083 (insertStrictlySorted!273 (t!24474 (toList!5192 call!38760)) (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun b!876840 () Bool)

(assert (=> b!876840 (= c!92625 (and ((_ is Cons!17394) (toList!5192 call!38760)) (bvsgt (_1!5808 (h!18525 (toList!5192 call!38760))) (_1!5808 (tuple2!11595 k0!854 v!557)))))))

(assert (=> b!876840 (= e!488082 e!488080)))

(declare-fun b!876841 () Bool)

(declare-fun res!595791 () Bool)

(assert (=> b!876841 (=> (not res!595791) (not e!488081))))

(assert (=> b!876841 (= res!595791 (containsKey!401 lt!396624 (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun b!876842 () Bool)

(assert (=> b!876842 (= e!488080 call!38804)))

(assert (= (and d!108477 c!92623) b!876835))

(assert (= (and d!108477 (not c!92623)) b!876834))

(assert (= (and b!876834 c!92622) b!876833))

(assert (= (and b!876834 (not c!92622)) b!876840))

(assert (= (and b!876840 c!92625) b!876842))

(assert (= (and b!876840 (not c!92625)) b!876836))

(assert (= (or b!876842 b!876836) bm!38802))

(assert (= (or b!876833 bm!38802) bm!38801))

(assert (= (or b!876835 bm!38801) bm!38803))

(assert (= (and bm!38803 c!92624) b!876839))

(assert (= (and bm!38803 (not c!92624)) b!876837))

(assert (= (and d!108477 res!595792) b!876841))

(assert (= (and b!876841 res!595791) b!876838))

(declare-fun m!816201 () Bool)

(assert (=> d!108477 m!816201))

(declare-fun m!816203 () Bool)

(assert (=> d!108477 m!816203))

(declare-fun m!816205 () Bool)

(assert (=> b!876838 m!816205))

(declare-fun m!816207 () Bool)

(assert (=> b!876841 m!816207))

(declare-fun m!816209 () Bool)

(assert (=> bm!38803 m!816209))

(declare-fun m!816211 () Bool)

(assert (=> b!876839 m!816211))

(assert (=> d!108447 d!108477))

(declare-fun d!108479 () Bool)

(declare-fun e!488085 () Bool)

(assert (=> d!108479 e!488085))

(declare-fun res!595793 () Bool)

(assert (=> d!108479 (=> res!595793 e!488085)))

(declare-fun lt!396626 () Bool)

(assert (=> d!108479 (= res!595793 (not lt!396626))))

(declare-fun lt!396628 () Bool)

(assert (=> d!108479 (= lt!396626 lt!396628)))

(declare-fun lt!396627 () Unit!29927)

(declare-fun e!488084 () Unit!29927)

(assert (=> d!108479 (= lt!396627 e!488084)))

(declare-fun c!92626 () Bool)

(assert (=> d!108479 (= c!92626 lt!396628)))

(assert (=> d!108479 (= lt!396628 (containsKey!401 (toList!5192 lt!396595) (select (arr!24505 _keys!868) from!1053)))))

(assert (=> d!108479 (= (contains!4222 lt!396595 (select (arr!24505 _keys!868) from!1053)) lt!396626)))

(declare-fun b!876843 () Bool)

(declare-fun lt!396625 () Unit!29927)

(assert (=> b!876843 (= e!488084 lt!396625)))

(assert (=> b!876843 (= lt!396625 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396595) (select (arr!24505 _keys!868) from!1053)))))

(assert (=> b!876843 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396595) (select (arr!24505 _keys!868) from!1053)))))

(declare-fun b!876844 () Bool)

(declare-fun Unit!29934 () Unit!29927)

(assert (=> b!876844 (= e!488084 Unit!29934)))

(declare-fun b!876845 () Bool)

(assert (=> b!876845 (= e!488085 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396595) (select (arr!24505 _keys!868) from!1053))))))

(assert (= (and d!108479 c!92626) b!876843))

(assert (= (and d!108479 (not c!92626)) b!876844))

(assert (= (and d!108479 (not res!595793)) b!876845))

(assert (=> d!108479 m!815805))

(declare-fun m!816213 () Bool)

(assert (=> d!108479 m!816213))

(assert (=> b!876843 m!815805))

(declare-fun m!816215 () Bool)

(assert (=> b!876843 m!816215))

(assert (=> b!876843 m!815805))

(declare-fun m!816217 () Bool)

(assert (=> b!876843 m!816217))

(assert (=> b!876843 m!816217))

(declare-fun m!816219 () Bool)

(assert (=> b!876843 m!816219))

(assert (=> b!876845 m!815805))

(assert (=> b!876845 m!816217))

(assert (=> b!876845 m!816217))

(assert (=> b!876845 m!816219))

(assert (=> b!876755 d!108479))

(declare-fun d!108481 () Bool)

(declare-fun get!12903 (Option!423) V!28281)

(assert (=> d!108481 (= (apply!377 lt!396602 (select (arr!24505 _keys!868) from!1053)) (get!12903 (getValueByKey!417 (toList!5192 lt!396602) (select (arr!24505 _keys!868) from!1053))))))

(declare-fun bs!24587 () Bool)

(assert (= bs!24587 d!108481))

(assert (=> bs!24587 m!815805))

(declare-fun m!816221 () Bool)

(assert (=> bs!24587 m!816221))

(assert (=> bs!24587 m!816221))

(declare-fun m!816223 () Bool)

(assert (=> bs!24587 m!816223))

(assert (=> b!876759 d!108481))

(declare-fun d!108483 () Bool)

(declare-fun c!92627 () Bool)

(assert (=> d!108483 (= c!92627 ((_ is ValueCellFull!8273) (select (arr!24506 _values!688) from!1053)))))

(declare-fun e!488086 () V!28281)

(assert (=> d!108483 (= (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!488086)))

(declare-fun b!876846 () Bool)

(assert (=> b!876846 (= e!488086 (get!12901 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876847 () Bool)

(assert (=> b!876847 (= e!488086 (get!12902 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108483 c!92627) b!876846))

(assert (= (and d!108483 (not c!92627)) b!876847))

(assert (=> b!876846 m!815837))

(assert (=> b!876846 m!815839))

(declare-fun m!816225 () Bool)

(assert (=> b!876846 m!816225))

(assert (=> b!876847 m!815837))

(assert (=> b!876847 m!815839))

(declare-fun m!816227 () Bool)

(assert (=> b!876847 m!816227))

(assert (=> b!876759 d!108483))

(declare-fun d!108485 () Bool)

(assert (=> d!108485 (= (get!12901 (select (arr!24506 _values!688) from!1053) lt!396452) (v!11187 (select (arr!24506 _values!688) from!1053)))))

(assert (=> b!876700 d!108485))

(declare-fun d!108487 () Bool)

(declare-fun e!488088 () Bool)

(assert (=> d!108487 e!488088))

(declare-fun res!595794 () Bool)

(assert (=> d!108487 (=> res!595794 e!488088)))

(declare-fun lt!396630 () Bool)

(assert (=> d!108487 (= res!595794 (not lt!396630))))

(declare-fun lt!396632 () Bool)

(assert (=> d!108487 (= lt!396630 lt!396632)))

(declare-fun lt!396631 () Unit!29927)

(declare-fun e!488087 () Unit!29927)

(assert (=> d!108487 (= lt!396631 e!488087)))

(declare-fun c!92628 () Bool)

(assert (=> d!108487 (= c!92628 lt!396632)))

(assert (=> d!108487 (= lt!396632 (containsKey!401 (toList!5192 lt!396543) (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> d!108487 (= (contains!4222 lt!396543 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) lt!396630)))

(declare-fun b!876848 () Bool)

(declare-fun lt!396629 () Unit!29927)

(assert (=> b!876848 (= e!488087 lt!396629)))

(assert (=> b!876848 (= lt!396629 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396543) (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!876848 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396543) (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!876849 () Bool)

(declare-fun Unit!29935 () Unit!29927)

(assert (=> b!876849 (= e!488087 Unit!29935)))

(declare-fun b!876850 () Bool)

(assert (=> b!876850 (= e!488088 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396543) (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))))

(assert (= (and d!108487 c!92628) b!876848))

(assert (= (and d!108487 (not c!92628)) b!876849))

(assert (= (and d!108487 (not res!595794)) b!876850))

(assert (=> d!108487 m!815989))

(declare-fun m!816229 () Bool)

(assert (=> d!108487 m!816229))

(assert (=> b!876848 m!815989))

(declare-fun m!816231 () Bool)

(assert (=> b!876848 m!816231))

(assert (=> b!876848 m!815989))

(declare-fun m!816233 () Bool)

(assert (=> b!876848 m!816233))

(assert (=> b!876848 m!816233))

(declare-fun m!816235 () Bool)

(assert (=> b!876848 m!816235))

(assert (=> b!876850 m!815989))

(assert (=> b!876850 m!816233))

(assert (=> b!876850 m!816233))

(assert (=> b!876850 m!816235))

(assert (=> b!876683 d!108487))

(declare-fun b!876851 () Bool)

(declare-fun e!488092 () ListLongMap!10353)

(declare-fun e!488089 () ListLongMap!10353)

(assert (=> b!876851 (= e!488092 e!488089)))

(declare-fun c!92629 () Bool)

(assert (=> b!876851 (= c!92629 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(declare-fun b!876852 () Bool)

(declare-fun e!488095 () Bool)

(declare-fun e!488091 () Bool)

(assert (=> b!876852 (= e!488095 e!488091)))

(declare-fun c!92631 () Bool)

(declare-fun e!488094 () Bool)

(assert (=> b!876852 (= c!92631 e!488094)))

(declare-fun res!595795 () Bool)

(assert (=> b!876852 (=> (not res!595795) (not e!488094))))

(assert (=> b!876852 (= res!595795 (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(declare-fun b!876853 () Bool)

(declare-fun lt!396638 () Unit!29927)

(declare-fun lt!396634 () Unit!29927)

(assert (=> b!876853 (= lt!396638 lt!396634)))

(declare-fun lt!396639 () (_ BitVec 64))

(declare-fun lt!396633 () (_ BitVec 64))

(declare-fun lt!396637 () ListLongMap!10353)

(declare-fun lt!396636 () V!28281)

(assert (=> b!876853 (not (contains!4222 (+!2517 lt!396637 (tuple2!11595 lt!396639 lt!396636)) lt!396633))))

(assert (=> b!876853 (= lt!396634 (addStillNotContains!203 lt!396637 lt!396639 lt!396636 lt!396633))))

(assert (=> b!876853 (= lt!396633 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876853 (= lt!396636 (get!12898 (select (arr!24506 lt!396449) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876853 (= lt!396639 (select (arr!24505 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001)))))

(declare-fun call!38807 () ListLongMap!10353)

(assert (=> b!876853 (= lt!396637 call!38807)))

(assert (=> b!876853 (= e!488089 (+!2517 call!38807 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001)) (get!12898 (select (arr!24506 lt!396449) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876854 () Bool)

(assert (=> b!876854 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(assert (=> b!876854 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24948 lt!396449)))))

(declare-fun e!488090 () Bool)

(declare-fun lt!396635 () ListLongMap!10353)

(assert (=> b!876854 (= e!488090 (= (apply!377 lt!396635 (select (arr!24505 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))) (get!12898 (select (arr!24506 lt!396449) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876855 () Bool)

(declare-fun e!488093 () Bool)

(assert (=> b!876855 (= e!488093 (isEmpty!668 lt!396635))))

(declare-fun b!876856 () Bool)

(assert (=> b!876856 (= e!488089 call!38807)))

(declare-fun b!876857 () Bool)

(assert (=> b!876857 (= e!488094 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!876857 (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun bm!38804 () Bool)

(assert (=> bm!38804 (= call!38807 (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876859 () Bool)

(assert (=> b!876859 (= e!488093 (= lt!396635 (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876860 () Bool)

(declare-fun res!595796 () Bool)

(assert (=> b!876860 (=> (not res!595796) (not e!488095))))

(assert (=> b!876860 (= res!595796 (not (contains!4222 lt!396635 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876861 () Bool)

(assert (=> b!876861 (= e!488091 e!488093)))

(declare-fun c!92630 () Bool)

(assert (=> b!876861 (= c!92630 (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(declare-fun b!876862 () Bool)

(assert (=> b!876862 (= e!488091 e!488090)))

(assert (=> b!876862 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(declare-fun res!595797 () Bool)

(assert (=> b!876862 (= res!595797 (contains!4222 lt!396635 (select (arr!24505 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!876862 (=> (not res!595797) (not e!488090))))

(declare-fun d!108489 () Bool)

(assert (=> d!108489 e!488095))

(declare-fun res!595798 () Bool)

(assert (=> d!108489 (=> (not res!595798) (not e!488095))))

(assert (=> d!108489 (= res!595798 (not (contains!4222 lt!396635 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108489 (= lt!396635 e!488092)))

(declare-fun c!92632 () Bool)

(assert (=> d!108489 (= c!92632 (bvsge (bvadd from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(assert (=> d!108489 (validMask!0 mask!1196)))

(assert (=> d!108489 (= (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696) lt!396635)))

(declare-fun b!876858 () Bool)

(assert (=> b!876858 (= e!488092 (ListLongMap!10354 Nil!17395))))

(assert (= (and d!108489 c!92632) b!876858))

(assert (= (and d!108489 (not c!92632)) b!876851))

(assert (= (and b!876851 c!92629) b!876853))

(assert (= (and b!876851 (not c!92629)) b!876856))

(assert (= (or b!876853 b!876856) bm!38804))

(assert (= (and d!108489 res!595798) b!876860))

(assert (= (and b!876860 res!595796) b!876852))

(assert (= (and b!876852 res!595795) b!876857))

(assert (= (and b!876852 c!92631) b!876862))

(assert (= (and b!876852 (not c!92631)) b!876861))

(assert (= (and b!876862 res!595797) b!876854))

(assert (= (and b!876861 c!92630) b!876859))

(assert (= (and b!876861 (not c!92630)) b!876855))

(declare-fun b_lambda!12271 () Bool)

(assert (=> (not b_lambda!12271) (not b!876853)))

(assert (=> b!876853 t!24473))

(declare-fun b_and!25017 () Bool)

(assert (= b_and!25015 (and (=> t!24473 result!9493) b_and!25017)))

(declare-fun b_lambda!12273 () Bool)

(assert (=> (not b_lambda!12273) (not b!876854)))

(assert (=> b!876854 t!24473))

(declare-fun b_and!25019 () Bool)

(assert (= b_and!25017 (and (=> t!24473 result!9493) b_and!25019)))

(assert (=> b!876854 m!815839))

(declare-fun m!816237 () Bool)

(assert (=> b!876854 m!816237))

(assert (=> b!876854 m!815839))

(declare-fun m!816239 () Bool)

(assert (=> b!876854 m!816239))

(declare-fun m!816241 () Bool)

(assert (=> b!876854 m!816241))

(assert (=> b!876854 m!816241))

(declare-fun m!816243 () Bool)

(assert (=> b!876854 m!816243))

(assert (=> b!876854 m!816237))

(assert (=> b!876853 m!815839))

(declare-fun m!816245 () Bool)

(assert (=> b!876853 m!816245))

(assert (=> b!876853 m!816237))

(assert (=> b!876853 m!815839))

(assert (=> b!876853 m!816239))

(assert (=> b!876853 m!816241))

(declare-fun m!816247 () Bool)

(assert (=> b!876853 m!816247))

(assert (=> b!876853 m!816245))

(declare-fun m!816249 () Bool)

(assert (=> b!876853 m!816249))

(declare-fun m!816251 () Bool)

(assert (=> b!876853 m!816251))

(assert (=> b!876853 m!816237))

(declare-fun m!816253 () Bool)

(assert (=> bm!38804 m!816253))

(assert (=> b!876851 m!816241))

(assert (=> b!876851 m!816241))

(declare-fun m!816255 () Bool)

(assert (=> b!876851 m!816255))

(assert (=> b!876862 m!816241))

(assert (=> b!876862 m!816241))

(declare-fun m!816257 () Bool)

(assert (=> b!876862 m!816257))

(declare-fun m!816259 () Bool)

(assert (=> d!108489 m!816259))

(assert (=> d!108489 m!815817))

(assert (=> b!876857 m!816241))

(assert (=> b!876857 m!816241))

(assert (=> b!876857 m!816255))

(declare-fun m!816261 () Bool)

(assert (=> b!876855 m!816261))

(assert (=> b!876859 m!816253))

(declare-fun m!816263 () Bool)

(assert (=> b!876860 m!816263))

(assert (=> bm!38787 d!108489))

(declare-fun d!108491 () Bool)

(declare-fun e!488097 () Bool)

(assert (=> d!108491 e!488097))

(declare-fun res!595799 () Bool)

(assert (=> d!108491 (=> res!595799 e!488097)))

(declare-fun lt!396641 () Bool)

(assert (=> d!108491 (= res!595799 (not lt!396641))))

(declare-fun lt!396643 () Bool)

(assert (=> d!108491 (= lt!396641 lt!396643)))

(declare-fun lt!396642 () Unit!29927)

(declare-fun e!488096 () Unit!29927)

(assert (=> d!108491 (= lt!396642 e!488096)))

(declare-fun c!92633 () Bool)

(assert (=> d!108491 (= c!92633 lt!396643)))

(assert (=> d!108491 (= lt!396643 (containsKey!401 (toList!5192 lt!396595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108491 (= (contains!4222 lt!396595 #b1000000000000000000000000000000000000000000000000000000000000000) lt!396641)))

(declare-fun b!876863 () Bool)

(declare-fun lt!396640 () Unit!29927)

(assert (=> b!876863 (= e!488096 lt!396640)))

(assert (=> b!876863 (= lt!396640 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!876863 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396595) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!876864 () Bool)

(declare-fun Unit!29936 () Unit!29927)

(assert (=> b!876864 (= e!488096 Unit!29936)))

(declare-fun b!876865 () Bool)

(assert (=> b!876865 (= e!488097 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396595) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108491 c!92633) b!876863))

(assert (= (and d!108491 (not c!92633)) b!876864))

(assert (= (and d!108491 (not res!595799)) b!876865))

(declare-fun m!816265 () Bool)

(assert (=> d!108491 m!816265))

(declare-fun m!816267 () Bool)

(assert (=> b!876863 m!816267))

(declare-fun m!816269 () Bool)

(assert (=> b!876863 m!816269))

(assert (=> b!876863 m!816269))

(declare-fun m!816271 () Bool)

(assert (=> b!876863 m!816271))

(assert (=> b!876865 m!816269))

(assert (=> b!876865 m!816269))

(assert (=> b!876865 m!816271))

(assert (=> b!876753 d!108491))

(declare-fun d!108493 () Bool)

(declare-fun e!488099 () Bool)

(assert (=> d!108493 e!488099))

(declare-fun res!595800 () Bool)

(assert (=> d!108493 (=> res!595800 e!488099)))

(declare-fun lt!396645 () Bool)

(assert (=> d!108493 (= res!595800 (not lt!396645))))

(declare-fun lt!396647 () Bool)

(assert (=> d!108493 (= lt!396645 lt!396647)))

(declare-fun lt!396646 () Unit!29927)

(declare-fun e!488098 () Unit!29927)

(assert (=> d!108493 (= lt!396646 e!488098)))

(declare-fun c!92634 () Bool)

(assert (=> d!108493 (= c!92634 lt!396647)))

(assert (=> d!108493 (= lt!396647 (containsKey!401 (toList!5192 lt!396584) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(assert (=> d!108493 (= (contains!4222 lt!396584 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))) lt!396645)))

(declare-fun b!876866 () Bool)

(declare-fun lt!396644 () Unit!29927)

(assert (=> b!876866 (= e!488098 lt!396644)))

(assert (=> b!876866 (= lt!396644 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396584) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(assert (=> b!876866 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396584) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(declare-fun b!876867 () Bool)

(declare-fun Unit!29937 () Unit!29927)

(assert (=> b!876867 (= e!488098 Unit!29937)))

(declare-fun b!876868 () Bool)

(assert (=> b!876868 (= e!488099 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396584) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))))

(assert (= (and d!108493 c!92634) b!876866))

(assert (= (and d!108493 (not c!92634)) b!876867))

(assert (= (and d!108493 (not res!595800)) b!876868))

(declare-fun m!816273 () Bool)

(assert (=> d!108493 m!816273))

(declare-fun m!816275 () Bool)

(assert (=> b!876866 m!816275))

(assert (=> b!876866 m!816107))

(assert (=> b!876866 m!816107))

(declare-fun m!816277 () Bool)

(assert (=> b!876866 m!816277))

(assert (=> b!876868 m!816107))

(assert (=> b!876868 m!816107))

(assert (=> b!876868 m!816277))

(assert (=> d!108445 d!108493))

(declare-fun b!876869 () Bool)

(declare-fun e!488100 () Option!423)

(assert (=> b!876869 (= e!488100 (Some!422 (_2!5808 (h!18525 lt!396585))))))

(declare-fun b!876871 () Bool)

(declare-fun e!488101 () Option!423)

(assert (=> b!876871 (= e!488101 (getValueByKey!417 (t!24474 lt!396585) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(declare-fun d!108495 () Bool)

(declare-fun c!92635 () Bool)

(assert (=> d!108495 (= c!92635 (and ((_ is Cons!17394) lt!396585) (= (_1!5808 (h!18525 lt!396585)) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))))

(assert (=> d!108495 (= (getValueByKey!417 lt!396585 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))) e!488100)))

(declare-fun b!876872 () Bool)

(assert (=> b!876872 (= e!488101 None!421)))

(declare-fun b!876870 () Bool)

(assert (=> b!876870 (= e!488100 e!488101)))

(declare-fun c!92636 () Bool)

(assert (=> b!876870 (= c!92636 (and ((_ is Cons!17394) lt!396585) (not (= (_1!5808 (h!18525 lt!396585)) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))))

(assert (= (and d!108495 c!92635) b!876869))

(assert (= (and d!108495 (not c!92635)) b!876870))

(assert (= (and b!876870 c!92636) b!876871))

(assert (= (and b!876870 (not c!92636)) b!876872))

(declare-fun m!816279 () Bool)

(assert (=> b!876871 m!816279))

(assert (=> d!108445 d!108495))

(declare-fun d!108497 () Bool)

(assert (=> d!108497 (= (getValueByKey!417 lt!396585 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))) (Some!422 (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(declare-fun lt!396648 () Unit!29927)

(assert (=> d!108497 (= lt!396648 (choose!1441 lt!396585 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(declare-fun e!488102 () Bool)

(assert (=> d!108497 e!488102))

(declare-fun res!595801 () Bool)

(assert (=> d!108497 (=> (not res!595801) (not e!488102))))

(assert (=> d!108497 (= res!595801 (isStrictlySorted!457 lt!396585))))

(assert (=> d!108497 (= (lemmaContainsTupThenGetReturnValue!234 lt!396585 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))) lt!396648)))

(declare-fun b!876873 () Bool)

(declare-fun res!595802 () Bool)

(assert (=> b!876873 (=> (not res!595802) (not e!488102))))

(assert (=> b!876873 (= res!595802 (containsKey!401 lt!396585 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(declare-fun b!876874 () Bool)

(assert (=> b!876874 (= e!488102 (contains!4223 lt!396585 (tuple2!11595 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))))

(assert (= (and d!108497 res!595801) b!876873))

(assert (= (and b!876873 res!595802) b!876874))

(assert (=> d!108497 m!816101))

(declare-fun m!816281 () Bool)

(assert (=> d!108497 m!816281))

(declare-fun m!816283 () Bool)

(assert (=> d!108497 m!816283))

(declare-fun m!816285 () Bool)

(assert (=> b!876873 m!816285))

(declare-fun m!816287 () Bool)

(assert (=> b!876874 m!816287))

(assert (=> d!108445 d!108497))

(declare-fun b!876875 () Bool)

(declare-fun e!488106 () List!17398)

(declare-fun call!38809 () List!17398)

(assert (=> b!876875 (= e!488106 call!38809)))

(declare-fun b!876876 () Bool)

(declare-fun e!488103 () List!17398)

(assert (=> b!876876 (= e!488103 e!488106)))

(declare-fun c!92637 () Bool)

(assert (=> b!876876 (= c!92637 (and ((_ is Cons!17394) (toList!5192 lt!396450)) (= (_1!5808 (h!18525 (toList!5192 lt!396450))) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))))

(declare-fun b!876877 () Bool)

(declare-fun call!38810 () List!17398)

(assert (=> b!876877 (= e!488103 call!38810)))

(declare-fun b!876878 () Bool)

(declare-fun e!488104 () List!17398)

(declare-fun call!38808 () List!17398)

(assert (=> b!876878 (= e!488104 call!38808)))

(declare-fun bm!38805 () Bool)

(assert (=> bm!38805 (= call!38809 call!38810)))

(declare-fun d!108499 () Bool)

(declare-fun e!488105 () Bool)

(assert (=> d!108499 e!488105))

(declare-fun res!595804 () Bool)

(assert (=> d!108499 (=> (not res!595804) (not e!488105))))

(declare-fun lt!396649 () List!17398)

(assert (=> d!108499 (= res!595804 (isStrictlySorted!457 lt!396649))))

(assert (=> d!108499 (= lt!396649 e!488103)))

(declare-fun c!92638 () Bool)

(assert (=> d!108499 (= c!92638 (and ((_ is Cons!17394) (toList!5192 lt!396450)) (bvslt (_1!5808 (h!18525 (toList!5192 lt!396450))) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))))

(assert (=> d!108499 (isStrictlySorted!457 (toList!5192 lt!396450))))

(assert (=> d!108499 (= (insertStrictlySorted!273 (toList!5192 lt!396450) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))) lt!396649)))

(declare-fun bm!38806 () Bool)

(assert (=> bm!38806 (= call!38808 call!38809)))

(declare-fun b!876879 () Bool)

(declare-fun c!92640 () Bool)

(declare-fun e!488107 () List!17398)

(assert (=> b!876879 (= e!488107 (ite c!92637 (t!24474 (toList!5192 lt!396450)) (ite c!92640 (Cons!17394 (h!18525 (toList!5192 lt!396450)) (t!24474 (toList!5192 lt!396450))) Nil!17395)))))

(declare-fun bm!38807 () Bool)

(assert (=> bm!38807 (= call!38810 ($colon$colon!537 e!488107 (ite c!92638 (h!18525 (toList!5192 lt!396450)) (tuple2!11595 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))))

(declare-fun c!92639 () Bool)

(assert (=> bm!38807 (= c!92639 c!92638)))

(declare-fun b!876880 () Bool)

(assert (=> b!876880 (= e!488105 (contains!4223 lt!396649 (tuple2!11595 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))))

(declare-fun b!876881 () Bool)

(assert (=> b!876881 (= e!488107 (insertStrictlySorted!273 (t!24474 (toList!5192 lt!396450)) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(declare-fun b!876882 () Bool)

(assert (=> b!876882 (= c!92640 (and ((_ is Cons!17394) (toList!5192 lt!396450)) (bvsgt (_1!5808 (h!18525 (toList!5192 lt!396450))) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))))

(assert (=> b!876882 (= e!488106 e!488104)))

(declare-fun b!876883 () Bool)

(declare-fun res!595803 () Bool)

(assert (=> b!876883 (=> (not res!595803) (not e!488105))))

(assert (=> b!876883 (= res!595803 (containsKey!401 lt!396649 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(declare-fun b!876884 () Bool)

(assert (=> b!876884 (= e!488104 call!38808)))

(assert (= (and d!108499 c!92638) b!876877))

(assert (= (and d!108499 (not c!92638)) b!876876))

(assert (= (and b!876876 c!92637) b!876875))

(assert (= (and b!876876 (not c!92637)) b!876882))

(assert (= (and b!876882 c!92640) b!876884))

(assert (= (and b!876882 (not c!92640)) b!876878))

(assert (= (or b!876884 b!876878) bm!38806))

(assert (= (or b!876875 bm!38806) bm!38805))

(assert (= (or b!876877 bm!38805) bm!38807))

(assert (= (and bm!38807 c!92639) b!876881))

(assert (= (and bm!38807 (not c!92639)) b!876879))

(assert (= (and d!108499 res!595804) b!876883))

(assert (= (and b!876883 res!595803) b!876880))

(declare-fun m!816289 () Bool)

(assert (=> d!108499 m!816289))

(declare-fun m!816291 () Bool)

(assert (=> d!108499 m!816291))

(declare-fun m!816293 () Bool)

(assert (=> b!876880 m!816293))

(declare-fun m!816295 () Bool)

(assert (=> b!876883 m!816295))

(declare-fun m!816297 () Bool)

(assert (=> bm!38807 m!816297))

(declare-fun m!816299 () Bool)

(assert (=> b!876881 m!816299))

(assert (=> d!108445 d!108499))

(declare-fun d!108501 () Bool)

(assert (=> d!108501 (= (validKeyInArray!0 (select (arr!24505 _keys!868) #b00000000000000000000000000000000)) (and (not (= (select (arr!24505 _keys!868) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24505 _keys!868) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!876731 d!108501))

(assert (=> b!876733 d!108501))

(declare-fun d!108503 () Bool)

(declare-fun isEmpty!669 (List!17398) Bool)

(assert (=> d!108503 (= (isEmpty!668 lt!396550) (isEmpty!669 (toList!5192 lt!396550)))))

(declare-fun bs!24588 () Bool)

(assert (= bs!24588 d!108503))

(declare-fun m!816301 () Bool)

(assert (=> bs!24588 m!816301))

(assert (=> b!876688 d!108503))

(declare-fun b!876885 () Bool)

(declare-fun e!488108 () Option!423)

(assert (=> b!876885 (= e!488108 (Some!422 (_2!5808 (h!18525 (toList!5192 lt!396584)))))))

(declare-fun e!488109 () Option!423)

(declare-fun b!876887 () Bool)

(assert (=> b!876887 (= e!488109 (getValueByKey!417 (t!24474 (toList!5192 lt!396584)) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))

(declare-fun c!92641 () Bool)

(declare-fun d!108505 () Bool)

(assert (=> d!108505 (= c!92641 (and ((_ is Cons!17394) (toList!5192 lt!396584)) (= (_1!5808 (h!18525 (toList!5192 lt!396584))) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))))

(assert (=> d!108505 (= (getValueByKey!417 (toList!5192 lt!396584) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))) e!488108)))

(declare-fun b!876888 () Bool)

(assert (=> b!876888 (= e!488109 None!421)))

(declare-fun b!876886 () Bool)

(assert (=> b!876886 (= e!488108 e!488109)))

(declare-fun c!92642 () Bool)

(assert (=> b!876886 (= c!92642 (and ((_ is Cons!17394) (toList!5192 lt!396584)) (not (= (_1!5808 (h!18525 (toList!5192 lt!396584))) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448))))))))

(assert (= (and d!108505 c!92641) b!876885))

(assert (= (and d!108505 (not c!92641)) b!876886))

(assert (= (and b!876886 c!92642) b!876887))

(assert (= (and b!876886 (not c!92642)) b!876888))

(declare-fun m!816303 () Bool)

(assert (=> b!876887 m!816303))

(assert (=> b!876716 d!108505))

(declare-fun d!108507 () Bool)

(declare-fun e!488110 () Bool)

(assert (=> d!108507 e!488110))

(declare-fun res!595805 () Bool)

(assert (=> d!108507 (=> (not res!595805) (not e!488110))))

(declare-fun lt!396652 () ListLongMap!10353)

(assert (=> d!108507 (= res!595805 (contains!4222 lt!396652 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!396653 () List!17398)

(assert (=> d!108507 (= lt!396652 (ListLongMap!10354 lt!396653))))

(declare-fun lt!396650 () Unit!29927)

(declare-fun lt!396651 () Unit!29927)

(assert (=> d!108507 (= lt!396650 lt!396651)))

(assert (=> d!108507 (= (getValueByKey!417 lt!396653 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108507 (= lt!396651 (lemmaContainsTupThenGetReturnValue!234 lt!396653 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108507 (= lt!396653 (insertStrictlySorted!273 (toList!5192 call!38780) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108507 (= (+!2517 call!38780 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!396652)))

(declare-fun b!876889 () Bool)

(declare-fun res!595806 () Bool)

(assert (=> b!876889 (=> (not res!595806) (not e!488110))))

(assert (=> b!876889 (= res!595806 (= (getValueByKey!417 (toList!5192 lt!396652) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!876890 () Bool)

(assert (=> b!876890 (= e!488110 (contains!4223 (toList!5192 lt!396652) (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108507 res!595805) b!876889))

(assert (= (and b!876889 res!595806) b!876890))

(declare-fun m!816305 () Bool)

(assert (=> d!108507 m!816305))

(declare-fun m!816307 () Bool)

(assert (=> d!108507 m!816307))

(declare-fun m!816309 () Bool)

(assert (=> d!108507 m!816309))

(declare-fun m!816311 () Bool)

(assert (=> d!108507 m!816311))

(declare-fun m!816313 () Bool)

(assert (=> b!876889 m!816313))

(declare-fun m!816315 () Bool)

(assert (=> b!876890 m!816315))

(assert (=> b!876686 d!108507))

(declare-fun d!108509 () Bool)

(declare-fun c!92643 () Bool)

(assert (=> d!108509 (= c!92643 ((_ is ValueCellFull!8273) (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun e!488111 () V!28281)

(assert (=> d!108509 (= (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!488111)))

(declare-fun b!876891 () Bool)

(assert (=> b!876891 (= e!488111 (get!12901 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876892 () Bool)

(assert (=> b!876892 (= e!488111 (get!12902 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108509 c!92643) b!876891))

(assert (= (and d!108509 (not c!92643)) b!876892))

(assert (=> b!876891 m!816013))

(assert (=> b!876891 m!815839))

(declare-fun m!816317 () Bool)

(assert (=> b!876891 m!816317))

(assert (=> b!876892 m!816013))

(assert (=> b!876892 m!815839))

(declare-fun m!816319 () Bool)

(assert (=> b!876892 m!816319))

(assert (=> b!876686 d!108509))

(declare-fun d!108511 () Bool)

(declare-fun e!488112 () Bool)

(assert (=> d!108511 e!488112))

(declare-fun res!595807 () Bool)

(assert (=> d!108511 (=> (not res!595807) (not e!488112))))

(declare-fun lt!396656 () ListLongMap!10353)

(assert (=> d!108511 (= res!595807 (contains!4222 lt!396656 (_1!5808 (tuple2!11595 lt!396554 lt!396551))))))

(declare-fun lt!396657 () List!17398)

(assert (=> d!108511 (= lt!396656 (ListLongMap!10354 lt!396657))))

(declare-fun lt!396654 () Unit!29927)

(declare-fun lt!396655 () Unit!29927)

(assert (=> d!108511 (= lt!396654 lt!396655)))

(assert (=> d!108511 (= (getValueByKey!417 lt!396657 (_1!5808 (tuple2!11595 lt!396554 lt!396551))) (Some!422 (_2!5808 (tuple2!11595 lt!396554 lt!396551))))))

(assert (=> d!108511 (= lt!396655 (lemmaContainsTupThenGetReturnValue!234 lt!396657 (_1!5808 (tuple2!11595 lt!396554 lt!396551)) (_2!5808 (tuple2!11595 lt!396554 lt!396551))))))

(assert (=> d!108511 (= lt!396657 (insertStrictlySorted!273 (toList!5192 lt!396552) (_1!5808 (tuple2!11595 lt!396554 lt!396551)) (_2!5808 (tuple2!11595 lt!396554 lt!396551))))))

(assert (=> d!108511 (= (+!2517 lt!396552 (tuple2!11595 lt!396554 lt!396551)) lt!396656)))

(declare-fun b!876893 () Bool)

(declare-fun res!595808 () Bool)

(assert (=> b!876893 (=> (not res!595808) (not e!488112))))

(assert (=> b!876893 (= res!595808 (= (getValueByKey!417 (toList!5192 lt!396656) (_1!5808 (tuple2!11595 lt!396554 lt!396551))) (Some!422 (_2!5808 (tuple2!11595 lt!396554 lt!396551)))))))

(declare-fun b!876894 () Bool)

(assert (=> b!876894 (= e!488112 (contains!4223 (toList!5192 lt!396656) (tuple2!11595 lt!396554 lt!396551)))))

(assert (= (and d!108511 res!595807) b!876893))

(assert (= (and b!876893 res!595808) b!876894))

(declare-fun m!816321 () Bool)

(assert (=> d!108511 m!816321))

(declare-fun m!816323 () Bool)

(assert (=> d!108511 m!816323))

(declare-fun m!816325 () Bool)

(assert (=> d!108511 m!816325))

(declare-fun m!816327 () Bool)

(assert (=> d!108511 m!816327))

(declare-fun m!816329 () Bool)

(assert (=> b!876893 m!816329))

(declare-fun m!816331 () Bool)

(assert (=> b!876894 m!816331))

(assert (=> b!876686 d!108511))

(declare-fun d!108513 () Bool)

(declare-fun e!488114 () Bool)

(assert (=> d!108513 e!488114))

(declare-fun res!595809 () Bool)

(assert (=> d!108513 (=> res!595809 e!488114)))

(declare-fun lt!396659 () Bool)

(assert (=> d!108513 (= res!595809 (not lt!396659))))

(declare-fun lt!396661 () Bool)

(assert (=> d!108513 (= lt!396659 lt!396661)))

(declare-fun lt!396660 () Unit!29927)

(declare-fun e!488113 () Unit!29927)

(assert (=> d!108513 (= lt!396660 e!488113)))

(declare-fun c!92644 () Bool)

(assert (=> d!108513 (= c!92644 lt!396661)))

(assert (=> d!108513 (= lt!396661 (containsKey!401 (toList!5192 (+!2517 lt!396552 (tuple2!11595 lt!396554 lt!396551))) lt!396548))))

(assert (=> d!108513 (= (contains!4222 (+!2517 lt!396552 (tuple2!11595 lt!396554 lt!396551)) lt!396548) lt!396659)))

(declare-fun b!876895 () Bool)

(declare-fun lt!396658 () Unit!29927)

(assert (=> b!876895 (= e!488113 lt!396658)))

(assert (=> b!876895 (= lt!396658 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 (+!2517 lt!396552 (tuple2!11595 lt!396554 lt!396551))) lt!396548))))

(assert (=> b!876895 (isDefined!312 (getValueByKey!417 (toList!5192 (+!2517 lt!396552 (tuple2!11595 lt!396554 lt!396551))) lt!396548))))

(declare-fun b!876896 () Bool)

(declare-fun Unit!29938 () Unit!29927)

(assert (=> b!876896 (= e!488113 Unit!29938)))

(declare-fun b!876897 () Bool)

(assert (=> b!876897 (= e!488114 (isDefined!312 (getValueByKey!417 (toList!5192 (+!2517 lt!396552 (tuple2!11595 lt!396554 lt!396551))) lt!396548)))))

(assert (= (and d!108513 c!92644) b!876895))

(assert (= (and d!108513 (not c!92644)) b!876896))

(assert (= (and d!108513 (not res!595809)) b!876897))

(declare-fun m!816333 () Bool)

(assert (=> d!108513 m!816333))

(declare-fun m!816335 () Bool)

(assert (=> b!876895 m!816335))

(declare-fun m!816337 () Bool)

(assert (=> b!876895 m!816337))

(assert (=> b!876895 m!816337))

(declare-fun m!816339 () Bool)

(assert (=> b!876895 m!816339))

(assert (=> b!876897 m!816337))

(assert (=> b!876897 m!816337))

(assert (=> b!876897 m!816339))

(assert (=> b!876686 d!108513))

(declare-fun d!108515 () Bool)

(assert (=> d!108515 (not (contains!4222 (+!2517 lt!396552 (tuple2!11595 lt!396554 lt!396551)) lt!396548))))

(declare-fun lt!396664 () Unit!29927)

(declare-fun choose!1442 (ListLongMap!10353 (_ BitVec 64) V!28281 (_ BitVec 64)) Unit!29927)

(assert (=> d!108515 (= lt!396664 (choose!1442 lt!396552 lt!396554 lt!396551 lt!396548))))

(declare-fun e!488117 () Bool)

(assert (=> d!108515 e!488117))

(declare-fun res!595812 () Bool)

(assert (=> d!108515 (=> (not res!595812) (not e!488117))))

(assert (=> d!108515 (= res!595812 (not (contains!4222 lt!396552 lt!396548)))))

(assert (=> d!108515 (= (addStillNotContains!203 lt!396552 lt!396554 lt!396551 lt!396548) lt!396664)))

(declare-fun b!876901 () Bool)

(assert (=> b!876901 (= e!488117 (not (= lt!396554 lt!396548)))))

(assert (= (and d!108515 res!595812) b!876901))

(assert (=> d!108515 m!816019))

(assert (=> d!108515 m!816019))

(assert (=> d!108515 m!816023))

(declare-fun m!816341 () Bool)

(assert (=> d!108515 m!816341))

(declare-fun m!816343 () Bool)

(assert (=> d!108515 m!816343))

(assert (=> b!876686 d!108515))

(declare-fun lt!396667 () Bool)

(declare-fun d!108517 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!389 (List!17398) (InoxSet tuple2!11594))

(assert (=> d!108517 (= lt!396667 (select (content!389 (toList!5192 lt!396565)) (tuple2!11595 k0!854 lt!396456)))))

(declare-fun e!488123 () Bool)

(assert (=> d!108517 (= lt!396667 e!488123)))

(declare-fun res!595818 () Bool)

(assert (=> d!108517 (=> (not res!595818) (not e!488123))))

(assert (=> d!108517 (= res!595818 ((_ is Cons!17394) (toList!5192 lt!396565)))))

(assert (=> d!108517 (= (contains!4223 (toList!5192 lt!396565) (tuple2!11595 k0!854 lt!396456)) lt!396667)))

(declare-fun b!876906 () Bool)

(declare-fun e!488122 () Bool)

(assert (=> b!876906 (= e!488123 e!488122)))

(declare-fun res!595817 () Bool)

(assert (=> b!876906 (=> res!595817 e!488122)))

(assert (=> b!876906 (= res!595817 (= (h!18525 (toList!5192 lt!396565)) (tuple2!11595 k0!854 lt!396456)))))

(declare-fun b!876907 () Bool)

(assert (=> b!876907 (= e!488122 (contains!4223 (t!24474 (toList!5192 lt!396565)) (tuple2!11595 k0!854 lt!396456)))))

(assert (= (and d!108517 res!595818) b!876906))

(assert (= (and b!876906 (not res!595817)) b!876907))

(declare-fun m!816345 () Bool)

(assert (=> d!108517 m!816345))

(declare-fun m!816347 () Bool)

(assert (=> d!108517 m!816347))

(declare-fun m!816349 () Bool)

(assert (=> b!876907 m!816349))

(assert (=> b!876709 d!108517))

(declare-fun b!876908 () Bool)

(declare-fun e!488124 () Option!423)

(assert (=> b!876908 (= e!488124 (Some!422 (_2!5808 (h!18525 (toList!5192 lt!396576)))))))

(declare-fun b!876910 () Bool)

(declare-fun e!488125 () Option!423)

(assert (=> b!876910 (= e!488125 (getValueByKey!417 (t!24474 (toList!5192 lt!396576)) (_1!5808 lt!396453)))))

(declare-fun d!108519 () Bool)

(declare-fun c!92645 () Bool)

(assert (=> d!108519 (= c!92645 (and ((_ is Cons!17394) (toList!5192 lt!396576)) (= (_1!5808 (h!18525 (toList!5192 lt!396576))) (_1!5808 lt!396453))))))

(assert (=> d!108519 (= (getValueByKey!417 (toList!5192 lt!396576) (_1!5808 lt!396453)) e!488124)))

(declare-fun b!876911 () Bool)

(assert (=> b!876911 (= e!488125 None!421)))

(declare-fun b!876909 () Bool)

(assert (=> b!876909 (= e!488124 e!488125)))

(declare-fun c!92646 () Bool)

(assert (=> b!876909 (= c!92646 (and ((_ is Cons!17394) (toList!5192 lt!396576)) (not (= (_1!5808 (h!18525 (toList!5192 lt!396576))) (_1!5808 lt!396453)))))))

(assert (= (and d!108519 c!92645) b!876908))

(assert (= (and d!108519 (not c!92645)) b!876909))

(assert (= (and b!876909 c!92646) b!876910))

(assert (= (and b!876909 (not c!92646)) b!876911))

(declare-fun m!816351 () Bool)

(assert (=> b!876910 m!816351))

(assert (=> b!876712 d!108519))

(declare-fun b!876912 () Bool)

(declare-fun e!488126 () Option!423)

(assert (=> b!876912 (= e!488126 (Some!422 (_2!5808 (h!18525 (toList!5192 lt!396580)))))))

(declare-fun b!876914 () Bool)

(declare-fun e!488127 () Option!423)

(assert (=> b!876914 (= e!488127 (getValueByKey!417 (t!24474 (toList!5192 lt!396580)) (_1!5808 lt!396453)))))

(declare-fun d!108521 () Bool)

(declare-fun c!92647 () Bool)

(assert (=> d!108521 (= c!92647 (and ((_ is Cons!17394) (toList!5192 lt!396580)) (= (_1!5808 (h!18525 (toList!5192 lt!396580))) (_1!5808 lt!396453))))))

(assert (=> d!108521 (= (getValueByKey!417 (toList!5192 lt!396580) (_1!5808 lt!396453)) e!488126)))

(declare-fun b!876915 () Bool)

(assert (=> b!876915 (= e!488127 None!421)))

(declare-fun b!876913 () Bool)

(assert (=> b!876913 (= e!488126 e!488127)))

(declare-fun c!92648 () Bool)

(assert (=> b!876913 (= c!92648 (and ((_ is Cons!17394) (toList!5192 lt!396580)) (not (= (_1!5808 (h!18525 (toList!5192 lt!396580))) (_1!5808 lt!396453)))))))

(assert (= (and d!108521 c!92647) b!876912))

(assert (= (and d!108521 (not c!92647)) b!876913))

(assert (= (and b!876913 c!92648) b!876914))

(assert (= (and b!876913 (not c!92648)) b!876915))

(declare-fun m!816353 () Bool)

(assert (=> b!876914 m!816353))

(assert (=> b!876714 d!108521))

(declare-fun b!876916 () Bool)

(declare-fun e!488131 () ListLongMap!10353)

(declare-fun e!488128 () ListLongMap!10353)

(assert (=> b!876916 (= e!488131 e!488128)))

(declare-fun c!92649 () Bool)

(assert (=> b!876916 (= c!92649 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(declare-fun b!876917 () Bool)

(declare-fun e!488134 () Bool)

(declare-fun e!488130 () Bool)

(assert (=> b!876917 (= e!488134 e!488130)))

(declare-fun c!92651 () Bool)

(declare-fun e!488133 () Bool)

(assert (=> b!876917 (= c!92651 e!488133)))

(declare-fun res!595819 () Bool)

(assert (=> b!876917 (=> (not res!595819) (not e!488133))))

(assert (=> b!876917 (= res!595819 (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(declare-fun b!876918 () Bool)

(declare-fun lt!396673 () Unit!29927)

(declare-fun lt!396669 () Unit!29927)

(assert (=> b!876918 (= lt!396673 lt!396669)))

(declare-fun lt!396674 () (_ BitVec 64))

(declare-fun lt!396668 () (_ BitVec 64))

(declare-fun lt!396671 () V!28281)

(declare-fun lt!396672 () ListLongMap!10353)

(assert (=> b!876918 (not (contains!4222 (+!2517 lt!396672 (tuple2!11595 lt!396674 lt!396671)) lt!396668))))

(assert (=> b!876918 (= lt!396669 (addStillNotContains!203 lt!396672 lt!396674 lt!396671 lt!396668))))

(assert (=> b!876918 (= lt!396668 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876918 (= lt!396671 (get!12898 (select (arr!24506 _values!688) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876918 (= lt!396674 (select (arr!24505 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001)))))

(declare-fun call!38811 () ListLongMap!10353)

(assert (=> b!876918 (= lt!396672 call!38811)))

(assert (=> b!876918 (= e!488128 (+!2517 call!38811 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001)) (get!12898 (select (arr!24506 _values!688) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876919 () Bool)

(assert (=> b!876919 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(assert (=> b!876919 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24948 _values!688)))))

(declare-fun e!488129 () Bool)

(declare-fun lt!396670 () ListLongMap!10353)

(assert (=> b!876919 (= e!488129 (= (apply!377 lt!396670 (select (arr!24505 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))) (get!12898 (select (arr!24506 _values!688) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876920 () Bool)

(declare-fun e!488132 () Bool)

(assert (=> b!876920 (= e!488132 (isEmpty!668 lt!396670))))

(declare-fun b!876921 () Bool)

(assert (=> b!876921 (= e!488128 call!38811)))

(declare-fun b!876922 () Bool)

(assert (=> b!876922 (= e!488133 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!876922 (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun bm!38808 () Bool)

(assert (=> bm!38808 (= call!38811 (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876924 () Bool)

(assert (=> b!876924 (= e!488132 (= lt!396670 (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876925 () Bool)

(declare-fun res!595820 () Bool)

(assert (=> b!876925 (=> (not res!595820) (not e!488134))))

(assert (=> b!876925 (= res!595820 (not (contains!4222 lt!396670 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876926 () Bool)

(assert (=> b!876926 (= e!488130 e!488132)))

(declare-fun c!92650 () Bool)

(assert (=> b!876926 (= c!92650 (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(declare-fun b!876927 () Bool)

(assert (=> b!876927 (= e!488130 e!488129)))

(assert (=> b!876927 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(declare-fun res!595821 () Bool)

(assert (=> b!876927 (= res!595821 (contains!4222 lt!396670 (select (arr!24505 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!876927 (=> (not res!595821) (not e!488129))))

(declare-fun d!108523 () Bool)

(assert (=> d!108523 e!488134))

(declare-fun res!595822 () Bool)

(assert (=> d!108523 (=> (not res!595822) (not e!488134))))

(assert (=> d!108523 (= res!595822 (not (contains!4222 lt!396670 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108523 (= lt!396670 e!488131)))

(declare-fun c!92652 () Bool)

(assert (=> d!108523 (= c!92652 (bvsge (bvadd from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(assert (=> d!108523 (validMask!0 mask!1196)))

(assert (=> d!108523 (= (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696) lt!396670)))

(declare-fun b!876923 () Bool)

(assert (=> b!876923 (= e!488131 (ListLongMap!10354 Nil!17395))))

(assert (= (and d!108523 c!92652) b!876923))

(assert (= (and d!108523 (not c!92652)) b!876916))

(assert (= (and b!876916 c!92649) b!876918))

(assert (= (and b!876916 (not c!92649)) b!876921))

(assert (= (or b!876918 b!876921) bm!38808))

(assert (= (and d!108523 res!595822) b!876925))

(assert (= (and b!876925 res!595820) b!876917))

(assert (= (and b!876917 res!595819) b!876922))

(assert (= (and b!876917 c!92651) b!876927))

(assert (= (and b!876917 (not c!92651)) b!876926))

(assert (= (and b!876927 res!595821) b!876919))

(assert (= (and b!876926 c!92650) b!876924))

(assert (= (and b!876926 (not c!92650)) b!876920))

(declare-fun b_lambda!12275 () Bool)

(assert (=> (not b_lambda!12275) (not b!876918)))

(assert (=> b!876918 t!24473))

(declare-fun b_and!25021 () Bool)

(assert (= b_and!25019 (and (=> t!24473 result!9493) b_and!25021)))

(declare-fun b_lambda!12277 () Bool)

(assert (=> (not b_lambda!12277) (not b!876919)))

(assert (=> b!876919 t!24473))

(declare-fun b_and!25023 () Bool)

(assert (= b_and!25021 (and (=> t!24473 result!9493) b_and!25023)))

(assert (=> b!876919 m!815839))

(declare-fun m!816355 () Bool)

(assert (=> b!876919 m!816355))

(assert (=> b!876919 m!815839))

(declare-fun m!816357 () Bool)

(assert (=> b!876919 m!816357))

(assert (=> b!876919 m!816241))

(assert (=> b!876919 m!816241))

(declare-fun m!816359 () Bool)

(assert (=> b!876919 m!816359))

(assert (=> b!876919 m!816355))

(assert (=> b!876918 m!815839))

(declare-fun m!816361 () Bool)

(assert (=> b!876918 m!816361))

(assert (=> b!876918 m!816355))

(assert (=> b!876918 m!815839))

(assert (=> b!876918 m!816357))

(assert (=> b!876918 m!816241))

(declare-fun m!816363 () Bool)

(assert (=> b!876918 m!816363))

(assert (=> b!876918 m!816361))

(declare-fun m!816365 () Bool)

(assert (=> b!876918 m!816365))

(declare-fun m!816367 () Bool)

(assert (=> b!876918 m!816367))

(assert (=> b!876918 m!816355))

(declare-fun m!816369 () Bool)

(assert (=> bm!38808 m!816369))

(assert (=> b!876916 m!816241))

(assert (=> b!876916 m!816241))

(assert (=> b!876916 m!816255))

(assert (=> b!876927 m!816241))

(assert (=> b!876927 m!816241))

(declare-fun m!816371 () Bool)

(assert (=> b!876927 m!816371))

(declare-fun m!816373 () Bool)

(assert (=> d!108523 m!816373))

(assert (=> d!108523 m!815817))

(assert (=> b!876922 m!816241))

(assert (=> b!876922 m!816241))

(assert (=> b!876922 m!816255))

(declare-fun m!816375 () Bool)

(assert (=> b!876920 m!816375))

(assert (=> b!876924 m!816369))

(declare-fun m!816377 () Bool)

(assert (=> b!876925 m!816377))

(assert (=> b!876764 d!108523))

(declare-fun d!108525 () Bool)

(assert (=> d!108525 (= (isEmpty!668 lt!396543) (isEmpty!669 (toList!5192 lt!396543)))))

(declare-fun bs!24589 () Bool)

(assert (= bs!24589 d!108525))

(declare-fun m!816379 () Bool)

(assert (=> bs!24589 m!816379))

(assert (=> b!876676 d!108525))

(declare-fun d!108527 () Bool)

(declare-fun e!488135 () Bool)

(assert (=> d!108527 e!488135))

(declare-fun res!595823 () Bool)

(assert (=> d!108527 (=> (not res!595823) (not e!488135))))

(declare-fun lt!396677 () ListLongMap!10353)

(assert (=> d!108527 (= res!595823 (contains!4222 lt!396677 (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun lt!396678 () List!17398)

(assert (=> d!108527 (= lt!396677 (ListLongMap!10354 lt!396678))))

(declare-fun lt!396675 () Unit!29927)

(declare-fun lt!396676 () Unit!29927)

(assert (=> d!108527 (= lt!396675 lt!396676)))

(assert (=> d!108527 (= (getValueByKey!417 lt!396678 (_1!5808 (tuple2!11595 k0!854 v!557))) (Some!422 (_2!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!108527 (= lt!396676 (lemmaContainsTupThenGetReturnValue!234 lt!396678 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!108527 (= lt!396678 (insertStrictlySorted!273 (toList!5192 call!38789) (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!108527 (= (+!2517 call!38789 (tuple2!11595 k0!854 v!557)) lt!396677)))

(declare-fun b!876928 () Bool)

(declare-fun res!595824 () Bool)

(assert (=> b!876928 (=> (not res!595824) (not e!488135))))

(assert (=> b!876928 (= res!595824 (= (getValueByKey!417 (toList!5192 lt!396677) (_1!5808 (tuple2!11595 k0!854 v!557))) (Some!422 (_2!5808 (tuple2!11595 k0!854 v!557)))))))

(declare-fun b!876929 () Bool)

(assert (=> b!876929 (= e!488135 (contains!4223 (toList!5192 lt!396677) (tuple2!11595 k0!854 v!557)))))

(assert (= (and d!108527 res!595823) b!876928))

(assert (= (and b!876928 res!595824) b!876929))

(declare-fun m!816381 () Bool)

(assert (=> d!108527 m!816381))

(declare-fun m!816383 () Bool)

(assert (=> d!108527 m!816383))

(declare-fun m!816385 () Bool)

(assert (=> d!108527 m!816385))

(declare-fun m!816387 () Bool)

(assert (=> d!108527 m!816387))

(declare-fun m!816389 () Bool)

(assert (=> b!876928 m!816389))

(declare-fun m!816391 () Bool)

(assert (=> b!876929 m!816391))

(assert (=> b!876743 d!108527))

(assert (=> b!876744 d!108453))

(declare-fun b!876930 () Bool)

(declare-fun e!488139 () ListLongMap!10353)

(declare-fun e!488136 () ListLongMap!10353)

(assert (=> b!876930 (= e!488139 e!488136)))

(declare-fun c!92653 () Bool)

(assert (=> b!876930 (= c!92653 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(declare-fun b!876931 () Bool)

(declare-fun e!488142 () Bool)

(declare-fun e!488138 () Bool)

(assert (=> b!876931 (= e!488142 e!488138)))

(declare-fun c!92655 () Bool)

(declare-fun e!488141 () Bool)

(assert (=> b!876931 (= c!92655 e!488141)))

(declare-fun res!595825 () Bool)

(assert (=> b!876931 (=> (not res!595825) (not e!488141))))

(assert (=> b!876931 (= res!595825 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(declare-fun b!876932 () Bool)

(declare-fun lt!396684 () Unit!29927)

(declare-fun lt!396680 () Unit!29927)

(assert (=> b!876932 (= lt!396684 lt!396680)))

(declare-fun lt!396679 () (_ BitVec 64))

(declare-fun lt!396683 () ListLongMap!10353)

(declare-fun lt!396682 () V!28281)

(declare-fun lt!396685 () (_ BitVec 64))

(assert (=> b!876932 (not (contains!4222 (+!2517 lt!396683 (tuple2!11595 lt!396685 lt!396682)) lt!396679))))

(assert (=> b!876932 (= lt!396680 (addStillNotContains!203 lt!396683 lt!396685 lt!396682 lt!396679))))

(assert (=> b!876932 (= lt!396679 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876932 (= lt!396682 (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876932 (= lt!396685 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(declare-fun call!38812 () ListLongMap!10353)

(assert (=> b!876932 (= lt!396683 call!38812)))

(assert (=> b!876932 (= e!488136 (+!2517 call!38812 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876933 () Bool)

(assert (=> b!876933 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(assert (=> b!876933 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24948 lt!396449)))))

(declare-fun lt!396681 () ListLongMap!10353)

(declare-fun e!488137 () Bool)

(assert (=> b!876933 (= e!488137 (= (apply!377 lt!396681 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))) (get!12898 (select (arr!24506 lt!396449) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876934 () Bool)

(declare-fun e!488140 () Bool)

(assert (=> b!876934 (= e!488140 (isEmpty!668 lt!396681))))

(declare-fun b!876935 () Bool)

(assert (=> b!876935 (= e!488136 call!38812)))

(declare-fun b!876936 () Bool)

(assert (=> b!876936 (= e!488141 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!876936 (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun bm!38809 () Bool)

(assert (=> bm!38809 (= call!38812 (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876938 () Bool)

(assert (=> b!876938 (= e!488140 (= lt!396681 (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876939 () Bool)

(declare-fun res!595826 () Bool)

(assert (=> b!876939 (=> (not res!595826) (not e!488142))))

(assert (=> b!876939 (= res!595826 (not (contains!4222 lt!396681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876940 () Bool)

(assert (=> b!876940 (= e!488138 e!488140)))

(declare-fun c!92654 () Bool)

(assert (=> b!876940 (= c!92654 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(declare-fun b!876941 () Bool)

(assert (=> b!876941 (= e!488138 e!488137)))

(assert (=> b!876941 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(declare-fun res!595827 () Bool)

(assert (=> b!876941 (= res!595827 (contains!4222 lt!396681 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!876941 (=> (not res!595827) (not e!488137))))

(declare-fun d!108529 () Bool)

(assert (=> d!108529 e!488142))

(declare-fun res!595828 () Bool)

(assert (=> d!108529 (=> (not res!595828) (not e!488142))))

(assert (=> d!108529 (= res!595828 (not (contains!4222 lt!396681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108529 (= lt!396681 e!488139)))

(declare-fun c!92656 () Bool)

(assert (=> d!108529 (= c!92656 (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(assert (=> d!108529 (validMask!0 mask!1196)))

(assert (=> d!108529 (= (getCurrentListMapNoExtraKeys!3185 _keys!868 lt!396449 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696) lt!396681)))

(declare-fun b!876937 () Bool)

(assert (=> b!876937 (= e!488139 (ListLongMap!10354 Nil!17395))))

(assert (= (and d!108529 c!92656) b!876937))

(assert (= (and d!108529 (not c!92656)) b!876930))

(assert (= (and b!876930 c!92653) b!876932))

(assert (= (and b!876930 (not c!92653)) b!876935))

(assert (= (or b!876932 b!876935) bm!38809))

(assert (= (and d!108529 res!595828) b!876939))

(assert (= (and b!876939 res!595826) b!876931))

(assert (= (and b!876931 res!595825) b!876936))

(assert (= (and b!876931 c!92655) b!876941))

(assert (= (and b!876931 (not c!92655)) b!876940))

(assert (= (and b!876941 res!595827) b!876933))

(assert (= (and b!876940 c!92654) b!876938))

(assert (= (and b!876940 (not c!92654)) b!876934))

(declare-fun b_lambda!12279 () Bool)

(assert (=> (not b_lambda!12279) (not b!876932)))

(assert (=> b!876932 t!24473))

(declare-fun b_and!25025 () Bool)

(assert (= b_and!25023 (and (=> t!24473 result!9493) b_and!25025)))

(declare-fun b_lambda!12281 () Bool)

(assert (=> (not b_lambda!12281) (not b!876933)))

(assert (=> b!876933 t!24473))

(declare-fun b_and!25027 () Bool)

(assert (= b_and!25025 (and (=> t!24473 result!9493) b_and!25027)))

(assert (=> b!876933 m!815839))

(declare-fun m!816393 () Bool)

(assert (=> b!876933 m!816393))

(assert (=> b!876933 m!815839))

(declare-fun m!816395 () Bool)

(assert (=> b!876933 m!816395))

(declare-fun m!816397 () Bool)

(assert (=> b!876933 m!816397))

(assert (=> b!876933 m!816397))

(declare-fun m!816399 () Bool)

(assert (=> b!876933 m!816399))

(assert (=> b!876933 m!816393))

(assert (=> b!876932 m!815839))

(declare-fun m!816401 () Bool)

(assert (=> b!876932 m!816401))

(assert (=> b!876932 m!816393))

(assert (=> b!876932 m!815839))

(assert (=> b!876932 m!816395))

(assert (=> b!876932 m!816397))

(declare-fun m!816403 () Bool)

(assert (=> b!876932 m!816403))

(assert (=> b!876932 m!816401))

(declare-fun m!816405 () Bool)

(assert (=> b!876932 m!816405))

(declare-fun m!816407 () Bool)

(assert (=> b!876932 m!816407))

(assert (=> b!876932 m!816393))

(declare-fun m!816409 () Bool)

(assert (=> bm!38809 m!816409))

(assert (=> b!876930 m!816397))

(assert (=> b!876930 m!816397))

(declare-fun m!816411 () Bool)

(assert (=> b!876930 m!816411))

(assert (=> b!876941 m!816397))

(assert (=> b!876941 m!816397))

(declare-fun m!816413 () Bool)

(assert (=> b!876941 m!816413))

(declare-fun m!816415 () Bool)

(assert (=> d!108529 m!816415))

(assert (=> d!108529 m!815817))

(assert (=> b!876936 m!816397))

(assert (=> b!876936 m!816397))

(assert (=> b!876936 m!816411))

(declare-fun m!816417 () Bool)

(assert (=> b!876934 m!816417))

(assert (=> b!876938 m!816409))

(declare-fun m!816419 () Bool)

(assert (=> b!876939 m!816419))

(assert (=> b!876692 d!108529))

(declare-fun d!108531 () Bool)

(declare-fun e!488144 () Bool)

(assert (=> d!108531 e!488144))

(declare-fun res!595829 () Bool)

(assert (=> d!108531 (=> res!595829 e!488144)))

(declare-fun lt!396687 () Bool)

(assert (=> d!108531 (= res!595829 (not lt!396687))))

(declare-fun lt!396689 () Bool)

(assert (=> d!108531 (= lt!396687 lt!396689)))

(declare-fun lt!396688 () Unit!29927)

(declare-fun e!488143 () Unit!29927)

(assert (=> d!108531 (= lt!396688 e!488143)))

(declare-fun c!92657 () Bool)

(assert (=> d!108531 (= c!92657 lt!396689)))

(assert (=> d!108531 (= lt!396689 (containsKey!401 (toList!5192 (+!2517 lt!396597 (tuple2!11595 lt!396599 lt!396596))) lt!396593))))

(assert (=> d!108531 (= (contains!4222 (+!2517 lt!396597 (tuple2!11595 lt!396599 lt!396596)) lt!396593) lt!396687)))

(declare-fun b!876942 () Bool)

(declare-fun lt!396686 () Unit!29927)

(assert (=> b!876942 (= e!488143 lt!396686)))

(assert (=> b!876942 (= lt!396686 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 (+!2517 lt!396597 (tuple2!11595 lt!396599 lt!396596))) lt!396593))))

(assert (=> b!876942 (isDefined!312 (getValueByKey!417 (toList!5192 (+!2517 lt!396597 (tuple2!11595 lt!396599 lt!396596))) lt!396593))))

(declare-fun b!876943 () Bool)

(declare-fun Unit!29939 () Unit!29927)

(assert (=> b!876943 (= e!488143 Unit!29939)))

(declare-fun b!876944 () Bool)

(assert (=> b!876944 (= e!488144 (isDefined!312 (getValueByKey!417 (toList!5192 (+!2517 lt!396597 (tuple2!11595 lt!396599 lt!396596))) lt!396593)))))

(assert (= (and d!108531 c!92657) b!876942))

(assert (= (and d!108531 (not c!92657)) b!876943))

(assert (= (and d!108531 (not res!595829)) b!876944))

(declare-fun m!816421 () Bool)

(assert (=> d!108531 m!816421))

(declare-fun m!816423 () Bool)

(assert (=> b!876942 m!816423))

(declare-fun m!816425 () Bool)

(assert (=> b!876942 m!816425))

(assert (=> b!876942 m!816425))

(declare-fun m!816427 () Bool)

(assert (=> b!876942 m!816427))

(assert (=> b!876944 m!816425))

(assert (=> b!876944 m!816425))

(assert (=> b!876944 m!816427))

(assert (=> b!876746 d!108531))

(declare-fun d!108533 () Bool)

(declare-fun e!488145 () Bool)

(assert (=> d!108533 e!488145))

(declare-fun res!595830 () Bool)

(assert (=> d!108533 (=> (not res!595830) (not e!488145))))

(declare-fun lt!396692 () ListLongMap!10353)

(assert (=> d!108533 (= res!595830 (contains!4222 lt!396692 (_1!5808 (tuple2!11595 lt!396599 lt!396596))))))

(declare-fun lt!396693 () List!17398)

(assert (=> d!108533 (= lt!396692 (ListLongMap!10354 lt!396693))))

(declare-fun lt!396690 () Unit!29927)

(declare-fun lt!396691 () Unit!29927)

(assert (=> d!108533 (= lt!396690 lt!396691)))

(assert (=> d!108533 (= (getValueByKey!417 lt!396693 (_1!5808 (tuple2!11595 lt!396599 lt!396596))) (Some!422 (_2!5808 (tuple2!11595 lt!396599 lt!396596))))))

(assert (=> d!108533 (= lt!396691 (lemmaContainsTupThenGetReturnValue!234 lt!396693 (_1!5808 (tuple2!11595 lt!396599 lt!396596)) (_2!5808 (tuple2!11595 lt!396599 lt!396596))))))

(assert (=> d!108533 (= lt!396693 (insertStrictlySorted!273 (toList!5192 lt!396597) (_1!5808 (tuple2!11595 lt!396599 lt!396596)) (_2!5808 (tuple2!11595 lt!396599 lt!396596))))))

(assert (=> d!108533 (= (+!2517 lt!396597 (tuple2!11595 lt!396599 lt!396596)) lt!396692)))

(declare-fun b!876945 () Bool)

(declare-fun res!595831 () Bool)

(assert (=> b!876945 (=> (not res!595831) (not e!488145))))

(assert (=> b!876945 (= res!595831 (= (getValueByKey!417 (toList!5192 lt!396692) (_1!5808 (tuple2!11595 lt!396599 lt!396596))) (Some!422 (_2!5808 (tuple2!11595 lt!396599 lt!396596)))))))

(declare-fun b!876946 () Bool)

(assert (=> b!876946 (= e!488145 (contains!4223 (toList!5192 lt!396692) (tuple2!11595 lt!396599 lt!396596)))))

(assert (= (and d!108533 res!595830) b!876945))

(assert (= (and b!876945 res!595831) b!876946))

(declare-fun m!816429 () Bool)

(assert (=> d!108533 m!816429))

(declare-fun m!816431 () Bool)

(assert (=> d!108533 m!816431))

(declare-fun m!816433 () Bool)

(assert (=> d!108533 m!816433))

(declare-fun m!816435 () Bool)

(assert (=> d!108533 m!816435))

(declare-fun m!816437 () Bool)

(assert (=> b!876945 m!816437))

(declare-fun m!816439 () Bool)

(assert (=> b!876946 m!816439))

(assert (=> b!876746 d!108533))

(declare-fun d!108535 () Bool)

(assert (=> d!108535 (not (contains!4222 (+!2517 lt!396597 (tuple2!11595 lt!396599 lt!396596)) lt!396593))))

(declare-fun lt!396694 () Unit!29927)

(assert (=> d!108535 (= lt!396694 (choose!1442 lt!396597 lt!396599 lt!396596 lt!396593))))

(declare-fun e!488146 () Bool)

(assert (=> d!108535 e!488146))

(declare-fun res!595832 () Bool)

(assert (=> d!108535 (=> (not res!595832) (not e!488146))))

(assert (=> d!108535 (= res!595832 (not (contains!4222 lt!396597 lt!396593)))))

(assert (=> d!108535 (= (addStillNotContains!203 lt!396597 lt!396599 lt!396596 lt!396593) lt!396694)))

(declare-fun b!876947 () Bool)

(assert (=> b!876947 (= e!488146 (not (= lt!396599 lt!396593)))))

(assert (= (and d!108535 res!595832) b!876947))

(assert (=> d!108535 m!816139))

(assert (=> d!108535 m!816139))

(assert (=> d!108535 m!816143))

(declare-fun m!816441 () Bool)

(assert (=> d!108535 m!816441))

(declare-fun m!816443 () Bool)

(assert (=> d!108535 m!816443))

(assert (=> b!876746 d!108535))

(declare-fun d!108537 () Bool)

(declare-fun c!92658 () Bool)

(assert (=> d!108537 (= c!92658 ((_ is ValueCellFull!8273) (select (arr!24506 lt!396449) from!1053)))))

(declare-fun e!488147 () V!28281)

(assert (=> d!108537 (= (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!488147)))

(declare-fun b!876948 () Bool)

(assert (=> b!876948 (= e!488147 (get!12901 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876949 () Bool)

(assert (=> b!876949 (= e!488147 (get!12902 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108537 c!92658) b!876948))

(assert (= (and d!108537 (not c!92658)) b!876949))

(assert (=> b!876948 m!816133))

(assert (=> b!876948 m!815839))

(declare-fun m!816445 () Bool)

(assert (=> b!876948 m!816445))

(assert (=> b!876949 m!816133))

(assert (=> b!876949 m!815839))

(declare-fun m!816447 () Bool)

(assert (=> b!876949 m!816447))

(assert (=> b!876746 d!108537))

(declare-fun d!108539 () Bool)

(declare-fun e!488148 () Bool)

(assert (=> d!108539 e!488148))

(declare-fun res!595833 () Bool)

(assert (=> d!108539 (=> (not res!595833) (not e!488148))))

(declare-fun lt!396697 () ListLongMap!10353)

(assert (=> d!108539 (= res!595833 (contains!4222 lt!396697 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!396698 () List!17398)

(assert (=> d!108539 (= lt!396697 (ListLongMap!10354 lt!396698))))

(declare-fun lt!396695 () Unit!29927)

(declare-fun lt!396696 () Unit!29927)

(assert (=> d!108539 (= lt!396695 lt!396696)))

(assert (=> d!108539 (= (getValueByKey!417 lt!396698 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108539 (= lt!396696 (lemmaContainsTupThenGetReturnValue!234 lt!396698 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108539 (= lt!396698 (insertStrictlySorted!273 (toList!5192 call!38790) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108539 (= (+!2517 call!38790 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!396697)))

(declare-fun b!876950 () Bool)

(declare-fun res!595834 () Bool)

(assert (=> b!876950 (=> (not res!595834) (not e!488148))))

(assert (=> b!876950 (= res!595834 (= (getValueByKey!417 (toList!5192 lt!396697) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!876951 () Bool)

(assert (=> b!876951 (= e!488148 (contains!4223 (toList!5192 lt!396697) (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 lt!396449) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108539 res!595833) b!876950))

(assert (= (and b!876950 res!595834) b!876951))

(declare-fun m!816449 () Bool)

(assert (=> d!108539 m!816449))

(declare-fun m!816451 () Bool)

(assert (=> d!108539 m!816451))

(declare-fun m!816453 () Bool)

(assert (=> d!108539 m!816453))

(declare-fun m!816455 () Bool)

(assert (=> d!108539 m!816455))

(declare-fun m!816457 () Bool)

(assert (=> b!876950 m!816457))

(declare-fun m!816459 () Bool)

(assert (=> b!876951 m!816459))

(assert (=> b!876746 d!108539))

(declare-fun d!108541 () Bool)

(assert (=> d!108541 (= (get!12902 (select (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053) lt!396452) lt!396452)))

(assert (=> b!876703 d!108541))

(declare-fun b!876952 () Bool)

(declare-fun e!488150 () Bool)

(declare-fun call!38813 () Bool)

(assert (=> b!876952 (= e!488150 call!38813)))

(declare-fun b!876953 () Bool)

(declare-fun e!488152 () Bool)

(assert (=> b!876953 (= e!488152 e!488150)))

(declare-fun c!92659 () Bool)

(assert (=> b!876953 (= c!92659 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!876954 () Bool)

(declare-fun e!488151 () Bool)

(assert (=> b!876954 (= e!488151 (contains!4224 (ite c!92588 (Cons!17395 (select (arr!24505 _keys!868) #b00000000000000000000000000000000) Nil!17396) Nil!17396) (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!876955 () Bool)

(declare-fun e!488149 () Bool)

(assert (=> b!876955 (= e!488149 e!488152)))

(declare-fun res!595835 () Bool)

(assert (=> b!876955 (=> (not res!595835) (not e!488152))))

(assert (=> b!876955 (= res!595835 (not e!488151))))

(declare-fun res!595837 () Bool)

(assert (=> b!876955 (=> (not res!595837) (not e!488151))))

(assert (=> b!876955 (= res!595837 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!38810 () Bool)

(assert (=> bm!38810 (= call!38813 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!92659 (Cons!17395 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!92588 (Cons!17395 (select (arr!24505 _keys!868) #b00000000000000000000000000000000) Nil!17396) Nil!17396)) (ite c!92588 (Cons!17395 (select (arr!24505 _keys!868) #b00000000000000000000000000000000) Nil!17396) Nil!17396))))))

(declare-fun d!108543 () Bool)

(declare-fun res!595836 () Bool)

(assert (=> d!108543 (=> res!595836 e!488149)))

(assert (=> d!108543 (= res!595836 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(assert (=> d!108543 (= (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92588 (Cons!17395 (select (arr!24505 _keys!868) #b00000000000000000000000000000000) Nil!17396) Nil!17396)) e!488149)))

(declare-fun b!876956 () Bool)

(assert (=> b!876956 (= e!488150 call!38813)))

(assert (= (and d!108543 (not res!595836)) b!876955))

(assert (= (and b!876955 res!595837) b!876954))

(assert (= (and b!876955 res!595835) b!876953))

(assert (= (and b!876953 c!92659) b!876952))

(assert (= (and b!876953 (not c!92659)) b!876956))

(assert (= (or b!876952 b!876956) bm!38810))

(declare-fun m!816461 () Bool)

(assert (=> b!876953 m!816461))

(assert (=> b!876953 m!816461))

(declare-fun m!816463 () Bool)

(assert (=> b!876953 m!816463))

(assert (=> b!876954 m!816461))

(assert (=> b!876954 m!816461))

(declare-fun m!816465 () Bool)

(assert (=> b!876954 m!816465))

(assert (=> b!876955 m!816461))

(assert (=> b!876955 m!816461))

(assert (=> b!876955 m!816463))

(assert (=> bm!38810 m!816461))

(declare-fun m!816467 () Bool)

(assert (=> bm!38810 m!816467))

(assert (=> bm!38780 d!108543))

(declare-fun d!108545 () Bool)

(declare-fun e!488154 () Bool)

(assert (=> d!108545 e!488154))

(declare-fun res!595838 () Bool)

(assert (=> d!108545 (=> res!595838 e!488154)))

(declare-fun lt!396700 () Bool)

(assert (=> d!108545 (= res!595838 (not lt!396700))))

(declare-fun lt!396702 () Bool)

(assert (=> d!108545 (= lt!396700 lt!396702)))

(declare-fun lt!396701 () Unit!29927)

(declare-fun e!488153 () Unit!29927)

(assert (=> d!108545 (= lt!396701 e!488153)))

(declare-fun c!92660 () Bool)

(assert (=> d!108545 (= c!92660 lt!396702)))

(assert (=> d!108545 (= lt!396702 (containsKey!401 (toList!5192 (+!2517 lt!396545 (tuple2!11595 lt!396547 lt!396544))) lt!396541))))

(assert (=> d!108545 (= (contains!4222 (+!2517 lt!396545 (tuple2!11595 lt!396547 lt!396544)) lt!396541) lt!396700)))

(declare-fun b!876957 () Bool)

(declare-fun lt!396699 () Unit!29927)

(assert (=> b!876957 (= e!488153 lt!396699)))

(assert (=> b!876957 (= lt!396699 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 (+!2517 lt!396545 (tuple2!11595 lt!396547 lt!396544))) lt!396541))))

(assert (=> b!876957 (isDefined!312 (getValueByKey!417 (toList!5192 (+!2517 lt!396545 (tuple2!11595 lt!396547 lt!396544))) lt!396541))))

(declare-fun b!876958 () Bool)

(declare-fun Unit!29940 () Unit!29927)

(assert (=> b!876958 (= e!488153 Unit!29940)))

(declare-fun b!876959 () Bool)

(assert (=> b!876959 (= e!488154 (isDefined!312 (getValueByKey!417 (toList!5192 (+!2517 lt!396545 (tuple2!11595 lt!396547 lt!396544))) lt!396541)))))

(assert (= (and d!108545 c!92660) b!876957))

(assert (= (and d!108545 (not c!92660)) b!876958))

(assert (= (and d!108545 (not res!595838)) b!876959))

(declare-fun m!816469 () Bool)

(assert (=> d!108545 m!816469))

(declare-fun m!816471 () Bool)

(assert (=> b!876957 m!816471))

(declare-fun m!816473 () Bool)

(assert (=> b!876957 m!816473))

(assert (=> b!876957 m!816473))

(declare-fun m!816475 () Bool)

(assert (=> b!876957 m!816475))

(assert (=> b!876959 m!816473))

(assert (=> b!876959 m!816473))

(assert (=> b!876959 m!816475))

(assert (=> b!876674 d!108545))

(declare-fun d!108547 () Bool)

(assert (=> d!108547 (not (contains!4222 (+!2517 lt!396545 (tuple2!11595 lt!396547 lt!396544)) lt!396541))))

(declare-fun lt!396703 () Unit!29927)

(assert (=> d!108547 (= lt!396703 (choose!1442 lt!396545 lt!396547 lt!396544 lt!396541))))

(declare-fun e!488155 () Bool)

(assert (=> d!108547 e!488155))

(declare-fun res!595839 () Bool)

(assert (=> d!108547 (=> (not res!595839) (not e!488155))))

(assert (=> d!108547 (= res!595839 (not (contains!4222 lt!396545 lt!396541)))))

(assert (=> d!108547 (= (addStillNotContains!203 lt!396545 lt!396547 lt!396544 lt!396541) lt!396703)))

(declare-fun b!876960 () Bool)

(assert (=> b!876960 (= e!488155 (not (= lt!396547 lt!396541)))))

(assert (= (and d!108547 res!595839) b!876960))

(assert (=> d!108547 m!815993))

(assert (=> d!108547 m!815993))

(assert (=> d!108547 m!815997))

(declare-fun m!816477 () Bool)

(assert (=> d!108547 m!816477))

(declare-fun m!816479 () Bool)

(assert (=> d!108547 m!816479))

(assert (=> b!876674 d!108547))

(declare-fun d!108549 () Bool)

(declare-fun c!92661 () Bool)

(assert (=> d!108549 (= c!92661 ((_ is ValueCellFull!8273) (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun e!488156 () V!28281)

(assert (=> d!108549 (= (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!488156)))

(declare-fun b!876961 () Bool)

(assert (=> b!876961 (= e!488156 (get!12901 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876962 () Bool)

(assert (=> b!876962 (= e!488156 (get!12902 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108549 c!92661) b!876961))

(assert (= (and d!108549 (not c!92661)) b!876962))

(assert (=> b!876961 m!815985))

(assert (=> b!876961 m!815839))

(declare-fun m!816481 () Bool)

(assert (=> b!876961 m!816481))

(assert (=> b!876962 m!815985))

(assert (=> b!876962 m!815839))

(declare-fun m!816483 () Bool)

(assert (=> b!876962 m!816483))

(assert (=> b!876674 d!108549))

(declare-fun d!108551 () Bool)

(declare-fun e!488157 () Bool)

(assert (=> d!108551 e!488157))

(declare-fun res!595840 () Bool)

(assert (=> d!108551 (=> (not res!595840) (not e!488157))))

(declare-fun lt!396706 () ListLongMap!10353)

(assert (=> d!108551 (= res!595840 (contains!4222 lt!396706 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!396707 () List!17398)

(assert (=> d!108551 (= lt!396706 (ListLongMap!10354 lt!396707))))

(declare-fun lt!396704 () Unit!29927)

(declare-fun lt!396705 () Unit!29927)

(assert (=> d!108551 (= lt!396704 lt!396705)))

(assert (=> d!108551 (= (getValueByKey!417 lt!396707 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108551 (= lt!396705 (lemmaContainsTupThenGetReturnValue!234 lt!396707 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108551 (= lt!396707 (insertStrictlySorted!273 (toList!5192 call!38779) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108551 (= (+!2517 call!38779 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!396706)))

(declare-fun b!876963 () Bool)

(declare-fun res!595841 () Bool)

(assert (=> b!876963 (=> (not res!595841) (not e!488157))))

(assert (=> b!876963 (= res!595841 (= (getValueByKey!417 (toList!5192 lt!396706) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!876964 () Bool)

(assert (=> b!876964 (= e!488157 (contains!4223 (toList!5192 lt!396706) (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108551 res!595840) b!876963))

(assert (= (and b!876963 res!595841) b!876964))

(declare-fun m!816485 () Bool)

(assert (=> d!108551 m!816485))

(declare-fun m!816487 () Bool)

(assert (=> d!108551 m!816487))

(declare-fun m!816489 () Bool)

(assert (=> d!108551 m!816489))

(declare-fun m!816491 () Bool)

(assert (=> d!108551 m!816491))

(declare-fun m!816493 () Bool)

(assert (=> b!876963 m!816493))

(declare-fun m!816495 () Bool)

(assert (=> b!876964 m!816495))

(assert (=> b!876674 d!108551))

(declare-fun d!108553 () Bool)

(declare-fun e!488158 () Bool)

(assert (=> d!108553 e!488158))

(declare-fun res!595842 () Bool)

(assert (=> d!108553 (=> (not res!595842) (not e!488158))))

(declare-fun lt!396710 () ListLongMap!10353)

(assert (=> d!108553 (= res!595842 (contains!4222 lt!396710 (_1!5808 (tuple2!11595 lt!396547 lt!396544))))))

(declare-fun lt!396711 () List!17398)

(assert (=> d!108553 (= lt!396710 (ListLongMap!10354 lt!396711))))

(declare-fun lt!396708 () Unit!29927)

(declare-fun lt!396709 () Unit!29927)

(assert (=> d!108553 (= lt!396708 lt!396709)))

(assert (=> d!108553 (= (getValueByKey!417 lt!396711 (_1!5808 (tuple2!11595 lt!396547 lt!396544))) (Some!422 (_2!5808 (tuple2!11595 lt!396547 lt!396544))))))

(assert (=> d!108553 (= lt!396709 (lemmaContainsTupThenGetReturnValue!234 lt!396711 (_1!5808 (tuple2!11595 lt!396547 lt!396544)) (_2!5808 (tuple2!11595 lt!396547 lt!396544))))))

(assert (=> d!108553 (= lt!396711 (insertStrictlySorted!273 (toList!5192 lt!396545) (_1!5808 (tuple2!11595 lt!396547 lt!396544)) (_2!5808 (tuple2!11595 lt!396547 lt!396544))))))

(assert (=> d!108553 (= (+!2517 lt!396545 (tuple2!11595 lt!396547 lt!396544)) lt!396710)))

(declare-fun b!876965 () Bool)

(declare-fun res!595843 () Bool)

(assert (=> b!876965 (=> (not res!595843) (not e!488158))))

(assert (=> b!876965 (= res!595843 (= (getValueByKey!417 (toList!5192 lt!396710) (_1!5808 (tuple2!11595 lt!396547 lt!396544))) (Some!422 (_2!5808 (tuple2!11595 lt!396547 lt!396544)))))))

(declare-fun b!876966 () Bool)

(assert (=> b!876966 (= e!488158 (contains!4223 (toList!5192 lt!396710) (tuple2!11595 lt!396547 lt!396544)))))

(assert (= (and d!108553 res!595842) b!876965))

(assert (= (and b!876965 res!595843) b!876966))

(declare-fun m!816497 () Bool)

(assert (=> d!108553 m!816497))

(declare-fun m!816499 () Bool)

(assert (=> d!108553 m!816499))

(declare-fun m!816501 () Bool)

(assert (=> d!108553 m!816501))

(declare-fun m!816503 () Bool)

(assert (=> d!108553 m!816503))

(declare-fun m!816505 () Bool)

(assert (=> b!876965 m!816505))

(declare-fun m!816507 () Bool)

(assert (=> b!876966 m!816507))

(assert (=> b!876674 d!108553))

(declare-fun d!108555 () Bool)

(declare-fun e!488160 () Bool)

(assert (=> d!108555 e!488160))

(declare-fun res!595844 () Bool)

(assert (=> d!108555 (=> res!595844 e!488160)))

(declare-fun lt!396713 () Bool)

(assert (=> d!108555 (= res!595844 (not lt!396713))))

(declare-fun lt!396715 () Bool)

(assert (=> d!108555 (= lt!396713 lt!396715)))

(declare-fun lt!396714 () Unit!29927)

(declare-fun e!488159 () Unit!29927)

(assert (=> d!108555 (= lt!396714 e!488159)))

(declare-fun c!92662 () Bool)

(assert (=> d!108555 (= c!92662 lt!396715)))

(assert (=> d!108555 (= lt!396715 (containsKey!401 (toList!5192 lt!396543) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108555 (= (contains!4222 lt!396543 #b0000000000000000000000000000000000000000000000000000000000000000) lt!396713)))

(declare-fun b!876967 () Bool)

(declare-fun lt!396712 () Unit!29927)

(assert (=> b!876967 (= e!488159 lt!396712)))

(assert (=> b!876967 (= lt!396712 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396543) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!876967 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396543) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!876968 () Bool)

(declare-fun Unit!29941 () Unit!29927)

(assert (=> b!876968 (= e!488159 Unit!29941)))

(declare-fun b!876969 () Bool)

(assert (=> b!876969 (= e!488160 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396543) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108555 c!92662) b!876967))

(assert (= (and d!108555 (not c!92662)) b!876968))

(assert (= (and d!108555 (not res!595844)) b!876969))

(declare-fun m!816509 () Bool)

(assert (=> d!108555 m!816509))

(declare-fun m!816511 () Bool)

(assert (=> b!876967 m!816511))

(declare-fun m!816513 () Bool)

(assert (=> b!876967 m!816513))

(assert (=> b!876967 m!816513))

(declare-fun m!816515 () Bool)

(assert (=> b!876967 m!816515))

(assert (=> b!876969 m!816513))

(assert (=> b!876969 m!816513))

(assert (=> b!876969 m!816515))

(assert (=> d!108425 d!108555))

(assert (=> d!108425 d!108427))

(assert (=> b!876672 d!108469))

(assert (=> bm!38785 d!108425))

(declare-fun d!108557 () Bool)

(declare-fun lt!396716 () Bool)

(assert (=> d!108557 (= lt!396716 (select (content!389 (toList!5192 lt!396588)) (tuple2!11595 k0!854 v!557)))))

(declare-fun e!488162 () Bool)

(assert (=> d!108557 (= lt!396716 e!488162)))

(declare-fun res!595846 () Bool)

(assert (=> d!108557 (=> (not res!595846) (not e!488162))))

(assert (=> d!108557 (= res!595846 ((_ is Cons!17394) (toList!5192 lt!396588)))))

(assert (=> d!108557 (= (contains!4223 (toList!5192 lt!396588) (tuple2!11595 k0!854 v!557)) lt!396716)))

(declare-fun b!876970 () Bool)

(declare-fun e!488161 () Bool)

(assert (=> b!876970 (= e!488162 e!488161)))

(declare-fun res!595845 () Bool)

(assert (=> b!876970 (=> res!595845 e!488161)))

(assert (=> b!876970 (= res!595845 (= (h!18525 (toList!5192 lt!396588)) (tuple2!11595 k0!854 v!557)))))

(declare-fun b!876971 () Bool)

(assert (=> b!876971 (= e!488161 (contains!4223 (t!24474 (toList!5192 lt!396588)) (tuple2!11595 k0!854 v!557)))))

(assert (= (and d!108557 res!595846) b!876970))

(assert (= (and b!876970 (not res!595845)) b!876971))

(declare-fun m!816517 () Bool)

(assert (=> d!108557 m!816517))

(declare-fun m!816519 () Bool)

(assert (=> d!108557 m!816519))

(declare-fun m!816521 () Bool)

(assert (=> b!876971 m!816521))

(assert (=> b!876719 d!108557))

(assert (=> b!876750 d!108453))

(declare-fun d!108559 () Bool)

(declare-fun e!488164 () Bool)

(assert (=> d!108559 e!488164))

(declare-fun res!595847 () Bool)

(assert (=> d!108559 (=> res!595847 e!488164)))

(declare-fun lt!396718 () Bool)

(assert (=> d!108559 (= res!595847 (not lt!396718))))

(declare-fun lt!396720 () Bool)

(assert (=> d!108559 (= lt!396718 lt!396720)))

(declare-fun lt!396719 () Unit!29927)

(declare-fun e!488163 () Unit!29927)

(assert (=> d!108559 (= lt!396719 e!488163)))

(declare-fun c!92663 () Bool)

(assert (=> d!108559 (= c!92663 lt!396720)))

(assert (=> d!108559 (= lt!396720 (containsKey!401 (toList!5192 lt!396576) (_1!5808 lt!396453)))))

(assert (=> d!108559 (= (contains!4222 lt!396576 (_1!5808 lt!396453)) lt!396718)))

(declare-fun b!876972 () Bool)

(declare-fun lt!396717 () Unit!29927)

(assert (=> b!876972 (= e!488163 lt!396717)))

(assert (=> b!876972 (= lt!396717 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396576) (_1!5808 lt!396453)))))

(assert (=> b!876972 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396576) (_1!5808 lt!396453)))))

(declare-fun b!876973 () Bool)

(declare-fun Unit!29942 () Unit!29927)

(assert (=> b!876973 (= e!488163 Unit!29942)))

(declare-fun b!876974 () Bool)

(assert (=> b!876974 (= e!488164 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396576) (_1!5808 lt!396453))))))

(assert (= (and d!108559 c!92663) b!876972))

(assert (= (and d!108559 (not c!92663)) b!876973))

(assert (= (and d!108559 (not res!595847)) b!876974))

(declare-fun m!816523 () Bool)

(assert (=> d!108559 m!816523))

(declare-fun m!816525 () Bool)

(assert (=> b!876972 m!816525))

(assert (=> b!876972 m!816083))

(assert (=> b!876972 m!816083))

(declare-fun m!816527 () Bool)

(assert (=> b!876972 m!816527))

(assert (=> b!876974 m!816083))

(assert (=> b!876974 m!816083))

(assert (=> b!876974 m!816527))

(assert (=> d!108441 d!108559))

(declare-fun b!876975 () Bool)

(declare-fun e!488165 () Option!423)

(assert (=> b!876975 (= e!488165 (Some!422 (_2!5808 (h!18525 lt!396577))))))

(declare-fun b!876977 () Bool)

(declare-fun e!488166 () Option!423)

(assert (=> b!876977 (= e!488166 (getValueByKey!417 (t!24474 lt!396577) (_1!5808 lt!396453)))))

(declare-fun d!108561 () Bool)

(declare-fun c!92664 () Bool)

(assert (=> d!108561 (= c!92664 (and ((_ is Cons!17394) lt!396577) (= (_1!5808 (h!18525 lt!396577)) (_1!5808 lt!396453))))))

(assert (=> d!108561 (= (getValueByKey!417 lt!396577 (_1!5808 lt!396453)) e!488165)))

(declare-fun b!876978 () Bool)

(assert (=> b!876978 (= e!488166 None!421)))

(declare-fun b!876976 () Bool)

(assert (=> b!876976 (= e!488165 e!488166)))

(declare-fun c!92665 () Bool)

(assert (=> b!876976 (= c!92665 (and ((_ is Cons!17394) lt!396577) (not (= (_1!5808 (h!18525 lt!396577)) (_1!5808 lt!396453)))))))

(assert (= (and d!108561 c!92664) b!876975))

(assert (= (and d!108561 (not c!92664)) b!876976))

(assert (= (and b!876976 c!92665) b!876977))

(assert (= (and b!876976 (not c!92665)) b!876978))

(declare-fun m!816529 () Bool)

(assert (=> b!876977 m!816529))

(assert (=> d!108441 d!108561))

(declare-fun d!108563 () Bool)

(assert (=> d!108563 (= (getValueByKey!417 lt!396577 (_1!5808 lt!396453)) (Some!422 (_2!5808 lt!396453)))))

(declare-fun lt!396721 () Unit!29927)

(assert (=> d!108563 (= lt!396721 (choose!1441 lt!396577 (_1!5808 lt!396453) (_2!5808 lt!396453)))))

(declare-fun e!488167 () Bool)

(assert (=> d!108563 e!488167))

(declare-fun res!595848 () Bool)

(assert (=> d!108563 (=> (not res!595848) (not e!488167))))

(assert (=> d!108563 (= res!595848 (isStrictlySorted!457 lt!396577))))

(assert (=> d!108563 (= (lemmaContainsTupThenGetReturnValue!234 lt!396577 (_1!5808 lt!396453) (_2!5808 lt!396453)) lt!396721)))

(declare-fun b!876979 () Bool)

(declare-fun res!595849 () Bool)

(assert (=> b!876979 (=> (not res!595849) (not e!488167))))

(assert (=> b!876979 (= res!595849 (containsKey!401 lt!396577 (_1!5808 lt!396453)))))

(declare-fun b!876980 () Bool)

(assert (=> b!876980 (= e!488167 (contains!4223 lt!396577 (tuple2!11595 (_1!5808 lt!396453) (_2!5808 lt!396453))))))

(assert (= (and d!108563 res!595848) b!876979))

(assert (= (and b!876979 res!595849) b!876980))

(assert (=> d!108563 m!816077))

(declare-fun m!816531 () Bool)

(assert (=> d!108563 m!816531))

(declare-fun m!816533 () Bool)

(assert (=> d!108563 m!816533))

(declare-fun m!816535 () Bool)

(assert (=> b!876979 m!816535))

(declare-fun m!816537 () Bool)

(assert (=> b!876980 m!816537))

(assert (=> d!108441 d!108563))

(declare-fun b!876981 () Bool)

(declare-fun e!488171 () List!17398)

(declare-fun call!38815 () List!17398)

(assert (=> b!876981 (= e!488171 call!38815)))

(declare-fun b!876982 () Bool)

(declare-fun e!488168 () List!17398)

(assert (=> b!876982 (= e!488168 e!488171)))

(declare-fun c!92666 () Bool)

(assert (=> b!876982 (= c!92666 (and ((_ is Cons!17394) (toList!5192 lt!396450)) (= (_1!5808 (h!18525 (toList!5192 lt!396450))) (_1!5808 lt!396453))))))

(declare-fun b!876983 () Bool)

(declare-fun call!38816 () List!17398)

(assert (=> b!876983 (= e!488168 call!38816)))

(declare-fun b!876984 () Bool)

(declare-fun e!488169 () List!17398)

(declare-fun call!38814 () List!17398)

(assert (=> b!876984 (= e!488169 call!38814)))

(declare-fun bm!38811 () Bool)

(assert (=> bm!38811 (= call!38815 call!38816)))

(declare-fun d!108565 () Bool)

(declare-fun e!488170 () Bool)

(assert (=> d!108565 e!488170))

(declare-fun res!595851 () Bool)

(assert (=> d!108565 (=> (not res!595851) (not e!488170))))

(declare-fun lt!396722 () List!17398)

(assert (=> d!108565 (= res!595851 (isStrictlySorted!457 lt!396722))))

(assert (=> d!108565 (= lt!396722 e!488168)))

(declare-fun c!92667 () Bool)

(assert (=> d!108565 (= c!92667 (and ((_ is Cons!17394) (toList!5192 lt!396450)) (bvslt (_1!5808 (h!18525 (toList!5192 lt!396450))) (_1!5808 lt!396453))))))

(assert (=> d!108565 (isStrictlySorted!457 (toList!5192 lt!396450))))

(assert (=> d!108565 (= (insertStrictlySorted!273 (toList!5192 lt!396450) (_1!5808 lt!396453) (_2!5808 lt!396453)) lt!396722)))

(declare-fun bm!38812 () Bool)

(assert (=> bm!38812 (= call!38814 call!38815)))

(declare-fun e!488172 () List!17398)

(declare-fun b!876985 () Bool)

(declare-fun c!92669 () Bool)

(assert (=> b!876985 (= e!488172 (ite c!92666 (t!24474 (toList!5192 lt!396450)) (ite c!92669 (Cons!17394 (h!18525 (toList!5192 lt!396450)) (t!24474 (toList!5192 lt!396450))) Nil!17395)))))

(declare-fun bm!38813 () Bool)

(assert (=> bm!38813 (= call!38816 ($colon$colon!537 e!488172 (ite c!92667 (h!18525 (toList!5192 lt!396450)) (tuple2!11595 (_1!5808 lt!396453) (_2!5808 lt!396453)))))))

(declare-fun c!92668 () Bool)

(assert (=> bm!38813 (= c!92668 c!92667)))

(declare-fun b!876986 () Bool)

(assert (=> b!876986 (= e!488170 (contains!4223 lt!396722 (tuple2!11595 (_1!5808 lt!396453) (_2!5808 lt!396453))))))

(declare-fun b!876987 () Bool)

(assert (=> b!876987 (= e!488172 (insertStrictlySorted!273 (t!24474 (toList!5192 lt!396450)) (_1!5808 lt!396453) (_2!5808 lt!396453)))))

(declare-fun b!876988 () Bool)

(assert (=> b!876988 (= c!92669 (and ((_ is Cons!17394) (toList!5192 lt!396450)) (bvsgt (_1!5808 (h!18525 (toList!5192 lt!396450))) (_1!5808 lt!396453))))))

(assert (=> b!876988 (= e!488171 e!488169)))

(declare-fun b!876989 () Bool)

(declare-fun res!595850 () Bool)

(assert (=> b!876989 (=> (not res!595850) (not e!488170))))

(assert (=> b!876989 (= res!595850 (containsKey!401 lt!396722 (_1!5808 lt!396453)))))

(declare-fun b!876990 () Bool)

(assert (=> b!876990 (= e!488169 call!38814)))

(assert (= (and d!108565 c!92667) b!876983))

(assert (= (and d!108565 (not c!92667)) b!876982))

(assert (= (and b!876982 c!92666) b!876981))

(assert (= (and b!876982 (not c!92666)) b!876988))

(assert (= (and b!876988 c!92669) b!876990))

(assert (= (and b!876988 (not c!92669)) b!876984))

(assert (= (or b!876990 b!876984) bm!38812))

(assert (= (or b!876981 bm!38812) bm!38811))

(assert (= (or b!876983 bm!38811) bm!38813))

(assert (= (and bm!38813 c!92668) b!876987))

(assert (= (and bm!38813 (not c!92668)) b!876985))

(assert (= (and d!108565 res!595851) b!876989))

(assert (= (and b!876989 res!595850) b!876986))

(declare-fun m!816539 () Bool)

(assert (=> d!108565 m!816539))

(assert (=> d!108565 m!816291))

(declare-fun m!816541 () Bool)

(assert (=> b!876986 m!816541))

(declare-fun m!816543 () Bool)

(assert (=> b!876989 m!816543))

(declare-fun m!816545 () Bool)

(assert (=> bm!38813 m!816545))

(declare-fun m!816547 () Bool)

(assert (=> b!876987 m!816547))

(assert (=> d!108441 d!108565))

(declare-fun d!108567 () Bool)

(declare-fun e!488174 () Bool)

(assert (=> d!108567 e!488174))

(declare-fun res!595852 () Bool)

(assert (=> d!108567 (=> res!595852 e!488174)))

(declare-fun lt!396724 () Bool)

(assert (=> d!108567 (= res!595852 (not lt!396724))))

(declare-fun lt!396726 () Bool)

(assert (=> d!108567 (= lt!396724 lt!396726)))

(declare-fun lt!396725 () Unit!29927)

(declare-fun e!488173 () Unit!29927)

(assert (=> d!108567 (= lt!396725 e!488173)))

(declare-fun c!92670 () Bool)

(assert (=> d!108567 (= c!92670 lt!396726)))

(assert (=> d!108567 (= lt!396726 (containsKey!401 (toList!5192 lt!396543) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108567 (= (contains!4222 lt!396543 #b1000000000000000000000000000000000000000000000000000000000000000) lt!396724)))

(declare-fun b!876991 () Bool)

(declare-fun lt!396723 () Unit!29927)

(assert (=> b!876991 (= e!488173 lt!396723)))

(assert (=> b!876991 (= lt!396723 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396543) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!876991 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396543) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!876992 () Bool)

(declare-fun Unit!29943 () Unit!29927)

(assert (=> b!876992 (= e!488173 Unit!29943)))

(declare-fun b!876993 () Bool)

(assert (=> b!876993 (= e!488174 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396543) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108567 c!92670) b!876991))

(assert (= (and d!108567 (not c!92670)) b!876992))

(assert (= (and d!108567 (not res!595852)) b!876993))

(declare-fun m!816549 () Bool)

(assert (=> d!108567 m!816549))

(declare-fun m!816551 () Bool)

(assert (=> b!876991 m!816551))

(declare-fun m!816553 () Bool)

(assert (=> b!876991 m!816553))

(assert (=> b!876991 m!816553))

(declare-fun m!816555 () Bool)

(assert (=> b!876991 m!816555))

(assert (=> b!876993 m!816553))

(assert (=> b!876993 m!816553))

(assert (=> b!876993 m!816555))

(assert (=> b!876681 d!108567))

(declare-fun d!108569 () Bool)

(declare-fun e!488176 () Bool)

(assert (=> d!108569 e!488176))

(declare-fun res!595853 () Bool)

(assert (=> d!108569 (=> res!595853 e!488176)))

(declare-fun lt!396728 () Bool)

(assert (=> d!108569 (= res!595853 (not lt!396728))))

(declare-fun lt!396730 () Bool)

(assert (=> d!108569 (= lt!396728 lt!396730)))

(declare-fun lt!396729 () Unit!29927)

(declare-fun e!488175 () Unit!29927)

(assert (=> d!108569 (= lt!396729 e!488175)))

(declare-fun c!92671 () Bool)

(assert (=> d!108569 (= c!92671 lt!396730)))

(assert (=> d!108569 (= lt!396730 (containsKey!401 (toList!5192 lt!396565) (_1!5808 (tuple2!11595 k0!854 lt!396456))))))

(assert (=> d!108569 (= (contains!4222 lt!396565 (_1!5808 (tuple2!11595 k0!854 lt!396456))) lt!396728)))

(declare-fun b!876994 () Bool)

(declare-fun lt!396727 () Unit!29927)

(assert (=> b!876994 (= e!488175 lt!396727)))

(assert (=> b!876994 (= lt!396727 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396565) (_1!5808 (tuple2!11595 k0!854 lt!396456))))))

(assert (=> b!876994 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396565) (_1!5808 (tuple2!11595 k0!854 lt!396456))))))

(declare-fun b!876995 () Bool)

(declare-fun Unit!29944 () Unit!29927)

(assert (=> b!876995 (= e!488175 Unit!29944)))

(declare-fun b!876996 () Bool)

(assert (=> b!876996 (= e!488176 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396565) (_1!5808 (tuple2!11595 k0!854 lt!396456)))))))

(assert (= (and d!108569 c!92671) b!876994))

(assert (= (and d!108569 (not c!92671)) b!876995))

(assert (= (and d!108569 (not res!595853)) b!876996))

(declare-fun m!816557 () Bool)

(assert (=> d!108569 m!816557))

(declare-fun m!816559 () Bool)

(assert (=> b!876994 m!816559))

(assert (=> b!876994 m!816053))

(assert (=> b!876994 m!816053))

(declare-fun m!816561 () Bool)

(assert (=> b!876994 m!816561))

(assert (=> b!876996 m!816053))

(assert (=> b!876996 m!816053))

(assert (=> b!876996 m!816561))

(assert (=> d!108435 d!108569))

(declare-fun b!876997 () Bool)

(declare-fun e!488177 () Option!423)

(assert (=> b!876997 (= e!488177 (Some!422 (_2!5808 (h!18525 lt!396566))))))

(declare-fun e!488178 () Option!423)

(declare-fun b!876999 () Bool)

(assert (=> b!876999 (= e!488178 (getValueByKey!417 (t!24474 lt!396566) (_1!5808 (tuple2!11595 k0!854 lt!396456))))))

(declare-fun d!108571 () Bool)

(declare-fun c!92672 () Bool)

(assert (=> d!108571 (= c!92672 (and ((_ is Cons!17394) lt!396566) (= (_1!5808 (h!18525 lt!396566)) (_1!5808 (tuple2!11595 k0!854 lt!396456)))))))

(assert (=> d!108571 (= (getValueByKey!417 lt!396566 (_1!5808 (tuple2!11595 k0!854 lt!396456))) e!488177)))

(declare-fun b!877000 () Bool)

(assert (=> b!877000 (= e!488178 None!421)))

(declare-fun b!876998 () Bool)

(assert (=> b!876998 (= e!488177 e!488178)))

(declare-fun c!92673 () Bool)

(assert (=> b!876998 (= c!92673 (and ((_ is Cons!17394) lt!396566) (not (= (_1!5808 (h!18525 lt!396566)) (_1!5808 (tuple2!11595 k0!854 lt!396456))))))))

(assert (= (and d!108571 c!92672) b!876997))

(assert (= (and d!108571 (not c!92672)) b!876998))

(assert (= (and b!876998 c!92673) b!876999))

(assert (= (and b!876998 (not c!92673)) b!877000))

(declare-fun m!816563 () Bool)

(assert (=> b!876999 m!816563))

(assert (=> d!108435 d!108571))

(declare-fun d!108573 () Bool)

(assert (=> d!108573 (= (getValueByKey!417 lt!396566 (_1!5808 (tuple2!11595 k0!854 lt!396456))) (Some!422 (_2!5808 (tuple2!11595 k0!854 lt!396456))))))

(declare-fun lt!396731 () Unit!29927)

(assert (=> d!108573 (= lt!396731 (choose!1441 lt!396566 (_1!5808 (tuple2!11595 k0!854 lt!396456)) (_2!5808 (tuple2!11595 k0!854 lt!396456))))))

(declare-fun e!488179 () Bool)

(assert (=> d!108573 e!488179))

(declare-fun res!595854 () Bool)

(assert (=> d!108573 (=> (not res!595854) (not e!488179))))

(assert (=> d!108573 (= res!595854 (isStrictlySorted!457 lt!396566))))

(assert (=> d!108573 (= (lemmaContainsTupThenGetReturnValue!234 lt!396566 (_1!5808 (tuple2!11595 k0!854 lt!396456)) (_2!5808 (tuple2!11595 k0!854 lt!396456))) lt!396731)))

(declare-fun b!877001 () Bool)

(declare-fun res!595855 () Bool)

(assert (=> b!877001 (=> (not res!595855) (not e!488179))))

(assert (=> b!877001 (= res!595855 (containsKey!401 lt!396566 (_1!5808 (tuple2!11595 k0!854 lt!396456))))))

(declare-fun b!877002 () Bool)

(assert (=> b!877002 (= e!488179 (contains!4223 lt!396566 (tuple2!11595 (_1!5808 (tuple2!11595 k0!854 lt!396456)) (_2!5808 (tuple2!11595 k0!854 lt!396456)))))))

(assert (= (and d!108573 res!595854) b!877001))

(assert (= (and b!877001 res!595855) b!877002))

(assert (=> d!108573 m!816047))

(declare-fun m!816565 () Bool)

(assert (=> d!108573 m!816565))

(declare-fun m!816567 () Bool)

(assert (=> d!108573 m!816567))

(declare-fun m!816569 () Bool)

(assert (=> b!877001 m!816569))

(declare-fun m!816571 () Bool)

(assert (=> b!877002 m!816571))

(assert (=> d!108435 d!108573))

(declare-fun b!877003 () Bool)

(declare-fun e!488183 () List!17398)

(declare-fun call!38818 () List!17398)

(assert (=> b!877003 (= e!488183 call!38818)))

(declare-fun b!877004 () Bool)

(declare-fun e!488180 () List!17398)

(assert (=> b!877004 (= e!488180 e!488183)))

(declare-fun c!92674 () Bool)

(assert (=> b!877004 (= c!92674 (and ((_ is Cons!17394) (toList!5192 lt!396450)) (= (_1!5808 (h!18525 (toList!5192 lt!396450))) (_1!5808 (tuple2!11595 k0!854 lt!396456)))))))

(declare-fun b!877005 () Bool)

(declare-fun call!38819 () List!17398)

(assert (=> b!877005 (= e!488180 call!38819)))

(declare-fun b!877006 () Bool)

(declare-fun e!488181 () List!17398)

(declare-fun call!38817 () List!17398)

(assert (=> b!877006 (= e!488181 call!38817)))

(declare-fun bm!38814 () Bool)

(assert (=> bm!38814 (= call!38818 call!38819)))

(declare-fun d!108575 () Bool)

(declare-fun e!488182 () Bool)

(assert (=> d!108575 e!488182))

(declare-fun res!595857 () Bool)

(assert (=> d!108575 (=> (not res!595857) (not e!488182))))

(declare-fun lt!396732 () List!17398)

(assert (=> d!108575 (= res!595857 (isStrictlySorted!457 lt!396732))))

(assert (=> d!108575 (= lt!396732 e!488180)))

(declare-fun c!92675 () Bool)

(assert (=> d!108575 (= c!92675 (and ((_ is Cons!17394) (toList!5192 lt!396450)) (bvslt (_1!5808 (h!18525 (toList!5192 lt!396450))) (_1!5808 (tuple2!11595 k0!854 lt!396456)))))))

(assert (=> d!108575 (isStrictlySorted!457 (toList!5192 lt!396450))))

(assert (=> d!108575 (= (insertStrictlySorted!273 (toList!5192 lt!396450) (_1!5808 (tuple2!11595 k0!854 lt!396456)) (_2!5808 (tuple2!11595 k0!854 lt!396456))) lt!396732)))

(declare-fun bm!38815 () Bool)

(assert (=> bm!38815 (= call!38817 call!38818)))

(declare-fun c!92677 () Bool)

(declare-fun b!877007 () Bool)

(declare-fun e!488184 () List!17398)

(assert (=> b!877007 (= e!488184 (ite c!92674 (t!24474 (toList!5192 lt!396450)) (ite c!92677 (Cons!17394 (h!18525 (toList!5192 lt!396450)) (t!24474 (toList!5192 lt!396450))) Nil!17395)))))

(declare-fun bm!38816 () Bool)

(assert (=> bm!38816 (= call!38819 ($colon$colon!537 e!488184 (ite c!92675 (h!18525 (toList!5192 lt!396450)) (tuple2!11595 (_1!5808 (tuple2!11595 k0!854 lt!396456)) (_2!5808 (tuple2!11595 k0!854 lt!396456))))))))

(declare-fun c!92676 () Bool)

(assert (=> bm!38816 (= c!92676 c!92675)))

(declare-fun b!877008 () Bool)

(assert (=> b!877008 (= e!488182 (contains!4223 lt!396732 (tuple2!11595 (_1!5808 (tuple2!11595 k0!854 lt!396456)) (_2!5808 (tuple2!11595 k0!854 lt!396456)))))))

(declare-fun b!877009 () Bool)

(assert (=> b!877009 (= e!488184 (insertStrictlySorted!273 (t!24474 (toList!5192 lt!396450)) (_1!5808 (tuple2!11595 k0!854 lt!396456)) (_2!5808 (tuple2!11595 k0!854 lt!396456))))))

(declare-fun b!877010 () Bool)

(assert (=> b!877010 (= c!92677 (and ((_ is Cons!17394) (toList!5192 lt!396450)) (bvsgt (_1!5808 (h!18525 (toList!5192 lt!396450))) (_1!5808 (tuple2!11595 k0!854 lt!396456)))))))

(assert (=> b!877010 (= e!488183 e!488181)))

(declare-fun b!877011 () Bool)

(declare-fun res!595856 () Bool)

(assert (=> b!877011 (=> (not res!595856) (not e!488182))))

(assert (=> b!877011 (= res!595856 (containsKey!401 lt!396732 (_1!5808 (tuple2!11595 k0!854 lt!396456))))))

(declare-fun b!877012 () Bool)

(assert (=> b!877012 (= e!488181 call!38817)))

(assert (= (and d!108575 c!92675) b!877005))

(assert (= (and d!108575 (not c!92675)) b!877004))

(assert (= (and b!877004 c!92674) b!877003))

(assert (= (and b!877004 (not c!92674)) b!877010))

(assert (= (and b!877010 c!92677) b!877012))

(assert (= (and b!877010 (not c!92677)) b!877006))

(assert (= (or b!877012 b!877006) bm!38815))

(assert (= (or b!877003 bm!38815) bm!38814))

(assert (= (or b!877005 bm!38814) bm!38816))

(assert (= (and bm!38816 c!92676) b!877009))

(assert (= (and bm!38816 (not c!92676)) b!877007))

(assert (= (and d!108575 res!595857) b!877011))

(assert (= (and b!877011 res!595856) b!877008))

(declare-fun m!816573 () Bool)

(assert (=> d!108575 m!816573))

(assert (=> d!108575 m!816291))

(declare-fun m!816575 () Bool)

(assert (=> b!877008 m!816575))

(declare-fun m!816577 () Bool)

(assert (=> b!877011 m!816577))

(declare-fun m!816579 () Bool)

(assert (=> bm!38816 m!816579))

(declare-fun m!816581 () Bool)

(assert (=> b!877009 m!816581))

(assert (=> d!108435 d!108575))

(declare-fun d!108577 () Bool)

(declare-fun e!488186 () Bool)

(assert (=> d!108577 e!488186))

(declare-fun res!595858 () Bool)

(assert (=> d!108577 (=> res!595858 e!488186)))

(declare-fun lt!396734 () Bool)

(assert (=> d!108577 (= res!595858 (not lt!396734))))

(declare-fun lt!396736 () Bool)

(assert (=> d!108577 (= lt!396734 lt!396736)))

(declare-fun lt!396735 () Unit!29927)

(declare-fun e!488185 () Unit!29927)

(assert (=> d!108577 (= lt!396735 e!488185)))

(declare-fun c!92678 () Bool)

(assert (=> d!108577 (= c!92678 lt!396736)))

(assert (=> d!108577 (= lt!396736 (containsKey!401 (toList!5192 lt!396580) (_1!5808 lt!396453)))))

(assert (=> d!108577 (= (contains!4222 lt!396580 (_1!5808 lt!396453)) lt!396734)))

(declare-fun b!877013 () Bool)

(declare-fun lt!396733 () Unit!29927)

(assert (=> b!877013 (= e!488185 lt!396733)))

(assert (=> b!877013 (= lt!396733 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396580) (_1!5808 lt!396453)))))

(assert (=> b!877013 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396580) (_1!5808 lt!396453)))))

(declare-fun b!877014 () Bool)

(declare-fun Unit!29945 () Unit!29927)

(assert (=> b!877014 (= e!488185 Unit!29945)))

(declare-fun b!877015 () Bool)

(assert (=> b!877015 (= e!488186 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396580) (_1!5808 lt!396453))))))

(assert (= (and d!108577 c!92678) b!877013))

(assert (= (and d!108577 (not c!92678)) b!877014))

(assert (= (and d!108577 (not res!595858)) b!877015))

(declare-fun m!816583 () Bool)

(assert (=> d!108577 m!816583))

(declare-fun m!816585 () Bool)

(assert (=> b!877013 m!816585))

(assert (=> b!877013 m!816095))

(assert (=> b!877013 m!816095))

(declare-fun m!816587 () Bool)

(assert (=> b!877013 m!816587))

(assert (=> b!877015 m!816095))

(assert (=> b!877015 m!816095))

(assert (=> b!877015 m!816587))

(assert (=> d!108443 d!108577))

(declare-fun b!877016 () Bool)

(declare-fun e!488187 () Option!423)

(assert (=> b!877016 (= e!488187 (Some!422 (_2!5808 (h!18525 lt!396581))))))

(declare-fun b!877018 () Bool)

(declare-fun e!488188 () Option!423)

(assert (=> b!877018 (= e!488188 (getValueByKey!417 (t!24474 lt!396581) (_1!5808 lt!396453)))))

(declare-fun d!108579 () Bool)

(declare-fun c!92679 () Bool)

(assert (=> d!108579 (= c!92679 (and ((_ is Cons!17394) lt!396581) (= (_1!5808 (h!18525 lt!396581)) (_1!5808 lt!396453))))))

(assert (=> d!108579 (= (getValueByKey!417 lt!396581 (_1!5808 lt!396453)) e!488187)))

(declare-fun b!877019 () Bool)

(assert (=> b!877019 (= e!488188 None!421)))

(declare-fun b!877017 () Bool)

(assert (=> b!877017 (= e!488187 e!488188)))

(declare-fun c!92680 () Bool)

(assert (=> b!877017 (= c!92680 (and ((_ is Cons!17394) lt!396581) (not (= (_1!5808 (h!18525 lt!396581)) (_1!5808 lt!396453)))))))

(assert (= (and d!108579 c!92679) b!877016))

(assert (= (and d!108579 (not c!92679)) b!877017))

(assert (= (and b!877017 c!92680) b!877018))

(assert (= (and b!877017 (not c!92680)) b!877019))

(declare-fun m!816589 () Bool)

(assert (=> b!877018 m!816589))

(assert (=> d!108443 d!108579))

(declare-fun d!108581 () Bool)

(assert (=> d!108581 (= (getValueByKey!417 lt!396581 (_1!5808 lt!396453)) (Some!422 (_2!5808 lt!396453)))))

(declare-fun lt!396737 () Unit!29927)

(assert (=> d!108581 (= lt!396737 (choose!1441 lt!396581 (_1!5808 lt!396453) (_2!5808 lt!396453)))))

(declare-fun e!488189 () Bool)

(assert (=> d!108581 e!488189))

(declare-fun res!595859 () Bool)

(assert (=> d!108581 (=> (not res!595859) (not e!488189))))

(assert (=> d!108581 (= res!595859 (isStrictlySorted!457 lt!396581))))

(assert (=> d!108581 (= (lemmaContainsTupThenGetReturnValue!234 lt!396581 (_1!5808 lt!396453) (_2!5808 lt!396453)) lt!396737)))

(declare-fun b!877020 () Bool)

(declare-fun res!595860 () Bool)

(assert (=> b!877020 (=> (not res!595860) (not e!488189))))

(assert (=> b!877020 (= res!595860 (containsKey!401 lt!396581 (_1!5808 lt!396453)))))

(declare-fun b!877021 () Bool)

(assert (=> b!877021 (= e!488189 (contains!4223 lt!396581 (tuple2!11595 (_1!5808 lt!396453) (_2!5808 lt!396453))))))

(assert (= (and d!108581 res!595859) b!877020))

(assert (= (and b!877020 res!595860) b!877021))

(assert (=> d!108581 m!816089))

(declare-fun m!816591 () Bool)

(assert (=> d!108581 m!816591))

(declare-fun m!816593 () Bool)

(assert (=> d!108581 m!816593))

(declare-fun m!816595 () Bool)

(assert (=> b!877020 m!816595))

(declare-fun m!816597 () Bool)

(assert (=> b!877021 m!816597))

(assert (=> d!108443 d!108581))

(declare-fun b!877022 () Bool)

(declare-fun e!488193 () List!17398)

(declare-fun call!38821 () List!17398)

(assert (=> b!877022 (= e!488193 call!38821)))

(declare-fun b!877023 () Bool)

(declare-fun e!488190 () List!17398)

(assert (=> b!877023 (= e!488190 e!488193)))

(declare-fun c!92681 () Bool)

(assert (=> b!877023 (= c!92681 (and ((_ is Cons!17394) (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456)))) (= (_1!5808 (h!18525 (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456))))) (_1!5808 lt!396453))))))

(declare-fun b!877024 () Bool)

(declare-fun call!38822 () List!17398)

(assert (=> b!877024 (= e!488190 call!38822)))

(declare-fun b!877025 () Bool)

(declare-fun e!488191 () List!17398)

(declare-fun call!38820 () List!17398)

(assert (=> b!877025 (= e!488191 call!38820)))

(declare-fun bm!38817 () Bool)

(assert (=> bm!38817 (= call!38821 call!38822)))

(declare-fun d!108583 () Bool)

(declare-fun e!488192 () Bool)

(assert (=> d!108583 e!488192))

(declare-fun res!595862 () Bool)

(assert (=> d!108583 (=> (not res!595862) (not e!488192))))

(declare-fun lt!396738 () List!17398)

(assert (=> d!108583 (= res!595862 (isStrictlySorted!457 lt!396738))))

(assert (=> d!108583 (= lt!396738 e!488190)))

(declare-fun c!92682 () Bool)

(assert (=> d!108583 (= c!92682 (and ((_ is Cons!17394) (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456)))) (bvslt (_1!5808 (h!18525 (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456))))) (_1!5808 lt!396453))))))

(assert (=> d!108583 (isStrictlySorted!457 (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456))))))

(assert (=> d!108583 (= (insertStrictlySorted!273 (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456))) (_1!5808 lt!396453) (_2!5808 lt!396453)) lt!396738)))

(declare-fun bm!38818 () Bool)

(assert (=> bm!38818 (= call!38820 call!38821)))

(declare-fun e!488194 () List!17398)

(declare-fun c!92684 () Bool)

(declare-fun b!877026 () Bool)

(assert (=> b!877026 (= e!488194 (ite c!92681 (t!24474 (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456)))) (ite c!92684 (Cons!17394 (h!18525 (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456)))) (t!24474 (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456))))) Nil!17395)))))

(declare-fun bm!38819 () Bool)

(assert (=> bm!38819 (= call!38822 ($colon$colon!537 e!488194 (ite c!92682 (h!18525 (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456)))) (tuple2!11595 (_1!5808 lt!396453) (_2!5808 lt!396453)))))))

(declare-fun c!92683 () Bool)

(assert (=> bm!38819 (= c!92683 c!92682)))

(declare-fun b!877027 () Bool)

(assert (=> b!877027 (= e!488192 (contains!4223 lt!396738 (tuple2!11595 (_1!5808 lt!396453) (_2!5808 lt!396453))))))

(declare-fun b!877028 () Bool)

(assert (=> b!877028 (= e!488194 (insertStrictlySorted!273 (t!24474 (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456)))) (_1!5808 lt!396453) (_2!5808 lt!396453)))))

(declare-fun b!877029 () Bool)

(assert (=> b!877029 (= c!92684 (and ((_ is Cons!17394) (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456)))) (bvsgt (_1!5808 (h!18525 (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456))))) (_1!5808 lt!396453))))))

(assert (=> b!877029 (= e!488193 e!488191)))

(declare-fun b!877030 () Bool)

(declare-fun res!595861 () Bool)

(assert (=> b!877030 (=> (not res!595861) (not e!488192))))

(assert (=> b!877030 (= res!595861 (containsKey!401 lt!396738 (_1!5808 lt!396453)))))

(declare-fun b!877031 () Bool)

(assert (=> b!877031 (= e!488191 call!38820)))

(assert (= (and d!108583 c!92682) b!877024))

(assert (= (and d!108583 (not c!92682)) b!877023))

(assert (= (and b!877023 c!92681) b!877022))

(assert (= (and b!877023 (not c!92681)) b!877029))

(assert (= (and b!877029 c!92684) b!877031))

(assert (= (and b!877029 (not c!92684)) b!877025))

(assert (= (or b!877031 b!877025) bm!38818))

(assert (= (or b!877022 bm!38818) bm!38817))

(assert (= (or b!877024 bm!38817) bm!38819))

(assert (= (and bm!38819 c!92683) b!877028))

(assert (= (and bm!38819 (not c!92683)) b!877026))

(assert (= (and d!108583 res!595862) b!877030))

(assert (= (and b!877030 res!595861) b!877027))

(declare-fun m!816599 () Bool)

(assert (=> d!108583 m!816599))

(declare-fun m!816601 () Bool)

(assert (=> d!108583 m!816601))

(declare-fun m!816603 () Bool)

(assert (=> b!877027 m!816603))

(declare-fun m!816605 () Bool)

(assert (=> b!877030 m!816605))

(declare-fun m!816607 () Bool)

(assert (=> bm!38819 m!816607))

(declare-fun m!816609 () Bool)

(assert (=> b!877028 m!816609))

(assert (=> d!108443 d!108583))

(declare-fun b!877032 () Bool)

(declare-fun e!488198 () ListLongMap!10353)

(declare-fun e!488195 () ListLongMap!10353)

(assert (=> b!877032 (= e!488198 e!488195)))

(declare-fun c!92685 () Bool)

(assert (=> b!877032 (= c!92685 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(declare-fun b!877033 () Bool)

(declare-fun e!488201 () Bool)

(declare-fun e!488197 () Bool)

(assert (=> b!877033 (= e!488201 e!488197)))

(declare-fun c!92687 () Bool)

(declare-fun e!488200 () Bool)

(assert (=> b!877033 (= c!92687 e!488200)))

(declare-fun res!595863 () Bool)

(assert (=> b!877033 (=> (not res!595863) (not e!488200))))

(assert (=> b!877033 (= res!595863 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(declare-fun b!877034 () Bool)

(declare-fun lt!396744 () Unit!29927)

(declare-fun lt!396740 () Unit!29927)

(assert (=> b!877034 (= lt!396744 lt!396740)))

(declare-fun lt!396743 () ListLongMap!10353)

(declare-fun lt!396739 () (_ BitVec 64))

(declare-fun lt!396742 () V!28281)

(declare-fun lt!396745 () (_ BitVec 64))

(assert (=> b!877034 (not (contains!4222 (+!2517 lt!396743 (tuple2!11595 lt!396745 lt!396742)) lt!396739))))

(assert (=> b!877034 (= lt!396740 (addStillNotContains!203 lt!396743 lt!396745 lt!396742 lt!396739))))

(assert (=> b!877034 (= lt!396739 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!877034 (= lt!396742 (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!877034 (= lt!396745 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(declare-fun call!38823 () ListLongMap!10353)

(assert (=> b!877034 (= lt!396743 call!38823)))

(assert (=> b!877034 (= e!488195 (+!2517 call!38823 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!877035 () Bool)

(assert (=> b!877035 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(assert (=> b!877035 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24948 _values!688)))))

(declare-fun lt!396741 () ListLongMap!10353)

(declare-fun e!488196 () Bool)

(assert (=> b!877035 (= e!488196 (= (apply!377 lt!396741 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))) (get!12898 (select (arr!24506 _values!688) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!877036 () Bool)

(declare-fun e!488199 () Bool)

(assert (=> b!877036 (= e!488199 (isEmpty!668 lt!396741))))

(declare-fun b!877037 () Bool)

(assert (=> b!877037 (= e!488195 call!38823)))

(declare-fun b!877038 () Bool)

(assert (=> b!877038 (= e!488200 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!877038 (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun bm!38820 () Bool)

(assert (=> bm!38820 (= call!38823 (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!877040 () Bool)

(assert (=> b!877040 (= e!488199 (= lt!396741 (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!877041 () Bool)

(declare-fun res!595864 () Bool)

(assert (=> b!877041 (=> (not res!595864) (not e!488201))))

(assert (=> b!877041 (= res!595864 (not (contains!4222 lt!396741 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877042 () Bool)

(assert (=> b!877042 (= e!488197 e!488199)))

(declare-fun c!92686 () Bool)

(assert (=> b!877042 (= c!92686 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(declare-fun b!877043 () Bool)

(assert (=> b!877043 (= e!488197 e!488196)))

(assert (=> b!877043 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(declare-fun res!595865 () Bool)

(assert (=> b!877043 (= res!595865 (contains!4222 lt!396741 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!877043 (=> (not res!595865) (not e!488196))))

(declare-fun d!108585 () Bool)

(assert (=> d!108585 e!488201))

(declare-fun res!595866 () Bool)

(assert (=> d!108585 (=> (not res!595866) (not e!488201))))

(assert (=> d!108585 (= res!595866 (not (contains!4222 lt!396741 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108585 (= lt!396741 e!488198)))

(declare-fun c!92688 () Bool)

(assert (=> d!108585 (= c!92688 (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(assert (=> d!108585 (validMask!0 mask!1196)))

(assert (=> d!108585 (= (getCurrentListMapNoExtraKeys!3185 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696) lt!396741)))

(declare-fun b!877039 () Bool)

(assert (=> b!877039 (= e!488198 (ListLongMap!10354 Nil!17395))))

(assert (= (and d!108585 c!92688) b!877039))

(assert (= (and d!108585 (not c!92688)) b!877032))

(assert (= (and b!877032 c!92685) b!877034))

(assert (= (and b!877032 (not c!92685)) b!877037))

(assert (= (or b!877034 b!877037) bm!38820))

(assert (= (and d!108585 res!595866) b!877041))

(assert (= (and b!877041 res!595864) b!877033))

(assert (= (and b!877033 res!595863) b!877038))

(assert (= (and b!877033 c!92687) b!877043))

(assert (= (and b!877033 (not c!92687)) b!877042))

(assert (= (and b!877043 res!595865) b!877035))

(assert (= (and b!877042 c!92686) b!877040))

(assert (= (and b!877042 (not c!92686)) b!877036))

(declare-fun b_lambda!12283 () Bool)

(assert (=> (not b_lambda!12283) (not b!877034)))

(assert (=> b!877034 t!24473))

(declare-fun b_and!25029 () Bool)

(assert (= b_and!25027 (and (=> t!24473 result!9493) b_and!25029)))

(declare-fun b_lambda!12285 () Bool)

(assert (=> (not b_lambda!12285) (not b!877035)))

(assert (=> b!877035 t!24473))

(declare-fun b_and!25031 () Bool)

(assert (= b_and!25029 (and (=> t!24473 result!9493) b_and!25031)))

(assert (=> b!877035 m!815839))

(declare-fun m!816611 () Bool)

(assert (=> b!877035 m!816611))

(assert (=> b!877035 m!815839))

(declare-fun m!816613 () Bool)

(assert (=> b!877035 m!816613))

(assert (=> b!877035 m!816397))

(assert (=> b!877035 m!816397))

(declare-fun m!816615 () Bool)

(assert (=> b!877035 m!816615))

(assert (=> b!877035 m!816611))

(assert (=> b!877034 m!815839))

(declare-fun m!816617 () Bool)

(assert (=> b!877034 m!816617))

(assert (=> b!877034 m!816611))

(assert (=> b!877034 m!815839))

(assert (=> b!877034 m!816613))

(assert (=> b!877034 m!816397))

(declare-fun m!816619 () Bool)

(assert (=> b!877034 m!816619))

(assert (=> b!877034 m!816617))

(declare-fun m!816621 () Bool)

(assert (=> b!877034 m!816621))

(declare-fun m!816623 () Bool)

(assert (=> b!877034 m!816623))

(assert (=> b!877034 m!816611))

(declare-fun m!816625 () Bool)

(assert (=> bm!38820 m!816625))

(assert (=> b!877032 m!816397))

(assert (=> b!877032 m!816397))

(assert (=> b!877032 m!816411))

(assert (=> b!877043 m!816397))

(assert (=> b!877043 m!816397))

(declare-fun m!816627 () Bool)

(assert (=> b!877043 m!816627))

(declare-fun m!816629 () Bool)

(assert (=> d!108585 m!816629))

(assert (=> d!108585 m!815817))

(assert (=> b!877038 m!816397))

(assert (=> b!877038 m!816397))

(assert (=> b!877038 m!816411))

(declare-fun m!816631 () Bool)

(assert (=> b!877036 m!816631))

(assert (=> b!877040 m!816625))

(declare-fun m!816633 () Bool)

(assert (=> b!877041 m!816633))

(assert (=> bm!38776 d!108585))

(declare-fun d!108587 () Bool)

(declare-fun e!488203 () Bool)

(assert (=> d!108587 e!488203))

(declare-fun res!595867 () Bool)

(assert (=> d!108587 (=> res!595867 e!488203)))

(declare-fun lt!396747 () Bool)

(assert (=> d!108587 (= res!595867 (not lt!396747))))

(declare-fun lt!396749 () Bool)

(assert (=> d!108587 (= lt!396747 lt!396749)))

(declare-fun lt!396748 () Unit!29927)

(declare-fun e!488202 () Unit!29927)

(assert (=> d!108587 (= lt!396748 e!488202)))

(declare-fun c!92689 () Bool)

(assert (=> d!108587 (= c!92689 lt!396749)))

(assert (=> d!108587 (= lt!396749 (containsKey!401 (toList!5192 lt!396572) (_1!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> d!108587 (= (contains!4222 lt!396572 (_1!5808 (tuple2!11595 k0!854 v!557))) lt!396747)))

(declare-fun b!877044 () Bool)

(declare-fun lt!396746 () Unit!29927)

(assert (=> b!877044 (= e!488202 lt!396746)))

(assert (=> b!877044 (= lt!396746 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396572) (_1!5808 (tuple2!11595 k0!854 v!557))))))

(assert (=> b!877044 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396572) (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun b!877045 () Bool)

(declare-fun Unit!29946 () Unit!29927)

(assert (=> b!877045 (= e!488202 Unit!29946)))

(declare-fun b!877046 () Bool)

(assert (=> b!877046 (= e!488203 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396572) (_1!5808 (tuple2!11595 k0!854 v!557)))))))

(assert (= (and d!108587 c!92689) b!877044))

(assert (= (and d!108587 (not c!92689)) b!877045))

(assert (= (and d!108587 (not res!595867)) b!877046))

(declare-fun m!816635 () Bool)

(assert (=> d!108587 m!816635))

(declare-fun m!816637 () Bool)

(assert (=> b!877044 m!816637))

(assert (=> b!877044 m!816071))

(assert (=> b!877044 m!816071))

(declare-fun m!816639 () Bool)

(assert (=> b!877044 m!816639))

(assert (=> b!877046 m!816071))

(assert (=> b!877046 m!816071))

(assert (=> b!877046 m!816639))

(assert (=> d!108439 d!108587))

(declare-fun b!877047 () Bool)

(declare-fun e!488204 () Option!423)

(assert (=> b!877047 (= e!488204 (Some!422 (_2!5808 (h!18525 lt!396573))))))

(declare-fun b!877049 () Bool)

(declare-fun e!488205 () Option!423)

(assert (=> b!877049 (= e!488205 (getValueByKey!417 (t!24474 lt!396573) (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun d!108589 () Bool)

(declare-fun c!92690 () Bool)

(assert (=> d!108589 (= c!92690 (and ((_ is Cons!17394) lt!396573) (= (_1!5808 (h!18525 lt!396573)) (_1!5808 (tuple2!11595 k0!854 v!557)))))))

(assert (=> d!108589 (= (getValueByKey!417 lt!396573 (_1!5808 (tuple2!11595 k0!854 v!557))) e!488204)))

(declare-fun b!877050 () Bool)

(assert (=> b!877050 (= e!488205 None!421)))

(declare-fun b!877048 () Bool)

(assert (=> b!877048 (= e!488204 e!488205)))

(declare-fun c!92691 () Bool)

(assert (=> b!877048 (= c!92691 (and ((_ is Cons!17394) lt!396573) (not (= (_1!5808 (h!18525 lt!396573)) (_1!5808 (tuple2!11595 k0!854 v!557))))))))

(assert (= (and d!108589 c!92690) b!877047))

(assert (= (and d!108589 (not c!92690)) b!877048))

(assert (= (and b!877048 c!92691) b!877049))

(assert (= (and b!877048 (not c!92691)) b!877050))

(declare-fun m!816641 () Bool)

(assert (=> b!877049 m!816641))

(assert (=> d!108439 d!108589))

(declare-fun d!108591 () Bool)

(assert (=> d!108591 (= (getValueByKey!417 lt!396573 (_1!5808 (tuple2!11595 k0!854 v!557))) (Some!422 (_2!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun lt!396750 () Unit!29927)

(assert (=> d!108591 (= lt!396750 (choose!1441 lt!396573 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun e!488206 () Bool)

(assert (=> d!108591 e!488206))

(declare-fun res!595868 () Bool)

(assert (=> d!108591 (=> (not res!595868) (not e!488206))))

(assert (=> d!108591 (= res!595868 (isStrictlySorted!457 lt!396573))))

(assert (=> d!108591 (= (lemmaContainsTupThenGetReturnValue!234 lt!396573 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))) lt!396750)))

(declare-fun b!877051 () Bool)

(declare-fun res!595869 () Bool)

(assert (=> b!877051 (=> (not res!595869) (not e!488206))))

(assert (=> b!877051 (= res!595869 (containsKey!401 lt!396573 (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun b!877052 () Bool)

(assert (=> b!877052 (= e!488206 (contains!4223 lt!396573 (tuple2!11595 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557)))))))

(assert (= (and d!108591 res!595868) b!877051))

(assert (= (and b!877051 res!595869) b!877052))

(assert (=> d!108591 m!816065))

(declare-fun m!816643 () Bool)

(assert (=> d!108591 m!816643))

(declare-fun m!816645 () Bool)

(assert (=> d!108591 m!816645))

(declare-fun m!816647 () Bool)

(assert (=> b!877051 m!816647))

(declare-fun m!816649 () Bool)

(assert (=> b!877052 m!816649))

(assert (=> d!108439 d!108591))

(declare-fun b!877053 () Bool)

(declare-fun e!488210 () List!17398)

(declare-fun call!38825 () List!17398)

(assert (=> b!877053 (= e!488210 call!38825)))

(declare-fun b!877054 () Bool)

(declare-fun e!488207 () List!17398)

(assert (=> b!877054 (= e!488207 e!488210)))

(declare-fun c!92692 () Bool)

(assert (=> b!877054 (= c!92692 (and ((_ is Cons!17394) (toList!5192 lt!396455)) (= (_1!5808 (h!18525 (toList!5192 lt!396455))) (_1!5808 (tuple2!11595 k0!854 v!557)))))))

(declare-fun b!877055 () Bool)

(declare-fun call!38826 () List!17398)

(assert (=> b!877055 (= e!488207 call!38826)))

(declare-fun b!877056 () Bool)

(declare-fun e!488208 () List!17398)

(declare-fun call!38824 () List!17398)

(assert (=> b!877056 (= e!488208 call!38824)))

(declare-fun bm!38821 () Bool)

(assert (=> bm!38821 (= call!38825 call!38826)))

(declare-fun d!108593 () Bool)

(declare-fun e!488209 () Bool)

(assert (=> d!108593 e!488209))

(declare-fun res!595871 () Bool)

(assert (=> d!108593 (=> (not res!595871) (not e!488209))))

(declare-fun lt!396751 () List!17398)

(assert (=> d!108593 (= res!595871 (isStrictlySorted!457 lt!396751))))

(assert (=> d!108593 (= lt!396751 e!488207)))

(declare-fun c!92693 () Bool)

(assert (=> d!108593 (= c!92693 (and ((_ is Cons!17394) (toList!5192 lt!396455)) (bvslt (_1!5808 (h!18525 (toList!5192 lt!396455))) (_1!5808 (tuple2!11595 k0!854 v!557)))))))

(assert (=> d!108593 (isStrictlySorted!457 (toList!5192 lt!396455))))

(assert (=> d!108593 (= (insertStrictlySorted!273 (toList!5192 lt!396455) (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))) lt!396751)))

(declare-fun bm!38822 () Bool)

(assert (=> bm!38822 (= call!38824 call!38825)))

(declare-fun b!877057 () Bool)

(declare-fun e!488211 () List!17398)

(declare-fun c!92695 () Bool)

(assert (=> b!877057 (= e!488211 (ite c!92692 (t!24474 (toList!5192 lt!396455)) (ite c!92695 (Cons!17394 (h!18525 (toList!5192 lt!396455)) (t!24474 (toList!5192 lt!396455))) Nil!17395)))))

(declare-fun bm!38823 () Bool)

(assert (=> bm!38823 (= call!38826 ($colon$colon!537 e!488211 (ite c!92693 (h!18525 (toList!5192 lt!396455)) (tuple2!11595 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))))

(declare-fun c!92694 () Bool)

(assert (=> bm!38823 (= c!92694 c!92693)))

(declare-fun b!877058 () Bool)

(assert (=> b!877058 (= e!488209 (contains!4223 lt!396751 (tuple2!11595 (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557)))))))

(declare-fun b!877059 () Bool)

(assert (=> b!877059 (= e!488211 (insertStrictlySorted!273 (t!24474 (toList!5192 lt!396455)) (_1!5808 (tuple2!11595 k0!854 v!557)) (_2!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun b!877060 () Bool)

(assert (=> b!877060 (= c!92695 (and ((_ is Cons!17394) (toList!5192 lt!396455)) (bvsgt (_1!5808 (h!18525 (toList!5192 lt!396455))) (_1!5808 (tuple2!11595 k0!854 v!557)))))))

(assert (=> b!877060 (= e!488210 e!488208)))

(declare-fun b!877061 () Bool)

(declare-fun res!595870 () Bool)

(assert (=> b!877061 (=> (not res!595870) (not e!488209))))

(assert (=> b!877061 (= res!595870 (containsKey!401 lt!396751 (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun b!877062 () Bool)

(assert (=> b!877062 (= e!488208 call!38824)))

(assert (= (and d!108593 c!92693) b!877055))

(assert (= (and d!108593 (not c!92693)) b!877054))

(assert (= (and b!877054 c!92692) b!877053))

(assert (= (and b!877054 (not c!92692)) b!877060))

(assert (= (and b!877060 c!92695) b!877062))

(assert (= (and b!877060 (not c!92695)) b!877056))

(assert (= (or b!877062 b!877056) bm!38822))

(assert (= (or b!877053 bm!38822) bm!38821))

(assert (= (or b!877055 bm!38821) bm!38823))

(assert (= (and bm!38823 c!92694) b!877059))

(assert (= (and bm!38823 (not c!92694)) b!877057))

(assert (= (and d!108593 res!595871) b!877061))

(assert (= (and b!877061 res!595870) b!877058))

(declare-fun m!816651 () Bool)

(assert (=> d!108593 m!816651))

(declare-fun m!816653 () Bool)

(assert (=> d!108593 m!816653))

(declare-fun m!816655 () Bool)

(assert (=> b!877058 m!816655))

(declare-fun m!816657 () Bool)

(assert (=> b!877061 m!816657))

(declare-fun m!816659 () Bool)

(assert (=> bm!38823 m!816659))

(declare-fun m!816661 () Bool)

(assert (=> b!877059 m!816661))

(assert (=> d!108439 d!108593))

(declare-fun d!108595 () Bool)

(declare-fun e!488213 () Bool)

(assert (=> d!108595 e!488213))

(declare-fun res!595872 () Bool)

(assert (=> d!108595 (=> res!595872 e!488213)))

(declare-fun lt!396753 () Bool)

(assert (=> d!108595 (= res!595872 (not lt!396753))))

(declare-fun lt!396755 () Bool)

(assert (=> d!108595 (= lt!396753 lt!396755)))

(declare-fun lt!396754 () Unit!29927)

(declare-fun e!488212 () Unit!29927)

(assert (=> d!108595 (= lt!396754 e!488212)))

(declare-fun c!92696 () Bool)

(assert (=> d!108595 (= c!92696 lt!396755)))

(assert (=> d!108595 (= lt!396755 (containsKey!401 (toList!5192 lt!396602) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108595 (= (contains!4222 lt!396602 #b0000000000000000000000000000000000000000000000000000000000000000) lt!396753)))

(declare-fun b!877063 () Bool)

(declare-fun lt!396752 () Unit!29927)

(assert (=> b!877063 (= e!488212 lt!396752)))

(assert (=> b!877063 (= lt!396752 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396602) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877063 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396602) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!877064 () Bool)

(declare-fun Unit!29947 () Unit!29927)

(assert (=> b!877064 (= e!488212 Unit!29947)))

(declare-fun b!877065 () Bool)

(assert (=> b!877065 (= e!488213 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396602) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108595 c!92696) b!877063))

(assert (= (and d!108595 (not c!92696)) b!877064))

(assert (= (and d!108595 (not res!595872)) b!877065))

(declare-fun m!816663 () Bool)

(assert (=> d!108595 m!816663))

(declare-fun m!816665 () Bool)

(assert (=> b!877063 m!816665))

(declare-fun m!816667 () Bool)

(assert (=> b!877063 m!816667))

(assert (=> b!877063 m!816667))

(declare-fun m!816669 () Bool)

(assert (=> b!877063 m!816669))

(assert (=> b!877065 m!816667))

(assert (=> b!877065 m!816667))

(assert (=> b!877065 m!816669))

(assert (=> d!108463 d!108595))

(assert (=> d!108463 d!108427))

(assert (=> b!876678 d!108469))

(assert (=> b!876646 d!108501))

(declare-fun d!108597 () Bool)

(assert (=> d!108597 (= (isEmpty!668 lt!396595) (isEmpty!669 (toList!5192 lt!396595)))))

(declare-fun bs!24590 () Bool)

(assert (= bs!24590 d!108597))

(declare-fun m!816671 () Bool)

(assert (=> bs!24590 m!816671))

(assert (=> b!876748 d!108597))

(declare-fun d!108599 () Bool)

(assert (=> d!108599 (= (get!12902 (select (arr!24506 _values!688) from!1053) lt!396452) lt!396452)))

(assert (=> b!876701 d!108599))

(assert (=> b!876762 d!108453))

(assert (=> b!876752 d!108489))

(declare-fun d!108601 () Bool)

(declare-fun e!488215 () Bool)

(assert (=> d!108601 e!488215))

(declare-fun res!595873 () Bool)

(assert (=> d!108601 (=> res!595873 e!488215)))

(declare-fun lt!396757 () Bool)

(assert (=> d!108601 (= res!595873 (not lt!396757))))

(declare-fun lt!396759 () Bool)

(assert (=> d!108601 (= lt!396757 lt!396759)))

(declare-fun lt!396758 () Unit!29927)

(declare-fun e!488214 () Unit!29927)

(assert (=> d!108601 (= lt!396758 e!488214)))

(declare-fun c!92697 () Bool)

(assert (=> d!108601 (= c!92697 lt!396759)))

(assert (=> d!108601 (= lt!396759 (containsKey!401 (toList!5192 lt!396550) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108601 (= (contains!4222 lt!396550 #b0000000000000000000000000000000000000000000000000000000000000000) lt!396757)))

(declare-fun b!877066 () Bool)

(declare-fun lt!396756 () Unit!29927)

(assert (=> b!877066 (= e!488214 lt!396756)))

(assert (=> b!877066 (= lt!396756 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396550) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877066 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396550) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!877067 () Bool)

(declare-fun Unit!29948 () Unit!29927)

(assert (=> b!877067 (= e!488214 Unit!29948)))

(declare-fun b!877068 () Bool)

(assert (=> b!877068 (= e!488215 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396550) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108601 c!92697) b!877066))

(assert (= (and d!108601 (not c!92697)) b!877067))

(assert (= (and d!108601 (not res!595873)) b!877068))

(declare-fun m!816673 () Bool)

(assert (=> d!108601 m!816673))

(declare-fun m!816675 () Bool)

(assert (=> b!877066 m!816675))

(declare-fun m!816677 () Bool)

(assert (=> b!877066 m!816677))

(assert (=> b!877066 m!816677))

(declare-fun m!816679 () Bool)

(assert (=> b!877066 m!816679))

(assert (=> b!877068 m!816677))

(assert (=> b!877068 m!816677))

(assert (=> b!877068 m!816679))

(assert (=> d!108429 d!108601))

(assert (=> d!108429 d!108427))

(declare-fun d!108603 () Bool)

(declare-fun e!488216 () Bool)

(assert (=> d!108603 e!488216))

(declare-fun res!595874 () Bool)

(assert (=> d!108603 (=> (not res!595874) (not e!488216))))

(declare-fun lt!396762 () ListLongMap!10353)

(assert (=> d!108603 (= res!595874 (contains!4222 lt!396762 (_1!5808 (tuple2!11595 lt!396606 lt!396603))))))

(declare-fun lt!396763 () List!17398)

(assert (=> d!108603 (= lt!396762 (ListLongMap!10354 lt!396763))))

(declare-fun lt!396760 () Unit!29927)

(declare-fun lt!396761 () Unit!29927)

(assert (=> d!108603 (= lt!396760 lt!396761)))

(assert (=> d!108603 (= (getValueByKey!417 lt!396763 (_1!5808 (tuple2!11595 lt!396606 lt!396603))) (Some!422 (_2!5808 (tuple2!11595 lt!396606 lt!396603))))))

(assert (=> d!108603 (= lt!396761 (lemmaContainsTupThenGetReturnValue!234 lt!396763 (_1!5808 (tuple2!11595 lt!396606 lt!396603)) (_2!5808 (tuple2!11595 lt!396606 lt!396603))))))

(assert (=> d!108603 (= lt!396763 (insertStrictlySorted!273 (toList!5192 lt!396604) (_1!5808 (tuple2!11595 lt!396606 lt!396603)) (_2!5808 (tuple2!11595 lt!396606 lt!396603))))))

(assert (=> d!108603 (= (+!2517 lt!396604 (tuple2!11595 lt!396606 lt!396603)) lt!396762)))

(declare-fun b!877069 () Bool)

(declare-fun res!595875 () Bool)

(assert (=> b!877069 (=> (not res!595875) (not e!488216))))

(assert (=> b!877069 (= res!595875 (= (getValueByKey!417 (toList!5192 lt!396762) (_1!5808 (tuple2!11595 lt!396606 lt!396603))) (Some!422 (_2!5808 (tuple2!11595 lt!396606 lt!396603)))))))

(declare-fun b!877070 () Bool)

(assert (=> b!877070 (= e!488216 (contains!4223 (toList!5192 lt!396762) (tuple2!11595 lt!396606 lt!396603)))))

(assert (= (and d!108603 res!595874) b!877069))

(assert (= (and b!877069 res!595875) b!877070))

(declare-fun m!816681 () Bool)

(assert (=> d!108603 m!816681))

(declare-fun m!816683 () Bool)

(assert (=> d!108603 m!816683))

(declare-fun m!816685 () Bool)

(assert (=> d!108603 m!816685))

(declare-fun m!816687 () Bool)

(assert (=> d!108603 m!816687))

(declare-fun m!816689 () Bool)

(assert (=> b!877069 m!816689))

(declare-fun m!816691 () Bool)

(assert (=> b!877070 m!816691))

(assert (=> b!876758 d!108603))

(declare-fun d!108605 () Bool)

(declare-fun e!488218 () Bool)

(assert (=> d!108605 e!488218))

(declare-fun res!595876 () Bool)

(assert (=> d!108605 (=> res!595876 e!488218)))

(declare-fun lt!396765 () Bool)

(assert (=> d!108605 (= res!595876 (not lt!396765))))

(declare-fun lt!396767 () Bool)

(assert (=> d!108605 (= lt!396765 lt!396767)))

(declare-fun lt!396766 () Unit!29927)

(declare-fun e!488217 () Unit!29927)

(assert (=> d!108605 (= lt!396766 e!488217)))

(declare-fun c!92698 () Bool)

(assert (=> d!108605 (= c!92698 lt!396767)))

(assert (=> d!108605 (= lt!396767 (containsKey!401 (toList!5192 (+!2517 lt!396604 (tuple2!11595 lt!396606 lt!396603))) lt!396600))))

(assert (=> d!108605 (= (contains!4222 (+!2517 lt!396604 (tuple2!11595 lt!396606 lt!396603)) lt!396600) lt!396765)))

(declare-fun b!877071 () Bool)

(declare-fun lt!396764 () Unit!29927)

(assert (=> b!877071 (= e!488217 lt!396764)))

(assert (=> b!877071 (= lt!396764 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 (+!2517 lt!396604 (tuple2!11595 lt!396606 lt!396603))) lt!396600))))

(assert (=> b!877071 (isDefined!312 (getValueByKey!417 (toList!5192 (+!2517 lt!396604 (tuple2!11595 lt!396606 lt!396603))) lt!396600))))

(declare-fun b!877072 () Bool)

(declare-fun Unit!29949 () Unit!29927)

(assert (=> b!877072 (= e!488217 Unit!29949)))

(declare-fun b!877073 () Bool)

(assert (=> b!877073 (= e!488218 (isDefined!312 (getValueByKey!417 (toList!5192 (+!2517 lt!396604 (tuple2!11595 lt!396606 lt!396603))) lt!396600)))))

(assert (= (and d!108605 c!92698) b!877071))

(assert (= (and d!108605 (not c!92698)) b!877072))

(assert (= (and d!108605 (not res!595876)) b!877073))

(declare-fun m!816693 () Bool)

(assert (=> d!108605 m!816693))

(declare-fun m!816695 () Bool)

(assert (=> b!877071 m!816695))

(declare-fun m!816697 () Bool)

(assert (=> b!877071 m!816697))

(assert (=> b!877071 m!816697))

(declare-fun m!816699 () Bool)

(assert (=> b!877071 m!816699))

(assert (=> b!877073 m!816697))

(assert (=> b!877073 m!816697))

(assert (=> b!877073 m!816699))

(assert (=> b!876758 d!108605))

(declare-fun d!108607 () Bool)

(declare-fun e!488219 () Bool)

(assert (=> d!108607 e!488219))

(declare-fun res!595877 () Bool)

(assert (=> d!108607 (=> (not res!595877) (not e!488219))))

(declare-fun lt!396770 () ListLongMap!10353)

(assert (=> d!108607 (= res!595877 (contains!4222 lt!396770 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!396771 () List!17398)

(assert (=> d!108607 (= lt!396770 (ListLongMap!10354 lt!396771))))

(declare-fun lt!396768 () Unit!29927)

(declare-fun lt!396769 () Unit!29927)

(assert (=> d!108607 (= lt!396768 lt!396769)))

(assert (=> d!108607 (= (getValueByKey!417 lt!396771 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108607 (= lt!396769 (lemmaContainsTupThenGetReturnValue!234 lt!396771 (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108607 (= lt!396771 (insertStrictlySorted!273 (toList!5192 call!38791) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108607 (= (+!2517 call!38791 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!396770)))

(declare-fun b!877074 () Bool)

(declare-fun res!595878 () Bool)

(assert (=> b!877074 (=> (not res!595878) (not e!488219))))

(assert (=> b!877074 (= res!595878 (= (getValueByKey!417 (toList!5192 lt!396770) (_1!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!422 (_2!5808 (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!877075 () Bool)

(assert (=> b!877075 (= e!488219 (contains!4223 (toList!5192 lt!396770) (tuple2!11595 (select (arr!24505 _keys!868) from!1053) (get!12898 (select (arr!24506 _values!688) from!1053) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108607 res!595877) b!877074))

(assert (= (and b!877074 res!595878) b!877075))

(declare-fun m!816701 () Bool)

(assert (=> d!108607 m!816701))

(declare-fun m!816703 () Bool)

(assert (=> d!108607 m!816703))

(declare-fun m!816705 () Bool)

(assert (=> d!108607 m!816705))

(declare-fun m!816707 () Bool)

(assert (=> d!108607 m!816707))

(declare-fun m!816709 () Bool)

(assert (=> b!877074 m!816709))

(declare-fun m!816711 () Bool)

(assert (=> b!877075 m!816711))

(assert (=> b!876758 d!108607))

(assert (=> b!876758 d!108483))

(declare-fun d!108609 () Bool)

(assert (=> d!108609 (not (contains!4222 (+!2517 lt!396604 (tuple2!11595 lt!396606 lt!396603)) lt!396600))))

(declare-fun lt!396772 () Unit!29927)

(assert (=> d!108609 (= lt!396772 (choose!1442 lt!396604 lt!396606 lt!396603 lt!396600))))

(declare-fun e!488220 () Bool)

(assert (=> d!108609 e!488220))

(declare-fun res!595879 () Bool)

(assert (=> d!108609 (=> (not res!595879) (not e!488220))))

(assert (=> d!108609 (= res!595879 (not (contains!4222 lt!396604 lt!396600)))))

(assert (=> d!108609 (= (addStillNotContains!203 lt!396604 lt!396606 lt!396603 lt!396600) lt!396772)))

(declare-fun b!877076 () Bool)

(assert (=> b!877076 (= e!488220 (not (= lt!396606 lt!396600)))))

(assert (= (and d!108609 res!595879) b!877076))

(assert (=> d!108609 m!816161))

(assert (=> d!108609 m!816161))

(assert (=> d!108609 m!816165))

(declare-fun m!816713 () Bool)

(assert (=> d!108609 m!816713))

(declare-fun m!816715 () Bool)

(assert (=> d!108609 m!816715))

(assert (=> b!876758 d!108609))

(declare-fun d!108611 () Bool)

(assert (=> d!108611 (= (isEmpty!668 lt!396602) (isEmpty!669 (toList!5192 lt!396602)))))

(declare-fun bs!24591 () Bool)

(assert (= bs!24591 d!108611))

(declare-fun m!816717 () Bool)

(assert (=> bs!24591 m!816717))

(assert (=> b!876760 d!108611))

(declare-fun d!108613 () Bool)

(declare-fun lt!396775 () Bool)

(declare-fun content!390 (List!17399) (InoxSet (_ BitVec 64)))

(assert (=> d!108613 (= lt!396775 (select (content!390 Nil!17396) (select (arr!24505 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun e!488226 () Bool)

(assert (=> d!108613 (= lt!396775 e!488226)))

(declare-fun res!595884 () Bool)

(assert (=> d!108613 (=> (not res!595884) (not e!488226))))

(assert (=> d!108613 (= res!595884 ((_ is Cons!17395) Nil!17396))))

(assert (=> d!108613 (= (contains!4224 Nil!17396 (select (arr!24505 _keys!868) #b00000000000000000000000000000000)) lt!396775)))

(declare-fun b!877081 () Bool)

(declare-fun e!488225 () Bool)

(assert (=> b!877081 (= e!488226 e!488225)))

(declare-fun res!595885 () Bool)

(assert (=> b!877081 (=> res!595885 e!488225)))

(assert (=> b!877081 (= res!595885 (= (h!18526 Nil!17396) (select (arr!24505 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!877082 () Bool)

(assert (=> b!877082 (= e!488225 (contains!4224 (t!24475 Nil!17396) (select (arr!24505 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108613 res!595884) b!877081))

(assert (= (and b!877081 (not res!595885)) b!877082))

(declare-fun m!816719 () Bool)

(assert (=> d!108613 m!816719))

(assert (=> d!108613 m!815975))

(declare-fun m!816721 () Bool)

(assert (=> d!108613 m!816721))

(assert (=> b!877082 m!815975))

(declare-fun m!816723 () Bool)

(assert (=> b!877082 m!816723))

(assert (=> b!876732 d!108613))

(declare-fun d!108615 () Bool)

(declare-fun lt!396776 () Bool)

(assert (=> d!108615 (= lt!396776 (select (content!389 (toList!5192 lt!396580)) lt!396453))))

(declare-fun e!488228 () Bool)

(assert (=> d!108615 (= lt!396776 e!488228)))

(declare-fun res!595887 () Bool)

(assert (=> d!108615 (=> (not res!595887) (not e!488228))))

(assert (=> d!108615 (= res!595887 ((_ is Cons!17394) (toList!5192 lt!396580)))))

(assert (=> d!108615 (= (contains!4223 (toList!5192 lt!396580) lt!396453) lt!396776)))

(declare-fun b!877083 () Bool)

(declare-fun e!488227 () Bool)

(assert (=> b!877083 (= e!488228 e!488227)))

(declare-fun res!595886 () Bool)

(assert (=> b!877083 (=> res!595886 e!488227)))

(assert (=> b!877083 (= res!595886 (= (h!18525 (toList!5192 lt!396580)) lt!396453))))

(declare-fun b!877084 () Bool)

(assert (=> b!877084 (= e!488227 (contains!4223 (t!24474 (toList!5192 lt!396580)) lt!396453))))

(assert (= (and d!108615 res!595887) b!877083))

(assert (= (and b!877083 (not res!595886)) b!877084))

(declare-fun m!816725 () Bool)

(assert (=> d!108615 m!816725))

(declare-fun m!816727 () Bool)

(assert (=> d!108615 m!816727))

(declare-fun m!816729 () Bool)

(assert (=> b!877084 m!816729))

(assert (=> b!876715 d!108615))

(declare-fun d!108617 () Bool)

(declare-fun e!488230 () Bool)

(assert (=> d!108617 e!488230))

(declare-fun res!595888 () Bool)

(assert (=> d!108617 (=> res!595888 e!488230)))

(declare-fun lt!396778 () Bool)

(assert (=> d!108617 (= res!595888 (not lt!396778))))

(declare-fun lt!396780 () Bool)

(assert (=> d!108617 (= lt!396778 lt!396780)))

(declare-fun lt!396779 () Unit!29927)

(declare-fun e!488229 () Unit!29927)

(assert (=> d!108617 (= lt!396779 e!488229)))

(declare-fun c!92699 () Bool)

(assert (=> d!108617 (= c!92699 lt!396780)))

(assert (=> d!108617 (= lt!396780 (containsKey!401 (toList!5192 lt!396602) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108617 (= (contains!4222 lt!396602 #b1000000000000000000000000000000000000000000000000000000000000000) lt!396778)))

(declare-fun b!877085 () Bool)

(declare-fun lt!396777 () Unit!29927)

(assert (=> b!877085 (= e!488229 lt!396777)))

(assert (=> b!877085 (= lt!396777 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396602) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877085 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396602) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!877086 () Bool)

(declare-fun Unit!29950 () Unit!29927)

(assert (=> b!877086 (= e!488229 Unit!29950)))

(declare-fun b!877087 () Bool)

(assert (=> b!877087 (= e!488230 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396602) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108617 c!92699) b!877085))

(assert (= (and d!108617 (not c!92699)) b!877086))

(assert (= (and d!108617 (not res!595888)) b!877087))

(declare-fun m!816731 () Bool)

(assert (=> d!108617 m!816731))

(declare-fun m!816733 () Bool)

(assert (=> b!877085 m!816733))

(declare-fun m!816735 () Bool)

(assert (=> b!877085 m!816735))

(assert (=> b!877085 m!816735))

(declare-fun m!816737 () Bool)

(assert (=> b!877085 m!816737))

(assert (=> b!877087 m!816735))

(assert (=> b!877087 m!816735))

(assert (=> b!877087 m!816737))

(assert (=> b!876765 d!108617))

(declare-fun d!108619 () Bool)

(declare-fun lt!396781 () Bool)

(assert (=> d!108619 (= lt!396781 (select (content!389 (toList!5192 lt!396584)) (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))

(declare-fun e!488232 () Bool)

(assert (=> d!108619 (= lt!396781 e!488232)))

(declare-fun res!595890 () Bool)

(assert (=> d!108619 (=> (not res!595890) (not e!488232))))

(assert (=> d!108619 (= res!595890 ((_ is Cons!17394) (toList!5192 lt!396584)))))

(assert (=> d!108619 (= (contains!4223 (toList!5192 lt!396584) (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)) lt!396781)))

(declare-fun b!877088 () Bool)

(declare-fun e!488231 () Bool)

(assert (=> b!877088 (= e!488232 e!488231)))

(declare-fun res!595889 () Bool)

(assert (=> b!877088 (=> res!595889 e!488231)))

(assert (=> b!877088 (= res!595889 (= (h!18525 (toList!5192 lt!396584)) (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))

(declare-fun b!877089 () Bool)

(assert (=> b!877089 (= e!488231 (contains!4223 (t!24474 (toList!5192 lt!396584)) (tuple2!11595 (select (arr!24505 _keys!868) from!1053) lt!396448)))))

(assert (= (and d!108619 res!595890) b!877088))

(assert (= (and b!877088 (not res!595889)) b!877089))

(declare-fun m!816739 () Bool)

(assert (=> d!108619 m!816739))

(declare-fun m!816741 () Bool)

(assert (=> d!108619 m!816741))

(declare-fun m!816743 () Bool)

(assert (=> b!877089 m!816743))

(assert (=> b!876717 d!108619))

(declare-fun d!108621 () Bool)

(declare-fun e!488234 () Bool)

(assert (=> d!108621 e!488234))

(declare-fun res!595891 () Bool)

(assert (=> d!108621 (=> res!595891 e!488234)))

(declare-fun lt!396783 () Bool)

(assert (=> d!108621 (= res!595891 (not lt!396783))))

(declare-fun lt!396785 () Bool)

(assert (=> d!108621 (= lt!396783 lt!396785)))

(declare-fun lt!396784 () Unit!29927)

(declare-fun e!488233 () Unit!29927)

(assert (=> d!108621 (= lt!396784 e!488233)))

(declare-fun c!92700 () Bool)

(assert (=> d!108621 (= c!92700 lt!396785)))

(assert (=> d!108621 (= lt!396785 (containsKey!401 (toList!5192 lt!396602) (select (arr!24505 _keys!868) from!1053)))))

(assert (=> d!108621 (= (contains!4222 lt!396602 (select (arr!24505 _keys!868) from!1053)) lt!396783)))

(declare-fun b!877090 () Bool)

(declare-fun lt!396782 () Unit!29927)

(assert (=> b!877090 (= e!488233 lt!396782)))

(assert (=> b!877090 (= lt!396782 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396602) (select (arr!24505 _keys!868) from!1053)))))

(assert (=> b!877090 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396602) (select (arr!24505 _keys!868) from!1053)))))

(declare-fun b!877091 () Bool)

(declare-fun Unit!29951 () Unit!29927)

(assert (=> b!877091 (= e!488233 Unit!29951)))

(declare-fun b!877092 () Bool)

(assert (=> b!877092 (= e!488234 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396602) (select (arr!24505 _keys!868) from!1053))))))

(assert (= (and d!108621 c!92700) b!877090))

(assert (= (and d!108621 (not c!92700)) b!877091))

(assert (= (and d!108621 (not res!595891)) b!877092))

(assert (=> d!108621 m!815805))

(declare-fun m!816745 () Bool)

(assert (=> d!108621 m!816745))

(assert (=> b!877090 m!815805))

(declare-fun m!816747 () Bool)

(assert (=> b!877090 m!816747))

(assert (=> b!877090 m!815805))

(assert (=> b!877090 m!816221))

(assert (=> b!877090 m!816221))

(declare-fun m!816749 () Bool)

(assert (=> b!877090 m!816749))

(assert (=> b!877092 m!815805))

(assert (=> b!877092 m!816221))

(assert (=> b!877092 m!816221))

(assert (=> b!877092 m!816749))

(assert (=> b!876767 d!108621))

(assert (=> bm!38788 d!108523))

(declare-fun d!108623 () Bool)

(assert (=> d!108623 (= (apply!377 lt!396550 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12903 (getValueByKey!417 (toList!5192 lt!396550) (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))))

(declare-fun bs!24592 () Bool)

(assert (= bs!24592 d!108623))

(assert (=> bs!24592 m!815989))

(declare-fun m!816751 () Bool)

(assert (=> bs!24592 m!816751))

(assert (=> bs!24592 m!816751))

(declare-fun m!816753 () Bool)

(assert (=> bs!24592 m!816753))

(assert (=> b!876687 d!108623))

(assert (=> b!876687 d!108509))

(declare-fun d!108625 () Bool)

(declare-fun lt!396786 () Bool)

(assert (=> d!108625 (= lt!396786 (select (content!389 (toList!5192 lt!396572)) (tuple2!11595 k0!854 v!557)))))

(declare-fun e!488236 () Bool)

(assert (=> d!108625 (= lt!396786 e!488236)))

(declare-fun res!595893 () Bool)

(assert (=> d!108625 (=> (not res!595893) (not e!488236))))

(assert (=> d!108625 (= res!595893 ((_ is Cons!17394) (toList!5192 lt!396572)))))

(assert (=> d!108625 (= (contains!4223 (toList!5192 lt!396572) (tuple2!11595 k0!854 v!557)) lt!396786)))

(declare-fun b!877093 () Bool)

(declare-fun e!488235 () Bool)

(assert (=> b!877093 (= e!488236 e!488235)))

(declare-fun res!595892 () Bool)

(assert (=> b!877093 (=> res!595892 e!488235)))

(assert (=> b!877093 (= res!595892 (= (h!18525 (toList!5192 lt!396572)) (tuple2!11595 k0!854 v!557)))))

(declare-fun b!877094 () Bool)

(assert (=> b!877094 (= e!488235 (contains!4223 (t!24474 (toList!5192 lt!396572)) (tuple2!11595 k0!854 v!557)))))

(assert (= (and d!108625 res!595893) b!877093))

(assert (= (and b!877093 (not res!595892)) b!877094))

(declare-fun m!816755 () Bool)

(assert (=> d!108625 m!816755))

(declare-fun m!816757 () Bool)

(assert (=> d!108625 m!816757))

(declare-fun m!816759 () Bool)

(assert (=> b!877094 m!816759))

(assert (=> b!876711 d!108625))

(declare-fun b!877095 () Bool)

(declare-fun e!488237 () Option!423)

(assert (=> b!877095 (= e!488237 (Some!422 (_2!5808 (h!18525 (toList!5192 lt!396565)))))))

(declare-fun e!488238 () Option!423)

(declare-fun b!877097 () Bool)

(assert (=> b!877097 (= e!488238 (getValueByKey!417 (t!24474 (toList!5192 lt!396565)) (_1!5808 (tuple2!11595 k0!854 lt!396456))))))

(declare-fun d!108627 () Bool)

(declare-fun c!92701 () Bool)

(assert (=> d!108627 (= c!92701 (and ((_ is Cons!17394) (toList!5192 lt!396565)) (= (_1!5808 (h!18525 (toList!5192 lt!396565))) (_1!5808 (tuple2!11595 k0!854 lt!396456)))))))

(assert (=> d!108627 (= (getValueByKey!417 (toList!5192 lt!396565) (_1!5808 (tuple2!11595 k0!854 lt!396456))) e!488237)))

(declare-fun b!877098 () Bool)

(assert (=> b!877098 (= e!488238 None!421)))

(declare-fun b!877096 () Bool)

(assert (=> b!877096 (= e!488237 e!488238)))

(declare-fun c!92702 () Bool)

(assert (=> b!877096 (= c!92702 (and ((_ is Cons!17394) (toList!5192 lt!396565)) (not (= (_1!5808 (h!18525 (toList!5192 lt!396565))) (_1!5808 (tuple2!11595 k0!854 lt!396456))))))))

(assert (= (and d!108627 c!92701) b!877095))

(assert (= (and d!108627 (not c!92701)) b!877096))

(assert (= (and b!877096 c!92702) b!877097))

(assert (= (and b!877096 (not c!92702)) b!877098))

(declare-fun m!816761 () Bool)

(assert (=> b!877097 m!816761))

(assert (=> b!876708 d!108627))

(declare-fun d!108629 () Bool)

(declare-fun lt!396787 () Bool)

(assert (=> d!108629 (= lt!396787 (select (content!389 (toList!5192 lt!396576)) lt!396453))))

(declare-fun e!488240 () Bool)

(assert (=> d!108629 (= lt!396787 e!488240)))

(declare-fun res!595895 () Bool)

(assert (=> d!108629 (=> (not res!595895) (not e!488240))))

(assert (=> d!108629 (= res!595895 ((_ is Cons!17394) (toList!5192 lt!396576)))))

(assert (=> d!108629 (= (contains!4223 (toList!5192 lt!396576) lt!396453) lt!396787)))

(declare-fun b!877099 () Bool)

(declare-fun e!488239 () Bool)

(assert (=> b!877099 (= e!488240 e!488239)))

(declare-fun res!595894 () Bool)

(assert (=> b!877099 (=> res!595894 e!488239)))

(assert (=> b!877099 (= res!595894 (= (h!18525 (toList!5192 lt!396576)) lt!396453))))

(declare-fun b!877100 () Bool)

(assert (=> b!877100 (= e!488239 (contains!4223 (t!24474 (toList!5192 lt!396576)) lt!396453))))

(assert (= (and d!108629 res!595895) b!877099))

(assert (= (and b!877099 (not res!595894)) b!877100))

(declare-fun m!816763 () Bool)

(assert (=> d!108629 m!816763))

(declare-fun m!816765 () Bool)

(assert (=> d!108629 m!816765))

(declare-fun m!816767 () Bool)

(assert (=> b!877100 m!816767))

(assert (=> b!876713 d!108629))

(declare-fun d!108631 () Bool)

(declare-fun e!488242 () Bool)

(assert (=> d!108631 e!488242))

(declare-fun res!595896 () Bool)

(assert (=> d!108631 (=> res!595896 e!488242)))

(declare-fun lt!396789 () Bool)

(assert (=> d!108631 (= res!595896 (not lt!396789))))

(declare-fun lt!396791 () Bool)

(assert (=> d!108631 (= lt!396789 lt!396791)))

(declare-fun lt!396790 () Unit!29927)

(declare-fun e!488241 () Unit!29927)

(assert (=> d!108631 (= lt!396790 e!488241)))

(declare-fun c!92703 () Bool)

(assert (=> d!108631 (= c!92703 lt!396791)))

(assert (=> d!108631 (= lt!396791 (containsKey!401 (toList!5192 lt!396550) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108631 (= (contains!4222 lt!396550 #b1000000000000000000000000000000000000000000000000000000000000000) lt!396789)))

(declare-fun b!877101 () Bool)

(declare-fun lt!396788 () Unit!29927)

(assert (=> b!877101 (= e!488241 lt!396788)))

(assert (=> b!877101 (= lt!396788 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396550) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877101 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396550) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!877102 () Bool)

(declare-fun Unit!29952 () Unit!29927)

(assert (=> b!877102 (= e!488241 Unit!29952)))

(declare-fun b!877103 () Bool)

(assert (=> b!877103 (= e!488242 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108631 c!92703) b!877101))

(assert (= (and d!108631 (not c!92703)) b!877102))

(assert (= (and d!108631 (not res!595896)) b!877103))

(declare-fun m!816769 () Bool)

(assert (=> d!108631 m!816769))

(declare-fun m!816771 () Bool)

(assert (=> b!877101 m!816771))

(declare-fun m!816773 () Bool)

(assert (=> b!877101 m!816773))

(assert (=> b!877101 m!816773))

(declare-fun m!816775 () Bool)

(assert (=> b!877101 m!816775))

(assert (=> b!877103 m!816773))

(assert (=> b!877103 m!816773))

(assert (=> b!877103 m!816775))

(assert (=> b!876693 d!108631))

(declare-fun d!108633 () Bool)

(assert (=> d!108633 (= (apply!377 lt!396543 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12903 (getValueByKey!417 (toList!5192 lt!396543) (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))))

(declare-fun bs!24593 () Bool)

(assert (= bs!24593 d!108633))

(assert (=> bs!24593 m!815989))

(assert (=> bs!24593 m!816233))

(assert (=> bs!24593 m!816233))

(declare-fun m!816777 () Bool)

(assert (=> bs!24593 m!816777))

(assert (=> b!876675 d!108633))

(assert (=> b!876675 d!108549))

(declare-fun b!877104 () Bool)

(declare-fun e!488245 () Bool)

(declare-fun call!38827 () Bool)

(assert (=> b!877104 (= e!488245 call!38827)))

(declare-fun b!877105 () Bool)

(declare-fun e!488244 () Bool)

(assert (=> b!877105 (= e!488244 call!38827)))

(declare-fun bm!38824 () Bool)

(assert (=> bm!38824 (= call!38827 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!108635 () Bool)

(declare-fun res!595897 () Bool)

(declare-fun e!488243 () Bool)

(assert (=> d!108635 (=> res!595897 e!488243)))

(assert (=> d!108635 (= res!595897 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(assert (=> d!108635 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196) e!488243)))

(declare-fun b!877106 () Bool)

(assert (=> b!877106 (= e!488243 e!488244)))

(declare-fun c!92704 () Bool)

(assert (=> b!877106 (= c!92704 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!877107 () Bool)

(assert (=> b!877107 (= e!488244 e!488245)))

(declare-fun lt!396794 () (_ BitVec 64))

(assert (=> b!877107 (= lt!396794 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!396792 () Unit!29927)

(assert (=> b!877107 (= lt!396792 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!396794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!877107 (arrayContainsKey!0 _keys!868 lt!396794 #b00000000000000000000000000000000)))

(declare-fun lt!396793 () Unit!29927)

(assert (=> b!877107 (= lt!396793 lt!396792)))

(declare-fun res!595898 () Bool)

(assert (=> b!877107 (= res!595898 (= (seekEntryOrOpen!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!868 mask!1196) (Found!8749 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!877107 (=> (not res!595898) (not e!488245))))

(assert (= (and d!108635 (not res!595897)) b!877106))

(assert (= (and b!877106 c!92704) b!877107))

(assert (= (and b!877106 (not c!92704)) b!877105))

(assert (= (and b!877107 res!595898) b!877104))

(assert (= (or b!877104 b!877105) bm!38824))

(declare-fun m!816779 () Bool)

(assert (=> bm!38824 m!816779))

(assert (=> b!877106 m!816461))

(assert (=> b!877106 m!816461))

(assert (=> b!877106 m!816463))

(assert (=> b!877107 m!816461))

(declare-fun m!816781 () Bool)

(assert (=> b!877107 m!816781))

(declare-fun m!816783 () Bool)

(assert (=> b!877107 m!816783))

(assert (=> b!877107 m!816461))

(declare-fun m!816785 () Bool)

(assert (=> b!877107 m!816785))

(assert (=> bm!38773 d!108635))

(assert (=> bm!38777 d!108529))

(declare-fun b!877108 () Bool)

(declare-fun e!488246 () Option!423)

(assert (=> b!877108 (= e!488246 (Some!422 (_2!5808 (h!18525 (toList!5192 lt!396588)))))))

(declare-fun e!488247 () Option!423)

(declare-fun b!877110 () Bool)

(assert (=> b!877110 (= e!488247 (getValueByKey!417 (t!24474 (toList!5192 lt!396588)) (_1!5808 (tuple2!11595 k0!854 v!557))))))

(declare-fun c!92705 () Bool)

(declare-fun d!108637 () Bool)

(assert (=> d!108637 (= c!92705 (and ((_ is Cons!17394) (toList!5192 lt!396588)) (= (_1!5808 (h!18525 (toList!5192 lt!396588))) (_1!5808 (tuple2!11595 k0!854 v!557)))))))

(assert (=> d!108637 (= (getValueByKey!417 (toList!5192 lt!396588) (_1!5808 (tuple2!11595 k0!854 v!557))) e!488246)))

(declare-fun b!877111 () Bool)

(assert (=> b!877111 (= e!488247 None!421)))

(declare-fun b!877109 () Bool)

(assert (=> b!877109 (= e!488246 e!488247)))

(declare-fun c!92706 () Bool)

(assert (=> b!877109 (= c!92706 (and ((_ is Cons!17394) (toList!5192 lt!396588)) (not (= (_1!5808 (h!18525 (toList!5192 lt!396588))) (_1!5808 (tuple2!11595 k0!854 v!557))))))))

(assert (= (and d!108637 c!92705) b!877108))

(assert (= (and d!108637 (not c!92705)) b!877109))

(assert (= (and b!877109 c!92706) b!877110))

(assert (= (and b!877109 (not c!92706)) b!877111))

(declare-fun m!816787 () Bool)

(assert (=> b!877110 m!816787))

(assert (=> b!876718 d!108637))

(declare-fun d!108639 () Bool)

(declare-fun e!488249 () Bool)

(assert (=> d!108639 e!488249))

(declare-fun res!595899 () Bool)

(assert (=> d!108639 (=> res!595899 e!488249)))

(declare-fun lt!396796 () Bool)

(assert (=> d!108639 (= res!595899 (not lt!396796))))

(declare-fun lt!396798 () Bool)

(assert (=> d!108639 (= lt!396796 lt!396798)))

(declare-fun lt!396797 () Unit!29927)

(declare-fun e!488248 () Unit!29927)

(assert (=> d!108639 (= lt!396797 e!488248)))

(declare-fun c!92707 () Bool)

(assert (=> d!108639 (= c!92707 lt!396798)))

(assert (=> d!108639 (= lt!396798 (containsKey!401 (toList!5192 lt!396595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108639 (= (contains!4222 lt!396595 #b0000000000000000000000000000000000000000000000000000000000000000) lt!396796)))

(declare-fun b!877112 () Bool)

(declare-fun lt!396795 () Unit!29927)

(assert (=> b!877112 (= e!488248 lt!396795)))

(assert (=> b!877112 (= lt!396795 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877112 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396595) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!877113 () Bool)

(declare-fun Unit!29953 () Unit!29927)

(assert (=> b!877113 (= e!488248 Unit!29953)))

(declare-fun b!877114 () Bool)

(assert (=> b!877114 (= e!488249 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396595) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108639 c!92707) b!877112))

(assert (= (and d!108639 (not c!92707)) b!877113))

(assert (= (and d!108639 (not res!595899)) b!877114))

(declare-fun m!816789 () Bool)

(assert (=> d!108639 m!816789))

(declare-fun m!816791 () Bool)

(assert (=> b!877112 m!816791))

(declare-fun m!816793 () Bool)

(assert (=> b!877112 m!816793))

(assert (=> b!877112 m!816793))

(declare-fun m!816795 () Bool)

(assert (=> b!877112 m!816795))

(assert (=> b!877114 m!816793))

(assert (=> b!877114 m!816793))

(assert (=> b!877114 m!816795))

(assert (=> d!108461 d!108639))

(assert (=> d!108461 d!108427))

(assert (=> b!876690 d!108469))

(declare-fun b!877115 () Bool)

(declare-fun e!488253 () ListLongMap!10353)

(declare-fun e!488250 () ListLongMap!10353)

(assert (=> b!877115 (= e!488253 e!488250)))

(declare-fun c!92708 () Bool)

(assert (=> b!877115 (= c!92708 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!877116 () Bool)

(declare-fun e!488256 () Bool)

(declare-fun e!488252 () Bool)

(assert (=> b!877116 (= e!488256 e!488252)))

(declare-fun c!92710 () Bool)

(declare-fun e!488255 () Bool)

(assert (=> b!877116 (= c!92710 e!488255)))

(declare-fun res!595900 () Bool)

(assert (=> b!877116 (=> (not res!595900) (not e!488255))))

(assert (=> b!877116 (= res!595900 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(declare-fun b!877117 () Bool)

(declare-fun lt!396804 () Unit!29927)

(declare-fun lt!396800 () Unit!29927)

(assert (=> b!877117 (= lt!396804 lt!396800)))

(declare-fun lt!396803 () ListLongMap!10353)

(declare-fun lt!396802 () V!28281)

(declare-fun lt!396799 () (_ BitVec 64))

(declare-fun lt!396805 () (_ BitVec 64))

(assert (=> b!877117 (not (contains!4222 (+!2517 lt!396803 (tuple2!11595 lt!396805 lt!396802)) lt!396799))))

(assert (=> b!877117 (= lt!396800 (addStillNotContains!203 lt!396803 lt!396805 lt!396802 lt!396799))))

(assert (=> b!877117 (= lt!396799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!877117 (= lt!396802 (get!12898 (select (arr!24506 (array!50958 (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24948 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!877117 (= lt!396805 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38828 () ListLongMap!10353)

(assert (=> b!877117 (= lt!396803 call!38828)))

(assert (=> b!877117 (= e!488250 (+!2517 call!38828 (tuple2!11595 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12898 (select (arr!24506 (array!50958 (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24948 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!877118 () Bool)

(assert (=> b!877118 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(assert (=> b!877118 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24948 (array!50958 (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24948 _values!688)))))))

(declare-fun e!488251 () Bool)

(declare-fun lt!396801 () ListLongMap!10353)

(assert (=> b!877118 (= e!488251 (= (apply!377 lt!396801 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12898 (select (arr!24506 (array!50958 (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24948 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1219 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!877119 () Bool)

(declare-fun e!488254 () Bool)

(assert (=> b!877119 (= e!488254 (isEmpty!668 lt!396801))))

(declare-fun b!877120 () Bool)

(assert (=> b!877120 (= e!488250 call!38828)))

(declare-fun b!877121 () Bool)

(assert (=> b!877121 (= e!488255 (validKeyInArray!0 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!877121 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun bm!38825 () Bool)

(assert (=> bm!38825 (= call!38828 (getCurrentListMapNoExtraKeys!3185 _keys!868 (array!50958 (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24948 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!877123 () Bool)

(assert (=> b!877123 (= e!488254 (= lt!396801 (getCurrentListMapNoExtraKeys!3185 _keys!868 (array!50958 (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24948 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!877124 () Bool)

(declare-fun res!595901 () Bool)

(assert (=> b!877124 (=> (not res!595901) (not e!488256))))

(assert (=> b!877124 (= res!595901 (not (contains!4222 lt!396801 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877125 () Bool)

(assert (=> b!877125 (= e!488252 e!488254)))

(declare-fun c!92709 () Bool)

(assert (=> b!877125 (= c!92709 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(declare-fun b!877126 () Bool)

(assert (=> b!877126 (= e!488252 e!488251)))

(assert (=> b!877126 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(declare-fun res!595902 () Bool)

(assert (=> b!877126 (= res!595902 (contains!4222 lt!396801 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!877126 (=> (not res!595902) (not e!488251))))

(declare-fun d!108641 () Bool)

(assert (=> d!108641 e!488256))

(declare-fun res!595903 () Bool)

(assert (=> d!108641 (=> (not res!595903) (not e!488256))))

(assert (=> d!108641 (= res!595903 (not (contains!4222 lt!396801 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108641 (= lt!396801 e!488253)))

(declare-fun c!92711 () Bool)

(assert (=> d!108641 (= c!92711 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24947 _keys!868)))))

(assert (=> d!108641 (validMask!0 mask!1196)))

(assert (=> d!108641 (= (getCurrentListMapNoExtraKeys!3185 _keys!868 (array!50958 (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24948 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396801)))

(declare-fun b!877122 () Bool)

(assert (=> b!877122 (= e!488253 (ListLongMap!10354 Nil!17395))))

(assert (= (and d!108641 c!92711) b!877122))

(assert (= (and d!108641 (not c!92711)) b!877115))

(assert (= (and b!877115 c!92708) b!877117))

(assert (= (and b!877115 (not c!92708)) b!877120))

(assert (= (or b!877117 b!877120) bm!38825))

(assert (= (and d!108641 res!595903) b!877124))

(assert (= (and b!877124 res!595901) b!877116))

(assert (= (and b!877116 res!595900) b!877121))

(assert (= (and b!877116 c!92710) b!877126))

(assert (= (and b!877116 (not c!92710)) b!877125))

(assert (= (and b!877126 res!595902) b!877118))

(assert (= (and b!877125 c!92709) b!877123))

(assert (= (and b!877125 (not c!92709)) b!877119))

(declare-fun b_lambda!12287 () Bool)

(assert (=> (not b_lambda!12287) (not b!877117)))

(assert (=> b!877117 t!24473))

(declare-fun b_and!25033 () Bool)

(assert (= b_and!25031 (and (=> t!24473 result!9493) b_and!25033)))

(declare-fun b_lambda!12289 () Bool)

(assert (=> (not b_lambda!12289) (not b!877118)))

(assert (=> b!877118 t!24473))

(declare-fun b_and!25035 () Bool)

(assert (= b_and!25033 (and (=> t!24473 result!9493) b_and!25035)))

(assert (=> b!877118 m!815839))

(declare-fun m!816797 () Bool)

(assert (=> b!877118 m!816797))

(assert (=> b!877118 m!815839))

(declare-fun m!816799 () Bool)

(assert (=> b!877118 m!816799))

(assert (=> b!877118 m!815989))

(assert (=> b!877118 m!815989))

(declare-fun m!816801 () Bool)

(assert (=> b!877118 m!816801))

(assert (=> b!877118 m!816797))

(assert (=> b!877117 m!815839))

(declare-fun m!816803 () Bool)

(assert (=> b!877117 m!816803))

(assert (=> b!877117 m!816797))

(assert (=> b!877117 m!815839))

(assert (=> b!877117 m!816799))

(assert (=> b!877117 m!815989))

(declare-fun m!816805 () Bool)

(assert (=> b!877117 m!816805))

(assert (=> b!877117 m!816803))

(declare-fun m!816807 () Bool)

(assert (=> b!877117 m!816807))

(declare-fun m!816809 () Bool)

(assert (=> b!877117 m!816809))

(assert (=> b!877117 m!816797))

(declare-fun m!816811 () Bool)

(assert (=> bm!38825 m!816811))

(assert (=> b!877115 m!815989))

(assert (=> b!877115 m!815989))

(assert (=> b!877115 m!816003))

(assert (=> b!877126 m!815989))

(assert (=> b!877126 m!815989))

(declare-fun m!816813 () Bool)

(assert (=> b!877126 m!816813))

(declare-fun m!816815 () Bool)

(assert (=> d!108641 m!816815))

(assert (=> d!108641 m!815817))

(assert (=> b!877121 m!815989))

(assert (=> b!877121 m!815989))

(assert (=> b!877121 m!816003))

(declare-fun m!816817 () Bool)

(assert (=> b!877119 m!816817))

(assert (=> b!877123 m!816811))

(declare-fun m!816819 () Bool)

(assert (=> b!877124 m!816819))

(assert (=> bm!38786 d!108641))

(declare-fun d!108643 () Bool)

(assert (=> d!108643 (= (get!12901 (select (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053) lt!396452) (v!11187 (select (store (arr!24506 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053)))))

(assert (=> b!876702 d!108643))

(assert (=> b!876680 d!108585))

(assert (=> b!876756 d!108453))

(declare-fun d!108645 () Bool)

(declare-fun e!488257 () Bool)

(assert (=> d!108645 e!488257))

(declare-fun res!595904 () Bool)

(assert (=> d!108645 (=> (not res!595904) (not e!488257))))

(declare-fun lt!396808 () ListLongMap!10353)

(assert (=> d!108645 (= res!595904 (contains!4222 lt!396808 (_1!5808 (tuple2!11595 k0!854 lt!396448))))))

(declare-fun lt!396809 () List!17398)

(assert (=> d!108645 (= lt!396808 (ListLongMap!10354 lt!396809))))

(declare-fun lt!396806 () Unit!29927)

(declare-fun lt!396807 () Unit!29927)

(assert (=> d!108645 (= lt!396806 lt!396807)))

(assert (=> d!108645 (= (getValueByKey!417 lt!396809 (_1!5808 (tuple2!11595 k0!854 lt!396448))) (Some!422 (_2!5808 (tuple2!11595 k0!854 lt!396448))))))

(assert (=> d!108645 (= lt!396807 (lemmaContainsTupThenGetReturnValue!234 lt!396809 (_1!5808 (tuple2!11595 k0!854 lt!396448)) (_2!5808 (tuple2!11595 k0!854 lt!396448))))))

(assert (=> d!108645 (= lt!396809 (insertStrictlySorted!273 (toList!5192 lt!396450) (_1!5808 (tuple2!11595 k0!854 lt!396448)) (_2!5808 (tuple2!11595 k0!854 lt!396448))))))

(assert (=> d!108645 (= (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396448)) lt!396808)))

(declare-fun b!877127 () Bool)

(declare-fun res!595905 () Bool)

(assert (=> b!877127 (=> (not res!595905) (not e!488257))))

(assert (=> b!877127 (= res!595905 (= (getValueByKey!417 (toList!5192 lt!396808) (_1!5808 (tuple2!11595 k0!854 lt!396448))) (Some!422 (_2!5808 (tuple2!11595 k0!854 lt!396448)))))))

(declare-fun b!877128 () Bool)

(assert (=> b!877128 (= e!488257 (contains!4223 (toList!5192 lt!396808) (tuple2!11595 k0!854 lt!396448)))))

(assert (= (and d!108645 res!595904) b!877127))

(assert (= (and b!877127 res!595905) b!877128))

(declare-fun m!816821 () Bool)

(assert (=> d!108645 m!816821))

(declare-fun m!816823 () Bool)

(assert (=> d!108645 m!816823))

(declare-fun m!816825 () Bool)

(assert (=> d!108645 m!816825))

(declare-fun m!816827 () Bool)

(assert (=> d!108645 m!816827))

(declare-fun m!816829 () Bool)

(assert (=> b!877127 m!816829))

(declare-fun m!816831 () Bool)

(assert (=> b!877128 m!816831))

(assert (=> d!108437 d!108645))

(declare-fun d!108647 () Bool)

(declare-fun e!488258 () Bool)

(assert (=> d!108647 e!488258))

(declare-fun res!595906 () Bool)

(assert (=> d!108647 (=> (not res!595906) (not e!488258))))

(declare-fun lt!396812 () ListLongMap!10353)

(assert (=> d!108647 (= res!595906 (contains!4222 lt!396812 (_1!5808 (tuple2!11595 k0!854 lt!396448))))))

(declare-fun lt!396813 () List!17398)

(assert (=> d!108647 (= lt!396812 (ListLongMap!10354 lt!396813))))

(declare-fun lt!396810 () Unit!29927)

(declare-fun lt!396811 () Unit!29927)

(assert (=> d!108647 (= lt!396810 lt!396811)))

(assert (=> d!108647 (= (getValueByKey!417 lt!396813 (_1!5808 (tuple2!11595 k0!854 lt!396448))) (Some!422 (_2!5808 (tuple2!11595 k0!854 lt!396448))))))

(assert (=> d!108647 (= lt!396811 (lemmaContainsTupThenGetReturnValue!234 lt!396813 (_1!5808 (tuple2!11595 k0!854 lt!396448)) (_2!5808 (tuple2!11595 k0!854 lt!396448))))))

(assert (=> d!108647 (= lt!396813 (insertStrictlySorted!273 (toList!5192 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456))) (_1!5808 (tuple2!11595 k0!854 lt!396448)) (_2!5808 (tuple2!11595 k0!854 lt!396448))))))

(assert (=> d!108647 (= (+!2517 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456)) (tuple2!11595 k0!854 lt!396448)) lt!396812)))

(declare-fun b!877129 () Bool)

(declare-fun res!595907 () Bool)

(assert (=> b!877129 (=> (not res!595907) (not e!488258))))

(assert (=> b!877129 (= res!595907 (= (getValueByKey!417 (toList!5192 lt!396812) (_1!5808 (tuple2!11595 k0!854 lt!396448))) (Some!422 (_2!5808 (tuple2!11595 k0!854 lt!396448)))))))

(declare-fun b!877130 () Bool)

(assert (=> b!877130 (= e!488258 (contains!4223 (toList!5192 lt!396812) (tuple2!11595 k0!854 lt!396448)))))

(assert (= (and d!108647 res!595906) b!877129))

(assert (= (and b!877129 res!595907) b!877130))

(declare-fun m!816833 () Bool)

(assert (=> d!108647 m!816833))

(declare-fun m!816835 () Bool)

(assert (=> d!108647 m!816835))

(declare-fun m!816837 () Bool)

(assert (=> d!108647 m!816837))

(declare-fun m!816839 () Bool)

(assert (=> d!108647 m!816839))

(declare-fun m!816841 () Bool)

(assert (=> b!877129 m!816841))

(declare-fun m!816843 () Bool)

(assert (=> b!877130 m!816843))

(assert (=> d!108437 d!108647))

(assert (=> d!108437 d!108435))

(declare-fun d!108649 () Bool)

(assert (=> d!108649 (= (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396448)) (+!2517 (+!2517 lt!396450 (tuple2!11595 k0!854 lt!396456)) (tuple2!11595 k0!854 lt!396448)))))

(assert (=> d!108649 true))

(declare-fun _$24!45 () Unit!29927)

(assert (=> d!108649 (= (choose!1439 lt!396450 k0!854 lt!396456 lt!396448) _$24!45)))

(declare-fun bs!24594 () Bool)

(assert (= bs!24594 d!108649))

(assert (=> bs!24594 m!816057))

(assert (=> bs!24594 m!815833))

(assert (=> bs!24594 m!815833))

(assert (=> bs!24594 m!816059))

(assert (=> d!108437 d!108649))

(declare-fun d!108651 () Bool)

(assert (=> d!108651 (arrayContainsKey!0 _keys!868 lt!396526 #b00000000000000000000000000000000)))

(declare-fun lt!396816 () Unit!29927)

(declare-fun choose!13 (array!50955 (_ BitVec 64) (_ BitVec 32)) Unit!29927)

(assert (=> d!108651 (= lt!396816 (choose!13 _keys!868 lt!396526 #b00000000000000000000000000000000))))

(assert (=> d!108651 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!108651 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!396526 #b00000000000000000000000000000000) lt!396816)))

(declare-fun bs!24595 () Bool)

(assert (= bs!24595 d!108651))

(assert (=> bs!24595 m!815981))

(declare-fun m!816845 () Bool)

(assert (=> bs!24595 m!816845))

(assert (=> b!876647 d!108651))

(declare-fun d!108653 () Bool)

(declare-fun res!595912 () Bool)

(declare-fun e!488263 () Bool)

(assert (=> d!108653 (=> res!595912 e!488263)))

(assert (=> d!108653 (= res!595912 (= (select (arr!24505 _keys!868) #b00000000000000000000000000000000) lt!396526))))

(assert (=> d!108653 (= (arrayContainsKey!0 _keys!868 lt!396526 #b00000000000000000000000000000000) e!488263)))

(declare-fun b!877135 () Bool)

(declare-fun e!488264 () Bool)

(assert (=> b!877135 (= e!488263 e!488264)))

(declare-fun res!595913 () Bool)

(assert (=> b!877135 (=> (not res!595913) (not e!488264))))

(assert (=> b!877135 (= res!595913 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!24947 _keys!868)))))

(declare-fun b!877136 () Bool)

(assert (=> b!877136 (= e!488264 (arrayContainsKey!0 _keys!868 lt!396526 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!108653 (not res!595912)) b!877135))

(assert (= (and b!877135 res!595913) b!877136))

(assert (=> d!108653 m!815975))

(declare-fun m!816847 () Bool)

(assert (=> b!877136 m!816847))

(assert (=> b!876647 d!108653))

(declare-fun d!108655 () Bool)

(declare-fun lt!396824 () SeekEntryResult!8749)

(assert (=> d!108655 (and (or ((_ is Undefined!8749) lt!396824) (not ((_ is Found!8749) lt!396824)) (and (bvsge (index!37368 lt!396824) #b00000000000000000000000000000000) (bvslt (index!37368 lt!396824) (size!24947 _keys!868)))) (or ((_ is Undefined!8749) lt!396824) ((_ is Found!8749) lt!396824) (not ((_ is MissingZero!8749) lt!396824)) (and (bvsge (index!37367 lt!396824) #b00000000000000000000000000000000) (bvslt (index!37367 lt!396824) (size!24947 _keys!868)))) (or ((_ is Undefined!8749) lt!396824) ((_ is Found!8749) lt!396824) ((_ is MissingZero!8749) lt!396824) (not ((_ is MissingVacant!8749) lt!396824)) (and (bvsge (index!37370 lt!396824) #b00000000000000000000000000000000) (bvslt (index!37370 lt!396824) (size!24947 _keys!868)))) (or ((_ is Undefined!8749) lt!396824) (ite ((_ is Found!8749) lt!396824) (= (select (arr!24505 _keys!868) (index!37368 lt!396824)) (select (arr!24505 _keys!868) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8749) lt!396824) (= (select (arr!24505 _keys!868) (index!37367 lt!396824)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8749) lt!396824) (= (select (arr!24505 _keys!868) (index!37370 lt!396824)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!488272 () SeekEntryResult!8749)

(assert (=> d!108655 (= lt!396824 e!488272)))

(declare-fun c!92718 () Bool)

(declare-fun lt!396823 () SeekEntryResult!8749)

(assert (=> d!108655 (= c!92718 (and ((_ is Intermediate!8749) lt!396823) (undefined!9561 lt!396823)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!50955 (_ BitVec 32)) SeekEntryResult!8749)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!108655 (= lt!396823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!24505 _keys!868) #b00000000000000000000000000000000) mask!1196) (select (arr!24505 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196))))

(assert (=> d!108655 (validMask!0 mask!1196)))

(assert (=> d!108655 (= (seekEntryOrOpen!0 (select (arr!24505 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) lt!396824)))

(declare-fun b!877149 () Bool)

(declare-fun e!488273 () SeekEntryResult!8749)

(assert (=> b!877149 (= e!488273 (MissingZero!8749 (index!37369 lt!396823)))))

(declare-fun b!877150 () Bool)

(declare-fun e!488271 () SeekEntryResult!8749)

(assert (=> b!877150 (= e!488271 (Found!8749 (index!37369 lt!396823)))))

(declare-fun b!877151 () Bool)

(declare-fun c!92719 () Bool)

(declare-fun lt!396825 () (_ BitVec 64))

(assert (=> b!877151 (= c!92719 (= lt!396825 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877151 (= e!488271 e!488273)))

(declare-fun b!877152 () Bool)

(assert (=> b!877152 (= e!488272 e!488271)))

(assert (=> b!877152 (= lt!396825 (select (arr!24505 _keys!868) (index!37369 lt!396823)))))

(declare-fun c!92720 () Bool)

(assert (=> b!877152 (= c!92720 (= lt!396825 (select (arr!24505 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!877153 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!50955 (_ BitVec 32)) SeekEntryResult!8749)

(assert (=> b!877153 (= e!488273 (seekKeyOrZeroReturnVacant!0 (x!74297 lt!396823) (index!37369 lt!396823) (index!37369 lt!396823) (select (arr!24505 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196))))

(declare-fun b!877154 () Bool)

(assert (=> b!877154 (= e!488272 Undefined!8749)))

(assert (= (and d!108655 c!92718) b!877154))

(assert (= (and d!108655 (not c!92718)) b!877152))

(assert (= (and b!877152 c!92720) b!877150))

(assert (= (and b!877152 (not c!92720)) b!877151))

(assert (= (and b!877151 c!92719) b!877149))

(assert (= (and b!877151 (not c!92719)) b!877153))

(declare-fun m!816849 () Bool)

(assert (=> d!108655 m!816849))

(assert (=> d!108655 m!815975))

(declare-fun m!816851 () Bool)

(assert (=> d!108655 m!816851))

(declare-fun m!816853 () Bool)

(assert (=> d!108655 m!816853))

(assert (=> d!108655 m!815817))

(declare-fun m!816855 () Bool)

(assert (=> d!108655 m!816855))

(declare-fun m!816857 () Bool)

(assert (=> d!108655 m!816857))

(assert (=> d!108655 m!815975))

(assert (=> d!108655 m!816849))

(declare-fun m!816859 () Bool)

(assert (=> b!877152 m!816859))

(assert (=> b!877153 m!815975))

(declare-fun m!816861 () Bool)

(assert (=> b!877153 m!816861))

(assert (=> b!876647 d!108655))

(declare-fun d!108657 () Bool)

(assert (=> d!108657 (= (apply!377 lt!396595 (select (arr!24505 _keys!868) from!1053)) (get!12903 (getValueByKey!417 (toList!5192 lt!396595) (select (arr!24505 _keys!868) from!1053))))))

(declare-fun bs!24596 () Bool)

(assert (= bs!24596 d!108657))

(assert (=> bs!24596 m!815805))

(assert (=> bs!24596 m!816217))

(assert (=> bs!24596 m!816217))

(declare-fun m!816863 () Bool)

(assert (=> bs!24596 m!816863))

(assert (=> b!876747 d!108657))

(assert (=> b!876747 d!108537))

(declare-fun d!108659 () Bool)

(declare-fun e!488275 () Bool)

(assert (=> d!108659 e!488275))

(declare-fun res!595914 () Bool)

(assert (=> d!108659 (=> res!595914 e!488275)))

(declare-fun lt!396827 () Bool)

(assert (=> d!108659 (= res!595914 (not lt!396827))))

(declare-fun lt!396829 () Bool)

(assert (=> d!108659 (= lt!396827 lt!396829)))

(declare-fun lt!396828 () Unit!29927)

(declare-fun e!488274 () Unit!29927)

(assert (=> d!108659 (= lt!396828 e!488274)))

(declare-fun c!92721 () Bool)

(assert (=> d!108659 (= c!92721 lt!396829)))

(assert (=> d!108659 (= lt!396829 (containsKey!401 (toList!5192 lt!396550) (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> d!108659 (= (contains!4222 lt!396550 (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) lt!396827)))

(declare-fun b!877155 () Bool)

(declare-fun lt!396826 () Unit!29927)

(assert (=> b!877155 (= e!488274 lt!396826)))

(assert (=> b!877155 (= lt!396826 (lemmaContainsKeyImpliesGetValueByKeyDefined!311 (toList!5192 lt!396550) (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!877155 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396550) (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!877156 () Bool)

(declare-fun Unit!29954 () Unit!29927)

(assert (=> b!877156 (= e!488274 Unit!29954)))

(declare-fun b!877157 () Bool)

(assert (=> b!877157 (= e!488275 (isDefined!312 (getValueByKey!417 (toList!5192 lt!396550) (select (arr!24505 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))))

(assert (= (and d!108659 c!92721) b!877155))

(assert (= (and d!108659 (not c!92721)) b!877156))

(assert (= (and d!108659 (not res!595914)) b!877157))

(assert (=> d!108659 m!815989))

(declare-fun m!816865 () Bool)

(assert (=> d!108659 m!816865))

(assert (=> b!877155 m!815989))

(declare-fun m!816867 () Bool)

(assert (=> b!877155 m!816867))

(assert (=> b!877155 m!815989))

(assert (=> b!877155 m!816751))

(assert (=> b!877155 m!816751))

(declare-fun m!816869 () Bool)

(assert (=> b!877155 m!816869))

(assert (=> b!877157 m!815989))

(assert (=> b!877157 m!816751))

(assert (=> b!877157 m!816751))

(assert (=> b!877157 m!816869))

(assert (=> b!876695 d!108659))

(declare-fun mapNonEmpty!27759 () Bool)

(declare-fun mapRes!27759 () Bool)

(declare-fun tp!53238 () Bool)

(declare-fun e!488276 () Bool)

(assert (=> mapNonEmpty!27759 (= mapRes!27759 (and tp!53238 e!488276))))

(declare-fun mapKey!27759 () (_ BitVec 32))

(declare-fun mapRest!27759 () (Array (_ BitVec 32) ValueCell!8273))

(declare-fun mapValue!27759 () ValueCell!8273)

(assert (=> mapNonEmpty!27759 (= mapRest!27758 (store mapRest!27759 mapKey!27759 mapValue!27759))))

(declare-fun mapIsEmpty!27759 () Bool)

(assert (=> mapIsEmpty!27759 mapRes!27759))

(declare-fun condMapEmpty!27759 () Bool)

(declare-fun mapDefault!27759 () ValueCell!8273)

(assert (=> mapNonEmpty!27758 (= condMapEmpty!27759 (= mapRest!27758 ((as const (Array (_ BitVec 32) ValueCell!8273)) mapDefault!27759)))))

(declare-fun e!488277 () Bool)

(assert (=> mapNonEmpty!27758 (= tp!53237 (and e!488277 mapRes!27759))))

(declare-fun b!877158 () Bool)

(assert (=> b!877158 (= e!488276 tp_is_empty!17425)))

(declare-fun b!877159 () Bool)

(assert (=> b!877159 (= e!488277 tp_is_empty!17425)))

(assert (= (and mapNonEmpty!27758 condMapEmpty!27759) mapIsEmpty!27759))

(assert (= (and mapNonEmpty!27758 (not condMapEmpty!27759)) mapNonEmpty!27759))

(assert (= (and mapNonEmpty!27759 ((_ is ValueCellFull!8273) mapValue!27759)) b!877158))

(assert (= (and mapNonEmpty!27758 ((_ is ValueCellFull!8273) mapDefault!27759)) b!877159))

(declare-fun m!816871 () Bool)

(assert (=> mapNonEmpty!27759 m!816871))

(declare-fun b_lambda!12291 () Bool)

(assert (= b_lambda!12271 (or (and start!74420 b_free!15181) b_lambda!12291)))

(declare-fun b_lambda!12293 () Bool)

(assert (= b_lambda!12285 (or (and start!74420 b_free!15181) b_lambda!12293)))

(declare-fun b_lambda!12295 () Bool)

(assert (= b_lambda!12279 (or (and start!74420 b_free!15181) b_lambda!12295)))

(declare-fun b_lambda!12297 () Bool)

(assert (= b_lambda!12275 (or (and start!74420 b_free!15181) b_lambda!12297)))

(declare-fun b_lambda!12299 () Bool)

(assert (= b_lambda!12281 (or (and start!74420 b_free!15181) b_lambda!12299)))

(declare-fun b_lambda!12301 () Bool)

(assert (= b_lambda!12273 (or (and start!74420 b_free!15181) b_lambda!12301)))

(declare-fun b_lambda!12303 () Bool)

(assert (= b_lambda!12289 (or (and start!74420 b_free!15181) b_lambda!12303)))

(declare-fun b_lambda!12305 () Bool)

(assert (= b_lambda!12283 (or (and start!74420 b_free!15181) b_lambda!12305)))

(declare-fun b_lambda!12307 () Bool)

(assert (= b_lambda!12287 (or (and start!74420 b_free!15181) b_lambda!12307)))

(declare-fun b_lambda!12309 () Bool)

(assert (= b_lambda!12277 (or (and start!74420 b_free!15181) b_lambda!12309)))

(check-sat (not b!876942) (not d!108629) (not b!876950) (not b!877038) (not b!877021) (not d!108513) (not d!108503) (not b!876916) (not d!108639) (not b_lambda!12255) (not b!876847) (not b_lambda!12265) (not b!877041) (not b_lambda!12293) (not b!876874) (not b!876865) (not d!108487) (not b!877040) (not mapNonEmpty!27759) (not bm!38807) (not b_lambda!12291) (not b!876948) (not b!876941) (not b!876966) (not bm!38820) (not b!877035) (not b!876922) (not b!877018) (not b!876965) (not b!876862) (not b!877011) (not b_lambda!12309) (not d!108517) (not d!108625) (not b!877126) (not b!876979) (not b!877052) (not d!108477) (not b!877090) (not d!108649) (not b!876812) (not d!108491) (not d!108657) (not b!876919) (not b!877069) (not d!108647) (not bm!38809) (not d!108553) (not d!108615) (not d!108471) (not d!108605) (not b!877027) (not d!108481) (not b!876963) (not d!108527) (not d!108621) (not d!108525) (not b!876946) (not b!877008) (not d!108479) (not d!108499) (not b!876843) (not b!877103) (not b_lambda!12257) (not d!108497) (not b_lambda!12297) (not d!108567) (not b_lambda!12267) (not d!108545) (not b!877085) (not b!876841) (not b!877028) (not d!108617) (not b!876999) (not b!877128) (not b_lambda!12259) (not b!876895) (not d!108641) (not b!876980) (not b!877032) (not b!877114) (not d!108597) (not b!876929) (not bm!38819) (not b!877074) (not b!876780) (not bm!38810) (not b!876890) (not b!877094) (not b!876930) (not b!877100) (not b!876918) (not b!877046) (not b!876961) (not d!108573) (not d!108569) (not b!876811) (not b_lambda!12263) (not b!877107) (not b!877013) (not b!877043) (not b!876993) (not b_lambda!12305) (not d!108515) (not b_lambda!12301) (not b!877082) (not b!877059) (not d!108493) (not d!108529) (not b!877153) (not b!876964) (not b!876959) (not b!877124) (not d!108651) (not bm!38816) (not d!108533) (not b!877030) (not b!876933) (not b!876863) (not b!877119) (not d!108611) (not b!876939) (not b!876893) (not b_lambda!12261) (not b!876850) (not b!876924) (not b!876891) tp_is_empty!17425 (not d!108595) (not b!877130) (not b!877123) (not b!877036) (not b!877115) (not b!876802) (not b!877087) (not b!877009) (not d!108655) (not b!876805) (not b!877127) (not d!108619) (not b!876845) (not bm!38803) (not b!877063) (not b!876986) (not b!877121) (not d!108539) (not b!877065) (not b!877136) (not b!877089) (not b!876848) (not b!876920) (not d!108607) (not d!108631) (not b!876969) (not d!108507) (not b!877020) (not d!108591) (not b!876945) (not b!877101) (not b!876881) (not b!877157) (not b!877044) (not b!876974) (not b!876851) (not b!877106) (not b!877058) (not b!876954) (not b_lambda!12303) (not d!108557) (not b!876860) (not bm!38825) (not b!876989) (not bm!38794) (not b!877001) (not b!876994) (not b!876800) (not b!876951) (not bm!38813) (not b!876914) (not d!108489) (not b_next!15181) (not d!108601) (not b!876873) (not b!876883) (not b!876880) (not b!877097) (not b!876897) (not b!876927) (not bm!38824) (not b!876838) (not b!876854) (not b!876910) (not b!876938) (not bm!38808) (not bm!38823) (not b!876846) (not b!876894) (not d!108581) (not b!876977) (not b!876839) (not d!108609) (not b!877071) (not b!876953) (not d!108547) (not d!108559) (not b!876936) (not b!877002) b_and!25035 (not d!108577) (not b!876967) (not d!108551) (not b!876907) (not b!877155) (not b!876971) (not d!108511) (not b!877049) (not d!108575) (not b_lambda!12299) (not d!108531) (not d!108563) (not b!877066) (not d!108523) (not b!876944) (not bm!38804) (not b!876868) (not b!877129) (not b!876987) (not d!108555) (not d!108565) (not b!876934) (not d!108593) (not b!877117) (not d!108475) (not b!876887) (not b!877051) (not d!108659) (not b!876928) (not b!877084) (not b!877092) (not b!876855) (not b!876955) (not b!876857) (not b!876925) (not d!108633) (not b!877118) (not d!108613) (not b_lambda!12237) (not b!876957) (not b!876991) (not d!108603) (not b!877110) (not b!876859) (not b!877073) (not b!876892) (not b!877068) (not b!876866) (not bm!38793) (not d!108535) (not b!877075) (not d!108623) (not b_lambda!12307) (not b!876889) (not b!876996) (not d!108587) (not b!876949) (not d!108645) (not b!876853) (not b!877070) (not b_lambda!12269) (not d!108585) (not d!108583) (not b!876962) (not b!876972) (not b_lambda!12295) (not b!877112) (not b!877034) (not b!877061) (not b!876932) (not b!876792) (not b!877015) (not b!876871))
(check-sat b_and!25035 (not b_next!15181))
