; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16642 () Bool)

(assert start!16642)

(declare-fun b!166287 () Bool)

(declare-fun b_free!3947 () Bool)

(declare-fun b_next!3947 () Bool)

(assert (=> b!166287 (= b_free!3947 (not b_next!3947))))

(declare-fun tp!14442 () Bool)

(declare-fun b_and!10361 () Bool)

(assert (=> b!166287 (= tp!14442 b_and!10361)))

(declare-fun b!166278 () Bool)

(declare-fun res!79017 () Bool)

(declare-fun e!109072 () Bool)

(assert (=> b!166278 (=> (not res!79017) (not e!109072))))

(declare-datatypes ((V!4645 0))(
  ( (V!4646 (val!1919 Int)) )
))
(declare-datatypes ((ValueCell!1531 0))(
  ( (ValueCellFull!1531 (v!3784 V!4645)) (EmptyCell!1531) )
))
(declare-datatypes ((array!6595 0))(
  ( (array!6596 (arr!3133 (Array (_ BitVec 32) (_ BitVec 64))) (size!3421 (_ BitVec 32))) )
))
(declare-datatypes ((array!6597 0))(
  ( (array!6598 (arr!3134 (Array (_ BitVec 32) ValueCell!1531)) (size!3422 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1970 0))(
  ( (LongMapFixedSize!1971 (defaultEntry!3427 Int) (mask!8154 (_ BitVec 32)) (extraKeys!3168 (_ BitVec 32)) (zeroValue!3270 V!4645) (minValue!3270 V!4645) (_size!1034 (_ BitVec 32)) (_keys!5252 array!6595) (_values!3410 array!6597) (_vacant!1034 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1970)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6595 (_ BitVec 32)) Bool)

(assert (=> b!166278 (= res!79017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5252 thiss!1248) (mask!8154 thiss!1248)))))

(declare-fun b!166279 () Bool)

(declare-fun e!109075 () Bool)

(declare-fun e!109073 () Bool)

(declare-fun mapRes!6342 () Bool)

(assert (=> b!166279 (= e!109075 (and e!109073 mapRes!6342))))

(declare-fun condMapEmpty!6342 () Bool)

(declare-fun mapDefault!6342 () ValueCell!1531)

