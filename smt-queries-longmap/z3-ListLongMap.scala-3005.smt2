; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42334 () Bool)

(assert start!42334)

(declare-fun b_free!11839 () Bool)

(declare-fun b_next!11839 () Bool)

(assert (=> start!42334 (= b_free!11839 (not b_next!11839))))

(declare-fun tp!41548 () Bool)

(declare-fun b_and!20295 () Bool)

(assert (=> start!42334 (= tp!41548 b_and!20295)))

(declare-fun mapIsEmpty!21610 () Bool)

(declare-fun mapRes!21610 () Bool)

(assert (=> mapIsEmpty!21610 mapRes!21610))

(declare-fun b!472432 () Bool)

(declare-fun res!282233 () Bool)

(declare-fun e!277023 () Bool)

(assert (=> b!472432 (=> (not res!282233) (not e!277023))))

(declare-datatypes ((array!30280 0))(
  ( (array!30281 (arr!14560 (Array (_ BitVec 32) (_ BitVec 64))) (size!14912 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30280)

(declare-datatypes ((List!8785 0))(
  ( (Nil!8782) (Cons!8781 (h!9637 (_ BitVec 64)) (t!14745 List!8785)) )
))
(declare-fun arrayNoDuplicates!0 (array!30280 (_ BitVec 32) List!8785) Bool)

(assert (=> b!472432 (= res!282233 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8782))))

(declare-fun b!472433 () Bool)

(declare-fun e!277021 () Bool)

(declare-fun tp_is_empty!13267 () Bool)

(assert (=> b!472433 (= e!277021 tp_is_empty!13267)))

(declare-fun b!472434 () Bool)

(declare-fun e!277019 () Bool)

(assert (=> b!472434 (= e!277019 (and e!277021 mapRes!21610))))

(declare-fun condMapEmpty!21610 () Bool)

(declare-datatypes ((V!18795 0))(
  ( (V!18796 (val!6678 Int)) )
))
(declare-datatypes ((ValueCell!6290 0))(
  ( (ValueCellFull!6290 (v!8970 V!18795)) (EmptyCell!6290) )
))
(declare-datatypes ((array!30282 0))(
  ( (array!30283 (arr!14561 (Array (_ BitVec 32) ValueCell!6290)) (size!14913 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30282)

(declare-fun mapDefault!21610 () ValueCell!6290)

(assert (=> b!472434 (= condMapEmpty!21610 (= (arr!14561 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6290)) mapDefault!21610)))))

(declare-fun b!472435 () Bool)

(declare-fun res!282232 () Bool)

(assert (=> b!472435 (=> (not res!282232) (not e!277023))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472435 (= res!282232 (and (= (size!14913 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14912 _keys!1025) (size!14913 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472436 () Bool)

(declare-fun e!277020 () Bool)

(assert (=> b!472436 (= e!277023 (not e!277020))))

(declare-fun res!282235 () Bool)

(assert (=> b!472436 (=> res!282235 e!277020)))

(assert (=> b!472436 (= res!282235 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8720 0))(
  ( (tuple2!8721 (_1!4371 (_ BitVec 64)) (_2!4371 V!18795)) )
))
(declare-datatypes ((List!8786 0))(
  ( (Nil!8783) (Cons!8782 (h!9638 tuple2!8720) (t!14746 List!8786)) )
))
(declare-datatypes ((ListLongMap!7635 0))(
  ( (ListLongMap!7636 (toList!3833 List!8786)) )
))
(declare-fun lt!214386 () ListLongMap!7635)

(declare-fun lt!214384 () ListLongMap!7635)

(assert (=> b!472436 (= lt!214386 lt!214384)))

(declare-fun minValueBefore!38 () V!18795)

(declare-fun zeroValue!794 () V!18795)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18795)

(declare-datatypes ((Unit!13873 0))(
  ( (Unit!13874) )
))
(declare-fun lt!214383 () Unit!13873)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!205 (array!30280 array!30282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18795 V!18795 V!18795 V!18795 (_ BitVec 32) Int) Unit!13873)

(assert (=> b!472436 (= lt!214383 (lemmaNoChangeToArrayThenSameMapNoExtras!205 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2045 (array!30280 array!30282 (_ BitVec 32) (_ BitVec 32) V!18795 V!18795 (_ BitVec 32) Int) ListLongMap!7635)

(assert (=> b!472436 (= lt!214384 (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472436 (= lt!214386 (getCurrentListMapNoExtraKeys!2045 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472437 () Bool)

(assert (=> b!472437 (= e!277020 true)))

(declare-fun lt!214385 () ListLongMap!7635)

(declare-fun getCurrentListMap!2201 (array!30280 array!30282 (_ BitVec 32) (_ BitVec 32) V!18795 V!18795 (_ BitVec 32) Int) ListLongMap!7635)

(assert (=> b!472437 (= lt!214385 (getCurrentListMap!2201 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282234 () Bool)

(assert (=> start!42334 (=> (not res!282234) (not e!277023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42334 (= res!282234 (validMask!0 mask!1365))))

(assert (=> start!42334 e!277023))

(assert (=> start!42334 tp_is_empty!13267))

(assert (=> start!42334 tp!41548))

(assert (=> start!42334 true))

(declare-fun array_inv!10588 (array!30280) Bool)

(assert (=> start!42334 (array_inv!10588 _keys!1025)))

(declare-fun array_inv!10589 (array!30282) Bool)

(assert (=> start!42334 (and (array_inv!10589 _values!833) e!277019)))

(declare-fun b!472431 () Bool)

(declare-fun e!277024 () Bool)

(assert (=> b!472431 (= e!277024 tp_is_empty!13267)))

(declare-fun mapNonEmpty!21610 () Bool)

(declare-fun tp!41547 () Bool)

(assert (=> mapNonEmpty!21610 (= mapRes!21610 (and tp!41547 e!277024))))

(declare-fun mapKey!21610 () (_ BitVec 32))

(declare-fun mapValue!21610 () ValueCell!6290)

(declare-fun mapRest!21610 () (Array (_ BitVec 32) ValueCell!6290))

(assert (=> mapNonEmpty!21610 (= (arr!14561 _values!833) (store mapRest!21610 mapKey!21610 mapValue!21610))))

(declare-fun b!472438 () Bool)

(declare-fun res!282236 () Bool)

(assert (=> b!472438 (=> (not res!282236) (not e!277023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30280 (_ BitVec 32)) Bool)

(assert (=> b!472438 (= res!282236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42334 res!282234) b!472435))

(assert (= (and b!472435 res!282232) b!472438))

(assert (= (and b!472438 res!282236) b!472432))

(assert (= (and b!472432 res!282233) b!472436))

(assert (= (and b!472436 (not res!282235)) b!472437))

(assert (= (and b!472434 condMapEmpty!21610) mapIsEmpty!21610))

(assert (= (and b!472434 (not condMapEmpty!21610)) mapNonEmpty!21610))

(get-info :version)

(assert (= (and mapNonEmpty!21610 ((_ is ValueCellFull!6290) mapValue!21610)) b!472431))

(assert (= (and b!472434 ((_ is ValueCellFull!6290) mapDefault!21610)) b!472433))

(assert (= start!42334 b!472434))

(declare-fun m!454639 () Bool)

(assert (=> mapNonEmpty!21610 m!454639))

(declare-fun m!454641 () Bool)

(assert (=> b!472437 m!454641))

(declare-fun m!454643 () Bool)

(assert (=> b!472438 m!454643))

(declare-fun m!454645 () Bool)

(assert (=> b!472432 m!454645))

(declare-fun m!454647 () Bool)

(assert (=> start!42334 m!454647))

(declare-fun m!454649 () Bool)

(assert (=> start!42334 m!454649))

(declare-fun m!454651 () Bool)

(assert (=> start!42334 m!454651))

(declare-fun m!454653 () Bool)

(assert (=> b!472436 m!454653))

(declare-fun m!454655 () Bool)

(assert (=> b!472436 m!454655))

(declare-fun m!454657 () Bool)

(assert (=> b!472436 m!454657))

(check-sat (not b!472437) (not b!472438) (not b!472432) (not mapNonEmpty!21610) (not b!472436) tp_is_empty!13267 (not b_next!11839) b_and!20295 (not start!42334))
(check-sat b_and!20295 (not b_next!11839))
