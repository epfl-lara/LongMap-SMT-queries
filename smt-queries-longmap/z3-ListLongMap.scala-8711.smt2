; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105718 () Bool)

(assert start!105718)

(declare-fun b_free!27303 () Bool)

(declare-fun b_next!27303 () Bool)

(assert (=> start!105718 (= b_free!27303 (not b_next!27303))))

(declare-fun tp!95435 () Bool)

(declare-fun b_and!45187 () Bool)

(assert (=> start!105718 (= tp!95435 b_and!45187)))

(declare-fun b!1259311 () Bool)

(declare-fun res!839299 () Bool)

(declare-fun e!716387 () Bool)

(assert (=> b!1259311 (=> (not res!839299) (not e!716387))))

(declare-datatypes ((array!82028 0))(
  ( (array!82029 (arr!39569 (Array (_ BitVec 32) (_ BitVec 64))) (size!40105 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82028)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82028 (_ BitVec 32)) Bool)

(assert (=> b!1259311 (= res!839299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50104 () Bool)

(declare-fun mapRes!50104 () Bool)

(assert (=> mapIsEmpty!50104 mapRes!50104))

(declare-fun b!1259313 () Bool)

(declare-fun e!716384 () Bool)

(declare-fun tp_is_empty!32205 () Bool)

(assert (=> b!1259313 (= e!716384 tp_is_empty!32205)))

(declare-fun b!1259314 () Bool)

(declare-datatypes ((V!48305 0))(
  ( (V!48306 (val!16165 Int)) )
))
(declare-datatypes ((tuple2!20892 0))(
  ( (tuple2!20893 (_1!10457 (_ BitVec 64)) (_2!10457 V!48305)) )
))
(declare-fun lt!569934 () tuple2!20892)

(declare-datatypes ((List!28101 0))(
  ( (Nil!28098) (Cons!28097 (h!29306 tuple2!20892) (t!41596 List!28101)) )
))
(declare-datatypes ((ListLongMap!18765 0))(
  ( (ListLongMap!18766 (toList!9398 List!28101)) )
))
(declare-fun lt!569935 () ListLongMap!18765)

(declare-fun lt!569933 () ListLongMap!18765)

(declare-fun e!716385 () Bool)

(declare-fun +!4203 (ListLongMap!18765 tuple2!20892) ListLongMap!18765)

(assert (=> b!1259314 (= e!716385 (= lt!569933 (+!4203 lt!569935 lt!569934)))))

(declare-fun b!1259315 () Bool)

(declare-fun res!839301 () Bool)

(assert (=> b!1259315 (=> (not res!839301) (not e!716387))))

(declare-datatypes ((List!28102 0))(
  ( (Nil!28099) (Cons!28098 (h!29307 (_ BitVec 64)) (t!41597 List!28102)) )
))
(declare-fun arrayNoDuplicates!0 (array!82028 (_ BitVec 32) List!28102) Bool)

(assert (=> b!1259315 (= res!839301 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28099))))

(declare-fun mapNonEmpty!50104 () Bool)

(declare-fun tp!95434 () Bool)

(declare-fun e!716383 () Bool)

(assert (=> mapNonEmpty!50104 (= mapRes!50104 (and tp!95434 e!716383))))

(declare-datatypes ((ValueCell!15339 0))(
  ( (ValueCellFull!15339 (v!18867 V!48305)) (EmptyCell!15339) )
))
(declare-fun mapRest!50104 () (Array (_ BitVec 32) ValueCell!15339))

(declare-datatypes ((array!82030 0))(
  ( (array!82031 (arr!39570 (Array (_ BitVec 32) ValueCell!15339)) (size!40106 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82030)

(declare-fun mapValue!50104 () ValueCell!15339)

(declare-fun mapKey!50104 () (_ BitVec 32))

(assert (=> mapNonEmpty!50104 (= (arr!39570 _values!914) (store mapRest!50104 mapKey!50104 mapValue!50104))))

(declare-fun b!1259316 () Bool)

(assert (=> b!1259316 (= e!716383 tp_is_empty!32205)))

(declare-fun b!1259317 () Bool)

(declare-fun e!716388 () Bool)

(assert (=> b!1259317 (= e!716387 (not e!716388))))

(declare-fun res!839297 () Bool)

(assert (=> b!1259317 (=> res!839297 e!716388)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259317 (= res!839297 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569936 () ListLongMap!18765)

(assert (=> b!1259317 (= lt!569936 lt!569935)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48305)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48305)

(declare-fun minValueBefore!43 () V!48305)

(declare-datatypes ((Unit!41979 0))(
  ( (Unit!41980) )
))
(declare-fun lt!569927 () Unit!41979)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1138 (array!82028 array!82030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48305 V!48305 V!48305 V!48305 (_ BitVec 32) Int) Unit!41979)

(assert (=> b!1259317 (= lt!569927 (lemmaNoChangeToArrayThenSameMapNoExtras!1138 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5774 (array!82028 array!82030 (_ BitVec 32) (_ BitVec 32) V!48305 V!48305 (_ BitVec 32) Int) ListLongMap!18765)

(assert (=> b!1259317 (= lt!569935 (getCurrentListMapNoExtraKeys!5774 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259317 (= lt!569936 (getCurrentListMapNoExtraKeys!5774 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!839300 () Bool)

(assert (=> start!105718 (=> (not res!839300) (not e!716387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105718 (= res!839300 (validMask!0 mask!1466))))

(assert (=> start!105718 e!716387))

(assert (=> start!105718 true))

(assert (=> start!105718 tp!95435))

(assert (=> start!105718 tp_is_empty!32205))

(declare-fun array_inv!30127 (array!82028) Bool)

(assert (=> start!105718 (array_inv!30127 _keys!1118)))

(declare-fun e!716386 () Bool)

(declare-fun array_inv!30128 (array!82030) Bool)

(assert (=> start!105718 (and (array_inv!30128 _values!914) e!716386)))

(declare-fun b!1259312 () Bool)

(assert (=> b!1259312 (= e!716386 (and e!716384 mapRes!50104))))

(declare-fun condMapEmpty!50104 () Bool)

(declare-fun mapDefault!50104 () ValueCell!15339)

(assert (=> b!1259312 (= condMapEmpty!50104 (= (arr!39570 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15339)) mapDefault!50104)))))

(declare-fun b!1259318 () Bool)

(assert (=> b!1259318 (= e!716388 true)))

(declare-fun lt!569932 () ListLongMap!18765)

(declare-fun lt!569929 () ListLongMap!18765)

(declare-fun -!2105 (ListLongMap!18765 (_ BitVec 64)) ListLongMap!18765)

(assert (=> b!1259318 (= lt!569932 (-!2105 lt!569929 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569928 () ListLongMap!18765)

(declare-fun lt!569930 () ListLongMap!18765)

(assert (=> b!1259318 (= (-!2105 lt!569928 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569930)))

(declare-fun lt!569931 () Unit!41979)

(declare-fun addThenRemoveForNewKeyIsSame!342 (ListLongMap!18765 (_ BitVec 64) V!48305) Unit!41979)

(assert (=> b!1259318 (= lt!569931 (addThenRemoveForNewKeyIsSame!342 lt!569930 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1259318 e!716385))

(declare-fun res!839298 () Bool)

(assert (=> b!1259318 (=> (not res!839298) (not e!716385))))

(assert (=> b!1259318 (= res!839298 (= lt!569929 lt!569928))))

(assert (=> b!1259318 (= lt!569928 (+!4203 lt!569930 (tuple2!20893 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1259318 (= lt!569930 (+!4203 lt!569936 lt!569934))))

(assert (=> b!1259318 (= lt!569934 (tuple2!20893 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4596 (array!82028 array!82030 (_ BitVec 32) (_ BitVec 32) V!48305 V!48305 (_ BitVec 32) Int) ListLongMap!18765)

(assert (=> b!1259318 (= lt!569933 (getCurrentListMap!4596 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259318 (= lt!569929 (getCurrentListMap!4596 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259319 () Bool)

(declare-fun res!839296 () Bool)

(assert (=> b!1259319 (=> (not res!839296) (not e!716387))))

(assert (=> b!1259319 (= res!839296 (and (= (size!40106 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40105 _keys!1118) (size!40106 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105718 res!839300) b!1259319))

(assert (= (and b!1259319 res!839296) b!1259311))

(assert (= (and b!1259311 res!839299) b!1259315))

(assert (= (and b!1259315 res!839301) b!1259317))

(assert (= (and b!1259317 (not res!839297)) b!1259318))

(assert (= (and b!1259318 res!839298) b!1259314))

(assert (= (and b!1259312 condMapEmpty!50104) mapIsEmpty!50104))

(assert (= (and b!1259312 (not condMapEmpty!50104)) mapNonEmpty!50104))

(get-info :version)

(assert (= (and mapNonEmpty!50104 ((_ is ValueCellFull!15339) mapValue!50104)) b!1259316))

(assert (= (and b!1259312 ((_ is ValueCellFull!15339) mapDefault!50104)) b!1259313))

(assert (= start!105718 b!1259312))

(declare-fun m!1159753 () Bool)

(assert (=> b!1259311 m!1159753))

(declare-fun m!1159755 () Bool)

(assert (=> start!105718 m!1159755))

(declare-fun m!1159757 () Bool)

(assert (=> start!105718 m!1159757))

(declare-fun m!1159759 () Bool)

(assert (=> start!105718 m!1159759))

(declare-fun m!1159761 () Bool)

(assert (=> b!1259315 m!1159761))

(declare-fun m!1159763 () Bool)

(assert (=> b!1259314 m!1159763))

(declare-fun m!1159765 () Bool)

(assert (=> b!1259318 m!1159765))

(declare-fun m!1159767 () Bool)

(assert (=> b!1259318 m!1159767))

(declare-fun m!1159769 () Bool)

(assert (=> b!1259318 m!1159769))

(declare-fun m!1159771 () Bool)

(assert (=> b!1259318 m!1159771))

(declare-fun m!1159773 () Bool)

(assert (=> b!1259318 m!1159773))

(declare-fun m!1159775 () Bool)

(assert (=> b!1259318 m!1159775))

(declare-fun m!1159777 () Bool)

(assert (=> b!1259318 m!1159777))

(declare-fun m!1159779 () Bool)

(assert (=> mapNonEmpty!50104 m!1159779))

(declare-fun m!1159781 () Bool)

(assert (=> b!1259317 m!1159781))

(declare-fun m!1159783 () Bool)

(assert (=> b!1259317 m!1159783))

(declare-fun m!1159785 () Bool)

(assert (=> b!1259317 m!1159785))

(check-sat (not b!1259314) (not mapNonEmpty!50104) b_and!45187 (not start!105718) (not b!1259318) (not b!1259311) (not b!1259317) (not b!1259315) (not b_next!27303) tp_is_empty!32205)
(check-sat b_and!45187 (not b_next!27303))
