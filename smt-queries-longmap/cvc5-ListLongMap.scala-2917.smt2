; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41658 () Bool)

(assert start!41658)

(declare-fun b_free!11311 () Bool)

(declare-fun b_next!11311 () Bool)

(assert (=> start!41658 (= b_free!11311 (not b_next!11311))))

(declare-fun tp!39933 () Bool)

(declare-fun b_and!19659 () Bool)

(assert (=> start!41658 (= tp!39933 b_and!19659)))

(declare-fun mapIsEmpty!20788 () Bool)

(declare-fun mapRes!20788 () Bool)

(assert (=> mapIsEmpty!20788 mapRes!20788))

(declare-fun b!465197 () Bool)

(declare-fun e!271837 () Bool)

(declare-fun tp_is_empty!12739 () Bool)

(assert (=> b!465197 (= e!271837 tp_is_empty!12739)))

(declare-fun b!465198 () Bool)

(declare-fun res!278091 () Bool)

(declare-fun e!271833 () Bool)

(assert (=> b!465198 (=> (not res!278091) (not e!271833))))

(declare-datatypes ((array!29263 0))(
  ( (array!29264 (arr!14062 (Array (_ BitVec 32) (_ BitVec 64))) (size!14414 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29263)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29263 (_ BitVec 32)) Bool)

(assert (=> b!465198 (= res!278091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465199 () Bool)

(declare-fun res!278090 () Bool)

(assert (=> b!465199 (=> (not res!278090) (not e!271833))))

(declare-datatypes ((List!8498 0))(
  ( (Nil!8495) (Cons!8494 (h!9350 (_ BitVec 64)) (t!14446 List!8498)) )
))
(declare-fun arrayNoDuplicates!0 (array!29263 (_ BitVec 32) List!8498) Bool)

(assert (=> b!465199 (= res!278090 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8495))))

(declare-fun b!465200 () Bool)

(declare-fun res!278088 () Bool)

(assert (=> b!465200 (=> (not res!278088) (not e!271833))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18091 0))(
  ( (V!18092 (val!6414 Int)) )
))
(declare-datatypes ((ValueCell!6026 0))(
  ( (ValueCellFull!6026 (v!8701 V!18091)) (EmptyCell!6026) )
))
(declare-datatypes ((array!29265 0))(
  ( (array!29266 (arr!14063 (Array (_ BitVec 32) ValueCell!6026)) (size!14415 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29265)

(assert (=> b!465200 (= res!278088 (and (= (size!14415 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14414 _keys!1025) (size!14415 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465201 () Bool)

(assert (=> b!465201 (= e!271833 (not true))))

(declare-datatypes ((tuple2!8404 0))(
  ( (tuple2!8405 (_1!4213 (_ BitVec 64)) (_2!4213 V!18091)) )
))
(declare-datatypes ((List!8499 0))(
  ( (Nil!8496) (Cons!8495 (h!9351 tuple2!8404) (t!14447 List!8499)) )
))
(declare-datatypes ((ListLongMap!7317 0))(
  ( (ListLongMap!7318 (toList!3674 List!8499)) )
))
(declare-fun lt!210045 () ListLongMap!7317)

(declare-fun lt!210044 () ListLongMap!7317)

(assert (=> b!465201 (= lt!210045 lt!210044)))

(declare-fun minValueBefore!38 () V!18091)

(declare-fun zeroValue!794 () V!18091)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13516 0))(
  ( (Unit!13517) )
))
(declare-fun lt!210043 () Unit!13516)

(declare-fun minValueAfter!38 () V!18091)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!34 (array!29263 array!29265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18091 V!18091 V!18091 V!18091 (_ BitVec 32) Int) Unit!13516)

(assert (=> b!465201 (= lt!210043 (lemmaNoChangeToArrayThenSameMapNoExtras!34 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1854 (array!29263 array!29265 (_ BitVec 32) (_ BitVec 32) V!18091 V!18091 (_ BitVec 32) Int) ListLongMap!7317)

(assert (=> b!465201 (= lt!210044 (getCurrentListMapNoExtraKeys!1854 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465201 (= lt!210045 (getCurrentListMapNoExtraKeys!1854 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465202 () Bool)

(declare-fun e!271836 () Bool)

(assert (=> b!465202 (= e!271836 tp_is_empty!12739)))

(declare-fun mapNonEmpty!20788 () Bool)

(declare-fun tp!39934 () Bool)

(assert (=> mapNonEmpty!20788 (= mapRes!20788 (and tp!39934 e!271836))))

(declare-fun mapKey!20788 () (_ BitVec 32))

(declare-fun mapValue!20788 () ValueCell!6026)

(declare-fun mapRest!20788 () (Array (_ BitVec 32) ValueCell!6026))

(assert (=> mapNonEmpty!20788 (= (arr!14063 _values!833) (store mapRest!20788 mapKey!20788 mapValue!20788))))

(declare-fun res!278089 () Bool)

(assert (=> start!41658 (=> (not res!278089) (not e!271833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41658 (= res!278089 (validMask!0 mask!1365))))

(assert (=> start!41658 e!271833))

(assert (=> start!41658 tp_is_empty!12739))

(assert (=> start!41658 tp!39933))

(assert (=> start!41658 true))

(declare-fun array_inv!10162 (array!29263) Bool)

(assert (=> start!41658 (array_inv!10162 _keys!1025)))

(declare-fun e!271834 () Bool)

(declare-fun array_inv!10163 (array!29265) Bool)

(assert (=> start!41658 (and (array_inv!10163 _values!833) e!271834)))

(declare-fun b!465203 () Bool)

(assert (=> b!465203 (= e!271834 (and e!271837 mapRes!20788))))

(declare-fun condMapEmpty!20788 () Bool)

(declare-fun mapDefault!20788 () ValueCell!6026)

