; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15722 () Bool)

(assert start!15722)

(declare-fun b!156864 () Bool)

(declare-fun b_free!3389 () Bool)

(declare-fun b_next!3389 () Bool)

(assert (=> b!156864 (= b_free!3389 (not b_next!3389))))

(declare-fun tp!12692 () Bool)

(declare-fun b_and!9803 () Bool)

(assert (=> b!156864 (= tp!12692 b_and!9803)))

(declare-fun b!156858 () Bool)

(declare-fun res!74152 () Bool)

(declare-fun e!102596 () Bool)

(assert (=> b!156858 (=> (not res!74152) (not e!102596))))

(declare-datatypes ((V!3901 0))(
  ( (V!3902 (val!1640 Int)) )
))
(declare-datatypes ((ValueCell!1252 0))(
  ( (ValueCellFull!1252 (v!3505 V!3901)) (EmptyCell!1252) )
))
(declare-datatypes ((array!5435 0))(
  ( (array!5436 (arr!2575 (Array (_ BitVec 32) (_ BitVec 64))) (size!2853 (_ BitVec 32))) )
))
(declare-datatypes ((array!5437 0))(
  ( (array!5438 (arr!2576 (Array (_ BitVec 32) ValueCell!1252)) (size!2854 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1412 0))(
  ( (LongMapFixedSize!1413 (defaultEntry!3148 Int) (mask!7609 (_ BitVec 32)) (extraKeys!2889 (_ BitVec 32)) (zeroValue!2991 V!3901) (minValue!2991 V!3901) (_size!755 (_ BitVec 32)) (_keys!4923 array!5435) (_values!3131 array!5437) (_vacant!755 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1412)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156858 (= res!74152 (validMask!0 (mask!7609 thiss!1248)))))

(declare-fun b!156859 () Bool)

(declare-fun e!102595 () Bool)

(declare-fun tp_is_empty!3191 () Bool)

(assert (=> b!156859 (= e!102595 tp_is_empty!3191)))

(declare-fun b!156860 () Bool)

(declare-fun e!102597 () Bool)

(declare-fun e!102592 () Bool)

(declare-fun mapRes!5429 () Bool)

(assert (=> b!156860 (= e!102597 (and e!102592 mapRes!5429))))

(declare-fun condMapEmpty!5429 () Bool)

(declare-fun mapDefault!5429 () ValueCell!1252)

