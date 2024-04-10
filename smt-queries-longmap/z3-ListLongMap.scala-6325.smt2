; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81378 () Bool)

(assert start!81378)

(declare-fun b!951572 () Bool)

(declare-fun b_free!18273 () Bool)

(declare-fun b_next!18273 () Bool)

(assert (=> b!951572 (= b_free!18273 (not b_next!18273))))

(declare-fun tp!63430 () Bool)

(declare-fun b_and!29743 () Bool)

(assert (=> b!951572 (= tp!63430 b_and!29743)))

(declare-fun mapIsEmpty!33099 () Bool)

(declare-fun mapRes!33099 () Bool)

(assert (=> mapIsEmpty!33099 mapRes!33099))

(declare-fun b!951569 () Bool)

(declare-fun e!535846 () Bool)

(declare-fun tp_is_empty!20781 () Bool)

(assert (=> b!951569 (= e!535846 tp_is_empty!20781)))

(declare-fun b!951570 () Bool)

(declare-fun e!535847 () Bool)

(assert (=> b!951570 (= e!535847 (and e!535846 mapRes!33099))))

(declare-fun condMapEmpty!33099 () Bool)

(declare-datatypes ((V!32673 0))(
  ( (V!32674 (val!10441 Int)) )
))
(declare-datatypes ((ValueCell!9909 0))(
  ( (ValueCellFull!9909 (v!12989 V!32673)) (EmptyCell!9909) )
))
(declare-datatypes ((array!57590 0))(
  ( (array!57591 (arr!27690 (Array (_ BitVec 32) ValueCell!9909)) (size!28168 (_ BitVec 32))) )
))
(declare-datatypes ((array!57592 0))(
  ( (array!57593 (arr!27691 (Array (_ BitVec 32) (_ BitVec 64))) (size!28169 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4968 0))(
  ( (LongMapFixedSize!4969 (defaultEntry!5807 Int) (mask!27632 (_ BitVec 32)) (extraKeys!5539 (_ BitVec 32)) (zeroValue!5643 V!32673) (minValue!5643 V!32673) (_size!2539 (_ BitVec 32)) (_keys!10752 array!57592) (_values!5830 array!57590) (_vacant!2539 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4968)

(declare-fun mapDefault!33099 () ValueCell!9909)

(assert (=> b!951570 (= condMapEmpty!33099 (= (arr!27690 (_values!5830 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9909)) mapDefault!33099)))))

(declare-fun mapNonEmpty!33099 () Bool)

(declare-fun tp!63431 () Bool)

(declare-fun e!535845 () Bool)

(assert (=> mapNonEmpty!33099 (= mapRes!33099 (and tp!63431 e!535845))))

(declare-fun mapKey!33099 () (_ BitVec 32))

(declare-fun mapRest!33099 () (Array (_ BitVec 32) ValueCell!9909))

(declare-fun mapValue!33099 () ValueCell!9909)

(assert (=> mapNonEmpty!33099 (= (arr!27690 (_values!5830 thiss!1141)) (store mapRest!33099 mapKey!33099 mapValue!33099))))

(declare-fun res!637696 () Bool)

(declare-fun e!535843 () Bool)

(assert (=> start!81378 (=> (not res!637696) (not e!535843))))

(declare-fun valid!1890 (LongMapFixedSize!4968) Bool)

(assert (=> start!81378 (= res!637696 (valid!1890 thiss!1141))))

(assert (=> start!81378 e!535843))

(declare-fun e!535844 () Bool)

(assert (=> start!81378 e!535844))

(assert (=> start!81378 true))

(declare-fun b!951571 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951571 (= e!535843 (not (validMask!0 (mask!27632 thiss!1141))))))

(declare-fun lt!428644 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57592 (_ BitVec 32)) Bool)

(assert (=> b!951571 (arrayForallSeekEntryOrOpenFound!0 lt!428644 (_keys!10752 thiss!1141) (mask!27632 thiss!1141))))

(declare-datatypes ((Unit!32025 0))(
  ( (Unit!32026) )
))
(declare-fun lt!428645 () Unit!32025)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32025)

(assert (=> b!951571 (= lt!428645 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10752 thiss!1141) (mask!27632 thiss!1141) #b00000000000000000000000000000000 lt!428644))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57592 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951571 (= lt!428644 (arrayScanForKey!0 (_keys!10752 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951571 (arrayContainsKey!0 (_keys!10752 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!428646 () Unit!32025)

(declare-fun lemmaKeyInListMapIsInArray!330 (array!57592 array!57590 (_ BitVec 32) (_ BitVec 32) V!32673 V!32673 (_ BitVec 64) Int) Unit!32025)

(assert (=> b!951571 (= lt!428646 (lemmaKeyInListMapIsInArray!330 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) key!756 (defaultEntry!5807 thiss!1141)))))

(declare-fun array_inv!21496 (array!57592) Bool)

(declare-fun array_inv!21497 (array!57590) Bool)

(assert (=> b!951572 (= e!535844 (and tp!63430 tp_is_empty!20781 (array_inv!21496 (_keys!10752 thiss!1141)) (array_inv!21497 (_values!5830 thiss!1141)) e!535847))))

(declare-fun b!951573 () Bool)

(declare-fun res!637695 () Bool)

(assert (=> b!951573 (=> (not res!637695) (not e!535843))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9155 0))(
  ( (MissingZero!9155 (index!38991 (_ BitVec 32))) (Found!9155 (index!38992 (_ BitVec 32))) (Intermediate!9155 (undefined!9967 Bool) (index!38993 (_ BitVec 32)) (x!81871 (_ BitVec 32))) (Undefined!9155) (MissingVacant!9155 (index!38994 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57592 (_ BitVec 32)) SeekEntryResult!9155)

(assert (=> b!951573 (= res!637695 (not ((_ is Found!9155) (seekEntry!0 key!756 (_keys!10752 thiss!1141) (mask!27632 thiss!1141)))))))

(declare-fun b!951574 () Bool)

(declare-fun res!637697 () Bool)

(assert (=> b!951574 (=> (not res!637697) (not e!535843))))

(declare-datatypes ((tuple2!13574 0))(
  ( (tuple2!13575 (_1!6798 (_ BitVec 64)) (_2!6798 V!32673)) )
))
(declare-datatypes ((List!19357 0))(
  ( (Nil!19354) (Cons!19353 (h!20514 tuple2!13574) (t!27706 List!19357)) )
))
(declare-datatypes ((ListLongMap!12271 0))(
  ( (ListLongMap!12272 (toList!6151 List!19357)) )
))
(declare-fun contains!5244 (ListLongMap!12271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3384 (array!57592 array!57590 (_ BitVec 32) (_ BitVec 32) V!32673 V!32673 (_ BitVec 32) Int) ListLongMap!12271)

(assert (=> b!951574 (= res!637697 (contains!5244 (getCurrentListMap!3384 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5807 thiss!1141)) key!756))))

(declare-fun b!951575 () Bool)

(declare-fun res!637694 () Bool)

(assert (=> b!951575 (=> (not res!637694) (not e!535843))))

(assert (=> b!951575 (= res!637694 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951576 () Bool)

(assert (=> b!951576 (= e!535845 tp_is_empty!20781)))

(assert (= (and start!81378 res!637696) b!951575))

(assert (= (and b!951575 res!637694) b!951573))

(assert (= (and b!951573 res!637695) b!951574))

(assert (= (and b!951574 res!637697) b!951571))

(assert (= (and b!951570 condMapEmpty!33099) mapIsEmpty!33099))

(assert (= (and b!951570 (not condMapEmpty!33099)) mapNonEmpty!33099))

(assert (= (and mapNonEmpty!33099 ((_ is ValueCellFull!9909) mapValue!33099)) b!951576))

(assert (= (and b!951570 ((_ is ValueCellFull!9909) mapDefault!33099)) b!951569))

(assert (= b!951572 b!951570))

(assert (= start!81378 b!951572))

(declare-fun m!883795 () Bool)

(assert (=> mapNonEmpty!33099 m!883795))

(declare-fun m!883797 () Bool)

(assert (=> b!951571 m!883797))

(declare-fun m!883799 () Bool)

(assert (=> b!951571 m!883799))

(declare-fun m!883801 () Bool)

(assert (=> b!951571 m!883801))

(declare-fun m!883803 () Bool)

(assert (=> b!951571 m!883803))

(declare-fun m!883805 () Bool)

(assert (=> b!951571 m!883805))

(declare-fun m!883807 () Bool)

(assert (=> b!951571 m!883807))

(declare-fun m!883809 () Bool)

(assert (=> b!951573 m!883809))

(declare-fun m!883811 () Bool)

(assert (=> b!951572 m!883811))

(declare-fun m!883813 () Bool)

(assert (=> b!951572 m!883813))

(declare-fun m!883815 () Bool)

(assert (=> start!81378 m!883815))

(declare-fun m!883817 () Bool)

(assert (=> b!951574 m!883817))

(assert (=> b!951574 m!883817))

(declare-fun m!883819 () Bool)

(assert (=> b!951574 m!883819))

(check-sat (not start!81378) (not b!951571) (not b_next!18273) (not b!951574) (not b!951572) tp_is_empty!20781 (not mapNonEmpty!33099) b_and!29743 (not b!951573))
(check-sat b_and!29743 (not b_next!18273))
(get-model)

(declare-fun d!115359 () Bool)

(declare-fun res!637716 () Bool)

(declare-fun e!535868 () Bool)

(assert (=> d!115359 (=> (not res!637716) (not e!535868))))

(declare-fun simpleValid!379 (LongMapFixedSize!4968) Bool)

(assert (=> d!115359 (= res!637716 (simpleValid!379 thiss!1141))))

(assert (=> d!115359 (= (valid!1890 thiss!1141) e!535868)))

(declare-fun b!951607 () Bool)

(declare-fun res!637717 () Bool)

(assert (=> b!951607 (=> (not res!637717) (not e!535868))))

(declare-fun arrayCountValidKeys!0 (array!57592 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951607 (= res!637717 (= (arrayCountValidKeys!0 (_keys!10752 thiss!1141) #b00000000000000000000000000000000 (size!28169 (_keys!10752 thiss!1141))) (_size!2539 thiss!1141)))))

(declare-fun b!951608 () Bool)

(declare-fun res!637718 () Bool)

(assert (=> b!951608 (=> (not res!637718) (not e!535868))))

(assert (=> b!951608 (= res!637718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10752 thiss!1141) (mask!27632 thiss!1141)))))

(declare-fun b!951609 () Bool)

(declare-datatypes ((List!19358 0))(
  ( (Nil!19355) (Cons!19354 (h!20515 (_ BitVec 64)) (t!27709 List!19358)) )
))
(declare-fun arrayNoDuplicates!0 (array!57592 (_ BitVec 32) List!19358) Bool)

(assert (=> b!951609 (= e!535868 (arrayNoDuplicates!0 (_keys!10752 thiss!1141) #b00000000000000000000000000000000 Nil!19355))))

(assert (= (and d!115359 res!637716) b!951607))

(assert (= (and b!951607 res!637717) b!951608))

(assert (= (and b!951608 res!637718) b!951609))

(declare-fun m!883847 () Bool)

(assert (=> d!115359 m!883847))

(declare-fun m!883849 () Bool)

(assert (=> b!951607 m!883849))

(declare-fun m!883851 () Bool)

(assert (=> b!951608 m!883851))

(declare-fun m!883853 () Bool)

(assert (=> b!951609 m!883853))

(assert (=> start!81378 d!115359))

(declare-fun b!951618 () Bool)

(declare-fun e!535875 () Bool)

(declare-fun e!535877 () Bool)

(assert (=> b!951618 (= e!535875 e!535877)))

(declare-fun c!99462 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!951618 (= c!99462 (validKeyInArray!0 (select (arr!27691 (_keys!10752 thiss!1141)) lt!428644)))))

(declare-fun b!951619 () Bool)

(declare-fun e!535876 () Bool)

(assert (=> b!951619 (= e!535877 e!535876)))

(declare-fun lt!428664 () (_ BitVec 64))

(assert (=> b!951619 (= lt!428664 (select (arr!27691 (_keys!10752 thiss!1141)) lt!428644))))

(declare-fun lt!428663 () Unit!32025)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57592 (_ BitVec 64) (_ BitVec 32)) Unit!32025)

(assert (=> b!951619 (= lt!428663 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10752 thiss!1141) lt!428664 lt!428644))))

(assert (=> b!951619 (arrayContainsKey!0 (_keys!10752 thiss!1141) lt!428664 #b00000000000000000000000000000000)))

(declare-fun lt!428662 () Unit!32025)

(assert (=> b!951619 (= lt!428662 lt!428663)))

(declare-fun res!637724 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57592 (_ BitVec 32)) SeekEntryResult!9155)

(assert (=> b!951619 (= res!637724 (= (seekEntryOrOpen!0 (select (arr!27691 (_keys!10752 thiss!1141)) lt!428644) (_keys!10752 thiss!1141) (mask!27632 thiss!1141)) (Found!9155 lt!428644)))))

(assert (=> b!951619 (=> (not res!637724) (not e!535876))))

(declare-fun b!951620 () Bool)

(declare-fun call!41493 () Bool)

(assert (=> b!951620 (= e!535876 call!41493)))

(declare-fun b!951621 () Bool)

(assert (=> b!951621 (= e!535877 call!41493)))

(declare-fun bm!41490 () Bool)

(assert (=> bm!41490 (= call!41493 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!428644 #b00000000000000000000000000000001) (_keys!10752 thiss!1141) (mask!27632 thiss!1141)))))

(declare-fun d!115361 () Bool)

(declare-fun res!637723 () Bool)

(assert (=> d!115361 (=> res!637723 e!535875)))

(assert (=> d!115361 (= res!637723 (bvsge lt!428644 (size!28169 (_keys!10752 thiss!1141))))))

(assert (=> d!115361 (= (arrayForallSeekEntryOrOpenFound!0 lt!428644 (_keys!10752 thiss!1141) (mask!27632 thiss!1141)) e!535875)))

(assert (= (and d!115361 (not res!637723)) b!951618))

(assert (= (and b!951618 c!99462) b!951619))

(assert (= (and b!951618 (not c!99462)) b!951621))

(assert (= (and b!951619 res!637724) b!951620))

(assert (= (or b!951620 b!951621) bm!41490))

(declare-fun m!883855 () Bool)

(assert (=> b!951618 m!883855))

(assert (=> b!951618 m!883855))

(declare-fun m!883857 () Bool)

(assert (=> b!951618 m!883857))

(assert (=> b!951619 m!883855))

(declare-fun m!883859 () Bool)

(assert (=> b!951619 m!883859))

(declare-fun m!883861 () Bool)

(assert (=> b!951619 m!883861))

(assert (=> b!951619 m!883855))

(declare-fun m!883863 () Bool)

(assert (=> b!951619 m!883863))

(declare-fun m!883865 () Bool)

(assert (=> bm!41490 m!883865))

(assert (=> b!951571 d!115361))

(declare-fun d!115363 () Bool)

(declare-fun res!637729 () Bool)

(declare-fun e!535882 () Bool)

(assert (=> d!115363 (=> res!637729 e!535882)))

(assert (=> d!115363 (= res!637729 (= (select (arr!27691 (_keys!10752 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115363 (= (arrayContainsKey!0 (_keys!10752 thiss!1141) key!756 #b00000000000000000000000000000000) e!535882)))

(declare-fun b!951626 () Bool)

(declare-fun e!535883 () Bool)

(assert (=> b!951626 (= e!535882 e!535883)))

(declare-fun res!637730 () Bool)

(assert (=> b!951626 (=> (not res!637730) (not e!535883))))

(assert (=> b!951626 (= res!637730 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28169 (_keys!10752 thiss!1141))))))

(declare-fun b!951627 () Bool)

(assert (=> b!951627 (= e!535883 (arrayContainsKey!0 (_keys!10752 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115363 (not res!637729)) b!951626))

(assert (= (and b!951626 res!637730) b!951627))

(declare-fun m!883867 () Bool)

(assert (=> d!115363 m!883867))

(declare-fun m!883869 () Bool)

(assert (=> b!951627 m!883869))

(assert (=> b!951571 d!115363))

(declare-fun d!115365 () Bool)

(declare-fun e!535886 () Bool)

(assert (=> d!115365 e!535886))

(declare-fun c!99465 () Bool)

(assert (=> d!115365 (= c!99465 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428667 () Unit!32025)

(declare-fun choose!1592 (array!57592 array!57590 (_ BitVec 32) (_ BitVec 32) V!32673 V!32673 (_ BitVec 64) Int) Unit!32025)

(assert (=> d!115365 (= lt!428667 (choose!1592 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) key!756 (defaultEntry!5807 thiss!1141)))))

(assert (=> d!115365 (validMask!0 (mask!27632 thiss!1141))))

(assert (=> d!115365 (= (lemmaKeyInListMapIsInArray!330 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) key!756 (defaultEntry!5807 thiss!1141)) lt!428667)))

(declare-fun b!951632 () Bool)

(assert (=> b!951632 (= e!535886 (arrayContainsKey!0 (_keys!10752 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!951633 () Bool)

(assert (=> b!951633 (= e!535886 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5539 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5539 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115365 c!99465) b!951632))

(assert (= (and d!115365 (not c!99465)) b!951633))

(declare-fun m!883871 () Bool)

(assert (=> d!115365 m!883871))

(assert (=> d!115365 m!883803))

(assert (=> b!951632 m!883807))

(assert (=> b!951571 d!115365))

(declare-fun d!115367 () Bool)

(declare-fun lt!428670 () (_ BitVec 32))

(assert (=> d!115367 (and (or (bvslt lt!428670 #b00000000000000000000000000000000) (bvsge lt!428670 (size!28169 (_keys!10752 thiss!1141))) (and (bvsge lt!428670 #b00000000000000000000000000000000) (bvslt lt!428670 (size!28169 (_keys!10752 thiss!1141))))) (bvsge lt!428670 #b00000000000000000000000000000000) (bvslt lt!428670 (size!28169 (_keys!10752 thiss!1141))) (= (select (arr!27691 (_keys!10752 thiss!1141)) lt!428670) key!756))))

(declare-fun e!535889 () (_ BitVec 32))

(assert (=> d!115367 (= lt!428670 e!535889)))

(declare-fun c!99468 () Bool)

(assert (=> d!115367 (= c!99468 (= (select (arr!27691 (_keys!10752 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115367 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28169 (_keys!10752 thiss!1141))) (bvslt (size!28169 (_keys!10752 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115367 (= (arrayScanForKey!0 (_keys!10752 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428670)))

(declare-fun b!951638 () Bool)

(assert (=> b!951638 (= e!535889 #b00000000000000000000000000000000)))

(declare-fun b!951639 () Bool)

(assert (=> b!951639 (= e!535889 (arrayScanForKey!0 (_keys!10752 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115367 c!99468) b!951638))

(assert (= (and d!115367 (not c!99468)) b!951639))

(declare-fun m!883873 () Bool)

(assert (=> d!115367 m!883873))

(assert (=> d!115367 m!883867))

(declare-fun m!883875 () Bool)

(assert (=> b!951639 m!883875))

(assert (=> b!951571 d!115367))

(declare-fun d!115369 () Bool)

(assert (=> d!115369 (arrayForallSeekEntryOrOpenFound!0 lt!428644 (_keys!10752 thiss!1141) (mask!27632 thiss!1141))))

(declare-fun lt!428673 () Unit!32025)

(declare-fun choose!38 (array!57592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32025)

(assert (=> d!115369 (= lt!428673 (choose!38 (_keys!10752 thiss!1141) (mask!27632 thiss!1141) #b00000000000000000000000000000000 lt!428644))))

(assert (=> d!115369 (validMask!0 (mask!27632 thiss!1141))))

(assert (=> d!115369 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10752 thiss!1141) (mask!27632 thiss!1141) #b00000000000000000000000000000000 lt!428644) lt!428673)))

(declare-fun bs!26738 () Bool)

(assert (= bs!26738 d!115369))

(assert (=> bs!26738 m!883799))

(declare-fun m!883877 () Bool)

(assert (=> bs!26738 m!883877))

(assert (=> bs!26738 m!883803))

(assert (=> b!951571 d!115369))

(declare-fun d!115371 () Bool)

(assert (=> d!115371 (= (validMask!0 (mask!27632 thiss!1141)) (and (or (= (mask!27632 thiss!1141) #b00000000000000000000000000000111) (= (mask!27632 thiss!1141) #b00000000000000000000000000001111) (= (mask!27632 thiss!1141) #b00000000000000000000000000011111) (= (mask!27632 thiss!1141) #b00000000000000000000000000111111) (= (mask!27632 thiss!1141) #b00000000000000000000000001111111) (= (mask!27632 thiss!1141) #b00000000000000000000000011111111) (= (mask!27632 thiss!1141) #b00000000000000000000000111111111) (= (mask!27632 thiss!1141) #b00000000000000000000001111111111) (= (mask!27632 thiss!1141) #b00000000000000000000011111111111) (= (mask!27632 thiss!1141) #b00000000000000000000111111111111) (= (mask!27632 thiss!1141) #b00000000000000000001111111111111) (= (mask!27632 thiss!1141) #b00000000000000000011111111111111) (= (mask!27632 thiss!1141) #b00000000000000000111111111111111) (= (mask!27632 thiss!1141) #b00000000000000001111111111111111) (= (mask!27632 thiss!1141) #b00000000000000011111111111111111) (= (mask!27632 thiss!1141) #b00000000000000111111111111111111) (= (mask!27632 thiss!1141) #b00000000000001111111111111111111) (= (mask!27632 thiss!1141) #b00000000000011111111111111111111) (= (mask!27632 thiss!1141) #b00000000000111111111111111111111) (= (mask!27632 thiss!1141) #b00000000001111111111111111111111) (= (mask!27632 thiss!1141) #b00000000011111111111111111111111) (= (mask!27632 thiss!1141) #b00000000111111111111111111111111) (= (mask!27632 thiss!1141) #b00000001111111111111111111111111) (= (mask!27632 thiss!1141) #b00000011111111111111111111111111) (= (mask!27632 thiss!1141) #b00000111111111111111111111111111) (= (mask!27632 thiss!1141) #b00001111111111111111111111111111) (= (mask!27632 thiss!1141) #b00011111111111111111111111111111) (= (mask!27632 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27632 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!951571 d!115371))

(declare-fun b!951652 () Bool)

(declare-fun e!535896 () SeekEntryResult!9155)

(declare-fun lt!428684 () SeekEntryResult!9155)

(assert (=> b!951652 (= e!535896 (MissingZero!9155 (index!38993 lt!428684)))))

(declare-fun b!951654 () Bool)

(declare-fun c!99476 () Bool)

(declare-fun lt!428683 () (_ BitVec 64))

(assert (=> b!951654 (= c!99476 (= lt!428683 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!535897 () SeekEntryResult!9155)

(assert (=> b!951654 (= e!535897 e!535896)))

(declare-fun b!951655 () Bool)

(declare-fun lt!428685 () SeekEntryResult!9155)

(assert (=> b!951655 (= e!535896 (ite ((_ is MissingVacant!9155) lt!428685) (MissingZero!9155 (index!38994 lt!428685)) lt!428685))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57592 (_ BitVec 32)) SeekEntryResult!9155)

(assert (=> b!951655 (= lt!428685 (seekKeyOrZeroReturnVacant!0 (x!81871 lt!428684) (index!38993 lt!428684) (index!38993 lt!428684) key!756 (_keys!10752 thiss!1141) (mask!27632 thiss!1141)))))

(declare-fun b!951656 () Bool)

(declare-fun e!535898 () SeekEntryResult!9155)

(assert (=> b!951656 (= e!535898 e!535897)))

(assert (=> b!951656 (= lt!428683 (select (arr!27691 (_keys!10752 thiss!1141)) (index!38993 lt!428684)))))

(declare-fun c!99475 () Bool)

(assert (=> b!951656 (= c!99475 (= lt!428683 key!756))))

(declare-fun b!951657 () Bool)

(assert (=> b!951657 (= e!535897 (Found!9155 (index!38993 lt!428684)))))

(declare-fun b!951653 () Bool)

(assert (=> b!951653 (= e!535898 Undefined!9155)))

(declare-fun d!115373 () Bool)

(declare-fun lt!428682 () SeekEntryResult!9155)

(assert (=> d!115373 (and (or ((_ is MissingVacant!9155) lt!428682) (not ((_ is Found!9155) lt!428682)) (and (bvsge (index!38992 lt!428682) #b00000000000000000000000000000000) (bvslt (index!38992 lt!428682) (size!28169 (_keys!10752 thiss!1141))))) (not ((_ is MissingVacant!9155) lt!428682)) (or (not ((_ is Found!9155) lt!428682)) (= (select (arr!27691 (_keys!10752 thiss!1141)) (index!38992 lt!428682)) key!756)))))

(assert (=> d!115373 (= lt!428682 e!535898)))

(declare-fun c!99477 () Bool)

(assert (=> d!115373 (= c!99477 (and ((_ is Intermediate!9155) lt!428684) (undefined!9967 lt!428684)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57592 (_ BitVec 32)) SeekEntryResult!9155)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115373 (= lt!428684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27632 thiss!1141)) key!756 (_keys!10752 thiss!1141) (mask!27632 thiss!1141)))))

(assert (=> d!115373 (validMask!0 (mask!27632 thiss!1141))))

(assert (=> d!115373 (= (seekEntry!0 key!756 (_keys!10752 thiss!1141) (mask!27632 thiss!1141)) lt!428682)))

(assert (= (and d!115373 c!99477) b!951653))

(assert (= (and d!115373 (not c!99477)) b!951656))

(assert (= (and b!951656 c!99475) b!951657))

(assert (= (and b!951656 (not c!99475)) b!951654))

(assert (= (and b!951654 c!99476) b!951652))

(assert (= (and b!951654 (not c!99476)) b!951655))

(declare-fun m!883879 () Bool)

(assert (=> b!951655 m!883879))

(declare-fun m!883881 () Bool)

(assert (=> b!951656 m!883881))

(declare-fun m!883883 () Bool)

(assert (=> d!115373 m!883883))

(declare-fun m!883885 () Bool)

(assert (=> d!115373 m!883885))

(assert (=> d!115373 m!883885))

(declare-fun m!883887 () Bool)

(assert (=> d!115373 m!883887))

(assert (=> d!115373 m!883803))

(assert (=> b!951573 d!115373))

(declare-fun d!115375 () Bool)

(assert (=> d!115375 (= (array_inv!21496 (_keys!10752 thiss!1141)) (bvsge (size!28169 (_keys!10752 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951572 d!115375))

(declare-fun d!115377 () Bool)

(assert (=> d!115377 (= (array_inv!21497 (_values!5830 thiss!1141)) (bvsge (size!28168 (_values!5830 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951572 d!115377))

(declare-fun d!115379 () Bool)

(declare-fun e!535903 () Bool)

(assert (=> d!115379 e!535903))

(declare-fun res!637733 () Bool)

(assert (=> d!115379 (=> res!637733 e!535903)))

(declare-fun lt!428694 () Bool)

(assert (=> d!115379 (= res!637733 (not lt!428694))))

(declare-fun lt!428696 () Bool)

(assert (=> d!115379 (= lt!428694 lt!428696)))

(declare-fun lt!428695 () Unit!32025)

(declare-fun e!535904 () Unit!32025)

(assert (=> d!115379 (= lt!428695 e!535904)))

(declare-fun c!99480 () Bool)

(assert (=> d!115379 (= c!99480 lt!428696)))

(declare-fun containsKey!469 (List!19357 (_ BitVec 64)) Bool)

(assert (=> d!115379 (= lt!428696 (containsKey!469 (toList!6151 (getCurrentListMap!3384 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5807 thiss!1141))) key!756))))

(assert (=> d!115379 (= (contains!5244 (getCurrentListMap!3384 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5807 thiss!1141)) key!756) lt!428694)))

(declare-fun b!951664 () Bool)

(declare-fun lt!428697 () Unit!32025)

(assert (=> b!951664 (= e!535904 lt!428697)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!365 (List!19357 (_ BitVec 64)) Unit!32025)

(assert (=> b!951664 (= lt!428697 (lemmaContainsKeyImpliesGetValueByKeyDefined!365 (toList!6151 (getCurrentListMap!3384 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5807 thiss!1141))) key!756))))

(declare-datatypes ((Option!508 0))(
  ( (Some!507 (v!12991 V!32673)) (None!506) )
))
(declare-fun isDefined!374 (Option!508) Bool)

(declare-fun getValueByKey!502 (List!19357 (_ BitVec 64)) Option!508)

(assert (=> b!951664 (isDefined!374 (getValueByKey!502 (toList!6151 (getCurrentListMap!3384 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5807 thiss!1141))) key!756))))

(declare-fun b!951665 () Bool)

(declare-fun Unit!32027 () Unit!32025)

(assert (=> b!951665 (= e!535904 Unit!32027)))

(declare-fun b!951666 () Bool)

(assert (=> b!951666 (= e!535903 (isDefined!374 (getValueByKey!502 (toList!6151 (getCurrentListMap!3384 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5807 thiss!1141))) key!756)))))

(assert (= (and d!115379 c!99480) b!951664))

(assert (= (and d!115379 (not c!99480)) b!951665))

(assert (= (and d!115379 (not res!637733)) b!951666))

(declare-fun m!883889 () Bool)

(assert (=> d!115379 m!883889))

(declare-fun m!883891 () Bool)

(assert (=> b!951664 m!883891))

(declare-fun m!883893 () Bool)

(assert (=> b!951664 m!883893))

(assert (=> b!951664 m!883893))

(declare-fun m!883895 () Bool)

(assert (=> b!951664 m!883895))

(assert (=> b!951666 m!883893))

(assert (=> b!951666 m!883893))

(assert (=> b!951666 m!883895))

(assert (=> b!951574 d!115379))

(declare-fun b!951709 () Bool)

(declare-fun e!535940 () Bool)

(declare-fun call!41508 () Bool)

(assert (=> b!951709 (= e!535940 (not call!41508))))

(declare-fun b!951710 () Bool)

(declare-fun e!535938 () ListLongMap!12271)

(declare-fun call!41510 () ListLongMap!12271)

(assert (=> b!951710 (= e!535938 call!41510)))

(declare-fun b!951711 () Bool)

(declare-fun e!535942 () Bool)

(declare-fun e!535943 () Bool)

(assert (=> b!951711 (= e!535942 e!535943)))

(declare-fun res!637753 () Bool)

(declare-fun call!41513 () Bool)

(assert (=> b!951711 (= res!637753 call!41513)))

(assert (=> b!951711 (=> (not res!637753) (not e!535943))))

(declare-fun d!115381 () Bool)

(declare-fun e!535933 () Bool)

(assert (=> d!115381 e!535933))

(declare-fun res!637759 () Bool)

(assert (=> d!115381 (=> (not res!637759) (not e!535933))))

(assert (=> d!115381 (= res!637759 (or (bvsge #b00000000000000000000000000000000 (size!28169 (_keys!10752 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28169 (_keys!10752 thiss!1141))))))))

(declare-fun lt!428757 () ListLongMap!12271)

(declare-fun lt!428745 () ListLongMap!12271)

(assert (=> d!115381 (= lt!428757 lt!428745)))

(declare-fun lt!428752 () Unit!32025)

(declare-fun e!535941 () Unit!32025)

(assert (=> d!115381 (= lt!428752 e!535941)))

(declare-fun c!99498 () Bool)

(declare-fun e!535931 () Bool)

(assert (=> d!115381 (= c!99498 e!535931)))

(declare-fun res!637757 () Bool)

(assert (=> d!115381 (=> (not res!637757) (not e!535931))))

(assert (=> d!115381 (= res!637757 (bvslt #b00000000000000000000000000000000 (size!28169 (_keys!10752 thiss!1141))))))

(declare-fun e!535934 () ListLongMap!12271)

(assert (=> d!115381 (= lt!428745 e!535934)))

(declare-fun c!99496 () Bool)

(assert (=> d!115381 (= c!99496 (and (not (= (bvand (extraKeys!5539 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5539 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115381 (validMask!0 (mask!27632 thiss!1141))))

(assert (=> d!115381 (= (getCurrentListMap!3384 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5807 thiss!1141)) lt!428757)))

(declare-fun b!951712 () Bool)

(declare-fun e!535937 () Bool)

(declare-fun e!535939 () Bool)

(assert (=> b!951712 (= e!535937 e!535939)))

(declare-fun res!637758 () Bool)

(assert (=> b!951712 (=> (not res!637758) (not e!535939))))

(assert (=> b!951712 (= res!637758 (contains!5244 lt!428757 (select (arr!27691 (_keys!10752 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951712 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28169 (_keys!10752 thiss!1141))))))

(declare-fun b!951713 () Bool)

(declare-fun apply!883 (ListLongMap!12271 (_ BitVec 64)) V!32673)

(assert (=> b!951713 (= e!535943 (= (apply!883 lt!428757 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5643 thiss!1141)))))

(declare-fun bm!41505 () Bool)

(assert (=> bm!41505 (= call!41508 (contains!5244 lt!428757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41506 () Bool)

(declare-fun call!41512 () ListLongMap!12271)

(declare-fun call!41511 () ListLongMap!12271)

(assert (=> bm!41506 (= call!41512 call!41511)))

(declare-fun b!951714 () Bool)

(declare-fun e!535932 () Bool)

(assert (=> b!951714 (= e!535932 (validKeyInArray!0 (select (arr!27691 (_keys!10752 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951715 () Bool)

(declare-fun e!535935 () ListLongMap!12271)

(assert (=> b!951715 (= e!535934 e!535935)))

(declare-fun c!99495 () Bool)

(assert (=> b!951715 (= c!99495 (and (not (= (bvand (extraKeys!5539 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5539 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951716 () Bool)

(assert (=> b!951716 (= e!535933 e!535942)))

(declare-fun c!99497 () Bool)

(assert (=> b!951716 (= c!99497 (not (= (bvand (extraKeys!5539 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951717 () Bool)

(declare-fun e!535936 () Bool)

(assert (=> b!951717 (= e!535936 (= (apply!883 lt!428757 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5643 thiss!1141)))))

(declare-fun b!951718 () Bool)

(assert (=> b!951718 (= e!535931 (validKeyInArray!0 (select (arr!27691 (_keys!10752 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951719 () Bool)

(declare-fun get!14553 (ValueCell!9909 V!32673) V!32673)

(declare-fun dynLambda!1656 (Int (_ BitVec 64)) V!32673)

(assert (=> b!951719 (= e!535939 (= (apply!883 lt!428757 (select (arr!27691 (_keys!10752 thiss!1141)) #b00000000000000000000000000000000)) (get!14553 (select (arr!27690 (_values!5830 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1656 (defaultEntry!5807 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951719 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28168 (_values!5830 thiss!1141))))))

(assert (=> b!951719 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28169 (_keys!10752 thiss!1141))))))

(declare-fun bm!41507 () Bool)

(assert (=> bm!41507 (= call!41510 call!41512)))

(declare-fun b!951720 () Bool)

(declare-fun call!41514 () ListLongMap!12271)

(declare-fun +!2867 (ListLongMap!12271 tuple2!13574) ListLongMap!12271)

(assert (=> b!951720 (= e!535934 (+!2867 call!41514 (tuple2!13575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5643 thiss!1141))))))

(declare-fun b!951721 () Bool)

(assert (=> b!951721 (= e!535940 e!535936)))

(declare-fun res!637755 () Bool)

(assert (=> b!951721 (= res!637755 call!41508)))

(assert (=> b!951721 (=> (not res!637755) (not e!535936))))

(declare-fun b!951722 () Bool)

(declare-fun c!99493 () Bool)

(assert (=> b!951722 (= c!99493 (and (not (= (bvand (extraKeys!5539 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5539 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!951722 (= e!535935 e!535938)))

(declare-fun bm!41508 () Bool)

(assert (=> bm!41508 (= call!41513 (contains!5244 lt!428757 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951723 () Bool)

(declare-fun Unit!32028 () Unit!32025)

(assert (=> b!951723 (= e!535941 Unit!32028)))

(declare-fun bm!41509 () Bool)

(assert (=> bm!41509 (= call!41514 (+!2867 (ite c!99496 call!41511 (ite c!99495 call!41512 call!41510)) (ite (or c!99496 c!99495) (tuple2!13575 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5643 thiss!1141)) (tuple2!13575 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5643 thiss!1141)))))))

(declare-fun bm!41510 () Bool)

(declare-fun call!41509 () ListLongMap!12271)

(assert (=> bm!41510 (= call!41509 call!41514)))

(declare-fun b!951724 () Bool)

(declare-fun res!637752 () Bool)

(assert (=> b!951724 (=> (not res!637752) (not e!535933))))

(assert (=> b!951724 (= res!637752 e!535940)))

(declare-fun c!99494 () Bool)

(assert (=> b!951724 (= c!99494 (not (= (bvand (extraKeys!5539 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!951725 () Bool)

(assert (=> b!951725 (= e!535942 (not call!41513))))

(declare-fun b!951726 () Bool)

(assert (=> b!951726 (= e!535938 call!41509)))

(declare-fun bm!41511 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3322 (array!57592 array!57590 (_ BitVec 32) (_ BitVec 32) V!32673 V!32673 (_ BitVec 32) Int) ListLongMap!12271)

(assert (=> bm!41511 (= call!41511 (getCurrentListMapNoExtraKeys!3322 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5807 thiss!1141)))))

(declare-fun b!951727 () Bool)

(assert (=> b!951727 (= e!535935 call!41509)))

(declare-fun b!951728 () Bool)

(declare-fun res!637760 () Bool)

(assert (=> b!951728 (=> (not res!637760) (not e!535933))))

(assert (=> b!951728 (= res!637760 e!535937)))

(declare-fun res!637754 () Bool)

(assert (=> b!951728 (=> res!637754 e!535937)))

(assert (=> b!951728 (= res!637754 (not e!535932))))

(declare-fun res!637756 () Bool)

(assert (=> b!951728 (=> (not res!637756) (not e!535932))))

(assert (=> b!951728 (= res!637756 (bvslt #b00000000000000000000000000000000 (size!28169 (_keys!10752 thiss!1141))))))

(declare-fun b!951729 () Bool)

(declare-fun lt!428758 () Unit!32025)

(assert (=> b!951729 (= e!535941 lt!428758)))

(declare-fun lt!428756 () ListLongMap!12271)

(assert (=> b!951729 (= lt!428756 (getCurrentListMapNoExtraKeys!3322 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5807 thiss!1141)))))

(declare-fun lt!428763 () (_ BitVec 64))

(assert (=> b!951729 (= lt!428763 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428742 () (_ BitVec 64))

(assert (=> b!951729 (= lt!428742 (select (arr!27691 (_keys!10752 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428750 () Unit!32025)

(declare-fun addStillContains!586 (ListLongMap!12271 (_ BitVec 64) V!32673 (_ BitVec 64)) Unit!32025)

(assert (=> b!951729 (= lt!428750 (addStillContains!586 lt!428756 lt!428763 (zeroValue!5643 thiss!1141) lt!428742))))

(assert (=> b!951729 (contains!5244 (+!2867 lt!428756 (tuple2!13575 lt!428763 (zeroValue!5643 thiss!1141))) lt!428742)))

(declare-fun lt!428748 () Unit!32025)

(assert (=> b!951729 (= lt!428748 lt!428750)))

(declare-fun lt!428759 () ListLongMap!12271)

(assert (=> b!951729 (= lt!428759 (getCurrentListMapNoExtraKeys!3322 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5807 thiss!1141)))))

(declare-fun lt!428753 () (_ BitVec 64))

(assert (=> b!951729 (= lt!428753 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428743 () (_ BitVec 64))

(assert (=> b!951729 (= lt!428743 (select (arr!27691 (_keys!10752 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428746 () Unit!32025)

(declare-fun addApplyDifferent!466 (ListLongMap!12271 (_ BitVec 64) V!32673 (_ BitVec 64)) Unit!32025)

(assert (=> b!951729 (= lt!428746 (addApplyDifferent!466 lt!428759 lt!428753 (minValue!5643 thiss!1141) lt!428743))))

(assert (=> b!951729 (= (apply!883 (+!2867 lt!428759 (tuple2!13575 lt!428753 (minValue!5643 thiss!1141))) lt!428743) (apply!883 lt!428759 lt!428743))))

(declare-fun lt!428747 () Unit!32025)

(assert (=> b!951729 (= lt!428747 lt!428746)))

(declare-fun lt!428760 () ListLongMap!12271)

(assert (=> b!951729 (= lt!428760 (getCurrentListMapNoExtraKeys!3322 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5807 thiss!1141)))))

(declare-fun lt!428761 () (_ BitVec 64))

(assert (=> b!951729 (= lt!428761 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428755 () (_ BitVec 64))

(assert (=> b!951729 (= lt!428755 (select (arr!27691 (_keys!10752 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428754 () Unit!32025)

(assert (=> b!951729 (= lt!428754 (addApplyDifferent!466 lt!428760 lt!428761 (zeroValue!5643 thiss!1141) lt!428755))))

(assert (=> b!951729 (= (apply!883 (+!2867 lt!428760 (tuple2!13575 lt!428761 (zeroValue!5643 thiss!1141))) lt!428755) (apply!883 lt!428760 lt!428755))))

(declare-fun lt!428751 () Unit!32025)

(assert (=> b!951729 (= lt!428751 lt!428754)))

(declare-fun lt!428749 () ListLongMap!12271)

(assert (=> b!951729 (= lt!428749 (getCurrentListMapNoExtraKeys!3322 (_keys!10752 thiss!1141) (_values!5830 thiss!1141) (mask!27632 thiss!1141) (extraKeys!5539 thiss!1141) (zeroValue!5643 thiss!1141) (minValue!5643 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5807 thiss!1141)))))

(declare-fun lt!428744 () (_ BitVec 64))

(assert (=> b!951729 (= lt!428744 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428762 () (_ BitVec 64))

(assert (=> b!951729 (= lt!428762 (select (arr!27691 (_keys!10752 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951729 (= lt!428758 (addApplyDifferent!466 lt!428749 lt!428744 (minValue!5643 thiss!1141) lt!428762))))

(assert (=> b!951729 (= (apply!883 (+!2867 lt!428749 (tuple2!13575 lt!428744 (minValue!5643 thiss!1141))) lt!428762) (apply!883 lt!428749 lt!428762))))

(assert (= (and d!115381 c!99496) b!951720))

(assert (= (and d!115381 (not c!99496)) b!951715))

(assert (= (and b!951715 c!99495) b!951727))

(assert (= (and b!951715 (not c!99495)) b!951722))

(assert (= (and b!951722 c!99493) b!951726))

(assert (= (and b!951722 (not c!99493)) b!951710))

(assert (= (or b!951726 b!951710) bm!41507))

(assert (= (or b!951727 bm!41507) bm!41506))

(assert (= (or b!951727 b!951726) bm!41510))

(assert (= (or b!951720 bm!41506) bm!41511))

(assert (= (or b!951720 bm!41510) bm!41509))

(assert (= (and d!115381 res!637757) b!951718))

(assert (= (and d!115381 c!99498) b!951729))

(assert (= (and d!115381 (not c!99498)) b!951723))

(assert (= (and d!115381 res!637759) b!951728))

(assert (= (and b!951728 res!637756) b!951714))

(assert (= (and b!951728 (not res!637754)) b!951712))

(assert (= (and b!951712 res!637758) b!951719))

(assert (= (and b!951728 res!637760) b!951724))

(assert (= (and b!951724 c!99494) b!951721))

(assert (= (and b!951724 (not c!99494)) b!951709))

(assert (= (and b!951721 res!637755) b!951717))

(assert (= (or b!951721 b!951709) bm!41505))

(assert (= (and b!951724 res!637752) b!951716))

(assert (= (and b!951716 c!99497) b!951711))

(assert (= (and b!951716 (not c!99497)) b!951725))

(assert (= (and b!951711 res!637753) b!951713))

(assert (= (or b!951711 b!951725) bm!41508))

(declare-fun b_lambda!14395 () Bool)

(assert (=> (not b_lambda!14395) (not b!951719)))

(declare-fun t!27708 () Bool)

(declare-fun tb!6201 () Bool)

(assert (=> (and b!951572 (= (defaultEntry!5807 thiss!1141) (defaultEntry!5807 thiss!1141)) t!27708) tb!6201))

(declare-fun result!12325 () Bool)

(assert (=> tb!6201 (= result!12325 tp_is_empty!20781)))

(assert (=> b!951719 t!27708))

(declare-fun b_and!29747 () Bool)

(assert (= b_and!29743 (and (=> t!27708 result!12325) b_and!29747)))

(assert (=> b!951714 m!883867))

(assert (=> b!951714 m!883867))

(declare-fun m!883897 () Bool)

(assert (=> b!951714 m!883897))

(declare-fun m!883899 () Bool)

(assert (=> b!951720 m!883899))

(declare-fun m!883901 () Bool)

(assert (=> b!951713 m!883901))

(declare-fun m!883903 () Bool)

(assert (=> b!951719 m!883903))

(assert (=> b!951719 m!883867))

(declare-fun m!883905 () Bool)

(assert (=> b!951719 m!883905))

(declare-fun m!883907 () Bool)

(assert (=> b!951719 m!883907))

(assert (=> b!951719 m!883903))

(declare-fun m!883909 () Bool)

(assert (=> b!951719 m!883909))

(assert (=> b!951719 m!883907))

(assert (=> b!951719 m!883867))

(assert (=> b!951718 m!883867))

(assert (=> b!951718 m!883867))

(assert (=> b!951718 m!883897))

(assert (=> d!115381 m!883803))

(declare-fun m!883911 () Bool)

(assert (=> b!951717 m!883911))

(declare-fun m!883913 () Bool)

(assert (=> bm!41508 m!883913))

(assert (=> b!951712 m!883867))

(assert (=> b!951712 m!883867))

(declare-fun m!883915 () Bool)

(assert (=> b!951712 m!883915))

(declare-fun m!883917 () Bool)

(assert (=> bm!41509 m!883917))

(declare-fun m!883919 () Bool)

(assert (=> b!951729 m!883919))

(assert (=> b!951729 m!883867))

(declare-fun m!883921 () Bool)

(assert (=> b!951729 m!883921))

(declare-fun m!883923 () Bool)

(assert (=> b!951729 m!883923))

(declare-fun m!883925 () Bool)

(assert (=> b!951729 m!883925))

(declare-fun m!883927 () Bool)

(assert (=> b!951729 m!883927))

(declare-fun m!883929 () Bool)

(assert (=> b!951729 m!883929))

(assert (=> b!951729 m!883923))

(declare-fun m!883931 () Bool)

(assert (=> b!951729 m!883931))

(declare-fun m!883933 () Bool)

(assert (=> b!951729 m!883933))

(declare-fun m!883935 () Bool)

(assert (=> b!951729 m!883935))

(declare-fun m!883937 () Bool)

(assert (=> b!951729 m!883937))

(declare-fun m!883939 () Bool)

(assert (=> b!951729 m!883939))

(assert (=> b!951729 m!883933))

(assert (=> b!951729 m!883929))

(declare-fun m!883941 () Bool)

(assert (=> b!951729 m!883941))

(declare-fun m!883943 () Bool)

(assert (=> b!951729 m!883943))

(assert (=> b!951729 m!883927))

(declare-fun m!883945 () Bool)

(assert (=> b!951729 m!883945))

(declare-fun m!883947 () Bool)

(assert (=> b!951729 m!883947))

(declare-fun m!883949 () Bool)

(assert (=> b!951729 m!883949))

(assert (=> bm!41511 m!883925))

(declare-fun m!883951 () Bool)

(assert (=> bm!41505 m!883951))

(assert (=> b!951574 d!115381))

(declare-fun mapIsEmpty!33105 () Bool)

(declare-fun mapRes!33105 () Bool)

(assert (=> mapIsEmpty!33105 mapRes!33105))

(declare-fun mapNonEmpty!33105 () Bool)

(declare-fun tp!63440 () Bool)

(declare-fun e!535948 () Bool)

(assert (=> mapNonEmpty!33105 (= mapRes!33105 (and tp!63440 e!535948))))

(declare-fun mapValue!33105 () ValueCell!9909)

(declare-fun mapRest!33105 () (Array (_ BitVec 32) ValueCell!9909))

(declare-fun mapKey!33105 () (_ BitVec 32))

(assert (=> mapNonEmpty!33105 (= mapRest!33099 (store mapRest!33105 mapKey!33105 mapValue!33105))))

(declare-fun condMapEmpty!33105 () Bool)

(declare-fun mapDefault!33105 () ValueCell!9909)

(assert (=> mapNonEmpty!33099 (= condMapEmpty!33105 (= mapRest!33099 ((as const (Array (_ BitVec 32) ValueCell!9909)) mapDefault!33105)))))

(declare-fun e!535949 () Bool)

(assert (=> mapNonEmpty!33099 (= tp!63431 (and e!535949 mapRes!33105))))

(declare-fun b!951738 () Bool)

(assert (=> b!951738 (= e!535948 tp_is_empty!20781)))

(declare-fun b!951739 () Bool)

(assert (=> b!951739 (= e!535949 tp_is_empty!20781)))

(assert (= (and mapNonEmpty!33099 condMapEmpty!33105) mapIsEmpty!33105))

(assert (= (and mapNonEmpty!33099 (not condMapEmpty!33105)) mapNonEmpty!33105))

(assert (= (and mapNonEmpty!33105 ((_ is ValueCellFull!9909) mapValue!33105)) b!951738))

(assert (= (and mapNonEmpty!33099 ((_ is ValueCellFull!9909) mapDefault!33105)) b!951739))

(declare-fun m!883953 () Bool)

(assert (=> mapNonEmpty!33105 m!883953))

(declare-fun b_lambda!14397 () Bool)

(assert (= b_lambda!14395 (or (and b!951572 b_free!18273) b_lambda!14397)))

(check-sat (not bm!41505) (not b!951713) (not b!951618) (not d!115359) (not b!951655) (not b!951720) (not b!951712) (not b_lambda!14397) (not bm!41490) (not b_next!18273) (not b!951717) (not bm!41509) (not b!951719) (not mapNonEmpty!33105) (not b!951664) (not d!115373) (not b!951619) (not d!115369) (not b!951639) (not b!951714) (not b!951666) tp_is_empty!20781 (not bm!41508) (not b!951729) (not b!951607) (not b!951609) (not b!951632) (not d!115365) (not b!951718) (not b!951627) (not bm!41511) (not d!115379) (not d!115381) b_and!29747 (not b!951608))
(check-sat b_and!29747 (not b_next!18273))
