; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81136 () Bool)

(assert start!81136)

(declare-fun b!949514 () Bool)

(declare-fun b_free!18223 () Bool)

(declare-fun b_next!18223 () Bool)

(assert (=> b!949514 (= b_free!18223 (not b_next!18223))))

(declare-fun tp!63260 () Bool)

(declare-fun b_and!29649 () Bool)

(assert (=> b!949514 (= tp!63260 b_and!29649)))

(declare-fun b!949507 () Bool)

(declare-fun res!636756 () Bool)

(declare-fun e!534548 () Bool)

(assert (=> b!949507 (=> (not res!636756) (not e!534548))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32607 0))(
  ( (V!32608 (val!10416 Int)) )
))
(declare-datatypes ((ValueCell!9884 0))(
  ( (ValueCellFull!9884 (v!12956 V!32607)) (EmptyCell!9884) )
))
(declare-datatypes ((array!57441 0))(
  ( (array!57442 (arr!27623 (Array (_ BitVec 32) ValueCell!9884)) (size!28102 (_ BitVec 32))) )
))
(declare-datatypes ((array!57443 0))(
  ( (array!57444 (arr!27624 (Array (_ BitVec 32) (_ BitVec 64))) (size!28103 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4918 0))(
  ( (LongMapFixedSize!4919 (defaultEntry!5768 Int) (mask!27549 (_ BitVec 32)) (extraKeys!5500 (_ BitVec 32)) (zeroValue!5604 V!32607) (minValue!5604 V!32607) (_size!2514 (_ BitVec 32)) (_keys!10695 array!57443) (_values!5791 array!57441) (_vacant!2514 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4918)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9134 0))(
  ( (MissingZero!9134 (index!38907 (_ BitVec 32))) (Found!9134 (index!38908 (_ BitVec 32))) (Intermediate!9134 (undefined!9946 Bool) (index!38909 (_ BitVec 32)) (x!81703 (_ BitVec 32))) (Undefined!9134) (MissingVacant!9134 (index!38910 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57443 (_ BitVec 32)) SeekEntryResult!9134)

(assert (=> b!949507 (= res!636756 (not ((_ is Found!9134) (seekEntry!0 key!756 (_keys!10695 thiss!1141) (mask!27549 thiss!1141)))))))

(declare-fun b!949508 () Bool)

(declare-fun res!636757 () Bool)

(assert (=> b!949508 (=> (not res!636757) (not e!534548))))

(assert (=> b!949508 (= res!636757 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949509 () Bool)

(declare-fun e!534551 () Bool)

(declare-fun tp_is_empty!20731 () Bool)

(assert (=> b!949509 (= e!534551 tp_is_empty!20731)))

(declare-fun b!949510 () Bool)

(declare-fun e!534549 () Bool)

(declare-fun mapRes!33002 () Bool)

(assert (=> b!949510 (= e!534549 (and e!534551 mapRes!33002))))

(declare-fun condMapEmpty!33002 () Bool)

(declare-fun mapDefault!33002 () ValueCell!9884)

(assert (=> b!949510 (= condMapEmpty!33002 (= (arr!27623 (_values!5791 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9884)) mapDefault!33002)))))

(declare-fun b!949511 () Bool)

(declare-fun res!636761 () Bool)

(assert (=> b!949511 (=> (not res!636761) (not e!534548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!949511 (= res!636761 (validMask!0 (mask!27549 thiss!1141)))))

(declare-fun b!949512 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57443 (_ BitVec 32)) Bool)

(assert (=> b!949512 (= e!534548 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10695 thiss!1141) (mask!27549 thiss!1141))))))

(declare-fun res!636760 () Bool)

(assert (=> start!81136 (=> (not res!636760) (not e!534548))))

(declare-fun valid!1877 (LongMapFixedSize!4918) Bool)

(assert (=> start!81136 (= res!636760 (valid!1877 thiss!1141))))

(assert (=> start!81136 e!534548))

(declare-fun e!534547 () Bool)

(assert (=> start!81136 e!534547))

(assert (=> start!81136 true))

(declare-fun b!949513 () Bool)

(declare-fun e!534546 () Bool)

(assert (=> b!949513 (= e!534546 tp_is_empty!20731)))

(declare-fun mapIsEmpty!33002 () Bool)

(assert (=> mapIsEmpty!33002 mapRes!33002))

(declare-fun mapNonEmpty!33002 () Bool)

(declare-fun tp!63259 () Bool)

(assert (=> mapNonEmpty!33002 (= mapRes!33002 (and tp!63259 e!534546))))

(declare-fun mapKey!33002 () (_ BitVec 32))

(declare-fun mapRest!33002 () (Array (_ BitVec 32) ValueCell!9884))

(declare-fun mapValue!33002 () ValueCell!9884)

(assert (=> mapNonEmpty!33002 (= (arr!27623 (_values!5791 thiss!1141)) (store mapRest!33002 mapKey!33002 mapValue!33002))))

(declare-fun array_inv!21502 (array!57443) Bool)

(declare-fun array_inv!21503 (array!57441) Bool)

(assert (=> b!949514 (= e!534547 (and tp!63260 tp_is_empty!20731 (array_inv!21502 (_keys!10695 thiss!1141)) (array_inv!21503 (_values!5791 thiss!1141)) e!534549))))

(declare-fun b!949515 () Bool)

(declare-fun res!636759 () Bool)

(assert (=> b!949515 (=> (not res!636759) (not e!534548))))

(assert (=> b!949515 (= res!636759 (and (= (size!28102 (_values!5791 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27549 thiss!1141))) (= (size!28103 (_keys!10695 thiss!1141)) (size!28102 (_values!5791 thiss!1141))) (bvsge (mask!27549 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5500 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5500 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!949516 () Bool)

(declare-fun res!636758 () Bool)

(assert (=> b!949516 (=> (not res!636758) (not e!534548))))

(declare-datatypes ((tuple2!13586 0))(
  ( (tuple2!13587 (_1!6804 (_ BitVec 64)) (_2!6804 V!32607)) )
))
(declare-datatypes ((List!19333 0))(
  ( (Nil!19330) (Cons!19329 (h!20489 tuple2!13586) (t!27659 List!19333)) )
))
(declare-datatypes ((ListLongMap!12273 0))(
  ( (ListLongMap!12274 (toList!6152 List!19333)) )
))
(declare-fun contains!5185 (ListLongMap!12273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3314 (array!57443 array!57441 (_ BitVec 32) (_ BitVec 32) V!32607 V!32607 (_ BitVec 32) Int) ListLongMap!12273)

(assert (=> b!949516 (= res!636758 (contains!5185 (getCurrentListMap!3314 (_keys!10695 thiss!1141) (_values!5791 thiss!1141) (mask!27549 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)) key!756))))

(assert (= (and start!81136 res!636760) b!949508))

(assert (= (and b!949508 res!636757) b!949507))

(assert (= (and b!949507 res!636756) b!949516))

(assert (= (and b!949516 res!636758) b!949511))

(assert (= (and b!949511 res!636761) b!949515))

(assert (= (and b!949515 res!636759) b!949512))

(assert (= (and b!949510 condMapEmpty!33002) mapIsEmpty!33002))

(assert (= (and b!949510 (not condMapEmpty!33002)) mapNonEmpty!33002))

(assert (= (and mapNonEmpty!33002 ((_ is ValueCellFull!9884) mapValue!33002)) b!949513))

(assert (= (and b!949510 ((_ is ValueCellFull!9884) mapDefault!33002)) b!949509))

(assert (= b!949514 b!949510))

(assert (= start!81136 b!949514))

(declare-fun m!881613 () Bool)

(assert (=> start!81136 m!881613))

(declare-fun m!881615 () Bool)

(assert (=> mapNonEmpty!33002 m!881615))

(declare-fun m!881617 () Bool)

(assert (=> b!949507 m!881617))

(declare-fun m!881619 () Bool)

(assert (=> b!949511 m!881619))

(declare-fun m!881621 () Bool)

(assert (=> b!949516 m!881621))

(assert (=> b!949516 m!881621))

(declare-fun m!881623 () Bool)

(assert (=> b!949516 m!881623))

(declare-fun m!881625 () Bool)

(assert (=> b!949514 m!881625))

(declare-fun m!881627 () Bool)

(assert (=> b!949514 m!881627))

(declare-fun m!881629 () Bool)

(assert (=> b!949512 m!881629))

(check-sat tp_is_empty!20731 b_and!29649 (not b_next!18223) (not b!949514) (not mapNonEmpty!33002) (not start!81136) (not b!949516) (not b!949507) (not b!949512) (not b!949511))
(check-sat b_and!29649 (not b_next!18223))
(get-model)

(declare-fun d!114929 () Bool)

(declare-fun e!534592 () Bool)

(assert (=> d!114929 e!534592))

(declare-fun res!636800 () Bool)

(assert (=> d!114929 (=> res!636800 e!534592)))

(declare-fun lt!427504 () Bool)

(assert (=> d!114929 (= res!636800 (not lt!427504))))

(declare-fun lt!427507 () Bool)

(assert (=> d!114929 (= lt!427504 lt!427507)))

(declare-datatypes ((Unit!31859 0))(
  ( (Unit!31860) )
))
(declare-fun lt!427505 () Unit!31859)

(declare-fun e!534593 () Unit!31859)

(assert (=> d!114929 (= lt!427505 e!534593)))

(declare-fun c!99086 () Bool)

(assert (=> d!114929 (= c!99086 lt!427507)))

(declare-fun containsKey!462 (List!19333 (_ BitVec 64)) Bool)

(assert (=> d!114929 (= lt!427507 (containsKey!462 (toList!6152 (getCurrentListMap!3314 (_keys!10695 thiss!1141) (_values!5791 thiss!1141) (mask!27549 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141))) key!756))))

(assert (=> d!114929 (= (contains!5185 (getCurrentListMap!3314 (_keys!10695 thiss!1141) (_values!5791 thiss!1141) (mask!27549 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)) key!756) lt!427504)))

(declare-fun b!949583 () Bool)

(declare-fun lt!427506 () Unit!31859)

(assert (=> b!949583 (= e!534593 lt!427506)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!357 (List!19333 (_ BitVec 64)) Unit!31859)

(assert (=> b!949583 (= lt!427506 (lemmaContainsKeyImpliesGetValueByKeyDefined!357 (toList!6152 (getCurrentListMap!3314 (_keys!10695 thiss!1141) (_values!5791 thiss!1141) (mask!27549 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141))) key!756))))

(declare-datatypes ((Option!504 0))(
  ( (Some!503 (v!12959 V!32607)) (None!502) )
))
(declare-fun isDefined!370 (Option!504) Bool)

(declare-fun getValueByKey!498 (List!19333 (_ BitVec 64)) Option!504)

(assert (=> b!949583 (isDefined!370 (getValueByKey!498 (toList!6152 (getCurrentListMap!3314 (_keys!10695 thiss!1141) (_values!5791 thiss!1141) (mask!27549 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141))) key!756))))

(declare-fun b!949584 () Bool)

(declare-fun Unit!31861 () Unit!31859)

(assert (=> b!949584 (= e!534593 Unit!31861)))

(declare-fun b!949585 () Bool)

(assert (=> b!949585 (= e!534592 (isDefined!370 (getValueByKey!498 (toList!6152 (getCurrentListMap!3314 (_keys!10695 thiss!1141) (_values!5791 thiss!1141) (mask!27549 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141))) key!756)))))

(assert (= (and d!114929 c!99086) b!949583))

(assert (= (and d!114929 (not c!99086)) b!949584))

(assert (= (and d!114929 (not res!636800)) b!949585))

(declare-fun m!881667 () Bool)

(assert (=> d!114929 m!881667))

(declare-fun m!881669 () Bool)

(assert (=> b!949583 m!881669))

(declare-fun m!881671 () Bool)

(assert (=> b!949583 m!881671))

(assert (=> b!949583 m!881671))

(declare-fun m!881673 () Bool)

(assert (=> b!949583 m!881673))

(assert (=> b!949585 m!881671))

(assert (=> b!949585 m!881671))

(assert (=> b!949585 m!881673))

(assert (=> b!949516 d!114929))

(declare-fun b!949628 () Bool)

(declare-fun e!534626 () Bool)

(declare-fun e!534628 () Bool)

(assert (=> b!949628 (= e!534626 e!534628)))

(declare-fun c!99100 () Bool)

(assert (=> b!949628 (= c!99100 (not (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!949629 () Bool)

(declare-fun call!41313 () Bool)

(assert (=> b!949629 (= e!534628 (not call!41313))))

(declare-fun bm!41305 () Bool)

(declare-fun call!41311 () ListLongMap!12273)

(declare-fun call!41314 () ListLongMap!12273)

(assert (=> bm!41305 (= call!41311 call!41314)))

(declare-fun b!949630 () Bool)

(declare-fun c!99099 () Bool)

(assert (=> b!949630 (= c!99099 (and (not (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!534623 () ListLongMap!12273)

(declare-fun e!534620 () ListLongMap!12273)

(assert (=> b!949630 (= e!534623 e!534620)))

(declare-fun b!949631 () Bool)

(declare-fun e!534631 () Bool)

(declare-fun e!534621 () Bool)

(assert (=> b!949631 (= e!534631 e!534621)))

(declare-fun res!636825 () Bool)

(declare-fun call!41309 () Bool)

(assert (=> b!949631 (= res!636825 call!41309)))

(assert (=> b!949631 (=> (not res!636825) (not e!534621))))

(declare-fun b!949632 () Bool)

(assert (=> b!949632 (= e!534631 (not call!41309))))

(declare-fun d!114931 () Bool)

(assert (=> d!114931 e!534626))

(declare-fun res!636819 () Bool)

(assert (=> d!114931 (=> (not res!636819) (not e!534626))))

(assert (=> d!114931 (= res!636819 (or (bvsge #b00000000000000000000000000000000 (size!28103 (_keys!10695 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28103 (_keys!10695 thiss!1141))))))))

(declare-fun lt!427573 () ListLongMap!12273)

(declare-fun lt!427568 () ListLongMap!12273)

(assert (=> d!114931 (= lt!427573 lt!427568)))

(declare-fun lt!427564 () Unit!31859)

(declare-fun e!534629 () Unit!31859)

(assert (=> d!114931 (= lt!427564 e!534629)))

(declare-fun c!99104 () Bool)

(declare-fun e!534627 () Bool)

(assert (=> d!114931 (= c!99104 e!534627)))

(declare-fun res!636826 () Bool)

(assert (=> d!114931 (=> (not res!636826) (not e!534627))))

(assert (=> d!114931 (= res!636826 (bvslt #b00000000000000000000000000000000 (size!28103 (_keys!10695 thiss!1141))))))

(declare-fun e!534625 () ListLongMap!12273)

(assert (=> d!114931 (= lt!427568 e!534625)))

(declare-fun c!99103 () Bool)

(assert (=> d!114931 (= c!99103 (and (not (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114931 (validMask!0 (mask!27549 thiss!1141))))

(assert (=> d!114931 (= (getCurrentListMap!3314 (_keys!10695 thiss!1141) (_values!5791 thiss!1141) (mask!27549 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)) lt!427573)))

(declare-fun b!949633 () Bool)

(declare-fun res!636823 () Bool)

(assert (=> b!949633 (=> (not res!636823) (not e!534626))))

(declare-fun e!534622 () Bool)

(assert (=> b!949633 (= res!636823 e!534622)))

(declare-fun res!636827 () Bool)

(assert (=> b!949633 (=> res!636827 e!534622)))

(declare-fun e!534624 () Bool)

(assert (=> b!949633 (= res!636827 (not e!534624))))

(declare-fun res!636820 () Bool)

(assert (=> b!949633 (=> (not res!636820) (not e!534624))))

(assert (=> b!949633 (= res!636820 (bvslt #b00000000000000000000000000000000 (size!28103 (_keys!10695 thiss!1141))))))

(declare-fun bm!41306 () Bool)

(declare-fun call!41308 () ListLongMap!12273)

(declare-fun call!41310 () ListLongMap!12273)

(assert (=> bm!41306 (= call!41308 call!41310)))

(declare-fun b!949634 () Bool)

(declare-fun apply!869 (ListLongMap!12273 (_ BitVec 64)) V!32607)

(assert (=> b!949634 (= e!534621 (= (apply!869 lt!427573 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5604 thiss!1141)))))

(declare-fun b!949635 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!949635 (= e!534624 (validKeyInArray!0 (select (arr!27624 (_keys!10695 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949636 () Bool)

(declare-fun res!636821 () Bool)

(assert (=> b!949636 (=> (not res!636821) (not e!534626))))

(assert (=> b!949636 (= res!636821 e!534631)))

(declare-fun c!99101 () Bool)

(assert (=> b!949636 (= c!99101 (not (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!949637 () Bool)

(assert (=> b!949637 (= e!534627 (validKeyInArray!0 (select (arr!27624 (_keys!10695 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949638 () Bool)

(declare-fun +!2879 (ListLongMap!12273 tuple2!13586) ListLongMap!12273)

(assert (=> b!949638 (= e!534625 (+!2879 call!41314 (tuple2!13587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5604 thiss!1141))))))

(declare-fun bm!41307 () Bool)

(declare-fun call!41312 () ListLongMap!12273)

(assert (=> bm!41307 (= call!41310 call!41312)))

(declare-fun b!949639 () Bool)

(declare-fun lt!427572 () Unit!31859)

(assert (=> b!949639 (= e!534629 lt!427572)))

(declare-fun lt!427555 () ListLongMap!12273)

(declare-fun getCurrentListMapNoExtraKeys!3351 (array!57443 array!57441 (_ BitVec 32) (_ BitVec 32) V!32607 V!32607 (_ BitVec 32) Int) ListLongMap!12273)

(assert (=> b!949639 (= lt!427555 (getCurrentListMapNoExtraKeys!3351 (_keys!10695 thiss!1141) (_values!5791 thiss!1141) (mask!27549 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)))))

(declare-fun lt!427562 () (_ BitVec 64))

(assert (=> b!949639 (= lt!427562 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427558 () (_ BitVec 64))

(assert (=> b!949639 (= lt!427558 (select (arr!27624 (_keys!10695 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427569 () Unit!31859)

(declare-fun addStillContains!568 (ListLongMap!12273 (_ BitVec 64) V!32607 (_ BitVec 64)) Unit!31859)

(assert (=> b!949639 (= lt!427569 (addStillContains!568 lt!427555 lt!427562 (zeroValue!5604 thiss!1141) lt!427558))))

(assert (=> b!949639 (contains!5185 (+!2879 lt!427555 (tuple2!13587 lt!427562 (zeroValue!5604 thiss!1141))) lt!427558)))

(declare-fun lt!427571 () Unit!31859)

(assert (=> b!949639 (= lt!427571 lt!427569)))

(declare-fun lt!427559 () ListLongMap!12273)

(assert (=> b!949639 (= lt!427559 (getCurrentListMapNoExtraKeys!3351 (_keys!10695 thiss!1141) (_values!5791 thiss!1141) (mask!27549 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)))))

(declare-fun lt!427567 () (_ BitVec 64))

(assert (=> b!949639 (= lt!427567 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427570 () (_ BitVec 64))

(assert (=> b!949639 (= lt!427570 (select (arr!27624 (_keys!10695 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427565 () Unit!31859)

(declare-fun addApplyDifferent!448 (ListLongMap!12273 (_ BitVec 64) V!32607 (_ BitVec 64)) Unit!31859)

(assert (=> b!949639 (= lt!427565 (addApplyDifferent!448 lt!427559 lt!427567 (minValue!5604 thiss!1141) lt!427570))))

(assert (=> b!949639 (= (apply!869 (+!2879 lt!427559 (tuple2!13587 lt!427567 (minValue!5604 thiss!1141))) lt!427570) (apply!869 lt!427559 lt!427570))))

(declare-fun lt!427557 () Unit!31859)

(assert (=> b!949639 (= lt!427557 lt!427565)))

(declare-fun lt!427560 () ListLongMap!12273)

(assert (=> b!949639 (= lt!427560 (getCurrentListMapNoExtraKeys!3351 (_keys!10695 thiss!1141) (_values!5791 thiss!1141) (mask!27549 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)))))

(declare-fun lt!427553 () (_ BitVec 64))

(assert (=> b!949639 (= lt!427553 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427566 () (_ BitVec 64))

(assert (=> b!949639 (= lt!427566 (select (arr!27624 (_keys!10695 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427556 () Unit!31859)

(assert (=> b!949639 (= lt!427556 (addApplyDifferent!448 lt!427560 lt!427553 (zeroValue!5604 thiss!1141) lt!427566))))

(assert (=> b!949639 (= (apply!869 (+!2879 lt!427560 (tuple2!13587 lt!427553 (zeroValue!5604 thiss!1141))) lt!427566) (apply!869 lt!427560 lt!427566))))

(declare-fun lt!427563 () Unit!31859)

(assert (=> b!949639 (= lt!427563 lt!427556)))

(declare-fun lt!427561 () ListLongMap!12273)

(assert (=> b!949639 (= lt!427561 (getCurrentListMapNoExtraKeys!3351 (_keys!10695 thiss!1141) (_values!5791 thiss!1141) (mask!27549 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)))))

(declare-fun lt!427552 () (_ BitVec 64))

(assert (=> b!949639 (= lt!427552 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427554 () (_ BitVec 64))

(assert (=> b!949639 (= lt!427554 (select (arr!27624 (_keys!10695 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949639 (= lt!427572 (addApplyDifferent!448 lt!427561 lt!427552 (minValue!5604 thiss!1141) lt!427554))))

(assert (=> b!949639 (= (apply!869 (+!2879 lt!427561 (tuple2!13587 lt!427552 (minValue!5604 thiss!1141))) lt!427554) (apply!869 lt!427561 lt!427554))))

(declare-fun b!949640 () Bool)

(assert (=> b!949640 (= e!534620 call!41308)))

(declare-fun b!949641 () Bool)

(assert (=> b!949641 (= e!534625 e!534623)))

(declare-fun c!99102 () Bool)

(assert (=> b!949641 (= c!99102 (and (not (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5500 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41308 () Bool)

(assert (=> bm!41308 (= call!41314 (+!2879 (ite c!99103 call!41312 (ite c!99102 call!41310 call!41308)) (ite (or c!99103 c!99102) (tuple2!13587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5604 thiss!1141)) (tuple2!13587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5604 thiss!1141)))))))

(declare-fun bm!41309 () Bool)

(assert (=> bm!41309 (= call!41313 (contains!5185 lt!427573 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949642 () Bool)

(declare-fun e!534632 () Bool)

(assert (=> b!949642 (= e!534632 (= (apply!869 lt!427573 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5604 thiss!1141)))))

(declare-fun b!949643 () Bool)

(assert (=> b!949643 (= e!534628 e!534632)))

(declare-fun res!636822 () Bool)

(assert (=> b!949643 (= res!636822 call!41313)))

(assert (=> b!949643 (=> (not res!636822) (not e!534632))))

(declare-fun b!949644 () Bool)

(declare-fun Unit!31862 () Unit!31859)

(assert (=> b!949644 (= e!534629 Unit!31862)))

(declare-fun b!949645 () Bool)

(declare-fun e!534630 () Bool)

(assert (=> b!949645 (= e!534622 e!534630)))

(declare-fun res!636824 () Bool)

(assert (=> b!949645 (=> (not res!636824) (not e!534630))))

(assert (=> b!949645 (= res!636824 (contains!5185 lt!427573 (select (arr!27624 (_keys!10695 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949645 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28103 (_keys!10695 thiss!1141))))))

(declare-fun bm!41310 () Bool)

(assert (=> bm!41310 (= call!41312 (getCurrentListMapNoExtraKeys!3351 (_keys!10695 thiss!1141) (_values!5791 thiss!1141) (mask!27549 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)))))

(declare-fun b!949646 () Bool)

(assert (=> b!949646 (= e!534623 call!41311)))

(declare-fun b!949647 () Bool)

(assert (=> b!949647 (= e!534620 call!41311)))

(declare-fun bm!41311 () Bool)

(assert (=> bm!41311 (= call!41309 (contains!5185 lt!427573 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949648 () Bool)

(declare-fun get!14518 (ValueCell!9884 V!32607) V!32607)

(declare-fun dynLambda!1635 (Int (_ BitVec 64)) V!32607)

(assert (=> b!949648 (= e!534630 (= (apply!869 lt!427573 (select (arr!27624 (_keys!10695 thiss!1141)) #b00000000000000000000000000000000)) (get!14518 (select (arr!27623 (_values!5791 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1635 (defaultEntry!5768 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949648 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28102 (_values!5791 thiss!1141))))))

(assert (=> b!949648 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28103 (_keys!10695 thiss!1141))))))

(assert (= (and d!114931 c!99103) b!949638))

(assert (= (and d!114931 (not c!99103)) b!949641))

(assert (= (and b!949641 c!99102) b!949646))

(assert (= (and b!949641 (not c!99102)) b!949630))

(assert (= (and b!949630 c!99099) b!949647))

(assert (= (and b!949630 (not c!99099)) b!949640))

(assert (= (or b!949647 b!949640) bm!41306))

(assert (= (or b!949646 bm!41306) bm!41307))

(assert (= (or b!949646 b!949647) bm!41305))

(assert (= (or b!949638 bm!41307) bm!41310))

(assert (= (or b!949638 bm!41305) bm!41308))

(assert (= (and d!114931 res!636826) b!949637))

(assert (= (and d!114931 c!99104) b!949639))

(assert (= (and d!114931 (not c!99104)) b!949644))

(assert (= (and d!114931 res!636819) b!949633))

(assert (= (and b!949633 res!636820) b!949635))

(assert (= (and b!949633 (not res!636827)) b!949645))

(assert (= (and b!949645 res!636824) b!949648))

(assert (= (and b!949633 res!636823) b!949636))

(assert (= (and b!949636 c!99101) b!949631))

(assert (= (and b!949636 (not c!99101)) b!949632))

(assert (= (and b!949631 res!636825) b!949634))

(assert (= (or b!949631 b!949632) bm!41311))

(assert (= (and b!949636 res!636821) b!949628))

(assert (= (and b!949628 c!99100) b!949643))

(assert (= (and b!949628 (not c!99100)) b!949629))

(assert (= (and b!949643 res!636822) b!949642))

(assert (= (or b!949643 b!949629) bm!41309))

(declare-fun b_lambda!14341 () Bool)

(assert (=> (not b_lambda!14341) (not b!949648)))

(declare-fun t!27662 () Bool)

(declare-fun tb!6179 () Bool)

(assert (=> (and b!949514 (= (defaultEntry!5768 thiss!1141) (defaultEntry!5768 thiss!1141)) t!27662) tb!6179))

(declare-fun result!12275 () Bool)

(assert (=> tb!6179 (= result!12275 tp_is_empty!20731)))

(assert (=> b!949648 t!27662))

(declare-fun b_and!29655 () Bool)

(assert (= b_and!29649 (and (=> t!27662 result!12275) b_and!29655)))

(declare-fun m!881675 () Bool)

(assert (=> b!949635 m!881675))

(assert (=> b!949635 m!881675))

(declare-fun m!881677 () Bool)

(assert (=> b!949635 m!881677))

(declare-fun m!881679 () Bool)

(assert (=> bm!41309 m!881679))

(assert (=> b!949645 m!881675))

(assert (=> b!949645 m!881675))

(declare-fun m!881681 () Bool)

(assert (=> b!949645 m!881681))

(assert (=> d!114931 m!881619))

(declare-fun m!881683 () Bool)

(assert (=> bm!41311 m!881683))

(declare-fun m!881685 () Bool)

(assert (=> b!949648 m!881685))

(assert (=> b!949648 m!881685))

(declare-fun m!881687 () Bool)

(assert (=> b!949648 m!881687))

(declare-fun m!881689 () Bool)

(assert (=> b!949648 m!881689))

(assert (=> b!949648 m!881675))

(declare-fun m!881691 () Bool)

(assert (=> b!949648 m!881691))

(assert (=> b!949648 m!881687))

(assert (=> b!949648 m!881675))

(declare-fun m!881693 () Bool)

(assert (=> bm!41308 m!881693))

(declare-fun m!881695 () Bool)

(assert (=> b!949634 m!881695))

(declare-fun m!881697 () Bool)

(assert (=> b!949642 m!881697))

(declare-fun m!881699 () Bool)

(assert (=> b!949639 m!881699))

(declare-fun m!881701 () Bool)

(assert (=> b!949639 m!881701))

(declare-fun m!881703 () Bool)

(assert (=> b!949639 m!881703))

(declare-fun m!881705 () Bool)

(assert (=> b!949639 m!881705))

(assert (=> b!949639 m!881701))

(declare-fun m!881707 () Bool)

(assert (=> b!949639 m!881707))

(declare-fun m!881709 () Bool)

(assert (=> b!949639 m!881709))

(declare-fun m!881711 () Bool)

(assert (=> b!949639 m!881711))

(declare-fun m!881713 () Bool)

(assert (=> b!949639 m!881713))

(declare-fun m!881715 () Bool)

(assert (=> b!949639 m!881715))

(declare-fun m!881717 () Bool)

(assert (=> b!949639 m!881717))

(declare-fun m!881719 () Bool)

(assert (=> b!949639 m!881719))

(declare-fun m!881721 () Bool)

(assert (=> b!949639 m!881721))

(assert (=> b!949639 m!881711))

(assert (=> b!949639 m!881699))

(declare-fun m!881723 () Bool)

(assert (=> b!949639 m!881723))

(assert (=> b!949639 m!881715))

(declare-fun m!881725 () Bool)

(assert (=> b!949639 m!881725))

(declare-fun m!881727 () Bool)

(assert (=> b!949639 m!881727))

(declare-fun m!881729 () Bool)

(assert (=> b!949639 m!881729))

(assert (=> b!949639 m!881675))

(assert (=> b!949637 m!881675))

(assert (=> b!949637 m!881675))

(assert (=> b!949637 m!881677))

(assert (=> bm!41310 m!881719))

(declare-fun m!881731 () Bool)

(assert (=> b!949638 m!881731))

(assert (=> b!949516 d!114931))

(declare-fun d!114933 () Bool)

(assert (=> d!114933 (= (array_inv!21502 (_keys!10695 thiss!1141)) (bvsge (size!28103 (_keys!10695 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949514 d!114933))

(declare-fun d!114935 () Bool)

(assert (=> d!114935 (= (array_inv!21503 (_values!5791 thiss!1141)) (bvsge (size!28102 (_values!5791 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949514 d!114935))

(declare-fun d!114937 () Bool)

(declare-fun res!636834 () Bool)

(declare-fun e!534635 () Bool)

(assert (=> d!114937 (=> (not res!636834) (not e!534635))))

(declare-fun simpleValid!372 (LongMapFixedSize!4918) Bool)

(assert (=> d!114937 (= res!636834 (simpleValid!372 thiss!1141))))

(assert (=> d!114937 (= (valid!1877 thiss!1141) e!534635)))

(declare-fun b!949657 () Bool)

(declare-fun res!636835 () Bool)

(assert (=> b!949657 (=> (not res!636835) (not e!534635))))

(declare-fun arrayCountValidKeys!0 (array!57443 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949657 (= res!636835 (= (arrayCountValidKeys!0 (_keys!10695 thiss!1141) #b00000000000000000000000000000000 (size!28103 (_keys!10695 thiss!1141))) (_size!2514 thiss!1141)))))

(declare-fun b!949658 () Bool)

(declare-fun res!636836 () Bool)

(assert (=> b!949658 (=> (not res!636836) (not e!534635))))

(assert (=> b!949658 (= res!636836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10695 thiss!1141) (mask!27549 thiss!1141)))))

(declare-fun b!949659 () Bool)

(declare-datatypes ((List!19335 0))(
  ( (Nil!19332) (Cons!19331 (h!20491 (_ BitVec 64)) (t!27663 List!19335)) )
))
(declare-fun arrayNoDuplicates!0 (array!57443 (_ BitVec 32) List!19335) Bool)

(assert (=> b!949659 (= e!534635 (arrayNoDuplicates!0 (_keys!10695 thiss!1141) #b00000000000000000000000000000000 Nil!19332))))

(assert (= (and d!114937 res!636834) b!949657))

(assert (= (and b!949657 res!636835) b!949658))

(assert (= (and b!949658 res!636836) b!949659))

(declare-fun m!881733 () Bool)

(assert (=> d!114937 m!881733))

(declare-fun m!881735 () Bool)

(assert (=> b!949657 m!881735))

(assert (=> b!949658 m!881629))

(declare-fun m!881737 () Bool)

(assert (=> b!949659 m!881737))

(assert (=> start!81136 d!114937))

(declare-fun d!114939 () Bool)

(assert (=> d!114939 (= (validMask!0 (mask!27549 thiss!1141)) (and (or (= (mask!27549 thiss!1141) #b00000000000000000000000000000111) (= (mask!27549 thiss!1141) #b00000000000000000000000000001111) (= (mask!27549 thiss!1141) #b00000000000000000000000000011111) (= (mask!27549 thiss!1141) #b00000000000000000000000000111111) (= (mask!27549 thiss!1141) #b00000000000000000000000001111111) (= (mask!27549 thiss!1141) #b00000000000000000000000011111111) (= (mask!27549 thiss!1141) #b00000000000000000000000111111111) (= (mask!27549 thiss!1141) #b00000000000000000000001111111111) (= (mask!27549 thiss!1141) #b00000000000000000000011111111111) (= (mask!27549 thiss!1141) #b00000000000000000000111111111111) (= (mask!27549 thiss!1141) #b00000000000000000001111111111111) (= (mask!27549 thiss!1141) #b00000000000000000011111111111111) (= (mask!27549 thiss!1141) #b00000000000000000111111111111111) (= (mask!27549 thiss!1141) #b00000000000000001111111111111111) (= (mask!27549 thiss!1141) #b00000000000000011111111111111111) (= (mask!27549 thiss!1141) #b00000000000000111111111111111111) (= (mask!27549 thiss!1141) #b00000000000001111111111111111111) (= (mask!27549 thiss!1141) #b00000000000011111111111111111111) (= (mask!27549 thiss!1141) #b00000000000111111111111111111111) (= (mask!27549 thiss!1141) #b00000000001111111111111111111111) (= (mask!27549 thiss!1141) #b00000000011111111111111111111111) (= (mask!27549 thiss!1141) #b00000000111111111111111111111111) (= (mask!27549 thiss!1141) #b00000001111111111111111111111111) (= (mask!27549 thiss!1141) #b00000011111111111111111111111111) (= (mask!27549 thiss!1141) #b00000111111111111111111111111111) (= (mask!27549 thiss!1141) #b00001111111111111111111111111111) (= (mask!27549 thiss!1141) #b00011111111111111111111111111111) (= (mask!27549 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27549 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!949511 d!114939))

(declare-fun b!949668 () Bool)

(declare-fun e!534644 () Bool)

(declare-fun call!41317 () Bool)

(assert (=> b!949668 (= e!534644 call!41317)))

(declare-fun bm!41314 () Bool)

(assert (=> bm!41314 (= call!41317 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10695 thiss!1141) (mask!27549 thiss!1141)))))

(declare-fun b!949669 () Bool)

(declare-fun e!534643 () Bool)

(assert (=> b!949669 (= e!534643 e!534644)))

(declare-fun c!99107 () Bool)

(assert (=> b!949669 (= c!99107 (validKeyInArray!0 (select (arr!27624 (_keys!10695 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949670 () Bool)

(declare-fun e!534642 () Bool)

(assert (=> b!949670 (= e!534642 call!41317)))

(declare-fun d!114941 () Bool)

(declare-fun res!636842 () Bool)

(assert (=> d!114941 (=> res!636842 e!534643)))

(assert (=> d!114941 (= res!636842 (bvsge #b00000000000000000000000000000000 (size!28103 (_keys!10695 thiss!1141))))))

(assert (=> d!114941 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10695 thiss!1141) (mask!27549 thiss!1141)) e!534643)))

(declare-fun b!949671 () Bool)

(assert (=> b!949671 (= e!534644 e!534642)))

(declare-fun lt!427581 () (_ BitVec 64))

(assert (=> b!949671 (= lt!427581 (select (arr!27624 (_keys!10695 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427580 () Unit!31859)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57443 (_ BitVec 64) (_ BitVec 32)) Unit!31859)

(assert (=> b!949671 (= lt!427580 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10695 thiss!1141) lt!427581 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!949671 (arrayContainsKey!0 (_keys!10695 thiss!1141) lt!427581 #b00000000000000000000000000000000)))

(declare-fun lt!427582 () Unit!31859)

(assert (=> b!949671 (= lt!427582 lt!427580)))

(declare-fun res!636841 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57443 (_ BitVec 32)) SeekEntryResult!9134)

(assert (=> b!949671 (= res!636841 (= (seekEntryOrOpen!0 (select (arr!27624 (_keys!10695 thiss!1141)) #b00000000000000000000000000000000) (_keys!10695 thiss!1141) (mask!27549 thiss!1141)) (Found!9134 #b00000000000000000000000000000000)))))

(assert (=> b!949671 (=> (not res!636841) (not e!534642))))

(assert (= (and d!114941 (not res!636842)) b!949669))

(assert (= (and b!949669 c!99107) b!949671))

(assert (= (and b!949669 (not c!99107)) b!949668))

(assert (= (and b!949671 res!636841) b!949670))

(assert (= (or b!949670 b!949668) bm!41314))

(declare-fun m!881739 () Bool)

(assert (=> bm!41314 m!881739))

(assert (=> b!949669 m!881675))

(assert (=> b!949669 m!881675))

(assert (=> b!949669 m!881677))

(assert (=> b!949671 m!881675))

(declare-fun m!881741 () Bool)

(assert (=> b!949671 m!881741))

(declare-fun m!881743 () Bool)

(assert (=> b!949671 m!881743))

(assert (=> b!949671 m!881675))

(declare-fun m!881745 () Bool)

(assert (=> b!949671 m!881745))

(assert (=> b!949512 d!114941))

(declare-fun b!949684 () Bool)

(declare-fun e!534653 () SeekEntryResult!9134)

(declare-fun lt!427591 () SeekEntryResult!9134)

(assert (=> b!949684 (= e!534653 (MissingZero!9134 (index!38909 lt!427591)))))

(declare-fun b!949685 () Bool)

(declare-fun c!99115 () Bool)

(declare-fun lt!427594 () (_ BitVec 64))

(assert (=> b!949685 (= c!99115 (= lt!427594 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534651 () SeekEntryResult!9134)

(assert (=> b!949685 (= e!534651 e!534653)))

(declare-fun b!949687 () Bool)

(declare-fun e!534652 () SeekEntryResult!9134)

(assert (=> b!949687 (= e!534652 e!534651)))

(assert (=> b!949687 (= lt!427594 (select (arr!27624 (_keys!10695 thiss!1141)) (index!38909 lt!427591)))))

(declare-fun c!99116 () Bool)

(assert (=> b!949687 (= c!99116 (= lt!427594 key!756))))

(declare-fun b!949688 () Bool)

(declare-fun lt!427592 () SeekEntryResult!9134)

(assert (=> b!949688 (= e!534653 (ite ((_ is MissingVacant!9134) lt!427592) (MissingZero!9134 (index!38910 lt!427592)) lt!427592))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57443 (_ BitVec 32)) SeekEntryResult!9134)

(assert (=> b!949688 (= lt!427592 (seekKeyOrZeroReturnVacant!0 (x!81703 lt!427591) (index!38909 lt!427591) (index!38909 lt!427591) key!756 (_keys!10695 thiss!1141) (mask!27549 thiss!1141)))))

(declare-fun b!949689 () Bool)

(assert (=> b!949689 (= e!534651 (Found!9134 (index!38909 lt!427591)))))

(declare-fun b!949686 () Bool)

(assert (=> b!949686 (= e!534652 Undefined!9134)))

(declare-fun d!114943 () Bool)

(declare-fun lt!427593 () SeekEntryResult!9134)

(assert (=> d!114943 (and (or ((_ is MissingVacant!9134) lt!427593) (not ((_ is Found!9134) lt!427593)) (and (bvsge (index!38908 lt!427593) #b00000000000000000000000000000000) (bvslt (index!38908 lt!427593) (size!28103 (_keys!10695 thiss!1141))))) (not ((_ is MissingVacant!9134) lt!427593)) (or (not ((_ is Found!9134) lt!427593)) (= (select (arr!27624 (_keys!10695 thiss!1141)) (index!38908 lt!427593)) key!756)))))

(assert (=> d!114943 (= lt!427593 e!534652)))

(declare-fun c!99114 () Bool)

(assert (=> d!114943 (= c!99114 (and ((_ is Intermediate!9134) lt!427591) (undefined!9946 lt!427591)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57443 (_ BitVec 32)) SeekEntryResult!9134)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114943 (= lt!427591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27549 thiss!1141)) key!756 (_keys!10695 thiss!1141) (mask!27549 thiss!1141)))))

(assert (=> d!114943 (validMask!0 (mask!27549 thiss!1141))))

(assert (=> d!114943 (= (seekEntry!0 key!756 (_keys!10695 thiss!1141) (mask!27549 thiss!1141)) lt!427593)))

(assert (= (and d!114943 c!99114) b!949686))

(assert (= (and d!114943 (not c!99114)) b!949687))

(assert (= (and b!949687 c!99116) b!949689))

(assert (= (and b!949687 (not c!99116)) b!949685))

(assert (= (and b!949685 c!99115) b!949684))

(assert (= (and b!949685 (not c!99115)) b!949688))

(declare-fun m!881747 () Bool)

(assert (=> b!949687 m!881747))

(declare-fun m!881749 () Bool)

(assert (=> b!949688 m!881749))

(declare-fun m!881751 () Bool)

(assert (=> d!114943 m!881751))

(declare-fun m!881753 () Bool)

(assert (=> d!114943 m!881753))

(assert (=> d!114943 m!881753))

(declare-fun m!881755 () Bool)

(assert (=> d!114943 m!881755))

(assert (=> d!114943 m!881619))

(assert (=> b!949507 d!114943))

(declare-fun b!949696 () Bool)

(declare-fun e!534658 () Bool)

(assert (=> b!949696 (= e!534658 tp_is_empty!20731)))

(declare-fun condMapEmpty!33011 () Bool)

(declare-fun mapDefault!33011 () ValueCell!9884)

(assert (=> mapNonEmpty!33002 (= condMapEmpty!33011 (= mapRest!33002 ((as const (Array (_ BitVec 32) ValueCell!9884)) mapDefault!33011)))))

(declare-fun e!534659 () Bool)

(declare-fun mapRes!33011 () Bool)

(assert (=> mapNonEmpty!33002 (= tp!63259 (and e!534659 mapRes!33011))))

(declare-fun mapNonEmpty!33011 () Bool)

(declare-fun tp!63275 () Bool)

(assert (=> mapNonEmpty!33011 (= mapRes!33011 (and tp!63275 e!534658))))

(declare-fun mapValue!33011 () ValueCell!9884)

(declare-fun mapKey!33011 () (_ BitVec 32))

(declare-fun mapRest!33011 () (Array (_ BitVec 32) ValueCell!9884))

(assert (=> mapNonEmpty!33011 (= mapRest!33002 (store mapRest!33011 mapKey!33011 mapValue!33011))))

(declare-fun b!949697 () Bool)

(assert (=> b!949697 (= e!534659 tp_is_empty!20731)))

(declare-fun mapIsEmpty!33011 () Bool)

(assert (=> mapIsEmpty!33011 mapRes!33011))

(assert (= (and mapNonEmpty!33002 condMapEmpty!33011) mapIsEmpty!33011))

(assert (= (and mapNonEmpty!33002 (not condMapEmpty!33011)) mapNonEmpty!33011))

(assert (= (and mapNonEmpty!33011 ((_ is ValueCellFull!9884) mapValue!33011)) b!949696))

(assert (= (and mapNonEmpty!33002 ((_ is ValueCellFull!9884) mapDefault!33011)) b!949697))

(declare-fun m!881757 () Bool)

(assert (=> mapNonEmpty!33011 m!881757))

(declare-fun b_lambda!14343 () Bool)

(assert (= b_lambda!14341 (or (and b!949514 b_free!18223) b_lambda!14343)))

(check-sat tp_is_empty!20731 (not bm!41310) (not b_next!18223) (not b!949671) (not b!949645) (not b!949585) (not b!949634) (not b!949659) (not b!949688) (not b!949642) (not b!949657) (not b!949635) (not b!949669) (not d!114943) (not b_lambda!14343) (not d!114937) (not bm!41309) (not mapNonEmpty!33011) (not d!114931) (not b!949638) (not b!949658) (not b!949648) (not bm!41314) (not bm!41311) (not d!114929) (not bm!41308) b_and!29655 (not b!949637) (not b!949639) (not b!949583))
(check-sat b_and!29655 (not b_next!18223))
