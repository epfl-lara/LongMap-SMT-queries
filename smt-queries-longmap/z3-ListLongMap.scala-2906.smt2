; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41564 () Bool)

(assert start!41564)

(declare-fun b_free!11245 () Bool)

(declare-fun b_next!11245 () Bool)

(assert (=> start!41564 (= b_free!11245 (not b_next!11245))))

(declare-fun tp!39733 () Bool)

(declare-fun b_and!19595 () Bool)

(assert (=> start!41564 (= tp!39733 b_and!19595)))

(declare-fun b!464358 () Bool)

(declare-fun res!277654 () Bool)

(declare-fun e!271244 () Bool)

(assert (=> b!464358 (=> (not res!277654) (not e!271244))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29130 0))(
  ( (array!29131 (arr!13996 (Array (_ BitVec 32) (_ BitVec 64))) (size!14348 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29130)

(declare-datatypes ((V!18003 0))(
  ( (V!18004 (val!6381 Int)) )
))
(declare-datatypes ((ValueCell!5993 0))(
  ( (ValueCellFull!5993 (v!8669 V!18003)) (EmptyCell!5993) )
))
(declare-datatypes ((array!29132 0))(
  ( (array!29133 (arr!13997 (Array (_ BitVec 32) ValueCell!5993)) (size!14349 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29132)

(declare-fun mask!1365 () (_ BitVec 32))

(assert (=> b!464358 (= res!277654 (and (= (size!14349 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14348 _keys!1025) (size!14349 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464359 () Bool)

(declare-fun res!277655 () Bool)

(assert (=> b!464359 (=> (not res!277655) (not e!271244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29130 (_ BitVec 32)) Bool)

(assert (=> b!464359 (= res!277655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464360 () Bool)

(declare-fun e!271246 () Bool)

(declare-fun tp_is_empty!12673 () Bool)

(assert (=> b!464360 (= e!271246 tp_is_empty!12673)))

(declare-fun b!464361 () Bool)

(declare-fun e!271248 () Bool)

(assert (=> b!464361 (= e!271248 tp_is_empty!12673)))

(declare-fun mapIsEmpty!20686 () Bool)

(declare-fun mapRes!20686 () Bool)

(assert (=> mapIsEmpty!20686 mapRes!20686))

(declare-fun b!464362 () Bool)

(declare-fun res!277656 () Bool)

(assert (=> b!464362 (=> (not res!277656) (not e!271244))))

(declare-datatypes ((List!8382 0))(
  ( (Nil!8379) (Cons!8378 (h!9234 (_ BitVec 64)) (t!14320 List!8382)) )
))
(declare-fun arrayNoDuplicates!0 (array!29130 (_ BitVec 32) List!8382) Bool)

(assert (=> b!464362 (= res!277656 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8379))))

(declare-fun b!464363 () Bool)

(assert (=> b!464363 (= e!271244 (not true))))

(declare-datatypes ((tuple2!8298 0))(
  ( (tuple2!8299 (_1!4160 (_ BitVec 64)) (_2!4160 V!18003)) )
))
(declare-datatypes ((List!8383 0))(
  ( (Nil!8380) (Cons!8379 (h!9235 tuple2!8298) (t!14321 List!8383)) )
))
(declare-datatypes ((ListLongMap!7213 0))(
  ( (ListLongMap!7214 (toList!3622 List!8383)) )
))
(declare-fun lt!209720 () ListLongMap!7213)

(declare-fun lt!209719 () ListLongMap!7213)

(assert (=> b!464363 (= lt!209720 lt!209719)))

(declare-fun minValueBefore!38 () V!18003)

(declare-fun zeroValue!794 () V!18003)

(declare-datatypes ((Unit!13462 0))(
  ( (Unit!13463) )
))
(declare-fun lt!209718 () Unit!13462)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18003)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!9 (array!29130 array!29132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18003 V!18003 V!18003 V!18003 (_ BitVec 32) Int) Unit!13462)

(assert (=> b!464363 (= lt!209718 (lemmaNoChangeToArrayThenSameMapNoExtras!9 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1849 (array!29130 array!29132 (_ BitVec 32) (_ BitVec 32) V!18003 V!18003 (_ BitVec 32) Int) ListLongMap!7213)

(assert (=> b!464363 (= lt!209719 (getCurrentListMapNoExtraKeys!1849 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464363 (= lt!209720 (getCurrentListMapNoExtraKeys!1849 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20686 () Bool)

(declare-fun tp!39732 () Bool)

(assert (=> mapNonEmpty!20686 (= mapRes!20686 (and tp!39732 e!271248))))

(declare-fun mapValue!20686 () ValueCell!5993)

(declare-fun mapRest!20686 () (Array (_ BitVec 32) ValueCell!5993))

(declare-fun mapKey!20686 () (_ BitVec 32))

(assert (=> mapNonEmpty!20686 (= (arr!13997 _values!833) (store mapRest!20686 mapKey!20686 mapValue!20686))))

(declare-fun res!277657 () Bool)

(assert (=> start!41564 (=> (not res!277657) (not e!271244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41564 (= res!277657 (validMask!0 mask!1365))))

(assert (=> start!41564 e!271244))

(assert (=> start!41564 tp_is_empty!12673))

(assert (=> start!41564 tp!39733))

(assert (=> start!41564 true))

(declare-fun array_inv!10192 (array!29130) Bool)

(assert (=> start!41564 (array_inv!10192 _keys!1025)))

(declare-fun e!271245 () Bool)

(declare-fun array_inv!10193 (array!29132) Bool)

(assert (=> start!41564 (and (array_inv!10193 _values!833) e!271245)))

(declare-fun b!464364 () Bool)

(assert (=> b!464364 (= e!271245 (and e!271246 mapRes!20686))))

(declare-fun condMapEmpty!20686 () Bool)

(declare-fun mapDefault!20686 () ValueCell!5993)

(assert (=> b!464364 (= condMapEmpty!20686 (= (arr!13997 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5993)) mapDefault!20686)))))

(assert (= (and start!41564 res!277657) b!464358))

(assert (= (and b!464358 res!277654) b!464359))

(assert (= (and b!464359 res!277655) b!464362))

(assert (= (and b!464362 res!277656) b!464363))

(assert (= (and b!464364 condMapEmpty!20686) mapIsEmpty!20686))

(assert (= (and b!464364 (not condMapEmpty!20686)) mapNonEmpty!20686))

(get-info :version)

(assert (= (and mapNonEmpty!20686 ((_ is ValueCellFull!5993) mapValue!20686)) b!464361))

(assert (= (and b!464364 ((_ is ValueCellFull!5993) mapDefault!20686)) b!464360))

(assert (= start!41564 b!464364))

(declare-fun m!446989 () Bool)

(assert (=> b!464359 m!446989))

(declare-fun m!446991 () Bool)

(assert (=> b!464362 m!446991))

(declare-fun m!446993 () Bool)

(assert (=> mapNonEmpty!20686 m!446993))

(declare-fun m!446995 () Bool)

(assert (=> start!41564 m!446995))

(declare-fun m!446997 () Bool)

(assert (=> start!41564 m!446997))

(declare-fun m!446999 () Bool)

(assert (=> start!41564 m!446999))

(declare-fun m!447001 () Bool)

(assert (=> b!464363 m!447001))

(declare-fun m!447003 () Bool)

(assert (=> b!464363 m!447003))

(declare-fun m!447005 () Bool)

(assert (=> b!464363 m!447005))

(check-sat (not b_next!11245) (not mapNonEmpty!20686) tp_is_empty!12673 (not b!464359) (not b!464362) (not start!41564) b_and!19595 (not b!464363))
(check-sat b_and!19595 (not b_next!11245))
