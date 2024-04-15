; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80586 () Bool)

(assert start!80586)

(declare-fun b!945808 () Bool)

(declare-fun b_free!18127 () Bool)

(declare-fun b_next!18127 () Bool)

(assert (=> b!945808 (= b_free!18127 (not b_next!18127))))

(declare-fun tp!62915 () Bool)

(declare-fun b_and!29523 () Bool)

(assert (=> b!945808 (= tp!62915 b_and!29523)))

(declare-fun b!945804 () Bool)

(declare-fun res!635095 () Bool)

(declare-fun e!532079 () Bool)

(assert (=> b!945804 (=> (not res!635095) (not e!532079))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!945804 (= res!635095 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32802 () Bool)

(declare-fun mapRes!32802 () Bool)

(declare-fun tp!62916 () Bool)

(declare-fun e!532082 () Bool)

(assert (=> mapNonEmpty!32802 (= mapRes!32802 (and tp!62916 e!532082))))

(declare-datatypes ((V!32479 0))(
  ( (V!32480 (val!10368 Int)) )
))
(declare-datatypes ((ValueCell!9836 0))(
  ( (ValueCellFull!9836 (v!12901 V!32479)) (EmptyCell!9836) )
))
(declare-datatypes ((array!57217 0))(
  ( (array!57218 (arr!27527 (Array (_ BitVec 32) ValueCell!9836)) (size!27998 (_ BitVec 32))) )
))
(declare-datatypes ((array!57219 0))(
  ( (array!57220 (arr!27528 (Array (_ BitVec 32) (_ BitVec 64))) (size!27999 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4822 0))(
  ( (LongMapFixedSize!4823 (defaultEntry!5708 Int) (mask!27390 (_ BitVec 32)) (extraKeys!5440 (_ BitVec 32)) (zeroValue!5544 V!32479) (minValue!5544 V!32479) (_size!2466 (_ BitVec 32)) (_keys!10591 array!57219) (_values!5731 array!57217) (_vacant!2466 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4822)

(declare-fun mapValue!32802 () ValueCell!9836)

(declare-fun mapKey!32802 () (_ BitVec 32))

(declare-fun mapRest!32802 () (Array (_ BitVec 32) ValueCell!9836))

(assert (=> mapNonEmpty!32802 (= (arr!27527 (_values!5731 thiss!1141)) (store mapRest!32802 mapKey!32802 mapValue!32802))))

(declare-fun b!945805 () Bool)

(declare-fun e!532080 () Bool)

(declare-fun e!532085 () Bool)

(assert (=> b!945805 (= e!532080 (and e!532085 mapRes!32802))))

(declare-fun condMapEmpty!32802 () Bool)

(declare-fun mapDefault!32802 () ValueCell!9836)

(assert (=> b!945805 (= condMapEmpty!32802 (= (arr!27527 (_values!5731 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9836)) mapDefault!32802)))))

(declare-fun b!945806 () Bool)

(declare-fun e!532084 () Bool)

(assert (=> b!945806 (= e!532079 e!532084)))

(declare-fun res!635096 () Bool)

(assert (=> b!945806 (=> (not res!635096) (not e!532084))))

(declare-datatypes ((SeekEntryResult!9094 0))(
  ( (MissingZero!9094 (index!38747 (_ BitVec 32))) (Found!9094 (index!38748 (_ BitVec 32))) (Intermediate!9094 (undefined!9906 Bool) (index!38749 (_ BitVec 32)) (x!81325 (_ BitVec 32))) (Undefined!9094) (MissingVacant!9094 (index!38750 (_ BitVec 32))) )
))
(declare-fun lt!425941 () SeekEntryResult!9094)

(get-info :version)

(assert (=> b!945806 (= res!635096 ((_ is Found!9094) lt!425941))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57219 (_ BitVec 32)) SeekEntryResult!9094)

(assert (=> b!945806 (= lt!425941 (seekEntry!0 key!756 (_keys!10591 thiss!1141) (mask!27390 thiss!1141)))))

(declare-fun mapIsEmpty!32802 () Bool)

(assert (=> mapIsEmpty!32802 mapRes!32802))

(declare-fun e!532086 () Bool)

(declare-fun tp_is_empty!20635 () Bool)

(declare-fun array_inv!21436 (array!57219) Bool)

(declare-fun array_inv!21437 (array!57217) Bool)

(assert (=> b!945808 (= e!532086 (and tp!62915 tp_is_empty!20635 (array_inv!21436 (_keys!10591 thiss!1141)) (array_inv!21437 (_values!5731 thiss!1141)) e!532080))))

(declare-fun b!945809 () Bool)

(declare-fun e!532083 () Bool)

(assert (=> b!945809 (= e!532083 (= (size!27998 (_values!5731 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27390 thiss!1141))))))

(declare-fun b!945810 () Bool)

(assert (=> b!945810 (= e!532082 tp_is_empty!20635)))

(declare-fun b!945811 () Bool)

(assert (=> b!945811 (= e!532084 (not e!532083))))

(declare-fun res!635093 () Bool)

(assert (=> b!945811 (=> res!635093 e!532083)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!945811 (= res!635093 (not (validMask!0 (mask!27390 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945811 (arrayContainsKey!0 (_keys!10591 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31772 0))(
  ( (Unit!31773) )
))
(declare-fun lt!425940 () Unit!31772)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57219 (_ BitVec 64) (_ BitVec 32)) Unit!31772)

(assert (=> b!945811 (= lt!425940 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10591 thiss!1141) key!756 (index!38748 lt!425941)))))

(declare-fun b!945807 () Bool)

(assert (=> b!945807 (= e!532085 tp_is_empty!20635)))

(declare-fun res!635094 () Bool)

(assert (=> start!80586 (=> (not res!635094) (not e!532079))))

(declare-fun valid!1844 (LongMapFixedSize!4822) Bool)

(assert (=> start!80586 (= res!635094 (valid!1844 thiss!1141))))

(assert (=> start!80586 e!532079))

(assert (=> start!80586 e!532086))

(assert (=> start!80586 true))

(assert (= (and start!80586 res!635094) b!945804))

(assert (= (and b!945804 res!635095) b!945806))

(assert (= (and b!945806 res!635096) b!945811))

(assert (= (and b!945811 (not res!635093)) b!945809))

(assert (= (and b!945805 condMapEmpty!32802) mapIsEmpty!32802))

(assert (= (and b!945805 (not condMapEmpty!32802)) mapNonEmpty!32802))

(assert (= (and mapNonEmpty!32802 ((_ is ValueCellFull!9836) mapValue!32802)) b!945810))

(assert (= (and b!945805 ((_ is ValueCellFull!9836) mapDefault!32802)) b!945807))

(assert (= b!945808 b!945805))

(assert (= start!80586 b!945808))

(declare-fun m!878839 () Bool)

(assert (=> b!945808 m!878839))

(declare-fun m!878841 () Bool)

(assert (=> b!945808 m!878841))

(declare-fun m!878843 () Bool)

(assert (=> b!945806 m!878843))

(declare-fun m!878845 () Bool)

(assert (=> b!945811 m!878845))

(declare-fun m!878847 () Bool)

(assert (=> b!945811 m!878847))

(declare-fun m!878849 () Bool)

(assert (=> b!945811 m!878849))

(declare-fun m!878851 () Bool)

(assert (=> mapNonEmpty!32802 m!878851))

(declare-fun m!878853 () Bool)

(assert (=> start!80586 m!878853))

(check-sat (not start!80586) b_and!29523 (not b_next!18127) (not b!945806) (not b!945808) (not mapNonEmpty!32802) tp_is_empty!20635 (not b!945811))
(check-sat b_and!29523 (not b_next!18127))
(get-model)

(declare-fun d!114281 () Bool)

(assert (=> d!114281 (= (array_inv!21436 (_keys!10591 thiss!1141)) (bvsge (size!27999 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945808 d!114281))

(declare-fun d!114283 () Bool)

(assert (=> d!114283 (= (array_inv!21437 (_values!5731 thiss!1141)) (bvsge (size!27998 (_values!5731 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945808 d!114283))

(declare-fun d!114285 () Bool)

(declare-fun res!635127 () Bool)

(declare-fun e!532137 () Bool)

(assert (=> d!114285 (=> (not res!635127) (not e!532137))))

(declare-fun simpleValid!356 (LongMapFixedSize!4822) Bool)

(assert (=> d!114285 (= res!635127 (simpleValid!356 thiss!1141))))

(assert (=> d!114285 (= (valid!1844 thiss!1141) e!532137)))

(declare-fun b!945866 () Bool)

(declare-fun res!635128 () Bool)

(assert (=> b!945866 (=> (not res!635128) (not e!532137))))

(declare-fun arrayCountValidKeys!0 (array!57219 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945866 (= res!635128 (= (arrayCountValidKeys!0 (_keys!10591 thiss!1141) #b00000000000000000000000000000000 (size!27999 (_keys!10591 thiss!1141))) (_size!2466 thiss!1141)))))

(declare-fun b!945867 () Bool)

(declare-fun res!635129 () Bool)

(assert (=> b!945867 (=> (not res!635129) (not e!532137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57219 (_ BitVec 32)) Bool)

(assert (=> b!945867 (= res!635129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10591 thiss!1141) (mask!27390 thiss!1141)))))

(declare-fun b!945868 () Bool)

(declare-datatypes ((List!19301 0))(
  ( (Nil!19298) (Cons!19297 (h!20449 (_ BitVec 64)) (t!27613 List!19301)) )
))
(declare-fun arrayNoDuplicates!0 (array!57219 (_ BitVec 32) List!19301) Bool)

(assert (=> b!945868 (= e!532137 (arrayNoDuplicates!0 (_keys!10591 thiss!1141) #b00000000000000000000000000000000 Nil!19298))))

(assert (= (and d!114285 res!635127) b!945866))

(assert (= (and b!945866 res!635128) b!945867))

(assert (= (and b!945867 res!635129) b!945868))

(declare-fun m!878887 () Bool)

(assert (=> d!114285 m!878887))

(declare-fun m!878889 () Bool)

(assert (=> b!945866 m!878889))

(declare-fun m!878891 () Bool)

(assert (=> b!945867 m!878891))

(declare-fun m!878893 () Bool)

(assert (=> b!945868 m!878893))

(assert (=> start!80586 d!114285))

(declare-fun d!114287 () Bool)

(assert (=> d!114287 (= (validMask!0 (mask!27390 thiss!1141)) (and (or (= (mask!27390 thiss!1141) #b00000000000000000000000000000111) (= (mask!27390 thiss!1141) #b00000000000000000000000000001111) (= (mask!27390 thiss!1141) #b00000000000000000000000000011111) (= (mask!27390 thiss!1141) #b00000000000000000000000000111111) (= (mask!27390 thiss!1141) #b00000000000000000000000001111111) (= (mask!27390 thiss!1141) #b00000000000000000000000011111111) (= (mask!27390 thiss!1141) #b00000000000000000000000111111111) (= (mask!27390 thiss!1141) #b00000000000000000000001111111111) (= (mask!27390 thiss!1141) #b00000000000000000000011111111111) (= (mask!27390 thiss!1141) #b00000000000000000000111111111111) (= (mask!27390 thiss!1141) #b00000000000000000001111111111111) (= (mask!27390 thiss!1141) #b00000000000000000011111111111111) (= (mask!27390 thiss!1141) #b00000000000000000111111111111111) (= (mask!27390 thiss!1141) #b00000000000000001111111111111111) (= (mask!27390 thiss!1141) #b00000000000000011111111111111111) (= (mask!27390 thiss!1141) #b00000000000000111111111111111111) (= (mask!27390 thiss!1141) #b00000000000001111111111111111111) (= (mask!27390 thiss!1141) #b00000000000011111111111111111111) (= (mask!27390 thiss!1141) #b00000000000111111111111111111111) (= (mask!27390 thiss!1141) #b00000000001111111111111111111111) (= (mask!27390 thiss!1141) #b00000000011111111111111111111111) (= (mask!27390 thiss!1141) #b00000000111111111111111111111111) (= (mask!27390 thiss!1141) #b00000001111111111111111111111111) (= (mask!27390 thiss!1141) #b00000011111111111111111111111111) (= (mask!27390 thiss!1141) #b00000111111111111111111111111111) (= (mask!27390 thiss!1141) #b00001111111111111111111111111111) (= (mask!27390 thiss!1141) #b00011111111111111111111111111111) (= (mask!27390 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27390 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!945811 d!114287))

(declare-fun d!114289 () Bool)

(declare-fun res!635134 () Bool)

(declare-fun e!532142 () Bool)

(assert (=> d!114289 (=> res!635134 e!532142)))

(assert (=> d!114289 (= res!635134 (= (select (arr!27528 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114289 (= (arrayContainsKey!0 (_keys!10591 thiss!1141) key!756 #b00000000000000000000000000000000) e!532142)))

(declare-fun b!945873 () Bool)

(declare-fun e!532143 () Bool)

(assert (=> b!945873 (= e!532142 e!532143)))

(declare-fun res!635135 () Bool)

(assert (=> b!945873 (=> (not res!635135) (not e!532143))))

(assert (=> b!945873 (= res!635135 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27999 (_keys!10591 thiss!1141))))))

(declare-fun b!945874 () Bool)

(assert (=> b!945874 (= e!532143 (arrayContainsKey!0 (_keys!10591 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114289 (not res!635134)) b!945873))

(assert (= (and b!945873 res!635135) b!945874))

(declare-fun m!878895 () Bool)

(assert (=> d!114289 m!878895))

(declare-fun m!878897 () Bool)

(assert (=> b!945874 m!878897))

(assert (=> b!945811 d!114289))

(declare-fun d!114291 () Bool)

(assert (=> d!114291 (arrayContainsKey!0 (_keys!10591 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425956 () Unit!31772)

(declare-fun choose!13 (array!57219 (_ BitVec 64) (_ BitVec 32)) Unit!31772)

(assert (=> d!114291 (= lt!425956 (choose!13 (_keys!10591 thiss!1141) key!756 (index!38748 lt!425941)))))

(assert (=> d!114291 (bvsge (index!38748 lt!425941) #b00000000000000000000000000000000)))

(assert (=> d!114291 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10591 thiss!1141) key!756 (index!38748 lt!425941)) lt!425956)))

(declare-fun bs!26563 () Bool)

(assert (= bs!26563 d!114291))

(assert (=> bs!26563 m!878847))

(declare-fun m!878899 () Bool)

(assert (=> bs!26563 m!878899))

(assert (=> b!945811 d!114291))

(declare-fun b!945887 () Bool)

(declare-fun e!532152 () SeekEntryResult!9094)

(assert (=> b!945887 (= e!532152 Undefined!9094)))

(declare-fun d!114293 () Bool)

(declare-fun lt!425966 () SeekEntryResult!9094)

(assert (=> d!114293 (and (or ((_ is MissingVacant!9094) lt!425966) (not ((_ is Found!9094) lt!425966)) (and (bvsge (index!38748 lt!425966) #b00000000000000000000000000000000) (bvslt (index!38748 lt!425966) (size!27999 (_keys!10591 thiss!1141))))) (not ((_ is MissingVacant!9094) lt!425966)) (or (not ((_ is Found!9094) lt!425966)) (= (select (arr!27528 (_keys!10591 thiss!1141)) (index!38748 lt!425966)) key!756)))))

(assert (=> d!114293 (= lt!425966 e!532152)))

(declare-fun c!98439 () Bool)

(declare-fun lt!425968 () SeekEntryResult!9094)

(assert (=> d!114293 (= c!98439 (and ((_ is Intermediate!9094) lt!425968) (undefined!9906 lt!425968)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57219 (_ BitVec 32)) SeekEntryResult!9094)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114293 (= lt!425968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27390 thiss!1141)) key!756 (_keys!10591 thiss!1141) (mask!27390 thiss!1141)))))

(assert (=> d!114293 (validMask!0 (mask!27390 thiss!1141))))

(assert (=> d!114293 (= (seekEntry!0 key!756 (_keys!10591 thiss!1141) (mask!27390 thiss!1141)) lt!425966)))

(declare-fun b!945888 () Bool)

(declare-fun e!532151 () SeekEntryResult!9094)

(assert (=> b!945888 (= e!532152 e!532151)))

(declare-fun lt!425967 () (_ BitVec 64))

(assert (=> b!945888 (= lt!425967 (select (arr!27528 (_keys!10591 thiss!1141)) (index!38749 lt!425968)))))

(declare-fun c!98438 () Bool)

(assert (=> b!945888 (= c!98438 (= lt!425967 key!756))))

(declare-fun b!945889 () Bool)

(declare-fun c!98437 () Bool)

(assert (=> b!945889 (= c!98437 (= lt!425967 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532150 () SeekEntryResult!9094)

(assert (=> b!945889 (= e!532151 e!532150)))

(declare-fun b!945890 () Bool)

(assert (=> b!945890 (= e!532150 (MissingZero!9094 (index!38749 lt!425968)))))

(declare-fun b!945891 () Bool)

(assert (=> b!945891 (= e!532151 (Found!9094 (index!38749 lt!425968)))))

(declare-fun b!945892 () Bool)

(declare-fun lt!425965 () SeekEntryResult!9094)

(assert (=> b!945892 (= e!532150 (ite ((_ is MissingVacant!9094) lt!425965) (MissingZero!9094 (index!38750 lt!425965)) lt!425965))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57219 (_ BitVec 32)) SeekEntryResult!9094)

(assert (=> b!945892 (= lt!425965 (seekKeyOrZeroReturnVacant!0 (x!81325 lt!425968) (index!38749 lt!425968) (index!38749 lt!425968) key!756 (_keys!10591 thiss!1141) (mask!27390 thiss!1141)))))

(assert (= (and d!114293 c!98439) b!945887))

(assert (= (and d!114293 (not c!98439)) b!945888))

(assert (= (and b!945888 c!98438) b!945891))

(assert (= (and b!945888 (not c!98438)) b!945889))

(assert (= (and b!945889 c!98437) b!945890))

(assert (= (and b!945889 (not c!98437)) b!945892))

(declare-fun m!878901 () Bool)

(assert (=> d!114293 m!878901))

(declare-fun m!878903 () Bool)

(assert (=> d!114293 m!878903))

(assert (=> d!114293 m!878903))

(declare-fun m!878905 () Bool)

(assert (=> d!114293 m!878905))

(assert (=> d!114293 m!878845))

(declare-fun m!878907 () Bool)

(assert (=> b!945888 m!878907))

(declare-fun m!878909 () Bool)

(assert (=> b!945892 m!878909))

(assert (=> b!945806 d!114293))

(declare-fun condMapEmpty!32811 () Bool)

(declare-fun mapDefault!32811 () ValueCell!9836)

(assert (=> mapNonEmpty!32802 (= condMapEmpty!32811 (= mapRest!32802 ((as const (Array (_ BitVec 32) ValueCell!9836)) mapDefault!32811)))))

(declare-fun e!532157 () Bool)

(declare-fun mapRes!32811 () Bool)

(assert (=> mapNonEmpty!32802 (= tp!62916 (and e!532157 mapRes!32811))))

(declare-fun mapNonEmpty!32811 () Bool)

(declare-fun tp!62931 () Bool)

(declare-fun e!532158 () Bool)

(assert (=> mapNonEmpty!32811 (= mapRes!32811 (and tp!62931 e!532158))))

(declare-fun mapRest!32811 () (Array (_ BitVec 32) ValueCell!9836))

(declare-fun mapValue!32811 () ValueCell!9836)

(declare-fun mapKey!32811 () (_ BitVec 32))

(assert (=> mapNonEmpty!32811 (= mapRest!32802 (store mapRest!32811 mapKey!32811 mapValue!32811))))

(declare-fun b!945899 () Bool)

(assert (=> b!945899 (= e!532158 tp_is_empty!20635)))

(declare-fun b!945900 () Bool)

(assert (=> b!945900 (= e!532157 tp_is_empty!20635)))

(declare-fun mapIsEmpty!32811 () Bool)

(assert (=> mapIsEmpty!32811 mapRes!32811))

(assert (= (and mapNonEmpty!32802 condMapEmpty!32811) mapIsEmpty!32811))

(assert (= (and mapNonEmpty!32802 (not condMapEmpty!32811)) mapNonEmpty!32811))

(assert (= (and mapNonEmpty!32811 ((_ is ValueCellFull!9836) mapValue!32811)) b!945899))

(assert (= (and mapNonEmpty!32802 ((_ is ValueCellFull!9836) mapDefault!32811)) b!945900))

(declare-fun m!878911 () Bool)

(assert (=> mapNonEmpty!32811 m!878911))

(check-sat b_and!29523 (not b!945868) (not b!945867) (not b!945866) (not d!114285) (not d!114291) (not mapNonEmpty!32811) (not b!945874) (not b_next!18127) (not d!114293) (not b!945892) tp_is_empty!20635)
(check-sat b_and!29523 (not b_next!18127))
(get-model)

(declare-fun b!945919 () Bool)

(declare-fun lt!425974 () SeekEntryResult!9094)

(assert (=> b!945919 (and (bvsge (index!38749 lt!425974) #b00000000000000000000000000000000) (bvslt (index!38749 lt!425974) (size!27999 (_keys!10591 thiss!1141))))))

(declare-fun res!635144 () Bool)

(assert (=> b!945919 (= res!635144 (= (select (arr!27528 (_keys!10591 thiss!1141)) (index!38749 lt!425974)) key!756))))

(declare-fun e!532173 () Bool)

(assert (=> b!945919 (=> res!635144 e!532173)))

(declare-fun e!532169 () Bool)

(assert (=> b!945919 (= e!532169 e!532173)))

(declare-fun b!945920 () Bool)

(declare-fun e!532170 () SeekEntryResult!9094)

(assert (=> b!945920 (= e!532170 (Intermediate!9094 false (toIndex!0 key!756 (mask!27390 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!945921 () Bool)

(declare-fun e!532171 () SeekEntryResult!9094)

(assert (=> b!945921 (= e!532171 e!532170)))

(declare-fun c!98447 () Bool)

(declare-fun lt!425973 () (_ BitVec 64))

(assert (=> b!945921 (= c!98447 (or (= lt!425973 key!756) (= (bvadd lt!425973 lt!425973) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!945923 () Bool)

(declare-fun e!532172 () Bool)

(assert (=> b!945923 (= e!532172 e!532169)))

(declare-fun res!635142 () Bool)

(assert (=> b!945923 (= res!635142 (and ((_ is Intermediate!9094) lt!425974) (not (undefined!9906 lt!425974)) (bvslt (x!81325 lt!425974) #b01111111111111111111111111111110) (bvsge (x!81325 lt!425974) #b00000000000000000000000000000000) (bvsge (x!81325 lt!425974) #b00000000000000000000000000000000)))))

(assert (=> b!945923 (=> (not res!635142) (not e!532169))))

(declare-fun b!945924 () Bool)

(assert (=> b!945924 (= e!532171 (Intermediate!9094 true (toIndex!0 key!756 (mask!27390 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!945925 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945925 (= e!532170 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27390 thiss!1141)) #b00000000000000000000000000000000 (mask!27390 thiss!1141)) key!756 (_keys!10591 thiss!1141) (mask!27390 thiss!1141)))))

(declare-fun b!945922 () Bool)

(assert (=> b!945922 (= e!532172 (bvsge (x!81325 lt!425974) #b01111111111111111111111111111110))))

(declare-fun d!114295 () Bool)

(assert (=> d!114295 e!532172))

(declare-fun c!98446 () Bool)

(assert (=> d!114295 (= c!98446 (and ((_ is Intermediate!9094) lt!425974) (undefined!9906 lt!425974)))))

(assert (=> d!114295 (= lt!425974 e!532171)))

(declare-fun c!98448 () Bool)

(assert (=> d!114295 (= c!98448 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114295 (= lt!425973 (select (arr!27528 (_keys!10591 thiss!1141)) (toIndex!0 key!756 (mask!27390 thiss!1141))))))

(assert (=> d!114295 (validMask!0 (mask!27390 thiss!1141))))

(assert (=> d!114295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27390 thiss!1141)) key!756 (_keys!10591 thiss!1141) (mask!27390 thiss!1141)) lt!425974)))

(declare-fun b!945926 () Bool)

(assert (=> b!945926 (and (bvsge (index!38749 lt!425974) #b00000000000000000000000000000000) (bvslt (index!38749 lt!425974) (size!27999 (_keys!10591 thiss!1141))))))

(assert (=> b!945926 (= e!532173 (= (select (arr!27528 (_keys!10591 thiss!1141)) (index!38749 lt!425974)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!945927 () Bool)

(assert (=> b!945927 (and (bvsge (index!38749 lt!425974) #b00000000000000000000000000000000) (bvslt (index!38749 lt!425974) (size!27999 (_keys!10591 thiss!1141))))))

(declare-fun res!635143 () Bool)

(assert (=> b!945927 (= res!635143 (= (select (arr!27528 (_keys!10591 thiss!1141)) (index!38749 lt!425974)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!945927 (=> res!635143 e!532173)))

(assert (= (and d!114295 c!98448) b!945924))

(assert (= (and d!114295 (not c!98448)) b!945921))

(assert (= (and b!945921 c!98447) b!945920))

(assert (= (and b!945921 (not c!98447)) b!945925))

(assert (= (and d!114295 c!98446) b!945922))

(assert (= (and d!114295 (not c!98446)) b!945923))

(assert (= (and b!945923 res!635142) b!945919))

(assert (= (and b!945919 (not res!635144)) b!945927))

(assert (= (and b!945927 (not res!635143)) b!945926))

(assert (=> b!945925 m!878903))

(declare-fun m!878913 () Bool)

(assert (=> b!945925 m!878913))

(assert (=> b!945925 m!878913))

(declare-fun m!878915 () Bool)

(assert (=> b!945925 m!878915))

(declare-fun m!878917 () Bool)

(assert (=> b!945926 m!878917))

(assert (=> b!945919 m!878917))

(assert (=> d!114295 m!878903))

(declare-fun m!878919 () Bool)

(assert (=> d!114295 m!878919))

(assert (=> d!114295 m!878845))

(assert (=> b!945927 m!878917))

(assert (=> d!114293 d!114295))

(declare-fun d!114297 () Bool)

(declare-fun lt!425980 () (_ BitVec 32))

(declare-fun lt!425979 () (_ BitVec 32))

(assert (=> d!114297 (= lt!425980 (bvmul (bvxor lt!425979 (bvlshr lt!425979 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114297 (= lt!425979 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114297 (and (bvsge (mask!27390 thiss!1141) #b00000000000000000000000000000000) (let ((res!635145 (let ((h!20450 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81343 (bvmul (bvxor h!20450 (bvlshr h!20450 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81343 (bvlshr x!81343 #b00000000000000000000000000001101)) (mask!27390 thiss!1141)))))) (and (bvslt res!635145 (bvadd (mask!27390 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635145 #b00000000000000000000000000000000))))))

(assert (=> d!114297 (= (toIndex!0 key!756 (mask!27390 thiss!1141)) (bvand (bvxor lt!425980 (bvlshr lt!425980 #b00000000000000000000000000001101)) (mask!27390 thiss!1141)))))

(assert (=> d!114293 d!114297))

(assert (=> d!114293 d!114287))

(declare-fun b!945940 () Bool)

(declare-fun e!532180 () SeekEntryResult!9094)

(assert (=> b!945940 (= e!532180 (MissingVacant!9094 (index!38749 lt!425968)))))

(declare-fun d!114299 () Bool)

(declare-fun lt!425985 () SeekEntryResult!9094)

(assert (=> d!114299 (and (or ((_ is Undefined!9094) lt!425985) (not ((_ is Found!9094) lt!425985)) (and (bvsge (index!38748 lt!425985) #b00000000000000000000000000000000) (bvslt (index!38748 lt!425985) (size!27999 (_keys!10591 thiss!1141))))) (or ((_ is Undefined!9094) lt!425985) ((_ is Found!9094) lt!425985) (not ((_ is MissingVacant!9094) lt!425985)) (not (= (index!38750 lt!425985) (index!38749 lt!425968))) (and (bvsge (index!38750 lt!425985) #b00000000000000000000000000000000) (bvslt (index!38750 lt!425985) (size!27999 (_keys!10591 thiss!1141))))) (or ((_ is Undefined!9094) lt!425985) (ite ((_ is Found!9094) lt!425985) (= (select (arr!27528 (_keys!10591 thiss!1141)) (index!38748 lt!425985)) key!756) (and ((_ is MissingVacant!9094) lt!425985) (= (index!38750 lt!425985) (index!38749 lt!425968)) (= (select (arr!27528 (_keys!10591 thiss!1141)) (index!38750 lt!425985)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!532182 () SeekEntryResult!9094)

(assert (=> d!114299 (= lt!425985 e!532182)))

(declare-fun c!98457 () Bool)

(assert (=> d!114299 (= c!98457 (bvsge (x!81325 lt!425968) #b01111111111111111111111111111110))))

(declare-fun lt!425986 () (_ BitVec 64))

(assert (=> d!114299 (= lt!425986 (select (arr!27528 (_keys!10591 thiss!1141)) (index!38749 lt!425968)))))

(assert (=> d!114299 (validMask!0 (mask!27390 thiss!1141))))

(assert (=> d!114299 (= (seekKeyOrZeroReturnVacant!0 (x!81325 lt!425968) (index!38749 lt!425968) (index!38749 lt!425968) key!756 (_keys!10591 thiss!1141) (mask!27390 thiss!1141)) lt!425985)))

(declare-fun b!945941 () Bool)

(declare-fun c!98456 () Bool)

(assert (=> b!945941 (= c!98456 (= lt!425986 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532181 () SeekEntryResult!9094)

(assert (=> b!945941 (= e!532181 e!532180)))

(declare-fun b!945942 () Bool)

(assert (=> b!945942 (= e!532182 e!532181)))

(declare-fun c!98455 () Bool)

(assert (=> b!945942 (= c!98455 (= lt!425986 key!756))))

(declare-fun b!945943 () Bool)

(assert (=> b!945943 (= e!532182 Undefined!9094)))

(declare-fun b!945944 () Bool)

(assert (=> b!945944 (= e!532181 (Found!9094 (index!38749 lt!425968)))))

(declare-fun b!945945 () Bool)

(assert (=> b!945945 (= e!532180 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81325 lt!425968) #b00000000000000000000000000000001) (nextIndex!0 (index!38749 lt!425968) (x!81325 lt!425968) (mask!27390 thiss!1141)) (index!38749 lt!425968) key!756 (_keys!10591 thiss!1141) (mask!27390 thiss!1141)))))

(assert (= (and d!114299 c!98457) b!945943))

(assert (= (and d!114299 (not c!98457)) b!945942))

(assert (= (and b!945942 c!98455) b!945944))

(assert (= (and b!945942 (not c!98455)) b!945941))

(assert (= (and b!945941 c!98456) b!945940))

(assert (= (and b!945941 (not c!98456)) b!945945))

(declare-fun m!878921 () Bool)

(assert (=> d!114299 m!878921))

(declare-fun m!878923 () Bool)

(assert (=> d!114299 m!878923))

(assert (=> d!114299 m!878907))

(assert (=> d!114299 m!878845))

(declare-fun m!878925 () Bool)

(assert (=> b!945945 m!878925))

(assert (=> b!945945 m!878925))

(declare-fun m!878927 () Bool)

(assert (=> b!945945 m!878927))

(assert (=> b!945892 d!114299))

(declare-fun b!945954 () Bool)

(declare-fun e!532191 () Bool)

(declare-fun e!532189 () Bool)

(assert (=> b!945954 (= e!532191 e!532189)))

(declare-fun c!98460 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!945954 (= c!98460 (validKeyInArray!0 (select (arr!27528 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945955 () Bool)

(declare-fun call!41044 () Bool)

(assert (=> b!945955 (= e!532189 call!41044)))

(declare-fun b!945956 () Bool)

(declare-fun e!532190 () Bool)

(assert (=> b!945956 (= e!532189 e!532190)))

(declare-fun lt!425993 () (_ BitVec 64))

(assert (=> b!945956 (= lt!425993 (select (arr!27528 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425994 () Unit!31772)

(assert (=> b!945956 (= lt!425994 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10591 thiss!1141) lt!425993 #b00000000000000000000000000000000))))

(assert (=> b!945956 (arrayContainsKey!0 (_keys!10591 thiss!1141) lt!425993 #b00000000000000000000000000000000)))

(declare-fun lt!425995 () Unit!31772)

(assert (=> b!945956 (= lt!425995 lt!425994)))

(declare-fun res!635151 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57219 (_ BitVec 32)) SeekEntryResult!9094)

(assert (=> b!945956 (= res!635151 (= (seekEntryOrOpen!0 (select (arr!27528 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000) (_keys!10591 thiss!1141) (mask!27390 thiss!1141)) (Found!9094 #b00000000000000000000000000000000)))))

(assert (=> b!945956 (=> (not res!635151) (not e!532190))))

(declare-fun bm!41041 () Bool)

(assert (=> bm!41041 (= call!41044 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10591 thiss!1141) (mask!27390 thiss!1141)))))

(declare-fun d!114301 () Bool)

(declare-fun res!635150 () Bool)

(assert (=> d!114301 (=> res!635150 e!532191)))

(assert (=> d!114301 (= res!635150 (bvsge #b00000000000000000000000000000000 (size!27999 (_keys!10591 thiss!1141))))))

(assert (=> d!114301 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10591 thiss!1141) (mask!27390 thiss!1141)) e!532191)))

(declare-fun b!945957 () Bool)

(assert (=> b!945957 (= e!532190 call!41044)))

(assert (= (and d!114301 (not res!635150)) b!945954))

(assert (= (and b!945954 c!98460) b!945956))

(assert (= (and b!945954 (not c!98460)) b!945955))

(assert (= (and b!945956 res!635151) b!945957))

(assert (= (or b!945957 b!945955) bm!41041))

(assert (=> b!945954 m!878895))

(assert (=> b!945954 m!878895))

(declare-fun m!878929 () Bool)

(assert (=> b!945954 m!878929))

(assert (=> b!945956 m!878895))

(declare-fun m!878931 () Bool)

(assert (=> b!945956 m!878931))

(declare-fun m!878933 () Bool)

(assert (=> b!945956 m!878933))

(assert (=> b!945956 m!878895))

(declare-fun m!878935 () Bool)

(assert (=> b!945956 m!878935))

(declare-fun m!878937 () Bool)

(assert (=> bm!41041 m!878937))

(assert (=> b!945867 d!114301))

(declare-fun b!945969 () Bool)

(declare-fun e!532194 () Bool)

(assert (=> b!945969 (= e!532194 (and (bvsge (extraKeys!5440 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5440 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2466 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!945968 () Bool)

(declare-fun res!635161 () Bool)

(assert (=> b!945968 (=> (not res!635161) (not e!532194))))

(declare-fun size!28004 (LongMapFixedSize!4822) (_ BitVec 32))

(assert (=> b!945968 (= res!635161 (= (size!28004 thiss!1141) (bvadd (_size!2466 thiss!1141) (bvsdiv (bvadd (extraKeys!5440 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!945966 () Bool)

(declare-fun res!635163 () Bool)

(assert (=> b!945966 (=> (not res!635163) (not e!532194))))

(assert (=> b!945966 (= res!635163 (and (= (size!27998 (_values!5731 thiss!1141)) (bvadd (mask!27390 thiss!1141) #b00000000000000000000000000000001)) (= (size!27999 (_keys!10591 thiss!1141)) (size!27998 (_values!5731 thiss!1141))) (bvsge (_size!2466 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2466 thiss!1141) (bvadd (mask!27390 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!945967 () Bool)

(declare-fun res!635162 () Bool)

(assert (=> b!945967 (=> (not res!635162) (not e!532194))))

(assert (=> b!945967 (= res!635162 (bvsge (size!28004 thiss!1141) (_size!2466 thiss!1141)))))

(declare-fun d!114303 () Bool)

(declare-fun res!635160 () Bool)

(assert (=> d!114303 (=> (not res!635160) (not e!532194))))

(assert (=> d!114303 (= res!635160 (validMask!0 (mask!27390 thiss!1141)))))

(assert (=> d!114303 (= (simpleValid!356 thiss!1141) e!532194)))

(assert (= (and d!114303 res!635160) b!945966))

(assert (= (and b!945966 res!635163) b!945967))

(assert (= (and b!945967 res!635162) b!945968))

(assert (= (and b!945968 res!635161) b!945969))

(declare-fun m!878939 () Bool)

(assert (=> b!945968 m!878939))

(assert (=> b!945967 m!878939))

(assert (=> d!114303 m!878845))

(assert (=> d!114285 d!114303))

(declare-fun b!945978 () Bool)

(declare-fun e!532199 () (_ BitVec 32))

(declare-fun call!41047 () (_ BitVec 32))

(assert (=> b!945978 (= e!532199 (bvadd #b00000000000000000000000000000001 call!41047))))

(declare-fun bm!41044 () Bool)

(assert (=> bm!41044 (= call!41047 (arrayCountValidKeys!0 (_keys!10591 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27999 (_keys!10591 thiss!1141))))))

(declare-fun d!114305 () Bool)

(declare-fun lt!425998 () (_ BitVec 32))

(assert (=> d!114305 (and (bvsge lt!425998 #b00000000000000000000000000000000) (bvsle lt!425998 (bvsub (size!27999 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!532200 () (_ BitVec 32))

(assert (=> d!114305 (= lt!425998 e!532200)))

(declare-fun c!98466 () Bool)

(assert (=> d!114305 (= c!98466 (bvsge #b00000000000000000000000000000000 (size!27999 (_keys!10591 thiss!1141))))))

(assert (=> d!114305 (and (bvsle #b00000000000000000000000000000000 (size!27999 (_keys!10591 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27999 (_keys!10591 thiss!1141)) (size!27999 (_keys!10591 thiss!1141))))))

(assert (=> d!114305 (= (arrayCountValidKeys!0 (_keys!10591 thiss!1141) #b00000000000000000000000000000000 (size!27999 (_keys!10591 thiss!1141))) lt!425998)))

(declare-fun b!945979 () Bool)

(assert (=> b!945979 (= e!532200 #b00000000000000000000000000000000)))

(declare-fun b!945980 () Bool)

(assert (=> b!945980 (= e!532199 call!41047)))

(declare-fun b!945981 () Bool)

(assert (=> b!945981 (= e!532200 e!532199)))

(declare-fun c!98465 () Bool)

(assert (=> b!945981 (= c!98465 (validKeyInArray!0 (select (arr!27528 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114305 c!98466) b!945979))

(assert (= (and d!114305 (not c!98466)) b!945981))

(assert (= (and b!945981 c!98465) b!945978))

(assert (= (and b!945981 (not c!98465)) b!945980))

(assert (= (or b!945978 b!945980) bm!41044))

(declare-fun m!878941 () Bool)

(assert (=> bm!41044 m!878941))

(assert (=> b!945981 m!878895))

(assert (=> b!945981 m!878895))

(assert (=> b!945981 m!878929))

(assert (=> b!945866 d!114305))

(assert (=> d!114291 d!114289))

(declare-fun d!114307 () Bool)

(assert (=> d!114307 (arrayContainsKey!0 (_keys!10591 thiss!1141) key!756 #b00000000000000000000000000000000)))

(assert (=> d!114307 true))

(declare-fun _$60!427 () Unit!31772)

(assert (=> d!114307 (= (choose!13 (_keys!10591 thiss!1141) key!756 (index!38748 lt!425941)) _$60!427)))

(declare-fun bs!26564 () Bool)

(assert (= bs!26564 d!114307))

(assert (=> bs!26564 m!878847))

(assert (=> d!114291 d!114307))

(declare-fun b!945992 () Bool)

(declare-fun e!532210 () Bool)

(declare-fun contains!5156 (List!19301 (_ BitVec 64)) Bool)

(assert (=> b!945992 (= e!532210 (contains!5156 Nil!19298 (select (arr!27528 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41047 () Bool)

(declare-fun call!41050 () Bool)

(declare-fun c!98469 () Bool)

(assert (=> bm!41047 (= call!41050 (arrayNoDuplicates!0 (_keys!10591 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98469 (Cons!19297 (select (arr!27528 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000) Nil!19298) Nil!19298)))))

(declare-fun b!945993 () Bool)

(declare-fun e!532212 () Bool)

(declare-fun e!532209 () Bool)

(assert (=> b!945993 (= e!532212 e!532209)))

(assert (=> b!945993 (= c!98469 (validKeyInArray!0 (select (arr!27528 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945994 () Bool)

(assert (=> b!945994 (= e!532209 call!41050)))

(declare-fun d!114309 () Bool)

(declare-fun res!635171 () Bool)

(declare-fun e!532211 () Bool)

(assert (=> d!114309 (=> res!635171 e!532211)))

(assert (=> d!114309 (= res!635171 (bvsge #b00000000000000000000000000000000 (size!27999 (_keys!10591 thiss!1141))))))

(assert (=> d!114309 (= (arrayNoDuplicates!0 (_keys!10591 thiss!1141) #b00000000000000000000000000000000 Nil!19298) e!532211)))

(declare-fun b!945995 () Bool)

(assert (=> b!945995 (= e!532211 e!532212)))

(declare-fun res!635172 () Bool)

(assert (=> b!945995 (=> (not res!635172) (not e!532212))))

(assert (=> b!945995 (= res!635172 (not e!532210))))

(declare-fun res!635170 () Bool)

(assert (=> b!945995 (=> (not res!635170) (not e!532210))))

(assert (=> b!945995 (= res!635170 (validKeyInArray!0 (select (arr!27528 (_keys!10591 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945996 () Bool)

(assert (=> b!945996 (= e!532209 call!41050)))

(assert (= (and d!114309 (not res!635171)) b!945995))

(assert (= (and b!945995 res!635170) b!945992))

(assert (= (and b!945995 res!635172) b!945993))

(assert (= (and b!945993 c!98469) b!945996))

(assert (= (and b!945993 (not c!98469)) b!945994))

(assert (= (or b!945996 b!945994) bm!41047))

(assert (=> b!945992 m!878895))

(assert (=> b!945992 m!878895))

(declare-fun m!878943 () Bool)

(assert (=> b!945992 m!878943))

(assert (=> bm!41047 m!878895))

(declare-fun m!878945 () Bool)

(assert (=> bm!41047 m!878945))

(assert (=> b!945993 m!878895))

(assert (=> b!945993 m!878895))

(assert (=> b!945993 m!878929))

(assert (=> b!945995 m!878895))

(assert (=> b!945995 m!878895))

(assert (=> b!945995 m!878929))

(assert (=> b!945868 d!114309))

(declare-fun d!114311 () Bool)

(declare-fun res!635173 () Bool)

(declare-fun e!532213 () Bool)

(assert (=> d!114311 (=> res!635173 e!532213)))

(assert (=> d!114311 (= res!635173 (= (select (arr!27528 (_keys!10591 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114311 (= (arrayContainsKey!0 (_keys!10591 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!532213)))

(declare-fun b!945997 () Bool)

(declare-fun e!532214 () Bool)

(assert (=> b!945997 (= e!532213 e!532214)))

(declare-fun res!635174 () Bool)

(assert (=> b!945997 (=> (not res!635174) (not e!532214))))

(assert (=> b!945997 (= res!635174 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!27999 (_keys!10591 thiss!1141))))))

(declare-fun b!945998 () Bool)

(assert (=> b!945998 (= e!532214 (arrayContainsKey!0 (_keys!10591 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114311 (not res!635173)) b!945997))

(assert (= (and b!945997 res!635174) b!945998))

(declare-fun m!878947 () Bool)

(assert (=> d!114311 m!878947))

(declare-fun m!878949 () Bool)

(assert (=> b!945998 m!878949))

(assert (=> b!945874 d!114311))

(declare-fun condMapEmpty!32812 () Bool)

(declare-fun mapDefault!32812 () ValueCell!9836)

(assert (=> mapNonEmpty!32811 (= condMapEmpty!32812 (= mapRest!32811 ((as const (Array (_ BitVec 32) ValueCell!9836)) mapDefault!32812)))))

(declare-fun e!532215 () Bool)

(declare-fun mapRes!32812 () Bool)

(assert (=> mapNonEmpty!32811 (= tp!62931 (and e!532215 mapRes!32812))))

(declare-fun mapNonEmpty!32812 () Bool)

(declare-fun tp!62932 () Bool)

(declare-fun e!532216 () Bool)

(assert (=> mapNonEmpty!32812 (= mapRes!32812 (and tp!62932 e!532216))))

(declare-fun mapValue!32812 () ValueCell!9836)

(declare-fun mapKey!32812 () (_ BitVec 32))

(declare-fun mapRest!32812 () (Array (_ BitVec 32) ValueCell!9836))

(assert (=> mapNonEmpty!32812 (= mapRest!32811 (store mapRest!32812 mapKey!32812 mapValue!32812))))

(declare-fun b!945999 () Bool)

(assert (=> b!945999 (= e!532216 tp_is_empty!20635)))

(declare-fun b!946000 () Bool)

(assert (=> b!946000 (= e!532215 tp_is_empty!20635)))

(declare-fun mapIsEmpty!32812 () Bool)

(assert (=> mapIsEmpty!32812 mapRes!32812))

(assert (= (and mapNonEmpty!32811 condMapEmpty!32812) mapIsEmpty!32812))

(assert (= (and mapNonEmpty!32811 (not condMapEmpty!32812)) mapNonEmpty!32812))

(assert (= (and mapNonEmpty!32812 ((_ is ValueCellFull!9836) mapValue!32812)) b!945999))

(assert (= (and mapNonEmpty!32811 ((_ is ValueCellFull!9836) mapDefault!32812)) b!946000))

(declare-fun m!878951 () Bool)

(assert (=> mapNonEmpty!32812 m!878951))

(check-sat (not d!114307) (not b!945992) (not b!945925) (not b!945967) (not b!945998) (not d!114295) (not bm!41041) (not b!945954) (not b!945995) (not b!945945) (not b!945956) tp_is_empty!20635 (not d!114303) (not bm!41044) (not b!945981) b_and!29523 (not b_next!18127) (not mapNonEmpty!32812) (not bm!41047) (not b!945968) (not b!945993) (not d!114299))
(check-sat b_and!29523 (not b_next!18127))
