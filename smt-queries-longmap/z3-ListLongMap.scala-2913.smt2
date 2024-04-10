; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41636 () Bool)

(assert start!41636)

(declare-fun b_free!11289 () Bool)

(declare-fun b_next!11289 () Bool)

(assert (=> start!41636 (= b_free!11289 (not b_next!11289))))

(declare-fun tp!39868 () Bool)

(declare-fun b_and!19637 () Bool)

(assert (=> start!41636 (= tp!39868 b_and!19637)))

(declare-fun b!464966 () Bool)

(declare-fun res!277958 () Bool)

(declare-fun e!271670 () Bool)

(assert (=> b!464966 (=> (not res!277958) (not e!271670))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29219 0))(
  ( (array!29220 (arr!14040 (Array (_ BitVec 32) (_ BitVec 64))) (size!14392 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29219)

(declare-datatypes ((V!18061 0))(
  ( (V!18062 (val!6403 Int)) )
))
(declare-datatypes ((ValueCell!6015 0))(
  ( (ValueCellFull!6015 (v!8690 V!18061)) (EmptyCell!6015) )
))
(declare-datatypes ((array!29221 0))(
  ( (array!29222 (arr!14041 (Array (_ BitVec 32) ValueCell!6015)) (size!14393 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29221)

(assert (=> b!464966 (= res!277958 (and (= (size!14393 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14392 _keys!1025) (size!14393 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464967 () Bool)

(declare-fun res!277957 () Bool)

(assert (=> b!464967 (=> (not res!277957) (not e!271670))))

(declare-datatypes ((List!8481 0))(
  ( (Nil!8478) (Cons!8477 (h!9333 (_ BitVec 64)) (t!14429 List!8481)) )
))
(declare-fun arrayNoDuplicates!0 (array!29219 (_ BitVec 32) List!8481) Bool)

(assert (=> b!464967 (= res!277957 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8478))))

(declare-fun mapIsEmpty!20755 () Bool)

(declare-fun mapRes!20755 () Bool)

(assert (=> mapIsEmpty!20755 mapRes!20755))

(declare-fun b!464968 () Bool)

(declare-fun res!277959 () Bool)

(assert (=> b!464968 (=> (not res!277959) (not e!271670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29219 (_ BitVec 32)) Bool)

(assert (=> b!464968 (= res!277959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277956 () Bool)

(assert (=> start!41636 (=> (not res!277956) (not e!271670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41636 (= res!277956 (validMask!0 mask!1365))))

(assert (=> start!41636 e!271670))

(declare-fun tp_is_empty!12717 () Bool)

(assert (=> start!41636 tp_is_empty!12717))

(assert (=> start!41636 tp!39868))

(assert (=> start!41636 true))

(declare-fun array_inv!10142 (array!29219) Bool)

(assert (=> start!41636 (array_inv!10142 _keys!1025)))

(declare-fun e!271668 () Bool)

(declare-fun array_inv!10143 (array!29221) Bool)

(assert (=> start!41636 (and (array_inv!10143 _values!833) e!271668)))

(declare-fun b!464969 () Bool)

(assert (=> b!464969 (= e!271670 (not true))))

(declare-datatypes ((tuple2!8390 0))(
  ( (tuple2!8391 (_1!4206 (_ BitVec 64)) (_2!4206 V!18061)) )
))
(declare-datatypes ((List!8482 0))(
  ( (Nil!8479) (Cons!8478 (h!9334 tuple2!8390) (t!14430 List!8482)) )
))
(declare-datatypes ((ListLongMap!7303 0))(
  ( (ListLongMap!7304 (toList!3667 List!8482)) )
))
(declare-fun lt!209944 () ListLongMap!7303)

(declare-fun lt!209946 () ListLongMap!7303)

(assert (=> b!464969 (= lt!209944 lt!209946)))

(declare-fun minValueBefore!38 () V!18061)

(declare-fun zeroValue!794 () V!18061)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13502 0))(
  ( (Unit!13503) )
))
(declare-fun lt!209945 () Unit!13502)

(declare-fun minValueAfter!38 () V!18061)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!27 (array!29219 array!29221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18061 V!18061 V!18061 V!18061 (_ BitVec 32) Int) Unit!13502)

(assert (=> b!464969 (= lt!209945 (lemmaNoChangeToArrayThenSameMapNoExtras!27 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1847 (array!29219 array!29221 (_ BitVec 32) (_ BitVec 32) V!18061 V!18061 (_ BitVec 32) Int) ListLongMap!7303)

(assert (=> b!464969 (= lt!209946 (getCurrentListMapNoExtraKeys!1847 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464969 (= lt!209944 (getCurrentListMapNoExtraKeys!1847 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464970 () Bool)

(declare-fun e!271669 () Bool)

(assert (=> b!464970 (= e!271669 tp_is_empty!12717)))

(declare-fun b!464971 () Bool)

(assert (=> b!464971 (= e!271668 (and e!271669 mapRes!20755))))

(declare-fun condMapEmpty!20755 () Bool)

(declare-fun mapDefault!20755 () ValueCell!6015)

(assert (=> b!464971 (= condMapEmpty!20755 (= (arr!14041 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6015)) mapDefault!20755)))))

(declare-fun b!464972 () Bool)

(declare-fun e!271671 () Bool)

(assert (=> b!464972 (= e!271671 tp_is_empty!12717)))

(declare-fun mapNonEmpty!20755 () Bool)

(declare-fun tp!39867 () Bool)

(assert (=> mapNonEmpty!20755 (= mapRes!20755 (and tp!39867 e!271671))))

(declare-fun mapValue!20755 () ValueCell!6015)

(declare-fun mapRest!20755 () (Array (_ BitVec 32) ValueCell!6015))

(declare-fun mapKey!20755 () (_ BitVec 32))

(assert (=> mapNonEmpty!20755 (= (arr!14041 _values!833) (store mapRest!20755 mapKey!20755 mapValue!20755))))

(assert (= (and start!41636 res!277956) b!464966))

(assert (= (and b!464966 res!277958) b!464968))

(assert (= (and b!464968 res!277959) b!464967))

(assert (= (and b!464967 res!277957) b!464969))

(assert (= (and b!464971 condMapEmpty!20755) mapIsEmpty!20755))

(assert (= (and b!464971 (not condMapEmpty!20755)) mapNonEmpty!20755))

(get-info :version)

(assert (= (and mapNonEmpty!20755 ((_ is ValueCellFull!6015) mapValue!20755)) b!464972))

(assert (= (and b!464971 ((_ is ValueCellFull!6015) mapDefault!20755)) b!464970))

(assert (= start!41636 b!464971))

(declare-fun m!447269 () Bool)

(assert (=> b!464967 m!447269))

(declare-fun m!447271 () Bool)

(assert (=> b!464968 m!447271))

(declare-fun m!447273 () Bool)

(assert (=> mapNonEmpty!20755 m!447273))

(declare-fun m!447275 () Bool)

(assert (=> b!464969 m!447275))

(declare-fun m!447277 () Bool)

(assert (=> b!464969 m!447277))

(declare-fun m!447279 () Bool)

(assert (=> b!464969 m!447279))

(declare-fun m!447281 () Bool)

(assert (=> start!41636 m!447281))

(declare-fun m!447283 () Bool)

(assert (=> start!41636 m!447283))

(declare-fun m!447285 () Bool)

(assert (=> start!41636 m!447285))

(check-sat b_and!19637 (not b!464969) tp_is_empty!12717 (not b!464968) (not start!41636) (not mapNonEmpty!20755) (not b_next!11289) (not b!464967))
(check-sat b_and!19637 (not b_next!11289))
