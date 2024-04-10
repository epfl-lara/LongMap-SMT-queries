; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42650 () Bool)

(assert start!42650)

(declare-fun b_free!12055 () Bool)

(declare-fun b_next!12055 () Bool)

(assert (=> start!42650 (= b_free!12055 (not b_next!12055))))

(declare-fun tp!42211 () Bool)

(declare-fun b_and!20555 () Bool)

(assert (=> start!42650 (= tp!42211 b_and!20555)))

(declare-fun mapIsEmpty!21949 () Bool)

(declare-fun mapRes!21949 () Bool)

(assert (=> mapIsEmpty!21949 mapRes!21949))

(declare-fun mapNonEmpty!21949 () Bool)

(declare-fun tp!42210 () Bool)

(declare-fun e!279383 () Bool)

(assert (=> mapNonEmpty!21949 (= mapRes!21949 (and tp!42210 e!279383))))

(declare-datatypes ((V!19083 0))(
  ( (V!19084 (val!6786 Int)) )
))
(declare-datatypes ((ValueCell!6398 0))(
  ( (ValueCellFull!6398 (v!9080 V!19083)) (EmptyCell!6398) )
))
(declare-fun mapValue!21949 () ValueCell!6398)

(declare-datatypes ((array!30705 0))(
  ( (array!30706 (arr!14768 (Array (_ BitVec 32) ValueCell!6398)) (size!15120 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30705)

(declare-fun mapRest!21949 () (Array (_ BitVec 32) ValueCell!6398))

(declare-fun mapKey!21949 () (_ BitVec 32))

(assert (=> mapNonEmpty!21949 (= (arr!14768 _values!833) (store mapRest!21949 mapKey!21949 mapValue!21949))))

(declare-fun b!475746 () Bool)

(declare-fun tp_is_empty!13483 () Bool)

(assert (=> b!475746 (= e!279383 tp_is_empty!13483)))

(declare-fun b!475747 () Bool)

(declare-fun e!279381 () Bool)

(declare-fun e!279384 () Bool)

(assert (=> b!475747 (= e!279381 (not e!279384))))

(declare-fun res!284071 () Bool)

(assert (=> b!475747 (=> res!284071 e!279384)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!475747 (= res!284071 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8950 0))(
  ( (tuple2!8951 (_1!4486 (_ BitVec 64)) (_2!4486 V!19083)) )
))
(declare-datatypes ((List!9027 0))(
  ( (Nil!9024) (Cons!9023 (h!9879 tuple2!8950) (t!15005 List!9027)) )
))
(declare-datatypes ((ListLongMap!7863 0))(
  ( (ListLongMap!7864 (toList!3947 List!9027)) )
))
(declare-fun lt!216706 () ListLongMap!7863)

(declare-fun lt!216710 () ListLongMap!7863)

(assert (=> b!475747 (= lt!216706 lt!216710)))

(declare-fun minValueBefore!38 () V!19083)

(declare-datatypes ((Unit!14016 0))(
  ( (Unit!14017) )
))
(declare-fun lt!216709 () Unit!14016)

(declare-fun zeroValue!794 () V!19083)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30707 0))(
  ( (array!30708 (arr!14769 (Array (_ BitVec 32) (_ BitVec 64))) (size!15121 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30707)

(declare-fun minValueAfter!38 () V!19083)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!263 (array!30707 array!30705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19083 V!19083 V!19083 V!19083 (_ BitVec 32) Int) Unit!14016)

(assert (=> b!475747 (= lt!216709 (lemmaNoChangeToArrayThenSameMapNoExtras!263 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2103 (array!30707 array!30705 (_ BitVec 32) (_ BitVec 32) V!19083 V!19083 (_ BitVec 32) Int) ListLongMap!7863)

(assert (=> b!475747 (= lt!216710 (getCurrentListMapNoExtraKeys!2103 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475747 (= lt!216706 (getCurrentListMapNoExtraKeys!2103 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475748 () Bool)

(declare-fun res!284073 () Bool)

(assert (=> b!475748 (=> (not res!284073) (not e!279381))))

(declare-datatypes ((List!9028 0))(
  ( (Nil!9025) (Cons!9024 (h!9880 (_ BitVec 64)) (t!15006 List!9028)) )
))
(declare-fun arrayNoDuplicates!0 (array!30707 (_ BitVec 32) List!9028) Bool)

(assert (=> b!475748 (= res!284073 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9025))))

(declare-fun res!284074 () Bool)

(assert (=> start!42650 (=> (not res!284074) (not e!279381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42650 (= res!284074 (validMask!0 mask!1365))))

(assert (=> start!42650 e!279381))

(assert (=> start!42650 tp_is_empty!13483))

(assert (=> start!42650 tp!42211))

(assert (=> start!42650 true))

(declare-fun array_inv!10658 (array!30707) Bool)

(assert (=> start!42650 (array_inv!10658 _keys!1025)))

(declare-fun e!279379 () Bool)

(declare-fun array_inv!10659 (array!30705) Bool)

(assert (=> start!42650 (and (array_inv!10659 _values!833) e!279379)))

(declare-fun b!475749 () Bool)

(declare-fun res!284072 () Bool)

(assert (=> b!475749 (=> (not res!284072) (not e!279381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30707 (_ BitVec 32)) Bool)

(assert (=> b!475749 (= res!284072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475750 () Bool)

(declare-fun e!279380 () Bool)

(assert (=> b!475750 (= e!279379 (and e!279380 mapRes!21949))))

(declare-fun condMapEmpty!21949 () Bool)

(declare-fun mapDefault!21949 () ValueCell!6398)

