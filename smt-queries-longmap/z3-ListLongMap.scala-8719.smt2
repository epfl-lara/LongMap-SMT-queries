; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105782 () Bool)

(assert start!105782)

(declare-fun b_free!27349 () Bool)

(declare-fun b_next!27349 () Bool)

(assert (=> start!105782 (= b_free!27349 (not b_next!27349))))

(declare-fun tp!95575 () Bool)

(declare-fun b_and!45227 () Bool)

(assert (=> start!105782 (= tp!95575 b_and!45227)))

(declare-fun b!1260038 () Bool)

(declare-fun res!839761 () Bool)

(declare-fun e!716945 () Bool)

(assert (=> b!1260038 (=> (not res!839761) (not e!716945))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82047 0))(
  ( (array!82048 (arr!39578 (Array (_ BitVec 32) (_ BitVec 64))) (size!40116 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82047)

(declare-datatypes ((V!48367 0))(
  ( (V!48368 (val!16188 Int)) )
))
(declare-datatypes ((ValueCell!15362 0))(
  ( (ValueCellFull!15362 (v!18890 V!48367)) (EmptyCell!15362) )
))
(declare-datatypes ((array!82049 0))(
  ( (array!82050 (arr!39579 (Array (_ BitVec 32) ValueCell!15362)) (size!40117 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82049)

(assert (=> b!1260038 (= res!839761 (and (= (size!40117 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40116 _keys!1118) (size!40117 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50176 () Bool)

(declare-fun mapRes!50176 () Bool)

(declare-fun tp!95576 () Bool)

(declare-fun e!716942 () Bool)

(assert (=> mapNonEmpty!50176 (= mapRes!50176 (and tp!95576 e!716942))))

(declare-fun mapRest!50176 () (Array (_ BitVec 32) ValueCell!15362))

(declare-fun mapKey!50176 () (_ BitVec 32))

(declare-fun mapValue!50176 () ValueCell!15362)

(assert (=> mapNonEmpty!50176 (= (arr!39579 _values!914) (store mapRest!50176 mapKey!50176 mapValue!50176))))

(declare-fun e!716947 () Bool)

(declare-datatypes ((tuple2!21014 0))(
  ( (tuple2!21015 (_1!10518 (_ BitVec 64)) (_2!10518 V!48367)) )
))
(declare-fun lt!570587 () tuple2!21014)

(declare-fun b!1260039 () Bool)

(declare-datatypes ((List!28216 0))(
  ( (Nil!28213) (Cons!28212 (h!29421 tuple2!21014) (t!41704 List!28216)) )
))
(declare-datatypes ((ListLongMap!18887 0))(
  ( (ListLongMap!18888 (toList!9459 List!28216)) )
))
(declare-fun lt!570584 () ListLongMap!18887)

(declare-fun lt!570588 () ListLongMap!18887)

(declare-fun +!4260 (ListLongMap!18887 tuple2!21014) ListLongMap!18887)

(assert (=> b!1260039 (= e!716947 (= lt!570588 (+!4260 lt!570584 lt!570587)))))

(declare-fun b!1260040 () Bool)

(declare-fun e!716946 () Bool)

(assert (=> b!1260040 (= e!716946 true)))

(declare-fun lt!570589 () ListLongMap!18887)

(declare-fun lt!570592 () ListLongMap!18887)

(declare-fun -!2078 (ListLongMap!18887 (_ BitVec 64)) ListLongMap!18887)

(assert (=> b!1260040 (= lt!570589 (-!2078 lt!570592 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570585 () ListLongMap!18887)

(declare-fun lt!570586 () ListLongMap!18887)

(assert (=> b!1260040 (= (-!2078 lt!570585 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570586)))

(declare-datatypes ((Unit!41864 0))(
  ( (Unit!41865) )
))
(declare-fun lt!570591 () Unit!41864)

(declare-fun minValueBefore!43 () V!48367)

(declare-fun addThenRemoveForNewKeyIsSame!335 (ListLongMap!18887 (_ BitVec 64) V!48367) Unit!41864)

(assert (=> b!1260040 (= lt!570591 (addThenRemoveForNewKeyIsSame!335 lt!570586 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1260040 e!716947))

(declare-fun res!839757 () Bool)

(assert (=> b!1260040 (=> (not res!839757) (not e!716947))))

(assert (=> b!1260040 (= res!839757 (= lt!570592 lt!570585))))

(assert (=> b!1260040 (= lt!570585 (+!4260 lt!570586 (tuple2!21015 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570590 () ListLongMap!18887)

(assert (=> b!1260040 (= lt!570586 (+!4260 lt!570590 lt!570587))))

(declare-fun zeroValue!871 () V!48367)

(assert (=> b!1260040 (= lt!570587 (tuple2!21015 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48367)

(declare-fun getCurrentListMap!4544 (array!82047 array!82049 (_ BitVec 32) (_ BitVec 32) V!48367 V!48367 (_ BitVec 32) Int) ListLongMap!18887)

(assert (=> b!1260040 (= lt!570588 (getCurrentListMap!4544 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260040 (= lt!570592 (getCurrentListMap!4544 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260041 () Bool)

(assert (=> b!1260041 (= e!716945 (not e!716946))))

(declare-fun res!839758 () Bool)

(assert (=> b!1260041 (=> res!839758 e!716946)))

(assert (=> b!1260041 (= res!839758 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1260041 (= lt!570590 lt!570584)))

(declare-fun lt!570593 () Unit!41864)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1152 (array!82047 array!82049 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48367 V!48367 V!48367 V!48367 (_ BitVec 32) Int) Unit!41864)

(assert (=> b!1260041 (= lt!570593 (lemmaNoChangeToArrayThenSameMapNoExtras!1152 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5830 (array!82047 array!82049 (_ BitVec 32) (_ BitVec 32) V!48367 V!48367 (_ BitVec 32) Int) ListLongMap!18887)

(assert (=> b!1260041 (= lt!570584 (getCurrentListMapNoExtraKeys!5830 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260041 (= lt!570590 (getCurrentListMapNoExtraKeys!5830 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260042 () Bool)

(declare-fun e!716941 () Bool)

(declare-fun e!716944 () Bool)

(assert (=> b!1260042 (= e!716941 (and e!716944 mapRes!50176))))

(declare-fun condMapEmpty!50176 () Bool)

(declare-fun mapDefault!50176 () ValueCell!15362)

(assert (=> b!1260042 (= condMapEmpty!50176 (= (arr!39579 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15362)) mapDefault!50176)))))

(declare-fun b!1260043 () Bool)

(declare-fun res!839759 () Bool)

(assert (=> b!1260043 (=> (not res!839759) (not e!716945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82047 (_ BitVec 32)) Bool)

(assert (=> b!1260043 (= res!839759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260044 () Bool)

(declare-fun res!839760 () Bool)

(assert (=> b!1260044 (=> (not res!839760) (not e!716945))))

(declare-datatypes ((List!28217 0))(
  ( (Nil!28214) (Cons!28213 (h!29422 (_ BitVec 64)) (t!41705 List!28217)) )
))
(declare-fun arrayNoDuplicates!0 (array!82047 (_ BitVec 32) List!28217) Bool)

(assert (=> b!1260044 (= res!839760 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28214))))

(declare-fun b!1260045 () Bool)

(declare-fun tp_is_empty!32251 () Bool)

(assert (=> b!1260045 (= e!716944 tp_is_empty!32251)))

(declare-fun b!1260046 () Bool)

(assert (=> b!1260046 (= e!716942 tp_is_empty!32251)))

(declare-fun mapIsEmpty!50176 () Bool)

(assert (=> mapIsEmpty!50176 mapRes!50176))

(declare-fun res!839756 () Bool)

(assert (=> start!105782 (=> (not res!839756) (not e!716945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105782 (= res!839756 (validMask!0 mask!1466))))

(assert (=> start!105782 e!716945))

(assert (=> start!105782 true))

(assert (=> start!105782 tp!95575))

(assert (=> start!105782 tp_is_empty!32251))

(declare-fun array_inv!30279 (array!82047) Bool)

(assert (=> start!105782 (array_inv!30279 _keys!1118)))

(declare-fun array_inv!30280 (array!82049) Bool)

(assert (=> start!105782 (and (array_inv!30280 _values!914) e!716941)))

(assert (= (and start!105782 res!839756) b!1260038))

(assert (= (and b!1260038 res!839761) b!1260043))

(assert (= (and b!1260043 res!839759) b!1260044))

(assert (= (and b!1260044 res!839760) b!1260041))

(assert (= (and b!1260041 (not res!839758)) b!1260040))

(assert (= (and b!1260040 res!839757) b!1260039))

(assert (= (and b!1260042 condMapEmpty!50176) mapIsEmpty!50176))

(assert (= (and b!1260042 (not condMapEmpty!50176)) mapNonEmpty!50176))

(get-info :version)

(assert (= (and mapNonEmpty!50176 ((_ is ValueCellFull!15362) mapValue!50176)) b!1260046))

(assert (= (and b!1260042 ((_ is ValueCellFull!15362) mapDefault!50176)) b!1260045))

(assert (= start!105782 b!1260042))

(declare-fun m!1160223 () Bool)

(assert (=> b!1260041 m!1160223))

(declare-fun m!1160225 () Bool)

(assert (=> b!1260041 m!1160225))

(declare-fun m!1160227 () Bool)

(assert (=> b!1260041 m!1160227))

(declare-fun m!1160229 () Bool)

(assert (=> mapNonEmpty!50176 m!1160229))

(declare-fun m!1160231 () Bool)

(assert (=> b!1260039 m!1160231))

(declare-fun m!1160233 () Bool)

(assert (=> b!1260040 m!1160233))

(declare-fun m!1160235 () Bool)

(assert (=> b!1260040 m!1160235))

(declare-fun m!1160237 () Bool)

(assert (=> b!1260040 m!1160237))

(declare-fun m!1160239 () Bool)

(assert (=> b!1260040 m!1160239))

(declare-fun m!1160241 () Bool)

(assert (=> b!1260040 m!1160241))

(declare-fun m!1160243 () Bool)

(assert (=> b!1260040 m!1160243))

(declare-fun m!1160245 () Bool)

(assert (=> b!1260040 m!1160245))

(declare-fun m!1160247 () Bool)

(assert (=> b!1260044 m!1160247))

(declare-fun m!1160249 () Bool)

(assert (=> b!1260043 m!1160249))

(declare-fun m!1160251 () Bool)

(assert (=> start!105782 m!1160251))

(declare-fun m!1160253 () Bool)

(assert (=> start!105782 m!1160253))

(declare-fun m!1160255 () Bool)

(assert (=> start!105782 m!1160255))

(check-sat b_and!45227 (not b!1260039) (not b!1260043) (not mapNonEmpty!50176) (not b!1260041) (not b_next!27349) tp_is_empty!32251 (not b!1260040) (not b!1260044) (not start!105782))
(check-sat b_and!45227 (not b_next!27349))
