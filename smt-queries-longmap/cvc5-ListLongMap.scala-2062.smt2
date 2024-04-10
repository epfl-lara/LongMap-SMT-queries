; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35540 () Bool)

(assert start!35540)

(declare-fun b!356132 () Bool)

(declare-fun e!218246 () Bool)

(declare-fun tp_is_empty!7993 () Bool)

(assert (=> b!356132 (= e!218246 tp_is_empty!7993)))

(declare-fun b!356133 () Bool)

(declare-fun e!218242 () Bool)

(declare-fun e!218244 () Bool)

(declare-fun mapRes!13497 () Bool)

(assert (=> b!356133 (= e!218242 (and e!218244 mapRes!13497))))

(declare-fun condMapEmpty!13497 () Bool)

(declare-datatypes ((V!11635 0))(
  ( (V!11636 (val!4041 Int)) )
))
(declare-datatypes ((ValueCell!3653 0))(
  ( (ValueCellFull!3653 (v!6235 V!11635)) (EmptyCell!3653) )
))
(declare-datatypes ((array!19559 0))(
  ( (array!19560 (arr!9273 (Array (_ BitVec 32) ValueCell!3653)) (size!9625 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19559)

(declare-fun mapDefault!13497 () ValueCell!3653)

