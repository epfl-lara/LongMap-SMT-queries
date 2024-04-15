; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22296 () Bool)

(assert start!22296)

(declare-fun b!233557 () Bool)

(declare-fun b_free!6295 () Bool)

(declare-fun b_next!6295 () Bool)

(assert (=> b!233557 (= b_free!6295 (not b_next!6295))))

(declare-fun tp!22034 () Bool)

(declare-fun b_and!13175 () Bool)

(assert (=> b!233557 (= tp!22034 b_and!13175)))

(declare-fun b!233549 () Bool)

(declare-fun e!151702 () Bool)

(declare-fun e!151700 () Bool)

(assert (=> b!233549 (= e!151702 e!151700)))

(declare-fun res!114576 () Bool)

(assert (=> b!233549 (=> (not res!114576) (not e!151700))))

(declare-datatypes ((SeekEntryResult!982 0))(
  ( (MissingZero!982 (index!6098 (_ BitVec 32))) (Found!982 (index!6099 (_ BitVec 32))) (Intermediate!982 (undefined!1794 Bool) (index!6100 (_ BitVec 32)) (x!23653 (_ BitVec 32))) (Undefined!982) (MissingVacant!982 (index!6101 (_ BitVec 32))) )
))
(declare-fun lt!118029 () SeekEntryResult!982)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!233549 (= res!114576 (or (= lt!118029 (MissingZero!982 index!297)) (= lt!118029 (MissingVacant!982 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7857 0))(
  ( (V!7858 (val!3123 Int)) )
))
(declare-datatypes ((ValueCell!2735 0))(
  ( (ValueCellFull!2735 (v!5139 V!7857)) (EmptyCell!2735) )
))
(declare-datatypes ((array!11553 0))(
  ( (array!11554 (arr!5493 (Array (_ BitVec 32) ValueCell!2735)) (size!5828 (_ BitVec 32))) )
))
(declare-datatypes ((array!11555 0))(
  ( (array!11556 (arr!5494 (Array (_ BitVec 32) (_ BitVec 64))) (size!5829 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3370 0))(
  ( (LongMapFixedSize!3371 (defaultEntry!4347 Int) (mask!10280 (_ BitVec 32)) (extraKeys!4084 (_ BitVec 32)) (zeroValue!4188 V!7857) (minValue!4188 V!7857) (_size!1734 (_ BitVec 32)) (_keys!6405 array!11555) (_values!4330 array!11553) (_vacant!1734 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3370)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11555 (_ BitVec 32)) SeekEntryResult!982)

(assert (=> b!233549 (= lt!118029 (seekEntryOrOpen!0 key!932 (_keys!6405 thiss!1504) (mask!10280 thiss!1504)))))

(declare-fun b!233550 () Bool)

(declare-fun res!114579 () Bool)

(assert (=> b!233550 (=> (not res!114579) (not e!151702))))

(assert (=> b!233550 (= res!114579 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233551 () Bool)

(declare-fun e!151701 () Bool)

(declare-fun tp_is_empty!6157 () Bool)

(assert (=> b!233551 (= e!151701 tp_is_empty!6157)))

(declare-fun mapNonEmpty!10412 () Bool)

(declare-fun mapRes!10412 () Bool)

(declare-fun tp!22033 () Bool)

(assert (=> mapNonEmpty!10412 (= mapRes!10412 (and tp!22033 e!151701))))

(declare-fun mapValue!10412 () ValueCell!2735)

(declare-fun mapKey!10412 () (_ BitVec 32))

(declare-fun mapRest!10412 () (Array (_ BitVec 32) ValueCell!2735))

(assert (=> mapNonEmpty!10412 (= (arr!5493 (_values!4330 thiss!1504)) (store mapRest!10412 mapKey!10412 mapValue!10412))))

(declare-fun b!233552 () Bool)

(assert (=> b!233552 (= e!151700 (and (= (size!5828 (_values!4330 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10280 thiss!1504))) (not (= (size!5829 (_keys!6405 thiss!1504)) (size!5828 (_values!4330 thiss!1504))))))))

(declare-fun b!233553 () Bool)

(declare-fun res!114578 () Bool)

(assert (=> b!233553 (=> (not res!114578) (not e!151700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!233553 (= res!114578 (validMask!0 (mask!10280 thiss!1504)))))

(declare-fun b!233555 () Bool)

(declare-fun e!151703 () Bool)

(declare-fun e!151705 () Bool)

(assert (=> b!233555 (= e!151703 (and e!151705 mapRes!10412))))

(declare-fun condMapEmpty!10412 () Bool)

(declare-fun mapDefault!10412 () ValueCell!2735)

(assert (=> b!233555 (= condMapEmpty!10412 (= (arr!5493 (_values!4330 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2735)) mapDefault!10412)))))

(declare-fun mapIsEmpty!10412 () Bool)

(assert (=> mapIsEmpty!10412 mapRes!10412))

(declare-fun b!233556 () Bool)

(assert (=> b!233556 (= e!151705 tp_is_empty!6157)))

(declare-fun e!151706 () Bool)

(declare-fun array_inv!3627 (array!11555) Bool)

(declare-fun array_inv!3628 (array!11553) Bool)

(assert (=> b!233557 (= e!151706 (and tp!22034 tp_is_empty!6157 (array_inv!3627 (_keys!6405 thiss!1504)) (array_inv!3628 (_values!4330 thiss!1504)) e!151703))))

(declare-fun b!233554 () Bool)

(declare-fun res!114580 () Bool)

(assert (=> b!233554 (=> (not res!114580) (not e!151700))))

(declare-datatypes ((tuple2!4588 0))(
  ( (tuple2!4589 (_1!2305 (_ BitVec 64)) (_2!2305 V!7857)) )
))
(declare-datatypes ((List!3517 0))(
  ( (Nil!3514) (Cons!3513 (h!4162 tuple2!4588) (t!8471 List!3517)) )
))
(declare-datatypes ((ListLongMap!3491 0))(
  ( (ListLongMap!3492 (toList!1761 List!3517)) )
))
(declare-fun contains!1634 (ListLongMap!3491 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1270 (array!11555 array!11553 (_ BitVec 32) (_ BitVec 32) V!7857 V!7857 (_ BitVec 32) Int) ListLongMap!3491)

(assert (=> b!233554 (= res!114580 (contains!1634 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)) key!932))))

(declare-fun res!114577 () Bool)

(assert (=> start!22296 (=> (not res!114577) (not e!151702))))

(declare-fun valid!1348 (LongMapFixedSize!3370) Bool)

(assert (=> start!22296 (= res!114577 (valid!1348 thiss!1504))))

(assert (=> start!22296 e!151702))

(assert (=> start!22296 e!151706))

(assert (=> start!22296 true))

(assert (= (and start!22296 res!114577) b!233550))

(assert (= (and b!233550 res!114579) b!233549))

(assert (= (and b!233549 res!114576) b!233554))

(assert (= (and b!233554 res!114580) b!233553))

(assert (= (and b!233553 res!114578) b!233552))

(assert (= (and b!233555 condMapEmpty!10412) mapIsEmpty!10412))

(assert (= (and b!233555 (not condMapEmpty!10412)) mapNonEmpty!10412))

(get-info :version)

(assert (= (and mapNonEmpty!10412 ((_ is ValueCellFull!2735) mapValue!10412)) b!233551))

(assert (= (and b!233555 ((_ is ValueCellFull!2735) mapDefault!10412)) b!233556))

(assert (= b!233557 b!233555))

(assert (= start!22296 b!233557))

(declare-fun m!254463 () Bool)

(assert (=> b!233554 m!254463))

(assert (=> b!233554 m!254463))

(declare-fun m!254465 () Bool)

(assert (=> b!233554 m!254465))

(declare-fun m!254467 () Bool)

(assert (=> start!22296 m!254467))

(declare-fun m!254469 () Bool)

(assert (=> b!233549 m!254469))

(declare-fun m!254471 () Bool)

(assert (=> mapNonEmpty!10412 m!254471))

(declare-fun m!254473 () Bool)

(assert (=> b!233557 m!254473))

(declare-fun m!254475 () Bool)

(assert (=> b!233557 m!254475))

(declare-fun m!254477 () Bool)

(assert (=> b!233553 m!254477))

(check-sat (not b!233549) (not b!233557) (not mapNonEmpty!10412) (not b!233554) (not b!233553) (not start!22296) tp_is_empty!6157 b_and!13175 (not b_next!6295))
(check-sat b_and!13175 (not b_next!6295))
(get-model)

(declare-fun d!58821 () Bool)

(declare-fun res!114617 () Bool)

(declare-fun e!151751 () Bool)

(assert (=> d!58821 (=> (not res!114617) (not e!151751))))

(declare-fun simpleValid!228 (LongMapFixedSize!3370) Bool)

(assert (=> d!58821 (= res!114617 (simpleValid!228 thiss!1504))))

(assert (=> d!58821 (= (valid!1348 thiss!1504) e!151751)))

(declare-fun b!233618 () Bool)

(declare-fun res!114618 () Bool)

(assert (=> b!233618 (=> (not res!114618) (not e!151751))))

(declare-fun arrayCountValidKeys!0 (array!11555 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233618 (= res!114618 (= (arrayCountValidKeys!0 (_keys!6405 thiss!1504) #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))) (_size!1734 thiss!1504)))))

(declare-fun b!233619 () Bool)

(declare-fun res!114619 () Bool)

(assert (=> b!233619 (=> (not res!114619) (not e!151751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11555 (_ BitVec 32)) Bool)

(assert (=> b!233619 (= res!114619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6405 thiss!1504) (mask!10280 thiss!1504)))))

(declare-fun b!233620 () Bool)

(declare-datatypes ((List!3519 0))(
  ( (Nil!3516) (Cons!3515 (h!4164 (_ BitVec 64)) (t!8475 List!3519)) )
))
(declare-fun arrayNoDuplicates!0 (array!11555 (_ BitVec 32) List!3519) Bool)

(assert (=> b!233620 (= e!151751 (arrayNoDuplicates!0 (_keys!6405 thiss!1504) #b00000000000000000000000000000000 Nil!3516))))

(assert (= (and d!58821 res!114617) b!233618))

(assert (= (and b!233618 res!114618) b!233619))

(assert (= (and b!233619 res!114619) b!233620))

(declare-fun m!254511 () Bool)

(assert (=> d!58821 m!254511))

(declare-fun m!254513 () Bool)

(assert (=> b!233618 m!254513))

(declare-fun m!254515 () Bool)

(assert (=> b!233619 m!254515))

(declare-fun m!254517 () Bool)

(assert (=> b!233620 m!254517))

(assert (=> start!22296 d!58821))

(declare-fun d!58823 () Bool)

(declare-fun e!151757 () Bool)

(assert (=> d!58823 e!151757))

(declare-fun res!114622 () Bool)

(assert (=> d!58823 (=> res!114622 e!151757)))

(declare-fun lt!118045 () Bool)

(assert (=> d!58823 (= res!114622 (not lt!118045))))

(declare-fun lt!118044 () Bool)

(assert (=> d!58823 (= lt!118045 lt!118044)))

(declare-datatypes ((Unit!7218 0))(
  ( (Unit!7219) )
))
(declare-fun lt!118046 () Unit!7218)

(declare-fun e!151756 () Unit!7218)

(assert (=> d!58823 (= lt!118046 e!151756)))

(declare-fun c!38867 () Bool)

(assert (=> d!58823 (= c!38867 lt!118044)))

(declare-fun containsKey!253 (List!3517 (_ BitVec 64)) Bool)

(assert (=> d!58823 (= lt!118044 (containsKey!253 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))

(assert (=> d!58823 (= (contains!1634 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)) key!932) lt!118045)))

(declare-fun b!233627 () Bool)

(declare-fun lt!118047 () Unit!7218)

(assert (=> b!233627 (= e!151756 lt!118047)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!202 (List!3517 (_ BitVec 64)) Unit!7218)

(assert (=> b!233627 (= lt!118047 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))

(declare-datatypes ((Option!267 0))(
  ( (Some!266 (v!5142 V!7857)) (None!265) )
))
(declare-fun isDefined!203 (Option!267) Bool)

(declare-fun getValueByKey!261 (List!3517 (_ BitVec 64)) Option!267)

(assert (=> b!233627 (isDefined!203 (getValueByKey!261 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))

(declare-fun b!233628 () Bool)

(declare-fun Unit!7220 () Unit!7218)

(assert (=> b!233628 (= e!151756 Unit!7220)))

(declare-fun b!233629 () Bool)

(assert (=> b!233629 (= e!151757 (isDefined!203 (getValueByKey!261 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932)))))

(assert (= (and d!58823 c!38867) b!233627))

(assert (= (and d!58823 (not c!38867)) b!233628))

(assert (= (and d!58823 (not res!114622)) b!233629))

(declare-fun m!254519 () Bool)

(assert (=> d!58823 m!254519))

(declare-fun m!254521 () Bool)

(assert (=> b!233627 m!254521))

(declare-fun m!254523 () Bool)

(assert (=> b!233627 m!254523))

(assert (=> b!233627 m!254523))

(declare-fun m!254525 () Bool)

(assert (=> b!233627 m!254525))

(assert (=> b!233629 m!254523))

(assert (=> b!233629 m!254523))

(assert (=> b!233629 m!254525))

(assert (=> b!233554 d!58823))

(declare-fun b!233672 () Bool)

(declare-fun e!151788 () Bool)

(declare-fun e!151794 () Bool)

(assert (=> b!233672 (= e!151788 e!151794)))

(declare-fun c!38884 () Bool)

(assert (=> b!233672 (= c!38884 (not (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!233673 () Bool)

(declare-fun e!151791 () ListLongMap!3491)

(declare-fun call!21728 () ListLongMap!3491)

(assert (=> b!233673 (= e!151791 call!21728)))

(declare-fun b!233674 () Bool)

(declare-fun res!114647 () Bool)

(assert (=> b!233674 (=> (not res!114647) (not e!151788))))

(declare-fun e!151795 () Bool)

(assert (=> b!233674 (= res!114647 e!151795)))

(declare-fun res!114641 () Bool)

(assert (=> b!233674 (=> res!114641 e!151795)))

(declare-fun e!151792 () Bool)

(assert (=> b!233674 (= res!114641 (not e!151792))))

(declare-fun res!114645 () Bool)

(assert (=> b!233674 (=> (not res!114645) (not e!151792))))

(assert (=> b!233674 (= res!114645 (bvslt #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))))))

(declare-fun b!233675 () Bool)

(declare-fun e!151787 () Bool)

(declare-fun lt!118111 () ListLongMap!3491)

(declare-fun apply!205 (ListLongMap!3491 (_ BitVec 64)) V!7857)

(declare-fun get!2813 (ValueCell!2735 V!7857) V!7857)

(declare-fun dynLambda!539 (Int (_ BitVec 64)) V!7857)

(assert (=> b!233675 (= e!151787 (= (apply!205 lt!118111 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)) (get!2813 (select (arr!5493 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!539 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5828 (_values!4330 thiss!1504))))))

(assert (=> b!233675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))))))

(declare-fun bm!21720 () Bool)

(declare-fun call!21723 () Bool)

(assert (=> bm!21720 (= call!21723 (contains!1634 lt!118111 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233676 () Bool)

(assert (=> b!233676 (= e!151795 e!151787)))

(declare-fun res!114644 () Bool)

(assert (=> b!233676 (=> (not res!114644) (not e!151787))))

(assert (=> b!233676 (= res!114644 (contains!1634 lt!118111 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233676 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))))))

(declare-fun b!233677 () Bool)

(declare-fun res!114643 () Bool)

(assert (=> b!233677 (=> (not res!114643) (not e!151788))))

(declare-fun e!151790 () Bool)

(assert (=> b!233677 (= res!114643 e!151790)))

(declare-fun c!38883 () Bool)

(assert (=> b!233677 (= c!38883 (not (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!233678 () Bool)

(declare-fun e!151789 () Unit!7218)

(declare-fun lt!118105 () Unit!7218)

(assert (=> b!233678 (= e!151789 lt!118105)))

(declare-fun lt!118107 () ListLongMap!3491)

(declare-fun getCurrentListMapNoExtraKeys!521 (array!11555 array!11553 (_ BitVec 32) (_ BitVec 32) V!7857 V!7857 (_ BitVec 32) Int) ListLongMap!3491)

(assert (=> b!233678 (= lt!118107 (getCurrentListMapNoExtraKeys!521 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))

(declare-fun lt!118096 () (_ BitVec 64))

(assert (=> b!233678 (= lt!118096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118094 () (_ BitVec 64))

(assert (=> b!233678 (= lt!118094 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118093 () Unit!7218)

(declare-fun addStillContains!181 (ListLongMap!3491 (_ BitVec 64) V!7857 (_ BitVec 64)) Unit!7218)

(assert (=> b!233678 (= lt!118093 (addStillContains!181 lt!118107 lt!118096 (zeroValue!4188 thiss!1504) lt!118094))))

(declare-fun +!638 (ListLongMap!3491 tuple2!4588) ListLongMap!3491)

(assert (=> b!233678 (contains!1634 (+!638 lt!118107 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504))) lt!118094)))

(declare-fun lt!118099 () Unit!7218)

(assert (=> b!233678 (= lt!118099 lt!118093)))

(declare-fun lt!118104 () ListLongMap!3491)

(assert (=> b!233678 (= lt!118104 (getCurrentListMapNoExtraKeys!521 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))

(declare-fun lt!118102 () (_ BitVec 64))

(assert (=> b!233678 (= lt!118102 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118098 () (_ BitVec 64))

(assert (=> b!233678 (= lt!118098 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118106 () Unit!7218)

(declare-fun addApplyDifferent!181 (ListLongMap!3491 (_ BitVec 64) V!7857 (_ BitVec 64)) Unit!7218)

(assert (=> b!233678 (= lt!118106 (addApplyDifferent!181 lt!118104 lt!118102 (minValue!4188 thiss!1504) lt!118098))))

(assert (=> b!233678 (= (apply!205 (+!638 lt!118104 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504))) lt!118098) (apply!205 lt!118104 lt!118098))))

(declare-fun lt!118109 () Unit!7218)

(assert (=> b!233678 (= lt!118109 lt!118106)))

(declare-fun lt!118097 () ListLongMap!3491)

(assert (=> b!233678 (= lt!118097 (getCurrentListMapNoExtraKeys!521 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))

(declare-fun lt!118101 () (_ BitVec 64))

(assert (=> b!233678 (= lt!118101 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118103 () (_ BitVec 64))

(assert (=> b!233678 (= lt!118103 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118108 () Unit!7218)

(assert (=> b!233678 (= lt!118108 (addApplyDifferent!181 lt!118097 lt!118101 (zeroValue!4188 thiss!1504) lt!118103))))

(assert (=> b!233678 (= (apply!205 (+!638 lt!118097 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504))) lt!118103) (apply!205 lt!118097 lt!118103))))

(declare-fun lt!118110 () Unit!7218)

(assert (=> b!233678 (= lt!118110 lt!118108)))

(declare-fun lt!118100 () ListLongMap!3491)

(assert (=> b!233678 (= lt!118100 (getCurrentListMapNoExtraKeys!521 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))

(declare-fun lt!118092 () (_ BitVec 64))

(assert (=> b!233678 (= lt!118092 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118095 () (_ BitVec 64))

(assert (=> b!233678 (= lt!118095 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233678 (= lt!118105 (addApplyDifferent!181 lt!118100 lt!118092 (minValue!4188 thiss!1504) lt!118095))))

(assert (=> b!233678 (= (apply!205 (+!638 lt!118100 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504))) lt!118095) (apply!205 lt!118100 lt!118095))))

(declare-fun bm!21722 () Bool)

(declare-fun call!21727 () ListLongMap!3491)

(declare-fun call!21726 () ListLongMap!3491)

(assert (=> bm!21722 (= call!21727 call!21726)))

(declare-fun b!233679 () Bool)

(declare-fun e!151793 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!233679 (= e!151793 (validKeyInArray!0 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233680 () Bool)

(declare-fun e!151785 () ListLongMap!3491)

(assert (=> b!233680 (= e!151785 call!21728)))

(declare-fun b!233681 () Bool)

(assert (=> b!233681 (= e!151785 call!21727)))

(declare-fun bm!21723 () Bool)

(declare-fun call!21724 () ListLongMap!3491)

(assert (=> bm!21723 (= call!21726 call!21724)))

(declare-fun b!233682 () Bool)

(declare-fun e!151786 () ListLongMap!3491)

(declare-fun call!21725 () ListLongMap!3491)

(assert (=> b!233682 (= e!151786 (+!638 call!21725 (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))

(declare-fun b!233683 () Bool)

(assert (=> b!233683 (= e!151792 (validKeyInArray!0 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233684 () Bool)

(declare-fun e!151784 () Bool)

(assert (=> b!233684 (= e!151784 (= (apply!205 lt!118111 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4188 thiss!1504)))))

(declare-fun b!233685 () Bool)

(declare-fun Unit!7221 () Unit!7218)

(assert (=> b!233685 (= e!151789 Unit!7221)))

(declare-fun b!233686 () Bool)

(declare-fun call!21729 () Bool)

(assert (=> b!233686 (= e!151794 (not call!21729))))

(declare-fun b!233687 () Bool)

(declare-fun e!151796 () Bool)

(assert (=> b!233687 (= e!151796 (= (apply!205 lt!118111 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4188 thiss!1504)))))

(declare-fun b!233688 () Bool)

(assert (=> b!233688 (= e!151786 e!151791)))

(declare-fun c!38880 () Bool)

(assert (=> b!233688 (= c!38880 (and (not (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21724 () Bool)

(assert (=> bm!21724 (= call!21728 call!21725)))

(declare-fun b!233689 () Bool)

(assert (=> b!233689 (= e!151790 e!151784)))

(declare-fun res!114646 () Bool)

(assert (=> b!233689 (= res!114646 call!21723)))

(assert (=> b!233689 (=> (not res!114646) (not e!151784))))

(declare-fun b!233690 () Bool)

(assert (=> b!233690 (= e!151790 (not call!21723))))

(declare-fun c!38885 () Bool)

(declare-fun bm!21721 () Bool)

(assert (=> bm!21721 (= call!21725 (+!638 (ite c!38885 call!21724 (ite c!38880 call!21726 call!21727)) (ite (or c!38885 c!38880) (tuple2!4589 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))

(declare-fun d!58825 () Bool)

(assert (=> d!58825 e!151788))

(declare-fun res!114649 () Bool)

(assert (=> d!58825 (=> (not res!114649) (not e!151788))))

(assert (=> d!58825 (= res!114649 (or (bvsge #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))))))))

(declare-fun lt!118112 () ListLongMap!3491)

(assert (=> d!58825 (= lt!118111 lt!118112)))

(declare-fun lt!118113 () Unit!7218)

(assert (=> d!58825 (= lt!118113 e!151789)))

(declare-fun c!38881 () Bool)

(assert (=> d!58825 (= c!38881 e!151793)))

(declare-fun res!114642 () Bool)

(assert (=> d!58825 (=> (not res!114642) (not e!151793))))

(assert (=> d!58825 (= res!114642 (bvslt #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))))))

(assert (=> d!58825 (= lt!118112 e!151786)))

(assert (=> d!58825 (= c!38885 (and (not (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58825 (validMask!0 (mask!10280 thiss!1504))))

(assert (=> d!58825 (= (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)) lt!118111)))

(declare-fun bm!21725 () Bool)

(assert (=> bm!21725 (= call!21729 (contains!1634 lt!118111 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21726 () Bool)

(assert (=> bm!21726 (= call!21724 (getCurrentListMapNoExtraKeys!521 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))

(declare-fun b!233691 () Bool)

(assert (=> b!233691 (= e!151794 e!151796)))

(declare-fun res!114648 () Bool)

(assert (=> b!233691 (= res!114648 call!21729)))

(assert (=> b!233691 (=> (not res!114648) (not e!151796))))

(declare-fun b!233692 () Bool)

(declare-fun c!38882 () Bool)

(assert (=> b!233692 (= c!38882 (and (not (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!233692 (= e!151791 e!151785)))

(assert (= (and d!58825 c!38885) b!233682))

(assert (= (and d!58825 (not c!38885)) b!233688))

(assert (= (and b!233688 c!38880) b!233673))

(assert (= (and b!233688 (not c!38880)) b!233692))

(assert (= (and b!233692 c!38882) b!233680))

(assert (= (and b!233692 (not c!38882)) b!233681))

(assert (= (or b!233680 b!233681) bm!21722))

(assert (= (or b!233673 bm!21722) bm!21723))

(assert (= (or b!233673 b!233680) bm!21724))

(assert (= (or b!233682 bm!21723) bm!21726))

(assert (= (or b!233682 bm!21724) bm!21721))

(assert (= (and d!58825 res!114642) b!233679))

(assert (= (and d!58825 c!38881) b!233678))

(assert (= (and d!58825 (not c!38881)) b!233685))

(assert (= (and d!58825 res!114649) b!233674))

(assert (= (and b!233674 res!114645) b!233683))

(assert (= (and b!233674 (not res!114641)) b!233676))

(assert (= (and b!233676 res!114644) b!233675))

(assert (= (and b!233674 res!114647) b!233677))

(assert (= (and b!233677 c!38883) b!233689))

(assert (= (and b!233677 (not c!38883)) b!233690))

(assert (= (and b!233689 res!114646) b!233684))

(assert (= (or b!233689 b!233690) bm!21720))

(assert (= (and b!233677 res!114643) b!233672))

(assert (= (and b!233672 c!38884) b!233691))

(assert (= (and b!233672 (not c!38884)) b!233686))

(assert (= (and b!233691 res!114648) b!233687))

(assert (= (or b!233691 b!233686) bm!21725))

(declare-fun b_lambda!7841 () Bool)

(assert (=> (not b_lambda!7841) (not b!233675)))

(declare-fun t!8474 () Bool)

(declare-fun tb!2915 () Bool)

(assert (=> (and b!233557 (= (defaultEntry!4347 thiss!1504) (defaultEntry!4347 thiss!1504)) t!8474) tb!2915))

(declare-fun result!5083 () Bool)

(assert (=> tb!2915 (= result!5083 tp_is_empty!6157)))

(assert (=> b!233675 t!8474))

(declare-fun b_and!13181 () Bool)

(assert (= b_and!13175 (and (=> t!8474 result!5083) b_and!13181)))

(declare-fun m!254527 () Bool)

(assert (=> bm!21721 m!254527))

(declare-fun m!254529 () Bool)

(assert (=> b!233684 m!254529))

(assert (=> d!58825 m!254477))

(declare-fun m!254531 () Bool)

(assert (=> b!233676 m!254531))

(assert (=> b!233676 m!254531))

(declare-fun m!254533 () Bool)

(assert (=> b!233676 m!254533))

(declare-fun m!254535 () Bool)

(assert (=> b!233678 m!254535))

(declare-fun m!254537 () Bool)

(assert (=> b!233678 m!254537))

(declare-fun m!254539 () Bool)

(assert (=> b!233678 m!254539))

(declare-fun m!254541 () Bool)

(assert (=> b!233678 m!254541))

(declare-fun m!254543 () Bool)

(assert (=> b!233678 m!254543))

(assert (=> b!233678 m!254535))

(declare-fun m!254545 () Bool)

(assert (=> b!233678 m!254545))

(declare-fun m!254547 () Bool)

(assert (=> b!233678 m!254547))

(declare-fun m!254549 () Bool)

(assert (=> b!233678 m!254549))

(assert (=> b!233678 m!254531))

(assert (=> b!233678 m!254537))

(declare-fun m!254551 () Bool)

(assert (=> b!233678 m!254551))

(assert (=> b!233678 m!254547))

(declare-fun m!254553 () Bool)

(assert (=> b!233678 m!254553))

(declare-fun m!254555 () Bool)

(assert (=> b!233678 m!254555))

(declare-fun m!254557 () Bool)

(assert (=> b!233678 m!254557))

(declare-fun m!254559 () Bool)

(assert (=> b!233678 m!254559))

(assert (=> b!233678 m!254559))

(declare-fun m!254561 () Bool)

(assert (=> b!233678 m!254561))

(declare-fun m!254563 () Bool)

(assert (=> b!233678 m!254563))

(declare-fun m!254565 () Bool)

(assert (=> b!233678 m!254565))

(declare-fun m!254567 () Bool)

(assert (=> bm!21720 m!254567))

(declare-fun m!254569 () Bool)

(assert (=> b!233682 m!254569))

(assert (=> b!233683 m!254531))

(assert (=> b!233683 m!254531))

(declare-fun m!254571 () Bool)

(assert (=> b!233683 m!254571))

(assert (=> bm!21726 m!254555))

(declare-fun m!254573 () Bool)

(assert (=> bm!21725 m!254573))

(assert (=> b!233679 m!254531))

(assert (=> b!233679 m!254531))

(assert (=> b!233679 m!254571))

(declare-fun m!254575 () Bool)

(assert (=> b!233687 m!254575))

(assert (=> b!233675 m!254531))

(assert (=> b!233675 m!254531))

(declare-fun m!254577 () Bool)

(assert (=> b!233675 m!254577))

(declare-fun m!254579 () Bool)

(assert (=> b!233675 m!254579))

(declare-fun m!254581 () Bool)

(assert (=> b!233675 m!254581))

(assert (=> b!233675 m!254579))

(assert (=> b!233675 m!254581))

(declare-fun m!254583 () Bool)

(assert (=> b!233675 m!254583))

(assert (=> b!233554 d!58825))

(declare-fun b!233707 () Bool)

(declare-fun e!151804 () SeekEntryResult!982)

(declare-fun e!151805 () SeekEntryResult!982)

(assert (=> b!233707 (= e!151804 e!151805)))

(declare-fun lt!118121 () (_ BitVec 64))

(declare-fun lt!118120 () SeekEntryResult!982)

(assert (=> b!233707 (= lt!118121 (select (arr!5494 (_keys!6405 thiss!1504)) (index!6100 lt!118120)))))

(declare-fun c!38892 () Bool)

(assert (=> b!233707 (= c!38892 (= lt!118121 key!932))))

(declare-fun d!58827 () Bool)

(declare-fun lt!118122 () SeekEntryResult!982)

(assert (=> d!58827 (and (or ((_ is Undefined!982) lt!118122) (not ((_ is Found!982) lt!118122)) (and (bvsge (index!6099 lt!118122) #b00000000000000000000000000000000) (bvslt (index!6099 lt!118122) (size!5829 (_keys!6405 thiss!1504))))) (or ((_ is Undefined!982) lt!118122) ((_ is Found!982) lt!118122) (not ((_ is MissingZero!982) lt!118122)) (and (bvsge (index!6098 lt!118122) #b00000000000000000000000000000000) (bvslt (index!6098 lt!118122) (size!5829 (_keys!6405 thiss!1504))))) (or ((_ is Undefined!982) lt!118122) ((_ is Found!982) lt!118122) ((_ is MissingZero!982) lt!118122) (not ((_ is MissingVacant!982) lt!118122)) (and (bvsge (index!6101 lt!118122) #b00000000000000000000000000000000) (bvslt (index!6101 lt!118122) (size!5829 (_keys!6405 thiss!1504))))) (or ((_ is Undefined!982) lt!118122) (ite ((_ is Found!982) lt!118122) (= (select (arr!5494 (_keys!6405 thiss!1504)) (index!6099 lt!118122)) key!932) (ite ((_ is MissingZero!982) lt!118122) (= (select (arr!5494 (_keys!6405 thiss!1504)) (index!6098 lt!118122)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!982) lt!118122) (= (select (arr!5494 (_keys!6405 thiss!1504)) (index!6101 lt!118122)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58827 (= lt!118122 e!151804)))

(declare-fun c!38893 () Bool)

(assert (=> d!58827 (= c!38893 (and ((_ is Intermediate!982) lt!118120) (undefined!1794 lt!118120)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11555 (_ BitVec 32)) SeekEntryResult!982)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58827 (= lt!118120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10280 thiss!1504)) key!932 (_keys!6405 thiss!1504) (mask!10280 thiss!1504)))))

(assert (=> d!58827 (validMask!0 (mask!10280 thiss!1504))))

(assert (=> d!58827 (= (seekEntryOrOpen!0 key!932 (_keys!6405 thiss!1504) (mask!10280 thiss!1504)) lt!118122)))

(declare-fun b!233708 () Bool)

(assert (=> b!233708 (= e!151804 Undefined!982)))

(declare-fun b!233709 () Bool)

(declare-fun c!38894 () Bool)

(assert (=> b!233709 (= c!38894 (= lt!118121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!151803 () SeekEntryResult!982)

(assert (=> b!233709 (= e!151805 e!151803)))

(declare-fun b!233710 () Bool)

(assert (=> b!233710 (= e!151803 (MissingZero!982 (index!6100 lt!118120)))))

(declare-fun b!233711 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11555 (_ BitVec 32)) SeekEntryResult!982)

(assert (=> b!233711 (= e!151803 (seekKeyOrZeroReturnVacant!0 (x!23653 lt!118120) (index!6100 lt!118120) (index!6100 lt!118120) key!932 (_keys!6405 thiss!1504) (mask!10280 thiss!1504)))))

(declare-fun b!233712 () Bool)

(assert (=> b!233712 (= e!151805 (Found!982 (index!6100 lt!118120)))))

(assert (= (and d!58827 c!38893) b!233708))

(assert (= (and d!58827 (not c!38893)) b!233707))

(assert (= (and b!233707 c!38892) b!233712))

(assert (= (and b!233707 (not c!38892)) b!233709))

(assert (= (and b!233709 c!38894) b!233710))

(assert (= (and b!233709 (not c!38894)) b!233711))

(declare-fun m!254585 () Bool)

(assert (=> b!233707 m!254585))

(assert (=> d!58827 m!254477))

(declare-fun m!254587 () Bool)

(assert (=> d!58827 m!254587))

(declare-fun m!254589 () Bool)

(assert (=> d!58827 m!254589))

(declare-fun m!254591 () Bool)

(assert (=> d!58827 m!254591))

(declare-fun m!254593 () Bool)

(assert (=> d!58827 m!254593))

(assert (=> d!58827 m!254589))

(declare-fun m!254595 () Bool)

(assert (=> d!58827 m!254595))

(declare-fun m!254597 () Bool)

(assert (=> b!233711 m!254597))

(assert (=> b!233549 d!58827))

(declare-fun d!58829 () Bool)

(assert (=> d!58829 (= (validMask!0 (mask!10280 thiss!1504)) (and (or (= (mask!10280 thiss!1504) #b00000000000000000000000000000111) (= (mask!10280 thiss!1504) #b00000000000000000000000000001111) (= (mask!10280 thiss!1504) #b00000000000000000000000000011111) (= (mask!10280 thiss!1504) #b00000000000000000000000000111111) (= (mask!10280 thiss!1504) #b00000000000000000000000001111111) (= (mask!10280 thiss!1504) #b00000000000000000000000011111111) (= (mask!10280 thiss!1504) #b00000000000000000000000111111111) (= (mask!10280 thiss!1504) #b00000000000000000000001111111111) (= (mask!10280 thiss!1504) #b00000000000000000000011111111111) (= (mask!10280 thiss!1504) #b00000000000000000000111111111111) (= (mask!10280 thiss!1504) #b00000000000000000001111111111111) (= (mask!10280 thiss!1504) #b00000000000000000011111111111111) (= (mask!10280 thiss!1504) #b00000000000000000111111111111111) (= (mask!10280 thiss!1504) #b00000000000000001111111111111111) (= (mask!10280 thiss!1504) #b00000000000000011111111111111111) (= (mask!10280 thiss!1504) #b00000000000000111111111111111111) (= (mask!10280 thiss!1504) #b00000000000001111111111111111111) (= (mask!10280 thiss!1504) #b00000000000011111111111111111111) (= (mask!10280 thiss!1504) #b00000000000111111111111111111111) (= (mask!10280 thiss!1504) #b00000000001111111111111111111111) (= (mask!10280 thiss!1504) #b00000000011111111111111111111111) (= (mask!10280 thiss!1504) #b00000000111111111111111111111111) (= (mask!10280 thiss!1504) #b00000001111111111111111111111111) (= (mask!10280 thiss!1504) #b00000011111111111111111111111111) (= (mask!10280 thiss!1504) #b00000111111111111111111111111111) (= (mask!10280 thiss!1504) #b00001111111111111111111111111111) (= (mask!10280 thiss!1504) #b00011111111111111111111111111111) (= (mask!10280 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10280 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!233553 d!58829))

(declare-fun d!58831 () Bool)

(assert (=> d!58831 (= (array_inv!3627 (_keys!6405 thiss!1504)) (bvsge (size!5829 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233557 d!58831))

(declare-fun d!58833 () Bool)

(assert (=> d!58833 (= (array_inv!3628 (_values!4330 thiss!1504)) (bvsge (size!5828 (_values!4330 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233557 d!58833))

(declare-fun mapNonEmpty!10421 () Bool)

(declare-fun mapRes!10421 () Bool)

(declare-fun tp!22049 () Bool)

(declare-fun e!151810 () Bool)

(assert (=> mapNonEmpty!10421 (= mapRes!10421 (and tp!22049 e!151810))))

(declare-fun mapKey!10421 () (_ BitVec 32))

(declare-fun mapRest!10421 () (Array (_ BitVec 32) ValueCell!2735))

(declare-fun mapValue!10421 () ValueCell!2735)

(assert (=> mapNonEmpty!10421 (= mapRest!10412 (store mapRest!10421 mapKey!10421 mapValue!10421))))

(declare-fun b!233720 () Bool)

(declare-fun e!151811 () Bool)

(assert (=> b!233720 (= e!151811 tp_is_empty!6157)))

(declare-fun b!233719 () Bool)

(assert (=> b!233719 (= e!151810 tp_is_empty!6157)))

(declare-fun condMapEmpty!10421 () Bool)

(declare-fun mapDefault!10421 () ValueCell!2735)

(assert (=> mapNonEmpty!10412 (= condMapEmpty!10421 (= mapRest!10412 ((as const (Array (_ BitVec 32) ValueCell!2735)) mapDefault!10421)))))

(assert (=> mapNonEmpty!10412 (= tp!22033 (and e!151811 mapRes!10421))))

(declare-fun mapIsEmpty!10421 () Bool)

(assert (=> mapIsEmpty!10421 mapRes!10421))

(assert (= (and mapNonEmpty!10412 condMapEmpty!10421) mapIsEmpty!10421))

(assert (= (and mapNonEmpty!10412 (not condMapEmpty!10421)) mapNonEmpty!10421))

(assert (= (and mapNonEmpty!10421 ((_ is ValueCellFull!2735) mapValue!10421)) b!233719))

(assert (= (and mapNonEmpty!10412 ((_ is ValueCellFull!2735) mapDefault!10421)) b!233720))

(declare-fun m!254599 () Bool)

(assert (=> mapNonEmpty!10421 m!254599))

(declare-fun b_lambda!7843 () Bool)

(assert (= b_lambda!7841 (or (and b!233557 b_free!6295) b_lambda!7843)))

(check-sat (not b!233711) (not b!233683) (not d!58825) (not d!58823) (not bm!21720) (not b!233629) (not d!58827) (not b_next!6295) (not b!233675) tp_is_empty!6157 (not d!58821) (not b!233684) (not bm!21725) (not b!233678) (not bm!21726) b_and!13181 (not b!233618) (not b!233676) (not b!233687) (not b!233619) (not bm!21721) (not b!233627) (not b!233682) (not mapNonEmpty!10421) (not b_lambda!7843) (not b!233679) (not b!233620))
(check-sat b_and!13181 (not b_next!6295))
(get-model)

(declare-fun d!58835 () Bool)

(declare-fun e!151814 () Bool)

(assert (=> d!58835 e!151814))

(declare-fun res!114655 () Bool)

(assert (=> d!58835 (=> (not res!114655) (not e!151814))))

(declare-fun lt!118134 () ListLongMap!3491)

(assert (=> d!58835 (= res!114655 (contains!1634 lt!118134 (_1!2305 (ite (or c!38885 c!38880) (tuple2!4589 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))))

(declare-fun lt!118132 () List!3517)

(assert (=> d!58835 (= lt!118134 (ListLongMap!3492 lt!118132))))

(declare-fun lt!118133 () Unit!7218)

(declare-fun lt!118131 () Unit!7218)

(assert (=> d!58835 (= lt!118133 lt!118131)))

(assert (=> d!58835 (= (getValueByKey!261 lt!118132 (_1!2305 (ite (or c!38885 c!38880) (tuple2!4589 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))) (Some!266 (_2!2305 (ite (or c!38885 c!38880) (tuple2!4589 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!149 (List!3517 (_ BitVec 64) V!7857) Unit!7218)

(assert (=> d!58835 (= lt!118131 (lemmaContainsTupThenGetReturnValue!149 lt!118132 (_1!2305 (ite (or c!38885 c!38880) (tuple2!4589 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))) (_2!2305 (ite (or c!38885 c!38880) (tuple2!4589 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))))

(declare-fun insertStrictlySorted!152 (List!3517 (_ BitVec 64) V!7857) List!3517)

(assert (=> d!58835 (= lt!118132 (insertStrictlySorted!152 (toList!1761 (ite c!38885 call!21724 (ite c!38880 call!21726 call!21727))) (_1!2305 (ite (or c!38885 c!38880) (tuple2!4589 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))) (_2!2305 (ite (or c!38885 c!38880) (tuple2!4589 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))))

(assert (=> d!58835 (= (+!638 (ite c!38885 call!21724 (ite c!38880 call!21726 call!21727)) (ite (or c!38885 c!38880) (tuple2!4589 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))) lt!118134)))

(declare-fun b!233725 () Bool)

(declare-fun res!114654 () Bool)

(assert (=> b!233725 (=> (not res!114654) (not e!151814))))

(assert (=> b!233725 (= res!114654 (= (getValueByKey!261 (toList!1761 lt!118134) (_1!2305 (ite (or c!38885 c!38880) (tuple2!4589 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))) (Some!266 (_2!2305 (ite (or c!38885 c!38880) (tuple2!4589 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))))

(declare-fun b!233726 () Bool)

(declare-fun contains!1636 (List!3517 tuple2!4588) Bool)

(assert (=> b!233726 (= e!151814 (contains!1636 (toList!1761 lt!118134) (ite (or c!38885 c!38880) (tuple2!4589 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))

(assert (= (and d!58835 res!114655) b!233725))

(assert (= (and b!233725 res!114654) b!233726))

(declare-fun m!254601 () Bool)

(assert (=> d!58835 m!254601))

(declare-fun m!254603 () Bool)

(assert (=> d!58835 m!254603))

(declare-fun m!254605 () Bool)

(assert (=> d!58835 m!254605))

(declare-fun m!254607 () Bool)

(assert (=> d!58835 m!254607))

(declare-fun m!254609 () Bool)

(assert (=> b!233725 m!254609))

(declare-fun m!254611 () Bool)

(assert (=> b!233726 m!254611))

(assert (=> bm!21721 d!58835))

(declare-fun d!58837 () Bool)

(assert (=> d!58837 (isDefined!203 (getValueByKey!261 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))

(declare-fun lt!118137 () Unit!7218)

(declare-fun choose!1102 (List!3517 (_ BitVec 64)) Unit!7218)

(assert (=> d!58837 (= lt!118137 (choose!1102 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))

(declare-fun e!151817 () Bool)

(assert (=> d!58837 e!151817))

(declare-fun res!114658 () Bool)

(assert (=> d!58837 (=> (not res!114658) (not e!151817))))

(declare-fun isStrictlySorted!355 (List!3517) Bool)

(assert (=> d!58837 (= res!114658 (isStrictlySorted!355 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))))

(assert (=> d!58837 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932) lt!118137)))

(declare-fun b!233729 () Bool)

(assert (=> b!233729 (= e!151817 (containsKey!253 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))

(assert (= (and d!58837 res!114658) b!233729))

(assert (=> d!58837 m!254523))

(assert (=> d!58837 m!254523))

(assert (=> d!58837 m!254525))

(declare-fun m!254613 () Bool)

(assert (=> d!58837 m!254613))

(declare-fun m!254615 () Bool)

(assert (=> d!58837 m!254615))

(assert (=> b!233729 m!254519))

(assert (=> b!233627 d!58837))

(declare-fun d!58839 () Bool)

(declare-fun isEmpty!510 (Option!267) Bool)

(assert (=> d!58839 (= (isDefined!203 (getValueByKey!261 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932)) (not (isEmpty!510 (getValueByKey!261 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))))

(declare-fun bs!8639 () Bool)

(assert (= bs!8639 d!58839))

(assert (=> bs!8639 m!254523))

(declare-fun m!254617 () Bool)

(assert (=> bs!8639 m!254617))

(assert (=> b!233627 d!58839))

(declare-fun b!233741 () Bool)

(declare-fun e!151823 () Option!267)

(assert (=> b!233741 (= e!151823 None!265)))

(declare-fun b!233740 () Bool)

(assert (=> b!233740 (= e!151823 (getValueByKey!261 (t!8471 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))) key!932))))

(declare-fun b!233739 () Bool)

(declare-fun e!151822 () Option!267)

(assert (=> b!233739 (= e!151822 e!151823)))

(declare-fun c!38900 () Bool)

(assert (=> b!233739 (= c!38900 (and ((_ is Cons!3513) (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))) (not (= (_1!2305 (h!4162 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))))) key!932))))))

(declare-fun d!58841 () Bool)

(declare-fun c!38899 () Bool)

(assert (=> d!58841 (= c!38899 (and ((_ is Cons!3513) (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))) (= (_1!2305 (h!4162 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))))) key!932)))))

(assert (=> d!58841 (= (getValueByKey!261 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932) e!151822)))

(declare-fun b!233738 () Bool)

(assert (=> b!233738 (= e!151822 (Some!266 (_2!2305 (h!4162 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))))))

(assert (= (and d!58841 c!38899) b!233738))

(assert (= (and d!58841 (not c!38899)) b!233739))

(assert (= (and b!233739 c!38900) b!233740))

(assert (= (and b!233739 (not c!38900)) b!233741))

(declare-fun m!254619 () Bool)

(assert (=> b!233740 m!254619))

(assert (=> b!233627 d!58841))

(declare-fun d!58843 () Bool)

(declare-fun get!2814 (Option!267) V!7857)

(assert (=> d!58843 (= (apply!205 lt!118111 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2814 (getValueByKey!261 (toList!1761 lt!118111) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8640 () Bool)

(assert (= bs!8640 d!58843))

(declare-fun m!254621 () Bool)

(assert (=> bs!8640 m!254621))

(assert (=> bs!8640 m!254621))

(declare-fun m!254623 () Bool)

(assert (=> bs!8640 m!254623))

(assert (=> b!233684 d!58843))

(declare-fun b!233754 () Bool)

(declare-fun e!151832 () SeekEntryResult!982)

(declare-fun e!151830 () SeekEntryResult!982)

(assert (=> b!233754 (= e!151832 e!151830)))

(declare-fun c!38907 () Bool)

(declare-fun lt!118143 () (_ BitVec 64))

(assert (=> b!233754 (= c!38907 (= lt!118143 key!932))))

(declare-fun b!233755 () Bool)

(assert (=> b!233755 (= e!151830 (Found!982 (index!6100 lt!118120)))))

(declare-fun d!58845 () Bool)

(declare-fun lt!118142 () SeekEntryResult!982)

(assert (=> d!58845 (and (or ((_ is Undefined!982) lt!118142) (not ((_ is Found!982) lt!118142)) (and (bvsge (index!6099 lt!118142) #b00000000000000000000000000000000) (bvslt (index!6099 lt!118142) (size!5829 (_keys!6405 thiss!1504))))) (or ((_ is Undefined!982) lt!118142) ((_ is Found!982) lt!118142) (not ((_ is MissingVacant!982) lt!118142)) (not (= (index!6101 lt!118142) (index!6100 lt!118120))) (and (bvsge (index!6101 lt!118142) #b00000000000000000000000000000000) (bvslt (index!6101 lt!118142) (size!5829 (_keys!6405 thiss!1504))))) (or ((_ is Undefined!982) lt!118142) (ite ((_ is Found!982) lt!118142) (= (select (arr!5494 (_keys!6405 thiss!1504)) (index!6099 lt!118142)) key!932) (and ((_ is MissingVacant!982) lt!118142) (= (index!6101 lt!118142) (index!6100 lt!118120)) (= (select (arr!5494 (_keys!6405 thiss!1504)) (index!6101 lt!118142)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58845 (= lt!118142 e!151832)))

(declare-fun c!38909 () Bool)

(assert (=> d!58845 (= c!38909 (bvsge (x!23653 lt!118120) #b01111111111111111111111111111110))))

(assert (=> d!58845 (= lt!118143 (select (arr!5494 (_keys!6405 thiss!1504)) (index!6100 lt!118120)))))

(assert (=> d!58845 (validMask!0 (mask!10280 thiss!1504))))

(assert (=> d!58845 (= (seekKeyOrZeroReturnVacant!0 (x!23653 lt!118120) (index!6100 lt!118120) (index!6100 lt!118120) key!932 (_keys!6405 thiss!1504) (mask!10280 thiss!1504)) lt!118142)))

(declare-fun b!233756 () Bool)

(declare-fun e!151831 () SeekEntryResult!982)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233756 (= e!151831 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23653 lt!118120) #b00000000000000000000000000000001) (nextIndex!0 (index!6100 lt!118120) (x!23653 lt!118120) (mask!10280 thiss!1504)) (index!6100 lt!118120) key!932 (_keys!6405 thiss!1504) (mask!10280 thiss!1504)))))

(declare-fun b!233757 () Bool)

(assert (=> b!233757 (= e!151832 Undefined!982)))

(declare-fun b!233758 () Bool)

(declare-fun c!38908 () Bool)

(assert (=> b!233758 (= c!38908 (= lt!118143 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233758 (= e!151830 e!151831)))

(declare-fun b!233759 () Bool)

(assert (=> b!233759 (= e!151831 (MissingVacant!982 (index!6100 lt!118120)))))

(assert (= (and d!58845 c!38909) b!233757))

(assert (= (and d!58845 (not c!38909)) b!233754))

(assert (= (and b!233754 c!38907) b!233755))

(assert (= (and b!233754 (not c!38907)) b!233758))

(assert (= (and b!233758 c!38908) b!233759))

(assert (= (and b!233758 (not c!38908)) b!233756))

(declare-fun m!254625 () Bool)

(assert (=> d!58845 m!254625))

(declare-fun m!254627 () Bool)

(assert (=> d!58845 m!254627))

(assert (=> d!58845 m!254585))

(assert (=> d!58845 m!254477))

(declare-fun m!254629 () Bool)

(assert (=> b!233756 m!254629))

(assert (=> b!233756 m!254629))

(declare-fun m!254631 () Bool)

(assert (=> b!233756 m!254631))

(assert (=> b!233711 d!58845))

(declare-fun d!58847 () Bool)

(declare-fun e!151834 () Bool)

(assert (=> d!58847 e!151834))

(declare-fun res!114659 () Bool)

(assert (=> d!58847 (=> res!114659 e!151834)))

(declare-fun lt!118145 () Bool)

(assert (=> d!58847 (= res!114659 (not lt!118145))))

(declare-fun lt!118144 () Bool)

(assert (=> d!58847 (= lt!118145 lt!118144)))

(declare-fun lt!118146 () Unit!7218)

(declare-fun e!151833 () Unit!7218)

(assert (=> d!58847 (= lt!118146 e!151833)))

(declare-fun c!38910 () Bool)

(assert (=> d!58847 (= c!38910 lt!118144)))

(assert (=> d!58847 (= lt!118144 (containsKey!253 (toList!1761 lt!118111) (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58847 (= (contains!1634 lt!118111 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)) lt!118145)))

(declare-fun b!233760 () Bool)

(declare-fun lt!118147 () Unit!7218)

(assert (=> b!233760 (= e!151833 lt!118147)))

(assert (=> b!233760 (= lt!118147 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1761 lt!118111) (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233760 (isDefined!203 (getValueByKey!261 (toList!1761 lt!118111) (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233761 () Bool)

(declare-fun Unit!7222 () Unit!7218)

(assert (=> b!233761 (= e!151833 Unit!7222)))

(declare-fun b!233762 () Bool)

(assert (=> b!233762 (= e!151834 (isDefined!203 (getValueByKey!261 (toList!1761 lt!118111) (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!58847 c!38910) b!233760))

(assert (= (and d!58847 (not c!38910)) b!233761))

(assert (= (and d!58847 (not res!114659)) b!233762))

(assert (=> d!58847 m!254531))

(declare-fun m!254633 () Bool)

(assert (=> d!58847 m!254633))

(assert (=> b!233760 m!254531))

(declare-fun m!254635 () Bool)

(assert (=> b!233760 m!254635))

(assert (=> b!233760 m!254531))

(declare-fun m!254637 () Bool)

(assert (=> b!233760 m!254637))

(assert (=> b!233760 m!254637))

(declare-fun m!254639 () Bool)

(assert (=> b!233760 m!254639))

(assert (=> b!233762 m!254531))

(assert (=> b!233762 m!254637))

(assert (=> b!233762 m!254637))

(assert (=> b!233762 m!254639))

(assert (=> b!233676 d!58847))

(declare-fun d!58849 () Bool)

(declare-fun e!151836 () Bool)

(assert (=> d!58849 e!151836))

(declare-fun res!114660 () Bool)

(assert (=> d!58849 (=> res!114660 e!151836)))

(declare-fun lt!118149 () Bool)

(assert (=> d!58849 (= res!114660 (not lt!118149))))

(declare-fun lt!118148 () Bool)

(assert (=> d!58849 (= lt!118149 lt!118148)))

(declare-fun lt!118150 () Unit!7218)

(declare-fun e!151835 () Unit!7218)

(assert (=> d!58849 (= lt!118150 e!151835)))

(declare-fun c!38911 () Bool)

(assert (=> d!58849 (= c!38911 lt!118148)))

(assert (=> d!58849 (= lt!118148 (containsKey!253 (toList!1761 lt!118111) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58849 (= (contains!1634 lt!118111 #b0000000000000000000000000000000000000000000000000000000000000000) lt!118149)))

(declare-fun b!233763 () Bool)

(declare-fun lt!118151 () Unit!7218)

(assert (=> b!233763 (= e!151835 lt!118151)))

(assert (=> b!233763 (= lt!118151 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1761 lt!118111) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233763 (isDefined!203 (getValueByKey!261 (toList!1761 lt!118111) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233764 () Bool)

(declare-fun Unit!7223 () Unit!7218)

(assert (=> b!233764 (= e!151835 Unit!7223)))

(declare-fun b!233765 () Bool)

(assert (=> b!233765 (= e!151836 (isDefined!203 (getValueByKey!261 (toList!1761 lt!118111) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58849 c!38911) b!233763))

(assert (= (and d!58849 (not c!38911)) b!233764))

(assert (= (and d!58849 (not res!114660)) b!233765))

(declare-fun m!254641 () Bool)

(assert (=> d!58849 m!254641))

(declare-fun m!254643 () Bool)

(assert (=> b!233763 m!254643))

(assert (=> b!233763 m!254621))

(assert (=> b!233763 m!254621))

(declare-fun m!254645 () Bool)

(assert (=> b!233763 m!254645))

(assert (=> b!233765 m!254621))

(assert (=> b!233765 m!254621))

(assert (=> b!233765 m!254645))

(assert (=> bm!21720 d!58849))

(declare-fun d!58851 () Bool)

(assert (=> d!58851 (= (validKeyInArray!0 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233683 d!58851))

(declare-fun d!58853 () Bool)

(declare-fun e!151837 () Bool)

(assert (=> d!58853 e!151837))

(declare-fun res!114662 () Bool)

(assert (=> d!58853 (=> (not res!114662) (not e!151837))))

(declare-fun lt!118155 () ListLongMap!3491)

(assert (=> d!58853 (= res!114662 (contains!1634 lt!118155 (_1!2305 (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))

(declare-fun lt!118153 () List!3517)

(assert (=> d!58853 (= lt!118155 (ListLongMap!3492 lt!118153))))

(declare-fun lt!118154 () Unit!7218)

(declare-fun lt!118152 () Unit!7218)

(assert (=> d!58853 (= lt!118154 lt!118152)))

(assert (=> d!58853 (= (getValueByKey!261 lt!118153 (_1!2305 (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))) (Some!266 (_2!2305 (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))

(assert (=> d!58853 (= lt!118152 (lemmaContainsTupThenGetReturnValue!149 lt!118153 (_1!2305 (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))) (_2!2305 (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))

(assert (=> d!58853 (= lt!118153 (insertStrictlySorted!152 (toList!1761 call!21725) (_1!2305 (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))) (_2!2305 (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))

(assert (=> d!58853 (= (+!638 call!21725 (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))) lt!118155)))

(declare-fun b!233766 () Bool)

(declare-fun res!114661 () Bool)

(assert (=> b!233766 (=> (not res!114661) (not e!151837))))

(assert (=> b!233766 (= res!114661 (= (getValueByKey!261 (toList!1761 lt!118155) (_1!2305 (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))) (Some!266 (_2!2305 (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))))

(declare-fun b!233767 () Bool)

(assert (=> b!233767 (= e!151837 (contains!1636 (toList!1761 lt!118155) (tuple2!4589 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))

(assert (= (and d!58853 res!114662) b!233766))

(assert (= (and b!233766 res!114661) b!233767))

(declare-fun m!254647 () Bool)

(assert (=> d!58853 m!254647))

(declare-fun m!254649 () Bool)

(assert (=> d!58853 m!254649))

(declare-fun m!254651 () Bool)

(assert (=> d!58853 m!254651))

(declare-fun m!254653 () Bool)

(assert (=> d!58853 m!254653))

(declare-fun m!254655 () Bool)

(assert (=> b!233766 m!254655))

(declare-fun m!254657 () Bool)

(assert (=> b!233767 m!254657))

(assert (=> b!233682 d!58853))

(declare-fun b!233792 () Bool)

(declare-fun e!151857 () Bool)

(declare-fun e!151855 () Bool)

(assert (=> b!233792 (= e!151857 e!151855)))

(assert (=> b!233792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))))))

(declare-fun res!114671 () Bool)

(declare-fun lt!118172 () ListLongMap!3491)

(assert (=> b!233792 (= res!114671 (contains!1634 lt!118172 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233792 (=> (not res!114671) (not e!151855))))

(declare-fun b!233793 () Bool)

(declare-fun res!114673 () Bool)

(declare-fun e!151853 () Bool)

(assert (=> b!233793 (=> (not res!114673) (not e!151853))))

(assert (=> b!233793 (= res!114673 (not (contains!1634 lt!118172 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!58855 () Bool)

(assert (=> d!58855 e!151853))

(declare-fun res!114674 () Bool)

(assert (=> d!58855 (=> (not res!114674) (not e!151853))))

(assert (=> d!58855 (= res!114674 (not (contains!1634 lt!118172 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!151854 () ListLongMap!3491)

(assert (=> d!58855 (= lt!118172 e!151854)))

(declare-fun c!38923 () Bool)

(assert (=> d!58855 (= c!38923 (bvsge #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))))))

(assert (=> d!58855 (validMask!0 (mask!10280 thiss!1504))))

(assert (=> d!58855 (= (getCurrentListMapNoExtraKeys!521 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)) lt!118172)))

(declare-fun b!233794 () Bool)

(assert (=> b!233794 (= e!151854 (ListLongMap!3492 Nil!3514))))

(declare-fun b!233795 () Bool)

(declare-fun e!151856 () ListLongMap!3491)

(assert (=> b!233795 (= e!151854 e!151856)))

(declare-fun c!38921 () Bool)

(assert (=> b!233795 (= c!38921 (validKeyInArray!0 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233796 () Bool)

(declare-fun call!21732 () ListLongMap!3491)

(assert (=> b!233796 (= e!151856 call!21732)))

(declare-fun b!233797 () Bool)

(declare-fun e!151852 () Bool)

(assert (=> b!233797 (= e!151852 (= lt!118172 (getCurrentListMapNoExtraKeys!521 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4347 thiss!1504))))))

(declare-fun b!233798 () Bool)

(declare-fun isEmpty!511 (ListLongMap!3491) Bool)

(assert (=> b!233798 (= e!151852 (isEmpty!511 lt!118172))))

(declare-fun b!233799 () Bool)

(declare-fun e!151858 () Bool)

(assert (=> b!233799 (= e!151858 (validKeyInArray!0 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233799 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!233800 () Bool)

(assert (=> b!233800 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))))))

(assert (=> b!233800 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5828 (_values!4330 thiss!1504))))))

(assert (=> b!233800 (= e!151855 (= (apply!205 lt!118172 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)) (get!2813 (select (arr!5493 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!539 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233801 () Bool)

(assert (=> b!233801 (= e!151857 e!151852)))

(declare-fun c!38922 () Bool)

(assert (=> b!233801 (= c!38922 (bvslt #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))))))

(declare-fun bm!21729 () Bool)

(assert (=> bm!21729 (= call!21732 (getCurrentListMapNoExtraKeys!521 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4347 thiss!1504)))))

(declare-fun b!233802 () Bool)

(declare-fun lt!118174 () Unit!7218)

(declare-fun lt!118171 () Unit!7218)

(assert (=> b!233802 (= lt!118174 lt!118171)))

(declare-fun lt!118176 () (_ BitVec 64))

(declare-fun lt!118173 () V!7857)

(declare-fun lt!118170 () (_ BitVec 64))

(declare-fun lt!118175 () ListLongMap!3491)

(assert (=> b!233802 (not (contains!1634 (+!638 lt!118175 (tuple2!4589 lt!118176 lt!118173)) lt!118170))))

(declare-fun addStillNotContains!113 (ListLongMap!3491 (_ BitVec 64) V!7857 (_ BitVec 64)) Unit!7218)

(assert (=> b!233802 (= lt!118171 (addStillNotContains!113 lt!118175 lt!118176 lt!118173 lt!118170))))

(assert (=> b!233802 (= lt!118170 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!233802 (= lt!118173 (get!2813 (select (arr!5493 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!539 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!233802 (= lt!118176 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233802 (= lt!118175 call!21732)))

(assert (=> b!233802 (= e!151856 (+!638 call!21732 (tuple2!4589 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000) (get!2813 (select (arr!5493 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!539 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!233803 () Bool)

(assert (=> b!233803 (= e!151853 e!151857)))

(declare-fun c!38920 () Bool)

(assert (=> b!233803 (= c!38920 e!151858)))

(declare-fun res!114672 () Bool)

(assert (=> b!233803 (=> (not res!114672) (not e!151858))))

(assert (=> b!233803 (= res!114672 (bvslt #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))))))

(assert (= (and d!58855 c!38923) b!233794))

(assert (= (and d!58855 (not c!38923)) b!233795))

(assert (= (and b!233795 c!38921) b!233802))

(assert (= (and b!233795 (not c!38921)) b!233796))

(assert (= (or b!233802 b!233796) bm!21729))

(assert (= (and d!58855 res!114674) b!233793))

(assert (= (and b!233793 res!114673) b!233803))

(assert (= (and b!233803 res!114672) b!233799))

(assert (= (and b!233803 c!38920) b!233792))

(assert (= (and b!233803 (not c!38920)) b!233801))

(assert (= (and b!233792 res!114671) b!233800))

(assert (= (and b!233801 c!38922) b!233797))

(assert (= (and b!233801 (not c!38922)) b!233798))

(declare-fun b_lambda!7845 () Bool)

(assert (=> (not b_lambda!7845) (not b!233800)))

(assert (=> b!233800 t!8474))

(declare-fun b_and!13183 () Bool)

(assert (= b_and!13181 (and (=> t!8474 result!5083) b_and!13183)))

(declare-fun b_lambda!7847 () Bool)

(assert (=> (not b_lambda!7847) (not b!233802)))

(assert (=> b!233802 t!8474))

(declare-fun b_and!13185 () Bool)

(assert (= b_and!13183 (and (=> t!8474 result!5083) b_and!13185)))

(declare-fun m!254659 () Bool)

(assert (=> d!58855 m!254659))

(assert (=> d!58855 m!254477))

(assert (=> b!233795 m!254531))

(assert (=> b!233795 m!254531))

(assert (=> b!233795 m!254571))

(declare-fun m!254661 () Bool)

(assert (=> b!233793 m!254661))

(declare-fun m!254663 () Bool)

(assert (=> bm!21729 m!254663))

(declare-fun m!254665 () Bool)

(assert (=> b!233798 m!254665))

(assert (=> b!233792 m!254531))

(assert (=> b!233792 m!254531))

(declare-fun m!254667 () Bool)

(assert (=> b!233792 m!254667))

(declare-fun m!254669 () Bool)

(assert (=> b!233802 m!254669))

(assert (=> b!233802 m!254579))

(assert (=> b!233802 m!254581))

(assert (=> b!233802 m!254579))

(assert (=> b!233802 m!254581))

(assert (=> b!233802 m!254583))

(declare-fun m!254671 () Bool)

(assert (=> b!233802 m!254671))

(assert (=> b!233802 m!254531))

(declare-fun m!254673 () Bool)

(assert (=> b!233802 m!254673))

(assert (=> b!233802 m!254669))

(declare-fun m!254675 () Bool)

(assert (=> b!233802 m!254675))

(assert (=> b!233800 m!254579))

(assert (=> b!233800 m!254581))

(assert (=> b!233800 m!254579))

(assert (=> b!233800 m!254581))

(assert (=> b!233800 m!254583))

(assert (=> b!233800 m!254531))

(declare-fun m!254677 () Bool)

(assert (=> b!233800 m!254677))

(assert (=> b!233800 m!254531))

(assert (=> b!233799 m!254531))

(assert (=> b!233799 m!254531))

(assert (=> b!233799 m!254571))

(assert (=> b!233797 m!254663))

(assert (=> bm!21726 d!58855))

(declare-fun b!233814 () Bool)

(declare-fun e!151868 () Bool)

(declare-fun call!21735 () Bool)

(assert (=> b!233814 (= e!151868 call!21735)))

(declare-fun bm!21732 () Bool)

(declare-fun c!38926 () Bool)

(assert (=> bm!21732 (= call!21735 (arrayNoDuplicates!0 (_keys!6405 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!38926 (Cons!3515 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000) Nil!3516) Nil!3516)))))

(declare-fun b!233815 () Bool)

(declare-fun e!151870 () Bool)

(declare-fun contains!1637 (List!3519 (_ BitVec 64)) Bool)

(assert (=> b!233815 (= e!151870 (contains!1637 Nil!3516 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233816 () Bool)

(declare-fun e!151867 () Bool)

(declare-fun e!151869 () Bool)

(assert (=> b!233816 (= e!151867 e!151869)))

(declare-fun res!114682 () Bool)

(assert (=> b!233816 (=> (not res!114682) (not e!151869))))

(assert (=> b!233816 (= res!114682 (not e!151870))))

(declare-fun res!114681 () Bool)

(assert (=> b!233816 (=> (not res!114681) (not e!151870))))

(assert (=> b!233816 (= res!114681 (validKeyInArray!0 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58857 () Bool)

(declare-fun res!114683 () Bool)

(assert (=> d!58857 (=> res!114683 e!151867)))

(assert (=> d!58857 (= res!114683 (bvsge #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))))))

(assert (=> d!58857 (= (arrayNoDuplicates!0 (_keys!6405 thiss!1504) #b00000000000000000000000000000000 Nil!3516) e!151867)))

(declare-fun b!233817 () Bool)

(assert (=> b!233817 (= e!151868 call!21735)))

(declare-fun b!233818 () Bool)

(assert (=> b!233818 (= e!151869 e!151868)))

(assert (=> b!233818 (= c!38926 (validKeyInArray!0 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58857 (not res!114683)) b!233816))

(assert (= (and b!233816 res!114681) b!233815))

(assert (= (and b!233816 res!114682) b!233818))

(assert (= (and b!233818 c!38926) b!233817))

(assert (= (and b!233818 (not c!38926)) b!233814))

(assert (= (or b!233817 b!233814) bm!21732))

(assert (=> bm!21732 m!254531))

(declare-fun m!254679 () Bool)

(assert (=> bm!21732 m!254679))

(assert (=> b!233815 m!254531))

(assert (=> b!233815 m!254531))

(declare-fun m!254681 () Bool)

(assert (=> b!233815 m!254681))

(assert (=> b!233816 m!254531))

(assert (=> b!233816 m!254531))

(assert (=> b!233816 m!254571))

(assert (=> b!233818 m!254531))

(assert (=> b!233818 m!254531))

(assert (=> b!233818 m!254571))

(assert (=> b!233620 d!58857))

(declare-fun d!58859 () Bool)

(declare-fun e!151872 () Bool)

(assert (=> d!58859 e!151872))

(declare-fun res!114684 () Bool)

(assert (=> d!58859 (=> res!114684 e!151872)))

(declare-fun lt!118178 () Bool)

(assert (=> d!58859 (= res!114684 (not lt!118178))))

(declare-fun lt!118177 () Bool)

(assert (=> d!58859 (= lt!118178 lt!118177)))

(declare-fun lt!118179 () Unit!7218)

(declare-fun e!151871 () Unit!7218)

(assert (=> d!58859 (= lt!118179 e!151871)))

(declare-fun c!38927 () Bool)

(assert (=> d!58859 (= c!38927 lt!118177)))

(assert (=> d!58859 (= lt!118177 (containsKey!253 (toList!1761 lt!118111) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58859 (= (contains!1634 lt!118111 #b1000000000000000000000000000000000000000000000000000000000000000) lt!118178)))

(declare-fun b!233819 () Bool)

(declare-fun lt!118180 () Unit!7218)

(assert (=> b!233819 (= e!151871 lt!118180)))

(assert (=> b!233819 (= lt!118180 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1761 lt!118111) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233819 (isDefined!203 (getValueByKey!261 (toList!1761 lt!118111) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233820 () Bool)

(declare-fun Unit!7224 () Unit!7218)

(assert (=> b!233820 (= e!151871 Unit!7224)))

(declare-fun b!233821 () Bool)

(assert (=> b!233821 (= e!151872 (isDefined!203 (getValueByKey!261 (toList!1761 lt!118111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58859 c!38927) b!233819))

(assert (= (and d!58859 (not c!38927)) b!233820))

(assert (= (and d!58859 (not res!114684)) b!233821))

(declare-fun m!254683 () Bool)

(assert (=> d!58859 m!254683))

(declare-fun m!254685 () Bool)

(assert (=> b!233819 m!254685))

(declare-fun m!254687 () Bool)

(assert (=> b!233819 m!254687))

(assert (=> b!233819 m!254687))

(declare-fun m!254689 () Bool)

(assert (=> b!233819 m!254689))

(assert (=> b!233821 m!254687))

(assert (=> b!233821 m!254687))

(assert (=> b!233821 m!254689))

(assert (=> bm!21725 d!58859))

(declare-fun b!233830 () Bool)

(declare-fun e!151880 () Bool)

(declare-fun call!21738 () Bool)

(assert (=> b!233830 (= e!151880 call!21738)))

(declare-fun b!233831 () Bool)

(declare-fun e!151879 () Bool)

(declare-fun e!151881 () Bool)

(assert (=> b!233831 (= e!151879 e!151881)))

(declare-fun c!38930 () Bool)

(assert (=> b!233831 (= c!38930 (validKeyInArray!0 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233832 () Bool)

(assert (=> b!233832 (= e!151881 e!151880)))

(declare-fun lt!118187 () (_ BitVec 64))

(assert (=> b!233832 (= lt!118187 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118189 () Unit!7218)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11555 (_ BitVec 64) (_ BitVec 32)) Unit!7218)

(assert (=> b!233832 (= lt!118189 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6405 thiss!1504) lt!118187 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233832 (arrayContainsKey!0 (_keys!6405 thiss!1504) lt!118187 #b00000000000000000000000000000000)))

(declare-fun lt!118188 () Unit!7218)

(assert (=> b!233832 (= lt!118188 lt!118189)))

(declare-fun res!114690 () Bool)

(assert (=> b!233832 (= res!114690 (= (seekEntryOrOpen!0 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000) (_keys!6405 thiss!1504) (mask!10280 thiss!1504)) (Found!982 #b00000000000000000000000000000000)))))

(assert (=> b!233832 (=> (not res!114690) (not e!151880))))

(declare-fun d!58861 () Bool)

(declare-fun res!114689 () Bool)

(assert (=> d!58861 (=> res!114689 e!151879)))

(assert (=> d!58861 (= res!114689 (bvsge #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))))))

(assert (=> d!58861 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6405 thiss!1504) (mask!10280 thiss!1504)) e!151879)))

(declare-fun bm!21735 () Bool)

(assert (=> bm!21735 (= call!21738 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6405 thiss!1504) (mask!10280 thiss!1504)))))

(declare-fun b!233833 () Bool)

(assert (=> b!233833 (= e!151881 call!21738)))

(assert (= (and d!58861 (not res!114689)) b!233831))

(assert (= (and b!233831 c!38930) b!233832))

(assert (= (and b!233831 (not c!38930)) b!233833))

(assert (= (and b!233832 res!114690) b!233830))

(assert (= (or b!233830 b!233833) bm!21735))

(assert (=> b!233831 m!254531))

(assert (=> b!233831 m!254531))

(assert (=> b!233831 m!254571))

(assert (=> b!233832 m!254531))

(declare-fun m!254691 () Bool)

(assert (=> b!233832 m!254691))

(declare-fun m!254693 () Bool)

(assert (=> b!233832 m!254693))

(assert (=> b!233832 m!254531))

(declare-fun m!254695 () Bool)

(assert (=> b!233832 m!254695))

(declare-fun m!254697 () Bool)

(assert (=> bm!21735 m!254697))

(assert (=> b!233619 d!58861))

(declare-fun d!58863 () Bool)

(assert (=> d!58863 (= (apply!205 lt!118111 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)) (get!2814 (getValueByKey!261 (toList!1761 lt!118111) (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8641 () Bool)

(assert (= bs!8641 d!58863))

(assert (=> bs!8641 m!254531))

(assert (=> bs!8641 m!254637))

(assert (=> bs!8641 m!254637))

(declare-fun m!254699 () Bool)

(assert (=> bs!8641 m!254699))

(assert (=> b!233675 d!58863))

(declare-fun d!58865 () Bool)

(declare-fun c!38933 () Bool)

(assert (=> d!58865 (= c!38933 ((_ is ValueCellFull!2735) (select (arr!5493 (_values!4330 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!151884 () V!7857)

(assert (=> d!58865 (= (get!2813 (select (arr!5493 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!539 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!151884)))

(declare-fun b!233838 () Bool)

(declare-fun get!2815 (ValueCell!2735 V!7857) V!7857)

(assert (=> b!233838 (= e!151884 (get!2815 (select (arr!5493 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!539 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!233839 () Bool)

(declare-fun get!2816 (ValueCell!2735 V!7857) V!7857)

(assert (=> b!233839 (= e!151884 (get!2816 (select (arr!5493 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!539 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58865 c!38933) b!233838))

(assert (= (and d!58865 (not c!38933)) b!233839))

(assert (=> b!233838 m!254579))

(assert (=> b!233838 m!254581))

(declare-fun m!254701 () Bool)

(assert (=> b!233838 m!254701))

(assert (=> b!233839 m!254579))

(assert (=> b!233839 m!254581))

(declare-fun m!254703 () Bool)

(assert (=> b!233839 m!254703))

(assert (=> b!233675 d!58865))

(declare-fun d!58867 () Bool)

(declare-fun res!114695 () Bool)

(declare-fun e!151889 () Bool)

(assert (=> d!58867 (=> res!114695 e!151889)))

(assert (=> d!58867 (= res!114695 (and ((_ is Cons!3513) (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))) (= (_1!2305 (h!4162 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))))) key!932)))))

(assert (=> d!58867 (= (containsKey!253 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932) e!151889)))

(declare-fun b!233844 () Bool)

(declare-fun e!151890 () Bool)

(assert (=> b!233844 (= e!151889 e!151890)))

(declare-fun res!114696 () Bool)

(assert (=> b!233844 (=> (not res!114696) (not e!151890))))

(assert (=> b!233844 (= res!114696 (and (or (not ((_ is Cons!3513) (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))))) (bvsle (_1!2305 (h!4162 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))))) key!932)) ((_ is Cons!3513) (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))) (bvslt (_1!2305 (h!4162 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))))) key!932)))))

(declare-fun b!233845 () Bool)

(assert (=> b!233845 (= e!151890 (containsKey!253 (t!8471 (toList!1761 (getCurrentListMap!1270 (_keys!6405 thiss!1504) (_values!4330 thiss!1504) (mask!10280 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))) key!932))))

(assert (= (and d!58867 (not res!114695)) b!233844))

(assert (= (and b!233844 res!114696) b!233845))

(declare-fun m!254705 () Bool)

(assert (=> b!233845 m!254705))

(assert (=> d!58823 d!58867))

(declare-fun b!233854 () Bool)

(declare-fun e!151896 () (_ BitVec 32))

(declare-fun call!21741 () (_ BitVec 32))

(assert (=> b!233854 (= e!151896 call!21741)))

(declare-fun bm!21738 () Bool)

(assert (=> bm!21738 (= call!21741 (arrayCountValidKeys!0 (_keys!6405 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5829 (_keys!6405 thiss!1504))))))

(declare-fun b!233855 () Bool)

(declare-fun e!151895 () (_ BitVec 32))

(assert (=> b!233855 (= e!151895 e!151896)))

(declare-fun c!38939 () Bool)

(assert (=> b!233855 (= c!38939 (validKeyInArray!0 (select (arr!5494 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233856 () Bool)

(assert (=> b!233856 (= e!151896 (bvadd #b00000000000000000000000000000001 call!21741))))

(declare-fun d!58869 () Bool)

(declare-fun lt!118192 () (_ BitVec 32))

(assert (=> d!58869 (and (bvsge lt!118192 #b00000000000000000000000000000000) (bvsle lt!118192 (bvsub (size!5829 (_keys!6405 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58869 (= lt!118192 e!151895)))

(declare-fun c!38938 () Bool)

(assert (=> d!58869 (= c!38938 (bvsge #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))))))

(assert (=> d!58869 (and (bvsle #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5829 (_keys!6405 thiss!1504)) (size!5829 (_keys!6405 thiss!1504))))))

(assert (=> d!58869 (= (arrayCountValidKeys!0 (_keys!6405 thiss!1504) #b00000000000000000000000000000000 (size!5829 (_keys!6405 thiss!1504))) lt!118192)))

(declare-fun b!233857 () Bool)

(assert (=> b!233857 (= e!151895 #b00000000000000000000000000000000)))

(assert (= (and d!58869 c!38938) b!233857))

(assert (= (and d!58869 (not c!38938)) b!233855))

(assert (= (and b!233855 c!38939) b!233856))

(assert (= (and b!233855 (not c!38939)) b!233854))

(assert (= (or b!233856 b!233854) bm!21738))

(declare-fun m!254707 () Bool)

(assert (=> bm!21738 m!254707))

(assert (=> b!233855 m!254531))

(assert (=> b!233855 m!254531))

(assert (=> b!233855 m!254571))

(assert (=> b!233618 d!58869))

(declare-fun d!58871 () Bool)

(declare-fun res!114705 () Bool)

(declare-fun e!151899 () Bool)

(assert (=> d!58871 (=> (not res!114705) (not e!151899))))

(assert (=> d!58871 (= res!114705 (validMask!0 (mask!10280 thiss!1504)))))

(assert (=> d!58871 (= (simpleValid!228 thiss!1504) e!151899)))

(declare-fun b!233866 () Bool)

(declare-fun res!114707 () Bool)

(assert (=> b!233866 (=> (not res!114707) (not e!151899))))

(assert (=> b!233866 (= res!114707 (and (= (size!5828 (_values!4330 thiss!1504)) (bvadd (mask!10280 thiss!1504) #b00000000000000000000000000000001)) (= (size!5829 (_keys!6405 thiss!1504)) (size!5828 (_values!4330 thiss!1504))) (bvsge (_size!1734 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1734 thiss!1504) (bvadd (mask!10280 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!233868 () Bool)

(declare-fun res!114706 () Bool)

(assert (=> b!233868 (=> (not res!114706) (not e!151899))))

(declare-fun size!5834 (LongMapFixedSize!3370) (_ BitVec 32))

(assert (=> b!233868 (= res!114706 (= (size!5834 thiss!1504) (bvadd (_size!1734 thiss!1504) (bvsdiv (bvadd (extraKeys!4084 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!233869 () Bool)

(assert (=> b!233869 (= e!151899 (and (bvsge (extraKeys!4084 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4084 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1734 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!233867 () Bool)

(declare-fun res!114708 () Bool)

(assert (=> b!233867 (=> (not res!114708) (not e!151899))))

(assert (=> b!233867 (= res!114708 (bvsge (size!5834 thiss!1504) (_size!1734 thiss!1504)))))

(assert (= (and d!58871 res!114705) b!233866))

(assert (= (and b!233866 res!114707) b!233867))

(assert (= (and b!233867 res!114708) b!233868))

(assert (= (and b!233868 res!114706) b!233869))

(assert (=> d!58871 m!254477))

(declare-fun m!254709 () Bool)

(assert (=> b!233868 m!254709))

(assert (=> b!233867 m!254709))

(assert (=> d!58821 d!58871))

(assert (=> b!233679 d!58851))

(declare-fun d!58873 () Bool)

(declare-fun e!151900 () Bool)

(assert (=> d!58873 e!151900))

(declare-fun res!114710 () Bool)

(assert (=> d!58873 (=> (not res!114710) (not e!151900))))

(declare-fun lt!118196 () ListLongMap!3491)

(assert (=> d!58873 (= res!114710 (contains!1634 lt!118196 (_1!2305 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504)))))))

(declare-fun lt!118194 () List!3517)

(assert (=> d!58873 (= lt!118196 (ListLongMap!3492 lt!118194))))

(declare-fun lt!118195 () Unit!7218)

(declare-fun lt!118193 () Unit!7218)

(assert (=> d!58873 (= lt!118195 lt!118193)))

(assert (=> d!58873 (= (getValueByKey!261 lt!118194 (_1!2305 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504)))) (Some!266 (_2!2305 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504)))))))

(assert (=> d!58873 (= lt!118193 (lemmaContainsTupThenGetReturnValue!149 lt!118194 (_1!2305 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504))) (_2!2305 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504)))))))

(assert (=> d!58873 (= lt!118194 (insertStrictlySorted!152 (toList!1761 lt!118107) (_1!2305 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504))) (_2!2305 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504)))))))

(assert (=> d!58873 (= (+!638 lt!118107 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504))) lt!118196)))

(declare-fun b!233870 () Bool)

(declare-fun res!114709 () Bool)

(assert (=> b!233870 (=> (not res!114709) (not e!151900))))

(assert (=> b!233870 (= res!114709 (= (getValueByKey!261 (toList!1761 lt!118196) (_1!2305 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504)))) (Some!266 (_2!2305 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504))))))))

(declare-fun b!233871 () Bool)

(assert (=> b!233871 (= e!151900 (contains!1636 (toList!1761 lt!118196) (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504))))))

(assert (= (and d!58873 res!114710) b!233870))

(assert (= (and b!233870 res!114709) b!233871))

(declare-fun m!254711 () Bool)

(assert (=> d!58873 m!254711))

(declare-fun m!254713 () Bool)

(assert (=> d!58873 m!254713))

(declare-fun m!254715 () Bool)

(assert (=> d!58873 m!254715))

(declare-fun m!254717 () Bool)

(assert (=> d!58873 m!254717))

(declare-fun m!254719 () Bool)

(assert (=> b!233870 m!254719))

(declare-fun m!254721 () Bool)

(assert (=> b!233871 m!254721))

(assert (=> b!233678 d!58873))

(declare-fun d!58875 () Bool)

(assert (=> d!58875 (= (apply!205 (+!638 lt!118104 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504))) lt!118098) (apply!205 lt!118104 lt!118098))))

(declare-fun lt!118199 () Unit!7218)

(declare-fun choose!1103 (ListLongMap!3491 (_ BitVec 64) V!7857 (_ BitVec 64)) Unit!7218)

(assert (=> d!58875 (= lt!118199 (choose!1103 lt!118104 lt!118102 (minValue!4188 thiss!1504) lt!118098))))

(declare-fun e!151903 () Bool)

(assert (=> d!58875 e!151903))

(declare-fun res!114713 () Bool)

(assert (=> d!58875 (=> (not res!114713) (not e!151903))))

(assert (=> d!58875 (= res!114713 (contains!1634 lt!118104 lt!118098))))

(assert (=> d!58875 (= (addApplyDifferent!181 lt!118104 lt!118102 (minValue!4188 thiss!1504) lt!118098) lt!118199)))

(declare-fun b!233875 () Bool)

(assert (=> b!233875 (= e!151903 (not (= lt!118098 lt!118102)))))

(assert (= (and d!58875 res!114713) b!233875))

(declare-fun m!254723 () Bool)

(assert (=> d!58875 m!254723))

(assert (=> d!58875 m!254565))

(assert (=> d!58875 m!254535))

(assert (=> d!58875 m!254545))

(declare-fun m!254725 () Bool)

(assert (=> d!58875 m!254725))

(assert (=> d!58875 m!254535))

(assert (=> b!233678 d!58875))

(declare-fun d!58877 () Bool)

(declare-fun e!151905 () Bool)

(assert (=> d!58877 e!151905))

(declare-fun res!114714 () Bool)

(assert (=> d!58877 (=> res!114714 e!151905)))

(declare-fun lt!118201 () Bool)

(assert (=> d!58877 (= res!114714 (not lt!118201))))

(declare-fun lt!118200 () Bool)

(assert (=> d!58877 (= lt!118201 lt!118200)))

(declare-fun lt!118202 () Unit!7218)

(declare-fun e!151904 () Unit!7218)

(assert (=> d!58877 (= lt!118202 e!151904)))

(declare-fun c!38940 () Bool)

(assert (=> d!58877 (= c!38940 lt!118200)))

(assert (=> d!58877 (= lt!118200 (containsKey!253 (toList!1761 (+!638 lt!118107 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504)))) lt!118094))))

(assert (=> d!58877 (= (contains!1634 (+!638 lt!118107 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504))) lt!118094) lt!118201)))

(declare-fun b!233876 () Bool)

(declare-fun lt!118203 () Unit!7218)

(assert (=> b!233876 (= e!151904 lt!118203)))

(assert (=> b!233876 (= lt!118203 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1761 (+!638 lt!118107 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504)))) lt!118094))))

(assert (=> b!233876 (isDefined!203 (getValueByKey!261 (toList!1761 (+!638 lt!118107 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504)))) lt!118094))))

(declare-fun b!233877 () Bool)

(declare-fun Unit!7225 () Unit!7218)

(assert (=> b!233877 (= e!151904 Unit!7225)))

(declare-fun b!233878 () Bool)

(assert (=> b!233878 (= e!151905 (isDefined!203 (getValueByKey!261 (toList!1761 (+!638 lt!118107 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504)))) lt!118094)))))

(assert (= (and d!58877 c!38940) b!233876))

(assert (= (and d!58877 (not c!38940)) b!233877))

(assert (= (and d!58877 (not res!114714)) b!233878))

(declare-fun m!254727 () Bool)

(assert (=> d!58877 m!254727))

(declare-fun m!254729 () Bool)

(assert (=> b!233876 m!254729))

(declare-fun m!254731 () Bool)

(assert (=> b!233876 m!254731))

(assert (=> b!233876 m!254731))

(declare-fun m!254733 () Bool)

(assert (=> b!233876 m!254733))

(assert (=> b!233878 m!254731))

(assert (=> b!233878 m!254731))

(assert (=> b!233878 m!254733))

(assert (=> b!233678 d!58877))

(declare-fun d!58879 () Bool)

(assert (=> d!58879 (= (apply!205 (+!638 lt!118104 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504))) lt!118098) (get!2814 (getValueByKey!261 (toList!1761 (+!638 lt!118104 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504)))) lt!118098)))))

(declare-fun bs!8642 () Bool)

(assert (= bs!8642 d!58879))

(declare-fun m!254735 () Bool)

(assert (=> bs!8642 m!254735))

(assert (=> bs!8642 m!254735))

(declare-fun m!254737 () Bool)

(assert (=> bs!8642 m!254737))

(assert (=> b!233678 d!58879))

(declare-fun d!58881 () Bool)

(assert (=> d!58881 (= (apply!205 (+!638 lt!118097 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504))) lt!118103) (get!2814 (getValueByKey!261 (toList!1761 (+!638 lt!118097 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504)))) lt!118103)))))

(declare-fun bs!8643 () Bool)

(assert (= bs!8643 d!58881))

(declare-fun m!254739 () Bool)

(assert (=> bs!8643 m!254739))

(assert (=> bs!8643 m!254739))

(declare-fun m!254741 () Bool)

(assert (=> bs!8643 m!254741))

(assert (=> b!233678 d!58881))

(declare-fun d!58883 () Bool)

(assert (=> d!58883 (contains!1634 (+!638 lt!118107 (tuple2!4589 lt!118096 (zeroValue!4188 thiss!1504))) lt!118094)))

(declare-fun lt!118206 () Unit!7218)

(declare-fun choose!1104 (ListLongMap!3491 (_ BitVec 64) V!7857 (_ BitVec 64)) Unit!7218)

(assert (=> d!58883 (= lt!118206 (choose!1104 lt!118107 lt!118096 (zeroValue!4188 thiss!1504) lt!118094))))

(assert (=> d!58883 (contains!1634 lt!118107 lt!118094)))

(assert (=> d!58883 (= (addStillContains!181 lt!118107 lt!118096 (zeroValue!4188 thiss!1504) lt!118094) lt!118206)))

(declare-fun bs!8644 () Bool)

(assert (= bs!8644 d!58883))

(assert (=> bs!8644 m!254559))

(assert (=> bs!8644 m!254559))

(assert (=> bs!8644 m!254561))

(declare-fun m!254743 () Bool)

(assert (=> bs!8644 m!254743))

(declare-fun m!254745 () Bool)

(assert (=> bs!8644 m!254745))

(assert (=> b!233678 d!58883))

(declare-fun d!58885 () Bool)

(assert (=> d!58885 (= (apply!205 (+!638 lt!118100 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504))) lt!118095) (get!2814 (getValueByKey!261 (toList!1761 (+!638 lt!118100 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504)))) lt!118095)))))

(declare-fun bs!8645 () Bool)

(assert (= bs!8645 d!58885))

(declare-fun m!254747 () Bool)

(assert (=> bs!8645 m!254747))

(assert (=> bs!8645 m!254747))

(declare-fun m!254749 () Bool)

(assert (=> bs!8645 m!254749))

(assert (=> b!233678 d!58885))

(declare-fun d!58887 () Bool)

(assert (=> d!58887 (= (apply!205 (+!638 lt!118100 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504))) lt!118095) (apply!205 lt!118100 lt!118095))))

(declare-fun lt!118207 () Unit!7218)

(assert (=> d!58887 (= lt!118207 (choose!1103 lt!118100 lt!118092 (minValue!4188 thiss!1504) lt!118095))))

(declare-fun e!151906 () Bool)

(assert (=> d!58887 e!151906))

(declare-fun res!114715 () Bool)

(assert (=> d!58887 (=> (not res!114715) (not e!151906))))

(assert (=> d!58887 (= res!114715 (contains!1634 lt!118100 lt!118095))))

(assert (=> d!58887 (= (addApplyDifferent!181 lt!118100 lt!118092 (minValue!4188 thiss!1504) lt!118095) lt!118207)))

(declare-fun b!233880 () Bool)

(assert (=> b!233880 (= e!151906 (not (= lt!118095 lt!118092)))))

(assert (= (and d!58887 res!114715) b!233880))

(declare-fun m!254751 () Bool)

(assert (=> d!58887 m!254751))

(assert (=> d!58887 m!254551))

(assert (=> d!58887 m!254547))

(assert (=> d!58887 m!254553))

(declare-fun m!254753 () Bool)

(assert (=> d!58887 m!254753))

(assert (=> d!58887 m!254547))

(assert (=> b!233678 d!58887))

(declare-fun d!58889 () Bool)

(declare-fun e!151907 () Bool)

(assert (=> d!58889 e!151907))

(declare-fun res!114717 () Bool)

(assert (=> d!58889 (=> (not res!114717) (not e!151907))))

(declare-fun lt!118211 () ListLongMap!3491)

(assert (=> d!58889 (= res!114717 (contains!1634 lt!118211 (_1!2305 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504)))))))

(declare-fun lt!118209 () List!3517)

(assert (=> d!58889 (= lt!118211 (ListLongMap!3492 lt!118209))))

(declare-fun lt!118210 () Unit!7218)

(declare-fun lt!118208 () Unit!7218)

(assert (=> d!58889 (= lt!118210 lt!118208)))

(assert (=> d!58889 (= (getValueByKey!261 lt!118209 (_1!2305 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504)))) (Some!266 (_2!2305 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504)))))))

(assert (=> d!58889 (= lt!118208 (lemmaContainsTupThenGetReturnValue!149 lt!118209 (_1!2305 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504))) (_2!2305 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504)))))))

(assert (=> d!58889 (= lt!118209 (insertStrictlySorted!152 (toList!1761 lt!118097) (_1!2305 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504))) (_2!2305 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504)))))))

(assert (=> d!58889 (= (+!638 lt!118097 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504))) lt!118211)))

(declare-fun b!233881 () Bool)

(declare-fun res!114716 () Bool)

(assert (=> b!233881 (=> (not res!114716) (not e!151907))))

(assert (=> b!233881 (= res!114716 (= (getValueByKey!261 (toList!1761 lt!118211) (_1!2305 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504)))) (Some!266 (_2!2305 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504))))))))

(declare-fun b!233882 () Bool)

(assert (=> b!233882 (= e!151907 (contains!1636 (toList!1761 lt!118211) (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504))))))

(assert (= (and d!58889 res!114717) b!233881))

(assert (= (and b!233881 res!114716) b!233882))

(declare-fun m!254755 () Bool)

(assert (=> d!58889 m!254755))

(declare-fun m!254757 () Bool)

(assert (=> d!58889 m!254757))

(declare-fun m!254759 () Bool)

(assert (=> d!58889 m!254759))

(declare-fun m!254761 () Bool)

(assert (=> d!58889 m!254761))

(declare-fun m!254763 () Bool)

(assert (=> b!233881 m!254763))

(declare-fun m!254765 () Bool)

(assert (=> b!233882 m!254765))

(assert (=> b!233678 d!58889))

(declare-fun d!58891 () Bool)

(declare-fun e!151908 () Bool)

(assert (=> d!58891 e!151908))

(declare-fun res!114719 () Bool)

(assert (=> d!58891 (=> (not res!114719) (not e!151908))))

(declare-fun lt!118215 () ListLongMap!3491)

(assert (=> d!58891 (= res!114719 (contains!1634 lt!118215 (_1!2305 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504)))))))

(declare-fun lt!118213 () List!3517)

(assert (=> d!58891 (= lt!118215 (ListLongMap!3492 lt!118213))))

(declare-fun lt!118214 () Unit!7218)

(declare-fun lt!118212 () Unit!7218)

(assert (=> d!58891 (= lt!118214 lt!118212)))

(assert (=> d!58891 (= (getValueByKey!261 lt!118213 (_1!2305 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504)))) (Some!266 (_2!2305 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504)))))))

(assert (=> d!58891 (= lt!118212 (lemmaContainsTupThenGetReturnValue!149 lt!118213 (_1!2305 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504))) (_2!2305 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504)))))))

(assert (=> d!58891 (= lt!118213 (insertStrictlySorted!152 (toList!1761 lt!118104) (_1!2305 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504))) (_2!2305 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504)))))))

(assert (=> d!58891 (= (+!638 lt!118104 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504))) lt!118215)))

(declare-fun b!233883 () Bool)

(declare-fun res!114718 () Bool)

(assert (=> b!233883 (=> (not res!114718) (not e!151908))))

(assert (=> b!233883 (= res!114718 (= (getValueByKey!261 (toList!1761 lt!118215) (_1!2305 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504)))) (Some!266 (_2!2305 (tuple2!4589 lt!118102 (minValue!4188 thiss!1504))))))))

(declare-fun b!233884 () Bool)

(assert (=> b!233884 (= e!151908 (contains!1636 (toList!1761 lt!118215) (tuple2!4589 lt!118102 (minValue!4188 thiss!1504))))))

(assert (= (and d!58891 res!114719) b!233883))

(assert (= (and b!233883 res!114718) b!233884))

(declare-fun m!254767 () Bool)

(assert (=> d!58891 m!254767))

(declare-fun m!254769 () Bool)

(assert (=> d!58891 m!254769))

(declare-fun m!254771 () Bool)

(assert (=> d!58891 m!254771))

(declare-fun m!254773 () Bool)

(assert (=> d!58891 m!254773))

(declare-fun m!254775 () Bool)

(assert (=> b!233883 m!254775))

(declare-fun m!254777 () Bool)

(assert (=> b!233884 m!254777))

(assert (=> b!233678 d!58891))

(declare-fun d!58893 () Bool)

(assert (=> d!58893 (= (apply!205 (+!638 lt!118097 (tuple2!4589 lt!118101 (zeroValue!4188 thiss!1504))) lt!118103) (apply!205 lt!118097 lt!118103))))

(declare-fun lt!118216 () Unit!7218)

(assert (=> d!58893 (= lt!118216 (choose!1103 lt!118097 lt!118101 (zeroValue!4188 thiss!1504) lt!118103))))

(declare-fun e!151909 () Bool)

(assert (=> d!58893 e!151909))

(declare-fun res!114720 () Bool)

(assert (=> d!58893 (=> (not res!114720) (not e!151909))))

(assert (=> d!58893 (= res!114720 (contains!1634 lt!118097 lt!118103))))

(assert (=> d!58893 (= (addApplyDifferent!181 lt!118097 lt!118101 (zeroValue!4188 thiss!1504) lt!118103) lt!118216)))

(declare-fun b!233885 () Bool)

(assert (=> b!233885 (= e!151909 (not (= lt!118103 lt!118101)))))

(assert (= (and d!58893 res!114720) b!233885))

(declare-fun m!254779 () Bool)

(assert (=> d!58893 m!254779))

(assert (=> d!58893 m!254541))

(assert (=> d!58893 m!254537))

(assert (=> d!58893 m!254539))

(declare-fun m!254781 () Bool)

(assert (=> d!58893 m!254781))

(assert (=> d!58893 m!254537))

(assert (=> b!233678 d!58893))

(declare-fun d!58895 () Bool)

(assert (=> d!58895 (= (apply!205 lt!118100 lt!118095) (get!2814 (getValueByKey!261 (toList!1761 lt!118100) lt!118095)))))

(declare-fun bs!8646 () Bool)

(assert (= bs!8646 d!58895))

(declare-fun m!254783 () Bool)

(assert (=> bs!8646 m!254783))

(assert (=> bs!8646 m!254783))

(declare-fun m!254785 () Bool)

(assert (=> bs!8646 m!254785))

(assert (=> b!233678 d!58895))

(assert (=> b!233678 d!58855))

(declare-fun d!58897 () Bool)

(declare-fun e!151910 () Bool)

(assert (=> d!58897 e!151910))

(declare-fun res!114722 () Bool)

(assert (=> d!58897 (=> (not res!114722) (not e!151910))))

(declare-fun lt!118220 () ListLongMap!3491)

(assert (=> d!58897 (= res!114722 (contains!1634 lt!118220 (_1!2305 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504)))))))

(declare-fun lt!118218 () List!3517)

(assert (=> d!58897 (= lt!118220 (ListLongMap!3492 lt!118218))))

(declare-fun lt!118219 () Unit!7218)

(declare-fun lt!118217 () Unit!7218)

(assert (=> d!58897 (= lt!118219 lt!118217)))

(assert (=> d!58897 (= (getValueByKey!261 lt!118218 (_1!2305 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504)))) (Some!266 (_2!2305 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504)))))))

(assert (=> d!58897 (= lt!118217 (lemmaContainsTupThenGetReturnValue!149 lt!118218 (_1!2305 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504))) (_2!2305 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504)))))))

(assert (=> d!58897 (= lt!118218 (insertStrictlySorted!152 (toList!1761 lt!118100) (_1!2305 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504))) (_2!2305 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504)))))))

(assert (=> d!58897 (= (+!638 lt!118100 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504))) lt!118220)))

(declare-fun b!233886 () Bool)

(declare-fun res!114721 () Bool)

(assert (=> b!233886 (=> (not res!114721) (not e!151910))))

(assert (=> b!233886 (= res!114721 (= (getValueByKey!261 (toList!1761 lt!118220) (_1!2305 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504)))) (Some!266 (_2!2305 (tuple2!4589 lt!118092 (minValue!4188 thiss!1504))))))))

(declare-fun b!233887 () Bool)

(assert (=> b!233887 (= e!151910 (contains!1636 (toList!1761 lt!118220) (tuple2!4589 lt!118092 (minValue!4188 thiss!1504))))))

(assert (= (and d!58897 res!114722) b!233886))

(assert (= (and b!233886 res!114721) b!233887))

(declare-fun m!254787 () Bool)

(assert (=> d!58897 m!254787))

(declare-fun m!254789 () Bool)

(assert (=> d!58897 m!254789))

(declare-fun m!254791 () Bool)

(assert (=> d!58897 m!254791))

(declare-fun m!254793 () Bool)

(assert (=> d!58897 m!254793))

(declare-fun m!254795 () Bool)

(assert (=> b!233886 m!254795))

(declare-fun m!254797 () Bool)

(assert (=> b!233887 m!254797))

(assert (=> b!233678 d!58897))

(declare-fun d!58899 () Bool)

(assert (=> d!58899 (= (apply!205 lt!118104 lt!118098) (get!2814 (getValueByKey!261 (toList!1761 lt!118104) lt!118098)))))

(declare-fun bs!8647 () Bool)

(assert (= bs!8647 d!58899))

(declare-fun m!254799 () Bool)

(assert (=> bs!8647 m!254799))

(assert (=> bs!8647 m!254799))

(declare-fun m!254801 () Bool)

(assert (=> bs!8647 m!254801))

(assert (=> b!233678 d!58899))

(declare-fun d!58901 () Bool)

(assert (=> d!58901 (= (apply!205 lt!118097 lt!118103) (get!2814 (getValueByKey!261 (toList!1761 lt!118097) lt!118103)))))

(declare-fun bs!8648 () Bool)

(assert (= bs!8648 d!58901))

(declare-fun m!254803 () Bool)

(assert (=> bs!8648 m!254803))

(assert (=> bs!8648 m!254803))

(declare-fun m!254805 () Bool)

(assert (=> bs!8648 m!254805))

(assert (=> b!233678 d!58901))

(assert (=> b!233629 d!58839))

(assert (=> b!233629 d!58841))

(declare-fun d!58903 () Bool)

(assert (=> d!58903 (= (apply!205 lt!118111 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2814 (getValueByKey!261 (toList!1761 lt!118111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8649 () Bool)

(assert (= bs!8649 d!58903))

(assert (=> bs!8649 m!254687))

(assert (=> bs!8649 m!254687))

(declare-fun m!254807 () Bool)

(assert (=> bs!8649 m!254807))

(assert (=> b!233687 d!58903))

(assert (=> d!58825 d!58829))

(declare-fun b!233906 () Bool)

(declare-fun lt!118226 () SeekEntryResult!982)

(assert (=> b!233906 (and (bvsge (index!6100 lt!118226) #b00000000000000000000000000000000) (bvslt (index!6100 lt!118226) (size!5829 (_keys!6405 thiss!1504))))))

(declare-fun e!151921 () Bool)

(assert (=> b!233906 (= e!151921 (= (select (arr!5494 (_keys!6405 thiss!1504)) (index!6100 lt!118226)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233907 () Bool)

(assert (=> b!233907 (and (bvsge (index!6100 lt!118226) #b00000000000000000000000000000000) (bvslt (index!6100 lt!118226) (size!5829 (_keys!6405 thiss!1504))))))

(declare-fun res!114731 () Bool)

(assert (=> b!233907 (= res!114731 (= (select (arr!5494 (_keys!6405 thiss!1504)) (index!6100 lt!118226)) key!932))))

(assert (=> b!233907 (=> res!114731 e!151921)))

(declare-fun e!151924 () Bool)

(assert (=> b!233907 (= e!151924 e!151921)))

(declare-fun b!233908 () Bool)

(declare-fun e!151923 () Bool)

(assert (=> b!233908 (= e!151923 (bvsge (x!23653 lt!118226) #b01111111111111111111111111111110))))

(declare-fun b!233909 () Bool)

(declare-fun e!151925 () SeekEntryResult!982)

(assert (=> b!233909 (= e!151925 (Intermediate!982 false (toIndex!0 key!932 (mask!10280 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!58905 () Bool)

(assert (=> d!58905 e!151923))

(declare-fun c!38949 () Bool)

(assert (=> d!58905 (= c!38949 (and ((_ is Intermediate!982) lt!118226) (undefined!1794 lt!118226)))))

(declare-fun e!151922 () SeekEntryResult!982)

(assert (=> d!58905 (= lt!118226 e!151922)))

(declare-fun c!38948 () Bool)

(assert (=> d!58905 (= c!38948 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!118225 () (_ BitVec 64))

(assert (=> d!58905 (= lt!118225 (select (arr!5494 (_keys!6405 thiss!1504)) (toIndex!0 key!932 (mask!10280 thiss!1504))))))

(assert (=> d!58905 (validMask!0 (mask!10280 thiss!1504))))

(assert (=> d!58905 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10280 thiss!1504)) key!932 (_keys!6405 thiss!1504) (mask!10280 thiss!1504)) lt!118226)))

(declare-fun b!233910 () Bool)

(assert (=> b!233910 (= e!151925 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10280 thiss!1504)) #b00000000000000000000000000000000 (mask!10280 thiss!1504)) key!932 (_keys!6405 thiss!1504) (mask!10280 thiss!1504)))))

(declare-fun b!233911 () Bool)

(assert (=> b!233911 (and (bvsge (index!6100 lt!118226) #b00000000000000000000000000000000) (bvslt (index!6100 lt!118226) (size!5829 (_keys!6405 thiss!1504))))))

(declare-fun res!114729 () Bool)

(assert (=> b!233911 (= res!114729 (= (select (arr!5494 (_keys!6405 thiss!1504)) (index!6100 lt!118226)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233911 (=> res!114729 e!151921)))

(declare-fun b!233912 () Bool)

(assert (=> b!233912 (= e!151922 e!151925)))

(declare-fun c!38947 () Bool)

(assert (=> b!233912 (= c!38947 (or (= lt!118225 key!932) (= (bvadd lt!118225 lt!118225) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!233913 () Bool)

(assert (=> b!233913 (= e!151923 e!151924)))

(declare-fun res!114730 () Bool)

(assert (=> b!233913 (= res!114730 (and ((_ is Intermediate!982) lt!118226) (not (undefined!1794 lt!118226)) (bvslt (x!23653 lt!118226) #b01111111111111111111111111111110) (bvsge (x!23653 lt!118226) #b00000000000000000000000000000000) (bvsge (x!23653 lt!118226) #b00000000000000000000000000000000)))))

(assert (=> b!233913 (=> (not res!114730) (not e!151924))))

(declare-fun b!233914 () Bool)

(assert (=> b!233914 (= e!151922 (Intermediate!982 true (toIndex!0 key!932 (mask!10280 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!58905 c!38948) b!233914))

(assert (= (and d!58905 (not c!38948)) b!233912))

(assert (= (and b!233912 c!38947) b!233909))

(assert (= (and b!233912 (not c!38947)) b!233910))

(assert (= (and d!58905 c!38949) b!233908))

(assert (= (and d!58905 (not c!38949)) b!233913))

(assert (= (and b!233913 res!114730) b!233907))

(assert (= (and b!233907 (not res!114731)) b!233911))

(assert (= (and b!233911 (not res!114729)) b!233906))

(assert (=> d!58905 m!254589))

(declare-fun m!254809 () Bool)

(assert (=> d!58905 m!254809))

(assert (=> d!58905 m!254477))

(declare-fun m!254811 () Bool)

(assert (=> b!233911 m!254811))

(assert (=> b!233907 m!254811))

(assert (=> b!233910 m!254589))

(declare-fun m!254813 () Bool)

(assert (=> b!233910 m!254813))

(assert (=> b!233910 m!254813))

(declare-fun m!254815 () Bool)

(assert (=> b!233910 m!254815))

(assert (=> b!233906 m!254811))

(assert (=> d!58827 d!58905))

(declare-fun d!58907 () Bool)

(declare-fun lt!118232 () (_ BitVec 32))

(declare-fun lt!118231 () (_ BitVec 32))

(assert (=> d!58907 (= lt!118232 (bvmul (bvxor lt!118231 (bvlshr lt!118231 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58907 (= lt!118231 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58907 (and (bvsge (mask!10280 thiss!1504) #b00000000000000000000000000000000) (let ((res!114732 (let ((h!4165 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23672 (bvmul (bvxor h!4165 (bvlshr h!4165 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23672 (bvlshr x!23672 #b00000000000000000000000000001101)) (mask!10280 thiss!1504)))))) (and (bvslt res!114732 (bvadd (mask!10280 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!114732 #b00000000000000000000000000000000))))))

(assert (=> d!58907 (= (toIndex!0 key!932 (mask!10280 thiss!1504)) (bvand (bvxor lt!118232 (bvlshr lt!118232 #b00000000000000000000000000001101)) (mask!10280 thiss!1504)))))

(assert (=> d!58827 d!58907))

(assert (=> d!58827 d!58829))

(declare-fun mapNonEmpty!10422 () Bool)

(declare-fun mapRes!10422 () Bool)

(declare-fun tp!22050 () Bool)

(declare-fun e!151926 () Bool)

(assert (=> mapNonEmpty!10422 (= mapRes!10422 (and tp!22050 e!151926))))

(declare-fun mapValue!10422 () ValueCell!2735)

(declare-fun mapKey!10422 () (_ BitVec 32))

(declare-fun mapRest!10422 () (Array (_ BitVec 32) ValueCell!2735))

(assert (=> mapNonEmpty!10422 (= mapRest!10421 (store mapRest!10422 mapKey!10422 mapValue!10422))))

(declare-fun b!233916 () Bool)

(declare-fun e!151927 () Bool)

(assert (=> b!233916 (= e!151927 tp_is_empty!6157)))

(declare-fun b!233915 () Bool)

(assert (=> b!233915 (= e!151926 tp_is_empty!6157)))

(declare-fun condMapEmpty!10422 () Bool)

(declare-fun mapDefault!10422 () ValueCell!2735)

(assert (=> mapNonEmpty!10421 (= condMapEmpty!10422 (= mapRest!10421 ((as const (Array (_ BitVec 32) ValueCell!2735)) mapDefault!10422)))))

(assert (=> mapNonEmpty!10421 (= tp!22049 (and e!151927 mapRes!10422))))

(declare-fun mapIsEmpty!10422 () Bool)

(assert (=> mapIsEmpty!10422 mapRes!10422))

(assert (= (and mapNonEmpty!10421 condMapEmpty!10422) mapIsEmpty!10422))

(assert (= (and mapNonEmpty!10421 (not condMapEmpty!10422)) mapNonEmpty!10422))

(assert (= (and mapNonEmpty!10422 ((_ is ValueCellFull!2735) mapValue!10422)) b!233915))

(assert (= (and mapNonEmpty!10421 ((_ is ValueCellFull!2735) mapDefault!10422)) b!233916))

(declare-fun m!254817 () Bool)

(assert (=> mapNonEmpty!10422 m!254817))

(declare-fun b_lambda!7849 () Bool)

(assert (= b_lambda!7847 (or (and b!233557 b_free!6295) b_lambda!7849)))

(declare-fun b_lambda!7851 () Bool)

(assert (= b_lambda!7845 (or (and b!233557 b_free!6295) b_lambda!7851)))

(check-sat (not b!233798) (not b_lambda!7851) (not d!58875) (not b!233740) (not mapNonEmpty!10422) (not b!233884) (not b!233832) (not d!58905) (not d!58855) (not b!233845) (not b!233818) (not b!233886) (not d!58843) (not b!233762) (not d!58899) (not b!233815) (not b!233816) (not d!58895) (not d!58887) (not b!233800) (not b!233878) (not b_lambda!7849) (not d!58853) (not b!233726) (not b!233870) (not bm!21732) (not bm!21729) (not d!58859) (not b_next!6295) (not b!233795) (not b!233729) (not b!233760) (not b!233871) b_and!13185 (not d!58839) (not b!233910) (not d!58863) (not b!233792) (not b!233793) (not d!58877) (not b!233868) (not b!233802) (not b!233887) (not d!58897) (not b!233756) (not b!233767) (not d!58873) (not b!233855) (not d!58879) (not d!58891) (not d!58889) (not b!233797) (not b!233725) (not b!233867) (not d!58901) (not d!58881) (not b!233766) (not d!58837) (not bm!21738) (not b!233763) (not d!58845) tp_is_empty!6157 (not b!233765) (not b!233819) (not b!233839) (not b!233881) (not b_lambda!7843) (not d!58871) (not b!233799) (not bm!21735) (not d!58883) (not d!58903) (not d!58893) (not b!233821) (not d!58835) (not d!58847) (not b!233876) (not d!58885) (not d!58849) (not b!233882) (not b!233838) (not b!233883) (not b!233831))
(check-sat b_and!13185 (not b_next!6295))
