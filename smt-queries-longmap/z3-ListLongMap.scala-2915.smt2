; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41632 () Bool)

(assert start!41632)

(declare-fun b_free!11299 () Bool)

(declare-fun b_next!11299 () Bool)

(assert (=> start!41632 (= b_free!11299 (not b_next!11299))))

(declare-fun tp!39898 () Bool)

(declare-fun b_and!19621 () Bool)

(assert (=> start!41632 (= tp!39898 b_and!19621)))

(declare-fun mapIsEmpty!20770 () Bool)

(declare-fun mapRes!20770 () Bool)

(assert (=> mapIsEmpty!20770 mapRes!20770))

(declare-fun b!464800 () Bool)

(declare-fun e!271573 () Bool)

(assert (=> b!464800 (= e!271573 (not true))))

(declare-datatypes ((V!18075 0))(
  ( (V!18076 (val!6408 Int)) )
))
(declare-datatypes ((tuple2!8432 0))(
  ( (tuple2!8433 (_1!4227 (_ BitVec 64)) (_2!4227 V!18075)) )
))
(declare-datatypes ((List!8521 0))(
  ( (Nil!8518) (Cons!8517 (h!9373 tuple2!8432) (t!14460 List!8521)) )
))
(declare-datatypes ((ListLongMap!7335 0))(
  ( (ListLongMap!7336 (toList!3683 List!8521)) )
))
(declare-fun lt!209757 () ListLongMap!7335)

(declare-fun lt!209755 () ListLongMap!7335)

(assert (=> b!464800 (= lt!209757 lt!209755)))

(declare-datatypes ((Unit!13482 0))(
  ( (Unit!13483) )
))
(declare-fun lt!209756 () Unit!13482)

(declare-fun minValueBefore!38 () V!18075)

(declare-fun zeroValue!794 () V!18075)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29237 0))(
  ( (array!29238 (arr!14049 (Array (_ BitVec 32) (_ BitVec 64))) (size!14402 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29237)

(declare-datatypes ((ValueCell!6020 0))(
  ( (ValueCellFull!6020 (v!8689 V!18075)) (EmptyCell!6020) )
))
(declare-datatypes ((array!29239 0))(
  ( (array!29240 (arr!14050 (Array (_ BitVec 32) ValueCell!6020)) (size!14403 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29239)

(declare-fun minValueAfter!38 () V!18075)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!32 (array!29237 array!29239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18075 V!18075 V!18075 V!18075 (_ BitVec 32) Int) Unit!13482)

(assert (=> b!464800 (= lt!209756 (lemmaNoChangeToArrayThenSameMapNoExtras!32 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1875 (array!29237 array!29239 (_ BitVec 32) (_ BitVec 32) V!18075 V!18075 (_ BitVec 32) Int) ListLongMap!7335)

(assert (=> b!464800 (= lt!209755 (getCurrentListMapNoExtraKeys!1875 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464800 (= lt!209757 (getCurrentListMapNoExtraKeys!1875 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464801 () Bool)

(declare-fun res!277888 () Bool)

(assert (=> b!464801 (=> (not res!277888) (not e!271573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29237 (_ BitVec 32)) Bool)

(assert (=> b!464801 (= res!277888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464802 () Bool)

(declare-fun res!277890 () Bool)

(assert (=> b!464802 (=> (not res!277890) (not e!271573))))

(declare-datatypes ((List!8522 0))(
  ( (Nil!8519) (Cons!8518 (h!9374 (_ BitVec 64)) (t!14461 List!8522)) )
))
(declare-fun arrayNoDuplicates!0 (array!29237 (_ BitVec 32) List!8522) Bool)

(assert (=> b!464802 (= res!277890 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8519))))

(declare-fun b!464803 () Bool)

(declare-fun e!271570 () Bool)

(declare-fun tp_is_empty!12727 () Bool)

(assert (=> b!464803 (= e!271570 tp_is_empty!12727)))

(declare-fun b!464804 () Bool)

(declare-fun e!271569 () Bool)

(assert (=> b!464804 (= e!271569 tp_is_empty!12727)))

(declare-fun b!464805 () Bool)

(declare-fun res!277887 () Bool)

(assert (=> b!464805 (=> (not res!277887) (not e!271573))))

(assert (=> b!464805 (= res!277887 (and (= (size!14403 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14402 _keys!1025) (size!14403 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20770 () Bool)

(declare-fun tp!39897 () Bool)

(assert (=> mapNonEmpty!20770 (= mapRes!20770 (and tp!39897 e!271569))))

(declare-fun mapRest!20770 () (Array (_ BitVec 32) ValueCell!6020))

(declare-fun mapValue!20770 () ValueCell!6020)

(declare-fun mapKey!20770 () (_ BitVec 32))

(assert (=> mapNonEmpty!20770 (= (arr!14050 _values!833) (store mapRest!20770 mapKey!20770 mapValue!20770))))

(declare-fun b!464806 () Bool)

(declare-fun e!271571 () Bool)

(assert (=> b!464806 (= e!271571 (and e!271570 mapRes!20770))))

(declare-fun condMapEmpty!20770 () Bool)

(declare-fun mapDefault!20770 () ValueCell!6020)

(assert (=> b!464806 (= condMapEmpty!20770 (= (arr!14050 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6020)) mapDefault!20770)))))

(declare-fun res!277889 () Bool)

(assert (=> start!41632 (=> (not res!277889) (not e!271573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41632 (= res!277889 (validMask!0 mask!1365))))

(assert (=> start!41632 e!271573))

(assert (=> start!41632 tp_is_empty!12727))

(assert (=> start!41632 tp!39898))

(assert (=> start!41632 true))

(declare-fun array_inv!10230 (array!29237) Bool)

(assert (=> start!41632 (array_inv!10230 _keys!1025)))

(declare-fun array_inv!10231 (array!29239) Bool)

(assert (=> start!41632 (and (array_inv!10231 _values!833) e!271571)))

(assert (= (and start!41632 res!277889) b!464805))

(assert (= (and b!464805 res!277887) b!464801))

(assert (= (and b!464801 res!277888) b!464802))

(assert (= (and b!464802 res!277890) b!464800))

(assert (= (and b!464806 condMapEmpty!20770) mapIsEmpty!20770))

(assert (= (and b!464806 (not condMapEmpty!20770)) mapNonEmpty!20770))

(get-info :version)

(assert (= (and mapNonEmpty!20770 ((_ is ValueCellFull!6020) mapValue!20770)) b!464804))

(assert (= (and b!464806 ((_ is ValueCellFull!6020) mapDefault!20770)) b!464803))

(assert (= start!41632 b!464806))

(declare-fun m!446625 () Bool)

(assert (=> mapNonEmpty!20770 m!446625))

(declare-fun m!446627 () Bool)

(assert (=> start!41632 m!446627))

(declare-fun m!446629 () Bool)

(assert (=> start!41632 m!446629))

(declare-fun m!446631 () Bool)

(assert (=> start!41632 m!446631))

(declare-fun m!446633 () Bool)

(assert (=> b!464800 m!446633))

(declare-fun m!446635 () Bool)

(assert (=> b!464800 m!446635))

(declare-fun m!446637 () Bool)

(assert (=> b!464800 m!446637))

(declare-fun m!446639 () Bool)

(assert (=> b!464801 m!446639))

(declare-fun m!446641 () Bool)

(assert (=> b!464802 m!446641))

(check-sat (not start!41632) b_and!19621 (not b!464800) tp_is_empty!12727 (not b!464801) (not mapNonEmpty!20770) (not b!464802) (not b_next!11299))
(check-sat b_and!19621 (not b_next!11299))
