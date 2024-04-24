; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94854 () Bool)

(assert start!94854)

(declare-fun b_free!21901 () Bool)

(declare-fun b_next!21901 () Bool)

(assert (=> start!94854 (= b_free!21901 (not b_next!21901))))

(declare-fun tp!77156 () Bool)

(declare-fun b_and!34723 () Bool)

(assert (=> start!94854 (= tp!77156 b_and!34723)))

(declare-fun b!1071175 () Bool)

(declare-fun e!611469 () Bool)

(declare-fun tp_is_empty!25711 () Bool)

(assert (=> b!1071175 (= e!611469 tp_is_empty!25711)))

(declare-fun b!1071177 () Bool)

(declare-fun e!611468 () Bool)

(assert (=> b!1071177 (= e!611468 tp_is_empty!25711)))

(declare-fun mapNonEmpty!40267 () Bool)

(declare-fun mapRes!40267 () Bool)

(declare-fun tp!77155 () Bool)

(assert (=> mapNonEmpty!40267 (= mapRes!40267 (and tp!77155 e!611468))))

(declare-datatypes ((V!39417 0))(
  ( (V!39418 (val!12906 Int)) )
))
(declare-datatypes ((ValueCell!12152 0))(
  ( (ValueCellFull!12152 (v!15518 V!39417)) (EmptyCell!12152) )
))
(declare-fun mapRest!40267 () (Array (_ BitVec 32) ValueCell!12152))

(declare-fun mapKey!40267 () (_ BitVec 32))

(declare-datatypes ((array!68435 0))(
  ( (array!68436 (arr!32909 (Array (_ BitVec 32) ValueCell!12152)) (size!33446 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68435)

(declare-fun mapValue!40267 () ValueCell!12152)

(assert (=> mapNonEmpty!40267 (= (arr!32909 _values!955) (store mapRest!40267 mapKey!40267 mapValue!40267))))

(declare-fun b!1071178 () Bool)

(declare-fun res!714308 () Bool)

(declare-fun e!611470 () Bool)

(assert (=> b!1071178 (=> (not res!714308) (not e!611470))))

(declare-datatypes ((array!68437 0))(
  ( (array!68438 (arr!32910 (Array (_ BitVec 32) (_ BitVec 64))) (size!33447 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68437)

(declare-datatypes ((List!22942 0))(
  ( (Nil!22939) (Cons!22938 (h!24156 (_ BitVec 64)) (t!32263 List!22942)) )
))
(declare-fun arrayNoDuplicates!0 (array!68437 (_ BitVec 32) List!22942) Bool)

(assert (=> b!1071178 (= res!714308 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22939))))

(declare-fun b!1071179 () Bool)

(declare-fun e!611471 () Bool)

(assert (=> b!1071179 (= e!611471 (and e!611469 mapRes!40267))))

(declare-fun condMapEmpty!40267 () Bool)

(declare-fun mapDefault!40267 () ValueCell!12152)

(assert (=> b!1071179 (= condMapEmpty!40267 (= (arr!32909 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12152)) mapDefault!40267)))))

(declare-fun b!1071180 () Bool)

(assert (=> b!1071180 (= e!611470 (not true))))

(declare-datatypes ((tuple2!16374 0))(
  ( (tuple2!16375 (_1!8198 (_ BitVec 64)) (_2!8198 V!39417)) )
))
(declare-datatypes ((List!22943 0))(
  ( (Nil!22940) (Cons!22939 (h!24157 tuple2!16374) (t!32264 List!22943)) )
))
(declare-datatypes ((ListLongMap!14351 0))(
  ( (ListLongMap!14352 (toList!7191 List!22943)) )
))
(declare-fun lt!473302 () ListLongMap!14351)

(declare-fun lt!473301 () ListLongMap!14351)

(assert (=> b!1071180 (= lt!473302 lt!473301)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39417)

(declare-datatypes ((Unit!35176 0))(
  ( (Unit!35177) )
))
(declare-fun lt!473303 () Unit!35176)

(declare-fun minValue!907 () V!39417)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39417)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!806 (array!68437 array!68435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39417 V!39417 V!39417 V!39417 (_ BitVec 32) Int) Unit!35176)

(assert (=> b!1071180 (= lt!473303 (lemmaNoChangeToArrayThenSameMapNoExtras!806 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3803 (array!68437 array!68435 (_ BitVec 32) (_ BitVec 32) V!39417 V!39417 (_ BitVec 32) Int) ListLongMap!14351)

(assert (=> b!1071180 (= lt!473301 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071180 (= lt!473302 (getCurrentListMapNoExtraKeys!3803 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071181 () Bool)

(declare-fun res!714307 () Bool)

(assert (=> b!1071181 (=> (not res!714307) (not e!611470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68437 (_ BitVec 32)) Bool)

(assert (=> b!1071181 (= res!714307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40267 () Bool)

(assert (=> mapIsEmpty!40267 mapRes!40267))

(declare-fun res!714306 () Bool)

(assert (=> start!94854 (=> (not res!714306) (not e!611470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94854 (= res!714306 (validMask!0 mask!1515))))

(assert (=> start!94854 e!611470))

(assert (=> start!94854 true))

(assert (=> start!94854 tp_is_empty!25711))

(declare-fun array_inv!25486 (array!68435) Bool)

(assert (=> start!94854 (and (array_inv!25486 _values!955) e!611471)))

(assert (=> start!94854 tp!77156))

(declare-fun array_inv!25487 (array!68437) Bool)

(assert (=> start!94854 (array_inv!25487 _keys!1163)))

(declare-fun b!1071176 () Bool)

(declare-fun res!714305 () Bool)

(assert (=> b!1071176 (=> (not res!714305) (not e!611470))))

(assert (=> b!1071176 (= res!714305 (and (= (size!33446 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33447 _keys!1163) (size!33446 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94854 res!714306) b!1071176))

(assert (= (and b!1071176 res!714305) b!1071181))

(assert (= (and b!1071181 res!714307) b!1071178))

(assert (= (and b!1071178 res!714308) b!1071180))

(assert (= (and b!1071179 condMapEmpty!40267) mapIsEmpty!40267))

(assert (= (and b!1071179 (not condMapEmpty!40267)) mapNonEmpty!40267))

(get-info :version)

(assert (= (and mapNonEmpty!40267 ((_ is ValueCellFull!12152) mapValue!40267)) b!1071177))

(assert (= (and b!1071179 ((_ is ValueCellFull!12152) mapDefault!40267)) b!1071175))

(assert (= start!94854 b!1071179))

(declare-fun m!989971 () Bool)

(assert (=> mapNonEmpty!40267 m!989971))

(declare-fun m!989973 () Bool)

(assert (=> start!94854 m!989973))

(declare-fun m!989975 () Bool)

(assert (=> start!94854 m!989975))

(declare-fun m!989977 () Bool)

(assert (=> start!94854 m!989977))

(declare-fun m!989979 () Bool)

(assert (=> b!1071181 m!989979))

(declare-fun m!989981 () Bool)

(assert (=> b!1071180 m!989981))

(declare-fun m!989983 () Bool)

(assert (=> b!1071180 m!989983))

(declare-fun m!989985 () Bool)

(assert (=> b!1071180 m!989985))

(declare-fun m!989987 () Bool)

(assert (=> b!1071178 m!989987))

(check-sat (not b!1071181) (not b_next!21901) (not start!94854) b_and!34723 tp_is_empty!25711 (not mapNonEmpty!40267) (not b!1071178) (not b!1071180))
(check-sat b_and!34723 (not b_next!21901))
