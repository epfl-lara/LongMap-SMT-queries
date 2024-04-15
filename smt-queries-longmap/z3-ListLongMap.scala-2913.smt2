; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41620 () Bool)

(assert start!41620)

(declare-fun b_free!11287 () Bool)

(declare-fun b_next!11287 () Bool)

(assert (=> start!41620 (= b_free!11287 (not b_next!11287))))

(declare-fun tp!39862 () Bool)

(declare-fun b_and!19609 () Bool)

(assert (=> start!41620 (= tp!39862 b_and!19609)))

(declare-fun b!464674 () Bool)

(declare-fun e!271481 () Bool)

(declare-fun tp_is_empty!12715 () Bool)

(assert (=> b!464674 (= e!271481 tp_is_empty!12715)))

(declare-fun b!464675 () Bool)

(declare-fun e!271482 () Bool)

(declare-fun e!271479 () Bool)

(declare-fun mapRes!20752 () Bool)

(assert (=> b!464675 (= e!271482 (and e!271479 mapRes!20752))))

(declare-fun condMapEmpty!20752 () Bool)

(declare-datatypes ((V!18059 0))(
  ( (V!18060 (val!6402 Int)) )
))
(declare-datatypes ((ValueCell!6014 0))(
  ( (ValueCellFull!6014 (v!8683 V!18059)) (EmptyCell!6014) )
))
(declare-datatypes ((array!29213 0))(
  ( (array!29214 (arr!14037 (Array (_ BitVec 32) ValueCell!6014)) (size!14390 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29213)

(declare-fun mapDefault!20752 () ValueCell!6014)

(assert (=> b!464675 (= condMapEmpty!20752 (= (arr!14037 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6014)) mapDefault!20752)))))

(declare-fun b!464676 () Bool)

(declare-fun res!277817 () Bool)

(declare-fun e!271480 () Bool)

(assert (=> b!464676 (=> (not res!277817) (not e!271480))))

(declare-datatypes ((array!29215 0))(
  ( (array!29216 (arr!14038 (Array (_ BitVec 32) (_ BitVec 64))) (size!14391 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29215)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29215 (_ BitVec 32)) Bool)

(assert (=> b!464676 (= res!277817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277816 () Bool)

(assert (=> start!41620 (=> (not res!277816) (not e!271480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41620 (= res!277816 (validMask!0 mask!1365))))

(assert (=> start!41620 e!271480))

(assert (=> start!41620 tp_is_empty!12715))

(assert (=> start!41620 tp!39862))

(assert (=> start!41620 true))

(declare-fun array_inv!10220 (array!29215) Bool)

(assert (=> start!41620 (array_inv!10220 _keys!1025)))

(declare-fun array_inv!10221 (array!29213) Bool)

(assert (=> start!41620 (and (array_inv!10221 _values!833) e!271482)))

(declare-fun mapNonEmpty!20752 () Bool)

(declare-fun tp!39861 () Bool)

(assert (=> mapNonEmpty!20752 (= mapRes!20752 (and tp!39861 e!271481))))

(declare-fun mapRest!20752 () (Array (_ BitVec 32) ValueCell!6014))

(declare-fun mapValue!20752 () ValueCell!6014)

(declare-fun mapKey!20752 () (_ BitVec 32))

(assert (=> mapNonEmpty!20752 (= (arr!14037 _values!833) (store mapRest!20752 mapKey!20752 mapValue!20752))))

(declare-fun b!464677 () Bool)

(assert (=> b!464677 (= e!271479 tp_is_empty!12715)))

(declare-fun b!464678 () Bool)

(assert (=> b!464678 (= e!271480 (not true))))

(declare-datatypes ((tuple2!8424 0))(
  ( (tuple2!8425 (_1!4223 (_ BitVec 64)) (_2!4223 V!18059)) )
))
(declare-datatypes ((List!8512 0))(
  ( (Nil!8509) (Cons!8508 (h!9364 tuple2!8424) (t!14451 List!8512)) )
))
(declare-datatypes ((ListLongMap!7327 0))(
  ( (ListLongMap!7328 (toList!3679 List!8512)) )
))
(declare-fun lt!209701 () ListLongMap!7327)

(declare-fun lt!209703 () ListLongMap!7327)

(assert (=> b!464678 (= lt!209701 lt!209703)))

(declare-fun minValueBefore!38 () V!18059)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13474 0))(
  ( (Unit!13475) )
))
(declare-fun lt!209702 () Unit!13474)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!18059)

(declare-fun minValueAfter!38 () V!18059)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!28 (array!29215 array!29213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18059 V!18059 V!18059 V!18059 (_ BitVec 32) Int) Unit!13474)

(assert (=> b!464678 (= lt!209702 (lemmaNoChangeToArrayThenSameMapNoExtras!28 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1871 (array!29215 array!29213 (_ BitVec 32) (_ BitVec 32) V!18059 V!18059 (_ BitVec 32) Int) ListLongMap!7327)

(assert (=> b!464678 (= lt!209703 (getCurrentListMapNoExtraKeys!1871 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464678 (= lt!209701 (getCurrentListMapNoExtraKeys!1871 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464679 () Bool)

(declare-fun res!277815 () Bool)

(assert (=> b!464679 (=> (not res!277815) (not e!271480))))

(assert (=> b!464679 (= res!277815 (and (= (size!14390 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14391 _keys!1025) (size!14390 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20752 () Bool)

(assert (=> mapIsEmpty!20752 mapRes!20752))

(declare-fun b!464680 () Bool)

(declare-fun res!277818 () Bool)

(assert (=> b!464680 (=> (not res!277818) (not e!271480))))

(declare-datatypes ((List!8513 0))(
  ( (Nil!8510) (Cons!8509 (h!9365 (_ BitVec 64)) (t!14452 List!8513)) )
))
(declare-fun arrayNoDuplicates!0 (array!29215 (_ BitVec 32) List!8513) Bool)

(assert (=> b!464680 (= res!277818 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8510))))

(assert (= (and start!41620 res!277816) b!464679))

(assert (= (and b!464679 res!277815) b!464676))

(assert (= (and b!464676 res!277817) b!464680))

(assert (= (and b!464680 res!277818) b!464678))

(assert (= (and b!464675 condMapEmpty!20752) mapIsEmpty!20752))

(assert (= (and b!464675 (not condMapEmpty!20752)) mapNonEmpty!20752))

(get-info :version)

(assert (= (and mapNonEmpty!20752 ((_ is ValueCellFull!6014) mapValue!20752)) b!464674))

(assert (= (and b!464675 ((_ is ValueCellFull!6014) mapDefault!20752)) b!464677))

(assert (= start!41620 b!464675))

(declare-fun m!446517 () Bool)

(assert (=> b!464676 m!446517))

(declare-fun m!446519 () Bool)

(assert (=> b!464680 m!446519))

(declare-fun m!446521 () Bool)

(assert (=> start!41620 m!446521))

(declare-fun m!446523 () Bool)

(assert (=> start!41620 m!446523))

(declare-fun m!446525 () Bool)

(assert (=> start!41620 m!446525))

(declare-fun m!446527 () Bool)

(assert (=> b!464678 m!446527))

(declare-fun m!446529 () Bool)

(assert (=> b!464678 m!446529))

(declare-fun m!446531 () Bool)

(assert (=> b!464678 m!446531))

(declare-fun m!446533 () Bool)

(assert (=> mapNonEmpty!20752 m!446533))

(check-sat (not b!464680) (not b!464678) tp_is_empty!12715 (not b!464676) (not mapNonEmpty!20752) (not b_next!11287) b_and!19609 (not start!41620))
(check-sat b_and!19609 (not b_next!11287))
