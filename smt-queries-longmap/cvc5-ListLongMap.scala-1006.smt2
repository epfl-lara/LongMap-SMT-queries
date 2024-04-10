; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21636 () Bool)

(assert start!21636)

(declare-fun b!216968 () Bool)

(declare-fun b_free!5785 () Bool)

(declare-fun b_next!5785 () Bool)

(assert (=> b!216968 (= b_free!5785 (not b_next!5785))))

(declare-fun tp!20489 () Bool)

(declare-fun b_and!12675 () Bool)

(assert (=> b!216968 (= tp!20489 b_and!12675)))

(declare-fun res!106169 () Bool)

(declare-fun e!141155 () Bool)

(assert (=> start!21636 (=> (not res!106169) (not e!141155))))

(declare-datatypes ((V!7177 0))(
  ( (V!7178 (val!2868 Int)) )
))
(declare-datatypes ((ValueCell!2480 0))(
  ( (ValueCellFull!2480 (v!4886 V!7177)) (EmptyCell!2480) )
))
(declare-datatypes ((array!10533 0))(
  ( (array!10534 (arr!4988 (Array (_ BitVec 32) ValueCell!2480)) (size!5320 (_ BitVec 32))) )
))
(declare-datatypes ((array!10535 0))(
  ( (array!10536 (arr!4989 (Array (_ BitVec 32) (_ BitVec 64))) (size!5321 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2860 0))(
  ( (LongMapFixedSize!2861 (defaultEntry!4080 Int) (mask!9827 (_ BitVec 32)) (extraKeys!3817 (_ BitVec 32)) (zeroValue!3921 V!7177) (minValue!3921 V!7177) (_size!1479 (_ BitVec 32)) (_keys!6129 array!10535) (_values!4063 array!10533) (_vacant!1479 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2860)

(declare-fun valid!1162 (LongMapFixedSize!2860) Bool)

(assert (=> start!21636 (= res!106169 (valid!1162 thiss!1504))))

(assert (=> start!21636 e!141155))

(declare-fun e!141151 () Bool)

(assert (=> start!21636 e!141151))

(assert (=> start!21636 true))

(declare-fun b!216964 () Bool)

(declare-fun e!141154 () Bool)

(declare-fun tp_is_empty!5647 () Bool)

(assert (=> b!216964 (= e!141154 tp_is_empty!5647)))

(declare-fun b!216965 () Bool)

(declare-fun res!106168 () Bool)

(assert (=> b!216965 (=> (not res!106168) (not e!141155))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!216965 (= res!106168 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9633 () Bool)

(declare-fun mapRes!9633 () Bool)

(declare-fun tp!20490 () Bool)

(declare-fun e!141152 () Bool)

(assert (=> mapNonEmpty!9633 (= mapRes!9633 (and tp!20490 e!141152))))

(declare-fun mapRest!9633 () (Array (_ BitVec 32) ValueCell!2480))

(declare-fun mapKey!9633 () (_ BitVec 32))

(declare-fun mapValue!9633 () ValueCell!2480)

(assert (=> mapNonEmpty!9633 (= (arr!4988 (_values!4063 thiss!1504)) (store mapRest!9633 mapKey!9633 mapValue!9633))))

(declare-fun mapIsEmpty!9633 () Bool)

(assert (=> mapIsEmpty!9633 mapRes!9633))

(declare-fun b!216966 () Bool)

(assert (=> b!216966 (= e!141152 tp_is_empty!5647)))

(declare-fun b!216967 () Bool)

(declare-fun e!141156 () Bool)

(assert (=> b!216967 (= e!141155 e!141156)))

(declare-fun res!106167 () Bool)

(assert (=> b!216967 (=> (not res!106167) (not e!141156))))

(declare-datatypes ((SeekEntryResult!756 0))(
  ( (MissingZero!756 (index!5194 (_ BitVec 32))) (Found!756 (index!5195 (_ BitVec 32))) (Intermediate!756 (undefined!1568 Bool) (index!5196 (_ BitVec 32)) (x!22692 (_ BitVec 32))) (Undefined!756) (MissingVacant!756 (index!5197 (_ BitVec 32))) )
))
(declare-fun lt!111261 () SeekEntryResult!756)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216967 (= res!106167 (or (= lt!111261 (MissingZero!756 index!297)) (= lt!111261 (MissingVacant!756 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10535 (_ BitVec 32)) SeekEntryResult!756)

(assert (=> b!216967 (= lt!111261 (seekEntryOrOpen!0 key!932 (_keys!6129 thiss!1504) (mask!9827 thiss!1504)))))

(declare-fun e!141153 () Bool)

(declare-fun array_inv!3299 (array!10535) Bool)

(declare-fun array_inv!3300 (array!10533) Bool)

(assert (=> b!216968 (= e!141151 (and tp!20489 tp_is_empty!5647 (array_inv!3299 (_keys!6129 thiss!1504)) (array_inv!3300 (_values!4063 thiss!1504)) e!141153))))

(declare-fun b!216969 () Bool)

(declare-fun res!106170 () Bool)

(assert (=> b!216969 (=> (not res!106170) (not e!141156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10535 (_ BitVec 32)) Bool)

(assert (=> b!216969 (= res!106170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6129 thiss!1504) (mask!9827 thiss!1504)))))

(declare-fun b!216970 () Bool)

(declare-fun res!106172 () Bool)

(assert (=> b!216970 (=> (not res!106172) (not e!141156))))

(assert (=> b!216970 (= res!106172 (and (= (size!5320 (_values!4063 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9827 thiss!1504))) (= (size!5321 (_keys!6129 thiss!1504)) (size!5320 (_values!4063 thiss!1504))) (bvsge (mask!9827 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3817 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3817 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216971 () Bool)

(declare-fun res!106173 () Bool)

(assert (=> b!216971 (=> (not res!106173) (not e!141156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216971 (= res!106173 (validMask!0 (mask!9827 thiss!1504)))))

(declare-fun b!216972 () Bool)

(assert (=> b!216972 (= e!141153 (and e!141154 mapRes!9633))))

(declare-fun condMapEmpty!9633 () Bool)

(declare-fun mapDefault!9633 () ValueCell!2480)

