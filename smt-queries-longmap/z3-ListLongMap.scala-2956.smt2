; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41974 () Bool)

(assert start!41974)

(declare-fun b_free!11547 () Bool)

(declare-fun b_next!11547 () Bool)

(assert (=> start!41974 (= b_free!11547 (not b_next!11547))))

(declare-fun tp!40657 () Bool)

(declare-fun b_and!19945 () Bool)

(assert (=> start!41974 (= tp!40657 b_and!19945)))

(declare-fun res!280045 () Bool)

(declare-fun e!274287 () Bool)

(assert (=> start!41974 (=> (not res!280045) (not e!274287))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41974 (= res!280045 (validMask!0 mask!1365))))

(assert (=> start!41974 e!274287))

(declare-fun tp_is_empty!12975 () Bool)

(assert (=> start!41974 tp_is_empty!12975))

(assert (=> start!41974 tp!40657))

(assert (=> start!41974 true))

(declare-datatypes ((array!29727 0))(
  ( (array!29728 (arr!14289 (Array (_ BitVec 32) (_ BitVec 64))) (size!14641 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29727)

(declare-fun array_inv!10316 (array!29727) Bool)

(assert (=> start!41974 (array_inv!10316 _keys!1025)))

(declare-datatypes ((V!18405 0))(
  ( (V!18406 (val!6532 Int)) )
))
(declare-datatypes ((ValueCell!6144 0))(
  ( (ValueCellFull!6144 (v!8821 V!18405)) (EmptyCell!6144) )
))
(declare-datatypes ((array!29729 0))(
  ( (array!29730 (arr!14290 (Array (_ BitVec 32) ValueCell!6144)) (size!14642 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29729)

(declare-fun e!274285 () Bool)

(declare-fun array_inv!10317 (array!29729) Bool)

(assert (=> start!41974 (and (array_inv!10317 _values!833) e!274285)))

(declare-fun b!468618 () Bool)

(declare-fun e!274288 () Bool)

(assert (=> b!468618 (= e!274288 tp_is_empty!12975)))

(declare-fun b!468619 () Bool)

(declare-fun e!274284 () Bool)

(assert (=> b!468619 (= e!274284 tp_is_empty!12975)))

(declare-fun b!468620 () Bool)

(declare-fun res!280046 () Bool)

(assert (=> b!468620 (=> (not res!280046) (not e!274287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29727 (_ BitVec 32)) Bool)

(assert (=> b!468620 (= res!280046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21157 () Bool)

(declare-fun mapRes!21157 () Bool)

(declare-fun tp!40656 () Bool)

(assert (=> mapNonEmpty!21157 (= mapRes!21157 (and tp!40656 e!274288))))

(declare-fun mapKey!21157 () (_ BitVec 32))

(declare-fun mapValue!21157 () ValueCell!6144)

(declare-fun mapRest!21157 () (Array (_ BitVec 32) ValueCell!6144))

(assert (=> mapNonEmpty!21157 (= (arr!14290 _values!833) (store mapRest!21157 mapKey!21157 mapValue!21157))))

(declare-fun b!468621 () Bool)

(declare-fun res!280049 () Bool)

(assert (=> b!468621 (=> (not res!280049) (not e!274287))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!468621 (= res!280049 (and (= (size!14642 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14641 _keys!1025) (size!14642 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468622 () Bool)

(declare-fun e!274289 () Bool)

(assert (=> b!468622 (= e!274287 (not e!274289))))

(declare-fun res!280047 () Bool)

(assert (=> b!468622 (=> res!280047 e!274289)))

(assert (=> b!468622 (= res!280047 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8588 0))(
  ( (tuple2!8589 (_1!4305 (_ BitVec 64)) (_2!4305 V!18405)) )
))
(declare-datatypes ((List!8673 0))(
  ( (Nil!8670) (Cons!8669 (h!9525 tuple2!8588) (t!14631 List!8673)) )
))
(declare-datatypes ((ListLongMap!7501 0))(
  ( (ListLongMap!7502 (toList!3766 List!8673)) )
))
(declare-fun lt!212000 () ListLongMap!7501)

(declare-fun lt!211997 () ListLongMap!7501)

(assert (=> b!468622 (= lt!212000 lt!211997)))

(declare-fun minValueBefore!38 () V!18405)

(declare-fun zeroValue!794 () V!18405)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13687 0))(
  ( (Unit!13688) )
))
(declare-fun lt!211996 () Unit!13687)

(declare-fun minValueAfter!38 () V!18405)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!116 (array!29727 array!29729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18405 V!18405 V!18405 V!18405 (_ BitVec 32) Int) Unit!13687)

(assert (=> b!468622 (= lt!211996 (lemmaNoChangeToArrayThenSameMapNoExtras!116 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1936 (array!29727 array!29729 (_ BitVec 32) (_ BitVec 32) V!18405 V!18405 (_ BitVec 32) Int) ListLongMap!7501)

(assert (=> b!468622 (= lt!211997 (getCurrentListMapNoExtraKeys!1936 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468622 (= lt!212000 (getCurrentListMapNoExtraKeys!1936 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468623 () Bool)

(assert (=> b!468623 (= e!274285 (and e!274284 mapRes!21157))))

(declare-fun condMapEmpty!21157 () Bool)

(declare-fun mapDefault!21157 () ValueCell!6144)

(assert (=> b!468623 (= condMapEmpty!21157 (= (arr!14290 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6144)) mapDefault!21157)))))

(declare-fun b!468624 () Bool)

(declare-fun res!280048 () Bool)

(assert (=> b!468624 (=> (not res!280048) (not e!274287))))

(declare-datatypes ((List!8674 0))(
  ( (Nil!8671) (Cons!8670 (h!9526 (_ BitVec 64)) (t!14632 List!8674)) )
))
(declare-fun arrayNoDuplicates!0 (array!29727 (_ BitVec 32) List!8674) Bool)

(assert (=> b!468624 (= res!280048 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8671))))

(declare-fun b!468625 () Bool)

(assert (=> b!468625 (= e!274289 true)))

(declare-fun lt!211999 () tuple2!8588)

(declare-fun +!1678 (ListLongMap!7501 tuple2!8588) ListLongMap!7501)

(assert (=> b!468625 (= (+!1678 lt!212000 lt!211999) (+!1678 (+!1678 lt!212000 (tuple2!8589 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!211999))))

(assert (=> b!468625 (= lt!211999 (tuple2!8589 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!211998 () Unit!13687)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!91 (ListLongMap!7501 (_ BitVec 64) V!18405 V!18405) Unit!13687)

(assert (=> b!468625 (= lt!211998 (addSameAsAddTwiceSameKeyDiffValues!91 lt!212000 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212001 () ListLongMap!7501)

(declare-fun getCurrentListMap!2192 (array!29727 array!29729 (_ BitVec 32) (_ BitVec 32) V!18405 V!18405 (_ BitVec 32) Int) ListLongMap!7501)

(assert (=> b!468625 (= lt!212001 (getCurrentListMap!2192 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212002 () ListLongMap!7501)

(assert (=> b!468625 (= lt!212002 (getCurrentListMap!2192 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21157 () Bool)

(assert (=> mapIsEmpty!21157 mapRes!21157))

(assert (= (and start!41974 res!280045) b!468621))

(assert (= (and b!468621 res!280049) b!468620))

(assert (= (and b!468620 res!280046) b!468624))

(assert (= (and b!468624 res!280048) b!468622))

(assert (= (and b!468622 (not res!280047)) b!468625))

(assert (= (and b!468623 condMapEmpty!21157) mapIsEmpty!21157))

(assert (= (and b!468623 (not condMapEmpty!21157)) mapNonEmpty!21157))

(get-info :version)

(assert (= (and mapNonEmpty!21157 ((_ is ValueCellFull!6144) mapValue!21157)) b!468618))

(assert (= (and b!468623 ((_ is ValueCellFull!6144) mapDefault!21157)) b!468619))

(assert (= start!41974 b!468623))

(declare-fun m!450601 () Bool)

(assert (=> b!468620 m!450601))

(declare-fun m!450603 () Bool)

(assert (=> start!41974 m!450603))

(declare-fun m!450605 () Bool)

(assert (=> start!41974 m!450605))

(declare-fun m!450607 () Bool)

(assert (=> start!41974 m!450607))

(declare-fun m!450609 () Bool)

(assert (=> mapNonEmpty!21157 m!450609))

(declare-fun m!450611 () Bool)

(assert (=> b!468625 m!450611))

(assert (=> b!468625 m!450611))

(declare-fun m!450613 () Bool)

(assert (=> b!468625 m!450613))

(declare-fun m!450615 () Bool)

(assert (=> b!468625 m!450615))

(declare-fun m!450617 () Bool)

(assert (=> b!468625 m!450617))

(declare-fun m!450619 () Bool)

(assert (=> b!468625 m!450619))

(declare-fun m!450621 () Bool)

(assert (=> b!468625 m!450621))

(declare-fun m!450623 () Bool)

(assert (=> b!468622 m!450623))

(declare-fun m!450625 () Bool)

(assert (=> b!468622 m!450625))

(declare-fun m!450627 () Bool)

(assert (=> b!468622 m!450627))

(declare-fun m!450629 () Bool)

(assert (=> b!468624 m!450629))

(check-sat (not b!468625) b_and!19945 (not b!468622) tp_is_empty!12975 (not b!468620) (not start!41974) (not b!468624) (not b_next!11547) (not mapNonEmpty!21157))
(check-sat b_and!19945 (not b_next!11547))
