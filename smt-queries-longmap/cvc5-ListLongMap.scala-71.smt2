; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!958 () Bool)

(assert start!958)

(declare-fun b_free!331 () Bool)

(declare-fun b_next!331 () Bool)

(assert (=> start!958 (= b_free!331 (not b_next!331))))

(declare-fun tp!1225 () Bool)

(declare-fun b_and!479 () Bool)

(assert (=> start!958 (= tp!1225 b_and!479)))

(declare-fun b!8221 () Bool)

(declare-fun e!4661 () Bool)

(declare-fun e!4660 () Bool)

(declare-fun mapRes!587 () Bool)

(assert (=> b!8221 (= e!4661 (and e!4660 mapRes!587))))

(declare-fun condMapEmpty!587 () Bool)

(declare-datatypes ((V!723 0))(
  ( (V!724 (val!210 Int)) )
))
(declare-datatypes ((ValueCell!188 0))(
  ( (ValueCellFull!188 (v!1302 V!723)) (EmptyCell!188) )
))
(declare-datatypes ((array!749 0))(
  ( (array!750 (arr!362 (Array (_ BitVec 32) ValueCell!188)) (size!424 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!749)

(declare-fun mapDefault!587 () ValueCell!188)

