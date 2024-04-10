; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95756 () Bool)

(assert start!95756)

(declare-fun b_free!22409 () Bool)

(declare-fun b_next!22409 () Bool)

(assert (=> start!95756 (= b_free!22409 (not b_next!22409))))

(declare-fun tp!79075 () Bool)

(declare-fun b_and!35493 () Bool)

(assert (=> start!95756 (= tp!79075 b_and!35493)))

(declare-fun b!1082983 () Bool)

(declare-fun e!618861 () Bool)

(declare-fun e!618859 () Bool)

(declare-fun mapRes!41371 () Bool)

(assert (=> b!1082983 (= e!618861 (and e!618859 mapRes!41371))))

(declare-fun condMapEmpty!41371 () Bool)

(declare-datatypes ((V!40341 0))(
  ( (V!40342 (val!13262 Int)) )
))
(declare-datatypes ((ValueCell!12496 0))(
  ( (ValueCellFull!12496 (v!15883 V!40341)) (EmptyCell!12496) )
))
(declare-datatypes ((array!69767 0))(
  ( (array!69768 (arr!33557 (Array (_ BitVec 32) ValueCell!12496)) (size!34093 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69767)

(declare-fun mapDefault!41371 () ValueCell!12496)

