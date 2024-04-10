; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96764 () Bool)

(assert start!96764)

(declare-fun b_free!23159 () Bool)

(declare-fun b_next!23159 () Bool)

(assert (=> start!96764 (= b_free!23159 (not b_next!23159))))

(declare-fun tp!81424 () Bool)

(declare-fun b_and!37079 () Bool)

(assert (=> start!96764 (= tp!81424 b_and!37079)))

(declare-fun b!1100770 () Bool)

(declare-fun e!628280 () Bool)

(declare-fun e!628276 () Bool)

(declare-fun mapRes!42595 () Bool)

(assert (=> b!1100770 (= e!628280 (and e!628276 mapRes!42595))))

(declare-fun condMapEmpty!42595 () Bool)

(declare-datatypes ((V!41405 0))(
  ( (V!41406 (val!13661 Int)) )
))
(declare-datatypes ((ValueCell!12895 0))(
  ( (ValueCellFull!12895 (v!16289 V!41405)) (EmptyCell!12895) )
))
(declare-datatypes ((array!71337 0))(
  ( (array!71338 (arr!34333 (Array (_ BitVec 32) ValueCell!12895)) (size!34869 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71337)

(declare-fun mapDefault!42595 () ValueCell!12895)

