; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16716 () Bool)

(assert start!16716)

(declare-fun b!167733 () Bool)

(declare-fun b_free!4021 () Bool)

(declare-fun b_next!4021 () Bool)

(assert (=> b!167733 (= b_free!4021 (not b_next!4021))))

(declare-fun tp!14664 () Bool)

(declare-fun b_and!10435 () Bool)

(assert (=> b!167733 (= tp!14664 b_and!10435)))

(declare-fun b!167721 () Bool)

(declare-fun res!79794 () Bool)

(declare-fun e!110188 () Bool)

(assert (=> b!167721 (=> (not res!79794) (not e!110188))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!167721 (= res!79794 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167722 () Bool)

(declare-datatypes ((Unit!5142 0))(
  ( (Unit!5143) )
))
(declare-fun e!110187 () Unit!5142)

(declare-fun Unit!5144 () Unit!5142)

(assert (=> b!167722 (= e!110187 Unit!5144)))

(declare-fun lt!83845 () Unit!5142)

(declare-datatypes ((V!4745 0))(
  ( (V!4746 (val!1956 Int)) )
))
(declare-datatypes ((ValueCell!1568 0))(
  ( (ValueCellFull!1568 (v!3821 V!4745)) (EmptyCell!1568) )
))
(declare-datatypes ((array!6743 0))(
  ( (array!6744 (arr!3207 (Array (_ BitVec 32) (_ BitVec 64))) (size!3495 (_ BitVec 32))) )
))
(declare-datatypes ((array!6745 0))(
  ( (array!6746 (arr!3208 (Array (_ BitVec 32) ValueCell!1568)) (size!3496 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2044 0))(
  ( (LongMapFixedSize!2045 (defaultEntry!3464 Int) (mask!8217 (_ BitVec 32)) (extraKeys!3205 (_ BitVec 32)) (zeroValue!3307 V!4745) (minValue!3307 V!4745) (_size!1071 (_ BitVec 32)) (_keys!5289 array!6743) (_values!3447 array!6745) (_vacant!1071 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2044)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!111 (array!6743 array!6745 (_ BitVec 32) (_ BitVec 32) V!4745 V!4745 (_ BitVec 64) Int) Unit!5142)

(assert (=> b!167722 (= lt!83845 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!111 (_keys!5289 thiss!1248) (_values!3447 thiss!1248) (mask!8217 thiss!1248) (extraKeys!3205 thiss!1248) (zeroValue!3307 thiss!1248) (minValue!3307 thiss!1248) key!828 (defaultEntry!3464 thiss!1248)))))

(assert (=> b!167722 false))

(declare-fun b!167723 () Bool)

(declare-fun e!110185 () Bool)

(declare-fun tp_is_empty!3823 () Bool)

(assert (=> b!167723 (= e!110185 tp_is_empty!3823)))

(declare-fun e!110181 () Bool)

(declare-datatypes ((SeekEntryResult!485 0))(
  ( (MissingZero!485 (index!4108 (_ BitVec 32))) (Found!485 (index!4109 (_ BitVec 32))) (Intermediate!485 (undefined!1297 Bool) (index!4110 (_ BitVec 32)) (x!18553 (_ BitVec 32))) (Undefined!485) (MissingVacant!485 (index!4111 (_ BitVec 32))) )
))
(declare-fun lt!83840 () SeekEntryResult!485)

(declare-fun b!167724 () Bool)

(assert (=> b!167724 (= e!110181 (= (select (arr!3207 (_keys!5289 thiss!1248)) (index!4109 lt!83840)) key!828))))

(declare-fun b!167725 () Bool)

(declare-fun e!110180 () Bool)

(assert (=> b!167725 (= e!110188 e!110180)))

(declare-fun res!79797 () Bool)

(assert (=> b!167725 (=> (not res!79797) (not e!110180))))

(assert (=> b!167725 (= res!79797 (and (not (is-Undefined!485 lt!83840)) (not (is-MissingVacant!485 lt!83840)) (not (is-MissingZero!485 lt!83840)) (is-Found!485 lt!83840)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6743 (_ BitVec 32)) SeekEntryResult!485)

(assert (=> b!167725 (= lt!83840 (seekEntryOrOpen!0 key!828 (_keys!5289 thiss!1248) (mask!8217 thiss!1248)))))

(declare-fun b!167726 () Bool)

(declare-fun e!110186 () Bool)

(declare-fun e!110184 () Bool)

(declare-fun mapRes!6453 () Bool)

(assert (=> b!167726 (= e!110186 (and e!110184 mapRes!6453))))

(declare-fun condMapEmpty!6453 () Bool)

(declare-fun mapDefault!6453 () ValueCell!1568)

