; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94540 () Bool)

(assert start!94540)

(declare-fun b_free!21845 () Bool)

(declare-fun b_next!21845 () Bool)

(assert (=> start!94540 (= b_free!21845 (not b_next!21845))))

(declare-fun tp!76985 () Bool)

(declare-fun b_and!34647 () Bool)

(assert (=> start!94540 (= tp!76985 b_and!34647)))

(declare-fun mapNonEmpty!40180 () Bool)

(declare-fun mapRes!40180 () Bool)

(declare-fun tp!76984 () Bool)

(declare-fun e!610056 () Bool)

(assert (=> mapNonEmpty!40180 (= mapRes!40180 (and tp!76984 e!610056))))

(declare-datatypes ((V!39341 0))(
  ( (V!39342 (val!12878 Int)) )
))
(declare-datatypes ((ValueCell!12124 0))(
  ( (ValueCellFull!12124 (v!15493 V!39341)) (EmptyCell!12124) )
))
(declare-fun mapRest!40180 () (Array (_ BitVec 32) ValueCell!12124))

(declare-fun mapKey!40180 () (_ BitVec 32))

(declare-datatypes ((array!68287 0))(
  ( (array!68288 (arr!32842 (Array (_ BitVec 32) ValueCell!12124)) (size!33378 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68287)

(declare-fun mapValue!40180 () ValueCell!12124)

(assert (=> mapNonEmpty!40180 (= (arr!32842 _values!955) (store mapRest!40180 mapKey!40180 mapValue!40180))))

(declare-fun b!1069065 () Bool)

(declare-fun res!713349 () Bool)

(declare-fun e!610058 () Bool)

(assert (=> b!1069065 (=> (not res!713349) (not e!610058))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68289 0))(
  ( (array!68290 (arr!32843 (Array (_ BitVec 32) (_ BitVec 64))) (size!33379 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68289)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1069065 (= res!713349 (and (= (size!33378 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33379 _keys!1163) (size!33378 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069066 () Bool)

(declare-fun tp_is_empty!25655 () Bool)

(assert (=> b!1069066 (= e!610056 tp_is_empty!25655)))

(declare-fun b!1069067 () Bool)

(declare-fun res!713350 () Bool)

(assert (=> b!1069067 (=> (not res!713350) (not e!610058))))

(declare-datatypes ((List!22910 0))(
  ( (Nil!22907) (Cons!22906 (h!24115 (_ BitVec 64)) (t!32237 List!22910)) )
))
(declare-fun arrayNoDuplicates!0 (array!68289 (_ BitVec 32) List!22910) Bool)

(assert (=> b!1069067 (= res!713350 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22907))))

(declare-fun mapIsEmpty!40180 () Bool)

(assert (=> mapIsEmpty!40180 mapRes!40180))

(declare-fun res!713352 () Bool)

(assert (=> start!94540 (=> (not res!713352) (not e!610058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94540 (= res!713352 (validMask!0 mask!1515))))

(assert (=> start!94540 e!610058))

(assert (=> start!94540 true))

(assert (=> start!94540 tp_is_empty!25655))

(declare-fun e!610061 () Bool)

(declare-fun array_inv!25420 (array!68287) Bool)

(assert (=> start!94540 (and (array_inv!25420 _values!955) e!610061)))

(assert (=> start!94540 tp!76985))

(declare-fun array_inv!25421 (array!68289) Bool)

(assert (=> start!94540 (array_inv!25421 _keys!1163)))

(declare-fun b!1069068 () Bool)

(declare-fun e!610057 () Bool)

(assert (=> b!1069068 (= e!610058 (not e!610057))))

(declare-fun res!713348 () Bool)

(assert (=> b!1069068 (=> res!713348 e!610057)))

(assert (=> b!1069068 (= res!713348 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16364 0))(
  ( (tuple2!16365 (_1!8193 (_ BitVec 64)) (_2!8193 V!39341)) )
))
(declare-datatypes ((List!22911 0))(
  ( (Nil!22908) (Cons!22907 (h!24116 tuple2!16364) (t!32238 List!22911)) )
))
(declare-datatypes ((ListLongMap!14333 0))(
  ( (ListLongMap!14334 (toList!7182 List!22911)) )
))
(declare-fun lt!472373 () ListLongMap!14333)

(declare-fun lt!472376 () ListLongMap!14333)

(assert (=> b!1069068 (= lt!472373 lt!472376)))

(declare-fun minValue!907 () V!39341)

(declare-datatypes ((Unit!35161 0))(
  ( (Unit!35162) )
))
(declare-fun lt!472375 () Unit!35161)

(declare-fun zeroValueBefore!47 () V!39341)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39341)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!795 (array!68289 array!68287 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39341 V!39341 V!39341 V!39341 (_ BitVec 32) Int) Unit!35161)

(assert (=> b!1069068 (= lt!472375 (lemmaNoChangeToArrayThenSameMapNoExtras!795 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3758 (array!68289 array!68287 (_ BitVec 32) (_ BitVec 32) V!39341 V!39341 (_ BitVec 32) Int) ListLongMap!14333)

(assert (=> b!1069068 (= lt!472376 (getCurrentListMapNoExtraKeys!3758 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069068 (= lt!472373 (getCurrentListMapNoExtraKeys!3758 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069069 () Bool)

(declare-fun e!610059 () Bool)

(assert (=> b!1069069 (= e!610057 e!610059)))

(declare-fun res!713351 () Bool)

(assert (=> b!1069069 (=> res!713351 e!610059)))

(declare-fun lt!472374 () ListLongMap!14333)

(declare-fun contains!6310 (ListLongMap!14333 (_ BitVec 64)) Bool)

(assert (=> b!1069069 (= res!713351 (contains!6310 lt!472374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4106 (array!68289 array!68287 (_ BitVec 32) (_ BitVec 32) V!39341 V!39341 (_ BitVec 32) Int) ListLongMap!14333)

(assert (=> b!1069069 (= lt!472374 (getCurrentListMap!4106 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069070 () Bool)

(declare-fun res!713353 () Bool)

(assert (=> b!1069070 (=> (not res!713353) (not e!610058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68289 (_ BitVec 32)) Bool)

(assert (=> b!1069070 (= res!713353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069071 () Bool)

(assert (=> b!1069071 (= e!610059 true)))

(declare-fun -!661 (ListLongMap!14333 (_ BitVec 64)) ListLongMap!14333)

(assert (=> b!1069071 (= (-!661 lt!472374 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472374)))

(declare-fun lt!472372 () Unit!35161)

(declare-fun removeNotPresentStillSame!71 (ListLongMap!14333 (_ BitVec 64)) Unit!35161)

(assert (=> b!1069071 (= lt!472372 (removeNotPresentStillSame!71 lt!472374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069072 () Bool)

(declare-fun e!610055 () Bool)

(assert (=> b!1069072 (= e!610061 (and e!610055 mapRes!40180))))

(declare-fun condMapEmpty!40180 () Bool)

(declare-fun mapDefault!40180 () ValueCell!12124)

