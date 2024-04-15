; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74614 () Bool)

(assert start!74614)

(declare-fun b_free!15301 () Bool)

(declare-fun b_next!15301 () Bool)

(assert (=> start!74614 (= b_free!15301 (not b_next!15301))))

(declare-fun tp!53589 () Bool)

(declare-fun b_and!25179 () Bool)

(assert (=> start!74614 (= tp!53589 b_and!25179)))

(declare-fun b!879308 () Bool)

(declare-fun e!489329 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51197 0))(
  ( (array!51198 (arr!24624 (Array (_ BitVec 32) (_ BitVec 64))) (size!25066 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51197)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!879308 (= e!489329 (or (not (= (select (arr!24624 _keys!868) from!1053) k0!854)) (bvslt (size!25066 _keys!868) #b01111111111111111111111111111111)))))

(declare-datatypes ((V!28441 0))(
  ( (V!28442 (val!8820 Int)) )
))
(declare-datatypes ((tuple2!11682 0))(
  ( (tuple2!11683 (_1!5852 (_ BitVec 64)) (_2!5852 V!28441)) )
))
(declare-datatypes ((List!17482 0))(
  ( (Nil!17479) (Cons!17478 (h!18609 tuple2!11682) (t!24576 List!17482)) )
))
(declare-datatypes ((ListLongMap!10441 0))(
  ( (ListLongMap!10442 (toList!5236 List!17482)) )
))
(declare-fun lt!397421 () ListLongMap!10441)

(declare-fun lt!397420 () ListLongMap!10441)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8333 0))(
  ( (ValueCellFull!8333 (v!11258 V!28441)) (EmptyCell!8333) )
))
(declare-datatypes ((array!51199 0))(
  ( (array!51200 (arr!24625 (Array (_ BitVec 32) ValueCell!8333)) (size!25067 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51199)

(declare-fun +!2532 (ListLongMap!10441 tuple2!11682) ListLongMap!10441)

(declare-fun get!12951 (ValueCell!8333 V!28441) V!28441)

(declare-fun dynLambda!1227 (Int (_ BitVec 64)) V!28441)

(assert (=> b!879308 (= lt!397420 (+!2532 lt!397421 (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!27936 () Bool)

(declare-fun mapRes!27936 () Bool)

(assert (=> mapIsEmpty!27936 mapRes!27936))

(declare-fun b!879309 () Bool)

(declare-fun e!489334 () Bool)

(assert (=> b!879309 (= e!489334 (not e!489329))))

(declare-fun res!597455 () Bool)

(assert (=> b!879309 (=> res!597455 e!489329)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879309 (= res!597455 (not (validKeyInArray!0 (select (arr!24624 _keys!868) from!1053))))))

(declare-fun lt!397422 () ListLongMap!10441)

(assert (=> b!879309 (= lt!397422 lt!397421)))

(declare-fun v!557 () V!28441)

(declare-fun lt!397423 () ListLongMap!10441)

(assert (=> b!879309 (= lt!397421 (+!2532 lt!397423 (tuple2!11683 k0!854 v!557)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!397418 () array!51199)

(declare-fun minValue!654 () V!28441)

(declare-fun zeroValue!654 () V!28441)

(declare-fun getCurrentListMapNoExtraKeys!3228 (array!51197 array!51199 (_ BitVec 32) (_ BitVec 32) V!28441 V!28441 (_ BitVec 32) Int) ListLongMap!10441)

(assert (=> b!879309 (= lt!397422 (getCurrentListMapNoExtraKeys!3228 _keys!868 lt!397418 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!879309 (= lt!397423 (getCurrentListMapNoExtraKeys!3228 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29977 0))(
  ( (Unit!29978) )
))
(declare-fun lt!397424 () Unit!29977)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!700 (array!51197 array!51199 (_ BitVec 32) (_ BitVec 32) V!28441 V!28441 (_ BitVec 32) (_ BitVec 64) V!28441 (_ BitVec 32) Int) Unit!29977)

(assert (=> b!879309 (= lt!397424 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!700 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879310 () Bool)

(declare-fun res!597457 () Bool)

(declare-fun e!489331 () Bool)

(assert (=> b!879310 (=> (not res!597457) (not e!489331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51197 (_ BitVec 32)) Bool)

(assert (=> b!879310 (= res!597457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!597454 () Bool)

(assert (=> start!74614 (=> (not res!597454) (not e!489331))))

(assert (=> start!74614 (= res!597454 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25066 _keys!868))))))

(assert (=> start!74614 e!489331))

(declare-fun tp_is_empty!17545 () Bool)

(assert (=> start!74614 tp_is_empty!17545))

(assert (=> start!74614 true))

(assert (=> start!74614 tp!53589))

(declare-fun array_inv!19448 (array!51197) Bool)

(assert (=> start!74614 (array_inv!19448 _keys!868)))

(declare-fun e!489330 () Bool)

(declare-fun array_inv!19449 (array!51199) Bool)

(assert (=> start!74614 (and (array_inv!19449 _values!688) e!489330)))

(declare-fun b!879311 () Bool)

(declare-fun res!597453 () Bool)

(assert (=> b!879311 (=> (not res!597453) (not e!489331))))

(assert (=> b!879311 (= res!597453 (and (= (select (arr!24624 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879312 () Bool)

(declare-fun res!597461 () Bool)

(assert (=> b!879312 (=> (not res!597461) (not e!489331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879312 (= res!597461 (validMask!0 mask!1196))))

(declare-fun b!879313 () Bool)

(declare-fun res!597456 () Bool)

(assert (=> b!879313 (=> (not res!597456) (not e!489331))))

(declare-datatypes ((List!17483 0))(
  ( (Nil!17480) (Cons!17479 (h!18610 (_ BitVec 64)) (t!24577 List!17483)) )
))
(declare-fun arrayNoDuplicates!0 (array!51197 (_ BitVec 32) List!17483) Bool)

(assert (=> b!879313 (= res!597456 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17480))))

(declare-fun b!879314 () Bool)

(declare-fun e!489333 () Bool)

(assert (=> b!879314 (= e!489333 tp_is_empty!17545)))

(declare-fun b!879315 () Bool)

(declare-fun res!597460 () Bool)

(assert (=> b!879315 (=> (not res!597460) (not e!489331))))

(assert (=> b!879315 (= res!597460 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25066 _keys!868))))))

(declare-fun b!879316 () Bool)

(assert (=> b!879316 (= e!489330 (and e!489333 mapRes!27936))))

(declare-fun condMapEmpty!27936 () Bool)

(declare-fun mapDefault!27936 () ValueCell!8333)

(assert (=> b!879316 (= condMapEmpty!27936 (= (arr!24625 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8333)) mapDefault!27936)))))

(declare-fun b!879317 () Bool)

(declare-fun e!489328 () Bool)

(assert (=> b!879317 (= e!489328 tp_is_empty!17545)))

(declare-fun b!879318 () Bool)

(declare-fun res!597458 () Bool)

(assert (=> b!879318 (=> (not res!597458) (not e!489331))))

(assert (=> b!879318 (= res!597458 (validKeyInArray!0 k0!854))))

(declare-fun b!879319 () Bool)

(declare-fun res!597459 () Bool)

(assert (=> b!879319 (=> (not res!597459) (not e!489331))))

(assert (=> b!879319 (= res!597459 (and (= (size!25067 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25066 _keys!868) (size!25067 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879320 () Bool)

(assert (=> b!879320 (= e!489331 e!489334)))

(declare-fun res!597452 () Bool)

(assert (=> b!879320 (=> (not res!597452) (not e!489334))))

(assert (=> b!879320 (= res!597452 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!879320 (= lt!397420 (getCurrentListMapNoExtraKeys!3228 _keys!868 lt!397418 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!879320 (= lt!397418 (array!51200 (store (arr!24625 _values!688) i!612 (ValueCellFull!8333 v!557)) (size!25067 _values!688)))))

(declare-fun lt!397419 () ListLongMap!10441)

(assert (=> b!879320 (= lt!397419 (getCurrentListMapNoExtraKeys!3228 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27936 () Bool)

(declare-fun tp!53588 () Bool)

(assert (=> mapNonEmpty!27936 (= mapRes!27936 (and tp!53588 e!489328))))

(declare-fun mapValue!27936 () ValueCell!8333)

(declare-fun mapRest!27936 () (Array (_ BitVec 32) ValueCell!8333))

(declare-fun mapKey!27936 () (_ BitVec 32))

(assert (=> mapNonEmpty!27936 (= (arr!24625 _values!688) (store mapRest!27936 mapKey!27936 mapValue!27936))))

(assert (= (and start!74614 res!597454) b!879312))

(assert (= (and b!879312 res!597461) b!879319))

(assert (= (and b!879319 res!597459) b!879310))

(assert (= (and b!879310 res!597457) b!879313))

(assert (= (and b!879313 res!597456) b!879315))

(assert (= (and b!879315 res!597460) b!879318))

(assert (= (and b!879318 res!597458) b!879311))

(assert (= (and b!879311 res!597453) b!879320))

(assert (= (and b!879320 res!597452) b!879309))

(assert (= (and b!879309 (not res!597455)) b!879308))

(assert (= (and b!879316 condMapEmpty!27936) mapIsEmpty!27936))

(assert (= (and b!879316 (not condMapEmpty!27936)) mapNonEmpty!27936))

(get-info :version)

(assert (= (and mapNonEmpty!27936 ((_ is ValueCellFull!8333) mapValue!27936)) b!879317))

(assert (= (and b!879316 ((_ is ValueCellFull!8333) mapDefault!27936)) b!879314))

(assert (= start!74614 b!879316))

(declare-fun b_lambda!12357 () Bool)

(assert (=> (not b_lambda!12357) (not b!879308)))

(declare-fun t!24575 () Bool)

(declare-fun tb!4951 () Bool)

(assert (=> (and start!74614 (= defaultEntry!696 defaultEntry!696) t!24575) tb!4951))

(declare-fun result!9533 () Bool)

(assert (=> tb!4951 (= result!9533 tp_is_empty!17545)))

(assert (=> b!879308 t!24575))

(declare-fun b_and!25181 () Bool)

(assert (= b_and!25179 (and (=> t!24575 result!9533) b_and!25181)))

(declare-fun m!818527 () Bool)

(assert (=> b!879310 m!818527))

(declare-fun m!818529 () Bool)

(assert (=> b!879309 m!818529))

(declare-fun m!818531 () Bool)

(assert (=> b!879309 m!818531))

(declare-fun m!818533 () Bool)

(assert (=> b!879309 m!818533))

(declare-fun m!818535 () Bool)

(assert (=> b!879309 m!818535))

(assert (=> b!879309 m!818533))

(declare-fun m!818537 () Bool)

(assert (=> b!879309 m!818537))

(declare-fun m!818539 () Bool)

(assert (=> b!879309 m!818539))

(declare-fun m!818541 () Bool)

(assert (=> b!879313 m!818541))

(declare-fun m!818543 () Bool)

(assert (=> b!879318 m!818543))

(declare-fun m!818545 () Bool)

(assert (=> start!74614 m!818545))

(declare-fun m!818547 () Bool)

(assert (=> start!74614 m!818547))

(declare-fun m!818549 () Bool)

(assert (=> b!879312 m!818549))

(declare-fun m!818551 () Bool)

(assert (=> mapNonEmpty!27936 m!818551))

(declare-fun m!818553 () Bool)

(assert (=> b!879308 m!818553))

(declare-fun m!818555 () Bool)

(assert (=> b!879308 m!818555))

(declare-fun m!818557 () Bool)

(assert (=> b!879308 m!818557))

(declare-fun m!818559 () Bool)

(assert (=> b!879308 m!818559))

(assert (=> b!879308 m!818555))

(assert (=> b!879308 m!818533))

(assert (=> b!879308 m!818557))

(declare-fun m!818561 () Bool)

(assert (=> b!879320 m!818561))

(declare-fun m!818563 () Bool)

(assert (=> b!879320 m!818563))

(declare-fun m!818565 () Bool)

(assert (=> b!879320 m!818565))

(declare-fun m!818567 () Bool)

(assert (=> b!879311 m!818567))

(check-sat (not b_lambda!12357) (not b!879318) b_and!25181 (not b!879320) (not b!879312) (not b_next!15301) tp_is_empty!17545 (not start!74614) (not b!879308) (not mapNonEmpty!27936) (not b!879309) (not b!879310) (not b!879313))
(check-sat b_and!25181 (not b_next!15301))
(get-model)

(declare-fun b_lambda!12363 () Bool)

(assert (= b_lambda!12357 (or (and start!74614 b_free!15301) b_lambda!12363)))

(check-sat (not b_lambda!12363) (not b!879318) b_and!25181 (not b!879320) (not b!879312) (not b_next!15301) tp_is_empty!17545 (not start!74614) (not b!879308) (not mapNonEmpty!27936) (not b!879309) (not b!879310) (not b!879313))
(check-sat b_and!25181 (not b_next!15301))
(get-model)

(declare-fun d!108731 () Bool)

(assert (=> d!108731 (= (array_inv!19448 _keys!868) (bvsge (size!25066 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74614 d!108731))

(declare-fun d!108733 () Bool)

(assert (=> d!108733 (= (array_inv!19449 _values!688) (bvsge (size!25067 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74614 d!108733))

(declare-fun b!879429 () Bool)

(declare-fun res!597531 () Bool)

(declare-fun e!489397 () Bool)

(assert (=> b!879429 (=> (not res!597531) (not e!489397))))

(declare-fun lt!397482 () ListLongMap!10441)

(declare-fun contains!4228 (ListLongMap!10441 (_ BitVec 64)) Bool)

(assert (=> b!879429 (= res!597531 (not (contains!4228 lt!397482 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879430 () Bool)

(declare-fun e!489391 () ListLongMap!10441)

(assert (=> b!879430 (= e!489391 (ListLongMap!10442 Nil!17479))))

(declare-fun b!879431 () Bool)

(declare-fun e!489395 () Bool)

(assert (=> b!879431 (= e!489397 e!489395)))

(declare-fun c!92769 () Bool)

(declare-fun e!489393 () Bool)

(assert (=> b!879431 (= c!92769 e!489393)))

(declare-fun res!597530 () Bool)

(assert (=> b!879431 (=> (not res!597530) (not e!489393))))

(assert (=> b!879431 (= res!597530 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25066 _keys!868)))))

(declare-fun b!879432 () Bool)

(declare-fun e!489392 () Bool)

(assert (=> b!879432 (= e!489395 e!489392)))

(declare-fun c!92768 () Bool)

(assert (=> b!879432 (= c!92768 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25066 _keys!868)))))

(declare-fun b!879433 () Bool)

(declare-fun e!489394 () ListLongMap!10441)

(assert (=> b!879433 (= e!489391 e!489394)))

(declare-fun c!92766 () Bool)

(assert (=> b!879433 (= c!92766 (validKeyInArray!0 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun d!108735 () Bool)

(assert (=> d!108735 e!489397))

(declare-fun res!597532 () Bool)

(assert (=> d!108735 (=> (not res!597532) (not e!489397))))

(assert (=> d!108735 (= res!597532 (not (contains!4228 lt!397482 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108735 (= lt!397482 e!489391)))

(declare-fun c!92767 () Bool)

(assert (=> d!108735 (= c!92767 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25066 _keys!868)))))

(assert (=> d!108735 (validMask!0 mask!1196)))

(assert (=> d!108735 (= (getCurrentListMapNoExtraKeys!3228 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397482)))

(declare-fun b!879434 () Bool)

(declare-fun e!489396 () Bool)

(assert (=> b!879434 (= e!489395 e!489396)))

(assert (=> b!879434 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25066 _keys!868)))))

(declare-fun res!597533 () Bool)

(assert (=> b!879434 (= res!597533 (contains!4228 lt!397482 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879434 (=> (not res!597533) (not e!489396))))

(declare-fun b!879435 () Bool)

(declare-fun lt!397481 () Unit!29977)

(declare-fun lt!397487 () Unit!29977)

(assert (=> b!879435 (= lt!397481 lt!397487)))

(declare-fun lt!397484 () (_ BitVec 64))

(declare-fun lt!397486 () (_ BitVec 64))

(declare-fun lt!397483 () ListLongMap!10441)

(declare-fun lt!397485 () V!28441)

(assert (=> b!879435 (not (contains!4228 (+!2532 lt!397483 (tuple2!11683 lt!397484 lt!397485)) lt!397486))))

(declare-fun addStillNotContains!205 (ListLongMap!10441 (_ BitVec 64) V!28441 (_ BitVec 64)) Unit!29977)

(assert (=> b!879435 (= lt!397487 (addStillNotContains!205 lt!397483 lt!397484 lt!397485 lt!397486))))

(assert (=> b!879435 (= lt!397486 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879435 (= lt!397485 (get!12951 (select (arr!24625 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879435 (= lt!397484 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38849 () ListLongMap!10441)

(assert (=> b!879435 (= lt!397483 call!38849)))

(assert (=> b!879435 (= e!489394 (+!2532 call!38849 (tuple2!11683 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12951 (select (arr!24625 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879436 () Bool)

(declare-fun isEmpty!671 (ListLongMap!10441) Bool)

(assert (=> b!879436 (= e!489392 (isEmpty!671 lt!397482))))

(declare-fun bm!38846 () Bool)

(assert (=> bm!38846 (= call!38849 (getCurrentListMapNoExtraKeys!3228 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!879437 () Bool)

(assert (=> b!879437 (= e!489394 call!38849)))

(declare-fun b!879438 () Bool)

(assert (=> b!879438 (= e!489392 (= lt!397482 (getCurrentListMapNoExtraKeys!3228 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879439 () Bool)

(assert (=> b!879439 (= e!489393 (validKeyInArray!0 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879439 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!879440 () Bool)

(assert (=> b!879440 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25066 _keys!868)))))

(assert (=> b!879440 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25067 _values!688)))))

(declare-fun apply!379 (ListLongMap!10441 (_ BitVec 64)) V!28441)

(assert (=> b!879440 (= e!489396 (= (apply!379 lt!397482 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12951 (select (arr!24625 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108735 c!92767) b!879430))

(assert (= (and d!108735 (not c!92767)) b!879433))

(assert (= (and b!879433 c!92766) b!879435))

(assert (= (and b!879433 (not c!92766)) b!879437))

(assert (= (or b!879435 b!879437) bm!38846))

(assert (= (and d!108735 res!597532) b!879429))

(assert (= (and b!879429 res!597531) b!879431))

(assert (= (and b!879431 res!597530) b!879439))

(assert (= (and b!879431 c!92769) b!879434))

(assert (= (and b!879431 (not c!92769)) b!879432))

(assert (= (and b!879434 res!597533) b!879440))

(assert (= (and b!879432 c!92768) b!879438))

(assert (= (and b!879432 (not c!92768)) b!879436))

(declare-fun b_lambda!12365 () Bool)

(assert (=> (not b_lambda!12365) (not b!879435)))

(assert (=> b!879435 t!24575))

(declare-fun b_and!25191 () Bool)

(assert (= b_and!25181 (and (=> t!24575 result!9533) b_and!25191)))

(declare-fun b_lambda!12367 () Bool)

(assert (=> (not b_lambda!12367) (not b!879440)))

(assert (=> b!879440 t!24575))

(declare-fun b_and!25193 () Bool)

(assert (= b_and!25191 (and (=> t!24575 result!9533) b_and!25193)))

(declare-fun m!818653 () Bool)

(assert (=> d!108735 m!818653))

(assert (=> d!108735 m!818549))

(declare-fun m!818655 () Bool)

(assert (=> b!879434 m!818655))

(assert (=> b!879434 m!818655))

(declare-fun m!818657 () Bool)

(assert (=> b!879434 m!818657))

(declare-fun m!818659 () Bool)

(assert (=> bm!38846 m!818659))

(declare-fun m!818661 () Bool)

(assert (=> b!879436 m!818661))

(declare-fun m!818663 () Bool)

(assert (=> b!879435 m!818663))

(assert (=> b!879435 m!818663))

(declare-fun m!818665 () Bool)

(assert (=> b!879435 m!818665))

(declare-fun m!818667 () Bool)

(assert (=> b!879435 m!818667))

(assert (=> b!879435 m!818557))

(declare-fun m!818669 () Bool)

(assert (=> b!879435 m!818669))

(assert (=> b!879435 m!818667))

(declare-fun m!818671 () Bool)

(assert (=> b!879435 m!818671))

(assert (=> b!879435 m!818557))

(declare-fun m!818673 () Bool)

(assert (=> b!879435 m!818673))

(assert (=> b!879435 m!818655))

(assert (=> b!879440 m!818667))

(assert (=> b!879440 m!818557))

(assert (=> b!879440 m!818669))

(assert (=> b!879440 m!818667))

(assert (=> b!879440 m!818655))

(declare-fun m!818675 () Bool)

(assert (=> b!879440 m!818675))

(assert (=> b!879440 m!818557))

(assert (=> b!879440 m!818655))

(assert (=> b!879433 m!818655))

(assert (=> b!879433 m!818655))

(declare-fun m!818677 () Bool)

(assert (=> b!879433 m!818677))

(assert (=> b!879439 m!818655))

(assert (=> b!879439 m!818655))

(assert (=> b!879439 m!818677))

(assert (=> b!879438 m!818659))

(declare-fun m!818679 () Bool)

(assert (=> b!879429 m!818679))

(assert (=> b!879309 d!108735))

(declare-fun d!108737 () Bool)

(assert (=> d!108737 (= (validKeyInArray!0 (select (arr!24624 _keys!868) from!1053)) (and (not (= (select (arr!24624 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24624 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!879309 d!108737))

(declare-fun d!108739 () Bool)

(declare-fun e!489402 () Bool)

(assert (=> d!108739 e!489402))

(declare-fun res!597536 () Bool)

(assert (=> d!108739 (=> (not res!597536) (not e!489402))))

(assert (=> d!108739 (= res!597536 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25067 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25067 _values!688))))))))

(declare-fun lt!397490 () Unit!29977)

(declare-fun choose!1444 (array!51197 array!51199 (_ BitVec 32) (_ BitVec 32) V!28441 V!28441 (_ BitVec 32) (_ BitVec 64) V!28441 (_ BitVec 32) Int) Unit!29977)

(assert (=> d!108739 (= lt!397490 (choose!1444 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108739 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25066 _keys!868)))))

(assert (=> d!108739 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!700 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397490)))

(declare-fun call!38854 () ListLongMap!10441)

(declare-fun bm!38851 () Bool)

(assert (=> bm!38851 (= call!38854 (getCurrentListMapNoExtraKeys!3228 _keys!868 (array!51200 (store (arr!24625 _values!688) i!612 (ValueCellFull!8333 v!557)) (size!25067 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879447 () Bool)

(declare-fun call!38855 () ListLongMap!10441)

(declare-fun e!489403 () Bool)

(assert (=> b!879447 (= e!489403 (= call!38854 (+!2532 call!38855 (tuple2!11683 k0!854 v!557))))))

(declare-fun b!879448 () Bool)

(assert (=> b!879448 (= e!489402 e!489403)))

(declare-fun c!92772 () Bool)

(assert (=> b!879448 (= c!92772 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun b!879449 () Bool)

(assert (=> b!879449 (= e!489403 (= call!38854 call!38855))))

(declare-fun bm!38852 () Bool)

(assert (=> bm!38852 (= call!38855 (getCurrentListMapNoExtraKeys!3228 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!108739 res!597536) b!879448))

(assert (= (and b!879448 c!92772) b!879447))

(assert (= (and b!879448 (not c!92772)) b!879449))

(assert (= (or b!879447 b!879449) bm!38852))

(assert (= (or b!879447 b!879449) bm!38851))

(declare-fun m!818681 () Bool)

(assert (=> d!108739 m!818681))

(assert (=> bm!38851 m!818563))

(declare-fun m!818683 () Bool)

(assert (=> bm!38851 m!818683))

(declare-fun m!818685 () Bool)

(assert (=> b!879447 m!818685))

(assert (=> bm!38852 m!818531))

(assert (=> b!879309 d!108739))

(declare-fun d!108741 () Bool)

(declare-fun e!489406 () Bool)

(assert (=> d!108741 e!489406))

(declare-fun res!597542 () Bool)

(assert (=> d!108741 (=> (not res!597542) (not e!489406))))

(declare-fun lt!397502 () ListLongMap!10441)

(assert (=> d!108741 (= res!597542 (contains!4228 lt!397502 (_1!5852 (tuple2!11683 k0!854 v!557))))))

(declare-fun lt!397500 () List!17482)

(assert (=> d!108741 (= lt!397502 (ListLongMap!10442 lt!397500))))

(declare-fun lt!397501 () Unit!29977)

(declare-fun lt!397499 () Unit!29977)

(assert (=> d!108741 (= lt!397501 lt!397499)))

(declare-datatypes ((Option!425 0))(
  ( (Some!424 (v!11264 V!28441)) (None!423) )
))
(declare-fun getValueByKey!419 (List!17482 (_ BitVec 64)) Option!425)

(assert (=> d!108741 (= (getValueByKey!419 lt!397500 (_1!5852 (tuple2!11683 k0!854 v!557))) (Some!424 (_2!5852 (tuple2!11683 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!236 (List!17482 (_ BitVec 64) V!28441) Unit!29977)

(assert (=> d!108741 (= lt!397499 (lemmaContainsTupThenGetReturnValue!236 lt!397500 (_1!5852 (tuple2!11683 k0!854 v!557)) (_2!5852 (tuple2!11683 k0!854 v!557))))))

(declare-fun insertStrictlySorted!275 (List!17482 (_ BitVec 64) V!28441) List!17482)

(assert (=> d!108741 (= lt!397500 (insertStrictlySorted!275 (toList!5236 lt!397423) (_1!5852 (tuple2!11683 k0!854 v!557)) (_2!5852 (tuple2!11683 k0!854 v!557))))))

(assert (=> d!108741 (= (+!2532 lt!397423 (tuple2!11683 k0!854 v!557)) lt!397502)))

(declare-fun b!879454 () Bool)

(declare-fun res!597541 () Bool)

(assert (=> b!879454 (=> (not res!597541) (not e!489406))))

(assert (=> b!879454 (= res!597541 (= (getValueByKey!419 (toList!5236 lt!397502) (_1!5852 (tuple2!11683 k0!854 v!557))) (Some!424 (_2!5852 (tuple2!11683 k0!854 v!557)))))))

(declare-fun b!879455 () Bool)

(declare-fun contains!4229 (List!17482 tuple2!11682) Bool)

(assert (=> b!879455 (= e!489406 (contains!4229 (toList!5236 lt!397502) (tuple2!11683 k0!854 v!557)))))

(assert (= (and d!108741 res!597542) b!879454))

(assert (= (and b!879454 res!597541) b!879455))

(declare-fun m!818687 () Bool)

(assert (=> d!108741 m!818687))

(declare-fun m!818689 () Bool)

(assert (=> d!108741 m!818689))

(declare-fun m!818691 () Bool)

(assert (=> d!108741 m!818691))

(declare-fun m!818693 () Bool)

(assert (=> d!108741 m!818693))

(declare-fun m!818695 () Bool)

(assert (=> b!879454 m!818695))

(declare-fun m!818697 () Bool)

(assert (=> b!879455 m!818697))

(assert (=> b!879309 d!108741))

(declare-fun b!879456 () Bool)

(declare-fun res!597544 () Bool)

(declare-fun e!489413 () Bool)

(assert (=> b!879456 (=> (not res!597544) (not e!489413))))

(declare-fun lt!397504 () ListLongMap!10441)

(assert (=> b!879456 (= res!597544 (not (contains!4228 lt!397504 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879457 () Bool)

(declare-fun e!489407 () ListLongMap!10441)

(assert (=> b!879457 (= e!489407 (ListLongMap!10442 Nil!17479))))

(declare-fun b!879458 () Bool)

(declare-fun e!489411 () Bool)

(assert (=> b!879458 (= e!489413 e!489411)))

(declare-fun c!92776 () Bool)

(declare-fun e!489409 () Bool)

(assert (=> b!879458 (= c!92776 e!489409)))

(declare-fun res!597543 () Bool)

(assert (=> b!879458 (=> (not res!597543) (not e!489409))))

(assert (=> b!879458 (= res!597543 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25066 _keys!868)))))

(declare-fun b!879459 () Bool)

(declare-fun e!489408 () Bool)

(assert (=> b!879459 (= e!489411 e!489408)))

(declare-fun c!92775 () Bool)

(assert (=> b!879459 (= c!92775 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25066 _keys!868)))))

(declare-fun b!879460 () Bool)

(declare-fun e!489410 () ListLongMap!10441)

(assert (=> b!879460 (= e!489407 e!489410)))

(declare-fun c!92773 () Bool)

(assert (=> b!879460 (= c!92773 (validKeyInArray!0 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun d!108743 () Bool)

(assert (=> d!108743 e!489413))

(declare-fun res!597545 () Bool)

(assert (=> d!108743 (=> (not res!597545) (not e!489413))))

(assert (=> d!108743 (= res!597545 (not (contains!4228 lt!397504 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108743 (= lt!397504 e!489407)))

(declare-fun c!92774 () Bool)

(assert (=> d!108743 (= c!92774 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25066 _keys!868)))))

(assert (=> d!108743 (validMask!0 mask!1196)))

(assert (=> d!108743 (= (getCurrentListMapNoExtraKeys!3228 _keys!868 lt!397418 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397504)))

(declare-fun b!879461 () Bool)

(declare-fun e!489412 () Bool)

(assert (=> b!879461 (= e!489411 e!489412)))

(assert (=> b!879461 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25066 _keys!868)))))

(declare-fun res!597546 () Bool)

(assert (=> b!879461 (= res!597546 (contains!4228 lt!397504 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879461 (=> (not res!597546) (not e!489412))))

(declare-fun b!879462 () Bool)

(declare-fun lt!397503 () Unit!29977)

(declare-fun lt!397509 () Unit!29977)

(assert (=> b!879462 (= lt!397503 lt!397509)))

(declare-fun lt!397507 () V!28441)

(declare-fun lt!397505 () ListLongMap!10441)

(declare-fun lt!397508 () (_ BitVec 64))

(declare-fun lt!397506 () (_ BitVec 64))

(assert (=> b!879462 (not (contains!4228 (+!2532 lt!397505 (tuple2!11683 lt!397506 lt!397507)) lt!397508))))

(assert (=> b!879462 (= lt!397509 (addStillNotContains!205 lt!397505 lt!397506 lt!397507 lt!397508))))

(assert (=> b!879462 (= lt!397508 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879462 (= lt!397507 (get!12951 (select (arr!24625 lt!397418) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879462 (= lt!397506 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38856 () ListLongMap!10441)

(assert (=> b!879462 (= lt!397505 call!38856)))

(assert (=> b!879462 (= e!489410 (+!2532 call!38856 (tuple2!11683 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12951 (select (arr!24625 lt!397418) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879463 () Bool)

(assert (=> b!879463 (= e!489408 (isEmpty!671 lt!397504))))

(declare-fun bm!38853 () Bool)

(assert (=> bm!38853 (= call!38856 (getCurrentListMapNoExtraKeys!3228 _keys!868 lt!397418 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!879464 () Bool)

(assert (=> b!879464 (= e!489410 call!38856)))

(declare-fun b!879465 () Bool)

(assert (=> b!879465 (= e!489408 (= lt!397504 (getCurrentListMapNoExtraKeys!3228 _keys!868 lt!397418 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879466 () Bool)

(assert (=> b!879466 (= e!489409 (validKeyInArray!0 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879466 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!879467 () Bool)

(assert (=> b!879467 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25066 _keys!868)))))

(assert (=> b!879467 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25067 lt!397418)))))

(assert (=> b!879467 (= e!489412 (= (apply!379 lt!397504 (select (arr!24624 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12951 (select (arr!24625 lt!397418) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108743 c!92774) b!879457))

(assert (= (and d!108743 (not c!92774)) b!879460))

(assert (= (and b!879460 c!92773) b!879462))

(assert (= (and b!879460 (not c!92773)) b!879464))

(assert (= (or b!879462 b!879464) bm!38853))

(assert (= (and d!108743 res!597545) b!879456))

(assert (= (and b!879456 res!597544) b!879458))

(assert (= (and b!879458 res!597543) b!879466))

(assert (= (and b!879458 c!92776) b!879461))

(assert (= (and b!879458 (not c!92776)) b!879459))

(assert (= (and b!879461 res!597546) b!879467))

(assert (= (and b!879459 c!92775) b!879465))

(assert (= (and b!879459 (not c!92775)) b!879463))

(declare-fun b_lambda!12369 () Bool)

(assert (=> (not b_lambda!12369) (not b!879462)))

(assert (=> b!879462 t!24575))

(declare-fun b_and!25195 () Bool)

(assert (= b_and!25193 (and (=> t!24575 result!9533) b_and!25195)))

(declare-fun b_lambda!12371 () Bool)

(assert (=> (not b_lambda!12371) (not b!879467)))

(assert (=> b!879467 t!24575))

(declare-fun b_and!25197 () Bool)

(assert (= b_and!25195 (and (=> t!24575 result!9533) b_and!25197)))

(declare-fun m!818699 () Bool)

(assert (=> d!108743 m!818699))

(assert (=> d!108743 m!818549))

(assert (=> b!879461 m!818655))

(assert (=> b!879461 m!818655))

(declare-fun m!818701 () Bool)

(assert (=> b!879461 m!818701))

(declare-fun m!818703 () Bool)

(assert (=> bm!38853 m!818703))

(declare-fun m!818705 () Bool)

(assert (=> b!879463 m!818705))

(declare-fun m!818707 () Bool)

(assert (=> b!879462 m!818707))

(assert (=> b!879462 m!818707))

(declare-fun m!818709 () Bool)

(assert (=> b!879462 m!818709))

(declare-fun m!818711 () Bool)

(assert (=> b!879462 m!818711))

(assert (=> b!879462 m!818557))

(declare-fun m!818713 () Bool)

(assert (=> b!879462 m!818713))

(assert (=> b!879462 m!818711))

(declare-fun m!818715 () Bool)

(assert (=> b!879462 m!818715))

(assert (=> b!879462 m!818557))

(declare-fun m!818717 () Bool)

(assert (=> b!879462 m!818717))

(assert (=> b!879462 m!818655))

(assert (=> b!879467 m!818711))

(assert (=> b!879467 m!818557))

(assert (=> b!879467 m!818713))

(assert (=> b!879467 m!818711))

(assert (=> b!879467 m!818655))

(declare-fun m!818719 () Bool)

(assert (=> b!879467 m!818719))

(assert (=> b!879467 m!818557))

(assert (=> b!879467 m!818655))

(assert (=> b!879460 m!818655))

(assert (=> b!879460 m!818655))

(assert (=> b!879460 m!818677))

(assert (=> b!879466 m!818655))

(assert (=> b!879466 m!818655))

(assert (=> b!879466 m!818677))

(assert (=> b!879465 m!818703))

(declare-fun m!818721 () Bool)

(assert (=> b!879456 m!818721))

(assert (=> b!879309 d!108743))

(declare-fun b!879468 () Bool)

(declare-fun res!597548 () Bool)

(declare-fun e!489420 () Bool)

(assert (=> b!879468 (=> (not res!597548) (not e!489420))))

(declare-fun lt!397511 () ListLongMap!10441)

(assert (=> b!879468 (= res!597548 (not (contains!4228 lt!397511 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879469 () Bool)

(declare-fun e!489414 () ListLongMap!10441)

(assert (=> b!879469 (= e!489414 (ListLongMap!10442 Nil!17479))))

(declare-fun b!879470 () Bool)

(declare-fun e!489418 () Bool)

(assert (=> b!879470 (= e!489420 e!489418)))

(declare-fun c!92780 () Bool)

(declare-fun e!489416 () Bool)

(assert (=> b!879470 (= c!92780 e!489416)))

(declare-fun res!597547 () Bool)

(assert (=> b!879470 (=> (not res!597547) (not e!489416))))

(assert (=> b!879470 (= res!597547 (bvslt from!1053 (size!25066 _keys!868)))))

(declare-fun b!879471 () Bool)

(declare-fun e!489415 () Bool)

(assert (=> b!879471 (= e!489418 e!489415)))

(declare-fun c!92779 () Bool)

(assert (=> b!879471 (= c!92779 (bvslt from!1053 (size!25066 _keys!868)))))

(declare-fun b!879472 () Bool)

(declare-fun e!489417 () ListLongMap!10441)

(assert (=> b!879472 (= e!489414 e!489417)))

(declare-fun c!92777 () Bool)

(assert (=> b!879472 (= c!92777 (validKeyInArray!0 (select (arr!24624 _keys!868) from!1053)))))

(declare-fun d!108745 () Bool)

(assert (=> d!108745 e!489420))

(declare-fun res!597549 () Bool)

(assert (=> d!108745 (=> (not res!597549) (not e!489420))))

(assert (=> d!108745 (= res!597549 (not (contains!4228 lt!397511 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108745 (= lt!397511 e!489414)))

(declare-fun c!92778 () Bool)

(assert (=> d!108745 (= c!92778 (bvsge from!1053 (size!25066 _keys!868)))))

(assert (=> d!108745 (validMask!0 mask!1196)))

(assert (=> d!108745 (= (getCurrentListMapNoExtraKeys!3228 _keys!868 lt!397418 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!397511)))

(declare-fun b!879473 () Bool)

(declare-fun e!489419 () Bool)

(assert (=> b!879473 (= e!489418 e!489419)))

(assert (=> b!879473 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25066 _keys!868)))))

(declare-fun res!597550 () Bool)

(assert (=> b!879473 (= res!597550 (contains!4228 lt!397511 (select (arr!24624 _keys!868) from!1053)))))

(assert (=> b!879473 (=> (not res!597550) (not e!489419))))

(declare-fun b!879474 () Bool)

(declare-fun lt!397510 () Unit!29977)

(declare-fun lt!397516 () Unit!29977)

(assert (=> b!879474 (= lt!397510 lt!397516)))

(declare-fun lt!397513 () (_ BitVec 64))

(declare-fun lt!397515 () (_ BitVec 64))

(declare-fun lt!397512 () ListLongMap!10441)

(declare-fun lt!397514 () V!28441)

(assert (=> b!879474 (not (contains!4228 (+!2532 lt!397512 (tuple2!11683 lt!397513 lt!397514)) lt!397515))))

(assert (=> b!879474 (= lt!397516 (addStillNotContains!205 lt!397512 lt!397513 lt!397514 lt!397515))))

(assert (=> b!879474 (= lt!397515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879474 (= lt!397514 (get!12951 (select (arr!24625 lt!397418) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879474 (= lt!397513 (select (arr!24624 _keys!868) from!1053))))

(declare-fun call!38857 () ListLongMap!10441)

(assert (=> b!879474 (= lt!397512 call!38857)))

(assert (=> b!879474 (= e!489417 (+!2532 call!38857 (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 lt!397418) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879475 () Bool)

(assert (=> b!879475 (= e!489415 (isEmpty!671 lt!397511))))

(declare-fun bm!38854 () Bool)

(assert (=> bm!38854 (= call!38857 (getCurrentListMapNoExtraKeys!3228 _keys!868 lt!397418 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!879476 () Bool)

(assert (=> b!879476 (= e!489417 call!38857)))

(declare-fun b!879477 () Bool)

(assert (=> b!879477 (= e!489415 (= lt!397511 (getCurrentListMapNoExtraKeys!3228 _keys!868 lt!397418 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879478 () Bool)

(assert (=> b!879478 (= e!489416 (validKeyInArray!0 (select (arr!24624 _keys!868) from!1053)))))

(assert (=> b!879478 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!879479 () Bool)

(assert (=> b!879479 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25066 _keys!868)))))

(assert (=> b!879479 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25067 lt!397418)))))

(assert (=> b!879479 (= e!489419 (= (apply!379 lt!397511 (select (arr!24624 _keys!868) from!1053)) (get!12951 (select (arr!24625 lt!397418) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108745 c!92778) b!879469))

(assert (= (and d!108745 (not c!92778)) b!879472))

(assert (= (and b!879472 c!92777) b!879474))

(assert (= (and b!879472 (not c!92777)) b!879476))

(assert (= (or b!879474 b!879476) bm!38854))

(assert (= (and d!108745 res!597549) b!879468))

(assert (= (and b!879468 res!597548) b!879470))

(assert (= (and b!879470 res!597547) b!879478))

(assert (= (and b!879470 c!92780) b!879473))

(assert (= (and b!879470 (not c!92780)) b!879471))

(assert (= (and b!879473 res!597550) b!879479))

(assert (= (and b!879471 c!92779) b!879477))

(assert (= (and b!879471 (not c!92779)) b!879475))

(declare-fun b_lambda!12373 () Bool)

(assert (=> (not b_lambda!12373) (not b!879474)))

(assert (=> b!879474 t!24575))

(declare-fun b_and!25199 () Bool)

(assert (= b_and!25197 (and (=> t!24575 result!9533) b_and!25199)))

(declare-fun b_lambda!12375 () Bool)

(assert (=> (not b_lambda!12375) (not b!879479)))

(assert (=> b!879479 t!24575))

(declare-fun b_and!25201 () Bool)

(assert (= b_and!25199 (and (=> t!24575 result!9533) b_and!25201)))

(declare-fun m!818723 () Bool)

(assert (=> d!108745 m!818723))

(assert (=> d!108745 m!818549))

(assert (=> b!879473 m!818533))

(assert (=> b!879473 m!818533))

(declare-fun m!818725 () Bool)

(assert (=> b!879473 m!818725))

(declare-fun m!818727 () Bool)

(assert (=> bm!38854 m!818727))

(declare-fun m!818729 () Bool)

(assert (=> b!879475 m!818729))

(declare-fun m!818731 () Bool)

(assert (=> b!879474 m!818731))

(assert (=> b!879474 m!818731))

(declare-fun m!818733 () Bool)

(assert (=> b!879474 m!818733))

(declare-fun m!818735 () Bool)

(assert (=> b!879474 m!818735))

(assert (=> b!879474 m!818557))

(declare-fun m!818737 () Bool)

(assert (=> b!879474 m!818737))

(assert (=> b!879474 m!818735))

(declare-fun m!818739 () Bool)

(assert (=> b!879474 m!818739))

(assert (=> b!879474 m!818557))

(declare-fun m!818741 () Bool)

(assert (=> b!879474 m!818741))

(assert (=> b!879474 m!818533))

(assert (=> b!879479 m!818735))

(assert (=> b!879479 m!818557))

(assert (=> b!879479 m!818737))

(assert (=> b!879479 m!818735))

(assert (=> b!879479 m!818533))

(declare-fun m!818743 () Bool)

(assert (=> b!879479 m!818743))

(assert (=> b!879479 m!818557))

(assert (=> b!879479 m!818533))

(assert (=> b!879472 m!818533))

(assert (=> b!879472 m!818533))

(assert (=> b!879472 m!818535))

(assert (=> b!879478 m!818533))

(assert (=> b!879478 m!818533))

(assert (=> b!879478 m!818535))

(assert (=> b!879477 m!818727))

(declare-fun m!818745 () Bool)

(assert (=> b!879468 m!818745))

(assert (=> b!879320 d!108745))

(declare-fun b!879480 () Bool)

(declare-fun res!597552 () Bool)

(declare-fun e!489427 () Bool)

(assert (=> b!879480 (=> (not res!597552) (not e!489427))))

(declare-fun lt!397518 () ListLongMap!10441)

(assert (=> b!879480 (= res!597552 (not (contains!4228 lt!397518 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879481 () Bool)

(declare-fun e!489421 () ListLongMap!10441)

(assert (=> b!879481 (= e!489421 (ListLongMap!10442 Nil!17479))))

(declare-fun b!879482 () Bool)

(declare-fun e!489425 () Bool)

(assert (=> b!879482 (= e!489427 e!489425)))

(declare-fun c!92784 () Bool)

(declare-fun e!489423 () Bool)

(assert (=> b!879482 (= c!92784 e!489423)))

(declare-fun res!597551 () Bool)

(assert (=> b!879482 (=> (not res!597551) (not e!489423))))

(assert (=> b!879482 (= res!597551 (bvslt from!1053 (size!25066 _keys!868)))))

(declare-fun b!879483 () Bool)

(declare-fun e!489422 () Bool)

(assert (=> b!879483 (= e!489425 e!489422)))

(declare-fun c!92783 () Bool)

(assert (=> b!879483 (= c!92783 (bvslt from!1053 (size!25066 _keys!868)))))

(declare-fun b!879484 () Bool)

(declare-fun e!489424 () ListLongMap!10441)

(assert (=> b!879484 (= e!489421 e!489424)))

(declare-fun c!92781 () Bool)

(assert (=> b!879484 (= c!92781 (validKeyInArray!0 (select (arr!24624 _keys!868) from!1053)))))

(declare-fun d!108747 () Bool)

(assert (=> d!108747 e!489427))

(declare-fun res!597553 () Bool)

(assert (=> d!108747 (=> (not res!597553) (not e!489427))))

(assert (=> d!108747 (= res!597553 (not (contains!4228 lt!397518 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108747 (= lt!397518 e!489421)))

(declare-fun c!92782 () Bool)

(assert (=> d!108747 (= c!92782 (bvsge from!1053 (size!25066 _keys!868)))))

(assert (=> d!108747 (validMask!0 mask!1196)))

(assert (=> d!108747 (= (getCurrentListMapNoExtraKeys!3228 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!397518)))

(declare-fun b!879485 () Bool)

(declare-fun e!489426 () Bool)

(assert (=> b!879485 (= e!489425 e!489426)))

(assert (=> b!879485 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25066 _keys!868)))))

(declare-fun res!597554 () Bool)

(assert (=> b!879485 (= res!597554 (contains!4228 lt!397518 (select (arr!24624 _keys!868) from!1053)))))

(assert (=> b!879485 (=> (not res!597554) (not e!489426))))

(declare-fun b!879486 () Bool)

(declare-fun lt!397517 () Unit!29977)

(declare-fun lt!397523 () Unit!29977)

(assert (=> b!879486 (= lt!397517 lt!397523)))

(declare-fun lt!397522 () (_ BitVec 64))

(declare-fun lt!397521 () V!28441)

(declare-fun lt!397519 () ListLongMap!10441)

(declare-fun lt!397520 () (_ BitVec 64))

(assert (=> b!879486 (not (contains!4228 (+!2532 lt!397519 (tuple2!11683 lt!397520 lt!397521)) lt!397522))))

(assert (=> b!879486 (= lt!397523 (addStillNotContains!205 lt!397519 lt!397520 lt!397521 lt!397522))))

(assert (=> b!879486 (= lt!397522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879486 (= lt!397521 (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879486 (= lt!397520 (select (arr!24624 _keys!868) from!1053))))

(declare-fun call!38858 () ListLongMap!10441)

(assert (=> b!879486 (= lt!397519 call!38858)))

(assert (=> b!879486 (= e!489424 (+!2532 call!38858 (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879487 () Bool)

(assert (=> b!879487 (= e!489422 (isEmpty!671 lt!397518))))

(declare-fun bm!38855 () Bool)

(assert (=> bm!38855 (= call!38858 (getCurrentListMapNoExtraKeys!3228 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!879488 () Bool)

(assert (=> b!879488 (= e!489424 call!38858)))

(declare-fun b!879489 () Bool)

(assert (=> b!879489 (= e!489422 (= lt!397518 (getCurrentListMapNoExtraKeys!3228 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879490 () Bool)

(assert (=> b!879490 (= e!489423 (validKeyInArray!0 (select (arr!24624 _keys!868) from!1053)))))

(assert (=> b!879490 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!879491 () Bool)

(assert (=> b!879491 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25066 _keys!868)))))

(assert (=> b!879491 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25067 _values!688)))))

(assert (=> b!879491 (= e!489426 (= (apply!379 lt!397518 (select (arr!24624 _keys!868) from!1053)) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108747 c!92782) b!879481))

(assert (= (and d!108747 (not c!92782)) b!879484))

(assert (= (and b!879484 c!92781) b!879486))

(assert (= (and b!879484 (not c!92781)) b!879488))

(assert (= (or b!879486 b!879488) bm!38855))

(assert (= (and d!108747 res!597553) b!879480))

(assert (= (and b!879480 res!597552) b!879482))

(assert (= (and b!879482 res!597551) b!879490))

(assert (= (and b!879482 c!92784) b!879485))

(assert (= (and b!879482 (not c!92784)) b!879483))

(assert (= (and b!879485 res!597554) b!879491))

(assert (= (and b!879483 c!92783) b!879489))

(assert (= (and b!879483 (not c!92783)) b!879487))

(declare-fun b_lambda!12377 () Bool)

(assert (=> (not b_lambda!12377) (not b!879486)))

(assert (=> b!879486 t!24575))

(declare-fun b_and!25203 () Bool)

(assert (= b_and!25201 (and (=> t!24575 result!9533) b_and!25203)))

(declare-fun b_lambda!12379 () Bool)

(assert (=> (not b_lambda!12379) (not b!879491)))

(assert (=> b!879491 t!24575))

(declare-fun b_and!25205 () Bool)

(assert (= b_and!25203 (and (=> t!24575 result!9533) b_and!25205)))

(declare-fun m!818747 () Bool)

(assert (=> d!108747 m!818747))

(assert (=> d!108747 m!818549))

(assert (=> b!879485 m!818533))

(assert (=> b!879485 m!818533))

(declare-fun m!818749 () Bool)

(assert (=> b!879485 m!818749))

(declare-fun m!818751 () Bool)

(assert (=> bm!38855 m!818751))

(declare-fun m!818753 () Bool)

(assert (=> b!879487 m!818753))

(declare-fun m!818755 () Bool)

(assert (=> b!879486 m!818755))

(assert (=> b!879486 m!818755))

(declare-fun m!818757 () Bool)

(assert (=> b!879486 m!818757))

(assert (=> b!879486 m!818555))

(assert (=> b!879486 m!818557))

(assert (=> b!879486 m!818559))

(assert (=> b!879486 m!818555))

(declare-fun m!818759 () Bool)

(assert (=> b!879486 m!818759))

(assert (=> b!879486 m!818557))

(declare-fun m!818761 () Bool)

(assert (=> b!879486 m!818761))

(assert (=> b!879486 m!818533))

(assert (=> b!879491 m!818555))

(assert (=> b!879491 m!818557))

(assert (=> b!879491 m!818559))

(assert (=> b!879491 m!818555))

(assert (=> b!879491 m!818533))

(declare-fun m!818763 () Bool)

(assert (=> b!879491 m!818763))

(assert (=> b!879491 m!818557))

(assert (=> b!879491 m!818533))

(assert (=> b!879484 m!818533))

(assert (=> b!879484 m!818533))

(assert (=> b!879484 m!818535))

(assert (=> b!879490 m!818533))

(assert (=> b!879490 m!818533))

(assert (=> b!879490 m!818535))

(assert (=> b!879489 m!818751))

(declare-fun m!818765 () Bool)

(assert (=> b!879480 m!818765))

(assert (=> b!879320 d!108747))

(declare-fun bm!38858 () Bool)

(declare-fun call!38861 () Bool)

(assert (=> bm!38858 (= call!38861 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!108749 () Bool)

(declare-fun res!597559 () Bool)

(declare-fun e!489435 () Bool)

(assert (=> d!108749 (=> res!597559 e!489435)))

(assert (=> d!108749 (= res!597559 (bvsge #b00000000000000000000000000000000 (size!25066 _keys!868)))))

(assert (=> d!108749 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!489435)))

(declare-fun b!879500 () Bool)

(declare-fun e!489436 () Bool)

(declare-fun e!489434 () Bool)

(assert (=> b!879500 (= e!489436 e!489434)))

(declare-fun lt!397532 () (_ BitVec 64))

(assert (=> b!879500 (= lt!397532 (select (arr!24624 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!397531 () Unit!29977)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51197 (_ BitVec 64) (_ BitVec 32)) Unit!29977)

(assert (=> b!879500 (= lt!397531 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!397532 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!879500 (arrayContainsKey!0 _keys!868 lt!397532 #b00000000000000000000000000000000)))

(declare-fun lt!397530 () Unit!29977)

(assert (=> b!879500 (= lt!397530 lt!397531)))

(declare-fun res!597560 () Bool)

(declare-datatypes ((SeekEntryResult!8751 0))(
  ( (MissingZero!8751 (index!37375 (_ BitVec 32))) (Found!8751 (index!37376 (_ BitVec 32))) (Intermediate!8751 (undefined!9563 Bool) (index!37377 (_ BitVec 32)) (x!74503 (_ BitVec 32))) (Undefined!8751) (MissingVacant!8751 (index!37378 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51197 (_ BitVec 32)) SeekEntryResult!8751)

(assert (=> b!879500 (= res!597560 (= (seekEntryOrOpen!0 (select (arr!24624 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8751 #b00000000000000000000000000000000)))))

(assert (=> b!879500 (=> (not res!597560) (not e!489434))))

(declare-fun b!879501 () Bool)

(assert (=> b!879501 (= e!489434 call!38861)))

(declare-fun b!879502 () Bool)

(assert (=> b!879502 (= e!489436 call!38861)))

(declare-fun b!879503 () Bool)

(assert (=> b!879503 (= e!489435 e!489436)))

(declare-fun c!92787 () Bool)

(assert (=> b!879503 (= c!92787 (validKeyInArray!0 (select (arr!24624 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108749 (not res!597559)) b!879503))

(assert (= (and b!879503 c!92787) b!879500))

(assert (= (and b!879503 (not c!92787)) b!879502))

(assert (= (and b!879500 res!597560) b!879501))

(assert (= (or b!879501 b!879502) bm!38858))

(declare-fun m!818767 () Bool)

(assert (=> bm!38858 m!818767))

(declare-fun m!818769 () Bool)

(assert (=> b!879500 m!818769))

(declare-fun m!818771 () Bool)

(assert (=> b!879500 m!818771))

(declare-fun m!818773 () Bool)

(assert (=> b!879500 m!818773))

(assert (=> b!879500 m!818769))

(declare-fun m!818775 () Bool)

(assert (=> b!879500 m!818775))

(assert (=> b!879503 m!818769))

(assert (=> b!879503 m!818769))

(declare-fun m!818777 () Bool)

(assert (=> b!879503 m!818777))

(assert (=> b!879310 d!108749))

(declare-fun b!879514 () Bool)

(declare-fun e!489445 () Bool)

(declare-fun call!38864 () Bool)

(assert (=> b!879514 (= e!489445 call!38864)))

(declare-fun b!879515 () Bool)

(declare-fun e!489447 () Bool)

(declare-fun e!489446 () Bool)

(assert (=> b!879515 (= e!489447 e!489446)))

(declare-fun res!597568 () Bool)

(assert (=> b!879515 (=> (not res!597568) (not e!489446))))

(declare-fun e!489448 () Bool)

(assert (=> b!879515 (= res!597568 (not e!489448))))

(declare-fun res!597569 () Bool)

(assert (=> b!879515 (=> (not res!597569) (not e!489448))))

(assert (=> b!879515 (= res!597569 (validKeyInArray!0 (select (arr!24624 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!879516 () Bool)

(assert (=> b!879516 (= e!489446 e!489445)))

(declare-fun c!92790 () Bool)

(assert (=> b!879516 (= c!92790 (validKeyInArray!0 (select (arr!24624 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!879517 () Bool)

(declare-fun contains!4230 (List!17483 (_ BitVec 64)) Bool)

(assert (=> b!879517 (= e!489448 (contains!4230 Nil!17480 (select (arr!24624 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!879518 () Bool)

(assert (=> b!879518 (= e!489445 call!38864)))

(declare-fun bm!38861 () Bool)

(assert (=> bm!38861 (= call!38864 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92790 (Cons!17479 (select (arr!24624 _keys!868) #b00000000000000000000000000000000) Nil!17480) Nil!17480)))))

(declare-fun d!108751 () Bool)

(declare-fun res!597567 () Bool)

(assert (=> d!108751 (=> res!597567 e!489447)))

(assert (=> d!108751 (= res!597567 (bvsge #b00000000000000000000000000000000 (size!25066 _keys!868)))))

(assert (=> d!108751 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17480) e!489447)))

(assert (= (and d!108751 (not res!597567)) b!879515))

(assert (= (and b!879515 res!597569) b!879517))

(assert (= (and b!879515 res!597568) b!879516))

(assert (= (and b!879516 c!92790) b!879514))

(assert (= (and b!879516 (not c!92790)) b!879518))

(assert (= (or b!879514 b!879518) bm!38861))

(assert (=> b!879515 m!818769))

(assert (=> b!879515 m!818769))

(assert (=> b!879515 m!818777))

(assert (=> b!879516 m!818769))

(assert (=> b!879516 m!818769))

(assert (=> b!879516 m!818777))

(assert (=> b!879517 m!818769))

(assert (=> b!879517 m!818769))

(declare-fun m!818779 () Bool)

(assert (=> b!879517 m!818779))

(assert (=> bm!38861 m!818769))

(declare-fun m!818781 () Bool)

(assert (=> bm!38861 m!818781))

(assert (=> b!879313 d!108751))

(declare-fun d!108753 () Bool)

(assert (=> d!108753 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!879312 d!108753))

(declare-fun d!108755 () Bool)

(declare-fun e!489449 () Bool)

(assert (=> d!108755 e!489449))

(declare-fun res!597571 () Bool)

(assert (=> d!108755 (=> (not res!597571) (not e!489449))))

(declare-fun lt!397536 () ListLongMap!10441)

(assert (=> d!108755 (= res!597571 (contains!4228 lt!397536 (_1!5852 (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!397534 () List!17482)

(assert (=> d!108755 (= lt!397536 (ListLongMap!10442 lt!397534))))

(declare-fun lt!397535 () Unit!29977)

(declare-fun lt!397533 () Unit!29977)

(assert (=> d!108755 (= lt!397535 lt!397533)))

(assert (=> d!108755 (= (getValueByKey!419 lt!397534 (_1!5852 (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!424 (_2!5852 (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108755 (= lt!397533 (lemmaContainsTupThenGetReturnValue!236 lt!397534 (_1!5852 (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5852 (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108755 (= lt!397534 (insertStrictlySorted!275 (toList!5236 lt!397421) (_1!5852 (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5852 (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108755 (= (+!2532 lt!397421 (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!397536)))

(declare-fun b!879519 () Bool)

(declare-fun res!597570 () Bool)

(assert (=> b!879519 (=> (not res!597570) (not e!489449))))

(assert (=> b!879519 (= res!597570 (= (getValueByKey!419 (toList!5236 lt!397536) (_1!5852 (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!424 (_2!5852 (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!879520 () Bool)

(assert (=> b!879520 (= e!489449 (contains!4229 (toList!5236 lt!397536) (tuple2!11683 (select (arr!24624 _keys!868) from!1053) (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108755 res!597571) b!879519))

(assert (= (and b!879519 res!597570) b!879520))

(declare-fun m!818783 () Bool)

(assert (=> d!108755 m!818783))

(declare-fun m!818785 () Bool)

(assert (=> d!108755 m!818785))

(declare-fun m!818787 () Bool)

(assert (=> d!108755 m!818787))

(declare-fun m!818789 () Bool)

(assert (=> d!108755 m!818789))

(declare-fun m!818791 () Bool)

(assert (=> b!879519 m!818791))

(declare-fun m!818793 () Bool)

(assert (=> b!879520 m!818793))

(assert (=> b!879308 d!108755))

(declare-fun d!108757 () Bool)

(declare-fun c!92793 () Bool)

(assert (=> d!108757 (= c!92793 ((_ is ValueCellFull!8333) (select (arr!24625 _values!688) from!1053)))))

(declare-fun e!489452 () V!28441)

(assert (=> d!108757 (= (get!12951 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!489452)))

(declare-fun b!879525 () Bool)

(declare-fun get!12953 (ValueCell!8333 V!28441) V!28441)

(assert (=> b!879525 (= e!489452 (get!12953 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879526 () Bool)

(declare-fun get!12954 (ValueCell!8333 V!28441) V!28441)

(assert (=> b!879526 (= e!489452 (get!12954 (select (arr!24625 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108757 c!92793) b!879525))

(assert (= (and d!108757 (not c!92793)) b!879526))

(assert (=> b!879525 m!818555))

(assert (=> b!879525 m!818557))

(declare-fun m!818795 () Bool)

(assert (=> b!879525 m!818795))

(assert (=> b!879526 m!818555))

(assert (=> b!879526 m!818557))

(declare-fun m!818797 () Bool)

(assert (=> b!879526 m!818797))

(assert (=> b!879308 d!108757))

(declare-fun d!108759 () Bool)

(assert (=> d!108759 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!879318 d!108759))

(declare-fun b!879533 () Bool)

(declare-fun e!489457 () Bool)

(assert (=> b!879533 (= e!489457 tp_is_empty!17545)))

(declare-fun b!879534 () Bool)

(declare-fun e!489458 () Bool)

(assert (=> b!879534 (= e!489458 tp_is_empty!17545)))

(declare-fun mapIsEmpty!27945 () Bool)

(declare-fun mapRes!27945 () Bool)

(assert (=> mapIsEmpty!27945 mapRes!27945))

(declare-fun mapNonEmpty!27945 () Bool)

(declare-fun tp!53604 () Bool)

(assert (=> mapNonEmpty!27945 (= mapRes!27945 (and tp!53604 e!489457))))

(declare-fun mapValue!27945 () ValueCell!8333)

(declare-fun mapRest!27945 () (Array (_ BitVec 32) ValueCell!8333))

(declare-fun mapKey!27945 () (_ BitVec 32))

(assert (=> mapNonEmpty!27945 (= mapRest!27936 (store mapRest!27945 mapKey!27945 mapValue!27945))))

(declare-fun condMapEmpty!27945 () Bool)

(declare-fun mapDefault!27945 () ValueCell!8333)

(assert (=> mapNonEmpty!27936 (= condMapEmpty!27945 (= mapRest!27936 ((as const (Array (_ BitVec 32) ValueCell!8333)) mapDefault!27945)))))

(assert (=> mapNonEmpty!27936 (= tp!53588 (and e!489458 mapRes!27945))))

(assert (= (and mapNonEmpty!27936 condMapEmpty!27945) mapIsEmpty!27945))

(assert (= (and mapNonEmpty!27936 (not condMapEmpty!27945)) mapNonEmpty!27945))

(assert (= (and mapNonEmpty!27945 ((_ is ValueCellFull!8333) mapValue!27945)) b!879533))

(assert (= (and mapNonEmpty!27936 ((_ is ValueCellFull!8333) mapDefault!27945)) b!879534))

(declare-fun m!818799 () Bool)

(assert (=> mapNonEmpty!27945 m!818799))

(declare-fun b_lambda!12381 () Bool)

(assert (= b_lambda!12371 (or (and start!74614 b_free!15301) b_lambda!12381)))

(declare-fun b_lambda!12383 () Bool)

(assert (= b_lambda!12369 (or (and start!74614 b_free!15301) b_lambda!12383)))

(declare-fun b_lambda!12385 () Bool)

(assert (= b_lambda!12373 (or (and start!74614 b_free!15301) b_lambda!12385)))

(declare-fun b_lambda!12387 () Bool)

(assert (= b_lambda!12377 (or (and start!74614 b_free!15301) b_lambda!12387)))

(declare-fun b_lambda!12389 () Bool)

(assert (= b_lambda!12375 (or (and start!74614 b_free!15301) b_lambda!12389)))

(declare-fun b_lambda!12391 () Bool)

(assert (= b_lambda!12365 (or (and start!74614 b_free!15301) b_lambda!12391)))

(declare-fun b_lambda!12393 () Bool)

(assert (= b_lambda!12367 (or (and start!74614 b_free!15301) b_lambda!12393)))

(declare-fun b_lambda!12395 () Bool)

(assert (= b_lambda!12379 (or (and start!74614 b_free!15301) b_lambda!12395)))

(check-sat (not b_lambda!12363) (not b!879503) (not b!879438) (not b!879456) (not b!879435) (not b!879429) (not b!879500) (not bm!38846) (not b!879447) (not b!879485) (not d!108745) (not b!879460) (not b!879433) (not d!108741) (not d!108747) (not b!879480) (not b_lambda!12391) (not b_lambda!12395) (not b!879468) (not b!879467) (not b!879526) (not b!879525) (not b!879484) (not b!879491) (not b!879474) (not bm!38853) (not mapNonEmpty!27945) (not b!879472) (not b!879486) (not b_lambda!12393) (not b!879478) (not b!879455) (not b!879465) b_and!25205 (not b!879479) (not d!108739) (not b!879440) (not b!879454) (not d!108743) (not b!879520) (not bm!38855) (not b!879439) (not bm!38858) (not d!108755) (not bm!38861) (not b!879461) (not bm!38854) (not b!879516) (not b_next!15301) (not b_lambda!12385) (not bm!38852) (not b_lambda!12383) (not b!879466) tp_is_empty!17545 (not b!879434) (not b_lambda!12387) (not b!879517) (not b!879463) (not b!879489) (not b!879473) (not b!879490) (not b!879436) (not bm!38851) (not b!879477) (not b!879462) (not b!879519) (not d!108735) (not b!879475) (not b_lambda!12381) (not b!879515) (not b_lambda!12389) (not b!879487))
(check-sat b_and!25205 (not b_next!15301))
