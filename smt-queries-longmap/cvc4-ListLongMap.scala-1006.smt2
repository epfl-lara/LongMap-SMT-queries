; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21640 () Bool)

(assert start!21640)

(declare-fun b!217034 () Bool)

(declare-fun b_free!5789 () Bool)

(declare-fun b_next!5789 () Bool)

(assert (=> b!217034 (= b_free!5789 (not b_next!5789))))

(declare-fun tp!20501 () Bool)

(declare-fun b_and!12679 () Bool)

(assert (=> b!217034 (= tp!20501 b_and!12679)))

(declare-fun b!217030 () Bool)

(declare-fun res!106214 () Bool)

(declare-fun e!141196 () Bool)

(assert (=> b!217030 (=> (not res!106214) (not e!141196))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217030 (= res!106214 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217031 () Bool)

(declare-fun e!141197 () Bool)

(assert (=> b!217031 (= e!141196 e!141197)))

(declare-fun res!106211 () Bool)

(assert (=> b!217031 (=> (not res!106211) (not e!141197))))

(declare-datatypes ((SeekEntryResult!758 0))(
  ( (MissingZero!758 (index!5202 (_ BitVec 32))) (Found!758 (index!5203 (_ BitVec 32))) (Intermediate!758 (undefined!1570 Bool) (index!5204 (_ BitVec 32)) (x!22694 (_ BitVec 32))) (Undefined!758) (MissingVacant!758 (index!5205 (_ BitVec 32))) )
))
(declare-fun lt!111273 () SeekEntryResult!758)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217031 (= res!106211 (or (= lt!111273 (MissingZero!758 index!297)) (= lt!111273 (MissingVacant!758 index!297))))))

(declare-datatypes ((V!7181 0))(
  ( (V!7182 (val!2870 Int)) )
))
(declare-datatypes ((ValueCell!2482 0))(
  ( (ValueCellFull!2482 (v!4888 V!7181)) (EmptyCell!2482) )
))
(declare-datatypes ((array!10541 0))(
  ( (array!10542 (arr!4992 (Array (_ BitVec 32) ValueCell!2482)) (size!5324 (_ BitVec 32))) )
))
(declare-datatypes ((array!10543 0))(
  ( (array!10544 (arr!4993 (Array (_ BitVec 32) (_ BitVec 64))) (size!5325 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2864 0))(
  ( (LongMapFixedSize!2865 (defaultEntry!4082 Int) (mask!9829 (_ BitVec 32)) (extraKeys!3819 (_ BitVec 32)) (zeroValue!3923 V!7181) (minValue!3923 V!7181) (_size!1481 (_ BitVec 32)) (_keys!6131 array!10543) (_values!4065 array!10541) (_vacant!1481 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2864)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10543 (_ BitVec 32)) SeekEntryResult!758)

(assert (=> b!217031 (= lt!111273 (seekEntryOrOpen!0 key!932 (_keys!6131 thiss!1504) (mask!9829 thiss!1504)))))

(declare-fun mapNonEmpty!9639 () Bool)

(declare-fun mapRes!9639 () Bool)

(declare-fun tp!20502 () Bool)

(declare-fun e!141193 () Bool)

(assert (=> mapNonEmpty!9639 (= mapRes!9639 (and tp!20502 e!141193))))

(declare-fun mapValue!9639 () ValueCell!2482)

(declare-fun mapRest!9639 () (Array (_ BitVec 32) ValueCell!2482))

(declare-fun mapKey!9639 () (_ BitVec 32))

(assert (=> mapNonEmpty!9639 (= (arr!4992 (_values!4065 thiss!1504)) (store mapRest!9639 mapKey!9639 mapValue!9639))))

(declare-fun b!217032 () Bool)

(declare-fun res!106210 () Bool)

(assert (=> b!217032 (=> (not res!106210) (not e!141197))))

(declare-datatypes ((tuple2!4270 0))(
  ( (tuple2!4271 (_1!2146 (_ BitVec 64)) (_2!2146 V!7181)) )
))
(declare-datatypes ((List!3173 0))(
  ( (Nil!3170) (Cons!3169 (h!3816 tuple2!4270) (t!8128 List!3173)) )
))
(declare-datatypes ((ListLongMap!3183 0))(
  ( (ListLongMap!3184 (toList!1607 List!3173)) )
))
(declare-fun contains!1448 (ListLongMap!3183 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1135 (array!10543 array!10541 (_ BitVec 32) (_ BitVec 32) V!7181 V!7181 (_ BitVec 32) Int) ListLongMap!3183)

(assert (=> b!217032 (= res!106210 (contains!1448 (getCurrentListMap!1135 (_keys!6131 thiss!1504) (_values!4065 thiss!1504) (mask!9829 thiss!1504) (extraKeys!3819 thiss!1504) (zeroValue!3923 thiss!1504) (minValue!3923 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4082 thiss!1504)) key!932))))

(declare-fun b!217033 () Bool)

(declare-fun res!106215 () Bool)

(assert (=> b!217033 (=> (not res!106215) (not e!141197))))

(assert (=> b!217033 (= res!106215 (and (= (size!5324 (_values!4065 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9829 thiss!1504))) (= (size!5325 (_keys!6131 thiss!1504)) (size!5324 (_values!4065 thiss!1504))) (bvsge (mask!9829 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3819 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3819 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9639 () Bool)

(assert (=> mapIsEmpty!9639 mapRes!9639))

(declare-fun e!141199 () Bool)

(declare-fun e!141198 () Bool)

(declare-fun tp_is_empty!5651 () Bool)

(declare-fun array_inv!3303 (array!10543) Bool)

(declare-fun array_inv!3304 (array!10541) Bool)

(assert (=> b!217034 (= e!141198 (and tp!20501 tp_is_empty!5651 (array_inv!3303 (_keys!6131 thiss!1504)) (array_inv!3304 (_values!4065 thiss!1504)) e!141199))))

(declare-fun res!106209 () Bool)

(assert (=> start!21640 (=> (not res!106209) (not e!141196))))

(declare-fun valid!1164 (LongMapFixedSize!2864) Bool)

(assert (=> start!21640 (= res!106209 (valid!1164 thiss!1504))))

(assert (=> start!21640 e!141196))

(assert (=> start!21640 e!141198))

(assert (=> start!21640 true))

(declare-fun b!217035 () Bool)

(assert (=> b!217035 (= e!141193 tp_is_empty!5651)))

(declare-fun b!217036 () Bool)

(declare-fun res!106213 () Bool)

(assert (=> b!217036 (=> (not res!106213) (not e!141197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10543 (_ BitVec 32)) Bool)

(assert (=> b!217036 (= res!106213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6131 thiss!1504) (mask!9829 thiss!1504)))))

(declare-fun b!217037 () Bool)

(declare-fun e!141195 () Bool)

(assert (=> b!217037 (= e!141195 tp_is_empty!5651)))

(declare-fun b!217038 () Bool)

(assert (=> b!217038 (= e!141197 false)))

(declare-fun lt!111272 () Bool)

(declare-datatypes ((List!3174 0))(
  ( (Nil!3171) (Cons!3170 (h!3817 (_ BitVec 64)) (t!8129 List!3174)) )
))
(declare-fun arrayNoDuplicates!0 (array!10543 (_ BitVec 32) List!3174) Bool)

(assert (=> b!217038 (= lt!111272 (arrayNoDuplicates!0 (_keys!6131 thiss!1504) #b00000000000000000000000000000000 Nil!3171))))

(declare-fun b!217039 () Bool)

(assert (=> b!217039 (= e!141199 (and e!141195 mapRes!9639))))

(declare-fun condMapEmpty!9639 () Bool)

(declare-fun mapDefault!9639 () ValueCell!2482)

