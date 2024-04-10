; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105618 () Bool)

(assert start!105618)

(declare-fun b_free!27219 () Bool)

(declare-fun b_next!27219 () Bool)

(assert (=> start!105618 (= b_free!27219 (not b_next!27219))))

(declare-fun tp!95179 () Bool)

(declare-fun b_and!45093 () Bool)

(assert (=> start!105618 (= tp!95179 b_and!45093)))

(declare-fun b!1258105 () Bool)

(declare-fun res!838559 () Bool)

(declare-fun e!715487 () Bool)

(assert (=> b!1258105 (=> (not res!838559) (not e!715487))))

(declare-datatypes ((array!81872 0))(
  ( (array!81873 (arr!39492 (Array (_ BitVec 32) (_ BitVec 64))) (size!40028 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81872)

(declare-datatypes ((List!28044 0))(
  ( (Nil!28041) (Cons!28040 (h!29249 (_ BitVec 64)) (t!41537 List!28044)) )
))
(declare-fun arrayNoDuplicates!0 (array!81872 (_ BitVec 32) List!28044) Bool)

(assert (=> b!1258105 (= res!838559 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28041))))

(declare-fun mapNonEmpty!49975 () Bool)

(declare-fun mapRes!49975 () Bool)

(declare-fun tp!95180 () Bool)

(declare-fun e!715484 () Bool)

(assert (=> mapNonEmpty!49975 (= mapRes!49975 (and tp!95180 e!715484))))

(declare-datatypes ((V!48193 0))(
  ( (V!48194 (val!16123 Int)) )
))
(declare-datatypes ((ValueCell!15297 0))(
  ( (ValueCellFull!15297 (v!18825 V!48193)) (EmptyCell!15297) )
))
(declare-datatypes ((array!81874 0))(
  ( (array!81875 (arr!39493 (Array (_ BitVec 32) ValueCell!15297)) (size!40029 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81874)

(declare-fun mapKey!49975 () (_ BitVec 32))

(declare-fun mapValue!49975 () ValueCell!15297)

(declare-fun mapRest!49975 () (Array (_ BitVec 32) ValueCell!15297))

(assert (=> mapNonEmpty!49975 (= (arr!39493 _values!914) (store mapRest!49975 mapKey!49975 mapValue!49975))))

(declare-fun mapIsEmpty!49975 () Bool)

(assert (=> mapIsEmpty!49975 mapRes!49975))

(declare-fun b!1258106 () Bool)

(declare-fun res!838562 () Bool)

(assert (=> b!1258106 (=> (not res!838562) (not e!715487))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81872 (_ BitVec 32)) Bool)

(assert (=> b!1258106 (= res!838562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258107 () Bool)

(declare-fun e!715483 () Bool)

(assert (=> b!1258107 (= e!715483 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((tuple2!20828 0))(
  ( (tuple2!20829 (_1!10425 (_ BitVec 64)) (_2!10425 V!48193)) )
))
(declare-datatypes ((List!28045 0))(
  ( (Nil!28042) (Cons!28041 (h!29250 tuple2!20828) (t!41538 List!28045)) )
))
(declare-datatypes ((ListLongMap!18701 0))(
  ( (ListLongMap!18702 (toList!9366 List!28045)) )
))
(declare-fun lt!569038 () ListLongMap!18701)

(declare-fun minValueBefore!43 () V!48193)

(declare-fun zeroValue!871 () V!48193)

(declare-fun getCurrentListMap!4571 (array!81872 array!81874 (_ BitVec 32) (_ BitVec 32) V!48193 V!48193 (_ BitVec 32) Int) ListLongMap!18701)

(assert (=> b!1258107 (= lt!569038 (getCurrentListMap!4571 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!838558 () Bool)

(assert (=> start!105618 (=> (not res!838558) (not e!715487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105618 (= res!838558 (validMask!0 mask!1466))))

(assert (=> start!105618 e!715487))

(assert (=> start!105618 true))

(assert (=> start!105618 tp!95179))

(declare-fun tp_is_empty!32121 () Bool)

(assert (=> start!105618 tp_is_empty!32121))

(declare-fun array_inv!30081 (array!81872) Bool)

(assert (=> start!105618 (array_inv!30081 _keys!1118)))

(declare-fun e!715482 () Bool)

(declare-fun array_inv!30082 (array!81874) Bool)

(assert (=> start!105618 (and (array_inv!30082 _values!914) e!715482)))

(declare-fun b!1258108 () Bool)

(declare-fun res!838561 () Bool)

(assert (=> b!1258108 (=> (not res!838561) (not e!715487))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258108 (= res!838561 (and (= (size!40029 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40028 _keys!1118) (size!40029 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258109 () Bool)

(assert (=> b!1258109 (= e!715487 (not e!715483))))

(declare-fun res!838560 () Bool)

(assert (=> b!1258109 (=> res!838560 e!715483)))

(assert (=> b!1258109 (= res!838560 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569035 () ListLongMap!18701)

(declare-fun lt!569037 () ListLongMap!18701)

(assert (=> b!1258109 (= lt!569035 lt!569037)))

(declare-fun minValueAfter!43 () V!48193)

(declare-datatypes ((Unit!41916 0))(
  ( (Unit!41917) )
))
(declare-fun lt!569036 () Unit!41916)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1108 (array!81872 array!81874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48193 V!48193 V!48193 V!48193 (_ BitVec 32) Int) Unit!41916)

(assert (=> b!1258109 (= lt!569036 (lemmaNoChangeToArrayThenSameMapNoExtras!1108 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5744 (array!81872 array!81874 (_ BitVec 32) (_ BitVec 32) V!48193 V!48193 (_ BitVec 32) Int) ListLongMap!18701)

(assert (=> b!1258109 (= lt!569037 (getCurrentListMapNoExtraKeys!5744 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258109 (= lt!569035 (getCurrentListMapNoExtraKeys!5744 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258110 () Bool)

(assert (=> b!1258110 (= e!715484 tp_is_empty!32121)))

(declare-fun b!1258111 () Bool)

(declare-fun e!715485 () Bool)

(assert (=> b!1258111 (= e!715482 (and e!715485 mapRes!49975))))

(declare-fun condMapEmpty!49975 () Bool)

(declare-fun mapDefault!49975 () ValueCell!15297)

(assert (=> b!1258111 (= condMapEmpty!49975 (= (arr!39493 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15297)) mapDefault!49975)))))

(declare-fun b!1258112 () Bool)

(assert (=> b!1258112 (= e!715485 tp_is_empty!32121)))

(assert (= (and start!105618 res!838558) b!1258108))

(assert (= (and b!1258108 res!838561) b!1258106))

(assert (= (and b!1258106 res!838562) b!1258105))

(assert (= (and b!1258105 res!838559) b!1258109))

(assert (= (and b!1258109 (not res!838560)) b!1258107))

(assert (= (and b!1258111 condMapEmpty!49975) mapIsEmpty!49975))

(assert (= (and b!1258111 (not condMapEmpty!49975)) mapNonEmpty!49975))

(get-info :version)

(assert (= (and mapNonEmpty!49975 ((_ is ValueCellFull!15297) mapValue!49975)) b!1258110))

(assert (= (and b!1258111 ((_ is ValueCellFull!15297) mapDefault!49975)) b!1258112))

(assert (= start!105618 b!1258111))

(declare-fun m!1158589 () Bool)

(assert (=> start!105618 m!1158589))

(declare-fun m!1158591 () Bool)

(assert (=> start!105618 m!1158591))

(declare-fun m!1158593 () Bool)

(assert (=> start!105618 m!1158593))

(declare-fun m!1158595 () Bool)

(assert (=> mapNonEmpty!49975 m!1158595))

(declare-fun m!1158597 () Bool)

(assert (=> b!1258105 m!1158597))

(declare-fun m!1158599 () Bool)

(assert (=> b!1258107 m!1158599))

(declare-fun m!1158601 () Bool)

(assert (=> b!1258106 m!1158601))

(declare-fun m!1158603 () Bool)

(assert (=> b!1258109 m!1158603))

(declare-fun m!1158605 () Bool)

(assert (=> b!1258109 m!1158605))

(declare-fun m!1158607 () Bool)

(assert (=> b!1258109 m!1158607))

(check-sat (not mapNonEmpty!49975) (not b!1258105) (not b!1258109) tp_is_empty!32121 (not b!1258107) (not start!105618) (not b_next!27219) (not b!1258106) b_and!45093)
(check-sat b_and!45093 (not b_next!27219))
