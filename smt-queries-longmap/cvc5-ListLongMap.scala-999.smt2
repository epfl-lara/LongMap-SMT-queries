; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21566 () Bool)

(assert start!21566)

(declare-fun b!216156 () Bool)

(declare-fun b_free!5743 () Bool)

(declare-fun b_next!5743 () Bool)

(assert (=> b!216156 (= b_free!5743 (not b_next!5743))))

(declare-fun tp!20358 () Bool)

(declare-fun b_and!12633 () Bool)

(assert (=> b!216156 (= tp!20358 b_and!12633)))

(declare-fun b!216154 () Bool)

(declare-fun res!105688 () Bool)

(declare-fun e!140633 () Bool)

(assert (=> b!216154 (=> (not res!105688) (not e!140633))))

(declare-datatypes ((V!7121 0))(
  ( (V!7122 (val!2847 Int)) )
))
(declare-datatypes ((ValueCell!2459 0))(
  ( (ValueCellFull!2459 (v!4865 V!7121)) (EmptyCell!2459) )
))
(declare-datatypes ((array!10445 0))(
  ( (array!10446 (arr!4946 (Array (_ BitVec 32) ValueCell!2459)) (size!5278 (_ BitVec 32))) )
))
(declare-datatypes ((array!10447 0))(
  ( (array!10448 (arr!4947 (Array (_ BitVec 32) (_ BitVec 64))) (size!5279 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2818 0))(
  ( (LongMapFixedSize!2819 (defaultEntry!4059 Int) (mask!9786 (_ BitVec 32)) (extraKeys!3796 (_ BitVec 32)) (zeroValue!3900 V!7121) (minValue!3900 V!7121) (_size!1458 (_ BitVec 32)) (_keys!6104 array!10447) (_values!4042 array!10445) (_vacant!1458 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2818)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216154 (= res!105688 (validMask!0 (mask!9786 thiss!1504)))))

(declare-fun b!216155 () Bool)

(declare-datatypes ((List!3141 0))(
  ( (Nil!3138) (Cons!3137 (h!3784 (_ BitVec 64)) (t!8096 List!3141)) )
))
(declare-fun arrayNoDuplicates!0 (array!10447 (_ BitVec 32) List!3141) Bool)

(assert (=> b!216155 (= e!140633 (not (arrayNoDuplicates!0 (_keys!6104 thiss!1504) #b00000000000000000000000000000000 Nil!3138)))))

(declare-fun e!140635 () Bool)

(declare-fun e!140638 () Bool)

(declare-fun tp_is_empty!5605 () Bool)

(declare-fun array_inv!3271 (array!10447) Bool)

(declare-fun array_inv!3272 (array!10445) Bool)

(assert (=> b!216156 (= e!140638 (and tp!20358 tp_is_empty!5605 (array_inv!3271 (_keys!6104 thiss!1504)) (array_inv!3272 (_values!4042 thiss!1504)) e!140635))))

(declare-fun mapNonEmpty!9564 () Bool)

(declare-fun mapRes!9564 () Bool)

(declare-fun tp!20357 () Bool)

(declare-fun e!140632 () Bool)

(assert (=> mapNonEmpty!9564 (= mapRes!9564 (and tp!20357 e!140632))))

(declare-fun mapRest!9564 () (Array (_ BitVec 32) ValueCell!2459))

(declare-fun mapKey!9564 () (_ BitVec 32))

(declare-fun mapValue!9564 () ValueCell!2459)

(assert (=> mapNonEmpty!9564 (= (arr!4946 (_values!4042 thiss!1504)) (store mapRest!9564 mapKey!9564 mapValue!9564))))

(declare-fun res!105690 () Bool)

(declare-fun e!140636 () Bool)

(assert (=> start!21566 (=> (not res!105690) (not e!140636))))

(declare-fun valid!1145 (LongMapFixedSize!2818) Bool)

(assert (=> start!21566 (= res!105690 (valid!1145 thiss!1504))))

(assert (=> start!21566 e!140636))

(assert (=> start!21566 e!140638))

(assert (=> start!21566 true))

(declare-fun b!216157 () Bool)

(declare-fun res!105686 () Bool)

(assert (=> b!216157 (=> (not res!105686) (not e!140633))))

(assert (=> b!216157 (= res!105686 (and (= (size!5278 (_values!4042 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9786 thiss!1504))) (= (size!5279 (_keys!6104 thiss!1504)) (size!5278 (_values!4042 thiss!1504))) (bvsge (mask!9786 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3796 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3796 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216158 () Bool)

(declare-fun e!140637 () Bool)

(assert (=> b!216158 (= e!140637 tp_is_empty!5605)))

(declare-fun b!216159 () Bool)

(assert (=> b!216159 (= e!140636 e!140633)))

(declare-fun res!105687 () Bool)

(assert (=> b!216159 (=> (not res!105687) (not e!140633))))

(declare-datatypes ((SeekEntryResult!740 0))(
  ( (MissingZero!740 (index!5130 (_ BitVec 32))) (Found!740 (index!5131 (_ BitVec 32))) (Intermediate!740 (undefined!1552 Bool) (index!5132 (_ BitVec 32)) (x!22604 (_ BitVec 32))) (Undefined!740) (MissingVacant!740 (index!5133 (_ BitVec 32))) )
))
(declare-fun lt!111114 () SeekEntryResult!740)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216159 (= res!105687 (or (= lt!111114 (MissingZero!740 index!297)) (= lt!111114 (MissingVacant!740 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10447 (_ BitVec 32)) SeekEntryResult!740)

(assert (=> b!216159 (= lt!111114 (seekEntryOrOpen!0 key!932 (_keys!6104 thiss!1504) (mask!9786 thiss!1504)))))

(declare-fun b!216160 () Bool)

(assert (=> b!216160 (= e!140632 tp_is_empty!5605)))

(declare-fun b!216161 () Bool)

(assert (=> b!216161 (= e!140635 (and e!140637 mapRes!9564))))

(declare-fun condMapEmpty!9564 () Bool)

(declare-fun mapDefault!9564 () ValueCell!2459)

