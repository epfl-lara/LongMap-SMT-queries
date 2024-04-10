; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15700 () Bool)

(assert start!15700)

(declare-fun b!156566 () Bool)

(declare-fun b_free!3367 () Bool)

(declare-fun b_next!3367 () Bool)

(assert (=> b!156566 (= b_free!3367 (not b_next!3367))))

(declare-fun tp!12626 () Bool)

(declare-fun b_and!9781 () Bool)

(assert (=> b!156566 (= tp!12626 b_and!9781)))

(declare-fun mapIsEmpty!5396 () Bool)

(declare-fun mapRes!5396 () Bool)

(assert (=> mapIsEmpty!5396 mapRes!5396))

(declare-fun b!156562 () Bool)

(declare-fun res!73987 () Bool)

(declare-fun e!102394 () Bool)

(assert (=> b!156562 (=> (not res!73987) (not e!102394))))

(declare-datatypes ((V!3873 0))(
  ( (V!3874 (val!1629 Int)) )
))
(declare-datatypes ((ValueCell!1241 0))(
  ( (ValueCellFull!1241 (v!3494 V!3873)) (EmptyCell!1241) )
))
(declare-datatypes ((array!5391 0))(
  ( (array!5392 (arr!2553 (Array (_ BitVec 32) (_ BitVec 64))) (size!2831 (_ BitVec 32))) )
))
(declare-datatypes ((array!5393 0))(
  ( (array!5394 (arr!2554 (Array (_ BitVec 32) ValueCell!1241)) (size!2832 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1390 0))(
  ( (LongMapFixedSize!1391 (defaultEntry!3137 Int) (mask!7592 (_ BitVec 32)) (extraKeys!2878 (_ BitVec 32)) (zeroValue!2980 V!3873) (minValue!2980 V!3873) (_size!744 (_ BitVec 32)) (_keys!4912 array!5391) (_values!3120 array!5393) (_vacant!744 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1390)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5391 (_ BitVec 32)) Bool)

(assert (=> b!156562 (= res!73987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4912 thiss!1248) (mask!7592 thiss!1248)))))

(declare-fun b!156563 () Bool)

(declare-fun res!73984 () Bool)

(assert (=> b!156563 (=> (not res!73984) (not e!102394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156563 (= res!73984 (validMask!0 (mask!7592 thiss!1248)))))

(declare-fun mapNonEmpty!5396 () Bool)

(declare-fun tp!12625 () Bool)

(declare-fun e!102399 () Bool)

(assert (=> mapNonEmpty!5396 (= mapRes!5396 (and tp!12625 e!102399))))

(declare-fun mapKey!5396 () (_ BitVec 32))

(declare-fun mapValue!5396 () ValueCell!1241)

(declare-fun mapRest!5396 () (Array (_ BitVec 32) ValueCell!1241))

(assert (=> mapNonEmpty!5396 (= (arr!2554 (_values!3120 thiss!1248)) (store mapRest!5396 mapKey!5396 mapValue!5396))))

(declare-fun b!156564 () Bool)

(declare-fun e!102395 () Bool)

(declare-fun tp_is_empty!3169 () Bool)

(assert (=> b!156564 (= e!102395 tp_is_empty!3169)))

(declare-fun b!156565 () Bool)

(declare-fun e!102396 () Bool)

(assert (=> b!156565 (= e!102396 (and e!102395 mapRes!5396))))

(declare-fun condMapEmpty!5396 () Bool)

(declare-fun mapDefault!5396 () ValueCell!1241)

