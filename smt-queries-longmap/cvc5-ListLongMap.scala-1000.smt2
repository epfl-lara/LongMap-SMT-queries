; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21586 () Bool)

(assert start!21586)

(declare-fun b!216318 () Bool)

(declare-fun b_free!5749 () Bool)

(declare-fun b_next!5749 () Bool)

(assert (=> b!216318 (= b_free!5749 (not b_next!5749))))

(declare-fun tp!20379 () Bool)

(declare-fun b_and!12639 () Bool)

(assert (=> b!216318 (= tp!20379 b_and!12639)))

(declare-fun b!216308 () Bool)

(declare-fun e!140737 () Bool)

(declare-datatypes ((V!7129 0))(
  ( (V!7130 (val!2850 Int)) )
))
(declare-datatypes ((ValueCell!2462 0))(
  ( (ValueCellFull!2462 (v!4868 V!7129)) (EmptyCell!2462) )
))
(declare-datatypes ((array!10459 0))(
  ( (array!10460 (arr!4952 (Array (_ BitVec 32) ValueCell!2462)) (size!5284 (_ BitVec 32))) )
))
(declare-datatypes ((array!10461 0))(
  ( (array!10462 (arr!4953 (Array (_ BitVec 32) (_ BitVec 64))) (size!5285 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2824 0))(
  ( (LongMapFixedSize!2825 (defaultEntry!4062 Int) (mask!9794 (_ BitVec 32)) (extraKeys!3799 (_ BitVec 32)) (zeroValue!3903 V!7129) (minValue!3903 V!7129) (_size!1461 (_ BitVec 32)) (_keys!6109 array!10461) (_values!4045 array!10459) (_vacant!1461 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2824)

(assert (=> b!216308 (= e!140737 (bvsgt #b00000000000000000000000000000000 (size!5285 (_keys!6109 thiss!1504))))))

(declare-fun b!216309 () Bool)

(declare-fun res!105769 () Bool)

(assert (=> b!216309 (=> (not res!105769) (not e!140737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10461 (_ BitVec 32)) Bool)

(assert (=> b!216309 (= res!105769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6109 thiss!1504) (mask!9794 thiss!1504)))))

(declare-fun b!216310 () Bool)

(declare-fun e!140738 () Bool)

(assert (=> b!216310 (= e!140738 e!140737)))

(declare-fun res!105770 () Bool)

(assert (=> b!216310 (=> (not res!105770) (not e!140737))))

(declare-datatypes ((SeekEntryResult!742 0))(
  ( (MissingZero!742 (index!5138 (_ BitVec 32))) (Found!742 (index!5139 (_ BitVec 32))) (Intermediate!742 (undefined!1554 Bool) (index!5140 (_ BitVec 32)) (x!22622 (_ BitVec 32))) (Undefined!742) (MissingVacant!742 (index!5141 (_ BitVec 32))) )
))
(declare-fun lt!111141 () SeekEntryResult!742)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216310 (= res!105770 (or (= lt!111141 (MissingZero!742 index!297)) (= lt!111141 (MissingVacant!742 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10461 (_ BitVec 32)) SeekEntryResult!742)

(assert (=> b!216310 (= lt!111141 (seekEntryOrOpen!0 key!932 (_keys!6109 thiss!1504) (mask!9794 thiss!1504)))))

(declare-fun mapNonEmpty!9576 () Bool)

(declare-fun mapRes!9576 () Bool)

(declare-fun tp!20378 () Bool)

(declare-fun e!140734 () Bool)

(assert (=> mapNonEmpty!9576 (= mapRes!9576 (and tp!20378 e!140734))))

(declare-fun mapKey!9576 () (_ BitVec 32))

(declare-fun mapRest!9576 () (Array (_ BitVec 32) ValueCell!2462))

(declare-fun mapValue!9576 () ValueCell!2462)

(assert (=> mapNonEmpty!9576 (= (arr!4952 (_values!4045 thiss!1504)) (store mapRest!9576 mapKey!9576 mapValue!9576))))

(declare-fun b!216311 () Bool)

(declare-fun tp_is_empty!5611 () Bool)

(assert (=> b!216311 (= e!140734 tp_is_empty!5611)))

(declare-fun b!216312 () Bool)

(declare-fun res!105767 () Bool)

(assert (=> b!216312 (=> (not res!105767) (not e!140737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216312 (= res!105767 (validMask!0 (mask!9794 thiss!1504)))))

(declare-fun b!216313 () Bool)

(declare-fun res!105771 () Bool)

(assert (=> b!216313 (=> (not res!105771) (not e!140737))))

(declare-datatypes ((List!3144 0))(
  ( (Nil!3141) (Cons!3140 (h!3787 (_ BitVec 64)) (t!8099 List!3144)) )
))
(declare-fun arrayNoDuplicates!0 (array!10461 (_ BitVec 32) List!3144) Bool)

(assert (=> b!216313 (= res!105771 (arrayNoDuplicates!0 (_keys!6109 thiss!1504) #b00000000000000000000000000000000 Nil!3141))))

(declare-fun res!105768 () Bool)

(assert (=> start!21586 (=> (not res!105768) (not e!140738))))

(declare-fun valid!1147 (LongMapFixedSize!2824) Bool)

(assert (=> start!21586 (= res!105768 (valid!1147 thiss!1504))))

(assert (=> start!21586 e!140738))

(declare-fun e!140740 () Bool)

(assert (=> start!21586 e!140740))

(assert (=> start!21586 true))

(declare-fun b!216314 () Bool)

(declare-fun e!140735 () Bool)

(declare-fun e!140739 () Bool)

(assert (=> b!216314 (= e!140735 (and e!140739 mapRes!9576))))

(declare-fun condMapEmpty!9576 () Bool)

(declare-fun mapDefault!9576 () ValueCell!2462)

