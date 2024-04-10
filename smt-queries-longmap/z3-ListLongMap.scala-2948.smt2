; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41910 () Bool)

(assert start!41910)

(declare-fun b_free!11499 () Bool)

(declare-fun b_next!11499 () Bool)

(assert (=> start!41910 (= b_free!11499 (not b_next!11499))))

(declare-fun tp!40510 () Bool)

(declare-fun b_and!19887 () Bool)

(assert (=> start!41910 (= tp!40510 b_and!19887)))

(declare-fun mapNonEmpty!21082 () Bool)

(declare-fun mapRes!21082 () Bool)

(declare-fun tp!40509 () Bool)

(declare-fun e!273759 () Bool)

(assert (=> mapNonEmpty!21082 (= mapRes!21082 (and tp!40509 e!273759))))

(declare-datatypes ((V!18341 0))(
  ( (V!18342 (val!6508 Int)) )
))
(declare-datatypes ((ValueCell!6120 0))(
  ( (ValueCellFull!6120 (v!8797 V!18341)) (EmptyCell!6120) )
))
(declare-fun mapValue!21082 () ValueCell!6120)

(declare-fun mapRest!21082 () (Array (_ BitVec 32) ValueCell!6120))

(declare-fun mapKey!21082 () (_ BitVec 32))

(declare-datatypes ((array!29631 0))(
  ( (array!29632 (arr!14242 (Array (_ BitVec 32) ValueCell!6120)) (size!14594 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29631)

(assert (=> mapNonEmpty!21082 (= (arr!14242 _values!833) (store mapRest!21082 mapKey!21082 mapValue!21082))))

(declare-fun res!279627 () Bool)

(declare-fun e!273761 () Bool)

(assert (=> start!41910 (=> (not res!279627) (not e!273761))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41910 (= res!279627 (validMask!0 mask!1365))))

(assert (=> start!41910 e!273761))

(declare-fun tp_is_empty!12927 () Bool)

(assert (=> start!41910 tp_is_empty!12927))

(assert (=> start!41910 tp!40510))

(assert (=> start!41910 true))

(declare-datatypes ((array!29633 0))(
  ( (array!29634 (arr!14243 (Array (_ BitVec 32) (_ BitVec 64))) (size!14595 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29633)

(declare-fun array_inv!10282 (array!29633) Bool)

(assert (=> start!41910 (array_inv!10282 _keys!1025)))

(declare-fun e!273758 () Bool)

(declare-fun array_inv!10283 (array!29631) Bool)

(assert (=> start!41910 (and (array_inv!10283 _values!833) e!273758)))

(declare-fun b!467894 () Bool)

(assert (=> b!467894 (= e!273759 tp_is_empty!12927)))

(declare-fun b!467895 () Bool)

(declare-fun res!279630 () Bool)

(assert (=> b!467895 (=> (not res!279630) (not e!273761))))

(declare-datatypes ((List!8632 0))(
  ( (Nil!8629) (Cons!8628 (h!9484 (_ BitVec 64)) (t!14588 List!8632)) )
))
(declare-fun arrayNoDuplicates!0 (array!29633 (_ BitVec 32) List!8632) Bool)

(assert (=> b!467895 (= res!279630 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8629))))

(declare-fun b!467896 () Bool)

(declare-fun e!273762 () Bool)

(assert (=> b!467896 (= e!273758 (and e!273762 mapRes!21082))))

(declare-fun condMapEmpty!21082 () Bool)

(declare-fun mapDefault!21082 () ValueCell!6120)

(assert (=> b!467896 (= condMapEmpty!21082 (= (arr!14242 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6120)) mapDefault!21082)))))

(declare-fun mapIsEmpty!21082 () Bool)

(assert (=> mapIsEmpty!21082 mapRes!21082))

(declare-fun b!467897 () Bool)

(declare-fun e!273760 () Bool)

(assert (=> b!467897 (= e!273761 (not e!273760))))

(declare-fun res!279628 () Bool)

(assert (=> b!467897 (=> res!279628 e!273760)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!467897 (= res!279628 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8544 0))(
  ( (tuple2!8545 (_1!4283 (_ BitVec 64)) (_2!4283 V!18341)) )
))
(declare-datatypes ((List!8633 0))(
  ( (Nil!8630) (Cons!8629 (h!9485 tuple2!8544) (t!14589 List!8633)) )
))
(declare-datatypes ((ListLongMap!7457 0))(
  ( (ListLongMap!7458 (toList!3744 List!8633)) )
))
(declare-fun lt!211561 () ListLongMap!7457)

(declare-fun lt!211562 () ListLongMap!7457)

(assert (=> b!467897 (= lt!211561 lt!211562)))

(declare-fun minValueBefore!38 () V!18341)

(declare-fun zeroValue!794 () V!18341)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13648 0))(
  ( (Unit!13649) )
))
(declare-fun lt!211563 () Unit!13648)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18341)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!98 (array!29633 array!29631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18341 V!18341 V!18341 V!18341 (_ BitVec 32) Int) Unit!13648)

(assert (=> b!467897 (= lt!211563 (lemmaNoChangeToArrayThenSameMapNoExtras!98 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1918 (array!29633 array!29631 (_ BitVec 32) (_ BitVec 32) V!18341 V!18341 (_ BitVec 32) Int) ListLongMap!7457)

(assert (=> b!467897 (= lt!211562 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467897 (= lt!211561 (getCurrentListMapNoExtraKeys!1918 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467898 () Bool)

(assert (=> b!467898 (= e!273760 true)))

(declare-fun lt!211560 () ListLongMap!7457)

(declare-fun getCurrentListMap!2173 (array!29633 array!29631 (_ BitVec 32) (_ BitVec 32) V!18341 V!18341 (_ BitVec 32) Int) ListLongMap!7457)

(assert (=> b!467898 (= lt!211560 (getCurrentListMap!2173 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467899 () Bool)

(declare-fun res!279631 () Bool)

(assert (=> b!467899 (=> (not res!279631) (not e!273761))))

(assert (=> b!467899 (= res!279631 (and (= (size!14594 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14595 _keys!1025) (size!14594 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467900 () Bool)

(assert (=> b!467900 (= e!273762 tp_is_empty!12927)))

(declare-fun b!467901 () Bool)

(declare-fun res!279629 () Bool)

(assert (=> b!467901 (=> (not res!279629) (not e!273761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29633 (_ BitVec 32)) Bool)

(assert (=> b!467901 (= res!279629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41910 res!279627) b!467899))

(assert (= (and b!467899 res!279631) b!467901))

(assert (= (and b!467901 res!279629) b!467895))

(assert (= (and b!467895 res!279630) b!467897))

(assert (= (and b!467897 (not res!279628)) b!467898))

(assert (= (and b!467896 condMapEmpty!21082) mapIsEmpty!21082))

(assert (= (and b!467896 (not condMapEmpty!21082)) mapNonEmpty!21082))

(get-info :version)

(assert (= (and mapNonEmpty!21082 ((_ is ValueCellFull!6120) mapValue!21082)) b!467894))

(assert (= (and b!467896 ((_ is ValueCellFull!6120) mapDefault!21082)) b!467900))

(assert (= start!41910 b!467896))

(declare-fun m!449969 () Bool)

(assert (=> b!467898 m!449969))

(declare-fun m!449971 () Bool)

(assert (=> b!467901 m!449971))

(declare-fun m!449973 () Bool)

(assert (=> b!467897 m!449973))

(declare-fun m!449975 () Bool)

(assert (=> b!467897 m!449975))

(declare-fun m!449977 () Bool)

(assert (=> b!467897 m!449977))

(declare-fun m!449979 () Bool)

(assert (=> start!41910 m!449979))

(declare-fun m!449981 () Bool)

(assert (=> start!41910 m!449981))

(declare-fun m!449983 () Bool)

(assert (=> start!41910 m!449983))

(declare-fun m!449985 () Bool)

(assert (=> b!467895 m!449985))

(declare-fun m!449987 () Bool)

(assert (=> mapNonEmpty!21082 m!449987))

(check-sat (not start!41910) (not b!467895) (not b!467901) b_and!19887 (not b_next!11499) (not b!467897) (not b!467898) tp_is_empty!12927 (not mapNonEmpty!21082))
(check-sat b_and!19887 (not b_next!11499))
