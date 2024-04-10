; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100024 () Bool)

(assert start!100024)

(declare-fun b_free!25603 () Bool)

(declare-fun b_next!25603 () Bool)

(assert (=> start!100024 (= b_free!25603 (not b_next!25603))))

(declare-fun tp!89523 () Bool)

(declare-fun b_and!42073 () Bool)

(assert (=> start!100024 (= tp!89523 b_and!42073)))

(declare-fun b!1191844 () Bool)

(declare-fun e!677481 () Bool)

(declare-fun e!677482 () Bool)

(declare-fun mapRes!47027 () Bool)

(assert (=> b!1191844 (= e!677481 (and e!677482 mapRes!47027))))

(declare-fun condMapEmpty!47027 () Bool)

(declare-datatypes ((V!45305 0))(
  ( (V!45306 (val!15123 Int)) )
))
(declare-datatypes ((ValueCell!14357 0))(
  ( (ValueCellFull!14357 (v!17761 V!45305)) (EmptyCell!14357) )
))
(declare-datatypes ((array!77057 0))(
  ( (array!77058 (arr!37178 (Array (_ BitVec 32) ValueCell!14357)) (size!37714 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77057)

(declare-fun mapDefault!47027 () ValueCell!14357)

