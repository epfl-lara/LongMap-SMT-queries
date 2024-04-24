; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105714 () Bool)

(assert start!105714)

(declare-fun b_free!27127 () Bool)

(declare-fun b_next!27127 () Bool)

(assert (=> start!105714 (= b_free!27127 (not b_next!27127))))

(declare-fun tp!94897 () Bool)

(declare-fun b_and!44985 () Bool)

(assert (=> start!105714 (= tp!94897 b_and!44985)))

(declare-fun res!838326 () Bool)

(declare-fun e!715375 () Bool)

(assert (=> start!105714 (=> (not res!838326) (not e!715375))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105714 (= res!838326 (validMask!0 mask!1466))))

(assert (=> start!105714 e!715375))

(assert (=> start!105714 true))

(assert (=> start!105714 tp!94897))

(declare-fun tp_is_empty!32029 () Bool)

(assert (=> start!105714 tp_is_empty!32029))

(declare-datatypes ((array!81745 0))(
  ( (array!81746 (arr!39426 (Array (_ BitVec 32) (_ BitVec 64))) (size!39963 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81745)

(declare-fun array_inv!30169 (array!81745) Bool)

(assert (=> start!105714 (array_inv!30169 _keys!1118)))

(declare-datatypes ((V!48071 0))(
  ( (V!48072 (val!16077 Int)) )
))
(declare-datatypes ((ValueCell!15251 0))(
  ( (ValueCellFull!15251 (v!18774 V!48071)) (EmptyCell!15251) )
))
(declare-datatypes ((array!81747 0))(
  ( (array!81748 (arr!39427 (Array (_ BitVec 32) ValueCell!15251)) (size!39964 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81747)

(declare-fun e!715380 () Bool)

(declare-fun array_inv!30170 (array!81747) Bool)

(assert (=> start!105714 (and (array_inv!30170 _values!914) e!715380)))

(declare-fun b!1258093 () Bool)

(declare-fun e!715376 () Bool)

(assert (=> b!1258093 (= e!715376 tp_is_empty!32029)))

(declare-fun b!1258094 () Bool)

(declare-fun e!715381 () Bool)

(declare-fun e!715378 () Bool)

(assert (=> b!1258094 (= e!715381 e!715378)))

(declare-fun res!838325 () Bool)

(assert (=> b!1258094 (=> res!838325 e!715378)))

(declare-datatypes ((tuple2!20794 0))(
  ( (tuple2!20795 (_1!10408 (_ BitVec 64)) (_2!10408 V!48071)) )
))
(declare-datatypes ((List!28025 0))(
  ( (Nil!28022) (Cons!28021 (h!29239 tuple2!20794) (t!41506 List!28025)) )
))
(declare-datatypes ((ListLongMap!18675 0))(
  ( (ListLongMap!18676 (toList!9353 List!28025)) )
))
(declare-fun lt!568836 () ListLongMap!18675)

(declare-fun contains!7582 (ListLongMap!18675 (_ BitVec 64)) Bool)

(assert (=> b!1258094 (= res!838325 (contains!7582 lt!568836 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48071)

(declare-fun minValueBefore!43 () V!48071)

(declare-fun getCurrentListMap!4559 (array!81745 array!81747 (_ BitVec 32) (_ BitVec 32) V!48071 V!48071 (_ BitVec 32) Int) ListLongMap!18675)

(assert (=> b!1258094 (= lt!568836 (getCurrentListMap!4559 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258095 () Bool)

(assert (=> b!1258095 (= e!715375 (not e!715381))))

(declare-fun res!838328 () Bool)

(assert (=> b!1258095 (=> res!838328 e!715381)))

(assert (=> b!1258095 (= res!838328 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568833 () ListLongMap!18675)

(declare-fun lt!568832 () ListLongMap!18675)

(assert (=> b!1258095 (= lt!568833 lt!568832)))

(declare-fun minValueAfter!43 () V!48071)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41847 0))(
  ( (Unit!41848) )
))
(declare-fun lt!568835 () Unit!41847)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1084 (array!81745 array!81747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48071 V!48071 V!48071 V!48071 (_ BitVec 32) Int) Unit!41847)

(assert (=> b!1258095 (= lt!568835 (lemmaNoChangeToArrayThenSameMapNoExtras!1084 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5770 (array!81745 array!81747 (_ BitVec 32) (_ BitVec 32) V!48071 V!48071 (_ BitVec 32) Int) ListLongMap!18675)

(assert (=> b!1258095 (= lt!568832 (getCurrentListMapNoExtraKeys!5770 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258095 (= lt!568833 (getCurrentListMapNoExtraKeys!5770 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258096 () Bool)

(declare-fun res!838329 () Bool)

(assert (=> b!1258096 (=> (not res!838329) (not e!715375))))

(assert (=> b!1258096 (= res!838329 (and (= (size!39964 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39963 _keys!1118) (size!39964 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258097 () Bool)

(declare-fun res!838330 () Bool)

(assert (=> b!1258097 (=> (not res!838330) (not e!715375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81745 (_ BitVec 32)) Bool)

(assert (=> b!1258097 (= res!838330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258098 () Bool)

(declare-fun e!715379 () Bool)

(declare-fun mapRes!49831 () Bool)

(assert (=> b!1258098 (= e!715380 (and e!715379 mapRes!49831))))

(declare-fun condMapEmpty!49831 () Bool)

(declare-fun mapDefault!49831 () ValueCell!15251)

(assert (=> b!1258098 (= condMapEmpty!49831 (= (arr!39427 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15251)) mapDefault!49831)))))

(declare-fun mapIsEmpty!49831 () Bool)

(assert (=> mapIsEmpty!49831 mapRes!49831))

(declare-fun b!1258099 () Bool)

(declare-fun res!838327 () Bool)

(assert (=> b!1258099 (=> (not res!838327) (not e!715375))))

(declare-datatypes ((List!28026 0))(
  ( (Nil!28023) (Cons!28022 (h!29240 (_ BitVec 64)) (t!41507 List!28026)) )
))
(declare-fun arrayNoDuplicates!0 (array!81745 (_ BitVec 32) List!28026) Bool)

(assert (=> b!1258099 (= res!838327 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28023))))

(declare-fun b!1258100 () Bool)

(assert (=> b!1258100 (= e!715379 tp_is_empty!32029)))

(declare-fun b!1258101 () Bool)

(assert (=> b!1258101 (= e!715378 true)))

(declare-fun -!2067 (ListLongMap!18675 (_ BitVec 64)) ListLongMap!18675)

(assert (=> b!1258101 (= (-!2067 lt!568836 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568836)))

(declare-fun lt!568834 () Unit!41847)

(declare-fun removeNotPresentStillSame!139 (ListLongMap!18675 (_ BitVec 64)) Unit!41847)

(assert (=> b!1258101 (= lt!568834 (removeNotPresentStillSame!139 lt!568836 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!49831 () Bool)

(declare-fun tp!94898 () Bool)

(assert (=> mapNonEmpty!49831 (= mapRes!49831 (and tp!94898 e!715376))))

(declare-fun mapValue!49831 () ValueCell!15251)

(declare-fun mapRest!49831 () (Array (_ BitVec 32) ValueCell!15251))

(declare-fun mapKey!49831 () (_ BitVec 32))

(assert (=> mapNonEmpty!49831 (= (arr!39427 _values!914) (store mapRest!49831 mapKey!49831 mapValue!49831))))

(assert (= (and start!105714 res!838326) b!1258096))

(assert (= (and b!1258096 res!838329) b!1258097))

(assert (= (and b!1258097 res!838330) b!1258099))

(assert (= (and b!1258099 res!838327) b!1258095))

(assert (= (and b!1258095 (not res!838328)) b!1258094))

(assert (= (and b!1258094 (not res!838325)) b!1258101))

(assert (= (and b!1258098 condMapEmpty!49831) mapIsEmpty!49831))

(assert (= (and b!1258098 (not condMapEmpty!49831)) mapNonEmpty!49831))

(get-info :version)

(assert (= (and mapNonEmpty!49831 ((_ is ValueCellFull!15251) mapValue!49831)) b!1258093))

(assert (= (and b!1258098 ((_ is ValueCellFull!15251) mapDefault!49831)) b!1258100))

(assert (= start!105714 b!1258098))

(declare-fun m!1159035 () Bool)

(assert (=> b!1258095 m!1159035))

(declare-fun m!1159037 () Bool)

(assert (=> b!1258095 m!1159037))

(declare-fun m!1159039 () Bool)

(assert (=> b!1258095 m!1159039))

(declare-fun m!1159041 () Bool)

(assert (=> b!1258099 m!1159041))

(declare-fun m!1159043 () Bool)

(assert (=> b!1258094 m!1159043))

(declare-fun m!1159045 () Bool)

(assert (=> b!1258094 m!1159045))

(declare-fun m!1159047 () Bool)

(assert (=> b!1258097 m!1159047))

(declare-fun m!1159049 () Bool)

(assert (=> mapNonEmpty!49831 m!1159049))

(declare-fun m!1159051 () Bool)

(assert (=> start!105714 m!1159051))

(declare-fun m!1159053 () Bool)

(assert (=> start!105714 m!1159053))

(declare-fun m!1159055 () Bool)

(assert (=> start!105714 m!1159055))

(declare-fun m!1159057 () Bool)

(assert (=> b!1258101 m!1159057))

(declare-fun m!1159059 () Bool)

(assert (=> b!1258101 m!1159059))

(check-sat (not b!1258101) (not b!1258099) (not b!1258097) (not b!1258094) tp_is_empty!32029 (not b!1258095) (not mapNonEmpty!49831) b_and!44985 (not b_next!27127) (not start!105714))
(check-sat b_and!44985 (not b_next!27127))
