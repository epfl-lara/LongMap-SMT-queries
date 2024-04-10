; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81234 () Bool)

(assert start!81234)

(declare-fun b!950516 () Bool)

(declare-fun b_free!18249 () Bool)

(declare-fun b_next!18249 () Bool)

(assert (=> b!950516 (= b_free!18249 (not b_next!18249))))

(declare-fun tp!63346 () Bool)

(declare-fun b_and!29707 () Bool)

(assert (=> b!950516 (= tp!63346 b_and!29707)))

(declare-fun b!950515 () Bool)

(declare-fun e!535164 () Bool)

(declare-fun e!535168 () Bool)

(declare-fun mapRes!33050 () Bool)

(assert (=> b!950515 (= e!535164 (and e!535168 mapRes!33050))))

(declare-fun condMapEmpty!33050 () Bool)

(declare-datatypes ((V!32641 0))(
  ( (V!32642 (val!10429 Int)) )
))
(declare-datatypes ((ValueCell!9897 0))(
  ( (ValueCellFull!9897 (v!12973 V!32641)) (EmptyCell!9897) )
))
(declare-datatypes ((array!57534 0))(
  ( (array!57535 (arr!27666 (Array (_ BitVec 32) ValueCell!9897)) (size!28143 (_ BitVec 32))) )
))
(declare-datatypes ((array!57536 0))(
  ( (array!57537 (arr!27667 (Array (_ BitVec 32) (_ BitVec 64))) (size!28144 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4944 0))(
  ( (LongMapFixedSize!4945 (defaultEntry!5785 Int) (mask!27589 (_ BitVec 32)) (extraKeys!5517 (_ BitVec 32)) (zeroValue!5621 V!32641) (minValue!5621 V!32641) (_size!2527 (_ BitVec 32)) (_keys!10722 array!57536) (_values!5808 array!57534) (_vacant!2527 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4944)

(declare-fun mapDefault!33050 () ValueCell!9897)

(assert (=> b!950515 (= condMapEmpty!33050 (= (arr!27666 (_values!5808 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9897)) mapDefault!33050)))))

(declare-fun res!637242 () Bool)

(declare-fun e!535169 () Bool)

(assert (=> start!81234 (=> (not res!637242) (not e!535169))))

(declare-fun valid!1879 (LongMapFixedSize!4944) Bool)

(assert (=> start!81234 (= res!637242 (valid!1879 thiss!1141))))

(assert (=> start!81234 e!535169))

(declare-fun e!535166 () Bool)

(assert (=> start!81234 e!535166))

(assert (=> start!81234 true))

(declare-fun mapNonEmpty!33050 () Bool)

(declare-fun tp!63345 () Bool)

(declare-fun e!535170 () Bool)

(assert (=> mapNonEmpty!33050 (= mapRes!33050 (and tp!63345 e!535170))))

(declare-fun mapValue!33050 () ValueCell!9897)

(declare-fun mapKey!33050 () (_ BitVec 32))

(declare-fun mapRest!33050 () (Array (_ BitVec 32) ValueCell!9897))

(assert (=> mapNonEmpty!33050 (= (arr!27666 (_values!5808 thiss!1141)) (store mapRest!33050 mapKey!33050 mapValue!33050))))

(declare-fun mapIsEmpty!33050 () Bool)

(assert (=> mapIsEmpty!33050 mapRes!33050))

(declare-fun tp_is_empty!20757 () Bool)

(declare-fun array_inv!21474 (array!57536) Bool)

(declare-fun array_inv!21475 (array!57534) Bool)

(assert (=> b!950516 (= e!535166 (and tp!63346 tp_is_empty!20757 (array_inv!21474 (_keys!10722 thiss!1141)) (array_inv!21475 (_values!5808 thiss!1141)) e!535164))))

(declare-fun b!950517 () Bool)

(declare-fun e!535165 () Bool)

(assert (=> b!950517 (= e!535169 (not e!535165))))

(declare-fun res!637240 () Bool)

(assert (=> b!950517 (=> res!637240 e!535165)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950517 (= res!637240 (not (validMask!0 (mask!27589 thiss!1141))))))

(declare-fun lt!428064 () (_ BitVec 32))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57536 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950517 (= lt!428064 (arrayScanForKey!0 (_keys!10722 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!950517 (arrayContainsKey!0 (_keys!10722 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31995 0))(
  ( (Unit!31996) )
))
(declare-fun lt!428063 () Unit!31995)

(declare-fun lemmaKeyInListMapIsInArray!321 (array!57536 array!57534 (_ BitVec 32) (_ BitVec 32) V!32641 V!32641 (_ BitVec 64) Int) Unit!31995)

(assert (=> b!950517 (= lt!428063 (lemmaKeyInListMapIsInArray!321 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) key!756 (defaultEntry!5785 thiss!1141)))))

(declare-fun b!950518 () Bool)

(declare-fun res!637243 () Bool)

(assert (=> b!950518 (=> (not res!637243) (not e!535169))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9144 0))(
  ( (MissingZero!9144 (index!38947 (_ BitVec 32))) (Found!9144 (index!38948 (_ BitVec 32))) (Intermediate!9144 (undefined!9956 Bool) (index!38949 (_ BitVec 32)) (x!81780 (_ BitVec 32))) (Undefined!9144) (MissingVacant!9144 (index!38950 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57536 (_ BitVec 32)) SeekEntryResult!9144)

(assert (=> b!950518 (= res!637243 (not ((_ is Found!9144) (seekEntry!0 key!756 (_keys!10722 thiss!1141) (mask!27589 thiss!1141)))))))

(declare-fun b!950519 () Bool)

(declare-fun res!637241 () Bool)

(assert (=> b!950519 (=> (not res!637241) (not e!535169))))

(declare-datatypes ((tuple2!13554 0))(
  ( (tuple2!13555 (_1!6788 (_ BitVec 64)) (_2!6788 V!32641)) )
))
(declare-datatypes ((List!19343 0))(
  ( (Nil!19340) (Cons!19339 (h!20499 tuple2!13554) (t!27684 List!19343)) )
))
(declare-datatypes ((ListLongMap!12251 0))(
  ( (ListLongMap!12252 (toList!6141 List!19343)) )
))
(declare-fun contains!5232 (ListLongMap!12251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3374 (array!57536 array!57534 (_ BitVec 32) (_ BitVec 32) V!32641 V!32641 (_ BitVec 32) Int) ListLongMap!12251)

(assert (=> b!950519 (= res!637241 (contains!5232 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)) key!756))))

(declare-fun b!950520 () Bool)

(declare-fun res!637239 () Bool)

(assert (=> b!950520 (=> (not res!637239) (not e!535169))))

(assert (=> b!950520 (= res!637239 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!950521 () Bool)

(assert (=> b!950521 (= e!535168 tp_is_empty!20757)))

(declare-fun b!950522 () Bool)

(assert (=> b!950522 (= e!535170 tp_is_empty!20757)))

(declare-fun b!950523 () Bool)

(assert (=> b!950523 (= e!535165 (= (size!28144 (_keys!10722 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27589 thiss!1141))))))

(assert (= (and start!81234 res!637242) b!950520))

(assert (= (and b!950520 res!637239) b!950518))

(assert (= (and b!950518 res!637243) b!950519))

(assert (= (and b!950519 res!637241) b!950517))

(assert (= (and b!950517 (not res!637240)) b!950523))

(assert (= (and b!950515 condMapEmpty!33050) mapIsEmpty!33050))

(assert (= (and b!950515 (not condMapEmpty!33050)) mapNonEmpty!33050))

(assert (= (and mapNonEmpty!33050 ((_ is ValueCellFull!9897) mapValue!33050)) b!950522))

(assert (= (and b!950515 ((_ is ValueCellFull!9897) mapDefault!33050)) b!950521))

(assert (= b!950516 b!950515))

(assert (= start!81234 b!950516))

(declare-fun m!882913 () Bool)

(assert (=> mapNonEmpty!33050 m!882913))

(declare-fun m!882915 () Bool)

(assert (=> start!81234 m!882915))

(declare-fun m!882917 () Bool)

(assert (=> b!950516 m!882917))

(declare-fun m!882919 () Bool)

(assert (=> b!950516 m!882919))

(declare-fun m!882921 () Bool)

(assert (=> b!950517 m!882921))

(declare-fun m!882923 () Bool)

(assert (=> b!950517 m!882923))

(declare-fun m!882925 () Bool)

(assert (=> b!950517 m!882925))

(declare-fun m!882927 () Bool)

(assert (=> b!950517 m!882927))

(declare-fun m!882929 () Bool)

(assert (=> b!950518 m!882929))

(declare-fun m!882931 () Bool)

(assert (=> b!950519 m!882931))

(assert (=> b!950519 m!882931))

(declare-fun m!882933 () Bool)

(assert (=> b!950519 m!882933))

(check-sat (not start!81234) (not b!950516) (not b_next!18249) tp_is_empty!20757 (not mapNonEmpty!33050) (not b!950519) b_and!29707 (not b!950517) (not b!950518))
(check-sat b_and!29707 (not b_next!18249))
(get-model)

(declare-fun d!115189 () Bool)

(assert (=> d!115189 (= (array_inv!21474 (_keys!10722 thiss!1141)) (bvsge (size!28144 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950516 d!115189))

(declare-fun d!115191 () Bool)

(assert (=> d!115191 (= (array_inv!21475 (_values!5808 thiss!1141)) (bvsge (size!28143 (_values!5808 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950516 d!115191))

(declare-fun d!115193 () Bool)

(assert (=> d!115193 (= (validMask!0 (mask!27589 thiss!1141)) (and (or (= (mask!27589 thiss!1141) #b00000000000000000000000000000111) (= (mask!27589 thiss!1141) #b00000000000000000000000000001111) (= (mask!27589 thiss!1141) #b00000000000000000000000000011111) (= (mask!27589 thiss!1141) #b00000000000000000000000000111111) (= (mask!27589 thiss!1141) #b00000000000000000000000001111111) (= (mask!27589 thiss!1141) #b00000000000000000000000011111111) (= (mask!27589 thiss!1141) #b00000000000000000000000111111111) (= (mask!27589 thiss!1141) #b00000000000000000000001111111111) (= (mask!27589 thiss!1141) #b00000000000000000000011111111111) (= (mask!27589 thiss!1141) #b00000000000000000000111111111111) (= (mask!27589 thiss!1141) #b00000000000000000001111111111111) (= (mask!27589 thiss!1141) #b00000000000000000011111111111111) (= (mask!27589 thiss!1141) #b00000000000000000111111111111111) (= (mask!27589 thiss!1141) #b00000000000000001111111111111111) (= (mask!27589 thiss!1141) #b00000000000000011111111111111111) (= (mask!27589 thiss!1141) #b00000000000000111111111111111111) (= (mask!27589 thiss!1141) #b00000000000001111111111111111111) (= (mask!27589 thiss!1141) #b00000000000011111111111111111111) (= (mask!27589 thiss!1141) #b00000000000111111111111111111111) (= (mask!27589 thiss!1141) #b00000000001111111111111111111111) (= (mask!27589 thiss!1141) #b00000000011111111111111111111111) (= (mask!27589 thiss!1141) #b00000000111111111111111111111111) (= (mask!27589 thiss!1141) #b00000001111111111111111111111111) (= (mask!27589 thiss!1141) #b00000011111111111111111111111111) (= (mask!27589 thiss!1141) #b00000111111111111111111111111111) (= (mask!27589 thiss!1141) #b00001111111111111111111111111111) (= (mask!27589 thiss!1141) #b00011111111111111111111111111111) (= (mask!27589 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27589 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!950517 d!115193))

(declare-fun d!115195 () Bool)

(declare-fun lt!428073 () (_ BitVec 32))

(assert (=> d!115195 (and (or (bvslt lt!428073 #b00000000000000000000000000000000) (bvsge lt!428073 (size!28144 (_keys!10722 thiss!1141))) (and (bvsge lt!428073 #b00000000000000000000000000000000) (bvslt lt!428073 (size!28144 (_keys!10722 thiss!1141))))) (bvsge lt!428073 #b00000000000000000000000000000000) (bvslt lt!428073 (size!28144 (_keys!10722 thiss!1141))) (= (select (arr!27667 (_keys!10722 thiss!1141)) lt!428073) key!756))))

(declare-fun e!535194 () (_ BitVec 32))

(assert (=> d!115195 (= lt!428073 e!535194)))

(declare-fun c!99256 () Bool)

(assert (=> d!115195 (= c!99256 (= (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115195 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))) (bvslt (size!28144 (_keys!10722 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115195 (= (arrayScanForKey!0 (_keys!10722 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428073)))

(declare-fun b!950555 () Bool)

(assert (=> b!950555 (= e!535194 #b00000000000000000000000000000000)))

(declare-fun b!950556 () Bool)

(assert (=> b!950556 (= e!535194 (arrayScanForKey!0 (_keys!10722 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115195 c!99256) b!950555))

(assert (= (and d!115195 (not c!99256)) b!950556))

(declare-fun m!882957 () Bool)

(assert (=> d!115195 m!882957))

(declare-fun m!882959 () Bool)

(assert (=> d!115195 m!882959))

(declare-fun m!882961 () Bool)

(assert (=> b!950556 m!882961))

(assert (=> b!950517 d!115195))

(declare-fun d!115197 () Bool)

(declare-fun res!637263 () Bool)

(declare-fun e!535199 () Bool)

(assert (=> d!115197 (=> res!637263 e!535199)))

(assert (=> d!115197 (= res!637263 (= (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115197 (= (arrayContainsKey!0 (_keys!10722 thiss!1141) key!756 #b00000000000000000000000000000000) e!535199)))

(declare-fun b!950561 () Bool)

(declare-fun e!535200 () Bool)

(assert (=> b!950561 (= e!535199 e!535200)))

(declare-fun res!637264 () Bool)

(assert (=> b!950561 (=> (not res!637264) (not e!535200))))

(assert (=> b!950561 (= res!637264 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28144 (_keys!10722 thiss!1141))))))

(declare-fun b!950562 () Bool)

(assert (=> b!950562 (= e!535200 (arrayContainsKey!0 (_keys!10722 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115197 (not res!637263)) b!950561))

(assert (= (and b!950561 res!637264) b!950562))

(assert (=> d!115197 m!882959))

(declare-fun m!882963 () Bool)

(assert (=> b!950562 m!882963))

(assert (=> b!950517 d!115197))

(declare-fun d!115199 () Bool)

(declare-fun e!535203 () Bool)

(assert (=> d!115199 e!535203))

(declare-fun c!99259 () Bool)

(assert (=> d!115199 (= c!99259 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428076 () Unit!31995)

(declare-fun choose!1585 (array!57536 array!57534 (_ BitVec 32) (_ BitVec 32) V!32641 V!32641 (_ BitVec 64) Int) Unit!31995)

(assert (=> d!115199 (= lt!428076 (choose!1585 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) key!756 (defaultEntry!5785 thiss!1141)))))

(assert (=> d!115199 (validMask!0 (mask!27589 thiss!1141))))

(assert (=> d!115199 (= (lemmaKeyInListMapIsInArray!321 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) key!756 (defaultEntry!5785 thiss!1141)) lt!428076)))

(declare-fun b!950567 () Bool)

(assert (=> b!950567 (= e!535203 (arrayContainsKey!0 (_keys!10722 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!950568 () Bool)

(assert (=> b!950568 (= e!535203 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5517 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5517 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115199 c!99259) b!950567))

(assert (= (and d!115199 (not c!99259)) b!950568))

(declare-fun m!882965 () Bool)

(assert (=> d!115199 m!882965))

(assert (=> d!115199 m!882921))

(assert (=> b!950567 m!882925))

(assert (=> b!950517 d!115199))

(declare-fun d!115201 () Bool)

(declare-fun res!637271 () Bool)

(declare-fun e!535206 () Bool)

(assert (=> d!115201 (=> (not res!637271) (not e!535206))))

(declare-fun simpleValid!375 (LongMapFixedSize!4944) Bool)

(assert (=> d!115201 (= res!637271 (simpleValid!375 thiss!1141))))

(assert (=> d!115201 (= (valid!1879 thiss!1141) e!535206)))

(declare-fun b!950575 () Bool)

(declare-fun res!637272 () Bool)

(assert (=> b!950575 (=> (not res!637272) (not e!535206))))

(declare-fun arrayCountValidKeys!0 (array!57536 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950575 (= res!637272 (= (arrayCountValidKeys!0 (_keys!10722 thiss!1141) #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))) (_size!2527 thiss!1141)))))

(declare-fun b!950576 () Bool)

(declare-fun res!637273 () Bool)

(assert (=> b!950576 (=> (not res!637273) (not e!535206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57536 (_ BitVec 32)) Bool)

(assert (=> b!950576 (= res!637273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10722 thiss!1141) (mask!27589 thiss!1141)))))

(declare-fun b!950577 () Bool)

(declare-datatypes ((List!19344 0))(
  ( (Nil!19341) (Cons!19340 (h!20500 (_ BitVec 64)) (t!27687 List!19344)) )
))
(declare-fun arrayNoDuplicates!0 (array!57536 (_ BitVec 32) List!19344) Bool)

(assert (=> b!950577 (= e!535206 (arrayNoDuplicates!0 (_keys!10722 thiss!1141) #b00000000000000000000000000000000 Nil!19341))))

(assert (= (and d!115201 res!637271) b!950575))

(assert (= (and b!950575 res!637272) b!950576))

(assert (= (and b!950576 res!637273) b!950577))

(declare-fun m!882967 () Bool)

(assert (=> d!115201 m!882967))

(declare-fun m!882969 () Bool)

(assert (=> b!950575 m!882969))

(declare-fun m!882971 () Bool)

(assert (=> b!950576 m!882971))

(declare-fun m!882973 () Bool)

(assert (=> b!950577 m!882973))

(assert (=> start!81234 d!115201))

(declare-fun b!950590 () Bool)

(declare-fun e!535215 () SeekEntryResult!9144)

(assert (=> b!950590 (= e!535215 Undefined!9144)))

(declare-fun b!950591 () Bool)

(declare-fun e!535214 () SeekEntryResult!9144)

(declare-fun lt!428087 () SeekEntryResult!9144)

(assert (=> b!950591 (= e!535214 (Found!9144 (index!38949 lt!428087)))))

(declare-fun b!950592 () Bool)

(declare-fun e!535213 () SeekEntryResult!9144)

(declare-fun lt!428086 () SeekEntryResult!9144)

(assert (=> b!950592 (= e!535213 (ite ((_ is MissingVacant!9144) lt!428086) (MissingZero!9144 (index!38950 lt!428086)) lt!428086))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57536 (_ BitVec 32)) SeekEntryResult!9144)

(assert (=> b!950592 (= lt!428086 (seekKeyOrZeroReturnVacant!0 (x!81780 lt!428087) (index!38949 lt!428087) (index!38949 lt!428087) key!756 (_keys!10722 thiss!1141) (mask!27589 thiss!1141)))))

(declare-fun b!950593 () Bool)

(assert (=> b!950593 (= e!535215 e!535214)))

(declare-fun lt!428088 () (_ BitVec 64))

(assert (=> b!950593 (= lt!428088 (select (arr!27667 (_keys!10722 thiss!1141)) (index!38949 lt!428087)))))

(declare-fun c!99266 () Bool)

(assert (=> b!950593 (= c!99266 (= lt!428088 key!756))))

(declare-fun b!950594 () Bool)

(declare-fun c!99267 () Bool)

(assert (=> b!950594 (= c!99267 (= lt!428088 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950594 (= e!535214 e!535213)))

(declare-fun b!950595 () Bool)

(assert (=> b!950595 (= e!535213 (MissingZero!9144 (index!38949 lt!428087)))))

(declare-fun d!115203 () Bool)

(declare-fun lt!428085 () SeekEntryResult!9144)

(assert (=> d!115203 (and (or ((_ is MissingVacant!9144) lt!428085) (not ((_ is Found!9144) lt!428085)) (and (bvsge (index!38948 lt!428085) #b00000000000000000000000000000000) (bvslt (index!38948 lt!428085) (size!28144 (_keys!10722 thiss!1141))))) (not ((_ is MissingVacant!9144) lt!428085)) (or (not ((_ is Found!9144) lt!428085)) (= (select (arr!27667 (_keys!10722 thiss!1141)) (index!38948 lt!428085)) key!756)))))

(assert (=> d!115203 (= lt!428085 e!535215)))

(declare-fun c!99268 () Bool)

(assert (=> d!115203 (= c!99268 (and ((_ is Intermediate!9144) lt!428087) (undefined!9956 lt!428087)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57536 (_ BitVec 32)) SeekEntryResult!9144)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115203 (= lt!428087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27589 thiss!1141)) key!756 (_keys!10722 thiss!1141) (mask!27589 thiss!1141)))))

(assert (=> d!115203 (validMask!0 (mask!27589 thiss!1141))))

(assert (=> d!115203 (= (seekEntry!0 key!756 (_keys!10722 thiss!1141) (mask!27589 thiss!1141)) lt!428085)))

(assert (= (and d!115203 c!99268) b!950590))

(assert (= (and d!115203 (not c!99268)) b!950593))

(assert (= (and b!950593 c!99266) b!950591))

(assert (= (and b!950593 (not c!99266)) b!950594))

(assert (= (and b!950594 c!99267) b!950595))

(assert (= (and b!950594 (not c!99267)) b!950592))

(declare-fun m!882975 () Bool)

(assert (=> b!950592 m!882975))

(declare-fun m!882977 () Bool)

(assert (=> b!950593 m!882977))

(declare-fun m!882979 () Bool)

(assert (=> d!115203 m!882979))

(declare-fun m!882981 () Bool)

(assert (=> d!115203 m!882981))

(assert (=> d!115203 m!882981))

(declare-fun m!882983 () Bool)

(assert (=> d!115203 m!882983))

(assert (=> d!115203 m!882921))

(assert (=> b!950518 d!115203))

(declare-fun d!115205 () Bool)

(declare-fun e!535221 () Bool)

(assert (=> d!115205 e!535221))

(declare-fun res!637276 () Bool)

(assert (=> d!115205 (=> res!637276 e!535221)))

(declare-fun lt!428099 () Bool)

(assert (=> d!115205 (= res!637276 (not lt!428099))))

(declare-fun lt!428100 () Bool)

(assert (=> d!115205 (= lt!428099 lt!428100)))

(declare-fun lt!428097 () Unit!31995)

(declare-fun e!535220 () Unit!31995)

(assert (=> d!115205 (= lt!428097 e!535220)))

(declare-fun c!99271 () Bool)

(assert (=> d!115205 (= c!99271 lt!428100)))

(declare-fun containsKey!465 (List!19343 (_ BitVec 64)) Bool)

(assert (=> d!115205 (= lt!428100 (containsKey!465 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))) key!756))))

(assert (=> d!115205 (= (contains!5232 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)) key!756) lt!428099)))

(declare-fun b!950602 () Bool)

(declare-fun lt!428098 () Unit!31995)

(assert (=> b!950602 (= e!535220 lt!428098)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!361 (List!19343 (_ BitVec 64)) Unit!31995)

(assert (=> b!950602 (= lt!428098 (lemmaContainsKeyImpliesGetValueByKeyDefined!361 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))) key!756))))

(declare-datatypes ((Option!504 0))(
  ( (Some!503 (v!12975 V!32641)) (None!502) )
))
(declare-fun isDefined!370 (Option!504) Bool)

(declare-fun getValueByKey!498 (List!19343 (_ BitVec 64)) Option!504)

(assert (=> b!950602 (isDefined!370 (getValueByKey!498 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))) key!756))))

(declare-fun b!950603 () Bool)

(declare-fun Unit!31997 () Unit!31995)

(assert (=> b!950603 (= e!535220 Unit!31997)))

(declare-fun b!950604 () Bool)

(assert (=> b!950604 (= e!535221 (isDefined!370 (getValueByKey!498 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))) key!756)))))

(assert (= (and d!115205 c!99271) b!950602))

(assert (= (and d!115205 (not c!99271)) b!950603))

(assert (= (and d!115205 (not res!637276)) b!950604))

(declare-fun m!882985 () Bool)

(assert (=> d!115205 m!882985))

(declare-fun m!882987 () Bool)

(assert (=> b!950602 m!882987))

(declare-fun m!882989 () Bool)

(assert (=> b!950602 m!882989))

(assert (=> b!950602 m!882989))

(declare-fun m!882991 () Bool)

(assert (=> b!950602 m!882991))

(assert (=> b!950604 m!882989))

(assert (=> b!950604 m!882989))

(assert (=> b!950604 m!882991))

(assert (=> b!950519 d!115205))

(declare-fun b!950647 () Bool)

(declare-fun e!535260 () ListLongMap!12251)

(declare-fun e!535251 () ListLongMap!12251)

(assert (=> b!950647 (= e!535260 e!535251)))

(declare-fun c!99284 () Bool)

(assert (=> b!950647 (= c!99284 (and (not (= (bvand (extraKeys!5517 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5517 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!115207 () Bool)

(declare-fun e!535249 () Bool)

(assert (=> d!115207 e!535249))

(declare-fun res!637302 () Bool)

(assert (=> d!115207 (=> (not res!637302) (not e!535249))))

(assert (=> d!115207 (= res!637302 (or (bvsge #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))))))))

(declare-fun lt!428152 () ListLongMap!12251)

(declare-fun lt!428158 () ListLongMap!12251)

(assert (=> d!115207 (= lt!428152 lt!428158)))

(declare-fun lt!428163 () Unit!31995)

(declare-fun e!535252 () Unit!31995)

(assert (=> d!115207 (= lt!428163 e!535252)))

(declare-fun c!99286 () Bool)

(declare-fun e!535258 () Bool)

(assert (=> d!115207 (= c!99286 e!535258)))

(declare-fun res!637298 () Bool)

(assert (=> d!115207 (=> (not res!637298) (not e!535258))))

(assert (=> d!115207 (= res!637298 (bvslt #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))))))

(assert (=> d!115207 (= lt!428158 e!535260)))

(declare-fun c!99285 () Bool)

(assert (=> d!115207 (= c!99285 (and (not (= (bvand (extraKeys!5517 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5517 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115207 (validMask!0 (mask!27589 thiss!1141))))

(assert (=> d!115207 (= (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)) lt!428152)))

(declare-fun b!950648 () Bool)

(declare-fun e!535255 () Bool)

(declare-fun e!535256 () Bool)

(assert (=> b!950648 (= e!535255 e!535256)))

(declare-fun res!637295 () Bool)

(declare-fun call!41410 () Bool)

(assert (=> b!950648 (= res!637295 call!41410)))

(assert (=> b!950648 (=> (not res!637295) (not e!535256))))

(declare-fun bm!41403 () Bool)

(declare-fun call!41412 () ListLongMap!12251)

(declare-fun call!41409 () ListLongMap!12251)

(assert (=> bm!41403 (= call!41412 call!41409)))

(declare-fun b!950649 () Bool)

(declare-fun e!535257 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!950649 (= e!535257 (validKeyInArray!0 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950650 () Bool)

(declare-fun res!637296 () Bool)

(assert (=> b!950650 (=> (not res!637296) (not e!535249))))

(assert (=> b!950650 (= res!637296 e!535255)))

(declare-fun c!99289 () Bool)

(assert (=> b!950650 (= c!99289 (not (= (bvand (extraKeys!5517 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!950651 () Bool)

(declare-fun e!535253 () ListLongMap!12251)

(assert (=> b!950651 (= e!535253 call!41412)))

(declare-fun bm!41404 () Bool)

(declare-fun call!41407 () ListLongMap!12251)

(declare-fun call!41408 () ListLongMap!12251)

(declare-fun +!2863 (ListLongMap!12251 tuple2!13554) ListLongMap!12251)

(assert (=> bm!41404 (= call!41408 (+!2863 (ite c!99285 call!41407 (ite c!99284 call!41409 call!41412)) (ite (or c!99285 c!99284) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5621 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141)))))))

(declare-fun bm!41405 () Bool)

(declare-fun call!41411 () Bool)

(assert (=> bm!41405 (= call!41411 (contains!5232 lt!428152 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41406 () Bool)

(declare-fun call!41406 () ListLongMap!12251)

(assert (=> bm!41406 (= call!41406 call!41408)))

(declare-fun b!950652 () Bool)

(declare-fun e!535254 () Bool)

(declare-fun e!535250 () Bool)

(assert (=> b!950652 (= e!535254 e!535250)))

(declare-fun res!637300 () Bool)

(assert (=> b!950652 (= res!637300 call!41411)))

(assert (=> b!950652 (=> (not res!637300) (not e!535250))))

(declare-fun b!950653 () Bool)

(declare-fun lt!428151 () Unit!31995)

(assert (=> b!950653 (= e!535252 lt!428151)))

(declare-fun lt!428149 () ListLongMap!12251)

(declare-fun getCurrentListMapNoExtraKeys!3318 (array!57536 array!57534 (_ BitVec 32) (_ BitVec 32) V!32641 V!32641 (_ BitVec 32) Int) ListLongMap!12251)

(assert (=> b!950653 (= lt!428149 (getCurrentListMapNoExtraKeys!3318 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)))))

(declare-fun lt!428160 () (_ BitVec 64))

(assert (=> b!950653 (= lt!428160 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428165 () (_ BitVec 64))

(assert (=> b!950653 (= lt!428165 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428147 () Unit!31995)

(declare-fun addStillContains!582 (ListLongMap!12251 (_ BitVec 64) V!32641 (_ BitVec 64)) Unit!31995)

(assert (=> b!950653 (= lt!428147 (addStillContains!582 lt!428149 lt!428160 (zeroValue!5621 thiss!1141) lt!428165))))

(assert (=> b!950653 (contains!5232 (+!2863 lt!428149 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141))) lt!428165)))

(declare-fun lt!428145 () Unit!31995)

(assert (=> b!950653 (= lt!428145 lt!428147)))

(declare-fun lt!428146 () ListLongMap!12251)

(assert (=> b!950653 (= lt!428146 (getCurrentListMapNoExtraKeys!3318 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)))))

(declare-fun lt!428161 () (_ BitVec 64))

(assert (=> b!950653 (= lt!428161 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428154 () (_ BitVec 64))

(assert (=> b!950653 (= lt!428154 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428150 () Unit!31995)

(declare-fun addApplyDifferent!462 (ListLongMap!12251 (_ BitVec 64) V!32641 (_ BitVec 64)) Unit!31995)

(assert (=> b!950653 (= lt!428150 (addApplyDifferent!462 lt!428146 lt!428161 (minValue!5621 thiss!1141) lt!428154))))

(declare-fun apply!879 (ListLongMap!12251 (_ BitVec 64)) V!32641)

(assert (=> b!950653 (= (apply!879 (+!2863 lt!428146 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141))) lt!428154) (apply!879 lt!428146 lt!428154))))

(declare-fun lt!428155 () Unit!31995)

(assert (=> b!950653 (= lt!428155 lt!428150)))

(declare-fun lt!428162 () ListLongMap!12251)

(assert (=> b!950653 (= lt!428162 (getCurrentListMapNoExtraKeys!3318 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)))))

(declare-fun lt!428159 () (_ BitVec 64))

(assert (=> b!950653 (= lt!428159 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428164 () (_ BitVec 64))

(assert (=> b!950653 (= lt!428164 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428157 () Unit!31995)

(assert (=> b!950653 (= lt!428157 (addApplyDifferent!462 lt!428162 lt!428159 (zeroValue!5621 thiss!1141) lt!428164))))

(assert (=> b!950653 (= (apply!879 (+!2863 lt!428162 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141))) lt!428164) (apply!879 lt!428162 lt!428164))))

(declare-fun lt!428153 () Unit!31995)

(assert (=> b!950653 (= lt!428153 lt!428157)))

(declare-fun lt!428166 () ListLongMap!12251)

(assert (=> b!950653 (= lt!428166 (getCurrentListMapNoExtraKeys!3318 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)))))

(declare-fun lt!428148 () (_ BitVec 64))

(assert (=> b!950653 (= lt!428148 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428156 () (_ BitVec 64))

(assert (=> b!950653 (= lt!428156 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950653 (= lt!428151 (addApplyDifferent!462 lt!428166 lt!428148 (minValue!5621 thiss!1141) lt!428156))))

(assert (=> b!950653 (= (apply!879 (+!2863 lt!428166 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141))) lt!428156) (apply!879 lt!428166 lt!428156))))

(declare-fun b!950654 () Bool)

(declare-fun res!637299 () Bool)

(assert (=> b!950654 (=> (not res!637299) (not e!535249))))

(declare-fun e!535248 () Bool)

(assert (=> b!950654 (= res!637299 e!535248)))

(declare-fun res!637303 () Bool)

(assert (=> b!950654 (=> res!637303 e!535248)))

(assert (=> b!950654 (= res!637303 (not e!535257))))

(declare-fun res!637297 () Bool)

(assert (=> b!950654 (=> (not res!637297) (not e!535257))))

(assert (=> b!950654 (= res!637297 (bvslt #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))))))

(declare-fun b!950655 () Bool)

(declare-fun Unit!31998 () Unit!31995)

(assert (=> b!950655 (= e!535252 Unit!31998)))

(declare-fun b!950656 () Bool)

(assert (=> b!950656 (= e!535254 (not call!41411))))

(declare-fun b!950657 () Bool)

(declare-fun c!99288 () Bool)

(assert (=> b!950657 (= c!99288 (and (not (= (bvand (extraKeys!5517 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5517 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!950657 (= e!535251 e!535253)))

(declare-fun b!950658 () Bool)

(declare-fun e!535259 () Bool)

(declare-fun get!14538 (ValueCell!9897 V!32641) V!32641)

(declare-fun dynLambda!1652 (Int (_ BitVec 64)) V!32641)

(assert (=> b!950658 (= e!535259 (= (apply!879 lt!428152 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)) (get!14538 (select (arr!27666 (_values!5808 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1652 (defaultEntry!5785 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!950658 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28143 (_values!5808 thiss!1141))))))

(assert (=> b!950658 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))))))

(declare-fun bm!41407 () Bool)

(assert (=> bm!41407 (= call!41409 call!41407)))

(declare-fun b!950659 () Bool)

(assert (=> b!950659 (= e!535256 (= (apply!879 lt!428152 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5621 thiss!1141)))))

(declare-fun b!950660 () Bool)

(assert (=> b!950660 (= e!535260 (+!2863 call!41408 (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141))))))

(declare-fun bm!41408 () Bool)

(assert (=> bm!41408 (= call!41407 (getCurrentListMapNoExtraKeys!3318 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)))))

(declare-fun b!950661 () Bool)

(assert (=> b!950661 (= e!535253 call!41406)))

(declare-fun b!950662 () Bool)

(assert (=> b!950662 (= e!535258 (validKeyInArray!0 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950663 () Bool)

(assert (=> b!950663 (= e!535248 e!535259)))

(declare-fun res!637301 () Bool)

(assert (=> b!950663 (=> (not res!637301) (not e!535259))))

(assert (=> b!950663 (= res!637301 (contains!5232 lt!428152 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))))))

(declare-fun b!950664 () Bool)

(assert (=> b!950664 (= e!535250 (= (apply!879 lt!428152 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5621 thiss!1141)))))

(declare-fun bm!41409 () Bool)

(assert (=> bm!41409 (= call!41410 (contains!5232 lt!428152 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950665 () Bool)

(assert (=> b!950665 (= e!535251 call!41406)))

(declare-fun b!950666 () Bool)

(assert (=> b!950666 (= e!535249 e!535254)))

(declare-fun c!99287 () Bool)

(assert (=> b!950666 (= c!99287 (not (= (bvand (extraKeys!5517 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950667 () Bool)

(assert (=> b!950667 (= e!535255 (not call!41410))))

(assert (= (and d!115207 c!99285) b!950660))

(assert (= (and d!115207 (not c!99285)) b!950647))

(assert (= (and b!950647 c!99284) b!950665))

(assert (= (and b!950647 (not c!99284)) b!950657))

(assert (= (and b!950657 c!99288) b!950661))

(assert (= (and b!950657 (not c!99288)) b!950651))

(assert (= (or b!950661 b!950651) bm!41403))

(assert (= (or b!950665 bm!41403) bm!41407))

(assert (= (or b!950665 b!950661) bm!41406))

(assert (= (or b!950660 bm!41407) bm!41408))

(assert (= (or b!950660 bm!41406) bm!41404))

(assert (= (and d!115207 res!637298) b!950662))

(assert (= (and d!115207 c!99286) b!950653))

(assert (= (and d!115207 (not c!99286)) b!950655))

(assert (= (and d!115207 res!637302) b!950654))

(assert (= (and b!950654 res!637297) b!950649))

(assert (= (and b!950654 (not res!637303)) b!950663))

(assert (= (and b!950663 res!637301) b!950658))

(assert (= (and b!950654 res!637299) b!950650))

(assert (= (and b!950650 c!99289) b!950648))

(assert (= (and b!950650 (not c!99289)) b!950667))

(assert (= (and b!950648 res!637295) b!950659))

(assert (= (or b!950648 b!950667) bm!41409))

(assert (= (and b!950650 res!637296) b!950666))

(assert (= (and b!950666 c!99287) b!950652))

(assert (= (and b!950666 (not c!99287)) b!950656))

(assert (= (and b!950652 res!637300) b!950664))

(assert (= (or b!950652 b!950656) bm!41405))

(declare-fun b_lambda!14371 () Bool)

(assert (=> (not b_lambda!14371) (not b!950658)))

(declare-fun t!27686 () Bool)

(declare-fun tb!6193 () Bool)

(assert (=> (and b!950516 (= (defaultEntry!5785 thiss!1141) (defaultEntry!5785 thiss!1141)) t!27686) tb!6193))

(declare-fun result!12301 () Bool)

(assert (=> tb!6193 (= result!12301 tp_is_empty!20757)))

(assert (=> b!950658 t!27686))

(declare-fun b_and!29711 () Bool)

(assert (= b_and!29707 (and (=> t!27686 result!12301) b_and!29711)))

(declare-fun m!882993 () Bool)

(assert (=> b!950660 m!882993))

(assert (=> b!950663 m!882959))

(assert (=> b!950663 m!882959))

(declare-fun m!882995 () Bool)

(assert (=> b!950663 m!882995))

(assert (=> d!115207 m!882921))

(declare-fun m!882997 () Bool)

(assert (=> bm!41408 m!882997))

(declare-fun m!882999 () Bool)

(assert (=> bm!41409 m!882999))

(declare-fun m!883001 () Bool)

(assert (=> b!950653 m!883001))

(declare-fun m!883003 () Bool)

(assert (=> b!950653 m!883003))

(declare-fun m!883005 () Bool)

(assert (=> b!950653 m!883005))

(declare-fun m!883007 () Bool)

(assert (=> b!950653 m!883007))

(declare-fun m!883009 () Bool)

(assert (=> b!950653 m!883009))

(assert (=> b!950653 m!882959))

(declare-fun m!883011 () Bool)

(assert (=> b!950653 m!883011))

(declare-fun m!883013 () Bool)

(assert (=> b!950653 m!883013))

(declare-fun m!883015 () Bool)

(assert (=> b!950653 m!883015))

(declare-fun m!883017 () Bool)

(assert (=> b!950653 m!883017))

(assert (=> b!950653 m!883007))

(declare-fun m!883019 () Bool)

(assert (=> b!950653 m!883019))

(declare-fun m!883021 () Bool)

(assert (=> b!950653 m!883021))

(declare-fun m!883023 () Bool)

(assert (=> b!950653 m!883023))

(assert (=> b!950653 m!883001))

(declare-fun m!883025 () Bool)

(assert (=> b!950653 m!883025))

(declare-fun m!883027 () Bool)

(assert (=> b!950653 m!883027))

(assert (=> b!950653 m!883021))

(declare-fun m!883029 () Bool)

(assert (=> b!950653 m!883029))

(assert (=> b!950653 m!882997))

(assert (=> b!950653 m!883015))

(assert (=> b!950662 m!882959))

(assert (=> b!950662 m!882959))

(declare-fun m!883031 () Bool)

(assert (=> b!950662 m!883031))

(assert (=> b!950649 m!882959))

(assert (=> b!950649 m!882959))

(assert (=> b!950649 m!883031))

(declare-fun m!883033 () Bool)

(assert (=> b!950659 m!883033))

(declare-fun m!883035 () Bool)

(assert (=> bm!41404 m!883035))

(assert (=> b!950658 m!882959))

(declare-fun m!883037 () Bool)

(assert (=> b!950658 m!883037))

(assert (=> b!950658 m!882959))

(declare-fun m!883039 () Bool)

(assert (=> b!950658 m!883039))

(declare-fun m!883041 () Bool)

(assert (=> b!950658 m!883041))

(declare-fun m!883043 () Bool)

(assert (=> b!950658 m!883043))

(assert (=> b!950658 m!883041))

(assert (=> b!950658 m!883039))

(declare-fun m!883045 () Bool)

(assert (=> bm!41405 m!883045))

(declare-fun m!883047 () Bool)

(assert (=> b!950664 m!883047))

(assert (=> b!950519 d!115207))

(declare-fun mapNonEmpty!33056 () Bool)

(declare-fun mapRes!33056 () Bool)

(declare-fun tp!63355 () Bool)

(declare-fun e!535265 () Bool)

(assert (=> mapNonEmpty!33056 (= mapRes!33056 (and tp!63355 e!535265))))

(declare-fun mapRest!33056 () (Array (_ BitVec 32) ValueCell!9897))

(declare-fun mapValue!33056 () ValueCell!9897)

(declare-fun mapKey!33056 () (_ BitVec 32))

(assert (=> mapNonEmpty!33056 (= mapRest!33050 (store mapRest!33056 mapKey!33056 mapValue!33056))))

(declare-fun b!950677 () Bool)

(declare-fun e!535266 () Bool)

(assert (=> b!950677 (= e!535266 tp_is_empty!20757)))

(declare-fun condMapEmpty!33056 () Bool)

(declare-fun mapDefault!33056 () ValueCell!9897)

(assert (=> mapNonEmpty!33050 (= condMapEmpty!33056 (= mapRest!33050 ((as const (Array (_ BitVec 32) ValueCell!9897)) mapDefault!33056)))))

(assert (=> mapNonEmpty!33050 (= tp!63345 (and e!535266 mapRes!33056))))

(declare-fun mapIsEmpty!33056 () Bool)

(assert (=> mapIsEmpty!33056 mapRes!33056))

(declare-fun b!950676 () Bool)

(assert (=> b!950676 (= e!535265 tp_is_empty!20757)))

(assert (= (and mapNonEmpty!33050 condMapEmpty!33056) mapIsEmpty!33056))

(assert (= (and mapNonEmpty!33050 (not condMapEmpty!33056)) mapNonEmpty!33056))

(assert (= (and mapNonEmpty!33056 ((_ is ValueCellFull!9897) mapValue!33056)) b!950676))

(assert (= (and mapNonEmpty!33050 ((_ is ValueCellFull!9897) mapDefault!33056)) b!950677))

(declare-fun m!883049 () Bool)

(assert (=> mapNonEmpty!33056 m!883049))

(declare-fun b_lambda!14373 () Bool)

(assert (= b_lambda!14371 (or (and b!950516 b_free!18249) b_lambda!14373)))

(check-sat (not b!950664) (not b!950575) (not d!115207) (not b!950577) (not b_lambda!14373) (not b!950659) (not bm!41408) (not bm!41405) (not b!950592) (not b_next!18249) (not b!950562) (not b!950658) (not bm!41409) (not bm!41404) (not b!950660) (not b!950602) (not b!950649) (not d!115203) (not b!950662) (not mapNonEmpty!33056) (not b!950663) (not d!115201) (not b!950576) (not d!115205) (not b!950653) b_and!29711 tp_is_empty!20757 (not b!950604) (not b!950567) (not d!115199) (not b!950556))
(check-sat b_and!29711 (not b_next!18249))
(get-model)

(declare-fun d!115209 () Bool)

(declare-fun isEmpty!712 (Option!504) Bool)

(assert (=> d!115209 (= (isDefined!370 (getValueByKey!498 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))) key!756)) (not (isEmpty!712 (getValueByKey!498 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))) key!756))))))

(declare-fun bs!26715 () Bool)

(assert (= bs!26715 d!115209))

(assert (=> bs!26715 m!882989))

(declare-fun m!883051 () Bool)

(assert (=> bs!26715 m!883051))

(assert (=> b!950604 d!115209))

(declare-fun d!115211 () Bool)

(declare-fun c!99294 () Bool)

(assert (=> d!115211 (= c!99294 (and ((_ is Cons!19339) (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)))) (= (_1!6788 (h!20499 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))))) key!756)))))

(declare-fun e!535271 () Option!504)

(assert (=> d!115211 (= (getValueByKey!498 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))) key!756) e!535271)))

(declare-fun b!950687 () Bool)

(declare-fun e!535272 () Option!504)

(assert (=> b!950687 (= e!535271 e!535272)))

(declare-fun c!99295 () Bool)

(assert (=> b!950687 (= c!99295 (and ((_ is Cons!19339) (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)))) (not (= (_1!6788 (h!20499 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))))) key!756))))))

(declare-fun b!950686 () Bool)

(assert (=> b!950686 (= e!535271 (Some!503 (_2!6788 (h!20499 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)))))))))

(declare-fun b!950689 () Bool)

(assert (=> b!950689 (= e!535272 None!502)))

(declare-fun b!950688 () Bool)

(assert (=> b!950688 (= e!535272 (getValueByKey!498 (t!27684 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)))) key!756))))

(assert (= (and d!115211 c!99294) b!950686))

(assert (= (and d!115211 (not c!99294)) b!950687))

(assert (= (and b!950687 c!99295) b!950688))

(assert (= (and b!950687 (not c!99295)) b!950689))

(declare-fun m!883053 () Bool)

(assert (=> b!950688 m!883053))

(assert (=> b!950604 d!115211))

(declare-fun d!115213 () Bool)

(declare-fun res!637304 () Bool)

(declare-fun e!535273 () Bool)

(assert (=> d!115213 (=> res!637304 e!535273)))

(assert (=> d!115213 (= res!637304 (= (select (arr!27667 (_keys!10722 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!115213 (= (arrayContainsKey!0 (_keys!10722 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!535273)))

(declare-fun b!950690 () Bool)

(declare-fun e!535274 () Bool)

(assert (=> b!950690 (= e!535273 e!535274)))

(declare-fun res!637305 () Bool)

(assert (=> b!950690 (=> (not res!637305) (not e!535274))))

(assert (=> b!950690 (= res!637305 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28144 (_keys!10722 thiss!1141))))))

(declare-fun b!950691 () Bool)

(assert (=> b!950691 (= e!535274 (arrayContainsKey!0 (_keys!10722 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!115213 (not res!637304)) b!950690))

(assert (= (and b!950690 res!637305) b!950691))

(declare-fun m!883055 () Bool)

(assert (=> d!115213 m!883055))

(declare-fun m!883057 () Bool)

(assert (=> b!950691 m!883057))

(assert (=> b!950562 d!115213))

(declare-fun d!115215 () Bool)

(declare-fun e!535277 () Bool)

(assert (=> d!115215 e!535277))

(declare-fun res!637311 () Bool)

(assert (=> d!115215 (=> (not res!637311) (not e!535277))))

(declare-fun lt!428175 () ListLongMap!12251)

(assert (=> d!115215 (= res!637311 (contains!5232 lt!428175 (_1!6788 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141)))))))

(declare-fun lt!428177 () List!19343)

(assert (=> d!115215 (= lt!428175 (ListLongMap!12252 lt!428177))))

(declare-fun lt!428176 () Unit!31995)

(declare-fun lt!428178 () Unit!31995)

(assert (=> d!115215 (= lt!428176 lt!428178)))

(assert (=> d!115215 (= (getValueByKey!498 lt!428177 (_1!6788 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141)))) (Some!503 (_2!6788 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!266 (List!19343 (_ BitVec 64) V!32641) Unit!31995)

(assert (=> d!115215 (= lt!428178 (lemmaContainsTupThenGetReturnValue!266 lt!428177 (_1!6788 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141))) (_2!6788 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141)))))))

(declare-fun insertStrictlySorted!323 (List!19343 (_ BitVec 64) V!32641) List!19343)

(assert (=> d!115215 (= lt!428177 (insertStrictlySorted!323 (toList!6141 lt!428162) (_1!6788 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141))) (_2!6788 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141)))))))

(assert (=> d!115215 (= (+!2863 lt!428162 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141))) lt!428175)))

(declare-fun b!950696 () Bool)

(declare-fun res!637310 () Bool)

(assert (=> b!950696 (=> (not res!637310) (not e!535277))))

(assert (=> b!950696 (= res!637310 (= (getValueByKey!498 (toList!6141 lt!428175) (_1!6788 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141)))) (Some!503 (_2!6788 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141))))))))

(declare-fun b!950697 () Bool)

(declare-fun contains!5233 (List!19343 tuple2!13554) Bool)

(assert (=> b!950697 (= e!535277 (contains!5233 (toList!6141 lt!428175) (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141))))))

(assert (= (and d!115215 res!637311) b!950696))

(assert (= (and b!950696 res!637310) b!950697))

(declare-fun m!883059 () Bool)

(assert (=> d!115215 m!883059))

(declare-fun m!883061 () Bool)

(assert (=> d!115215 m!883061))

(declare-fun m!883063 () Bool)

(assert (=> d!115215 m!883063))

(declare-fun m!883065 () Bool)

(assert (=> d!115215 m!883065))

(declare-fun m!883067 () Bool)

(assert (=> b!950696 m!883067))

(declare-fun m!883069 () Bool)

(assert (=> b!950697 m!883069))

(assert (=> b!950653 d!115215))

(declare-fun d!115217 () Bool)

(declare-fun get!14539 (Option!504) V!32641)

(assert (=> d!115217 (= (apply!879 lt!428166 lt!428156) (get!14539 (getValueByKey!498 (toList!6141 lt!428166) lt!428156)))))

(declare-fun bs!26716 () Bool)

(assert (= bs!26716 d!115217))

(declare-fun m!883071 () Bool)

(assert (=> bs!26716 m!883071))

(assert (=> bs!26716 m!883071))

(declare-fun m!883073 () Bool)

(assert (=> bs!26716 m!883073))

(assert (=> b!950653 d!115217))

(declare-fun d!115219 () Bool)

(assert (=> d!115219 (= (apply!879 (+!2863 lt!428166 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141))) lt!428156) (get!14539 (getValueByKey!498 (toList!6141 (+!2863 lt!428166 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141)))) lt!428156)))))

(declare-fun bs!26717 () Bool)

(assert (= bs!26717 d!115219))

(declare-fun m!883075 () Bool)

(assert (=> bs!26717 m!883075))

(assert (=> bs!26717 m!883075))

(declare-fun m!883077 () Bool)

(assert (=> bs!26717 m!883077))

(assert (=> b!950653 d!115219))

(declare-fun d!115221 () Bool)

(declare-fun e!535279 () Bool)

(assert (=> d!115221 e!535279))

(declare-fun res!637312 () Bool)

(assert (=> d!115221 (=> res!637312 e!535279)))

(declare-fun lt!428181 () Bool)

(assert (=> d!115221 (= res!637312 (not lt!428181))))

(declare-fun lt!428182 () Bool)

(assert (=> d!115221 (= lt!428181 lt!428182)))

(declare-fun lt!428179 () Unit!31995)

(declare-fun e!535278 () Unit!31995)

(assert (=> d!115221 (= lt!428179 e!535278)))

(declare-fun c!99296 () Bool)

(assert (=> d!115221 (= c!99296 lt!428182)))

(assert (=> d!115221 (= lt!428182 (containsKey!465 (toList!6141 (+!2863 lt!428149 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141)))) lt!428165))))

(assert (=> d!115221 (= (contains!5232 (+!2863 lt!428149 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141))) lt!428165) lt!428181)))

(declare-fun b!950698 () Bool)

(declare-fun lt!428180 () Unit!31995)

(assert (=> b!950698 (= e!535278 lt!428180)))

(assert (=> b!950698 (= lt!428180 (lemmaContainsKeyImpliesGetValueByKeyDefined!361 (toList!6141 (+!2863 lt!428149 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141)))) lt!428165))))

(assert (=> b!950698 (isDefined!370 (getValueByKey!498 (toList!6141 (+!2863 lt!428149 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141)))) lt!428165))))

(declare-fun b!950699 () Bool)

(declare-fun Unit!31999 () Unit!31995)

(assert (=> b!950699 (= e!535278 Unit!31999)))

(declare-fun b!950700 () Bool)

(assert (=> b!950700 (= e!535279 (isDefined!370 (getValueByKey!498 (toList!6141 (+!2863 lt!428149 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141)))) lt!428165)))))

(assert (= (and d!115221 c!99296) b!950698))

(assert (= (and d!115221 (not c!99296)) b!950699))

(assert (= (and d!115221 (not res!637312)) b!950700))

(declare-fun m!883079 () Bool)

(assert (=> d!115221 m!883079))

(declare-fun m!883081 () Bool)

(assert (=> b!950698 m!883081))

(declare-fun m!883083 () Bool)

(assert (=> b!950698 m!883083))

(assert (=> b!950698 m!883083))

(declare-fun m!883085 () Bool)

(assert (=> b!950698 m!883085))

(assert (=> b!950700 m!883083))

(assert (=> b!950700 m!883083))

(assert (=> b!950700 m!883085))

(assert (=> b!950653 d!115221))

(declare-fun d!115223 () Bool)

(assert (=> d!115223 (= (apply!879 (+!2863 lt!428146 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141))) lt!428154) (apply!879 lt!428146 lt!428154))))

(declare-fun lt!428185 () Unit!31995)

(declare-fun choose!1586 (ListLongMap!12251 (_ BitVec 64) V!32641 (_ BitVec 64)) Unit!31995)

(assert (=> d!115223 (= lt!428185 (choose!1586 lt!428146 lt!428161 (minValue!5621 thiss!1141) lt!428154))))

(declare-fun e!535282 () Bool)

(assert (=> d!115223 e!535282))

(declare-fun res!637315 () Bool)

(assert (=> d!115223 (=> (not res!637315) (not e!535282))))

(assert (=> d!115223 (= res!637315 (contains!5232 lt!428146 lt!428154))))

(assert (=> d!115223 (= (addApplyDifferent!462 lt!428146 lt!428161 (minValue!5621 thiss!1141) lt!428154) lt!428185)))

(declare-fun b!950704 () Bool)

(assert (=> b!950704 (= e!535282 (not (= lt!428154 lt!428161)))))

(assert (= (and d!115223 res!637315) b!950704))

(assert (=> d!115223 m!883007))

(assert (=> d!115223 m!883019))

(declare-fun m!883087 () Bool)

(assert (=> d!115223 m!883087))

(assert (=> d!115223 m!883011))

(declare-fun m!883089 () Bool)

(assert (=> d!115223 m!883089))

(assert (=> d!115223 m!883007))

(assert (=> b!950653 d!115223))

(declare-fun d!115225 () Bool)

(assert (=> d!115225 (= (apply!879 (+!2863 lt!428162 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141))) lt!428164) (apply!879 lt!428162 lt!428164))))

(declare-fun lt!428186 () Unit!31995)

(assert (=> d!115225 (= lt!428186 (choose!1586 lt!428162 lt!428159 (zeroValue!5621 thiss!1141) lt!428164))))

(declare-fun e!535283 () Bool)

(assert (=> d!115225 e!535283))

(declare-fun res!637316 () Bool)

(assert (=> d!115225 (=> (not res!637316) (not e!535283))))

(assert (=> d!115225 (= res!637316 (contains!5232 lt!428162 lt!428164))))

(assert (=> d!115225 (= (addApplyDifferent!462 lt!428162 lt!428159 (zeroValue!5621 thiss!1141) lt!428164) lt!428186)))

(declare-fun b!950705 () Bool)

(assert (=> b!950705 (= e!535283 (not (= lt!428164 lt!428159)))))

(assert (= (and d!115225 res!637316) b!950705))

(assert (=> d!115225 m!883001))

(assert (=> d!115225 m!883025))

(declare-fun m!883091 () Bool)

(assert (=> d!115225 m!883091))

(assert (=> d!115225 m!883005))

(declare-fun m!883093 () Bool)

(assert (=> d!115225 m!883093))

(assert (=> d!115225 m!883001))

(assert (=> b!950653 d!115225))

(declare-fun d!115227 () Bool)

(assert (=> d!115227 (contains!5232 (+!2863 lt!428149 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141))) lt!428165)))

(declare-fun lt!428189 () Unit!31995)

(declare-fun choose!1587 (ListLongMap!12251 (_ BitVec 64) V!32641 (_ BitVec 64)) Unit!31995)

(assert (=> d!115227 (= lt!428189 (choose!1587 lt!428149 lt!428160 (zeroValue!5621 thiss!1141) lt!428165))))

(assert (=> d!115227 (contains!5232 lt!428149 lt!428165)))

(assert (=> d!115227 (= (addStillContains!582 lt!428149 lt!428160 (zeroValue!5621 thiss!1141) lt!428165) lt!428189)))

(declare-fun bs!26718 () Bool)

(assert (= bs!26718 d!115227))

(assert (=> bs!26718 m!883021))

(assert (=> bs!26718 m!883021))

(assert (=> bs!26718 m!883023))

(declare-fun m!883095 () Bool)

(assert (=> bs!26718 m!883095))

(declare-fun m!883097 () Bool)

(assert (=> bs!26718 m!883097))

(assert (=> b!950653 d!115227))

(declare-fun bm!41412 () Bool)

(declare-fun call!41415 () ListLongMap!12251)

(assert (=> bm!41412 (= call!41415 (getCurrentListMapNoExtraKeys!3318 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5785 thiss!1141)))))

(declare-fun b!950731 () Bool)

(declare-fun e!535299 () Bool)

(assert (=> b!950731 (= e!535299 (validKeyInArray!0 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950731 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!950732 () Bool)

(assert (=> b!950732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))))))

(assert (=> b!950732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28143 (_values!5808 thiss!1141))))))

(declare-fun e!535304 () Bool)

(declare-fun lt!428207 () ListLongMap!12251)

(assert (=> b!950732 (= e!535304 (= (apply!879 lt!428207 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)) (get!14538 (select (arr!27666 (_values!5808 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1652 (defaultEntry!5785 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!950733 () Bool)

(declare-fun e!535298 () Bool)

(declare-fun e!535303 () Bool)

(assert (=> b!950733 (= e!535298 e!535303)))

(declare-fun c!99308 () Bool)

(assert (=> b!950733 (= c!99308 (bvslt #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))))))

(declare-fun b!950734 () Bool)

(assert (=> b!950734 (= e!535298 e!535304)))

(assert (=> b!950734 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))))))

(declare-fun res!637325 () Bool)

(assert (=> b!950734 (= res!637325 (contains!5232 lt!428207 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950734 (=> (not res!637325) (not e!535304))))

(declare-fun b!950735 () Bool)

(declare-fun res!637327 () Bool)

(declare-fun e!535301 () Bool)

(assert (=> b!950735 (=> (not res!637327) (not e!535301))))

(assert (=> b!950735 (= res!637327 (not (contains!5232 lt!428207 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!115229 () Bool)

(assert (=> d!115229 e!535301))

(declare-fun res!637328 () Bool)

(assert (=> d!115229 (=> (not res!637328) (not e!535301))))

(assert (=> d!115229 (= res!637328 (not (contains!5232 lt!428207 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!535302 () ListLongMap!12251)

(assert (=> d!115229 (= lt!428207 e!535302)))

(declare-fun c!99305 () Bool)

(assert (=> d!115229 (= c!99305 (bvsge #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))))))

(assert (=> d!115229 (validMask!0 (mask!27589 thiss!1141))))

(assert (=> d!115229 (= (getCurrentListMapNoExtraKeys!3318 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)) lt!428207)))

(declare-fun b!950736 () Bool)

(declare-fun lt!428205 () Unit!31995)

(declare-fun lt!428208 () Unit!31995)

(assert (=> b!950736 (= lt!428205 lt!428208)))

(declare-fun lt!428204 () V!32641)

(declare-fun lt!428206 () ListLongMap!12251)

(declare-fun lt!428210 () (_ BitVec 64))

(declare-fun lt!428209 () (_ BitVec 64))

(assert (=> b!950736 (not (contains!5232 (+!2863 lt!428206 (tuple2!13555 lt!428210 lt!428204)) lt!428209))))

(declare-fun addStillNotContains!227 (ListLongMap!12251 (_ BitVec 64) V!32641 (_ BitVec 64)) Unit!31995)

(assert (=> b!950736 (= lt!428208 (addStillNotContains!227 lt!428206 lt!428210 lt!428204 lt!428209))))

(assert (=> b!950736 (= lt!428209 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!950736 (= lt!428204 (get!14538 (select (arr!27666 (_values!5808 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1652 (defaultEntry!5785 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!950736 (= lt!428210 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950736 (= lt!428206 call!41415)))

(declare-fun e!535300 () ListLongMap!12251)

(assert (=> b!950736 (= e!535300 (+!2863 call!41415 (tuple2!13555 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000) (get!14538 (select (arr!27666 (_values!5808 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1652 (defaultEntry!5785 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!950737 () Bool)

(assert (=> b!950737 (= e!535302 e!535300)))

(declare-fun c!99307 () Bool)

(assert (=> b!950737 (= c!99307 (validKeyInArray!0 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950738 () Bool)

(assert (=> b!950738 (= e!535301 e!535298)))

(declare-fun c!99306 () Bool)

(assert (=> b!950738 (= c!99306 e!535299)))

(declare-fun res!637326 () Bool)

(assert (=> b!950738 (=> (not res!637326) (not e!535299))))

(assert (=> b!950738 (= res!637326 (bvslt #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))))))

(declare-fun b!950739 () Bool)

(assert (=> b!950739 (= e!535303 (= lt!428207 (getCurrentListMapNoExtraKeys!3318 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5785 thiss!1141))))))

(declare-fun b!950740 () Bool)

(declare-fun isEmpty!713 (ListLongMap!12251) Bool)

(assert (=> b!950740 (= e!535303 (isEmpty!713 lt!428207))))

(declare-fun b!950741 () Bool)

(assert (=> b!950741 (= e!535300 call!41415)))

(declare-fun b!950742 () Bool)

(assert (=> b!950742 (= e!535302 (ListLongMap!12252 Nil!19340))))

(assert (= (and d!115229 c!99305) b!950742))

(assert (= (and d!115229 (not c!99305)) b!950737))

(assert (= (and b!950737 c!99307) b!950736))

(assert (= (and b!950737 (not c!99307)) b!950741))

(assert (= (or b!950736 b!950741) bm!41412))

(assert (= (and d!115229 res!637328) b!950735))

(assert (= (and b!950735 res!637327) b!950738))

(assert (= (and b!950738 res!637326) b!950731))

(assert (= (and b!950738 c!99306) b!950734))

(assert (= (and b!950738 (not c!99306)) b!950733))

(assert (= (and b!950734 res!637325) b!950732))

(assert (= (and b!950733 c!99308) b!950739))

(assert (= (and b!950733 (not c!99308)) b!950740))

(declare-fun b_lambda!14375 () Bool)

(assert (=> (not b_lambda!14375) (not b!950732)))

(assert (=> b!950732 t!27686))

(declare-fun b_and!29713 () Bool)

(assert (= b_and!29711 (and (=> t!27686 result!12301) b_and!29713)))

(declare-fun b_lambda!14377 () Bool)

(assert (=> (not b_lambda!14377) (not b!950736)))

(assert (=> b!950736 t!27686))

(declare-fun b_and!29715 () Bool)

(assert (= b_and!29713 (and (=> t!27686 result!12301) b_and!29715)))

(assert (=> b!950737 m!882959))

(assert (=> b!950737 m!882959))

(assert (=> b!950737 m!883031))

(declare-fun m!883099 () Bool)

(assert (=> b!950735 m!883099))

(assert (=> b!950731 m!882959))

(assert (=> b!950731 m!882959))

(assert (=> b!950731 m!883031))

(declare-fun m!883101 () Bool)

(assert (=> d!115229 m!883101))

(assert (=> d!115229 m!882921))

(assert (=> b!950732 m!883039))

(assert (=> b!950732 m!882959))

(assert (=> b!950732 m!882959))

(declare-fun m!883103 () Bool)

(assert (=> b!950732 m!883103))

(assert (=> b!950732 m!883041))

(assert (=> b!950732 m!883039))

(assert (=> b!950732 m!883041))

(assert (=> b!950732 m!883043))

(declare-fun m!883105 () Bool)

(assert (=> b!950739 m!883105))

(assert (=> b!950734 m!882959))

(assert (=> b!950734 m!882959))

(declare-fun m!883107 () Bool)

(assert (=> b!950734 m!883107))

(assert (=> bm!41412 m!883105))

(declare-fun m!883109 () Bool)

(assert (=> b!950736 m!883109))

(assert (=> b!950736 m!883039))

(assert (=> b!950736 m!882959))

(assert (=> b!950736 m!883041))

(assert (=> b!950736 m!883039))

(assert (=> b!950736 m!883041))

(assert (=> b!950736 m!883043))

(declare-fun m!883111 () Bool)

(assert (=> b!950736 m!883111))

(declare-fun m!883113 () Bool)

(assert (=> b!950736 m!883113))

(assert (=> b!950736 m!883113))

(declare-fun m!883115 () Bool)

(assert (=> b!950736 m!883115))

(declare-fun m!883117 () Bool)

(assert (=> b!950740 m!883117))

(assert (=> b!950653 d!115229))

(declare-fun d!115231 () Bool)

(assert (=> d!115231 (= (apply!879 (+!2863 lt!428146 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141))) lt!428154) (get!14539 (getValueByKey!498 (toList!6141 (+!2863 lt!428146 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141)))) lt!428154)))))

(declare-fun bs!26719 () Bool)

(assert (= bs!26719 d!115231))

(declare-fun m!883119 () Bool)

(assert (=> bs!26719 m!883119))

(assert (=> bs!26719 m!883119))

(declare-fun m!883121 () Bool)

(assert (=> bs!26719 m!883121))

(assert (=> b!950653 d!115231))

(declare-fun d!115233 () Bool)

(declare-fun e!535305 () Bool)

(assert (=> d!115233 e!535305))

(declare-fun res!637330 () Bool)

(assert (=> d!115233 (=> (not res!637330) (not e!535305))))

(declare-fun lt!428211 () ListLongMap!12251)

(assert (=> d!115233 (= res!637330 (contains!5232 lt!428211 (_1!6788 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141)))))))

(declare-fun lt!428213 () List!19343)

(assert (=> d!115233 (= lt!428211 (ListLongMap!12252 lt!428213))))

(declare-fun lt!428212 () Unit!31995)

(declare-fun lt!428214 () Unit!31995)

(assert (=> d!115233 (= lt!428212 lt!428214)))

(assert (=> d!115233 (= (getValueByKey!498 lt!428213 (_1!6788 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141)))) (Some!503 (_2!6788 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141)))))))

(assert (=> d!115233 (= lt!428214 (lemmaContainsTupThenGetReturnValue!266 lt!428213 (_1!6788 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141))) (_2!6788 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141)))))))

(assert (=> d!115233 (= lt!428213 (insertStrictlySorted!323 (toList!6141 lt!428146) (_1!6788 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141))) (_2!6788 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141)))))))

(assert (=> d!115233 (= (+!2863 lt!428146 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141))) lt!428211)))

(declare-fun b!950743 () Bool)

(declare-fun res!637329 () Bool)

(assert (=> b!950743 (=> (not res!637329) (not e!535305))))

(assert (=> b!950743 (= res!637329 (= (getValueByKey!498 (toList!6141 lt!428211) (_1!6788 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141)))) (Some!503 (_2!6788 (tuple2!13555 lt!428161 (minValue!5621 thiss!1141))))))))

(declare-fun b!950744 () Bool)

(assert (=> b!950744 (= e!535305 (contains!5233 (toList!6141 lt!428211) (tuple2!13555 lt!428161 (minValue!5621 thiss!1141))))))

(assert (= (and d!115233 res!637330) b!950743))

(assert (= (and b!950743 res!637329) b!950744))

(declare-fun m!883123 () Bool)

(assert (=> d!115233 m!883123))

(declare-fun m!883125 () Bool)

(assert (=> d!115233 m!883125))

(declare-fun m!883127 () Bool)

(assert (=> d!115233 m!883127))

(declare-fun m!883129 () Bool)

(assert (=> d!115233 m!883129))

(declare-fun m!883131 () Bool)

(assert (=> b!950743 m!883131))

(declare-fun m!883133 () Bool)

(assert (=> b!950744 m!883133))

(assert (=> b!950653 d!115233))

(declare-fun d!115235 () Bool)

(declare-fun e!535306 () Bool)

(assert (=> d!115235 e!535306))

(declare-fun res!637332 () Bool)

(assert (=> d!115235 (=> (not res!637332) (not e!535306))))

(declare-fun lt!428215 () ListLongMap!12251)

(assert (=> d!115235 (= res!637332 (contains!5232 lt!428215 (_1!6788 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141)))))))

(declare-fun lt!428217 () List!19343)

(assert (=> d!115235 (= lt!428215 (ListLongMap!12252 lt!428217))))

(declare-fun lt!428216 () Unit!31995)

(declare-fun lt!428218 () Unit!31995)

(assert (=> d!115235 (= lt!428216 lt!428218)))

(assert (=> d!115235 (= (getValueByKey!498 lt!428217 (_1!6788 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141)))) (Some!503 (_2!6788 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141)))))))

(assert (=> d!115235 (= lt!428218 (lemmaContainsTupThenGetReturnValue!266 lt!428217 (_1!6788 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141))) (_2!6788 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141)))))))

(assert (=> d!115235 (= lt!428217 (insertStrictlySorted!323 (toList!6141 lt!428166) (_1!6788 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141))) (_2!6788 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141)))))))

(assert (=> d!115235 (= (+!2863 lt!428166 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141))) lt!428215)))

(declare-fun b!950745 () Bool)

(declare-fun res!637331 () Bool)

(assert (=> b!950745 (=> (not res!637331) (not e!535306))))

(assert (=> b!950745 (= res!637331 (= (getValueByKey!498 (toList!6141 lt!428215) (_1!6788 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141)))) (Some!503 (_2!6788 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141))))))))

(declare-fun b!950746 () Bool)

(assert (=> b!950746 (= e!535306 (contains!5233 (toList!6141 lt!428215) (tuple2!13555 lt!428148 (minValue!5621 thiss!1141))))))

(assert (= (and d!115235 res!637332) b!950745))

(assert (= (and b!950745 res!637331) b!950746))

(declare-fun m!883135 () Bool)

(assert (=> d!115235 m!883135))

(declare-fun m!883137 () Bool)

(assert (=> d!115235 m!883137))

(declare-fun m!883139 () Bool)

(assert (=> d!115235 m!883139))

(declare-fun m!883141 () Bool)

(assert (=> d!115235 m!883141))

(declare-fun m!883143 () Bool)

(assert (=> b!950745 m!883143))

(declare-fun m!883145 () Bool)

(assert (=> b!950746 m!883145))

(assert (=> b!950653 d!115235))

(declare-fun d!115237 () Bool)

(assert (=> d!115237 (= (apply!879 (+!2863 lt!428166 (tuple2!13555 lt!428148 (minValue!5621 thiss!1141))) lt!428156) (apply!879 lt!428166 lt!428156))))

(declare-fun lt!428219 () Unit!31995)

(assert (=> d!115237 (= lt!428219 (choose!1586 lt!428166 lt!428148 (minValue!5621 thiss!1141) lt!428156))))

(declare-fun e!535307 () Bool)

(assert (=> d!115237 e!535307))

(declare-fun res!637333 () Bool)

(assert (=> d!115237 (=> (not res!637333) (not e!535307))))

(assert (=> d!115237 (= res!637333 (contains!5232 lt!428166 lt!428156))))

(assert (=> d!115237 (= (addApplyDifferent!462 lt!428166 lt!428148 (minValue!5621 thiss!1141) lt!428156) lt!428219)))

(declare-fun b!950747 () Bool)

(assert (=> b!950747 (= e!535307 (not (= lt!428156 lt!428148)))))

(assert (= (and d!115237 res!637333) b!950747))

(assert (=> d!115237 m!883015))

(assert (=> d!115237 m!883017))

(declare-fun m!883147 () Bool)

(assert (=> d!115237 m!883147))

(assert (=> d!115237 m!883029))

(declare-fun m!883149 () Bool)

(assert (=> d!115237 m!883149))

(assert (=> d!115237 m!883015))

(assert (=> b!950653 d!115237))

(declare-fun d!115239 () Bool)

(assert (=> d!115239 (= (apply!879 lt!428162 lt!428164) (get!14539 (getValueByKey!498 (toList!6141 lt!428162) lt!428164)))))

(declare-fun bs!26720 () Bool)

(assert (= bs!26720 d!115239))

(declare-fun m!883151 () Bool)

(assert (=> bs!26720 m!883151))

(assert (=> bs!26720 m!883151))

(declare-fun m!883153 () Bool)

(assert (=> bs!26720 m!883153))

(assert (=> b!950653 d!115239))

(declare-fun d!115241 () Bool)

(assert (=> d!115241 (= (apply!879 lt!428146 lt!428154) (get!14539 (getValueByKey!498 (toList!6141 lt!428146) lt!428154)))))

(declare-fun bs!26721 () Bool)

(assert (= bs!26721 d!115241))

(declare-fun m!883155 () Bool)

(assert (=> bs!26721 m!883155))

(assert (=> bs!26721 m!883155))

(declare-fun m!883157 () Bool)

(assert (=> bs!26721 m!883157))

(assert (=> b!950653 d!115241))

(declare-fun d!115243 () Bool)

(assert (=> d!115243 (= (apply!879 (+!2863 lt!428162 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141))) lt!428164) (get!14539 (getValueByKey!498 (toList!6141 (+!2863 lt!428162 (tuple2!13555 lt!428159 (zeroValue!5621 thiss!1141)))) lt!428164)))))

(declare-fun bs!26722 () Bool)

(assert (= bs!26722 d!115243))

(declare-fun m!883159 () Bool)

(assert (=> bs!26722 m!883159))

(assert (=> bs!26722 m!883159))

(declare-fun m!883161 () Bool)

(assert (=> bs!26722 m!883161))

(assert (=> b!950653 d!115243))

(declare-fun d!115245 () Bool)

(declare-fun e!535308 () Bool)

(assert (=> d!115245 e!535308))

(declare-fun res!637335 () Bool)

(assert (=> d!115245 (=> (not res!637335) (not e!535308))))

(declare-fun lt!428220 () ListLongMap!12251)

(assert (=> d!115245 (= res!637335 (contains!5232 lt!428220 (_1!6788 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141)))))))

(declare-fun lt!428222 () List!19343)

(assert (=> d!115245 (= lt!428220 (ListLongMap!12252 lt!428222))))

(declare-fun lt!428221 () Unit!31995)

(declare-fun lt!428223 () Unit!31995)

(assert (=> d!115245 (= lt!428221 lt!428223)))

(assert (=> d!115245 (= (getValueByKey!498 lt!428222 (_1!6788 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141)))) (Some!503 (_2!6788 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141)))))))

(assert (=> d!115245 (= lt!428223 (lemmaContainsTupThenGetReturnValue!266 lt!428222 (_1!6788 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141))) (_2!6788 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141)))))))

(assert (=> d!115245 (= lt!428222 (insertStrictlySorted!323 (toList!6141 lt!428149) (_1!6788 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141))) (_2!6788 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141)))))))

(assert (=> d!115245 (= (+!2863 lt!428149 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141))) lt!428220)))

(declare-fun b!950748 () Bool)

(declare-fun res!637334 () Bool)

(assert (=> b!950748 (=> (not res!637334) (not e!535308))))

(assert (=> b!950748 (= res!637334 (= (getValueByKey!498 (toList!6141 lt!428220) (_1!6788 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141)))) (Some!503 (_2!6788 (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141))))))))

(declare-fun b!950749 () Bool)

(assert (=> b!950749 (= e!535308 (contains!5233 (toList!6141 lt!428220) (tuple2!13555 lt!428160 (zeroValue!5621 thiss!1141))))))

(assert (= (and d!115245 res!637335) b!950748))

(assert (= (and b!950748 res!637334) b!950749))

(declare-fun m!883163 () Bool)

(assert (=> d!115245 m!883163))

(declare-fun m!883165 () Bool)

(assert (=> d!115245 m!883165))

(declare-fun m!883167 () Bool)

(assert (=> d!115245 m!883167))

(declare-fun m!883169 () Bool)

(assert (=> d!115245 m!883169))

(declare-fun m!883171 () Bool)

(assert (=> b!950748 m!883171))

(declare-fun m!883173 () Bool)

(assert (=> b!950749 m!883173))

(assert (=> b!950653 d!115245))

(declare-fun b!950768 () Bool)

(declare-fun e!535323 () Bool)

(declare-fun lt!428228 () SeekEntryResult!9144)

(assert (=> b!950768 (= e!535323 (bvsge (x!81780 lt!428228) #b01111111111111111111111111111110))))

(declare-fun b!950769 () Bool)

(declare-fun e!535321 () SeekEntryResult!9144)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950769 (= e!535321 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27589 thiss!1141)) #b00000000000000000000000000000000 (mask!27589 thiss!1141)) key!756 (_keys!10722 thiss!1141) (mask!27589 thiss!1141)))))

(declare-fun b!950770 () Bool)

(declare-fun e!535322 () SeekEntryResult!9144)

(assert (=> b!950770 (= e!535322 e!535321)))

(declare-fun c!99317 () Bool)

(declare-fun lt!428229 () (_ BitVec 64))

(assert (=> b!950770 (= c!99317 (or (= lt!428229 key!756) (= (bvadd lt!428229 lt!428229) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!950771 () Bool)

(assert (=> b!950771 (and (bvsge (index!38949 lt!428228) #b00000000000000000000000000000000) (bvslt (index!38949 lt!428228) (size!28144 (_keys!10722 thiss!1141))))))

(declare-fun res!637344 () Bool)

(assert (=> b!950771 (= res!637344 (= (select (arr!27667 (_keys!10722 thiss!1141)) (index!38949 lt!428228)) key!756))))

(declare-fun e!535320 () Bool)

(assert (=> b!950771 (=> res!637344 e!535320)))

(declare-fun e!535319 () Bool)

(assert (=> b!950771 (= e!535319 e!535320)))

(declare-fun b!950772 () Bool)

(assert (=> b!950772 (and (bvsge (index!38949 lt!428228) #b00000000000000000000000000000000) (bvslt (index!38949 lt!428228) (size!28144 (_keys!10722 thiss!1141))))))

(assert (=> b!950772 (= e!535320 (= (select (arr!27667 (_keys!10722 thiss!1141)) (index!38949 lt!428228)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950773 () Bool)

(assert (=> b!950773 (= e!535322 (Intermediate!9144 true (toIndex!0 key!756 (mask!27589 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!950774 () Bool)

(assert (=> b!950774 (and (bvsge (index!38949 lt!428228) #b00000000000000000000000000000000) (bvslt (index!38949 lt!428228) (size!28144 (_keys!10722 thiss!1141))))))

(declare-fun res!637342 () Bool)

(assert (=> b!950774 (= res!637342 (= (select (arr!27667 (_keys!10722 thiss!1141)) (index!38949 lt!428228)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950774 (=> res!637342 e!535320)))

(declare-fun d!115247 () Bool)

(assert (=> d!115247 e!535323))

(declare-fun c!99315 () Bool)

(assert (=> d!115247 (= c!99315 (and ((_ is Intermediate!9144) lt!428228) (undefined!9956 lt!428228)))))

(assert (=> d!115247 (= lt!428228 e!535322)))

(declare-fun c!99316 () Bool)

(assert (=> d!115247 (= c!99316 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!115247 (= lt!428229 (select (arr!27667 (_keys!10722 thiss!1141)) (toIndex!0 key!756 (mask!27589 thiss!1141))))))

(assert (=> d!115247 (validMask!0 (mask!27589 thiss!1141))))

(assert (=> d!115247 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27589 thiss!1141)) key!756 (_keys!10722 thiss!1141) (mask!27589 thiss!1141)) lt!428228)))

(declare-fun b!950775 () Bool)

(assert (=> b!950775 (= e!535321 (Intermediate!9144 false (toIndex!0 key!756 (mask!27589 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!950776 () Bool)

(assert (=> b!950776 (= e!535323 e!535319)))

(declare-fun res!637343 () Bool)

(assert (=> b!950776 (= res!637343 (and ((_ is Intermediate!9144) lt!428228) (not (undefined!9956 lt!428228)) (bvslt (x!81780 lt!428228) #b01111111111111111111111111111110) (bvsge (x!81780 lt!428228) #b00000000000000000000000000000000) (bvsge (x!81780 lt!428228) #b00000000000000000000000000000000)))))

(assert (=> b!950776 (=> (not res!637343) (not e!535319))))

(assert (= (and d!115247 c!99316) b!950773))

(assert (= (and d!115247 (not c!99316)) b!950770))

(assert (= (and b!950770 c!99317) b!950775))

(assert (= (and b!950770 (not c!99317)) b!950769))

(assert (= (and d!115247 c!99315) b!950768))

(assert (= (and d!115247 (not c!99315)) b!950776))

(assert (= (and b!950776 res!637343) b!950771))

(assert (= (and b!950771 (not res!637344)) b!950774))

(assert (= (and b!950774 (not res!637342)) b!950772))

(declare-fun m!883175 () Bool)

(assert (=> b!950774 m!883175))

(assert (=> b!950771 m!883175))

(assert (=> b!950772 m!883175))

(assert (=> b!950769 m!882981))

(declare-fun m!883177 () Bool)

(assert (=> b!950769 m!883177))

(assert (=> b!950769 m!883177))

(declare-fun m!883179 () Bool)

(assert (=> b!950769 m!883179))

(assert (=> d!115247 m!882981))

(declare-fun m!883181 () Bool)

(assert (=> d!115247 m!883181))

(assert (=> d!115247 m!882921))

(assert (=> d!115203 d!115247))

(declare-fun d!115249 () Bool)

(declare-fun lt!428235 () (_ BitVec 32))

(declare-fun lt!428234 () (_ BitVec 32))

(assert (=> d!115249 (= lt!428235 (bvmul (bvxor lt!428234 (bvlshr lt!428234 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!115249 (= lt!428234 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!115249 (and (bvsge (mask!27589 thiss!1141) #b00000000000000000000000000000000) (let ((res!637345 (let ((h!20501 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81798 (bvmul (bvxor h!20501 (bvlshr h!20501 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81798 (bvlshr x!81798 #b00000000000000000000000000001101)) (mask!27589 thiss!1141)))))) (and (bvslt res!637345 (bvadd (mask!27589 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!637345 #b00000000000000000000000000000000))))))

(assert (=> d!115249 (= (toIndex!0 key!756 (mask!27589 thiss!1141)) (bvand (bvxor lt!428235 (bvlshr lt!428235 #b00000000000000000000000000001101)) (mask!27589 thiss!1141)))))

(assert (=> d!115203 d!115249))

(assert (=> d!115203 d!115193))

(declare-fun d!115251 () Bool)

(declare-fun e!535326 () Bool)

(assert (=> d!115251 e!535326))

(declare-fun c!99320 () Bool)

(assert (=> d!115251 (= c!99320 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!115251 true))

(declare-fun _$15!104 () Unit!31995)

(assert (=> d!115251 (= (choose!1585 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) key!756 (defaultEntry!5785 thiss!1141)) _$15!104)))

(declare-fun b!950781 () Bool)

(assert (=> b!950781 (= e!535326 (arrayContainsKey!0 (_keys!10722 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!950782 () Bool)

(assert (=> b!950782 (= e!535326 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5517 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5517 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115251 c!99320) b!950781))

(assert (= (and d!115251 (not c!99320)) b!950782))

(assert (=> b!950781 m!882925))

(assert (=> d!115199 d!115251))

(assert (=> d!115199 d!115193))

(declare-fun d!115253 () Bool)

(declare-fun e!535328 () Bool)

(assert (=> d!115253 e!535328))

(declare-fun res!637346 () Bool)

(assert (=> d!115253 (=> res!637346 e!535328)))

(declare-fun lt!428238 () Bool)

(assert (=> d!115253 (= res!637346 (not lt!428238))))

(declare-fun lt!428239 () Bool)

(assert (=> d!115253 (= lt!428238 lt!428239)))

(declare-fun lt!428236 () Unit!31995)

(declare-fun e!535327 () Unit!31995)

(assert (=> d!115253 (= lt!428236 e!535327)))

(declare-fun c!99321 () Bool)

(assert (=> d!115253 (= c!99321 lt!428239)))

(assert (=> d!115253 (= lt!428239 (containsKey!465 (toList!6141 lt!428152) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115253 (= (contains!5232 lt!428152 #b0000000000000000000000000000000000000000000000000000000000000000) lt!428238)))

(declare-fun b!950783 () Bool)

(declare-fun lt!428237 () Unit!31995)

(assert (=> b!950783 (= e!535327 lt!428237)))

(assert (=> b!950783 (= lt!428237 (lemmaContainsKeyImpliesGetValueByKeyDefined!361 (toList!6141 lt!428152) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950783 (isDefined!370 (getValueByKey!498 (toList!6141 lt!428152) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950784 () Bool)

(declare-fun Unit!32000 () Unit!31995)

(assert (=> b!950784 (= e!535327 Unit!32000)))

(declare-fun b!950785 () Bool)

(assert (=> b!950785 (= e!535328 (isDefined!370 (getValueByKey!498 (toList!6141 lt!428152) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115253 c!99321) b!950783))

(assert (= (and d!115253 (not c!99321)) b!950784))

(assert (= (and d!115253 (not res!637346)) b!950785))

(declare-fun m!883183 () Bool)

(assert (=> d!115253 m!883183))

(declare-fun m!883185 () Bool)

(assert (=> b!950783 m!883185))

(declare-fun m!883187 () Bool)

(assert (=> b!950783 m!883187))

(assert (=> b!950783 m!883187))

(declare-fun m!883189 () Bool)

(assert (=> b!950783 m!883189))

(assert (=> b!950785 m!883187))

(assert (=> b!950785 m!883187))

(assert (=> b!950785 m!883189))

(assert (=> bm!41409 d!115253))

(declare-fun d!115255 () Bool)

(assert (=> d!115255 (= (validKeyInArray!0 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!950649 d!115255))

(declare-fun d!115257 () Bool)

(declare-fun e!535329 () Bool)

(assert (=> d!115257 e!535329))

(declare-fun res!637348 () Bool)

(assert (=> d!115257 (=> (not res!637348) (not e!535329))))

(declare-fun lt!428240 () ListLongMap!12251)

(assert (=> d!115257 (= res!637348 (contains!5232 lt!428240 (_1!6788 (ite (or c!99285 c!99284) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5621 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141))))))))

(declare-fun lt!428242 () List!19343)

(assert (=> d!115257 (= lt!428240 (ListLongMap!12252 lt!428242))))

(declare-fun lt!428241 () Unit!31995)

(declare-fun lt!428243 () Unit!31995)

(assert (=> d!115257 (= lt!428241 lt!428243)))

(assert (=> d!115257 (= (getValueByKey!498 lt!428242 (_1!6788 (ite (or c!99285 c!99284) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5621 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141))))) (Some!503 (_2!6788 (ite (or c!99285 c!99284) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5621 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141))))))))

(assert (=> d!115257 (= lt!428243 (lemmaContainsTupThenGetReturnValue!266 lt!428242 (_1!6788 (ite (or c!99285 c!99284) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5621 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141)))) (_2!6788 (ite (or c!99285 c!99284) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5621 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141))))))))

(assert (=> d!115257 (= lt!428242 (insertStrictlySorted!323 (toList!6141 (ite c!99285 call!41407 (ite c!99284 call!41409 call!41412))) (_1!6788 (ite (or c!99285 c!99284) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5621 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141)))) (_2!6788 (ite (or c!99285 c!99284) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5621 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141))))))))

(assert (=> d!115257 (= (+!2863 (ite c!99285 call!41407 (ite c!99284 call!41409 call!41412)) (ite (or c!99285 c!99284) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5621 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141)))) lt!428240)))

(declare-fun b!950786 () Bool)

(declare-fun res!637347 () Bool)

(assert (=> b!950786 (=> (not res!637347) (not e!535329))))

(assert (=> b!950786 (= res!637347 (= (getValueByKey!498 (toList!6141 lt!428240) (_1!6788 (ite (or c!99285 c!99284) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5621 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141))))) (Some!503 (_2!6788 (ite (or c!99285 c!99284) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5621 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141)))))))))

(declare-fun b!950787 () Bool)

(assert (=> b!950787 (= e!535329 (contains!5233 (toList!6141 lt!428240) (ite (or c!99285 c!99284) (tuple2!13555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5621 thiss!1141)) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141)))))))

(assert (= (and d!115257 res!637348) b!950786))

(assert (= (and b!950786 res!637347) b!950787))

(declare-fun m!883191 () Bool)

(assert (=> d!115257 m!883191))

(declare-fun m!883193 () Bool)

(assert (=> d!115257 m!883193))

(declare-fun m!883195 () Bool)

(assert (=> d!115257 m!883195))

(declare-fun m!883197 () Bool)

(assert (=> d!115257 m!883197))

(declare-fun m!883199 () Bool)

(assert (=> b!950786 m!883199))

(declare-fun m!883201 () Bool)

(assert (=> b!950787 m!883201))

(assert (=> bm!41404 d!115257))

(declare-fun d!115259 () Bool)

(assert (=> d!115259 (isDefined!370 (getValueByKey!498 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))) key!756))))

(declare-fun lt!428246 () Unit!31995)

(declare-fun choose!1588 (List!19343 (_ BitVec 64)) Unit!31995)

(assert (=> d!115259 (= lt!428246 (choose!1588 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))) key!756))))

(declare-fun e!535332 () Bool)

(assert (=> d!115259 e!535332))

(declare-fun res!637351 () Bool)

(assert (=> d!115259 (=> (not res!637351) (not e!535332))))

(declare-fun isStrictlySorted!512 (List!19343) Bool)

(assert (=> d!115259 (= res!637351 (isStrictlySorted!512 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)))))))

(assert (=> d!115259 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!361 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))) key!756) lt!428246)))

(declare-fun b!950790 () Bool)

(assert (=> b!950790 (= e!535332 (containsKey!465 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))) key!756))))

(assert (= (and d!115259 res!637351) b!950790))

(assert (=> d!115259 m!882989))

(assert (=> d!115259 m!882989))

(assert (=> d!115259 m!882991))

(declare-fun m!883203 () Bool)

(assert (=> d!115259 m!883203))

(declare-fun m!883205 () Bool)

(assert (=> d!115259 m!883205))

(assert (=> b!950790 m!882985))

(assert (=> b!950602 d!115259))

(assert (=> b!950602 d!115209))

(assert (=> b!950602 d!115211))

(declare-fun d!115261 () Bool)

(declare-fun e!535334 () Bool)

(assert (=> d!115261 e!535334))

(declare-fun res!637352 () Bool)

(assert (=> d!115261 (=> res!637352 e!535334)))

(declare-fun lt!428249 () Bool)

(assert (=> d!115261 (= res!637352 (not lt!428249))))

(declare-fun lt!428250 () Bool)

(assert (=> d!115261 (= lt!428249 lt!428250)))

(declare-fun lt!428247 () Unit!31995)

(declare-fun e!535333 () Unit!31995)

(assert (=> d!115261 (= lt!428247 e!535333)))

(declare-fun c!99322 () Bool)

(assert (=> d!115261 (= c!99322 lt!428250)))

(assert (=> d!115261 (= lt!428250 (containsKey!465 (toList!6141 lt!428152) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115261 (= (contains!5232 lt!428152 #b1000000000000000000000000000000000000000000000000000000000000000) lt!428249)))

(declare-fun b!950791 () Bool)

(declare-fun lt!428248 () Unit!31995)

(assert (=> b!950791 (= e!535333 lt!428248)))

(assert (=> b!950791 (= lt!428248 (lemmaContainsKeyImpliesGetValueByKeyDefined!361 (toList!6141 lt!428152) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950791 (isDefined!370 (getValueByKey!498 (toList!6141 lt!428152) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950792 () Bool)

(declare-fun Unit!32001 () Unit!31995)

(assert (=> b!950792 (= e!535333 Unit!32001)))

(declare-fun b!950793 () Bool)

(assert (=> b!950793 (= e!535334 (isDefined!370 (getValueByKey!498 (toList!6141 lt!428152) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115261 c!99322) b!950791))

(assert (= (and d!115261 (not c!99322)) b!950792))

(assert (= (and d!115261 (not res!637352)) b!950793))

(declare-fun m!883207 () Bool)

(assert (=> d!115261 m!883207))

(declare-fun m!883209 () Bool)

(assert (=> b!950791 m!883209))

(declare-fun m!883211 () Bool)

(assert (=> b!950791 m!883211))

(assert (=> b!950791 m!883211))

(declare-fun m!883213 () Bool)

(assert (=> b!950791 m!883213))

(assert (=> b!950793 m!883211))

(assert (=> b!950793 m!883211))

(assert (=> b!950793 m!883213))

(assert (=> bm!41405 d!115261))

(assert (=> bm!41408 d!115229))

(declare-fun e!535341 () SeekEntryResult!9144)

(declare-fun b!950806 () Bool)

(assert (=> b!950806 (= e!535341 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81780 lt!428087) #b00000000000000000000000000000001) (nextIndex!0 (index!38949 lt!428087) (x!81780 lt!428087) (mask!27589 thiss!1141)) (index!38949 lt!428087) key!756 (_keys!10722 thiss!1141) (mask!27589 thiss!1141)))))

(declare-fun b!950807 () Bool)

(assert (=> b!950807 (= e!535341 (MissingVacant!9144 (index!38949 lt!428087)))))

(declare-fun b!950808 () Bool)

(declare-fun c!99329 () Bool)

(declare-fun lt!428255 () (_ BitVec 64))

(assert (=> b!950808 (= c!99329 (= lt!428255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!535343 () SeekEntryResult!9144)

(assert (=> b!950808 (= e!535343 e!535341)))

(declare-fun d!115263 () Bool)

(declare-fun lt!428256 () SeekEntryResult!9144)

(assert (=> d!115263 (and (or ((_ is Undefined!9144) lt!428256) (not ((_ is Found!9144) lt!428256)) (and (bvsge (index!38948 lt!428256) #b00000000000000000000000000000000) (bvslt (index!38948 lt!428256) (size!28144 (_keys!10722 thiss!1141))))) (or ((_ is Undefined!9144) lt!428256) ((_ is Found!9144) lt!428256) (not ((_ is MissingVacant!9144) lt!428256)) (not (= (index!38950 lt!428256) (index!38949 lt!428087))) (and (bvsge (index!38950 lt!428256) #b00000000000000000000000000000000) (bvslt (index!38950 lt!428256) (size!28144 (_keys!10722 thiss!1141))))) (or ((_ is Undefined!9144) lt!428256) (ite ((_ is Found!9144) lt!428256) (= (select (arr!27667 (_keys!10722 thiss!1141)) (index!38948 lt!428256)) key!756) (and ((_ is MissingVacant!9144) lt!428256) (= (index!38950 lt!428256) (index!38949 lt!428087)) (= (select (arr!27667 (_keys!10722 thiss!1141)) (index!38950 lt!428256)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!535342 () SeekEntryResult!9144)

(assert (=> d!115263 (= lt!428256 e!535342)))

(declare-fun c!99330 () Bool)

(assert (=> d!115263 (= c!99330 (bvsge (x!81780 lt!428087) #b01111111111111111111111111111110))))

(assert (=> d!115263 (= lt!428255 (select (arr!27667 (_keys!10722 thiss!1141)) (index!38949 lt!428087)))))

(assert (=> d!115263 (validMask!0 (mask!27589 thiss!1141))))

(assert (=> d!115263 (= (seekKeyOrZeroReturnVacant!0 (x!81780 lt!428087) (index!38949 lt!428087) (index!38949 lt!428087) key!756 (_keys!10722 thiss!1141) (mask!27589 thiss!1141)) lt!428256)))

(declare-fun b!950809 () Bool)

(assert (=> b!950809 (= e!535342 Undefined!9144)))

(declare-fun b!950810 () Bool)

(assert (=> b!950810 (= e!535343 (Found!9144 (index!38949 lt!428087)))))

(declare-fun b!950811 () Bool)

(assert (=> b!950811 (= e!535342 e!535343)))

(declare-fun c!99331 () Bool)

(assert (=> b!950811 (= c!99331 (= lt!428255 key!756))))

(assert (= (and d!115263 c!99330) b!950809))

(assert (= (and d!115263 (not c!99330)) b!950811))

(assert (= (and b!950811 c!99331) b!950810))

(assert (= (and b!950811 (not c!99331)) b!950808))

(assert (= (and b!950808 c!99329) b!950807))

(assert (= (and b!950808 (not c!99329)) b!950806))

(declare-fun m!883215 () Bool)

(assert (=> b!950806 m!883215))

(assert (=> b!950806 m!883215))

(declare-fun m!883217 () Bool)

(assert (=> b!950806 m!883217))

(declare-fun m!883219 () Bool)

(assert (=> d!115263 m!883219))

(declare-fun m!883221 () Bool)

(assert (=> d!115263 m!883221))

(assert (=> d!115263 m!882977))

(assert (=> d!115263 m!882921))

(assert (=> b!950592 d!115263))

(declare-fun b!950823 () Bool)

(declare-fun e!535346 () Bool)

(assert (=> b!950823 (= e!535346 (and (bvsge (extraKeys!5517 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5517 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2527 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!950821 () Bool)

(declare-fun res!637362 () Bool)

(assert (=> b!950821 (=> (not res!637362) (not e!535346))))

(declare-fun size!28147 (LongMapFixedSize!4944) (_ BitVec 32))

(assert (=> b!950821 (= res!637362 (bvsge (size!28147 thiss!1141) (_size!2527 thiss!1141)))))

(declare-fun b!950822 () Bool)

(declare-fun res!637363 () Bool)

(assert (=> b!950822 (=> (not res!637363) (not e!535346))))

(assert (=> b!950822 (= res!637363 (= (size!28147 thiss!1141) (bvadd (_size!2527 thiss!1141) (bvsdiv (bvadd (extraKeys!5517 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!115265 () Bool)

(declare-fun res!637364 () Bool)

(assert (=> d!115265 (=> (not res!637364) (not e!535346))))

(assert (=> d!115265 (= res!637364 (validMask!0 (mask!27589 thiss!1141)))))

(assert (=> d!115265 (= (simpleValid!375 thiss!1141) e!535346)))

(declare-fun b!950820 () Bool)

(declare-fun res!637361 () Bool)

(assert (=> b!950820 (=> (not res!637361) (not e!535346))))

(assert (=> b!950820 (= res!637361 (and (= (size!28143 (_values!5808 thiss!1141)) (bvadd (mask!27589 thiss!1141) #b00000000000000000000000000000001)) (= (size!28144 (_keys!10722 thiss!1141)) (size!28143 (_values!5808 thiss!1141))) (bvsge (_size!2527 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2527 thiss!1141) (bvadd (mask!27589 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!115265 res!637364) b!950820))

(assert (= (and b!950820 res!637361) b!950821))

(assert (= (and b!950821 res!637362) b!950822))

(assert (= (and b!950822 res!637363) b!950823))

(declare-fun m!883223 () Bool)

(assert (=> b!950821 m!883223))

(assert (=> b!950822 m!883223))

(assert (=> d!115265 m!882921))

(assert (=> d!115201 d!115265))

(declare-fun d!115267 () Bool)

(declare-fun lt!428257 () (_ BitVec 32))

(assert (=> d!115267 (and (or (bvslt lt!428257 #b00000000000000000000000000000000) (bvsge lt!428257 (size!28144 (_keys!10722 thiss!1141))) (and (bvsge lt!428257 #b00000000000000000000000000000000) (bvslt lt!428257 (size!28144 (_keys!10722 thiss!1141))))) (bvsge lt!428257 #b00000000000000000000000000000000) (bvslt lt!428257 (size!28144 (_keys!10722 thiss!1141))) (= (select (arr!27667 (_keys!10722 thiss!1141)) lt!428257) key!756))))

(declare-fun e!535347 () (_ BitVec 32))

(assert (=> d!115267 (= lt!428257 e!535347)))

(declare-fun c!99332 () Bool)

(assert (=> d!115267 (= c!99332 (= (select (arr!27667 (_keys!10722 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!115267 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28144 (_keys!10722 thiss!1141))) (bvslt (size!28144 (_keys!10722 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115267 (= (arrayScanForKey!0 (_keys!10722 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!428257)))

(declare-fun b!950824 () Bool)

(assert (=> b!950824 (= e!535347 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!950825 () Bool)

(assert (=> b!950825 (= e!535347 (arrayScanForKey!0 (_keys!10722 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!115267 c!99332) b!950824))

(assert (= (and d!115267 (not c!99332)) b!950825))

(declare-fun m!883225 () Bool)

(assert (=> d!115267 m!883225))

(assert (=> d!115267 m!883055))

(declare-fun m!883227 () Bool)

(assert (=> b!950825 m!883227))

(assert (=> b!950556 d!115267))

(assert (=> b!950662 d!115255))

(declare-fun b!950834 () Bool)

(declare-fun e!535352 () (_ BitVec 32))

(declare-fun call!41418 () (_ BitVec 32))

(assert (=> b!950834 (= e!535352 (bvadd #b00000000000000000000000000000001 call!41418))))

(declare-fun b!950835 () Bool)

(assert (=> b!950835 (= e!535352 call!41418)))

(declare-fun b!950836 () Bool)

(declare-fun e!535353 () (_ BitVec 32))

(assert (=> b!950836 (= e!535353 #b00000000000000000000000000000000)))

(declare-fun b!950837 () Bool)

(assert (=> b!950837 (= e!535353 e!535352)))

(declare-fun c!99338 () Bool)

(assert (=> b!950837 (= c!99338 (validKeyInArray!0 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115269 () Bool)

(declare-fun lt!428260 () (_ BitVec 32))

(assert (=> d!115269 (and (bvsge lt!428260 #b00000000000000000000000000000000) (bvsle lt!428260 (bvsub (size!28144 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115269 (= lt!428260 e!535353)))

(declare-fun c!99337 () Bool)

(assert (=> d!115269 (= c!99337 (bvsge #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))))))

(assert (=> d!115269 (and (bvsle #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28144 (_keys!10722 thiss!1141)) (size!28144 (_keys!10722 thiss!1141))))))

(assert (=> d!115269 (= (arrayCountValidKeys!0 (_keys!10722 thiss!1141) #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))) lt!428260)))

(declare-fun bm!41415 () Bool)

(assert (=> bm!41415 (= call!41418 (arrayCountValidKeys!0 (_keys!10722 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28144 (_keys!10722 thiss!1141))))))

(assert (= (and d!115269 c!99337) b!950836))

(assert (= (and d!115269 (not c!99337)) b!950837))

(assert (= (and b!950837 c!99338) b!950834))

(assert (= (and b!950837 (not c!99338)) b!950835))

(assert (= (or b!950834 b!950835) bm!41415))

(assert (=> b!950837 m!882959))

(assert (=> b!950837 m!882959))

(assert (=> b!950837 m!883031))

(declare-fun m!883229 () Bool)

(assert (=> bm!41415 m!883229))

(assert (=> b!950575 d!115269))

(declare-fun d!115271 () Bool)

(declare-fun e!535355 () Bool)

(assert (=> d!115271 e!535355))

(declare-fun res!637365 () Bool)

(assert (=> d!115271 (=> res!637365 e!535355)))

(declare-fun lt!428263 () Bool)

(assert (=> d!115271 (= res!637365 (not lt!428263))))

(declare-fun lt!428264 () Bool)

(assert (=> d!115271 (= lt!428263 lt!428264)))

(declare-fun lt!428261 () Unit!31995)

(declare-fun e!535354 () Unit!31995)

(assert (=> d!115271 (= lt!428261 e!535354)))

(declare-fun c!99339 () Bool)

(assert (=> d!115271 (= c!99339 lt!428264)))

(assert (=> d!115271 (= lt!428264 (containsKey!465 (toList!6141 lt!428152) (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115271 (= (contains!5232 lt!428152 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)) lt!428263)))

(declare-fun b!950838 () Bool)

(declare-fun lt!428262 () Unit!31995)

(assert (=> b!950838 (= e!535354 lt!428262)))

(assert (=> b!950838 (= lt!428262 (lemmaContainsKeyImpliesGetValueByKeyDefined!361 (toList!6141 lt!428152) (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950838 (isDefined!370 (getValueByKey!498 (toList!6141 lt!428152) (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950839 () Bool)

(declare-fun Unit!32002 () Unit!31995)

(assert (=> b!950839 (= e!535354 Unit!32002)))

(declare-fun b!950840 () Bool)

(assert (=> b!950840 (= e!535355 (isDefined!370 (getValueByKey!498 (toList!6141 lt!428152) (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!115271 c!99339) b!950838))

(assert (= (and d!115271 (not c!99339)) b!950839))

(assert (= (and d!115271 (not res!637365)) b!950840))

(assert (=> d!115271 m!882959))

(declare-fun m!883231 () Bool)

(assert (=> d!115271 m!883231))

(assert (=> b!950838 m!882959))

(declare-fun m!883233 () Bool)

(assert (=> b!950838 m!883233))

(assert (=> b!950838 m!882959))

(declare-fun m!883235 () Bool)

(assert (=> b!950838 m!883235))

(assert (=> b!950838 m!883235))

(declare-fun m!883237 () Bool)

(assert (=> b!950838 m!883237))

(assert (=> b!950840 m!882959))

(assert (=> b!950840 m!883235))

(assert (=> b!950840 m!883235))

(assert (=> b!950840 m!883237))

(assert (=> b!950663 d!115271))

(declare-fun b!950849 () Bool)

(declare-fun e!535362 () Bool)

(declare-fun call!41421 () Bool)

(assert (=> b!950849 (= e!535362 call!41421)))

(declare-fun d!115273 () Bool)

(declare-fun res!637371 () Bool)

(declare-fun e!535363 () Bool)

(assert (=> d!115273 (=> res!637371 e!535363)))

(assert (=> d!115273 (= res!637371 (bvsge #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))))))

(assert (=> d!115273 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10722 thiss!1141) (mask!27589 thiss!1141)) e!535363)))

(declare-fun b!950850 () Bool)

(declare-fun e!535364 () Bool)

(assert (=> b!950850 (= e!535364 call!41421)))

(declare-fun b!950851 () Bool)

(assert (=> b!950851 (= e!535363 e!535364)))

(declare-fun c!99342 () Bool)

(assert (=> b!950851 (= c!99342 (validKeyInArray!0 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41418 () Bool)

(assert (=> bm!41418 (= call!41421 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10722 thiss!1141) (mask!27589 thiss!1141)))))

(declare-fun b!950852 () Bool)

(assert (=> b!950852 (= e!535364 e!535362)))

(declare-fun lt!428273 () (_ BitVec 64))

(assert (=> b!950852 (= lt!428273 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428271 () Unit!31995)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57536 (_ BitVec 64) (_ BitVec 32)) Unit!31995)

(assert (=> b!950852 (= lt!428271 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10722 thiss!1141) lt!428273 #b00000000000000000000000000000000))))

(assert (=> b!950852 (arrayContainsKey!0 (_keys!10722 thiss!1141) lt!428273 #b00000000000000000000000000000000)))

(declare-fun lt!428272 () Unit!31995)

(assert (=> b!950852 (= lt!428272 lt!428271)))

(declare-fun res!637370 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57536 (_ BitVec 32)) SeekEntryResult!9144)

(assert (=> b!950852 (= res!637370 (= (seekEntryOrOpen!0 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000) (_keys!10722 thiss!1141) (mask!27589 thiss!1141)) (Found!9144 #b00000000000000000000000000000000)))))

(assert (=> b!950852 (=> (not res!637370) (not e!535362))))

(assert (= (and d!115273 (not res!637371)) b!950851))

(assert (= (and b!950851 c!99342) b!950852))

(assert (= (and b!950851 (not c!99342)) b!950850))

(assert (= (and b!950852 res!637370) b!950849))

(assert (= (or b!950849 b!950850) bm!41418))

(assert (=> b!950851 m!882959))

(assert (=> b!950851 m!882959))

(assert (=> b!950851 m!883031))

(declare-fun m!883239 () Bool)

(assert (=> bm!41418 m!883239))

(assert (=> b!950852 m!882959))

(declare-fun m!883241 () Bool)

(assert (=> b!950852 m!883241))

(declare-fun m!883243 () Bool)

(assert (=> b!950852 m!883243))

(assert (=> b!950852 m!882959))

(declare-fun m!883245 () Bool)

(assert (=> b!950852 m!883245))

(assert (=> b!950576 d!115273))

(declare-fun d!115275 () Bool)

(assert (=> d!115275 (= (apply!879 lt!428152 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14539 (getValueByKey!498 (toList!6141 lt!428152) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26723 () Bool)

(assert (= bs!26723 d!115275))

(assert (=> bs!26723 m!883211))

(assert (=> bs!26723 m!883211))

(declare-fun m!883247 () Bool)

(assert (=> bs!26723 m!883247))

(assert (=> b!950664 d!115275))

(declare-fun b!950863 () Bool)

(declare-fun e!535376 () Bool)

(declare-fun call!41424 () Bool)

(assert (=> b!950863 (= e!535376 call!41424)))

(declare-fun bm!41421 () Bool)

(declare-fun c!99345 () Bool)

(assert (=> bm!41421 (= call!41424 (arrayNoDuplicates!0 (_keys!10722 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99345 (Cons!19340 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000) Nil!19341) Nil!19341)))))

(declare-fun d!115277 () Bool)

(declare-fun res!637379 () Bool)

(declare-fun e!535373 () Bool)

(assert (=> d!115277 (=> res!637379 e!535373)))

(assert (=> d!115277 (= res!637379 (bvsge #b00000000000000000000000000000000 (size!28144 (_keys!10722 thiss!1141))))))

(assert (=> d!115277 (= (arrayNoDuplicates!0 (_keys!10722 thiss!1141) #b00000000000000000000000000000000 Nil!19341) e!535373)))

(declare-fun b!950864 () Bool)

(declare-fun e!535375 () Bool)

(assert (=> b!950864 (= e!535375 e!535376)))

(assert (=> b!950864 (= c!99345 (validKeyInArray!0 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950865 () Bool)

(assert (=> b!950865 (= e!535376 call!41424)))

(declare-fun b!950866 () Bool)

(declare-fun e!535374 () Bool)

(declare-fun contains!5234 (List!19344 (_ BitVec 64)) Bool)

(assert (=> b!950866 (= e!535374 (contains!5234 Nil!19341 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950867 () Bool)

(assert (=> b!950867 (= e!535373 e!535375)))

(declare-fun res!637378 () Bool)

(assert (=> b!950867 (=> (not res!637378) (not e!535375))))

(assert (=> b!950867 (= res!637378 (not e!535374))))

(declare-fun res!637380 () Bool)

(assert (=> b!950867 (=> (not res!637380) (not e!535374))))

(assert (=> b!950867 (= res!637380 (validKeyInArray!0 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115277 (not res!637379)) b!950867))

(assert (= (and b!950867 res!637380) b!950866))

(assert (= (and b!950867 res!637378) b!950864))

(assert (= (and b!950864 c!99345) b!950863))

(assert (= (and b!950864 (not c!99345)) b!950865))

(assert (= (or b!950863 b!950865) bm!41421))

(assert (=> bm!41421 m!882959))

(declare-fun m!883249 () Bool)

(assert (=> bm!41421 m!883249))

(assert (=> b!950864 m!882959))

(assert (=> b!950864 m!882959))

(assert (=> b!950864 m!883031))

(assert (=> b!950866 m!882959))

(assert (=> b!950866 m!882959))

(declare-fun m!883251 () Bool)

(assert (=> b!950866 m!883251))

(assert (=> b!950867 m!882959))

(assert (=> b!950867 m!882959))

(assert (=> b!950867 m!883031))

(assert (=> b!950577 d!115277))

(declare-fun d!115279 () Bool)

(declare-fun res!637385 () Bool)

(declare-fun e!535381 () Bool)

(assert (=> d!115279 (=> res!637385 e!535381)))

(assert (=> d!115279 (= res!637385 (and ((_ is Cons!19339) (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)))) (= (_1!6788 (h!20499 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))))) key!756)))))

(assert (=> d!115279 (= (containsKey!465 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))) key!756) e!535381)))

(declare-fun b!950872 () Bool)

(declare-fun e!535382 () Bool)

(assert (=> b!950872 (= e!535381 e!535382)))

(declare-fun res!637386 () Bool)

(assert (=> b!950872 (=> (not res!637386) (not e!535382))))

(assert (=> b!950872 (= res!637386 (and (or (not ((_ is Cons!19339) (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))))) (bvsle (_1!6788 (h!20499 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))))) key!756)) ((_ is Cons!19339) (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)))) (bvslt (_1!6788 (h!20499 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141))))) key!756)))))

(declare-fun b!950873 () Bool)

(assert (=> b!950873 (= e!535382 (containsKey!465 (t!27684 (toList!6141 (getCurrentListMap!3374 (_keys!10722 thiss!1141) (_values!5808 thiss!1141) (mask!27589 thiss!1141) (extraKeys!5517 thiss!1141) (zeroValue!5621 thiss!1141) (minValue!5621 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5785 thiss!1141)))) key!756))))

(assert (= (and d!115279 (not res!637385)) b!950872))

(assert (= (and b!950872 res!637386) b!950873))

(declare-fun m!883253 () Bool)

(assert (=> b!950873 m!883253))

(assert (=> d!115205 d!115279))

(assert (=> b!950567 d!115197))

(declare-fun d!115281 () Bool)

(assert (=> d!115281 (= (apply!879 lt!428152 (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000)) (get!14539 (getValueByKey!498 (toList!6141 lt!428152) (select (arr!27667 (_keys!10722 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26724 () Bool)

(assert (= bs!26724 d!115281))

(assert (=> bs!26724 m!882959))

(assert (=> bs!26724 m!883235))

(assert (=> bs!26724 m!883235))

(declare-fun m!883255 () Bool)

(assert (=> bs!26724 m!883255))

(assert (=> b!950658 d!115281))

(declare-fun d!115283 () Bool)

(declare-fun c!99348 () Bool)

(assert (=> d!115283 (= c!99348 ((_ is ValueCellFull!9897) (select (arr!27666 (_values!5808 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!535385 () V!32641)

(assert (=> d!115283 (= (get!14538 (select (arr!27666 (_values!5808 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1652 (defaultEntry!5785 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!535385)))

(declare-fun b!950878 () Bool)

(declare-fun get!14540 (ValueCell!9897 V!32641) V!32641)

(assert (=> b!950878 (= e!535385 (get!14540 (select (arr!27666 (_values!5808 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1652 (defaultEntry!5785 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!950879 () Bool)

(declare-fun get!14541 (ValueCell!9897 V!32641) V!32641)

(assert (=> b!950879 (= e!535385 (get!14541 (select (arr!27666 (_values!5808 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1652 (defaultEntry!5785 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115283 c!99348) b!950878))

(assert (= (and d!115283 (not c!99348)) b!950879))

(assert (=> b!950878 m!883039))

(assert (=> b!950878 m!883041))

(declare-fun m!883257 () Bool)

(assert (=> b!950878 m!883257))

(assert (=> b!950879 m!883039))

(assert (=> b!950879 m!883041))

(declare-fun m!883259 () Bool)

(assert (=> b!950879 m!883259))

(assert (=> b!950658 d!115283))

(declare-fun d!115285 () Bool)

(assert (=> d!115285 (= (apply!879 lt!428152 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14539 (getValueByKey!498 (toList!6141 lt!428152) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26725 () Bool)

(assert (= bs!26725 d!115285))

(assert (=> bs!26725 m!883187))

(assert (=> bs!26725 m!883187))

(declare-fun m!883261 () Bool)

(assert (=> bs!26725 m!883261))

(assert (=> b!950659 d!115285))

(declare-fun d!115287 () Bool)

(declare-fun e!535386 () Bool)

(assert (=> d!115287 e!535386))

(declare-fun res!637388 () Bool)

(assert (=> d!115287 (=> (not res!637388) (not e!535386))))

(declare-fun lt!428274 () ListLongMap!12251)

(assert (=> d!115287 (= res!637388 (contains!5232 lt!428274 (_1!6788 (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141)))))))

(declare-fun lt!428276 () List!19343)

(assert (=> d!115287 (= lt!428274 (ListLongMap!12252 lt!428276))))

(declare-fun lt!428275 () Unit!31995)

(declare-fun lt!428277 () Unit!31995)

(assert (=> d!115287 (= lt!428275 lt!428277)))

(assert (=> d!115287 (= (getValueByKey!498 lt!428276 (_1!6788 (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141)))) (Some!503 (_2!6788 (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141)))))))

(assert (=> d!115287 (= lt!428277 (lemmaContainsTupThenGetReturnValue!266 lt!428276 (_1!6788 (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141))) (_2!6788 (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141)))))))

(assert (=> d!115287 (= lt!428276 (insertStrictlySorted!323 (toList!6141 call!41408) (_1!6788 (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141))) (_2!6788 (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141)))))))

(assert (=> d!115287 (= (+!2863 call!41408 (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141))) lt!428274)))

(declare-fun b!950880 () Bool)

(declare-fun res!637387 () Bool)

(assert (=> b!950880 (=> (not res!637387) (not e!535386))))

(assert (=> b!950880 (= res!637387 (= (getValueByKey!498 (toList!6141 lt!428274) (_1!6788 (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141)))) (Some!503 (_2!6788 (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141))))))))

(declare-fun b!950881 () Bool)

(assert (=> b!950881 (= e!535386 (contains!5233 (toList!6141 lt!428274) (tuple2!13555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5621 thiss!1141))))))

(assert (= (and d!115287 res!637388) b!950880))

(assert (= (and b!950880 res!637387) b!950881))

(declare-fun m!883263 () Bool)

(assert (=> d!115287 m!883263))

(declare-fun m!883265 () Bool)

(assert (=> d!115287 m!883265))

(declare-fun m!883267 () Bool)

(assert (=> d!115287 m!883267))

(declare-fun m!883269 () Bool)

(assert (=> d!115287 m!883269))

(declare-fun m!883271 () Bool)

(assert (=> b!950880 m!883271))

(declare-fun m!883273 () Bool)

(assert (=> b!950881 m!883273))

(assert (=> b!950660 d!115287))

(assert (=> d!115207 d!115193))

(declare-fun mapNonEmpty!33057 () Bool)

(declare-fun mapRes!33057 () Bool)

(declare-fun tp!63356 () Bool)

(declare-fun e!535387 () Bool)

(assert (=> mapNonEmpty!33057 (= mapRes!33057 (and tp!63356 e!535387))))

(declare-fun mapValue!33057 () ValueCell!9897)

(declare-fun mapKey!33057 () (_ BitVec 32))

(declare-fun mapRest!33057 () (Array (_ BitVec 32) ValueCell!9897))

(assert (=> mapNonEmpty!33057 (= mapRest!33056 (store mapRest!33057 mapKey!33057 mapValue!33057))))

(declare-fun b!950883 () Bool)

(declare-fun e!535388 () Bool)

(assert (=> b!950883 (= e!535388 tp_is_empty!20757)))

(declare-fun condMapEmpty!33057 () Bool)

(declare-fun mapDefault!33057 () ValueCell!9897)

(assert (=> mapNonEmpty!33056 (= condMapEmpty!33057 (= mapRest!33056 ((as const (Array (_ BitVec 32) ValueCell!9897)) mapDefault!33057)))))

(assert (=> mapNonEmpty!33056 (= tp!63355 (and e!535388 mapRes!33057))))

(declare-fun mapIsEmpty!33057 () Bool)

(assert (=> mapIsEmpty!33057 mapRes!33057))

(declare-fun b!950882 () Bool)

(assert (=> b!950882 (= e!535387 tp_is_empty!20757)))

(assert (= (and mapNonEmpty!33056 condMapEmpty!33057) mapIsEmpty!33057))

(assert (= (and mapNonEmpty!33056 (not condMapEmpty!33057)) mapNonEmpty!33057))

(assert (= (and mapNonEmpty!33057 ((_ is ValueCellFull!9897) mapValue!33057)) b!950882))

(assert (= (and mapNonEmpty!33056 ((_ is ValueCellFull!9897) mapDefault!33057)) b!950883))

(declare-fun m!883275 () Bool)

(assert (=> mapNonEmpty!33057 m!883275))

(declare-fun b_lambda!14379 () Bool)

(assert (= b_lambda!14375 (or (and b!950516 b_free!18249) b_lambda!14379)))

(declare-fun b_lambda!14381 () Bool)

(assert (= b_lambda!14377 (or (and b!950516 b_free!18249) b_lambda!14381)))

(check-sat (not d!115271) (not d!115275) (not b!950698) (not b!950748) (not b!950786) (not b!950696) (not b!950746) (not d!115217) (not b!950735) (not b!950822) (not d!115243) (not d!115265) (not b!950781) (not b!950790) (not d!115225) (not b!950787) (not d!115287) (not b!950806) (not b!950731) (not bm!41415) (not b!950697) (not b!950838) (not d!115257) (not b!950881) (not b!950840) (not b_lambda!14373) (not d!115239) (not d!115247) (not b!950866) (not d!115285) (not b!950734) (not d!115245) (not b!950852) (not b!950783) (not b!950740) (not b!950785) (not b!950688) (not d!115253) (not b!950743) (not bm!41418) (not d!115263) (not b!950793) (not bm!41412) (not b!950825) (not d!115241) (not b!950737) (not b_lambda!14379) (not b!950791) (not d!115221) (not b!950745) (not d!115223) (not d!115227) (not b!950864) (not bm!41421) (not d!115231) (not b!950769) (not b_next!18249) (not d!115237) (not b!950691) (not b!950821) (not b!950739) (not d!115215) (not d!115233) (not mapNonEmpty!33057) (not d!115261) tp_is_empty!20757 (not d!115219) (not b!950837) (not b!950880) (not b!950744) (not d!115281) (not b_lambda!14381) (not b!950873) (not b!950879) (not b!950851) b_and!29715 (not b!950732) (not b!950749) (not d!115259) (not b!950736) (not d!115209) (not b!950878) (not d!115235) (not b!950700) (not d!115229) (not b!950867))
(check-sat b_and!29715 (not b_next!18249))
