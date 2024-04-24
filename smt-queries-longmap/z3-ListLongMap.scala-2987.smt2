; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42198 () Bool)

(assert start!42198)

(declare-fun b_free!11731 () Bool)

(declare-fun b_next!11731 () Bool)

(assert (=> start!42198 (= b_free!11731 (not b_next!11731))))

(declare-fun tp!41217 () Bool)

(declare-fun b_and!20171 () Bool)

(assert (=> start!42198 (= tp!41217 b_and!20171)))

(declare-fun b!471080 () Bool)

(declare-fun res!281478 () Bool)

(declare-fun e!276056 () Bool)

(assert (=> b!471080 (=> (not res!281478) (not e!276056))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30068 0))(
  ( (array!30069 (arr!14456 (Array (_ BitVec 32) (_ BitVec 64))) (size!14808 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30068)

(declare-datatypes ((V!18651 0))(
  ( (V!18652 (val!6624 Int)) )
))
(declare-datatypes ((ValueCell!6236 0))(
  ( (ValueCellFull!6236 (v!8916 V!18651)) (EmptyCell!6236) )
))
(declare-datatypes ((array!30070 0))(
  ( (array!30071 (arr!14457 (Array (_ BitVec 32) ValueCell!6236)) (size!14809 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30070)

(assert (=> b!471080 (= res!281478 (and (= (size!14809 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14808 _keys!1025) (size!14809 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471081 () Bool)

(declare-fun res!281477 () Bool)

(assert (=> b!471081 (=> (not res!281477) (not e!276056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30068 (_ BitVec 32)) Bool)

(assert (=> b!471081 (= res!281477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21442 () Bool)

(declare-fun mapRes!21442 () Bool)

(assert (=> mapIsEmpty!21442 mapRes!21442))

(declare-fun b!471082 () Bool)

(declare-fun e!276053 () Bool)

(declare-fun tp_is_empty!13159 () Bool)

(assert (=> b!471082 (= e!276053 tp_is_empty!13159)))

(declare-fun b!471083 () Bool)

(assert (=> b!471083 (= e!276056 (not true))))

(declare-datatypes ((tuple2!8644 0))(
  ( (tuple2!8645 (_1!4333 (_ BitVec 64)) (_2!4333 V!18651)) )
))
(declare-datatypes ((List!8713 0))(
  ( (Nil!8710) (Cons!8709 (h!9565 tuple2!8644) (t!14669 List!8713)) )
))
(declare-datatypes ((ListLongMap!7559 0))(
  ( (ListLongMap!7560 (toList!3795 List!8713)) )
))
(declare-fun lt!213771 () ListLongMap!7559)

(declare-fun lt!213772 () ListLongMap!7559)

(assert (=> b!471083 (= lt!213771 lt!213772)))

(declare-fun minValueBefore!38 () V!18651)

(declare-fun zeroValue!794 () V!18651)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13803 0))(
  ( (Unit!13804) )
))
(declare-fun lt!213770 () Unit!13803)

(declare-fun minValueAfter!38 () V!18651)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!170 (array!30068 array!30070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18651 V!18651 V!18651 V!18651 (_ BitVec 32) Int) Unit!13803)

(assert (=> b!471083 (= lt!213770 (lemmaNoChangeToArrayThenSameMapNoExtras!170 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2010 (array!30068 array!30070 (_ BitVec 32) (_ BitVec 32) V!18651 V!18651 (_ BitVec 32) Int) ListLongMap!7559)

(assert (=> b!471083 (= lt!213772 (getCurrentListMapNoExtraKeys!2010 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471083 (= lt!213771 (getCurrentListMapNoExtraKeys!2010 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!281475 () Bool)

(assert (=> start!42198 (=> (not res!281475) (not e!276056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42198 (= res!281475 (validMask!0 mask!1365))))

(assert (=> start!42198 e!276056))

(assert (=> start!42198 tp_is_empty!13159))

(assert (=> start!42198 tp!41217))

(assert (=> start!42198 true))

(declare-fun array_inv!10520 (array!30068) Bool)

(assert (=> start!42198 (array_inv!10520 _keys!1025)))

(declare-fun e!276052 () Bool)

(declare-fun array_inv!10521 (array!30070) Bool)

(assert (=> start!42198 (and (array_inv!10521 _values!833) e!276052)))

(declare-fun b!471084 () Bool)

(declare-fun res!281476 () Bool)

(assert (=> b!471084 (=> (not res!281476) (not e!276056))))

(declare-datatypes ((List!8714 0))(
  ( (Nil!8711) (Cons!8710 (h!9566 (_ BitVec 64)) (t!14670 List!8714)) )
))
(declare-fun arrayNoDuplicates!0 (array!30068 (_ BitVec 32) List!8714) Bool)

(assert (=> b!471084 (= res!281476 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8711))))

(declare-fun b!471085 () Bool)

(declare-fun e!276054 () Bool)

(assert (=> b!471085 (= e!276054 tp_is_empty!13159)))

(declare-fun mapNonEmpty!21442 () Bool)

(declare-fun tp!41218 () Bool)

(assert (=> mapNonEmpty!21442 (= mapRes!21442 (and tp!41218 e!276053))))

(declare-fun mapRest!21442 () (Array (_ BitVec 32) ValueCell!6236))

(declare-fun mapValue!21442 () ValueCell!6236)

(declare-fun mapKey!21442 () (_ BitVec 32))

(assert (=> mapNonEmpty!21442 (= (arr!14457 _values!833) (store mapRest!21442 mapKey!21442 mapValue!21442))))

(declare-fun b!471086 () Bool)

(assert (=> b!471086 (= e!276052 (and e!276054 mapRes!21442))))

(declare-fun condMapEmpty!21442 () Bool)

(declare-fun mapDefault!21442 () ValueCell!6236)

(assert (=> b!471086 (= condMapEmpty!21442 (= (arr!14457 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6236)) mapDefault!21442)))))

(assert (= (and start!42198 res!281475) b!471080))

(assert (= (and b!471080 res!281478) b!471081))

(assert (= (and b!471081 res!281477) b!471084))

(assert (= (and b!471084 res!281476) b!471083))

(assert (= (and b!471086 condMapEmpty!21442) mapIsEmpty!21442))

(assert (= (and b!471086 (not condMapEmpty!21442)) mapNonEmpty!21442))

(get-info :version)

(assert (= (and mapNonEmpty!21442 ((_ is ValueCellFull!6236) mapValue!21442)) b!471082))

(assert (= (and b!471086 ((_ is ValueCellFull!6236) mapDefault!21442)) b!471085))

(assert (= start!42198 b!471086))

(declare-fun m!453505 () Bool)

(assert (=> b!471083 m!453505))

(declare-fun m!453507 () Bool)

(assert (=> b!471083 m!453507))

(declare-fun m!453509 () Bool)

(assert (=> b!471083 m!453509))

(declare-fun m!453511 () Bool)

(assert (=> b!471081 m!453511))

(declare-fun m!453513 () Bool)

(assert (=> mapNonEmpty!21442 m!453513))

(declare-fun m!453515 () Bool)

(assert (=> start!42198 m!453515))

(declare-fun m!453517 () Bool)

(assert (=> start!42198 m!453517))

(declare-fun m!453519 () Bool)

(assert (=> start!42198 m!453519))

(declare-fun m!453521 () Bool)

(assert (=> b!471084 m!453521))

(check-sat (not b!471084) (not b!471081) (not b!471083) tp_is_empty!13159 (not mapNonEmpty!21442) (not start!42198) b_and!20171 (not b_next!11731))
(check-sat b_and!20171 (not b_next!11731))
