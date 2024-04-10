; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94952 () Bool)

(assert start!94952)

(declare-fun b_free!22157 () Bool)

(declare-fun b_next!22157 () Bool)

(assert (=> start!94952 (= b_free!22157 (not b_next!22157))))

(declare-fun tp!77935 () Bool)

(declare-fun b_and!35011 () Bool)

(assert (=> start!94952 (= tp!77935 b_and!35011)))

(declare-fun mapNonEmpty!40663 () Bool)

(declare-fun mapRes!40663 () Bool)

(declare-fun tp!77936 () Bool)

(declare-fun e!613369 () Bool)

(assert (=> mapNonEmpty!40663 (= mapRes!40663 (and tp!77936 e!613369))))

(declare-fun mapKey!40663 () (_ BitVec 32))

(declare-datatypes ((V!39757 0))(
  ( (V!39758 (val!13034 Int)) )
))
(declare-datatypes ((ValueCell!12280 0))(
  ( (ValueCellFull!12280 (v!15652 V!39757)) (EmptyCell!12280) )
))
(declare-fun mapRest!40663 () (Array (_ BitVec 32) ValueCell!12280))

(declare-datatypes ((array!68895 0))(
  ( (array!68896 (arr!33141 (Array (_ BitVec 32) ValueCell!12280)) (size!33677 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68895)

(declare-fun mapValue!40663 () ValueCell!12280)

(assert (=> mapNonEmpty!40663 (= (arr!33141 _values!955) (store mapRest!40663 mapKey!40663 mapValue!40663))))

(declare-fun b!1073594 () Bool)

(declare-fun res!716031 () Bool)

(declare-fun e!613371 () Bool)

(assert (=> b!1073594 (=> (not res!716031) (not e!613371))))

(declare-datatypes ((array!68897 0))(
  ( (array!68898 (arr!33142 (Array (_ BitVec 32) (_ BitVec 64))) (size!33678 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68897)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68897 (_ BitVec 32)) Bool)

(assert (=> b!1073594 (= res!716031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40663 () Bool)

(assert (=> mapIsEmpty!40663 mapRes!40663))

(declare-fun b!1073595 () Bool)

(declare-fun tp_is_empty!25967 () Bool)

(assert (=> b!1073595 (= e!613369 tp_is_empty!25967)))

(declare-fun b!1073596 () Bool)

(assert (=> b!1073596 (= e!613371 (bvsgt #b00000000000000000000000000000000 (size!33678 _keys!1163)))))

(declare-datatypes ((tuple2!16598 0))(
  ( (tuple2!16599 (_1!8310 (_ BitVec 64)) (_2!8310 V!39757)) )
))
(declare-datatypes ((List!23136 0))(
  ( (Nil!23133) (Cons!23132 (h!24341 tuple2!16598) (t!32473 List!23136)) )
))
(declare-datatypes ((ListLongMap!14567 0))(
  ( (ListLongMap!14568 (toList!7299 List!23136)) )
))
(declare-fun lt!476091 () ListLongMap!14567)

(declare-fun minValue!907 () V!39757)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39757)

(declare-fun getCurrentListMapNoExtraKeys!3863 (array!68897 array!68895 (_ BitVec 32) (_ BitVec 32) V!39757 V!39757 (_ BitVec 32) Int) ListLongMap!14567)

(assert (=> b!1073596 (= lt!476091 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39757)

(declare-fun lt!476092 () ListLongMap!14567)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073596 (= lt!476092 (getCurrentListMapNoExtraKeys!3863 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!716029 () Bool)

(assert (=> start!94952 (=> (not res!716029) (not e!613371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94952 (= res!716029 (validMask!0 mask!1515))))

(assert (=> start!94952 e!613371))

(assert (=> start!94952 true))

(assert (=> start!94952 tp_is_empty!25967))

(declare-fun e!613373 () Bool)

(declare-fun array_inv!25614 (array!68895) Bool)

(assert (=> start!94952 (and (array_inv!25614 _values!955) e!613373)))

(assert (=> start!94952 tp!77935))

(declare-fun array_inv!25615 (array!68897) Bool)

(assert (=> start!94952 (array_inv!25615 _keys!1163)))

(declare-fun b!1073597 () Bool)

(declare-fun e!613370 () Bool)

(assert (=> b!1073597 (= e!613370 tp_is_empty!25967)))

(declare-fun b!1073598 () Bool)

(declare-fun res!716030 () Bool)

(assert (=> b!1073598 (=> (not res!716030) (not e!613371))))

(assert (=> b!1073598 (= res!716030 (and (= (size!33677 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33678 _keys!1163) (size!33677 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073599 () Bool)

(declare-fun res!716032 () Bool)

(assert (=> b!1073599 (=> (not res!716032) (not e!613371))))

(declare-datatypes ((List!23137 0))(
  ( (Nil!23134) (Cons!23133 (h!24342 (_ BitVec 64)) (t!32474 List!23137)) )
))
(declare-fun arrayNoDuplicates!0 (array!68897 (_ BitVec 32) List!23137) Bool)

(assert (=> b!1073599 (= res!716032 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23134))))

(declare-fun b!1073600 () Bool)

(assert (=> b!1073600 (= e!613373 (and e!613370 mapRes!40663))))

(declare-fun condMapEmpty!40663 () Bool)

(declare-fun mapDefault!40663 () ValueCell!12280)

