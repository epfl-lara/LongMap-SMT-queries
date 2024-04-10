; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35394 () Bool)

(assert start!35394)

(declare-fun b!354332 () Bool)

(declare-fun e!217150 () Bool)

(declare-fun e!217148 () Bool)

(declare-fun mapRes!13278 () Bool)

(assert (=> b!354332 (= e!217150 (and e!217148 mapRes!13278))))

(declare-fun condMapEmpty!13278 () Bool)

(declare-datatypes ((V!11439 0))(
  ( (V!11440 (val!3968 Int)) )
))
(declare-datatypes ((ValueCell!3580 0))(
  ( (ValueCellFull!3580 (v!6162 V!11439)) (EmptyCell!3580) )
))
(declare-datatypes ((array!19281 0))(
  ( (array!19282 (arr!9134 (Array (_ BitVec 32) ValueCell!3580)) (size!9486 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19281)

(declare-fun mapDefault!13278 () ValueCell!3580)

