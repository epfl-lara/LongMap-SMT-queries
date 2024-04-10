; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105434 () Bool)

(assert start!105434)

(declare-fun b_free!27093 () Bool)

(declare-fun b_next!27093 () Bool)

(assert (=> start!105434 (= b_free!27093 (not b_next!27093))))

(declare-fun tp!94793 () Bool)

(declare-fun b_and!44939 () Bool)

(assert (=> start!105434 (= tp!94793 b_and!44939)))

(declare-fun b!1256172 () Bool)

(declare-fun e!714075 () Bool)

(declare-fun e!714071 () Bool)

(assert (=> b!1256172 (= e!714075 (not e!714071))))

(declare-fun res!837438 () Bool)

(assert (=> b!1256172 (=> res!837438 e!714071)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1256172 (= res!837438 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!48025 0))(
  ( (V!48026 (val!16060 Int)) )
))
(declare-datatypes ((tuple2!20746 0))(
  ( (tuple2!20747 (_1!10384 (_ BitVec 64)) (_2!10384 V!48025)) )
))
(declare-datatypes ((List!27963 0))(
  ( (Nil!27960) (Cons!27959 (h!29168 tuple2!20746) (t!41450 List!27963)) )
))
(declare-datatypes ((ListLongMap!18619 0))(
  ( (ListLongMap!18620 (toList!9325 List!27963)) )
))
(declare-fun lt!567972 () ListLongMap!18619)

(declare-fun lt!567973 () ListLongMap!18619)

(assert (=> b!1256172 (= lt!567972 lt!567973)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((Unit!41834 0))(
  ( (Unit!41835) )
))
(declare-fun lt!567969 () Unit!41834)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48025)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48025)

(declare-datatypes ((array!81632 0))(
  ( (array!81633 (arr!39375 (Array (_ BitVec 32) (_ BitVec 64))) (size!39911 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81632)

(declare-datatypes ((ValueCell!15234 0))(
  ( (ValueCellFull!15234 (v!18760 V!48025)) (EmptyCell!15234) )
))
(declare-datatypes ((array!81634 0))(
  ( (array!81635 (arr!39376 (Array (_ BitVec 32) ValueCell!15234)) (size!39912 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81634)

(declare-fun minValueBefore!43 () V!48025)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1072 (array!81632 array!81634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48025 V!48025 V!48025 V!48025 (_ BitVec 32) Int) Unit!41834)

(assert (=> b!1256172 (= lt!567969 (lemmaNoChangeToArrayThenSameMapNoExtras!1072 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5708 (array!81632 array!81634 (_ BitVec 32) (_ BitVec 32) V!48025 V!48025 (_ BitVec 32) Int) ListLongMap!18619)

(assert (=> b!1256172 (= lt!567973 (getCurrentListMapNoExtraKeys!5708 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256172 (= lt!567972 (getCurrentListMapNoExtraKeys!5708 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256173 () Bool)

(declare-fun res!837442 () Bool)

(assert (=> b!1256173 (=> (not res!837442) (not e!714075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81632 (_ BitVec 32)) Bool)

(assert (=> b!1256173 (= res!837442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256174 () Bool)

(declare-fun e!714072 () Bool)

(declare-fun e!714073 () Bool)

(declare-fun mapRes!49777 () Bool)

(assert (=> b!1256174 (= e!714072 (and e!714073 mapRes!49777))))

(declare-fun condMapEmpty!49777 () Bool)

(declare-fun mapDefault!49777 () ValueCell!15234)

(assert (=> b!1256174 (= condMapEmpty!49777 (= (arr!39376 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15234)) mapDefault!49777)))))

(declare-fun b!1256175 () Bool)

(declare-fun e!714077 () Bool)

(assert (=> b!1256175 (= e!714071 e!714077)))

(declare-fun res!837441 () Bool)

(assert (=> b!1256175 (=> res!837441 e!714077)))

(declare-fun lt!567971 () ListLongMap!18619)

(declare-fun contains!7542 (ListLongMap!18619 (_ BitVec 64)) Bool)

(assert (=> b!1256175 (= res!837441 (contains!7542 lt!567971 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4548 (array!81632 array!81634 (_ BitVec 32) (_ BitVec 32) V!48025 V!48025 (_ BitVec 32) Int) ListLongMap!18619)

(assert (=> b!1256175 (= lt!567971 (getCurrentListMap!4548 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256176 () Bool)

(declare-fun res!837439 () Bool)

(assert (=> b!1256176 (=> (not res!837439) (not e!714075))))

(assert (=> b!1256176 (= res!837439 (and (= (size!39912 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39911 _keys!1118) (size!39912 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49777 () Bool)

(declare-fun tp!94792 () Bool)

(declare-fun e!714076 () Bool)

(assert (=> mapNonEmpty!49777 (= mapRes!49777 (and tp!94792 e!714076))))

(declare-fun mapRest!49777 () (Array (_ BitVec 32) ValueCell!15234))

(declare-fun mapKey!49777 () (_ BitVec 32))

(declare-fun mapValue!49777 () ValueCell!15234)

(assert (=> mapNonEmpty!49777 (= (arr!39376 _values!914) (store mapRest!49777 mapKey!49777 mapValue!49777))))

(declare-fun res!837440 () Bool)

(assert (=> start!105434 (=> (not res!837440) (not e!714075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105434 (= res!837440 (validMask!0 mask!1466))))

(assert (=> start!105434 e!714075))

(assert (=> start!105434 true))

(assert (=> start!105434 tp!94793))

(declare-fun tp_is_empty!31995 () Bool)

(assert (=> start!105434 tp_is_empty!31995))

(declare-fun array_inv!29997 (array!81632) Bool)

(assert (=> start!105434 (array_inv!29997 _keys!1118)))

(declare-fun array_inv!29998 (array!81634) Bool)

(assert (=> start!105434 (and (array_inv!29998 _values!914) e!714072)))

(declare-fun mapIsEmpty!49777 () Bool)

(assert (=> mapIsEmpty!49777 mapRes!49777))

(declare-fun b!1256177 () Bool)

(declare-fun res!837443 () Bool)

(assert (=> b!1256177 (=> (not res!837443) (not e!714075))))

(declare-datatypes ((List!27964 0))(
  ( (Nil!27961) (Cons!27960 (h!29169 (_ BitVec 64)) (t!41451 List!27964)) )
))
(declare-fun arrayNoDuplicates!0 (array!81632 (_ BitVec 32) List!27964) Bool)

(assert (=> b!1256177 (= res!837443 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27961))))

(declare-fun b!1256178 () Bool)

(assert (=> b!1256178 (= e!714073 tp_is_empty!31995)))

(declare-fun b!1256179 () Bool)

(assert (=> b!1256179 (= e!714077 true)))

(declare-fun -!2076 (ListLongMap!18619 (_ BitVec 64)) ListLongMap!18619)

(assert (=> b!1256179 (= (-!2076 lt!567971 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567971)))

(declare-fun lt!567970 () Unit!41834)

(declare-fun removeNotPresentStillSame!129 (ListLongMap!18619 (_ BitVec 64)) Unit!41834)

(assert (=> b!1256179 (= lt!567970 (removeNotPresentStillSame!129 lt!567971 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256180 () Bool)

(assert (=> b!1256180 (= e!714076 tp_is_empty!31995)))

(assert (= (and start!105434 res!837440) b!1256176))

(assert (= (and b!1256176 res!837439) b!1256173))

(assert (= (and b!1256173 res!837442) b!1256177))

(assert (= (and b!1256177 res!837443) b!1256172))

(assert (= (and b!1256172 (not res!837438)) b!1256175))

(assert (= (and b!1256175 (not res!837441)) b!1256179))

(assert (= (and b!1256174 condMapEmpty!49777) mapIsEmpty!49777))

(assert (= (and b!1256174 (not condMapEmpty!49777)) mapNonEmpty!49777))

(get-info :version)

(assert (= (and mapNonEmpty!49777 ((_ is ValueCellFull!15234) mapValue!49777)) b!1256180))

(assert (= (and b!1256174 ((_ is ValueCellFull!15234) mapDefault!49777)) b!1256178))

(assert (= start!105434 b!1256174))

(declare-fun m!1156855 () Bool)

(assert (=> b!1256175 m!1156855))

(declare-fun m!1156857 () Bool)

(assert (=> b!1256175 m!1156857))

(declare-fun m!1156859 () Bool)

(assert (=> mapNonEmpty!49777 m!1156859))

(declare-fun m!1156861 () Bool)

(assert (=> b!1256173 m!1156861))

(declare-fun m!1156863 () Bool)

(assert (=> b!1256177 m!1156863))

(declare-fun m!1156865 () Bool)

(assert (=> b!1256172 m!1156865))

(declare-fun m!1156867 () Bool)

(assert (=> b!1256172 m!1156867))

(declare-fun m!1156869 () Bool)

(assert (=> b!1256172 m!1156869))

(declare-fun m!1156871 () Bool)

(assert (=> start!105434 m!1156871))

(declare-fun m!1156873 () Bool)

(assert (=> start!105434 m!1156873))

(declare-fun m!1156875 () Bool)

(assert (=> start!105434 m!1156875))

(declare-fun m!1156877 () Bool)

(assert (=> b!1256179 m!1156877))

(declare-fun m!1156879 () Bool)

(assert (=> b!1256179 m!1156879))

(check-sat (not b!1256173) (not b!1256175) (not b!1256177) (not b_next!27093) b_and!44939 tp_is_empty!31995 (not b!1256172) (not mapNonEmpty!49777) (not start!105434) (not b!1256179))
(check-sat b_and!44939 (not b_next!27093))
