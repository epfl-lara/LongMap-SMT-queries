; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111028 () Bool)

(assert start!111028)

(declare-fun b_free!29863 () Bool)

(declare-fun b_next!29863 () Bool)

(assert (=> start!111028 (= b_free!29863 (not b_next!29863))))

(declare-fun tp!104911 () Bool)

(declare-fun b_and!48071 () Bool)

(assert (=> start!111028 (= tp!104911 b_and!48071)))

(declare-fun b!1314530 () Bool)

(declare-fun e!749837 () Bool)

(declare-fun e!749834 () Bool)

(declare-fun mapRes!55018 () Bool)

(assert (=> b!1314530 (= e!749837 (and e!749834 mapRes!55018))))

(declare-fun condMapEmpty!55018 () Bool)

(declare-datatypes ((V!52561 0))(
  ( (V!52562 (val!17871 Int)) )
))
(declare-datatypes ((ValueCell!16898 0))(
  ( (ValueCellFull!16898 (v!20498 V!52561)) (EmptyCell!16898) )
))
(declare-datatypes ((array!88156 0))(
  ( (array!88157 (arr!42558 (Array (_ BitVec 32) ValueCell!16898)) (size!43108 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88156)

(declare-fun mapDefault!55018 () ValueCell!16898)

