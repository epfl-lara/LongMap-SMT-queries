; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94906 () Bool)

(assert start!94906)

(declare-fun b_free!22111 () Bool)

(declare-fun b_next!22111 () Bool)

(assert (=> start!94906 (= b_free!22111 (not b_next!22111))))

(declare-fun tp!77797 () Bool)

(declare-fun b_and!34965 () Bool)

(assert (=> start!94906 (= tp!77797 b_and!34965)))

(declare-fun res!715755 () Bool)

(declare-fun e!613027 () Bool)

(assert (=> start!94906 (=> (not res!715755) (not e!613027))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94906 (= res!715755 (validMask!0 mask!1515))))

(assert (=> start!94906 e!613027))

(assert (=> start!94906 true))

(declare-fun tp_is_empty!25921 () Bool)

(assert (=> start!94906 tp_is_empty!25921))

(declare-datatypes ((V!39697 0))(
  ( (V!39698 (val!13011 Int)) )
))
(declare-datatypes ((ValueCell!12257 0))(
  ( (ValueCellFull!12257 (v!15629 V!39697)) (EmptyCell!12257) )
))
(declare-datatypes ((array!68805 0))(
  ( (array!68806 (arr!33096 (Array (_ BitVec 32) ValueCell!12257)) (size!33632 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68805)

(declare-fun e!613026 () Bool)

(declare-fun array_inv!25584 (array!68805) Bool)

(assert (=> start!94906 (and (array_inv!25584 _values!955) e!613026)))

(assert (=> start!94906 tp!77797))

(declare-datatypes ((array!68807 0))(
  ( (array!68808 (arr!33097 (Array (_ BitVec 32) (_ BitVec 64))) (size!33633 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68807)

(declare-fun array_inv!25585 (array!68807) Bool)

(assert (=> start!94906 (array_inv!25585 _keys!1163)))

(declare-fun b!1073111 () Bool)

(declare-fun e!613028 () Bool)

(assert (=> b!1073111 (= e!613028 tp_is_empty!25921)))

(declare-fun b!1073112 () Bool)

(declare-fun res!715756 () Bool)

(assert (=> b!1073112 (=> (not res!715756) (not e!613027))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073112 (= res!715756 (and (= (size!33632 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33633 _keys!1163) (size!33632 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073113 () Bool)

(declare-fun e!613024 () Bool)

(assert (=> b!1073113 (= e!613024 tp_is_empty!25921)))

(declare-fun mapNonEmpty!40594 () Bool)

(declare-fun mapRes!40594 () Bool)

(declare-fun tp!77798 () Bool)

(assert (=> mapNonEmpty!40594 (= mapRes!40594 (and tp!77798 e!613024))))

(declare-fun mapValue!40594 () ValueCell!12257)

(declare-fun mapKey!40594 () (_ BitVec 32))

(declare-fun mapRest!40594 () (Array (_ BitVec 32) ValueCell!12257))

(assert (=> mapNonEmpty!40594 (= (arr!33096 _values!955) (store mapRest!40594 mapKey!40594 mapValue!40594))))

(declare-fun mapIsEmpty!40594 () Bool)

(assert (=> mapIsEmpty!40594 mapRes!40594))

(declare-fun b!1073114 () Bool)

(declare-fun res!715754 () Bool)

(assert (=> b!1073114 (=> (not res!715754) (not e!613027))))

(declare-datatypes ((List!23104 0))(
  ( (Nil!23101) (Cons!23100 (h!24309 (_ BitVec 64)) (t!32441 List!23104)) )
))
(declare-fun arrayNoDuplicates!0 (array!68807 (_ BitVec 32) List!23104) Bool)

(assert (=> b!1073114 (= res!715754 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23101))))

(declare-fun b!1073115 () Bool)

(assert (=> b!1073115 (= e!613026 (and e!613028 mapRes!40594))))

(declare-fun condMapEmpty!40594 () Bool)

(declare-fun mapDefault!40594 () ValueCell!12257)

