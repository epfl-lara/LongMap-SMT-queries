; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105172 () Bool)

(assert start!105172)

(declare-fun b_free!26889 () Bool)

(declare-fun b_next!26889 () Bool)

(assert (=> start!105172 (= b_free!26889 (not b_next!26889))))

(declare-fun tp!94171 () Bool)

(declare-fun b_and!44703 () Bool)

(assert (=> start!105172 (= tp!94171 b_and!44703)))

(declare-fun b!1253293 () Bool)

(declare-fun e!711966 () Bool)

(declare-fun tp_is_empty!31791 () Bool)

(assert (=> b!1253293 (= e!711966 tp_is_empty!31791)))

(declare-fun b!1253294 () Bool)

(declare-fun e!711967 () Bool)

(assert (=> b!1253294 (= e!711967 true)))

(declare-datatypes ((V!47753 0))(
  ( (V!47754 (val!15958 Int)) )
))
(declare-datatypes ((tuple2!20592 0))(
  ( (tuple2!20593 (_1!10307 (_ BitVec 64)) (_2!10307 V!47753)) )
))
(declare-datatypes ((List!27822 0))(
  ( (Nil!27819) (Cons!27818 (h!29027 tuple2!20592) (t!41303 List!27822)) )
))
(declare-datatypes ((ListLongMap!18465 0))(
  ( (ListLongMap!18466 (toList!9248 List!27822)) )
))
(declare-fun lt!565824 () ListLongMap!18465)

(declare-fun lt!565823 () ListLongMap!18465)

(declare-fun -!2022 (ListLongMap!18465 (_ BitVec 64)) ListLongMap!18465)

(assert (=> b!1253294 (= lt!565824 (-!2022 lt!565823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!565827 () ListLongMap!18465)

(declare-fun lt!565828 () ListLongMap!18465)

(assert (=> b!1253294 (= (-!2022 lt!565827 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565828)))

(declare-datatypes ((Unit!41678 0))(
  ( (Unit!41679) )
))
(declare-fun lt!565829 () Unit!41678)

(declare-fun minValueBefore!43 () V!47753)

(declare-fun addThenRemoveForNewKeyIsSame!292 (ListLongMap!18465 (_ BitVec 64) V!47753) Unit!41678)

(assert (=> b!1253294 (= lt!565829 (addThenRemoveForNewKeyIsSame!292 lt!565828 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!565830 () ListLongMap!18465)

(declare-fun lt!565825 () ListLongMap!18465)

(assert (=> b!1253294 (and (= lt!565823 lt!565827) (= lt!565830 lt!565825))))

(declare-fun +!4145 (ListLongMap!18465 tuple2!20592) ListLongMap!18465)

(assert (=> b!1253294 (= lt!565827 (+!4145 lt!565828 (tuple2!20593 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47753)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47753)

(declare-datatypes ((array!81242 0))(
  ( (array!81243 (arr!39183 (Array (_ BitVec 32) (_ BitVec 64))) (size!39719 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81242)

(declare-datatypes ((ValueCell!15132 0))(
  ( (ValueCellFull!15132 (v!18656 V!47753)) (EmptyCell!15132) )
))
(declare-datatypes ((array!81244 0))(
  ( (array!81245 (arr!39184 (Array (_ BitVec 32) ValueCell!15132)) (size!39720 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81244)

(declare-fun getCurrentListMap!4493 (array!81242 array!81244 (_ BitVec 32) (_ BitVec 32) V!47753 V!47753 (_ BitVec 32) Int) ListLongMap!18465)

(assert (=> b!1253294 (= lt!565830 (getCurrentListMap!4493 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253294 (= lt!565823 (getCurrentListMap!4493 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!835736 () Bool)

(declare-fun e!711968 () Bool)

(assert (=> start!105172 (=> (not res!835736) (not e!711968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105172 (= res!835736 (validMask!0 mask!1466))))

(assert (=> start!105172 e!711968))

(assert (=> start!105172 true))

(assert (=> start!105172 tp!94171))

(assert (=> start!105172 tp_is_empty!31791))

(declare-fun array_inv!29877 (array!81242) Bool)

(assert (=> start!105172 (array_inv!29877 _keys!1118)))

(declare-fun e!711964 () Bool)

(declare-fun array_inv!29878 (array!81244) Bool)

(assert (=> start!105172 (and (array_inv!29878 _values!914) e!711964)))

(declare-fun b!1253295 () Bool)

(declare-fun mapRes!49462 () Bool)

(assert (=> b!1253295 (= e!711964 (and e!711966 mapRes!49462))))

(declare-fun condMapEmpty!49462 () Bool)

(declare-fun mapDefault!49462 () ValueCell!15132)

(assert (=> b!1253295 (= condMapEmpty!49462 (= (arr!39184 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15132)) mapDefault!49462)))))

(declare-fun mapIsEmpty!49462 () Bool)

(assert (=> mapIsEmpty!49462 mapRes!49462))

(declare-fun b!1253296 () Bool)

(declare-fun res!835737 () Bool)

(assert (=> b!1253296 (=> (not res!835737) (not e!711968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81242 (_ BitVec 32)) Bool)

(assert (=> b!1253296 (= res!835737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253297 () Bool)

(declare-fun e!711969 () Bool)

(assert (=> b!1253297 (= e!711969 tp_is_empty!31791)))

(declare-fun b!1253298 () Bool)

(declare-fun res!835739 () Bool)

(assert (=> b!1253298 (=> (not res!835739) (not e!711968))))

(assert (=> b!1253298 (= res!835739 (and (= (size!39720 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39719 _keys!1118) (size!39720 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253299 () Bool)

(assert (=> b!1253299 (= e!711968 (not e!711967))))

(declare-fun res!835735 () Bool)

(assert (=> b!1253299 (=> res!835735 e!711967)))

(assert (=> b!1253299 (= res!835735 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253299 (= lt!565828 lt!565825)))

(declare-fun lt!565826 () Unit!41678)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1004 (array!81242 array!81244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47753 V!47753 V!47753 V!47753 (_ BitVec 32) Int) Unit!41678)

(assert (=> b!1253299 (= lt!565826 (lemmaNoChangeToArrayThenSameMapNoExtras!1004 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5640 (array!81242 array!81244 (_ BitVec 32) (_ BitVec 32) V!47753 V!47753 (_ BitVec 32) Int) ListLongMap!18465)

(assert (=> b!1253299 (= lt!565825 (getCurrentListMapNoExtraKeys!5640 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253299 (= lt!565828 (getCurrentListMapNoExtraKeys!5640 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253300 () Bool)

(declare-fun res!835738 () Bool)

(assert (=> b!1253300 (=> (not res!835738) (not e!711968))))

(declare-datatypes ((List!27823 0))(
  ( (Nil!27820) (Cons!27819 (h!29028 (_ BitVec 64)) (t!41304 List!27823)) )
))
(declare-fun arrayNoDuplicates!0 (array!81242 (_ BitVec 32) List!27823) Bool)

(assert (=> b!1253300 (= res!835738 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27820))))

(declare-fun mapNonEmpty!49462 () Bool)

(declare-fun tp!94172 () Bool)

(assert (=> mapNonEmpty!49462 (= mapRes!49462 (and tp!94172 e!711969))))

(declare-fun mapRest!49462 () (Array (_ BitVec 32) ValueCell!15132))

(declare-fun mapValue!49462 () ValueCell!15132)

(declare-fun mapKey!49462 () (_ BitVec 32))

(assert (=> mapNonEmpty!49462 (= (arr!39184 _values!914) (store mapRest!49462 mapKey!49462 mapValue!49462))))

(assert (= (and start!105172 res!835736) b!1253298))

(assert (= (and b!1253298 res!835739) b!1253296))

(assert (= (and b!1253296 res!835737) b!1253300))

(assert (= (and b!1253300 res!835738) b!1253299))

(assert (= (and b!1253299 (not res!835735)) b!1253294))

(assert (= (and b!1253295 condMapEmpty!49462) mapIsEmpty!49462))

(assert (= (and b!1253295 (not condMapEmpty!49462)) mapNonEmpty!49462))

(get-info :version)

(assert (= (and mapNonEmpty!49462 ((_ is ValueCellFull!15132) mapValue!49462)) b!1253297))

(assert (= (and b!1253295 ((_ is ValueCellFull!15132) mapDefault!49462)) b!1253293))

(assert (= start!105172 b!1253295))

(declare-fun m!1153785 () Bool)

(assert (=> start!105172 m!1153785))

(declare-fun m!1153787 () Bool)

(assert (=> start!105172 m!1153787))

(declare-fun m!1153789 () Bool)

(assert (=> start!105172 m!1153789))

(declare-fun m!1153791 () Bool)

(assert (=> b!1253296 m!1153791))

(declare-fun m!1153793 () Bool)

(assert (=> b!1253299 m!1153793))

(declare-fun m!1153795 () Bool)

(assert (=> b!1253299 m!1153795))

(declare-fun m!1153797 () Bool)

(assert (=> b!1253299 m!1153797))

(declare-fun m!1153799 () Bool)

(assert (=> mapNonEmpty!49462 m!1153799))

(declare-fun m!1153801 () Bool)

(assert (=> b!1253294 m!1153801))

(declare-fun m!1153803 () Bool)

(assert (=> b!1253294 m!1153803))

(declare-fun m!1153805 () Bool)

(assert (=> b!1253294 m!1153805))

(declare-fun m!1153807 () Bool)

(assert (=> b!1253294 m!1153807))

(declare-fun m!1153809 () Bool)

(assert (=> b!1253294 m!1153809))

(declare-fun m!1153811 () Bool)

(assert (=> b!1253294 m!1153811))

(declare-fun m!1153813 () Bool)

(assert (=> b!1253300 m!1153813))

(check-sat (not mapNonEmpty!49462) (not b!1253299) (not start!105172) (not b_next!26889) (not b!1253300) tp_is_empty!31791 (not b!1253296) b_and!44703 (not b!1253294))
(check-sat b_and!44703 (not b_next!26889))
