; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21624 () Bool)

(assert start!21624)

(declare-fun b!216775 () Bool)

(declare-fun b_free!5773 () Bool)

(declare-fun b_next!5773 () Bool)

(assert (=> b!216775 (= b_free!5773 (not b_next!5773))))

(declare-fun tp!20454 () Bool)

(declare-fun b_and!12663 () Bool)

(assert (=> b!216775 (= tp!20454 b_and!12663)))

(declare-fun b!216766 () Bool)

(declare-fun e!141031 () Bool)

(declare-fun e!141029 () Bool)

(assert (=> b!216766 (= e!141031 e!141029)))

(declare-fun res!106043 () Bool)

(assert (=> b!216766 (=> (not res!106043) (not e!141029))))

(declare-datatypes ((SeekEntryResult!751 0))(
  ( (MissingZero!751 (index!5174 (_ BitVec 32))) (Found!751 (index!5175 (_ BitVec 32))) (Intermediate!751 (undefined!1563 Bool) (index!5176 (_ BitVec 32)) (x!22671 (_ BitVec 32))) (Undefined!751) (MissingVacant!751 (index!5177 (_ BitVec 32))) )
))
(declare-fun lt!111225 () SeekEntryResult!751)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216766 (= res!106043 (or (= lt!111225 (MissingZero!751 index!297)) (= lt!111225 (MissingVacant!751 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7161 0))(
  ( (V!7162 (val!2862 Int)) )
))
(declare-datatypes ((ValueCell!2474 0))(
  ( (ValueCellFull!2474 (v!4880 V!7161)) (EmptyCell!2474) )
))
(declare-datatypes ((array!10509 0))(
  ( (array!10510 (arr!4976 (Array (_ BitVec 32) ValueCell!2474)) (size!5308 (_ BitVec 32))) )
))
(declare-datatypes ((array!10511 0))(
  ( (array!10512 (arr!4977 (Array (_ BitVec 32) (_ BitVec 64))) (size!5309 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2848 0))(
  ( (LongMapFixedSize!2849 (defaultEntry!4074 Int) (mask!9817 (_ BitVec 32)) (extraKeys!3811 (_ BitVec 32)) (zeroValue!3915 V!7161) (minValue!3915 V!7161) (_size!1473 (_ BitVec 32)) (_keys!6123 array!10511) (_values!4057 array!10509) (_vacant!1473 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2848)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10511 (_ BitVec 32)) SeekEntryResult!751)

(assert (=> b!216766 (= lt!111225 (seekEntryOrOpen!0 key!932 (_keys!6123 thiss!1504) (mask!9817 thiss!1504)))))

(declare-fun mapNonEmpty!9615 () Bool)

(declare-fun mapRes!9615 () Bool)

(declare-fun tp!20453 () Bool)

(declare-fun e!141025 () Bool)

(assert (=> mapNonEmpty!9615 (= mapRes!9615 (and tp!20453 e!141025))))

(declare-fun mapKey!9615 () (_ BitVec 32))

(declare-fun mapRest!9615 () (Array (_ BitVec 32) ValueCell!2474))

(declare-fun mapValue!9615 () ValueCell!2474)

(assert (=> mapNonEmpty!9615 (= (arr!4976 (_values!4057 thiss!1504)) (store mapRest!9615 mapKey!9615 mapValue!9615))))

(declare-fun b!216767 () Bool)

(declare-fun res!106045 () Bool)

(assert (=> b!216767 (=> (not res!106045) (not e!141029))))

(assert (=> b!216767 (= res!106045 (and (= (size!5308 (_values!4057 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9817 thiss!1504))) (= (size!5309 (_keys!6123 thiss!1504)) (size!5308 (_values!4057 thiss!1504))) (bvsge (mask!9817 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3811 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3811 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!106042 () Bool)

(assert (=> start!21624 (=> (not res!106042) (not e!141031))))

(declare-fun valid!1157 (LongMapFixedSize!2848) Bool)

(assert (=> start!21624 (= res!106042 (valid!1157 thiss!1504))))

(assert (=> start!21624 e!141031))

(declare-fun e!141030 () Bool)

(assert (=> start!21624 e!141030))

(assert (=> start!21624 true))

(declare-fun b!216768 () Bool)

(declare-fun res!106046 () Bool)

(assert (=> b!216768 (=> (not res!106046) (not e!141029))))

(declare-datatypes ((tuple2!4258 0))(
  ( (tuple2!4259 (_1!2140 (_ BitVec 64)) (_2!2140 V!7161)) )
))
(declare-datatypes ((List!3162 0))(
  ( (Nil!3159) (Cons!3158 (h!3805 tuple2!4258) (t!8117 List!3162)) )
))
(declare-datatypes ((ListLongMap!3171 0))(
  ( (ListLongMap!3172 (toList!1601 List!3162)) )
))
(declare-fun contains!1442 (ListLongMap!3171 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1129 (array!10511 array!10509 (_ BitVec 32) (_ BitVec 32) V!7161 V!7161 (_ BitVec 32) Int) ListLongMap!3171)

(assert (=> b!216768 (= res!106046 (contains!1442 (getCurrentListMap!1129 (_keys!6123 thiss!1504) (_values!4057 thiss!1504) (mask!9817 thiss!1504) (extraKeys!3811 thiss!1504) (zeroValue!3915 thiss!1504) (minValue!3915 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4074 thiss!1504)) key!932))))

(declare-fun b!216769 () Bool)

(declare-fun res!106041 () Bool)

(assert (=> b!216769 (=> (not res!106041) (not e!141031))))

(assert (=> b!216769 (= res!106041 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216770 () Bool)

(declare-fun res!106044 () Bool)

(assert (=> b!216770 (=> (not res!106044) (not e!141029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10511 (_ BitVec 32)) Bool)

(assert (=> b!216770 (= res!106044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6123 thiss!1504) (mask!9817 thiss!1504)))))

(declare-fun b!216771 () Bool)

(assert (=> b!216771 (= e!141029 false)))

(declare-fun lt!111224 () Bool)

(declare-datatypes ((List!3163 0))(
  ( (Nil!3160) (Cons!3159 (h!3806 (_ BitVec 64)) (t!8118 List!3163)) )
))
(declare-fun arrayNoDuplicates!0 (array!10511 (_ BitVec 32) List!3163) Bool)

(assert (=> b!216771 (= lt!111224 (arrayNoDuplicates!0 (_keys!6123 thiss!1504) #b00000000000000000000000000000000 Nil!3160))))

(declare-fun b!216772 () Bool)

(declare-fun e!141026 () Bool)

(declare-fun tp_is_empty!5635 () Bool)

(assert (=> b!216772 (= e!141026 tp_is_empty!5635)))

(declare-fun mapIsEmpty!9615 () Bool)

(assert (=> mapIsEmpty!9615 mapRes!9615))

(declare-fun b!216773 () Bool)

(assert (=> b!216773 (= e!141025 tp_is_empty!5635)))

(declare-fun b!216774 () Bool)

(declare-fun e!141028 () Bool)

(assert (=> b!216774 (= e!141028 (and e!141026 mapRes!9615))))

(declare-fun condMapEmpty!9615 () Bool)

(declare-fun mapDefault!9615 () ValueCell!2474)

