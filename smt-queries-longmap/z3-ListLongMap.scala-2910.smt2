; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41602 () Bool)

(assert start!41602)

(declare-fun b_free!11269 () Bool)

(declare-fun b_next!11269 () Bool)

(assert (=> start!41602 (= b_free!11269 (not b_next!11269))))

(declare-fun tp!39807 () Bool)

(declare-fun b_and!19591 () Bool)

(assert (=> start!41602 (= tp!39807 b_and!19591)))

(declare-fun b!464485 () Bool)

(declare-fun e!271346 () Bool)

(declare-fun e!271344 () Bool)

(declare-fun mapRes!20725 () Bool)

(assert (=> b!464485 (= e!271346 (and e!271344 mapRes!20725))))

(declare-fun condMapEmpty!20725 () Bool)

(declare-datatypes ((V!18035 0))(
  ( (V!18036 (val!6393 Int)) )
))
(declare-datatypes ((ValueCell!6005 0))(
  ( (ValueCellFull!6005 (v!8674 V!18035)) (EmptyCell!6005) )
))
(declare-datatypes ((array!29179 0))(
  ( (array!29180 (arr!14020 (Array (_ BitVec 32) ValueCell!6005)) (size!14373 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29179)

(declare-fun mapDefault!20725 () ValueCell!6005)

(assert (=> b!464485 (= condMapEmpty!20725 (= (arr!14020 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6005)) mapDefault!20725)))))

(declare-fun b!464486 () Bool)

(declare-fun res!277708 () Bool)

(declare-fun e!271347 () Bool)

(assert (=> b!464486 (=> (not res!277708) (not e!271347))))

(declare-datatypes ((array!29181 0))(
  ( (array!29182 (arr!14021 (Array (_ BitVec 32) (_ BitVec 64))) (size!14374 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29181)

(declare-datatypes ((List!8497 0))(
  ( (Nil!8494) (Cons!8493 (h!9349 (_ BitVec 64)) (t!14436 List!8497)) )
))
(declare-fun arrayNoDuplicates!0 (array!29181 (_ BitVec 32) List!8497) Bool)

(assert (=> b!464486 (= res!277708 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8494))))

(declare-fun b!464487 () Bool)

(declare-fun tp_is_empty!12697 () Bool)

(assert (=> b!464487 (= e!271344 tp_is_empty!12697)))

(declare-fun b!464488 () Bool)

(declare-fun res!277707 () Bool)

(assert (=> b!464488 (=> (not res!277707) (not e!271347))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29181 (_ BitVec 32)) Bool)

(assert (=> b!464488 (= res!277707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277710 () Bool)

(assert (=> start!41602 (=> (not res!277710) (not e!271347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41602 (= res!277710 (validMask!0 mask!1365))))

(assert (=> start!41602 e!271347))

(assert (=> start!41602 tp_is_empty!12697))

(assert (=> start!41602 tp!39807))

(assert (=> start!41602 true))

(declare-fun array_inv!10206 (array!29181) Bool)

(assert (=> start!41602 (array_inv!10206 _keys!1025)))

(declare-fun array_inv!10207 (array!29179) Bool)

(assert (=> start!41602 (and (array_inv!10207 _values!833) e!271346)))

(declare-fun mapNonEmpty!20725 () Bool)

(declare-fun tp!39808 () Bool)

(declare-fun e!271348 () Bool)

(assert (=> mapNonEmpty!20725 (= mapRes!20725 (and tp!39808 e!271348))))

(declare-fun mapKey!20725 () (_ BitVec 32))

(declare-fun mapRest!20725 () (Array (_ BitVec 32) ValueCell!6005))

(declare-fun mapValue!20725 () ValueCell!6005)

(assert (=> mapNonEmpty!20725 (= (arr!14020 _values!833) (store mapRest!20725 mapKey!20725 mapValue!20725))))

(declare-fun b!464489 () Bool)

(assert (=> b!464489 (= e!271348 tp_is_empty!12697)))

(declare-fun mapIsEmpty!20725 () Bool)

(assert (=> mapIsEmpty!20725 mapRes!20725))

(declare-fun b!464490 () Bool)

(declare-fun res!277709 () Bool)

(assert (=> b!464490 (=> (not res!277709) (not e!271347))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464490 (= res!277709 (and (= (size!14373 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14374 _keys!1025) (size!14373 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464491 () Bool)

(assert (=> b!464491 (= e!271347 (not true))))

(declare-datatypes ((tuple2!8410 0))(
  ( (tuple2!8411 (_1!4216 (_ BitVec 64)) (_2!4216 V!18035)) )
))
(declare-datatypes ((List!8498 0))(
  ( (Nil!8495) (Cons!8494 (h!9350 tuple2!8410) (t!14437 List!8498)) )
))
(declare-datatypes ((ListLongMap!7313 0))(
  ( (ListLongMap!7314 (toList!3672 List!8498)) )
))
(declare-fun lt!209622 () ListLongMap!7313)

(declare-fun lt!209621 () ListLongMap!7313)

(assert (=> b!464491 (= lt!209622 lt!209621)))

(declare-datatypes ((Unit!13460 0))(
  ( (Unit!13461) )
))
(declare-fun lt!209620 () Unit!13460)

(declare-fun minValueBefore!38 () V!18035)

(declare-fun zeroValue!794 () V!18035)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18035)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!21 (array!29181 array!29179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18035 V!18035 V!18035 V!18035 (_ BitVec 32) Int) Unit!13460)

(assert (=> b!464491 (= lt!209620 (lemmaNoChangeToArrayThenSameMapNoExtras!21 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1864 (array!29181 array!29179 (_ BitVec 32) (_ BitVec 32) V!18035 V!18035 (_ BitVec 32) Int) ListLongMap!7313)

(assert (=> b!464491 (= lt!209621 (getCurrentListMapNoExtraKeys!1864 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464491 (= lt!209622 (getCurrentListMapNoExtraKeys!1864 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41602 res!277710) b!464490))

(assert (= (and b!464490 res!277709) b!464488))

(assert (= (and b!464488 res!277707) b!464486))

(assert (= (and b!464486 res!277708) b!464491))

(assert (= (and b!464485 condMapEmpty!20725) mapIsEmpty!20725))

(assert (= (and b!464485 (not condMapEmpty!20725)) mapNonEmpty!20725))

(get-info :version)

(assert (= (and mapNonEmpty!20725 ((_ is ValueCellFull!6005) mapValue!20725)) b!464489))

(assert (= (and b!464485 ((_ is ValueCellFull!6005) mapDefault!20725)) b!464487))

(assert (= start!41602 b!464485))

(declare-fun m!446355 () Bool)

(assert (=> mapNonEmpty!20725 m!446355))

(declare-fun m!446357 () Bool)

(assert (=> b!464491 m!446357))

(declare-fun m!446359 () Bool)

(assert (=> b!464491 m!446359))

(declare-fun m!446361 () Bool)

(assert (=> b!464491 m!446361))

(declare-fun m!446363 () Bool)

(assert (=> b!464486 m!446363))

(declare-fun m!446365 () Bool)

(assert (=> start!41602 m!446365))

(declare-fun m!446367 () Bool)

(assert (=> start!41602 m!446367))

(declare-fun m!446369 () Bool)

(assert (=> start!41602 m!446369))

(declare-fun m!446371 () Bool)

(assert (=> b!464488 m!446371))

(check-sat tp_is_empty!12697 (not b!464488) (not mapNonEmpty!20725) (not b_next!11269) (not start!41602) (not b!464491) b_and!19591 (not b!464486))
(check-sat b_and!19591 (not b_next!11269))
