; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41836 () Bool)

(assert start!41836)

(declare-fun b_free!11439 () Bool)

(declare-fun b_next!11439 () Bool)

(assert (=> start!41836 (= b_free!11439 (not b_next!11439))))

(declare-fun tp!40326 () Bool)

(declare-fun b_and!19819 () Bool)

(assert (=> start!41836 (= tp!40326 b_and!19819)))

(declare-fun b!467156 () Bool)

(declare-fun e!273231 () Bool)

(assert (=> b!467156 (= e!273231 (not true))))

(declare-datatypes ((V!18261 0))(
  ( (V!18262 (val!6478 Int)) )
))
(declare-datatypes ((tuple2!8500 0))(
  ( (tuple2!8501 (_1!4261 (_ BitVec 64)) (_2!4261 V!18261)) )
))
(declare-datatypes ((List!8588 0))(
  ( (Nil!8585) (Cons!8584 (h!9440 tuple2!8500) (t!14542 List!8588)) )
))
(declare-datatypes ((ListLongMap!7413 0))(
  ( (ListLongMap!7414 (toList!3722 List!8588)) )
))
(declare-fun lt!211228 () ListLongMap!7413)

(declare-fun lt!211227 () ListLongMap!7413)

(assert (=> b!467156 (= lt!211228 lt!211227)))

(declare-fun minValueBefore!38 () V!18261)

(declare-fun zeroValue!794 () V!18261)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13604 0))(
  ( (Unit!13605) )
))
(declare-fun lt!211229 () Unit!13604)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29515 0))(
  ( (array!29516 (arr!14185 (Array (_ BitVec 32) (_ BitVec 64))) (size!14537 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29515)

(declare-datatypes ((ValueCell!6090 0))(
  ( (ValueCellFull!6090 (v!8767 V!18261)) (EmptyCell!6090) )
))
(declare-datatypes ((array!29517 0))(
  ( (array!29518 (arr!14186 (Array (_ BitVec 32) ValueCell!6090)) (size!14538 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29517)

(declare-fun minValueAfter!38 () V!18261)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!76 (array!29515 array!29517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18261 V!18261 V!18261 V!18261 (_ BitVec 32) Int) Unit!13604)

(assert (=> b!467156 (= lt!211229 (lemmaNoChangeToArrayThenSameMapNoExtras!76 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1896 (array!29515 array!29517 (_ BitVec 32) (_ BitVec 32) V!18261 V!18261 (_ BitVec 32) Int) ListLongMap!7413)

(assert (=> b!467156 (= lt!211227 (getCurrentListMapNoExtraKeys!1896 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467156 (= lt!211228 (getCurrentListMapNoExtraKeys!1896 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!279213 () Bool)

(assert (=> start!41836 (=> (not res!279213) (not e!273231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41836 (= res!279213 (validMask!0 mask!1365))))

(assert (=> start!41836 e!273231))

(declare-fun tp_is_empty!12867 () Bool)

(assert (=> start!41836 tp_is_empty!12867))

(assert (=> start!41836 tp!40326))

(assert (=> start!41836 true))

(declare-fun array_inv!10240 (array!29515) Bool)

(assert (=> start!41836 (array_inv!10240 _keys!1025)))

(declare-fun e!273234 () Bool)

(declare-fun array_inv!10241 (array!29517) Bool)

(assert (=> start!41836 (and (array_inv!10241 _values!833) e!273234)))

(declare-fun b!467157 () Bool)

(declare-fun e!273233 () Bool)

(assert (=> b!467157 (= e!273233 tp_is_empty!12867)))

(declare-fun b!467158 () Bool)

(declare-fun mapRes!20989 () Bool)

(assert (=> b!467158 (= e!273234 (and e!273233 mapRes!20989))))

(declare-fun condMapEmpty!20989 () Bool)

(declare-fun mapDefault!20989 () ValueCell!6090)

(assert (=> b!467158 (= condMapEmpty!20989 (= (arr!14186 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6090)) mapDefault!20989)))))

(declare-fun b!467159 () Bool)

(declare-fun res!279216 () Bool)

(assert (=> b!467159 (=> (not res!279216) (not e!273231))))

(assert (=> b!467159 (= res!279216 (and (= (size!14538 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14537 _keys!1025) (size!14538 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467160 () Bool)

(declare-fun res!279215 () Bool)

(assert (=> b!467160 (=> (not res!279215) (not e!273231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29515 (_ BitVec 32)) Bool)

(assert (=> b!467160 (= res!279215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467161 () Bool)

(declare-fun res!279214 () Bool)

(assert (=> b!467161 (=> (not res!279214) (not e!273231))))

(declare-datatypes ((List!8589 0))(
  ( (Nil!8586) (Cons!8585 (h!9441 (_ BitVec 64)) (t!14543 List!8589)) )
))
(declare-fun arrayNoDuplicates!0 (array!29515 (_ BitVec 32) List!8589) Bool)

(assert (=> b!467161 (= res!279214 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8586))))

(declare-fun mapNonEmpty!20989 () Bool)

(declare-fun tp!40327 () Bool)

(declare-fun e!273232 () Bool)

(assert (=> mapNonEmpty!20989 (= mapRes!20989 (and tp!40327 e!273232))))

(declare-fun mapValue!20989 () ValueCell!6090)

(declare-fun mapRest!20989 () (Array (_ BitVec 32) ValueCell!6090))

(declare-fun mapKey!20989 () (_ BitVec 32))

(assert (=> mapNonEmpty!20989 (= (arr!14186 _values!833) (store mapRest!20989 mapKey!20989 mapValue!20989))))

(declare-fun b!467162 () Bool)

(assert (=> b!467162 (= e!273232 tp_is_empty!12867)))

(declare-fun mapIsEmpty!20989 () Bool)

(assert (=> mapIsEmpty!20989 mapRes!20989))

(assert (= (and start!41836 res!279213) b!467159))

(assert (= (and b!467159 res!279216) b!467160))

(assert (= (and b!467160 res!279215) b!467161))

(assert (= (and b!467161 res!279214) b!467156))

(assert (= (and b!467158 condMapEmpty!20989) mapIsEmpty!20989))

(assert (= (and b!467158 (not condMapEmpty!20989)) mapNonEmpty!20989))

(get-info :version)

(assert (= (and mapNonEmpty!20989 ((_ is ValueCellFull!6090) mapValue!20989)) b!467162))

(assert (= (and b!467158 ((_ is ValueCellFull!6090) mapDefault!20989)) b!467157))

(assert (= start!41836 b!467158))

(declare-fun m!449349 () Bool)

(assert (=> b!467160 m!449349))

(declare-fun m!449351 () Bool)

(assert (=> mapNonEmpty!20989 m!449351))

(declare-fun m!449353 () Bool)

(assert (=> b!467156 m!449353))

(declare-fun m!449355 () Bool)

(assert (=> b!467156 m!449355))

(declare-fun m!449357 () Bool)

(assert (=> b!467156 m!449357))

(declare-fun m!449359 () Bool)

(assert (=> start!41836 m!449359))

(declare-fun m!449361 () Bool)

(assert (=> start!41836 m!449361))

(declare-fun m!449363 () Bool)

(assert (=> start!41836 m!449363))

(declare-fun m!449365 () Bool)

(assert (=> b!467161 m!449365))

(check-sat (not b_next!11439) (not start!41836) (not b!467156) tp_is_empty!12867 b_and!19819 (not b!467160) (not b!467161) (not mapNonEmpty!20989))
(check-sat b_and!19819 (not b_next!11439))
