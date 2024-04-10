; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35550 () Bool)

(assert start!35550)

(declare-fun b!356262 () Bool)

(declare-fun res!197659 () Bool)

(declare-fun e!218318 () Bool)

(assert (=> b!356262 (=> (not res!197659) (not e!218318))))

(declare-datatypes ((array!19577 0))(
  ( (array!19578 (arr!9282 (Array (_ BitVec 32) (_ BitVec 64))) (size!9634 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19577)

(declare-datatypes ((List!5366 0))(
  ( (Nil!5363) (Cons!5362 (h!6218 (_ BitVec 64)) (t!10516 List!5366)) )
))
(declare-fun arrayNoDuplicates!0 (array!19577 (_ BitVec 32) List!5366) Bool)

(assert (=> b!356262 (= res!197659 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5363))))

(declare-fun b!356263 () Bool)

(declare-fun e!218317 () Bool)

(declare-fun e!218320 () Bool)

(declare-fun mapRes!13512 () Bool)

(assert (=> b!356263 (= e!218317 (and e!218320 mapRes!13512))))

(declare-fun condMapEmpty!13512 () Bool)

(declare-datatypes ((V!11647 0))(
  ( (V!11648 (val!4046 Int)) )
))
(declare-datatypes ((ValueCell!3658 0))(
  ( (ValueCellFull!3658 (v!6240 V!11647)) (EmptyCell!3658) )
))
(declare-datatypes ((array!19579 0))(
  ( (array!19580 (arr!9283 (Array (_ BitVec 32) ValueCell!3658)) (size!9635 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19579)

(declare-fun mapDefault!13512 () ValueCell!3658)

