; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!468 () Bool)

(assert start!468)

(declare-fun b!2753 () Bool)

(declare-fun e!1102 () Bool)

(declare-fun tp_is_empty!67 () Bool)

(assert (=> b!2753 (= e!1102 tp_is_empty!67)))

(declare-fun mapNonEmpty!44 () Bool)

(declare-fun mapRes!44 () Bool)

(declare-fun tp!284 () Bool)

(assert (=> mapNonEmpty!44 (= mapRes!44 (and tp!284 e!1102))))

(declare-fun mapKey!44 () (_ BitVec 32))

(declare-datatypes ((V!267 0))(
  ( (V!268 (val!39 Int)) )
))
(declare-datatypes ((ValueCell!17 0))(
  ( (ValueCellFull!17 (v!1125 V!267)) (EmptyCell!17) )
))
(declare-fun mapValue!44 () ValueCell!17)

(declare-datatypes ((array!65 0))(
  ( (array!66 (arr!30 (Array (_ BitVec 32) ValueCell!17)) (size!92 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!65)

(declare-fun mapRest!44 () (Array (_ BitVec 32) ValueCell!17))

(assert (=> mapNonEmpty!44 (= (arr!30 _values!1492) (store mapRest!44 mapKey!44 mapValue!44))))

(declare-fun b!2754 () Bool)

(declare-fun res!4826 () Bool)

(declare-fun e!1100 () Bool)

(assert (=> b!2754 (=> (not res!4826) (not e!1100))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((array!67 0))(
  ( (array!68 (arr!31 (Array (_ BitVec 32) (_ BitVec 64))) (size!93 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!67)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!2754 (= res!4826 (and (= (size!92 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!93 _keys!1806) (size!92 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!4825 () Bool)

(assert (=> start!468 (=> (not res!4825) (not e!1100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!468 (= res!4825 (validMask!0 mask!2250))))

(assert (=> start!468 e!1100))

(assert (=> start!468 true))

(declare-fun e!1104 () Bool)

(declare-fun array_inv!13 (array!65) Bool)

(assert (=> start!468 (and (array_inv!13 _values!1492) e!1104)))

(declare-fun array_inv!14 (array!67) Bool)

(assert (=> start!468 (array_inv!14 _keys!1806)))

(declare-fun b!2755 () Bool)

(declare-fun e!1103 () Bool)

(assert (=> b!2755 (= e!1103 tp_is_empty!67)))

(declare-fun b!2756 () Bool)

(assert (=> b!2756 (= e!1104 (and e!1103 mapRes!44))))

(declare-fun condMapEmpty!44 () Bool)

(declare-fun mapDefault!44 () ValueCell!17)

