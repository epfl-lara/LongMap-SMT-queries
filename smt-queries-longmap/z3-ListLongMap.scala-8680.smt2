; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105480 () Bool)

(assert start!105480)

(declare-fun b_free!27117 () Bool)

(declare-fun b_next!27117 () Bool)

(assert (=> start!105480 (= b_free!27117 (not b_next!27117))))

(declare-fun tp!94867 () Bool)

(declare-fun b_and!44973 () Bool)

(assert (=> start!105480 (= tp!94867 b_and!44973)))

(declare-fun b!1256653 () Bool)

(declare-fun e!714429 () Bool)

(declare-fun e!714423 () Bool)

(declare-fun mapRes!49816 () Bool)

(assert (=> b!1256653 (= e!714429 (and e!714423 mapRes!49816))))

(declare-fun condMapEmpty!49816 () Bool)

(declare-datatypes ((V!48057 0))(
  ( (V!48058 (val!16072 Int)) )
))
(declare-datatypes ((ValueCell!15246 0))(
  ( (ValueCellFull!15246 (v!18773 V!48057)) (EmptyCell!15246) )
))
(declare-datatypes ((array!81676 0))(
  ( (array!81677 (arr!39396 (Array (_ BitVec 32) ValueCell!15246)) (size!39932 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81676)

(declare-fun mapDefault!49816 () ValueCell!15246)

(assert (=> b!1256653 (= condMapEmpty!49816 (= (arr!39396 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15246)) mapDefault!49816)))))

(declare-fun b!1256654 () Bool)

(declare-fun e!714425 () Bool)

(declare-fun tp_is_empty!32019 () Bool)

(assert (=> b!1256654 (= e!714425 tp_is_empty!32019)))

(declare-fun b!1256655 () Bool)

(declare-fun res!837720 () Bool)

(declare-fun e!714428 () Bool)

(assert (=> b!1256655 (=> (not res!837720) (not e!714428))))

(declare-datatypes ((array!81678 0))(
  ( (array!81679 (arr!39397 (Array (_ BitVec 32) (_ BitVec 64))) (size!39933 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81678)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81678 (_ BitVec 32)) Bool)

(assert (=> b!1256655 (= res!837720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256656 () Bool)

(declare-fun e!714426 () Bool)

(declare-fun e!714424 () Bool)

(assert (=> b!1256656 (= e!714426 e!714424)))

(declare-fun res!837717 () Bool)

(assert (=> b!1256656 (=> res!837717 e!714424)))

(declare-datatypes ((tuple2!20762 0))(
  ( (tuple2!20763 (_1!10392 (_ BitVec 64)) (_2!10392 V!48057)) )
))
(declare-datatypes ((List!27979 0))(
  ( (Nil!27976) (Cons!27975 (h!29184 tuple2!20762) (t!41468 List!27979)) )
))
(declare-datatypes ((ListLongMap!18635 0))(
  ( (ListLongMap!18636 (toList!9333 List!27979)) )
))
(declare-fun lt!568275 () ListLongMap!18635)

(declare-fun contains!7551 (ListLongMap!18635 (_ BitVec 64)) Bool)

(assert (=> b!1256656 (= res!837717 (contains!7551 lt!568275 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48057)

(declare-fun minValueBefore!43 () V!48057)

(declare-fun getCurrentListMap!4556 (array!81678 array!81676 (_ BitVec 32) (_ BitVec 32) V!48057 V!48057 (_ BitVec 32) Int) ListLongMap!18635)

(assert (=> b!1256656 (= lt!568275 (getCurrentListMap!4556 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49816 () Bool)

(assert (=> mapIsEmpty!49816 mapRes!49816))

(declare-fun res!837719 () Bool)

(assert (=> start!105480 (=> (not res!837719) (not e!714428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105480 (= res!837719 (validMask!0 mask!1466))))

(assert (=> start!105480 e!714428))

(assert (=> start!105480 true))

(assert (=> start!105480 tp!94867))

(assert (=> start!105480 tp_is_empty!32019))

(declare-fun array_inv!30013 (array!81678) Bool)

(assert (=> start!105480 (array_inv!30013 _keys!1118)))

(declare-fun array_inv!30014 (array!81676) Bool)

(assert (=> start!105480 (and (array_inv!30014 _values!914) e!714429)))

(declare-fun b!1256657 () Bool)

(assert (=> b!1256657 (= e!714423 tp_is_empty!32019)))

(declare-fun mapNonEmpty!49816 () Bool)

(declare-fun tp!94868 () Bool)

(assert (=> mapNonEmpty!49816 (= mapRes!49816 (and tp!94868 e!714425))))

(declare-fun mapRest!49816 () (Array (_ BitVec 32) ValueCell!15246))

(declare-fun mapValue!49816 () ValueCell!15246)

(declare-fun mapKey!49816 () (_ BitVec 32))

(assert (=> mapNonEmpty!49816 (= (arr!39396 _values!914) (store mapRest!49816 mapKey!49816 mapValue!49816))))

(declare-fun b!1256658 () Bool)

(declare-fun res!837715 () Bool)

(assert (=> b!1256658 (=> (not res!837715) (not e!714428))))

(declare-datatypes ((List!27980 0))(
  ( (Nil!27977) (Cons!27976 (h!29185 (_ BitVec 64)) (t!41469 List!27980)) )
))
(declare-fun arrayNoDuplicates!0 (array!81678 (_ BitVec 32) List!27980) Bool)

(assert (=> b!1256658 (= res!837715 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27977))))

(declare-fun b!1256659 () Bool)

(declare-fun res!837716 () Bool)

(assert (=> b!1256659 (=> (not res!837716) (not e!714428))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1256659 (= res!837716 (and (= (size!39932 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39933 _keys!1118) (size!39932 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256660 () Bool)

(assert (=> b!1256660 (= e!714424 true)))

(declare-fun -!2083 (ListLongMap!18635 (_ BitVec 64)) ListLongMap!18635)

(assert (=> b!1256660 (= (-!2083 lt!568275 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568275)))

(declare-datatypes ((Unit!41850 0))(
  ( (Unit!41851) )
))
(declare-fun lt!568277 () Unit!41850)

(declare-fun removeNotPresentStillSame!136 (ListLongMap!18635 (_ BitVec 64)) Unit!41850)

(assert (=> b!1256660 (= lt!568277 (removeNotPresentStillSame!136 lt!568275 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256661 () Bool)

(assert (=> b!1256661 (= e!714428 (not e!714426))))

(declare-fun res!837718 () Bool)

(assert (=> b!1256661 (=> res!837718 e!714426)))

(assert (=> b!1256661 (= res!837718 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568276 () ListLongMap!18635)

(declare-fun lt!568273 () ListLongMap!18635)

(assert (=> b!1256661 (= lt!568276 lt!568273)))

(declare-fun minValueAfter!43 () V!48057)

(declare-fun lt!568274 () Unit!41850)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1079 (array!81678 array!81676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48057 V!48057 V!48057 V!48057 (_ BitVec 32) Int) Unit!41850)

(assert (=> b!1256661 (= lt!568274 (lemmaNoChangeToArrayThenSameMapNoExtras!1079 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5715 (array!81678 array!81676 (_ BitVec 32) (_ BitVec 32) V!48057 V!48057 (_ BitVec 32) Int) ListLongMap!18635)

(assert (=> b!1256661 (= lt!568273 (getCurrentListMapNoExtraKeys!5715 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256661 (= lt!568276 (getCurrentListMapNoExtraKeys!5715 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105480 res!837719) b!1256659))

(assert (= (and b!1256659 res!837716) b!1256655))

(assert (= (and b!1256655 res!837720) b!1256658))

(assert (= (and b!1256658 res!837715) b!1256661))

(assert (= (and b!1256661 (not res!837718)) b!1256656))

(assert (= (and b!1256656 (not res!837717)) b!1256660))

(assert (= (and b!1256653 condMapEmpty!49816) mapIsEmpty!49816))

(assert (= (and b!1256653 (not condMapEmpty!49816)) mapNonEmpty!49816))

(get-info :version)

(assert (= (and mapNonEmpty!49816 ((_ is ValueCellFull!15246) mapValue!49816)) b!1256654))

(assert (= (and b!1256653 ((_ is ValueCellFull!15246) mapDefault!49816)) b!1256657))

(assert (= start!105480 b!1256653))

(declare-fun m!1157293 () Bool)

(assert (=> start!105480 m!1157293))

(declare-fun m!1157295 () Bool)

(assert (=> start!105480 m!1157295))

(declare-fun m!1157297 () Bool)

(assert (=> start!105480 m!1157297))

(declare-fun m!1157299 () Bool)

(assert (=> b!1256655 m!1157299))

(declare-fun m!1157301 () Bool)

(assert (=> b!1256658 m!1157301))

(declare-fun m!1157303 () Bool)

(assert (=> b!1256660 m!1157303))

(declare-fun m!1157305 () Bool)

(assert (=> b!1256660 m!1157305))

(declare-fun m!1157307 () Bool)

(assert (=> b!1256656 m!1157307))

(declare-fun m!1157309 () Bool)

(assert (=> b!1256656 m!1157309))

(declare-fun m!1157311 () Bool)

(assert (=> mapNonEmpty!49816 m!1157311))

(declare-fun m!1157313 () Bool)

(assert (=> b!1256661 m!1157313))

(declare-fun m!1157315 () Bool)

(assert (=> b!1256661 m!1157315))

(declare-fun m!1157317 () Bool)

(assert (=> b!1256661 m!1157317))

(check-sat (not b!1256656) (not mapNonEmpty!49816) (not start!105480) b_and!44973 (not b!1256655) (not b!1256661) (not b_next!27117) (not b!1256658) (not b!1256660) tp_is_empty!32019)
(check-sat b_and!44973 (not b_next!27117))
