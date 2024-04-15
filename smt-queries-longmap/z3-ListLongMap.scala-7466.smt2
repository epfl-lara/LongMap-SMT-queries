; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94714 () Bool)

(assert start!94714)

(declare-fun b_free!21973 () Bool)

(declare-fun b_next!21973 () Bool)

(assert (=> start!94714 (= b_free!21973 (not b_next!21973))))

(declare-fun tp!77378 () Bool)

(declare-fun b_and!34777 () Bool)

(assert (=> start!94714 (= tp!77378 b_and!34777)))

(declare-fun b!1070787 () Bool)

(declare-fun res!714339 () Bool)

(declare-fun e!611317 () Bool)

(assert (=> b!1070787 (=> (not res!714339) (not e!611317))))

(declare-datatypes ((array!68478 0))(
  ( (array!68479 (arr!32935 (Array (_ BitVec 32) (_ BitVec 64))) (size!33473 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68478)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68478 (_ BitVec 32)) Bool)

(assert (=> b!1070787 (= res!714339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070788 () Bool)

(declare-fun e!611313 () Bool)

(assert (=> b!1070788 (= e!611317 (not e!611313))))

(declare-fun res!714342 () Bool)

(assert (=> b!1070788 (=> res!714342 e!611313)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070788 (= res!714342 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39513 0))(
  ( (V!39514 (val!12942 Int)) )
))
(declare-datatypes ((tuple2!16510 0))(
  ( (tuple2!16511 (_1!8266 (_ BitVec 64)) (_2!8266 V!39513)) )
))
(declare-datatypes ((List!23039 0))(
  ( (Nil!23036) (Cons!23035 (h!24244 tuple2!16510) (t!32363 List!23039)) )
))
(declare-datatypes ((ListLongMap!14479 0))(
  ( (ListLongMap!14480 (toList!7255 List!23039)) )
))
(declare-fun lt!473193 () ListLongMap!14479)

(declare-fun lt!473188 () ListLongMap!14479)

(assert (=> b!1070788 (= lt!473193 lt!473188)))

(declare-fun zeroValueBefore!47 () V!39513)

(declare-datatypes ((Unit!35093 0))(
  ( (Unit!35094) )
))
(declare-fun lt!473189 () Unit!35093)

(declare-datatypes ((ValueCell!12188 0))(
  ( (ValueCellFull!12188 (v!15557 V!39513)) (EmptyCell!12188) )
))
(declare-datatypes ((array!68480 0))(
  ( (array!68481 (arr!32936 (Array (_ BitVec 32) ValueCell!12188)) (size!33474 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68480)

(declare-fun minValue!907 () V!39513)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39513)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!835 (array!68478 array!68480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39513 V!39513 V!39513 V!39513 (_ BitVec 32) Int) Unit!35093)

(assert (=> b!1070788 (= lt!473189 (lemmaNoChangeToArrayThenSameMapNoExtras!835 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3841 (array!68478 array!68480 (_ BitVec 32) (_ BitVec 32) V!39513 V!39513 (_ BitVec 32) Int) ListLongMap!14479)

(assert (=> b!1070788 (= lt!473188 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070788 (= lt!473193 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070789 () Bool)

(assert (=> b!1070789 (= e!611313 true)))

(declare-fun lt!473185 () ListLongMap!14479)

(declare-fun lt!473187 () tuple2!16510)

(declare-fun -!655 (ListLongMap!14479 (_ BitVec 64)) ListLongMap!14479)

(declare-fun +!3191 (ListLongMap!14479 tuple2!16510) ListLongMap!14479)

(assert (=> b!1070789 (= (-!655 (+!3191 lt!473185 lt!473187) #b0000000000000000000000000000000000000000000000000000000000000000) lt!473185)))

(declare-fun lt!473190 () Unit!35093)

(declare-fun addThenRemoveForNewKeyIsSame!36 (ListLongMap!14479 (_ BitVec 64) V!39513) Unit!35093)

(assert (=> b!1070789 (= lt!473190 (addThenRemoveForNewKeyIsSame!36 lt!473185 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473192 () tuple2!16510)

(assert (=> b!1070789 (= lt!473185 (+!3191 lt!473193 lt!473192))))

(declare-fun e!611315 () Bool)

(assert (=> b!1070789 e!611315))

(declare-fun res!714343 () Bool)

(assert (=> b!1070789 (=> (not res!714343) (not e!611315))))

(declare-fun lt!473186 () ListLongMap!14479)

(assert (=> b!1070789 (= res!714343 (= lt!473186 (+!3191 (+!3191 lt!473193 lt!473187) lt!473192)))))

(assert (=> b!1070789 (= lt!473192 (tuple2!16511 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1070789 (= lt!473187 (tuple2!16511 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473191 () ListLongMap!14479)

(declare-fun getCurrentListMap!4068 (array!68478 array!68480 (_ BitVec 32) (_ BitVec 32) V!39513 V!39513 (_ BitVec 32) Int) ListLongMap!14479)

(assert (=> b!1070789 (= lt!473191 (getCurrentListMap!4068 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070789 (= lt!473186 (getCurrentListMap!4068 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070790 () Bool)

(assert (=> b!1070790 (= e!611315 (= lt!473191 (+!3191 lt!473188 lt!473192)))))

(declare-fun mapNonEmpty!40381 () Bool)

(declare-fun mapRes!40381 () Bool)

(declare-fun tp!77377 () Bool)

(declare-fun e!611314 () Bool)

(assert (=> mapNonEmpty!40381 (= mapRes!40381 (and tp!77377 e!611314))))

(declare-fun mapRest!40381 () (Array (_ BitVec 32) ValueCell!12188))

(declare-fun mapValue!40381 () ValueCell!12188)

(declare-fun mapKey!40381 () (_ BitVec 32))

(assert (=> mapNonEmpty!40381 (= (arr!32936 _values!955) (store mapRest!40381 mapKey!40381 mapValue!40381))))

(declare-fun b!1070791 () Bool)

(declare-fun e!611318 () Bool)

(declare-fun e!611312 () Bool)

(assert (=> b!1070791 (= e!611318 (and e!611312 mapRes!40381))))

(declare-fun condMapEmpty!40381 () Bool)

(declare-fun mapDefault!40381 () ValueCell!12188)

(assert (=> b!1070791 (= condMapEmpty!40381 (= (arr!32936 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12188)) mapDefault!40381)))))

(declare-fun res!714341 () Bool)

(assert (=> start!94714 (=> (not res!714341) (not e!611317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94714 (= res!714341 (validMask!0 mask!1515))))

(assert (=> start!94714 e!611317))

(assert (=> start!94714 true))

(declare-fun tp_is_empty!25783 () Bool)

(assert (=> start!94714 tp_is_empty!25783))

(declare-fun array_inv!25480 (array!68480) Bool)

(assert (=> start!94714 (and (array_inv!25480 _values!955) e!611318)))

(assert (=> start!94714 tp!77378))

(declare-fun array_inv!25481 (array!68478) Bool)

(assert (=> start!94714 (array_inv!25481 _keys!1163)))

(declare-fun b!1070792 () Bool)

(assert (=> b!1070792 (= e!611312 tp_is_empty!25783)))

(declare-fun b!1070793 () Bool)

(declare-fun res!714340 () Bool)

(assert (=> b!1070793 (=> (not res!714340) (not e!611317))))

(declare-datatypes ((List!23040 0))(
  ( (Nil!23037) (Cons!23036 (h!24245 (_ BitVec 64)) (t!32364 List!23040)) )
))
(declare-fun arrayNoDuplicates!0 (array!68478 (_ BitVec 32) List!23040) Bool)

(assert (=> b!1070793 (= res!714340 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23037))))

(declare-fun b!1070794 () Bool)

(assert (=> b!1070794 (= e!611314 tp_is_empty!25783)))

(declare-fun b!1070795 () Bool)

(declare-fun res!714338 () Bool)

(assert (=> b!1070795 (=> (not res!714338) (not e!611317))))

(assert (=> b!1070795 (= res!714338 (and (= (size!33474 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33473 _keys!1163) (size!33474 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40381 () Bool)

(assert (=> mapIsEmpty!40381 mapRes!40381))

(assert (= (and start!94714 res!714341) b!1070795))

(assert (= (and b!1070795 res!714338) b!1070787))

(assert (= (and b!1070787 res!714339) b!1070793))

(assert (= (and b!1070793 res!714340) b!1070788))

(assert (= (and b!1070788 (not res!714342)) b!1070789))

(assert (= (and b!1070789 res!714343) b!1070790))

(assert (= (and b!1070791 condMapEmpty!40381) mapIsEmpty!40381))

(assert (= (and b!1070791 (not condMapEmpty!40381)) mapNonEmpty!40381))

(get-info :version)

(assert (= (and mapNonEmpty!40381 ((_ is ValueCellFull!12188) mapValue!40381)) b!1070794))

(assert (= (and b!1070791 ((_ is ValueCellFull!12188) mapDefault!40381)) b!1070792))

(assert (= start!94714 b!1070791))

(declare-fun m!988595 () Bool)

(assert (=> b!1070793 m!988595))

(declare-fun m!988597 () Bool)

(assert (=> b!1070790 m!988597))

(declare-fun m!988599 () Bool)

(assert (=> b!1070789 m!988599))

(declare-fun m!988601 () Bool)

(assert (=> b!1070789 m!988601))

(declare-fun m!988603 () Bool)

(assert (=> b!1070789 m!988603))

(declare-fun m!988605 () Bool)

(assert (=> b!1070789 m!988605))

(assert (=> b!1070789 m!988601))

(declare-fun m!988607 () Bool)

(assert (=> b!1070789 m!988607))

(declare-fun m!988609 () Bool)

(assert (=> b!1070789 m!988609))

(assert (=> b!1070789 m!988603))

(declare-fun m!988611 () Bool)

(assert (=> b!1070789 m!988611))

(declare-fun m!988613 () Bool)

(assert (=> b!1070789 m!988613))

(declare-fun m!988615 () Bool)

(assert (=> b!1070788 m!988615))

(declare-fun m!988617 () Bool)

(assert (=> b!1070788 m!988617))

(declare-fun m!988619 () Bool)

(assert (=> b!1070788 m!988619))

(declare-fun m!988621 () Bool)

(assert (=> b!1070787 m!988621))

(declare-fun m!988623 () Bool)

(assert (=> mapNonEmpty!40381 m!988623))

(declare-fun m!988625 () Bool)

(assert (=> start!94714 m!988625))

(declare-fun m!988627 () Bool)

(assert (=> start!94714 m!988627))

(declare-fun m!988629 () Bool)

(assert (=> start!94714 m!988629))

(check-sat (not b!1070789) (not b!1070787) (not b!1070788) (not mapNonEmpty!40381) (not start!94714) (not b!1070790) b_and!34777 (not b_next!21973) tp_is_empty!25783 (not b!1070793))
(check-sat b_and!34777 (not b_next!21973))
