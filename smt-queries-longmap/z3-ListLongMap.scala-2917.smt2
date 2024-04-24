; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41644 () Bool)

(assert start!41644)

(declare-fun b_free!11311 () Bool)

(declare-fun b_next!11311 () Bool)

(assert (=> start!41644 (= b_free!11311 (not b_next!11311))))

(declare-fun tp!39933 () Bool)

(declare-fun b_and!19669 () Bool)

(assert (=> start!41644 (= tp!39933 b_and!19669)))

(declare-fun b!465136 () Bool)

(declare-fun res!278082 () Bool)

(declare-fun e!271798 () Bool)

(assert (=> b!465136 (=> (not res!278082) (not e!271798))))

(declare-datatypes ((array!29260 0))(
  ( (array!29261 (arr!14060 (Array (_ BitVec 32) (_ BitVec 64))) (size!14412 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29260)

(declare-datatypes ((List!8429 0))(
  ( (Nil!8426) (Cons!8425 (h!9281 (_ BitVec 64)) (t!14369 List!8429)) )
))
(declare-fun arrayNoDuplicates!0 (array!29260 (_ BitVec 32) List!8429) Bool)

(assert (=> b!465136 (= res!278082 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8426))))

(declare-fun mapIsEmpty!20788 () Bool)

(declare-fun mapRes!20788 () Bool)

(assert (=> mapIsEmpty!20788 mapRes!20788))

(declare-fun b!465137 () Bool)

(declare-fun res!278081 () Bool)

(assert (=> b!465137 (=> (not res!278081) (not e!271798))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18091 0))(
  ( (V!18092 (val!6414 Int)) )
))
(declare-datatypes ((ValueCell!6026 0))(
  ( (ValueCellFull!6026 (v!8702 V!18091)) (EmptyCell!6026) )
))
(declare-datatypes ((array!29262 0))(
  ( (array!29263 (arr!14061 (Array (_ BitVec 32) ValueCell!6026)) (size!14413 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29262)

(assert (=> b!465137 (= res!278081 (and (= (size!14413 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14412 _keys!1025) (size!14413 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465138 () Bool)

(declare-fun res!278083 () Bool)

(assert (=> b!465138 (=> (not res!278083) (not e!271798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29260 (_ BitVec 32)) Bool)

(assert (=> b!465138 (= res!278083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!278084 () Bool)

(assert (=> start!41644 (=> (not res!278084) (not e!271798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41644 (= res!278084 (validMask!0 mask!1365))))

(assert (=> start!41644 e!271798))

(declare-fun tp_is_empty!12739 () Bool)

(assert (=> start!41644 tp_is_empty!12739))

(assert (=> start!41644 tp!39933))

(assert (=> start!41644 true))

(declare-fun array_inv!10236 (array!29260) Bool)

(assert (=> start!41644 (array_inv!10236 _keys!1025)))

(declare-fun e!271797 () Bool)

(declare-fun array_inv!10237 (array!29262) Bool)

(assert (=> start!41644 (and (array_inv!10237 _values!833) e!271797)))

(declare-fun b!465139 () Bool)

(declare-fun e!271795 () Bool)

(assert (=> b!465139 (= e!271795 tp_is_empty!12739)))

(declare-fun b!465140 () Bool)

(assert (=> b!465140 (= e!271798 (not true))))

(declare-datatypes ((tuple2!8340 0))(
  ( (tuple2!8341 (_1!4181 (_ BitVec 64)) (_2!4181 V!18091)) )
))
(declare-datatypes ((List!8430 0))(
  ( (Nil!8427) (Cons!8426 (h!9282 tuple2!8340) (t!14370 List!8430)) )
))
(declare-datatypes ((ListLongMap!7255 0))(
  ( (ListLongMap!7256 (toList!3643 List!8430)) )
))
(declare-fun lt!210055 () ListLongMap!7255)

(declare-fun lt!210057 () ListLongMap!7255)

(assert (=> b!465140 (= lt!210055 lt!210057)))

(declare-datatypes ((Unit!13504 0))(
  ( (Unit!13505) )
))
(declare-fun lt!210056 () Unit!13504)

(declare-fun zeroValue!794 () V!18091)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueBefore!38 () V!18091)

(declare-fun minValueAfter!38 () V!18091)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!30 (array!29260 array!29262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18091 V!18091 V!18091 V!18091 (_ BitVec 32) Int) Unit!13504)

(assert (=> b!465140 (= lt!210056 (lemmaNoChangeToArrayThenSameMapNoExtras!30 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1870 (array!29260 array!29262 (_ BitVec 32) (_ BitVec 32) V!18091 V!18091 (_ BitVec 32) Int) ListLongMap!7255)

(assert (=> b!465140 (= lt!210057 (getCurrentListMapNoExtraKeys!1870 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465140 (= lt!210055 (getCurrentListMapNoExtraKeys!1870 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465141 () Bool)

(declare-fun e!271796 () Bool)

(assert (=> b!465141 (= e!271796 tp_is_empty!12739)))

(declare-fun b!465142 () Bool)

(assert (=> b!465142 (= e!271797 (and e!271796 mapRes!20788))))

(declare-fun condMapEmpty!20788 () Bool)

(declare-fun mapDefault!20788 () ValueCell!6026)

(assert (=> b!465142 (= condMapEmpty!20788 (= (arr!14061 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6026)) mapDefault!20788)))))

(declare-fun mapNonEmpty!20788 () Bool)

(declare-fun tp!39934 () Bool)

(assert (=> mapNonEmpty!20788 (= mapRes!20788 (and tp!39934 e!271795))))

(declare-fun mapKey!20788 () (_ BitVec 32))

(declare-fun mapRest!20788 () (Array (_ BitVec 32) ValueCell!6026))

(declare-fun mapValue!20788 () ValueCell!6026)

(assert (=> mapNonEmpty!20788 (= (arr!14061 _values!833) (store mapRest!20788 mapKey!20788 mapValue!20788))))

(assert (= (and start!41644 res!278084) b!465137))

(assert (= (and b!465137 res!278081) b!465138))

(assert (= (and b!465138 res!278083) b!465136))

(assert (= (and b!465136 res!278082) b!465140))

(assert (= (and b!465142 condMapEmpty!20788) mapIsEmpty!20788))

(assert (= (and b!465142 (not condMapEmpty!20788)) mapNonEmpty!20788))

(get-info :version)

(assert (= (and mapNonEmpty!20788 ((_ is ValueCellFull!6026) mapValue!20788)) b!465139))

(assert (= (and b!465142 ((_ is ValueCellFull!6026) mapDefault!20788)) b!465141))

(assert (= start!41644 b!465142))

(declare-fun m!447649 () Bool)

(assert (=> mapNonEmpty!20788 m!447649))

(declare-fun m!447651 () Bool)

(assert (=> b!465136 m!447651))

(declare-fun m!447653 () Bool)

(assert (=> b!465138 m!447653))

(declare-fun m!447655 () Bool)

(assert (=> b!465140 m!447655))

(declare-fun m!447657 () Bool)

(assert (=> b!465140 m!447657))

(declare-fun m!447659 () Bool)

(assert (=> b!465140 m!447659))

(declare-fun m!447661 () Bool)

(assert (=> start!41644 m!447661))

(declare-fun m!447663 () Bool)

(assert (=> start!41644 m!447663))

(declare-fun m!447665 () Bool)

(assert (=> start!41644 m!447665))

(check-sat tp_is_empty!12739 (not b!465140) (not mapNonEmpty!20788) (not start!41644) (not b_next!11311) b_and!19669 (not b!465136) (not b!465138))
(check-sat b_and!19669 (not b_next!11311))
