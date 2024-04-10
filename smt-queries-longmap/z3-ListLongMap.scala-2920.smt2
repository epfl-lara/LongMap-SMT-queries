; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41692 () Bool)

(assert start!41692)

(declare-fun b_free!11331 () Bool)

(declare-fun b_next!11331 () Bool)

(assert (=> start!41692 (= b_free!11331 (not b_next!11331))))

(declare-fun tp!39996 () Bool)

(declare-fun b_and!19687 () Bool)

(assert (=> start!41692 (= tp!39996 b_and!19687)))

(declare-fun b!465506 () Bool)

(declare-fun res!278256 () Bool)

(declare-fun e!272057 () Bool)

(assert (=> b!465506 (=> (not res!278256) (not e!272057))))

(declare-datatypes ((array!29299 0))(
  ( (array!29300 (arr!14079 (Array (_ BitVec 32) (_ BitVec 64))) (size!14431 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29299)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29299 (_ BitVec 32)) Bool)

(assert (=> b!465506 (= res!278256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20821 () Bool)

(declare-fun mapRes!20821 () Bool)

(declare-fun tp!39997 () Bool)

(declare-fun e!272053 () Bool)

(assert (=> mapNonEmpty!20821 (= mapRes!20821 (and tp!39997 e!272053))))

(declare-datatypes ((V!18117 0))(
  ( (V!18118 (val!6424 Int)) )
))
(declare-datatypes ((ValueCell!6036 0))(
  ( (ValueCellFull!6036 (v!8711 V!18117)) (EmptyCell!6036) )
))
(declare-datatypes ((array!29301 0))(
  ( (array!29302 (arr!14080 (Array (_ BitVec 32) ValueCell!6036)) (size!14432 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29301)

(declare-fun mapValue!20821 () ValueCell!6036)

(declare-fun mapKey!20821 () (_ BitVec 32))

(declare-fun mapRest!20821 () (Array (_ BitVec 32) ValueCell!6036))

(assert (=> mapNonEmpty!20821 (= (arr!14080 _values!833) (store mapRest!20821 mapKey!20821 mapValue!20821))))

(declare-fun b!465507 () Bool)

(declare-fun e!272055 () Bool)

(assert (=> b!465507 (= e!272055 true)))

(declare-fun zeroValue!794 () V!18117)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18117)

(declare-datatypes ((tuple2!8414 0))(
  ( (tuple2!8415 (_1!4218 (_ BitVec 64)) (_2!4218 V!18117)) )
))
(declare-datatypes ((List!8507 0))(
  ( (Nil!8504) (Cons!8503 (h!9359 tuple2!8414) (t!14457 List!8507)) )
))
(declare-datatypes ((ListLongMap!7327 0))(
  ( (ListLongMap!7328 (toList!3679 List!8507)) )
))
(declare-fun lt!210202 () ListLongMap!7327)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2134 (array!29299 array!29301 (_ BitVec 32) (_ BitVec 32) V!18117 V!18117 (_ BitVec 32) Int) ListLongMap!7327)

(assert (=> b!465507 (= lt!210202 (getCurrentListMap!2134 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210203 () ListLongMap!7327)

(declare-fun minValueBefore!38 () V!18117)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun +!1640 (ListLongMap!7327 tuple2!8414) ListLongMap!7327)

(assert (=> b!465507 (= lt!210203 (+!1640 (getCurrentListMap!2134 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8415 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465508 () Bool)

(declare-fun e!272054 () Bool)

(declare-fun tp_is_empty!12759 () Bool)

(assert (=> b!465508 (= e!272054 tp_is_empty!12759)))

(declare-fun mapIsEmpty!20821 () Bool)

(assert (=> mapIsEmpty!20821 mapRes!20821))

(declare-fun b!465509 () Bool)

(assert (=> b!465509 (= e!272053 tp_is_empty!12759)))

(declare-fun b!465510 () Bool)

(assert (=> b!465510 (= e!272057 (not e!272055))))

(declare-fun res!278255 () Bool)

(assert (=> b!465510 (=> res!278255 e!272055)))

(assert (=> b!465510 (= res!278255 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210204 () ListLongMap!7327)

(declare-fun lt!210201 () ListLongMap!7327)

(assert (=> b!465510 (= lt!210204 lt!210201)))

(declare-datatypes ((Unit!13526 0))(
  ( (Unit!13527) )
))
(declare-fun lt!210205 () Unit!13526)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!39 (array!29299 array!29301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18117 V!18117 V!18117 V!18117 (_ BitVec 32) Int) Unit!13526)

(assert (=> b!465510 (= lt!210205 (lemmaNoChangeToArrayThenSameMapNoExtras!39 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1859 (array!29299 array!29301 (_ BitVec 32) (_ BitVec 32) V!18117 V!18117 (_ BitVec 32) Int) ListLongMap!7327)

(assert (=> b!465510 (= lt!210201 (getCurrentListMapNoExtraKeys!1859 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465510 (= lt!210204 (getCurrentListMapNoExtraKeys!1859 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465511 () Bool)

(declare-fun e!272052 () Bool)

(assert (=> b!465511 (= e!272052 (and e!272054 mapRes!20821))))

(declare-fun condMapEmpty!20821 () Bool)

(declare-fun mapDefault!20821 () ValueCell!6036)

(assert (=> b!465511 (= condMapEmpty!20821 (= (arr!14080 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6036)) mapDefault!20821)))))

(declare-fun b!465512 () Bool)

(declare-fun res!278257 () Bool)

(assert (=> b!465512 (=> (not res!278257) (not e!272057))))

(assert (=> b!465512 (= res!278257 (and (= (size!14432 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14431 _keys!1025) (size!14432 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465513 () Bool)

(declare-fun res!278253 () Bool)

(assert (=> b!465513 (=> (not res!278253) (not e!272057))))

(declare-datatypes ((List!8508 0))(
  ( (Nil!8505) (Cons!8504 (h!9360 (_ BitVec 64)) (t!14458 List!8508)) )
))
(declare-fun arrayNoDuplicates!0 (array!29299 (_ BitVec 32) List!8508) Bool)

(assert (=> b!465513 (= res!278253 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8505))))

(declare-fun res!278254 () Bool)

(assert (=> start!41692 (=> (not res!278254) (not e!272057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41692 (= res!278254 (validMask!0 mask!1365))))

(assert (=> start!41692 e!272057))

(assert (=> start!41692 tp_is_empty!12759))

(assert (=> start!41692 tp!39996))

(assert (=> start!41692 true))

(declare-fun array_inv!10172 (array!29299) Bool)

(assert (=> start!41692 (array_inv!10172 _keys!1025)))

(declare-fun array_inv!10173 (array!29301) Bool)

(assert (=> start!41692 (and (array_inv!10173 _values!833) e!272052)))

(assert (= (and start!41692 res!278254) b!465512))

(assert (= (and b!465512 res!278257) b!465506))

(assert (= (and b!465506 res!278256) b!465513))

(assert (= (and b!465513 res!278253) b!465510))

(assert (= (and b!465510 (not res!278255)) b!465507))

(assert (= (and b!465511 condMapEmpty!20821) mapIsEmpty!20821))

(assert (= (and b!465511 (not condMapEmpty!20821)) mapNonEmpty!20821))

(get-info :version)

(assert (= (and mapNonEmpty!20821 ((_ is ValueCellFull!6036) mapValue!20821)) b!465509))

(assert (= (and b!465511 ((_ is ValueCellFull!6036) mapDefault!20821)) b!465508))

(assert (= start!41692 b!465511))

(declare-fun m!447737 () Bool)

(assert (=> b!465506 m!447737))

(declare-fun m!447739 () Bool)

(assert (=> mapNonEmpty!20821 m!447739))

(declare-fun m!447741 () Bool)

(assert (=> b!465510 m!447741))

(declare-fun m!447743 () Bool)

(assert (=> b!465510 m!447743))

(declare-fun m!447745 () Bool)

(assert (=> b!465510 m!447745))

(declare-fun m!447747 () Bool)

(assert (=> b!465507 m!447747))

(declare-fun m!447749 () Bool)

(assert (=> b!465507 m!447749))

(assert (=> b!465507 m!447749))

(declare-fun m!447751 () Bool)

(assert (=> b!465507 m!447751))

(declare-fun m!447753 () Bool)

(assert (=> start!41692 m!447753))

(declare-fun m!447755 () Bool)

(assert (=> start!41692 m!447755))

(declare-fun m!447757 () Bool)

(assert (=> start!41692 m!447757))

(declare-fun m!447759 () Bool)

(assert (=> b!465513 m!447759))

(check-sat (not mapNonEmpty!20821) (not b!465506) (not b!465510) b_and!19687 (not start!41692) (not b!465513) (not b!465507) tp_is_empty!12759 (not b_next!11331))
(check-sat b_and!19687 (not b_next!11331))
