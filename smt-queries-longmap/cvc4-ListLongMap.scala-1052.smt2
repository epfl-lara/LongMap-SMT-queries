; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21998 () Bool)

(assert start!21998)

(declare-fun b!226114 () Bool)

(declare-fun b_free!6065 () Bool)

(declare-fun b_next!6065 () Bool)

(assert (=> b!226114 (= b_free!6065 (not b_next!6065))))

(declare-fun tp!21336 () Bool)

(declare-fun b_and!12963 () Bool)

(assert (=> b!226114 (= tp!21336 b_and!12963)))

(declare-fun mapIsEmpty!10060 () Bool)

(declare-fun mapRes!10060 () Bool)

(assert (=> mapIsEmpty!10060 mapRes!10060))

(declare-fun res!111297 () Bool)

(declare-fun e!146725 () Bool)

(assert (=> start!21998 (=> (not res!111297) (not e!146725))))

(declare-datatypes ((V!7549 0))(
  ( (V!7550 (val!3008 Int)) )
))
(declare-datatypes ((ValueCell!2620 0))(
  ( (ValueCellFull!2620 (v!5028 V!7549)) (EmptyCell!2620) )
))
(declare-datatypes ((array!11097 0))(
  ( (array!11098 (arr!5268 (Array (_ BitVec 32) ValueCell!2620)) (size!5601 (_ BitVec 32))) )
))
(declare-datatypes ((array!11099 0))(
  ( (array!11100 (arr!5269 (Array (_ BitVec 32) (_ BitVec 64))) (size!5602 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3140 0))(
  ( (LongMapFixedSize!3141 (defaultEntry!4229 Int) (mask!10077 (_ BitVec 32)) (extraKeys!3966 (_ BitVec 32)) (zeroValue!4070 V!7549) (minValue!4070 V!7549) (_size!1619 (_ BitVec 32)) (_keys!6283 array!11099) (_values!4212 array!11097) (_vacant!1619 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3140)

(declare-fun valid!1263 (LongMapFixedSize!3140) Bool)

(assert (=> start!21998 (= res!111297 (valid!1263 thiss!1504))))

(assert (=> start!21998 e!146725))

(declare-fun e!146723 () Bool)

(assert (=> start!21998 e!146723))

(assert (=> start!21998 true))

(declare-fun b!226102 () Bool)

(declare-fun res!111300 () Bool)

(declare-fun e!146718 () Bool)

(assert (=> b!226102 (=> (not res!111300) (not e!146718))))

(declare-fun call!21029 () Bool)

(assert (=> b!226102 (= res!111300 call!21029)))

(declare-fun e!146715 () Bool)

(assert (=> b!226102 (= e!146715 e!146718)))

(declare-fun b!226103 () Bool)

(declare-fun e!146724 () Bool)

(assert (=> b!226103 (= e!146724 true)))

(declare-fun lt!113839 () Bool)

(declare-datatypes ((List!3367 0))(
  ( (Nil!3364) (Cons!3363 (h!4011 (_ BitVec 64)) (t!8326 List!3367)) )
))
(declare-fun arrayNoDuplicates!0 (array!11099 (_ BitVec 32) List!3367) Bool)

(assert (=> b!226103 (= lt!113839 (arrayNoDuplicates!0 (_keys!6283 thiss!1504) #b00000000000000000000000000000000 Nil!3364))))

(declare-fun b!226104 () Bool)

(declare-datatypes ((Unit!6830 0))(
  ( (Unit!6831) )
))
(declare-fun e!146717 () Unit!6830)

(declare-fun Unit!6832 () Unit!6830)

(assert (=> b!226104 (= e!146717 Unit!6832)))

(declare-fun lt!113836 () Unit!6830)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!253 (array!11099 array!11097 (_ BitVec 32) (_ BitVec 32) V!7549 V!7549 (_ BitVec 64) Int) Unit!6830)

(assert (=> b!226104 (= lt!113836 (lemmaInListMapThenSeekEntryOrOpenFindsIt!253 (_keys!6283 thiss!1504) (_values!4212 thiss!1504) (mask!10077 thiss!1504) (extraKeys!3966 thiss!1504) (zeroValue!4070 thiss!1504) (minValue!4070 thiss!1504) key!932 (defaultEntry!4229 thiss!1504)))))

(assert (=> b!226104 false))

(declare-fun b!226105 () Bool)

(declare-fun res!111295 () Bool)

(declare-datatypes ((SeekEntryResult!878 0))(
  ( (MissingZero!878 (index!5682 (_ BitVec 32))) (Found!878 (index!5683 (_ BitVec 32))) (Intermediate!878 (undefined!1690 Bool) (index!5684 (_ BitVec 32)) (x!23210 (_ BitVec 32))) (Undefined!878) (MissingVacant!878 (index!5685 (_ BitVec 32))) )
))
(declare-fun lt!113845 () SeekEntryResult!878)

(assert (=> b!226105 (= res!111295 (= (select (arr!5269 (_keys!6283 thiss!1504)) (index!5685 lt!113845)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!146726 () Bool)

(assert (=> b!226105 (=> (not res!111295) (not e!146726))))

(declare-fun b!226106 () Bool)

(declare-fun c!37488 () Bool)

(assert (=> b!226106 (= c!37488 (is-MissingVacant!878 lt!113845))))

(declare-fun e!146721 () Bool)

(assert (=> b!226106 (= e!146715 e!146721)))

(declare-fun b!226107 () Bool)

(declare-fun res!111293 () Bool)

(assert (=> b!226107 (=> res!111293 e!146724)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11099 (_ BitVec 32)) Bool)

(assert (=> b!226107 (= res!111293 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6283 thiss!1504) (mask!10077 thiss!1504))))))

(declare-fun b!226108 () Bool)

(declare-fun e!146728 () Bool)

(declare-fun e!146719 () Bool)

(assert (=> b!226108 (= e!146728 (and e!146719 mapRes!10060))))

(declare-fun condMapEmpty!10060 () Bool)

(declare-fun mapDefault!10060 () ValueCell!2620)

