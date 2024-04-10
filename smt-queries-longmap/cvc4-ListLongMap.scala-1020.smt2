; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21724 () Bool)

(assert start!21724)

(declare-fun b!218425 () Bool)

(declare-fun b_free!5873 () Bool)

(declare-fun b_next!5873 () Bool)

(assert (=> b!218425 (= b_free!5873 (not b_next!5873))))

(declare-fun tp!20754 () Bool)

(declare-fun b_and!12763 () Bool)

(assert (=> b!218425 (= tp!20754 b_and!12763)))

(declare-fun b!218416 () Bool)

(declare-fun e!142080 () Bool)

(declare-fun tp_is_empty!5735 () Bool)

(assert (=> b!218416 (= e!142080 tp_is_empty!5735)))

(declare-fun b!218417 () Bool)

(declare-fun e!142078 () Bool)

(assert (=> b!218417 (= e!142078 tp_is_empty!5735)))

(declare-fun b!218418 () Bool)

(declare-fun res!107091 () Bool)

(declare-fun e!142079 () Bool)

(assert (=> b!218418 (=> (not res!107091) (not e!142079))))

(declare-datatypes ((V!7293 0))(
  ( (V!7294 (val!2912 Int)) )
))
(declare-datatypes ((ValueCell!2524 0))(
  ( (ValueCellFull!2524 (v!4930 V!7293)) (EmptyCell!2524) )
))
(declare-datatypes ((array!10709 0))(
  ( (array!10710 (arr!5076 (Array (_ BitVec 32) ValueCell!2524)) (size!5408 (_ BitVec 32))) )
))
(declare-datatypes ((array!10711 0))(
  ( (array!10712 (arr!5077 (Array (_ BitVec 32) (_ BitVec 64))) (size!5409 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2948 0))(
  ( (LongMapFixedSize!2949 (defaultEntry!4124 Int) (mask!9899 (_ BitVec 32)) (extraKeys!3861 (_ BitVec 32)) (zeroValue!3965 V!7293) (minValue!3965 V!7293) (_size!1523 (_ BitVec 32)) (_keys!6173 array!10711) (_values!4107 array!10709) (_vacant!1523 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2948)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10711 (_ BitVec 32)) Bool)

(assert (=> b!218418 (= res!107091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6173 thiss!1504) (mask!9899 thiss!1504)))))

(declare-fun b!218419 () Bool)

(declare-fun e!142075 () Bool)

(declare-fun mapRes!9765 () Bool)

(assert (=> b!218419 (= e!142075 (and e!142080 mapRes!9765))))

(declare-fun condMapEmpty!9765 () Bool)

(declare-fun mapDefault!9765 () ValueCell!2524)

