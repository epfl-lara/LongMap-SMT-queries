; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23218 () Bool)

(assert start!23218)

(declare-fun b!243775 () Bool)

(declare-fun b_free!6529 () Bool)

(declare-fun b_next!6529 () Bool)

(assert (=> b!243775 (= b_free!6529 (not b_next!6529))))

(declare-fun tp!22809 () Bool)

(declare-fun b_and!13511 () Bool)

(assert (=> b!243775 (= tp!22809 b_and!13511)))

(declare-fun b!243765 () Bool)

(declare-fun e!158207 () Bool)

(declare-fun e!158198 () Bool)

(assert (=> b!243765 (= e!158207 e!158198)))

(declare-fun res!119509 () Bool)

(assert (=> b!243765 (=> (not res!119509) (not e!158198))))

(declare-datatypes ((V!8169 0))(
  ( (V!8170 (val!3240 Int)) )
))
(declare-datatypes ((ValueCell!2852 0))(
  ( (ValueCellFull!2852 (v!5287 V!8169)) (EmptyCell!2852) )
))
(declare-datatypes ((array!12073 0))(
  ( (array!12074 (arr!5732 (Array (_ BitVec 32) ValueCell!2852)) (size!6074 (_ BitVec 32))) )
))
(declare-datatypes ((array!12075 0))(
  ( (array!12076 (arr!5733 (Array (_ BitVec 32) (_ BitVec 64))) (size!6075 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3604 0))(
  ( (LongMapFixedSize!3605 (defaultEntry!4515 Int) (mask!10610 (_ BitVec 32)) (extraKeys!4252 (_ BitVec 32)) (zeroValue!4356 V!8169) (minValue!4356 V!8169) (_size!1851 (_ BitVec 32)) (_keys!6626 array!12075) (_values!4498 array!12073) (_vacant!1851 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3604)

(assert (=> b!243765 (= res!119509 (and (bvslt (size!6075 (_keys!6626 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6075 (_keys!6626 thiss!1504)))))))

(declare-datatypes ((Unit!7521 0))(
  ( (Unit!7522) )
))
(declare-fun lt!122280 () Unit!7521)

(declare-fun e!158190 () Unit!7521)

(assert (=> b!243765 (= lt!122280 e!158190)))

(declare-fun c!40687 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!243765 (= c!40687 (arrayContainsKey!0 (_keys!6626 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10837 () Bool)

(declare-fun mapRes!10837 () Bool)

(assert (=> mapIsEmpty!10837 mapRes!10837))

(declare-fun b!243766 () Bool)

(declare-fun c!40686 () Bool)

(declare-datatypes ((SeekEntryResult!1075 0))(
  ( (MissingZero!1075 (index!6470 (_ BitVec 32))) (Found!1075 (index!6471 (_ BitVec 32))) (Intermediate!1075 (undefined!1887 Bool) (index!6472 (_ BitVec 32)) (x!24343 (_ BitVec 32))) (Undefined!1075) (MissingVacant!1075 (index!6473 (_ BitVec 32))) )
))
(declare-fun lt!122281 () SeekEntryResult!1075)

(assert (=> b!243766 (= c!40686 (is-MissingVacant!1075 lt!122281))))

(declare-fun e!158197 () Bool)

(declare-fun e!158201 () Bool)

(assert (=> b!243766 (= e!158197 e!158201)))

(declare-fun b!243767 () Bool)

(declare-fun e!158199 () Bool)

(declare-fun call!22730 () Bool)

(assert (=> b!243767 (= e!158199 (not call!22730))))

(declare-fun b!243768 () Bool)

(declare-fun e!158200 () Unit!7521)

(declare-fun Unit!7523 () Unit!7521)

(assert (=> b!243768 (= e!158200 Unit!7523)))

(declare-fun lt!122276 () Unit!7521)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!362 (array!12075 array!12073 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 64) Int) Unit!7521)

(assert (=> b!243768 (= lt!122276 (lemmaInListMapThenSeekEntryOrOpenFindsIt!362 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 (defaultEntry!4515 thiss!1504)))))

(assert (=> b!243768 false))

(declare-fun b!243769 () Bool)

(declare-fun e!158202 () Bool)

(declare-fun e!158204 () Bool)

(assert (=> b!243769 (= e!158202 (and e!158204 mapRes!10837))))

(declare-fun condMapEmpty!10837 () Bool)

(declare-fun mapDefault!10837 () ValueCell!2852)

