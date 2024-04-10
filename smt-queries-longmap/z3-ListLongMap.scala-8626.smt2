; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105046 () Bool)

(assert start!105046)

(declare-fun b_free!26793 () Bool)

(declare-fun b_next!26793 () Bool)

(assert (=> start!105046 (= b_free!26793 (not b_next!26793))))

(declare-fun tp!93877 () Bool)

(declare-fun b_and!44589 () Bool)

(assert (=> start!105046 (= tp!93877 b_and!44589)))

(declare-fun b!1251948 () Bool)

(declare-fun e!710993 () Bool)

(assert (=> b!1251948 (= e!710993 (not true))))

(declare-datatypes ((V!47625 0))(
  ( (V!47626 (val!15910 Int)) )
))
(declare-datatypes ((tuple2!20518 0))(
  ( (tuple2!20519 (_1!10270 (_ BitVec 64)) (_2!10270 V!47625)) )
))
(declare-datatypes ((List!27750 0))(
  ( (Nil!27747) (Cons!27746 (h!28955 tuple2!20518) (t!41227 List!27750)) )
))
(declare-datatypes ((ListLongMap!18391 0))(
  ( (ListLongMap!18392 (toList!9211 List!27750)) )
))
(declare-fun lt!565112 () ListLongMap!18391)

(declare-fun lt!565113 () ListLongMap!18391)

(assert (=> b!1251948 (= lt!565112 lt!565113)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47625)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81054 0))(
  ( (array!81055 (arr!39091 (Array (_ BitVec 32) (_ BitVec 64))) (size!39627 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81054)

(declare-datatypes ((ValueCell!15084 0))(
  ( (ValueCellFull!15084 (v!18608 V!47625)) (EmptyCell!15084) )
))
(declare-datatypes ((array!81056 0))(
  ( (array!81057 (arr!39092 (Array (_ BitVec 32) ValueCell!15084)) (size!39628 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81056)

(declare-datatypes ((Unit!41611 0))(
  ( (Unit!41612) )
))
(declare-fun lt!565114 () Unit!41611)

(declare-fun minValueBefore!43 () V!47625)

(declare-fun zeroValue!871 () V!47625)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!971 (array!81054 array!81056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47625 V!47625 V!47625 V!47625 (_ BitVec 32) Int) Unit!41611)

(assert (=> b!1251948 (= lt!565114 (lemmaNoChangeToArrayThenSameMapNoExtras!971 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5607 (array!81054 array!81056 (_ BitVec 32) (_ BitVec 32) V!47625 V!47625 (_ BitVec 32) Int) ListLongMap!18391)

(assert (=> b!1251948 (= lt!565113 (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251948 (= lt!565112 (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49312 () Bool)

(declare-fun mapRes!49312 () Bool)

(declare-fun tp!93878 () Bool)

(declare-fun e!710995 () Bool)

(assert (=> mapNonEmpty!49312 (= mapRes!49312 (and tp!93878 e!710995))))

(declare-fun mapRest!49312 () (Array (_ BitVec 32) ValueCell!15084))

(declare-fun mapValue!49312 () ValueCell!15084)

(declare-fun mapKey!49312 () (_ BitVec 32))

(assert (=> mapNonEmpty!49312 (= (arr!39092 _values!914) (store mapRest!49312 mapKey!49312 mapValue!49312))))

(declare-fun b!1251949 () Bool)

(declare-fun e!710991 () Bool)

(declare-fun e!710992 () Bool)

(assert (=> b!1251949 (= e!710991 (and e!710992 mapRes!49312))))

(declare-fun condMapEmpty!49312 () Bool)

(declare-fun mapDefault!49312 () ValueCell!15084)

(assert (=> b!1251949 (= condMapEmpty!49312 (= (arr!39092 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15084)) mapDefault!49312)))))

(declare-fun b!1251950 () Bool)

(declare-fun tp_is_empty!31695 () Bool)

(assert (=> b!1251950 (= e!710995 tp_is_empty!31695)))

(declare-fun res!834968 () Bool)

(assert (=> start!105046 (=> (not res!834968) (not e!710993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105046 (= res!834968 (validMask!0 mask!1466))))

(assert (=> start!105046 e!710993))

(assert (=> start!105046 true))

(assert (=> start!105046 tp!93877))

(assert (=> start!105046 tp_is_empty!31695))

(declare-fun array_inv!29817 (array!81054) Bool)

(assert (=> start!105046 (array_inv!29817 _keys!1118)))

(declare-fun array_inv!29818 (array!81056) Bool)

(assert (=> start!105046 (and (array_inv!29818 _values!914) e!710991)))

(declare-fun b!1251951 () Bool)

(assert (=> b!1251951 (= e!710992 tp_is_empty!31695)))

(declare-fun b!1251952 () Bool)

(declare-fun res!834969 () Bool)

(assert (=> b!1251952 (=> (not res!834969) (not e!710993))))

(assert (=> b!1251952 (= res!834969 (and (= (size!39628 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39627 _keys!1118) (size!39628 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251953 () Bool)

(declare-fun res!834966 () Bool)

(assert (=> b!1251953 (=> (not res!834966) (not e!710993))))

(declare-datatypes ((List!27751 0))(
  ( (Nil!27748) (Cons!27747 (h!28956 (_ BitVec 64)) (t!41228 List!27751)) )
))
(declare-fun arrayNoDuplicates!0 (array!81054 (_ BitVec 32) List!27751) Bool)

(assert (=> b!1251953 (= res!834966 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27748))))

(declare-fun b!1251954 () Bool)

(declare-fun res!834967 () Bool)

(assert (=> b!1251954 (=> (not res!834967) (not e!710993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81054 (_ BitVec 32)) Bool)

(assert (=> b!1251954 (= res!834967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49312 () Bool)

(assert (=> mapIsEmpty!49312 mapRes!49312))

(assert (= (and start!105046 res!834968) b!1251952))

(assert (= (and b!1251952 res!834969) b!1251954))

(assert (= (and b!1251954 res!834967) b!1251953))

(assert (= (and b!1251953 res!834966) b!1251948))

(assert (= (and b!1251949 condMapEmpty!49312) mapIsEmpty!49312))

(assert (= (and b!1251949 (not condMapEmpty!49312)) mapNonEmpty!49312))

(get-info :version)

(assert (= (and mapNonEmpty!49312 ((_ is ValueCellFull!15084) mapValue!49312)) b!1251950))

(assert (= (and b!1251949 ((_ is ValueCellFull!15084) mapDefault!49312)) b!1251951))

(assert (= start!105046 b!1251949))

(declare-fun m!1152653 () Bool)

(assert (=> b!1251953 m!1152653))

(declare-fun m!1152655 () Bool)

(assert (=> mapNonEmpty!49312 m!1152655))

(declare-fun m!1152657 () Bool)

(assert (=> b!1251954 m!1152657))

(declare-fun m!1152659 () Bool)

(assert (=> start!105046 m!1152659))

(declare-fun m!1152661 () Bool)

(assert (=> start!105046 m!1152661))

(declare-fun m!1152663 () Bool)

(assert (=> start!105046 m!1152663))

(declare-fun m!1152665 () Bool)

(assert (=> b!1251948 m!1152665))

(declare-fun m!1152667 () Bool)

(assert (=> b!1251948 m!1152667))

(declare-fun m!1152669 () Bool)

(assert (=> b!1251948 m!1152669))

(check-sat (not mapNonEmpty!49312) (not start!105046) (not b_next!26793) (not b!1251954) b_and!44589 (not b!1251948) (not b!1251953) tp_is_empty!31695)
(check-sat b_and!44589 (not b_next!26793))
