; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95022 () Bool)

(assert start!95022)

(declare-fun b_free!22175 () Bool)

(declare-fun b_next!22175 () Bool)

(assert (=> start!95022 (= b_free!22175 (not b_next!22175))))

(declare-fun tp!77999 () Bool)

(declare-fun b_and!35059 () Bool)

(assert (=> start!95022 (= tp!77999 b_and!35059)))

(declare-fun b!1074238 () Bool)

(declare-fun e!613810 () Bool)

(declare-fun e!613807 () Bool)

(assert (=> b!1074238 (= e!613810 (not e!613807))))

(declare-fun res!716336 () Bool)

(assert (=> b!1074238 (=> res!716336 e!613807)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074238 (= res!716336 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39781 0))(
  ( (V!39782 (val!13043 Int)) )
))
(declare-datatypes ((tuple2!16614 0))(
  ( (tuple2!16615 (_1!8318 (_ BitVec 64)) (_2!8318 V!39781)) )
))
(declare-datatypes ((List!23150 0))(
  ( (Nil!23147) (Cons!23146 (h!24355 tuple2!16614) (t!32493 List!23150)) )
))
(declare-datatypes ((ListLongMap!14583 0))(
  ( (ListLongMap!14584 (toList!7307 List!23150)) )
))
(declare-fun lt!476509 () ListLongMap!14583)

(declare-fun lt!476507 () ListLongMap!14583)

(assert (=> b!1074238 (= lt!476509 lt!476507)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39781)

(declare-datatypes ((ValueCell!12289 0))(
  ( (ValueCellFull!12289 (v!15663 V!39781)) (EmptyCell!12289) )
))
(declare-datatypes ((array!68935 0))(
  ( (array!68936 (arr!33158 (Array (_ BitVec 32) ValueCell!12289)) (size!33694 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68935)

(declare-fun minValue!907 () V!39781)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-datatypes ((Unit!35375 0))(
  ( (Unit!35376) )
))
(declare-fun lt!476510 () Unit!35375)

(declare-fun zeroValueAfter!47 () V!39781)

(declare-datatypes ((array!68937 0))(
  ( (array!68938 (arr!33159 (Array (_ BitVec 32) (_ BitVec 64))) (size!33695 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68937)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!886 (array!68937 array!68935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39781 V!39781 V!39781 V!39781 (_ BitVec 32) Int) Unit!35375)

(assert (=> b!1074238 (= lt!476510 (lemmaNoChangeToArrayThenSameMapNoExtras!886 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3870 (array!68937 array!68935 (_ BitVec 32) (_ BitVec 32) V!39781 V!39781 (_ BitVec 32) Int) ListLongMap!14583)

(assert (=> b!1074238 (= lt!476507 (getCurrentListMapNoExtraKeys!3870 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074238 (= lt!476509 (getCurrentListMapNoExtraKeys!3870 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074239 () Bool)

(declare-fun e!613808 () Bool)

(declare-fun tp_is_empty!25985 () Bool)

(assert (=> b!1074239 (= e!613808 tp_is_empty!25985)))

(declare-fun b!1074240 () Bool)

(declare-fun res!716337 () Bool)

(assert (=> b!1074240 (=> (not res!716337) (not e!613810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68937 (_ BitVec 32)) Bool)

(assert (=> b!1074240 (= res!716337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074241 () Bool)

(declare-fun getCurrentListMap!4177 (array!68937 array!68935 (_ BitVec 32) (_ BitVec 32) V!39781 V!39781 (_ BitVec 32) Int) ListLongMap!14583)

(declare-fun +!3216 (ListLongMap!14583 tuple2!16614) ListLongMap!14583)

(assert (=> b!1074241 (= e!613807 (= (getCurrentListMap!4177 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3216 lt!476509 (tuple2!16615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!476508 () ListLongMap!14583)

(assert (=> b!1074241 (= lt!476508 (getCurrentListMap!4177 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!716334 () Bool)

(assert (=> start!95022 (=> (not res!716334) (not e!613810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95022 (= res!716334 (validMask!0 mask!1515))))

(assert (=> start!95022 e!613810))

(assert (=> start!95022 true))

(assert (=> start!95022 tp_is_empty!25985))

(declare-fun e!613811 () Bool)

(declare-fun array_inv!25626 (array!68935) Bool)

(assert (=> start!95022 (and (array_inv!25626 _values!955) e!613811)))

(assert (=> start!95022 tp!77999))

(declare-fun array_inv!25627 (array!68937) Bool)

(assert (=> start!95022 (array_inv!25627 _keys!1163)))

(declare-fun mapNonEmpty!40699 () Bool)

(declare-fun mapRes!40699 () Bool)

(declare-fun tp!77998 () Bool)

(assert (=> mapNonEmpty!40699 (= mapRes!40699 (and tp!77998 e!613808))))

(declare-fun mapKey!40699 () (_ BitVec 32))

(declare-fun mapValue!40699 () ValueCell!12289)

(declare-fun mapRest!40699 () (Array (_ BitVec 32) ValueCell!12289))

(assert (=> mapNonEmpty!40699 (= (arr!33158 _values!955) (store mapRest!40699 mapKey!40699 mapValue!40699))))

(declare-fun b!1074242 () Bool)

(declare-fun e!613812 () Bool)

(assert (=> b!1074242 (= e!613812 tp_is_empty!25985)))

(declare-fun mapIsEmpty!40699 () Bool)

(assert (=> mapIsEmpty!40699 mapRes!40699))

(declare-fun b!1074243 () Bool)

(declare-fun res!716338 () Bool)

(assert (=> b!1074243 (=> (not res!716338) (not e!613810))))

(declare-datatypes ((List!23151 0))(
  ( (Nil!23148) (Cons!23147 (h!24356 (_ BitVec 64)) (t!32494 List!23151)) )
))
(declare-fun arrayNoDuplicates!0 (array!68937 (_ BitVec 32) List!23151) Bool)

(assert (=> b!1074243 (= res!716338 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23148))))

(declare-fun b!1074244 () Bool)

(declare-fun res!716335 () Bool)

(assert (=> b!1074244 (=> (not res!716335) (not e!613810))))

(assert (=> b!1074244 (= res!716335 (and (= (size!33694 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33695 _keys!1163) (size!33694 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074245 () Bool)

(assert (=> b!1074245 (= e!613811 (and e!613812 mapRes!40699))))

(declare-fun condMapEmpty!40699 () Bool)

(declare-fun mapDefault!40699 () ValueCell!12289)

