; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41694 () Bool)

(assert start!41694)

(declare-fun b_free!11347 () Bool)

(declare-fun b_next!11347 () Bool)

(assert (=> start!41694 (= b_free!11347 (not b_next!11347))))

(declare-fun tp!40045 () Bool)

(declare-fun b_and!19677 () Bool)

(assert (=> start!41694 (= tp!40045 b_and!19677)))

(declare-fun b!465427 () Bool)

(declare-fun e!272022 () Bool)

(assert (=> b!465427 (= e!272022 true)))

(declare-datatypes ((V!18139 0))(
  ( (V!18140 (val!6432 Int)) )
))
(declare-fun zeroValue!794 () V!18139)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8474 0))(
  ( (tuple2!8475 (_1!4248 (_ BitVec 64)) (_2!4248 V!18139)) )
))
(declare-datatypes ((List!8558 0))(
  ( (Nil!8555) (Cons!8554 (h!9410 tuple2!8474) (t!14499 List!8558)) )
))
(declare-datatypes ((ListLongMap!7377 0))(
  ( (ListLongMap!7378 (toList!3704 List!8558)) )
))
(declare-fun lt!210091 () ListLongMap!7377)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29333 0))(
  ( (array!29334 (arr!14096 (Array (_ BitVec 32) (_ BitVec 64))) (size!14449 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29333)

(declare-datatypes ((ValueCell!6044 0))(
  ( (ValueCellFull!6044 (v!8713 V!18139)) (EmptyCell!6044) )
))
(declare-datatypes ((array!29335 0))(
  ( (array!29336 (arr!14097 (Array (_ BitVec 32) ValueCell!6044)) (size!14450 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29335)

(declare-fun minValueAfter!38 () V!18139)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2097 (array!29333 array!29335 (_ BitVec 32) (_ BitVec 32) V!18139 V!18139 (_ BitVec 32) Int) ListLongMap!7377)

(assert (=> b!465427 (= lt!210091 (getCurrentListMap!2097 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18139)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!210089 () ListLongMap!7377)

(declare-fun +!1678 (ListLongMap!7377 tuple2!8474) ListLongMap!7377)

(assert (=> b!465427 (= lt!210089 (+!1678 (getCurrentListMap!2097 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8475 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun res!278248 () Bool)

(declare-fun e!272025 () Bool)

(assert (=> start!41694 (=> (not res!278248) (not e!272025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41694 (= res!278248 (validMask!0 mask!1365))))

(assert (=> start!41694 e!272025))

(declare-fun tp_is_empty!12775 () Bool)

(assert (=> start!41694 tp_is_empty!12775))

(assert (=> start!41694 tp!40045))

(assert (=> start!41694 true))

(declare-fun array_inv!10262 (array!29333) Bool)

(assert (=> start!41694 (array_inv!10262 _keys!1025)))

(declare-fun e!272024 () Bool)

(declare-fun array_inv!10263 (array!29335) Bool)

(assert (=> start!41694 (and (array_inv!10263 _values!833) e!272024)))

(declare-fun b!465428 () Bool)

(assert (=> b!465428 (= e!272025 (not e!272022))))

(declare-fun res!278245 () Bool)

(assert (=> b!465428 (=> res!278245 e!272022)))

(assert (=> b!465428 (= res!278245 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210087 () ListLongMap!7377)

(declare-fun lt!210088 () ListLongMap!7377)

(assert (=> b!465428 (= lt!210087 lt!210088)))

(declare-datatypes ((Unit!13520 0))(
  ( (Unit!13521) )
))
(declare-fun lt!210090 () Unit!13520)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!51 (array!29333 array!29335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18139 V!18139 V!18139 V!18139 (_ BitVec 32) Int) Unit!13520)

(assert (=> b!465428 (= lt!210090 (lemmaNoChangeToArrayThenSameMapNoExtras!51 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1894 (array!29333 array!29335 (_ BitVec 32) (_ BitVec 32) V!18139 V!18139 (_ BitVec 32) Int) ListLongMap!7377)

(assert (=> b!465428 (= lt!210088 (getCurrentListMapNoExtraKeys!1894 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465428 (= lt!210087 (getCurrentListMapNoExtraKeys!1894 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465429 () Bool)

(declare-fun e!272026 () Bool)

(declare-fun mapRes!20845 () Bool)

(assert (=> b!465429 (= e!272024 (and e!272026 mapRes!20845))))

(declare-fun condMapEmpty!20845 () Bool)

(declare-fun mapDefault!20845 () ValueCell!6044)

(assert (=> b!465429 (= condMapEmpty!20845 (= (arr!14097 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6044)) mapDefault!20845)))))

(declare-fun b!465430 () Bool)

(declare-fun res!278247 () Bool)

(assert (=> b!465430 (=> (not res!278247) (not e!272025))))

(declare-datatypes ((List!8559 0))(
  ( (Nil!8556) (Cons!8555 (h!9411 (_ BitVec 64)) (t!14500 List!8559)) )
))
(declare-fun arrayNoDuplicates!0 (array!29333 (_ BitVec 32) List!8559) Bool)

(assert (=> b!465430 (= res!278247 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8556))))

(declare-fun mapIsEmpty!20845 () Bool)

(assert (=> mapIsEmpty!20845 mapRes!20845))

(declare-fun b!465431 () Bool)

(declare-fun e!272023 () Bool)

(assert (=> b!465431 (= e!272023 tp_is_empty!12775)))

(declare-fun b!465432 () Bool)

(declare-fun res!278246 () Bool)

(assert (=> b!465432 (=> (not res!278246) (not e!272025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29333 (_ BitVec 32)) Bool)

(assert (=> b!465432 (= res!278246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20845 () Bool)

(declare-fun tp!40044 () Bool)

(assert (=> mapNonEmpty!20845 (= mapRes!20845 (and tp!40044 e!272023))))

(declare-fun mapRest!20845 () (Array (_ BitVec 32) ValueCell!6044))

(declare-fun mapKey!20845 () (_ BitVec 32))

(declare-fun mapValue!20845 () ValueCell!6044)

(assert (=> mapNonEmpty!20845 (= (arr!14097 _values!833) (store mapRest!20845 mapKey!20845 mapValue!20845))))

(declare-fun b!465433 () Bool)

(assert (=> b!465433 (= e!272026 tp_is_empty!12775)))

(declare-fun b!465434 () Bool)

(declare-fun res!278244 () Bool)

(assert (=> b!465434 (=> (not res!278244) (not e!272025))))

(assert (=> b!465434 (= res!278244 (and (= (size!14450 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14449 _keys!1025) (size!14450 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41694 res!278248) b!465434))

(assert (= (and b!465434 res!278244) b!465432))

(assert (= (and b!465432 res!278246) b!465430))

(assert (= (and b!465430 res!278247) b!465428))

(assert (= (and b!465428 (not res!278245)) b!465427))

(assert (= (and b!465429 condMapEmpty!20845) mapIsEmpty!20845))

(assert (= (and b!465429 (not condMapEmpty!20845)) mapNonEmpty!20845))

(get-info :version)

(assert (= (and mapNonEmpty!20845 ((_ is ValueCellFull!6044) mapValue!20845)) b!465431))

(assert (= (and b!465429 ((_ is ValueCellFull!6044) mapDefault!20845)) b!465433))

(assert (= start!41694 b!465429))

(declare-fun m!447195 () Bool)

(assert (=> b!465430 m!447195))

(declare-fun m!447197 () Bool)

(assert (=> mapNonEmpty!20845 m!447197))

(declare-fun m!447199 () Bool)

(assert (=> start!41694 m!447199))

(declare-fun m!447201 () Bool)

(assert (=> start!41694 m!447201))

(declare-fun m!447203 () Bool)

(assert (=> start!41694 m!447203))

(declare-fun m!447205 () Bool)

(assert (=> b!465428 m!447205))

(declare-fun m!447207 () Bool)

(assert (=> b!465428 m!447207))

(declare-fun m!447209 () Bool)

(assert (=> b!465428 m!447209))

(declare-fun m!447211 () Bool)

(assert (=> b!465432 m!447211))

(declare-fun m!447213 () Bool)

(assert (=> b!465427 m!447213))

(declare-fun m!447215 () Bool)

(assert (=> b!465427 m!447215))

(assert (=> b!465427 m!447215))

(declare-fun m!447217 () Bool)

(assert (=> b!465427 m!447217))

(check-sat b_and!19677 (not start!41694) (not mapNonEmpty!20845) (not b!465432) (not b!465428) (not b_next!11347) (not b!465430) tp_is_empty!12775 (not b!465427))
(check-sat b_and!19677 (not b_next!11347))
