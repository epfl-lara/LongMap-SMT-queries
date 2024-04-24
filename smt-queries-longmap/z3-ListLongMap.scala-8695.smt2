; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105814 () Bool)

(assert start!105814)

(declare-fun b_free!27205 () Bool)

(declare-fun b_next!27205 () Bool)

(assert (=> start!105814 (= b_free!27205 (not b_next!27205))))

(declare-fun tp!95135 () Bool)

(declare-fun b_and!45073 () Bool)

(assert (=> start!105814 (= tp!95135 b_and!45073)))

(declare-fun res!838958 () Bool)

(declare-fun e!716166 () Bool)

(assert (=> start!105814 (=> (not res!838958) (not e!716166))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105814 (= res!838958 (validMask!0 mask!1466))))

(assert (=> start!105814 e!716166))

(assert (=> start!105814 true))

(assert (=> start!105814 tp!95135))

(declare-fun tp_is_empty!32107 () Bool)

(assert (=> start!105814 tp_is_empty!32107))

(declare-datatypes ((array!81891 0))(
  ( (array!81892 (arr!39498 (Array (_ BitVec 32) (_ BitVec 64))) (size!40035 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81891)

(declare-fun array_inv!30223 (array!81891) Bool)

(assert (=> start!105814 (array_inv!30223 _keys!1118)))

(declare-datatypes ((V!48175 0))(
  ( (V!48176 (val!16116 Int)) )
))
(declare-datatypes ((ValueCell!15290 0))(
  ( (ValueCellFull!15290 (v!18814 V!48175)) (EmptyCell!15290) )
))
(declare-datatypes ((array!81893 0))(
  ( (array!81894 (arr!39499 (Array (_ BitVec 32) ValueCell!15290)) (size!40036 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81893)

(declare-fun e!716164 () Bool)

(declare-fun array_inv!30224 (array!81893) Bool)

(assert (=> start!105814 (and (array_inv!30224 _values!914) e!716164)))

(declare-fun mapIsEmpty!49951 () Bool)

(declare-fun mapRes!49951 () Bool)

(assert (=> mapIsEmpty!49951 mapRes!49951))

(declare-fun mapNonEmpty!49951 () Bool)

(declare-fun tp!95134 () Bool)

(declare-fun e!716168 () Bool)

(assert (=> mapNonEmpty!49951 (= mapRes!49951 (and tp!95134 e!716168))))

(declare-fun mapKey!49951 () (_ BitVec 32))

(declare-fun mapValue!49951 () ValueCell!15290)

(declare-fun mapRest!49951 () (Array (_ BitVec 32) ValueCell!15290))

(assert (=> mapNonEmpty!49951 (= (arr!39499 _values!914) (store mapRest!49951 mapKey!49951 mapValue!49951))))

(declare-fun b!1259173 () Bool)

(declare-fun e!716167 () Bool)

(assert (=> b!1259173 (= e!716164 (and e!716167 mapRes!49951))))

(declare-fun condMapEmpty!49951 () Bool)

(declare-fun mapDefault!49951 () ValueCell!15290)

(assert (=> b!1259173 (= condMapEmpty!49951 (= (arr!39499 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15290)) mapDefault!49951)))))

(declare-fun b!1259174 () Bool)

(declare-fun res!838960 () Bool)

(assert (=> b!1259174 (=> (not res!838960) (not e!716166))))

(declare-datatypes ((List!28072 0))(
  ( (Nil!28069) (Cons!28068 (h!29286 (_ BitVec 64)) (t!41555 List!28072)) )
))
(declare-fun arrayNoDuplicates!0 (array!81891 (_ BitVec 32) List!28072) Bool)

(assert (=> b!1259174 (= res!838960 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28069))))

(declare-fun b!1259175 () Bool)

(assert (=> b!1259175 (= e!716167 tp_is_empty!32107)))

(declare-fun b!1259176 () Bool)

(declare-fun res!838961 () Bool)

(assert (=> b!1259176 (=> (not res!838961) (not e!716166))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1259176 (= res!838961 (and (= (size!40036 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40035 _keys!1118) (size!40036 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259177 () Bool)

(assert (=> b!1259177 (= e!716168 tp_is_empty!32107)))

(declare-fun b!1259178 () Bool)

(assert (=> b!1259178 (= e!716166 (not true))))

(declare-datatypes ((tuple2!20842 0))(
  ( (tuple2!20843 (_1!10432 (_ BitVec 64)) (_2!10432 V!48175)) )
))
(declare-datatypes ((List!28073 0))(
  ( (Nil!28070) (Cons!28069 (h!29287 tuple2!20842) (t!41556 List!28073)) )
))
(declare-datatypes ((ListLongMap!18723 0))(
  ( (ListLongMap!18724 (toList!9377 List!28073)) )
))
(declare-fun lt!569413 () ListLongMap!18723)

(declare-fun lt!569411 () ListLongMap!18723)

(assert (=> b!1259178 (= lt!569413 lt!569411)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48175)

(declare-fun zeroValue!871 () V!48175)

(declare-fun minValueBefore!43 () V!48175)

(declare-datatypes ((Unit!41897 0))(
  ( (Unit!41898) )
))
(declare-fun lt!569412 () Unit!41897)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1107 (array!81891 array!81893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48175 V!48175 V!48175 V!48175 (_ BitVec 32) Int) Unit!41897)

(assert (=> b!1259178 (= lt!569412 (lemmaNoChangeToArrayThenSameMapNoExtras!1107 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5793 (array!81891 array!81893 (_ BitVec 32) (_ BitVec 32) V!48175 V!48175 (_ BitVec 32) Int) ListLongMap!18723)

(assert (=> b!1259178 (= lt!569411 (getCurrentListMapNoExtraKeys!5793 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259178 (= lt!569413 (getCurrentListMapNoExtraKeys!5793 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259179 () Bool)

(declare-fun res!838959 () Bool)

(assert (=> b!1259179 (=> (not res!838959) (not e!716166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81891 (_ BitVec 32)) Bool)

(assert (=> b!1259179 (= res!838959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105814 res!838958) b!1259176))

(assert (= (and b!1259176 res!838961) b!1259179))

(assert (= (and b!1259179 res!838959) b!1259174))

(assert (= (and b!1259174 res!838960) b!1259178))

(assert (= (and b!1259173 condMapEmpty!49951) mapIsEmpty!49951))

(assert (= (and b!1259173 (not condMapEmpty!49951)) mapNonEmpty!49951))

(get-info :version)

(assert (= (and mapNonEmpty!49951 ((_ is ValueCellFull!15290) mapValue!49951)) b!1259177))

(assert (= (and b!1259173 ((_ is ValueCellFull!15290) mapDefault!49951)) b!1259175))

(assert (= start!105814 b!1259173))

(declare-fun m!1160007 () Bool)

(assert (=> b!1259179 m!1160007))

(declare-fun m!1160009 () Bool)

(assert (=> start!105814 m!1160009))

(declare-fun m!1160011 () Bool)

(assert (=> start!105814 m!1160011))

(declare-fun m!1160013 () Bool)

(assert (=> start!105814 m!1160013))

(declare-fun m!1160015 () Bool)

(assert (=> b!1259178 m!1160015))

(declare-fun m!1160017 () Bool)

(assert (=> b!1259178 m!1160017))

(declare-fun m!1160019 () Bool)

(assert (=> b!1259178 m!1160019))

(declare-fun m!1160021 () Bool)

(assert (=> b!1259174 m!1160021))

(declare-fun m!1160023 () Bool)

(assert (=> mapNonEmpty!49951 m!1160023))

(check-sat (not b!1259178) b_and!45073 (not b_next!27205) (not start!105814) tp_is_empty!32107 (not b!1259179) (not mapNonEmpty!49951) (not b!1259174))
(check-sat b_and!45073 (not b_next!27205))
