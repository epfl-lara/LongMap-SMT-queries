; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94778 () Bool)

(assert start!94778)

(declare-fun b_free!22031 () Bool)

(declare-fun b_next!22031 () Bool)

(assert (=> start!94778 (= b_free!22031 (not b_next!22031))))

(declare-fun tp!77552 () Bool)

(declare-fun b_and!34861 () Bool)

(assert (=> start!94778 (= tp!77552 b_and!34861)))

(declare-fun mapNonEmpty!40468 () Bool)

(declare-fun mapRes!40468 () Bool)

(declare-fun tp!77551 () Bool)

(declare-fun e!612029 () Bool)

(assert (=> mapNonEmpty!40468 (= mapRes!40468 (and tp!77551 e!612029))))

(declare-datatypes ((V!39589 0))(
  ( (V!39590 (val!12971 Int)) )
))
(declare-datatypes ((ValueCell!12217 0))(
  ( (ValueCellFull!12217 (v!15587 V!39589)) (EmptyCell!12217) )
))
(declare-fun mapRest!40468 () (Array (_ BitVec 32) ValueCell!12217))

(declare-fun mapValue!40468 () ValueCell!12217)

(declare-datatypes ((array!68653 0))(
  ( (array!68654 (arr!33022 (Array (_ BitVec 32) ValueCell!12217)) (size!33558 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68653)

(declare-fun mapKey!40468 () (_ BitVec 32))

(assert (=> mapNonEmpty!40468 (= (arr!33022 _values!955) (store mapRest!40468 mapKey!40468 mapValue!40468))))

(declare-fun b!1071731 () Bool)

(declare-fun res!714942 () Bool)

(declare-fun e!612025 () Bool)

(assert (=> b!1071731 (=> (not res!714942) (not e!612025))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68655 0))(
  ( (array!68656 (arr!33023 (Array (_ BitVec 32) (_ BitVec 64))) (size!33559 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68655)

(assert (=> b!1071731 (= res!714942 (and (= (size!33558 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33559 _keys!1163) (size!33558 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071732 () Bool)

(declare-fun res!714940 () Bool)

(assert (=> b!1071732 (=> (not res!714940) (not e!612025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68655 (_ BitVec 32)) Bool)

(assert (=> b!1071732 (= res!714940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!714943 () Bool)

(assert (=> start!94778 (=> (not res!714943) (not e!612025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94778 (= res!714943 (validMask!0 mask!1515))))

(assert (=> start!94778 e!612025))

(assert (=> start!94778 true))

(declare-fun tp_is_empty!25841 () Bool)

(assert (=> start!94778 tp_is_empty!25841))

(declare-fun e!612026 () Bool)

(declare-fun array_inv!25532 (array!68653) Bool)

(assert (=> start!94778 (and (array_inv!25532 _values!955) e!612026)))

(assert (=> start!94778 tp!77552))

(declare-fun array_inv!25533 (array!68655) Bool)

(assert (=> start!94778 (array_inv!25533 _keys!1163)))

(declare-fun b!1071733 () Bool)

(declare-fun e!612023 () Bool)

(declare-fun e!612024 () Bool)

(assert (=> b!1071733 (= e!612023 e!612024)))

(declare-fun res!714937 () Bool)

(assert (=> b!1071733 (=> res!714937 e!612024)))

(declare-datatypes ((tuple2!16516 0))(
  ( (tuple2!16517 (_1!8269 (_ BitVec 64)) (_2!8269 V!39589)) )
))
(declare-datatypes ((List!23052 0))(
  ( (Nil!23049) (Cons!23048 (h!24257 tuple2!16516) (t!32385 List!23052)) )
))
(declare-datatypes ((ListLongMap!14485 0))(
  ( (ListLongMap!14486 (toList!7258 List!23052)) )
))
(declare-fun lt!474483 () ListLongMap!14485)

(declare-fun lt!474486 () ListLongMap!14485)

(declare-fun -!689 (ListLongMap!14485 (_ BitVec 64)) ListLongMap!14485)

(assert (=> b!1071733 (= res!714937 (not (= (-!689 lt!474483 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474486)))))

(declare-fun lt!474484 () ListLongMap!14485)

(declare-fun lt!474481 () ListLongMap!14485)

(assert (=> b!1071733 (= lt!474484 lt!474481)))

(declare-fun zeroValueBefore!47 () V!39589)

(declare-datatypes ((Unit!35310 0))(
  ( (Unit!35311) )
))
(declare-fun lt!474491 () Unit!35310)

(declare-fun lt!474482 () ListLongMap!14485)

(declare-fun minValue!907 () V!39589)

(declare-fun addCommutativeForDiffKeys!734 (ListLongMap!14485 (_ BitVec 64) V!39589 (_ BitVec 64) V!39589) Unit!35310)

(assert (=> b!1071733 (= lt!474491 (addCommutativeForDiffKeys!734 lt!474482 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474487 () ListLongMap!14485)

(assert (=> b!1071733 (= (-!689 lt!474481 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474487)))

(declare-fun lt!474490 () tuple2!16516)

(declare-fun +!3193 (ListLongMap!14485 tuple2!16516) ListLongMap!14485)

(assert (=> b!1071733 (= lt!474481 (+!3193 lt!474487 lt!474490))))

(declare-fun lt!474480 () Unit!35310)

(declare-fun addThenRemoveForNewKeyIsSame!59 (ListLongMap!14485 (_ BitVec 64) V!39589) Unit!35310)

(assert (=> b!1071733 (= lt!474480 (addThenRemoveForNewKeyIsSame!59 lt!474487 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474485 () tuple2!16516)

(assert (=> b!1071733 (= lt!474487 (+!3193 lt!474482 lt!474485))))

(declare-fun e!612027 () Bool)

(assert (=> b!1071733 e!612027))

(declare-fun res!714938 () Bool)

(assert (=> b!1071733 (=> (not res!714938) (not e!612027))))

(assert (=> b!1071733 (= res!714938 (= lt!474483 lt!474484))))

(assert (=> b!1071733 (= lt!474484 (+!3193 (+!3193 lt!474482 lt!474490) lt!474485))))

(assert (=> b!1071733 (= lt!474485 (tuple2!16517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071733 (= lt!474490 (tuple2!16517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39589)

(declare-fun getCurrentListMap!4155 (array!68655 array!68653 (_ BitVec 32) (_ BitVec 32) V!39589 V!39589 (_ BitVec 32) Int) ListLongMap!14485)

(assert (=> b!1071733 (= lt!474486 (getCurrentListMap!4155 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071733 (= lt!474483 (getCurrentListMap!4155 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071734 () Bool)

(assert (=> b!1071734 (= e!612025 (not e!612023))))

(declare-fun res!714939 () Bool)

(assert (=> b!1071734 (=> res!714939 e!612023)))

(assert (=> b!1071734 (= res!714939 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!474489 () ListLongMap!14485)

(assert (=> b!1071734 (= lt!474482 lt!474489)))

(declare-fun lt!474488 () Unit!35310)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!862 (array!68655 array!68653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39589 V!39589 V!39589 V!39589 (_ BitVec 32) Int) Unit!35310)

(assert (=> b!1071734 (= lt!474488 (lemmaNoChangeToArrayThenSameMapNoExtras!862 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3825 (array!68655 array!68653 (_ BitVec 32) (_ BitVec 32) V!39589 V!39589 (_ BitVec 32) Int) ListLongMap!14485)

(assert (=> b!1071734 (= lt!474489 (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071734 (= lt!474482 (getCurrentListMapNoExtraKeys!3825 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071735 () Bool)

(assert (=> b!1071735 (= e!612027 (= lt!474486 (+!3193 lt!474489 lt!474485)))))

(declare-fun b!1071736 () Bool)

(declare-fun e!612022 () Bool)

(assert (=> b!1071736 (= e!612026 (and e!612022 mapRes!40468))))

(declare-fun condMapEmpty!40468 () Bool)

(declare-fun mapDefault!40468 () ValueCell!12217)

