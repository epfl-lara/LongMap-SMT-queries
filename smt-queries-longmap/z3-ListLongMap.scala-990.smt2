; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21350 () Bool)

(assert start!21350)

(declare-fun b!214707 () Bool)

(declare-fun b_free!5691 () Bool)

(declare-fun b_next!5691 () Bool)

(assert (=> b!214707 (= b_free!5691 (not b_next!5691))))

(declare-fun tp!20170 () Bool)

(declare-fun b_and!12581 () Bool)

(assert (=> b!214707 (= tp!20170 b_and!12581)))

(declare-fun b!214700 () Bool)

(declare-fun res!105091 () Bool)

(declare-fun e!139652 () Bool)

(assert (=> b!214700 (=> (not res!105091) (not e!139652))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214700 (= res!105091 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9454 () Bool)

(declare-fun mapRes!9454 () Bool)

(declare-fun tp!20169 () Bool)

(declare-fun e!139648 () Bool)

(assert (=> mapNonEmpty!9454 (= mapRes!9454 (and tp!20169 e!139648))))

(declare-datatypes ((V!7051 0))(
  ( (V!7052 (val!2821 Int)) )
))
(declare-datatypes ((ValueCell!2433 0))(
  ( (ValueCellFull!2433 (v!4839 V!7051)) (EmptyCell!2433) )
))
(declare-fun mapValue!9454 () ValueCell!2433)

(declare-datatypes ((array!10323 0))(
  ( (array!10324 (arr!4894 (Array (_ BitVec 32) ValueCell!2433)) (size!5221 (_ BitVec 32))) )
))
(declare-datatypes ((array!10325 0))(
  ( (array!10326 (arr!4895 (Array (_ BitVec 32) (_ BitVec 64))) (size!5222 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2766 0))(
  ( (LongMapFixedSize!2767 (defaultEntry!4033 Int) (mask!9703 (_ BitVec 32)) (extraKeys!3770 (_ BitVec 32)) (zeroValue!3874 V!7051) (minValue!3874 V!7051) (_size!1432 (_ BitVec 32)) (_keys!6053 array!10325) (_values!4016 array!10323) (_vacant!1432 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2766)

(declare-fun mapKey!9454 () (_ BitVec 32))

(declare-fun mapRest!9454 () (Array (_ BitVec 32) ValueCell!2433))

(assert (=> mapNonEmpty!9454 (= (arr!4894 (_values!4016 thiss!1504)) (store mapRest!9454 mapKey!9454 mapValue!9454))))

(declare-fun mapIsEmpty!9454 () Bool)

(assert (=> mapIsEmpty!9454 mapRes!9454))

(declare-fun b!214701 () Bool)

(declare-fun e!139650 () Bool)

(declare-fun tp_is_empty!5553 () Bool)

(assert (=> b!214701 (= e!139650 tp_is_empty!5553)))

(declare-fun b!214702 () Bool)

(declare-fun res!105089 () Bool)

(assert (=> b!214702 (=> (not res!105089) (not e!139652))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!722 0))(
  ( (MissingZero!722 (index!5058 (_ BitVec 32))) (Found!722 (index!5059 (_ BitVec 32))) (Intermediate!722 (undefined!1534 Bool) (index!5060 (_ BitVec 32)) (x!22397 (_ BitVec 32))) (Undefined!722) (MissingVacant!722 (index!5061 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10325 (_ BitVec 32)) SeekEntryResult!722)

(assert (=> b!214702 (= res!105089 (not (= (seekEntryOrOpen!0 key!932 (_keys!6053 thiss!1504) (mask!9703 thiss!1504)) (MissingZero!722 index!297))))))

(declare-fun res!105090 () Bool)

(assert (=> start!21350 (=> (not res!105090) (not e!139652))))

(declare-fun valid!1131 (LongMapFixedSize!2766) Bool)

(assert (=> start!21350 (= res!105090 (valid!1131 thiss!1504))))

(assert (=> start!21350 e!139652))

(declare-fun e!139649 () Bool)

(assert (=> start!21350 e!139649))

(assert (=> start!21350 true))

(declare-fun b!214703 () Bool)

(assert (=> b!214703 (= e!139648 tp_is_empty!5553)))

(declare-fun b!214704 () Bool)

(assert (=> b!214704 (= e!139652 (and (bvsge (mask!9703 thiss!1504) #b00000000000000000000000000000000) (not (= (size!5222 (_keys!6053 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9703 thiss!1504))))))))

(declare-fun b!214705 () Bool)

(declare-fun e!139653 () Bool)

(assert (=> b!214705 (= e!139653 (and e!139650 mapRes!9454))))

(declare-fun condMapEmpty!9454 () Bool)

(declare-fun mapDefault!9454 () ValueCell!2433)

(assert (=> b!214705 (= condMapEmpty!9454 (= (arr!4894 (_values!4016 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2433)) mapDefault!9454)))))

(declare-fun b!214706 () Bool)

(declare-fun res!105088 () Bool)

(assert (=> b!214706 (=> (not res!105088) (not e!139652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214706 (= res!105088 (validMask!0 (mask!9703 thiss!1504)))))

(declare-fun array_inv!3237 (array!10325) Bool)

(declare-fun array_inv!3238 (array!10323) Bool)

(assert (=> b!214707 (= e!139649 (and tp!20170 tp_is_empty!5553 (array_inv!3237 (_keys!6053 thiss!1504)) (array_inv!3238 (_values!4016 thiss!1504)) e!139653))))

(assert (= (and start!21350 res!105090) b!214700))

(assert (= (and b!214700 res!105091) b!214702))

(assert (= (and b!214702 res!105089) b!214706))

(assert (= (and b!214706 res!105088) b!214704))

(assert (= (and b!214705 condMapEmpty!9454) mapIsEmpty!9454))

(assert (= (and b!214705 (not condMapEmpty!9454)) mapNonEmpty!9454))

(get-info :version)

(assert (= (and mapNonEmpty!9454 ((_ is ValueCellFull!2433) mapValue!9454)) b!214703))

(assert (= (and b!214705 ((_ is ValueCellFull!2433) mapDefault!9454)) b!214701))

(assert (= b!214707 b!214705))

(assert (= start!21350 b!214707))

(declare-fun m!242261 () Bool)

(assert (=> start!21350 m!242261))

(declare-fun m!242263 () Bool)

(assert (=> b!214702 m!242263))

(declare-fun m!242265 () Bool)

(assert (=> b!214707 m!242265))

(declare-fun m!242267 () Bool)

(assert (=> b!214707 m!242267))

(declare-fun m!242269 () Bool)

(assert (=> mapNonEmpty!9454 m!242269))

(declare-fun m!242271 () Bool)

(assert (=> b!214706 m!242271))

(check-sat b_and!12581 (not start!21350) (not mapNonEmpty!9454) (not b!214706) (not b_next!5691) (not b!214702) tp_is_empty!5553 (not b!214707))
(check-sat b_and!12581 (not b_next!5691))
(get-model)

(declare-fun d!58343 () Bool)

(assert (=> d!58343 (= (validMask!0 (mask!9703 thiss!1504)) (and (or (= (mask!9703 thiss!1504) #b00000000000000000000000000000111) (= (mask!9703 thiss!1504) #b00000000000000000000000000001111) (= (mask!9703 thiss!1504) #b00000000000000000000000000011111) (= (mask!9703 thiss!1504) #b00000000000000000000000000111111) (= (mask!9703 thiss!1504) #b00000000000000000000000001111111) (= (mask!9703 thiss!1504) #b00000000000000000000000011111111) (= (mask!9703 thiss!1504) #b00000000000000000000000111111111) (= (mask!9703 thiss!1504) #b00000000000000000000001111111111) (= (mask!9703 thiss!1504) #b00000000000000000000011111111111) (= (mask!9703 thiss!1504) #b00000000000000000000111111111111) (= (mask!9703 thiss!1504) #b00000000000000000001111111111111) (= (mask!9703 thiss!1504) #b00000000000000000011111111111111) (= (mask!9703 thiss!1504) #b00000000000000000111111111111111) (= (mask!9703 thiss!1504) #b00000000000000001111111111111111) (= (mask!9703 thiss!1504) #b00000000000000011111111111111111) (= (mask!9703 thiss!1504) #b00000000000000111111111111111111) (= (mask!9703 thiss!1504) #b00000000000001111111111111111111) (= (mask!9703 thiss!1504) #b00000000000011111111111111111111) (= (mask!9703 thiss!1504) #b00000000000111111111111111111111) (= (mask!9703 thiss!1504) #b00000000001111111111111111111111) (= (mask!9703 thiss!1504) #b00000000011111111111111111111111) (= (mask!9703 thiss!1504) #b00000000111111111111111111111111) (= (mask!9703 thiss!1504) #b00000001111111111111111111111111) (= (mask!9703 thiss!1504) #b00000011111111111111111111111111) (= (mask!9703 thiss!1504) #b00000111111111111111111111111111) (= (mask!9703 thiss!1504) #b00001111111111111111111111111111) (= (mask!9703 thiss!1504) #b00011111111111111111111111111111) (= (mask!9703 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9703 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214706 d!58343))

(declare-fun d!58345 () Bool)

(declare-fun res!105110 () Bool)

(declare-fun e!139674 () Bool)

(assert (=> d!58345 (=> (not res!105110) (not e!139674))))

(declare-fun simpleValid!213 (LongMapFixedSize!2766) Bool)

(assert (=> d!58345 (= res!105110 (simpleValid!213 thiss!1504))))

(assert (=> d!58345 (= (valid!1131 thiss!1504) e!139674)))

(declare-fun b!214738 () Bool)

(declare-fun res!105111 () Bool)

(assert (=> b!214738 (=> (not res!105111) (not e!139674))))

(declare-fun arrayCountValidKeys!0 (array!10325 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214738 (= res!105111 (= (arrayCountValidKeys!0 (_keys!6053 thiss!1504) #b00000000000000000000000000000000 (size!5222 (_keys!6053 thiss!1504))) (_size!1432 thiss!1504)))))

(declare-fun b!214739 () Bool)

(declare-fun res!105112 () Bool)

(assert (=> b!214739 (=> (not res!105112) (not e!139674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10325 (_ BitVec 32)) Bool)

(assert (=> b!214739 (= res!105112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6053 thiss!1504) (mask!9703 thiss!1504)))))

(declare-fun b!214740 () Bool)

(declare-datatypes ((List!3132 0))(
  ( (Nil!3129) (Cons!3128 (h!3770 (_ BitVec 64)) (t!8087 List!3132)) )
))
(declare-fun arrayNoDuplicates!0 (array!10325 (_ BitVec 32) List!3132) Bool)

(assert (=> b!214740 (= e!139674 (arrayNoDuplicates!0 (_keys!6053 thiss!1504) #b00000000000000000000000000000000 Nil!3129))))

(assert (= (and d!58345 res!105110) b!214738))

(assert (= (and b!214738 res!105111) b!214739))

(assert (= (and b!214739 res!105112) b!214740))

(declare-fun m!242285 () Bool)

(assert (=> d!58345 m!242285))

(declare-fun m!242287 () Bool)

(assert (=> b!214738 m!242287))

(declare-fun m!242289 () Bool)

(assert (=> b!214739 m!242289))

(declare-fun m!242291 () Bool)

(assert (=> b!214740 m!242291))

(assert (=> start!21350 d!58345))

(declare-fun b!214753 () Bool)

(declare-fun e!139683 () SeekEntryResult!722)

(declare-fun lt!110815 () SeekEntryResult!722)

(assert (=> b!214753 (= e!139683 (Found!722 (index!5060 lt!110815)))))

(declare-fun d!58347 () Bool)

(declare-fun lt!110816 () SeekEntryResult!722)

(assert (=> d!58347 (and (or ((_ is Undefined!722) lt!110816) (not ((_ is Found!722) lt!110816)) (and (bvsge (index!5059 lt!110816) #b00000000000000000000000000000000) (bvslt (index!5059 lt!110816) (size!5222 (_keys!6053 thiss!1504))))) (or ((_ is Undefined!722) lt!110816) ((_ is Found!722) lt!110816) (not ((_ is MissingZero!722) lt!110816)) (and (bvsge (index!5058 lt!110816) #b00000000000000000000000000000000) (bvslt (index!5058 lt!110816) (size!5222 (_keys!6053 thiss!1504))))) (or ((_ is Undefined!722) lt!110816) ((_ is Found!722) lt!110816) ((_ is MissingZero!722) lt!110816) (not ((_ is MissingVacant!722) lt!110816)) (and (bvsge (index!5061 lt!110816) #b00000000000000000000000000000000) (bvslt (index!5061 lt!110816) (size!5222 (_keys!6053 thiss!1504))))) (or ((_ is Undefined!722) lt!110816) (ite ((_ is Found!722) lt!110816) (= (select (arr!4895 (_keys!6053 thiss!1504)) (index!5059 lt!110816)) key!932) (ite ((_ is MissingZero!722) lt!110816) (= (select (arr!4895 (_keys!6053 thiss!1504)) (index!5058 lt!110816)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!722) lt!110816) (= (select (arr!4895 (_keys!6053 thiss!1504)) (index!5061 lt!110816)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!139682 () SeekEntryResult!722)

(assert (=> d!58347 (= lt!110816 e!139682)))

(declare-fun c!36073 () Bool)

(assert (=> d!58347 (= c!36073 (and ((_ is Intermediate!722) lt!110815) (undefined!1534 lt!110815)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10325 (_ BitVec 32)) SeekEntryResult!722)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58347 (= lt!110815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9703 thiss!1504)) key!932 (_keys!6053 thiss!1504) (mask!9703 thiss!1504)))))

(assert (=> d!58347 (validMask!0 (mask!9703 thiss!1504))))

(assert (=> d!58347 (= (seekEntryOrOpen!0 key!932 (_keys!6053 thiss!1504) (mask!9703 thiss!1504)) lt!110816)))

(declare-fun b!214754 () Bool)

(assert (=> b!214754 (= e!139682 e!139683)))

(declare-fun lt!110817 () (_ BitVec 64))

(assert (=> b!214754 (= lt!110817 (select (arr!4895 (_keys!6053 thiss!1504)) (index!5060 lt!110815)))))

(declare-fun c!36072 () Bool)

(assert (=> b!214754 (= c!36072 (= lt!110817 key!932))))

(declare-fun e!139681 () SeekEntryResult!722)

(declare-fun b!214755 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10325 (_ BitVec 32)) SeekEntryResult!722)

(assert (=> b!214755 (= e!139681 (seekKeyOrZeroReturnVacant!0 (x!22397 lt!110815) (index!5060 lt!110815) (index!5060 lt!110815) key!932 (_keys!6053 thiss!1504) (mask!9703 thiss!1504)))))

(declare-fun b!214756 () Bool)

(assert (=> b!214756 (= e!139682 Undefined!722)))

(declare-fun b!214757 () Bool)

(assert (=> b!214757 (= e!139681 (MissingZero!722 (index!5060 lt!110815)))))

(declare-fun b!214758 () Bool)

(declare-fun c!36074 () Bool)

(assert (=> b!214758 (= c!36074 (= lt!110817 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!214758 (= e!139683 e!139681)))

(assert (= (and d!58347 c!36073) b!214756))

(assert (= (and d!58347 (not c!36073)) b!214754))

(assert (= (and b!214754 c!36072) b!214753))

(assert (= (and b!214754 (not c!36072)) b!214758))

(assert (= (and b!214758 c!36074) b!214757))

(assert (= (and b!214758 (not c!36074)) b!214755))

(declare-fun m!242293 () Bool)

(assert (=> d!58347 m!242293))

(assert (=> d!58347 m!242271))

(declare-fun m!242295 () Bool)

(assert (=> d!58347 m!242295))

(declare-fun m!242297 () Bool)

(assert (=> d!58347 m!242297))

(assert (=> d!58347 m!242295))

(declare-fun m!242299 () Bool)

(assert (=> d!58347 m!242299))

(declare-fun m!242301 () Bool)

(assert (=> d!58347 m!242301))

(declare-fun m!242303 () Bool)

(assert (=> b!214754 m!242303))

(declare-fun m!242305 () Bool)

(assert (=> b!214755 m!242305))

(assert (=> b!214702 d!58347))

(declare-fun d!58349 () Bool)

(assert (=> d!58349 (= (array_inv!3237 (_keys!6053 thiss!1504)) (bvsge (size!5222 (_keys!6053 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214707 d!58349))

(declare-fun d!58351 () Bool)

(assert (=> d!58351 (= (array_inv!3238 (_values!4016 thiss!1504)) (bvsge (size!5221 (_values!4016 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214707 d!58351))

(declare-fun condMapEmpty!9460 () Bool)

(declare-fun mapDefault!9460 () ValueCell!2433)

(assert (=> mapNonEmpty!9454 (= condMapEmpty!9460 (= mapRest!9454 ((as const (Array (_ BitVec 32) ValueCell!2433)) mapDefault!9460)))))

(declare-fun e!139688 () Bool)

(declare-fun mapRes!9460 () Bool)

(assert (=> mapNonEmpty!9454 (= tp!20169 (and e!139688 mapRes!9460))))

(declare-fun b!214765 () Bool)

(declare-fun e!139689 () Bool)

(assert (=> b!214765 (= e!139689 tp_is_empty!5553)))

(declare-fun b!214766 () Bool)

(assert (=> b!214766 (= e!139688 tp_is_empty!5553)))

(declare-fun mapNonEmpty!9460 () Bool)

(declare-fun tp!20179 () Bool)

(assert (=> mapNonEmpty!9460 (= mapRes!9460 (and tp!20179 e!139689))))

(declare-fun mapValue!9460 () ValueCell!2433)

(declare-fun mapRest!9460 () (Array (_ BitVec 32) ValueCell!2433))

(declare-fun mapKey!9460 () (_ BitVec 32))

(assert (=> mapNonEmpty!9460 (= mapRest!9454 (store mapRest!9460 mapKey!9460 mapValue!9460))))

(declare-fun mapIsEmpty!9460 () Bool)

(assert (=> mapIsEmpty!9460 mapRes!9460))

(assert (= (and mapNonEmpty!9454 condMapEmpty!9460) mapIsEmpty!9460))

(assert (= (and mapNonEmpty!9454 (not condMapEmpty!9460)) mapNonEmpty!9460))

(assert (= (and mapNonEmpty!9460 ((_ is ValueCellFull!2433) mapValue!9460)) b!214765))

(assert (= (and mapNonEmpty!9454 ((_ is ValueCellFull!2433) mapDefault!9460)) b!214766))

(declare-fun m!242307 () Bool)

(assert (=> mapNonEmpty!9460 m!242307))

(check-sat (not d!58347) b_and!12581 (not b!214740) (not b!214739) (not b_next!5691) (not b!214738) tp_is_empty!5553 (not b!214755) (not d!58345) (not mapNonEmpty!9460))
(check-sat b_and!12581 (not b_next!5691))
(get-model)

(declare-fun b!214785 () Bool)

(declare-fun lt!110822 () SeekEntryResult!722)

(assert (=> b!214785 (and (bvsge (index!5060 lt!110822) #b00000000000000000000000000000000) (bvslt (index!5060 lt!110822) (size!5222 (_keys!6053 thiss!1504))))))

(declare-fun e!139702 () Bool)

(assert (=> b!214785 (= e!139702 (= (select (arr!4895 (_keys!6053 thiss!1504)) (index!5060 lt!110822)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!214786 () Bool)

(declare-fun e!139700 () SeekEntryResult!722)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214786 (= e!139700 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9703 thiss!1504)) #b00000000000000000000000000000000 (mask!9703 thiss!1504)) key!932 (_keys!6053 thiss!1504) (mask!9703 thiss!1504)))))

(declare-fun b!214787 () Bool)

(declare-fun e!139701 () Bool)

(assert (=> b!214787 (= e!139701 (bvsge (x!22397 lt!110822) #b01111111111111111111111111111110))))

(declare-fun b!214788 () Bool)

(declare-fun e!139703 () SeekEntryResult!722)

(assert (=> b!214788 (= e!139703 (Intermediate!722 true (toIndex!0 key!932 (mask!9703 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!214789 () Bool)

(assert (=> b!214789 (= e!139700 (Intermediate!722 false (toIndex!0 key!932 (mask!9703 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!214790 () Bool)

(assert (=> b!214790 (= e!139703 e!139700)))

(declare-fun c!36082 () Bool)

(declare-fun lt!110823 () (_ BitVec 64))

(assert (=> b!214790 (= c!36082 (or (= lt!110823 key!932) (= (bvadd lt!110823 lt!110823) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!214791 () Bool)

(declare-fun e!139704 () Bool)

(assert (=> b!214791 (= e!139701 e!139704)))

(declare-fun res!105121 () Bool)

(assert (=> b!214791 (= res!105121 (and ((_ is Intermediate!722) lt!110822) (not (undefined!1534 lt!110822)) (bvslt (x!22397 lt!110822) #b01111111111111111111111111111110) (bvsge (x!22397 lt!110822) #b00000000000000000000000000000000) (bvsge (x!22397 lt!110822) #b00000000000000000000000000000000)))))

(assert (=> b!214791 (=> (not res!105121) (not e!139704))))

(declare-fun b!214792 () Bool)

(assert (=> b!214792 (and (bvsge (index!5060 lt!110822) #b00000000000000000000000000000000) (bvslt (index!5060 lt!110822) (size!5222 (_keys!6053 thiss!1504))))))

(declare-fun res!105120 () Bool)

(assert (=> b!214792 (= res!105120 (= (select (arr!4895 (_keys!6053 thiss!1504)) (index!5060 lt!110822)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!214792 (=> res!105120 e!139702)))

(declare-fun b!214793 () Bool)

(assert (=> b!214793 (and (bvsge (index!5060 lt!110822) #b00000000000000000000000000000000) (bvslt (index!5060 lt!110822) (size!5222 (_keys!6053 thiss!1504))))))

(declare-fun res!105119 () Bool)

(assert (=> b!214793 (= res!105119 (= (select (arr!4895 (_keys!6053 thiss!1504)) (index!5060 lt!110822)) key!932))))

(assert (=> b!214793 (=> res!105119 e!139702)))

(assert (=> b!214793 (= e!139704 e!139702)))

(declare-fun d!58353 () Bool)

(assert (=> d!58353 e!139701))

(declare-fun c!36083 () Bool)

(assert (=> d!58353 (= c!36083 (and ((_ is Intermediate!722) lt!110822) (undefined!1534 lt!110822)))))

(assert (=> d!58353 (= lt!110822 e!139703)))

(declare-fun c!36081 () Bool)

(assert (=> d!58353 (= c!36081 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!58353 (= lt!110823 (select (arr!4895 (_keys!6053 thiss!1504)) (toIndex!0 key!932 (mask!9703 thiss!1504))))))

(assert (=> d!58353 (validMask!0 (mask!9703 thiss!1504))))

(assert (=> d!58353 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9703 thiss!1504)) key!932 (_keys!6053 thiss!1504) (mask!9703 thiss!1504)) lt!110822)))

(assert (= (and d!58353 c!36081) b!214788))

(assert (= (and d!58353 (not c!36081)) b!214790))

(assert (= (and b!214790 c!36082) b!214789))

(assert (= (and b!214790 (not c!36082)) b!214786))

(assert (= (and d!58353 c!36083) b!214787))

(assert (= (and d!58353 (not c!36083)) b!214791))

(assert (= (and b!214791 res!105121) b!214793))

(assert (= (and b!214793 (not res!105119)) b!214792))

(assert (= (and b!214792 (not res!105120)) b!214785))

(assert (=> b!214786 m!242295))

(declare-fun m!242309 () Bool)

(assert (=> b!214786 m!242309))

(assert (=> b!214786 m!242309))

(declare-fun m!242311 () Bool)

(assert (=> b!214786 m!242311))

(declare-fun m!242313 () Bool)

(assert (=> b!214785 m!242313))

(assert (=> b!214792 m!242313))

(assert (=> b!214793 m!242313))

(assert (=> d!58353 m!242295))

(declare-fun m!242315 () Bool)

(assert (=> d!58353 m!242315))

(assert (=> d!58353 m!242271))

(assert (=> d!58347 d!58353))

(declare-fun d!58355 () Bool)

(declare-fun lt!110829 () (_ BitVec 32))

(declare-fun lt!110828 () (_ BitVec 32))

(assert (=> d!58355 (= lt!110829 (bvmul (bvxor lt!110828 (bvlshr lt!110828 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58355 (= lt!110828 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58355 (and (bvsge (mask!9703 thiss!1504) #b00000000000000000000000000000000) (let ((res!105122 (let ((h!3771 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22414 (bvmul (bvxor h!3771 (bvlshr h!3771 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22414 (bvlshr x!22414 #b00000000000000000000000000001101)) (mask!9703 thiss!1504)))))) (and (bvslt res!105122 (bvadd (mask!9703 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105122 #b00000000000000000000000000000000))))))

(assert (=> d!58355 (= (toIndex!0 key!932 (mask!9703 thiss!1504)) (bvand (bvxor lt!110829 (bvlshr lt!110829 #b00000000000000000000000000001101)) (mask!9703 thiss!1504)))))

(assert (=> d!58347 d!58355))

(assert (=> d!58347 d!58343))

(declare-fun b!214802 () Bool)

(declare-fun e!139712 () Bool)

(declare-fun call!20325 () Bool)

(assert (=> b!214802 (= e!139712 call!20325)))

(declare-fun d!58357 () Bool)

(declare-fun res!105128 () Bool)

(declare-fun e!139713 () Bool)

(assert (=> d!58357 (=> res!105128 e!139713)))

(assert (=> d!58357 (= res!105128 (bvsge #b00000000000000000000000000000000 (size!5222 (_keys!6053 thiss!1504))))))

(assert (=> d!58357 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6053 thiss!1504) (mask!9703 thiss!1504)) e!139713)))

(declare-fun b!214803 () Bool)

(declare-fun e!139711 () Bool)

(assert (=> b!214803 (= e!139711 call!20325)))

(declare-fun bm!20322 () Bool)

(assert (=> bm!20322 (= call!20325 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6053 thiss!1504) (mask!9703 thiss!1504)))))

(declare-fun b!214804 () Bool)

(assert (=> b!214804 (= e!139712 e!139711)))

(declare-fun lt!110836 () (_ BitVec 64))

(assert (=> b!214804 (= lt!110836 (select (arr!4895 (_keys!6053 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6492 0))(
  ( (Unit!6493) )
))
(declare-fun lt!110837 () Unit!6492)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10325 (_ BitVec 64) (_ BitVec 32)) Unit!6492)

(assert (=> b!214804 (= lt!110837 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6053 thiss!1504) lt!110836 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!214804 (arrayContainsKey!0 (_keys!6053 thiss!1504) lt!110836 #b00000000000000000000000000000000)))

(declare-fun lt!110838 () Unit!6492)

(assert (=> b!214804 (= lt!110838 lt!110837)))

(declare-fun res!105127 () Bool)

(assert (=> b!214804 (= res!105127 (= (seekEntryOrOpen!0 (select (arr!4895 (_keys!6053 thiss!1504)) #b00000000000000000000000000000000) (_keys!6053 thiss!1504) (mask!9703 thiss!1504)) (Found!722 #b00000000000000000000000000000000)))))

(assert (=> b!214804 (=> (not res!105127) (not e!139711))))

(declare-fun b!214805 () Bool)

(assert (=> b!214805 (= e!139713 e!139712)))

(declare-fun c!36086 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214805 (= c!36086 (validKeyInArray!0 (select (arr!4895 (_keys!6053 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58357 (not res!105128)) b!214805))

(assert (= (and b!214805 c!36086) b!214804))

(assert (= (and b!214805 (not c!36086)) b!214802))

(assert (= (and b!214804 res!105127) b!214803))

(assert (= (or b!214803 b!214802) bm!20322))

(declare-fun m!242317 () Bool)

(assert (=> bm!20322 m!242317))

(declare-fun m!242319 () Bool)

(assert (=> b!214804 m!242319))

(declare-fun m!242321 () Bool)

(assert (=> b!214804 m!242321))

(declare-fun m!242323 () Bool)

(assert (=> b!214804 m!242323))

(assert (=> b!214804 m!242319))

(declare-fun m!242325 () Bool)

(assert (=> b!214804 m!242325))

(assert (=> b!214805 m!242319))

(assert (=> b!214805 m!242319))

(declare-fun m!242327 () Bool)

(assert (=> b!214805 m!242327))

(assert (=> b!214739 d!58357))

(declare-fun b!214814 () Bool)

(declare-fun e!139718 () (_ BitVec 32))

(declare-fun call!20328 () (_ BitVec 32))

(assert (=> b!214814 (= e!139718 call!20328)))

(declare-fun bm!20325 () Bool)

(assert (=> bm!20325 (= call!20328 (arrayCountValidKeys!0 (_keys!6053 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5222 (_keys!6053 thiss!1504))))))

(declare-fun b!214815 () Bool)

(declare-fun e!139719 () (_ BitVec 32))

(assert (=> b!214815 (= e!139719 e!139718)))

(declare-fun c!36091 () Bool)

(assert (=> b!214815 (= c!36091 (validKeyInArray!0 (select (arr!4895 (_keys!6053 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214816 () Bool)

(assert (=> b!214816 (= e!139718 (bvadd #b00000000000000000000000000000001 call!20328))))

(declare-fun b!214817 () Bool)

(assert (=> b!214817 (= e!139719 #b00000000000000000000000000000000)))

(declare-fun d!58359 () Bool)

(declare-fun lt!110841 () (_ BitVec 32))

(assert (=> d!58359 (and (bvsge lt!110841 #b00000000000000000000000000000000) (bvsle lt!110841 (bvsub (size!5222 (_keys!6053 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58359 (= lt!110841 e!139719)))

(declare-fun c!36092 () Bool)

(assert (=> d!58359 (= c!36092 (bvsge #b00000000000000000000000000000000 (size!5222 (_keys!6053 thiss!1504))))))

(assert (=> d!58359 (and (bvsle #b00000000000000000000000000000000 (size!5222 (_keys!6053 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5222 (_keys!6053 thiss!1504)) (size!5222 (_keys!6053 thiss!1504))))))

(assert (=> d!58359 (= (arrayCountValidKeys!0 (_keys!6053 thiss!1504) #b00000000000000000000000000000000 (size!5222 (_keys!6053 thiss!1504))) lt!110841)))

(assert (= (and d!58359 c!36092) b!214817))

(assert (= (and d!58359 (not c!36092)) b!214815))

(assert (= (and b!214815 c!36091) b!214816))

(assert (= (and b!214815 (not c!36091)) b!214814))

(assert (= (or b!214816 b!214814) bm!20325))

(declare-fun m!242329 () Bool)

(assert (=> bm!20325 m!242329))

(assert (=> b!214815 m!242319))

(assert (=> b!214815 m!242319))

(assert (=> b!214815 m!242327))

(assert (=> b!214738 d!58359))

(declare-fun d!58361 () Bool)

(declare-fun res!105138 () Bool)

(declare-fun e!139722 () Bool)

(assert (=> d!58361 (=> (not res!105138) (not e!139722))))

(assert (=> d!58361 (= res!105138 (validMask!0 (mask!9703 thiss!1504)))))

(assert (=> d!58361 (= (simpleValid!213 thiss!1504) e!139722)))

(declare-fun b!214828 () Bool)

(declare-fun res!105137 () Bool)

(assert (=> b!214828 (=> (not res!105137) (not e!139722))))

(declare-fun size!5225 (LongMapFixedSize!2766) (_ BitVec 32))

(assert (=> b!214828 (= res!105137 (= (size!5225 thiss!1504) (bvadd (_size!1432 thiss!1504) (bvsdiv (bvadd (extraKeys!3770 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!214827 () Bool)

(declare-fun res!105139 () Bool)

(assert (=> b!214827 (=> (not res!105139) (not e!139722))))

(assert (=> b!214827 (= res!105139 (bvsge (size!5225 thiss!1504) (_size!1432 thiss!1504)))))

(declare-fun b!214829 () Bool)

(assert (=> b!214829 (= e!139722 (and (bvsge (extraKeys!3770 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3770 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1432 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!214826 () Bool)

(declare-fun res!105140 () Bool)

(assert (=> b!214826 (=> (not res!105140) (not e!139722))))

(assert (=> b!214826 (= res!105140 (and (= (size!5221 (_values!4016 thiss!1504)) (bvadd (mask!9703 thiss!1504) #b00000000000000000000000000000001)) (= (size!5222 (_keys!6053 thiss!1504)) (size!5221 (_values!4016 thiss!1504))) (bvsge (_size!1432 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1432 thiss!1504) (bvadd (mask!9703 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!58361 res!105138) b!214826))

(assert (= (and b!214826 res!105140) b!214827))

(assert (= (and b!214827 res!105139) b!214828))

(assert (= (and b!214828 res!105137) b!214829))

(assert (=> d!58361 m!242271))

(declare-fun m!242331 () Bool)

(assert (=> b!214828 m!242331))

(assert (=> b!214827 m!242331))

(assert (=> d!58345 d!58361))

(declare-fun b!214842 () Bool)

(declare-fun e!139729 () SeekEntryResult!722)

(assert (=> b!214842 (= e!139729 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22397 lt!110815) #b00000000000000000000000000000001) (nextIndex!0 (index!5060 lt!110815) (x!22397 lt!110815) (mask!9703 thiss!1504)) (index!5060 lt!110815) key!932 (_keys!6053 thiss!1504) (mask!9703 thiss!1504)))))

(declare-fun b!214843 () Bool)

(declare-fun e!139731 () SeekEntryResult!722)

(declare-fun e!139730 () SeekEntryResult!722)

(assert (=> b!214843 (= e!139731 e!139730)))

(declare-fun c!36101 () Bool)

(declare-fun lt!110846 () (_ BitVec 64))

(assert (=> b!214843 (= c!36101 (= lt!110846 key!932))))

(declare-fun b!214844 () Bool)

(assert (=> b!214844 (= e!139731 Undefined!722)))

(declare-fun b!214845 () Bool)

(declare-fun c!36100 () Bool)

(assert (=> b!214845 (= c!36100 (= lt!110846 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!214845 (= e!139730 e!139729)))

(declare-fun b!214846 () Bool)

(assert (=> b!214846 (= e!139729 (MissingVacant!722 (index!5060 lt!110815)))))

(declare-fun b!214847 () Bool)

(assert (=> b!214847 (= e!139730 (Found!722 (index!5060 lt!110815)))))

(declare-fun d!58363 () Bool)

(declare-fun lt!110847 () SeekEntryResult!722)

(assert (=> d!58363 (and (or ((_ is Undefined!722) lt!110847) (not ((_ is Found!722) lt!110847)) (and (bvsge (index!5059 lt!110847) #b00000000000000000000000000000000) (bvslt (index!5059 lt!110847) (size!5222 (_keys!6053 thiss!1504))))) (or ((_ is Undefined!722) lt!110847) ((_ is Found!722) lt!110847) (not ((_ is MissingVacant!722) lt!110847)) (not (= (index!5061 lt!110847) (index!5060 lt!110815))) (and (bvsge (index!5061 lt!110847) #b00000000000000000000000000000000) (bvslt (index!5061 lt!110847) (size!5222 (_keys!6053 thiss!1504))))) (or ((_ is Undefined!722) lt!110847) (ite ((_ is Found!722) lt!110847) (= (select (arr!4895 (_keys!6053 thiss!1504)) (index!5059 lt!110847)) key!932) (and ((_ is MissingVacant!722) lt!110847) (= (index!5061 lt!110847) (index!5060 lt!110815)) (= (select (arr!4895 (_keys!6053 thiss!1504)) (index!5061 lt!110847)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58363 (= lt!110847 e!139731)))

(declare-fun c!36099 () Bool)

(assert (=> d!58363 (= c!36099 (bvsge (x!22397 lt!110815) #b01111111111111111111111111111110))))

(assert (=> d!58363 (= lt!110846 (select (arr!4895 (_keys!6053 thiss!1504)) (index!5060 lt!110815)))))

(assert (=> d!58363 (validMask!0 (mask!9703 thiss!1504))))

(assert (=> d!58363 (= (seekKeyOrZeroReturnVacant!0 (x!22397 lt!110815) (index!5060 lt!110815) (index!5060 lt!110815) key!932 (_keys!6053 thiss!1504) (mask!9703 thiss!1504)) lt!110847)))

(assert (= (and d!58363 c!36099) b!214844))

(assert (= (and d!58363 (not c!36099)) b!214843))

(assert (= (and b!214843 c!36101) b!214847))

(assert (= (and b!214843 (not c!36101)) b!214845))

(assert (= (and b!214845 c!36100) b!214846))

(assert (= (and b!214845 (not c!36100)) b!214842))

(declare-fun m!242333 () Bool)

(assert (=> b!214842 m!242333))

(assert (=> b!214842 m!242333))

(declare-fun m!242335 () Bool)

(assert (=> b!214842 m!242335))

(declare-fun m!242337 () Bool)

(assert (=> d!58363 m!242337))

(declare-fun m!242339 () Bool)

(assert (=> d!58363 m!242339))

(assert (=> d!58363 m!242303))

(assert (=> d!58363 m!242271))

(assert (=> b!214755 d!58363))

(declare-fun b!214858 () Bool)

(declare-fun e!139740 () Bool)

(declare-fun e!139741 () Bool)

(assert (=> b!214858 (= e!139740 e!139741)))

(declare-fun res!105147 () Bool)

(assert (=> b!214858 (=> (not res!105147) (not e!139741))))

(declare-fun e!139743 () Bool)

(assert (=> b!214858 (= res!105147 (not e!139743))))

(declare-fun res!105148 () Bool)

(assert (=> b!214858 (=> (not res!105148) (not e!139743))))

(assert (=> b!214858 (= res!105148 (validKeyInArray!0 (select (arr!4895 (_keys!6053 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214859 () Bool)

(declare-fun e!139742 () Bool)

(declare-fun call!20331 () Bool)

(assert (=> b!214859 (= e!139742 call!20331)))

(declare-fun bm!20328 () Bool)

(declare-fun c!36104 () Bool)

(assert (=> bm!20328 (= call!20331 (arrayNoDuplicates!0 (_keys!6053 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36104 (Cons!3128 (select (arr!4895 (_keys!6053 thiss!1504)) #b00000000000000000000000000000000) Nil!3129) Nil!3129)))))

(declare-fun b!214860 () Bool)

(assert (=> b!214860 (= e!139741 e!139742)))

(assert (=> b!214860 (= c!36104 (validKeyInArray!0 (select (arr!4895 (_keys!6053 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58365 () Bool)

(declare-fun res!105149 () Bool)

(assert (=> d!58365 (=> res!105149 e!139740)))

(assert (=> d!58365 (= res!105149 (bvsge #b00000000000000000000000000000000 (size!5222 (_keys!6053 thiss!1504))))))

(assert (=> d!58365 (= (arrayNoDuplicates!0 (_keys!6053 thiss!1504) #b00000000000000000000000000000000 Nil!3129) e!139740)))

(declare-fun b!214861 () Bool)

(assert (=> b!214861 (= e!139742 call!20331)))

(declare-fun b!214862 () Bool)

(declare-fun contains!1427 (List!3132 (_ BitVec 64)) Bool)

(assert (=> b!214862 (= e!139743 (contains!1427 Nil!3129 (select (arr!4895 (_keys!6053 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58365 (not res!105149)) b!214858))

(assert (= (and b!214858 res!105148) b!214862))

(assert (= (and b!214858 res!105147) b!214860))

(assert (= (and b!214860 c!36104) b!214861))

(assert (= (and b!214860 (not c!36104)) b!214859))

(assert (= (or b!214861 b!214859) bm!20328))

(assert (=> b!214858 m!242319))

(assert (=> b!214858 m!242319))

(assert (=> b!214858 m!242327))

(assert (=> bm!20328 m!242319))

(declare-fun m!242341 () Bool)

(assert (=> bm!20328 m!242341))

(assert (=> b!214860 m!242319))

(assert (=> b!214860 m!242319))

(assert (=> b!214860 m!242327))

(assert (=> b!214862 m!242319))

(assert (=> b!214862 m!242319))

(declare-fun m!242343 () Bool)

(assert (=> b!214862 m!242343))

(assert (=> b!214740 d!58365))

(declare-fun condMapEmpty!9461 () Bool)

(declare-fun mapDefault!9461 () ValueCell!2433)

(assert (=> mapNonEmpty!9460 (= condMapEmpty!9461 (= mapRest!9460 ((as const (Array (_ BitVec 32) ValueCell!2433)) mapDefault!9461)))))

(declare-fun e!139744 () Bool)

(declare-fun mapRes!9461 () Bool)

(assert (=> mapNonEmpty!9460 (= tp!20179 (and e!139744 mapRes!9461))))

(declare-fun b!214863 () Bool)

(declare-fun e!139745 () Bool)

(assert (=> b!214863 (= e!139745 tp_is_empty!5553)))

(declare-fun b!214864 () Bool)

(assert (=> b!214864 (= e!139744 tp_is_empty!5553)))

(declare-fun mapNonEmpty!9461 () Bool)

(declare-fun tp!20180 () Bool)

(assert (=> mapNonEmpty!9461 (= mapRes!9461 (and tp!20180 e!139745))))

(declare-fun mapRest!9461 () (Array (_ BitVec 32) ValueCell!2433))

(declare-fun mapValue!9461 () ValueCell!2433)

(declare-fun mapKey!9461 () (_ BitVec 32))

(assert (=> mapNonEmpty!9461 (= mapRest!9460 (store mapRest!9461 mapKey!9461 mapValue!9461))))

(declare-fun mapIsEmpty!9461 () Bool)

(assert (=> mapIsEmpty!9461 mapRes!9461))

(assert (= (and mapNonEmpty!9460 condMapEmpty!9461) mapIsEmpty!9461))

(assert (= (and mapNonEmpty!9460 (not condMapEmpty!9461)) mapNonEmpty!9461))

(assert (= (and mapNonEmpty!9461 ((_ is ValueCellFull!2433) mapValue!9461)) b!214863))

(assert (= (and mapNonEmpty!9460 ((_ is ValueCellFull!2433) mapDefault!9461)) b!214864))

(declare-fun m!242345 () Bool)

(assert (=> mapNonEmpty!9461 m!242345))

(check-sat (not d!58363) b_and!12581 (not mapNonEmpty!9461) (not bm!20322) (not b_next!5691) (not b!214862) (not d!58361) (not b!214815) (not b!214786) (not b!214828) tp_is_empty!5553 (not bm!20325) (not b!214804) (not b!214842) (not bm!20328) (not b!214860) (not b!214858) (not d!58353) (not b!214827) (not b!214805))
(check-sat b_and!12581 (not b_next!5691))
