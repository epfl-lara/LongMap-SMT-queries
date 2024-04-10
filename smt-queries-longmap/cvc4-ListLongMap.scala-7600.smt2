; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95924 () Bool)

(assert start!95924)

(declare-fun b_free!22577 () Bool)

(declare-fun b_next!22577 () Bool)

(assert (=> start!95924 (= b_free!22577 (not b_next!22577))))

(declare-fun tp!79580 () Bool)

(declare-fun b_and!35829 () Bool)

(assert (=> start!95924 (= tp!79580 b_and!35829)))

(declare-fun b!1086425 () Bool)

(declare-fun e!620613 () Bool)

(declare-fun e!620618 () Bool)

(declare-fun mapRes!41623 () Bool)

(assert (=> b!1086425 (= e!620613 (and e!620618 mapRes!41623))))

(declare-fun condMapEmpty!41623 () Bool)

(declare-datatypes ((V!40565 0))(
  ( (V!40566 (val!13346 Int)) )
))
(declare-datatypes ((ValueCell!12580 0))(
  ( (ValueCellFull!12580 (v!15967 V!40565)) (EmptyCell!12580) )
))
(declare-datatypes ((array!70093 0))(
  ( (array!70094 (arr!33720 (Array (_ BitVec 32) ValueCell!12580)) (size!34256 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70093)

(declare-fun mapDefault!41623 () ValueCell!12580)

