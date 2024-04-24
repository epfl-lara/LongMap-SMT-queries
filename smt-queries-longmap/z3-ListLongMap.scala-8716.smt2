; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105992 () Bool)

(assert start!105992)

(declare-fun b_free!27331 () Bool)

(declare-fun b_next!27331 () Bool)

(assert (=> start!105992 (= b_free!27331 (not b_next!27331))))

(declare-fun tp!95521 () Bool)

(declare-fun b_and!45229 () Bool)

(assert (=> start!105992 (= tp!95521 b_and!45229)))

(declare-fun b!1261182 () Bool)

(declare-fun e!717644 () Bool)

(declare-fun tp_is_empty!32233 () Bool)

(assert (=> b!1261182 (= e!717644 tp_is_empty!32233)))

(declare-fun b!1261183 () Bool)

(declare-fun e!717646 () Bool)

(assert (=> b!1261183 (= e!717646 true)))

(declare-datatypes ((V!48343 0))(
  ( (V!48344 (val!16179 Int)) )
))
(declare-datatypes ((tuple2!20940 0))(
  ( (tuple2!20941 (_1!10481 (_ BitVec 64)) (_2!10481 V!48343)) )
))
(declare-datatypes ((List!28166 0))(
  ( (Nil!28163) (Cons!28162 (h!29380 tuple2!20940) (t!41655 List!28166)) )
))
(declare-datatypes ((ListLongMap!18821 0))(
  ( (ListLongMap!18822 (toList!9426 List!28166)) )
))
(declare-fun lt!570977 () ListLongMap!18821)

(declare-fun lt!570978 () ListLongMap!18821)

(declare-fun -!2094 (ListLongMap!18821 (_ BitVec 64)) ListLongMap!18821)

(assert (=> b!1261183 (= lt!570977 (-!2094 lt!570978 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570980 () ListLongMap!18821)

(declare-fun lt!570983 () ListLongMap!18821)

(assert (=> b!1261183 (= (-!2094 lt!570980 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570983)))

(declare-datatypes ((Unit!41988 0))(
  ( (Unit!41989) )
))
(declare-fun lt!570984 () Unit!41988)

(declare-fun minValueBefore!43 () V!48343)

(declare-fun addThenRemoveForNewKeyIsSame!348 (ListLongMap!18821 (_ BitVec 64) V!48343) Unit!41988)

(assert (=> b!1261183 (= lt!570984 (addThenRemoveForNewKeyIsSame!348 lt!570983 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717645 () Bool)

(assert (=> b!1261183 e!717645))

(declare-fun res!840159 () Bool)

(assert (=> b!1261183 (=> (not res!840159) (not e!717645))))

(assert (=> b!1261183 (= res!840159 (= lt!570978 lt!570980))))

(declare-fun +!4265 (ListLongMap!18821 tuple2!20940) ListLongMap!18821)

(assert (=> b!1261183 (= lt!570980 (+!4265 lt!570983 (tuple2!20941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570982 () ListLongMap!18821)

(declare-fun lt!570981 () tuple2!20940)

(assert (=> b!1261183 (= lt!570983 (+!4265 lt!570982 lt!570981))))

(declare-fun zeroValue!871 () V!48343)

(assert (=> b!1261183 (= lt!570981 (tuple2!20941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48343)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82137 0))(
  ( (array!82138 (arr!39618 (Array (_ BitVec 32) (_ BitVec 64))) (size!40155 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82137)

(declare-datatypes ((ValueCell!15353 0))(
  ( (ValueCellFull!15353 (v!18878 V!48343)) (EmptyCell!15353) )
))
(declare-datatypes ((array!82139 0))(
  ( (array!82140 (arr!39619 (Array (_ BitVec 32) ValueCell!15353)) (size!40156 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82139)

(declare-fun lt!570979 () ListLongMap!18821)

(declare-fun getCurrentListMap!4606 (array!82137 array!82139 (_ BitVec 32) (_ BitVec 32) V!48343 V!48343 (_ BitVec 32) Int) ListLongMap!18821)

(assert (=> b!1261183 (= lt!570979 (getCurrentListMap!4606 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261183 (= lt!570978 (getCurrentListMap!4606 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261184 () Bool)

(declare-fun e!717648 () Bool)

(assert (=> b!1261184 (= e!717648 (not e!717646))))

(declare-fun res!840157 () Bool)

(assert (=> b!1261184 (=> res!840157 e!717646)))

(assert (=> b!1261184 (= res!840157 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!570986 () ListLongMap!18821)

(assert (=> b!1261184 (= lt!570982 lt!570986)))

(declare-fun lt!570985 () Unit!41988)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1149 (array!82137 array!82139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48343 V!48343 V!48343 V!48343 (_ BitVec 32) Int) Unit!41988)

(assert (=> b!1261184 (= lt!570985 (lemmaNoChangeToArrayThenSameMapNoExtras!1149 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5835 (array!82137 array!82139 (_ BitVec 32) (_ BitVec 32) V!48343 V!48343 (_ BitVec 32) Int) ListLongMap!18821)

(assert (=> b!1261184 (= lt!570986 (getCurrentListMapNoExtraKeys!5835 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261184 (= lt!570982 (getCurrentListMapNoExtraKeys!5835 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261185 () Bool)

(declare-fun res!840155 () Bool)

(assert (=> b!1261185 (=> (not res!840155) (not e!717648))))

(declare-datatypes ((List!28167 0))(
  ( (Nil!28164) (Cons!28163 (h!29381 (_ BitVec 64)) (t!41656 List!28167)) )
))
(declare-fun arrayNoDuplicates!0 (array!82137 (_ BitVec 32) List!28167) Bool)

(assert (=> b!1261185 (= res!840155 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28164))))

(declare-fun b!1261186 () Bool)

(declare-fun e!717649 () Bool)

(declare-fun e!717647 () Bool)

(declare-fun mapRes!50149 () Bool)

(assert (=> b!1261186 (= e!717649 (and e!717647 mapRes!50149))))

(declare-fun condMapEmpty!50149 () Bool)

(declare-fun mapDefault!50149 () ValueCell!15353)

(assert (=> b!1261186 (= condMapEmpty!50149 (= (arr!39619 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15353)) mapDefault!50149)))))

(declare-fun b!1261187 () Bool)

(assert (=> b!1261187 (= e!717645 (= lt!570979 (+!4265 lt!570986 lt!570981)))))

(declare-fun b!1261188 () Bool)

(declare-fun res!840158 () Bool)

(assert (=> b!1261188 (=> (not res!840158) (not e!717648))))

(assert (=> b!1261188 (= res!840158 (and (= (size!40156 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40155 _keys!1118) (size!40156 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261189 () Bool)

(assert (=> b!1261189 (= e!717647 tp_is_empty!32233)))

(declare-fun b!1261190 () Bool)

(declare-fun res!840156 () Bool)

(assert (=> b!1261190 (=> (not res!840156) (not e!717648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82137 (_ BitVec 32)) Bool)

(assert (=> b!1261190 (= res!840156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50149 () Bool)

(declare-fun tp!95522 () Bool)

(assert (=> mapNonEmpty!50149 (= mapRes!50149 (and tp!95522 e!717644))))

(declare-fun mapRest!50149 () (Array (_ BitVec 32) ValueCell!15353))

(declare-fun mapKey!50149 () (_ BitVec 32))

(declare-fun mapValue!50149 () ValueCell!15353)

(assert (=> mapNonEmpty!50149 (= (arr!39619 _values!914) (store mapRest!50149 mapKey!50149 mapValue!50149))))

(declare-fun res!840154 () Bool)

(assert (=> start!105992 (=> (not res!840154) (not e!717648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105992 (= res!840154 (validMask!0 mask!1466))))

(assert (=> start!105992 e!717648))

(assert (=> start!105992 true))

(assert (=> start!105992 tp!95521))

(assert (=> start!105992 tp_is_empty!32233))

(declare-fun array_inv!30309 (array!82137) Bool)

(assert (=> start!105992 (array_inv!30309 _keys!1118)))

(declare-fun array_inv!30310 (array!82139) Bool)

(assert (=> start!105992 (and (array_inv!30310 _values!914) e!717649)))

(declare-fun mapIsEmpty!50149 () Bool)

(assert (=> mapIsEmpty!50149 mapRes!50149))

(assert (= (and start!105992 res!840154) b!1261188))

(assert (= (and b!1261188 res!840158) b!1261190))

(assert (= (and b!1261190 res!840156) b!1261185))

(assert (= (and b!1261185 res!840155) b!1261184))

(assert (= (and b!1261184 (not res!840157)) b!1261183))

(assert (= (and b!1261183 res!840159) b!1261187))

(assert (= (and b!1261186 condMapEmpty!50149) mapIsEmpty!50149))

(assert (= (and b!1261186 (not condMapEmpty!50149)) mapNonEmpty!50149))

(get-info :version)

(assert (= (and mapNonEmpty!50149 ((_ is ValueCellFull!15353) mapValue!50149)) b!1261182))

(assert (= (and b!1261186 ((_ is ValueCellFull!15353) mapDefault!50149)) b!1261189))

(assert (= start!105992 b!1261186))

(declare-fun m!1162049 () Bool)

(assert (=> b!1261185 m!1162049))

(declare-fun m!1162051 () Bool)

(assert (=> start!105992 m!1162051))

(declare-fun m!1162053 () Bool)

(assert (=> start!105992 m!1162053))

(declare-fun m!1162055 () Bool)

(assert (=> start!105992 m!1162055))

(declare-fun m!1162057 () Bool)

(assert (=> b!1261187 m!1162057))

(declare-fun m!1162059 () Bool)

(assert (=> b!1261190 m!1162059))

(declare-fun m!1162061 () Bool)

(assert (=> b!1261183 m!1162061))

(declare-fun m!1162063 () Bool)

(assert (=> b!1261183 m!1162063))

(declare-fun m!1162065 () Bool)

(assert (=> b!1261183 m!1162065))

(declare-fun m!1162067 () Bool)

(assert (=> b!1261183 m!1162067))

(declare-fun m!1162069 () Bool)

(assert (=> b!1261183 m!1162069))

(declare-fun m!1162071 () Bool)

(assert (=> b!1261183 m!1162071))

(declare-fun m!1162073 () Bool)

(assert (=> b!1261183 m!1162073))

(declare-fun m!1162075 () Bool)

(assert (=> mapNonEmpty!50149 m!1162075))

(declare-fun m!1162077 () Bool)

(assert (=> b!1261184 m!1162077))

(declare-fun m!1162079 () Bool)

(assert (=> b!1261184 m!1162079))

(declare-fun m!1162081 () Bool)

(assert (=> b!1261184 m!1162081))

(check-sat (not b!1261187) (not b!1261183) (not b_next!27331) (not b!1261190) b_and!45229 (not mapNonEmpty!50149) tp_is_empty!32233 (not start!105992) (not b!1261184) (not b!1261185))
(check-sat b_and!45229 (not b_next!27331))
