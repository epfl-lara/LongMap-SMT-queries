; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19070 () Bool)

(assert start!19070)

(declare-fun b!187862 () Bool)

(declare-fun b_free!4619 () Bool)

(declare-fun b_next!4619 () Bool)

(assert (=> b!187862 (= b_free!4619 (not b_next!4619))))

(declare-fun tp!16673 () Bool)

(declare-fun b_and!11243 () Bool)

(assert (=> b!187862 (= tp!16673 b_and!11243)))

(declare-fun b!187852 () Bool)

(declare-datatypes ((Unit!5664 0))(
  ( (Unit!5665) )
))
(declare-fun e!123650 () Unit!5664)

(declare-fun lt!92946 () Unit!5664)

(assert (=> b!187852 (= e!123650 lt!92946)))

(declare-datatypes ((V!5501 0))(
  ( (V!5502 (val!2240 Int)) )
))
(declare-datatypes ((ValueCell!1852 0))(
  ( (ValueCellFull!1852 (v!4156 V!5501)) (EmptyCell!1852) )
))
(declare-datatypes ((array!8001 0))(
  ( (array!8002 (arr!3775 (Array (_ BitVec 32) (_ BitVec 64))) (size!4094 (_ BitVec 32))) )
))
(declare-datatypes ((array!8003 0))(
  ( (array!8004 (arr!3776 (Array (_ BitVec 32) ValueCell!1852)) (size!4095 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2612 0))(
  ( (LongMapFixedSize!2613 (defaultEntry!3832 Int) (mask!8986 (_ BitVec 32)) (extraKeys!3569 (_ BitVec 32)) (zeroValue!3673 V!5501) (minValue!3673 V!5501) (_size!1355 (_ BitVec 32)) (_keys!5787 array!8001) (_values!3815 array!8003) (_vacant!1355 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2612)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!153 (array!8001 array!8003 (_ BitVec 32) (_ BitVec 32) V!5501 V!5501 (_ BitVec 64) Int) Unit!5664)

(assert (=> b!187852 (= lt!92946 (lemmaInListMapThenSeekEntryOrOpenFindsIt!153 (_keys!5787 thiss!1248) (_values!3815 thiss!1248) (mask!8986 thiss!1248) (extraKeys!3569 thiss!1248) (zeroValue!3673 thiss!1248) (minValue!3673 thiss!1248) key!828 (defaultEntry!3832 thiss!1248)))))

(declare-fun res!88815 () Bool)

(declare-datatypes ((SeekEntryResult!651 0))(
  ( (MissingZero!651 (index!4774 (_ BitVec 32))) (Found!651 (index!4775 (_ BitVec 32))) (Intermediate!651 (undefined!1463 Bool) (index!4776 (_ BitVec 32)) (x!20311 (_ BitVec 32))) (Undefined!651) (MissingVacant!651 (index!4777 (_ BitVec 32))) )
))
(declare-fun lt!92945 () SeekEntryResult!651)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187852 (= res!88815 (inRange!0 (index!4775 lt!92945) (mask!8986 thiss!1248)))))

(declare-fun e!123651 () Bool)

(assert (=> b!187852 (=> (not res!88815) (not e!123651))))

(assert (=> b!187852 e!123651))

(declare-fun b!187853 () Bool)

(declare-fun Unit!5666 () Unit!5664)

(assert (=> b!187853 (= e!123650 Unit!5666)))

(declare-fun lt!92943 () Unit!5664)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!157 (array!8001 array!8003 (_ BitVec 32) (_ BitVec 32) V!5501 V!5501 (_ BitVec 64) Int) Unit!5664)

(assert (=> b!187853 (= lt!92943 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!157 (_keys!5787 thiss!1248) (_values!3815 thiss!1248) (mask!8986 thiss!1248) (extraKeys!3569 thiss!1248) (zeroValue!3673 thiss!1248) (minValue!3673 thiss!1248) key!828 (defaultEntry!3832 thiss!1248)))))

(assert (=> b!187853 false))

(declare-fun b!187854 () Bool)

(declare-fun e!123648 () Bool)

(declare-fun e!123649 () Bool)

(assert (=> b!187854 (= e!123648 e!123649)))

(declare-fun res!88813 () Bool)

(assert (=> b!187854 (=> (not res!88813) (not e!123649))))

(assert (=> b!187854 (= res!88813 (and (not (is-Undefined!651 lt!92945)) (not (is-MissingVacant!651 lt!92945)) (not (is-MissingZero!651 lt!92945)) (is-Found!651 lt!92945)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8001 (_ BitVec 32)) SeekEntryResult!651)

(assert (=> b!187854 (= lt!92945 (seekEntryOrOpen!0 key!828 (_keys!5787 thiss!1248) (mask!8986 thiss!1248)))))

(declare-fun b!187855 () Bool)

(declare-fun e!123646 () Bool)

(assert (=> b!187855 (= e!123649 e!123646)))

(declare-fun res!88814 () Bool)

(assert (=> b!187855 (=> (not res!88814) (not e!123646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!187855 (= res!88814 (validMask!0 (mask!8986 thiss!1248)))))

(declare-fun lt!92944 () Unit!5664)

(assert (=> b!187855 (= lt!92944 e!123650)))

(declare-fun c!33739 () Bool)

(declare-datatypes ((tuple2!3484 0))(
  ( (tuple2!3485 (_1!1753 (_ BitVec 64)) (_2!1753 V!5501)) )
))
(declare-datatypes ((List!2386 0))(
  ( (Nil!2383) (Cons!2382 (h!3018 tuple2!3484) (t!7280 List!2386)) )
))
(declare-datatypes ((ListLongMap!2401 0))(
  ( (ListLongMap!2402 (toList!1216 List!2386)) )
))
(declare-fun contains!1318 (ListLongMap!2401 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!864 (array!8001 array!8003 (_ BitVec 32) (_ BitVec 32) V!5501 V!5501 (_ BitVec 32) Int) ListLongMap!2401)

(assert (=> b!187855 (= c!33739 (contains!1318 (getCurrentListMap!864 (_keys!5787 thiss!1248) (_values!3815 thiss!1248) (mask!8986 thiss!1248) (extraKeys!3569 thiss!1248) (zeroValue!3673 thiss!1248) (minValue!3673 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3832 thiss!1248)) key!828))))

(declare-fun b!187856 () Bool)

(declare-fun e!123643 () Bool)

(declare-fun tp_is_empty!4391 () Bool)

(assert (=> b!187856 (= e!123643 tp_is_empty!4391)))

(declare-fun mapIsEmpty!7566 () Bool)

(declare-fun mapRes!7566 () Bool)

(assert (=> mapIsEmpty!7566 mapRes!7566))

(declare-fun res!88817 () Bool)

(assert (=> start!19070 (=> (not res!88817) (not e!123648))))

(declare-fun valid!1075 (LongMapFixedSize!2612) Bool)

(assert (=> start!19070 (= res!88817 (valid!1075 thiss!1248))))

(assert (=> start!19070 e!123648))

(declare-fun e!123645 () Bool)

(assert (=> start!19070 e!123645))

(assert (=> start!19070 true))

(declare-fun b!187857 () Bool)

(declare-fun e!123647 () Bool)

(assert (=> b!187857 (= e!123647 tp_is_empty!4391)))

(declare-fun b!187858 () Bool)

(declare-fun e!123652 () Bool)

(assert (=> b!187858 (= e!123652 (and e!123643 mapRes!7566))))

(declare-fun condMapEmpty!7566 () Bool)

(declare-fun mapDefault!7566 () ValueCell!1852)

