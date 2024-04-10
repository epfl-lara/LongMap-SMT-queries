; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15856 () Bool)

(assert start!15856)

(declare-fun b!157859 () Bool)

(declare-fun b_free!3463 () Bool)

(declare-fun b_next!3463 () Bool)

(assert (=> b!157859 (= b_free!3463 (not b_next!3463))))

(declare-fun tp!12930 () Bool)

(declare-fun b_and!9877 () Bool)

(assert (=> b!157859 (= tp!12930 b_and!9877)))

(declare-fun b!157857 () Bool)

(declare-fun res!74596 () Bool)

(declare-fun e!103395 () Bool)

(assert (=> b!157857 (=> (not res!74596) (not e!103395))))

(declare-datatypes ((V!4001 0))(
  ( (V!4002 (val!1677 Int)) )
))
(declare-datatypes ((ValueCell!1289 0))(
  ( (ValueCellFull!1289 (v!3542 V!4001)) (EmptyCell!1289) )
))
(declare-datatypes ((array!5593 0))(
  ( (array!5594 (arr!2649 (Array (_ BitVec 32) (_ BitVec 64))) (size!2929 (_ BitVec 32))) )
))
(declare-datatypes ((array!5595 0))(
  ( (array!5596 (arr!2650 (Array (_ BitVec 32) ValueCell!1289)) (size!2930 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1486 0))(
  ( (LongMapFixedSize!1487 (defaultEntry!3185 Int) (mask!7680 (_ BitVec 32)) (extraKeys!2926 (_ BitVec 32)) (zeroValue!3028 V!4001) (minValue!3028 V!4001) (_size!792 (_ BitVec 32)) (_keys!4963 array!5593) (_values!3168 array!5595) (_vacant!792 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1486)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157857 (= res!74596 (validMask!0 (mask!7680 thiss!1248)))))

(declare-fun b!157858 () Bool)

(declare-fun e!103396 () Bool)

(declare-fun tp_is_empty!3265 () Bool)

(assert (=> b!157858 (= e!103396 tp_is_empty!3265)))

(declare-fun e!103399 () Bool)

(declare-fun e!103397 () Bool)

(declare-fun array_inv!1687 (array!5593) Bool)

(declare-fun array_inv!1688 (array!5595) Bool)

(assert (=> b!157859 (= e!103397 (and tp!12930 tp_is_empty!3265 (array_inv!1687 (_keys!4963 thiss!1248)) (array_inv!1688 (_values!3168 thiss!1248)) e!103399))))

(declare-fun mapIsEmpty!5557 () Bool)

(declare-fun mapRes!5557 () Bool)

(assert (=> mapIsEmpty!5557 mapRes!5557))

(declare-fun b!157860 () Bool)

(declare-fun e!103394 () Bool)

(assert (=> b!157860 (= e!103399 (and e!103394 mapRes!5557))))

(declare-fun condMapEmpty!5557 () Bool)

(declare-fun mapDefault!5557 () ValueCell!1289)

