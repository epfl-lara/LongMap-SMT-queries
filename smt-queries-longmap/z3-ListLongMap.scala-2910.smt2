; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41602 () Bool)

(assert start!41602)

(declare-fun b_free!11269 () Bool)

(declare-fun b_next!11269 () Bool)

(assert (=> start!41602 (= b_free!11269 (not b_next!11269))))

(declare-fun tp!39807 () Bool)

(declare-fun b_and!19627 () Bool)

(assert (=> start!41602 (= tp!39807 b_and!19627)))

(declare-fun b!464695 () Bool)

(declare-fun e!271481 () Bool)

(declare-fun tp_is_empty!12697 () Bool)

(assert (=> b!464695 (= e!271481 tp_is_empty!12697)))

(declare-fun b!464696 () Bool)

(declare-fun e!271479 () Bool)

(assert (=> b!464696 (= e!271479 (not true))))

(declare-datatypes ((V!18035 0))(
  ( (V!18036 (val!6393 Int)) )
))
(declare-datatypes ((tuple2!8312 0))(
  ( (tuple2!8313 (_1!4167 (_ BitVec 64)) (_2!4167 V!18035)) )
))
(declare-datatypes ((List!8398 0))(
  ( (Nil!8395) (Cons!8394 (h!9250 tuple2!8312) (t!14338 List!8398)) )
))
(declare-datatypes ((ListLongMap!7227 0))(
  ( (ListLongMap!7228 (toList!3629 List!8398)) )
))
(declare-fun lt!209866 () ListLongMap!7227)

(declare-fun lt!209867 () ListLongMap!7227)

(assert (=> b!464696 (= lt!209866 lt!209867)))

(declare-fun minValueBefore!38 () V!18035)

(declare-datatypes ((Unit!13476 0))(
  ( (Unit!13477) )
))
(declare-fun lt!209868 () Unit!13476)

(declare-fun zeroValue!794 () V!18035)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29178 0))(
  ( (array!29179 (arr!14019 (Array (_ BitVec 32) (_ BitVec 64))) (size!14371 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29178)

(declare-datatypes ((ValueCell!6005 0))(
  ( (ValueCellFull!6005 (v!8681 V!18035)) (EmptyCell!6005) )
))
(declare-datatypes ((array!29180 0))(
  ( (array!29181 (arr!14020 (Array (_ BitVec 32) ValueCell!6005)) (size!14372 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29180)

(declare-fun minValueAfter!38 () V!18035)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!16 (array!29178 array!29180 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18035 V!18035 V!18035 V!18035 (_ BitVec 32) Int) Unit!13476)

(assert (=> b!464696 (= lt!209868 (lemmaNoChangeToArrayThenSameMapNoExtras!16 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1856 (array!29178 array!29180 (_ BitVec 32) (_ BitVec 32) V!18035 V!18035 (_ BitVec 32) Int) ListLongMap!7227)

(assert (=> b!464696 (= lt!209867 (getCurrentListMapNoExtraKeys!1856 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464696 (= lt!209866 (getCurrentListMapNoExtraKeys!1856 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464697 () Bool)

(declare-fun res!277831 () Bool)

(assert (=> b!464697 (=> (not res!277831) (not e!271479))))

(declare-datatypes ((List!8399 0))(
  ( (Nil!8396) (Cons!8395 (h!9251 (_ BitVec 64)) (t!14339 List!8399)) )
))
(declare-fun arrayNoDuplicates!0 (array!29178 (_ BitVec 32) List!8399) Bool)

(assert (=> b!464697 (= res!277831 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8396))))

(declare-fun b!464698 () Bool)

(declare-fun res!277832 () Bool)

(assert (=> b!464698 (=> (not res!277832) (not e!271479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29178 (_ BitVec 32)) Bool)

(assert (=> b!464698 (= res!277832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277830 () Bool)

(assert (=> start!41602 (=> (not res!277830) (not e!271479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41602 (= res!277830 (validMask!0 mask!1365))))

(assert (=> start!41602 e!271479))

(assert (=> start!41602 tp_is_empty!12697))

(assert (=> start!41602 tp!39807))

(assert (=> start!41602 true))

(declare-fun array_inv!10206 (array!29178) Bool)

(assert (=> start!41602 (array_inv!10206 _keys!1025)))

(declare-fun e!271480 () Bool)

(declare-fun array_inv!10207 (array!29180) Bool)

(assert (=> start!41602 (and (array_inv!10207 _values!833) e!271480)))

(declare-fun mapNonEmpty!20725 () Bool)

(declare-fun mapRes!20725 () Bool)

(declare-fun tp!39808 () Bool)

(declare-fun e!271482 () Bool)

(assert (=> mapNonEmpty!20725 (= mapRes!20725 (and tp!39808 e!271482))))

(declare-fun mapRest!20725 () (Array (_ BitVec 32) ValueCell!6005))

(declare-fun mapValue!20725 () ValueCell!6005)

(declare-fun mapKey!20725 () (_ BitVec 32))

(assert (=> mapNonEmpty!20725 (= (arr!14020 _values!833) (store mapRest!20725 mapKey!20725 mapValue!20725))))

(declare-fun b!464699 () Bool)

(declare-fun res!277829 () Bool)

(assert (=> b!464699 (=> (not res!277829) (not e!271479))))

(assert (=> b!464699 (= res!277829 (and (= (size!14372 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14371 _keys!1025) (size!14372 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20725 () Bool)

(assert (=> mapIsEmpty!20725 mapRes!20725))

(declare-fun b!464700 () Bool)

(assert (=> b!464700 (= e!271480 (and e!271481 mapRes!20725))))

(declare-fun condMapEmpty!20725 () Bool)

(declare-fun mapDefault!20725 () ValueCell!6005)

(assert (=> b!464700 (= condMapEmpty!20725 (= (arr!14020 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6005)) mapDefault!20725)))))

(declare-fun b!464701 () Bool)

(assert (=> b!464701 (= e!271482 tp_is_empty!12697)))

(assert (= (and start!41602 res!277830) b!464699))

(assert (= (and b!464699 res!277829) b!464698))

(assert (= (and b!464698 res!277832) b!464697))

(assert (= (and b!464697 res!277831) b!464696))

(assert (= (and b!464700 condMapEmpty!20725) mapIsEmpty!20725))

(assert (= (and b!464700 (not condMapEmpty!20725)) mapNonEmpty!20725))

(get-info :version)

(assert (= (and mapNonEmpty!20725 ((_ is ValueCellFull!6005) mapValue!20725)) b!464701))

(assert (= (and b!464700 ((_ is ValueCellFull!6005) mapDefault!20725)) b!464695))

(assert (= start!41602 b!464700))

(declare-fun m!447271 () Bool)

(assert (=> b!464698 m!447271))

(declare-fun m!447273 () Bool)

(assert (=> mapNonEmpty!20725 m!447273))

(declare-fun m!447275 () Bool)

(assert (=> start!41602 m!447275))

(declare-fun m!447277 () Bool)

(assert (=> start!41602 m!447277))

(declare-fun m!447279 () Bool)

(assert (=> start!41602 m!447279))

(declare-fun m!447281 () Bool)

(assert (=> b!464697 m!447281))

(declare-fun m!447283 () Bool)

(assert (=> b!464696 m!447283))

(declare-fun m!447285 () Bool)

(assert (=> b!464696 m!447285))

(declare-fun m!447287 () Bool)

(assert (=> b!464696 m!447287))

(check-sat (not b!464697) (not mapNonEmpty!20725) (not start!41602) (not b_next!11269) (not b!464698) (not b!464696) b_and!19627 tp_is_empty!12697)
(check-sat b_and!19627 (not b_next!11269))
