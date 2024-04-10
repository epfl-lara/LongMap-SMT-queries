; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108302 () Bool)

(assert start!108302)

(declare-fun b!1278451 () Bool)

(declare-fun e!730290 () Bool)

(declare-datatypes ((List!28740 0))(
  ( (Nil!28737) (Cons!28736 (h!29945 (_ BitVec 64)) (t!42280 List!28740)) )
))
(declare-fun contains!7737 (List!28740 (_ BitVec 64)) Bool)

(assert (=> b!1278451 (= e!730290 (contains!7737 Nil!28737 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1278452 () Bool)

(declare-fun res!849349 () Bool)

(declare-fun e!730291 () Bool)

(assert (=> b!1278452 (=> (not res!849349) (not e!730291))))

(declare-fun noDuplicate!2056 (List!28740) Bool)

(assert (=> b!1278452 (= res!849349 (noDuplicate!2056 Nil!28737))))

(declare-fun b!1278453 () Bool)

(declare-fun e!730289 () Bool)

(declare-fun tp_is_empty!33501 () Bool)

(assert (=> b!1278453 (= e!730289 tp_is_empty!33501)))

(declare-fun b!1278454 () Bool)

(declare-fun res!849347 () Bool)

(assert (=> b!1278454 (=> (not res!849347) (not e!730291))))

(declare-datatypes ((array!84096 0))(
  ( (array!84097 (arr!40553 (Array (_ BitVec 32) (_ BitVec 64))) (size!41103 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84096)

(assert (=> b!1278454 (= res!849347 (and (bvsle #b00000000000000000000000000000000 (size!41103 _keys!1741)) (bvslt (size!41103 _keys!1741) #b01111111111111111111111111111111)))))

(declare-fun b!1278455 () Bool)

(assert (=> b!1278455 (= e!730291 e!730290)))

(declare-fun res!849346 () Bool)

(assert (=> b!1278455 (=> res!849346 e!730290)))

(assert (=> b!1278455 (= res!849346 (contains!7737 Nil!28737 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1278456 () Bool)

(declare-fun e!730288 () Bool)

(assert (=> b!1278456 (= e!730288 tp_is_empty!33501)))

(declare-fun res!849351 () Bool)

(assert (=> start!108302 (=> (not res!849351) (not e!730291))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108302 (= res!849351 (validMask!0 mask!2175))))

(assert (=> start!108302 e!730291))

(assert (=> start!108302 true))

(declare-datatypes ((V!49771 0))(
  ( (V!49772 (val!16825 Int)) )
))
(declare-datatypes ((ValueCell!15852 0))(
  ( (ValueCellFull!15852 (v!19424 V!49771)) (EmptyCell!15852) )
))
(declare-datatypes ((array!84098 0))(
  ( (array!84099 (arr!40554 (Array (_ BitVec 32) ValueCell!15852)) (size!41104 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84098)

(declare-fun e!730292 () Bool)

(declare-fun array_inv!30801 (array!84098) Bool)

(assert (=> start!108302 (and (array_inv!30801 _values!1445) e!730292)))

(declare-fun array_inv!30802 (array!84096) Bool)

(assert (=> start!108302 (array_inv!30802 _keys!1741)))

(declare-fun b!1278457 () Bool)

(declare-fun res!849348 () Bool)

(assert (=> b!1278457 (=> (not res!849348) (not e!730291))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278457 (= res!849348 (and (= (size!41104 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41103 _keys!1741) (size!41104 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51800 () Bool)

(declare-fun mapRes!51800 () Bool)

(assert (=> mapIsEmpty!51800 mapRes!51800))

(declare-fun mapNonEmpty!51800 () Bool)

(declare-fun tp!98774 () Bool)

(assert (=> mapNonEmpty!51800 (= mapRes!51800 (and tp!98774 e!730288))))

(declare-fun mapRest!51800 () (Array (_ BitVec 32) ValueCell!15852))

(declare-fun mapValue!51800 () ValueCell!15852)

(declare-fun mapKey!51800 () (_ BitVec 32))

(assert (=> mapNonEmpty!51800 (= (arr!40554 _values!1445) (store mapRest!51800 mapKey!51800 mapValue!51800))))

(declare-fun b!1278458 () Bool)

(assert (=> b!1278458 (= e!730292 (and e!730289 mapRes!51800))))

(declare-fun condMapEmpty!51800 () Bool)

(declare-fun mapDefault!51800 () ValueCell!15852)

(assert (=> b!1278458 (= condMapEmpty!51800 (= (arr!40554 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15852)) mapDefault!51800)))))

(declare-fun b!1278459 () Bool)

(declare-fun res!849350 () Bool)

(assert (=> b!1278459 (=> (not res!849350) (not e!730291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84096 (_ BitVec 32)) Bool)

(assert (=> b!1278459 (= res!849350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108302 res!849351) b!1278457))

(assert (= (and b!1278457 res!849348) b!1278459))

(assert (= (and b!1278459 res!849350) b!1278454))

(assert (= (and b!1278454 res!849347) b!1278452))

(assert (= (and b!1278452 res!849349) b!1278455))

(assert (= (and b!1278455 (not res!849346)) b!1278451))

(assert (= (and b!1278458 condMapEmpty!51800) mapIsEmpty!51800))

(assert (= (and b!1278458 (not condMapEmpty!51800)) mapNonEmpty!51800))

(get-info :version)

(assert (= (and mapNonEmpty!51800 ((_ is ValueCellFull!15852) mapValue!51800)) b!1278456))

(assert (= (and b!1278458 ((_ is ValueCellFull!15852) mapDefault!51800)) b!1278453))

(assert (= start!108302 b!1278458))

(declare-fun m!1173749 () Bool)

(assert (=> start!108302 m!1173749))

(declare-fun m!1173751 () Bool)

(assert (=> start!108302 m!1173751))

(declare-fun m!1173753 () Bool)

(assert (=> start!108302 m!1173753))

(declare-fun m!1173755 () Bool)

(assert (=> b!1278459 m!1173755))

(declare-fun m!1173757 () Bool)

(assert (=> b!1278455 m!1173757))

(declare-fun m!1173759 () Bool)

(assert (=> b!1278452 m!1173759))

(declare-fun m!1173761 () Bool)

(assert (=> b!1278451 m!1173761))

(declare-fun m!1173763 () Bool)

(assert (=> mapNonEmpty!51800 m!1173763))

(check-sat (not start!108302) (not b!1278452) (not b!1278451) tp_is_empty!33501 (not b!1278459) (not b!1278455) (not mapNonEmpty!51800))
(check-sat)
(get-model)

(declare-fun b!1278495 () Bool)

(declare-fun e!730320 () Bool)

(declare-fun call!62716 () Bool)

(assert (=> b!1278495 (= e!730320 call!62716)))

(declare-fun bm!62713 () Bool)

(assert (=> bm!62713 (= call!62716 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1278496 () Bool)

(declare-fun e!730318 () Bool)

(assert (=> b!1278496 (= e!730318 e!730320)))

(declare-fun c!124038 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1278496 (= c!124038 (validKeyInArray!0 (select (arr!40553 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1278497 () Bool)

(declare-fun e!730319 () Bool)

(assert (=> b!1278497 (= e!730319 call!62716)))

(declare-fun d!140545 () Bool)

(declare-fun res!849374 () Bool)

(assert (=> d!140545 (=> res!849374 e!730318)))

(assert (=> d!140545 (= res!849374 (bvsge #b00000000000000000000000000000000 (size!41103 _keys!1741)))))

(assert (=> d!140545 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!730318)))

(declare-fun b!1278498 () Bool)

(assert (=> b!1278498 (= e!730320 e!730319)))

(declare-fun lt!575880 () (_ BitVec 64))

(assert (=> b!1278498 (= lt!575880 (select (arr!40553 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42391 0))(
  ( (Unit!42392) )
))
(declare-fun lt!575879 () Unit!42391)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84096 (_ BitVec 64) (_ BitVec 32)) Unit!42391)

(assert (=> b!1278498 (= lt!575879 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!575880 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!84096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1278498 (arrayContainsKey!0 _keys!1741 lt!575880 #b00000000000000000000000000000000)))

(declare-fun lt!575881 () Unit!42391)

(assert (=> b!1278498 (= lt!575881 lt!575879)))

(declare-fun res!849375 () Bool)

(declare-datatypes ((SeekEntryResult!10011 0))(
  ( (MissingZero!10011 (index!42415 (_ BitVec 32))) (Found!10011 (index!42416 (_ BitVec 32))) (Intermediate!10011 (undefined!10823 Bool) (index!42417 (_ BitVec 32)) (x!113330 (_ BitVec 32))) (Undefined!10011) (MissingVacant!10011 (index!42418 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84096 (_ BitVec 32)) SeekEntryResult!10011)

(assert (=> b!1278498 (= res!849375 (= (seekEntryOrOpen!0 (select (arr!40553 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10011 #b00000000000000000000000000000000)))))

(assert (=> b!1278498 (=> (not res!849375) (not e!730319))))

(assert (= (and d!140545 (not res!849374)) b!1278496))

(assert (= (and b!1278496 c!124038) b!1278498))

(assert (= (and b!1278496 (not c!124038)) b!1278495))

(assert (= (and b!1278498 res!849375) b!1278497))

(assert (= (or b!1278497 b!1278495) bm!62713))

(declare-fun m!1173781 () Bool)

(assert (=> bm!62713 m!1173781))

(declare-fun m!1173783 () Bool)

(assert (=> b!1278496 m!1173783))

(assert (=> b!1278496 m!1173783))

(declare-fun m!1173785 () Bool)

(assert (=> b!1278496 m!1173785))

(assert (=> b!1278498 m!1173783))

(declare-fun m!1173787 () Bool)

(assert (=> b!1278498 m!1173787))

(declare-fun m!1173789 () Bool)

(assert (=> b!1278498 m!1173789))

(assert (=> b!1278498 m!1173783))

(declare-fun m!1173791 () Bool)

(assert (=> b!1278498 m!1173791))

(assert (=> b!1278459 d!140545))

(declare-fun d!140547 () Bool)

(declare-fun lt!575884 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!642 (List!28740) (InoxSet (_ BitVec 64)))

(assert (=> d!140547 (= lt!575884 (select (content!642 Nil!28737) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!730325 () Bool)

(assert (=> d!140547 (= lt!575884 e!730325)))

(declare-fun res!849380 () Bool)

(assert (=> d!140547 (=> (not res!849380) (not e!730325))))

(assert (=> d!140547 (= res!849380 ((_ is Cons!28736) Nil!28737))))

(assert (=> d!140547 (= (contains!7737 Nil!28737 #b0000000000000000000000000000000000000000000000000000000000000000) lt!575884)))

(declare-fun b!1278503 () Bool)

(declare-fun e!730326 () Bool)

(assert (=> b!1278503 (= e!730325 e!730326)))

(declare-fun res!849381 () Bool)

(assert (=> b!1278503 (=> res!849381 e!730326)))

(assert (=> b!1278503 (= res!849381 (= (h!29945 Nil!28737) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1278504 () Bool)

(assert (=> b!1278504 (= e!730326 (contains!7737 (t!42280 Nil!28737) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140547 res!849380) b!1278503))

(assert (= (and b!1278503 (not res!849381)) b!1278504))

(declare-fun m!1173793 () Bool)

(assert (=> d!140547 m!1173793))

(declare-fun m!1173795 () Bool)

(assert (=> d!140547 m!1173795))

(declare-fun m!1173797 () Bool)

(assert (=> b!1278504 m!1173797))

(assert (=> b!1278455 d!140547))

(declare-fun d!140549 () Bool)

(declare-fun lt!575885 () Bool)

(assert (=> d!140549 (= lt!575885 (select (content!642 Nil!28737) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!730327 () Bool)

(assert (=> d!140549 (= lt!575885 e!730327)))

(declare-fun res!849382 () Bool)

(assert (=> d!140549 (=> (not res!849382) (not e!730327))))

(assert (=> d!140549 (= res!849382 ((_ is Cons!28736) Nil!28737))))

(assert (=> d!140549 (= (contains!7737 Nil!28737 #b1000000000000000000000000000000000000000000000000000000000000000) lt!575885)))

(declare-fun b!1278505 () Bool)

(declare-fun e!730328 () Bool)

(assert (=> b!1278505 (= e!730327 e!730328)))

(declare-fun res!849383 () Bool)

(assert (=> b!1278505 (=> res!849383 e!730328)))

(assert (=> b!1278505 (= res!849383 (= (h!29945 Nil!28737) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1278506 () Bool)

(assert (=> b!1278506 (= e!730328 (contains!7737 (t!42280 Nil!28737) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140549 res!849382) b!1278505))

(assert (= (and b!1278505 (not res!849383)) b!1278506))

(assert (=> d!140549 m!1173793))

(declare-fun m!1173799 () Bool)

(assert (=> d!140549 m!1173799))

(declare-fun m!1173801 () Bool)

(assert (=> b!1278506 m!1173801))

(assert (=> b!1278451 d!140549))

(declare-fun d!140551 () Bool)

(declare-fun res!849388 () Bool)

(declare-fun e!730333 () Bool)

(assert (=> d!140551 (=> res!849388 e!730333)))

(assert (=> d!140551 (= res!849388 ((_ is Nil!28737) Nil!28737))))

(assert (=> d!140551 (= (noDuplicate!2056 Nil!28737) e!730333)))

(declare-fun b!1278511 () Bool)

(declare-fun e!730334 () Bool)

(assert (=> b!1278511 (= e!730333 e!730334)))

(declare-fun res!849389 () Bool)

(assert (=> b!1278511 (=> (not res!849389) (not e!730334))))

(assert (=> b!1278511 (= res!849389 (not (contains!7737 (t!42280 Nil!28737) (h!29945 Nil!28737))))))

(declare-fun b!1278512 () Bool)

(assert (=> b!1278512 (= e!730334 (noDuplicate!2056 (t!42280 Nil!28737)))))

(assert (= (and d!140551 (not res!849388)) b!1278511))

(assert (= (and b!1278511 res!849389) b!1278512))

(declare-fun m!1173803 () Bool)

(assert (=> b!1278511 m!1173803))

(declare-fun m!1173805 () Bool)

(assert (=> b!1278512 m!1173805))

(assert (=> b!1278452 d!140551))

(declare-fun d!140553 () Bool)

(assert (=> d!140553 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108302 d!140553))

(declare-fun d!140555 () Bool)

(assert (=> d!140555 (= (array_inv!30801 _values!1445) (bvsge (size!41104 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108302 d!140555))

(declare-fun d!140557 () Bool)

(assert (=> d!140557 (= (array_inv!30802 _keys!1741) (bvsge (size!41103 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108302 d!140557))

(declare-fun b!1278520 () Bool)

(declare-fun e!730339 () Bool)

(assert (=> b!1278520 (= e!730339 tp_is_empty!33501)))

(declare-fun condMapEmpty!51806 () Bool)

(declare-fun mapDefault!51806 () ValueCell!15852)

(assert (=> mapNonEmpty!51800 (= condMapEmpty!51806 (= mapRest!51800 ((as const (Array (_ BitVec 32) ValueCell!15852)) mapDefault!51806)))))

(declare-fun mapRes!51806 () Bool)

(assert (=> mapNonEmpty!51800 (= tp!98774 (and e!730339 mapRes!51806))))

(declare-fun b!1278519 () Bool)

(declare-fun e!730340 () Bool)

(assert (=> b!1278519 (= e!730340 tp_is_empty!33501)))

(declare-fun mapNonEmpty!51806 () Bool)

(declare-fun tp!98780 () Bool)

(assert (=> mapNonEmpty!51806 (= mapRes!51806 (and tp!98780 e!730340))))

(declare-fun mapRest!51806 () (Array (_ BitVec 32) ValueCell!15852))

(declare-fun mapValue!51806 () ValueCell!15852)

(declare-fun mapKey!51806 () (_ BitVec 32))

(assert (=> mapNonEmpty!51806 (= mapRest!51800 (store mapRest!51806 mapKey!51806 mapValue!51806))))

(declare-fun mapIsEmpty!51806 () Bool)

(assert (=> mapIsEmpty!51806 mapRes!51806))

(assert (= (and mapNonEmpty!51800 condMapEmpty!51806) mapIsEmpty!51806))

(assert (= (and mapNonEmpty!51800 (not condMapEmpty!51806)) mapNonEmpty!51806))

(assert (= (and mapNonEmpty!51806 ((_ is ValueCellFull!15852) mapValue!51806)) b!1278519))

(assert (= (and mapNonEmpty!51800 ((_ is ValueCellFull!15852) mapDefault!51806)) b!1278520))

(declare-fun m!1173807 () Bool)

(assert (=> mapNonEmpty!51806 m!1173807))

(check-sat (not d!140547) (not b!1278498) tp_is_empty!33501 (not d!140549) (not b!1278504) (not bm!62713) (not b!1278506) (not b!1278496) (not mapNonEmpty!51806) (not b!1278512) (not b!1278511))
(check-sat)
