; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81582 () Bool)

(assert start!81582)

(declare-fun b!953048 () Bool)

(declare-fun b_free!18309 () Bool)

(declare-fun b_next!18309 () Bool)

(assert (=> b!953048 (= b_free!18309 (not b_next!18309))))

(declare-fun tp!63554 () Bool)

(declare-fun b_and!29793 () Bool)

(assert (=> b!953048 (= tp!63554 b_and!29793)))

(declare-fun mapNonEmpty!33169 () Bool)

(declare-fun mapRes!33169 () Bool)

(declare-fun tp!63555 () Bool)

(declare-fun e!536781 () Bool)

(assert (=> mapNonEmpty!33169 (= mapRes!33169 (and tp!63555 e!536781))))

(declare-fun mapKey!33169 () (_ BitVec 32))

(declare-datatypes ((V!32721 0))(
  ( (V!32722 (val!10459 Int)) )
))
(declare-datatypes ((ValueCell!9927 0))(
  ( (ValueCellFull!9927 (v!13012 V!32721)) (EmptyCell!9927) )
))
(declare-fun mapValue!33169 () ValueCell!9927)

(declare-datatypes ((array!57672 0))(
  ( (array!57673 (arr!27726 (Array (_ BitVec 32) ValueCell!9927)) (size!28205 (_ BitVec 32))) )
))
(declare-datatypes ((array!57674 0))(
  ( (array!57675 (arr!27727 (Array (_ BitVec 32) (_ BitVec 64))) (size!28206 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5004 0))(
  ( (LongMapFixedSize!5005 (defaultEntry!5837 Int) (mask!27700 (_ BitVec 32)) (extraKeys!5569 (_ BitVec 32)) (zeroValue!5673 V!32721) (minValue!5673 V!32721) (_size!2557 (_ BitVec 32)) (_keys!10796 array!57674) (_values!5860 array!57672) (_vacant!2557 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!5004)

(declare-fun mapRest!33169 () (Array (_ BitVec 32) ValueCell!9927))

(assert (=> mapNonEmpty!33169 (= (arr!27726 (_values!5860 thiss!1141)) (store mapRest!33169 mapKey!33169 mapValue!33169))))

(declare-fun res!638343 () Bool)

(declare-fun e!536780 () Bool)

(assert (=> start!81582 (=> (not res!638343) (not e!536780))))

(declare-fun valid!1904 (LongMapFixedSize!5004) Bool)

(assert (=> start!81582 (= res!638343 (valid!1904 thiss!1141))))

(assert (=> start!81582 e!536780))

(declare-fun e!536775 () Bool)

(assert (=> start!81582 e!536775))

(assert (=> start!81582 true))

(declare-fun b!953043 () Bool)

(declare-fun e!536778 () Bool)

(declare-fun e!536777 () Bool)

(assert (=> b!953043 (= e!536778 (and e!536777 mapRes!33169))))

(declare-fun condMapEmpty!33169 () Bool)

(declare-fun mapDefault!33169 () ValueCell!9927)

(assert (=> b!953043 (= condMapEmpty!33169 (= (arr!27726 (_values!5860 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9927)) mapDefault!33169)))))

(declare-fun b!953044 () Bool)

(declare-datatypes ((Unit!32063 0))(
  ( (Unit!32064) )
))
(declare-fun e!536779 () Unit!32063)

(declare-fun Unit!32065 () Unit!32063)

(assert (=> b!953044 (= e!536779 Unit!32065)))

(declare-fun mapIsEmpty!33169 () Bool)

(assert (=> mapIsEmpty!33169 mapRes!33169))

(declare-fun b!953045 () Bool)

(declare-fun Unit!32066 () Unit!32063)

(assert (=> b!953045 (= e!536779 Unit!32066)))

(declare-fun lt!429503 () Unit!32063)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun lemmaKeyInListMapIsInArray!341 (array!57674 array!57672 (_ BitVec 32) (_ BitVec 32) V!32721 V!32721 (_ BitVec 64) Int) Unit!32063)

(assert (=> b!953045 (= lt!429503 (lemmaKeyInListMapIsInArray!341 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) key!756 (defaultEntry!5837 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953045 (arrayContainsKey!0 (_keys!10796 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429507 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57674 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!953045 (= lt!429507 (arrayScanForKey!0 (_keys!10796 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun lt!429505 () Unit!32063)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32063)

(assert (=> b!953045 (= lt!429505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10796 thiss!1141) (mask!27700 thiss!1141) #b00000000000000000000000000000000 lt!429507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57674 (_ BitVec 32)) Bool)

(assert (=> b!953045 (arrayForallSeekEntryOrOpenFound!0 lt!429507 (_keys!10796 thiss!1141) (mask!27700 thiss!1141))))

(declare-fun lt!429504 () Unit!32063)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!57674 (_ BitVec 32)) Unit!32063)

(assert (=> b!953045 (= lt!429504 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!429507 (_keys!10796 thiss!1141) (mask!27700 thiss!1141)))))

(assert (=> b!953045 false))

(declare-fun b!953046 () Bool)

(declare-fun res!638341 () Bool)

(assert (=> b!953046 (=> (not res!638341) (not e!536780))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9167 0))(
  ( (MissingZero!9167 (index!39039 (_ BitVec 32))) (Found!9167 (index!39040 (_ BitVec 32))) (Intermediate!9167 (undefined!9979 Bool) (index!39041 (_ BitVec 32)) (x!81989 (_ BitVec 32))) (Undefined!9167) (MissingVacant!9167 (index!39042 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57674 (_ BitVec 32)) SeekEntryResult!9167)

(assert (=> b!953046 (= res!638341 (not ((_ is Found!9167) (seekEntry!0 key!756 (_keys!10796 thiss!1141) (mask!27700 thiss!1141)))))))

(declare-fun b!953047 () Bool)

(declare-fun tp_is_empty!20817 () Bool)

(assert (=> b!953047 (= e!536781 tp_is_empty!20817)))

(declare-fun array_inv!21516 (array!57674) Bool)

(declare-fun array_inv!21517 (array!57672) Bool)

(assert (=> b!953048 (= e!536775 (and tp!63554 tp_is_empty!20817 (array_inv!21516 (_keys!10796 thiss!1141)) (array_inv!21517 (_values!5860 thiss!1141)) e!536778))))

(declare-fun b!953049 () Bool)

(assert (=> b!953049 (= e!536777 tp_is_empty!20817)))

(declare-fun b!953050 () Bool)

(declare-datatypes ((tuple2!13598 0))(
  ( (tuple2!13599 (_1!6810 (_ BitVec 64)) (_2!6810 V!32721)) )
))
(declare-datatypes ((List!19374 0))(
  ( (Nil!19371) (Cons!19370 (h!20532 tuple2!13598) (t!27733 List!19374)) )
))
(declare-datatypes ((ListLongMap!12295 0))(
  ( (ListLongMap!12296 (toList!6163 List!19374)) )
))
(declare-fun contains!5258 (ListLongMap!12295 (_ BitVec 64)) Bool)

(declare-fun map!13110 (LongMapFixedSize!5004) ListLongMap!12295)

(assert (=> b!953050 (= e!536780 (contains!5258 (map!13110 thiss!1141) key!756))))

(declare-fun lt!429506 () Unit!32063)

(assert (=> b!953050 (= lt!429506 e!536779)))

(declare-fun c!99739 () Bool)

(declare-fun getCurrentListMap!3396 (array!57674 array!57672 (_ BitVec 32) (_ BitVec 32) V!32721 V!32721 (_ BitVec 32) Int) ListLongMap!12295)

(assert (=> b!953050 (= c!99739 (contains!5258 (getCurrentListMap!3396 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5837 thiss!1141)) key!756))))

(declare-fun b!953051 () Bool)

(declare-fun res!638342 () Bool)

(assert (=> b!953051 (=> (not res!638342) (not e!536780))))

(assert (=> b!953051 (= res!638342 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!81582 res!638343) b!953051))

(assert (= (and b!953051 res!638342) b!953046))

(assert (= (and b!953046 res!638341) b!953050))

(assert (= (and b!953050 c!99739) b!953045))

(assert (= (and b!953050 (not c!99739)) b!953044))

(assert (= (and b!953043 condMapEmpty!33169) mapIsEmpty!33169))

(assert (= (and b!953043 (not condMapEmpty!33169)) mapNonEmpty!33169))

(assert (= (and mapNonEmpty!33169 ((_ is ValueCellFull!9927) mapValue!33169)) b!953047))

(assert (= (and b!953043 ((_ is ValueCellFull!9927) mapDefault!33169)) b!953049))

(assert (= b!953048 b!953043))

(assert (= start!81582 b!953048))

(declare-fun m!885127 () Bool)

(assert (=> b!953050 m!885127))

(assert (=> b!953050 m!885127))

(declare-fun m!885129 () Bool)

(assert (=> b!953050 m!885129))

(declare-fun m!885131 () Bool)

(assert (=> b!953050 m!885131))

(assert (=> b!953050 m!885131))

(declare-fun m!885133 () Bool)

(assert (=> b!953050 m!885133))

(declare-fun m!885135 () Bool)

(assert (=> start!81582 m!885135))

(declare-fun m!885137 () Bool)

(assert (=> b!953045 m!885137))

(declare-fun m!885139 () Bool)

(assert (=> b!953045 m!885139))

(declare-fun m!885141 () Bool)

(assert (=> b!953045 m!885141))

(declare-fun m!885143 () Bool)

(assert (=> b!953045 m!885143))

(declare-fun m!885145 () Bool)

(assert (=> b!953045 m!885145))

(declare-fun m!885147 () Bool)

(assert (=> b!953045 m!885147))

(declare-fun m!885149 () Bool)

(assert (=> b!953048 m!885149))

(declare-fun m!885151 () Bool)

(assert (=> b!953048 m!885151))

(declare-fun m!885153 () Bool)

(assert (=> b!953046 m!885153))

(declare-fun m!885155 () Bool)

(assert (=> mapNonEmpty!33169 m!885155))

(check-sat b_and!29793 (not b_next!18309) tp_is_empty!20817 (not start!81582) (not b!953050) (not mapNonEmpty!33169) (not b!953045) (not b!953048) (not b!953046))
(check-sat b_and!29793 (not b_next!18309))
(get-model)

(declare-fun d!115595 () Bool)

(declare-fun res!638359 () Bool)

(declare-fun e!536805 () Bool)

(assert (=> d!115595 (=> (not res!638359) (not e!536805))))

(declare-fun simpleValid!384 (LongMapFixedSize!5004) Bool)

(assert (=> d!115595 (= res!638359 (simpleValid!384 thiss!1141))))

(assert (=> d!115595 (= (valid!1904 thiss!1141) e!536805)))

(declare-fun b!953085 () Bool)

(declare-fun res!638360 () Bool)

(assert (=> b!953085 (=> (not res!638360) (not e!536805))))

(declare-fun arrayCountValidKeys!0 (array!57674 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!953085 (= res!638360 (= (arrayCountValidKeys!0 (_keys!10796 thiss!1141) #b00000000000000000000000000000000 (size!28206 (_keys!10796 thiss!1141))) (_size!2557 thiss!1141)))))

(declare-fun b!953086 () Bool)

(declare-fun res!638361 () Bool)

(assert (=> b!953086 (=> (not res!638361) (not e!536805))))

(assert (=> b!953086 (= res!638361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10796 thiss!1141) (mask!27700 thiss!1141)))))

(declare-fun b!953087 () Bool)

(declare-datatypes ((List!19376 0))(
  ( (Nil!19373) (Cons!19372 (h!20534 (_ BitVec 64)) (t!27737 List!19376)) )
))
(declare-fun arrayNoDuplicates!0 (array!57674 (_ BitVec 32) List!19376) Bool)

(assert (=> b!953087 (= e!536805 (arrayNoDuplicates!0 (_keys!10796 thiss!1141) #b00000000000000000000000000000000 Nil!19373))))

(assert (= (and d!115595 res!638359) b!953085))

(assert (= (and b!953085 res!638360) b!953086))

(assert (= (and b!953086 res!638361) b!953087))

(declare-fun m!885187 () Bool)

(assert (=> d!115595 m!885187))

(declare-fun m!885189 () Bool)

(assert (=> b!953085 m!885189))

(declare-fun m!885191 () Bool)

(assert (=> b!953086 m!885191))

(declare-fun m!885193 () Bool)

(assert (=> b!953087 m!885193))

(assert (=> start!81582 d!115595))

(declare-fun b!953096 () Bool)

(declare-fun e!536812 () Bool)

(declare-fun e!536814 () Bool)

(assert (=> b!953096 (= e!536812 e!536814)))

(declare-fun c!99745 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953096 (= c!99745 (validKeyInArray!0 (select (arr!27727 (_keys!10796 thiss!1141)) lt!429507)))))

(declare-fun b!953097 () Bool)

(declare-fun call!41627 () Bool)

(assert (=> b!953097 (= e!536814 call!41627)))

(declare-fun bm!41624 () Bool)

(assert (=> bm!41624 (= call!41627 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!429507 #b00000000000000000000000000000001) (_keys!10796 thiss!1141) (mask!27700 thiss!1141)))))

(declare-fun d!115597 () Bool)

(declare-fun res!638366 () Bool)

(assert (=> d!115597 (=> res!638366 e!536812)))

(assert (=> d!115597 (= res!638366 (bvsge lt!429507 (size!28206 (_keys!10796 thiss!1141))))))

(assert (=> d!115597 (= (arrayForallSeekEntryOrOpenFound!0 lt!429507 (_keys!10796 thiss!1141) (mask!27700 thiss!1141)) e!536812)))

(declare-fun b!953098 () Bool)

(declare-fun e!536813 () Bool)

(assert (=> b!953098 (= e!536813 call!41627)))

(declare-fun b!953099 () Bool)

(assert (=> b!953099 (= e!536814 e!536813)))

(declare-fun lt!429530 () (_ BitVec 64))

(assert (=> b!953099 (= lt!429530 (select (arr!27727 (_keys!10796 thiss!1141)) lt!429507))))

(declare-fun lt!429529 () Unit!32063)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57674 (_ BitVec 64) (_ BitVec 32)) Unit!32063)

(assert (=> b!953099 (= lt!429529 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10796 thiss!1141) lt!429530 lt!429507))))

(assert (=> b!953099 (arrayContainsKey!0 (_keys!10796 thiss!1141) lt!429530 #b00000000000000000000000000000000)))

(declare-fun lt!429531 () Unit!32063)

(assert (=> b!953099 (= lt!429531 lt!429529)))

(declare-fun res!638367 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57674 (_ BitVec 32)) SeekEntryResult!9167)

(assert (=> b!953099 (= res!638367 (= (seekEntryOrOpen!0 (select (arr!27727 (_keys!10796 thiss!1141)) lt!429507) (_keys!10796 thiss!1141) (mask!27700 thiss!1141)) (Found!9167 lt!429507)))))

(assert (=> b!953099 (=> (not res!638367) (not e!536813))))

(assert (= (and d!115597 (not res!638366)) b!953096))

(assert (= (and b!953096 c!99745) b!953099))

(assert (= (and b!953096 (not c!99745)) b!953097))

(assert (= (and b!953099 res!638367) b!953098))

(assert (= (or b!953098 b!953097) bm!41624))

(declare-fun m!885195 () Bool)

(assert (=> b!953096 m!885195))

(assert (=> b!953096 m!885195))

(declare-fun m!885197 () Bool)

(assert (=> b!953096 m!885197))

(declare-fun m!885199 () Bool)

(assert (=> bm!41624 m!885199))

(assert (=> b!953099 m!885195))

(declare-fun m!885201 () Bool)

(assert (=> b!953099 m!885201))

(declare-fun m!885203 () Bool)

(assert (=> b!953099 m!885203))

(assert (=> b!953099 m!885195))

(declare-fun m!885205 () Bool)

(assert (=> b!953099 m!885205))

(assert (=> b!953045 d!115597))

(declare-fun d!115599 () Bool)

(assert (=> d!115599 (arrayForallSeekEntryOrOpenFound!0 lt!429507 (_keys!10796 thiss!1141) (mask!27700 thiss!1141))))

(declare-fun lt!429534 () Unit!32063)

(declare-fun choose!38 (array!57674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32063)

(assert (=> d!115599 (= lt!429534 (choose!38 (_keys!10796 thiss!1141) (mask!27700 thiss!1141) #b00000000000000000000000000000000 lt!429507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!115599 (validMask!0 (mask!27700 thiss!1141))))

(assert (=> d!115599 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10796 thiss!1141) (mask!27700 thiss!1141) #b00000000000000000000000000000000 lt!429507) lt!429534)))

(declare-fun bs!26774 () Bool)

(assert (= bs!26774 d!115599))

(assert (=> bs!26774 m!885139))

(declare-fun m!885207 () Bool)

(assert (=> bs!26774 m!885207))

(declare-fun m!885209 () Bool)

(assert (=> bs!26774 m!885209))

(assert (=> b!953045 d!115599))

(declare-fun d!115601 () Bool)

(declare-fun res!638372 () Bool)

(declare-fun e!536819 () Bool)

(assert (=> d!115601 (=> res!638372 e!536819)))

(assert (=> d!115601 (= res!638372 (= (select (arr!27727 (_keys!10796 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115601 (= (arrayContainsKey!0 (_keys!10796 thiss!1141) key!756 #b00000000000000000000000000000000) e!536819)))

(declare-fun b!953104 () Bool)

(declare-fun e!536820 () Bool)

(assert (=> b!953104 (= e!536819 e!536820)))

(declare-fun res!638373 () Bool)

(assert (=> b!953104 (=> (not res!638373) (not e!536820))))

(assert (=> b!953104 (= res!638373 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28206 (_keys!10796 thiss!1141))))))

(declare-fun b!953105 () Bool)

(assert (=> b!953105 (= e!536820 (arrayContainsKey!0 (_keys!10796 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115601 (not res!638372)) b!953104))

(assert (= (and b!953104 res!638373) b!953105))

(declare-fun m!885211 () Bool)

(assert (=> d!115601 m!885211))

(declare-fun m!885213 () Bool)

(assert (=> b!953105 m!885213))

(assert (=> b!953045 d!115601))

(declare-fun d!115603 () Bool)

(declare-fun e!536823 () Bool)

(assert (=> d!115603 e!536823))

(declare-fun c!99748 () Bool)

(assert (=> d!115603 (= c!99748 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429537 () Unit!32063)

(declare-fun choose!1600 (array!57674 array!57672 (_ BitVec 32) (_ BitVec 32) V!32721 V!32721 (_ BitVec 64) Int) Unit!32063)

(assert (=> d!115603 (= lt!429537 (choose!1600 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) key!756 (defaultEntry!5837 thiss!1141)))))

(assert (=> d!115603 (validMask!0 (mask!27700 thiss!1141))))

(assert (=> d!115603 (= (lemmaKeyInListMapIsInArray!341 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) key!756 (defaultEntry!5837 thiss!1141)) lt!429537)))

(declare-fun b!953110 () Bool)

(assert (=> b!953110 (= e!536823 (arrayContainsKey!0 (_keys!10796 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!953111 () Bool)

(assert (=> b!953111 (= e!536823 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5569 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5569 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115603 c!99748) b!953110))

(assert (= (and d!115603 (not c!99748)) b!953111))

(declare-fun m!885215 () Bool)

(assert (=> d!115603 m!885215))

(assert (=> d!115603 m!885209))

(assert (=> b!953110 m!885143))

(assert (=> b!953045 d!115603))

(declare-fun d!115605 () Bool)

(declare-fun lt!429543 () SeekEntryResult!9167)

(assert (=> d!115605 (and ((_ is Found!9167) lt!429543) (= (index!39040 lt!429543) lt!429507))))

(assert (=> d!115605 (= lt!429543 (seekEntry!0 key!756 (_keys!10796 thiss!1141) (mask!27700 thiss!1141)))))

(declare-fun lt!429542 () Unit!32063)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!57674 (_ BitVec 32)) Unit!32063)

(assert (=> d!115605 (= lt!429542 (choose!0 key!756 lt!429507 (_keys!10796 thiss!1141) (mask!27700 thiss!1141)))))

(assert (=> d!115605 (validMask!0 (mask!27700 thiss!1141))))

(assert (=> d!115605 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!429507 (_keys!10796 thiss!1141) (mask!27700 thiss!1141)) lt!429542)))

(declare-fun bs!26775 () Bool)

(assert (= bs!26775 d!115605))

(assert (=> bs!26775 m!885153))

(declare-fun m!885217 () Bool)

(assert (=> bs!26775 m!885217))

(assert (=> bs!26775 m!885209))

(assert (=> b!953045 d!115605))

(declare-fun d!115607 () Bool)

(declare-fun lt!429546 () (_ BitVec 32))

(assert (=> d!115607 (and (or (bvslt lt!429546 #b00000000000000000000000000000000) (bvsge lt!429546 (size!28206 (_keys!10796 thiss!1141))) (and (bvsge lt!429546 #b00000000000000000000000000000000) (bvslt lt!429546 (size!28206 (_keys!10796 thiss!1141))))) (bvsge lt!429546 #b00000000000000000000000000000000) (bvslt lt!429546 (size!28206 (_keys!10796 thiss!1141))) (= (select (arr!27727 (_keys!10796 thiss!1141)) lt!429546) key!756))))

(declare-fun e!536826 () (_ BitVec 32))

(assert (=> d!115607 (= lt!429546 e!536826)))

(declare-fun c!99751 () Bool)

(assert (=> d!115607 (= c!99751 (= (select (arr!27727 (_keys!10796 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115607 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28206 (_keys!10796 thiss!1141))) (bvslt (size!28206 (_keys!10796 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115607 (= (arrayScanForKey!0 (_keys!10796 thiss!1141) key!756 #b00000000000000000000000000000000) lt!429546)))

(declare-fun b!953116 () Bool)

(assert (=> b!953116 (= e!536826 #b00000000000000000000000000000000)))

(declare-fun b!953117 () Bool)

(assert (=> b!953117 (= e!536826 (arrayScanForKey!0 (_keys!10796 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115607 c!99751) b!953116))

(assert (= (and d!115607 (not c!99751)) b!953117))

(declare-fun m!885219 () Bool)

(assert (=> d!115607 m!885219))

(assert (=> d!115607 m!885211))

(declare-fun m!885221 () Bool)

(assert (=> b!953117 m!885221))

(assert (=> b!953045 d!115607))

(declare-fun d!115609 () Bool)

(declare-fun e!536832 () Bool)

(assert (=> d!115609 e!536832))

(declare-fun res!638376 () Bool)

(assert (=> d!115609 (=> res!638376 e!536832)))

(declare-fun lt!429556 () Bool)

(assert (=> d!115609 (= res!638376 (not lt!429556))))

(declare-fun lt!429557 () Bool)

(assert (=> d!115609 (= lt!429556 lt!429557)))

(declare-fun lt!429555 () Unit!32063)

(declare-fun e!536831 () Unit!32063)

(assert (=> d!115609 (= lt!429555 e!536831)))

(declare-fun c!99754 () Bool)

(assert (=> d!115609 (= c!99754 lt!429557)))

(declare-fun containsKey!474 (List!19374 (_ BitVec 64)) Bool)

(assert (=> d!115609 (= lt!429557 (containsKey!474 (toList!6163 (map!13110 thiss!1141)) key!756))))

(assert (=> d!115609 (= (contains!5258 (map!13110 thiss!1141) key!756) lt!429556)))

(declare-fun b!953124 () Bool)

(declare-fun lt!429558 () Unit!32063)

(assert (=> b!953124 (= e!536831 lt!429558)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!370 (List!19374 (_ BitVec 64)) Unit!32063)

(assert (=> b!953124 (= lt!429558 (lemmaContainsKeyImpliesGetValueByKeyDefined!370 (toList!6163 (map!13110 thiss!1141)) key!756))))

(declare-datatypes ((Option!513 0))(
  ( (Some!512 (v!13014 V!32721)) (None!511) )
))
(declare-fun isDefined!379 (Option!513) Bool)

(declare-fun getValueByKey!507 (List!19374 (_ BitVec 64)) Option!513)

(assert (=> b!953124 (isDefined!379 (getValueByKey!507 (toList!6163 (map!13110 thiss!1141)) key!756))))

(declare-fun b!953125 () Bool)

(declare-fun Unit!32070 () Unit!32063)

(assert (=> b!953125 (= e!536831 Unit!32070)))

(declare-fun b!953126 () Bool)

(assert (=> b!953126 (= e!536832 (isDefined!379 (getValueByKey!507 (toList!6163 (map!13110 thiss!1141)) key!756)))))

(assert (= (and d!115609 c!99754) b!953124))

(assert (= (and d!115609 (not c!99754)) b!953125))

(assert (= (and d!115609 (not res!638376)) b!953126))

(declare-fun m!885223 () Bool)

(assert (=> d!115609 m!885223))

(declare-fun m!885225 () Bool)

(assert (=> b!953124 m!885225))

(declare-fun m!885227 () Bool)

(assert (=> b!953124 m!885227))

(assert (=> b!953124 m!885227))

(declare-fun m!885229 () Bool)

(assert (=> b!953124 m!885229))

(assert (=> b!953126 m!885227))

(assert (=> b!953126 m!885227))

(assert (=> b!953126 m!885229))

(assert (=> b!953050 d!115609))

(declare-fun d!115611 () Bool)

(assert (=> d!115611 (= (map!13110 thiss!1141) (getCurrentListMap!3396 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5837 thiss!1141)))))

(declare-fun bs!26776 () Bool)

(assert (= bs!26776 d!115611))

(assert (=> bs!26776 m!885131))

(assert (=> b!953050 d!115611))

(declare-fun d!115613 () Bool)

(declare-fun e!536834 () Bool)

(assert (=> d!115613 e!536834))

(declare-fun res!638377 () Bool)

(assert (=> d!115613 (=> res!638377 e!536834)))

(declare-fun lt!429560 () Bool)

(assert (=> d!115613 (= res!638377 (not lt!429560))))

(declare-fun lt!429561 () Bool)

(assert (=> d!115613 (= lt!429560 lt!429561)))

(declare-fun lt!429559 () Unit!32063)

(declare-fun e!536833 () Unit!32063)

(assert (=> d!115613 (= lt!429559 e!536833)))

(declare-fun c!99755 () Bool)

(assert (=> d!115613 (= c!99755 lt!429561)))

(assert (=> d!115613 (= lt!429561 (containsKey!474 (toList!6163 (getCurrentListMap!3396 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5837 thiss!1141))) key!756))))

(assert (=> d!115613 (= (contains!5258 (getCurrentListMap!3396 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5837 thiss!1141)) key!756) lt!429560)))

(declare-fun b!953127 () Bool)

(declare-fun lt!429562 () Unit!32063)

(assert (=> b!953127 (= e!536833 lt!429562)))

(assert (=> b!953127 (= lt!429562 (lemmaContainsKeyImpliesGetValueByKeyDefined!370 (toList!6163 (getCurrentListMap!3396 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5837 thiss!1141))) key!756))))

(assert (=> b!953127 (isDefined!379 (getValueByKey!507 (toList!6163 (getCurrentListMap!3396 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5837 thiss!1141))) key!756))))

(declare-fun b!953128 () Bool)

(declare-fun Unit!32071 () Unit!32063)

(assert (=> b!953128 (= e!536833 Unit!32071)))

(declare-fun b!953129 () Bool)

(assert (=> b!953129 (= e!536834 (isDefined!379 (getValueByKey!507 (toList!6163 (getCurrentListMap!3396 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5837 thiss!1141))) key!756)))))

(assert (= (and d!115613 c!99755) b!953127))

(assert (= (and d!115613 (not c!99755)) b!953128))

(assert (= (and d!115613 (not res!638377)) b!953129))

(declare-fun m!885231 () Bool)

(assert (=> d!115613 m!885231))

(declare-fun m!885233 () Bool)

(assert (=> b!953127 m!885233))

(declare-fun m!885235 () Bool)

(assert (=> b!953127 m!885235))

(assert (=> b!953127 m!885235))

(declare-fun m!885237 () Bool)

(assert (=> b!953127 m!885237))

(assert (=> b!953129 m!885235))

(assert (=> b!953129 m!885235))

(assert (=> b!953129 m!885237))

(assert (=> b!953050 d!115613))

(declare-fun b!953172 () Bool)

(declare-fun e!536861 () Bool)

(declare-fun e!536864 () Bool)

(assert (=> b!953172 (= e!536861 e!536864)))

(declare-fun c!99769 () Bool)

(assert (=> b!953172 (= c!99769 (not (= (bvand (extraKeys!5569 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41639 () Bool)

(declare-fun call!41645 () ListLongMap!12295)

(declare-fun call!41646 () ListLongMap!12295)

(assert (=> bm!41639 (= call!41645 call!41646)))

(declare-fun b!953173 () Bool)

(declare-fun e!536866 () Bool)

(declare-fun lt!429616 () ListLongMap!12295)

(declare-fun apply!888 (ListLongMap!12295 (_ BitVec 64)) V!32721)

(assert (=> b!953173 (= e!536866 (= (apply!888 lt!429616 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5673 thiss!1141)))))

(declare-fun b!953174 () Bool)

(declare-fun e!536870 () Unit!32063)

(declare-fun lt!429607 () Unit!32063)

(assert (=> b!953174 (= e!536870 lt!429607)))

(declare-fun lt!429610 () ListLongMap!12295)

(declare-fun getCurrentListMapNoExtraKeys!3327 (array!57674 array!57672 (_ BitVec 32) (_ BitVec 32) V!32721 V!32721 (_ BitVec 32) Int) ListLongMap!12295)

(assert (=> b!953174 (= lt!429610 (getCurrentListMapNoExtraKeys!3327 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5837 thiss!1141)))))

(declare-fun lt!429623 () (_ BitVec 64))

(assert (=> b!953174 (= lt!429623 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429613 () (_ BitVec 64))

(assert (=> b!953174 (= lt!429613 (select (arr!27727 (_keys!10796 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429621 () Unit!32063)

(declare-fun addStillContains!591 (ListLongMap!12295 (_ BitVec 64) V!32721 (_ BitVec 64)) Unit!32063)

(assert (=> b!953174 (= lt!429621 (addStillContains!591 lt!429610 lt!429623 (zeroValue!5673 thiss!1141) lt!429613))))

(declare-fun +!2872 (ListLongMap!12295 tuple2!13598) ListLongMap!12295)

(assert (=> b!953174 (contains!5258 (+!2872 lt!429610 (tuple2!13599 lt!429623 (zeroValue!5673 thiss!1141))) lt!429613)))

(declare-fun lt!429618 () Unit!32063)

(assert (=> b!953174 (= lt!429618 lt!429621)))

(declare-fun lt!429625 () ListLongMap!12295)

(assert (=> b!953174 (= lt!429625 (getCurrentListMapNoExtraKeys!3327 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5837 thiss!1141)))))

(declare-fun lt!429615 () (_ BitVec 64))

(assert (=> b!953174 (= lt!429615 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429619 () (_ BitVec 64))

(assert (=> b!953174 (= lt!429619 (select (arr!27727 (_keys!10796 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429611 () Unit!32063)

(declare-fun addApplyDifferent!471 (ListLongMap!12295 (_ BitVec 64) V!32721 (_ BitVec 64)) Unit!32063)

(assert (=> b!953174 (= lt!429611 (addApplyDifferent!471 lt!429625 lt!429615 (minValue!5673 thiss!1141) lt!429619))))

(assert (=> b!953174 (= (apply!888 (+!2872 lt!429625 (tuple2!13599 lt!429615 (minValue!5673 thiss!1141))) lt!429619) (apply!888 lt!429625 lt!429619))))

(declare-fun lt!429608 () Unit!32063)

(assert (=> b!953174 (= lt!429608 lt!429611)))

(declare-fun lt!429617 () ListLongMap!12295)

(assert (=> b!953174 (= lt!429617 (getCurrentListMapNoExtraKeys!3327 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5837 thiss!1141)))))

(declare-fun lt!429612 () (_ BitVec 64))

(assert (=> b!953174 (= lt!429612 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429624 () (_ BitVec 64))

(assert (=> b!953174 (= lt!429624 (select (arr!27727 (_keys!10796 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429614 () Unit!32063)

(assert (=> b!953174 (= lt!429614 (addApplyDifferent!471 lt!429617 lt!429612 (zeroValue!5673 thiss!1141) lt!429624))))

(assert (=> b!953174 (= (apply!888 (+!2872 lt!429617 (tuple2!13599 lt!429612 (zeroValue!5673 thiss!1141))) lt!429624) (apply!888 lt!429617 lt!429624))))

(declare-fun lt!429620 () Unit!32063)

(assert (=> b!953174 (= lt!429620 lt!429614)))

(declare-fun lt!429628 () ListLongMap!12295)

(assert (=> b!953174 (= lt!429628 (getCurrentListMapNoExtraKeys!3327 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5837 thiss!1141)))))

(declare-fun lt!429609 () (_ BitVec 64))

(assert (=> b!953174 (= lt!429609 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429627 () (_ BitVec 64))

(assert (=> b!953174 (= lt!429627 (select (arr!27727 (_keys!10796 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953174 (= lt!429607 (addApplyDifferent!471 lt!429628 lt!429609 (minValue!5673 thiss!1141) lt!429627))))

(assert (=> b!953174 (= (apply!888 (+!2872 lt!429628 (tuple2!13599 lt!429609 (minValue!5673 thiss!1141))) lt!429627) (apply!888 lt!429628 lt!429627))))

(declare-fun bm!41640 () Bool)

(declare-fun call!41647 () Bool)

(assert (=> bm!41640 (= call!41647 (contains!5258 lt!429616 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41641 () Bool)

(declare-fun call!41648 () Bool)

(assert (=> bm!41641 (= call!41648 (contains!5258 lt!429616 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!953175 () Bool)

(declare-fun e!536863 () ListLongMap!12295)

(declare-fun call!41643 () ListLongMap!12295)

(assert (=> b!953175 (= e!536863 call!41643)))

(declare-fun b!953176 () Bool)

(declare-fun e!536872 () Bool)

(assert (=> b!953176 (= e!536864 e!536872)))

(declare-fun res!638401 () Bool)

(assert (=> b!953176 (= res!638401 call!41647)))

(assert (=> b!953176 (=> (not res!638401) (not e!536872))))

(declare-fun bm!41642 () Bool)

(declare-fun call!41644 () ListLongMap!12295)

(assert (=> bm!41642 (= call!41643 call!41644)))

(declare-fun b!953178 () Bool)

(assert (=> b!953178 (= e!536863 call!41645)))

(declare-fun b!953179 () Bool)

(declare-fun e!536865 () Bool)

(declare-fun get!14573 (ValueCell!9927 V!32721) V!32721)

(declare-fun dynLambda!1661 (Int (_ BitVec 64)) V!32721)

(assert (=> b!953179 (= e!536865 (= (apply!888 lt!429616 (select (arr!27727 (_keys!10796 thiss!1141)) #b00000000000000000000000000000000)) (get!14573 (select (arr!27726 (_values!5860 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1661 (defaultEntry!5837 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!953179 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28205 (_values!5860 thiss!1141))))))

(assert (=> b!953179 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28206 (_keys!10796 thiss!1141))))))

(declare-fun b!953180 () Bool)

(assert (=> b!953180 (= e!536872 (= (apply!888 lt!429616 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5673 thiss!1141)))))

(declare-fun b!953181 () Bool)

(declare-fun e!536862 () Bool)

(assert (=> b!953181 (= e!536862 (validKeyInArray!0 (select (arr!27727 (_keys!10796 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!953182 () Bool)

(declare-fun e!536869 () Bool)

(assert (=> b!953182 (= e!536869 (not call!41648))))

(declare-fun b!953183 () Bool)

(declare-fun e!536867 () Bool)

(assert (=> b!953183 (= e!536867 e!536865)))

(declare-fun res!638404 () Bool)

(assert (=> b!953183 (=> (not res!638404) (not e!536865))))

(assert (=> b!953183 (= res!638404 (contains!5258 lt!429616 (select (arr!27727 (_keys!10796 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!953183 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28206 (_keys!10796 thiss!1141))))))

(declare-fun call!41642 () ListLongMap!12295)

(declare-fun bm!41643 () Bool)

(declare-fun c!99768 () Bool)

(declare-fun c!99770 () Bool)

(assert (=> bm!41643 (= call!41644 (+!2872 (ite c!99770 call!41642 (ite c!99768 call!41646 call!41645)) (ite (or c!99770 c!99768) (tuple2!13599 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5673 thiss!1141)) (tuple2!13599 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5673 thiss!1141)))))))

(declare-fun bm!41644 () Bool)

(assert (=> bm!41644 (= call!41646 call!41642)))

(declare-fun b!953184 () Bool)

(declare-fun e!536871 () ListLongMap!12295)

(declare-fun e!536868 () ListLongMap!12295)

(assert (=> b!953184 (= e!536871 e!536868)))

(assert (=> b!953184 (= c!99768 (and (not (= (bvand (extraKeys!5569 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5569 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!953185 () Bool)

(declare-fun c!99771 () Bool)

(assert (=> b!953185 (= c!99771 (and (not (= (bvand (extraKeys!5569 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5569 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!953185 (= e!536868 e!536863)))

(declare-fun b!953186 () Bool)

(declare-fun Unit!32072 () Unit!32063)

(assert (=> b!953186 (= e!536870 Unit!32072)))

(declare-fun b!953187 () Bool)

(declare-fun res!638397 () Bool)

(assert (=> b!953187 (=> (not res!638397) (not e!536861))))

(assert (=> b!953187 (= res!638397 e!536867)))

(declare-fun res!638396 () Bool)

(assert (=> b!953187 (=> res!638396 e!536867)))

(declare-fun e!536873 () Bool)

(assert (=> b!953187 (= res!638396 (not e!536873))))

(declare-fun res!638402 () Bool)

(assert (=> b!953187 (=> (not res!638402) (not e!536873))))

(assert (=> b!953187 (= res!638402 (bvslt #b00000000000000000000000000000000 (size!28206 (_keys!10796 thiss!1141))))))

(declare-fun b!953188 () Bool)

(assert (=> b!953188 (= e!536871 (+!2872 call!41644 (tuple2!13599 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5673 thiss!1141))))))

(declare-fun b!953189 () Bool)

(declare-fun res!638398 () Bool)

(assert (=> b!953189 (=> (not res!638398) (not e!536861))))

(assert (=> b!953189 (= res!638398 e!536869)))

(declare-fun c!99772 () Bool)

(assert (=> b!953189 (= c!99772 (not (= (bvand (extraKeys!5569 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!953190 () Bool)

(assert (=> b!953190 (= e!536873 (validKeyInArray!0 (select (arr!27727 (_keys!10796 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!953191 () Bool)

(assert (=> b!953191 (= e!536869 e!536866)))

(declare-fun res!638400 () Bool)

(assert (=> b!953191 (= res!638400 call!41648)))

(assert (=> b!953191 (=> (not res!638400) (not e!536866))))

(declare-fun b!953192 () Bool)

(assert (=> b!953192 (= e!536864 (not call!41647))))

(declare-fun bm!41645 () Bool)

(assert (=> bm!41645 (= call!41642 (getCurrentListMapNoExtraKeys!3327 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5837 thiss!1141)))))

(declare-fun d!115615 () Bool)

(assert (=> d!115615 e!536861))

(declare-fun res!638403 () Bool)

(assert (=> d!115615 (=> (not res!638403) (not e!536861))))

(assert (=> d!115615 (= res!638403 (or (bvsge #b00000000000000000000000000000000 (size!28206 (_keys!10796 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28206 (_keys!10796 thiss!1141))))))))

(declare-fun lt!429626 () ListLongMap!12295)

(assert (=> d!115615 (= lt!429616 lt!429626)))

(declare-fun lt!429622 () Unit!32063)

(assert (=> d!115615 (= lt!429622 e!536870)))

(declare-fun c!99773 () Bool)

(assert (=> d!115615 (= c!99773 e!536862)))

(declare-fun res!638399 () Bool)

(assert (=> d!115615 (=> (not res!638399) (not e!536862))))

(assert (=> d!115615 (= res!638399 (bvslt #b00000000000000000000000000000000 (size!28206 (_keys!10796 thiss!1141))))))

(assert (=> d!115615 (= lt!429626 e!536871)))

(assert (=> d!115615 (= c!99770 (and (not (= (bvand (extraKeys!5569 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5569 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115615 (validMask!0 (mask!27700 thiss!1141))))

(assert (=> d!115615 (= (getCurrentListMap!3396 (_keys!10796 thiss!1141) (_values!5860 thiss!1141) (mask!27700 thiss!1141) (extraKeys!5569 thiss!1141) (zeroValue!5673 thiss!1141) (minValue!5673 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5837 thiss!1141)) lt!429616)))

(declare-fun b!953177 () Bool)

(assert (=> b!953177 (= e!536868 call!41643)))

(assert (= (and d!115615 c!99770) b!953188))

(assert (= (and d!115615 (not c!99770)) b!953184))

(assert (= (and b!953184 c!99768) b!953177))

(assert (= (and b!953184 (not c!99768)) b!953185))

(assert (= (and b!953185 c!99771) b!953175))

(assert (= (and b!953185 (not c!99771)) b!953178))

(assert (= (or b!953175 b!953178) bm!41639))

(assert (= (or b!953177 bm!41639) bm!41644))

(assert (= (or b!953177 b!953175) bm!41642))

(assert (= (or b!953188 bm!41644) bm!41645))

(assert (= (or b!953188 bm!41642) bm!41643))

(assert (= (and d!115615 res!638399) b!953181))

(assert (= (and d!115615 c!99773) b!953174))

(assert (= (and d!115615 (not c!99773)) b!953186))

(assert (= (and d!115615 res!638403) b!953187))

(assert (= (and b!953187 res!638402) b!953190))

(assert (= (and b!953187 (not res!638396)) b!953183))

(assert (= (and b!953183 res!638404) b!953179))

(assert (= (and b!953187 res!638397) b!953189))

(assert (= (and b!953189 c!99772) b!953191))

(assert (= (and b!953189 (not c!99772)) b!953182))

(assert (= (and b!953191 res!638400) b!953173))

(assert (= (or b!953191 b!953182) bm!41641))

(assert (= (and b!953189 res!638398) b!953172))

(assert (= (and b!953172 c!99769) b!953176))

(assert (= (and b!953172 (not c!99769)) b!953192))

(assert (= (and b!953176 res!638401) b!953180))

(assert (= (or b!953176 b!953192) bm!41640))

(declare-fun b_lambda!14423 () Bool)

(assert (=> (not b_lambda!14423) (not b!953179)))

(declare-fun t!27736 () Bool)

(declare-fun tb!6211 () Bool)

(assert (=> (and b!953048 (= (defaultEntry!5837 thiss!1141) (defaultEntry!5837 thiss!1141)) t!27736) tb!6211))

(declare-fun result!12355 () Bool)

(assert (=> tb!6211 (= result!12355 tp_is_empty!20817)))

(assert (=> b!953179 t!27736))

(declare-fun b_and!29797 () Bool)

(assert (= b_and!29793 (and (=> t!27736 result!12355) b_and!29797)))

(declare-fun m!885239 () Bool)

(assert (=> bm!41643 m!885239))

(declare-fun m!885241 () Bool)

(assert (=> b!953188 m!885241))

(declare-fun m!885243 () Bool)

(assert (=> bm!41645 m!885243))

(assert (=> b!953190 m!885211))

(assert (=> b!953190 m!885211))

(declare-fun m!885245 () Bool)

(assert (=> b!953190 m!885245))

(declare-fun m!885247 () Bool)

(assert (=> b!953180 m!885247))

(declare-fun m!885249 () Bool)

(assert (=> b!953173 m!885249))

(declare-fun m!885251 () Bool)

(assert (=> bm!41641 m!885251))

(declare-fun m!885253 () Bool)

(assert (=> b!953174 m!885253))

(declare-fun m!885255 () Bool)

(assert (=> b!953174 m!885255))

(declare-fun m!885257 () Bool)

(assert (=> b!953174 m!885257))

(declare-fun m!885259 () Bool)

(assert (=> b!953174 m!885259))

(declare-fun m!885261 () Bool)

(assert (=> b!953174 m!885261))

(declare-fun m!885263 () Bool)

(assert (=> b!953174 m!885263))

(declare-fun m!885265 () Bool)

(assert (=> b!953174 m!885265))

(declare-fun m!885267 () Bool)

(assert (=> b!953174 m!885267))

(declare-fun m!885269 () Bool)

(assert (=> b!953174 m!885269))

(declare-fun m!885271 () Bool)

(assert (=> b!953174 m!885271))

(assert (=> b!953174 m!885243))

(assert (=> b!953174 m!885211))

(assert (=> b!953174 m!885269))

(assert (=> b!953174 m!885261))

(declare-fun m!885273 () Bool)

(assert (=> b!953174 m!885273))

(declare-fun m!885275 () Bool)

(assert (=> b!953174 m!885275))

(declare-fun m!885277 () Bool)

(assert (=> b!953174 m!885277))

(declare-fun m!885279 () Bool)

(assert (=> b!953174 m!885279))

(assert (=> b!953174 m!885275))

(assert (=> b!953174 m!885255))

(declare-fun m!885281 () Bool)

(assert (=> b!953174 m!885281))

(assert (=> b!953179 m!885211))

(assert (=> b!953179 m!885211))

(declare-fun m!885283 () Bool)

(assert (=> b!953179 m!885283))

(declare-fun m!885285 () Bool)

(assert (=> b!953179 m!885285))

(declare-fun m!885287 () Bool)

(assert (=> b!953179 m!885287))

(declare-fun m!885289 () Bool)

(assert (=> b!953179 m!885289))

(assert (=> b!953179 m!885285))

(assert (=> b!953179 m!885287))

(declare-fun m!885291 () Bool)

(assert (=> bm!41640 m!885291))

(assert (=> b!953181 m!885211))

(assert (=> b!953181 m!885211))

(assert (=> b!953181 m!885245))

(assert (=> b!953183 m!885211))

(assert (=> b!953183 m!885211))

(declare-fun m!885293 () Bool)

(assert (=> b!953183 m!885293))

(assert (=> d!115615 m!885209))

(assert (=> b!953050 d!115615))

(declare-fun b!953207 () Bool)

(declare-fun e!536882 () SeekEntryResult!9167)

(declare-fun lt!429639 () SeekEntryResult!9167)

(assert (=> b!953207 (= e!536882 (MissingZero!9167 (index!39041 lt!429639)))))

(declare-fun d!115617 () Bool)

(declare-fun lt!429640 () SeekEntryResult!9167)

(assert (=> d!115617 (and (or ((_ is MissingVacant!9167) lt!429640) (not ((_ is Found!9167) lt!429640)) (and (bvsge (index!39040 lt!429640) #b00000000000000000000000000000000) (bvslt (index!39040 lt!429640) (size!28206 (_keys!10796 thiss!1141))))) (not ((_ is MissingVacant!9167) lt!429640)) (or (not ((_ is Found!9167) lt!429640)) (= (select (arr!27727 (_keys!10796 thiss!1141)) (index!39040 lt!429640)) key!756)))))

(declare-fun e!536880 () SeekEntryResult!9167)

(assert (=> d!115617 (= lt!429640 e!536880)))

(declare-fun c!99781 () Bool)

(assert (=> d!115617 (= c!99781 (and ((_ is Intermediate!9167) lt!429639) (undefined!9979 lt!429639)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57674 (_ BitVec 32)) SeekEntryResult!9167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115617 (= lt!429639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27700 thiss!1141)) key!756 (_keys!10796 thiss!1141) (mask!27700 thiss!1141)))))

(assert (=> d!115617 (validMask!0 (mask!27700 thiss!1141))))

(assert (=> d!115617 (= (seekEntry!0 key!756 (_keys!10796 thiss!1141) (mask!27700 thiss!1141)) lt!429640)))

(declare-fun b!953208 () Bool)

(assert (=> b!953208 (= e!536880 Undefined!9167)))

(declare-fun b!953209 () Bool)

(declare-fun e!536881 () SeekEntryResult!9167)

(assert (=> b!953209 (= e!536880 e!536881)))

(declare-fun lt!429637 () (_ BitVec 64))

(assert (=> b!953209 (= lt!429637 (select (arr!27727 (_keys!10796 thiss!1141)) (index!39041 lt!429639)))))

(declare-fun c!99782 () Bool)

(assert (=> b!953209 (= c!99782 (= lt!429637 key!756))))

(declare-fun b!953210 () Bool)

(declare-fun c!99780 () Bool)

(assert (=> b!953210 (= c!99780 (= lt!429637 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!953210 (= e!536881 e!536882)))

(declare-fun b!953211 () Bool)

(declare-fun lt!429638 () SeekEntryResult!9167)

(assert (=> b!953211 (= e!536882 (ite ((_ is MissingVacant!9167) lt!429638) (MissingZero!9167 (index!39042 lt!429638)) lt!429638))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57674 (_ BitVec 32)) SeekEntryResult!9167)

(assert (=> b!953211 (= lt!429638 (seekKeyOrZeroReturnVacant!0 (x!81989 lt!429639) (index!39041 lt!429639) (index!39041 lt!429639) key!756 (_keys!10796 thiss!1141) (mask!27700 thiss!1141)))))

(declare-fun b!953212 () Bool)

(assert (=> b!953212 (= e!536881 (Found!9167 (index!39041 lt!429639)))))

(assert (= (and d!115617 c!99781) b!953208))

(assert (= (and d!115617 (not c!99781)) b!953209))

(assert (= (and b!953209 c!99782) b!953212))

(assert (= (and b!953209 (not c!99782)) b!953210))

(assert (= (and b!953210 c!99780) b!953207))

(assert (= (and b!953210 (not c!99780)) b!953211))

(declare-fun m!885295 () Bool)

(assert (=> d!115617 m!885295))

(declare-fun m!885297 () Bool)

(assert (=> d!115617 m!885297))

(assert (=> d!115617 m!885297))

(declare-fun m!885299 () Bool)

(assert (=> d!115617 m!885299))

(assert (=> d!115617 m!885209))

(declare-fun m!885301 () Bool)

(assert (=> b!953209 m!885301))

(declare-fun m!885303 () Bool)

(assert (=> b!953211 m!885303))

(assert (=> b!953046 d!115617))

(declare-fun d!115619 () Bool)

(assert (=> d!115619 (= (array_inv!21516 (_keys!10796 thiss!1141)) (bvsge (size!28206 (_keys!10796 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953048 d!115619))

(declare-fun d!115621 () Bool)

(assert (=> d!115621 (= (array_inv!21517 (_values!5860 thiss!1141)) (bvsge (size!28205 (_values!5860 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953048 d!115621))

(declare-fun b!953219 () Bool)

(declare-fun e!536887 () Bool)

(assert (=> b!953219 (= e!536887 tp_is_empty!20817)))

(declare-fun condMapEmpty!33175 () Bool)

(declare-fun mapDefault!33175 () ValueCell!9927)

(assert (=> mapNonEmpty!33169 (= condMapEmpty!33175 (= mapRest!33169 ((as const (Array (_ BitVec 32) ValueCell!9927)) mapDefault!33175)))))

(declare-fun e!536888 () Bool)

(declare-fun mapRes!33175 () Bool)

(assert (=> mapNonEmpty!33169 (= tp!63555 (and e!536888 mapRes!33175))))

(declare-fun b!953220 () Bool)

(assert (=> b!953220 (= e!536888 tp_is_empty!20817)))

(declare-fun mapNonEmpty!33175 () Bool)

(declare-fun tp!63564 () Bool)

(assert (=> mapNonEmpty!33175 (= mapRes!33175 (and tp!63564 e!536887))))

(declare-fun mapValue!33175 () ValueCell!9927)

(declare-fun mapKey!33175 () (_ BitVec 32))

(declare-fun mapRest!33175 () (Array (_ BitVec 32) ValueCell!9927))

(assert (=> mapNonEmpty!33175 (= mapRest!33169 (store mapRest!33175 mapKey!33175 mapValue!33175))))

(declare-fun mapIsEmpty!33175 () Bool)

(assert (=> mapIsEmpty!33175 mapRes!33175))

(assert (= (and mapNonEmpty!33169 condMapEmpty!33175) mapIsEmpty!33175))

(assert (= (and mapNonEmpty!33169 (not condMapEmpty!33175)) mapNonEmpty!33175))

(assert (= (and mapNonEmpty!33175 ((_ is ValueCellFull!9927) mapValue!33175)) b!953219))

(assert (= (and mapNonEmpty!33169 ((_ is ValueCellFull!9927) mapDefault!33175)) b!953220))

(declare-fun m!885305 () Bool)

(assert (=> mapNonEmpty!33175 m!885305))

(declare-fun b_lambda!14425 () Bool)

(assert (= b_lambda!14423 (or (and b!953048 b_free!18309) b_lambda!14425)))

(check-sat (not b!953117) (not bm!41641) (not bm!41640) (not bm!41624) (not b_next!18309) (not b!953188) b_and!29797 (not b!953110) (not b!953173) (not d!115603) (not b_lambda!14425) (not bm!41645) (not b!953105) (not d!115617) (not b!953127) (not b!953174) (not b!953179) (not bm!41643) (not b!953126) (not d!115599) (not b!953124) (not b!953096) (not d!115611) (not b!953085) (not b!953190) (not mapNonEmpty!33175) (not d!115605) (not d!115595) (not d!115613) tp_is_empty!20817 (not b!953180) (not b!953086) (not b!953181) (not d!115609) (not b!953211) (not b!953183) (not b!953129) (not b!953099) (not d!115615) (not b!953087))
(check-sat b_and!29797 (not b_next!18309))
