; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81304 () Bool)

(assert start!81304)

(declare-fun b!950878 () Bool)

(declare-fun b_free!18259 () Bool)

(declare-fun b_next!18259 () Bool)

(assert (=> b!950878 (= b_free!18259 (not b_next!18259))))

(declare-fun tp!63383 () Bool)

(declare-fun b_and!29699 () Bool)

(assert (=> b!950878 (= tp!63383 b_and!29699)))

(declare-fun b!950871 () Bool)

(declare-fun e!535399 () Bool)

(declare-fun tp_is_empty!20767 () Bool)

(assert (=> b!950871 (= e!535399 tp_is_empty!20767)))

(declare-fun res!637382 () Bool)

(declare-fun e!535398 () Bool)

(assert (=> start!81304 (=> (not res!637382) (not e!535398))))

(declare-datatypes ((V!32655 0))(
  ( (V!32656 (val!10434 Int)) )
))
(declare-datatypes ((ValueCell!9902 0))(
  ( (ValueCellFull!9902 (v!12979 V!32655)) (EmptyCell!9902) )
))
(declare-datatypes ((array!57523 0))(
  ( (array!57524 (arr!27659 (Array (_ BitVec 32) ValueCell!9902)) (size!28139 (_ BitVec 32))) )
))
(declare-datatypes ((array!57525 0))(
  ( (array!57526 (arr!27660 (Array (_ BitVec 32) (_ BitVec 64))) (size!28140 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4954 0))(
  ( (LongMapFixedSize!4955 (defaultEntry!5796 Int) (mask!27605 (_ BitVec 32)) (extraKeys!5528 (_ BitVec 32)) (zeroValue!5632 V!32655) (minValue!5632 V!32655) (_size!2532 (_ BitVec 32)) (_keys!10733 array!57525) (_values!5819 array!57523) (_vacant!2532 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4954)

(declare-fun valid!1890 (LongMapFixedSize!4954) Bool)

(assert (=> start!81304 (= res!637382 (valid!1890 thiss!1141))))

(assert (=> start!81304 e!535398))

(declare-fun e!535393 () Bool)

(assert (=> start!81304 e!535393))

(assert (=> start!81304 true))

(declare-fun b!950872 () Bool)

(declare-fun e!535394 () Bool)

(assert (=> b!950872 (= e!535394 tp_is_empty!20767)))

(declare-fun b!950873 () Bool)

(declare-fun res!637383 () Bool)

(assert (=> b!950873 (=> (not res!637383) (not e!535398))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9147 0))(
  ( (MissingZero!9147 (index!38959 (_ BitVec 32))) (Found!9147 (index!38960 (_ BitVec 32))) (Intermediate!9147 (undefined!9959 Bool) (index!38961 (_ BitVec 32)) (x!81822 (_ BitVec 32))) (Undefined!9147) (MissingVacant!9147 (index!38962 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57525 (_ BitVec 32)) SeekEntryResult!9147)

(assert (=> b!950873 (= res!637383 (not ((_ is Found!9147) (seekEntry!0 key!756 (_keys!10733 thiss!1141) (mask!27605 thiss!1141)))))))

(declare-fun mapNonEmpty!33072 () Bool)

(declare-fun mapRes!33072 () Bool)

(declare-fun tp!63384 () Bool)

(assert (=> mapNonEmpty!33072 (= mapRes!33072 (and tp!63384 e!535399))))

(declare-fun mapValue!33072 () ValueCell!9902)

(declare-fun mapKey!33072 () (_ BitVec 32))

(declare-fun mapRest!33072 () (Array (_ BitVec 32) ValueCell!9902))

(assert (=> mapNonEmpty!33072 (= (arr!27659 (_values!5819 thiss!1141)) (store mapRest!33072 mapKey!33072 mapValue!33072))))

(declare-fun b!950874 () Bool)

(declare-fun res!637380 () Bool)

(assert (=> b!950874 (=> (not res!637380) (not e!535398))))

(assert (=> b!950874 (= res!637380 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!950875 () Bool)

(declare-fun e!535396 () Bool)

(assert (=> b!950875 (= e!535396 (and e!535394 mapRes!33072))))

(declare-fun condMapEmpty!33072 () Bool)

(declare-fun mapDefault!33072 () ValueCell!9902)

(assert (=> b!950875 (= condMapEmpty!33072 (= (arr!27659 (_values!5819 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9902)) mapDefault!33072)))))

(declare-fun b!950876 () Bool)

(declare-fun e!535395 () Bool)

(assert (=> b!950876 (= e!535398 (not e!535395))))

(declare-fun res!637381 () Bool)

(assert (=> b!950876 (=> res!637381 e!535395)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950876 (= res!637381 (not (validMask!0 (mask!27605 thiss!1141))))))

(declare-fun lt!428160 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57525 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950876 (= lt!428160 (arrayScanForKey!0 (_keys!10733 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!950876 (arrayContainsKey!0 (_keys!10733 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31885 0))(
  ( (Unit!31886) )
))
(declare-fun lt!428161 () Unit!31885)

(declare-fun lemmaKeyInListMapIsInArray!308 (array!57525 array!57523 (_ BitVec 32) (_ BitVec 32) V!32655 V!32655 (_ BitVec 64) Int) Unit!31885)

(assert (=> b!950876 (= lt!428161 (lemmaKeyInListMapIsInArray!308 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) key!756 (defaultEntry!5796 thiss!1141)))))

(declare-fun b!950877 () Bool)

(declare-fun res!637379 () Bool)

(assert (=> b!950877 (=> (not res!637379) (not e!535398))))

(declare-datatypes ((tuple2!13606 0))(
  ( (tuple2!13607 (_1!6814 (_ BitVec 64)) (_2!6814 V!32655)) )
))
(declare-datatypes ((List!19351 0))(
  ( (Nil!19348) (Cons!19347 (h!20508 tuple2!13606) (t!27687 List!19351)) )
))
(declare-datatypes ((ListLongMap!12293 0))(
  ( (ListLongMap!12294 (toList!6162 List!19351)) )
))
(declare-fun contains!5198 (ListLongMap!12293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3324 (array!57525 array!57523 (_ BitVec 32) (_ BitVec 32) V!32655 V!32655 (_ BitVec 32) Int) ListLongMap!12293)

(assert (=> b!950877 (= res!637379 (contains!5198 (getCurrentListMap!3324 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)) key!756))))

(declare-fun array_inv!21526 (array!57525) Bool)

(declare-fun array_inv!21527 (array!57523) Bool)

(assert (=> b!950878 (= e!535393 (and tp!63383 tp_is_empty!20767 (array_inv!21526 (_keys!10733 thiss!1141)) (array_inv!21527 (_values!5819 thiss!1141)) e!535396))))

(declare-fun mapIsEmpty!33072 () Bool)

(assert (=> mapIsEmpty!33072 mapRes!33072))

(declare-fun b!950879 () Bool)

(assert (=> b!950879 (= e!535395 (or (not (= (size!28140 (_keys!10733 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27605 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!28140 (_keys!10733 thiss!1141))) (and (bvsge lt!428160 #b00000000000000000000000000000000) (bvsle lt!428160 (size!28140 (_keys!10733 thiss!1141))))))))

(assert (= (and start!81304 res!637382) b!950874))

(assert (= (and b!950874 res!637380) b!950873))

(assert (= (and b!950873 res!637383) b!950877))

(assert (= (and b!950877 res!637379) b!950876))

(assert (= (and b!950876 (not res!637381)) b!950879))

(assert (= (and b!950875 condMapEmpty!33072) mapIsEmpty!33072))

(assert (= (and b!950875 (not condMapEmpty!33072)) mapNonEmpty!33072))

(assert (= (and mapNonEmpty!33072 ((_ is ValueCellFull!9902) mapValue!33072)) b!950871))

(assert (= (and b!950875 ((_ is ValueCellFull!9902) mapDefault!33072)) b!950872))

(assert (= b!950878 b!950875))

(assert (= start!81304 b!950878))

(declare-fun m!882679 () Bool)

(assert (=> b!950877 m!882679))

(assert (=> b!950877 m!882679))

(declare-fun m!882681 () Bool)

(assert (=> b!950877 m!882681))

(declare-fun m!882683 () Bool)

(assert (=> start!81304 m!882683))

(declare-fun m!882685 () Bool)

(assert (=> mapNonEmpty!33072 m!882685))

(declare-fun m!882687 () Bool)

(assert (=> b!950878 m!882687))

(declare-fun m!882689 () Bool)

(assert (=> b!950878 m!882689))

(declare-fun m!882691 () Bool)

(assert (=> b!950876 m!882691))

(declare-fun m!882693 () Bool)

(assert (=> b!950876 m!882693))

(declare-fun m!882695 () Bool)

(assert (=> b!950876 m!882695))

(declare-fun m!882697 () Bool)

(assert (=> b!950876 m!882697))

(declare-fun m!882699 () Bool)

(assert (=> b!950873 m!882699))

(check-sat (not mapNonEmpty!33072) (not b!950878) (not b!950873) (not start!81304) tp_is_empty!20767 (not b_next!18259) (not b!950876) (not b!950877) b_and!29699)
(check-sat b_and!29699 (not b_next!18259))
(get-model)

(declare-fun d!115115 () Bool)

(assert (=> d!115115 (= (array_inv!21526 (_keys!10733 thiss!1141)) (bvsge (size!28140 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950878 d!115115))

(declare-fun d!115117 () Bool)

(assert (=> d!115117 (= (array_inv!21527 (_values!5819 thiss!1141)) (bvsge (size!28139 (_values!5819 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950878 d!115117))

(declare-fun d!115119 () Bool)

(declare-fun res!637420 () Bool)

(declare-fun e!535444 () Bool)

(assert (=> d!115119 (=> (not res!637420) (not e!535444))))

(declare-fun simpleValid!377 (LongMapFixedSize!4954) Bool)

(assert (=> d!115119 (= res!637420 (simpleValid!377 thiss!1141))))

(assert (=> d!115119 (= (valid!1890 thiss!1141) e!535444)))

(declare-fun b!950940 () Bool)

(declare-fun res!637421 () Bool)

(assert (=> b!950940 (=> (not res!637421) (not e!535444))))

(declare-fun arrayCountValidKeys!0 (array!57525 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950940 (= res!637421 (= (arrayCountValidKeys!0 (_keys!10733 thiss!1141) #b00000000000000000000000000000000 (size!28140 (_keys!10733 thiss!1141))) (_size!2532 thiss!1141)))))

(declare-fun b!950941 () Bool)

(declare-fun res!637422 () Bool)

(assert (=> b!950941 (=> (not res!637422) (not e!535444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57525 (_ BitVec 32)) Bool)

(assert (=> b!950941 (= res!637422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10733 thiss!1141) (mask!27605 thiss!1141)))))

(declare-fun b!950942 () Bool)

(declare-datatypes ((List!19354 0))(
  ( (Nil!19351) (Cons!19350 (h!20511 (_ BitVec 64)) (t!27692 List!19354)) )
))
(declare-fun arrayNoDuplicates!0 (array!57525 (_ BitVec 32) List!19354) Bool)

(assert (=> b!950942 (= e!535444 (arrayNoDuplicates!0 (_keys!10733 thiss!1141) #b00000000000000000000000000000000 Nil!19351))))

(assert (= (and d!115119 res!637420) b!950940))

(assert (= (and b!950940 res!637421) b!950941))

(assert (= (and b!950941 res!637422) b!950942))

(declare-fun m!882745 () Bool)

(assert (=> d!115119 m!882745))

(declare-fun m!882747 () Bool)

(assert (=> b!950940 m!882747))

(declare-fun m!882749 () Bool)

(assert (=> b!950941 m!882749))

(declare-fun m!882751 () Bool)

(assert (=> b!950942 m!882751))

(assert (=> start!81304 d!115119))

(declare-fun d!115121 () Bool)

(assert (=> d!115121 (= (validMask!0 (mask!27605 thiss!1141)) (and (or (= (mask!27605 thiss!1141) #b00000000000000000000000000000111) (= (mask!27605 thiss!1141) #b00000000000000000000000000001111) (= (mask!27605 thiss!1141) #b00000000000000000000000000011111) (= (mask!27605 thiss!1141) #b00000000000000000000000000111111) (= (mask!27605 thiss!1141) #b00000000000000000000000001111111) (= (mask!27605 thiss!1141) #b00000000000000000000000011111111) (= (mask!27605 thiss!1141) #b00000000000000000000000111111111) (= (mask!27605 thiss!1141) #b00000000000000000000001111111111) (= (mask!27605 thiss!1141) #b00000000000000000000011111111111) (= (mask!27605 thiss!1141) #b00000000000000000000111111111111) (= (mask!27605 thiss!1141) #b00000000000000000001111111111111) (= (mask!27605 thiss!1141) #b00000000000000000011111111111111) (= (mask!27605 thiss!1141) #b00000000000000000111111111111111) (= (mask!27605 thiss!1141) #b00000000000000001111111111111111) (= (mask!27605 thiss!1141) #b00000000000000011111111111111111) (= (mask!27605 thiss!1141) #b00000000000000111111111111111111) (= (mask!27605 thiss!1141) #b00000000000001111111111111111111) (= (mask!27605 thiss!1141) #b00000000000011111111111111111111) (= (mask!27605 thiss!1141) #b00000000000111111111111111111111) (= (mask!27605 thiss!1141) #b00000000001111111111111111111111) (= (mask!27605 thiss!1141) #b00000000011111111111111111111111) (= (mask!27605 thiss!1141) #b00000000111111111111111111111111) (= (mask!27605 thiss!1141) #b00000001111111111111111111111111) (= (mask!27605 thiss!1141) #b00000011111111111111111111111111) (= (mask!27605 thiss!1141) #b00000111111111111111111111111111) (= (mask!27605 thiss!1141) #b00001111111111111111111111111111) (= (mask!27605 thiss!1141) #b00011111111111111111111111111111) (= (mask!27605 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27605 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!950876 d!115121))

(declare-fun d!115123 () Bool)

(declare-fun lt!428176 () (_ BitVec 32))

(assert (=> d!115123 (and (or (bvslt lt!428176 #b00000000000000000000000000000000) (bvsge lt!428176 (size!28140 (_keys!10733 thiss!1141))) (and (bvsge lt!428176 #b00000000000000000000000000000000) (bvslt lt!428176 (size!28140 (_keys!10733 thiss!1141))))) (bvsge lt!428176 #b00000000000000000000000000000000) (bvslt lt!428176 (size!28140 (_keys!10733 thiss!1141))) (= (select (arr!27660 (_keys!10733 thiss!1141)) lt!428176) key!756))))

(declare-fun e!535447 () (_ BitVec 32))

(assert (=> d!115123 (= lt!428176 e!535447)))

(declare-fun c!99322 () Bool)

(assert (=> d!115123 (= c!99322 (= (select (arr!27660 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115123 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28140 (_keys!10733 thiss!1141))) (bvslt (size!28140 (_keys!10733 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115123 (= (arrayScanForKey!0 (_keys!10733 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428176)))

(declare-fun b!950947 () Bool)

(assert (=> b!950947 (= e!535447 #b00000000000000000000000000000000)))

(declare-fun b!950948 () Bool)

(assert (=> b!950948 (= e!535447 (arrayScanForKey!0 (_keys!10733 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115123 c!99322) b!950947))

(assert (= (and d!115123 (not c!99322)) b!950948))

(declare-fun m!882753 () Bool)

(assert (=> d!115123 m!882753))

(declare-fun m!882755 () Bool)

(assert (=> d!115123 m!882755))

(declare-fun m!882757 () Bool)

(assert (=> b!950948 m!882757))

(assert (=> b!950876 d!115123))

(declare-fun d!115125 () Bool)

(declare-fun res!637427 () Bool)

(declare-fun e!535452 () Bool)

(assert (=> d!115125 (=> res!637427 e!535452)))

(assert (=> d!115125 (= res!637427 (= (select (arr!27660 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115125 (= (arrayContainsKey!0 (_keys!10733 thiss!1141) key!756 #b00000000000000000000000000000000) e!535452)))

(declare-fun b!950953 () Bool)

(declare-fun e!535453 () Bool)

(assert (=> b!950953 (= e!535452 e!535453)))

(declare-fun res!637428 () Bool)

(assert (=> b!950953 (=> (not res!637428) (not e!535453))))

(assert (=> b!950953 (= res!637428 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28140 (_keys!10733 thiss!1141))))))

(declare-fun b!950954 () Bool)

(assert (=> b!950954 (= e!535453 (arrayContainsKey!0 (_keys!10733 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115125 (not res!637427)) b!950953))

(assert (= (and b!950953 res!637428) b!950954))

(assert (=> d!115125 m!882755))

(declare-fun m!882759 () Bool)

(assert (=> b!950954 m!882759))

(assert (=> b!950876 d!115125))

(declare-fun d!115127 () Bool)

(declare-fun e!535456 () Bool)

(assert (=> d!115127 e!535456))

(declare-fun c!99325 () Bool)

(assert (=> d!115127 (= c!99325 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428179 () Unit!31885)

(declare-fun choose!1599 (array!57525 array!57523 (_ BitVec 32) (_ BitVec 32) V!32655 V!32655 (_ BitVec 64) Int) Unit!31885)

(assert (=> d!115127 (= lt!428179 (choose!1599 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) key!756 (defaultEntry!5796 thiss!1141)))))

(assert (=> d!115127 (validMask!0 (mask!27605 thiss!1141))))

(assert (=> d!115127 (= (lemmaKeyInListMapIsInArray!308 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) key!756 (defaultEntry!5796 thiss!1141)) lt!428179)))

(declare-fun b!950959 () Bool)

(assert (=> b!950959 (= e!535456 (arrayContainsKey!0 (_keys!10733 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!950960 () Bool)

(assert (=> b!950960 (= e!535456 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115127 c!99325) b!950959))

(assert (= (and d!115127 (not c!99325)) b!950960))

(declare-fun m!882761 () Bool)

(assert (=> d!115127 m!882761))

(assert (=> d!115127 m!882691))

(assert (=> b!950959 m!882695))

(assert (=> b!950876 d!115127))

(declare-fun d!115129 () Bool)

(declare-fun e!535461 () Bool)

(assert (=> d!115129 e!535461))

(declare-fun res!637431 () Bool)

(assert (=> d!115129 (=> res!637431 e!535461)))

(declare-fun lt!428189 () Bool)

(assert (=> d!115129 (= res!637431 (not lt!428189))))

(declare-fun lt!428190 () Bool)

(assert (=> d!115129 (= lt!428189 lt!428190)))

(declare-fun lt!428191 () Unit!31885)

(declare-fun e!535462 () Unit!31885)

(assert (=> d!115129 (= lt!428191 e!535462)))

(declare-fun c!99328 () Bool)

(assert (=> d!115129 (= c!99328 lt!428190)))

(declare-fun containsKey!467 (List!19351 (_ BitVec 64)) Bool)

(assert (=> d!115129 (= lt!428190 (containsKey!467 (toList!6162 (getCurrentListMap!3324 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141))) key!756))))

(assert (=> d!115129 (= (contains!5198 (getCurrentListMap!3324 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)) key!756) lt!428189)))

(declare-fun b!950967 () Bool)

(declare-fun lt!428188 () Unit!31885)

(assert (=> b!950967 (= e!535462 lt!428188)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!362 (List!19351 (_ BitVec 64)) Unit!31885)

(assert (=> b!950967 (= lt!428188 (lemmaContainsKeyImpliesGetValueByKeyDefined!362 (toList!6162 (getCurrentListMap!3324 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141))) key!756))))

(declare-datatypes ((Option!509 0))(
  ( (Some!508 (v!12982 V!32655)) (None!507) )
))
(declare-fun isDefined!375 (Option!509) Bool)

(declare-fun getValueByKey!503 (List!19351 (_ BitVec 64)) Option!509)

(assert (=> b!950967 (isDefined!375 (getValueByKey!503 (toList!6162 (getCurrentListMap!3324 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141))) key!756))))

(declare-fun b!950968 () Bool)

(declare-fun Unit!31889 () Unit!31885)

(assert (=> b!950968 (= e!535462 Unit!31889)))

(declare-fun b!950969 () Bool)

(assert (=> b!950969 (= e!535461 (isDefined!375 (getValueByKey!503 (toList!6162 (getCurrentListMap!3324 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141))) key!756)))))

(assert (= (and d!115129 c!99328) b!950967))

(assert (= (and d!115129 (not c!99328)) b!950968))

(assert (= (and d!115129 (not res!637431)) b!950969))

(declare-fun m!882763 () Bool)

(assert (=> d!115129 m!882763))

(declare-fun m!882765 () Bool)

(assert (=> b!950967 m!882765))

(declare-fun m!882767 () Bool)

(assert (=> b!950967 m!882767))

(assert (=> b!950967 m!882767))

(declare-fun m!882769 () Bool)

(assert (=> b!950967 m!882769))

(assert (=> b!950969 m!882767))

(assert (=> b!950969 m!882767))

(assert (=> b!950969 m!882769))

(assert (=> b!950877 d!115129))

(declare-fun b!951012 () Bool)

(declare-fun e!535498 () Bool)

(declare-fun e!535493 () Bool)

(assert (=> b!951012 (= e!535498 e!535493)))

(declare-fun res!637454 () Bool)

(assert (=> b!951012 (=> (not res!637454) (not e!535493))))

(declare-fun lt!428257 () ListLongMap!12293)

(assert (=> b!951012 (= res!637454 (contains!5198 lt!428257 (select (arr!27660 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951012 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28140 (_keys!10733 thiss!1141))))))

(declare-fun b!951013 () Bool)

(declare-fun e!535499 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!951013 (= e!535499 (validKeyInArray!0 (select (arr!27660 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41431 () Bool)

(declare-fun call!41438 () ListLongMap!12293)

(declare-fun call!41439 () ListLongMap!12293)

(assert (=> bm!41431 (= call!41438 call!41439)))

(declare-fun b!951014 () Bool)

(declare-fun e!535497 () Unit!31885)

(declare-fun Unit!31890 () Unit!31885)

(assert (=> b!951014 (= e!535497 Unit!31890)))

(declare-fun b!951015 () Bool)

(declare-fun c!99341 () Bool)

(assert (=> b!951015 (= c!99341 (and (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!535495 () ListLongMap!12293)

(declare-fun e!535496 () ListLongMap!12293)

(assert (=> b!951015 (= e!535495 e!535496)))

(declare-fun b!951016 () Bool)

(declare-fun e!535500 () Bool)

(declare-fun apply!874 (ListLongMap!12293 (_ BitVec 64)) V!32655)

(assert (=> b!951016 (= e!535500 (= (apply!874 lt!428257 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5632 thiss!1141)))))

(declare-fun call!41434 () ListLongMap!12293)

(declare-fun bm!41432 () Bool)

(declare-fun call!41437 () ListLongMap!12293)

(declare-fun c!99342 () Bool)

(declare-fun c!99344 () Bool)

(declare-fun +!2884 (ListLongMap!12293 tuple2!13606) ListLongMap!12293)

(assert (=> bm!41432 (= call!41437 (+!2884 (ite c!99344 call!41434 (ite c!99342 call!41439 call!41438)) (ite (or c!99344 c!99342) (tuple2!13607 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5632 thiss!1141)) (tuple2!13607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5632 thiss!1141)))))))

(declare-fun b!951017 () Bool)

(declare-fun e!535490 () ListLongMap!12293)

(assert (=> b!951017 (= e!535490 (+!2884 call!41437 (tuple2!13607 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5632 thiss!1141))))))

(declare-fun b!951018 () Bool)

(declare-fun call!41435 () ListLongMap!12293)

(assert (=> b!951018 (= e!535495 call!41435)))

(declare-fun b!951019 () Bool)

(declare-fun e!535492 () Bool)

(declare-fun call!41440 () Bool)

(assert (=> b!951019 (= e!535492 (not call!41440))))

(declare-fun b!951020 () Bool)

(assert (=> b!951020 (= e!535496 call!41435)))

(declare-fun b!951021 () Bool)

(declare-fun res!637458 () Bool)

(declare-fun e!535501 () Bool)

(assert (=> b!951021 (=> (not res!637458) (not e!535501))))

(declare-fun e!535494 () Bool)

(assert (=> b!951021 (= res!637458 e!535494)))

(declare-fun c!99346 () Bool)

(assert (=> b!951021 (= c!99346 (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!951022 () Bool)

(declare-fun res!637451 () Bool)

(assert (=> b!951022 (=> (not res!637451) (not e!535501))))

(assert (=> b!951022 (= res!637451 e!535498)))

(declare-fun res!637457 () Bool)

(assert (=> b!951022 (=> res!637457 e!535498)))

(assert (=> b!951022 (= res!637457 (not e!535499))))

(declare-fun res!637452 () Bool)

(assert (=> b!951022 (=> (not res!637452) (not e!535499))))

(assert (=> b!951022 (= res!637452 (bvslt #b00000000000000000000000000000000 (size!28140 (_keys!10733 thiss!1141))))))

(declare-fun b!951023 () Bool)

(declare-fun lt!428248 () Unit!31885)

(assert (=> b!951023 (= e!535497 lt!428248)))

(declare-fun lt!428239 () ListLongMap!12293)

(declare-fun getCurrentListMapNoExtraKeys!3356 (array!57525 array!57523 (_ BitVec 32) (_ BitVec 32) V!32655 V!32655 (_ BitVec 32) Int) ListLongMap!12293)

(assert (=> b!951023 (= lt!428239 (getCurrentListMapNoExtraKeys!3356 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)))))

(declare-fun lt!428256 () (_ BitVec 64))

(assert (=> b!951023 (= lt!428256 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428253 () (_ BitVec 64))

(assert (=> b!951023 (= lt!428253 (select (arr!27660 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428251 () Unit!31885)

(declare-fun addStillContains!573 (ListLongMap!12293 (_ BitVec 64) V!32655 (_ BitVec 64)) Unit!31885)

(assert (=> b!951023 (= lt!428251 (addStillContains!573 lt!428239 lt!428256 (zeroValue!5632 thiss!1141) lt!428253))))

(assert (=> b!951023 (contains!5198 (+!2884 lt!428239 (tuple2!13607 lt!428256 (zeroValue!5632 thiss!1141))) lt!428253)))

(declare-fun lt!428240 () Unit!31885)

(assert (=> b!951023 (= lt!428240 lt!428251)))

(declare-fun lt!428247 () ListLongMap!12293)

(assert (=> b!951023 (= lt!428247 (getCurrentListMapNoExtraKeys!3356 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)))))

(declare-fun lt!428237 () (_ BitVec 64))

(assert (=> b!951023 (= lt!428237 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428255 () (_ BitVec 64))

(assert (=> b!951023 (= lt!428255 (select (arr!27660 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428241 () Unit!31885)

(declare-fun addApplyDifferent!453 (ListLongMap!12293 (_ BitVec 64) V!32655 (_ BitVec 64)) Unit!31885)

(assert (=> b!951023 (= lt!428241 (addApplyDifferent!453 lt!428247 lt!428237 (minValue!5632 thiss!1141) lt!428255))))

(assert (=> b!951023 (= (apply!874 (+!2884 lt!428247 (tuple2!13607 lt!428237 (minValue!5632 thiss!1141))) lt!428255) (apply!874 lt!428247 lt!428255))))

(declare-fun lt!428244 () Unit!31885)

(assert (=> b!951023 (= lt!428244 lt!428241)))

(declare-fun lt!428243 () ListLongMap!12293)

(assert (=> b!951023 (= lt!428243 (getCurrentListMapNoExtraKeys!3356 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)))))

(declare-fun lt!428238 () (_ BitVec 64))

(assert (=> b!951023 (= lt!428238 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428252 () (_ BitVec 64))

(assert (=> b!951023 (= lt!428252 (select (arr!27660 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428254 () Unit!31885)

(assert (=> b!951023 (= lt!428254 (addApplyDifferent!453 lt!428243 lt!428238 (zeroValue!5632 thiss!1141) lt!428252))))

(assert (=> b!951023 (= (apply!874 (+!2884 lt!428243 (tuple2!13607 lt!428238 (zeroValue!5632 thiss!1141))) lt!428252) (apply!874 lt!428243 lt!428252))))

(declare-fun lt!428250 () Unit!31885)

(assert (=> b!951023 (= lt!428250 lt!428254)))

(declare-fun lt!428249 () ListLongMap!12293)

(assert (=> b!951023 (= lt!428249 (getCurrentListMapNoExtraKeys!3356 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)))))

(declare-fun lt!428246 () (_ BitVec 64))

(assert (=> b!951023 (= lt!428246 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428236 () (_ BitVec 64))

(assert (=> b!951023 (= lt!428236 (select (arr!27660 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951023 (= lt!428248 (addApplyDifferent!453 lt!428249 lt!428246 (minValue!5632 thiss!1141) lt!428236))))

(assert (=> b!951023 (= (apply!874 (+!2884 lt!428249 (tuple2!13607 lt!428246 (minValue!5632 thiss!1141))) lt!428236) (apply!874 lt!428249 lt!428236))))

(declare-fun b!951024 () Bool)

(declare-fun e!535491 () Bool)

(assert (=> b!951024 (= e!535491 (= (apply!874 lt!428257 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5632 thiss!1141)))))

(declare-fun b!951025 () Bool)

(assert (=> b!951025 (= e!535492 e!535500)))

(declare-fun res!637455 () Bool)

(assert (=> b!951025 (= res!637455 call!41440)))

(assert (=> b!951025 (=> (not res!637455) (not e!535500))))

(declare-fun bm!41433 () Bool)

(declare-fun call!41436 () Bool)

(assert (=> bm!41433 (= call!41436 (contains!5198 lt!428257 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951026 () Bool)

(assert (=> b!951026 (= e!535501 e!535492)))

(declare-fun c!99343 () Bool)

(assert (=> b!951026 (= c!99343 (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951027 () Bool)

(assert (=> b!951027 (= e!535496 call!41438)))

(declare-fun b!951028 () Bool)

(assert (=> b!951028 (= e!535490 e!535495)))

(assert (=> b!951028 (= c!99342 (and (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951029 () Bool)

(declare-fun e!535489 () Bool)

(assert (=> b!951029 (= e!535489 (validKeyInArray!0 (select (arr!27660 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951030 () Bool)

(assert (=> b!951030 (= e!535494 (not call!41436))))

(declare-fun b!951031 () Bool)

(declare-fun get!14538 (ValueCell!9902 V!32655) V!32655)

(declare-fun dynLambda!1640 (Int (_ BitVec 64)) V!32655)

(assert (=> b!951031 (= e!535493 (= (apply!874 lt!428257 (select (arr!27660 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000)) (get!14538 (select (arr!27659 (_values!5819 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1640 (defaultEntry!5796 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951031 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28139 (_values!5819 thiss!1141))))))

(assert (=> b!951031 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28140 (_keys!10733 thiss!1141))))))

(declare-fun bm!41434 () Bool)

(assert (=> bm!41434 (= call!41439 call!41434)))

(declare-fun bm!41435 () Bool)

(assert (=> bm!41435 (= call!41435 call!41437)))

(declare-fun b!951032 () Bool)

(assert (=> b!951032 (= e!535494 e!535491)))

(declare-fun res!637456 () Bool)

(assert (=> b!951032 (= res!637456 call!41436)))

(assert (=> b!951032 (=> (not res!637456) (not e!535491))))

(declare-fun bm!41436 () Bool)

(assert (=> bm!41436 (= call!41434 (getCurrentListMapNoExtraKeys!3356 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)))))

(declare-fun d!115131 () Bool)

(assert (=> d!115131 e!535501))

(declare-fun res!637450 () Bool)

(assert (=> d!115131 (=> (not res!637450) (not e!535501))))

(assert (=> d!115131 (= res!637450 (or (bvsge #b00000000000000000000000000000000 (size!28140 (_keys!10733 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28140 (_keys!10733 thiss!1141))))))))

(declare-fun lt!428245 () ListLongMap!12293)

(assert (=> d!115131 (= lt!428257 lt!428245)))

(declare-fun lt!428242 () Unit!31885)

(assert (=> d!115131 (= lt!428242 e!535497)))

(declare-fun c!99345 () Bool)

(assert (=> d!115131 (= c!99345 e!535489)))

(declare-fun res!637453 () Bool)

(assert (=> d!115131 (=> (not res!637453) (not e!535489))))

(assert (=> d!115131 (= res!637453 (bvslt #b00000000000000000000000000000000 (size!28140 (_keys!10733 thiss!1141))))))

(assert (=> d!115131 (= lt!428245 e!535490)))

(assert (=> d!115131 (= c!99344 (and (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5528 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115131 (validMask!0 (mask!27605 thiss!1141))))

(assert (=> d!115131 (= (getCurrentListMap!3324 (_keys!10733 thiss!1141) (_values!5819 thiss!1141) (mask!27605 thiss!1141) (extraKeys!5528 thiss!1141) (zeroValue!5632 thiss!1141) (minValue!5632 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5796 thiss!1141)) lt!428257)))

(declare-fun bm!41437 () Bool)

(assert (=> bm!41437 (= call!41440 (contains!5198 lt!428257 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115131 c!99344) b!951017))

(assert (= (and d!115131 (not c!99344)) b!951028))

(assert (= (and b!951028 c!99342) b!951018))

(assert (= (and b!951028 (not c!99342)) b!951015))

(assert (= (and b!951015 c!99341) b!951020))

(assert (= (and b!951015 (not c!99341)) b!951027))

(assert (= (or b!951020 b!951027) bm!41431))

(assert (= (or b!951018 bm!41431) bm!41434))

(assert (= (or b!951018 b!951020) bm!41435))

(assert (= (or b!951017 bm!41434) bm!41436))

(assert (= (or b!951017 bm!41435) bm!41432))

(assert (= (and d!115131 res!637453) b!951029))

(assert (= (and d!115131 c!99345) b!951023))

(assert (= (and d!115131 (not c!99345)) b!951014))

(assert (= (and d!115131 res!637450) b!951022))

(assert (= (and b!951022 res!637452) b!951013))

(assert (= (and b!951022 (not res!637457)) b!951012))

(assert (= (and b!951012 res!637454) b!951031))

(assert (= (and b!951022 res!637451) b!951021))

(assert (= (and b!951021 c!99346) b!951032))

(assert (= (and b!951021 (not c!99346)) b!951030))

(assert (= (and b!951032 res!637456) b!951024))

(assert (= (or b!951032 b!951030) bm!41433))

(assert (= (and b!951021 res!637458) b!951026))

(assert (= (and b!951026 c!99343) b!951025))

(assert (= (and b!951026 (not c!99343)) b!951019))

(assert (= (and b!951025 res!637455) b!951016))

(assert (= (or b!951025 b!951019) bm!41437))

(declare-fun b_lambda!14369 () Bool)

(assert (=> (not b_lambda!14369) (not b!951031)))

(declare-fun t!27691 () Bool)

(declare-fun tb!6189 () Bool)

(assert (=> (and b!950878 (= (defaultEntry!5796 thiss!1141) (defaultEntry!5796 thiss!1141)) t!27691) tb!6189))

(declare-fun result!12305 () Bool)

(assert (=> tb!6189 (= result!12305 tp_is_empty!20767)))

(assert (=> b!951031 t!27691))

(declare-fun b_and!29705 () Bool)

(assert (= b_and!29699 (and (=> t!27691 result!12305) b_and!29705)))

(declare-fun m!882771 () Bool)

(assert (=> bm!41436 m!882771))

(declare-fun m!882773 () Bool)

(assert (=> bm!41432 m!882773))

(assert (=> b!951013 m!882755))

(assert (=> b!951013 m!882755))

(declare-fun m!882775 () Bool)

(assert (=> b!951013 m!882775))

(declare-fun m!882777 () Bool)

(assert (=> b!951024 m!882777))

(declare-fun m!882779 () Bool)

(assert (=> bm!41433 m!882779))

(assert (=> b!951031 m!882755))

(declare-fun m!882781 () Bool)

(assert (=> b!951031 m!882781))

(declare-fun m!882783 () Bool)

(assert (=> b!951031 m!882783))

(declare-fun m!882785 () Bool)

(assert (=> b!951031 m!882785))

(declare-fun m!882787 () Bool)

(assert (=> b!951031 m!882787))

(assert (=> b!951031 m!882783))

(assert (=> b!951031 m!882755))

(assert (=> b!951031 m!882785))

(declare-fun m!882789 () Bool)

(assert (=> b!951016 m!882789))

(declare-fun m!882791 () Bool)

(assert (=> b!951017 m!882791))

(declare-fun m!882793 () Bool)

(assert (=> b!951023 m!882793))

(assert (=> b!951023 m!882771))

(declare-fun m!882795 () Bool)

(assert (=> b!951023 m!882795))

(declare-fun m!882797 () Bool)

(assert (=> b!951023 m!882797))

(declare-fun m!882799 () Bool)

(assert (=> b!951023 m!882799))

(declare-fun m!882801 () Bool)

(assert (=> b!951023 m!882801))

(declare-fun m!882803 () Bool)

(assert (=> b!951023 m!882803))

(declare-fun m!882805 () Bool)

(assert (=> b!951023 m!882805))

(declare-fun m!882807 () Bool)

(assert (=> b!951023 m!882807))

(assert (=> b!951023 m!882755))

(declare-fun m!882809 () Bool)

(assert (=> b!951023 m!882809))

(declare-fun m!882811 () Bool)

(assert (=> b!951023 m!882811))

(declare-fun m!882813 () Bool)

(assert (=> b!951023 m!882813))

(declare-fun m!882815 () Bool)

(assert (=> b!951023 m!882815))

(declare-fun m!882817 () Bool)

(assert (=> b!951023 m!882817))

(assert (=> b!951023 m!882795))

(assert (=> b!951023 m!882809))

(declare-fun m!882819 () Bool)

(assert (=> b!951023 m!882819))

(assert (=> b!951023 m!882799))

(declare-fun m!882821 () Bool)

(assert (=> b!951023 m!882821))

(assert (=> b!951023 m!882803))

(assert (=> b!951029 m!882755))

(assert (=> b!951029 m!882755))

(assert (=> b!951029 m!882775))

(declare-fun m!882823 () Bool)

(assert (=> bm!41437 m!882823))

(assert (=> d!115131 m!882691))

(assert (=> b!951012 m!882755))

(assert (=> b!951012 m!882755))

(declare-fun m!882825 () Bool)

(assert (=> b!951012 m!882825))

(assert (=> b!950877 d!115131))

(declare-fun b!951047 () Bool)

(declare-fun c!99355 () Bool)

(declare-fun lt!428266 () (_ BitVec 64))

(assert (=> b!951047 (= c!99355 (= lt!428266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!535510 () SeekEntryResult!9147)

(declare-fun e!535508 () SeekEntryResult!9147)

(assert (=> b!951047 (= e!535510 e!535508)))

(declare-fun b!951048 () Bool)

(declare-fun e!535509 () SeekEntryResult!9147)

(assert (=> b!951048 (= e!535509 Undefined!9147)))

(declare-fun b!951049 () Bool)

(assert (=> b!951049 (= e!535509 e!535510)))

(declare-fun lt!428269 () SeekEntryResult!9147)

(assert (=> b!951049 (= lt!428266 (select (arr!27660 (_keys!10733 thiss!1141)) (index!38961 lt!428269)))))

(declare-fun c!99353 () Bool)

(assert (=> b!951049 (= c!99353 (= lt!428266 key!756))))

(declare-fun b!951050 () Bool)

(assert (=> b!951050 (= e!535508 (MissingZero!9147 (index!38961 lt!428269)))))

(declare-fun b!951051 () Bool)

(assert (=> b!951051 (= e!535510 (Found!9147 (index!38961 lt!428269)))))

(declare-fun b!951052 () Bool)

(declare-fun lt!428268 () SeekEntryResult!9147)

(assert (=> b!951052 (= e!535508 (ite ((_ is MissingVacant!9147) lt!428268) (MissingZero!9147 (index!38962 lt!428268)) lt!428268))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57525 (_ BitVec 32)) SeekEntryResult!9147)

(assert (=> b!951052 (= lt!428268 (seekKeyOrZeroReturnVacant!0 (x!81822 lt!428269) (index!38961 lt!428269) (index!38961 lt!428269) key!756 (_keys!10733 thiss!1141) (mask!27605 thiss!1141)))))

(declare-fun d!115133 () Bool)

(declare-fun lt!428267 () SeekEntryResult!9147)

(assert (=> d!115133 (and (or ((_ is MissingVacant!9147) lt!428267) (not ((_ is Found!9147) lt!428267)) (and (bvsge (index!38960 lt!428267) #b00000000000000000000000000000000) (bvslt (index!38960 lt!428267) (size!28140 (_keys!10733 thiss!1141))))) (not ((_ is MissingVacant!9147) lt!428267)) (or (not ((_ is Found!9147) lt!428267)) (= (select (arr!27660 (_keys!10733 thiss!1141)) (index!38960 lt!428267)) key!756)))))

(assert (=> d!115133 (= lt!428267 e!535509)))

(declare-fun c!99354 () Bool)

(assert (=> d!115133 (= c!99354 (and ((_ is Intermediate!9147) lt!428269) (undefined!9959 lt!428269)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57525 (_ BitVec 32)) SeekEntryResult!9147)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115133 (= lt!428269 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27605 thiss!1141)) key!756 (_keys!10733 thiss!1141) (mask!27605 thiss!1141)))))

(assert (=> d!115133 (validMask!0 (mask!27605 thiss!1141))))

(assert (=> d!115133 (= (seekEntry!0 key!756 (_keys!10733 thiss!1141) (mask!27605 thiss!1141)) lt!428267)))

(assert (= (and d!115133 c!99354) b!951048))

(assert (= (and d!115133 (not c!99354)) b!951049))

(assert (= (and b!951049 c!99353) b!951051))

(assert (= (and b!951049 (not c!99353)) b!951047))

(assert (= (and b!951047 c!99355) b!951050))

(assert (= (and b!951047 (not c!99355)) b!951052))

(declare-fun m!882827 () Bool)

(assert (=> b!951049 m!882827))

(declare-fun m!882829 () Bool)

(assert (=> b!951052 m!882829))

(declare-fun m!882831 () Bool)

(assert (=> d!115133 m!882831))

(declare-fun m!882833 () Bool)

(assert (=> d!115133 m!882833))

(assert (=> d!115133 m!882833))

(declare-fun m!882835 () Bool)

(assert (=> d!115133 m!882835))

(assert (=> d!115133 m!882691))

(assert (=> b!950873 d!115133))

(declare-fun mapIsEmpty!33081 () Bool)

(declare-fun mapRes!33081 () Bool)

(assert (=> mapIsEmpty!33081 mapRes!33081))

(declare-fun b!951060 () Bool)

(declare-fun e!535516 () Bool)

(assert (=> b!951060 (= e!535516 tp_is_empty!20767)))

(declare-fun condMapEmpty!33081 () Bool)

(declare-fun mapDefault!33081 () ValueCell!9902)

(assert (=> mapNonEmpty!33072 (= condMapEmpty!33081 (= mapRest!33072 ((as const (Array (_ BitVec 32) ValueCell!9902)) mapDefault!33081)))))

(assert (=> mapNonEmpty!33072 (= tp!63384 (and e!535516 mapRes!33081))))

(declare-fun b!951059 () Bool)

(declare-fun e!535515 () Bool)

(assert (=> b!951059 (= e!535515 tp_is_empty!20767)))

(declare-fun mapNonEmpty!33081 () Bool)

(declare-fun tp!63399 () Bool)

(assert (=> mapNonEmpty!33081 (= mapRes!33081 (and tp!63399 e!535515))))

(declare-fun mapValue!33081 () ValueCell!9902)

(declare-fun mapRest!33081 () (Array (_ BitVec 32) ValueCell!9902))

(declare-fun mapKey!33081 () (_ BitVec 32))

(assert (=> mapNonEmpty!33081 (= mapRest!33072 (store mapRest!33081 mapKey!33081 mapValue!33081))))

(assert (= (and mapNonEmpty!33072 condMapEmpty!33081) mapIsEmpty!33081))

(assert (= (and mapNonEmpty!33072 (not condMapEmpty!33081)) mapNonEmpty!33081))

(assert (= (and mapNonEmpty!33081 ((_ is ValueCellFull!9902) mapValue!33081)) b!951059))

(assert (= (and mapNonEmpty!33072 ((_ is ValueCellFull!9902) mapDefault!33081)) b!951060))

(declare-fun m!882837 () Bool)

(assert (=> mapNonEmpty!33081 m!882837))

(declare-fun b_lambda!14371 () Bool)

(assert (= b_lambda!14369 (or (and b!950878 b_free!18259) b_lambda!14371)))

(check-sat (not b!950954) (not b!951012) (not b!951031) (not b!951029) (not b!951023) (not b!950969) (not b!950940) (not bm!41433) (not d!115131) (not b!950959) (not b!950941) (not bm!41437) (not b!951013) tp_is_empty!20767 (not d!115127) b_and!29705 (not mapNonEmpty!33081) (not b!950948) (not bm!41436) (not b!951024) (not b!951017) (not b_lambda!14371) (not d!115119) (not b!951052) (not b!950967) (not d!115133) (not b_next!18259) (not b!950942) (not bm!41432) (not b!951016) (not d!115129))
(check-sat b_and!29705 (not b_next!18259))
