; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22536 () Bool)

(assert start!22536)

(declare-fun b!235648 () Bool)

(declare-fun b_free!6337 () Bool)

(declare-fun b_next!6337 () Bool)

(assert (=> b!235648 (= b_free!6337 (not b_next!6337))))

(declare-fun tp!22180 () Bool)

(declare-fun b_and!13281 () Bool)

(assert (=> b!235648 (= tp!22180 b_and!13281)))

(declare-fun b!235642 () Bool)

(declare-fun res!115564 () Bool)

(declare-fun e!153023 () Bool)

(assert (=> b!235642 (=> (not res!115564) (not e!153023))))

(declare-datatypes ((V!7913 0))(
  ( (V!7914 (val!3144 Int)) )
))
(declare-datatypes ((ValueCell!2756 0))(
  ( (ValueCellFull!2756 (v!5173 V!7913)) (EmptyCell!2756) )
))
(declare-datatypes ((array!11655 0))(
  ( (array!11656 (arr!5539 (Array (_ BitVec 32) ValueCell!2756)) (size!5876 (_ BitVec 32))) )
))
(declare-datatypes ((array!11657 0))(
  ( (array!11658 (arr!5540 (Array (_ BitVec 32) (_ BitVec 64))) (size!5877 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3412 0))(
  ( (LongMapFixedSize!3413 (defaultEntry!4377 Int) (mask!10351 (_ BitVec 32)) (extraKeys!4114 (_ BitVec 32)) (zeroValue!4218 V!7913) (minValue!4218 V!7913) (_size!1755 (_ BitVec 32)) (_keys!6453 array!11657) (_values!4360 array!11655) (_vacant!1755 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3412)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11657 (_ BitVec 32)) Bool)

(assert (=> b!235642 (= res!115564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6453 thiss!1504) (mask!10351 thiss!1504)))))

(declare-fun b!235643 () Bool)

(declare-fun res!115563 () Bool)

(assert (=> b!235643 (=> (not res!115563) (not e!153023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235643 (= res!115563 (validMask!0 (mask!10351 thiss!1504)))))

(declare-fun b!235644 () Bool)

(declare-fun e!153025 () Bool)

(declare-fun tp_is_empty!6199 () Bool)

(assert (=> b!235644 (= e!153025 tp_is_empty!6199)))

(declare-fun mapNonEmpty!10496 () Bool)

(declare-fun mapRes!10496 () Bool)

(declare-fun tp!22181 () Bool)

(assert (=> mapNonEmpty!10496 (= mapRes!10496 (and tp!22181 e!153025))))

(declare-fun mapValue!10496 () ValueCell!2756)

(declare-fun mapKey!10496 () (_ BitVec 32))

(declare-fun mapRest!10496 () (Array (_ BitVec 32) ValueCell!2756))

(assert (=> mapNonEmpty!10496 (= (arr!5539 (_values!4360 thiss!1504)) (store mapRest!10496 mapKey!10496 mapValue!10496))))

(declare-fun b!235645 () Bool)

(declare-fun res!115568 () Bool)

(declare-fun e!153024 () Bool)

(assert (=> b!235645 (=> (not res!115568) (not e!153024))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!235645 (= res!115568 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235646 () Bool)

(declare-fun e!153028 () Bool)

(assert (=> b!235646 (= e!153028 tp_is_empty!6199)))

(declare-fun b!235647 () Bool)

(assert (=> b!235647 (= e!153024 e!153023)))

(declare-fun res!115566 () Bool)

(assert (=> b!235647 (=> (not res!115566) (not e!153023))))

(declare-datatypes ((SeekEntryResult!964 0))(
  ( (MissingZero!964 (index!6026 (_ BitVec 32))) (Found!964 (index!6027 (_ BitVec 32))) (Intermediate!964 (undefined!1776 Bool) (index!6028 (_ BitVec 32)) (x!23776 (_ BitVec 32))) (Undefined!964) (MissingVacant!964 (index!6029 (_ BitVec 32))) )
))
(declare-fun lt!119211 () SeekEntryResult!964)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235647 (= res!115566 (or (= lt!119211 (MissingZero!964 index!297)) (= lt!119211 (MissingVacant!964 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11657 (_ BitVec 32)) SeekEntryResult!964)

(assert (=> b!235647 (= lt!119211 (seekEntryOrOpen!0 key!932 (_keys!6453 thiss!1504) (mask!10351 thiss!1504)))))

(declare-fun res!115567 () Bool)

(assert (=> start!22536 (=> (not res!115567) (not e!153024))))

(declare-fun valid!1361 (LongMapFixedSize!3412) Bool)

(assert (=> start!22536 (= res!115567 (valid!1361 thiss!1504))))

(assert (=> start!22536 e!153024))

(declare-fun e!153027 () Bool)

(assert (=> start!22536 e!153027))

(assert (=> start!22536 true))

(declare-fun mapIsEmpty!10496 () Bool)

(assert (=> mapIsEmpty!10496 mapRes!10496))

(declare-fun e!153022 () Bool)

(declare-fun array_inv!3641 (array!11657) Bool)

(declare-fun array_inv!3642 (array!11655) Bool)

(assert (=> b!235648 (= e!153027 (and tp!22180 tp_is_empty!6199 (array_inv!3641 (_keys!6453 thiss!1504)) (array_inv!3642 (_values!4360 thiss!1504)) e!153022))))

(declare-fun b!235649 () Bool)

(declare-fun res!115562 () Bool)

(assert (=> b!235649 (=> (not res!115562) (not e!153023))))

(declare-datatypes ((List!3465 0))(
  ( (Nil!3462) (Cons!3461 (h!4113 (_ BitVec 64)) (t!8432 List!3465)) )
))
(declare-fun arrayNoDuplicates!0 (array!11657 (_ BitVec 32) List!3465) Bool)

(assert (=> b!235649 (= res!115562 (arrayNoDuplicates!0 (_keys!6453 thiss!1504) #b00000000000000000000000000000000 Nil!3462))))

(declare-fun b!235650 () Bool)

(assert (=> b!235650 (= e!153022 (and e!153028 mapRes!10496))))

(declare-fun condMapEmpty!10496 () Bool)

(declare-fun mapDefault!10496 () ValueCell!2756)

(assert (=> b!235650 (= condMapEmpty!10496 (= (arr!5539 (_values!4360 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2756)) mapDefault!10496)))))

(declare-fun b!235651 () Bool)

(declare-fun res!115569 () Bool)

(assert (=> b!235651 (=> (not res!115569) (not e!153023))))

(declare-datatypes ((tuple2!4566 0))(
  ( (tuple2!4567 (_1!2294 (_ BitVec 64)) (_2!2294 V!7913)) )
))
(declare-datatypes ((List!3466 0))(
  ( (Nil!3463) (Cons!3462 (h!4114 tuple2!4566) (t!8433 List!3466)) )
))
(declare-datatypes ((ListLongMap!3481 0))(
  ( (ListLongMap!3482 (toList!1756 List!3466)) )
))
(declare-fun contains!1647 (ListLongMap!3481 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1288 (array!11657 array!11655 (_ BitVec 32) (_ BitVec 32) V!7913 V!7913 (_ BitVec 32) Int) ListLongMap!3481)

(assert (=> b!235651 (= res!115569 (contains!1647 (getCurrentListMap!1288 (_keys!6453 thiss!1504) (_values!4360 thiss!1504) (mask!10351 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)) key!932))))

(declare-fun b!235652 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!235652 (= e!153023 (not (validKeyInArray!0 key!932)))))

(declare-fun b!235653 () Bool)

(declare-fun res!115565 () Bool)

(assert (=> b!235653 (=> (not res!115565) (not e!153023))))

(assert (=> b!235653 (= res!115565 (and (= (size!5876 (_values!4360 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10351 thiss!1504))) (= (size!5877 (_keys!6453 thiss!1504)) (size!5876 (_values!4360 thiss!1504))) (bvsge (mask!10351 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4114 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4114 thiss!1504) #b00000000000000000000000000000011)))))

(assert (= (and start!22536 res!115567) b!235645))

(assert (= (and b!235645 res!115568) b!235647))

(assert (= (and b!235647 res!115566) b!235651))

(assert (= (and b!235651 res!115569) b!235643))

(assert (= (and b!235643 res!115563) b!235653))

(assert (= (and b!235653 res!115565) b!235642))

(assert (= (and b!235642 res!115564) b!235649))

(assert (= (and b!235649 res!115562) b!235652))

(assert (= (and b!235650 condMapEmpty!10496) mapIsEmpty!10496))

(assert (= (and b!235650 (not condMapEmpty!10496)) mapNonEmpty!10496))

(get-info :version)

(assert (= (and mapNonEmpty!10496 ((_ is ValueCellFull!2756) mapValue!10496)) b!235644))

(assert (= (and b!235650 ((_ is ValueCellFull!2756) mapDefault!10496)) b!235646))

(assert (= b!235648 b!235650))

(assert (= start!22536 b!235648))

(declare-fun m!256835 () Bool)

(assert (=> b!235649 m!256835))

(declare-fun m!256837 () Bool)

(assert (=> mapNonEmpty!10496 m!256837))

(declare-fun m!256839 () Bool)

(assert (=> b!235642 m!256839))

(declare-fun m!256841 () Bool)

(assert (=> start!22536 m!256841))

(declare-fun m!256843 () Bool)

(assert (=> b!235647 m!256843))

(declare-fun m!256845 () Bool)

(assert (=> b!235651 m!256845))

(assert (=> b!235651 m!256845))

(declare-fun m!256847 () Bool)

(assert (=> b!235651 m!256847))

(declare-fun m!256849 () Bool)

(assert (=> b!235648 m!256849))

(declare-fun m!256851 () Bool)

(assert (=> b!235648 m!256851))

(declare-fun m!256853 () Bool)

(assert (=> b!235652 m!256853))

(declare-fun m!256855 () Bool)

(assert (=> b!235643 m!256855))

(check-sat (not b!235643) tp_is_empty!6199 (not b!235647) b_and!13281 (not start!22536) (not b!235648) (not b!235649) (not b!235652) (not mapNonEmpty!10496) (not b!235642) (not b_next!6337) (not b!235651))
(check-sat b_and!13281 (not b_next!6337))
(get-model)

(declare-fun d!59369 () Bool)

(assert (=> d!59369 (= (array_inv!3641 (_keys!6453 thiss!1504)) (bvsge (size!5877 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235648 d!59369))

(declare-fun d!59371 () Bool)

(assert (=> d!59371 (= (array_inv!3642 (_values!4360 thiss!1504)) (bvsge (size!5876 (_values!4360 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235648 d!59371))

(declare-fun d!59373 () Bool)

(declare-fun res!115624 () Bool)

(declare-fun e!153073 () Bool)

(assert (=> d!59373 (=> (not res!115624) (not e!153073))))

(declare-fun simpleValid!234 (LongMapFixedSize!3412) Bool)

(assert (=> d!59373 (= res!115624 (simpleValid!234 thiss!1504))))

(assert (=> d!59373 (= (valid!1361 thiss!1504) e!153073)))

(declare-fun b!235732 () Bool)

(declare-fun res!115625 () Bool)

(assert (=> b!235732 (=> (not res!115625) (not e!153073))))

(declare-fun arrayCountValidKeys!0 (array!11657 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!235732 (= res!115625 (= (arrayCountValidKeys!0 (_keys!6453 thiss!1504) #b00000000000000000000000000000000 (size!5877 (_keys!6453 thiss!1504))) (_size!1755 thiss!1504)))))

(declare-fun b!235733 () Bool)

(declare-fun res!115626 () Bool)

(assert (=> b!235733 (=> (not res!115626) (not e!153073))))

(assert (=> b!235733 (= res!115626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6453 thiss!1504) (mask!10351 thiss!1504)))))

(declare-fun b!235734 () Bool)

(assert (=> b!235734 (= e!153073 (arrayNoDuplicates!0 (_keys!6453 thiss!1504) #b00000000000000000000000000000000 Nil!3462))))

(assert (= (and d!59373 res!115624) b!235732))

(assert (= (and b!235732 res!115625) b!235733))

(assert (= (and b!235733 res!115626) b!235734))

(declare-fun m!256901 () Bool)

(assert (=> d!59373 m!256901))

(declare-fun m!256903 () Bool)

(assert (=> b!235732 m!256903))

(assert (=> b!235733 m!256839))

(assert (=> b!235734 m!256835))

(assert (=> start!22536 d!59373))

(declare-fun b!235745 () Bool)

(declare-fun e!153084 () Bool)

(declare-fun e!153082 () Bool)

(assert (=> b!235745 (= e!153084 e!153082)))

(declare-fun res!115634 () Bool)

(assert (=> b!235745 (=> (not res!115634) (not e!153082))))

(declare-fun e!153083 () Bool)

(assert (=> b!235745 (= res!115634 (not e!153083))))

(declare-fun res!115635 () Bool)

(assert (=> b!235745 (=> (not res!115635) (not e!153083))))

(assert (=> b!235745 (= res!115635 (validKeyInArray!0 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235747 () Bool)

(declare-fun e!153085 () Bool)

(declare-fun call!21894 () Bool)

(assert (=> b!235747 (= e!153085 call!21894)))

(declare-fun b!235746 () Bool)

(declare-fun contains!1649 (List!3465 (_ BitVec 64)) Bool)

(assert (=> b!235746 (= e!153083 (contains!1649 Nil!3462 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59375 () Bool)

(declare-fun res!115633 () Bool)

(assert (=> d!59375 (=> res!115633 e!153084)))

(assert (=> d!59375 (= res!115633 (bvsge #b00000000000000000000000000000000 (size!5877 (_keys!6453 thiss!1504))))))

(assert (=> d!59375 (= (arrayNoDuplicates!0 (_keys!6453 thiss!1504) #b00000000000000000000000000000000 Nil!3462) e!153084)))

(declare-fun bm!21891 () Bool)

(declare-fun c!39260 () Bool)

(assert (=> bm!21891 (= call!21894 (arrayNoDuplicates!0 (_keys!6453 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39260 (Cons!3461 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000) Nil!3462) Nil!3462)))))

(declare-fun b!235748 () Bool)

(assert (=> b!235748 (= e!153082 e!153085)))

(assert (=> b!235748 (= c!39260 (validKeyInArray!0 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235749 () Bool)

(assert (=> b!235749 (= e!153085 call!21894)))

(assert (= (and d!59375 (not res!115633)) b!235745))

(assert (= (and b!235745 res!115635) b!235746))

(assert (= (and b!235745 res!115634) b!235748))

(assert (= (and b!235748 c!39260) b!235747))

(assert (= (and b!235748 (not c!39260)) b!235749))

(assert (= (or b!235747 b!235749) bm!21891))

(declare-fun m!256905 () Bool)

(assert (=> b!235745 m!256905))

(assert (=> b!235745 m!256905))

(declare-fun m!256907 () Bool)

(assert (=> b!235745 m!256907))

(assert (=> b!235746 m!256905))

(assert (=> b!235746 m!256905))

(declare-fun m!256909 () Bool)

(assert (=> b!235746 m!256909))

(assert (=> bm!21891 m!256905))

(declare-fun m!256911 () Bool)

(assert (=> bm!21891 m!256911))

(assert (=> b!235748 m!256905))

(assert (=> b!235748 m!256905))

(assert (=> b!235748 m!256907))

(assert (=> b!235649 d!59375))

(declare-fun bm!21894 () Bool)

(declare-fun call!21897 () Bool)

(assert (=> bm!21894 (= call!21897 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6453 thiss!1504) (mask!10351 thiss!1504)))))

(declare-fun d!59377 () Bool)

(declare-fun res!115641 () Bool)

(declare-fun e!153093 () Bool)

(assert (=> d!59377 (=> res!115641 e!153093)))

(assert (=> d!59377 (= res!115641 (bvsge #b00000000000000000000000000000000 (size!5877 (_keys!6453 thiss!1504))))))

(assert (=> d!59377 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6453 thiss!1504) (mask!10351 thiss!1504)) e!153093)))

(declare-fun b!235758 () Bool)

(declare-fun e!153094 () Bool)

(assert (=> b!235758 (= e!153094 call!21897)))

(declare-fun b!235759 () Bool)

(assert (=> b!235759 (= e!153093 e!153094)))

(declare-fun c!39263 () Bool)

(assert (=> b!235759 (= c!39263 (validKeyInArray!0 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235760 () Bool)

(declare-fun e!153092 () Bool)

(assert (=> b!235760 (= e!153092 call!21897)))

(declare-fun b!235761 () Bool)

(assert (=> b!235761 (= e!153094 e!153092)))

(declare-fun lt!119226 () (_ BitVec 64))

(assert (=> b!235761 (= lt!119226 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!7247 0))(
  ( (Unit!7248) )
))
(declare-fun lt!119225 () Unit!7247)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11657 (_ BitVec 64) (_ BitVec 32)) Unit!7247)

(assert (=> b!235761 (= lt!119225 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6453 thiss!1504) lt!119226 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!235761 (arrayContainsKey!0 (_keys!6453 thiss!1504) lt!119226 #b00000000000000000000000000000000)))

(declare-fun lt!119224 () Unit!7247)

(assert (=> b!235761 (= lt!119224 lt!119225)))

(declare-fun res!115640 () Bool)

(assert (=> b!235761 (= res!115640 (= (seekEntryOrOpen!0 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000) (_keys!6453 thiss!1504) (mask!10351 thiss!1504)) (Found!964 #b00000000000000000000000000000000)))))

(assert (=> b!235761 (=> (not res!115640) (not e!153092))))

(assert (= (and d!59377 (not res!115641)) b!235759))

(assert (= (and b!235759 c!39263) b!235761))

(assert (= (and b!235759 (not c!39263)) b!235758))

(assert (= (and b!235761 res!115640) b!235760))

(assert (= (or b!235760 b!235758) bm!21894))

(declare-fun m!256913 () Bool)

(assert (=> bm!21894 m!256913))

(assert (=> b!235759 m!256905))

(assert (=> b!235759 m!256905))

(assert (=> b!235759 m!256907))

(assert (=> b!235761 m!256905))

(declare-fun m!256915 () Bool)

(assert (=> b!235761 m!256915))

(declare-fun m!256917 () Bool)

(assert (=> b!235761 m!256917))

(assert (=> b!235761 m!256905))

(declare-fun m!256919 () Bool)

(assert (=> b!235761 m!256919))

(assert (=> b!235642 d!59377))

(declare-fun d!59379 () Bool)

(assert (=> d!59379 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!235652 d!59379))

(declare-fun d!59381 () Bool)

(assert (=> d!59381 (= (validMask!0 (mask!10351 thiss!1504)) (and (or (= (mask!10351 thiss!1504) #b00000000000000000000000000000111) (= (mask!10351 thiss!1504) #b00000000000000000000000000001111) (= (mask!10351 thiss!1504) #b00000000000000000000000000011111) (= (mask!10351 thiss!1504) #b00000000000000000000000000111111) (= (mask!10351 thiss!1504) #b00000000000000000000000001111111) (= (mask!10351 thiss!1504) #b00000000000000000000000011111111) (= (mask!10351 thiss!1504) #b00000000000000000000000111111111) (= (mask!10351 thiss!1504) #b00000000000000000000001111111111) (= (mask!10351 thiss!1504) #b00000000000000000000011111111111) (= (mask!10351 thiss!1504) #b00000000000000000000111111111111) (= (mask!10351 thiss!1504) #b00000000000000000001111111111111) (= (mask!10351 thiss!1504) #b00000000000000000011111111111111) (= (mask!10351 thiss!1504) #b00000000000000000111111111111111) (= (mask!10351 thiss!1504) #b00000000000000001111111111111111) (= (mask!10351 thiss!1504) #b00000000000000011111111111111111) (= (mask!10351 thiss!1504) #b00000000000000111111111111111111) (= (mask!10351 thiss!1504) #b00000000000001111111111111111111) (= (mask!10351 thiss!1504) #b00000000000011111111111111111111) (= (mask!10351 thiss!1504) #b00000000000111111111111111111111) (= (mask!10351 thiss!1504) #b00000000001111111111111111111111) (= (mask!10351 thiss!1504) #b00000000011111111111111111111111) (= (mask!10351 thiss!1504) #b00000000111111111111111111111111) (= (mask!10351 thiss!1504) #b00000001111111111111111111111111) (= (mask!10351 thiss!1504) #b00000011111111111111111111111111) (= (mask!10351 thiss!1504) #b00000111111111111111111111111111) (= (mask!10351 thiss!1504) #b00001111111111111111111111111111) (= (mask!10351 thiss!1504) #b00011111111111111111111111111111) (= (mask!10351 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10351 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!235643 d!59381))

(declare-fun b!235774 () Bool)

(declare-fun e!153101 () SeekEntryResult!964)

(declare-fun lt!119235 () SeekEntryResult!964)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11657 (_ BitVec 32)) SeekEntryResult!964)

(assert (=> b!235774 (= e!153101 (seekKeyOrZeroReturnVacant!0 (x!23776 lt!119235) (index!6028 lt!119235) (index!6028 lt!119235) key!932 (_keys!6453 thiss!1504) (mask!10351 thiss!1504)))))

(declare-fun b!235775 () Bool)

(declare-fun e!153102 () SeekEntryResult!964)

(assert (=> b!235775 (= e!153102 Undefined!964)))

(declare-fun d!59383 () Bool)

(declare-fun lt!119234 () SeekEntryResult!964)

(assert (=> d!59383 (and (or ((_ is Undefined!964) lt!119234) (not ((_ is Found!964) lt!119234)) (and (bvsge (index!6027 lt!119234) #b00000000000000000000000000000000) (bvslt (index!6027 lt!119234) (size!5877 (_keys!6453 thiss!1504))))) (or ((_ is Undefined!964) lt!119234) ((_ is Found!964) lt!119234) (not ((_ is MissingZero!964) lt!119234)) (and (bvsge (index!6026 lt!119234) #b00000000000000000000000000000000) (bvslt (index!6026 lt!119234) (size!5877 (_keys!6453 thiss!1504))))) (or ((_ is Undefined!964) lt!119234) ((_ is Found!964) lt!119234) ((_ is MissingZero!964) lt!119234) (not ((_ is MissingVacant!964) lt!119234)) (and (bvsge (index!6029 lt!119234) #b00000000000000000000000000000000) (bvslt (index!6029 lt!119234) (size!5877 (_keys!6453 thiss!1504))))) (or ((_ is Undefined!964) lt!119234) (ite ((_ is Found!964) lt!119234) (= (select (arr!5540 (_keys!6453 thiss!1504)) (index!6027 lt!119234)) key!932) (ite ((_ is MissingZero!964) lt!119234) (= (select (arr!5540 (_keys!6453 thiss!1504)) (index!6026 lt!119234)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!964) lt!119234) (= (select (arr!5540 (_keys!6453 thiss!1504)) (index!6029 lt!119234)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59383 (= lt!119234 e!153102)))

(declare-fun c!39271 () Bool)

(assert (=> d!59383 (= c!39271 (and ((_ is Intermediate!964) lt!119235) (undefined!1776 lt!119235)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11657 (_ BitVec 32)) SeekEntryResult!964)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59383 (= lt!119235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10351 thiss!1504)) key!932 (_keys!6453 thiss!1504) (mask!10351 thiss!1504)))))

(assert (=> d!59383 (validMask!0 (mask!10351 thiss!1504))))

(assert (=> d!59383 (= (seekEntryOrOpen!0 key!932 (_keys!6453 thiss!1504) (mask!10351 thiss!1504)) lt!119234)))

(declare-fun b!235776 () Bool)

(declare-fun e!153103 () SeekEntryResult!964)

(assert (=> b!235776 (= e!153102 e!153103)))

(declare-fun lt!119233 () (_ BitVec 64))

(assert (=> b!235776 (= lt!119233 (select (arr!5540 (_keys!6453 thiss!1504)) (index!6028 lt!119235)))))

(declare-fun c!39270 () Bool)

(assert (=> b!235776 (= c!39270 (= lt!119233 key!932))))

(declare-fun b!235777 () Bool)

(assert (=> b!235777 (= e!153103 (Found!964 (index!6028 lt!119235)))))

(declare-fun b!235778 () Bool)

(declare-fun c!39272 () Bool)

(assert (=> b!235778 (= c!39272 (= lt!119233 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!235778 (= e!153103 e!153101)))

(declare-fun b!235779 () Bool)

(assert (=> b!235779 (= e!153101 (MissingZero!964 (index!6028 lt!119235)))))

(assert (= (and d!59383 c!39271) b!235775))

(assert (= (and d!59383 (not c!39271)) b!235776))

(assert (= (and b!235776 c!39270) b!235777))

(assert (= (and b!235776 (not c!39270)) b!235778))

(assert (= (and b!235778 c!39272) b!235779))

(assert (= (and b!235778 (not c!39272)) b!235774))

(declare-fun m!256921 () Bool)

(assert (=> b!235774 m!256921))

(declare-fun m!256923 () Bool)

(assert (=> d!59383 m!256923))

(assert (=> d!59383 m!256855))

(declare-fun m!256925 () Bool)

(assert (=> d!59383 m!256925))

(declare-fun m!256927 () Bool)

(assert (=> d!59383 m!256927))

(declare-fun m!256929 () Bool)

(assert (=> d!59383 m!256929))

(declare-fun m!256931 () Bool)

(assert (=> d!59383 m!256931))

(assert (=> d!59383 m!256927))

(declare-fun m!256933 () Bool)

(assert (=> b!235776 m!256933))

(assert (=> b!235647 d!59383))

(declare-fun d!59385 () Bool)

(declare-fun e!153109 () Bool)

(assert (=> d!59385 e!153109))

(declare-fun res!115644 () Bool)

(assert (=> d!59385 (=> res!115644 e!153109)))

(declare-fun lt!119244 () Bool)

(assert (=> d!59385 (= res!115644 (not lt!119244))))

(declare-fun lt!119247 () Bool)

(assert (=> d!59385 (= lt!119244 lt!119247)))

(declare-fun lt!119245 () Unit!7247)

(declare-fun e!153108 () Unit!7247)

(assert (=> d!59385 (= lt!119245 e!153108)))

(declare-fun c!39275 () Bool)

(assert (=> d!59385 (= c!39275 lt!119247)))

(declare-fun containsKey!261 (List!3466 (_ BitVec 64)) Bool)

(assert (=> d!59385 (= lt!119247 (containsKey!261 (toList!1756 (getCurrentListMap!1288 (_keys!6453 thiss!1504) (_values!4360 thiss!1504) (mask!10351 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504))) key!932))))

(assert (=> d!59385 (= (contains!1647 (getCurrentListMap!1288 (_keys!6453 thiss!1504) (_values!4360 thiss!1504) (mask!10351 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)) key!932) lt!119244)))

(declare-fun b!235786 () Bool)

(declare-fun lt!119246 () Unit!7247)

(assert (=> b!235786 (= e!153108 lt!119246)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!209 (List!3466 (_ BitVec 64)) Unit!7247)

(assert (=> b!235786 (= lt!119246 (lemmaContainsKeyImpliesGetValueByKeyDefined!209 (toList!1756 (getCurrentListMap!1288 (_keys!6453 thiss!1504) (_values!4360 thiss!1504) (mask!10351 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504))) key!932))))

(declare-datatypes ((Option!276 0))(
  ( (Some!275 (v!5176 V!7913)) (None!274) )
))
(declare-fun isDefined!210 (Option!276) Bool)

(declare-fun getValueByKey!270 (List!3466 (_ BitVec 64)) Option!276)

(assert (=> b!235786 (isDefined!210 (getValueByKey!270 (toList!1756 (getCurrentListMap!1288 (_keys!6453 thiss!1504) (_values!4360 thiss!1504) (mask!10351 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504))) key!932))))

(declare-fun b!235787 () Bool)

(declare-fun Unit!7249 () Unit!7247)

(assert (=> b!235787 (= e!153108 Unit!7249)))

(declare-fun b!235788 () Bool)

(assert (=> b!235788 (= e!153109 (isDefined!210 (getValueByKey!270 (toList!1756 (getCurrentListMap!1288 (_keys!6453 thiss!1504) (_values!4360 thiss!1504) (mask!10351 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504))) key!932)))))

(assert (= (and d!59385 c!39275) b!235786))

(assert (= (and d!59385 (not c!39275)) b!235787))

(assert (= (and d!59385 (not res!115644)) b!235788))

(declare-fun m!256935 () Bool)

(assert (=> d!59385 m!256935))

(declare-fun m!256937 () Bool)

(assert (=> b!235786 m!256937))

(declare-fun m!256939 () Bool)

(assert (=> b!235786 m!256939))

(assert (=> b!235786 m!256939))

(declare-fun m!256941 () Bool)

(assert (=> b!235786 m!256941))

(assert (=> b!235788 m!256939))

(assert (=> b!235788 m!256939))

(assert (=> b!235788 m!256941))

(assert (=> b!235651 d!59385))

(declare-fun b!235831 () Bool)

(declare-fun e!153142 () ListLongMap!3481)

(declare-fun call!21914 () ListLongMap!3481)

(declare-fun +!638 (ListLongMap!3481 tuple2!4566) ListLongMap!3481)

(assert (=> b!235831 (= e!153142 (+!638 call!21914 (tuple2!4567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4218 thiss!1504))))))

(declare-fun b!235832 () Bool)

(declare-fun e!153136 () ListLongMap!3481)

(declare-fun call!21913 () ListLongMap!3481)

(assert (=> b!235832 (= e!153136 call!21913)))

(declare-fun b!235833 () Bool)

(declare-fun e!153145 () Bool)

(declare-fun call!21917 () Bool)

(assert (=> b!235833 (= e!153145 (not call!21917))))

(declare-fun bm!21909 () Bool)

(declare-fun call!21916 () ListLongMap!3481)

(declare-fun call!21912 () ListLongMap!3481)

(assert (=> bm!21909 (= call!21916 call!21912)))

(declare-fun b!235834 () Bool)

(declare-fun res!115665 () Bool)

(declare-fun e!153141 () Bool)

(assert (=> b!235834 (=> (not res!115665) (not e!153141))))

(declare-fun e!153138 () Bool)

(assert (=> b!235834 (= res!115665 e!153138)))

(declare-fun res!115666 () Bool)

(assert (=> b!235834 (=> res!115666 e!153138)))

(declare-fun e!153140 () Bool)

(assert (=> b!235834 (= res!115666 (not e!153140))))

(declare-fun res!115667 () Bool)

(assert (=> b!235834 (=> (not res!115667) (not e!153140))))

(assert (=> b!235834 (= res!115667 (bvslt #b00000000000000000000000000000000 (size!5877 (_keys!6453 thiss!1504))))))

(declare-fun b!235835 () Bool)

(declare-fun e!153143 () Bool)

(declare-fun lt!119310 () ListLongMap!3481)

(declare-fun apply!211 (ListLongMap!3481 (_ BitVec 64)) V!7913)

(assert (=> b!235835 (= e!153143 (= (apply!211 lt!119310 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4218 thiss!1504)))))

(declare-fun b!235836 () Bool)

(declare-fun e!153144 () Unit!7247)

(declare-fun Unit!7250 () Unit!7247)

(assert (=> b!235836 (= e!153144 Unit!7250)))

(declare-fun b!235837 () Bool)

(declare-fun e!153137 () Bool)

(assert (=> b!235837 (= e!153137 (validKeyInArray!0 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235838 () Bool)

(declare-fun e!153148 () Bool)

(declare-fun get!2854 (ValueCell!2756 V!7913) V!7913)

(declare-fun dynLambda!554 (Int (_ BitVec 64)) V!7913)

(assert (=> b!235838 (= e!153148 (= (apply!211 lt!119310 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000)) (get!2854 (select (arr!5539 (_values!4360 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!554 (defaultEntry!4377 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!235838 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5876 (_values!4360 thiss!1504))))))

(assert (=> b!235838 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5877 (_keys!6453 thiss!1504))))))

(declare-fun b!235839 () Bool)

(declare-fun e!153147 () Bool)

(declare-fun call!21915 () Bool)

(assert (=> b!235839 (= e!153147 (not call!21915))))

(declare-fun b!235840 () Bool)

(declare-fun e!153139 () ListLongMap!3481)

(declare-fun call!21918 () ListLongMap!3481)

(assert (=> b!235840 (= e!153139 call!21918)))

(declare-fun b!235841 () Bool)

(assert (=> b!235841 (= e!153147 e!153143)))

(declare-fun res!115664 () Bool)

(assert (=> b!235841 (= res!115664 call!21915)))

(assert (=> b!235841 (=> (not res!115664) (not e!153143))))

(declare-fun b!235842 () Bool)

(declare-fun c!39288 () Bool)

(assert (=> b!235842 (= c!39288 (and (not (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!235842 (= e!153136 e!153139)))

(declare-fun bm!21910 () Bool)

(assert (=> bm!21910 (= call!21915 (contains!1647 lt!119310 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!59387 () Bool)

(assert (=> d!59387 e!153141))

(declare-fun res!115669 () Bool)

(assert (=> d!59387 (=> (not res!115669) (not e!153141))))

(assert (=> d!59387 (= res!115669 (or (bvsge #b00000000000000000000000000000000 (size!5877 (_keys!6453 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5877 (_keys!6453 thiss!1504))))))))

(declare-fun lt!119300 () ListLongMap!3481)

(assert (=> d!59387 (= lt!119310 lt!119300)))

(declare-fun lt!119294 () Unit!7247)

(assert (=> d!59387 (= lt!119294 e!153144)))

(declare-fun c!39293 () Bool)

(assert (=> d!59387 (= c!39293 e!153137)))

(declare-fun res!115670 () Bool)

(assert (=> d!59387 (=> (not res!115670) (not e!153137))))

(assert (=> d!59387 (= res!115670 (bvslt #b00000000000000000000000000000000 (size!5877 (_keys!6453 thiss!1504))))))

(assert (=> d!59387 (= lt!119300 e!153142)))

(declare-fun c!39292 () Bool)

(assert (=> d!59387 (= c!39292 (and (not (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59387 (validMask!0 (mask!10351 thiss!1504))))

(assert (=> d!59387 (= (getCurrentListMap!1288 (_keys!6453 thiss!1504) (_values!4360 thiss!1504) (mask!10351 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)) lt!119310)))

(declare-fun bm!21911 () Bool)

(declare-fun c!39291 () Bool)

(assert (=> bm!21911 (= call!21914 (+!638 (ite c!39292 call!21912 (ite c!39291 call!21916 call!21918)) (ite (or c!39292 c!39291) (tuple2!4567 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4218 thiss!1504)) (tuple2!4567 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4218 thiss!1504)))))))

(declare-fun b!235843 () Bool)

(declare-fun res!115668 () Bool)

(assert (=> b!235843 (=> (not res!115668) (not e!153141))))

(assert (=> b!235843 (= res!115668 e!153145)))

(declare-fun c!39289 () Bool)

(assert (=> b!235843 (= c!39289 (not (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!21912 () Bool)

(assert (=> bm!21912 (= call!21913 call!21914)))

(declare-fun b!235844 () Bool)

(declare-fun e!153146 () Bool)

(assert (=> b!235844 (= e!153145 e!153146)))

(declare-fun res!115663 () Bool)

(assert (=> b!235844 (= res!115663 call!21917)))

(assert (=> b!235844 (=> (not res!115663) (not e!153146))))

(declare-fun b!235845 () Bool)

(assert (=> b!235845 (= e!153146 (= (apply!211 lt!119310 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4218 thiss!1504)))))

(declare-fun bm!21913 () Bool)

(assert (=> bm!21913 (= call!21918 call!21916)))

(declare-fun bm!21914 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!527 (array!11657 array!11655 (_ BitVec 32) (_ BitVec 32) V!7913 V!7913 (_ BitVec 32) Int) ListLongMap!3481)

(assert (=> bm!21914 (= call!21912 (getCurrentListMapNoExtraKeys!527 (_keys!6453 thiss!1504) (_values!4360 thiss!1504) (mask!10351 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)))))

(declare-fun b!235846 () Bool)

(assert (=> b!235846 (= e!153142 e!153136)))

(assert (=> b!235846 (= c!39291 (and (not (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!235847 () Bool)

(assert (=> b!235847 (= e!153141 e!153147)))

(declare-fun c!39290 () Bool)

(assert (=> b!235847 (= c!39290 (not (= (bvand (extraKeys!4114 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21915 () Bool)

(assert (=> bm!21915 (= call!21917 (contains!1647 lt!119310 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235848 () Bool)

(assert (=> b!235848 (= e!153140 (validKeyInArray!0 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235849 () Bool)

(declare-fun lt!119312 () Unit!7247)

(assert (=> b!235849 (= e!153144 lt!119312)))

(declare-fun lt!119292 () ListLongMap!3481)

(assert (=> b!235849 (= lt!119292 (getCurrentListMapNoExtraKeys!527 (_keys!6453 thiss!1504) (_values!4360 thiss!1504) (mask!10351 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)))))

(declare-fun lt!119307 () (_ BitVec 64))

(assert (=> b!235849 (= lt!119307 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119309 () (_ BitVec 64))

(assert (=> b!235849 (= lt!119309 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119296 () Unit!7247)

(declare-fun addStillContains!187 (ListLongMap!3481 (_ BitVec 64) V!7913 (_ BitVec 64)) Unit!7247)

(assert (=> b!235849 (= lt!119296 (addStillContains!187 lt!119292 lt!119307 (zeroValue!4218 thiss!1504) lt!119309))))

(assert (=> b!235849 (contains!1647 (+!638 lt!119292 (tuple2!4567 lt!119307 (zeroValue!4218 thiss!1504))) lt!119309)))

(declare-fun lt!119306 () Unit!7247)

(assert (=> b!235849 (= lt!119306 lt!119296)))

(declare-fun lt!119297 () ListLongMap!3481)

(assert (=> b!235849 (= lt!119297 (getCurrentListMapNoExtraKeys!527 (_keys!6453 thiss!1504) (_values!4360 thiss!1504) (mask!10351 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)))))

(declare-fun lt!119303 () (_ BitVec 64))

(assert (=> b!235849 (= lt!119303 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119305 () (_ BitVec 64))

(assert (=> b!235849 (= lt!119305 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119302 () Unit!7247)

(declare-fun addApplyDifferent!187 (ListLongMap!3481 (_ BitVec 64) V!7913 (_ BitVec 64)) Unit!7247)

(assert (=> b!235849 (= lt!119302 (addApplyDifferent!187 lt!119297 lt!119303 (minValue!4218 thiss!1504) lt!119305))))

(assert (=> b!235849 (= (apply!211 (+!638 lt!119297 (tuple2!4567 lt!119303 (minValue!4218 thiss!1504))) lt!119305) (apply!211 lt!119297 lt!119305))))

(declare-fun lt!119311 () Unit!7247)

(assert (=> b!235849 (= lt!119311 lt!119302)))

(declare-fun lt!119299 () ListLongMap!3481)

(assert (=> b!235849 (= lt!119299 (getCurrentListMapNoExtraKeys!527 (_keys!6453 thiss!1504) (_values!4360 thiss!1504) (mask!10351 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)))))

(declare-fun lt!119295 () (_ BitVec 64))

(assert (=> b!235849 (= lt!119295 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119313 () (_ BitVec 64))

(assert (=> b!235849 (= lt!119313 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119293 () Unit!7247)

(assert (=> b!235849 (= lt!119293 (addApplyDifferent!187 lt!119299 lt!119295 (zeroValue!4218 thiss!1504) lt!119313))))

(assert (=> b!235849 (= (apply!211 (+!638 lt!119299 (tuple2!4567 lt!119295 (zeroValue!4218 thiss!1504))) lt!119313) (apply!211 lt!119299 lt!119313))))

(declare-fun lt!119308 () Unit!7247)

(assert (=> b!235849 (= lt!119308 lt!119293)))

(declare-fun lt!119304 () ListLongMap!3481)

(assert (=> b!235849 (= lt!119304 (getCurrentListMapNoExtraKeys!527 (_keys!6453 thiss!1504) (_values!4360 thiss!1504) (mask!10351 thiss!1504) (extraKeys!4114 thiss!1504) (zeroValue!4218 thiss!1504) (minValue!4218 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4377 thiss!1504)))))

(declare-fun lt!119298 () (_ BitVec 64))

(assert (=> b!235849 (= lt!119298 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119301 () (_ BitVec 64))

(assert (=> b!235849 (= lt!119301 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235849 (= lt!119312 (addApplyDifferent!187 lt!119304 lt!119298 (minValue!4218 thiss!1504) lt!119301))))

(assert (=> b!235849 (= (apply!211 (+!638 lt!119304 (tuple2!4567 lt!119298 (minValue!4218 thiss!1504))) lt!119301) (apply!211 lt!119304 lt!119301))))

(declare-fun b!235850 () Bool)

(assert (=> b!235850 (= e!153138 e!153148)))

(declare-fun res!115671 () Bool)

(assert (=> b!235850 (=> (not res!115671) (not e!153148))))

(assert (=> b!235850 (= res!115671 (contains!1647 lt!119310 (select (arr!5540 (_keys!6453 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!235850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5877 (_keys!6453 thiss!1504))))))

(declare-fun b!235851 () Bool)

(assert (=> b!235851 (= e!153139 call!21913)))

(assert (= (and d!59387 c!39292) b!235831))

(assert (= (and d!59387 (not c!39292)) b!235846))

(assert (= (and b!235846 c!39291) b!235832))

(assert (= (and b!235846 (not c!39291)) b!235842))

(assert (= (and b!235842 c!39288) b!235851))

(assert (= (and b!235842 (not c!39288)) b!235840))

(assert (= (or b!235851 b!235840) bm!21913))

(assert (= (or b!235832 bm!21913) bm!21909))

(assert (= (or b!235832 b!235851) bm!21912))

(assert (= (or b!235831 bm!21909) bm!21914))

(assert (= (or b!235831 bm!21912) bm!21911))

(assert (= (and d!59387 res!115670) b!235837))

(assert (= (and d!59387 c!39293) b!235849))

(assert (= (and d!59387 (not c!39293)) b!235836))

(assert (= (and d!59387 res!115669) b!235834))

(assert (= (and b!235834 res!115667) b!235848))

(assert (= (and b!235834 (not res!115666)) b!235850))

(assert (= (and b!235850 res!115671) b!235838))

(assert (= (and b!235834 res!115665) b!235843))

(assert (= (and b!235843 c!39289) b!235844))

(assert (= (and b!235843 (not c!39289)) b!235833))

(assert (= (and b!235844 res!115663) b!235845))

(assert (= (or b!235844 b!235833) bm!21915))

(assert (= (and b!235843 res!115668) b!235847))

(assert (= (and b!235847 c!39290) b!235841))

(assert (= (and b!235847 (not c!39290)) b!235839))

(assert (= (and b!235841 res!115664) b!235835))

(assert (= (or b!235841 b!235839) bm!21910))

(declare-fun b_lambda!7929 () Bool)

(assert (=> (not b_lambda!7929) (not b!235838)))

(declare-fun t!8438 () Bool)

(declare-fun tb!2927 () Bool)

(assert (=> (and b!235648 (= (defaultEntry!4377 thiss!1504) (defaultEntry!4377 thiss!1504)) t!8438) tb!2927))

(declare-fun result!5119 () Bool)

(assert (=> tb!2927 (= result!5119 tp_is_empty!6199)))

(assert (=> b!235838 t!8438))

(declare-fun b_and!13287 () Bool)

(assert (= b_and!13281 (and (=> t!8438 result!5119) b_and!13287)))

(assert (=> b!235837 m!256905))

(assert (=> b!235837 m!256905))

(assert (=> b!235837 m!256907))

(declare-fun m!256943 () Bool)

(assert (=> b!235849 m!256943))

(declare-fun m!256945 () Bool)

(assert (=> b!235849 m!256945))

(declare-fun m!256947 () Bool)

(assert (=> b!235849 m!256947))

(declare-fun m!256949 () Bool)

(assert (=> b!235849 m!256949))

(assert (=> b!235849 m!256943))

(declare-fun m!256951 () Bool)

(assert (=> b!235849 m!256951))

(declare-fun m!256953 () Bool)

(assert (=> b!235849 m!256953))

(declare-fun m!256955 () Bool)

(assert (=> b!235849 m!256955))

(declare-fun m!256957 () Bool)

(assert (=> b!235849 m!256957))

(declare-fun m!256959 () Bool)

(assert (=> b!235849 m!256959))

(declare-fun m!256961 () Bool)

(assert (=> b!235849 m!256961))

(assert (=> b!235849 m!256953))

(declare-fun m!256963 () Bool)

(assert (=> b!235849 m!256963))

(declare-fun m!256965 () Bool)

(assert (=> b!235849 m!256965))

(declare-fun m!256967 () Bool)

(assert (=> b!235849 m!256967))

(assert (=> b!235849 m!256905))

(assert (=> b!235849 m!256965))

(declare-fun m!256969 () Bool)

(assert (=> b!235849 m!256969))

(declare-fun m!256971 () Bool)

(assert (=> b!235849 m!256971))

(declare-fun m!256973 () Bool)

(assert (=> b!235849 m!256973))

(assert (=> b!235849 m!256955))

(assert (=> b!235850 m!256905))

(assert (=> b!235850 m!256905))

(declare-fun m!256975 () Bool)

(assert (=> b!235850 m!256975))

(declare-fun m!256977 () Bool)

(assert (=> b!235838 m!256977))

(declare-fun m!256979 () Bool)

(assert (=> b!235838 m!256979))

(assert (=> b!235838 m!256905))

(assert (=> b!235838 m!256905))

(declare-fun m!256981 () Bool)

(assert (=> b!235838 m!256981))

(assert (=> b!235838 m!256979))

(assert (=> b!235838 m!256977))

(declare-fun m!256983 () Bool)

(assert (=> b!235838 m!256983))

(declare-fun m!256985 () Bool)

(assert (=> bm!21915 m!256985))

(assert (=> bm!21914 m!256969))

(declare-fun m!256987 () Bool)

(assert (=> bm!21910 m!256987))

(declare-fun m!256989 () Bool)

(assert (=> b!235845 m!256989))

(declare-fun m!256991 () Bool)

(assert (=> b!235831 m!256991))

(assert (=> b!235848 m!256905))

(assert (=> b!235848 m!256905))

(assert (=> b!235848 m!256907))

(assert (=> d!59387 m!256855))

(declare-fun m!256993 () Bool)

(assert (=> bm!21911 m!256993))

(declare-fun m!256995 () Bool)

(assert (=> b!235835 m!256995))

(assert (=> b!235651 d!59387))

(declare-fun mapIsEmpty!10505 () Bool)

(declare-fun mapRes!10505 () Bool)

(assert (=> mapIsEmpty!10505 mapRes!10505))

(declare-fun b!235860 () Bool)

(declare-fun e!153154 () Bool)

(assert (=> b!235860 (= e!153154 tp_is_empty!6199)))

(declare-fun b!235861 () Bool)

(declare-fun e!153153 () Bool)

(assert (=> b!235861 (= e!153153 tp_is_empty!6199)))

(declare-fun mapNonEmpty!10505 () Bool)

(declare-fun tp!22196 () Bool)

(assert (=> mapNonEmpty!10505 (= mapRes!10505 (and tp!22196 e!153154))))

(declare-fun mapRest!10505 () (Array (_ BitVec 32) ValueCell!2756))

(declare-fun mapValue!10505 () ValueCell!2756)

(declare-fun mapKey!10505 () (_ BitVec 32))

(assert (=> mapNonEmpty!10505 (= mapRest!10496 (store mapRest!10505 mapKey!10505 mapValue!10505))))

(declare-fun condMapEmpty!10505 () Bool)

(declare-fun mapDefault!10505 () ValueCell!2756)

(assert (=> mapNonEmpty!10496 (= condMapEmpty!10505 (= mapRest!10496 ((as const (Array (_ BitVec 32) ValueCell!2756)) mapDefault!10505)))))

(assert (=> mapNonEmpty!10496 (= tp!22181 (and e!153153 mapRes!10505))))

(assert (= (and mapNonEmpty!10496 condMapEmpty!10505) mapIsEmpty!10505))

(assert (= (and mapNonEmpty!10496 (not condMapEmpty!10505)) mapNonEmpty!10505))

(assert (= (and mapNonEmpty!10505 ((_ is ValueCellFull!2756) mapValue!10505)) b!235860))

(assert (= (and mapNonEmpty!10496 ((_ is ValueCellFull!2756) mapDefault!10505)) b!235861))

(declare-fun m!256997 () Bool)

(assert (=> mapNonEmpty!10505 m!256997))

(declare-fun b_lambda!7931 () Bool)

(assert (= b_lambda!7929 (or (and b!235648 b_free!6337) b_lambda!7931)))

(check-sat (not b!235837) (not d!59385) (not b_next!6337) (not b_lambda!7931) (not bm!21910) (not b!235848) (not b!235734) (not b!235733) (not b!235838) (not b!235759) (not bm!21891) b_and!13287 (not d!59387) tp_is_empty!6199 (not b!235732) (not b!235831) (not d!59383) (not b!235845) (not mapNonEmpty!10505) (not b!235850) (not b!235761) (not b!235748) (not b!235786) (not bm!21914) (not bm!21894) (not d!59373) (not bm!21915) (not b!235835) (not b!235746) (not b!235774) (not b!235849) (not bm!21911) (not b!235788) (not b!235745))
(check-sat b_and!13287 (not b_next!6337))
