; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15454 () Bool)

(assert start!15454)

(declare-fun b!153563 () Bool)

(declare-fun b_free!3193 () Bool)

(declare-fun b_next!3193 () Bool)

(assert (=> b!153563 (= b_free!3193 (not b_next!3193))))

(declare-fun tp!12096 () Bool)

(declare-fun b_and!9555 () Bool)

(assert (=> b!153563 (= tp!12096 b_and!9555)))

(declare-fun b!153570 () Bool)

(declare-fun b_free!3195 () Bool)

(declare-fun b_next!3195 () Bool)

(assert (=> b!153570 (= b_free!3195 (not b_next!3195))))

(declare-fun tp!12097 () Bool)

(declare-fun b_and!9557 () Bool)

(assert (=> b!153570 (= tp!12097 b_and!9557)))

(declare-fun mapIsEmpty!5125 () Bool)

(declare-fun mapRes!5125 () Bool)

(assert (=> mapIsEmpty!5125 mapRes!5125))

(declare-fun mapIsEmpty!5126 () Bool)

(declare-fun mapRes!5126 () Bool)

(assert (=> mapIsEmpty!5126 mapRes!5126))

(declare-datatypes ((V!3665 0))(
  ( (V!3666 (val!1551 Int)) )
))
(declare-datatypes ((array!5075 0))(
  ( (array!5076 (arr!2397 (Array (_ BitVec 32) (_ BitVec 64))) (size!2674 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1163 0))(
  ( (ValueCellFull!1163 (v!3404 V!3665)) (EmptyCell!1163) )
))
(declare-datatypes ((array!5077 0))(
  ( (array!5078 (arr!2398 (Array (_ BitVec 32) ValueCell!1163)) (size!2675 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1234 0))(
  ( (LongMapFixedSize!1235 (defaultEntry!3056 Int) (mask!7456 (_ BitVec 32)) (extraKeys!2797 (_ BitVec 32)) (zeroValue!2899 V!3665) (minValue!2899 V!3665) (_size!666 (_ BitVec 32)) (_keys!4829 array!5075) (_values!3039 array!5077) (_vacant!666 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1016 0))(
  ( (Cell!1017 (v!3405 LongMapFixedSize!1234)) )
))
(declare-datatypes ((LongMap!1016 0))(
  ( (LongMap!1017 (underlying!519 Cell!1016)) )
))
(declare-fun thiss!992 () LongMap!1016)

(declare-fun e!100280 () Bool)

(declare-fun tp_is_empty!3013 () Bool)

(declare-fun e!100273 () Bool)

(declare-fun array_inv!1511 (array!5075) Bool)

(declare-fun array_inv!1512 (array!5077) Bool)

(assert (=> b!153563 (= e!100280 (and tp!12096 tp_is_empty!3013 (array_inv!1511 (_keys!4829 (v!3405 (underlying!519 thiss!992)))) (array_inv!1512 (_values!3039 (v!3405 (underlying!519 thiss!992)))) e!100273))))

(declare-fun b!153564 () Bool)

(declare-fun e!100276 () Bool)

(declare-fun e!100282 () Bool)

(assert (=> b!153564 (= e!100276 e!100282)))

(declare-fun res!72575 () Bool)

(declare-fun e!100274 () Bool)

(assert (=> start!15454 (=> (not res!72575) (not e!100274))))

(declare-fun valid!606 (LongMap!1016) Bool)

(assert (=> start!15454 (= res!72575 (valid!606 thiss!992))))

(assert (=> start!15454 e!100274))

(assert (=> start!15454 e!100276))

(assert (=> start!15454 true))

(declare-fun e!100281 () Bool)

(assert (=> start!15454 e!100281))

(declare-fun b!153565 () Bool)

(declare-fun e!100271 () Bool)

(assert (=> b!153565 (= e!100271 tp_is_empty!3013)))

(declare-fun b!153566 () Bool)

(declare-fun res!72573 () Bool)

(assert (=> b!153566 (=> (not res!72573) (not e!100274))))

(declare-fun newMap!16 () LongMapFixedSize!1234)

(assert (=> b!153566 (= res!72573 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7456 newMap!16)) (_size!666 (v!3405 (underlying!519 thiss!992)))))))

(declare-fun b!153567 () Bool)

(assert (=> b!153567 (= e!100282 e!100280)))

(declare-fun b!153568 () Bool)

(assert (=> b!153568 (= e!100273 (and e!100271 mapRes!5126))))

(declare-fun condMapEmpty!5126 () Bool)

(declare-fun mapDefault!5125 () ValueCell!1163)

