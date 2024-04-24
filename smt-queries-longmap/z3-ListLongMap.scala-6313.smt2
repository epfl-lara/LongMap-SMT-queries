; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81134 () Bool)

(assert start!81134)

(declare-fun b!949307 () Bool)

(declare-fun b_free!18199 () Bool)

(declare-fun b_next!18199 () Bool)

(assert (=> b!949307 (= b_free!18199 (not b_next!18199))))

(declare-fun tp!63173 () Bool)

(declare-fun b_and!29641 () Bool)

(assert (=> b!949307 (= tp!63173 b_and!29641)))

(declare-fun b!949299 () Bool)

(declare-fun res!636625 () Bool)

(declare-fun e!534465 () Bool)

(assert (=> b!949299 (=> (not res!636625) (not e!534465))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32575 0))(
  ( (V!32576 (val!10404 Int)) )
))
(declare-datatypes ((ValueCell!9872 0))(
  ( (ValueCellFull!9872 (v!12938 V!32575)) (EmptyCell!9872) )
))
(declare-datatypes ((array!57471 0))(
  ( (array!57472 (arr!27637 (Array (_ BitVec 32) ValueCell!9872)) (size!28112 (_ BitVec 32))) )
))
(declare-datatypes ((array!57473 0))(
  ( (array!57474 (arr!27638 (Array (_ BitVec 32) (_ BitVec 64))) (size!28113 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4894 0))(
  ( (LongMapFixedSize!4895 (defaultEntry!5749 Int) (mask!27552 (_ BitVec 32)) (extraKeys!5481 (_ BitVec 32)) (zeroValue!5585 V!32575) (minValue!5585 V!32575) (_size!2502 (_ BitVec 32)) (_keys!10696 array!57473) (_values!5772 array!57471) (_vacant!2502 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4894)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9088 0))(
  ( (MissingZero!9088 (index!38723 (_ BitVec 32))) (Found!9088 (index!38724 (_ BitVec 32))) (Intermediate!9088 (undefined!9900 Bool) (index!38725 (_ BitVec 32)) (x!81580 (_ BitVec 32))) (Undefined!9088) (MissingVacant!9088 (index!38726 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57473 (_ BitVec 32)) SeekEntryResult!9088)

(assert (=> b!949299 (= res!636625 (not ((_ is Found!9088) (seekEntry!0 key!756 (_keys!10696 thiss!1141) (mask!27552 thiss!1141)))))))

(declare-fun b!949300 () Bool)

(declare-fun res!636624 () Bool)

(assert (=> b!949300 (=> (not res!636624) (not e!534465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!949300 (= res!636624 (validMask!0 (mask!27552 thiss!1141)))))

(declare-fun b!949301 () Bool)

(assert (=> b!949301 (= e!534465 (and (= (size!28112 (_values!5772 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27552 thiss!1141))) (not (= (size!28113 (_keys!10696 thiss!1141)) (size!28112 (_values!5772 thiss!1141))))))))

(declare-fun b!949302 () Bool)

(declare-fun e!534461 () Bool)

(declare-fun e!534464 () Bool)

(declare-fun mapRes!32951 () Bool)

(assert (=> b!949302 (= e!534461 (and e!534464 mapRes!32951))))

(declare-fun condMapEmpty!32951 () Bool)

(declare-fun mapDefault!32951 () ValueCell!9872)

(assert (=> b!949302 (= condMapEmpty!32951 (= (arr!27637 (_values!5772 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9872)) mapDefault!32951)))))

(declare-fun b!949303 () Bool)

(declare-fun res!636627 () Bool)

(assert (=> b!949303 (=> (not res!636627) (not e!534465))))

(declare-datatypes ((tuple2!13506 0))(
  ( (tuple2!13507 (_1!6764 (_ BitVec 64)) (_2!6764 V!32575)) )
))
(declare-datatypes ((List!19305 0))(
  ( (Nil!19302) (Cons!19301 (h!20464 tuple2!13506) (t!27624 List!19305)) )
))
(declare-datatypes ((ListLongMap!12205 0))(
  ( (ListLongMap!12206 (toList!6118 List!19305)) )
))
(declare-fun contains!5213 (ListLongMap!12205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3351 (array!57473 array!57471 (_ BitVec 32) (_ BitVec 32) V!32575 V!32575 (_ BitVec 32) Int) ListLongMap!12205)

(assert (=> b!949303 (= res!636627 (contains!5213 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)) key!756))))

(declare-fun b!949304 () Bool)

(declare-fun res!636626 () Bool)

(assert (=> b!949304 (=> (not res!636626) (not e!534465))))

(assert (=> b!949304 (= res!636626 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32951 () Bool)

(assert (=> mapIsEmpty!32951 mapRes!32951))

(declare-fun res!636623 () Bool)

(assert (=> start!81134 (=> (not res!636623) (not e!534465))))

(declare-fun valid!1877 (LongMapFixedSize!4894) Bool)

(assert (=> start!81134 (= res!636623 (valid!1877 thiss!1141))))

(assert (=> start!81134 e!534465))

(declare-fun e!534460 () Bool)

(assert (=> start!81134 e!534460))

(assert (=> start!81134 true))

(declare-fun b!949305 () Bool)

(declare-fun e!534463 () Bool)

(declare-fun tp_is_empty!20707 () Bool)

(assert (=> b!949305 (= e!534463 tp_is_empty!20707)))

(declare-fun mapNonEmpty!32951 () Bool)

(declare-fun tp!63172 () Bool)

(assert (=> mapNonEmpty!32951 (= mapRes!32951 (and tp!63172 e!534463))))

(declare-fun mapKey!32951 () (_ BitVec 32))

(declare-fun mapRest!32951 () (Array (_ BitVec 32) ValueCell!9872))

(declare-fun mapValue!32951 () ValueCell!9872)

(assert (=> mapNonEmpty!32951 (= (arr!27637 (_values!5772 thiss!1141)) (store mapRest!32951 mapKey!32951 mapValue!32951))))

(declare-fun b!949306 () Bool)

(assert (=> b!949306 (= e!534464 tp_is_empty!20707)))

(declare-fun array_inv!21540 (array!57473) Bool)

(declare-fun array_inv!21541 (array!57471) Bool)

(assert (=> b!949307 (= e!534460 (and tp!63173 tp_is_empty!20707 (array_inv!21540 (_keys!10696 thiss!1141)) (array_inv!21541 (_values!5772 thiss!1141)) e!534461))))

(assert (= (and start!81134 res!636623) b!949304))

(assert (= (and b!949304 res!636626) b!949299))

(assert (= (and b!949299 res!636625) b!949303))

(assert (= (and b!949303 res!636627) b!949300))

(assert (= (and b!949300 res!636624) b!949301))

(assert (= (and b!949302 condMapEmpty!32951) mapIsEmpty!32951))

(assert (= (and b!949302 (not condMapEmpty!32951)) mapNonEmpty!32951))

(assert (= (and mapNonEmpty!32951 ((_ is ValueCellFull!9872) mapValue!32951)) b!949305))

(assert (= (and b!949302 ((_ is ValueCellFull!9872) mapDefault!32951)) b!949306))

(assert (= b!949307 b!949302))

(assert (= start!81134 b!949307))

(declare-fun m!882475 () Bool)

(assert (=> b!949303 m!882475))

(assert (=> b!949303 m!882475))

(declare-fun m!882477 () Bool)

(assert (=> b!949303 m!882477))

(declare-fun m!882479 () Bool)

(assert (=> b!949307 m!882479))

(declare-fun m!882481 () Bool)

(assert (=> b!949307 m!882481))

(declare-fun m!882483 () Bool)

(assert (=> start!81134 m!882483))

(declare-fun m!882485 () Bool)

(assert (=> b!949300 m!882485))

(declare-fun m!882487 () Bool)

(assert (=> b!949299 m!882487))

(declare-fun m!882489 () Bool)

(assert (=> mapNonEmpty!32951 m!882489))

(check-sat (not b!949303) (not b!949299) (not start!81134) b_and!29641 (not b!949300) (not b!949307) tp_is_empty!20707 (not b_next!18199) (not mapNonEmpty!32951))
(check-sat b_and!29641 (not b_next!18199))
(get-model)

(declare-fun d!115163 () Bool)

(assert (=> d!115163 (= (array_inv!21540 (_keys!10696 thiss!1141)) (bvsge (size!28113 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949307 d!115163))

(declare-fun d!115165 () Bool)

(assert (=> d!115165 (= (array_inv!21541 (_values!5772 thiss!1141)) (bvsge (size!28112 (_values!5772 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949307 d!115165))

(declare-fun b!949374 () Bool)

(declare-fun e!534510 () SeekEntryResult!9088)

(assert (=> b!949374 (= e!534510 Undefined!9088)))

(declare-fun d!115167 () Bool)

(declare-fun lt!427412 () SeekEntryResult!9088)

(assert (=> d!115167 (and (or ((_ is MissingVacant!9088) lt!427412) (not ((_ is Found!9088) lt!427412)) (and (bvsge (index!38724 lt!427412) #b00000000000000000000000000000000) (bvslt (index!38724 lt!427412) (size!28113 (_keys!10696 thiss!1141))))) (not ((_ is MissingVacant!9088) lt!427412)) (or (not ((_ is Found!9088) lt!427412)) (= (select (arr!27638 (_keys!10696 thiss!1141)) (index!38724 lt!427412)) key!756)))))

(assert (=> d!115167 (= lt!427412 e!534510)))

(declare-fun c!99153 () Bool)

(declare-fun lt!427414 () SeekEntryResult!9088)

(assert (=> d!115167 (= c!99153 (and ((_ is Intermediate!9088) lt!427414) (undefined!9900 lt!427414)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57473 (_ BitVec 32)) SeekEntryResult!9088)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115167 (= lt!427414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27552 thiss!1141)) key!756 (_keys!10696 thiss!1141) (mask!27552 thiss!1141)))))

(assert (=> d!115167 (validMask!0 (mask!27552 thiss!1141))))

(assert (=> d!115167 (= (seekEntry!0 key!756 (_keys!10696 thiss!1141) (mask!27552 thiss!1141)) lt!427412)))

(declare-fun b!949375 () Bool)

(declare-fun e!534508 () SeekEntryResult!9088)

(assert (=> b!949375 (= e!534510 e!534508)))

(declare-fun lt!427413 () (_ BitVec 64))

(assert (=> b!949375 (= lt!427413 (select (arr!27638 (_keys!10696 thiss!1141)) (index!38725 lt!427414)))))

(declare-fun c!99152 () Bool)

(assert (=> b!949375 (= c!99152 (= lt!427413 key!756))))

(declare-fun b!949376 () Bool)

(declare-fun c!99154 () Bool)

(assert (=> b!949376 (= c!99154 (= lt!427413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534509 () SeekEntryResult!9088)

(assert (=> b!949376 (= e!534508 e!534509)))

(declare-fun b!949377 () Bool)

(declare-fun lt!427411 () SeekEntryResult!9088)

(assert (=> b!949377 (= e!534509 (ite ((_ is MissingVacant!9088) lt!427411) (MissingZero!9088 (index!38726 lt!427411)) lt!427411))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57473 (_ BitVec 32)) SeekEntryResult!9088)

(assert (=> b!949377 (= lt!427411 (seekKeyOrZeroReturnVacant!0 (x!81580 lt!427414) (index!38725 lt!427414) (index!38725 lt!427414) key!756 (_keys!10696 thiss!1141) (mask!27552 thiss!1141)))))

(declare-fun b!949378 () Bool)

(assert (=> b!949378 (= e!534508 (Found!9088 (index!38725 lt!427414)))))

(declare-fun b!949379 () Bool)

(assert (=> b!949379 (= e!534509 (MissingZero!9088 (index!38725 lt!427414)))))

(assert (= (and d!115167 c!99153) b!949374))

(assert (= (and d!115167 (not c!99153)) b!949375))

(assert (= (and b!949375 c!99152) b!949378))

(assert (= (and b!949375 (not c!99152)) b!949376))

(assert (= (and b!949376 c!99154) b!949379))

(assert (= (and b!949376 (not c!99154)) b!949377))

(declare-fun m!882523 () Bool)

(assert (=> d!115167 m!882523))

(declare-fun m!882525 () Bool)

(assert (=> d!115167 m!882525))

(assert (=> d!115167 m!882525))

(declare-fun m!882527 () Bool)

(assert (=> d!115167 m!882527))

(assert (=> d!115167 m!882485))

(declare-fun m!882529 () Bool)

(assert (=> b!949375 m!882529))

(declare-fun m!882531 () Bool)

(assert (=> b!949377 m!882531))

(assert (=> b!949299 d!115167))

(declare-fun d!115169 () Bool)

(assert (=> d!115169 (= (validMask!0 (mask!27552 thiss!1141)) (and (or (= (mask!27552 thiss!1141) #b00000000000000000000000000000111) (= (mask!27552 thiss!1141) #b00000000000000000000000000001111) (= (mask!27552 thiss!1141) #b00000000000000000000000000011111) (= (mask!27552 thiss!1141) #b00000000000000000000000000111111) (= (mask!27552 thiss!1141) #b00000000000000000000000001111111) (= (mask!27552 thiss!1141) #b00000000000000000000000011111111) (= (mask!27552 thiss!1141) #b00000000000000000000000111111111) (= (mask!27552 thiss!1141) #b00000000000000000000001111111111) (= (mask!27552 thiss!1141) #b00000000000000000000011111111111) (= (mask!27552 thiss!1141) #b00000000000000000000111111111111) (= (mask!27552 thiss!1141) #b00000000000000000001111111111111) (= (mask!27552 thiss!1141) #b00000000000000000011111111111111) (= (mask!27552 thiss!1141) #b00000000000000000111111111111111) (= (mask!27552 thiss!1141) #b00000000000000001111111111111111) (= (mask!27552 thiss!1141) #b00000000000000011111111111111111) (= (mask!27552 thiss!1141) #b00000000000000111111111111111111) (= (mask!27552 thiss!1141) #b00000000000001111111111111111111) (= (mask!27552 thiss!1141) #b00000000000011111111111111111111) (= (mask!27552 thiss!1141) #b00000000000111111111111111111111) (= (mask!27552 thiss!1141) #b00000000001111111111111111111111) (= (mask!27552 thiss!1141) #b00000000011111111111111111111111) (= (mask!27552 thiss!1141) #b00000000111111111111111111111111) (= (mask!27552 thiss!1141) #b00000001111111111111111111111111) (= (mask!27552 thiss!1141) #b00000011111111111111111111111111) (= (mask!27552 thiss!1141) #b00000111111111111111111111111111) (= (mask!27552 thiss!1141) #b00001111111111111111111111111111) (= (mask!27552 thiss!1141) #b00011111111111111111111111111111) (= (mask!27552 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27552 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!949300 d!115169))

(declare-fun d!115171 () Bool)

(declare-fun res!636664 () Bool)

(declare-fun e!534513 () Bool)

(assert (=> d!115171 (=> (not res!636664) (not e!534513))))

(declare-fun simpleValid!368 (LongMapFixedSize!4894) Bool)

(assert (=> d!115171 (= res!636664 (simpleValid!368 thiss!1141))))

(assert (=> d!115171 (= (valid!1877 thiss!1141) e!534513)))

(declare-fun b!949386 () Bool)

(declare-fun res!636665 () Bool)

(assert (=> b!949386 (=> (not res!636665) (not e!534513))))

(declare-fun arrayCountValidKeys!0 (array!57473 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949386 (= res!636665 (= (arrayCountValidKeys!0 (_keys!10696 thiss!1141) #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))) (_size!2502 thiss!1141)))))

(declare-fun b!949387 () Bool)

(declare-fun res!636666 () Bool)

(assert (=> b!949387 (=> (not res!636666) (not e!534513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57473 (_ BitVec 32)) Bool)

(assert (=> b!949387 (= res!636666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10696 thiss!1141) (mask!27552 thiss!1141)))))

(declare-fun b!949388 () Bool)

(declare-datatypes ((List!19307 0))(
  ( (Nil!19304) (Cons!19303 (h!20466 (_ BitVec 64)) (t!27628 List!19307)) )
))
(declare-fun arrayNoDuplicates!0 (array!57473 (_ BitVec 32) List!19307) Bool)

(assert (=> b!949388 (= e!534513 (arrayNoDuplicates!0 (_keys!10696 thiss!1141) #b00000000000000000000000000000000 Nil!19304))))

(assert (= (and d!115171 res!636664) b!949386))

(assert (= (and b!949386 res!636665) b!949387))

(assert (= (and b!949387 res!636666) b!949388))

(declare-fun m!882533 () Bool)

(assert (=> d!115171 m!882533))

(declare-fun m!882535 () Bool)

(assert (=> b!949386 m!882535))

(declare-fun m!882537 () Bool)

(assert (=> b!949387 m!882537))

(declare-fun m!882539 () Bool)

(assert (=> b!949388 m!882539))

(assert (=> start!81134 d!115171))

(declare-fun d!115173 () Bool)

(declare-fun e!534518 () Bool)

(assert (=> d!115173 e!534518))

(declare-fun res!636669 () Bool)

(assert (=> d!115173 (=> res!636669 e!534518)))

(declare-fun lt!427426 () Bool)

(assert (=> d!115173 (= res!636669 (not lt!427426))))

(declare-fun lt!427423 () Bool)

(assert (=> d!115173 (= lt!427426 lt!427423)))

(declare-datatypes ((Unit!31934 0))(
  ( (Unit!31935) )
))
(declare-fun lt!427425 () Unit!31934)

(declare-fun e!534519 () Unit!31934)

(assert (=> d!115173 (= lt!427425 e!534519)))

(declare-fun c!99157 () Bool)

(assert (=> d!115173 (= c!99157 lt!427423)))

(declare-fun containsKey!460 (List!19305 (_ BitVec 64)) Bool)

(assert (=> d!115173 (= lt!427423 (containsKey!460 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))

(assert (=> d!115173 (= (contains!5213 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)) key!756) lt!427426)))

(declare-fun b!949395 () Bool)

(declare-fun lt!427424 () Unit!31934)

(assert (=> b!949395 (= e!534519 lt!427424)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!354 (List!19305 (_ BitVec 64)) Unit!31934)

(assert (=> b!949395 (= lt!427424 (lemmaContainsKeyImpliesGetValueByKeyDefined!354 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))

(declare-datatypes ((Option!495 0))(
  ( (Some!494 (v!12941 V!32575)) (None!493) )
))
(declare-fun isDefined!362 (Option!495) Bool)

(declare-fun getValueByKey!489 (List!19305 (_ BitVec 64)) Option!495)

(assert (=> b!949395 (isDefined!362 (getValueByKey!489 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))

(declare-fun b!949396 () Bool)

(declare-fun Unit!31936 () Unit!31934)

(assert (=> b!949396 (= e!534519 Unit!31936)))

(declare-fun b!949397 () Bool)

(assert (=> b!949397 (= e!534518 (isDefined!362 (getValueByKey!489 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756)))))

(assert (= (and d!115173 c!99157) b!949395))

(assert (= (and d!115173 (not c!99157)) b!949396))

(assert (= (and d!115173 (not res!636669)) b!949397))

(declare-fun m!882541 () Bool)

(assert (=> d!115173 m!882541))

(declare-fun m!882543 () Bool)

(assert (=> b!949395 m!882543))

(declare-fun m!882545 () Bool)

(assert (=> b!949395 m!882545))

(assert (=> b!949395 m!882545))

(declare-fun m!882547 () Bool)

(assert (=> b!949395 m!882547))

(assert (=> b!949397 m!882545))

(assert (=> b!949397 m!882545))

(assert (=> b!949397 m!882547))

(assert (=> b!949303 d!115173))

(declare-fun call!41262 () ListLongMap!12205)

(declare-fun c!99174 () Bool)

(declare-fun bm!41256 () Bool)

(declare-fun call!41259 () ListLongMap!12205)

(declare-fun c!99172 () Bool)

(declare-fun call!41264 () ListLongMap!12205)

(declare-fun call!41261 () ListLongMap!12205)

(declare-fun +!2867 (ListLongMap!12205 tuple2!13506) ListLongMap!12205)

(assert (=> bm!41256 (= call!41264 (+!2867 (ite c!99174 call!41259 (ite c!99172 call!41262 call!41261)) (ite (or c!99174 c!99172) (tuple2!13507 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))

(declare-fun b!949440 () Bool)

(declare-fun e!534549 () Unit!31934)

(declare-fun Unit!31937 () Unit!31934)

(assert (=> b!949440 (= e!534549 Unit!31937)))

(declare-fun bm!41257 () Bool)

(declare-fun call!41263 () Bool)

(declare-fun lt!427482 () ListLongMap!12205)

(assert (=> bm!41257 (= call!41263 (contains!5213 lt!427482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41258 () Bool)

(declare-fun call!41260 () Bool)

(assert (=> bm!41258 (= call!41260 (contains!5213 lt!427482 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949441 () Bool)

(declare-fun e!534548 () ListLongMap!12205)

(declare-fun call!41265 () ListLongMap!12205)

(assert (=> b!949441 (= e!534548 call!41265)))

(declare-fun b!949442 () Bool)

(declare-fun e!534553 () Bool)

(declare-fun e!534556 () Bool)

(assert (=> b!949442 (= e!534553 e!534556)))

(declare-fun res!636692 () Bool)

(assert (=> b!949442 (= res!636692 call!41260)))

(assert (=> b!949442 (=> (not res!636692) (not e!534556))))

(declare-fun b!949443 () Bool)

(declare-fun e!534550 () ListLongMap!12205)

(assert (=> b!949443 (= e!534550 e!534548)))

(assert (=> b!949443 (= c!99172 (and (not (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!949444 () Bool)

(declare-fun e!534551 () Bool)

(declare-fun e!534557 () Bool)

(assert (=> b!949444 (= e!534551 e!534557)))

(declare-fun res!636691 () Bool)

(assert (=> b!949444 (=> (not res!636691) (not e!534557))))

(assert (=> b!949444 (= res!636691 (contains!5213 lt!427482 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949444 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))))))

(declare-fun b!949445 () Bool)

(declare-fun e!534558 () Bool)

(assert (=> b!949445 (= e!534558 (not call!41263))))

(declare-fun b!949446 () Bool)

(declare-fun e!534552 () ListLongMap!12205)

(assert (=> b!949446 (= e!534552 call!41261)))

(declare-fun b!949447 () Bool)

(declare-fun res!636689 () Bool)

(declare-fun e!534547 () Bool)

(assert (=> b!949447 (=> (not res!636689) (not e!534547))))

(assert (=> b!949447 (= res!636689 e!534551)))

(declare-fun res!636690 () Bool)

(assert (=> b!949447 (=> res!636690 e!534551)))

(declare-fun e!534555 () Bool)

(assert (=> b!949447 (= res!636690 (not e!534555))))

(declare-fun res!636693 () Bool)

(assert (=> b!949447 (=> (not res!636693) (not e!534555))))

(assert (=> b!949447 (= res!636693 (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))))))

(declare-fun bm!41259 () Bool)

(assert (=> bm!41259 (= call!41261 call!41262)))

(declare-fun b!949448 () Bool)

(assert (=> b!949448 (= e!534550 (+!2867 call!41264 (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))

(declare-fun bm!41260 () Bool)

(assert (=> bm!41260 (= call!41265 call!41264)))

(declare-fun d!115175 () Bool)

(assert (=> d!115175 e!534547))

(declare-fun res!636688 () Bool)

(assert (=> d!115175 (=> (not res!636688) (not e!534547))))

(assert (=> d!115175 (= res!636688 (or (bvsge #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))))))))

(declare-fun lt!427488 () ListLongMap!12205)

(assert (=> d!115175 (= lt!427482 lt!427488)))

(declare-fun lt!427478 () Unit!31934)

(assert (=> d!115175 (= lt!427478 e!534549)))

(declare-fun c!99175 () Bool)

(declare-fun e!534554 () Bool)

(assert (=> d!115175 (= c!99175 e!534554)))

(declare-fun res!636694 () Bool)

(assert (=> d!115175 (=> (not res!636694) (not e!534554))))

(assert (=> d!115175 (= res!636694 (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))))))

(assert (=> d!115175 (= lt!427488 e!534550)))

(assert (=> d!115175 (= c!99174 (and (not (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115175 (validMask!0 (mask!27552 thiss!1141))))

(assert (=> d!115175 (= (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)) lt!427482)))

(declare-fun b!949449 () Bool)

(declare-fun e!534546 () Bool)

(assert (=> b!949449 (= e!534558 e!534546)))

(declare-fun res!636695 () Bool)

(assert (=> b!949449 (= res!636695 call!41263)))

(assert (=> b!949449 (=> (not res!636695) (not e!534546))))

(declare-fun b!949450 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!949450 (= e!534554 (validKeyInArray!0 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949451 () Bool)

(declare-fun apply!881 (ListLongMap!12205 (_ BitVec 64)) V!32575)

(assert (=> b!949451 (= e!534556 (= (apply!881 lt!427482 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5585 thiss!1141)))))

(declare-fun b!949452 () Bool)

(declare-fun c!99171 () Bool)

(assert (=> b!949452 (= c!99171 (and (not (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!949452 (= e!534548 e!534552)))

(declare-fun bm!41261 () Bool)

(assert (=> bm!41261 (= call!41262 call!41259)))

(declare-fun b!949453 () Bool)

(assert (=> b!949453 (= e!534553 (not call!41260))))

(declare-fun bm!41262 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3355 (array!57473 array!57471 (_ BitVec 32) (_ BitVec 32) V!32575 V!32575 (_ BitVec 32) Int) ListLongMap!12205)

(assert (=> bm!41262 (= call!41259 (getCurrentListMapNoExtraKeys!3355 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))

(declare-fun b!949454 () Bool)

(assert (=> b!949454 (= e!534555 (validKeyInArray!0 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949455 () Bool)

(assert (=> b!949455 (= e!534547 e!534553)))

(declare-fun c!99173 () Bool)

(assert (=> b!949455 (= c!99173 (not (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!949456 () Bool)

(declare-fun lt!427483 () Unit!31934)

(assert (=> b!949456 (= e!534549 lt!427483)))

(declare-fun lt!427472 () ListLongMap!12205)

(assert (=> b!949456 (= lt!427472 (getCurrentListMapNoExtraKeys!3355 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))

(declare-fun lt!427484 () (_ BitVec 64))

(assert (=> b!949456 (= lt!427484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427487 () (_ BitVec 64))

(assert (=> b!949456 (= lt!427487 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427471 () Unit!31934)

(declare-fun addStillContains!570 (ListLongMap!12205 (_ BitVec 64) V!32575 (_ BitVec 64)) Unit!31934)

(assert (=> b!949456 (= lt!427471 (addStillContains!570 lt!427472 lt!427484 (zeroValue!5585 thiss!1141) lt!427487))))

(assert (=> b!949456 (contains!5213 (+!2867 lt!427472 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141))) lt!427487)))

(declare-fun lt!427491 () Unit!31934)

(assert (=> b!949456 (= lt!427491 lt!427471)))

(declare-fun lt!427474 () ListLongMap!12205)

(assert (=> b!949456 (= lt!427474 (getCurrentListMapNoExtraKeys!3355 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))

(declare-fun lt!427473 () (_ BitVec 64))

(assert (=> b!949456 (= lt!427473 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427479 () (_ BitVec 64))

(assert (=> b!949456 (= lt!427479 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427492 () Unit!31934)

(declare-fun addApplyDifferent!451 (ListLongMap!12205 (_ BitVec 64) V!32575 (_ BitVec 64)) Unit!31934)

(assert (=> b!949456 (= lt!427492 (addApplyDifferent!451 lt!427474 lt!427473 (minValue!5585 thiss!1141) lt!427479))))

(assert (=> b!949456 (= (apply!881 (+!2867 lt!427474 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141))) lt!427479) (apply!881 lt!427474 lt!427479))))

(declare-fun lt!427477 () Unit!31934)

(assert (=> b!949456 (= lt!427477 lt!427492)))

(declare-fun lt!427486 () ListLongMap!12205)

(assert (=> b!949456 (= lt!427486 (getCurrentListMapNoExtraKeys!3355 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))

(declare-fun lt!427475 () (_ BitVec 64))

(assert (=> b!949456 (= lt!427475 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427476 () (_ BitVec 64))

(assert (=> b!949456 (= lt!427476 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427489 () Unit!31934)

(assert (=> b!949456 (= lt!427489 (addApplyDifferent!451 lt!427486 lt!427475 (zeroValue!5585 thiss!1141) lt!427476))))

(assert (=> b!949456 (= (apply!881 (+!2867 lt!427486 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141))) lt!427476) (apply!881 lt!427486 lt!427476))))

(declare-fun lt!427480 () Unit!31934)

(assert (=> b!949456 (= lt!427480 lt!427489)))

(declare-fun lt!427481 () ListLongMap!12205)

(assert (=> b!949456 (= lt!427481 (getCurrentListMapNoExtraKeys!3355 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))

(declare-fun lt!427485 () (_ BitVec 64))

(assert (=> b!949456 (= lt!427485 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427490 () (_ BitVec 64))

(assert (=> b!949456 (= lt!427490 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949456 (= lt!427483 (addApplyDifferent!451 lt!427481 lt!427485 (minValue!5585 thiss!1141) lt!427490))))

(assert (=> b!949456 (= (apply!881 (+!2867 lt!427481 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141))) lt!427490) (apply!881 lt!427481 lt!427490))))

(declare-fun b!949457 () Bool)

(assert (=> b!949457 (= e!534546 (= (apply!881 lt!427482 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5585 thiss!1141)))))

(declare-fun b!949458 () Bool)

(declare-fun get!14529 (ValueCell!9872 V!32575) V!32575)

(declare-fun dynLambda!1664 (Int (_ BitVec 64)) V!32575)

(assert (=> b!949458 (= e!534557 (= (apply!881 lt!427482 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)) (get!14529 (select (arr!27637 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1664 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949458 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28112 (_values!5772 thiss!1141))))))

(assert (=> b!949458 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))))))

(declare-fun b!949459 () Bool)

(assert (=> b!949459 (= e!534552 call!41265)))

(declare-fun b!949460 () Bool)

(declare-fun res!636696 () Bool)

(assert (=> b!949460 (=> (not res!636696) (not e!534547))))

(assert (=> b!949460 (= res!636696 e!534558)))

(declare-fun c!99170 () Bool)

(assert (=> b!949460 (= c!99170 (not (= (bvand (extraKeys!5481 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!115175 c!99174) b!949448))

(assert (= (and d!115175 (not c!99174)) b!949443))

(assert (= (and b!949443 c!99172) b!949441))

(assert (= (and b!949443 (not c!99172)) b!949452))

(assert (= (and b!949452 c!99171) b!949459))

(assert (= (and b!949452 (not c!99171)) b!949446))

(assert (= (or b!949459 b!949446) bm!41259))

(assert (= (or b!949441 bm!41259) bm!41261))

(assert (= (or b!949441 b!949459) bm!41260))

(assert (= (or b!949448 bm!41261) bm!41262))

(assert (= (or b!949448 bm!41260) bm!41256))

(assert (= (and d!115175 res!636694) b!949450))

(assert (= (and d!115175 c!99175) b!949456))

(assert (= (and d!115175 (not c!99175)) b!949440))

(assert (= (and d!115175 res!636688) b!949447))

(assert (= (and b!949447 res!636693) b!949454))

(assert (= (and b!949447 (not res!636690)) b!949444))

(assert (= (and b!949444 res!636691) b!949458))

(assert (= (and b!949447 res!636689) b!949460))

(assert (= (and b!949460 c!99170) b!949449))

(assert (= (and b!949460 (not c!99170)) b!949445))

(assert (= (and b!949449 res!636695) b!949457))

(assert (= (or b!949449 b!949445) bm!41257))

(assert (= (and b!949460 res!636696) b!949455))

(assert (= (and b!949455 c!99173) b!949442))

(assert (= (and b!949455 (not c!99173)) b!949453))

(assert (= (and b!949442 res!636692) b!949451))

(assert (= (or b!949442 b!949453) bm!41258))

(declare-fun b_lambda!14333 () Bool)

(assert (=> (not b_lambda!14333) (not b!949458)))

(declare-fun t!27627 () Bool)

(declare-fun tb!6171 () Bool)

(assert (=> (and b!949307 (= (defaultEntry!5749 thiss!1141) (defaultEntry!5749 thiss!1141)) t!27627) tb!6171))

(declare-fun result!12251 () Bool)

(assert (=> tb!6171 (= result!12251 tp_is_empty!20707)))

(assert (=> b!949458 t!27627))

(declare-fun b_and!29647 () Bool)

(assert (= b_and!29641 (and (=> t!27627 result!12251) b_and!29647)))

(declare-fun m!882549 () Bool)

(assert (=> b!949458 m!882549))

(declare-fun m!882551 () Bool)

(assert (=> b!949458 m!882551))

(assert (=> b!949458 m!882549))

(declare-fun m!882553 () Bool)

(assert (=> b!949458 m!882553))

(assert (=> b!949458 m!882551))

(declare-fun m!882555 () Bool)

(assert (=> b!949458 m!882555))

(assert (=> b!949458 m!882555))

(declare-fun m!882557 () Bool)

(assert (=> b!949458 m!882557))

(declare-fun m!882559 () Bool)

(assert (=> b!949456 m!882559))

(declare-fun m!882561 () Bool)

(assert (=> b!949456 m!882561))

(assert (=> b!949456 m!882555))

(declare-fun m!882563 () Bool)

(assert (=> b!949456 m!882563))

(declare-fun m!882565 () Bool)

(assert (=> b!949456 m!882565))

(declare-fun m!882567 () Bool)

(assert (=> b!949456 m!882567))

(declare-fun m!882569 () Bool)

(assert (=> b!949456 m!882569))

(declare-fun m!882571 () Bool)

(assert (=> b!949456 m!882571))

(declare-fun m!882573 () Bool)

(assert (=> b!949456 m!882573))

(declare-fun m!882575 () Bool)

(assert (=> b!949456 m!882575))

(declare-fun m!882577 () Bool)

(assert (=> b!949456 m!882577))

(assert (=> b!949456 m!882571))

(declare-fun m!882579 () Bool)

(assert (=> b!949456 m!882579))

(declare-fun m!882581 () Bool)

(assert (=> b!949456 m!882581))

(declare-fun m!882583 () Bool)

(assert (=> b!949456 m!882583))

(assert (=> b!949456 m!882559))

(declare-fun m!882585 () Bool)

(assert (=> b!949456 m!882585))

(assert (=> b!949456 m!882575))

(declare-fun m!882587 () Bool)

(assert (=> b!949456 m!882587))

(assert (=> b!949456 m!882581))

(declare-fun m!882589 () Bool)

(assert (=> b!949456 m!882589))

(assert (=> bm!41262 m!882573))

(declare-fun m!882591 () Bool)

(assert (=> b!949457 m!882591))

(declare-fun m!882593 () Bool)

(assert (=> bm!41258 m!882593))

(declare-fun m!882595 () Bool)

(assert (=> bm!41256 m!882595))

(assert (=> b!949444 m!882555))

(assert (=> b!949444 m!882555))

(declare-fun m!882597 () Bool)

(assert (=> b!949444 m!882597))

(assert (=> b!949454 m!882555))

(assert (=> b!949454 m!882555))

(declare-fun m!882599 () Bool)

(assert (=> b!949454 m!882599))

(declare-fun m!882601 () Bool)

(assert (=> bm!41257 m!882601))

(declare-fun m!882603 () Bool)

(assert (=> b!949451 m!882603))

(assert (=> b!949450 m!882555))

(assert (=> b!949450 m!882555))

(assert (=> b!949450 m!882599))

(declare-fun m!882605 () Bool)

(assert (=> b!949448 m!882605))

(assert (=> d!115175 m!882485))

(assert (=> b!949303 d!115175))

(declare-fun mapNonEmpty!32960 () Bool)

(declare-fun mapRes!32960 () Bool)

(declare-fun tp!63188 () Bool)

(declare-fun e!534563 () Bool)

(assert (=> mapNonEmpty!32960 (= mapRes!32960 (and tp!63188 e!534563))))

(declare-fun mapValue!32960 () ValueCell!9872)

(declare-fun mapRest!32960 () (Array (_ BitVec 32) ValueCell!9872))

(declare-fun mapKey!32960 () (_ BitVec 32))

(assert (=> mapNonEmpty!32960 (= mapRest!32951 (store mapRest!32960 mapKey!32960 mapValue!32960))))

(declare-fun mapIsEmpty!32960 () Bool)

(assert (=> mapIsEmpty!32960 mapRes!32960))

(declare-fun b!949470 () Bool)

(declare-fun e!534564 () Bool)

(assert (=> b!949470 (= e!534564 tp_is_empty!20707)))

(declare-fun b!949469 () Bool)

(assert (=> b!949469 (= e!534563 tp_is_empty!20707)))

(declare-fun condMapEmpty!32960 () Bool)

(declare-fun mapDefault!32960 () ValueCell!9872)

(assert (=> mapNonEmpty!32951 (= condMapEmpty!32960 (= mapRest!32951 ((as const (Array (_ BitVec 32) ValueCell!9872)) mapDefault!32960)))))

(assert (=> mapNonEmpty!32951 (= tp!63172 (and e!534564 mapRes!32960))))

(assert (= (and mapNonEmpty!32951 condMapEmpty!32960) mapIsEmpty!32960))

(assert (= (and mapNonEmpty!32951 (not condMapEmpty!32960)) mapNonEmpty!32960))

(assert (= (and mapNonEmpty!32960 ((_ is ValueCellFull!9872) mapValue!32960)) b!949469))

(assert (= (and mapNonEmpty!32951 ((_ is ValueCellFull!9872) mapDefault!32960)) b!949470))

(declare-fun m!882607 () Bool)

(assert (=> mapNonEmpty!32960 m!882607))

(declare-fun b_lambda!14335 () Bool)

(assert (= b_lambda!14333 (or (and b!949307 b_free!18199) b_lambda!14335)))

(check-sat (not b!949388) (not b!949397) (not b!949451) (not mapNonEmpty!32960) (not b!949387) (not bm!41256) (not b!949454) (not d!115171) (not d!115167) (not b!949444) (not b!949377) (not b!949395) (not d!115175) (not d!115173) (not b!949386) (not bm!41257) tp_is_empty!20707 (not b_next!18199) (not bm!41262) (not b!949456) (not b!949457) (not b_lambda!14335) (not bm!41258) (not b!949450) (not b!949448) (not b!949458) b_and!29647)
(check-sat b_and!29647 (not b_next!18199))
(get-model)

(declare-fun d!115177 () Bool)

(declare-fun e!534565 () Bool)

(assert (=> d!115177 e!534565))

(declare-fun res!636697 () Bool)

(assert (=> d!115177 (=> res!636697 e!534565)))

(declare-fun lt!427496 () Bool)

(assert (=> d!115177 (= res!636697 (not lt!427496))))

(declare-fun lt!427493 () Bool)

(assert (=> d!115177 (= lt!427496 lt!427493)))

(declare-fun lt!427495 () Unit!31934)

(declare-fun e!534566 () Unit!31934)

(assert (=> d!115177 (= lt!427495 e!534566)))

(declare-fun c!99176 () Bool)

(assert (=> d!115177 (= c!99176 lt!427493)))

(assert (=> d!115177 (= lt!427493 (containsKey!460 (toList!6118 lt!427482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115177 (= (contains!5213 lt!427482 #b0000000000000000000000000000000000000000000000000000000000000000) lt!427496)))

(declare-fun b!949471 () Bool)

(declare-fun lt!427494 () Unit!31934)

(assert (=> b!949471 (= e!534566 lt!427494)))

(assert (=> b!949471 (= lt!427494 (lemmaContainsKeyImpliesGetValueByKeyDefined!354 (toList!6118 lt!427482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949471 (isDefined!362 (getValueByKey!489 (toList!6118 lt!427482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949472 () Bool)

(declare-fun Unit!31938 () Unit!31934)

(assert (=> b!949472 (= e!534566 Unit!31938)))

(declare-fun b!949473 () Bool)

(assert (=> b!949473 (= e!534565 (isDefined!362 (getValueByKey!489 (toList!6118 lt!427482) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115177 c!99176) b!949471))

(assert (= (and d!115177 (not c!99176)) b!949472))

(assert (= (and d!115177 (not res!636697)) b!949473))

(declare-fun m!882609 () Bool)

(assert (=> d!115177 m!882609))

(declare-fun m!882611 () Bool)

(assert (=> b!949471 m!882611))

(declare-fun m!882613 () Bool)

(assert (=> b!949471 m!882613))

(assert (=> b!949471 m!882613))

(declare-fun m!882615 () Bool)

(assert (=> b!949471 m!882615))

(assert (=> b!949473 m!882613))

(assert (=> b!949473 m!882613))

(assert (=> b!949473 m!882615))

(assert (=> bm!41257 d!115177))

(declare-fun d!115179 () Bool)

(declare-fun e!534567 () Bool)

(assert (=> d!115179 e!534567))

(declare-fun res!636698 () Bool)

(assert (=> d!115179 (=> res!636698 e!534567)))

(declare-fun lt!427500 () Bool)

(assert (=> d!115179 (= res!636698 (not lt!427500))))

(declare-fun lt!427497 () Bool)

(assert (=> d!115179 (= lt!427500 lt!427497)))

(declare-fun lt!427499 () Unit!31934)

(declare-fun e!534568 () Unit!31934)

(assert (=> d!115179 (= lt!427499 e!534568)))

(declare-fun c!99177 () Bool)

(assert (=> d!115179 (= c!99177 lt!427497)))

(assert (=> d!115179 (= lt!427497 (containsKey!460 (toList!6118 lt!427482) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115179 (= (contains!5213 lt!427482 #b1000000000000000000000000000000000000000000000000000000000000000) lt!427500)))

(declare-fun b!949474 () Bool)

(declare-fun lt!427498 () Unit!31934)

(assert (=> b!949474 (= e!534568 lt!427498)))

(assert (=> b!949474 (= lt!427498 (lemmaContainsKeyImpliesGetValueByKeyDefined!354 (toList!6118 lt!427482) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949474 (isDefined!362 (getValueByKey!489 (toList!6118 lt!427482) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949475 () Bool)

(declare-fun Unit!31939 () Unit!31934)

(assert (=> b!949475 (= e!534568 Unit!31939)))

(declare-fun b!949476 () Bool)

(assert (=> b!949476 (= e!534567 (isDefined!362 (getValueByKey!489 (toList!6118 lt!427482) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115179 c!99177) b!949474))

(assert (= (and d!115179 (not c!99177)) b!949475))

(assert (= (and d!115179 (not res!636698)) b!949476))

(declare-fun m!882617 () Bool)

(assert (=> d!115179 m!882617))

(declare-fun m!882619 () Bool)

(assert (=> b!949474 m!882619))

(declare-fun m!882621 () Bool)

(assert (=> b!949474 m!882621))

(assert (=> b!949474 m!882621))

(declare-fun m!882623 () Bool)

(assert (=> b!949474 m!882623))

(assert (=> b!949476 m!882621))

(assert (=> b!949476 m!882621))

(assert (=> b!949476 m!882623))

(assert (=> bm!41258 d!115179))

(declare-fun d!115181 () Bool)

(declare-fun res!636703 () Bool)

(declare-fun e!534573 () Bool)

(assert (=> d!115181 (=> res!636703 e!534573)))

(assert (=> d!115181 (= res!636703 (and ((_ is Cons!19301) (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))) (= (_1!6764 (h!20464 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))))) key!756)))))

(assert (=> d!115181 (= (containsKey!460 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756) e!534573)))

(declare-fun b!949481 () Bool)

(declare-fun e!534574 () Bool)

(assert (=> b!949481 (= e!534573 e!534574)))

(declare-fun res!636704 () Bool)

(assert (=> b!949481 (=> (not res!636704) (not e!534574))))

(assert (=> b!949481 (= res!636704 (and (or (not ((_ is Cons!19301) (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))))) (bvsle (_1!6764 (h!20464 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))))) key!756)) ((_ is Cons!19301) (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))) (bvslt (_1!6764 (h!20464 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))))) key!756)))))

(declare-fun b!949482 () Bool)

(assert (=> b!949482 (= e!534574 (containsKey!460 (t!27624 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))) key!756))))

(assert (= (and d!115181 (not res!636703)) b!949481))

(assert (= (and b!949481 res!636704) b!949482))

(declare-fun m!882625 () Bool)

(assert (=> b!949482 m!882625))

(assert (=> d!115173 d!115181))

(declare-fun d!115183 () Bool)

(declare-fun get!14530 (Option!495) V!32575)

(assert (=> d!115183 (= (apply!881 lt!427482 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14530 (getValueByKey!489 (toList!6118 lt!427482) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26671 () Bool)

(assert (= bs!26671 d!115183))

(assert (=> bs!26671 m!882613))

(assert (=> bs!26671 m!882613))

(declare-fun m!882627 () Bool)

(assert (=> bs!26671 m!882627))

(assert (=> b!949457 d!115183))

(declare-fun bm!41265 () Bool)

(declare-fun call!41268 () Bool)

(assert (=> bm!41265 (= call!41268 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10696 thiss!1141) (mask!27552 thiss!1141)))))

(declare-fun b!949491 () Bool)

(declare-fun e!534582 () Bool)

(assert (=> b!949491 (= e!534582 call!41268)))

(declare-fun d!115185 () Bool)

(declare-fun res!636709 () Bool)

(declare-fun e!534581 () Bool)

(assert (=> d!115185 (=> res!636709 e!534581)))

(assert (=> d!115185 (= res!636709 (bvsge #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))))))

(assert (=> d!115185 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10696 thiss!1141) (mask!27552 thiss!1141)) e!534581)))

(declare-fun b!949492 () Bool)

(declare-fun e!534583 () Bool)

(assert (=> b!949492 (= e!534581 e!534583)))

(declare-fun c!99180 () Bool)

(assert (=> b!949492 (= c!99180 (validKeyInArray!0 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949493 () Bool)

(assert (=> b!949493 (= e!534583 call!41268)))

(declare-fun b!949494 () Bool)

(assert (=> b!949494 (= e!534583 e!534582)))

(declare-fun lt!427507 () (_ BitVec 64))

(assert (=> b!949494 (= lt!427507 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427509 () Unit!31934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57473 (_ BitVec 64) (_ BitVec 32)) Unit!31934)

(assert (=> b!949494 (= lt!427509 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10696 thiss!1141) lt!427507 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!949494 (arrayContainsKey!0 (_keys!10696 thiss!1141) lt!427507 #b00000000000000000000000000000000)))

(declare-fun lt!427508 () Unit!31934)

(assert (=> b!949494 (= lt!427508 lt!427509)))

(declare-fun res!636710 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57473 (_ BitVec 32)) SeekEntryResult!9088)

(assert (=> b!949494 (= res!636710 (= (seekEntryOrOpen!0 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000) (_keys!10696 thiss!1141) (mask!27552 thiss!1141)) (Found!9088 #b00000000000000000000000000000000)))))

(assert (=> b!949494 (=> (not res!636710) (not e!534582))))

(assert (= (and d!115185 (not res!636709)) b!949492))

(assert (= (and b!949492 c!99180) b!949494))

(assert (= (and b!949492 (not c!99180)) b!949493))

(assert (= (and b!949494 res!636710) b!949491))

(assert (= (or b!949491 b!949493) bm!41265))

(declare-fun m!882629 () Bool)

(assert (=> bm!41265 m!882629))

(assert (=> b!949492 m!882555))

(assert (=> b!949492 m!882555))

(assert (=> b!949492 m!882599))

(assert (=> b!949494 m!882555))

(declare-fun m!882631 () Bool)

(assert (=> b!949494 m!882631))

(declare-fun m!882633 () Bool)

(assert (=> b!949494 m!882633))

(assert (=> b!949494 m!882555))

(declare-fun m!882635 () Bool)

(assert (=> b!949494 m!882635))

(assert (=> b!949387 d!115185))

(declare-fun d!115187 () Bool)

(assert (=> d!115187 (= (apply!881 lt!427482 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)) (get!14530 (getValueByKey!489 (toList!6118 lt!427482) (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26672 () Bool)

(assert (= bs!26672 d!115187))

(assert (=> bs!26672 m!882555))

(declare-fun m!882637 () Bool)

(assert (=> bs!26672 m!882637))

(assert (=> bs!26672 m!882637))

(declare-fun m!882639 () Bool)

(assert (=> bs!26672 m!882639))

(assert (=> b!949458 d!115187))

(declare-fun d!115189 () Bool)

(declare-fun c!99183 () Bool)

(assert (=> d!115189 (= c!99183 ((_ is ValueCellFull!9872) (select (arr!27637 (_values!5772 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!534586 () V!32575)

(assert (=> d!115189 (= (get!14529 (select (arr!27637 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1664 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!534586)))

(declare-fun b!949499 () Bool)

(declare-fun get!14531 (ValueCell!9872 V!32575) V!32575)

(assert (=> b!949499 (= e!534586 (get!14531 (select (arr!27637 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1664 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949500 () Bool)

(declare-fun get!14532 (ValueCell!9872 V!32575) V!32575)

(assert (=> b!949500 (= e!534586 (get!14532 (select (arr!27637 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1664 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115189 c!99183) b!949499))

(assert (= (and d!115189 (not c!99183)) b!949500))

(assert (=> b!949499 m!882551))

(assert (=> b!949499 m!882549))

(declare-fun m!882641 () Bool)

(assert (=> b!949499 m!882641))

(assert (=> b!949500 m!882551))

(assert (=> b!949500 m!882549))

(declare-fun m!882643 () Bool)

(assert (=> b!949500 m!882643))

(assert (=> b!949458 d!115189))

(declare-fun b!949511 () Bool)

(declare-fun e!534597 () Bool)

(declare-fun e!534596 () Bool)

(assert (=> b!949511 (= e!534597 e!534596)))

(declare-fun c!99186 () Bool)

(assert (=> b!949511 (= c!99186 (validKeyInArray!0 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949512 () Bool)

(declare-fun call!41271 () Bool)

(assert (=> b!949512 (= e!534596 call!41271)))

(declare-fun b!949513 () Bool)

(declare-fun e!534595 () Bool)

(assert (=> b!949513 (= e!534595 e!534597)))

(declare-fun res!636717 () Bool)

(assert (=> b!949513 (=> (not res!636717) (not e!534597))))

(declare-fun e!534598 () Bool)

(assert (=> b!949513 (= res!636717 (not e!534598))))

(declare-fun res!636718 () Bool)

(assert (=> b!949513 (=> (not res!636718) (not e!534598))))

(assert (=> b!949513 (= res!636718 (validKeyInArray!0 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115191 () Bool)

(declare-fun res!636719 () Bool)

(assert (=> d!115191 (=> res!636719 e!534595)))

(assert (=> d!115191 (= res!636719 (bvsge #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))))))

(assert (=> d!115191 (= (arrayNoDuplicates!0 (_keys!10696 thiss!1141) #b00000000000000000000000000000000 Nil!19304) e!534595)))

(declare-fun b!949514 () Bool)

(declare-fun contains!5215 (List!19307 (_ BitVec 64)) Bool)

(assert (=> b!949514 (= e!534598 (contains!5215 Nil!19304 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41268 () Bool)

(assert (=> bm!41268 (= call!41271 (arrayNoDuplicates!0 (_keys!10696 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99186 (Cons!19303 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000) Nil!19304) Nil!19304)))))

(declare-fun b!949515 () Bool)

(assert (=> b!949515 (= e!534596 call!41271)))

(assert (= (and d!115191 (not res!636719)) b!949513))

(assert (= (and b!949513 res!636718) b!949514))

(assert (= (and b!949513 res!636717) b!949511))

(assert (= (and b!949511 c!99186) b!949512))

(assert (= (and b!949511 (not c!99186)) b!949515))

(assert (= (or b!949512 b!949515) bm!41268))

(assert (=> b!949511 m!882555))

(assert (=> b!949511 m!882555))

(assert (=> b!949511 m!882599))

(assert (=> b!949513 m!882555))

(assert (=> b!949513 m!882555))

(assert (=> b!949513 m!882599))

(assert (=> b!949514 m!882555))

(assert (=> b!949514 m!882555))

(declare-fun m!882645 () Bool)

(assert (=> b!949514 m!882645))

(assert (=> bm!41268 m!882555))

(declare-fun m!882647 () Bool)

(assert (=> bm!41268 m!882647))

(assert (=> b!949388 d!115191))

(declare-fun b!949528 () Bool)

(declare-fun c!99193 () Bool)

(declare-fun lt!427515 () (_ BitVec 64))

(assert (=> b!949528 (= c!99193 (= lt!427515 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534606 () SeekEntryResult!9088)

(declare-fun e!534605 () SeekEntryResult!9088)

(assert (=> b!949528 (= e!534606 e!534605)))

(declare-fun b!949529 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949529 (= e!534605 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81580 lt!427414) #b00000000000000000000000000000001) (nextIndex!0 (index!38725 lt!427414) (bvadd (x!81580 lt!427414) #b00000000000000000000000000000001) (mask!27552 thiss!1141)) (index!38725 lt!427414) key!756 (_keys!10696 thiss!1141) (mask!27552 thiss!1141)))))

(declare-fun d!115193 () Bool)

(declare-fun lt!427514 () SeekEntryResult!9088)

(assert (=> d!115193 (and (or ((_ is Undefined!9088) lt!427514) (not ((_ is Found!9088) lt!427514)) (and (bvsge (index!38724 lt!427514) #b00000000000000000000000000000000) (bvslt (index!38724 lt!427514) (size!28113 (_keys!10696 thiss!1141))))) (or ((_ is Undefined!9088) lt!427514) ((_ is Found!9088) lt!427514) (not ((_ is MissingVacant!9088) lt!427514)) (not (= (index!38726 lt!427514) (index!38725 lt!427414))) (and (bvsge (index!38726 lt!427514) #b00000000000000000000000000000000) (bvslt (index!38726 lt!427514) (size!28113 (_keys!10696 thiss!1141))))) (or ((_ is Undefined!9088) lt!427514) (ite ((_ is Found!9088) lt!427514) (= (select (arr!27638 (_keys!10696 thiss!1141)) (index!38724 lt!427514)) key!756) (and ((_ is MissingVacant!9088) lt!427514) (= (index!38726 lt!427514) (index!38725 lt!427414)) (= (select (arr!27638 (_keys!10696 thiss!1141)) (index!38726 lt!427514)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!534607 () SeekEntryResult!9088)

(assert (=> d!115193 (= lt!427514 e!534607)))

(declare-fun c!99194 () Bool)

(assert (=> d!115193 (= c!99194 (bvsge (x!81580 lt!427414) #b01111111111111111111111111111110))))

(assert (=> d!115193 (= lt!427515 (select (arr!27638 (_keys!10696 thiss!1141)) (index!38725 lt!427414)))))

(assert (=> d!115193 (validMask!0 (mask!27552 thiss!1141))))

(assert (=> d!115193 (= (seekKeyOrZeroReturnVacant!0 (x!81580 lt!427414) (index!38725 lt!427414) (index!38725 lt!427414) key!756 (_keys!10696 thiss!1141) (mask!27552 thiss!1141)) lt!427514)))

(declare-fun b!949530 () Bool)

(assert (=> b!949530 (= e!534607 Undefined!9088)))

(declare-fun b!949531 () Bool)

(assert (=> b!949531 (= e!534605 (MissingVacant!9088 (index!38725 lt!427414)))))

(declare-fun b!949532 () Bool)

(assert (=> b!949532 (= e!534607 e!534606)))

(declare-fun c!99195 () Bool)

(assert (=> b!949532 (= c!99195 (= lt!427515 key!756))))

(declare-fun b!949533 () Bool)

(assert (=> b!949533 (= e!534606 (Found!9088 (index!38725 lt!427414)))))

(assert (= (and d!115193 c!99194) b!949530))

(assert (= (and d!115193 (not c!99194)) b!949532))

(assert (= (and b!949532 c!99195) b!949533))

(assert (= (and b!949532 (not c!99195)) b!949528))

(assert (= (and b!949528 c!99193) b!949531))

(assert (= (and b!949528 (not c!99193)) b!949529))

(declare-fun m!882649 () Bool)

(assert (=> b!949529 m!882649))

(assert (=> b!949529 m!882649))

(declare-fun m!882651 () Bool)

(assert (=> b!949529 m!882651))

(declare-fun m!882653 () Bool)

(assert (=> d!115193 m!882653))

(declare-fun m!882655 () Bool)

(assert (=> d!115193 m!882655))

(assert (=> d!115193 m!882529))

(assert (=> d!115193 m!882485))

(assert (=> b!949377 d!115193))

(declare-fun d!115195 () Bool)

(assert (=> d!115195 (= (validKeyInArray!0 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949450 d!115195))

(assert (=> b!949454 d!115195))

(declare-fun d!115197 () Bool)

(declare-fun e!534610 () Bool)

(assert (=> d!115197 e!534610))

(declare-fun res!636725 () Bool)

(assert (=> d!115197 (=> (not res!636725) (not e!534610))))

(declare-fun lt!427527 () ListLongMap!12205)

(assert (=> d!115197 (= res!636725 (contains!5213 lt!427527 (_1!6764 (ite (or c!99174 c!99172) (tuple2!13507 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))))

(declare-fun lt!427526 () List!19305)

(assert (=> d!115197 (= lt!427527 (ListLongMap!12206 lt!427526))))

(declare-fun lt!427525 () Unit!31934)

(declare-fun lt!427524 () Unit!31934)

(assert (=> d!115197 (= lt!427525 lt!427524)))

(assert (=> d!115197 (= (getValueByKey!489 lt!427526 (_1!6764 (ite (or c!99174 c!99172) (tuple2!13507 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))) (Some!494 (_2!6764 (ite (or c!99174 c!99172) (tuple2!13507 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!264 (List!19305 (_ BitVec 64) V!32575) Unit!31934)

(assert (=> d!115197 (= lt!427524 (lemmaContainsTupThenGetReturnValue!264 lt!427526 (_1!6764 (ite (or c!99174 c!99172) (tuple2!13507 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))) (_2!6764 (ite (or c!99174 c!99172) (tuple2!13507 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))))

(declare-fun insertStrictlySorted!321 (List!19305 (_ BitVec 64) V!32575) List!19305)

(assert (=> d!115197 (= lt!427526 (insertStrictlySorted!321 (toList!6118 (ite c!99174 call!41259 (ite c!99172 call!41262 call!41261))) (_1!6764 (ite (or c!99174 c!99172) (tuple2!13507 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))) (_2!6764 (ite (or c!99174 c!99172) (tuple2!13507 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))))

(assert (=> d!115197 (= (+!2867 (ite c!99174 call!41259 (ite c!99172 call!41262 call!41261)) (ite (or c!99174 c!99172) (tuple2!13507 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))) lt!427527)))

(declare-fun b!949538 () Bool)

(declare-fun res!636724 () Bool)

(assert (=> b!949538 (=> (not res!636724) (not e!534610))))

(assert (=> b!949538 (= res!636724 (= (getValueByKey!489 (toList!6118 lt!427527) (_1!6764 (ite (or c!99174 c!99172) (tuple2!13507 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))) (Some!494 (_2!6764 (ite (or c!99174 c!99172) (tuple2!13507 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))))

(declare-fun b!949539 () Bool)

(declare-fun contains!5216 (List!19305 tuple2!13506) Bool)

(assert (=> b!949539 (= e!534610 (contains!5216 (toList!6118 lt!427527) (ite (or c!99174 c!99172) (tuple2!13507 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5585 thiss!1141)) (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))

(assert (= (and d!115197 res!636725) b!949538))

(assert (= (and b!949538 res!636724) b!949539))

(declare-fun m!882657 () Bool)

(assert (=> d!115197 m!882657))

(declare-fun m!882659 () Bool)

(assert (=> d!115197 m!882659))

(declare-fun m!882661 () Bool)

(assert (=> d!115197 m!882661))

(declare-fun m!882663 () Bool)

(assert (=> d!115197 m!882663))

(declare-fun m!882665 () Bool)

(assert (=> b!949538 m!882665))

(declare-fun m!882667 () Bool)

(assert (=> b!949539 m!882667))

(assert (=> bm!41256 d!115197))

(declare-fun b!949551 () Bool)

(declare-fun e!534613 () Bool)

(assert (=> b!949551 (= e!534613 (and (bvsge (extraKeys!5481 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5481 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2502 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!949550 () Bool)

(declare-fun res!636737 () Bool)

(assert (=> b!949550 (=> (not res!636737) (not e!534613))))

(declare-fun size!28118 (LongMapFixedSize!4894) (_ BitVec 32))

(assert (=> b!949550 (= res!636737 (= (size!28118 thiss!1141) (bvadd (_size!2502 thiss!1141) (bvsdiv (bvadd (extraKeys!5481 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!949549 () Bool)

(declare-fun res!636735 () Bool)

(assert (=> b!949549 (=> (not res!636735) (not e!534613))))

(assert (=> b!949549 (= res!636735 (bvsge (size!28118 thiss!1141) (_size!2502 thiss!1141)))))

(declare-fun d!115199 () Bool)

(declare-fun res!636734 () Bool)

(assert (=> d!115199 (=> (not res!636734) (not e!534613))))

(assert (=> d!115199 (= res!636734 (validMask!0 (mask!27552 thiss!1141)))))

(assert (=> d!115199 (= (simpleValid!368 thiss!1141) e!534613)))

(declare-fun b!949548 () Bool)

(declare-fun res!636736 () Bool)

(assert (=> b!949548 (=> (not res!636736) (not e!534613))))

(assert (=> b!949548 (= res!636736 (and (= (size!28112 (_values!5772 thiss!1141)) (bvadd (mask!27552 thiss!1141) #b00000000000000000000000000000001)) (= (size!28113 (_keys!10696 thiss!1141)) (size!28112 (_values!5772 thiss!1141))) (bvsge (_size!2502 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2502 thiss!1141) (bvadd (mask!27552 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!115199 res!636734) b!949548))

(assert (= (and b!949548 res!636736) b!949549))

(assert (= (and b!949549 res!636735) b!949550))

(assert (= (and b!949550 res!636737) b!949551))

(declare-fun m!882669 () Bool)

(assert (=> b!949550 m!882669))

(assert (=> b!949549 m!882669))

(assert (=> d!115199 m!882485))

(assert (=> d!115171 d!115199))

(declare-fun d!115201 () Bool)

(declare-fun e!534614 () Bool)

(assert (=> d!115201 e!534614))

(declare-fun res!636739 () Bool)

(assert (=> d!115201 (=> (not res!636739) (not e!534614))))

(declare-fun lt!427531 () ListLongMap!12205)

(assert (=> d!115201 (= res!636739 (contains!5213 lt!427531 (_1!6764 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141)))))))

(declare-fun lt!427530 () List!19305)

(assert (=> d!115201 (= lt!427531 (ListLongMap!12206 lt!427530))))

(declare-fun lt!427529 () Unit!31934)

(declare-fun lt!427528 () Unit!31934)

(assert (=> d!115201 (= lt!427529 lt!427528)))

(assert (=> d!115201 (= (getValueByKey!489 lt!427530 (_1!6764 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141)))) (Some!494 (_2!6764 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141)))))))

(assert (=> d!115201 (= lt!427528 (lemmaContainsTupThenGetReturnValue!264 lt!427530 (_1!6764 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141))) (_2!6764 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141)))))))

(assert (=> d!115201 (= lt!427530 (insertStrictlySorted!321 (toList!6118 lt!427481) (_1!6764 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141))) (_2!6764 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141)))))))

(assert (=> d!115201 (= (+!2867 lt!427481 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141))) lt!427531)))

(declare-fun b!949552 () Bool)

(declare-fun res!636738 () Bool)

(assert (=> b!949552 (=> (not res!636738) (not e!534614))))

(assert (=> b!949552 (= res!636738 (= (getValueByKey!489 (toList!6118 lt!427531) (_1!6764 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141)))) (Some!494 (_2!6764 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141))))))))

(declare-fun b!949553 () Bool)

(assert (=> b!949553 (= e!534614 (contains!5216 (toList!6118 lt!427531) (tuple2!13507 lt!427485 (minValue!5585 thiss!1141))))))

(assert (= (and d!115201 res!636739) b!949552))

(assert (= (and b!949552 res!636738) b!949553))

(declare-fun m!882671 () Bool)

(assert (=> d!115201 m!882671))

(declare-fun m!882673 () Bool)

(assert (=> d!115201 m!882673))

(declare-fun m!882675 () Bool)

(assert (=> d!115201 m!882675))

(declare-fun m!882677 () Bool)

(assert (=> d!115201 m!882677))

(declare-fun m!882679 () Bool)

(assert (=> b!949552 m!882679))

(declare-fun m!882681 () Bool)

(assert (=> b!949553 m!882681))

(assert (=> b!949456 d!115201))

(declare-fun d!115203 () Bool)

(assert (=> d!115203 (= (apply!881 (+!2867 lt!427474 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141))) lt!427479) (get!14530 (getValueByKey!489 (toList!6118 (+!2867 lt!427474 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141)))) lt!427479)))))

(declare-fun bs!26673 () Bool)

(assert (= bs!26673 d!115203))

(declare-fun m!882683 () Bool)

(assert (=> bs!26673 m!882683))

(assert (=> bs!26673 m!882683))

(declare-fun m!882685 () Bool)

(assert (=> bs!26673 m!882685))

(assert (=> b!949456 d!115203))

(declare-fun d!115205 () Bool)

(assert (=> d!115205 (= (apply!881 (+!2867 lt!427481 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141))) lt!427490) (apply!881 lt!427481 lt!427490))))

(declare-fun lt!427534 () Unit!31934)

(declare-fun choose!1581 (ListLongMap!12205 (_ BitVec 64) V!32575 (_ BitVec 64)) Unit!31934)

(assert (=> d!115205 (= lt!427534 (choose!1581 lt!427481 lt!427485 (minValue!5585 thiss!1141) lt!427490))))

(declare-fun e!534617 () Bool)

(assert (=> d!115205 e!534617))

(declare-fun res!636742 () Bool)

(assert (=> d!115205 (=> (not res!636742) (not e!534617))))

(assert (=> d!115205 (= res!636742 (contains!5213 lt!427481 lt!427490))))

(assert (=> d!115205 (= (addApplyDifferent!451 lt!427481 lt!427485 (minValue!5585 thiss!1141) lt!427490) lt!427534)))

(declare-fun b!949557 () Bool)

(assert (=> b!949557 (= e!534617 (not (= lt!427490 lt!427485)))))

(assert (= (and d!115205 res!636742) b!949557))

(declare-fun m!882687 () Bool)

(assert (=> d!115205 m!882687))

(assert (=> d!115205 m!882583))

(assert (=> d!115205 m!882581))

(assert (=> d!115205 m!882589))

(assert (=> d!115205 m!882581))

(declare-fun m!882689 () Bool)

(assert (=> d!115205 m!882689))

(assert (=> b!949456 d!115205))

(declare-fun d!115207 () Bool)

(assert (=> d!115207 (= (apply!881 lt!427486 lt!427476) (get!14530 (getValueByKey!489 (toList!6118 lt!427486) lt!427476)))))

(declare-fun bs!26674 () Bool)

(assert (= bs!26674 d!115207))

(declare-fun m!882691 () Bool)

(assert (=> bs!26674 m!882691))

(assert (=> bs!26674 m!882691))

(declare-fun m!882693 () Bool)

(assert (=> bs!26674 m!882693))

(assert (=> b!949456 d!115207))

(declare-fun d!115209 () Bool)

(assert (=> d!115209 (= (apply!881 (+!2867 lt!427474 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141))) lt!427479) (apply!881 lt!427474 lt!427479))))

(declare-fun lt!427535 () Unit!31934)

(assert (=> d!115209 (= lt!427535 (choose!1581 lt!427474 lt!427473 (minValue!5585 thiss!1141) lt!427479))))

(declare-fun e!534618 () Bool)

(assert (=> d!115209 e!534618))

(declare-fun res!636743 () Bool)

(assert (=> d!115209 (=> (not res!636743) (not e!534618))))

(assert (=> d!115209 (= res!636743 (contains!5213 lt!427474 lt!427479))))

(assert (=> d!115209 (= (addApplyDifferent!451 lt!427474 lt!427473 (minValue!5585 thiss!1141) lt!427479) lt!427535)))

(declare-fun b!949558 () Bool)

(assert (=> b!949558 (= e!534618 (not (= lt!427479 lt!427473)))))

(assert (= (and d!115209 res!636743) b!949558))

(declare-fun m!882695 () Bool)

(assert (=> d!115209 m!882695))

(assert (=> d!115209 m!882577))

(assert (=> d!115209 m!882575))

(assert (=> d!115209 m!882587))

(assert (=> d!115209 m!882575))

(declare-fun m!882697 () Bool)

(assert (=> d!115209 m!882697))

(assert (=> b!949456 d!115209))

(declare-fun d!115211 () Bool)

(assert (=> d!115211 (= (apply!881 lt!427481 lt!427490) (get!14530 (getValueByKey!489 (toList!6118 lt!427481) lt!427490)))))

(declare-fun bs!26675 () Bool)

(assert (= bs!26675 d!115211))

(declare-fun m!882699 () Bool)

(assert (=> bs!26675 m!882699))

(assert (=> bs!26675 m!882699))

(declare-fun m!882701 () Bool)

(assert (=> bs!26675 m!882701))

(assert (=> b!949456 d!115211))

(declare-fun d!115213 () Bool)

(assert (=> d!115213 (= (apply!881 (+!2867 lt!427481 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141))) lt!427490) (get!14530 (getValueByKey!489 (toList!6118 (+!2867 lt!427481 (tuple2!13507 lt!427485 (minValue!5585 thiss!1141)))) lt!427490)))))

(declare-fun bs!26676 () Bool)

(assert (= bs!26676 d!115213))

(declare-fun m!882703 () Bool)

(assert (=> bs!26676 m!882703))

(assert (=> bs!26676 m!882703))

(declare-fun m!882705 () Bool)

(assert (=> bs!26676 m!882705))

(assert (=> b!949456 d!115213))

(declare-fun d!115215 () Bool)

(assert (=> d!115215 (= (apply!881 (+!2867 lt!427486 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141))) lt!427476) (apply!881 lt!427486 lt!427476))))

(declare-fun lt!427536 () Unit!31934)

(assert (=> d!115215 (= lt!427536 (choose!1581 lt!427486 lt!427475 (zeroValue!5585 thiss!1141) lt!427476))))

(declare-fun e!534619 () Bool)

(assert (=> d!115215 e!534619))

(declare-fun res!636744 () Bool)

(assert (=> d!115215 (=> (not res!636744) (not e!534619))))

(assert (=> d!115215 (= res!636744 (contains!5213 lt!427486 lt!427476))))

(assert (=> d!115215 (= (addApplyDifferent!451 lt!427486 lt!427475 (zeroValue!5585 thiss!1141) lt!427476) lt!427536)))

(declare-fun b!949559 () Bool)

(assert (=> b!949559 (= e!534619 (not (= lt!427476 lt!427475)))))

(assert (= (and d!115215 res!636744) b!949559))

(declare-fun m!882707 () Bool)

(assert (=> d!115215 m!882707))

(assert (=> d!115215 m!882563))

(assert (=> d!115215 m!882559))

(assert (=> d!115215 m!882585))

(assert (=> d!115215 m!882559))

(declare-fun m!882709 () Bool)

(assert (=> d!115215 m!882709))

(assert (=> b!949456 d!115215))

(declare-fun d!115217 () Bool)

(declare-fun e!534620 () Bool)

(assert (=> d!115217 e!534620))

(declare-fun res!636745 () Bool)

(assert (=> d!115217 (=> res!636745 e!534620)))

(declare-fun lt!427540 () Bool)

(assert (=> d!115217 (= res!636745 (not lt!427540))))

(declare-fun lt!427537 () Bool)

(assert (=> d!115217 (= lt!427540 lt!427537)))

(declare-fun lt!427539 () Unit!31934)

(declare-fun e!534621 () Unit!31934)

(assert (=> d!115217 (= lt!427539 e!534621)))

(declare-fun c!99196 () Bool)

(assert (=> d!115217 (= c!99196 lt!427537)))

(assert (=> d!115217 (= lt!427537 (containsKey!460 (toList!6118 (+!2867 lt!427472 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141)))) lt!427487))))

(assert (=> d!115217 (= (contains!5213 (+!2867 lt!427472 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141))) lt!427487) lt!427540)))

(declare-fun b!949560 () Bool)

(declare-fun lt!427538 () Unit!31934)

(assert (=> b!949560 (= e!534621 lt!427538)))

(assert (=> b!949560 (= lt!427538 (lemmaContainsKeyImpliesGetValueByKeyDefined!354 (toList!6118 (+!2867 lt!427472 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141)))) lt!427487))))

(assert (=> b!949560 (isDefined!362 (getValueByKey!489 (toList!6118 (+!2867 lt!427472 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141)))) lt!427487))))

(declare-fun b!949561 () Bool)

(declare-fun Unit!31940 () Unit!31934)

(assert (=> b!949561 (= e!534621 Unit!31940)))

(declare-fun b!949562 () Bool)

(assert (=> b!949562 (= e!534620 (isDefined!362 (getValueByKey!489 (toList!6118 (+!2867 lt!427472 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141)))) lt!427487)))))

(assert (= (and d!115217 c!99196) b!949560))

(assert (= (and d!115217 (not c!99196)) b!949561))

(assert (= (and d!115217 (not res!636745)) b!949562))

(declare-fun m!882711 () Bool)

(assert (=> d!115217 m!882711))

(declare-fun m!882713 () Bool)

(assert (=> b!949560 m!882713))

(declare-fun m!882715 () Bool)

(assert (=> b!949560 m!882715))

(assert (=> b!949560 m!882715))

(declare-fun m!882717 () Bool)

(assert (=> b!949560 m!882717))

(assert (=> b!949562 m!882715))

(assert (=> b!949562 m!882715))

(assert (=> b!949562 m!882717))

(assert (=> b!949456 d!115217))

(declare-fun d!115219 () Bool)

(declare-fun e!534622 () Bool)

(assert (=> d!115219 e!534622))

(declare-fun res!636747 () Bool)

(assert (=> d!115219 (=> (not res!636747) (not e!534622))))

(declare-fun lt!427544 () ListLongMap!12205)

(assert (=> d!115219 (= res!636747 (contains!5213 lt!427544 (_1!6764 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141)))))))

(declare-fun lt!427543 () List!19305)

(assert (=> d!115219 (= lt!427544 (ListLongMap!12206 lt!427543))))

(declare-fun lt!427542 () Unit!31934)

(declare-fun lt!427541 () Unit!31934)

(assert (=> d!115219 (= lt!427542 lt!427541)))

(assert (=> d!115219 (= (getValueByKey!489 lt!427543 (_1!6764 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141)))) (Some!494 (_2!6764 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141)))))))

(assert (=> d!115219 (= lt!427541 (lemmaContainsTupThenGetReturnValue!264 lt!427543 (_1!6764 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141))) (_2!6764 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141)))))))

(assert (=> d!115219 (= lt!427543 (insertStrictlySorted!321 (toList!6118 lt!427486) (_1!6764 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141))) (_2!6764 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141)))))))

(assert (=> d!115219 (= (+!2867 lt!427486 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141))) lt!427544)))

(declare-fun b!949563 () Bool)

(declare-fun res!636746 () Bool)

(assert (=> b!949563 (=> (not res!636746) (not e!534622))))

(assert (=> b!949563 (= res!636746 (= (getValueByKey!489 (toList!6118 lt!427544) (_1!6764 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141)))) (Some!494 (_2!6764 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141))))))))

(declare-fun b!949564 () Bool)

(assert (=> b!949564 (= e!534622 (contains!5216 (toList!6118 lt!427544) (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141))))))

(assert (= (and d!115219 res!636747) b!949563))

(assert (= (and b!949563 res!636746) b!949564))

(declare-fun m!882719 () Bool)

(assert (=> d!115219 m!882719))

(declare-fun m!882721 () Bool)

(assert (=> d!115219 m!882721))

(declare-fun m!882723 () Bool)

(assert (=> d!115219 m!882723))

(declare-fun m!882725 () Bool)

(assert (=> d!115219 m!882725))

(declare-fun m!882727 () Bool)

(assert (=> b!949563 m!882727))

(declare-fun m!882729 () Bool)

(assert (=> b!949564 m!882729))

(assert (=> b!949456 d!115219))

(declare-fun d!115221 () Bool)

(assert (=> d!115221 (contains!5213 (+!2867 lt!427472 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141))) lt!427487)))

(declare-fun lt!427547 () Unit!31934)

(declare-fun choose!1582 (ListLongMap!12205 (_ BitVec 64) V!32575 (_ BitVec 64)) Unit!31934)

(assert (=> d!115221 (= lt!427547 (choose!1582 lt!427472 lt!427484 (zeroValue!5585 thiss!1141) lt!427487))))

(assert (=> d!115221 (contains!5213 lt!427472 lt!427487)))

(assert (=> d!115221 (= (addStillContains!570 lt!427472 lt!427484 (zeroValue!5585 thiss!1141) lt!427487) lt!427547)))

(declare-fun bs!26677 () Bool)

(assert (= bs!26677 d!115221))

(assert (=> bs!26677 m!882571))

(assert (=> bs!26677 m!882571))

(assert (=> bs!26677 m!882579))

(declare-fun m!882731 () Bool)

(assert (=> bs!26677 m!882731))

(declare-fun m!882733 () Bool)

(assert (=> bs!26677 m!882733))

(assert (=> b!949456 d!115221))

(declare-fun d!115223 () Bool)

(assert (=> d!115223 (= (apply!881 lt!427474 lt!427479) (get!14530 (getValueByKey!489 (toList!6118 lt!427474) lt!427479)))))

(declare-fun bs!26678 () Bool)

(assert (= bs!26678 d!115223))

(declare-fun m!882735 () Bool)

(assert (=> bs!26678 m!882735))

(assert (=> bs!26678 m!882735))

(declare-fun m!882737 () Bool)

(assert (=> bs!26678 m!882737))

(assert (=> b!949456 d!115223))

(declare-fun d!115225 () Bool)

(assert (=> d!115225 (= (apply!881 (+!2867 lt!427486 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141))) lt!427476) (get!14530 (getValueByKey!489 (toList!6118 (+!2867 lt!427486 (tuple2!13507 lt!427475 (zeroValue!5585 thiss!1141)))) lt!427476)))))

(declare-fun bs!26679 () Bool)

(assert (= bs!26679 d!115225))

(declare-fun m!882739 () Bool)

(assert (=> bs!26679 m!882739))

(assert (=> bs!26679 m!882739))

(declare-fun m!882741 () Bool)

(assert (=> bs!26679 m!882741))

(assert (=> b!949456 d!115225))

(declare-fun d!115227 () Bool)

(declare-fun e!534623 () Bool)

(assert (=> d!115227 e!534623))

(declare-fun res!636749 () Bool)

(assert (=> d!115227 (=> (not res!636749) (not e!534623))))

(declare-fun lt!427551 () ListLongMap!12205)

(assert (=> d!115227 (= res!636749 (contains!5213 lt!427551 (_1!6764 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141)))))))

(declare-fun lt!427550 () List!19305)

(assert (=> d!115227 (= lt!427551 (ListLongMap!12206 lt!427550))))

(declare-fun lt!427549 () Unit!31934)

(declare-fun lt!427548 () Unit!31934)

(assert (=> d!115227 (= lt!427549 lt!427548)))

(assert (=> d!115227 (= (getValueByKey!489 lt!427550 (_1!6764 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141)))) (Some!494 (_2!6764 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141)))))))

(assert (=> d!115227 (= lt!427548 (lemmaContainsTupThenGetReturnValue!264 lt!427550 (_1!6764 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141))) (_2!6764 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141)))))))

(assert (=> d!115227 (= lt!427550 (insertStrictlySorted!321 (toList!6118 lt!427472) (_1!6764 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141))) (_2!6764 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141)))))))

(assert (=> d!115227 (= (+!2867 lt!427472 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141))) lt!427551)))

(declare-fun b!949566 () Bool)

(declare-fun res!636748 () Bool)

(assert (=> b!949566 (=> (not res!636748) (not e!534623))))

(assert (=> b!949566 (= res!636748 (= (getValueByKey!489 (toList!6118 lt!427551) (_1!6764 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141)))) (Some!494 (_2!6764 (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141))))))))

(declare-fun b!949567 () Bool)

(assert (=> b!949567 (= e!534623 (contains!5216 (toList!6118 lt!427551) (tuple2!13507 lt!427484 (zeroValue!5585 thiss!1141))))))

(assert (= (and d!115227 res!636749) b!949566))

(assert (= (and b!949566 res!636748) b!949567))

(declare-fun m!882743 () Bool)

(assert (=> d!115227 m!882743))

(declare-fun m!882745 () Bool)

(assert (=> d!115227 m!882745))

(declare-fun m!882747 () Bool)

(assert (=> d!115227 m!882747))

(declare-fun m!882749 () Bool)

(assert (=> d!115227 m!882749))

(declare-fun m!882751 () Bool)

(assert (=> b!949566 m!882751))

(declare-fun m!882753 () Bool)

(assert (=> b!949567 m!882753))

(assert (=> b!949456 d!115227))

(declare-fun b!949592 () Bool)

(declare-fun lt!427568 () Unit!31934)

(declare-fun lt!427566 () Unit!31934)

(assert (=> b!949592 (= lt!427568 lt!427566)))

(declare-fun lt!427572 () (_ BitVec 64))

(declare-fun lt!427570 () V!32575)

(declare-fun lt!427569 () ListLongMap!12205)

(declare-fun lt!427567 () (_ BitVec 64))

(assert (=> b!949592 (not (contains!5213 (+!2867 lt!427569 (tuple2!13507 lt!427567 lt!427570)) lt!427572))))

(declare-fun addStillNotContains!226 (ListLongMap!12205 (_ BitVec 64) V!32575 (_ BitVec 64)) Unit!31934)

(assert (=> b!949592 (= lt!427566 (addStillNotContains!226 lt!427569 lt!427567 lt!427570 lt!427572))))

(assert (=> b!949592 (= lt!427572 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!949592 (= lt!427570 (get!14529 (select (arr!27637 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1664 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!949592 (= lt!427567 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun call!41274 () ListLongMap!12205)

(assert (=> b!949592 (= lt!427569 call!41274)))

(declare-fun e!534642 () ListLongMap!12205)

(assert (=> b!949592 (= e!534642 (+!2867 call!41274 (tuple2!13507 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000) (get!14529 (select (arr!27637 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1664 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!949593 () Bool)

(declare-fun e!534639 () Bool)

(declare-fun e!534638 () Bool)

(assert (=> b!949593 (= e!534639 e!534638)))

(declare-fun c!99207 () Bool)

(declare-fun e!534640 () Bool)

(assert (=> b!949593 (= c!99207 e!534640)))

(declare-fun res!636760 () Bool)

(assert (=> b!949593 (=> (not res!636760) (not e!534640))))

(assert (=> b!949593 (= res!636760 (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))))))

(declare-fun b!949594 () Bool)

(assert (=> b!949594 (= e!534642 call!41274)))

(declare-fun b!949595 () Bool)

(assert (=> b!949595 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))))))

(assert (=> b!949595 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28112 (_values!5772 thiss!1141))))))

(declare-fun e!534644 () Bool)

(declare-fun lt!427571 () ListLongMap!12205)

(assert (=> b!949595 (= e!534644 (= (apply!881 lt!427571 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)) (get!14529 (select (arr!27637 (_values!5772 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1664 (defaultEntry!5749 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949596 () Bool)

(declare-fun e!534641 () ListLongMap!12205)

(assert (=> b!949596 (= e!534641 (ListLongMap!12206 Nil!19302))))

(declare-fun b!949597 () Bool)

(assert (=> b!949597 (= e!534641 e!534642)))

(declare-fun c!99205 () Bool)

(assert (=> b!949597 (= c!99205 (validKeyInArray!0 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949598 () Bool)

(declare-fun e!534643 () Bool)

(assert (=> b!949598 (= e!534638 e!534643)))

(declare-fun c!99208 () Bool)

(assert (=> b!949598 (= c!99208 (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))))))

(declare-fun b!949599 () Bool)

(assert (=> b!949599 (= e!534640 (validKeyInArray!0 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949599 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!949600 () Bool)

(declare-fun res!636759 () Bool)

(assert (=> b!949600 (=> (not res!636759) (not e!534639))))

(assert (=> b!949600 (= res!636759 (not (contains!5213 lt!427571 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949601 () Bool)

(declare-fun isEmpty!712 (ListLongMap!12205) Bool)

(assert (=> b!949601 (= e!534643 (isEmpty!712 lt!427571))))

(declare-fun b!949602 () Bool)

(assert (=> b!949602 (= e!534638 e!534644)))

(assert (=> b!949602 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))))))

(declare-fun res!636761 () Bool)

(assert (=> b!949602 (= res!636761 (contains!5213 lt!427571 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949602 (=> (not res!636761) (not e!534644))))

(declare-fun b!949603 () Bool)

(assert (=> b!949603 (= e!534643 (= lt!427571 (getCurrentListMapNoExtraKeys!3355 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5749 thiss!1141))))))

(declare-fun d!115229 () Bool)

(assert (=> d!115229 e!534639))

(declare-fun res!636758 () Bool)

(assert (=> d!115229 (=> (not res!636758) (not e!534639))))

(assert (=> d!115229 (= res!636758 (not (contains!5213 lt!427571 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!115229 (= lt!427571 e!534641)))

(declare-fun c!99206 () Bool)

(assert (=> d!115229 (= c!99206 (bvsge #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))))))

(assert (=> d!115229 (validMask!0 (mask!27552 thiss!1141))))

(assert (=> d!115229 (= (getCurrentListMapNoExtraKeys!3355 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)) lt!427571)))

(declare-fun bm!41271 () Bool)

(assert (=> bm!41271 (= call!41274 (getCurrentListMapNoExtraKeys!3355 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5749 thiss!1141)))))

(assert (= (and d!115229 c!99206) b!949596))

(assert (= (and d!115229 (not c!99206)) b!949597))

(assert (= (and b!949597 c!99205) b!949592))

(assert (= (and b!949597 (not c!99205)) b!949594))

(assert (= (or b!949592 b!949594) bm!41271))

(assert (= (and d!115229 res!636758) b!949600))

(assert (= (and b!949600 res!636759) b!949593))

(assert (= (and b!949593 res!636760) b!949599))

(assert (= (and b!949593 c!99207) b!949602))

(assert (= (and b!949593 (not c!99207)) b!949598))

(assert (= (and b!949602 res!636761) b!949595))

(assert (= (and b!949598 c!99208) b!949603))

(assert (= (and b!949598 (not c!99208)) b!949601))

(declare-fun b_lambda!14337 () Bool)

(assert (=> (not b_lambda!14337) (not b!949592)))

(assert (=> b!949592 t!27627))

(declare-fun b_and!29649 () Bool)

(assert (= b_and!29647 (and (=> t!27627 result!12251) b_and!29649)))

(declare-fun b_lambda!14339 () Bool)

(assert (=> (not b_lambda!14339) (not b!949595)))

(assert (=> b!949595 t!27627))

(declare-fun b_and!29651 () Bool)

(assert (= b_and!29649 (and (=> t!27627 result!12251) b_and!29651)))

(assert (=> b!949592 m!882551))

(assert (=> b!949592 m!882549))

(assert (=> b!949592 m!882553))

(declare-fun m!882755 () Bool)

(assert (=> b!949592 m!882755))

(assert (=> b!949592 m!882549))

(assert (=> b!949592 m!882555))

(assert (=> b!949592 m!882551))

(declare-fun m!882757 () Bool)

(assert (=> b!949592 m!882757))

(assert (=> b!949592 m!882757))

(declare-fun m!882759 () Bool)

(assert (=> b!949592 m!882759))

(declare-fun m!882761 () Bool)

(assert (=> b!949592 m!882761))

(declare-fun m!882763 () Bool)

(assert (=> d!115229 m!882763))

(assert (=> d!115229 m!882485))

(declare-fun m!882765 () Bool)

(assert (=> b!949603 m!882765))

(assert (=> b!949597 m!882555))

(assert (=> b!949597 m!882555))

(assert (=> b!949597 m!882599))

(assert (=> bm!41271 m!882765))

(declare-fun m!882767 () Bool)

(assert (=> b!949601 m!882767))

(assert (=> b!949599 m!882555))

(assert (=> b!949599 m!882555))

(assert (=> b!949599 m!882599))

(assert (=> b!949602 m!882555))

(assert (=> b!949602 m!882555))

(declare-fun m!882769 () Bool)

(assert (=> b!949602 m!882769))

(assert (=> b!949595 m!882551))

(assert (=> b!949595 m!882549))

(assert (=> b!949595 m!882553))

(assert (=> b!949595 m!882549))

(assert (=> b!949595 m!882555))

(assert (=> b!949595 m!882551))

(assert (=> b!949595 m!882555))

(declare-fun m!882771 () Bool)

(assert (=> b!949595 m!882771))

(declare-fun m!882773 () Bool)

(assert (=> b!949600 m!882773))

(assert (=> b!949456 d!115229))

(declare-fun d!115231 () Bool)

(declare-fun e!534645 () Bool)

(assert (=> d!115231 e!534645))

(declare-fun res!636763 () Bool)

(assert (=> d!115231 (=> (not res!636763) (not e!534645))))

(declare-fun lt!427576 () ListLongMap!12205)

(assert (=> d!115231 (= res!636763 (contains!5213 lt!427576 (_1!6764 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141)))))))

(declare-fun lt!427575 () List!19305)

(assert (=> d!115231 (= lt!427576 (ListLongMap!12206 lt!427575))))

(declare-fun lt!427574 () Unit!31934)

(declare-fun lt!427573 () Unit!31934)

(assert (=> d!115231 (= lt!427574 lt!427573)))

(assert (=> d!115231 (= (getValueByKey!489 lt!427575 (_1!6764 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141)))) (Some!494 (_2!6764 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141)))))))

(assert (=> d!115231 (= lt!427573 (lemmaContainsTupThenGetReturnValue!264 lt!427575 (_1!6764 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141))) (_2!6764 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141)))))))

(assert (=> d!115231 (= lt!427575 (insertStrictlySorted!321 (toList!6118 lt!427474) (_1!6764 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141))) (_2!6764 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141)))))))

(assert (=> d!115231 (= (+!2867 lt!427474 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141))) lt!427576)))

(declare-fun b!949604 () Bool)

(declare-fun res!636762 () Bool)

(assert (=> b!949604 (=> (not res!636762) (not e!534645))))

(assert (=> b!949604 (= res!636762 (= (getValueByKey!489 (toList!6118 lt!427576) (_1!6764 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141)))) (Some!494 (_2!6764 (tuple2!13507 lt!427473 (minValue!5585 thiss!1141))))))))

(declare-fun b!949605 () Bool)

(assert (=> b!949605 (= e!534645 (contains!5216 (toList!6118 lt!427576) (tuple2!13507 lt!427473 (minValue!5585 thiss!1141))))))

(assert (= (and d!115231 res!636763) b!949604))

(assert (= (and b!949604 res!636762) b!949605))

(declare-fun m!882775 () Bool)

(assert (=> d!115231 m!882775))

(declare-fun m!882777 () Bool)

(assert (=> d!115231 m!882777))

(declare-fun m!882779 () Bool)

(assert (=> d!115231 m!882779))

(declare-fun m!882781 () Bool)

(assert (=> d!115231 m!882781))

(declare-fun m!882783 () Bool)

(assert (=> b!949604 m!882783))

(declare-fun m!882785 () Bool)

(assert (=> b!949605 m!882785))

(assert (=> b!949456 d!115231))

(declare-fun bm!41274 () Bool)

(declare-fun call!41277 () (_ BitVec 32))

(assert (=> bm!41274 (= call!41277 (arrayCountValidKeys!0 (_keys!10696 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28113 (_keys!10696 thiss!1141))))))

(declare-fun b!949614 () Bool)

(declare-fun e!534650 () (_ BitVec 32))

(assert (=> b!949614 (= e!534650 call!41277)))

(declare-fun b!949615 () Bool)

(declare-fun e!534651 () (_ BitVec 32))

(assert (=> b!949615 (= e!534651 e!534650)))

(declare-fun c!99213 () Bool)

(assert (=> b!949615 (= c!99213 (validKeyInArray!0 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949616 () Bool)

(assert (=> b!949616 (= e!534650 (bvadd #b00000000000000000000000000000001 call!41277))))

(declare-fun b!949617 () Bool)

(assert (=> b!949617 (= e!534651 #b00000000000000000000000000000000)))

(declare-fun d!115233 () Bool)

(declare-fun lt!427579 () (_ BitVec 32))

(assert (=> d!115233 (and (bvsge lt!427579 #b00000000000000000000000000000000) (bvsle lt!427579 (bvsub (size!28113 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115233 (= lt!427579 e!534651)))

(declare-fun c!99214 () Bool)

(assert (=> d!115233 (= c!99214 (bvsge #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))))))

(assert (=> d!115233 (and (bvsle #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28113 (_keys!10696 thiss!1141)) (size!28113 (_keys!10696 thiss!1141))))))

(assert (=> d!115233 (= (arrayCountValidKeys!0 (_keys!10696 thiss!1141) #b00000000000000000000000000000000 (size!28113 (_keys!10696 thiss!1141))) lt!427579)))

(assert (= (and d!115233 c!99214) b!949617))

(assert (= (and d!115233 (not c!99214)) b!949615))

(assert (= (and b!949615 c!99213) b!949616))

(assert (= (and b!949615 (not c!99213)) b!949614))

(assert (= (or b!949616 b!949614) bm!41274))

(declare-fun m!882787 () Bool)

(assert (=> bm!41274 m!882787))

(assert (=> b!949615 m!882555))

(assert (=> b!949615 m!882555))

(assert (=> b!949615 m!882599))

(assert (=> b!949386 d!115233))

(declare-fun d!115235 () Bool)

(declare-fun e!534652 () Bool)

(assert (=> d!115235 e!534652))

(declare-fun res!636765 () Bool)

(assert (=> d!115235 (=> (not res!636765) (not e!534652))))

(declare-fun lt!427583 () ListLongMap!12205)

(assert (=> d!115235 (= res!636765 (contains!5213 lt!427583 (_1!6764 (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))

(declare-fun lt!427582 () List!19305)

(assert (=> d!115235 (= lt!427583 (ListLongMap!12206 lt!427582))))

(declare-fun lt!427581 () Unit!31934)

(declare-fun lt!427580 () Unit!31934)

(assert (=> d!115235 (= lt!427581 lt!427580)))

(assert (=> d!115235 (= (getValueByKey!489 lt!427582 (_1!6764 (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))) (Some!494 (_2!6764 (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))

(assert (=> d!115235 (= lt!427580 (lemmaContainsTupThenGetReturnValue!264 lt!427582 (_1!6764 (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))) (_2!6764 (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))

(assert (=> d!115235 (= lt!427582 (insertStrictlySorted!321 (toList!6118 call!41264) (_1!6764 (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))) (_2!6764 (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))))))

(assert (=> d!115235 (= (+!2867 call!41264 (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))) lt!427583)))

(declare-fun b!949618 () Bool)

(declare-fun res!636764 () Bool)

(assert (=> b!949618 (=> (not res!636764) (not e!534652))))

(assert (=> b!949618 (= res!636764 (= (getValueByKey!489 (toList!6118 lt!427583) (_1!6764 (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141)))) (Some!494 (_2!6764 (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))))

(declare-fun b!949619 () Bool)

(assert (=> b!949619 (= e!534652 (contains!5216 (toList!6118 lt!427583) (tuple2!13507 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5585 thiss!1141))))))

(assert (= (and d!115235 res!636765) b!949618))

(assert (= (and b!949618 res!636764) b!949619))

(declare-fun m!882789 () Bool)

(assert (=> d!115235 m!882789))

(declare-fun m!882791 () Bool)

(assert (=> d!115235 m!882791))

(declare-fun m!882793 () Bool)

(assert (=> d!115235 m!882793))

(declare-fun m!882795 () Bool)

(assert (=> d!115235 m!882795))

(declare-fun m!882797 () Bool)

(assert (=> b!949618 m!882797))

(declare-fun m!882799 () Bool)

(assert (=> b!949619 m!882799))

(assert (=> b!949448 d!115235))

(assert (=> d!115175 d!115169))

(declare-fun d!115237 () Bool)

(declare-fun isEmpty!713 (Option!495) Bool)

(assert (=> d!115237 (= (isDefined!362 (getValueByKey!489 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756)) (not (isEmpty!713 (getValueByKey!489 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))))

(declare-fun bs!26680 () Bool)

(assert (= bs!26680 d!115237))

(assert (=> bs!26680 m!882545))

(declare-fun m!882801 () Bool)

(assert (=> bs!26680 m!882801))

(assert (=> b!949397 d!115237))

(declare-fun d!115239 () Bool)

(declare-fun c!99219 () Bool)

(assert (=> d!115239 (= c!99219 (and ((_ is Cons!19301) (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))) (= (_1!6764 (h!20464 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))))) key!756)))))

(declare-fun e!534657 () Option!495)

(assert (=> d!115239 (= (getValueByKey!489 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756) e!534657)))

(declare-fun b!949628 () Bool)

(assert (=> b!949628 (= e!534657 (Some!494 (_2!6764 (h!20464 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))))))

(declare-fun b!949630 () Bool)

(declare-fun e!534658 () Option!495)

(assert (=> b!949630 (= e!534658 (getValueByKey!489 (t!27624 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))) key!756))))

(declare-fun b!949631 () Bool)

(assert (=> b!949631 (= e!534658 None!493)))

(declare-fun b!949629 () Bool)

(assert (=> b!949629 (= e!534657 e!534658)))

(declare-fun c!99220 () Bool)

(assert (=> b!949629 (= c!99220 (and ((_ is Cons!19301) (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))) (not (= (_1!6764 (h!20464 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))))) key!756))))))

(assert (= (and d!115239 c!99219) b!949628))

(assert (= (and d!115239 (not c!99219)) b!949629))

(assert (= (and b!949629 c!99220) b!949630))

(assert (= (and b!949629 (not c!99220)) b!949631))

(declare-fun m!882803 () Bool)

(assert (=> b!949630 m!882803))

(assert (=> b!949397 d!115239))

(assert (=> bm!41262 d!115229))

(declare-fun b!949650 () Bool)

(declare-fun e!534672 () Bool)

(declare-fun e!534673 () Bool)

(assert (=> b!949650 (= e!534672 e!534673)))

(declare-fun res!636773 () Bool)

(declare-fun lt!427589 () SeekEntryResult!9088)

(assert (=> b!949650 (= res!636773 (and ((_ is Intermediate!9088) lt!427589) (not (undefined!9900 lt!427589)) (bvslt (x!81580 lt!427589) #b01111111111111111111111111111110) (bvsge (x!81580 lt!427589) #b00000000000000000000000000000000) (bvsge (x!81580 lt!427589) #b00000000000000000000000000000000)))))

(assert (=> b!949650 (=> (not res!636773) (not e!534673))))

(declare-fun b!949652 () Bool)

(declare-fun e!534669 () SeekEntryResult!9088)

(declare-fun e!534670 () SeekEntryResult!9088)

(assert (=> b!949652 (= e!534669 e!534670)))

(declare-fun c!99228 () Bool)

(declare-fun lt!427588 () (_ BitVec 64))

(assert (=> b!949652 (= c!99228 (or (= lt!427588 key!756) (= (bvadd lt!427588 lt!427588) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949653 () Bool)

(assert (=> b!949653 (and (bvsge (index!38725 lt!427589) #b00000000000000000000000000000000) (bvslt (index!38725 lt!427589) (size!28113 (_keys!10696 thiss!1141))))))

(declare-fun res!636772 () Bool)

(assert (=> b!949653 (= res!636772 (= (select (arr!27638 (_keys!10696 thiss!1141)) (index!38725 lt!427589)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534671 () Bool)

(assert (=> b!949653 (=> res!636772 e!534671)))

(declare-fun b!949654 () Bool)

(assert (=> b!949654 (= e!534670 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27552 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27552 thiss!1141)) key!756 (_keys!10696 thiss!1141) (mask!27552 thiss!1141)))))

(declare-fun b!949655 () Bool)

(assert (=> b!949655 (= e!534670 (Intermediate!9088 false (toIndex!0 key!756 (mask!27552 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!949656 () Bool)

(assert (=> b!949656 (and (bvsge (index!38725 lt!427589) #b00000000000000000000000000000000) (bvslt (index!38725 lt!427589) (size!28113 (_keys!10696 thiss!1141))))))

(declare-fun res!636774 () Bool)

(assert (=> b!949656 (= res!636774 (= (select (arr!27638 (_keys!10696 thiss!1141)) (index!38725 lt!427589)) key!756))))

(assert (=> b!949656 (=> res!636774 e!534671)))

(assert (=> b!949656 (= e!534673 e!534671)))

(declare-fun b!949657 () Bool)

(assert (=> b!949657 (= e!534669 (Intermediate!9088 true (toIndex!0 key!756 (mask!27552 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!949658 () Bool)

(assert (=> b!949658 (and (bvsge (index!38725 lt!427589) #b00000000000000000000000000000000) (bvslt (index!38725 lt!427589) (size!28113 (_keys!10696 thiss!1141))))))

(assert (=> b!949658 (= e!534671 (= (select (arr!27638 (_keys!10696 thiss!1141)) (index!38725 lt!427589)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!115241 () Bool)

(assert (=> d!115241 e!534672))

(declare-fun c!99227 () Bool)

(assert (=> d!115241 (= c!99227 (and ((_ is Intermediate!9088) lt!427589) (undefined!9900 lt!427589)))))

(assert (=> d!115241 (= lt!427589 e!534669)))

(declare-fun c!99229 () Bool)

(assert (=> d!115241 (= c!99229 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!115241 (= lt!427588 (select (arr!27638 (_keys!10696 thiss!1141)) (toIndex!0 key!756 (mask!27552 thiss!1141))))))

(assert (=> d!115241 (validMask!0 (mask!27552 thiss!1141))))

(assert (=> d!115241 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27552 thiss!1141)) key!756 (_keys!10696 thiss!1141) (mask!27552 thiss!1141)) lt!427589)))

(declare-fun b!949651 () Bool)

(assert (=> b!949651 (= e!534672 (bvsge (x!81580 lt!427589) #b01111111111111111111111111111110))))

(assert (= (and d!115241 c!99229) b!949657))

(assert (= (and d!115241 (not c!99229)) b!949652))

(assert (= (and b!949652 c!99228) b!949655))

(assert (= (and b!949652 (not c!99228)) b!949654))

(assert (= (and d!115241 c!99227) b!949651))

(assert (= (and d!115241 (not c!99227)) b!949650))

(assert (= (and b!949650 res!636773) b!949656))

(assert (= (and b!949656 (not res!636774)) b!949653))

(assert (= (and b!949653 (not res!636772)) b!949658))

(declare-fun m!882805 () Bool)

(assert (=> b!949656 m!882805))

(assert (=> b!949653 m!882805))

(assert (=> d!115241 m!882525))

(declare-fun m!882807 () Bool)

(assert (=> d!115241 m!882807))

(assert (=> d!115241 m!882485))

(assert (=> b!949658 m!882805))

(assert (=> b!949654 m!882525))

(declare-fun m!882809 () Bool)

(assert (=> b!949654 m!882809))

(assert (=> b!949654 m!882809))

(declare-fun m!882811 () Bool)

(assert (=> b!949654 m!882811))

(assert (=> d!115167 d!115241))

(declare-fun d!115243 () Bool)

(declare-fun lt!427595 () (_ BitVec 32))

(declare-fun lt!427594 () (_ BitVec 32))

(assert (=> d!115243 (= lt!427595 (bvmul (bvxor lt!427594 (bvlshr lt!427594 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!115243 (= lt!427594 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!115243 (and (bvsge (mask!27552 thiss!1141) #b00000000000000000000000000000000) (let ((res!636775 (let ((h!20467 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81599 (bvmul (bvxor h!20467 (bvlshr h!20467 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81599 (bvlshr x!81599 #b00000000000000000000000000001101)) (mask!27552 thiss!1141)))))) (and (bvslt res!636775 (bvadd (mask!27552 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!636775 #b00000000000000000000000000000000))))))

(assert (=> d!115243 (= (toIndex!0 key!756 (mask!27552 thiss!1141)) (bvand (bvxor lt!427595 (bvlshr lt!427595 #b00000000000000000000000000001101)) (mask!27552 thiss!1141)))))

(assert (=> d!115167 d!115243))

(assert (=> d!115167 d!115169))

(declare-fun d!115245 () Bool)

(assert (=> d!115245 (= (apply!881 lt!427482 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14530 (getValueByKey!489 (toList!6118 lt!427482) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26681 () Bool)

(assert (= bs!26681 d!115245))

(assert (=> bs!26681 m!882621))

(assert (=> bs!26681 m!882621))

(declare-fun m!882813 () Bool)

(assert (=> bs!26681 m!882813))

(assert (=> b!949451 d!115245))

(declare-fun d!115247 () Bool)

(assert (=> d!115247 (isDefined!362 (getValueByKey!489 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))

(declare-fun lt!427598 () Unit!31934)

(declare-fun choose!1583 (List!19305 (_ BitVec 64)) Unit!31934)

(assert (=> d!115247 (= lt!427598 (choose!1583 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))

(declare-fun e!534676 () Bool)

(assert (=> d!115247 e!534676))

(declare-fun res!636778 () Bool)

(assert (=> d!115247 (=> (not res!636778) (not e!534676))))

(declare-fun isStrictlySorted!497 (List!19305) Bool)

(assert (=> d!115247 (= res!636778 (isStrictlySorted!497 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141)))))))

(assert (=> d!115247 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!354 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756) lt!427598)))

(declare-fun b!949661 () Bool)

(assert (=> b!949661 (= e!534676 (containsKey!460 (toList!6118 (getCurrentListMap!3351 (_keys!10696 thiss!1141) (_values!5772 thiss!1141) (mask!27552 thiss!1141) (extraKeys!5481 thiss!1141) (zeroValue!5585 thiss!1141) (minValue!5585 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5749 thiss!1141))) key!756))))

(assert (= (and d!115247 res!636778) b!949661))

(assert (=> d!115247 m!882545))

(assert (=> d!115247 m!882545))

(assert (=> d!115247 m!882547))

(declare-fun m!882815 () Bool)

(assert (=> d!115247 m!882815))

(declare-fun m!882817 () Bool)

(assert (=> d!115247 m!882817))

(assert (=> b!949661 m!882541))

(assert (=> b!949395 d!115247))

(assert (=> b!949395 d!115237))

(assert (=> b!949395 d!115239))

(declare-fun d!115249 () Bool)

(declare-fun e!534677 () Bool)

(assert (=> d!115249 e!534677))

(declare-fun res!636779 () Bool)

(assert (=> d!115249 (=> res!636779 e!534677)))

(declare-fun lt!427602 () Bool)

(assert (=> d!115249 (= res!636779 (not lt!427602))))

(declare-fun lt!427599 () Bool)

(assert (=> d!115249 (= lt!427602 lt!427599)))

(declare-fun lt!427601 () Unit!31934)

(declare-fun e!534678 () Unit!31934)

(assert (=> d!115249 (= lt!427601 e!534678)))

(declare-fun c!99230 () Bool)

(assert (=> d!115249 (= c!99230 lt!427599)))

(assert (=> d!115249 (= lt!427599 (containsKey!460 (toList!6118 lt!427482) (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115249 (= (contains!5213 lt!427482 (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)) lt!427602)))

(declare-fun b!949662 () Bool)

(declare-fun lt!427600 () Unit!31934)

(assert (=> b!949662 (= e!534678 lt!427600)))

(assert (=> b!949662 (= lt!427600 (lemmaContainsKeyImpliesGetValueByKeyDefined!354 (toList!6118 lt!427482) (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949662 (isDefined!362 (getValueByKey!489 (toList!6118 lt!427482) (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949663 () Bool)

(declare-fun Unit!31941 () Unit!31934)

(assert (=> b!949663 (= e!534678 Unit!31941)))

(declare-fun b!949664 () Bool)

(assert (=> b!949664 (= e!534677 (isDefined!362 (getValueByKey!489 (toList!6118 lt!427482) (select (arr!27638 (_keys!10696 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!115249 c!99230) b!949662))

(assert (= (and d!115249 (not c!99230)) b!949663))

(assert (= (and d!115249 (not res!636779)) b!949664))

(assert (=> d!115249 m!882555))

(declare-fun m!882819 () Bool)

(assert (=> d!115249 m!882819))

(assert (=> b!949662 m!882555))

(declare-fun m!882821 () Bool)

(assert (=> b!949662 m!882821))

(assert (=> b!949662 m!882555))

(assert (=> b!949662 m!882637))

(assert (=> b!949662 m!882637))

(declare-fun m!882823 () Bool)

(assert (=> b!949662 m!882823))

(assert (=> b!949664 m!882555))

(assert (=> b!949664 m!882637))

(assert (=> b!949664 m!882637))

(assert (=> b!949664 m!882823))

(assert (=> b!949444 d!115249))

(declare-fun mapNonEmpty!32961 () Bool)

(declare-fun mapRes!32961 () Bool)

(declare-fun tp!63189 () Bool)

(declare-fun e!534679 () Bool)

(assert (=> mapNonEmpty!32961 (= mapRes!32961 (and tp!63189 e!534679))))

(declare-fun mapRest!32961 () (Array (_ BitVec 32) ValueCell!9872))

(declare-fun mapKey!32961 () (_ BitVec 32))

(declare-fun mapValue!32961 () ValueCell!9872)

(assert (=> mapNonEmpty!32961 (= mapRest!32960 (store mapRest!32961 mapKey!32961 mapValue!32961))))

(declare-fun mapIsEmpty!32961 () Bool)

(assert (=> mapIsEmpty!32961 mapRes!32961))

(declare-fun b!949666 () Bool)

(declare-fun e!534680 () Bool)

(assert (=> b!949666 (= e!534680 tp_is_empty!20707)))

(declare-fun b!949665 () Bool)

(assert (=> b!949665 (= e!534679 tp_is_empty!20707)))

(declare-fun condMapEmpty!32961 () Bool)

(declare-fun mapDefault!32961 () ValueCell!9872)

(assert (=> mapNonEmpty!32960 (= condMapEmpty!32961 (= mapRest!32960 ((as const (Array (_ BitVec 32) ValueCell!9872)) mapDefault!32961)))))

(assert (=> mapNonEmpty!32960 (= tp!63188 (and e!534680 mapRes!32961))))

(assert (= (and mapNonEmpty!32960 condMapEmpty!32961) mapIsEmpty!32961))

(assert (= (and mapNonEmpty!32960 (not condMapEmpty!32961)) mapNonEmpty!32961))

(assert (= (and mapNonEmpty!32961 ((_ is ValueCellFull!9872) mapValue!32961)) b!949665))

(assert (= (and mapNonEmpty!32960 ((_ is ValueCellFull!9872) mapDefault!32961)) b!949666))

(declare-fun m!882825 () Bool)

(assert (=> mapNonEmpty!32961 m!882825))

(declare-fun b_lambda!14341 () Bool)

(assert (= b_lambda!14337 (or (and b!949307 b_free!18199) b_lambda!14341)))

(declare-fun b_lambda!14343 () Bool)

(assert (= b_lambda!14339 (or (and b!949307 b_free!18199) b_lambda!14343)))

(check-sat (not bm!41268) (not b!949494) (not bm!41271) (not d!115215) (not d!115197) (not b!949552) (not b!949513) (not b!949661) (not b!949474) (not d!115203) (not b!949654) (not b!949499) (not b_lambda!14341) (not b!949473) (not b!949601) (not b!949482) (not d!115179) (not b!949600) (not b!949471) (not d!115213) (not b!949553) (not d!115231) (not d!115247) (not b!949605) (not b!949619) (not b!949603) (not b!949567) (not b!949602) (not d!115241) (not d!115201) (not d!115237) (not mapNonEmpty!32961) (not b!949492) (not d!115183) tp_is_empty!20707 (not b!949511) (not d!115199) (not d!115249) (not d!115211) (not d!115225) (not b!949618) b_and!29651 (not b!949560) (not b!949500) (not d!115221) (not d!115229) (not b!949476) (not d!115177) (not b!949595) (not d!115219) (not b!949604) (not b!949599) (not b!949549) (not bm!41265) (not b!949562) (not d!115227) (not b!949592) (not d!115193) (not bm!41274) (not b!949539) (not b_next!18199) (not b!949564) (not d!115223) (not d!115205) (not b!949529) (not d!115245) (not d!115187) (not b!949563) (not d!115217) (not b!949615) (not b!949538) (not b_lambda!14335) (not b!949664) (not d!115209) (not b!949662) (not b!949566) (not b!949550) (not b!949514) (not b!949630) (not d!115235) (not b_lambda!14343) (not d!115207) (not b!949597))
(check-sat b_and!29651 (not b_next!18199))
