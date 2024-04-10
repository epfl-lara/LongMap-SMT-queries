; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105422 () Bool)

(assert start!105422)

(declare-fun b_free!27081 () Bool)

(declare-fun b_next!27081 () Bool)

(assert (=> start!105422 (= b_free!27081 (not b_next!27081))))

(declare-fun tp!94756 () Bool)

(declare-fun b_and!44927 () Bool)

(assert (=> start!105422 (= tp!94756 b_and!44927)))

(declare-fun b!1256011 () Bool)

(declare-fun e!713950 () Bool)

(assert (=> b!1256011 (= e!713950 true)))

(declare-datatypes ((V!48009 0))(
  ( (V!48010 (val!16054 Int)) )
))
(declare-datatypes ((tuple2!20736 0))(
  ( (tuple2!20737 (_1!10379 (_ BitVec 64)) (_2!10379 V!48009)) )
))
(declare-datatypes ((List!27954 0))(
  ( (Nil!27951) (Cons!27950 (h!29159 tuple2!20736) (t!41441 List!27954)) )
))
(declare-datatypes ((ListLongMap!18609 0))(
  ( (ListLongMap!18610 (toList!9320 List!27954)) )
))
(declare-fun lt!567881 () ListLongMap!18609)

(declare-fun -!2072 (ListLongMap!18609 (_ BitVec 64)) ListLongMap!18609)

(assert (=> b!1256011 (= (-!2072 lt!567881 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567881)))

(declare-datatypes ((Unit!41824 0))(
  ( (Unit!41825) )
))
(declare-fun lt!567882 () Unit!41824)

(declare-fun removeNotPresentStillSame!125 (ListLongMap!18609 (_ BitVec 64)) Unit!41824)

(assert (=> b!1256011 (= lt!567882 (removeNotPresentStillSame!125 lt!567881 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256012 () Bool)

(declare-fun res!837333 () Bool)

(declare-fun e!713948 () Bool)

(assert (=> b!1256012 (=> (not res!837333) (not e!713948))))

(declare-datatypes ((array!81608 0))(
  ( (array!81609 (arr!39363 (Array (_ BitVec 32) (_ BitVec 64))) (size!39899 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81608)

(declare-datatypes ((List!27955 0))(
  ( (Nil!27952) (Cons!27951 (h!29160 (_ BitVec 64)) (t!41442 List!27955)) )
))
(declare-fun arrayNoDuplicates!0 (array!81608 (_ BitVec 32) List!27955) Bool)

(assert (=> b!1256012 (= res!837333 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27952))))

(declare-fun b!1256013 () Bool)

(declare-fun e!713951 () Bool)

(declare-fun tp_is_empty!31983 () Bool)

(assert (=> b!1256013 (= e!713951 tp_is_empty!31983)))

(declare-fun mapIsEmpty!49759 () Bool)

(declare-fun mapRes!49759 () Bool)

(assert (=> mapIsEmpty!49759 mapRes!49759))

(declare-fun b!1256014 () Bool)

(declare-fun res!837335 () Bool)

(assert (=> b!1256014 (=> (not res!837335) (not e!713948))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15228 0))(
  ( (ValueCellFull!15228 (v!18754 V!48009)) (EmptyCell!15228) )
))
(declare-datatypes ((array!81610 0))(
  ( (array!81611 (arr!39364 (Array (_ BitVec 32) ValueCell!15228)) (size!39900 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81610)

(assert (=> b!1256014 (= res!837335 (and (= (size!39900 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39899 _keys!1118) (size!39900 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49759 () Bool)

(declare-fun tp!94757 () Bool)

(assert (=> mapNonEmpty!49759 (= mapRes!49759 (and tp!94757 e!713951))))

(declare-fun mapRest!49759 () (Array (_ BitVec 32) ValueCell!15228))

(declare-fun mapKey!49759 () (_ BitVec 32))

(declare-fun mapValue!49759 () ValueCell!15228)

(assert (=> mapNonEmpty!49759 (= (arr!39364 _values!914) (store mapRest!49759 mapKey!49759 mapValue!49759))))

(declare-fun b!1256015 () Bool)

(declare-fun e!713947 () Bool)

(assert (=> b!1256015 (= e!713947 e!713950)))

(declare-fun res!837331 () Bool)

(assert (=> b!1256015 (=> res!837331 e!713950)))

(declare-fun contains!7537 (ListLongMap!18609 (_ BitVec 64)) Bool)

(assert (=> b!1256015 (= res!837331 (contains!7537 lt!567881 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48009)

(declare-fun minValueBefore!43 () V!48009)

(declare-fun getCurrentListMap!4543 (array!81608 array!81610 (_ BitVec 32) (_ BitVec 32) V!48009 V!48009 (_ BitVec 32) Int) ListLongMap!18609)

(assert (=> b!1256015 (= lt!567881 (getCurrentListMap!4543 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256016 () Bool)

(assert (=> b!1256016 (= e!713948 (not e!713947))))

(declare-fun res!837332 () Bool)

(assert (=> b!1256016 (=> res!837332 e!713947)))

(assert (=> b!1256016 (= res!837332 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567879 () ListLongMap!18609)

(declare-fun lt!567880 () ListLongMap!18609)

(assert (=> b!1256016 (= lt!567879 lt!567880)))

(declare-fun lt!567883 () Unit!41824)

(declare-fun minValueAfter!43 () V!48009)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1067 (array!81608 array!81610 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48009 V!48009 V!48009 V!48009 (_ BitVec 32) Int) Unit!41824)

(assert (=> b!1256016 (= lt!567883 (lemmaNoChangeToArrayThenSameMapNoExtras!1067 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5703 (array!81608 array!81610 (_ BitVec 32) (_ BitVec 32) V!48009 V!48009 (_ BitVec 32) Int) ListLongMap!18609)

(assert (=> b!1256016 (= lt!567880 (getCurrentListMapNoExtraKeys!5703 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256016 (= lt!567879 (getCurrentListMapNoExtraKeys!5703 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!837330 () Bool)

(assert (=> start!105422 (=> (not res!837330) (not e!713948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105422 (= res!837330 (validMask!0 mask!1466))))

(assert (=> start!105422 e!713948))

(assert (=> start!105422 true))

(assert (=> start!105422 tp!94756))

(assert (=> start!105422 tp_is_empty!31983))

(declare-fun array_inv!29989 (array!81608) Bool)

(assert (=> start!105422 (array_inv!29989 _keys!1118)))

(declare-fun e!713949 () Bool)

(declare-fun array_inv!29990 (array!81610) Bool)

(assert (=> start!105422 (and (array_inv!29990 _values!914) e!713949)))

(declare-fun b!1256010 () Bool)

(declare-fun e!713946 () Bool)

(assert (=> b!1256010 (= e!713946 tp_is_empty!31983)))

(declare-fun b!1256017 () Bool)

(assert (=> b!1256017 (= e!713949 (and e!713946 mapRes!49759))))

(declare-fun condMapEmpty!49759 () Bool)

(declare-fun mapDefault!49759 () ValueCell!15228)

(assert (=> b!1256017 (= condMapEmpty!49759 (= (arr!39364 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15228)) mapDefault!49759)))))

(declare-fun b!1256018 () Bool)

(declare-fun res!837334 () Bool)

(assert (=> b!1256018 (=> (not res!837334) (not e!713948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81608 (_ BitVec 32)) Bool)

(assert (=> b!1256018 (= res!837334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105422 res!837330) b!1256014))

(assert (= (and b!1256014 res!837335) b!1256018))

(assert (= (and b!1256018 res!837334) b!1256012))

(assert (= (and b!1256012 res!837333) b!1256016))

(assert (= (and b!1256016 (not res!837332)) b!1256015))

(assert (= (and b!1256015 (not res!837331)) b!1256011))

(assert (= (and b!1256017 condMapEmpty!49759) mapIsEmpty!49759))

(assert (= (and b!1256017 (not condMapEmpty!49759)) mapNonEmpty!49759))

(get-info :version)

(assert (= (and mapNonEmpty!49759 ((_ is ValueCellFull!15228) mapValue!49759)) b!1256013))

(assert (= (and b!1256017 ((_ is ValueCellFull!15228) mapDefault!49759)) b!1256010))

(assert (= start!105422 b!1256017))

(declare-fun m!1156699 () Bool)

(assert (=> b!1256012 m!1156699))

(declare-fun m!1156701 () Bool)

(assert (=> b!1256011 m!1156701))

(declare-fun m!1156703 () Bool)

(assert (=> b!1256011 m!1156703))

(declare-fun m!1156705 () Bool)

(assert (=> b!1256015 m!1156705))

(declare-fun m!1156707 () Bool)

(assert (=> b!1256015 m!1156707))

(declare-fun m!1156709 () Bool)

(assert (=> b!1256016 m!1156709))

(declare-fun m!1156711 () Bool)

(assert (=> b!1256016 m!1156711))

(declare-fun m!1156713 () Bool)

(assert (=> b!1256016 m!1156713))

(declare-fun m!1156715 () Bool)

(assert (=> b!1256018 m!1156715))

(declare-fun m!1156717 () Bool)

(assert (=> mapNonEmpty!49759 m!1156717))

(declare-fun m!1156719 () Bool)

(assert (=> start!105422 m!1156719))

(declare-fun m!1156721 () Bool)

(assert (=> start!105422 m!1156721))

(declare-fun m!1156723 () Bool)

(assert (=> start!105422 m!1156723))

(check-sat (not b!1256018) (not b_next!27081) (not b!1256015) (not start!105422) (not b!1256012) tp_is_empty!31983 (not b!1256016) (not mapNonEmpty!49759) (not b!1256011) b_and!44927)
(check-sat b_and!44927 (not b_next!27081))
