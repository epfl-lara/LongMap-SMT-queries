; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35366 () Bool)

(assert start!35366)

(declare-fun b!354080 () Bool)

(declare-fun e!216939 () Bool)

(declare-fun e!216937 () Bool)

(declare-fun mapRes!13236 () Bool)

(assert (=> b!354080 (= e!216939 (and e!216937 mapRes!13236))))

(declare-fun condMapEmpty!13236 () Bool)

(declare-datatypes ((V!11403 0))(
  ( (V!11404 (val!3954 Int)) )
))
(declare-datatypes ((ValueCell!3566 0))(
  ( (ValueCellFull!3566 (v!6148 V!11403)) (EmptyCell!3566) )
))
(declare-datatypes ((array!19229 0))(
  ( (array!19230 (arr!9108 (Array (_ BitVec 32) ValueCell!3566)) (size!9460 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19229)

(declare-fun mapDefault!13236 () ValueCell!3566)

