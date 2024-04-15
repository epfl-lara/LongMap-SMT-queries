; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41778 () Bool)

(assert start!41778)

(declare-fun b_free!11413 () Bool)

(declare-fun b_next!11413 () Bool)

(assert (=> start!41778 (= b_free!11413 (not b_next!11413))))

(declare-fun tp!40246 () Bool)

(declare-fun b_and!19755 () Bool)

(assert (=> start!41778 (= tp!40246 b_and!19755)))

(declare-fun b!466403 () Bool)

(declare-fun e!272727 () Bool)

(declare-fun e!272729 () Bool)

(assert (=> b!466403 (= e!272727 (not e!272729))))

(declare-fun res!278825 () Bool)

(assert (=> b!466403 (=> res!278825 e!272729)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466403 (= res!278825 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!18227 0))(
  ( (V!18228 (val!6465 Int)) )
))
(declare-datatypes ((tuple2!8524 0))(
  ( (tuple2!8525 (_1!4273 (_ BitVec 64)) (_2!4273 V!18227)) )
))
(declare-datatypes ((List!8605 0))(
  ( (Nil!8602) (Cons!8601 (h!9457 tuple2!8524) (t!14548 List!8605)) )
))
(declare-datatypes ((ListLongMap!7427 0))(
  ( (ListLongMap!7428 (toList!3729 List!8605)) )
))
(declare-fun lt!210706 () ListLongMap!7427)

(declare-fun lt!210704 () ListLongMap!7427)

(assert (=> b!466403 (= lt!210706 lt!210704)))

(declare-fun minValueBefore!38 () V!18227)

(declare-fun zeroValue!794 () V!18227)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13560 0))(
  ( (Unit!13561) )
))
(declare-fun lt!210708 () Unit!13560)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29457 0))(
  ( (array!29458 (arr!14157 (Array (_ BitVec 32) (_ BitVec 64))) (size!14510 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29457)

(declare-datatypes ((ValueCell!6077 0))(
  ( (ValueCellFull!6077 (v!8747 V!18227)) (EmptyCell!6077) )
))
(declare-datatypes ((array!29459 0))(
  ( (array!29460 (arr!14158 (Array (_ BitVec 32) ValueCell!6077)) (size!14511 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29459)

(declare-fun minValueAfter!38 () V!18227)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!70 (array!29457 array!29459 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18227 V!18227 V!18227 V!18227 (_ BitVec 32) Int) Unit!13560)

(assert (=> b!466403 (= lt!210708 (lemmaNoChangeToArrayThenSameMapNoExtras!70 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1913 (array!29457 array!29459 (_ BitVec 32) (_ BitVec 32) V!18227 V!18227 (_ BitVec 32) Int) ListLongMap!7427)

(assert (=> b!466403 (= lt!210704 (getCurrentListMapNoExtraKeys!1913 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466403 (= lt!210706 (getCurrentListMapNoExtraKeys!1913 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466404 () Bool)

(declare-fun e!272726 () Bool)

(declare-fun e!272731 () Bool)

(declare-fun mapRes!20947 () Bool)

(assert (=> b!466404 (= e!272726 (and e!272731 mapRes!20947))))

(declare-fun condMapEmpty!20947 () Bool)

(declare-fun mapDefault!20947 () ValueCell!6077)

(assert (=> b!466404 (= condMapEmpty!20947 (= (arr!14158 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6077)) mapDefault!20947)))))

(declare-fun b!466405 () Bool)

(assert (=> b!466405 (= e!272729 true)))

(declare-fun lt!210707 () ListLongMap!7427)

(declare-fun getCurrentListMap!2119 (array!29457 array!29459 (_ BitVec 32) (_ BitVec 32) V!18227 V!18227 (_ BitVec 32) Int) ListLongMap!7427)

(assert (=> b!466405 (= lt!210707 (getCurrentListMap!2119 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210705 () ListLongMap!7427)

(declare-fun +!1700 (ListLongMap!7427 tuple2!8524) ListLongMap!7427)

(assert (=> b!466405 (= lt!210705 (+!1700 (getCurrentListMap!2119 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8525 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun res!278824 () Bool)

(assert (=> start!41778 (=> (not res!278824) (not e!272727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41778 (= res!278824 (validMask!0 mask!1365))))

(assert (=> start!41778 e!272727))

(declare-fun tp_is_empty!12841 () Bool)

(assert (=> start!41778 tp_is_empty!12841))

(assert (=> start!41778 tp!40246))

(assert (=> start!41778 true))

(declare-fun array_inv!10306 (array!29457) Bool)

(assert (=> start!41778 (array_inv!10306 _keys!1025)))

(declare-fun array_inv!10307 (array!29459) Bool)

(assert (=> start!41778 (and (array_inv!10307 _values!833) e!272726)))

(declare-fun b!466406 () Bool)

(declare-fun e!272728 () Bool)

(assert (=> b!466406 (= e!272728 tp_is_empty!12841)))

(declare-fun b!466407 () Bool)

(declare-fun res!278821 () Bool)

(assert (=> b!466407 (=> (not res!278821) (not e!272727))))

(assert (=> b!466407 (= res!278821 (and (= (size!14511 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14510 _keys!1025) (size!14511 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20947 () Bool)

(declare-fun tp!40245 () Bool)

(assert (=> mapNonEmpty!20947 (= mapRes!20947 (and tp!40245 e!272728))))

(declare-fun mapRest!20947 () (Array (_ BitVec 32) ValueCell!6077))

(declare-fun mapValue!20947 () ValueCell!6077)

(declare-fun mapKey!20947 () (_ BitVec 32))

(assert (=> mapNonEmpty!20947 (= (arr!14158 _values!833) (store mapRest!20947 mapKey!20947 mapValue!20947))))

(declare-fun b!466408 () Bool)

(assert (=> b!466408 (= e!272731 tp_is_empty!12841)))

(declare-fun b!466409 () Bool)

(declare-fun res!278822 () Bool)

(assert (=> b!466409 (=> (not res!278822) (not e!272727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29457 (_ BitVec 32)) Bool)

(assert (=> b!466409 (= res!278822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466410 () Bool)

(declare-fun res!278823 () Bool)

(assert (=> b!466410 (=> (not res!278823) (not e!272727))))

(declare-datatypes ((List!8606 0))(
  ( (Nil!8603) (Cons!8602 (h!9458 (_ BitVec 64)) (t!14549 List!8606)) )
))
(declare-fun arrayNoDuplicates!0 (array!29457 (_ BitVec 32) List!8606) Bool)

(assert (=> b!466410 (= res!278823 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8603))))

(declare-fun mapIsEmpty!20947 () Bool)

(assert (=> mapIsEmpty!20947 mapRes!20947))

(assert (= (and start!41778 res!278824) b!466407))

(assert (= (and b!466407 res!278821) b!466409))

(assert (= (and b!466409 res!278822) b!466410))

(assert (= (and b!466410 res!278823) b!466403))

(assert (= (and b!466403 (not res!278825)) b!466405))

(assert (= (and b!466404 condMapEmpty!20947) mapIsEmpty!20947))

(assert (= (and b!466404 (not condMapEmpty!20947)) mapNonEmpty!20947))

(get-info :version)

(assert (= (and mapNonEmpty!20947 ((_ is ValueCellFull!6077) mapValue!20947)) b!466406))

(assert (= (and b!466404 ((_ is ValueCellFull!6077) mapDefault!20947)) b!466408))

(assert (= start!41778 b!466404))

(declare-fun m!448157 () Bool)

(assert (=> b!466403 m!448157))

(declare-fun m!448159 () Bool)

(assert (=> b!466403 m!448159))

(declare-fun m!448161 () Bool)

(assert (=> b!466403 m!448161))

(declare-fun m!448163 () Bool)

(assert (=> mapNonEmpty!20947 m!448163))

(declare-fun m!448165 () Bool)

(assert (=> start!41778 m!448165))

(declare-fun m!448167 () Bool)

(assert (=> start!41778 m!448167))

(declare-fun m!448169 () Bool)

(assert (=> start!41778 m!448169))

(declare-fun m!448171 () Bool)

(assert (=> b!466405 m!448171))

(declare-fun m!448173 () Bool)

(assert (=> b!466405 m!448173))

(assert (=> b!466405 m!448173))

(declare-fun m!448175 () Bool)

(assert (=> b!466405 m!448175))

(declare-fun m!448177 () Bool)

(assert (=> b!466410 m!448177))

(declare-fun m!448179 () Bool)

(assert (=> b!466409 m!448179))

(check-sat (not b_next!11413) (not b!466403) (not b!466410) (not mapNonEmpty!20947) tp_is_empty!12841 (not b!466409) b_and!19755 (not start!41778) (not b!466405))
(check-sat b_and!19755 (not b_next!11413))
