; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100904 () Bool)

(assert start!100904)

(declare-fun b_free!25973 () Bool)

(declare-fun b_next!25973 () Bool)

(assert (=> start!100904 (= b_free!25973 (not b_next!25973))))

(declare-fun tp!90928 () Bool)

(declare-fun b_and!42987 () Bool)

(assert (=> start!100904 (= tp!90928 b_and!42987)))

(declare-fun b!1208111 () Bool)

(declare-fun e!686105 () Bool)

(declare-fun e!686111 () Bool)

(declare-fun mapRes!47878 () Bool)

(assert (=> b!1208111 (= e!686105 (and e!686111 mapRes!47878))))

(declare-fun condMapEmpty!47878 () Bool)

(declare-datatypes ((V!46029 0))(
  ( (V!46030 (val!15395 Int)) )
))
(declare-datatypes ((ValueCell!14629 0))(
  ( (ValueCellFull!14629 (v!18043 V!46029)) (EmptyCell!14629) )
))
(declare-datatypes ((array!78137 0))(
  ( (array!78138 (arr!37707 (Array (_ BitVec 32) ValueCell!14629)) (size!38243 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78137)

(declare-fun mapDefault!47878 () ValueCell!14629)

