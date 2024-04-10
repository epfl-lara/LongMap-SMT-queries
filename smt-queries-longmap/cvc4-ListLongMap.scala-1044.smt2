; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21950 () Bool)

(assert start!21950)

(declare-fun b!224302 () Bool)

(declare-fun b_free!6017 () Bool)

(declare-fun b_next!6017 () Bool)

(assert (=> b!224302 (= b_free!6017 (not b_next!6017))))

(declare-fun tp!21193 () Bool)

(declare-fun b_and!12915 () Bool)

(assert (=> b!224302 (= tp!21193 b_and!12915)))

(declare-fun res!110338 () Bool)

(declare-fun e!145619 () Bool)

(assert (=> start!21950 (=> (not res!110338) (not e!145619))))

(declare-datatypes ((V!7485 0))(
  ( (V!7486 (val!2984 Int)) )
))
(declare-datatypes ((ValueCell!2596 0))(
  ( (ValueCellFull!2596 (v!5004 V!7485)) (EmptyCell!2596) )
))
(declare-datatypes ((array!11001 0))(
  ( (array!11002 (arr!5220 (Array (_ BitVec 32) ValueCell!2596)) (size!5553 (_ BitVec 32))) )
))
(declare-datatypes ((array!11003 0))(
  ( (array!11004 (arr!5221 (Array (_ BitVec 32) (_ BitVec 64))) (size!5554 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3092 0))(
  ( (LongMapFixedSize!3093 (defaultEntry!4205 Int) (mask!10037 (_ BitVec 32)) (extraKeys!3942 (_ BitVec 32)) (zeroValue!4046 V!7485) (minValue!4046 V!7485) (_size!1595 (_ BitVec 32)) (_keys!6259 array!11003) (_values!4188 array!11001) (_vacant!1595 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3092)

(declare-fun valid!1246 (LongMapFixedSize!3092) Bool)

(assert (=> start!21950 (= res!110338 (valid!1246 thiss!1504))))

(assert (=> start!21950 e!145619))

(declare-fun e!145617 () Bool)

(assert (=> start!21950 e!145617))

(assert (=> start!21950 true))

(declare-fun b!224277 () Bool)

(declare-fun e!145623 () Bool)

(declare-fun e!145630 () Bool)

(declare-fun mapRes!9988 () Bool)

(assert (=> b!224277 (= e!145623 (and e!145630 mapRes!9988))))

(declare-fun condMapEmpty!9988 () Bool)

(declare-fun mapDefault!9988 () ValueCell!2596)

