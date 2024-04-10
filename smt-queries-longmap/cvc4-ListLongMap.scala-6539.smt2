; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83122 () Bool)

(assert start!83122)

(declare-fun b_free!19115 () Bool)

(declare-fun b_next!19115 () Bool)

(assert (=> start!83122 (= b_free!19115 (not b_next!19115))))

(declare-fun tp!66623 () Bool)

(declare-fun b_and!30603 () Bool)

(assert (=> start!83122 (= tp!66623 b_and!30603)))

(declare-fun b!969647 () Bool)

(declare-fun e!546663 () Bool)

(declare-fun e!546664 () Bool)

(declare-fun mapRes!35029 () Bool)

(assert (=> b!969647 (= e!546663 (and e!546664 mapRes!35029))))

(declare-fun condMapEmpty!35029 () Bool)

(declare-datatypes ((V!34333 0))(
  ( (V!34334 (val!11057 Int)) )
))
(declare-datatypes ((ValueCell!10525 0))(
  ( (ValueCellFull!10525 (v!13616 V!34333)) (EmptyCell!10525) )
))
(declare-datatypes ((array!60091 0))(
  ( (array!60092 (arr!28909 (Array (_ BitVec 32) ValueCell!10525)) (size!29388 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60091)

(declare-fun mapDefault!35029 () ValueCell!10525)

