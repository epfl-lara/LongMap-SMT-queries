; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41682 () Bool)

(assert start!41682)

(declare-fun b_free!11335 () Bool)

(declare-fun b_next!11335 () Bool)

(assert (=> start!41682 (= b_free!11335 (not b_next!11335))))

(declare-fun tp!40008 () Bool)

(declare-fun b_and!19665 () Bool)

(assert (=> start!41682 (= tp!40008 b_and!19665)))

(declare-fun b!465283 () Bool)

(declare-fun res!278156 () Bool)

(declare-fun e!271915 () Bool)

(assert (=> b!465283 (=> (not res!278156) (not e!271915))))

(declare-datatypes ((array!29309 0))(
  ( (array!29310 (arr!14084 (Array (_ BitVec 32) (_ BitVec 64))) (size!14437 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29309)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29309 (_ BitVec 32)) Bool)

(assert (=> b!465283 (= res!278156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465284 () Bool)

(declare-fun res!278157 () Bool)

(assert (=> b!465284 (=> (not res!278157) (not e!271915))))

(declare-datatypes ((List!8548 0))(
  ( (Nil!8545) (Cons!8544 (h!9400 (_ BitVec 64)) (t!14489 List!8548)) )
))
(declare-fun arrayNoDuplicates!0 (array!29309 (_ BitVec 32) List!8548) Bool)

(assert (=> b!465284 (= res!278157 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8545))))

(declare-fun b!465285 () Bool)

(declare-fun e!271919 () Bool)

(assert (=> b!465285 (= e!271915 (not e!271919))))

(declare-fun res!278158 () Bool)

(assert (=> b!465285 (=> res!278158 e!271919)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465285 (= res!278158 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!18123 0))(
  ( (V!18124 (val!6426 Int)) )
))
(declare-datatypes ((tuple2!8462 0))(
  ( (tuple2!8463 (_1!4242 (_ BitVec 64)) (_2!4242 V!18123)) )
))
(declare-datatypes ((List!8549 0))(
  ( (Nil!8546) (Cons!8545 (h!9401 tuple2!8462) (t!14490 List!8549)) )
))
(declare-datatypes ((ListLongMap!7365 0))(
  ( (ListLongMap!7366 (toList!3698 List!8549)) )
))
(declare-fun lt!209997 () ListLongMap!7365)

(declare-fun lt!210001 () ListLongMap!7365)

(assert (=> b!465285 (= lt!209997 lt!210001)))

(declare-fun minValueBefore!38 () V!18123)

(declare-fun zeroValue!794 () V!18123)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13510 0))(
  ( (Unit!13511) )
))
(declare-fun lt!209998 () Unit!13510)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6038 0))(
  ( (ValueCellFull!6038 (v!8707 V!18123)) (EmptyCell!6038) )
))
(declare-datatypes ((array!29311 0))(
  ( (array!29312 (arr!14085 (Array (_ BitVec 32) ValueCell!6038)) (size!14438 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29311)

(declare-fun minValueAfter!38 () V!18123)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!46 (array!29309 array!29311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18123 V!18123 V!18123 V!18123 (_ BitVec 32) Int) Unit!13510)

(assert (=> b!465285 (= lt!209998 (lemmaNoChangeToArrayThenSameMapNoExtras!46 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1889 (array!29309 array!29311 (_ BitVec 32) (_ BitVec 32) V!18123 V!18123 (_ BitVec 32) Int) ListLongMap!7365)

(assert (=> b!465285 (= lt!210001 (getCurrentListMapNoExtraKeys!1889 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465285 (= lt!209997 (getCurrentListMapNoExtraKeys!1889 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20827 () Bool)

(declare-fun mapRes!20827 () Bool)

(declare-fun tp!40009 () Bool)

(declare-fun e!271917 () Bool)

(assert (=> mapNonEmpty!20827 (= mapRes!20827 (and tp!40009 e!271917))))

(declare-fun mapKey!20827 () (_ BitVec 32))

(declare-fun mapRest!20827 () (Array (_ BitVec 32) ValueCell!6038))

(declare-fun mapValue!20827 () ValueCell!6038)

(assert (=> mapNonEmpty!20827 (= (arr!14085 _values!833) (store mapRest!20827 mapKey!20827 mapValue!20827))))

(declare-fun b!465286 () Bool)

(declare-fun tp_is_empty!12763 () Bool)

(assert (=> b!465286 (= e!271917 tp_is_empty!12763)))

(declare-fun b!465287 () Bool)

(assert (=> b!465287 (= e!271919 true)))

(declare-fun lt!209999 () ListLongMap!7365)

(declare-fun getCurrentListMap!2091 (array!29309 array!29311 (_ BitVec 32) (_ BitVec 32) V!18123 V!18123 (_ BitVec 32) Int) ListLongMap!7365)

(assert (=> b!465287 (= lt!209999 (getCurrentListMap!2091 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210000 () ListLongMap!7365)

(declare-fun +!1672 (ListLongMap!7365 tuple2!8462) ListLongMap!7365)

(assert (=> b!465287 (= lt!210000 (+!1672 (getCurrentListMap!2091 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8463 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun res!278154 () Bool)

(assert (=> start!41682 (=> (not res!278154) (not e!271915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41682 (= res!278154 (validMask!0 mask!1365))))

(assert (=> start!41682 e!271915))

(assert (=> start!41682 tp_is_empty!12763))

(assert (=> start!41682 tp!40008))

(assert (=> start!41682 true))

(declare-fun array_inv!10258 (array!29309) Bool)

(assert (=> start!41682 (array_inv!10258 _keys!1025)))

(declare-fun e!271918 () Bool)

(declare-fun array_inv!10259 (array!29311) Bool)

(assert (=> start!41682 (and (array_inv!10259 _values!833) e!271918)))

(declare-fun b!465288 () Bool)

(declare-fun res!278155 () Bool)

(assert (=> b!465288 (=> (not res!278155) (not e!271915))))

(assert (=> b!465288 (= res!278155 (and (= (size!14438 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14437 _keys!1025) (size!14438 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465289 () Bool)

(declare-fun e!271914 () Bool)

(assert (=> b!465289 (= e!271914 tp_is_empty!12763)))

(declare-fun mapIsEmpty!20827 () Bool)

(assert (=> mapIsEmpty!20827 mapRes!20827))

(declare-fun b!465290 () Bool)

(assert (=> b!465290 (= e!271918 (and e!271914 mapRes!20827))))

(declare-fun condMapEmpty!20827 () Bool)

(declare-fun mapDefault!20827 () ValueCell!6038)

(assert (=> b!465290 (= condMapEmpty!20827 (= (arr!14085 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6038)) mapDefault!20827)))))

(assert (= (and start!41682 res!278154) b!465288))

(assert (= (and b!465288 res!278155) b!465283))

(assert (= (and b!465283 res!278156) b!465284))

(assert (= (and b!465284 res!278157) b!465285))

(assert (= (and b!465285 (not res!278158)) b!465287))

(assert (= (and b!465290 condMapEmpty!20827) mapIsEmpty!20827))

(assert (= (and b!465290 (not condMapEmpty!20827)) mapNonEmpty!20827))

(get-info :version)

(assert (= (and mapNonEmpty!20827 ((_ is ValueCellFull!6038) mapValue!20827)) b!465286))

(assert (= (and b!465290 ((_ is ValueCellFull!6038) mapDefault!20827)) b!465289))

(assert (= start!41682 b!465290))

(declare-fun m!447051 () Bool)

(assert (=> start!41682 m!447051))

(declare-fun m!447053 () Bool)

(assert (=> start!41682 m!447053))

(declare-fun m!447055 () Bool)

(assert (=> start!41682 m!447055))

(declare-fun m!447057 () Bool)

(assert (=> b!465285 m!447057))

(declare-fun m!447059 () Bool)

(assert (=> b!465285 m!447059))

(declare-fun m!447061 () Bool)

(assert (=> b!465285 m!447061))

(declare-fun m!447063 () Bool)

(assert (=> b!465283 m!447063))

(declare-fun m!447065 () Bool)

(assert (=> b!465287 m!447065))

(declare-fun m!447067 () Bool)

(assert (=> b!465287 m!447067))

(assert (=> b!465287 m!447067))

(declare-fun m!447069 () Bool)

(assert (=> b!465287 m!447069))

(declare-fun m!447071 () Bool)

(assert (=> mapNonEmpty!20827 m!447071))

(declare-fun m!447073 () Bool)

(assert (=> b!465284 m!447073))

(check-sat (not b!465287) tp_is_empty!12763 (not b!465284) (not b!465285) (not start!41682) (not mapNonEmpty!20827) b_and!19665 (not b_next!11335) (not b!465283))
(check-sat b_and!19665 (not b_next!11335))
