; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!472 () Bool)

(assert start!472)

(declare-fun b!2789 () Bool)

(declare-fun res!4843 () Bool)

(declare-fun e!1133 () Bool)

(assert (=> b!2789 (=> (not res!4843) (not e!1133))))

(declare-datatypes ((array!73 0))(
  ( (array!74 (arr!34 (Array (_ BitVec 32) (_ BitVec 64))) (size!96 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!73)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73 (_ BitVec 32)) Bool)

(assert (=> b!2789 (= res!4843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!50 () Bool)

(declare-fun mapRes!50 () Bool)

(assert (=> mapIsEmpty!50 mapRes!50))

(declare-fun b!2790 () Bool)

(declare-fun e!1131 () Bool)

(declare-fun tp_is_empty!71 () Bool)

(assert (=> b!2790 (= e!1131 tp_is_empty!71)))

(declare-fun b!2791 () Bool)

(declare-fun res!4842 () Bool)

(assert (=> b!2791 (=> (not res!4842) (not e!1133))))

(declare-datatypes ((V!271 0))(
  ( (V!272 (val!41 Int)) )
))
(declare-datatypes ((ValueCell!19 0))(
  ( (ValueCellFull!19 (v!1127 V!271)) (EmptyCell!19) )
))
(declare-datatypes ((array!75 0))(
  ( (array!76 (arr!35 (Array (_ BitVec 32) ValueCell!19)) (size!97 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!75)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!2791 (= res!4842 (and (= (size!97 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!96 _keys!1806) (size!97 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!2792 () Bool)

(assert (=> b!2792 (= e!1133 (bvsgt #b00000000000000000000000000000000 (size!96 _keys!1806)))))

(declare-fun b!2793 () Bool)

(declare-fun e!1132 () Bool)

(assert (=> b!2793 (= e!1132 tp_is_empty!71)))

(declare-fun b!2794 () Bool)

(declare-fun e!1134 () Bool)

(assert (=> b!2794 (= e!1134 (and e!1132 mapRes!50))))

(declare-fun condMapEmpty!50 () Bool)

(declare-fun mapDefault!50 () ValueCell!19)

