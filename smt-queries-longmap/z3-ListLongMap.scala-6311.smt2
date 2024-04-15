; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80872 () Bool)

(assert start!80872)

(declare-fun b!947590 () Bool)

(declare-fun b_free!18187 () Bool)

(declare-fun b_next!18187 () Bool)

(assert (=> b!947590 (= b_free!18187 (not b_next!18187))))

(declare-fun tp!63130 () Bool)

(declare-fun b_and!29585 () Bool)

(assert (=> b!947590 (= tp!63130 b_and!29585)))

(declare-fun b!947588 () Bool)

(declare-fun e!533384 () Bool)

(declare-fun e!533382 () Bool)

(declare-fun mapRes!32926 () Bool)

(assert (=> b!947588 (= e!533384 (and e!533382 mapRes!32926))))

(declare-fun condMapEmpty!32926 () Bool)

(declare-datatypes ((V!32559 0))(
  ( (V!32560 (val!10398 Int)) )
))
(declare-datatypes ((ValueCell!9866 0))(
  ( (ValueCellFull!9866 (v!12932 V!32559)) (EmptyCell!9866) )
))
(declare-datatypes ((array!57357 0))(
  ( (array!57358 (arr!27587 (Array (_ BitVec 32) ValueCell!9866)) (size!28062 (_ BitVec 32))) )
))
(declare-datatypes ((array!57359 0))(
  ( (array!57360 (arr!27588 (Array (_ BitVec 32) (_ BitVec 64))) (size!28063 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4882 0))(
  ( (LongMapFixedSize!4883 (defaultEntry!5740 Int) (mask!27481 (_ BitVec 32)) (extraKeys!5472 (_ BitVec 32)) (zeroValue!5576 V!32559) (minValue!5576 V!32559) (_size!2496 (_ BitVec 32)) (_keys!10649 array!57359) (_values!5763 array!57357) (_vacant!2496 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4882)

(declare-fun mapDefault!32926 () ValueCell!9866)

(assert (=> b!947588 (= condMapEmpty!32926 (= (arr!27587 (_values!5763 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9866)) mapDefault!32926)))))

(declare-fun mapIsEmpty!32926 () Bool)

(assert (=> mapIsEmpty!32926 mapRes!32926))

(declare-fun b!947589 () Bool)

(declare-fun e!533381 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947589 (= e!533381 (not (validMask!0 (mask!27481 thiss!1141))))))

(declare-fun e!533385 () Bool)

(declare-fun tp_is_empty!20695 () Bool)

(declare-fun array_inv!21470 (array!57359) Bool)

(declare-fun array_inv!21471 (array!57357) Bool)

(assert (=> b!947590 (= e!533385 (and tp!63130 tp_is_empty!20695 (array_inv!21470 (_keys!10649 thiss!1141)) (array_inv!21471 (_values!5763 thiss!1141)) e!533384))))

(declare-fun b!947591 () Bool)

(declare-fun e!533383 () Bool)

(assert (=> b!947591 (= e!533383 tp_is_empty!20695)))

(declare-fun b!947592 () Bool)

(declare-fun res!635925 () Bool)

(assert (=> b!947592 (=> (not res!635925) (not e!533381))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9120 0))(
  ( (MissingZero!9120 (index!38851 (_ BitVec 32))) (Found!9120 (index!38852 (_ BitVec 32))) (Intermediate!9120 (undefined!9932 Bool) (index!38853 (_ BitVec 32)) (x!81549 (_ BitVec 32))) (Undefined!9120) (MissingVacant!9120 (index!38854 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57359 (_ BitVec 32)) SeekEntryResult!9120)

(assert (=> b!947592 (= res!635925 (not ((_ is Found!9120) (seekEntry!0 key!756 (_keys!10649 thiss!1141) (mask!27481 thiss!1141)))))))

(declare-fun b!947593 () Bool)

(declare-fun res!635928 () Bool)

(assert (=> b!947593 (=> (not res!635928) (not e!533381))))

(declare-datatypes ((tuple2!13562 0))(
  ( (tuple2!13563 (_1!6792 (_ BitVec 64)) (_2!6792 V!32559)) )
))
(declare-datatypes ((List!19315 0))(
  ( (Nil!19312) (Cons!19311 (h!20467 tuple2!13562) (t!27629 List!19315)) )
))
(declare-datatypes ((ListLongMap!12249 0))(
  ( (ListLongMap!12250 (toList!6140 List!19315)) )
))
(declare-fun contains!5165 (ListLongMap!12249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3302 (array!57359 array!57357 (_ BitVec 32) (_ BitVec 32) V!32559 V!32559 (_ BitVec 32) Int) ListLongMap!12249)

(assert (=> b!947593 (= res!635928 (contains!5165 (getCurrentListMap!3302 (_keys!10649 thiss!1141) (_values!5763 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)) key!756))))

(declare-fun res!635926 () Bool)

(assert (=> start!80872 (=> (not res!635926) (not e!533381))))

(declare-fun valid!1862 (LongMapFixedSize!4882) Bool)

(assert (=> start!80872 (= res!635926 (valid!1862 thiss!1141))))

(assert (=> start!80872 e!533381))

(assert (=> start!80872 e!533385))

(assert (=> start!80872 true))

(declare-fun b!947594 () Bool)

(assert (=> b!947594 (= e!533382 tp_is_empty!20695)))

(declare-fun b!947595 () Bool)

(declare-fun res!635927 () Bool)

(assert (=> b!947595 (=> (not res!635927) (not e!533381))))

(assert (=> b!947595 (= res!635927 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32926 () Bool)

(declare-fun tp!63129 () Bool)

(assert (=> mapNonEmpty!32926 (= mapRes!32926 (and tp!63129 e!533383))))

(declare-fun mapValue!32926 () ValueCell!9866)

(declare-fun mapKey!32926 () (_ BitVec 32))

(declare-fun mapRest!32926 () (Array (_ BitVec 32) ValueCell!9866))

(assert (=> mapNonEmpty!32926 (= (arr!27587 (_values!5763 thiss!1141)) (store mapRest!32926 mapKey!32926 mapValue!32926))))

(assert (= (and start!80872 res!635926) b!947595))

(assert (= (and b!947595 res!635927) b!947592))

(assert (= (and b!947592 res!635925) b!947593))

(assert (= (and b!947593 res!635928) b!947589))

(assert (= (and b!947588 condMapEmpty!32926) mapIsEmpty!32926))

(assert (= (and b!947588 (not condMapEmpty!32926)) mapNonEmpty!32926))

(assert (= (and mapNonEmpty!32926 ((_ is ValueCellFull!9866) mapValue!32926)) b!947591))

(assert (= (and b!947588 ((_ is ValueCellFull!9866) mapDefault!32926)) b!947594))

(assert (= b!947590 b!947588))

(assert (= start!80872 b!947590))

(declare-fun m!879937 () Bool)

(assert (=> b!947590 m!879937))

(declare-fun m!879939 () Bool)

(assert (=> b!947590 m!879939))

(declare-fun m!879941 () Bool)

(assert (=> b!947593 m!879941))

(assert (=> b!947593 m!879941))

(declare-fun m!879943 () Bool)

(assert (=> b!947593 m!879943))

(declare-fun m!879945 () Bool)

(assert (=> b!947592 m!879945))

(declare-fun m!879947 () Bool)

(assert (=> start!80872 m!879947))

(declare-fun m!879949 () Bool)

(assert (=> b!947589 m!879949))

(declare-fun m!879951 () Bool)

(assert (=> mapNonEmpty!32926 m!879951))

(check-sat (not start!80872) (not b!947592) (not b!947590) (not b!947589) (not mapNonEmpty!32926) (not b!947593) tp_is_empty!20695 b_and!29585 (not b_next!18187))
(check-sat b_and!29585 (not b_next!18187))
(get-model)

(declare-fun d!114537 () Bool)

(declare-fun res!635959 () Bool)

(declare-fun e!533424 () Bool)

(assert (=> d!114537 (=> (not res!635959) (not e!533424))))

(declare-fun simpleValid!366 (LongMapFixedSize!4882) Bool)

(assert (=> d!114537 (= res!635959 (simpleValid!366 thiss!1141))))

(assert (=> d!114537 (= (valid!1862 thiss!1141) e!533424)))

(declare-fun b!947650 () Bool)

(declare-fun res!635960 () Bool)

(assert (=> b!947650 (=> (not res!635960) (not e!533424))))

(declare-fun arrayCountValidKeys!0 (array!57359 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947650 (= res!635960 (= (arrayCountValidKeys!0 (_keys!10649 thiss!1141) #b00000000000000000000000000000000 (size!28063 (_keys!10649 thiss!1141))) (_size!2496 thiss!1141)))))

(declare-fun b!947651 () Bool)

(declare-fun res!635961 () Bool)

(assert (=> b!947651 (=> (not res!635961) (not e!533424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57359 (_ BitVec 32)) Bool)

(assert (=> b!947651 (= res!635961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10649 thiss!1141) (mask!27481 thiss!1141)))))

(declare-fun b!947652 () Bool)

(declare-datatypes ((List!19316 0))(
  ( (Nil!19313) (Cons!19312 (h!20468 (_ BitVec 64)) (t!27632 List!19316)) )
))
(declare-fun arrayNoDuplicates!0 (array!57359 (_ BitVec 32) List!19316) Bool)

(assert (=> b!947652 (= e!533424 (arrayNoDuplicates!0 (_keys!10649 thiss!1141) #b00000000000000000000000000000000 Nil!19313))))

(assert (= (and d!114537 res!635959) b!947650))

(assert (= (and b!947650 res!635960) b!947651))

(assert (= (and b!947651 res!635961) b!947652))

(declare-fun m!879985 () Bool)

(assert (=> d!114537 m!879985))

(declare-fun m!879987 () Bool)

(assert (=> b!947650 m!879987))

(declare-fun m!879989 () Bool)

(assert (=> b!947651 m!879989))

(declare-fun m!879991 () Bool)

(assert (=> b!947652 m!879991))

(assert (=> start!80872 d!114537))

(declare-fun d!114539 () Bool)

(assert (=> d!114539 (= (array_inv!21470 (_keys!10649 thiss!1141)) (bvsge (size!28063 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947590 d!114539))

(declare-fun d!114541 () Bool)

(assert (=> d!114541 (= (array_inv!21471 (_values!5763 thiss!1141)) (bvsge (size!28062 (_values!5763 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947590 d!114541))

(declare-fun d!114543 () Bool)

(declare-fun lt!426527 () SeekEntryResult!9120)

(assert (=> d!114543 (and (or ((_ is MissingVacant!9120) lt!426527) (not ((_ is Found!9120) lt!426527)) (and (bvsge (index!38852 lt!426527) #b00000000000000000000000000000000) (bvslt (index!38852 lt!426527) (size!28063 (_keys!10649 thiss!1141))))) (not ((_ is MissingVacant!9120) lt!426527)) (or (not ((_ is Found!9120) lt!426527)) (= (select (arr!27588 (_keys!10649 thiss!1141)) (index!38852 lt!426527)) key!756)))))

(declare-fun e!533432 () SeekEntryResult!9120)

(assert (=> d!114543 (= lt!426527 e!533432)))

(declare-fun c!98690 () Bool)

(declare-fun lt!426525 () SeekEntryResult!9120)

(assert (=> d!114543 (= c!98690 (and ((_ is Intermediate!9120) lt!426525) (undefined!9932 lt!426525)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57359 (_ BitVec 32)) SeekEntryResult!9120)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114543 (= lt!426525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27481 thiss!1141)) key!756 (_keys!10649 thiss!1141) (mask!27481 thiss!1141)))))

(assert (=> d!114543 (validMask!0 (mask!27481 thiss!1141))))

(assert (=> d!114543 (= (seekEntry!0 key!756 (_keys!10649 thiss!1141) (mask!27481 thiss!1141)) lt!426527)))

(declare-fun b!947665 () Bool)

(declare-fun e!533431 () SeekEntryResult!9120)

(declare-fun lt!426526 () SeekEntryResult!9120)

(assert (=> b!947665 (= e!533431 (ite ((_ is MissingVacant!9120) lt!426526) (MissingZero!9120 (index!38854 lt!426526)) lt!426526))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57359 (_ BitVec 32)) SeekEntryResult!9120)

(assert (=> b!947665 (= lt!426526 (seekKeyOrZeroReturnVacant!0 (x!81549 lt!426525) (index!38853 lt!426525) (index!38853 lt!426525) key!756 (_keys!10649 thiss!1141) (mask!27481 thiss!1141)))))

(declare-fun b!947666 () Bool)

(assert (=> b!947666 (= e!533432 Undefined!9120)))

(declare-fun b!947667 () Bool)

(assert (=> b!947667 (= e!533431 (MissingZero!9120 (index!38853 lt!426525)))))

(declare-fun b!947668 () Bool)

(declare-fun e!533433 () SeekEntryResult!9120)

(assert (=> b!947668 (= e!533433 (Found!9120 (index!38853 lt!426525)))))

(declare-fun b!947669 () Bool)

(assert (=> b!947669 (= e!533432 e!533433)))

(declare-fun lt!426524 () (_ BitVec 64))

(assert (=> b!947669 (= lt!426524 (select (arr!27588 (_keys!10649 thiss!1141)) (index!38853 lt!426525)))))

(declare-fun c!98691 () Bool)

(assert (=> b!947669 (= c!98691 (= lt!426524 key!756))))

(declare-fun b!947670 () Bool)

(declare-fun c!98692 () Bool)

(assert (=> b!947670 (= c!98692 (= lt!426524 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947670 (= e!533433 e!533431)))

(assert (= (and d!114543 c!98690) b!947666))

(assert (= (and d!114543 (not c!98690)) b!947669))

(assert (= (and b!947669 c!98691) b!947668))

(assert (= (and b!947669 (not c!98691)) b!947670))

(assert (= (and b!947670 c!98692) b!947667))

(assert (= (and b!947670 (not c!98692)) b!947665))

(declare-fun m!879993 () Bool)

(assert (=> d!114543 m!879993))

(declare-fun m!879995 () Bool)

(assert (=> d!114543 m!879995))

(assert (=> d!114543 m!879995))

(declare-fun m!879997 () Bool)

(assert (=> d!114543 m!879997))

(assert (=> d!114543 m!879949))

(declare-fun m!879999 () Bool)

(assert (=> b!947665 m!879999))

(declare-fun m!880001 () Bool)

(assert (=> b!947669 m!880001))

(assert (=> b!947592 d!114543))

(declare-fun d!114545 () Bool)

(declare-fun e!533439 () Bool)

(assert (=> d!114545 e!533439))

(declare-fun res!635964 () Bool)

(assert (=> d!114545 (=> res!635964 e!533439)))

(declare-fun lt!426536 () Bool)

(assert (=> d!114545 (= res!635964 (not lt!426536))))

(declare-fun lt!426539 () Bool)

(assert (=> d!114545 (= lt!426536 lt!426539)))

(declare-datatypes ((Unit!31819 0))(
  ( (Unit!31820) )
))
(declare-fun lt!426538 () Unit!31819)

(declare-fun e!533438 () Unit!31819)

(assert (=> d!114545 (= lt!426538 e!533438)))

(declare-fun c!98695 () Bool)

(assert (=> d!114545 (= c!98695 lt!426539)))

(declare-fun containsKey!456 (List!19315 (_ BitVec 64)) Bool)

(assert (=> d!114545 (= lt!426539 (containsKey!456 (toList!6140 (getCurrentListMap!3302 (_keys!10649 thiss!1141) (_values!5763 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141))) key!756))))

(assert (=> d!114545 (= (contains!5165 (getCurrentListMap!3302 (_keys!10649 thiss!1141) (_values!5763 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)) key!756) lt!426536)))

(declare-fun b!947677 () Bool)

(declare-fun lt!426537 () Unit!31819)

(assert (=> b!947677 (= e!533438 lt!426537)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!351 (List!19315 (_ BitVec 64)) Unit!31819)

(assert (=> b!947677 (= lt!426537 (lemmaContainsKeyImpliesGetValueByKeyDefined!351 (toList!6140 (getCurrentListMap!3302 (_keys!10649 thiss!1141) (_values!5763 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141))) key!756))))

(declare-datatypes ((Option!498 0))(
  ( (Some!497 (v!12935 V!32559)) (None!496) )
))
(declare-fun isDefined!364 (Option!498) Bool)

(declare-fun getValueByKey!492 (List!19315 (_ BitVec 64)) Option!498)

(assert (=> b!947677 (isDefined!364 (getValueByKey!492 (toList!6140 (getCurrentListMap!3302 (_keys!10649 thiss!1141) (_values!5763 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141))) key!756))))

(declare-fun b!947678 () Bool)

(declare-fun Unit!31821 () Unit!31819)

(assert (=> b!947678 (= e!533438 Unit!31821)))

(declare-fun b!947679 () Bool)

(assert (=> b!947679 (= e!533439 (isDefined!364 (getValueByKey!492 (toList!6140 (getCurrentListMap!3302 (_keys!10649 thiss!1141) (_values!5763 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141))) key!756)))))

(assert (= (and d!114545 c!98695) b!947677))

(assert (= (and d!114545 (not c!98695)) b!947678))

(assert (= (and d!114545 (not res!635964)) b!947679))

(declare-fun m!880003 () Bool)

(assert (=> d!114545 m!880003))

(declare-fun m!880005 () Bool)

(assert (=> b!947677 m!880005))

(declare-fun m!880007 () Bool)

(assert (=> b!947677 m!880007))

(assert (=> b!947677 m!880007))

(declare-fun m!880009 () Bool)

(assert (=> b!947677 m!880009))

(assert (=> b!947679 m!880007))

(assert (=> b!947679 m!880007))

(assert (=> b!947679 m!880009))

(assert (=> b!947593 d!114545))

(declare-fun b!947722 () Bool)

(declare-fun e!533467 () Unit!31819)

(declare-fun lt!426595 () Unit!31819)

(assert (=> b!947722 (= e!533467 lt!426595)))

(declare-fun lt!426587 () ListLongMap!12249)

(declare-fun getCurrentListMapNoExtraKeys!3345 (array!57359 array!57357 (_ BitVec 32) (_ BitVec 32) V!32559 V!32559 (_ BitVec 32) Int) ListLongMap!12249)

(assert (=> b!947722 (= lt!426587 (getCurrentListMapNoExtraKeys!3345 (_keys!10649 thiss!1141) (_values!5763 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)))))

(declare-fun lt!426603 () (_ BitVec 64))

(assert (=> b!947722 (= lt!426603 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426591 () (_ BitVec 64))

(assert (=> b!947722 (= lt!426591 (select (arr!27588 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426590 () Unit!31819)

(declare-fun addStillContains!562 (ListLongMap!12249 (_ BitVec 64) V!32559 (_ BitVec 64)) Unit!31819)

(assert (=> b!947722 (= lt!426590 (addStillContains!562 lt!426587 lt!426603 (zeroValue!5576 thiss!1141) lt!426591))))

(declare-fun +!2873 (ListLongMap!12249 tuple2!13562) ListLongMap!12249)

(assert (=> b!947722 (contains!5165 (+!2873 lt!426587 (tuple2!13563 lt!426603 (zeroValue!5576 thiss!1141))) lt!426591)))

(declare-fun lt!426593 () Unit!31819)

(assert (=> b!947722 (= lt!426593 lt!426590)))

(declare-fun lt!426589 () ListLongMap!12249)

(assert (=> b!947722 (= lt!426589 (getCurrentListMapNoExtraKeys!3345 (_keys!10649 thiss!1141) (_values!5763 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)))))

(declare-fun lt!426598 () (_ BitVec 64))

(assert (=> b!947722 (= lt!426598 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426605 () (_ BitVec 64))

(assert (=> b!947722 (= lt!426605 (select (arr!27588 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426602 () Unit!31819)

(declare-fun addApplyDifferent!442 (ListLongMap!12249 (_ BitVec 64) V!32559 (_ BitVec 64)) Unit!31819)

(assert (=> b!947722 (= lt!426602 (addApplyDifferent!442 lt!426589 lt!426598 (minValue!5576 thiss!1141) lt!426605))))

(declare-fun apply!863 (ListLongMap!12249 (_ BitVec 64)) V!32559)

(assert (=> b!947722 (= (apply!863 (+!2873 lt!426589 (tuple2!13563 lt!426598 (minValue!5576 thiss!1141))) lt!426605) (apply!863 lt!426589 lt!426605))))

(declare-fun lt!426600 () Unit!31819)

(assert (=> b!947722 (= lt!426600 lt!426602)))

(declare-fun lt!426597 () ListLongMap!12249)

(assert (=> b!947722 (= lt!426597 (getCurrentListMapNoExtraKeys!3345 (_keys!10649 thiss!1141) (_values!5763 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)))))

(declare-fun lt!426601 () (_ BitVec 64))

(assert (=> b!947722 (= lt!426601 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426596 () (_ BitVec 64))

(assert (=> b!947722 (= lt!426596 (select (arr!27588 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426599 () Unit!31819)

(assert (=> b!947722 (= lt!426599 (addApplyDifferent!442 lt!426597 lt!426601 (zeroValue!5576 thiss!1141) lt!426596))))

(assert (=> b!947722 (= (apply!863 (+!2873 lt!426597 (tuple2!13563 lt!426601 (zeroValue!5576 thiss!1141))) lt!426596) (apply!863 lt!426597 lt!426596))))

(declare-fun lt!426604 () Unit!31819)

(assert (=> b!947722 (= lt!426604 lt!426599)))

(declare-fun lt!426594 () ListLongMap!12249)

(assert (=> b!947722 (= lt!426594 (getCurrentListMapNoExtraKeys!3345 (_keys!10649 thiss!1141) (_values!5763 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)))))

(declare-fun lt!426588 () (_ BitVec 64))

(assert (=> b!947722 (= lt!426588 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426585 () (_ BitVec 64))

(assert (=> b!947722 (= lt!426585 (select (arr!27588 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947722 (= lt!426595 (addApplyDifferent!442 lt!426594 lt!426588 (minValue!5576 thiss!1141) lt!426585))))

(assert (=> b!947722 (= (apply!863 (+!2873 lt!426594 (tuple2!13563 lt!426588 (minValue!5576 thiss!1141))) lt!426585) (apply!863 lt!426594 lt!426585))))

(declare-fun b!947723 () Bool)

(declare-fun e!533471 () Bool)

(declare-fun e!533473 () Bool)

(assert (=> b!947723 (= e!533471 e!533473)))

(declare-fun res!635988 () Bool)

(assert (=> b!947723 (=> (not res!635988) (not e!533473))))

(declare-fun lt!426592 () ListLongMap!12249)

(assert (=> b!947723 (= res!635988 (contains!5165 lt!426592 (select (arr!27588 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!947723 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28063 (_keys!10649 thiss!1141))))))

(declare-fun b!947724 () Bool)

(declare-fun e!533470 () Bool)

(declare-fun call!41135 () Bool)

(assert (=> b!947724 (= e!533470 (not call!41135))))

(declare-fun b!947725 () Bool)

(declare-fun Unit!31822 () Unit!31819)

(assert (=> b!947725 (= e!533467 Unit!31822)))

(declare-fun b!947726 () Bool)

(declare-fun e!533477 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947726 (= e!533477 (validKeyInArray!0 (select (arr!27588 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114547 () Bool)

(declare-fun e!533469 () Bool)

(assert (=> d!114547 e!533469))

(declare-fun res!635983 () Bool)

(assert (=> d!114547 (=> (not res!635983) (not e!533469))))

(assert (=> d!114547 (= res!635983 (or (bvsge #b00000000000000000000000000000000 (size!28063 (_keys!10649 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28063 (_keys!10649 thiss!1141))))))))

(declare-fun lt!426586 () ListLongMap!12249)

(assert (=> d!114547 (= lt!426592 lt!426586)))

(declare-fun lt!426584 () Unit!31819)

(assert (=> d!114547 (= lt!426584 e!533467)))

(declare-fun c!98710 () Bool)

(assert (=> d!114547 (= c!98710 e!533477)))

(declare-fun res!635990 () Bool)

(assert (=> d!114547 (=> (not res!635990) (not e!533477))))

(assert (=> d!114547 (= res!635990 (bvslt #b00000000000000000000000000000000 (size!28063 (_keys!10649 thiss!1141))))))

(declare-fun e!533478 () ListLongMap!12249)

(assert (=> d!114547 (= lt!426586 e!533478)))

(declare-fun c!98711 () Bool)

(assert (=> d!114547 (= c!98711 (and (not (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114547 (validMask!0 (mask!27481 thiss!1141))))

(assert (=> d!114547 (= (getCurrentListMap!3302 (_keys!10649 thiss!1141) (_values!5763 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)) lt!426592)))

(declare-fun bm!41131 () Bool)

(declare-fun call!41137 () ListLongMap!12249)

(declare-fun call!41136 () ListLongMap!12249)

(assert (=> bm!41131 (= call!41137 call!41136)))

(declare-fun bm!41132 () Bool)

(declare-fun call!41140 () ListLongMap!12249)

(assert (=> bm!41132 (= call!41136 call!41140)))

(declare-fun b!947727 () Bool)

(declare-fun e!533474 () ListLongMap!12249)

(declare-fun call!41134 () ListLongMap!12249)

(assert (=> b!947727 (= e!533474 call!41134)))

(declare-fun b!947728 () Bool)

(declare-fun e!533466 () Bool)

(assert (=> b!947728 (= e!533466 (= (apply!863 lt!426592 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5576 thiss!1141)))))

(declare-fun b!947729 () Bool)

(declare-fun res!635985 () Bool)

(assert (=> b!947729 (=> (not res!635985) (not e!533469))))

(assert (=> b!947729 (= res!635985 e!533471)))

(declare-fun res!635984 () Bool)

(assert (=> b!947729 (=> res!635984 e!533471)))

(declare-fun e!533476 () Bool)

(assert (=> b!947729 (= res!635984 (not e!533476))))

(declare-fun res!635986 () Bool)

(assert (=> b!947729 (=> (not res!635986) (not e!533476))))

(assert (=> b!947729 (= res!635986 (bvslt #b00000000000000000000000000000000 (size!28063 (_keys!10649 thiss!1141))))))

(declare-fun bm!41133 () Bool)

(assert (=> bm!41133 (= call!41135 (contains!5165 lt!426592 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947730 () Bool)

(declare-fun e!533472 () ListLongMap!12249)

(assert (=> b!947730 (= e!533472 call!41134)))

(declare-fun b!947731 () Bool)

(declare-fun res!635989 () Bool)

(assert (=> b!947731 (=> (not res!635989) (not e!533469))))

(declare-fun e!533475 () Bool)

(assert (=> b!947731 (= res!635989 e!533475)))

(declare-fun c!98708 () Bool)

(assert (=> b!947731 (= c!98708 (not (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!947732 () Bool)

(declare-fun e!533468 () Bool)

(assert (=> b!947732 (= e!533468 (= (apply!863 lt!426592 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5576 thiss!1141)))))

(declare-fun b!947733 () Bool)

(assert (=> b!947733 (= e!533476 (validKeyInArray!0 (select (arr!27588 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947734 () Bool)

(assert (=> b!947734 (= e!533469 e!533470)))

(declare-fun c!98713 () Bool)

(assert (=> b!947734 (= c!98713 (not (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41134 () Bool)

(declare-fun call!41139 () Bool)

(assert (=> bm!41134 (= call!41139 (contains!5165 lt!426592 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947735 () Bool)

(assert (=> b!947735 (= e!533475 e!533468)))

(declare-fun res!635991 () Bool)

(assert (=> b!947735 (= res!635991 call!41139)))

(assert (=> b!947735 (=> (not res!635991) (not e!533468))))

(declare-fun bm!41135 () Bool)

(assert (=> bm!41135 (= call!41140 (getCurrentListMapNoExtraKeys!3345 (_keys!10649 thiss!1141) (_values!5763 thiss!1141) (mask!27481 thiss!1141) (extraKeys!5472 thiss!1141) (zeroValue!5576 thiss!1141) (minValue!5576 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5740 thiss!1141)))))

(declare-fun b!947736 () Bool)

(declare-fun c!98709 () Bool)

(assert (=> b!947736 (= c!98709 (and (not (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!947736 (= e!533472 e!533474)))

(declare-fun b!947737 () Bool)

(assert (=> b!947737 (= e!533470 e!533466)))

(declare-fun res!635987 () Bool)

(assert (=> b!947737 (= res!635987 call!41135)))

(assert (=> b!947737 (=> (not res!635987) (not e!533466))))

(declare-fun b!947738 () Bool)

(declare-fun call!41138 () ListLongMap!12249)

(assert (=> b!947738 (= e!533478 (+!2873 call!41138 (tuple2!13563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5576 thiss!1141))))))

(declare-fun b!947739 () Bool)

(assert (=> b!947739 (= e!533474 call!41137)))

(declare-fun bm!41136 () Bool)

(assert (=> bm!41136 (= call!41134 call!41138)))

(declare-fun b!947740 () Bool)

(assert (=> b!947740 (= e!533475 (not call!41139))))

(declare-fun b!947741 () Bool)

(declare-fun get!14488 (ValueCell!9866 V!32559) V!32559)

(declare-fun dynLambda!1629 (Int (_ BitVec 64)) V!32559)

(assert (=> b!947741 (= e!533473 (= (apply!863 lt!426592 (select (arr!27588 (_keys!10649 thiss!1141)) #b00000000000000000000000000000000)) (get!14488 (select (arr!27587 (_values!5763 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1629 (defaultEntry!5740 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!947741 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28062 (_values!5763 thiss!1141))))))

(assert (=> b!947741 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28063 (_keys!10649 thiss!1141))))))

(declare-fun c!98712 () Bool)

(declare-fun bm!41137 () Bool)

(assert (=> bm!41137 (= call!41138 (+!2873 (ite c!98711 call!41140 (ite c!98712 call!41136 call!41137)) (ite (or c!98711 c!98712) (tuple2!13563 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5576 thiss!1141)) (tuple2!13563 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5576 thiss!1141)))))))

(declare-fun b!947742 () Bool)

(assert (=> b!947742 (= e!533478 e!533472)))

(assert (=> b!947742 (= c!98712 (and (not (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5472 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!114547 c!98711) b!947738))

(assert (= (and d!114547 (not c!98711)) b!947742))

(assert (= (and b!947742 c!98712) b!947730))

(assert (= (and b!947742 (not c!98712)) b!947736))

(assert (= (and b!947736 c!98709) b!947727))

(assert (= (and b!947736 (not c!98709)) b!947739))

(assert (= (or b!947727 b!947739) bm!41131))

(assert (= (or b!947730 bm!41131) bm!41132))

(assert (= (or b!947730 b!947727) bm!41136))

(assert (= (or b!947738 bm!41132) bm!41135))

(assert (= (or b!947738 bm!41136) bm!41137))

(assert (= (and d!114547 res!635990) b!947726))

(assert (= (and d!114547 c!98710) b!947722))

(assert (= (and d!114547 (not c!98710)) b!947725))

(assert (= (and d!114547 res!635983) b!947729))

(assert (= (and b!947729 res!635986) b!947733))

(assert (= (and b!947729 (not res!635984)) b!947723))

(assert (= (and b!947723 res!635988) b!947741))

(assert (= (and b!947729 res!635985) b!947731))

(assert (= (and b!947731 c!98708) b!947735))

(assert (= (and b!947731 (not c!98708)) b!947740))

(assert (= (and b!947735 res!635991) b!947732))

(assert (= (or b!947735 b!947740) bm!41134))

(assert (= (and b!947731 res!635989) b!947734))

(assert (= (and b!947734 c!98713) b!947737))

(assert (= (and b!947734 (not c!98713)) b!947724))

(assert (= (and b!947737 res!635987) b!947728))

(assert (= (or b!947737 b!947724) bm!41133))

(declare-fun b_lambda!14285 () Bool)

(assert (=> (not b_lambda!14285) (not b!947741)))

(declare-fun t!27631 () Bool)

(declare-fun tb!6167 () Bool)

(assert (=> (and b!947590 (= (defaultEntry!5740 thiss!1141) (defaultEntry!5740 thiss!1141)) t!27631) tb!6167))

(declare-fun result!12239 () Bool)

(assert (=> tb!6167 (= result!12239 tp_is_empty!20695)))

(assert (=> b!947741 t!27631))

(declare-fun b_and!29591 () Bool)

(assert (= b_and!29585 (and (=> t!27631 result!12239) b_and!29591)))

(declare-fun m!880011 () Bool)

(assert (=> b!947741 m!880011))

(assert (=> b!947741 m!880011))

(declare-fun m!880013 () Bool)

(assert (=> b!947741 m!880013))

(declare-fun m!880015 () Bool)

(assert (=> b!947741 m!880015))

(declare-fun m!880017 () Bool)

(assert (=> b!947741 m!880017))

(assert (=> b!947741 m!880017))

(assert (=> b!947741 m!880015))

(declare-fun m!880019 () Bool)

(assert (=> b!947741 m!880019))

(declare-fun m!880021 () Bool)

(assert (=> bm!41135 m!880021))

(declare-fun m!880023 () Bool)

(assert (=> b!947738 m!880023))

(declare-fun m!880025 () Bool)

(assert (=> b!947722 m!880025))

(declare-fun m!880027 () Bool)

(assert (=> b!947722 m!880027))

(declare-fun m!880029 () Bool)

(assert (=> b!947722 m!880029))

(declare-fun m!880031 () Bool)

(assert (=> b!947722 m!880031))

(assert (=> b!947722 m!880011))

(declare-fun m!880033 () Bool)

(assert (=> b!947722 m!880033))

(declare-fun m!880035 () Bool)

(assert (=> b!947722 m!880035))

(assert (=> b!947722 m!880033))

(declare-fun m!880037 () Bool)

(assert (=> b!947722 m!880037))

(assert (=> b!947722 m!880025))

(declare-fun m!880039 () Bool)

(assert (=> b!947722 m!880039))

(assert (=> b!947722 m!880027))

(declare-fun m!880041 () Bool)

(assert (=> b!947722 m!880041))

(declare-fun m!880043 () Bool)

(assert (=> b!947722 m!880043))

(declare-fun m!880045 () Bool)

(assert (=> b!947722 m!880045))

(declare-fun m!880047 () Bool)

(assert (=> b!947722 m!880047))

(assert (=> b!947722 m!880021))

(assert (=> b!947722 m!880047))

(declare-fun m!880049 () Bool)

(assert (=> b!947722 m!880049))

(declare-fun m!880051 () Bool)

(assert (=> b!947722 m!880051))

(declare-fun m!880053 () Bool)

(assert (=> b!947722 m!880053))

(assert (=> b!947726 m!880011))

(assert (=> b!947726 m!880011))

(declare-fun m!880055 () Bool)

(assert (=> b!947726 m!880055))

(declare-fun m!880057 () Bool)

(assert (=> b!947732 m!880057))

(declare-fun m!880059 () Bool)

(assert (=> bm!41137 m!880059))

(declare-fun m!880061 () Bool)

(assert (=> b!947728 m!880061))

(assert (=> d!114547 m!879949))

(declare-fun m!880063 () Bool)

(assert (=> bm!41133 m!880063))

(assert (=> b!947723 m!880011))

(assert (=> b!947723 m!880011))

(declare-fun m!880065 () Bool)

(assert (=> b!947723 m!880065))

(assert (=> b!947733 m!880011))

(assert (=> b!947733 m!880011))

(assert (=> b!947733 m!880055))

(declare-fun m!880067 () Bool)

(assert (=> bm!41134 m!880067))

(assert (=> b!947593 d!114547))

(declare-fun d!114549 () Bool)

(assert (=> d!114549 (= (validMask!0 (mask!27481 thiss!1141)) (and (or (= (mask!27481 thiss!1141) #b00000000000000000000000000000111) (= (mask!27481 thiss!1141) #b00000000000000000000000000001111) (= (mask!27481 thiss!1141) #b00000000000000000000000000011111) (= (mask!27481 thiss!1141) #b00000000000000000000000000111111) (= (mask!27481 thiss!1141) #b00000000000000000000000001111111) (= (mask!27481 thiss!1141) #b00000000000000000000000011111111) (= (mask!27481 thiss!1141) #b00000000000000000000000111111111) (= (mask!27481 thiss!1141) #b00000000000000000000001111111111) (= (mask!27481 thiss!1141) #b00000000000000000000011111111111) (= (mask!27481 thiss!1141) #b00000000000000000000111111111111) (= (mask!27481 thiss!1141) #b00000000000000000001111111111111) (= (mask!27481 thiss!1141) #b00000000000000000011111111111111) (= (mask!27481 thiss!1141) #b00000000000000000111111111111111) (= (mask!27481 thiss!1141) #b00000000000000001111111111111111) (= (mask!27481 thiss!1141) #b00000000000000011111111111111111) (= (mask!27481 thiss!1141) #b00000000000000111111111111111111) (= (mask!27481 thiss!1141) #b00000000000001111111111111111111) (= (mask!27481 thiss!1141) #b00000000000011111111111111111111) (= (mask!27481 thiss!1141) #b00000000000111111111111111111111) (= (mask!27481 thiss!1141) #b00000000001111111111111111111111) (= (mask!27481 thiss!1141) #b00000000011111111111111111111111) (= (mask!27481 thiss!1141) #b00000000111111111111111111111111) (= (mask!27481 thiss!1141) #b00000001111111111111111111111111) (= (mask!27481 thiss!1141) #b00000011111111111111111111111111) (= (mask!27481 thiss!1141) #b00000111111111111111111111111111) (= (mask!27481 thiss!1141) #b00001111111111111111111111111111) (= (mask!27481 thiss!1141) #b00011111111111111111111111111111) (= (mask!27481 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27481 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947589 d!114549))

(declare-fun mapIsEmpty!32935 () Bool)

(declare-fun mapRes!32935 () Bool)

(assert (=> mapIsEmpty!32935 mapRes!32935))

(declare-fun b!947751 () Bool)

(declare-fun e!533483 () Bool)

(assert (=> b!947751 (= e!533483 tp_is_empty!20695)))

(declare-fun b!947752 () Bool)

(declare-fun e!533484 () Bool)

(assert (=> b!947752 (= e!533484 tp_is_empty!20695)))

(declare-fun mapNonEmpty!32935 () Bool)

(declare-fun tp!63145 () Bool)

(assert (=> mapNonEmpty!32935 (= mapRes!32935 (and tp!63145 e!533483))))

(declare-fun mapKey!32935 () (_ BitVec 32))

(declare-fun mapRest!32935 () (Array (_ BitVec 32) ValueCell!9866))

(declare-fun mapValue!32935 () ValueCell!9866)

(assert (=> mapNonEmpty!32935 (= mapRest!32926 (store mapRest!32935 mapKey!32935 mapValue!32935))))

(declare-fun condMapEmpty!32935 () Bool)

(declare-fun mapDefault!32935 () ValueCell!9866)

(assert (=> mapNonEmpty!32926 (= condMapEmpty!32935 (= mapRest!32926 ((as const (Array (_ BitVec 32) ValueCell!9866)) mapDefault!32935)))))

(assert (=> mapNonEmpty!32926 (= tp!63129 (and e!533484 mapRes!32935))))

(assert (= (and mapNonEmpty!32926 condMapEmpty!32935) mapIsEmpty!32935))

(assert (= (and mapNonEmpty!32926 (not condMapEmpty!32935)) mapNonEmpty!32935))

(assert (= (and mapNonEmpty!32935 ((_ is ValueCellFull!9866) mapValue!32935)) b!947751))

(assert (= (and mapNonEmpty!32926 ((_ is ValueCellFull!9866) mapDefault!32935)) b!947752))

(declare-fun m!880069 () Bool)

(assert (=> mapNonEmpty!32935 m!880069))

(declare-fun b_lambda!14287 () Bool)

(assert (= b_lambda!14285 (or (and b!947590 b_free!18187) b_lambda!14287)))

(check-sat (not b!947665) tp_is_empty!20695 (not b!947652) (not b_lambda!14287) (not bm!41135) (not bm!41133) (not b!947728) (not bm!41137) (not bm!41134) (not d!114547) (not d!114537) (not b!947677) (not b!947741) (not d!114545) (not b!947650) (not b!947679) (not b!947722) (not b!947732) (not b!947738) (not b_next!18187) (not b!947723) (not b!947651) (not d!114543) (not b!947726) (not mapNonEmpty!32935) b_and!29591 (not b!947733))
(check-sat b_and!29591 (not b_next!18187))
