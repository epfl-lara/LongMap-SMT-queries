; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100078 () Bool)

(assert start!100078)

(declare-fun b_free!25657 () Bool)

(declare-fun b_next!25657 () Bool)

(assert (=> start!100078 (= b_free!25657 (not b_next!25657))))

(declare-fun tp!89685 () Bool)

(declare-fun b_and!42181 () Bool)

(assert (=> start!100078 (= tp!89685 b_and!42181)))

(declare-fun b!1193113 () Bool)

(declare-fun e!678126 () Bool)

(declare-fun e!678124 () Bool)

(declare-fun mapRes!47108 () Bool)

(assert (=> b!1193113 (= e!678126 (and e!678124 mapRes!47108))))

(declare-fun condMapEmpty!47108 () Bool)

(declare-datatypes ((V!45377 0))(
  ( (V!45378 (val!15150 Int)) )
))
(declare-datatypes ((ValueCell!14384 0))(
  ( (ValueCellFull!14384 (v!17788 V!45377)) (EmptyCell!14384) )
))
(declare-datatypes ((array!77157 0))(
  ( (array!77158 (arr!37228 (Array (_ BitVec 32) ValueCell!14384)) (size!37764 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77157)

(declare-fun mapDefault!47108 () ValueCell!14384)

