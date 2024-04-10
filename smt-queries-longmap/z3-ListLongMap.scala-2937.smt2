; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41830 () Bool)

(assert start!41830)

(declare-fun b_free!11433 () Bool)

(declare-fun b_next!11433 () Bool)

(assert (=> start!41830 (= b_free!11433 (not b_next!11433))))

(declare-fun tp!40309 () Bool)

(declare-fun b_and!19813 () Bool)

(assert (=> start!41830 (= tp!40309 b_and!19813)))

(declare-fun mapIsEmpty!20980 () Bool)

(declare-fun mapRes!20980 () Bool)

(assert (=> mapIsEmpty!20980 mapRes!20980))

(declare-fun b!467093 () Bool)

(declare-fun res!279180 () Bool)

(declare-fun e!273188 () Bool)

(assert (=> b!467093 (=> (not res!279180) (not e!273188))))

(declare-datatypes ((array!29505 0))(
  ( (array!29506 (arr!14180 (Array (_ BitVec 32) (_ BitVec 64))) (size!14532 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29505)

(declare-datatypes ((List!8584 0))(
  ( (Nil!8581) (Cons!8580 (h!9436 (_ BitVec 64)) (t!14538 List!8584)) )
))
(declare-fun arrayNoDuplicates!0 (array!29505 (_ BitVec 32) List!8584) Bool)

(assert (=> b!467093 (= res!279180 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8581))))

(declare-fun b!467094 () Bool)

(declare-fun e!273186 () Bool)

(declare-fun tp_is_empty!12861 () Bool)

(assert (=> b!467094 (= e!273186 tp_is_empty!12861)))

(declare-fun b!467095 () Bool)

(declare-fun e!273185 () Bool)

(assert (=> b!467095 (= e!273185 tp_is_empty!12861)))

(declare-fun mapNonEmpty!20980 () Bool)

(declare-fun tp!40308 () Bool)

(assert (=> mapNonEmpty!20980 (= mapRes!20980 (and tp!40308 e!273186))))

(declare-datatypes ((V!18253 0))(
  ( (V!18254 (val!6475 Int)) )
))
(declare-datatypes ((ValueCell!6087 0))(
  ( (ValueCellFull!6087 (v!8764 V!18253)) (EmptyCell!6087) )
))
(declare-fun mapValue!20980 () ValueCell!6087)

(declare-datatypes ((array!29507 0))(
  ( (array!29508 (arr!14181 (Array (_ BitVec 32) ValueCell!6087)) (size!14533 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29507)

(declare-fun mapRest!20980 () (Array (_ BitVec 32) ValueCell!6087))

(declare-fun mapKey!20980 () (_ BitVec 32))

(assert (=> mapNonEmpty!20980 (= (arr!14181 _values!833) (store mapRest!20980 mapKey!20980 mapValue!20980))))

(declare-fun b!467096 () Bool)

(declare-fun res!279177 () Bool)

(assert (=> b!467096 (=> (not res!279177) (not e!273188))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29505 (_ BitVec 32)) Bool)

(assert (=> b!467096 (= res!279177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467097 () Bool)

(declare-fun e!273187 () Bool)

(assert (=> b!467097 (= e!273187 (and e!273185 mapRes!20980))))

(declare-fun condMapEmpty!20980 () Bool)

(declare-fun mapDefault!20980 () ValueCell!6087)

(assert (=> b!467097 (= condMapEmpty!20980 (= (arr!14181 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6087)) mapDefault!20980)))))

(declare-fun res!279178 () Bool)

(assert (=> start!41830 (=> (not res!279178) (not e!273188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41830 (= res!279178 (validMask!0 mask!1365))))

(assert (=> start!41830 e!273188))

(assert (=> start!41830 tp_is_empty!12861))

(assert (=> start!41830 tp!40309))

(assert (=> start!41830 true))

(declare-fun array_inv!10236 (array!29505) Bool)

(assert (=> start!41830 (array_inv!10236 _keys!1025)))

(declare-fun array_inv!10237 (array!29507) Bool)

(assert (=> start!41830 (and (array_inv!10237 _values!833) e!273187)))

(declare-fun b!467098 () Bool)

(assert (=> b!467098 (= e!273188 (not true))))

(declare-datatypes ((tuple2!8496 0))(
  ( (tuple2!8497 (_1!4259 (_ BitVec 64)) (_2!4259 V!18253)) )
))
(declare-datatypes ((List!8585 0))(
  ( (Nil!8582) (Cons!8581 (h!9437 tuple2!8496) (t!14539 List!8585)) )
))
(declare-datatypes ((ListLongMap!7409 0))(
  ( (ListLongMap!7410 (toList!3720 List!8585)) )
))
(declare-fun lt!211202 () ListLongMap!7409)

(declare-fun lt!211200 () ListLongMap!7409)

(assert (=> b!467098 (= lt!211202 lt!211200)))

(declare-fun minValueBefore!38 () V!18253)

(declare-datatypes ((Unit!13600 0))(
  ( (Unit!13601) )
))
(declare-fun lt!211201 () Unit!13600)

(declare-fun zeroValue!794 () V!18253)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18253)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!74 (array!29505 array!29507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18253 V!18253 V!18253 V!18253 (_ BitVec 32) Int) Unit!13600)

(assert (=> b!467098 (= lt!211201 (lemmaNoChangeToArrayThenSameMapNoExtras!74 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1894 (array!29505 array!29507 (_ BitVec 32) (_ BitVec 32) V!18253 V!18253 (_ BitVec 32) Int) ListLongMap!7409)

(assert (=> b!467098 (= lt!211200 (getCurrentListMapNoExtraKeys!1894 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467098 (= lt!211202 (getCurrentListMapNoExtraKeys!1894 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467099 () Bool)

(declare-fun res!279179 () Bool)

(assert (=> b!467099 (=> (not res!279179) (not e!273188))))

(assert (=> b!467099 (= res!279179 (and (= (size!14533 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14532 _keys!1025) (size!14533 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41830 res!279178) b!467099))

(assert (= (and b!467099 res!279179) b!467096))

(assert (= (and b!467096 res!279177) b!467093))

(assert (= (and b!467093 res!279180) b!467098))

(assert (= (and b!467097 condMapEmpty!20980) mapIsEmpty!20980))

(assert (= (and b!467097 (not condMapEmpty!20980)) mapNonEmpty!20980))

(get-info :version)

(assert (= (and mapNonEmpty!20980 ((_ is ValueCellFull!6087) mapValue!20980)) b!467094))

(assert (= (and b!467097 ((_ is ValueCellFull!6087) mapDefault!20980)) b!467095))

(assert (= start!41830 b!467097))

(declare-fun m!449295 () Bool)

(assert (=> b!467093 m!449295))

(declare-fun m!449297 () Bool)

(assert (=> b!467098 m!449297))

(declare-fun m!449299 () Bool)

(assert (=> b!467098 m!449299))

(declare-fun m!449301 () Bool)

(assert (=> b!467098 m!449301))

(declare-fun m!449303 () Bool)

(assert (=> start!41830 m!449303))

(declare-fun m!449305 () Bool)

(assert (=> start!41830 m!449305))

(declare-fun m!449307 () Bool)

(assert (=> start!41830 m!449307))

(declare-fun m!449309 () Bool)

(assert (=> mapNonEmpty!20980 m!449309))

(declare-fun m!449311 () Bool)

(assert (=> b!467096 m!449311))

(check-sat b_and!19813 tp_is_empty!12861 (not b!467093) (not b_next!11433) (not b!467096) (not b!467098) (not mapNonEmpty!20980) (not start!41830))
(check-sat b_and!19813 (not b_next!11433))
