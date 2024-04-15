; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94286 () Bool)

(assert start!94286)

(declare-fun b_free!21655 () Bool)

(declare-fun b_next!21655 () Bool)

(assert (=> start!94286 (= b_free!21655 (not b_next!21655))))

(declare-fun tp!76406 () Bool)

(declare-fun b_and!34401 () Bool)

(assert (=> start!94286 (= tp!76406 b_and!34401)))

(declare-fun b!1066144 () Bool)

(declare-fun res!711622 () Bool)

(declare-fun e!607916 () Bool)

(assert (=> b!1066144 (=> (not res!711622) (not e!607916))))

(declare-datatypes ((array!67856 0))(
  ( (array!67857 (arr!32630 (Array (_ BitVec 32) (_ BitVec 64))) (size!33168 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67856)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67856 (_ BitVec 32)) Bool)

(assert (=> b!1066144 (= res!711622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066145 () Bool)

(declare-fun e!607918 () Bool)

(declare-fun tp_is_empty!25465 () Bool)

(assert (=> b!1066145 (= e!607918 tp_is_empty!25465)))

(declare-fun mapNonEmpty!39886 () Bool)

(declare-fun mapRes!39886 () Bool)

(declare-fun tp!76405 () Bool)

(assert (=> mapNonEmpty!39886 (= mapRes!39886 (and tp!76405 e!607918))))

(declare-datatypes ((V!39089 0))(
  ( (V!39090 (val!12783 Int)) )
))
(declare-datatypes ((ValueCell!12029 0))(
  ( (ValueCellFull!12029 (v!15395 V!39089)) (EmptyCell!12029) )
))
(declare-fun mapRest!39886 () (Array (_ BitVec 32) ValueCell!12029))

(declare-fun mapValue!39886 () ValueCell!12029)

(declare-datatypes ((array!67858 0))(
  ( (array!67859 (arr!32631 (Array (_ BitVec 32) ValueCell!12029)) (size!33169 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67858)

(declare-fun mapKey!39886 () (_ BitVec 32))

(assert (=> mapNonEmpty!39886 (= (arr!32631 _values!955) (store mapRest!39886 mapKey!39886 mapValue!39886))))

(declare-fun b!1066146 () Bool)

(declare-fun e!607917 () Bool)

(assert (=> b!1066146 (= e!607916 (not e!607917))))

(declare-fun res!711618 () Bool)

(assert (=> b!1066146 (=> res!711618 e!607917)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066146 (= res!711618 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16266 0))(
  ( (tuple2!16267 (_1!8144 (_ BitVec 64)) (_2!8144 V!39089)) )
))
(declare-datatypes ((List!22811 0))(
  ( (Nil!22808) (Cons!22807 (h!24016 tuple2!16266) (t!32123 List!22811)) )
))
(declare-datatypes ((ListLongMap!14235 0))(
  ( (ListLongMap!14236 (toList!7133 List!22811)) )
))
(declare-fun lt!470462 () ListLongMap!14235)

(declare-fun lt!470464 () ListLongMap!14235)

(assert (=> b!1066146 (= lt!470462 lt!470464)))

(declare-fun zeroValueBefore!47 () V!39089)

(declare-fun minValue!907 () V!39089)

(declare-datatypes ((Unit!34854 0))(
  ( (Unit!34855) )
))
(declare-fun lt!470467 () Unit!34854)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39089)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!726 (array!67856 array!67858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39089 V!39089 V!39089 V!39089 (_ BitVec 32) Int) Unit!34854)

(assert (=> b!1066146 (= lt!470467 (lemmaNoChangeToArrayThenSameMapNoExtras!726 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3732 (array!67856 array!67858 (_ BitVec 32) (_ BitVec 32) V!39089 V!39089 (_ BitVec 32) Int) ListLongMap!14235)

(assert (=> b!1066146 (= lt!470464 (getCurrentListMapNoExtraKeys!3732 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066146 (= lt!470462 (getCurrentListMapNoExtraKeys!3732 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066147 () Bool)

(declare-fun e!607920 () Bool)

(assert (=> b!1066147 (= e!607920 tp_is_empty!25465)))

(declare-fun b!1066148 () Bool)

(declare-fun res!711619 () Bool)

(assert (=> b!1066148 (=> (not res!711619) (not e!607916))))

(assert (=> b!1066148 (= res!711619 (and (= (size!33169 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33168 _keys!1163) (size!33169 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!711620 () Bool)

(assert (=> start!94286 (=> (not res!711620) (not e!607916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94286 (= res!711620 (validMask!0 mask!1515))))

(assert (=> start!94286 e!607916))

(assert (=> start!94286 true))

(assert (=> start!94286 tp_is_empty!25465))

(declare-fun e!607921 () Bool)

(declare-fun array_inv!25262 (array!67858) Bool)

(assert (=> start!94286 (and (array_inv!25262 _values!955) e!607921)))

(assert (=> start!94286 tp!76406))

(declare-fun array_inv!25263 (array!67856) Bool)

(assert (=> start!94286 (array_inv!25263 _keys!1163)))

(declare-fun b!1066149 () Bool)

(declare-fun res!711621 () Bool)

(assert (=> b!1066149 (=> (not res!711621) (not e!607916))))

(declare-datatypes ((List!22812 0))(
  ( (Nil!22809) (Cons!22808 (h!24017 (_ BitVec 64)) (t!32124 List!22812)) )
))
(declare-fun arrayNoDuplicates!0 (array!67856 (_ BitVec 32) List!22812) Bool)

(assert (=> b!1066149 (= res!711621 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22809))))

(declare-fun b!1066150 () Bool)

(assert (=> b!1066150 (= e!607921 (and e!607920 mapRes!39886))))

(declare-fun condMapEmpty!39886 () Bool)

(declare-fun mapDefault!39886 () ValueCell!12029)

(assert (=> b!1066150 (= condMapEmpty!39886 (= (arr!32631 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12029)) mapDefault!39886)))))

(declare-fun mapIsEmpty!39886 () Bool)

(assert (=> mapIsEmpty!39886 mapRes!39886))

(declare-fun b!1066151 () Bool)

(assert (=> b!1066151 (= e!607917 true)))

(declare-fun lt!470461 () ListLongMap!14235)

(declare-fun lt!470465 () ListLongMap!14235)

(declare-fun -!606 (ListLongMap!14235 (_ BitVec 64)) ListLongMap!14235)

(assert (=> b!1066151 (= lt!470461 (-!606 lt!470465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470460 () ListLongMap!14235)

(assert (=> b!1066151 (= (-!606 lt!470460 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470462)))

(declare-fun lt!470466 () Unit!34854)

(declare-fun addThenRemoveForNewKeyIsSame!24 (ListLongMap!14235 (_ BitVec 64) V!39089) Unit!34854)

(assert (=> b!1066151 (= lt!470466 (addThenRemoveForNewKeyIsSame!24 lt!470462 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470463 () ListLongMap!14235)

(assert (=> b!1066151 (and (= lt!470465 lt!470460) (= lt!470463 lt!470464))))

(declare-fun +!3172 (ListLongMap!14235 tuple2!16266) ListLongMap!14235)

(assert (=> b!1066151 (= lt!470460 (+!3172 lt!470462 (tuple2!16267 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4004 (array!67856 array!67858 (_ BitVec 32) (_ BitVec 32) V!39089 V!39089 (_ BitVec 32) Int) ListLongMap!14235)

(assert (=> b!1066151 (= lt!470463 (getCurrentListMap!4004 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066151 (= lt!470465 (getCurrentListMap!4004 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94286 res!711620) b!1066148))

(assert (= (and b!1066148 res!711619) b!1066144))

(assert (= (and b!1066144 res!711622) b!1066149))

(assert (= (and b!1066149 res!711621) b!1066146))

(assert (= (and b!1066146 (not res!711618)) b!1066151))

(assert (= (and b!1066150 condMapEmpty!39886) mapIsEmpty!39886))

(assert (= (and b!1066150 (not condMapEmpty!39886)) mapNonEmpty!39886))

(get-info :version)

(assert (= (and mapNonEmpty!39886 ((_ is ValueCellFull!12029) mapValue!39886)) b!1066145))

(assert (= (and b!1066150 ((_ is ValueCellFull!12029) mapDefault!39886)) b!1066147))

(assert (= start!94286 b!1066150))

(declare-fun m!984297 () Bool)

(assert (=> b!1066149 m!984297))

(declare-fun m!984299 () Bool)

(assert (=> b!1066144 m!984299))

(declare-fun m!984301 () Bool)

(assert (=> b!1066151 m!984301))

(declare-fun m!984303 () Bool)

(assert (=> b!1066151 m!984303))

(declare-fun m!984305 () Bool)

(assert (=> b!1066151 m!984305))

(declare-fun m!984307 () Bool)

(assert (=> b!1066151 m!984307))

(declare-fun m!984309 () Bool)

(assert (=> b!1066151 m!984309))

(declare-fun m!984311 () Bool)

(assert (=> b!1066151 m!984311))

(declare-fun m!984313 () Bool)

(assert (=> b!1066146 m!984313))

(declare-fun m!984315 () Bool)

(assert (=> b!1066146 m!984315))

(declare-fun m!984317 () Bool)

(assert (=> b!1066146 m!984317))

(declare-fun m!984319 () Bool)

(assert (=> start!94286 m!984319))

(declare-fun m!984321 () Bool)

(assert (=> start!94286 m!984321))

(declare-fun m!984323 () Bool)

(assert (=> start!94286 m!984323))

(declare-fun m!984325 () Bool)

(assert (=> mapNonEmpty!39886 m!984325))

(check-sat tp_is_empty!25465 (not b!1066146) b_and!34401 (not mapNonEmpty!39886) (not b_next!21655) (not b!1066144) (not b!1066149) (not start!94286) (not b!1066151))
(check-sat b_and!34401 (not b_next!21655))
