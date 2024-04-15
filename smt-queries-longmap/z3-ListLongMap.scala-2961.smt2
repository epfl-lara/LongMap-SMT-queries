; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41988 () Bool)

(assert start!41988)

(declare-fun b_free!11575 () Bool)

(declare-fun b_next!11575 () Bool)

(assert (=> start!41988 (= b_free!11575 (not b_next!11575))))

(declare-fun tp!40741 () Bool)

(declare-fun b_and!19947 () Bool)

(assert (=> start!41988 (= tp!40741 b_and!19947)))

(declare-fun res!280128 () Bool)

(declare-fun e!274367 () Bool)

(assert (=> start!41988 (=> (not res!280128) (not e!274367))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41988 (= res!280128 (validMask!0 mask!1365))))

(assert (=> start!41988 e!274367))

(declare-fun tp_is_empty!13003 () Bool)

(assert (=> start!41988 tp_is_empty!13003))

(assert (=> start!41988 tp!40741))

(assert (=> start!41988 true))

(declare-datatypes ((array!29761 0))(
  ( (array!29762 (arr!14306 (Array (_ BitVec 32) (_ BitVec 64))) (size!14659 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29761)

(declare-fun array_inv!10406 (array!29761) Bool)

(assert (=> start!41988 (array_inv!10406 _keys!1025)))

(declare-datatypes ((V!18443 0))(
  ( (V!18444 (val!6546 Int)) )
))
(declare-datatypes ((ValueCell!6158 0))(
  ( (ValueCellFull!6158 (v!8829 V!18443)) (EmptyCell!6158) )
))
(declare-datatypes ((array!29763 0))(
  ( (array!29764 (arr!14307 (Array (_ BitVec 32) ValueCell!6158)) (size!14660 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29763)

(declare-fun e!274364 () Bool)

(declare-fun array_inv!10407 (array!29763) Bool)

(assert (=> start!41988 (and (array_inv!10407 _values!833) e!274364)))

(declare-fun b!468683 () Bool)

(declare-fun res!280129 () Bool)

(assert (=> b!468683 (=> (not res!280129) (not e!274367))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!468683 (= res!280129 (and (= (size!14660 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14659 _keys!1025) (size!14660 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468684 () Bool)

(declare-fun e!274362 () Bool)

(assert (=> b!468684 (= e!274362 tp_is_empty!13003)))

(declare-fun b!468685 () Bool)

(declare-fun e!274363 () Bool)

(assert (=> b!468685 (= e!274367 (not e!274363))))

(declare-fun res!280126 () Bool)

(assert (=> b!468685 (=> res!280126 e!274363)))

(assert (=> b!468685 (= res!280126 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8646 0))(
  ( (tuple2!8647 (_1!4334 (_ BitVec 64)) (_2!4334 V!18443)) )
))
(declare-datatypes ((List!8717 0))(
  ( (Nil!8714) (Cons!8713 (h!9569 tuple2!8646) (t!14666 List!8717)) )
))
(declare-datatypes ((ListLongMap!7549 0))(
  ( (ListLongMap!7550 (toList!3790 List!8717)) )
))
(declare-fun lt!212061 () ListLongMap!7549)

(declare-fun lt!212058 () ListLongMap!7549)

(assert (=> b!468685 (= lt!212061 lt!212058)))

(declare-fun minValueBefore!38 () V!18443)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13677 0))(
  ( (Unit!13678) )
))
(declare-fun lt!212057 () Unit!13677)

(declare-fun zeroValue!794 () V!18443)

(declare-fun minValueAfter!38 () V!18443)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!126 (array!29761 array!29763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18443 V!18443 V!18443 V!18443 (_ BitVec 32) Int) Unit!13677)

(assert (=> b!468685 (= lt!212057 (lemmaNoChangeToArrayThenSameMapNoExtras!126 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1969 (array!29761 array!29763 (_ BitVec 32) (_ BitVec 32) V!18443 V!18443 (_ BitVec 32) Int) ListLongMap!7549)

(assert (=> b!468685 (= lt!212058 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468685 (= lt!212061 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468686 () Bool)

(declare-fun res!280127 () Bool)

(assert (=> b!468686 (=> (not res!280127) (not e!274367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29761 (_ BitVec 32)) Bool)

(assert (=> b!468686 (= res!280127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468687 () Bool)

(declare-fun mapRes!21199 () Bool)

(assert (=> b!468687 (= e!274364 (and e!274362 mapRes!21199))))

(declare-fun condMapEmpty!21199 () Bool)

(declare-fun mapDefault!21199 () ValueCell!6158)

(assert (=> b!468687 (= condMapEmpty!21199 (= (arr!14307 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6158)) mapDefault!21199)))))

(declare-fun b!468688 () Bool)

(assert (=> b!468688 (= e!274363 true)))

(declare-fun lt!212056 () tuple2!8646)

(declare-fun +!1720 (ListLongMap!7549 tuple2!8646) ListLongMap!7549)

(assert (=> b!468688 (= (+!1720 lt!212061 lt!212056) (+!1720 (+!1720 lt!212061 (tuple2!8647 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212056))))

(assert (=> b!468688 (= lt!212056 (tuple2!8647 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212060 () Unit!13677)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!103 (ListLongMap!7549 (_ BitVec 64) V!18443 V!18443) Unit!13677)

(assert (=> b!468688 (= lt!212060 (addSameAsAddTwiceSameKeyDiffValues!103 lt!212061 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212062 () ListLongMap!7549)

(declare-fun getCurrentListMap!2156 (array!29761 array!29763 (_ BitVec 32) (_ BitVec 32) V!18443 V!18443 (_ BitVec 32) Int) ListLongMap!7549)

(assert (=> b!468688 (= lt!212062 (getCurrentListMap!2156 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212059 () ListLongMap!7549)

(assert (=> b!468688 (= lt!212059 (getCurrentListMap!2156 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21199 () Bool)

(assert (=> mapIsEmpty!21199 mapRes!21199))

(declare-fun mapNonEmpty!21199 () Bool)

(declare-fun tp!40740 () Bool)

(declare-fun e!274366 () Bool)

(assert (=> mapNonEmpty!21199 (= mapRes!21199 (and tp!40740 e!274366))))

(declare-fun mapRest!21199 () (Array (_ BitVec 32) ValueCell!6158))

(declare-fun mapValue!21199 () ValueCell!6158)

(declare-fun mapKey!21199 () (_ BitVec 32))

(assert (=> mapNonEmpty!21199 (= (arr!14307 _values!833) (store mapRest!21199 mapKey!21199 mapValue!21199))))

(declare-fun b!468689 () Bool)

(declare-fun res!280130 () Bool)

(assert (=> b!468689 (=> (not res!280130) (not e!274367))))

(declare-datatypes ((List!8718 0))(
  ( (Nil!8715) (Cons!8714 (h!9570 (_ BitVec 64)) (t!14667 List!8718)) )
))
(declare-fun arrayNoDuplicates!0 (array!29761 (_ BitVec 32) List!8718) Bool)

(assert (=> b!468689 (= res!280130 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8715))))

(declare-fun b!468690 () Bool)

(assert (=> b!468690 (= e!274366 tp_is_empty!13003)))

(assert (= (and start!41988 res!280128) b!468683))

(assert (= (and b!468683 res!280129) b!468686))

(assert (= (and b!468686 res!280127) b!468689))

(assert (= (and b!468689 res!280130) b!468685))

(assert (= (and b!468685 (not res!280126)) b!468688))

(assert (= (and b!468687 condMapEmpty!21199) mapIsEmpty!21199))

(assert (= (and b!468687 (not condMapEmpty!21199)) mapNonEmpty!21199))

(get-info :version)

(assert (= (and mapNonEmpty!21199 ((_ is ValueCellFull!6158) mapValue!21199)) b!468690))

(assert (= (and b!468687 ((_ is ValueCellFull!6158) mapDefault!21199)) b!468684))

(assert (= start!41988 b!468687))

(declare-fun m!450287 () Bool)

(assert (=> mapNonEmpty!21199 m!450287))

(declare-fun m!450289 () Bool)

(assert (=> start!41988 m!450289))

(declare-fun m!450291 () Bool)

(assert (=> start!41988 m!450291))

(declare-fun m!450293 () Bool)

(assert (=> start!41988 m!450293))

(declare-fun m!450295 () Bool)

(assert (=> b!468689 m!450295))

(declare-fun m!450297 () Bool)

(assert (=> b!468686 m!450297))

(declare-fun m!450299 () Bool)

(assert (=> b!468688 m!450299))

(declare-fun m!450301 () Bool)

(assert (=> b!468688 m!450301))

(assert (=> b!468688 m!450299))

(declare-fun m!450303 () Bool)

(assert (=> b!468688 m!450303))

(declare-fun m!450305 () Bool)

(assert (=> b!468688 m!450305))

(declare-fun m!450307 () Bool)

(assert (=> b!468688 m!450307))

(declare-fun m!450309 () Bool)

(assert (=> b!468688 m!450309))

(declare-fun m!450311 () Bool)

(assert (=> b!468685 m!450311))

(declare-fun m!450313 () Bool)

(assert (=> b!468685 m!450313))

(declare-fun m!450315 () Bool)

(assert (=> b!468685 m!450315))

(check-sat (not b!468686) (not start!41988) (not b!468689) (not b!468685) b_and!19947 tp_is_empty!13003 (not b!468688) (not b_next!11575) (not mapNonEmpty!21199))
(check-sat b_and!19947 (not b_next!11575))
