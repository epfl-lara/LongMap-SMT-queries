; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43168 () Bool)

(assert start!43168)

(declare-fun mapIsEmpty!22045 () Bool)

(declare-fun mapRes!22045 () Bool)

(assert (=> mapIsEmpty!22045 mapRes!22045))

(declare-fun b!478560 () Bool)

(declare-fun e!281381 () Bool)

(declare-fun e!281384 () Bool)

(assert (=> b!478560 (= e!281381 e!281384)))

(declare-fun res!285523 () Bool)

(assert (=> b!478560 (=> res!285523 e!281384)))

(declare-datatypes ((List!9062 0))(
  ( (Nil!9059) (Cons!9058 (h!9914 (_ BitVec 64)) (t!15268 List!9062)) )
))
(declare-fun contains!2581 (List!9062 (_ BitVec 64)) Bool)

(assert (=> b!478560 (= res!285523 (contains!2581 Nil!9059 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!478561 () Bool)

(declare-fun e!281386 () Bool)

(declare-fun tp_is_empty!13569 () Bool)

(assert (=> b!478561 (= e!281386 tp_is_empty!13569)))

(declare-fun b!478562 () Bool)

(declare-fun res!285522 () Bool)

(assert (=> b!478562 (=> (not res!285522) (not e!281381))))

(declare-datatypes ((array!30813 0))(
  ( (array!30814 (arr!14815 (Array (_ BitVec 32) (_ BitVec 64))) (size!15173 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30813)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30813 (_ BitVec 32)) Bool)

(assert (=> b!478562 (= res!285522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478563 () Bool)

(declare-fun res!285519 () Bool)

(assert (=> b!478563 (=> (not res!285519) (not e!281381))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19163 0))(
  ( (V!19164 (val!6832 Int)) )
))
(declare-datatypes ((ValueCell!6423 0))(
  ( (ValueCellFull!6423 (v!9120 V!19163)) (EmptyCell!6423) )
))
(declare-datatypes ((array!30815 0))(
  ( (array!30816 (arr!14816 (Array (_ BitVec 32) ValueCell!6423)) (size!15174 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30815)

(assert (=> b!478563 (= res!285519 (and (= (size!15174 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15173 _keys!1874) (size!15174 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478564 () Bool)

(declare-fun res!285520 () Bool)

(assert (=> b!478564 (=> (not res!285520) (not e!281381))))

(declare-fun noDuplicate!206 (List!9062) Bool)

(assert (=> b!478564 (= res!285520 (noDuplicate!206 Nil!9059))))

(declare-fun res!285518 () Bool)

(assert (=> start!43168 (=> (not res!285518) (not e!281381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43168 (= res!285518 (validMask!0 mask!2352))))

(assert (=> start!43168 e!281381))

(assert (=> start!43168 true))

(declare-fun e!281383 () Bool)

(declare-fun array_inv!10688 (array!30815) Bool)

(assert (=> start!43168 (and (array_inv!10688 _values!1516) e!281383)))

(declare-fun array_inv!10689 (array!30813) Bool)

(assert (=> start!43168 (array_inv!10689 _keys!1874)))

(declare-fun b!478565 () Bool)

(declare-fun e!281385 () Bool)

(assert (=> b!478565 (= e!281385 tp_is_empty!13569)))

(declare-fun b!478566 () Bool)

(declare-fun res!285521 () Bool)

(assert (=> b!478566 (=> (not res!285521) (not e!281381))))

(assert (=> b!478566 (= res!285521 (and (bvsle #b00000000000000000000000000000000 (size!15173 _keys!1874)) (bvslt (size!15173 _keys!1874) #b01111111111111111111111111111111)))))

(declare-fun b!478567 () Bool)

(assert (=> b!478567 (= e!281384 (contains!2581 Nil!9059 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!22045 () Bool)

(declare-fun tp!42520 () Bool)

(assert (=> mapNonEmpty!22045 (= mapRes!22045 (and tp!42520 e!281386))))

(declare-fun mapValue!22045 () ValueCell!6423)

(declare-fun mapKey!22045 () (_ BitVec 32))

(declare-fun mapRest!22045 () (Array (_ BitVec 32) ValueCell!6423))

(assert (=> mapNonEmpty!22045 (= (arr!14816 _values!1516) (store mapRest!22045 mapKey!22045 mapValue!22045))))

(declare-fun b!478568 () Bool)

(assert (=> b!478568 (= e!281383 (and e!281385 mapRes!22045))))

(declare-fun condMapEmpty!22045 () Bool)

(declare-fun mapDefault!22045 () ValueCell!6423)

(assert (=> b!478568 (= condMapEmpty!22045 (= (arr!14816 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6423)) mapDefault!22045)))))

(assert (= (and start!43168 res!285518) b!478563))

(assert (= (and b!478563 res!285519) b!478562))

(assert (= (and b!478562 res!285522) b!478566))

(assert (= (and b!478566 res!285521) b!478564))

(assert (= (and b!478564 res!285520) b!478560))

(assert (= (and b!478560 (not res!285523)) b!478567))

(assert (= (and b!478568 condMapEmpty!22045) mapIsEmpty!22045))

(assert (= (and b!478568 (not condMapEmpty!22045)) mapNonEmpty!22045))

(get-info :version)

(assert (= (and mapNonEmpty!22045 ((_ is ValueCellFull!6423) mapValue!22045)) b!478561))

(assert (= (and b!478568 ((_ is ValueCellFull!6423) mapDefault!22045)) b!478565))

(assert (= start!43168 b!478568))

(declare-fun m!460781 () Bool)

(assert (=> b!478564 m!460781))

(declare-fun m!460783 () Bool)

(assert (=> b!478560 m!460783))

(declare-fun m!460785 () Bool)

(assert (=> mapNonEmpty!22045 m!460785))

(declare-fun m!460787 () Bool)

(assert (=> start!43168 m!460787))

(declare-fun m!460789 () Bool)

(assert (=> start!43168 m!460789))

(declare-fun m!460791 () Bool)

(assert (=> start!43168 m!460791))

(declare-fun m!460793 () Bool)

(assert (=> b!478567 m!460793))

(declare-fun m!460795 () Bool)

(assert (=> b!478562 m!460795))

(check-sat (not b!478560) (not b!478564) (not start!43168) (not b!478567) (not b!478562) tp_is_empty!13569 (not mapNonEmpty!22045))
(check-sat)
(get-model)

(declare-fun d!76621 () Bool)

(declare-fun res!285546 () Bool)

(declare-fun e!281409 () Bool)

(assert (=> d!76621 (=> res!285546 e!281409)))

(assert (=> d!76621 (= res!285546 ((_ is Nil!9059) Nil!9059))))

(assert (=> d!76621 (= (noDuplicate!206 Nil!9059) e!281409)))

(declare-fun b!478600 () Bool)

(declare-fun e!281410 () Bool)

(assert (=> b!478600 (= e!281409 e!281410)))

(declare-fun res!285547 () Bool)

(assert (=> b!478600 (=> (not res!285547) (not e!281410))))

(assert (=> b!478600 (= res!285547 (not (contains!2581 (t!15268 Nil!9059) (h!9914 Nil!9059))))))

(declare-fun b!478601 () Bool)

(assert (=> b!478601 (= e!281410 (noDuplicate!206 (t!15268 Nil!9059)))))

(assert (= (and d!76621 (not res!285546)) b!478600))

(assert (= (and b!478600 res!285547) b!478601))

(declare-fun m!460813 () Bool)

(assert (=> b!478600 m!460813))

(declare-fun m!460815 () Bool)

(assert (=> b!478601 m!460815))

(assert (=> b!478564 d!76621))

(declare-fun d!76623 () Bool)

(declare-fun lt!217731 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!212 (List!9062) (InoxSet (_ BitVec 64)))

(assert (=> d!76623 (= lt!217731 (select (content!212 Nil!9059) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!281416 () Bool)

(assert (=> d!76623 (= lt!217731 e!281416)))

(declare-fun res!285552 () Bool)

(assert (=> d!76623 (=> (not res!285552) (not e!281416))))

(assert (=> d!76623 (= res!285552 ((_ is Cons!9058) Nil!9059))))

(assert (=> d!76623 (= (contains!2581 Nil!9059 #b0000000000000000000000000000000000000000000000000000000000000000) lt!217731)))

(declare-fun b!478606 () Bool)

(declare-fun e!281415 () Bool)

(assert (=> b!478606 (= e!281416 e!281415)))

(declare-fun res!285553 () Bool)

(assert (=> b!478606 (=> res!285553 e!281415)))

(assert (=> b!478606 (= res!285553 (= (h!9914 Nil!9059) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!478607 () Bool)

(assert (=> b!478607 (= e!281415 (contains!2581 (t!15268 Nil!9059) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!76623 res!285552) b!478606))

(assert (= (and b!478606 (not res!285553)) b!478607))

(declare-fun m!460817 () Bool)

(assert (=> d!76623 m!460817))

(declare-fun m!460819 () Bool)

(assert (=> d!76623 m!460819))

(declare-fun m!460821 () Bool)

(assert (=> b!478607 m!460821))

(assert (=> b!478560 d!76623))

(declare-fun b!478616 () Bool)

(declare-fun e!281425 () Bool)

(declare-fun call!30841 () Bool)

(assert (=> b!478616 (= e!281425 call!30841)))

(declare-fun b!478617 () Bool)

(declare-fun e!281424 () Bool)

(assert (=> b!478617 (= e!281424 e!281425)))

(declare-fun lt!217738 () (_ BitVec 64))

(assert (=> b!478617 (= lt!217738 (select (arr!14815 _keys!1874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14064 0))(
  ( (Unit!14065) )
))
(declare-fun lt!217739 () Unit!14064)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30813 (_ BitVec 64) (_ BitVec 32)) Unit!14064)

(assert (=> b!478617 (= lt!217739 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217738 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!478617 (arrayContainsKey!0 _keys!1874 lt!217738 #b00000000000000000000000000000000)))

(declare-fun lt!217740 () Unit!14064)

(assert (=> b!478617 (= lt!217740 lt!217739)))

(declare-fun res!285558 () Bool)

(declare-datatypes ((SeekEntryResult!3566 0))(
  ( (MissingZero!3566 (index!16443 (_ BitVec 32))) (Found!3566 (index!16444 (_ BitVec 32))) (Intermediate!3566 (undefined!4378 Bool) (index!16445 (_ BitVec 32)) (x!44916 (_ BitVec 32))) (Undefined!3566) (MissingVacant!3566 (index!16446 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30813 (_ BitVec 32)) SeekEntryResult!3566)

(assert (=> b!478617 (= res!285558 (= (seekEntryOrOpen!0 (select (arr!14815 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3566 #b00000000000000000000000000000000)))))

(assert (=> b!478617 (=> (not res!285558) (not e!281425))))

(declare-fun b!478618 () Bool)

(declare-fun e!281423 () Bool)

(assert (=> b!478618 (= e!281423 e!281424)))

(declare-fun c!57670 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!478618 (= c!57670 (validKeyInArray!0 (select (arr!14815 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun d!76625 () Bool)

(declare-fun res!285559 () Bool)

(assert (=> d!76625 (=> res!285559 e!281423)))

(assert (=> d!76625 (= res!285559 (bvsge #b00000000000000000000000000000000 (size!15173 _keys!1874)))))

(assert (=> d!76625 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!281423)))

(declare-fun b!478619 () Bool)

(assert (=> b!478619 (= e!281424 call!30841)))

(declare-fun bm!30838 () Bool)

(assert (=> bm!30838 (= call!30841 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76625 (not res!285559)) b!478618))

(assert (= (and b!478618 c!57670) b!478617))

(assert (= (and b!478618 (not c!57670)) b!478619))

(assert (= (and b!478617 res!285558) b!478616))

(assert (= (or b!478616 b!478619) bm!30838))

(declare-fun m!460823 () Bool)

(assert (=> b!478617 m!460823))

(declare-fun m!460825 () Bool)

(assert (=> b!478617 m!460825))

(declare-fun m!460827 () Bool)

(assert (=> b!478617 m!460827))

(assert (=> b!478617 m!460823))

(declare-fun m!460829 () Bool)

(assert (=> b!478617 m!460829))

(assert (=> b!478618 m!460823))

(assert (=> b!478618 m!460823))

(declare-fun m!460831 () Bool)

(assert (=> b!478618 m!460831))

(declare-fun m!460833 () Bool)

(assert (=> bm!30838 m!460833))

(assert (=> b!478562 d!76625))

(declare-fun d!76627 () Bool)

(assert (=> d!76627 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43168 d!76627))

(declare-fun d!76629 () Bool)

(assert (=> d!76629 (= (array_inv!10688 _values!1516) (bvsge (size!15174 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43168 d!76629))

(declare-fun d!76631 () Bool)

(assert (=> d!76631 (= (array_inv!10689 _keys!1874) (bvsge (size!15173 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43168 d!76631))

(declare-fun d!76633 () Bool)

(declare-fun lt!217741 () Bool)

(assert (=> d!76633 (= lt!217741 (select (content!212 Nil!9059) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!281427 () Bool)

(assert (=> d!76633 (= lt!217741 e!281427)))

(declare-fun res!285560 () Bool)

(assert (=> d!76633 (=> (not res!285560) (not e!281427))))

(assert (=> d!76633 (= res!285560 ((_ is Cons!9058) Nil!9059))))

(assert (=> d!76633 (= (contains!2581 Nil!9059 #b1000000000000000000000000000000000000000000000000000000000000000) lt!217741)))

(declare-fun b!478620 () Bool)

(declare-fun e!281426 () Bool)

(assert (=> b!478620 (= e!281427 e!281426)))

(declare-fun res!285561 () Bool)

(assert (=> b!478620 (=> res!285561 e!281426)))

(assert (=> b!478620 (= res!285561 (= (h!9914 Nil!9059) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!478621 () Bool)

(assert (=> b!478621 (= e!281426 (contains!2581 (t!15268 Nil!9059) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!76633 res!285560) b!478620))

(assert (= (and b!478620 (not res!285561)) b!478621))

(assert (=> d!76633 m!460817))

(declare-fun m!460835 () Bool)

(assert (=> d!76633 m!460835))

(declare-fun m!460837 () Bool)

(assert (=> b!478621 m!460837))

(assert (=> b!478567 d!76633))

(declare-fun mapIsEmpty!22051 () Bool)

(declare-fun mapRes!22051 () Bool)

(assert (=> mapIsEmpty!22051 mapRes!22051))

(declare-fun condMapEmpty!22051 () Bool)

(declare-fun mapDefault!22051 () ValueCell!6423)

(assert (=> mapNonEmpty!22045 (= condMapEmpty!22051 (= mapRest!22045 ((as const (Array (_ BitVec 32) ValueCell!6423)) mapDefault!22051)))))

(declare-fun e!281433 () Bool)

(assert (=> mapNonEmpty!22045 (= tp!42520 (and e!281433 mapRes!22051))))

(declare-fun b!478628 () Bool)

(declare-fun e!281432 () Bool)

(assert (=> b!478628 (= e!281432 tp_is_empty!13569)))

(declare-fun b!478629 () Bool)

(assert (=> b!478629 (= e!281433 tp_is_empty!13569)))

(declare-fun mapNonEmpty!22051 () Bool)

(declare-fun tp!42526 () Bool)

(assert (=> mapNonEmpty!22051 (= mapRes!22051 (and tp!42526 e!281432))))

(declare-fun mapRest!22051 () (Array (_ BitVec 32) ValueCell!6423))

(declare-fun mapKey!22051 () (_ BitVec 32))

(declare-fun mapValue!22051 () ValueCell!6423)

(assert (=> mapNonEmpty!22051 (= mapRest!22045 (store mapRest!22051 mapKey!22051 mapValue!22051))))

(assert (= (and mapNonEmpty!22045 condMapEmpty!22051) mapIsEmpty!22051))

(assert (= (and mapNonEmpty!22045 (not condMapEmpty!22051)) mapNonEmpty!22051))

(assert (= (and mapNonEmpty!22051 ((_ is ValueCellFull!6423) mapValue!22051)) b!478628))

(assert (= (and mapNonEmpty!22045 ((_ is ValueCellFull!6423) mapDefault!22051)) b!478629))

(declare-fun m!460839 () Bool)

(assert (=> mapNonEmpty!22051 m!460839))

(check-sat tp_is_empty!13569 (not b!478621) (not bm!30838) (not b!478601) (not b!478617) (not mapNonEmpty!22051) (not b!478618) (not d!76633) (not b!478600) (not d!76623) (not b!478607))
(check-sat)
