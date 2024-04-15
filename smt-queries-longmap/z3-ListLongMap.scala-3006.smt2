; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42340 () Bool)

(assert start!42340)

(declare-fun b_free!11845 () Bool)

(declare-fun b_next!11845 () Bool)

(assert (=> start!42340 (= b_free!11845 (not b_next!11845))))

(declare-fun tp!41565 () Bool)

(declare-fun b_and!20265 () Bool)

(assert (=> start!42340 (= tp!41565 b_and!20265)))

(declare-fun b!472293 () Bool)

(declare-fun e!276943 () Bool)

(declare-fun tp_is_empty!13273 () Bool)

(assert (=> b!472293 (= e!276943 tp_is_empty!13273)))

(declare-fun b!472294 () Bool)

(declare-fun e!276938 () Bool)

(declare-fun e!276940 () Bool)

(assert (=> b!472294 (= e!276938 (not e!276940))))

(declare-fun res!282158 () Bool)

(assert (=> b!472294 (=> res!282158 e!276940)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472294 (= res!282158 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18803 0))(
  ( (V!18804 (val!6681 Int)) )
))
(declare-datatypes ((tuple2!8842 0))(
  ( (tuple2!8843 (_1!4432 (_ BitVec 64)) (_2!4432 V!18803)) )
))
(declare-datatypes ((List!8912 0))(
  ( (Nil!8909) (Cons!8908 (h!9764 tuple2!8842) (t!14871 List!8912)) )
))
(declare-datatypes ((ListLongMap!7745 0))(
  ( (ListLongMap!7746 (toList!3888 List!8912)) )
))
(declare-fun lt!214174 () ListLongMap!7745)

(declare-fun lt!214173 () ListLongMap!7745)

(assert (=> b!472294 (= lt!214174 lt!214173)))

(declare-fun zeroValue!794 () V!18803)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!18803)

(declare-datatypes ((Unit!13871 0))(
  ( (Unit!13872) )
))
(declare-fun lt!214175 () Unit!13871)

(declare-datatypes ((array!30287 0))(
  ( (array!30288 (arr!14564 (Array (_ BitVec 32) (_ BitVec 64))) (size!14917 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30287)

(declare-datatypes ((ValueCell!6293 0))(
  ( (ValueCellFull!6293 (v!8966 V!18803)) (EmptyCell!6293) )
))
(declare-datatypes ((array!30289 0))(
  ( (array!30290 (arr!14565 (Array (_ BitVec 32) ValueCell!6293)) (size!14918 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30289)

(declare-fun minValueAfter!38 () V!18803)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!217 (array!30287 array!30289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18803 V!18803 V!18803 V!18803 (_ BitVec 32) Int) Unit!13871)

(assert (=> b!472294 (= lt!214175 (lemmaNoChangeToArrayThenSameMapNoExtras!217 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2060 (array!30287 array!30289 (_ BitVec 32) (_ BitVec 32) V!18803 V!18803 (_ BitVec 32) Int) ListLongMap!7745)

(assert (=> b!472294 (= lt!214173 (getCurrentListMapNoExtraKeys!2060 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472294 (= lt!214174 (getCurrentListMapNoExtraKeys!2060 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472295 () Bool)

(declare-fun e!276942 () Bool)

(assert (=> b!472295 (= e!276942 tp_is_empty!13273)))

(declare-fun b!472296 () Bool)

(declare-fun res!282159 () Bool)

(assert (=> b!472296 (=> (not res!282159) (not e!276938))))

(assert (=> b!472296 (= res!282159 (and (= (size!14918 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14917 _keys!1025) (size!14918 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472297 () Bool)

(declare-fun res!282157 () Bool)

(assert (=> b!472297 (=> (not res!282157) (not e!276938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30287 (_ BitVec 32)) Bool)

(assert (=> b!472297 (= res!282157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21619 () Bool)

(declare-fun mapRes!21619 () Bool)

(declare-fun tp!41566 () Bool)

(assert (=> mapNonEmpty!21619 (= mapRes!21619 (and tp!41566 e!276942))))

(declare-fun mapKey!21619 () (_ BitVec 32))

(declare-fun mapValue!21619 () ValueCell!6293)

(declare-fun mapRest!21619 () (Array (_ BitVec 32) ValueCell!6293))

(assert (=> mapNonEmpty!21619 (= (arr!14565 _values!833) (store mapRest!21619 mapKey!21619 mapValue!21619))))

(declare-fun b!472298 () Bool)

(assert (=> b!472298 (= e!276940 true)))

(declare-fun lt!214176 () ListLongMap!7745)

(declare-fun getCurrentListMap!2193 (array!30287 array!30289 (_ BitVec 32) (_ BitVec 32) V!18803 V!18803 (_ BitVec 32) Int) ListLongMap!7745)

(assert (=> b!472298 (= lt!214176 (getCurrentListMap!2193 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472299 () Bool)

(declare-fun res!282156 () Bool)

(assert (=> b!472299 (=> (not res!282156) (not e!276938))))

(declare-datatypes ((List!8913 0))(
  ( (Nil!8910) (Cons!8909 (h!9765 (_ BitVec 64)) (t!14872 List!8913)) )
))
(declare-fun arrayNoDuplicates!0 (array!30287 (_ BitVec 32) List!8913) Bool)

(assert (=> b!472299 (= res!282156 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8910))))

(declare-fun b!472300 () Bool)

(declare-fun e!276941 () Bool)

(assert (=> b!472300 (= e!276941 (and e!276943 mapRes!21619))))

(declare-fun condMapEmpty!21619 () Bool)

(declare-fun mapDefault!21619 () ValueCell!6293)

(assert (=> b!472300 (= condMapEmpty!21619 (= (arr!14565 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6293)) mapDefault!21619)))))

(declare-fun res!282155 () Bool)

(assert (=> start!42340 (=> (not res!282155) (not e!276938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42340 (= res!282155 (validMask!0 mask!1365))))

(assert (=> start!42340 e!276938))

(assert (=> start!42340 tp_is_empty!13273))

(assert (=> start!42340 tp!41565))

(assert (=> start!42340 true))

(declare-fun array_inv!10592 (array!30287) Bool)

(assert (=> start!42340 (array_inv!10592 _keys!1025)))

(declare-fun array_inv!10593 (array!30289) Bool)

(assert (=> start!42340 (and (array_inv!10593 _values!833) e!276941)))

(declare-fun mapIsEmpty!21619 () Bool)

(assert (=> mapIsEmpty!21619 mapRes!21619))

(assert (= (and start!42340 res!282155) b!472296))

(assert (= (and b!472296 res!282159) b!472297))

(assert (= (and b!472297 res!282157) b!472299))

(assert (= (and b!472299 res!282156) b!472294))

(assert (= (and b!472294 (not res!282158)) b!472298))

(assert (= (and b!472300 condMapEmpty!21619) mapIsEmpty!21619))

(assert (= (and b!472300 (not condMapEmpty!21619)) mapNonEmpty!21619))

(get-info :version)

(assert (= (and mapNonEmpty!21619 ((_ is ValueCellFull!6293) mapValue!21619)) b!472295))

(assert (= (and b!472300 ((_ is ValueCellFull!6293) mapDefault!21619)) b!472293))

(assert (= start!42340 b!472300))

(declare-fun m!453783 () Bool)

(assert (=> b!472297 m!453783))

(declare-fun m!453785 () Bool)

(assert (=> mapNonEmpty!21619 m!453785))

(declare-fun m!453787 () Bool)

(assert (=> b!472299 m!453787))

(declare-fun m!453789 () Bool)

(assert (=> start!42340 m!453789))

(declare-fun m!453791 () Bool)

(assert (=> start!42340 m!453791))

(declare-fun m!453793 () Bool)

(assert (=> start!42340 m!453793))

(declare-fun m!453795 () Bool)

(assert (=> b!472298 m!453795))

(declare-fun m!453797 () Bool)

(assert (=> b!472294 m!453797))

(declare-fun m!453799 () Bool)

(assert (=> b!472294 m!453799))

(declare-fun m!453801 () Bool)

(assert (=> b!472294 m!453801))

(check-sat (not b_next!11845) (not mapNonEmpty!21619) b_and!20265 (not start!42340) (not b!472294) (not b!472298) (not b!472297) tp_is_empty!13273 (not b!472299))
(check-sat b_and!20265 (not b_next!11845))
