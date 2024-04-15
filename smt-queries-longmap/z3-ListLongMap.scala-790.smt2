; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18808 () Bool)

(assert start!18808)

(declare-fun b!185686 () Bool)

(declare-fun b_free!4579 () Bool)

(declare-fun b_next!4579 () Bool)

(assert (=> b!185686 (= b_free!4579 (not b_next!4579))))

(declare-fun tp!16535 () Bool)

(declare-fun b_and!11155 () Bool)

(assert (=> b!185686 (= tp!16535 b_and!11155)))

(declare-fun b!185684 () Bool)

(declare-fun e!122174 () Bool)

(declare-fun tp_is_empty!4351 () Bool)

(assert (=> b!185684 (= e!122174 tp_is_empty!4351)))

(declare-fun mapNonEmpty!7488 () Bool)

(declare-fun mapRes!7488 () Bool)

(declare-fun tp!16536 () Bool)

(assert (=> mapNonEmpty!7488 (= mapRes!7488 (and tp!16536 e!122174))))

(declare-fun mapKey!7488 () (_ BitVec 32))

(declare-datatypes ((V!5449 0))(
  ( (V!5450 (val!2220 Int)) )
))
(declare-datatypes ((ValueCell!1832 0))(
  ( (ValueCellFull!1832 (v!4125 V!5449)) (EmptyCell!1832) )
))
(declare-fun mapValue!7488 () ValueCell!1832)

(declare-datatypes ((array!7891 0))(
  ( (array!7892 (arr!3724 (Array (_ BitVec 32) (_ BitVec 64))) (size!4041 (_ BitVec 32))) )
))
(declare-datatypes ((array!7893 0))(
  ( (array!7894 (arr!3725 (Array (_ BitVec 32) ValueCell!1832)) (size!4042 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2572 0))(
  ( (LongMapFixedSize!2573 (defaultEntry!3788 Int) (mask!8902 (_ BitVec 32)) (extraKeys!3525 (_ BitVec 32)) (zeroValue!3629 V!5449) (minValue!3629 V!5449) (_size!1335 (_ BitVec 32)) (_keys!5728 array!7891) (_values!3771 array!7893) (_vacant!1335 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2572)

(declare-fun mapRest!7488 () (Array (_ BitVec 32) ValueCell!1832))

(assert (=> mapNonEmpty!7488 (= (arr!3725 (_values!3771 thiss!1248)) (store mapRest!7488 mapKey!7488 mapValue!7488))))

(declare-fun b!185685 () Bool)

(declare-fun e!122175 () Bool)

(assert (=> b!185685 (= e!122175 (not true))))

(assert (=> b!185685 false))

(declare-datatypes ((Unit!5567 0))(
  ( (Unit!5568) )
))
(declare-fun lt!91694 () Unit!5567)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!137 (array!7891 array!7893 (_ BitVec 32) (_ BitVec 32) V!5449 V!5449 (_ BitVec 64) Int) Unit!5567)

(assert (=> b!185685 (= lt!91694 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!137 (_keys!5728 thiss!1248) (_values!3771 thiss!1248) (mask!8902 thiss!1248) (extraKeys!3525 thiss!1248) (zeroValue!3629 thiss!1248) (minValue!3629 thiss!1248) key!828 (defaultEntry!3788 thiss!1248)))))

(declare-fun e!122176 () Bool)

(declare-fun e!122173 () Bool)

(declare-fun array_inv!2411 (array!7891) Bool)

(declare-fun array_inv!2412 (array!7893) Bool)

(assert (=> b!185686 (= e!122173 (and tp!16535 tp_is_empty!4351 (array_inv!2411 (_keys!5728 thiss!1248)) (array_inv!2412 (_values!3771 thiss!1248)) e!122176))))

(declare-fun b!185687 () Bool)

(declare-fun e!122171 () Bool)

(assert (=> b!185687 (= e!122171 tp_is_empty!4351)))

(declare-fun mapIsEmpty!7488 () Bool)

(assert (=> mapIsEmpty!7488 mapRes!7488))

(declare-fun b!185688 () Bool)

(declare-fun res!87828 () Bool)

(declare-fun e!122172 () Bool)

(assert (=> b!185688 (=> (not res!87828) (not e!122172))))

(assert (=> b!185688 (= res!87828 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185689 () Bool)

(assert (=> b!185689 (= e!122172 e!122175)))

(declare-fun res!87831 () Bool)

(assert (=> b!185689 (=> (not res!87831) (not e!122175))))

(declare-datatypes ((SeekEntryResult!639 0))(
  ( (MissingZero!639 (index!4726 (_ BitVec 32))) (Found!639 (index!4727 (_ BitVec 32))) (Intermediate!639 (undefined!1451 Bool) (index!4728 (_ BitVec 32)) (x!20176 (_ BitVec 32))) (Undefined!639) (MissingVacant!639 (index!4729 (_ BitVec 32))) )
))
(declare-fun lt!91693 () SeekEntryResult!639)

(get-info :version)

(assert (=> b!185689 (= res!87831 (and (not ((_ is Undefined!639) lt!91693)) (not ((_ is MissingVacant!639) lt!91693)) (not ((_ is MissingZero!639) lt!91693)) ((_ is Found!639) lt!91693)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7891 (_ BitVec 32)) SeekEntryResult!639)

(assert (=> b!185689 (= lt!91693 (seekEntryOrOpen!0 key!828 (_keys!5728 thiss!1248) (mask!8902 thiss!1248)))))

(declare-fun res!87829 () Bool)

(assert (=> start!18808 (=> (not res!87829) (not e!122172))))

(declare-fun valid!1080 (LongMapFixedSize!2572) Bool)

(assert (=> start!18808 (= res!87829 (valid!1080 thiss!1248))))

(assert (=> start!18808 e!122172))

(assert (=> start!18808 e!122173))

(assert (=> start!18808 true))

(declare-fun b!185690 () Bool)

(assert (=> b!185690 (= e!122176 (and e!122171 mapRes!7488))))

(declare-fun condMapEmpty!7488 () Bool)

(declare-fun mapDefault!7488 () ValueCell!1832)

(assert (=> b!185690 (= condMapEmpty!7488 (= (arr!3725 (_values!3771 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1832)) mapDefault!7488)))))

(declare-fun b!185691 () Bool)

(declare-fun res!87830 () Bool)

(assert (=> b!185691 (=> (not res!87830) (not e!122175))))

(declare-datatypes ((tuple2!3420 0))(
  ( (tuple2!3421 (_1!1721 (_ BitVec 64)) (_2!1721 V!5449)) )
))
(declare-datatypes ((List!2355 0))(
  ( (Nil!2352) (Cons!2351 (h!2984 tuple2!3420) (t!7230 List!2355)) )
))
(declare-datatypes ((ListLongMap!2329 0))(
  ( (ListLongMap!2330 (toList!1180 List!2355)) )
))
(declare-fun contains!1282 (ListLongMap!2329 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!813 (array!7891 array!7893 (_ BitVec 32) (_ BitVec 32) V!5449 V!5449 (_ BitVec 32) Int) ListLongMap!2329)

(assert (=> b!185691 (= res!87830 (not (contains!1282 (getCurrentListMap!813 (_keys!5728 thiss!1248) (_values!3771 thiss!1248) (mask!8902 thiss!1248) (extraKeys!3525 thiss!1248) (zeroValue!3629 thiss!1248) (minValue!3629 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3788 thiss!1248)) key!828)))))

(assert (= (and start!18808 res!87829) b!185688))

(assert (= (and b!185688 res!87828) b!185689))

(assert (= (and b!185689 res!87831) b!185691))

(assert (= (and b!185691 res!87830) b!185685))

(assert (= (and b!185690 condMapEmpty!7488) mapIsEmpty!7488))

(assert (= (and b!185690 (not condMapEmpty!7488)) mapNonEmpty!7488))

(assert (= (and mapNonEmpty!7488 ((_ is ValueCellFull!1832) mapValue!7488)) b!185684))

(assert (= (and b!185690 ((_ is ValueCellFull!1832) mapDefault!7488)) b!185687))

(assert (= b!185686 b!185690))

(assert (= start!18808 b!185686))

(declare-fun m!212309 () Bool)

(assert (=> b!185685 m!212309))

(declare-fun m!212311 () Bool)

(assert (=> start!18808 m!212311))

(declare-fun m!212313 () Bool)

(assert (=> b!185689 m!212313))

(declare-fun m!212315 () Bool)

(assert (=> b!185686 m!212315))

(declare-fun m!212317 () Bool)

(assert (=> b!185686 m!212317))

(declare-fun m!212319 () Bool)

(assert (=> b!185691 m!212319))

(assert (=> b!185691 m!212319))

(declare-fun m!212321 () Bool)

(assert (=> b!185691 m!212321))

(declare-fun m!212323 () Bool)

(assert (=> mapNonEmpty!7488 m!212323))

(check-sat tp_is_empty!4351 (not b!185686) (not b!185689) b_and!11155 (not b_next!4579) (not b!185685) (not start!18808) (not b!185691) (not mapNonEmpty!7488))
(check-sat b_and!11155 (not b_next!4579))
