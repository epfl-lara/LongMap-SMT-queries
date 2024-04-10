; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94942 () Bool)

(assert start!94942)

(declare-fun b_free!22147 () Bool)

(declare-fun b_next!22147 () Bool)

(assert (=> start!94942 (= b_free!22147 (not b_next!22147))))

(declare-fun tp!77906 () Bool)

(declare-fun b_and!35001 () Bool)

(assert (=> start!94942 (= tp!77906 b_and!35001)))

(declare-fun b!1073489 () Bool)

(declare-fun res!715972 () Bool)

(declare-fun e!613296 () Bool)

(assert (=> b!1073489 (=> (not res!715972) (not e!613296))))

(declare-datatypes ((array!68875 0))(
  ( (array!68876 (arr!33131 (Array (_ BitVec 32) (_ BitVec 64))) (size!33667 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68875)

(declare-datatypes ((List!23128 0))(
  ( (Nil!23125) (Cons!23124 (h!24333 (_ BitVec 64)) (t!32465 List!23128)) )
))
(declare-fun arrayNoDuplicates!0 (array!68875 (_ BitVec 32) List!23128) Bool)

(assert (=> b!1073489 (= res!715972 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23125))))

(declare-fun b!1073490 () Bool)

(declare-fun res!715971 () Bool)

(assert (=> b!1073490 (=> (not res!715971) (not e!613296))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68875 (_ BitVec 32)) Bool)

(assert (=> b!1073490 (= res!715971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40648 () Bool)

(declare-fun mapRes!40648 () Bool)

(assert (=> mapIsEmpty!40648 mapRes!40648))

(declare-fun b!1073491 () Bool)

(assert (=> b!1073491 (= e!613296 false)))

(declare-datatypes ((V!39745 0))(
  ( (V!39746 (val!13029 Int)) )
))
(declare-fun minValue!907 () V!39745)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12275 0))(
  ( (ValueCellFull!12275 (v!15647 V!39745)) (EmptyCell!12275) )
))
(declare-datatypes ((array!68877 0))(
  ( (array!68878 (arr!33132 (Array (_ BitVec 32) ValueCell!12275)) (size!33668 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68877)

(declare-datatypes ((tuple2!16590 0))(
  ( (tuple2!16591 (_1!8306 (_ BitVec 64)) (_2!8306 V!39745)) )
))
(declare-datatypes ((List!23129 0))(
  ( (Nil!23126) (Cons!23125 (h!24334 tuple2!16590) (t!32466 List!23129)) )
))
(declare-datatypes ((ListLongMap!14559 0))(
  ( (ListLongMap!14560 (toList!7295 List!23129)) )
))
(declare-fun lt!476061 () ListLongMap!14559)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39745)

(declare-fun getCurrentListMapNoExtraKeys!3859 (array!68875 array!68877 (_ BitVec 32) (_ BitVec 32) V!39745 V!39745 (_ BitVec 32) Int) ListLongMap!14559)

(assert (=> b!1073491 (= lt!476061 (getCurrentListMapNoExtraKeys!3859 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39745)

(declare-fun lt!476062 () ListLongMap!14559)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073491 (= lt!476062 (getCurrentListMapNoExtraKeys!3859 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40648 () Bool)

(declare-fun tp!77905 () Bool)

(declare-fun e!613297 () Bool)

(assert (=> mapNonEmpty!40648 (= mapRes!40648 (and tp!77905 e!613297))))

(declare-fun mapValue!40648 () ValueCell!12275)

(declare-fun mapKey!40648 () (_ BitVec 32))

(declare-fun mapRest!40648 () (Array (_ BitVec 32) ValueCell!12275))

(assert (=> mapNonEmpty!40648 (= (arr!33132 _values!955) (store mapRest!40648 mapKey!40648 mapValue!40648))))

(declare-fun b!1073492 () Bool)

(declare-fun res!715970 () Bool)

(assert (=> b!1073492 (=> (not res!715970) (not e!613296))))

(assert (=> b!1073492 (= res!715970 (and (= (size!33668 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33667 _keys!1163) (size!33668 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073493 () Bool)

(declare-fun tp_is_empty!25957 () Bool)

(assert (=> b!1073493 (= e!613297 tp_is_empty!25957)))

(declare-fun b!1073495 () Bool)

(declare-fun e!613298 () Bool)

(assert (=> b!1073495 (= e!613298 tp_is_empty!25957)))

(declare-fun res!715969 () Bool)

(assert (=> start!94942 (=> (not res!715969) (not e!613296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94942 (= res!715969 (validMask!0 mask!1515))))

(assert (=> start!94942 e!613296))

(assert (=> start!94942 true))

(assert (=> start!94942 tp_is_empty!25957))

(declare-fun e!613294 () Bool)

(declare-fun array_inv!25606 (array!68877) Bool)

(assert (=> start!94942 (and (array_inv!25606 _values!955) e!613294)))

(assert (=> start!94942 tp!77906))

(declare-fun array_inv!25607 (array!68875) Bool)

(assert (=> start!94942 (array_inv!25607 _keys!1163)))

(declare-fun b!1073494 () Bool)

(assert (=> b!1073494 (= e!613294 (and e!613298 mapRes!40648))))

(declare-fun condMapEmpty!40648 () Bool)

(declare-fun mapDefault!40648 () ValueCell!12275)

