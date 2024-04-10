; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41704 () Bool)

(assert start!41704)

(declare-fun b_free!11343 () Bool)

(declare-fun b_next!11343 () Bool)

(assert (=> start!41704 (= b_free!11343 (not b_next!11343))))

(declare-fun tp!40032 () Bool)

(declare-fun b_and!19699 () Bool)

(assert (=> start!41704 (= tp!40032 b_and!19699)))

(declare-fun mapIsEmpty!20839 () Bool)

(declare-fun mapRes!20839 () Bool)

(assert (=> mapIsEmpty!20839 mapRes!20839))

(declare-fun b!465650 () Bool)

(declare-fun e!272161 () Bool)

(declare-fun tp_is_empty!12771 () Bool)

(assert (=> b!465650 (= e!272161 tp_is_empty!12771)))

(declare-fun b!465651 () Bool)

(declare-fun e!272163 () Bool)

(assert (=> b!465651 (= e!272163 tp_is_empty!12771)))

(declare-fun b!465652 () Bool)

(declare-fun res!278346 () Bool)

(declare-fun e!272164 () Bool)

(assert (=> b!465652 (=> (not res!278346) (not e!272164))))

(declare-datatypes ((array!29323 0))(
  ( (array!29324 (arr!14091 (Array (_ BitVec 32) (_ BitVec 64))) (size!14443 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29323)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29323 (_ BitVec 32)) Bool)

(assert (=> b!465652 (= res!278346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465653 () Bool)

(declare-fun e!272160 () Bool)

(assert (=> b!465653 (= e!272160 (and e!272163 mapRes!20839))))

(declare-fun condMapEmpty!20839 () Bool)

(declare-datatypes ((V!18133 0))(
  ( (V!18134 (val!6430 Int)) )
))
(declare-datatypes ((ValueCell!6042 0))(
  ( (ValueCellFull!6042 (v!8717 V!18133)) (EmptyCell!6042) )
))
(declare-datatypes ((array!29325 0))(
  ( (array!29326 (arr!14092 (Array (_ BitVec 32) ValueCell!6042)) (size!14444 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29325)

(declare-fun mapDefault!20839 () ValueCell!6042)

(assert (=> b!465653 (= condMapEmpty!20839 (= (arr!14092 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6042)) mapDefault!20839)))))

(declare-fun b!465654 () Bool)

(declare-fun e!272165 () Bool)

(assert (=> b!465654 (= e!272165 true)))

(declare-datatypes ((tuple2!8424 0))(
  ( (tuple2!8425 (_1!4223 (_ BitVec 64)) (_2!4223 V!18133)) )
))
(declare-datatypes ((List!8516 0))(
  ( (Nil!8513) (Cons!8512 (h!9368 tuple2!8424) (t!14466 List!8516)) )
))
(declare-datatypes ((ListLongMap!7337 0))(
  ( (ListLongMap!7338 (toList!3684 List!8516)) )
))
(declare-fun lt!210291 () ListLongMap!7337)

(declare-fun zeroValue!794 () V!18133)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18133)

(declare-fun getCurrentListMap!2138 (array!29323 array!29325 (_ BitVec 32) (_ BitVec 32) V!18133 V!18133 (_ BitVec 32) Int) ListLongMap!7337)

(assert (=> b!465654 (= lt!210291 (getCurrentListMap!2138 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18133)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!210295 () ListLongMap!7337)

(declare-fun +!1644 (ListLongMap!7337 tuple2!8424) ListLongMap!7337)

(assert (=> b!465654 (= lt!210295 (+!1644 (getCurrentListMap!2138 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8425 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465655 () Bool)

(assert (=> b!465655 (= e!272164 (not e!272165))))

(declare-fun res!278347 () Bool)

(assert (=> b!465655 (=> res!278347 e!272165)))

(assert (=> b!465655 (= res!278347 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210294 () ListLongMap!7337)

(declare-fun lt!210292 () ListLongMap!7337)

(assert (=> b!465655 (= lt!210294 lt!210292)))

(declare-datatypes ((Unit!13536 0))(
  ( (Unit!13537) )
))
(declare-fun lt!210293 () Unit!13536)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!44 (array!29323 array!29325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18133 V!18133 V!18133 V!18133 (_ BitVec 32) Int) Unit!13536)

(assert (=> b!465655 (= lt!210293 (lemmaNoChangeToArrayThenSameMapNoExtras!44 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1864 (array!29323 array!29325 (_ BitVec 32) (_ BitVec 32) V!18133 V!18133 (_ BitVec 32) Int) ListLongMap!7337)

(assert (=> b!465655 (= lt!210292 (getCurrentListMapNoExtraKeys!1864 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465655 (= lt!210294 (getCurrentListMapNoExtraKeys!1864 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20839 () Bool)

(declare-fun tp!40033 () Bool)

(assert (=> mapNonEmpty!20839 (= mapRes!20839 (and tp!40033 e!272161))))

(declare-fun mapValue!20839 () ValueCell!6042)

(declare-fun mapKey!20839 () (_ BitVec 32))

(declare-fun mapRest!20839 () (Array (_ BitVec 32) ValueCell!6042))

(assert (=> mapNonEmpty!20839 (= (arr!14092 _values!833) (store mapRest!20839 mapKey!20839 mapValue!20839))))

(declare-fun b!465656 () Bool)

(declare-fun res!278343 () Bool)

(assert (=> b!465656 (=> (not res!278343) (not e!272164))))

(declare-datatypes ((List!8517 0))(
  ( (Nil!8514) (Cons!8513 (h!9369 (_ BitVec 64)) (t!14467 List!8517)) )
))
(declare-fun arrayNoDuplicates!0 (array!29323 (_ BitVec 32) List!8517) Bool)

(assert (=> b!465656 (= res!278343 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8514))))

(declare-fun res!278344 () Bool)

(assert (=> start!41704 (=> (not res!278344) (not e!272164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41704 (= res!278344 (validMask!0 mask!1365))))

(assert (=> start!41704 e!272164))

(assert (=> start!41704 tp_is_empty!12771))

(assert (=> start!41704 tp!40032))

(assert (=> start!41704 true))

(declare-fun array_inv!10178 (array!29323) Bool)

(assert (=> start!41704 (array_inv!10178 _keys!1025)))

(declare-fun array_inv!10179 (array!29325) Bool)

(assert (=> start!41704 (and (array_inv!10179 _values!833) e!272160)))

(declare-fun b!465657 () Bool)

(declare-fun res!278345 () Bool)

(assert (=> b!465657 (=> (not res!278345) (not e!272164))))

(assert (=> b!465657 (= res!278345 (and (= (size!14444 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14443 _keys!1025) (size!14444 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41704 res!278344) b!465657))

(assert (= (and b!465657 res!278345) b!465652))

(assert (= (and b!465652 res!278346) b!465656))

(assert (= (and b!465656 res!278343) b!465655))

(assert (= (and b!465655 (not res!278347)) b!465654))

(assert (= (and b!465653 condMapEmpty!20839) mapIsEmpty!20839))

(assert (= (and b!465653 (not condMapEmpty!20839)) mapNonEmpty!20839))

(get-info :version)

(assert (= (and mapNonEmpty!20839 ((_ is ValueCellFull!6042) mapValue!20839)) b!465650))

(assert (= (and b!465653 ((_ is ValueCellFull!6042) mapDefault!20839)) b!465651))

(assert (= start!41704 b!465653))

(declare-fun m!447881 () Bool)

(assert (=> b!465652 m!447881))

(declare-fun m!447883 () Bool)

(assert (=> b!465656 m!447883))

(declare-fun m!447885 () Bool)

(assert (=> mapNonEmpty!20839 m!447885))

(declare-fun m!447887 () Bool)

(assert (=> start!41704 m!447887))

(declare-fun m!447889 () Bool)

(assert (=> start!41704 m!447889))

(declare-fun m!447891 () Bool)

(assert (=> start!41704 m!447891))

(declare-fun m!447893 () Bool)

(assert (=> b!465655 m!447893))

(declare-fun m!447895 () Bool)

(assert (=> b!465655 m!447895))

(declare-fun m!447897 () Bool)

(assert (=> b!465655 m!447897))

(declare-fun m!447899 () Bool)

(assert (=> b!465654 m!447899))

(declare-fun m!447901 () Bool)

(assert (=> b!465654 m!447901))

(assert (=> b!465654 m!447901))

(declare-fun m!447903 () Bool)

(assert (=> b!465654 m!447903))

(check-sat (not mapNonEmpty!20839) (not start!41704) b_and!19699 tp_is_empty!12771 (not b!465656) (not b_next!11343) (not b!465654) (not b!465655) (not b!465652))
(check-sat b_and!19699 (not b_next!11343))
