; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35592 () Bool)

(assert start!35592)

(declare-fun b!356955 () Bool)

(declare-fun e!218635 () Bool)

(declare-fun e!218634 () Bool)

(declare-fun mapRes!13575 () Bool)

(assert (=> b!356955 (= e!218635 (and e!218634 mapRes!13575))))

(declare-fun condMapEmpty!13575 () Bool)

(declare-datatypes ((V!11703 0))(
  ( (V!11704 (val!4067 Int)) )
))
(declare-datatypes ((ValueCell!3679 0))(
  ( (ValueCellFull!3679 (v!6261 V!11703)) (EmptyCell!3679) )
))
(declare-datatypes ((array!19659 0))(
  ( (array!19660 (arr!9323 (Array (_ BitVec 32) ValueCell!3679)) (size!9675 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19659)

(declare-fun mapDefault!13575 () ValueCell!3679)

