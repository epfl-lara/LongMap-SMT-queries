; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80444 () Bool)

(assert start!80444)

(declare-fun b!945049 () Bool)

(declare-fun b_free!18087 () Bool)

(declare-fun b_next!18087 () Bool)

(assert (=> b!945049 (= b_free!18087 (not b_next!18087))))

(declare-fun tp!62771 () Bool)

(declare-fun b_and!29505 () Bool)

(assert (=> b!945049 (= tp!62771 b_and!29505)))

(declare-fun b!945046 () Bool)

(declare-fun e!531487 () Bool)

(declare-fun tp_is_empty!20595 () Bool)

(assert (=> b!945046 (= e!531487 tp_is_empty!20595)))

(declare-fun b!945047 () Bool)

(declare-fun res!634817 () Bool)

(declare-fun e!531485 () Bool)

(assert (=> b!945047 (=> (not res!634817) (not e!531485))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!945047 (= res!634817 (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!32718 () Bool)

(declare-fun mapRes!32718 () Bool)

(declare-fun tp!62770 () Bool)

(declare-fun e!531490 () Bool)

(assert (=> mapNonEmpty!32718 (= mapRes!32718 (and tp!62770 e!531490))))

(declare-fun mapKey!32718 () (_ BitVec 32))

(declare-datatypes ((V!32425 0))(
  ( (V!32426 (val!10348 Int)) )
))
(declare-datatypes ((ValueCell!9816 0))(
  ( (ValueCellFull!9816 (v!12880 V!32425)) (EmptyCell!9816) )
))
(declare-datatypes ((array!57158 0))(
  ( (array!57159 (arr!27504 (Array (_ BitVec 32) ValueCell!9816)) (size!27970 (_ BitVec 32))) )
))
(declare-datatypes ((array!57160 0))(
  ( (array!57161 (arr!27505 (Array (_ BitVec 32) (_ BitVec 64))) (size!27971 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4782 0))(
  ( (LongMapFixedSize!4783 (defaultEntry!5686 Int) (mask!27348 (_ BitVec 32)) (extraKeys!5418 (_ BitVec 32)) (zeroValue!5522 V!32425) (minValue!5522 V!32425) (_size!2446 (_ BitVec 32)) (_keys!10564 array!57160) (_values!5709 array!57158) (_vacant!2446 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4782)

(declare-fun mapValue!32718 () ValueCell!9816)

(declare-fun mapRest!32718 () (Array (_ BitVec 32) ValueCell!9816))

(assert (=> mapNonEmpty!32718 (= (arr!27504 (_values!5709 thiss!1141)) (store mapRest!32718 mapKey!32718 mapValue!32718))))

(declare-fun b!945048 () Bool)

(declare-fun e!531486 () Bool)

(assert (=> b!945048 (= e!531486 (and e!531487 mapRes!32718))))

(declare-fun condMapEmpty!32718 () Bool)

(declare-fun mapDefault!32718 () ValueCell!9816)

(assert (=> b!945048 (= condMapEmpty!32718 (= (arr!27504 (_values!5709 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9816)) mapDefault!32718)))))

(declare-fun e!531489 () Bool)

(declare-fun array_inv!21368 (array!57160) Bool)

(declare-fun array_inv!21369 (array!57158) Bool)

(assert (=> b!945049 (= e!531489 (and tp!62771 tp_is_empty!20595 (array_inv!21368 (_keys!10564 thiss!1141)) (array_inv!21369 (_values!5709 thiss!1141)) e!531486))))

(declare-fun mapIsEmpty!32718 () Bool)

(assert (=> mapIsEmpty!32718 mapRes!32718))

(declare-fun b!945050 () Bool)

(assert (=> b!945050 (= e!531490 tp_is_empty!20595)))

(declare-fun res!634818 () Bool)

(assert (=> start!80444 (=> (not res!634818) (not e!531485))))

(declare-fun valid!1828 (LongMapFixedSize!4782) Bool)

(assert (=> start!80444 (= res!634818 (valid!1828 thiss!1141))))

(assert (=> start!80444 e!531485))

(assert (=> start!80444 e!531489))

(assert (=> start!80444 true))

(declare-fun b!945051 () Bool)

(declare-datatypes ((tuple2!13504 0))(
  ( (tuple2!13505 (_1!6763 (_ BitVec 64)) (_2!6763 V!32425)) )
))
(declare-datatypes ((List!19286 0))(
  ( (Nil!19283) (Cons!19282 (h!20433 tuple2!13504) (t!27603 List!19286)) )
))
(declare-datatypes ((ListLongMap!12201 0))(
  ( (ListLongMap!12202 (toList!6116 List!19286)) )
))
(declare-fun contains!5188 (ListLongMap!12201 (_ BitVec 64)) Bool)

(declare-fun map!13029 (LongMapFixedSize!4782) ListLongMap!12201)

(assert (=> b!945051 (= e!531485 (not (= (not (= (bvand (extraKeys!5418 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (contains!5188 (map!13029 thiss!1141) key!756))))))

(assert (= (and start!80444 res!634818) b!945047))

(assert (= (and b!945047 res!634817) b!945051))

(assert (= (and b!945048 condMapEmpty!32718) mapIsEmpty!32718))

(assert (= (and b!945048 (not condMapEmpty!32718)) mapNonEmpty!32718))

(get-info :version)

(assert (= (and mapNonEmpty!32718 ((_ is ValueCellFull!9816) mapValue!32718)) b!945050))

(assert (= (and b!945048 ((_ is ValueCellFull!9816) mapDefault!32718)) b!945046))

(assert (= b!945049 b!945048))

(assert (= start!80444 b!945049))

(declare-fun m!878991 () Bool)

(assert (=> mapNonEmpty!32718 m!878991))

(declare-fun m!878993 () Bool)

(assert (=> b!945049 m!878993))

(declare-fun m!878995 () Bool)

(assert (=> b!945049 m!878995))

(declare-fun m!878997 () Bool)

(assert (=> start!80444 m!878997))

(declare-fun m!878999 () Bool)

(assert (=> b!945051 m!878999))

(assert (=> b!945051 m!878999))

(declare-fun m!879001 () Bool)

(assert (=> b!945051 m!879001))

(check-sat (not start!80444) (not b!945051) tp_is_empty!20595 (not mapNonEmpty!32718) (not b!945049) (not b_next!18087) b_and!29505)
(check-sat b_and!29505 (not b_next!18087))
(get-model)

(declare-fun d!114345 () Bool)

(declare-fun e!531513 () Bool)

(assert (=> d!114345 e!531513))

(declare-fun res!634827 () Bool)

(assert (=> d!114345 (=> res!634827 e!531513)))

(declare-fun lt!425847 () Bool)

(assert (=> d!114345 (= res!634827 (not lt!425847))))

(declare-fun lt!425849 () Bool)

(assert (=> d!114345 (= lt!425847 lt!425849)))

(declare-datatypes ((Unit!31882 0))(
  ( (Unit!31883) )
))
(declare-fun lt!425850 () Unit!31882)

(declare-fun e!531514 () Unit!31882)

(assert (=> d!114345 (= lt!425850 e!531514)))

(declare-fun c!98345 () Bool)

(assert (=> d!114345 (= c!98345 lt!425849)))

(declare-fun containsKey!453 (List!19286 (_ BitVec 64)) Bool)

(assert (=> d!114345 (= lt!425849 (containsKey!453 (toList!6116 (map!13029 thiss!1141)) key!756))))

(assert (=> d!114345 (= (contains!5188 (map!13029 thiss!1141) key!756) lt!425847)))

(declare-fun b!945076 () Bool)

(declare-fun lt!425848 () Unit!31882)

(assert (=> b!945076 (= e!531514 lt!425848)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!349 (List!19286 (_ BitVec 64)) Unit!31882)

(assert (=> b!945076 (= lt!425848 (lemmaContainsKeyImpliesGetValueByKeyDefined!349 (toList!6116 (map!13029 thiss!1141)) key!756))))

(declare-datatypes ((Option!492 0))(
  ( (Some!491 (v!12882 V!32425)) (None!490) )
))
(declare-fun isDefined!358 (Option!492) Bool)

(declare-fun getValueByKey!486 (List!19286 (_ BitVec 64)) Option!492)

(assert (=> b!945076 (isDefined!358 (getValueByKey!486 (toList!6116 (map!13029 thiss!1141)) key!756))))

(declare-fun b!945077 () Bool)

(declare-fun Unit!31884 () Unit!31882)

(assert (=> b!945077 (= e!531514 Unit!31884)))

(declare-fun b!945078 () Bool)

(assert (=> b!945078 (= e!531513 (isDefined!358 (getValueByKey!486 (toList!6116 (map!13029 thiss!1141)) key!756)))))

(assert (= (and d!114345 c!98345) b!945076))

(assert (= (and d!114345 (not c!98345)) b!945077))

(assert (= (and d!114345 (not res!634827)) b!945078))

(declare-fun m!879015 () Bool)

(assert (=> d!114345 m!879015))

(declare-fun m!879017 () Bool)

(assert (=> b!945076 m!879017))

(declare-fun m!879019 () Bool)

(assert (=> b!945076 m!879019))

(assert (=> b!945076 m!879019))

(declare-fun m!879021 () Bool)

(assert (=> b!945076 m!879021))

(assert (=> b!945078 m!879019))

(assert (=> b!945078 m!879019))

(assert (=> b!945078 m!879021))

(assert (=> b!945051 d!114345))

(declare-fun d!114347 () Bool)

(declare-fun getCurrentListMap!3350 (array!57160 array!57158 (_ BitVec 32) (_ BitVec 32) V!32425 V!32425 (_ BitVec 32) Int) ListLongMap!12201)

(assert (=> d!114347 (= (map!13029 thiss!1141) (getCurrentListMap!3350 (_keys!10564 thiss!1141) (_values!5709 thiss!1141) (mask!27348 thiss!1141) (extraKeys!5418 thiss!1141) (zeroValue!5522 thiss!1141) (minValue!5522 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5686 thiss!1141)))))

(declare-fun bs!26570 () Bool)

(assert (= bs!26570 d!114347))

(declare-fun m!879023 () Bool)

(assert (=> bs!26570 m!879023))

(assert (=> b!945051 d!114347))

(declare-fun d!114349 () Bool)

(declare-fun res!634834 () Bool)

(declare-fun e!531517 () Bool)

(assert (=> d!114349 (=> (not res!634834) (not e!531517))))

(declare-fun simpleValid!349 (LongMapFixedSize!4782) Bool)

(assert (=> d!114349 (= res!634834 (simpleValid!349 thiss!1141))))

(assert (=> d!114349 (= (valid!1828 thiss!1141) e!531517)))

(declare-fun b!945085 () Bool)

(declare-fun res!634835 () Bool)

(assert (=> b!945085 (=> (not res!634835) (not e!531517))))

(declare-fun arrayCountValidKeys!0 (array!57160 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945085 (= res!634835 (= (arrayCountValidKeys!0 (_keys!10564 thiss!1141) #b00000000000000000000000000000000 (size!27971 (_keys!10564 thiss!1141))) (_size!2446 thiss!1141)))))

(declare-fun b!945086 () Bool)

(declare-fun res!634836 () Bool)

(assert (=> b!945086 (=> (not res!634836) (not e!531517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57160 (_ BitVec 32)) Bool)

(assert (=> b!945086 (= res!634836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10564 thiss!1141) (mask!27348 thiss!1141)))))

(declare-fun b!945087 () Bool)

(declare-datatypes ((List!19287 0))(
  ( (Nil!19284) (Cons!19283 (h!20434 (_ BitVec 64)) (t!27604 List!19287)) )
))
(declare-fun arrayNoDuplicates!0 (array!57160 (_ BitVec 32) List!19287) Bool)

(assert (=> b!945087 (= e!531517 (arrayNoDuplicates!0 (_keys!10564 thiss!1141) #b00000000000000000000000000000000 Nil!19284))))

(assert (= (and d!114349 res!634834) b!945085))

(assert (= (and b!945085 res!634835) b!945086))

(assert (= (and b!945086 res!634836) b!945087))

(declare-fun m!879025 () Bool)

(assert (=> d!114349 m!879025))

(declare-fun m!879027 () Bool)

(assert (=> b!945085 m!879027))

(declare-fun m!879029 () Bool)

(assert (=> b!945086 m!879029))

(declare-fun m!879031 () Bool)

(assert (=> b!945087 m!879031))

(assert (=> start!80444 d!114349))

(declare-fun d!114351 () Bool)

(assert (=> d!114351 (= (array_inv!21368 (_keys!10564 thiss!1141)) (bvsge (size!27971 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945049 d!114351))

(declare-fun d!114353 () Bool)

(assert (=> d!114353 (= (array_inv!21369 (_values!5709 thiss!1141)) (bvsge (size!27970 (_values!5709 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945049 d!114353))

(declare-fun mapNonEmpty!32724 () Bool)

(declare-fun mapRes!32724 () Bool)

(declare-fun tp!62780 () Bool)

(declare-fun e!531522 () Bool)

(assert (=> mapNonEmpty!32724 (= mapRes!32724 (and tp!62780 e!531522))))

(declare-fun mapKey!32724 () (_ BitVec 32))

(declare-fun mapRest!32724 () (Array (_ BitVec 32) ValueCell!9816))

(declare-fun mapValue!32724 () ValueCell!9816)

(assert (=> mapNonEmpty!32724 (= mapRest!32718 (store mapRest!32724 mapKey!32724 mapValue!32724))))

(declare-fun mapIsEmpty!32724 () Bool)

(assert (=> mapIsEmpty!32724 mapRes!32724))

(declare-fun b!945094 () Bool)

(assert (=> b!945094 (= e!531522 tp_is_empty!20595)))

(declare-fun b!945095 () Bool)

(declare-fun e!531523 () Bool)

(assert (=> b!945095 (= e!531523 tp_is_empty!20595)))

(declare-fun condMapEmpty!32724 () Bool)

(declare-fun mapDefault!32724 () ValueCell!9816)

(assert (=> mapNonEmpty!32718 (= condMapEmpty!32724 (= mapRest!32718 ((as const (Array (_ BitVec 32) ValueCell!9816)) mapDefault!32724)))))

(assert (=> mapNonEmpty!32718 (= tp!62770 (and e!531523 mapRes!32724))))

(assert (= (and mapNonEmpty!32718 condMapEmpty!32724) mapIsEmpty!32724))

(assert (= (and mapNonEmpty!32718 (not condMapEmpty!32724)) mapNonEmpty!32724))

(assert (= (and mapNonEmpty!32724 ((_ is ValueCellFull!9816) mapValue!32724)) b!945094))

(assert (= (and mapNonEmpty!32718 ((_ is ValueCellFull!9816) mapDefault!32724)) b!945095))

(declare-fun m!879033 () Bool)

(assert (=> mapNonEmpty!32724 m!879033))

(check-sat (not b!945087) (not d!114349) (not b!945085) tp_is_empty!20595 (not b!945076) (not b_next!18087) b_and!29505 (not mapNonEmpty!32724) (not d!114345) (not b!945078) (not b!945086) (not d!114347))
(check-sat b_and!29505 (not b_next!18087))
(get-model)

(declare-fun d!114355 () Bool)

(assert (=> d!114355 (isDefined!358 (getValueByKey!486 (toList!6116 (map!13029 thiss!1141)) key!756))))

(declare-fun lt!425853 () Unit!31882)

(declare-fun choose!1569 (List!19286 (_ BitVec 64)) Unit!31882)

(assert (=> d!114355 (= lt!425853 (choose!1569 (toList!6116 (map!13029 thiss!1141)) key!756))))

(declare-fun e!531526 () Bool)

(assert (=> d!114355 e!531526))

(declare-fun res!634839 () Bool)

(assert (=> d!114355 (=> (not res!634839) (not e!531526))))

(declare-fun isStrictlySorted!506 (List!19286) Bool)

(assert (=> d!114355 (= res!634839 (isStrictlySorted!506 (toList!6116 (map!13029 thiss!1141))))))

(assert (=> d!114355 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!349 (toList!6116 (map!13029 thiss!1141)) key!756) lt!425853)))

(declare-fun b!945098 () Bool)

(assert (=> b!945098 (= e!531526 (containsKey!453 (toList!6116 (map!13029 thiss!1141)) key!756))))

(assert (= (and d!114355 res!634839) b!945098))

(assert (=> d!114355 m!879019))

(assert (=> d!114355 m!879019))

(assert (=> d!114355 m!879021))

(declare-fun m!879035 () Bool)

(assert (=> d!114355 m!879035))

(declare-fun m!879037 () Bool)

(assert (=> d!114355 m!879037))

(assert (=> b!945098 m!879015))

(assert (=> b!945076 d!114355))

(declare-fun d!114357 () Bool)

(declare-fun isEmpty!702 (Option!492) Bool)

(assert (=> d!114357 (= (isDefined!358 (getValueByKey!486 (toList!6116 (map!13029 thiss!1141)) key!756)) (not (isEmpty!702 (getValueByKey!486 (toList!6116 (map!13029 thiss!1141)) key!756))))))

(declare-fun bs!26571 () Bool)

(assert (= bs!26571 d!114357))

(assert (=> bs!26571 m!879019))

(declare-fun m!879039 () Bool)

(assert (=> bs!26571 m!879039))

(assert (=> b!945076 d!114357))

(declare-fun b!945109 () Bool)

(declare-fun e!531532 () Option!492)

(assert (=> b!945109 (= e!531532 (getValueByKey!486 (t!27603 (toList!6116 (map!13029 thiss!1141))) key!756))))

(declare-fun b!945110 () Bool)

(assert (=> b!945110 (= e!531532 None!490)))

(declare-fun b!945108 () Bool)

(declare-fun e!531531 () Option!492)

(assert (=> b!945108 (= e!531531 e!531532)))

(declare-fun c!98351 () Bool)

(assert (=> b!945108 (= c!98351 (and ((_ is Cons!19282) (toList!6116 (map!13029 thiss!1141))) (not (= (_1!6763 (h!20433 (toList!6116 (map!13029 thiss!1141)))) key!756))))))

(declare-fun b!945107 () Bool)

(assert (=> b!945107 (= e!531531 (Some!491 (_2!6763 (h!20433 (toList!6116 (map!13029 thiss!1141))))))))

(declare-fun d!114359 () Bool)

(declare-fun c!98350 () Bool)

(assert (=> d!114359 (= c!98350 (and ((_ is Cons!19282) (toList!6116 (map!13029 thiss!1141))) (= (_1!6763 (h!20433 (toList!6116 (map!13029 thiss!1141)))) key!756)))))

(assert (=> d!114359 (= (getValueByKey!486 (toList!6116 (map!13029 thiss!1141)) key!756) e!531531)))

(assert (= (and d!114359 c!98350) b!945107))

(assert (= (and d!114359 (not c!98350)) b!945108))

(assert (= (and b!945108 c!98351) b!945109))

(assert (= (and b!945108 (not c!98351)) b!945110))

(declare-fun m!879041 () Bool)

(assert (=> b!945109 m!879041))

(assert (=> b!945076 d!114359))

(declare-fun b!945119 () Bool)

(declare-fun e!531540 () Bool)

(declare-fun e!531539 () Bool)

(assert (=> b!945119 (= e!531540 e!531539)))

(declare-fun lt!425861 () (_ BitVec 64))

(assert (=> b!945119 (= lt!425861 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425862 () Unit!31882)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57160 (_ BitVec 64) (_ BitVec 32)) Unit!31882)

(assert (=> b!945119 (= lt!425862 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10564 thiss!1141) lt!425861 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945119 (arrayContainsKey!0 (_keys!10564 thiss!1141) lt!425861 #b00000000000000000000000000000000)))

(declare-fun lt!425860 () Unit!31882)

(assert (=> b!945119 (= lt!425860 lt!425862)))

(declare-fun res!634845 () Bool)

(declare-datatypes ((SeekEntryResult!9083 0))(
  ( (MissingZero!9083 (index!38703 (_ BitVec 32))) (Found!9083 (index!38704 (_ BitVec 32))) (Intermediate!9083 (undefined!9895 Bool) (index!38705 (_ BitVec 32)) (x!81198 (_ BitVec 32))) (Undefined!9083) (MissingVacant!9083 (index!38706 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57160 (_ BitVec 32)) SeekEntryResult!9083)

(assert (=> b!945119 (= res!634845 (= (seekEntryOrOpen!0 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000) (_keys!10564 thiss!1141) (mask!27348 thiss!1141)) (Found!9083 #b00000000000000000000000000000000)))))

(assert (=> b!945119 (=> (not res!634845) (not e!531539))))

(declare-fun bm!40998 () Bool)

(declare-fun call!41001 () Bool)

(assert (=> bm!40998 (= call!41001 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10564 thiss!1141) (mask!27348 thiss!1141)))))

(declare-fun b!945120 () Bool)

(declare-fun e!531541 () Bool)

(assert (=> b!945120 (= e!531541 e!531540)))

(declare-fun c!98354 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!945120 (= c!98354 (validKeyInArray!0 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945121 () Bool)

(assert (=> b!945121 (= e!531540 call!41001)))

(declare-fun d!114361 () Bool)

(declare-fun res!634844 () Bool)

(assert (=> d!114361 (=> res!634844 e!531541)))

(assert (=> d!114361 (= res!634844 (bvsge #b00000000000000000000000000000000 (size!27971 (_keys!10564 thiss!1141))))))

(assert (=> d!114361 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10564 thiss!1141) (mask!27348 thiss!1141)) e!531541)))

(declare-fun b!945122 () Bool)

(assert (=> b!945122 (= e!531539 call!41001)))

(assert (= (and d!114361 (not res!634844)) b!945120))

(assert (= (and b!945120 c!98354) b!945119))

(assert (= (and b!945120 (not c!98354)) b!945121))

(assert (= (and b!945119 res!634845) b!945122))

(assert (= (or b!945122 b!945121) bm!40998))

(declare-fun m!879043 () Bool)

(assert (=> b!945119 m!879043))

(declare-fun m!879045 () Bool)

(assert (=> b!945119 m!879045))

(declare-fun m!879047 () Bool)

(assert (=> b!945119 m!879047))

(assert (=> b!945119 m!879043))

(declare-fun m!879049 () Bool)

(assert (=> b!945119 m!879049))

(declare-fun m!879051 () Bool)

(assert (=> bm!40998 m!879051))

(assert (=> b!945120 m!879043))

(assert (=> b!945120 m!879043))

(declare-fun m!879053 () Bool)

(assert (=> b!945120 m!879053))

(assert (=> b!945086 d!114361))

(declare-fun b!945133 () Bool)

(declare-fun e!531552 () Bool)

(declare-fun call!41004 () Bool)

(assert (=> b!945133 (= e!531552 call!41004)))

(declare-fun b!945134 () Bool)

(declare-fun e!531553 () Bool)

(assert (=> b!945134 (= e!531553 e!531552)))

(declare-fun c!98357 () Bool)

(assert (=> b!945134 (= c!98357 (validKeyInArray!0 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945135 () Bool)

(declare-fun e!531550 () Bool)

(declare-fun contains!5189 (List!19287 (_ BitVec 64)) Bool)

(assert (=> b!945135 (= e!531550 (contains!5189 Nil!19284 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114363 () Bool)

(declare-fun res!634854 () Bool)

(declare-fun e!531551 () Bool)

(assert (=> d!114363 (=> res!634854 e!531551)))

(assert (=> d!114363 (= res!634854 (bvsge #b00000000000000000000000000000000 (size!27971 (_keys!10564 thiss!1141))))))

(assert (=> d!114363 (= (arrayNoDuplicates!0 (_keys!10564 thiss!1141) #b00000000000000000000000000000000 Nil!19284) e!531551)))

(declare-fun b!945136 () Bool)

(assert (=> b!945136 (= e!531551 e!531553)))

(declare-fun res!634853 () Bool)

(assert (=> b!945136 (=> (not res!634853) (not e!531553))))

(assert (=> b!945136 (= res!634853 (not e!531550))))

(declare-fun res!634852 () Bool)

(assert (=> b!945136 (=> (not res!634852) (not e!531550))))

(assert (=> b!945136 (= res!634852 (validKeyInArray!0 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41001 () Bool)

(assert (=> bm!41001 (= call!41004 (arrayNoDuplicates!0 (_keys!10564 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98357 (Cons!19283 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000) Nil!19284) Nil!19284)))))

(declare-fun b!945137 () Bool)

(assert (=> b!945137 (= e!531552 call!41004)))

(assert (= (and d!114363 (not res!634854)) b!945136))

(assert (= (and b!945136 res!634852) b!945135))

(assert (= (and b!945136 res!634853) b!945134))

(assert (= (and b!945134 c!98357) b!945137))

(assert (= (and b!945134 (not c!98357)) b!945133))

(assert (= (or b!945137 b!945133) bm!41001))

(assert (=> b!945134 m!879043))

(assert (=> b!945134 m!879043))

(assert (=> b!945134 m!879053))

(assert (=> b!945135 m!879043))

(assert (=> b!945135 m!879043))

(declare-fun m!879055 () Bool)

(assert (=> b!945135 m!879055))

(assert (=> b!945136 m!879043))

(assert (=> b!945136 m!879043))

(assert (=> b!945136 m!879053))

(assert (=> bm!41001 m!879043))

(declare-fun m!879057 () Bool)

(assert (=> bm!41001 m!879057))

(assert (=> b!945087 d!114363))

(declare-fun b!945180 () Bool)

(declare-fun e!531585 () Bool)

(declare-fun e!531588 () Bool)

(assert (=> b!945180 (= e!531585 e!531588)))

(declare-fun res!634875 () Bool)

(declare-fun call!41021 () Bool)

(assert (=> b!945180 (= res!634875 call!41021)))

(assert (=> b!945180 (=> (not res!634875) (not e!531588))))

(declare-fun b!945181 () Bool)

(declare-fun e!531589 () Bool)

(assert (=> b!945181 (= e!531589 (validKeyInArray!0 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945182 () Bool)

(declare-fun e!531592 () Bool)

(declare-fun call!41022 () Bool)

(assert (=> b!945182 (= e!531592 (not call!41022))))

(declare-fun bm!41016 () Bool)

(declare-fun lt!425919 () ListLongMap!12201)

(assert (=> bm!41016 (= call!41021 (contains!5188 lt!425919 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!945184 () Bool)

(declare-fun c!98373 () Bool)

(assert (=> b!945184 (= c!98373 (and (not (= (bvand (extraKeys!5418 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5418 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!531581 () ListLongMap!12201)

(declare-fun e!531587 () ListLongMap!12201)

(assert (=> b!945184 (= e!531581 e!531587)))

(declare-fun b!945185 () Bool)

(declare-fun call!41019 () ListLongMap!12201)

(assert (=> b!945185 (= e!531587 call!41019)))

(declare-fun bm!41017 () Bool)

(assert (=> bm!41017 (= call!41022 (contains!5188 lt!425919 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41018 () Bool)

(declare-fun call!41024 () ListLongMap!12201)

(assert (=> bm!41018 (= call!41019 call!41024)))

(declare-fun b!945186 () Bool)

(declare-fun e!531583 () Bool)

(assert (=> b!945186 (= e!531583 e!531585)))

(declare-fun c!98370 () Bool)

(assert (=> b!945186 (= c!98370 (not (= (bvand (extraKeys!5418 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!945187 () Bool)

(declare-fun call!41020 () ListLongMap!12201)

(assert (=> b!945187 (= e!531581 call!41020)))

(declare-fun bm!41019 () Bool)

(declare-fun call!41023 () ListLongMap!12201)

(declare-fun getCurrentListMapNoExtraKeys!3306 (array!57160 array!57158 (_ BitVec 32) (_ BitVec 32) V!32425 V!32425 (_ BitVec 32) Int) ListLongMap!12201)

(assert (=> bm!41019 (= call!41023 (getCurrentListMapNoExtraKeys!3306 (_keys!10564 thiss!1141) (_values!5709 thiss!1141) (mask!27348 thiss!1141) (extraKeys!5418 thiss!1141) (zeroValue!5522 thiss!1141) (minValue!5522 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5686 thiss!1141)))))

(declare-fun b!945188 () Bool)

(declare-fun e!531586 () ListLongMap!12201)

(declare-fun call!41025 () ListLongMap!12201)

(declare-fun +!2851 (ListLongMap!12201 tuple2!13504) ListLongMap!12201)

(assert (=> b!945188 (= e!531586 (+!2851 call!41025 (tuple2!13505 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5522 thiss!1141))))))

(declare-fun d!114365 () Bool)

(assert (=> d!114365 e!531583))

(declare-fun res!634880 () Bool)

(assert (=> d!114365 (=> (not res!634880) (not e!531583))))

(assert (=> d!114365 (= res!634880 (or (bvsge #b00000000000000000000000000000000 (size!27971 (_keys!10564 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27971 (_keys!10564 thiss!1141))))))))

(declare-fun lt!425908 () ListLongMap!12201)

(assert (=> d!114365 (= lt!425919 lt!425908)))

(declare-fun lt!425920 () Unit!31882)

(declare-fun e!531582 () Unit!31882)

(assert (=> d!114365 (= lt!425920 e!531582)))

(declare-fun c!98372 () Bool)

(assert (=> d!114365 (= c!98372 e!531589)))

(declare-fun res!634881 () Bool)

(assert (=> d!114365 (=> (not res!634881) (not e!531589))))

(assert (=> d!114365 (= res!634881 (bvslt #b00000000000000000000000000000000 (size!27971 (_keys!10564 thiss!1141))))))

(assert (=> d!114365 (= lt!425908 e!531586)))

(declare-fun c!98371 () Bool)

(assert (=> d!114365 (= c!98371 (and (not (= (bvand (extraKeys!5418 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5418 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114365 (validMask!0 (mask!27348 thiss!1141))))

(assert (=> d!114365 (= (getCurrentListMap!3350 (_keys!10564 thiss!1141) (_values!5709 thiss!1141) (mask!27348 thiss!1141) (extraKeys!5418 thiss!1141) (zeroValue!5522 thiss!1141) (minValue!5522 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5686 thiss!1141)) lt!425919)))

(declare-fun b!945183 () Bool)

(declare-fun e!531590 () Bool)

(declare-fun apply!867 (ListLongMap!12201 (_ BitVec 64)) V!32425)

(assert (=> b!945183 (= e!531590 (= (apply!867 lt!425919 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5522 thiss!1141)))))

(declare-fun bm!41020 () Bool)

(assert (=> bm!41020 (= call!41020 call!41025)))

(declare-fun bm!41021 () Bool)

(declare-fun c!98375 () Bool)

(assert (=> bm!41021 (= call!41025 (+!2851 (ite c!98371 call!41023 (ite c!98375 call!41024 call!41019)) (ite (or c!98371 c!98375) (tuple2!13505 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5522 thiss!1141)) (tuple2!13505 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5522 thiss!1141)))))))

(declare-fun b!945189 () Bool)

(declare-fun e!531591 () Bool)

(declare-fun get!14460 (ValueCell!9816 V!32425) V!32425)

(declare-fun dynLambda!1640 (Int (_ BitVec 64)) V!32425)

(assert (=> b!945189 (= e!531591 (= (apply!867 lt!425919 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000)) (get!14460 (select (arr!27504 (_values!5709 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1640 (defaultEntry!5686 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!945189 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27970 (_values!5709 thiss!1141))))))

(assert (=> b!945189 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27971 (_keys!10564 thiss!1141))))))

(declare-fun b!945190 () Bool)

(declare-fun Unit!31885 () Unit!31882)

(assert (=> b!945190 (= e!531582 Unit!31885)))

(declare-fun b!945191 () Bool)

(assert (=> b!945191 (= e!531586 e!531581)))

(assert (=> b!945191 (= c!98375 (and (not (= (bvand (extraKeys!5418 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5418 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!945192 () Bool)

(declare-fun e!531584 () Bool)

(assert (=> b!945192 (= e!531584 e!531591)))

(declare-fun res!634873 () Bool)

(assert (=> b!945192 (=> (not res!634873) (not e!531591))))

(assert (=> b!945192 (= res!634873 (contains!5188 lt!425919 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!945192 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27971 (_keys!10564 thiss!1141))))))

(declare-fun bm!41022 () Bool)

(assert (=> bm!41022 (= call!41024 call!41023)))

(declare-fun b!945193 () Bool)

(declare-fun e!531580 () Bool)

(assert (=> b!945193 (= e!531580 (validKeyInArray!0 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945194 () Bool)

(declare-fun res!634877 () Bool)

(assert (=> b!945194 (=> (not res!634877) (not e!531583))))

(assert (=> b!945194 (= res!634877 e!531592)))

(declare-fun c!98374 () Bool)

(assert (=> b!945194 (= c!98374 (not (= (bvand (extraKeys!5418 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!945195 () Bool)

(declare-fun res!634878 () Bool)

(assert (=> b!945195 (=> (not res!634878) (not e!531583))))

(assert (=> b!945195 (= res!634878 e!531584)))

(declare-fun res!634876 () Bool)

(assert (=> b!945195 (=> res!634876 e!531584)))

(assert (=> b!945195 (= res!634876 (not e!531580))))

(declare-fun res!634874 () Bool)

(assert (=> b!945195 (=> (not res!634874) (not e!531580))))

(assert (=> b!945195 (= res!634874 (bvslt #b00000000000000000000000000000000 (size!27971 (_keys!10564 thiss!1141))))))

(declare-fun b!945196 () Bool)

(assert (=> b!945196 (= e!531585 (not call!41021))))

(declare-fun b!945197 () Bool)

(assert (=> b!945197 (= e!531587 call!41020)))

(declare-fun b!945198 () Bool)

(declare-fun lt!425910 () Unit!31882)

(assert (=> b!945198 (= e!531582 lt!425910)))

(declare-fun lt!425916 () ListLongMap!12201)

(assert (=> b!945198 (= lt!425916 (getCurrentListMapNoExtraKeys!3306 (_keys!10564 thiss!1141) (_values!5709 thiss!1141) (mask!27348 thiss!1141) (extraKeys!5418 thiss!1141) (zeroValue!5522 thiss!1141) (minValue!5522 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5686 thiss!1141)))))

(declare-fun lt!425914 () (_ BitVec 64))

(assert (=> b!945198 (= lt!425914 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425909 () (_ BitVec 64))

(assert (=> b!945198 (= lt!425909 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425907 () Unit!31882)

(declare-fun addStillContains!570 (ListLongMap!12201 (_ BitVec 64) V!32425 (_ BitVec 64)) Unit!31882)

(assert (=> b!945198 (= lt!425907 (addStillContains!570 lt!425916 lt!425914 (zeroValue!5522 thiss!1141) lt!425909))))

(assert (=> b!945198 (contains!5188 (+!2851 lt!425916 (tuple2!13505 lt!425914 (zeroValue!5522 thiss!1141))) lt!425909)))

(declare-fun lt!425926 () Unit!31882)

(assert (=> b!945198 (= lt!425926 lt!425907)))

(declare-fun lt!425911 () ListLongMap!12201)

(assert (=> b!945198 (= lt!425911 (getCurrentListMapNoExtraKeys!3306 (_keys!10564 thiss!1141) (_values!5709 thiss!1141) (mask!27348 thiss!1141) (extraKeys!5418 thiss!1141) (zeroValue!5522 thiss!1141) (minValue!5522 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5686 thiss!1141)))))

(declare-fun lt!425925 () (_ BitVec 64))

(assert (=> b!945198 (= lt!425925 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425912 () (_ BitVec 64))

(assert (=> b!945198 (= lt!425912 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425924 () Unit!31882)

(declare-fun addApplyDifferent!450 (ListLongMap!12201 (_ BitVec 64) V!32425 (_ BitVec 64)) Unit!31882)

(assert (=> b!945198 (= lt!425924 (addApplyDifferent!450 lt!425911 lt!425925 (minValue!5522 thiss!1141) lt!425912))))

(assert (=> b!945198 (= (apply!867 (+!2851 lt!425911 (tuple2!13505 lt!425925 (minValue!5522 thiss!1141))) lt!425912) (apply!867 lt!425911 lt!425912))))

(declare-fun lt!425923 () Unit!31882)

(assert (=> b!945198 (= lt!425923 lt!425924)))

(declare-fun lt!425921 () ListLongMap!12201)

(assert (=> b!945198 (= lt!425921 (getCurrentListMapNoExtraKeys!3306 (_keys!10564 thiss!1141) (_values!5709 thiss!1141) (mask!27348 thiss!1141) (extraKeys!5418 thiss!1141) (zeroValue!5522 thiss!1141) (minValue!5522 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5686 thiss!1141)))))

(declare-fun lt!425917 () (_ BitVec 64))

(assert (=> b!945198 (= lt!425917 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425922 () (_ BitVec 64))

(assert (=> b!945198 (= lt!425922 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425927 () Unit!31882)

(assert (=> b!945198 (= lt!425927 (addApplyDifferent!450 lt!425921 lt!425917 (zeroValue!5522 thiss!1141) lt!425922))))

(assert (=> b!945198 (= (apply!867 (+!2851 lt!425921 (tuple2!13505 lt!425917 (zeroValue!5522 thiss!1141))) lt!425922) (apply!867 lt!425921 lt!425922))))

(declare-fun lt!425915 () Unit!31882)

(assert (=> b!945198 (= lt!425915 lt!425927)))

(declare-fun lt!425918 () ListLongMap!12201)

(assert (=> b!945198 (= lt!425918 (getCurrentListMapNoExtraKeys!3306 (_keys!10564 thiss!1141) (_values!5709 thiss!1141) (mask!27348 thiss!1141) (extraKeys!5418 thiss!1141) (zeroValue!5522 thiss!1141) (minValue!5522 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5686 thiss!1141)))))

(declare-fun lt!425913 () (_ BitVec 64))

(assert (=> b!945198 (= lt!425913 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425928 () (_ BitVec 64))

(assert (=> b!945198 (= lt!425928 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945198 (= lt!425910 (addApplyDifferent!450 lt!425918 lt!425913 (minValue!5522 thiss!1141) lt!425928))))

(assert (=> b!945198 (= (apply!867 (+!2851 lt!425918 (tuple2!13505 lt!425913 (minValue!5522 thiss!1141))) lt!425928) (apply!867 lt!425918 lt!425928))))

(declare-fun b!945199 () Bool)

(assert (=> b!945199 (= e!531592 e!531590)))

(declare-fun res!634879 () Bool)

(assert (=> b!945199 (= res!634879 call!41022)))

(assert (=> b!945199 (=> (not res!634879) (not e!531590))))

(declare-fun b!945200 () Bool)

(assert (=> b!945200 (= e!531588 (= (apply!867 lt!425919 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5522 thiss!1141)))))

(assert (= (and d!114365 c!98371) b!945188))

(assert (= (and d!114365 (not c!98371)) b!945191))

(assert (= (and b!945191 c!98375) b!945187))

(assert (= (and b!945191 (not c!98375)) b!945184))

(assert (= (and b!945184 c!98373) b!945197))

(assert (= (and b!945184 (not c!98373)) b!945185))

(assert (= (or b!945197 b!945185) bm!41018))

(assert (= (or b!945187 bm!41018) bm!41022))

(assert (= (or b!945187 b!945197) bm!41020))

(assert (= (or b!945188 bm!41022) bm!41019))

(assert (= (or b!945188 bm!41020) bm!41021))

(assert (= (and d!114365 res!634881) b!945181))

(assert (= (and d!114365 c!98372) b!945198))

(assert (= (and d!114365 (not c!98372)) b!945190))

(assert (= (and d!114365 res!634880) b!945195))

(assert (= (and b!945195 res!634874) b!945193))

(assert (= (and b!945195 (not res!634876)) b!945192))

(assert (= (and b!945192 res!634873) b!945189))

(assert (= (and b!945195 res!634878) b!945194))

(assert (= (and b!945194 c!98374) b!945199))

(assert (= (and b!945194 (not c!98374)) b!945182))

(assert (= (and b!945199 res!634879) b!945183))

(assert (= (or b!945199 b!945182) bm!41017))

(assert (= (and b!945194 res!634877) b!945186))

(assert (= (and b!945186 c!98370) b!945180))

(assert (= (and b!945186 (not c!98370)) b!945196))

(assert (= (and b!945180 res!634875) b!945200))

(assert (= (or b!945180 b!945196) bm!41016))

(declare-fun b_lambda!14291 () Bool)

(assert (=> (not b_lambda!14291) (not b!945189)))

(declare-fun t!27606 () Bool)

(declare-fun tb!6169 () Bool)

(assert (=> (and b!945049 (= (defaultEntry!5686 thiss!1141) (defaultEntry!5686 thiss!1141)) t!27606) tb!6169))

(declare-fun result!12203 () Bool)

(assert (=> tb!6169 (= result!12203 tp_is_empty!20595)))

(assert (=> b!945189 t!27606))

(declare-fun b_and!29509 () Bool)

(assert (= b_and!29505 (and (=> t!27606 result!12203) b_and!29509)))

(assert (=> b!945193 m!879043))

(assert (=> b!945193 m!879043))

(assert (=> b!945193 m!879053))

(declare-fun m!879059 () Bool)

(assert (=> bm!41016 m!879059))

(assert (=> b!945181 m!879043))

(assert (=> b!945181 m!879043))

(assert (=> b!945181 m!879053))

(declare-fun m!879061 () Bool)

(assert (=> bm!41017 m!879061))

(assert (=> b!945189 m!879043))

(assert (=> b!945189 m!879043))

(declare-fun m!879063 () Bool)

(assert (=> b!945189 m!879063))

(declare-fun m!879065 () Bool)

(assert (=> b!945189 m!879065))

(declare-fun m!879067 () Bool)

(assert (=> b!945189 m!879067))

(assert (=> b!945189 m!879067))

(assert (=> b!945189 m!879065))

(declare-fun m!879069 () Bool)

(assert (=> b!945189 m!879069))

(declare-fun m!879071 () Bool)

(assert (=> bm!41019 m!879071))

(declare-fun m!879073 () Bool)

(assert (=> b!945183 m!879073))

(declare-fun m!879075 () Bool)

(assert (=> d!114365 m!879075))

(declare-fun m!879077 () Bool)

(assert (=> bm!41021 m!879077))

(assert (=> b!945192 m!879043))

(assert (=> b!945192 m!879043))

(declare-fun m!879079 () Bool)

(assert (=> b!945192 m!879079))

(declare-fun m!879081 () Bool)

(assert (=> b!945200 m!879081))

(assert (=> b!945198 m!879071))

(declare-fun m!879083 () Bool)

(assert (=> b!945198 m!879083))

(assert (=> b!945198 m!879043))

(declare-fun m!879085 () Bool)

(assert (=> b!945198 m!879085))

(declare-fun m!879087 () Bool)

(assert (=> b!945198 m!879087))

(declare-fun m!879089 () Bool)

(assert (=> b!945198 m!879089))

(declare-fun m!879091 () Bool)

(assert (=> b!945198 m!879091))

(declare-fun m!879093 () Bool)

(assert (=> b!945198 m!879093))

(assert (=> b!945198 m!879083))

(declare-fun m!879095 () Bool)

(assert (=> b!945198 m!879095))

(declare-fun m!879097 () Bool)

(assert (=> b!945198 m!879097))

(declare-fun m!879099 () Bool)

(assert (=> b!945198 m!879099))

(declare-fun m!879101 () Bool)

(assert (=> b!945198 m!879101))

(declare-fun m!879103 () Bool)

(assert (=> b!945198 m!879103))

(declare-fun m!879105 () Bool)

(assert (=> b!945198 m!879105))

(declare-fun m!879107 () Bool)

(assert (=> b!945198 m!879107))

(declare-fun m!879109 () Bool)

(assert (=> b!945198 m!879109))

(assert (=> b!945198 m!879105))

(assert (=> b!945198 m!879085))

(assert (=> b!945198 m!879089))

(declare-fun m!879111 () Bool)

(assert (=> b!945198 m!879111))

(declare-fun m!879113 () Bool)

(assert (=> b!945188 m!879113))

(assert (=> d!114347 d!114365))

(assert (=> b!945078 d!114357))

(assert (=> b!945078 d!114359))

(declare-fun d!114367 () Bool)

(declare-fun res!634886 () Bool)

(declare-fun e!531597 () Bool)

(assert (=> d!114367 (=> res!634886 e!531597)))

(assert (=> d!114367 (= res!634886 (and ((_ is Cons!19282) (toList!6116 (map!13029 thiss!1141))) (= (_1!6763 (h!20433 (toList!6116 (map!13029 thiss!1141)))) key!756)))))

(assert (=> d!114367 (= (containsKey!453 (toList!6116 (map!13029 thiss!1141)) key!756) e!531597)))

(declare-fun b!945207 () Bool)

(declare-fun e!531598 () Bool)

(assert (=> b!945207 (= e!531597 e!531598)))

(declare-fun res!634887 () Bool)

(assert (=> b!945207 (=> (not res!634887) (not e!531598))))

(assert (=> b!945207 (= res!634887 (and (or (not ((_ is Cons!19282) (toList!6116 (map!13029 thiss!1141)))) (bvsle (_1!6763 (h!20433 (toList!6116 (map!13029 thiss!1141)))) key!756)) ((_ is Cons!19282) (toList!6116 (map!13029 thiss!1141))) (bvslt (_1!6763 (h!20433 (toList!6116 (map!13029 thiss!1141)))) key!756)))))

(declare-fun b!945208 () Bool)

(assert (=> b!945208 (= e!531598 (containsKey!453 (t!27603 (toList!6116 (map!13029 thiss!1141))) key!756))))

(assert (= (and d!114367 (not res!634886)) b!945207))

(assert (= (and b!945207 res!634887) b!945208))

(declare-fun m!879115 () Bool)

(assert (=> b!945208 m!879115))

(assert (=> d!114345 d!114367))

(declare-fun b!945219 () Bool)

(declare-fun res!634898 () Bool)

(declare-fun e!531601 () Bool)

(assert (=> b!945219 (=> (not res!634898) (not e!531601))))

(declare-fun size!27974 (LongMapFixedSize!4782) (_ BitVec 32))

(assert (=> b!945219 (= res!634898 (= (size!27974 thiss!1141) (bvadd (_size!2446 thiss!1141) (bvsdiv (bvadd (extraKeys!5418 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!945218 () Bool)

(declare-fun res!634896 () Bool)

(assert (=> b!945218 (=> (not res!634896) (not e!531601))))

(assert (=> b!945218 (= res!634896 (bvsge (size!27974 thiss!1141) (_size!2446 thiss!1141)))))

(declare-fun d!114369 () Bool)

(declare-fun res!634897 () Bool)

(assert (=> d!114369 (=> (not res!634897) (not e!531601))))

(assert (=> d!114369 (= res!634897 (validMask!0 (mask!27348 thiss!1141)))))

(assert (=> d!114369 (= (simpleValid!349 thiss!1141) e!531601)))

(declare-fun b!945217 () Bool)

(declare-fun res!634899 () Bool)

(assert (=> b!945217 (=> (not res!634899) (not e!531601))))

(assert (=> b!945217 (= res!634899 (and (= (size!27970 (_values!5709 thiss!1141)) (bvadd (mask!27348 thiss!1141) #b00000000000000000000000000000001)) (= (size!27971 (_keys!10564 thiss!1141)) (size!27970 (_values!5709 thiss!1141))) (bvsge (_size!2446 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2446 thiss!1141) (bvadd (mask!27348 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!945220 () Bool)

(assert (=> b!945220 (= e!531601 (and (bvsge (extraKeys!5418 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5418 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2446 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!114369 res!634897) b!945217))

(assert (= (and b!945217 res!634899) b!945218))

(assert (= (and b!945218 res!634896) b!945219))

(assert (= (and b!945219 res!634898) b!945220))

(declare-fun m!879117 () Bool)

(assert (=> b!945219 m!879117))

(assert (=> b!945218 m!879117))

(assert (=> d!114369 m!879075))

(assert (=> d!114349 d!114369))

(declare-fun b!945229 () Bool)

(declare-fun e!531607 () (_ BitVec 32))

(assert (=> b!945229 (= e!531607 #b00000000000000000000000000000000)))

(declare-fun b!945230 () Bool)

(declare-fun e!531606 () (_ BitVec 32))

(declare-fun call!41028 () (_ BitVec 32))

(assert (=> b!945230 (= e!531606 call!41028)))

(declare-fun bm!41025 () Bool)

(assert (=> bm!41025 (= call!41028 (arrayCountValidKeys!0 (_keys!10564 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27971 (_keys!10564 thiss!1141))))))

(declare-fun b!945231 () Bool)

(assert (=> b!945231 (= e!531607 e!531606)))

(declare-fun c!98380 () Bool)

(assert (=> b!945231 (= c!98380 (validKeyInArray!0 (select (arr!27505 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945232 () Bool)

(assert (=> b!945232 (= e!531606 (bvadd #b00000000000000000000000000000001 call!41028))))

(declare-fun d!114371 () Bool)

(declare-fun lt!425931 () (_ BitVec 32))

(assert (=> d!114371 (and (bvsge lt!425931 #b00000000000000000000000000000000) (bvsle lt!425931 (bvsub (size!27971 (_keys!10564 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114371 (= lt!425931 e!531607)))

(declare-fun c!98381 () Bool)

(assert (=> d!114371 (= c!98381 (bvsge #b00000000000000000000000000000000 (size!27971 (_keys!10564 thiss!1141))))))

(assert (=> d!114371 (and (bvsle #b00000000000000000000000000000000 (size!27971 (_keys!10564 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27971 (_keys!10564 thiss!1141)) (size!27971 (_keys!10564 thiss!1141))))))

(assert (=> d!114371 (= (arrayCountValidKeys!0 (_keys!10564 thiss!1141) #b00000000000000000000000000000000 (size!27971 (_keys!10564 thiss!1141))) lt!425931)))

(assert (= (and d!114371 c!98381) b!945229))

(assert (= (and d!114371 (not c!98381)) b!945231))

(assert (= (and b!945231 c!98380) b!945232))

(assert (= (and b!945231 (not c!98380)) b!945230))

(assert (= (or b!945232 b!945230) bm!41025))

(declare-fun m!879119 () Bool)

(assert (=> bm!41025 m!879119))

(assert (=> b!945231 m!879043))

(assert (=> b!945231 m!879043))

(assert (=> b!945231 m!879053))

(assert (=> b!945085 d!114371))

(declare-fun mapNonEmpty!32725 () Bool)

(declare-fun mapRes!32725 () Bool)

(declare-fun tp!62781 () Bool)

(declare-fun e!531608 () Bool)

(assert (=> mapNonEmpty!32725 (= mapRes!32725 (and tp!62781 e!531608))))

(declare-fun mapKey!32725 () (_ BitVec 32))

(declare-fun mapRest!32725 () (Array (_ BitVec 32) ValueCell!9816))

(declare-fun mapValue!32725 () ValueCell!9816)

(assert (=> mapNonEmpty!32725 (= mapRest!32724 (store mapRest!32725 mapKey!32725 mapValue!32725))))

(declare-fun mapIsEmpty!32725 () Bool)

(assert (=> mapIsEmpty!32725 mapRes!32725))

(declare-fun b!945233 () Bool)

(assert (=> b!945233 (= e!531608 tp_is_empty!20595)))

(declare-fun b!945234 () Bool)

(declare-fun e!531609 () Bool)

(assert (=> b!945234 (= e!531609 tp_is_empty!20595)))

(declare-fun condMapEmpty!32725 () Bool)

(declare-fun mapDefault!32725 () ValueCell!9816)

(assert (=> mapNonEmpty!32724 (= condMapEmpty!32725 (= mapRest!32724 ((as const (Array (_ BitVec 32) ValueCell!9816)) mapDefault!32725)))))

(assert (=> mapNonEmpty!32724 (= tp!62780 (and e!531609 mapRes!32725))))

(assert (= (and mapNonEmpty!32724 condMapEmpty!32725) mapIsEmpty!32725))

(assert (= (and mapNonEmpty!32724 (not condMapEmpty!32725)) mapNonEmpty!32725))

(assert (= (and mapNonEmpty!32725 ((_ is ValueCellFull!9816) mapValue!32725)) b!945233))

(assert (= (and mapNonEmpty!32724 ((_ is ValueCellFull!9816) mapDefault!32725)) b!945234))

(declare-fun m!879121 () Bool)

(assert (=> mapNonEmpty!32725 m!879121))

(declare-fun b_lambda!14293 () Bool)

(assert (= b_lambda!14291 (or (and b!945049 b_free!18087) b_lambda!14293)))

(check-sat (not d!114357) (not b!945134) (not b!945189) (not b_next!18087) (not bm!40998) b_and!29509 (not b!945183) (not b!945208) (not d!114369) (not b!945193) (not b!945200) (not b!945218) (not b!945198) tp_is_empty!20595 (not b!945219) (not bm!41021) (not bm!41016) (not b!945231) (not bm!41025) (not bm!41019) (not b!945181) (not bm!41017) (not b!945119) (not b!945136) (not b!945120) (not b!945135) (not b!945109) (not d!114365) (not b!945188) (not mapNonEmpty!32725) (not b!945098) (not bm!41001) (not b!945192) (not d!114355) (not b_lambda!14293))
(check-sat b_and!29509 (not b_next!18087))
