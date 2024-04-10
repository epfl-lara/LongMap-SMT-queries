; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42648 () Bool)

(assert start!42648)

(declare-fun b_free!12053 () Bool)

(declare-fun b_next!12053 () Bool)

(assert (=> start!42648 (= b_free!12053 (not b_next!12053))))

(declare-fun tp!42204 () Bool)

(declare-fun b_and!20553 () Bool)

(assert (=> start!42648 (= tp!42204 b_and!20553)))

(declare-fun b!475722 () Bool)

(declare-fun e!279363 () Bool)

(declare-fun tp_is_empty!13481 () Bool)

(assert (=> b!475722 (= e!279363 tp_is_empty!13481)))

(declare-fun mapIsEmpty!21946 () Bool)

(declare-fun mapRes!21946 () Bool)

(assert (=> mapIsEmpty!21946 mapRes!21946))

(declare-fun b!475723 () Bool)

(declare-fun res!284058 () Bool)

(declare-fun e!279366 () Bool)

(assert (=> b!475723 (=> (not res!284058) (not e!279366))))

(declare-datatypes ((array!30701 0))(
  ( (array!30702 (arr!14766 (Array (_ BitVec 32) (_ BitVec 64))) (size!15118 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30701)

(declare-datatypes ((List!9025 0))(
  ( (Nil!9022) (Cons!9021 (h!9877 (_ BitVec 64)) (t!15003 List!9025)) )
))
(declare-fun arrayNoDuplicates!0 (array!30701 (_ BitVec 32) List!9025) Bool)

(assert (=> b!475723 (= res!284058 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9022))))

(declare-fun b!475724 () Bool)

(declare-fun e!279361 () Bool)

(assert (=> b!475724 (= e!279361 true)))

(declare-datatypes ((V!19079 0))(
  ( (V!19080 (val!6785 Int)) )
))
(declare-fun zeroValue!794 () V!19079)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6397 0))(
  ( (ValueCellFull!6397 (v!9079 V!19079)) (EmptyCell!6397) )
))
(declare-datatypes ((array!30703 0))(
  ( (array!30704 (arr!14767 (Array (_ BitVec 32) ValueCell!6397)) (size!15119 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30703)

(declare-fun minValueAfter!38 () V!19079)

(declare-datatypes ((tuple2!8948 0))(
  ( (tuple2!8949 (_1!4485 (_ BitVec 64)) (_2!4485 V!19079)) )
))
(declare-datatypes ((List!9026 0))(
  ( (Nil!9023) (Cons!9022 (h!9878 tuple2!8948) (t!15004 List!9026)) )
))
(declare-datatypes ((ListLongMap!7861 0))(
  ( (ListLongMap!7862 (toList!3946 List!9026)) )
))
(declare-fun lt!216689 () ListLongMap!7861)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2288 (array!30701 array!30703 (_ BitVec 32) (_ BitVec 32) V!19079 V!19079 (_ BitVec 32) Int) ListLongMap!7861)

(assert (=> b!475724 (= lt!216689 (getCurrentListMap!2288 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19079)

(declare-fun lt!216692 () ListLongMap!7861)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun +!1760 (ListLongMap!7861 tuple2!8948) ListLongMap!7861)

(assert (=> b!475724 (= lt!216692 (+!1760 (getCurrentListMap!2288 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8949 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!475725 () Bool)

(declare-fun e!279365 () Bool)

(assert (=> b!475725 (= e!279365 tp_is_empty!13481)))

(declare-fun b!475726 () Bool)

(declare-fun res!284057 () Bool)

(assert (=> b!475726 (=> (not res!284057) (not e!279366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30701 (_ BitVec 32)) Bool)

(assert (=> b!475726 (= res!284057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475727 () Bool)

(assert (=> b!475727 (= e!279366 (not e!279361))))

(declare-fun res!284056 () Bool)

(assert (=> b!475727 (=> res!284056 e!279361)))

(assert (=> b!475727 (= res!284056 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!216690 () ListLongMap!7861)

(declare-fun lt!216688 () ListLongMap!7861)

(assert (=> b!475727 (= lt!216690 lt!216688)))

(declare-datatypes ((Unit!14014 0))(
  ( (Unit!14015) )
))
(declare-fun lt!216691 () Unit!14014)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!262 (array!30701 array!30703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19079 V!19079 V!19079 V!19079 (_ BitVec 32) Int) Unit!14014)

(assert (=> b!475727 (= lt!216691 (lemmaNoChangeToArrayThenSameMapNoExtras!262 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2102 (array!30701 array!30703 (_ BitVec 32) (_ BitVec 32) V!19079 V!19079 (_ BitVec 32) Int) ListLongMap!7861)

(assert (=> b!475727 (= lt!216688 (getCurrentListMapNoExtraKeys!2102 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475727 (= lt!216690 (getCurrentListMapNoExtraKeys!2102 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21946 () Bool)

(declare-fun tp!42205 () Bool)

(assert (=> mapNonEmpty!21946 (= mapRes!21946 (and tp!42205 e!279363))))

(declare-fun mapRest!21946 () (Array (_ BitVec 32) ValueCell!6397))

(declare-fun mapKey!21946 () (_ BitVec 32))

(declare-fun mapValue!21946 () ValueCell!6397)

(assert (=> mapNonEmpty!21946 (= (arr!14767 _values!833) (store mapRest!21946 mapKey!21946 mapValue!21946))))

(declare-fun res!284060 () Bool)

(assert (=> start!42648 (=> (not res!284060) (not e!279366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42648 (= res!284060 (validMask!0 mask!1365))))

(assert (=> start!42648 e!279366))

(assert (=> start!42648 tp_is_empty!13481))

(assert (=> start!42648 tp!42204))

(assert (=> start!42648 true))

(declare-fun array_inv!10656 (array!30701) Bool)

(assert (=> start!42648 (array_inv!10656 _keys!1025)))

(declare-fun e!279364 () Bool)

(declare-fun array_inv!10657 (array!30703) Bool)

(assert (=> start!42648 (and (array_inv!10657 _values!833) e!279364)))

(declare-fun b!475728 () Bool)

(declare-fun res!284059 () Bool)

(assert (=> b!475728 (=> (not res!284059) (not e!279366))))

(assert (=> b!475728 (= res!284059 (and (= (size!15119 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15118 _keys!1025) (size!15119 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475729 () Bool)

(assert (=> b!475729 (= e!279364 (and e!279365 mapRes!21946))))

(declare-fun condMapEmpty!21946 () Bool)

(declare-fun mapDefault!21946 () ValueCell!6397)

