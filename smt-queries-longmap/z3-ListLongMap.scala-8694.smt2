; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105586 () Bool)

(assert start!105586)

(declare-fun b_free!27201 () Bool)

(declare-fun b_next!27201 () Bool)

(assert (=> start!105586 (= b_free!27201 (not b_next!27201))))

(declare-fun tp!95122 () Bool)

(declare-fun b_and!45067 () Bool)

(assert (=> start!105586 (= tp!95122 b_and!45067)))

(declare-fun b!1257826 () Bool)

(declare-fun e!715290 () Bool)

(declare-fun tp_is_empty!32103 () Bool)

(assert (=> b!1257826 (= e!715290 tp_is_empty!32103)))

(declare-fun mapIsEmpty!49945 () Bool)

(declare-fun mapRes!49945 () Bool)

(assert (=> mapIsEmpty!49945 mapRes!49945))

(declare-fun b!1257827 () Bool)

(declare-fun res!838415 () Bool)

(declare-fun e!715289 () Bool)

(assert (=> b!1257827 (=> (not res!838415) (not e!715289))))

(declare-datatypes ((array!81836 0))(
  ( (array!81837 (arr!39475 (Array (_ BitVec 32) (_ BitVec 64))) (size!40011 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81836)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81836 (_ BitVec 32)) Bool)

(assert (=> b!1257827 (= res!838415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257828 () Bool)

(declare-fun res!838414 () Bool)

(assert (=> b!1257828 (=> (not res!838414) (not e!715289))))

(declare-datatypes ((List!28034 0))(
  ( (Nil!28031) (Cons!28030 (h!29239 (_ BitVec 64)) (t!41525 List!28034)) )
))
(declare-fun arrayNoDuplicates!0 (array!81836 (_ BitVec 32) List!28034) Bool)

(assert (=> b!1257828 (= res!838414 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28031))))

(declare-fun b!1257829 () Bool)

(assert (=> b!1257829 (= e!715289 (not true))))

(declare-datatypes ((V!48169 0))(
  ( (V!48170 (val!16114 Int)) )
))
(declare-datatypes ((tuple2!20820 0))(
  ( (tuple2!20821 (_1!10421 (_ BitVec 64)) (_2!10421 V!48169)) )
))
(declare-datatypes ((List!28035 0))(
  ( (Nil!28032) (Cons!28031 (h!29240 tuple2!20820) (t!41526 List!28035)) )
))
(declare-datatypes ((ListLongMap!18693 0))(
  ( (ListLongMap!18694 (toList!9362 List!28035)) )
))
(declare-fun lt!568909 () ListLongMap!18693)

(declare-fun lt!568910 () ListLongMap!18693)

(assert (=> b!1257829 (= lt!568909 lt!568910)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41908 0))(
  ( (Unit!41909) )
))
(declare-fun lt!568911 () Unit!41908)

(declare-fun minValueAfter!43 () V!48169)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48169)

(declare-datatypes ((ValueCell!15288 0))(
  ( (ValueCellFull!15288 (v!18816 V!48169)) (EmptyCell!15288) )
))
(declare-datatypes ((array!81838 0))(
  ( (array!81839 (arr!39476 (Array (_ BitVec 32) ValueCell!15288)) (size!40012 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81838)

(declare-fun minValueBefore!43 () V!48169)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1104 (array!81836 array!81838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48169 V!48169 V!48169 V!48169 (_ BitVec 32) Int) Unit!41908)

(assert (=> b!1257829 (= lt!568911 (lemmaNoChangeToArrayThenSameMapNoExtras!1104 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5740 (array!81836 array!81838 (_ BitVec 32) (_ BitVec 32) V!48169 V!48169 (_ BitVec 32) Int) ListLongMap!18693)

(assert (=> b!1257829 (= lt!568910 (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257829 (= lt!568909 (getCurrentListMapNoExtraKeys!5740 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49945 () Bool)

(declare-fun tp!95123 () Bool)

(assert (=> mapNonEmpty!49945 (= mapRes!49945 (and tp!95123 e!715290))))

(declare-fun mapRest!49945 () (Array (_ BitVec 32) ValueCell!15288))

(declare-fun mapValue!49945 () ValueCell!15288)

(declare-fun mapKey!49945 () (_ BitVec 32))

(assert (=> mapNonEmpty!49945 (= (arr!39476 _values!914) (store mapRest!49945 mapKey!49945 mapValue!49945))))

(declare-fun b!1257830 () Bool)

(declare-fun res!838416 () Bool)

(assert (=> b!1257830 (=> (not res!838416) (not e!715289))))

(assert (=> b!1257830 (= res!838416 (and (= (size!40012 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40011 _keys!1118) (size!40012 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257831 () Bool)

(declare-fun e!715287 () Bool)

(declare-fun e!715291 () Bool)

(assert (=> b!1257831 (= e!715287 (and e!715291 mapRes!49945))))

(declare-fun condMapEmpty!49945 () Bool)

(declare-fun mapDefault!49945 () ValueCell!15288)

(assert (=> b!1257831 (= condMapEmpty!49945 (= (arr!39476 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15288)) mapDefault!49945)))))

(declare-fun res!838417 () Bool)

(assert (=> start!105586 (=> (not res!838417) (not e!715289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105586 (= res!838417 (validMask!0 mask!1466))))

(assert (=> start!105586 e!715289))

(assert (=> start!105586 true))

(assert (=> start!105586 tp!95122))

(assert (=> start!105586 tp_is_empty!32103))

(declare-fun array_inv!30069 (array!81836) Bool)

(assert (=> start!105586 (array_inv!30069 _keys!1118)))

(declare-fun array_inv!30070 (array!81838) Bool)

(assert (=> start!105586 (and (array_inv!30070 _values!914) e!715287)))

(declare-fun b!1257832 () Bool)

(assert (=> b!1257832 (= e!715291 tp_is_empty!32103)))

(assert (= (and start!105586 res!838417) b!1257830))

(assert (= (and b!1257830 res!838416) b!1257827))

(assert (= (and b!1257827 res!838415) b!1257828))

(assert (= (and b!1257828 res!838414) b!1257829))

(assert (= (and b!1257831 condMapEmpty!49945) mapIsEmpty!49945))

(assert (= (and b!1257831 (not condMapEmpty!49945)) mapNonEmpty!49945))

(get-info :version)

(assert (= (and mapNonEmpty!49945 ((_ is ValueCellFull!15288) mapValue!49945)) b!1257826))

(assert (= (and b!1257831 ((_ is ValueCellFull!15288) mapDefault!49945)) b!1257832))

(assert (= start!105586 b!1257831))

(declare-fun m!1158359 () Bool)

(assert (=> mapNonEmpty!49945 m!1158359))

(declare-fun m!1158361 () Bool)

(assert (=> b!1257827 m!1158361))

(declare-fun m!1158363 () Bool)

(assert (=> start!105586 m!1158363))

(declare-fun m!1158365 () Bool)

(assert (=> start!105586 m!1158365))

(declare-fun m!1158367 () Bool)

(assert (=> start!105586 m!1158367))

(declare-fun m!1158369 () Bool)

(assert (=> b!1257828 m!1158369))

(declare-fun m!1158371 () Bool)

(assert (=> b!1257829 m!1158371))

(declare-fun m!1158373 () Bool)

(assert (=> b!1257829 m!1158373))

(declare-fun m!1158375 () Bool)

(assert (=> b!1257829 m!1158375))

(check-sat tp_is_empty!32103 (not start!105586) b_and!45067 (not b_next!27201) (not b!1257827) (not b!1257828) (not mapNonEmpty!49945) (not b!1257829))
(check-sat b_and!45067 (not b_next!27201))
