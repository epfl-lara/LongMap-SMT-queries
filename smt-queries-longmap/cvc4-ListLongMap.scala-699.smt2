; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16702 () Bool)

(assert start!16702)

(declare-fun b!167448 () Bool)

(declare-fun b_free!4007 () Bool)

(declare-fun b_next!4007 () Bool)

(assert (=> b!167448 (= b_free!4007 (not b_next!4007))))

(declare-fun tp!14622 () Bool)

(declare-fun b_and!10421 () Bool)

(assert (=> b!167448 (= tp!14622 b_and!10421)))

(declare-fun e!109973 () Bool)

(declare-fun tp_is_empty!3809 () Bool)

(declare-fun e!109972 () Bool)

(declare-datatypes ((V!4725 0))(
  ( (V!4726 (val!1949 Int)) )
))
(declare-datatypes ((ValueCell!1561 0))(
  ( (ValueCellFull!1561 (v!3814 V!4725)) (EmptyCell!1561) )
))
(declare-datatypes ((array!6715 0))(
  ( (array!6716 (arr!3193 (Array (_ BitVec 32) (_ BitVec 64))) (size!3481 (_ BitVec 32))) )
))
(declare-datatypes ((array!6717 0))(
  ( (array!6718 (arr!3194 (Array (_ BitVec 32) ValueCell!1561)) (size!3482 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2030 0))(
  ( (LongMapFixedSize!2031 (defaultEntry!3457 Int) (mask!8204 (_ BitVec 32)) (extraKeys!3198 (_ BitVec 32)) (zeroValue!3300 V!4725) (minValue!3300 V!4725) (_size!1064 (_ BitVec 32)) (_keys!5282 array!6715) (_values!3440 array!6717) (_vacant!1064 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2030)

(declare-fun array_inv!2059 (array!6715) Bool)

(declare-fun array_inv!2060 (array!6717) Bool)

(assert (=> b!167448 (= e!109973 (and tp!14622 tp_is_empty!3809 (array_inv!2059 (_keys!5282 thiss!1248)) (array_inv!2060 (_values!3440 thiss!1248)) e!109972))))

(declare-fun b!167449 () Bool)

(declare-datatypes ((Unit!5129 0))(
  ( (Unit!5130) )
))
(declare-fun e!109976 () Unit!5129)

(declare-fun lt!83696 () Unit!5129)

(assert (=> b!167449 (= e!109976 lt!83696)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!107 (array!6715 array!6717 (_ BitVec 32) (_ BitVec 32) V!4725 V!4725 (_ BitVec 64) Int) Unit!5129)

(assert (=> b!167449 (= lt!83696 (lemmaInListMapThenSeekEntryOrOpenFindsIt!107 (_keys!5282 thiss!1248) (_values!3440 thiss!1248) (mask!8204 thiss!1248) (extraKeys!3198 thiss!1248) (zeroValue!3300 thiss!1248) (minValue!3300 thiss!1248) key!828 (defaultEntry!3457 thiss!1248)))))

(declare-fun res!79648 () Bool)

(declare-datatypes ((SeekEntryResult!480 0))(
  ( (MissingZero!480 (index!4088 (_ BitVec 32))) (Found!480 (index!4089 (_ BitVec 32))) (Intermediate!480 (undefined!1292 Bool) (index!4090 (_ BitVec 32)) (x!18524 (_ BitVec 32))) (Undefined!480) (MissingVacant!480 (index!4091 (_ BitVec 32))) )
))
(declare-fun lt!83697 () SeekEntryResult!480)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167449 (= res!79648 (inRange!0 (index!4089 lt!83697) (mask!8204 thiss!1248)))))

(declare-fun e!109974 () Bool)

(assert (=> b!167449 (=> (not res!79648) (not e!109974))))

(assert (=> b!167449 e!109974))

(declare-fun b!167450 () Bool)

(declare-fun e!109977 () Bool)

(assert (=> b!167450 (= e!109977 false)))

(declare-fun lt!83694 () Bool)

(declare-datatypes ((List!2131 0))(
  ( (Nil!2128) (Cons!2127 (h!2744 (_ BitVec 64)) (t!6933 List!2131)) )
))
(declare-fun arrayNoDuplicates!0 (array!6715 (_ BitVec 32) List!2131) Bool)

(assert (=> b!167450 (= lt!83694 (arrayNoDuplicates!0 (_keys!5282 thiss!1248) #b00000000000000000000000000000000 Nil!2128))))

(declare-fun res!79650 () Bool)

(declare-fun e!109971 () Bool)

(assert (=> start!16702 (=> (not res!79650) (not e!109971))))

(declare-fun valid!887 (LongMapFixedSize!2030) Bool)

(assert (=> start!16702 (= res!79650 (valid!887 thiss!1248))))

(assert (=> start!16702 e!109971))

(assert (=> start!16702 e!109973))

(assert (=> start!16702 true))

(declare-fun b!167451 () Bool)

(declare-fun e!109975 () Bool)

(assert (=> b!167451 (= e!109975 tp_is_empty!3809)))

(declare-fun b!167452 () Bool)

(declare-fun e!109979 () Bool)

(assert (=> b!167452 (= e!109979 tp_is_empty!3809)))

(declare-fun b!167453 () Bool)

(declare-fun mapRes!6432 () Bool)

(assert (=> b!167453 (= e!109972 (and e!109979 mapRes!6432))))

(declare-fun condMapEmpty!6432 () Bool)

(declare-fun mapDefault!6432 () ValueCell!1561)

