; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41660 () Bool)

(assert start!41660)

(declare-fun b_free!11313 () Bool)

(declare-fun b_next!11313 () Bool)

(assert (=> start!41660 (= b_free!11313 (not b_next!11313))))

(declare-fun tp!39939 () Bool)

(declare-fun b_and!19661 () Bool)

(assert (=> start!41660 (= tp!39939 b_and!19661)))

(declare-fun b!465218 () Bool)

(declare-fun e!271852 () Bool)

(assert (=> b!465218 (= e!271852 (not true))))

(declare-datatypes ((V!18093 0))(
  ( (V!18094 (val!6415 Int)) )
))
(declare-datatypes ((tuple2!8406 0))(
  ( (tuple2!8407 (_1!4214 (_ BitVec 64)) (_2!4214 V!18093)) )
))
(declare-datatypes ((List!8500 0))(
  ( (Nil!8497) (Cons!8496 (h!9352 tuple2!8406) (t!14448 List!8500)) )
))
(declare-datatypes ((ListLongMap!7319 0))(
  ( (ListLongMap!7320 (toList!3675 List!8500)) )
))
(declare-fun lt!210053 () ListLongMap!7319)

(declare-fun lt!210054 () ListLongMap!7319)

(assert (=> b!465218 (= lt!210053 lt!210054)))

(declare-fun zeroValue!794 () V!18093)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!18093)

(declare-datatypes ((Unit!13518 0))(
  ( (Unit!13519) )
))
(declare-fun lt!210052 () Unit!13518)

(declare-datatypes ((array!29267 0))(
  ( (array!29268 (arr!14064 (Array (_ BitVec 32) (_ BitVec 64))) (size!14416 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29267)

(declare-datatypes ((ValueCell!6027 0))(
  ( (ValueCellFull!6027 (v!8702 V!18093)) (EmptyCell!6027) )
))
(declare-datatypes ((array!29269 0))(
  ( (array!29270 (arr!14065 (Array (_ BitVec 32) ValueCell!6027)) (size!14417 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29269)

(declare-fun minValueAfter!38 () V!18093)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!35 (array!29267 array!29269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18093 V!18093 V!18093 V!18093 (_ BitVec 32) Int) Unit!13518)

(assert (=> b!465218 (= lt!210052 (lemmaNoChangeToArrayThenSameMapNoExtras!35 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1855 (array!29267 array!29269 (_ BitVec 32) (_ BitVec 32) V!18093 V!18093 (_ BitVec 32) Int) ListLongMap!7319)

(assert (=> b!465218 (= lt!210054 (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465218 (= lt!210053 (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20791 () Bool)

(declare-fun mapRes!20791 () Bool)

(declare-fun tp!39940 () Bool)

(declare-fun e!271850 () Bool)

(assert (=> mapNonEmpty!20791 (= mapRes!20791 (and tp!39940 e!271850))))

(declare-fun mapKey!20791 () (_ BitVec 32))

(declare-fun mapRest!20791 () (Array (_ BitVec 32) ValueCell!6027))

(declare-fun mapValue!20791 () ValueCell!6027)

(assert (=> mapNonEmpty!20791 (= (arr!14065 _values!833) (store mapRest!20791 mapKey!20791 mapValue!20791))))

(declare-fun res!278101 () Bool)

(assert (=> start!41660 (=> (not res!278101) (not e!271852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41660 (= res!278101 (validMask!0 mask!1365))))

(assert (=> start!41660 e!271852))

(declare-fun tp_is_empty!12741 () Bool)

(assert (=> start!41660 tp_is_empty!12741))

(assert (=> start!41660 tp!39939))

(assert (=> start!41660 true))

(declare-fun array_inv!10164 (array!29267) Bool)

(assert (=> start!41660 (array_inv!10164 _keys!1025)))

(declare-fun e!271851 () Bool)

(declare-fun array_inv!10165 (array!29269) Bool)

(assert (=> start!41660 (and (array_inv!10165 _values!833) e!271851)))

(declare-fun b!465219 () Bool)

(declare-fun e!271848 () Bool)

(assert (=> b!465219 (= e!271851 (and e!271848 mapRes!20791))))

(declare-fun condMapEmpty!20791 () Bool)

(declare-fun mapDefault!20791 () ValueCell!6027)

(assert (=> b!465219 (= condMapEmpty!20791 (= (arr!14065 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6027)) mapDefault!20791)))))

(declare-fun b!465220 () Bool)

(assert (=> b!465220 (= e!271850 tp_is_empty!12741)))

(declare-fun b!465221 () Bool)

(declare-fun res!278100 () Bool)

(assert (=> b!465221 (=> (not res!278100) (not e!271852))))

(declare-datatypes ((List!8501 0))(
  ( (Nil!8498) (Cons!8497 (h!9353 (_ BitVec 64)) (t!14449 List!8501)) )
))
(declare-fun arrayNoDuplicates!0 (array!29267 (_ BitVec 32) List!8501) Bool)

(assert (=> b!465221 (= res!278100 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8498))))

(declare-fun b!465222 () Bool)

(declare-fun res!278102 () Bool)

(assert (=> b!465222 (=> (not res!278102) (not e!271852))))

(assert (=> b!465222 (= res!278102 (and (= (size!14417 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14416 _keys!1025) (size!14417 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465223 () Bool)

(declare-fun res!278103 () Bool)

(assert (=> b!465223 (=> (not res!278103) (not e!271852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29267 (_ BitVec 32)) Bool)

(assert (=> b!465223 (= res!278103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20791 () Bool)

(assert (=> mapIsEmpty!20791 mapRes!20791))

(declare-fun b!465224 () Bool)

(assert (=> b!465224 (= e!271848 tp_is_empty!12741)))

(assert (= (and start!41660 res!278101) b!465222))

(assert (= (and b!465222 res!278102) b!465223))

(assert (= (and b!465223 res!278103) b!465221))

(assert (= (and b!465221 res!278100) b!465218))

(assert (= (and b!465219 condMapEmpty!20791) mapIsEmpty!20791))

(assert (= (and b!465219 (not condMapEmpty!20791)) mapNonEmpty!20791))

(get-info :version)

(assert (= (and mapNonEmpty!20791 ((_ is ValueCellFull!6027) mapValue!20791)) b!465220))

(assert (= (and b!465219 ((_ is ValueCellFull!6027) mapDefault!20791)) b!465224))

(assert (= start!41660 b!465219))

(declare-fun m!447485 () Bool)

(assert (=> b!465221 m!447485))

(declare-fun m!447487 () Bool)

(assert (=> start!41660 m!447487))

(declare-fun m!447489 () Bool)

(assert (=> start!41660 m!447489))

(declare-fun m!447491 () Bool)

(assert (=> start!41660 m!447491))

(declare-fun m!447493 () Bool)

(assert (=> b!465223 m!447493))

(declare-fun m!447495 () Bool)

(assert (=> b!465218 m!447495))

(declare-fun m!447497 () Bool)

(assert (=> b!465218 m!447497))

(declare-fun m!447499 () Bool)

(assert (=> b!465218 m!447499))

(declare-fun m!447501 () Bool)

(assert (=> mapNonEmpty!20791 m!447501))

(check-sat (not start!41660) (not mapNonEmpty!20791) (not b_next!11313) (not b!465218) (not b!465221) (not b!465223) tp_is_empty!12741 b_and!19661)
(check-sat b_and!19661 (not b_next!11313))
