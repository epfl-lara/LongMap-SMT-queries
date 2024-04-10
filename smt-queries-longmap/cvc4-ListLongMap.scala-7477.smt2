; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94814 () Bool)

(assert start!94814)

(declare-fun b_free!22043 () Bool)

(declare-fun b_next!22043 () Bool)

(assert (=> start!94814 (= b_free!22043 (not b_next!22043))))

(declare-fun tp!77591 () Bool)

(declare-fun b_and!34885 () Bool)

(assert (=> start!94814 (= tp!77591 b_and!34885)))

(declare-fun mapIsEmpty!40489 () Bool)

(declare-fun mapRes!40489 () Bool)

(assert (=> mapIsEmpty!40489 mapRes!40489))

(declare-fun b!1072077 () Bool)

(declare-fun e!612268 () Bool)

(declare-fun tp_is_empty!25853 () Bool)

(assert (=> b!1072077 (= e!612268 tp_is_empty!25853)))

(declare-fun res!715131 () Bool)

(declare-fun e!612264 () Bool)

(assert (=> start!94814 (=> (not res!715131) (not e!612264))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94814 (= res!715131 (validMask!0 mask!1515))))

(assert (=> start!94814 e!612264))

(assert (=> start!94814 true))

(assert (=> start!94814 tp_is_empty!25853))

(declare-datatypes ((V!39605 0))(
  ( (V!39606 (val!12977 Int)) )
))
(declare-datatypes ((ValueCell!12223 0))(
  ( (ValueCellFull!12223 (v!15594 V!39605)) (EmptyCell!12223) )
))
(declare-datatypes ((array!68677 0))(
  ( (array!68678 (arr!33033 (Array (_ BitVec 32) ValueCell!12223)) (size!33569 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68677)

(declare-fun e!612267 () Bool)

(declare-fun array_inv!25538 (array!68677) Bool)

(assert (=> start!94814 (and (array_inv!25538 _values!955) e!612267)))

(assert (=> start!94814 tp!77591))

(declare-datatypes ((array!68679 0))(
  ( (array!68680 (arr!33034 (Array (_ BitVec 32) (_ BitVec 64))) (size!33570 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68679)

(declare-fun array_inv!25539 (array!68679) Bool)

(assert (=> start!94814 (array_inv!25539 _keys!1163)))

(declare-fun b!1072078 () Bool)

(declare-fun res!715129 () Bool)

(assert (=> b!1072078 (=> (not res!715129) (not e!612264))))

(declare-datatypes ((List!23059 0))(
  ( (Nil!23056) (Cons!23055 (h!24264 (_ BitVec 64)) (t!32394 List!23059)) )
))
(declare-fun arrayNoDuplicates!0 (array!68679 (_ BitVec 32) List!23059) Bool)

(assert (=> b!1072078 (= res!715129 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23056))))

(declare-fun b!1072079 () Bool)

(declare-fun e!612263 () Bool)

(assert (=> b!1072079 (= e!612263 tp_is_empty!25853)))

(declare-fun b!1072080 () Bool)

(declare-fun e!612265 () Bool)

(assert (=> b!1072080 (= e!612264 (not e!612265))))

(declare-fun res!715130 () Bool)

(assert (=> b!1072080 (=> res!715130 e!612265)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072080 (= res!715130 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16524 0))(
  ( (tuple2!16525 (_1!8273 (_ BitVec 64)) (_2!8273 V!39605)) )
))
(declare-datatypes ((List!23060 0))(
  ( (Nil!23057) (Cons!23056 (h!24265 tuple2!16524) (t!32395 List!23060)) )
))
(declare-datatypes ((ListLongMap!14493 0))(
  ( (ListLongMap!14494 (toList!7262 List!23060)) )
))
(declare-fun lt!474889 () ListLongMap!14493)

(declare-fun lt!474886 () ListLongMap!14493)

(assert (=> b!1072080 (= lt!474889 lt!474886)))

(declare-fun zeroValueBefore!47 () V!39605)

(declare-fun minValue!907 () V!39605)

(declare-datatypes ((Unit!35320 0))(
  ( (Unit!35321) )
))
(declare-fun lt!474879 () Unit!35320)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39605)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!865 (array!68679 array!68677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39605 V!39605 V!39605 V!39605 (_ BitVec 32) Int) Unit!35320)

(assert (=> b!1072080 (= lt!474879 (lemmaNoChangeToArrayThenSameMapNoExtras!865 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3828 (array!68679 array!68677 (_ BitVec 32) (_ BitVec 32) V!39605 V!39605 (_ BitVec 32) Int) ListLongMap!14493)

(assert (=> b!1072080 (= lt!474886 (getCurrentListMapNoExtraKeys!3828 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072080 (= lt!474889 (getCurrentListMapNoExtraKeys!3828 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072081 () Bool)

(declare-fun res!715127 () Bool)

(assert (=> b!1072081 (=> (not res!715127) (not e!612264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68679 (_ BitVec 32)) Bool)

(assert (=> b!1072081 (= res!715127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072082 () Bool)

(declare-fun res!715132 () Bool)

(assert (=> b!1072082 (=> (not res!715132) (not e!612264))))

(assert (=> b!1072082 (= res!715132 (and (= (size!33569 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33570 _keys!1163) (size!33569 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072083 () Bool)

(assert (=> b!1072083 (= e!612267 (and e!612268 mapRes!40489))))

(declare-fun condMapEmpty!40489 () Bool)

(declare-fun mapDefault!40489 () ValueCell!12223)

