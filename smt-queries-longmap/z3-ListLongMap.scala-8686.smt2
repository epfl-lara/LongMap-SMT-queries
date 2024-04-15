; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105510 () Bool)

(assert start!105510)

(declare-fun b_free!27151 () Bool)

(declare-fun b_next!27151 () Bool)

(assert (=> start!105510 (= b_free!27151 (not b_next!27151))))

(declare-fun tp!94969 () Bool)

(declare-fun b_and!44989 () Bool)

(assert (=> start!105510 (= tp!94969 b_and!44989)))

(declare-fun b!1257030 () Bool)

(declare-fun res!837982 () Bool)

(declare-fun e!714741 () Bool)

(assert (=> b!1257030 (=> (not res!837982) (not e!714741))))

(declare-datatypes ((array!81667 0))(
  ( (array!81668 (arr!39392 (Array (_ BitVec 32) (_ BitVec 64))) (size!39930 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81667)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81667 (_ BitVec 32)) Bool)

(assert (=> b!1257030 (= res!837982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49867 () Bool)

(declare-fun mapRes!49867 () Bool)

(assert (=> mapIsEmpty!49867 mapRes!49867))

(declare-fun b!1257031 () Bool)

(declare-fun e!714736 () Bool)

(declare-fun e!714737 () Bool)

(assert (=> b!1257031 (= e!714736 (and e!714737 mapRes!49867))))

(declare-fun condMapEmpty!49867 () Bool)

(declare-datatypes ((V!48103 0))(
  ( (V!48104 (val!16089 Int)) )
))
(declare-datatypes ((ValueCell!15263 0))(
  ( (ValueCellFull!15263 (v!18789 V!48103)) (EmptyCell!15263) )
))
(declare-datatypes ((array!81669 0))(
  ( (array!81670 (arr!39393 (Array (_ BitVec 32) ValueCell!15263)) (size!39931 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81669)

(declare-fun mapDefault!49867 () ValueCell!15263)

(assert (=> b!1257031 (= condMapEmpty!49867 (= (arr!39393 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15263)) mapDefault!49867)))))

(declare-fun b!1257032 () Bool)

(declare-fun res!837983 () Bool)

(assert (=> b!1257032 (=> (not res!837983) (not e!714741))))

(declare-datatypes ((List!28076 0))(
  ( (Nil!28073) (Cons!28072 (h!29281 (_ BitVec 64)) (t!41556 List!28076)) )
))
(declare-fun arrayNoDuplicates!0 (array!81667 (_ BitVec 32) List!28076) Bool)

(assert (=> b!1257032 (= res!837983 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28073))))

(declare-fun b!1257033 () Bool)

(declare-fun e!714739 () Bool)

(assert (=> b!1257033 (= e!714741 (not e!714739))))

(declare-fun res!837985 () Bool)

(assert (=> b!1257033 (=> res!837985 e!714739)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1257033 (= res!837985 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20868 0))(
  ( (tuple2!20869 (_1!10445 (_ BitVec 64)) (_2!10445 V!48103)) )
))
(declare-datatypes ((List!28077 0))(
  ( (Nil!28074) (Cons!28073 (h!29282 tuple2!20868) (t!41557 List!28077)) )
))
(declare-datatypes ((ListLongMap!18741 0))(
  ( (ListLongMap!18742 (toList!9386 List!28077)) )
))
(declare-fun lt!568350 () ListLongMap!18741)

(declare-fun lt!568352 () ListLongMap!18741)

(assert (=> b!1257033 (= lt!568350 lt!568352)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48103)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48103)

(declare-fun minValueBefore!43 () V!48103)

(declare-datatypes ((Unit!41729 0))(
  ( (Unit!41730) )
))
(declare-fun lt!568351 () Unit!41729)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1092 (array!81667 array!81669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48103 V!48103 V!48103 V!48103 (_ BitVec 32) Int) Unit!41729)

(assert (=> b!1257033 (= lt!568351 (lemmaNoChangeToArrayThenSameMapNoExtras!1092 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5770 (array!81667 array!81669 (_ BitVec 32) (_ BitVec 32) V!48103 V!48103 (_ BitVec 32) Int) ListLongMap!18741)

(assert (=> b!1257033 (= lt!568352 (getCurrentListMapNoExtraKeys!5770 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257033 (= lt!568350 (getCurrentListMapNoExtraKeys!5770 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257034 () Bool)

(declare-fun res!837986 () Bool)

(assert (=> b!1257034 (=> (not res!837986) (not e!714741))))

(assert (=> b!1257034 (= res!837986 (and (= (size!39931 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39930 _keys!1118) (size!39931 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257035 () Bool)

(declare-fun e!714738 () Bool)

(assert (=> b!1257035 (= e!714738 true)))

(declare-fun lt!568349 () ListLongMap!18741)

(declare-fun -!2049 (ListLongMap!18741 (_ BitVec 64)) ListLongMap!18741)

(assert (=> b!1257035 (= (-!2049 lt!568349 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568349)))

(declare-fun lt!568353 () Unit!41729)

(declare-fun removeNotPresentStillSame!144 (ListLongMap!18741 (_ BitVec 64)) Unit!41729)

(assert (=> b!1257035 (= lt!568353 (removeNotPresentStillSame!144 lt!568349 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257036 () Bool)

(declare-fun e!714735 () Bool)

(declare-fun tp_is_empty!32053 () Bool)

(assert (=> b!1257036 (= e!714735 tp_is_empty!32053)))

(declare-fun b!1257037 () Bool)

(assert (=> b!1257037 (= e!714739 e!714738)))

(declare-fun res!837984 () Bool)

(assert (=> b!1257037 (=> res!837984 e!714738)))

(declare-fun contains!7537 (ListLongMap!18741 (_ BitVec 64)) Bool)

(assert (=> b!1257037 (= res!837984 (contains!7537 lt!568349 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4496 (array!81667 array!81669 (_ BitVec 32) (_ BitVec 32) V!48103 V!48103 (_ BitVec 32) Int) ListLongMap!18741)

(assert (=> b!1257037 (= lt!568349 (getCurrentListMap!4496 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257038 () Bool)

(assert (=> b!1257038 (= e!714737 tp_is_empty!32053)))

(declare-fun res!837981 () Bool)

(assert (=> start!105510 (=> (not res!837981) (not e!714741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105510 (= res!837981 (validMask!0 mask!1466))))

(assert (=> start!105510 e!714741))

(assert (=> start!105510 true))

(assert (=> start!105510 tp!94969))

(assert (=> start!105510 tp_is_empty!32053))

(declare-fun array_inv!30141 (array!81667) Bool)

(assert (=> start!105510 (array_inv!30141 _keys!1118)))

(declare-fun array_inv!30142 (array!81669) Bool)

(assert (=> start!105510 (and (array_inv!30142 _values!914) e!714736)))

(declare-fun mapNonEmpty!49867 () Bool)

(declare-fun tp!94970 () Bool)

(assert (=> mapNonEmpty!49867 (= mapRes!49867 (and tp!94970 e!714735))))

(declare-fun mapValue!49867 () ValueCell!15263)

(declare-fun mapKey!49867 () (_ BitVec 32))

(declare-fun mapRest!49867 () (Array (_ BitVec 32) ValueCell!15263))

(assert (=> mapNonEmpty!49867 (= (arr!39393 _values!914) (store mapRest!49867 mapKey!49867 mapValue!49867))))

(assert (= (and start!105510 res!837981) b!1257034))

(assert (= (and b!1257034 res!837986) b!1257030))

(assert (= (and b!1257030 res!837982) b!1257032))

(assert (= (and b!1257032 res!837983) b!1257033))

(assert (= (and b!1257033 (not res!837985)) b!1257037))

(assert (= (and b!1257037 (not res!837984)) b!1257035))

(assert (= (and b!1257031 condMapEmpty!49867) mapIsEmpty!49867))

(assert (= (and b!1257031 (not condMapEmpty!49867)) mapNonEmpty!49867))

(get-info :version)

(assert (= (and mapNonEmpty!49867 ((_ is ValueCellFull!15263) mapValue!49867)) b!1257036))

(assert (= (and b!1257031 ((_ is ValueCellFull!15263) mapDefault!49867)) b!1257038))

(assert (= start!105510 b!1257031))

(declare-fun m!1157215 () Bool)

(assert (=> mapNonEmpty!49867 m!1157215))

(declare-fun m!1157217 () Bool)

(assert (=> b!1257032 m!1157217))

(declare-fun m!1157219 () Bool)

(assert (=> start!105510 m!1157219))

(declare-fun m!1157221 () Bool)

(assert (=> start!105510 m!1157221))

(declare-fun m!1157223 () Bool)

(assert (=> start!105510 m!1157223))

(declare-fun m!1157225 () Bool)

(assert (=> b!1257037 m!1157225))

(declare-fun m!1157227 () Bool)

(assert (=> b!1257037 m!1157227))

(declare-fun m!1157229 () Bool)

(assert (=> b!1257030 m!1157229))

(declare-fun m!1157231 () Bool)

(assert (=> b!1257035 m!1157231))

(declare-fun m!1157233 () Bool)

(assert (=> b!1257035 m!1157233))

(declare-fun m!1157235 () Bool)

(assert (=> b!1257033 m!1157235))

(declare-fun m!1157237 () Bool)

(assert (=> b!1257033 m!1157237))

(declare-fun m!1157239 () Bool)

(assert (=> b!1257033 m!1157239))

(check-sat (not b!1257032) (not b!1257035) (not b_next!27151) (not b!1257033) (not b!1257030) tp_is_empty!32053 (not b!1257037) (not mapNonEmpty!49867) (not start!105510) b_and!44989)
(check-sat b_and!44989 (not b_next!27151))
