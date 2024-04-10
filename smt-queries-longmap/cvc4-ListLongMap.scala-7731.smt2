; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97118 () Bool)

(assert start!97118)

(declare-fun b!1104596 () Bool)

(declare-fun res!736965 () Bool)

(declare-fun e!630500 () Bool)

(assert (=> b!1104596 (=> (not res!736965) (not e!630500))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104596 (= res!736965 (validKeyInArray!0 k!934))))

(declare-fun b!1104597 () Bool)

(declare-fun e!630503 () Bool)

(declare-fun e!630502 () Bool)

(declare-fun mapRes!42862 () Bool)

(assert (=> b!1104597 (= e!630503 (and e!630502 mapRes!42862))))

(declare-fun condMapEmpty!42862 () Bool)

(declare-datatypes ((V!41613 0))(
  ( (V!41614 (val!13739 Int)) )
))
(declare-datatypes ((ValueCell!12973 0))(
  ( (ValueCellFull!12973 (v!16372 V!41613)) (EmptyCell!12973) )
))
(declare-datatypes ((array!71655 0))(
  ( (array!71656 (arr!34481 (Array (_ BitVec 32) ValueCell!12973)) (size!35017 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71655)

(declare-fun mapDefault!42862 () ValueCell!12973)

