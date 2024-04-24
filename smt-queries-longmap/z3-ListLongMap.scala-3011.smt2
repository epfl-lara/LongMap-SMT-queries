; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42386 () Bool)

(assert start!42386)

(declare-fun b_free!11875 () Bool)

(declare-fun b_next!11875 () Bool)

(assert (=> start!42386 (= b_free!11875 (not b_next!11875))))

(declare-fun tp!41658 () Bool)

(declare-fun b_and!20341 () Bool)

(assert (=> start!42386 (= tp!41658 b_and!20341)))

(declare-fun mapIsEmpty!21667 () Bool)

(declare-fun mapRes!21667 () Bool)

(assert (=> mapIsEmpty!21667 mapRes!21667))

(declare-fun b!473011 () Bool)

(declare-fun e!277440 () Bool)

(assert (=> b!473011 (= e!277440 true)))

(declare-datatypes ((V!18843 0))(
  ( (V!18844 (val!6696 Int)) )
))
(declare-datatypes ((tuple2!8746 0))(
  ( (tuple2!8747 (_1!4384 (_ BitVec 64)) (_2!4384 V!18843)) )
))
(declare-datatypes ((List!8809 0))(
  ( (Nil!8806) (Cons!8805 (h!9661 tuple2!8746) (t!14771 List!8809)) )
))
(declare-datatypes ((ListLongMap!7661 0))(
  ( (ListLongMap!7662 (toList!3846 List!8809)) )
))
(declare-fun lt!214785 () ListLongMap!7661)

(declare-fun lt!214791 () tuple2!8746)

(declare-fun minValueBefore!38 () V!18843)

(declare-fun +!1732 (ListLongMap!7661 tuple2!8746) ListLongMap!7661)

(assert (=> b!473011 (= (+!1732 lt!214785 lt!214791) (+!1732 (+!1732 lt!214785 (tuple2!8747 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214791))))

(declare-fun minValueAfter!38 () V!18843)

(assert (=> b!473011 (= lt!214791 (tuple2!8747 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13896 0))(
  ( (Unit!13897) )
))
(declare-fun lt!214786 () Unit!13896)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!134 (ListLongMap!7661 (_ BitVec 64) V!18843 V!18843) Unit!13896)

(assert (=> b!473011 (= lt!214786 (addSameAsAddTwiceSameKeyDiffValues!134 lt!214785 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!214790 () ListLongMap!7661)

(declare-fun zeroValue!794 () V!18843)

(assert (=> b!473011 (= lt!214785 (+!1732 lt!214790 (tuple2!8747 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!214788 () ListLongMap!7661)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30346 0))(
  ( (array!30347 (arr!14592 (Array (_ BitVec 32) (_ BitVec 64))) (size!14944 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30346)

(declare-datatypes ((ValueCell!6308 0))(
  ( (ValueCellFull!6308 (v!8988 V!18843)) (EmptyCell!6308) )
))
(declare-datatypes ((array!30348 0))(
  ( (array!30349 (arr!14593 (Array (_ BitVec 32) ValueCell!6308)) (size!14945 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30348)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2212 (array!30346 array!30348 (_ BitVec 32) (_ BitVec 32) V!18843 V!18843 (_ BitVec 32) Int) ListLongMap!7661)

(assert (=> b!473011 (= lt!214788 (getCurrentListMap!2212 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214792 () ListLongMap!7661)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473011 (= lt!214792 (getCurrentListMap!2212 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473012 () Bool)

(declare-fun res!282563 () Bool)

(declare-fun e!277439 () Bool)

(assert (=> b!473012 (=> (not res!282563) (not e!277439))))

(declare-datatypes ((List!8810 0))(
  ( (Nil!8807) (Cons!8806 (h!9662 (_ BitVec 64)) (t!14772 List!8810)) )
))
(declare-fun arrayNoDuplicates!0 (array!30346 (_ BitVec 32) List!8810) Bool)

(assert (=> b!473012 (= res!282563 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8807))))

(declare-fun b!473013 () Bool)

(assert (=> b!473013 (= e!277439 (not e!277440))))

(declare-fun res!282564 () Bool)

(assert (=> b!473013 (=> res!282564 e!277440)))

(assert (=> b!473013 (= res!282564 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214787 () ListLongMap!7661)

(assert (=> b!473013 (= lt!214790 lt!214787)))

(declare-fun lt!214789 () Unit!13896)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!216 (array!30346 array!30348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18843 V!18843 V!18843 V!18843 (_ BitVec 32) Int) Unit!13896)

(assert (=> b!473013 (= lt!214789 (lemmaNoChangeToArrayThenSameMapNoExtras!216 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2056 (array!30346 array!30348 (_ BitVec 32) (_ BitVec 32) V!18843 V!18843 (_ BitVec 32) Int) ListLongMap!7661)

(assert (=> b!473013 (= lt!214787 (getCurrentListMapNoExtraKeys!2056 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473013 (= lt!214790 (getCurrentListMapNoExtraKeys!2056 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473014 () Bool)

(declare-fun e!277437 () Bool)

(declare-fun e!277441 () Bool)

(assert (=> b!473014 (= e!277437 (and e!277441 mapRes!21667))))

(declare-fun condMapEmpty!21667 () Bool)

(declare-fun mapDefault!21667 () ValueCell!6308)

(assert (=> b!473014 (= condMapEmpty!21667 (= (arr!14593 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6308)) mapDefault!21667)))))

(declare-fun b!473015 () Bool)

(declare-fun res!282562 () Bool)

(assert (=> b!473015 (=> (not res!282562) (not e!277439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30346 (_ BitVec 32)) Bool)

(assert (=> b!473015 (= res!282562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21667 () Bool)

(declare-fun tp!41659 () Bool)

(declare-fun e!277442 () Bool)

(assert (=> mapNonEmpty!21667 (= mapRes!21667 (and tp!41659 e!277442))))

(declare-fun mapValue!21667 () ValueCell!6308)

(declare-fun mapRest!21667 () (Array (_ BitVec 32) ValueCell!6308))

(declare-fun mapKey!21667 () (_ BitVec 32))

(assert (=> mapNonEmpty!21667 (= (arr!14593 _values!833) (store mapRest!21667 mapKey!21667 mapValue!21667))))

(declare-fun res!282561 () Bool)

(assert (=> start!42386 (=> (not res!282561) (not e!277439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42386 (= res!282561 (validMask!0 mask!1365))))

(assert (=> start!42386 e!277439))

(declare-fun tp_is_empty!13303 () Bool)

(assert (=> start!42386 tp_is_empty!13303))

(assert (=> start!42386 tp!41658))

(assert (=> start!42386 true))

(declare-fun array_inv!10608 (array!30346) Bool)

(assert (=> start!42386 (array_inv!10608 _keys!1025)))

(declare-fun array_inv!10609 (array!30348) Bool)

(assert (=> start!42386 (and (array_inv!10609 _values!833) e!277437)))

(declare-fun b!473016 () Bool)

(assert (=> b!473016 (= e!277441 tp_is_empty!13303)))

(declare-fun b!473017 () Bool)

(assert (=> b!473017 (= e!277442 tp_is_empty!13303)))

(declare-fun b!473018 () Bool)

(declare-fun res!282560 () Bool)

(assert (=> b!473018 (=> (not res!282560) (not e!277439))))

(assert (=> b!473018 (= res!282560 (and (= (size!14945 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14944 _keys!1025) (size!14945 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42386 res!282561) b!473018))

(assert (= (and b!473018 res!282560) b!473015))

(assert (= (and b!473015 res!282562) b!473012))

(assert (= (and b!473012 res!282563) b!473013))

(assert (= (and b!473013 (not res!282564)) b!473011))

(assert (= (and b!473014 condMapEmpty!21667) mapIsEmpty!21667))

(assert (= (and b!473014 (not condMapEmpty!21667)) mapNonEmpty!21667))

(get-info :version)

(assert (= (and mapNonEmpty!21667 ((_ is ValueCellFull!6308) mapValue!21667)) b!473017))

(assert (= (and b!473014 ((_ is ValueCellFull!6308) mapDefault!21667)) b!473016))

(assert (= start!42386 b!473014))

(declare-fun m!455183 () Bool)

(assert (=> b!473012 m!455183))

(declare-fun m!455185 () Bool)

(assert (=> b!473011 m!455185))

(declare-fun m!455187 () Bool)

(assert (=> b!473011 m!455187))

(declare-fun m!455189 () Bool)

(assert (=> b!473011 m!455189))

(declare-fun m!455191 () Bool)

(assert (=> b!473011 m!455191))

(assert (=> b!473011 m!455185))

(declare-fun m!455193 () Bool)

(assert (=> b!473011 m!455193))

(declare-fun m!455195 () Bool)

(assert (=> b!473011 m!455195))

(declare-fun m!455197 () Bool)

(assert (=> b!473011 m!455197))

(declare-fun m!455199 () Bool)

(assert (=> b!473015 m!455199))

(declare-fun m!455201 () Bool)

(assert (=> mapNonEmpty!21667 m!455201))

(declare-fun m!455203 () Bool)

(assert (=> b!473013 m!455203))

(declare-fun m!455205 () Bool)

(assert (=> b!473013 m!455205))

(declare-fun m!455207 () Bool)

(assert (=> b!473013 m!455207))

(declare-fun m!455209 () Bool)

(assert (=> start!42386 m!455209))

(declare-fun m!455211 () Bool)

(assert (=> start!42386 m!455211))

(declare-fun m!455213 () Bool)

(assert (=> start!42386 m!455213))

(check-sat tp_is_empty!13303 (not b!473011) (not b!473013) (not b_next!11875) (not mapNonEmpty!21667) (not b!473015) (not b!473012) b_and!20341 (not start!42386))
(check-sat b_and!20341 (not b_next!11875))
