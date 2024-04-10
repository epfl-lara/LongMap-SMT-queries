; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74856 () Bool)

(assert start!74856)

(declare-fun b_free!15405 () Bool)

(declare-fun b_next!15405 () Bool)

(assert (=> start!74856 (= b_free!15405 (not b_next!15405))))

(declare-fun tp!53914 () Bool)

(declare-fun b_and!25493 () Bool)

(assert (=> start!74856 (= tp!53914 b_and!25493)))

(declare-fun b!882519 () Bool)

(declare-fun res!599563 () Bool)

(declare-fun e!491164 () Bool)

(assert (=> b!882519 (=> (not res!599563) (not e!491164))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882519 (= res!599563 (validKeyInArray!0 k0!854))))

(declare-fun b!882520 () Bool)

(declare-fun res!599555 () Bool)

(assert (=> b!882520 (=> (not res!599555) (not e!491164))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51426 0))(
  ( (array!51427 (arr!24733 (Array (_ BitVec 32) (_ BitVec 64))) (size!25173 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51426)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!882520 (= res!599555 (and (= (select (arr!24733 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!882521 () Bool)

(declare-fun res!599554 () Bool)

(assert (=> b!882521 (=> (not res!599554) (not e!491164))))

(declare-datatypes ((List!17559 0))(
  ( (Nil!17556) (Cons!17555 (h!18686 (_ BitVec 64)) (t!24766 List!17559)) )
))
(declare-fun arrayNoDuplicates!0 (array!51426 (_ BitVec 32) List!17559) Bool)

(assert (=> b!882521 (= res!599554 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17556))))

(declare-fun mapIsEmpty!28107 () Bool)

(declare-fun mapRes!28107 () Bool)

(assert (=> mapIsEmpty!28107 mapRes!28107))

(declare-fun b!882522 () Bool)

(declare-fun e!491161 () Bool)

(declare-fun e!491165 () Bool)

(assert (=> b!882522 (= e!491161 e!491165)))

(declare-fun res!599559 () Bool)

(assert (=> b!882522 (=> res!599559 e!491165)))

(assert (=> b!882522 (= res!599559 (or (bvsge (size!25173 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25173 _keys!868)) (bvsge from!1053 (size!25173 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882522 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!30106 0))(
  ( (Unit!30107) )
))
(declare-fun lt!399293 () Unit!30106)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51426 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30106)

(assert (=> b!882522 (= lt!399293 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882522 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17556)))

(declare-fun lt!399291 () Unit!30106)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51426 (_ BitVec 32) (_ BitVec 32)) Unit!30106)

(assert (=> b!882522 (= lt!399291 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882523 () Bool)

(declare-fun res!599566 () Bool)

(assert (=> b!882523 (=> (not res!599566) (not e!491164))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28579 0))(
  ( (V!28580 (val!8872 Int)) )
))
(declare-datatypes ((ValueCell!8385 0))(
  ( (ValueCellFull!8385 (v!11336 V!28579)) (EmptyCell!8385) )
))
(declare-datatypes ((array!51428 0))(
  ( (array!51429 (arr!24734 (Array (_ BitVec 32) ValueCell!8385)) (size!25174 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51428)

(assert (=> b!882523 (= res!599566 (and (= (size!25174 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25173 _keys!868) (size!25174 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!882524 () Bool)

(declare-fun e!491159 () Bool)

(assert (=> b!882524 (= e!491159 e!491161)))

(declare-fun res!599565 () Bool)

(assert (=> b!882524 (=> res!599565 e!491161)))

(assert (=> b!882524 (= res!599565 (not (= (select (arr!24733 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((tuple2!11750 0))(
  ( (tuple2!11751 (_1!5886 (_ BitVec 64)) (_2!5886 V!28579)) )
))
(declare-datatypes ((List!17560 0))(
  ( (Nil!17557) (Cons!17556 (h!18687 tuple2!11750) (t!24767 List!17560)) )
))
(declare-datatypes ((ListLongMap!10519 0))(
  ( (ListLongMap!10520 (toList!5275 List!17560)) )
))
(declare-fun lt!399294 () ListLongMap!10519)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!399287 () ListLongMap!10519)

(declare-fun +!2545 (ListLongMap!10519 tuple2!11750) ListLongMap!10519)

(declare-fun get!13023 (ValueCell!8385 V!28579) V!28579)

(declare-fun dynLambda!1258 (Int (_ BitVec 64)) V!28579)

(assert (=> b!882524 (= lt!399294 (+!2545 lt!399287 (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882525 () Bool)

(declare-fun e!491160 () Bool)

(declare-fun e!491166 () Bool)

(assert (=> b!882525 (= e!491160 (and e!491166 mapRes!28107))))

(declare-fun condMapEmpty!28107 () Bool)

(declare-fun mapDefault!28107 () ValueCell!8385)

(assert (=> b!882525 (= condMapEmpty!28107 (= (arr!24734 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8385)) mapDefault!28107)))))

(declare-fun b!882526 () Bool)

(declare-fun e!491168 () Bool)

(assert (=> b!882526 (= e!491164 e!491168)))

(declare-fun res!599556 () Bool)

(assert (=> b!882526 (=> (not res!599556) (not e!491168))))

(assert (=> b!882526 (= res!599556 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399289 () array!51428)

(declare-fun minValue!654 () V!28579)

(declare-fun zeroValue!654 () V!28579)

(declare-fun getCurrentListMapNoExtraKeys!3236 (array!51426 array!51428 (_ BitVec 32) (_ BitVec 32) V!28579 V!28579 (_ BitVec 32) Int) ListLongMap!10519)

(assert (=> b!882526 (= lt!399294 (getCurrentListMapNoExtraKeys!3236 _keys!868 lt!399289 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28579)

(assert (=> b!882526 (= lt!399289 (array!51429 (store (arr!24734 _values!688) i!612 (ValueCellFull!8385 v!557)) (size!25174 _values!688)))))

(declare-fun lt!399286 () ListLongMap!10519)

(assert (=> b!882526 (= lt!399286 (getCurrentListMapNoExtraKeys!3236 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882527 () Bool)

(assert (=> b!882527 (= e!491168 (not e!491159))))

(declare-fun res!599561 () Bool)

(assert (=> b!882527 (=> res!599561 e!491159)))

(assert (=> b!882527 (= res!599561 (not (validKeyInArray!0 (select (arr!24733 _keys!868) from!1053))))))

(declare-fun lt!399292 () ListLongMap!10519)

(assert (=> b!882527 (= lt!399292 lt!399287)))

(declare-fun lt!399290 () ListLongMap!10519)

(assert (=> b!882527 (= lt!399287 (+!2545 lt!399290 (tuple2!11751 k0!854 v!557)))))

(assert (=> b!882527 (= lt!399292 (getCurrentListMapNoExtraKeys!3236 _keys!868 lt!399289 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882527 (= lt!399290 (getCurrentListMapNoExtraKeys!3236 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399288 () Unit!30106)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!732 (array!51426 array!51428 (_ BitVec 32) (_ BitVec 32) V!28579 V!28579 (_ BitVec 32) (_ BitVec 64) V!28579 (_ BitVec 32) Int) Unit!30106)

(assert (=> b!882527 (= lt!399288 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!732 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!599558 () Bool)

(assert (=> start!74856 (=> (not res!599558) (not e!491164))))

(assert (=> start!74856 (= res!599558 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25173 _keys!868))))))

(assert (=> start!74856 e!491164))

(declare-fun tp_is_empty!17649 () Bool)

(assert (=> start!74856 tp_is_empty!17649))

(assert (=> start!74856 true))

(assert (=> start!74856 tp!53914))

(declare-fun array_inv!19476 (array!51426) Bool)

(assert (=> start!74856 (array_inv!19476 _keys!868)))

(declare-fun array_inv!19477 (array!51428) Bool)

(assert (=> start!74856 (and (array_inv!19477 _values!688) e!491160)))

(declare-fun b!882528 () Bool)

(declare-fun res!599557 () Bool)

(assert (=> b!882528 (=> (not res!599557) (not e!491164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882528 (= res!599557 (validMask!0 mask!1196))))

(declare-fun b!882529 () Bool)

(declare-fun res!599562 () Bool)

(assert (=> b!882529 (=> res!599562 e!491165)))

(declare-fun noDuplicate!1321 (List!17559) Bool)

(assert (=> b!882529 (= res!599562 (not (noDuplicate!1321 Nil!17556)))))

(declare-fun b!882530 () Bool)

(declare-fun e!491162 () Bool)

(declare-fun contains!4270 (List!17559 (_ BitVec 64)) Bool)

(assert (=> b!882530 (= e!491162 (not (contains!4270 Nil!17556 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!28107 () Bool)

(declare-fun tp!53915 () Bool)

(declare-fun e!491163 () Bool)

(assert (=> mapNonEmpty!28107 (= mapRes!28107 (and tp!53915 e!491163))))

(declare-fun mapKey!28107 () (_ BitVec 32))

(declare-fun mapValue!28107 () ValueCell!8385)

(declare-fun mapRest!28107 () (Array (_ BitVec 32) ValueCell!8385))

(assert (=> mapNonEmpty!28107 (= (arr!24734 _values!688) (store mapRest!28107 mapKey!28107 mapValue!28107))))

(declare-fun b!882531 () Bool)

(declare-fun res!599560 () Bool)

(assert (=> b!882531 (=> (not res!599560) (not e!491164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51426 (_ BitVec 32)) Bool)

(assert (=> b!882531 (= res!599560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882532 () Bool)

(assert (=> b!882532 (= e!491163 tp_is_empty!17649)))

(declare-fun b!882533 () Bool)

(declare-fun res!599567 () Bool)

(assert (=> b!882533 (=> (not res!599567) (not e!491164))))

(assert (=> b!882533 (= res!599567 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25173 _keys!868))))))

(declare-fun b!882534 () Bool)

(assert (=> b!882534 (= e!491165 e!491162)))

(declare-fun res!599564 () Bool)

(assert (=> b!882534 (=> (not res!599564) (not e!491162))))

(assert (=> b!882534 (= res!599564 (not (contains!4270 Nil!17556 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882535 () Bool)

(assert (=> b!882535 (= e!491166 tp_is_empty!17649)))

(assert (= (and start!74856 res!599558) b!882528))

(assert (= (and b!882528 res!599557) b!882523))

(assert (= (and b!882523 res!599566) b!882531))

(assert (= (and b!882531 res!599560) b!882521))

(assert (= (and b!882521 res!599554) b!882533))

(assert (= (and b!882533 res!599567) b!882519))

(assert (= (and b!882519 res!599563) b!882520))

(assert (= (and b!882520 res!599555) b!882526))

(assert (= (and b!882526 res!599556) b!882527))

(assert (= (and b!882527 (not res!599561)) b!882524))

(assert (= (and b!882524 (not res!599565)) b!882522))

(assert (= (and b!882522 (not res!599559)) b!882529))

(assert (= (and b!882529 (not res!599562)) b!882534))

(assert (= (and b!882534 res!599564) b!882530))

(assert (= (and b!882525 condMapEmpty!28107) mapIsEmpty!28107))

(assert (= (and b!882525 (not condMapEmpty!28107)) mapNonEmpty!28107))

(get-info :version)

(assert (= (and mapNonEmpty!28107 ((_ is ValueCellFull!8385) mapValue!28107)) b!882532))

(assert (= (and b!882525 ((_ is ValueCellFull!8385) mapDefault!28107)) b!882535))

(assert (= start!74856 b!882525))

(declare-fun b_lambda!12649 () Bool)

(assert (=> (not b_lambda!12649) (not b!882524)))

(declare-fun t!24765 () Bool)

(declare-fun tb!5063 () Bool)

(assert (=> (and start!74856 (= defaultEntry!696 defaultEntry!696) t!24765) tb!5063))

(declare-fun result!9759 () Bool)

(assert (=> tb!5063 (= result!9759 tp_is_empty!17649)))

(assert (=> b!882524 t!24765))

(declare-fun b_and!25495 () Bool)

(assert (= b_and!25493 (and (=> t!24765 result!9759) b_and!25495)))

(declare-fun m!822489 () Bool)

(assert (=> b!882524 m!822489))

(declare-fun m!822491 () Bool)

(assert (=> b!882524 m!822491))

(declare-fun m!822493 () Bool)

(assert (=> b!882524 m!822493))

(declare-fun m!822495 () Bool)

(assert (=> b!882524 m!822495))

(assert (=> b!882524 m!822491))

(declare-fun m!822497 () Bool)

(assert (=> b!882524 m!822497))

(assert (=> b!882524 m!822493))

(declare-fun m!822499 () Bool)

(assert (=> b!882530 m!822499))

(declare-fun m!822501 () Bool)

(assert (=> mapNonEmpty!28107 m!822501))

(declare-fun m!822503 () Bool)

(assert (=> b!882527 m!822503))

(assert (=> b!882527 m!822497))

(declare-fun m!822505 () Bool)

(assert (=> b!882527 m!822505))

(assert (=> b!882527 m!822497))

(declare-fun m!822507 () Bool)

(assert (=> b!882527 m!822507))

(declare-fun m!822509 () Bool)

(assert (=> b!882527 m!822509))

(declare-fun m!822511 () Bool)

(assert (=> b!882527 m!822511))

(declare-fun m!822513 () Bool)

(assert (=> b!882520 m!822513))

(declare-fun m!822515 () Bool)

(assert (=> b!882529 m!822515))

(declare-fun m!822517 () Bool)

(assert (=> b!882522 m!822517))

(declare-fun m!822519 () Bool)

(assert (=> b!882522 m!822519))

(declare-fun m!822521 () Bool)

(assert (=> b!882522 m!822521))

(declare-fun m!822523 () Bool)

(assert (=> b!882522 m!822523))

(declare-fun m!822525 () Bool)

(assert (=> start!74856 m!822525))

(declare-fun m!822527 () Bool)

(assert (=> start!74856 m!822527))

(declare-fun m!822529 () Bool)

(assert (=> b!882534 m!822529))

(declare-fun m!822531 () Bool)

(assert (=> b!882519 m!822531))

(declare-fun m!822533 () Bool)

(assert (=> b!882521 m!822533))

(declare-fun m!822535 () Bool)

(assert (=> b!882528 m!822535))

(declare-fun m!822537 () Bool)

(assert (=> b!882526 m!822537))

(declare-fun m!822539 () Bool)

(assert (=> b!882526 m!822539))

(declare-fun m!822541 () Bool)

(assert (=> b!882526 m!822541))

(declare-fun m!822543 () Bool)

(assert (=> b!882531 m!822543))

(check-sat tp_is_empty!17649 (not b!882521) (not b!882524) (not b!882529) (not b!882526) (not b_next!15405) (not b_lambda!12649) (not b!882522) (not start!74856) (not b!882530) b_and!25495 (not b!882534) (not b!882519) (not b!882528) (not b!882527) (not mapNonEmpty!28107) (not b!882531))
(check-sat b_and!25495 (not b_next!15405))
(get-model)

(declare-fun b_lambda!12653 () Bool)

(assert (= b_lambda!12649 (or (and start!74856 b_free!15405) b_lambda!12653)))

(check-sat tp_is_empty!17649 (not b_lambda!12653) (not b!882521) (not b!882524) (not b!882529) (not b!882526) (not b_next!15405) (not b!882522) (not start!74856) (not b!882530) b_and!25495 (not b!882534) (not b!882519) (not b!882528) (not b!882527) (not mapNonEmpty!28107) (not b!882531))
(check-sat b_and!25495 (not b_next!15405))
(get-model)

(declare-fun b!882615 () Bool)

(declare-fun e!491216 () Bool)

(declare-fun lt!399336 () ListLongMap!10519)

(declare-fun isEmpty!671 (ListLongMap!10519) Bool)

(assert (=> b!882615 (= e!491216 (isEmpty!671 lt!399336))))

(declare-fun b!882616 () Bool)

(assert (=> b!882616 (= e!491216 (= lt!399336 (getCurrentListMapNoExtraKeys!3236 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882617 () Bool)

(declare-fun e!491218 () Bool)

(declare-fun e!491217 () Bool)

(assert (=> b!882617 (= e!491218 e!491217)))

(assert (=> b!882617 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25173 _keys!868)))))

(declare-fun res!599618 () Bool)

(declare-fun contains!4271 (ListLongMap!10519 (_ BitVec 64)) Bool)

(assert (=> b!882617 (= res!599618 (contains!4271 lt!399336 (select (arr!24733 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882617 (=> (not res!599618) (not e!491217))))

(declare-fun b!882618 () Bool)

(declare-fun lt!399342 () Unit!30106)

(declare-fun lt!399337 () Unit!30106)

(assert (=> b!882618 (= lt!399342 lt!399337)))

(declare-fun lt!399338 () (_ BitVec 64))

(declare-fun lt!399340 () (_ BitVec 64))

(declare-fun lt!399341 () V!28579)

(declare-fun lt!399339 () ListLongMap!10519)

(assert (=> b!882618 (not (contains!4271 (+!2545 lt!399339 (tuple2!11751 lt!399338 lt!399341)) lt!399340))))

(declare-fun addStillNotContains!209 (ListLongMap!10519 (_ BitVec 64) V!28579 (_ BitVec 64)) Unit!30106)

(assert (=> b!882618 (= lt!399337 (addStillNotContains!209 lt!399339 lt!399338 lt!399341 lt!399340))))

(assert (=> b!882618 (= lt!399340 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882618 (= lt!399341 (get!13023 (select (arr!24734 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882618 (= lt!399338 (select (arr!24733 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38969 () ListLongMap!10519)

(assert (=> b!882618 (= lt!399339 call!38969)))

(declare-fun e!491214 () ListLongMap!10519)

(assert (=> b!882618 (= e!491214 (+!2545 call!38969 (tuple2!11751 (select (arr!24733 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13023 (select (arr!24734 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882619 () Bool)

(declare-fun res!599621 () Bool)

(declare-fun e!491215 () Bool)

(assert (=> b!882619 (=> (not res!599621) (not e!491215))))

(assert (=> b!882619 (= res!599621 (not (contains!4271 lt!399336 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!109141 () Bool)

(assert (=> d!109141 e!491215))

(declare-fun res!599619 () Bool)

(assert (=> d!109141 (=> (not res!599619) (not e!491215))))

(assert (=> d!109141 (= res!599619 (not (contains!4271 lt!399336 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491219 () ListLongMap!10519)

(assert (=> d!109141 (= lt!399336 e!491219)))

(declare-fun c!93017 () Bool)

(assert (=> d!109141 (= c!93017 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25173 _keys!868)))))

(assert (=> d!109141 (validMask!0 mask!1196)))

(assert (=> d!109141 (= (getCurrentListMapNoExtraKeys!3236 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399336)))

(declare-fun b!882620 () Bool)

(assert (=> b!882620 (= e!491218 e!491216)))

(declare-fun c!93015 () Bool)

(assert (=> b!882620 (= c!93015 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25173 _keys!868)))))

(declare-fun b!882621 () Bool)

(assert (=> b!882621 (= e!491214 call!38969)))

(declare-fun b!882622 () Bool)

(assert (=> b!882622 (= e!491215 e!491218)))

(declare-fun c!93016 () Bool)

(declare-fun e!491213 () Bool)

(assert (=> b!882622 (= c!93016 e!491213)))

(declare-fun res!599620 () Bool)

(assert (=> b!882622 (=> (not res!599620) (not e!491213))))

(assert (=> b!882622 (= res!599620 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25173 _keys!868)))))

(declare-fun b!882623 () Bool)

(assert (=> b!882623 (= e!491213 (validKeyInArray!0 (select (arr!24733 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882623 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun bm!38966 () Bool)

(assert (=> bm!38966 (= call!38969 (getCurrentListMapNoExtraKeys!3236 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882624 () Bool)

(assert (=> b!882624 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25173 _keys!868)))))

(assert (=> b!882624 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25174 _values!688)))))

(declare-fun apply!384 (ListLongMap!10519 (_ BitVec 64)) V!28579)

(assert (=> b!882624 (= e!491217 (= (apply!384 lt!399336 (select (arr!24733 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13023 (select (arr!24734 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882625 () Bool)

(assert (=> b!882625 (= e!491219 (ListLongMap!10520 Nil!17557))))

(declare-fun b!882626 () Bool)

(assert (=> b!882626 (= e!491219 e!491214)))

(declare-fun c!93018 () Bool)

(assert (=> b!882626 (= c!93018 (validKeyInArray!0 (select (arr!24733 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (= (and d!109141 c!93017) b!882625))

(assert (= (and d!109141 (not c!93017)) b!882626))

(assert (= (and b!882626 c!93018) b!882618))

(assert (= (and b!882626 (not c!93018)) b!882621))

(assert (= (or b!882618 b!882621) bm!38966))

(assert (= (and d!109141 res!599619) b!882619))

(assert (= (and b!882619 res!599621) b!882622))

(assert (= (and b!882622 res!599620) b!882623))

(assert (= (and b!882622 c!93016) b!882617))

(assert (= (and b!882622 (not c!93016)) b!882620))

(assert (= (and b!882617 res!599618) b!882624))

(assert (= (and b!882620 c!93015) b!882616))

(assert (= (and b!882620 (not c!93015)) b!882615))

(declare-fun b_lambda!12655 () Bool)

(assert (=> (not b_lambda!12655) (not b!882618)))

(assert (=> b!882618 t!24765))

(declare-fun b_and!25501 () Bool)

(assert (= b_and!25495 (and (=> t!24765 result!9759) b_and!25501)))

(declare-fun b_lambda!12657 () Bool)

(assert (=> (not b_lambda!12657) (not b!882624)))

(assert (=> b!882624 t!24765))

(declare-fun b_and!25503 () Bool)

(assert (= b_and!25501 (and (=> t!24765 result!9759) b_and!25503)))

(declare-fun m!822601 () Bool)

(assert (=> b!882624 m!822601))

(declare-fun m!822603 () Bool)

(assert (=> b!882624 m!822603))

(declare-fun m!822605 () Bool)

(assert (=> b!882624 m!822605))

(assert (=> b!882624 m!822603))

(assert (=> b!882624 m!822493))

(assert (=> b!882624 m!822601))

(assert (=> b!882624 m!822493))

(declare-fun m!822607 () Bool)

(assert (=> b!882624 m!822607))

(declare-fun m!822609 () Bool)

(assert (=> b!882618 m!822609))

(declare-fun m!822611 () Bool)

(assert (=> b!882618 m!822611))

(assert (=> b!882618 m!822601))

(assert (=> b!882618 m!822603))

(declare-fun m!822613 () Bool)

(assert (=> b!882618 m!822613))

(declare-fun m!822615 () Bool)

(assert (=> b!882618 m!822615))

(assert (=> b!882618 m!822493))

(assert (=> b!882618 m!822609))

(assert (=> b!882618 m!822601))

(assert (=> b!882618 m!822493))

(assert (=> b!882618 m!822607))

(assert (=> b!882623 m!822603))

(assert (=> b!882623 m!822603))

(declare-fun m!822617 () Bool)

(assert (=> b!882623 m!822617))

(declare-fun m!822619 () Bool)

(assert (=> b!882615 m!822619))

(assert (=> b!882626 m!822603))

(assert (=> b!882626 m!822603))

(assert (=> b!882626 m!822617))

(declare-fun m!822621 () Bool)

(assert (=> b!882616 m!822621))

(declare-fun m!822623 () Bool)

(assert (=> d!109141 m!822623))

(assert (=> d!109141 m!822535))

(assert (=> b!882617 m!822603))

(assert (=> b!882617 m!822603))

(declare-fun m!822625 () Bool)

(assert (=> b!882617 m!822625))

(declare-fun m!822627 () Bool)

(assert (=> b!882619 m!822627))

(assert (=> bm!38966 m!822621))

(assert (=> b!882527 d!109141))

(declare-fun d!109143 () Bool)

(assert (=> d!109143 (= (validKeyInArray!0 (select (arr!24733 _keys!868) from!1053)) (and (not (= (select (arr!24733 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24733 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!882527 d!109143))

(declare-fun b!882633 () Bool)

(declare-fun e!491225 () Bool)

(declare-fun call!38974 () ListLongMap!10519)

(declare-fun call!38975 () ListLongMap!10519)

(assert (=> b!882633 (= e!491225 (= call!38974 call!38975))))

(declare-fun bm!38971 () Bool)

(assert (=> bm!38971 (= call!38974 (getCurrentListMapNoExtraKeys!3236 _keys!868 (array!51429 (store (arr!24734 _values!688) i!612 (ValueCellFull!8385 v!557)) (size!25174 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882634 () Bool)

(declare-fun e!491224 () Bool)

(assert (=> b!882634 (= e!491224 e!491225)))

(declare-fun c!93021 () Bool)

(assert (=> b!882634 (= c!93021 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun b!882635 () Bool)

(assert (=> b!882635 (= e!491225 (= call!38974 (+!2545 call!38975 (tuple2!11751 k0!854 v!557))))))

(declare-fun d!109145 () Bool)

(assert (=> d!109145 e!491224))

(declare-fun res!599624 () Bool)

(assert (=> d!109145 (=> (not res!599624) (not e!491224))))

(assert (=> d!109145 (= res!599624 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25174 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25174 _values!688))))))))

(declare-fun lt!399345 () Unit!30106)

(declare-fun choose!1440 (array!51426 array!51428 (_ BitVec 32) (_ BitVec 32) V!28579 V!28579 (_ BitVec 32) (_ BitVec 64) V!28579 (_ BitVec 32) Int) Unit!30106)

(assert (=> d!109145 (= lt!399345 (choose!1440 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109145 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25173 _keys!868)))))

(assert (=> d!109145 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!732 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399345)))

(declare-fun bm!38972 () Bool)

(assert (=> bm!38972 (= call!38975 (getCurrentListMapNoExtraKeys!3236 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!109145 res!599624) b!882634))

(assert (= (and b!882634 c!93021) b!882635))

(assert (= (and b!882634 (not c!93021)) b!882633))

(assert (= (or b!882635 b!882633) bm!38972))

(assert (= (or b!882635 b!882633) bm!38971))

(assert (=> bm!38971 m!822539))

(declare-fun m!822629 () Bool)

(assert (=> bm!38971 m!822629))

(declare-fun m!822631 () Bool)

(assert (=> b!882635 m!822631))

(declare-fun m!822633 () Bool)

(assert (=> d!109145 m!822633))

(assert (=> bm!38972 m!822511))

(assert (=> b!882527 d!109145))

(declare-fun d!109147 () Bool)

(declare-fun e!491228 () Bool)

(assert (=> d!109147 e!491228))

(declare-fun res!599629 () Bool)

(assert (=> d!109147 (=> (not res!599629) (not e!491228))))

(declare-fun lt!399357 () ListLongMap!10519)

(assert (=> d!109147 (= res!599629 (contains!4271 lt!399357 (_1!5886 (tuple2!11751 k0!854 v!557))))))

(declare-fun lt!399355 () List!17560)

(assert (=> d!109147 (= lt!399357 (ListLongMap!10520 lt!399355))))

(declare-fun lt!399354 () Unit!30106)

(declare-fun lt!399356 () Unit!30106)

(assert (=> d!109147 (= lt!399354 lt!399356)))

(declare-datatypes ((Option!432 0))(
  ( (Some!431 (v!11342 V!28579)) (None!430) )
))
(declare-fun getValueByKey!426 (List!17560 (_ BitVec 64)) Option!432)

(assert (=> d!109147 (= (getValueByKey!426 lt!399355 (_1!5886 (tuple2!11751 k0!854 v!557))) (Some!431 (_2!5886 (tuple2!11751 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!240 (List!17560 (_ BitVec 64) V!28579) Unit!30106)

(assert (=> d!109147 (= lt!399356 (lemmaContainsTupThenGetReturnValue!240 lt!399355 (_1!5886 (tuple2!11751 k0!854 v!557)) (_2!5886 (tuple2!11751 k0!854 v!557))))))

(declare-fun insertStrictlySorted!279 (List!17560 (_ BitVec 64) V!28579) List!17560)

(assert (=> d!109147 (= lt!399355 (insertStrictlySorted!279 (toList!5275 lt!399290) (_1!5886 (tuple2!11751 k0!854 v!557)) (_2!5886 (tuple2!11751 k0!854 v!557))))))

(assert (=> d!109147 (= (+!2545 lt!399290 (tuple2!11751 k0!854 v!557)) lt!399357)))

(declare-fun b!882640 () Bool)

(declare-fun res!599630 () Bool)

(assert (=> b!882640 (=> (not res!599630) (not e!491228))))

(assert (=> b!882640 (= res!599630 (= (getValueByKey!426 (toList!5275 lt!399357) (_1!5886 (tuple2!11751 k0!854 v!557))) (Some!431 (_2!5886 (tuple2!11751 k0!854 v!557)))))))

(declare-fun b!882641 () Bool)

(declare-fun contains!4272 (List!17560 tuple2!11750) Bool)

(assert (=> b!882641 (= e!491228 (contains!4272 (toList!5275 lt!399357) (tuple2!11751 k0!854 v!557)))))

(assert (= (and d!109147 res!599629) b!882640))

(assert (= (and b!882640 res!599630) b!882641))

(declare-fun m!822635 () Bool)

(assert (=> d!109147 m!822635))

(declare-fun m!822637 () Bool)

(assert (=> d!109147 m!822637))

(declare-fun m!822639 () Bool)

(assert (=> d!109147 m!822639))

(declare-fun m!822641 () Bool)

(assert (=> d!109147 m!822641))

(declare-fun m!822643 () Bool)

(assert (=> b!882640 m!822643))

(declare-fun m!822645 () Bool)

(assert (=> b!882641 m!822645))

(assert (=> b!882527 d!109147))

(declare-fun b!882642 () Bool)

(declare-fun e!491232 () Bool)

(declare-fun lt!399358 () ListLongMap!10519)

(assert (=> b!882642 (= e!491232 (isEmpty!671 lt!399358))))

(declare-fun b!882643 () Bool)

(assert (=> b!882643 (= e!491232 (= lt!399358 (getCurrentListMapNoExtraKeys!3236 _keys!868 lt!399289 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882644 () Bool)

(declare-fun e!491234 () Bool)

(declare-fun e!491233 () Bool)

(assert (=> b!882644 (= e!491234 e!491233)))

(assert (=> b!882644 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25173 _keys!868)))))

(declare-fun res!599631 () Bool)

(assert (=> b!882644 (= res!599631 (contains!4271 lt!399358 (select (arr!24733 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882644 (=> (not res!599631) (not e!491233))))

(declare-fun b!882645 () Bool)

(declare-fun lt!399364 () Unit!30106)

(declare-fun lt!399359 () Unit!30106)

(assert (=> b!882645 (= lt!399364 lt!399359)))

(declare-fun lt!399362 () (_ BitVec 64))

(declare-fun lt!399361 () ListLongMap!10519)

(declare-fun lt!399360 () (_ BitVec 64))

(declare-fun lt!399363 () V!28579)

(assert (=> b!882645 (not (contains!4271 (+!2545 lt!399361 (tuple2!11751 lt!399360 lt!399363)) lt!399362))))

(assert (=> b!882645 (= lt!399359 (addStillNotContains!209 lt!399361 lt!399360 lt!399363 lt!399362))))

(assert (=> b!882645 (= lt!399362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882645 (= lt!399363 (get!13023 (select (arr!24734 lt!399289) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882645 (= lt!399360 (select (arr!24733 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38976 () ListLongMap!10519)

(assert (=> b!882645 (= lt!399361 call!38976)))

(declare-fun e!491230 () ListLongMap!10519)

(assert (=> b!882645 (= e!491230 (+!2545 call!38976 (tuple2!11751 (select (arr!24733 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13023 (select (arr!24734 lt!399289) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882646 () Bool)

(declare-fun res!599634 () Bool)

(declare-fun e!491231 () Bool)

(assert (=> b!882646 (=> (not res!599634) (not e!491231))))

(assert (=> b!882646 (= res!599634 (not (contains!4271 lt!399358 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!109149 () Bool)

(assert (=> d!109149 e!491231))

(declare-fun res!599632 () Bool)

(assert (=> d!109149 (=> (not res!599632) (not e!491231))))

(assert (=> d!109149 (= res!599632 (not (contains!4271 lt!399358 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491235 () ListLongMap!10519)

(assert (=> d!109149 (= lt!399358 e!491235)))

(declare-fun c!93024 () Bool)

(assert (=> d!109149 (= c!93024 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25173 _keys!868)))))

(assert (=> d!109149 (validMask!0 mask!1196)))

(assert (=> d!109149 (= (getCurrentListMapNoExtraKeys!3236 _keys!868 lt!399289 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399358)))

(declare-fun b!882647 () Bool)

(assert (=> b!882647 (= e!491234 e!491232)))

(declare-fun c!93022 () Bool)

(assert (=> b!882647 (= c!93022 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25173 _keys!868)))))

(declare-fun b!882648 () Bool)

(assert (=> b!882648 (= e!491230 call!38976)))

(declare-fun b!882649 () Bool)

(assert (=> b!882649 (= e!491231 e!491234)))

(declare-fun c!93023 () Bool)

(declare-fun e!491229 () Bool)

(assert (=> b!882649 (= c!93023 e!491229)))

(declare-fun res!599633 () Bool)

(assert (=> b!882649 (=> (not res!599633) (not e!491229))))

(assert (=> b!882649 (= res!599633 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25173 _keys!868)))))

(declare-fun b!882650 () Bool)

(assert (=> b!882650 (= e!491229 (validKeyInArray!0 (select (arr!24733 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882650 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun bm!38973 () Bool)

(assert (=> bm!38973 (= call!38976 (getCurrentListMapNoExtraKeys!3236 _keys!868 lt!399289 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882651 () Bool)

(assert (=> b!882651 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25173 _keys!868)))))

(assert (=> b!882651 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25174 lt!399289)))))

(assert (=> b!882651 (= e!491233 (= (apply!384 lt!399358 (select (arr!24733 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13023 (select (arr!24734 lt!399289) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882652 () Bool)

(assert (=> b!882652 (= e!491235 (ListLongMap!10520 Nil!17557))))

(declare-fun b!882653 () Bool)

(assert (=> b!882653 (= e!491235 e!491230)))

(declare-fun c!93025 () Bool)

(assert (=> b!882653 (= c!93025 (validKeyInArray!0 (select (arr!24733 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (= (and d!109149 c!93024) b!882652))

(assert (= (and d!109149 (not c!93024)) b!882653))

(assert (= (and b!882653 c!93025) b!882645))

(assert (= (and b!882653 (not c!93025)) b!882648))

(assert (= (or b!882645 b!882648) bm!38973))

(assert (= (and d!109149 res!599632) b!882646))

(assert (= (and b!882646 res!599634) b!882649))

(assert (= (and b!882649 res!599633) b!882650))

(assert (= (and b!882649 c!93023) b!882644))

(assert (= (and b!882649 (not c!93023)) b!882647))

(assert (= (and b!882644 res!599631) b!882651))

(assert (= (and b!882647 c!93022) b!882643))

(assert (= (and b!882647 (not c!93022)) b!882642))

(declare-fun b_lambda!12659 () Bool)

(assert (=> (not b_lambda!12659) (not b!882645)))

(assert (=> b!882645 t!24765))

(declare-fun b_and!25505 () Bool)

(assert (= b_and!25503 (and (=> t!24765 result!9759) b_and!25505)))

(declare-fun b_lambda!12661 () Bool)

(assert (=> (not b_lambda!12661) (not b!882651)))

(assert (=> b!882651 t!24765))

(declare-fun b_and!25507 () Bool)

(assert (= b_and!25505 (and (=> t!24765 result!9759) b_and!25507)))

(declare-fun m!822647 () Bool)

(assert (=> b!882651 m!822647))

(assert (=> b!882651 m!822603))

(declare-fun m!822649 () Bool)

(assert (=> b!882651 m!822649))

(assert (=> b!882651 m!822603))

(assert (=> b!882651 m!822493))

(assert (=> b!882651 m!822647))

(assert (=> b!882651 m!822493))

(declare-fun m!822651 () Bool)

(assert (=> b!882651 m!822651))

(declare-fun m!822653 () Bool)

(assert (=> b!882645 m!822653))

(declare-fun m!822655 () Bool)

(assert (=> b!882645 m!822655))

(assert (=> b!882645 m!822647))

(assert (=> b!882645 m!822603))

(declare-fun m!822657 () Bool)

(assert (=> b!882645 m!822657))

(declare-fun m!822659 () Bool)

(assert (=> b!882645 m!822659))

(assert (=> b!882645 m!822493))

(assert (=> b!882645 m!822653))

(assert (=> b!882645 m!822647))

(assert (=> b!882645 m!822493))

(assert (=> b!882645 m!822651))

(assert (=> b!882650 m!822603))

(assert (=> b!882650 m!822603))

(assert (=> b!882650 m!822617))

(declare-fun m!822661 () Bool)

(assert (=> b!882642 m!822661))

(assert (=> b!882653 m!822603))

(assert (=> b!882653 m!822603))

(assert (=> b!882653 m!822617))

(declare-fun m!822663 () Bool)

(assert (=> b!882643 m!822663))

(declare-fun m!822665 () Bool)

(assert (=> d!109149 m!822665))

(assert (=> d!109149 m!822535))

(assert (=> b!882644 m!822603))

(assert (=> b!882644 m!822603))

(declare-fun m!822667 () Bool)

(assert (=> b!882644 m!822667))

(declare-fun m!822669 () Bool)

(assert (=> b!882646 m!822669))

(assert (=> bm!38973 m!822663))

(assert (=> b!882527 d!109149))

(declare-fun b!882654 () Bool)

(declare-fun e!491239 () Bool)

(declare-fun lt!399365 () ListLongMap!10519)

(assert (=> b!882654 (= e!491239 (isEmpty!671 lt!399365))))

(declare-fun b!882655 () Bool)

(assert (=> b!882655 (= e!491239 (= lt!399365 (getCurrentListMapNoExtraKeys!3236 _keys!868 lt!399289 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882656 () Bool)

(declare-fun e!491241 () Bool)

(declare-fun e!491240 () Bool)

(assert (=> b!882656 (= e!491241 e!491240)))

(assert (=> b!882656 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25173 _keys!868)))))

(declare-fun res!599635 () Bool)

(assert (=> b!882656 (= res!599635 (contains!4271 lt!399365 (select (arr!24733 _keys!868) from!1053)))))

(assert (=> b!882656 (=> (not res!599635) (not e!491240))))

(declare-fun b!882657 () Bool)

(declare-fun lt!399371 () Unit!30106)

(declare-fun lt!399366 () Unit!30106)

(assert (=> b!882657 (= lt!399371 lt!399366)))

(declare-fun lt!399369 () (_ BitVec 64))

(declare-fun lt!399368 () ListLongMap!10519)

(declare-fun lt!399370 () V!28579)

(declare-fun lt!399367 () (_ BitVec 64))

(assert (=> b!882657 (not (contains!4271 (+!2545 lt!399368 (tuple2!11751 lt!399367 lt!399370)) lt!399369))))

(assert (=> b!882657 (= lt!399366 (addStillNotContains!209 lt!399368 lt!399367 lt!399370 lt!399369))))

(assert (=> b!882657 (= lt!399369 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882657 (= lt!399370 (get!13023 (select (arr!24734 lt!399289) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882657 (= lt!399367 (select (arr!24733 _keys!868) from!1053))))

(declare-fun call!38977 () ListLongMap!10519)

(assert (=> b!882657 (= lt!399368 call!38977)))

(declare-fun e!491237 () ListLongMap!10519)

(assert (=> b!882657 (= e!491237 (+!2545 call!38977 (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 lt!399289) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882658 () Bool)

(declare-fun res!599638 () Bool)

(declare-fun e!491238 () Bool)

(assert (=> b!882658 (=> (not res!599638) (not e!491238))))

(assert (=> b!882658 (= res!599638 (not (contains!4271 lt!399365 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!109151 () Bool)

(assert (=> d!109151 e!491238))

(declare-fun res!599636 () Bool)

(assert (=> d!109151 (=> (not res!599636) (not e!491238))))

(assert (=> d!109151 (= res!599636 (not (contains!4271 lt!399365 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491242 () ListLongMap!10519)

(assert (=> d!109151 (= lt!399365 e!491242)))

(declare-fun c!93028 () Bool)

(assert (=> d!109151 (= c!93028 (bvsge from!1053 (size!25173 _keys!868)))))

(assert (=> d!109151 (validMask!0 mask!1196)))

(assert (=> d!109151 (= (getCurrentListMapNoExtraKeys!3236 _keys!868 lt!399289 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!399365)))

(declare-fun b!882659 () Bool)

(assert (=> b!882659 (= e!491241 e!491239)))

(declare-fun c!93026 () Bool)

(assert (=> b!882659 (= c!93026 (bvslt from!1053 (size!25173 _keys!868)))))

(declare-fun b!882660 () Bool)

(assert (=> b!882660 (= e!491237 call!38977)))

(declare-fun b!882661 () Bool)

(assert (=> b!882661 (= e!491238 e!491241)))

(declare-fun c!93027 () Bool)

(declare-fun e!491236 () Bool)

(assert (=> b!882661 (= c!93027 e!491236)))

(declare-fun res!599637 () Bool)

(assert (=> b!882661 (=> (not res!599637) (not e!491236))))

(assert (=> b!882661 (= res!599637 (bvslt from!1053 (size!25173 _keys!868)))))

(declare-fun b!882662 () Bool)

(assert (=> b!882662 (= e!491236 (validKeyInArray!0 (select (arr!24733 _keys!868) from!1053)))))

(assert (=> b!882662 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun bm!38974 () Bool)

(assert (=> bm!38974 (= call!38977 (getCurrentListMapNoExtraKeys!3236 _keys!868 lt!399289 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882663 () Bool)

(assert (=> b!882663 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25173 _keys!868)))))

(assert (=> b!882663 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25174 lt!399289)))))

(assert (=> b!882663 (= e!491240 (= (apply!384 lt!399365 (select (arr!24733 _keys!868) from!1053)) (get!13023 (select (arr!24734 lt!399289) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882664 () Bool)

(assert (=> b!882664 (= e!491242 (ListLongMap!10520 Nil!17557))))

(declare-fun b!882665 () Bool)

(assert (=> b!882665 (= e!491242 e!491237)))

(declare-fun c!93029 () Bool)

(assert (=> b!882665 (= c!93029 (validKeyInArray!0 (select (arr!24733 _keys!868) from!1053)))))

(assert (= (and d!109151 c!93028) b!882664))

(assert (= (and d!109151 (not c!93028)) b!882665))

(assert (= (and b!882665 c!93029) b!882657))

(assert (= (and b!882665 (not c!93029)) b!882660))

(assert (= (or b!882657 b!882660) bm!38974))

(assert (= (and d!109151 res!599636) b!882658))

(assert (= (and b!882658 res!599638) b!882661))

(assert (= (and b!882661 res!599637) b!882662))

(assert (= (and b!882661 c!93027) b!882656))

(assert (= (and b!882661 (not c!93027)) b!882659))

(assert (= (and b!882656 res!599635) b!882663))

(assert (= (and b!882659 c!93026) b!882655))

(assert (= (and b!882659 (not c!93026)) b!882654))

(declare-fun b_lambda!12663 () Bool)

(assert (=> (not b_lambda!12663) (not b!882657)))

(assert (=> b!882657 t!24765))

(declare-fun b_and!25509 () Bool)

(assert (= b_and!25507 (and (=> t!24765 result!9759) b_and!25509)))

(declare-fun b_lambda!12665 () Bool)

(assert (=> (not b_lambda!12665) (not b!882663)))

(assert (=> b!882663 t!24765))

(declare-fun b_and!25511 () Bool)

(assert (= b_and!25509 (and (=> t!24765 result!9759) b_and!25511)))

(declare-fun m!822671 () Bool)

(assert (=> b!882663 m!822671))

(assert (=> b!882663 m!822497))

(declare-fun m!822673 () Bool)

(assert (=> b!882663 m!822673))

(assert (=> b!882663 m!822497))

(assert (=> b!882663 m!822493))

(assert (=> b!882663 m!822671))

(assert (=> b!882663 m!822493))

(declare-fun m!822675 () Bool)

(assert (=> b!882663 m!822675))

(declare-fun m!822677 () Bool)

(assert (=> b!882657 m!822677))

(declare-fun m!822679 () Bool)

(assert (=> b!882657 m!822679))

(assert (=> b!882657 m!822671))

(assert (=> b!882657 m!822497))

(declare-fun m!822681 () Bool)

(assert (=> b!882657 m!822681))

(declare-fun m!822683 () Bool)

(assert (=> b!882657 m!822683))

(assert (=> b!882657 m!822493))

(assert (=> b!882657 m!822677))

(assert (=> b!882657 m!822671))

(assert (=> b!882657 m!822493))

(assert (=> b!882657 m!822675))

(assert (=> b!882662 m!822497))

(assert (=> b!882662 m!822497))

(assert (=> b!882662 m!822505))

(declare-fun m!822685 () Bool)

(assert (=> b!882654 m!822685))

(assert (=> b!882665 m!822497))

(assert (=> b!882665 m!822497))

(assert (=> b!882665 m!822505))

(declare-fun m!822687 () Bool)

(assert (=> b!882655 m!822687))

(declare-fun m!822689 () Bool)

(assert (=> d!109151 m!822689))

(assert (=> d!109151 m!822535))

(assert (=> b!882656 m!822497))

(assert (=> b!882656 m!822497))

(declare-fun m!822691 () Bool)

(assert (=> b!882656 m!822691))

(declare-fun m!822693 () Bool)

(assert (=> b!882658 m!822693))

(assert (=> bm!38974 m!822687))

(assert (=> b!882526 d!109151))

(declare-fun b!882666 () Bool)

(declare-fun e!491246 () Bool)

(declare-fun lt!399372 () ListLongMap!10519)

(assert (=> b!882666 (= e!491246 (isEmpty!671 lt!399372))))

(declare-fun b!882667 () Bool)

(assert (=> b!882667 (= e!491246 (= lt!399372 (getCurrentListMapNoExtraKeys!3236 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882668 () Bool)

(declare-fun e!491248 () Bool)

(declare-fun e!491247 () Bool)

(assert (=> b!882668 (= e!491248 e!491247)))

(assert (=> b!882668 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25173 _keys!868)))))

(declare-fun res!599639 () Bool)

(assert (=> b!882668 (= res!599639 (contains!4271 lt!399372 (select (arr!24733 _keys!868) from!1053)))))

(assert (=> b!882668 (=> (not res!599639) (not e!491247))))

(declare-fun b!882669 () Bool)

(declare-fun lt!399378 () Unit!30106)

(declare-fun lt!399373 () Unit!30106)

(assert (=> b!882669 (= lt!399378 lt!399373)))

(declare-fun lt!399376 () (_ BitVec 64))

(declare-fun lt!399377 () V!28579)

(declare-fun lt!399375 () ListLongMap!10519)

(declare-fun lt!399374 () (_ BitVec 64))

(assert (=> b!882669 (not (contains!4271 (+!2545 lt!399375 (tuple2!11751 lt!399374 lt!399377)) lt!399376))))

(assert (=> b!882669 (= lt!399373 (addStillNotContains!209 lt!399375 lt!399374 lt!399377 lt!399376))))

(assert (=> b!882669 (= lt!399376 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882669 (= lt!399377 (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882669 (= lt!399374 (select (arr!24733 _keys!868) from!1053))))

(declare-fun call!38978 () ListLongMap!10519)

(assert (=> b!882669 (= lt!399375 call!38978)))

(declare-fun e!491244 () ListLongMap!10519)

(assert (=> b!882669 (= e!491244 (+!2545 call!38978 (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882670 () Bool)

(declare-fun res!599642 () Bool)

(declare-fun e!491245 () Bool)

(assert (=> b!882670 (=> (not res!599642) (not e!491245))))

(assert (=> b!882670 (= res!599642 (not (contains!4271 lt!399372 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!109153 () Bool)

(assert (=> d!109153 e!491245))

(declare-fun res!599640 () Bool)

(assert (=> d!109153 (=> (not res!599640) (not e!491245))))

(assert (=> d!109153 (= res!599640 (not (contains!4271 lt!399372 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!491249 () ListLongMap!10519)

(assert (=> d!109153 (= lt!399372 e!491249)))

(declare-fun c!93032 () Bool)

(assert (=> d!109153 (= c!93032 (bvsge from!1053 (size!25173 _keys!868)))))

(assert (=> d!109153 (validMask!0 mask!1196)))

(assert (=> d!109153 (= (getCurrentListMapNoExtraKeys!3236 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!399372)))

(declare-fun b!882671 () Bool)

(assert (=> b!882671 (= e!491248 e!491246)))

(declare-fun c!93030 () Bool)

(assert (=> b!882671 (= c!93030 (bvslt from!1053 (size!25173 _keys!868)))))

(declare-fun b!882672 () Bool)

(assert (=> b!882672 (= e!491244 call!38978)))

(declare-fun b!882673 () Bool)

(assert (=> b!882673 (= e!491245 e!491248)))

(declare-fun c!93031 () Bool)

(declare-fun e!491243 () Bool)

(assert (=> b!882673 (= c!93031 e!491243)))

(declare-fun res!599641 () Bool)

(assert (=> b!882673 (=> (not res!599641) (not e!491243))))

(assert (=> b!882673 (= res!599641 (bvslt from!1053 (size!25173 _keys!868)))))

(declare-fun b!882674 () Bool)

(assert (=> b!882674 (= e!491243 (validKeyInArray!0 (select (arr!24733 _keys!868) from!1053)))))

(assert (=> b!882674 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun bm!38975 () Bool)

(assert (=> bm!38975 (= call!38978 (getCurrentListMapNoExtraKeys!3236 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882675 () Bool)

(assert (=> b!882675 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25173 _keys!868)))))

(assert (=> b!882675 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25174 _values!688)))))

(assert (=> b!882675 (= e!491247 (= (apply!384 lt!399372 (select (arr!24733 _keys!868) from!1053)) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882676 () Bool)

(assert (=> b!882676 (= e!491249 (ListLongMap!10520 Nil!17557))))

(declare-fun b!882677 () Bool)

(assert (=> b!882677 (= e!491249 e!491244)))

(declare-fun c!93033 () Bool)

(assert (=> b!882677 (= c!93033 (validKeyInArray!0 (select (arr!24733 _keys!868) from!1053)))))

(assert (= (and d!109153 c!93032) b!882676))

(assert (= (and d!109153 (not c!93032)) b!882677))

(assert (= (and b!882677 c!93033) b!882669))

(assert (= (and b!882677 (not c!93033)) b!882672))

(assert (= (or b!882669 b!882672) bm!38975))

(assert (= (and d!109153 res!599640) b!882670))

(assert (= (and b!882670 res!599642) b!882673))

(assert (= (and b!882673 res!599641) b!882674))

(assert (= (and b!882673 c!93031) b!882668))

(assert (= (and b!882673 (not c!93031)) b!882671))

(assert (= (and b!882668 res!599639) b!882675))

(assert (= (and b!882671 c!93030) b!882667))

(assert (= (and b!882671 (not c!93030)) b!882666))

(declare-fun b_lambda!12667 () Bool)

(assert (=> (not b_lambda!12667) (not b!882669)))

(assert (=> b!882669 t!24765))

(declare-fun b_and!25513 () Bool)

(assert (= b_and!25511 (and (=> t!24765 result!9759) b_and!25513)))

(declare-fun b_lambda!12669 () Bool)

(assert (=> (not b_lambda!12669) (not b!882675)))

(assert (=> b!882675 t!24765))

(declare-fun b_and!25515 () Bool)

(assert (= b_and!25513 (and (=> t!24765 result!9759) b_and!25515)))

(assert (=> b!882675 m!822491))

(assert (=> b!882675 m!822497))

(declare-fun m!822695 () Bool)

(assert (=> b!882675 m!822695))

(assert (=> b!882675 m!822497))

(assert (=> b!882675 m!822493))

(assert (=> b!882675 m!822491))

(assert (=> b!882675 m!822493))

(assert (=> b!882675 m!822495))

(declare-fun m!822697 () Bool)

(assert (=> b!882669 m!822697))

(declare-fun m!822699 () Bool)

(assert (=> b!882669 m!822699))

(assert (=> b!882669 m!822491))

(assert (=> b!882669 m!822497))

(declare-fun m!822701 () Bool)

(assert (=> b!882669 m!822701))

(declare-fun m!822703 () Bool)

(assert (=> b!882669 m!822703))

(assert (=> b!882669 m!822493))

(assert (=> b!882669 m!822697))

(assert (=> b!882669 m!822491))

(assert (=> b!882669 m!822493))

(assert (=> b!882669 m!822495))

(assert (=> b!882674 m!822497))

(assert (=> b!882674 m!822497))

(assert (=> b!882674 m!822505))

(declare-fun m!822705 () Bool)

(assert (=> b!882666 m!822705))

(assert (=> b!882677 m!822497))

(assert (=> b!882677 m!822497))

(assert (=> b!882677 m!822505))

(declare-fun m!822707 () Bool)

(assert (=> b!882667 m!822707))

(declare-fun m!822709 () Bool)

(assert (=> d!109153 m!822709))

(assert (=> d!109153 m!822535))

(assert (=> b!882668 m!822497))

(assert (=> b!882668 m!822497))

(declare-fun m!822711 () Bool)

(assert (=> b!882668 m!822711))

(declare-fun m!822713 () Bool)

(assert (=> b!882670 m!822713))

(assert (=> bm!38975 m!822707))

(assert (=> b!882526 d!109153))

(declare-fun d!109155 () Bool)

(declare-fun lt!399381 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!393 (List!17559) (InoxSet (_ BitVec 64)))

(assert (=> d!109155 (= lt!399381 (select (content!393 Nil!17556) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!491255 () Bool)

(assert (=> d!109155 (= lt!399381 e!491255)))

(declare-fun res!599648 () Bool)

(assert (=> d!109155 (=> (not res!599648) (not e!491255))))

(assert (=> d!109155 (= res!599648 ((_ is Cons!17555) Nil!17556))))

(assert (=> d!109155 (= (contains!4270 Nil!17556 #b1000000000000000000000000000000000000000000000000000000000000000) lt!399381)))

(declare-fun b!882682 () Bool)

(declare-fun e!491254 () Bool)

(assert (=> b!882682 (= e!491255 e!491254)))

(declare-fun res!599647 () Bool)

(assert (=> b!882682 (=> res!599647 e!491254)))

(assert (=> b!882682 (= res!599647 (= (h!18686 Nil!17556) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!882683 () Bool)

(assert (=> b!882683 (= e!491254 (contains!4270 (t!24766 Nil!17556) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!109155 res!599648) b!882682))

(assert (= (and b!882682 (not res!599647)) b!882683))

(declare-fun m!822715 () Bool)

(assert (=> d!109155 m!822715))

(declare-fun m!822717 () Bool)

(assert (=> d!109155 m!822717))

(declare-fun m!822719 () Bool)

(assert (=> b!882683 m!822719))

(assert (=> b!882530 d!109155))

(declare-fun d!109157 () Bool)

(declare-fun res!599653 () Bool)

(declare-fun e!491260 () Bool)

(assert (=> d!109157 (=> res!599653 e!491260)))

(assert (=> d!109157 (= res!599653 ((_ is Nil!17556) Nil!17556))))

(assert (=> d!109157 (= (noDuplicate!1321 Nil!17556) e!491260)))

(declare-fun b!882688 () Bool)

(declare-fun e!491261 () Bool)

(assert (=> b!882688 (= e!491260 e!491261)))

(declare-fun res!599654 () Bool)

(assert (=> b!882688 (=> (not res!599654) (not e!491261))))

(assert (=> b!882688 (= res!599654 (not (contains!4270 (t!24766 Nil!17556) (h!18686 Nil!17556))))))

(declare-fun b!882689 () Bool)

(assert (=> b!882689 (= e!491261 (noDuplicate!1321 (t!24766 Nil!17556)))))

(assert (= (and d!109157 (not res!599653)) b!882688))

(assert (= (and b!882688 res!599654) b!882689))

(declare-fun m!822721 () Bool)

(assert (=> b!882688 m!822721))

(declare-fun m!822723 () Bool)

(assert (=> b!882689 m!822723))

(assert (=> b!882529 d!109157))

(declare-fun d!109159 () Bool)

(assert (=> d!109159 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!882519 d!109159))

(declare-fun d!109161 () Bool)

(assert (=> d!109161 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!882528 d!109161))

(declare-fun d!109163 () Bool)

(declare-fun res!599659 () Bool)

(declare-fun e!491266 () Bool)

(assert (=> d!109163 (=> res!599659 e!491266)))

(assert (=> d!109163 (= res!599659 (= (select (arr!24733 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) k0!854))))

(assert (=> d!109163 (= (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053)) e!491266)))

(declare-fun b!882694 () Bool)

(declare-fun e!491267 () Bool)

(assert (=> b!882694 (= e!491266 e!491267)))

(declare-fun res!599660 () Bool)

(assert (=> b!882694 (=> (not res!599660) (not e!491267))))

(assert (=> b!882694 (= res!599660 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!25173 _keys!868)))))

(declare-fun b!882695 () Bool)

(assert (=> b!882695 (= e!491267 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (= (and d!109163 (not res!599659)) b!882694))

(assert (= (and b!882694 res!599660) b!882695))

(assert (=> d!109163 m!822603))

(declare-fun m!822725 () Bool)

(assert (=> b!882695 m!822725))

(assert (=> b!882522 d!109163))

(declare-fun d!109165 () Bool)

(assert (=> d!109165 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399384 () Unit!30106)

(declare-fun choose!114 (array!51426 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30106)

(assert (=> d!109165 (= lt!399384 (choose!114 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> d!109165 (bvsge i!612 #b00000000000000000000000000000000)))

(assert (=> d!109165 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)) lt!399384)))

(declare-fun bs!24747 () Bool)

(assert (= bs!24747 d!109165))

(assert (=> bs!24747 m!822517))

(declare-fun m!822727 () Bool)

(assert (=> bs!24747 m!822727))

(assert (=> b!882522 d!109165))

(declare-fun b!882706 () Bool)

(declare-fun e!491276 () Bool)

(assert (=> b!882706 (= e!491276 (contains!4270 Nil!17556 (select (arr!24733 _keys!868) from!1053)))))

(declare-fun b!882707 () Bool)

(declare-fun e!491277 () Bool)

(declare-fun e!491278 () Bool)

(assert (=> b!882707 (= e!491277 e!491278)))

(declare-fun res!599669 () Bool)

(assert (=> b!882707 (=> (not res!599669) (not e!491278))))

(assert (=> b!882707 (= res!599669 (not e!491276))))

(declare-fun res!599668 () Bool)

(assert (=> b!882707 (=> (not res!599668) (not e!491276))))

(assert (=> b!882707 (= res!599668 (validKeyInArray!0 (select (arr!24733 _keys!868) from!1053)))))

(declare-fun d!109167 () Bool)

(declare-fun res!599667 () Bool)

(assert (=> d!109167 (=> res!599667 e!491277)))

(assert (=> d!109167 (= res!599667 (bvsge from!1053 (size!25173 _keys!868)))))

(assert (=> d!109167 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17556) e!491277)))

(declare-fun b!882708 () Bool)

(declare-fun e!491279 () Bool)

(declare-fun call!38981 () Bool)

(assert (=> b!882708 (= e!491279 call!38981)))

(declare-fun b!882709 () Bool)

(assert (=> b!882709 (= e!491279 call!38981)))

(declare-fun b!882710 () Bool)

(assert (=> b!882710 (= e!491278 e!491279)))

(declare-fun c!93036 () Bool)

(assert (=> b!882710 (= c!93036 (validKeyInArray!0 (select (arr!24733 _keys!868) from!1053)))))

(declare-fun bm!38978 () Bool)

(assert (=> bm!38978 (= call!38981 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!93036 (Cons!17555 (select (arr!24733 _keys!868) from!1053) Nil!17556) Nil!17556)))))

(assert (= (and d!109167 (not res!599667)) b!882707))

(assert (= (and b!882707 res!599668) b!882706))

(assert (= (and b!882707 res!599669) b!882710))

(assert (= (and b!882710 c!93036) b!882708))

(assert (= (and b!882710 (not c!93036)) b!882709))

(assert (= (or b!882708 b!882709) bm!38978))

(assert (=> b!882706 m!822497))

(assert (=> b!882706 m!822497))

(declare-fun m!822729 () Bool)

(assert (=> b!882706 m!822729))

(assert (=> b!882707 m!822497))

(assert (=> b!882707 m!822497))

(assert (=> b!882707 m!822505))

(assert (=> b!882710 m!822497))

(assert (=> b!882710 m!822497))

(assert (=> b!882710 m!822505))

(assert (=> bm!38978 m!822497))

(declare-fun m!822731 () Bool)

(assert (=> bm!38978 m!822731))

(assert (=> b!882522 d!109167))

(declare-fun d!109169 () Bool)

(assert (=> d!109169 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17556)))

(declare-fun lt!399387 () Unit!30106)

(declare-fun choose!39 (array!51426 (_ BitVec 32) (_ BitVec 32)) Unit!30106)

(assert (=> d!109169 (= lt!399387 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!109169 (bvslt (size!25173 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109169 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!399387)))

(declare-fun bs!24748 () Bool)

(assert (= bs!24748 d!109169))

(assert (=> bs!24748 m!822521))

(declare-fun m!822733 () Bool)

(assert (=> bs!24748 m!822733))

(assert (=> b!882522 d!109169))

(declare-fun d!109171 () Bool)

(declare-fun res!599674 () Bool)

(declare-fun e!491286 () Bool)

(assert (=> d!109171 (=> res!599674 e!491286)))

(assert (=> d!109171 (= res!599674 (bvsge #b00000000000000000000000000000000 (size!25173 _keys!868)))))

(assert (=> d!109171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!491286)))

(declare-fun bm!38981 () Bool)

(declare-fun call!38984 () Bool)

(assert (=> bm!38981 (= call!38984 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!882719 () Bool)

(declare-fun e!491287 () Bool)

(assert (=> b!882719 (= e!491286 e!491287)))

(declare-fun c!93039 () Bool)

(assert (=> b!882719 (= c!93039 (validKeyInArray!0 (select (arr!24733 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882720 () Bool)

(declare-fun e!491288 () Bool)

(assert (=> b!882720 (= e!491287 e!491288)))

(declare-fun lt!399394 () (_ BitVec 64))

(assert (=> b!882720 (= lt!399394 (select (arr!24733 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!399396 () Unit!30106)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51426 (_ BitVec 64) (_ BitVec 32)) Unit!30106)

(assert (=> b!882720 (= lt!399396 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!399394 #b00000000000000000000000000000000))))

(assert (=> b!882720 (arrayContainsKey!0 _keys!868 lt!399394 #b00000000000000000000000000000000)))

(declare-fun lt!399395 () Unit!30106)

(assert (=> b!882720 (= lt!399395 lt!399396)))

(declare-fun res!599675 () Bool)

(declare-datatypes ((SeekEntryResult!8760 0))(
  ( (MissingZero!8760 (index!37411 (_ BitVec 32))) (Found!8760 (index!37412 (_ BitVec 32))) (Intermediate!8760 (undefined!9572 Bool) (index!37413 (_ BitVec 32)) (x!74810 (_ BitVec 32))) (Undefined!8760) (MissingVacant!8760 (index!37414 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51426 (_ BitVec 32)) SeekEntryResult!8760)

(assert (=> b!882720 (= res!599675 (= (seekEntryOrOpen!0 (select (arr!24733 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8760 #b00000000000000000000000000000000)))))

(assert (=> b!882720 (=> (not res!599675) (not e!491288))))

(declare-fun b!882721 () Bool)

(assert (=> b!882721 (= e!491287 call!38984)))

(declare-fun b!882722 () Bool)

(assert (=> b!882722 (= e!491288 call!38984)))

(assert (= (and d!109171 (not res!599674)) b!882719))

(assert (= (and b!882719 c!93039) b!882720))

(assert (= (and b!882719 (not c!93039)) b!882721))

(assert (= (and b!882720 res!599675) b!882722))

(assert (= (or b!882722 b!882721) bm!38981))

(declare-fun m!822735 () Bool)

(assert (=> bm!38981 m!822735))

(declare-fun m!822737 () Bool)

(assert (=> b!882719 m!822737))

(assert (=> b!882719 m!822737))

(declare-fun m!822739 () Bool)

(assert (=> b!882719 m!822739))

(assert (=> b!882720 m!822737))

(declare-fun m!822741 () Bool)

(assert (=> b!882720 m!822741))

(declare-fun m!822743 () Bool)

(assert (=> b!882720 m!822743))

(assert (=> b!882720 m!822737))

(declare-fun m!822745 () Bool)

(assert (=> b!882720 m!822745))

(assert (=> b!882531 d!109171))

(declare-fun b!882723 () Bool)

(declare-fun e!491289 () Bool)

(assert (=> b!882723 (= e!491289 (contains!4270 Nil!17556 (select (arr!24733 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882724 () Bool)

(declare-fun e!491290 () Bool)

(declare-fun e!491291 () Bool)

(assert (=> b!882724 (= e!491290 e!491291)))

(declare-fun res!599678 () Bool)

(assert (=> b!882724 (=> (not res!599678) (not e!491291))))

(assert (=> b!882724 (= res!599678 (not e!491289))))

(declare-fun res!599677 () Bool)

(assert (=> b!882724 (=> (not res!599677) (not e!491289))))

(assert (=> b!882724 (= res!599677 (validKeyInArray!0 (select (arr!24733 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!109173 () Bool)

(declare-fun res!599676 () Bool)

(assert (=> d!109173 (=> res!599676 e!491290)))

(assert (=> d!109173 (= res!599676 (bvsge #b00000000000000000000000000000000 (size!25173 _keys!868)))))

(assert (=> d!109173 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17556) e!491290)))

(declare-fun b!882725 () Bool)

(declare-fun e!491292 () Bool)

(declare-fun call!38985 () Bool)

(assert (=> b!882725 (= e!491292 call!38985)))

(declare-fun b!882726 () Bool)

(assert (=> b!882726 (= e!491292 call!38985)))

(declare-fun b!882727 () Bool)

(assert (=> b!882727 (= e!491291 e!491292)))

(declare-fun c!93040 () Bool)

(assert (=> b!882727 (= c!93040 (validKeyInArray!0 (select (arr!24733 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38982 () Bool)

(assert (=> bm!38982 (= call!38985 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93040 (Cons!17555 (select (arr!24733 _keys!868) #b00000000000000000000000000000000) Nil!17556) Nil!17556)))))

(assert (= (and d!109173 (not res!599676)) b!882724))

(assert (= (and b!882724 res!599677) b!882723))

(assert (= (and b!882724 res!599678) b!882727))

(assert (= (and b!882727 c!93040) b!882725))

(assert (= (and b!882727 (not c!93040)) b!882726))

(assert (= (or b!882725 b!882726) bm!38982))

(assert (=> b!882723 m!822737))

(assert (=> b!882723 m!822737))

(declare-fun m!822747 () Bool)

(assert (=> b!882723 m!822747))

(assert (=> b!882724 m!822737))

(assert (=> b!882724 m!822737))

(assert (=> b!882724 m!822739))

(assert (=> b!882727 m!822737))

(assert (=> b!882727 m!822737))

(assert (=> b!882727 m!822739))

(assert (=> bm!38982 m!822737))

(declare-fun m!822749 () Bool)

(assert (=> bm!38982 m!822749))

(assert (=> b!882521 d!109173))

(declare-fun d!109175 () Bool)

(assert (=> d!109175 (= (array_inv!19476 _keys!868) (bvsge (size!25173 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74856 d!109175))

(declare-fun d!109177 () Bool)

(assert (=> d!109177 (= (array_inv!19477 _values!688) (bvsge (size!25174 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74856 d!109177))

(declare-fun d!109179 () Bool)

(declare-fun lt!399397 () Bool)

(assert (=> d!109179 (= lt!399397 (select (content!393 Nil!17556) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!491294 () Bool)

(assert (=> d!109179 (= lt!399397 e!491294)))

(declare-fun res!599680 () Bool)

(assert (=> d!109179 (=> (not res!599680) (not e!491294))))

(assert (=> d!109179 (= res!599680 ((_ is Cons!17555) Nil!17556))))

(assert (=> d!109179 (= (contains!4270 Nil!17556 #b0000000000000000000000000000000000000000000000000000000000000000) lt!399397)))

(declare-fun b!882728 () Bool)

(declare-fun e!491293 () Bool)

(assert (=> b!882728 (= e!491294 e!491293)))

(declare-fun res!599679 () Bool)

(assert (=> b!882728 (=> res!599679 e!491293)))

(assert (=> b!882728 (= res!599679 (= (h!18686 Nil!17556) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!882729 () Bool)

(assert (=> b!882729 (= e!491293 (contains!4270 (t!24766 Nil!17556) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!109179 res!599680) b!882728))

(assert (= (and b!882728 (not res!599679)) b!882729))

(assert (=> d!109179 m!822715))

(declare-fun m!822751 () Bool)

(assert (=> d!109179 m!822751))

(declare-fun m!822753 () Bool)

(assert (=> b!882729 m!822753))

(assert (=> b!882534 d!109179))

(declare-fun d!109181 () Bool)

(declare-fun e!491295 () Bool)

(assert (=> d!109181 e!491295))

(declare-fun res!599681 () Bool)

(assert (=> d!109181 (=> (not res!599681) (not e!491295))))

(declare-fun lt!399401 () ListLongMap!10519)

(assert (=> d!109181 (= res!599681 (contains!4271 lt!399401 (_1!5886 (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!399399 () List!17560)

(assert (=> d!109181 (= lt!399401 (ListLongMap!10520 lt!399399))))

(declare-fun lt!399398 () Unit!30106)

(declare-fun lt!399400 () Unit!30106)

(assert (=> d!109181 (= lt!399398 lt!399400)))

(assert (=> d!109181 (= (getValueByKey!426 lt!399399 (_1!5886 (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!431 (_2!5886 (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109181 (= lt!399400 (lemmaContainsTupThenGetReturnValue!240 lt!399399 (_1!5886 (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5886 (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109181 (= lt!399399 (insertStrictlySorted!279 (toList!5275 lt!399287) (_1!5886 (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5886 (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109181 (= (+!2545 lt!399287 (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!399401)))

(declare-fun b!882730 () Bool)

(declare-fun res!599682 () Bool)

(assert (=> b!882730 (=> (not res!599682) (not e!491295))))

(assert (=> b!882730 (= res!599682 (= (getValueByKey!426 (toList!5275 lt!399401) (_1!5886 (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!431 (_2!5886 (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!882731 () Bool)

(assert (=> b!882731 (= e!491295 (contains!4272 (toList!5275 lt!399401) (tuple2!11751 (select (arr!24733 _keys!868) from!1053) (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109181 res!599681) b!882730))

(assert (= (and b!882730 res!599682) b!882731))

(declare-fun m!822755 () Bool)

(assert (=> d!109181 m!822755))

(declare-fun m!822757 () Bool)

(assert (=> d!109181 m!822757))

(declare-fun m!822759 () Bool)

(assert (=> d!109181 m!822759))

(declare-fun m!822761 () Bool)

(assert (=> d!109181 m!822761))

(declare-fun m!822763 () Bool)

(assert (=> b!882730 m!822763))

(declare-fun m!822765 () Bool)

(assert (=> b!882731 m!822765))

(assert (=> b!882524 d!109181))

(declare-fun d!109183 () Bool)

(declare-fun c!93043 () Bool)

(assert (=> d!109183 (= c!93043 ((_ is ValueCellFull!8385) (select (arr!24734 _values!688) from!1053)))))

(declare-fun e!491298 () V!28579)

(assert (=> d!109183 (= (get!13023 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!491298)))

(declare-fun b!882736 () Bool)

(declare-fun get!13024 (ValueCell!8385 V!28579) V!28579)

(assert (=> b!882736 (= e!491298 (get!13024 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882737 () Bool)

(declare-fun get!13025 (ValueCell!8385 V!28579) V!28579)

(assert (=> b!882737 (= e!491298 (get!13025 (select (arr!24734 _values!688) from!1053) (dynLambda!1258 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109183 c!93043) b!882736))

(assert (= (and d!109183 (not c!93043)) b!882737))

(assert (=> b!882736 m!822491))

(assert (=> b!882736 m!822493))

(declare-fun m!822767 () Bool)

(assert (=> b!882736 m!822767))

(assert (=> b!882737 m!822491))

(assert (=> b!882737 m!822493))

(declare-fun m!822769 () Bool)

(assert (=> b!882737 m!822769))

(assert (=> b!882524 d!109183))

(declare-fun b!882745 () Bool)

(declare-fun e!491303 () Bool)

(assert (=> b!882745 (= e!491303 tp_is_empty!17649)))

(declare-fun mapNonEmpty!28113 () Bool)

(declare-fun mapRes!28113 () Bool)

(declare-fun tp!53924 () Bool)

(declare-fun e!491304 () Bool)

(assert (=> mapNonEmpty!28113 (= mapRes!28113 (and tp!53924 e!491304))))

(declare-fun mapKey!28113 () (_ BitVec 32))

(declare-fun mapValue!28113 () ValueCell!8385)

(declare-fun mapRest!28113 () (Array (_ BitVec 32) ValueCell!8385))

(assert (=> mapNonEmpty!28113 (= mapRest!28107 (store mapRest!28113 mapKey!28113 mapValue!28113))))

(declare-fun mapIsEmpty!28113 () Bool)

(assert (=> mapIsEmpty!28113 mapRes!28113))

(declare-fun b!882744 () Bool)

(assert (=> b!882744 (= e!491304 tp_is_empty!17649)))

(declare-fun condMapEmpty!28113 () Bool)

(declare-fun mapDefault!28113 () ValueCell!8385)

(assert (=> mapNonEmpty!28107 (= condMapEmpty!28113 (= mapRest!28107 ((as const (Array (_ BitVec 32) ValueCell!8385)) mapDefault!28113)))))

(assert (=> mapNonEmpty!28107 (= tp!53915 (and e!491303 mapRes!28113))))

(assert (= (and mapNonEmpty!28107 condMapEmpty!28113) mapIsEmpty!28113))

(assert (= (and mapNonEmpty!28107 (not condMapEmpty!28113)) mapNonEmpty!28113))

(assert (= (and mapNonEmpty!28113 ((_ is ValueCellFull!8385) mapValue!28113)) b!882744))

(assert (= (and mapNonEmpty!28107 ((_ is ValueCellFull!8385) mapDefault!28113)) b!882745))

(declare-fun m!822771 () Bool)

(assert (=> mapNonEmpty!28113 m!822771))

(declare-fun b_lambda!12671 () Bool)

(assert (= b_lambda!12667 (or (and start!74856 b_free!15405) b_lambda!12671)))

(declare-fun b_lambda!12673 () Bool)

(assert (= b_lambda!12657 (or (and start!74856 b_free!15405) b_lambda!12673)))

(declare-fun b_lambda!12675 () Bool)

(assert (= b_lambda!12663 (or (and start!74856 b_free!15405) b_lambda!12675)))

(declare-fun b_lambda!12677 () Bool)

(assert (= b_lambda!12655 (or (and start!74856 b_free!15405) b_lambda!12677)))

(declare-fun b_lambda!12679 () Bool)

(assert (= b_lambda!12659 (or (and start!74856 b_free!15405) b_lambda!12679)))

(declare-fun b_lambda!12681 () Bool)

(assert (= b_lambda!12665 (or (and start!74856 b_free!15405) b_lambda!12681)))

(declare-fun b_lambda!12683 () Bool)

(assert (= b_lambda!12669 (or (and start!74856 b_free!15405) b_lambda!12683)))

(declare-fun b_lambda!12685 () Bool)

(assert (= b_lambda!12661 (or (and start!74856 b_free!15405) b_lambda!12685)))

(check-sat (not b!882641) (not b_lambda!12679) (not b!882706) (not b!882719) (not d!109165) (not b_lambda!12677) (not b!882618) (not b_lambda!12673) (not b!882737) (not b!882675) (not b!882724) (not d!109147) tp_is_empty!17649 (not b!882736) (not b!882668) (not b_lambda!12671) (not bm!38981) (not b!882644) (not b!882707) (not b!882729) (not b!882666) (not d!109181) (not b!882655) (not b_lambda!12653) (not b!882635) (not bm!38972) (not b!882688) (not b!882663) (not bm!38973) (not b!882667) (not b!882642) (not b!882677) (not b!882645) (not b!882651) (not b!882674) (not d!109141) (not b!882626) (not bm!38971) (not b!882710) (not b!882665) (not d!109179) (not b!882670) (not b!882650) (not bm!38982) (not b!882669) (not bm!38966) (not d!109151) (not b!882683) (not b!882727) (not b!882653) (not d!109153) (not b!882615) (not b!882624) (not b_lambda!12681) (not b!882695) (not b!882623) b_and!25515 (not b_lambda!12683) (not b_lambda!12675) (not b!882730) (not b!882643) (not b!882640) (not b!882657) (not b!882658) (not b!882662) (not b!882723) (not d!109169) (not d!109149) (not d!109145) (not b!882689) (not mapNonEmpty!28113) (not bm!38975) (not b!882656) (not bm!38978) (not b!882654) (not b!882646) (not b_next!15405) (not b!882720) (not b!882731) (not bm!38974) (not b!882617) (not b!882619) (not b_lambda!12685) (not d!109155) (not b!882616))
(check-sat b_and!25515 (not b_next!15405))
