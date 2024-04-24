; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81032 () Bool)

(assert start!81032)

(declare-fun b!948550 () Bool)

(declare-fun b_free!18181 () Bool)

(declare-fun b_next!18181 () Bool)

(assert (=> b!948550 (= b_free!18181 (not b_next!18181))))

(declare-fun tp!63108 () Bool)

(declare-fun b_and!29613 () Bool)

(assert (=> b!948550 (= tp!63108 b_and!29613)))

(declare-fun b!948544 () Bool)

(declare-fun e!533975 () Bool)

(declare-datatypes ((V!32551 0))(
  ( (V!32552 (val!10395 Int)) )
))
(declare-datatypes ((ValueCell!9863 0))(
  ( (ValueCellFull!9863 (v!12926 V!32551)) (EmptyCell!9863) )
))
(declare-datatypes ((array!57429 0))(
  ( (array!57430 (arr!27619 (Array (_ BitVec 32) ValueCell!9863)) (size!28093 (_ BitVec 32))) )
))
(declare-datatypes ((array!57431 0))(
  ( (array!57432 (arr!27620 (Array (_ BitVec 32) (_ BitVec 64))) (size!28094 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4876 0))(
  ( (LongMapFixedSize!4877 (defaultEntry!5735 Int) (mask!27523 (_ BitVec 32)) (extraKeys!5467 (_ BitVec 32)) (zeroValue!5571 V!32551) (minValue!5571 V!32551) (_size!2493 (_ BitVec 32)) (_keys!10676 array!57431) (_values!5758 array!57429) (_vacant!2493 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4876)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13490 0))(
  ( (tuple2!13491 (_1!6756 (_ BitVec 64)) (_2!6756 V!32551)) )
))
(declare-datatypes ((List!19294 0))(
  ( (Nil!19291) (Cons!19290 (h!20452 tuple2!13490) (t!27607 List!19294)) )
))
(declare-datatypes ((ListLongMap!12189 0))(
  ( (ListLongMap!12190 (toList!6110 List!19294)) )
))
(declare-fun contains!5203 (ListLongMap!12189 (_ BitVec 64)) Bool)

(declare-fun map!13050 (LongMapFixedSize!4876) ListLongMap!12189)

(assert (=> b!948544 (= e!533975 (not (contains!5203 (map!13050 thiss!1141) key!756)))))

(declare-datatypes ((SeekEntryResult!9081 0))(
  ( (MissingZero!9081 (index!38695 (_ BitVec 32))) (Found!9081 (index!38696 (_ BitVec 32))) (Intermediate!9081 (undefined!9893 Bool) (index!38697 (_ BitVec 32)) (x!81511 (_ BitVec 32))) (Undefined!9081) (MissingVacant!9081 (index!38698 (_ BitVec 32))) )
))
(declare-fun lt!426993 () SeekEntryResult!9081)

(declare-fun getCurrentListMap!3343 (array!57431 array!57429 (_ BitVec 32) (_ BitVec 32) V!32551 V!32551 (_ BitVec 32) Int) ListLongMap!12189)

(assert (=> b!948544 (contains!5203 (getCurrentListMap!3343 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)) (select (arr!27620 (_keys!10676 thiss!1141)) (index!38696 lt!426993)))))

(declare-datatypes ((Unit!31913 0))(
  ( (Unit!31914) )
))
(declare-fun lt!426994 () Unit!31913)

(declare-fun lemmaValidKeyInArrayIsInListMap!270 (array!57431 array!57429 (_ BitVec 32) (_ BitVec 32) V!32551 V!32551 (_ BitVec 32) Int) Unit!31913)

(assert (=> b!948544 (= lt!426994 (lemmaValidKeyInArrayIsInListMap!270 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) (index!38696 lt!426993) (defaultEntry!5735 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!948544 (arrayContainsKey!0 (_keys!10676 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426992 () Unit!31913)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57431 (_ BitVec 64) (_ BitVec 32)) Unit!31913)

(assert (=> b!948544 (= lt!426992 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10676 thiss!1141) key!756 (index!38696 lt!426993)))))

(declare-fun b!948545 () Bool)

(declare-fun e!533976 () Bool)

(assert (=> b!948545 (= e!533976 e!533975)))

(declare-fun res!636302 () Bool)

(assert (=> b!948545 (=> (not res!636302) (not e!533975))))

(get-info :version)

(assert (=> b!948545 (= res!636302 ((_ is Found!9081) lt!426993))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57431 (_ BitVec 32)) SeekEntryResult!9081)

(assert (=> b!948545 (= lt!426993 (seekEntry!0 key!756 (_keys!10676 thiss!1141) (mask!27523 thiss!1141)))))

(declare-fun mapNonEmpty!32914 () Bool)

(declare-fun mapRes!32914 () Bool)

(declare-fun tp!63109 () Bool)

(declare-fun e!533979 () Bool)

(assert (=> mapNonEmpty!32914 (= mapRes!32914 (and tp!63109 e!533979))))

(declare-fun mapKey!32914 () (_ BitVec 32))

(declare-fun mapValue!32914 () ValueCell!9863)

(declare-fun mapRest!32914 () (Array (_ BitVec 32) ValueCell!9863))

(assert (=> mapNonEmpty!32914 (= (arr!27619 (_values!5758 thiss!1141)) (store mapRest!32914 mapKey!32914 mapValue!32914))))

(declare-fun b!948546 () Bool)

(declare-fun e!533978 () Bool)

(declare-fun e!533977 () Bool)

(assert (=> b!948546 (= e!533978 (and e!533977 mapRes!32914))))

(declare-fun condMapEmpty!32914 () Bool)

(declare-fun mapDefault!32914 () ValueCell!9863)

(assert (=> b!948546 (= condMapEmpty!32914 (= (arr!27619 (_values!5758 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9863)) mapDefault!32914)))))

(declare-fun res!636301 () Bool)

(assert (=> start!81032 (=> (not res!636301) (not e!533976))))

(declare-fun valid!1869 (LongMapFixedSize!4876) Bool)

(assert (=> start!81032 (= res!636301 (valid!1869 thiss!1141))))

(assert (=> start!81032 e!533976))

(declare-fun e!533980 () Bool)

(assert (=> start!81032 e!533980))

(assert (=> start!81032 true))

(declare-fun b!948547 () Bool)

(declare-fun res!636303 () Bool)

(assert (=> b!948547 (=> (not res!636303) (not e!533976))))

(assert (=> b!948547 (= res!636303 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32914 () Bool)

(assert (=> mapIsEmpty!32914 mapRes!32914))

(declare-fun b!948548 () Bool)

(declare-fun tp_is_empty!20689 () Bool)

(assert (=> b!948548 (= e!533979 tp_is_empty!20689)))

(declare-fun b!948549 () Bool)

(assert (=> b!948549 (= e!533977 tp_is_empty!20689)))

(declare-fun array_inv!21530 (array!57431) Bool)

(declare-fun array_inv!21531 (array!57429) Bool)

(assert (=> b!948550 (= e!533980 (and tp!63108 tp_is_empty!20689 (array_inv!21530 (_keys!10676 thiss!1141)) (array_inv!21531 (_values!5758 thiss!1141)) e!533978))))

(assert (= (and start!81032 res!636301) b!948547))

(assert (= (and b!948547 res!636303) b!948545))

(assert (= (and b!948545 res!636302) b!948544))

(assert (= (and b!948546 condMapEmpty!32914) mapIsEmpty!32914))

(assert (= (and b!948546 (not condMapEmpty!32914)) mapNonEmpty!32914))

(assert (= (and mapNonEmpty!32914 ((_ is ValueCellFull!9863) mapValue!32914)) b!948548))

(assert (= (and b!948546 ((_ is ValueCellFull!9863) mapDefault!32914)) b!948549))

(assert (= b!948550 b!948546))

(assert (= start!81032 b!948550))

(declare-fun m!881809 () Bool)

(assert (=> b!948550 m!881809))

(declare-fun m!881811 () Bool)

(assert (=> b!948550 m!881811))

(declare-fun m!881813 () Bool)

(assert (=> b!948544 m!881813))

(declare-fun m!881815 () Bool)

(assert (=> b!948544 m!881815))

(declare-fun m!881817 () Bool)

(assert (=> b!948544 m!881817))

(declare-fun m!881819 () Bool)

(assert (=> b!948544 m!881819))

(declare-fun m!881821 () Bool)

(assert (=> b!948544 m!881821))

(declare-fun m!881823 () Bool)

(assert (=> b!948544 m!881823))

(declare-fun m!881825 () Bool)

(assert (=> b!948544 m!881825))

(assert (=> b!948544 m!881817))

(assert (=> b!948544 m!881821))

(assert (=> b!948544 m!881823))

(declare-fun m!881827 () Bool)

(assert (=> b!948544 m!881827))

(declare-fun m!881829 () Bool)

(assert (=> b!948545 m!881829))

(declare-fun m!881831 () Bool)

(assert (=> start!81032 m!881831))

(declare-fun m!881833 () Bool)

(assert (=> mapNonEmpty!32914 m!881833))

(check-sat (not b!948545) tp_is_empty!20689 (not b!948544) (not start!81032) (not b!948550) (not b_next!18181) (not mapNonEmpty!32914) b_and!29613)
(check-sat b_and!29613 (not b_next!18181))
(get-model)

(declare-fun d!115033 () Bool)

(assert (=> d!115033 (= (array_inv!21530 (_keys!10676 thiss!1141)) (bvsge (size!28094 (_keys!10676 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948550 d!115033))

(declare-fun d!115035 () Bool)

(assert (=> d!115035 (= (array_inv!21531 (_values!5758 thiss!1141)) (bvsge (size!28093 (_values!5758 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948550 d!115035))

(declare-fun b!948605 () Bool)

(declare-fun e!534031 () SeekEntryResult!9081)

(declare-fun lt!427024 () SeekEntryResult!9081)

(assert (=> b!948605 (= e!534031 (MissingZero!9081 (index!38697 lt!427024)))))

(declare-fun b!948606 () Bool)

(declare-fun e!534032 () SeekEntryResult!9081)

(declare-fun e!534030 () SeekEntryResult!9081)

(assert (=> b!948606 (= e!534032 e!534030)))

(declare-fun lt!427023 () (_ BitVec 64))

(assert (=> b!948606 (= lt!427023 (select (arr!27620 (_keys!10676 thiss!1141)) (index!38697 lt!427024)))))

(declare-fun c!99008 () Bool)

(assert (=> b!948606 (= c!99008 (= lt!427023 key!756))))

(declare-fun b!948607 () Bool)

(assert (=> b!948607 (= e!534032 Undefined!9081)))

(declare-fun b!948608 () Bool)

(assert (=> b!948608 (= e!534030 (Found!9081 (index!38697 lt!427024)))))

(declare-fun d!115037 () Bool)

(declare-fun lt!427022 () SeekEntryResult!9081)

(assert (=> d!115037 (and (or ((_ is MissingVacant!9081) lt!427022) (not ((_ is Found!9081) lt!427022)) (and (bvsge (index!38696 lt!427022) #b00000000000000000000000000000000) (bvslt (index!38696 lt!427022) (size!28094 (_keys!10676 thiss!1141))))) (not ((_ is MissingVacant!9081) lt!427022)) (or (not ((_ is Found!9081) lt!427022)) (= (select (arr!27620 (_keys!10676 thiss!1141)) (index!38696 lt!427022)) key!756)))))

(assert (=> d!115037 (= lt!427022 e!534032)))

(declare-fun c!99006 () Bool)

(assert (=> d!115037 (= c!99006 (and ((_ is Intermediate!9081) lt!427024) (undefined!9893 lt!427024)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57431 (_ BitVec 32)) SeekEntryResult!9081)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115037 (= lt!427024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27523 thiss!1141)) key!756 (_keys!10676 thiss!1141) (mask!27523 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!115037 (validMask!0 (mask!27523 thiss!1141))))

(assert (=> d!115037 (= (seekEntry!0 key!756 (_keys!10676 thiss!1141) (mask!27523 thiss!1141)) lt!427022)))

(declare-fun b!948609 () Bool)

(declare-fun lt!427021 () SeekEntryResult!9081)

(assert (=> b!948609 (= e!534031 (ite ((_ is MissingVacant!9081) lt!427021) (MissingZero!9081 (index!38698 lt!427021)) lt!427021))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57431 (_ BitVec 32)) SeekEntryResult!9081)

(assert (=> b!948609 (= lt!427021 (seekKeyOrZeroReturnVacant!0 (x!81511 lt!427024) (index!38697 lt!427024) (index!38697 lt!427024) key!756 (_keys!10676 thiss!1141) (mask!27523 thiss!1141)))))

(declare-fun b!948610 () Bool)

(declare-fun c!99007 () Bool)

(assert (=> b!948610 (= c!99007 (= lt!427023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948610 (= e!534030 e!534031)))

(assert (= (and d!115037 c!99006) b!948607))

(assert (= (and d!115037 (not c!99006)) b!948606))

(assert (= (and b!948606 c!99008) b!948608))

(assert (= (and b!948606 (not c!99008)) b!948610))

(assert (= (and b!948610 c!99007) b!948605))

(assert (= (and b!948610 (not c!99007)) b!948609))

(declare-fun m!881887 () Bool)

(assert (=> b!948606 m!881887))

(declare-fun m!881889 () Bool)

(assert (=> d!115037 m!881889))

(declare-fun m!881891 () Bool)

(assert (=> d!115037 m!881891))

(assert (=> d!115037 m!881891))

(declare-fun m!881893 () Bool)

(assert (=> d!115037 m!881893))

(declare-fun m!881895 () Bool)

(assert (=> d!115037 m!881895))

(declare-fun m!881897 () Bool)

(assert (=> b!948609 m!881897))

(assert (=> b!948545 d!115037))

(declare-fun d!115039 () Bool)

(declare-fun res!636328 () Bool)

(declare-fun e!534035 () Bool)

(assert (=> d!115039 (=> (not res!636328) (not e!534035))))

(declare-fun simpleValid!365 (LongMapFixedSize!4876) Bool)

(assert (=> d!115039 (= res!636328 (simpleValid!365 thiss!1141))))

(assert (=> d!115039 (= (valid!1869 thiss!1141) e!534035)))

(declare-fun b!948617 () Bool)

(declare-fun res!636329 () Bool)

(assert (=> b!948617 (=> (not res!636329) (not e!534035))))

(declare-fun arrayCountValidKeys!0 (array!57431 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948617 (= res!636329 (= (arrayCountValidKeys!0 (_keys!10676 thiss!1141) #b00000000000000000000000000000000 (size!28094 (_keys!10676 thiss!1141))) (_size!2493 thiss!1141)))))

(declare-fun b!948618 () Bool)

(declare-fun res!636330 () Bool)

(assert (=> b!948618 (=> (not res!636330) (not e!534035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57431 (_ BitVec 32)) Bool)

(assert (=> b!948618 (= res!636330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10676 thiss!1141) (mask!27523 thiss!1141)))))

(declare-fun b!948619 () Bool)

(declare-datatypes ((List!19297 0))(
  ( (Nil!19294) (Cons!19293 (h!20455 (_ BitVec 64)) (t!27612 List!19297)) )
))
(declare-fun arrayNoDuplicates!0 (array!57431 (_ BitVec 32) List!19297) Bool)

(assert (=> b!948619 (= e!534035 (arrayNoDuplicates!0 (_keys!10676 thiss!1141) #b00000000000000000000000000000000 Nil!19294))))

(assert (= (and d!115039 res!636328) b!948617))

(assert (= (and b!948617 res!636329) b!948618))

(assert (= (and b!948618 res!636330) b!948619))

(declare-fun m!881899 () Bool)

(assert (=> d!115039 m!881899))

(declare-fun m!881901 () Bool)

(assert (=> b!948617 m!881901))

(declare-fun m!881903 () Bool)

(assert (=> b!948618 m!881903))

(declare-fun m!881905 () Bool)

(assert (=> b!948619 m!881905))

(assert (=> start!81032 d!115039))

(declare-fun d!115041 () Bool)

(assert (=> d!115041 (arrayContainsKey!0 (_keys!10676 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!427027 () Unit!31913)

(declare-fun choose!13 (array!57431 (_ BitVec 64) (_ BitVec 32)) Unit!31913)

(assert (=> d!115041 (= lt!427027 (choose!13 (_keys!10676 thiss!1141) key!756 (index!38696 lt!426993)))))

(assert (=> d!115041 (bvsge (index!38696 lt!426993) #b00000000000000000000000000000000)))

(assert (=> d!115041 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10676 thiss!1141) key!756 (index!38696 lt!426993)) lt!427027)))

(declare-fun bs!26649 () Bool)

(assert (= bs!26649 d!115041))

(assert (=> bs!26649 m!881825))

(declare-fun m!881907 () Bool)

(assert (=> bs!26649 m!881907))

(assert (=> b!948544 d!115041))

(declare-fun d!115043 () Bool)

(assert (=> d!115043 (= (map!13050 thiss!1141) (getCurrentListMap!3343 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)))))

(declare-fun bs!26650 () Bool)

(assert (= bs!26650 d!115043))

(assert (=> bs!26650 m!881821))

(assert (=> b!948544 d!115043))

(declare-fun d!115045 () Bool)

(declare-fun res!636335 () Bool)

(declare-fun e!534040 () Bool)

(assert (=> d!115045 (=> res!636335 e!534040)))

(assert (=> d!115045 (= res!636335 (= (select (arr!27620 (_keys!10676 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115045 (= (arrayContainsKey!0 (_keys!10676 thiss!1141) key!756 #b00000000000000000000000000000000) e!534040)))

(declare-fun b!948624 () Bool)

(declare-fun e!534041 () Bool)

(assert (=> b!948624 (= e!534040 e!534041)))

(declare-fun res!636336 () Bool)

(assert (=> b!948624 (=> (not res!636336) (not e!534041))))

(assert (=> b!948624 (= res!636336 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28094 (_keys!10676 thiss!1141))))))

(declare-fun b!948625 () Bool)

(assert (=> b!948625 (= e!534041 (arrayContainsKey!0 (_keys!10676 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115045 (not res!636335)) b!948624))

(assert (= (and b!948624 res!636336) b!948625))

(declare-fun m!881909 () Bool)

(assert (=> d!115045 m!881909))

(declare-fun m!881911 () Bool)

(assert (=> b!948625 m!881911))

(assert (=> b!948544 d!115045))

(declare-fun d!115047 () Bool)

(declare-fun e!534047 () Bool)

(assert (=> d!115047 e!534047))

(declare-fun res!636339 () Bool)

(assert (=> d!115047 (=> res!636339 e!534047)))

(declare-fun lt!427036 () Bool)

(assert (=> d!115047 (= res!636339 (not lt!427036))))

(declare-fun lt!427038 () Bool)

(assert (=> d!115047 (= lt!427036 lt!427038)))

(declare-fun lt!427037 () Unit!31913)

(declare-fun e!534046 () Unit!31913)

(assert (=> d!115047 (= lt!427037 e!534046)))

(declare-fun c!99011 () Bool)

(assert (=> d!115047 (= c!99011 lt!427038)))

(declare-fun containsKey!457 (List!19294 (_ BitVec 64)) Bool)

(assert (=> d!115047 (= lt!427038 (containsKey!457 (toList!6110 (map!13050 thiss!1141)) key!756))))

(assert (=> d!115047 (= (contains!5203 (map!13050 thiss!1141) key!756) lt!427036)))

(declare-fun b!948632 () Bool)

(declare-fun lt!427039 () Unit!31913)

(assert (=> b!948632 (= e!534046 lt!427039)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!351 (List!19294 (_ BitVec 64)) Unit!31913)

(assert (=> b!948632 (= lt!427039 (lemmaContainsKeyImpliesGetValueByKeyDefined!351 (toList!6110 (map!13050 thiss!1141)) key!756))))

(declare-datatypes ((Option!492 0))(
  ( (Some!491 (v!12929 V!32551)) (None!490) )
))
(declare-fun isDefined!359 (Option!492) Bool)

(declare-fun getValueByKey!486 (List!19294 (_ BitVec 64)) Option!492)

(assert (=> b!948632 (isDefined!359 (getValueByKey!486 (toList!6110 (map!13050 thiss!1141)) key!756))))

(declare-fun b!948633 () Bool)

(declare-fun Unit!31919 () Unit!31913)

(assert (=> b!948633 (= e!534046 Unit!31919)))

(declare-fun b!948634 () Bool)

(assert (=> b!948634 (= e!534047 (isDefined!359 (getValueByKey!486 (toList!6110 (map!13050 thiss!1141)) key!756)))))

(assert (= (and d!115047 c!99011) b!948632))

(assert (= (and d!115047 (not c!99011)) b!948633))

(assert (= (and d!115047 (not res!636339)) b!948634))

(declare-fun m!881913 () Bool)

(assert (=> d!115047 m!881913))

(declare-fun m!881915 () Bool)

(assert (=> b!948632 m!881915))

(declare-fun m!881917 () Bool)

(assert (=> b!948632 m!881917))

(assert (=> b!948632 m!881917))

(declare-fun m!881919 () Bool)

(assert (=> b!948632 m!881919))

(assert (=> b!948634 m!881917))

(assert (=> b!948634 m!881917))

(assert (=> b!948634 m!881919))

(assert (=> b!948544 d!115047))

(declare-fun d!115049 () Bool)

(declare-fun e!534049 () Bool)

(assert (=> d!115049 e!534049))

(declare-fun res!636340 () Bool)

(assert (=> d!115049 (=> res!636340 e!534049)))

(declare-fun lt!427040 () Bool)

(assert (=> d!115049 (= res!636340 (not lt!427040))))

(declare-fun lt!427042 () Bool)

(assert (=> d!115049 (= lt!427040 lt!427042)))

(declare-fun lt!427041 () Unit!31913)

(declare-fun e!534048 () Unit!31913)

(assert (=> d!115049 (= lt!427041 e!534048)))

(declare-fun c!99012 () Bool)

(assert (=> d!115049 (= c!99012 lt!427042)))

(assert (=> d!115049 (= lt!427042 (containsKey!457 (toList!6110 (getCurrentListMap!3343 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141))) (select (arr!27620 (_keys!10676 thiss!1141)) (index!38696 lt!426993))))))

(assert (=> d!115049 (= (contains!5203 (getCurrentListMap!3343 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)) (select (arr!27620 (_keys!10676 thiss!1141)) (index!38696 lt!426993))) lt!427040)))

(declare-fun b!948635 () Bool)

(declare-fun lt!427043 () Unit!31913)

(assert (=> b!948635 (= e!534048 lt!427043)))

(assert (=> b!948635 (= lt!427043 (lemmaContainsKeyImpliesGetValueByKeyDefined!351 (toList!6110 (getCurrentListMap!3343 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141))) (select (arr!27620 (_keys!10676 thiss!1141)) (index!38696 lt!426993))))))

(assert (=> b!948635 (isDefined!359 (getValueByKey!486 (toList!6110 (getCurrentListMap!3343 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141))) (select (arr!27620 (_keys!10676 thiss!1141)) (index!38696 lt!426993))))))

(declare-fun b!948636 () Bool)

(declare-fun Unit!31920 () Unit!31913)

(assert (=> b!948636 (= e!534048 Unit!31920)))

(declare-fun b!948637 () Bool)

(assert (=> b!948637 (= e!534049 (isDefined!359 (getValueByKey!486 (toList!6110 (getCurrentListMap!3343 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141))) (select (arr!27620 (_keys!10676 thiss!1141)) (index!38696 lt!426993)))))))

(assert (= (and d!115049 c!99012) b!948635))

(assert (= (and d!115049 (not c!99012)) b!948636))

(assert (= (and d!115049 (not res!636340)) b!948637))

(assert (=> d!115049 m!881823))

(declare-fun m!881921 () Bool)

(assert (=> d!115049 m!881921))

(assert (=> b!948635 m!881823))

(declare-fun m!881923 () Bool)

(assert (=> b!948635 m!881923))

(assert (=> b!948635 m!881823))

(declare-fun m!881925 () Bool)

(assert (=> b!948635 m!881925))

(assert (=> b!948635 m!881925))

(declare-fun m!881927 () Bool)

(assert (=> b!948635 m!881927))

(assert (=> b!948637 m!881823))

(assert (=> b!948637 m!881925))

(assert (=> b!948637 m!881925))

(assert (=> b!948637 m!881927))

(assert (=> b!948544 d!115049))

(declare-fun b!948680 () Bool)

(declare-fun e!534079 () ListLongMap!12189)

(declare-fun call!41188 () ListLongMap!12189)

(declare-fun +!2864 (ListLongMap!12189 tuple2!13490) ListLongMap!12189)

(assert (=> b!948680 (= e!534079 (+!2864 call!41188 (tuple2!13491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5571 thiss!1141))))))

(declare-fun bm!41181 () Bool)

(declare-fun call!41186 () Bool)

(declare-fun lt!427103 () ListLongMap!12189)

(assert (=> bm!41181 (= call!41186 (contains!5203 lt!427103 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!115051 () Bool)

(declare-fun e!534083 () Bool)

(assert (=> d!115051 e!534083))

(declare-fun res!636364 () Bool)

(assert (=> d!115051 (=> (not res!636364) (not e!534083))))

(assert (=> d!115051 (= res!636364 (or (bvsge #b00000000000000000000000000000000 (size!28094 (_keys!10676 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28094 (_keys!10676 thiss!1141))))))))

(declare-fun lt!427095 () ListLongMap!12189)

(assert (=> d!115051 (= lt!427103 lt!427095)))

(declare-fun lt!427105 () Unit!31913)

(declare-fun e!534086 () Unit!31913)

(assert (=> d!115051 (= lt!427105 e!534086)))

(declare-fun c!99025 () Bool)

(declare-fun e!534085 () Bool)

(assert (=> d!115051 (= c!99025 e!534085)))

(declare-fun res!636362 () Bool)

(assert (=> d!115051 (=> (not res!636362) (not e!534085))))

(assert (=> d!115051 (= res!636362 (bvslt #b00000000000000000000000000000000 (size!28094 (_keys!10676 thiss!1141))))))

(assert (=> d!115051 (= lt!427095 e!534079)))

(declare-fun c!99030 () Bool)

(assert (=> d!115051 (= c!99030 (and (not (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115051 (validMask!0 (mask!27523 thiss!1141))))

(assert (=> d!115051 (= (getCurrentListMap!3343 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)) lt!427103)))

(declare-fun b!948681 () Bool)

(declare-fun e!534082 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!948681 (= e!534082 (validKeyInArray!0 (select (arr!27620 (_keys!10676 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948682 () Bool)

(assert (=> b!948682 (= e!534085 (validKeyInArray!0 (select (arr!27620 (_keys!10676 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948683 () Bool)

(declare-fun e!534084 () ListLongMap!12189)

(declare-fun call!41189 () ListLongMap!12189)

(assert (=> b!948683 (= e!534084 call!41189)))

(declare-fun b!948684 () Bool)

(declare-fun res!636360 () Bool)

(assert (=> b!948684 (=> (not res!636360) (not e!534083))))

(declare-fun e!534076 () Bool)

(assert (=> b!948684 (= res!636360 e!534076)))

(declare-fun res!636361 () Bool)

(assert (=> b!948684 (=> res!636361 e!534076)))

(assert (=> b!948684 (= res!636361 (not e!534082))))

(declare-fun res!636359 () Bool)

(assert (=> b!948684 (=> (not res!636359) (not e!534082))))

(assert (=> b!948684 (= res!636359 (bvslt #b00000000000000000000000000000000 (size!28094 (_keys!10676 thiss!1141))))))

(declare-fun call!41187 () ListLongMap!12189)

(declare-fun call!41184 () ListLongMap!12189)

(declare-fun c!99026 () Bool)

(declare-fun bm!41182 () Bool)

(declare-fun call!41190 () ListLongMap!12189)

(assert (=> bm!41182 (= call!41188 (+!2864 (ite c!99030 call!41190 (ite c!99026 call!41184 call!41187)) (ite (or c!99030 c!99026) (tuple2!13491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5571 thiss!1141)) (tuple2!13491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5571 thiss!1141)))))))

(declare-fun b!948685 () Bool)

(declare-fun c!99029 () Bool)

(assert (=> b!948685 (= c!99029 (and (not (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!534078 () ListLongMap!12189)

(assert (=> b!948685 (= e!534084 e!534078)))

(declare-fun b!948686 () Bool)

(declare-fun res!636366 () Bool)

(assert (=> b!948686 (=> (not res!636366) (not e!534083))))

(declare-fun e!534088 () Bool)

(assert (=> b!948686 (= res!636366 e!534088)))

(declare-fun c!99027 () Bool)

(assert (=> b!948686 (= c!99027 (not (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!948687 () Bool)

(declare-fun e!534081 () Bool)

(assert (=> b!948687 (= e!534088 e!534081)))

(declare-fun res!636367 () Bool)

(assert (=> b!948687 (= res!636367 call!41186)))

(assert (=> b!948687 (=> (not res!636367) (not e!534081))))

(declare-fun b!948688 () Bool)

(declare-fun e!534080 () Bool)

(declare-fun e!534077 () Bool)

(assert (=> b!948688 (= e!534080 e!534077)))

(declare-fun res!636365 () Bool)

(declare-fun call!41185 () Bool)

(assert (=> b!948688 (= res!636365 call!41185)))

(assert (=> b!948688 (=> (not res!636365) (not e!534077))))

(declare-fun b!948689 () Bool)

(declare-fun apply!878 (ListLongMap!12189 (_ BitVec 64)) V!32551)

(assert (=> b!948689 (= e!534081 (= (apply!878 lt!427103 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5571 thiss!1141)))))

(declare-fun b!948690 () Bool)

(assert (=> b!948690 (= e!534077 (= (apply!878 lt!427103 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5571 thiss!1141)))))

(declare-fun b!948691 () Bool)

(declare-fun e!534087 () Bool)

(declare-fun get!14517 (ValueCell!9863 V!32551) V!32551)

(declare-fun dynLambda!1661 (Int (_ BitVec 64)) V!32551)

(assert (=> b!948691 (= e!534087 (= (apply!878 lt!427103 (select (arr!27620 (_keys!10676 thiss!1141)) #b00000000000000000000000000000000)) (get!14517 (select (arr!27619 (_values!5758 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1661 (defaultEntry!5735 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!948691 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28093 (_values!5758 thiss!1141))))))

(assert (=> b!948691 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28094 (_keys!10676 thiss!1141))))))

(declare-fun b!948692 () Bool)

(assert (=> b!948692 (= e!534076 e!534087)))

(declare-fun res!636363 () Bool)

(assert (=> b!948692 (=> (not res!636363) (not e!534087))))

(assert (=> b!948692 (= res!636363 (contains!5203 lt!427103 (select (arr!27620 (_keys!10676 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948692 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28094 (_keys!10676 thiss!1141))))))

(declare-fun b!948693 () Bool)

(assert (=> b!948693 (= e!534078 call!41189)))

(declare-fun bm!41183 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3352 (array!57431 array!57429 (_ BitVec 32) (_ BitVec 32) V!32551 V!32551 (_ BitVec 32) Int) ListLongMap!12189)

(assert (=> bm!41183 (= call!41190 (getCurrentListMapNoExtraKeys!3352 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)))))

(declare-fun b!948694 () Bool)

(declare-fun Unit!31921 () Unit!31913)

(assert (=> b!948694 (= e!534086 Unit!31921)))

(declare-fun b!948695 () Bool)

(assert (=> b!948695 (= e!534079 e!534084)))

(assert (=> b!948695 (= c!99026 (and (not (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41184 () Bool)

(assert (=> bm!41184 (= call!41184 call!41190)))

(declare-fun b!948696 () Bool)

(assert (=> b!948696 (= e!534078 call!41187)))

(declare-fun bm!41185 () Bool)

(assert (=> bm!41185 (= call!41185 (contains!5203 lt!427103 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948697 () Bool)

(assert (=> b!948697 (= e!534083 e!534080)))

(declare-fun c!99028 () Bool)

(assert (=> b!948697 (= c!99028 (not (= (bvand (extraKeys!5467 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!948698 () Bool)

(declare-fun lt!427098 () Unit!31913)

(assert (=> b!948698 (= e!534086 lt!427098)))

(declare-fun lt!427107 () ListLongMap!12189)

(assert (=> b!948698 (= lt!427107 (getCurrentListMapNoExtraKeys!3352 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)))))

(declare-fun lt!427096 () (_ BitVec 64))

(assert (=> b!948698 (= lt!427096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427100 () (_ BitVec 64))

(assert (=> b!948698 (= lt!427100 (select (arr!27620 (_keys!10676 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427094 () Unit!31913)

(declare-fun addStillContains!567 (ListLongMap!12189 (_ BitVec 64) V!32551 (_ BitVec 64)) Unit!31913)

(assert (=> b!948698 (= lt!427094 (addStillContains!567 lt!427107 lt!427096 (zeroValue!5571 thiss!1141) lt!427100))))

(assert (=> b!948698 (contains!5203 (+!2864 lt!427107 (tuple2!13491 lt!427096 (zeroValue!5571 thiss!1141))) lt!427100)))

(declare-fun lt!427097 () Unit!31913)

(assert (=> b!948698 (= lt!427097 lt!427094)))

(declare-fun lt!427104 () ListLongMap!12189)

(assert (=> b!948698 (= lt!427104 (getCurrentListMapNoExtraKeys!3352 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)))))

(declare-fun lt!427093 () (_ BitVec 64))

(assert (=> b!948698 (= lt!427093 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427091 () (_ BitVec 64))

(assert (=> b!948698 (= lt!427091 (select (arr!27620 (_keys!10676 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427088 () Unit!31913)

(declare-fun addApplyDifferent!448 (ListLongMap!12189 (_ BitVec 64) V!32551 (_ BitVec 64)) Unit!31913)

(assert (=> b!948698 (= lt!427088 (addApplyDifferent!448 lt!427104 lt!427093 (minValue!5571 thiss!1141) lt!427091))))

(assert (=> b!948698 (= (apply!878 (+!2864 lt!427104 (tuple2!13491 lt!427093 (minValue!5571 thiss!1141))) lt!427091) (apply!878 lt!427104 lt!427091))))

(declare-fun lt!427109 () Unit!31913)

(assert (=> b!948698 (= lt!427109 lt!427088)))

(declare-fun lt!427101 () ListLongMap!12189)

(assert (=> b!948698 (= lt!427101 (getCurrentListMapNoExtraKeys!3352 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)))))

(declare-fun lt!427106 () (_ BitVec 64))

(assert (=> b!948698 (= lt!427106 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427099 () (_ BitVec 64))

(assert (=> b!948698 (= lt!427099 (select (arr!27620 (_keys!10676 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427089 () Unit!31913)

(assert (=> b!948698 (= lt!427089 (addApplyDifferent!448 lt!427101 lt!427106 (zeroValue!5571 thiss!1141) lt!427099))))

(assert (=> b!948698 (= (apply!878 (+!2864 lt!427101 (tuple2!13491 lt!427106 (zeroValue!5571 thiss!1141))) lt!427099) (apply!878 lt!427101 lt!427099))))

(declare-fun lt!427102 () Unit!31913)

(assert (=> b!948698 (= lt!427102 lt!427089)))

(declare-fun lt!427092 () ListLongMap!12189)

(assert (=> b!948698 (= lt!427092 (getCurrentListMapNoExtraKeys!3352 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)))))

(declare-fun lt!427108 () (_ BitVec 64))

(assert (=> b!948698 (= lt!427108 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427090 () (_ BitVec 64))

(assert (=> b!948698 (= lt!427090 (select (arr!27620 (_keys!10676 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948698 (= lt!427098 (addApplyDifferent!448 lt!427092 lt!427108 (minValue!5571 thiss!1141) lt!427090))))

(assert (=> b!948698 (= (apply!878 (+!2864 lt!427092 (tuple2!13491 lt!427108 (minValue!5571 thiss!1141))) lt!427090) (apply!878 lt!427092 lt!427090))))

(declare-fun b!948699 () Bool)

(assert (=> b!948699 (= e!534080 (not call!41185))))

(declare-fun b!948700 () Bool)

(assert (=> b!948700 (= e!534088 (not call!41186))))

(declare-fun bm!41186 () Bool)

(assert (=> bm!41186 (= call!41187 call!41184)))

(declare-fun bm!41187 () Bool)

(assert (=> bm!41187 (= call!41189 call!41188)))

(assert (= (and d!115051 c!99030) b!948680))

(assert (= (and d!115051 (not c!99030)) b!948695))

(assert (= (and b!948695 c!99026) b!948683))

(assert (= (and b!948695 (not c!99026)) b!948685))

(assert (= (and b!948685 c!99029) b!948693))

(assert (= (and b!948685 (not c!99029)) b!948696))

(assert (= (or b!948693 b!948696) bm!41186))

(assert (= (or b!948683 bm!41186) bm!41184))

(assert (= (or b!948683 b!948693) bm!41187))

(assert (= (or b!948680 bm!41184) bm!41183))

(assert (= (or b!948680 bm!41187) bm!41182))

(assert (= (and d!115051 res!636362) b!948682))

(assert (= (and d!115051 c!99025) b!948698))

(assert (= (and d!115051 (not c!99025)) b!948694))

(assert (= (and d!115051 res!636364) b!948684))

(assert (= (and b!948684 res!636359) b!948681))

(assert (= (and b!948684 (not res!636361)) b!948692))

(assert (= (and b!948692 res!636363) b!948691))

(assert (= (and b!948684 res!636360) b!948686))

(assert (= (and b!948686 c!99027) b!948687))

(assert (= (and b!948686 (not c!99027)) b!948700))

(assert (= (and b!948687 res!636367) b!948689))

(assert (= (or b!948687 b!948700) bm!41181))

(assert (= (and b!948686 res!636366) b!948697))

(assert (= (and b!948697 c!99028) b!948688))

(assert (= (and b!948697 (not c!99028)) b!948699))

(assert (= (and b!948688 res!636365) b!948690))

(assert (= (or b!948688 b!948699) bm!41185))

(declare-fun b_lambda!14313 () Bool)

(assert (=> (not b_lambda!14313) (not b!948691)))

(declare-fun t!27611 () Bool)

(declare-fun tb!6165 () Bool)

(assert (=> (and b!948550 (= (defaultEntry!5735 thiss!1141) (defaultEntry!5735 thiss!1141)) t!27611) tb!6165))

(declare-fun result!12233 () Bool)

(assert (=> tb!6165 (= result!12233 tp_is_empty!20689)))

(assert (=> b!948691 t!27611))

(declare-fun b_and!29619 () Bool)

(assert (= b_and!29613 (and (=> t!27611 result!12233) b_and!29619)))

(declare-fun m!881929 () Bool)

(assert (=> b!948689 m!881929))

(declare-fun m!881931 () Bool)

(assert (=> b!948680 m!881931))

(declare-fun m!881933 () Bool)

(assert (=> b!948691 m!881933))

(declare-fun m!881935 () Bool)

(assert (=> b!948691 m!881935))

(declare-fun m!881937 () Bool)

(assert (=> b!948691 m!881937))

(assert (=> b!948691 m!881933))

(assert (=> b!948691 m!881935))

(assert (=> b!948691 m!881909))

(declare-fun m!881939 () Bool)

(assert (=> b!948691 m!881939))

(assert (=> b!948691 m!881909))

(declare-fun m!881941 () Bool)

(assert (=> bm!41183 m!881941))

(declare-fun m!881943 () Bool)

(assert (=> b!948698 m!881943))

(declare-fun m!881945 () Bool)

(assert (=> b!948698 m!881945))

(assert (=> b!948698 m!881909))

(declare-fun m!881947 () Bool)

(assert (=> b!948698 m!881947))

(declare-fun m!881949 () Bool)

(assert (=> b!948698 m!881949))

(declare-fun m!881951 () Bool)

(assert (=> b!948698 m!881951))

(declare-fun m!881953 () Bool)

(assert (=> b!948698 m!881953))

(declare-fun m!881955 () Bool)

(assert (=> b!948698 m!881955))

(declare-fun m!881957 () Bool)

(assert (=> b!948698 m!881957))

(assert (=> b!948698 m!881943))

(declare-fun m!881959 () Bool)

(assert (=> b!948698 m!881959))

(declare-fun m!881961 () Bool)

(assert (=> b!948698 m!881961))

(assert (=> b!948698 m!881957))

(declare-fun m!881963 () Bool)

(assert (=> b!948698 m!881963))

(declare-fun m!881965 () Bool)

(assert (=> b!948698 m!881965))

(declare-fun m!881967 () Bool)

(assert (=> b!948698 m!881967))

(assert (=> b!948698 m!881955))

(declare-fun m!881969 () Bool)

(assert (=> b!948698 m!881969))

(assert (=> b!948698 m!881959))

(declare-fun m!881971 () Bool)

(assert (=> b!948698 m!881971))

(assert (=> b!948698 m!881941))

(assert (=> d!115051 m!881895))

(declare-fun m!881973 () Bool)

(assert (=> bm!41182 m!881973))

(assert (=> b!948682 m!881909))

(assert (=> b!948682 m!881909))

(declare-fun m!881975 () Bool)

(assert (=> b!948682 m!881975))

(assert (=> b!948692 m!881909))

(assert (=> b!948692 m!881909))

(declare-fun m!881977 () Bool)

(assert (=> b!948692 m!881977))

(assert (=> b!948681 m!881909))

(assert (=> b!948681 m!881909))

(assert (=> b!948681 m!881975))

(declare-fun m!881979 () Bool)

(assert (=> bm!41181 m!881979))

(declare-fun m!881981 () Bool)

(assert (=> b!948690 m!881981))

(declare-fun m!881983 () Bool)

(assert (=> bm!41185 m!881983))

(assert (=> b!948544 d!115051))

(declare-fun d!115053 () Bool)

(declare-fun e!534091 () Bool)

(assert (=> d!115053 e!534091))

(declare-fun res!636370 () Bool)

(assert (=> d!115053 (=> (not res!636370) (not e!534091))))

(assert (=> d!115053 (= res!636370 (and (bvsge (index!38696 lt!426993) #b00000000000000000000000000000000) (bvslt (index!38696 lt!426993) (size!28094 (_keys!10676 thiss!1141)))))))

(declare-fun lt!427112 () Unit!31913)

(declare-fun choose!1577 (array!57431 array!57429 (_ BitVec 32) (_ BitVec 32) V!32551 V!32551 (_ BitVec 32) Int) Unit!31913)

(assert (=> d!115053 (= lt!427112 (choose!1577 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) (index!38696 lt!426993) (defaultEntry!5735 thiss!1141)))))

(assert (=> d!115053 (validMask!0 (mask!27523 thiss!1141))))

(assert (=> d!115053 (= (lemmaValidKeyInArrayIsInListMap!270 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) (index!38696 lt!426993) (defaultEntry!5735 thiss!1141)) lt!427112)))

(declare-fun b!948705 () Bool)

(assert (=> b!948705 (= e!534091 (contains!5203 (getCurrentListMap!3343 (_keys!10676 thiss!1141) (_values!5758 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5467 thiss!1141) (zeroValue!5571 thiss!1141) (minValue!5571 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5735 thiss!1141)) (select (arr!27620 (_keys!10676 thiss!1141)) (index!38696 lt!426993))))))

(assert (= (and d!115053 res!636370) b!948705))

(declare-fun m!881985 () Bool)

(assert (=> d!115053 m!881985))

(assert (=> d!115053 m!881895))

(assert (=> b!948705 m!881821))

(assert (=> b!948705 m!881823))

(assert (=> b!948705 m!881821))

(assert (=> b!948705 m!881823))

(assert (=> b!948705 m!881827))

(assert (=> b!948544 d!115053))

(declare-fun mapIsEmpty!32923 () Bool)

(declare-fun mapRes!32923 () Bool)

(assert (=> mapIsEmpty!32923 mapRes!32923))

(declare-fun b!948712 () Bool)

(declare-fun e!534096 () Bool)

(assert (=> b!948712 (= e!534096 tp_is_empty!20689)))

(declare-fun b!948713 () Bool)

(declare-fun e!534097 () Bool)

(assert (=> b!948713 (= e!534097 tp_is_empty!20689)))

(declare-fun condMapEmpty!32923 () Bool)

(declare-fun mapDefault!32923 () ValueCell!9863)

(assert (=> mapNonEmpty!32914 (= condMapEmpty!32923 (= mapRest!32914 ((as const (Array (_ BitVec 32) ValueCell!9863)) mapDefault!32923)))))

(assert (=> mapNonEmpty!32914 (= tp!63109 (and e!534097 mapRes!32923))))

(declare-fun mapNonEmpty!32923 () Bool)

(declare-fun tp!63124 () Bool)

(assert (=> mapNonEmpty!32923 (= mapRes!32923 (and tp!63124 e!534096))))

(declare-fun mapKey!32923 () (_ BitVec 32))

(declare-fun mapValue!32923 () ValueCell!9863)

(declare-fun mapRest!32923 () (Array (_ BitVec 32) ValueCell!9863))

(assert (=> mapNonEmpty!32923 (= mapRest!32914 (store mapRest!32923 mapKey!32923 mapValue!32923))))

(assert (= (and mapNonEmpty!32914 condMapEmpty!32923) mapIsEmpty!32923))

(assert (= (and mapNonEmpty!32914 (not condMapEmpty!32923)) mapNonEmpty!32923))

(assert (= (and mapNonEmpty!32923 ((_ is ValueCellFull!9863) mapValue!32923)) b!948712))

(assert (= (and mapNonEmpty!32914 ((_ is ValueCellFull!9863) mapDefault!32923)) b!948713))

(declare-fun m!881987 () Bool)

(assert (=> mapNonEmpty!32923 m!881987))

(declare-fun b_lambda!14315 () Bool)

(assert (= b_lambda!14313 (or (and b!948550 b_free!18181) b_lambda!14315)))

(check-sat (not b!948618) (not b!948698) (not b!948632) (not b!948637) (not b_next!18181) (not b!948690) (not b!948681) (not b!948625) (not bm!41182) (not b!948705) (not d!115041) (not b!948617) (not bm!41185) (not d!115053) (not b!948692) b_and!29619 (not b!948619) (not b!948634) tp_is_empty!20689 (not d!115047) (not b!948691) (not d!115043) (not b!948609) (not d!115039) (not mapNonEmpty!32923) (not b!948682) (not d!115049) (not d!115037) (not b!948689) (not b_lambda!14315) (not b!948635) (not bm!41181) (not d!115051) (not bm!41183) (not b!948680))
(check-sat b_and!29619 (not b_next!18181))
