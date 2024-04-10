; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105788 () Bool)

(assert start!105788)

(declare-fun b_free!27351 () Bool)

(declare-fun b_next!27351 () Bool)

(assert (=> start!105788 (= b_free!27351 (not b_next!27351))))

(declare-fun tp!95582 () Bool)

(declare-fun b_and!45247 () Bool)

(assert (=> start!105788 (= tp!95582 b_and!45247)))

(declare-fun mapNonEmpty!50179 () Bool)

(declare-fun mapRes!50179 () Bool)

(declare-fun tp!95581 () Bool)

(declare-fun e!717007 () Bool)

(assert (=> mapNonEmpty!50179 (= mapRes!50179 (and tp!95581 e!717007))))

(declare-datatypes ((V!48369 0))(
  ( (V!48370 (val!16189 Int)) )
))
(declare-datatypes ((ValueCell!15363 0))(
  ( (ValueCellFull!15363 (v!18892 V!48369)) (EmptyCell!15363) )
))
(declare-fun mapValue!50179 () ValueCell!15363)

(declare-datatypes ((array!82124 0))(
  ( (array!82125 (arr!39616 (Array (_ BitVec 32) ValueCell!15363)) (size!40152 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82124)

(declare-fun mapRest!50179 () (Array (_ BitVec 32) ValueCell!15363))

(declare-fun mapKey!50179 () (_ BitVec 32))

(assert (=> mapNonEmpty!50179 (= (arr!39616 _values!914) (store mapRest!50179 mapKey!50179 mapValue!50179))))

(declare-fun b!1260147 () Bool)

(declare-fun tp_is_empty!32253 () Bool)

(assert (=> b!1260147 (= e!717007 tp_is_empty!32253)))

(declare-fun b!1260148 () Bool)

(declare-datatypes ((tuple2!20938 0))(
  ( (tuple2!20939 (_1!10480 (_ BitVec 64)) (_2!10480 V!48369)) )
))
(declare-datatypes ((List!28139 0))(
  ( (Nil!28136) (Cons!28135 (h!29344 tuple2!20938) (t!41636 List!28139)) )
))
(declare-datatypes ((ListLongMap!18811 0))(
  ( (ListLongMap!18812 (toList!9421 List!28139)) )
))
(declare-fun lt!570802 () ListLongMap!18811)

(declare-fun lt!570799 () tuple2!20938)

(declare-fun lt!570793 () ListLongMap!18811)

(declare-fun e!717008 () Bool)

(declare-fun +!4225 (ListLongMap!18811 tuple2!20938) ListLongMap!18811)

(assert (=> b!1260148 (= e!717008 (= lt!570793 (+!4225 lt!570802 lt!570799)))))

(declare-fun res!839814 () Bool)

(declare-fun e!717013 () Bool)

(assert (=> start!105788 (=> (not res!839814) (not e!717013))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105788 (= res!839814 (validMask!0 mask!1466))))

(assert (=> start!105788 e!717013))

(assert (=> start!105788 true))

(assert (=> start!105788 tp!95582))

(assert (=> start!105788 tp_is_empty!32253))

(declare-datatypes ((array!82126 0))(
  ( (array!82127 (arr!39617 (Array (_ BitVec 32) (_ BitVec 64))) (size!40153 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82126)

(declare-fun array_inv!30161 (array!82126) Bool)

(assert (=> start!105788 (array_inv!30161 _keys!1118)))

(declare-fun e!717010 () Bool)

(declare-fun array_inv!30162 (array!82124) Bool)

(assert (=> start!105788 (and (array_inv!30162 _values!914) e!717010)))

(declare-fun mapIsEmpty!50179 () Bool)

(assert (=> mapIsEmpty!50179 mapRes!50179))

(declare-fun b!1260149 () Bool)

(declare-fun e!717012 () Bool)

(assert (=> b!1260149 (= e!717012 true)))

(declare-fun lt!570795 () ListLongMap!18811)

(declare-fun lt!570796 () ListLongMap!18811)

(declare-fun -!2127 (ListLongMap!18811 (_ BitVec 64)) ListLongMap!18811)

(assert (=> b!1260149 (= lt!570795 (-!2127 lt!570796 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570801 () ListLongMap!18811)

(declare-fun lt!570794 () ListLongMap!18811)

(assert (=> b!1260149 (= (-!2127 lt!570801 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570794)))

(declare-datatypes ((Unit!42027 0))(
  ( (Unit!42028) )
))
(declare-fun lt!570800 () Unit!42027)

(declare-fun minValueBefore!43 () V!48369)

(declare-fun addThenRemoveForNewKeyIsSame!364 (ListLongMap!18811 (_ BitVec 64) V!48369) Unit!42027)

(assert (=> b!1260149 (= lt!570800 (addThenRemoveForNewKeyIsSame!364 lt!570794 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1260149 e!717008))

(declare-fun res!839819 () Bool)

(assert (=> b!1260149 (=> (not res!839819) (not e!717008))))

(assert (=> b!1260149 (= res!839819 (= lt!570796 lt!570801))))

(assert (=> b!1260149 (= lt!570801 (+!4225 lt!570794 (tuple2!20939 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570798 () ListLongMap!18811)

(assert (=> b!1260149 (= lt!570794 (+!4225 lt!570798 lt!570799))))

(declare-fun zeroValue!871 () V!48369)

(assert (=> b!1260149 (= lt!570799 (tuple2!20939 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48369)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4618 (array!82126 array!82124 (_ BitVec 32) (_ BitVec 32) V!48369 V!48369 (_ BitVec 32) Int) ListLongMap!18811)

(assert (=> b!1260149 (= lt!570793 (getCurrentListMap!4618 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260149 (= lt!570796 (getCurrentListMap!4618 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260150 () Bool)

(declare-fun e!717011 () Bool)

(assert (=> b!1260150 (= e!717011 tp_is_empty!32253)))

(declare-fun b!1260151 () Bool)

(declare-fun res!839816 () Bool)

(assert (=> b!1260151 (=> (not res!839816) (not e!717013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82126 (_ BitVec 32)) Bool)

(assert (=> b!1260151 (= res!839816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260152 () Bool)

(declare-fun res!839818 () Bool)

(assert (=> b!1260152 (=> (not res!839818) (not e!717013))))

(declare-datatypes ((List!28140 0))(
  ( (Nil!28137) (Cons!28136 (h!29345 (_ BitVec 64)) (t!41637 List!28140)) )
))
(declare-fun arrayNoDuplicates!0 (array!82126 (_ BitVec 32) List!28140) Bool)

(assert (=> b!1260152 (= res!839818 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28137))))

(declare-fun b!1260153 () Bool)

(assert (=> b!1260153 (= e!717010 (and e!717011 mapRes!50179))))

(declare-fun condMapEmpty!50179 () Bool)

(declare-fun mapDefault!50179 () ValueCell!15363)

(assert (=> b!1260153 (= condMapEmpty!50179 (= (arr!39616 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15363)) mapDefault!50179)))))

(declare-fun b!1260154 () Bool)

(declare-fun res!839815 () Bool)

(assert (=> b!1260154 (=> (not res!839815) (not e!717013))))

(assert (=> b!1260154 (= res!839815 (and (= (size!40152 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40153 _keys!1118) (size!40152 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260155 () Bool)

(assert (=> b!1260155 (= e!717013 (not e!717012))))

(declare-fun res!839817 () Bool)

(assert (=> b!1260155 (=> res!839817 e!717012)))

(assert (=> b!1260155 (= res!839817 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1260155 (= lt!570798 lt!570802)))

(declare-fun lt!570797 () Unit!42027)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1158 (array!82126 array!82124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48369 V!48369 V!48369 V!48369 (_ BitVec 32) Int) Unit!42027)

(assert (=> b!1260155 (= lt!570797 (lemmaNoChangeToArrayThenSameMapNoExtras!1158 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5794 (array!82126 array!82124 (_ BitVec 32) (_ BitVec 32) V!48369 V!48369 (_ BitVec 32) Int) ListLongMap!18811)

(assert (=> b!1260155 (= lt!570802 (getCurrentListMapNoExtraKeys!5794 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260155 (= lt!570798 (getCurrentListMapNoExtraKeys!5794 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105788 res!839814) b!1260154))

(assert (= (and b!1260154 res!839815) b!1260151))

(assert (= (and b!1260151 res!839816) b!1260152))

(assert (= (and b!1260152 res!839818) b!1260155))

(assert (= (and b!1260155 (not res!839817)) b!1260149))

(assert (= (and b!1260149 res!839819) b!1260148))

(assert (= (and b!1260153 condMapEmpty!50179) mapIsEmpty!50179))

(assert (= (and b!1260153 (not condMapEmpty!50179)) mapNonEmpty!50179))

(get-info :version)

(assert (= (and mapNonEmpty!50179 ((_ is ValueCellFull!15363) mapValue!50179)) b!1260147))

(assert (= (and b!1260153 ((_ is ValueCellFull!15363) mapDefault!50179)) b!1260150))

(assert (= start!105788 b!1260153))

(declare-fun m!1160777 () Bool)

(assert (=> b!1260155 m!1160777))

(declare-fun m!1160779 () Bool)

(assert (=> b!1260155 m!1160779))

(declare-fun m!1160781 () Bool)

(assert (=> b!1260155 m!1160781))

(declare-fun m!1160783 () Bool)

(assert (=> b!1260149 m!1160783))

(declare-fun m!1160785 () Bool)

(assert (=> b!1260149 m!1160785))

(declare-fun m!1160787 () Bool)

(assert (=> b!1260149 m!1160787))

(declare-fun m!1160789 () Bool)

(assert (=> b!1260149 m!1160789))

(declare-fun m!1160791 () Bool)

(assert (=> b!1260149 m!1160791))

(declare-fun m!1160793 () Bool)

(assert (=> b!1260149 m!1160793))

(declare-fun m!1160795 () Bool)

(assert (=> b!1260149 m!1160795))

(declare-fun m!1160797 () Bool)

(assert (=> start!105788 m!1160797))

(declare-fun m!1160799 () Bool)

(assert (=> start!105788 m!1160799))

(declare-fun m!1160801 () Bool)

(assert (=> start!105788 m!1160801))

(declare-fun m!1160803 () Bool)

(assert (=> b!1260148 m!1160803))

(declare-fun m!1160805 () Bool)

(assert (=> b!1260152 m!1160805))

(declare-fun m!1160807 () Bool)

(assert (=> b!1260151 m!1160807))

(declare-fun m!1160809 () Bool)

(assert (=> mapNonEmpty!50179 m!1160809))

(check-sat (not b!1260155) (not b!1260151) (not b_next!27351) (not mapNonEmpty!50179) (not start!105788) tp_is_empty!32253 (not b!1260152) b_and!45247 (not b!1260149) (not b!1260148))
(check-sat b_and!45247 (not b_next!27351))
