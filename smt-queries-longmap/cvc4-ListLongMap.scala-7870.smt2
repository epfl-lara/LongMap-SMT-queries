; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97968 () Bool)

(assert start!97968)

(declare-fun b_free!23669 () Bool)

(declare-fun b_next!23669 () Bool)

(assert (=> start!97968 (= b_free!23669 (not b_next!23669))))

(declare-fun tp!83710 () Bool)

(declare-fun b_and!38121 () Bool)

(assert (=> start!97968 (= tp!83710 b_and!38121)))

(declare-fun b!1123133 () Bool)

(declare-fun e!639411 () Bool)

(declare-fun e!639415 () Bool)

(declare-fun mapRes!44116 () Bool)

(assert (=> b!1123133 (= e!639411 (and e!639415 mapRes!44116))))

(declare-fun condMapEmpty!44116 () Bool)

(declare-datatypes ((V!42725 0))(
  ( (V!42726 (val!14156 Int)) )
))
(declare-datatypes ((ValueCell!13390 0))(
  ( (ValueCellFull!13390 (v!16789 V!42725)) (EmptyCell!13390) )
))
(declare-datatypes ((array!73271 0))(
  ( (array!73272 (arr!35288 (Array (_ BitVec 32) ValueCell!13390)) (size!35824 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73271)

(declare-fun mapDefault!44116 () ValueCell!13390)

