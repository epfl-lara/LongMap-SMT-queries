; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107812 () Bool)

(assert start!107812)

(declare-fun b!1274890 () Bool)

(declare-fun b_free!27733 () Bool)

(declare-fun b_next!27733 () Bool)

(assert (=> b!1274890 (= b_free!27733 (not b_next!27733))))

(declare-fun tp!97753 () Bool)

(declare-fun b_and!45791 () Bool)

(assert (=> b!1274890 (= tp!97753 b_and!45791)))

(declare-fun b!1274889 () Bool)

(declare-fun e!727515 () Bool)

(declare-fun e!727514 () Bool)

(declare-fun mapRes!51283 () Bool)

(assert (=> b!1274889 (= e!727515 (and e!727514 mapRes!51283))))

(declare-fun condMapEmpty!51283 () Bool)

(declare-datatypes ((V!49331 0))(
  ( (V!49332 (val!16626 Int)) )
))
(declare-datatypes ((ValueCell!15698 0))(
  ( (ValueCellFull!15698 (v!19258 V!49331)) (EmptyCell!15698) )
))
(declare-datatypes ((array!83499 0))(
  ( (array!83500 (arr!40268 (Array (_ BitVec 32) ValueCell!15698)) (size!40813 (_ BitVec 32))) )
))
(declare-datatypes ((array!83501 0))(
  ( (array!83502 (arr!40269 (Array (_ BitVec 32) (_ BitVec 64))) (size!40814 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6160 0))(
  ( (LongMapFixedSize!6161 (defaultEntry!6726 Int) (mask!34573 (_ BitVec 32)) (extraKeys!6405 (_ BitVec 32)) (zeroValue!6511 V!49331) (minValue!6511 V!49331) (_size!3135 (_ BitVec 32)) (_keys!12178 array!83501) (_values!6749 array!83499) (_vacant!3135 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6160)

(declare-fun mapDefault!51283 () ValueCell!15698)

(assert (=> b!1274889 (= condMapEmpty!51283 (= (arr!40268 (_values!6749 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15698)) mapDefault!51283)))))

(declare-fun tp_is_empty!33103 () Bool)

(declare-fun e!727516 () Bool)

(declare-fun array_inv!30793 (array!83501) Bool)

(declare-fun array_inv!30794 (array!83499) Bool)

(assert (=> b!1274890 (= e!727516 (and tp!97753 tp_is_empty!33103 (array_inv!30793 (_keys!12178 thiss!1551)) (array_inv!30794 (_values!6749 thiss!1551)) e!727515))))

(declare-fun b!1274891 () Bool)

(assert (=> b!1274891 (= e!727514 tp_is_empty!33103)))

(declare-fun b!1274892 () Bool)

(declare-fun e!727517 () Bool)

(assert (=> b!1274892 (= e!727517 tp_is_empty!33103)))

(declare-fun mapNonEmpty!51283 () Bool)

(declare-fun tp!97752 () Bool)

(assert (=> mapNonEmpty!51283 (= mapRes!51283 (and tp!97752 e!727517))))

(declare-fun mapKey!51283 () (_ BitVec 32))

(declare-fun mapRest!51283 () (Array (_ BitVec 32) ValueCell!15698))

(declare-fun mapValue!51283 () ValueCell!15698)

(assert (=> mapNonEmpty!51283 (= (arr!40268 (_values!6749 thiss!1551)) (store mapRest!51283 mapKey!51283 mapValue!51283))))

(declare-fun b!1274893 () Bool)

(declare-fun res!847420 () Bool)

(declare-fun e!727513 () Bool)

(assert (=> b!1274893 (=> (not res!847420) (not e!727513))))

(declare-fun arrayCountValidKeys!0 (array!83501 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1274893 (= res!847420 (= (arrayCountValidKeys!0 (_keys!12178 thiss!1551) #b00000000000000000000000000000000 (size!40814 (_keys!12178 thiss!1551))) (_size!3135 thiss!1551)))))

(declare-fun b!1274894 () Bool)

(assert (=> b!1274894 (= e!727513 (not (= (size!40814 (_keys!12178 thiss!1551)) (bvadd #b00000000000000000000000000000001 (mask!34573 thiss!1551)))))))

(declare-fun b!1274895 () Bool)

(declare-fun res!847419 () Bool)

(assert (=> b!1274895 (=> (not res!847419) (not e!727513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1274895 (= res!847419 (validMask!0 (mask!34573 thiss!1551)))))

(declare-fun mapIsEmpty!51283 () Bool)

(assert (=> mapIsEmpty!51283 mapRes!51283))

(declare-fun res!847418 () Bool)

(assert (=> start!107812 (=> (not res!847418) (not e!727513))))

(declare-fun simpleValid!470 (LongMapFixedSize!6160) Bool)

(assert (=> start!107812 (= res!847418 (simpleValid!470 thiss!1551))))

(assert (=> start!107812 e!727513))

(assert (=> start!107812 e!727516))

(assert (= (and start!107812 res!847418) b!1274893))

(assert (= (and b!1274893 res!847420) b!1274895))

(assert (= (and b!1274895 res!847419) b!1274894))

(assert (= (and b!1274889 condMapEmpty!51283) mapIsEmpty!51283))

(assert (= (and b!1274889 (not condMapEmpty!51283)) mapNonEmpty!51283))

(get-info :version)

(assert (= (and mapNonEmpty!51283 ((_ is ValueCellFull!15698) mapValue!51283)) b!1274892))

(assert (= (and b!1274889 ((_ is ValueCellFull!15698) mapDefault!51283)) b!1274891))

(assert (= b!1274890 b!1274889))

(assert (= start!107812 b!1274890))

(declare-fun m!1172313 () Bool)

(assert (=> start!107812 m!1172313))

(declare-fun m!1172315 () Bool)

(assert (=> b!1274893 m!1172315))

(declare-fun m!1172317 () Bool)

(assert (=> mapNonEmpty!51283 m!1172317))

(declare-fun m!1172319 () Bool)

(assert (=> b!1274895 m!1172319))

(declare-fun m!1172321 () Bool)

(assert (=> b!1274890 m!1172321))

(declare-fun m!1172323 () Bool)

(assert (=> b!1274890 m!1172323))

(check-sat (not mapNonEmpty!51283) (not b_next!27733) (not b!1274893) tp_is_empty!33103 (not b!1274895) (not b!1274890) b_and!45791 (not start!107812))
(check-sat b_and!45791 (not b_next!27733))
(get-model)

(declare-fun d!140465 () Bool)

(assert (=> d!140465 (= (array_inv!30793 (_keys!12178 thiss!1551)) (bvsge (size!40814 (_keys!12178 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274890 d!140465))

(declare-fun d!140467 () Bool)

(assert (=> d!140467 (= (array_inv!30794 (_values!6749 thiss!1551)) (bvsge (size!40813 (_values!6749 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274890 d!140467))

(declare-fun bm!62665 () Bool)

(declare-fun call!62668 () (_ BitVec 32))

(assert (=> bm!62665 (= call!62668 (arrayCountValidKeys!0 (_keys!12178 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40814 (_keys!12178 thiss!1551))))))

(declare-fun d!140469 () Bool)

(declare-fun lt!575621 () (_ BitVec 32))

(assert (=> d!140469 (and (bvsge lt!575621 #b00000000000000000000000000000000) (bvsle lt!575621 (bvsub (size!40814 (_keys!12178 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun e!727559 () (_ BitVec 32))

(assert (=> d!140469 (= lt!575621 e!727559)))

(declare-fun c!124170 () Bool)

(assert (=> d!140469 (= c!124170 (bvsge #b00000000000000000000000000000000 (size!40814 (_keys!12178 thiss!1551))))))

(assert (=> d!140469 (and (bvsle #b00000000000000000000000000000000 (size!40814 (_keys!12178 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40814 (_keys!12178 thiss!1551)) (size!40814 (_keys!12178 thiss!1551))))))

(assert (=> d!140469 (= (arrayCountValidKeys!0 (_keys!12178 thiss!1551) #b00000000000000000000000000000000 (size!40814 (_keys!12178 thiss!1551))) lt!575621)))

(declare-fun b!1274946 () Bool)

(declare-fun e!727558 () (_ BitVec 32))

(assert (=> b!1274946 (= e!727558 call!62668)))

(declare-fun b!1274947 () Bool)

(assert (=> b!1274947 (= e!727559 e!727558)))

(declare-fun c!124171 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1274947 (= c!124171 (validKeyInArray!0 (select (arr!40269 (_keys!12178 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1274948 () Bool)

(assert (=> b!1274948 (= e!727559 #b00000000000000000000000000000000)))

(declare-fun b!1274949 () Bool)

(assert (=> b!1274949 (= e!727558 (bvadd #b00000000000000000000000000000001 call!62668))))

(assert (= (and d!140469 c!124170) b!1274948))

(assert (= (and d!140469 (not c!124170)) b!1274947))

(assert (= (and b!1274947 c!124171) b!1274949))

(assert (= (and b!1274947 (not c!124171)) b!1274946))

(assert (= (or b!1274949 b!1274946) bm!62665))

(declare-fun m!1172349 () Bool)

(assert (=> bm!62665 m!1172349))

(declare-fun m!1172351 () Bool)

(assert (=> b!1274947 m!1172351))

(assert (=> b!1274947 m!1172351))

(declare-fun m!1172353 () Bool)

(assert (=> b!1274947 m!1172353))

(assert (=> b!1274893 d!140469))

(declare-fun b!1274961 () Bool)

(declare-fun e!727562 () Bool)

(assert (=> b!1274961 (= e!727562 (and (bvsge (extraKeys!6405 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6405 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3135 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1274960 () Bool)

(declare-fun res!847450 () Bool)

(assert (=> b!1274960 (=> (not res!847450) (not e!727562))))

(declare-fun size!40819 (LongMapFixedSize!6160) (_ BitVec 32))

(assert (=> b!1274960 (= res!847450 (= (size!40819 thiss!1551) (bvadd (_size!3135 thiss!1551) (bvsdiv (bvadd (extraKeys!6405 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1274959 () Bool)

(declare-fun res!847448 () Bool)

(assert (=> b!1274959 (=> (not res!847448) (not e!727562))))

(assert (=> b!1274959 (= res!847448 (bvsge (size!40819 thiss!1551) (_size!3135 thiss!1551)))))

(declare-fun d!140471 () Bool)

(declare-fun res!847449 () Bool)

(assert (=> d!140471 (=> (not res!847449) (not e!727562))))

(assert (=> d!140471 (= res!847449 (validMask!0 (mask!34573 thiss!1551)))))

(assert (=> d!140471 (= (simpleValid!470 thiss!1551) e!727562)))

(declare-fun b!1274958 () Bool)

(declare-fun res!847447 () Bool)

(assert (=> b!1274958 (=> (not res!847447) (not e!727562))))

(assert (=> b!1274958 (= res!847447 (and (= (size!40813 (_values!6749 thiss!1551)) (bvadd (mask!34573 thiss!1551) #b00000000000000000000000000000001)) (= (size!40814 (_keys!12178 thiss!1551)) (size!40813 (_values!6749 thiss!1551))) (bvsge (_size!3135 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3135 thiss!1551) (bvadd (mask!34573 thiss!1551) #b00000000000000000000000000000001))))))

(assert (= (and d!140471 res!847449) b!1274958))

(assert (= (and b!1274958 res!847447) b!1274959))

(assert (= (and b!1274959 res!847448) b!1274960))

(assert (= (and b!1274960 res!847450) b!1274961))

(declare-fun m!1172355 () Bool)

(assert (=> b!1274960 m!1172355))

(assert (=> b!1274959 m!1172355))

(assert (=> d!140471 m!1172319))

(assert (=> start!107812 d!140471))

(declare-fun d!140473 () Bool)

(assert (=> d!140473 (= (validMask!0 (mask!34573 thiss!1551)) (and (or (= (mask!34573 thiss!1551) #b00000000000000000000000000000111) (= (mask!34573 thiss!1551) #b00000000000000000000000000001111) (= (mask!34573 thiss!1551) #b00000000000000000000000000011111) (= (mask!34573 thiss!1551) #b00000000000000000000000000111111) (= (mask!34573 thiss!1551) #b00000000000000000000000001111111) (= (mask!34573 thiss!1551) #b00000000000000000000000011111111) (= (mask!34573 thiss!1551) #b00000000000000000000000111111111) (= (mask!34573 thiss!1551) #b00000000000000000000001111111111) (= (mask!34573 thiss!1551) #b00000000000000000000011111111111) (= (mask!34573 thiss!1551) #b00000000000000000000111111111111) (= (mask!34573 thiss!1551) #b00000000000000000001111111111111) (= (mask!34573 thiss!1551) #b00000000000000000011111111111111) (= (mask!34573 thiss!1551) #b00000000000000000111111111111111) (= (mask!34573 thiss!1551) #b00000000000000001111111111111111) (= (mask!34573 thiss!1551) #b00000000000000011111111111111111) (= (mask!34573 thiss!1551) #b00000000000000111111111111111111) (= (mask!34573 thiss!1551) #b00000000000001111111111111111111) (= (mask!34573 thiss!1551) #b00000000000011111111111111111111) (= (mask!34573 thiss!1551) #b00000000000111111111111111111111) (= (mask!34573 thiss!1551) #b00000000001111111111111111111111) (= (mask!34573 thiss!1551) #b00000000011111111111111111111111) (= (mask!34573 thiss!1551) #b00000000111111111111111111111111) (= (mask!34573 thiss!1551) #b00000001111111111111111111111111) (= (mask!34573 thiss!1551) #b00000011111111111111111111111111) (= (mask!34573 thiss!1551) #b00000111111111111111111111111111) (= (mask!34573 thiss!1551) #b00001111111111111111111111111111) (= (mask!34573 thiss!1551) #b00011111111111111111111111111111) (= (mask!34573 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34573 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> b!1274895 d!140473))

(declare-fun mapNonEmpty!51292 () Bool)

(declare-fun mapRes!51292 () Bool)

(declare-fun tp!97768 () Bool)

(declare-fun e!727568 () Bool)

(assert (=> mapNonEmpty!51292 (= mapRes!51292 (and tp!97768 e!727568))))

(declare-fun mapRest!51292 () (Array (_ BitVec 32) ValueCell!15698))

(declare-fun mapKey!51292 () (_ BitVec 32))

(declare-fun mapValue!51292 () ValueCell!15698)

(assert (=> mapNonEmpty!51292 (= mapRest!51283 (store mapRest!51292 mapKey!51292 mapValue!51292))))

(declare-fun condMapEmpty!51292 () Bool)

(declare-fun mapDefault!51292 () ValueCell!15698)

(assert (=> mapNonEmpty!51283 (= condMapEmpty!51292 (= mapRest!51283 ((as const (Array (_ BitVec 32) ValueCell!15698)) mapDefault!51292)))))

(declare-fun e!727567 () Bool)

(assert (=> mapNonEmpty!51283 (= tp!97752 (and e!727567 mapRes!51292))))

(declare-fun b!1274969 () Bool)

(assert (=> b!1274969 (= e!727567 tp_is_empty!33103)))

(declare-fun b!1274968 () Bool)

(assert (=> b!1274968 (= e!727568 tp_is_empty!33103)))

(declare-fun mapIsEmpty!51292 () Bool)

(assert (=> mapIsEmpty!51292 mapRes!51292))

(assert (= (and mapNonEmpty!51283 condMapEmpty!51292) mapIsEmpty!51292))

(assert (= (and mapNonEmpty!51283 (not condMapEmpty!51292)) mapNonEmpty!51292))

(assert (= (and mapNonEmpty!51292 ((_ is ValueCellFull!15698) mapValue!51292)) b!1274968))

(assert (= (and mapNonEmpty!51283 ((_ is ValueCellFull!15698) mapDefault!51292)) b!1274969))

(declare-fun m!1172357 () Bool)

(assert (=> mapNonEmpty!51292 m!1172357))

(check-sat tp_is_empty!33103 (not b!1274960) (not d!140471) (not b!1274959) (not bm!62665) (not b_next!27733) (not mapNonEmpty!51292) (not b!1274947) b_and!45791)
(check-sat b_and!45791 (not b_next!27733))
