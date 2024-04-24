; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21382 () Bool)

(assert start!21382)

(declare-fun b!214936 () Bool)

(declare-fun b_free!5695 () Bool)

(declare-fun b_next!5695 () Bool)

(assert (=> b!214936 (= b_free!5695 (not b_next!5695))))

(declare-fun tp!20186 () Bool)

(declare-fun b_and!12599 () Bool)

(assert (=> b!214936 (= tp!20186 b_and!12599)))

(declare-fun b!214930 () Bool)

(declare-fun e!139784 () Bool)

(declare-fun e!139785 () Bool)

(declare-fun mapRes!9464 () Bool)

(assert (=> b!214930 (= e!139784 (and e!139785 mapRes!9464))))

(declare-fun condMapEmpty!9464 () Bool)

(declare-datatypes ((V!7057 0))(
  ( (V!7058 (val!2823 Int)) )
))
(declare-datatypes ((ValueCell!2435 0))(
  ( (ValueCellFull!2435 (v!4842 V!7057)) (EmptyCell!2435) )
))
(declare-datatypes ((array!10331 0))(
  ( (array!10332 (arr!4897 (Array (_ BitVec 32) ValueCell!2435)) (size!5225 (_ BitVec 32))) )
))
(declare-datatypes ((array!10333 0))(
  ( (array!10334 (arr!4898 (Array (_ BitVec 32) (_ BitVec 64))) (size!5226 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2770 0))(
  ( (LongMapFixedSize!2771 (defaultEntry!4035 Int) (mask!9713 (_ BitVec 32)) (extraKeys!3772 (_ BitVec 32)) (zeroValue!3876 V!7057) (minValue!3876 V!7057) (_size!1434 (_ BitVec 32)) (_keys!6059 array!10333) (_values!4018 array!10331) (_vacant!1434 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2770)

(declare-fun mapDefault!9464 () ValueCell!2435)

(assert (=> b!214930 (= condMapEmpty!9464 (= (arr!4897 (_values!4018 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2435)) mapDefault!9464)))))

(declare-fun b!214931 () Bool)

(declare-fun res!105185 () Bool)

(declare-fun e!139787 () Bool)

(assert (=> b!214931 (=> (not res!105185) (not e!139787))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214931 (= res!105185 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9464 () Bool)

(declare-fun tp!20185 () Bool)

(declare-fun e!139782 () Bool)

(assert (=> mapNonEmpty!9464 (= mapRes!9464 (and tp!20185 e!139782))))

(declare-fun mapValue!9464 () ValueCell!2435)

(declare-fun mapRest!9464 () (Array (_ BitVec 32) ValueCell!2435))

(declare-fun mapKey!9464 () (_ BitVec 32))

(assert (=> mapNonEmpty!9464 (= (arr!4897 (_values!4018 thiss!1504)) (store mapRest!9464 mapKey!9464 mapValue!9464))))

(declare-fun b!214932 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214932 (= e!139787 (not (validKeyInArray!0 key!932)))))

(declare-fun b!214933 () Bool)

(declare-fun res!105184 () Bool)

(assert (=> b!214933 (=> (not res!105184) (not e!139787))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!713 0))(
  ( (MissingZero!713 (index!5022 (_ BitVec 32))) (Found!713 (index!5023 (_ BitVec 32))) (Intermediate!713 (undefined!1525 Bool) (index!5024 (_ BitVec 32)) (x!22413 (_ BitVec 32))) (Undefined!713) (MissingVacant!713 (index!5025 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10333 (_ BitVec 32)) SeekEntryResult!713)

(assert (=> b!214933 (= res!105184 (not (= (seekEntryOrOpen!0 key!932 (_keys!6059 thiss!1504) (mask!9713 thiss!1504)) (MissingZero!713 index!297))))))

(declare-fun mapIsEmpty!9464 () Bool)

(assert (=> mapIsEmpty!9464 mapRes!9464))

(declare-fun b!214935 () Bool)

(declare-fun tp_is_empty!5557 () Bool)

(assert (=> b!214935 (= e!139782 tp_is_empty!5557)))

(declare-fun e!139786 () Bool)

(declare-fun array_inv!3215 (array!10333) Bool)

(declare-fun array_inv!3216 (array!10331) Bool)

(assert (=> b!214936 (= e!139786 (and tp!20186 tp_is_empty!5557 (array_inv!3215 (_keys!6059 thiss!1504)) (array_inv!3216 (_values!4018 thiss!1504)) e!139784))))

(declare-fun b!214937 () Bool)

(declare-fun res!105181 () Bool)

(assert (=> b!214937 (=> (not res!105181) (not e!139787))))

(assert (=> b!214937 (= res!105181 (and (bvsge (mask!9713 thiss!1504) #b00000000000000000000000000000000) (= (size!5226 (_keys!6059 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9713 thiss!1504)))))))

(declare-fun b!214938 () Bool)

(declare-fun res!105183 () Bool)

(assert (=> b!214938 (=> (not res!105183) (not e!139787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214938 (= res!105183 (validMask!0 (mask!9713 thiss!1504)))))

(declare-fun res!105182 () Bool)

(assert (=> start!21382 (=> (not res!105182) (not e!139787))))

(declare-fun valid!1152 (LongMapFixedSize!2770) Bool)

(assert (=> start!21382 (= res!105182 (valid!1152 thiss!1504))))

(assert (=> start!21382 e!139787))

(assert (=> start!21382 e!139786))

(assert (=> start!21382 true))

(declare-fun b!214934 () Bool)

(assert (=> b!214934 (= e!139785 tp_is_empty!5557)))

(assert (= (and start!21382 res!105182) b!214931))

(assert (= (and b!214931 res!105185) b!214933))

(assert (= (and b!214933 res!105184) b!214938))

(assert (= (and b!214938 res!105183) b!214937))

(assert (= (and b!214937 res!105181) b!214932))

(assert (= (and b!214930 condMapEmpty!9464) mapIsEmpty!9464))

(assert (= (and b!214930 (not condMapEmpty!9464)) mapNonEmpty!9464))

(get-info :version)

(assert (= (and mapNonEmpty!9464 ((_ is ValueCellFull!2435) mapValue!9464)) b!214935))

(assert (= (and b!214930 ((_ is ValueCellFull!2435) mapDefault!9464)) b!214934))

(assert (= b!214936 b!214930))

(assert (= start!21382 b!214936))

(declare-fun m!242529 () Bool)

(assert (=> mapNonEmpty!9464 m!242529))

(declare-fun m!242531 () Bool)

(assert (=> b!214938 m!242531))

(declare-fun m!242533 () Bool)

(assert (=> b!214936 m!242533))

(declare-fun m!242535 () Bool)

(assert (=> b!214936 m!242535))

(declare-fun m!242537 () Bool)

(assert (=> b!214933 m!242537))

(declare-fun m!242539 () Bool)

(assert (=> b!214932 m!242539))

(declare-fun m!242541 () Bool)

(assert (=> start!21382 m!242541))

(check-sat (not b!214936) tp_is_empty!5557 b_and!12599 (not b!214938) (not mapNonEmpty!9464) (not start!21382) (not b!214933) (not b!214932) (not b_next!5695))
(check-sat b_and!12599 (not b_next!5695))
(get-model)

(declare-fun d!58443 () Bool)

(assert (=> d!58443 (= (validMask!0 (mask!9713 thiss!1504)) (and (or (= (mask!9713 thiss!1504) #b00000000000000000000000000000111) (= (mask!9713 thiss!1504) #b00000000000000000000000000001111) (= (mask!9713 thiss!1504) #b00000000000000000000000000011111) (= (mask!9713 thiss!1504) #b00000000000000000000000000111111) (= (mask!9713 thiss!1504) #b00000000000000000000000001111111) (= (mask!9713 thiss!1504) #b00000000000000000000000011111111) (= (mask!9713 thiss!1504) #b00000000000000000000000111111111) (= (mask!9713 thiss!1504) #b00000000000000000000001111111111) (= (mask!9713 thiss!1504) #b00000000000000000000011111111111) (= (mask!9713 thiss!1504) #b00000000000000000000111111111111) (= (mask!9713 thiss!1504) #b00000000000000000001111111111111) (= (mask!9713 thiss!1504) #b00000000000000000011111111111111) (= (mask!9713 thiss!1504) #b00000000000000000111111111111111) (= (mask!9713 thiss!1504) #b00000000000000001111111111111111) (= (mask!9713 thiss!1504) #b00000000000000011111111111111111) (= (mask!9713 thiss!1504) #b00000000000000111111111111111111) (= (mask!9713 thiss!1504) #b00000000000001111111111111111111) (= (mask!9713 thiss!1504) #b00000000000011111111111111111111) (= (mask!9713 thiss!1504) #b00000000000111111111111111111111) (= (mask!9713 thiss!1504) #b00000000001111111111111111111111) (= (mask!9713 thiss!1504) #b00000000011111111111111111111111) (= (mask!9713 thiss!1504) #b00000000111111111111111111111111) (= (mask!9713 thiss!1504) #b00000001111111111111111111111111) (= (mask!9713 thiss!1504) #b00000011111111111111111111111111) (= (mask!9713 thiss!1504) #b00000111111111111111111111111111) (= (mask!9713 thiss!1504) #b00001111111111111111111111111111) (= (mask!9713 thiss!1504) #b00011111111111111111111111111111) (= (mask!9713 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9713 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214938 d!58443))

(declare-fun d!58445 () Bool)

(declare-fun res!105222 () Bool)

(declare-fun e!139826 () Bool)

(assert (=> d!58445 (=> (not res!105222) (not e!139826))))

(declare-fun simpleValid!214 (LongMapFixedSize!2770) Bool)

(assert (=> d!58445 (= res!105222 (simpleValid!214 thiss!1504))))

(assert (=> d!58445 (= (valid!1152 thiss!1504) e!139826)))

(declare-fun b!214999 () Bool)

(declare-fun res!105223 () Bool)

(assert (=> b!214999 (=> (not res!105223) (not e!139826))))

(declare-fun arrayCountValidKeys!0 (array!10333 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214999 (= res!105223 (= (arrayCountValidKeys!0 (_keys!6059 thiss!1504) #b00000000000000000000000000000000 (size!5226 (_keys!6059 thiss!1504))) (_size!1434 thiss!1504)))))

(declare-fun b!215000 () Bool)

(declare-fun res!105224 () Bool)

(assert (=> b!215000 (=> (not res!105224) (not e!139826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10333 (_ BitVec 32)) Bool)

(assert (=> b!215000 (= res!105224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6059 thiss!1504) (mask!9713 thiss!1504)))))

(declare-fun b!215001 () Bool)

(declare-datatypes ((List!3068 0))(
  ( (Nil!3065) (Cons!3064 (h!3707 (_ BitVec 64)) (t!8015 List!3068)) )
))
(declare-fun arrayNoDuplicates!0 (array!10333 (_ BitVec 32) List!3068) Bool)

(assert (=> b!215001 (= e!139826 (arrayNoDuplicates!0 (_keys!6059 thiss!1504) #b00000000000000000000000000000000 Nil!3065))))

(assert (= (and d!58445 res!105222) b!214999))

(assert (= (and b!214999 res!105223) b!215000))

(assert (= (and b!215000 res!105224) b!215001))

(declare-fun m!242571 () Bool)

(assert (=> d!58445 m!242571))

(declare-fun m!242573 () Bool)

(assert (=> b!214999 m!242573))

(declare-fun m!242575 () Bool)

(assert (=> b!215000 m!242575))

(declare-fun m!242577 () Bool)

(assert (=> b!215001 m!242577))

(assert (=> start!21382 d!58445))

(declare-fun b!215014 () Bool)

(declare-fun c!36125 () Bool)

(declare-fun lt!110914 () (_ BitVec 64))

(assert (=> b!215014 (= c!36125 (= lt!110914 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139834 () SeekEntryResult!713)

(declare-fun e!139835 () SeekEntryResult!713)

(assert (=> b!215014 (= e!139834 e!139835)))

(declare-fun d!58447 () Bool)

(declare-fun lt!110913 () SeekEntryResult!713)

(assert (=> d!58447 (and (or ((_ is Undefined!713) lt!110913) (not ((_ is Found!713) lt!110913)) (and (bvsge (index!5023 lt!110913) #b00000000000000000000000000000000) (bvslt (index!5023 lt!110913) (size!5226 (_keys!6059 thiss!1504))))) (or ((_ is Undefined!713) lt!110913) ((_ is Found!713) lt!110913) (not ((_ is MissingZero!713) lt!110913)) (and (bvsge (index!5022 lt!110913) #b00000000000000000000000000000000) (bvslt (index!5022 lt!110913) (size!5226 (_keys!6059 thiss!1504))))) (or ((_ is Undefined!713) lt!110913) ((_ is Found!713) lt!110913) ((_ is MissingZero!713) lt!110913) (not ((_ is MissingVacant!713) lt!110913)) (and (bvsge (index!5025 lt!110913) #b00000000000000000000000000000000) (bvslt (index!5025 lt!110913) (size!5226 (_keys!6059 thiss!1504))))) (or ((_ is Undefined!713) lt!110913) (ite ((_ is Found!713) lt!110913) (= (select (arr!4898 (_keys!6059 thiss!1504)) (index!5023 lt!110913)) key!932) (ite ((_ is MissingZero!713) lt!110913) (= (select (arr!4898 (_keys!6059 thiss!1504)) (index!5022 lt!110913)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!713) lt!110913) (= (select (arr!4898 (_keys!6059 thiss!1504)) (index!5025 lt!110913)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!139833 () SeekEntryResult!713)

(assert (=> d!58447 (= lt!110913 e!139833)))

(declare-fun c!36124 () Bool)

(declare-fun lt!110915 () SeekEntryResult!713)

(assert (=> d!58447 (= c!36124 (and ((_ is Intermediate!713) lt!110915) (undefined!1525 lt!110915)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10333 (_ BitVec 32)) SeekEntryResult!713)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58447 (= lt!110915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9713 thiss!1504)) key!932 (_keys!6059 thiss!1504) (mask!9713 thiss!1504)))))

(assert (=> d!58447 (validMask!0 (mask!9713 thiss!1504))))

(assert (=> d!58447 (= (seekEntryOrOpen!0 key!932 (_keys!6059 thiss!1504) (mask!9713 thiss!1504)) lt!110913)))

(declare-fun b!215015 () Bool)

(assert (=> b!215015 (= e!139835 (MissingZero!713 (index!5024 lt!110915)))))

(declare-fun b!215016 () Bool)

(assert (=> b!215016 (= e!139833 e!139834)))

(assert (=> b!215016 (= lt!110914 (select (arr!4898 (_keys!6059 thiss!1504)) (index!5024 lt!110915)))))

(declare-fun c!36126 () Bool)

(assert (=> b!215016 (= c!36126 (= lt!110914 key!932))))

(declare-fun b!215017 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10333 (_ BitVec 32)) SeekEntryResult!713)

(assert (=> b!215017 (= e!139835 (seekKeyOrZeroReturnVacant!0 (x!22413 lt!110915) (index!5024 lt!110915) (index!5024 lt!110915) key!932 (_keys!6059 thiss!1504) (mask!9713 thiss!1504)))))

(declare-fun b!215018 () Bool)

(assert (=> b!215018 (= e!139834 (Found!713 (index!5024 lt!110915)))))

(declare-fun b!215019 () Bool)

(assert (=> b!215019 (= e!139833 Undefined!713)))

(assert (= (and d!58447 c!36124) b!215019))

(assert (= (and d!58447 (not c!36124)) b!215016))

(assert (= (and b!215016 c!36126) b!215018))

(assert (= (and b!215016 (not c!36126)) b!215014))

(assert (= (and b!215014 c!36125) b!215015))

(assert (= (and b!215014 (not c!36125)) b!215017))

(assert (=> d!58447 m!242531))

(declare-fun m!242579 () Bool)

(assert (=> d!58447 m!242579))

(declare-fun m!242581 () Bool)

(assert (=> d!58447 m!242581))

(declare-fun m!242583 () Bool)

(assert (=> d!58447 m!242583))

(assert (=> d!58447 m!242583))

(declare-fun m!242585 () Bool)

(assert (=> d!58447 m!242585))

(declare-fun m!242587 () Bool)

(assert (=> d!58447 m!242587))

(declare-fun m!242589 () Bool)

(assert (=> b!215016 m!242589))

(declare-fun m!242591 () Bool)

(assert (=> b!215017 m!242591))

(assert (=> b!214933 d!58447))

(declare-fun d!58449 () Bool)

(assert (=> d!58449 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!214932 d!58449))

(declare-fun d!58451 () Bool)

(assert (=> d!58451 (= (array_inv!3215 (_keys!6059 thiss!1504)) (bvsge (size!5226 (_keys!6059 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214936 d!58451))

(declare-fun d!58453 () Bool)

(assert (=> d!58453 (= (array_inv!3216 (_values!4018 thiss!1504)) (bvsge (size!5225 (_values!4018 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214936 d!58453))

(declare-fun condMapEmpty!9473 () Bool)

(declare-fun mapDefault!9473 () ValueCell!2435)

(assert (=> mapNonEmpty!9464 (= condMapEmpty!9473 (= mapRest!9464 ((as const (Array (_ BitVec 32) ValueCell!2435)) mapDefault!9473)))))

(declare-fun e!139840 () Bool)

(declare-fun mapRes!9473 () Bool)

(assert (=> mapNonEmpty!9464 (= tp!20185 (and e!139840 mapRes!9473))))

(declare-fun mapNonEmpty!9473 () Bool)

(declare-fun tp!20201 () Bool)

(declare-fun e!139841 () Bool)

(assert (=> mapNonEmpty!9473 (= mapRes!9473 (and tp!20201 e!139841))))

(declare-fun mapRest!9473 () (Array (_ BitVec 32) ValueCell!2435))

(declare-fun mapValue!9473 () ValueCell!2435)

(declare-fun mapKey!9473 () (_ BitVec 32))

(assert (=> mapNonEmpty!9473 (= mapRest!9464 (store mapRest!9473 mapKey!9473 mapValue!9473))))

(declare-fun mapIsEmpty!9473 () Bool)

(assert (=> mapIsEmpty!9473 mapRes!9473))

(declare-fun b!215026 () Bool)

(assert (=> b!215026 (= e!139841 tp_is_empty!5557)))

(declare-fun b!215027 () Bool)

(assert (=> b!215027 (= e!139840 tp_is_empty!5557)))

(assert (= (and mapNonEmpty!9464 condMapEmpty!9473) mapIsEmpty!9473))

(assert (= (and mapNonEmpty!9464 (not condMapEmpty!9473)) mapNonEmpty!9473))

(assert (= (and mapNonEmpty!9473 ((_ is ValueCellFull!2435) mapValue!9473)) b!215026))

(assert (= (and mapNonEmpty!9464 ((_ is ValueCellFull!2435) mapDefault!9473)) b!215027))

(declare-fun m!242593 () Bool)

(assert (=> mapNonEmpty!9473 m!242593))

(check-sat (not b!215000) (not d!58445) (not b!215017) (not b_next!5695) (not b!214999) tp_is_empty!5557 (not b!215001) (not d!58447) (not mapNonEmpty!9473) b_and!12599)
(check-sat b_and!12599 (not b_next!5695))
