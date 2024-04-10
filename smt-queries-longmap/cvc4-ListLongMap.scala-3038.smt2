; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42606 () Bool)

(assert start!42606)

(declare-fun b_free!12041 () Bool)

(declare-fun b_next!12041 () Bool)

(assert (=> start!42606 (= b_free!12041 (not b_next!12041))))

(declare-fun tp!42162 () Bool)

(declare-fun b_and!20521 () Bool)

(assert (=> start!42606 (= tp!42162 b_and!20521)))

(declare-fun mapIsEmpty!21922 () Bool)

(declare-fun mapRes!21922 () Bool)

(assert (=> mapIsEmpty!21922 mapRes!21922))

(declare-fun mapNonEmpty!21922 () Bool)

(declare-fun tp!42163 () Bool)

(declare-fun e!279092 () Bool)

(assert (=> mapNonEmpty!21922 (= mapRes!21922 (and tp!42163 e!279092))))

(declare-datatypes ((V!19063 0))(
  ( (V!19064 (val!6779 Int)) )
))
(declare-datatypes ((ValueCell!6391 0))(
  ( (ValueCellFull!6391 (v!9072 V!19063)) (EmptyCell!6391) )
))
(declare-datatypes ((array!30673 0))(
  ( (array!30674 (arr!14754 (Array (_ BitVec 32) ValueCell!6391)) (size!15106 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30673)

(declare-fun mapKey!21922 () (_ BitVec 32))

(declare-fun mapValue!21922 () ValueCell!6391)

(declare-fun mapRest!21922 () (Array (_ BitVec 32) ValueCell!6391))

(assert (=> mapNonEmpty!21922 (= (arr!14754 _values!833) (store mapRest!21922 mapKey!21922 mapValue!21922))))

(declare-fun b!475319 () Bool)

(declare-fun res!283864 () Bool)

(declare-fun e!279091 () Bool)

(assert (=> b!475319 (=> (not res!283864) (not e!279091))))

(declare-datatypes ((array!30675 0))(
  ( (array!30676 (arr!14755 (Array (_ BitVec 32) (_ BitVec 64))) (size!15107 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30675)

(declare-datatypes ((List!9017 0))(
  ( (Nil!9014) (Cons!9013 (h!9869 (_ BitVec 64)) (t!14991 List!9017)) )
))
(declare-fun arrayNoDuplicates!0 (array!30675 (_ BitVec 32) List!9017) Bool)

(assert (=> b!475319 (= res!283864 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9014))))

(declare-fun res!283863 () Bool)

(assert (=> start!42606 (=> (not res!283863) (not e!279091))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42606 (= res!283863 (validMask!0 mask!1365))))

(assert (=> start!42606 e!279091))

(declare-fun tp_is_empty!13469 () Bool)

(assert (=> start!42606 tp_is_empty!13469))

(assert (=> start!42606 tp!42162))

(assert (=> start!42606 true))

(declare-fun array_inv!10648 (array!30675) Bool)

(assert (=> start!42606 (array_inv!10648 _keys!1025)))

(declare-fun e!279090 () Bool)

(declare-fun array_inv!10649 (array!30673) Bool)

(assert (=> start!42606 (and (array_inv!10649 _values!833) e!279090)))

(declare-fun b!475320 () Bool)

(assert (=> b!475320 (= e!279092 tp_is_empty!13469)))

(declare-fun b!475321 () Bool)

(declare-fun e!279093 () Bool)

(assert (=> b!475321 (= e!279090 (and e!279093 mapRes!21922))))

(declare-fun condMapEmpty!21922 () Bool)

(declare-fun mapDefault!21922 () ValueCell!6391)

