; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105416 () Bool)

(assert start!105416)

(declare-fun b_free!27079 () Bool)

(declare-fun b_next!27079 () Bool)

(assert (=> start!105416 (= b_free!27079 (not b_next!27079))))

(declare-fun tp!94750 () Bool)

(declare-fun b_and!44907 () Bool)

(assert (=> start!105416 (= tp!94750 b_and!44907)))

(declare-fun b!1255902 () Bool)

(declare-fun e!713883 () Bool)

(declare-fun e!713882 () Bool)

(assert (=> b!1255902 (= e!713883 e!713882)))

(declare-fun res!837273 () Bool)

(assert (=> b!1255902 (=> res!837273 e!713882)))

(declare-datatypes ((V!48007 0))(
  ( (V!48008 (val!16053 Int)) )
))
(declare-datatypes ((tuple2!20816 0))(
  ( (tuple2!20817 (_1!10419 (_ BitVec 64)) (_2!10419 V!48007)) )
))
(declare-datatypes ((List!28026 0))(
  ( (Nil!28023) (Cons!28022 (h!29231 tuple2!20816) (t!41504 List!28026)) )
))
(declare-datatypes ((ListLongMap!18689 0))(
  ( (ListLongMap!18690 (toList!9360 List!28026)) )
))
(declare-fun lt!567689 () ListLongMap!18689)

(declare-fun contains!7511 (ListLongMap!18689 (_ BitVec 64)) Bool)

(assert (=> b!1255902 (= res!837273 (contains!7511 lt!567689 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48007)

(declare-datatypes ((array!81533 0))(
  ( (array!81534 (arr!39326 (Array (_ BitVec 32) (_ BitVec 64))) (size!39864 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81533)

(declare-fun minValueBefore!43 () V!48007)

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((ValueCell!15227 0))(
  ( (ValueCellFull!15227 (v!18752 V!48007)) (EmptyCell!15227) )
))
(declare-datatypes ((array!81535 0))(
  ( (array!81536 (arr!39327 (Array (_ BitVec 32) ValueCell!15227)) (size!39865 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81535)

(declare-fun getCurrentListMap!4471 (array!81533 array!81535 (_ BitVec 32) (_ BitVec 32) V!48007 V!48007 (_ BitVec 32) Int) ListLongMap!18689)

(assert (=> b!1255902 (= lt!567689 (getCurrentListMap!4471 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255903 () Bool)

(declare-fun res!837277 () Bool)

(declare-fun e!713881 () Bool)

(assert (=> b!1255903 (=> (not res!837277) (not e!713881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81533 (_ BitVec 32)) Bool)

(assert (=> b!1255903 (= res!837277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49756 () Bool)

(declare-fun mapRes!49756 () Bool)

(assert (=> mapIsEmpty!49756 mapRes!49756))

(declare-fun b!1255904 () Bool)

(declare-fun e!713884 () Bool)

(declare-fun e!713879 () Bool)

(assert (=> b!1255904 (= e!713884 (and e!713879 mapRes!49756))))

(declare-fun condMapEmpty!49756 () Bool)

(declare-fun mapDefault!49756 () ValueCell!15227)

(assert (=> b!1255904 (= condMapEmpty!49756 (= (arr!39327 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15227)) mapDefault!49756)))))

(declare-fun mapNonEmpty!49756 () Bool)

(declare-fun tp!94751 () Bool)

(declare-fun e!713885 () Bool)

(assert (=> mapNonEmpty!49756 (= mapRes!49756 (and tp!94751 e!713885))))

(declare-fun mapRest!49756 () (Array (_ BitVec 32) ValueCell!15227))

(declare-fun mapValue!49756 () ValueCell!15227)

(declare-fun mapKey!49756 () (_ BitVec 32))

(assert (=> mapNonEmpty!49756 (= (arr!39327 _values!914) (store mapRest!49756 mapKey!49756 mapValue!49756))))

(declare-fun b!1255905 () Bool)

(declare-fun tp_is_empty!31981 () Bool)

(assert (=> b!1255905 (= e!713885 tp_is_empty!31981)))

(declare-fun b!1255906 () Bool)

(assert (=> b!1255906 (= e!713882 true)))

(declare-fun -!2030 (ListLongMap!18689 (_ BitVec 64)) ListLongMap!18689)

(assert (=> b!1255906 (= (-!2030 lt!567689 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567689)))

(declare-datatypes ((Unit!41683 0))(
  ( (Unit!41684) )
))
(declare-fun lt!567685 () Unit!41683)

(declare-fun removeNotPresentStillSame!125 (ListLongMap!18689 (_ BitVec 64)) Unit!41683)

(assert (=> b!1255906 (= lt!567685 (removeNotPresentStillSame!125 lt!567689 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255907 () Bool)

(declare-fun res!837274 () Bool)

(assert (=> b!1255907 (=> (not res!837274) (not e!713881))))

(declare-datatypes ((List!28027 0))(
  ( (Nil!28024) (Cons!28023 (h!29232 (_ BitVec 64)) (t!41505 List!28027)) )
))
(declare-fun arrayNoDuplicates!0 (array!81533 (_ BitVec 32) List!28027) Bool)

(assert (=> b!1255907 (= res!837274 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28024))))

(declare-fun b!1255908 () Bool)

(assert (=> b!1255908 (= e!713879 tp_is_empty!31981)))

(declare-fun b!1255909 () Bool)

(declare-fun res!837276 () Bool)

(assert (=> b!1255909 (=> (not res!837276) (not e!713881))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1255909 (= res!837276 (and (= (size!39865 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39864 _keys!1118) (size!39865 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!837272 () Bool)

(assert (=> start!105416 (=> (not res!837272) (not e!713881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105416 (= res!837272 (validMask!0 mask!1466))))

(assert (=> start!105416 e!713881))

(assert (=> start!105416 true))

(assert (=> start!105416 tp!94750))

(assert (=> start!105416 tp_is_empty!31981))

(declare-fun array_inv!30095 (array!81533) Bool)

(assert (=> start!105416 (array_inv!30095 _keys!1118)))

(declare-fun array_inv!30096 (array!81535) Bool)

(assert (=> start!105416 (and (array_inv!30096 _values!914) e!713884)))

(declare-fun b!1255901 () Bool)

(assert (=> b!1255901 (= e!713881 (not e!713883))))

(declare-fun res!837275 () Bool)

(assert (=> b!1255901 (=> res!837275 e!713883)))

(assert (=> b!1255901 (= res!837275 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567688 () ListLongMap!18689)

(declare-fun lt!567687 () ListLongMap!18689)

(assert (=> b!1255901 (= lt!567688 lt!567687)))

(declare-fun lt!567686 () Unit!41683)

(declare-fun minValueAfter!43 () V!48007)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1072 (array!81533 array!81535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48007 V!48007 V!48007 V!48007 (_ BitVec 32) Int) Unit!41683)

(assert (=> b!1255901 (= lt!567686 (lemmaNoChangeToArrayThenSameMapNoExtras!1072 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5750 (array!81533 array!81535 (_ BitVec 32) (_ BitVec 32) V!48007 V!48007 (_ BitVec 32) Int) ListLongMap!18689)

(assert (=> b!1255901 (= lt!567687 (getCurrentListMapNoExtraKeys!5750 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255901 (= lt!567688 (getCurrentListMapNoExtraKeys!5750 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105416 res!837272) b!1255909))

(assert (= (and b!1255909 res!837276) b!1255903))

(assert (= (and b!1255903 res!837277) b!1255907))

(assert (= (and b!1255907 res!837274) b!1255901))

(assert (= (and b!1255901 (not res!837275)) b!1255902))

(assert (= (and b!1255902 (not res!837273)) b!1255906))

(assert (= (and b!1255904 condMapEmpty!49756) mapIsEmpty!49756))

(assert (= (and b!1255904 (not condMapEmpty!49756)) mapNonEmpty!49756))

(get-info :version)

(assert (= (and mapNonEmpty!49756 ((_ is ValueCellFull!15227) mapValue!49756)) b!1255905))

(assert (= (and b!1255904 ((_ is ValueCellFull!15227) mapDefault!49756)) b!1255908))

(assert (= start!105416 b!1255904))

(declare-fun m!1156153 () Bool)

(assert (=> start!105416 m!1156153))

(declare-fun m!1156155 () Bool)

(assert (=> start!105416 m!1156155))

(declare-fun m!1156157 () Bool)

(assert (=> start!105416 m!1156157))

(declare-fun m!1156159 () Bool)

(assert (=> mapNonEmpty!49756 m!1156159))

(declare-fun m!1156161 () Bool)

(assert (=> b!1255901 m!1156161))

(declare-fun m!1156163 () Bool)

(assert (=> b!1255901 m!1156163))

(declare-fun m!1156165 () Bool)

(assert (=> b!1255901 m!1156165))

(declare-fun m!1156167 () Bool)

(assert (=> b!1255906 m!1156167))

(declare-fun m!1156169 () Bool)

(assert (=> b!1255906 m!1156169))

(declare-fun m!1156171 () Bool)

(assert (=> b!1255907 m!1156171))

(declare-fun m!1156173 () Bool)

(assert (=> b!1255903 m!1156173))

(declare-fun m!1156175 () Bool)

(assert (=> b!1255902 m!1156175))

(declare-fun m!1156177 () Bool)

(assert (=> b!1255902 m!1156177))

(check-sat (not start!105416) (not b!1255901) (not b!1255907) (not b_next!27079) (not mapNonEmpty!49756) (not b!1255903) tp_is_empty!31981 (not b!1255902) b_and!44907 (not b!1255906))
(check-sat b_and!44907 (not b_next!27079))
