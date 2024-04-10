; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97036 () Bool)

(assert start!97036)

(declare-fun b!1103717 () Bool)

(declare-fun res!736331 () Bool)

(declare-fun e!630064 () Bool)

(assert (=> b!1103717 (=> (not res!736331) (not e!630064))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71573 0))(
  ( (array!71574 (arr!34443 (Array (_ BitVec 32) (_ BitVec 64))) (size!34979 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71573)

(assert (=> b!1103717 (= res!736331 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34979 _keys!1208))))))

(declare-fun b!1103718 () Bool)

(declare-fun e!630066 () Bool)

(declare-fun e!630062 () Bool)

(declare-fun mapRes!42793 () Bool)

(assert (=> b!1103718 (= e!630066 (and e!630062 mapRes!42793))))

(declare-fun condMapEmpty!42793 () Bool)

(declare-datatypes ((V!41561 0))(
  ( (V!41562 (val!13719 Int)) )
))
(declare-datatypes ((ValueCell!12953 0))(
  ( (ValueCellFull!12953 (v!16351 V!41561)) (EmptyCell!12953) )
))
(declare-datatypes ((array!71575 0))(
  ( (array!71576 (arr!34444 (Array (_ BitVec 32) ValueCell!12953)) (size!34980 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71575)

(declare-fun mapDefault!42793 () ValueCell!12953)

