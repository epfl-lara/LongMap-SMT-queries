; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80568 () Bool)

(assert start!80568)

(declare-fun b!945835 () Bool)

(declare-fun b_free!18115 () Bool)

(declare-fun b_next!18115 () Bool)

(assert (=> b!945835 (= b_free!18115 (not b_next!18115))))

(declare-fun tp!62872 () Bool)

(declare-fun b_and!29537 () Bool)

(assert (=> b!945835 (= tp!62872 b_and!29537)))

(declare-fun b!945833 () Bool)

(declare-fun e!532051 () Bool)

(declare-fun tp_is_empty!20623 () Bool)

(assert (=> b!945833 (= e!532051 tp_is_empty!20623)))

(declare-fun e!532054 () Bool)

(declare-fun b!945834 () Bool)

(declare-datatypes ((V!32463 0))(
  ( (V!32464 (val!10362 Int)) )
))
(declare-datatypes ((ValueCell!9830 0))(
  ( (ValueCellFull!9830 (v!12896 V!32463)) (EmptyCell!9830) )
))
(declare-datatypes ((array!57224 0))(
  ( (array!57225 (arr!27532 (Array (_ BitVec 32) ValueCell!9830)) (size!28001 (_ BitVec 32))) )
))
(declare-datatypes ((array!57226 0))(
  ( (array!57227 (arr!27533 (Array (_ BitVec 32) (_ BitVec 64))) (size!28002 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4810 0))(
  ( (LongMapFixedSize!4811 (defaultEntry!5702 Int) (mask!27384 (_ BitVec 32)) (extraKeys!5434 (_ BitVec 32)) (zeroValue!5538 V!32463) (minValue!5538 V!32463) (_size!2460 (_ BitVec 32)) (_keys!10588 array!57226) (_values!5725 array!57224) (_vacant!2460 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4810)

(declare-datatypes ((SeekEntryResult!9093 0))(
  ( (MissingZero!9093 (index!38743 (_ BitVec 32))) (Found!9093 (index!38744 (_ BitVec 32))) (Intermediate!9093 (undefined!9905 Bool) (index!38745 (_ BitVec 32)) (x!81297 (_ BitVec 32))) (Undefined!9093) (MissingVacant!9093 (index!38746 (_ BitVec 32))) )
))
(declare-fun lt!426120 () SeekEntryResult!9093)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945834 (= e!532054 (not (arrayContainsKey!0 (_keys!10588 thiss!1141) key!756 (index!38744 lt!426120))))))

(declare-fun mapNonEmpty!32778 () Bool)

(declare-fun mapRes!32778 () Bool)

(declare-fun tp!62873 () Bool)

(declare-fun e!532055 () Bool)

(assert (=> mapNonEmpty!32778 (= mapRes!32778 (and tp!62873 e!532055))))

(declare-fun mapKey!32778 () (_ BitVec 32))

(declare-fun mapValue!32778 () ValueCell!9830)

(declare-fun mapRest!32778 () (Array (_ BitVec 32) ValueCell!9830))

(assert (=> mapNonEmpty!32778 (= (arr!27532 (_values!5725 thiss!1141)) (store mapRest!32778 mapKey!32778 mapValue!32778))))

(declare-fun e!532056 () Bool)

(declare-fun e!532053 () Bool)

(declare-fun array_inv!21386 (array!57226) Bool)

(declare-fun array_inv!21387 (array!57224) Bool)

(assert (=> b!945835 (= e!532056 (and tp!62872 tp_is_empty!20623 (array_inv!21386 (_keys!10588 thiss!1141)) (array_inv!21387 (_values!5725 thiss!1141)) e!532053))))

(declare-fun b!945836 () Bool)

(assert (=> b!945836 (= e!532053 (and e!532051 mapRes!32778))))

(declare-fun condMapEmpty!32778 () Bool)

(declare-fun mapDefault!32778 () ValueCell!9830)

