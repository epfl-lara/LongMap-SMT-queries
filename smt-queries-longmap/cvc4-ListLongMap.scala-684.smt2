; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16612 () Bool)

(assert start!16612)

(declare-fun b!165776 () Bool)

(declare-fun b_free!3917 () Bool)

(declare-fun b_next!3917 () Bool)

(assert (=> b!165776 (= b_free!3917 (not b_next!3917))))

(declare-fun tp!14352 () Bool)

(declare-fun b_and!10331 () Bool)

(assert (=> b!165776 (= tp!14352 b_and!10331)))

(declare-fun b!165767 () Bool)

(declare-fun e!108731 () Bool)

(declare-fun tp_is_empty!3719 () Bool)

(assert (=> b!165767 (= e!108731 tp_is_empty!3719)))

(declare-fun b!165768 () Bool)

(declare-fun e!108737 () Bool)

(assert (=> b!165768 (= e!108737 false)))

(declare-fun lt!83130 () Bool)

(declare-datatypes ((V!4605 0))(
  ( (V!4606 (val!1904 Int)) )
))
(declare-datatypes ((ValueCell!1516 0))(
  ( (ValueCellFull!1516 (v!3769 V!4605)) (EmptyCell!1516) )
))
(declare-datatypes ((array!6535 0))(
  ( (array!6536 (arr!3103 (Array (_ BitVec 32) (_ BitVec 64))) (size!3391 (_ BitVec 32))) )
))
(declare-datatypes ((array!6537 0))(
  ( (array!6538 (arr!3104 (Array (_ BitVec 32) ValueCell!1516)) (size!3392 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1940 0))(
  ( (LongMapFixedSize!1941 (defaultEntry!3412 Int) (mask!8129 (_ BitVec 32)) (extraKeys!3153 (_ BitVec 32)) (zeroValue!3255 V!4605) (minValue!3255 V!4605) (_size!1019 (_ BitVec 32)) (_keys!5237 array!6535) (_values!3395 array!6537) (_vacant!1019 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1940)

(declare-datatypes ((List!2068 0))(
  ( (Nil!2065) (Cons!2064 (h!2681 (_ BitVec 64)) (t!6870 List!2068)) )
))
(declare-fun arrayNoDuplicates!0 (array!6535 (_ BitVec 32) List!2068) Bool)

(assert (=> b!165768 (= lt!83130 (arrayNoDuplicates!0 (_keys!5237 thiss!1248) #b00000000000000000000000000000000 Nil!2065))))

(declare-fun b!165769 () Bool)

(declare-fun e!108734 () Bool)

(declare-fun e!108732 () Bool)

(declare-fun mapRes!6297 () Bool)

(assert (=> b!165769 (= e!108734 (and e!108732 mapRes!6297))))

(declare-fun condMapEmpty!6297 () Bool)

(declare-fun mapDefault!6297 () ValueCell!1516)

