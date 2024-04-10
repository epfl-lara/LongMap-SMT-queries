; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97066 () Bool)

(assert start!97066)

(declare-fun mapIsEmpty!42823 () Bool)

(declare-fun mapRes!42823 () Bool)

(assert (=> mapIsEmpty!42823 mapRes!42823))

(declare-fun b!1104068 () Bool)

(declare-fun e!630231 () Bool)

(declare-datatypes ((List!24052 0))(
  ( (Nil!24049) (Cons!24048 (h!25257 (_ BitVec 64)) (t!34317 List!24052)) )
))
(declare-fun noDuplicate!1586 (List!24052) Bool)

(assert (=> b!1104068 (= e!630231 (not (noDuplicate!1586 Nil!24049)))))

(declare-fun b!1104069 () Bool)

(declare-fun e!630228 () Bool)

(declare-fun e!630230 () Bool)

(assert (=> b!1104069 (= e!630228 (and e!630230 mapRes!42823))))

(declare-fun condMapEmpty!42823 () Bool)

(declare-datatypes ((V!41585 0))(
  ( (V!41586 (val!13728 Int)) )
))
(declare-datatypes ((ValueCell!12962 0))(
  ( (ValueCellFull!12962 (v!16360 V!41585)) (EmptyCell!12962) )
))
(declare-datatypes ((array!71609 0))(
  ( (array!71610 (arr!34460 (Array (_ BitVec 32) ValueCell!12962)) (size!34996 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71609)

(declare-fun mapDefault!42823 () ValueCell!12962)

