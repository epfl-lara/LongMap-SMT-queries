; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105654 () Bool)

(assert start!105654)

(declare-fun b_free!27255 () Bool)

(declare-fun b_next!27255 () Bool)

(assert (=> start!105654 (= b_free!27255 (not b_next!27255))))

(declare-fun tp!95287 () Bool)

(declare-fun b_and!45129 () Bool)

(assert (=> start!105654 (= tp!95287 b_and!45129)))

(declare-fun b!1258537 () Bool)

(declare-fun res!838832 () Bool)

(declare-fun e!715809 () Bool)

(assert (=> b!1258537 (=> (not res!838832) (not e!715809))))

(declare-datatypes ((array!81934 0))(
  ( (array!81935 (arr!39523 (Array (_ BitVec 32) (_ BitVec 64))) (size!40059 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81934)

(declare-datatypes ((List!28064 0))(
  ( (Nil!28061) (Cons!28060 (h!29269 (_ BitVec 64)) (t!41557 List!28064)) )
))
(declare-fun arrayNoDuplicates!0 (array!81934 (_ BitVec 32) List!28064) Bool)

(assert (=> b!1258537 (= res!838832 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28061))))

(declare-fun b!1258538 () Bool)

(declare-fun e!715806 () Bool)

(declare-fun tp_is_empty!32157 () Bool)

(assert (=> b!1258538 (= e!715806 tp_is_empty!32157)))

(declare-fun b!1258539 () Bool)

(declare-fun e!715811 () Bool)

(assert (=> b!1258539 (= e!715809 (not e!715811))))

(declare-fun res!838830 () Bool)

(assert (=> b!1258539 (=> res!838830 e!715811)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258539 (= res!838830 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48241 0))(
  ( (V!48242 (val!16141 Int)) )
))
(declare-datatypes ((tuple2!20850 0))(
  ( (tuple2!20851 (_1!10436 (_ BitVec 64)) (_2!10436 V!48241)) )
))
(declare-datatypes ((List!28065 0))(
  ( (Nil!28062) (Cons!28061 (h!29270 tuple2!20850) (t!41558 List!28065)) )
))
(declare-datatypes ((ListLongMap!18723 0))(
  ( (ListLongMap!18724 (toList!9377 List!28065)) )
))
(declare-fun lt!569252 () ListLongMap!18723)

(declare-fun lt!569253 () ListLongMap!18723)

(assert (=> b!1258539 (= lt!569252 lt!569253)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48241)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48241)

(declare-datatypes ((ValueCell!15315 0))(
  ( (ValueCellFull!15315 (v!18843 V!48241)) (EmptyCell!15315) )
))
(declare-datatypes ((array!81936 0))(
  ( (array!81937 (arr!39524 (Array (_ BitVec 32) ValueCell!15315)) (size!40060 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81936)

(declare-datatypes ((Unit!41936 0))(
  ( (Unit!41937) )
))
(declare-fun lt!569254 () Unit!41936)

(declare-fun minValueBefore!43 () V!48241)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1118 (array!81934 array!81936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48241 V!48241 V!48241 V!48241 (_ BitVec 32) Int) Unit!41936)

(assert (=> b!1258539 (= lt!569254 (lemmaNoChangeToArrayThenSameMapNoExtras!1118 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5754 (array!81934 array!81936 (_ BitVec 32) (_ BitVec 32) V!48241 V!48241 (_ BitVec 32) Int) ListLongMap!18723)

(assert (=> b!1258539 (= lt!569253 (getCurrentListMapNoExtraKeys!5754 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258539 (= lt!569252 (getCurrentListMapNoExtraKeys!5754 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258541 () Bool)

(declare-fun e!715807 () Bool)

(declare-fun mapRes!50029 () Bool)

(assert (=> b!1258541 (= e!715807 (and e!715806 mapRes!50029))))

(declare-fun condMapEmpty!50029 () Bool)

(declare-fun mapDefault!50029 () ValueCell!15315)

(assert (=> b!1258541 (= condMapEmpty!50029 (= (arr!39524 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15315)) mapDefault!50029)))))

(declare-fun mapNonEmpty!50029 () Bool)

(declare-fun tp!95288 () Bool)

(declare-fun e!715810 () Bool)

(assert (=> mapNonEmpty!50029 (= mapRes!50029 (and tp!95288 e!715810))))

(declare-fun mapValue!50029 () ValueCell!15315)

(declare-fun mapRest!50029 () (Array (_ BitVec 32) ValueCell!15315))

(declare-fun mapKey!50029 () (_ BitVec 32))

(assert (=> mapNonEmpty!50029 (= (arr!39524 _values!914) (store mapRest!50029 mapKey!50029 mapValue!50029))))

(declare-fun b!1258542 () Bool)

(assert (=> b!1258542 (= e!715811 true)))

(declare-fun lt!569251 () ListLongMap!18723)

(declare-fun getCurrentListMap!4580 (array!81934 array!81936 (_ BitVec 32) (_ BitVec 32) V!48241 V!48241 (_ BitVec 32) Int) ListLongMap!18723)

(assert (=> b!1258542 (= lt!569251 (getCurrentListMap!4580 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258543 () Bool)

(declare-fun res!838828 () Bool)

(assert (=> b!1258543 (=> (not res!838828) (not e!715809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81934 (_ BitVec 32)) Bool)

(assert (=> b!1258543 (= res!838828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258544 () Bool)

(declare-fun res!838831 () Bool)

(assert (=> b!1258544 (=> (not res!838831) (not e!715809))))

(assert (=> b!1258544 (= res!838831 (and (= (size!40060 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40059 _keys!1118) (size!40060 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50029 () Bool)

(assert (=> mapIsEmpty!50029 mapRes!50029))

(declare-fun res!838829 () Bool)

(assert (=> start!105654 (=> (not res!838829) (not e!715809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105654 (= res!838829 (validMask!0 mask!1466))))

(assert (=> start!105654 e!715809))

(assert (=> start!105654 true))

(assert (=> start!105654 tp!95287))

(assert (=> start!105654 tp_is_empty!32157))

(declare-fun array_inv!30099 (array!81934) Bool)

(assert (=> start!105654 (array_inv!30099 _keys!1118)))

(declare-fun array_inv!30100 (array!81936) Bool)

(assert (=> start!105654 (and (array_inv!30100 _values!914) e!715807)))

(declare-fun b!1258540 () Bool)

(assert (=> b!1258540 (= e!715810 tp_is_empty!32157)))

(assert (= (and start!105654 res!838829) b!1258544))

(assert (= (and b!1258544 res!838831) b!1258543))

(assert (= (and b!1258543 res!838828) b!1258537))

(assert (= (and b!1258537 res!838832) b!1258539))

(assert (= (and b!1258539 (not res!838830)) b!1258542))

(assert (= (and b!1258541 condMapEmpty!50029) mapIsEmpty!50029))

(assert (= (and b!1258541 (not condMapEmpty!50029)) mapNonEmpty!50029))

(get-info :version)

(assert (= (and mapNonEmpty!50029 ((_ is ValueCellFull!15315) mapValue!50029)) b!1258540))

(assert (= (and b!1258541 ((_ is ValueCellFull!15315) mapDefault!50029)) b!1258538))

(assert (= start!105654 b!1258541))

(declare-fun m!1158949 () Bool)

(assert (=> b!1258543 m!1158949))

(declare-fun m!1158951 () Bool)

(assert (=> b!1258539 m!1158951))

(declare-fun m!1158953 () Bool)

(assert (=> b!1258539 m!1158953))

(declare-fun m!1158955 () Bool)

(assert (=> b!1258539 m!1158955))

(declare-fun m!1158957 () Bool)

(assert (=> mapNonEmpty!50029 m!1158957))

(declare-fun m!1158959 () Bool)

(assert (=> b!1258537 m!1158959))

(declare-fun m!1158961 () Bool)

(assert (=> start!105654 m!1158961))

(declare-fun m!1158963 () Bool)

(assert (=> start!105654 m!1158963))

(declare-fun m!1158965 () Bool)

(assert (=> start!105654 m!1158965))

(declare-fun m!1158967 () Bool)

(assert (=> b!1258542 m!1158967))

(check-sat tp_is_empty!32157 (not mapNonEmpty!50029) (not b_next!27255) (not b!1258542) (not b!1258537) (not b!1258543) b_and!45129 (not start!105654) (not b!1258539))
(check-sat b_and!45129 (not b_next!27255))
