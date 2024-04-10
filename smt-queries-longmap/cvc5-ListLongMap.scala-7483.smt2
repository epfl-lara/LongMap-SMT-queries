; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94846 () Bool)

(assert start!94846)

(declare-fun b_free!22075 () Bool)

(declare-fun b_next!22075 () Bool)

(assert (=> start!94846 (= b_free!22075 (not b_next!22075))))

(declare-fun tp!77686 () Bool)

(declare-fun b_and!34917 () Bool)

(assert (=> start!94846 (= tp!77686 b_and!34917)))

(declare-fun b!1072509 () Bool)

(declare-fun e!612599 () Bool)

(declare-datatypes ((V!39649 0))(
  ( (V!39650 (val!12993 Int)) )
))
(declare-datatypes ((tuple2!16548 0))(
  ( (tuple2!16549 (_1!8285 (_ BitVec 64)) (_2!8285 V!39649)) )
))
(declare-datatypes ((List!23082 0))(
  ( (Nil!23079) (Cons!23078 (h!24287 tuple2!16548) (t!32417 List!23082)) )
))
(declare-datatypes ((ListLongMap!14517 0))(
  ( (ListLongMap!14518 (toList!7274 List!23082)) )
))
(declare-fun lt!475508 () ListLongMap!14517)

(declare-fun lt!475503 () ListLongMap!14517)

(declare-fun lt!475511 () tuple2!16548)

(declare-fun +!3208 (ListLongMap!14517 tuple2!16548) ListLongMap!14517)

(assert (=> b!1072509 (= e!612599 (= lt!475508 (+!3208 lt!475503 lt!475511)))))

(declare-fun b!1072510 () Bool)

(declare-fun e!612601 () Bool)

(declare-fun e!612605 () Bool)

(assert (=> b!1072510 (= e!612601 (not e!612605))))

(declare-fun res!715416 () Bool)

(assert (=> b!1072510 (=> res!715416 e!612605)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072510 (= res!715416 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!475504 () ListLongMap!14517)

(assert (=> b!1072510 (= lt!475504 lt!475503)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39649)

(declare-datatypes ((Unit!35342 0))(
  ( (Unit!35343) )
))
(declare-fun lt!475510 () Unit!35342)

(declare-datatypes ((ValueCell!12239 0))(
  ( (ValueCellFull!12239 (v!15610 V!39649)) (EmptyCell!12239) )
))
(declare-datatypes ((array!68737 0))(
  ( (array!68738 (arr!33063 (Array (_ BitVec 32) ValueCell!12239)) (size!33599 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68737)

(declare-fun minValue!907 () V!39649)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39649)

(declare-datatypes ((array!68739 0))(
  ( (array!68740 (arr!33064 (Array (_ BitVec 32) (_ BitVec 64))) (size!33600 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68739)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!875 (array!68739 array!68737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39649 V!39649 V!39649 V!39649 (_ BitVec 32) Int) Unit!35342)

(assert (=> b!1072510 (= lt!475510 (lemmaNoChangeToArrayThenSameMapNoExtras!875 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3838 (array!68739 array!68737 (_ BitVec 32) (_ BitVec 32) V!39649 V!39649 (_ BitVec 32) Int) ListLongMap!14517)

(assert (=> b!1072510 (= lt!475503 (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072510 (= lt!475504 (getCurrentListMapNoExtraKeys!3838 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072511 () Bool)

(assert (=> b!1072511 (= e!612605 true)))

(declare-fun lt!475515 () ListLongMap!14517)

(declare-fun lt!475513 () ListLongMap!14517)

(declare-fun -!702 (ListLongMap!14517 (_ BitVec 64)) ListLongMap!14517)

(assert (=> b!1072511 (= lt!475515 (-!702 lt!475513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475514 () ListLongMap!14517)

(declare-fun lt!475506 () ListLongMap!14517)

(assert (=> b!1072511 (= lt!475514 lt!475506)))

(declare-fun lt!475509 () Unit!35342)

(declare-fun addCommutativeForDiffKeys!747 (ListLongMap!14517 (_ BitVec 64) V!39649 (_ BitVec 64) V!39649) Unit!35342)

(assert (=> b!1072511 (= lt!475509 (addCommutativeForDiffKeys!747 lt!475504 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475512 () ListLongMap!14517)

(assert (=> b!1072511 (= (-!702 lt!475506 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475512)))

(declare-fun lt!475507 () tuple2!16548)

(assert (=> b!1072511 (= lt!475506 (+!3208 lt!475512 lt!475507))))

(declare-fun lt!475505 () Unit!35342)

(declare-fun addThenRemoveForNewKeyIsSame!72 (ListLongMap!14517 (_ BitVec 64) V!39649) Unit!35342)

(assert (=> b!1072511 (= lt!475505 (addThenRemoveForNewKeyIsSame!72 lt!475512 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072511 (= lt!475512 (+!3208 lt!475504 lt!475511))))

(assert (=> b!1072511 e!612599))

(declare-fun res!715418 () Bool)

(assert (=> b!1072511 (=> (not res!715418) (not e!612599))))

(assert (=> b!1072511 (= res!715418 (= lt!475513 lt!475514))))

(assert (=> b!1072511 (= lt!475514 (+!3208 (+!3208 lt!475504 lt!475507) lt!475511))))

(assert (=> b!1072511 (= lt!475511 (tuple2!16549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072511 (= lt!475507 (tuple2!16549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4168 (array!68739 array!68737 (_ BitVec 32) (_ BitVec 32) V!39649 V!39649 (_ BitVec 32) Int) ListLongMap!14517)

(assert (=> b!1072511 (= lt!475508 (getCurrentListMap!4168 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072511 (= lt!475513 (getCurrentListMap!4168 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40537 () Bool)

(declare-fun mapRes!40537 () Bool)

(declare-fun tp!77687 () Bool)

(declare-fun e!612602 () Bool)

(assert (=> mapNonEmpty!40537 (= mapRes!40537 (and tp!77687 e!612602))))

(declare-fun mapRest!40537 () (Array (_ BitVec 32) ValueCell!12239))

(declare-fun mapValue!40537 () ValueCell!12239)

(declare-fun mapKey!40537 () (_ BitVec 32))

(assert (=> mapNonEmpty!40537 (= (arr!33063 _values!955) (store mapRest!40537 mapKey!40537 mapValue!40537))))

(declare-fun b!1072512 () Bool)

(declare-fun res!715419 () Bool)

(assert (=> b!1072512 (=> (not res!715419) (not e!612601))))

(declare-datatypes ((List!23083 0))(
  ( (Nil!23080) (Cons!23079 (h!24288 (_ BitVec 64)) (t!32418 List!23083)) )
))
(declare-fun arrayNoDuplicates!0 (array!68739 (_ BitVec 32) List!23083) Bool)

(assert (=> b!1072512 (= res!715419 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23080))))

(declare-fun b!1072513 () Bool)

(declare-fun e!612600 () Bool)

(declare-fun tp_is_empty!25885 () Bool)

(assert (=> b!1072513 (= e!612600 tp_is_empty!25885)))

(declare-fun b!1072515 () Bool)

(declare-fun e!612604 () Bool)

(assert (=> b!1072515 (= e!612604 (and e!612600 mapRes!40537))))

(declare-fun condMapEmpty!40537 () Bool)

(declare-fun mapDefault!40537 () ValueCell!12239)

