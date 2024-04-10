; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35522 () Bool)

(assert start!35522)

(declare-fun b!355970 () Bool)

(declare-fun e!218109 () Bool)

(declare-fun tp_is_empty!7975 () Bool)

(assert (=> b!355970 (= e!218109 tp_is_empty!7975)))

(declare-fun b!355971 () Bool)

(declare-fun e!218111 () Bool)

(assert (=> b!355971 (= e!218111 false)))

(declare-fun lt!165878 () Bool)

(declare-datatypes ((array!19525 0))(
  ( (array!19526 (arr!9256 (Array (_ BitVec 32) (_ BitVec 64))) (size!9608 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19525)

(declare-datatypes ((List!5355 0))(
  ( (Nil!5352) (Cons!5351 (h!6207 (_ BitVec 64)) (t!10505 List!5355)) )
))
(declare-fun arrayNoDuplicates!0 (array!19525 (_ BitVec 32) List!5355) Bool)

(assert (=> b!355971 (= lt!165878 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5352))))

(declare-fun b!355972 () Bool)

(declare-fun e!218108 () Bool)

(declare-fun mapRes!13470 () Bool)

(assert (=> b!355972 (= e!218108 (and e!218109 mapRes!13470))))

(declare-fun condMapEmpty!13470 () Bool)

(declare-datatypes ((V!11611 0))(
  ( (V!11612 (val!4032 Int)) )
))
(declare-datatypes ((ValueCell!3644 0))(
  ( (ValueCellFull!3644 (v!6226 V!11611)) (EmptyCell!3644) )
))
(declare-datatypes ((array!19527 0))(
  ( (array!19528 (arr!9257 (Array (_ BitVec 32) ValueCell!3644)) (size!9609 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19527)

(declare-fun mapDefault!13470 () ValueCell!3644)

