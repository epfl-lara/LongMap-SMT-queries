; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18808 () Bool)

(assert start!18808)

(declare-fun b!185879 () Bool)

(declare-fun b_free!4579 () Bool)

(declare-fun b_next!4579 () Bool)

(assert (=> b!185879 (= b_free!4579 (not b_next!4579))))

(declare-fun tp!16536 () Bool)

(declare-fun b_and!11195 () Bool)

(assert (=> b!185879 (= tp!16536 b_and!11195)))

(declare-fun b!185878 () Bool)

(declare-fun res!87947 () Bool)

(declare-fun e!122302 () Bool)

(assert (=> b!185878 (=> (not res!87947) (not e!122302))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!185878 (= res!87947 (not (= key!828 (bvneg key!828))))))

(declare-fun e!122301 () Bool)

(declare-fun e!122300 () Bool)

(declare-fun tp_is_empty!4351 () Bool)

(declare-datatypes ((V!5449 0))(
  ( (V!5450 (val!2220 Int)) )
))
(declare-datatypes ((ValueCell!1832 0))(
  ( (ValueCellFull!1832 (v!4132 V!5449)) (EmptyCell!1832) )
))
(declare-datatypes ((array!7897 0))(
  ( (array!7898 (arr!3728 (Array (_ BitVec 32) (_ BitVec 64))) (size!4044 (_ BitVec 32))) )
))
(declare-datatypes ((array!7899 0))(
  ( (array!7900 (arr!3729 (Array (_ BitVec 32) ValueCell!1832)) (size!4045 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2572 0))(
  ( (LongMapFixedSize!2573 (defaultEntry!3788 Int) (mask!8903 (_ BitVec 32)) (extraKeys!3525 (_ BitVec 32)) (zeroValue!3629 V!5449) (minValue!3629 V!5449) (_size!1335 (_ BitVec 32)) (_keys!5729 array!7897) (_values!3771 array!7899) (_vacant!1335 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2572)

(declare-fun array_inv!2405 (array!7897) Bool)

(declare-fun array_inv!2406 (array!7899) Bool)

(assert (=> b!185879 (= e!122300 (and tp!16536 tp_is_empty!4351 (array_inv!2405 (_keys!5729 thiss!1248)) (array_inv!2406 (_values!3771 thiss!1248)) e!122301))))

(declare-fun b!185880 () Bool)

(declare-fun e!122297 () Bool)

(assert (=> b!185880 (= e!122302 e!122297)))

(declare-fun res!87945 () Bool)

(assert (=> b!185880 (=> (not res!87945) (not e!122297))))

(declare-datatypes ((SeekEntryResult!627 0))(
  ( (MissingZero!627 (index!4678 (_ BitVec 32))) (Found!627 (index!4679 (_ BitVec 32))) (Intermediate!627 (undefined!1439 Bool) (index!4680 (_ BitVec 32)) (x!20165 (_ BitVec 32))) (Undefined!627) (MissingVacant!627 (index!4681 (_ BitVec 32))) )
))
(declare-fun lt!91933 () SeekEntryResult!627)

(get-info :version)

(assert (=> b!185880 (= res!87945 (and (not ((_ is Undefined!627) lt!91933)) (not ((_ is MissingVacant!627) lt!91933)) (not ((_ is MissingZero!627) lt!91933)) ((_ is Found!627) lt!91933)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7897 (_ BitVec 32)) SeekEntryResult!627)

(assert (=> b!185880 (= lt!91933 (seekEntryOrOpen!0 key!828 (_keys!5729 thiss!1248) (mask!8903 thiss!1248)))))

(declare-fun res!87944 () Bool)

(assert (=> start!18808 (=> (not res!87944) (not e!122302))))

(declare-fun valid!1084 (LongMapFixedSize!2572) Bool)

(assert (=> start!18808 (= res!87944 (valid!1084 thiss!1248))))

(assert (=> start!18808 e!122302))

(assert (=> start!18808 e!122300))

(assert (=> start!18808 true))

(declare-fun b!185881 () Bool)

(assert (=> b!185881 (= e!122297 (not true))))

(assert (=> b!185881 false))

(declare-datatypes ((Unit!5596 0))(
  ( (Unit!5597) )
))
(declare-fun lt!91934 () Unit!5596)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!134 (array!7897 array!7899 (_ BitVec 32) (_ BitVec 32) V!5449 V!5449 (_ BitVec 64) Int) Unit!5596)

(assert (=> b!185881 (= lt!91934 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!134 (_keys!5729 thiss!1248) (_values!3771 thiss!1248) (mask!8903 thiss!1248) (extraKeys!3525 thiss!1248) (zeroValue!3629 thiss!1248) (minValue!3629 thiss!1248) key!828 (defaultEntry!3788 thiss!1248)))))

(declare-fun mapIsEmpty!7488 () Bool)

(declare-fun mapRes!7488 () Bool)

(assert (=> mapIsEmpty!7488 mapRes!7488))

(declare-fun b!185882 () Bool)

(declare-fun e!122298 () Bool)

(assert (=> b!185882 (= e!122298 tp_is_empty!4351)))

(declare-fun b!185883 () Bool)

(declare-fun e!122296 () Bool)

(assert (=> b!185883 (= e!122301 (and e!122296 mapRes!7488))))

(declare-fun condMapEmpty!7488 () Bool)

(declare-fun mapDefault!7488 () ValueCell!1832)

(assert (=> b!185883 (= condMapEmpty!7488 (= (arr!3729 (_values!3771 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1832)) mapDefault!7488)))))

(declare-fun mapNonEmpty!7488 () Bool)

(declare-fun tp!16535 () Bool)

(assert (=> mapNonEmpty!7488 (= mapRes!7488 (and tp!16535 e!122298))))

(declare-fun mapValue!7488 () ValueCell!1832)

(declare-fun mapKey!7488 () (_ BitVec 32))

(declare-fun mapRest!7488 () (Array (_ BitVec 32) ValueCell!1832))

(assert (=> mapNonEmpty!7488 (= (arr!3729 (_values!3771 thiss!1248)) (store mapRest!7488 mapKey!7488 mapValue!7488))))

(declare-fun b!185884 () Bool)

(declare-fun res!87946 () Bool)

(assert (=> b!185884 (=> (not res!87946) (not e!122297))))

(declare-datatypes ((tuple2!3402 0))(
  ( (tuple2!3403 (_1!1712 (_ BitVec 64)) (_2!1712 V!5449)) )
))
(declare-datatypes ((List!2333 0))(
  ( (Nil!2330) (Cons!2329 (h!2962 tuple2!3402) (t!7209 List!2333)) )
))
(declare-datatypes ((ListLongMap!2323 0))(
  ( (ListLongMap!2324 (toList!1177 List!2333)) )
))
(declare-fun contains!1285 (ListLongMap!2323 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!829 (array!7897 array!7899 (_ BitVec 32) (_ BitVec 32) V!5449 V!5449 (_ BitVec 32) Int) ListLongMap!2323)

(assert (=> b!185884 (= res!87946 (not (contains!1285 (getCurrentListMap!829 (_keys!5729 thiss!1248) (_values!3771 thiss!1248) (mask!8903 thiss!1248) (extraKeys!3525 thiss!1248) (zeroValue!3629 thiss!1248) (minValue!3629 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3788 thiss!1248)) key!828)))))

(declare-fun b!185885 () Bool)

(assert (=> b!185885 (= e!122296 tp_is_empty!4351)))

(assert (= (and start!18808 res!87944) b!185878))

(assert (= (and b!185878 res!87947) b!185880))

(assert (= (and b!185880 res!87945) b!185884))

(assert (= (and b!185884 res!87946) b!185881))

(assert (= (and b!185883 condMapEmpty!7488) mapIsEmpty!7488))

(assert (= (and b!185883 (not condMapEmpty!7488)) mapNonEmpty!7488))

(assert (= (and mapNonEmpty!7488 ((_ is ValueCellFull!1832) mapValue!7488)) b!185882))

(assert (= (and b!185883 ((_ is ValueCellFull!1832) mapDefault!7488)) b!185885))

(assert (= b!185879 b!185883))

(assert (= start!18808 b!185879))

(declare-fun m!213107 () Bool)

(assert (=> start!18808 m!213107))

(declare-fun m!213109 () Bool)

(assert (=> b!185884 m!213109))

(assert (=> b!185884 m!213109))

(declare-fun m!213111 () Bool)

(assert (=> b!185884 m!213111))

(declare-fun m!213113 () Bool)

(assert (=> b!185881 m!213113))

(declare-fun m!213115 () Bool)

(assert (=> b!185880 m!213115))

(declare-fun m!213117 () Bool)

(assert (=> b!185879 m!213117))

(declare-fun m!213119 () Bool)

(assert (=> b!185879 m!213119))

(declare-fun m!213121 () Bool)

(assert (=> mapNonEmpty!7488 m!213121))

(check-sat (not b!185880) (not mapNonEmpty!7488) (not start!18808) (not b!185879) tp_is_empty!4351 (not b!185881) (not b_next!4579) (not b!185884) b_and!11195)
(check-sat b_and!11195 (not b_next!4579))
