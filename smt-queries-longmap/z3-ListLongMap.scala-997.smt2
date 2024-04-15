; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21522 () Bool)

(assert start!21522)

(declare-fun b!215676 () Bool)

(declare-fun b_free!5731 () Bool)

(declare-fun b_next!5731 () Bool)

(assert (=> b!215676 (= b_free!5731 (not b_next!5731))))

(declare-fun tp!20314 () Bool)

(declare-fun b_and!12595 () Bool)

(assert (=> b!215676 (= tp!20314 b_and!12595)))

(declare-fun b!215670 () Bool)

(declare-fun res!105444 () Bool)

(declare-fun e!140304 () Bool)

(assert (=> b!215670 (=> (not res!105444) (not e!140304))))

(declare-datatypes ((V!7105 0))(
  ( (V!7106 (val!2841 Int)) )
))
(declare-datatypes ((ValueCell!2453 0))(
  ( (ValueCellFull!2453 (v!4853 V!7105)) (EmptyCell!2453) )
))
(declare-datatypes ((array!10409 0))(
  ( (array!10410 (arr!4929 (Array (_ BitVec 32) ValueCell!2453)) (size!5261 (_ BitVec 32))) )
))
(declare-datatypes ((array!10411 0))(
  ( (array!10412 (arr!4930 (Array (_ BitVec 32) (_ BitVec 64))) (size!5262 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2806 0))(
  ( (LongMapFixedSize!2807 (defaultEntry!4053 Int) (mask!9766 (_ BitVec 32)) (extraKeys!3790 (_ BitVec 32)) (zeroValue!3894 V!7105) (minValue!3894 V!7105) (_size!1452 (_ BitVec 32)) (_keys!6091 array!10411) (_values!4036 array!10409) (_vacant!1452 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2806)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215670 (= res!105444 (validMask!0 (mask!9766 thiss!1504)))))

(declare-fun mapIsEmpty!9539 () Bool)

(declare-fun mapRes!9539 () Bool)

(assert (=> mapIsEmpty!9539 mapRes!9539))

(declare-fun b!215671 () Bool)

(declare-fun res!105446 () Bool)

(declare-fun e!140306 () Bool)

(assert (=> b!215671 (=> (not res!105446) (not e!140306))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!215671 (= res!105446 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9539 () Bool)

(declare-fun tp!20315 () Bool)

(declare-fun e!140305 () Bool)

(assert (=> mapNonEmpty!9539 (= mapRes!9539 (and tp!20315 e!140305))))

(declare-fun mapRest!9539 () (Array (_ BitVec 32) ValueCell!2453))

(declare-fun mapKey!9539 () (_ BitVec 32))

(declare-fun mapValue!9539 () ValueCell!2453)

(assert (=> mapNonEmpty!9539 (= (arr!4929 (_values!4036 thiss!1504)) (store mapRest!9539 mapKey!9539 mapValue!9539))))

(declare-fun b!215672 () Bool)

(declare-fun e!140310 () Bool)

(declare-fun e!140309 () Bool)

(assert (=> b!215672 (= e!140310 (and e!140309 mapRes!9539))))

(declare-fun condMapEmpty!9539 () Bool)

(declare-fun mapDefault!9539 () ValueCell!2453)

(assert (=> b!215672 (= condMapEmpty!9539 (= (arr!4929 (_values!4036 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2453)) mapDefault!9539)))))

(declare-fun b!215673 () Bool)

(assert (=> b!215673 (= e!140306 e!140304)))

(declare-fun res!105445 () Bool)

(assert (=> b!215673 (=> (not res!105445) (not e!140304))))

(declare-datatypes ((SeekEntryResult!732 0))(
  ( (MissingZero!732 (index!5098 (_ BitVec 32))) (Found!732 (index!5099 (_ BitVec 32))) (Intermediate!732 (undefined!1544 Bool) (index!5100 (_ BitVec 32)) (x!22554 (_ BitVec 32))) (Undefined!732) (MissingVacant!732 (index!5101 (_ BitVec 32))) )
))
(declare-fun lt!110858 () SeekEntryResult!732)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215673 (= res!105445 (or (= lt!110858 (MissingZero!732 index!297)) (= lt!110858 (MissingVacant!732 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10411 (_ BitVec 32)) SeekEntryResult!732)

(assert (=> b!215673 (= lt!110858 (seekEntryOrOpen!0 key!932 (_keys!6091 thiss!1504) (mask!9766 thiss!1504)))))

(declare-fun b!215674 () Bool)

(declare-fun tp_is_empty!5593 () Bool)

(assert (=> b!215674 (= e!140309 tp_is_empty!5593)))

(declare-fun res!105447 () Bool)

(assert (=> start!21522 (=> (not res!105447) (not e!140306))))

(declare-fun valid!1161 (LongMapFixedSize!2806) Bool)

(assert (=> start!21522 (= res!105447 (valid!1161 thiss!1504))))

(assert (=> start!21522 e!140306))

(declare-fun e!140307 () Bool)

(assert (=> start!21522 e!140307))

(assert (=> start!21522 true))

(declare-fun b!215675 () Bool)

(assert (=> b!215675 (= e!140304 (and (= (size!5261 (_values!4036 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9766 thiss!1504))) (= (size!5262 (_keys!6091 thiss!1504)) (size!5261 (_values!4036 thiss!1504))) (bvsge (mask!9766 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3790 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3790 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun array_inv!3239 (array!10411) Bool)

(declare-fun array_inv!3240 (array!10409) Bool)

(assert (=> b!215676 (= e!140307 (and tp!20314 tp_is_empty!5593 (array_inv!3239 (_keys!6091 thiss!1504)) (array_inv!3240 (_values!4036 thiss!1504)) e!140310))))

(declare-fun b!215677 () Bool)

(assert (=> b!215677 (= e!140305 tp_is_empty!5593)))

(assert (= (and start!21522 res!105447) b!215671))

(assert (= (and b!215671 res!105446) b!215673))

(assert (= (and b!215673 res!105445) b!215670))

(assert (= (and b!215670 res!105444) b!215675))

(assert (= (and b!215672 condMapEmpty!9539) mapIsEmpty!9539))

(assert (= (and b!215672 (not condMapEmpty!9539)) mapNonEmpty!9539))

(get-info :version)

(assert (= (and mapNonEmpty!9539 ((_ is ValueCellFull!2453) mapValue!9539)) b!215677))

(assert (= (and b!215672 ((_ is ValueCellFull!2453) mapDefault!9539)) b!215674))

(assert (= b!215676 b!215672))

(assert (= start!21522 b!215676))

(declare-fun m!242211 () Bool)

(assert (=> mapNonEmpty!9539 m!242211))

(declare-fun m!242213 () Bool)

(assert (=> b!215673 m!242213))

(declare-fun m!242215 () Bool)

(assert (=> start!21522 m!242215))

(declare-fun m!242217 () Bool)

(assert (=> b!215676 m!242217))

(declare-fun m!242219 () Bool)

(assert (=> b!215676 m!242219))

(declare-fun m!242221 () Bool)

(assert (=> b!215670 m!242221))

(check-sat (not b!215676) (not b_next!5731) b_and!12595 (not b!215670) (not mapNonEmpty!9539) tp_is_empty!5593 (not b!215673) (not start!21522))
(check-sat b_and!12595 (not b_next!5731))
(get-model)

(declare-fun b!215738 () Bool)

(declare-fun c!36230 () Bool)

(declare-fun lt!110872 () (_ BitVec 64))

(assert (=> b!215738 (= c!36230 (= lt!110872 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140359 () SeekEntryResult!732)

(declare-fun e!140361 () SeekEntryResult!732)

(assert (=> b!215738 (= e!140359 e!140361)))

(declare-fun d!58337 () Bool)

(declare-fun lt!110871 () SeekEntryResult!732)

(assert (=> d!58337 (and (or ((_ is Undefined!732) lt!110871) (not ((_ is Found!732) lt!110871)) (and (bvsge (index!5099 lt!110871) #b00000000000000000000000000000000) (bvslt (index!5099 lt!110871) (size!5262 (_keys!6091 thiss!1504))))) (or ((_ is Undefined!732) lt!110871) ((_ is Found!732) lt!110871) (not ((_ is MissingZero!732) lt!110871)) (and (bvsge (index!5098 lt!110871) #b00000000000000000000000000000000) (bvslt (index!5098 lt!110871) (size!5262 (_keys!6091 thiss!1504))))) (or ((_ is Undefined!732) lt!110871) ((_ is Found!732) lt!110871) ((_ is MissingZero!732) lt!110871) (not ((_ is MissingVacant!732) lt!110871)) (and (bvsge (index!5101 lt!110871) #b00000000000000000000000000000000) (bvslt (index!5101 lt!110871) (size!5262 (_keys!6091 thiss!1504))))) (or ((_ is Undefined!732) lt!110871) (ite ((_ is Found!732) lt!110871) (= (select (arr!4930 (_keys!6091 thiss!1504)) (index!5099 lt!110871)) key!932) (ite ((_ is MissingZero!732) lt!110871) (= (select (arr!4930 (_keys!6091 thiss!1504)) (index!5098 lt!110871)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!732) lt!110871) (= (select (arr!4930 (_keys!6091 thiss!1504)) (index!5101 lt!110871)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!140360 () SeekEntryResult!732)

(assert (=> d!58337 (= lt!110871 e!140360)))

(declare-fun c!36229 () Bool)

(declare-fun lt!110873 () SeekEntryResult!732)

(assert (=> d!58337 (= c!36229 (and ((_ is Intermediate!732) lt!110873) (undefined!1544 lt!110873)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10411 (_ BitVec 32)) SeekEntryResult!732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58337 (= lt!110873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9766 thiss!1504)) key!932 (_keys!6091 thiss!1504) (mask!9766 thiss!1504)))))

(assert (=> d!58337 (validMask!0 (mask!9766 thiss!1504))))

(assert (=> d!58337 (= (seekEntryOrOpen!0 key!932 (_keys!6091 thiss!1504) (mask!9766 thiss!1504)) lt!110871)))

(declare-fun b!215739 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10411 (_ BitVec 32)) SeekEntryResult!732)

(assert (=> b!215739 (= e!140361 (seekKeyOrZeroReturnVacant!0 (x!22554 lt!110873) (index!5100 lt!110873) (index!5100 lt!110873) key!932 (_keys!6091 thiss!1504) (mask!9766 thiss!1504)))))

(declare-fun b!215740 () Bool)

(assert (=> b!215740 (= e!140360 e!140359)))

(assert (=> b!215740 (= lt!110872 (select (arr!4930 (_keys!6091 thiss!1504)) (index!5100 lt!110873)))))

(declare-fun c!36231 () Bool)

(assert (=> b!215740 (= c!36231 (= lt!110872 key!932))))

(declare-fun b!215741 () Bool)

(assert (=> b!215741 (= e!140359 (Found!732 (index!5100 lt!110873)))))

(declare-fun b!215742 () Bool)

(assert (=> b!215742 (= e!140361 (MissingZero!732 (index!5100 lt!110873)))))

(declare-fun b!215743 () Bool)

(assert (=> b!215743 (= e!140360 Undefined!732)))

(assert (= (and d!58337 c!36229) b!215743))

(assert (= (and d!58337 (not c!36229)) b!215740))

(assert (= (and b!215740 c!36231) b!215741))

(assert (= (and b!215740 (not c!36231)) b!215738))

(assert (= (and b!215738 c!36230) b!215742))

(assert (= (and b!215738 (not c!36230)) b!215739))

(declare-fun m!242247 () Bool)

(assert (=> d!58337 m!242247))

(declare-fun m!242249 () Bool)

(assert (=> d!58337 m!242249))

(declare-fun m!242251 () Bool)

(assert (=> d!58337 m!242251))

(declare-fun m!242253 () Bool)

(assert (=> d!58337 m!242253))

(assert (=> d!58337 m!242249))

(assert (=> d!58337 m!242221))

(declare-fun m!242255 () Bool)

(assert (=> d!58337 m!242255))

(declare-fun m!242257 () Bool)

(assert (=> b!215739 m!242257))

(declare-fun m!242259 () Bool)

(assert (=> b!215740 m!242259))

(assert (=> b!215673 d!58337))

(declare-fun d!58339 () Bool)

(assert (=> d!58339 (= (validMask!0 (mask!9766 thiss!1504)) (and (or (= (mask!9766 thiss!1504) #b00000000000000000000000000000111) (= (mask!9766 thiss!1504) #b00000000000000000000000000001111) (= (mask!9766 thiss!1504) #b00000000000000000000000000011111) (= (mask!9766 thiss!1504) #b00000000000000000000000000111111) (= (mask!9766 thiss!1504) #b00000000000000000000000001111111) (= (mask!9766 thiss!1504) #b00000000000000000000000011111111) (= (mask!9766 thiss!1504) #b00000000000000000000000111111111) (= (mask!9766 thiss!1504) #b00000000000000000000001111111111) (= (mask!9766 thiss!1504) #b00000000000000000000011111111111) (= (mask!9766 thiss!1504) #b00000000000000000000111111111111) (= (mask!9766 thiss!1504) #b00000000000000000001111111111111) (= (mask!9766 thiss!1504) #b00000000000000000011111111111111) (= (mask!9766 thiss!1504) #b00000000000000000111111111111111) (= (mask!9766 thiss!1504) #b00000000000000001111111111111111) (= (mask!9766 thiss!1504) #b00000000000000011111111111111111) (= (mask!9766 thiss!1504) #b00000000000000111111111111111111) (= (mask!9766 thiss!1504) #b00000000000001111111111111111111) (= (mask!9766 thiss!1504) #b00000000000011111111111111111111) (= (mask!9766 thiss!1504) #b00000000000111111111111111111111) (= (mask!9766 thiss!1504) #b00000000001111111111111111111111) (= (mask!9766 thiss!1504) #b00000000011111111111111111111111) (= (mask!9766 thiss!1504) #b00000000111111111111111111111111) (= (mask!9766 thiss!1504) #b00000001111111111111111111111111) (= (mask!9766 thiss!1504) #b00000011111111111111111111111111) (= (mask!9766 thiss!1504) #b00000111111111111111111111111111) (= (mask!9766 thiss!1504) #b00001111111111111111111111111111) (= (mask!9766 thiss!1504) #b00011111111111111111111111111111) (= (mask!9766 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9766 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215670 d!58339))

(declare-fun d!58341 () Bool)

(declare-fun res!105478 () Bool)

(declare-fun e!140364 () Bool)

(assert (=> d!58341 (=> (not res!105478) (not e!140364))))

(declare-fun simpleValid!220 (LongMapFixedSize!2806) Bool)

(assert (=> d!58341 (= res!105478 (simpleValid!220 thiss!1504))))

(assert (=> d!58341 (= (valid!1161 thiss!1504) e!140364)))

(declare-fun b!215750 () Bool)

(declare-fun res!105479 () Bool)

(assert (=> b!215750 (=> (not res!105479) (not e!140364))))

(declare-fun arrayCountValidKeys!0 (array!10411 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215750 (= res!105479 (= (arrayCountValidKeys!0 (_keys!6091 thiss!1504) #b00000000000000000000000000000000 (size!5262 (_keys!6091 thiss!1504))) (_size!1452 thiss!1504)))))

(declare-fun b!215751 () Bool)

(declare-fun res!105480 () Bool)

(assert (=> b!215751 (=> (not res!105480) (not e!140364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10411 (_ BitVec 32)) Bool)

(assert (=> b!215751 (= res!105480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6091 thiss!1504) (mask!9766 thiss!1504)))))

(declare-fun b!215752 () Bool)

(declare-datatypes ((List!3126 0))(
  ( (Nil!3123) (Cons!3122 (h!3768 (_ BitVec 64)) (t!8072 List!3126)) )
))
(declare-fun arrayNoDuplicates!0 (array!10411 (_ BitVec 32) List!3126) Bool)

(assert (=> b!215752 (= e!140364 (arrayNoDuplicates!0 (_keys!6091 thiss!1504) #b00000000000000000000000000000000 Nil!3123))))

(assert (= (and d!58341 res!105478) b!215750))

(assert (= (and b!215750 res!105479) b!215751))

(assert (= (and b!215751 res!105480) b!215752))

(declare-fun m!242261 () Bool)

(assert (=> d!58341 m!242261))

(declare-fun m!242263 () Bool)

(assert (=> b!215750 m!242263))

(declare-fun m!242265 () Bool)

(assert (=> b!215751 m!242265))

(declare-fun m!242267 () Bool)

(assert (=> b!215752 m!242267))

(assert (=> start!21522 d!58341))

(declare-fun d!58343 () Bool)

(assert (=> d!58343 (= (array_inv!3239 (_keys!6091 thiss!1504)) (bvsge (size!5262 (_keys!6091 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215676 d!58343))

(declare-fun d!58345 () Bool)

(assert (=> d!58345 (= (array_inv!3240 (_values!4036 thiss!1504)) (bvsge (size!5261 (_values!4036 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215676 d!58345))

(declare-fun condMapEmpty!9548 () Bool)

(declare-fun mapDefault!9548 () ValueCell!2453)

(assert (=> mapNonEmpty!9539 (= condMapEmpty!9548 (= mapRest!9539 ((as const (Array (_ BitVec 32) ValueCell!2453)) mapDefault!9548)))))

(declare-fun e!140369 () Bool)

(declare-fun mapRes!9548 () Bool)

(assert (=> mapNonEmpty!9539 (= tp!20315 (and e!140369 mapRes!9548))))

(declare-fun mapNonEmpty!9548 () Bool)

(declare-fun tp!20330 () Bool)

(declare-fun e!140370 () Bool)

(assert (=> mapNonEmpty!9548 (= mapRes!9548 (and tp!20330 e!140370))))

(declare-fun mapValue!9548 () ValueCell!2453)

(declare-fun mapRest!9548 () (Array (_ BitVec 32) ValueCell!2453))

(declare-fun mapKey!9548 () (_ BitVec 32))

(assert (=> mapNonEmpty!9548 (= mapRest!9539 (store mapRest!9548 mapKey!9548 mapValue!9548))))

(declare-fun b!215759 () Bool)

(assert (=> b!215759 (= e!140370 tp_is_empty!5593)))

(declare-fun mapIsEmpty!9548 () Bool)

(assert (=> mapIsEmpty!9548 mapRes!9548))

(declare-fun b!215760 () Bool)

(assert (=> b!215760 (= e!140369 tp_is_empty!5593)))

(assert (= (and mapNonEmpty!9539 condMapEmpty!9548) mapIsEmpty!9548))

(assert (= (and mapNonEmpty!9539 (not condMapEmpty!9548)) mapNonEmpty!9548))

(assert (= (and mapNonEmpty!9548 ((_ is ValueCellFull!2453) mapValue!9548)) b!215759))

(assert (= (and mapNonEmpty!9539 ((_ is ValueCellFull!2453) mapDefault!9548)) b!215760))

(declare-fun m!242269 () Bool)

(assert (=> mapNonEmpty!9548 m!242269))

(check-sat (not d!58341) (not b!215739) (not b_next!5731) (not b!215751) (not b!215750) (not b!215752) b_and!12595 tp_is_empty!5593 (not d!58337) (not mapNonEmpty!9548))
(check-sat b_and!12595 (not b_next!5731))
(get-model)

(declare-fun b!215772 () Bool)

(declare-fun e!140373 () Bool)

(assert (=> b!215772 (= e!140373 (and (bvsge (extraKeys!3790 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3790 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1452 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215770 () Bool)

(declare-fun res!105489 () Bool)

(assert (=> b!215770 (=> (not res!105489) (not e!140373))))

(declare-fun size!5267 (LongMapFixedSize!2806) (_ BitVec 32))

(assert (=> b!215770 (= res!105489 (bvsge (size!5267 thiss!1504) (_size!1452 thiss!1504)))))

(declare-fun b!215771 () Bool)

(declare-fun res!105490 () Bool)

(assert (=> b!215771 (=> (not res!105490) (not e!140373))))

(assert (=> b!215771 (= res!105490 (= (size!5267 thiss!1504) (bvadd (_size!1452 thiss!1504) (bvsdiv (bvadd (extraKeys!3790 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!215769 () Bool)

(declare-fun res!105492 () Bool)

(assert (=> b!215769 (=> (not res!105492) (not e!140373))))

(assert (=> b!215769 (= res!105492 (and (= (size!5261 (_values!4036 thiss!1504)) (bvadd (mask!9766 thiss!1504) #b00000000000000000000000000000001)) (= (size!5262 (_keys!6091 thiss!1504)) (size!5261 (_values!4036 thiss!1504))) (bvsge (_size!1452 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1452 thiss!1504) (bvadd (mask!9766 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!58347 () Bool)

(declare-fun res!105491 () Bool)

(assert (=> d!58347 (=> (not res!105491) (not e!140373))))

(assert (=> d!58347 (= res!105491 (validMask!0 (mask!9766 thiss!1504)))))

(assert (=> d!58347 (= (simpleValid!220 thiss!1504) e!140373)))

(assert (= (and d!58347 res!105491) b!215769))

(assert (= (and b!215769 res!105492) b!215770))

(assert (= (and b!215770 res!105489) b!215771))

(assert (= (and b!215771 res!105490) b!215772))

(declare-fun m!242271 () Bool)

(assert (=> b!215770 m!242271))

(assert (=> b!215771 m!242271))

(assert (=> d!58347 m!242221))

(assert (=> d!58341 d!58347))

(declare-fun bm!20334 () Bool)

(declare-fun call!20337 () (_ BitVec 32))

(assert (=> bm!20334 (= call!20337 (arrayCountValidKeys!0 (_keys!6091 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5262 (_keys!6091 thiss!1504))))))

(declare-fun b!215781 () Bool)

(declare-fun e!140378 () (_ BitVec 32))

(assert (=> b!215781 (= e!140378 (bvadd #b00000000000000000000000000000001 call!20337))))

(declare-fun b!215782 () Bool)

(declare-fun e!140379 () (_ BitVec 32))

(assert (=> b!215782 (= e!140379 e!140378)))

(declare-fun c!36236 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!215782 (= c!36236 (validKeyInArray!0 (select (arr!4930 (_keys!6091 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215783 () Bool)

(assert (=> b!215783 (= e!140378 call!20337)))

(declare-fun b!215784 () Bool)

(assert (=> b!215784 (= e!140379 #b00000000000000000000000000000000)))

(declare-fun d!58349 () Bool)

(declare-fun lt!110876 () (_ BitVec 32))

(assert (=> d!58349 (and (bvsge lt!110876 #b00000000000000000000000000000000) (bvsle lt!110876 (bvsub (size!5262 (_keys!6091 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58349 (= lt!110876 e!140379)))

(declare-fun c!36237 () Bool)

(assert (=> d!58349 (= c!36237 (bvsge #b00000000000000000000000000000000 (size!5262 (_keys!6091 thiss!1504))))))

(assert (=> d!58349 (and (bvsle #b00000000000000000000000000000000 (size!5262 (_keys!6091 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5262 (_keys!6091 thiss!1504)) (size!5262 (_keys!6091 thiss!1504))))))

(assert (=> d!58349 (= (arrayCountValidKeys!0 (_keys!6091 thiss!1504) #b00000000000000000000000000000000 (size!5262 (_keys!6091 thiss!1504))) lt!110876)))

(assert (= (and d!58349 c!36237) b!215784))

(assert (= (and d!58349 (not c!36237)) b!215782))

(assert (= (and b!215782 c!36236) b!215781))

(assert (= (and b!215782 (not c!36236)) b!215783))

(assert (= (or b!215781 b!215783) bm!20334))

(declare-fun m!242273 () Bool)

(assert (=> bm!20334 m!242273))

(declare-fun m!242275 () Bool)

(assert (=> b!215782 m!242275))

(assert (=> b!215782 m!242275))

(declare-fun m!242277 () Bool)

(assert (=> b!215782 m!242277))

(assert (=> b!215750 d!58349))

(declare-fun b!215803 () Bool)

(declare-fun e!140391 () SeekEntryResult!732)

(assert (=> b!215803 (= e!140391 (Intermediate!732 true (toIndex!0 key!932 (mask!9766 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215804 () Bool)

(declare-fun e!140393 () Bool)

(declare-fun e!140392 () Bool)

(assert (=> b!215804 (= e!140393 e!140392)))

(declare-fun res!105499 () Bool)

(declare-fun lt!110881 () SeekEntryResult!732)

(assert (=> b!215804 (= res!105499 (and ((_ is Intermediate!732) lt!110881) (not (undefined!1544 lt!110881)) (bvslt (x!22554 lt!110881) #b01111111111111111111111111111110) (bvsge (x!22554 lt!110881) #b00000000000000000000000000000000) (bvsge (x!22554 lt!110881) #b00000000000000000000000000000000)))))

(assert (=> b!215804 (=> (not res!105499) (not e!140392))))

(declare-fun d!58351 () Bool)

(assert (=> d!58351 e!140393))

(declare-fun c!36244 () Bool)

(assert (=> d!58351 (= c!36244 (and ((_ is Intermediate!732) lt!110881) (undefined!1544 lt!110881)))))

(assert (=> d!58351 (= lt!110881 e!140391)))

(declare-fun c!36245 () Bool)

(assert (=> d!58351 (= c!36245 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!110882 () (_ BitVec 64))

(assert (=> d!58351 (= lt!110882 (select (arr!4930 (_keys!6091 thiss!1504)) (toIndex!0 key!932 (mask!9766 thiss!1504))))))

(assert (=> d!58351 (validMask!0 (mask!9766 thiss!1504))))

(assert (=> d!58351 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9766 thiss!1504)) key!932 (_keys!6091 thiss!1504) (mask!9766 thiss!1504)) lt!110881)))

(declare-fun b!215805 () Bool)

(assert (=> b!215805 (and (bvsge (index!5100 lt!110881) #b00000000000000000000000000000000) (bvslt (index!5100 lt!110881) (size!5262 (_keys!6091 thiss!1504))))))

(declare-fun e!140394 () Bool)

(assert (=> b!215805 (= e!140394 (= (select (arr!4930 (_keys!6091 thiss!1504)) (index!5100 lt!110881)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!215806 () Bool)

(declare-fun e!140390 () SeekEntryResult!732)

(assert (=> b!215806 (= e!140390 (Intermediate!732 false (toIndex!0 key!932 (mask!9766 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215807 () Bool)

(assert (=> b!215807 (= e!140393 (bvsge (x!22554 lt!110881) #b01111111111111111111111111111110))))

(declare-fun b!215808 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215808 (= e!140390 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9766 thiss!1504)) #b00000000000000000000000000000000 (mask!9766 thiss!1504)) key!932 (_keys!6091 thiss!1504) (mask!9766 thiss!1504)))))

(declare-fun b!215809 () Bool)

(assert (=> b!215809 (and (bvsge (index!5100 lt!110881) #b00000000000000000000000000000000) (bvslt (index!5100 lt!110881) (size!5262 (_keys!6091 thiss!1504))))))

(declare-fun res!105501 () Bool)

(assert (=> b!215809 (= res!105501 (= (select (arr!4930 (_keys!6091 thiss!1504)) (index!5100 lt!110881)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215809 (=> res!105501 e!140394)))

(declare-fun b!215810 () Bool)

(assert (=> b!215810 (= e!140391 e!140390)))

(declare-fun c!36246 () Bool)

(assert (=> b!215810 (= c!36246 (or (= lt!110882 key!932) (= (bvadd lt!110882 lt!110882) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!215811 () Bool)

(assert (=> b!215811 (and (bvsge (index!5100 lt!110881) #b00000000000000000000000000000000) (bvslt (index!5100 lt!110881) (size!5262 (_keys!6091 thiss!1504))))))

(declare-fun res!105500 () Bool)

(assert (=> b!215811 (= res!105500 (= (select (arr!4930 (_keys!6091 thiss!1504)) (index!5100 lt!110881)) key!932))))

(assert (=> b!215811 (=> res!105500 e!140394)))

(assert (=> b!215811 (= e!140392 e!140394)))

(assert (= (and d!58351 c!36245) b!215803))

(assert (= (and d!58351 (not c!36245)) b!215810))

(assert (= (and b!215810 c!36246) b!215806))

(assert (= (and b!215810 (not c!36246)) b!215808))

(assert (= (and d!58351 c!36244) b!215807))

(assert (= (and d!58351 (not c!36244)) b!215804))

(assert (= (and b!215804 res!105499) b!215811))

(assert (= (and b!215811 (not res!105500)) b!215809))

(assert (= (and b!215809 (not res!105501)) b!215805))

(assert (=> b!215808 m!242249))

(declare-fun m!242279 () Bool)

(assert (=> b!215808 m!242279))

(assert (=> b!215808 m!242279))

(declare-fun m!242281 () Bool)

(assert (=> b!215808 m!242281))

(declare-fun m!242283 () Bool)

(assert (=> b!215811 m!242283))

(assert (=> b!215805 m!242283))

(assert (=> b!215809 m!242283))

(assert (=> d!58351 m!242249))

(declare-fun m!242285 () Bool)

(assert (=> d!58351 m!242285))

(assert (=> d!58351 m!242221))

(assert (=> d!58337 d!58351))

(declare-fun d!58353 () Bool)

(declare-fun lt!110888 () (_ BitVec 32))

(declare-fun lt!110887 () (_ BitVec 32))

(assert (=> d!58353 (= lt!110888 (bvmul (bvxor lt!110887 (bvlshr lt!110887 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58353 (= lt!110887 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58353 (and (bvsge (mask!9766 thiss!1504) #b00000000000000000000000000000000) (let ((res!105502 (let ((h!3769 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22571 (bvmul (bvxor h!3769 (bvlshr h!3769 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22571 (bvlshr x!22571 #b00000000000000000000000000001101)) (mask!9766 thiss!1504)))))) (and (bvslt res!105502 (bvadd (mask!9766 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105502 #b00000000000000000000000000000000))))))

(assert (=> d!58353 (= (toIndex!0 key!932 (mask!9766 thiss!1504)) (bvand (bvxor lt!110888 (bvlshr lt!110888 #b00000000000000000000000000001101)) (mask!9766 thiss!1504)))))

(assert (=> d!58337 d!58353))

(assert (=> d!58337 d!58339))

(declare-fun b!215824 () Bool)

(declare-fun e!140401 () SeekEntryResult!732)

(declare-fun e!140402 () SeekEntryResult!732)

(assert (=> b!215824 (= e!140401 e!140402)))

(declare-fun c!36254 () Bool)

(declare-fun lt!110894 () (_ BitVec 64))

(assert (=> b!215824 (= c!36254 (= lt!110894 key!932))))

(declare-fun b!215825 () Bool)

(declare-fun c!36255 () Bool)

(assert (=> b!215825 (= c!36255 (= lt!110894 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140403 () SeekEntryResult!732)

(assert (=> b!215825 (= e!140402 e!140403)))

(declare-fun b!215826 () Bool)

(assert (=> b!215826 (= e!140401 Undefined!732)))

(declare-fun b!215827 () Bool)

(assert (=> b!215827 (= e!140403 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22554 lt!110873) #b00000000000000000000000000000001) (nextIndex!0 (index!5100 lt!110873) (x!22554 lt!110873) (mask!9766 thiss!1504)) (index!5100 lt!110873) key!932 (_keys!6091 thiss!1504) (mask!9766 thiss!1504)))))

(declare-fun d!58355 () Bool)

(declare-fun lt!110893 () SeekEntryResult!732)

(assert (=> d!58355 (and (or ((_ is Undefined!732) lt!110893) (not ((_ is Found!732) lt!110893)) (and (bvsge (index!5099 lt!110893) #b00000000000000000000000000000000) (bvslt (index!5099 lt!110893) (size!5262 (_keys!6091 thiss!1504))))) (or ((_ is Undefined!732) lt!110893) ((_ is Found!732) lt!110893) (not ((_ is MissingVacant!732) lt!110893)) (not (= (index!5101 lt!110893) (index!5100 lt!110873))) (and (bvsge (index!5101 lt!110893) #b00000000000000000000000000000000) (bvslt (index!5101 lt!110893) (size!5262 (_keys!6091 thiss!1504))))) (or ((_ is Undefined!732) lt!110893) (ite ((_ is Found!732) lt!110893) (= (select (arr!4930 (_keys!6091 thiss!1504)) (index!5099 lt!110893)) key!932) (and ((_ is MissingVacant!732) lt!110893) (= (index!5101 lt!110893) (index!5100 lt!110873)) (= (select (arr!4930 (_keys!6091 thiss!1504)) (index!5101 lt!110893)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58355 (= lt!110893 e!140401)))

(declare-fun c!36253 () Bool)

(assert (=> d!58355 (= c!36253 (bvsge (x!22554 lt!110873) #b01111111111111111111111111111110))))

(assert (=> d!58355 (= lt!110894 (select (arr!4930 (_keys!6091 thiss!1504)) (index!5100 lt!110873)))))

(assert (=> d!58355 (validMask!0 (mask!9766 thiss!1504))))

(assert (=> d!58355 (= (seekKeyOrZeroReturnVacant!0 (x!22554 lt!110873) (index!5100 lt!110873) (index!5100 lt!110873) key!932 (_keys!6091 thiss!1504) (mask!9766 thiss!1504)) lt!110893)))

(declare-fun b!215828 () Bool)

(assert (=> b!215828 (= e!140402 (Found!732 (index!5100 lt!110873)))))

(declare-fun b!215829 () Bool)

(assert (=> b!215829 (= e!140403 (MissingVacant!732 (index!5100 lt!110873)))))

(assert (= (and d!58355 c!36253) b!215826))

(assert (= (and d!58355 (not c!36253)) b!215824))

(assert (= (and b!215824 c!36254) b!215828))

(assert (= (and b!215824 (not c!36254)) b!215825))

(assert (= (and b!215825 c!36255) b!215829))

(assert (= (and b!215825 (not c!36255)) b!215827))

(declare-fun m!242287 () Bool)

(assert (=> b!215827 m!242287))

(assert (=> b!215827 m!242287))

(declare-fun m!242289 () Bool)

(assert (=> b!215827 m!242289))

(declare-fun m!242291 () Bool)

(assert (=> d!58355 m!242291))

(declare-fun m!242293 () Bool)

(assert (=> d!58355 m!242293))

(assert (=> d!58355 m!242259))

(assert (=> d!58355 m!242221))

(assert (=> b!215739 d!58355))

(declare-fun d!58357 () Bool)

(declare-fun res!105508 () Bool)

(declare-fun e!140411 () Bool)

(assert (=> d!58357 (=> res!105508 e!140411)))

(assert (=> d!58357 (= res!105508 (bvsge #b00000000000000000000000000000000 (size!5262 (_keys!6091 thiss!1504))))))

(assert (=> d!58357 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6091 thiss!1504) (mask!9766 thiss!1504)) e!140411)))

(declare-fun bm!20337 () Bool)

(declare-fun call!20340 () Bool)

(assert (=> bm!20337 (= call!20340 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6091 thiss!1504) (mask!9766 thiss!1504)))))

(declare-fun b!215838 () Bool)

(declare-fun e!140412 () Bool)

(assert (=> b!215838 (= e!140412 call!20340)))

(declare-fun b!215839 () Bool)

(declare-fun e!140410 () Bool)

(assert (=> b!215839 (= e!140410 e!140412)))

(declare-fun lt!110903 () (_ BitVec 64))

(assert (=> b!215839 (= lt!110903 (select (arr!4930 (_keys!6091 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6458 0))(
  ( (Unit!6459) )
))
(declare-fun lt!110902 () Unit!6458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10411 (_ BitVec 64) (_ BitVec 32)) Unit!6458)

(assert (=> b!215839 (= lt!110902 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6091 thiss!1504) lt!110903 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!215839 (arrayContainsKey!0 (_keys!6091 thiss!1504) lt!110903 #b00000000000000000000000000000000)))

(declare-fun lt!110901 () Unit!6458)

(assert (=> b!215839 (= lt!110901 lt!110902)))

(declare-fun res!105507 () Bool)

(assert (=> b!215839 (= res!105507 (= (seekEntryOrOpen!0 (select (arr!4930 (_keys!6091 thiss!1504)) #b00000000000000000000000000000000) (_keys!6091 thiss!1504) (mask!9766 thiss!1504)) (Found!732 #b00000000000000000000000000000000)))))

(assert (=> b!215839 (=> (not res!105507) (not e!140412))))

(declare-fun b!215840 () Bool)

(assert (=> b!215840 (= e!140410 call!20340)))

(declare-fun b!215841 () Bool)

(assert (=> b!215841 (= e!140411 e!140410)))

(declare-fun c!36258 () Bool)

(assert (=> b!215841 (= c!36258 (validKeyInArray!0 (select (arr!4930 (_keys!6091 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58357 (not res!105508)) b!215841))

(assert (= (and b!215841 c!36258) b!215839))

(assert (= (and b!215841 (not c!36258)) b!215840))

(assert (= (and b!215839 res!105507) b!215838))

(assert (= (or b!215838 b!215840) bm!20337))

(declare-fun m!242295 () Bool)

(assert (=> bm!20337 m!242295))

(assert (=> b!215839 m!242275))

(declare-fun m!242297 () Bool)

(assert (=> b!215839 m!242297))

(declare-fun m!242299 () Bool)

(assert (=> b!215839 m!242299))

(assert (=> b!215839 m!242275))

(declare-fun m!242301 () Bool)

(assert (=> b!215839 m!242301))

(assert (=> b!215841 m!242275))

(assert (=> b!215841 m!242275))

(assert (=> b!215841 m!242277))

(assert (=> b!215751 d!58357))

(declare-fun b!215852 () Bool)

(declare-fun e!140422 () Bool)

(declare-fun e!140421 () Bool)

(assert (=> b!215852 (= e!140422 e!140421)))

(declare-fun c!36261 () Bool)

(assert (=> b!215852 (= c!36261 (validKeyInArray!0 (select (arr!4930 (_keys!6091 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215853 () Bool)

(declare-fun call!20343 () Bool)

(assert (=> b!215853 (= e!140421 call!20343)))

(declare-fun d!58359 () Bool)

(declare-fun res!105515 () Bool)

(declare-fun e!140423 () Bool)

(assert (=> d!58359 (=> res!105515 e!140423)))

(assert (=> d!58359 (= res!105515 (bvsge #b00000000000000000000000000000000 (size!5262 (_keys!6091 thiss!1504))))))

(assert (=> d!58359 (= (arrayNoDuplicates!0 (_keys!6091 thiss!1504) #b00000000000000000000000000000000 Nil!3123) e!140423)))

(declare-fun b!215854 () Bool)

(declare-fun e!140424 () Bool)

(declare-fun contains!1409 (List!3126 (_ BitVec 64)) Bool)

(assert (=> b!215854 (= e!140424 (contains!1409 Nil!3123 (select (arr!4930 (_keys!6091 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215855 () Bool)

(assert (=> b!215855 (= e!140421 call!20343)))

(declare-fun bm!20340 () Bool)

(assert (=> bm!20340 (= call!20343 (arrayNoDuplicates!0 (_keys!6091 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36261 (Cons!3122 (select (arr!4930 (_keys!6091 thiss!1504)) #b00000000000000000000000000000000) Nil!3123) Nil!3123)))))

(declare-fun b!215856 () Bool)

(assert (=> b!215856 (= e!140423 e!140422)))

(declare-fun res!105516 () Bool)

(assert (=> b!215856 (=> (not res!105516) (not e!140422))))

(assert (=> b!215856 (= res!105516 (not e!140424))))

(declare-fun res!105517 () Bool)

(assert (=> b!215856 (=> (not res!105517) (not e!140424))))

(assert (=> b!215856 (= res!105517 (validKeyInArray!0 (select (arr!4930 (_keys!6091 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58359 (not res!105515)) b!215856))

(assert (= (and b!215856 res!105517) b!215854))

(assert (= (and b!215856 res!105516) b!215852))

(assert (= (and b!215852 c!36261) b!215855))

(assert (= (and b!215852 (not c!36261)) b!215853))

(assert (= (or b!215855 b!215853) bm!20340))

(assert (=> b!215852 m!242275))

(assert (=> b!215852 m!242275))

(assert (=> b!215852 m!242277))

(assert (=> b!215854 m!242275))

(assert (=> b!215854 m!242275))

(declare-fun m!242303 () Bool)

(assert (=> b!215854 m!242303))

(assert (=> bm!20340 m!242275))

(declare-fun m!242305 () Bool)

(assert (=> bm!20340 m!242305))

(assert (=> b!215856 m!242275))

(assert (=> b!215856 m!242275))

(assert (=> b!215856 m!242277))

(assert (=> b!215752 d!58359))

(declare-fun condMapEmpty!9549 () Bool)

(declare-fun mapDefault!9549 () ValueCell!2453)

(assert (=> mapNonEmpty!9548 (= condMapEmpty!9549 (= mapRest!9548 ((as const (Array (_ BitVec 32) ValueCell!2453)) mapDefault!9549)))))

(declare-fun e!140425 () Bool)

(declare-fun mapRes!9549 () Bool)

(assert (=> mapNonEmpty!9548 (= tp!20330 (and e!140425 mapRes!9549))))

(declare-fun mapNonEmpty!9549 () Bool)

(declare-fun tp!20331 () Bool)

(declare-fun e!140426 () Bool)

(assert (=> mapNonEmpty!9549 (= mapRes!9549 (and tp!20331 e!140426))))

(declare-fun mapKey!9549 () (_ BitVec 32))

(declare-fun mapValue!9549 () ValueCell!2453)

(declare-fun mapRest!9549 () (Array (_ BitVec 32) ValueCell!2453))

(assert (=> mapNonEmpty!9549 (= mapRest!9548 (store mapRest!9549 mapKey!9549 mapValue!9549))))

(declare-fun b!215857 () Bool)

(assert (=> b!215857 (= e!140426 tp_is_empty!5593)))

(declare-fun mapIsEmpty!9549 () Bool)

(assert (=> mapIsEmpty!9549 mapRes!9549))

(declare-fun b!215858 () Bool)

(assert (=> b!215858 (= e!140425 tp_is_empty!5593)))

(assert (= (and mapNonEmpty!9548 condMapEmpty!9549) mapIsEmpty!9549))

(assert (= (and mapNonEmpty!9548 (not condMapEmpty!9549)) mapNonEmpty!9549))

(assert (= (and mapNonEmpty!9549 ((_ is ValueCellFull!2453) mapValue!9549)) b!215857))

(assert (= (and mapNonEmpty!9548 ((_ is ValueCellFull!2453) mapDefault!9549)) b!215858))

(declare-fun m!242307 () Bool)

(assert (=> mapNonEmpty!9549 m!242307))

(check-sat (not b!215782) (not b!215770) (not b!215839) (not bm!20340) (not bm!20337) (not b!215771) b_and!12595 (not d!58351) tp_is_empty!5593 (not b!215854) (not b!215841) (not d!58347) (not b!215827) (not b_next!5731) (not b!215808) (not d!58355) (not mapNonEmpty!9549) (not bm!20334) (not b!215852) (not b!215856))
(check-sat b_and!12595 (not b_next!5731))
