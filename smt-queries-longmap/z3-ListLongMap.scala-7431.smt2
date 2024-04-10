; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94438 () Bool)

(assert start!94438)

(declare-fun b_free!21765 () Bool)

(declare-fun b_next!21765 () Bool)

(assert (=> start!94438 (= b_free!21765 (not b_next!21765))))

(declare-fun tp!76742 () Bool)

(declare-fun b_and!34557 () Bool)

(assert (=> start!94438 (= tp!76742 b_and!34557)))

(declare-fun b!1067828 () Bool)

(declare-fun e!609121 () Bool)

(assert (=> b!1067828 (= e!609121 true)))

(declare-datatypes ((V!39235 0))(
  ( (V!39236 (val!12838 Int)) )
))
(declare-datatypes ((tuple2!16296 0))(
  ( (tuple2!16297 (_1!8159 (_ BitVec 64)) (_2!8159 V!39235)) )
))
(declare-datatypes ((List!22852 0))(
  ( (Nil!22849) (Cons!22848 (h!24057 tuple2!16296) (t!32177 List!22852)) )
))
(declare-datatypes ((ListLongMap!14265 0))(
  ( (ListLongMap!14266 (toList!7148 List!22852)) )
))
(declare-fun lt!471648 () ListLongMap!14265)

(declare-fun -!634 (ListLongMap!14265 (_ BitVec 64)) ListLongMap!14265)

(assert (=> b!1067828 (= (-!634 lt!471648 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471648)))

(declare-datatypes ((Unit!35093 0))(
  ( (Unit!35094) )
))
(declare-fun lt!471649 () Unit!35093)

(declare-fun removeNotPresentStillSame!44 (ListLongMap!14265 (_ BitVec 64)) Unit!35093)

(assert (=> b!1067828 (= lt!471649 (removeNotPresentStillSame!44 lt!471648 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!40057 () Bool)

(declare-fun mapRes!40057 () Bool)

(assert (=> mapIsEmpty!40057 mapRes!40057))

(declare-fun b!1067829 () Bool)

(declare-fun e!609118 () Bool)

(declare-fun tp_is_empty!25575 () Bool)

(assert (=> b!1067829 (= e!609118 tp_is_empty!25575)))

(declare-fun mapNonEmpty!40057 () Bool)

(declare-fun tp!76741 () Bool)

(declare-fun e!609120 () Bool)

(assert (=> mapNonEmpty!40057 (= mapRes!40057 (and tp!76741 e!609120))))

(declare-fun mapKey!40057 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12084 0))(
  ( (ValueCellFull!12084 (v!15452 V!39235)) (EmptyCell!12084) )
))
(declare-datatypes ((array!68133 0))(
  ( (array!68134 (arr!32766 (Array (_ BitVec 32) ValueCell!12084)) (size!33302 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68133)

(declare-fun mapValue!40057 () ValueCell!12084)

(declare-fun mapRest!40057 () (Array (_ BitVec 32) ValueCell!12084))

(assert (=> mapNonEmpty!40057 (= (arr!32766 _values!955) (store mapRest!40057 mapKey!40057 mapValue!40057))))

(declare-fun b!1067830 () Bool)

(declare-fun res!712569 () Bool)

(declare-fun e!609117 () Bool)

(assert (=> b!1067830 (=> (not res!712569) (not e!609117))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68135 0))(
  ( (array!68136 (arr!32767 (Array (_ BitVec 32) (_ BitVec 64))) (size!33303 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68135)

(assert (=> b!1067830 (= res!712569 (and (= (size!33302 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33303 _keys!1163) (size!33302 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067831 () Bool)

(declare-fun e!609116 () Bool)

(assert (=> b!1067831 (= e!609117 (not e!609116))))

(declare-fun res!712567 () Bool)

(assert (=> b!1067831 (=> res!712567 e!609116)))

(assert (=> b!1067831 (= res!712567 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471652 () ListLongMap!14265)

(declare-fun lt!471650 () ListLongMap!14265)

(assert (=> b!1067831 (= lt!471652 lt!471650)))

(declare-fun zeroValueBefore!47 () V!39235)

(declare-fun lt!471651 () Unit!35093)

(declare-fun minValue!907 () V!39235)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39235)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!768 (array!68135 array!68133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39235 V!39235 V!39235 V!39235 (_ BitVec 32) Int) Unit!35093)

(assert (=> b!1067831 (= lt!471651 (lemmaNoChangeToArrayThenSameMapNoExtras!768 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3731 (array!68135 array!68133 (_ BitVec 32) (_ BitVec 32) V!39235 V!39235 (_ BitVec 32) Int) ListLongMap!14265)

(assert (=> b!1067831 (= lt!471650 (getCurrentListMapNoExtraKeys!3731 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067831 (= lt!471652 (getCurrentListMapNoExtraKeys!3731 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067832 () Bool)

(declare-fun res!712568 () Bool)

(assert (=> b!1067832 (=> (not res!712568) (not e!609117))))

(declare-datatypes ((List!22853 0))(
  ( (Nil!22850) (Cons!22849 (h!24058 (_ BitVec 64)) (t!32178 List!22853)) )
))
(declare-fun arrayNoDuplicates!0 (array!68135 (_ BitVec 32) List!22853) Bool)

(assert (=> b!1067832 (= res!712568 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22850))))

(declare-fun b!1067833 () Bool)

(declare-fun res!712572 () Bool)

(assert (=> b!1067833 (=> (not res!712572) (not e!609117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68135 (_ BitVec 32)) Bool)

(assert (=> b!1067833 (= res!712572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067835 () Bool)

(assert (=> b!1067835 (= e!609120 tp_is_empty!25575)))

(declare-fun b!1067836 () Bool)

(assert (=> b!1067836 (= e!609116 e!609121)))

(declare-fun res!712571 () Bool)

(assert (=> b!1067836 (=> res!712571 e!609121)))

(declare-fun contains!6284 (ListLongMap!14265 (_ BitVec 64)) Bool)

(assert (=> b!1067836 (= res!712571 (contains!6284 lt!471648 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4081 (array!68135 array!68133 (_ BitVec 32) (_ BitVec 32) V!39235 V!39235 (_ BitVec 32) Int) ListLongMap!14265)

(assert (=> b!1067836 (= lt!471648 (getCurrentListMap!4081 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067834 () Bool)

(declare-fun e!609115 () Bool)

(assert (=> b!1067834 (= e!609115 (and e!609118 mapRes!40057))))

(declare-fun condMapEmpty!40057 () Bool)

(declare-fun mapDefault!40057 () ValueCell!12084)

(assert (=> b!1067834 (= condMapEmpty!40057 (= (arr!32766 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12084)) mapDefault!40057)))))

(declare-fun res!712570 () Bool)

(assert (=> start!94438 (=> (not res!712570) (not e!609117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94438 (= res!712570 (validMask!0 mask!1515))))

(assert (=> start!94438 e!609117))

(assert (=> start!94438 true))

(assert (=> start!94438 tp_is_empty!25575))

(declare-fun array_inv!25368 (array!68133) Bool)

(assert (=> start!94438 (and (array_inv!25368 _values!955) e!609115)))

(assert (=> start!94438 tp!76742))

(declare-fun array_inv!25369 (array!68135) Bool)

(assert (=> start!94438 (array_inv!25369 _keys!1163)))

(assert (= (and start!94438 res!712570) b!1067830))

(assert (= (and b!1067830 res!712569) b!1067833))

(assert (= (and b!1067833 res!712572) b!1067832))

(assert (= (and b!1067832 res!712568) b!1067831))

(assert (= (and b!1067831 (not res!712567)) b!1067836))

(assert (= (and b!1067836 (not res!712571)) b!1067828))

(assert (= (and b!1067834 condMapEmpty!40057) mapIsEmpty!40057))

(assert (= (and b!1067834 (not condMapEmpty!40057)) mapNonEmpty!40057))

(get-info :version)

(assert (= (and mapNonEmpty!40057 ((_ is ValueCellFull!12084) mapValue!40057)) b!1067835))

(assert (= (and b!1067834 ((_ is ValueCellFull!12084) mapDefault!40057)) b!1067829))

(assert (= start!94438 b!1067834))

(declare-fun m!986447 () Bool)

(assert (=> b!1067828 m!986447))

(declare-fun m!986449 () Bool)

(assert (=> b!1067828 m!986449))

(declare-fun m!986451 () Bool)

(assert (=> mapNonEmpty!40057 m!986451))

(declare-fun m!986453 () Bool)

(assert (=> start!94438 m!986453))

(declare-fun m!986455 () Bool)

(assert (=> start!94438 m!986455))

(declare-fun m!986457 () Bool)

(assert (=> start!94438 m!986457))

(declare-fun m!986459 () Bool)

(assert (=> b!1067831 m!986459))

(declare-fun m!986461 () Bool)

(assert (=> b!1067831 m!986461))

(declare-fun m!986463 () Bool)

(assert (=> b!1067831 m!986463))

(declare-fun m!986465 () Bool)

(assert (=> b!1067832 m!986465))

(declare-fun m!986467 () Bool)

(assert (=> b!1067833 m!986467))

(declare-fun m!986469 () Bool)

(assert (=> b!1067836 m!986469))

(declare-fun m!986471 () Bool)

(assert (=> b!1067836 m!986471))

(check-sat (not start!94438) tp_is_empty!25575 (not b!1067836) b_and!34557 (not b!1067831) (not b!1067833) (not b!1067828) (not b_next!21765) (not mapNonEmpty!40057) (not b!1067832))
(check-sat b_and!34557 (not b_next!21765))
