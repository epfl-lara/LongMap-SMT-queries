; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42398 () Bool)

(assert start!42398)

(declare-fun b_free!11887 () Bool)

(declare-fun b_next!11887 () Bool)

(assert (=> start!42398 (= b_free!11887 (not b_next!11887))))

(declare-fun tp!41694 () Bool)

(declare-fun b_and!20353 () Bool)

(assert (=> start!42398 (= tp!41694 b_and!20353)))

(declare-fun b!473155 () Bool)

(declare-fun e!277550 () Bool)

(declare-fun tp_is_empty!13315 () Bool)

(assert (=> b!473155 (= e!277550 tp_is_empty!13315)))

(declare-fun res!282653 () Bool)

(declare-fun e!277545 () Bool)

(assert (=> start!42398 (=> (not res!282653) (not e!277545))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42398 (= res!282653 (validMask!0 mask!1365))))

(assert (=> start!42398 e!277545))

(assert (=> start!42398 tp_is_empty!13315))

(assert (=> start!42398 tp!41694))

(assert (=> start!42398 true))

(declare-datatypes ((array!30368 0))(
  ( (array!30369 (arr!14603 (Array (_ BitVec 32) (_ BitVec 64))) (size!14955 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30368)

(declare-fun array_inv!10616 (array!30368) Bool)

(assert (=> start!42398 (array_inv!10616 _keys!1025)))

(declare-datatypes ((V!18859 0))(
  ( (V!18860 (val!6702 Int)) )
))
(declare-datatypes ((ValueCell!6314 0))(
  ( (ValueCellFull!6314 (v!8994 V!18859)) (EmptyCell!6314) )
))
(declare-datatypes ((array!30370 0))(
  ( (array!30371 (arr!14604 (Array (_ BitVec 32) ValueCell!6314)) (size!14956 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30370)

(declare-fun e!277549 () Bool)

(declare-fun array_inv!10617 (array!30370) Bool)

(assert (=> start!42398 (and (array_inv!10617 _values!833) e!277549)))

(declare-fun b!473156 () Bool)

(declare-fun e!277548 () Bool)

(assert (=> b!473156 (= e!277548 tp_is_empty!13315)))

(declare-fun mapIsEmpty!21685 () Bool)

(declare-fun mapRes!21685 () Bool)

(assert (=> mapIsEmpty!21685 mapRes!21685))

(declare-fun b!473157 () Bool)

(declare-fun e!277547 () Bool)

(assert (=> b!473157 (= e!277547 true)))

(declare-datatypes ((tuple2!8756 0))(
  ( (tuple2!8757 (_1!4389 (_ BitVec 64)) (_2!4389 V!18859)) )
))
(declare-datatypes ((List!8819 0))(
  ( (Nil!8816) (Cons!8815 (h!9671 tuple2!8756) (t!14781 List!8819)) )
))
(declare-datatypes ((ListLongMap!7671 0))(
  ( (ListLongMap!7672 (toList!3851 List!8819)) )
))
(declare-fun lt!214936 () ListLongMap!7671)

(declare-fun lt!214934 () tuple2!8756)

(declare-fun minValueBefore!38 () V!18859)

(declare-fun +!1737 (ListLongMap!7671 tuple2!8756) ListLongMap!7671)

(assert (=> b!473157 (= (+!1737 lt!214936 lt!214934) (+!1737 (+!1737 lt!214936 (tuple2!8757 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214934))))

(declare-fun minValueAfter!38 () V!18859)

(assert (=> b!473157 (= lt!214934 (tuple2!8757 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13906 0))(
  ( (Unit!13907) )
))
(declare-fun lt!214932 () Unit!13906)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!139 (ListLongMap!7671 (_ BitVec 64) V!18859 V!18859) Unit!13906)

(assert (=> b!473157 (= lt!214932 (addSameAsAddTwiceSameKeyDiffValues!139 lt!214936 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!214931 () ListLongMap!7671)

(declare-fun zeroValue!794 () V!18859)

(assert (=> b!473157 (= lt!214936 (+!1737 lt!214931 (tuple2!8757 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!214930 () ListLongMap!7671)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2217 (array!30368 array!30370 (_ BitVec 32) (_ BitVec 32) V!18859 V!18859 (_ BitVec 32) Int) ListLongMap!7671)

(assert (=> b!473157 (= lt!214930 (getCurrentListMap!2217 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!214933 () ListLongMap!7671)

(assert (=> b!473157 (= lt!214933 (getCurrentListMap!2217 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473158 () Bool)

(declare-fun res!282652 () Bool)

(assert (=> b!473158 (=> (not res!282652) (not e!277545))))

(assert (=> b!473158 (= res!282652 (and (= (size!14956 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14955 _keys!1025) (size!14956 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473159 () Bool)

(assert (=> b!473159 (= e!277549 (and e!277550 mapRes!21685))))

(declare-fun condMapEmpty!21685 () Bool)

(declare-fun mapDefault!21685 () ValueCell!6314)

(assert (=> b!473159 (= condMapEmpty!21685 (= (arr!14604 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6314)) mapDefault!21685)))))

(declare-fun b!473160 () Bool)

(declare-fun res!282654 () Bool)

(assert (=> b!473160 (=> (not res!282654) (not e!277545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30368 (_ BitVec 32)) Bool)

(assert (=> b!473160 (= res!282654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473161 () Bool)

(assert (=> b!473161 (= e!277545 (not e!277547))))

(declare-fun res!282651 () Bool)

(assert (=> b!473161 (=> res!282651 e!277547)))

(assert (=> b!473161 (= res!282651 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214929 () ListLongMap!7671)

(assert (=> b!473161 (= lt!214931 lt!214929)))

(declare-fun lt!214935 () Unit!13906)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!220 (array!30368 array!30370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18859 V!18859 V!18859 V!18859 (_ BitVec 32) Int) Unit!13906)

(assert (=> b!473161 (= lt!214935 (lemmaNoChangeToArrayThenSameMapNoExtras!220 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2060 (array!30368 array!30370 (_ BitVec 32) (_ BitVec 32) V!18859 V!18859 (_ BitVec 32) Int) ListLongMap!7671)

(assert (=> b!473161 (= lt!214929 (getCurrentListMapNoExtraKeys!2060 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473161 (= lt!214931 (getCurrentListMapNoExtraKeys!2060 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473162 () Bool)

(declare-fun res!282650 () Bool)

(assert (=> b!473162 (=> (not res!282650) (not e!277545))))

(declare-datatypes ((List!8820 0))(
  ( (Nil!8817) (Cons!8816 (h!9672 (_ BitVec 64)) (t!14782 List!8820)) )
))
(declare-fun arrayNoDuplicates!0 (array!30368 (_ BitVec 32) List!8820) Bool)

(assert (=> b!473162 (= res!282650 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8817))))

(declare-fun mapNonEmpty!21685 () Bool)

(declare-fun tp!41695 () Bool)

(assert (=> mapNonEmpty!21685 (= mapRes!21685 (and tp!41695 e!277548))))

(declare-fun mapValue!21685 () ValueCell!6314)

(declare-fun mapRest!21685 () (Array (_ BitVec 32) ValueCell!6314))

(declare-fun mapKey!21685 () (_ BitVec 32))

(assert (=> mapNonEmpty!21685 (= (arr!14604 _values!833) (store mapRest!21685 mapKey!21685 mapValue!21685))))

(assert (= (and start!42398 res!282653) b!473158))

(assert (= (and b!473158 res!282652) b!473160))

(assert (= (and b!473160 res!282654) b!473162))

(assert (= (and b!473162 res!282650) b!473161))

(assert (= (and b!473161 (not res!282651)) b!473157))

(assert (= (and b!473159 condMapEmpty!21685) mapIsEmpty!21685))

(assert (= (and b!473159 (not condMapEmpty!21685)) mapNonEmpty!21685))

(get-info :version)

(assert (= (and mapNonEmpty!21685 ((_ is ValueCellFull!6314) mapValue!21685)) b!473156))

(assert (= (and b!473159 ((_ is ValueCellFull!6314) mapDefault!21685)) b!473155))

(assert (= start!42398 b!473159))

(declare-fun m!455375 () Bool)

(assert (=> b!473162 m!455375))

(declare-fun m!455377 () Bool)

(assert (=> b!473157 m!455377))

(declare-fun m!455379 () Bool)

(assert (=> b!473157 m!455379))

(declare-fun m!455381 () Bool)

(assert (=> b!473157 m!455381))

(declare-fun m!455383 () Bool)

(assert (=> b!473157 m!455383))

(assert (=> b!473157 m!455381))

(declare-fun m!455385 () Bool)

(assert (=> b!473157 m!455385))

(declare-fun m!455387 () Bool)

(assert (=> b!473157 m!455387))

(declare-fun m!455389 () Bool)

(assert (=> b!473157 m!455389))

(declare-fun m!455391 () Bool)

(assert (=> start!42398 m!455391))

(declare-fun m!455393 () Bool)

(assert (=> start!42398 m!455393))

(declare-fun m!455395 () Bool)

(assert (=> start!42398 m!455395))

(declare-fun m!455397 () Bool)

(assert (=> mapNonEmpty!21685 m!455397))

(declare-fun m!455399 () Bool)

(assert (=> b!473161 m!455399))

(declare-fun m!455401 () Bool)

(assert (=> b!473161 m!455401))

(declare-fun m!455403 () Bool)

(assert (=> b!473161 m!455403))

(declare-fun m!455405 () Bool)

(assert (=> b!473160 m!455405))

(check-sat (not mapNonEmpty!21685) (not b_next!11887) (not b!473161) tp_is_empty!13315 b_and!20353 (not start!42398) (not b!473162) (not b!473157) (not b!473160))
(check-sat b_and!20353 (not b_next!11887))
