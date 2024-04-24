; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105066 () Bool)

(assert start!105066)

(declare-fun b_free!26647 () Bool)

(declare-fun b_next!26647 () Bool)

(assert (=> start!105066 (= b_free!26647 (not b_next!26647))))

(declare-fun tp!93430 () Bool)

(declare-fun b_and!44417 () Bool)

(assert (=> start!105066 (= tp!93430 b_and!44417)))

(declare-fun res!834125 () Bool)

(declare-fun e!710158 () Bool)

(assert (=> start!105066 (=> (not res!834125) (not e!710158))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105066 (= res!834125 (validMask!0 mask!1466))))

(assert (=> start!105066 e!710158))

(assert (=> start!105066 true))

(assert (=> start!105066 tp!93430))

(declare-fun tp_is_empty!31549 () Bool)

(assert (=> start!105066 tp_is_empty!31549))

(declare-datatypes ((array!80817 0))(
  ( (array!80818 (arr!38971 (Array (_ BitVec 32) (_ BitVec 64))) (size!39508 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80817)

(declare-fun array_inv!29849 (array!80817) Bool)

(assert (=> start!105066 (array_inv!29849 _keys!1118)))

(declare-datatypes ((V!47431 0))(
  ( (V!47432 (val!15837 Int)) )
))
(declare-datatypes ((ValueCell!15011 0))(
  ( (ValueCellFull!15011 (v!18529 V!47431)) (EmptyCell!15011) )
))
(declare-datatypes ((array!80819 0))(
  ( (array!80820 (arr!38972 (Array (_ BitVec 32) ValueCell!15011)) (size!39509 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80819)

(declare-fun e!710159 () Bool)

(declare-fun array_inv!29850 (array!80819) Bool)

(assert (=> start!105066 (and (array_inv!29850 _values!914) e!710159)))

(declare-fun mapIsEmpty!49084 () Bool)

(declare-fun mapRes!49084 () Bool)

(assert (=> mapIsEmpty!49084 mapRes!49084))

(declare-fun b!1250988 () Bool)

(declare-fun e!710156 () Bool)

(assert (=> b!1250988 (= e!710159 (and e!710156 mapRes!49084))))

(declare-fun condMapEmpty!49084 () Bool)

(declare-fun mapDefault!49084 () ValueCell!15011)

(assert (=> b!1250988 (= condMapEmpty!49084 (= (arr!38972 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15011)) mapDefault!49084)))))

(declare-fun mapNonEmpty!49084 () Bool)

(declare-fun tp!93431 () Bool)

(declare-fun e!710157 () Bool)

(assert (=> mapNonEmpty!49084 (= mapRes!49084 (and tp!93431 e!710157))))

(declare-fun mapRest!49084 () (Array (_ BitVec 32) ValueCell!15011))

(declare-fun mapKey!49084 () (_ BitVec 32))

(declare-fun mapValue!49084 () ValueCell!15011)

(assert (=> mapNonEmpty!49084 (= (arr!38972 _values!914) (store mapRest!49084 mapKey!49084 mapValue!49084))))

(declare-fun b!1250989 () Bool)

(assert (=> b!1250989 (= e!710158 (not true))))

(declare-datatypes ((tuple2!20430 0))(
  ( (tuple2!20431 (_1!10226 (_ BitVec 64)) (_2!10226 V!47431)) )
))
(declare-datatypes ((List!27685 0))(
  ( (Nil!27682) (Cons!27681 (h!28899 tuple2!20430) (t!41148 List!27685)) )
))
(declare-datatypes ((ListLongMap!18311 0))(
  ( (ListLongMap!18312 (toList!9171 List!27685)) )
))
(declare-fun lt!564318 () ListLongMap!18311)

(declare-fun lt!564320 () ListLongMap!18311)

(assert (=> b!1250989 (= lt!564318 lt!564320)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47431)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47431)

(declare-fun minValueBefore!43 () V!47431)

(declare-datatypes ((Unit!41482 0))(
  ( (Unit!41483) )
))
(declare-fun lt!564319 () Unit!41482)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!920 (array!80817 array!80819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47431 V!47431 V!47431 V!47431 (_ BitVec 32) Int) Unit!41482)

(assert (=> b!1250989 (= lt!564319 (lemmaNoChangeToArrayThenSameMapNoExtras!920 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5606 (array!80817 array!80819 (_ BitVec 32) (_ BitVec 32) V!47431 V!47431 (_ BitVec 32) Int) ListLongMap!18311)

(assert (=> b!1250989 (= lt!564320 (getCurrentListMapNoExtraKeys!5606 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250989 (= lt!564318 (getCurrentListMapNoExtraKeys!5606 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250990 () Bool)

(assert (=> b!1250990 (= e!710157 tp_is_empty!31549)))

(declare-fun b!1250991 () Bool)

(declare-fun res!834127 () Bool)

(assert (=> b!1250991 (=> (not res!834127) (not e!710158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80817 (_ BitVec 32)) Bool)

(assert (=> b!1250991 (= res!834127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250992 () Bool)

(declare-fun res!834126 () Bool)

(assert (=> b!1250992 (=> (not res!834126) (not e!710158))))

(assert (=> b!1250992 (= res!834126 (and (= (size!39509 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39508 _keys!1118) (size!39509 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250993 () Bool)

(declare-fun res!834124 () Bool)

(assert (=> b!1250993 (=> (not res!834124) (not e!710158))))

(declare-datatypes ((List!27686 0))(
  ( (Nil!27683) (Cons!27682 (h!28900 (_ BitVec 64)) (t!41149 List!27686)) )
))
(declare-fun arrayNoDuplicates!0 (array!80817 (_ BitVec 32) List!27686) Bool)

(assert (=> b!1250993 (= res!834124 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27683))))

(declare-fun b!1250994 () Bool)

(assert (=> b!1250994 (= e!710156 tp_is_empty!31549)))

(assert (= (and start!105066 res!834125) b!1250992))

(assert (= (and b!1250992 res!834126) b!1250991))

(assert (= (and b!1250991 res!834127) b!1250993))

(assert (= (and b!1250993 res!834124) b!1250989))

(assert (= (and b!1250988 condMapEmpty!49084) mapIsEmpty!49084))

(assert (= (and b!1250988 (not condMapEmpty!49084)) mapNonEmpty!49084))

(get-info :version)

(assert (= (and mapNonEmpty!49084 ((_ is ValueCellFull!15011) mapValue!49084)) b!1250990))

(assert (= (and b!1250988 ((_ is ValueCellFull!15011) mapDefault!49084)) b!1250994))

(assert (= start!105066 b!1250988))

(declare-fun m!1152189 () Bool)

(assert (=> start!105066 m!1152189))

(declare-fun m!1152191 () Bool)

(assert (=> start!105066 m!1152191))

(declare-fun m!1152193 () Bool)

(assert (=> start!105066 m!1152193))

(declare-fun m!1152195 () Bool)

(assert (=> b!1250991 m!1152195))

(declare-fun m!1152197 () Bool)

(assert (=> b!1250993 m!1152197))

(declare-fun m!1152199 () Bool)

(assert (=> b!1250989 m!1152199))

(declare-fun m!1152201 () Bool)

(assert (=> b!1250989 m!1152201))

(declare-fun m!1152203 () Bool)

(assert (=> b!1250989 m!1152203))

(declare-fun m!1152205 () Bool)

(assert (=> mapNonEmpty!49084 m!1152205))

(check-sat (not mapNonEmpty!49084) b_and!44417 (not b!1250989) (not start!105066) tp_is_empty!31549 (not b_next!26647) (not b!1250991) (not b!1250993))
(check-sat b_and!44417 (not b_next!26647))
