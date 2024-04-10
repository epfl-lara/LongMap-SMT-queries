; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94810 () Bool)

(assert start!94810)

(declare-fun b_free!22039 () Bool)

(declare-fun b_next!22039 () Bool)

(assert (=> start!94810 (= b_free!22039 (not b_next!22039))))

(declare-fun tp!77579 () Bool)

(declare-fun b_and!34881 () Bool)

(assert (=> start!94810 (= tp!77579 b_and!34881)))

(declare-fun mapNonEmpty!40483 () Bool)

(declare-fun mapRes!40483 () Bool)

(declare-fun tp!77578 () Bool)

(declare-fun e!612227 () Bool)

(assert (=> mapNonEmpty!40483 (= mapRes!40483 (and tp!77578 e!612227))))

(declare-datatypes ((V!39601 0))(
  ( (V!39602 (val!12975 Int)) )
))
(declare-datatypes ((ValueCell!12221 0))(
  ( (ValueCellFull!12221 (v!15592 V!39601)) (EmptyCell!12221) )
))
(declare-fun mapRest!40483 () (Array (_ BitVec 32) ValueCell!12221))

(declare-fun mapValue!40483 () ValueCell!12221)

(declare-datatypes ((array!68669 0))(
  ( (array!68670 (arr!33029 (Array (_ BitVec 32) ValueCell!12221)) (size!33565 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68669)

(declare-fun mapKey!40483 () (_ BitVec 32))

(assert (=> mapNonEmpty!40483 (= (arr!33029 _values!955) (store mapRest!40483 mapKey!40483 mapValue!40483))))

(declare-fun b!1072023 () Bool)

(declare-fun e!612226 () Bool)

(declare-fun tp_is_empty!25849 () Bool)

(assert (=> b!1072023 (= e!612226 tp_is_empty!25849)))

(declare-datatypes ((tuple2!16520 0))(
  ( (tuple2!16521 (_1!8271 (_ BitVec 64)) (_2!8271 V!39601)) )
))
(declare-datatypes ((List!23055 0))(
  ( (Nil!23052) (Cons!23051 (h!24260 tuple2!16520) (t!32390 List!23055)) )
))
(declare-datatypes ((ListLongMap!14489 0))(
  ( (ListLongMap!14490 (toList!7260 List!23055)) )
))
(declare-fun lt!474813 () ListLongMap!14489)

(declare-fun e!612223 () Bool)

(declare-fun b!1072024 () Bool)

(declare-fun lt!474812 () tuple2!16520)

(declare-fun lt!474805 () ListLongMap!14489)

(declare-fun +!3195 (ListLongMap!14489 tuple2!16520) ListLongMap!14489)

(assert (=> b!1072024 (= e!612223 (= lt!474805 (+!3195 lt!474813 lt!474812)))))

(declare-fun b!1072025 () Bool)

(declare-fun res!715093 () Bool)

(declare-fun e!612221 () Bool)

(assert (=> b!1072025 (=> (not res!715093) (not e!612221))))

(declare-datatypes ((array!68671 0))(
  ( (array!68672 (arr!33030 (Array (_ BitVec 32) (_ BitVec 64))) (size!33566 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68671)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68671 (_ BitVec 32)) Bool)

(assert (=> b!1072025 (= res!715093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072026 () Bool)

(declare-fun res!715091 () Bool)

(assert (=> b!1072026 (=> (not res!715091) (not e!612221))))

(declare-datatypes ((List!23056 0))(
  ( (Nil!23053) (Cons!23052 (h!24261 (_ BitVec 64)) (t!32391 List!23056)) )
))
(declare-fun arrayNoDuplicates!0 (array!68671 (_ BitVec 32) List!23056) Bool)

(assert (=> b!1072026 (= res!715091 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23053))))

(declare-fun mapIsEmpty!40483 () Bool)

(assert (=> mapIsEmpty!40483 mapRes!40483))

(declare-fun b!1072027 () Bool)

(declare-fun e!612224 () Bool)

(assert (=> b!1072027 (= e!612224 true)))

(declare-fun lt!474801 () ListLongMap!14489)

(declare-fun lt!474810 () ListLongMap!14489)

(declare-fun -!691 (ListLongMap!14489 (_ BitVec 64)) ListLongMap!14489)

(assert (=> b!1072027 (= lt!474801 (-!691 lt!474810 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474808 () ListLongMap!14489)

(declare-fun lt!474804 () ListLongMap!14489)

(assert (=> b!1072027 (= lt!474808 lt!474804)))

(declare-fun zeroValueBefore!47 () V!39601)

(declare-fun lt!474809 () ListLongMap!14489)

(declare-datatypes ((Unit!35316 0))(
  ( (Unit!35317) )
))
(declare-fun lt!474803 () Unit!35316)

(declare-fun minValue!907 () V!39601)

(declare-fun addCommutativeForDiffKeys!736 (ListLongMap!14489 (_ BitVec 64) V!39601 (_ BitVec 64) V!39601) Unit!35316)

(assert (=> b!1072027 (= lt!474803 (addCommutativeForDiffKeys!736 lt!474809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474806 () ListLongMap!14489)

(assert (=> b!1072027 (= (-!691 lt!474804 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474806)))

(declare-fun lt!474811 () tuple2!16520)

(assert (=> b!1072027 (= lt!474804 (+!3195 lt!474806 lt!474811))))

(declare-fun lt!474807 () Unit!35316)

(declare-fun addThenRemoveForNewKeyIsSame!61 (ListLongMap!14489 (_ BitVec 64) V!39601) Unit!35316)

(assert (=> b!1072027 (= lt!474807 (addThenRemoveForNewKeyIsSame!61 lt!474806 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072027 (= lt!474806 (+!3195 lt!474809 lt!474812))))

(assert (=> b!1072027 e!612223))

(declare-fun res!715092 () Bool)

(assert (=> b!1072027 (=> (not res!715092) (not e!612223))))

(assert (=> b!1072027 (= res!715092 (= lt!474810 lt!474808))))

(assert (=> b!1072027 (= lt!474808 (+!3195 (+!3195 lt!474809 lt!474811) lt!474812))))

(assert (=> b!1072027 (= lt!474812 (tuple2!16521 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072027 (= lt!474811 (tuple2!16521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39601)

(declare-fun getCurrentListMap!4157 (array!68671 array!68669 (_ BitVec 32) (_ BitVec 32) V!39601 V!39601 (_ BitVec 32) Int) ListLongMap!14489)

(assert (=> b!1072027 (= lt!474805 (getCurrentListMap!4157 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072027 (= lt!474810 (getCurrentListMap!4157 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072028 () Bool)

(declare-fun res!715096 () Bool)

(assert (=> b!1072028 (=> (not res!715096) (not e!612221))))

(assert (=> b!1072028 (= res!715096 (and (= (size!33565 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33566 _keys!1163) (size!33565 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072029 () Bool)

(declare-fun e!612225 () Bool)

(assert (=> b!1072029 (= e!612225 (and e!612226 mapRes!40483))))

(declare-fun condMapEmpty!40483 () Bool)

(declare-fun mapDefault!40483 () ValueCell!12221)

