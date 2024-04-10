; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22948 () Bool)

(assert start!22948)

(declare-fun b!239914 () Bool)

(declare-fun b_free!6451 () Bool)

(declare-fun b_next!6451 () Bool)

(assert (=> b!239914 (= b_free!6451 (not b_next!6451))))

(declare-fun tp!22556 () Bool)

(declare-fun b_and!13417 () Bool)

(assert (=> b!239914 (= tp!22556 b_and!13417)))

(declare-fun b!239913 () Bool)

(declare-datatypes ((Unit!7373 0))(
  ( (Unit!7374) )
))
(declare-fun e!155772 () Unit!7373)

(declare-fun Unit!7375 () Unit!7373)

(assert (=> b!239913 (= e!155772 Unit!7375)))

(declare-fun lt!120884 () Unit!7373)

(declare-datatypes ((V!8065 0))(
  ( (V!8066 (val!3201 Int)) )
))
(declare-datatypes ((ValueCell!2813 0))(
  ( (ValueCellFull!2813 (v!5239 V!8065)) (EmptyCell!2813) )
))
(declare-datatypes ((array!11905 0))(
  ( (array!11906 (arr!5654 (Array (_ BitVec 32) ValueCell!2813)) (size!5995 (_ BitVec 32))) )
))
(declare-datatypes ((array!11907 0))(
  ( (array!11908 (arr!5655 (Array (_ BitVec 32) (_ BitVec 64))) (size!5996 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3526 0))(
  ( (LongMapFixedSize!3527 (defaultEntry!4448 Int) (mask!10500 (_ BitVec 32)) (extraKeys!4185 (_ BitVec 32)) (zeroValue!4289 V!8065) (minValue!4289 V!8065) (_size!1812 (_ BitVec 32)) (_keys!6550 array!11907) (_values!4431 array!11905) (_vacant!1812 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3526)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!333 (array!11907 array!11905 (_ BitVec 32) (_ BitVec 32) V!8065 V!8065 (_ BitVec 64) Int) Unit!7373)

(assert (=> b!239913 (= lt!120884 (lemmaInListMapThenSeekEntryOrOpenFindsIt!333 (_keys!6550 thiss!1504) (_values!4431 thiss!1504) (mask!10500 thiss!1504) (extraKeys!4185 thiss!1504) (zeroValue!4289 thiss!1504) (minValue!4289 thiss!1504) key!932 (defaultEntry!4448 thiss!1504)))))

(assert (=> b!239913 false))

(declare-fun e!155767 () Bool)

(declare-fun e!155763 () Bool)

(declare-fun tp_is_empty!6313 () Bool)

(declare-fun array_inv!3741 (array!11907) Bool)

(declare-fun array_inv!3742 (array!11905) Bool)

(assert (=> b!239914 (= e!155763 (and tp!22556 tp_is_empty!6313 (array_inv!3741 (_keys!6550 thiss!1504)) (array_inv!3742 (_values!4431 thiss!1504)) e!155767))))

(declare-fun b!239915 () Bool)

(declare-fun res!117595 () Bool)

(declare-fun e!155764 () Bool)

(assert (=> b!239915 (=> (not res!117595) (not e!155764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11907 (_ BitVec 32)) Bool)

(assert (=> b!239915 (= res!117595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6550 thiss!1504) (mask!10500 thiss!1504)))))

(declare-fun b!239916 () Bool)

(declare-fun e!155760 () Bool)

(assert (=> b!239916 (= e!155760 tp_is_empty!6313)))

(declare-fun b!239917 () Bool)

(declare-fun res!117599 () Bool)

(declare-fun e!155771 () Bool)

(assert (=> b!239917 (=> (not res!117599) (not e!155771))))

(declare-fun call!22313 () Bool)

(assert (=> b!239917 (= res!117599 call!22313)))

(declare-fun e!155770 () Bool)

(assert (=> b!239917 (= e!155770 e!155771)))

(declare-fun b!239918 () Bool)

(declare-fun e!155769 () Bool)

(assert (=> b!239918 (= e!155769 e!155764)))

(declare-fun res!117601 () Bool)

(assert (=> b!239918 (=> (not res!117601) (not e!155764))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239918 (= res!117601 (inRange!0 index!297 (mask!10500 thiss!1504)))))

(declare-fun lt!120883 () Unit!7373)

(assert (=> b!239918 (= lt!120883 e!155772)))

(declare-fun c!39983 () Bool)

(declare-datatypes ((tuple2!4718 0))(
  ( (tuple2!4719 (_1!2370 (_ BitVec 64)) (_2!2370 V!8065)) )
))
(declare-datatypes ((List!3601 0))(
  ( (Nil!3598) (Cons!3597 (h!4253 tuple2!4718) (t!8596 List!3601)) )
))
(declare-datatypes ((ListLongMap!3631 0))(
  ( (ListLongMap!3632 (toList!1831 List!3601)) )
))
(declare-fun contains!1719 (ListLongMap!3631 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1359 (array!11907 array!11905 (_ BitVec 32) (_ BitVec 32) V!8065 V!8065 (_ BitVec 32) Int) ListLongMap!3631)

(assert (=> b!239918 (= c!39983 (contains!1719 (getCurrentListMap!1359 (_keys!6550 thiss!1504) (_values!4431 thiss!1504) (mask!10500 thiss!1504) (extraKeys!4185 thiss!1504) (zeroValue!4289 thiss!1504) (minValue!4289 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4448 thiss!1504)) key!932))))

(declare-fun b!239919 () Bool)

(declare-fun res!117591 () Bool)

(declare-datatypes ((SeekEntryResult!1039 0))(
  ( (MissingZero!1039 (index!6326 (_ BitVec 32))) (Found!1039 (index!6327 (_ BitVec 32))) (Intermediate!1039 (undefined!1851 Bool) (index!6328 (_ BitVec 32)) (x!24135 (_ BitVec 32))) (Undefined!1039) (MissingVacant!1039 (index!6329 (_ BitVec 32))) )
))
(declare-fun lt!120882 () SeekEntryResult!1039)

(assert (=> b!239919 (= res!117591 (= (select (arr!5655 (_keys!6550 thiss!1504)) (index!6329 lt!120882)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155762 () Bool)

(assert (=> b!239919 (=> (not res!117591) (not e!155762))))

(declare-fun b!239920 () Bool)

(declare-fun e!155761 () Bool)

(declare-fun mapRes!10701 () Bool)

(assert (=> b!239920 (= e!155767 (and e!155761 mapRes!10701))))

(declare-fun condMapEmpty!10701 () Bool)

(declare-fun mapDefault!10701 () ValueCell!2813)

