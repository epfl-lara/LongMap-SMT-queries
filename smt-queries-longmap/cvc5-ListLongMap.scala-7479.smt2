; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94822 () Bool)

(assert start!94822)

(declare-fun b_free!22051 () Bool)

(declare-fun b_next!22051 () Bool)

(assert (=> start!94822 (= b_free!22051 (not b_next!22051))))

(declare-fun tp!77614 () Bool)

(declare-fun b_and!34893 () Bool)

(assert (=> start!94822 (= tp!77614 b_and!34893)))

(declare-fun b!1072185 () Bool)

(declare-fun e!612351 () Bool)

(assert (=> b!1072185 (= e!612351 true)))

(declare-datatypes ((V!39617 0))(
  ( (V!39618 (val!12981 Int)) )
))
(declare-datatypes ((tuple2!16532 0))(
  ( (tuple2!16533 (_1!8277 (_ BitVec 64)) (_2!8277 V!39617)) )
))
(declare-datatypes ((List!23066 0))(
  ( (Nil!23063) (Cons!23062 (h!24271 tuple2!16532) (t!32401 List!23066)) )
))
(declare-datatypes ((ListLongMap!14501 0))(
  ( (ListLongMap!14502 (toList!7266 List!23066)) )
))
(declare-fun lt!475038 () ListLongMap!14501)

(declare-fun lt!475040 () ListLongMap!14501)

(declare-fun -!695 (ListLongMap!14501 (_ BitVec 64)) ListLongMap!14501)

(assert (=> b!1072185 (= lt!475038 (-!695 lt!475040 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475037 () ListLongMap!14501)

(declare-fun lt!475039 () ListLongMap!14501)

(assert (=> b!1072185 (= lt!475037 lt!475039)))

(declare-fun zeroValueBefore!47 () V!39617)

(declare-datatypes ((Unit!35326 0))(
  ( (Unit!35327) )
))
(declare-fun lt!475041 () Unit!35326)

(declare-fun lt!475044 () ListLongMap!14501)

(declare-fun minValue!907 () V!39617)

(declare-fun addCommutativeForDiffKeys!740 (ListLongMap!14501 (_ BitVec 64) V!39617 (_ BitVec 64) V!39617) Unit!35326)

(assert (=> b!1072185 (= lt!475041 (addCommutativeForDiffKeys!740 lt!475044 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475042 () ListLongMap!14501)

(assert (=> b!1072185 (= (-!695 lt!475039 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475042)))

(declare-fun lt!475046 () tuple2!16532)

(declare-fun +!3200 (ListLongMap!14501 tuple2!16532) ListLongMap!14501)

(assert (=> b!1072185 (= lt!475039 (+!3200 lt!475042 lt!475046))))

(declare-fun lt!475047 () Unit!35326)

(declare-fun addThenRemoveForNewKeyIsSame!65 (ListLongMap!14501 (_ BitVec 64) V!39617) Unit!35326)

(assert (=> b!1072185 (= lt!475047 (addThenRemoveForNewKeyIsSame!65 lt!475042 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!475043 () tuple2!16532)

(assert (=> b!1072185 (= lt!475042 (+!3200 lt!475044 lt!475043))))

(declare-fun e!612349 () Bool)

(assert (=> b!1072185 e!612349))

(declare-fun res!715204 () Bool)

(assert (=> b!1072185 (=> (not res!715204) (not e!612349))))

(assert (=> b!1072185 (= res!715204 (= lt!475040 lt!475037))))

(assert (=> b!1072185 (= lt!475037 (+!3200 (+!3200 lt!475044 lt!475046) lt!475043))))

(assert (=> b!1072185 (= lt!475043 (tuple2!16533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072185 (= lt!475046 (tuple2!16533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12227 0))(
  ( (ValueCellFull!12227 (v!15598 V!39617)) (EmptyCell!12227) )
))
(declare-datatypes ((array!68693 0))(
  ( (array!68694 (arr!33041 (Array (_ BitVec 32) ValueCell!12227)) (size!33577 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68693)

(declare-fun lt!475035 () ListLongMap!14501)

(declare-datatypes ((array!68695 0))(
  ( (array!68696 (arr!33042 (Array (_ BitVec 32) (_ BitVec 64))) (size!33578 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68695)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39617)

(declare-fun getCurrentListMap!4161 (array!68695 array!68693 (_ BitVec 32) (_ BitVec 32) V!39617 V!39617 (_ BitVec 32) Int) ListLongMap!14501)

(assert (=> b!1072185 (= lt!475035 (getCurrentListMap!4161 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072185 (= lt!475040 (getCurrentListMap!4161 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!715203 () Bool)

(declare-fun e!612353 () Bool)

(assert (=> start!94822 (=> (not res!715203) (not e!612353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94822 (= res!715203 (validMask!0 mask!1515))))

(assert (=> start!94822 e!612353))

(assert (=> start!94822 true))

(declare-fun tp_is_empty!25861 () Bool)

(assert (=> start!94822 tp_is_empty!25861))

(declare-fun e!612347 () Bool)

(declare-fun array_inv!25544 (array!68693) Bool)

(assert (=> start!94822 (and (array_inv!25544 _values!955) e!612347)))

(assert (=> start!94822 tp!77614))

(declare-fun array_inv!25545 (array!68695) Bool)

(assert (=> start!94822 (array_inv!25545 _keys!1163)))

(declare-fun b!1072186 () Bool)

(assert (=> b!1072186 (= e!612353 (not e!612351))))

(declare-fun res!715201 () Bool)

(assert (=> b!1072186 (=> res!715201 e!612351)))

(assert (=> b!1072186 (= res!715201 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!475036 () ListLongMap!14501)

(assert (=> b!1072186 (= lt!475044 lt!475036)))

(declare-fun lt!475045 () Unit!35326)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!867 (array!68695 array!68693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39617 V!39617 V!39617 V!39617 (_ BitVec 32) Int) Unit!35326)

(assert (=> b!1072186 (= lt!475045 (lemmaNoChangeToArrayThenSameMapNoExtras!867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3830 (array!68695 array!68693 (_ BitVec 32) (_ BitVec 32) V!39617 V!39617 (_ BitVec 32) Int) ListLongMap!14501)

(assert (=> b!1072186 (= lt!475036 (getCurrentListMapNoExtraKeys!3830 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072186 (= lt!475044 (getCurrentListMapNoExtraKeys!3830 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40501 () Bool)

(declare-fun mapRes!40501 () Bool)

(declare-fun tp!77615 () Bool)

(declare-fun e!612350 () Bool)

(assert (=> mapNonEmpty!40501 (= mapRes!40501 (and tp!77615 e!612350))))

(declare-fun mapValue!40501 () ValueCell!12227)

(declare-fun mapKey!40501 () (_ BitVec 32))

(declare-fun mapRest!40501 () (Array (_ BitVec 32) ValueCell!12227))

(assert (=> mapNonEmpty!40501 (= (arr!33041 _values!955) (store mapRest!40501 mapKey!40501 mapValue!40501))))

(declare-fun b!1072187 () Bool)

(declare-fun e!612348 () Bool)

(assert (=> b!1072187 (= e!612347 (and e!612348 mapRes!40501))))

(declare-fun condMapEmpty!40501 () Bool)

(declare-fun mapDefault!40501 () ValueCell!12227)

