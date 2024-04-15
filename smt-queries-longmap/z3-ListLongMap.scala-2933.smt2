; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41772 () Bool)

(assert start!41772)

(declare-fun b_free!11407 () Bool)

(declare-fun b_next!11407 () Bool)

(assert (=> start!41772 (= b_free!11407 (not b_next!11407))))

(declare-fun tp!40227 () Bool)

(declare-fun b_and!19749 () Bool)

(assert (=> start!41772 (= tp!40227 b_and!19749)))

(declare-fun b!466331 () Bool)

(declare-fun res!278776 () Bool)

(declare-fun e!272673 () Bool)

(assert (=> b!466331 (=> (not res!278776) (not e!272673))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29445 0))(
  ( (array!29446 (arr!14151 (Array (_ BitVec 32) (_ BitVec 64))) (size!14504 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29445)

(declare-datatypes ((V!18219 0))(
  ( (V!18220 (val!6462 Int)) )
))
(declare-datatypes ((ValueCell!6074 0))(
  ( (ValueCellFull!6074 (v!8744 V!18219)) (EmptyCell!6074) )
))
(declare-datatypes ((array!29447 0))(
  ( (array!29448 (arr!14152 (Array (_ BitVec 32) ValueCell!6074)) (size!14505 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29447)

(assert (=> b!466331 (= res!278776 (and (= (size!14505 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14504 _keys!1025) (size!14505 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466332 () Bool)

(declare-fun e!272674 () Bool)

(declare-fun tp_is_empty!12835 () Bool)

(assert (=> b!466332 (= e!272674 tp_is_empty!12835)))

(declare-fun b!466333 () Bool)

(declare-fun res!278780 () Bool)

(assert (=> b!466333 (=> (not res!278780) (not e!272673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29445 (_ BitVec 32)) Bool)

(assert (=> b!466333 (= res!278780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466334 () Bool)

(declare-fun e!272677 () Bool)

(assert (=> b!466334 (= e!272677 tp_is_empty!12835)))

(declare-fun b!466335 () Bool)

(declare-fun e!272676 () Bool)

(assert (=> b!466335 (= e!272676 true)))

(declare-fun zeroValue!794 () V!18219)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8518 0))(
  ( (tuple2!8519 (_1!4270 (_ BitVec 64)) (_2!4270 V!18219)) )
))
(declare-datatypes ((List!8600 0))(
  ( (Nil!8597) (Cons!8596 (h!9452 tuple2!8518) (t!14543 List!8600)) )
))
(declare-datatypes ((ListLongMap!7421 0))(
  ( (ListLongMap!7422 (toList!3726 List!8600)) )
))
(declare-fun lt!210660 () ListLongMap!7421)

(declare-fun minValueAfter!38 () V!18219)

(declare-fun getCurrentListMap!2117 (array!29445 array!29447 (_ BitVec 32) (_ BitVec 32) V!18219 V!18219 (_ BitVec 32) Int) ListLongMap!7421)

(assert (=> b!466335 (= lt!210660 (getCurrentListMap!2117 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18219)

(declare-fun lt!210663 () ListLongMap!7421)

(declare-fun +!1698 (ListLongMap!7421 tuple2!8518) ListLongMap!7421)

(assert (=> b!466335 (= lt!210663 (+!1698 (getCurrentListMap!2117 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8519 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466336 () Bool)

(declare-fun e!272672 () Bool)

(declare-fun mapRes!20938 () Bool)

(assert (=> b!466336 (= e!272672 (and e!272677 mapRes!20938))))

(declare-fun condMapEmpty!20938 () Bool)

(declare-fun mapDefault!20938 () ValueCell!6074)

(assert (=> b!466336 (= condMapEmpty!20938 (= (arr!14152 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6074)) mapDefault!20938)))))

(declare-fun b!466337 () Bool)

(assert (=> b!466337 (= e!272673 (not e!272676))))

(declare-fun res!278777 () Bool)

(assert (=> b!466337 (=> res!278777 e!272676)))

(assert (=> b!466337 (= res!278777 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210659 () ListLongMap!7421)

(declare-fun lt!210661 () ListLongMap!7421)

(assert (=> b!466337 (= lt!210659 lt!210661)))

(declare-datatypes ((Unit!13554 0))(
  ( (Unit!13555) )
))
(declare-fun lt!210662 () Unit!13554)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!67 (array!29445 array!29447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18219 V!18219 V!18219 V!18219 (_ BitVec 32) Int) Unit!13554)

(assert (=> b!466337 (= lt!210662 (lemmaNoChangeToArrayThenSameMapNoExtras!67 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1910 (array!29445 array!29447 (_ BitVec 32) (_ BitVec 32) V!18219 V!18219 (_ BitVec 32) Int) ListLongMap!7421)

(assert (=> b!466337 (= lt!210661 (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466337 (= lt!210659 (getCurrentListMapNoExtraKeys!1910 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!278778 () Bool)

(assert (=> start!41772 (=> (not res!278778) (not e!272673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41772 (= res!278778 (validMask!0 mask!1365))))

(assert (=> start!41772 e!272673))

(assert (=> start!41772 tp_is_empty!12835))

(assert (=> start!41772 tp!40227))

(assert (=> start!41772 true))

(declare-fun array_inv!10300 (array!29445) Bool)

(assert (=> start!41772 (array_inv!10300 _keys!1025)))

(declare-fun array_inv!10301 (array!29447) Bool)

(assert (=> start!41772 (and (array_inv!10301 _values!833) e!272672)))

(declare-fun mapIsEmpty!20938 () Bool)

(assert (=> mapIsEmpty!20938 mapRes!20938))

(declare-fun mapNonEmpty!20938 () Bool)

(declare-fun tp!40228 () Bool)

(assert (=> mapNonEmpty!20938 (= mapRes!20938 (and tp!40228 e!272674))))

(declare-fun mapKey!20938 () (_ BitVec 32))

(declare-fun mapValue!20938 () ValueCell!6074)

(declare-fun mapRest!20938 () (Array (_ BitVec 32) ValueCell!6074))

(assert (=> mapNonEmpty!20938 (= (arr!14152 _values!833) (store mapRest!20938 mapKey!20938 mapValue!20938))))

(declare-fun b!466338 () Bool)

(declare-fun res!278779 () Bool)

(assert (=> b!466338 (=> (not res!278779) (not e!272673))))

(declare-datatypes ((List!8601 0))(
  ( (Nil!8598) (Cons!8597 (h!9453 (_ BitVec 64)) (t!14544 List!8601)) )
))
(declare-fun arrayNoDuplicates!0 (array!29445 (_ BitVec 32) List!8601) Bool)

(assert (=> b!466338 (= res!278779 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8598))))

(assert (= (and start!41772 res!278778) b!466331))

(assert (= (and b!466331 res!278776) b!466333))

(assert (= (and b!466333 res!278780) b!466338))

(assert (= (and b!466338 res!278779) b!466337))

(assert (= (and b!466337 (not res!278777)) b!466335))

(assert (= (and b!466336 condMapEmpty!20938) mapIsEmpty!20938))

(assert (= (and b!466336 (not condMapEmpty!20938)) mapNonEmpty!20938))

(get-info :version)

(assert (= (and mapNonEmpty!20938 ((_ is ValueCellFull!6074) mapValue!20938)) b!466332))

(assert (= (and b!466336 ((_ is ValueCellFull!6074) mapDefault!20938)) b!466334))

(assert (= start!41772 b!466336))

(declare-fun m!448085 () Bool)

(assert (=> b!466338 m!448085))

(declare-fun m!448087 () Bool)

(assert (=> b!466335 m!448087))

(declare-fun m!448089 () Bool)

(assert (=> b!466335 m!448089))

(assert (=> b!466335 m!448089))

(declare-fun m!448091 () Bool)

(assert (=> b!466335 m!448091))

(declare-fun m!448093 () Bool)

(assert (=> b!466337 m!448093))

(declare-fun m!448095 () Bool)

(assert (=> b!466337 m!448095))

(declare-fun m!448097 () Bool)

(assert (=> b!466337 m!448097))

(declare-fun m!448099 () Bool)

(assert (=> start!41772 m!448099))

(declare-fun m!448101 () Bool)

(assert (=> start!41772 m!448101))

(declare-fun m!448103 () Bool)

(assert (=> start!41772 m!448103))

(declare-fun m!448105 () Bool)

(assert (=> mapNonEmpty!20938 m!448105))

(declare-fun m!448107 () Bool)

(assert (=> b!466333 m!448107))

(check-sat b_and!19749 (not b!466333) (not b!466337) (not start!41772) (not b_next!11407) (not b!466338) tp_is_empty!12835 (not b!466335) (not mapNonEmpty!20938))
(check-sat b_and!19749 (not b_next!11407))
