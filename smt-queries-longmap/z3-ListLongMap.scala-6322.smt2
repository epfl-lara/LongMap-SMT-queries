; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81464 () Bool)

(assert start!81464)

(declare-fun b!951805 () Bool)

(declare-fun b_free!18253 () Bool)

(declare-fun b_next!18253 () Bool)

(assert (=> b!951805 (= b_free!18253 (not b_next!18253))))

(declare-fun tp!63363 () Bool)

(declare-fun b_and!29727 () Bool)

(assert (=> b!951805 (= tp!63363 b_and!29727)))

(declare-fun res!637747 () Bool)

(declare-fun e!535987 () Bool)

(assert (=> start!81464 (=> (not res!637747) (not e!535987))))

(declare-datatypes ((V!32647 0))(
  ( (V!32648 (val!10431 Int)) )
))
(declare-datatypes ((ValueCell!9899 0))(
  ( (ValueCellFull!9899 (v!12973 V!32647)) (EmptyCell!9899) )
))
(declare-datatypes ((array!57595 0))(
  ( (array!57596 (arr!27691 (Array (_ BitVec 32) ValueCell!9899)) (size!28170 (_ BitVec 32))) )
))
(declare-datatypes ((array!57597 0))(
  ( (array!57598 (arr!27692 (Array (_ BitVec 32) (_ BitVec 64))) (size!28171 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4948 0))(
  ( (LongMapFixedSize!4949 (defaultEntry!5791 Int) (mask!27646 (_ BitVec 32)) (extraKeys!5523 (_ BitVec 32)) (zeroValue!5627 V!32647) (minValue!5627 V!32647) (_size!2529 (_ BitVec 32)) (_keys!10760 array!57597) (_values!5814 array!57595) (_vacant!2529 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4948)

(declare-fun valid!1893 (LongMapFixedSize!4948) Bool)

(assert (=> start!81464 (= res!637747 (valid!1893 thiss!1141))))

(assert (=> start!81464 e!535987))

(declare-fun e!535990 () Bool)

(assert (=> start!81464 e!535990))

(assert (=> start!81464 true))

(declare-fun e!535986 () Bool)

(declare-fun tp_is_empty!20761 () Bool)

(declare-fun array_inv!21574 (array!57597) Bool)

(declare-fun array_inv!21575 (array!57595) Bool)

(assert (=> b!951805 (= e!535990 (and tp!63363 tp_is_empty!20761 (array_inv!21574 (_keys!10760 thiss!1141)) (array_inv!21575 (_values!5814 thiss!1141)) e!535986))))

(declare-fun b!951806 () Bool)

(declare-fun e!535985 () Bool)

(assert (=> b!951806 (= e!535985 (or (not (= (size!28171 (_keys!10760 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27646 thiss!1141)))) (bvsle #b00000000000000000000000000000000 (size!28171 (_keys!10760 thiss!1141)))))))

(declare-fun b!951807 () Bool)

(declare-fun res!637746 () Bool)

(assert (=> b!951807 (=> (not res!637746) (not e!535987))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9107 0))(
  ( (MissingZero!9107 (index!38799 (_ BitVec 32))) (Found!9107 (index!38800 (_ BitVec 32))) (Intermediate!9107 (undefined!9919 Bool) (index!38801 (_ BitVec 32)) (x!81783 (_ BitVec 32))) (Undefined!9107) (MissingVacant!9107 (index!38802 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57597 (_ BitVec 32)) SeekEntryResult!9107)

(assert (=> b!951807 (= res!637746 (not ((_ is Found!9107) (seekEntry!0 key!756 (_keys!10760 thiss!1141) (mask!27646 thiss!1141)))))))

(declare-fun b!951808 () Bool)

(declare-fun res!637745 () Bool)

(assert (=> b!951808 (=> (not res!637745) (not e!535987))))

(declare-datatypes ((tuple2!13540 0))(
  ( (tuple2!13541 (_1!6781 (_ BitVec 64)) (_2!6781 V!32647)) )
))
(declare-datatypes ((List!19334 0))(
  ( (Nil!19331) (Cons!19330 (h!20497 tuple2!13540) (t!27669 List!19334)) )
))
(declare-datatypes ((ListLongMap!12239 0))(
  ( (ListLongMap!12240 (toList!6135 List!19334)) )
))
(declare-fun contains!5239 (ListLongMap!12239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3368 (array!57597 array!57595 (_ BitVec 32) (_ BitVec 32) V!32647 V!32647 (_ BitVec 32) Int) ListLongMap!12239)

(assert (=> b!951808 (= res!637745 (contains!5239 (getCurrentListMap!3368 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)) key!756))))

(declare-fun b!951809 () Bool)

(declare-fun e!535988 () Bool)

(assert (=> b!951809 (= e!535988 tp_is_empty!20761)))

(declare-fun b!951810 () Bool)

(declare-fun e!535989 () Bool)

(declare-fun mapRes!33060 () Bool)

(assert (=> b!951810 (= e!535986 (and e!535989 mapRes!33060))))

(declare-fun condMapEmpty!33060 () Bool)

(declare-fun mapDefault!33060 () ValueCell!9899)

(assert (=> b!951810 (= condMapEmpty!33060 (= (arr!27691 (_values!5814 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9899)) mapDefault!33060)))))

(declare-fun mapNonEmpty!33060 () Bool)

(declare-fun tp!63362 () Bool)

(assert (=> mapNonEmpty!33060 (= mapRes!33060 (and tp!63362 e!535988))))

(declare-fun mapValue!33060 () ValueCell!9899)

(declare-fun mapKey!33060 () (_ BitVec 32))

(declare-fun mapRest!33060 () (Array (_ BitVec 32) ValueCell!9899))

(assert (=> mapNonEmpty!33060 (= (arr!27691 (_values!5814 thiss!1141)) (store mapRest!33060 mapKey!33060 mapValue!33060))))

(declare-fun b!951811 () Bool)

(assert (=> b!951811 (= e!535989 tp_is_empty!20761)))

(declare-fun mapIsEmpty!33060 () Bool)

(assert (=> mapIsEmpty!33060 mapRes!33060))

(declare-fun b!951812 () Bool)

(assert (=> b!951812 (= e!535987 (not e!535985))))

(declare-fun res!637744 () Bool)

(assert (=> b!951812 (=> res!637744 e!535985)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951812 (= res!637744 (not (validMask!0 (mask!27646 thiss!1141))))))

(declare-fun lt!428644 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57597 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951812 (= lt!428644 (arrayScanForKey!0 (_keys!10760 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951812 (arrayContainsKey!0 (_keys!10760 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31984 0))(
  ( (Unit!31985) )
))
(declare-fun lt!428643 () Unit!31984)

(declare-fun lemmaKeyInListMapIsInArray!320 (array!57597 array!57595 (_ BitVec 32) (_ BitVec 32) V!32647 V!32647 (_ BitVec 64) Int) Unit!31984)

(assert (=> b!951812 (= lt!428643 (lemmaKeyInListMapIsInArray!320 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) key!756 (defaultEntry!5791 thiss!1141)))))

(declare-fun b!951813 () Bool)

(declare-fun res!637743 () Bool)

(assert (=> b!951813 (=> (not res!637743) (not e!535987))))

(assert (=> b!951813 (= res!637743 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!81464 res!637747) b!951813))

(assert (= (and b!951813 res!637743) b!951807))

(assert (= (and b!951807 res!637746) b!951808))

(assert (= (and b!951808 res!637745) b!951812))

(assert (= (and b!951812 (not res!637744)) b!951806))

(assert (= (and b!951810 condMapEmpty!33060) mapIsEmpty!33060))

(assert (= (and b!951810 (not condMapEmpty!33060)) mapNonEmpty!33060))

(assert (= (and mapNonEmpty!33060 ((_ is ValueCellFull!9899) mapValue!33060)) b!951809))

(assert (= (and b!951810 ((_ is ValueCellFull!9899) mapDefault!33060)) b!951811))

(assert (= b!951805 b!951810))

(assert (= start!81464 b!951805))

(declare-fun m!884571 () Bool)

(assert (=> b!951812 m!884571))

(declare-fun m!884573 () Bool)

(assert (=> b!951812 m!884573))

(declare-fun m!884575 () Bool)

(assert (=> b!951812 m!884575))

(declare-fun m!884577 () Bool)

(assert (=> b!951812 m!884577))

(declare-fun m!884579 () Bool)

(assert (=> b!951808 m!884579))

(assert (=> b!951808 m!884579))

(declare-fun m!884581 () Bool)

(assert (=> b!951808 m!884581))

(declare-fun m!884583 () Bool)

(assert (=> b!951805 m!884583))

(declare-fun m!884585 () Bool)

(assert (=> b!951805 m!884585))

(declare-fun m!884587 () Bool)

(assert (=> mapNonEmpty!33060 m!884587))

(declare-fun m!884589 () Bool)

(assert (=> b!951807 m!884589))

(declare-fun m!884591 () Bool)

(assert (=> start!81464 m!884591))

(check-sat (not mapNonEmpty!33060) (not b!951807) (not b_next!18253) (not b!951805) b_and!29727 (not b!951812) tp_is_empty!20761 (not start!81464) (not b!951808))
(check-sat b_and!29727 (not b_next!18253))
(get-model)

(declare-fun d!115613 () Bool)

(assert (=> d!115613 (= (validMask!0 (mask!27646 thiss!1141)) (and (or (= (mask!27646 thiss!1141) #b00000000000000000000000000000111) (= (mask!27646 thiss!1141) #b00000000000000000000000000001111) (= (mask!27646 thiss!1141) #b00000000000000000000000000011111) (= (mask!27646 thiss!1141) #b00000000000000000000000000111111) (= (mask!27646 thiss!1141) #b00000000000000000000000001111111) (= (mask!27646 thiss!1141) #b00000000000000000000000011111111) (= (mask!27646 thiss!1141) #b00000000000000000000000111111111) (= (mask!27646 thiss!1141) #b00000000000000000000001111111111) (= (mask!27646 thiss!1141) #b00000000000000000000011111111111) (= (mask!27646 thiss!1141) #b00000000000000000000111111111111) (= (mask!27646 thiss!1141) #b00000000000000000001111111111111) (= (mask!27646 thiss!1141) #b00000000000000000011111111111111) (= (mask!27646 thiss!1141) #b00000000000000000111111111111111) (= (mask!27646 thiss!1141) #b00000000000000001111111111111111) (= (mask!27646 thiss!1141) #b00000000000000011111111111111111) (= (mask!27646 thiss!1141) #b00000000000000111111111111111111) (= (mask!27646 thiss!1141) #b00000000000001111111111111111111) (= (mask!27646 thiss!1141) #b00000000000011111111111111111111) (= (mask!27646 thiss!1141) #b00000000000111111111111111111111) (= (mask!27646 thiss!1141) #b00000000001111111111111111111111) (= (mask!27646 thiss!1141) #b00000000011111111111111111111111) (= (mask!27646 thiss!1141) #b00000000111111111111111111111111) (= (mask!27646 thiss!1141) #b00000001111111111111111111111111) (= (mask!27646 thiss!1141) #b00000011111111111111111111111111) (= (mask!27646 thiss!1141) #b00000111111111111111111111111111) (= (mask!27646 thiss!1141) #b00001111111111111111111111111111) (= (mask!27646 thiss!1141) #b00011111111111111111111111111111) (= (mask!27646 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27646 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!951812 d!115613))

(declare-fun d!115615 () Bool)

(declare-fun lt!428659 () (_ BitVec 32))

(assert (=> d!115615 (and (or (bvslt lt!428659 #b00000000000000000000000000000000) (bvsge lt!428659 (size!28171 (_keys!10760 thiss!1141))) (and (bvsge lt!428659 #b00000000000000000000000000000000) (bvslt lt!428659 (size!28171 (_keys!10760 thiss!1141))))) (bvsge lt!428659 #b00000000000000000000000000000000) (bvslt lt!428659 (size!28171 (_keys!10760 thiss!1141))) (= (select (arr!27692 (_keys!10760 thiss!1141)) lt!428659) key!756))))

(declare-fun e!536036 () (_ BitVec 32))

(assert (=> d!115615 (= lt!428659 e!536036)))

(declare-fun c!99633 () Bool)

(assert (=> d!115615 (= c!99633 (= (select (arr!27692 (_keys!10760 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115615 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28171 (_keys!10760 thiss!1141))) (bvslt (size!28171 (_keys!10760 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115615 (= (arrayScanForKey!0 (_keys!10760 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428659)))

(declare-fun b!951872 () Bool)

(assert (=> b!951872 (= e!536036 #b00000000000000000000000000000000)))

(declare-fun b!951873 () Bool)

(assert (=> b!951873 (= e!536036 (arrayScanForKey!0 (_keys!10760 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115615 c!99633) b!951872))

(assert (= (and d!115615 (not c!99633)) b!951873))

(declare-fun m!884637 () Bool)

(assert (=> d!115615 m!884637))

(declare-fun m!884639 () Bool)

(assert (=> d!115615 m!884639))

(declare-fun m!884641 () Bool)

(assert (=> b!951873 m!884641))

(assert (=> b!951812 d!115615))

(declare-fun d!115617 () Bool)

(declare-fun res!637782 () Bool)

(declare-fun e!536041 () Bool)

(assert (=> d!115617 (=> res!637782 e!536041)))

(assert (=> d!115617 (= res!637782 (= (select (arr!27692 (_keys!10760 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115617 (= (arrayContainsKey!0 (_keys!10760 thiss!1141) key!756 #b00000000000000000000000000000000) e!536041)))

(declare-fun b!951878 () Bool)

(declare-fun e!536042 () Bool)

(assert (=> b!951878 (= e!536041 e!536042)))

(declare-fun res!637783 () Bool)

(assert (=> b!951878 (=> (not res!637783) (not e!536042))))

(assert (=> b!951878 (= res!637783 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28171 (_keys!10760 thiss!1141))))))

(declare-fun b!951879 () Bool)

(assert (=> b!951879 (= e!536042 (arrayContainsKey!0 (_keys!10760 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115617 (not res!637782)) b!951878))

(assert (= (and b!951878 res!637783) b!951879))

(assert (=> d!115617 m!884639))

(declare-fun m!884643 () Bool)

(assert (=> b!951879 m!884643))

(assert (=> b!951812 d!115617))

(declare-fun d!115619 () Bool)

(declare-fun e!536045 () Bool)

(assert (=> d!115619 e!536045))

(declare-fun c!99636 () Bool)

(assert (=> d!115619 (= c!99636 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428662 () Unit!31984)

(declare-fun choose!1595 (array!57597 array!57595 (_ BitVec 32) (_ BitVec 32) V!32647 V!32647 (_ BitVec 64) Int) Unit!31984)

(assert (=> d!115619 (= lt!428662 (choose!1595 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) key!756 (defaultEntry!5791 thiss!1141)))))

(assert (=> d!115619 (validMask!0 (mask!27646 thiss!1141))))

(assert (=> d!115619 (= (lemmaKeyInListMapIsInArray!320 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) key!756 (defaultEntry!5791 thiss!1141)) lt!428662)))

(declare-fun b!951884 () Bool)

(assert (=> b!951884 (= e!536045 (arrayContainsKey!0 (_keys!10760 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!951885 () Bool)

(assert (=> b!951885 (= e!536045 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115619 c!99636) b!951884))

(assert (= (and d!115619 (not c!99636)) b!951885))

(declare-fun m!884645 () Bool)

(assert (=> d!115619 m!884645))

(assert (=> d!115619 m!884571))

(assert (=> b!951884 m!884575))

(assert (=> b!951812 d!115619))

(declare-fun d!115621 () Bool)

(assert (=> d!115621 (= (array_inv!21574 (_keys!10760 thiss!1141)) (bvsge (size!28171 (_keys!10760 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951805 d!115621))

(declare-fun d!115623 () Bool)

(assert (=> d!115623 (= (array_inv!21575 (_values!5814 thiss!1141)) (bvsge (size!28170 (_values!5814 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951805 d!115623))

(declare-fun d!115625 () Bool)

(declare-fun res!637790 () Bool)

(declare-fun e!536048 () Bool)

(assert (=> d!115625 (=> (not res!637790) (not e!536048))))

(declare-fun simpleValid!376 (LongMapFixedSize!4948) Bool)

(assert (=> d!115625 (= res!637790 (simpleValid!376 thiss!1141))))

(assert (=> d!115625 (= (valid!1893 thiss!1141) e!536048)))

(declare-fun b!951892 () Bool)

(declare-fun res!637791 () Bool)

(assert (=> b!951892 (=> (not res!637791) (not e!536048))))

(declare-fun arrayCountValidKeys!0 (array!57597 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951892 (= res!637791 (= (arrayCountValidKeys!0 (_keys!10760 thiss!1141) #b00000000000000000000000000000000 (size!28171 (_keys!10760 thiss!1141))) (_size!2529 thiss!1141)))))

(declare-fun b!951893 () Bool)

(declare-fun res!637792 () Bool)

(assert (=> b!951893 (=> (not res!637792) (not e!536048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57597 (_ BitVec 32)) Bool)

(assert (=> b!951893 (= res!637792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10760 thiss!1141) (mask!27646 thiss!1141)))))

(declare-fun b!951894 () Bool)

(declare-datatypes ((List!19337 0))(
  ( (Nil!19334) (Cons!19333 (h!20500 (_ BitVec 64)) (t!27674 List!19337)) )
))
(declare-fun arrayNoDuplicates!0 (array!57597 (_ BitVec 32) List!19337) Bool)

(assert (=> b!951894 (= e!536048 (arrayNoDuplicates!0 (_keys!10760 thiss!1141) #b00000000000000000000000000000000 Nil!19334))))

(assert (= (and d!115625 res!637790) b!951892))

(assert (= (and b!951892 res!637791) b!951893))

(assert (= (and b!951893 res!637792) b!951894))

(declare-fun m!884647 () Bool)

(assert (=> d!115625 m!884647))

(declare-fun m!884649 () Bool)

(assert (=> b!951892 m!884649))

(declare-fun m!884651 () Bool)

(assert (=> b!951893 m!884651))

(declare-fun m!884653 () Bool)

(assert (=> b!951894 m!884653))

(assert (=> start!81464 d!115625))

(declare-fun d!115627 () Bool)

(declare-fun e!536054 () Bool)

(assert (=> d!115627 e!536054))

(declare-fun res!637795 () Bool)

(assert (=> d!115627 (=> res!637795 e!536054)))

(declare-fun lt!428672 () Bool)

(assert (=> d!115627 (= res!637795 (not lt!428672))))

(declare-fun lt!428674 () Bool)

(assert (=> d!115627 (= lt!428672 lt!428674)))

(declare-fun lt!428673 () Unit!31984)

(declare-fun e!536053 () Unit!31984)

(assert (=> d!115627 (= lt!428673 e!536053)))

(declare-fun c!99639 () Bool)

(assert (=> d!115627 (= c!99639 lt!428674)))

(declare-fun containsKey!468 (List!19334 (_ BitVec 64)) Bool)

(assert (=> d!115627 (= lt!428674 (containsKey!468 (toList!6135 (getCurrentListMap!3368 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141))) key!756))))

(assert (=> d!115627 (= (contains!5239 (getCurrentListMap!3368 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)) key!756) lt!428672)))

(declare-fun b!951901 () Bool)

(declare-fun lt!428671 () Unit!31984)

(assert (=> b!951901 (= e!536053 lt!428671)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!362 (List!19334 (_ BitVec 64)) Unit!31984)

(assert (=> b!951901 (= lt!428671 (lemmaContainsKeyImpliesGetValueByKeyDefined!362 (toList!6135 (getCurrentListMap!3368 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141))) key!756))))

(declare-datatypes ((Option!503 0))(
  ( (Some!502 (v!12976 V!32647)) (None!501) )
))
(declare-fun isDefined!370 (Option!503) Bool)

(declare-fun getValueByKey!497 (List!19334 (_ BitVec 64)) Option!503)

(assert (=> b!951901 (isDefined!370 (getValueByKey!497 (toList!6135 (getCurrentListMap!3368 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141))) key!756))))

(declare-fun b!951902 () Bool)

(declare-fun Unit!31988 () Unit!31984)

(assert (=> b!951902 (= e!536053 Unit!31988)))

(declare-fun b!951903 () Bool)

(assert (=> b!951903 (= e!536054 (isDefined!370 (getValueByKey!497 (toList!6135 (getCurrentListMap!3368 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141))) key!756)))))

(assert (= (and d!115627 c!99639) b!951901))

(assert (= (and d!115627 (not c!99639)) b!951902))

(assert (= (and d!115627 (not res!637795)) b!951903))

(declare-fun m!884655 () Bool)

(assert (=> d!115627 m!884655))

(declare-fun m!884657 () Bool)

(assert (=> b!951901 m!884657))

(declare-fun m!884659 () Bool)

(assert (=> b!951901 m!884659))

(assert (=> b!951901 m!884659))

(declare-fun m!884661 () Bool)

(assert (=> b!951901 m!884661))

(assert (=> b!951903 m!884659))

(assert (=> b!951903 m!884659))

(assert (=> b!951903 m!884661))

(assert (=> b!951808 d!115627))

(declare-fun b!951946 () Bool)

(declare-fun res!637818 () Bool)

(declare-fun e!536090 () Bool)

(assert (=> b!951946 (=> (not res!637818) (not e!536090))))

(declare-fun e!536081 () Bool)

(assert (=> b!951946 (= res!637818 e!536081)))

(declare-fun c!99652 () Bool)

(assert (=> b!951946 (= c!99652 (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41481 () Bool)

(declare-fun call!41490 () ListLongMap!12239)

(declare-fun call!41486 () ListLongMap!12239)

(assert (=> bm!41481 (= call!41490 call!41486)))

(declare-fun bm!41482 () Bool)

(declare-fun call!41487 () ListLongMap!12239)

(declare-fun getCurrentListMapNoExtraKeys!3363 (array!57597 array!57595 (_ BitVec 32) (_ BitVec 32) V!32647 V!32647 (_ BitVec 32) Int) ListLongMap!12239)

(assert (=> bm!41482 (= call!41487 (getCurrentListMapNoExtraKeys!3363 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)))))

(declare-fun c!99656 () Bool)

(declare-fun call!41488 () ListLongMap!12239)

(declare-fun bm!41483 () Bool)

(declare-fun c!99655 () Bool)

(declare-fun +!2875 (ListLongMap!12239 tuple2!13540) ListLongMap!12239)

(assert (=> bm!41483 (= call!41488 (+!2875 (ite c!99656 call!41487 (ite c!99655 call!41486 call!41490)) (ite (or c!99656 c!99655) (tuple2!13541 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5627 thiss!1141)) (tuple2!13541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5627 thiss!1141)))))))

(declare-fun b!951947 () Bool)

(declare-fun e!536082 () Bool)

(declare-fun lt!428737 () ListLongMap!12239)

(declare-fun apply!889 (ListLongMap!12239 (_ BitVec 64)) V!32647)

(declare-fun get!14567 (ValueCell!9899 V!32647) V!32647)

(declare-fun dynLambda!1672 (Int (_ BitVec 64)) V!32647)

(assert (=> b!951947 (= e!536082 (= (apply!889 lt!428737 (select (arr!27692 (_keys!10760 thiss!1141)) #b00000000000000000000000000000000)) (get!14567 (select (arr!27691 (_values!5814 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1672 (defaultEntry!5791 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951947 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28170 (_values!5814 thiss!1141))))))

(assert (=> b!951947 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28171 (_keys!10760 thiss!1141))))))

(declare-fun b!951948 () Bool)

(declare-fun e!536091 () ListLongMap!12239)

(assert (=> b!951948 (= e!536091 (+!2875 call!41488 (tuple2!13541 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5627 thiss!1141))))))

(declare-fun bm!41484 () Bool)

(assert (=> bm!41484 (= call!41486 call!41487)))

(declare-fun b!951949 () Bool)

(declare-fun e!536084 () Bool)

(declare-fun e!536086 () Bool)

(assert (=> b!951949 (= e!536084 e!536086)))

(declare-fun res!637821 () Bool)

(declare-fun call!41485 () Bool)

(assert (=> b!951949 (= res!637821 call!41485)))

(assert (=> b!951949 (=> (not res!637821) (not e!536086))))

(declare-fun b!951950 () Bool)

(declare-fun call!41484 () Bool)

(assert (=> b!951950 (= e!536081 (not call!41484))))

(declare-fun b!951951 () Bool)

(assert (=> b!951951 (= e!536090 e!536084)))

(declare-fun c!99657 () Bool)

(assert (=> b!951951 (= c!99657 (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!115629 () Bool)

(assert (=> d!115629 e!536090))

(declare-fun res!637815 () Bool)

(assert (=> d!115629 (=> (not res!637815) (not e!536090))))

(assert (=> d!115629 (= res!637815 (or (bvsge #b00000000000000000000000000000000 (size!28171 (_keys!10760 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28171 (_keys!10760 thiss!1141))))))))

(declare-fun lt!428730 () ListLongMap!12239)

(assert (=> d!115629 (= lt!428737 lt!428730)))

(declare-fun lt!428725 () Unit!31984)

(declare-fun e!536085 () Unit!31984)

(assert (=> d!115629 (= lt!428725 e!536085)))

(declare-fun c!99654 () Bool)

(declare-fun e!536093 () Bool)

(assert (=> d!115629 (= c!99654 e!536093)))

(declare-fun res!637814 () Bool)

(assert (=> d!115629 (=> (not res!637814) (not e!536093))))

(assert (=> d!115629 (= res!637814 (bvslt #b00000000000000000000000000000000 (size!28171 (_keys!10760 thiss!1141))))))

(assert (=> d!115629 (= lt!428730 e!536091)))

(assert (=> d!115629 (= c!99656 (and (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115629 (validMask!0 (mask!27646 thiss!1141))))

(assert (=> d!115629 (= (getCurrentListMap!3368 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)) lt!428737)))

(declare-fun bm!41485 () Bool)

(assert (=> bm!41485 (= call!41484 (contains!5239 lt!428737 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951952 () Bool)

(declare-fun e!536092 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!951952 (= e!536092 (validKeyInArray!0 (select (arr!27692 (_keys!10760 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951953 () Bool)

(declare-fun e!536089 () Bool)

(assert (=> b!951953 (= e!536081 e!536089)))

(declare-fun res!637819 () Bool)

(assert (=> b!951953 (= res!637819 call!41484)))

(assert (=> b!951953 (=> (not res!637819) (not e!536089))))

(declare-fun bm!41486 () Bool)

(declare-fun call!41489 () ListLongMap!12239)

(assert (=> bm!41486 (= call!41489 call!41488)))

(declare-fun b!951954 () Bool)

(declare-fun e!536087 () ListLongMap!12239)

(assert (=> b!951954 (= e!536087 call!41489)))

(declare-fun b!951955 () Bool)

(assert (=> b!951955 (= e!536086 (= (apply!889 lt!428737 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5627 thiss!1141)))))

(declare-fun b!951956 () Bool)

(declare-fun Unit!31989 () Unit!31984)

(assert (=> b!951956 (= e!536085 Unit!31989)))

(declare-fun b!951957 () Bool)

(assert (=> b!951957 (= e!536093 (validKeyInArray!0 (select (arr!27692 (_keys!10760 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951958 () Bool)

(declare-fun e!536088 () ListLongMap!12239)

(assert (=> b!951958 (= e!536088 call!41490)))

(declare-fun b!951959 () Bool)

(assert (=> b!951959 (= e!536084 (not call!41485))))

(declare-fun b!951960 () Bool)

(declare-fun res!637817 () Bool)

(assert (=> b!951960 (=> (not res!637817) (not e!536090))))

(declare-fun e!536083 () Bool)

(assert (=> b!951960 (= res!637817 e!536083)))

(declare-fun res!637820 () Bool)

(assert (=> b!951960 (=> res!637820 e!536083)))

(assert (=> b!951960 (= res!637820 (not e!536092))))

(declare-fun res!637822 () Bool)

(assert (=> b!951960 (=> (not res!637822) (not e!536092))))

(assert (=> b!951960 (= res!637822 (bvslt #b00000000000000000000000000000000 (size!28171 (_keys!10760 thiss!1141))))))

(declare-fun b!951961 () Bool)

(declare-fun c!99653 () Bool)

(assert (=> b!951961 (= c!99653 (and (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!951961 (= e!536087 e!536088)))

(declare-fun bm!41487 () Bool)

(assert (=> bm!41487 (= call!41485 (contains!5239 lt!428737 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951962 () Bool)

(declare-fun lt!428731 () Unit!31984)

(assert (=> b!951962 (= e!536085 lt!428731)))

(declare-fun lt!428735 () ListLongMap!12239)

(assert (=> b!951962 (= lt!428735 (getCurrentListMapNoExtraKeys!3363 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)))))

(declare-fun lt!428719 () (_ BitVec 64))

(assert (=> b!951962 (= lt!428719 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428728 () (_ BitVec 64))

(assert (=> b!951962 (= lt!428728 (select (arr!27692 (_keys!10760 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428726 () Unit!31984)

(declare-fun addStillContains!578 (ListLongMap!12239 (_ BitVec 64) V!32647 (_ BitVec 64)) Unit!31984)

(assert (=> b!951962 (= lt!428726 (addStillContains!578 lt!428735 lt!428719 (zeroValue!5627 thiss!1141) lt!428728))))

(assert (=> b!951962 (contains!5239 (+!2875 lt!428735 (tuple2!13541 lt!428719 (zeroValue!5627 thiss!1141))) lt!428728)))

(declare-fun lt!428723 () Unit!31984)

(assert (=> b!951962 (= lt!428723 lt!428726)))

(declare-fun lt!428739 () ListLongMap!12239)

(assert (=> b!951962 (= lt!428739 (getCurrentListMapNoExtraKeys!3363 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)))))

(declare-fun lt!428727 () (_ BitVec 64))

(assert (=> b!951962 (= lt!428727 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428740 () (_ BitVec 64))

(assert (=> b!951962 (= lt!428740 (select (arr!27692 (_keys!10760 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428724 () Unit!31984)

(declare-fun addApplyDifferent!459 (ListLongMap!12239 (_ BitVec 64) V!32647 (_ BitVec 64)) Unit!31984)

(assert (=> b!951962 (= lt!428724 (addApplyDifferent!459 lt!428739 lt!428727 (minValue!5627 thiss!1141) lt!428740))))

(assert (=> b!951962 (= (apply!889 (+!2875 lt!428739 (tuple2!13541 lt!428727 (minValue!5627 thiss!1141))) lt!428740) (apply!889 lt!428739 lt!428740))))

(declare-fun lt!428721 () Unit!31984)

(assert (=> b!951962 (= lt!428721 lt!428724)))

(declare-fun lt!428733 () ListLongMap!12239)

(assert (=> b!951962 (= lt!428733 (getCurrentListMapNoExtraKeys!3363 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)))))

(declare-fun lt!428738 () (_ BitVec 64))

(assert (=> b!951962 (= lt!428738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428720 () (_ BitVec 64))

(assert (=> b!951962 (= lt!428720 (select (arr!27692 (_keys!10760 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428729 () Unit!31984)

(assert (=> b!951962 (= lt!428729 (addApplyDifferent!459 lt!428733 lt!428738 (zeroValue!5627 thiss!1141) lt!428720))))

(assert (=> b!951962 (= (apply!889 (+!2875 lt!428733 (tuple2!13541 lt!428738 (zeroValue!5627 thiss!1141))) lt!428720) (apply!889 lt!428733 lt!428720))))

(declare-fun lt!428722 () Unit!31984)

(assert (=> b!951962 (= lt!428722 lt!428729)))

(declare-fun lt!428734 () ListLongMap!12239)

(assert (=> b!951962 (= lt!428734 (getCurrentListMapNoExtraKeys!3363 (_keys!10760 thiss!1141) (_values!5814 thiss!1141) (mask!27646 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)))))

(declare-fun lt!428736 () (_ BitVec 64))

(assert (=> b!951962 (= lt!428736 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428732 () (_ BitVec 64))

(assert (=> b!951962 (= lt!428732 (select (arr!27692 (_keys!10760 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951962 (= lt!428731 (addApplyDifferent!459 lt!428734 lt!428736 (minValue!5627 thiss!1141) lt!428732))))

(assert (=> b!951962 (= (apply!889 (+!2875 lt!428734 (tuple2!13541 lt!428736 (minValue!5627 thiss!1141))) lt!428732) (apply!889 lt!428734 lt!428732))))

(declare-fun b!951963 () Bool)

(assert (=> b!951963 (= e!536091 e!536087)))

(assert (=> b!951963 (= c!99655 (and (not (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5523 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951964 () Bool)

(assert (=> b!951964 (= e!536088 call!41489)))

(declare-fun b!951965 () Bool)

(assert (=> b!951965 (= e!536089 (= (apply!889 lt!428737 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5627 thiss!1141)))))

(declare-fun b!951966 () Bool)

(assert (=> b!951966 (= e!536083 e!536082)))

(declare-fun res!637816 () Bool)

(assert (=> b!951966 (=> (not res!637816) (not e!536082))))

(assert (=> b!951966 (= res!637816 (contains!5239 lt!428737 (select (arr!27692 (_keys!10760 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28171 (_keys!10760 thiss!1141))))))

(assert (= (and d!115629 c!99656) b!951948))

(assert (= (and d!115629 (not c!99656)) b!951963))

(assert (= (and b!951963 c!99655) b!951954))

(assert (= (and b!951963 (not c!99655)) b!951961))

(assert (= (and b!951961 c!99653) b!951964))

(assert (= (and b!951961 (not c!99653)) b!951958))

(assert (= (or b!951964 b!951958) bm!41481))

(assert (= (or b!951954 bm!41481) bm!41484))

(assert (= (or b!951954 b!951964) bm!41486))

(assert (= (or b!951948 bm!41484) bm!41482))

(assert (= (or b!951948 bm!41486) bm!41483))

(assert (= (and d!115629 res!637814) b!951957))

(assert (= (and d!115629 c!99654) b!951962))

(assert (= (and d!115629 (not c!99654)) b!951956))

(assert (= (and d!115629 res!637815) b!951960))

(assert (= (and b!951960 res!637822) b!951952))

(assert (= (and b!951960 (not res!637820)) b!951966))

(assert (= (and b!951966 res!637816) b!951947))

(assert (= (and b!951960 res!637817) b!951946))

(assert (= (and b!951946 c!99652) b!951953))

(assert (= (and b!951946 (not c!99652)) b!951950))

(assert (= (and b!951953 res!637819) b!951965))

(assert (= (or b!951953 b!951950) bm!41485))

(assert (= (and b!951946 res!637818) b!951951))

(assert (= (and b!951951 c!99657) b!951949))

(assert (= (and b!951951 (not c!99657)) b!951959))

(assert (= (and b!951949 res!637821) b!951955))

(assert (= (or b!951949 b!951959) bm!41487))

(declare-fun b_lambda!14397 () Bool)

(assert (=> (not b_lambda!14397) (not b!951947)))

(declare-fun t!27673 () Bool)

(declare-fun tb!6187 () Bool)

(assert (=> (and b!951805 (= (defaultEntry!5791 thiss!1141) (defaultEntry!5791 thiss!1141)) t!27673) tb!6187))

(declare-fun result!12299 () Bool)

(assert (=> tb!6187 (= result!12299 tp_is_empty!20761)))

(assert (=> b!951947 t!27673))

(declare-fun b_and!29733 () Bool)

(assert (= b_and!29727 (and (=> t!27673 result!12299) b_and!29733)))

(declare-fun m!884663 () Bool)

(assert (=> bm!41485 m!884663))

(assert (=> b!951952 m!884639))

(assert (=> b!951952 m!884639))

(declare-fun m!884665 () Bool)

(assert (=> b!951952 m!884665))

(declare-fun m!884667 () Bool)

(assert (=> b!951962 m!884667))

(declare-fun m!884669 () Bool)

(assert (=> b!951962 m!884669))

(declare-fun m!884671 () Bool)

(assert (=> b!951962 m!884671))

(declare-fun m!884673 () Bool)

(assert (=> b!951962 m!884673))

(declare-fun m!884675 () Bool)

(assert (=> b!951962 m!884675))

(declare-fun m!884677 () Bool)

(assert (=> b!951962 m!884677))

(declare-fun m!884679 () Bool)

(assert (=> b!951962 m!884679))

(declare-fun m!884681 () Bool)

(assert (=> b!951962 m!884681))

(declare-fun m!884683 () Bool)

(assert (=> b!951962 m!884683))

(declare-fun m!884685 () Bool)

(assert (=> b!951962 m!884685))

(assert (=> b!951962 m!884639))

(declare-fun m!884687 () Bool)

(assert (=> b!951962 m!884687))

(declare-fun m!884689 () Bool)

(assert (=> b!951962 m!884689))

(assert (=> b!951962 m!884667))

(declare-fun m!884691 () Bool)

(assert (=> b!951962 m!884691))

(assert (=> b!951962 m!884677))

(declare-fun m!884693 () Bool)

(assert (=> b!951962 m!884693))

(declare-fun m!884695 () Bool)

(assert (=> b!951962 m!884695))

(assert (=> b!951962 m!884693))

(assert (=> b!951962 m!884669))

(declare-fun m!884697 () Bool)

(assert (=> b!951962 m!884697))

(declare-fun m!884699 () Bool)

(assert (=> bm!41487 m!884699))

(assert (=> bm!41482 m!884687))

(assert (=> b!951966 m!884639))

(assert (=> b!951966 m!884639))

(declare-fun m!884701 () Bool)

(assert (=> b!951966 m!884701))

(assert (=> d!115629 m!884571))

(declare-fun m!884703 () Bool)

(assert (=> b!951965 m!884703))

(assert (=> b!951957 m!884639))

(assert (=> b!951957 m!884639))

(assert (=> b!951957 m!884665))

(assert (=> b!951947 m!884639))

(declare-fun m!884705 () Bool)

(assert (=> b!951947 m!884705))

(declare-fun m!884707 () Bool)

(assert (=> b!951947 m!884707))

(assert (=> b!951947 m!884639))

(declare-fun m!884709 () Bool)

(assert (=> b!951947 m!884709))

(assert (=> b!951947 m!884707))

(assert (=> b!951947 m!884705))

(declare-fun m!884711 () Bool)

(assert (=> b!951947 m!884711))

(declare-fun m!884713 () Bool)

(assert (=> b!951948 m!884713))

(declare-fun m!884715 () Bool)

(assert (=> bm!41483 m!884715))

(declare-fun m!884717 () Bool)

(assert (=> b!951955 m!884717))

(assert (=> b!951808 d!115629))

(declare-fun d!115631 () Bool)

(declare-fun lt!428751 () SeekEntryResult!9107)

(assert (=> d!115631 (and (or ((_ is MissingVacant!9107) lt!428751) (not ((_ is Found!9107) lt!428751)) (and (bvsge (index!38800 lt!428751) #b00000000000000000000000000000000) (bvslt (index!38800 lt!428751) (size!28171 (_keys!10760 thiss!1141))))) (not ((_ is MissingVacant!9107) lt!428751)) (or (not ((_ is Found!9107) lt!428751)) (= (select (arr!27692 (_keys!10760 thiss!1141)) (index!38800 lt!428751)) key!756)))))

(declare-fun e!536101 () SeekEntryResult!9107)

(assert (=> d!115631 (= lt!428751 e!536101)))

(declare-fun c!99666 () Bool)

(declare-fun lt!428752 () SeekEntryResult!9107)

(assert (=> d!115631 (= c!99666 (and ((_ is Intermediate!9107) lt!428752) (undefined!9919 lt!428752)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57597 (_ BitVec 32)) SeekEntryResult!9107)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115631 (= lt!428752 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27646 thiss!1141)) key!756 (_keys!10760 thiss!1141) (mask!27646 thiss!1141)))))

(assert (=> d!115631 (validMask!0 (mask!27646 thiss!1141))))

(assert (=> d!115631 (= (seekEntry!0 key!756 (_keys!10760 thiss!1141) (mask!27646 thiss!1141)) lt!428751)))

(declare-fun b!951981 () Bool)

(assert (=> b!951981 (= e!536101 Undefined!9107)))

(declare-fun b!951982 () Bool)

(declare-fun c!99664 () Bool)

(declare-fun lt!428750 () (_ BitVec 64))

(assert (=> b!951982 (= c!99664 (= lt!428750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!536102 () SeekEntryResult!9107)

(declare-fun e!536100 () SeekEntryResult!9107)

(assert (=> b!951982 (= e!536102 e!536100)))

(declare-fun b!951983 () Bool)

(assert (=> b!951983 (= e!536102 (Found!9107 (index!38801 lt!428752)))))

(declare-fun b!951984 () Bool)

(assert (=> b!951984 (= e!536100 (MissingZero!9107 (index!38801 lt!428752)))))

(declare-fun b!951985 () Bool)

(assert (=> b!951985 (= e!536101 e!536102)))

(assert (=> b!951985 (= lt!428750 (select (arr!27692 (_keys!10760 thiss!1141)) (index!38801 lt!428752)))))

(declare-fun c!99665 () Bool)

(assert (=> b!951985 (= c!99665 (= lt!428750 key!756))))

(declare-fun b!951986 () Bool)

(declare-fun lt!428749 () SeekEntryResult!9107)

(assert (=> b!951986 (= e!536100 (ite ((_ is MissingVacant!9107) lt!428749) (MissingZero!9107 (index!38802 lt!428749)) lt!428749))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57597 (_ BitVec 32)) SeekEntryResult!9107)

(assert (=> b!951986 (= lt!428749 (seekKeyOrZeroReturnVacant!0 (x!81783 lt!428752) (index!38801 lt!428752) (index!38801 lt!428752) key!756 (_keys!10760 thiss!1141) (mask!27646 thiss!1141)))))

(assert (= (and d!115631 c!99666) b!951981))

(assert (= (and d!115631 (not c!99666)) b!951985))

(assert (= (and b!951985 c!99665) b!951983))

(assert (= (and b!951985 (not c!99665)) b!951982))

(assert (= (and b!951982 c!99664) b!951984))

(assert (= (and b!951982 (not c!99664)) b!951986))

(declare-fun m!884719 () Bool)

(assert (=> d!115631 m!884719))

(declare-fun m!884721 () Bool)

(assert (=> d!115631 m!884721))

(assert (=> d!115631 m!884721))

(declare-fun m!884723 () Bool)

(assert (=> d!115631 m!884723))

(assert (=> d!115631 m!884571))

(declare-fun m!884725 () Bool)

(assert (=> b!951985 m!884725))

(declare-fun m!884727 () Bool)

(assert (=> b!951986 m!884727))

(assert (=> b!951807 d!115631))

(declare-fun b!951993 () Bool)

(declare-fun e!536107 () Bool)

(assert (=> b!951993 (= e!536107 tp_is_empty!20761)))

(declare-fun mapIsEmpty!33069 () Bool)

(declare-fun mapRes!33069 () Bool)

(assert (=> mapIsEmpty!33069 mapRes!33069))

(declare-fun condMapEmpty!33069 () Bool)

(declare-fun mapDefault!33069 () ValueCell!9899)

(assert (=> mapNonEmpty!33060 (= condMapEmpty!33069 (= mapRest!33060 ((as const (Array (_ BitVec 32) ValueCell!9899)) mapDefault!33069)))))

(declare-fun e!536108 () Bool)

(assert (=> mapNonEmpty!33060 (= tp!63362 (and e!536108 mapRes!33069))))

(declare-fun b!951994 () Bool)

(assert (=> b!951994 (= e!536108 tp_is_empty!20761)))

(declare-fun mapNonEmpty!33069 () Bool)

(declare-fun tp!63378 () Bool)

(assert (=> mapNonEmpty!33069 (= mapRes!33069 (and tp!63378 e!536107))))

(declare-fun mapKey!33069 () (_ BitVec 32))

(declare-fun mapValue!33069 () ValueCell!9899)

(declare-fun mapRest!33069 () (Array (_ BitVec 32) ValueCell!9899))

(assert (=> mapNonEmpty!33069 (= mapRest!33060 (store mapRest!33069 mapKey!33069 mapValue!33069))))

(assert (= (and mapNonEmpty!33060 condMapEmpty!33069) mapIsEmpty!33069))

(assert (= (and mapNonEmpty!33060 (not condMapEmpty!33069)) mapNonEmpty!33069))

(assert (= (and mapNonEmpty!33069 ((_ is ValueCellFull!9899) mapValue!33069)) b!951993))

(assert (= (and mapNonEmpty!33060 ((_ is ValueCellFull!9899) mapDefault!33069)) b!951994))

(declare-fun m!884729 () Bool)

(assert (=> mapNonEmpty!33069 m!884729))

(declare-fun b_lambda!14399 () Bool)

(assert (= b_lambda!14397 (or (and b!951805 b_free!18253) b_lambda!14399)))

(check-sat (not bm!41483) (not b!951955) (not b!951892) (not b!951879) (not b!951947) (not b!951952) (not d!115625) (not b!951962) (not b!951986) (not d!115631) (not mapNonEmpty!33069) (not b!951873) b_and!29733 (not b_next!18253) (not b!951948) (not d!115629) (not d!115619) (not b!951893) (not bm!41482) tp_is_empty!20761 (not b!951901) (not bm!41487) (not b!951957) (not b_lambda!14399) (not b!951894) (not d!115627) (not b!951966) (not b!951965) (not b!951903) (not bm!41485) (not b!951884))
(check-sat b_and!29733 (not b_next!18253))
