; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94836 () Bool)

(assert start!94836)

(declare-fun b_free!22065 () Bool)

(declare-fun b_next!22065 () Bool)

(assert (=> start!94836 (= b_free!22065 (not b_next!22065))))

(declare-fun tp!77656 () Bool)

(declare-fun b_and!34907 () Bool)

(assert (=> start!94836 (= tp!77656 b_and!34907)))

(declare-fun b!1072374 () Bool)

(declare-fun res!715328 () Bool)

(declare-fun e!612498 () Bool)

(assert (=> b!1072374 (=> (not res!715328) (not e!612498))))

(declare-datatypes ((array!68719 0))(
  ( (array!68720 (arr!33054 (Array (_ BitVec 32) (_ BitVec 64))) (size!33590 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68719)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68719 (_ BitVec 32)) Bool)

(assert (=> b!1072374 (= res!715328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072375 () Bool)

(declare-fun e!612497 () Bool)

(declare-fun tp_is_empty!25875 () Bool)

(assert (=> b!1072375 (= e!612497 tp_is_empty!25875)))

(declare-fun b!1072376 () Bool)

(declare-fun res!715329 () Bool)

(assert (=> b!1072376 (=> (not res!715329) (not e!612498))))

(declare-datatypes ((V!39635 0))(
  ( (V!39636 (val!12988 Int)) )
))
(declare-datatypes ((ValueCell!12234 0))(
  ( (ValueCellFull!12234 (v!15605 V!39635)) (EmptyCell!12234) )
))
(declare-datatypes ((array!68721 0))(
  ( (array!68722 (arr!33055 (Array (_ BitVec 32) ValueCell!12234)) (size!33591 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68721)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072376 (= res!715329 (and (= (size!33591 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33590 _keys!1163) (size!33591 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072377 () Bool)

(declare-fun e!612496 () Bool)

(assert (=> b!1072377 (= e!612496 true)))

(declare-datatypes ((tuple2!16542 0))(
  ( (tuple2!16543 (_1!8282 (_ BitVec 64)) (_2!8282 V!39635)) )
))
(declare-datatypes ((List!23076 0))(
  ( (Nil!23073) (Cons!23072 (h!24281 tuple2!16542) (t!32411 List!23076)) )
))
(declare-datatypes ((ListLongMap!14511 0))(
  ( (ListLongMap!14512 (toList!7271 List!23076)) )
))
(declare-fun lt!475317 () ListLongMap!14511)

(declare-fun lt!475312 () ListLongMap!14511)

(declare-fun -!699 (ListLongMap!14511 (_ BitVec 64)) ListLongMap!14511)

(assert (=> b!1072377 (= lt!475317 (-!699 lt!475312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475310 () ListLongMap!14511)

(declare-fun lt!475318 () ListLongMap!14511)

(assert (=> b!1072377 (= lt!475310 lt!475318)))

(declare-fun zeroValueBefore!47 () V!39635)

(declare-fun lt!475320 () ListLongMap!14511)

(declare-fun minValue!907 () V!39635)

(declare-datatypes ((Unit!35336 0))(
  ( (Unit!35337) )
))
(declare-fun lt!475313 () Unit!35336)

(declare-fun addCommutativeForDiffKeys!744 (ListLongMap!14511 (_ BitVec 64) V!39635 (_ BitVec 64) V!39635) Unit!35336)

(assert (=> b!1072377 (= lt!475313 (addCommutativeForDiffKeys!744 lt!475320 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475319 () ListLongMap!14511)

(assert (=> b!1072377 (= (-!699 lt!475318 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475319)))

(declare-fun lt!475311 () tuple2!16542)

(declare-fun +!3205 (ListLongMap!14511 tuple2!16542) ListLongMap!14511)

(assert (=> b!1072377 (= lt!475318 (+!3205 lt!475319 lt!475311))))

(declare-fun lt!475308 () Unit!35336)

(declare-fun addThenRemoveForNewKeyIsSame!69 (ListLongMap!14511 (_ BitVec 64) V!39635) Unit!35336)

(assert (=> b!1072377 (= lt!475308 (addThenRemoveForNewKeyIsSame!69 lt!475319 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!475309 () tuple2!16542)

(assert (=> b!1072377 (= lt!475319 (+!3205 lt!475320 lt!475309))))

(declare-fun e!612494 () Bool)

(assert (=> b!1072377 e!612494))

(declare-fun res!715327 () Bool)

(assert (=> b!1072377 (=> (not res!715327) (not e!612494))))

(assert (=> b!1072377 (= res!715327 (= lt!475312 lt!475310))))

(assert (=> b!1072377 (= lt!475310 (+!3205 (+!3205 lt!475320 lt!475311) lt!475309))))

(assert (=> b!1072377 (= lt!475309 (tuple2!16543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072377 (= lt!475311 (tuple2!16543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!475314 () ListLongMap!14511)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39635)

(declare-fun getCurrentListMap!4165 (array!68719 array!68721 (_ BitVec 32) (_ BitVec 32) V!39635 V!39635 (_ BitVec 32) Int) ListLongMap!14511)

(assert (=> b!1072377 (= lt!475314 (getCurrentListMap!4165 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072377 (= lt!475312 (getCurrentListMap!4165 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072378 () Bool)

(declare-fun e!612500 () Bool)

(declare-fun e!612499 () Bool)

(declare-fun mapRes!40522 () Bool)

(assert (=> b!1072378 (= e!612500 (and e!612499 mapRes!40522))))

(declare-fun condMapEmpty!40522 () Bool)

(declare-fun mapDefault!40522 () ValueCell!12234)

(assert (=> b!1072378 (= condMapEmpty!40522 (= (arr!33055 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12234)) mapDefault!40522)))))

(declare-fun b!1072379 () Bool)

(assert (=> b!1072379 (= e!612499 tp_is_empty!25875)))

(declare-fun b!1072380 () Bool)

(assert (=> b!1072380 (= e!612498 (not e!612496))))

(declare-fun res!715330 () Bool)

(assert (=> b!1072380 (=> res!715330 e!612496)))

(assert (=> b!1072380 (= res!715330 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!475315 () ListLongMap!14511)

(assert (=> b!1072380 (= lt!475320 lt!475315)))

(declare-fun lt!475316 () Unit!35336)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!872 (array!68719 array!68721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39635 V!39635 V!39635 V!39635 (_ BitVec 32) Int) Unit!35336)

(assert (=> b!1072380 (= lt!475316 (lemmaNoChangeToArrayThenSameMapNoExtras!872 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3835 (array!68719 array!68721 (_ BitVec 32) (_ BitVec 32) V!39635 V!39635 (_ BitVec 32) Int) ListLongMap!14511)

(assert (=> b!1072380 (= lt!475315 (getCurrentListMapNoExtraKeys!3835 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072380 (= lt!475320 (getCurrentListMapNoExtraKeys!3835 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072381 () Bool)

(assert (=> b!1072381 (= e!612494 (= lt!475314 (+!3205 lt!475315 lt!475309)))))

(declare-fun b!1072382 () Bool)

(declare-fun res!715326 () Bool)

(assert (=> b!1072382 (=> (not res!715326) (not e!612498))))

(declare-datatypes ((List!23077 0))(
  ( (Nil!23074) (Cons!23073 (h!24282 (_ BitVec 64)) (t!32412 List!23077)) )
))
(declare-fun arrayNoDuplicates!0 (array!68719 (_ BitVec 32) List!23077) Bool)

(assert (=> b!1072382 (= res!715326 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23074))))

(declare-fun mapIsEmpty!40522 () Bool)

(assert (=> mapIsEmpty!40522 mapRes!40522))

(declare-fun mapNonEmpty!40522 () Bool)

(declare-fun tp!77657 () Bool)

(assert (=> mapNonEmpty!40522 (= mapRes!40522 (and tp!77657 e!612497))))

(declare-fun mapValue!40522 () ValueCell!12234)

(declare-fun mapRest!40522 () (Array (_ BitVec 32) ValueCell!12234))

(declare-fun mapKey!40522 () (_ BitVec 32))

(assert (=> mapNonEmpty!40522 (= (arr!33055 _values!955) (store mapRest!40522 mapKey!40522 mapValue!40522))))

(declare-fun res!715325 () Bool)

(assert (=> start!94836 (=> (not res!715325) (not e!612498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94836 (= res!715325 (validMask!0 mask!1515))))

(assert (=> start!94836 e!612498))

(assert (=> start!94836 true))

(assert (=> start!94836 tp_is_empty!25875))

(declare-fun array_inv!25554 (array!68721) Bool)

(assert (=> start!94836 (and (array_inv!25554 _values!955) e!612500)))

(assert (=> start!94836 tp!77656))

(declare-fun array_inv!25555 (array!68719) Bool)

(assert (=> start!94836 (array_inv!25555 _keys!1163)))

(assert (= (and start!94836 res!715325) b!1072376))

(assert (= (and b!1072376 res!715329) b!1072374))

(assert (= (and b!1072374 res!715328) b!1072382))

(assert (= (and b!1072382 res!715326) b!1072380))

(assert (= (and b!1072380 (not res!715330)) b!1072377))

(assert (= (and b!1072377 res!715327) b!1072381))

(assert (= (and b!1072378 condMapEmpty!40522) mapIsEmpty!40522))

(assert (= (and b!1072378 (not condMapEmpty!40522)) mapNonEmpty!40522))

(get-info :version)

(assert (= (and mapNonEmpty!40522 ((_ is ValueCellFull!12234) mapValue!40522)) b!1072375))

(assert (= (and b!1072378 ((_ is ValueCellFull!12234) mapDefault!40522)) b!1072379))

(assert (= start!94836 b!1072378))

(declare-fun m!991293 () Bool)

(assert (=> b!1072380 m!991293))

(declare-fun m!991295 () Bool)

(assert (=> b!1072380 m!991295))

(declare-fun m!991297 () Bool)

(assert (=> b!1072380 m!991297))

(declare-fun m!991299 () Bool)

(assert (=> b!1072381 m!991299))

(declare-fun m!991301 () Bool)

(assert (=> mapNonEmpty!40522 m!991301))

(declare-fun m!991303 () Bool)

(assert (=> b!1072374 m!991303))

(declare-fun m!991305 () Bool)

(assert (=> b!1072377 m!991305))

(declare-fun m!991307 () Bool)

(assert (=> b!1072377 m!991307))

(declare-fun m!991309 () Bool)

(assert (=> b!1072377 m!991309))

(declare-fun m!991311 () Bool)

(assert (=> b!1072377 m!991311))

(assert (=> b!1072377 m!991305))

(declare-fun m!991313 () Bool)

(assert (=> b!1072377 m!991313))

(declare-fun m!991315 () Bool)

(assert (=> b!1072377 m!991315))

(declare-fun m!991317 () Bool)

(assert (=> b!1072377 m!991317))

(declare-fun m!991319 () Bool)

(assert (=> b!1072377 m!991319))

(declare-fun m!991321 () Bool)

(assert (=> b!1072377 m!991321))

(declare-fun m!991323 () Bool)

(assert (=> b!1072377 m!991323))

(declare-fun m!991325 () Bool)

(assert (=> start!94836 m!991325))

(declare-fun m!991327 () Bool)

(assert (=> start!94836 m!991327))

(declare-fun m!991329 () Bool)

(assert (=> start!94836 m!991329))

(declare-fun m!991331 () Bool)

(assert (=> b!1072382 m!991331))

(check-sat (not b!1072380) (not b!1072377) (not b!1072374) (not b!1072382) (not mapNonEmpty!40522) tp_is_empty!25875 (not b_next!22065) (not b!1072381) (not start!94836) b_and!34907)
(check-sat b_and!34907 (not b_next!22065))
