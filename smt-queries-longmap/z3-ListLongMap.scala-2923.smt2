; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41710 () Bool)

(assert start!41710)

(declare-fun b_free!11349 () Bool)

(declare-fun b_next!11349 () Bool)

(assert (=> start!41710 (= b_free!11349 (not b_next!11349))))

(declare-fun tp!40051 () Bool)

(declare-fun b_and!19705 () Bool)

(assert (=> start!41710 (= tp!40051 b_and!19705)))

(declare-fun b!465722 () Bool)

(declare-fun res!278388 () Bool)

(declare-fun e!272216 () Bool)

(assert (=> b!465722 (=> (not res!278388) (not e!272216))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29335 0))(
  ( (array!29336 (arr!14097 (Array (_ BitVec 32) (_ BitVec 64))) (size!14449 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29335)

(declare-datatypes ((V!18141 0))(
  ( (V!18142 (val!6433 Int)) )
))
(declare-datatypes ((ValueCell!6045 0))(
  ( (ValueCellFull!6045 (v!8720 V!18141)) (EmptyCell!6045) )
))
(declare-datatypes ((array!29337 0))(
  ( (array!29338 (arr!14098 (Array (_ BitVec 32) ValueCell!6045)) (size!14450 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29337)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!465722 (= res!278388 (and (= (size!14450 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14449 _keys!1025) (size!14450 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465723 () Bool)

(declare-fun res!278389 () Bool)

(assert (=> b!465723 (=> (not res!278389) (not e!272216))))

(declare-datatypes ((List!8521 0))(
  ( (Nil!8518) (Cons!8517 (h!9373 (_ BitVec 64)) (t!14471 List!8521)) )
))
(declare-fun arrayNoDuplicates!0 (array!29335 (_ BitVec 32) List!8521) Bool)

(assert (=> b!465723 (= res!278389 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8518))))

(declare-fun b!465724 () Bool)

(declare-fun e!272217 () Bool)

(assert (=> b!465724 (= e!272217 true)))

(declare-fun zeroValue!794 () V!18141)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8430 0))(
  ( (tuple2!8431 (_1!4226 (_ BitVec 64)) (_2!4226 V!18141)) )
))
(declare-datatypes ((List!8522 0))(
  ( (Nil!8519) (Cons!8518 (h!9374 tuple2!8430) (t!14472 List!8522)) )
))
(declare-datatypes ((ListLongMap!7343 0))(
  ( (ListLongMap!7344 (toList!3687 List!8522)) )
))
(declare-fun lt!210339 () ListLongMap!7343)

(declare-fun minValueAfter!38 () V!18141)

(declare-fun getCurrentListMap!2140 (array!29335 array!29337 (_ BitVec 32) (_ BitVec 32) V!18141 V!18141 (_ BitVec 32) Int) ListLongMap!7343)

(assert (=> b!465724 (= lt!210339 (getCurrentListMap!2140 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18141)

(declare-fun lt!210340 () ListLongMap!7343)

(declare-fun +!1646 (ListLongMap!7343 tuple2!8430) ListLongMap!7343)

(assert (=> b!465724 (= lt!210340 (+!1646 (getCurrentListMap!2140 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8431 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465725 () Bool)

(assert (=> b!465725 (= e!272216 (not e!272217))))

(declare-fun res!278390 () Bool)

(assert (=> b!465725 (=> res!278390 e!272217)))

(assert (=> b!465725 (= res!278390 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210338 () ListLongMap!7343)

(declare-fun lt!210337 () ListLongMap!7343)

(assert (=> b!465725 (= lt!210338 lt!210337)))

(declare-datatypes ((Unit!13542 0))(
  ( (Unit!13543) )
))
(declare-fun lt!210336 () Unit!13542)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!47 (array!29335 array!29337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18141 V!18141 V!18141 V!18141 (_ BitVec 32) Int) Unit!13542)

(assert (=> b!465725 (= lt!210336 (lemmaNoChangeToArrayThenSameMapNoExtras!47 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1867 (array!29335 array!29337 (_ BitVec 32) (_ BitVec 32) V!18141 V!18141 (_ BitVec 32) Int) ListLongMap!7343)

(assert (=> b!465725 (= lt!210337 (getCurrentListMapNoExtraKeys!1867 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465725 (= lt!210338 (getCurrentListMapNoExtraKeys!1867 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20848 () Bool)

(declare-fun mapRes!20848 () Bool)

(assert (=> mapIsEmpty!20848 mapRes!20848))

(declare-fun b!465726 () Bool)

(declare-fun e!272218 () Bool)

(declare-fun tp_is_empty!12777 () Bool)

(assert (=> b!465726 (= e!272218 tp_is_empty!12777)))

(declare-fun res!278391 () Bool)

(assert (=> start!41710 (=> (not res!278391) (not e!272216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41710 (= res!278391 (validMask!0 mask!1365))))

(assert (=> start!41710 e!272216))

(assert (=> start!41710 tp_is_empty!12777))

(assert (=> start!41710 tp!40051))

(assert (=> start!41710 true))

(declare-fun array_inv!10184 (array!29335) Bool)

(assert (=> start!41710 (array_inv!10184 _keys!1025)))

(declare-fun e!272219 () Bool)

(declare-fun array_inv!10185 (array!29337) Bool)

(assert (=> start!41710 (and (array_inv!10185 _values!833) e!272219)))

(declare-fun b!465727 () Bool)

(declare-fun e!272215 () Bool)

(assert (=> b!465727 (= e!272215 tp_is_empty!12777)))

(declare-fun b!465728 () Bool)

(assert (=> b!465728 (= e!272219 (and e!272218 mapRes!20848))))

(declare-fun condMapEmpty!20848 () Bool)

(declare-fun mapDefault!20848 () ValueCell!6045)

(assert (=> b!465728 (= condMapEmpty!20848 (= (arr!14098 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6045)) mapDefault!20848)))))

(declare-fun mapNonEmpty!20848 () Bool)

(declare-fun tp!40050 () Bool)

(assert (=> mapNonEmpty!20848 (= mapRes!20848 (and tp!40050 e!272215))))

(declare-fun mapValue!20848 () ValueCell!6045)

(declare-fun mapRest!20848 () (Array (_ BitVec 32) ValueCell!6045))

(declare-fun mapKey!20848 () (_ BitVec 32))

(assert (=> mapNonEmpty!20848 (= (arr!14098 _values!833) (store mapRest!20848 mapKey!20848 mapValue!20848))))

(declare-fun b!465729 () Bool)

(declare-fun res!278392 () Bool)

(assert (=> b!465729 (=> (not res!278392) (not e!272216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29335 (_ BitVec 32)) Bool)

(assert (=> b!465729 (= res!278392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41710 res!278391) b!465722))

(assert (= (and b!465722 res!278388) b!465729))

(assert (= (and b!465729 res!278392) b!465723))

(assert (= (and b!465723 res!278389) b!465725))

(assert (= (and b!465725 (not res!278390)) b!465724))

(assert (= (and b!465728 condMapEmpty!20848) mapIsEmpty!20848))

(assert (= (and b!465728 (not condMapEmpty!20848)) mapNonEmpty!20848))

(get-info :version)

(assert (= (and mapNonEmpty!20848 ((_ is ValueCellFull!6045) mapValue!20848)) b!465727))

(assert (= (and b!465728 ((_ is ValueCellFull!6045) mapDefault!20848)) b!465726))

(assert (= start!41710 b!465728))

(declare-fun m!447953 () Bool)

(assert (=> b!465729 m!447953))

(declare-fun m!447955 () Bool)

(assert (=> b!465725 m!447955))

(declare-fun m!447957 () Bool)

(assert (=> b!465725 m!447957))

(declare-fun m!447959 () Bool)

(assert (=> b!465725 m!447959))

(declare-fun m!447961 () Bool)

(assert (=> mapNonEmpty!20848 m!447961))

(declare-fun m!447963 () Bool)

(assert (=> start!41710 m!447963))

(declare-fun m!447965 () Bool)

(assert (=> start!41710 m!447965))

(declare-fun m!447967 () Bool)

(assert (=> start!41710 m!447967))

(declare-fun m!447969 () Bool)

(assert (=> b!465723 m!447969))

(declare-fun m!447971 () Bool)

(assert (=> b!465724 m!447971))

(declare-fun m!447973 () Bool)

(assert (=> b!465724 m!447973))

(assert (=> b!465724 m!447973))

(declare-fun m!447975 () Bool)

(assert (=> b!465724 m!447975))

(check-sat (not start!41710) (not mapNonEmpty!20848) (not b!465729) (not b!465725) (not b!465723) tp_is_empty!12777 (not b_next!11349) (not b!465724) b_and!19705)
(check-sat b_and!19705 (not b_next!11349))
