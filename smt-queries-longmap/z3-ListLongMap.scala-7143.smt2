; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90994 () Bool)

(assert start!90994)

(declare-fun b!1038967 () Bool)

(declare-fun b_free!20911 () Bool)

(declare-fun b_next!20911 () Bool)

(assert (=> b!1038967 (= b_free!20911 (not b_next!20911))))

(declare-fun tp!73885 () Bool)

(declare-fun b_and!33453 () Bool)

(assert (=> b!1038967 (= tp!73885 b_and!33453)))

(declare-fun mapIsEmpty!38481 () Bool)

(declare-fun mapRes!38481 () Bool)

(assert (=> mapIsEmpty!38481 mapRes!38481))

(declare-fun b!1038963 () Bool)

(declare-fun e!587860 () Bool)

(declare-fun e!587858 () Bool)

(assert (=> b!1038963 (= e!587860 e!587858)))

(declare-fun res!692789 () Bool)

(assert (=> b!1038963 (=> (not res!692789) (not e!587858))))

(declare-datatypes ((List!21910 0))(
  ( (Nil!21907) (Cons!21906 (h!23118 (_ BitVec 64)) (t!31116 List!21910)) )
))
(declare-fun contains!6051 (List!21910 (_ BitVec 64)) Bool)

(assert (=> b!1038963 (= res!692789 (not (contains!6051 Nil!21907 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!692785 () Bool)

(declare-fun e!587856 () Bool)

(assert (=> start!90994 (=> (not res!692785) (not e!587856))))

(declare-datatypes ((V!37715 0))(
  ( (V!37716 (val!12366 Int)) )
))
(declare-datatypes ((ValueCell!11612 0))(
  ( (ValueCellFull!11612 (v!14945 V!37715)) (EmptyCell!11612) )
))
(declare-datatypes ((array!65419 0))(
  ( (array!65420 (arr!31483 (Array (_ BitVec 32) (_ BitVec 64))) (size!32014 (_ BitVec 32))) )
))
(declare-datatypes ((array!65421 0))(
  ( (array!65422 (arr!31484 (Array (_ BitVec 32) ValueCell!11612)) (size!32015 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5818 0))(
  ( (LongMapFixedSize!5819 (defaultEntry!6291 Int) (mask!30276 (_ BitVec 32)) (extraKeys!6019 (_ BitVec 32)) (zeroValue!6125 V!37715) (minValue!6125 V!37715) (_size!2964 (_ BitVec 32)) (_keys!11527 array!65419) (_values!6314 array!65421) (_vacant!2964 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5818)

(declare-fun valid!2198 (LongMapFixedSize!5818) Bool)

(assert (=> start!90994 (= res!692785 (valid!2198 thiss!1427))))

(assert (=> start!90994 e!587856))

(declare-fun e!587863 () Bool)

(assert (=> start!90994 e!587863))

(assert (=> start!90994 true))

(declare-fun mapNonEmpty!38481 () Bool)

(declare-fun tp!73884 () Bool)

(declare-fun e!587861 () Bool)

(assert (=> mapNonEmpty!38481 (= mapRes!38481 (and tp!73884 e!587861))))

(declare-fun mapKey!38481 () (_ BitVec 32))

(declare-fun mapRest!38481 () (Array (_ BitVec 32) ValueCell!11612))

(declare-fun mapValue!38481 () ValueCell!11612)

(assert (=> mapNonEmpty!38481 (= (arr!31484 (_values!6314 thiss!1427)) (store mapRest!38481 mapKey!38481 mapValue!38481))))

(declare-fun b!1038964 () Bool)

(assert (=> b!1038964 (= e!587858 (not (contains!6051 Nil!21907 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1038965 () Bool)

(declare-fun e!587862 () Bool)

(assert (=> b!1038965 (= e!587862 (not e!587860))))

(declare-fun res!692787 () Bool)

(assert (=> b!1038965 (=> res!692787 e!587860)))

(assert (=> b!1038965 (= res!692787 (or (bvsge (size!32014 (_keys!11527 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32014 (_keys!11527 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9713 0))(
  ( (MissingZero!9713 (index!41223 (_ BitVec 32))) (Found!9713 (index!41224 (_ BitVec 32))) (Intermediate!9713 (undefined!10525 Bool) (index!41225 (_ BitVec 32)) (x!92558 (_ BitVec 32))) (Undefined!9713) (MissingVacant!9713 (index!41226 (_ BitVec 32))) )
))
(declare-fun lt!458063 () SeekEntryResult!9713)

(declare-fun arrayCountValidKeys!0 (array!65419 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038965 (= (arrayCountValidKeys!0 (array!65420 (store (arr!31483 (_keys!11527 thiss!1427)) (index!41224 lt!458063) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32014 (_keys!11527 thiss!1427))) #b00000000000000000000000000000000 (size!32014 (_keys!11527 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11527 thiss!1427) #b00000000000000000000000000000000 (size!32014 (_keys!11527 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33957 0))(
  ( (Unit!33958) )
))
(declare-fun lt!458064 () Unit!33957)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65419 (_ BitVec 32) (_ BitVec 64)) Unit!33957)

(assert (=> b!1038965 (= lt!458064 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11527 thiss!1427) (index!41224 lt!458063) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038966 () Bool)

(declare-fun e!587859 () Bool)

(declare-fun e!587857 () Bool)

(assert (=> b!1038966 (= e!587859 (and e!587857 mapRes!38481))))

(declare-fun condMapEmpty!38481 () Bool)

(declare-fun mapDefault!38481 () ValueCell!11612)

(assert (=> b!1038966 (= condMapEmpty!38481 (= (arr!31484 (_values!6314 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11612)) mapDefault!38481)))))

(declare-fun tp_is_empty!24631 () Bool)

(declare-fun array_inv!24355 (array!65419) Bool)

(declare-fun array_inv!24356 (array!65421) Bool)

(assert (=> b!1038967 (= e!587863 (and tp!73885 tp_is_empty!24631 (array_inv!24355 (_keys!11527 thiss!1427)) (array_inv!24356 (_values!6314 thiss!1427)) e!587859))))

(declare-fun b!1038968 () Bool)

(assert (=> b!1038968 (= e!587856 e!587862)))

(declare-fun res!692790 () Bool)

(assert (=> b!1038968 (=> (not res!692790) (not e!587862))))

(get-info :version)

(assert (=> b!1038968 (= res!692790 ((_ is Found!9713) lt!458063))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65419 (_ BitVec 32)) SeekEntryResult!9713)

(assert (=> b!1038968 (= lt!458063 (seekEntry!0 key!909 (_keys!11527 thiss!1427) (mask!30276 thiss!1427)))))

(declare-fun b!1038969 () Bool)

(assert (=> b!1038969 (= e!587857 tp_is_empty!24631)))

(declare-fun b!1038970 () Bool)

(declare-fun res!692788 () Bool)

(assert (=> b!1038970 (=> res!692788 e!587860)))

(declare-fun noDuplicate!1487 (List!21910) Bool)

(assert (=> b!1038970 (= res!692788 (not (noDuplicate!1487 Nil!21907)))))

(declare-fun b!1038971 () Bool)

(assert (=> b!1038971 (= e!587861 tp_is_empty!24631)))

(declare-fun b!1038972 () Bool)

(declare-fun res!692786 () Bool)

(assert (=> b!1038972 (=> (not res!692786) (not e!587856))))

(assert (=> b!1038972 (= res!692786 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!90994 res!692785) b!1038972))

(assert (= (and b!1038972 res!692786) b!1038968))

(assert (= (and b!1038968 res!692790) b!1038965))

(assert (= (and b!1038965 (not res!692787)) b!1038970))

(assert (= (and b!1038970 (not res!692788)) b!1038963))

(assert (= (and b!1038963 res!692789) b!1038964))

(assert (= (and b!1038966 condMapEmpty!38481) mapIsEmpty!38481))

(assert (= (and b!1038966 (not condMapEmpty!38481)) mapNonEmpty!38481))

(assert (= (and mapNonEmpty!38481 ((_ is ValueCellFull!11612) mapValue!38481)) b!1038971))

(assert (= (and b!1038966 ((_ is ValueCellFull!11612) mapDefault!38481)) b!1038969))

(assert (= b!1038967 b!1038966))

(assert (= start!90994 b!1038967))

(declare-fun m!959463 () Bool)

(assert (=> b!1038963 m!959463))

(declare-fun m!959465 () Bool)

(assert (=> b!1038970 m!959465))

(declare-fun m!959467 () Bool)

(assert (=> b!1038965 m!959467))

(declare-fun m!959469 () Bool)

(assert (=> b!1038965 m!959469))

(declare-fun m!959471 () Bool)

(assert (=> b!1038965 m!959471))

(declare-fun m!959473 () Bool)

(assert (=> b!1038965 m!959473))

(declare-fun m!959475 () Bool)

(assert (=> mapNonEmpty!38481 m!959475))

(declare-fun m!959477 () Bool)

(assert (=> b!1038967 m!959477))

(declare-fun m!959479 () Bool)

(assert (=> b!1038967 m!959479))

(declare-fun m!959481 () Bool)

(assert (=> b!1038968 m!959481))

(declare-fun m!959483 () Bool)

(assert (=> start!90994 m!959483))

(declare-fun m!959485 () Bool)

(assert (=> b!1038964 m!959485))

(check-sat tp_is_empty!24631 (not b!1038968) (not mapNonEmpty!38481) (not b!1038964) (not b_next!20911) (not b!1038965) b_and!33453 (not b!1038970) (not b!1038967) (not start!90994) (not b!1038963))
(check-sat b_and!33453 (not b_next!20911))
(get-model)

(declare-fun d!125721 () Bool)

(assert (=> d!125721 (= (array_inv!24355 (_keys!11527 thiss!1427)) (bvsge (size!32014 (_keys!11527 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038967 d!125721))

(declare-fun d!125723 () Bool)

(assert (=> d!125723 (= (array_inv!24356 (_values!6314 thiss!1427)) (bvsge (size!32015 (_values!6314 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038967 d!125723))

(declare-fun d!125725 () Bool)

(declare-fun res!692833 () Bool)

(declare-fun e!587921 () Bool)

(assert (=> d!125725 (=> (not res!692833) (not e!587921))))

(declare-fun simpleValid!419 (LongMapFixedSize!5818) Bool)

(assert (=> d!125725 (= res!692833 (simpleValid!419 thiss!1427))))

(assert (=> d!125725 (= (valid!2198 thiss!1427) e!587921)))

(declare-fun b!1039039 () Bool)

(declare-fun res!692834 () Bool)

(assert (=> b!1039039 (=> (not res!692834) (not e!587921))))

(assert (=> b!1039039 (= res!692834 (= (arrayCountValidKeys!0 (_keys!11527 thiss!1427) #b00000000000000000000000000000000 (size!32014 (_keys!11527 thiss!1427))) (_size!2964 thiss!1427)))))

(declare-fun b!1039040 () Bool)

(declare-fun res!692835 () Bool)

(assert (=> b!1039040 (=> (not res!692835) (not e!587921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65419 (_ BitVec 32)) Bool)

(assert (=> b!1039040 (= res!692835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11527 thiss!1427) (mask!30276 thiss!1427)))))

(declare-fun b!1039041 () Bool)

(declare-fun arrayNoDuplicates!0 (array!65419 (_ BitVec 32) List!21910) Bool)

(assert (=> b!1039041 (= e!587921 (arrayNoDuplicates!0 (_keys!11527 thiss!1427) #b00000000000000000000000000000000 Nil!21907))))

(assert (= (and d!125725 res!692833) b!1039039))

(assert (= (and b!1039039 res!692834) b!1039040))

(assert (= (and b!1039040 res!692835) b!1039041))

(declare-fun m!959535 () Bool)

(assert (=> d!125725 m!959535))

(assert (=> b!1039039 m!959471))

(declare-fun m!959537 () Bool)

(assert (=> b!1039040 m!959537))

(declare-fun m!959539 () Bool)

(assert (=> b!1039041 m!959539))

(assert (=> start!90994 d!125725))

(declare-fun d!125727 () Bool)

(declare-fun lt!458079 () (_ BitVec 32))

(assert (=> d!125727 (and (bvsge lt!458079 #b00000000000000000000000000000000) (bvsle lt!458079 (bvsub (size!32014 (array!65420 (store (arr!31483 (_keys!11527 thiss!1427)) (index!41224 lt!458063) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32014 (_keys!11527 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!587927 () (_ BitVec 32))

(assert (=> d!125727 (= lt!458079 e!587927)))

(declare-fun c!105556 () Bool)

(assert (=> d!125727 (= c!105556 (bvsge #b00000000000000000000000000000000 (size!32014 (_keys!11527 thiss!1427))))))

(assert (=> d!125727 (and (bvsle #b00000000000000000000000000000000 (size!32014 (_keys!11527 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32014 (_keys!11527 thiss!1427)) (size!32014 (array!65420 (store (arr!31483 (_keys!11527 thiss!1427)) (index!41224 lt!458063) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32014 (_keys!11527 thiss!1427))))))))

(assert (=> d!125727 (= (arrayCountValidKeys!0 (array!65420 (store (arr!31483 (_keys!11527 thiss!1427)) (index!41224 lt!458063) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32014 (_keys!11527 thiss!1427))) #b00000000000000000000000000000000 (size!32014 (_keys!11527 thiss!1427))) lt!458079)))

(declare-fun bm!43990 () Bool)

(declare-fun call!43993 () (_ BitVec 32))

(assert (=> bm!43990 (= call!43993 (arrayCountValidKeys!0 (array!65420 (store (arr!31483 (_keys!11527 thiss!1427)) (index!41224 lt!458063) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32014 (_keys!11527 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32014 (_keys!11527 thiss!1427))))))

(declare-fun b!1039050 () Bool)

(declare-fun e!587926 () (_ BitVec 32))

(assert (=> b!1039050 (= e!587926 call!43993)))

(declare-fun b!1039051 () Bool)

(assert (=> b!1039051 (= e!587927 e!587926)))

(declare-fun c!105557 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039051 (= c!105557 (validKeyInArray!0 (select (arr!31483 (array!65420 (store (arr!31483 (_keys!11527 thiss!1427)) (index!41224 lt!458063) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32014 (_keys!11527 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1039052 () Bool)

(assert (=> b!1039052 (= e!587927 #b00000000000000000000000000000000)))

(declare-fun b!1039053 () Bool)

(assert (=> b!1039053 (= e!587926 (bvadd #b00000000000000000000000000000001 call!43993))))

(assert (= (and d!125727 c!105556) b!1039052))

(assert (= (and d!125727 (not c!105556)) b!1039051))

(assert (= (and b!1039051 c!105557) b!1039053))

(assert (= (and b!1039051 (not c!105557)) b!1039050))

(assert (= (or b!1039053 b!1039050) bm!43990))

(declare-fun m!959541 () Bool)

(assert (=> bm!43990 m!959541))

(declare-fun m!959543 () Bool)

(assert (=> b!1039051 m!959543))

(assert (=> b!1039051 m!959543))

(declare-fun m!959545 () Bool)

(assert (=> b!1039051 m!959545))

(assert (=> b!1038965 d!125727))

(declare-fun d!125729 () Bool)

(declare-fun lt!458080 () (_ BitVec 32))

(assert (=> d!125729 (and (bvsge lt!458080 #b00000000000000000000000000000000) (bvsle lt!458080 (bvsub (size!32014 (_keys!11527 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!587929 () (_ BitVec 32))

(assert (=> d!125729 (= lt!458080 e!587929)))

(declare-fun c!105558 () Bool)

(assert (=> d!125729 (= c!105558 (bvsge #b00000000000000000000000000000000 (size!32014 (_keys!11527 thiss!1427))))))

(assert (=> d!125729 (and (bvsle #b00000000000000000000000000000000 (size!32014 (_keys!11527 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32014 (_keys!11527 thiss!1427)) (size!32014 (_keys!11527 thiss!1427))))))

(assert (=> d!125729 (= (arrayCountValidKeys!0 (_keys!11527 thiss!1427) #b00000000000000000000000000000000 (size!32014 (_keys!11527 thiss!1427))) lt!458080)))

(declare-fun bm!43991 () Bool)

(declare-fun call!43994 () (_ BitVec 32))

(assert (=> bm!43991 (= call!43994 (arrayCountValidKeys!0 (_keys!11527 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32014 (_keys!11527 thiss!1427))))))

(declare-fun b!1039054 () Bool)

(declare-fun e!587928 () (_ BitVec 32))

(assert (=> b!1039054 (= e!587928 call!43994)))

(declare-fun b!1039055 () Bool)

(assert (=> b!1039055 (= e!587929 e!587928)))

(declare-fun c!105559 () Bool)

(assert (=> b!1039055 (= c!105559 (validKeyInArray!0 (select (arr!31483 (_keys!11527 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039056 () Bool)

(assert (=> b!1039056 (= e!587929 #b00000000000000000000000000000000)))

(declare-fun b!1039057 () Bool)

(assert (=> b!1039057 (= e!587928 (bvadd #b00000000000000000000000000000001 call!43994))))

(assert (= (and d!125729 c!105558) b!1039056))

(assert (= (and d!125729 (not c!105558)) b!1039055))

(assert (= (and b!1039055 c!105559) b!1039057))

(assert (= (and b!1039055 (not c!105559)) b!1039054))

(assert (= (or b!1039057 b!1039054) bm!43991))

(declare-fun m!959547 () Bool)

(assert (=> bm!43991 m!959547))

(declare-fun m!959549 () Bool)

(assert (=> b!1039055 m!959549))

(assert (=> b!1039055 m!959549))

(declare-fun m!959551 () Bool)

(assert (=> b!1039055 m!959551))

(assert (=> b!1038965 d!125729))

(declare-fun b!1039066 () Bool)

(declare-fun res!692846 () Bool)

(declare-fun e!587934 () Bool)

(assert (=> b!1039066 (=> (not res!692846) (not e!587934))))

(assert (=> b!1039066 (= res!692846 (validKeyInArray!0 (select (arr!31483 (_keys!11527 thiss!1427)) (index!41224 lt!458063))))))

(declare-fun b!1039067 () Bool)

(declare-fun res!692847 () Bool)

(assert (=> b!1039067 (=> (not res!692847) (not e!587934))))

(assert (=> b!1039067 (= res!692847 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1039069 () Bool)

(declare-fun e!587935 () Bool)

(assert (=> b!1039069 (= e!587935 (= (arrayCountValidKeys!0 (array!65420 (store (arr!31483 (_keys!11527 thiss!1427)) (index!41224 lt!458063) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32014 (_keys!11527 thiss!1427))) #b00000000000000000000000000000000 (size!32014 (_keys!11527 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11527 thiss!1427) #b00000000000000000000000000000000 (size!32014 (_keys!11527 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1039068 () Bool)

(assert (=> b!1039068 (= e!587934 (bvslt (size!32014 (_keys!11527 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!125731 () Bool)

(assert (=> d!125731 e!587935))

(declare-fun res!692845 () Bool)

(assert (=> d!125731 (=> (not res!692845) (not e!587935))))

(assert (=> d!125731 (= res!692845 (and (bvsge (index!41224 lt!458063) #b00000000000000000000000000000000) (bvslt (index!41224 lt!458063) (size!32014 (_keys!11527 thiss!1427)))))))

(declare-fun lt!458083 () Unit!33957)

(declare-fun choose!82 (array!65419 (_ BitVec 32) (_ BitVec 64)) Unit!33957)

(assert (=> d!125731 (= lt!458083 (choose!82 (_keys!11527 thiss!1427) (index!41224 lt!458063) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125731 e!587934))

(declare-fun res!692844 () Bool)

(assert (=> d!125731 (=> (not res!692844) (not e!587934))))

(assert (=> d!125731 (= res!692844 (and (bvsge (index!41224 lt!458063) #b00000000000000000000000000000000) (bvslt (index!41224 lt!458063) (size!32014 (_keys!11527 thiss!1427)))))))

(assert (=> d!125731 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11527 thiss!1427) (index!41224 lt!458063) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458083)))

(assert (= (and d!125731 res!692844) b!1039066))

(assert (= (and b!1039066 res!692846) b!1039067))

(assert (= (and b!1039067 res!692847) b!1039068))

(assert (= (and d!125731 res!692845) b!1039069))

(declare-fun m!959553 () Bool)

(assert (=> b!1039066 m!959553))

(assert (=> b!1039066 m!959553))

(declare-fun m!959555 () Bool)

(assert (=> b!1039066 m!959555))

(declare-fun m!959557 () Bool)

(assert (=> b!1039067 m!959557))

(assert (=> b!1039069 m!959467))

(assert (=> b!1039069 m!959469))

(assert (=> b!1039069 m!959471))

(declare-fun m!959559 () Bool)

(assert (=> d!125731 m!959559))

(assert (=> b!1038965 d!125731))

(declare-fun d!125733 () Bool)

(declare-fun res!692852 () Bool)

(declare-fun e!587940 () Bool)

(assert (=> d!125733 (=> res!692852 e!587940)))

(assert (=> d!125733 (= res!692852 ((_ is Nil!21907) Nil!21907))))

(assert (=> d!125733 (= (noDuplicate!1487 Nil!21907) e!587940)))

(declare-fun b!1039074 () Bool)

(declare-fun e!587941 () Bool)

(assert (=> b!1039074 (= e!587940 e!587941)))

(declare-fun res!692853 () Bool)

(assert (=> b!1039074 (=> (not res!692853) (not e!587941))))

(assert (=> b!1039074 (= res!692853 (not (contains!6051 (t!31116 Nil!21907) (h!23118 Nil!21907))))))

(declare-fun b!1039075 () Bool)

(assert (=> b!1039075 (= e!587941 (noDuplicate!1487 (t!31116 Nil!21907)))))

(assert (= (and d!125733 (not res!692852)) b!1039074))

(assert (= (and b!1039074 res!692853) b!1039075))

(declare-fun m!959561 () Bool)

(assert (=> b!1039074 m!959561))

(declare-fun m!959563 () Bool)

(assert (=> b!1039075 m!959563))

(assert (=> b!1038970 d!125733))

(declare-fun d!125735 () Bool)

(declare-fun lt!458086 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!519 (List!21910) (InoxSet (_ BitVec 64)))

(assert (=> d!125735 (= lt!458086 (select (content!519 Nil!21907) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587947 () Bool)

(assert (=> d!125735 (= lt!458086 e!587947)))

(declare-fun res!692858 () Bool)

(assert (=> d!125735 (=> (not res!692858) (not e!587947))))

(assert (=> d!125735 (= res!692858 ((_ is Cons!21906) Nil!21907))))

(assert (=> d!125735 (= (contains!6051 Nil!21907 #b1000000000000000000000000000000000000000000000000000000000000000) lt!458086)))

(declare-fun b!1039080 () Bool)

(declare-fun e!587946 () Bool)

(assert (=> b!1039080 (= e!587947 e!587946)))

(declare-fun res!692859 () Bool)

(assert (=> b!1039080 (=> res!692859 e!587946)))

(assert (=> b!1039080 (= res!692859 (= (h!23118 Nil!21907) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039081 () Bool)

(assert (=> b!1039081 (= e!587946 (contains!6051 (t!31116 Nil!21907) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125735 res!692858) b!1039080))

(assert (= (and b!1039080 (not res!692859)) b!1039081))

(declare-fun m!959565 () Bool)

(assert (=> d!125735 m!959565))

(declare-fun m!959567 () Bool)

(assert (=> d!125735 m!959567))

(declare-fun m!959569 () Bool)

(assert (=> b!1039081 m!959569))

(assert (=> b!1038964 d!125735))

(declare-fun d!125737 () Bool)

(declare-fun lt!458095 () SeekEntryResult!9713)

(assert (=> d!125737 (and (or ((_ is MissingVacant!9713) lt!458095) (not ((_ is Found!9713) lt!458095)) (and (bvsge (index!41224 lt!458095) #b00000000000000000000000000000000) (bvslt (index!41224 lt!458095) (size!32014 (_keys!11527 thiss!1427))))) (not ((_ is MissingVacant!9713) lt!458095)) (or (not ((_ is Found!9713) lt!458095)) (= (select (arr!31483 (_keys!11527 thiss!1427)) (index!41224 lt!458095)) key!909)))))

(declare-fun e!587956 () SeekEntryResult!9713)

(assert (=> d!125737 (= lt!458095 e!587956)))

(declare-fun c!105567 () Bool)

(declare-fun lt!458096 () SeekEntryResult!9713)

(assert (=> d!125737 (= c!105567 (and ((_ is Intermediate!9713) lt!458096) (undefined!10525 lt!458096)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65419 (_ BitVec 32)) SeekEntryResult!9713)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125737 (= lt!458096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30276 thiss!1427)) key!909 (_keys!11527 thiss!1427) (mask!30276 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125737 (validMask!0 (mask!30276 thiss!1427))))

(assert (=> d!125737 (= (seekEntry!0 key!909 (_keys!11527 thiss!1427) (mask!30276 thiss!1427)) lt!458095)))

(declare-fun b!1039094 () Bool)

(assert (=> b!1039094 (= e!587956 Undefined!9713)))

(declare-fun b!1039095 () Bool)

(declare-fun e!587954 () SeekEntryResult!9713)

(assert (=> b!1039095 (= e!587956 e!587954)))

(declare-fun lt!458097 () (_ BitVec 64))

(assert (=> b!1039095 (= lt!458097 (select (arr!31483 (_keys!11527 thiss!1427)) (index!41225 lt!458096)))))

(declare-fun c!105568 () Bool)

(assert (=> b!1039095 (= c!105568 (= lt!458097 key!909))))

(declare-fun b!1039096 () Bool)

(assert (=> b!1039096 (= e!587954 (Found!9713 (index!41225 lt!458096)))))

(declare-fun b!1039097 () Bool)

(declare-fun c!105566 () Bool)

(assert (=> b!1039097 (= c!105566 (= lt!458097 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587955 () SeekEntryResult!9713)

(assert (=> b!1039097 (= e!587954 e!587955)))

(declare-fun b!1039098 () Bool)

(declare-fun lt!458098 () SeekEntryResult!9713)

(assert (=> b!1039098 (= e!587955 (ite ((_ is MissingVacant!9713) lt!458098) (MissingZero!9713 (index!41226 lt!458098)) lt!458098))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65419 (_ BitVec 32)) SeekEntryResult!9713)

(assert (=> b!1039098 (= lt!458098 (seekKeyOrZeroReturnVacant!0 (x!92558 lt!458096) (index!41225 lt!458096) (index!41225 lt!458096) key!909 (_keys!11527 thiss!1427) (mask!30276 thiss!1427)))))

(declare-fun b!1039099 () Bool)

(assert (=> b!1039099 (= e!587955 (MissingZero!9713 (index!41225 lt!458096)))))

(assert (= (and d!125737 c!105567) b!1039094))

(assert (= (and d!125737 (not c!105567)) b!1039095))

(assert (= (and b!1039095 c!105568) b!1039096))

(assert (= (and b!1039095 (not c!105568)) b!1039097))

(assert (= (and b!1039097 c!105566) b!1039099))

(assert (= (and b!1039097 (not c!105566)) b!1039098))

(declare-fun m!959571 () Bool)

(assert (=> d!125737 m!959571))

(declare-fun m!959573 () Bool)

(assert (=> d!125737 m!959573))

(assert (=> d!125737 m!959573))

(declare-fun m!959575 () Bool)

(assert (=> d!125737 m!959575))

(declare-fun m!959577 () Bool)

(assert (=> d!125737 m!959577))

(declare-fun m!959579 () Bool)

(assert (=> b!1039095 m!959579))

(declare-fun m!959581 () Bool)

(assert (=> b!1039098 m!959581))

(assert (=> b!1038968 d!125737))

(declare-fun d!125739 () Bool)

(declare-fun lt!458099 () Bool)

(assert (=> d!125739 (= lt!458099 (select (content!519 Nil!21907) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587958 () Bool)

(assert (=> d!125739 (= lt!458099 e!587958)))

(declare-fun res!692860 () Bool)

(assert (=> d!125739 (=> (not res!692860) (not e!587958))))

(assert (=> d!125739 (= res!692860 ((_ is Cons!21906) Nil!21907))))

(assert (=> d!125739 (= (contains!6051 Nil!21907 #b0000000000000000000000000000000000000000000000000000000000000000) lt!458099)))

(declare-fun b!1039100 () Bool)

(declare-fun e!587957 () Bool)

(assert (=> b!1039100 (= e!587958 e!587957)))

(declare-fun res!692861 () Bool)

(assert (=> b!1039100 (=> res!692861 e!587957)))

(assert (=> b!1039100 (= res!692861 (= (h!23118 Nil!21907) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039101 () Bool)

(assert (=> b!1039101 (= e!587957 (contains!6051 (t!31116 Nil!21907) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125739 res!692860) b!1039100))

(assert (= (and b!1039100 (not res!692861)) b!1039101))

(assert (=> d!125739 m!959565))

(declare-fun m!959583 () Bool)

(assert (=> d!125739 m!959583))

(declare-fun m!959585 () Bool)

(assert (=> b!1039101 m!959585))

(assert (=> b!1038963 d!125739))

(declare-fun b!1039109 () Bool)

(declare-fun e!587963 () Bool)

(assert (=> b!1039109 (= e!587963 tp_is_empty!24631)))

(declare-fun mapNonEmpty!38490 () Bool)

(declare-fun mapRes!38490 () Bool)

(declare-fun tp!73900 () Bool)

(declare-fun e!587964 () Bool)

(assert (=> mapNonEmpty!38490 (= mapRes!38490 (and tp!73900 e!587964))))

(declare-fun mapRest!38490 () (Array (_ BitVec 32) ValueCell!11612))

(declare-fun mapValue!38490 () ValueCell!11612)

(declare-fun mapKey!38490 () (_ BitVec 32))

(assert (=> mapNonEmpty!38490 (= mapRest!38481 (store mapRest!38490 mapKey!38490 mapValue!38490))))

(declare-fun mapIsEmpty!38490 () Bool)

(assert (=> mapIsEmpty!38490 mapRes!38490))

(declare-fun condMapEmpty!38490 () Bool)

(declare-fun mapDefault!38490 () ValueCell!11612)

(assert (=> mapNonEmpty!38481 (= condMapEmpty!38490 (= mapRest!38481 ((as const (Array (_ BitVec 32) ValueCell!11612)) mapDefault!38490)))))

(assert (=> mapNonEmpty!38481 (= tp!73884 (and e!587963 mapRes!38490))))

(declare-fun b!1039108 () Bool)

(assert (=> b!1039108 (= e!587964 tp_is_empty!24631)))

(assert (= (and mapNonEmpty!38481 condMapEmpty!38490) mapIsEmpty!38490))

(assert (= (and mapNonEmpty!38481 (not condMapEmpty!38490)) mapNonEmpty!38490))

(assert (= (and mapNonEmpty!38490 ((_ is ValueCellFull!11612) mapValue!38490)) b!1039108))

(assert (= (and mapNonEmpty!38481 ((_ is ValueCellFull!11612) mapDefault!38490)) b!1039109))

(declare-fun m!959587 () Bool)

(assert (=> mapNonEmpty!38490 m!959587))

(check-sat (not d!125731) (not b!1039075) (not mapNonEmpty!38490) (not d!125735) (not bm!43991) (not d!125737) (not b!1039101) b_and!33453 (not bm!43990) (not d!125725) (not b!1039039) (not b!1039069) (not b!1039081) tp_is_empty!24631 (not b!1039074) (not b!1039066) (not d!125739) (not b!1039055) (not b!1039051) (not b!1039098) (not b_next!20911) (not b!1039040) (not b!1039067) (not b!1039041))
(check-sat b_and!33453 (not b_next!20911))
