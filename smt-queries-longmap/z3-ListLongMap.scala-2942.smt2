; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41844 () Bool)

(assert start!41844)

(declare-fun b_free!11461 () Bool)

(declare-fun b_next!11461 () Bool)

(assert (=> start!41844 (= b_free!11461 (not b_next!11461))))

(declare-fun tp!40393 () Bool)

(declare-fun b_and!19815 () Bool)

(assert (=> start!41844 (= tp!40393 b_and!19815)))

(declare-fun b!467116 () Bool)

(declare-fun e!273224 () Bool)

(declare-fun tp_is_empty!12889 () Bool)

(assert (=> b!467116 (= e!273224 tp_is_empty!12889)))

(declare-fun b!467117 () Bool)

(declare-fun e!273221 () Bool)

(assert (=> b!467117 (= e!273221 (not true))))

(declare-datatypes ((V!18291 0))(
  ( (V!18292 (val!6489 Int)) )
))
(declare-datatypes ((tuple2!8558 0))(
  ( (tuple2!8559 (_1!4290 (_ BitVec 64)) (_2!4290 V!18291)) )
))
(declare-datatypes ((List!8638 0))(
  ( (Nil!8635) (Cons!8634 (h!9490 tuple2!8558) (t!14583 List!8638)) )
))
(declare-datatypes ((ListLongMap!7461 0))(
  ( (ListLongMap!7462 (toList!3746 List!8638)) )
))
(declare-fun lt!211093 () ListLongMap!7461)

(declare-fun lt!211094 () ListLongMap!7461)

(assert (=> b!467117 (= lt!211093 lt!211094)))

(declare-datatypes ((Unit!13596 0))(
  ( (Unit!13597) )
))
(declare-fun lt!211092 () Unit!13596)

(declare-fun minValueBefore!38 () V!18291)

(declare-fun zeroValue!794 () V!18291)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29549 0))(
  ( (array!29550 (arr!14202 (Array (_ BitVec 32) (_ BitVec 64))) (size!14555 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29549)

(declare-datatypes ((ValueCell!6101 0))(
  ( (ValueCellFull!6101 (v!8772 V!18291)) (EmptyCell!6101) )
))
(declare-datatypes ((array!29551 0))(
  ( (array!29552 (arr!14203 (Array (_ BitVec 32) ValueCell!6101)) (size!14556 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29551)

(declare-fun minValueAfter!38 () V!18291)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!87 (array!29549 array!29551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18291 V!18291 V!18291 V!18291 (_ BitVec 32) Int) Unit!13596)

(assert (=> b!467117 (= lt!211092 (lemmaNoChangeToArrayThenSameMapNoExtras!87 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1930 (array!29549 array!29551 (_ BitVec 32) (_ BitVec 32) V!18291 V!18291 (_ BitVec 32) Int) ListLongMap!7461)

(assert (=> b!467117 (= lt!211094 (getCurrentListMapNoExtraKeys!1930 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467117 (= lt!211093 (getCurrentListMapNoExtraKeys!1930 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467118 () Bool)

(declare-fun e!273222 () Bool)

(assert (=> b!467118 (= e!273222 tp_is_empty!12889)))

(declare-fun b!467119 () Bool)

(declare-fun res!279217 () Bool)

(assert (=> b!467119 (=> (not res!279217) (not e!273221))))

(declare-datatypes ((List!8639 0))(
  ( (Nil!8636) (Cons!8635 (h!9491 (_ BitVec 64)) (t!14584 List!8639)) )
))
(declare-fun arrayNoDuplicates!0 (array!29549 (_ BitVec 32) List!8639) Bool)

(assert (=> b!467119 (= res!279217 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8636))))

(declare-fun mapIsEmpty!21022 () Bool)

(declare-fun mapRes!21022 () Bool)

(assert (=> mapIsEmpty!21022 mapRes!21022))

(declare-fun b!467120 () Bool)

(declare-fun res!279216 () Bool)

(assert (=> b!467120 (=> (not res!279216) (not e!273221))))

(assert (=> b!467120 (= res!279216 (and (= (size!14556 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14555 _keys!1025) (size!14556 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21022 () Bool)

(declare-fun tp!40392 () Bool)

(assert (=> mapNonEmpty!21022 (= mapRes!21022 (and tp!40392 e!273222))))

(declare-fun mapRest!21022 () (Array (_ BitVec 32) ValueCell!6101))

(declare-fun mapValue!21022 () ValueCell!6101)

(declare-fun mapKey!21022 () (_ BitVec 32))

(assert (=> mapNonEmpty!21022 (= (arr!14203 _values!833) (store mapRest!21022 mapKey!21022 mapValue!21022))))

(declare-fun res!279219 () Bool)

(assert (=> start!41844 (=> (not res!279219) (not e!273221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41844 (= res!279219 (validMask!0 mask!1365))))

(assert (=> start!41844 e!273221))

(assert (=> start!41844 tp_is_empty!12889))

(assert (=> start!41844 tp!40393))

(assert (=> start!41844 true))

(declare-fun array_inv!10336 (array!29549) Bool)

(assert (=> start!41844 (array_inv!10336 _keys!1025)))

(declare-fun e!273225 () Bool)

(declare-fun array_inv!10337 (array!29551) Bool)

(assert (=> start!41844 (and (array_inv!10337 _values!833) e!273225)))

(declare-fun b!467121 () Bool)

(declare-fun res!279218 () Bool)

(assert (=> b!467121 (=> (not res!279218) (not e!273221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29549 (_ BitVec 32)) Bool)

(assert (=> b!467121 (= res!279218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467122 () Bool)

(assert (=> b!467122 (= e!273225 (and e!273224 mapRes!21022))))

(declare-fun condMapEmpty!21022 () Bool)

(declare-fun mapDefault!21022 () ValueCell!6101)

(assert (=> b!467122 (= condMapEmpty!21022 (= (arr!14203 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6101)) mapDefault!21022)))))

(assert (= (and start!41844 res!279219) b!467120))

(assert (= (and b!467120 res!279216) b!467121))

(assert (= (and b!467121 res!279218) b!467119))

(assert (= (and b!467119 res!279217) b!467117))

(assert (= (and b!467122 condMapEmpty!21022) mapIsEmpty!21022))

(assert (= (and b!467122 (not condMapEmpty!21022)) mapNonEmpty!21022))

(get-info :version)

(assert (= (and mapNonEmpty!21022 ((_ is ValueCellFull!6101) mapValue!21022)) b!467118))

(assert (= (and b!467122 ((_ is ValueCellFull!6101) mapDefault!21022)) b!467116))

(assert (= start!41844 b!467122))

(declare-fun m!448813 () Bool)

(assert (=> b!467117 m!448813))

(declare-fun m!448815 () Bool)

(assert (=> b!467117 m!448815))

(declare-fun m!448817 () Bool)

(assert (=> b!467117 m!448817))

(declare-fun m!448819 () Bool)

(assert (=> b!467119 m!448819))

(declare-fun m!448821 () Bool)

(assert (=> b!467121 m!448821))

(declare-fun m!448823 () Bool)

(assert (=> start!41844 m!448823))

(declare-fun m!448825 () Bool)

(assert (=> start!41844 m!448825))

(declare-fun m!448827 () Bool)

(assert (=> start!41844 m!448827))

(declare-fun m!448829 () Bool)

(assert (=> mapNonEmpty!21022 m!448829))

(check-sat (not b!467119) (not mapNonEmpty!21022) (not start!41844) b_and!19815 tp_is_empty!12889 (not b_next!11461) (not b!467117) (not b!467121))
(check-sat b_and!19815 (not b_next!11461))
