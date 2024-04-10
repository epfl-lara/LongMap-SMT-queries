; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21474 () Bool)

(assert start!21474)

(declare-fun b!215532 () Bool)

(declare-fun b_free!5721 () Bool)

(declare-fun b_next!5721 () Bool)

(assert (=> b!215532 (= b_free!5721 (not b_next!5721))))

(declare-fun tp!20278 () Bool)

(declare-fun b_and!12611 () Bool)

(assert (=> b!215532 (= tp!20278 b_and!12611)))

(declare-fun b!215529 () Bool)

(declare-fun e!140213 () Bool)

(declare-fun tp_is_empty!5583 () Bool)

(assert (=> b!215529 (= e!140213 tp_is_empty!5583)))

(declare-fun b!215530 () Bool)

(declare-fun e!140210 () Bool)

(declare-fun mapRes!9517 () Bool)

(assert (=> b!215530 (= e!140210 (and e!140213 mapRes!9517))))

(declare-fun condMapEmpty!9517 () Bool)

(declare-datatypes ((V!7091 0))(
  ( (V!7092 (val!2836 Int)) )
))
(declare-datatypes ((ValueCell!2448 0))(
  ( (ValueCellFull!2448 (v!4854 V!7091)) (EmptyCell!2448) )
))
(declare-datatypes ((array!10393 0))(
  ( (array!10394 (arr!4924 (Array (_ BitVec 32) ValueCell!2448)) (size!5254 (_ BitVec 32))) )
))
(declare-datatypes ((array!10395 0))(
  ( (array!10396 (arr!4925 (Array (_ BitVec 32) (_ BitVec 64))) (size!5255 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2796 0))(
  ( (LongMapFixedSize!2797 (defaultEntry!4048 Int) (mask!9750 (_ BitVec 32)) (extraKeys!3785 (_ BitVec 32)) (zeroValue!3889 V!7091) (minValue!3889 V!7091) (_size!1447 (_ BitVec 32)) (_keys!6082 array!10395) (_values!4031 array!10393) (_vacant!1447 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2796)

(declare-fun mapDefault!9517 () ValueCell!2448)

(assert (=> b!215530 (= condMapEmpty!9517 (= (arr!4924 (_values!4031 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2448)) mapDefault!9517)))))

(declare-fun res!105425 () Bool)

(declare-fun e!140214 () Bool)

(assert (=> start!21474 (=> (not res!105425) (not e!140214))))

(declare-fun valid!1139 (LongMapFixedSize!2796) Bool)

(assert (=> start!21474 (= res!105425 (valid!1139 thiss!1504))))

(assert (=> start!21474 e!140214))

(declare-fun e!140209 () Bool)

(assert (=> start!21474 e!140209))

(assert (=> start!21474 true))

(declare-fun mapNonEmpty!9517 () Bool)

(declare-fun tp!20277 () Bool)

(declare-fun e!140208 () Bool)

(assert (=> mapNonEmpty!9517 (= mapRes!9517 (and tp!20277 e!140208))))

(declare-fun mapKey!9517 () (_ BitVec 32))

(declare-fun mapValue!9517 () ValueCell!2448)

(declare-fun mapRest!9517 () (Array (_ BitVec 32) ValueCell!2448))

(assert (=> mapNonEmpty!9517 (= (arr!4924 (_values!4031 thiss!1504)) (store mapRest!9517 mapKey!9517 mapValue!9517))))

(declare-fun b!215531 () Bool)

(declare-fun res!105427 () Bool)

(declare-fun e!140211 () Bool)

(assert (=> b!215531 (=> (not res!105427) (not e!140211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215531 (= res!105427 (validMask!0 (mask!9750 thiss!1504)))))

(declare-fun mapIsEmpty!9517 () Bool)

(assert (=> mapIsEmpty!9517 mapRes!9517))

(declare-fun array_inv!3259 (array!10395) Bool)

(declare-fun array_inv!3260 (array!10393) Bool)

(assert (=> b!215532 (= e!140209 (and tp!20278 tp_is_empty!5583 (array_inv!3259 (_keys!6082 thiss!1504)) (array_inv!3260 (_values!4031 thiss!1504)) e!140210))))

(declare-fun b!215533 () Bool)

(assert (=> b!215533 (= e!140208 tp_is_empty!5583)))

(declare-fun b!215534 () Bool)

(assert (=> b!215534 (= e!140214 e!140211)))

(declare-fun res!105426 () Bool)

(assert (=> b!215534 (=> (not res!105426) (not e!140211))))

(declare-datatypes ((SeekEntryResult!732 0))(
  ( (MissingZero!732 (index!5098 (_ BitVec 32))) (Found!732 (index!5099 (_ BitVec 32))) (Intermediate!732 (undefined!1544 Bool) (index!5100 (_ BitVec 32)) (x!22514 (_ BitVec 32))) (Undefined!732) (MissingVacant!732 (index!5101 (_ BitVec 32))) )
))
(declare-fun lt!110976 () SeekEntryResult!732)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215534 (= res!105426 (or (= lt!110976 (MissingZero!732 index!297)) (= lt!110976 (MissingVacant!732 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10395 (_ BitVec 32)) SeekEntryResult!732)

(assert (=> b!215534 (= lt!110976 (seekEntryOrOpen!0 key!932 (_keys!6082 thiss!1504) (mask!9750 thiss!1504)))))

(declare-fun b!215535 () Bool)

(declare-fun res!105424 () Bool)

(assert (=> b!215535 (=> (not res!105424) (not e!140214))))

(assert (=> b!215535 (= res!105424 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!215536 () Bool)

(assert (=> b!215536 (= e!140211 (and (= (size!5254 (_values!4031 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9750 thiss!1504))) (= (size!5255 (_keys!6082 thiss!1504)) (size!5254 (_values!4031 thiss!1504))) (bvslt (mask!9750 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and start!21474 res!105425) b!215535))

(assert (= (and b!215535 res!105424) b!215534))

(assert (= (and b!215534 res!105426) b!215531))

(assert (= (and b!215531 res!105427) b!215536))

(assert (= (and b!215530 condMapEmpty!9517) mapIsEmpty!9517))

(assert (= (and b!215530 (not condMapEmpty!9517)) mapNonEmpty!9517))

(get-info :version)

(assert (= (and mapNonEmpty!9517 ((_ is ValueCellFull!2448) mapValue!9517)) b!215533))

(assert (= (and b!215530 ((_ is ValueCellFull!2448) mapDefault!9517)) b!215529))

(assert (= b!215532 b!215530))

(assert (= start!21474 b!215532))

(declare-fun m!242681 () Bool)

(assert (=> b!215534 m!242681))

(declare-fun m!242683 () Bool)

(assert (=> b!215531 m!242683))

(declare-fun m!242685 () Bool)

(assert (=> mapNonEmpty!9517 m!242685))

(declare-fun m!242687 () Bool)

(assert (=> b!215532 m!242687))

(declare-fun m!242689 () Bool)

(assert (=> b!215532 m!242689))

(declare-fun m!242691 () Bool)

(assert (=> start!21474 m!242691))

(check-sat b_and!12611 (not b!215532) (not start!21474) (not b!215534) tp_is_empty!5583 (not b!215531) (not mapNonEmpty!9517) (not b_next!5721))
(check-sat b_and!12611 (not b_next!5721))
(get-model)

(declare-fun d!58447 () Bool)

(assert (=> d!58447 (= (array_inv!3259 (_keys!6082 thiss!1504)) (bvsge (size!5255 (_keys!6082 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215532 d!58447))

(declare-fun d!58449 () Bool)

(assert (=> d!58449 (= (array_inv!3260 (_values!4031 thiss!1504)) (bvsge (size!5254 (_values!4031 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215532 d!58449))

(declare-fun d!58451 () Bool)

(declare-fun lt!110988 () SeekEntryResult!732)

(assert (=> d!58451 (and (or ((_ is Undefined!732) lt!110988) (not ((_ is Found!732) lt!110988)) (and (bvsge (index!5099 lt!110988) #b00000000000000000000000000000000) (bvslt (index!5099 lt!110988) (size!5255 (_keys!6082 thiss!1504))))) (or ((_ is Undefined!732) lt!110988) ((_ is Found!732) lt!110988) (not ((_ is MissingZero!732) lt!110988)) (and (bvsge (index!5098 lt!110988) #b00000000000000000000000000000000) (bvslt (index!5098 lt!110988) (size!5255 (_keys!6082 thiss!1504))))) (or ((_ is Undefined!732) lt!110988) ((_ is Found!732) lt!110988) ((_ is MissingZero!732) lt!110988) (not ((_ is MissingVacant!732) lt!110988)) (and (bvsge (index!5101 lt!110988) #b00000000000000000000000000000000) (bvslt (index!5101 lt!110988) (size!5255 (_keys!6082 thiss!1504))))) (or ((_ is Undefined!732) lt!110988) (ite ((_ is Found!732) lt!110988) (= (select (arr!4925 (_keys!6082 thiss!1504)) (index!5099 lt!110988)) key!932) (ite ((_ is MissingZero!732) lt!110988) (= (select (arr!4925 (_keys!6082 thiss!1504)) (index!5098 lt!110988)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!732) lt!110988) (= (select (arr!4925 (_keys!6082 thiss!1504)) (index!5101 lt!110988)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!140242 () SeekEntryResult!732)

(assert (=> d!58451 (= lt!110988 e!140242)))

(declare-fun c!36208 () Bool)

(declare-fun lt!110986 () SeekEntryResult!732)

(assert (=> d!58451 (= c!36208 (and ((_ is Intermediate!732) lt!110986) (undefined!1544 lt!110986)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10395 (_ BitVec 32)) SeekEntryResult!732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58451 (= lt!110986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9750 thiss!1504)) key!932 (_keys!6082 thiss!1504) (mask!9750 thiss!1504)))))

(assert (=> d!58451 (validMask!0 (mask!9750 thiss!1504))))

(assert (=> d!58451 (= (seekEntryOrOpen!0 key!932 (_keys!6082 thiss!1504) (mask!9750 thiss!1504)) lt!110988)))

(declare-fun b!215573 () Bool)

(declare-fun c!36207 () Bool)

(declare-fun lt!110987 () (_ BitVec 64))

(assert (=> b!215573 (= c!36207 (= lt!110987 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!140244 () SeekEntryResult!732)

(declare-fun e!140243 () SeekEntryResult!732)

(assert (=> b!215573 (= e!140244 e!140243)))

(declare-fun b!215574 () Bool)

(assert (=> b!215574 (= e!140242 Undefined!732)))

(declare-fun b!215575 () Bool)

(assert (=> b!215575 (= e!140244 (Found!732 (index!5100 lt!110986)))))

(declare-fun b!215576 () Bool)

(assert (=> b!215576 (= e!140243 (MissingZero!732 (index!5100 lt!110986)))))

(declare-fun b!215577 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10395 (_ BitVec 32)) SeekEntryResult!732)

(assert (=> b!215577 (= e!140243 (seekKeyOrZeroReturnVacant!0 (x!22514 lt!110986) (index!5100 lt!110986) (index!5100 lt!110986) key!932 (_keys!6082 thiss!1504) (mask!9750 thiss!1504)))))

(declare-fun b!215578 () Bool)

(assert (=> b!215578 (= e!140242 e!140244)))

(assert (=> b!215578 (= lt!110987 (select (arr!4925 (_keys!6082 thiss!1504)) (index!5100 lt!110986)))))

(declare-fun c!36209 () Bool)

(assert (=> b!215578 (= c!36209 (= lt!110987 key!932))))

(assert (= (and d!58451 c!36208) b!215574))

(assert (= (and d!58451 (not c!36208)) b!215578))

(assert (= (and b!215578 c!36209) b!215575))

(assert (= (and b!215578 (not c!36209)) b!215573))

(assert (= (and b!215573 c!36207) b!215576))

(assert (= (and b!215573 (not c!36207)) b!215577))

(declare-fun m!242705 () Bool)

(assert (=> d!58451 m!242705))

(assert (=> d!58451 m!242705))

(declare-fun m!242707 () Bool)

(assert (=> d!58451 m!242707))

(declare-fun m!242709 () Bool)

(assert (=> d!58451 m!242709))

(assert (=> d!58451 m!242683))

(declare-fun m!242711 () Bool)

(assert (=> d!58451 m!242711))

(declare-fun m!242713 () Bool)

(assert (=> d!58451 m!242713))

(declare-fun m!242715 () Bool)

(assert (=> b!215577 m!242715))

(declare-fun m!242717 () Bool)

(assert (=> b!215578 m!242717))

(assert (=> b!215534 d!58451))

(declare-fun d!58453 () Bool)

(declare-fun res!105446 () Bool)

(declare-fun e!140247 () Bool)

(assert (=> d!58453 (=> (not res!105446) (not e!140247))))

(declare-fun simpleValid!218 (LongMapFixedSize!2796) Bool)

(assert (=> d!58453 (= res!105446 (simpleValid!218 thiss!1504))))

(assert (=> d!58453 (= (valid!1139 thiss!1504) e!140247)))

(declare-fun b!215585 () Bool)

(declare-fun res!105447 () Bool)

(assert (=> b!215585 (=> (not res!105447) (not e!140247))))

(declare-fun arrayCountValidKeys!0 (array!10395 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215585 (= res!105447 (= (arrayCountValidKeys!0 (_keys!6082 thiss!1504) #b00000000000000000000000000000000 (size!5255 (_keys!6082 thiss!1504))) (_size!1447 thiss!1504)))))

(declare-fun b!215586 () Bool)

(declare-fun res!105448 () Bool)

(assert (=> b!215586 (=> (not res!105448) (not e!140247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10395 (_ BitVec 32)) Bool)

(assert (=> b!215586 (= res!105448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6082 thiss!1504) (mask!9750 thiss!1504)))))

(declare-fun b!215587 () Bool)

(declare-datatypes ((List!3137 0))(
  ( (Nil!3134) (Cons!3133 (h!3778 (_ BitVec 64)) (t!8092 List!3137)) )
))
(declare-fun arrayNoDuplicates!0 (array!10395 (_ BitVec 32) List!3137) Bool)

(assert (=> b!215587 (= e!140247 (arrayNoDuplicates!0 (_keys!6082 thiss!1504) #b00000000000000000000000000000000 Nil!3134))))

(assert (= (and d!58453 res!105446) b!215585))

(assert (= (and b!215585 res!105447) b!215586))

(assert (= (and b!215586 res!105448) b!215587))

(declare-fun m!242719 () Bool)

(assert (=> d!58453 m!242719))

(declare-fun m!242721 () Bool)

(assert (=> b!215585 m!242721))

(declare-fun m!242723 () Bool)

(assert (=> b!215586 m!242723))

(declare-fun m!242725 () Bool)

(assert (=> b!215587 m!242725))

(assert (=> start!21474 d!58453))

(declare-fun d!58455 () Bool)

(assert (=> d!58455 (= (validMask!0 (mask!9750 thiss!1504)) (and (or (= (mask!9750 thiss!1504) #b00000000000000000000000000000111) (= (mask!9750 thiss!1504) #b00000000000000000000000000001111) (= (mask!9750 thiss!1504) #b00000000000000000000000000011111) (= (mask!9750 thiss!1504) #b00000000000000000000000000111111) (= (mask!9750 thiss!1504) #b00000000000000000000000001111111) (= (mask!9750 thiss!1504) #b00000000000000000000000011111111) (= (mask!9750 thiss!1504) #b00000000000000000000000111111111) (= (mask!9750 thiss!1504) #b00000000000000000000001111111111) (= (mask!9750 thiss!1504) #b00000000000000000000011111111111) (= (mask!9750 thiss!1504) #b00000000000000000000111111111111) (= (mask!9750 thiss!1504) #b00000000000000000001111111111111) (= (mask!9750 thiss!1504) #b00000000000000000011111111111111) (= (mask!9750 thiss!1504) #b00000000000000000111111111111111) (= (mask!9750 thiss!1504) #b00000000000000001111111111111111) (= (mask!9750 thiss!1504) #b00000000000000011111111111111111) (= (mask!9750 thiss!1504) #b00000000000000111111111111111111) (= (mask!9750 thiss!1504) #b00000000000001111111111111111111) (= (mask!9750 thiss!1504) #b00000000000011111111111111111111) (= (mask!9750 thiss!1504) #b00000000000111111111111111111111) (= (mask!9750 thiss!1504) #b00000000001111111111111111111111) (= (mask!9750 thiss!1504) #b00000000011111111111111111111111) (= (mask!9750 thiss!1504) #b00000000111111111111111111111111) (= (mask!9750 thiss!1504) #b00000001111111111111111111111111) (= (mask!9750 thiss!1504) #b00000011111111111111111111111111) (= (mask!9750 thiss!1504) #b00000111111111111111111111111111) (= (mask!9750 thiss!1504) #b00001111111111111111111111111111) (= (mask!9750 thiss!1504) #b00011111111111111111111111111111) (= (mask!9750 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9750 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215531 d!58455))

(declare-fun mapNonEmpty!9523 () Bool)

(declare-fun mapRes!9523 () Bool)

(declare-fun tp!20287 () Bool)

(declare-fun e!140252 () Bool)

(assert (=> mapNonEmpty!9523 (= mapRes!9523 (and tp!20287 e!140252))))

(declare-fun mapRest!9523 () (Array (_ BitVec 32) ValueCell!2448))

(declare-fun mapKey!9523 () (_ BitVec 32))

(declare-fun mapValue!9523 () ValueCell!2448)

(assert (=> mapNonEmpty!9523 (= mapRest!9517 (store mapRest!9523 mapKey!9523 mapValue!9523))))

(declare-fun b!215595 () Bool)

(declare-fun e!140253 () Bool)

(assert (=> b!215595 (= e!140253 tp_is_empty!5583)))

(declare-fun mapIsEmpty!9523 () Bool)

(assert (=> mapIsEmpty!9523 mapRes!9523))

(declare-fun b!215594 () Bool)

(assert (=> b!215594 (= e!140252 tp_is_empty!5583)))

(declare-fun condMapEmpty!9523 () Bool)

(declare-fun mapDefault!9523 () ValueCell!2448)

(assert (=> mapNonEmpty!9517 (= condMapEmpty!9523 (= mapRest!9517 ((as const (Array (_ BitVec 32) ValueCell!2448)) mapDefault!9523)))))

(assert (=> mapNonEmpty!9517 (= tp!20277 (and e!140253 mapRes!9523))))

(assert (= (and mapNonEmpty!9517 condMapEmpty!9523) mapIsEmpty!9523))

(assert (= (and mapNonEmpty!9517 (not condMapEmpty!9523)) mapNonEmpty!9523))

(assert (= (and mapNonEmpty!9523 ((_ is ValueCellFull!2448) mapValue!9523)) b!215594))

(assert (= (and mapNonEmpty!9517 ((_ is ValueCellFull!2448) mapDefault!9523)) b!215595))

(declare-fun m!242727 () Bool)

(assert (=> mapNonEmpty!9523 m!242727))

(check-sat b_and!12611 (not d!58453) (not b_next!5721) (not b!215577) (not b!215585) (not b!215586) (not d!58451) tp_is_empty!5583 (not mapNonEmpty!9523) (not b!215587))
(check-sat b_and!12611 (not b_next!5721))
