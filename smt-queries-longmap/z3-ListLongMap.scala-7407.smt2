; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94236 () Bool)

(assert start!94236)

(declare-fun b_free!21621 () Bool)

(declare-fun b_next!21621 () Bool)

(assert (=> start!94236 (= b_free!21621 (not b_next!21621))))

(declare-fun tp!76300 () Bool)

(declare-fun b_and!34381 () Bool)

(assert (=> start!94236 (= tp!76300 b_and!34381)))

(declare-fun b!1065705 () Bool)

(declare-fun e!607589 () Bool)

(declare-fun e!607585 () Bool)

(declare-fun mapRes!39832 () Bool)

(assert (=> b!1065705 (= e!607589 (and e!607585 mapRes!39832))))

(declare-fun condMapEmpty!39832 () Bool)

(declare-datatypes ((V!39043 0))(
  ( (V!39044 (val!12766 Int)) )
))
(declare-datatypes ((ValueCell!12012 0))(
  ( (ValueCellFull!12012 (v!15378 V!39043)) (EmptyCell!12012) )
))
(declare-datatypes ((array!67847 0))(
  ( (array!67848 (arr!32626 (Array (_ BitVec 32) ValueCell!12012)) (size!33162 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67847)

(declare-fun mapDefault!39832 () ValueCell!12012)

(assert (=> b!1065705 (= condMapEmpty!39832 (= (arr!32626 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12012)) mapDefault!39832)))))

(declare-fun b!1065706 () Bool)

(declare-fun e!607587 () Bool)

(declare-fun tp_is_empty!25431 () Bool)

(assert (=> b!1065706 (= e!607587 tp_is_empty!25431)))

(declare-fun b!1065707 () Bool)

(declare-fun e!607586 () Bool)

(assert (=> b!1065707 (= e!607586 true)))

(declare-datatypes ((tuple2!16184 0))(
  ( (tuple2!16185 (_1!8103 (_ BitVec 64)) (_2!8103 V!39043)) )
))
(declare-datatypes ((List!22750 0))(
  ( (Nil!22747) (Cons!22746 (h!23955 tuple2!16184) (t!32069 List!22750)) )
))
(declare-datatypes ((ListLongMap!14153 0))(
  ( (ListLongMap!14154 (toList!7092 List!22750)) )
))
(declare-fun lt!470120 () ListLongMap!14153)

(declare-fun lt!470114 () ListLongMap!14153)

(declare-fun -!607 (ListLongMap!14153 (_ BitVec 64)) ListLongMap!14153)

(assert (=> b!1065707 (= lt!470120 (-!607 lt!470114 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470116 () ListLongMap!14153)

(declare-fun lt!470121 () ListLongMap!14153)

(assert (=> b!1065707 (= (-!607 lt!470116 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470121)))

(declare-datatypes ((Unit!34977 0))(
  ( (Unit!34978) )
))
(declare-fun lt!470115 () Unit!34977)

(declare-fun zeroValueBefore!47 () V!39043)

(declare-fun addThenRemoveForNewKeyIsSame!16 (ListLongMap!14153 (_ BitVec 64) V!39043) Unit!34977)

(assert (=> b!1065707 (= lt!470115 (addThenRemoveForNewKeyIsSame!16 lt!470121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470117 () ListLongMap!14153)

(declare-fun lt!470118 () ListLongMap!14153)

(assert (=> b!1065707 (and (= lt!470114 lt!470116) (= lt!470117 lt!470118))))

(declare-fun +!3138 (ListLongMap!14153 tuple2!16184) ListLongMap!14153)

(assert (=> b!1065707 (= lt!470116 (+!3138 lt!470121 (tuple2!16185 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun minValue!907 () V!39043)

(declare-datatypes ((array!67849 0))(
  ( (array!67850 (arr!32627 (Array (_ BitVec 32) (_ BitVec 64))) (size!33163 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67849)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39043)

(declare-fun getCurrentListMap!4051 (array!67849 array!67847 (_ BitVec 32) (_ BitVec 32) V!39043 V!39043 (_ BitVec 32) Int) ListLongMap!14153)

(assert (=> b!1065707 (= lt!470117 (getCurrentListMap!4051 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065707 (= lt!470114 (getCurrentListMap!4051 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065708 () Bool)

(declare-fun e!607584 () Bool)

(assert (=> b!1065708 (= e!607584 (not e!607586))))

(declare-fun res!711353 () Bool)

(assert (=> b!1065708 (=> res!711353 e!607586)))

(assert (=> b!1065708 (= res!711353 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065708 (= lt!470121 lt!470118)))

(declare-fun lt!470119 () Unit!34977)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!715 (array!67849 array!67847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39043 V!39043 V!39043 V!39043 (_ BitVec 32) Int) Unit!34977)

(assert (=> b!1065708 (= lt!470119 (lemmaNoChangeToArrayThenSameMapNoExtras!715 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3678 (array!67849 array!67847 (_ BitVec 32) (_ BitVec 32) V!39043 V!39043 (_ BitVec 32) Int) ListLongMap!14153)

(assert (=> b!1065708 (= lt!470118 (getCurrentListMapNoExtraKeys!3678 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065708 (= lt!470121 (getCurrentListMapNoExtraKeys!3678 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39832 () Bool)

(assert (=> mapIsEmpty!39832 mapRes!39832))

(declare-fun mapNonEmpty!39832 () Bool)

(declare-fun tp!76301 () Bool)

(assert (=> mapNonEmpty!39832 (= mapRes!39832 (and tp!76301 e!607587))))

(declare-fun mapValue!39832 () ValueCell!12012)

(declare-fun mapRest!39832 () (Array (_ BitVec 32) ValueCell!12012))

(declare-fun mapKey!39832 () (_ BitVec 32))

(assert (=> mapNonEmpty!39832 (= (arr!32626 _values!955) (store mapRest!39832 mapKey!39832 mapValue!39832))))

(declare-fun b!1065709 () Bool)

(assert (=> b!1065709 (= e!607585 tp_is_empty!25431)))

(declare-fun b!1065710 () Bool)

(declare-fun res!711350 () Bool)

(assert (=> b!1065710 (=> (not res!711350) (not e!607584))))

(assert (=> b!1065710 (= res!711350 (and (= (size!33162 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33163 _keys!1163) (size!33162 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!711352 () Bool)

(assert (=> start!94236 (=> (not res!711352) (not e!607584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94236 (= res!711352 (validMask!0 mask!1515))))

(assert (=> start!94236 e!607584))

(assert (=> start!94236 true))

(assert (=> start!94236 tp_is_empty!25431))

(declare-fun array_inv!25264 (array!67847) Bool)

(assert (=> start!94236 (and (array_inv!25264 _values!955) e!607589)))

(assert (=> start!94236 tp!76300))

(declare-fun array_inv!25265 (array!67849) Bool)

(assert (=> start!94236 (array_inv!25265 _keys!1163)))

(declare-fun b!1065711 () Bool)

(declare-fun res!711354 () Bool)

(assert (=> b!1065711 (=> (not res!711354) (not e!607584))))

(declare-datatypes ((List!22751 0))(
  ( (Nil!22748) (Cons!22747 (h!23956 (_ BitVec 64)) (t!32070 List!22751)) )
))
(declare-fun arrayNoDuplicates!0 (array!67849 (_ BitVec 32) List!22751) Bool)

(assert (=> b!1065711 (= res!711354 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22748))))

(declare-fun b!1065712 () Bool)

(declare-fun res!711351 () Bool)

(assert (=> b!1065712 (=> (not res!711351) (not e!607584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67849 (_ BitVec 32)) Bool)

(assert (=> b!1065712 (= res!711351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94236 res!711352) b!1065710))

(assert (= (and b!1065710 res!711350) b!1065712))

(assert (= (and b!1065712 res!711351) b!1065711))

(assert (= (and b!1065711 res!711354) b!1065708))

(assert (= (and b!1065708 (not res!711353)) b!1065707))

(assert (= (and b!1065705 condMapEmpty!39832) mapIsEmpty!39832))

(assert (= (and b!1065705 (not condMapEmpty!39832)) mapNonEmpty!39832))

(get-info :version)

(assert (= (and mapNonEmpty!39832 ((_ is ValueCellFull!12012) mapValue!39832)) b!1065706))

(assert (= (and b!1065705 ((_ is ValueCellFull!12012) mapDefault!39832)) b!1065709))

(assert (= start!94236 b!1065705))

(declare-fun m!984229 () Bool)

(assert (=> b!1065708 m!984229))

(declare-fun m!984231 () Bool)

(assert (=> b!1065708 m!984231))

(declare-fun m!984233 () Bool)

(assert (=> b!1065708 m!984233))

(declare-fun m!984235 () Bool)

(assert (=> b!1065712 m!984235))

(declare-fun m!984237 () Bool)

(assert (=> start!94236 m!984237))

(declare-fun m!984239 () Bool)

(assert (=> start!94236 m!984239))

(declare-fun m!984241 () Bool)

(assert (=> start!94236 m!984241))

(declare-fun m!984243 () Bool)

(assert (=> mapNonEmpty!39832 m!984243))

(declare-fun m!984245 () Bool)

(assert (=> b!1065707 m!984245))

(declare-fun m!984247 () Bool)

(assert (=> b!1065707 m!984247))

(declare-fun m!984249 () Bool)

(assert (=> b!1065707 m!984249))

(declare-fun m!984251 () Bool)

(assert (=> b!1065707 m!984251))

(declare-fun m!984253 () Bool)

(assert (=> b!1065707 m!984253))

(declare-fun m!984255 () Bool)

(assert (=> b!1065707 m!984255))

(declare-fun m!984257 () Bool)

(assert (=> b!1065711 m!984257))

(check-sat (not b!1065711) tp_is_empty!25431 (not start!94236) (not mapNonEmpty!39832) b_and!34381 (not b!1065707) (not b_next!21621) (not b!1065712) (not b!1065708))
(check-sat b_and!34381 (not b_next!21621))
