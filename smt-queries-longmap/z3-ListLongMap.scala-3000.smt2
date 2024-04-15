; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42304 () Bool)

(assert start!42304)

(declare-fun b_free!11809 () Bool)

(declare-fun b_next!11809 () Bool)

(assert (=> start!42304 (= b_free!11809 (not b_next!11809))))

(declare-fun tp!41457 () Bool)

(declare-fun b_and!20229 () Bool)

(assert (=> start!42304 (= tp!41457 b_and!20229)))

(declare-fun b!471861 () Bool)

(declare-fun e!276616 () Bool)

(declare-fun tp_is_empty!13237 () Bool)

(assert (=> b!471861 (= e!276616 tp_is_empty!13237)))

(declare-fun b!471862 () Bool)

(declare-fun e!276614 () Bool)

(assert (=> b!471862 (= e!276614 tp_is_empty!13237)))

(declare-fun b!471863 () Bool)

(declare-fun e!276619 () Bool)

(declare-fun mapRes!21565 () Bool)

(assert (=> b!471863 (= e!276619 (and e!276616 mapRes!21565))))

(declare-fun condMapEmpty!21565 () Bool)

(declare-datatypes ((V!18755 0))(
  ( (V!18756 (val!6663 Int)) )
))
(declare-datatypes ((ValueCell!6275 0))(
  ( (ValueCellFull!6275 (v!8948 V!18755)) (EmptyCell!6275) )
))
(declare-datatypes ((array!30219 0))(
  ( (array!30220 (arr!14530 (Array (_ BitVec 32) ValueCell!6275)) (size!14883 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30219)

(declare-fun mapDefault!21565 () ValueCell!6275)

(assert (=> b!471863 (= condMapEmpty!21565 (= (arr!14530 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6275)) mapDefault!21565)))))

(declare-fun b!471864 () Bool)

(declare-fun e!276617 () Bool)

(assert (=> b!471864 (= e!276617 true)))

(declare-fun minValueBefore!38 () V!18755)

(declare-fun zeroValue!794 () V!18755)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!30221 0))(
  ( (array!30222 (arr!14531 (Array (_ BitVec 32) (_ BitVec 64))) (size!14884 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30221)

(declare-datatypes ((tuple2!8810 0))(
  ( (tuple2!8811 (_1!4416 (_ BitVec 64)) (_2!4416 V!18755)) )
))
(declare-datatypes ((List!8884 0))(
  ( (Nil!8881) (Cons!8880 (h!9736 tuple2!8810) (t!14843 List!8884)) )
))
(declare-datatypes ((ListLongMap!7713 0))(
  ( (ListLongMap!7714 (toList!3872 List!8884)) )
))
(declare-fun lt!213958 () ListLongMap!7713)

(declare-fun getCurrentListMap!2180 (array!30221 array!30219 (_ BitVec 32) (_ BitVec 32) V!18755 V!18755 (_ BitVec 32) Int) ListLongMap!7713)

(assert (=> b!471864 (= lt!213958 (getCurrentListMap!2180 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21565 () Bool)

(declare-fun tp!41458 () Bool)

(assert (=> mapNonEmpty!21565 (= mapRes!21565 (and tp!41458 e!276614))))

(declare-fun mapRest!21565 () (Array (_ BitVec 32) ValueCell!6275))

(declare-fun mapValue!21565 () ValueCell!6275)

(declare-fun mapKey!21565 () (_ BitVec 32))

(assert (=> mapNonEmpty!21565 (= (arr!14530 _values!833) (store mapRest!21565 mapKey!21565 mapValue!21565))))

(declare-fun b!471865 () Bool)

(declare-fun e!276618 () Bool)

(assert (=> b!471865 (= e!276618 (not e!276617))))

(declare-fun res!281885 () Bool)

(assert (=> b!471865 (=> res!281885 e!276617)))

(assert (=> b!471865 (= res!281885 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!213957 () ListLongMap!7713)

(declare-fun lt!213959 () ListLongMap!7713)

(assert (=> b!471865 (= lt!213957 lt!213959)))

(declare-datatypes ((Unit!13845 0))(
  ( (Unit!13846) )
))
(declare-fun lt!213960 () Unit!13845)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18755)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!204 (array!30221 array!30219 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18755 V!18755 V!18755 V!18755 (_ BitVec 32) Int) Unit!13845)

(assert (=> b!471865 (= lt!213960 (lemmaNoChangeToArrayThenSameMapNoExtras!204 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2047 (array!30221 array!30219 (_ BitVec 32) (_ BitVec 32) V!18755 V!18755 (_ BitVec 32) Int) ListLongMap!7713)

(assert (=> b!471865 (= lt!213959 (getCurrentListMapNoExtraKeys!2047 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471865 (= lt!213957 (getCurrentListMapNoExtraKeys!2047 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471866 () Bool)

(declare-fun res!281886 () Bool)

(assert (=> b!471866 (=> (not res!281886) (not e!276618))))

(assert (=> b!471866 (= res!281886 (and (= (size!14883 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14884 _keys!1025) (size!14883 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471868 () Bool)

(declare-fun res!281887 () Bool)

(assert (=> b!471868 (=> (not res!281887) (not e!276618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30221 (_ BitVec 32)) Bool)

(assert (=> b!471868 (= res!281887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21565 () Bool)

(assert (=> mapIsEmpty!21565 mapRes!21565))

(declare-fun b!471867 () Bool)

(declare-fun res!281889 () Bool)

(assert (=> b!471867 (=> (not res!281889) (not e!276618))))

(declare-datatypes ((List!8885 0))(
  ( (Nil!8882) (Cons!8881 (h!9737 (_ BitVec 64)) (t!14844 List!8885)) )
))
(declare-fun arrayNoDuplicates!0 (array!30221 (_ BitVec 32) List!8885) Bool)

(assert (=> b!471867 (= res!281889 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8882))))

(declare-fun res!281888 () Bool)

(assert (=> start!42304 (=> (not res!281888) (not e!276618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42304 (= res!281888 (validMask!0 mask!1365))))

(assert (=> start!42304 e!276618))

(assert (=> start!42304 tp_is_empty!13237))

(assert (=> start!42304 tp!41457))

(assert (=> start!42304 true))

(declare-fun array_inv!10566 (array!30221) Bool)

(assert (=> start!42304 (array_inv!10566 _keys!1025)))

(declare-fun array_inv!10567 (array!30219) Bool)

(assert (=> start!42304 (and (array_inv!10567 _values!833) e!276619)))

(assert (= (and start!42304 res!281888) b!471866))

(assert (= (and b!471866 res!281886) b!471868))

(assert (= (and b!471868 res!281887) b!471867))

(assert (= (and b!471867 res!281889) b!471865))

(assert (= (and b!471865 (not res!281885)) b!471864))

(assert (= (and b!471863 condMapEmpty!21565) mapIsEmpty!21565))

(assert (= (and b!471863 (not condMapEmpty!21565)) mapNonEmpty!21565))

(get-info :version)

(assert (= (and mapNonEmpty!21565 ((_ is ValueCellFull!6275) mapValue!21565)) b!471862))

(assert (= (and b!471863 ((_ is ValueCellFull!6275) mapDefault!21565)) b!471861))

(assert (= start!42304 b!471863))

(declare-fun m!453423 () Bool)

(assert (=> b!471865 m!453423))

(declare-fun m!453425 () Bool)

(assert (=> b!471865 m!453425))

(declare-fun m!453427 () Bool)

(assert (=> b!471865 m!453427))

(declare-fun m!453429 () Bool)

(assert (=> b!471868 m!453429))

(declare-fun m!453431 () Bool)

(assert (=> mapNonEmpty!21565 m!453431))

(declare-fun m!453433 () Bool)

(assert (=> b!471867 m!453433))

(declare-fun m!453435 () Bool)

(assert (=> start!42304 m!453435))

(declare-fun m!453437 () Bool)

(assert (=> start!42304 m!453437))

(declare-fun m!453439 () Bool)

(assert (=> start!42304 m!453439))

(declare-fun m!453441 () Bool)

(assert (=> b!471864 m!453441))

(check-sat (not mapNonEmpty!21565) tp_is_empty!13237 (not b!471867) (not b!471868) b_and!20229 (not start!42304) (not b!471865) (not b_next!11809) (not b!471864))
(check-sat b_and!20229 (not b_next!11809))
