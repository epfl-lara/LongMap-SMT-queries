; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41688 () Bool)

(assert start!41688)

(declare-fun b_free!11341 () Bool)

(declare-fun b_next!11341 () Bool)

(assert (=> start!41688 (= b_free!11341 (not b_next!11341))))

(declare-fun tp!40027 () Bool)

(declare-fun b_and!19671 () Bool)

(assert (=> start!41688 (= tp!40027 b_and!19671)))

(declare-fun res!278202 () Bool)

(declare-fun e!271968 () Bool)

(assert (=> start!41688 (=> (not res!278202) (not e!271968))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41688 (= res!278202 (validMask!0 mask!1365))))

(assert (=> start!41688 e!271968))

(declare-fun tp_is_empty!12769 () Bool)

(assert (=> start!41688 tp_is_empty!12769))

(assert (=> start!41688 tp!40027))

(assert (=> start!41688 true))

(declare-datatypes ((array!29321 0))(
  ( (array!29322 (arr!14090 (Array (_ BitVec 32) (_ BitVec 64))) (size!14443 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29321)

(declare-fun array_inv!10260 (array!29321) Bool)

(assert (=> start!41688 (array_inv!10260 _keys!1025)))

(declare-datatypes ((V!18131 0))(
  ( (V!18132 (val!6429 Int)) )
))
(declare-datatypes ((ValueCell!6041 0))(
  ( (ValueCellFull!6041 (v!8710 V!18131)) (EmptyCell!6041) )
))
(declare-datatypes ((array!29323 0))(
  ( (array!29324 (arr!14091 (Array (_ BitVec 32) ValueCell!6041)) (size!14444 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29323)

(declare-fun e!271972 () Bool)

(declare-fun array_inv!10261 (array!29323) Bool)

(assert (=> start!41688 (and (array_inv!10261 _values!833) e!271972)))

(declare-fun b!465355 () Bool)

(declare-fun res!278200 () Bool)

(assert (=> b!465355 (=> (not res!278200) (not e!271968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29321 (_ BitVec 32)) Bool)

(assert (=> b!465355 (= res!278200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465356 () Bool)

(declare-fun e!271973 () Bool)

(assert (=> b!465356 (= e!271973 tp_is_empty!12769)))

(declare-fun b!465357 () Bool)

(declare-fun e!271969 () Bool)

(assert (=> b!465357 (= e!271968 (not e!271969))))

(declare-fun res!278201 () Bool)

(assert (=> b!465357 (=> res!278201 e!271969)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465357 (= res!278201 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8468 0))(
  ( (tuple2!8469 (_1!4245 (_ BitVec 64)) (_2!4245 V!18131)) )
))
(declare-datatypes ((List!8553 0))(
  ( (Nil!8550) (Cons!8549 (h!9405 tuple2!8468) (t!14494 List!8553)) )
))
(declare-datatypes ((ListLongMap!7371 0))(
  ( (ListLongMap!7372 (toList!3701 List!8553)) )
))
(declare-fun lt!210044 () ListLongMap!7371)

(declare-fun lt!210042 () ListLongMap!7371)

(assert (=> b!465357 (= lt!210044 lt!210042)))

(declare-fun minValueBefore!38 () V!18131)

(declare-fun zeroValue!794 () V!18131)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13514 0))(
  ( (Unit!13515) )
))
(declare-fun lt!210046 () Unit!13514)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18131)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!48 (array!29321 array!29323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18131 V!18131 V!18131 V!18131 (_ BitVec 32) Int) Unit!13514)

(assert (=> b!465357 (= lt!210046 (lemmaNoChangeToArrayThenSameMapNoExtras!48 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1891 (array!29321 array!29323 (_ BitVec 32) (_ BitVec 32) V!18131 V!18131 (_ BitVec 32) Int) ListLongMap!7371)

(assert (=> b!465357 (= lt!210042 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465357 (= lt!210044 (getCurrentListMapNoExtraKeys!1891 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20836 () Bool)

(declare-fun mapRes!20836 () Bool)

(declare-fun tp!40026 () Bool)

(assert (=> mapNonEmpty!20836 (= mapRes!20836 (and tp!40026 e!271973))))

(declare-fun mapValue!20836 () ValueCell!6041)

(declare-fun mapRest!20836 () (Array (_ BitVec 32) ValueCell!6041))

(declare-fun mapKey!20836 () (_ BitVec 32))

(assert (=> mapNonEmpty!20836 (= (arr!14091 _values!833) (store mapRest!20836 mapKey!20836 mapValue!20836))))

(declare-fun b!465358 () Bool)

(declare-fun e!271971 () Bool)

(assert (=> b!465358 (= e!271971 tp_is_empty!12769)))

(declare-fun b!465359 () Bool)

(declare-fun res!278199 () Bool)

(assert (=> b!465359 (=> (not res!278199) (not e!271968))))

(assert (=> b!465359 (= res!278199 (and (= (size!14444 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14443 _keys!1025) (size!14444 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465360 () Bool)

(assert (=> b!465360 (= e!271972 (and e!271971 mapRes!20836))))

(declare-fun condMapEmpty!20836 () Bool)

(declare-fun mapDefault!20836 () ValueCell!6041)

(assert (=> b!465360 (= condMapEmpty!20836 (= (arr!14091 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6041)) mapDefault!20836)))))

(declare-fun b!465361 () Bool)

(assert (=> b!465361 (= e!271969 true)))

(declare-fun lt!210045 () ListLongMap!7371)

(declare-fun getCurrentListMap!2094 (array!29321 array!29323 (_ BitVec 32) (_ BitVec 32) V!18131 V!18131 (_ BitVec 32) Int) ListLongMap!7371)

(assert (=> b!465361 (= lt!210045 (getCurrentListMap!2094 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210043 () ListLongMap!7371)

(declare-fun +!1675 (ListLongMap!7371 tuple2!8468) ListLongMap!7371)

(assert (=> b!465361 (= lt!210043 (+!1675 (getCurrentListMap!2094 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8469 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465362 () Bool)

(declare-fun res!278203 () Bool)

(assert (=> b!465362 (=> (not res!278203) (not e!271968))))

(declare-datatypes ((List!8554 0))(
  ( (Nil!8551) (Cons!8550 (h!9406 (_ BitVec 64)) (t!14495 List!8554)) )
))
(declare-fun arrayNoDuplicates!0 (array!29321 (_ BitVec 32) List!8554) Bool)

(assert (=> b!465362 (= res!278203 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8551))))

(declare-fun mapIsEmpty!20836 () Bool)

(assert (=> mapIsEmpty!20836 mapRes!20836))

(assert (= (and start!41688 res!278202) b!465359))

(assert (= (and b!465359 res!278199) b!465355))

(assert (= (and b!465355 res!278200) b!465362))

(assert (= (and b!465362 res!278203) b!465357))

(assert (= (and b!465357 (not res!278201)) b!465361))

(assert (= (and b!465360 condMapEmpty!20836) mapIsEmpty!20836))

(assert (= (and b!465360 (not condMapEmpty!20836)) mapNonEmpty!20836))

(get-info :version)

(assert (= (and mapNonEmpty!20836 ((_ is ValueCellFull!6041) mapValue!20836)) b!465356))

(assert (= (and b!465360 ((_ is ValueCellFull!6041) mapDefault!20836)) b!465358))

(assert (= start!41688 b!465360))

(declare-fun m!447123 () Bool)

(assert (=> b!465362 m!447123))

(declare-fun m!447125 () Bool)

(assert (=> b!465361 m!447125))

(declare-fun m!447127 () Bool)

(assert (=> b!465361 m!447127))

(assert (=> b!465361 m!447127))

(declare-fun m!447129 () Bool)

(assert (=> b!465361 m!447129))

(declare-fun m!447131 () Bool)

(assert (=> start!41688 m!447131))

(declare-fun m!447133 () Bool)

(assert (=> start!41688 m!447133))

(declare-fun m!447135 () Bool)

(assert (=> start!41688 m!447135))

(declare-fun m!447137 () Bool)

(assert (=> b!465355 m!447137))

(declare-fun m!447139 () Bool)

(assert (=> b!465357 m!447139))

(declare-fun m!447141 () Bool)

(assert (=> b!465357 m!447141))

(declare-fun m!447143 () Bool)

(assert (=> b!465357 m!447143))

(declare-fun m!447145 () Bool)

(assert (=> mapNonEmpty!20836 m!447145))

(check-sat (not b!465357) (not b!465362) (not b!465361) (not start!41688) tp_is_empty!12769 (not b!465355) b_and!19671 (not mapNonEmpty!20836) (not b_next!11341))
(check-sat b_and!19671 (not b_next!11341))
