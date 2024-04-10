; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19796 () Bool)

(assert start!19796)

(declare-fun b!193957 () Bool)

(declare-fun b_free!4717 () Bool)

(declare-fun b_next!4717 () Bool)

(assert (=> b!193957 (= b_free!4717 (not b_next!4717))))

(declare-fun tp!17021 () Bool)

(declare-fun b_and!11431 () Bool)

(assert (=> b!193957 (= tp!17021 b_and!11431)))

(declare-fun mapIsEmpty!7766 () Bool)

(declare-fun mapRes!7766 () Bool)

(assert (=> mapIsEmpty!7766 mapRes!7766))

(declare-fun b!193946 () Bool)

(declare-fun e!127607 () Bool)

(declare-fun tp_is_empty!4489 () Bool)

(assert (=> b!193946 (= e!127607 tp_is_empty!4489)))

(declare-fun b!193947 () Bool)

(declare-fun e!127608 () Bool)

(declare-fun e!127602 () Bool)

(assert (=> b!193947 (= e!127608 e!127602)))

(declare-fun res!91667 () Bool)

(assert (=> b!193947 (=> (not res!91667) (not e!127602))))

(declare-datatypes ((SeekEntryResult!693 0))(
  ( (MissingZero!693 (index!4942 (_ BitVec 32))) (Found!693 (index!4943 (_ BitVec 32))) (Intermediate!693 (undefined!1505 Bool) (index!4944 (_ BitVec 32)) (x!20689 (_ BitVec 32))) (Undefined!693) (MissingVacant!693 (index!4945 (_ BitVec 32))) )
))
(declare-fun lt!96639 () SeekEntryResult!693)

(assert (=> b!193947 (= res!91667 (and (not (is-Undefined!693 lt!96639)) (not (is-MissingVacant!693 lt!96639)) (not (is-MissingZero!693 lt!96639)) (is-Found!693 lt!96639)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5633 0))(
  ( (V!5634 (val!2289 Int)) )
))
(declare-datatypes ((ValueCell!1901 0))(
  ( (ValueCellFull!1901 (v!4251 V!5633)) (EmptyCell!1901) )
))
(declare-datatypes ((array!8229 0))(
  ( (array!8230 (arr!3873 (Array (_ BitVec 32) (_ BitVec 64))) (size!4197 (_ BitVec 32))) )
))
(declare-datatypes ((array!8231 0))(
  ( (array!8232 (arr!3874 (Array (_ BitVec 32) ValueCell!1901)) (size!4198 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2710 0))(
  ( (LongMapFixedSize!2711 (defaultEntry!3959 Int) (mask!9222 (_ BitVec 32)) (extraKeys!3696 (_ BitVec 32)) (zeroValue!3800 V!5633) (minValue!3800 V!5633) (_size!1404 (_ BitVec 32)) (_keys!5953 array!8229) (_values!3942 array!8231) (_vacant!1404 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2710)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8229 (_ BitVec 32)) SeekEntryResult!693)

(assert (=> b!193947 (= lt!96639 (seekEntryOrOpen!0 key!828 (_keys!5953 thiss!1248) (mask!9222 thiss!1248)))))

(declare-fun mapNonEmpty!7766 () Bool)

(declare-fun tp!17020 () Bool)

(declare-fun e!127609 () Bool)

(assert (=> mapNonEmpty!7766 (= mapRes!7766 (and tp!17020 e!127609))))

(declare-fun mapKey!7766 () (_ BitVec 32))

(declare-fun mapValue!7766 () ValueCell!1901)

(declare-fun mapRest!7766 () (Array (_ BitVec 32) ValueCell!1901))

(assert (=> mapNonEmpty!7766 (= (arr!3874 (_values!3942 thiss!1248)) (store mapRest!7766 mapKey!7766 mapValue!7766))))

(declare-fun b!193948 () Bool)

(declare-fun res!91666 () Bool)

(assert (=> b!193948 (=> (not res!91666) (not e!127608))))

(assert (=> b!193948 (= res!91666 (not (= key!828 (bvneg key!828))))))

(declare-fun e!127605 () Bool)

(declare-fun b!193949 () Bool)

(assert (=> b!193949 (= e!127605 (= (select (arr!3873 (_keys!5953 thiss!1248)) (index!4943 lt!96639)) key!828))))

(declare-fun b!193950 () Bool)

(declare-fun e!127604 () Bool)

(declare-fun e!127603 () Bool)

(assert (=> b!193950 (= e!127604 e!127603)))

(declare-fun res!91665 () Bool)

(assert (=> b!193950 (=> (not res!91665) (not e!127603))))

(declare-datatypes ((tuple2!3558 0))(
  ( (tuple2!3559 (_1!1790 (_ BitVec 64)) (_2!1790 V!5633)) )
))
(declare-datatypes ((List!2448 0))(
  ( (Nil!2445) (Cons!2444 (h!3085 tuple2!3558) (t!7374 List!2448)) )
))
(declare-datatypes ((ListLongMap!2475 0))(
  ( (ListLongMap!2476 (toList!1253 List!2448)) )
))
(declare-fun lt!96640 () ListLongMap!2475)

(declare-fun contains!1378 (ListLongMap!2475 (_ BitVec 64)) Bool)

(assert (=> b!193950 (= res!91665 (contains!1378 lt!96640 key!828))))

(declare-fun lt!96632 () LongMapFixedSize!2710)

(declare-fun map!2028 (LongMapFixedSize!2710) ListLongMap!2475)

(assert (=> b!193950 (= lt!96640 (map!2028 lt!96632))))

(declare-fun b!193951 () Bool)

(declare-fun lt!96630 () tuple2!3558)

(declare-fun +!321 (ListLongMap!2475 tuple2!3558) ListLongMap!2475)

(assert (=> b!193951 (= e!127603 (= lt!96640 (+!321 (map!2028 thiss!1248) lt!96630)))))

(declare-fun b!193952 () Bool)

(declare-datatypes ((Unit!5875 0))(
  ( (Unit!5876) )
))
(declare-fun e!127600 () Unit!5875)

(declare-fun Unit!5877 () Unit!5875)

(assert (=> b!193952 (= e!127600 Unit!5877)))

(declare-fun lt!96641 () Unit!5875)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!195 (array!8229 array!8231 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 64) Int) Unit!5875)

(assert (=> b!193952 (= lt!96641 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!195 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) key!828 (defaultEntry!3959 thiss!1248)))))

(assert (=> b!193952 false))

(declare-fun b!193953 () Bool)

(assert (=> b!193953 (= e!127602 (not e!127604))))

(declare-fun res!91668 () Bool)

(assert (=> b!193953 (=> (not res!91668) (not e!127604))))

(declare-fun valid!1112 (LongMapFixedSize!2710) Bool)

(assert (=> b!193953 (= res!91668 (valid!1112 lt!96632))))

(declare-fun lt!96631 () ListLongMap!2475)

(assert (=> b!193953 (contains!1378 lt!96631 (select (arr!3873 (_keys!5953 thiss!1248)) (index!4943 lt!96639)))))

(declare-fun lt!96633 () array!8231)

(declare-fun lt!96636 () Unit!5875)

(declare-fun lemmaValidKeyInArrayIsInListMap!146 (array!8229 array!8231 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) Int) Unit!5875)

(assert (=> b!193953 (= lt!96636 (lemmaValidKeyInArrayIsInListMap!146 (_keys!5953 thiss!1248) lt!96633 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4943 lt!96639) (defaultEntry!3959 thiss!1248)))))

(assert (=> b!193953 (= lt!96632 (LongMapFixedSize!2711 (defaultEntry!3959 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (_size!1404 thiss!1248) (_keys!5953 thiss!1248) lt!96633 (_vacant!1404 thiss!1248)))))

(declare-fun lt!96638 () ListLongMap!2475)

(assert (=> b!193953 (= lt!96638 lt!96631)))

(declare-fun getCurrentListMap!901 (array!8229 array!8231 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) Int) ListLongMap!2475)

(assert (=> b!193953 (= lt!96631 (getCurrentListMap!901 (_keys!5953 thiss!1248) lt!96633 (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96635 () ListLongMap!2475)

(assert (=> b!193953 (= lt!96638 (+!321 lt!96635 lt!96630))))

(declare-fun v!309 () V!5633)

(assert (=> b!193953 (= lt!96633 (array!8232 (store (arr!3874 (_values!3942 thiss!1248)) (index!4943 lt!96639) (ValueCellFull!1901 v!309)) (size!4198 (_values!3942 thiss!1248))))))

(assert (=> b!193953 (= lt!96630 (tuple2!3559 key!828 v!309))))

(declare-fun lt!96637 () Unit!5875)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!122 (array!8229 array!8231 (_ BitVec 32) (_ BitVec 32) V!5633 V!5633 (_ BitVec 32) (_ BitVec 64) V!5633 Int) Unit!5875)

(assert (=> b!193953 (= lt!96637 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!122 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) (index!4943 lt!96639) key!828 v!309 (defaultEntry!3959 thiss!1248)))))

(declare-fun lt!96642 () Unit!5875)

(assert (=> b!193953 (= lt!96642 e!127600)))

(declare-fun c!34979 () Bool)

(assert (=> b!193953 (= c!34979 (contains!1378 lt!96635 key!828))))

(assert (=> b!193953 (= lt!96635 (getCurrentListMap!901 (_keys!5953 thiss!1248) (_values!3942 thiss!1248) (mask!9222 thiss!1248) (extraKeys!3696 thiss!1248) (zeroValue!3800 thiss!1248) (minValue!3800 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3959 thiss!1248)))))

(declare-fun res!91664 () Bool)

(assert (=> start!19796 (=> (not res!91664) (not e!127608))))

(assert (=> start!19796 (= res!91664 (valid!1112 thiss!1248))))

(assert (=> start!19796 e!127608))

(declare-fun e!127599 () Bool)

(assert (=> start!19796 e!127599))

(assert (=> start!19796 true))

(assert (=> start!19796 tp_is_empty!4489))

(declare-fun b!193954 () Bool)

(declare-fun e!127606 () Bool)

(assert (=> b!193954 (= e!127606 (and e!127607 mapRes!7766))))

(declare-fun condMapEmpty!7766 () Bool)

(declare-fun mapDefault!7766 () ValueCell!1901)

