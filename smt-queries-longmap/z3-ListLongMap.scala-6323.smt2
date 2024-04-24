; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81490 () Bool)

(assert start!81490)

(declare-fun b!952020 () Bool)

(declare-fun b_free!18259 () Bool)

(declare-fun b_next!18259 () Bool)

(assert (=> b!952020 (= b_free!18259 (not b_next!18259))))

(declare-fun tp!63384 () Bool)

(declare-fun b_and!29735 () Bool)

(assert (=> b!952020 (= tp!63384 b_and!29735)))

(declare-fun b!952013 () Bool)

(declare-fun e!536123 () Bool)

(declare-fun tp_is_empty!20767 () Bool)

(assert (=> b!952013 (= e!536123 tp_is_empty!20767)))

(declare-fun b!952014 () Bool)

(declare-fun e!536125 () Bool)

(declare-fun e!536129 () Bool)

(declare-fun mapRes!33072 () Bool)

(assert (=> b!952014 (= e!536125 (and e!536129 mapRes!33072))))

(declare-fun condMapEmpty!33072 () Bool)

(declare-datatypes ((V!32655 0))(
  ( (V!32656 (val!10434 Int)) )
))
(declare-datatypes ((ValueCell!9902 0))(
  ( (ValueCellFull!9902 (v!12977 V!32655)) (EmptyCell!9902) )
))
(declare-datatypes ((array!57609 0))(
  ( (array!57610 (arr!27697 (Array (_ BitVec 32) ValueCell!9902)) (size!28176 (_ BitVec 32))) )
))
(declare-datatypes ((array!57611 0))(
  ( (array!57612 (arr!27698 (Array (_ BitVec 32) (_ BitVec 64))) (size!28177 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4954 0))(
  ( (LongMapFixedSize!4955 (defaultEntry!5796 Int) (mask!27655 (_ BitVec 32)) (extraKeys!5528 (_ BitVec 32)) (zeroValue!5632 V!32655) (minValue!5632 V!32655) (_size!2532 (_ BitVec 32)) (_keys!10766 array!57611) (_values!5819 array!57609) (_vacant!2532 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4954)

(declare-fun mapDefault!33072 () ValueCell!9902)

(assert (=> b!952014 (= condMapEmpty!33072 (= (arr!27697 (_values!5819 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9902)) mapDefault!33072)))))

(declare-fun b!952015 () Bool)

(declare-fun res!637836 () Bool)

(declare-fun e!536127 () Bool)

(assert (=> b!952015 (=> (not res!637836) (not e!536127))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13546 0))(
  ( (tuple2!13547 (_1!6784 (_ BitVec 64)) (_2!6784 V!32655)) )
))
(declare-datatypes ((List!19338 0))(
  ( (Nil!19335) (Cons!19334 (h!20501 tuple2!13546) (t!27675 List!19338)) )
))
(declare-datatypes ((ListLongMap!12245 0))(
  ( (ListLongMap!12246 (toList!6138 List!19338)) )
))
(declare-fun contains!5242 (ListLongMap!12245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3371 (array!57611 array!57609 (_ BitVec 32) (_ BitVec 32) V!32655 V!32655 (_ BitVec 32) Int) ListLongMap!12245)

(assert (=> b!952015 (= res!637836 (contains!5242 (getCurrentListMap!3371 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!33072 () Bool)

(declare-fun tp!63383 () Bool)

(assert (=> mapNonEmpty!33072 (= mapRes!33072 (and tp!63383 e!536123))))

(declare-fun mapKey!33072 () (_ BitVec 32))

(declare-fun mapRest!33072 () (Array (_ BitVec 32) ValueCell!9902))

(declare-fun mapValue!33072 () ValueCell!9902)

(assert (=> mapNonEmpty!33072 (= (arr!27697 (_values!5819 thiss!1141)) (store mapRest!33072 mapKey!33072 mapValue!33072))))

(declare-fun b!952016 () Bool)

(declare-fun res!637837 () Bool)

(assert (=> b!952016 (=> (not res!637837) (not e!536127))))

(assert (=> b!952016 (= res!637837 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952017 () Bool)

(declare-fun res!637835 () Bool)

(assert (=> b!952017 (=> (not res!637835) (not e!536127))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9109 0))(
  ( (MissingZero!9109 (index!38807 (_ BitVec 32))) (Found!9109 (index!38808 (_ BitVec 32))) (Intermediate!9109 (undefined!9921 Bool) (index!38809 (_ BitVec 32)) (x!81803 (_ BitVec 32))) (Undefined!9109) (MissingVacant!9109 (index!38810 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57611 (_ BitVec 32)) SeekEntryResult!9109)

(assert (=> b!952017 (= res!637835 (not ((_ is Found!9109) (seekEntry!0 key!756 (_keys!10766 thiss!1141) (mask!27655 thiss!1141)))))))

(declare-fun b!952018 () Bool)

(declare-fun e!536124 () Bool)

(assert (=> b!952018 (= e!536127 (not e!536124))))

(declare-fun res!637834 () Bool)

(assert (=> b!952018 (=> res!637834 e!536124)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!952018 (= res!637834 (not (validMask!0 (mask!27655 thiss!1141))))))

(declare-fun lt!428758 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57611 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952018 (= lt!428758 (arrayScanForKey!0 (_keys!10766 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952018 (arrayContainsKey!0 (_keys!10766 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31990 0))(
  ( (Unit!31991) )
))
(declare-fun lt!428757 () Unit!31990)

(declare-fun lemmaKeyInListMapIsInArray!322 (array!57611 array!57609 (_ BitVec 32) (_ BitVec 32) V!32655 V!32655 (_ BitVec 64) Int) Unit!31990)

(assert (=> b!952018 (= lt!428757 (lemmaKeyInListMapIsInArray!322 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) key!756 (defaultEntry!5796 thiss!1141)))))

(declare-fun res!637833 () Bool)

(assert (=> start!81490 (=> (not res!637833) (not e!536127))))

(declare-fun valid!1895 (LongMapFixedSize!4954) Bool)

(assert (=> start!81490 (= res!637833 (valid!1895 thiss!1141))))

(assert (=> start!81490 e!536127))

(declare-fun e!536126 () Bool)

(assert (=> start!81490 e!536126))

(assert (=> start!81490 true))

(declare-fun b!952019 () Bool)

(assert (=> b!952019 (= e!536124 (or (not (= (size!28177 (_keys!10766 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27655 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!28177 (_keys!10766 thiss!1141))) (and (bvsge lt!428758 #b00000000000000000000000000000000) (bvsle lt!428758 (size!28177 (_keys!10766 thiss!1141))))))))

(declare-fun array_inv!21578 (array!57611) Bool)

(declare-fun array_inv!21579 (array!57609) Bool)

(assert (=> b!952020 (= e!536126 (and tp!63384 tp_is_empty!20767 (array_inv!21578 (_keys!10766 thiss!1141)) (array_inv!21579 (_values!5819 thiss!1141)) e!536125))))

(declare-fun b!952021 () Bool)

(assert (=> b!952021 (= e!536129 tp_is_empty!20767)))

(declare-fun mapIsEmpty!33072 () Bool)

(assert (=> mapIsEmpty!33072 mapRes!33072))

(assert (= (and start!81490 res!637833) b!952016))

(assert (= (and b!952016 res!637837) b!952017))

(assert (= (and b!952017 res!637835) b!952015))

(assert (= (and b!952015 res!637836) b!952018))

(assert (= (and b!952018 (not res!637834)) b!952019))

(assert (= (and b!952014 condMapEmpty!33072) mapIsEmpty!33072))

(assert (= (and b!952014 (not condMapEmpty!33072)) mapNonEmpty!33072))

(assert (= (and mapNonEmpty!33072 ((_ is ValueCellFull!9902) mapValue!33072)) b!952013))

(assert (= (and b!952014 ((_ is ValueCellFull!9902) mapDefault!33072)) b!952021))

(assert (= b!952020 b!952014))

(assert (= start!81490 b!952020))

(declare-fun m!884731 () Bool)

(assert (=> b!952018 m!884731))

(declare-fun m!884733 () Bool)

(assert (=> b!952018 m!884733))

(declare-fun m!884735 () Bool)

(assert (=> b!952018 m!884735))

(declare-fun m!884737 () Bool)

(assert (=> b!952018 m!884737))

(declare-fun m!884739 () Bool)

(assert (=> b!952017 m!884739))

(declare-fun m!884741 () Bool)

(assert (=> b!952020 m!884741))

(declare-fun m!884743 () Bool)

(assert (=> b!952020 m!884743))

(declare-fun m!884745 () Bool)

(assert (=> mapNonEmpty!33072 m!884745))

(declare-fun m!884747 () Bool)

(assert (=> b!952015 m!884747))

(assert (=> b!952015 m!884747))

(declare-fun m!884749 () Bool)

(assert (=> b!952015 m!884749))

(declare-fun m!884751 () Bool)

(assert (=> start!81490 m!884751))

(check-sat (not b!952018) (not b!952017) (not b!952020) (not b!952015) (not mapNonEmpty!33072) tp_is_empty!20767 (not start!81490) b_and!29735 (not b_next!18259))
(check-sat b_and!29735 (not b_next!18259))
(get-model)

(declare-fun d!115635 () Bool)

(declare-fun lt!428780 () SeekEntryResult!9109)

(assert (=> d!115635 (and (or ((_ is MissingVacant!9109) lt!428780) (not ((_ is Found!9109) lt!428780)) (and (bvsge (index!38808 lt!428780) #b00000000000000000000000000000000) (bvslt (index!38808 lt!428780) (size!28177 (_keys!10766 thiss!1141))))) (not ((_ is MissingVacant!9109) lt!428780)) (or (not ((_ is Found!9109) lt!428780)) (= (select (arr!27698 (_keys!10766 thiss!1141)) (index!38808 lt!428780)) key!756)))))

(declare-fun e!536179 () SeekEntryResult!9109)

(assert (=> d!115635 (= lt!428780 e!536179)))

(declare-fun c!99675 () Bool)

(declare-fun lt!428779 () SeekEntryResult!9109)

(assert (=> d!115635 (= c!99675 (and ((_ is Intermediate!9109) lt!428779) (undefined!9921 lt!428779)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57611 (_ BitVec 32)) SeekEntryResult!9109)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115635 (= lt!428779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27655 thiss!1141)) key!756 (_keys!10766 thiss!1141) (mask!27655 thiss!1141)))))

(assert (=> d!115635 (validMask!0 (mask!27655 thiss!1141))))

(assert (=> d!115635 (= (seekEntry!0 key!756 (_keys!10766 thiss!1141) (mask!27655 thiss!1141)) lt!428780)))

(declare-fun b!952088 () Bool)

(declare-fun e!536180 () SeekEntryResult!9109)

(assert (=> b!952088 (= e!536179 e!536180)))

(declare-fun lt!428782 () (_ BitVec 64))

(assert (=> b!952088 (= lt!428782 (select (arr!27698 (_keys!10766 thiss!1141)) (index!38809 lt!428779)))))

(declare-fun c!99674 () Bool)

(assert (=> b!952088 (= c!99674 (= lt!428782 key!756))))

(declare-fun b!952089 () Bool)

(declare-fun e!536178 () SeekEntryResult!9109)

(assert (=> b!952089 (= e!536178 (MissingZero!9109 (index!38809 lt!428779)))))

(declare-fun b!952090 () Bool)

(declare-fun lt!428781 () SeekEntryResult!9109)

(assert (=> b!952090 (= e!536178 (ite ((_ is MissingVacant!9109) lt!428781) (MissingZero!9109 (index!38810 lt!428781)) lt!428781))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57611 (_ BitVec 32)) SeekEntryResult!9109)

(assert (=> b!952090 (= lt!428781 (seekKeyOrZeroReturnVacant!0 (x!81803 lt!428779) (index!38809 lt!428779) (index!38809 lt!428779) key!756 (_keys!10766 thiss!1141) (mask!27655 thiss!1141)))))

(declare-fun b!952091 () Bool)

(assert (=> b!952091 (= e!536179 Undefined!9109)))

(declare-fun b!952092 () Bool)

(assert (=> b!952092 (= e!536180 (Found!9109 (index!38809 lt!428779)))))

(declare-fun b!952093 () Bool)

(declare-fun c!99673 () Bool)

(assert (=> b!952093 (= c!99673 (= lt!428782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!952093 (= e!536180 e!536178)))

(assert (= (and d!115635 c!99675) b!952091))

(assert (= (and d!115635 (not c!99675)) b!952088))

(assert (= (and b!952088 c!99674) b!952092))

(assert (= (and b!952088 (not c!99674)) b!952093))

(assert (= (and b!952093 c!99673) b!952089))

(assert (= (and b!952093 (not c!99673)) b!952090))

(declare-fun m!884797 () Bool)

(assert (=> d!115635 m!884797))

(declare-fun m!884799 () Bool)

(assert (=> d!115635 m!884799))

(assert (=> d!115635 m!884799))

(declare-fun m!884801 () Bool)

(assert (=> d!115635 m!884801))

(assert (=> d!115635 m!884731))

(declare-fun m!884803 () Bool)

(assert (=> b!952088 m!884803))

(declare-fun m!884805 () Bool)

(assert (=> b!952090 m!884805))

(assert (=> b!952017 d!115635))

(declare-fun d!115637 () Bool)

(declare-fun res!637874 () Bool)

(declare-fun e!536183 () Bool)

(assert (=> d!115637 (=> (not res!637874) (not e!536183))))

(declare-fun simpleValid!377 (LongMapFixedSize!4954) Bool)

(assert (=> d!115637 (= res!637874 (simpleValid!377 thiss!1141))))

(assert (=> d!115637 (= (valid!1895 thiss!1141) e!536183)))

(declare-fun b!952100 () Bool)

(declare-fun res!637875 () Bool)

(assert (=> b!952100 (=> (not res!637875) (not e!536183))))

(declare-fun arrayCountValidKeys!0 (array!57611 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952100 (= res!637875 (= (arrayCountValidKeys!0 (_keys!10766 thiss!1141) #b00000000000000000000000000000000 (size!28177 (_keys!10766 thiss!1141))) (_size!2532 thiss!1141)))))

(declare-fun b!952101 () Bool)

(declare-fun res!637876 () Bool)

(assert (=> b!952101 (=> (not res!637876) (not e!536183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57611 (_ BitVec 32)) Bool)

(assert (=> b!952101 (= res!637876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10766 thiss!1141) (mask!27655 thiss!1141)))))

(declare-fun b!952102 () Bool)

(declare-datatypes ((List!19340 0))(
  ( (Nil!19337) (Cons!19336 (h!20503 (_ BitVec 64)) (t!27679 List!19340)) )
))
(declare-fun arrayNoDuplicates!0 (array!57611 (_ BitVec 32) List!19340) Bool)

(assert (=> b!952102 (= e!536183 (arrayNoDuplicates!0 (_keys!10766 thiss!1141) #b00000000000000000000000000000000 Nil!19337))))

(assert (= (and d!115637 res!637874) b!952100))

(assert (= (and b!952100 res!637875) b!952101))

(assert (= (and b!952101 res!637876) b!952102))

(declare-fun m!884807 () Bool)

(assert (=> d!115637 m!884807))

(declare-fun m!884809 () Bool)

(assert (=> b!952100 m!884809))

(declare-fun m!884811 () Bool)

(assert (=> b!952101 m!884811))

(declare-fun m!884813 () Bool)

(assert (=> b!952102 m!884813))

(assert (=> start!81490 d!115637))

(declare-fun d!115639 () Bool)

(assert (=> d!115639 (= (validMask!0 (mask!27655 thiss!1141)) (and (or (= (mask!27655 thiss!1141) #b00000000000000000000000000000111) (= (mask!27655 thiss!1141) #b00000000000000000000000000001111) (= (mask!27655 thiss!1141) #b00000000000000000000000000011111) (= (mask!27655 thiss!1141) #b00000000000000000000000000111111) (= (mask!27655 thiss!1141) #b00000000000000000000000001111111) (= (mask!27655 thiss!1141) #b00000000000000000000000011111111) (= (mask!27655 thiss!1141) #b00000000000000000000000111111111) (= (mask!27655 thiss!1141) #b00000000000000000000001111111111) (= (mask!27655 thiss!1141) #b00000000000000000000011111111111) (= (mask!27655 thiss!1141) #b00000000000000000000111111111111) (= (mask!27655 thiss!1141) #b00000000000000000001111111111111) (= (mask!27655 thiss!1141) #b00000000000000000011111111111111) (= (mask!27655 thiss!1141) #b00000000000000000111111111111111) (= (mask!27655 thiss!1141) #b00000000000000001111111111111111) (= (mask!27655 thiss!1141) #b00000000000000011111111111111111) (= (mask!27655 thiss!1141) #b00000000000000111111111111111111) (= (mask!27655 thiss!1141) #b00000000000001111111111111111111) (= (mask!27655 thiss!1141) #b00000000000011111111111111111111) (= (mask!27655 thiss!1141) #b00000000000111111111111111111111) (= (mask!27655 thiss!1141) #b00000000001111111111111111111111) (= (mask!27655 thiss!1141) #b00000000011111111111111111111111) (= (mask!27655 thiss!1141) #b00000000111111111111111111111111) (= (mask!27655 thiss!1141) #b00000001111111111111111111111111) (= (mask!27655 thiss!1141) #b00000011111111111111111111111111) (= (mask!27655 thiss!1141) #b00000111111111111111111111111111) (= (mask!27655 thiss!1141) #b00001111111111111111111111111111) (= (mask!27655 thiss!1141) #b00011111111111111111111111111111) (= (mask!27655 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27655 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!952018 d!115639))

(declare-fun d!115641 () Bool)

(declare-fun lt!428785 () (_ BitVec 32))

(assert (=> d!115641 (and (or (bvslt lt!428785 #b00000000000000000000000000000000) (bvsge lt!428785 (size!28177 (_keys!10766 thiss!1141))) (and (bvsge lt!428785 #b00000000000000000000000000000000) (bvslt lt!428785 (size!28177 (_keys!10766 thiss!1141))))) (bvsge lt!428785 #b00000000000000000000000000000000) (bvslt lt!428785 (size!28177 (_keys!10766 thiss!1141))) (= (select (arr!27698 (_keys!10766 thiss!1141)) lt!428785) key!756))))

(declare-fun e!536186 () (_ BitVec 32))

(assert (=> d!115641 (= lt!428785 e!536186)))

(declare-fun c!99678 () Bool)

(assert (=> d!115641 (= c!99678 (= (select (arr!27698 (_keys!10766 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115641 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28177 (_keys!10766 thiss!1141))) (bvslt (size!28177 (_keys!10766 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115641 (= (arrayScanForKey!0 (_keys!10766 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428785)))

(declare-fun b!952107 () Bool)

(assert (=> b!952107 (= e!536186 #b00000000000000000000000000000000)))

(declare-fun b!952108 () Bool)

(assert (=> b!952108 (= e!536186 (arrayScanForKey!0 (_keys!10766 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115641 c!99678) b!952107))

(assert (= (and d!115641 (not c!99678)) b!952108))

(declare-fun m!884815 () Bool)

(assert (=> d!115641 m!884815))

(declare-fun m!884817 () Bool)

(assert (=> d!115641 m!884817))

(declare-fun m!884819 () Bool)

(assert (=> b!952108 m!884819))

(assert (=> b!952018 d!115641))

(declare-fun d!115643 () Bool)

(declare-fun res!637881 () Bool)

(declare-fun e!536191 () Bool)

(assert (=> d!115643 (=> res!637881 e!536191)))

(assert (=> d!115643 (= res!637881 (= (select (arr!27698 (_keys!10766 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115643 (= (arrayContainsKey!0 (_keys!10766 thiss!1141) key!756 #b00000000000000000000000000000000) e!536191)))

(declare-fun b!952113 () Bool)

(declare-fun e!536192 () Bool)

(assert (=> b!952113 (= e!536191 e!536192)))

(declare-fun res!637882 () Bool)

(assert (=> b!952113 (=> (not res!637882) (not e!536192))))

(assert (=> b!952113 (= res!637882 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28177 (_keys!10766 thiss!1141))))))

(declare-fun b!952114 () Bool)

(assert (=> b!952114 (= e!536192 (arrayContainsKey!0 (_keys!10766 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115643 (not res!637881)) b!952113))

(assert (= (and b!952113 res!637882) b!952114))

(assert (=> d!115643 m!884817))

(declare-fun m!884821 () Bool)

(assert (=> b!952114 m!884821))

(assert (=> b!952018 d!115643))

(declare-fun d!115645 () Bool)

(declare-fun e!536195 () Bool)

(assert (=> d!115645 e!536195))

(declare-fun c!99681 () Bool)

(assert (=> d!115645 (= c!99681 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428788 () Unit!31990)

(declare-fun choose!1596 (array!57611 array!57609 (_ BitVec 32) (_ BitVec 32) V!32655 V!32655 (_ BitVec 64) Int) Unit!31990)

(assert (=> d!115645 (= lt!428788 (choose!1596 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) key!756 (defaultEntry!5796 thiss!1141)))))

(assert (=> d!115645 (validMask!0 (mask!27655 thiss!1141))))

(assert (=> d!115645 (= (lemmaKeyInListMapIsInArray!322 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) key!756 (defaultEntry!5796 thiss!1141)) lt!428788)))

(declare-fun b!952119 () Bool)

(assert (=> b!952119 (= e!536195 (arrayContainsKey!0 (_keys!10766 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!952120 () Bool)

(assert (=> b!952120 (= e!536195 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115645 c!99681) b!952119))

(assert (= (and d!115645 (not c!99681)) b!952120))

(declare-fun m!884823 () Bool)

(assert (=> d!115645 m!884823))

(assert (=> d!115645 m!884731))

(assert (=> b!952119 m!884735))

(assert (=> b!952018 d!115645))

(declare-fun d!115647 () Bool)

(assert (=> d!115647 (= (array_inv!21578 (_keys!10766 thiss!1141)) (bvsge (size!28177 (_keys!10766 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952020 d!115647))

(declare-fun d!115649 () Bool)

(assert (=> d!115649 (= (array_inv!21579 (_values!5819 thiss!1141)) (bvsge (size!28176 (_values!5819 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952020 d!115649))

(declare-fun d!115651 () Bool)

(declare-fun e!536200 () Bool)

(assert (=> d!115651 e!536200))

(declare-fun res!637885 () Bool)

(assert (=> d!115651 (=> res!637885 e!536200)))

(declare-fun lt!428800 () Bool)

(assert (=> d!115651 (= res!637885 (not lt!428800))))

(declare-fun lt!428797 () Bool)

(assert (=> d!115651 (= lt!428800 lt!428797)))

(declare-fun lt!428799 () Unit!31990)

(declare-fun e!536201 () Unit!31990)

(assert (=> d!115651 (= lt!428799 e!536201)))

(declare-fun c!99684 () Bool)

(assert (=> d!115651 (= c!99684 lt!428797)))

(declare-fun containsKey!469 (List!19338 (_ BitVec 64)) Bool)

(assert (=> d!115651 (= lt!428797 (containsKey!469 (toList!6138 (getCurrentListMap!3371 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141))) key!756))))

(assert (=> d!115651 (= (contains!5242 (getCurrentListMap!3371 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)) key!756) lt!428800)))

(declare-fun b!952127 () Bool)

(declare-fun lt!428798 () Unit!31990)

(assert (=> b!952127 (= e!536201 lt!428798)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!363 (List!19338 (_ BitVec 64)) Unit!31990)

(assert (=> b!952127 (= lt!428798 (lemmaContainsKeyImpliesGetValueByKeyDefined!363 (toList!6138 (getCurrentListMap!3371 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141))) key!756))))

(declare-datatypes ((Option!504 0))(
  ( (Some!503 (v!12980 V!32655)) (None!502) )
))
(declare-fun isDefined!371 (Option!504) Bool)

(declare-fun getValueByKey!498 (List!19338 (_ BitVec 64)) Option!504)

(assert (=> b!952127 (isDefined!371 (getValueByKey!498 (toList!6138 (getCurrentListMap!3371 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141))) key!756))))

(declare-fun b!952128 () Bool)

(declare-fun Unit!31994 () Unit!31990)

(assert (=> b!952128 (= e!536201 Unit!31994)))

(declare-fun b!952129 () Bool)

(assert (=> b!952129 (= e!536200 (isDefined!371 (getValueByKey!498 (toList!6138 (getCurrentListMap!3371 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141))) key!756)))))

(assert (= (and d!115651 c!99684) b!952127))

(assert (= (and d!115651 (not c!99684)) b!952128))

(assert (= (and d!115651 (not res!637885)) b!952129))

(declare-fun m!884825 () Bool)

(assert (=> d!115651 m!884825))

(declare-fun m!884827 () Bool)

(assert (=> b!952127 m!884827))

(declare-fun m!884829 () Bool)

(assert (=> b!952127 m!884829))

(assert (=> b!952127 m!884829))

(declare-fun m!884831 () Bool)

(assert (=> b!952127 m!884831))

(assert (=> b!952129 m!884829))

(assert (=> b!952129 m!884829))

(assert (=> b!952129 m!884831))

(assert (=> b!952015 d!115651))

(declare-fun b!952172 () Bool)

(declare-fun res!637908 () Bool)

(declare-fun e!536232 () Bool)

(assert (=> b!952172 (=> (not res!637908) (not e!536232))))

(declare-fun e!536228 () Bool)

(assert (=> b!952172 (= res!637908 e!536228)))

(declare-fun res!637909 () Bool)

(assert (=> b!952172 (=> res!637909 e!536228)))

(declare-fun e!536236 () Bool)

(assert (=> b!952172 (= res!637909 (not e!536236))))

(declare-fun res!637907 () Bool)

(assert (=> b!952172 (=> (not res!637907) (not e!536236))))

(assert (=> b!952172 (= res!637907 (bvslt #b00000000000000000000000000000000 (size!28177 (_keys!10766 thiss!1141))))))

(declare-fun d!115653 () Bool)

(assert (=> d!115653 e!536232))

(declare-fun res!637910 () Bool)

(assert (=> d!115653 (=> (not res!637910) (not e!536232))))

(assert (=> d!115653 (= res!637910 (or (bvsge #b00000000000000000000000000000000 (size!28177 (_keys!10766 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28177 (_keys!10766 thiss!1141))))))))

(declare-fun lt!428863 () ListLongMap!12245)

(declare-fun lt!428854 () ListLongMap!12245)

(assert (=> d!115653 (= lt!428863 lt!428854)))

(declare-fun lt!428845 () Unit!31990)

(declare-fun e!536239 () Unit!31990)

(assert (=> d!115653 (= lt!428845 e!536239)))

(declare-fun c!99698 () Bool)

(declare-fun e!536229 () Bool)

(assert (=> d!115653 (= c!99698 e!536229)))

(declare-fun res!637906 () Bool)

(assert (=> d!115653 (=> (not res!637906) (not e!536229))))

(assert (=> d!115653 (= res!637906 (bvslt #b00000000000000000000000000000000 (size!28177 (_keys!10766 thiss!1141))))))

(declare-fun e!536240 () ListLongMap!12245)

(assert (=> d!115653 (= lt!428854 e!536240)))

(declare-fun c!99701 () Bool)

(assert (=> d!115653 (= c!99701 (and (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115653 (validMask!0 (mask!27655 thiss!1141))))

(assert (=> d!115653 (= (getCurrentListMap!3371 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)) lt!428863)))

(declare-fun b!952173 () Bool)

(declare-fun e!536234 () Bool)

(declare-fun apply!890 (ListLongMap!12245 (_ BitVec 64)) V!32655)

(assert (=> b!952173 (= e!536234 (= (apply!890 lt!428863 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5632 thiss!1141)))))

(declare-fun b!952174 () Bool)

(declare-fun e!536238 () Bool)

(assert (=> b!952174 (= e!536238 e!536234)))

(declare-fun res!637912 () Bool)

(declare-fun call!41509 () Bool)

(assert (=> b!952174 (= res!637912 call!41509)))

(assert (=> b!952174 (=> (not res!637912) (not e!536234))))

(declare-fun b!952175 () Bool)

(declare-fun e!536230 () Bool)

(declare-fun call!41508 () Bool)

(assert (=> b!952175 (= e!536230 (not call!41508))))

(declare-fun b!952176 () Bool)

(declare-fun e!536233 () Bool)

(declare-fun get!14570 (ValueCell!9902 V!32655) V!32655)

(declare-fun dynLambda!1673 (Int (_ BitVec 64)) V!32655)

(assert (=> b!952176 (= e!536233 (= (apply!890 lt!428863 (select (arr!27698 (_keys!10766 thiss!1141)) #b00000000000000000000000000000000)) (get!14570 (select (arr!27697 (_values!5819 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1673 (defaultEntry!5796 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28176 (_values!5819 thiss!1141))))))

(assert (=> b!952176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28177 (_keys!10766 thiss!1141))))))

(declare-fun bm!41502 () Bool)

(assert (=> bm!41502 (= call!41508 (contains!5242 lt!428863 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952177 () Bool)

(declare-fun e!536235 () ListLongMap!12245)

(declare-fun call!41510 () ListLongMap!12245)

(assert (=> b!952177 (= e!536235 call!41510)))

(declare-fun b!952178 () Bool)

(declare-fun e!536231 () Bool)

(assert (=> b!952178 (= e!536231 (= (apply!890 lt!428863 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5632 thiss!1141)))))

(declare-fun b!952179 () Bool)

(assert (=> b!952179 (= e!536240 e!536235)))

(declare-fun c!99700 () Bool)

(assert (=> b!952179 (= c!99700 (and (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41503 () Bool)

(assert (=> bm!41503 (= call!41509 (contains!5242 lt!428863 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952180 () Bool)

(declare-fun lt!428848 () Unit!31990)

(assert (=> b!952180 (= e!536239 lt!428848)))

(declare-fun lt!428849 () ListLongMap!12245)

(declare-fun getCurrentListMapNoExtraKeys!3364 (array!57611 array!57609 (_ BitVec 32) (_ BitVec 32) V!32655 V!32655 (_ BitVec 32) Int) ListLongMap!12245)

(assert (=> b!952180 (= lt!428849 (getCurrentListMapNoExtraKeys!3364 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)))))

(declare-fun lt!428851 () (_ BitVec 64))

(assert (=> b!952180 (= lt!428851 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428850 () (_ BitVec 64))

(assert (=> b!952180 (= lt!428850 (select (arr!27698 (_keys!10766 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428846 () Unit!31990)

(declare-fun addStillContains!579 (ListLongMap!12245 (_ BitVec 64) V!32655 (_ BitVec 64)) Unit!31990)

(assert (=> b!952180 (= lt!428846 (addStillContains!579 lt!428849 lt!428851 (zeroValue!5632 thiss!1141) lt!428850))))

(declare-fun +!2876 (ListLongMap!12245 tuple2!13546) ListLongMap!12245)

(assert (=> b!952180 (contains!5242 (+!2876 lt!428849 (tuple2!13547 lt!428851 (zeroValue!5632 thiss!1141))) lt!428850)))

(declare-fun lt!428855 () Unit!31990)

(assert (=> b!952180 (= lt!428855 lt!428846)))

(declare-fun lt!428865 () ListLongMap!12245)

(assert (=> b!952180 (= lt!428865 (getCurrentListMapNoExtraKeys!3364 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)))))

(declare-fun lt!428861 () (_ BitVec 64))

(assert (=> b!952180 (= lt!428861 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428858 () (_ BitVec 64))

(assert (=> b!952180 (= lt!428858 (select (arr!27698 (_keys!10766 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428864 () Unit!31990)

(declare-fun addApplyDifferent!460 (ListLongMap!12245 (_ BitVec 64) V!32655 (_ BitVec 64)) Unit!31990)

(assert (=> b!952180 (= lt!428864 (addApplyDifferent!460 lt!428865 lt!428861 (minValue!5632 thiss!1141) lt!428858))))

(assert (=> b!952180 (= (apply!890 (+!2876 lt!428865 (tuple2!13547 lt!428861 (minValue!5632 thiss!1141))) lt!428858) (apply!890 lt!428865 lt!428858))))

(declare-fun lt!428862 () Unit!31990)

(assert (=> b!952180 (= lt!428862 lt!428864)))

(declare-fun lt!428847 () ListLongMap!12245)

(assert (=> b!952180 (= lt!428847 (getCurrentListMapNoExtraKeys!3364 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)))))

(declare-fun lt!428866 () (_ BitVec 64))

(assert (=> b!952180 (= lt!428866 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428852 () (_ BitVec 64))

(assert (=> b!952180 (= lt!428852 (select (arr!27698 (_keys!10766 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428857 () Unit!31990)

(assert (=> b!952180 (= lt!428857 (addApplyDifferent!460 lt!428847 lt!428866 (zeroValue!5632 thiss!1141) lt!428852))))

(assert (=> b!952180 (= (apply!890 (+!2876 lt!428847 (tuple2!13547 lt!428866 (zeroValue!5632 thiss!1141))) lt!428852) (apply!890 lt!428847 lt!428852))))

(declare-fun lt!428853 () Unit!31990)

(assert (=> b!952180 (= lt!428853 lt!428857)))

(declare-fun lt!428859 () ListLongMap!12245)

(assert (=> b!952180 (= lt!428859 (getCurrentListMapNoExtraKeys!3364 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)))))

(declare-fun lt!428856 () (_ BitVec 64))

(assert (=> b!952180 (= lt!428856 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428860 () (_ BitVec 64))

(assert (=> b!952180 (= lt!428860 (select (arr!27698 (_keys!10766 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952180 (= lt!428848 (addApplyDifferent!460 lt!428859 lt!428856 (minValue!5632 thiss!1141) lt!428860))))

(assert (=> b!952180 (= (apply!890 (+!2876 lt!428859 (tuple2!13547 lt!428856 (minValue!5632 thiss!1141))) lt!428860) (apply!890 lt!428859 lt!428860))))

(declare-fun b!952181 () Bool)

(declare-fun call!41511 () ListLongMap!12245)

(assert (=> b!952181 (= e!536240 (+!2876 call!41511 (tuple2!13547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5632 thiss!1141))))))

(declare-fun b!952182 () Bool)

(assert (=> b!952182 (= e!536230 e!536231)))

(declare-fun res!637905 () Bool)

(assert (=> b!952182 (= res!637905 call!41508)))

(assert (=> b!952182 (=> (not res!637905) (not e!536231))))

(declare-fun bm!41504 () Bool)

(assert (=> bm!41504 (= call!41510 call!41511)))

(declare-fun b!952183 () Bool)

(declare-fun res!637904 () Bool)

(assert (=> b!952183 (=> (not res!637904) (not e!536232))))

(assert (=> b!952183 (= res!637904 e!536238)))

(declare-fun c!99702 () Bool)

(assert (=> b!952183 (= c!99702 (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!952184 () Bool)

(assert (=> b!952184 (= e!536228 e!536233)))

(declare-fun res!637911 () Bool)

(assert (=> b!952184 (=> (not res!637911) (not e!536233))))

(assert (=> b!952184 (= res!637911 (contains!5242 lt!428863 (select (arr!27698 (_keys!10766 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952184 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28177 (_keys!10766 thiss!1141))))))

(declare-fun b!952185 () Bool)

(assert (=> b!952185 (= e!536232 e!536230)))

(declare-fun c!99697 () Bool)

(assert (=> b!952185 (= c!99697 (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41505 () Bool)

(declare-fun call!41505 () ListLongMap!12245)

(declare-fun call!41507 () ListLongMap!12245)

(assert (=> bm!41505 (= call!41505 call!41507)))

(declare-fun b!952186 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!952186 (= e!536229 (validKeyInArray!0 (select (arr!27698 (_keys!10766 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41506 () Bool)

(declare-fun call!41506 () ListLongMap!12245)

(assert (=> bm!41506 (= call!41507 call!41506)))

(declare-fun bm!41507 () Bool)

(assert (=> bm!41507 (= call!41506 (getCurrentListMapNoExtraKeys!3364 (_keys!10766 thiss!1141) (_values!5819 thiss!1141) (mask!27655 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)))))

(declare-fun b!952187 () Bool)

(assert (=> b!952187 (= e!536238 (not call!41509))))

(declare-fun b!952188 () Bool)

(declare-fun e!536237 () ListLongMap!12245)

(assert (=> b!952188 (= e!536237 call!41505)))

(declare-fun b!952189 () Bool)

(assert (=> b!952189 (= e!536236 (validKeyInArray!0 (select (arr!27698 (_keys!10766 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952190 () Bool)

(assert (=> b!952190 (= e!536237 call!41510)))

(declare-fun b!952191 () Bool)

(declare-fun Unit!31995 () Unit!31990)

(assert (=> b!952191 (= e!536239 Unit!31995)))

(declare-fun bm!41508 () Bool)

(assert (=> bm!41508 (= call!41511 (+!2876 (ite c!99701 call!41506 (ite c!99700 call!41507 call!41505)) (ite (or c!99701 c!99700) (tuple2!13547 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5632 thiss!1141)) (tuple2!13547 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5632 thiss!1141)))))))

(declare-fun b!952192 () Bool)

(declare-fun c!99699 () Bool)

(assert (=> b!952192 (= c!99699 (and (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!952192 (= e!536235 e!536237)))

(assert (= (and d!115653 c!99701) b!952181))

(assert (= (and d!115653 (not c!99701)) b!952179))

(assert (= (and b!952179 c!99700) b!952177))

(assert (= (and b!952179 (not c!99700)) b!952192))

(assert (= (and b!952192 c!99699) b!952190))

(assert (= (and b!952192 (not c!99699)) b!952188))

(assert (= (or b!952190 b!952188) bm!41505))

(assert (= (or b!952177 bm!41505) bm!41506))

(assert (= (or b!952177 b!952190) bm!41504))

(assert (= (or b!952181 bm!41506) bm!41507))

(assert (= (or b!952181 bm!41504) bm!41508))

(assert (= (and d!115653 res!637906) b!952186))

(assert (= (and d!115653 c!99698) b!952180))

(assert (= (and d!115653 (not c!99698)) b!952191))

(assert (= (and d!115653 res!637910) b!952172))

(assert (= (and b!952172 res!637907) b!952189))

(assert (= (and b!952172 (not res!637909)) b!952184))

(assert (= (and b!952184 res!637911) b!952176))

(assert (= (and b!952172 res!637908) b!952183))

(assert (= (and b!952183 c!99702) b!952174))

(assert (= (and b!952183 (not c!99702)) b!952187))

(assert (= (and b!952174 res!637912) b!952173))

(assert (= (or b!952174 b!952187) bm!41503))

(assert (= (and b!952183 res!637904) b!952185))

(assert (= (and b!952185 c!99697) b!952182))

(assert (= (and b!952185 (not c!99697)) b!952175))

(assert (= (and b!952182 res!637905) b!952178))

(assert (= (or b!952182 b!952175) bm!41502))

(declare-fun b_lambda!14401 () Bool)

(assert (=> (not b_lambda!14401) (not b!952176)))

(declare-fun t!27678 () Bool)

(declare-fun tb!6189 () Bool)

(assert (=> (and b!952020 (= (defaultEntry!5796 thiss!1141) (defaultEntry!5796 thiss!1141)) t!27678) tb!6189))

(declare-fun result!12305 () Bool)

(assert (=> tb!6189 (= result!12305 tp_is_empty!20767)))

(assert (=> b!952176 t!27678))

(declare-fun b_and!29741 () Bool)

(assert (= b_and!29735 (and (=> t!27678 result!12305) b_and!29741)))

(declare-fun m!884833 () Bool)

(assert (=> b!952178 m!884833))

(declare-fun m!884835 () Bool)

(assert (=> b!952173 m!884835))

(assert (=> b!952176 m!884817))

(declare-fun m!884837 () Bool)

(assert (=> b!952176 m!884837))

(declare-fun m!884839 () Bool)

(assert (=> b!952176 m!884839))

(assert (=> b!952176 m!884837))

(assert (=> b!952176 m!884839))

(declare-fun m!884841 () Bool)

(assert (=> b!952176 m!884841))

(assert (=> b!952176 m!884817))

(declare-fun m!884843 () Bool)

(assert (=> b!952176 m!884843))

(declare-fun m!884845 () Bool)

(assert (=> b!952181 m!884845))

(declare-fun m!884847 () Bool)

(assert (=> bm!41508 m!884847))

(declare-fun m!884849 () Bool)

(assert (=> bm!41502 m!884849))

(declare-fun m!884851 () Bool)

(assert (=> bm!41503 m!884851))

(assert (=> d!115653 m!884731))

(assert (=> b!952186 m!884817))

(assert (=> b!952186 m!884817))

(declare-fun m!884853 () Bool)

(assert (=> b!952186 m!884853))

(declare-fun m!884855 () Bool)

(assert (=> bm!41507 m!884855))

(assert (=> b!952184 m!884817))

(assert (=> b!952184 m!884817))

(declare-fun m!884857 () Bool)

(assert (=> b!952184 m!884857))

(assert (=> b!952189 m!884817))

(assert (=> b!952189 m!884817))

(assert (=> b!952189 m!884853))

(assert (=> b!952180 m!884817))

(declare-fun m!884859 () Bool)

(assert (=> b!952180 m!884859))

(assert (=> b!952180 m!884855))

(declare-fun m!884861 () Bool)

(assert (=> b!952180 m!884861))

(declare-fun m!884863 () Bool)

(assert (=> b!952180 m!884863))

(declare-fun m!884865 () Bool)

(assert (=> b!952180 m!884865))

(declare-fun m!884867 () Bool)

(assert (=> b!952180 m!884867))

(declare-fun m!884869 () Bool)

(assert (=> b!952180 m!884869))

(assert (=> b!952180 m!884863))

(declare-fun m!884871 () Bool)

(assert (=> b!952180 m!884871))

(declare-fun m!884873 () Bool)

(assert (=> b!952180 m!884873))

(declare-fun m!884875 () Bool)

(assert (=> b!952180 m!884875))

(declare-fun m!884877 () Bool)

(assert (=> b!952180 m!884877))

(declare-fun m!884879 () Bool)

(assert (=> b!952180 m!884879))

(assert (=> b!952180 m!884861))

(declare-fun m!884881 () Bool)

(assert (=> b!952180 m!884881))

(declare-fun m!884883 () Bool)

(assert (=> b!952180 m!884883))

(declare-fun m!884885 () Bool)

(assert (=> b!952180 m!884885))

(assert (=> b!952180 m!884867))

(declare-fun m!884887 () Bool)

(assert (=> b!952180 m!884887))

(assert (=> b!952180 m!884875))

(assert (=> b!952015 d!115653))

(declare-fun condMapEmpty!33081 () Bool)

(declare-fun mapDefault!33081 () ValueCell!9902)

(assert (=> mapNonEmpty!33072 (= condMapEmpty!33081 (= mapRest!33072 ((as const (Array (_ BitVec 32) ValueCell!9902)) mapDefault!33081)))))

(declare-fun e!536246 () Bool)

(declare-fun mapRes!33081 () Bool)

(assert (=> mapNonEmpty!33072 (= tp!63383 (and e!536246 mapRes!33081))))

(declare-fun b!952202 () Bool)

(assert (=> b!952202 (= e!536246 tp_is_empty!20767)))

(declare-fun mapIsEmpty!33081 () Bool)

(assert (=> mapIsEmpty!33081 mapRes!33081))

(declare-fun b!952201 () Bool)

(declare-fun e!536245 () Bool)

(assert (=> b!952201 (= e!536245 tp_is_empty!20767)))

(declare-fun mapNonEmpty!33081 () Bool)

(declare-fun tp!63399 () Bool)

(assert (=> mapNonEmpty!33081 (= mapRes!33081 (and tp!63399 e!536245))))

(declare-fun mapKey!33081 () (_ BitVec 32))

(declare-fun mapRest!33081 () (Array (_ BitVec 32) ValueCell!9902))

(declare-fun mapValue!33081 () ValueCell!9902)

(assert (=> mapNonEmpty!33081 (= mapRest!33072 (store mapRest!33081 mapKey!33081 mapValue!33081))))

(assert (= (and mapNonEmpty!33072 condMapEmpty!33081) mapIsEmpty!33081))

(assert (= (and mapNonEmpty!33072 (not condMapEmpty!33081)) mapNonEmpty!33081))

(assert (= (and mapNonEmpty!33081 ((_ is ValueCellFull!9902) mapValue!33081)) b!952201))

(assert (= (and mapNonEmpty!33072 ((_ is ValueCellFull!9902) mapDefault!33081)) b!952202))

(declare-fun m!884889 () Bool)

(assert (=> mapNonEmpty!33081 m!884889))

(declare-fun b_lambda!14403 () Bool)

(assert (= b_lambda!14401 (or (and b!952020 b_free!18259) b_lambda!14403)))

(check-sat (not b!952101) (not mapNonEmpty!33081) (not d!115635) (not b!952119) (not bm!41502) (not d!115645) (not b!952186) (not d!115651) (not b!952189) b_and!29741 (not d!115653) (not b!952176) (not b!952181) (not d!115637) (not b!952108) (not b!952180) (not b!952173) (not b!952178) (not b_next!18259) (not b_lambda!14403) (not b!952184) (not bm!41508) (not b!952090) (not b!952129) (not b!952127) (not bm!41503) (not bm!41507) (not b!952102) (not b!952114) (not b!952100) tp_is_empty!20767)
(check-sat b_and!29741 (not b_next!18259))
