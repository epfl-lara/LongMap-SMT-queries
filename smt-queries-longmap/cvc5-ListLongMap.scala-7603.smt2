; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95938 () Bool)

(assert start!95938)

(declare-fun b_free!22591 () Bool)

(declare-fun b_next!22591 () Bool)

(assert (=> start!95938 (= b_free!22591 (not b_next!22591))))

(declare-fun tp!79621 () Bool)

(declare-fun b_and!35857 () Bool)

(assert (=> start!95938 (= tp!79621 b_and!35857)))

(declare-fun b!1086733 () Bool)

(declare-fun e!620786 () Bool)

(declare-fun e!620779 () Bool)

(declare-fun mapRes!41644 () Bool)

(assert (=> b!1086733 (= e!620786 (and e!620779 mapRes!41644))))

(declare-fun condMapEmpty!41644 () Bool)

(declare-datatypes ((V!40585 0))(
  ( (V!40586 (val!13353 Int)) )
))
(declare-datatypes ((ValueCell!12587 0))(
  ( (ValueCellFull!12587 (v!15974 V!40585)) (EmptyCell!12587) )
))
(declare-datatypes ((array!70119 0))(
  ( (array!70120 (arr!33733 (Array (_ BitVec 32) ValueCell!12587)) (size!34269 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70119)

(declare-fun mapDefault!41644 () ValueCell!12587)

