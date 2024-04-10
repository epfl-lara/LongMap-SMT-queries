; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105620 () Bool)

(assert start!105620)

(declare-fun b_free!27221 () Bool)

(declare-fun b_next!27221 () Bool)

(assert (=> start!105620 (= b_free!27221 (not b_next!27221))))

(declare-fun tp!95185 () Bool)

(declare-fun b_and!45095 () Bool)

(assert (=> start!105620 (= tp!95185 b_and!45095)))

(declare-fun b!1258129 () Bool)

(declare-fun e!715503 () Bool)

(declare-fun e!715500 () Bool)

(declare-fun mapRes!49978 () Bool)

(assert (=> b!1258129 (= e!715503 (and e!715500 mapRes!49978))))

(declare-fun condMapEmpty!49978 () Bool)

(declare-datatypes ((V!48195 0))(
  ( (V!48196 (val!16124 Int)) )
))
(declare-datatypes ((ValueCell!15298 0))(
  ( (ValueCellFull!15298 (v!18826 V!48195)) (EmptyCell!15298) )
))
(declare-datatypes ((array!81876 0))(
  ( (array!81877 (arr!39494 (Array (_ BitVec 32) ValueCell!15298)) (size!40030 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81876)

(declare-fun mapDefault!49978 () ValueCell!15298)

