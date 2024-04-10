; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80966 () Bool)

(assert start!80966)

(declare-fun b!948397 () Bool)

(declare-fun b_free!18199 () Bool)

(declare-fun b_next!18199 () Bool)

(assert (=> b!948397 (= b_free!18199 (not b_next!18199))))

(declare-fun tp!63171 () Bool)

(declare-fun b_and!29631 () Bool)

(assert (=> b!948397 (= tp!63171 b_and!29631)))

(declare-fun mapNonEmpty!32951 () Bool)

(declare-fun mapRes!32951 () Bool)

(declare-fun tp!63172 () Bool)

(declare-fun e!533881 () Bool)

(assert (=> mapNonEmpty!32951 (= mapRes!32951 (and tp!63172 e!533881))))

(declare-datatypes ((V!32575 0))(
  ( (V!32576 (val!10404 Int)) )
))
(declare-datatypes ((ValueCell!9872 0))(
  ( (ValueCellFull!9872 (v!12941 V!32575)) (EmptyCell!9872) )
))
(declare-fun mapRest!32951 () (Array (_ BitVec 32) ValueCell!9872))

(declare-datatypes ((array!57420 0))(
  ( (array!57421 (arr!27616 (Array (_ BitVec 32) ValueCell!9872)) (size!28090 (_ BitVec 32))) )
))
(declare-datatypes ((array!57422 0))(
  ( (array!57423 (arr!27617 (Array (_ BitVec 32) (_ BitVec 64))) (size!28091 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4894 0))(
  ( (LongMapFixedSize!4895 (defaultEntry!5749 Int) (mask!27509 (_ BitVec 32)) (extraKeys!5481 (_ BitVec 32)) (zeroValue!5585 V!32575) (minValue!5585 V!32575) (_size!2502 (_ BitVec 32)) (_keys!10668 array!57422) (_values!5772 array!57420) (_vacant!2502 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4894)

(declare-fun mapValue!32951 () ValueCell!9872)

(declare-fun mapKey!32951 () (_ BitVec 32))

(assert (=> mapNonEmpty!32951 (= (arr!27616 (_values!5772 thiss!1141)) (store mapRest!32951 mapKey!32951 mapValue!32951))))

(declare-fun mapIsEmpty!32951 () Bool)

(assert (=> mapIsEmpty!32951 mapRes!32951))

(declare-fun b!948396 () Bool)

(declare-fun res!636282 () Bool)

(declare-fun e!533878 () Bool)

(assert (=> b!948396 (=> (not res!636282) (not e!533878))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!948396 (= res!636282 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!533882 () Bool)

(declare-fun e!533880 () Bool)

(declare-fun tp_is_empty!20707 () Bool)

(declare-fun array_inv!21438 (array!57422) Bool)

(declare-fun array_inv!21439 (array!57420) Bool)

(assert (=> b!948397 (= e!533882 (and tp!63171 tp_is_empty!20707 (array_inv!21438 (_keys!10668 thiss!1141)) (array_inv!21439 (_values!5772 thiss!1141)) e!533880))))

(declare-fun res!636281 () Bool)

(assert (=> start!80966 (=> (not res!636281) (not e!533878))))

(declare-fun valid!1863 (LongMapFixedSize!4894) Bool)

(assert (=> start!80966 (= res!636281 (valid!1863 thiss!1141))))

(assert (=> start!80966 e!533878))

(assert (=> start!80966 e!533882))

(assert (=> start!80966 true))

(declare-fun b!948398 () Bool)

(declare-fun res!636283 () Bool)

(assert (=> b!948398 (=> (not res!636283) (not e!533878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948398 (= res!636283 (validMask!0 (mask!27509 thiss!1141)))))

(declare-fun b!948399 () Bool)

(declare-fun res!636279 () Bool)

(assert (=> b!948399 (=> (not res!636279) (not e!533878))))

(declare-datatypes ((SeekEntryResult!9125 0))(
  ( (MissingZero!9125 (index!38871 (_ BitVec 32))) (Found!9125 (index!38872 (_ BitVec 32))) (Intermediate!9125 (undefined!9937 Bool) (index!38873 (_ BitVec 32)) (x!81603 (_ BitVec 32))) (Undefined!9125) (MissingVacant!9125 (index!38874 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57422 (_ BitVec 32)) SeekEntryResult!9125)

(assert (=> b!948399 (= res!636279 (not (is-Found!9125 (seekEntry!0 key!756 (_keys!10668 thiss!1141) (mask!27509 thiss!1141)))))))

(declare-fun b!948400 () Bool)

(declare-fun e!533883 () Bool)

(assert (=> b!948400 (= e!533883 tp_is_empty!20707)))

(declare-fun b!948401 () Bool)

(assert (=> b!948401 (= e!533878 (and (= (size!28090 (_values!5772 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27509 thiss!1141))) (not (= (size!28091 (_keys!10668 thiss!1141)) (size!28090 (_values!5772 thiss!1141))))))))

(declare-fun b!948402 () Bool)

(assert (=> b!948402 (= e!533880 (and e!533883 mapRes!32951))))

(declare-fun condMapEmpty!32951 () Bool)

(declare-fun mapDefault!32951 () ValueCell!9872)

