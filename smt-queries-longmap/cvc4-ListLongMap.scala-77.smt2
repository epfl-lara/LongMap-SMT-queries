; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1042 () Bool)

(assert start!1042)

(declare-fun b_free!371 () Bool)

(declare-fun b_next!371 () Bool)

(assert (=> start!1042 (= b_free!371 (not b_next!371))))

(declare-fun tp!1352 () Bool)

(declare-fun b_and!523 () Bool)

(assert (=> start!1042 (= tp!1352 b_and!523)))

(declare-fun b!9195 () Bool)

(declare-fun e!5251 () Bool)

(declare-fun e!5252 () Bool)

(declare-fun mapRes!653 () Bool)

(assert (=> b!9195 (= e!5251 (and e!5252 mapRes!653))))

(declare-fun condMapEmpty!653 () Bool)

(declare-datatypes ((V!775 0))(
  ( (V!776 (val!230 Int)) )
))
(declare-datatypes ((ValueCell!208 0))(
  ( (ValueCellFull!208 (v!1324 V!775)) (EmptyCell!208) )
))
(declare-datatypes ((array!829 0))(
  ( (array!830 (arr!400 (Array (_ BitVec 32) ValueCell!208)) (size!462 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!829)

(declare-fun mapDefault!653 () ValueCell!208)

