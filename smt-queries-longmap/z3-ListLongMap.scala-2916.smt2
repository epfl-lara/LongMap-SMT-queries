; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41654 () Bool)

(assert start!41654)

(declare-fun b_free!11307 () Bool)

(declare-fun b_next!11307 () Bool)

(assert (=> start!41654 (= b_free!11307 (not b_next!11307))))

(declare-fun tp!39921 () Bool)

(declare-fun b_and!19655 () Bool)

(assert (=> start!41654 (= tp!39921 b_and!19655)))

(declare-fun b!465155 () Bool)

(declare-fun e!271805 () Bool)

(declare-fun tp_is_empty!12735 () Bool)

(assert (=> b!465155 (= e!271805 tp_is_empty!12735)))

(declare-fun b!465156 () Bool)

(declare-fun res!278065 () Bool)

(declare-fun e!271806 () Bool)

(assert (=> b!465156 (=> (not res!278065) (not e!271806))))

(declare-datatypes ((array!29255 0))(
  ( (array!29256 (arr!14058 (Array (_ BitVec 32) (_ BitVec 64))) (size!14410 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29255)

(declare-datatypes ((List!8495 0))(
  ( (Nil!8492) (Cons!8491 (h!9347 (_ BitVec 64)) (t!14443 List!8495)) )
))
(declare-fun arrayNoDuplicates!0 (array!29255 (_ BitVec 32) List!8495) Bool)

(assert (=> b!465156 (= res!278065 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8492))))

(declare-fun b!465157 () Bool)

(declare-fun res!278066 () Bool)

(assert (=> b!465157 (=> (not res!278066) (not e!271806))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18085 0))(
  ( (V!18086 (val!6412 Int)) )
))
(declare-datatypes ((ValueCell!6024 0))(
  ( (ValueCellFull!6024 (v!8699 V!18085)) (EmptyCell!6024) )
))
(declare-datatypes ((array!29257 0))(
  ( (array!29258 (arr!14059 (Array (_ BitVec 32) ValueCell!6024)) (size!14411 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29257)

(declare-fun mask!1365 () (_ BitVec 32))

(assert (=> b!465157 (= res!278066 (and (= (size!14411 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14410 _keys!1025) (size!14411 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!278067 () Bool)

(assert (=> start!41654 (=> (not res!278067) (not e!271806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41654 (= res!278067 (validMask!0 mask!1365))))

(assert (=> start!41654 e!271806))

(assert (=> start!41654 tp_is_empty!12735))

(assert (=> start!41654 tp!39921))

(assert (=> start!41654 true))

(declare-fun array_inv!10158 (array!29255) Bool)

(assert (=> start!41654 (array_inv!10158 _keys!1025)))

(declare-fun e!271803 () Bool)

(declare-fun array_inv!10159 (array!29257) Bool)

(assert (=> start!41654 (and (array_inv!10159 _values!833) e!271803)))

(declare-fun mapNonEmpty!20782 () Bool)

(declare-fun mapRes!20782 () Bool)

(declare-fun tp!39922 () Bool)

(declare-fun e!271807 () Bool)

(assert (=> mapNonEmpty!20782 (= mapRes!20782 (and tp!39922 e!271807))))

(declare-fun mapKey!20782 () (_ BitVec 32))

(declare-fun mapRest!20782 () (Array (_ BitVec 32) ValueCell!6024))

(declare-fun mapValue!20782 () ValueCell!6024)

(assert (=> mapNonEmpty!20782 (= (arr!14059 _values!833) (store mapRest!20782 mapKey!20782 mapValue!20782))))

(declare-fun b!465158 () Bool)

(declare-fun res!278064 () Bool)

(assert (=> b!465158 (=> (not res!278064) (not e!271806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29255 (_ BitVec 32)) Bool)

(assert (=> b!465158 (= res!278064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20782 () Bool)

(assert (=> mapIsEmpty!20782 mapRes!20782))

(declare-fun b!465159 () Bool)

(assert (=> b!465159 (= e!271806 (not true))))

(declare-datatypes ((tuple2!8402 0))(
  ( (tuple2!8403 (_1!4212 (_ BitVec 64)) (_2!4212 V!18085)) )
))
(declare-datatypes ((List!8496 0))(
  ( (Nil!8493) (Cons!8492 (h!9348 tuple2!8402) (t!14444 List!8496)) )
))
(declare-datatypes ((ListLongMap!7315 0))(
  ( (ListLongMap!7316 (toList!3673 List!8496)) )
))
(declare-fun lt!210026 () ListLongMap!7315)

(declare-fun lt!210027 () ListLongMap!7315)

(assert (=> b!465159 (= lt!210026 lt!210027)))

(declare-fun minValueBefore!38 () V!18085)

(declare-fun zeroValue!794 () V!18085)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18085)

(declare-datatypes ((Unit!13514 0))(
  ( (Unit!13515) )
))
(declare-fun lt!210025 () Unit!13514)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!33 (array!29255 array!29257 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18085 V!18085 V!18085 V!18085 (_ BitVec 32) Int) Unit!13514)

(assert (=> b!465159 (= lt!210025 (lemmaNoChangeToArrayThenSameMapNoExtras!33 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1853 (array!29255 array!29257 (_ BitVec 32) (_ BitVec 32) V!18085 V!18085 (_ BitVec 32) Int) ListLongMap!7315)

(assert (=> b!465159 (= lt!210027 (getCurrentListMapNoExtraKeys!1853 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465159 (= lt!210026 (getCurrentListMapNoExtraKeys!1853 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465160 () Bool)

(assert (=> b!465160 (= e!271807 tp_is_empty!12735)))

(declare-fun b!465161 () Bool)

(assert (=> b!465161 (= e!271803 (and e!271805 mapRes!20782))))

(declare-fun condMapEmpty!20782 () Bool)

(declare-fun mapDefault!20782 () ValueCell!6024)

(assert (=> b!465161 (= condMapEmpty!20782 (= (arr!14059 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6024)) mapDefault!20782)))))

(assert (= (and start!41654 res!278067) b!465157))

(assert (= (and b!465157 res!278066) b!465158))

(assert (= (and b!465158 res!278064) b!465156))

(assert (= (and b!465156 res!278065) b!465159))

(assert (= (and b!465161 condMapEmpty!20782) mapIsEmpty!20782))

(assert (= (and b!465161 (not condMapEmpty!20782)) mapNonEmpty!20782))

(get-info :version)

(assert (= (and mapNonEmpty!20782 ((_ is ValueCellFull!6024) mapValue!20782)) b!465160))

(assert (= (and b!465161 ((_ is ValueCellFull!6024) mapDefault!20782)) b!465155))

(assert (= start!41654 b!465161))

(declare-fun m!447431 () Bool)

(assert (=> start!41654 m!447431))

(declare-fun m!447433 () Bool)

(assert (=> start!41654 m!447433))

(declare-fun m!447435 () Bool)

(assert (=> start!41654 m!447435))

(declare-fun m!447437 () Bool)

(assert (=> mapNonEmpty!20782 m!447437))

(declare-fun m!447439 () Bool)

(assert (=> b!465159 m!447439))

(declare-fun m!447441 () Bool)

(assert (=> b!465159 m!447441))

(declare-fun m!447443 () Bool)

(assert (=> b!465159 m!447443))

(declare-fun m!447445 () Bool)

(assert (=> b!465156 m!447445))

(declare-fun m!447447 () Bool)

(assert (=> b!465158 m!447447))

(check-sat (not start!41654) (not b!465159) (not mapNonEmpty!20782) b_and!19655 (not b_next!11307) (not b!465158) (not b!465156) tp_is_empty!12735)
(check-sat b_and!19655 (not b_next!11307))
