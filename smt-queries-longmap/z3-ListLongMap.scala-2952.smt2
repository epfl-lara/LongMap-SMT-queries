; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41934 () Bool)

(assert start!41934)

(declare-fun b_free!11523 () Bool)

(declare-fun b_next!11523 () Bool)

(assert (=> start!41934 (= b_free!11523 (not b_next!11523))))

(declare-fun tp!40581 () Bool)

(declare-fun b_and!19911 () Bool)

(assert (=> start!41934 (= tp!40581 b_and!19911)))

(declare-fun b!468182 () Bool)

(declare-fun e!273977 () Bool)

(declare-fun e!273975 () Bool)

(declare-fun mapRes!21118 () Bool)

(assert (=> b!468182 (= e!273977 (and e!273975 mapRes!21118))))

(declare-fun condMapEmpty!21118 () Bool)

(declare-datatypes ((V!18373 0))(
  ( (V!18374 (val!6520 Int)) )
))
(declare-datatypes ((ValueCell!6132 0))(
  ( (ValueCellFull!6132 (v!8809 V!18373)) (EmptyCell!6132) )
))
(declare-datatypes ((array!29677 0))(
  ( (array!29678 (arr!14265 (Array (_ BitVec 32) ValueCell!6132)) (size!14617 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29677)

(declare-fun mapDefault!21118 () ValueCell!6132)

(assert (=> b!468182 (= condMapEmpty!21118 (= (arr!14265 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6132)) mapDefault!21118)))))

(declare-fun mapIsEmpty!21118 () Bool)

(assert (=> mapIsEmpty!21118 mapRes!21118))

(declare-fun b!468183 () Bool)

(declare-fun res!279810 () Bool)

(declare-fun e!273978 () Bool)

(assert (=> b!468183 (=> (not res!279810) (not e!273978))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29679 0))(
  ( (array!29680 (arr!14266 (Array (_ BitVec 32) (_ BitVec 64))) (size!14618 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29679)

(assert (=> b!468183 (= res!279810 (and (= (size!14617 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14618 _keys!1025) (size!14617 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468184 () Bool)

(declare-fun res!279809 () Bool)

(assert (=> b!468184 (=> (not res!279809) (not e!273978))))

(declare-datatypes ((List!8652 0))(
  ( (Nil!8649) (Cons!8648 (h!9504 (_ BitVec 64)) (t!14608 List!8652)) )
))
(declare-fun arrayNoDuplicates!0 (array!29679 (_ BitVec 32) List!8652) Bool)

(assert (=> b!468184 (= res!279809 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8649))))

(declare-fun b!468185 () Bool)

(declare-fun e!273974 () Bool)

(declare-fun tp_is_empty!12951 () Bool)

(assert (=> b!468185 (= e!273974 tp_is_empty!12951)))

(declare-fun res!279808 () Bool)

(assert (=> start!41934 (=> (not res!279808) (not e!273978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41934 (= res!279808 (validMask!0 mask!1365))))

(assert (=> start!41934 e!273978))

(assert (=> start!41934 tp_is_empty!12951))

(assert (=> start!41934 tp!40581))

(assert (=> start!41934 true))

(declare-fun array_inv!10298 (array!29679) Bool)

(assert (=> start!41934 (array_inv!10298 _keys!1025)))

(declare-fun array_inv!10299 (array!29677) Bool)

(assert (=> start!41934 (and (array_inv!10299 _values!833) e!273977)))

(declare-fun mapNonEmpty!21118 () Bool)

(declare-fun tp!40582 () Bool)

(assert (=> mapNonEmpty!21118 (= mapRes!21118 (and tp!40582 e!273974))))

(declare-fun mapRest!21118 () (Array (_ BitVec 32) ValueCell!6132))

(declare-fun mapKey!21118 () (_ BitVec 32))

(declare-fun mapValue!21118 () ValueCell!6132)

(assert (=> mapNonEmpty!21118 (= (arr!14265 _values!833) (store mapRest!21118 mapKey!21118 mapValue!21118))))

(declare-fun b!468186 () Bool)

(declare-fun e!273979 () Bool)

(assert (=> b!468186 (= e!273978 (not e!273979))))

(declare-fun res!279811 () Bool)

(assert (=> b!468186 (=> res!279811 e!273979)))

(assert (=> b!468186 (= res!279811 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8564 0))(
  ( (tuple2!8565 (_1!4293 (_ BitVec 64)) (_2!4293 V!18373)) )
))
(declare-datatypes ((List!8653 0))(
  ( (Nil!8650) (Cons!8649 (h!9505 tuple2!8564) (t!14609 List!8653)) )
))
(declare-datatypes ((ListLongMap!7477 0))(
  ( (ListLongMap!7478 (toList!3754 List!8653)) )
))
(declare-fun lt!211706 () ListLongMap!7477)

(declare-fun lt!211704 () ListLongMap!7477)

(assert (=> b!468186 (= lt!211706 lt!211704)))

(declare-fun minValueBefore!38 () V!18373)

(declare-fun zeroValue!794 () V!18373)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13666 0))(
  ( (Unit!13667) )
))
(declare-fun lt!211707 () Unit!13666)

(declare-fun minValueAfter!38 () V!18373)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!107 (array!29679 array!29677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18373 V!18373 V!18373 V!18373 (_ BitVec 32) Int) Unit!13666)

(assert (=> b!468186 (= lt!211707 (lemmaNoChangeToArrayThenSameMapNoExtras!107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1927 (array!29679 array!29677 (_ BitVec 32) (_ BitVec 32) V!18373 V!18373 (_ BitVec 32) Int) ListLongMap!7477)

(assert (=> b!468186 (= lt!211704 (getCurrentListMapNoExtraKeys!1927 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468186 (= lt!211706 (getCurrentListMapNoExtraKeys!1927 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468187 () Bool)

(assert (=> b!468187 (= e!273979 true)))

(declare-fun lt!211705 () ListLongMap!7477)

(declare-fun getCurrentListMap!2182 (array!29679 array!29677 (_ BitVec 32) (_ BitVec 32) V!18373 V!18373 (_ BitVec 32) Int) ListLongMap!7477)

(assert (=> b!468187 (= lt!211705 (getCurrentListMap!2182 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468188 () Bool)

(declare-fun res!279807 () Bool)

(assert (=> b!468188 (=> (not res!279807) (not e!273978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29679 (_ BitVec 32)) Bool)

(assert (=> b!468188 (= res!279807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468189 () Bool)

(assert (=> b!468189 (= e!273975 tp_is_empty!12951)))

(assert (= (and start!41934 res!279808) b!468183))

(assert (= (and b!468183 res!279810) b!468188))

(assert (= (and b!468188 res!279807) b!468184))

(assert (= (and b!468184 res!279809) b!468186))

(assert (= (and b!468186 (not res!279811)) b!468187))

(assert (= (and b!468182 condMapEmpty!21118) mapIsEmpty!21118))

(assert (= (and b!468182 (not condMapEmpty!21118)) mapNonEmpty!21118))

(get-info :version)

(assert (= (and mapNonEmpty!21118 ((_ is ValueCellFull!6132) mapValue!21118)) b!468185))

(assert (= (and b!468182 ((_ is ValueCellFull!6132) mapDefault!21118)) b!468189))

(assert (= start!41934 b!468182))

(declare-fun m!450209 () Bool)

(assert (=> b!468188 m!450209))

(declare-fun m!450211 () Bool)

(assert (=> start!41934 m!450211))

(declare-fun m!450213 () Bool)

(assert (=> start!41934 m!450213))

(declare-fun m!450215 () Bool)

(assert (=> start!41934 m!450215))

(declare-fun m!450217 () Bool)

(assert (=> b!468187 m!450217))

(declare-fun m!450219 () Bool)

(assert (=> b!468186 m!450219))

(declare-fun m!450221 () Bool)

(assert (=> b!468186 m!450221))

(declare-fun m!450223 () Bool)

(assert (=> b!468186 m!450223))

(declare-fun m!450225 () Bool)

(assert (=> mapNonEmpty!21118 m!450225))

(declare-fun m!450227 () Bool)

(assert (=> b!468184 m!450227))

(check-sat (not b!468184) (not mapNonEmpty!21118) (not start!41934) (not b!468188) b_and!19911 (not b_next!11523) (not b!468186) (not b!468187) tp_is_empty!12951)
(check-sat b_and!19911 (not b_next!11523))
