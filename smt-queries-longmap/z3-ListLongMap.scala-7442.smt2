; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94526 () Bool)

(assert start!94526)

(declare-fun b_free!21831 () Bool)

(declare-fun b_next!21831 () Bool)

(assert (=> start!94526 (= b_free!21831 (not b_next!21831))))

(declare-fun tp!76943 () Bool)

(declare-fun b_and!34633 () Bool)

(assert (=> start!94526 (= tp!76943 b_and!34633)))

(declare-fun b!1068876 () Bool)

(declare-fun e!609910 () Bool)

(declare-fun tp_is_empty!25641 () Bool)

(assert (=> b!1068876 (= e!609910 tp_is_empty!25641)))

(declare-fun b!1068877 () Bool)

(declare-fun res!713223 () Bool)

(declare-fun e!609914 () Bool)

(assert (=> b!1068877 (=> (not res!713223) (not e!609914))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39323 0))(
  ( (V!39324 (val!12871 Int)) )
))
(declare-datatypes ((ValueCell!12117 0))(
  ( (ValueCellFull!12117 (v!15486 V!39323)) (EmptyCell!12117) )
))
(declare-datatypes ((array!68259 0))(
  ( (array!68260 (arr!32828 (Array (_ BitVec 32) ValueCell!12117)) (size!33364 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68259)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68261 0))(
  ( (array!68262 (arr!32829 (Array (_ BitVec 32) (_ BitVec 64))) (size!33365 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68261)

(assert (=> b!1068877 (= res!713223 (and (= (size!33364 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33365 _keys!1163) (size!33364 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068878 () Bool)

(declare-fun e!609912 () Bool)

(declare-fun mapRes!40159 () Bool)

(assert (=> b!1068878 (= e!609912 (and e!609910 mapRes!40159))))

(declare-fun condMapEmpty!40159 () Bool)

(declare-fun mapDefault!40159 () ValueCell!12117)

(assert (=> b!1068878 (= condMapEmpty!40159 (= (arr!32828 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12117)) mapDefault!40159)))))

(declare-fun b!1068879 () Bool)

(declare-fun e!609909 () Bool)

(declare-fun e!609913 () Bool)

(assert (=> b!1068879 (= e!609909 e!609913)))

(declare-fun res!713226 () Bool)

(assert (=> b!1068879 (=> res!713226 e!609913)))

(declare-datatypes ((tuple2!16354 0))(
  ( (tuple2!16355 (_1!8188 (_ BitVec 64)) (_2!8188 V!39323)) )
))
(declare-datatypes ((List!22901 0))(
  ( (Nil!22898) (Cons!22897 (h!24106 tuple2!16354) (t!32228 List!22901)) )
))
(declare-datatypes ((ListLongMap!14323 0))(
  ( (ListLongMap!14324 (toList!7177 List!22901)) )
))
(declare-fun lt!472269 () ListLongMap!14323)

(declare-fun contains!6305 (ListLongMap!14323 (_ BitVec 64)) Bool)

(assert (=> b!1068879 (= res!713226 (contains!6305 lt!472269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39323)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39323)

(declare-fun getCurrentListMap!4101 (array!68261 array!68259 (_ BitVec 32) (_ BitVec 32) V!39323 V!39323 (_ BitVec 32) Int) ListLongMap!14323)

(assert (=> b!1068879 (= lt!472269 (getCurrentListMap!4101 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40159 () Bool)

(assert (=> mapIsEmpty!40159 mapRes!40159))

(declare-fun mapNonEmpty!40159 () Bool)

(declare-fun tp!76942 () Bool)

(declare-fun e!609911 () Bool)

(assert (=> mapNonEmpty!40159 (= mapRes!40159 (and tp!76942 e!609911))))

(declare-fun mapRest!40159 () (Array (_ BitVec 32) ValueCell!12117))

(declare-fun mapKey!40159 () (_ BitVec 32))

(declare-fun mapValue!40159 () ValueCell!12117)

(assert (=> mapNonEmpty!40159 (= (arr!32828 _values!955) (store mapRest!40159 mapKey!40159 mapValue!40159))))

(declare-fun res!713224 () Bool)

(assert (=> start!94526 (=> (not res!713224) (not e!609914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94526 (= res!713224 (validMask!0 mask!1515))))

(assert (=> start!94526 e!609914))

(assert (=> start!94526 true))

(assert (=> start!94526 tp_is_empty!25641))

(declare-fun array_inv!25410 (array!68259) Bool)

(assert (=> start!94526 (and (array_inv!25410 _values!955) e!609912)))

(assert (=> start!94526 tp!76943))

(declare-fun array_inv!25411 (array!68261) Bool)

(assert (=> start!94526 (array_inv!25411 _keys!1163)))

(declare-fun b!1068880 () Bool)

(assert (=> b!1068880 (= e!609913 true)))

(declare-fun -!658 (ListLongMap!14323 (_ BitVec 64)) ListLongMap!14323)

(assert (=> b!1068880 (= (-!658 lt!472269 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472269)))

(declare-datatypes ((Unit!35153 0))(
  ( (Unit!35154) )
))
(declare-fun lt!472271 () Unit!35153)

(declare-fun removeNotPresentStillSame!68 (ListLongMap!14323 (_ BitVec 64)) Unit!35153)

(assert (=> b!1068880 (= lt!472271 (removeNotPresentStillSame!68 lt!472269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068881 () Bool)

(declare-fun res!713227 () Bool)

(assert (=> b!1068881 (=> (not res!713227) (not e!609914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68261 (_ BitVec 32)) Bool)

(assert (=> b!1068881 (= res!713227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068882 () Bool)

(assert (=> b!1068882 (= e!609914 (not e!609909))))

(declare-fun res!713222 () Bool)

(assert (=> b!1068882 (=> res!713222 e!609909)))

(assert (=> b!1068882 (= res!713222 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472267 () ListLongMap!14323)

(declare-fun lt!472270 () ListLongMap!14323)

(assert (=> b!1068882 (= lt!472267 lt!472270)))

(declare-fun lt!472268 () Unit!35153)

(declare-fun zeroValueAfter!47 () V!39323)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!791 (array!68261 array!68259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39323 V!39323 V!39323 V!39323 (_ BitVec 32) Int) Unit!35153)

(assert (=> b!1068882 (= lt!472268 (lemmaNoChangeToArrayThenSameMapNoExtras!791 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3754 (array!68261 array!68259 (_ BitVec 32) (_ BitVec 32) V!39323 V!39323 (_ BitVec 32) Int) ListLongMap!14323)

(assert (=> b!1068882 (= lt!472270 (getCurrentListMapNoExtraKeys!3754 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068882 (= lt!472267 (getCurrentListMapNoExtraKeys!3754 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068883 () Bool)

(assert (=> b!1068883 (= e!609911 tp_is_empty!25641)))

(declare-fun b!1068884 () Bool)

(declare-fun res!713225 () Bool)

(assert (=> b!1068884 (=> (not res!713225) (not e!609914))))

(declare-datatypes ((List!22902 0))(
  ( (Nil!22899) (Cons!22898 (h!24107 (_ BitVec 64)) (t!32229 List!22902)) )
))
(declare-fun arrayNoDuplicates!0 (array!68261 (_ BitVec 32) List!22902) Bool)

(assert (=> b!1068884 (= res!713225 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22899))))

(assert (= (and start!94526 res!713224) b!1068877))

(assert (= (and b!1068877 res!713223) b!1068881))

(assert (= (and b!1068881 res!713227) b!1068884))

(assert (= (and b!1068884 res!713225) b!1068882))

(assert (= (and b!1068882 (not res!713222)) b!1068879))

(assert (= (and b!1068879 (not res!713226)) b!1068880))

(assert (= (and b!1068878 condMapEmpty!40159) mapIsEmpty!40159))

(assert (= (and b!1068878 (not condMapEmpty!40159)) mapNonEmpty!40159))

(get-info :version)

(assert (= (and mapNonEmpty!40159 ((_ is ValueCellFull!12117) mapValue!40159)) b!1068883))

(assert (= (and b!1068878 ((_ is ValueCellFull!12117) mapDefault!40159)) b!1068876))

(assert (= start!94526 b!1068878))

(declare-fun m!987431 () Bool)

(assert (=> b!1068879 m!987431))

(declare-fun m!987433 () Bool)

(assert (=> b!1068879 m!987433))

(declare-fun m!987435 () Bool)

(assert (=> b!1068881 m!987435))

(declare-fun m!987437 () Bool)

(assert (=> mapNonEmpty!40159 m!987437))

(declare-fun m!987439 () Bool)

(assert (=> b!1068880 m!987439))

(declare-fun m!987441 () Bool)

(assert (=> b!1068880 m!987441))

(declare-fun m!987443 () Bool)

(assert (=> b!1068884 m!987443))

(declare-fun m!987445 () Bool)

(assert (=> b!1068882 m!987445))

(declare-fun m!987447 () Bool)

(assert (=> b!1068882 m!987447))

(declare-fun m!987449 () Bool)

(assert (=> b!1068882 m!987449))

(declare-fun m!987451 () Bool)

(assert (=> start!94526 m!987451))

(declare-fun m!987453 () Bool)

(assert (=> start!94526 m!987453))

(declare-fun m!987455 () Bool)

(assert (=> start!94526 m!987455))

(check-sat (not mapNonEmpty!40159) (not b!1068882) (not b!1068881) (not b!1068879) b_and!34633 (not b!1068880) (not start!94526) (not b_next!21831) tp_is_empty!25641 (not b!1068884))
(check-sat b_and!34633 (not b_next!21831))
