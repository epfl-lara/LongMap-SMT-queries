; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21398 () Bool)

(assert start!21398)

(declare-fun b!215016 () Bool)

(declare-fun b_free!5703 () Bool)

(declare-fun b_next!5703 () Bool)

(assert (=> b!215016 (= b_free!5703 (not b_next!5703))))

(declare-fun tp!20213 () Bool)

(declare-fun b_and!12593 () Bool)

(assert (=> b!215016 (= tp!20213 b_and!12593)))

(declare-datatypes ((V!7067 0))(
  ( (V!7068 (val!2827 Int)) )
))
(declare-datatypes ((ValueCell!2439 0))(
  ( (ValueCellFull!2439 (v!4845 V!7067)) (EmptyCell!2439) )
))
(declare-datatypes ((array!10351 0))(
  ( (array!10352 (arr!4906 (Array (_ BitVec 32) ValueCell!2439)) (size!5234 (_ BitVec 32))) )
))
(declare-datatypes ((array!10353 0))(
  ( (array!10354 (arr!4907 (Array (_ BitVec 32) (_ BitVec 64))) (size!5235 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2778 0))(
  ( (LongMapFixedSize!2779 (defaultEntry!4039 Int) (mask!9721 (_ BitVec 32)) (extraKeys!3776 (_ BitVec 32)) (zeroValue!3880 V!7067) (minValue!3880 V!7067) (_size!1438 (_ BitVec 32)) (_keys!6064 array!10353) (_values!4022 array!10351) (_vacant!1438 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2778)

(declare-fun e!139855 () Bool)

(declare-fun e!139858 () Bool)

(declare-fun tp_is_empty!5565 () Bool)

(declare-fun array_inv!3249 (array!10353) Bool)

(declare-fun array_inv!3250 (array!10351) Bool)

(assert (=> b!215016 (= e!139858 (and tp!20213 tp_is_empty!5565 (array_inv!3249 (_keys!6064 thiss!1504)) (array_inv!3250 (_values!4022 thiss!1504)) e!139855))))

(declare-fun b!215017 () Bool)

(declare-fun e!139859 () Bool)

(assert (=> b!215017 (= e!139859 tp_is_empty!5565)))

(declare-fun b!215018 () Bool)

(declare-fun e!139857 () Bool)

(declare-fun e!139854 () Bool)

(assert (=> b!215018 (= e!139857 e!139854)))

(declare-fun res!105220 () Bool)

(assert (=> b!215018 (=> (not res!105220) (not e!139854))))

(declare-datatypes ((SeekEntryResult!727 0))(
  ( (MissingZero!727 (index!5078 (_ BitVec 32))) (Found!727 (index!5079 (_ BitVec 32))) (Intermediate!727 (undefined!1539 Bool) (index!5080 (_ BitVec 32)) (x!22443 (_ BitVec 32))) (Undefined!727) (MissingVacant!727 (index!5081 (_ BitVec 32))) )
))
(declare-fun lt!110862 () SeekEntryResult!727)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215018 (= res!105220 (or (= lt!110862 (MissingZero!727 index!297)) (= lt!110862 (MissingVacant!727 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10353 (_ BitVec 32)) SeekEntryResult!727)

(assert (=> b!215018 (= lt!110862 (seekEntryOrOpen!0 key!932 (_keys!6064 thiss!1504) (mask!9721 thiss!1504)))))

(declare-fun b!215019 () Bool)

(declare-fun e!139853 () Bool)

(assert (=> b!215019 (= e!139853 tp_is_empty!5565)))

(declare-fun mapIsEmpty!9479 () Bool)

(declare-fun mapRes!9479 () Bool)

(assert (=> mapIsEmpty!9479 mapRes!9479))

(declare-fun b!215021 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215021 (= e!139854 (not (validMask!0 (mask!9721 thiss!1504))))))

(declare-fun b!215020 () Bool)

(assert (=> b!215020 (= e!139855 (and e!139859 mapRes!9479))))

(declare-fun condMapEmpty!9479 () Bool)

(declare-fun mapDefault!9479 () ValueCell!2439)

(assert (=> b!215020 (= condMapEmpty!9479 (= (arr!4906 (_values!4022 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2439)) mapDefault!9479)))))

(declare-fun res!105219 () Bool)

(assert (=> start!21398 (=> (not res!105219) (not e!139857))))

(declare-fun valid!1135 (LongMapFixedSize!2778) Bool)

(assert (=> start!21398 (= res!105219 (valid!1135 thiss!1504))))

(assert (=> start!21398 e!139857))

(assert (=> start!21398 e!139858))

(assert (=> start!21398 true))

(declare-fun mapNonEmpty!9479 () Bool)

(declare-fun tp!20212 () Bool)

(assert (=> mapNonEmpty!9479 (= mapRes!9479 (and tp!20212 e!139853))))

(declare-fun mapValue!9479 () ValueCell!2439)

(declare-fun mapKey!9479 () (_ BitVec 32))

(declare-fun mapRest!9479 () (Array (_ BitVec 32) ValueCell!2439))

(assert (=> mapNonEmpty!9479 (= (arr!4906 (_values!4022 thiss!1504)) (store mapRest!9479 mapKey!9479 mapValue!9479))))

(declare-fun b!215022 () Bool)

(declare-fun res!105221 () Bool)

(assert (=> b!215022 (=> (not res!105221) (not e!139857))))

(assert (=> b!215022 (= res!105221 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!21398 res!105219) b!215022))

(assert (= (and b!215022 res!105221) b!215018))

(assert (= (and b!215018 res!105220) b!215021))

(assert (= (and b!215020 condMapEmpty!9479) mapIsEmpty!9479))

(assert (= (and b!215020 (not condMapEmpty!9479)) mapNonEmpty!9479))

(get-info :version)

(assert (= (and mapNonEmpty!9479 ((_ is ValueCellFull!2439) mapValue!9479)) b!215019))

(assert (= (and b!215020 ((_ is ValueCellFull!2439) mapDefault!9479)) b!215017))

(assert (= b!215016 b!215020))

(assert (= start!21398 b!215016))

(declare-fun m!242425 () Bool)

(assert (=> b!215021 m!242425))

(declare-fun m!242427 () Bool)

(assert (=> b!215016 m!242427))

(declare-fun m!242429 () Bool)

(assert (=> b!215016 m!242429))

(declare-fun m!242431 () Bool)

(assert (=> mapNonEmpty!9479 m!242431))

(declare-fun m!242433 () Bool)

(assert (=> start!21398 m!242433))

(declare-fun m!242435 () Bool)

(assert (=> b!215018 m!242435))

(check-sat b_and!12593 (not b!215018) (not b!215021) (not start!21398) (not b!215016) (not b_next!5703) (not mapNonEmpty!9479) tp_is_empty!5565)
(check-sat b_and!12593 (not b_next!5703))
(get-model)

(declare-fun d!58383 () Bool)

(assert (=> d!58383 (= (validMask!0 (mask!9721 thiss!1504)) (and (or (= (mask!9721 thiss!1504) #b00000000000000000000000000000111) (= (mask!9721 thiss!1504) #b00000000000000000000000000001111) (= (mask!9721 thiss!1504) #b00000000000000000000000000011111) (= (mask!9721 thiss!1504) #b00000000000000000000000000111111) (= (mask!9721 thiss!1504) #b00000000000000000000000001111111) (= (mask!9721 thiss!1504) #b00000000000000000000000011111111) (= (mask!9721 thiss!1504) #b00000000000000000000000111111111) (= (mask!9721 thiss!1504) #b00000000000000000000001111111111) (= (mask!9721 thiss!1504) #b00000000000000000000011111111111) (= (mask!9721 thiss!1504) #b00000000000000000000111111111111) (= (mask!9721 thiss!1504) #b00000000000000000001111111111111) (= (mask!9721 thiss!1504) #b00000000000000000011111111111111) (= (mask!9721 thiss!1504) #b00000000000000000111111111111111) (= (mask!9721 thiss!1504) #b00000000000000001111111111111111) (= (mask!9721 thiss!1504) #b00000000000000011111111111111111) (= (mask!9721 thiss!1504) #b00000000000000111111111111111111) (= (mask!9721 thiss!1504) #b00000000000001111111111111111111) (= (mask!9721 thiss!1504) #b00000000000011111111111111111111) (= (mask!9721 thiss!1504) #b00000000000111111111111111111111) (= (mask!9721 thiss!1504) #b00000000001111111111111111111111) (= (mask!9721 thiss!1504) #b00000000011111111111111111111111) (= (mask!9721 thiss!1504) #b00000000111111111111111111111111) (= (mask!9721 thiss!1504) #b00000001111111111111111111111111) (= (mask!9721 thiss!1504) #b00000011111111111111111111111111) (= (mask!9721 thiss!1504) #b00000111111111111111111111111111) (= (mask!9721 thiss!1504) #b00001111111111111111111111111111) (= (mask!9721 thiss!1504) #b00011111111111111111111111111111) (= (mask!9721 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9721 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215021 d!58383))

(declare-fun d!58385 () Bool)

(assert (=> d!58385 (= (array_inv!3249 (_keys!6064 thiss!1504)) (bvsge (size!5235 (_keys!6064 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215016 d!58385))

(declare-fun d!58387 () Bool)

(assert (=> d!58387 (= (array_inv!3250 (_values!4022 thiss!1504)) (bvsge (size!5234 (_values!4022 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215016 d!58387))

(declare-fun d!58389 () Bool)

(declare-fun res!105237 () Bool)

(declare-fun e!139883 () Bool)

(assert (=> d!58389 (=> (not res!105237) (not e!139883))))

(declare-fun simpleValid!215 (LongMapFixedSize!2778) Bool)

(assert (=> d!58389 (= res!105237 (simpleValid!215 thiss!1504))))

(assert (=> d!58389 (= (valid!1135 thiss!1504) e!139883)))

(declare-fun b!215050 () Bool)

(declare-fun res!105238 () Bool)

(assert (=> b!215050 (=> (not res!105238) (not e!139883))))

(declare-fun arrayCountValidKeys!0 (array!10353 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215050 (= res!105238 (= (arrayCountValidKeys!0 (_keys!6064 thiss!1504) #b00000000000000000000000000000000 (size!5235 (_keys!6064 thiss!1504))) (_size!1438 thiss!1504)))))

(declare-fun b!215051 () Bool)

(declare-fun res!105239 () Bool)

(assert (=> b!215051 (=> (not res!105239) (not e!139883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10353 (_ BitVec 32)) Bool)

(assert (=> b!215051 (= res!105239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6064 thiss!1504) (mask!9721 thiss!1504)))))

(declare-fun b!215052 () Bool)

(declare-datatypes ((List!3134 0))(
  ( (Nil!3131) (Cons!3130 (h!3773 (_ BitVec 64)) (t!8089 List!3134)) )
))
(declare-fun arrayNoDuplicates!0 (array!10353 (_ BitVec 32) List!3134) Bool)

(assert (=> b!215052 (= e!139883 (arrayNoDuplicates!0 (_keys!6064 thiss!1504) #b00000000000000000000000000000000 Nil!3131))))

(assert (= (and d!58389 res!105237) b!215050))

(assert (= (and b!215050 res!105238) b!215051))

(assert (= (and b!215051 res!105239) b!215052))

(declare-fun m!242449 () Bool)

(assert (=> d!58389 m!242449))

(declare-fun m!242451 () Bool)

(assert (=> b!215050 m!242451))

(declare-fun m!242453 () Bool)

(assert (=> b!215051 m!242453))

(declare-fun m!242455 () Bool)

(assert (=> b!215052 m!242455))

(assert (=> start!21398 d!58389))

(declare-fun b!215065 () Bool)

(declare-fun e!139890 () SeekEntryResult!727)

(declare-fun lt!110874 () SeekEntryResult!727)

(assert (=> b!215065 (= e!139890 (Found!727 (index!5080 lt!110874)))))

(declare-fun b!215066 () Bool)

(declare-fun e!139892 () SeekEntryResult!727)

(assert (=> b!215066 (= e!139892 (MissingZero!727 (index!5080 lt!110874)))))

(declare-fun d!58391 () Bool)

(declare-fun lt!110873 () SeekEntryResult!727)

(assert (=> d!58391 (and (or ((_ is Undefined!727) lt!110873) (not ((_ is Found!727) lt!110873)) (and (bvsge (index!5079 lt!110873) #b00000000000000000000000000000000) (bvslt (index!5079 lt!110873) (size!5235 (_keys!6064 thiss!1504))))) (or ((_ is Undefined!727) lt!110873) ((_ is Found!727) lt!110873) (not ((_ is MissingZero!727) lt!110873)) (and (bvsge (index!5078 lt!110873) #b00000000000000000000000000000000) (bvslt (index!5078 lt!110873) (size!5235 (_keys!6064 thiss!1504))))) (or ((_ is Undefined!727) lt!110873) ((_ is Found!727) lt!110873) ((_ is MissingZero!727) lt!110873) (not ((_ is MissingVacant!727) lt!110873)) (and (bvsge (index!5081 lt!110873) #b00000000000000000000000000000000) (bvslt (index!5081 lt!110873) (size!5235 (_keys!6064 thiss!1504))))) (or ((_ is Undefined!727) lt!110873) (ite ((_ is Found!727) lt!110873) (= (select (arr!4907 (_keys!6064 thiss!1504)) (index!5079 lt!110873)) key!932) (ite ((_ is MissingZero!727) lt!110873) (= (select (arr!4907 (_keys!6064 thiss!1504)) (index!5078 lt!110873)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!727) lt!110873) (= (select (arr!4907 (_keys!6064 thiss!1504)) (index!5081 lt!110873)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!139891 () SeekEntryResult!727)

(assert (=> d!58391 (= lt!110873 e!139891)))

(declare-fun c!36120 () Bool)

(assert (=> d!58391 (= c!36120 (and ((_ is Intermediate!727) lt!110874) (undefined!1539 lt!110874)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10353 (_ BitVec 32)) SeekEntryResult!727)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58391 (= lt!110874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9721 thiss!1504)) key!932 (_keys!6064 thiss!1504) (mask!9721 thiss!1504)))))

(assert (=> d!58391 (validMask!0 (mask!9721 thiss!1504))))

(assert (=> d!58391 (= (seekEntryOrOpen!0 key!932 (_keys!6064 thiss!1504) (mask!9721 thiss!1504)) lt!110873)))

(declare-fun b!215067 () Bool)

(declare-fun c!36121 () Bool)

(declare-fun lt!110872 () (_ BitVec 64))

(assert (=> b!215067 (= c!36121 (= lt!110872 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215067 (= e!139890 e!139892)))

(declare-fun b!215068 () Bool)

(assert (=> b!215068 (= e!139891 e!139890)))

(assert (=> b!215068 (= lt!110872 (select (arr!4907 (_keys!6064 thiss!1504)) (index!5080 lt!110874)))))

(declare-fun c!36122 () Bool)

(assert (=> b!215068 (= c!36122 (= lt!110872 key!932))))

(declare-fun b!215069 () Bool)

(assert (=> b!215069 (= e!139891 Undefined!727)))

(declare-fun b!215070 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10353 (_ BitVec 32)) SeekEntryResult!727)

(assert (=> b!215070 (= e!139892 (seekKeyOrZeroReturnVacant!0 (x!22443 lt!110874) (index!5080 lt!110874) (index!5080 lt!110874) key!932 (_keys!6064 thiss!1504) (mask!9721 thiss!1504)))))

(assert (= (and d!58391 c!36120) b!215069))

(assert (= (and d!58391 (not c!36120)) b!215068))

(assert (= (and b!215068 c!36122) b!215065))

(assert (= (and b!215068 (not c!36122)) b!215067))

(assert (= (and b!215067 c!36121) b!215066))

(assert (= (and b!215067 (not c!36121)) b!215070))

(declare-fun m!242457 () Bool)

(assert (=> d!58391 m!242457))

(declare-fun m!242459 () Bool)

(assert (=> d!58391 m!242459))

(declare-fun m!242461 () Bool)

(assert (=> d!58391 m!242461))

(assert (=> d!58391 m!242425))

(assert (=> d!58391 m!242461))

(declare-fun m!242463 () Bool)

(assert (=> d!58391 m!242463))

(declare-fun m!242465 () Bool)

(assert (=> d!58391 m!242465))

(declare-fun m!242467 () Bool)

(assert (=> b!215068 m!242467))

(declare-fun m!242469 () Bool)

(assert (=> b!215070 m!242469))

(assert (=> b!215018 d!58391))

(declare-fun mapIsEmpty!9485 () Bool)

(declare-fun mapRes!9485 () Bool)

(assert (=> mapIsEmpty!9485 mapRes!9485))

(declare-fun mapNonEmpty!9485 () Bool)

(declare-fun tp!20222 () Bool)

(declare-fun e!139898 () Bool)

(assert (=> mapNonEmpty!9485 (= mapRes!9485 (and tp!20222 e!139898))))

(declare-fun mapKey!9485 () (_ BitVec 32))

(declare-fun mapRest!9485 () (Array (_ BitVec 32) ValueCell!2439))

(declare-fun mapValue!9485 () ValueCell!2439)

(assert (=> mapNonEmpty!9485 (= mapRest!9479 (store mapRest!9485 mapKey!9485 mapValue!9485))))

(declare-fun condMapEmpty!9485 () Bool)

(declare-fun mapDefault!9485 () ValueCell!2439)

(assert (=> mapNonEmpty!9479 (= condMapEmpty!9485 (= mapRest!9479 ((as const (Array (_ BitVec 32) ValueCell!2439)) mapDefault!9485)))))

(declare-fun e!139897 () Bool)

(assert (=> mapNonEmpty!9479 (= tp!20212 (and e!139897 mapRes!9485))))

(declare-fun b!215078 () Bool)

(assert (=> b!215078 (= e!139897 tp_is_empty!5565)))

(declare-fun b!215077 () Bool)

(assert (=> b!215077 (= e!139898 tp_is_empty!5565)))

(assert (= (and mapNonEmpty!9479 condMapEmpty!9485) mapIsEmpty!9485))

(assert (= (and mapNonEmpty!9479 (not condMapEmpty!9485)) mapNonEmpty!9485))

(assert (= (and mapNonEmpty!9485 ((_ is ValueCellFull!2439) mapValue!9485)) b!215077))

(assert (= (and mapNonEmpty!9479 ((_ is ValueCellFull!2439) mapDefault!9485)) b!215078))

(declare-fun m!242471 () Bool)

(assert (=> mapNonEmpty!9485 m!242471))

(check-sat b_and!12593 (not b!215070) (not b!215052) (not b!215050) (not b!215051) (not d!58391) (not d!58389) tp_is_empty!5565 (not b_next!5703) (not mapNonEmpty!9485))
(check-sat b_and!12593 (not b_next!5703))
