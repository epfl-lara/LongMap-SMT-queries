; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15716 () Bool)

(assert start!15716)

(declare-fun b!156785 () Bool)

(declare-fun b_free!3383 () Bool)

(declare-fun b_next!3383 () Bool)

(assert (=> b!156785 (= b_free!3383 (not b_next!3383))))

(declare-fun tp!12673 () Bool)

(declare-fun b_and!9797 () Bool)

(assert (=> b!156785 (= tp!12673 b_and!9797)))

(declare-fun mapNonEmpty!5420 () Bool)

(declare-fun mapRes!5420 () Bool)

(declare-fun tp!12674 () Bool)

(declare-fun e!102539 () Bool)

(assert (=> mapNonEmpty!5420 (= mapRes!5420 (and tp!12674 e!102539))))

(declare-datatypes ((V!3893 0))(
  ( (V!3894 (val!1637 Int)) )
))
(declare-datatypes ((ValueCell!1249 0))(
  ( (ValueCellFull!1249 (v!3502 V!3893)) (EmptyCell!1249) )
))
(declare-fun mapValue!5420 () ValueCell!1249)

(declare-fun mapKey!5420 () (_ BitVec 32))

(declare-fun mapRest!5420 () (Array (_ BitVec 32) ValueCell!1249))

(declare-datatypes ((array!5423 0))(
  ( (array!5424 (arr!2569 (Array (_ BitVec 32) (_ BitVec 64))) (size!2847 (_ BitVec 32))) )
))
(declare-datatypes ((array!5425 0))(
  ( (array!5426 (arr!2570 (Array (_ BitVec 32) ValueCell!1249)) (size!2848 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1406 0))(
  ( (LongMapFixedSize!1407 (defaultEntry!3145 Int) (mask!7604 (_ BitVec 32)) (extraKeys!2886 (_ BitVec 32)) (zeroValue!2988 V!3893) (minValue!2988 V!3893) (_size!752 (_ BitVec 32)) (_keys!4920 array!5423) (_values!3128 array!5425) (_vacant!752 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1406)

(assert (=> mapNonEmpty!5420 (= (arr!2570 (_values!3128 thiss!1248)) (store mapRest!5420 mapKey!5420 mapValue!5420))))

(declare-fun b!156777 () Bool)

(declare-fun e!102538 () Bool)

(declare-fun e!102540 () Bool)

(assert (=> b!156777 (= e!102538 (and e!102540 mapRes!5420))))

(declare-fun condMapEmpty!5420 () Bool)

(declare-fun mapDefault!5420 () ValueCell!1249)

