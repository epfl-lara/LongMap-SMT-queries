; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95520 () Bool)

(assert start!95520)

(declare-fun b!1078867 () Bool)

(declare-fun res!718924 () Bool)

(declare-fun e!616843 () Bool)

(assert (=> b!1078867 (=> (not res!718924) (not e!616843))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!69337 0))(
  ( (array!69338 (arr!33343 (Array (_ BitVec 32) (_ BitVec 64))) (size!33879 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69337)

(assert (=> b!1078867 (= res!718924 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33879 _keys!1070))))))

(declare-fun res!718926 () Bool)

(assert (=> start!95520 (=> (not res!718926) (not e!616843))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95520 (= res!718926 (validMask!0 mask!1414))))

(assert (=> start!95520 e!616843))

(assert (=> start!95520 true))

(declare-fun array_inv!25758 (array!69337) Bool)

(assert (=> start!95520 (array_inv!25758 _keys!1070)))

(declare-datatypes ((V!40049 0))(
  ( (V!40050 (val!13152 Int)) )
))
(declare-datatypes ((ValueCell!12386 0))(
  ( (ValueCellFull!12386 (v!15773 V!40049)) (EmptyCell!12386) )
))
(declare-datatypes ((array!69339 0))(
  ( (array!69340 (arr!33344 (Array (_ BitVec 32) ValueCell!12386)) (size!33880 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69339)

(declare-fun e!616841 () Bool)

(declare-fun array_inv!25759 (array!69339) Bool)

(assert (=> start!95520 (and (array_inv!25759 _values!874) e!616841)))

(declare-fun b!1078868 () Bool)

(declare-fun e!616840 () Bool)

(declare-fun mapRes!41038 () Bool)

(assert (=> b!1078868 (= e!616841 (and e!616840 mapRes!41038))))

(declare-fun condMapEmpty!41038 () Bool)

(declare-fun mapDefault!41038 () ValueCell!12386)

