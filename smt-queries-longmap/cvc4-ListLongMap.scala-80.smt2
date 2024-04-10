; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1118 () Bool)

(assert start!1118)

(declare-fun b_free!389 () Bool)

(declare-fun b_next!389 () Bool)

(assert (=> start!1118 (= b_free!389 (not b_next!389))))

(declare-fun tp!1411 () Bool)

(declare-fun b_and!545 () Bool)

(assert (=> start!1118 (= tp!1411 b_and!545)))

(declare-fun b!9912 () Bool)

(declare-fun e!5679 () Bool)

(declare-fun e!5680 () Bool)

(assert (=> b!9912 (= e!5679 e!5680)))

(declare-fun res!8754 () Bool)

(assert (=> b!9912 (=> res!8754 e!5680)))

(declare-datatypes ((array!867 0))(
  ( (array!868 (arr!417 (Array (_ BitVec 32) (_ BitVec 64))) (size!479 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!867)

(declare-fun mask!2250 () (_ BitVec 32))

(assert (=> b!9912 (= res!8754 (not (= (size!479 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!2345 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!867 (_ BitVec 32)) Bool)

(assert (=> b!9912 (arrayForallSeekEntryOrOpenFound!0 lt!2345 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!203 0))(
  ( (Unit!204) )
))
(declare-fun lt!2348 () Unit!203)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!203)

(assert (=> b!9912 (= lt!2348 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2345))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!867 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!9912 (= lt!2345 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!9913 () Bool)

(declare-fun e!5682 () Bool)

(declare-fun e!5686 () Bool)

(declare-fun mapRes!686 () Bool)

(assert (=> b!9913 (= e!5682 (and e!5686 mapRes!686))))

(declare-fun condMapEmpty!686 () Bool)

(declare-datatypes ((V!799 0))(
  ( (V!800 (val!239 Int)) )
))
(declare-datatypes ((ValueCell!217 0))(
  ( (ValueCellFull!217 (v!1335 V!799)) (EmptyCell!217) )
))
(declare-datatypes ((array!869 0))(
  ( (array!870 (arr!418 (Array (_ BitVec 32) ValueCell!217)) (size!480 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!869)

(declare-fun mapDefault!686 () ValueCell!217)

