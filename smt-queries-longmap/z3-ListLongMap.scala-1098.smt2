; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22536 () Bool)

(assert start!22536)

(declare-fun b!235451 () Bool)

(declare-fun b_free!6337 () Bool)

(declare-fun b_next!6337 () Bool)

(assert (=> b!235451 (= b_free!6337 (not b_next!6337))))

(declare-fun tp!22181 () Bool)

(declare-fun b_and!13241 () Bool)

(assert (=> b!235451 (= tp!22181 b_and!13241)))

(declare-fun b!235448 () Bool)

(declare-fun e!152899 () Bool)

(declare-fun e!152903 () Bool)

(declare-fun mapRes!10496 () Bool)

(assert (=> b!235448 (= e!152899 (and e!152903 mapRes!10496))))

(declare-fun condMapEmpty!10496 () Bool)

(declare-datatypes ((V!7913 0))(
  ( (V!7914 (val!3144 Int)) )
))
(declare-datatypes ((ValueCell!2756 0))(
  ( (ValueCellFull!2756 (v!5166 V!7913)) (EmptyCell!2756) )
))
(declare-datatypes ((array!11649 0))(
  ( (array!11650 (arr!5535 (Array (_ BitVec 32) ValueCell!2756)) (size!5873 (_ BitVec 32))) )
))
(declare-datatypes ((array!11651 0))(
  ( (array!11652 (arr!5536 (Array (_ BitVec 32) (_ BitVec 64))) (size!5874 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3412 0))(
  ( (LongMapFixedSize!3413 (defaultEntry!4377 Int) (mask!10350 (_ BitVec 32)) (extraKeys!4114 (_ BitVec 32)) (zeroValue!4218 V!7913) (minValue!4218 V!7913) (_size!1755 (_ BitVec 32)) (_keys!6452 array!11651) (_values!4360 array!11649) (_vacant!1755 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3412)

(declare-fun mapDefault!10496 () ValueCell!2756)

(assert (=> b!235448 (= condMapEmpty!10496 (= (arr!5535 (_values!4360 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2756)) mapDefault!10496)))))

(declare-fun mapIsEmpty!10496 () Bool)

(assert (=> mapIsEmpty!10496 mapRes!10496))

(declare-fun res!115446 () Bool)

(declare-fun e!152897 () Bool)

(assert (=> start!22536 (=> (not res!115446) (not e!152897))))

(declare-fun valid!1358 (LongMapFixedSize!3412) Bool)

(assert (=> start!22536 (= res!115446 (valid!1358 thiss!1504))))

(assert (=> start!22536 e!152897))

(declare-fun e!152902 () Bool)

(assert (=> start!22536 e!152902))

(assert (=> start!22536 true))

(declare-fun b!235449 () Bool)

(declare-fun res!115452 () Bool)

(declare-fun e!152901 () Bool)

(assert (=> b!235449 (=> (not res!115452) (not e!152901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235449 (= res!115452 (validMask!0 (mask!10350 thiss!1504)))))

(declare-fun b!235450 () Bool)

(declare-fun res!115449 () Bool)

(assert (=> b!235450 (=> (not res!115449) (not e!152901))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4612 0))(
  ( (tuple2!4613 (_1!2317 (_ BitVec 64)) (_2!2317 V!7913)) )
))
(declare-datatypes ((List!3537 0))(
  ( (Nil!3534) (Cons!3533 (h!4185 tuple2!4612) (t!8503 List!3537)) )
))
(declare-datatypes ((ListLongMap!3515 0))(
  ( (ListLongMap!3516 (toList!1773 List!3537)) )
))
(declare-fun contains!1653 (ListLongMap!3515 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1282 (array!11651 array!11649 (_ BitVec 32) (_ BitVec 32) V!7913 V!7913 (_ BitVec 32) Int) ListLongMap!3515)

(assert (=> b!235450 (= res!115449 (contains!1653 (getCurrentListMap!1282 (_keys!6452 thiss!1504) (_values!4360 thiss!1504) (mask!10350 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)) key!932))))

(declare-fun tp_is_empty!6199 () Bool)

(declare-fun array_inv!3655 (array!11651) Bool)

(declare-fun array_inv!3656 (array!11649) Bool)

(assert (=> b!235451 (= e!152902 (and tp!22181 tp_is_empty!6199 (array_inv!3655 (_keys!6452 thiss!1504)) (array_inv!3656 (_values!4360 thiss!1504)) e!152899))))

(declare-fun b!235452 () Bool)

(assert (=> b!235452 (= e!152897 e!152901)))

(declare-fun res!115448 () Bool)

(assert (=> b!235452 (=> (not res!115448) (not e!152901))))

(declare-datatypes ((SeekEntryResult!993 0))(
  ( (MissingZero!993 (index!6142 (_ BitVec 32))) (Found!993 (index!6143 (_ BitVec 32))) (Intermediate!993 (undefined!1805 Bool) (index!6144 (_ BitVec 32)) (x!23804 (_ BitVec 32))) (Undefined!993) (MissingVacant!993 (index!6145 (_ BitVec 32))) )
))
(declare-fun lt!118971 () SeekEntryResult!993)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235452 (= res!115448 (or (= lt!118971 (MissingZero!993 index!297)) (= lt!118971 (MissingVacant!993 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11651 (_ BitVec 32)) SeekEntryResult!993)

(assert (=> b!235452 (= lt!118971 (seekEntryOrOpen!0 key!932 (_keys!6452 thiss!1504) (mask!10350 thiss!1504)))))

(declare-fun b!235453 () Bool)

(declare-fun res!115450 () Bool)

(assert (=> b!235453 (=> (not res!115450) (not e!152901))))

(declare-datatypes ((List!3538 0))(
  ( (Nil!3535) (Cons!3534 (h!4186 (_ BitVec 64)) (t!8504 List!3538)) )
))
(declare-fun arrayNoDuplicates!0 (array!11651 (_ BitVec 32) List!3538) Bool)

(assert (=> b!235453 (= res!115450 (arrayNoDuplicates!0 (_keys!6452 thiss!1504) #b00000000000000000000000000000000 Nil!3535))))

(declare-fun b!235454 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!235454 (= e!152901 (not (validKeyInArray!0 key!932)))))

(declare-fun b!235455 () Bool)

(declare-fun e!152900 () Bool)

(assert (=> b!235455 (= e!152900 tp_is_empty!6199)))

(declare-fun b!235456 () Bool)

(assert (=> b!235456 (= e!152903 tp_is_empty!6199)))

(declare-fun mapNonEmpty!10496 () Bool)

(declare-fun tp!22180 () Bool)

(assert (=> mapNonEmpty!10496 (= mapRes!10496 (and tp!22180 e!152900))))

(declare-fun mapRest!10496 () (Array (_ BitVec 32) ValueCell!2756))

(declare-fun mapValue!10496 () ValueCell!2756)

(declare-fun mapKey!10496 () (_ BitVec 32))

(assert (=> mapNonEmpty!10496 (= (arr!5535 (_values!4360 thiss!1504)) (store mapRest!10496 mapKey!10496 mapValue!10496))))

(declare-fun b!235457 () Bool)

(declare-fun res!115451 () Bool)

(assert (=> b!235457 (=> (not res!115451) (not e!152901))))

(assert (=> b!235457 (= res!115451 (and (= (size!5873 (_values!4360 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10350 thiss!1504))) (= (size!5874 (_keys!6452 thiss!1504)) (size!5873 (_values!4360 thiss!1504))) (bvsge (mask!10350 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4114 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4114 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!235458 () Bool)

(declare-fun res!115447 () Bool)

(assert (=> b!235458 (=> (not res!115447) (not e!152901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11651 (_ BitVec 32)) Bool)

(assert (=> b!235458 (= res!115447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6452 thiss!1504) (mask!10350 thiss!1504)))))

(declare-fun b!235459 () Bool)

(declare-fun res!115453 () Bool)

(assert (=> b!235459 (=> (not res!115453) (not e!152897))))

(assert (=> b!235459 (= res!115453 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22536 res!115446) b!235459))

(assert (= (and b!235459 res!115453) b!235452))

(assert (= (and b!235452 res!115448) b!235450))

(assert (= (and b!235450 res!115449) b!235449))

(assert (= (and b!235449 res!115452) b!235457))

(assert (= (and b!235457 res!115451) b!235458))

(assert (= (and b!235458 res!115447) b!235453))

(assert (= (and b!235453 res!115450) b!235454))

(assert (= (and b!235448 condMapEmpty!10496) mapIsEmpty!10496))

(assert (= (and b!235448 (not condMapEmpty!10496)) mapNonEmpty!10496))

(get-info :version)

(assert (= (and mapNonEmpty!10496 ((_ is ValueCellFull!2756) mapValue!10496)) b!235455))

(assert (= (and b!235448 ((_ is ValueCellFull!2756) mapDefault!10496)) b!235456))

(assert (= b!235451 b!235448))

(assert (= start!22536 b!235451))

(declare-fun m!256037 () Bool)

(assert (=> b!235452 m!256037))

(declare-fun m!256039 () Bool)

(assert (=> mapNonEmpty!10496 m!256039))

(declare-fun m!256041 () Bool)

(assert (=> b!235450 m!256041))

(assert (=> b!235450 m!256041))

(declare-fun m!256043 () Bool)

(assert (=> b!235450 m!256043))

(declare-fun m!256045 () Bool)

(assert (=> b!235458 m!256045))

(declare-fun m!256047 () Bool)

(assert (=> start!22536 m!256047))

(declare-fun m!256049 () Bool)

(assert (=> b!235454 m!256049))

(declare-fun m!256051 () Bool)

(assert (=> b!235453 m!256051))

(declare-fun m!256053 () Bool)

(assert (=> b!235449 m!256053))

(declare-fun m!256055 () Bool)

(assert (=> b!235451 m!256055))

(declare-fun m!256057 () Bool)

(assert (=> b!235451 m!256057))

(check-sat (not b!235451) (not b!235458) tp_is_empty!6199 (not start!22536) (not b!235449) (not b!235450) (not b!235453) (not b!235454) b_and!13241 (not b!235452) (not b_next!6337) (not mapNonEmpty!10496))
(check-sat b_and!13241 (not b_next!6337))
(get-model)

(declare-fun d!59147 () Bool)

(assert (=> d!59147 (= (validMask!0 (mask!10350 thiss!1504)) (and (or (= (mask!10350 thiss!1504) #b00000000000000000000000000000111) (= (mask!10350 thiss!1504) #b00000000000000000000000000001111) (= (mask!10350 thiss!1504) #b00000000000000000000000000011111) (= (mask!10350 thiss!1504) #b00000000000000000000000000111111) (= (mask!10350 thiss!1504) #b00000000000000000000000001111111) (= (mask!10350 thiss!1504) #b00000000000000000000000011111111) (= (mask!10350 thiss!1504) #b00000000000000000000000111111111) (= (mask!10350 thiss!1504) #b00000000000000000000001111111111) (= (mask!10350 thiss!1504) #b00000000000000000000011111111111) (= (mask!10350 thiss!1504) #b00000000000000000000111111111111) (= (mask!10350 thiss!1504) #b00000000000000000001111111111111) (= (mask!10350 thiss!1504) #b00000000000000000011111111111111) (= (mask!10350 thiss!1504) #b00000000000000000111111111111111) (= (mask!10350 thiss!1504) #b00000000000000001111111111111111) (= (mask!10350 thiss!1504) #b00000000000000011111111111111111) (= (mask!10350 thiss!1504) #b00000000000000111111111111111111) (= (mask!10350 thiss!1504) #b00000000000001111111111111111111) (= (mask!10350 thiss!1504) #b00000000000011111111111111111111) (= (mask!10350 thiss!1504) #b00000000000111111111111111111111) (= (mask!10350 thiss!1504) #b00000000001111111111111111111111) (= (mask!10350 thiss!1504) #b00000000011111111111111111111111) (= (mask!10350 thiss!1504) #b00000000111111111111111111111111) (= (mask!10350 thiss!1504) #b00000001111111111111111111111111) (= (mask!10350 thiss!1504) #b00000011111111111111111111111111) (= (mask!10350 thiss!1504) #b00000111111111111111111111111111) (= (mask!10350 thiss!1504) #b00001111111111111111111111111111) (= (mask!10350 thiss!1504) #b00011111111111111111111111111111) (= (mask!10350 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10350 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!235449 d!59147))

(declare-fun d!59149 () Bool)

(declare-fun e!152950 () Bool)

(assert (=> d!59149 e!152950))

(declare-fun res!115504 () Bool)

(assert (=> d!59149 (=> res!115504 e!152950)))

(declare-fun lt!118989 () Bool)

(assert (=> d!59149 (= res!115504 (not lt!118989))))

(declare-fun lt!118988 () Bool)

(assert (=> d!59149 (= lt!118989 lt!118988)))

(declare-datatypes ((Unit!7254 0))(
  ( (Unit!7255) )
))
(declare-fun lt!118986 () Unit!7254)

(declare-fun e!152951 () Unit!7254)

(assert (=> d!59149 (= lt!118986 e!152951)))

(declare-fun c!39221 () Bool)

(assert (=> d!59149 (= c!39221 lt!118988)))

(declare-fun containsKey!259 (List!3537 (_ BitVec 64)) Bool)

(assert (=> d!59149 (= lt!118988 (containsKey!259 (toList!1773 (getCurrentListMap!1282 (_keys!6452 thiss!1504) (_values!4360 thiss!1504) (mask!10350 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504))) key!932))))

(assert (=> d!59149 (= (contains!1653 (getCurrentListMap!1282 (_keys!6452 thiss!1504) (_values!4360 thiss!1504) (mask!10350 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)) key!932) lt!118989)))

(declare-fun b!235538 () Bool)

(declare-fun lt!118987 () Unit!7254)

(assert (=> b!235538 (= e!152951 lt!118987)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!208 (List!3537 (_ BitVec 64)) Unit!7254)

(assert (=> b!235538 (= lt!118987 (lemmaContainsKeyImpliesGetValueByKeyDefined!208 (toList!1773 (getCurrentListMap!1282 (_keys!6452 thiss!1504) (_values!4360 thiss!1504) (mask!10350 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504))) key!932))))

(declare-datatypes ((Option!273 0))(
  ( (Some!272 (v!5169 V!7913)) (None!271) )
))
(declare-fun isDefined!209 (Option!273) Bool)

(declare-fun getValueByKey!267 (List!3537 (_ BitVec 64)) Option!273)

(assert (=> b!235538 (isDefined!209 (getValueByKey!267 (toList!1773 (getCurrentListMap!1282 (_keys!6452 thiss!1504) (_values!4360 thiss!1504) (mask!10350 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504))) key!932))))

(declare-fun b!235539 () Bool)

(declare-fun Unit!7256 () Unit!7254)

(assert (=> b!235539 (= e!152951 Unit!7256)))

(declare-fun b!235540 () Bool)

(assert (=> b!235540 (= e!152950 (isDefined!209 (getValueByKey!267 (toList!1773 (getCurrentListMap!1282 (_keys!6452 thiss!1504) (_values!4360 thiss!1504) (mask!10350 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504))) key!932)))))

(assert (= (and d!59149 c!39221) b!235538))

(assert (= (and d!59149 (not c!39221)) b!235539))

(assert (= (and d!59149 (not res!115504)) b!235540))

(declare-fun m!256103 () Bool)

(assert (=> d!59149 m!256103))

(declare-fun m!256105 () Bool)

(assert (=> b!235538 m!256105))

(declare-fun m!256107 () Bool)

(assert (=> b!235538 m!256107))

(assert (=> b!235538 m!256107))

(declare-fun m!256109 () Bool)

(assert (=> b!235538 m!256109))

(assert (=> b!235540 m!256107))

(assert (=> b!235540 m!256107))

(assert (=> b!235540 m!256109))

(assert (=> b!235450 d!59149))

(declare-fun b!235583 () Bool)

(declare-fun res!115527 () Bool)

(declare-fun e!152989 () Bool)

(assert (=> b!235583 (=> (not res!115527) (not e!152989))))

(declare-fun e!152983 () Bool)

(assert (=> b!235583 (= res!115527 e!152983)))

(declare-fun res!115526 () Bool)

(assert (=> b!235583 (=> res!115526 e!152983)))

(declare-fun e!152984 () Bool)

(assert (=> b!235583 (= res!115526 (not e!152984))))

(declare-fun res!115523 () Bool)

(assert (=> b!235583 (=> (not res!115523) (not e!152984))))

(assert (=> b!235583 (= res!115523 (bvslt #b00000000000000000000000000000000 (size!5874 (_keys!6452 thiss!1504))))))

(declare-fun b!235584 () Bool)

(assert (=> b!235584 (= e!152984 (validKeyInArray!0 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21891 () Bool)

(declare-fun call!21894 () Bool)

(declare-fun lt!119051 () ListLongMap!3515)

(assert (=> bm!21891 (= call!21894 (contains!1653 lt!119051 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21892 () Bool)

(declare-fun call!21897 () ListLongMap!3515)

(declare-fun getCurrentListMapNoExtraKeys!527 (array!11651 array!11649 (_ BitVec 32) (_ BitVec 32) V!7913 V!7913 (_ BitVec 32) Int) ListLongMap!3515)

(assert (=> bm!21892 (= call!21897 (getCurrentListMapNoExtraKeys!527 (_keys!6452 thiss!1504) (_values!4360 thiss!1504) (mask!10350 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)))))

(declare-fun b!235586 () Bool)

(declare-fun e!152978 () Bool)

(assert (=> b!235586 (= e!152978 (not call!21894))))

(declare-fun call!21899 () ListLongMap!3515)

(declare-fun c!39239 () Bool)

(declare-fun bm!21893 () Bool)

(declare-fun call!21895 () ListLongMap!3515)

(declare-fun call!21896 () ListLongMap!3515)

(declare-fun c!39238 () Bool)

(declare-fun +!644 (ListLongMap!3515 tuple2!4612) ListLongMap!3515)

(assert (=> bm!21893 (= call!21899 (+!644 (ite c!39239 call!21897 (ite c!39238 call!21896 call!21895)) (ite (or c!39239 c!39238) (tuple2!4613 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4218 thiss!1504)) (tuple2!4613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4218 thiss!1504)))))))

(declare-fun b!235587 () Bool)

(declare-fun e!152981 () ListLongMap!3515)

(declare-fun call!21900 () ListLongMap!3515)

(assert (=> b!235587 (= e!152981 call!21900)))

(declare-fun b!235588 () Bool)

(declare-fun e!152987 () Unit!7254)

(declare-fun Unit!7257 () Unit!7254)

(assert (=> b!235588 (= e!152987 Unit!7257)))

(declare-fun b!235589 () Bool)

(declare-fun e!152979 () Bool)

(declare-fun e!152985 () Bool)

(assert (=> b!235589 (= e!152979 e!152985)))

(declare-fun res!115531 () Bool)

(declare-fun call!21898 () Bool)

(assert (=> b!235589 (= res!115531 call!21898)))

(assert (=> b!235589 (=> (not res!115531) (not e!152985))))

(declare-fun b!235590 () Bool)

(declare-fun e!152988 () Bool)

(declare-fun apply!211 (ListLongMap!3515 (_ BitVec 64)) V!7913)

(assert (=> b!235590 (= e!152988 (= (apply!211 lt!119051 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4218 thiss!1504)))))

(declare-fun bm!21894 () Bool)

(assert (=> bm!21894 (= call!21900 call!21899)))

(declare-fun b!235591 () Bool)

(declare-fun e!152980 () ListLongMap!3515)

(assert (=> b!235591 (= e!152980 call!21900)))

(declare-fun b!235592 () Bool)

(assert (=> b!235592 (= e!152979 (not call!21898))))

(declare-fun bm!21895 () Bool)

(assert (=> bm!21895 (= call!21895 call!21896)))

(declare-fun b!235593 () Bool)

(declare-fun e!152982 () ListLongMap!3515)

(assert (=> b!235593 (= e!152982 e!152980)))

(assert (=> b!235593 (= c!39238 (and (not (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!235594 () Bool)

(assert (=> b!235594 (= e!152981 call!21895)))

(declare-fun b!235595 () Bool)

(declare-fun res!115529 () Bool)

(assert (=> b!235595 (=> (not res!115529) (not e!152989))))

(assert (=> b!235595 (= res!115529 e!152978)))

(declare-fun c!39235 () Bool)

(assert (=> b!235595 (= c!39235 (not (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!235596 () Bool)

(assert (=> b!235596 (= e!152985 (= (apply!211 lt!119051 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4218 thiss!1504)))))

(declare-fun b!235597 () Bool)

(declare-fun e!152990 () Bool)

(declare-fun get!2842 (ValueCell!2756 V!7913) V!7913)

(declare-fun dynLambda!545 (Int (_ BitVec 64)) V!7913)

(assert (=> b!235597 (= e!152990 (= (apply!211 lt!119051 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000)) (get!2842 (select (arr!5535 (_values!4360 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!545 (defaultEntry!4377 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!235597 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5873 (_values!4360 thiss!1504))))))

(assert (=> b!235597 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5874 (_keys!6452 thiss!1504))))))

(declare-fun b!235585 () Bool)

(assert (=> b!235585 (= e!152978 e!152988)))

(declare-fun res!115525 () Bool)

(assert (=> b!235585 (= res!115525 call!21894)))

(assert (=> b!235585 (=> (not res!115525) (not e!152988))))

(declare-fun d!59151 () Bool)

(assert (=> d!59151 e!152989))

(declare-fun res!115524 () Bool)

(assert (=> d!59151 (=> (not res!115524) (not e!152989))))

(assert (=> d!59151 (= res!115524 (or (bvsge #b00000000000000000000000000000000 (size!5874 (_keys!6452 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5874 (_keys!6452 thiss!1504))))))))

(declare-fun lt!119043 () ListLongMap!3515)

(assert (=> d!59151 (= lt!119051 lt!119043)))

(declare-fun lt!119044 () Unit!7254)

(assert (=> d!59151 (= lt!119044 e!152987)))

(declare-fun c!39234 () Bool)

(declare-fun e!152986 () Bool)

(assert (=> d!59151 (= c!39234 e!152986)))

(declare-fun res!115530 () Bool)

(assert (=> d!59151 (=> (not res!115530) (not e!152986))))

(assert (=> d!59151 (= res!115530 (bvslt #b00000000000000000000000000000000 (size!5874 (_keys!6452 thiss!1504))))))

(assert (=> d!59151 (= lt!119043 e!152982)))

(assert (=> d!59151 (= c!39239 (and (not (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59151 (validMask!0 (mask!10350 thiss!1504))))

(assert (=> d!59151 (= (getCurrentListMap!1282 (_keys!6452 thiss!1504) (_values!4360 thiss!1504) (mask!10350 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)) lt!119051)))

(declare-fun b!235598 () Bool)

(assert (=> b!235598 (= e!152986 (validKeyInArray!0 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235599 () Bool)

(assert (=> b!235599 (= e!152983 e!152990)))

(declare-fun res!115528 () Bool)

(assert (=> b!235599 (=> (not res!115528) (not e!152990))))

(assert (=> b!235599 (= res!115528 (contains!1653 lt!119051 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!235599 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5874 (_keys!6452 thiss!1504))))))

(declare-fun b!235600 () Bool)

(declare-fun lt!119045 () Unit!7254)

(assert (=> b!235600 (= e!152987 lt!119045)))

(declare-fun lt!119034 () ListLongMap!3515)

(assert (=> b!235600 (= lt!119034 (getCurrentListMapNoExtraKeys!527 (_keys!6452 thiss!1504) (_values!4360 thiss!1504) (mask!10350 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)))))

(declare-fun lt!119038 () (_ BitVec 64))

(assert (=> b!235600 (= lt!119038 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119040 () (_ BitVec 64))

(assert (=> b!235600 (= lt!119040 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119054 () Unit!7254)

(declare-fun addStillContains!187 (ListLongMap!3515 (_ BitVec 64) V!7913 (_ BitVec 64)) Unit!7254)

(assert (=> b!235600 (= lt!119054 (addStillContains!187 lt!119034 lt!119038 (zeroValue!4218 thiss!1504) lt!119040))))

(assert (=> b!235600 (contains!1653 (+!644 lt!119034 (tuple2!4613 lt!119038 (zeroValue!4218 thiss!1504))) lt!119040)))

(declare-fun lt!119055 () Unit!7254)

(assert (=> b!235600 (= lt!119055 lt!119054)))

(declare-fun lt!119050 () ListLongMap!3515)

(assert (=> b!235600 (= lt!119050 (getCurrentListMapNoExtraKeys!527 (_keys!6452 thiss!1504) (_values!4360 thiss!1504) (mask!10350 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)))))

(declare-fun lt!119039 () (_ BitVec 64))

(assert (=> b!235600 (= lt!119039 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119052 () (_ BitVec 64))

(assert (=> b!235600 (= lt!119052 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119035 () Unit!7254)

(declare-fun addApplyDifferent!187 (ListLongMap!3515 (_ BitVec 64) V!7913 (_ BitVec 64)) Unit!7254)

(assert (=> b!235600 (= lt!119035 (addApplyDifferent!187 lt!119050 lt!119039 (minValue!4218 thiss!1504) lt!119052))))

(assert (=> b!235600 (= (apply!211 (+!644 lt!119050 (tuple2!4613 lt!119039 (minValue!4218 thiss!1504))) lt!119052) (apply!211 lt!119050 lt!119052))))

(declare-fun lt!119041 () Unit!7254)

(assert (=> b!235600 (= lt!119041 lt!119035)))

(declare-fun lt!119046 () ListLongMap!3515)

(assert (=> b!235600 (= lt!119046 (getCurrentListMapNoExtraKeys!527 (_keys!6452 thiss!1504) (_values!4360 thiss!1504) (mask!10350 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)))))

(declare-fun lt!119037 () (_ BitVec 64))

(assert (=> b!235600 (= lt!119037 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119047 () (_ BitVec 64))

(assert (=> b!235600 (= lt!119047 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119048 () Unit!7254)

(assert (=> b!235600 (= lt!119048 (addApplyDifferent!187 lt!119046 lt!119037 (zeroValue!4218 thiss!1504) lt!119047))))

(assert (=> b!235600 (= (apply!211 (+!644 lt!119046 (tuple2!4613 lt!119037 (zeroValue!4218 thiss!1504))) lt!119047) (apply!211 lt!119046 lt!119047))))

(declare-fun lt!119053 () Unit!7254)

(assert (=> b!235600 (= lt!119053 lt!119048)))

(declare-fun lt!119042 () ListLongMap!3515)

(assert (=> b!235600 (= lt!119042 (getCurrentListMapNoExtraKeys!527 (_keys!6452 thiss!1504) (_values!4360 thiss!1504) (mask!10350 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)))))

(declare-fun lt!119049 () (_ BitVec 64))

(assert (=> b!235600 (= lt!119049 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119036 () (_ BitVec 64))

(assert (=> b!235600 (= lt!119036 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235600 (= lt!119045 (addApplyDifferent!187 lt!119042 lt!119049 (minValue!4218 thiss!1504) lt!119036))))

(assert (=> b!235600 (= (apply!211 (+!644 lt!119042 (tuple2!4613 lt!119049 (minValue!4218 thiss!1504))) lt!119036) (apply!211 lt!119042 lt!119036))))

(declare-fun b!235601 () Bool)

(declare-fun c!39237 () Bool)

(assert (=> b!235601 (= c!39237 (and (not (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!235601 (= e!152980 e!152981)))

(declare-fun b!235602 () Bool)

(assert (=> b!235602 (= e!152989 e!152979)))

(declare-fun c!39236 () Bool)

(assert (=> b!235602 (= c!39236 (not (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!235603 () Bool)

(assert (=> b!235603 (= e!152982 (+!644 call!21899 (tuple2!4613 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4218 thiss!1504))))))

(declare-fun bm!21896 () Bool)

(assert (=> bm!21896 (= call!21896 call!21897)))

(declare-fun bm!21897 () Bool)

(assert (=> bm!21897 (= call!21898 (contains!1653 lt!119051 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59151 c!39239) b!235603))

(assert (= (and d!59151 (not c!39239)) b!235593))

(assert (= (and b!235593 c!39238) b!235591))

(assert (= (and b!235593 (not c!39238)) b!235601))

(assert (= (and b!235601 c!39237) b!235587))

(assert (= (and b!235601 (not c!39237)) b!235594))

(assert (= (or b!235587 b!235594) bm!21895))

(assert (= (or b!235591 bm!21895) bm!21896))

(assert (= (or b!235591 b!235587) bm!21894))

(assert (= (or b!235603 bm!21896) bm!21892))

(assert (= (or b!235603 bm!21894) bm!21893))

(assert (= (and d!59151 res!115530) b!235598))

(assert (= (and d!59151 c!39234) b!235600))

(assert (= (and d!59151 (not c!39234)) b!235588))

(assert (= (and d!59151 res!115524) b!235583))

(assert (= (and b!235583 res!115523) b!235584))

(assert (= (and b!235583 (not res!115526)) b!235599))

(assert (= (and b!235599 res!115528) b!235597))

(assert (= (and b!235583 res!115527) b!235595))

(assert (= (and b!235595 c!39235) b!235585))

(assert (= (and b!235595 (not c!39235)) b!235586))

(assert (= (and b!235585 res!115525) b!235590))

(assert (= (or b!235585 b!235586) bm!21891))

(assert (= (and b!235595 res!115529) b!235602))

(assert (= (and b!235602 c!39236) b!235589))

(assert (= (and b!235602 (not c!39236)) b!235592))

(assert (= (and b!235589 res!115531) b!235596))

(assert (= (or b!235589 b!235592) bm!21897))

(declare-fun b_lambda!7889 () Bool)

(assert (=> (not b_lambda!7889) (not b!235597)))

(declare-fun t!8507 () Bool)

(declare-fun tb!2927 () Bool)

(assert (=> (and b!235451 (= (defaultEntry!4377 thiss!1504) (defaultEntry!4377 thiss!1504)) t!8507) tb!2927))

(declare-fun result!5119 () Bool)

(assert (=> tb!2927 (= result!5119 tp_is_empty!6199)))

(assert (=> b!235597 t!8507))

(declare-fun b_and!13247 () Bool)

(assert (= b_and!13241 (and (=> t!8507 result!5119) b_and!13247)))

(declare-fun m!256111 () Bool)

(assert (=> b!235596 m!256111))

(assert (=> d!59151 m!256053))

(declare-fun m!256113 () Bool)

(assert (=> b!235600 m!256113))

(declare-fun m!256115 () Bool)

(assert (=> b!235600 m!256115))

(declare-fun m!256117 () Bool)

(assert (=> b!235600 m!256117))

(declare-fun m!256119 () Bool)

(assert (=> b!235600 m!256119))

(declare-fun m!256121 () Bool)

(assert (=> b!235600 m!256121))

(declare-fun m!256123 () Bool)

(assert (=> b!235600 m!256123))

(declare-fun m!256125 () Bool)

(assert (=> b!235600 m!256125))

(declare-fun m!256127 () Bool)

(assert (=> b!235600 m!256127))

(declare-fun m!256129 () Bool)

(assert (=> b!235600 m!256129))

(declare-fun m!256131 () Bool)

(assert (=> b!235600 m!256131))

(assert (=> b!235600 m!256125))

(declare-fun m!256133 () Bool)

(assert (=> b!235600 m!256133))

(declare-fun m!256135 () Bool)

(assert (=> b!235600 m!256135))

(declare-fun m!256137 () Bool)

(assert (=> b!235600 m!256137))

(declare-fun m!256139 () Bool)

(assert (=> b!235600 m!256139))

(assert (=> b!235600 m!256121))

(declare-fun m!256141 () Bool)

(assert (=> b!235600 m!256141))

(declare-fun m!256143 () Bool)

(assert (=> b!235600 m!256143))

(assert (=> b!235600 m!256113))

(declare-fun m!256145 () Bool)

(assert (=> b!235600 m!256145))

(assert (=> b!235600 m!256127))

(declare-fun m!256147 () Bool)

(assert (=> bm!21897 m!256147))

(declare-fun m!256149 () Bool)

(assert (=> b!235590 m!256149))

(assert (=> bm!21892 m!256115))

(declare-fun m!256151 () Bool)

(assert (=> bm!21891 m!256151))

(assert (=> b!235598 m!256137))

(assert (=> b!235598 m!256137))

(declare-fun m!256153 () Bool)

(assert (=> b!235598 m!256153))

(declare-fun m!256155 () Bool)

(assert (=> b!235603 m!256155))

(assert (=> b!235584 m!256137))

(assert (=> b!235584 m!256137))

(assert (=> b!235584 m!256153))

(declare-fun m!256157 () Bool)

(assert (=> b!235597 m!256157))

(assert (=> b!235597 m!256137))

(declare-fun m!256159 () Bool)

(assert (=> b!235597 m!256159))

(assert (=> b!235597 m!256157))

(assert (=> b!235597 m!256159))

(declare-fun m!256161 () Bool)

(assert (=> b!235597 m!256161))

(assert (=> b!235597 m!256137))

(declare-fun m!256163 () Bool)

(assert (=> b!235597 m!256163))

(assert (=> b!235599 m!256137))

(assert (=> b!235599 m!256137))

(declare-fun m!256165 () Bool)

(assert (=> b!235599 m!256165))

(declare-fun m!256167 () Bool)

(assert (=> bm!21893 m!256167))

(assert (=> b!235450 d!59151))

(declare-fun b!235616 () Bool)

(declare-fun e!153001 () Bool)

(declare-fun e!153002 () Bool)

(assert (=> b!235616 (= e!153001 e!153002)))

(declare-fun res!115538 () Bool)

(assert (=> b!235616 (=> (not res!115538) (not e!153002))))

(declare-fun e!152999 () Bool)

(assert (=> b!235616 (= res!115538 (not e!152999))))

(declare-fun res!115540 () Bool)

(assert (=> b!235616 (=> (not res!115540) (not e!152999))))

(assert (=> b!235616 (= res!115540 (validKeyInArray!0 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235617 () Bool)

(declare-fun contains!1655 (List!3538 (_ BitVec 64)) Bool)

(assert (=> b!235617 (= e!152999 (contains!1655 Nil!3535 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235618 () Bool)

(declare-fun e!153000 () Bool)

(assert (=> b!235618 (= e!153002 e!153000)))

(declare-fun c!39242 () Bool)

(assert (=> b!235618 (= c!39242 (validKeyInArray!0 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235619 () Bool)

(declare-fun call!21903 () Bool)

(assert (=> b!235619 (= e!153000 call!21903)))

(declare-fun d!59153 () Bool)

(declare-fun res!115539 () Bool)

(assert (=> d!59153 (=> res!115539 e!153001)))

(assert (=> d!59153 (= res!115539 (bvsge #b00000000000000000000000000000000 (size!5874 (_keys!6452 thiss!1504))))))

(assert (=> d!59153 (= (arrayNoDuplicates!0 (_keys!6452 thiss!1504) #b00000000000000000000000000000000 Nil!3535) e!153001)))

(declare-fun bm!21900 () Bool)

(assert (=> bm!21900 (= call!21903 (arrayNoDuplicates!0 (_keys!6452 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39242 (Cons!3534 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000) Nil!3535) Nil!3535)))))

(declare-fun b!235620 () Bool)

(assert (=> b!235620 (= e!153000 call!21903)))

(assert (= (and d!59153 (not res!115539)) b!235616))

(assert (= (and b!235616 res!115540) b!235617))

(assert (= (and b!235616 res!115538) b!235618))

(assert (= (and b!235618 c!39242) b!235619))

(assert (= (and b!235618 (not c!39242)) b!235620))

(assert (= (or b!235619 b!235620) bm!21900))

(assert (=> b!235616 m!256137))

(assert (=> b!235616 m!256137))

(assert (=> b!235616 m!256153))

(assert (=> b!235617 m!256137))

(assert (=> b!235617 m!256137))

(declare-fun m!256169 () Bool)

(assert (=> b!235617 m!256169))

(assert (=> b!235618 m!256137))

(assert (=> b!235618 m!256137))

(assert (=> b!235618 m!256153))

(assert (=> bm!21900 m!256137))

(declare-fun m!256171 () Bool)

(assert (=> bm!21900 m!256171))

(assert (=> b!235453 d!59153))

(declare-fun b!235629 () Bool)

(declare-fun e!153010 () Bool)

(declare-fun call!21906 () Bool)

(assert (=> b!235629 (= e!153010 call!21906)))

(declare-fun b!235630 () Bool)

(declare-fun e!153011 () Bool)

(assert (=> b!235630 (= e!153010 e!153011)))

(declare-fun lt!119063 () (_ BitVec 64))

(assert (=> b!235630 (= lt!119063 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119062 () Unit!7254)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11651 (_ BitVec 64) (_ BitVec 32)) Unit!7254)

(assert (=> b!235630 (= lt!119062 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6452 thiss!1504) lt!119063 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!235630 (arrayContainsKey!0 (_keys!6452 thiss!1504) lt!119063 #b00000000000000000000000000000000)))

(declare-fun lt!119064 () Unit!7254)

(assert (=> b!235630 (= lt!119064 lt!119062)))

(declare-fun res!115546 () Bool)

(assert (=> b!235630 (= res!115546 (= (seekEntryOrOpen!0 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000) (_keys!6452 thiss!1504) (mask!10350 thiss!1504)) (Found!993 #b00000000000000000000000000000000)))))

(assert (=> b!235630 (=> (not res!115546) (not e!153011))))

(declare-fun bm!21903 () Bool)

(assert (=> bm!21903 (= call!21906 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6452 thiss!1504) (mask!10350 thiss!1504)))))

(declare-fun b!235631 () Bool)

(declare-fun e!153009 () Bool)

(assert (=> b!235631 (= e!153009 e!153010)))

(declare-fun c!39245 () Bool)

(assert (=> b!235631 (= c!39245 (validKeyInArray!0 (select (arr!5536 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59155 () Bool)

(declare-fun res!115545 () Bool)

(assert (=> d!59155 (=> res!115545 e!153009)))

(assert (=> d!59155 (= res!115545 (bvsge #b00000000000000000000000000000000 (size!5874 (_keys!6452 thiss!1504))))))

(assert (=> d!59155 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6452 thiss!1504) (mask!10350 thiss!1504)) e!153009)))

(declare-fun b!235632 () Bool)

(assert (=> b!235632 (= e!153011 call!21906)))

(assert (= (and d!59155 (not res!115545)) b!235631))

(assert (= (and b!235631 c!39245) b!235630))

(assert (= (and b!235631 (not c!39245)) b!235629))

(assert (= (and b!235630 res!115546) b!235632))

(assert (= (or b!235632 b!235629) bm!21903))

(assert (=> b!235630 m!256137))

(declare-fun m!256173 () Bool)

(assert (=> b!235630 m!256173))

(declare-fun m!256175 () Bool)

(assert (=> b!235630 m!256175))

(assert (=> b!235630 m!256137))

(declare-fun m!256177 () Bool)

(assert (=> b!235630 m!256177))

(declare-fun m!256179 () Bool)

(assert (=> bm!21903 m!256179))

(assert (=> b!235631 m!256137))

(assert (=> b!235631 m!256137))

(assert (=> b!235631 m!256153))

(assert (=> b!235458 d!59155))

(declare-fun d!59157 () Bool)

(assert (=> d!59157 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!235454 d!59157))

(declare-fun b!235645 () Bool)

(declare-fun e!153018 () SeekEntryResult!993)

(declare-fun e!153020 () SeekEntryResult!993)

(assert (=> b!235645 (= e!153018 e!153020)))

(declare-fun lt!119072 () (_ BitVec 64))

(declare-fun lt!119073 () SeekEntryResult!993)

(assert (=> b!235645 (= lt!119072 (select (arr!5536 (_keys!6452 thiss!1504)) (index!6144 lt!119073)))))

(declare-fun c!39252 () Bool)

(assert (=> b!235645 (= c!39252 (= lt!119072 key!932))))

(declare-fun b!235646 () Bool)

(declare-fun e!153019 () SeekEntryResult!993)

(assert (=> b!235646 (= e!153019 (MissingZero!993 (index!6144 lt!119073)))))

(declare-fun b!235647 () Bool)

(declare-fun c!39253 () Bool)

(assert (=> b!235647 (= c!39253 (= lt!119072 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!235647 (= e!153020 e!153019)))

(declare-fun b!235648 () Bool)

(assert (=> b!235648 (= e!153018 Undefined!993)))

(declare-fun b!235650 () Bool)

(assert (=> b!235650 (= e!153020 (Found!993 (index!6144 lt!119073)))))

(declare-fun b!235649 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11651 (_ BitVec 32)) SeekEntryResult!993)

(assert (=> b!235649 (= e!153019 (seekKeyOrZeroReturnVacant!0 (x!23804 lt!119073) (index!6144 lt!119073) (index!6144 lt!119073) key!932 (_keys!6452 thiss!1504) (mask!10350 thiss!1504)))))

(declare-fun d!59159 () Bool)

(declare-fun lt!119071 () SeekEntryResult!993)

(assert (=> d!59159 (and (or ((_ is Undefined!993) lt!119071) (not ((_ is Found!993) lt!119071)) (and (bvsge (index!6143 lt!119071) #b00000000000000000000000000000000) (bvslt (index!6143 lt!119071) (size!5874 (_keys!6452 thiss!1504))))) (or ((_ is Undefined!993) lt!119071) ((_ is Found!993) lt!119071) (not ((_ is MissingZero!993) lt!119071)) (and (bvsge (index!6142 lt!119071) #b00000000000000000000000000000000) (bvslt (index!6142 lt!119071) (size!5874 (_keys!6452 thiss!1504))))) (or ((_ is Undefined!993) lt!119071) ((_ is Found!993) lt!119071) ((_ is MissingZero!993) lt!119071) (not ((_ is MissingVacant!993) lt!119071)) (and (bvsge (index!6145 lt!119071) #b00000000000000000000000000000000) (bvslt (index!6145 lt!119071) (size!5874 (_keys!6452 thiss!1504))))) (or ((_ is Undefined!993) lt!119071) (ite ((_ is Found!993) lt!119071) (= (select (arr!5536 (_keys!6452 thiss!1504)) (index!6143 lt!119071)) key!932) (ite ((_ is MissingZero!993) lt!119071) (= (select (arr!5536 (_keys!6452 thiss!1504)) (index!6142 lt!119071)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!993) lt!119071) (= (select (arr!5536 (_keys!6452 thiss!1504)) (index!6145 lt!119071)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59159 (= lt!119071 e!153018)))

(declare-fun c!39254 () Bool)

(assert (=> d!59159 (= c!39254 (and ((_ is Intermediate!993) lt!119073) (undefined!1805 lt!119073)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11651 (_ BitVec 32)) SeekEntryResult!993)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59159 (= lt!119073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10350 thiss!1504)) key!932 (_keys!6452 thiss!1504) (mask!10350 thiss!1504)))))

(assert (=> d!59159 (validMask!0 (mask!10350 thiss!1504))))

(assert (=> d!59159 (= (seekEntryOrOpen!0 key!932 (_keys!6452 thiss!1504) (mask!10350 thiss!1504)) lt!119071)))

(assert (= (and d!59159 c!39254) b!235648))

(assert (= (and d!59159 (not c!39254)) b!235645))

(assert (= (and b!235645 c!39252) b!235650))

(assert (= (and b!235645 (not c!39252)) b!235647))

(assert (= (and b!235647 c!39253) b!235646))

(assert (= (and b!235647 (not c!39253)) b!235649))

(declare-fun m!256181 () Bool)

(assert (=> b!235645 m!256181))

(declare-fun m!256183 () Bool)

(assert (=> b!235649 m!256183))

(declare-fun m!256185 () Bool)

(assert (=> d!59159 m!256185))

(declare-fun m!256187 () Bool)

(assert (=> d!59159 m!256187))

(declare-fun m!256189 () Bool)

(assert (=> d!59159 m!256189))

(declare-fun m!256191 () Bool)

(assert (=> d!59159 m!256191))

(assert (=> d!59159 m!256053))

(declare-fun m!256193 () Bool)

(assert (=> d!59159 m!256193))

(assert (=> d!59159 m!256189))

(assert (=> b!235452 d!59159))

(declare-fun d!59161 () Bool)

(declare-fun res!115553 () Bool)

(declare-fun e!153023 () Bool)

(assert (=> d!59161 (=> (not res!115553) (not e!153023))))

(declare-fun simpleValid!234 (LongMapFixedSize!3412) Bool)

(assert (=> d!59161 (= res!115553 (simpleValid!234 thiss!1504))))

(assert (=> d!59161 (= (valid!1358 thiss!1504) e!153023)))

(declare-fun b!235657 () Bool)

(declare-fun res!115554 () Bool)

(assert (=> b!235657 (=> (not res!115554) (not e!153023))))

(declare-fun arrayCountValidKeys!0 (array!11651 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!235657 (= res!115554 (= (arrayCountValidKeys!0 (_keys!6452 thiss!1504) #b00000000000000000000000000000000 (size!5874 (_keys!6452 thiss!1504))) (_size!1755 thiss!1504)))))

(declare-fun b!235658 () Bool)

(declare-fun res!115555 () Bool)

(assert (=> b!235658 (=> (not res!115555) (not e!153023))))

(assert (=> b!235658 (= res!115555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6452 thiss!1504) (mask!10350 thiss!1504)))))

(declare-fun b!235659 () Bool)

(assert (=> b!235659 (= e!153023 (arrayNoDuplicates!0 (_keys!6452 thiss!1504) #b00000000000000000000000000000000 Nil!3535))))

(assert (= (and d!59161 res!115553) b!235657))

(assert (= (and b!235657 res!115554) b!235658))

(assert (= (and b!235658 res!115555) b!235659))

(declare-fun m!256195 () Bool)

(assert (=> d!59161 m!256195))

(declare-fun m!256197 () Bool)

(assert (=> b!235657 m!256197))

(assert (=> b!235658 m!256045))

(assert (=> b!235659 m!256051))

(assert (=> start!22536 d!59161))

(declare-fun d!59163 () Bool)

(assert (=> d!59163 (= (array_inv!3655 (_keys!6452 thiss!1504)) (bvsge (size!5874 (_keys!6452 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235451 d!59163))

(declare-fun d!59165 () Bool)

(assert (=> d!59165 (= (array_inv!3656 (_values!4360 thiss!1504)) (bvsge (size!5873 (_values!4360 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235451 d!59165))

(declare-fun b!235666 () Bool)

(declare-fun e!153029 () Bool)

(assert (=> b!235666 (= e!153029 tp_is_empty!6199)))

(declare-fun mapNonEmpty!10505 () Bool)

(declare-fun mapRes!10505 () Bool)

(declare-fun tp!22196 () Bool)

(assert (=> mapNonEmpty!10505 (= mapRes!10505 (and tp!22196 e!153029))))

(declare-fun mapRest!10505 () (Array (_ BitVec 32) ValueCell!2756))

(declare-fun mapKey!10505 () (_ BitVec 32))

(declare-fun mapValue!10505 () ValueCell!2756)

(assert (=> mapNonEmpty!10505 (= mapRest!10496 (store mapRest!10505 mapKey!10505 mapValue!10505))))

(declare-fun mapIsEmpty!10505 () Bool)

(assert (=> mapIsEmpty!10505 mapRes!10505))

(declare-fun condMapEmpty!10505 () Bool)

(declare-fun mapDefault!10505 () ValueCell!2756)

(assert (=> mapNonEmpty!10496 (= condMapEmpty!10505 (= mapRest!10496 ((as const (Array (_ BitVec 32) ValueCell!2756)) mapDefault!10505)))))

(declare-fun e!153028 () Bool)

(assert (=> mapNonEmpty!10496 (= tp!22180 (and e!153028 mapRes!10505))))

(declare-fun b!235667 () Bool)

(assert (=> b!235667 (= e!153028 tp_is_empty!6199)))

(assert (= (and mapNonEmpty!10496 condMapEmpty!10505) mapIsEmpty!10505))

(assert (= (and mapNonEmpty!10496 (not condMapEmpty!10505)) mapNonEmpty!10505))

(assert (= (and mapNonEmpty!10505 ((_ is ValueCellFull!2756) mapValue!10505)) b!235666))

(assert (= (and mapNonEmpty!10496 ((_ is ValueCellFull!2756) mapDefault!10505)) b!235667))

(declare-fun m!256199 () Bool)

(assert (=> mapNonEmpty!10505 m!256199))

(declare-fun b_lambda!7891 () Bool)

(assert (= b_lambda!7889 (or (and b!235451 b_free!6337) b_lambda!7891)))

(check-sat (not b!235599) (not b!235596) (not b!235617) (not d!59151) tp_is_empty!6199 (not bm!21900) (not b!235616) (not b!235649) (not b!235618) (not bm!21897) (not d!59149) (not b!235659) (not b!235657) (not bm!21893) (not mapNonEmpty!10505) (not b!235598) (not b!235584) (not b!235603) (not b!235600) (not b!235538) (not b!235658) (not b!235590) (not bm!21903) (not d!59161) (not b_lambda!7891) (not d!59159) (not b!235630) (not b!235631) (not bm!21892) (not bm!21891) b_and!13247 (not b!235597) (not b!235540) (not b_next!6337))
(check-sat b_and!13247 (not b_next!6337))
