; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105166 () Bool)

(assert start!105166)

(declare-fun b_free!26883 () Bool)

(declare-fun b_next!26883 () Bool)

(assert (=> start!105166 (= b_free!26883 (not b_next!26883))))

(declare-fun tp!94153 () Bool)

(declare-fun b_and!44697 () Bool)

(assert (=> start!105166 (= tp!94153 b_and!44697)))

(declare-fun b!1253217 () Bool)

(declare-fun e!711908 () Bool)

(declare-fun e!711911 () Bool)

(declare-fun mapRes!49453 () Bool)

(assert (=> b!1253217 (= e!711908 (and e!711911 mapRes!49453))))

(declare-fun condMapEmpty!49453 () Bool)

(declare-datatypes ((V!47745 0))(
  ( (V!47746 (val!15955 Int)) )
))
(declare-datatypes ((ValueCell!15129 0))(
  ( (ValueCellFull!15129 (v!18653 V!47745)) (EmptyCell!15129) )
))
(declare-datatypes ((array!81230 0))(
  ( (array!81231 (arr!39177 (Array (_ BitVec 32) ValueCell!15129)) (size!39713 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81230)

(declare-fun mapDefault!49453 () ValueCell!15129)

(assert (=> b!1253217 (= condMapEmpty!49453 (= (arr!39177 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15129)) mapDefault!49453)))))

(declare-fun b!1253218 () Bool)

(declare-fun e!711910 () Bool)

(declare-datatypes ((tuple2!20586 0))(
  ( (tuple2!20587 (_1!10304 (_ BitVec 64)) (_2!10304 V!47745)) )
))
(declare-datatypes ((List!27817 0))(
  ( (Nil!27814) (Cons!27813 (h!29022 tuple2!20586) (t!41298 List!27817)) )
))
(declare-datatypes ((ListLongMap!18459 0))(
  ( (ListLongMap!18460 (toList!9245 List!27817)) )
))
(declare-fun lt!565760 () ListLongMap!18459)

(declare-fun lt!565763 () ListLongMap!18459)

(assert (=> b!1253218 (= e!711910 (= lt!565760 lt!565763))))

(declare-fun mapIsEmpty!49453 () Bool)

(assert (=> mapIsEmpty!49453 mapRes!49453))

(declare-fun b!1253219 () Bool)

(declare-fun e!711909 () Bool)

(declare-fun e!711906 () Bool)

(assert (=> b!1253219 (= e!711909 (not e!711906))))

(declare-fun res!835686 () Bool)

(assert (=> b!1253219 (=> res!835686 e!711906)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253219 (= res!835686 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565759 () ListLongMap!18459)

(assert (=> b!1253219 (= lt!565759 lt!565763)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47745)

(declare-datatypes ((Unit!41674 0))(
  ( (Unit!41675) )
))
(declare-fun lt!565761 () Unit!41674)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81232 0))(
  ( (array!81233 (arr!39178 (Array (_ BitVec 32) (_ BitVec 64))) (size!39714 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81232)

(declare-fun minValueBefore!43 () V!47745)

(declare-fun zeroValue!871 () V!47745)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1002 (array!81232 array!81230 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47745 V!47745 V!47745 V!47745 (_ BitVec 32) Int) Unit!41674)

(assert (=> b!1253219 (= lt!565761 (lemmaNoChangeToArrayThenSameMapNoExtras!1002 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5638 (array!81232 array!81230 (_ BitVec 32) (_ BitVec 32) V!47745 V!47745 (_ BitVec 32) Int) ListLongMap!18459)

(assert (=> b!1253219 (= lt!565763 (getCurrentListMapNoExtraKeys!5638 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253219 (= lt!565759 (getCurrentListMapNoExtraKeys!5638 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253220 () Bool)

(declare-fun res!835689 () Bool)

(assert (=> b!1253220 (=> (not res!835689) (not e!711909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81232 (_ BitVec 32)) Bool)

(assert (=> b!1253220 (= res!835689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253221 () Bool)

(assert (=> b!1253221 (= e!711906 true)))

(declare-fun lt!565764 () Bool)

(declare-fun contains!7518 (ListLongMap!18459 (_ BitVec 64)) Bool)

(assert (=> b!1253221 (= lt!565764 (contains!7518 lt!565759 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1253221 e!711910))

(declare-fun res!835687 () Bool)

(assert (=> b!1253221 (=> (not res!835687) (not e!711910))))

(declare-fun lt!565762 () ListLongMap!18459)

(declare-fun +!4142 (ListLongMap!18459 tuple2!20586) ListLongMap!18459)

(assert (=> b!1253221 (= res!835687 (= lt!565762 (+!4142 lt!565759 (tuple2!20587 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun getCurrentListMap!4490 (array!81232 array!81230 (_ BitVec 32) (_ BitVec 32) V!47745 V!47745 (_ BitVec 32) Int) ListLongMap!18459)

(assert (=> b!1253221 (= lt!565760 (getCurrentListMap!4490 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253221 (= lt!565762 (getCurrentListMap!4490 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253222 () Bool)

(declare-fun res!835688 () Bool)

(assert (=> b!1253222 (=> (not res!835688) (not e!711909))))

(assert (=> b!1253222 (= res!835688 (and (= (size!39713 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39714 _keys!1118) (size!39713 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!835690 () Bool)

(assert (=> start!105166 (=> (not res!835690) (not e!711909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105166 (= res!835690 (validMask!0 mask!1466))))

(assert (=> start!105166 e!711909))

(assert (=> start!105166 true))

(assert (=> start!105166 tp!94153))

(declare-fun tp_is_empty!31785 () Bool)

(assert (=> start!105166 tp_is_empty!31785))

(declare-fun array_inv!29873 (array!81232) Bool)

(assert (=> start!105166 (array_inv!29873 _keys!1118)))

(declare-fun array_inv!29874 (array!81230) Bool)

(assert (=> start!105166 (and (array_inv!29874 _values!914) e!711908)))

(declare-fun b!1253223 () Bool)

(assert (=> b!1253223 (= e!711911 tp_is_empty!31785)))

(declare-fun b!1253224 () Bool)

(declare-fun res!835691 () Bool)

(assert (=> b!1253224 (=> (not res!835691) (not e!711909))))

(declare-datatypes ((List!27818 0))(
  ( (Nil!27815) (Cons!27814 (h!29023 (_ BitVec 64)) (t!41299 List!27818)) )
))
(declare-fun arrayNoDuplicates!0 (array!81232 (_ BitVec 32) List!27818) Bool)

(assert (=> b!1253224 (= res!835691 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27815))))

(declare-fun b!1253225 () Bool)

(declare-fun e!711912 () Bool)

(assert (=> b!1253225 (= e!711912 tp_is_empty!31785)))

(declare-fun mapNonEmpty!49453 () Bool)

(declare-fun tp!94154 () Bool)

(assert (=> mapNonEmpty!49453 (= mapRes!49453 (and tp!94154 e!711912))))

(declare-fun mapKey!49453 () (_ BitVec 32))

(declare-fun mapRest!49453 () (Array (_ BitVec 32) ValueCell!15129))

(declare-fun mapValue!49453 () ValueCell!15129)

(assert (=> mapNonEmpty!49453 (= (arr!39177 _values!914) (store mapRest!49453 mapKey!49453 mapValue!49453))))

(assert (= (and start!105166 res!835690) b!1253222))

(assert (= (and b!1253222 res!835688) b!1253220))

(assert (= (and b!1253220 res!835689) b!1253224))

(assert (= (and b!1253224 res!835691) b!1253219))

(assert (= (and b!1253219 (not res!835686)) b!1253221))

(assert (= (and b!1253221 res!835687) b!1253218))

(assert (= (and b!1253217 condMapEmpty!49453) mapIsEmpty!49453))

(assert (= (and b!1253217 (not condMapEmpty!49453)) mapNonEmpty!49453))

(get-info :version)

(assert (= (and mapNonEmpty!49453 ((_ is ValueCellFull!15129) mapValue!49453)) b!1253225))

(assert (= (and b!1253217 ((_ is ValueCellFull!15129) mapDefault!49453)) b!1253223))

(assert (= start!105166 b!1253217))

(declare-fun m!1153703 () Bool)

(assert (=> start!105166 m!1153703))

(declare-fun m!1153705 () Bool)

(assert (=> start!105166 m!1153705))

(declare-fun m!1153707 () Bool)

(assert (=> start!105166 m!1153707))

(declare-fun m!1153709 () Bool)

(assert (=> b!1253224 m!1153709))

(declare-fun m!1153711 () Bool)

(assert (=> b!1253219 m!1153711))

(declare-fun m!1153713 () Bool)

(assert (=> b!1253219 m!1153713))

(declare-fun m!1153715 () Bool)

(assert (=> b!1253219 m!1153715))

(declare-fun m!1153717 () Bool)

(assert (=> mapNonEmpty!49453 m!1153717))

(declare-fun m!1153719 () Bool)

(assert (=> b!1253221 m!1153719))

(declare-fun m!1153721 () Bool)

(assert (=> b!1253221 m!1153721))

(declare-fun m!1153723 () Bool)

(assert (=> b!1253221 m!1153723))

(declare-fun m!1153725 () Bool)

(assert (=> b!1253221 m!1153725))

(declare-fun m!1153727 () Bool)

(assert (=> b!1253220 m!1153727))

(check-sat (not b!1253221) (not b!1253224) (not b_next!26883) tp_is_empty!31785 b_and!44697 (not b!1253219) (not b!1253220) (not mapNonEmpty!49453) (not start!105166))
(check-sat b_and!44697 (not b_next!26883))
