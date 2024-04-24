; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80084 () Bool)

(assert start!80084)

(declare-fun b!940639 () Bool)

(declare-fun b_free!17797 () Bool)

(declare-fun b_next!17797 () Bool)

(assert (=> b!940639 (= b_free!17797 (not b_next!17797))))

(declare-fun tp!61860 () Bool)

(declare-fun b_and!29219 () Bool)

(assert (=> b!940639 (= tp!61860 b_and!29219)))

(declare-fun mapIsEmpty!32241 () Bool)

(declare-fun mapRes!32241 () Bool)

(assert (=> mapIsEmpty!32241 mapRes!32241))

(declare-fun b!940635 () Bool)

(declare-fun res!632351 () Bool)

(declare-fun e!528489 () Bool)

(assert (=> b!940635 (=> (not res!632351) (not e!528489))))

(declare-datatypes ((V!32039 0))(
  ( (V!32040 (val!10203 Int)) )
))
(declare-datatypes ((ValueCell!9671 0))(
  ( (ValueCellFull!9671 (v!12731 V!32039)) (EmptyCell!9671) )
))
(declare-datatypes ((array!56605 0))(
  ( (array!56606 (arr!27235 (Array (_ BitVec 32) ValueCell!9671)) (size!27696 (_ BitVec 32))) )
))
(declare-datatypes ((array!56607 0))(
  ( (array!56608 (arr!27236 (Array (_ BitVec 32) (_ BitVec 64))) (size!27697 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4492 0))(
  ( (LongMapFixedSize!4493 (defaultEntry!5537 Int) (mask!27100 (_ BitVec 32)) (extraKeys!5269 (_ BitVec 32)) (zeroValue!5373 V!32039) (minValue!5373 V!32039) (_size!2301 (_ BitVec 32)) (_keys!10414 array!56607) (_values!5560 array!56605) (_vacant!2301 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4492)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940635 (= res!632351 (validMask!0 (mask!27100 thiss!1141)))))

(declare-fun b!940636 () Bool)

(declare-fun res!632350 () Bool)

(assert (=> b!940636 (=> (not res!632350) (not e!528489))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940636 (= res!632350 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940637 () Bool)

(declare-fun e!528491 () Bool)

(declare-fun tp_is_empty!20305 () Bool)

(assert (=> b!940637 (= e!528491 tp_is_empty!20305)))

(declare-fun res!632352 () Bool)

(assert (=> start!80084 (=> (not res!632352) (not e!528489))))

(declare-fun valid!1733 (LongMapFixedSize!4492) Bool)

(assert (=> start!80084 (= res!632352 (valid!1733 thiss!1141))))

(assert (=> start!80084 e!528489))

(declare-fun e!528493 () Bool)

(assert (=> start!80084 e!528493))

(assert (=> start!80084 true))

(declare-fun mapNonEmpty!32241 () Bool)

(declare-fun tp!61859 () Bool)

(assert (=> mapNonEmpty!32241 (= mapRes!32241 (and tp!61859 e!528491))))

(declare-fun mapKey!32241 () (_ BitVec 32))

(declare-fun mapRest!32241 () (Array (_ BitVec 32) ValueCell!9671))

(declare-fun mapValue!32241 () ValueCell!9671)

(assert (=> mapNonEmpty!32241 (= (arr!27235 (_values!5560 thiss!1141)) (store mapRest!32241 mapKey!32241 mapValue!32241))))

(declare-fun b!940638 () Bool)

(declare-fun e!528494 () Bool)

(assert (=> b!940638 (= e!528494 tp_is_empty!20305)))

(declare-fun e!528490 () Bool)

(declare-fun array_inv!21266 (array!56607) Bool)

(declare-fun array_inv!21267 (array!56605) Bool)

(assert (=> b!940639 (= e!528493 (and tp!61860 tp_is_empty!20305 (array_inv!21266 (_keys!10414 thiss!1141)) (array_inv!21267 (_values!5560 thiss!1141)) e!528490))))

(declare-fun b!940640 () Bool)

(assert (=> b!940640 (= e!528490 (and e!528494 mapRes!32241))))

(declare-fun condMapEmpty!32241 () Bool)

(declare-fun mapDefault!32241 () ValueCell!9671)

(assert (=> b!940640 (= condMapEmpty!32241 (= (arr!27235 (_values!5560 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9671)) mapDefault!32241)))))

(declare-fun b!940641 () Bool)

(assert (=> b!940641 (= e!528489 (not (= (size!27697 (_keys!10414 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27100 thiss!1141)))))))

(assert (= (and start!80084 res!632352) b!940636))

(assert (= (and b!940636 res!632350) b!940635))

(assert (= (and b!940635 res!632351) b!940641))

(assert (= (and b!940640 condMapEmpty!32241) mapIsEmpty!32241))

(assert (= (and b!940640 (not condMapEmpty!32241)) mapNonEmpty!32241))

(get-info :version)

(assert (= (and mapNonEmpty!32241 ((_ is ValueCellFull!9671) mapValue!32241)) b!940637))

(assert (= (and b!940640 ((_ is ValueCellFull!9671) mapDefault!32241)) b!940638))

(assert (= b!940639 b!940640))

(assert (= start!80084 b!940639))

(declare-fun m!876779 () Bool)

(assert (=> b!940635 m!876779))

(declare-fun m!876781 () Bool)

(assert (=> start!80084 m!876781))

(declare-fun m!876783 () Bool)

(assert (=> mapNonEmpty!32241 m!876783))

(declare-fun m!876785 () Bool)

(assert (=> b!940639 m!876785))

(declare-fun m!876787 () Bool)

(assert (=> b!940639 m!876787))

(check-sat b_and!29219 (not mapNonEmpty!32241) (not b!940635) tp_is_empty!20305 (not b_next!17797) (not b!940639) (not start!80084))
(check-sat b_and!29219 (not b_next!17797))
(get-model)

(declare-fun d!114293 () Bool)

(assert (=> d!114293 (= (validMask!0 (mask!27100 thiss!1141)) (and (or (= (mask!27100 thiss!1141) #b00000000000000000000000000000111) (= (mask!27100 thiss!1141) #b00000000000000000000000000001111) (= (mask!27100 thiss!1141) #b00000000000000000000000000011111) (= (mask!27100 thiss!1141) #b00000000000000000000000000111111) (= (mask!27100 thiss!1141) #b00000000000000000000000001111111) (= (mask!27100 thiss!1141) #b00000000000000000000000011111111) (= (mask!27100 thiss!1141) #b00000000000000000000000111111111) (= (mask!27100 thiss!1141) #b00000000000000000000001111111111) (= (mask!27100 thiss!1141) #b00000000000000000000011111111111) (= (mask!27100 thiss!1141) #b00000000000000000000111111111111) (= (mask!27100 thiss!1141) #b00000000000000000001111111111111) (= (mask!27100 thiss!1141) #b00000000000000000011111111111111) (= (mask!27100 thiss!1141) #b00000000000000000111111111111111) (= (mask!27100 thiss!1141) #b00000000000000001111111111111111) (= (mask!27100 thiss!1141) #b00000000000000011111111111111111) (= (mask!27100 thiss!1141) #b00000000000000111111111111111111) (= (mask!27100 thiss!1141) #b00000000000001111111111111111111) (= (mask!27100 thiss!1141) #b00000000000011111111111111111111) (= (mask!27100 thiss!1141) #b00000000000111111111111111111111) (= (mask!27100 thiss!1141) #b00000000001111111111111111111111) (= (mask!27100 thiss!1141) #b00000000011111111111111111111111) (= (mask!27100 thiss!1141) #b00000000111111111111111111111111) (= (mask!27100 thiss!1141) #b00000001111111111111111111111111) (= (mask!27100 thiss!1141) #b00000011111111111111111111111111) (= (mask!27100 thiss!1141) #b00000111111111111111111111111111) (= (mask!27100 thiss!1141) #b00001111111111111111111111111111) (= (mask!27100 thiss!1141) #b00011111111111111111111111111111) (= (mask!27100 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27100 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!940635 d!114293))

(declare-fun d!114295 () Bool)

(declare-fun res!632377 () Bool)

(declare-fun e!528533 () Bool)

(assert (=> d!114295 (=> (not res!632377) (not e!528533))))

(declare-fun simpleValid!337 (LongMapFixedSize!4492) Bool)

(assert (=> d!114295 (= res!632377 (simpleValid!337 thiss!1141))))

(assert (=> d!114295 (= (valid!1733 thiss!1141) e!528533)))

(declare-fun b!940690 () Bool)

(declare-fun res!632378 () Bool)

(assert (=> b!940690 (=> (not res!632378) (not e!528533))))

(declare-fun arrayCountValidKeys!0 (array!56607 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!940690 (= res!632378 (= (arrayCountValidKeys!0 (_keys!10414 thiss!1141) #b00000000000000000000000000000000 (size!27697 (_keys!10414 thiss!1141))) (_size!2301 thiss!1141)))))

(declare-fun b!940691 () Bool)

(declare-fun res!632379 () Bool)

(assert (=> b!940691 (=> (not res!632379) (not e!528533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56607 (_ BitVec 32)) Bool)

(assert (=> b!940691 (= res!632379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10414 thiss!1141) (mask!27100 thiss!1141)))))

(declare-fun b!940692 () Bool)

(declare-datatypes ((List!19166 0))(
  ( (Nil!19163) (Cons!19162 (h!20314 (_ BitVec 64)) (t!27473 List!19166)) )
))
(declare-fun arrayNoDuplicates!0 (array!56607 (_ BitVec 32) List!19166) Bool)

(assert (=> b!940692 (= e!528533 (arrayNoDuplicates!0 (_keys!10414 thiss!1141) #b00000000000000000000000000000000 Nil!19163))))

(assert (= (and d!114295 res!632377) b!940690))

(assert (= (and b!940690 res!632378) b!940691))

(assert (= (and b!940691 res!632379) b!940692))

(declare-fun m!876809 () Bool)

(assert (=> d!114295 m!876809))

(declare-fun m!876811 () Bool)

(assert (=> b!940690 m!876811))

(declare-fun m!876813 () Bool)

(assert (=> b!940691 m!876813))

(declare-fun m!876815 () Bool)

(assert (=> b!940692 m!876815))

(assert (=> start!80084 d!114295))

(declare-fun d!114297 () Bool)

(assert (=> d!114297 (= (array_inv!21266 (_keys!10414 thiss!1141)) (bvsge (size!27697 (_keys!10414 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!940639 d!114297))

(declare-fun d!114299 () Bool)

(assert (=> d!114299 (= (array_inv!21267 (_values!5560 thiss!1141)) (bvsge (size!27696 (_values!5560 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!940639 d!114299))

(declare-fun condMapEmpty!32250 () Bool)

(declare-fun mapDefault!32250 () ValueCell!9671)

(assert (=> mapNonEmpty!32241 (= condMapEmpty!32250 (= mapRest!32241 ((as const (Array (_ BitVec 32) ValueCell!9671)) mapDefault!32250)))))

(declare-fun e!528539 () Bool)

(declare-fun mapRes!32250 () Bool)

(assert (=> mapNonEmpty!32241 (= tp!61859 (and e!528539 mapRes!32250))))

(declare-fun b!940700 () Bool)

(assert (=> b!940700 (= e!528539 tp_is_empty!20305)))

(declare-fun mapIsEmpty!32250 () Bool)

(assert (=> mapIsEmpty!32250 mapRes!32250))

(declare-fun b!940699 () Bool)

(declare-fun e!528538 () Bool)

(assert (=> b!940699 (= e!528538 tp_is_empty!20305)))

(declare-fun mapNonEmpty!32250 () Bool)

(declare-fun tp!61875 () Bool)

(assert (=> mapNonEmpty!32250 (= mapRes!32250 (and tp!61875 e!528538))))

(declare-fun mapValue!32250 () ValueCell!9671)

(declare-fun mapKey!32250 () (_ BitVec 32))

(declare-fun mapRest!32250 () (Array (_ BitVec 32) ValueCell!9671))

(assert (=> mapNonEmpty!32250 (= mapRest!32241 (store mapRest!32250 mapKey!32250 mapValue!32250))))

(assert (= (and mapNonEmpty!32241 condMapEmpty!32250) mapIsEmpty!32250))

(assert (= (and mapNonEmpty!32241 (not condMapEmpty!32250)) mapNonEmpty!32250))

(assert (= (and mapNonEmpty!32250 ((_ is ValueCellFull!9671) mapValue!32250)) b!940699))

(assert (= (and mapNonEmpty!32241 ((_ is ValueCellFull!9671) mapDefault!32250)) b!940700))

(declare-fun m!876817 () Bool)

(assert (=> mapNonEmpty!32250 m!876817))

(check-sat b_and!29219 tp_is_empty!20305 (not mapNonEmpty!32250) (not b_next!17797) (not d!114295) (not b!940691) (not b!940692) (not b!940690))
(check-sat b_and!29219 (not b_next!17797))
(get-model)

(declare-fun d!114301 () Bool)

(declare-fun res!632387 () Bool)

(declare-fun e!528550 () Bool)

(assert (=> d!114301 (=> res!632387 e!528550)))

(assert (=> d!114301 (= res!632387 (bvsge #b00000000000000000000000000000000 (size!27697 (_keys!10414 thiss!1141))))))

(assert (=> d!114301 (= (arrayNoDuplicates!0 (_keys!10414 thiss!1141) #b00000000000000000000000000000000 Nil!19163) e!528550)))

(declare-fun b!940711 () Bool)

(declare-fun e!528548 () Bool)

(declare-fun call!40953 () Bool)

(assert (=> b!940711 (= e!528548 call!40953)))

(declare-fun b!940712 () Bool)

(declare-fun e!528549 () Bool)

(declare-fun contains!5133 (List!19166 (_ BitVec 64)) Bool)

(assert (=> b!940712 (= e!528549 (contains!5133 Nil!19163 (select (arr!27236 (_keys!10414 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!940713 () Bool)

(declare-fun e!528551 () Bool)

(assert (=> b!940713 (= e!528551 e!528548)))

(declare-fun c!98299 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!940713 (= c!98299 (validKeyInArray!0 (select (arr!27236 (_keys!10414 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40950 () Bool)

(assert (=> bm!40950 (= call!40953 (arrayNoDuplicates!0 (_keys!10414 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98299 (Cons!19162 (select (arr!27236 (_keys!10414 thiss!1141)) #b00000000000000000000000000000000) Nil!19163) Nil!19163)))))

(declare-fun b!940714 () Bool)

(assert (=> b!940714 (= e!528550 e!528551)))

(declare-fun res!632386 () Bool)

(assert (=> b!940714 (=> (not res!632386) (not e!528551))))

(assert (=> b!940714 (= res!632386 (not e!528549))))

(declare-fun res!632388 () Bool)

(assert (=> b!940714 (=> (not res!632388) (not e!528549))))

(assert (=> b!940714 (= res!632388 (validKeyInArray!0 (select (arr!27236 (_keys!10414 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!940715 () Bool)

(assert (=> b!940715 (= e!528548 call!40953)))

(assert (= (and d!114301 (not res!632387)) b!940714))

(assert (= (and b!940714 res!632388) b!940712))

(assert (= (and b!940714 res!632386) b!940713))

(assert (= (and b!940713 c!98299) b!940715))

(assert (= (and b!940713 (not c!98299)) b!940711))

(assert (= (or b!940715 b!940711) bm!40950))

(declare-fun m!876819 () Bool)

(assert (=> b!940712 m!876819))

(assert (=> b!940712 m!876819))

(declare-fun m!876821 () Bool)

(assert (=> b!940712 m!876821))

(assert (=> b!940713 m!876819))

(assert (=> b!940713 m!876819))

(declare-fun m!876823 () Bool)

(assert (=> b!940713 m!876823))

(assert (=> bm!40950 m!876819))

(declare-fun m!876825 () Bool)

(assert (=> bm!40950 m!876825))

(assert (=> b!940714 m!876819))

(assert (=> b!940714 m!876819))

(assert (=> b!940714 m!876823))

(assert (=> b!940692 d!114301))

(declare-fun d!114303 () Bool)

(declare-fun res!632398 () Bool)

(declare-fun e!528554 () Bool)

(assert (=> d!114303 (=> (not res!632398) (not e!528554))))

(assert (=> d!114303 (= res!632398 (validMask!0 (mask!27100 thiss!1141)))))

(assert (=> d!114303 (= (simpleValid!337 thiss!1141) e!528554)))

(declare-fun b!940726 () Bool)

(declare-fun res!632399 () Bool)

(assert (=> b!940726 (=> (not res!632399) (not e!528554))))

(declare-fun size!27702 (LongMapFixedSize!4492) (_ BitVec 32))

(assert (=> b!940726 (= res!632399 (= (size!27702 thiss!1141) (bvadd (_size!2301 thiss!1141) (bvsdiv (bvadd (extraKeys!5269 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!940725 () Bool)

(declare-fun res!632400 () Bool)

(assert (=> b!940725 (=> (not res!632400) (not e!528554))))

(assert (=> b!940725 (= res!632400 (bvsge (size!27702 thiss!1141) (_size!2301 thiss!1141)))))

(declare-fun b!940727 () Bool)

(assert (=> b!940727 (= e!528554 (and (bvsge (extraKeys!5269 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5269 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2301 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!940724 () Bool)

(declare-fun res!632397 () Bool)

(assert (=> b!940724 (=> (not res!632397) (not e!528554))))

(assert (=> b!940724 (= res!632397 (and (= (size!27696 (_values!5560 thiss!1141)) (bvadd (mask!27100 thiss!1141) #b00000000000000000000000000000001)) (= (size!27697 (_keys!10414 thiss!1141)) (size!27696 (_values!5560 thiss!1141))) (bvsge (_size!2301 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2301 thiss!1141) (bvadd (mask!27100 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!114303 res!632398) b!940724))

(assert (= (and b!940724 res!632397) b!940725))

(assert (= (and b!940725 res!632400) b!940726))

(assert (= (and b!940726 res!632399) b!940727))

(assert (=> d!114303 m!876779))

(declare-fun m!876827 () Bool)

(assert (=> b!940726 m!876827))

(assert (=> b!940725 m!876827))

(assert (=> d!114295 d!114303))

(declare-fun b!940736 () Bool)

(declare-fun e!528559 () (_ BitVec 32))

(declare-fun call!40956 () (_ BitVec 32))

(assert (=> b!940736 (= e!528559 (bvadd #b00000000000000000000000000000001 call!40956))))

(declare-fun b!940737 () Bool)

(declare-fun e!528560 () (_ BitVec 32))

(assert (=> b!940737 (= e!528560 #b00000000000000000000000000000000)))

(declare-fun b!940738 () Bool)

(assert (=> b!940738 (= e!528559 call!40956)))

(declare-fun b!940739 () Bool)

(assert (=> b!940739 (= e!528560 e!528559)))

(declare-fun c!98305 () Bool)

(assert (=> b!940739 (= c!98305 (validKeyInArray!0 (select (arr!27236 (_keys!10414 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40953 () Bool)

(assert (=> bm!40953 (= call!40956 (arrayCountValidKeys!0 (_keys!10414 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27697 (_keys!10414 thiss!1141))))))

(declare-fun d!114305 () Bool)

(declare-fun lt!424940 () (_ BitVec 32))

(assert (=> d!114305 (and (bvsge lt!424940 #b00000000000000000000000000000000) (bvsle lt!424940 (bvsub (size!27697 (_keys!10414 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114305 (= lt!424940 e!528560)))

(declare-fun c!98304 () Bool)

(assert (=> d!114305 (= c!98304 (bvsge #b00000000000000000000000000000000 (size!27697 (_keys!10414 thiss!1141))))))

(assert (=> d!114305 (and (bvsle #b00000000000000000000000000000000 (size!27697 (_keys!10414 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27697 (_keys!10414 thiss!1141)) (size!27697 (_keys!10414 thiss!1141))))))

(assert (=> d!114305 (= (arrayCountValidKeys!0 (_keys!10414 thiss!1141) #b00000000000000000000000000000000 (size!27697 (_keys!10414 thiss!1141))) lt!424940)))

(assert (= (and d!114305 c!98304) b!940737))

(assert (= (and d!114305 (not c!98304)) b!940739))

(assert (= (and b!940739 c!98305) b!940736))

(assert (= (and b!940739 (not c!98305)) b!940738))

(assert (= (or b!940736 b!940738) bm!40953))

(assert (=> b!940739 m!876819))

(assert (=> b!940739 m!876819))

(assert (=> b!940739 m!876823))

(declare-fun m!876829 () Bool)

(assert (=> bm!40953 m!876829))

(assert (=> b!940690 d!114305))

(declare-fun bm!40956 () Bool)

(declare-fun call!40959 () Bool)

(assert (=> bm!40956 (= call!40959 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10414 thiss!1141) (mask!27100 thiss!1141)))))

(declare-fun b!940748 () Bool)

(declare-fun e!528569 () Bool)

(declare-fun e!528567 () Bool)

(assert (=> b!940748 (= e!528569 e!528567)))

(declare-fun c!98308 () Bool)

(assert (=> b!940748 (= c!98308 (validKeyInArray!0 (select (arr!27236 (_keys!10414 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!940749 () Bool)

(assert (=> b!940749 (= e!528567 call!40959)))

(declare-fun b!940750 () Bool)

(declare-fun e!528568 () Bool)

(assert (=> b!940750 (= e!528567 e!528568)))

(declare-fun lt!424949 () (_ BitVec 64))

(assert (=> b!940750 (= lt!424949 (select (arr!27236 (_keys!10414 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31736 0))(
  ( (Unit!31737) )
))
(declare-fun lt!424948 () Unit!31736)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56607 (_ BitVec 64) (_ BitVec 32)) Unit!31736)

(assert (=> b!940750 (= lt!424948 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10414 thiss!1141) lt!424949 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940750 (arrayContainsKey!0 (_keys!10414 thiss!1141) lt!424949 #b00000000000000000000000000000000)))

(declare-fun lt!424947 () Unit!31736)

(assert (=> b!940750 (= lt!424947 lt!424948)))

(declare-fun res!632406 () Bool)

(declare-datatypes ((SeekEntryResult!8938 0))(
  ( (MissingZero!8938 (index!38123 (_ BitVec 32))) (Found!8938 (index!38124 (_ BitVec 32))) (Intermediate!8938 (undefined!9750 Bool) (index!38125 (_ BitVec 32)) (x!80533 (_ BitVec 32))) (Undefined!8938) (MissingVacant!8938 (index!38126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56607 (_ BitVec 32)) SeekEntryResult!8938)

(assert (=> b!940750 (= res!632406 (= (seekEntryOrOpen!0 (select (arr!27236 (_keys!10414 thiss!1141)) #b00000000000000000000000000000000) (_keys!10414 thiss!1141) (mask!27100 thiss!1141)) (Found!8938 #b00000000000000000000000000000000)))))

(assert (=> b!940750 (=> (not res!632406) (not e!528568))))

(declare-fun b!940751 () Bool)

(assert (=> b!940751 (= e!528568 call!40959)))

(declare-fun d!114307 () Bool)

(declare-fun res!632405 () Bool)

(assert (=> d!114307 (=> res!632405 e!528569)))

(assert (=> d!114307 (= res!632405 (bvsge #b00000000000000000000000000000000 (size!27697 (_keys!10414 thiss!1141))))))

(assert (=> d!114307 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10414 thiss!1141) (mask!27100 thiss!1141)) e!528569)))

(assert (= (and d!114307 (not res!632405)) b!940748))

(assert (= (and b!940748 c!98308) b!940750))

(assert (= (and b!940748 (not c!98308)) b!940749))

(assert (= (and b!940750 res!632406) b!940751))

(assert (= (or b!940751 b!940749) bm!40956))

(declare-fun m!876831 () Bool)

(assert (=> bm!40956 m!876831))

(assert (=> b!940748 m!876819))

(assert (=> b!940748 m!876819))

(assert (=> b!940748 m!876823))

(assert (=> b!940750 m!876819))

(declare-fun m!876833 () Bool)

(assert (=> b!940750 m!876833))

(declare-fun m!876835 () Bool)

(assert (=> b!940750 m!876835))

(assert (=> b!940750 m!876819))

(declare-fun m!876837 () Bool)

(assert (=> b!940750 m!876837))

(assert (=> b!940691 d!114307))

(declare-fun condMapEmpty!32251 () Bool)

(declare-fun mapDefault!32251 () ValueCell!9671)

(assert (=> mapNonEmpty!32250 (= condMapEmpty!32251 (= mapRest!32250 ((as const (Array (_ BitVec 32) ValueCell!9671)) mapDefault!32251)))))

(declare-fun e!528571 () Bool)

(declare-fun mapRes!32251 () Bool)

(assert (=> mapNonEmpty!32250 (= tp!61875 (and e!528571 mapRes!32251))))

(declare-fun b!940753 () Bool)

(assert (=> b!940753 (= e!528571 tp_is_empty!20305)))

(declare-fun mapIsEmpty!32251 () Bool)

(assert (=> mapIsEmpty!32251 mapRes!32251))

(declare-fun b!940752 () Bool)

(declare-fun e!528570 () Bool)

(assert (=> b!940752 (= e!528570 tp_is_empty!20305)))

(declare-fun mapNonEmpty!32251 () Bool)

(declare-fun tp!61876 () Bool)

(assert (=> mapNonEmpty!32251 (= mapRes!32251 (and tp!61876 e!528570))))

(declare-fun mapValue!32251 () ValueCell!9671)

(declare-fun mapKey!32251 () (_ BitVec 32))

(declare-fun mapRest!32251 () (Array (_ BitVec 32) ValueCell!9671))

(assert (=> mapNonEmpty!32251 (= mapRest!32250 (store mapRest!32251 mapKey!32251 mapValue!32251))))

(assert (= (and mapNonEmpty!32250 condMapEmpty!32251) mapIsEmpty!32251))

(assert (= (and mapNonEmpty!32250 (not condMapEmpty!32251)) mapNonEmpty!32251))

(assert (= (and mapNonEmpty!32251 ((_ is ValueCellFull!9671) mapValue!32251)) b!940752))

(assert (= (and mapNonEmpty!32250 ((_ is ValueCellFull!9671) mapDefault!32251)) b!940753))

(declare-fun m!876839 () Bool)

(assert (=> mapNonEmpty!32251 m!876839))

(check-sat (not b!940713) (not bm!40950) (not b!940726) (not b!940750) (not b_next!17797) b_and!29219 (not bm!40953) (not b!940748) (not b!940725) (not b!940712) (not b!940739) (not d!114303) (not mapNonEmpty!32251) tp_is_empty!20305 (not b!940714) (not bm!40956))
(check-sat b_and!29219 (not b_next!17797))
