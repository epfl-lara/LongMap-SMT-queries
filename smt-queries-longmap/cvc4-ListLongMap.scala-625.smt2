; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16102 () Bool)

(assert start!16102)

(declare-fun b!160093 () Bool)

(declare-fun b_free!3563 () Bool)

(declare-fun b_next!3563 () Bool)

(assert (=> b!160093 (= b_free!3563 (not b_next!3563))))

(declare-fun tp!13259 () Bool)

(declare-fun b_and!9977 () Bool)

(assert (=> b!160093 (= tp!13259 b_and!9977)))

(declare-fun b!160089 () Bool)

(declare-fun e!104714 () Bool)

(assert (=> b!160089 (= e!104714 false)))

(declare-fun lt!82057 () Bool)

(declare-datatypes ((V!4133 0))(
  ( (V!4134 (val!1727 Int)) )
))
(declare-datatypes ((ValueCell!1339 0))(
  ( (ValueCellFull!1339 (v!3592 V!4133)) (EmptyCell!1339) )
))
(declare-datatypes ((array!5809 0))(
  ( (array!5810 (arr!2749 (Array (_ BitVec 32) (_ BitVec 64))) (size!3033 (_ BitVec 32))) )
))
(declare-datatypes ((array!5811 0))(
  ( (array!5812 (arr!2750 (Array (_ BitVec 32) ValueCell!1339)) (size!3034 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1586 0))(
  ( (LongMapFixedSize!1587 (defaultEntry!3235 Int) (mask!7797 (_ BitVec 32)) (extraKeys!2976 (_ BitVec 32)) (zeroValue!3078 V!4133) (minValue!3078 V!4133) (_size!842 (_ BitVec 32)) (_keys!5036 array!5809) (_values!3218 array!5811) (_vacant!842 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1586)

(declare-datatypes ((List!1930 0))(
  ( (Nil!1927) (Cons!1926 (h!2539 (_ BitVec 64)) (t!6732 List!1930)) )
))
(declare-fun arrayNoDuplicates!0 (array!5809 (_ BitVec 32) List!1930) Bool)

(assert (=> b!160089 (= lt!82057 (arrayNoDuplicates!0 (_keys!5036 thiss!1248) #b00000000000000000000000000000000 Nil!1927))))

(declare-fun b!160090 () Bool)

(declare-fun e!104713 () Bool)

(declare-fun e!104715 () Bool)

(declare-fun mapRes!5735 () Bool)

(assert (=> b!160090 (= e!104713 (and e!104715 mapRes!5735))))

(declare-fun condMapEmpty!5735 () Bool)

(declare-fun mapDefault!5735 () ValueCell!1339)

