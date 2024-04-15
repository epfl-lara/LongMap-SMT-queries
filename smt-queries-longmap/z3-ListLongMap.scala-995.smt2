; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21476 () Bool)

(assert start!21476)

(declare-fun b!215362 () Bool)

(declare-fun b_free!5719 () Bool)

(declare-fun b_next!5719 () Bool)

(assert (=> b!215362 (= b_free!5719 (not b_next!5719))))

(declare-fun tp!20272 () Bool)

(declare-fun b_and!12583 () Bool)

(assert (=> b!215362 (= tp!20272 b_and!12583)))

(declare-fun b!215358 () Bool)

(declare-fun res!105320 () Bool)

(declare-fun e!140092 () Bool)

(assert (=> b!215358 (=> (not res!105320) (not e!140092))))

(declare-datatypes ((V!7089 0))(
  ( (V!7090 (val!2835 Int)) )
))
(declare-datatypes ((ValueCell!2447 0))(
  ( (ValueCellFull!2447 (v!4847 V!7089)) (EmptyCell!2447) )
))
(declare-datatypes ((array!10381 0))(
  ( (array!10382 (arr!4917 (Array (_ BitVec 32) ValueCell!2447)) (size!5248 (_ BitVec 32))) )
))
(declare-datatypes ((array!10383 0))(
  ( (array!10384 (arr!4918 (Array (_ BitVec 32) (_ BitVec 64))) (size!5249 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2794 0))(
  ( (LongMapFixedSize!2795 (defaultEntry!4047 Int) (mask!9748 (_ BitVec 32)) (extraKeys!3784 (_ BitVec 32)) (zeroValue!3888 V!7089) (minValue!3888 V!7089) (_size!1446 (_ BitVec 32)) (_keys!6080 array!10383) (_values!4030 array!10381) (_vacant!1446 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2794)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215358 (= res!105320 (validMask!0 (mask!9748 thiss!1504)))))

(declare-fun b!215359 () Bool)

(assert (=> b!215359 (= e!140092 (and (= (size!5248 (_values!4030 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9748 thiss!1504))) (= (size!5249 (_keys!6080 thiss!1504)) (size!5248 (_values!4030 thiss!1504))) (bvslt (mask!9748 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215360 () Bool)

(declare-fun e!140087 () Bool)

(declare-fun e!140086 () Bool)

(declare-fun mapRes!9514 () Bool)

(assert (=> b!215360 (= e!140087 (and e!140086 mapRes!9514))))

(declare-fun condMapEmpty!9514 () Bool)

(declare-fun mapDefault!9514 () ValueCell!2447)

(assert (=> b!215360 (= condMapEmpty!9514 (= (arr!4917 (_values!4030 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2447)) mapDefault!9514)))))

(declare-fun b!215361 () Bool)

(declare-fun e!140091 () Bool)

(assert (=> b!215361 (= e!140091 e!140092)))

(declare-fun res!105319 () Bool)

(assert (=> b!215361 (=> (not res!105319) (not e!140092))))

(declare-datatypes ((SeekEntryResult!730 0))(
  ( (MissingZero!730 (index!5090 (_ BitVec 32))) (Found!730 (index!5091 (_ BitVec 32))) (Intermediate!730 (undefined!1542 Bool) (index!5092 (_ BitVec 32)) (x!22511 (_ BitVec 32))) (Undefined!730) (MissingVacant!730 (index!5093 (_ BitVec 32))) )
))
(declare-fun lt!110792 () SeekEntryResult!730)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215361 (= res!105319 (or (= lt!110792 (MissingZero!730 index!297)) (= lt!110792 (MissingVacant!730 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10383 (_ BitVec 32)) SeekEntryResult!730)

(assert (=> b!215361 (= lt!110792 (seekEntryOrOpen!0 key!932 (_keys!6080 thiss!1504) (mask!9748 thiss!1504)))))

(declare-fun mapIsEmpty!9514 () Bool)

(assert (=> mapIsEmpty!9514 mapRes!9514))

(declare-fun tp_is_empty!5581 () Bool)

(declare-fun e!140088 () Bool)

(declare-fun array_inv!3233 (array!10383) Bool)

(declare-fun array_inv!3234 (array!10381) Bool)

(assert (=> b!215362 (= e!140088 (and tp!20272 tp_is_empty!5581 (array_inv!3233 (_keys!6080 thiss!1504)) (array_inv!3234 (_values!4030 thiss!1504)) e!140087))))

(declare-fun b!215363 () Bool)

(declare-fun e!140090 () Bool)

(assert (=> b!215363 (= e!140090 tp_is_empty!5581)))

(declare-fun mapNonEmpty!9514 () Bool)

(declare-fun tp!20271 () Bool)

(assert (=> mapNonEmpty!9514 (= mapRes!9514 (and tp!20271 e!140090))))

(declare-fun mapValue!9514 () ValueCell!2447)

(declare-fun mapKey!9514 () (_ BitVec 32))

(declare-fun mapRest!9514 () (Array (_ BitVec 32) ValueCell!2447))

(assert (=> mapNonEmpty!9514 (= (arr!4917 (_values!4030 thiss!1504)) (store mapRest!9514 mapKey!9514 mapValue!9514))))

(declare-fun res!105317 () Bool)

(assert (=> start!21476 (=> (not res!105317) (not e!140091))))

(declare-fun valid!1159 (LongMapFixedSize!2794) Bool)

(assert (=> start!21476 (= res!105317 (valid!1159 thiss!1504))))

(assert (=> start!21476 e!140091))

(assert (=> start!21476 e!140088))

(assert (=> start!21476 true))

(declare-fun b!215364 () Bool)

(assert (=> b!215364 (= e!140086 tp_is_empty!5581)))

(declare-fun b!215365 () Bool)

(declare-fun res!105318 () Bool)

(assert (=> b!215365 (=> (not res!105318) (not e!140091))))

(assert (=> b!215365 (= res!105318 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!21476 res!105317) b!215365))

(assert (= (and b!215365 res!105318) b!215361))

(assert (= (and b!215361 res!105319) b!215358))

(assert (= (and b!215358 res!105320) b!215359))

(assert (= (and b!215360 condMapEmpty!9514) mapIsEmpty!9514))

(assert (= (and b!215360 (not condMapEmpty!9514)) mapNonEmpty!9514))

(get-info :version)

(assert (= (and mapNonEmpty!9514 ((_ is ValueCellFull!2447) mapValue!9514)) b!215363))

(assert (= (and b!215360 ((_ is ValueCellFull!2447) mapDefault!9514)) b!215364))

(assert (= b!215362 b!215360))

(assert (= start!21476 b!215362))

(declare-fun m!242053 () Bool)

(assert (=> b!215361 m!242053))

(declare-fun m!242055 () Bool)

(assert (=> b!215358 m!242055))

(declare-fun m!242057 () Bool)

(assert (=> mapNonEmpty!9514 m!242057))

(declare-fun m!242059 () Bool)

(assert (=> b!215362 m!242059))

(declare-fun m!242061 () Bool)

(assert (=> b!215362 m!242061))

(declare-fun m!242063 () Bool)

(assert (=> start!21476 m!242063))

(check-sat (not mapNonEmpty!9514) (not b!215362) tp_is_empty!5581 (not b!215361) b_and!12583 (not b_next!5719) (not start!21476) (not b!215358))
(check-sat b_and!12583 (not b_next!5719))
(get-model)

(declare-fun d!58299 () Bool)

(assert (=> d!58299 (= (array_inv!3233 (_keys!6080 thiss!1504)) (bvsge (size!5249 (_keys!6080 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215362 d!58299))

(declare-fun d!58301 () Bool)

(assert (=> d!58301 (= (array_inv!3234 (_values!4030 thiss!1504)) (bvsge (size!5248 (_values!4030 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215362 d!58301))

(declare-fun d!58303 () Bool)

(assert (=> d!58303 (= (validMask!0 (mask!9748 thiss!1504)) (and (or (= (mask!9748 thiss!1504) #b00000000000000000000000000000111) (= (mask!9748 thiss!1504) #b00000000000000000000000000001111) (= (mask!9748 thiss!1504) #b00000000000000000000000000011111) (= (mask!9748 thiss!1504) #b00000000000000000000000000111111) (= (mask!9748 thiss!1504) #b00000000000000000000000001111111) (= (mask!9748 thiss!1504) #b00000000000000000000000011111111) (= (mask!9748 thiss!1504) #b00000000000000000000000111111111) (= (mask!9748 thiss!1504) #b00000000000000000000001111111111) (= (mask!9748 thiss!1504) #b00000000000000000000011111111111) (= (mask!9748 thiss!1504) #b00000000000000000000111111111111) (= (mask!9748 thiss!1504) #b00000000000000000001111111111111) (= (mask!9748 thiss!1504) #b00000000000000000011111111111111) (= (mask!9748 thiss!1504) #b00000000000000000111111111111111) (= (mask!9748 thiss!1504) #b00000000000000001111111111111111) (= (mask!9748 thiss!1504) #b00000000000000011111111111111111) (= (mask!9748 thiss!1504) #b00000000000000111111111111111111) (= (mask!9748 thiss!1504) #b00000000000001111111111111111111) (= (mask!9748 thiss!1504) #b00000000000011111111111111111111) (= (mask!9748 thiss!1504) #b00000000000111111111111111111111) (= (mask!9748 thiss!1504) #b00000000001111111111111111111111) (= (mask!9748 thiss!1504) #b00000000011111111111111111111111) (= (mask!9748 thiss!1504) #b00000000111111111111111111111111) (= (mask!9748 thiss!1504) #b00000001111111111111111111111111) (= (mask!9748 thiss!1504) #b00000011111111111111111111111111) (= (mask!9748 thiss!1504) #b00000111111111111111111111111111) (= (mask!9748 thiss!1504) #b00001111111111111111111111111111) (= (mask!9748 thiss!1504) #b00011111111111111111111111111111) (= (mask!9748 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9748 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215358 d!58303))

(declare-fun d!58305 () Bool)

(declare-fun res!105351 () Bool)

(declare-fun e!140137 () Bool)

(assert (=> d!58305 (=> (not res!105351) (not e!140137))))

(declare-fun simpleValid!218 (LongMapFixedSize!2794) Bool)

(assert (=> d!58305 (= res!105351 (simpleValid!218 thiss!1504))))

(assert (=> d!58305 (= (valid!1159 thiss!1504) e!140137)))

(declare-fun b!215420 () Bool)

(declare-fun res!105352 () Bool)

(assert (=> b!215420 (=> (not res!105352) (not e!140137))))

(declare-fun arrayCountValidKeys!0 (array!10383 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215420 (= res!105352 (= (arrayCountValidKeys!0 (_keys!6080 thiss!1504) #b00000000000000000000000000000000 (size!5249 (_keys!6080 thiss!1504))) (_size!1446 thiss!1504)))))

(declare-fun b!215421 () Bool)

(declare-fun res!105353 () Bool)

(assert (=> b!215421 (=> (not res!105353) (not e!140137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10383 (_ BitVec 32)) Bool)

(assert (=> b!215421 (= res!105353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6080 thiss!1504) (mask!9748 thiss!1504)))))

(declare-fun b!215422 () Bool)

(declare-datatypes ((List!3124 0))(
  ( (Nil!3121) (Cons!3120 (h!3765 (_ BitVec 64)) (t!8070 List!3124)) )
))
(declare-fun arrayNoDuplicates!0 (array!10383 (_ BitVec 32) List!3124) Bool)

(assert (=> b!215422 (= e!140137 (arrayNoDuplicates!0 (_keys!6080 thiss!1504) #b00000000000000000000000000000000 Nil!3121))))

(assert (= (and d!58305 res!105351) b!215420))

(assert (= (and b!215420 res!105352) b!215421))

(assert (= (and b!215421 res!105353) b!215422))

(declare-fun m!242089 () Bool)

(assert (=> d!58305 m!242089))

(declare-fun m!242091 () Bool)

(assert (=> b!215420 m!242091))

(declare-fun m!242093 () Bool)

(assert (=> b!215421 m!242093))

(declare-fun m!242095 () Bool)

(assert (=> b!215422 m!242095))

(assert (=> start!21476 d!58305))

(declare-fun d!58307 () Bool)

(declare-fun lt!110805 () SeekEntryResult!730)

(assert (=> d!58307 (and (or ((_ is Undefined!730) lt!110805) (not ((_ is Found!730) lt!110805)) (and (bvsge (index!5091 lt!110805) #b00000000000000000000000000000000) (bvslt (index!5091 lt!110805) (size!5249 (_keys!6080 thiss!1504))))) (or ((_ is Undefined!730) lt!110805) ((_ is Found!730) lt!110805) (not ((_ is MissingZero!730) lt!110805)) (and (bvsge (index!5090 lt!110805) #b00000000000000000000000000000000) (bvslt (index!5090 lt!110805) (size!5249 (_keys!6080 thiss!1504))))) (or ((_ is Undefined!730) lt!110805) ((_ is Found!730) lt!110805) ((_ is MissingZero!730) lt!110805) (not ((_ is MissingVacant!730) lt!110805)) (and (bvsge (index!5093 lt!110805) #b00000000000000000000000000000000) (bvslt (index!5093 lt!110805) (size!5249 (_keys!6080 thiss!1504))))) (or ((_ is Undefined!730) lt!110805) (ite ((_ is Found!730) lt!110805) (= (select (arr!4918 (_keys!6080 thiss!1504)) (index!5091 lt!110805)) key!932) (ite ((_ is MissingZero!730) lt!110805) (= (select (arr!4918 (_keys!6080 thiss!1504)) (index!5090 lt!110805)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!730) lt!110805) (= (select (arr!4918 (_keys!6080 thiss!1504)) (index!5093 lt!110805)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!140144 () SeekEntryResult!730)

(assert (=> d!58307 (= lt!110805 e!140144)))

(declare-fun c!36183 () Bool)

(declare-fun lt!110806 () SeekEntryResult!730)

(assert (=> d!58307 (= c!36183 (and ((_ is Intermediate!730) lt!110806) (undefined!1542 lt!110806)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10383 (_ BitVec 32)) SeekEntryResult!730)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58307 (= lt!110806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9748 thiss!1504)) key!932 (_keys!6080 thiss!1504) (mask!9748 thiss!1504)))))

(assert (=> d!58307 (validMask!0 (mask!9748 thiss!1504))))

(assert (=> d!58307 (= (seekEntryOrOpen!0 key!932 (_keys!6080 thiss!1504) (mask!9748 thiss!1504)) lt!110805)))

(declare-fun b!215435 () Bool)

(declare-fun c!36181 () Bool)

(declare-fun lt!110807 () (_ BitVec 64))

(assert (=> b!215435 (= c!36181 (= lt!110807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140145 () SeekEntryResult!730)

(declare-fun e!140146 () SeekEntryResult!730)

(assert (=> b!215435 (= e!140145 e!140146)))

(declare-fun b!215436 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10383 (_ BitVec 32)) SeekEntryResult!730)

(assert (=> b!215436 (= e!140146 (seekKeyOrZeroReturnVacant!0 (x!22511 lt!110806) (index!5092 lt!110806) (index!5092 lt!110806) key!932 (_keys!6080 thiss!1504) (mask!9748 thiss!1504)))))

(declare-fun b!215437 () Bool)

(assert (=> b!215437 (= e!140146 (MissingZero!730 (index!5092 lt!110806)))))

(declare-fun b!215438 () Bool)

(assert (=> b!215438 (= e!140145 (Found!730 (index!5092 lt!110806)))))

(declare-fun b!215439 () Bool)

(assert (=> b!215439 (= e!140144 e!140145)))

(assert (=> b!215439 (= lt!110807 (select (arr!4918 (_keys!6080 thiss!1504)) (index!5092 lt!110806)))))

(declare-fun c!36182 () Bool)

(assert (=> b!215439 (= c!36182 (= lt!110807 key!932))))

(declare-fun b!215440 () Bool)

(assert (=> b!215440 (= e!140144 Undefined!730)))

(assert (= (and d!58307 c!36183) b!215440))

(assert (= (and d!58307 (not c!36183)) b!215439))

(assert (= (and b!215439 c!36182) b!215438))

(assert (= (and b!215439 (not c!36182)) b!215435))

(assert (= (and b!215435 c!36181) b!215437))

(assert (= (and b!215435 (not c!36181)) b!215436))

(declare-fun m!242097 () Bool)

(assert (=> d!58307 m!242097))

(declare-fun m!242099 () Bool)

(assert (=> d!58307 m!242099))

(declare-fun m!242101 () Bool)

(assert (=> d!58307 m!242101))

(assert (=> d!58307 m!242099))

(declare-fun m!242103 () Bool)

(assert (=> d!58307 m!242103))

(assert (=> d!58307 m!242055))

(declare-fun m!242105 () Bool)

(assert (=> d!58307 m!242105))

(declare-fun m!242107 () Bool)

(assert (=> b!215436 m!242107))

(declare-fun m!242109 () Bool)

(assert (=> b!215439 m!242109))

(assert (=> b!215361 d!58307))

(declare-fun b!215448 () Bool)

(declare-fun e!140151 () Bool)

(assert (=> b!215448 (= e!140151 tp_is_empty!5581)))

(declare-fun b!215447 () Bool)

(declare-fun e!140152 () Bool)

(assert (=> b!215447 (= e!140152 tp_is_empty!5581)))

(declare-fun mapIsEmpty!9523 () Bool)

(declare-fun mapRes!9523 () Bool)

(assert (=> mapIsEmpty!9523 mapRes!9523))

(declare-fun mapNonEmpty!9523 () Bool)

(declare-fun tp!20287 () Bool)

(assert (=> mapNonEmpty!9523 (= mapRes!9523 (and tp!20287 e!140152))))

(declare-fun mapRest!9523 () (Array (_ BitVec 32) ValueCell!2447))

(declare-fun mapKey!9523 () (_ BitVec 32))

(declare-fun mapValue!9523 () ValueCell!2447)

(assert (=> mapNonEmpty!9523 (= mapRest!9514 (store mapRest!9523 mapKey!9523 mapValue!9523))))

(declare-fun condMapEmpty!9523 () Bool)

(declare-fun mapDefault!9523 () ValueCell!2447)

(assert (=> mapNonEmpty!9514 (= condMapEmpty!9523 (= mapRest!9514 ((as const (Array (_ BitVec 32) ValueCell!2447)) mapDefault!9523)))))

(assert (=> mapNonEmpty!9514 (= tp!20271 (and e!140151 mapRes!9523))))

(assert (= (and mapNonEmpty!9514 condMapEmpty!9523) mapIsEmpty!9523))

(assert (= (and mapNonEmpty!9514 (not condMapEmpty!9523)) mapNonEmpty!9523))

(assert (= (and mapNonEmpty!9523 ((_ is ValueCellFull!2447) mapValue!9523)) b!215447))

(assert (= (and mapNonEmpty!9514 ((_ is ValueCellFull!2447) mapDefault!9523)) b!215448))

(declare-fun m!242111 () Bool)

(assert (=> mapNonEmpty!9523 m!242111))

(check-sat (not d!58305) (not mapNonEmpty!9523) (not b!215420) tp_is_empty!5581 (not b!215436) (not b!215421) (not d!58307) (not b!215422) b_and!12583 (not b_next!5719))
(check-sat b_and!12583 (not b_next!5719))
