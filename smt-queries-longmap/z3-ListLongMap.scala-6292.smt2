; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80432 () Bool)

(assert start!80432)

(declare-fun b!944892 () Bool)

(declare-fun b_free!18075 () Bool)

(declare-fun b_next!18075 () Bool)

(assert (=> b!944892 (= b_free!18075 (not b_next!18075))))

(declare-fun tp!62735 () Bool)

(declare-fun b_and!29493 () Bool)

(assert (=> b!944892 (= tp!62735 b_and!29493)))

(declare-fun mapNonEmpty!32700 () Bool)

(declare-fun mapRes!32700 () Bool)

(declare-fun tp!62734 () Bool)

(declare-fun e!531364 () Bool)

(assert (=> mapNonEmpty!32700 (= mapRes!32700 (and tp!62734 e!531364))))

(declare-datatypes ((V!32409 0))(
  ( (V!32410 (val!10342 Int)) )
))
(declare-datatypes ((ValueCell!9810 0))(
  ( (ValueCellFull!9810 (v!12874 V!32409)) (EmptyCell!9810) )
))
(declare-fun mapValue!32700 () ValueCell!9810)

(declare-datatypes ((array!57134 0))(
  ( (array!57135 (arr!27492 (Array (_ BitVec 32) ValueCell!9810)) (size!27958 (_ BitVec 32))) )
))
(declare-datatypes ((array!57136 0))(
  ( (array!57137 (arr!27493 (Array (_ BitVec 32) (_ BitVec 64))) (size!27959 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4770 0))(
  ( (LongMapFixedSize!4771 (defaultEntry!5680 Int) (mask!27338 (_ BitVec 32)) (extraKeys!5412 (_ BitVec 32)) (zeroValue!5516 V!32409) (minValue!5516 V!32409) (_size!2440 (_ BitVec 32)) (_keys!10558 array!57136) (_values!5703 array!57134) (_vacant!2440 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4770)

(declare-fun mapKey!32700 () (_ BitVec 32))

(declare-fun mapRest!32700 () (Array (_ BitVec 32) ValueCell!9810))

(assert (=> mapNonEmpty!32700 (= (arr!27492 (_values!5703 thiss!1141)) (store mapRest!32700 mapKey!32700 mapValue!32700))))

(declare-fun b!944887 () Bool)

(declare-fun e!531369 () Bool)

(declare-fun e!531367 () Bool)

(assert (=> b!944887 (= e!531369 (not e!531367))))

(declare-fun res!634755 () Bool)

(assert (=> b!944887 (=> res!634755 e!531367)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944887 (= res!634755 (not (validMask!0 (mask!27338 thiss!1141))))))

(declare-fun lt!425779 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57136 (_ BitVec 32)) Bool)

(assert (=> b!944887 (arrayForallSeekEntryOrOpenFound!0 lt!425779 (_keys!10558 thiss!1141) (mask!27338 thiss!1141))))

(declare-datatypes ((Unit!31872 0))(
  ( (Unit!31873) )
))
(declare-fun lt!425778 () Unit!31872)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31872)

(assert (=> b!944887 (= lt!425778 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10558 thiss!1141) (mask!27338 thiss!1141) #b00000000000000000000000000000000 lt!425779))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57136 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944887 (= lt!425779 (arrayScanForKey!0 (_keys!10558 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944887 (arrayContainsKey!0 (_keys!10558 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425781 () Unit!31872)

(declare-fun lemmaKeyInListMapIsInArray!316 (array!57136 array!57134 (_ BitVec 32) (_ BitVec 32) V!32409 V!32409 (_ BitVec 64) Int) Unit!31872)

(assert (=> b!944887 (= lt!425781 (lemmaKeyInListMapIsInArray!316 (_keys!10558 thiss!1141) (_values!5703 thiss!1141) (mask!27338 thiss!1141) (extraKeys!5412 thiss!1141) (zeroValue!5516 thiss!1141) (minValue!5516 thiss!1141) key!756 (defaultEntry!5680 thiss!1141)))))

(declare-fun b!944888 () Bool)

(declare-fun e!531365 () Bool)

(declare-fun e!531366 () Bool)

(assert (=> b!944888 (= e!531365 (and e!531366 mapRes!32700))))

(declare-fun condMapEmpty!32700 () Bool)

(declare-fun mapDefault!32700 () ValueCell!9810)

(assert (=> b!944888 (= condMapEmpty!32700 (= (arr!27492 (_values!5703 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9810)) mapDefault!32700)))))

(declare-fun b!944889 () Bool)

(assert (=> b!944889 (= e!531367 true)))

(declare-datatypes ((SeekEntryResult!9079 0))(
  ( (MissingZero!9079 (index!38687 (_ BitVec 32))) (Found!9079 (index!38688 (_ BitVec 32))) (Intermediate!9079 (undefined!9891 Bool) (index!38689 (_ BitVec 32)) (x!81162 (_ BitVec 32))) (Undefined!9079) (MissingVacant!9079 (index!38690 (_ BitVec 32))) )
))
(declare-fun lt!425780 () SeekEntryResult!9079)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57136 (_ BitVec 32)) SeekEntryResult!9079)

(assert (=> b!944889 (= lt!425780 (seekEntryOrOpen!0 key!756 (_keys!10558 thiss!1141) (mask!27338 thiss!1141)))))

(declare-fun b!944890 () Bool)

(declare-fun res!634753 () Bool)

(assert (=> b!944890 (=> res!634753 e!531367)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944890 (= res!634753 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944891 () Bool)

(declare-fun res!634748 () Bool)

(assert (=> b!944891 (=> res!634748 e!531367)))

(assert (=> b!944891 (= res!634748 (not (= (size!27959 (_keys!10558 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27338 thiss!1141)))))))

(declare-fun res!634752 () Bool)

(assert (=> start!80432 (=> (not res!634752) (not e!531369))))

(declare-fun valid!1824 (LongMapFixedSize!4770) Bool)

(assert (=> start!80432 (= res!634752 (valid!1824 thiss!1141))))

(assert (=> start!80432 e!531369))

(declare-fun e!531370 () Bool)

(assert (=> start!80432 e!531370))

(assert (=> start!80432 true))

(declare-fun mapIsEmpty!32700 () Bool)

(assert (=> mapIsEmpty!32700 mapRes!32700))

(declare-fun tp_is_empty!20583 () Bool)

(declare-fun array_inv!21362 (array!57136) Bool)

(declare-fun array_inv!21363 (array!57134) Bool)

(assert (=> b!944892 (= e!531370 (and tp!62735 tp_is_empty!20583 (array_inv!21362 (_keys!10558 thiss!1141)) (array_inv!21363 (_values!5703 thiss!1141)) e!531365))))

(declare-fun b!944893 () Bool)

(declare-fun res!634750 () Bool)

(assert (=> b!944893 (=> (not res!634750) (not e!531369))))

(assert (=> b!944893 (= res!634750 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944894 () Bool)

(assert (=> b!944894 (= e!531366 tp_is_empty!20583)))

(declare-fun b!944895 () Bool)

(assert (=> b!944895 (= e!531364 tp_is_empty!20583)))

(declare-fun b!944896 () Bool)

(declare-fun res!634751 () Bool)

(assert (=> b!944896 (=> (not res!634751) (not e!531369))))

(get-info :version)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57136 (_ BitVec 32)) SeekEntryResult!9079)

(assert (=> b!944896 (= res!634751 (not ((_ is Found!9079) (seekEntry!0 key!756 (_keys!10558 thiss!1141) (mask!27338 thiss!1141)))))))

(declare-fun b!944897 () Bool)

(declare-fun res!634754 () Bool)

(assert (=> b!944897 (=> res!634754 e!531367)))

(assert (=> b!944897 (= res!634754 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10558 thiss!1141) (mask!27338 thiss!1141))))))

(declare-fun b!944898 () Bool)

(declare-fun res!634749 () Bool)

(assert (=> b!944898 (=> (not res!634749) (not e!531369))))

(declare-datatypes ((tuple2!13500 0))(
  ( (tuple2!13501 (_1!6761 (_ BitVec 64)) (_2!6761 V!32409)) )
))
(declare-datatypes ((List!19284 0))(
  ( (Nil!19281) (Cons!19280 (h!20431 tuple2!13500) (t!27601 List!19284)) )
))
(declare-datatypes ((ListLongMap!12197 0))(
  ( (ListLongMap!12198 (toList!6114 List!19284)) )
))
(declare-fun contains!5186 (ListLongMap!12197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3348 (array!57136 array!57134 (_ BitVec 32) (_ BitVec 32) V!32409 V!32409 (_ BitVec 32) Int) ListLongMap!12197)

(assert (=> b!944898 (= res!634749 (contains!5186 (getCurrentListMap!3348 (_keys!10558 thiss!1141) (_values!5703 thiss!1141) (mask!27338 thiss!1141) (extraKeys!5412 thiss!1141) (zeroValue!5516 thiss!1141) (minValue!5516 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5680 thiss!1141)) key!756))))

(assert (= (and start!80432 res!634752) b!944893))

(assert (= (and b!944893 res!634750) b!944896))

(assert (= (and b!944896 res!634751) b!944898))

(assert (= (and b!944898 res!634749) b!944887))

(assert (= (and b!944887 (not res!634755)) b!944891))

(assert (= (and b!944891 (not res!634748)) b!944897))

(assert (= (and b!944897 (not res!634754)) b!944890))

(assert (= (and b!944890 (not res!634753)) b!944889))

(assert (= (and b!944888 condMapEmpty!32700) mapIsEmpty!32700))

(assert (= (and b!944888 (not condMapEmpty!32700)) mapNonEmpty!32700))

(assert (= (and mapNonEmpty!32700 ((_ is ValueCellFull!9810) mapValue!32700)) b!944895))

(assert (= (and b!944888 ((_ is ValueCellFull!9810) mapDefault!32700)) b!944894))

(assert (= b!944892 b!944888))

(assert (= start!80432 b!944892))

(declare-fun m!878837 () Bool)

(assert (=> b!944892 m!878837))

(declare-fun m!878839 () Bool)

(assert (=> b!944892 m!878839))

(declare-fun m!878841 () Bool)

(assert (=> b!944889 m!878841))

(declare-fun m!878843 () Bool)

(assert (=> b!944897 m!878843))

(declare-fun m!878845 () Bool)

(assert (=> b!944896 m!878845))

(declare-fun m!878847 () Bool)

(assert (=> b!944887 m!878847))

(declare-fun m!878849 () Bool)

(assert (=> b!944887 m!878849))

(declare-fun m!878851 () Bool)

(assert (=> b!944887 m!878851))

(declare-fun m!878853 () Bool)

(assert (=> b!944887 m!878853))

(declare-fun m!878855 () Bool)

(assert (=> b!944887 m!878855))

(declare-fun m!878857 () Bool)

(assert (=> b!944887 m!878857))

(declare-fun m!878859 () Bool)

(assert (=> b!944890 m!878859))

(declare-fun m!878861 () Bool)

(assert (=> mapNonEmpty!32700 m!878861))

(declare-fun m!878863 () Bool)

(assert (=> b!944898 m!878863))

(assert (=> b!944898 m!878863))

(declare-fun m!878865 () Bool)

(assert (=> b!944898 m!878865))

(declare-fun m!878867 () Bool)

(assert (=> start!80432 m!878867))

(check-sat (not start!80432) (not b_next!18075) (not b!944890) (not b!944897) b_and!29493 (not mapNonEmpty!32700) tp_is_empty!20583 (not b!944889) (not b!944887) (not b!944898) (not b!944892) (not b!944896))
(check-sat b_and!29493 (not b_next!18075))
