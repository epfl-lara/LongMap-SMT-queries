; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105764 () Bool)

(assert start!105764)

(declare-fun b_free!27331 () Bool)

(declare-fun b_next!27331 () Bool)

(assert (=> start!105764 (= b_free!27331 (not b_next!27331))))

(declare-fun tp!95522 () Bool)

(declare-fun b_and!45209 () Bool)

(assert (=> start!105764 (= tp!95522 b_and!45209)))

(declare-fun b!1259795 () Bool)

(declare-fun res!839597 () Bool)

(declare-fun e!716758 () Bool)

(assert (=> b!1259795 (=> (not res!839597) (not e!716758))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82011 0))(
  ( (array!82012 (arr!39560 (Array (_ BitVec 32) (_ BitVec 64))) (size!40098 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82011)

(declare-datatypes ((V!48343 0))(
  ( (V!48344 (val!16179 Int)) )
))
(declare-datatypes ((ValueCell!15353 0))(
  ( (ValueCellFull!15353 (v!18881 V!48343)) (EmptyCell!15353) )
))
(declare-datatypes ((array!82013 0))(
  ( (array!82014 (arr!39561 (Array (_ BitVec 32) ValueCell!15353)) (size!40099 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82013)

(assert (=> b!1259795 (= res!839597 (and (= (size!40099 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40098 _keys!1118) (size!40099 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259796 () Bool)

(declare-fun e!716756 () Bool)

(declare-fun tp_is_empty!32233 () Bool)

(assert (=> b!1259796 (= e!716756 tp_is_empty!32233)))

(declare-fun res!839599 () Bool)

(assert (=> start!105764 (=> (not res!839599) (not e!716758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105764 (= res!839599 (validMask!0 mask!1466))))

(assert (=> start!105764 e!716758))

(assert (=> start!105764 true))

(assert (=> start!105764 tp!95522))

(assert (=> start!105764 tp_is_empty!32233))

(declare-fun array_inv!30263 (array!82011) Bool)

(assert (=> start!105764 (array_inv!30263 _keys!1118)))

(declare-fun e!716757 () Bool)

(declare-fun array_inv!30264 (array!82013) Bool)

(assert (=> start!105764 (and (array_inv!30264 _values!914) e!716757)))

(declare-fun b!1259797 () Bool)

(declare-fun mapRes!50149 () Bool)

(assert (=> b!1259797 (= e!716757 (and e!716756 mapRes!50149))))

(declare-fun condMapEmpty!50149 () Bool)

(declare-fun mapDefault!50149 () ValueCell!15353)

(assert (=> b!1259797 (= condMapEmpty!50149 (= (arr!39561 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15353)) mapDefault!50149)))))

(declare-fun b!1259798 () Bool)

(declare-fun e!716753 () Bool)

(assert (=> b!1259798 (= e!716753 tp_is_empty!32233)))

(declare-fun b!1259799 () Bool)

(declare-fun res!839598 () Bool)

(assert (=> b!1259799 (=> (not res!839598) (not e!716758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82011 (_ BitVec 32)) Bool)

(assert (=> b!1259799 (= res!839598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50149 () Bool)

(assert (=> mapIsEmpty!50149 mapRes!50149))

(declare-fun b!1259800 () Bool)

(declare-fun res!839594 () Bool)

(assert (=> b!1259800 (=> (not res!839594) (not e!716758))))

(declare-datatypes ((List!28199 0))(
  ( (Nil!28196) (Cons!28195 (h!29404 (_ BitVec 64)) (t!41687 List!28199)) )
))
(declare-fun arrayNoDuplicates!0 (array!82011 (_ BitVec 32) List!28199) Bool)

(assert (=> b!1259800 (= res!839594 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28196))))

(declare-fun b!1259801 () Bool)

(declare-fun e!716754 () Bool)

(assert (=> b!1259801 (= e!716754 true)))

(declare-datatypes ((tuple2!20996 0))(
  ( (tuple2!20997 (_1!10509 (_ BitVec 64)) (_2!10509 V!48343)) )
))
(declare-datatypes ((List!28200 0))(
  ( (Nil!28197) (Cons!28196 (h!29405 tuple2!20996) (t!41688 List!28200)) )
))
(declare-datatypes ((ListLongMap!18869 0))(
  ( (ListLongMap!18870 (toList!9450 List!28200)) )
))
(declare-fun lt!570317 () ListLongMap!18869)

(declare-fun lt!570320 () ListLongMap!18869)

(declare-fun -!2070 (ListLongMap!18869 (_ BitVec 64)) ListLongMap!18869)

(assert (=> b!1259801 (= lt!570317 (-!2070 lt!570320 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570321 () ListLongMap!18869)

(declare-fun lt!570316 () ListLongMap!18869)

(assert (=> b!1259801 (= (-!2070 lt!570321 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570316)))

(declare-datatypes ((Unit!41846 0))(
  ( (Unit!41847) )
))
(declare-fun lt!570318 () Unit!41846)

(declare-fun minValueBefore!43 () V!48343)

(declare-fun addThenRemoveForNewKeyIsSame!327 (ListLongMap!18869 (_ BitVec 64) V!48343) Unit!41846)

(assert (=> b!1259801 (= lt!570318 (addThenRemoveForNewKeyIsSame!327 lt!570316 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716755 () Bool)

(assert (=> b!1259801 e!716755))

(declare-fun res!839595 () Bool)

(assert (=> b!1259801 (=> (not res!839595) (not e!716755))))

(assert (=> b!1259801 (= res!839595 (= lt!570320 lt!570321))))

(declare-fun +!4251 (ListLongMap!18869 tuple2!20996) ListLongMap!18869)

(assert (=> b!1259801 (= lt!570321 (+!4251 lt!570316 (tuple2!20997 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570322 () ListLongMap!18869)

(declare-fun lt!570314 () tuple2!20996)

(assert (=> b!1259801 (= lt!570316 (+!4251 lt!570322 lt!570314))))

(declare-fun zeroValue!871 () V!48343)

(assert (=> b!1259801 (= lt!570314 (tuple2!20997 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48343)

(declare-fun lt!570319 () ListLongMap!18869)

(declare-fun getCurrentListMap!4536 (array!82011 array!82013 (_ BitVec 32) (_ BitVec 32) V!48343 V!48343 (_ BitVec 32) Int) ListLongMap!18869)

(assert (=> b!1259801 (= lt!570319 (getCurrentListMap!4536 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259801 (= lt!570320 (getCurrentListMap!4536 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50149 () Bool)

(declare-fun tp!95521 () Bool)

(assert (=> mapNonEmpty!50149 (= mapRes!50149 (and tp!95521 e!716753))))

(declare-fun mapValue!50149 () ValueCell!15353)

(declare-fun mapKey!50149 () (_ BitVec 32))

(declare-fun mapRest!50149 () (Array (_ BitVec 32) ValueCell!15353))

(assert (=> mapNonEmpty!50149 (= (arr!39561 _values!914) (store mapRest!50149 mapKey!50149 mapValue!50149))))

(declare-fun lt!570323 () ListLongMap!18869)

(declare-fun b!1259802 () Bool)

(assert (=> b!1259802 (= e!716755 (= lt!570319 (+!4251 lt!570323 lt!570314)))))

(declare-fun b!1259803 () Bool)

(assert (=> b!1259803 (= e!716758 (not e!716754))))

(declare-fun res!839596 () Bool)

(assert (=> b!1259803 (=> res!839596 e!716754)))

(assert (=> b!1259803 (= res!839596 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1259803 (= lt!570322 lt!570323)))

(declare-fun lt!570315 () Unit!41846)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1143 (array!82011 array!82013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48343 V!48343 V!48343 V!48343 (_ BitVec 32) Int) Unit!41846)

(assert (=> b!1259803 (= lt!570315 (lemmaNoChangeToArrayThenSameMapNoExtras!1143 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5821 (array!82011 array!82013 (_ BitVec 32) (_ BitVec 32) V!48343 V!48343 (_ BitVec 32) Int) ListLongMap!18869)

(assert (=> b!1259803 (= lt!570323 (getCurrentListMapNoExtraKeys!5821 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259803 (= lt!570322 (getCurrentListMapNoExtraKeys!5821 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105764 res!839599) b!1259795))

(assert (= (and b!1259795 res!839597) b!1259799))

(assert (= (and b!1259799 res!839598) b!1259800))

(assert (= (and b!1259800 res!839594) b!1259803))

(assert (= (and b!1259803 (not res!839596)) b!1259801))

(assert (= (and b!1259801 res!839595) b!1259802))

(assert (= (and b!1259797 condMapEmpty!50149) mapIsEmpty!50149))

(assert (= (and b!1259797 (not condMapEmpty!50149)) mapNonEmpty!50149))

(get-info :version)

(assert (= (and mapNonEmpty!50149 ((_ is ValueCellFull!15353) mapValue!50149)) b!1259798))

(assert (= (and b!1259797 ((_ is ValueCellFull!15353) mapDefault!50149)) b!1259796))

(assert (= start!105764 b!1259797))

(declare-fun m!1159917 () Bool)

(assert (=> b!1259802 m!1159917))

(declare-fun m!1159919 () Bool)

(assert (=> b!1259803 m!1159919))

(declare-fun m!1159921 () Bool)

(assert (=> b!1259803 m!1159921))

(declare-fun m!1159923 () Bool)

(assert (=> b!1259803 m!1159923))

(declare-fun m!1159925 () Bool)

(assert (=> start!105764 m!1159925))

(declare-fun m!1159927 () Bool)

(assert (=> start!105764 m!1159927))

(declare-fun m!1159929 () Bool)

(assert (=> start!105764 m!1159929))

(declare-fun m!1159931 () Bool)

(assert (=> b!1259800 m!1159931))

(declare-fun m!1159933 () Bool)

(assert (=> b!1259801 m!1159933))

(declare-fun m!1159935 () Bool)

(assert (=> b!1259801 m!1159935))

(declare-fun m!1159937 () Bool)

(assert (=> b!1259801 m!1159937))

(declare-fun m!1159939 () Bool)

(assert (=> b!1259801 m!1159939))

(declare-fun m!1159941 () Bool)

(assert (=> b!1259801 m!1159941))

(declare-fun m!1159943 () Bool)

(assert (=> b!1259801 m!1159943))

(declare-fun m!1159945 () Bool)

(assert (=> b!1259801 m!1159945))

(declare-fun m!1159947 () Bool)

(assert (=> b!1259799 m!1159947))

(declare-fun m!1159949 () Bool)

(assert (=> mapNonEmpty!50149 m!1159949))

(check-sat (not b!1259802) tp_is_empty!32233 (not b!1259803) (not start!105764) (not b!1259801) (not b!1259799) (not b_next!27331) (not mapNonEmpty!50149) b_and!45209 (not b!1259800))
(check-sat b_and!45209 (not b_next!27331))
