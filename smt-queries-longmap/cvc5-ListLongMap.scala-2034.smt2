; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35372 () Bool)

(assert start!35372)

(declare-fun b!354134 () Bool)

(declare-fun e!216983 () Bool)

(declare-fun e!216986 () Bool)

(declare-fun mapRes!13245 () Bool)

(assert (=> b!354134 (= e!216983 (and e!216986 mapRes!13245))))

(declare-fun condMapEmpty!13245 () Bool)

(declare-datatypes ((V!11411 0))(
  ( (V!11412 (val!3957 Int)) )
))
(declare-datatypes ((ValueCell!3569 0))(
  ( (ValueCellFull!3569 (v!6151 V!11411)) (EmptyCell!3569) )
))
(declare-datatypes ((array!19239 0))(
  ( (array!19240 (arr!9113 (Array (_ BitVec 32) ValueCell!3569)) (size!9465 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19239)

(declare-fun mapDefault!13245 () ValueCell!3569)

