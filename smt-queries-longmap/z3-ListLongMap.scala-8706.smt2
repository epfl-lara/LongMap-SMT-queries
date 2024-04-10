; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105688 () Bool)

(assert start!105688)

(declare-fun b_free!27273 () Bool)

(declare-fun b_next!27273 () Bool)

(assert (=> start!105688 (= b_free!27273 (not b_next!27273))))

(declare-fun tp!95345 () Bool)

(declare-fun b_and!45157 () Bool)

(assert (=> start!105688 (= tp!95345 b_and!45157)))

(declare-fun b!1258906 () Bool)

(declare-fun e!716067 () Bool)

(declare-fun tp_is_empty!32175 () Bool)

(assert (=> b!1258906 (= e!716067 tp_is_empty!32175)))

(declare-fun res!839027 () Bool)

(declare-fun e!716073 () Bool)

(assert (=> start!105688 (=> (not res!839027) (not e!716073))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105688 (= res!839027 (validMask!0 mask!1466))))

(assert (=> start!105688 e!716073))

(assert (=> start!105688 true))

(assert (=> start!105688 tp!95345))

(assert (=> start!105688 tp_is_empty!32175))

(declare-datatypes ((array!81970 0))(
  ( (array!81971 (arr!39540 (Array (_ BitVec 32) (_ BitVec 64))) (size!40076 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81970)

(declare-fun array_inv!30107 (array!81970) Bool)

(assert (=> start!105688 (array_inv!30107 _keys!1118)))

(declare-datatypes ((V!48265 0))(
  ( (V!48266 (val!16150 Int)) )
))
(declare-datatypes ((ValueCell!15324 0))(
  ( (ValueCellFull!15324 (v!18852 V!48265)) (EmptyCell!15324) )
))
(declare-datatypes ((array!81972 0))(
  ( (array!81973 (arr!39541 (Array (_ BitVec 32) ValueCell!15324)) (size!40077 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81972)

(declare-fun e!716072 () Bool)

(declare-fun array_inv!30108 (array!81972) Bool)

(assert (=> start!105688 (and (array_inv!30108 _values!914) e!716072)))

(declare-fun b!1258907 () Bool)

(declare-fun res!839031 () Bool)

(assert (=> b!1258907 (=> (not res!839031) (not e!716073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81970 (_ BitVec 32)) Bool)

(assert (=> b!1258907 (= res!839031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258908 () Bool)

(declare-fun res!839029 () Bool)

(assert (=> b!1258908 (=> (not res!839029) (not e!716073))))

(declare-datatypes ((List!28076 0))(
  ( (Nil!28073) (Cons!28072 (h!29281 (_ BitVec 64)) (t!41571 List!28076)) )
))
(declare-fun arrayNoDuplicates!0 (array!81970 (_ BitVec 32) List!28076) Bool)

(assert (=> b!1258908 (= res!839029 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28073))))

(declare-fun b!1258909 () Bool)

(declare-fun e!716068 () Bool)

(declare-fun mapRes!50059 () Bool)

(assert (=> b!1258909 (= e!716072 (and e!716068 mapRes!50059))))

(declare-fun condMapEmpty!50059 () Bool)

(declare-fun mapDefault!50059 () ValueCell!15324)

(assert (=> b!1258909 (= condMapEmpty!50059 (= (arr!39541 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15324)) mapDefault!50059)))))

(declare-fun b!1258910 () Bool)

(declare-fun res!839026 () Bool)

(assert (=> b!1258910 (=> (not res!839026) (not e!716073))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258910 (= res!839026 (and (= (size!40077 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40076 _keys!1118) (size!40077 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50059 () Bool)

(declare-fun tp!95344 () Bool)

(assert (=> mapNonEmpty!50059 (= mapRes!50059 (and tp!95344 e!716067))))

(declare-fun mapKey!50059 () (_ BitVec 32))

(declare-fun mapValue!50059 () ValueCell!15324)

(declare-fun mapRest!50059 () (Array (_ BitVec 32) ValueCell!15324))

(assert (=> mapNonEmpty!50059 (= (arr!39541 _values!914) (store mapRest!50059 mapKey!50059 mapValue!50059))))

(declare-datatypes ((tuple2!20866 0))(
  ( (tuple2!20867 (_1!10444 (_ BitVec 64)) (_2!10444 V!48265)) )
))
(declare-fun lt!569490 () tuple2!20866)

(declare-datatypes ((List!28077 0))(
  ( (Nil!28074) (Cons!28073 (h!29282 tuple2!20866) (t!41572 List!28077)) )
))
(declare-datatypes ((ListLongMap!18739 0))(
  ( (ListLongMap!18740 (toList!9385 List!28077)) )
))
(declare-fun lt!569492 () ListLongMap!18739)

(declare-fun b!1258911 () Bool)

(declare-fun lt!569488 () ListLongMap!18739)

(declare-fun e!716069 () Bool)

(declare-fun +!4191 (ListLongMap!18739 tuple2!20866) ListLongMap!18739)

(assert (=> b!1258911 (= e!716069 (= lt!569492 (+!4191 lt!569488 lt!569490)))))

(declare-fun b!1258912 () Bool)

(assert (=> b!1258912 (= e!716068 tp_is_empty!32175)))

(declare-fun mapIsEmpty!50059 () Bool)

(assert (=> mapIsEmpty!50059 mapRes!50059))

(declare-fun b!1258913 () Bool)

(declare-fun e!716070 () Bool)

(assert (=> b!1258913 (= e!716070 true)))

(declare-fun lt!569491 () Bool)

(declare-fun lt!569486 () ListLongMap!18739)

(declare-fun contains!7571 (ListLongMap!18739 (_ BitVec 64)) Bool)

(assert (=> b!1258913 (= lt!569491 (contains!7571 lt!569486 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1258913 e!716069))

(declare-fun res!839030 () Bool)

(assert (=> b!1258913 (=> (not res!839030) (not e!716069))))

(declare-fun lt!569489 () ListLongMap!18739)

(declare-fun minValueBefore!43 () V!48265)

(assert (=> b!1258913 (= res!839030 (= lt!569489 (+!4191 lt!569486 (tuple2!20867 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!569485 () ListLongMap!18739)

(assert (=> b!1258913 (= lt!569486 (+!4191 lt!569485 lt!569490))))

(declare-fun zeroValue!871 () V!48265)

(assert (=> b!1258913 (= lt!569490 (tuple2!20867 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48265)

(declare-fun getCurrentListMap!4585 (array!81970 array!81972 (_ BitVec 32) (_ BitVec 32) V!48265 V!48265 (_ BitVec 32) Int) ListLongMap!18739)

(assert (=> b!1258913 (= lt!569492 (getCurrentListMap!4585 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258913 (= lt!569489 (getCurrentListMap!4585 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258914 () Bool)

(assert (=> b!1258914 (= e!716073 (not e!716070))))

(declare-fun res!839028 () Bool)

(assert (=> b!1258914 (=> res!839028 e!716070)))

(assert (=> b!1258914 (= res!839028 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1258914 (= lt!569485 lt!569488)))

(declare-datatypes ((Unit!41953 0))(
  ( (Unit!41954) )
))
(declare-fun lt!569487 () Unit!41953)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1126 (array!81970 array!81972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48265 V!48265 V!48265 V!48265 (_ BitVec 32) Int) Unit!41953)

(assert (=> b!1258914 (= lt!569487 (lemmaNoChangeToArrayThenSameMapNoExtras!1126 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5762 (array!81970 array!81972 (_ BitVec 32) (_ BitVec 32) V!48265 V!48265 (_ BitVec 32) Int) ListLongMap!18739)

(assert (=> b!1258914 (= lt!569488 (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258914 (= lt!569485 (getCurrentListMapNoExtraKeys!5762 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105688 res!839027) b!1258910))

(assert (= (and b!1258910 res!839026) b!1258907))

(assert (= (and b!1258907 res!839031) b!1258908))

(assert (= (and b!1258908 res!839029) b!1258914))

(assert (= (and b!1258914 (not res!839028)) b!1258913))

(assert (= (and b!1258913 res!839030) b!1258911))

(assert (= (and b!1258909 condMapEmpty!50059) mapIsEmpty!50059))

(assert (= (and b!1258909 (not condMapEmpty!50059)) mapNonEmpty!50059))

(get-info :version)

(assert (= (and mapNonEmpty!50059 ((_ is ValueCellFull!15324) mapValue!50059)) b!1258906))

(assert (= (and b!1258909 ((_ is ValueCellFull!15324) mapDefault!50059)) b!1258912))

(assert (= start!105688 b!1258909))

(declare-fun m!1159251 () Bool)

(assert (=> b!1258907 m!1159251))

(declare-fun m!1159253 () Bool)

(assert (=> b!1258908 m!1159253))

(declare-fun m!1159255 () Bool)

(assert (=> b!1258913 m!1159255))

(declare-fun m!1159257 () Bool)

(assert (=> b!1258913 m!1159257))

(declare-fun m!1159259 () Bool)

(assert (=> b!1258913 m!1159259))

(declare-fun m!1159261 () Bool)

(assert (=> b!1258913 m!1159261))

(declare-fun m!1159263 () Bool)

(assert (=> b!1258913 m!1159263))

(declare-fun m!1159265 () Bool)

(assert (=> start!105688 m!1159265))

(declare-fun m!1159267 () Bool)

(assert (=> start!105688 m!1159267))

(declare-fun m!1159269 () Bool)

(assert (=> start!105688 m!1159269))

(declare-fun m!1159271 () Bool)

(assert (=> b!1258911 m!1159271))

(declare-fun m!1159273 () Bool)

(assert (=> b!1258914 m!1159273))

(declare-fun m!1159275 () Bool)

(assert (=> b!1258914 m!1159275))

(declare-fun m!1159277 () Bool)

(assert (=> b!1258914 m!1159277))

(declare-fun m!1159279 () Bool)

(assert (=> mapNonEmpty!50059 m!1159279))

(check-sat b_and!45157 (not b_next!27273) (not start!105688) (not b!1258911) (not b!1258914) tp_is_empty!32175 (not b!1258913) (not b!1258907) (not b!1258908) (not mapNonEmpty!50059))
(check-sat b_and!45157 (not b_next!27273))
