; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78482 () Bool)

(assert start!78482)

(declare-fun mapIsEmpty!30576 () Bool)

(declare-fun mapRes!30576 () Bool)

(assert (=> mapIsEmpty!30576 mapRes!30576))

(declare-fun b!915092 () Bool)

(declare-fun e!513489 () Bool)

(declare-datatypes ((List!18360 0))(
  ( (Nil!18357) (Cons!18356 (h!19502 (_ BitVec 64)) (t!25973 List!18360)) )
))
(declare-fun contains!4702 (List!18360 (_ BitVec 64)) Bool)

(assert (=> b!915092 (= e!513489 (contains!4702 Nil!18357 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!915093 () Bool)

(declare-fun res!617025 () Bool)

(declare-fun e!513494 () Bool)

(assert (=> b!915093 (=> (not res!617025) (not e!513494))))

(declare-datatypes ((array!54428 0))(
  ( (array!54429 (arr!26160 (Array (_ BitVec 32) (_ BitVec 64))) (size!26619 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54428)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54428 (_ BitVec 32)) Bool)

(assert (=> b!915093 (= res!617025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915094 () Bool)

(declare-fun res!617027 () Bool)

(assert (=> b!915094 (=> (not res!617027) (not e!513494))))

(declare-fun noDuplicate!1330 (List!18360) Bool)

(assert (=> b!915094 (= res!617027 (noDuplicate!1330 Nil!18357))))

(declare-fun res!617030 () Bool)

(assert (=> start!78482 (=> (not res!617030) (not e!513494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78482 (= res!617030 (validMask!0 mask!1881))))

(assert (=> start!78482 e!513494))

(assert (=> start!78482 true))

(declare-datatypes ((V!30585 0))(
  ( (V!30586 (val!9658 Int)) )
))
(declare-datatypes ((ValueCell!9126 0))(
  ( (ValueCellFull!9126 (v!12175 V!30585)) (EmptyCell!9126) )
))
(declare-datatypes ((array!54430 0))(
  ( (array!54431 (arr!26161 (Array (_ BitVec 32) ValueCell!9126)) (size!26620 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54430)

(declare-fun e!513493 () Bool)

(declare-fun array_inv!20424 (array!54430) Bool)

(assert (=> start!78482 (and (array_inv!20424 _values!1231) e!513493)))

(declare-fun array_inv!20425 (array!54428) Bool)

(assert (=> start!78482 (array_inv!20425 _keys!1487)))

(declare-fun b!915095 () Bool)

(declare-fun res!617029 () Bool)

(assert (=> b!915095 (=> (not res!617029) (not e!513494))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915095 (= res!617029 (and (= (size!26620 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26619 _keys!1487) (size!26620 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915096 () Bool)

(declare-fun e!513491 () Bool)

(assert (=> b!915096 (= e!513493 (and e!513491 mapRes!30576))))

(declare-fun condMapEmpty!30576 () Bool)

(declare-fun mapDefault!30576 () ValueCell!9126)

(assert (=> b!915096 (= condMapEmpty!30576 (= (arr!26161 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9126)) mapDefault!30576)))))

(declare-fun b!915097 () Bool)

(declare-fun e!513490 () Bool)

(declare-fun tp_is_empty!19215 () Bool)

(assert (=> b!915097 (= e!513490 tp_is_empty!19215)))

(declare-fun b!915098 () Bool)

(assert (=> b!915098 (= e!513491 tp_is_empty!19215)))

(declare-fun b!915099 () Bool)

(declare-fun res!617028 () Bool)

(assert (=> b!915099 (=> (not res!617028) (not e!513494))))

(assert (=> b!915099 (= res!617028 (and (bvsle #b00000000000000000000000000000000 (size!26619 _keys!1487)) (bvslt (size!26619 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!30576 () Bool)

(declare-fun tp!58643 () Bool)

(assert (=> mapNonEmpty!30576 (= mapRes!30576 (and tp!58643 e!513490))))

(declare-fun mapKey!30576 () (_ BitVec 32))

(declare-fun mapValue!30576 () ValueCell!9126)

(declare-fun mapRest!30576 () (Array (_ BitVec 32) ValueCell!9126))

(assert (=> mapNonEmpty!30576 (= (arr!26161 _values!1231) (store mapRest!30576 mapKey!30576 mapValue!30576))))

(declare-fun b!915100 () Bool)

(assert (=> b!915100 (= e!513494 e!513489)))

(declare-fun res!617026 () Bool)

(assert (=> b!915100 (=> res!617026 e!513489)))

(assert (=> b!915100 (= res!617026 (contains!4702 Nil!18357 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!78482 res!617030) b!915095))

(assert (= (and b!915095 res!617029) b!915093))

(assert (= (and b!915093 res!617025) b!915099))

(assert (= (and b!915099 res!617028) b!915094))

(assert (= (and b!915094 res!617027) b!915100))

(assert (= (and b!915100 (not res!617026)) b!915092))

(assert (= (and b!915096 condMapEmpty!30576) mapIsEmpty!30576))

(assert (= (and b!915096 (not condMapEmpty!30576)) mapNonEmpty!30576))

(get-info :version)

(assert (= (and mapNonEmpty!30576 ((_ is ValueCellFull!9126) mapValue!30576)) b!915097))

(assert (= (and b!915096 ((_ is ValueCellFull!9126) mapDefault!30576)) b!915098))

(assert (= start!78482 b!915096))

(declare-fun m!849579 () Bool)

(assert (=> start!78482 m!849579))

(declare-fun m!849581 () Bool)

(assert (=> start!78482 m!849581))

(declare-fun m!849583 () Bool)

(assert (=> start!78482 m!849583))

(declare-fun m!849585 () Bool)

(assert (=> b!915094 m!849585))

(declare-fun m!849587 () Bool)

(assert (=> mapNonEmpty!30576 m!849587))

(declare-fun m!849589 () Bool)

(assert (=> b!915092 m!849589))

(declare-fun m!849591 () Bool)

(assert (=> b!915100 m!849591))

(declare-fun m!849593 () Bool)

(assert (=> b!915093 m!849593))

(check-sat tp_is_empty!19215 (not mapNonEmpty!30576) (not b!915093) (not b!915094) (not b!915092) (not start!78482) (not b!915100))
(check-sat)
(get-model)

(declare-fun d!112737 () Bool)

(assert (=> d!112737 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78482 d!112737))

(declare-fun d!112739 () Bool)

(assert (=> d!112739 (= (array_inv!20424 _values!1231) (bvsge (size!26620 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78482 d!112739))

(declare-fun d!112741 () Bool)

(assert (=> d!112741 (= (array_inv!20425 _keys!1487) (bvsge (size!26619 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78482 d!112741))

(declare-fun d!112743 () Bool)

(declare-fun res!617053 () Bool)

(declare-fun e!513517 () Bool)

(assert (=> d!112743 (=> res!617053 e!513517)))

(assert (=> d!112743 (= res!617053 ((_ is Nil!18357) Nil!18357))))

(assert (=> d!112743 (= (noDuplicate!1330 Nil!18357) e!513517)))

(declare-fun b!915132 () Bool)

(declare-fun e!513518 () Bool)

(assert (=> b!915132 (= e!513517 e!513518)))

(declare-fun res!617054 () Bool)

(assert (=> b!915132 (=> (not res!617054) (not e!513518))))

(assert (=> b!915132 (= res!617054 (not (contains!4702 (t!25973 Nil!18357) (h!19502 Nil!18357))))))

(declare-fun b!915133 () Bool)

(assert (=> b!915133 (= e!513518 (noDuplicate!1330 (t!25973 Nil!18357)))))

(assert (= (and d!112743 (not res!617053)) b!915132))

(assert (= (and b!915132 res!617054) b!915133))

(declare-fun m!849611 () Bool)

(assert (=> b!915132 m!849611))

(declare-fun m!849613 () Bool)

(assert (=> b!915133 m!849613))

(assert (=> b!915094 d!112743))

(declare-fun d!112745 () Bool)

(declare-fun lt!411615 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!405 (List!18360) (InoxSet (_ BitVec 64)))

(assert (=> d!112745 (= lt!411615 (select (content!405 Nil!18357) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!513524 () Bool)

(assert (=> d!112745 (= lt!411615 e!513524)))

(declare-fun res!617059 () Bool)

(assert (=> d!112745 (=> (not res!617059) (not e!513524))))

(assert (=> d!112745 (= res!617059 ((_ is Cons!18356) Nil!18357))))

(assert (=> d!112745 (= (contains!4702 Nil!18357 #b0000000000000000000000000000000000000000000000000000000000000000) lt!411615)))

(declare-fun b!915138 () Bool)

(declare-fun e!513523 () Bool)

(assert (=> b!915138 (= e!513524 e!513523)))

(declare-fun res!617060 () Bool)

(assert (=> b!915138 (=> res!617060 e!513523)))

(assert (=> b!915138 (= res!617060 (= (h!19502 Nil!18357) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!915139 () Bool)

(assert (=> b!915139 (= e!513523 (contains!4702 (t!25973 Nil!18357) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!112745 res!617059) b!915138))

(assert (= (and b!915138 (not res!617060)) b!915139))

(declare-fun m!849615 () Bool)

(assert (=> d!112745 m!849615))

(declare-fun m!849617 () Bool)

(assert (=> d!112745 m!849617))

(declare-fun m!849619 () Bool)

(assert (=> b!915139 m!849619))

(assert (=> b!915100 d!112745))

(declare-fun b!915148 () Bool)

(declare-fun e!513532 () Bool)

(declare-fun e!513533 () Bool)

(assert (=> b!915148 (= e!513532 e!513533)))

(declare-fun c!96051 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!915148 (= c!96051 (validKeyInArray!0 (select (arr!26160 _keys!1487) #b00000000000000000000000000000000)))))

(declare-fun bm!40546 () Bool)

(declare-fun call!40549 () Bool)

(assert (=> bm!40546 (= call!40549 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1487 mask!1881))))

(declare-fun b!915149 () Bool)

(declare-fun e!513531 () Bool)

(assert (=> b!915149 (= e!513533 e!513531)))

(declare-fun lt!411622 () (_ BitVec 64))

(assert (=> b!915149 (= lt!411622 (select (arr!26160 _keys!1487) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30968 0))(
  ( (Unit!30969) )
))
(declare-fun lt!411623 () Unit!30968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!54428 (_ BitVec 64) (_ BitVec 32)) Unit!30968)

(assert (=> b!915149 (= lt!411623 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1487 lt!411622 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!54428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!915149 (arrayContainsKey!0 _keys!1487 lt!411622 #b00000000000000000000000000000000)))

(declare-fun lt!411624 () Unit!30968)

(assert (=> b!915149 (= lt!411624 lt!411623)))

(declare-fun res!617065 () Bool)

(declare-datatypes ((SeekEntryResult!8975 0))(
  ( (MissingZero!8975 (index!38271 (_ BitVec 32))) (Found!8975 (index!38272 (_ BitVec 32))) (Intermediate!8975 (undefined!9787 Bool) (index!38273 (_ BitVec 32)) (x!78290 (_ BitVec 32))) (Undefined!8975) (MissingVacant!8975 (index!38274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!54428 (_ BitVec 32)) SeekEntryResult!8975)

(assert (=> b!915149 (= res!617065 (= (seekEntryOrOpen!0 (select (arr!26160 _keys!1487) #b00000000000000000000000000000000) _keys!1487 mask!1881) (Found!8975 #b00000000000000000000000000000000)))))

(assert (=> b!915149 (=> (not res!617065) (not e!513531))))

(declare-fun b!915150 () Bool)

(assert (=> b!915150 (= e!513533 call!40549)))

(declare-fun d!112747 () Bool)

(declare-fun res!617066 () Bool)

(assert (=> d!112747 (=> res!617066 e!513532)))

(assert (=> d!112747 (= res!617066 (bvsge #b00000000000000000000000000000000 (size!26619 _keys!1487)))))

(assert (=> d!112747 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881) e!513532)))

(declare-fun b!915151 () Bool)

(assert (=> b!915151 (= e!513531 call!40549)))

(assert (= (and d!112747 (not res!617066)) b!915148))

(assert (= (and b!915148 c!96051) b!915149))

(assert (= (and b!915148 (not c!96051)) b!915150))

(assert (= (and b!915149 res!617065) b!915151))

(assert (= (or b!915151 b!915150) bm!40546))

(declare-fun m!849621 () Bool)

(assert (=> b!915148 m!849621))

(assert (=> b!915148 m!849621))

(declare-fun m!849623 () Bool)

(assert (=> b!915148 m!849623))

(declare-fun m!849625 () Bool)

(assert (=> bm!40546 m!849625))

(assert (=> b!915149 m!849621))

(declare-fun m!849627 () Bool)

(assert (=> b!915149 m!849627))

(declare-fun m!849629 () Bool)

(assert (=> b!915149 m!849629))

(assert (=> b!915149 m!849621))

(declare-fun m!849631 () Bool)

(assert (=> b!915149 m!849631))

(assert (=> b!915093 d!112747))

(declare-fun d!112749 () Bool)

(declare-fun lt!411625 () Bool)

(assert (=> d!112749 (= lt!411625 (select (content!405 Nil!18357) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!513535 () Bool)

(assert (=> d!112749 (= lt!411625 e!513535)))

(declare-fun res!617067 () Bool)

(assert (=> d!112749 (=> (not res!617067) (not e!513535))))

(assert (=> d!112749 (= res!617067 ((_ is Cons!18356) Nil!18357))))

(assert (=> d!112749 (= (contains!4702 Nil!18357 #b1000000000000000000000000000000000000000000000000000000000000000) lt!411625)))

(declare-fun b!915152 () Bool)

(declare-fun e!513534 () Bool)

(assert (=> b!915152 (= e!513535 e!513534)))

(declare-fun res!617068 () Bool)

(assert (=> b!915152 (=> res!617068 e!513534)))

(assert (=> b!915152 (= res!617068 (= (h!19502 Nil!18357) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!915153 () Bool)

(assert (=> b!915153 (= e!513534 (contains!4702 (t!25973 Nil!18357) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!112749 res!617067) b!915152))

(assert (= (and b!915152 (not res!617068)) b!915153))

(assert (=> d!112749 m!849615))

(declare-fun m!849633 () Bool)

(assert (=> d!112749 m!849633))

(declare-fun m!849635 () Bool)

(assert (=> b!915153 m!849635))

(assert (=> b!915092 d!112749))

(declare-fun mapIsEmpty!30582 () Bool)

(declare-fun mapRes!30582 () Bool)

(assert (=> mapIsEmpty!30582 mapRes!30582))

(declare-fun condMapEmpty!30582 () Bool)

(declare-fun mapDefault!30582 () ValueCell!9126)

(assert (=> mapNonEmpty!30576 (= condMapEmpty!30582 (= mapRest!30576 ((as const (Array (_ BitVec 32) ValueCell!9126)) mapDefault!30582)))))

(declare-fun e!513540 () Bool)

(assert (=> mapNonEmpty!30576 (= tp!58643 (and e!513540 mapRes!30582))))

(declare-fun mapNonEmpty!30582 () Bool)

(declare-fun tp!58649 () Bool)

(declare-fun e!513541 () Bool)

(assert (=> mapNonEmpty!30582 (= mapRes!30582 (and tp!58649 e!513541))))

(declare-fun mapValue!30582 () ValueCell!9126)

(declare-fun mapKey!30582 () (_ BitVec 32))

(declare-fun mapRest!30582 () (Array (_ BitVec 32) ValueCell!9126))

(assert (=> mapNonEmpty!30582 (= mapRest!30576 (store mapRest!30582 mapKey!30582 mapValue!30582))))

(declare-fun b!915161 () Bool)

(assert (=> b!915161 (= e!513540 tp_is_empty!19215)))

(declare-fun b!915160 () Bool)

(assert (=> b!915160 (= e!513541 tp_is_empty!19215)))

(assert (= (and mapNonEmpty!30576 condMapEmpty!30582) mapIsEmpty!30582))

(assert (= (and mapNonEmpty!30576 (not condMapEmpty!30582)) mapNonEmpty!30582))

(assert (= (and mapNonEmpty!30582 ((_ is ValueCellFull!9126) mapValue!30582)) b!915160))

(assert (= (and mapNonEmpty!30576 ((_ is ValueCellFull!9126) mapDefault!30582)) b!915161))

(declare-fun m!849637 () Bool)

(assert (=> mapNonEmpty!30582 m!849637))

(check-sat (not b!915153) (not b!915133) (not b!915149) tp_is_empty!19215 (not bm!40546) (not mapNonEmpty!30582) (not b!915132) (not b!915148) (not d!112745) (not d!112749) (not b!915139))
(check-sat)
