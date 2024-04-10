; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95376 () Bool)

(assert start!95376)

(declare-fun b!1077295 () Bool)

(declare-fun res!717836 () Bool)

(declare-fun e!615955 () Bool)

(assert (=> b!1077295 (=> (not res!717836) (not e!615955))))

(declare-datatypes ((List!23215 0))(
  ( (Nil!23212) (Cons!23211 (h!24420 (_ BitVec 64)) (t!32574 List!23215)) )
))
(declare-fun noDuplicate!1574 (List!23215) Bool)

(assert (=> b!1077295 (= res!717836 (noDuplicate!1574 Nil!23212))))

(declare-fun res!717840 () Bool)

(assert (=> start!95376 (=> (not res!717840) (not e!615955))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95376 (= res!717840 (validMask!0 mask!1414))))

(assert (=> start!95376 e!615955))

(assert (=> start!95376 true))

(declare-datatypes ((V!39929 0))(
  ( (V!39930 (val!13107 Int)) )
))
(declare-datatypes ((ValueCell!12341 0))(
  ( (ValueCellFull!12341 (v!15726 V!39929)) (EmptyCell!12341) )
))
(declare-datatypes ((array!69153 0))(
  ( (array!69154 (arr!33255 (Array (_ BitVec 32) ValueCell!12341)) (size!33791 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69153)

(declare-fun e!615957 () Bool)

(declare-fun array_inv!25690 (array!69153) Bool)

(assert (=> start!95376 (and (array_inv!25690 _values!874) e!615957)))

(declare-datatypes ((array!69155 0))(
  ( (array!69156 (arr!33256 (Array (_ BitVec 32) (_ BitVec 64))) (size!33792 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69155)

(declare-fun array_inv!25691 (array!69155) Bool)

(assert (=> start!95376 (array_inv!25691 _keys!1070)))

(declare-fun b!1077296 () Bool)

(declare-fun res!717837 () Bool)

(assert (=> b!1077296 (=> (not res!717837) (not e!615955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69155 (_ BitVec 32)) Bool)

(assert (=> b!1077296 (= res!717837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077297 () Bool)

(declare-fun e!615953 () Bool)

(declare-fun tp_is_empty!26101 () Bool)

(assert (=> b!1077297 (= e!615953 tp_is_empty!26101)))

(declare-fun mapNonEmpty!40891 () Bool)

(declare-fun mapRes!40891 () Bool)

(declare-fun tp!78353 () Bool)

(declare-fun e!615956 () Bool)

(assert (=> mapNonEmpty!40891 (= mapRes!40891 (and tp!78353 e!615956))))

(declare-fun mapValue!40891 () ValueCell!12341)

(declare-fun mapRest!40891 () (Array (_ BitVec 32) ValueCell!12341))

(declare-fun mapKey!40891 () (_ BitVec 32))

(assert (=> mapNonEmpty!40891 (= (arr!33255 _values!874) (store mapRest!40891 mapKey!40891 mapValue!40891))))

(declare-fun mapIsEmpty!40891 () Bool)

(assert (=> mapIsEmpty!40891 mapRes!40891))

(declare-fun b!1077298 () Bool)

(assert (=> b!1077298 (= e!615956 tp_is_empty!26101)))

(declare-fun b!1077299 () Bool)

(assert (=> b!1077299 (= e!615957 (and e!615953 mapRes!40891))))

(declare-fun condMapEmpty!40891 () Bool)

(declare-fun mapDefault!40891 () ValueCell!12341)

