; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40308 () Bool)

(assert start!40308)

(declare-fun b!442617 () Bool)

(declare-fun e!260512 () Bool)

(declare-fun e!260511 () Bool)

(declare-fun mapRes!19185 () Bool)

(assert (=> b!442617 (= e!260512 (and e!260511 mapRes!19185))))

(declare-fun condMapEmpty!19185 () Bool)

(declare-datatypes ((V!16715 0))(
  ( (V!16716 (val!5898 Int)) )
))
(declare-datatypes ((ValueCell!5510 0))(
  ( (ValueCellFull!5510 (v!8149 V!16715)) (EmptyCell!5510) )
))
(declare-datatypes ((array!27227 0))(
  ( (array!27228 (arr!13062 (Array (_ BitVec 32) ValueCell!5510)) (size!13414 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27227)

(declare-fun mapDefault!19185 () ValueCell!5510)

