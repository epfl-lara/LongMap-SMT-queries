; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105428 () Bool)

(assert start!105428)

(declare-fun b_free!27087 () Bool)

(declare-fun b_next!27087 () Bool)

(assert (=> start!105428 (= b_free!27087 (not b_next!27087))))

(declare-fun tp!94775 () Bool)

(declare-fun b_and!44933 () Bool)

(assert (=> start!105428 (= tp!94775 b_and!44933)))

(declare-fun b!1256091 () Bool)

(declare-fun res!837387 () Bool)

(declare-fun e!714014 () Bool)

(assert (=> b!1256091 (=> (not res!837387) (not e!714014))))

(declare-datatypes ((array!81620 0))(
  ( (array!81621 (arr!39369 (Array (_ BitVec 32) (_ BitVec 64))) (size!39905 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81620)

(declare-datatypes ((List!27958 0))(
  ( (Nil!27955) (Cons!27954 (h!29163 (_ BitVec 64)) (t!41445 List!27958)) )
))
(declare-fun arrayNoDuplicates!0 (array!81620 (_ BitVec 32) List!27958) Bool)

(assert (=> b!1256091 (= res!837387 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27955))))

(declare-fun b!1256092 () Bool)

(declare-fun e!714010 () Bool)

(declare-fun tp_is_empty!31989 () Bool)

(assert (=> b!1256092 (= e!714010 tp_is_empty!31989)))

(declare-fun mapIsEmpty!49768 () Bool)

(declare-fun mapRes!49768 () Bool)

(assert (=> mapIsEmpty!49768 mapRes!49768))

(declare-fun b!1256093 () Bool)

(declare-fun e!714013 () Bool)

(declare-fun e!714011 () Bool)

(assert (=> b!1256093 (= e!714013 e!714011)))

(declare-fun res!837386 () Bool)

(assert (=> b!1256093 (=> res!837386 e!714011)))

(declare-datatypes ((V!48017 0))(
  ( (V!48018 (val!16057 Int)) )
))
(declare-datatypes ((tuple2!20742 0))(
  ( (tuple2!20743 (_1!10382 (_ BitVec 64)) (_2!10382 V!48017)) )
))
(declare-datatypes ((List!27959 0))(
  ( (Nil!27956) (Cons!27955 (h!29164 tuple2!20742) (t!41446 List!27959)) )
))
(declare-datatypes ((ListLongMap!18615 0))(
  ( (ListLongMap!18616 (toList!9323 List!27959)) )
))
(declare-fun lt!567926 () ListLongMap!18615)

(declare-fun contains!7540 (ListLongMap!18615 (_ BitVec 64)) Bool)

(assert (=> b!1256093 (= res!837386 (contains!7540 lt!567926 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48017)

(declare-datatypes ((ValueCell!15231 0))(
  ( (ValueCellFull!15231 (v!18757 V!48017)) (EmptyCell!15231) )
))
(declare-datatypes ((array!81622 0))(
  ( (array!81623 (arr!39370 (Array (_ BitVec 32) ValueCell!15231)) (size!39906 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81622)

(declare-fun minValueBefore!43 () V!48017)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun getCurrentListMap!4546 (array!81620 array!81622 (_ BitVec 32) (_ BitVec 32) V!48017 V!48017 (_ BitVec 32) Int) ListLongMap!18615)

(assert (=> b!1256093 (= lt!567926 (getCurrentListMap!4546 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256094 () Bool)

(declare-fun e!714012 () Bool)

(assert (=> b!1256094 (= e!714012 (and e!714010 mapRes!49768))))

(declare-fun condMapEmpty!49768 () Bool)

(declare-fun mapDefault!49768 () ValueCell!15231)

(assert (=> b!1256094 (= condMapEmpty!49768 (= (arr!39370 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15231)) mapDefault!49768)))))

(declare-fun b!1256095 () Bool)

(assert (=> b!1256095 (= e!714014 (not e!714013))))

(declare-fun res!837388 () Bool)

(assert (=> b!1256095 (=> res!837388 e!714013)))

(assert (=> b!1256095 (= res!837388 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567927 () ListLongMap!18615)

(declare-fun lt!567925 () ListLongMap!18615)

(assert (=> b!1256095 (= lt!567927 lt!567925)))

(declare-datatypes ((Unit!41830 0))(
  ( (Unit!41831) )
))
(declare-fun lt!567928 () Unit!41830)

(declare-fun minValueAfter!43 () V!48017)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1070 (array!81620 array!81622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48017 V!48017 V!48017 V!48017 (_ BitVec 32) Int) Unit!41830)

(assert (=> b!1256095 (= lt!567928 (lemmaNoChangeToArrayThenSameMapNoExtras!1070 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5706 (array!81620 array!81622 (_ BitVec 32) (_ BitVec 32) V!48017 V!48017 (_ BitVec 32) Int) ListLongMap!18615)

(assert (=> b!1256095 (= lt!567925 (getCurrentListMapNoExtraKeys!5706 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256095 (= lt!567927 (getCurrentListMapNoExtraKeys!5706 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256096 () Bool)

(declare-fun res!837384 () Bool)

(assert (=> b!1256096 (=> (not res!837384) (not e!714014))))

(assert (=> b!1256096 (= res!837384 (and (= (size!39906 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39905 _keys!1118) (size!39906 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256097 () Bool)

(assert (=> b!1256097 (= e!714011 true)))

(declare-fun -!2075 (ListLongMap!18615 (_ BitVec 64)) ListLongMap!18615)

(assert (=> b!1256097 (= (-!2075 lt!567926 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567926)))

(declare-fun lt!567924 () Unit!41830)

(declare-fun removeNotPresentStillSame!128 (ListLongMap!18615 (_ BitVec 64)) Unit!41830)

(assert (=> b!1256097 (= lt!567924 (removeNotPresentStillSame!128 lt!567926 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256098 () Bool)

(declare-fun e!714009 () Bool)

(assert (=> b!1256098 (= e!714009 tp_is_empty!31989)))

(declare-fun b!1256099 () Bool)

(declare-fun res!837385 () Bool)

(assert (=> b!1256099 (=> (not res!837385) (not e!714014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81620 (_ BitVec 32)) Bool)

(assert (=> b!1256099 (= res!837385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49768 () Bool)

(declare-fun tp!94774 () Bool)

(assert (=> mapNonEmpty!49768 (= mapRes!49768 (and tp!94774 e!714009))))

(declare-fun mapRest!49768 () (Array (_ BitVec 32) ValueCell!15231))

(declare-fun mapValue!49768 () ValueCell!15231)

(declare-fun mapKey!49768 () (_ BitVec 32))

(assert (=> mapNonEmpty!49768 (= (arr!39370 _values!914) (store mapRest!49768 mapKey!49768 mapValue!49768))))

(declare-fun res!837389 () Bool)

(assert (=> start!105428 (=> (not res!837389) (not e!714014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105428 (= res!837389 (validMask!0 mask!1466))))

(assert (=> start!105428 e!714014))

(assert (=> start!105428 true))

(assert (=> start!105428 tp!94775))

(assert (=> start!105428 tp_is_empty!31989))

(declare-fun array_inv!29995 (array!81620) Bool)

(assert (=> start!105428 (array_inv!29995 _keys!1118)))

(declare-fun array_inv!29996 (array!81622) Bool)

(assert (=> start!105428 (and (array_inv!29996 _values!914) e!714012)))

(assert (= (and start!105428 res!837389) b!1256096))

(assert (= (and b!1256096 res!837384) b!1256099))

(assert (= (and b!1256099 res!837385) b!1256091))

(assert (= (and b!1256091 res!837387) b!1256095))

(assert (= (and b!1256095 (not res!837388)) b!1256093))

(assert (= (and b!1256093 (not res!837386)) b!1256097))

(assert (= (and b!1256094 condMapEmpty!49768) mapIsEmpty!49768))

(assert (= (and b!1256094 (not condMapEmpty!49768)) mapNonEmpty!49768))

(get-info :version)

(assert (= (and mapNonEmpty!49768 ((_ is ValueCellFull!15231) mapValue!49768)) b!1256098))

(assert (= (and b!1256094 ((_ is ValueCellFull!15231) mapDefault!49768)) b!1256092))

(assert (= start!105428 b!1256094))

(declare-fun m!1156777 () Bool)

(assert (=> b!1256093 m!1156777))

(declare-fun m!1156779 () Bool)

(assert (=> b!1256093 m!1156779))

(declare-fun m!1156781 () Bool)

(assert (=> b!1256095 m!1156781))

(declare-fun m!1156783 () Bool)

(assert (=> b!1256095 m!1156783))

(declare-fun m!1156785 () Bool)

(assert (=> b!1256095 m!1156785))

(declare-fun m!1156787 () Bool)

(assert (=> b!1256091 m!1156787))

(declare-fun m!1156789 () Bool)

(assert (=> mapNonEmpty!49768 m!1156789))

(declare-fun m!1156791 () Bool)

(assert (=> b!1256097 m!1156791))

(declare-fun m!1156793 () Bool)

(assert (=> b!1256097 m!1156793))

(declare-fun m!1156795 () Bool)

(assert (=> b!1256099 m!1156795))

(declare-fun m!1156797 () Bool)

(assert (=> start!105428 m!1156797))

(declare-fun m!1156799 () Bool)

(assert (=> start!105428 m!1156799))

(declare-fun m!1156801 () Bool)

(assert (=> start!105428 m!1156801))

(check-sat (not b_next!27087) (not b!1256095) (not b!1256097) (not b!1256099) (not b!1256093) (not mapNonEmpty!49768) tp_is_empty!31989 (not b!1256091) b_and!44933 (not start!105428))
(check-sat b_and!44933 (not b_next!27087))
