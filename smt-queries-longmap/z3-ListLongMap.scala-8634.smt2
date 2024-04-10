; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105108 () Bool)

(assert start!105108)

(declare-fun b_free!26841 () Bool)

(declare-fun b_next!26841 () Bool)

(assert (=> start!105108 (= b_free!26841 (not b_next!26841))))

(declare-fun tp!94025 () Bool)

(declare-fun b_and!44645 () Bool)

(assert (=> start!105108 (= tp!94025 b_and!44645)))

(declare-fun b!1252560 () Bool)

(declare-fun e!711429 () Bool)

(declare-fun tp_is_empty!31743 () Bool)

(assert (=> b!1252560 (= e!711429 tp_is_empty!31743)))

(declare-fun b!1252561 () Bool)

(declare-fun res!835308 () Bool)

(declare-fun e!711432 () Bool)

(assert (=> b!1252561 (=> (not res!835308) (not e!711432))))

(declare-datatypes ((array!81148 0))(
  ( (array!81149 (arr!39137 (Array (_ BitVec 32) (_ BitVec 64))) (size!39673 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81148)

(declare-datatypes ((List!27787 0))(
  ( (Nil!27784) (Cons!27783 (h!28992 (_ BitVec 64)) (t!41266 List!27787)) )
))
(declare-fun arrayNoDuplicates!0 (array!81148 (_ BitVec 32) List!27787) Bool)

(assert (=> b!1252561 (= res!835308 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27784))))

(declare-fun mapIsEmpty!49387 () Bool)

(declare-fun mapRes!49387 () Bool)

(assert (=> mapIsEmpty!49387 mapRes!49387))

(declare-fun mapNonEmpty!49387 () Bool)

(declare-fun tp!94024 () Bool)

(declare-fun e!711430 () Bool)

(assert (=> mapNonEmpty!49387 (= mapRes!49387 (and tp!94024 e!711430))))

(declare-datatypes ((V!47689 0))(
  ( (V!47690 (val!15934 Int)) )
))
(declare-datatypes ((ValueCell!15108 0))(
  ( (ValueCellFull!15108 (v!18632 V!47689)) (EmptyCell!15108) )
))
(declare-fun mapValue!49387 () ValueCell!15108)

(declare-fun mapRest!49387 () (Array (_ BitVec 32) ValueCell!15108))

(declare-datatypes ((array!81150 0))(
  ( (array!81151 (arr!39138 (Array (_ BitVec 32) ValueCell!15108)) (size!39674 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81150)

(declare-fun mapKey!49387 () (_ BitVec 32))

(assert (=> mapNonEmpty!49387 (= (arr!39138 _values!914) (store mapRest!49387 mapKey!49387 mapValue!49387))))

(declare-fun b!1252562 () Bool)

(declare-fun e!711431 () Bool)

(assert (=> b!1252562 (= e!711431 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((tuple2!20554 0))(
  ( (tuple2!20555 (_1!10288 (_ BitVec 64)) (_2!10288 V!47689)) )
))
(declare-datatypes ((List!27788 0))(
  ( (Nil!27785) (Cons!27784 (h!28993 tuple2!20554) (t!41267 List!27788)) )
))
(declare-datatypes ((ListLongMap!18427 0))(
  ( (ListLongMap!18428 (toList!9229 List!27788)) )
))
(declare-fun lt!565392 () ListLongMap!18427)

(declare-fun minValueBefore!43 () V!47689)

(declare-fun zeroValue!871 () V!47689)

(declare-fun getCurrentListMap!4477 (array!81148 array!81150 (_ BitVec 32) (_ BitVec 32) V!47689 V!47689 (_ BitVec 32) Int) ListLongMap!18427)

(assert (=> b!1252562 (= lt!565392 (getCurrentListMap!4477 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252564 () Bool)

(assert (=> b!1252564 (= e!711432 (not e!711431))))

(declare-fun res!835310 () Bool)

(assert (=> b!1252564 (=> res!835310 e!711431)))

(assert (=> b!1252564 (= res!835310 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565393 () ListLongMap!18427)

(declare-fun lt!565391 () ListLongMap!18427)

(assert (=> b!1252564 (= lt!565393 lt!565391)))

(declare-fun minValueAfter!43 () V!47689)

(declare-datatypes ((Unit!41647 0))(
  ( (Unit!41648) )
))
(declare-fun lt!565394 () Unit!41647)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!989 (array!81148 array!81150 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47689 V!47689 V!47689 V!47689 (_ BitVec 32) Int) Unit!41647)

(assert (=> b!1252564 (= lt!565394 (lemmaNoChangeToArrayThenSameMapNoExtras!989 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5625 (array!81148 array!81150 (_ BitVec 32) (_ BitVec 32) V!47689 V!47689 (_ BitVec 32) Int) ListLongMap!18427)

(assert (=> b!1252564 (= lt!565391 (getCurrentListMapNoExtraKeys!5625 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252564 (= lt!565393 (getCurrentListMapNoExtraKeys!5625 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252565 () Bool)

(declare-fun res!835309 () Bool)

(assert (=> b!1252565 (=> (not res!835309) (not e!711432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81148 (_ BitVec 32)) Bool)

(assert (=> b!1252565 (= res!835309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252563 () Bool)

(declare-fun e!711434 () Bool)

(assert (=> b!1252563 (= e!711434 (and e!711429 mapRes!49387))))

(declare-fun condMapEmpty!49387 () Bool)

(declare-fun mapDefault!49387 () ValueCell!15108)

(assert (=> b!1252563 (= condMapEmpty!49387 (= (arr!39138 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15108)) mapDefault!49387)))))

(declare-fun res!835312 () Bool)

(assert (=> start!105108 (=> (not res!835312) (not e!711432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105108 (= res!835312 (validMask!0 mask!1466))))

(assert (=> start!105108 e!711432))

(assert (=> start!105108 true))

(assert (=> start!105108 tp!94025))

(assert (=> start!105108 tp_is_empty!31743))

(declare-fun array_inv!29849 (array!81148) Bool)

(assert (=> start!105108 (array_inv!29849 _keys!1118)))

(declare-fun array_inv!29850 (array!81150) Bool)

(assert (=> start!105108 (and (array_inv!29850 _values!914) e!711434)))

(declare-fun b!1252566 () Bool)

(assert (=> b!1252566 (= e!711430 tp_is_empty!31743)))

(declare-fun b!1252567 () Bool)

(declare-fun res!835311 () Bool)

(assert (=> b!1252567 (=> (not res!835311) (not e!711432))))

(assert (=> b!1252567 (= res!835311 (and (= (size!39674 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39673 _keys!1118) (size!39674 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105108 res!835312) b!1252567))

(assert (= (and b!1252567 res!835311) b!1252565))

(assert (= (and b!1252565 res!835309) b!1252561))

(assert (= (and b!1252561 res!835308) b!1252564))

(assert (= (and b!1252564 (not res!835310)) b!1252562))

(assert (= (and b!1252563 condMapEmpty!49387) mapIsEmpty!49387))

(assert (= (and b!1252563 (not condMapEmpty!49387)) mapNonEmpty!49387))

(get-info :version)

(assert (= (and mapNonEmpty!49387 ((_ is ValueCellFull!15108) mapValue!49387)) b!1252566))

(assert (= (and b!1252563 ((_ is ValueCellFull!15108) mapDefault!49387)) b!1252560))

(assert (= start!105108 b!1252563))

(declare-fun m!1153165 () Bool)

(assert (=> b!1252562 m!1153165))

(declare-fun m!1153167 () Bool)

(assert (=> b!1252564 m!1153167))

(declare-fun m!1153169 () Bool)

(assert (=> b!1252564 m!1153169))

(declare-fun m!1153171 () Bool)

(assert (=> b!1252564 m!1153171))

(declare-fun m!1153173 () Bool)

(assert (=> start!105108 m!1153173))

(declare-fun m!1153175 () Bool)

(assert (=> start!105108 m!1153175))

(declare-fun m!1153177 () Bool)

(assert (=> start!105108 m!1153177))

(declare-fun m!1153179 () Bool)

(assert (=> b!1252561 m!1153179))

(declare-fun m!1153181 () Bool)

(assert (=> mapNonEmpty!49387 m!1153181))

(declare-fun m!1153183 () Bool)

(assert (=> b!1252565 m!1153183))

(check-sat (not b!1252564) tp_is_empty!31743 (not b!1252565) (not b_next!26841) (not b!1252561) (not start!105108) (not b!1252562) (not mapNonEmpty!49387) b_and!44645)
(check-sat b_and!44645 (not b_next!26841))
