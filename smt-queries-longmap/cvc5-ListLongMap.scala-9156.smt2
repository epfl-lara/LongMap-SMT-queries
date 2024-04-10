; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109816 () Bool)

(assert start!109816)

(declare-fun b_free!29209 () Bool)

(declare-fun b_next!29209 () Bool)

(assert (=> start!109816 (= b_free!29209 (not b_next!29209))))

(declare-fun tp!102761 () Bool)

(declare-fun b_and!47323 () Bool)

(assert (=> start!109816 (= tp!102761 b_and!47323)))

(declare-fun b!1301061 () Bool)

(declare-fun e!742105 () Bool)

(declare-fun e!742107 () Bool)

(declare-fun mapRes!53849 () Bool)

(assert (=> b!1301061 (= e!742105 (and e!742107 mapRes!53849))))

(declare-fun condMapEmpty!53849 () Bool)

(declare-datatypes ((V!51569 0))(
  ( (V!51570 (val!17499 Int)) )
))
(declare-datatypes ((ValueCell!16526 0))(
  ( (ValueCellFull!16526 (v!20107 V!51569)) (EmptyCell!16526) )
))
(declare-datatypes ((array!86710 0))(
  ( (array!86711 (arr!41851 (Array (_ BitVec 32) ValueCell!16526)) (size!42401 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86710)

(declare-fun mapDefault!53849 () ValueCell!16526)

