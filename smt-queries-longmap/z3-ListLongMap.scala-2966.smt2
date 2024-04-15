; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42038 () Bool)

(assert start!42038)

(declare-fun b_free!11605 () Bool)

(declare-fun b_next!11605 () Bool)

(assert (=> start!42038 (= b_free!11605 (not b_next!11605))))

(declare-fun tp!40834 () Bool)

(declare-fun b_and!19989 () Bool)

(assert (=> start!42038 (= tp!40834 b_and!19989)))

(declare-fun b!469222 () Bool)

(declare-fun e!274748 () Bool)

(declare-fun tp_is_empty!13033 () Bool)

(assert (=> b!469222 (= e!274748 tp_is_empty!13033)))

(declare-fun mapIsEmpty!21247 () Bool)

(declare-fun mapRes!21247 () Bool)

(assert (=> mapIsEmpty!21247 mapRes!21247))

(declare-fun b!469223 () Bool)

(declare-fun res!280428 () Bool)

(declare-fun e!274745 () Bool)

(assert (=> b!469223 (=> (not res!280428) (not e!274745))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29823 0))(
  ( (array!29824 (arr!14336 (Array (_ BitVec 32) (_ BitVec 64))) (size!14689 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29823)

(declare-datatypes ((V!18483 0))(
  ( (V!18484 (val!6561 Int)) )
))
(declare-datatypes ((ValueCell!6173 0))(
  ( (ValueCellFull!6173 (v!8845 V!18483)) (EmptyCell!6173) )
))
(declare-datatypes ((array!29825 0))(
  ( (array!29826 (arr!14337 (Array (_ BitVec 32) ValueCell!6173)) (size!14690 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29825)

(assert (=> b!469223 (= res!280428 (and (= (size!14690 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14689 _keys!1025) (size!14690 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21247 () Bool)

(declare-fun tp!40833 () Bool)

(assert (=> mapNonEmpty!21247 (= mapRes!21247 (and tp!40833 e!274748))))

(declare-fun mapKey!21247 () (_ BitVec 32))

(declare-fun mapValue!21247 () ValueCell!6173)

(declare-fun mapRest!21247 () (Array (_ BitVec 32) ValueCell!6173))

(assert (=> mapNonEmpty!21247 (= (arr!14337 _values!833) (store mapRest!21247 mapKey!21247 mapValue!21247))))

(declare-fun b!469224 () Bool)

(declare-fun e!274746 () Bool)

(assert (=> b!469224 (= e!274746 tp_is_empty!13033)))

(declare-fun b!469226 () Bool)

(declare-fun e!274749 () Bool)

(assert (=> b!469226 (= e!274749 true)))

(declare-datatypes ((tuple2!8674 0))(
  ( (tuple2!8675 (_1!4348 (_ BitVec 64)) (_2!4348 V!18483)) )
))
(declare-datatypes ((List!8745 0))(
  ( (Nil!8742) (Cons!8741 (h!9597 tuple2!8674) (t!14696 List!8745)) )
))
(declare-datatypes ((ListLongMap!7577 0))(
  ( (ListLongMap!7578 (toList!3804 List!8745)) )
))
(declare-fun lt!212524 () ListLongMap!7577)

(declare-fun lt!212528 () tuple2!8674)

(declare-fun minValueBefore!38 () V!18483)

(declare-fun +!1731 (ListLongMap!7577 tuple2!8674) ListLongMap!7577)

(assert (=> b!469226 (= (+!1731 lt!212524 lt!212528) (+!1731 (+!1731 lt!212524 (tuple2!8675 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212528))))

(declare-fun minValueAfter!38 () V!18483)

(assert (=> b!469226 (= lt!212528 (tuple2!8675 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13707 0))(
  ( (Unit!13708) )
))
(declare-fun lt!212527 () Unit!13707)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!114 (ListLongMap!7577 (_ BitVec 64) V!18483 V!18483) Unit!13707)

(assert (=> b!469226 (= lt!212527 (addSameAsAddTwiceSameKeyDiffValues!114 lt!212524 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212526 () ListLongMap!7577)

(declare-fun zeroValue!794 () V!18483)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMap!2167 (array!29823 array!29825 (_ BitVec 32) (_ BitVec 32) V!18483 V!18483 (_ BitVec 32) Int) ListLongMap!7577)

(assert (=> b!469226 (= lt!212526 (getCurrentListMap!2167 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212522 () ListLongMap!7577)

(assert (=> b!469226 (= lt!212522 (getCurrentListMap!2167 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469227 () Bool)

(assert (=> b!469227 (= e!274745 (not e!274749))))

(declare-fun res!280431 () Bool)

(assert (=> b!469227 (=> res!280431 e!274749)))

(assert (=> b!469227 (= res!280431 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212525 () ListLongMap!7577)

(assert (=> b!469227 (= lt!212524 lt!212525)))

(declare-fun lt!212523 () Unit!13707)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!138 (array!29823 array!29825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18483 V!18483 V!18483 V!18483 (_ BitVec 32) Int) Unit!13707)

(assert (=> b!469227 (= lt!212523 (lemmaNoChangeToArrayThenSameMapNoExtras!138 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1981 (array!29823 array!29825 (_ BitVec 32) (_ BitVec 32) V!18483 V!18483 (_ BitVec 32) Int) ListLongMap!7577)

(assert (=> b!469227 (= lt!212525 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469227 (= lt!212524 (getCurrentListMapNoExtraKeys!1981 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!280430 () Bool)

(assert (=> start!42038 (=> (not res!280430) (not e!274745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42038 (= res!280430 (validMask!0 mask!1365))))

(assert (=> start!42038 e!274745))

(assert (=> start!42038 tp_is_empty!13033))

(assert (=> start!42038 tp!40834))

(assert (=> start!42038 true))

(declare-fun array_inv!10432 (array!29823) Bool)

(assert (=> start!42038 (array_inv!10432 _keys!1025)))

(declare-fun e!274744 () Bool)

(declare-fun array_inv!10433 (array!29825) Bool)

(assert (=> start!42038 (and (array_inv!10433 _values!833) e!274744)))

(declare-fun b!469225 () Bool)

(declare-fun res!280429 () Bool)

(assert (=> b!469225 (=> (not res!280429) (not e!274745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29823 (_ BitVec 32)) Bool)

(assert (=> b!469225 (= res!280429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469228 () Bool)

(declare-fun res!280432 () Bool)

(assert (=> b!469228 (=> (not res!280432) (not e!274745))))

(declare-datatypes ((List!8746 0))(
  ( (Nil!8743) (Cons!8742 (h!9598 (_ BitVec 64)) (t!14697 List!8746)) )
))
(declare-fun arrayNoDuplicates!0 (array!29823 (_ BitVec 32) List!8746) Bool)

(assert (=> b!469228 (= res!280432 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8743))))

(declare-fun b!469229 () Bool)

(assert (=> b!469229 (= e!274744 (and e!274746 mapRes!21247))))

(declare-fun condMapEmpty!21247 () Bool)

(declare-fun mapDefault!21247 () ValueCell!6173)

(assert (=> b!469229 (= condMapEmpty!21247 (= (arr!14337 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6173)) mapDefault!21247)))))

(assert (= (and start!42038 res!280430) b!469223))

(assert (= (and b!469223 res!280428) b!469225))

(assert (= (and b!469225 res!280429) b!469228))

(assert (= (and b!469228 res!280432) b!469227))

(assert (= (and b!469227 (not res!280431)) b!469226))

(assert (= (and b!469229 condMapEmpty!21247) mapIsEmpty!21247))

(assert (= (and b!469229 (not condMapEmpty!21247)) mapNonEmpty!21247))

(get-info :version)

(assert (= (and mapNonEmpty!21247 ((_ is ValueCellFull!6173) mapValue!21247)) b!469222))

(assert (= (and b!469229 ((_ is ValueCellFull!6173) mapDefault!21247)) b!469224))

(assert (= start!42038 b!469229))

(declare-fun m!450937 () Bool)

(assert (=> b!469225 m!450937))

(declare-fun m!450939 () Bool)

(assert (=> b!469226 m!450939))

(declare-fun m!450941 () Bool)

(assert (=> b!469226 m!450941))

(assert (=> b!469226 m!450939))

(declare-fun m!450943 () Bool)

(assert (=> b!469226 m!450943))

(declare-fun m!450945 () Bool)

(assert (=> b!469226 m!450945))

(declare-fun m!450947 () Bool)

(assert (=> b!469226 m!450947))

(declare-fun m!450949 () Bool)

(assert (=> b!469226 m!450949))

(declare-fun m!450951 () Bool)

(assert (=> b!469227 m!450951))

(declare-fun m!450953 () Bool)

(assert (=> b!469227 m!450953))

(declare-fun m!450955 () Bool)

(assert (=> b!469227 m!450955))

(declare-fun m!450957 () Bool)

(assert (=> b!469228 m!450957))

(declare-fun m!450959 () Bool)

(assert (=> start!42038 m!450959))

(declare-fun m!450961 () Bool)

(assert (=> start!42038 m!450961))

(declare-fun m!450963 () Bool)

(assert (=> start!42038 m!450963))

(declare-fun m!450965 () Bool)

(assert (=> mapNonEmpty!21247 m!450965))

(check-sat (not b!469227) tp_is_empty!13033 (not b!469226) (not b!469228) (not b!469225) b_and!19989 (not mapNonEmpty!21247) (not b_next!11605) (not start!42038))
(check-sat b_and!19989 (not b_next!11605))
