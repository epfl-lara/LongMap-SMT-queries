; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21380 () Bool)

(assert start!21380)

(declare-fun b!214913 () Bool)

(declare-fun b_free!5697 () Bool)

(declare-fun b_next!5697 () Bool)

(assert (=> b!214913 (= b_free!5697 (not b_next!5697))))

(declare-fun tp!20191 () Bool)

(declare-fun b_and!12587 () Bool)

(assert (=> b!214913 (= tp!20191 b_and!12587)))

(declare-fun b!214911 () Bool)

(declare-fun res!105179 () Bool)

(declare-fun e!139779 () Bool)

(assert (=> b!214911 (=> (not res!105179) (not e!139779))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7059 0))(
  ( (V!7060 (val!2824 Int)) )
))
(declare-datatypes ((ValueCell!2436 0))(
  ( (ValueCellFull!2436 (v!4842 V!7059)) (EmptyCell!2436) )
))
(declare-datatypes ((array!10337 0))(
  ( (array!10338 (arr!4900 (Array (_ BitVec 32) ValueCell!2436)) (size!5228 (_ BitVec 32))) )
))
(declare-datatypes ((array!10339 0))(
  ( (array!10340 (arr!4901 (Array (_ BitVec 32) (_ BitVec 64))) (size!5229 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2772 0))(
  ( (LongMapFixedSize!2773 (defaultEntry!4036 Int) (mask!9714 (_ BitVec 32)) (extraKeys!3773 (_ BitVec 32)) (zeroValue!3877 V!7059) (minValue!3877 V!7059) (_size!1435 (_ BitVec 32)) (_keys!6060 array!10339) (_values!4019 array!10337) (_vacant!1435 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2772)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!725 0))(
  ( (MissingZero!725 (index!5070 (_ BitVec 32))) (Found!725 (index!5071 (_ BitVec 32))) (Intermediate!725 (undefined!1537 Bool) (index!5072 (_ BitVec 32)) (x!22425 (_ BitVec 32))) (Undefined!725) (MissingVacant!725 (index!5073 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10339 (_ BitVec 32)) SeekEntryResult!725)

(assert (=> b!214911 (= res!105179 (not (= (seekEntryOrOpen!0 key!932 (_keys!6060 thiss!1504) (mask!9714 thiss!1504)) (MissingZero!725 index!297))))))

(declare-fun b!214912 () Bool)

(declare-fun e!139777 () Bool)

(declare-fun tp_is_empty!5559 () Bool)

(assert (=> b!214912 (= e!139777 tp_is_empty!5559)))

(declare-fun e!139780 () Bool)

(declare-fun e!139778 () Bool)

(declare-fun array_inv!3243 (array!10339) Bool)

(declare-fun array_inv!3244 (array!10337) Bool)

(assert (=> b!214913 (= e!139778 (and tp!20191 tp_is_empty!5559 (array_inv!3243 (_keys!6060 thiss!1504)) (array_inv!3244 (_values!4019 thiss!1504)) e!139780))))

(declare-fun b!214914 () Bool)

(declare-fun res!105176 () Bool)

(assert (=> b!214914 (=> (not res!105176) (not e!139779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214914 (= res!105176 (validMask!0 (mask!9714 thiss!1504)))))

(declare-fun b!214915 () Bool)

(declare-fun res!105177 () Bool)

(assert (=> b!214915 (=> (not res!105177) (not e!139779))))

(assert (=> b!214915 (= res!105177 (and (bvsge (mask!9714 thiss!1504) #b00000000000000000000000000000000) (= (size!5229 (_keys!6060 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9714 thiss!1504)))))))

(declare-fun mapIsEmpty!9467 () Bool)

(declare-fun mapRes!9467 () Bool)

(assert (=> mapIsEmpty!9467 mapRes!9467))

(declare-fun mapNonEmpty!9467 () Bool)

(declare-fun tp!20192 () Bool)

(assert (=> mapNonEmpty!9467 (= mapRes!9467 (and tp!20192 e!139777))))

(declare-fun mapKey!9467 () (_ BitVec 32))

(declare-fun mapRest!9467 () (Array (_ BitVec 32) ValueCell!2436))

(declare-fun mapValue!9467 () ValueCell!2436)

(assert (=> mapNonEmpty!9467 (= (arr!4900 (_values!4019 thiss!1504)) (store mapRest!9467 mapKey!9467 mapValue!9467))))

(declare-fun b!214916 () Bool)

(declare-fun res!105178 () Bool)

(assert (=> b!214916 (=> (not res!105178) (not e!139779))))

(assert (=> b!214916 (= res!105178 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214910 () Bool)

(declare-fun e!139781 () Bool)

(assert (=> b!214910 (= e!139781 tp_is_empty!5559)))

(declare-fun res!105175 () Bool)

(assert (=> start!21380 (=> (not res!105175) (not e!139779))))

(declare-fun valid!1133 (LongMapFixedSize!2772) Bool)

(assert (=> start!21380 (= res!105175 (valid!1133 thiss!1504))))

(assert (=> start!21380 e!139779))

(assert (=> start!21380 e!139778))

(assert (=> start!21380 true))

(declare-fun b!214917 () Bool)

(assert (=> b!214917 (= e!139780 (and e!139781 mapRes!9467))))

(declare-fun condMapEmpty!9467 () Bool)

(declare-fun mapDefault!9467 () ValueCell!2436)

(assert (=> b!214917 (= condMapEmpty!9467 (= (arr!4900 (_values!4019 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2436)) mapDefault!9467)))))

(declare-fun b!214918 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214918 (= e!139779 (not (validKeyInArray!0 key!932)))))

(assert (= (and start!21380 res!105175) b!214916))

(assert (= (and b!214916 res!105178) b!214911))

(assert (= (and b!214911 res!105179) b!214914))

(assert (= (and b!214914 res!105176) b!214915))

(assert (= (and b!214915 res!105177) b!214918))

(assert (= (and b!214917 condMapEmpty!9467) mapIsEmpty!9467))

(assert (= (and b!214917 (not condMapEmpty!9467)) mapNonEmpty!9467))

(get-info :version)

(assert (= (and mapNonEmpty!9467 ((_ is ValueCellFull!2436) mapValue!9467)) b!214912))

(assert (= (and b!214917 ((_ is ValueCellFull!2436) mapDefault!9467)) b!214910))

(assert (= b!214913 b!214917))

(assert (= start!21380 b!214913))

(declare-fun m!242361 () Bool)

(assert (=> mapNonEmpty!9467 m!242361))

(declare-fun m!242363 () Bool)

(assert (=> b!214914 m!242363))

(declare-fun m!242365 () Bool)

(assert (=> b!214911 m!242365))

(declare-fun m!242367 () Bool)

(assert (=> b!214913 m!242367))

(declare-fun m!242369 () Bool)

(assert (=> b!214913 m!242369))

(declare-fun m!242371 () Bool)

(assert (=> start!21380 m!242371))

(declare-fun m!242373 () Bool)

(assert (=> b!214918 m!242373))

(check-sat (not b_next!5697) (not b!214918) (not start!21380) b_and!12587 (not mapNonEmpty!9467) tp_is_empty!5559 (not b!214913) (not b!214911) (not b!214914))
(check-sat b_and!12587 (not b_next!5697))
(get-model)

(declare-fun b!214958 () Bool)

(declare-fun e!139806 () SeekEntryResult!725)

(declare-fun e!139808 () SeekEntryResult!725)

(assert (=> b!214958 (= e!139806 e!139808)))

(declare-fun lt!110856 () (_ BitVec 64))

(declare-fun lt!110854 () SeekEntryResult!725)

(assert (=> b!214958 (= lt!110856 (select (arr!4901 (_keys!6060 thiss!1504)) (index!5072 lt!110854)))))

(declare-fun c!36112 () Bool)

(assert (=> b!214958 (= c!36112 (= lt!110856 key!932))))

(declare-fun b!214959 () Bool)

(declare-fun c!36111 () Bool)

(assert (=> b!214959 (= c!36111 (= lt!110856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139807 () SeekEntryResult!725)

(assert (=> b!214959 (= e!139808 e!139807)))

(declare-fun b!214960 () Bool)

(assert (=> b!214960 (= e!139806 Undefined!725)))

(declare-fun b!214962 () Bool)

(assert (=> b!214962 (= e!139808 (Found!725 (index!5072 lt!110854)))))

(declare-fun b!214963 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10339 (_ BitVec 32)) SeekEntryResult!725)

(assert (=> b!214963 (= e!139807 (seekKeyOrZeroReturnVacant!0 (x!22425 lt!110854) (index!5072 lt!110854) (index!5072 lt!110854) key!932 (_keys!6060 thiss!1504) (mask!9714 thiss!1504)))))

(declare-fun b!214961 () Bool)

(assert (=> b!214961 (= e!139807 (MissingZero!725 (index!5072 lt!110854)))))

(declare-fun d!58369 () Bool)

(declare-fun lt!110855 () SeekEntryResult!725)

(assert (=> d!58369 (and (or ((_ is Undefined!725) lt!110855) (not ((_ is Found!725) lt!110855)) (and (bvsge (index!5071 lt!110855) #b00000000000000000000000000000000) (bvslt (index!5071 lt!110855) (size!5229 (_keys!6060 thiss!1504))))) (or ((_ is Undefined!725) lt!110855) ((_ is Found!725) lt!110855) (not ((_ is MissingZero!725) lt!110855)) (and (bvsge (index!5070 lt!110855) #b00000000000000000000000000000000) (bvslt (index!5070 lt!110855) (size!5229 (_keys!6060 thiss!1504))))) (or ((_ is Undefined!725) lt!110855) ((_ is Found!725) lt!110855) ((_ is MissingZero!725) lt!110855) (not ((_ is MissingVacant!725) lt!110855)) (and (bvsge (index!5073 lt!110855) #b00000000000000000000000000000000) (bvslt (index!5073 lt!110855) (size!5229 (_keys!6060 thiss!1504))))) (or ((_ is Undefined!725) lt!110855) (ite ((_ is Found!725) lt!110855) (= (select (arr!4901 (_keys!6060 thiss!1504)) (index!5071 lt!110855)) key!932) (ite ((_ is MissingZero!725) lt!110855) (= (select (arr!4901 (_keys!6060 thiss!1504)) (index!5070 lt!110855)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!725) lt!110855) (= (select (arr!4901 (_keys!6060 thiss!1504)) (index!5073 lt!110855)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58369 (= lt!110855 e!139806)))

(declare-fun c!36113 () Bool)

(assert (=> d!58369 (= c!36113 (and ((_ is Intermediate!725) lt!110854) (undefined!1537 lt!110854)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10339 (_ BitVec 32)) SeekEntryResult!725)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58369 (= lt!110854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9714 thiss!1504)) key!932 (_keys!6060 thiss!1504) (mask!9714 thiss!1504)))))

(assert (=> d!58369 (validMask!0 (mask!9714 thiss!1504))))

(assert (=> d!58369 (= (seekEntryOrOpen!0 key!932 (_keys!6060 thiss!1504) (mask!9714 thiss!1504)) lt!110855)))

(assert (= (and d!58369 c!36113) b!214960))

(assert (= (and d!58369 (not c!36113)) b!214958))

(assert (= (and b!214958 c!36112) b!214962))

(assert (= (and b!214958 (not c!36112)) b!214959))

(assert (= (and b!214959 c!36111) b!214961))

(assert (= (and b!214959 (not c!36111)) b!214963))

(declare-fun m!242389 () Bool)

(assert (=> b!214958 m!242389))

(declare-fun m!242391 () Bool)

(assert (=> b!214963 m!242391))

(declare-fun m!242393 () Bool)

(assert (=> d!58369 m!242393))

(declare-fun m!242395 () Bool)

(assert (=> d!58369 m!242395))

(assert (=> d!58369 m!242363))

(declare-fun m!242397 () Bool)

(assert (=> d!58369 m!242397))

(assert (=> d!58369 m!242397))

(declare-fun m!242399 () Bool)

(assert (=> d!58369 m!242399))

(declare-fun m!242401 () Bool)

(assert (=> d!58369 m!242401))

(assert (=> b!214911 d!58369))

(declare-fun d!58371 () Bool)

(assert (=> d!58371 (= (validMask!0 (mask!9714 thiss!1504)) (and (or (= (mask!9714 thiss!1504) #b00000000000000000000000000000111) (= (mask!9714 thiss!1504) #b00000000000000000000000000001111) (= (mask!9714 thiss!1504) #b00000000000000000000000000011111) (= (mask!9714 thiss!1504) #b00000000000000000000000000111111) (= (mask!9714 thiss!1504) #b00000000000000000000000001111111) (= (mask!9714 thiss!1504) #b00000000000000000000000011111111) (= (mask!9714 thiss!1504) #b00000000000000000000000111111111) (= (mask!9714 thiss!1504) #b00000000000000000000001111111111) (= (mask!9714 thiss!1504) #b00000000000000000000011111111111) (= (mask!9714 thiss!1504) #b00000000000000000000111111111111) (= (mask!9714 thiss!1504) #b00000000000000000001111111111111) (= (mask!9714 thiss!1504) #b00000000000000000011111111111111) (= (mask!9714 thiss!1504) #b00000000000000000111111111111111) (= (mask!9714 thiss!1504) #b00000000000000001111111111111111) (= (mask!9714 thiss!1504) #b00000000000000011111111111111111) (= (mask!9714 thiss!1504) #b00000000000000111111111111111111) (= (mask!9714 thiss!1504) #b00000000000001111111111111111111) (= (mask!9714 thiss!1504) #b00000000000011111111111111111111) (= (mask!9714 thiss!1504) #b00000000000111111111111111111111) (= (mask!9714 thiss!1504) #b00000000001111111111111111111111) (= (mask!9714 thiss!1504) #b00000000011111111111111111111111) (= (mask!9714 thiss!1504) #b00000000111111111111111111111111) (= (mask!9714 thiss!1504) #b00000001111111111111111111111111) (= (mask!9714 thiss!1504) #b00000011111111111111111111111111) (= (mask!9714 thiss!1504) #b00000111111111111111111111111111) (= (mask!9714 thiss!1504) #b00001111111111111111111111111111) (= (mask!9714 thiss!1504) #b00011111111111111111111111111111) (= (mask!9714 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9714 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214914 d!58371))

(declare-fun d!58373 () Bool)

(assert (=> d!58373 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!214918 d!58373))

(declare-fun d!58375 () Bool)

(declare-fun res!105201 () Bool)

(declare-fun e!139811 () Bool)

(assert (=> d!58375 (=> (not res!105201) (not e!139811))))

(declare-fun simpleValid!214 (LongMapFixedSize!2772) Bool)

(assert (=> d!58375 (= res!105201 (simpleValid!214 thiss!1504))))

(assert (=> d!58375 (= (valid!1133 thiss!1504) e!139811)))

(declare-fun b!214970 () Bool)

(declare-fun res!105202 () Bool)

(assert (=> b!214970 (=> (not res!105202) (not e!139811))))

(declare-fun arrayCountValidKeys!0 (array!10339 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214970 (= res!105202 (= (arrayCountValidKeys!0 (_keys!6060 thiss!1504) #b00000000000000000000000000000000 (size!5229 (_keys!6060 thiss!1504))) (_size!1435 thiss!1504)))))

(declare-fun b!214971 () Bool)

(declare-fun res!105203 () Bool)

(assert (=> b!214971 (=> (not res!105203) (not e!139811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10339 (_ BitVec 32)) Bool)

(assert (=> b!214971 (= res!105203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6060 thiss!1504) (mask!9714 thiss!1504)))))

(declare-fun b!214972 () Bool)

(declare-datatypes ((List!3133 0))(
  ( (Nil!3130) (Cons!3129 (h!3772 (_ BitVec 64)) (t!8088 List!3133)) )
))
(declare-fun arrayNoDuplicates!0 (array!10339 (_ BitVec 32) List!3133) Bool)

(assert (=> b!214972 (= e!139811 (arrayNoDuplicates!0 (_keys!6060 thiss!1504) #b00000000000000000000000000000000 Nil!3130))))

(assert (= (and d!58375 res!105201) b!214970))

(assert (= (and b!214970 res!105202) b!214971))

(assert (= (and b!214971 res!105203) b!214972))

(declare-fun m!242403 () Bool)

(assert (=> d!58375 m!242403))

(declare-fun m!242405 () Bool)

(assert (=> b!214970 m!242405))

(declare-fun m!242407 () Bool)

(assert (=> b!214971 m!242407))

(declare-fun m!242409 () Bool)

(assert (=> b!214972 m!242409))

(assert (=> start!21380 d!58375))

(declare-fun d!58377 () Bool)

(assert (=> d!58377 (= (array_inv!3243 (_keys!6060 thiss!1504)) (bvsge (size!5229 (_keys!6060 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214913 d!58377))

(declare-fun d!58379 () Bool)

(assert (=> d!58379 (= (array_inv!3244 (_values!4019 thiss!1504)) (bvsge (size!5228 (_values!4019 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214913 d!58379))

(declare-fun mapIsEmpty!9473 () Bool)

(declare-fun mapRes!9473 () Bool)

(assert (=> mapIsEmpty!9473 mapRes!9473))

(declare-fun b!214980 () Bool)

(declare-fun e!139816 () Bool)

(assert (=> b!214980 (= e!139816 tp_is_empty!5559)))

(declare-fun condMapEmpty!9473 () Bool)

(declare-fun mapDefault!9473 () ValueCell!2436)

(assert (=> mapNonEmpty!9467 (= condMapEmpty!9473 (= mapRest!9467 ((as const (Array (_ BitVec 32) ValueCell!2436)) mapDefault!9473)))))

(assert (=> mapNonEmpty!9467 (= tp!20192 (and e!139816 mapRes!9473))))

(declare-fun mapNonEmpty!9473 () Bool)

(declare-fun tp!20201 () Bool)

(declare-fun e!139817 () Bool)

(assert (=> mapNonEmpty!9473 (= mapRes!9473 (and tp!20201 e!139817))))

(declare-fun mapRest!9473 () (Array (_ BitVec 32) ValueCell!2436))

(declare-fun mapValue!9473 () ValueCell!2436)

(declare-fun mapKey!9473 () (_ BitVec 32))

(assert (=> mapNonEmpty!9473 (= mapRest!9467 (store mapRest!9473 mapKey!9473 mapValue!9473))))

(declare-fun b!214979 () Bool)

(assert (=> b!214979 (= e!139817 tp_is_empty!5559)))

(assert (= (and mapNonEmpty!9467 condMapEmpty!9473) mapIsEmpty!9473))

(assert (= (and mapNonEmpty!9467 (not condMapEmpty!9473)) mapNonEmpty!9473))

(assert (= (and mapNonEmpty!9473 ((_ is ValueCellFull!2436) mapValue!9473)) b!214979))

(assert (= (and mapNonEmpty!9467 ((_ is ValueCellFull!2436) mapDefault!9473)) b!214980))

(declare-fun m!242411 () Bool)

(assert (=> mapNonEmpty!9473 m!242411))

(check-sat (not b!214963) (not b!214970) b_and!12587 (not b!214971) (not b!214972) (not d!58369) tp_is_empty!5559 (not d!58375) (not mapNonEmpty!9473) (not b_next!5697))
(check-sat b_and!12587 (not b_next!5697))
