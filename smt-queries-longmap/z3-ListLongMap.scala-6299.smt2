; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80570 () Bool)

(assert start!80570)

(declare-fun b!945856 () Bool)

(declare-fun b_free!18117 () Bool)

(declare-fun b_next!18117 () Bool)

(assert (=> b!945856 (= b_free!18117 (not b_next!18117))))

(declare-fun tp!62879 () Bool)

(declare-fun b_and!29539 () Bool)

(assert (=> b!945856 (= tp!62879 b_and!29539)))

(declare-fun res!635127 () Bool)

(declare-fun e!532078 () Bool)

(assert (=> start!80570 (=> (not res!635127) (not e!532078))))

(declare-datatypes ((V!32465 0))(
  ( (V!32466 (val!10363 Int)) )
))
(declare-datatypes ((ValueCell!9831 0))(
  ( (ValueCellFull!9831 (v!12897 V!32465)) (EmptyCell!9831) )
))
(declare-datatypes ((array!57228 0))(
  ( (array!57229 (arr!27534 (Array (_ BitVec 32) ValueCell!9831)) (size!28003 (_ BitVec 32))) )
))
(declare-datatypes ((array!57230 0))(
  ( (array!57231 (arr!27535 (Array (_ BitVec 32) (_ BitVec 64))) (size!28004 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4812 0))(
  ( (LongMapFixedSize!4813 (defaultEntry!5703 Int) (mask!27385 (_ BitVec 32)) (extraKeys!5435 (_ BitVec 32)) (zeroValue!5539 V!32465) (minValue!5539 V!32465) (_size!2461 (_ BitVec 32)) (_keys!10589 array!57230) (_values!5726 array!57228) (_vacant!2461 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4812)

(declare-fun valid!1838 (LongMapFixedSize!4812) Bool)

(assert (=> start!80570 (= res!635127 (valid!1838 thiss!1141))))

(assert (=> start!80570 e!532078))

(declare-fun e!532072 () Bool)

(assert (=> start!80570 e!532072))

(assert (=> start!80570 true))

(declare-fun b!945854 () Bool)

(declare-fun e!532077 () Bool)

(declare-fun e!532076 () Bool)

(declare-fun mapRes!32781 () Bool)

(assert (=> b!945854 (= e!532077 (and e!532076 mapRes!32781))))

(declare-fun condMapEmpty!32781 () Bool)

(declare-fun mapDefault!32781 () ValueCell!9831)

(assert (=> b!945854 (= condMapEmpty!32781 (= (arr!27534 (_values!5726 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9831)) mapDefault!32781)))))

(declare-fun b!945855 () Bool)

(declare-fun e!532074 () Bool)

(assert (=> b!945855 (= e!532078 e!532074)))

(declare-fun res!635128 () Bool)

(assert (=> b!945855 (=> (not res!635128) (not e!532074))))

(declare-datatypes ((SeekEntryResult!9094 0))(
  ( (MissingZero!9094 (index!38747 (_ BitVec 32))) (Found!9094 (index!38748 (_ BitVec 32))) (Intermediate!9094 (undefined!9906 Bool) (index!38749 (_ BitVec 32)) (x!81298 (_ BitVec 32))) (Undefined!9094) (MissingVacant!9094 (index!38750 (_ BitVec 32))) )
))
(declare-fun lt!426123 () SeekEntryResult!9094)

(get-info :version)

(assert (=> b!945855 (= res!635128 (and ((_ is Found!9094) lt!426123) (bvsge (index!38748 lt!426123) #b00000000000000000000000000000000) (bvslt (index!38748 lt!426123) (size!28004 (_keys!10589 thiss!1141))) (bvslt (size!28004 (_keys!10589 thiss!1141)) #b01111111111111111111111111111111)))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57230 (_ BitVec 32)) SeekEntryResult!9094)

(assert (=> b!945855 (= lt!426123 (seekEntry!0 key!756 (_keys!10589 thiss!1141) (mask!27385 thiss!1141)))))

(declare-fun mapIsEmpty!32781 () Bool)

(assert (=> mapIsEmpty!32781 mapRes!32781))

(declare-fun tp_is_empty!20625 () Bool)

(declare-fun array_inv!21388 (array!57230) Bool)

(declare-fun array_inv!21389 (array!57228) Bool)

(assert (=> b!945856 (= e!532072 (and tp!62879 tp_is_empty!20625 (array_inv!21388 (_keys!10589 thiss!1141)) (array_inv!21389 (_values!5726 thiss!1141)) e!532077))))

(declare-fun b!945857 () Bool)

(declare-fun arrayContainsKey!0 (array!57230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945857 (= e!532074 (not (arrayContainsKey!0 (_keys!10589 thiss!1141) key!756 (index!38748 lt!426123))))))

(declare-fun b!945858 () Bool)

(declare-fun e!532075 () Bool)

(assert (=> b!945858 (= e!532075 tp_is_empty!20625)))

(declare-fun b!945859 () Bool)

(declare-fun res!635126 () Bool)

(assert (=> b!945859 (=> (not res!635126) (not e!532078))))

(assert (=> b!945859 (= res!635126 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945860 () Bool)

(assert (=> b!945860 (= e!532076 tp_is_empty!20625)))

(declare-fun mapNonEmpty!32781 () Bool)

(declare-fun tp!62878 () Bool)

(assert (=> mapNonEmpty!32781 (= mapRes!32781 (and tp!62878 e!532075))))

(declare-fun mapValue!32781 () ValueCell!9831)

(declare-fun mapKey!32781 () (_ BitVec 32))

(declare-fun mapRest!32781 () (Array (_ BitVec 32) ValueCell!9831))

(assert (=> mapNonEmpty!32781 (= (arr!27534 (_values!5726 thiss!1141)) (store mapRest!32781 mapKey!32781 mapValue!32781))))

(assert (= (and start!80570 res!635127) b!945859))

(assert (= (and b!945859 res!635126) b!945855))

(assert (= (and b!945855 res!635128) b!945857))

(assert (= (and b!945854 condMapEmpty!32781) mapIsEmpty!32781))

(assert (= (and b!945854 (not condMapEmpty!32781)) mapNonEmpty!32781))

(assert (= (and mapNonEmpty!32781 ((_ is ValueCellFull!9831) mapValue!32781)) b!945858))

(assert (= (and b!945854 ((_ is ValueCellFull!9831) mapDefault!32781)) b!945860))

(assert (= b!945856 b!945854))

(assert (= start!80570 b!945856))

(declare-fun m!879473 () Bool)

(assert (=> b!945855 m!879473))

(declare-fun m!879475 () Bool)

(assert (=> b!945856 m!879475))

(declare-fun m!879477 () Bool)

(assert (=> b!945856 m!879477))

(declare-fun m!879479 () Bool)

(assert (=> mapNonEmpty!32781 m!879479))

(declare-fun m!879481 () Bool)

(assert (=> start!80570 m!879481))

(declare-fun m!879483 () Bool)

(assert (=> b!945857 m!879483))

(check-sat tp_is_empty!20625 (not b!945857) b_and!29539 (not mapNonEmpty!32781) (not start!80570) (not b!945855) (not b_next!18117) (not b!945856))
(check-sat b_and!29539 (not b_next!18117))
(get-model)

(declare-fun d!114451 () Bool)

(declare-fun res!635144 () Bool)

(declare-fun e!532102 () Bool)

(assert (=> d!114451 (=> (not res!635144) (not e!532102))))

(declare-fun simpleValid!354 (LongMapFixedSize!4812) Bool)

(assert (=> d!114451 (= res!635144 (simpleValid!354 thiss!1141))))

(assert (=> d!114451 (= (valid!1838 thiss!1141) e!532102)))

(declare-fun b!945888 () Bool)

(declare-fun res!635145 () Bool)

(assert (=> b!945888 (=> (not res!635145) (not e!532102))))

(declare-fun arrayCountValidKeys!0 (array!57230 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945888 (= res!635145 (= (arrayCountValidKeys!0 (_keys!10589 thiss!1141) #b00000000000000000000000000000000 (size!28004 (_keys!10589 thiss!1141))) (_size!2461 thiss!1141)))))

(declare-fun b!945889 () Bool)

(declare-fun res!635146 () Bool)

(assert (=> b!945889 (=> (not res!635146) (not e!532102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57230 (_ BitVec 32)) Bool)

(assert (=> b!945889 (= res!635146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10589 thiss!1141) (mask!27385 thiss!1141)))))

(declare-fun b!945890 () Bool)

(declare-datatypes ((List!19294 0))(
  ( (Nil!19291) (Cons!19290 (h!20442 (_ BitVec 64)) (t!27615 List!19294)) )
))
(declare-fun arrayNoDuplicates!0 (array!57230 (_ BitVec 32) List!19294) Bool)

(assert (=> b!945890 (= e!532102 (arrayNoDuplicates!0 (_keys!10589 thiss!1141) #b00000000000000000000000000000000 Nil!19291))))

(assert (= (and d!114451 res!635144) b!945888))

(assert (= (and b!945888 res!635145) b!945889))

(assert (= (and b!945889 res!635146) b!945890))

(declare-fun m!879497 () Bool)

(assert (=> d!114451 m!879497))

(declare-fun m!879499 () Bool)

(assert (=> b!945888 m!879499))

(declare-fun m!879501 () Bool)

(assert (=> b!945889 m!879501))

(declare-fun m!879503 () Bool)

(assert (=> b!945890 m!879503))

(assert (=> start!80570 d!114451))

(declare-fun b!945903 () Bool)

(declare-fun e!532109 () SeekEntryResult!9094)

(declare-fun lt!426136 () SeekEntryResult!9094)

(assert (=> b!945903 (= e!532109 (ite ((_ is MissingVacant!9094) lt!426136) (MissingZero!9094 (index!38750 lt!426136)) lt!426136))))

(declare-fun lt!426135 () SeekEntryResult!9094)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57230 (_ BitVec 32)) SeekEntryResult!9094)

(assert (=> b!945903 (= lt!426136 (seekKeyOrZeroReturnVacant!0 (x!81298 lt!426135) (index!38749 lt!426135) (index!38749 lt!426135) key!756 (_keys!10589 thiss!1141) (mask!27385 thiss!1141)))))

(declare-fun b!945904 () Bool)

(declare-fun e!532111 () SeekEntryResult!9094)

(assert (=> b!945904 (= e!532111 (Found!9094 (index!38749 lt!426135)))))

(declare-fun b!945905 () Bool)

(declare-fun c!98485 () Bool)

(declare-fun lt!426138 () (_ BitVec 64))

(assert (=> b!945905 (= c!98485 (= lt!426138 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!945905 (= e!532111 e!532109)))

(declare-fun b!945906 () Bool)

(declare-fun e!532110 () SeekEntryResult!9094)

(assert (=> b!945906 (= e!532110 Undefined!9094)))

(declare-fun d!114453 () Bool)

(declare-fun lt!426137 () SeekEntryResult!9094)

(assert (=> d!114453 (and (or ((_ is MissingVacant!9094) lt!426137) (not ((_ is Found!9094) lt!426137)) (and (bvsge (index!38748 lt!426137) #b00000000000000000000000000000000) (bvslt (index!38748 lt!426137) (size!28004 (_keys!10589 thiss!1141))))) (not ((_ is MissingVacant!9094) lt!426137)) (or (not ((_ is Found!9094) lt!426137)) (= (select (arr!27535 (_keys!10589 thiss!1141)) (index!38748 lt!426137)) key!756)))))

(assert (=> d!114453 (= lt!426137 e!532110)))

(declare-fun c!98486 () Bool)

(assert (=> d!114453 (= c!98486 (and ((_ is Intermediate!9094) lt!426135) (undefined!9906 lt!426135)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57230 (_ BitVec 32)) SeekEntryResult!9094)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114453 (= lt!426135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27385 thiss!1141)) key!756 (_keys!10589 thiss!1141) (mask!27385 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114453 (validMask!0 (mask!27385 thiss!1141))))

(assert (=> d!114453 (= (seekEntry!0 key!756 (_keys!10589 thiss!1141) (mask!27385 thiss!1141)) lt!426137)))

(declare-fun b!945907 () Bool)

(assert (=> b!945907 (= e!532110 e!532111)))

(assert (=> b!945907 (= lt!426138 (select (arr!27535 (_keys!10589 thiss!1141)) (index!38749 lt!426135)))))

(declare-fun c!98484 () Bool)

(assert (=> b!945907 (= c!98484 (= lt!426138 key!756))))

(declare-fun b!945908 () Bool)

(assert (=> b!945908 (= e!532109 (MissingZero!9094 (index!38749 lt!426135)))))

(assert (= (and d!114453 c!98486) b!945906))

(assert (= (and d!114453 (not c!98486)) b!945907))

(assert (= (and b!945907 c!98484) b!945904))

(assert (= (and b!945907 (not c!98484)) b!945905))

(assert (= (and b!945905 c!98485) b!945908))

(assert (= (and b!945905 (not c!98485)) b!945903))

(declare-fun m!879505 () Bool)

(assert (=> b!945903 m!879505))

(declare-fun m!879507 () Bool)

(assert (=> d!114453 m!879507))

(declare-fun m!879509 () Bool)

(assert (=> d!114453 m!879509))

(assert (=> d!114453 m!879509))

(declare-fun m!879511 () Bool)

(assert (=> d!114453 m!879511))

(declare-fun m!879513 () Bool)

(assert (=> d!114453 m!879513))

(declare-fun m!879515 () Bool)

(assert (=> b!945907 m!879515))

(assert (=> b!945855 d!114453))

(declare-fun d!114455 () Bool)

(declare-fun res!635151 () Bool)

(declare-fun e!532116 () Bool)

(assert (=> d!114455 (=> res!635151 e!532116)))

(assert (=> d!114455 (= res!635151 (= (select (arr!27535 (_keys!10589 thiss!1141)) (index!38748 lt!426123)) key!756))))

(assert (=> d!114455 (= (arrayContainsKey!0 (_keys!10589 thiss!1141) key!756 (index!38748 lt!426123)) e!532116)))

(declare-fun b!945913 () Bool)

(declare-fun e!532117 () Bool)

(assert (=> b!945913 (= e!532116 e!532117)))

(declare-fun res!635152 () Bool)

(assert (=> b!945913 (=> (not res!635152) (not e!532117))))

(assert (=> b!945913 (= res!635152 (bvslt (bvadd (index!38748 lt!426123) #b00000000000000000000000000000001) (size!28004 (_keys!10589 thiss!1141))))))

(declare-fun b!945914 () Bool)

(assert (=> b!945914 (= e!532117 (arrayContainsKey!0 (_keys!10589 thiss!1141) key!756 (bvadd (index!38748 lt!426123) #b00000000000000000000000000000001)))))

(assert (= (and d!114455 (not res!635151)) b!945913))

(assert (= (and b!945913 res!635152) b!945914))

(declare-fun m!879517 () Bool)

(assert (=> d!114455 m!879517))

(declare-fun m!879519 () Bool)

(assert (=> b!945914 m!879519))

(assert (=> b!945857 d!114455))

(declare-fun d!114457 () Bool)

(assert (=> d!114457 (= (array_inv!21388 (_keys!10589 thiss!1141)) (bvsge (size!28004 (_keys!10589 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945856 d!114457))

(declare-fun d!114459 () Bool)

(assert (=> d!114459 (= (array_inv!21389 (_values!5726 thiss!1141)) (bvsge (size!28003 (_values!5726 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945856 d!114459))

(declare-fun b!945921 () Bool)

(declare-fun e!532123 () Bool)

(assert (=> b!945921 (= e!532123 tp_is_empty!20625)))

(declare-fun mapIsEmpty!32787 () Bool)

(declare-fun mapRes!32787 () Bool)

(assert (=> mapIsEmpty!32787 mapRes!32787))

(declare-fun mapNonEmpty!32787 () Bool)

(declare-fun tp!62888 () Bool)

(assert (=> mapNonEmpty!32787 (= mapRes!32787 (and tp!62888 e!532123))))

(declare-fun mapValue!32787 () ValueCell!9831)

(declare-fun mapKey!32787 () (_ BitVec 32))

(declare-fun mapRest!32787 () (Array (_ BitVec 32) ValueCell!9831))

(assert (=> mapNonEmpty!32787 (= mapRest!32781 (store mapRest!32787 mapKey!32787 mapValue!32787))))

(declare-fun condMapEmpty!32787 () Bool)

(declare-fun mapDefault!32787 () ValueCell!9831)

(assert (=> mapNonEmpty!32781 (= condMapEmpty!32787 (= mapRest!32781 ((as const (Array (_ BitVec 32) ValueCell!9831)) mapDefault!32787)))))

(declare-fun e!532122 () Bool)

(assert (=> mapNonEmpty!32781 (= tp!62878 (and e!532122 mapRes!32787))))

(declare-fun b!945922 () Bool)

(assert (=> b!945922 (= e!532122 tp_is_empty!20625)))

(assert (= (and mapNonEmpty!32781 condMapEmpty!32787) mapIsEmpty!32787))

(assert (= (and mapNonEmpty!32781 (not condMapEmpty!32787)) mapNonEmpty!32787))

(assert (= (and mapNonEmpty!32787 ((_ is ValueCellFull!9831) mapValue!32787)) b!945921))

(assert (= (and mapNonEmpty!32781 ((_ is ValueCellFull!9831) mapDefault!32787)) b!945922))

(declare-fun m!879521 () Bool)

(assert (=> mapNonEmpty!32787 m!879521))

(check-sat (not b_next!18117) tp_is_empty!20625 (not b!945903) (not b!945890) b_and!29539 (not d!114451) (not mapNonEmpty!32787) (not b!945888) (not d!114453) (not b!945914) (not b!945889))
(check-sat b_and!29539 (not b_next!18117))
