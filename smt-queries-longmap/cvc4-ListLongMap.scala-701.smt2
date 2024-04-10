; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16714 () Bool)

(assert start!16714)

(declare-fun b!167691 () Bool)

(declare-fun b_free!4019 () Bool)

(declare-fun b_next!4019 () Bool)

(assert (=> b!167691 (= b_free!4019 (not b_next!4019))))

(declare-fun tp!14658 () Bool)

(declare-fun b_and!10433 () Bool)

(assert (=> b!167691 (= tp!14658 b_and!10433)))

(declare-fun b!167682 () Bool)

(declare-fun e!110155 () Bool)

(declare-fun e!110159 () Bool)

(assert (=> b!167682 (= e!110155 e!110159)))

(declare-fun res!79774 () Bool)

(assert (=> b!167682 (=> (not res!79774) (not e!110159))))

(declare-datatypes ((SeekEntryResult!484 0))(
  ( (MissingZero!484 (index!4104 (_ BitVec 32))) (Found!484 (index!4105 (_ BitVec 32))) (Intermediate!484 (undefined!1296 Bool) (index!4106 (_ BitVec 32)) (x!18544 (_ BitVec 32))) (Undefined!484) (MissingVacant!484 (index!4107 (_ BitVec 32))) )
))
(declare-fun lt!83820 () SeekEntryResult!484)

(assert (=> b!167682 (= res!79774 (and (not (is-Undefined!484 lt!83820)) (not (is-MissingVacant!484 lt!83820)) (not (is-MissingZero!484 lt!83820)) (is-Found!484 lt!83820)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4741 0))(
  ( (V!4742 (val!1955 Int)) )
))
(declare-datatypes ((ValueCell!1567 0))(
  ( (ValueCellFull!1567 (v!3820 V!4741)) (EmptyCell!1567) )
))
(declare-datatypes ((array!6739 0))(
  ( (array!6740 (arr!3205 (Array (_ BitVec 32) (_ BitVec 64))) (size!3493 (_ BitVec 32))) )
))
(declare-datatypes ((array!6741 0))(
  ( (array!6742 (arr!3206 (Array (_ BitVec 32) ValueCell!1567)) (size!3494 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2042 0))(
  ( (LongMapFixedSize!2043 (defaultEntry!3463 Int) (mask!8214 (_ BitVec 32)) (extraKeys!3204 (_ BitVec 32)) (zeroValue!3306 V!4741) (minValue!3306 V!4741) (_size!1070 (_ BitVec 32)) (_keys!5288 array!6739) (_values!3446 array!6741) (_vacant!1070 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2042)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6739 (_ BitVec 32)) SeekEntryResult!484)

(assert (=> b!167682 (= lt!83820 (seekEntryOrOpen!0 key!828 (_keys!5288 thiss!1248) (mask!8214 thiss!1248)))))

(declare-fun b!167683 () Bool)

(declare-datatypes ((Unit!5140 0))(
  ( (Unit!5141) )
))
(declare-fun e!110157 () Unit!5140)

(declare-fun lt!83824 () Unit!5140)

(assert (=> b!167683 (= e!110157 lt!83824)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!110 (array!6739 array!6741 (_ BitVec 32) (_ BitVec 32) V!4741 V!4741 (_ BitVec 64) Int) Unit!5140)

(assert (=> b!167683 (= lt!83824 (lemmaInListMapThenSeekEntryOrOpenFindsIt!110 (_keys!5288 thiss!1248) (_values!3446 thiss!1248) (mask!8214 thiss!1248) (extraKeys!3204 thiss!1248) (zeroValue!3306 thiss!1248) (minValue!3306 thiss!1248) key!828 (defaultEntry!3463 thiss!1248)))))

(declare-fun res!79773 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167683 (= res!79773 (inRange!0 (index!4105 lt!83820) (mask!8214 thiss!1248)))))

(declare-fun e!110154 () Bool)

(assert (=> b!167683 (=> (not res!79773) (not e!110154))))

(assert (=> b!167683 e!110154))

(declare-fun b!167684 () Bool)

(declare-fun res!79771 () Bool)

(assert (=> b!167684 (=> (not res!79771) (not e!110155))))

(assert (=> b!167684 (= res!79771 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6450 () Bool)

(declare-fun mapRes!6450 () Bool)

(declare-fun tp!14657 () Bool)

(declare-fun e!110156 () Bool)

(assert (=> mapNonEmpty!6450 (= mapRes!6450 (and tp!14657 e!110156))))

(declare-fun mapRest!6450 () (Array (_ BitVec 32) ValueCell!1567))

(declare-fun mapValue!6450 () ValueCell!1567)

(declare-fun mapKey!6450 () (_ BitVec 32))

(assert (=> mapNonEmpty!6450 (= (arr!3206 (_values!3446 thiss!1248)) (store mapRest!6450 mapKey!6450 mapValue!6450))))

(declare-fun res!79775 () Bool)

(assert (=> start!16714 (=> (not res!79775) (not e!110155))))

(declare-fun valid!890 (LongMapFixedSize!2042) Bool)

(assert (=> start!16714 (= res!79775 (valid!890 thiss!1248))))

(assert (=> start!16714 e!110155))

(declare-fun e!110153 () Bool)

(assert (=> start!16714 e!110153))

(assert (=> start!16714 true))

(declare-fun tp_is_empty!3821 () Bool)

(assert (=> start!16714 tp_is_empty!3821))

(declare-fun b!167685 () Bool)

(declare-fun e!110150 () Bool)

(assert (=> b!167685 (= e!110150 tp_is_empty!3821)))

(declare-fun b!167686 () Bool)

(assert (=> b!167686 (= e!110156 tp_is_empty!3821)))

(declare-fun b!167687 () Bool)

(declare-fun e!110152 () Bool)

(assert (=> b!167687 (= e!110152 (and e!110150 mapRes!6450))))

(declare-fun condMapEmpty!6450 () Bool)

(declare-fun mapDefault!6450 () ValueCell!1567)

