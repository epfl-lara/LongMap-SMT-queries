; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21492 () Bool)

(assert start!21492)

(declare-fun b!215471 () Bool)

(declare-fun b_free!5725 () Bool)

(declare-fun b_next!5725 () Bool)

(assert (=> b!215471 (= b_free!5725 (not b_next!5725))))

(declare-fun tp!20292 () Bool)

(declare-fun b_and!12589 () Bool)

(assert (=> b!215471 (= tp!20292 b_and!12589)))

(declare-fun b!215465 () Bool)

(declare-fun e!140171 () Bool)

(declare-fun e!140168 () Bool)

(declare-fun mapRes!9526 () Bool)

(assert (=> b!215465 (= e!140171 (and e!140168 mapRes!9526))))

(declare-fun condMapEmpty!9526 () Bool)

(declare-datatypes ((V!7097 0))(
  ( (V!7098 (val!2838 Int)) )
))
(declare-datatypes ((ValueCell!2450 0))(
  ( (ValueCellFull!2450 (v!4850 V!7097)) (EmptyCell!2450) )
))
(declare-datatypes ((array!10395 0))(
  ( (array!10396 (arr!4923 (Array (_ BitVec 32) ValueCell!2450)) (size!5254 (_ BitVec 32))) )
))
(declare-datatypes ((array!10397 0))(
  ( (array!10398 (arr!4924 (Array (_ BitVec 32) (_ BitVec 64))) (size!5255 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2800 0))(
  ( (LongMapFixedSize!2801 (defaultEntry!4050 Int) (mask!9755 (_ BitVec 32)) (extraKeys!3787 (_ BitVec 32)) (zeroValue!3891 V!7097) (minValue!3891 V!7097) (_size!1449 (_ BitVec 32)) (_keys!6084 array!10397) (_values!4033 array!10395) (_vacant!1449 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2800)

(declare-fun mapDefault!9526 () ValueCell!2450)

(assert (=> b!215465 (= condMapEmpty!9526 (= (arr!4923 (_values!4033 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2450)) mapDefault!9526)))))

(declare-fun b!215466 () Bool)

(declare-fun res!105365 () Bool)

(declare-fun e!140170 () Bool)

(assert (=> b!215466 (=> (not res!105365) (not e!140170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215466 (= res!105365 (validMask!0 (mask!9755 thiss!1504)))))

(declare-fun b!215467 () Bool)

(declare-fun e!140167 () Bool)

(assert (=> b!215467 (= e!140167 e!140170)))

(declare-fun res!105362 () Bool)

(assert (=> b!215467 (=> (not res!105362) (not e!140170))))

(declare-datatypes ((SeekEntryResult!731 0))(
  ( (MissingZero!731 (index!5094 (_ BitVec 32))) (Found!731 (index!5095 (_ BitVec 32))) (Intermediate!731 (undefined!1543 Bool) (index!5096 (_ BitVec 32)) (x!22528 (_ BitVec 32))) (Undefined!731) (MissingVacant!731 (index!5097 (_ BitVec 32))) )
))
(declare-fun lt!110810 () SeekEntryResult!731)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215467 (= res!105362 (or (= lt!110810 (MissingZero!731 index!297)) (= lt!110810 (MissingVacant!731 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10397 (_ BitVec 32)) SeekEntryResult!731)

(assert (=> b!215467 (= lt!110810 (seekEntryOrOpen!0 key!932 (_keys!6084 thiss!1504) (mask!9755 thiss!1504)))))

(declare-fun b!215468 () Bool)

(declare-fun res!105363 () Bool)

(assert (=> b!215468 (=> (not res!105363) (not e!140167))))

(assert (=> b!215468 (= res!105363 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!215469 () Bool)

(declare-fun tp_is_empty!5587 () Bool)

(assert (=> b!215469 (= e!140168 tp_is_empty!5587)))

(declare-fun mapNonEmpty!9526 () Bool)

(declare-fun tp!20293 () Bool)

(declare-fun e!140173 () Bool)

(assert (=> mapNonEmpty!9526 (= mapRes!9526 (and tp!20293 e!140173))))

(declare-fun mapValue!9526 () ValueCell!2450)

(declare-fun mapKey!9526 () (_ BitVec 32))

(declare-fun mapRest!9526 () (Array (_ BitVec 32) ValueCell!2450))

(assert (=> mapNonEmpty!9526 (= (arr!4923 (_values!4033 thiss!1504)) (store mapRest!9526 mapKey!9526 mapValue!9526))))

(declare-fun res!105364 () Bool)

(assert (=> start!21492 (=> (not res!105364) (not e!140167))))

(declare-fun valid!1160 (LongMapFixedSize!2800) Bool)

(assert (=> start!21492 (= res!105364 (valid!1160 thiss!1504))))

(assert (=> start!21492 e!140167))

(declare-fun e!140172 () Bool)

(assert (=> start!21492 e!140172))

(assert (=> start!21492 true))

(declare-fun b!215470 () Bool)

(assert (=> b!215470 (= e!140173 tp_is_empty!5587)))

(declare-fun array_inv!3235 (array!10397) Bool)

(declare-fun array_inv!3236 (array!10395) Bool)

(assert (=> b!215471 (= e!140172 (and tp!20292 tp_is_empty!5587 (array_inv!3235 (_keys!6084 thiss!1504)) (array_inv!3236 (_values!4033 thiss!1504)) e!140171))))

(declare-fun mapIsEmpty!9526 () Bool)

(assert (=> mapIsEmpty!9526 mapRes!9526))

(declare-fun b!215472 () Bool)

(assert (=> b!215472 (= e!140170 (and (= (size!5254 (_values!4033 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9755 thiss!1504))) (= (size!5255 (_keys!6084 thiss!1504)) (size!5254 (_values!4033 thiss!1504))) (bvsge (mask!9755 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3787 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and start!21492 res!105364) b!215468))

(assert (= (and b!215468 res!105363) b!215467))

(assert (= (and b!215467 res!105362) b!215466))

(assert (= (and b!215466 res!105365) b!215472))

(assert (= (and b!215465 condMapEmpty!9526) mapIsEmpty!9526))

(assert (= (and b!215465 (not condMapEmpty!9526)) mapNonEmpty!9526))

(get-info :version)

(assert (= (and mapNonEmpty!9526 ((_ is ValueCellFull!2450) mapValue!9526)) b!215470))

(assert (= (and b!215465 ((_ is ValueCellFull!2450) mapDefault!9526)) b!215469))

(assert (= b!215471 b!215465))

(assert (= start!21492 b!215471))

(declare-fun m!242113 () Bool)

(assert (=> b!215471 m!242113))

(declare-fun m!242115 () Bool)

(assert (=> b!215471 m!242115))

(declare-fun m!242117 () Bool)

(assert (=> b!215467 m!242117))

(declare-fun m!242119 () Bool)

(assert (=> start!21492 m!242119))

(declare-fun m!242121 () Bool)

(assert (=> b!215466 m!242121))

(declare-fun m!242123 () Bool)

(assert (=> mapNonEmpty!9526 m!242123))

(check-sat (not b!215466) (not b!215467) b_and!12589 (not b_next!5725) (not mapNonEmpty!9526) tp_is_empty!5587 (not b!215471) (not start!21492))
(check-sat b_and!12589 (not b_next!5725))
(get-model)

(declare-fun d!58311 () Bool)

(assert (=> d!58311 (= (array_inv!3235 (_keys!6084 thiss!1504)) (bvsge (size!5255 (_keys!6084 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215471 d!58311))

(declare-fun d!58313 () Bool)

(assert (=> d!58313 (= (array_inv!3236 (_values!4033 thiss!1504)) (bvsge (size!5254 (_values!4033 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215471 d!58313))

(declare-fun d!58315 () Bool)

(assert (=> d!58315 (= (validMask!0 (mask!9755 thiss!1504)) (and (or (= (mask!9755 thiss!1504) #b00000000000000000000000000000111) (= (mask!9755 thiss!1504) #b00000000000000000000000000001111) (= (mask!9755 thiss!1504) #b00000000000000000000000000011111) (= (mask!9755 thiss!1504) #b00000000000000000000000000111111) (= (mask!9755 thiss!1504) #b00000000000000000000000001111111) (= (mask!9755 thiss!1504) #b00000000000000000000000011111111) (= (mask!9755 thiss!1504) #b00000000000000000000000111111111) (= (mask!9755 thiss!1504) #b00000000000000000000001111111111) (= (mask!9755 thiss!1504) #b00000000000000000000011111111111) (= (mask!9755 thiss!1504) #b00000000000000000000111111111111) (= (mask!9755 thiss!1504) #b00000000000000000001111111111111) (= (mask!9755 thiss!1504) #b00000000000000000011111111111111) (= (mask!9755 thiss!1504) #b00000000000000000111111111111111) (= (mask!9755 thiss!1504) #b00000000000000001111111111111111) (= (mask!9755 thiss!1504) #b00000000000000011111111111111111) (= (mask!9755 thiss!1504) #b00000000000000111111111111111111) (= (mask!9755 thiss!1504) #b00000000000001111111111111111111) (= (mask!9755 thiss!1504) #b00000000000011111111111111111111) (= (mask!9755 thiss!1504) #b00000000000111111111111111111111) (= (mask!9755 thiss!1504) #b00000000001111111111111111111111) (= (mask!9755 thiss!1504) #b00000000011111111111111111111111) (= (mask!9755 thiss!1504) #b00000000111111111111111111111111) (= (mask!9755 thiss!1504) #b00000001111111111111111111111111) (= (mask!9755 thiss!1504) #b00000011111111111111111111111111) (= (mask!9755 thiss!1504) #b00000111111111111111111111111111) (= (mask!9755 thiss!1504) #b00001111111111111111111111111111) (= (mask!9755 thiss!1504) #b00011111111111111111111111111111) (= (mask!9755 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9755 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215466 d!58315))

(declare-fun b!215533 () Bool)

(declare-fun e!140224 () SeekEntryResult!731)

(declare-fun lt!110825 () SeekEntryResult!731)

(assert (=> b!215533 (= e!140224 (MissingZero!731 (index!5096 lt!110825)))))

(declare-fun d!58317 () Bool)

(declare-fun lt!110824 () SeekEntryResult!731)

(assert (=> d!58317 (and (or ((_ is Undefined!731) lt!110824) (not ((_ is Found!731) lt!110824)) (and (bvsge (index!5095 lt!110824) #b00000000000000000000000000000000) (bvslt (index!5095 lt!110824) (size!5255 (_keys!6084 thiss!1504))))) (or ((_ is Undefined!731) lt!110824) ((_ is Found!731) lt!110824) (not ((_ is MissingZero!731) lt!110824)) (and (bvsge (index!5094 lt!110824) #b00000000000000000000000000000000) (bvslt (index!5094 lt!110824) (size!5255 (_keys!6084 thiss!1504))))) (or ((_ is Undefined!731) lt!110824) ((_ is Found!731) lt!110824) ((_ is MissingZero!731) lt!110824) (not ((_ is MissingVacant!731) lt!110824)) (and (bvsge (index!5097 lt!110824) #b00000000000000000000000000000000) (bvslt (index!5097 lt!110824) (size!5255 (_keys!6084 thiss!1504))))) (or ((_ is Undefined!731) lt!110824) (ite ((_ is Found!731) lt!110824) (= (select (arr!4924 (_keys!6084 thiss!1504)) (index!5095 lt!110824)) key!932) (ite ((_ is MissingZero!731) lt!110824) (= (select (arr!4924 (_keys!6084 thiss!1504)) (index!5094 lt!110824)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!731) lt!110824) (= (select (arr!4924 (_keys!6084 thiss!1504)) (index!5097 lt!110824)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!140222 () SeekEntryResult!731)

(assert (=> d!58317 (= lt!110824 e!140222)))

(declare-fun c!36190 () Bool)

(assert (=> d!58317 (= c!36190 (and ((_ is Intermediate!731) lt!110825) (undefined!1543 lt!110825)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10397 (_ BitVec 32)) SeekEntryResult!731)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58317 (= lt!110825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9755 thiss!1504)) key!932 (_keys!6084 thiss!1504) (mask!9755 thiss!1504)))))

(assert (=> d!58317 (validMask!0 (mask!9755 thiss!1504))))

(assert (=> d!58317 (= (seekEntryOrOpen!0 key!932 (_keys!6084 thiss!1504) (mask!9755 thiss!1504)) lt!110824)))

(declare-fun b!215534 () Bool)

(assert (=> b!215534 (= e!140222 Undefined!731)))

(declare-fun b!215535 () Bool)

(declare-fun e!140223 () SeekEntryResult!731)

(assert (=> b!215535 (= e!140222 e!140223)))

(declare-fun lt!110823 () (_ BitVec 64))

(assert (=> b!215535 (= lt!110823 (select (arr!4924 (_keys!6084 thiss!1504)) (index!5096 lt!110825)))))

(declare-fun c!36192 () Bool)

(assert (=> b!215535 (= c!36192 (= lt!110823 key!932))))

(declare-fun b!215536 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10397 (_ BitVec 32)) SeekEntryResult!731)

(assert (=> b!215536 (= e!140224 (seekKeyOrZeroReturnVacant!0 (x!22528 lt!110825) (index!5096 lt!110825) (index!5096 lt!110825) key!932 (_keys!6084 thiss!1504) (mask!9755 thiss!1504)))))

(declare-fun b!215537 () Bool)

(assert (=> b!215537 (= e!140223 (Found!731 (index!5096 lt!110825)))))

(declare-fun b!215538 () Bool)

(declare-fun c!36191 () Bool)

(assert (=> b!215538 (= c!36191 (= lt!110823 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215538 (= e!140223 e!140224)))

(assert (= (and d!58317 c!36190) b!215534))

(assert (= (and d!58317 (not c!36190)) b!215535))

(assert (= (and b!215535 c!36192) b!215537))

(assert (= (and b!215535 (not c!36192)) b!215538))

(assert (= (and b!215538 c!36191) b!215533))

(assert (= (and b!215538 (not c!36191)) b!215536))

(declare-fun m!242149 () Bool)

(assert (=> d!58317 m!242149))

(declare-fun m!242151 () Bool)

(assert (=> d!58317 m!242151))

(assert (=> d!58317 m!242149))

(declare-fun m!242153 () Bool)

(assert (=> d!58317 m!242153))

(declare-fun m!242155 () Bool)

(assert (=> d!58317 m!242155))

(declare-fun m!242157 () Bool)

(assert (=> d!58317 m!242157))

(assert (=> d!58317 m!242121))

(declare-fun m!242159 () Bool)

(assert (=> b!215535 m!242159))

(declare-fun m!242161 () Bool)

(assert (=> b!215536 m!242161))

(assert (=> b!215467 d!58317))

(declare-fun d!58319 () Bool)

(declare-fun res!105396 () Bool)

(declare-fun e!140227 () Bool)

(assert (=> d!58319 (=> (not res!105396) (not e!140227))))

(declare-fun simpleValid!219 (LongMapFixedSize!2800) Bool)

(assert (=> d!58319 (= res!105396 (simpleValid!219 thiss!1504))))

(assert (=> d!58319 (= (valid!1160 thiss!1504) e!140227)))

(declare-fun b!215545 () Bool)

(declare-fun res!105397 () Bool)

(assert (=> b!215545 (=> (not res!105397) (not e!140227))))

(declare-fun arrayCountValidKeys!0 (array!10397 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215545 (= res!105397 (= (arrayCountValidKeys!0 (_keys!6084 thiss!1504) #b00000000000000000000000000000000 (size!5255 (_keys!6084 thiss!1504))) (_size!1449 thiss!1504)))))

(declare-fun b!215546 () Bool)

(declare-fun res!105398 () Bool)

(assert (=> b!215546 (=> (not res!105398) (not e!140227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10397 (_ BitVec 32)) Bool)

(assert (=> b!215546 (= res!105398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6084 thiss!1504) (mask!9755 thiss!1504)))))

(declare-fun b!215547 () Bool)

(declare-datatypes ((List!3125 0))(
  ( (Nil!3122) (Cons!3121 (h!3766 (_ BitVec 64)) (t!8071 List!3125)) )
))
(declare-fun arrayNoDuplicates!0 (array!10397 (_ BitVec 32) List!3125) Bool)

(assert (=> b!215547 (= e!140227 (arrayNoDuplicates!0 (_keys!6084 thiss!1504) #b00000000000000000000000000000000 Nil!3122))))

(assert (= (and d!58319 res!105396) b!215545))

(assert (= (and b!215545 res!105397) b!215546))

(assert (= (and b!215546 res!105398) b!215547))

(declare-fun m!242163 () Bool)

(assert (=> d!58319 m!242163))

(declare-fun m!242165 () Bool)

(assert (=> b!215545 m!242165))

(declare-fun m!242167 () Bool)

(assert (=> b!215546 m!242167))

(declare-fun m!242169 () Bool)

(assert (=> b!215547 m!242169))

(assert (=> start!21492 d!58319))

(declare-fun b!215555 () Bool)

(declare-fun e!140232 () Bool)

(assert (=> b!215555 (= e!140232 tp_is_empty!5587)))

(declare-fun mapIsEmpty!9535 () Bool)

(declare-fun mapRes!9535 () Bool)

(assert (=> mapIsEmpty!9535 mapRes!9535))

(declare-fun b!215554 () Bool)

(declare-fun e!140233 () Bool)

(assert (=> b!215554 (= e!140233 tp_is_empty!5587)))

(declare-fun mapNonEmpty!9535 () Bool)

(declare-fun tp!20308 () Bool)

(assert (=> mapNonEmpty!9535 (= mapRes!9535 (and tp!20308 e!140233))))

(declare-fun mapValue!9535 () ValueCell!2450)

(declare-fun mapKey!9535 () (_ BitVec 32))

(declare-fun mapRest!9535 () (Array (_ BitVec 32) ValueCell!2450))

(assert (=> mapNonEmpty!9535 (= mapRest!9526 (store mapRest!9535 mapKey!9535 mapValue!9535))))

(declare-fun condMapEmpty!9535 () Bool)

(declare-fun mapDefault!9535 () ValueCell!2450)

(assert (=> mapNonEmpty!9526 (= condMapEmpty!9535 (= mapRest!9526 ((as const (Array (_ BitVec 32) ValueCell!2450)) mapDefault!9535)))))

(assert (=> mapNonEmpty!9526 (= tp!20293 (and e!140232 mapRes!9535))))

(assert (= (and mapNonEmpty!9526 condMapEmpty!9535) mapIsEmpty!9535))

(assert (= (and mapNonEmpty!9526 (not condMapEmpty!9535)) mapNonEmpty!9535))

(assert (= (and mapNonEmpty!9535 ((_ is ValueCellFull!2450) mapValue!9535)) b!215554))

(assert (= (and mapNonEmpty!9526 ((_ is ValueCellFull!2450) mapDefault!9535)) b!215555))

(declare-fun m!242171 () Bool)

(assert (=> mapNonEmpty!9535 m!242171))

(check-sat (not b!215546) (not mapNonEmpty!9535) (not b!215536) (not d!58319) (not d!58317) b_and!12589 (not b_next!5725) (not b!215547) (not b!215545) tp_is_empty!5587)
(check-sat b_and!12589 (not b_next!5725))
(get-model)

(declare-fun b!215566 () Bool)

(declare-fun e!140244 () Bool)

(declare-fun e!140243 () Bool)

(assert (=> b!215566 (= e!140244 e!140243)))

(declare-fun res!105405 () Bool)

(assert (=> b!215566 (=> (not res!105405) (not e!140243))))

(declare-fun e!140242 () Bool)

(assert (=> b!215566 (= res!105405 (not e!140242))))

(declare-fun res!105406 () Bool)

(assert (=> b!215566 (=> (not res!105406) (not e!140242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!215566 (= res!105406 (validKeyInArray!0 (select (arr!4924 (_keys!6084 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215567 () Bool)

(declare-fun e!140245 () Bool)

(assert (=> b!215567 (= e!140243 e!140245)))

(declare-fun c!36195 () Bool)

(assert (=> b!215567 (= c!36195 (validKeyInArray!0 (select (arr!4924 (_keys!6084 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215568 () Bool)

(declare-fun contains!1408 (List!3125 (_ BitVec 64)) Bool)

(assert (=> b!215568 (= e!140242 (contains!1408 Nil!3122 (select (arr!4924 (_keys!6084 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20325 () Bool)

(declare-fun call!20328 () Bool)

(assert (=> bm!20325 (= call!20328 (arrayNoDuplicates!0 (_keys!6084 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36195 (Cons!3121 (select (arr!4924 (_keys!6084 thiss!1504)) #b00000000000000000000000000000000) Nil!3122) Nil!3122)))))

(declare-fun b!215570 () Bool)

(assert (=> b!215570 (= e!140245 call!20328)))

(declare-fun d!58321 () Bool)

(declare-fun res!105407 () Bool)

(assert (=> d!58321 (=> res!105407 e!140244)))

(assert (=> d!58321 (= res!105407 (bvsge #b00000000000000000000000000000000 (size!5255 (_keys!6084 thiss!1504))))))

(assert (=> d!58321 (= (arrayNoDuplicates!0 (_keys!6084 thiss!1504) #b00000000000000000000000000000000 Nil!3122) e!140244)))

(declare-fun b!215569 () Bool)

(assert (=> b!215569 (= e!140245 call!20328)))

(assert (= (and d!58321 (not res!105407)) b!215566))

(assert (= (and b!215566 res!105406) b!215568))

(assert (= (and b!215566 res!105405) b!215567))

(assert (= (and b!215567 c!36195) b!215569))

(assert (= (and b!215567 (not c!36195)) b!215570))

(assert (= (or b!215569 b!215570) bm!20325))

(declare-fun m!242173 () Bool)

(assert (=> b!215566 m!242173))

(assert (=> b!215566 m!242173))

(declare-fun m!242175 () Bool)

(assert (=> b!215566 m!242175))

(assert (=> b!215567 m!242173))

(assert (=> b!215567 m!242173))

(assert (=> b!215567 m!242175))

(assert (=> b!215568 m!242173))

(assert (=> b!215568 m!242173))

(declare-fun m!242177 () Bool)

(assert (=> b!215568 m!242177))

(assert (=> bm!20325 m!242173))

(declare-fun m!242179 () Bool)

(assert (=> bm!20325 m!242179))

(assert (=> b!215547 d!58321))

(declare-fun b!215583 () Bool)

(declare-fun e!140252 () SeekEntryResult!731)

(assert (=> b!215583 (= e!140252 (MissingVacant!731 (index!5096 lt!110825)))))

(declare-fun b!215584 () Bool)

(declare-fun e!140254 () SeekEntryResult!731)

(declare-fun e!140253 () SeekEntryResult!731)

(assert (=> b!215584 (= e!140254 e!140253)))

(declare-fun c!36204 () Bool)

(declare-fun lt!110831 () (_ BitVec 64))

(assert (=> b!215584 (= c!36204 (= lt!110831 key!932))))

(declare-fun b!215585 () Bool)

(assert (=> b!215585 (= e!140254 Undefined!731)))

(declare-fun b!215586 () Bool)

(declare-fun c!36202 () Bool)

(assert (=> b!215586 (= c!36202 (= lt!110831 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215586 (= e!140253 e!140252)))

(declare-fun d!58323 () Bool)

(declare-fun lt!110830 () SeekEntryResult!731)

(assert (=> d!58323 (and (or ((_ is Undefined!731) lt!110830) (not ((_ is Found!731) lt!110830)) (and (bvsge (index!5095 lt!110830) #b00000000000000000000000000000000) (bvslt (index!5095 lt!110830) (size!5255 (_keys!6084 thiss!1504))))) (or ((_ is Undefined!731) lt!110830) ((_ is Found!731) lt!110830) (not ((_ is MissingVacant!731) lt!110830)) (not (= (index!5097 lt!110830) (index!5096 lt!110825))) (and (bvsge (index!5097 lt!110830) #b00000000000000000000000000000000) (bvslt (index!5097 lt!110830) (size!5255 (_keys!6084 thiss!1504))))) (or ((_ is Undefined!731) lt!110830) (ite ((_ is Found!731) lt!110830) (= (select (arr!4924 (_keys!6084 thiss!1504)) (index!5095 lt!110830)) key!932) (and ((_ is MissingVacant!731) lt!110830) (= (index!5097 lt!110830) (index!5096 lt!110825)) (= (select (arr!4924 (_keys!6084 thiss!1504)) (index!5097 lt!110830)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58323 (= lt!110830 e!140254)))

(declare-fun c!36203 () Bool)

(assert (=> d!58323 (= c!36203 (bvsge (x!22528 lt!110825) #b01111111111111111111111111111110))))

(assert (=> d!58323 (= lt!110831 (select (arr!4924 (_keys!6084 thiss!1504)) (index!5096 lt!110825)))))

(assert (=> d!58323 (validMask!0 (mask!9755 thiss!1504))))

(assert (=> d!58323 (= (seekKeyOrZeroReturnVacant!0 (x!22528 lt!110825) (index!5096 lt!110825) (index!5096 lt!110825) key!932 (_keys!6084 thiss!1504) (mask!9755 thiss!1504)) lt!110830)))

(declare-fun b!215587 () Bool)

(assert (=> b!215587 (= e!140253 (Found!731 (index!5096 lt!110825)))))

(declare-fun b!215588 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215588 (= e!140252 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22528 lt!110825) #b00000000000000000000000000000001) (nextIndex!0 (index!5096 lt!110825) (x!22528 lt!110825) (mask!9755 thiss!1504)) (index!5096 lt!110825) key!932 (_keys!6084 thiss!1504) (mask!9755 thiss!1504)))))

(assert (= (and d!58323 c!36203) b!215585))

(assert (= (and d!58323 (not c!36203)) b!215584))

(assert (= (and b!215584 c!36204) b!215587))

(assert (= (and b!215584 (not c!36204)) b!215586))

(assert (= (and b!215586 c!36202) b!215583))

(assert (= (and b!215586 (not c!36202)) b!215588))

(declare-fun m!242181 () Bool)

(assert (=> d!58323 m!242181))

(declare-fun m!242183 () Bool)

(assert (=> d!58323 m!242183))

(assert (=> d!58323 m!242159))

(assert (=> d!58323 m!242121))

(declare-fun m!242185 () Bool)

(assert (=> b!215588 m!242185))

(assert (=> b!215588 m!242185))

(declare-fun m!242187 () Bool)

(assert (=> b!215588 m!242187))

(assert (=> b!215536 d!58323))

(declare-fun d!58325 () Bool)

(declare-fun res!105419 () Bool)

(declare-fun e!140257 () Bool)

(assert (=> d!58325 (=> (not res!105419) (not e!140257))))

(assert (=> d!58325 (= res!105419 (validMask!0 (mask!9755 thiss!1504)))))

(assert (=> d!58325 (= (simpleValid!219 thiss!1504) e!140257)))

(declare-fun b!215597 () Bool)

(declare-fun res!105418 () Bool)

(assert (=> b!215597 (=> (not res!105418) (not e!140257))))

(assert (=> b!215597 (= res!105418 (and (= (size!5254 (_values!4033 thiss!1504)) (bvadd (mask!9755 thiss!1504) #b00000000000000000000000000000001)) (= (size!5255 (_keys!6084 thiss!1504)) (size!5254 (_values!4033 thiss!1504))) (bvsge (_size!1449 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1449 thiss!1504) (bvadd (mask!9755 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!215600 () Bool)

(assert (=> b!215600 (= e!140257 (and (bvsge (extraKeys!3787 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3787 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1449 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215598 () Bool)

(declare-fun res!105417 () Bool)

(assert (=> b!215598 (=> (not res!105417) (not e!140257))))

(declare-fun size!5260 (LongMapFixedSize!2800) (_ BitVec 32))

(assert (=> b!215598 (= res!105417 (bvsge (size!5260 thiss!1504) (_size!1449 thiss!1504)))))

(declare-fun b!215599 () Bool)

(declare-fun res!105416 () Bool)

(assert (=> b!215599 (=> (not res!105416) (not e!140257))))

(assert (=> b!215599 (= res!105416 (= (size!5260 thiss!1504) (bvadd (_size!1449 thiss!1504) (bvsdiv (bvadd (extraKeys!3787 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!58325 res!105419) b!215597))

(assert (= (and b!215597 res!105418) b!215598))

(assert (= (and b!215598 res!105417) b!215599))

(assert (= (and b!215599 res!105416) b!215600))

(assert (=> d!58325 m!242121))

(declare-fun m!242189 () Bool)

(assert (=> b!215598 m!242189))

(assert (=> b!215599 m!242189))

(assert (=> d!58319 d!58325))

(declare-fun b!215619 () Bool)

(declare-fun e!140270 () SeekEntryResult!731)

(assert (=> b!215619 (= e!140270 (Intermediate!731 true (toIndex!0 key!932 (mask!9755 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215620 () Bool)

(declare-fun lt!110836 () SeekEntryResult!731)

(assert (=> b!215620 (and (bvsge (index!5096 lt!110836) #b00000000000000000000000000000000) (bvslt (index!5096 lt!110836) (size!5255 (_keys!6084 thiss!1504))))))

(declare-fun res!105426 () Bool)

(assert (=> b!215620 (= res!105426 (= (select (arr!4924 (_keys!6084 thiss!1504)) (index!5096 lt!110836)) key!932))))

(declare-fun e!140268 () Bool)

(assert (=> b!215620 (=> res!105426 e!140268)))

(declare-fun e!140272 () Bool)

(assert (=> b!215620 (= e!140272 e!140268)))

(declare-fun b!215621 () Bool)

(assert (=> b!215621 (and (bvsge (index!5096 lt!110836) #b00000000000000000000000000000000) (bvslt (index!5096 lt!110836) (size!5255 (_keys!6084 thiss!1504))))))

(declare-fun res!105427 () Bool)

(assert (=> b!215621 (= res!105427 (= (select (arr!4924 (_keys!6084 thiss!1504)) (index!5096 lt!110836)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215621 (=> res!105427 e!140268)))

(declare-fun b!215622 () Bool)

(declare-fun e!140269 () Bool)

(assert (=> b!215622 (= e!140269 e!140272)))

(declare-fun res!105428 () Bool)

(assert (=> b!215622 (= res!105428 (and ((_ is Intermediate!731) lt!110836) (not (undefined!1543 lt!110836)) (bvslt (x!22528 lt!110836) #b01111111111111111111111111111110) (bvsge (x!22528 lt!110836) #b00000000000000000000000000000000) (bvsge (x!22528 lt!110836) #b00000000000000000000000000000000)))))

(assert (=> b!215622 (=> (not res!105428) (not e!140272))))

(declare-fun d!58327 () Bool)

(assert (=> d!58327 e!140269))

(declare-fun c!36213 () Bool)

(assert (=> d!58327 (= c!36213 (and ((_ is Intermediate!731) lt!110836) (undefined!1543 lt!110836)))))

(assert (=> d!58327 (= lt!110836 e!140270)))

(declare-fun c!36211 () Bool)

(assert (=> d!58327 (= c!36211 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!110837 () (_ BitVec 64))

(assert (=> d!58327 (= lt!110837 (select (arr!4924 (_keys!6084 thiss!1504)) (toIndex!0 key!932 (mask!9755 thiss!1504))))))

(assert (=> d!58327 (validMask!0 (mask!9755 thiss!1504))))

(assert (=> d!58327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9755 thiss!1504)) key!932 (_keys!6084 thiss!1504) (mask!9755 thiss!1504)) lt!110836)))

(declare-fun b!215623 () Bool)

(declare-fun e!140271 () SeekEntryResult!731)

(assert (=> b!215623 (= e!140271 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9755 thiss!1504)) #b00000000000000000000000000000000 (mask!9755 thiss!1504)) key!932 (_keys!6084 thiss!1504) (mask!9755 thiss!1504)))))

(declare-fun b!215624 () Bool)

(assert (=> b!215624 (= e!140270 e!140271)))

(declare-fun c!36212 () Bool)

(assert (=> b!215624 (= c!36212 (or (= lt!110837 key!932) (= (bvadd lt!110837 lt!110837) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!215625 () Bool)

(assert (=> b!215625 (and (bvsge (index!5096 lt!110836) #b00000000000000000000000000000000) (bvslt (index!5096 lt!110836) (size!5255 (_keys!6084 thiss!1504))))))

(assert (=> b!215625 (= e!140268 (= (select (arr!4924 (_keys!6084 thiss!1504)) (index!5096 lt!110836)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!215626 () Bool)

(assert (=> b!215626 (= e!140271 (Intermediate!731 false (toIndex!0 key!932 (mask!9755 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215627 () Bool)

(assert (=> b!215627 (= e!140269 (bvsge (x!22528 lt!110836) #b01111111111111111111111111111110))))

(assert (= (and d!58327 c!36211) b!215619))

(assert (= (and d!58327 (not c!36211)) b!215624))

(assert (= (and b!215624 c!36212) b!215626))

(assert (= (and b!215624 (not c!36212)) b!215623))

(assert (= (and d!58327 c!36213) b!215627))

(assert (= (and d!58327 (not c!36213)) b!215622))

(assert (= (and b!215622 res!105428) b!215620))

(assert (= (and b!215620 (not res!105426)) b!215621))

(assert (= (and b!215621 (not res!105427)) b!215625))

(declare-fun m!242191 () Bool)

(assert (=> b!215620 m!242191))

(assert (=> b!215621 m!242191))

(assert (=> d!58327 m!242149))

(declare-fun m!242193 () Bool)

(assert (=> d!58327 m!242193))

(assert (=> d!58327 m!242121))

(assert (=> b!215623 m!242149))

(declare-fun m!242195 () Bool)

(assert (=> b!215623 m!242195))

(assert (=> b!215623 m!242195))

(declare-fun m!242197 () Bool)

(assert (=> b!215623 m!242197))

(assert (=> b!215625 m!242191))

(assert (=> d!58317 d!58327))

(declare-fun d!58329 () Bool)

(declare-fun lt!110843 () (_ BitVec 32))

(declare-fun lt!110842 () (_ BitVec 32))

(assert (=> d!58329 (= lt!110843 (bvmul (bvxor lt!110842 (bvlshr lt!110842 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58329 (= lt!110842 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58329 (and (bvsge (mask!9755 thiss!1504) #b00000000000000000000000000000000) (let ((res!105429 (let ((h!3767 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22545 (bvmul (bvxor h!3767 (bvlshr h!3767 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22545 (bvlshr x!22545 #b00000000000000000000000000001101)) (mask!9755 thiss!1504)))))) (and (bvslt res!105429 (bvadd (mask!9755 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105429 #b00000000000000000000000000000000))))))

(assert (=> d!58329 (= (toIndex!0 key!932 (mask!9755 thiss!1504)) (bvand (bvxor lt!110843 (bvlshr lt!110843 #b00000000000000000000000000001101)) (mask!9755 thiss!1504)))))

(assert (=> d!58317 d!58329))

(assert (=> d!58317 d!58315))

(declare-fun bm!20328 () Bool)

(declare-fun call!20331 () Bool)

(assert (=> bm!20328 (= call!20331 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6084 thiss!1504) (mask!9755 thiss!1504)))))

(declare-fun d!58331 () Bool)

(declare-fun res!105434 () Bool)

(declare-fun e!140280 () Bool)

(assert (=> d!58331 (=> res!105434 e!140280)))

(assert (=> d!58331 (= res!105434 (bvsge #b00000000000000000000000000000000 (size!5255 (_keys!6084 thiss!1504))))))

(assert (=> d!58331 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6084 thiss!1504) (mask!9755 thiss!1504)) e!140280)))

(declare-fun b!215636 () Bool)

(declare-fun e!140279 () Bool)

(declare-fun e!140281 () Bool)

(assert (=> b!215636 (= e!140279 e!140281)))

(declare-fun lt!110851 () (_ BitVec 64))

(assert (=> b!215636 (= lt!110851 (select (arr!4924 (_keys!6084 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6456 0))(
  ( (Unit!6457) )
))
(declare-fun lt!110850 () Unit!6456)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10397 (_ BitVec 64) (_ BitVec 32)) Unit!6456)

(assert (=> b!215636 (= lt!110850 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6084 thiss!1504) lt!110851 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!215636 (arrayContainsKey!0 (_keys!6084 thiss!1504) lt!110851 #b00000000000000000000000000000000)))

(declare-fun lt!110852 () Unit!6456)

(assert (=> b!215636 (= lt!110852 lt!110850)))

(declare-fun res!105435 () Bool)

(assert (=> b!215636 (= res!105435 (= (seekEntryOrOpen!0 (select (arr!4924 (_keys!6084 thiss!1504)) #b00000000000000000000000000000000) (_keys!6084 thiss!1504) (mask!9755 thiss!1504)) (Found!731 #b00000000000000000000000000000000)))))

(assert (=> b!215636 (=> (not res!105435) (not e!140281))))

(declare-fun b!215637 () Bool)

(assert (=> b!215637 (= e!140280 e!140279)))

(declare-fun c!36216 () Bool)

(assert (=> b!215637 (= c!36216 (validKeyInArray!0 (select (arr!4924 (_keys!6084 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215638 () Bool)

(assert (=> b!215638 (= e!140279 call!20331)))

(declare-fun b!215639 () Bool)

(assert (=> b!215639 (= e!140281 call!20331)))

(assert (= (and d!58331 (not res!105434)) b!215637))

(assert (= (and b!215637 c!36216) b!215636))

(assert (= (and b!215637 (not c!36216)) b!215638))

(assert (= (and b!215636 res!105435) b!215639))

(assert (= (or b!215639 b!215638) bm!20328))

(declare-fun m!242199 () Bool)

(assert (=> bm!20328 m!242199))

(assert (=> b!215636 m!242173))

(declare-fun m!242201 () Bool)

(assert (=> b!215636 m!242201))

(declare-fun m!242203 () Bool)

(assert (=> b!215636 m!242203))

(assert (=> b!215636 m!242173))

(declare-fun m!242205 () Bool)

(assert (=> b!215636 m!242205))

(assert (=> b!215637 m!242173))

(assert (=> b!215637 m!242173))

(assert (=> b!215637 m!242175))

(assert (=> b!215546 d!58331))

(declare-fun b!215648 () Bool)

(declare-fun e!140287 () (_ BitVec 32))

(declare-fun call!20334 () (_ BitVec 32))

(assert (=> b!215648 (= e!140287 (bvadd #b00000000000000000000000000000001 call!20334))))

(declare-fun b!215649 () Bool)

(assert (=> b!215649 (= e!140287 call!20334)))

(declare-fun bm!20331 () Bool)

(assert (=> bm!20331 (= call!20334 (arrayCountValidKeys!0 (_keys!6084 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5255 (_keys!6084 thiss!1504))))))

(declare-fun d!58333 () Bool)

(declare-fun lt!110855 () (_ BitVec 32))

(assert (=> d!58333 (and (bvsge lt!110855 #b00000000000000000000000000000000) (bvsle lt!110855 (bvsub (size!5255 (_keys!6084 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!140286 () (_ BitVec 32))

(assert (=> d!58333 (= lt!110855 e!140286)))

(declare-fun c!36222 () Bool)

(assert (=> d!58333 (= c!36222 (bvsge #b00000000000000000000000000000000 (size!5255 (_keys!6084 thiss!1504))))))

(assert (=> d!58333 (and (bvsle #b00000000000000000000000000000000 (size!5255 (_keys!6084 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5255 (_keys!6084 thiss!1504)) (size!5255 (_keys!6084 thiss!1504))))))

(assert (=> d!58333 (= (arrayCountValidKeys!0 (_keys!6084 thiss!1504) #b00000000000000000000000000000000 (size!5255 (_keys!6084 thiss!1504))) lt!110855)))

(declare-fun b!215650 () Bool)

(assert (=> b!215650 (= e!140286 e!140287)))

(declare-fun c!36221 () Bool)

(assert (=> b!215650 (= c!36221 (validKeyInArray!0 (select (arr!4924 (_keys!6084 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215651 () Bool)

(assert (=> b!215651 (= e!140286 #b00000000000000000000000000000000)))

(assert (= (and d!58333 c!36222) b!215651))

(assert (= (and d!58333 (not c!36222)) b!215650))

(assert (= (and b!215650 c!36221) b!215648))

(assert (= (and b!215650 (not c!36221)) b!215649))

(assert (= (or b!215648 b!215649) bm!20331))

(declare-fun m!242207 () Bool)

(assert (=> bm!20331 m!242207))

(assert (=> b!215650 m!242173))

(assert (=> b!215650 m!242173))

(assert (=> b!215650 m!242175))

(assert (=> b!215545 d!58333))

(declare-fun b!215653 () Bool)

(declare-fun e!140288 () Bool)

(assert (=> b!215653 (= e!140288 tp_is_empty!5587)))

(declare-fun mapIsEmpty!9536 () Bool)

(declare-fun mapRes!9536 () Bool)

(assert (=> mapIsEmpty!9536 mapRes!9536))

(declare-fun b!215652 () Bool)

(declare-fun e!140289 () Bool)

(assert (=> b!215652 (= e!140289 tp_is_empty!5587)))

(declare-fun mapNonEmpty!9536 () Bool)

(declare-fun tp!20309 () Bool)

(assert (=> mapNonEmpty!9536 (= mapRes!9536 (and tp!20309 e!140289))))

(declare-fun mapRest!9536 () (Array (_ BitVec 32) ValueCell!2450))

(declare-fun mapKey!9536 () (_ BitVec 32))

(declare-fun mapValue!9536 () ValueCell!2450)

(assert (=> mapNonEmpty!9536 (= mapRest!9535 (store mapRest!9536 mapKey!9536 mapValue!9536))))

(declare-fun condMapEmpty!9536 () Bool)

(declare-fun mapDefault!9536 () ValueCell!2450)

(assert (=> mapNonEmpty!9535 (= condMapEmpty!9536 (= mapRest!9535 ((as const (Array (_ BitVec 32) ValueCell!2450)) mapDefault!9536)))))

(assert (=> mapNonEmpty!9535 (= tp!20308 (and e!140288 mapRes!9536))))

(assert (= (and mapNonEmpty!9535 condMapEmpty!9536) mapIsEmpty!9536))

(assert (= (and mapNonEmpty!9535 (not condMapEmpty!9536)) mapNonEmpty!9536))

(assert (= (and mapNonEmpty!9536 ((_ is ValueCellFull!2450) mapValue!9536)) b!215652))

(assert (= (and mapNonEmpty!9535 ((_ is ValueCellFull!2450) mapDefault!9536)) b!215653))

(declare-fun m!242209 () Bool)

(assert (=> mapNonEmpty!9536 m!242209))

(check-sat (not b!215567) (not b!215568) (not bm!20325) (not b!215623) (not mapNonEmpty!9536) (not b!215637) tp_is_empty!5587 (not b!215588) (not b!215650) (not d!58325) (not d!58327) (not bm!20328) (not d!58323) (not b!215566) (not bm!20331) (not b!215636) b_and!12589 (not b_next!5725) (not b!215599) (not b!215598))
(check-sat b_and!12589 (not b_next!5725))
