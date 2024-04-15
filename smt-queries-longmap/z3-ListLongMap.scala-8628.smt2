; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105052 () Bool)

(assert start!105052)

(declare-fun b_free!26803 () Bool)

(declare-fun b_next!26803 () Bool)

(assert (=> start!105052 (= b_free!26803 (not b_next!26803))))

(declare-fun tp!93907 () Bool)

(declare-fun b_and!44581 () Bool)

(assert (=> start!105052 (= tp!93907 b_and!44581)))

(declare-fun b!1251971 () Bool)

(declare-fun e!711021 () Bool)

(declare-fun tp_is_empty!31705 () Bool)

(assert (=> b!1251971 (= e!711021 tp_is_empty!31705)))

(declare-fun res!834988 () Bool)

(declare-fun e!711022 () Bool)

(assert (=> start!105052 (=> (not res!834988) (not e!711022))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105052 (= res!834988 (validMask!0 mask!1466))))

(assert (=> start!105052 e!711022))

(assert (=> start!105052 true))

(assert (=> start!105052 tp!93907))

(assert (=> start!105052 tp_is_empty!31705))

(declare-datatypes ((array!80995 0))(
  ( (array!80996 (arr!39062 (Array (_ BitVec 32) (_ BitVec 64))) (size!39600 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80995)

(declare-fun array_inv!29919 (array!80995) Bool)

(assert (=> start!105052 (array_inv!29919 _keys!1118)))

(declare-datatypes ((V!47639 0))(
  ( (V!47640 (val!15915 Int)) )
))
(declare-datatypes ((ValueCell!15089 0))(
  ( (ValueCellFull!15089 (v!18612 V!47639)) (EmptyCell!15089) )
))
(declare-datatypes ((array!80997 0))(
  ( (array!80998 (arr!39063 (Array (_ BitVec 32) ValueCell!15089)) (size!39601 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80997)

(declare-fun e!711023 () Bool)

(declare-fun array_inv!29920 (array!80997) Bool)

(assert (=> start!105052 (and (array_inv!29920 _values!914) e!711023)))

(declare-fun b!1251972 () Bool)

(declare-fun res!834987 () Bool)

(assert (=> b!1251972 (=> (not res!834987) (not e!711022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80995 (_ BitVec 32)) Bool)

(assert (=> b!1251972 (= res!834987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251973 () Bool)

(assert (=> b!1251973 (= e!711022 (not true))))

(declare-datatypes ((tuple2!20612 0))(
  ( (tuple2!20613 (_1!10317 (_ BitVec 64)) (_2!10317 V!47639)) )
))
(declare-datatypes ((List!27826 0))(
  ( (Nil!27823) (Cons!27822 (h!29031 tuple2!20612) (t!41294 List!27826)) )
))
(declare-datatypes ((ListLongMap!18485 0))(
  ( (ListLongMap!18486 (toList!9258 List!27826)) )
))
(declare-fun lt!564980 () ListLongMap!18485)

(declare-fun lt!564978 () ListLongMap!18485)

(assert (=> b!1251973 (= lt!564980 lt!564978)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47639)

(declare-datatypes ((Unit!41482 0))(
  ( (Unit!41483) )
))
(declare-fun lt!564979 () Unit!41482)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47639)

(declare-fun minValueBefore!43 () V!47639)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!984 (array!80995 array!80997 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47639 V!47639 V!47639 V!47639 (_ BitVec 32) Int) Unit!41482)

(assert (=> b!1251973 (= lt!564979 (lemmaNoChangeToArrayThenSameMapNoExtras!984 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5662 (array!80995 array!80997 (_ BitVec 32) (_ BitVec 32) V!47639 V!47639 (_ BitVec 32) Int) ListLongMap!18485)

(assert (=> b!1251973 (= lt!564978 (getCurrentListMapNoExtraKeys!5662 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251973 (= lt!564980 (getCurrentListMapNoExtraKeys!5662 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49327 () Bool)

(declare-fun mapRes!49327 () Bool)

(declare-fun tp!93908 () Bool)

(declare-fun e!711024 () Bool)

(assert (=> mapNonEmpty!49327 (= mapRes!49327 (and tp!93908 e!711024))))

(declare-fun mapRest!49327 () (Array (_ BitVec 32) ValueCell!15089))

(declare-fun mapValue!49327 () ValueCell!15089)

(declare-fun mapKey!49327 () (_ BitVec 32))

(assert (=> mapNonEmpty!49327 (= (arr!39063 _values!914) (store mapRest!49327 mapKey!49327 mapValue!49327))))

(declare-fun b!1251974 () Bool)

(declare-fun res!834986 () Bool)

(assert (=> b!1251974 (=> (not res!834986) (not e!711022))))

(assert (=> b!1251974 (= res!834986 (and (= (size!39601 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39600 _keys!1118) (size!39601 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251975 () Bool)

(assert (=> b!1251975 (= e!711023 (and e!711021 mapRes!49327))))

(declare-fun condMapEmpty!49327 () Bool)

(declare-fun mapDefault!49327 () ValueCell!15089)

(assert (=> b!1251975 (= condMapEmpty!49327 (= (arr!39063 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15089)) mapDefault!49327)))))

(declare-fun b!1251976 () Bool)

(assert (=> b!1251976 (= e!711024 tp_is_empty!31705)))

(declare-fun mapIsEmpty!49327 () Bool)

(assert (=> mapIsEmpty!49327 mapRes!49327))

(declare-fun b!1251977 () Bool)

(declare-fun res!834989 () Bool)

(assert (=> b!1251977 (=> (not res!834989) (not e!711022))))

(declare-datatypes ((List!27827 0))(
  ( (Nil!27824) (Cons!27823 (h!29032 (_ BitVec 64)) (t!41295 List!27827)) )
))
(declare-fun arrayNoDuplicates!0 (array!80995 (_ BitVec 32) List!27827) Bool)

(assert (=> b!1251977 (= res!834989 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27824))))

(assert (= (and start!105052 res!834988) b!1251974))

(assert (= (and b!1251974 res!834986) b!1251972))

(assert (= (and b!1251972 res!834987) b!1251977))

(assert (= (and b!1251977 res!834989) b!1251973))

(assert (= (and b!1251975 condMapEmpty!49327) mapIsEmpty!49327))

(assert (= (and b!1251975 (not condMapEmpty!49327)) mapNonEmpty!49327))

(get-info :version)

(assert (= (and mapNonEmpty!49327 ((_ is ValueCellFull!15089) mapValue!49327)) b!1251976))

(assert (= (and b!1251975 ((_ is ValueCellFull!15089) mapDefault!49327)) b!1251971))

(assert (= start!105052 b!1251975))

(declare-fun m!1152223 () Bool)

(assert (=> start!105052 m!1152223))

(declare-fun m!1152225 () Bool)

(assert (=> start!105052 m!1152225))

(declare-fun m!1152227 () Bool)

(assert (=> start!105052 m!1152227))

(declare-fun m!1152229 () Bool)

(assert (=> mapNonEmpty!49327 m!1152229))

(declare-fun m!1152231 () Bool)

(assert (=> b!1251973 m!1152231))

(declare-fun m!1152233 () Bool)

(assert (=> b!1251973 m!1152233))

(declare-fun m!1152235 () Bool)

(assert (=> b!1251973 m!1152235))

(declare-fun m!1152237 () Bool)

(assert (=> b!1251972 m!1152237))

(declare-fun m!1152239 () Bool)

(assert (=> b!1251977 m!1152239))

(check-sat tp_is_empty!31705 (not b!1251977) (not b_next!26803) (not start!105052) (not b!1251972) (not b!1251973) b_and!44581 (not mapNonEmpty!49327))
(check-sat b_and!44581 (not b_next!26803))
