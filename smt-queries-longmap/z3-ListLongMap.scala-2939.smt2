; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41826 () Bool)

(assert start!41826)

(declare-fun b_free!11443 () Bool)

(declare-fun b_next!11443 () Bool)

(assert (=> start!41826 (= b_free!11443 (not b_next!11443))))

(declare-fun tp!40339 () Bool)

(declare-fun b_and!19833 () Bool)

(assert (=> start!41826 (= tp!40339 b_and!19833)))

(declare-fun b!467137 () Bool)

(declare-fun e!273221 () Bool)

(assert (=> b!467137 (= e!273221 (not true))))

(declare-datatypes ((V!18267 0))(
  ( (V!18268 (val!6480 Int)) )
))
(declare-datatypes ((tuple2!8438 0))(
  ( (tuple2!8439 (_1!4230 (_ BitVec 64)) (_2!4230 V!18267)) )
))
(declare-datatypes ((List!8517 0))(
  ( (Nil!8514) (Cons!8513 (h!9369 tuple2!8438) (t!14463 List!8517)) )
))
(declare-datatypes ((ListLongMap!7353 0))(
  ( (ListLongMap!7354 (toList!3692 List!8517)) )
))
(declare-fun lt!211257 () ListLongMap!7353)

(declare-fun lt!211259 () ListLongMap!7353)

(assert (=> b!467137 (= lt!211257 lt!211259)))

(declare-datatypes ((Unit!13596 0))(
  ( (Unit!13597) )
))
(declare-fun lt!211258 () Unit!13596)

(declare-fun minValueBefore!38 () V!18267)

(declare-fun zeroValue!794 () V!18267)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29512 0))(
  ( (array!29513 (arr!14183 (Array (_ BitVec 32) (_ BitVec 64))) (size!14535 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29512)

(declare-datatypes ((ValueCell!6092 0))(
  ( (ValueCellFull!6092 (v!8770 V!18267)) (EmptyCell!6092) )
))
(declare-datatypes ((array!29514 0))(
  ( (array!29515 (arr!14184 (Array (_ BitVec 32) ValueCell!6092)) (size!14536 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29514)

(declare-fun minValueAfter!38 () V!18267)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!74 (array!29512 array!29514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18267 V!18267 V!18267 V!18267 (_ BitVec 32) Int) Unit!13596)

(assert (=> b!467137 (= lt!211258 (lemmaNoChangeToArrayThenSameMapNoExtras!74 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1914 (array!29512 array!29514 (_ BitVec 32) (_ BitVec 32) V!18267 V!18267 (_ BitVec 32) Int) ListLongMap!7353)

(assert (=> b!467137 (= lt!211259 (getCurrentListMapNoExtraKeys!1914 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467137 (= lt!211257 (getCurrentListMapNoExtraKeys!1914 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467138 () Bool)

(declare-fun res!279233 () Bool)

(assert (=> b!467138 (=> (not res!279233) (not e!273221))))

(assert (=> b!467138 (= res!279233 (and (= (size!14536 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14535 _keys!1025) (size!14536 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467139 () Bool)

(declare-fun res!279231 () Bool)

(assert (=> b!467139 (=> (not res!279231) (not e!273221))))

(declare-datatypes ((List!8518 0))(
  ( (Nil!8515) (Cons!8514 (h!9370 (_ BitVec 64)) (t!14464 List!8518)) )
))
(declare-fun arrayNoDuplicates!0 (array!29512 (_ BitVec 32) List!8518) Bool)

(assert (=> b!467139 (= res!279231 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8515))))

(declare-fun b!467140 () Bool)

(declare-fun e!273222 () Bool)

(declare-fun tp_is_empty!12871 () Bool)

(assert (=> b!467140 (= e!273222 tp_is_empty!12871)))

(declare-fun mapNonEmpty!20995 () Bool)

(declare-fun mapRes!20995 () Bool)

(declare-fun tp!40338 () Bool)

(declare-fun e!273224 () Bool)

(assert (=> mapNonEmpty!20995 (= mapRes!20995 (and tp!40338 e!273224))))

(declare-fun mapKey!20995 () (_ BitVec 32))

(declare-fun mapRest!20995 () (Array (_ BitVec 32) ValueCell!6092))

(declare-fun mapValue!20995 () ValueCell!6092)

(assert (=> mapNonEmpty!20995 (= (arr!14184 _values!833) (store mapRest!20995 mapKey!20995 mapValue!20995))))

(declare-fun b!467141 () Bool)

(assert (=> b!467141 (= e!273224 tp_is_empty!12871)))

(declare-fun b!467143 () Bool)

(declare-fun res!279230 () Bool)

(assert (=> b!467143 (=> (not res!279230) (not e!273221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29512 (_ BitVec 32)) Bool)

(assert (=> b!467143 (= res!279230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20995 () Bool)

(assert (=> mapIsEmpty!20995 mapRes!20995))

(declare-fun b!467142 () Bool)

(declare-fun e!273225 () Bool)

(assert (=> b!467142 (= e!273225 (and e!273222 mapRes!20995))))

(declare-fun condMapEmpty!20995 () Bool)

(declare-fun mapDefault!20995 () ValueCell!6092)

(assert (=> b!467142 (= condMapEmpty!20995 (= (arr!14184 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6092)) mapDefault!20995)))))

(declare-fun res!279232 () Bool)

(assert (=> start!41826 (=> (not res!279232) (not e!273221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41826 (= res!279232 (validMask!0 mask!1365))))

(assert (=> start!41826 e!273221))

(assert (=> start!41826 tp_is_empty!12871))

(assert (=> start!41826 tp!40339))

(assert (=> start!41826 true))

(declare-fun array_inv!10324 (array!29512) Bool)

(assert (=> start!41826 (array_inv!10324 _keys!1025)))

(declare-fun array_inv!10325 (array!29514) Bool)

(assert (=> start!41826 (and (array_inv!10325 _values!833) e!273225)))

(assert (= (and start!41826 res!279232) b!467138))

(assert (= (and b!467138 res!279233) b!467143))

(assert (= (and b!467143 res!279230) b!467139))

(assert (= (and b!467139 res!279231) b!467137))

(assert (= (and b!467142 condMapEmpty!20995) mapIsEmpty!20995))

(assert (= (and b!467142 (not condMapEmpty!20995)) mapNonEmpty!20995))

(get-info :version)

(assert (= (and mapNonEmpty!20995 ((_ is ValueCellFull!6092) mapValue!20995)) b!467141))

(assert (= (and b!467142 ((_ is ValueCellFull!6092) mapDefault!20995)) b!467140))

(assert (= start!41826 b!467142))

(declare-fun m!449567 () Bool)

(assert (=> start!41826 m!449567))

(declare-fun m!449569 () Bool)

(assert (=> start!41826 m!449569))

(declare-fun m!449571 () Bool)

(assert (=> start!41826 m!449571))

(declare-fun m!449573 () Bool)

(assert (=> b!467139 m!449573))

(declare-fun m!449575 () Bool)

(assert (=> b!467143 m!449575))

(declare-fun m!449577 () Bool)

(assert (=> b!467137 m!449577))

(declare-fun m!449579 () Bool)

(assert (=> b!467137 m!449579))

(declare-fun m!449581 () Bool)

(assert (=> b!467137 m!449581))

(declare-fun m!449583 () Bool)

(assert (=> mapNonEmpty!20995 m!449583))

(check-sat (not b!467139) tp_is_empty!12871 b_and!19833 (not start!41826) (not b!467143) (not mapNonEmpty!20995) (not b_next!11443) (not b!467137))
(check-sat b_and!19833 (not b_next!11443))
