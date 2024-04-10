; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96238 () Bool)

(assert start!96238)

(declare-fun b_free!22891 () Bool)

(declare-fun b_next!22891 () Bool)

(assert (=> start!96238 (= b_free!22891 (not b_next!22891))))

(declare-fun tp!80521 () Bool)

(declare-fun b_and!36457 () Bool)

(assert (=> start!96238 (= tp!80521 b_and!36457)))

(declare-fun b!1093203 () Bool)

(declare-fun e!624235 () Bool)

(declare-fun e!624236 () Bool)

(declare-fun mapRes!42094 () Bool)

(assert (=> b!1093203 (= e!624235 (and e!624236 mapRes!42094))))

(declare-fun condMapEmpty!42094 () Bool)

(declare-datatypes ((V!40985 0))(
  ( (V!40986 (val!13503 Int)) )
))
(declare-datatypes ((ValueCell!12737 0))(
  ( (ValueCellFull!12737 (v!16124 V!40985)) (EmptyCell!12737) )
))
(declare-datatypes ((array!70705 0))(
  ( (array!70706 (arr!34026 (Array (_ BitVec 32) ValueCell!12737)) (size!34562 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70705)

(declare-fun mapDefault!42094 () ValueCell!12737)

