; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80586 () Bool)

(assert start!80586)

(declare-fun b!945963 () Bool)

(declare-fun b_free!18123 () Bool)

(declare-fun b_next!18123 () Bool)

(assert (=> b!945963 (= b_free!18123 (not b_next!18123))))

(declare-fun tp!62900 () Bool)

(declare-fun b_and!29545 () Bool)

(assert (=> b!945963 (= tp!62900 b_and!29545)))

(declare-fun b!945958 () Bool)

(declare-fun res!635169 () Bool)

(declare-fun e!532165 () Bool)

(assert (=> b!945958 (=> (not res!635169) (not e!532165))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!945958 (= res!635169 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945959 () Bool)

(declare-fun e!532160 () Bool)

(declare-datatypes ((V!32473 0))(
  ( (V!32474 (val!10366 Int)) )
))
(declare-datatypes ((ValueCell!9834 0))(
  ( (ValueCellFull!9834 (v!12900 V!32473)) (EmptyCell!9834) )
))
(declare-datatypes ((array!57242 0))(
  ( (array!57243 (arr!27540 (Array (_ BitVec 32) ValueCell!9834)) (size!28009 (_ BitVec 32))) )
))
(declare-datatypes ((array!57244 0))(
  ( (array!57245 (arr!27541 (Array (_ BitVec 32) (_ BitVec 64))) (size!28010 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4818 0))(
  ( (LongMapFixedSize!4819 (defaultEntry!5706 Int) (mask!27391 (_ BitVec 32)) (extraKeys!5438 (_ BitVec 32)) (zeroValue!5542 V!32473) (minValue!5542 V!32473) (_size!2464 (_ BitVec 32)) (_keys!10593 array!57244) (_values!5729 array!57242) (_vacant!2464 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4818)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!945959 (= e!532160 (not (validMask!0 (mask!27391 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945959 (arrayContainsKey!0 (_keys!10593 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!9095 0))(
  ( (MissingZero!9095 (index!38751 (_ BitVec 32))) (Found!9095 (index!38752 (_ BitVec 32))) (Intermediate!9095 (undefined!9907 Bool) (index!38753 (_ BitVec 32)) (x!81315 (_ BitVec 32))) (Undefined!9095) (MissingVacant!9095 (index!38754 (_ BitVec 32))) )
))
(declare-fun lt!426150 () SeekEntryResult!9095)

(declare-datatypes ((Unit!31892 0))(
  ( (Unit!31893) )
))
(declare-fun lt!426149 () Unit!31892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57244 (_ BitVec 64) (_ BitVec 32)) Unit!31892)

(assert (=> b!945959 (= lt!426149 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10593 thiss!1141) key!756 (index!38752 lt!426150)))))

(declare-fun mapNonEmpty!32793 () Bool)

(declare-fun mapRes!32793 () Bool)

(declare-fun tp!62899 () Bool)

(declare-fun e!532164 () Bool)

(assert (=> mapNonEmpty!32793 (= mapRes!32793 (and tp!62899 e!532164))))

(declare-fun mapKey!32793 () (_ BitVec 32))

(declare-fun mapValue!32793 () ValueCell!9834)

(declare-fun mapRest!32793 () (Array (_ BitVec 32) ValueCell!9834))

(assert (=> mapNonEmpty!32793 (= (arr!27540 (_values!5729 thiss!1141)) (store mapRest!32793 mapKey!32793 mapValue!32793))))

(declare-fun b!945960 () Bool)

(declare-fun e!532161 () Bool)

(declare-fun e!532162 () Bool)

(assert (=> b!945960 (= e!532161 (and e!532162 mapRes!32793))))

(declare-fun condMapEmpty!32793 () Bool)

(declare-fun mapDefault!32793 () ValueCell!9834)

(assert (=> b!945960 (= condMapEmpty!32793 (= (arr!27540 (_values!5729 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9834)) mapDefault!32793)))))

(declare-fun b!945961 () Bool)

(declare-fun tp_is_empty!20631 () Bool)

(assert (=> b!945961 (= e!532162 tp_is_empty!20631)))

(declare-fun res!635170 () Bool)

(assert (=> start!80586 (=> (not res!635170) (not e!532165))))

(declare-fun valid!1840 (LongMapFixedSize!4818) Bool)

(assert (=> start!80586 (= res!635170 (valid!1840 thiss!1141))))

(assert (=> start!80586 e!532165))

(declare-fun e!532163 () Bool)

(assert (=> start!80586 e!532163))

(assert (=> start!80586 true))

(declare-fun b!945962 () Bool)

(assert (=> b!945962 (= e!532164 tp_is_empty!20631)))

(declare-fun array_inv!21390 (array!57244) Bool)

(declare-fun array_inv!21391 (array!57242) Bool)

(assert (=> b!945963 (= e!532163 (and tp!62900 tp_is_empty!20631 (array_inv!21390 (_keys!10593 thiss!1141)) (array_inv!21391 (_values!5729 thiss!1141)) e!532161))))

(declare-fun b!945964 () Bool)

(assert (=> b!945964 (= e!532165 e!532160)))

(declare-fun res!635168 () Bool)

(assert (=> b!945964 (=> (not res!635168) (not e!532160))))

(get-info :version)

(assert (=> b!945964 (= res!635168 ((_ is Found!9095) lt!426150))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57244 (_ BitVec 32)) SeekEntryResult!9095)

(assert (=> b!945964 (= lt!426150 (seekEntry!0 key!756 (_keys!10593 thiss!1141) (mask!27391 thiss!1141)))))

(declare-fun mapIsEmpty!32793 () Bool)

(assert (=> mapIsEmpty!32793 mapRes!32793))

(assert (= (and start!80586 res!635170) b!945958))

(assert (= (and b!945958 res!635169) b!945964))

(assert (= (and b!945964 res!635168) b!945959))

(assert (= (and b!945960 condMapEmpty!32793) mapIsEmpty!32793))

(assert (= (and b!945960 (not condMapEmpty!32793)) mapNonEmpty!32793))

(assert (= (and mapNonEmpty!32793 ((_ is ValueCellFull!9834) mapValue!32793)) b!945962))

(assert (= (and b!945960 ((_ is ValueCellFull!9834) mapDefault!32793)) b!945961))

(assert (= b!945963 b!945960))

(assert (= start!80586 b!945963))

(declare-fun m!879539 () Bool)

(assert (=> b!945959 m!879539))

(declare-fun m!879541 () Bool)

(assert (=> b!945959 m!879541))

(declare-fun m!879543 () Bool)

(assert (=> b!945959 m!879543))

(declare-fun m!879545 () Bool)

(assert (=> mapNonEmpty!32793 m!879545))

(declare-fun m!879547 () Bool)

(assert (=> b!945963 m!879547))

(declare-fun m!879549 () Bool)

(assert (=> b!945963 m!879549))

(declare-fun m!879551 () Bool)

(assert (=> start!80586 m!879551))

(declare-fun m!879553 () Bool)

(assert (=> b!945964 m!879553))

(check-sat b_and!29545 (not b!945964) (not b_next!18123) (not start!80586) (not b!945963) (not mapNonEmpty!32793) tp_is_empty!20631 (not b!945959))
(check-sat b_and!29545 (not b_next!18123))
(get-model)

(declare-fun d!114463 () Bool)

(assert (=> d!114463 (= (array_inv!21390 (_keys!10593 thiss!1141)) (bvsge (size!28010 (_keys!10593 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945963 d!114463))

(declare-fun d!114465 () Bool)

(assert (=> d!114465 (= (array_inv!21391 (_values!5729 thiss!1141)) (bvsge (size!28009 (_values!5729 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945963 d!114465))

(declare-fun d!114467 () Bool)

(assert (=> d!114467 (= (validMask!0 (mask!27391 thiss!1141)) (and (or (= (mask!27391 thiss!1141) #b00000000000000000000000000000111) (= (mask!27391 thiss!1141) #b00000000000000000000000000001111) (= (mask!27391 thiss!1141) #b00000000000000000000000000011111) (= (mask!27391 thiss!1141) #b00000000000000000000000000111111) (= (mask!27391 thiss!1141) #b00000000000000000000000001111111) (= (mask!27391 thiss!1141) #b00000000000000000000000011111111) (= (mask!27391 thiss!1141) #b00000000000000000000000111111111) (= (mask!27391 thiss!1141) #b00000000000000000000001111111111) (= (mask!27391 thiss!1141) #b00000000000000000000011111111111) (= (mask!27391 thiss!1141) #b00000000000000000000111111111111) (= (mask!27391 thiss!1141) #b00000000000000000001111111111111) (= (mask!27391 thiss!1141) #b00000000000000000011111111111111) (= (mask!27391 thiss!1141) #b00000000000000000111111111111111) (= (mask!27391 thiss!1141) #b00000000000000001111111111111111) (= (mask!27391 thiss!1141) #b00000000000000011111111111111111) (= (mask!27391 thiss!1141) #b00000000000000111111111111111111) (= (mask!27391 thiss!1141) #b00000000000001111111111111111111) (= (mask!27391 thiss!1141) #b00000000000011111111111111111111) (= (mask!27391 thiss!1141) #b00000000000111111111111111111111) (= (mask!27391 thiss!1141) #b00000000001111111111111111111111) (= (mask!27391 thiss!1141) #b00000000011111111111111111111111) (= (mask!27391 thiss!1141) #b00000000111111111111111111111111) (= (mask!27391 thiss!1141) #b00000001111111111111111111111111) (= (mask!27391 thiss!1141) #b00000011111111111111111111111111) (= (mask!27391 thiss!1141) #b00000111111111111111111111111111) (= (mask!27391 thiss!1141) #b00001111111111111111111111111111) (= (mask!27391 thiss!1141) #b00011111111111111111111111111111) (= (mask!27391 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27391 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!945959 d!114467))

(declare-fun d!114469 () Bool)

(declare-fun res!635184 () Bool)

(declare-fun e!532191 () Bool)

(assert (=> d!114469 (=> res!635184 e!532191)))

(assert (=> d!114469 (= res!635184 (= (select (arr!27541 (_keys!10593 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114469 (= (arrayContainsKey!0 (_keys!10593 thiss!1141) key!756 #b00000000000000000000000000000000) e!532191)))

(declare-fun b!945990 () Bool)

(declare-fun e!532192 () Bool)

(assert (=> b!945990 (= e!532191 e!532192)))

(declare-fun res!635185 () Bool)

(assert (=> b!945990 (=> (not res!635185) (not e!532192))))

(assert (=> b!945990 (= res!635185 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28010 (_keys!10593 thiss!1141))))))

(declare-fun b!945991 () Bool)

(assert (=> b!945991 (= e!532192 (arrayContainsKey!0 (_keys!10593 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114469 (not res!635184)) b!945990))

(assert (= (and b!945990 res!635185) b!945991))

(declare-fun m!879571 () Bool)

(assert (=> d!114469 m!879571))

(declare-fun m!879573 () Bool)

(assert (=> b!945991 m!879573))

(assert (=> b!945959 d!114469))

(declare-fun d!114471 () Bool)

(assert (=> d!114471 (arrayContainsKey!0 (_keys!10593 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426159 () Unit!31892)

(declare-fun choose!13 (array!57244 (_ BitVec 64) (_ BitVec 32)) Unit!31892)

(assert (=> d!114471 (= lt!426159 (choose!13 (_keys!10593 thiss!1141) key!756 (index!38752 lt!426150)))))

(assert (=> d!114471 (bvsge (index!38752 lt!426150) #b00000000000000000000000000000000)))

(assert (=> d!114471 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10593 thiss!1141) key!756 (index!38752 lt!426150)) lt!426159)))

(declare-fun bs!26592 () Bool)

(assert (= bs!26592 d!114471))

(assert (=> bs!26592 m!879541))

(declare-fun m!879575 () Bool)

(assert (=> bs!26592 m!879575))

(assert (=> b!945959 d!114471))

(declare-fun d!114473 () Bool)

(declare-fun res!635192 () Bool)

(declare-fun e!532195 () Bool)

(assert (=> d!114473 (=> (not res!635192) (not e!532195))))

(declare-fun simpleValid!355 (LongMapFixedSize!4818) Bool)

(assert (=> d!114473 (= res!635192 (simpleValid!355 thiss!1141))))

(assert (=> d!114473 (= (valid!1840 thiss!1141) e!532195)))

(declare-fun b!945998 () Bool)

(declare-fun res!635193 () Bool)

(assert (=> b!945998 (=> (not res!635193) (not e!532195))))

(declare-fun arrayCountValidKeys!0 (array!57244 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945998 (= res!635193 (= (arrayCountValidKeys!0 (_keys!10593 thiss!1141) #b00000000000000000000000000000000 (size!28010 (_keys!10593 thiss!1141))) (_size!2464 thiss!1141)))))

(declare-fun b!945999 () Bool)

(declare-fun res!635194 () Bool)

(assert (=> b!945999 (=> (not res!635194) (not e!532195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57244 (_ BitVec 32)) Bool)

(assert (=> b!945999 (= res!635194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10593 thiss!1141) (mask!27391 thiss!1141)))))

(declare-fun b!946000 () Bool)

(declare-datatypes ((List!19295 0))(
  ( (Nil!19292) (Cons!19291 (h!20443 (_ BitVec 64)) (t!27616 List!19295)) )
))
(declare-fun arrayNoDuplicates!0 (array!57244 (_ BitVec 32) List!19295) Bool)

(assert (=> b!946000 (= e!532195 (arrayNoDuplicates!0 (_keys!10593 thiss!1141) #b00000000000000000000000000000000 Nil!19292))))

(assert (= (and d!114473 res!635192) b!945998))

(assert (= (and b!945998 res!635193) b!945999))

(assert (= (and b!945999 res!635194) b!946000))

(declare-fun m!879577 () Bool)

(assert (=> d!114473 m!879577))

(declare-fun m!879579 () Bool)

(assert (=> b!945998 m!879579))

(declare-fun m!879581 () Bool)

(assert (=> b!945999 m!879581))

(declare-fun m!879583 () Bool)

(assert (=> b!946000 m!879583))

(assert (=> start!80586 d!114473))

(declare-fun b!946013 () Bool)

(declare-fun e!532204 () SeekEntryResult!9095)

(declare-fun lt!426170 () SeekEntryResult!9095)

(assert (=> b!946013 (= e!532204 (Found!9095 (index!38753 lt!426170)))))

(declare-fun b!946014 () Bool)

(declare-fun e!532202 () SeekEntryResult!9095)

(assert (=> b!946014 (= e!532202 (MissingZero!9095 (index!38753 lt!426170)))))

(declare-fun b!946015 () Bool)

(declare-fun e!532203 () SeekEntryResult!9095)

(assert (=> b!946015 (= e!532203 e!532204)))

(declare-fun lt!426168 () (_ BitVec 64))

(assert (=> b!946015 (= lt!426168 (select (arr!27541 (_keys!10593 thiss!1141)) (index!38753 lt!426170)))))

(declare-fun c!98495 () Bool)

(assert (=> b!946015 (= c!98495 (= lt!426168 key!756))))

(declare-fun b!946016 () Bool)

(assert (=> b!946016 (= e!532203 Undefined!9095)))

(declare-fun d!114475 () Bool)

(declare-fun lt!426171 () SeekEntryResult!9095)

(assert (=> d!114475 (and (or ((_ is MissingVacant!9095) lt!426171) (not ((_ is Found!9095) lt!426171)) (and (bvsge (index!38752 lt!426171) #b00000000000000000000000000000000) (bvslt (index!38752 lt!426171) (size!28010 (_keys!10593 thiss!1141))))) (not ((_ is MissingVacant!9095) lt!426171)) (or (not ((_ is Found!9095) lt!426171)) (= (select (arr!27541 (_keys!10593 thiss!1141)) (index!38752 lt!426171)) key!756)))))

(assert (=> d!114475 (= lt!426171 e!532203)))

(declare-fun c!98493 () Bool)

(assert (=> d!114475 (= c!98493 (and ((_ is Intermediate!9095) lt!426170) (undefined!9907 lt!426170)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57244 (_ BitVec 32)) SeekEntryResult!9095)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114475 (= lt!426170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27391 thiss!1141)) key!756 (_keys!10593 thiss!1141) (mask!27391 thiss!1141)))))

(assert (=> d!114475 (validMask!0 (mask!27391 thiss!1141))))

(assert (=> d!114475 (= (seekEntry!0 key!756 (_keys!10593 thiss!1141) (mask!27391 thiss!1141)) lt!426171)))

(declare-fun b!946017 () Bool)

(declare-fun c!98494 () Bool)

(assert (=> b!946017 (= c!98494 (= lt!426168 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!946017 (= e!532204 e!532202)))

(declare-fun b!946018 () Bool)

(declare-fun lt!426169 () SeekEntryResult!9095)

(assert (=> b!946018 (= e!532202 (ite ((_ is MissingVacant!9095) lt!426169) (MissingZero!9095 (index!38754 lt!426169)) lt!426169))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57244 (_ BitVec 32)) SeekEntryResult!9095)

(assert (=> b!946018 (= lt!426169 (seekKeyOrZeroReturnVacant!0 (x!81315 lt!426170) (index!38753 lt!426170) (index!38753 lt!426170) key!756 (_keys!10593 thiss!1141) (mask!27391 thiss!1141)))))

(assert (= (and d!114475 c!98493) b!946016))

(assert (= (and d!114475 (not c!98493)) b!946015))

(assert (= (and b!946015 c!98495) b!946013))

(assert (= (and b!946015 (not c!98495)) b!946017))

(assert (= (and b!946017 c!98494) b!946014))

(assert (= (and b!946017 (not c!98494)) b!946018))

(declare-fun m!879585 () Bool)

(assert (=> b!946015 m!879585))

(declare-fun m!879587 () Bool)

(assert (=> d!114475 m!879587))

(declare-fun m!879589 () Bool)

(assert (=> d!114475 m!879589))

(assert (=> d!114475 m!879589))

(declare-fun m!879591 () Bool)

(assert (=> d!114475 m!879591))

(assert (=> d!114475 m!879539))

(declare-fun m!879593 () Bool)

(assert (=> b!946018 m!879593))

(assert (=> b!945964 d!114475))

(declare-fun mapIsEmpty!32799 () Bool)

(declare-fun mapRes!32799 () Bool)

(assert (=> mapIsEmpty!32799 mapRes!32799))

(declare-fun mapNonEmpty!32799 () Bool)

(declare-fun tp!62909 () Bool)

(declare-fun e!532210 () Bool)

(assert (=> mapNonEmpty!32799 (= mapRes!32799 (and tp!62909 e!532210))))

(declare-fun mapRest!32799 () (Array (_ BitVec 32) ValueCell!9834))

(declare-fun mapValue!32799 () ValueCell!9834)

(declare-fun mapKey!32799 () (_ BitVec 32))

(assert (=> mapNonEmpty!32799 (= mapRest!32793 (store mapRest!32799 mapKey!32799 mapValue!32799))))

(declare-fun condMapEmpty!32799 () Bool)

(declare-fun mapDefault!32799 () ValueCell!9834)

(assert (=> mapNonEmpty!32793 (= condMapEmpty!32799 (= mapRest!32793 ((as const (Array (_ BitVec 32) ValueCell!9834)) mapDefault!32799)))))

(declare-fun e!532209 () Bool)

(assert (=> mapNonEmpty!32793 (= tp!62899 (and e!532209 mapRes!32799))))

(declare-fun b!946026 () Bool)

(assert (=> b!946026 (= e!532209 tp_is_empty!20631)))

(declare-fun b!946025 () Bool)

(assert (=> b!946025 (= e!532210 tp_is_empty!20631)))

(assert (= (and mapNonEmpty!32793 condMapEmpty!32799) mapIsEmpty!32799))

(assert (= (and mapNonEmpty!32793 (not condMapEmpty!32799)) mapNonEmpty!32799))

(assert (= (and mapNonEmpty!32799 ((_ is ValueCellFull!9834) mapValue!32799)) b!946025))

(assert (= (and mapNonEmpty!32793 ((_ is ValueCellFull!9834) mapDefault!32799)) b!946026))

(declare-fun m!879595 () Bool)

(assert (=> mapNonEmpty!32799 m!879595))

(check-sat (not mapNonEmpty!32799) (not d!114475) (not b_next!18123) (not b!945998) (not d!114471) (not b!945999) (not b!945991) (not b!946000) (not b!946018) b_and!29545 tp_is_empty!20631 (not d!114473))
(check-sat b_and!29545 (not b_next!18123))
