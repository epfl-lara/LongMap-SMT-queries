; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42118 () Bool)

(assert start!42118)

(declare-fun b_free!11665 () Bool)

(declare-fun b_next!11665 () Bool)

(assert (=> start!42118 (= b_free!11665 (not b_next!11665))))

(declare-fun tp!41016 () Bool)

(declare-fun b_and!20061 () Bool)

(assert (=> start!42118 (= tp!41016 b_and!20061)))

(declare-fun mapIsEmpty!21340 () Bool)

(declare-fun mapRes!21340 () Bool)

(assert (=> mapIsEmpty!21340 mapRes!21340))

(declare-fun b!470092 () Bool)

(declare-fun e!275368 () Bool)

(assert (=> b!470092 (= e!275368 (not true))))

(declare-datatypes ((V!18563 0))(
  ( (V!18564 (val!6591 Int)) )
))
(declare-datatypes ((tuple2!8716 0))(
  ( (tuple2!8717 (_1!4369 (_ BitVec 64)) (_2!4369 V!18563)) )
))
(declare-datatypes ((List!8786 0))(
  ( (Nil!8783) (Cons!8782 (h!9638 tuple2!8716) (t!14739 List!8786)) )
))
(declare-datatypes ((ListLongMap!7619 0))(
  ( (ListLongMap!7620 (toList!3825 List!8786)) )
))
(declare-fun lt!213188 () ListLongMap!7619)

(declare-fun lt!213187 () ListLongMap!7619)

(assert (=> b!470092 (= lt!213188 lt!213187)))

(declare-datatypes ((Unit!13751 0))(
  ( (Unit!13752) )
))
(declare-fun lt!213189 () Unit!13751)

(declare-fun minValueBefore!38 () V!18563)

(declare-fun zeroValue!794 () V!18563)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29939 0))(
  ( (array!29940 (arr!14393 (Array (_ BitVec 32) (_ BitVec 64))) (size!14746 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29939)

(declare-datatypes ((ValueCell!6203 0))(
  ( (ValueCellFull!6203 (v!8876 V!18563)) (EmptyCell!6203) )
))
(declare-datatypes ((array!29941 0))(
  ( (array!29942 (arr!14394 (Array (_ BitVec 32) ValueCell!6203)) (size!14747 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29941)

(declare-fun minValueAfter!38 () V!18563)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!157 (array!29939 array!29941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18563 V!18563 V!18563 V!18563 (_ BitVec 32) Int) Unit!13751)

(assert (=> b!470092 (= lt!213189 (lemmaNoChangeToArrayThenSameMapNoExtras!157 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2000 (array!29939 array!29941 (_ BitVec 32) (_ BitVec 32) V!18563 V!18563 (_ BitVec 32) Int) ListLongMap!7619)

(assert (=> b!470092 (= lt!213187 (getCurrentListMapNoExtraKeys!2000 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470092 (= lt!213188 (getCurrentListMapNoExtraKeys!2000 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470093 () Bool)

(declare-fun res!280926 () Bool)

(assert (=> b!470093 (=> (not res!280926) (not e!275368))))

(assert (=> b!470093 (= res!280926 (and (= (size!14747 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14746 _keys!1025) (size!14747 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!280927 () Bool)

(assert (=> start!42118 (=> (not res!280927) (not e!275368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42118 (= res!280927 (validMask!0 mask!1365))))

(assert (=> start!42118 e!275368))

(declare-fun tp_is_empty!13093 () Bool)

(assert (=> start!42118 tp_is_empty!13093))

(assert (=> start!42118 tp!41016))

(assert (=> start!42118 true))

(declare-fun array_inv!10470 (array!29939) Bool)

(assert (=> start!42118 (array_inv!10470 _keys!1025)))

(declare-fun e!275371 () Bool)

(declare-fun array_inv!10471 (array!29941) Bool)

(assert (=> start!42118 (and (array_inv!10471 _values!833) e!275371)))

(declare-fun b!470094 () Bool)

(declare-fun e!275370 () Bool)

(assert (=> b!470094 (= e!275370 tp_is_empty!13093)))

(declare-fun b!470095 () Bool)

(declare-fun res!280928 () Bool)

(assert (=> b!470095 (=> (not res!280928) (not e!275368))))

(declare-datatypes ((List!8787 0))(
  ( (Nil!8784) (Cons!8783 (h!9639 (_ BitVec 64)) (t!14740 List!8787)) )
))
(declare-fun arrayNoDuplicates!0 (array!29939 (_ BitVec 32) List!8787) Bool)

(assert (=> b!470095 (= res!280928 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8784))))

(declare-fun b!470096 () Bool)

(declare-fun e!275367 () Bool)

(assert (=> b!470096 (= e!275367 tp_is_empty!13093)))

(declare-fun b!470097 () Bool)

(assert (=> b!470097 (= e!275371 (and e!275370 mapRes!21340))))

(declare-fun condMapEmpty!21340 () Bool)

(declare-fun mapDefault!21340 () ValueCell!6203)

(assert (=> b!470097 (= condMapEmpty!21340 (= (arr!14394 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6203)) mapDefault!21340)))))

(declare-fun b!470098 () Bool)

(declare-fun res!280929 () Bool)

(assert (=> b!470098 (=> (not res!280929) (not e!275368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29939 (_ BitVec 32)) Bool)

(assert (=> b!470098 (= res!280929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21340 () Bool)

(declare-fun tp!41017 () Bool)

(assert (=> mapNonEmpty!21340 (= mapRes!21340 (and tp!41017 e!275367))))

(declare-fun mapRest!21340 () (Array (_ BitVec 32) ValueCell!6203))

(declare-fun mapKey!21340 () (_ BitVec 32))

(declare-fun mapValue!21340 () ValueCell!6203)

(assert (=> mapNonEmpty!21340 (= (arr!14394 _values!833) (store mapRest!21340 mapKey!21340 mapValue!21340))))

(assert (= (and start!42118 res!280927) b!470093))

(assert (= (and b!470093 res!280926) b!470098))

(assert (= (and b!470098 res!280929) b!470095))

(assert (= (and b!470095 res!280928) b!470092))

(assert (= (and b!470097 condMapEmpty!21340) mapIsEmpty!21340))

(assert (= (and b!470097 (not condMapEmpty!21340)) mapNonEmpty!21340))

(get-info :version)

(assert (= (and mapNonEmpty!21340 ((_ is ValueCellFull!6203) mapValue!21340)) b!470096))

(assert (= (and b!470097 ((_ is ValueCellFull!6203) mapDefault!21340)) b!470094))

(assert (= start!42118 b!470097))

(declare-fun m!451929 () Bool)

(assert (=> start!42118 m!451929))

(declare-fun m!451931 () Bool)

(assert (=> start!42118 m!451931))

(declare-fun m!451933 () Bool)

(assert (=> start!42118 m!451933))

(declare-fun m!451935 () Bool)

(assert (=> b!470092 m!451935))

(declare-fun m!451937 () Bool)

(assert (=> b!470092 m!451937))

(declare-fun m!451939 () Bool)

(assert (=> b!470092 m!451939))

(declare-fun m!451941 () Bool)

(assert (=> mapNonEmpty!21340 m!451941))

(declare-fun m!451943 () Bool)

(assert (=> b!470095 m!451943))

(declare-fun m!451945 () Bool)

(assert (=> b!470098 m!451945))

(check-sat (not b!470092) (not start!42118) b_and!20061 (not b!470095) (not b!470098) (not b_next!11665) tp_is_empty!13093 (not mapNonEmpty!21340))
(check-sat b_and!20061 (not b_next!11665))
